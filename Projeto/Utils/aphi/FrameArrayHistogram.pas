{*
FrameArrayHistogram.pas/dfm
----------------------------
Begin: 2005/08/01
Last revision: $Date: 2013-06-27 19:11:22 $ $Author: areeves $
Version number: $Revision: 1.8.6.8 $
Project: APHI Delphi Library for Simulation Modeling
Website: http://www.naadsm.org/opensource/libaphi/
Author: Aaron Reeves <aaron.reeves@naadsm.org>
--------------------------------------------------
Copyright (C) 2005 - 2011 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
--------------------------------------------------
This unit implements a Frame for the graphical display of data as a histogram chart.
The GUI components provide acccess to operations performed by the THistogramData class.
}

(*
  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit FrameArrayHistogram;

{$INCLUDE Defs.inc}

interface

  uses
    Windows,
    Messages,
    SysUtils,
    Variants,
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls,
    REEdit,
    TeEngine,
    Series,
    TeeProcs,
    Chart,
    Buttons,
    ExtCtrls,
    Math,

    MyDelphiArrayUtils,
    HistogramData,

    QVectors,

    ProbDensityFunctions,

		FrameChartBase,

    RegExpDefs
  ;


  type
  {*
    A pointer for a form to syncronize click or other events between components on two frames.
    See FormScenarioComparison.pas for an example of how these are used.
  }
  TPtr = procedure(Sender: TObject) of object;

  type
  /// A pointer type for handling user-defined bin number
  TSetBinNumberPtr = procedure( sender: TComponent; const nBins: integer ) of object;

  type
  /// Frame that encapsulates the resources to display data in a histogram, inherits from TFrameChartBase
  TFrameArrayHistogram = class( TFrameChartBase )
      chtHistogram: TChart;
      serHistogram: TAreaSeries;
      gbxBreaks: TGroupBox;
      rdoSturges: TRadioButton;
      rdoScott: TRadioButton;
      rdoFD: TRadioButton;
      rdoUser: TRadioButton;
      rleHistoBins: TREEdit;
      btnAccept: TBitBtn;
      btnCancel: TBitBtn;
      Panel1: TPanel;
      cbx3DView: TCheckBox;

      procedure rleHistoBinsEnter(Sender: TObject);
      procedure btnAcceptClick(Sender: TObject);
      procedure btnCancelClick(Sender: TObject);
      procedure rleHistoBinsKeyUp( Sender: TObject; var Key: Word; Shift: TShiftState );
      procedure rleHistoBinsClick(Sender: TObject);
      procedure rdoBinNumberClick( Sender: TObject );
      procedure cbx3DViewClick(Sender: TObject);

    protected
      /// enumeration for the method used to calculate the number of histogram bins
      _breakType: THistBreakType;
      /// number of bins (categories) to group the data into
      _nBins: integer;
      /// flag indicating the data are being loaded to populate the chart
      _loading: boolean;
      /// local histogram data object used to set _hist
      _myHistData: THistogramData; // Created de novo on this frame.  Needs to be freed here.
      /// object holding and managing the chart data, not necessarily owned by the frame
      _hist: THistogramData; // Not necessarily owned by the frame.  Don't free it.
      /// the form holding this frame instance
      _myForm: TForm;
      /// flag indicating the user has entered a bin value to be processed
      _lineEditEntered: boolean;

      procedure translateUI();
      procedure translateUIManual();

      procedure populateChart();

      procedure setBinNumberProtected( const breakType: THistBreakType; const nBins: integer; const sender: TObject );

    public
      btnAcceptClickPtr: TPtr;     /// pointer to a component's click event
      btnCancelClickPtr: TPtr;     /// pointer to a component's click event
      rleHistoBinsEnterPtr: TPtr;  /// pointer to a component's click event
      rdoHistoTypeClickPtr: TPtr;  /// pointer to a component's click event
      cbx3DViewClickPtr: TPtr;     /// pointer to a component's click event

      /// method pointer to another TFrameArrayHistogram object so a form can syncronize a break type and bin number among frames
      setBinNumberPtr: TSetBinNumberPtr; 

      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

      procedure clear();

      procedure populate( src: TQDoubleVector ); overload;
      procedure populate( src: TQIntegerVector ); overload;
      procedure populate( src: TARDoubleArray ); overload;
      procedure populate( src: TARIntArray ); overload;
      procedure populate( src: THistogramData ); overload;

      procedure setBinNumber( const breakType: THistBreakType; const nBins: integer );

      function createPdf(): TPdfHistogram;

      procedure setTitle( titleStr: string );

      /// Read-only access to _breakType
      property breakType: THistBreakType read _breakType;
    end
  ;


implementation

{$R *.dfm}

  uses
    MyStrUtils,
    DebugWindow,
    MyDialogs,
    I88n
  ;


  const
    DBSHOWMSG: boolean = false; /// Set to true to enable debugging messages for this unit


  /// Creates the object and initializes private members to safe but not necessarily useful values  
  constructor TFrameArrayHistogram.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      btnAcceptClickPtr := nil;
      btnCancelClickPtr := nil;
      rleHistoBinsEnterPtr := nil;
      rdoHistoTypeClickPtr := nil;
      cbx3DViewClickPtr := nil;

      _breakType := Scott;
      _nBins := 50;

      _loading := false;

      if( AOwner is TForm ) then
        _myForm := AOwner as TForm
      else
        _myForm := nil
      ;

      _myHistData := nil;
      _hist := nil;

      setBinNumberPtr := nil;

      rleHistoBins.InputExpression := RE_INTEGER_INPUT;
      _lineEditEntered := false;
    end
  ;

  /// Specifies the captions, hints, and other component text phrases for translation
  procedure TFrameArrayHistogram.translateUI();
    begin
      dbcout( 'FIX ME: Regenerate TFrameArrayHistogram.translateUI()!', true );

      // This function was generated automatically by Caption Collector 0.6.2.
      // Generation date: Thu Feb 28 16:52:53 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/general_purpose_gui/FrameArrayHistogram.dfm
      // File date: Wed Feb 27 08:41:02 2008

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          //lblHistoBins.Caption := tr( 'Number of histogram bins:' );
        end
      ;

      // Set TChart properties
      with self do
        begin
          chtHistogram.BottomAxis.Title.Caption := tr( 'Output value' );
          chtHistogram.LeftAxis.Title.Caption := tr( 'Frequency' );
          chtHistogram.Title.Text.Strings[0] := tr( 'TChart' );
        end
      ;

      // If any phrases are found that could not be automatically extracted by
      // Caption Collector, modify the following function to take care of them.
      // Otherwise, this function will be empty:
      translateUIManual();
    end
  ;

  /// Helper method for translateUI() for phrases Caption Collector can not extract
  procedure TFrameArrayHistogram.translateUIManual();
    begin
    end
  ;

  /// Destroys the object and frees memory
  destructor TFrameArrayHistogram.destroy();
    begin
      // _hist should NOT be freed here
      
      freeAndNil( _myHistData );
      inherited destroy();
    end
  ;

  /// Clears all charted values from the chart
  procedure TFrameArrayHistogram.clear();
    begin
      self.serHistogram.Clear();
    end
  ;


  {*
     Populates the chart from src
     @param a TQDoubleVector array structure holding floating point values
  }
  procedure TFrameArrayHistogram.populate( src: TQDoubleVector );
    begin
      freeAndNil( _myHistData );
      _myHistData := THistogramData.create( src, _breakType, _nBins );
      _hist := _myHistData;
      populateChart();
    end
  ;


  {*
     Populates the chart from src
     @param a TQIntegerVector array structure holding integer values
  }
  procedure TFrameArrayHistogram.populate( src: TQIntegerVector );
    begin
      freeAndNil( _myHistData );
      _myHistData := THistogramData.create( src, _breakType, _nBins );
      _hist := _myHistData;
      populateChart();
    end
  ;


  {*
     Populates the chart from src
     @param a TARDoubleArray array structure holding floating point values
  }
  procedure TFrameArrayHistogram.populate( src: TARDoubleArray );
    begin
      freeAndNil( _myHistData );
      _myHistData := THistogramData.create( src, _breakType, _nBins );
      _hist := _myHistData;
      populateChart();
    end
  ;


  {*
     Populates the chart from src
     @param a TARIntArray array structure holding integer values
  }
  procedure TFrameArrayHistogram.populate( src: TARIntArray );
    begin
      freeAndNil( _myHistData );
      _myHistData := THistogramData.create( src, _breakType, _nBins );
      _hist := _myHistData;
      populateChart();
    end
  ;


  {*
     Populates the chart from src
     @param a THistogramData object, _hist is set to src
  }
  procedure TFrameArrayHistogram.populate( src: THistogramData );
    begin
      freeAndNil( _myHistData );
      _hist := src;

      _loading := true;
      setBinNumberProtected( _hist.breakType, _hist.nBins, self );
      _loading := false;

      populateChart();
    end
  ;


  {*
    Essentially an event notification that the number of self's bins has changed and setBinNumberPtr is reset
    @param breakType enumeration for method used to calculate the number of histogram bins
    @param nBins  number of bins
    @param sender self, hopefully
  }
  procedure TFrameArrayHistogram.setBinNumberProtected( const breakType: THistBreakType; const nBins: integer; const sender: TObject );
    begin
      setBinNumber( breakType, nBins );

      if( sender = self ) then
        begin
          if( nil <> @setBinNumberPtr ) then
            setBinNumberPtr( self, _nBins )
          ;
        end
      ;
    end
  ;


  {*
    Manages everything that must be updated in the GUI and FrameArrayHistogram object when break type changes
    @param breakType enumeration for method used to calculate the number of histogram bins
    @param nBins  number of bins
  }
  procedure TFrameArrayHistogram.setBinNumber( const breakType: THistBreakType; const nBins: integer );
    begin
      _loading := true;

      case breakType of
        UserSpecified, SquareRoot, QuarterScott:
          begin
            rdoUser.Checked := true;
            _breakType := UserSpecified;
            rleHistoBins.Visible := true;
            btnAccept.Visible := true;
            btnCancel.Visible := true;
            btnAccept.Enabled := false;
            btnCancel.Enabled := false;
          end
        ;
        Sturges:
          begin
            rdoSturges.Checked := true;
            _breakType := Sturges;
            rleHistoBins.Visible := false;
            btnAccept.Visible := false;
            btnCancel.Visible := false;
          end
        ;
        Scott:
          begin
            rdoScott.Checked := true;
            _breakType := Scott;
            rleHistoBins.Visible := false;
            btnAccept.Visible := false;
            btnCancel.Visible := false;
          end
        ;
        FreedmanDiaconis:
          begin
            rdoFD.Checked := true;
            _breakType := FreedmanDiaconis;
            rleHistoBins.Visible := false;
            btnAccept.Visible := false;
            btnCancel.Visible := false;
          end
        ;
        else
          raise exception.Create( 'Unsupported THistBreakType (' + intToStr( ord( breakType ) ) + ') in TFrameArrayHistogram.setBinNumber()' )
        ;
      end;

      if( nil <> _hist ) then
        begin
          case breakType of
            UserSpecified, SquareRoot, QuarterScott:
              begin
                _hist.setBreakType( UserSpecified, nBins );
                _nBins := nBins;
              end
            ;
            Sturges:
              begin
                _hist.breakType := Sturges;
                _nBins := _hist.nBins;
              end
            ;
            Scott:
              begin
                _hist.breakType := Scott;
                _nBins := _hist.nBins;
              end
            ;
            FreedmanDiaconis:
              begin
                _hist.breakType := FreedmanDiaconis;
                _nBins := _hist.nBins;
              end
            ;
            else
              raise exception.Create( 'Unsupported THistBreakType (' + intToStr( ord( breakType ) ) + ') in TFrameArrayHistogram.setBinNumber()' )
            ;
          end;

          rleHistoBins.text := intToStr( _nBins );
          populateChart();
          repaint();
        end
      else
        dbcout( '_hist is nil in TFrameArrayHistogram.setBinNumber()', true )
      ;

      _loading := false;
    end
  ;


  {*
    Creates a TPdfHistogram object from the data contained by this object.
    @return A newly created TPdfHistogram
  }
  function TFrameArrayHistogram.createPdf(): TPdfHistogram;
    begin
      if( nil = _hist ) then
        result := nil
      else
        result := _hist.createPdf()
      ;
    end
  ;


  {*
    The click event handler referenced by all of the break type option buttons
    @param Sender one of the frame's TRadioButtons for a bin claculation method
  }
  procedure TFrameArrayHistogram.rdoBinNumberClick( Sender: TObject );
    var
      val: integer;
      idx: integer;
    begin
      if( _loading ) then
        exit
      ;

      if
        ( sender = self.rdoScott )
      or
        ( sender = self.rdoSturges )
      or
        ( sender = self.rdoFD )
      or
        ( sender = self.rdoUser )
      then
        begin
          if( nil <> @rdoHistoTypeClickPtr ) then
            rdoHistoTypeClickPtr( Sender )
          ;
        end
      ;

      if( sender is TRadioButton ) then
        idx := ( sender as TRadioButton).TabOrder
      else
        raise exception.Create( 'Unsupported sender type in TFrameArrayHistogram.rdoBinNumberClick()' )
      ;

      _loading := true;

      if( 0 = idx ) then // Scott
        begin
          rdoScott.Checked := true;
          setBinNumberProtected( Scott, -1, self );
        end
      else if( 1 = idx ) then // FD
        begin
          rdoFD.Checked := true;
          setBinNumberProtected( FreedmanDiaconis, -1, self );
        end
      else if( 2 = idx ) then // Sturges
        begin
          rdoSturges.Checked := true;
          setBinNumberProtected( Sturges, -1, self );
        end
      else if( 3 = idx ) then // User-specified
        begin
          rdoUser.Checked := true;
          val := myStrtoInt( rleHistoBins.Text, 50 );
          rleHistoBins.Text := intToStr( val );
          setBinNumberProtected( UserSpecified, val, self );
        end
      else
        raise exception.Create( 'Bad idx (' + intToStr( idx ) + ') in TFrameArrayHistogram.rdoBinNumberClick()' )
      ;

      _loading := false;
    end
  ;


  /// Helper method called by populate() and setBinNumber to build the chart series and scale the axes
  procedure TFrameArrayHistogram.populateChart();
    var
      i: integer;
      minX: double;
      binInterval: double;
    begin
      serHistogram.Clear();

      if( nil = _hist ) then
        raise exception.create( '_hist is nil in TFrameArrayHistogram.populateChart()' )
      ;

      if( _hist.isEmpty ) then
        exit
      ;

      for i := 0 to _hist.counts.count - 1 do
        begin
          serHistogram.AddXY( _hist.breaks.at(i), 0.0 );
          serHistogram.AddXY( _hist.breaks.at(i), _hist.counts.at(i) );
          serHistogram.AddXY( _hist.breaks.at(i + 1), _hist.counts.at(i) );
          serHistogram.AddXY( _hist.breaks.at(i + 1), 0.0 );
        end
      ;

      // The following IF statements correct for a known bug in TChart
      // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi
      if( serHistogram.YValues.MaxValue = serHistogram.YValues.MinValue ) then
        serHistogram.GetVertAxis.SetMinMax( serHistogram.YValues.MinValue - 1.0, serHistogram.YValues.MinValue + 1.0 )
      else
        serHistogram.GetVertAxis.Automatic := true
      ;

      if( serHistogram.XValues.MaxValue = serHistogram.XValues.MinValue ) then
        serHistogram.GetHorizAxis.SetMinMax( serHistogram.XValues.MinValue - 1.0, serHistogram.XValues.MinValue + 1.0 )
      else
        serHistogram.GetHorizAxis.Automatic := true
      ;

      serHistogram.GetVertAxis.SetMinMax( 0.0, serHistogram.YValues.MaxValue + ( 0.05 * serHistogram.YValues.MaxValue ) );

      binInterval := _hist.breaks.at(1) - _hist.breaks.at(0);
      minX := max( 0.0, serHistogram.XValues.MinValue - binInterval );
      serHistogram.GetHorizAxis.SetMinMax( minX, serHistogram.XValues.MaxValue + binInterval );
    end
  ;


  /// Sets the title of the chart to titleStr
  procedure TFrameArrayHistogram.setTitle( titleStr: string );
    begin
      chtHistogram.Title.Text[0] := titleStr;
    end
  ;


  {*
    OnEnter event handler for entering a user-defined number of bins
    @param Sender self.rleHistoBins
  }
  procedure TFrameArrayHistogram.rleHistoBinsEnter(Sender: TObject);
    begin
      btnAccept.Enabled := true;
      btnCancel.enabled := true;

      rleHistoBins.SelectAll();

      (*
      if(sender = self.rleHistoBins) then
        begin
          if(nil <> @rleHistoBinsEnterPtr) then
          begin
            rleHistoBinsEnterPtr(Sender);
          end
          ;
        end
      ;
      *)
    end
  ;


  {*
    OnClick event handler for edit control to enter a user-defined number of bins
    @param Sender self.rleHistoBins
  }
  procedure TFrameArrayHistogram.rleHistoBinsClick(Sender: TObject);
    begin
      if( not( _lineEditEntered ) ) then
        begin
          _lineEditEntered := true;
          rleHistoBins.SelectAll();
        end
      ;
    end
  ;


  {*
    OnClick event handler for Accept button, validates and updates the chart for a user-defined number of bins
    @param Sender self.btnAccept
  }
  procedure TFrameArrayHistogram.btnAcceptClick(Sender: TObject);
    var
      val: integer;
    begin
      _loading := true;
      rdoUser.Checked := true;
      _loading := false;

      val := myStrToInt( rleHistoBins.Text, -1 );

      if( not( 0 < val ) ) then
        begin
          msgOK( tr( 'Please enter a positive number of histogram bins.' ), tr( 'Invalid entry' ), IMGWarning, _myForm );
          rleHistoBins.SetFocus();
          btnAccept.Enabled := true;
          btnCancel.Enabled := true;
        end
      else
        begin
          setBinNumberProtected( UserSpecified, val, self );

          _lineEditEntered := false;

          chtHistogram.SetFocus();
        end
      ;
    end
    ;


  {*
    OnClick event handler for Cancel button
    @param Sender self.btnCancel
  }
  procedure TFrameArrayHistogram.btnCancelClick(Sender: TObject);
    begin
      if( sender = self.btnCancel ) then
        begin
          if( nil <> @btnCancelClickPtr ) then
            btnCancelClickPtr(Sender)
          ;
        end
      ;
      rleHistoBins.Text := intToStr( _hist.nBins );
      btnAccept.Enabled := false;
      btnCancel.Enabled := false;
      chtHistogram.SetFocus();
    end
  ;


  {*
    OnKeyUp event handler for number of bins text endrt control, rleHistoBins
    @param Sender rleHistoBins
    @param Key a keyborad key number
    @param Shift indicates the state of the Alt, Ctrl, and Shift keys and the mouse buttons
    @comment Handles Enter and Esc key strokes by the user following data entry, notifying either the Accept or Cancel button
  }
  procedure TFrameArrayHistogram.rleHistoBinsKeyUp( Sender: TObject; var Key: Word; Shift: TShiftState );
    begin
      dbcout( 'Key up!' + intToStr( ord( key ) ), DBSHOWMSG );
      
      if( 27 = key ) then
        btnCancelClick( btnCancel )
      else if( 13 = key ) then
        btnAcceptClick( btnAccept )
      ;
    end
  ;


  {*
    OnClick event handler for 3DView checkbox
    @param Sender self.cbx3DView
  }
  procedure TFrameArrayHistogram.cbx3DViewClick( Sender: TObject );
    begin
      if( sender = self.cbx3DView ) then
        begin
          if( nil <> @cbx3DViewClickPtr ) then
            cbx3DViewClickPtr( Sender )
          ;
        end
      ;

      if( sender is TCheckBox ) then
        begin
          self.cbx3DView.Checked := ( sender as TCheckBox ).checked;
          chtHistogram.View3D := self.cbx3DView.Checked;
        end
      else
        raise exception.Create( 'Unexpected sender in TFrameArrayHistogram.cbx3DViewClick()' )
      ;
    end
  ;
//-----------------------------------------------------------------------------


end.
