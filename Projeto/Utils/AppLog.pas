{*
AppLog.pas Functions for sending messages to a runtime log file
----------
Begin: 2007/09/25
Last revision: $Date: 2009-08-11 17:59:07 $ $Author: rhupalo $
Version: $Revision: 1.2 $
Code Documentation Tags: Begin 2009-08-06, Last Revision: 2009-08-06
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2007 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

unit AppLog;

interface

  procedure setUseAppLog( const val: boolean );

  procedure openAppLog( const logFileName: string );
  procedure closeAppLog();
  procedure writeToAppLog( const msg: string );
  procedure addAppLog( const msg: string );

implementation

  uses
    SysUtils,

    MyStrUtils,
    WindowsUtils
  ;

 (*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
  *)


  var
    _appLogFile: textFile; /// Text file for log entries
    _useAppLog: boolean;   /// Flag indicating whether to write entries
    _appLogOpen: boolean;  /// Flag indicating if the log can be written to

  {*
    Provides a means to close the log file
    @param val If not true the log is closed and a "not use" status is set
  }
  procedure setUseAppLog( const val: boolean );
    begin
      if( not( val ) and _useAppLog and _appLogOpen ) then
        closeAppLog()
      ;
      _useAppLog := val;
    end
  ;

  {*
    Opens the log file for writing
    @param logFileName filename only, the path is the application's
    @throws If the file can not be opened no error message is shown
    @comment If the file exists then new entries are appended to the bottom
  }
  procedure openAppLog( const logFileName: string );
    var
      logFilePath: string;
    begin
      if( _useAppLog ) then
        begin
          try
            logFilePath := appDir() + logFileName;
            _appLogOpen := true;
            assignFile( _appLogFile, logFilePath );
            
            if( fileExists( logFilePath ) ) then
              begin
                append( _appLogFile );
                writeln( _appLogFile, endl + endl );
              end
            else
              rewrite( _appLogFile )
            ;

            writeToAppLog( 'Application started.' );
          except
            // fail silently... for now.
            _appLogOpen := false;
          end;
        end
      ;
    end
  ;
  
  {*
    Closes the log file
    @throws If the file can not be closed no error message is shown
    @comment On proper closure last line states 'Application exited normally'
  }
  procedure closeAppLog();
    begin
      if( _appLogOpen ) then
        begin
          try
            writeToAppLog( 'Application exited normally.' );
            closeFile( _appLogFile );
          except
            // fail silently, for now.
          end;
        end
      ;
      _appLogOpen := false;
    end
   ;
  
  {*
    Adds text to the log file
    @param msg Message for the file
  }
  procedure writeToAppLog( const msg: string );
    begin
      addAppLog( msg );
    end
  ;

  {*
    Helper procedure called by writeToAppLog
    @param msg Message for the file
    @throws If the file can not be written to no error message is shown
    @comment The current date and time are added to the beginning of the message
  }
  procedure addAppLog( const msg: string );
    var
      timestamp: string;
    begin
      if( _useAppLog and _appLogOpen ) then
        begin
          timestamp := dateTimeToStr( now() ) + ': ';
          try
            writeLn( _appLogFile, timestamp + msg );
          except
            // fail silently, for now.
          end;
        end
      ;
    end
  ;

initialization
  _useAppLog := false;
  _appLogOpen := false;


end.