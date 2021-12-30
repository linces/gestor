unit FormFunctionEditor;

(*
FormFunctionEditor.pas/dfm
--------------------------
Begin: 2005/11/10
Last revision: $Date: 2011-07-13 03:41:46 $ $Author: areeves $
Version number: $Revision: 1.19 $
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
    Messages,
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
    Buttons,
    
    // Chart controls
    TeEngine,
    Series,
    TeeProcs,
    Chart,

    // APHI General Purpose
    CsvParser,
    FunctionPointers,

    // Data
    Points,
    ChartFunction,
    RelFunction,
    ProbDensityFunctions,

    // Widgets
    FrameFunctionParams2,
    FrameChartPointsEditor,
    FrameChartBase
  ;


  type TFormFunctionEditor = class( TForm )
      dlgPrint: TPrintDialog;
      dlgExportCSV: TSaveDialog;
      dlgImportCSV: TOpenDialog;
      dlgSaveWMF: TSaveDialog;
      dlgOpenNaadsmFnFile: TOpenDialog;
      dlgSaveNaadsmFnFile: TSaveDialog;

      pnlControls: TPanel;

      pnlMenu: TPanel;

      pnlButtons: TPanel;
      btnSaveChart: TBitBtn;
      btnCopyChart: TBitBtn;
      btnPrintChart: TBitBtn;
      btnAcceptChanges: TBitBtn;
      btnCancelChanges: TBitBtn;
      pnlDecorator1: TPanel;
      pnlDecorator2: TPanel;

      pnlBody: TPanel;
      fraChartPointsEditor: TFrameChartPointsEditor;

      pnlControlsBottom: TPanel;
      btnAcceptChanges2: TBitBtn;
      btnCancelChanges2: TBitBtn;

      pnlTitle: TPanel;
      lblTitle: TLabel;
      leTitle: TEdit;
      pnlDecorator4: TPanel;
      pnlDecorator3: TPanel;

      pnlParams: TPanel;
      fraFunctionParams: TFrameFunctionParams2;
      ImageList1: TImageList;
      pnlMenuHolder: TPanel;
      pnlMenuDecorator1: TPanel;
      pnlMenuDecorator2: TPanel;

      procedure FormCreate(Sender: TObject);

      // Copy/paste/import/export
      //-------------------------
      procedure copyXml( Sender: TObject );
      procedure pasteXml( Sender: TObject );
      procedure savePoints( Sender: TObject );
      procedure copyPoints( Sender: TObject );
      procedure importPoints( Sender: TObject );

      // Applying changes
      //-----------------
      procedure ActionSaveExitExecute( sender: TObject );
      procedure ActionExitExecute(Sender: TObject); virtual;

      // Chart utilities
      //----------------
      procedure saveChartToWMF( sender: TObject );
      procedure printChart( sender: TObject );
      procedure copyChartToClipboard( sender: TObject );

      procedure leTitleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure fraChartPointsEditorcbxShowDiscreteApproxClick( Sender: TObject);
      procedure fraFunctionParamsAxisUnitsChange(Sender: TObject);
      procedure fraFunctionParamsCboKeyDown(Sender: TObject;
        var Key: Word; Shift: TShiftState);

    private
      procedure CMDialogChar( var Msg: TWMKey ); message CM_DIALOGCHAR;
      
    protected
      _title: string;
      _isReadOnly: boolean;
      _xAxisUnits: TChartUnitType;
      _yAxisUnits: TChartUnitType;

      _saveChanges: boolean;

      // A pointer to a function to be called whenever the displayed chart is updated.
      _fnChartChanged: TObjFnVoid0;

      // Actions, etc., to be created by makeMenu()
      //-------------------------------------------
      actionManager: TActionManager;
      mainMenu: TActionMainMenuBar;
      actionList: TActionList;

      mnuFile: TActionClientItem;
      acnPrintChart: TAction;
      acnSaveChart: TAction;
      acnSavePoints: TAction;
      mnuImportPoints: TActionClientItem;
      acnImportPiecewiseFromFile: TAction;
      acnImportHistFromFile: TAction;
      acnImportRelFromFile: TAction;
      acnClose: TAction;
      acnFinish: TAction;
      acnOpenNaadsmFunction: TAction;
      acnSaveNaadsmFunction: TAction;

      mnuEdit: TActionClientItem;
      acnCopy: TAction;
      acnPaste: TAction;
      acnCopyChart: TAction;
      acnCopyPoints: TAction;
      mnuPastePoints: TActionClientItem;
      acnImportPiecewiseFromClipboard: TAction;
      acnImportHistogramFromClipboard: TAction;
      acnImportRelFromClipboard: TAction;

      mnuHelp: TActionClientItem;
      acnHelp: TAction;

      // Opening/saving NAADSM function files
      //-------------------------------------
      function functionUnitsOK( fn: TChartFunction ): boolean;
      procedure openNaadsmFunctionFile( sender: TObject );
      procedure saveNaadsmFunctionFile( sender: TObject );

      // Help
      //-----
      procedure ActionHelpExecute(Sender: TObject);
      
      // Functions for making the main menu at run-time
      //-----------------------------------------------
      procedure makeMenu(); virtual;
      procedure DoNothing(Sender: TObject);

      function createAction(
        AParent: TActionClientItem;
        Caption: String;
        ExecuteAction: TNotifyEvent;
        actionList: TActionList = nil;
        imgIndex: integer = -1;
        actionIndex: integer = -1
      ): TActionClientItem;

      function addMenuAction( AParent: TActionClientItem; AAction: TAction ): TActionClientItem;
      function addMenuSeparator( AParent: TActionClientItem ): TActionClientItem;

      // Functions for translating the GUI
      //----------------------------------
      procedure translateUI();
      procedure translateUIManual();


      // Functions for import of points from clipboard or text file
      //------------------------------------------------------------
      function getImportString( Sender: TObject; var strToParse: string ): boolean;
      function checkRows( parser: TCSVContents; pointArray: T2DPointList ): boolean;
      procedure makePiecewisePdf( points: T2DPointList );
      procedure makeHistogramPdf( points: T2DPointList );
      procedure makeRelationalFunction( points: T2DPointList );

      // Functions for internal use
      //----------------------------
      procedure initialize( AOwner: TComponent; readOnly: boolean );

      procedure setAxisUnits( xAxisUnits, yAxisUnits: TChartUnitType );

      procedure updateFunctionDisplay( sender: TObject; fn: TChartFunction );
      procedure setMenuItemsEnabled( val: boolean );


      // Properties
      //-----------
      procedure SetFnChartChanged( fnPtr: TObjFnVoid0 );

      procedure setIsReadOnly( const val: boolean );
      function getIsReadOnly(): boolean;

      procedure setTitle( val: string );
      function getTitle(): string;

      function getSaveChanges(): boolean;

      procedure setChartType( const val: TChartType );
      function getChartType(): TChartType;

      function getUnitsLocked(): boolean;
      procedure setUnitsLocked( const val: boolean );

    public
      // Construction/initialization/destruction
      //-----------------------------------------
      { Creates a completely empty instance.  setFunction must be used. }
      constructor create( AOwner: TComponent ); overload; override;
      
      { Used to create a new default PDF or relational function. }
      constructor create(
        AOwner: TComponent;
        const chartType: TChartType;
        const allowedPdfTypes: TPdfTypeSet = [];
        const xAxisUnits: TChartUnitType = UUnknown;
        const yAxisUnits: TChartUnitType = UUnknown;
        const unitsLocked: boolean = true;
        const minY: double = 0.0;
        const maxY: double = 0.0;
        const title: string = '';
        const titleLocked: boolean = true;
        const readOnly: boolean = false;
        const xAxisLabel: string = ''
      ); reintroduce; overload;


      { Used with an existing PDF or relational function. }
      constructor create(
        AOwner: TComponent;
        const chart: TChartFunction;
        const allowedPdfTypes: TPdfTypeSet = [];
        const unitsLocked: boolean = true;
        const minY: double = 0.0;
        const maxY: double = 0.0;
        const readOnly: boolean = false;
        const xAxisLabel: string = ''
      ); reintroduce; overload;


      { Sets the form contents to the specified chart. }
      procedure setFunction( chart: TChartFunction );


      // Useful public functions
      //------------------------
      { Generates a new chart function based on displayed parameters. }
      function createFunction(): TChartFunction;

      function functionAsXml(): string;

      { Generates an APPROXIMATE plain-text representation of the chart. }
      function functionAsCsv(): string;

      property fnChartChanged: TObjFnVoid0 write SetFnChartChanged;

      property chartType: TChartType read getChartType write setChartType;
      property title: string read getTitle write setTitle;
      property isReadOnly: boolean read getIsReadOnly write setIsReadOnly;
      property xAxisUnits: TChartUnitType read _xAxisUnits;
      property yAxisUnits: TChartUnitType read _yAxisUnits;
      property unitsLocked: boolean read getUnitsLocked;

      property changesSaved: boolean read getSaveChanges;
    end
  ;


implementation

  {$R *.dfm}

  uses
    Math,
    StrUtils,

    MyStrUtils,
    DebugWindow,
    ControlUtils,
    MyDialogs,
    I88n,
    UnicodeDev,

    Sdew
  ;

  const
    DBSHOWMSG: boolean = false; // set to true to enable debugging messages for this unit.

  var
    _showFunctionWarning: boolean;

//-----------------------------------------------------------------------------
// Construction/initialization/destruction
//-----------------------------------------------------------------------------
  {*
  This creates a completely empty instance of TFrameChartPointsEditor.  This form of the constructor is
  useful when a chart will be specified later with setFunction.  No function is shown:
  once a function has been set, it must be explicitly shown with a call to setFunction.

  (This constructor is not used with FrameFunctionEditor, but might be useful some day.)
  }
  constructor TFormFunctionEditor.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      initialize( AOwner, true );
      translateUI();

      setTitle( '' );

      setChartType( CTUnspecified );

      fraFunctionParams.allowedPdfTypes := [];

      // Until there is a chart, hide the chart-related menu items and buttons.
      setMenuItemsEnabled( false );
    end
  ;


  {*
  This form of the constructor is used to create a brand new PDF or relational function.

  In the cases of piecewise PDFs, histogram PDFs, and relational functions, a set of default points
  is created and may be edited.  In the case of all other PDFs, appropriate parameters must be
  entered before anything is displayed.
  }
  constructor TFormFunctionEditor.create(
        AOwner: TComponent;
        const chartType: TChartType;
        const allowedPdfTypes: TPdfTypeSet = [];
        const xAxisUnits: TChartUnitType = UUnknown;
        const yAxisUnits: TChartUnitType = UUnknown;
        const unitsLocked: boolean = true;
        const minY: double = 0.0;
        const maxY: double = 0.0;
        const title: string = '';
        const titleLocked: boolean = true;
        const readOnly: boolean = false;
        const xAxisLabel: string = ''
      );
    begin
      inherited create( AOwner );
      translateUI();
      
      initialize( AOwner, readOnly );

      setTitle( title );
      leTitle.Enabled := not titleLocked;

      setAxisUnits( xAxisUnits, yAxisUnits );

      fraFunctionParams.allowedPdfTypes := allowedPdfTypes;
      fraFunctionParams.unitsLocked := unitsLocked;

      fraChartPointsEditor.minY := minY;
      fraChartPointsEditor.maxY := maxY;
      fraFunctionParams.minY := minY;
      fraFunctionParams.maxY := maxY;

      setChartType( chartType );

      if( UCustom = xAxisUnits ) then
        begin
          if( not strIsEmpty( xAxisLabel ) ) then
            fraChartPointsEditor.xAxisLabel := xAxisLabel
          else
            fraChartPointsEditor.xAxisLabel := chartUnitTypeAsString( UCustom )
          ;
        end
      ;
    end
  ;


  {*
  This form of the constructor could be used to set up an existing PDF or relational function.

  Units are specified by the instance of the chart.
  }
  constructor TFormFunctionEditor.create(
        AOwner: TComponent;
        const chart: TChartFunction;
        const allowedPdfTypes: TPdfTypeSet = [];
        const unitsLocked: boolean = true;
        const minY: double = 0.0;
        const maxY: double = 0.0;
        const readOnly: boolean = false;
        const xAxisLabel: string = ''
      );
    begin
      inherited create( AOwner );
      initialize( AOwner, readOnly );
      translateUI();

      setTitle( chart.name );

      fraChartPointsEditor.minY := minY;
      fraChartPointsEditor.maxY := maxY;

      fraFunctionParams.allowedPdfTypes := allowedPdfTypes;
      fraFunctionParams.unitsLocked := unitsLocked;
      fraFunctionParams.minY := minY;
      fraFunctionParams.maxY := maxY;

      setFunction( chart );

      if( UCustom = chart.xUnits ) then
        begin
          if( not strIsEmpty( xAxisLabel ) ) then
            fraChartPointsEditor.xAxisLabel := xAxisLabel
          else
            fraChartPointsEditor.xAxisLabel := chartUnitTypeAsString( UCustom )
          ;
        end
      ;
    end
  ;


  procedure TFormFunctionEditor.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.2.
      // Generation date: Thu Feb 28 21:37:05 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/general_purpose_gui/function_editor/FormFunctionEditor.dfm
      // File date: Tue Feb 26 19:38:16 2008

      // Updated manually, 8/10/09

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          Caption := tr( 'Chart' );
          btnSaveChart.Hint := tr( 'Save chart image to file' );
          btnCopyChart.Hint := tr( 'Copy chart image to clipboard' );
          btnPrintChart.Hint := tr( 'Print chart image' );
          btnAcceptChanges.Hint := tr( 'Save changes and exit' );
          btnCancelChanges.Hint := tr( 'Exit without saving changes' );
          lblTitle.Caption := tr( 'Function name:' );
          leTitle.Text := tr( 'leTitle' );
          btnAcceptChanges2.Caption := tr( 'Save' );
          btnAcceptChanges2.Hint := tr( 'Save changes and exit' );
          btnCancelChanges2.Caption := tr( 'Cancel' );
          btnCancelChanges2.Hint := tr( 'Exit without saving changes' );

          dlgExportCSV.Filter := tr( 'Comma delimited file (*.csv)|*.csv|All files (*.*)|*.*' );
          dlgSaveWMF.Filter := tr( 'Windows Metafile (*.wmf)|*.wmf|All files (*.*)|*.*' );
          dlgImportCSV.Filter := tr( 'Text files (*.csv, *.txt)|*.csv; *.txt|All files (*.*)|*.*' );
        end
      ;

      // If any phrases are found that could not be automatically extracted by
      // Caption Collector, modify the following function to take care of them.
      translateUIManual();
    end
  ;


  
  procedure TFormFunctionEditor.translateUIManual();
    begin
      dlgExportCSV.Filter := tr( 'Enter name of file for points' );
      dlgSaveWMF.Title := tr( 'Enter name of file for chart' );
      dlgImportCSV.Title := tr( 'Open file containing points to import...' );
      dlgOpenNaadsmFnFile.Title := tr( 'Open NAADSM function file...' );
      dlgSaveNaadsmFnFile.Title := tr( 'Save NAADSM function file...' );
    end
  ;



  procedure TFormFunctionEditor.FormCreate(Sender: TObject);
    begin
      if Screen.PixelsPerInch <> 96 then
        begin
          ScaleBy( Screen.PixelsPerInch, 96 );
          self.width := round( self.width * ( screen.pixelsPerInch / 96 ) );
          self.height := round( self.height * ( screen.pixelsPerInch / 96 ) );
        end
      ;
    end
  ;


  procedure TFormFunctionEditor.initialize( AOwner: TComponent; readOnly: boolean );
    begin
      // Deal with form scaling
      //-----------------------
      Assert(not Scaled, 'You should set Scaled property of Form to False!');
      // Set this value to the PPI AT WHICH THE FORM WAS ORIGINALLY DESIGNED!!
      self.PixelsPerInch := 96;
      // FormCreate() will handle the rest.

      makeMenu();

      _fnChartChanged := nil;

      setIsReadOnly( readOnly );
      fraFunctionParams.setUpdateParams( self.updateFunctionDisplay );
      fraFunctionParams.setSetParentMenuItemsEnabled( self.setMenuItemsEnabled );
      fraChartPointsEditor.setUpdateParams( self.updateFunctionDisplay );
    end
  ;


  procedure TFormFunctionEditor.DoNothing(Sender: TObject);
    begin
      // Used to enable menu headers and sub menus
    end
  ;


  // Code for this function adapted from a sample by "Karl": see http://news.eurekalog.com/showthread.php?t=2169
  function TFormFunctionEditor.createAction(
        AParent: TActionClientItem;
        Caption: String;
        ExecuteAction: TNotifyEvent;
        actionList: TActionList = nil;
        imgIndex: integer = -1;
        actionIndex: integer = -1
      ): TActionClientItem;
    var
      newActionClient: TActionClientItem;
      newAction: TAction;
    begin
      // If no index is specified, the new action will go at the end.
      if( -1 = actionIndex ) then
        actionIndex := AParent.Items.Count
      ;

      newActionClient := TActionClientItem( AParent.Items.insert( actionIndex ) );
      newActionClient.Caption := Caption;
      newActionClient.ImageIndex := imgIndex;

      newAction := TAction.Create(Self);
      newAction.Caption := Caption;
      newAction.OnExecute := ExecuteAction;

      if( nil <> actionList ) then
        begin
          newAction.ActionList := actionList;
          newAction.ImageIndex := imgIndex;
        end
      ;

      newActionClient.Action := newAction;

      Result := newActionClient;
    end
  ;


  function TFormFunctionEditor.addMenuSeparator( AParent: TActionClientItem ): TActionClientItem;
    var
      newActionClient: TActionClientItem;
      newAction: TAction;
    begin
      newActionClient := TActionClientItem( AParent.Items.insert( AParent.Items.Count ) );
      newActionClient.Caption := '-';
      
      newAction := TAction.Create(Self);
      newAction.caption := '-';
      
      newActionClient.Action := newAction;

      Result := newActionClient;
    end
  ;


  // Code for this function adapted from a sample by "Karl": see http://news.eurekalog.com/showthread.php?t=2169
  function TFormFunctionEditor.addMenuAction( AParent: TActionClientItem; AAction: TAction ): TActionClientItem;
    var
      newActionClient: TActionClientItem;
    begin
      newActionClient := TActionClientItem( AParent.Items.insert( AParent.Items.Count ) );
      newActionClient.Caption := AAction.Caption;
      newActionClient.Action := AAction;

      Result := newActionClient;
    end
  ;


  // Code for this function adapted from a sample by "Karl": see http://news.eurekalog.com/showthread.php?t=2169
  procedure TFormFunctionEditor.makeMenu();
    var
      copyWidth, pasteWidth, spaceWidth: integer;
      diff: integer;
      copyPadding, pastePadding: integer;
      copyCaption, pasteCaption: string;
      i: integer;
    begin
      // Create action manager and main menu
      //------------------------------------
      actionManager := TActionManager.Create( Self );
      actionManager.Images := ImageList1;

      mainMenu := TActionMainMenuBar.Create(nil);
      mainMenu.Parent := pnlMenuHolder;
      mainMenu.ActionManager := actionManager;

      actionManager.ActionBars.Add.ActionBar := mainMenu;

      actionList := TActionList.Create( Self );
      actionList.Images := ImageList1;


      // Create root menu items
      //-----------------------
      mnuFile := createAction( TActionClientItem( MainMenu.ActionClient ), tr( '&File' ), DoNothing, actionList, -1 {4} );
      mnuEdit := createAction( TActionClientItem( MainMenu.ActionClient ), tr( '&Edit' ), DoNothing, actionList, -1 {71} );
      mnuHelp := createAction( TActionClientItem( MainMenu.ActionClient ), tr( '&Help' ), DoNothing, actionList, -1 {0} );


      // Create actions for the File menu
      //---------------------------------
      acnFinish := TAction.Create( self );
      acnFinish.Caption := tr( '&Save changes to function and exit' );
      acnFinish.ActionList := actionList;
      acnFinish.ImageIndex := 74;
      acnFinish.ShortCut := 16467;
      acnFinish.OnExecute := ActionSaveExitExecute;
      addMenuAction( mnuFile, acnFinish );

      addMenuSeparator( mnuFile );

      acnOpenNaadsmFunction := TAction.Create( self );
      acnOpenNaadsmFunction.Caption := tr( '&Open NAADSM function file...' );
      acnOpenNaadsmFunction.ActionList := actionList;
      acnOpenNaadsmFunction.ImageIndex := 4;
      acnOpenNaadsmFunction.OnExecute := openNaadsmFunctionFile;
      addMenuAction( mnuFile, acnOpenNaadsmFunction );

      acnSaveNaadsmFunction := TAction.Create( self );
      acnSaveNaadsmFunction.Caption := tr( 'S&ave NAADSM function file...' );
      acnSaveNaadsmFunction.ActionList := actionList;
      acnSaveNaadsmFunction.ImageIndex := 79;
      acnSaveNaadsmFunction.OnExecute := saveNaadsmFunctionFile;
      addMenuAction( mnuFile, acnSaveNaadsmFunction );

      addMenuSeparator( mnuFile );

      acnSavePoints := TAction.Create( self );
      acnSavePoints.Caption := tr( '&Export points to file...' );
      acnSavePoints.ActionList := actionList;
      acnSavePoints.ImageIndex := 65;
      acnSavePoints.ShortCut := 16453;
      acnSavePoints.OnExecute := savePoints;
      addMenuAction( mnuFile, acnSavePoints );

      mnuImportPoints := createAction( mnuFile, tr( '&Import from file...' ), DoNothing, actionList, 76 (*, 16463 *) );

      acnImportPiecewiseFromFile := TAction.Create( self );
      acnImportPiecewiseFromFile.Caption := tr( 'Import &piecewise pdf' );
      acnImportPiecewiseFromFile.ActionList := actionList;
      acnImportPiecewiseFromFile.OnExecute := importPoints;
      addMenuAction( mnuImportPoints, acnImportPiecewiseFromFile );

      acnImportHistFromFile := TAction.Create( self );
      acnImportHistFromFile.Caption := tr( 'Import &histogram pdf' );
      acnImportHistFromFile.ActionList := actionList;
      acnImportHistFromFile.OnExecute := importPoints;
      addMenuAction( mnuImportPoints, acnImportHistFromFile );

      acnImportRelFromFile := TAction.Create( self );
      acnImportRelFromFile.Caption := tr( 'Import &relational function' );
      acnImportRelFromFile.ActionList := actionList;
      acnImportRelFromFile.OnExecute := importPoints;
      addMenuAction( mnuImportPoints, acnImportRelFromFile );

      addMenuSeparator( mnuFile );

      acnSaveChart := TAction.Create( self );
      acnSaveChart.Caption := tr( 'S&ave chart image...' );
      acnSaveChart.ActionList := actionList;
      acnSaveChart.ImageIndex := 67;
      acnSaveChart.OnExecute := saveChartToWMF;
      addMenuAction( mnuFile, acnSaveChart );

      acnPrintChart := TAction.Create( self );
      acnPrintChart.Caption := tr( '&Print chart image...' );
      acnPrintChart.ActionList := actionList;
      acnPrintChart.ImageIndex := 68;
      acnPrintChart.ShortCut := 16464;
      acnPrintChart.OnExecute := printChart;
      addMenuAction( mnuFile, acnPrintChart );

      addMenuSeparator( mnuFile );

      acnClose := TAction.Create( self );
      acnClose.Caption := tr( 'E&xit without saving changes to function' );
      acnClose.ActionList := actionList;
      acnClose.ImageIndex := 72;
      acnClose.ShortCut := 16465;
      acnClose.OnExecute := ActionExitExecute;
      addMenuAction( mnuFile, acnClose );


      // Create actions for the Edit menu
      //---------------------------------
      copyWidth := self.Canvas.TextWidth( tr( 'Copy' ) );
      pasteWidth := self.Canvas.TextWidth( tr( 'Paste' ) );
      spaceWidth := self.Canvas.TextWidth( ' ' );

      diff := ( pasteWidth - copyWidth ) div spaceWidth;

      pastePadding := ( 110 - pasteWidth ) div spaceWidth;
      copyPadding := pastePadding + diff;

      copyCaption := tr( '&Copy' );
      for i := 0 to copyPadding - 1 do
        copyCaption := copyCaption + ' '
      ;
      copyCaption := copyCaption + 'Ctrl-C';

      pasteCaption := tr( '&Paste' );
      for i := 0 to pastePadding - 1 do
        pasteCaption := pasteCaption + ' '
      ;
      pasteCaption := pasteCaption + 'Ctrl-V';

      // Don't use shortcut keys for copy and paste actions:
      // they screw up copying and pasting from other controls,
      // like line edits, where copying and pasting is also used.
      // Instead, use the CMDialogChar approach on the form.

      acnCopy := TAction.Create( self );
      acnCopy.Caption := copyCaption;
      acnCopy.ActionList := actionList;
      acnCopy.ImageIndex := 2;
      //acnCopy.ShortCut := 16451; // Ctrl-C
      acnCopy.OnExecute := copyXml;
      addMenuAction( mnuEdit, acnCopy );

      acnPaste := TAction.Create( self );
      acnPaste.Caption := pasteCaption;
      acnPaste.ActionList := actionList;
      acnPaste.ImageIndex := 78;
      //acnPaste.ShortCut := 16470; // Ctrl-V
      acnPaste.OnExecute := pasteXml;
      addMenuAction( mnuEdit, acnPaste );

      addMenuSeparator( mnuEdit );

      acnCopyPoints := TAction.Create( self );
      acnCopyPoints.Caption := tr( 'C&opy points to clipboard' );
      acnCopyPoints.ActionList := actionList;
      acnCopyPoints.ImageIndex := 70;
      acnCopyPoints.OnExecute := copyPoints;
      addMenuAction( mnuEdit, acnCopyPoints );

      mnuPastePoints := createAction( mnuEdit, tr( '&Import from clipboard' ), DoNothing, actionList, 77 );

      acnImportPiecewiseFromClipboard := TAction.Create( self );
      acnImportPiecewiseFromClipboard.Caption := tr( 'Import &piecewise pdf' );
      acnImportPiecewiseFromClipboard.ActionList := actionList;
      acnImportPiecewiseFromClipboard.OnExecute := importPoints;
      addMenuAction( mnuPastePoints, acnImportPiecewiseFromClipboard );

      acnImportHistogramFromClipboard := TAction.Create( self );
      acnImportHistogramFromClipboard.Caption := tr( 'Import &histogram pdf' );
      acnImportHistogramFromClipboard.ActionList := actionList;
      acnImportHistogramFromClipboard.OnExecute := importPoints;
      addMenuAction( mnuPastePoints, acnImportHistogramFromClipboard );

      acnImportRelFromClipboard := TAction.Create( self );
      acnImportRelFromClipboard.Caption := tr( 'Import &relational function' );
      acnImportRelFromClipboard.ActionList := actionList;
      acnImportRelFromClipboard.OnExecute := importPoints;
      addMenuAction( mnuPastePoints, acnImportRelFromClipboard );

      addMenuSeparator( mnuEdit );

      acnCopyChart := TAction.Create( self );
      acnCopyChart.Caption := tr( 'C&opy chart image to clipboard' );
      acnCopyChart.ActionList := actionList;
      acnCopyChart.ImageIndex := 66;
      acnCopyChart.OnExecute := copyChartToClipboard;
      addMenuAction( mnuEdit, acnCopyChart );

      
      // Create actions for the Help menu
      //---------------------------------
      acnHelp := TAction.Create( self );
      acnHelp.Caption := tr( 'Show help screen' );
      acnHelp.ImageIndex := -1;
      acnHelp.OnExecute := ActionHelpExecute;
      addMenuAction( mnuHelp, acnHelp );
    end
  ;


  {
    Code is based on tips from the following websites:

    http://www.swissdelphicenter.ch/torry/showcode.php?id=591
    http://delphi.about.com/od/objectpascalide/a/keyboard_events.htm
    http://delphi.about.com/od/objectpascalide/l/blvkc.htm
  }
  procedure TFormFunctionEditor.CMDialogChar( var Msg: TWMKey );
    begin
      //dbcout2( Msg.Charcode );
      
      if( 3 = Msg.Charcode ) then // ctrl-C
        copyXml( nil )
      else if( 22 = msg.CharCode ) then // ctrl-V
        pasteXml( nil )
      ;

      inherited;
    end
  ;


  procedure TFormFunctionEditor.setFunction( chart: TChartFunction );
    var
      errMsg: string;
    begin
      dbcout( '@@@ TFormFunctionEditor.setFunction', DBSHOWMSG );

      if( nil <> chart ) then
        begin
          setChartType( chart.chartType );
          setAxisUnits( chart.xUnits, chart.yUnits );
          setTitle( trim( chart.name ) );
        end
      ;

      fraFunctionParams.editEnabled := false; // This prevents an obsolete message box from popping up

      if( CTUnspecified = chartType ) then
        raise exception.Create( 'Chart type is unspecified in TFormFunctionEditor.setFunction' )
      else
        begin
          screen.Cursor := crHourglass;

          if( nil = chart ) then
            fraFunctionParams.drawChart( nil, self.chartType, self.xAxisUnits, self.yAxisUnits, true )
          else
            fraFunctionParams.drawChart( chart, chart.chartType, chart.xUnits, chart.yUnits, true )
          ;

          if( nil = chart ) then
            fraChartPointsEditor.hideChart( tr( 'Do something here' ) )
          else if( chart is TPdfPoint ) then
            fraChartPointsEditor.hideChart( tr( 'Preview is not available for fixed values.' ) )
          else
            begin
              fraChartPointsEditor.drawChart( chart );

              if( chart.validate( @errMsg ) ) then
                fraChartPointsEditor.showChart()
              else
                fraChartPointsEditor.hideChart( tr( 'Function parameters are not valid:' ) + endl + errMsg )
              ;
            end
          ;

          setMenuItemsEnabled( true );
          fraFunctionParams.editEnabled := true;

          screen.Cursor := crDefault;
        end
      ;

      if( nil <> @_fnChartChanged ) then
        _fnChartChanged()
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Creating a chart function (the output of this form!)
//-----------------------------------------------------------------------------
  function TFormFunctionEditor.createFunction(): TChartFunction;
    begin
      dbcout( '** Begin TFormFunctionEditor.createFunction', DBSHOWMSG );

      case chartType of
        CTPdf: result := fraFunctionParams.createPdf();
        CTRel: result := fraFunctionparams.createRel();
        else result := nil;
      end;

      if( nil <> result ) then
        result.name := trim( leTitle.Text )
      ;

      dbcout( '** Done with TFormFunctionEditor.createFunction', DBSHOWMSG );
    end
  ;


  function TFormFunctionEditor.functionAsCsv(): string;
    var
      fn: TChartFunction;
    begin
      result := '';

      fn := createFunction();

      if( nil <> fn ) then
        begin
          if( fn.validate() ) then
            result := fn.asCsv()
          ;
          freeAndNil( fn );
        end
      ;
    end
  ;


  function TFormFunctionEditor.functionAsXml(): string;
    var
      fn: TChartFunction;
    begin
      result := '';

      fn := createFunction();

      if( nil <> fn ) then
        begin
          if( fn.validate() ) then
            result := fn.ssXml( 0 ) + endl
          ;
          freeAndNil( fn );
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Internal display
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.updateFunctionDisplay( sender: TObject; fn: TChartFunction );
    var
      msg: string;
      tmpPoints: RPointArray;
    begin
      dbcout( 'TFormFunctionEditor.updateFunctionDisplay', DBSHOWMSG );

      screen.Cursor := crHourglass;

      if( sender is TFrameChartPointsEditor ) then
        begin
          tmpPoints := fraChartPointsEditor.createRPointArray();
          fraFunctionParams.setPoints( tmpPoints );
          setLength( tmpPoints, 0 );
        end
      else if( nil = fn ) then
        begin
          setMenuItemsEnabled( false );
          fraChartPointsEditor.hideChart( tr( 'Function is unspecified.' ) );
        end
      else if( sender is TFrameFunctionParams2 ) then
        begin
          if( nil <> fn ) then
            begin
              if( fn.validate( @msg ) ) then
                begin
                  setMenuItemsEnabled( true );

                  if( fn is TPdfPoint ) then
                    fraChartPointsEditor.hideChart( tr( 'Preview is not available for fixed values.' ) )
                  else
                    begin
                      fraChartPointsEditor.drawChart( fn );
                      fraChartPointsEditor.showChart();
                      if( ( fn is TPdfPiecewise ) or ( fn is TRelFunction ) ) then
                        fraChartPointsEditor.isReadOnly := false
                      else
                        fraChartPointsEditor.isReadOnly := true
                      ;
                    end
                  ;
                end
              else
                begin
                  setMenuItemsEnabled( false );
                  dbcout( 'Function parameters are not valid:' + endl + msg, DBSHOWMSG );
                  fraChartPointsEditor.hideChart( tr( 'Function parameters are not valid:' ) + endl + msg );
                end
              ;
            end
          ;
        end
      ;

      if( ( nil <> @_fnChartChanged ) and ( nil <> fn ) ) then
        _fnChartChanged()
      ;

      screen.Cursor := crDefault;
    end
  ;


  procedure TFormFunctionEditor.setMenuItemsEnabled( val: boolean );
    var
      fn: TChartFunction;
    begin
      if( false = val ) then
        val := false
      else
        begin
          fn := createFunction();
          if( nil = fn ) then
            val := false
          else
            begin
              val := fn.isValid;
              //fn.debug();
              fn.Free();
            end
          ;
        end
      ;

      dbcout( 'setMenuItemsEnabled called', DBSHOWMSG );

      acnPrintChart.Enabled := val;
      acnSaveChart.Enabled := val;
      acnCopyChart.Enabled := val;

      if( val and not( isReadOnly ) ) then
        dbcout( '++ Enabling actionFinish in setMenuItemsEnabled', DBSHOWMSG )
      else
        dbcout( '-- Disabling actionFinish in setMenuItemsEnabled', DBSHOWMSG )
      ;

      acnFinish.Enabled := val and not( isReadOnly );

      btnPrintChart.Enabled := val;
      btnSaveChart.Enabled := val;
      btnCopyChart.Enabled := val;
      btnAcceptChanges.Enabled := val and not( isReadOnly );
      btnAcceptChanges2.Enabled := val and not( isReadOnly );

      acnCopyPoints.Enabled := val;
      acnSavePoints.Enabled := val;

      if( isReadOnly ) then
        begin
          mnuImportPoints.Action.OnExecute := nil;
          mnuPastePoints.Action.OnExecute := nil;
        end
      else
        begin
          mnuImportPoints.Action.OnExecute := DoNothing;
          mnuPastePoints.Action.OnExecute := DoNothing;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Properties
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.SetFnChartChanged( fnPtr: TObjFnVoid0 );
    begin
      _fnChartChanged := fnPtr;
    end
  ;


  procedure TFormFunctionEditor.setTitle( val: string );
    begin
      if( 0 = length( val ) ) then val := tr( '(Unnamed function)' );

      _title := val;
      leTitle.Text := val;
    end
  ;

  function TFormFunctionEditor.getTitle(): string; begin Result := _title; end;

  function TFormFunctionEditor.getIsReadOnly(): boolean; begin result := _isReadOnly; end;

  procedure TFormFunctionEditor.setIsReadOnly( const val: boolean );
    begin
      _isReadOnly := val;

      if( not( val ) ) then dbcout( '-- Enabling actionFinish', DBSHOWMSG );
      acnFinish.Enabled := ( not val );
      
      if( val ) then
        begin
          mnuImportPoints.Action.OnExecute := nil;
          mnuPastePoints.Action.OnExecute := nil;
        end
      else
        begin
          mnuImportPoints.Action.OnExecute := DoNothing;
          mnuPastePoints.Action.OnExecute := DoNothing;
        end
      ;

      leTitle.ReadOnly := _isReadOnly;

      if( val ) then
        begin
          //lblChanged.caption := tr( '(Locked)' ) + ' ';
          acnClose.Caption := tr( 'E&xit' );
        end
      else
        begin
          //lblChanged.caption := '';
          acnClose.Caption := tr( 'E&xit without saving changes' );
        end
      ;

      // ChartPointsEditor is always read-only, unless editing a piecewise PDF or REL.
      // Piecewise PDFs take care of themselves, but RELs need to be dealt with here.
      if( ( CTRel = chartType ) and ( not val ) ) then
        fraChartPointsEditor.isReadOnly := false
      else
        fraChartPointsEditor.isReadOnly := true
      ;

      fraFunctionParams.isReadOnly := isReadOnly;
    end
  ;


  procedure TFormFunctionEditor.setChartType( const val: TChartType );
    begin
      fraChartPointsEditor.chartType := val;
      fraFunctionParams.chartType := val;

      acnImportPiecewiseFromFile.Enabled := ( CTPdf = val );
      acnImportHistFromFile.Enabled := ( CTPdf = val );
      acnImportRelFromFile.Enabled := ( CTRel = val );

      acnImportPiecewiseFromClipboard.Enabled := ( CTPdf = val );
      acnImportHistogramFromClipboard.Enabled := ( CTPdf = val );
      acnImportRelFromClipboard.Enabled := ( CTRel = val );

      if( CTPdf = val ) then
        begin
          acnOpenNaadsmFunction.Caption := tr( '&Open NAADSM pdf file...' );
          acnSaveNaadsmFunction.Caption := tr( 'S&ave NAADSM pdf file...' );

          dlgOpenNaadsmFnFile.Filter := tr( 'NAADSM pdf files (*.npdf)|*.npdf|All files (*.*)|*.*' );
          dlgSaveNaadsmFnFile.Filter := tr( 'NAADSM pdf files (*.npdf)|*.npdf|All files (*.*)|*.*' );

          dlgSaveNaadsmFnFile.DefaultExt := 'npdf';
          dlgOpenNaadsmFnFile.DefaultExt := 'npdf';
        end
      else if( CTRel = val ) then
        begin
          acnOpenNaadsmFunction.Caption := tr( '&Open NAADSM relational function file...' );
          acnSaveNaadsmFunction.Caption := tr( 'S&ave NAADSM relational function file...' );

          dlgOpenNaadsmFnFile.Filter := tr( 'NAADSM rel files (*.nrel)|*.nrel|All files (*.*)|*.*' );
          dlgSaveNaadsmFnFile.Filter := tr( 'NAADSM rel files (*.nrel)|*.nrel|All files (*.*)|*.*' );

          dlgSaveNaadsmFnFile.DefaultExt := 'nrel';
          dlgOpenNaadsmFnFile.DefaultExt := 'nrel';
        end
      ;
    end
  ;

  
  function TFormFunctionEditor.getChartType(): TChartType;
    begin
      result := fraChartPointsEditor.chartType;
    end
  ;


  procedure TFormFunctionEditor.setAxisUnits( xAxisUnits, yAxisUnits: TChartUnitType );
    var
      fn: TChartFunction;
    begin
      _xAxisUnits := xAxisUnits;
      _yAxisUnits := yAxisUnits;

      fraChartPointsEditor.XAxisUnits := xAxisUnits;
      fraChartPointsEditor.YAxisUnits := yAxisUnits;

      fraFunctionParams.xUnits := xAxisUnits;
      fraFunctionparams.yUnits := yAxisUnits;

      fn := self.createFunction();
      updateFunctionDisplay( fraFunctionParams, fn );
      fn.Free();
    end
  ;


  procedure TFormFunctionEditor.fraFunctionParamsAxisUnitsChange( Sender: TObject );
    var
      xUnits, yUnits: TChartUnitType;
    begin
      xUnits := chartUnitTypeFromString( fraFunctionParams.cboXAxis.Items[ fraFunctionParams.cboXAxis.itemIndex ] );
      yUnits := chartUnitTypeFromString( fraFunctionParams.cboYAxis.Items[ fraFunctionParams.cboYAxis.itemIndex ] );

      setAxisUnits( xUnits, yUnits );
    end
  ;


  function TFormFunctionEditor.getSaveChanges(): boolean; begin result := _saveChanges; end;

  function TFormFunctionEditor.getUnitsLocked(): boolean; begin result := fraFunctionParams.unitsLocked; end;
  procedure TFormFunctionEditor.setUnitsLocked( const val: boolean ); begin fraFunctionParams.unitsLocked := val; end;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for importing points
//-----------------------------------------------------------------------------
  function TFormFunctionEditor.functionUnitsOK( fn: TChartFunction ): boolean;
    var
      unitsOK: boolean;
      response: integer;
      showMessageAgain: boolean;
      rel: TRelFunction;
    begin
      // If units are not locked...
      //---------------------------
      if( not unitsLocked ) then
        begin
          self.setAxisUnits( fn.xUnits, fn.yUnits );
          result := true;
          exit;
        end
      ;

      // If units are locked...
      //-----------------------
      if( fn is TPdf ) then
        unitsOK := ( self.xAxisUnits = fn.xUnits )
      else if( fn is TRelFunction ) then
        begin
          rel := fn as TRelFunction;

          // If the x units match, check the y units for possible conversions or equality.
          if( self.xAxisUnits = fn.xUnits ) then
            begin
              if( self.yAxisUnits = fn.yUnits ) then
                unitsOK := true
              else // Proportions and percentages are interchangeable.  Try the conversions here.
                unitsOK := ( rel.convertYUnitsTo( self.yAxisUnits ) )
              ;
            end
          else // The x units didn't match, so who cares about the Y units?
            unitsOK := false
          ;
        end
      else // The function is neither a PDF or a REL.  Someone screwed something up.
        raise exception.Create( 'Function is neither a PDF or a REL in TFormFunctionEditor.functionUnitsOK()' )
      ;

      if( unitsOK ) then
        result := true
      else if( not _showFunctionWarning ) then
        begin
          fn.xUnits := self.xAxisUnits;
          fn.yUnits := self.yAxisUnits;
          result := true;
        end
      else // display a warning message and ask the user what to do
        begin
          response := msgYesNoCheckbox(
            tr( 'Units of this function do not correspond to units used in the function editor.  Values of the function will be preserved, but units will be reset.  Continue?' ),
            tr( 'Do not show this message again' ),
            showMessageAgain,
            tr( 'Mismatched units' ),
            IMGWarning,
            self
          );
          _showFunctionWarning := not( showMessageAgain );

          if( mrYes = response ) then
            begin
              fn.xUnits := self.xAxisUnits;
              fn.yUnits := self.yAxisUnits;
              result := true;
            end
          else
            result := false
          ;
        end
      ;
    end
  ;


  procedure TFormFunctionEditor.pasteXml( Sender: TObject );
    var
      chart: TChartFunction;
      errMsg: string;
    begin
      if( Clipboard.HasFormat( CF_TEXT ) ) then
        begin
          case chartType of
            CTPdf: chart := createPdfFromXml( clipboard.AsText );
            CTRel: chart := createRelFromXml( clipboard.AsText );
            else raise exception.create( 'chartType is not specified in TFormFunctionEditor.pasteXml()' );
          end;

          if( nil = chart ) then
            begin
              msgOK(
                tr( 'The clipboard does not contain a recognized function.' ),
                tr( 'Cannot import function' ),
                IMGCritical,
                self
              );
            end
          else if( chart.validate( @errMsg ) ) then
            begin
              if( functionUnitsOK( chart ) ) then
                setFunction( chart )
              ;
            end
          else
            begin
              msgOK(
                tr( 'This function cannot be imported.  The following errors were found:' + endl + errMsg ),
                tr( 'Cannot import function' ),
                IMGCritical,
                self
              );
            end
          ;

          freeAndNil( chart );
        end
      ;
    end
  ;


  function TFormFunctionEditor.getImportString( Sender: TObject; var strToParse: string ): boolean;
    var
      shortFileName: string;
      pointsFile: TextFile;
      tmp: string;
    begin
      result := false;
      strToParse := '';

      if( ( sender = acnImportPiecewiseFromFile ) or ( sender = acnImportHistFromFile ) or ( sender = acnImportRelFromFile ) ) then
        begin
          // Import from file
          //-----------------
          if( dlgImportCSV.Execute() ) then
            begin
              shortFileName := abbrevPath( dlgImportCSV.FileName );
              try
                try
                  AssignFile( pointsFile, dlgImportCSV.FileName );
                  Reset( pointsFile );

                  while not eof( pointsFile ) do
                    begin
                      readLn( pointsFile, tmp );
                      strToParse := strToParse + tmp + endl;
                    end
                  ;
                  result := true;
                except
                  msgOK(
                    ansiReplaceStr( tr( 'The file xyz could not be opened. It may be in use by another application.' ), 'xyz', shortFileName ),
                    tr( 'Cannot import points' ),
                    IMGCritical,
                    self
                  );
                  strToParse := '';
                  result := false;
                end;
              finally
                closeFile( pointsFile );
              end;
            end
          ;
        end
      else if( ( sender = acnImportPiecewiseFromClipboard ) or ( sender = acnImportHistogramFromClipboard ) or ( sender = acnImportRelFromClipboard ) ) then
        begin
          // Import from clipboard
          //----------------------
          if Clipboard.HasFormat( CF_TEXT ) then
            begin
              strToParse := Clipboard.AsText;
              result := true;
            end
          else
            begin
              msgOK(
                tr( 'Clipboard data is not in text format: points could not be imported.' ),
                tr( 'Cannot import points' ),
                IMGCritical,
                self
              );
              result := false;
            end
          ;
        end
      else
        begin
          // A programmer screwed up
          //------------------------
          raise exception.create( 'Wrong sender (' + (Sender as TComponent).Name + ') in TFormFunctionEditor.getImportString()' );
          result := false;
        end
      ;

      if( true = result ) then
        begin
          strToParse := trim( strToParse );
          if( 0 = length( strToParse ) ) then
            begin
              msgOK(
                tr( 'There is no data to parse.' ),
                tr( 'Parsing failed' ),
                IMGCritical,
                self
              );
              result := false;
            end
          ;
        end
      ;
    end
  ;


  function TFormFunctionEditor.checkRows( parser: TCSVContents; pointArray: T2DPointList ): boolean;
    var
      xColumn, yColumn: integer;
      lastCompleteRow: integer;
      i: integer;
      x, y: double;
    begin
      dbcout( 'Start checkRows()...', DBSHOWMSG );

      xColumn := -1;
      yColumn := -1;

      // Check header row
      //-----------------
      // FIX ME: this search could be a bit more robust
      // (don't allow duplicate column names)
      for i := 0 to parser.columnCount - 1 do
        begin
          if( 'x' = fixup( parser.header(i) ) ) then xColumn := i;
          if( 'y' = fixup( parser.header(i) ) ) then yColumn := i;
        end
      ;

      // Check that required columns are present
      if( ( -1 = xColumn ) or ( -1 = yColumn ) ) then
        begin
          msgOK(
            tr( 'Data is missing the "x" column and/or the "y" column.  Please check your data format.' ),
            tr( 'Parsing failed' ),
            IMGCritical,
            self
          );
          result := false;
          exit;
        end
      ;

      // Read the individual rows
      //-------------------------
      lastCompleteRow := 0;

      try
        for i := 0 to parser.rowCount - 1 do
          begin
            Application.ProcessMessages();
            lastCompleteRow := i;

            //if( not( parser.rowIsEmpty( i ) ) ) then
              //begin
                x := csvStrToFloat( parser.value( xColumn, i ), -1.0 );
                y := csvStrToFloat( parser.value( yColumn, i ), -1.0 );

                // x values are allowed to be negative for a "generic" piecewise PDF.
                // Whether x values should be negative for distances and durations in NAADSM is a whole other matter...
                if( (* ( 0.0 > x ) or *) ( 0.0 > y ) ) then
                  begin
                    msgOK(
                      ansiReplaceStr( tr( 'Data could not be parsed: a negative or nonnumeric value was found on line zxy.  Please check your data format.' ), 'zxy', intToStr( i ) ),
                      tr( 'Parsing failed' ),
                      IMGCritical,
                      self
                    );
                    if( nil <> pointArray ) then
                      freeAndNil( pointArray )
                    ;
                    result := false;
                    exit;
                  end
                else
                  pointArray.Append( T2DPoint.create( x, y ) )
                ;
              //end
            //;
          end
        ;
      except
        msgOK(
          ansiReplaceStr( tr( 'Data could not be parsed: an error occurred at or near line zyx.  Please check your data format.' ), 'zyx', intToStr( lastCompleteRow ) ),
          tr( 'Parsing failed' ),
          IMGCritical,
          self
        );
        result := false;
        exit;
      end;

      // If we made it this far...
      //--------------------------
      result := true;

      dbcout( 'Done checkRows()', DBSHOWMSG );
    end
  ;


  procedure TFormFunctionEditor.makePiecewisePdf( points: T2DPointList );
    var
      pdf: TPdfPiecewise;
      errMsg: string;
    begin
      pdf := TPdfPiecewise.create( points, fraFunctionParams.xUnits );

      if( pdf.validate( @errMsg ) ) then
        setFunction( pdf )
      else
        begin
          msgOK(
            tr( 'This function cannot be imported.  The following errors were found:' + endl + errMsg ),
            tr( 'Cannot import function' ),
            IMGCritical,
            self
          );
        end
      ;

      freeAndNil ( pdf );
    end
  ;


  procedure TFormFunctionEditor.makeHistogramPdf( points: T2DPointList );
    var
      pdf: TPdfHistogram;
      errMsg: string;
      i: integer;
      rcd: RHistogramPointArray;
    begin
      setLength( rcd, points.Count );
      for i := 0 to points.Count - 1 do
        begin
          rcd[i].range := points.at(i).x;
          rcd[i].count := points.at(i).y;
          rcd[i].density := -1.0;
        end
      ;

      pdf := TPdfHistogram.create( rcd, fraFunctionParams.xUnits );

      setLength( rcd, 0 );

      if( pdf.validate( @errMsg ) ) then
        setFunction( pdf )
      else
        begin
          msgOK(
            tr( 'This function cannot be imported.  The following errors were found:' + endl + errMsg ),
            tr( 'Cannot import function' ),
            IMGCritical,
            self
          );
        end
      ;

      freeAndNil ( pdf );
    end
  ;


  procedure TFormFunctionEditor.makeRelationalFunction( points: T2DPointList );
    var
      rel: TRelFunction;
      errMsg: string;
    begin
      rel := TRelFunction.create( points, fraFunctionParams.xUnits, fraFunctionParams.yUnits );
      //rel.debug();

      if( rel.validate( @errMsg ) ) then
        setFunction( rel )
      else
        begin
          msgOK(
            tr( 'This function cannot be imported.  The following errors were found:' + endl + errMsg ),
            tr( 'Cannot import function' ),
            IMGCritical,
            self
          );
        end
      ;

      freeAndNil ( rel );
    end
  ;


  procedure TFormFunctionEditor.importPoints( Sender: TObject );
    var
      strToParse: string;
      parser: TCSVContents;
      points: T2DPointList;
    begin
      // Get the string to be parsed
      //----------------------------
      dbcout( 'Step 1...', DBSHOWMSG );
      if( not(  getImportString( sender, strToParse ) ) ) then
        exit
      ;

      // Attempt to parse the CSV string
      //--------------------------------
      dbcout( 'Step 2...', DBSHOWMSG );
      dbcout( strToParse, DBSHOWMSG );
      
      parser := TCSVContents.createFromString( strToParse, csvListSep(), true );

      if not( parser.parseSuccess ) then
        begin
          msgOK(
            tr( 'Data could not be parsed.  Please check that you are using comma-delimited data.' ),
            tr( 'Parsing failed' ),
            IMGCritical,
            self
          );
          freeAndNil( parser );
          exit;
        end
      ;
      dbcout( 'Step 2 done', DBSHOWMSG );


      // Read values
      //------------
      points := T2DPointList.Create();

      if( not( checkRows( parser, points ) ) ) then
        begin
          freeAndNil( parser );
          freeAndNil( points );
          exit;
        end
      ;

      // Create the selected function type
      //----------------------------------
      if( ( sender = acnImportPiecewiseFromFile ) or ( sender = acnImportPiecewiseFromClipboard ) ) then
        makePiecewisePdf( points )
      else if( ( sender = acnImportHistFromFile ) or ( sender = acnImportHistogramFromClipboard ) ) then
        makeHistogramPdf( points )
      else if( ( sender = acnImportRelFromFile ) or ( sender = acnImportRelFromClipboard ) ) then
        makeRelationalFunction( points )
      else
        raise exception.create( 'Wrong sender (' + (Sender as TComponent).Name + ') in TFormFunctionEditor.importPoints()' );
      ;

      // Cleanup
      //---------
      freeAndNil( parser );
      freeAndNil( points );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for exporting points
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.copyXml( Sender: TObject );
  var
    s: String;
  begin
    s := functionAsXml();
    
    if( 0 < length( s ) ) then
      ClipBoard.SetTextBuf( PChar(s) )
    else
      msgOK(
        tr( 'Copy failed.  Ensure that the function is valid.' ),
        '',
        IMGWarning,
        self
      )
    ;
    end
  ;


  procedure TFormFunctionEditor.savePoints(Sender: TObject);
    var
      f: TextFile;
      fileSuccess: boolean;

      s: String;
    begin
      if( dlgExportCSV.Execute() ) then
        begin
          s := functionAsCsv();

          if( 0 < length( s ) ) then
            begin
              try
                try
                  AssignFile( f, dlgExportCSV.FileName );
                  Rewrite( f );
                  write( f, s );
                  fileSuccess := true;
                except
                  fileSuccess := false;
                end;
              finally
                closeFile( f );
              end;

              if( fileSuccess ) then
                msgOK(
                  ansiReplaceStr( tr( 'Points were written to file xyz.' ), 'xyz', abbrevPath( dlgExportCSV.FileName ) ),
                  '',
                  IMGSuccess,
                  self
                )
              else
                msgOK(
                  ansiReplaceStr( tr( 'File xyz' ), 'xyz', abbrevpath( dlgExportCSV.FileName ) ) + ' ' + tr( 'could not be written.' ),
                  '',
                  IMGWarning,
                  self
                )
              ;
            end
          else
            msgOK(
              ansiReplaceStr( tr( 'Points could not be written to file xyz.  Ensure that the function is valid.' ), 'xyz', abbrevpath( dlgExportCSV.FileName ) ),
              '',
              IMGWarning,
              self
            )
          ;
        end
      ;
    end
  ;


 procedure TFormFunctionEditor.copyPoints(Sender: TObject);
  var
    s: String;
  begin
    s := functionAsCsv();
    
    if( 0 < length( s ) ) then
      ClipBoard.SetTextBuf( PChar(s) )
    else
      msgOK(
        tr( 'Points could not be exported to the clipboard.  Ensure that the function is valid.' ),
        '',
        IMGWarning,
        self
      )
    ;
  end
;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Chart utilities and related functions
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.saveChartToWMF( sender: TObject );
    var
      success: boolean;
    begin
      if( dlgSaveWMF.Execute ) then
        begin
          success := fraChartPointsEditor.saveChartToFile( dlgSaveWMF.FileName );

          if( not success ) then
            msgOK(
              ansiReplaceStr( tr( 'This chart could not be saved to xyz.' ), 'xyz', abbrevPath( dlgSaveWMF.FileName ) ),
              '',
              IMGWarning
            )
          ;
        end
      ;

      fraChartPointsEditor.Repaint();
      repaint();
    end
  ;


  procedure TFormFunctionEditor.printChart( sender: TObject );
    var
      success: boolean;
    begin
      if( sender = acnPrintChart ) then
        begin
          if( not( dlgPrint.Execute() ) ) then exit;
        end
      ;

      success := fraChartPointsEditor.printChart();

      if( not success ) then
        msgOK(
          tr( 'The chart could not be printed.' ),
          '',
          IMGWarning
        )
      ;

      fraChartPointsEditor.Repaint();
      repaint();
    end
  ;


  procedure TFormFunctionEditor.copyChartToClipboard( sender: TObject );
    var
      success: boolean;
    begin
      success := fraChartPointsEditor.copyChartToClipboard();

      if( not success ) then
        msgOK(
          tr( 'This chart could not be copied to the clipboard.' ),
          '',
          IMGWarning
        )
      ;

      fraChartPointsEditor.Repaint();
      repaint();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Other menu options
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.openNaadsmFunctionFile( sender: TObject );
    var
      shortFileName: string;
      
      sdew: TSdew;
      root: pointer;
      
      fn: TChartFunction;
      success: boolean;
    begin
      if( not dlgOpenNaadsmFnFile.Execute() ) then
        exit
      ;

      success := true; // Until shown otherwise
      shortFileName := abbrevPath( dlgOpenNaadsmFnFile.FileName );

      sdew := TSdew.createFromFile( PAnsiChar( dlgOpenNaadsmFnFile.FileName ) );
      root := sdew.GetRootTree();

      if( nil = root ) then
        begin
          msgOK(
            ansiReplaceStr( tr( 'The file xyz could not be opened or is not the correct format.' ), 'xyz', shortFileName ),
            tr( 'Cannot open file' ),
            IMGCritical,
            self
          );
          success := false;
        end
      ;

      fn := nil;

      if( success ) then
        begin
          case chartType of
            CTPdf: fn := createPdfFromXml( root, sdew );
            CTRel: fn := createRelFromXml( root, sdew );
            else raise exception.Create( 'Unsupported chart type in TFormFunctionEditor.openNaadsmFunctionFile()' );
          end;
        end
      ;

      if( nil = fn ) then
        begin
          msgOK(
            tr( 'The selected file does not appear to be a valid NAADSM distribution.' ),
            tr( 'Invalid file format' ),
            IMGCritical,
            self
          );
        end
      else
        begin
          if( functionUnitsOK( fn ) ) then
            setFunction( fn )
          ;
          fn.Free();
        end
      ;

      sdew.Free();
    end
  ;


  procedure TFormFunctionEditor.saveNaadsmFunctionFile( sender: TObject );
    var
      success: boolean;
      fn: TChartFunction;
      defaultExtension: string;
      f: TextFile;
      fileName: string;
    begin
      case chartType of
        CTPdf: defaultExtension := '.npdf';
        CTRel: defaultExtension := '.nrel';
        else raise exception.Create( 'Unsupported chart type in TFormFunctionEditor.saveNaadsmFunctionFile()' );
      end;

      success := true; // Until shown otherwise

      fn := self.createFunction();

      if( ( nil = fn ) or not( fn.isValid ) ) then
        begin
          msgOK(
            tr( 'This function is not valid, and cannot not be saved.' ),
            '',
            IMGWarning
          );

          success := false;
        end
      ;

      if( success and dlgSaveNaadsmFnFile.Execute() ) then
        begin
          fileName := dlgSaveNaadsmFnFile.FileName;

          if( defaultExtension <> lower( rightStr( fileName, 5 ) ) ) then
            fileName := fileName + defaultExtension
          ;

          try
            assignUnicode( f, fileName );
            rewrite( f );
            writeln( f, '<?xml version="1.0" encoding="UTF-16" ?>' + endl + fn.ssXml( 0 ) + endl );
            closeFile( f );
            success := true;
          except
            success := false;
          end;

          if( not success ) then
            begin
                msgOK(
                  tr( 'The file cannot be saved.' ) + ' '
                    + tr( 'You may need to check your available hard disk space.' ),
                  tr( 'Cannot save file' ),
                  IMGWarning,
                  Self
                );
            end
          ;
        end
      ;

      freeAndNil( fn );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Other menu options
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.ActionExitExecute(Sender: TObject);
    begin
      _saveChanges := false;
      Close();
    end
  ;


  procedure TFormFunctionEditor.ActionSaveExitExecute( sender: TObject );
    var
      fn: TChartFunction;
    begin
      try
        dbcout( '** Starting TFormFunctionEditor.ActionSaveExitExecute...', DBSHOWMSG );
        
        fn := createFunction();

        if( nil = fn ) then
          msgOK(
            tr( 'The function type is unspecified, or the parameters are not valid for the specified type.  Please correct this problem and try again.' ),
            tr( 'No function or invalid parameters' ),
            ImgInformation,
            self
          )
        else if( not( fn.isValid ) ) then
          msgOK(
            tr( 'Function parameters are not valid for the specified type.  Please correct this problem and try again.' ),
            tr( 'Invalid function parameters' ),
            IMGInformation,
            self
          )
        else if( 0 = length( fn.name ) ) then
          begin
            msgOK(
              tr( 'Please enter a name for this function.' ),
              tr( 'No name provided' ),
              IMGInformation,
              self
            );
            leTitle.SetFocus();
          end
        else
          begin
            _saveChanges := true;
            Close();
          end
        ;
      finally
        freeAndNil( fn );
      end;

      dbcout( '** Done with TFormFunctionEditor.ActionSaveExitExecute', DBSHOWMSG );
    end
  ;


  procedure TFormFunctionEditor.ActionHelpExecute(Sender: TObject);
    begin

      if( isReadOnly ) then
        msgOK(
          tr( 'This is a read-only chart: it may be viewed, exported or printed, but not modified.' ),
          tr( 'Chart editor' ),
          IMGInformation,
          self
        )
      else
        begin
          if
            ( ( CTPdf = chartType ) and ( 4 = fraFunctionParams.cboPdfType.ItemIndex ) )
          or
            ( CTRel = chartType )
          then
            msgOK(
              tr( 'Drag points with the left mouse button to reposition them.' ) + ' ' + endl + endl
                + tr( 'Right click on points to remove or edit the position of a point.' ) + ' ' + endl + endl
                + tr( 'Right click on a position to create a new point.' ) + ' ' + endl + endl
                + tr( 'Drag points off the chart to expand the axes.' ) + endl + endl
                + tr( 'Alternatively, edit the point values in the grid shown on the left side of the screen.' )
                + '  ' + tr( 'Click ''OK'' to apply your changes.' ),
              tr( 'Chart editor' ),
              IMGInformation,
              self
            )
          else
            msgOK(
              tr( 'Select a type of probability density function from the list, and enter all of the required parameters.' )
                + '  ' + tr( 'Click on the green checkmark to apply the changes and view the function.' ) + endl + endl
                + tr( 'If no chart is displayed, correct the problems described in the error message shown on the right side of the window.' ),
              tr( 'Chart editor' ),
              IMGInformation,
              self
            )
          ;
        end
      ;


    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Other GUI event handlers
//-----------------------------------------------------------------------------
  procedure TFormFunctionEditor.leTitleKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    var
      le: TEdit;
    begin
      le := sender as TEdit;

      if( ( ssCtrl in shift ) and ( 65 = key ) ) then // CTRL-A
        le.SelectAll
      ;
    end
  ;


  procedure TFormFunctionEditor.fraChartPointsEditorcbxShowDiscreteApproxClick( Sender: TObject );
    var
      fn: TPdf;
    begin
      if( CTPdf = chartType ) then
        begin
          fn := fraFunctionParams.createPdf();
          fraChartPointsEditor.drawDiscreteApprox( fn );
          fn.Free();
        end
      ;
    end
  ;


  procedure TFormFunctionEditor.fraFunctionParamsCboKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    begin
      if( ( ssCtrl in shift ) and ( 67 = key ) ) then // CTRL-C
        copyXml( sender )
      ;
    end
  ;
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



initialization

  _showFunctionWarning := true;

end.
