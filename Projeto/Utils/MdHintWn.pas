{*
 *   Hint window classes
 *   Copyright (C) 1995,1997 Marcus Hettlage
 *   -
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *   -
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *   -
 *   MdHintWn 1.02
 *   Hint window classes
 *   Copyright (C) Marcus Hettlage 1995,1997
 *   Ver 1.02
 *   -
 *   Changes to version 1.04 written by Aaron Reeves <Aaron.Reeves@colostate.edu>
 *   Hettlage's code for version 1.03 was obtained on 01/17/07 from a Google cache of
 *   http://cvs.sourceforge.net/viewcvs.py/feedreader/feedreader/
     -
     The classes are extensive, for the time being, documentation tags
     are provided for public members but not necessarily other members. 
 }

 (*
     Documentation generation tags begin with {* or ///
     Replacing these with (* or // foils the documentation generator
     

 *   Revision history:
 *   1.00: 07/08/95 original
 *   1.01: 07/20/95 added a more tolerant "at cursor" handling
 *   1.02: 08/27/95 added Kind- and CursorTolerance-properties
 *   1.03: 03/20/97 added WIN32-support
 *   1.04: 01/17/07 added support for HintHidePause;
 *     TMdHintWindow is now forced to redraw on text change, with or without actual size change.
 *)

{$A+,B-,F-,I-,R-,S-,V-,G+,X+}
{$C MoveAble DemandLoad Discardable}

{$IFDEF Win32}
  {$IFDEF Ver90} {$DEFINE PriorDelphi3} {$ENDIF}
{$ELSE}
  {$DEFINE PriorDelphi3}
  {$DEFINE Win16}
{$ENDIF}

Unit MdHintWn;
  {-Hint window classes. }

Interface

Uses
  {$IFDEF Win16} WinTypes {$ELSE} Windows {$ENDIF},
  Controls,
  Classes,
  Messages,
  Graphics,
  Forms,

  DebugWindow,
  MyStrUtils
;

Type
  /// Inherits from the standard hint window
  TMdHintWindow = Class(THintWindow)
  Private
    fakeWidth: integer;  {!!1.04 AR} /// Used to adjust window size on text size change
    CursorPt: TPoint;
    Procedure CMTextChanged(Var Message: TMessage); message CM_TEXTCHANGED;
  Protected
    Procedure UpdateSize; Virtual;
  Public
    constructor Create(AOwner: TComponent); override; {!!1.04 AR}
    Procedure ActivateHint(Rect: TRect; Const AHint: String); override;
    Function IsHintMsg(Var Msg: TMsg): Boolean; override;
  End; (* TMdHintWindow *)

  TMdHintWindowClass = Class Of TMdHintWindow;

Type
  TBubblePointerPos = (BPP_UpperLeft, BPP_LowerLeft, BPP_UpperRight, BPP_LowerRight);

  /// Bubble type hint window
  TMdBubbleHintWindow = Class(TMdHintWindow)
  Private
    MainRC: TRect;
    TxtHeight, TxtWidth: Integer;
    BubblePointerPos: TBubblePointerPos;

    Procedure WMEraseBkGnd(Var Message: TMessage); message WM_EraseBkGnd;
    Procedure WMWindowPosChanged(Var Message: TMessage); message WM_WindowPosChanged;
  Protected
    Procedure Paint; override;
    Procedure CreateParams(Var Params: TCreateParams); override;
    Procedure UpdateSize; override;
  Public
    Constructor Create(AOwner: TComponent); override;
    Procedure ActivateHint(Rect: TRect; Const AHint: String); override;
    Function IsHintMsg(Var Msg: TMsg): Boolean; override;
  End; (* TMdBubbleHintWindow *)

  TMdBubbleHintWindowClass = Class Of TMdBubbleHintWindow;

Type
  THintManagerKind = (hmkStandard, hmkBubble, hmkCustom); {!!1.02}

  /// Means to implement both types of hint windows
  THintManager = Class(TObject)
     Private
       FAtCursor: Boolean;
       FCursorTolerance: Integer; {!!1.02}
       FHintColor: TColor;
       FKind: THintManagerKind; {!!1.02}
       FMultiLine: Boolean;
       FShowHint: Boolean;
       FOnShowHint: TShowHintEvent;
       Function GetHintPause: Integer;
       Function GetHintHidePause: Integer; {!!1.04 AR}
       Procedure SetHintPause(Value: Integer);
       Procedure SetHintHidePause(Value: Integer); {!!1.04 AR}
       Procedure SetHintWindowClass(Value: THintWindowClass);
       Function GetHintWindowClass: THintWindowClass;
       Procedure SetKind(Value: THintManagerKind); {!!1.02}
       Function GetKind: THintManagerKind; {!!1.02}
       Function GetOnShowHint: TShowHintEvent;
       Procedure SetOnShowHint(Value: TShowHintEvent);
       Procedure ShowHintEvent(Var HintStr: String; Var CanShow: Boolean;
                               Var HintInfo: THintInfo);
     Public
       Constructor Create;
       Destructor Destroy; override;
     Public
        /// Whether to create the hint at the cursor
       Property AtCursor: Boolean read FAtCursor write FAtCursor default False;
       /// How close to position the hint to the cursor
       Property CursorTolerance: Integer read FCursorTolerance             {!!1.02}
                                         write FCursorTolerance default 1; {!!1.02}
       /// Setting the color of the hint
       Property HintColor: TColor read FHintColor write FHintColor;
       /// The time interval before the hint appears when the user mouses the control
       Property HintPause: Integer read GetHintPause write SetHintPause;
       /// The time interval to wait before hiding the Help Hint if the mouse has not moved from the control
       Property HintHidePause: Integer read GetHintHidePause write setHintHidePause; {!!1.04 AR}
       /// Specifies the class for the window used to display the help hints
       Property HintWindowClass: THintWindowClass read GetHintWindowClass
                                 write SetHintWindowClass;
       ///Based on the type of hint window
       Property Kind: THintManagerKind read GetKind write SetKind; {!!1.02}
       /// Whether the hint message text should be multi-lined
       Property MultiLine: Boolean read FMultiLine write FMultiLine default True;
       /// Whether to show or hide hint
       Property ShowHint: Boolean read FShowHint write FShowHint default True;
       /// Hint event handler
       Property OnShowHint: TShowHintEvent read GetOnShowHint write SetOnShowHint;
  End; (* THintManager *)

/// This function "installs" a new type of hint window.
Procedure SetHintWindowClass(AHintWindowClass: THintWindowClass);

Var
  HintManager: THintManager;

{=========================}

Implementation

Uses
  {$IFDEF WIn16} WinProcs, {$ENDIF}
  SysUtils
  ;//,MdBase, MhGDI;

{-----------------------------------------------------------------------------}
{- RunningInsideDelphiIDE                                                    -}
{-----------------------------------------------------------------------------}

{*
  Determines whether Delphi is running
  @return True if the application's name is Delphi32.exe, else false
}
{!!1.09}
Function RunningInsideDelphiIDE: Boolean;
{$IFNDEF PriorDelphi3}
Var
  FN: String;
{$ENDIF}
Begin
  {$IFDEF PriorDelphi3}
  Result := False;
  {$ELSE}
  Result := ModuleIsLib And ModuleIsPackage;
  If Result Then Begin
    SetLength( FN, MAX_PATH + 1 );
    SetLength( FN, GetModuleFileName( System.MainInstance, @FN[1], MAX_PATH ) );
    FN := ExtractFileName( FN );
    Result := 0 = CompareText( FN, 'DELPHI32.EXE' );
  End;
  {$ENDIF}
End; (* RunningInsideDelphiIDE *)


{-------------------------------------------------------------------------}
{-- CreateMaskBitmap                                                    --}
{-------------------------------------------------------------------------}

{*  Creates a bitmap mask for the supplied bitmap.
    Called by method TransBltPal
}
Function CreateMaskBitmap(DC: HDC; Bitmap: HBitmap; bInverse: Boolean;
                          Color: TColorRef): HBitmap;
Var
  bmAndBack, bmAndObject: HBitmap;
  bmTempOld, bmBackOld, bmObjectOld: HBitmap;
  hdcBack, hdcObject, hdcTemp: HDC;
  ROP: LongInt;
  BM: Windows.TBitmap;
Begin
  { determine the width/height of the bitmap }
  GetObject(Bitmap, SizeOf(BM), @BM);

  { create object dc and bitmap for temporary data }
  hdcObject := CreateCompatibleDC(DC);
  bmAndObject := CreateBitmap(BM.bmWidth, BM.bmHeight, 1, 1, Nil); { Monochrome DC }
  bmObjectOld := SelectObject(hdcObject, bmAndObject);

  { create temp dc and bitmap for temporary data }
  hdcTemp := CreateCompatibleDC(DC);
  bmTempOld := SelectObject(hdcTemp, Bitmap);   { Select the bitmap }

  { Set proper mapping mode }
  SetMapMode(hdcTemp, GetMapMode(DC));

  { Set the background color of the source DC to the color.
   contained in the parts of the bitmap that should be transparent }
  SetBkColor(hdcTemp, Color);

  { Create the object mask for the bitmap by performing a BitBlt
    from the source bitmap to a monochrome bitmap }
  BitBlt(hdcObject, 0, 0, BM.bmWidth, BM.bmHeight, hdcTemp, 0, 0, SrcCopy);

  { Set the background color of the source DC back to the original color }
  SetBkColor(hdcTemp, Color);

  { cleanup and delete temp dc }
  SelectObject(hdcTemp, bmTempOld);
  DeleteDC(hdcTemp);

  { create back dc and bitmap }
  hdcBack   := CreateCompatibleDC(DC);
  bmAndBack   := CreateBitmap(BM.bmWidth, BM.bmHeight, 1, 1, Nil); { Monochrome DC }
  bmBackOld   := SelectObject(hdcBack, bmAndBack);

  If bInverse Then ROP := NotSrcCopy
   Else ROP := SrcCopy;
  { Create the inverse of the object mask }
  BitBlt(hdcBack, 0, 0, BM.bmWidth, BM.bmHeight, hdcObject, 0, 0, ROP);

  CreateMaskBitmap := SelectObject(hdcBack, bmBackOld);

  { Delete the memory bitmaps }
  DeleteObject(SelectObject(hdcObject, bmObjectOld));

  { Delete the memory DCs }
  DeleteDC(hdcBack);
  DeleteDC(hdcObject);
End; (* CreateMaskBitmap *)


{-------------------------------------------------------------------------}
{-- TransBltPal                                                         --}
{-------------------------------------------------------------------------}

{*
  BitBlt a bitmap transparent into a DC.
  If the driver supports transparent bitblt's this capability is used (fast)
  otherwise the bitmap is bitblt'ed using a mask (slow).
  Called by method TransBlt
}
Procedure TransBltPal(DestDC: HDC; Bitmap: HBitmap; hPal: HPalette;
                      X, Y, nWidth, nHeight: Integer;
                      XSrc, YSrc: Integer; TransparentColor: TColorRef);
Var
  hOldPal: HPalette;
  SrcDC: HDC;
  bmSrcOld: HBitmap;
  Mask: HBitmap;
Begin
  hOldPal := 0;

  { create the bitmap mask for masking out the 'TransparentColor' bits }
  Mask := CreateMaskBitmap(DestDC, Bitmap, False, TransparentColor);

  { create memory DC to hold temporary data }
  SrcDC := CreateCompatibleDC(DestDC);
  bmSrcOld := SelectObject(SrcDC, Bitmap);
  If hPal <> 0 Then Begin
    hOldPal := SelectPalette(DestDC, hPal, True);
    RealizePalette(DestDC);
  End;


  { paint the transparent bitmap }
  MaskBlt(DestDC, X, Y, nWidth, nHeight,
          SrcDC, XSrc, YSrc, Mask,
          XSrc, YSrc, SrcAnd);

  { cleanup and delete temporary DC }
  If hPal <> 0 Then Begin
    SelectPalette(DestDC, hOldPal, True);
    RealizePalette(DestDC);
  End;
  SelectObject(SrcDC, bmSrcOld);
  DeleteDC(SrcDC);

  { delete bitmap mask }
  DeleteObject(Mask);
End; (* TransBltPal *)


{-------------------------------------------------------------------------}
{-- TransBlt                                                            --}
{-------------------------------------------------------------------------}

{*
  BitBlt a bitmap transparent into a DC.
  If the driver supports transparent bitblt's this capability is used (fast)
  otherwise the bitmap is bitblt'ed using a mask (slow).
  Called by TMdBubbleHintWindow.Paint
}
Procedure TransBlt(DestDC: HDC; Bitmap: HBitmap; X, Y, nWidth, nHeight: Integer;
                   XSrc, YSrc: Integer; TransparentColor: TColorRef);
Begin
  TransBltPal(DestDC, Bitmap, 0,
              X, Y, nWidth, nHeight,
              XSrc, YSrc, TransparentColor);
End; (* TransBlt *)


{-------------------------------------------------------------------------}
{-- CreateBrushFromPattern                                              --}
{-------------------------------------------------------------------------}

/// Create a brush from a supplied pattern. Called by TMdBubbleHintWindow.Paint
Function CreateBrushFromPattern: HBrush;
Const
  Pattern: Packed Array[0..7] Of Byte = ($55, $AA, $55, $AA, $55, $AA, $55, $AA);
Var
  hBMP: HBitmap;
  hPatternBrush: HBrush;
Begin
  { create brush from mono-bitmap }
  hBMP := CreateBitmap(8, 8, 1, 1, @Pattern);
  hPatternBrush := CreatePatternBrush(hBMP);
  DeleteObject(hBMP);
  UnrealizeObject(hPatternBrush);
  CreateBrushFromPattern := hPatternBrush;
End; (* CreateBrushFromPattern *)


{-----------------------------------------------------------------------------}
{-                                                                           -}
{- TMdHintWindow                                                             -}
{-                                                                           -}
{-----------------------------------------------------------------------------}

/// Creates instance of Hint Window
{!!1.04 AR}
constructor TMdHintWindow.Create(AOwner: TComponent);
begin
  inherited create( AOwner );
  fakeWidth := 1;
end;

/// Determines if the Windows message (Msg) is a hint message
Function TMdHintWindow.IsHintMsg(var Msg: TMsg): Boolean;
Begin
  Result := Inherited IsHintMsg(Msg);
  If (Not Result) And (HintManager <> Nil) And HintManager.AtCursor Then {!!1.02}
    begin
      If HandleAllocated And IsWindowVisible(Handle) Then
        begin
          {Result := ((Msg.Pt.x <> CursorPt.x) Or (Msg.Pt.y <> CursorPt.y));}     {!!1.01}
          With HintManager, CursorPt, Msg Do                                      {!!1.01,1.02}
            Result := (Pt.x < x-CursorTolerance) Or (Pt.x > x+CursorTolerance) Or {!!1.01}
                      (Pt.y < y-CursorTolerance) Or (Pt.y > y+CursorTolerance);   {!!1.01}
        end
      ;
    end
  ;
End; (* TMdHintWindow.IsHintMsg *)


/// Updates the Hint Window size to accomdate updated message text
Procedure TMdHintWindow.UpdateSize;
Var
  CCaption: array[0..255] of Char;
  RC: TRect;
  txtHeight, TxtWidth: Integer;
Begin
  StrPLCopy(CCaption, Caption, SizeOf(CCaption) - 1);

  RC := Rect(0, 0, GetSystemMetrics(SM_CXScreen), MaxInt);
  If (HintManager <> Nil) And (HintManager.MultiLine Or HintManager.AtCursor) Then {!!1.02}
    RC.right := 2 * (RC.right Div 5);
  TxtHeight := DrawText(Canvas.Handle, CCaption, -1, RC,
                        DT_WordBreak Or DT_CalcRect Or DT_NoPrefix);
  TxtWidth := RC.right;

  //Width := TxtWidth + 6;
  Width := TxtWidth + 6 + fakeWidth; {!!1.04 AR} // Forces the window to redraw, even if it would be the size is the same as before.
  Height := TxtHeight + 4;
  fakewidth := -1 * fakewidth; {!!1.04 AR}
End; (* TMdHintWindow.UpdateSize *)


/// Calls UpdateSize to accomodate message text change
Procedure TMdHintWindow.CMTextChanged(Var Message: TMessage);
Begin
  Inherited;

  UpdateSize;
End; (* TMdHintWindow.CMTextChanged *)


/// Shows hint at cursor location
Procedure TMdHintWindow.ActivateHint(Rect: TRect; Const AHint: String);
Var
  cxCursor, cyCursor: Integer;
Begin
  Caption := AHint;

  If (HintManager <> Nil) And HintManager.AtCursor Then Begin {!!1.02}
    cxCursor := GetSystemMetrics(SM_CXCursor) Div 2;
    cyCursor := GetSystemMetrics(SM_CYCursor) Div 2;
    GetCursorPos(CursorPt);
    Rect := Bounds(CursorPt.x + cxCursor, CursorPt.y + cyCursor, Width, Height);
    If Rect.Top + Height > Screen.Height Then
      Rect.Top := CursorPt.y - Succ(Height);
    If Rect.Left + Width > Screen.Width Then
      Rect.Left := Rect.left - Succ(Width);
    If Rect.Left < 0 Then Rect.Left := Succ(Rect.Left);
    If Rect.Bottom < 0 Then Rect.Bottom := Succ(Rect.bottom);
  End
   Else Begin
     If Rect.Top + Height > Screen.Height Then
       Rect.Top := Screen.Height - Height;
     If Rect.Left + Width > Screen.Width Then
       Rect.Left := Screen.Width - Width;
     If Rect.Left < 0 Then Rect.Left := 0;
     If Rect.Bottom < 0 Then Rect.Bottom := 0;
   End;

  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, 0,
    0, SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);
End; (* TMdHintWindow.ActivateHint *)


{-----------------------------------------------------------------------------}
{-                                                                           -}
{- TMdBubbleHintWindow                                                       -}
{-                                                                           -}
{-----------------------------------------------------------------------------}

Const
  Spacing = 10;      /// For bubble hint window
  ShadowWidth  = 8;  /// For bubble hint window
  ShadowHeight = 8;  /// For bubble hint window

/// Creates a bubble type hint window
Constructor TMdBubbleHintWindow.Create(AOwner: TComponent);
Begin
  Inherited Create(AOwner);
  With Canvas Do Begin
    Font.Name := 'MS Sans Serif';
    Font.Size := 7;
  End;
End; (* TMdBubbleHintWindow.Create *)

{*
  Sets the Window Style and WindowClass for bubble hints
  @param Params Information needed when telling Windows to create a window
}
Procedure TMdBubbleHintWindow.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);

  With Params Do Begin
    Style := WS_POPUP or WS_DISABLED;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
  End;
