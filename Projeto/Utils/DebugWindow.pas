{*
DebugWindow.pas/dfm - Writing messages to the console, debug window or translation window
-------------------
Begin: 2005/03/07
Last revision: $Date: 2012-08-14 19:09:40 $ $Author: areeves $
Version number: $Revision: 1.32 $
Code Documentation Tags: Begin 2009-08-12, Last Revision: 2009-08-12
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2012 Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
 Documentation generation tags begin with {* or ///
 Replacing these with (* or // foils the documentation generator
*)

unit DebugWindow;

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
    ExtCtrls
  ;

  procedure setDEBUGGING( const val: boolean; const useXlationWindow: boolean = false );

  //---------------------------------
  // class TDebugWindow
  //---------------------------------
  type
  /// Writing debugging messages to the debug window
  TDebugWindow = class( TForm )
      gbxDebugging: TGroupBox;
      mmoDebug: TMemo;
      pnlControls: TPanel;
      btnClearDebug: TButton;
      btnCopyDebug: TButton;
      pnlLineCount: TPanel;
      lblDebugLineCount: TLabel;
      gbxXlation: TGroupBox;
      mmoXlation: TMemo;
      Panel1: TPanel;
      btnClearXlation: TButton;
      btnCopyXlation: TButton;
      Panel2: TPanel;
      lblXlationLineCount: TLabel;

      procedure btnClearClick(Sender: TObject);
      procedure btnCopyClick( sender: TObject );

      procedure mmoKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );

    protected
      procedure updateDebugLineCount();
      procedure updateXlationLineCount();
      procedure clearDebug();
      procedure clearXlation();

      procedure appendDebugText( const str: string );
      procedure appendXlationText( const str: string );

    public
      constructor create( AOwner: TComponent; useXlationWindow: boolean ); reintroduce;

      procedure clear( const clearAll: boolean = false );
    end
  ;

  //---------------------------------
  // Writing messages to the console
  //---------------------------------
  procedure cout( const str: string );


  //-----------------------------------------------------------
  // Writing debugging messages to the console or debug window
  //-----------------------------------------------------------
  procedure showDebugWindow( const useXlationWindow: boolean );

  procedure dbcout( const str: string; const showMsg: boolean ); overload;
  procedure dbcout( const val: integer; const showMsg: boolean ); overload;
  procedure dbcout( const val: double; const showMsg: boolean ); overload;
  procedure dbcout( const val: boolean; const showMsg: boolean ); overload;
  procedure dbcout( const val: variant; const showMsg: boolean ); overload;
  procedure dbcout( const fmt: string; const args: array of const; const showMsg: boolean ); overload;
  procedure dbcout( list: TStringList; const showMsg: boolean ); overload;
  procedure dbcout( const val: pointer; const showMsg: boolean ); overload;

  procedure dbcout2( const str: string; dummy: boolean = true ); overload;
  procedure dbcout2( const val: integer; dummy: boolean = true ); overload;
  procedure dbcout2( const val: double; dummy: boolean = true ); overload;
  procedure dbcout2( const val: boolean; dummy: boolean = true ); overload;
  procedure dbcout2( const val: variant; dummy: boolean = true ); overload;
  procedure dbcout2(const fmt: string; const args: array of const; dummy: boolean = true ); overload;
  procedure dbcout2( list: TStringList; dummy: boolean = true ); overload;
  procedure dbcout2( const val: pointer; dummy: boolean = true ); overload;

  function dbStr( const val: string ): string; overload;
  function dbStr( const val: integer ): string; overload;
  function dbStr( const val: double ): string; overload;
  function dbStr( const val: boolean ): string; overload;
  function dbStr( const val: variant ): string; overload;

  procedure cdbcout( val: pchar ); cdecl;

  procedure dbtest( const str: string ); overload;
  procedure dbtest( const val: integer ); overload;
  procedure dbtest( const val: double ); overload;
  procedure dbtest( const val: boolean ); overload;
  procedure dbtest( const val: variant ); overload;
  procedure dbtest(const fmt: string; const args: array of const ); overload;

  procedure dbClear();

  // One might think that these functions belong in MyDialogs, since they are graphical.
  // They are provided here, so that they are available to non-graphical units without the
  // need to include MyDialogs.
  procedure dbmsg( const str: string; const showMsg: boolean = true ); overload;
  procedure dbmsg( const val: integer; const showMsg: boolean = true ); overload;
  procedure dbmsg( const val: double; const showMsg: boolean = true ); overload;
  procedure dbmsg( const val: boolean; const showMsg: boolean = true ); overload;
  // (Overloaded forms of dbmsg might eventually be given here)

  { Used by I88n if a phrase is encountered that is not in the dictionary.
    See function 'tr' in I88n for more information. }
  procedure dbXlation( const str: string );

	var
    DEBUGGING: boolean;           /// Flag indicating whether debugging is invoked
		dbgForm: TDebugWindow;        /// Intance of debug window form
  	debugWindowShowing: boolean;  /// Indicates that the debug window form is shown
    consoleSilent: boolean;       /// Determines whether messages can be written to the console


implementation

{$R *.dfm}

  uses
    Clipbrd,
    MyStrUtils
  ;

  {*
    Invokes or turns off debugging

    @param val If true the debugging window is shown, false does not hide window
    @param useXlationWindow If true language translation is implemented
    @comment Procedure also sets the state of private flag DEBUGGING
  }
  procedure setDEBUGGING( const val: boolean; const useXlationWindow: boolean = false );
    begin
      if( val ) then
        begin
          DEBUGGING := true;
          showDebugWindow( useXlationWindow );
        end
      else
        begin
          DEBUGGING := false;
        end
      ;
    end
  ;


//-----------------------------------------------------------------------------
// Class TDebugWindow
//-----------------------------------------------------------------------------

  {*
    Creates instance of Debug Window form
    @param AOwner TForm
    @param useXlationWindow Whether to invoke language translation
  }
  constructor TDebugWindow.create( AOwner: TComponent; useXlationWindow: boolean );
    begin
      inherited create( AOwner );

      gbxXlation.Visible := useXlationWindow;
    end
  ;

  {*
    Event handler to clear either the debug or the translation window output
    @param Sender btnClearDebug or btnClearXlation
  }
  procedure TDebugWindow.btnClearClick(Sender: TObject);
    begin
      if( sender = btnClearDebug ) then
        clearDebug()
      else if( sender = btnClearXlation ) then
        clearXlation()
      ;
    end
  ;

  {*
    Event handler to copy to clipboard from either the debug or the translation window output
    @param Sender btnCopyDebug or btnCopyXlation
  }
  procedure TDebugWindow.btnCopyClick( sender: TObject );
    begin
      if( sender = btnCopyDebug ) then
        begin
          mmoDebug.SelectAll();
          mmoDebug.CopyToClipboard();
        end
      else if( sender = btnCopyXlation ) then
        begin
          mmoXlation.SelectAll();
          mmoXlation.CopyToClipboard();
        end
      ;
    end
  ;


  {*
     Key mapping event handler for the contents of the output memo controls
     Ctrl-A Selects all text, working the same in the Debug and Xlation
     Ctrl-C Selects all text and copies it to the clipboard in Xlation

     @param Sender Either mmoDebug or mmoXlation (instances of TMemo)
     @param Key Other key pressed while Ctrl key is down
     @param Shift The state of the Alt, Ctrl, and Shift keys and the mouse buttons
  }
  procedure TDebugWindow.mmoKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
    var
      mmo: TMemo;
    begin
      if( not( sender is TMemo ) ) then
        exit
      ;

      mmo := sender as TMemo;

      if( [ssCtrl] = shift ) then
        begin
          if( char( key ) = 'A' ) then
            mmo.selectAll()
          else if( char( key ) = 'C' ) then
            begin
              if( 0 = mmo.SelLength ) then
                begin
                  mmo.SelectAll();
                  mmo.CopyToClipboard();
                end
              else
                ClipBoard.SetTextBuf( PChar( mmo.SelText ) )
              ;
            end
          ;
        end
      ;
    end
  ;


  {*
    Appends str to the debug window output and increments the line count
    @param str Comment sent to the debug window for display
  }
  procedure TDebugWindow.appendDebugText( const str: string );
    begin
      if( nil <> mmoDebug ) then
        begin
          mmoDebug.Lines.Append( str );
          updateDebugLineCount();
        end
      ;
    end
  ;

  {*
    Appends str to the translation window output and increments the line count
    @param str Comment sent to the translation window for display
  }
  procedure TDebugWindow.appendXlationText( const str: string );
    begin
      if( nil <> mmoDebug ) then
        begin
          mmoXlation.Lines.Append( str );
          updateXlationLineCount();
        end
      ;
    end
  ;


  /// Updates the displayed line count in the debug window
  procedure TDebugWindow.updateDebugLineCount();
    begin
      // FIX ME: Some day, it might be nice to make this line translatable.
      // For now, it's honestly not worth the effort.
      lblDebugLineCount.Caption := (* tr( 'Lines:' ) *) 'Lines:' + ' ' + intToStr( mmoDebug.Lines.Count );
    end
  ;


  /// Updates the displayed line count in the translation window
  procedure TDebugWindow.updateXlationLineCount();
    begin
      // FIX ME: Some day, it might be nice to make this line translatable.
      // For now, it's honestly not worth the effort.
      lblXlationLineCount.Caption := (* tr( 'Lines:' ) *) 'Lines:' + ' ' + intToStr( mmoXlation.Lines.Count );
    end
  ;


  /// Clears the output text from the debug window and updates line count
  procedure TDebugWindow.clearDebug();
    begin
      mmoDebug.Clear();
      updateDebugLineCount();
    end
  ;

  /// Clears the output text from the translation window and updates line count
  procedure TDebugWindow.clearXlation();
    begin
      mmoXlation.Clear();
      updateXlationLineCount();
    end
  ;

  {*
    Clears the output from the debug window and optionally also from the translation window
    @param clearAll If true both windows are cleared, else only debug
  }
  procedure TDebugWindow.clear( const clearAll: boolean = false );
    begin
      clearDebug();

      if( clearAll ) then
        clearXlation()
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Writing debugging messages to the console or debug window
//-----------------------------------------------------------------------------

  {*
    Loads and shows the the Debug window, and optionally the Translation window
    @param useXlationWindow Whether or not to invoke translation
  }
  procedure showDebugWindow( const useXlationWindow: boolean );
  	begin
    {$IF Defined(Console)}
			debugWindowShowing := false;
    {$ELSE}
      if( nil = dbgForm ) then
        begin
          dbgForm := TDebugWindow.create( Application, useXlationWindow );
          dbgForm.Top := 0;
          dbgForm.Left := 0;
          dbgForm.clear( true );
          dbgForm.Show();
          debugWindowShowing := true;
        end
      ;
    {$IFEND}
    end
  ;


  /// Clears the output from the Debug window (but not translation window or console)
  procedure dbClear();
    begin
      if( DEBUGGING ) then
        begin
          {$IF Defined(Console)}
            // I don't know how to clear the console
          {$ELSE}
            if( debugWindowShowing ) then
              dbgForm.Clear( false )
            ;
          {$IFEND}
        end
      ;
    end
  ;


  {*
    Appends a message to the debug window

    @param fmt Formatting string containing a message and data placeholder(s)
    @param args Data to be placed into fmt using Delphi Format function
    @param showMsg If true a message is formatted and sent to the console, else nothing
  }
  procedure dbcout(const fmt: string; const args: array of const; const showMsg: boolean );
    var
      str: string;
    begin
      if( showMsg ) then
        begin
          str := format( fmt, args );
          dbcout( str, true );
        end
      ;
    end
  ;


  {*
    Appends a message to the debug window

    @param val If val = null then 'NULL VARIANT' is output, else val
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( const val: variant; const showMsg: boolean );
  	begin
    	if( showMsg ) then
      	begin
          if( val = null ) then
            dbcout( 'NULL VARIANT', true )
          else
            dbcout( string( val ), true )
          ;
        end
      ;
    end
  ;


  {*
    Appends a floating point numeric value (val) to the debug window

    @param val Floating point value
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( const val: double; const showMsg: boolean );
  	begin
    	if( showMsg ) then dbcout( floatToStr( val ), true );
    end
  ;


  {*
    Appends an integer numeric value (val) to the debug window

    @param val Integer value
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( const val: integer; const showMsg: boolean );
  	begin
   		if( showMsg ) then dbcout( intToStr( val ), true );
    end
  ;


  {*
    Appends a boolean value (val) to the debug window

    @param val True or False value
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( const val: boolean; const showMsg: boolean );
  	begin
    	if( showMsg ) then dbcout( uiBoolToText( val ), true );
    end
  ;


  {*
    Appends a message string to the debug window

    @param str Message
    @param showMsg If true message is sent to the console, else nothing
    @comment The other overloaded dbcout procedures call this one after converting their input to string
  }
  procedure dbcout( const str: string; const showMsg: boolean );
    begin
			if( DEBUGGING ) then
        begin
				  if( showMsg ) then
            begin
              {$IF Defined(Console)}
                cout( str );
              {$ELSE}
                if( debugWindowShowing ) then
                  dbgForm.appendDebugText( str )
                ;
              {$IFEND}
            end
          ;
        end
      ;
    end
  ;


  {*
    Writes the contents of a string list to the debugging window or the console

    @param list The TStringList with strings to be written to the debugging window
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( list: TStringList; const showMsg: boolean );
    var
      i: integer;
    begin
      dbcout( 'List contents (' + intToStr( list.Count ) + ' items):', showMsg );

      for i := 0 to list.Count - 1 do
        dbcout( '  ' + list.Strings[i], showMsg )
      ;

      dbcout( 'Done with list contents.', showMsg );
    end
  ;


  {*
    Appends a message string to the debug window

    @param val A pointer, to be displayed in hex format
    @param showMsg If true message is sent to the console, else nothing
  }
  procedure dbcout( const val: pointer; const showMsg: boolean );
    var
      str: string;
    begin
      if( showMsg ) then
        begin
          str := format( '0x%x', [cardinal( val )] );
          dbcout( str, true );
        end
      ;
    end
  ;


  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const str: string; dummy: boolean = true ); begin dbcout( str, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const val: integer; dummy: boolean = true ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const val: double; dummy: boolean = true ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const val: boolean; dummy: boolean = true ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const val: variant; dummy: boolean = true ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2(const fmt: string; const args: array of const; dummy: boolean = true ); begin dbcout( fmt, args, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( const val: pointer; dummy: boolean = true ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows because the value of dummy is disregarded
  procedure dbcout2( list: TStringList; dummy: boolean = true ); begin dbcout( list, true ); end;

  /// Convenience function that converts parameter val (whatever it is) to a string.
  function dbStr( const val: string ): string; begin result := val; end;
  /// Convenience function that converts parameter val (whatever it is) to a string.
  function dbStr( const val: integer ): string; begin result := intToStr( val ); end;
  /// Convenience function that converts parameter val (whatever it is) to a string.
  function dbStr( const val: double ): string; begin result := usFloatToStr( val ); end;
  /// Convenience function that converts parameter val (whatever it is) to a string.
  function dbStr( const val: boolean ): string; begin result := usBoolToText( val ); end;
  /// Convenience function that converts parameter val (whatever it is) to a string.
  function dbStr( const val: variant ): string;
    begin
      if( val = null ) then
        result := 'NULL VARIANT'
      else
        result := string( val )
      ;
    end
  ;


  {*
    Casts a null-terminated string to a AnsiString and sends it to the debug window
    @param null-terminated string
  }
  procedure cdbcout( val: pchar );
    begin
      dbcout( string( val ), true );
    end
  ;

  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest( const str: string ); begin dbcout( str, true ); end;
  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest( const val: integer ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest( const val: double ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest( const val: boolean ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest( const val: variant ); begin dbcout( val, true ); end;
  /// Same as overloaded version of dbcout except the message always shows, used by self test procedures
  procedure dbtest(const fmt: string; const args: array of const ); begin dbcout( fmt, args, true ); end;


  {*
    Sends str to a Windows message dialog box when in debug mode
    @param str Message
    @param showMsg If false the message is not processed
    @comment DEBUGGING must be True for the message to be processed, see proc SetDEBUGGING
    @comment The other overloaded dbmsg procedures call this one after converting their input to string
  }
  procedure dbmsg( const str: string; const showMsg: boolean = true );
    begin
      if( DEBUGGING ) then
        if( showMsg ) then showMessage( str );
    end
  ;


  {*
    Sends val to a Windows message dialog box when in debug mode
    @param val Numeric integer
    @param showMsg If false the message is not processed
  }
  procedure dbmsg( const val: integer; const showMsg: boolean = true );
    begin
      if( showMsg) then dbmsg( intToStr( val ) );
    end
  ;


  {*
    Sends val to a Windows message dialog box when in debug mode
    @param val Numeric floating point
    @param showMsg If false the message is not processed
  }
  procedure dbmsg( const val: double; const showMsg: boolean = true );
    begin
      if( showMsg) then dbmsg( uiFloatToStr( val ) );
    end
  ;


  {*
    Sends val to a Windows message dialog box when in debug mode
    @param val Boolean value
    @param showMsg If false the message is not processed
  }
  procedure dbmsg( const val: boolean; const showMsg: boolean = true );
    begin
      if( showMsg ) then dbmsg( uiBoolToText( val ) );
    end
  ;


  {*
    Sends str to either the console or the Debug Translation window
    @param str Message
  }
  procedure dbXlation( const str: string );
    begin
      {$IF Defined(Console)}
        cout( str );
      {$ELSE}
        if( debugWindowShowing ) then
          dbgForm.appendXlationText( str )
        ;
      {$IFEND}
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Writing messages to the console
//-----------------------------------------------------------------------------

  {*
    Sends str to the console
    @param str Message
  }
	procedure cout( const str: string );
  	begin
    	{$IF Defined(Console)}
      	if( (* DEBUGGING or *) ( not( consoleSilent ) ) ) then
        	writeLn( str )
        ;
      {$IFEND}
    end
  ;
//-----------------------------------------------------------------------------


end.
 