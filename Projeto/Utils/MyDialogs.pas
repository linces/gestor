{*
MyDialogs.pas  Custom message dialogs to support loacalization
--------------
Begin: 2005/03/02
Last revision: $Date: 2010-03-01 04:29:06 $ $Author: areeves $
Version number: $Revision: 1.34 $
Code Documentation Tags: Begin 2009-08-14, Last Revision: 2009-08-14
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2010 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit MyDialogs;

interface

  uses
    Windows,
    SysUtils,
    Dialogs,
    Controls
  ;

  type
    /// enumerations of image style for message dialogs
    TImageStyle = (
      IMGUnspecified,
      IMGQuestion,
      IMGWarning,
      IMGInformation,
      IMGCritical,
      IMGSuccess
    );

  function msgDlg(
      const msg: string;
      buttons: TMsgDlgButtons;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;

  function msgYesNoCancel(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;

  function msgYesNo(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;

  function msgOK(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;

  function msgOKCancel(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;

  procedure msgExceptionOK(
  	msg: string;
    e: exception = nil;
    parent: TWinControl = nil
  );

  function msgInput(
    const msg: string;
    const regexp: string = '';
    const caption: string = '';
    imageStyle: TImageStyle = IMGUnspecified;
    parent: TWinControl = nil;
    default: string = ''
  ): string;

  function msgInputOKCancel(
    const msg: string;
    var str: string;
    const regexp: string = '';
    const caption: string = '';
    imageStyle: TImageStyle = IMGUnspecified;
    parent: TWinControl = nil
  ): integer;

  function msgYesNoCheckbox(
    const msg: string;
    const checkboxLabel: string;
    out checkboxValue: boolean;
    const caption: string = '';
    const imageStyle: TImageStyle = IMGUnspecified;
    const parent: TWinControl = nil
  ): integer;

  function msgOKCheckbox(
    const msg: string;
    const checkboxLabel: string;
    out checkboxValue: boolean;
    const caption: string = '';
    const imageStyle: TImageStyle = IMGUnspecified;
    const parent: TWinControl = nil
  ): integer;

  procedure testImages();

(*
  // "Private" declarations
  procedure translateMyDialogs();
  _currentLanguage: TI88nLanguageCode;
*)

implementation

	{$R 'graphics\Graphics.res' 'graphics\Graphics.rc'}

// Order of items given in the implementation section:
//    - Miscellaneous types borrowed from Dialogs (Borland Delphi Visual Component Library)
//    - A modifed version of the function Dialogs.CreateMessageDialog
//		- Implementation of the custom message dialog functions listed in the interface
//		- Some comments and notes on how to use the CreateMessageDialog function



  uses
  	Forms,
    Classes,
    Graphics,
    ExtCtrls,
    StdCtrls,
    Consts,
    Dlgs,
    Math,

    REEdit,
    MyStrUtils,
    ImageResources,
    DebugWindow,
    I88n
  ;

  var
    _currentLanguage: TI88nLanguageCode; /// localization language - english or spanish

//----------------------------------------------------------------------------------
// Copied directly from Dialogs
//----------------------------------------------------------------------------------
(*
type
  TMsgDlgType = (mtWarning, mtError, mtInformation, mtConfirmation, mtCustom);
  TMsgDlgBtn = (mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore,
    mbAll, mbNoToAll, mbYesToAll, mbHelp);
  TMsgDlgButtons = set of TMsgDlgBtn;
*)

type
  /// Form that the message dialogs use
  TMessageForm = class(TForm)
  private
    Message: TLabel;   /// label component for message
    procedure HelpButtonClick(Sender: TObject);
  protected
    procedure CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WriteToClipBoard(Text: String);
    function GetFormText: String;
  public
    constructor CreateNew(AOwner: TComponent); reintroduce;
  end;

{*
  Constructor for message dialogs
  @param Component owning the dialog form
}
constructor TMessageForm.CreateNew(AOwner: TComponent);
var
  NonClientMetrics: TNonClientMetrics;
begin
  inherited CreateNew(AOwner);
  NonClientMetrics.cbSize := sizeof(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    Font.Handle := CreateFontIndirect(NonClientMetrics.lfMessageFont);
end;

{*
  Event handler for msg dialog's Help button
  @param The instance of the help button component clicked
}
procedure TMessageForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

{*
  Beeps and writes the message dialog contents (message and button captions) to the clipboard

  @param Sender An instance of the message dialog form
  @param Key   Key 'C', any other key does nothing
  @param Shift Whether the Ctrl key is down for key combo Ctrl-C
}
procedure TMessageForm.CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Word('C')) then
  begin
    Beep;
    WriteToClipBoard(GetFormText);
  end;
end;


{*
  Sends Text to the Windows clipboard (supports copy/paste operations between applications)
  @param Text The text to write to the Windows clipboard
}
procedure TMessageForm.WriteToClipBoard(Text: String);
var
  Data: THandle;
  DataPtr: Pointer;
begin
  if OpenClipBoard(0) then
  begin
    try
      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Length(Text) + 1);
      try
        DataPtr := GlobalLock(Data);
        try
          Move(PChar(Text)^, DataPtr^, Length(Text) + 1);
          EmptyClipBoard;
          SetClipboardData(CF_TEXT, Data);
        finally
          GlobalUnlock(Data);
        end;
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipBoard;
    end;
  end
  else
    raise Exception.CreateRes(@SCannotOpenClipboard);
end;


{*
  Returns information about the message dialog contents
  @return The contents of the button(s) caption and the dialog's message
}
function TMessageForm.GetFormText: String;
var
  DividerLine, ButtonCaptions: string;
  I: integer;
begin
  DividerLine := StringOfChar('-', 27) + sLineBreak;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TButton then
      ButtonCaptions := ButtonCaptions + TButton(Components[I]).Caption +
        StringOfChar(' ', 3);
  ButtonCaptions := StringReplace(ButtonCaptions,'&','', [rfReplaceAll]);
  Result := Format('%s%s%s%s%s%s%s%s%s%s', [DividerLine, Caption, sLineBreak,
    DividerLine, Message.Caption, sLineBreak, DividerLine, ButtonCaptions,
    sLineBreak, DividerLine]);
end;

{*
  Returns the average width of an alphabetic character using the current font

  @param Canvas Drawing area of the dialog form
  @return The average width of a font character as the X coordinate of a TPoint
}
function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

var
  /// Array of pointers to the captions for types of Windows message dialogs
  Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgWarning, @SMsgDlgError,
    @SMsgDlgInformation, @SMsgDlgConfirm, nil);

  /// Array of pointers to the Icon IDs for Windows message dialogs
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);

  /// Array of Button names/types for Windows message dialogs
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help');
    
  /// Array of Modal results (enumerated types) for Windows message dialogs
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0);
var
  /// Array for the widths of Windows message dialog buttons
  ButtonWidths : array[TMsgDlgBtn] of integer;  // initialized to zero
//----------------------------------------------------------------------------------



//----------------------------------------------------------------------------------
// Variables and functions for I88n support
//----------------------------------------------------------------------------------
var
  myMsgDlgWarning: string;        ///for I88n support
  myMsgDlgError: string;          ///for I88n support
  myMsgDlgInformation: string;    ///for I88n support
  myMsgDlgConfirm: string;        ///for I88n support
  myMsgDlgYes: string;            ///for I88n support
  myMsgDlgNo: string;             ///for I88n support
  myMsgDlgOK: string;             ///for I88n support
  myMsgDlgCancel: string;         ///for I88n support
  myMsgDlgHelp: string;           ///for I88n support
  myMsgDlgHelpNone: string;       ///for I88n support
  myMsgDlgHelpHelp: string;       ///for I88n support
  myMsgDlgAbort: string;          ///for I88n support
  myMsgDlgRetry: string;          ///for I88n support
  myMsgDlgIgnore: string;         ///for I88n support
  myMsgDlgAll: string;            ///for I88n support
  myMsgDlgNoToAll: string;        ///for I88n support
  myMsgDlgYesToAll: string;       ///for I88n support

  myButtonCaptions: array[TMsgDlgBtn] of string;  ///translations for I88n support

  ///for I88n support, translates the message dialog button captions
  procedure translateMyDialogs();
    begin
      myMsgDlgWarning := tr( 'Warning' );
      myMsgDlgError := tr( 'Error' );
      myMsgDlgInformation := tr( 'Information' );
      myMsgDlgConfirm := tr( 'Confirm' );
      myMsgDlgYes := tr( '&Yes' );
      myMsgDlgNo := tr( '&No' );
      myMsgDlgOK := tr( 'OK' );
      myMsgDlgCancel := tr( 'Cancel' );
      myMsgDlgHelp := tr( '&Help' );
      myMsgDlgHelpNone := tr( 'No help available' );
      myMsgDlgHelpHelp := tr( 'Help' );
      myMsgDlgAbort := tr( '&Abort' );
      myMsgDlgRetry := tr( '&Retry' );
      myMsgDlgIgnore := tr( '&Ignore' );
      myMsgDlgAll := tr( '&All' );
      myMsgDlgNoToAll := tr( 'N&o to All' );
      myMsgDlgYesToAll := tr( 'Yes to &All' );

      myButtonCaptions[mbYes] := myMsgDlgYes;
      myButtonCaptions[mbNo] := myMsgDlgNo;
      myButtonCaptions[mbOK] := myMsgDlgOK;
      myButtonCaptions[mbCancel] := myMsgDlgCancel;
      myButtonCaptions[mbAbort] := myMsgDlgAbort;
      myButtonCaptions[mbRetry] := myMsgDlgRetry;
      myButtonCaptions[mbIgnore] := myMsgDlgIgnore;
      myButtonCaptions[mbAll] := myMsgDlgAll;
      myButtonCaptions[mbNoToAll] := myMsgDlgNoToAll;
      myButtonCaptions[mbYesToAll] := myMsgDlgYesToAll;
      myButtonCaptions[mbHelp] := myMsgDlgHelp;

      _currentLanguage := i88nLanguage();
    end
  ;
//----------------------------------------------------------------------------------



//----------------------------------------------------------------------------------
// Modified from Dialogs.CreateMessageDialog
//----------------------------------------------------------------------------------

  {*
    Creates and returns a message dialog form, translated to I88n language
    Called by function msgDlg, which implements this function

    @param dlgCaption Caption for dialog
    @param Msg Message for dialog
    @param Buttons Buttons on dialog
    @param parentForm Parent form of dialog (or nil if not launched from a form)
    @param bitmap Icon to show on dialog
    @param msgBottom Pixel location of the bottom of the message
    @param buttonBottom  Pixel location of the bottom of the button row
    @param savedSpace Space for vertical margin ??
    @param margin Margin around what ??
    @param messageWidth Width of message string
    @return Message dialog form
  }
  function createMsgDlg(
      const dlgCaption: string;
      const Msg: string;
      Buttons: TMsgDlgButtons;
      parentForm: TWinControl = nil;
      bitmap: TBitmap = nil;
      msgBottom: PInteger = nil;
      buttonBottom: PInteger = nil;
      savedSpace: PInteger = nil;
      margin: PInteger = nil;
      messageWidth: PInteger = nil
    ): TForm;
  const
    mcHorzMargin = 8;
    mcVertMargin = 8;
    mcHorzSpacing = 10;
    mcVertSpacing = 10;
    mcButtonWidth = 50;
    mcButtonHeight = 14;
    mcButtonSpacing = 4; 
  var
    DialogUnits: TPoint;
    HorzMargin, VertMargin, HorzSpacing, VertSpacing: Integer;
    ButtonWidth, ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth: Integer;
    IconTextWidth, IconTextHeight, X, ALeft: Integer;
    B, DefaultButton, CancelButton: TMsgDlgBtn;
    //IconID: PChar;
    TextRect: TRect;
    bottomOfMessage: integer;
  begin
    if( i88nLanguage() <> _currentLanguage ) then
      translateMyDialogs()
    ;
    bottomOfMessage := 0;

    if( parentForm = nil ) then
      Result := TMessageForm.CreateNew(Application)
    else
      result := TMessageForm.createNew( parentForm )
    ;
  
    with Result do
    begin
      BiDiMode := Application.BiDiMode;
      BorderStyle := bsDialog;
      Canvas.Font := Font;
      KeyPreview := True;
      OnKeyDown := TMessageForm(Result).CustomKeyDown;
      DialogUnits := GetAveCharSize(Canvas);
      HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
      HorzSpacing := MulDiv(mcHorzSpacing, DialogUnits.X, 4);
      VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);

      for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      begin
        if B in Buttons then
        begin
          if ButtonWidths[B] = 0 then
          begin
            TextRect := Rect(0,0,0,0);
            Windows.DrawText( canvas.handle,
              PChar(myButtonCaptions[B]), -1,
              TextRect, DT_CALCRECT or DT_LEFT or DT_SINGLELINE or
              DrawTextBiDiModeFlagsReadingOnly);
            with TextRect do ButtonWidths[B] := Right - Left + 8;
          end;
          if ButtonWidths[B] > ButtonWidth then
            ButtonWidth := ButtonWidths[B];
        end;
      end;
      ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
      ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
      SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
      DrawText(Canvas.Handle, PChar(Msg), Length(Msg)+1, TextRect,
        DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
        DrawTextBiDiModeFlagsReadingOnly);

      //IconID := IconIDs[DlgType];
      IconTextWidth := TextRect.Right;
      IconTextHeight := TextRect.Bottom;

      (*
      if IconID <> nil then
        begin
          Inc(IconTextWidth, 32 + HorzSpacing);
          if IconTextHeight < 32 then IconTextHeight := 32;
        end
      ;
      *)
      //--------------------------
      // Make room for the bitmap
      //--------------------------
      if bitmap <> nil then
        begin
          Inc(IconTextWidth, bitmap.Width + HorzSpacing);
          if IconTextHeight < bitmap.Height then IconTextHeight := bitmap.Height;
        end
      ;

      ButtonCount := 0;
      for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
        if B in Buttons then Inc(ButtonCount)
      ;

      ButtonGroupWidth := 0;
      if ButtonCount <> 0 then ButtonGroupWidth := ButtonWidth * ButtonCount + ButtonSpacing * (ButtonCount - 1);

      ClientWidth := Max(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2;
      ClientHeight := IconTextHeight + ButtonHeight + VertSpacing + VertMargin * 2;

      // ------------------------
      // Set the screen position
      //-------------------------
      if( parentForm = nil ) then // center on the screen
        begin
          Left := (Screen.Width div 2) - (Width div 2);
          Top := (Screen.Height div 2) - (Height div 2);
        end
      else // Center relative to the parent form
        begin
          left := parentForm.Left + ( ( parentForm.Width - width ) div 2 );
          top := parentForm.Top + ( ( parentForm.Height - height ) div 2 );
        end
      ;

      //----------------
      // Set the caption
      //-----------------
      if( dlgCaption = '' ) then
        caption := Application.Title
      else
        caption := dlgCaption
      ;

      // ------------------------
      // Show the bitmap
      //-------------------------
      //if IconID <> nil then
      if bitmap <> nil then
        begin
          with TImage.Create( Result ) do
            begin
              Name := 'Image';
              Parent := Result;
              Transparent := true;
              Picture.Bitmap.Handle := bitmap.Handle;
              //Picture.Icon.Handle := LoadIcon(0, IconID);
              SetBounds(HorzMargin, VertMargin, bitmap.Height, bitmap.Width);
              bottomOfMessage := top + height;
              if( nil <> messageWidth ) then messageWidth^ := bitmap.Width;
            end
          ;
        end
      ;

      // ------------------------
      // Show the message
      //-------------------------
      TMessageForm(Result).Message := TLabel.Create(Result);
      with TMessageForm(Result).Message do
        begin
          Name := 'Message';
          Parent := Result;
          WordWrap := True;
          Caption := Msg;
          BoundsRect := TextRect;
          BiDiMode := Result.BiDiMode;
          ALeft := IconTextWidth - TextRect.Right + HorzMargin;
          if UseRightToLeftAlignment then
            ALeft := Result.ClientWidth - ALeft - Width
          ;
          SetBounds( ALeft, VertMargin, TextRect.Right, TextRect.Bottom );
          if( bottomOfMessage < top + height ) then bottomOfMessage := top + height;
          if( nil <> messageWidth ) then messageWidth^ := + messageWidth^ + horzMargin + width;
        end
      ;

      // ------------------------
      // Set the default button
      //-------------------------
      if mbOk in Buttons then DefaultButton := mbOk else
        if mbYes in Buttons then DefaultButton := mbYes else
          DefaultButton := mbRetry;

      if mbCancel in Buttons then CancelButton := mbCancel else
        if mbNo in Buttons then CancelButton := mbNo else
          CancelButton := mbOk;

      //------------------------------
      // Create and position buttons
      //------------------------------
      if( nil <> savedSpace ) then inc( vertMargin, savedSpace^ );

      X := (ClientWidth - ButtonGroupWidth) div 2;
      for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
        if B in Buttons then
          with TButton.Create(Result) do
          begin
            Name := ButtonNames[B];
            Parent := Result;
            Caption := myButtonCaptions[B];
            ModalResult := ModalResults[B];
            if B = DefaultButton then Default := True;
            if B = CancelButton then Cancel := True;
            SetBounds( X, IconTextHeight + VertMargin + VertSpacing, ButtonWidth, ButtonHeight );
            Inc( X, ButtonWidth + ButtonSpacing );
            if( nil <> buttonBottom ) then buttonBottom^ := IconTextHeight + VertMargin + VertSpacing + ButtonHeight;
            if B = mbHelp then OnClick := TMessageForm(Result).HelpButtonClick;
          end;
    end;

    //----------------------------------------------------
    // let the calling function know
    // where the bottom of the message is, if necessary
    //----------------------------------------------------
    if( nil <> msgBottom ) then msgBottom^ := bottomOfMessage;
    if( nil <> margin ) then margin^ := horzMargin;
  end;
//----------------------------------------------------------------------------------



//----------------------------------------------------------------------------------
// Implementation of custom dialog boxes
//----------------------------------------------------------------------------------

  {*
    Implementation for creating custom dialogs
    All text is translated to the I88n language

    @param msg Message to show
    @param buttons Buttons to have present
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer for the particular button clicked by the user
  }
  function msgDlg(
      const msg: string;
      buttons: TMsgDlgButtons;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;
    var
    	bmp: TBitmap;
  		dlg: TForm;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
      bmp := bitmapStyle( TBitmapStyle( ord( imageStyle ) ) );

      dlg := createMsgDlg(
        caption,
        prettyPrint( msg ),
        buttons,
        parent,
        bmp )
      ;

      result := dlg.showModal();

      dlg.Free();

      if( nil <> parent ) then parent.Repaint();

      bmp.free();
    end
  ;

  {*
    Creates a dialog having Yes, No, and Cancel buttons
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgYesNoCancel(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
    	result := msgDlg(
      	msg,
        [mbYes, mbNo, mbCancel],
        caption,
        imageStyle,
        parent )
      ;
    end
  ;

  {*
    Creates a dialog having Yes and No buttons
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgYesNo(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
    	result := msgDlg(
      	msg,
        [mbYes, mbNo],
        caption,
        imageStyle,
        parent )
      ;
    end
  ;


  {*
    Creates a dialog having an OK button
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer indicating button was clicked
  }
  function msgOK(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
    	result := msgDlg(
      	msg,
        [mbOK],
        caption,
        imageStyle,
        parent )
      ;
    end
  ;


  {*
    Creates a dialog having OK  and Cancel buttons
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgOKCancel(
      const msg: string;
      const caption: string = '';
      imageStyle: TImageStyle = IMGUnspecified;
      parent: TWinControl = nil
    ): integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
    	result := msgDlg(
      	msg,
        [mbOK, mbCancel],
        caption,
        imageStyle,
        parent )
      ;
    end
  ;


  {*
    Creates a dialog alerting user to a specific exception and having an OK button
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
  }
  procedure msgExceptionOK(
      msg: string;
      e: exception = nil;
      parent: TWinControl = nil
    );
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
    	if( e <> nil ) then
      	begin
          if( length( e.message ) > 0 ) then
            msg := msg + tr( 'Technical information:' ) + ' ' + endl + e.message
          ;
        end
      ;
      msgOK( msg, tr( 'Application exception' ), IMGCritical, parent );
    end
  ;


  {*
    ??? Creates a regular expression dialog having OK and Cancel buttons
    All text is translated to I88n language if necessary

    @param msg ???
    @param regexp ??? regular expression
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgInput(
        const msg: string;
        const regexp: string = '';
        const caption: string = '';
        imageStyle: TImageStyle = IMGUnspecified;
        parent: TWinControl = nil;
        default: string = ''
      ): string;
    Var
      dlg: TForm;
      bmp: TBitmap;
      rleEditor: TREEdit;
      bottomOfMessage, messageWidth: integer;
      savedSpace: integer;
      margin: integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
      bmp := bitmapStyle( TBitmapStyle( ord( imageStyle ) ) );

      savedSpace := 21 + 8;

      dlg := createMsgDlg(
        caption,
        prettyPrint( msg ),
        [mbOK, mbCancel],
        parent,
        bmp,
        @bottomOfMessage,
        nil,
        @savedSpace,
        @margin,
        @messageWidth
      );

      dlg.Height := dlg.Height + savedSpace;

      rleEditor := TREEdit.Create( dlg );

      rleEditor.Parent := dlg;
      rleEditor.Height := 21;
      rleEditor.Width := messageWidth div 2;
      rleEditor.Top := bottomOfMessage + 8;
      rleEditor.Left := margin + messageWidth div 4;
      rleEditor.TabOrder := 0;
      rleEditor.Text := default;
      
      if( '' <> regexp ) then
        rleEditor.InputExpression := regexp
      ;

      if( mrOK = dlg.showModal() ) then
        result := rleEditor.Text
      else
        result := ''
      ;

      rleEditor.Free();
      dlg.Free();
      bmp.free();
    end
   ;


  {*
    ??? Creates a regular expression dialog having OK and Cancel buttons
    All text is translated to I88n language if necessary

    @param msg ???
    @param str ???
    @param regexp ??? regular expression
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgInputOKCancel(
        const msg: string;
        var str: string;
        const regexp: string = '';
        const caption: string = '';
        imageStyle: TImageStyle = IMGUnspecified;
        parent: TWinControl = nil
      ): integer;
    Var
      dlg: TForm;
      bmp: TBitmap;
      rleEditor: TREEdit;
      bottomOfMessage, messageWidth: integer;
      savedSpace: integer;
      margin: integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
      bmp := bitmapStyle( TBitmapStyle( ord( imageStyle ) ) );

      savedSpace := 21 + 8;

      dlg := createMsgDlg(
        caption,
        prettyPrint( msg ),
        [mbOK, mbCancel],
        parent,
        bmp,
        @bottomOfMessage,
        nil,
        @savedSpace,
        @margin,
        @messageWidth
      );

      dlg.Height := dlg.Height + savedSpace;

      rleEditor := TREEdit.Create( dlg );

      rleEditor.Parent := dlg;
      rleEditor.Height := 21;
      rleEditor.Width := messageWidth div 2;
      rleEditor.Top := bottomOfMessage + 8;
      rleEditor.Left := margin + messageWidth div 4;
      rleEditor.TabOrder := 0;

      if( '' <> regexp ) then
        rleEditor.InputExpression := regexp
      ;

      rleEditor.Text := str;

      result := dlg.ShowModal();

      if( mrOK = result ) then str := rleEditor.Text;

      rleEditor.Free();
      dlg.Free();
      bmp.free();
    end
  ;


  {*
    Creates a dialog having Yes and No buttons and a checkbox
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param checkboxLabel Text for label to explain what the checkbox indicates
    @param checkboxValue Output result - True if the box is checked, else false
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating which button was clicked
  }
  function msgYesNoCheckbox(
        const msg: string;
        const checkboxLabel: string;
        out checkboxValue: boolean;
        const caption: string = '';
        const imageStyle: TImageStyle = IMGUnspecified;
        const parent: TWinControl = nil
      ): integer;
    var
      dlg: TForm;
      bmp: TBitmap;
      cbxCheckbox: TCheckBox;
      bottomOfButtons: integer;
      margin: integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
      bmp := bitmapStyle( TBitmapStyle( ord( imageStyle ) ) );

      dlg := createMsgDlg(
        caption,
        prettyPrint( msg ),
        [mbYes, mbNo],
        parent,
        bmp,
        nil,
        @bottomOfButtons,
        nil,
        @margin
      );

      cbxCheckbox := TCheckbox.Create( dlg );
      cbxCheckbox.Parent := dlg;
      cbxCheckbox.Height := 21;
      cbxCheckbox.top := bottomOfButtons + 8;
      cbxCheckbox.Left := margin;
      cbxCheckbox.Caption := checkboxLabel;
      cbxCheckbox.width := dlg.Width;

      dlg.Height := dlg.Height + 21 + 8;
      if( cbxCheckbox.Width + 16 > dlg.Width ) then
        dlg.Width := cbxCheckbox.Width + 16
      ;

      result := dlg.ShowModal();
      checkboxValue := cbxCheckbox.Checked;


      cbxCheckbox.Free();
      bmp.Free();
      dlg.Free();
    end
  ;


  {*
    Creates a dialog having an OK button and a checkbox
    All text is translated to I88n language if necessary

    @param msg Message to show
    @param checkboxLabel Text for label to explain what the checkbox indicates
    @param checkboxValue Output result - True if the box is checked, else false
    @param caption Caption to display
    @param imageStyle Icon to display
    @param parent Form from which the dialog is created
    @return Integer corresponding to enumeration indicating button was clicked
  }
  function msgOKCheckbox(
        const msg: string;
        const checkboxLabel: string;
        out checkboxValue: boolean;
        const caption: string = '';
        const imageStyle: TImageStyle = IMGUnspecified;
        const parent: TWinControl = nil
      ): integer;
    var
      dlg: TForm;
      bmp: TBitmap;
      cbxCheckbox: TCheckBox;
      bottomOfButtons: integer;
      margin: integer;
    begin
      if( i88nLanguage() <> _currentLanguage ) then
        translateMyDialogs()
      ;
      bmp := bitmapStyle( TBitmapStyle( ord( imageStyle ) ) );

      dlg := createMsgDlg(
        caption,
        prettyPrint( msg ),
        [mbOK],
        parent,
        bmp,
        nil,
        @bottomOfButtons,
        nil,
        @margin
      );

      cbxCheckbox := TCheckbox.Create( dlg );
      cbxCheckbox.Parent := dlg;
      cbxCheckbox.Height := 21;
      cbxCheckbox.top := bottomOfButtons + 8;
      cbxCheckbox.Left := margin;
      cbxCheckbox.Caption := checkboxLabel;
      cbxCheckbox.width := dlg.Width;

      dlg.Height := dlg.Height + 21 + 8;
      if( cbxCheckbox.Width + 16 > dlg.Width ) then
        dlg.Width := cbxCheckbox.Width + 16
      ;

      result := dlg.ShowModal();
      checkboxValue := cbxCheckbox.Checked;


      cbxCheckbox.Free();
      bmp.Free();
      dlg.Free();
    end
  ;
//----------------------------------------------------------------------------------



//----------------------------------------------------------------------------------
// Testing/debugging functions
//----------------------------------------------------------------------------------

  /// For message OK dialogs for testing images
  procedure testImages();
    begin
      msgOK( 'Foo', 'Foo', IMGQuestion );
      msgOK( 'Foo', 'Foo', IMGInformation );
      msgOK( 'Foo', 'Foo', IMGWarning );
      msgOK( 'Foo', 'Foo', IMGCritical );
      msgOK( 'Foo', 'Foo', IMGSuccess );
    end
  ;
//----------------------------------------------------------------------------------


initialization
  _currentLanguage := i88nLanguage();
  translateMyDialogs();

//----------------------------------------------------------------------------------
// Notes
//----------------------------------------------------------------------------------
(*
( Article from http://www.delphi3000.com/article_1678.asp?SK= )

Question/Problem/Abstract:
How to show a message box that contain a "Don't show this message again." check box?
Answer:

Using CreateMessageDialog function and add your custom components before ShowModal called.
example:
procedure TForm1.Button1Click(Sender: TObject);
Var
  AMsgDialog: TForm;
  ACheckBox: TCheckBox;
begin
  AMsgDialog := CreateMessageDialog('This is a test message.', mtWarning, [mbYes, mbNo]);
  ACheckBox := TCheckBox.Create(AMsgDialog);
  with AMsgDialog do
  try
    Caption := 'Dialog Title' ;
    Height := 169;

    With ACheckBox do
    begin
      Parent := AMsgDialog;
      Caption := 'Don''t show me again.';
      top := 121;
      Left := 8;
    end;

    Case ShowModal of
      ID_YES: ;//your code here after dialog closed
      ID_NO:  ;
    end;
    If ACheckBox.Checked then
    begin
      //...
    end;
  finally
    ACheckBox.Free;
    Free;
  end;
end;

Also, you can customize the messagedialog which you like.


It seems, there is a problem with the height of the messagedialogbox. If the
message length is long or if tehre is a lot of message lines, then checkbox
resides in the middle of the screen, and form height calculation is done by
MessageDlg (if we do not assign) after SHOWMODAL. So, you should also calculate
the possible form height (and as a result, the position of the checkbox) before
"Showmodal". Anyway, the result looks good
*)
//----------------------------------------------------------------------------------
end.