End; (* TMdBubbleHintWindow.CreateParams *)


/// Determines if the Windows message (Msg) is a bubble hint message
Function TMdBubbleHintWindow.IsHintMsg(Var Msg: TMsg): Boolean;
Begin
  Result := Inherited IsHintMsg(Msg);
  If (Not Result) Then
    begin
      If HandleAllocated And IsWindowVisible(Handle) Then
        Result := ((Msg.Pt.x <> CursorPt.x) Or (Msg.Pt.y <> CursorPt.y))
      ;
    end
  ;
End; (* TMdBubbleHintWindow.IsHintMsg *)


/// Paints the bubble hint on the private rectangle MainRC
Procedure TMdBubbleHintWindow.Paint;
Var
  CCaption: array[0..255] of Char;
  OldBrush: HBrush;
  Pts: Array[0..2] Of TPoint;
  ShadowImage: TBitmap;
Begin
  StrPLCopy(CCaption, Caption, SizeOf(CCaption) - 1);

  {// Calc the points of the bubbles pointer
   //}
  With MainRC Do
    Case BubblePointerPos Of
      BPP_UpperLeft:
           Begin
             OffsetRect(MainRC, 18, 20);
             Pts[0] := Point(left+6, top+3);
             Pts[1] := Point(left-18, top-20);
             Pts[2] := Point(left+20, top+2);
           End;
      BPP_LowerLeft:
           Begin
             OffsetRect(MainRC, 18, 0);
             Pts[0] := Point(left+6, bottom-3);
             Pts[1] := Point(left-18, bottom+20);
             Pts[2] := Point(left+20, bottom-2);
           End;
      BPP_UpperRight:
           Begin
             OffsetRect(MainRC, 0, 20);
             Pts[0] := Point(right-6, top+3);
             Pts[1] := Point(right+18, top-20);
             Pts[2] := Point(right-20, top+2);
           End;
      BPP_LowerRight:
           Begin
             Pts[0] := Point(right-6, bottom-3);
             Pts[1] := Point(right+18, bottom+20);
             Pts[2] := Point(right-20, bottom-2);
           End;
    End; {case}


   {// paint the bubbles shadow and the pointers shadow
    //}
   ShadowImage := TBitmap.Create;
   Try
     With ShadowImage.Canvas Do Begin
       ShadowImage.Width := ClientWidth;
       ShadowImage.Height := ClientHeight;
       Brush.Style := bsSolid;
       Brush.Color := clWhite;
       FillRect(ClientRect);
       Pen.Style := psClear;
       Brush.Color := clBlack;
       OldBrush := SelectObject(Handle, CreateBrushFromPattern);
       Try
         Font.COlor := clWhite;
         CopyMode := SrcCopy;
         OffsetRect(MainRC, ShadowWidth, ShadowHeight);
         With MainRC Do
           RoundRect(Left, Top, Right, Bottom, 20, 20);
         OffsetRect(MainRC, -ShadowWidth, -SHadowHeight);

         Polygon([Point(Pts[0].X+ShadowWidth, Pts[0].Y+ShadowHeight),
                  Point(Pts[1].X+ShadowWidth, Pts[1].Y+ShadowHeight),
                  Point(Pts[2].X+ShadowWidth, Pts[2].Y+ShadowHeight)]);
       Finally
         DeleteObject(SelectObject(Handle, OldBrush));
       End;
     End; {with}
     With ClientRect Do
       TransBlt(Canvas.Handle, ShadowImage.Handle,
                left, top, right-left, bottom-top,
                0, 0, ColorToRGB(clWhite));
   Finally
     ShadowImage.Free;
   End;


  With Canvas Do Begin
    {// paint the bubble
     //}
    Brush.Style := bsSolid;
    Brush.Color := clWindow;
    Pen.Style := psSolid;
    Pen.Color := clWindowFrame;
    Pen.Width := 1;
    With MainRC Do
      RoundRect(1+Left, 1+Top, Right, Bottom, 20, 20);


    {// paint the bubbles pointer
     //}
    Pen.Style := psClear;
    Brush.Style := bsSolid;
    Brush.Color := clWindow;
    Polygon(Pts);
    Pen.Style := psSolid;
    Pen.Color := clWindowFrame;
    Pen.Width := 1;
    PolyLine(Pts);


    {// paint the bubbles text
     //}
    InflateRect(MainRC, -Succ(Spacing), -Succ(Spacing));
    Canvas.Font.Color := clWindowText;
    DrawText(Canvas.Handle, CCaption, -1, MainRC,
             DT_VCenter Or DT_WordBreak Or DT_NoPrefix);
    InflateRect(MainRC, Succ(Spacing), Succ(Spacing));
  End; {with}


  Case BubblePointerPos Of
    BPP_UpperLeft: OffsetRect(MainRC, -18, -20);
    BPP_LowerLeft: OffsetRect(MainRC, -18, 0);
    BPP_UpperRight: OffsetRect(MainRC, 0, -20);
    BPP_LowerRight: ;
  End; {case}
End; (* TMdBubbleHintWindow.Paint *)


/// Tell windows that background was erased
Procedure TMdBubbleHintWindow.WMEraseBkGnd(Var Message: TMessage);
Begin
  Message.Result := 1; { Tell windows that we erased the background }
End; (* TMdBubbleHintWindow.WMEraseBkGnd *)


/// If the window gets hidden "invalidate" the cursor point
Procedure TMdBubbleHintWindow.WMWindowPosChanged(Var Message: TMessage);
Begin
  {// If the window gets hidden "invalidate" the cursor point }
  If PWindowPos(Message.lParam)^.flags And SWP_HideWindow <> 0 Then
    CursorPt := Point(-2, -2);

  Inherited;
End; (* TMdBubbleHintWindow.WMWindowPosChanged *)


/// Shows hint at cursor location
Procedure TMdBubbleHintWindow.ActivateHint(Rect: TRect; Const AHint: String);
Var
  Pt: TPoint;
  cxScreen: Integer;
  {UNUSED: cyScreen: Integer;}
Begin
  Caption := AHint;

  cxScreen := GetSystemMetrics(SM_CXScreen);
  {UNUSED: cyScreen := GetSystemMetrics(SM_CYScreen); }
  GetCursorPos(CursorPt);


  {// check if it bounces on the upper/right side }
  If (CursorPt.y - Height - 1 < 0) And (CursorPt.x + Width > cxScreen) Then Begin
    BubblePointerPos := BPP_UpperRight;
    Pt.x := CursorPt.x - Width + 8;
    Pt.y := CursorPt.y + 2;
  End
  {// check if it bounces on the upper/left side }
  Else If (CursorPt.y - Height - 1 < 0) And (CursorPt.x + Width <= cxScreen) Then Begin
    BubblePointerPos := BPP_UpperLeft;
    Pt.x := CursorPt.x;
    Pt.y := CursorPt.y + 1;
  End
  {// check if it bounces on the lower/right side }
  Else If (CursorPt.x + Width > cxScreen) Then Begin
    BubblePointerPos := BPP_LowerRight;
    Pt.x := CursorPt.x - Width;
    Pt.y := CursorPt.y - Height - 1;
  End
  {// all other tests passed: set it on the lower/left side }
  Else Begin
    BubblePointerPos := BPP_LowerLeft;
    Pt.x := CursorPt.x;
    Pt.y := CursorPt.y - Height - 1;
  End;


  {// Move and show the window }
  SetWindowPos(Handle, HWND_TOPMOST, Pt.x, Pt.y, 0,
    0, SWP_SHOWWINDOW or SWP_NOACTIVATE or SWP_NOSIZE);
End; (* TMdBubbleHintWindow.ActivateHint *)


/// The bubble hint text has changed so update size
Procedure TMdBubbleHintWindow.UpdateSize;
Var
  CCaption: array[0..255] of Char;
Begin
  StrPLCopy(CCaption, Caption, SizeOf(CCaption) - 1);

  MainRC := Rect(0, 0, 2 * (GetSystemMetrics(SM_CXScreen) Div 5), MaxInt);
  TxtHeight := DrawText(Canvas.Handle, CCaption, -1, MainRC,
                        DT_WordBreak Or DT_CalcRect Or DT_NoPrefix);
  TxtWidth := MainRC.right;

  SetRect(MainRC, 0, 0,
          Spacing + TxtWidth + Spacing,
          Spacing + TxtHeight + Spacing);
  InflateRect(MainRC, 1, 1); { for the border }

  Width := MainRC.right-MainRC.left + 18 + ShadowWidth;
  Height := MainRC.bottom-MainRC.top + 20 + ShadowHeight;
End; (* TMdBubbleHintWindow.UpdateSIze *)


{-----------------------------------------------------------------------------}
{-                                                                           -}
{- THintManager                                                              -}
{-                                                                           -}
{-----------------------------------------------------------------------------}

/// Creates a hint
Constructor THintManager.Create;
Begin
  Inherited Create;

  FAtCursor := False;
  FCursorTolerance := 1; {!!1.02}
  FMultiLine := True;
  FHintColor := Application.HintColor;
  FShowHint := True;
  HintWindowClass := TMdHintWindow;
  OnShowHint := ShowHintEvent;
End; (* THintManager.Create *)

/// Frees memory for hint
Destructor THintManager.Destroy;
Begin
  Inherited Destroy;
End; (* THintManager.Destroy *)


Procedure THintManager.SetHintWindowClass(Value: THintWindowClass);
Begin
  MdHintWn.SetHintWindowClass(Value);
End; (* THintManager.SetHintWindowClass *)


Function THintManager.GetHintWindowClass: THintWindowClass;
Begin
  Result := Forms.HintWindowClass;
End; (* THintManager.GetHintWindowClass *)


Function THintManager.GetHintPause: Integer;
Begin
  Result := Application.HintPause;
End; (* THintManager.GetHintPause *)

{!!1.04 AR}
Function THintManager.GetHintHidePause: Integer;
Begin
  Result := Application.HintHidePause;
End; (* THintManager.GetHintPause *)


Procedure THintManager.SetHintPause(Value: Integer);
Begin
  Application.HintPause := Value;
End; (* THintManager.SetHintPause *)

{!!1.04 AR}
Procedure THintManager.SetHintHidePause(Value: Integer);
Begin
  Application.HintHidePause := Value;
End; (* THintManager.SetHintPause *)

{!!1.02}
Function THintManager.GetKind: THintManagerKind;
Begin
  If HintWindowClass = TMdBubbleHintWindow Then Result := hmkBubble
  Else If HintWindowClass = TMdHintWindow Then Result := hmkStandard
  Else Result := hmkCustom;
End; (* THintManager.GetKind *)


{!!1.02}
Procedure THintManager.SetKind(Value: THintManagerKind);
Begin
  If Kind = FKind Then Exit;
  Case Value Of
    hmkStandard: HintWindowClass := TMdHintWindow;
    hmkBubble:   HintWindowClass := TMdBubbleHintWindow;
    hmkCustom:   HintWindowClass := THintWindow;
  End;
End; (* THintManager.SetKind *)


Function THintManager.GetOnShowHint: TShowHintEvent;
Var
  Event: TShowHintEvent;
Begin
  Event := Application.OnShowHint;
  If @Event <> @FOnShowHint Then
    Raise Exception.Create('invalid use');

  Event := ShowHintEvent;
  If @FOnShowHint = @Event Then
    Result := Nil
   Else
    Result := FOnShowHint;
End; (* THintManager.GetOnShowHint *)


Procedure THintManager.SetOnShowHint(Value: TShowHintEvent);
Var
  Event: TShowHintEvent;
Begin
  Event := Application.OnShowHint;
  If @Event <> @FOnShowHint Then
    Raise Exception.Create('invalid use');

  Event := ShowHintEvent;
  If @Value = @Event Then
    FOnShowHint := Nil
   Else
    FOnShowHint := Value;

  {// If the user wants to "delete" the event set our own handler. }
  If @Value = Nil Then
    Value := ShowHintEvent;

  Application.OnShowHint := Value;
End; (* THintManager.SetOnShowHint *)


Procedure THintManager.ShowHintEvent(Var HintStr: String; Var CanShow: Boolean;
                                     Var HintInfo: THintInfo);
Begin
  If Assigned(FOnShowHint) Then
    FOnShowHint(HintStr, CanShow, HintInfo)
   Else Begin
     CanShow := FShowHint;
     If CanShow Then
       Application.HintColor := FHintColor;
   End;
End; (* THintManager.ShowHintEvent *)


{-----------------------------------------------------------------------------}
{- SetHintWindowClass                                                        -}
{-----------------------------------------------------------------------------}
Procedure SetHintWindowClass(AHintWindowClass: THintWindowClass);
{-This function "installs" a new type of hint window. }
Var
  fShowHints: Boolean;
Begin
  If
    (Forms.HintWindowClass <> AHintWindowClass)
  And
    (AHintWindowClass <> Nil)
  Then
    Begin
      fShowHints := Application.ShowHint;

      {!!NOTE: This procedure relies on the fact that the Application-object
               frees the hintwindow when the ShowHint-Property gets disabled
               and creates a new hint window of the specified class when the
               ShowHint-property gets enabled. }
      Application.ShowHint := False;
      Forms.HintWindowClass := AHintWindowClass;
      Application.ShowHint := fShowHints;
  End;
End; (* SetHintWindowClass *)


{-----------------------------------------------------------------------------}
{- DoneMdHintWn                                                              -}
{-----------------------------------------------------------------------------}
Procedure DoneMdHintWn; Far;
Begin
  HintManager.Free;
End; (* DoneMdHintWn *)


{-----------------------------------------------------------------------------}
{- InitMdHintWn                                                              -}
{-----------------------------------------------------------------------------}
{$IFDEF Win32}
Var
  SaveInitProc: Pointer;

Procedure InitMdHintWn;
Begin
  If SaveInitProc <> Nil Then TProcedure(SaveInitProc);

  If RunningInsideDelphiIDE Then
    HintManager := Nil
   Else
    HintManager := THintManager.Create;
End; (* InitMdHintWn *)
{$ENDIF}


{-----------------------------------------------------------------------------}
{- MAIN                                                                      -}
{-----------------------------------------------------------------------------}
Begin
  {$IFDEF Win16}
  HintManager := THintManager.Create;
  {$ELSE}
  HintManager := Nil;
  SaveInitProc := InitProc;
  InitProc := @InitMdHintWn;
  {$ENDIF}

  AddExitProc(DoneMdHintWn);
End.
