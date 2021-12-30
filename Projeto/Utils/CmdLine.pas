{*
CmdLine.pas - a class for parsing Delphi command line options.
-----------
Begin: 2005/05/27
Last revision: $Date: 2009-08-13 19:10:48 $ $Author: rhupalo $
Version number: $Revision: 1.9 $
Code Documentation Tags: Begin 2009-08-10, Last Revision: 2009-08-10
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2006 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Based on CCmdLine (a C++ command line parser) written by Chris Losinger.
Please see http://www.codeproject.com/cpp/ccmdline.asp for the original
code.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit CmdLine;

interface

	uses
    QLists,
    QStringMaps
  ;

  type
    /// Structures to hold command line parameters (switches ans switch arguments)
    TCmdParam = class( TQStringList ) end;


	type
    /// Parses the command line parameters into a series of switches and switch arguments
    TCmdLine = class( TQStringObjectMap )
      public
        constructor create(); override;
        destructor destroy(); override;

        function splitLine(): integer;
        function hasSwitch( pSwitch: string ): boolean;
        function getSafeArgument( pSwitch: string; iIdx: integer; pDefault: string ): string;
        function getArgument( pSwitch: string; iIdx: integer ): string;
        function getArgumentCount( pSwitch: string ): integer;

      protected
        function isSwitch( const pParam: string ): boolean;
		end
	;

	
implementation

	uses
  	MyStrUtils,
    SysUtils
  ;

  /// Parses the command line parameters into a series of switches and switch arguments
	constructor TCmdLine.create();
    var
      curParam: string;
      arg: string;
      i: integer;
      cmd: TCmdParam;
    begin
    	inherited create();
      
    	clear();

      // Delphi automatically skips the EXE name, so start with the first argument
    	for i := 0 to ParamCount do                       //ParamCount is a Delphi function
      	begin
        	// If it's a switch, start a new TCmdParam
          if( isSwitch( paramStr(i) ) ) then            //paramStr is a Delphi function
            begin
              curParam := paramStr(i);
              cmd := TCmdParam.Create();
              // Add the TCmdParam to 'self'
              self.add( curParam, cmd );
            end
          else
          	begin
              // it's not a new switch, so it must an argument for the last switch
              // ... let's add it
              arg := paramStr(i);
              
              cmd := self.value( curParam ) as TCmdParam;
              if( nil <> cmd ) then
                begin
                  //dbcout( 'SWITCH ' + curParam + ' arg: ' + arg );
                  cmd.Append( arg );
                end
              ;
            end
          ;
        end
      ;
    end
  ;

 /// Memory cleanup
  destructor TCmdLine.destroy();
    begin
      self.deleteValues();
      inherited destroy();
    end
  ;

  {*
    Counts the number of switches in the commandline
    @return Count of switches in the command line
  }
  function TCmdLine.splitLine(): integer;
  	begin
   		result := count;
    end
  ;

  {*
    Checks if pSwitch is a valid argument (contains a switch)
    @param pSwitch string holding the command line switch
    @return True if pSwitch appears to be a command parameter
  }
	function TCmdLine.hasSwitch( pSwitch: string ): boolean;
  	var
    	cmd: TCmdParam;
  	begin
    	cmd := self.value( pSwitch ) as TCmdParam;
      result := ( nil <> cmd );
    end
  ;

  {*
    Provides a count of the number of arguments in pSwitch
    @param pSwitch Command line switch
    @return Count of arguments
  }
	function TCmdLine.getArgumentCount( pSwitch: string ): integer;
  	var
    	cmd: TCmdParam;
    begin
    	cmd := self.value( pSwitch ) as TCmdParam;

      if( nil = cmd ) then
      	result := -1
      else
      	result := cmd.Count
      ;
    end
  ;


  {*
    Returns the argument at position iIdx in the switch
    @param pSwitch command line switch
    @param iIdx argument index
    @param pDefault Argument returned if requesting iIdx raises an exception
    @return Argument text if successful or pDefault string on exception
  }
	function TCmdLine.getSafeArgument( pSwitch: string; iIdx: integer; pDefault: string ): string;
  	begin
    	try
      	result := getArgument( pSwitch, iIdx );
      except
      	result := pDefault;
      end;
    end
  ;


  {*
    Returns the argument at position iIdx in the switch
    @param pSwitch command line switch
    @param iIdx argument index
    @return Argument text if successful or empty string on exception
    @throws Raises an exception if iIdx exceeds the number of arguments
  }
	function TCmdLine.getArgument( pSwitch: string; iIdx: integer ): string;
  	var
    	cmd: TCmdParam;
  	begin
    	result := '';

    	if( hasSwitch( pSwitch ) ) then
      	begin
        	cmd := self.value( pSwitch ) as TCmdParam;

          if( cmd.Count > iIdx ) then
          	result := cmd.at( iIdx )
          else
          	raise exception.Create( 'Commandline argument index out of bounds.' )
          ;

        end
      else
      	raise exception.Create( 'Commandline switch not found.' )
      ;
    end
  ;


  {*
    Identify switches from negative number arguments, both begin with '-'
    @param pParam command line parameter
    @return true if the character following the '-' is not numeric
  }
	function TCmdLine.isSwitch( const pParam: string ): boolean;
  	begin
      (* // Never used??
     // switches must non-empty
     // must have at least one character after the '-'
    	if( length( pParam ) <= 1 ) then
      	result := false
      ;
      *)

      // switches always start with '-'
      if( charAt( pParam, 0 ) = '-' ) then
      	begin
          // allow negative numbers as arguments.
          // ie., don't count them as switches
          result := not( isDigit( charAt( pParam, 1 ) ) );
        end
      else
      	result := false
      ;
    end
  ;



end.
