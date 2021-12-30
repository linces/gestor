unit FrameArrayConvergence;

(*
FrameArrayConvergence.pas/dfm
-----------------------------
Begin: 2005/08/01
Last revision: $Date: 2009-04-17 05:07:30 $ $Author: areeves $
Version number: $Revision: 1.3 $
Project: APHI Delphi Library for Simulation Modeling
Website: http://www.naadsm.org/opensource/libaphi/
Author: Aaron Reeves <aaron.reeves@naadsm.org>
--------------------------------------------------
Copyright (C) 2005 - 2008 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

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
    TeEngine,
    Series,
    TeeProcs,
    Chart,
    Buttons,
    StdCtrls,
    ExtCtrls,

    QVectors,

		FrameChartBase,
    FrameArrayHistogram
	;

	type TFrameArrayConvergence = class( TFrameChartBase )
      pnlControls: TPanel;
      rdgConvergenceParam: TRadioGroup;
      
      chtConvergence: TChart;
      serConvergence: TLineSeries;

      procedure rdgConvergenceParamClick(Sender: TObject);

		protected
      _titlePrefix: string;
      _arr: TQDoubleVector;

      procedure translateUI();
      procedure translateUIManual();

      procedure populateChart( resetTitlePrefix: boolean );
      function calculate( arr: TQDoubleVector ): double;
      procedure setChartTitle( resetTitlePrefix: boolean );

		public
      rdgItemIndex: integer;
      rdgItemIndexPtr: ^integer;
      rdgConvergenceParamClickPtr: TPtr;
      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

      procedure populateFromArray( src: TQDoubleVector; resetTitlePrefix: boolean = true );
      procedure prependToTitle( str: string );
		end
	;



implementation

{$R *.dfm}

  uses
    Math,

    ARMath,
    MyStrUtils,
    DebugWindow,
    I88n
  ;


  const
    CONVERGEMEAN = 0;
    CONVERGESTDDEV = 1;
    CONVERGEMEDIAN = 2;
    CONVERGEQUARTDIFF = 3;

    DBFRAMEARRAYCONVERGENCE: boolean = false; // set to true to enable debugging messages for this unit.


  constructor TFrameArrayConvergence.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      _arr := nil;
      _titlePrefix := '';
    end
  ;


  procedure TFrameArrayConvergence.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.2.
      // Generation date: Thu Feb 28 16:52:53 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/general_purpose_gui/FrameArrayConvergence.dfm
      // File date: Thu Jan 4 11:16:16 2007

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          rdgConvergenceParam.Caption := tr( 'Parameter' );
        end
      ;

      // Set TStrings properties
      with self do
        begin
           rdgConvergenceParam.Items[0] := tr( 'Mean' );
           rdgConvergenceParam.Items[1] := tr( 'Standard deviation' );
           rdgConvergenceParam.Items[2] := tr( 'Median' );
           rdgConvergenceParam.Items[3] := tr( 'Quartile difference' );
        end
      ;

      // Set TChart properties
      with self do
        begin
          chtConvergence.BottomAxis.Title.Caption := tr( 'Iteration' );
          chtConvergence.LeftAxis.Title.Caption := tr( 'Mean' );
          chtConvergence.Title.Text.Strings[0] := tr( 'Stability of the mean over iteration' );
        end
      ;

      // If any phrases are found that could not be automatically extracted by
      // Caption Collector, modify the following function to take care of them.
      // Otherwise, this function will be empty:
      translateUIManual();
    end
  ;


  procedure TFrameArrayConvergence.translateUIManual();
    begin
    end
  ;


  destructor TFrameArrayConvergence.destroy();
    begin
      if (nil <> _arr ) then freeAndNil( _arr );
      inherited destroy();
    end
  ;

  // src contains the raw data for the selected output.
  procedure TFrameArrayConvergence.populateFromArray( src: TQDoubleVector; resetTitlePrefix: boolean = true );
    begin
      if( nil <> _arr ) then freeAndNil( _arr );
      _arr := TQDoubleVector.Create( src );
      populateChart( resetTitlePrefix );
    end
  ;




  procedure TFrameArrayConvergence.populateChart( resetTitlePrefix: boolean );
    var
      dest: TQDoubleVector; // Will be populated from the raw data and used to calculate each convergence step.

      i: integer;
      val: double;
    begin
      setChartTitle( resetTitlePrefix );

      serConvergence.Clear();

      dest := TQDoubleVector.create();
      for i := 0 to _arr.Count - 1 do
        begin
          dest.append( _arr[i] );
          val := calculate( dest );
          serConvergence.AddXY( i + 1, val );
        end
      ;

      // The following IF statements correct for a known bug in TChart
      // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi
      if( serConvergence.YValues.MaxValue = serConvergence.YValues.MinValue ) then
        serConvergence.GetVertAxis.SetMinMax( serConvergence.YValues.MinValue - 1.0, serConvergence.YValues.MinValue + 1.0 )
      else
        serConvergence.GetVertAxis.Automatic := true
      ;

      if( serConvergence.XValues.MaxValue = serConvergence.XValues.MinValue ) then
        serConvergence.GetHorizAxis.SetMinMax( serConvergence.XValues.MinValue - 1.0, serConvergence.XValues.MinValue + 1.0 )
      else
        serConvergence.GetHorizAxis.Automatic := true
      ;

      dest.Free();
    end
  ;


  function TFrameArrayConvergence.calculate( arr: TQDoubleVector ): double;
    begin
      case rdgConvergenceParam.ItemIndex of
        CONVERGEMEAN:
          result := arr.mean()
        ;
        CONVERGESTDDEV:
          begin
            if( 2 > arr.count ) then
              begin
                // This is a hack.  stddev where n = 1 is undefined,
                // but 0 gives a more attractive chart.
                result := 0.0;
              end
            else
              result := arr.stddev()
            ;
          end
        ;
        CONVERGEMEDIAN:
          result := arr.quantile( 0.5 )
        ;
        CONVERGEQUARTDIFF:
          result := arr.quantile( 0.75 ) - arr.quantile( 0.25 )
        ;
        else
          raise exception.create( 'Unrecognized convergence parameter in TFrameArrayConvergence.calculate()' )
        ;
      end;
    end
  ;


  procedure TFrameArrayConvergence.setChartTitle( resetTitlePrefix: boolean );
    var
      topStr: string;
      leftStr: string;
    begin
      topStr := '';
      leftStr := '';

      if( resetTitlePrefix ) then _titlePrefix := '';

      case rdgConvergenceParam.itemIndex of
        CONVERGEMEAN:
          begin
            leftStr := tr( 'Mean' );
            topStr := tr( 'Convergence of the mean' );
          end
        ;
        CONVERGESTDDEV:
          begin
            leftStr := tr( 'Standard deviation' );
            topStr := tr( 'Convergence of the standard deviation' );
          end
        ;
        CONVERGEMEDIAN:
          begin
            leftStr := tr( 'Median' );
            topStr := tr( 'Convergence of the median' );
          end
        ;
        CONVERGEQUARTDIFF:
          begin
            leftStr := tr( 'Quartile difference' );
            topStr := tr( 'Convergence of the quartile difference' );
          end
        ;
      end;

      if( '' <> _titlePrefix ) then
       chtConvergence.Title.Text[0] := _titlePrefix + ': ' + topStr
      else
        chtConvergence.Title.Text[0] := topStr
      ;
      chtConvergence.LeftAxis.Title.Caption := leftStr;
    end
  ;

  
  procedure TFrameArrayConvergence.prependToTitle( str: string );
    begin
      _titlePrefix := str;
      
      if( '' <> _titlePrefix ) then
        chtConvergence.Title.Text[0] := _titlePrefix + ': ' + chtConvergence.Title.Text[0]
      ;
    end
  ;


  procedure TFrameArrayConvergence.rdgConvergenceParamClick( Sender: TObject );
    begin
      if(sender = self.rdgConvergenceParam) then
        begin
          if(nil <> @rdgConvergenceParamClickPtr) then
            begin
              rdgItemIndexPtr^ := rdgConvergenceParam.ItemIndex;
              rdgConvergenceParamClickPtr(Sender);
            end
          ;
        end
      ;
      rdgConvergenceParam.Buttons[rdgConvergenceParam.ItemIndex].SetFocus;
      if( nil <> _arr ) then populateChart( false );
    end
  ;

end.
