{*
MyStrUtils.pas - functions to make string handling easier and more convenient.
---------------
Begin: 2005/01/06
Last revision: $Date: 2011-03-30 19:08:03 $ $Author: areeves $
Version number: $Revision: 1.91 $
Code Documentation Tags: Begin 2009-08-14, Last Revision: 2009-08-18
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2013 NAADSM Development Team

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

}


(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator

    Some of these functions may be automatically tested.  If the symbol
    TESTING is defined in Defs.inc, the appropriate test code is automatically
    run when this unit is initialized.  Please see the test code and the
    initialization section at the end of this unit.

    Short function descriptions are provided in the interface section.  More
    detailed comments are provided in the implementation section as needed.
*)

unit MyStrUtils;

interface

	uses
    SysUtils,
    Variants,
    TypInfo
  ;

  // Unit self-test
  //--------------------
  procedure selfTest();
  

  // Special characters
  //-------------------
  const
    endl: string = #13#10;        /// Endline: Carriage Return + Line Feed
    CHAR_BACKSPACE: char = #8;    /// Backspace character
    CHAR_TAB: char = #9;          /// Tab character
    tab: char = #9;               /// Tab character
    CHAR_NULL: char = #0;         /// Null character

    CHAR_LEFT_ARROW: char = #37;  /// Left Arrow character
    CHAR_UP_ARROW: char = #38;    /// Up Arrow character
    CHAR_RIGHT_ARROW: char = #39; /// Right Arrow character
    CHAR_DOWN_ARROW: char = #40;  /// Down Arrow character


  // Substrings
  //-----------
  { Returns the character at the zero-indexed position in the string }
  function charAt( const str: string; pos: integer ): char;

  { Is the string empty? }
  function strIsEmpty( const str: string ): boolean;

  // Changing case
  //---------------
  { Converts string to all lower case }
  function lower( const str: string ): string;

  { Converts string to all upper case }
  function upper( const str: string ): string;

  { Converts the first character of the string to upper case }
  function capitalize( const str: string ): string;


  // Int conversions
  //----------------
  function myStrToInt( const str: string; default: integer = 0; raiseException: boolean = false ): integer;


  // Float conversions
  //------------------
  { Converts string to float using local regional settings. }
  function uiStrToFloat( const str: string; default: double = 0.0; raiseException: boolean = false ): double;

  { Converts floats to strings using local regional settings.  Useful for user interface display. }
  function uiFloatToStr( const val: double; const rndToPlace: integer = 6; const trunc: boolean = true ): string;

  { Same as uiFloatToStr, but 0's are added to the end of the string if necessary to get to the specified number of places.  Useful for currency. }
  function uiFloatToStrZeroPadded( const val: double; const rndToPlace: integer; const trunc: boolean = true ): string;

  { Converts string to float using US regional settings. }
  function usStrToFloat( const str: string; default: double = 0.0; raiseException: boolean = false  ): double;

  { Converts floats to strings using US English regional settings.  Useful for writing XML, SQL. }
  function usFloatToStr( const val: double; const rndToPlace: integer = 6; const trunc: boolean = true ): string;

  { Same as usFloatToStr, but 0's are added to the end of the string if necessary to get to the specified number of places.  Useful for currency. }
  function usFloatToStrZeroPadded( const val: double; const rndToPlace: integer; const trunc: boolean = true ): string;

  { Use application-specific delimiters, if available.  Otherwise, uses local regional settings. }
  function csvStrToFloat( str: string; default: double = 0.0; raiseException: boolean = false ): double;
  function csvFloatToStr( const val: double ): string;

  { Converts floats to strings for debugging messages.  Currently an alias for usFloatToStr, but this could be changed. }
  function dbFloatToStr( const val: double ): string;

  // Bool conversions
  //-----------------
  { Writes translated versions of "true" or "false" }
  function uiBoolToText( const val: boolean ): string;

  { Writes the strings "true" or "false". Useful for XML, SQL. Contrast to SysUtils.boolToStr(), which returns "-1" or "0", respectively. }
  function usBoolToText( const val: boolean ): string;

  function usTextToBool( val: string ): boolean;

  function boolToInt( const val: boolean ): integer; // FIX ME: may be unnecessary.
  function intToBool( const val: integer ): boolean; // FIX ME: may be unnecessary.


  // String formatting
  //------------------
  { Appends bitToAppend to the existing string val. }
  procedure appendToString( var val: string; bitToAppend: string );

  { Strips leading and trailing whitespace, converts to lower case. }
  function fixUp( const val: string ): string;

  { Breaks a long string into multiple lines }
  function prettyPrint(
      const srcStr: string;
      prefLineLen: integer = 50;
      usePunct: boolean = true;
      forceBreak: boolean = true
    ): string;

  { Helper Method used by prettyPrint() }
  function splitNear(
      pos: integer;
      var str: string;
      maxLenAdd: integer = 0;
      usePunct: boolean = true;
      forceBreak: boolean = true
    ): string;


  // Determining character type
  //----------------------------
  { Is the character white space?  See detailed comment. }
  function isSpace( const ch: char ): boolean;

  { Is the character a special symbol?  See comments in function. }
  function isPunct( const ch: char ): boolean;

  { Is the comment a number? }
  function isDigit( const ch: char ): boolean;


	// Functions for filename handling
  //--------------------------------
  type TPathName = type string;  /// a string for filename operations; in cases holding the filename, not the path

  { Returns the file name without other path elements }
  function shortFileName( const path: TPathName ): TPathName;

  { returns the file name without its extension }
  function stripExtension( const path: TPathName ): TPathName;

  { Returns just the directory path associated with a file, with a trailing backslash. }
  function directory( const path: TPathName ): TPathName;

  { For a directory (with a trailing slash), returns the name of the parent directory.
    For a file, this is the same as directory(). }
  function parentDirectory( const path: TPathName ): TPathName;

  { Returns the directory path of the current executable, with a trailing backslash. }
  function appPath(): TPathName;

  { Abbreviates the pathname by excising pieces from the middle of the string.  See detailed comment. }
	function abbrevPath( path: TPathName; Count: Integer = 40 ): string;

  { Is the specified path absolute or relative?  NOTE: this has nothing to do with whether the directory exists or is accessible. }
  function isAbsolutePath( path: TPathName ): boolean;


  // Number formatting
  //------------------
  function firstNonZeroChar( const str: string; const fromEnd: boolean = false ): integer;

  function isNonZeroNumChar( const ch: char ): boolean;

  function paddedInt( toPad: integer; places: integer; padChar: string = '0' ): string;


  // Delimited lists
  //----------------
  { Returns items from a delimited list in a one-line string }
  function getElementStr( n: word; Delimiter: Char; ln: string ): string;

  // FIX ME: this function is 1-indexed!!!
  //function GetElement( n: word; Delimiter: Char; ln: string ): variant;

  // XML/HTML encoding/decoding
  //----------------------------
  function encodeXml( const s: string; const allowQuotesAndCommas: boolean = false ): string;
  function decodeXml( const s: string ): string;
  function encodeHtml( const s: string ): string;
  function decodeHtml( const s: string ): string;
  function stripXmlHeaders( const s: string ): string;

  // CSV formatting
  //---------------
  function csvQuote( const s: string ): string;


  // RC4 encryption/decryption
  //--------------------------
  { Note: this function requires genprps.dll }
  function rc4Encrypt( const str, password: string ): string;


  // Hex encoding/decoding
  //----------------------
  { Note: these functions require genprps.dll }
  function hexEncode( str: string ): string;
  function hexDecode( str: string ): string;


  // Working with string and character pointers
  //-------------------------------------------
  procedure appendToPstring( pstr: pstring; str: string );
  procedure prependToPstring( pstr: pstring; str: string );

  // Testing functions
  //------------------
  //procedure zzTestsubstrReplace();
  procedure zzTestFirstNonZeroChar();
  procedure zzTestFileNameUtils();


implementation

  uses
    Windows, // includes functions for DLL loading
    Forms, // includes Application object
    Dialogs,
    Math,
    StrUtils,

    RegExpr,
  	DebugWindow,
    CStringList,
    RoundToXReplacement_3c,
    FunctionPointers,
    I88n
  ;

  var
    /// Variables for loading the DLL genprps.dll
    //------------------------------
    dllLoadErrors: string;                 /// Holds messages regarding errors loading genprps.dll
    atrConfLoaded: boolean;                /// For loading the DLL genprps.dll
    _rc4Encrypt: TCFnPChar_2_Charp_Charp;  /// For loading the DLL genprps.dll
    _hexEncode: TCFnPChar_1_Charp;         /// For loading the DLL genprps.dll
    _hexDecode: TCFnPChar_1_Charp;         /// For loading the DLL genprps.dll

    _usFormatSettings: TFormatSettings;  /// For float conversion and other formatting

  const
    DBSHOWMSG: boolean = true; /// set to true to enable debugging messages for this unit.

    NAN_STRING = '(Not a number)';       /// holds 'Not a number'
    INF_STRING = '(Negative infinity)';  /// holds 'Negative infinity'
    NEG_INF_STRING = '(Infinity)';       /// holds 'Infinity

    
//-----------------------------------------------------------------------------
// Delimited lists
//-----------------------------------------------------------------------------
  {*
    Returns a string (as variant) from a delimited string at delimiter position n

    @param n Which element in the delimited string to return
    @param Delimiter Character that delimits elements of text within the string
    @param ln Delimited string
    @return Contents of element n of string ln or null if element n does not exist
  }
  function GetElement( n: word; Delimiter: Char; ln: string ): variant;
    var
      p, cnt: longint;
      element: string;
    begin
      ln := ln + Delimiter; // add delimiter to get the last one
      cnt := 0;

      repeat
        p := Pos( Delimiter,ln );
        if( p > 0 ) then
          begin
            element := Copy( ln, 1, p - 1);
            Delete(ln, 1, p);
            cnt := cnt + 1;
          end
        ;
      until (p = 0) or (cnt = n);

      if (p = 0) and (cnt < n) then
        Result := null
      else
        Result := element
      ;
    end
  ;

  {*
    Returns a string from a delimited string at delimiter position n

    @param n Which element in the delimited string to return
    @param Delimiter Character that delimits elements of text within the string
    @param ln Delimited string
    @return Contents of element n of string ln or empty string if element n does not exist
  }
  function getElementStr( n: word; Delimiter: Char; ln: string ): string;
    var
      v: variant;
    begin
      // Remember: the screwy getElement function is 1-indexed.
      // FIX ME: that should be changed!!
      v := getElement( n + 1, delimiter, ln );
      if( null = v ) then
        result := ''
      else
        result := string( v )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Int conversions
//-----------------------------------------------------------------------------

  {*
    Converts the contents of str to an integer

    @param str A string holding numeric characters
    @param default Default integer value to return if the conversion fails
    @param raiseException Whether to raise an exception if the conversion fails
    @throws Optionally, an exception can be raised indicating str can not be converted
    @return Integer if sucess or default if the conversion fails
  }
  function myStrToInt( const str: string; default: integer = 0; raiseException: boolean = false ): integer;
  	var
    	d: integer;
      str2: string;
  	begin
    	str2 := fixup( str );

      if( tryStrToInt( str2, d ) ) then
      	result := d
      else
      	begin
        	if( raiseException ) then
            raise exception.Create( 'Cannot convert "' + str + '" to an integer.' )
          ;
          result := default;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Float conversions
//-----------------------------------------------------------------------------

  {*
    Converts the contents of str to a double

    @param str A string holding numeric characters
    @param default Default double value to return if the conversion fails
    @param raiseException Whether to raise an exception if the conversion fails
    @throws Optionally, an exception can be raised indicating str can not be converted
    @return Double if success or default if the conversion fails
  }
  function uiStrToFloat( const str: string; default: double = 0.0; raiseException: boolean = false  ): double;
  	var
    	d: double;
      str2: string;
  	begin
    	str2 := fixup( str );

      if( 0 = length( str2 ) ) then
        result := default
      else if( tryStrToFloat( str2, d ) ) then
      	result := d
      else
      	begin
        	if( raiseException ) then
            raise exception.Create( 'Cannot convert "' + str + '" to a double.' )
          ;
          result := default;
        end
      ;
    end
  ;


  {*
    Converts the contents of str to a double using English localization format

    @param str A string holding numeric characters
    @param default Default double value to return if the conversion fails
    @param raiseException Whether to raise an exception if the conversion fails
    @throws Optionally, an exception can be raised indicating str can not be converted
    @return Double if success or default if the conversion fails
  }
  function usStrToFloat( const str: string; default: double = 0.0; raiseException: boolean = false  ): double;
  	var
    	d: double;
      str2: string;
  	begin
    	str2 := fixup( str );

      if( tryStrToFloat( str2, d, _usFormatSettings ) ) then
      	result := d
      else
      	begin
        	if( raiseException ) then
            raise exception.Create( 'Cannot convert "' + str + '" to a double.' )
          ;
          result := default;
        end
      ;
    end
  ;


  {*
    Converts the contents of str to a double replacing the the I88n decimal place separator
    stored in _Settings with the character used by the System

    @param str A string holding numeric characters
    @param default Default double value to return if the conversion fails
    @param raiseException Whether to raise an exception if the conversion fails
    @return Double if success or default if the conversion fails
    @comment Fix Me: Is this Desc correct - check with Aaron
  }
  function csvStrToFloat( str: string; default: double = 0.0; raiseException: boolean = false ): double;
    begin
      str := ansiReplaceStr( str, csvDecPt, SysUtils.DecimalSeparator );
      result := usStrToFloat( str );
    end
  ;


  {*
    Converts the contents of val to a string rounded to rndToPlace digits
    using English decimal point formating

    @param val Numeric floating point value to be converted to string
    @param rndToPlace Number of desired significant didgits
    @param trunc Whether to truncate
    @return String representation of formatted Double
    or NAN_STRING if val is not valid numeric
    or INF_STRING or NEG_INF_STRING if val is an infinite number
    @comment Fix Me: This needs more detail, for example what exatly does truncate do - check with Aaron
  }
  function usFloatToStr( const val: double; const rndToPlace: integer = 6; const trunc: boolean = true ): string;
    begin
      if( isNaN( val ) ) then
        begin
          result := NAN_STRING;
          exit;
        end
      ;

      if( IsInfinite( val ) ) then
        begin
          if( math.NegativeValue = sign( val ) ) then
            result := INF_STRING
          else
            result := NEG_INF_STRING
          ;
          exit;
        end
      ;

      try
        if( trunc ) then
          begin
            if( power( 10, -1 * rndToPlace ) > abs( val ) ) then
              result := floatToStr( 0.0, _usFormatSettings )
            else
              result := floatToStr( RoundDblTo( val, -1 * rndToPlace, drHalfUp ), _usFormatSettings )
            ;
          end
        else
          result := format( '%.' + intToStr( rndToPlace ) + 'f', [val] )
        ;
      except
        result := '(Error during floatToStr conversion)';
      end;
    end
  ;

  {*
    Converts the contents of val to a string rounded to rndToPlace digits
    using System localization decimal point formating

    @param val Numeric floating point value to be converted to string
    @param rndToPlace Number of desired significant didgits
    @param trunc Whether to truncate
    @return String representation of formatted Double
    or NAN_STRING if val is not valid numeric
    or INF_STRING or NEG_INF_STRING if val is an infinite number
    @comment Fix Me: This needs more detail, for example what exatly does truncate do - check with Aaron
  }
  function uiFloatToStr( const val: double; const rndToPlace: integer = 6; const trunc: boolean = true ): string;
    begin
      result := usFloatToStr( val, rndToPlace, trunc );

      if( ( NAN_STRING = result ) or ( INF_STRING = result ) or ( NEG_INF_STRING = result ) ) then
        result := tr( result )
      else if( '.' <> SysUtils.DecimalSeparator ) then
        result := ansiReplaceStr( result, '.', SysUtils.DecimalSeparator )
      ;
    end
  ;


  {*
    Converts val to a string, English formated decimal character

    @param val Numeric floating point value
    @return Numeric formatted as string using English notation
  }
  function csvFloatToStr( const val: double ): string;
    begin
      result := usFloatToStr( val );
      if( '.' <> csvDecPt ) then
        result := ansiReplaceStr( result, '.', csvDecPt )
      ;
    end
  ;

  {*
    Converts the contents of val to a string rounded to rndToPlace digits
    using English decimal point formating and padding with 0's if necessary

    @param val Numeric floating point value to be converted to string
    @param rndToPlace Number of desired significant didgits
    @param trunc Whether to truncate
    @return String representation of formatted Double
    or NAN_STRING if val is not valid numeric
    or INF_STRING or NEG_INF_STRING if val is an infinite number
    @comment Fix Me: This needs more detail, for example what exatly does truncate do - check with Aaron
  }
  function usFloatToStrZeroPadded( const val: double; const rndToPlace: integer; const trunc: boolean = true ): string;
    var
      decimalPart: string;
      i: integer;
    begin
      result := usFloatToStr( val, rndToPlace, trunc );
      if( ( NAN_STRING = result ) or ( INF_STRING = result ) or ( NEG_INF_STRING = result ) ) then
        // do nothing
      else
        begin
          // Fill trailing 0's out to the desired number of decimal places, if necessary.
          if( 0 = pos( '.', result ) ) then
            result := result + '.'
          ;
          decimalPart := rightStr( result, length( result ) - pos( '.', result ) );
          for i := length( decimalPart ) to rndToPlace - 1 do
            result := result + '0'
          ;
        end
      ;
    end
  ;

  {*
    Converts the contents of val to a string rounded to rndToPlace digits
    using System decimal point formating and padding with 0's if necessary

    @param val Numeric floating point value to be converted to string
    @param rndToPlace Number of desired significant didgits
    @param trunc Whether to truncate
    @return String representation of formatted Double
    or NAN_STRING if val is not valid numeric
    or INF_STRING or NEG_INF_STRING if val is an infinite number
    @comment Fix Me: This needs more detail, for example what exatly does truncate do - check with Aaron
  }
  function uiFloatToStrZeroPadded( const val: double; const rndToPlace: integer; const trunc: boolean = true ): string;
    begin
      result := usFloatToStrZeroPadded( val, rndToPlace, trunc );
      if( ( NAN_STRING = result ) or ( INF_STRING = result ) or ( NEG_INF_STRING = result ) ) then
        result := tr( result )
      else if( '.' <> SysUtils.DecimalSeparator ) then
        result := ansiReplaceStr( result, '.', SysUtils.DecimalSeparator )
      ;
    end
  ;


  {*
    Converts the contents of val to a string rounded to 6 digits
    using English decimal point formating

    @param val Numeric floating point value to be converted to string
    @return String representation of formatted Double
    or NAN_STRING if val is not valid numeric
    or INF_STRING or NEG_INF_STRING if val is an infinite number
  }
  function dbFloatToStr( const val: double ): string;
    begin
      result := usFloatToStr( val );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Bool conversions
//-----------------------------------------------------------------------------

  {*
    Evaluates val and returns True or False

    @param val An integer value
    @return Returns False if val is 0 else True
  }
  function intToBool( const val: integer ): boolean;
  	begin
    	if( val = 0 ) then
      	result := false
      else
      	result := true
      ;
    end
  ;


  {*
    Evaluates val and returns 0 or -1

    @param val A boolean, True or False
    @return Returns -1 if val is True else 0
  }
  function boolToInt( const val: boolean ): integer;
  	begin
   		if( val = true ) then
      	result := -1
      else
      	result := 0
      ;
    end
  ;

  {*
    Evaluates val and returns translated text for 'true' or 'false'

    @param val A boolean, True or False
    @return Returns translated text for  'true' if val is True else 'false'
  }
  function uiBoolToText( const val: boolean ): string;
    begin
      if( val ) then
        result := tr( 'true' )
      else
        result := tr( 'false' )
      ;
    end
  ;


  {*
    Evaluates val and returns text 'true' or 'false'

    @param val A boolean, True or False
    @return Returns 'true' if val is True else 'false'
    @comment Contrast to SysUtils.boolToStr(), which returns "-1" or "0", respectively.
  }
  function usBoolToText( const val: boolean ): string;
    begin
      if( val ) then
        result := 'true'
      else
        result := 'false'
      ;
    end
  ;


  {*
    Converts a string (e.g., "true" or "F") to a boolean.

    @param val The string to convert
    @return True or False
    @comment An exception is raised if "val" is not a recognized string.
  }
  function usTextToBool( val: string ): boolean;
    begin
      val := fixup( val );

      if
        ( 'true' = val )
      or
        ( 't' = val )
      or
        ( '1' = val )
      or
        ( '-1' = val )
      or
        ( 'yes' = val )
      or
        ( 'y' = val )
      then
        result := true
      else if
        ( 'false' = val )
      or
        ( 'f' = val )
      or
        ( '0' = val )
      or
        ( 'no' = val )
      or
        ( 'n' = val )
      then
        result := false
      else
        begin
          raise exception.Create( 'Unrecognized value "' + val + '" in usTextToBool()' );
          result := false;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Filename handling
//-----------------------------------------------------------------------------
  {*
    Returns the filename without any other path information.
    For example, shortFileName( 'c:\foo\bar.txt' ) is 'bar.txt'.
    Also, shortFileName( 'c:/foo/bar.txt' ) is 'bar.txt'.

    This function is tested by zzTestFileNameUtils().

    @param path Full file name (path and file name)
    @return A string containing the file name
    @comment It is tempting to use the Delphi function extractFileName() directly.
    Unfortunately, extractFileName() does not properly handle forward slashes.
  }
  function shortFileName( const path: TPathName ): TPathName;
  	var
      str2: string;
    begin
      // Replace forward slashes with back slashes
      str2 := path;
      //substrReplace( str2, '/', '\', true );
      str2 := StringReplace( str2, '/', '\', [rfReplaceAll] );

      result := extractFileName( str2 );
    end
  ;


  {*
    Returns a pathname without the filename extension.  For example,
    stripExtension( 'c:\foo\bar.txt' ) is 'c:\foo\bar'.

    This function is tested by zzTestFileNameUtils().

    @param path Full file name (path and file name)
    @return A string containing the file name w/o ext.
  }
  function stripExtension( const path: TPathName ): TPathName;
  	var
    	xs: integer;
      xstr, xstr1: string;
    begin

    	xs := 0;
      xstr1 := '';

      while( ( xstr1 <> '.' ) and ( xs <> length( path ) ) ) do
      	begin
        	xs := xs + 1;
          xstr := rightStr( path, xs );
          xstr1 := leftStr( xstr, 1 );
        end
      ;

      if( xs < length( path ) ) then
      	result := leftStr( path, length( path ) - xs )
      else
      	result := path
      ;
    end
  ;


  {*
    Returns just the directory path associated with a file.  For
    example, directory( '/home/foo/bar.txt' ) is '/home/foo/'.
    Note that the trailing slash is included.

    It is tempting to use the Delphi function extractFileDir() directly,
    but extractFileDir() does not properly handle forward slashes.

    This function is tested by zzTestFileNameUtils().

    @param path Full file name (path and file name)
    @return A string containing the directory path, but not the filename
    @comment Any forward slashes are replaced with back slashes
    and the directory name will be followed by a '\'
  }
	function directory( const path: TPathName ): TPathName;
  	var
    	str2: string;
    begin
      // Replace forward slashes with back slashes
      str2 := trim( path );
      str2 := StringReplace( str2, '/', '\', [rfReplaceAll] );
      
      result := extractFileDir( str2 );

      if( rightStr( result, 1 ) <> '\' ) then
        result := result + '\'
      ;
    end
  ;


  {*
    For a directory (with a trailing slash), returns the name of the parent directory.
    For a file, this is the same as directory().
    For example, C:\foo\bar.ex returns C:\foo\

    @param path Full file name (path and file name)
    @return A string containing the directory path, but not the filename
    @comment Any forward slashes are replaced with back slashes
    and the directory name will be followed by a '\'
  }
  function parentDirectory( const path: TPathName ): TPathName;
    var
      temp: string;
    begin
      temp := trim( path );
      if( ( '\' = rightStr( temp, 1 ) ) or ( '/' = rightStr( temp, 1 ) ) ) then
        temp := leftStr( temp, length( temp ) - 1 )
      ;

      result := directory( temp );
    end
  ;


  {*
    Returns the directory path of the current executable.
    Note that the trailing slash is included.

    @return Directory path of the current executable
  }
  function appPath(): TPathName;
  	begin
    	result := directory( Application.ExeName );
  	end
  ;


  {*
    Path is a long path to the file (for example, 'c:\Program Files\AAA\BBB\CCC\DDD\fff.txt').
    abbrevPath function returns a short path (for example, 'c:\Program Files\...\DDD\fff.txt')
    and Count parameter is a limit of this short path. Length of short path will be less
    than "Count" symbols.

    This function is adapted from the following web site:
    http://www.greatis.com/delphicb/tips/lib/filesdirectories-getshortpath.html

    @param path Full file name (path and file name)
    @param Count Limits how many subdirectories to remove from path
    @return A string containing and abbreviated path to the file
    @comment The method operates on backslashes, forward slashes are ignored
  }
  function abbrevPath( path: TPathName; Count: Integer = 40 ): string;
      // Inline helper to delete chunks of the string before consecutive '\'
      procedure Slashes(var Str: string; var Num: Integer);
        var
          Position, Index: Integer;
        begin
          Index:=0;
          repeat
            Position:=Pos('\', Str);
            Delete(Str,1,Position);
            if Position<>0 then Inc(Index);
            if (Index=Num)and(Num<>0) then break;
          until Position=0;
          Num:=Index;
        end
      ;

    var
      Num, NewNum, P: Integer;
      Str: string;
    begin
      Str:=Path;
      Num:=0;
      Slashes( string(Path), Num);
      while (Length(Str)>Count)and(Num>2) do
      begin
        NewNum:=Num div 2;
        Path:=Str;
        Slashes( string(Path), NewNum);
        P:=Pos(Path, Str);
        Delete(Str,P, Length(Path));
        NewNum:=2;
        Slashes( string(Path), NewNum);
        Str:=Str+'...\'+Path;
        Dec(Num);
      end;
      Result:=Str;
    end
  ;

  {*
    Validates whether path is an absolute path using the UNC convention

    @param path Full file name (path and file name)
    @return True if UNC convention followed, else false
  }
  function isAbsolutePath( path: TPathName ): boolean;
    begin
      path := trim( path );

      // See if the path is an absolute path using the UNC convention
      if( ( '\\' = leftStr( path, 2 ) ) or ( '//' = leftStr( path, 2 ) ) ) then
        result := true

      // See if the path matches a regular expression for a drive letter
      else if ExecRegExpr( '^[A-Za-z]:[\\/][A-Za-z1-9_.-]$', leftStr( path, 4 ) ) then
        result := true

      // Otherwise, it's not an absolute path
      else
        result := false
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// String formatting
//-----------------------------------------------------------------------------
  {*
  Strips leading and trailing whitespace
  }
  (*
  function RemoveWhites ( const str: WideString ): WideString;
    var
      i: integer;
    begin
      for i := 1 to Length (str) do
        if Ord(str[i]) >= 32 then
          Result := Result + str [i];
      Result := Trim (Result);
    end
  ;
  *)


  {*
    Appends bitToAppend to existing string val.  Note that val is passed by reference: its value will be updated.

    @param val The existing string to which the new bit will be appended
    @param bitToAppend The string to append to the existing string
  }
  procedure appendToString( var val: string; bitToAppend: string );
    begin
      val := val + bitToAppend + endl;
    end
  ;


  {*
    Strips val of leading and trailing whitespace and converts to lower case.

    @param val Input string
    @return Reformatted string
  }
  function fixUp( const val: string ) : string;
    var
    	str: string;
    begin
      str := trim( val );
      result := ansiLowerCase( str );
    end
  ;


  {*
    Breaks a long string into lines of roughly length prefLineLen.

    @param srcStr the string to break into multiple lines
    @param prefLineLen preferred length of each line
    @param usePunct break the string at punctuation marks
    @param forceBreak force line breaks at prefLineLen in case a very long word is encountered
    @return Reformatted string of substrings separated by carriage returns
  }
  function prettyPrint(
      const srcStr: string;
      prefLineLen: integer = 50;
      usePunct: boolean = true;
      forceBreak: boolean = true
    ): string;
  	var
    	srcLines, destLines: TCStringList;
      line: PChar;
    	tenPct: integer;
      str, str2: string;
      maxLen: integer;
  	begin
    	tenPct := round( prefLineLen / 10 );
      maxLen := prefLineLen + tenPct;

      //dbcout( srcStr, DBSHOWMSG );

    	// First, split the source string at specified line breaks.
      //---------------------------------------------------------
    	srcLines := TCStringList.create();
      srcLines.text := srcStr;

      //dbcout( 'LINES ' + intToStr( srcLines.count ), DBSHOWMSG );

      destLines := TCStringList.create();


      // Split each line again, as close to the preferred length as possible.
      //---------------------------------------------------------------------
      line := srcLines.first();
      while( line <> nil ) do
      	begin
        	str := line;

          repeat
            if( length( str ) <= maxLen ) then
            	begin
              	destLines.append( str );
                //dbcout( 'SHRTSTR: ' + str, DBSHOWMSG );
                str := '';
              end
            else
            	begin
                str2 := splitNear( prefLineLen, str, tenPct, usePunct, forceBreak );
                destLines.append( str2 );
                //dbcout( 'LOOPING: ' + str2, DBSHOWMSG );
                //showMessage( 'Waiting' );
            	end
            ;
          until( ( length( str ) <= maxLen ) or ( str2 = str ) );

          if( length( trim( str ) ) > 0 ) then
            begin
              destLines.append( trim( str ) );
              //dbcout( 'LAST ' + str, DBSHOWMSG );
            end
          ;

          line := srcLines.next();
        end
      ;


      // Assemble the final result from destLines.
      //------------------------------------------
      result := '';
      line := destLines.first();
      while( line <> nil ) do
      	begin
      		result := result + line + endl;
          line := destLines.next();
          //if( line <> nil ) then result := result + endl;
        end
      ;

      freeAndNil( srcLines );
      freeAndNil( destLines );
    end
  ;

  {*
    Helper function used by prettyPring.
    Removes a section of characters from str according to the input criteria,
    returning the removed substring

    @param pos Preferred line length
    @param str Input string to operate on
    @param maxLenAdd Length of Pos plus 10%
    @param usePunct Whether to split str on punctuation characters
    @param forceBreak Forces break when pso is reached
    @return Substring of str
  }
  function splitNear(
      pos: integer;
      var str: string;
      maxLenAdd: integer = 0;
      usePunct: boolean = true;
      forceBreak: boolean = true
    ): string;
  	var
    	i: integer;
      tmp: string;
      ch: char;
  	begin

    	tmp := trim( str );

      // Test 1: is the thing already short enough to return as it is?
    	if( length( tmp ) <= (pos+maxLenAdd) ) then
      	begin
        	result := tmp;
          str := '';
          exit;
        end
      ;

      //dbcout( 'TEST2', DBSHOWMSG );

      // Test 2: is there a suitable white space or punctuation mark for breaking the string?
    	for i := pos-1 downTo 1 do
      	begin
        ch := charAt( tmp, i );
        	if( isSpace( ch ) ) or ( isPunct( ch ) and usePunct ) then // split here!
          	begin
              result := trim( leftStr( tmp, i ) );
              str := trim( rightStr( tmp, length( tmp ) - i ) );
              //dbcout( 'RSULT: ' + result, DBSHOWMSG );
              //dbcout( 'STR: ' + str, DBSHOWMSG );
            	exit;
            end
          ;
        end
      ;

      //dbcout( '---TEST3', DBSHOWMSG );
      // If we get this far, the string is longer than the max
      // and contains no white spaces or suitable punctuation marks
      // before the requested position.

      // There are two options: if forceBreak,
      // Split it at the requested position and move on.

      // Otherwise, move FORWARD until the first suitable break location.

      if( forceBreak ) then
      	begin
          result := trim( leftStr( tmp, pos ) );
          //dbcout( 'Result is ' + result, DBSHOWMSG );
          str := trim( rightStr( tmp, length( tmp ) - pos ) );
          //dbcout( 'str is ' + str, DBSHOWMSG );
        end
      else // Move FORWARD until a suitable break location is found.
      	begin

        	for i := 0 to length(tmp)-1 do
          	begin
            	ch := charAt( tmp, i );
              if( isSpace( ch ) ) or ( isPunct( ch ) and usePunct ) then // split here!
                begin
              		result := trim( leftStr( tmp, i ) );
              		str := trim( rightStr( tmp, length( tmp ) - i ) );
                  exit;
                end
            end
          ;
          
        end
      ;

    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Substrings
//-----------------------------------------------------------------------------

  {*
    Returns the character is str at position pos

    @param str Input string
    @param pos Zero-based index value of position in str
    @return Character at position pos
    @comment Delphi string functions generally begin indexing from a
    starting position of 1. This function uses array style indexing where
    the first character index is assumed to be 0.
  }
  function charAt( const str: string; pos: integer ): char;
    begin
      result := str[pos+1];
    end
  ;


  {*
    Is the string empty?

    @param str Input string
    @Return true of the string has zero length, otherwise false
  }
  function strIsEmpty( const str: string ): boolean;
    begin
      result := ( 0 = length( str ) );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Changing case
//-----------------------------------------------------------------------------

  {*
    Returns the characters of str in lower case.
    The conversion uses the current locale

    @param str Input string
    @return The characters of str as lower case
  }
  function lower( const str: string ): string;
  	begin
   		result := ansiLowerCase( str );
    end
  ;


  {*
    Returns the characters of str in upper case.
    The conversion uses the current locale

    @param str Input string
    @return The characters of str as upper case
  }
  function upper( const str: string ): string;
    begin
   		result := ansiUpperCase( str );
    end
  ;


  {*
    Trims white space from str and capitalizes the first character

    @param str Input string
    @return Reformated string
  }
  function capitalize( const str: string ): string;
  	var
    	s1, s2: string;
  	begin
    	s1 := fixup( str );
      s2 := ansiUpperCase( leftStr( s1, 1 ) );
      s1 := rightStr( s1, length(s1) - 1 );

      result := s2 + s1;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Substring replacement
//-----------------------------------------------------------------------------
  {
    Extensively modified from http://www.greatis.com/delphicb/tips/lib/algorithms-replacestr.html

    FIX ME: this function will recurse infinitely if the new substring contains the old substring.
  }
  (*
  function substrReplace( var str: string; const subStrOld, substrNew: string; replaceAll: boolean = false ): boolean;
    var
      Position: Integer;
    begin
      Position := Pos( subStrOld, str );
      result := not( 0 = position );

      if( result ) then
        begin
          Delete( str, Position, Length( subStrOld ) );
          Insert( substrNew, str, Position );
        end
      ;

      if( replaceAll and result ) then
        substrReplace( str, substrOld, substrNew, replaceAll )
      ;
    end
  ;
  *)
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Number formatting
//-----------------------------------------------------------------------------

  {*
    Creates a padded string representing a fixed length integer
    Appends padChar to toPad so that the result string length is places long.

    @param toPadd Integer value
    @param places
    @param padChar
    @return Padded string containing toPad
    @throws Raises an exception if places is greated than the allowed length of str
  }
  function paddedInt( toPad: integer; places: integer; padChar: string = '0' ): string;
  	var
    	str: string;
      i: integer;
  	begin
  		str := intToStr( toPad );

      //dbcout( 'Intial string: ' + str + ' add this many zeroes' + intToStr( places - length( str ) ), DBSHOWMSG );

      if( length( str ) > places ) then
        raise exception.create( 'Cannot pad this number' )
      ;

      if( length( str ) = places ) then
      	result := str
      else
      	begin
          for i := 1 to places - length( str ) do
            begin
              str := padChar + str;
            end
          ;
          result := str;
        end
      ;

    end
  ;


  {*
    Returns the position of the first non-zero numeric character, from either
    the beginning or the ending of the string

    @param str String representation of a numeric value
    @param fromEnd  Whether to start search from the beginning or end of the string
    @return First numeric character
    @comment Negative signed numerics and decimal points are ignored
    @comment The index position returned is zero-based from the beginning of str
    @throws Helper function raises an exception if str has non-numeric related characters
  }
  function firstNonZeroChar( const str: string; const fromEnd: boolean = false ): integer;
    var
      i: integer;
      ch: char;
      str2: string;
    begin
      result := -1;
      str2 := fixup( str );

      if( not( fromEnd ) ) then
      	begin
          // Look for the first non-zero character from the beginning
          for i := 0 to length( str2 ) - 1 do
            begin
              ch := charAt( str2, i );

              if( isNonZeroNumChar( ch ) ) then
                begin
                  result := i;
                  break;
                end
              ;

            end
          ;
        end
      else
      	begin
          // Look for the first non-zero character from the end
          for i := length( str2 ) - 1 downto 0 do
            begin
              ch := charAt( str2, i );

              if( isNonZeroNumChar( ch ) ) then
                begin
                  result := i;
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
    Helper method to function firstNonZeroChar

    @param ch Input character - note type is char not string
    @return True if char is 0 - 9, false for 0, -, .
    @throws Raises exception if ch is any other type of character
  }
  function isNonZeroNumChar( const ch: char ): boolean;
    var
      o: integer;
    begin
      o := ord( ch );

      if( (o < 45) or(o > 57) or(o = 47) ) then
        begin
        	//dbcout( 'ch is ' + ch, DBSHOWMSG );
          raise exception.create( 'Not a valid num char in isNonZeroNumChar' );
          result := false;
          exit;
        end
      ;

      if( o = 48 ) or ( o = 45 ) or ( o = 46 ) then // zeroes, minus signs, and decimal points don't count
        result := false
      else
        result := true
      ;

    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Determining character type
//-----------------------------------------------------------------------------
  (*
  White space means any character for which QChar::isSpace() returns TRUE.
  This includes ASCII characters 9 (TAB), 10 (LF), 11 (VT), 12 (FF), 13 (CR),
  and 32 (Space).

    bool QChar::isSpace() const {
      if( !row() )
        if( cell() >=9 && cell() <=13 ) return TRUE;
      Category c = category();
      return c >= Separator_Space && c <= Separator_Paragraph;'
    }

  *)


  {*
    Determines whether ch is white space or a control chracter

    @param ch Input character
    @return True if ch is white space or special character, else false
  }
  function isSpace( const ch: char ): boolean;
  	begin
   		if( ord( ch ) <=32 ) then
      	result := true
      else
      	result := false
      ;
    end
  ;


  {*
    Determines whether ch is a punctuation chracter

    @param ch Input character
    @return True if ch is a punctuation character, else false
    @comment Basically includes all characters except 0-9, a-z, A-Z
  }
  function isPunct( const ch: char ): boolean;
  	var
    	c: integer;
  	begin
    	c := ord( ch );

      if( ( c >= 33 ) and ( c <= 47 ) ) 		// ! through /
      	or( ( c >= 58 ) and ( c <= 64 ) )   // : through @
        or( ( c >=91 ) and ( c <= 96 ) ) 		// [ through `
        or( c >= 123 ) 												// { and higher
      	then
        	result := true
      else
      	result := false
      ;
    end
  ;

  {*
    Determines whether ch is in set 0,1,2,3,4,5,6,7,8,9

    @param ch Input character
    @return True if ch is a digit, else false
  }
	function isDigit( const ch: char ): boolean;
  	var
    	c: integer;
    begin
    	c := ord( ch );

      if( ( c < 48 ) or ( c > 57 ) ) then
      	result := false
      else
      	result := true
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// XML/HTML encoding/decoding
//-----------------------------------------------------------------------------

  {*
    Replaces a character reserved in XML with appropriate phrase

    @param s Input string
    @return String s encoded for XML
    @comment The five characters & " ' < > are addressed
  }
  function encodeXml( const s: string; const allowQuotesAndCommas: boolean = false ): string;
    begin
      Result := s;

      Result := StringReplace( Result, '&', '&amp;' ,[rfReplaceAll] );
      Result := StringReplace( Result, '<', '&lt;', [rfReplaceAll] );
      Result := StringReplace( Result, '>', '&gt;', [rfReplaceAll] );

      if( allowQuotesAndCommas ) then
        begin
          Result := StringReplace( Result, '"', '&quot;', [rfReplaceAll] );
          Result := StringReplace( Result, '''', '&apos;', [rfReplaceAll] );

          Result := StringReplace( Result, #13, '&#x000D;', [rfReplaceAll] );
          Result := StringReplace( Result, #10, '&#x000A;', [rfReplaceAll] );
        end
      else
        begin
          Result := StringReplace( Result, '"', '', [rfReplaceAll] );
          Result := StringReplace( Result, '''', '', [rfReplaceAll] );
          Result := StringReplace( Result, ',', '', [rfReplaceAll] );

          Result := StringReplace( Result, #13, '', [rfReplaceAll] );
          Result := StringReplace( Result, #10, '', [rfReplaceAll] );
        end
      ;

      // According to some sources:
      (*
      Others may be encoded as

      &#value;
      Syntax used for decimal references.
      &#xvalue;
      Syntax used for hexadecimal references.
      *)
    end
  ;

  {*
    Replaces XML phrase with a character:  & " ' < >

    @param s Input An XML encoded string
    @return String with XML phrases replaced
  }
  function decodeXml( const s: string ): string;
    begin
      Result := s;

      Result := StringReplace(Result,'&quot;','"',[rfReplaceAll]);
      Result := StringReplace(Result, '&apos;','''',[rfReplaceAll]);
      Result := StringReplace(Result,'&amp;','&',[rfReplaceAll]);
      Result := StringReplace(Result,'&lt;','<',[rfReplaceAll]);
      Result := StringReplace(Result,'&gt;','>',[rfReplaceAll]);

      Result := StringReplace( Result, '&#x000D;', #13, [rfReplaceAll] );
      Result := StringReplace( Result, '&#x000A;', #10, [rfReplaceAll] );

      // See comment above.
    end
  ;


  {*
    Replaces character reserved in HTML with appropriate HTML phrase

    @param s Input string
    @return String s encoded for HTML
  }
  function encodeHtml( const s: string ): string;
    begin
      result := encodeXml( s );

      //Result := StringReplace(Result,' ','&nbsp;',[rfReplaceAll]);
      Result := StringReplace(Result,'¡','&iexcl;',[rfReplaceAll]);
      Result := StringReplace(Result,'¢','&cent;',[rfReplaceAll]);
      Result := StringReplace(Result,'£','&pound;',[rfReplaceAll]);
      Result := StringReplace(Result,'¤','&curren;',[rfReplaceAll]);
      Result := StringReplace(Result,'¥','&yen;',[rfReplaceAll]);
      Result := StringReplace(Result,'¦','&brvbar;',[rfReplaceAll]);
      Result := StringReplace(Result,'§','&sect;',[rfReplaceAll]);
      Result := StringReplace(Result,'¨','&uml;',[rfReplaceAll]);
      Result := StringReplace(Result,'©','&copy;',[rfReplaceAll]);
      Result := StringReplace(Result,'ª','&ordf;',[rfReplaceAll]);
      Result := StringReplace(Result,'"','&laquo;',[rfReplaceAll]);
      Result := StringReplace(Result,'¬','&not;',[rfReplaceAll]);
      Result := StringReplace(Result,'­','&shy;',[rfReplaceAll]);
      Result := StringReplace(Result,'®','&reg;',[rfReplaceAll]);
      Result := StringReplace(Result,'¯','&macr;',[rfReplaceAll]);
      Result := StringReplace(Result,'°','&deg;',[rfReplaceAll]);
      Result := StringReplace(Result,'±','&plusmn;',[rfReplaceAll]);
      Result := StringReplace(Result,'²','&sup2;',[rfReplaceAll]);
      Result := StringReplace(Result,'³','&sup3;',[rfReplaceAll]);
      Result := StringReplace(Result,'´','&acute;',[rfReplaceAll]);
      Result := StringReplace(Result,'µ','&micro;',[rfReplaceAll]);
      Result := StringReplace(Result,'','&para;',[rfReplaceAll]);
      Result := StringReplace(Result,'·','&middot;',[rfReplaceAll]);
      Result := StringReplace(Result,'¸','&cedil;',[rfReplaceAll]);
      Result := StringReplace(Result,'¹','&sup1;',[rfReplaceAll]);
      Result := StringReplace(Result,'º','&ordm;',[rfReplaceAll]);
      Result := StringReplace(Result,'"','&raquo;',[rfReplaceAll]);
      Result := StringReplace(Result,'¼','&frac14;',[rfReplaceAll]);
      Result := StringReplace(Result,'½','&frac12;',[rfReplaceAll]);
      Result := StringReplace(Result,'¾','&frac34;',[rfReplaceAll]);
      Result := StringReplace(Result,'¿','&iquest;',[rfReplaceAll]);
      Result := StringReplace(Result,'À','&Agrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'Á','&Aacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Â','&Acirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ã','&Atilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ä','&Auml;',[rfReplaceAll]);
      Result := StringReplace(Result,'Å','&Aring;',[rfReplaceAll]);
      Result := StringReplace(Result,'Æ','&AElig;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ç','&Ccedil;',[rfReplaceAll]);
      Result := StringReplace(Result,'È','&Egrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'É','&Eacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ê','&Ecirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ë','&Euml;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ì','&Igrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'Í','&Iacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Î','&Icirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ï','&Iuml;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ð','&ETH;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ñ','&Ntilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ò','&Ograve;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ó','&Oacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ô','&Ocirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'Õ','&Otilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ö','&Ouml;',[rfReplaceAll]);
      Result := StringReplace(Result,'×','&times;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ø','&Oslash;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ù','&Ugrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ú','&Uacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Û','&Ucirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ü','&Uuml;',[rfReplaceAll]);
      Result := StringReplace(Result,'Ý','&Yacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'Þ','&THORN;',[rfReplaceAll]);
      Result := StringReplace(Result,'ß','&szlig;',[rfReplaceAll]);
      Result := StringReplace(Result,'à','&agrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'á','&aacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'â','&acirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'ã','&atilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'ä','&auml;',[rfReplaceAll]);
      Result := StringReplace(Result,'å','&aring;',[rfReplaceAll]);
      Result := StringReplace(Result,'æ','&aelig;',[rfReplaceAll]);
      Result := StringReplace(Result,'ç','&ccedil;',[rfReplaceAll]);
      Result := StringReplace(Result,'è','&egrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'é','&eacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'ê','&ecirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'ë','&euml;',[rfReplaceAll]);
      Result := StringReplace(Result,'ì','&igrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'í','&iacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'î','&icirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'ï','&iuml;',[rfReplaceAll]);
      Result := StringReplace(Result,'ð','&eth;',[rfReplaceAll]);
      Result := StringReplace(Result,'ñ','&ntilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'ò','&ograve;',[rfReplaceAll]);
      Result := StringReplace(Result,'ó','&oacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'ô','&ocirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'õ','&otilde;',[rfReplaceAll]);
      Result := StringReplace(Result,'ö','&ouml;',[rfReplaceAll]);
      Result := StringReplace(Result,'÷','&divide;',[rfReplaceAll]);
      Result := StringReplace(Result,'ø','&oslash;',[rfReplaceAll]);
      Result := StringReplace(Result,'ù','&ugrave;',[rfReplaceAll]);
      Result := StringReplace(Result,'ú','&uacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'û','&ucirc;',[rfReplaceAll]);
      Result := StringReplace(Result,'ü','&uuml;',[rfReplaceAll]);
      Result := StringReplace(Result,'ý','&yacute;',[rfReplaceAll]);
      Result := StringReplace(Result,'þ','&thorn;',[rfReplaceAll]);
      Result := StringReplace(Result,'ÿ','&yuml;',[rfReplaceAll]);
    end
  ;


  {*
    Replaces HTML phrases with appropriate ASCII character

    @param s Input string
    @return String s decoded from HTML
  }
  function decodeHtml( const s: string ): string;
    begin
      Result := decodeXml( s );

      Result := StringReplace(Result,'&nbsp;',' ',[rfReplaceAll]); // (space)
      Result := StringReplace(Result,'&iexcl;','¡',[rfReplaceAll]); // ¡
      Result := StringReplace(Result,'&cent;','¢',[rfReplaceAll]); // ¢
      Result := StringReplace(Result,'&pound;','£',[rfReplaceAll]); // £
      Result := StringReplace(Result,'&curren;','¤',[rfReplaceAll]); // ¤
      Result := StringReplace(Result,'&yen;','¥',[rfReplaceAll]); // ¥
      Result := StringReplace(Result,'&brvbar;','¦',[rfReplaceAll]); // ¦
      Result := StringReplace(Result,'&sect;','§',[rfReplaceAll]); // §
      Result := StringReplace(Result,'&uml;','¨',[rfReplaceAll]); // ¨
      Result := StringReplace(Result,'&copy;','©',[rfReplaceAll]); // ©
      Result := StringReplace(Result,'&ordf;','ª',[rfReplaceAll]); // ª
      Result := StringReplace(Result,'&laquo;','«',[rfReplaceAll]); // «
      Result := StringReplace(Result,'&not;','',[rfReplaceAll]); //
      Result := StringReplace(Result,'&shy;','',[rfReplaceAll]); // 
      Result := StringReplace(Result,'&reg;','®',[rfReplaceAll]); // ®
      Result := StringReplace(Result,'&macr;','¯',[rfReplaceAll]); // ¯
      Result := StringReplace(Result,'&deg;','°',[rfReplaceAll]); // °
      Result := StringReplace(Result,'&plusmn;','±',[rfReplaceAll]); // ±
      Result := StringReplace(Result,'&sup2;','²',[rfReplaceAll]); // ²
      Result := StringReplace(Result,'&sup3;','³',[rfReplaceAll]); // ³
      Result := StringReplace(Result,'&acute;','´',[rfReplaceAll]); // ´
      Result := StringReplace(Result,'&micro;','µ',[rfReplaceAll]); // µ
      Result := StringReplace(Result,'&para;','',[rfReplaceAll]); // 
      Result := StringReplace(Result,'&middot;','•',[rfReplaceAll]); // •
      Result := StringReplace(Result,'&cedil;','¸',[rfReplaceAll]); // ¸
      Result := StringReplace(Result,'&sup1;','¹',[rfReplaceAll]); // ¹
      Result := StringReplace(Result,'&ordm;','º',[rfReplaceAll]); // º
      Result := StringReplace(Result,'&raquo;','»',[rfReplaceAll]); // »
      Result := StringReplace(Result,'&frac14;','¼',[rfReplaceAll]); // ¼
      Result := StringReplace(Result,'&frac12;','½',[rfReplaceAll]); // ½
      Result := StringReplace(Result,'&frac34;','¾',[rfReplaceAll]); // ¾
      Result := StringReplace(Result,'&iquest;','¿',[rfReplaceAll]); // ¿
      Result := StringReplace(Result,'&Agrave;','À',[rfReplaceAll]); // À
      Result := StringReplace(Result,'&Aacute;','Á',[rfReplaceAll]); // Á
      Result := StringReplace(Result,'&Acirc;','Â',[rfReplaceAll]); // Â
      Result := StringReplace(Result,'&Atilde;','Ã',[rfReplaceAll]); // Ã
      Result := StringReplace(Result,'&Auml;','Ä',[rfReplaceAll]); // Ä
      Result := StringReplace(Result,'&Aring;','Å',[rfReplaceAll]); // Å
      Result := StringReplace(Result,'&AElig;','Æ',[rfReplaceAll]); // Æ
      Result := StringReplace(Result,'&Ccedil;','Ç',[rfReplaceAll]); // Ç
      Result := StringReplace(Result,'&Egrave;','È',[rfReplaceAll]); // È
      Result := StringReplace(Result,'&Eacute;','É',[rfReplaceAll]); // É
      Result := StringReplace(Result,'&Ecirc;','Ê',[rfReplaceAll]); // Ê
      Result := StringReplace(Result,'&Euml;','Ë',[rfReplaceAll]); // Ë
      Result := StringReplace(Result,'&Igrave;','Ì',[rfReplaceAll]); // Ì
      Result := StringReplace(Result,'&Iacute;','Í',[rfReplaceAll]); // Í
      Result := StringReplace(Result,'&Icirc;','Î',[rfReplaceAll]); // Î
      Result := StringReplace(Result,'&Iuml;','Ï',[rfReplaceAll]); // Ï
      Result := StringReplace(Result,'&ETH;','Ð',[rfReplaceAll]); // Ð
      Result := StringReplace(Result,'&Ntilde;','Ñ',[rfReplaceAll]); // Ñ
      Result := StringReplace(Result,'&Ograve;','Ò',[rfReplaceAll]); // Ò
      Result := StringReplace(Result,'&Oacute;','Ó',[rfReplaceAll]); // Ó
      Result := StringReplace(Result,'&Ocirc;','Ô',[rfReplaceAll]); // Ô
      Result := StringReplace(Result,'&Otilde;','Õ',[rfReplaceAll]); // Õ
      Result := StringReplace(Result,'&Ouml;','Ö',[rfReplaceAll]); // Ö
      Result := StringReplace(Result,'&times;','×',[rfReplaceAll]); // ×
      Result := StringReplace(Result,'&Oslash;','Ø',[rfReplaceAll]); // Ø
      Result := StringReplace(Result,'&Ugrave;','Ù',[rfReplaceAll]); // Ù
      Result := StringReplace(Result,'&Uacute;','Ú',[rfReplaceAll]); // Ú
      Result := StringReplace(Result,'&Ucirc;','Û',[rfReplaceAll]); // Û
      Result := StringReplace(Result,'&Uuml;','Ü',[rfReplaceAll]); // Ü
      Result := StringReplace(Result,'&Yacute;','Ý',[rfReplaceAll]); // Ý
      Result := StringReplace(Result,'&THORN;','Þ',[rfReplaceAll]); // Þ
      Result := StringReplace(Result,'&szlig;','ß',[rfReplaceAll]); // ß
      Result := StringReplace(Result,'&agrave;','à',[rfReplaceAll]); // à
      Result := StringReplace(Result,'&aacute;','á',[rfReplaceAll]); // á
      Result := StringReplace(Result,'&acirc;','â',[rfReplaceAll]); // â
      Result := StringReplace(Result,'&atilde;','ã',[rfReplaceAll]); // ã
      Result := StringReplace(Result,'&auml;','ä',[rfReplaceAll]); // ä
      Result := StringReplace(Result,'&aring;','å',[rfReplaceAll]); // å
      Result := StringReplace(Result,'&aelig;','æ',[rfReplaceAll]); // æ
      Result := StringReplace(Result,'&ccedil;','ç',[rfReplaceAll]); // ç
      Result := StringReplace(Result,'&egrave;','è',[rfReplaceAll]); // è
      Result := StringReplace(Result,'&eacute;','é',[rfReplaceAll]); // é
      Result := StringReplace(Result,'&ecirc;','ê',[rfReplaceAll]); // ê
      Result := StringReplace(Result,'&euml;','ë',[rfReplaceAll]); // ë
      Result := StringReplace(Result,'&igrave;','ì',[rfReplaceAll]); // ì
      Result := StringReplace(Result,'&iacute;','í',[rfReplaceAll]); // í
      Result := StringReplace(Result,'&icirc;','î',[rfReplaceAll]); // î
      Result := StringReplace(Result,'&iuml;','ï',[rfReplaceAll]); // ï
      Result := StringReplace(Result,'&eth;','ð',[rfReplaceAll]); // ð
      Result := StringReplace(Result,'&ntilde;','ñ',[rfReplaceAll]); // ñ
      Result := StringReplace(Result,'&ograve;','ò',[rfReplaceAll]); // ò
      Result := StringReplace(Result,'&oacute;','ó',[rfReplaceAll]); // ó
      Result := StringReplace(Result,'&ocirc;','ô',[rfReplaceAll]); // ô
      Result := StringReplace(Result,'&otilde;','õ',[rfReplaceAll]); // õ
      Result := StringReplace(Result,'&ouml;','ö',[rfReplaceAll]); // ö
      Result := StringReplace(Result,'&divide;','÷',[rfReplaceAll]); // ÷
      Result := StringReplace(Result,'&oslash;','ø',[rfReplaceAll]); // ø
      Result := StringReplace(Result,'&ugrave;','ù',[rfReplaceAll]); // ù
      Result := StringReplace(Result,'&uacute;','ú',[rfReplaceAll]); // ú
      Result := StringReplace(Result,'&ucirc;','û',[rfReplaceAll]); // û
      Result := StringReplace(Result,'&uuml;','ü',[rfReplaceAll]); // ü
      Result := StringReplace(Result,'&yacute;','ý',[rfReplaceAll]); // ý
      Result := StringReplace(Result,'&thorn;','þ',[rfReplaceAll]); // þ
      Result := StringReplace(Result,'&yuml;','ÿ',[rfReplaceAll]); // ÿ
    end
  ;

  
  {*
    Removes XML file headers (e.g. "<?xml version="1.0"...>") from the input string.

    @param s Input string
    @return String s without any XML headers
  }
  function stripXmlHeaders( const s: string ): string;
    var
      list: TCStringList;
      i: integer;
      str: string;
    begin
      result := '';

      list := TCStringList.create( s, '>', true );

      for i := 0 to list.Count - 1 do
        begin
          str := list.at(i);
          if( '<?xml' = leftStr( str, 5 ) ) then
            // Do nothing: this is a line to skip
          else
            result := result + str
          ;
        end
      ;

      list.Free();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// CSV formatting
//-----------------------------------------------------------------------------

  {*
    Replaces single quotes " with double quotes "" and wraps s in double quotes

    @param s Input string
    @return  Reformattted string
  }
  function csvQuote( const s: string ): string;
    begin
      result := stringReplace( s, '"', '""', [rfReplaceAll] );
      result := '"' + result + '"';
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// RC4 encryption/decryption
//-----------------------------------------------------------------------------
  {*
    Returns an encrypted string that will require password to decipher

    @param str Information to encrypt
    @param password Encryption key
    @return Cipher text
    @throws Raises exception if the library genprps.dll is not loaded
  }
  function rc4Encrypt( const str, password: string ): string;
    begin
      if( nil = @_rc4Encrypt ) then
        begin
          raise exception.create( 'DLL not loaded: function rc4Encrypt() cannot be called.' );
          result := '';
        end
      else
        result := string( _rc4Encrypt( pchar( str ), pchar( password ) ) )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Hex encoding/decoding
//-----------------------------------------------------------------------------

  {*
    Hex encoding for URLs or other uses

    @param str Text to be hex encoded
    @return Hex encoded str
    @throws Raises exception if the library genprps.dll is not loaded
  }
  function hexEncode( str: string ): string;
    begin
      if( nil = @_hexEncode ) then
        begin
          raise exception.create( 'DLL not loaded: function hexEncode() cannot be called.' );
          result := '';
        end
      else
        result := string( _hexEncode( pchar( str ) ) )
      ;
    end
  ;


  {*
    Hex decoding of str

    @param str Hex encoded text
    @return Decoded contents of str
    @throws Raises exception if the library genprps.dll is not loaded
  }
  function hexDecode( str: string ): string;
    begin
      if( nil = @_hexDecode ) then
        begin
          raise exception.create( 'DLL not loaded: function hexDecode() cannot be called.' );
          result := '';
        end
      else
        result := string( _hexDecode( pchar( str ) ) )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Working with string and character pointers
//-----------------------------------------------------------------------------
  procedure appendToPstring( pstr: pstring; str: string );
    begin
      if( nil <> pstr ) then
        pstr^ := pstr^ + str + endl
      ;
    end
  ;


  procedure prependToPstring( pstr: pstring; str: string );
    begin
      if( nil <> pstr ) then
        pstr^ :=  str + endl + pstr^
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Unit testing code
//-----------------------------------------------------------------------------
  {*
    Tests substrReplace()
  }
  (*
  procedure zzTestsubstrReplace();
    var
      str: string;
    begin
      dbtest( endl + '*** MyStrUtils.zzTestsubstrReplace...' );

      str := 'ReplaceOneOne';
      substrReplace( str, 'One', 'Two', false );
      dbtest( str );
      if( 'ReplaceTwoOne' <> str ) then
        raise exception.Create( 'MyStrUtils.zzTestsubstrReplace failed' )
      ;

      str := 'ReplaceOneOne';
      substrReplace( str, 'One', 'Two', true );
      dbtest( str );
      if( 'ReplaceTwoTwo' <> str ) then
        raise exception.Create( 'MyStrUtils.zzTestsubstrReplace failed' )
      ;

      str := 'c:/temp/foo.txt';
      subStrReplace( str, '/', '\', true );
      dbtest( str );
      if( 'c:\temp\foo.txt' <> str ) then
        raise exception.Create( 'MyStrUtils.zzTestsubstrReplace failed' )
      ;

      str := 'c:\temp\file.txt';
      substrReplace( str, '/', '\', true );
      dbtest( str );
      if( 'c:\temp\file.txt' <> str ) then
        raise exception.Create( 'MyStrUtils.zzTestsubstrReplace failed' )
      ;

      dbtest( '*** Done.' + endl );
    end
  ;
  *)

  {*
    Tests firstNonZeroChar()
  }
  procedure zzTestfirstNonZeroChar();
    var
      d: string;
    begin
      dbtest( endl + '*** MyStrUtils.zzTestfirstNonZeroChar...' );


      d := '-1.00';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 1 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '-1.001';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 1 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '100';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 0 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '4';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 0 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '0.004';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 4 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '0.0400';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 3 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '1.0044';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 0 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '-1.004400';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 1 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '0.00555000';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 4 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      d := '0.05';
      dbtest( '%s has nonzero at position %d.', [d, firstNonZeroChar( d )] );
      if( 3 <> firstNonZeroChar( d ) ) then
        raise exception.Create( 'myStrUtils.zzTestfirstNonZeroChar failed' )
      ;

      dbtest( '*** Done.' + endl );
    end
  ;

  {*
    Tests several filename handling functions, including
    shortFileName(), stripExtension(), and directory()
  }
  procedure zzTestFileNameUtils();
    var
      str: string;
    begin
      dbtest( '*** MyStrutils.zzTestFileNameUtils...' + endl );

      // ShortFileName
      //--------------
      dbtest( shortFileName( 'c:\temp\file.txt' ) );
      if( 'file.txt' <> shortFileName( 'c:\temp\file.txt' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      dbtest( shortFileName( 'c:/temp/file.txt' ) );
      if( 'file.txt' <> shortFileName( 'c:/temp/file.txt' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      dbtest( shortFileName( 'file.txt' ) );
      if( 'file.txt' <> shortFileName( 'file.txt' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      // stripExtension
      //---------------
      dbtest( stripExtension( 'file.txt' ) );
      if( 'file' <> stripExtension( 'file.txt' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      dbtest( stripExtension( 'file.t' ) );
      if( 'file' <> stripExtension( 'file.t' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      dbtest( stripExtension( 'file' ) );
      if( 'file' <> stripExtension( 'file' ) ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      // directory
      //----------
      str := directory( 'c:\temp\file.txt' );
      dbtest( str );
      if( 'c:\temp\' <> str ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      str := directory( 'c:/temp/file.txt' );
      dbtest( str );
      if( 'c:\temp\' <> str ) then
        raise exception.Create( 'myStrUtils.zzTestFileNameUtils failed' )
      ;

      dbtest( '*** Done.' + endl );
    end
  ;

  /// Calls unit test zzTestFirstNonZeroChar() and zzTestFileNameUtils()
  procedure selfTest();
    begin
      //zzTestsubstrReplace();
      zzTestFirstNonZeroChar();
      zzTestFileNameUtils();
    end
  ;
//-----------------------------------------------------------------------------


//*****************************************************************************
// DLL Loading
//*****************************************************************************

  {*
    Wrapper around unit variable holding error messages generated in loadAtrConfDLL()
    @return Error messages from attempting to load genprps.dll
  }
  function myStrUtilsDllLoadErrors(): string;
    begin
      result := dllLoadErrors;
    end
  ;

  // Dynamic loading takes more code than static loading,
  // but it is far more graceful when it doesn't work.

  {*
     Loads genprps.dll and checks for several function names

     @comment The unit variable atrconfLoaded can be checked to see if the
     dll loaded and all checks were successful. If atrconfLoaded returns false
     then check myStrUtilsDllLoadErrors for specifics about what went wrong.
  }
  procedure loadAtrConfDLL();
     var
      success: boolean;
      dllHandle: THandle; //Handle used to open the DLL.  Defined in unit Windows.
      setDebugFn: procedure( fn: TCFnVoid_1_CharP ); cdecl;
    begin
      // Initialize global variables and pointers
      //-----------------------------------------
      atrconfLoaded := false; // will be set to true if all functions are properly loaded.
      dllLoadErrors := ''; // messages will be added if there are problems
      @_hexEncode := nil;
      @_hexDecode := nil;
      @_rc4Encrypt := nil;
      @setDebugFn := nil;

      // Load the DLL
      //-------------
      try
        dllHandle := loadLibrary( 'genprps.dll' );
        success := true;
      except
        dllHandle := 0;
        success := false;
        dllLoadErrors := dllLoadErrors + 'loadLibrary genprps.dll failed.';
      end;

      if( success ) then
        begin
          _rc4Encrypt := GetProcAddress( dllHandle, 'rc4Encrypt' );
          if( nil = @_rc4Encrypt ) then
            begin
              dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION: rc4Encrypt.';
              success := false;
            end
          ;
          _hexEncode := GetProcAddress( dllHandle, 'hexEncode' );
          if( nil = @_hexEncode ) then
            begin
              dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION: hexEncode.';
              success := false;
            end
          ;
          _hexDecode := GetProcAddress( dllHandle, 'hexDecode' );
          if( nil = @_hexDecode ) then
            begin
              dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION: hexDecode.';
              success := false;
            end
          ;

          setDebugFn := GetProcAddress( dllHandle, 'setDebugFn' );
          if( nil <> @setDebugFn ) then
          	begin
              if( DBSHOWMSG ) then
          		  setDebugFn( @cdbcout )
              else
                setDebugFn( nil )
              ;
            end
          else
          	begin
          		dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION setDebugFn';
              success := false;
            end
          ;
        end
      ;

      atrconfLoaded := success;
    end
  ;
//*****************************************************************************


initialization

  loadAtrConfDLL();
  getLocaleFormatSettings( 1033, _usFormatSettings );
  
end.
