unit FrameFunctionParams2;

(*
FrameFunctionParams2.pas/dfm
----------------------------
Begin: 2005/11/10
Last revision: $Date: 2013-06-27 19:11:23 $ $Author: areeves $
Version number: $Revision: 1.23.4.10 $
Project: APHI Delphi Library for Simulation Modeling
Website: http://www.naadsm.org/opensource/libaphi/
Author: Aaron Reeves <aaron.reeves@naadsm.org>
--------------------------------------------------
Copyright (C) 2005 - 2010 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

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
    Grids,
    ExtCtrls,

    REEdit,

    QStringMaps,
    FunctionPointers,

    Points,
    ChartFunction,
    ProbDensityFunctions,
    RelFunction,

    FrameAcceptCancel,
    FramePointEditorGrid
  ;

  type RPdfRecord = record
      min: double;
      max: double;
      mode: double;
      mean: double;
      stddev: double;
      alpha: double;
      alpha2: double;
      beta: double;
      location: double;
      scale: double;
      shape: double;
      n: integer;
      p: double;
      d: integer;
      m: integer;
      dmin: integer;
      dmax: integer;
      s: integer;
      theta: double;
      a: double;

      pdfType: TPdfType;
      pdfUnits: TChartUnitType;
      name: string;
    end
  ;

  type TFrameFunctionParams2 = class( TFrame )
      pnlParams: TPanel;

      grpUnspecified: TGroupBox;

      grpPoint: TGroupBox;
      lblValuePoint: TLabel;
      reValuePoint: TREEdit;

      grpGaussian: TGroupBox;
      lblMeanGaussian: TLabel;
      lblStdDevGaussian: TLabel;
      reMeanGaussian: TREEdit;
      reStdDevGaussian: TREEdit;

      grpTriang: TGroupBox;
      lblMinTriang: TLabel;
      lblModeTriang: TLabel;
      lblMaxTriang: TLabel;
      reMinTriang: TREEdit;
      reModeTriang: TREEdit;
      reMaxTriang: TREEdit;

      grpBeta: TGroupBox;
      lblAlpha1Beta: TLabel;
      lblAlpha2Beta: TLabel;
      lblMinBeta: TLabel;
      lblMaxBeta: TLabel;
      reAlpha1Beta: TREEdit;
      reAlpha2Beta: TREEdit;
      reMinBeta: TREEdit;
      reMaxBeta: TREEdit;

      grpGamma: TGroupBox;
      lblAlphaGamma: TLabel;
      lblBetaGamma: TLabel;
      reAlphaGamma: TREEdit;
      reBetaGamma: TREEdit;

      grpExponential: TGroupBox;
      lblMeanExponential: TLabel;
      reMeanExponential: TREEdit;

      grpLogistic: TGroupBox;
      lblLocationLogistic: TLabel;
      lblScaleLogistic: TLabel;
      reLocationLogistic: TREEdit;
      reScaleLogistic: TREEdit;

      grpPiecewise: TGroupBox;
      btnEditPiecewise: TButton;

      grpLoglogistic: TGroupBox;
      lblLocationLoglogistic: TLabel;
      lblScaleLoglogistic: TLabel;
      lblShapeLoglogistic: TLabel;
      reLocationLoglogistic: TREEdit;
      reScaleLoglogistic: TREEdit;
      reShapeLoglogistic: TREEdit;

      grpUniform: TGroupBox;
      lblMinUniform: TLabel;
      lblMaxUniform: TLabel;
      reMinUniform: TREEdit;
      reMaxUniform: TREEdit;

      grpLognormal2: TGroupBox;
      lblZetaLognormal2: TLabel;
      lblSigmaLognormal2: TLabel;
      reZetaLognormal2: TREEdit;
      reSigmaLognormal2: TREEdit;

      grpDiscreteUniform: TGroupBox;
      lblDiscreteUniformMin: TLabel;
      lblDiscreteUniformMax: TLabel;
      reMinDiscreteUniform: TREEdit;
      reMaxDiscreteUniform: TREEdit;

      grpBernoulli: TGroupBox;
      lblPBernoulli: TLabel;
      rePBernoulli: TREEdit;

      grpBinomial: TGroupBox;
      lblBinomialN: TLabel;
      lblBinomialP: TLabel;
      reNBinomial: TREEdit;
      rePBinomial: TREEdit;

      grpHypergeometric: TGroupBox;
      lblHypergeometricM: TLabel;
      lblHypergeometricD: TLabel;
      lblHypergeometricN: TLabel;
      reMHypergeometric: TREEdit;
      reDHypergeometric: TREEdit;
      reNHypergeometric: TREEdit;

      grpNegBinomial: TGroupBox;
      lblSNegBinomial: TLabel;
      lblPNegBinomial: TLabel;
      reSNegBinomial: TREEdit;
      rePNegBinomial: TREEdit;

      grpPareto: TGroupBox;
      lblThetaPareto: TLabel;
      lblAPareto: TLabel;
      reThetaPareto: TREEdit;
      reAPareto: TREEdit;

      grpInvGaussian: TGroupBox;
      lblMeanInvGaussian: TLabel;
      lblShapeInvGaussian: TLabel;
      reMeanInvGaussian: TREEdit;
      reShapeInvGaussian: TREEdit;

      pnlCbos: TPanel;
      lblPdfType: TLabel;
      cboPdfType: TComboBox;
      lblXAxis: TLabel;
      cboXAxis: TComboBox;  
  		cboYAxis: TComboBox;
      lblYAxis: TLabel;

      btnConvert: TButton;
      pnlUnspecified: TPanel;

      fraAcceptCancel: TFrameAcceptCancel;
      fraPointEditorGrid: TFramePointEditorGrid;

      procedure cboPdfTypeChange(Sender: TObject);
		
			procedure reValueChanged( sender: TObject );
      procedure reExit( Sender: TObject);
      procedure reEnter(Sender: TObject);

      procedure fraAcceptCancelbtnAcceptClick(Sender: TObject);
      procedure fraAcceptCancelbtnCancelClick(Sender: TObject);

      procedure reKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

      procedure fraPointEditorGridbtnOKClick(Sender: TObject);
      procedure fraPointEditorGridbtnCancelClick(Sender: TObject);
      procedure fraPointEditorGridstgPointsEnter(Sender: TObject);

      procedure fraPointEditorGridstgPointsKeyDown(
        Sender: TObject;
        var Key: Word;
        Shift: TShiftState
      );

			procedure btnEditPiecewiseClick(Sender: TObject);

    protected
      // Restrictions for REL functions
      _minY: double;
      _maxY: double;

      // Function parameters
      _min: double;
      _max: double;
      _mode: double;
      _mean: double;
      _stddev: double;
      _alpha: double;
      _alpha2: double;
      _beta: double;
      _location: double;
      _scale: double;
      _shape: double;
      _zeta: double;
      _sigma: double;
      _n: integer;
      _p: double;
      _d: integer;
      _m: integer;
      _dmin: integer;
      _dmax: integer;
      _s: integer;
      _theta: double;
      _a: double;

      _unitsLocked: boolean;

      _tempRecord: RPdfRecord;
      _tempPointsPiecewisePdf: RPointArray;
      _tempPointsRelFunction: RPointArray;
      _tempPointsHistogramPdf: RHistogramPointArray;

      _isRelFunction: boolean;
      _isPiecewisePdf: boolean;
      _isHistogramPdf: boolean;

    	_myForm: TForm;
      _myEditor: TComponent;

      _editEnabled: boolean;

      _paramSetsList: TQStringObjectMap;

      _currentControl: TREEdit;

      _tempVal: string;

      _updateFunctionParams: TUpdateParamsEvent;
      _setParentMenuItemsEnabled: TObjFnVoid1Bool;

      _chartType: TChartType;
      _allowedPdfTypes: TPdfTypeSet;

      _isReadOnly: boolean;

      procedure translateUI();
      procedure translateUIManual();

      procedure checkTempPoints();

      procedure showFraAcceptCancel( winControl: TWinControl );
      procedure hideFraAcceptCancel();

      procedure reChangeAccepted();
      procedure reChangeCanceled();

      procedure setChildrenReadOnly( ctrl: TWinControl );
      procedure setReadOnly( val: boolean );
      function getReadOnly(): boolean;

      procedure updateChart();

      procedure setChartType( const val: TChartType );

			procedure forceValueRefresh();

      procedure showParamSet( boxName: string; enable: boolean );
      procedure initialize( AOwner: TComponent );
      procedure restoreValuesFromTempRecord();
      
      procedure updateFormFunctionParams();

      procedure populateCboPdfType();
      function pdfTypeFromCboPdfTypeItem(): TPdfType;
      function cboPdfTypeItemFromProdType( pdfType: TPdfType ): integer;

      procedure populateAxisCbo( cbx: TComboBox );
			procedure setEditControlsEnabled( val: boolean );
      procedure setupForEdit();
			
      // property getters & setters
      procedure setMin( val: double );
      procedure setMode( val: double );
      procedure setMax( val: double );
      procedure setMean( val: double );
      procedure setStdDev( val: double );
      procedure setAlpha( val: double );
      procedure setAlpha2( val: double );
      procedure setBeta( val: double );
      procedure setLocation( val: double );
      procedure setScale( val: double );
      procedure setShape( val: double );
      procedure setZeta( val: double );
      procedure setSigma( val: double );
      procedure setN( val: integer );
      procedure setP( val: double );
      procedure setD( val: integer );
      procedure setM( val: integer );
      procedure setDMin( val: integer );
      procedure setDMax( val: integer );
      procedure setS( val: integer );
      procedure setTheta( val: double );
      procedure setA( val: double );

      function getMin(): double;
      function getMode(): double;
      function getMax(): double;
      function getMean(): double;
      function getStdDev(): double;
      function getAlpha(): double;
      function getAlpha2(): double;
      function getBeta(): double;
      function getLocation(): double;
      function getScale(): double;
      function getShape(): double;
      function getZeta(): double;
      function getSigma(): double;
      function getN(): integer;
      function getP(): double;
      function getD(): integer;
      function getM(): integer;
      function getDMin(): integer;
      function getDMax(): integer;
      function getS(): integer;
      function getTheta(): double;
      function getA(): double;

      function getXUnits(): TChartUnitType;
      procedure setXUnits( val: TChartUnitType );
      function getUnitsLocked(): boolean;
      procedure setUnitsLocked( val: boolean );

      function getEditEnabled(): boolean;

      procedure resetStoredValues();

      procedure setYUnits( val: TChartUnitType );
      function getYUnits(): TChartUnitType;

      function getAllowedPdfTypes(): TPdfTypeSet;
      procedure setAllowedPdfTypes( s: TPdfTypeSet );

      procedure drawPDF( pdf: TPdf; const xUnits: TChartUnitType; enableEdit: boolean = false );
      procedure drawRel( rel: TRelFunction; const xUnits, yUnits: TChartUnitType );

    public
      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

			procedure setForm( frm: TForm );

      procedure setUpdateParams( fn: TUpdateParamsEvent );
      procedure setSetParentMenuItemsEnabled( fn: TObjFnVoid1Bool );

      procedure setPoints( pnt: RPointArray );

      procedure drawChart( chart: TChartFunction; const chartType: TChartType; const xUnits, yUnits: TChartUnitType; enableEdit: boolean = false );

			function createPdf(): TPdf;
      function createRel(): TRelFunction;

      property min: double read getMin write setMin;
      property max: double read getMax write setMax;
      property mode: double read getMode write setMode;
      property mean: double read getMean write setMean;
      property stddev: double read getStdDev write setStdDev;
      property alpha: double read getAlpha write setAlpha;
      property alpha2: double read getAlpha2 write setAlpha2;
      property beta: double read getBeta write setBeta;
      property location: double read getLocation write setLocation;
      property scale: double read getScale write setScale;
      property shape: double read getShape write setShape;
      property zeta: double read getZeta write setZeta;
      property sigma: double read getSigma write setSigma;
      property n: integer read getN write setN;
      property p: double read getP write setP;
      property d: integer read getD write setD;
      property m: integer read getM write setM;
      property dMin: integer read getDMin write setDMin;
      property dMax: integer read getDMax write setDMax;
      property s: integer read getS write setS;
      property theta: double read getTheta write setTheta;
      property a: double read getA write setA;

      property isReadOnly: boolean read getReadOnly write setReadOnly;

      property chartType: TChartType read _chartType write setChartType;

      property unitsLocked: boolean read getUnitsLocked write setUnitsLocked;
      property editEnabled: boolean read getEditEnabled write setEditControlsEnabled;

			property xUnits: TChartUnitType read getXUnits write setXUnits;
      property yUnits: TChartUnitType read getYUnits write setYUnits;
      property minY: double read _minY write _minY;
      property maxY: double read _maxY write _maxY;

      property allowedPdfTypes: TPdfTypeSet read getAllowedPdfTypes write setAllowedPdfTypes;
    end
  ;

implementation

{$R *.dfm}

	uses
		Math,
		TypInfo,
    Clipbrd,

    RegExpr,

    MyDelphiArrayUtils,
		ARMath,
		MyDialogs,
    MyStrUtils,
    DebugWindow,
		RegExpDefs,
		ControlUtils,
    I88n
	;

  const
    DBSHOWMSG: boolean = false; // Set to true to enable debugging messages for this unit.

  constructor TFrameFunctionParams2.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();
      
			initialize( AOwner );
			
      _setParentMenuItemsEnabled := nil;

      _currentControl := nil;
    end
  ;


  procedure TFrameFunctionParams2.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.2.
      // Generation date: Thu Apr 23 12:22:15 2009
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Gunnison/libaphi_delphi_gui/function_editor/FrameFunctionParams2.dfm
      // File date: Wed Apr 22 10:45:08 2009

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          pnlUnspecified.Caption := tr( '(Select a function type)' );
          grpPoint.Caption := tr( 'Parameter' );
          lblValuePoint.Caption := tr( 'Value:' );
          grpGaussian.Caption := tr( 'Parameters' );
          lblMeanGaussian.Caption := tr( 'Mean:' );
          lblStdDevGaussian.Caption := tr( 'Standard deviation:' );
          grpTriang.Caption := tr( 'Parameters' );
          lblMinTriang.Caption := tr( 'Minimum:' );
          lblModeTriang.Caption := tr( 'Mode:' );
          lblMaxTriang.Caption := tr( 'Maximum:' );
          grpGamma.Caption := tr( 'Parameters' );
          lblAlphaGamma.Caption := tr( 'Alpha:' );
          lblBetaGamma.Caption := tr( 'Beta:' );
          grpExponential.Caption := tr( 'Parameter' );
          lblMeanExponential.Caption := tr( 'Mean:' );
          grpLogistic.Caption := tr( 'Parameters' );
          lblLocationLogistic.Caption := tr( 'Location:' );
          lblScaleLogistic.Caption := tr( 'Scale:' );
          grpPiecewise.Caption := tr( 'Parameters' );
          btnEditPiecewise.Caption := tr( 'View/Edit Points' );
          grpLoglogistic.Caption := tr( 'Parameters' );
          lblLocationLoglogistic.Caption := tr( 'Location:' );
          lblScaleLoglogistic.Caption := tr( 'Scale:' );
          lblShapeLoglogistic.Caption := tr( 'Shape:' );
          grpUniform.Caption := tr( 'Parameters' );
          lblMinUniform.Caption := tr( 'Minimum:' );
          lblMaxUniform.Caption := tr( 'Maximum:' );
          grpLognormal2.Caption := tr( 'Parameters' );
          lblZetaLognormal2.Caption := tr( 'Zeta:' );
          lblSigmaLognormal2.Caption := tr( 'Sigma'':' );
          grpBeta.Caption := tr( 'Parameters' );
          lblAlpha1Beta.Caption := tr( 'Alpha1:' );
          lblAlpha2Beta.Caption := tr( 'Alpha2:' );
          lblMinBeta.Caption := tr( 'Minimum:' );
          lblMaxBeta.Caption := tr( 'Maximum:' );
          btnConvert.Caption := tr( 'Convert to piecewise...' );
          grpDiscreteUniform.Caption := tr( 'Parameters' );
          lblDiscreteUniformMin.Caption := tr( 'Minimum:' );
          lblDiscreteUniformMax.Caption := tr( 'Maximum:' );
          grpBernoulli.Caption := tr( 'Parameters' );
          lblPBernoulli.Caption := tr( 'p:' );
          grpBinomial.Caption := tr( 'Parameters' );
          lblBinomialN.Caption := tr( 'n:' );
          lblBinomialP.Caption := tr( 'p:' );
          grpHypergeometric.Caption := tr( 'Parameters' );
          lblHypergeometricM.Caption := tr( 'M:' );
          lblHypergeometricD.Caption := tr( 'D:' );
          lblHypergeometricN.Caption := tr( 'n:' );
          grpNegBinomial.Caption := tr( 'Parameters' );
          lblSNegBinomial.Caption := tr( 's:' );
          lblPNegBinomial.Caption := tr( 'p:' );
          grpPareto.Caption := tr( 'Parameters' );
          lblThetaPareto.Caption := tr( 'Theta:' );
          lblAPareto.Caption := tr( 'a:' );
          grpInvGaussian.Caption := tr( 'Parameters' );
          lblMeanInvGaussian.Caption := tr( 'Mean:' );
          lblShapeInvGaussian.Caption := tr( 'Shape:' );

          lblPdfType.Caption := tr( 'Function type:' );
          lblXAxis.Caption := tr( 'X axis units:' );
          lblYAxis.Caption := tr( 'Y axis units:' );
        end
      ;

      // If any phrases are found that could not be automatically extracted by
      // Caption Collector, modify the following function to take care of them.
      translateUIManual();
    end
  ;


  procedure TFrameFunctionParams2.translateUIManual();
    begin
    end
  ;


  destructor TFrameFunctionParams2.destroy();
    begin
      setLength( _tempPointsHistogramPdf, 0 );
      setLength( _tempPointsPiecewisePdf, 0 );
      setLength( _tempPointsRelFunction, 0 );

      // DO NOT delete the items stored in _paramSetsList: the list does not own the objects.
      // They will be freed when the form is closed.
    	freeAndNil( _paramSetsList );
      inherited destroy();
    end
  ;

  procedure TFrameFunctionParams2.initialize(  AOwner: TComponent );
    var
      i, j: integer;
      re: TREEdit;
      grp: TGroupBox;
  	begin
      _myEditor := AOwner;

      pnlCbos.BevelInner := bvNone;
      pnlCbos.BevelOuter := bvNone;
      pnlCbos.Left := -8;
      pnlCbos.Top := -8;

      _allowedPdfTypes := [];
      populateCboPdfType();
      populateAxisCbo( cboXAxis );

      with pnlParams do
        begin
          left := 224;
          top := 0;
          width := 121;
          height := 93;
          BevelInner := bvNone;
          BevelOuter := bvNone;
        end
      ;

			showParamSet( '(Unspecified)', false );

      setLength( _tempPointsPiecewisePdf, 0 );
      setLength( _tempPointsRelFunction, 0 );
      setLength( _tempPointsHistogramPdf, 0 );

      //setEditControlsEnabled( false );

      //unitsLocked := false;

      // FIX ME: Scan all parameters to determine if negative values are allowed.

      reAlpha1Beta.InputExpression := RE_DECIMAL_INPUT;
      reAlpha2Beta.InputExpression := RE_DECIMAL_INPUT;
      reMinBeta.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reMaxBeta.InputExpression := RE_SIGNED_DECIMAL_INPUT;

      reAlphaGamma.InputExpression := RE_DECIMAL_INPUT;
      reBetaGamma.InputExpression := RE_DECIMAL_INPUT;

      reLocationLogistic.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reScaleLogistic.InputExpression := RE_DECIMAL_INPUT;

      reLocationLoglogistic.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reScaleLoglogistic.InputExpression := RE_DECIMAL_INPUT;
      reShapeLoglogistic.InputExpression := RE_DECIMAL_INPUT;

      reMaxTriang.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reMinTriang.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reModeTriang.InputExpression := RE_SIGNED_DECIMAL_INPUT;

      reMaxUniform.InputExpression := RE_SIGNED_DECIMAL_INPUT;
      reMinUniform.InputExpression := RE_SIGNED_DECIMAL_INPUT;

      reMeanExponential.InputExpression := RE_DECIMAL_INPUT;

      reMeanGaussian.InputExpression := RE_DECIMAL_INPUT;
      reStdDevGaussian.InputExpression := RE_DECIMAL_INPUT;

      reValuePoint.InputExpression := RE_SIGNED_DECIMAL_INPUT;

      reSigmaLognormal2.InputExpression := RE_DECIMAL_INPUT;
      reZetaLognormal2.InputExpression := RE_SIGNED_DECIMAL_INPUT;

      reMinDiscreteUniform.InputExpression := RE_SIGNED_INTEGER_INPUT;
      reMaxDiscreteUniform.InputExpression := RE_SIGNED_INTEGER_INPUT;

      rePBernoulli.InputExpression := RE_DECIMAL_INPUT;

      reNBinomial.InputExpression := RE_INTEGER_INPUT;
      rePBinomial.InputExpression := RE_DECIMAL_INPUT;

      reMHypergeometric.InputExpression := RE_INTEGER_INPUT;
      reDHypergeometric.InputExpression := RE_INTEGER_INPUT;
      reNHypergeometric.InputExpression := RE_INTEGER_INPUT;

      reSNegBinomial.InputExpression := RE_INTEGER_INPUT;
      rePNegBinomial.InputExpression := RE_DECIMAL_INPUT;

      reThetaPareto.InputExpression := RE_DECIMAL_INPUT;
      reAPareto.InputExpression := RE_DECIMAL_INPUT;

      reMeanInvGaussian.InputExpression := RE_DECIMAL_INPUT;
      reShapeInvGaussian.InputExpression := RE_DECIMAL_INPUT;

      resetStoredValues();

      setupForEdit();
      //-------------------------------------------

      self.Width := 153;
      pnlParams.Width := self.Width;
      pnlCbos.Width := self.Width;

      pnlCbos.Align := alTop;
      pnlParams.Align := alClient;

      horizCenterInside( btnConvert, self );
      showParamSet( '(Unspecified)', false );

      setEditControlsEnabled( true );

      //unitsLocked := true;

      populateAxisCbo( cboYAxis );

      for i := 0 to pnlParams.ControlCount - 1 do
        begin
          if( pnlParams.Controls[i] is TGroupBox ) then
            begin
              grp := pnlParams.controls[i] as TGroupBox;
              for j := 0 to grp.ControlCount - 1 do
                begin
                  if( grp.Controls[j] is TREEdit ) then
                    begin
                      re := grp.Controls[j] as TREEdit;

                      re.OnEnter := reEnter;
                      re.OnExit := reExit;
                      re.OnKeyUp := reKeyUp;

                      re.Width := 113;
                    end
                  ;
                end
              ;
            end
          ;
        end
      ;

      _currentControl := nil;

      _updateFunctionParams := nil;
    end
  ;


  function TFrameFunctionParams2.getAllowedPdfTypes(): TPdfTypeSet;
    begin
      result := _allowedPdfTypes;
    end
  ;


  procedure TFrameFunctionParams2.setAllowedPdfTypes( s: TPdfTypeSet );
    begin
      _allowedPdfTypes := s;
      populateCboPdfType();
    end
  ;


  procedure TFrameFunctionParams2.setForm( frm: TForm );
  	begin
    	_myForm := frm;
    end
  ;


  procedure TFrameFunctionParams2.populateCboPdfType();
  	begin
      // Clear out the old settings...
      //------------------------------
      cboPdfType.Clear();

      if( nil <> _paramSetsList ) then
        freeAndNil( _paramSetsList )
      ;

      // ...and start again.
      //--------------------
      _paramSetsList := TQStringObjectMap.create();
      _paramSetsList[ tr( 'Relational' ) ] := grpPiecewise;

      cboPdfType.Items.Append( tr( '(Unspecified)' ) );
      _paramSetsList[ tr( '(Unspecified)' ) ] := grpUnspecified;

      if( PdfBeta in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Beta' ) );
          _paramSetsList[ tr( 'Beta' ) ] := grpBeta;
        end
      ;

      if( PdfBetaPERT in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'BetaPERT' ) );
          _paramSetsList[ tr( 'BetaPERT' ) ] := grpTriang;
        end
      ;

      if( PdfBernoulli in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Bernoulli' ) );
          _paramSetsList[ tr( 'Bernoulli' ) ] := grpBernoulli;
        end
      ;

      if( PdfBinomial in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Binomial' ) );
          _paramSetsList[ tr( 'Binomial' ) ] := grpBinomial;
        end
      ;

      if( PdfDiscreteUniform in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Discrete uniform' ) );
          _paramSetsList[ tr( 'Discrete uniform' ) ] := grpDiscreteUniform;
        end
      ;

      if( PdfExponential in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Exponential' ) );
          _paramSetsList[ tr( 'Exponential' )] := grpExponential;
        end
      ;

      // Filed under "F" in the GUI
      if( PdfPoint in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Fixed value' ) );
          _paramSetsList[ tr( 'Fixed value' ) ] := grpPoint;
        end
      ;

      if( PdfGamma in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Gamma' ) );
          _paramSetsList[ tr( 'Gamma') ] := grpGamma;
        end
      ;

      if( PdfGaussian in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Gaussian (normal)' ) );
          _paramSetsList[ tr( 'Gaussian (normal)' ) ] := grpGaussian;
        end
      ;

      if( PdfHistogram in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Histogram' ) );
          _paramSetsList[ tr( 'Histogram' ) ] := grpPiecewise;
        end
      ;

      if( PdfHypergeometric in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Hypergeometric' ) );
          _paramSetsList[ tr( 'Hypergeometric' ) ] := grpHypergeometric;
        end
      ;

      if( PdfInverseGaussian in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Inverse Gaussian' ) );
          _paramSetsList[ tr( 'Inverse Gaussian' ) ] := grpInvGaussian;
        end
      ;

      if( PdfLogistic in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Logistic' ) );
          _paramSetsList[ tr( 'Logistic' ) ] := grpLogistic;
        end
      ;

      if( PdfLogLogistic in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Loglogistic' ) );
          _paramSetsList[ tr( 'Loglogistic') ] := grpLogLogistic;
        end
      ;

      if( PdfLognormal in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Lognormal' ) );
          _paramSetsList[ tr( 'Lognormal' ) ] := grpGaussian;

          cboPdfType.Items.Append( tr( 'Lognormal (2nd form)' ) );
          _paramSetsList[ tr( 'Lognormal (2nd form)') ] := grpLognormal2;
        end
      ;

      if( PdfNegativeBinomial in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Negative binomial' ) );
          _paramSetsList[ tr( 'Negative binomial' ) ] := grpNegBinomial;
        end
      ;

      if( PdfPareto in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Pareto' ) );
          _paramSetsList[ tr( 'Pareto' ) ] := grpPareto;
        end
      ;

      if( PdfPearson5 in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Pearson 5' ) );
          _paramSetsList[ tr( 'Pearson 5' ) ] := grpGamma;
        end
      ;

      if( PdfPiecewise in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Piecewise (general)' ) );
          _paramSetsList[ tr( 'Piecewise (general)' ) ] := grpPiecewise;
        end
      ;

      if( PdfPoisson in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Poisson' ) );
          _paramSetsList[ tr( 'Poisson' ) ] := grpExponential;
        end
      ;

      if( PdfTriangular in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Triangular' ) );
          _paramSetsList[ tr( 'Triangular' ) ] := grpTriang;
        end
      ;

      if( PdfUniform in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Uniform' ) );
          _paramSetsList[ tr( 'Uniform' ) ] := grpUniform;
        end
      ;

      if( PdfWeibull in _allowedPdfTypes ) then
        begin
          cboPdfType.Items.Append( tr( 'Weibull' ) );
          _paramSetsList[ tr( 'Weibull' ) ] := grpGamma;
        end
      ;

      cboPdfType.ItemIndex := 0;
    end
  ;


  procedure TFrameFunctionParams2.populateAxisCbo( cbx: TComboBox );
  	var
    	i: TChartUnitType;
      list: TStringList;
      j: integer;
 		begin
      list := TStringList.Create();
      for i := low( TChartUnitType ) to high( TChartUnitType ) do
      	if i > low( TChartUnitType ) then list.append( chartUnitTypeAsString(i) )
      ;
      list.Sort();

    	cbx.Clear();

      // REMEMBER: units type indices in the combo box are offset by one,
      // relative to TUnits!
      for j := 0 to list.count - 1 do
      	cbx.Items.Add( list[j] )
      ;

      list.Free();
      
      cbx.Enabled := false;
    end
  ;


  procedure TFrameFunctionParams2.restoreValuesFromTempRecord();
    begin
			self.mode := _tempRecord.mode;
			self.min := _tempRecord.min;
			self.max := _tempRecord.max;
			self.mean := _tempRecord.mean;
			self.stddev := _tempRecord.stddev;
      self.zeta := TPdfLognormal.calculateZeta( self.mean, self.stddev );
      self.sigma := TPdfLognormal.calculateSigmaPrime( self.mean, self.stddev );
			self.alpha := _tempRecord.alpha;
      self.alpha2 := _tempRecord.alpha2;
			self.beta := _tempRecord.beta;
			self.location := _tempRecord.location;
			self.scale := _tempRecord.scale;
			self.shape := _tempRecord.shape;
      self.n := _tempRecord.n;
      self.p := _tempRecord.p;
      self.m := _tempRecord.m;
      self.d := _tempRecord.d;
      self.dMin := _tempRecord.dMin;
      self.dMax := _tempRecord.dMax;
      self.s := _tempRecord.s;
      self.theta := _tempRecord.theta;
      self.a := _tempRecord.a;
    end
  ;


  procedure TFrameFunctionParams2.resetStoredValues();
    begin
      _min := NaN;
      _mode := NaN;
      _max := NaN;
      _mean := NaN;
      _stddev := NaN;
      _alpha2 := NaN;
      _alpha := NaN;
      _beta := NaN;
      _location := NaN;
      _scale := NaN;
      _shape := NaN;
      _zeta := NaN;
      _sigma := NaN;
      _n := -1;
      _p := NaN;
      _m := -1;
      _d := -1;
      _dMin := 0;
      _dMax := 0;
      _s := -1;
      _theta := NaN;
      _a := NaN;

      setLength( _tempPointsPiecewisePdf, 0 );
      setLength( _tempPointsRelFunction, 0 );
      setLength( _tempPointsHistogramPdf, 0 );
    end
  ;


  procedure TFrameFunctionParams2.drawChart( chart: TChartFunction; const chartType: TChartType; const xUnits, yUnits: TChartUnitType; enableEdit: boolean = false );
    begin
      case chartType of
        CTPdf: drawPdf( chart as TPdf, xUnits, enableEdit );
        CTRel: drawRel( chart as TRelFunction, xUnits, yUnits );
        else raise exception.Create( 'Unrecognized chart type in TFrameFunctionParams2.copyChart' );
      end;
    end
  ;


  procedure TFrameFunctionParams2.drawRel( rel: TRelFunction; const xUnits, yUnits: TChartUnitType );
    begin
      _chartType := CTRel;

      if( ( nil = rel ) or ( 0 = rel.pointCount ) ) then
        begin
          // Create some fake points
          setLength( _tempPointsRelFunction, 3 );

          _tempPointsRelFunction[0].x := 0.0;
          _tempPointsRelFunction[0].y := 100.0;

          _tempPointsRelFunction[1].x := 3.5;
          _tempPointsRelFunction[1].y := 50.0;

          _tempPointsRelFunction[2].x := 7.0;
          _tempPointsRelFunction[2].y := 25.0;
        end
      else if( 1 = rel.pointCount ) then
        begin
          setLength( _tempPointsRelFunction, 2 );

          _tempPointsRelFunction[1].x := _tempPointsRelFunction[0].x + 1;
          _tempPointsRelFunction[1].y := _tempPointsRelFunction[0].y;
        end
      else
        _tempPointsRelFunction := rel.createRecordPointArray()
      ;

      showParamSet( tr( 'Relational' ), false );
    end
  ;


	procedure TFrameFunctionParams2.showParamSet( boxName: string; enable: boolean );
  	var
    	i, j: integer;
      obj: TGroupBox;
  	begin
      // Hide all boxes...
    	for i := 0 to _paramSetsList.Count-1 do
      	begin
        	obj := _paramSetsList.itemAtIndex(i) as TGroupBox;
          obj.Visible := false;
        end
      ;

      _isRelFunction := ( tr( 'Relational' ) = boxName );
      _isPiecewisePdf := ( tr( 'Piecewise (general)' ) = boxName );
      _isHistogramPdf := ( tr( 'Histogram' ) = boxName );

      if( _isRelFunction or ( _paramSetsList.contains( tr( boxName ) ) ) ) then
        begin
          if( ( not( _isPiecewisePdf ) ) and ( not( _isHistogramPdf ) ) and ( not( _isRelFunction ) ) ) then
            begin
              fraPointEditorGrid.visible := false;

              // Then show the appropriate one
              obj := _paramSetsList[ tr( boxName) ] as TGroupBox;
              obj.Align := alNone;
              horizCenterInside( obj, self );
              obj.Top := 0;
              obj.Visible := true;

              // Enable/disable child controls
              for j := 0 to obj.controlCount-1 do
                obj.controls[j].enabled := enable
              ;

              btnConvert.Visible := false; //('grpUnspecified' <> boxName );
            end
          else
            begin
              btnConvert.Visible := false;

              fraPointEditorGrid.Align := alClient;
              fraPointEditorGrid.visible := true;

              checkTempPoints();

              updateFormFunctionParams();
            end
          ;
        end
      else
        raise exception.Create( 'Box name ' + boxName + ' does not exist' )
      ;
    end
  ;


	procedure TFrameFunctionParams2.reValueChanged( sender: TObject );
  	var
    	re: TREEdit;
      vali: integer;
      val: double;
      success: boolean;
  	begin
      dbcout( '*** base reValueChanged', DBSHOWMSG );

   		re := sender as TREEdit;

      if( re.ReadOnly ) then
        exit
      ;

      if( ( RE_INTEGER_INPUT = re.InputExpression ) or ( RE_SIGNED_INTEGER_INPUT = re.InputExpression ) ) then
        begin
          vali := -1;

          success := tryStrToInt( re.Text, vali );

          if( reMinDiscreteUniform = re ) then dMin := vali;
          if( reMaxDiscreteUniform = re ) then dMax := vali;

          if
            ( reNBinomial = re )
          or
            ( reNHypergeometric = re )
          then
            n := vali
          ;

          if( reSNegBinomial = re ) then s := vali;
          if( reMHypergeometric = re ) then m := vali;
          if( reDHypergeometric = re ) then d := vali;
        end
      else
        begin
          val := -1.0;

          success := tryStrToFloat( re.Text, val );
      
          dbcout( 'Value of ' + re.Name + ' just changed to  ' + dbFloatToStr( val ), DBSHOWMSG );

          if
            ( rePBinomial = re )
          or
            ( rePNegBinomial = re )
          or
            ( rePBernoulli = re )
          then
            p := val
          ;

          if
            ( reMinTriang = re )
          or
            ( reMinUniform = re )
          or
            ( reMinBeta = re )
          then
            min := val
          ;

          if
            ( reModeTriang = re )
          or
            ( reValuePoint = re )
          then
            mode := val
          ;

          if
            ( reMaxTriang = re )
          or
            ( reMaxUniform = re )
          or
            ( reMaxBeta = re )
          then
            max := val
          ;

          if
            ( reAlphaGamma = re )
          or
            ( reAlpha1Beta = re)
          then
            alpha := val
          ;

          if( reAlpha2Beta = re ) then alpha2 := val;

          if ( reBetaGamma = re ) then beta := val;

          if
            ( reMeanGaussian = re )
          or
            ( reMeanExponential = re )
          or
            ( reMeanInvGaussian = re )
          then
            begin
              mean := val;
              zeta := TPdfLognormal.calculateZeta( mean, stddev );
            end
          ;

          if( reStdDevGaussian = re ) then
            begin
              stddev := val;
              sigma := TPdfLognormal.calculateSigmaPrime( mean, stddev );
              zeta := TPdfLognormal.calculateZeta( mean, stddev );
            end
          ;


          if( reZetaLognormal2 = re ) then
            begin
              zeta := val;
              mean := TPdfLognormal.calculateMean( zeta, sigma );
              stddev := TPdfLognormal.calculateStddev( zeta, sigma );
            end
          ;

          if( reSigmaLognormal2 = re ) then
            begin
              sigma := val;
              stddev := TPdfLognormal.calculateStddev( zeta, sigma );
              mean := TPdfLognormal.calculateMean( zeta, sigma );
            end
          ;


          if
            ( reLocationLogistic = re)
          or
            ( reLocationLoglogistic = re )
          then
            location := val
          ;

          if
            ( reScaleLogistic = re )
          or
            ( reScaleLoglogistic = re )
          then
            scale := val
          ;

          if
            ( reShapeLoglogistic = re )
          or
            ( reShapeInvGaussian = re )
          then
            shape := val
          ;

          if( reThetaPareto = re ) then theta := val;
          if( reAPareto = re ) then a := val;
        end
      ;

      if( not success ) then
      	re.text := ''
      ;
    end
  ;

  procedure TFrameFunctionParams2.setupForEdit();
  	begin
      forceValueRefresh();
      with _tempRecord do
        begin
          mode := self.mode;
          min := self.min;
          max := self.max;
          alpha := self.alpha;
          alpha2 := self.alpha2;
          beta := self.beta;
          location := self.location;
          scale := self.location;
          shape := self.shape;    
          mean := self.mean;
          stddev := self.stddev;
          n := self.n;
          p := self.p;
          m := self.m;
          d := self.d;
          dMin := self.dMin;
          dMax := self.dMax;
          s := self.s;
          theta := self.theta;
          a := self.a;

          pdfType := pdfTypeFromCboPdfTypeItem();
          pdfUnits := chartUnitTypeFromString( self.cboXAxis.Items[ self.cboXAxis.itemIndex ] );
        end
      ;
    end
  ;



  // Forces a refresh of all stored values from active/visible RegExp line editors.
  procedure TFrameFunctionParams2.forceValueRefresh();
    var
      i, j: integer;
      obj: TGroupbox;
    begin
      // For every control on the form...
      for i := 0 to pnlParams.ControlCount-1 do
        begin

          // ...is the control the visible, active group box?
          if( pnlParams.Controls[i] is TGroupBox ) and ( pnlParams.Controls[i].visible ) then
            begin

              // If yes, check every control in that group box...
              obj := pnlParams.Controls[i] as TGroupbox;
              for j := 0 to obj.controlCount-1 do
                begin
                  // ...and store values from each of the controls that's an editor box.
                  if( obj.controls[j] is TREEdit ) then reValueChanged( obj.Controls[j] );
                end
              ;
            end
        end
      ;
    end
  ;



  procedure TFrameFunctionParams2.cboPdfTypeChange(Sender: TObject);
    var
      key: string;
    begin
      key := cboPdfType.Items[cboPdfType.ItemIndex];

      showParamSet( key, editEnabled );

      if( isNumber( _min ) ) then
        begin
          reMinTriang.Text := uiFloatToStr( _min );
          reMinUniform.Text := uiFloatToStr( _min );
          reMinBeta.Text := uiFloatToStr( _min );
        end
      else
        begin
          reMinTriang.Text := '';
          reMinUniform.Text := '';
          reMinBeta.Text := '';
        end
      ;

      if( isNumber( _mode ) ) then
        begin
          reModeTriang.Text := uiFloatToStr( _mode );
          reValuePoint.Text := uiFloatToStr( _mode );
        end
      else
        begin
          reModeTriang.Text := '';
          reValuePoint.text := '';
        end
      ;

      if( isNumber( _max ) ) then
        begin
          reMaxTriang.Text := uiFloatToStr( _max );
          reMaxUniform.Text := uiFloatToStr( _max );
          reMaxBeta.Text := uiFloatToStr( _max );
        end
      else
        begin
          reMaxTriang.Text := '';
          reMaxUniform.Text := '';
          reMaxBeta.Text := '';
        end
      ;

      if( isNumber( _mean ) ) then
        begin
          reMeanGaussian.Text := uiFloatToStr( _mean );
          reMeanExponential.Text := uiFloatToStr( _mean );
          reMeanInvGaussian.Text := uiFloatToStr( _mean );
        end
      else
        begin
          reMeanGaussian.Text := '';
          reMeanExponential.Text := '';
          reMeanInvGaussian.Text := '';
        end
      ;

      if( isNumber( _stddev ) ) then
        reStddevGaussian.Text := uiFloatToStr( _stddev ) else reStddevGaussian.Text := ''
      ;

      if( isNumber( _alpha ) ) then
        begin
          reAlpha1Beta.Text := uiFloatToStr( _alpha );
          reAlphaGamma.Text := uiFloatToStr( _alpha );
        end
      else
        begin
          reAlpha1Beta.Text := '';
          reAlphaGamma.Text := '';
        end
      ;

      if( isNumber( _alpha2 ) ) then
        reAlpha2Beta.Text := uiFloatToStr( _alpha2 )
      else
        reAlpha2Beta.Text := '';
      ;

      if( isNumber( _beta ) ) then
        reBetaGamma.Text := uiFloatToStr( _beta )
      else
        reBetaGamma.Text := ''
      ;


      if( isNumber( _location ) ) then
        begin
          reLocationLogLogistic.Text := uiFloatToStr( _location );
          reLocationLogistic.Text := uiFloatToStr( _location );
        end
      else
        begin
          reLocationLogLogistic.Text := '';
          reLocationLogistic.Text := '';
        end
      ;

      if( isNumber( _scale ) ) then
        begin
          reScaleLogistic.Text := uiFloatToStr( _scale );
          reScaleLoglogistic.Text := uiFloatToStr( _scale );
        end
      else
        begin
          reScaleLogistic.Text := '';
          reScaleLoglogistic.Text := '';
        end
      ;

      if( isNumber( _shape ) ) then
        begin
          reShapeLoglogistic.Text := uiFloatToStr( _shape );
          reShapeInvGaussian.Text := uiFloatToStr( _shape );
        end
      else
        begin
          reShapeLoglogistic.Text := '';
          reShapeInvGaussian.Text := '';
        end
      ;

      if( isNumber( _zeta ) ) then
        reZetaLognormal2.Text := uiFloatToStr( _zeta )
      else
        reZetaLognormal2.Text := ''
      ;

      if( isNumber( _sigma ) ) then
        reSigmaLognormal2.Text := uiFloatToStr( _sigma )
      else
        reSigmaLognormal2.Text := ''
      ;

      if( isProportion( _p ) ) then
        begin
          rePBernoulli.Text := uiFloatToStr( _p );
          rePBinomial.Text := uiFloatToStr( _p );
          rePNegBinomial.Text := uiFloatToStr( _p );
        end
      else
        begin
          rePBernoulli.Text := '';
          rePBinomial.Text := '';
          rePNegBinomial.Text := '';
        end
      ;

      if( 0 <= _n ) then
        begin
          reNBinomial.Text := intToStr( _n );
          reNHypergeometric.Text := intToStr( _n );
        end
      else
        begin
          reNBinomial.Text := '';
          reNHypergeometric.Text := '';
        end
      ;

      if( 0 <= _d ) then
        reDHypergeometric.Text := intToStr( _d )
      else
        reDHypergeometric.Text := ''
      ;

      if( 0 <= _m ) then
        reMHypergeometric.Text := intToStr( _m )
      else
        reMHypergeometric.Text := ''
      ;

      if( isNumber( _theta ) ) then
        reThetaPareto.text := uiFloatToStr( _theta )
      else
        reThetaPareto.Text := ''
      ;

      if( isNumber( _a ) ) then
        reAPareto.Text := uiFloatToStr( _a )
      else
        reAPareto.Text := ''
      ;

      reMinDiscreteUniform.Text := intToStr( _dMin );
      reMaxDiscreteUniform.Text := intToStr( _dMax );

      updateFormFunctionParams();

      if( nil <> @_setParentMenuItemsEnabled ) then
        _setParentMenuItemsEnabled( true )
      ;
    end
  ;



  procedure TFrameFunctionParams2.showFraAcceptCancel( winControl: TWinControl );
    begin
      fraAcceptCancel.Parent := winControl.Parent;

      winControl.Width := 65;
      fraAcceptCancel.Top := winControl.Top;
      fraAcceptCancel.Left := winControl.Left + winControl.Width + 1;

      fraAcceptCancel.Visible := true;

      cboPdfType.Enabled := false;
      cboXAxis.Enabled := false;
      cboYAxis.Enabled := false;
      btnConvert.Enabled := false;
    end
  ;


  procedure TFrameFunctionParams2.hideFraAcceptCancel();
    begin
      fraAcceptCancel.Visible := false;

      cboPdfType.Enabled := true;
      cboXAxis.Enabled := not( unitsLocked );
      cboYAxis.Enabled := not( unitsLocked );

      updateFormFunctionParams();
    end
  ;


  procedure TFrameFunctionParams2.reEnter( Sender: TObject);
    var
      winControl: TREEdit;
    begin
      winControl := sender as TREEdit;

      if( winControl.ReadOnly ) then
        exit
      ;

      if( nil <> @_setParentMenuItemsEnabled ) then
        _setParentMenuItemsEnabled( false )
      ;

      if( fraAcceptCancel.Visible ) then
        reChangeAccepted()
      ;

      dbcout( 're entered: ' + winControl.Name, DBSHOWMSG );

      _tempVal := winControl.Text;

      _currentControl := winControl;

      showFraAcceptCancel( winControl );
    end
  ;


  procedure TFrameFunctionParams2.reExit( Sender: TObject);
    var
      ctrl: TREEdit;
    begin
      ctrl := sender as TREEdit;

      if( ctrl.ReadOnly ) then
        exit
      ;

      if( fraAcceptCancel.Visible ) then
        begin
          hideFraAcceptCancel();
          reChangeAccepted();
        end
      ;

      dbcout( 'Exiting ' + ctrl.Name, DBSHOWMSG );
      ctrl.Width := 113;

      if( nil <> @_setParentMenuItemsEnabled ) then
        _setParentMenuItemsEnabled( true )
      ;
    end
  ;


  procedure TFrameFunctionParams2.reChangeAccepted();
    begin
      if( nil <> _currentControl ) then
        begin
          dbcout( 'Change accepted in ' + _currentControl.Name, DBSHOWMSG );
          reValueChanged( _currentControl );
        end
      ;

      updateFormFunctionParams();
    end
  ;


  procedure TFrameFunctionParams2.reChangeCanceled();
    begin
      dbcout( 'Cancel clicked', DBSHOWMSG );
      dbcout( 'Change rejected in ' + _currentControl.Name, DBSHOWMSG );
      _currentControl.Text := _tempVal;
    end
  ;


  procedure TFrameFunctionParams2.fraAcceptCancelbtnAcceptClick( Sender: TObject );
    begin
      inherited;
      dbcout( 'Accept clicked', DBSHOWMSG );
      hideFraAcceptCancel();
      dbcout( 'Accepting change in ' + _currentControl.Name, DBSHOWMSG );
      reChangeAccepted();
      _currentControl.Parent.SetFocus();
    end
  ;


  procedure TFrameFunctionParams2.fraAcceptCancelbtnCancelClick( Sender: TObject );
    begin
      inherited;
      hideFraAcceptCancel();
      dbcout( 'Canceling change in ' + _currentControl.Name, DBSHOWMSG );
      reChangeCanceled();
      _currentControl.Parent.SetFocus();
    end
  ;


  procedure TFrameFunctionParams2.reKeyUp( Sender: TObject; var Key: Word; Shift: TShiftState );
    begin
      //inherited;

      if( (sender as TREEdit).ReadOnly ) then
        exit
      ;

      if( 13 = key ) then
        begin
          _currentControl := sender as TREEdit;
          dbcout( 'Enter in ' + _currentControl.Name, DBSHOWMSG );
          fraAcceptCancelbtnAcceptClick( nil );
        end
      else if( 27 = key ) then
        begin
          _currentControl := sender as TREEdit;
          dbcout( 'Cancel in ' + _currentControl.Name, DBSHOWMSG );
          fraAcceptCancelbtnCancelClick( nil );
        end
      ;

      inherited;
    end
  ;


  procedure TFrameFunctionParams2.setUpdateParams( fn: TUpdateParamsEvent );
    begin
      _updateFunctionParams := fn;
      updateFormFunctionParams();
    end
  ;


  procedure TFrameFunctionParams2.setSetParentMenuItemsEnabled( fn: TObjFnVoid1Bool );
    begin
      _setParentMenuItemsEnabled := fn;
      fraPointEditorGrid.setSetParentMenuItemsEnabled( fn );
    end
  ;


  procedure TFrameFunctionParams2.updateFormFunctionParams();
    var
      fn: TChartFunction;
    begin
      fn := nil;
      
      case chartType of
        CTPdf:
          begin
            fn := createPDF();
            if( fn is TPdfContinuous ) then
              btnConvert.Enabled := ( not( fraAcceptCancel.Visible ) and ( (fn as TPdfContinuous).canConvertToPiecewise ) )
            else
              btnConvert.Enabled := false
            ;
          end
        ;
        CTRel:
          begin
            fn := createRel();
            btnConvert.Enabled := false;
          end
        ;
        else
          fn := nil
        ;
      end;

      dbcout( 'Trying to debug function:', DBSHOWMSG );
      if( DBSHOWMSG and ( nil <> fn ) ) then
        fn.debug()
      ;
      dbcout( 'Done debugging', DBSHOWMSG );

      if( nil <> @_updateFunctionParams ) then
        _updateFunctionParams( self, fn )
      ;

      freeAndNil( fn );
    end
  ;



  function TFrameFunctionParams2.createRel(): TRelFunction;
    var
      rel: TRelFunction;
    begin
      rel := TRelFunction.create( _tempPointsRelFunction, xUnits, yUnits );
      result := rel;
    end
  ;


  procedure TFrameFunctionParams2.fraPointEditorGridbtnOKClick( Sender: TObject );
    begin
      inherited;
      fraPointEditorGrid.btnOKClick(Sender);

      cboPdfType.Enabled := true;
      cboXAxis.Enabled := not( unitsLocked );
      cboYAxis.Enabled := not( unitsLocked );

      updateChart();
    end
  ;


  procedure TFrameFunctionParams2.updateChart();
    var
      i: integer;
    begin
      if( _isPiecewisePdf ) then
        setLength( _tempPointsPiecewisePdf, fraPointEditorGrid.stgPoints.RowCount - 1 ) // subtract 1 for the header row
      else if( _isRelFunction ) then
        setLength( _tempPointsRelFunction, fraPointEditorGrid.stgPoints.RowCount - 1 )
      else if( _isHistogramPdf ) then
        setLength( _tempPointsHistogramPdf, fraPointEditorGrid.stgPoints.RowCount - 1 )
      else
        // do nothing
      ;

      if( CTRel = _chartType ) then
        begin
          // Check min and max constraints.
          for i := 0 to length( _tempPointsRelFunction ) - 1 do
            begin
              if
                ( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] ) < minY )
              or
                ( ( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] ) > maxY ) and ( maxY > 0.0 ) )
              or
                ( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, i+1] ) < 0 ) // all X values must be 0 or greater
              then
                begin
                  msgOK(
                    tr( 'At least one value is outside the range allowed for this function' ) + '.'
                     //+ '(' +  uiFloatToStr( minY ) + ' ' + tr( 'to' ) + ' ' + uiFloatToStr( maxY ) + ').'
                     + '  ' + tr( 'All such values will be adjusted.' ),
                    tr( 'Invalid values' ),
                    IMGWarning,
                    _myForm
                  );
                  break;
                end
              ;
            end
          ;
        end
      ;

      if( _isPiecewisePdf ) then
        begin
          for i := 0 to length( _tempPointsPiecewisePdf ) - 1 do
            begin
              _tempPointsPiecewisePdf[i].x := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, i+1] );
              _tempPointsPiecewisePdf[i].y := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] );
            end
          ;
        end
      else if( _isHistogramPdf ) then
        begin
          for i := 0 to length( _tempPointsHistogramPdf ) - 1 do
            begin
              _tempPointsHistogramPdf[i].range := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, i+1] );
              _tempPointsHistogramPdf[i].count := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] );
            end
          ;
        end
      else if( _isRelFunction ) then
        begin
          for i := 0 to length( _tempPointsRelFunction ) - 1 do
            begin
              _tempPointsRelFunction[i].x := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, i+1] );
              _tempPointsRelFunction[i].y := uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] );

              // Check X restrictions for REL functions
              if( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, i+1] ) < 0 ) then
                begin
                  _tempPointsRelFunction[i].x := 0;
                  fraPointEditorGrid.stgPoints.Cells[0, i+1] := uiFloatToStr( 0 );
                end
              ;

              // Check Y restrictions for REL functions
              if( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] ) < minY ) then
                begin
                  _tempPointsRelFunction[i].y := minY;
                  fraPointEditorGrid.stgPoints.Cells[1, i+1] := uiFloatToStr( minY );
                end
              else if( ( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[1, i+1] ) > maxY ) and ( maxY > 0.0 ) ) then
                begin
                  _tempPointsRelFunction[i].y := maxY;
                  fraPointEditorGrid.stgPoints.Cells[1, i+1] := uiFloatToStr( maxY );
                end
              ;
            end
          ;
        end
      else
        // Do nothing
      ;

      if( CTPdf = _chartType ) then
        begin
          if( _isPiecewisePdf ) then
            begin
              if( TPdfPiecewise.standardize( _tempPointsPiecewisePdf ) ) then
                fraPointEditorGrid.setPointsPiecewisePdf( _tempPointsPiecewisePdf )
              ;
            end
          else if( _isHistogramPdf ) then
            begin
              if( TPdfHistogram.standardize( _tempPointsHistogramPdf ) ) then
                fraPointEditorGrid.setPointsHistogramPdf( _tempPointsHistogramPdf )
              ;
            end
          ;
        end
      ;

      updateFormFunctionParams();
    end
  ;


  procedure TFrameFunctionParams2.fraPointEditorGridbtnCancelClick( Sender: TObject );
    begin
      inherited;
      fraPointEditorGrid.btnCancelClick(Sender);

      cboPdfType.Enabled := true;
      cboXAxis.Enabled := not( unitsLocked );
      cboYAxis.Enabled := not( _unitsLocked );

      // If the user clicked cancel, restore the points
      // the way the were before they were messed with.
      // Then set the appropriate points (checkTempPoints
      // handles this, too).
      checkTempPoints();
    end
  ;


  procedure TFrameFunctionParams2.fraPointEditorGridstgPointsEnter( Sender: TObject );
    begin
      fraPointEditorGrid.stgPointsEnter( sender );

      cboPdfType.Enabled := false;
      cboXAxis.Enabled := false;
      cboYAxis.Enabled := false;
    end
  ;


  procedure TFrameFunctionParams2.checkTempPoints();
    begin
      if( CTPdf = _chartType ) then
        begin
          // Create some fake points for the appropriate distribution type
          if( _isHistogramPdf and ( 2 > length( _tempPointsHistogramPdf ) )  ) then
            begin
              setLength( _tempPointsHistogramPdf, 3 );

              _tempPointsHistogramPdf[0].range := 0.0;
              _tempPointsHistogramPdf[0].count := 3;

              _tempPointsHistogramPdf[1].range := 1.0;
              _tempPointsHistogramPdf[1].count := 1;

              _tempPointsHistogramPdf[2].range := 2.0;
              _tempPointsHistogramPdf[2].count := 0;
            end
          else if( _isPiecewisePdf and ( 3 > length( _tempPointsPiecewisePdf ) ) ) then
            begin
              setLength( _tempPointsPiecewisePdf, 3 );

              _tempPointsPiecewisePdf[0].x := 0.0;
              _tempPointsPiecewisePdf[0].y := 0.0;

              _tempPointsPiecewisePdf[1].x := 3.0;
              _tempPointsPiecewisePdf[1].y := 0.4;

              _tempPointsPiecewisePdf[2].x := 5.0;
              _tempPointsPiecewisePdf[2].y := 0.0;
            end
          ;
        end
      else if( CTRel = _chartType ) then
        begin
          if( 0 = length( _tempPointsRelFunction ) ) then
            begin
              // Create some fake points
              setLength( _tempPointsRelFunction, 3 );

              _tempPointsRelFunction[0].x := 0.0;
              _tempPointsRelFunction[0].y := 100.0;

              _tempPointsRelFunction[1].x := 3.5;
              _tempPointsRelFunction[1].y := 50.0;

              _tempPointsRelFunction[2].x := 7.0;
              _tempPointsRelFunction[2].y := 25.0;
            end
          else if( 1 = length( _tempPointsRelFunction ) ) then
            begin
              setLength( _tempPointsRelFunction, 2 );

              _tempPointsRelFunction[1].x := _tempPointsRelFunction[0].x + 1;
              _tempPointsRelFunction[1].y := _tempPointsRelFunction[0].y;
            end
          else
            // 2 or more points are fine: don't do anything.
          ;
        end
      ;

      if( _isRelFunction ) then
        fraPointEditorGrid.setPointsRelFunction( _tempPointsRelFunction )
      else if( _isPiecewisePdf ) then
        fraPointEditorGrid.setPointsPiecewisePdf( _tempPointsPiecewisePdf )
      else if( _isHistogramPdf ) then
        fraPointEditorGrid.setPointsHistogramPdf( _tempPointsHistogramPdf )
      else
        // Do nothing
      ;
    end
  ;

  procedure TFrameFunctionParams2.setPoints( pnt: RPointArray );
    var
      i: integer;
    begin
      if( _isRelFunction ) then
        begin
          setLength( _tempPointsRelFunction, 0 );
          _tempPointsRelFunction := pnt;
          fraPointEditorGrid.setPointsRelFunction( _tempPointsRelFunction );
        end
      else if( _isPiecewisePdf ) then
        begin
          setLength( _tempPointsPiecewisePdf, 0 );
          _tempPointsPiecewisePdf := pnt;
          fraPointEditorGrid.setPointsPiecewisePdf( _tempPointsPiecewisePdf );
        end
      else if( _isHistogramPdf ) then
        begin
          setLength( _tempPointsHistogramPdf, 0 );
          setLength( _tempPointsHistogramPdf, length( pnt ) );
          for i := 0 to length( pnt ) - 1 do
            begin
              _tempPointsHistogramPdf[i].range := pnt[i].x;
              _tempPointsHistogramPdf[i].count := pnt[i].y;
              _tempPointsHistogramPdf[i].density := -1.0;
            end
          ;
          fraPointEditorGrid.setPointsHistogramPdf( _tempPointsHistogramPdf );
        end
      else
        // Do nothing
      ;
    end
  ;


  procedure TFrameFunctionParams2.fraPointEditorGridstgPointsKeyDown(
        Sender: TObject;
        var Key: Word;
        Shift: TShiftState
      );
    begin
      inherited;
      
      dbcout( key, DBSHOWMSG );

      // FIX ME??? For some reason, keyDown doesn't seem to work in fraPointEditorGrid,
      // even though that's where the tab and down arrow key handling should logically take place.
      // These keys are handled here as a work-around.
      if( key in [9, 40] ) then
        begin
          if( ( fraPointEditorGrid.stgPoints.Col = fraPointEditorGrid.stgPoints.ColCount - 1 ) and ( fraPointEditorGrid.stgPoints.Row = fraPointEditorGrid.stgPoints.RowCount - 1 ) ) then
            begin
              fraPointEditorGrid.stgPoints.RowCount := fraPointEditorGrid.stgPoints.RowCount + 1;
              if( 1 < fraPointEditorGrid.stgPoints.RowCount ) then
                begin
                  fraPointEditorGrid.stgPoints.Cells[0, fraPointEditorGrid.stgPoints.RowCount - 1 ] := uiFloatToStr( uiStrToFloat( fraPointEditorGrid.stgPoints.Cells[0, fraPointEditorGrid.stgPoints.RowCount - 2 ] ) + 1 );
                  fraPointEditorGrid.stgPoints.Cells[1, fraPointEditorGrid.stgPoints.RowCount - 1 ] := fraPointEditorGrid.stgPoints.Cells[1, fraPointEditorGrid.stgPoints.RowCount - 2 ];
                end
              ;
            end
          ;
        end
      else if( 13 = key ) then
        begin
          fraPointEditorGrid.SetFocus();
          fraPointEditorGridbtnOKClick( nil );
        end
      else if( 27 = key ) then
        begin
          fraPointEditorGrid.SetFocus();
          fraPointEditorGridbtnCancelClick( nil );
        end
      ;
    end
  ;


  procedure TFrameFunctionParams2.setChildrenReadOnly( ctrl: TWinControl );
  	var
    	i: integer;
      wc: TWinControl;
    begin
      if( ctrl is TREEdit ) then
        ( ctrl as TREEdit ).ReadOnly := _isReadOnly
      (*
      else if( ctrl is TGroupBox ) then
        // do nothing
      else if( ctrl is TPanel ) then
        // do nothing
      else
    	  ctrl.enabled := not( _isReadOnly )
      *)
      ;

    	for i := 0 to ctrl.controlCount - 1 do
      	begin
          if( ctrl.controls[i] is TREEdit ) then
            ( ctrl.Controls[i] as TREEdit ).readOnly := _isReadOnly
          (*
          else if( ctrl is TComboBox ) then
            ( ctrl.Controls[i] as TComboBox ).Enabled := not( _isReadOnly )
          else if( ctrl is TPanel ) then
            // do nothing
          else
        	  ctrl.Controls[i].Enabled := not( _isReadOnly )
          *)
          ;

          if( ctrl.Controls[i] is TWinControl ) then
            begin
              wc := ctrl.Controls[i] as TWinControl;
              setChildrenReadOnly( wc );
            end
          ;
        end
      ;
    end
  ;


  procedure TFrameFunctionParams2.setReadOnly( val: boolean );
    begin
      _isReadOnly := val;

      setChildrenReadOnly( self );

      fraAcceptCancel.Enabled := not( _isReadOnly );
      cboPdfType.Enabled := not( _isReadOnly );

      // Even though children might be enabled, these controls shouldn't be.
      fraPointEditorGrid.btnOK.Enabled := false;
      fraPointEditorGrid.btnCancel.Enabled := false;

      // Even though children might be disabled, these controls shouldn't be.
      lblPdfType.Enabled := true;
      lblXAxis.Enabled := true;
      lblYAxis.Enabled := true;

      // If units are locked, these shouldn't be enabled either.
      // Otherwise the user can mess with stuff...
      if( unitsLocked ) then
        begin
          cboXAxis.Enabled := false;
          cboYAxis.Enabled := false;
        end
      else
        begin
          cboXAxis.Enabled := not( _isReadOnly );
          cboYAxis.Enabled := not( _isReadOnly );
        end
      ;
    end
  ;


  function TFrameFunctionParams2.getReadOnly(): boolean;
    begin
      result := _isReadOnly;
    end
  ;


  procedure TFrameFunctionParams2.setChartType( const val: TChartType );
    begin
      _chartType := val;
    
      case val of
        CTRel:
          begin
            //showParamSet( tr( 'Piecewise (general)' ), not( _isReadOnly ) );  // For reasons that aren't entirely clear, 'Piecewise (general)' does need to be translated...
            showParamSet( tr( 'Relational' ), not( _isReadOnly ) );

            lblYAxis.Visible := true;
            lblYAxis.Top := lblPdfType.Top;
            lblYAxis.Left := lblPdfType.Left;

            cboYAxis.Visible := true;
            cboYAxis.Top := cboPdfType.Top;
            cboYAxis.Left := cboPdfType.Left;

            lblPdfType.Visible := false;
            cboPdfType.Visible := false;
          end
        ;
        else
          begin
            showParamSet( '(Unspecified)', not( _isReadOnly ) );

            lblYAxis.Visible := false;
            cboYAxis.Visible := false;

            lblPdfType.Visible := true;
            cboPdfType.Visible := true;
          end
        ;
      end;
    end
  ;


  function TFrameFunctionParams2.getYUnits(): TChartUnitType;
    begin
      result := chartUnitTypeFromString( self.cboYAxis.Items[ self.cboYAxis.itemIndex ] );
    end
  ;


  procedure TFrameFunctionParams2.setYUnits( val: TChartUnitType );
    begin
      cboYAxis.ItemIndex := cboYAxis.Items.IndexOf( chartUnitTypeAsString( val ) );
    end
  ;


  procedure TFrameFunctionParams2.setUnitsLocked( val: boolean );
    begin
      _unitsLocked := val;
      cboXAxis.Enabled := not( _unitsLocked );
      cboYAxis.Enabled := not( _unitsLocked );
    end
  ;


  procedure TFrameFunctionParams2.btnEditPiecewiseClick(Sender: TObject);
    begin
      // do nothing
    end
  ;


	procedure TFrameFunctionParams2.setEditControlsEnabled( val: boolean );
  	var
    	i, j: integer;
      obj: TGroupbox;
  	begin
    	cboPdfType.Enabled := val;

      if( unitsLocked ) then
        begin
      	  cboXAxis.Enabled := false;
          cboYAxis.Enabled := false;
        end
      else
        begin
      	  cboXAxis.Enabled := val;
          cboYAxis.Enabled := val;
        end
      ;

      for i := 0 to _paramSetsList.count-1 do
      	begin
       		obj := _paramSetsList.itemAtIndex(i) as TGroupBox;
          obj.enabled := val;
          for j := 0 to obj.controlCount-1 do
          	begin
            	obj.controls[j].enabled := val;
            end
          ;
        end
      ;

      _editEnabled := val;
    end
  ;


	procedure TFrameFunctionParams2.drawPDF( pdf: TPdf; const xUnits: TChartUnitType; enableEdit: boolean = false );
    var
      pdfType: TPdfType;
  	begin
      //if( enableEdit ) then cboPdfType.Enabled := true;

      if( nil = pdf ) then
        pdfType := PdfUndefined
      else
        pdfType := pdf.pdfType
      ;

      if( editEnabled ) then
      	begin
          msgOK(
          	tr( 'Please finish editing the current probability density function before attempting this operation.' ),
          	tr( 'Cannot set PDF' ),
            IMGCritical,
            _myForm
    			);
          cboPdfType.SetFocus();
        	exit;
      	end
      ;

      if( enableEdit ) then
      	setupForEdit()
      ;

      cboPdfType.ItemIndex := cboPdfTypeItemFromProdType( pdfType );
      cboXAxis.ItemIndex := cboXAxis.Items.IndexOf( chartUnitTypeAsString( xUnits ) );
      resetStoredValues();

    	case pdfType of
        // Undefined type
        //---------------
        PdfUndefined:
          begin
            showParamSet( '(Unspecified)', false );
          end
        ;
        // Continuous types
        //-----------------
        PdfBeta:
        	begin
          	showParamSet( 'Beta', false );

            _min := (pdf as TPdfBeta).min;

             reMinBeta.Text := uiFloatToStr( _min );
            _max := (pdf as TPdfBeta).max;
            reMaxBeta.Text := uiFloatToStr( _max );
            _alpha := (pdf as TPdfBeta).alpha1;
            reAlpha1Beta.Text := uiFloatToStr( _alpha );
            _alpha2 := (pdf as TPdfBeta).alpha2;
            reAlpha2Beta.Text := uiFloatToStr( _alpha2 );
          end
        ;
        PdfBetaPERT:
        	begin
          	showParamSet( 'BetaPERT', false );

            _min := (pdf as TPdfBetaPERT).min;
            reMinTriang.Text := uiFloatToStr( _min );
            _mode := (pdf as TPdfBetaPERT).mode;
            reModeTriang.Text := uiFloatToStr( _mode );
            _max := (pdf as TPdfBetaPERT).max;
            reMaxTriang.Text := uiFloatToStr( _max );
          end
        ;
        PdfExponential:
        	begin
          	showParamSet( 'Exponential', false );

            _mean := (pdf as TPdfExponential).mean;
            reMeanExponential.Text := uiFloatToStr( _mean );
          end
        ;
        PdfGamma:
        	begin
          	showParamSet( 'Gamma', false );

            _alpha := (pdf as TPdfGamma).alpha;
            reAlphaGamma.Text := uiFloatToStr( _alpha );
            _beta := (pdf as TPdfGamma).beta;
            reBetaGamma.Text := uiFloatToStr( _beta );
          end
        ;
      	PdfGaussian:
        	begin
          	showParamSet( 'Gaussian (normal)', false );

            _mean := (pdf as TPdfGaussian).mean;
            reMeanGaussian.Text := uiFloatToStr( _mean );
            _stddev := (pdf as TPdfGaussian).stddev;
            reStddevGaussian.Text := uiFloatToStr( _stddev );
          end
        ;
        PdfHistogram:
          begin
            _tempPointsHistogramPdf := (pdf as TPdfHistogram).createHistogramPointArray();
            showParamSet( tr( 'Histogram' ), false );
          end
        ;
        PdfInverseGaussian:
          begin
          	showParamSet( 'Inverse Gaussian', false );

            _mean := (pdf as TPdfInverseGaussian).mean;
            reMeanInvGaussian.Text := uiFloatToStr( _mean );
            _shape := (pdf as TPdfInverseGaussian).shape;
            reShapeInvGaussian.Text := uiFloatToStr( _shape );
          end
        ;
        PdfLogistic:
        	begin
          	showParamSet( 'Logistic', false );

            _location := (pdf as TPdfLogistic).location;
            reLocationLogistic.Text := uiFloatToStr( _location );
            _scale := (pdf as TPdfLogistic).scale;
            reScaleLogistic.Text := uiFloatToStr( _scale );
          end
        ;
        PdfLogLogistic:
        	begin
          	showParamSet( 'Loglogistic', false );

            _location := (pdf as TPdfLogLogistic).location;
            reLocationLoglogistic.Text := uiFloatToStr( _location );
            _scale := (pdf as TPdfLogLogistic).scale;
            reScaleLoglogistic.Text := uiFloatToStr( _scale );
            _shape := (pdf as TPdfLogLogistic).shape;
            reShapeLoglogistic.Text := uiFloatToStr( _shape );
          end
        ;
        PdfLognormal:
        	begin
          	showParamSet( 'Lognormal', false );

            _mean := (pdf as TPdfLognormal).mean;
            reMeanGaussian.Text := uiFloatToStr( _mean );
            _stddev := (pdf as TPdfLognormal).stddev;
            reStddevGaussian.Text := uiFloatToStr( _stddev );

            _zeta := (pdf as TPdfLognormal).zeta;
            reZetaLognormal2.Text := uiFloatToStr( _zeta );
            _sigma := (pdf as TPdfLognormal).sigma;
            reSigmaLognormal2.Text := uiFloatToStr( _sigma );
          end
        ;
        PdfPareto:
          begin
            showParamSet( 'Pareto', false );

            _theta := (pdf as TPdfPareto).theta;
            reThetaPareto.Text := uiFloatToStr( _theta );
            _a := (pdf as TPdfPareto).a;
            reAPareto.Text := uiFloatToStr( _a );
          end
        ;
        PdfPearson5:
        	begin
          	showParamSet( 'Pearson 5', false );

            _alpha := (pdf as TPdfPearson5).alpha;
            reAlphaGamma.Text := uiFloatToStr( _alpha );
            _beta := (pdf as TPdfPearson5).beta;
            reBetaGamma.Text := uiFloatToStr( _beta );
          end
        ;
        PdfPiecewise:
        	begin
            // Build the function before showing the parameter set,
            // to allow the various pieces to get the point values right.
            if( 3 > (pdf as TPdfPiecewise).pointCount ) then
              begin
                _tempPointsPiecewisePdf := nil;

                setLength( _tempPointsPiecewisePdf, 3 );

                _tempPointsPiecewisePdf[0].x := 0.0;
                _tempPointsPiecewisePdf[0].y := 0.0;

                _tempPointsPiecewisePdf[1].x := 3.0;
                _tempPointsPiecewisePdf[1].y := 0.4;

                _tempPointsPiecewisePdf[2].x := 5.0;
                _tempPointsPiecewisePdf[2].y := 0.0;
              end
            else
              _tempPointsPiecewisePdf := (pdf as TPdfPiecewise).createRecordPointArray()
            ;

            // For reasons that aren't entirely clear, 'Piecewise (general)' does need to be translated.
            // The others don't.
          	showParamSet( tr( 'Piecewise (general)' ), false );
          end
        ;
        PdfPoint:
        	begin
         		showParamSet( 'Fixed value', false );

            _mode := (pdf as TPdfPoint).value;
            reValuePoint.text := uiFloatToStr( _mode );
          end
        ;
      	PdfTriangular:
        	begin
         		showParamSet( 'Triangular', false );

            _min := (pdf as TPdfTriangular).min;
            reMinTriang.Text := uiFloatToStr( _min );
            _mode := (pdf as TPdfTriangular).mode;
            reModeTriang.Text := uiFloatToStr( _mode );
            _max := (pdf as TPdfTriangular).max;
            reMaxTriang.Text := uiFloatToStr( _max );

            //setLength( _tempPoints, 0 );
          end
        ;
        PdfUniform:
        	begin
          	showParamSet( 'Uniform', false );

            _min := (pdf as TPdfUniform).min;
            reMinUniform.Text := uiFloatToStr( _min );
            _max := (pdf as TPdfUniform).max;
            reMaxUniform.Text := uiFloatToStr( _max );
          end
        ;
        PdfWeibull:
        	begin
          	showParamSet( 'Weibull', false );

            _alpha := (pdf as TPdfWeibull).alpha;
            reAlphaGamma.Text := uiFloatToStr( _alpha );
            _beta := (pdf as TPdfWeibull).beta;
            reBetaGamma.Text := uiFloatToStr( _beta );
          end
        ;

        // Discrete types
        //---------------
        PdfBernoulli:
          begin
            showParamSet( 'Bernoulli', false );

            _p := (pdf as TPdfBernoulli).p;
            rePBernoulli.Text := uiFloatToStr( _p );
          end
        ;
        PdfBinomial:
          begin
            showParamSet( 'Binomial', false );

            _n := (pdf as TPdfBinomial).n;
            reNBinomial.Text := intToStr( _n );
            _p := (pdf as TPdfBinomial).p;
            rePBinomial.Text := uiFloatToStr( _p );
          end
        ;
        PdfDiscreteUniform:
          begin
            showParamSet( 'Discrete uniform', false );

            _dMin := trunc( (pdf as TPdfDiscreteUniform).min );
            reMinDiscreteUniform.Text := intToStr( _dMin );
            _dMax := trunc( (pdf as TPdfDiscreteUniform).max );
            reMaxDiscreteUniform.Text := intToStr( _dMax );
          end
        ;
        PdfHypergeometric:
          begin
            showParamSet( 'Hypergeometric', false );

            _m := (pdf as TPdfHypergeometric).m;
            reMHypergeometric.Text := intToStr( _m );
            _d := (pdf as TPdfHypergeometric).d;
            reDHypergeometric.text := intToStr( _d );
            _n := (pdf as TPdfHypergeometric).n;
            reNHypergeometric.text := intToStr( _n );
          end
        ;
        PdfNegativeBinomial:
          begin
            showParamSet( 'Negative binomial', false );

            _p := (pdf as TPdfNegativeBinomial).p;
            rePNegBinomial.Text := uiFloatToStr( _p );
            _s := (pdf as TPdfNegativeBinomial).s;
            reSNegBinomial.Text := intToStr( _s );
          end
        ;
        PdfPoisson:
          begin
            showParamSet( 'Poisson', false );

            _mean := (pdf as TPdfPoisson).mean;
            reMeanExponential.Text := uiFloatToStr( _mean );
          end
        ;
        else
      	  showMessage( tr('Unrecognized PDF type in TFrameFunctionParamsBase.setPDF()') )
        ;
      end;

      if( enableEdit ) then
        setEditControlsEnabled( true )
      else
      	setEditControlsEnabled( false )
      ;
    end
  ;
	
	
  function TFrameFunctionParams2.createPDF(): TPdf;
    var
      itemStr: string;
      pdf: TPdf;
      logn: TPdfLognormal;
    begin
      pdf := nil;

      itemStr := cboPdfType.Items[ cboPdfType.itemIndex ];

      if(  tr( '(Unspecified)' ) = itemStr ) then
        // Don't do anything

      // Continuous types
      else if( tr( 'Beta' ) = itemStr ) then
        pdf := TPdfBeta.create( alpha, alpha2, min, max, xUnits )
      else if( tr( 'BetaPERT' ) = itemStr ) then
        pdf := TPdfBetaPERT.create( min, mode, max, xUnits )
      else if( tr( 'Exponential' ) = itemStr ) then
        pdf := TPdfExponential.create( mean, xUnits )
      else if( tr( 'Fixed value' ) = itemStr ) then
        pdf := TPdfPoint.create( mode, xUnits )
      else if( tr( 'Gamma' ) = itemStr ) then
        pdf := TPdfGamma.create( alpha, beta, xUnits )
      else if( tr( 'Gaussian (normal)' ) = itemStr ) then
        pdf := TPdfGaussian.create( mean, stddev, xUnits )
      else if( tr( 'Histogram' ) = itemStr ) then
        pdf := TPdfHistogram.create( _tempPointsHistogramPdf, xUnits )
      else if( tr( 'Inverse Gaussian' ) = itemStr ) then
        pdf := TPdfInverseGaussian.create( mean, shape, xUnits )
      else if( tr( 'Logistic' ) = itemStr ) then
        pdf := TPdfLogistic.create( location, scale, xUnits )
      else if( tr( 'Loglogistic' ) = itemStr ) then
        pdf := TPdfLoglogistic.create( location, scale, shape, xUnits )
      else if( tr( 'Lognormal' ) = itemStr ) then
        pdf := TPdfLognormal.create( mean, stddev, xUnits )
      else if( tr( 'Lognormal (2nd form)' ) = itemStr ) then
        begin
          logn := TPdfLognormal.create();
          logn.xUnits := xUnits;
          logn.zeta := zeta;
          logn.sigma := sigma;
          pdf := logn;
        end
      else if( tr( 'Pareto' ) = itemStr ) then
        pdf := TPdfPareto.create( theta, a, xUnits )
      else if( tr( 'Pearson 5' ) = itemStr ) then
        pdf := TPdfPearson5.create( alpha, beta, xUnits )
      else if( tr( 'Piecewise (general)' ) = itemStr ) then
        pdf := TPdfPiecewise.create( _tempPointsPiecewisePdf, xUnits )
      else if( tr( 'Triangular' ) = itemStr ) then
        pdf := TPdfTriangular.create( min, mode, max, xUnits )
      else if( tr( 'Uniform' ) = itemStr ) then
        pdf := TPdfUniform.create( min, max, xUnits )
      else if( tr( 'Weibull' ) = itemStr ) then
        pdf := TPdfWeibull.create( alpha, beta, xUnits )

      // Discrete types
      else if( tr( 'Bernoulli' ) = itemStr ) then
        pdf := TPdfBernoulli.create( p, xUnits )
      else if( tr( 'Binomial' ) = itemStr ) then
        pdf := TPdfBinomial.create( n, p, xUnits )
      else if( tr( 'Discrete uniform' ) = itemStr ) then
        pdf := TPdfDiscreteUniform.create( dMin, dMax, xUnits )
      else if( tr( 'Hypergeometric' ) = itemStr ) then
        pdf := TPdfHypergeometric.create( n, d, m, xUnits )
      else if( tr( 'Negative binomial' ) = itemStr ) then
        pdf := TPdfNegativeBinomial.create( s, p, xUnits )
      else if( tr( 'Poisson' ) = itemStr ) then
        pdf := TPdfPoisson.create( mean, xUnits )
      else
        raise exception.create( 'Unsupported pdf type (' + itemStr + ') in TFrameFunctionParams2.createPDF()' )
      ;

      result := pdf;
    end
  ;


  function TFrameFunctionParams2.pdfTypeFromCboPdfTypeItem(): TPdfType;
    var
      itemStr: string;
    begin
      itemStr := cboPdfType.Items[ cboPdfType.itemIndex ];

      if(  tr( '(Unspecified)' ) = itemStr ) then
        result := PdfUndefined

      // Continuous types
      else if( tr( 'Beta' ) = itemStr ) then
        result := PdfBeta
      else if( tr( 'BetaPERT' ) = itemStr ) then
        result := PdfBetaPERT
      else if( tr( 'Exponential' ) = itemStr ) then
        result := PdfExponential
      else if( tr( 'Fixed value' ) = itemStr ) then
        result := PdfPoint
      else if( tr( 'Gamma' ) = itemStr ) then
        result := PdfGamma
      else if( tr( 'Gaussian (normal)' ) = itemStr ) then
        result := PdfGaussian
      else if( tr( 'Histogram' ) = itemStr ) then
        result := PdfHistogram
      else if( tr( 'Inverse Gaussian' ) = itemStr ) then
        result := PdfInverseGaussian
      else if( tr( 'Logistic' ) = itemStr ) then
        result := PdfLogistic
      else if( tr( 'Loglogistic' ) = itemStr ) then
        result := PdfLogLogistic
      else if( tr( 'Lognormal' ) = itemStr ) then
        result := PdfLognormal
      else if( tr( 'Lognormal (2nd form)' ) = itemStr ) then
        result := PdfLognormal
      else if( tr( 'Pareto' ) = itemStr ) then
        result := PdfPareto
      else if( tr( 'Pearson 5' ) = itemStr ) then
        result := PdfPearson5
      else if( tr( 'Piecewise (general)' ) = itemStr ) then
        result := PdfPiecewise
      else if( tr( 'Triangular' ) = itemStr ) then
        result := PdfTriangular
      else if( tr( 'Uniform' ) = itemStr ) then
        result := PdfUniform
      else if( tr( 'Weibull' ) = itemStr ) then
        result := PdfWeibull

      // Discrete types
      else if( tr( 'Bernoulli' ) = itemStr ) then
        result := PdfBernoulli
      else if( tr( 'Binomial' ) = itemStr ) then
        result := PdfBinomial
      else if( tr( 'Discrete uniform' ) = itemStr ) then
        result := PdfDiscreteUniform
      else if( tr( 'Hypergeometric' ) = itemStr ) then
        result :=  PdfHypergeometric
      else if( tr( 'Negative binomial' ) = itemStr ) then
        result := PdfNegativeBinomial
      else if( tr( 'Poisson' ) = itemStr ) then
        result := PdfPoisson
      else
        begin
          raise exception.create( 'Unsupported pdf type (' + itemStr + ') in TFrameFunctionParams2.createPDF()' );
          result := PdfUndefined
        end
      ;
    end
  ;


  function TFrameFunctionParams2.cboPdfTypeItemFromProdType( pdfType: TPdfType ): integer;
    begin
      case pdfType of
        PdfUndefined: result := cboPdfType.Items.IndexOf( tr( '(Unspecified)' ) );

        // Continuous types
        PdfBeta: result := cboPdfType.Items.IndexOf( tr( 'Beta' ) );
        PdfBetaPERT: result := cboPdfType.Items.IndexOf( tr( 'BetaPERT' ) );
        PdfExponential: result := cboPdfType.Items.IndexOf( tr( 'Exponential' ) );
        PdfPoint: result := cboPdfType.Items.IndexOf( tr( 'Fixed value' ) );
        PdfGamma: result := cboPdfType.Items.IndexOf( tr( 'Gamma' ) );
        PdfGaussian: result := cboPdfType.Items.IndexOf( tr( 'Gaussian (normal)' ) );
        PdfHistogram: result := cboPdfType.Items.IndexOf( tr( 'Histogram' ) );
        PdfInverseGaussian: result := cboPdfType.Items.IndexOf( tr( 'Inverse Gaussian' ) );
        PdfLogistic: result := cboPdfType.Items.IndexOf( tr( 'Logistic' ) );
        PdfLogLogistic: result := cboPdfType.Items.IndexOf( tr( 'Loglogistic' ) );
        PdfLognormal: result := cboPdfType.Items.IndexOf( tr( 'Lognormal' ) );
        PdfPareto: result := cboPdfType.Items.IndexOf( tr( 'Pareto' ) );
        PdfPearson5: result := cboPdfType.Items.IndexOf( tr( 'Pearson 5' ) );
        PdfPiecewise: result := cboPdfType.Items.IndexOf( tr( 'Piecewise (general)' ) );
        PdfTriangular: result := cboPdfType.Items.IndexOf( tr( 'Triangular' ) );
        PdfUniform: result := cboPdfType.Items.IndexOf( tr( 'Uniform' ) );
        PdfWeibull: result := cboPdfType.Items.IndexOf( tr( 'Weibull' ) );

        //Discrete types
        PdfBernoulli: result := cboPdfType.Items.IndexOf( tr( 'Bernoulli' ) );
        PdfBinomial: result := cboPdfType.Items.IndexOf( tr( 'Binomial' ) );
        PdfDiscreteUniform: result := cboPdfType.Items.IndexOf( tr( 'Discrete uniform' ) );
        PdfHypergeometric: result := cboPdfType.Items.IndexOf( tr( 'Hypergeometric' ) );
        PdfNegativeBinomial: result := cboPdfType.Items.IndexOf( tr( 'Negative binomial' ) );
        PdfPoisson: result := cboPdfType.Items.IndexOf( tr( 'Poisson' ) );
        else
          begin
            raise exception.create( 'Invalid value (' + intToStr( ord(pdfType) ) + ') in TFrameFunctionParamsBase.cboPdfTypeItemFromProdType' );
            result := -1;
          end
        ;
      end;
    end
  ;
	
	

	function TFrameFunctionParams2.getXUnits(): TChartUnitType;
  	begin
    	result := chartUnitTypeFromString( self.cboXAxis.Items[ self.cboXAxis.itemIndex ] );
    end
  ;


  procedure TFrameFunctionParams2.setXUnits( val: TChartUnitType );
  	begin
    	cboXAxis.ItemIndex := cboXAxis.Items.IndexOf( chartUnitTypeAsString( val ) );
    end
  ;

