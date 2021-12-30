unit FrameChartPointsEditor;

(*
FrameChartPointsEditor.pas/dfm
-------------------------------
Begin: 2005/11/10
Last revision: $Date: 2013-06-27 19:11:22 $ $Author: areeves $
Version number: $Revision: 1.14.4.9 $
Project: APHI Delphi Library for Simulation Modeling
Website: http://www.naadsm.org/opensource/libaphi/
Author: Aaron Reeves <aaron.reeves@naadsm.org>
--------------------------------------------------
Copyright (C) 2005 - 2011 Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

interface

  uses
    // standard includes
    Windows,
    SysUtils,
    Variants,
    Forms,
    Clipbrd,
    Menus,
    ActnList,
    XPStyleActnCtrls,
    ActnMan,
    ToolWin,
    ActnCtrls,                                         
    ActnMenus,
    ImgList,
    Classes,
    Controls,
    Dialogs,
    StdCtrls,
    ExtCtrls,

    // Chart controls
    TeEngine,
    Series,
    TeeProcs,
    Chart,

    // Data structures
    Points,
    ChartFunction,
    RelFunction,
    ProbDensityFunctions,

    // The base class
    FrameChartBase
  ;
  

  type TFrameChartPointsEditor = class( TFrameChartBase )
      pnlBottom: TPanel;
      pnlChart: TPanel;
      pnlCumulativeContainer: TPanel;
      pnlCumulative: TPanel;
      cbxShowCumulProb: TCheckBox;
      chartMain: TChart;
      serPDFContinuous: TAreaSeries;
      serPdfDiscrete: TBarSeries;
      serPdfCumulative: TFastLineSeries;
      serPdfDiscreteApprox: TBarSeries;
      serREL: TLineSeries;
      PopupMenu: TPopupMenu;
      mnuAddPoint: TMenuItem;
      mnuRemovePoint: TMenuItem;

      lblErrorMessage: TLabel;
      serYAxisMarker: TLineSeries;
      cbxShowDiscreteApprox: TCheckBox;

      // Popup menu
      //------------
      procedure PopupMenuPopup(Sender: TObject);
      procedure mnuAddPointClick(Sender: TObject);
      procedure mnuRemovePointClick(Sender: TObject);

      // Graphical point editing
      //-------------------------
      procedure chartMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure chartMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

      procedure cbxShowCumulProbClick(Sender: TObject);

    protected
      // Properties
      //------------
      _xAxisUnits: TChartUnitType;
      _yAxisUnits: TChartUnitType;
      _xAxisLabel: string; // Used for custom types
      _title: string;

      _chartType: TChartType;
      _isRelFunction: boolean;

      _adjustPdfAuto: boolean;

      _isReadOnly: boolean;

      _chartChanged: boolean;
      _saveChanges: boolean;

      _MousePos: TPoint;
      _DragPnt: longint;

      _workingSeries: TChartSeries;

      _minVal: double;
      _maxVal: double;

      _fnNames: TStrings;

      _updateFunctionParams: TUpdateParamsEvent;

      _myForm: TForm;

      procedure translateUI();
      procedure translateUIManual();

      procedure setMinMaxY();

      procedure setMinVal( val: double );
      procedure setMaxVal( val: double );
      function getMinVal(): double;
      function getMaxVal(): double;

      procedure initialize();
      procedure showHideChart( shouldShow: boolean );

      // Used with the table for editing points.
      procedure UpdateSingleChartPoint( Pnt: longint; var P: RPointArray; S: TChartSeries );
      procedure UpdateAllChartPoints( var P: RPointArray; S: TChartSeries );

      procedure setAdjustPdfAuto( val: boolean );
      procedure setIsReadOnly( const val: boolean );
      procedure setChartType( const val: TChartType );
      procedure setXAxisUnits( const val: TChartUnitType );
      procedure setYAxisUnits( const val: TChartUnitType );
      procedure setXAxisLabel( const val: string );

      procedure setFnNames( val: TStrings );

      function getIsPdfFunction(): boolean;
      function getAdjustPdfAuto(): boolean;
      function getIsRelFunction(): boolean;
      function getIsReadOnly(): boolean;
      function getPlottingCumulative(): boolean;

      function getXAxisUnits(): TChartUnitType;
      function getYAxisUnits(): TChartUnitType;

      function getTitle(): string;
      function getSaveChanges(): boolean;

      function getChartType(): TChartType;

      // Chart-drawing functions
      //-------------------------
      procedure drawChartPdf( const chart: TPdf );
      procedure drawChartRel( const chart: TRelFunction );
      procedure adjustAxes();
      procedure plotPdfCumulContinuous();
      procedure plotPdfCumulDiscrete();

      // Mark Schoenbaum's original chart drawing functions
      // FIX ME: some of these might make useful nonGUI functions some day
      //-----------------------------------------
      procedure FillPointsFromSeries( var P: RPointArray );

      function GetIntervalArea( P1, P2: RPoint ): double;
      function AreaUnderPDFCurveIsOneOK( var P: RPointArray ): boolean;

      function StandardizePDFSeries(): boolean;

      procedure CalculateIntervalProbabilities(
        P: RPointArray;
        var intervalAreas: array of double;
        var TotalArea: double
      );
      procedure GetTidBitArea( var TidBitArea: double; var TidBitPnt, P1, P2: RPoint );

      // Functions for (I think) editing points
      //---------------------------------------
      function ValuePerPixel(A : TChartAxis) : real;
      function GetPointReference( S: TChartSeries; C: TChart; x, y: integer ): longint;
      
      procedure PlotPoint(
        x: double;
        P: RPointArray;
        A: array of double;
        cumlSeries: TChartSeries
      );
      
    public
      constructor create( AOwner: TComponent ); override;

      function createChart(): TChartFunction;
      function chartPoints(): RPointArray;

      procedure drawChart( const chart: TChartFunction );
      procedure drawDiscreteApprox( const fn: TPdf );

      procedure showChart();
      procedure hideChart( msg: string = '' );

      procedure setUpdateParams( fn: TUpdateParamsEvent );

      // Retrieving the points as an array
      //----------------------------------
      function createRPointArray(): RPointArray;


      // Properties
      //------------
      property isPdfFunction: boolean read getIsPdfFunction;
      property adjustPdfAuto: boolean read getAdjustPdfAuto write setAdjustPdfAuto;
      property isRelFunction: boolean read getIsRelFunction;
      property isReadOnly: boolean read getIsReadOnly write setIsReadOnly;
      property plottingCumulative: boolean read getPlottingCumulative;
      property saveChanges: boolean read getSaveChanges;

      property xAxisUnits: TChartUnitType read getXAxisUnits write setXAxisUnits;
      property yAxisUnits: TChartUnitType read getYAxisUnits write setYAxisUnits;
      property xAxisLabel: string write setXAxisLabel;

      // Deprecated: use minY and maxY
      property minVal: double read getMinVal write setMinVal;
      property maxVal: double read getMaxVal write setMaxVal;

      property minY: double read getMinVal write setMinVal;
      property maxY: double read getMinVal write setMaxVal;

      property fnNames: TStrings write setFnNames;

      property chartType: TChartType read getChartType write setChartType;
    end
  ;


  const
  	DBFRAMECHARTPOINTSEDITOR: boolean = false; // set to true to enable debugging messages for this unit.

implementation

  {$R *.dfm}
  
  uses
    Math,

    MyStrUtils,
    DebugWindow,
    ControlUtils,
    MyDialogs,
    I88n
  ;



//-----------------------------------------------------------------------------
// Construction/initialization/destruction
//-----------------------------------------------------------------------------
  constructor TFrameChartPointsEditor.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      if( AOwner is TForm ) then
        _myForm := AOwner as TForm
      else
        _myForm := nil
      ;
    end
  ;


  procedure TFrameChartPointsEditor.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.2.
      // Generation date: Thu Feb 28 20:56:48 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/general_purpose_gui/function_editor/FrameChartPointsEditor.dfm
      // File date: Tue Feb 26 19:51:36 2008

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          lblErrorMessage.Caption := tr( 'lblErrorMessage' );
          cbxShowCumulProb.Caption := tr( 'Show cumulative probability' );
          cbxShowDiscreteApprox.Caption := tr( 'Show discrete approximation' );
          mnuAddPoint.Caption := tr( 'Add point' );
          mnuRemovePoint.Caption := tr( 'Remove point' );
        end
      ;

      // Set TChart properties
      with self do
        begin
          chartMain.BottomAxis.Title.Caption := tr( 'x units go here:  Title property- > Axis -> Title' );
          chartMain.LeftAxis.Title.Caption := tr( 'y units go here:  Title property- > Axis -> Title' );
          chartMain.Title.Text.Strings[0] := tr( 'Probability density function' );
        end
      ;

      // If any phrases are found that could not be automatically extracted by
      // Caption Collector, modify the following function to take care of them.
      translateUIManual();
    end
  ;


  procedure TFrameChartPointsEditor.translateUIManual();
    begin
    end
  ;



  procedure TFrameChartPointsEditor.initialize();
    begin
      serPDFContinuous.clear();
      serPdfDiscrete.clear();
      serPdfCumulative.clear();
      serPdfDiscreteApprox.Clear();
      serREL.clear();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for copying charts
//-----------------------------------------------------------------------------
  procedure TFrameChartPointsEditor.drawChart( const chart: TChartFunction );
    begin
      screen.Cursor := crHourglass;

      initialize();

      chartMain.Title.Text.Clear();
      chartMain.Title.Text.Append( chart.descr );

      setXAxisUnits( chart.xUnits );

      if( chart is TPdf ) then
        begin
          setChartType( CTPdf );
          adjustPDFAuto := true;

          if( chart is TPdfContinuous ) then
            begin
              _workingSeries := serPDFContinuous;
              cbxShowDiscreteApprox.Visible := true;
            end
          else
            begin
              _workingSeries := serPdfDiscrete;
              cbxShowDiscreteApprox.Visible := false;
            end
          ;

          setYAxisUnits( UUnitless );

          drawChartPdf( chart as TPdf );

          if( chart is TPdfContinuous ) then
            drawDiscreteApprox( chart as TPdf )
          else
            serPdfDiscreteApprox.Clear()
          ;
          
          adjustAxes();

          cbxShowCumulProbClick( nil );
        end
      else if( chart is TRelFunction ) then
        begin
          cbxShowDiscreteApprox.Visible := false;

          setChartType( CTRel );
          _workingSeries := serREL;
          setYAxisUnits( chart.yUnits );

          drawChartRel( chart as TRelFunction );
          adjustAxes();
        end
      ;

      screen.Cursor := crDefault;
    end
  ;


  procedure TFrameChartPointsEditor.drawDiscreteApprox( const fn: TPdf );
    var
      i: integer;
    begin
      //dbcout2( endl + 'BEGIN TFrameChartPointsEditor.drawDiscreteApprox()' );

      if( cbxShowDiscreteApprox.Checked ) then
        begin
          if( nil <> fn ) then
            begin
              if( fn.validate() ) then
                begin
                  for i := 0 to fn.discreteVals.count - 1 do
                    serPdfDiscreteApprox.AddXY( fn.discreteVals.keyAtIndex(i), fn.discreteVals.itemAtIndex(i) )
                  ;
                end
              else
                serPdfDiscreteApprox.Clear()
              ;
            end
          else
            serPdfDiscreteApprox.Clear()
          ;
        end
      else
        serPdfDiscreteApprox.Clear()
      ;

      adjustAxes();

      //dbcout2( 'DONE TFrameChartPointsEditor.drawDiscreteApprox()' );
    end
  ;


  procedure TFrameChartPointsEditor.plotPdfCumulDiscrete();
    var
      vals: TMassHistogramValues;
      i: integer;
      nextY: double;
    begin
      serPdfCumulative.Clear();

      vals := TMassHistogramValues.create();

      vals.append( TMassHistogramValue.create( serPdfDiscrete.XValue[0], serPdfDiscrete.YValue[0] ) );
      
      for i := 1 to serPdfDiscrete.Count - 1 do
        begin
          nextY := vals.at( i - 1 ).y + serPdfDiscrete.YValue[i];
          vals.append( TMassHistogramValue.create( serPdfDiscrete.XValue[i], nextY ) );
        end
      ;

      for i := 0 to vals.Count - 1 do
        begin
          serPdfCumulative.AddXY( vals.at(i).x, vals.at(i).y );
          if( i < vals.Count - 1 ) then
            serPdfCumulative.AddXY( vals.at(i+1).x, vals.at(i).y )
          ;
        end
      ;

      freeAndNil( vals );
    end
  ;


  procedure TFrameChartPointsEditor.adjustAxes();
    var
      range, min, max: double;
    begin
      // Pad the X axis a bit, if needed
      //--------------------------------
      if( ( serPdfContinuous = _workingSeries ) and cbxShowDiscreteApprox.Checked ) then
        begin
          min := math.min( serPdfContinuous.MinXValue, serPdfDiscreteApprox.MinXValue );
          max := math.max( serPdfContinuous.MaxXValue, serPdfDiscreteApprox.MaxXValue );
        end
      else
        begin
          min := _workingSeries.XValues.MinValue;
          max := _workingSeries.XValues.MaxValue;
        end
      ;
      range := max - min;
      min := min - ( range / 10 );
      max := max + ( range / 10 );

      setMinMaxY();

      // The following IF statements correct for a known bug in TChart
      // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi
      //---------------------------------------------------------------
      if( _workingSeries.XValues.MaxValue = _workingSeries.XValues.MinValue ) then
        _workingSeries.GetHorizAxis.SetMinMax( _workingSeries.XValues.MinValue - 1.0, _workingSeries.XValues.MinValue + 1.0 )
      else
        _workingSeries.GetHorizAxis.SetMinMax( min, max )
      ;
    end
  ;


  procedure TFrameChartPointsEditor.drawChartPdf( const chart: TPdf );
    var
      i: integer;
      pointArr: T2DPointList;
    begin
      // Continuous types
      //-----------------
      if( chart is TPdfContinuous ) then
        begin
          // Get the point array
          //---------------------
          if( chart is TPdfPiecewise ) then
            begin
              if( 3 > (chart as TPdfPiecewise).pointCount ) then
                begin
                  pointArr := T2DPointList.Create();
                  pointArr.Append( T2DPoint.create( 0.0, 0.0 ) );
                  pointArr.Append( T2DPoint.create( 3.0, 0.4 ) );
                  pointArr.Append( T2DPoint.create( 5.0, 0.0 ) );
                end
              else if( chart is TPdfContinuous ) then
                pointArr := ( chart as TPdfContinuous ).createPointArray()
              else
                raise exception.Create( 'Fix me in FrameChartPointsEditor!' )
              ;
            end
          else if( chart is TPdfContinuous ) then
            pointArr := ( chart as TPdfContinuous ).createPointArray()
          ;

          // Draw the chart using the point array
          //-------------------------------------
          for i := 0 to pointArr.Count - 1 do
            serPDFContinuous.addXY( pointArr.Point[i].x, pointArr.Point[i].y )
          ;

          freeAndNil( pointArr );
        end

      // Discrete types
      //---------------
      else
        begin
          pointArr := (chart as TPdfDiscrete).massHistogramValues;
          
          for i := 0 to pointArr.Count - 1 do
            serPdfDiscrete.AddXY( pointArr.at(i).x, pointArr.at(i).y )
          ;
        end
      ;
    end
  ;


  procedure TFrameChartPointsEditor.drawChartRel( const chart: TRelFunction );
    var
      i: integer;
      adjY: double;
    begin
      if( 0 = chart.pointCount ) then
        begin
          // FIX ME: deal with the maxVal stuff
          _workingSeries.addXY( 0.0, 100.0 );
          _workingSeries.addXY( 3.5, 50.0 );
          _workingSeries.addXY( 7.0, 25.0 );
        end
      else if( 1 = chart.pointCount ) then
        begin
          if( ( maxVal > 0.0 ) and ( maxVal < chart.points[0].y ) ) then
            adjY := maxVal // FIX ME: maybe issue a warning when this occurs?
          else
            adjY := chart.points[0].y
          ;

          _workingSeries.addXY( chart.points[0].x, adjY );
          _workingSeries.AddXY( chart.points[0].x + 1, adjY );
        end
      else
        begin
          for i := 0 to chart.pointCount - 1 do
            begin
              if( ( maxVal > 0.0 ) and ( maxVal < chart.points[i].y ) ) then
                adjY := maxVal // FIX ME: maybe issue a warning when this occurs?
              else
                adjY := chart.points[i].y
              ;
              _workingSeries.addXY( chart.points[i].x, adjY );
            end
          ;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Display
//-----------------------------------------------------------------------------
  procedure TFrameChartPointsEditor.showChart();
    begin
      showHideChart( true );
    end
  ;


  procedure TFrameChartPointsEditor.hideChart( msg: string = '' );
    begin
      lblErrorMessage.Caption := msg;
      lblErrorMessage.Width := pnlBottom.Width div 2;
      horizCenterInside( lblErrorMessage, pnlBottom );
      vertCenterInside( lblErrorMessage, pnlBottom );
      showHideChart( false );
    end
  ;


  procedure TFrameChartPointsEditor.showHideChart( shouldShow: boolean );
    begin
      if( shouldShow ) then
        begin
          dbcout( 'Chart should show!', DBFRAMECHARTPOINTSEDITOR );
          pnlBottom.Align := alNone;
          pnlBottom.Hide();
          pnlChart.Align := alClient;
          pnlChart.Show();
        end
      else
        begin
          dbcout( 'Chart should be hidden.', DBFRAMECHARTPOINTSEDITOR );
          pnlChart.Align := alNone;
          pnlChart.Hide();
          pnlBottom.Align := alClient;
          pnlBottom.Show();
        end
      ;
    end
  ;


  procedure TFrameChartPointsEditor.cbxShowCumulProbClick(Sender: TObject);
    begin
      if( cbxShowCumulProb.Checked ) then
        begin
          if( serPdfContinuous = _workingSeries ) then
            plotPdfCumulContinuous()
          else if( serPdfDiscrete = _workingSeries ) then
            plotPdfCumulDiscrete()
          else
            raise exception.Create( 'Wrong _workingSeries in TFrameChartPointsEditor.cbxShowCumProbClick' )
          ;
        end
      else
        serPdfCumulative.Clear()
      ;

      adjustAxes();
    end
  ;


  procedure TFrameChartPointsEditor.setMinMaxY();
    var
      min, max: double;
      y10pct: double;
    begin
      // The following IF statement corrects for a known bug in TChart
      // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi
      //---------------------------------------------------------------
      min := 0.0; //_workingSeries.YValues.MinValue;
      max := _workingSeries.YValues.MaxValue;

      dbcout( 'Y scale min = ' + dbFloatToStr( min ) + ', max = ' + dbFloatToStr( max ), DBFRAMECHARTPOINTSEDITOR );

      if( CTPdf = _chartType ) then
        begin
          if( ( cbxShowCumulProb.checked ) and ( 1.02 > max ) ) then
            max := 1.02
          (*
          // AR 4/15/10 This block has been commented out for quite a while.  It can probably go away.
          else if( _workingSeries.YValues.MaxValue = _workingSeries.YValues.MinValue ) then
            begin
              y10pct := _workingSeries.YValues.MaxValue / 10;
              if( 0.1 > y10pct ) then y10pct := 0.1;
              min := 0.0;
              max := _workingSeries.YValues.MaxValue + y10pct;
            end
          *)
          (*
          // AR 4/15/10 This block seems undesirable.  I can't remember why it was ever here in the first place.
          else if( 100 < _workingSeries.YValues.MaxValue - _workingSeries.YValues.MinValue ) then
            begin
              dbcout( 'Limiting max to ' + dbFloatToStr( 100 * _workingSeries.YValues.MinValue ), DBFRAMECHARTPOINTSEDITOR );
              min := 0.0;
              max := 100 * _workingSeries.YValues.MinValue;
            end
          *)
          else
            begin
              min := 0.0;
              y10pct := _workingSeries.YValues.MaxValue / 10;
              //if( 0.01 > y10pct ) then y10pct := 5 * y10pct;  // AR 4/15/10 This line seems undesirable.
              max := _workingSeries.YValues.MaxValue + y10pct;
            end
          ;
        end
      else if( CTRel = _chartType ) then
        begin
          min := 0.0;
          max := _workingSeries.YValues.MaxValue + ( _workingSeries.YValues.MaxValue / 10 );
        end
      ;

      serYAxisMarker.Clear();
      serYAxisMarker.AddXY( 0, 0 );

      if( cbxShowCumulProb.Checked ) then
        begin
          if( 1 > max ) then max := 1;
        end
      ;
      serYAxisMarker.AddXY(0, max );

      _workingSeries.GetVertAxis.SetMinMax( min, max );
    end
  ;
//-----------------------------------------------------------------------------




//-----------------------------------------------------------------------------
// Output
//-----------------------------------------------------------------------------
  function TFrameChartPointsEditor.createChart(): TChartFunction;
    var
      pdf: TPdfPiecewise;
      rel: TRelFunction;
      i: integer;
      arr: RPointArray;
    begin
      setLength( arr, _workingSeries.Count );

      for i := 0 to _workingSeries.Count - 1 do
        begin
          arr[i].x := _workingSeries.xvalue[i];
          arr[i].y := _workingSeries.yvalue[i];
        end
      ;

    	case _chartType of
      	CTPdf:
        	begin
            pdf := TPdfPiecewise.create( arr, xAxisUnits );
            pdf.name := tr( '(Unnamed PDF)' );
            result := pdf;
          end
        ;
        CTRel:
        	begin
            rel := TRelFunction.create();

            for i := 0 to _workingSeries.count-1 do
          		rel.addPoint(_workingSeries.xvalue[i], _workingSeries.yvalue[i] );
            ;

            rel.xUnits := xAxisUnits;
            rel.yUnits := yAxisUnits;
            rel.name := tr( '(Unnamed REL)' );

            result := rel;
          end
        ;
        else
        	result := nil
        ;
      end;

    end
  ;


  function TFrameChartPointsEditor.chartPoints(): RPointArray;
    var
      parr: RPointArray;
      i: word;
    begin
      setLength( parr, 0 );

      for i := 0 to _workingSeries.Count-1 do
        begin
          setLength( parr, length(parr)+1 );
          parr[high(parr)].x := _workingSeries.xvalue[i];
          parr[high(parr)].y := _workingSeries.yvalue[i];
        end
      ;

      result := parr;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for editing chart points
// ----------------------------------------------------------------------------
  procedure TFrameChartPointsEditor.mnuAddPointClick( Sender: TObject );
    var
      x, y: real;
    begin
      if isReadOnly then exit;

      x := chartMain.BottomAxis.CalcPosPoint( _MousePos.X );
      y := chartMain.LeftAxis.CalcPosPoint( _MousePos.Y );
      _workingSeries.AddXY( x, y );

      if( isPDFFunction and AdjustPDFAuto ) then
        StandardizePDFSeries()
      ;
      if PlottingCumulative then
        plotPdfCumulContinuous()
      ;

      setMinMaxY();

      if( _workingSeries.XValues.MaxValue = _workingSeries.XValues.MinValue ) then
        _workingSeries.GetHorizAxis.SetMinMax( _workingSeries.XValues.MinValue - 1.0, _workingSeries.XValues.MinValue + 1.0 )
      else
        _workingSeries.GetHorizAxis.Automatic := true
      ;

      _chartChanged := True;

      if( nil <> @_updateFunctionParams ) then
        _updateFunctionParams( self, nil )
      ;
    end
  ;


  procedure TFrameChartPointsEditor.chartMainMouseDown( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer );
    begin
      if isReadOnly then exit;

      _MousePos.X := X;
      _MousePos.Y := Y;

      _DragPnt := GetPointReference( _workingSeries, chartMain, _MousePos.X, _MousePos.Y );

      if (ssLeft in Shift) and (_DragPnt <> -1) then
      begin
        if isPDFFunction then
          begin
            if (_DragPnt = 0) or
              (_DragPnt = _workingSeries.Count - 1) then
              Screen.Cursor := crSizeWE
            else
              Screen.Cursor := crDrag
            ;
          end
        else
          Screen.Cursor := crDrag;
      end;
    end
  ;


  procedure TFrameChartPointsEditor.chartMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    var
      GoodX, GoodY: double;

      // Private functions
      function GetGoodXPosition( _DragPnt: longint; X: integer): double;
        var
          xvLow, xvHigh: double;
          xv: double;
        begin
          xvLow := -1;
          xvHigh := -1;

          if _DragPnt = 0 then
            xvHigh := _workingSeries.XValue[1]
          else if _DragPnt = _workingSeries.Count - 1 then
            xvLow := _workingSeries.XValue[_workingSeries.Count - 2]
          else
            begin
              xvLow := _workingSeries.XValue[_DragPnt - 1];
              xvHigh := _workingSeries.XValue[_DragPnt + 1];
            end
          ;

          xv := chartMain.BottomAxis.CalcPosPoint(X);

          if( isRelFunction and ( 0 > xv ) ) then
            xv := 0
          else if (xv < xvLow) and (xvLow <> -1) then
            xv := xvLow + 0.01
          else if (xv > xvHigh) and (xvHigh <> -1) then
            xv := xvHigh - 0.01
          ;

          Result := xv;
        end
      ;


      function GetGoodYPosition( _DragPnt: longint; Y: integer): double;
        var
          yv : double;
        begin
          if
            ( isPDFFunction )
          and
            ((_DragPnt = 0) or (_DragPnt = _workingSeries.Count - 1))
          then
            yv := 0
          else
            begin
              yv := chartMain.LeftAxis.CalcPosPoint(Y);
              if yv < 0 then yv := 0;
            end
          ;
          Result := yv;
        end
      ;


      function ResultChartWillHaveAnArea( _DragPnt: longint; GoodX, GoodY: double): boolean;
        var
          i : longint;
          Y : double;
        begin
          Result := False;
          for i := 0 to _workingSeries.Count - 1 do
            begin

              if(  i = _DragPnt ) then
                Y := GoodY
              else
                Y := _workingSeries.YValues[i]
              ;

              if( Y > 0 ) then
                begin
                  Result := True;
                  Break;
                end
              ;

            end
          ;
        end
      ;

    begin // chartMainMouseUp
      if isReadOnly then
        exit
      ;

      _MousePos.X := X;
      _MousePos.Y := Y;

      if (_DragPnt <> -1)
        and ( ( Screen.Cursor = crSizeWE ) or ( Screen.Cursor = crDrag ) )
      then
        begin
          // move point
          GoodX := GetGoodXPosition( _DragPnt, X );
          GoodY := GetGoodYPosition( _DragPnt, Y );
          Screen.Cursor := crDefault;

          if ResultChartWillHaveAnArea( _DragPnt, GoodX, GoodY ) then
            begin
              _workingSeries.XValue[_DragPnt] := GoodX;

              // Max sure that the max allowable Y value is not exceeded for relational functions
              if( isRelFunction and ( maxVal > 0 ) and ( goodY > maxVal ) ) then
              	_workingSeries.YValue[_DragPnt] := maxVal
              else
              	_workingSeries.YValue[_DragPnt] := GoodY
              ;

              if( isPDFFunction and AdjustPDFAuto ) then
              	StandardizePDFSeries()
              ;
              if PlottingCumulative then
              	plotPdfCumulContinuous()
              ;

              if( not( plottingCumulative ) ) then
                begin
                  setMinMaxY();

                  if( _workingSeries.XValues.MaxValue = _workingSeries.XValues.MinValue ) then
                    _workingSeries.GetHorizAxis.SetMinMax( _workingSeries.XValues.MinValue - 1.0, _workingSeries.XValues.MinValue + 1.0 )
                  else
                    _workingSeries.GetHorizAxis.Automatic := true
                  ;
                end
              ;

              if( nil <> @_updateFunctionParams ) then
                _updateFunctionParams( self, nil )
              ;
              
              _chartChanged := True;
            end
          else
            MessageDlg( tr( 'The resulting chart would have no area.' ), mtError, [mbOK], 0 )
          ;
        end
      ;
    end
  ;


  procedure TFrameChartPointsEditor.PopupMenuPopup( Sender: TObject );
    var
      MinMaxPnt: boolean;
    begin
      if isReadOnly then exit;

      // abort if outside of chart area
      if
        ( _MousePos.X < chartMain.BottomAxis.IStartPos )
      or
        ( _MousePos.X > chartMain.BottomAxis.IEndPos )
      or
        ( _MousePos.Y < chartMain.LeftAxis.IStartPos )
      or
        ( _MousePos.Y > chartMain.LeftAxis.IEndPos )
      then
        abort
      else
        begin
          if( _DragPnt = -1 ) then
            begin
              mnuAddPoint.Enabled := True;
              mnuRemovePoint.Enabled := False;
            end
          else
            begin
              mnuAddPoint.Enabled := False;
              MinMaxPnt := (_DragPnt = 0) or (_DragPnt = _workingSeries.Count - 1);
              mnuRemovePoint.Enabled := (not (isPDFFunction and MinMaxPnt)) and ((isPDFFunction and (_workingSeries.Count > 3)) or ((not isPDFFunction) and (_workingSeries.Count > 2)));
            end
          ;
        end
      ;
    end
  ;


  procedure TFrameChartPointsEditor.mnuRemovePointClick(Sender: TObject);
    begin
      if isReadOnly then exit;

      _workingSeries.Delete( _DragPnt );

      if( isPDFFunction and AdjustPDFAuto ) then
        StandardizePDFSeries()
      ;
      if PlottingCumulative then
        plotPdfCumulContinuous()
      ;

      if( not( plottingCumulative ) ) then
        begin
          setMinMaxY();

          if( _workingSeries.XValues.MaxValue = _workingSeries.XValues.MinValue ) then
            _workingSeries.GetHorizAxis.SetMinMax( _workingSeries.XValues.MinValue - 1.0, _workingSeries.XValues.MinValue + 1.0 )
          else
            _workingSeries.GetHorizAxis.Automatic := true
          ;
        end
      ;

      _chartChanged := True;

      if( nil <> @_updateFunctionParams ) then
        _updateFunctionParams( self, nil )
      ;
    end
  ;


  // Used with the table for editing points
  procedure TFrameChartPointsEditor.UpdateSingleChartPoint( Pnt: longint; var P: RPointArray; S: TChartSeries );
    begin
      S.XValue[Pnt] := P[Pnt].X;
      S.YValue[Pnt] := P[Pnt].Y;

      if( isPDFFunction and AdjustPDFAuto ) then
        StandardizePDFSeries()
      ;
      if( PlottingCumulative ) then
        plotPdfCumulContinuous()
      ;

      if( not( plottingCumulative ) ) then
        begin
          // The following IF statements correct for a known bug in TChart
          // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi
          if( s.YValues.MaxValue = s.YValues.MinValue ) then
            s.GetVertAxis.SetMinMax( s.YValues.MinValue - 1.0, s.YValues.MinValue + 1.0 )
          else
            s.GetVertAxis.Automatic := true
          ;

          if( s.XValues.MaxValue = s.XValues.MinValue ) then
            s.GetHorizAxis.SetMinMax( s.XValues.MinValue - 1.0, s.XValues.MinValue + 1.0 )
          else
            s.GetHorizAxis.Automatic := true
          ;
        end
      ;

      _chartChanged := True;
    end
  ;


  // Used with the table for editing points
  procedure TFrameChartPointsEditor.UpdateAllChartPoints( var P: RPointArray; S: TChartSeries );
    var
      i : longint;
    begin
      S.Clear();

      for i := Low(P) to High(P) do
        S.AddXY(P[i].X,P[i].Y)
      ;

      if( isPDFFunction and AdjustPDFAuto )
        then StandardizePDFSeries()
      ;
      if PlottingCumulative then
        plotPdfCumulContinuous()
      ;

      if( not( plottingCumulative ) ) then
        begin
          // The following IF statements correct for a known bug in TChart
          // See http://www.teechart.net/support/modules.php?name=Newsgroups&file=article&id=924&group=steema.public.teechart6.delphi

          if( s.YValues.MaxValue = s.YValues.MinValue ) then
            s.GetVertAxis.SetMinMax( s.YValues.MinValue - 1.0, s.YValues.MinValue + 1.0 )
          else
            s.GetVertAxis.Automatic := true
          ;

          if( s.XValues.MaxValue = s.XValues.MinValue ) then
            s.GetHorizAxis.SetMinMax( s.XValues.MinValue - 1.0, s.XValues.MinValue + 1.0 )
          else
            s.GetHorizAxis.Automatic := true
          ;
        end
      ;

      _chartChanged := True;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for drawing points (I think)
//-----------------------------------------------------------------------------
  function TFrameChartPointsEditor.ValuePerPixel(A : TChartAxis) : real;
    var
      PixelDiff : integer;
      ValueDiff : double;
      pr, pl : integer;
      vr, vl : double;
      r : double;
    begin
      PixelDiff := A.IEndPos - A.IStartPos;

      if PixelDiff = 0 then
        r := -1
      else
        begin
          pr := A.IEndPos;
          pl := A.IStartPos;
          vl := A.CalcPosPoint(pl);
          vr := A.CalcPosPoint(pr);
          ValueDiff := Abs(vr - vl);
          r := ValueDiff/PixelDiff;
        end
      ;
      result := r;
    end
  ;


  function TFrameChartPointsEditor.GetPointReference( S: TChartSeries; C: TChart; x, y: integer ): longint;
    const
      pd = 5;
    var
      p, r : longint;
      LValX, LValY, HValX, HValY : double;
      ValuePerPixelX, ValuePerPixelY : double;
    begin
      ValuePerPixelX := ValuePerPixel(C.BottomAxis);
      ValuePerPixelY := ValuePerPixel(C.LeftAxis);

      r := -1;

      LValX := C.BottomAxis.CalcPosPoint(X) - (ValuePerPixelX * pd);
      HValX := c.BottomAxis.CalcPosPoint(X) + (ValuePerPixelX * pd);
      LValY := C.LeftAxis.CalcPosPoint(Y) - (ValuePerPixelY * pd);
      HValY := C.LeftAxis.CalcPosPoint(Y) + (ValuePerPixelY * pd);

      for p := 0 to (S.Count - 1) do
        begin
          if
            ( S.XValue[p] >= LValX )
          and
            ( S.XValue[p] <= HValX )
          and
            ( S.YValue[p] >= LValY )
          and
            ( S.YValue[p] <= HValY )
          then
            begin
              r := p;
              Break;
            end
          ;
        end
      ;

      Result := r;
    end
  ;


  procedure TFrameChartPointsEditor.PlotPoint(
        x: double;
        P: RPointArray;
        A: array of double;
        cumlSeries: TChartSeries
      );
    var
      area, tidbitArea : double;
      tidbitPnt : RPoint;
      tx : double;
      i : longint;
      xpnt1, xpnt2 : longint;
    begin
      Area := 0;
      i := 0;
      tx := P[i].X;

      while tx < x do
        begin
          Area := Area + A[i];
          Inc(i);
          tx := P[i].X;
        end
      ;

      xpnt2 := i;
      xpnt1 := i-1;
      TidBitPnt.X := X;
      GetTidBitArea( TidBitArea, TidBitPnt, P[xPnt1], P[xPnt2] );
      Area := Area + TidBitArea;
      CumlSeries.AddXY(TidBitPnt.X, Area)
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Useful minor helper functions
//-----------------------------------------------------------------------------
  {*
    Returns true if the area under the curve represented by the
    point array is equal to 1 (within an acceptable tolerance)
  }
  function TFrameChartPointsEditor.AreaUnderPDFCurveIsOneOK( var P: RPointArray ): boolean;
    var
      intervalAreas: array of double;
      RemArea, TotalArea: double;
      IsErr: boolean;
    begin
      SetLength( intervalAreas, Length(P) );
      try
        CalculateIntervalProbabilities( P, intervalAreas, TotalArea );
        RemArea := Abs(1 - TotalArea);
        IsErr := CompareValue( RemArea, 0, 0.00001 ) <> 0;
      finally
        intervalAreas := nil;
      end;
      Result := not IsErr;
    end
  ;


  {*
    Calculates the area between the line
    between 2 points (p1, p2) Returns the area.
    must be consecutive points in the chart.
  }
  function TFrameChartPointsEditor.GetIntervalArea( P1, P2: RPoint ): double;
    var
      dx, n: double;
    begin
      //-------------------------------------
      //    dx * (y1 + y2) = A*2
      // solve for A = dx (y1 + y2) / 2
      //-------------------------------------
      dx := P2.X - P1.X;
      n := dx*(P1.Y + P2.Y);
      Result := n/2;
    end
  ;


  {*
  Input is a series of X,Y points

  Output is the area under the points were
    intervalAreas[0] is the area to the left of the first point = 0
    intervalAreas[1] is the area from point 0 to point 1, etc
    Total Area is the sum of intervalAreas
  }
  procedure TFrameChartPointsEditor.CalculateIntervalProbabilities(
        P: RPointArray;
        var intervalAreas: array of double;
        var TotalArea: double
      );
    var
      iArea: double;
      i : longint;
    begin
      intervalAreas[Low(intervalAreas)] := 0;
      TotalArea := 0;

      for i := Low(P) to High(P) - 1 do
        begin
          iArea := GetIntervalArea(P[i],P[i+1]);
          intervalAreas[i + 1] := iArea;
          TotalArea := TotalArea + iArea;
        end
      ;
    end
  ;


  procedure TFrameChartPointsEditor.GetTidBitArea( var TidBitArea: double; var TidBitPnt, P1, P2: RPoint );
    var
      m : double;
      b : double;
    begin
      m := (P2.Y - P1.Y)/(P2.x - P1.x);
      b := P1.Y - m*(P1.X);
      // y := mx + b
      TidBitPnt.Y := m*TidBitPnt.X + b;
      TidBitArea := (TidBitPnt.Y + P1.Y) * (TidBitPnt.X - P1.X) / 2;
    end
  ;


  procedure TFrameChartPointsEditor.plotPdfCumulContinuous();
    const
      Points = 30;
    var
      P : RPointArray;
      A : array of double;
      interval, intx, TotalArea : double;
      i : integer;
    begin
      serPdfCumulative.Clear();

      // Continuous types are handled here.
      // Discrete types are handled by function plotCumulativeDiscrete.
      if( serPdfContinuous = _workingSeries ) then
        begin
          FillPointsFromSeries( P );
          try
            SetLength(A, Length(P));

            try
              CalculateIntervalProbabilities( P, A, TotalArea );
              interval := (P[High(P)].X - P[Low(P)].X)/(Points-1);
              serPdfCumulative.AddXY(P[Low(P)].X,0);

              for i := 2 to Points - 1 do
                begin
                  intX := P[Low(P)].X + ((i-1)*Interval);
                  PlotPoint(intX, P, A, serPdfCumulative );
                end
              ;

              serPdfCumulative.AddXY(P[High(P)].X,1);

              if( _workingSeries.GetVertAxis.Maximum < 1 ) then
                serPdfCumulative.GetVertAxis.Maximum := 1.0
              ;
            finally
              A := nil;
            end;

          finally
            P := nil;
          end;
        end
      else
        raise exception.create( 'Something screwy happened in TFrameChartPointsEditor.PlotCumulative()' )
      ;
    end
  ;


  procedure TFrameChartPointsEditor.FillPointsFromSeries( var P: RPointArray );
    var
      i : longint;
    begin
      P := nil;

      for i := 0 to serPdfContinuous.Count - 1 do
        begin
          SetLength(P, Length(P) + 1);
          P[High(P)].X := serPdfContinuous.XValue[i];
          P[High(P)].Y := serPdfContinuous.YValue[i];
        end
      ;
    end
  ;


  function TFrameChartPointsEditor.createRPointArray(): RPointArray;
    var
      arr: RPointArray;
      i: integer;
    begin
      setLength( arr, 0 );

       for i := 0 to _workingSeries.Count - 1 do
        begin
          SetLength( arr, Length(arr) + 1);
          arr[i].X := _workingSeries.XValue[i];
          arr[i].Y := _workingSeries.YValue[i];
        end
      ;

      result := arr;
    end
  ;

  
  function TFrameChartPointsEditor.StandardizePDFSeries(): boolean;
    var
      p : RPointArray;
      i: longint;
    begin
      FillPointsFromSeries( P );

      try
        Result := True;

        if( TPdfPiecewise.standardize(P) ) then
          begin
            // Put PDF in series
            serPdfContinuous.Clear();
            for i := Low(P) to High(P) do
              serPdfContinuous.AddXY(P[i].X,P[i].Y)
            ;
          end
        else
          Result := False
        ;
      finally
        P := nil;
      end;

    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Properties
//-----------------------------------------------------------------------------
  procedure TFrameChartPointsEditor.setChartType( const val: TChartType );
    begin
      if( val = _chartType ) then
        exit
      ;

      _chartType := val;

      case _chartType of
      	CTPdf:
        	begin
          	setAdjustPDFAuto( true );
            _workingSeries := serPDFContinuous;
            cbxShowCumulProb.visible := true;
            cbxShowDiscreteApprox.Visible := true;
            pnlCumulativeContainer.Visible := true;
            //_workingSeries.addXY( 0, 0 );
            //_workingSeries.addXY( 8.37931060791016, 0.133333333333333 );
            //_workingSeries.addXY( 15, 0  );
          end
        ;
        CTRel:
        	begin
            dbcout( 'rel chart should show', DBFRAMECHARTPOINTSEDITOR );
          	_workingSeries := serRel;
            cbxShowCumulProb.Visible := false;
            cbxShowDiscreteApprox.Visible := false;
            pnlCumulativeContainer.Visible := false;
            showChart();
          end
        ;
        CTUnspecified:
          begin
            setXAxisUnits( UUnknown );
            setYAxisUnits( UUnknown );

            _minVal := 0.0;
            _maxVal := 0.0;

            _workingSeries := nil;
            
            showHideChart( false );
          end
        ;
      end;
    end
  ;


  function TFrameChartPointsEditor.getChartType(): TChartType;
    begin
      result := _chartType;
    end
  ;


	procedure TFrameChartPointsEditor.setXAxisUnits( const val: TChartUnitType );
  	begin
   		_xAxisUnits := val;

      if( UCustom = val ) then
        begin
          if( strIsEmpty( _xAxisLabel ) ) then
            chartMain.BottomAxis.Title.Caption := capitalize( chartUnitTypeAsString( val ) )
          else
            chartMain.BottomAxis.Title.Caption := _xAxisLabel
          ;
        end
      else
        chartMain.BottomAxis.Title.Caption := capitalize( chartUnitTypeAsString( val ) )
      ;
    end
  ;


	procedure TFrameChartPointsEditor.setYAxisUnits( const val: TChartUnitType );
  	begin
   		_yAxisUnits := val;

      if( UUnitless <> val ) then
      	chartMain.LeftAxis.Title.Caption := capitalize( chartUnitTypeAsString( val ) )
      else
      	chartMain.LeftAxis.Title.Caption := ''
      ;
    end
  ;


  procedure TFrameChartPointsEditor.setXAxisLabel( const val: string );
    begin
      _xAxisUnits := UCustom;
      _xAxisLabel := val;
      chartMain.BottomAxis.Title.Caption := val;
    end
  ;


  procedure TFrameChartPointsEditor.setIsReadOnly( const val: boolean );
    begin
      _isReadOnly := val;
      popupMenu.AutoPopup := (not val );
      serPDFContinuous.Pointer.Visible := ( not val );
      serREL.Pointer.Visible := ( not val );
    end
  ;


  procedure TFrameChartPointsEditor.setUpdateParams( fn: TUpdateParamsEvent );
    begin
      _updateFunctionParams := fn;
    end
  ;


  function TFrameChartPointsEditor.getIsPdfFunction(): boolean; begin result := ( _chartType = CTPdf ); end;
  function TFrameChartPointsEditor.getIsRelFunction(): boolean; begin result := (_chartType = CTRel ); end;
  function TFrameChartPointsEditor.getIsReadOnly(): boolean; begin result := _isReadOnly; end;
  function TFrameChartPointsEditor.getSaveChanges(): boolean; begin result := _saveChanges; end;
	function TFrameChartPointsEditor.getPlottingCumulative(): boolean; begin result := cbxShowCumulProb.Visible and cbxShowCumulProb.Checked; end;

  procedure TFrameChartPointsEditor.setAdjustPdfAuto( val: boolean ); begin _adjustPdfAuto := val; end;

  function TFrameChartPointsEditor.getAdjustPdfAuto(): boolean; begin Result := _adjustPdfAuto; end;
  function TFrameChartPointsEditor.getXAxisUnits(): TChartUnitType; begin Result := _xAxisUnits; end;
  function TFrameChartPointsEditor.getYAxisUnits(): TChartUnitType; begin result := _yAxisUnits; end;
  function TFrameChartPointsEditor.getTitle(): string; begin Result := _title; end;

  procedure TFrameChartPointsEditor.setMinVal( val: double ); begin _minVal := val; end;
  procedure TFrameChartPointsEditor.setMaxVal( val: double ); begin _maxVal := val; end;
  function TFrameChartPointsEditor.getMinVal(): double; begin result := _minVal; end;
  function TFrameChartPointsEditor.getMaxVal(): double; begin result := _maxVal; end;

  procedure TFrameChartPointsEditor.setFnNames( val: TStrings ); begin _fnNames := val; end;
//-----------------------------------------------------------------------------





//*****************************************************************************
// Unrevised code
//*****************************************************************************


//-----------------------------------------------------------------------------
// AR 7/14/05
// Right now, cumulative PDFs cannot be imported.
// Keep this code around in case we want to some day.
//-----------------------------------------------------------------------------
(*
interface

  function PatternOfCumulativeOK(  var P: RPointArray ): boolean;
  procedure AddPoint( var P: RPointArray; X, Y: double );
  procedure AddIntervalBar(  var P: RPointArray; P1X, P2X, Slope: double );
  function GetSlope(P1, P2: RPoint; var Ok: boolean): double;
  function ConvertCumulativeToDensityOK( var P: RPointArray ): boolean;



implementation


  function PatternOfCumulativeOK(  var P: RPointArray ): boolean;
    var
      lastY : double;
      i  : longint;
      PositiveSlope : boolean;
    begin
      PositiveSlope := True;
      lastY := P[0].Y;

      for i := Low(P) + 1 to High(P) do
        begin
          if P[i].Y < LastY then
            begin
              PositiveSlope := False;
              Break;
            end
          else
            LastY := P[i].Y
          ;
        end
      ;

      if not PositiveSlope then
        ShowMessage('These points do not fit the pattern of a'
          + ' cumulative density function because the Y values decrease '
          + 'between points ' + IntToStr(i) + ' and ' + IntToStr(i+1) + '.')
      ;

      Result := PositiveSlope;
    end
  ;


  // Subhelper functions in convertCumulativeToDensityOK
  procedure AddPoint( var P: RPointArray; X, Y: double );
    begin
      SetLength(P, Length(P) + 1);
      P[High(P)].X := X;
      P[High(P)].Y := Y;
    end
  ;


  procedure AddIntervalBar(  var P: RPointArray; P1X, P2X, Slope: double );
    begin
      AddPoint(P, P1X, Slope);
      AddPoint(P, P2X, Slope);
    end
  ;


  function GetSlope(P1, P2: RPoint; var Ok: boolean): double;
    var
      n, d : double;
    begin
      n := (P2.Y - P1.Y);
      d := (P2.X - P1.X);
      OK := (d > 0); // discontinuous

      if OK then
        Result := n/d
      else
        Result := 0
       ;
    end
  ;


  function ConvertCumulativeToDensityOK( var P: RPointArray ): boolean;
  var
    i : longint;
    CP : RPointArray;
    xValLow, xValHigh, Slope : double;
    OK : boolean;
  begin 
    OK := True;
    SetLength(CP, Length(P));

    try
      // Copy array to OP
      for i := Low(P) to High(P) do Move(P[i], CP[i], Sizeof(CP[i]));
    
      // clear P
      P := nil;
    
      // initialize
      xValLow := CP[0].X;
      xValHigh := CP[High(CP)].X;
      AddPoint(P, xValLow, 0);

      // differentiate lines and add bars
      for i := Low(CP) to High(CP) - 1 do
        begin
          Slope := GetSlope(CP[i],CP[i+1], Ok);

          if not OK then
            begin
              P := nil;
              Break;
            end
          ;

          AddIntervalBar(P, CP[i].X, CP[i+1].X, Slope);
        end
      ;

      // end point
      if OK then
        AddPoint(P, xValHigh, 0)
      else
        ShowMessage('This cumulative density function is ' +
          'discontinuous and thus cannot be converted ' +
          'to a PDF')
      ;
    finally
      CP := nil;
    end;

    Result := OK;
  end
  ;
*)
//-----------------------------------------------------------------------------





end.
