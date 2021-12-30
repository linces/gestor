{*
CStringList.pas  - For manipulating and formating the output of CstringLists
----------------
Begin: 2005/01/19
Last revision: $Date: 2011-10-19 01:10:09 $ $Author: areeves $
Version number: $Revision: 1.25 $
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

unit CStringList;

interface

uses
	Classes,
  Variants
;

type
  /// Class for manipulating and formating the output of CStringLists
  TCStringList = class( TStringList )

  protected
    _currentPos: integer; /// index of current position in the list

    function getIsEmpty(): boolean;

  public
    constructor create( str: string; delimiter: char; includeDelimiter: boolean = false ); overload;
    constructor create( src: TCStringList ); overload;

    // destructor destroy(); // use inherited destructor

    //procedure append( val: pchar ); overload; virtual; // use inherited
    //procedure append( val: string ); overload; virtual; // use inherited
    procedure prepend( val: pchar ); overload; // FIX ME: Write this function
    procedure prepend( val: string ); overload; // FIX ME: Write this function

    function first(): pchar;
    function last(): pchar;
    function next(): pchar;
    function prev(): pchar;
    function current(): pchar;

    function at( i: integer ): pchar;

    function remove(): boolean;
    // procedure clear(); // use inherited method

    procedure replaceWith( val: pchar ); overload;
    procedure replaceWith( val: string ); overload;

    procedure debug( useExtraLineFeed: boolean = false );

    property isEmpty: boolean read getIsEmpty;
    // property count // use inherited property

    // FIX ME: This function won't handle delimiters inside quotes!
    procedure explode( str: string; delimiter: char; includeDelimiter: boolean = false );

    function delimitedString( delimiter: string ): string;

  end
;


type
  /// An array of pointers to AnsiChar values used to manipulate null-terminated strings
  TCStringArray = array of PAnsiChar;


implementation

	uses
    SysUtils,
    StrUtils,
    
    DebugWindow,
    MyStrUtils
  ;


  {*
    Creates an instance of CStringList and fills it from str

    @param str String containing the item(s) to be added to the list
    @param delimiter Character serving as the substring delimiter
    @param includeDelimiter Whether to include the delimiter with the list item
  }
	constructor TCStringList.create( str: string; delimiter: char; includeDelimiter: boolean = false );
  	begin
   		inherited create();
      explode( str, delimiter, includeDelimiter );
    end
  ;


  {*
    Creates a new copy of an instance of CStringList

    @param src TCStringList to be copied
  }
  constructor TCStringList.create( src: TCStringList );
    var
      i: integer;
    begin
      inherited create();

      for i := 0 to src.Count - 1 do
        self.Append( src.at(i) )
      ;
    end
  ;

  {*
    Inserts a null-terminated string as an item to the beginning of the list
    @param val null-terminated string
  }
  procedure TCStringList.prepend( val: pchar );
    begin
			insert( 0, val );
    end
  ;


  {*
    Inserts the contents of a string as an item to the beginning of the list
    @param val string
    @comment Stored as a null-terminated string
  }
  procedure TCStringList.prepend( val: string );
    begin
			prepend( PChar( val ) );
    end
  ;

  {*
    Replaces the contents of the current list item with val
    @param val Content to replace the content of the current list item
  }
  procedure TCStringList.replaceWith( val: string );
  	begin
   		insert( _currentPos, val );
      delete( _currentPos+1 );		
    end
  ;


  {*
    Replaces the contents of the current list item with val
    @param val Null-terminated string to replace the content of the current list item
    @comment Stored as a string, not a null-terminated string
  }
  procedure TCStringList.replaceWith( val: pchar );
  	begin
   		replaceWith( string( val ) );
    end
  ;


  {*
    Returns the contents of the first item in the list as a null-terminated string
    @return val Null-terminated string
    @comment if the list is empty then nil is returned
  }
  function TCStringList.first(): pchar;
    begin
      if isEmpty then
        result := nil
      else
        begin
          _currentPos := 0;
          result := PChar( get(0) );
        end
      ;
    end
  ;

  {*
    Returns the contents of the last item in the list as a null-terminated string
    @return val Null-terminated string
    @comment If the list is empty then nil is returned
  }
  function TCStringList.last(): pchar;
    begin
      if isEmpty then
        result := nil
      else
        begin
          _currentPos := count-1;
          result := PChar( get(_currentPos) );
        end
      ;
    end
  ;


  {*
    Returns the contents of the next item in the list as a null-terminated string
    @return val Null-terminated string
    @comment If the list is empty or a next item does not exist then nil is returned
  }
  function TCStringList.next(): pchar;
    begin
      if( isEmpty or ( _currentPos + 1 > count-1 ) ) then
        result := nil
      else
        begin
          inc(_currentPos);
          result := PChar( get(_currentPos) );
        end
      ;
    end
  ;


  {*
    Returns the contents of the item at position i in the list as a null-terminated string

    @param i An elements position in the list, the first being 0
    @return val Null-terminated string
    @comment If the list is empty or item(i) does not exist then nil is returned
  }
  function TCStringList.at( i: integer ): pchar;
    begin
      if( isEmpty or ( i < 0 ) or ( i > count-1 ) ) then
        result := nil
      else
        begin
          _currentPos := i;
          result := PChar( get(_currentPos) );
        end
      ;

    end
  ;


  {*
    Returns the contents of the previous item in the list as a null-terminated string
    @return val Null-terminated string
    @comment If the list is empty or a previous item does not exist then nil is returned
  }
  function TCStringList.prev(): pchar;
  	begin
   		if( isEmpty or ( _currentPos-1 < 0 ) ) then
      	begin
      		result := nil;
          if( _currentPos <= 0 ) then _currentPos := -1;
        end
      else
      	begin
       		dec( _currentPos );
          result := PChar( get(_currentPos ) );
        end
      ;
    end
  ;


  {*
    Returns the contents of the current item in the list as a null-terminated string
    @return val Null-terminated string
    @comment If the list is empty or a current item does not exist then nil is returned
  }
  function TCStringList.current(): pchar;
  	begin
   		if( isEmpty ) or ( _currentPos > count-1 ) then
      	result := nil
      else
      	result := PChar( get(_currentPos) )
      ;
    end
  ;


  {*
    Deletes the contents of the current item in the list
    @return true is the operation is a success, false if the list is empty or a current item does not exist
  }
  function TCStringList.remove(): boolean;
  	begin
   		if( isEmpty ) or ( _currentPos > (count-1) ) then
      	result := false
      else
      	begin
       		// Everything above the current item will fall down, so it isn't necessary to reset the current index
          delete( _currentPos );
          result := true;
        end
      ;
    end
  ;

  {*
     Indicates whether the stringlist contains data
     @return True if the list contains one or more strings
  }
  function TCStringList.getIsEmpty(): boolean;
    begin
      if( count = 0 ) then
        result := true
      else
        result := false
      ;
    end
  ;


  {*
    Appends the text in str, separated by delimiter, as items to the list

    @param str String containing the item(s) to be added to the list
    @param delimiter Character serving as the substring delimiter
    @param includeDelimiter Whether to include the delimiter with the list item
    @comment FIX ME: This function won't handle delimiters inside quotes!
  }
	procedure TCStringList.explode( str: string; delimiter: char; includeDelimiter: boolean = false );
  	var
    	pos: word;
      substr: string;
  	begin
    	repeat
        pos := ansiPos( delimiter, str );

        if( 0 = pos ) then
          substr := str
        else if( includeDelimiter ) then
        	substr := leftStr( str, pos )
        else
        	substr := leftStr( str, pos-1 )
        ;

        str := rightStr( str, length( str ) - pos );

        self.append( trim( substr ) );
      until pos = 0;
    end
  ;

  {*
    Returns a string of all the strings in the list separated by delimiter

    @param delimiter Character to use to delimit the strings of the list
    @return delimited string of list contents
  }
	function TCStringList.delimitedString( delimiter: string ): string;
  	var
    	val: pchar;
    begin
    	result := '';

    	val := self.first();

      while( nil <> val ) do
      	begin
      		result := result + val;

          if( self._currentPos < self.Count - 1 ) then
          	result := result + delimiter
          ;

          val := self.next();
        end
      ;

    end
  ;

  {*
    Outputs the contents of the string list
    @param useXtraLineFeed If true then each string is outputed on a separate line
  }
  procedure TCStringList.debug( useExtraLineFeed: boolean = false );
    var
      val: pchar;
    begin

      val := self.first();

      while( val <> nil ) do
        begin
          dbcout( string( val ), true );
          if( useExtraLineFeed ) then dbcout( endl, true );
          val := self.next();
        end
      ;

    end
  ;


end.