// Properties
  procedure TFrameFunctionParams2.setMin( val: double ); begin _min := val; end;
  procedure TFrameFunctionParams2.setMode( val: double ); begin _mode := val; end;
  procedure TFrameFunctionParams2.setmax( val: double ); begin _max := val; end;
  procedure TFrameFunctionParams2.setMean( val: double ); begin _mean := val; end;
  procedure TFrameFunctionParams2.setStdDev( val: double ); begin _stddev := val; end;
  procedure TFrameFunctionParams2.setAlpha( val: double ); begin _alpha := val; end;
  procedure TFrameFunctionParams2.setAlpha2( val: double ); begin _alpha2 := val; end;
  procedure TFrameFunctionParams2.setBeta( val: double ); begin _beta := val; end;
  procedure TFrameFunctionParams2.setLocation( val: double ); begin _location := val; end;
  procedure TFrameFunctionParams2.setScale( val: double ); begin _scale := val; end;
  procedure TFrameFunctionParams2.setShape( val: double ); begin _shape := val; end;
  procedure TFrameFunctionParams2.setZeta( val: double ); begin _zeta := val; end;
  procedure TFrameFunctionParams2.setSigma( val: double ); begin _sigma := val; end;
  procedure TFrameFunctionParams2.setN( val: integer ); begin _n := val; end;
  procedure TFrameFunctionParams2.setP( val: double ); begin _p := val; end;
  procedure TFrameFunctionParams2.setM( val: integer ); begin _m := val; end;
  procedure TFrameFunctionParams2.setD( val: integer ); begin _d := val; end;
  procedure TFrameFunctionParams2.setDMin( val: integer ); begin _dmin := val; end;
  procedure TFrameFunctionParams2.setDMax( val: integer ); begin _dmax := val; end;
  procedure TFrameFunctionParams2.setS( val: integer ); begin _s := val; end;
  procedure TFrameFunctionParams2.setTheta( val: double ); begin _theta := val; end;
  procedure TFrameFunctionParams2.setA( val: double ); begin _a := val; end;

  function TFrameFunctionParams2.getMin(): double; begin Result := _min; end;
  function TFrameFunctionParams2.getMode(): double; begin Result := _mode; end;
  function TFrameFunctionParams2.getMax(): double; begin Result := _max; end;
  function TFrameFunctionParams2.getMean(): double; begin Result := _mean; end;
  function TFrameFunctionParams2.getStdDev(): double; begin Result := _stddev; end;
  function TFrameFunctionParams2.getAlpha(): double; begin result := _alpha; end;
  function TFrameFunctionParams2.getAlpha2(): double; begin result := _alpha2; end;
  function TFrameFunctionParams2.getBeta(): double; begin result := _beta; end;
  function TFrameFunctionParams2.getLocation(): double; begin result := _location; end;
  function TFrameFunctionParams2.getScale(): double; begin result := _scale; end;
  function TFrameFunctionParams2.getShape(): double; begin result := _shape; end;
  function TFrameFunctionParams2.getZeta(): double; begin result := _zeta; end;
  function TFrameFunctionParams2.getSigma(): double; begin result := _sigma; end;
  function TFrameFunctionParams2.getN(): integer; begin result := _n; end;
  function TFrameFunctionParams2.getP(): double; begin result := _p; end;
  function TFrameFunctionParams2.getM(): integer; begin result := _m; end;
  function TFrameFunctionParams2.getD(): integer; begin result := _d; end;
  function TFrameFunctionParams2.getDMin(): integer; begin result := _dmin; end;
  function TFrameFunctionParams2.getDMax(): integer; begin result := _dmax; end;
  function TFrameFunctionParams2.getS(): integer; begin result := _s; end;
  function TFrameFunctionParams2.getTheta(): double; begin result := _theta; end;
  function TFrameFunctionParams2.getA(): double; begin result := _a; end;

  function TFrameFunctionParams2.getUnitsLocked(): boolean; begin result := _unitsLocked; end;

  function TFrameFunctionParams2.getEditEnabled(): boolean; begin result := _editEnabled; end;

	
end.
