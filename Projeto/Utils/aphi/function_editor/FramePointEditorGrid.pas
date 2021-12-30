unit FramePointEditorGrid;

(*
FramePointEditorGrid.pas/dfm
----------------------------
Begin: 2005/11/10
Last revision: $Date: 2013-06-27 19:11:23 $ $Author: areeves $
Version number: $Revision: 1.9.4.5 $
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
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls,
    Buttons,
    ExtCtrls,
    Grids,
    Variants,
    Menus,
    FunctionPointers,

    MyDelphiArrayUtils,
    Points,

    ProbDensityFunctions
  ;

  type StartGridType = array[0..1] of array of string[20];

  type TFramePointEditorGrid = class( TFrame )
      pnlButtonContainer: TPanel;
      stgPoints: TStringGrid;
      pnlButtons: TPanel;
      btnOK: TBitBtn;
      btnCancel: TBitBtn;
      mnuRowEditor: TPopupMenu;
      itemInsertRow: TMenuItem;
      itemDeleteRow: TMenuItem;

      procedure stgPointsKeyPress( Sender: TObject; var Key: Char );

      procedure btnCancelClick( Sender: TObject );
      procedure btnOKClick( Sender: TObject );

      procedure stgPointsEnter(Sender: TObject);

      procedure stgPointsMouseDown(
        Sender: TObject;
        Button: TMouseButton;
        Shift: TShiftState;
        X, Y: Integer
      );
      procedure itemInsertRowClick(Sender: TObject);
      procedure itemDeleteRowClick(Sender: TObject);

    protected
    	// For internal use
    	//-----------------
      StartGrid: StartGridType;
      PDF: boolean;
      Posn: longint;
      _myParent: TWinControl;

      _currentColumn: integer;
      _currentRow: integer;

      _generalPoints: T2DPointList;

      _setParentMenuItemsEnabled: TObjFnVoid1Bool;

      // properties
      //-----------
      _prAllPointsEdited: boolean;

      procedure translateUI();

      // Properties
      //-----------
      function getAllPointsEdited(): boolean;

      function getVisible(): boolean;
      procedure setVisible( val: boolean );

    public
      // Construction/initialization/destruction
      //----------------------------------------
    	constructor create( AOwner: TComponent ); override;
			destructor destroy(); override;

      // Used for setting function pointer(s)
      //-------------------------------------
      procedure setSetParentMenuItemsEnabled( fn: TObjFnVoid1Bool );

			// Useful public functions
			//------------------------
      procedure setPointsPiecewisePdf( pnt: RPointArray );
      procedure setPointsRelFunction( pnt: RPointArray );
      procedure setPointsHistogramPdf( rcd: RHistogramPointArray );

			// Properties
			//-----------
      property allPointsEdited: boolean read getAllPointsEdited;
      property visible: boolean read getVisible write setVisible;

  	end
  ;

  const
    DBFRAMEPOINTEDITORGRID: boolean = false; // set to true to enable debugging messages for this unit

implementation

	{$R *.DFM}

  uses
    Math,
    Clipbrd,

    MyStrUtils,
    DebugWindow,
    ControlUtils,
    I88n
  ;

  const
    DBSHOWMSG: boolean = false; // Set to true to enable debugging messages for this unit


//-----------------------------------------------------------------------------
// Construction/initialization/destruction
//-----------------------------------------------------------------------------
  constructor TFramePointEditorGrid.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      translateUI();

      _setParentMenuItemsEnabled := nil;

      _myParent := AOwner as TWinControl;
      _prAllPointsEdited := True;

      stgPoints.Cells[0,0] := tr( 'X' );
      stgPoints.Cells[1,0] := tr( 'Y' );
      stgPoints.DefaultColWidth := self.Width div 2;

      _generalPoints := T2DPointList.create();

      _currentColumn := -1;
      _currentRow := -1;
    end
  ;
    
    
  procedure TFramePointEditorGrid.translateUI();
    begin
      // This function was generated automatically by Caption Collector 0.6.0.
      // Generation date: Mon Feb 25 15:50:37 2008
      // File name: C:/Documents and Settings/apreeves/My Documents/NAADSM/Interface-Fremont/general_purpose_gui/function_editor/FramePointEditorGrid.dfm
      // File date: Thu Nov 10 10:52:48 2005

      // Set Caption, Hint, Text, and Filter properties
      with self do
        begin
          btnOK.Caption := tr( 'OK' );
          btnCancel.Caption := tr( 'Cancel' );
        end
      ;

    end
  ;
    
  
  destructor TFramePointEditorGrid.destroy();
  	begin
  		// Not sure what these do here: copied over from Mark's DestroyForm event.
      StartGrid[0] := nil;
      StartGrid[1] := nil;

      _generalPoints.Free();
      
  		inherited destroy();
  	end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
//  Useful public functions
//-----------------------------------------------------------------------------
  procedure TFramePointEditorGrid.setPointsPiecewisePdf( pnt: RPointArray );
    var
      i: integer;
    begin
      _generalPoints.Assign( pnt );

      stgPoints.RowCount := _generalPoints.Count + 1; // Don't forget the header row
      stgPoints.Cells[0,0] := tr( 'X' );
      stgPoints.Cells[1,0] := tr( 'Y' );

      for i := 0 to _generalPoints.Count - 1 do
        begin
          stgPoints.Cells[0, i+1] := uiFloatToStr( _generalPoints.at(i).x );
          stgPoints.Cells[1, i+1] := uiFloatToStr( _generalPoints.at(i).y );
        end
      ;
    end
  ;


  procedure TFramePointEditorGrid.setPointsRelFunction( pnt: RPointArray );
    var
      i: integer;
    begin
      _generalPoints.Assign( pnt );

      stgPoints.RowCount := _generalPoints.Count + 1; // Don't forget the header row
      stgPoints.Cells[0,0] := tr( 'X' );
      stgPoints.Cells[1,0] := tr( 'Y' );

      for i := 0 to _generalPoints.Count - 1 do
        begin
          stgPoints.Cells[0, i+1] := uiFloatToStr( _generalPoints.at(i).x );
          stgPoints.Cells[1, i+1] := uiFloatToStr( _generalPoints.at(i).y );
        end
      ;
    end
  ;


  procedure TFramePointEditorGrid.setPointsHistogramPdf( rcd: RHistogramPointArray );
    var
      i: integer;
    begin
      _generalPoints.Clear();

      stgPoints.RowCount := length( rcd ) + 1; // Don't forget the header row
      stgPoints.Cells[0,0] := tr( 'Bin' );
      stgPoints.Cells[1,0] := tr( 'Count' );

      for i := 0 to length( rcd ) - 1 do
        begin
          _generalPoints.append( T2DPoint.create( rcd[i].range, rcd[i].count ) );
          stgPoints.Cells[0, i+1] := uiFloatToStr( rcd[i].range );
          stgPoints.Cells[1, i+1] := uiFloatToStr( rcd[i].count);
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Function pointers
//-----------------------------------------------------------------------------
  procedure TFramePointEditorGrid.setSetParentMenuItemsEnabled( fn: TObjFnVoid1Bool );
    begin
      _setParentMenuItemsEnabled := fn;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Event handlers
//-----------------------------------------------------------------------------
  procedure TFramePointEditorGrid.btnOKClick(Sender: TObject);
    begin
      dbcout( 'OK clicked', DBSHOWMSG );

      btnOK.Enabled := false;
      btnCancel.Enabled := false;

      if( nil <> @_setParentMenuitemsEnabled ) then
        _setParentMenuItemsEnabled( true )
      ;
    end
  ;


  procedure TFramePointEditorGrid.btnCancelClick(Sender: TObject);
    begin
      dbcout( 'Cancel clicked', DBSHOWMSG );

      btnOK.Enabled := false;
      btnCancel.Enabled := false;

      if( nil <> @_setParentMenuitemsEnabled ) then
        _setParentMenuItemsEnabled( true )
      ;
    end
  ;

  procedure TFramePointEditorGrid.stgPointsEnter(Sender: TObject);
    begin
      inherited;

      dbcout( 'TFramePointEditorGrid.stgPointsEnter()', DBSHOWMSG );


      btnOK.Enabled := true;
      btnCancel.Enabled := true;

      dbcout( '_setParentMenuitemsEnabled is nil: ' + uiBoolToText( nil = @_setParentMenuitemsEnabled ), DBSHOWMSG );


      if( nil <> @_setParentMenuitemsEnabled ) then
        _setParentMenuItemsEnabled( false )
      ;

      dbcout( 'Done TFramePointEditorGrid.stgPointsEnter()', DBSHOWMSG );
    end
  ;


  procedure TFramePointEditorGrid.stgPointsKeyPress(Sender: TObject; var Key: Char);
    var
      s: string;
    begin
      inherited;

      if( 3 = ord( key ) ) then // ctrl-C
        ClipBoard.SetTextBuf( PChar( stgPoints.Cells[ stgPoints.Col, stgPoints.Row ] ) )
      else if( 22 = ord( key ) ) then // ctrl-V
        begin
          if( Clipboard.HasFormat( CF_TEXT ) ) then
            begin
              s := fixup( clipboard.AsText );
              if( not( isNaN( uiStrToFloat( s, NaN ) ) ) ) then
                stgPoints.Cells[ stgPoints.Col, stgPoints.Row ] := s
              ;
            end
          ;
        end
      else if( 24 = ord( key ) ) then // ctrl-X
        begin
          ClipBoard.SetTextBuf( PChar( stgPoints.Cells[ stgPoints.Col, stgPoints.Row ] ) );
          stgPoints.Cells[ stgPoints.Col, stgPoints.Row ] := '';
        end
      ;
      
      // Only allow number keys, -, decimal point, and backspace
      if not (Key in ['0'..'9', '-', sysDecPt(), CHAR_BACKSPACE ]) then
        Key := ^@
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Properties
//-----------------------------------------------------------------------------
	function TFramePointEditorGrid.getAllPointsEdited(): boolean; begin result := _prAllPointsEdited; end;


  function TFramePointEditorGrid.getVisible(): boolean;
    begin
      result := inherited visible;
    end
  ;


  procedure TFramePointEditorGrid.setVisible( val: boolean );
    begin
      self.Width := _myParent.Width;
      pnlButtonContainer.Width := _myParent.Width;

      horizCenterInside( pnlButtons, pnlButtonContainer );

      stgPoints.DefaultColWidth := self.Width div 2;
      stgPoints.ColWidths[0] := self.Width div 2 - 10;
      stgPoints.ColWidths[1] := self.Width div 2 - 10;
      
      inherited visible := val;
    end
  ;
//-----------------------------------------------------------------------------




  procedure TFramePointEditorGrid.stgPointsMouseDown(
        Sender: TObject;
        Button: TMouseButton;
        Shift: TShiftState;
        X, Y: Integer
      );
    var
      clientPoint: TPoint;
      screenPoint: TPoint;
      rect: TGridRect;
    begin
      inherited;
      
      clientPoint.X := x;
      clientPoint.Y := y;

      screenPoint := clientToScreen( clientPoint );
      
      try
        stgPoints.MouseToCell( x, y, _currentColumn, _currentRow );
      except
        _currentColumn := -1;
        _currentRow := -1;
      end;

      if( mbRight = Button ) then
        begin
          // Show the Add/Delete Row popup when the mouse is in a valid cell,
          // the Fixed Row and areas of the grid outside the cells are not valid
          if (( 0 <> _currentRow ) and ( _currentRow <> -1 )) then
            begin
              with rect do
                begin
                  left := 0;
                  right := 2;
                  top := _currentRow;
                  bottom := _currentRow;
                end
              ;
              stgPoints.Selection := rect;
              mnuRowEditor.Popup( screenPoint.x, screenPoint.y + 5 );
            end
          ;
        end
      ;

      dbcout( 'c = %d, r = %d', [_currentColumn, _currentRow], DBSHOWMSG );
    end
  ;



  procedure TFramePointEditorGrid.itemInsertRowClick(Sender: TObject);
    var
      colX: TStringList;
      ColY: TStringList;
      i: integer;
      x, y: string;
    begin

      // Behavior changed so the popup should not show and fire this event
      // if the mouse is in the grid but not in a valid area, but just in case:
      if ( -1 = _currentRow ) then exit;

      colX := TStringList.Create();
      colY := TStringList.Create();

      for i := 0 to stgPoints.RowCount - 1 do
        begin
          colX.Add( stgPoints.Cells[0,i] );
          colY.Add( stgPoints.Cells[1,i] );
        end
      ;

      // insert a row in the appropriate place
      if( 1 < _currentRow ) then
        begin
          x := uiFloatToStr( ( uiStrToFloat( colX[ _currentRow - 1 ] ) + uiStrToFloat( colX[ _currentRow ] ) ) / 2 );
          y := uiFloatToStr( ( uiStrToFloat( colY[ _currentRow - 1 ] ) + uiStrToFloat( colY[ _currentRow ] ) ) / 2 );
        end
      else
        begin
          x := colX[ 1 ];
          y := colY[ 1 ];
        end
      ;

      colX.Insert( _currentRow, x );
      colY.Insert( _currentRow, y );

      stgPoints.RowCount := stgPoints.RowCount + 1;
      for i := 0 to stgPoints.RowCount - 1 do
        begin
          stgPoints.Cells[ 0, i ] := colX[ i ];
          stgPoints.Cells[ 1, i ] := colY[ i ];
        end
      ;

      itemDeleteRow.Enabled := ( 3 < stgPoints.RowCount );

      freeAndNil( colX );
      freeAndNil( colY );
    end
  ;



  procedure TFramePointEditorGrid.itemDeleteRowClick(Sender: TObject);
    var
      colX: TStringList;
      ColY: TStringList;
      i: integer;
    begin

      // Behavior changed so the popup should not show and fire this event
      // if the mouse is in the grid but not in a valid area, but just in case:
      if ( -1 = _currentRow ) then exit;

      colX := TStringList.Create();
      colY := TStringList.Create();

      for i := 0 to stgPoints.RowCount - 1 do
        begin
          colX.Add( stgPoints.Cells[0,i] );
          colY.Add( stgPoints.Cells[1,i] );
        end
      ;

      colX.Delete( _currentRow );
      colY.Delete( _currentRow );

      stgPoints.RowCount := stgPoints.RowCount - 1;
      for i := 0 to stgPoints.RowCount - 1 do
        begin
          stgPoints.Cells[ 0, i ] := colX[ i ];
          stgPoints.Cells[ 1, i ] := colY[ i ];
        end
      ;

      itemDeleteRow.Enabled := ( 3 < stgPoints.RowCount );

      freeAndNil( colX );
      freeAndNil( colY );
    end
  ;



end.
