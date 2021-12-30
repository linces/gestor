{*
Log.pas  - performs I/O operations on the application log
-------
Begin: 2005/05/27
Last revision: $Date: 2009-08-14 22:24:22 $ $Author: rhupalo $
Version number: $Revision: 1.5 $
Code Documentation Tags: Begin 2009-08-14, Last Revision: 2009-08-14
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University
-
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
  FIX ME: this unit does no error checking, and it really should.

  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit Log;

interface

	procedure openAppLog( fileName: string );

  procedure writeEmptyAppLogLine();

  procedure addAppLog( msg: string; logLevel: integer = 0 );

  //procedure truncateLogFile();

  procedure closeAppLog();

  const

  	APPLOGLEVEL = 0; /// Set to 0; thought is it could range from 0 (very verbose logging) to 5 (completely silent).

  var
  	appLogFile: textFile; /// Text file object to perform I/O operations for log entries
implementation

	uses
  	SysUtils
  ;

  {*
    Opens the application log
    @param fileName Path and filename of application log
    @comment If file exists then new comments are appended, else file is created
  }
	procedure openAppLog( fileName: string );
  	begin
    	if( fileExists( fileName ) ) then
      	begin
        	assignFile( appLogFile, fileName );
          append( appLogFile );
        end
      else
      	begin
        	assignFile( appLogFile, fileName );
          rewrite( appLogFile );
        end
      ;
    end
  ;

  /// Writes an empty line to the log
  procedure writeEmptyAppLogLine();
  	begin
      writeln( appLogFile, '' );
      flush( appLogFile );
    end
  ;

  {*
    Writes msg to the log file
    @param msg Message
    @param logLevel A value < 1 will result in msg being ignored
    @comment Currently no logic for outputting less information for logLevels > 0
    @comment The date and time are prepended to msg
  }
  procedure addAppLog( msg: string; logLevel: integer = 0 );
  	begin
    	if( ( logLevel >= APPLOGLEVEL ) ) then
      	begin
          msg := dateToStr( date() ) + ' ' + timeToStr( time() ) + ' ' + msg;
          writeln( appLogFile, msg );
          flush( appLogFile );
        end
      ;
    end
  ;

  /// Closes the log file
  procedure closeAppLog();
  	begin
   		closeFile( appLogFile );
    end
  ;


end.

