{*
ControlUtils.pas  - Controlling the state (enabled, invisible, ability to repaint) and location of form controls
----------------
Begin: 2005/02/11
Last revision: $Date: 2009-08-25 01:36:00 $ $Author: areeves $
Version number: $Revision: 1.12 $
Code Documentation Tags: Begin 2009-08-10, Last Revision: 2009-08-10
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit ControlUtils;

interface


  uses
    Contnrs,
    Controls,
    Forms
  ;

  (*
    Centers the first control relative to the second control.  Note that
    the second control should not contain the first control!  (if this is
    the case, use the "centerInside" functions below.)

    @param ctrl1 The control to move
    @param ctrl2 The reference control
  *)

	procedure horizCenter( ctrl1, ctrl2: TControl );
	procedure vertCenter( ctrl1, ctrl2: TControl );
  procedure center( ctrl1, ctrl2: TControl );

  procedure horizCenterScreen( ctrl1: TControl );
  procedure vertCenterScreen( ctrl1: TControl );
  procedure centerScreen( ctrl1: TControl );

  { Horizontally centers the first control inside the second control, which contains it. }
  procedure horizCenterInside( centeree, container: TControl );

  { Vertically centers the first control inside the second control, which contains it. }
  procedure vertCenterInside( centeree, container: TControl );

  { Centers the first control inside the second control, which contains it. }
  procedure horizVertCenterInside( centeree, container: TControl );

	procedure setChildrenEnabled( ctrl: TWinControl; val: boolean; recurse: boolean = false );
	procedure setChildrenVisible( ctrl: TWinControl; val: boolean; recurse: boolean = false );
  procedure centerChildren( ctrl: TWinControl; recurse: boolean = false );

  { Indicates whether ctrl is somewhere on obj. }
  function controlIsInObject( ctrl: TControl; obj: TWinControl ): boolean;

  procedure dbControlNames( container: TWinControl; recurseCounter: integer );

  function createListOfPanels( obj: TWinControl; const recurse: boolean = true ): TObjectList;

  //procedure leFocusAndSelect()

  procedure lockForm( frm: TForm );
  procedure lockWindow( frm: TForm );
  procedure lockControl( ctrl: TWinControl );

  procedure unlockForm( frm: TForm );
  procedure unlockWindow( frm: TForm );
  procedure unlockControl( ctrl: TWinControl );

implementation

	uses
    ExtCtrls,
    Windows,
    Messages,
    SysUtils,

  	MyStrUtils,
    DebugWindow
  ;

  var
    recurseCounterException: integer = 0; /// internal counter to limit the number of recurrsions


  const
    DBSHOWMSG: boolean = false; /// Set to true to enable debugging messages for this unit


  {*
    Recurseively writes to dbcout, container control names and a count and names of children controls
    The recurrsion and printing out the control names continues for upto 50 iterations

    @param container The parent control of interest
    @param recurseCounter A counter that should be initialzed to zero when calling the procedure
    @comment Limits recursion of the procedure to 50 iterations
  }
  procedure dbControlNames( container: TWinControl; recurseCounter: integer );
    var
      i: integer;
      j: integer;
      s: integer;
      ctrl: TWinControl;

      str: string;
    begin
      if( 0 = recurseCounter ) then
        recurseCounterException := 0
      else
        inc( recurseCounterException )
      ;

      if( 50 = recurseCounterException ) then raise exception.Create( 'Break!' );
          
      for i := 0 to container.ControlCount - 1 do
        begin
          if( container.Controls[i] is TWinControl ) then
            begin
              ctrl := container.Controls[i] as TWinControl;
              dbcout( 'Control ' + ctrl.Name + ' has ' + intToStr( ctrl.ControlCount ) + ' controls.', DBSHOWMSG );

              for s := 0 to recurseCounter do
                str := str + '-'
              ;

              for j := 0 to ctrl.ControlCount - 1 do
                dbcout( str + ' Control ' + ctrl.Controls[j].Name, DBSHOWMSG ) //+ ' has ' + intToStr( ctrl.ControlCount ) + ' controls.' )
              ;

              inc( recurseCounter );

              dbControlNames( ctrl, recurseCounter );
            end
          ;

        end
      ;
    end
  ;


  {*
    Indicates whether ctrl is somewhere on obj.
    
    @param ctrl The control being searched for
    @param obj The windows control container being search
    @return True if control is located
  }
  function controlIsInObject( ctrl: TControl; obj: TWinControl ): boolean;
    var
      i: integer;
    begin
      result := false;

      for i := 0 to obj.ControlCount - 1 do
        begin
          if( obj.Controls[i] = ctrl ) then
            begin
              result := true;
              break;
            end
          ;

          if( obj.Controls[i] is TWinControl ) then
            begin
              if( controlIsInObject( ctrl, (obj.Controls[i] as TWinControl) ) ) then
                begin
                  result := true;
                  break;
                end
              ;
            end
          ;
        end
      ;
    end
  ;


  {*
    Centers the first control relative to the second control (vertically and horizontally).

    @param ctrl1 The control to move
    @param ctrl2 The reference control
    @comment The second control should not contain the first control
    (if this is the case, use the "centerInside" functions)
  }
  procedure center( ctrl1, ctrl2: TControl );
  	begin
   		horizCenter( ctrl1, ctrl2 );
      vertCenter( ctrl1, ctrl2 );
    end
  ;


  {*
    Centers the first control horizontally relative to the second control.

    @param ctrl1 The control to move
    @param ctrl2 The reference control
    @comment The second control should not contain the first control
    (if this is the case, use the "centerInside" functions)
  }
	procedure horizCenter( ctrl1, ctrl2: TControl );
  	var
      left: integer;
  	begin

     	left := ctrl2.Left + ( ( ctrl2.Width - ctrl1.width ) div 2 );

      if( left < 0 ) then
      	ctrl1.Left := 0
      else
      	ctrl1.Left := left
      ;

    end
  ;


  {*
    Centers the first control vertically relative to the second control.

    @param ctrl1 The control to move
    @param ctrl2 The reference control
    @comment The second control should not contain the first control
    (if this is the case, use the "centerInside" functions)
  }
	procedure vertCenter( ctrl1, ctrl2: TControl );
  	var
      top: integer;
  	begin
			top := ctrl2.Top + ( ( ctrl2.Height - ctrl1.height ) div 2 );

      if( top < 0 ) then
      	ctrl1.top := 0
      else
      	ctrl1.top := top
      ;

    end
  ;


  {*
    Centers the centeree horizontally inside the container control

    @param centeree The control to move
    @param container The reference control
    @comment The second control should contain the first control
  }
  procedure horizCenterInside( centeree, container: TControl );
    begin
      if
        ( alClient <> container.Align )
      or
        ( nil = container.Parent )
      then
        centeree.Left := ( container.Width - centeree.Width ) div 2
      else
        centeree.Left := ( container.Parent.ClientWidth - centeree.Width ) div 2
      ;
    end
  ;

  {*
    Centers the centeree vertically inside the container control

    @param centeree The control to move
    @param container The reference control
    @comment The second control should contain the first control
  }
  procedure vertCenterInside( centeree, container: TControl );
    var
      ht1, ht2: integer;
      diff: integer;
      halfdiff: integer;
    begin
      ht1 := container.Height;
      ht2 := centeree.Height;
      diff := ht1 - ht2;

      if( 0 > diff ) then
        centeree.Top := 0
      else
        begin
          halfdiff := diff div 2;
          centeree.Top := halfDiff;
        end
      ;
    end
  ;


  {*
    Centers the centeree inside the container control
    (Centers both vertically and horizontally).

    @param centeree The control to move
    @param container The reference control
    @comment The second control should contain the first control
  }
  procedure horizVertCenterInside( centeree, container: TControl );
    begin
      horizCenterInside( centeree, container );
      vertCenterInside( centeree, container );
    end
  ;


  {*
    Centers the control on the screen horizontally

    @param ctrl1 The control to move
  }
  procedure horizCenterScreen( ctrl1: TControl );
  	begin
    	ctrl1.Left := (Screen.Width div 2) - (ctrl1.Width div 2);
    end
  ;


  {*
    Centers the control on the screen vertically

    @param ctrl1 The control to move
  }
  procedure vertCenterScreen( ctrl1: TControl );
  	begin
    	ctrl1.Top := (Screen.Height div 2) - (ctrl1.Height div 2);
    end
  ;


  {*
    Centers the control on the screen vertically and horizontally

    @param ctrl1 The control to move
  }
  procedure centerScreen( ctrl1: TControl );
  	begin
    	horizCenterScreen( ctrl1 );
      vertCenterScreen( ctrl1 );
    end
  ;


  {*
    Sets the enabled property of the child controls of ctrl to val
    
    @param ctrl Container control
    @param val Set enabled to True or False
    @parm recurse If true recurse through each control's child controls
  }
  procedure setChildrenEnabled( ctrl: TWinControl; val: boolean; recurse: boolean = false );
  	var
    	i: integer;
      wc: TWinControl;
    begin
    	ctrl.enabled := val;

    	for i := 0 to ctrl.controlCount - 1 do
      	begin
        	ctrl.Controls[i].Enabled := val;

          if( recurse ) then
          	begin
              if( ctrl.Controls[i] is TWinControl ) then
                begin
                	wc := ctrl.Controls[i] as TWinControl;
                  setChildrenEnabled( wc, val, recurse );
                end
              ;
            end
          ;

        end
      ;
    end
  ;


  {*
    Horizontally centers the child controls of ctrl

    @param ctrl Container control
    @parm recurse If true recurse through each control's child controls
  }
  procedure centerChildren( ctrl: TWinControl; recurse: boolean = false );
  	var
    	i: integer;
      wc: TWinControl;
    begin
      for i := 0 to ctrl.ControlCount -1 do
        begin
          dbcout( 'Now centering ' + ctrl.Controls[i].Name, DBSHOWMSG );
          
          horizCenterInside( ctrl.Controls[i], ctrl );

          if( recurse ) then
            begin
              if( ctrl.Controls[i] is TWinControl ) then
                begin
                  wc := ctrl.Controls[i] as TWinControl;
                  centerChildren( wc, recurse );
                end
              ;
            end
          ;
        end
      ;
    end
  ;



  {*
    Sets the visible property of the child controls of ctrl to val
    
    @param ctrl Container control
    @param val Set visible to True or False
    @parm recurse If true recurse through each control's child controls
  }
  procedure setChildrenVisible( ctrl: TWinControl; val: boolean; recurse: boolean = false );
  	var
    	i: integer;
      wc: TWinControl;
    begin
    	for i := 0 to ctrl.controlCount-1 do
      	begin
        	ctrl.Controls[i].visible := val;

          if( recurse ) then
          	begin
              if( ctrl.Controls[i] is TWinControl ) then
                begin
                	wc := ctrl.Controls[i] as TWinControl;
                  setChildrenVisible( wc, val, recurse );
                end
              ;
            end
          ;
        end
      ;
    end
  ;

  {*
    Locks (preventing repainting) of a form's controls
    @param frm Form to lock
  }
  procedure lockForm( frm: TForm );
    begin
      lockControl( frm );
    end
  ;


  {*
    Locks (preventing repainting) of a form
    @param frm Form to lock
  }
  procedure lockWindow( frm: TForm );
    begin
      lockControl( frm );
    end
  ;


  {*
    Locks (preventing repainting) a control
    @param ctrl Control to lock
  }
  procedure lockControl( ctrl: TWinControl );
    begin
      ctrl.Perform( WM_SETREDRAW, 0, 0 ); // equivalent to SendMessage( ctrl.Handle, WM_SETREDRAW, 0, 0 );
    end
  ;


  {*
    Unlocks the controls on a form to allow repainting
    @param frm Form to lock
  }
  procedure unlockForm( frm: TForm );
    begin
      unlockControl( frm );
    end
  ;


  {*
    Unlocks a form to allow repainting
    @param frm Form to lock
  }
  procedure unlockWindow( frm: TForm );
    begin
      unlockControl( frm );
    end
  ;


  {*
    Unlocks a control to allow repainting
    @param ctrl Control to lock
  }
  procedure unlockControl( ctrl: TWinControl );
    begin
      ctrl.Perform( WM_SETREDRAW, 1, 0 ); // equivalent to SendMessage( ctrl.Handle, WM_SETREDRAW, 1, 0 );
      RedrawWindow( ctrl.Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
    end
  ;


  {*
    Creates a list of the Panel controls (object instances, not names) within Obj
    
    @param obj Container control
    @param recurse If true then each control is searched  for Panels
    @return List of Panel controls
  }
  function createListOfPanels( obj: TWinControl; const recurse: boolean = true ): TObjectList;
    var
      list: TObjectList;

      procedure fillList( obj: TWinControl; list: TObjectList; const recurse: boolean = true );
        var
          i: integer;
        begin
          for i := 0 to obj.ControlCount - 1 do
            begin
              if( obj.Controls[i] is TPanel ) then
                list.Add( obj.Controls[i] )
              ;
              if( recurse and ( obj.Controls[i] is TWinControl ) ) then
                fillList( ( obj.Controls[i] as TWinControl ), list, recurse )
              ;
            end
          ;
        end
      ;
    begin
      list := TObjectList.Create();
      list.OwnsObjects := false;

      fillList( obj, list, recurse );

      result := list;
    end
  ;


end.
