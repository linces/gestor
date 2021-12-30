{*
RegExpDefs.pas - defines full and partial regular expression patterns and a container class
--------------
Begin: 2005/06/10
Last revision: $Date: 2009-08-25 16:44:25 $ $Author: rhupalo $
Version number: $Revision: 1.14 $
Code Documentation Tags: Begin 2009-08-23, Last Revision: 2009-08-24
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


unit RegExpDefs;

interface

  uses
    Classes,

    RegExpr
  ;

  const
    RE_INTEGER_INPUT = '^\d*$';             /// Pattern for positive integers
    RE_SIGNED_INTEGER_INPUT ='^[-]?\d*$';   /// Pattern for signed integers

    RE_IP_ADDRESS = '^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';  /// Pattern for IP addresses

  function RE_DECIMAL_INPUT: string;
  function RE_SIGNED_DECIMAL_INPUT: string;

  function RE_DOLLAR_INPUT: string;

  type
    /// Structure for holding forms of a Regular Expression to implement full and partial pattern matching
    TRegExpList = class( TStringList )
      protected
        _regExpr: TRegExpr; /// private member to hold regular expression list

        function getIsEmpty(): boolean;

      public
        constructor create(); overload;
        constructor create( const str: string ); overload;

        destructor destroy(); override;

        function isFullMatch( test: string ): boolean;
        function isPartialMatch( test: string ): boolean;

        property isEmpty: boolean read getIsEmpty;

    end
  ;

  // First list item is the complete match
  // Subsequent items are partial matches
  // Last item should be an empty string
  //function createRegExpListEmpty(): TRegExpList;
  function createRegExpListPosInteger(): TRegExpList;
  function createRegExpListFloat(): TRegExpList;

implementation

  uses
    SysUtils,

    MyStrUtils,
    DebugWindow,
    I88n
  ;

  {*
    Creates pattern for unsigned floating point numbers using the locale decimal point
    @return Regular expression
  }
  function RE_DECIMAL_INPUT: string;
    begin
      result := '^\d*[' + sysDecPt() + ']?\d*$';
    end
  ;


  {*
    Creates pattern for signed floating point numbers using the locale decimal point
    @return Regular expression
  }
  function RE_SIGNED_DECIMAL_INPUT: string;
    begin
      result := '^[-]?\d*[' + sysDecPt() + ']?\d*$';
    end
  ;


  {*
    Creates pattern for currency using the locale decimal point
    @return Regular expression
  }
  function RE_DOLLAR_INPUT: string;
    begin
      result := '^\d*[' + sysDecPt() + ']?\d{0,2}$';
    end
  ;

  {*
    Creates patterns for unsigned integers, holding patterns for full match, partial match, and empty string
    @return Regular expression list; full match [0], partial match [1], empty string [2]
  }
  function createRegExpListPosInteger(): TRegExpList;
    var
      list: TRegExpList;
    begin
      list := TRegExpList.create();

      list.Add( '^[+]?\d+$' ); // Full match
      list.Add( '^[+]?$' ); // Partial match
      list.Add( '^$' ); // Empty string

      result := list;
    end
  ;

  {*
    Creates patterns for floating point (unsigned or signed ) numerics, holding patterns for full match, partial match, and empty string
    @return Regular expression list; full match [0], partial match [1], empty string [2]
  }
  function createRegExpListFloat(): TRegExpList;
    var
      list: TRegExpList;
    begin
      list := TRegExpList.create();

      list.Add( '(^[-+]?\d+[' + sysDecPt() + ']\d*?$)|(^[-+]?\d*[' + sysDecPt() + ']?\d+$)' ); // Full match
      list.Add( '^[-+]?$' ); // Partial match
      list.Add( '^$' ); // Empty string

      result := list;
    end
  ;

  /// Creates an empty list for holding regular expressions
  constructor TRegExpList.create();
    begin
      inherited create();
      _regExpr := TRegExpr.create();
    end
  ;


  {*
     Creates list (full, partial, empty) of regular expressions for matching str
     @param str Pattern to be matched
  }
  constructor TRegExpList.create( const str: string );
    var
      i: integer;
      chU, chL: char;
      upper, lower: string;
      tmp: string;
    begin
      inherited create();
      _regExpr := TRegExpr.create();

      // First partial match
      //self.Add( '^[+]?$' );
      self.Add( '^$' );

      tmp := '';
      upper := ansiUpperCase( str );
      lower := ansiLowerCase( str );
      for i := 0 to length( str ) - 1 do
        begin
          chU := charAt( upper, i );
          chL := charAt( lower, i );
          tmp := tmp + '[' + chU + chL + ']';

          // Partial matches
          self.Add( '^' + tmp + '$' );
        end
      ;

      // Full match
      self.insert( 0, '(^' + tmp + '$)|(^\s*$)|(^' + lower + '$)' );
    end
  ;
  
  /// Sestroy the object and free resources
  destructor TRegExpList.destroy();
    begin
      _regExpr.Free();
      inherited destroy();
    end
  ;


  {*
    Determines whether a regular expression list is empty
    @return True if list is empty else false
  }
  function TRegExpList.getIsEmpty(): boolean;
    begin
      result := ( 0 = self.count );
    end
  ;


  {*
    Determines whether test fully matches regular expression

    @param The text to validate against the regular expression
    @return True if full pattern match or list is empty, else false
    @comment Fix Me: What are ramifications of returning False if the list is empty?
  }
  function TRegExpList.isFullMatch( test: string ): boolean;
    begin
      if( self.isEmpty ) then
        result := true
      else
        begin
          _regExpr.Expression := self[0];
          //dbcout2( self[0] );
          result := _regExpr.Exec( test );
        end
      ;
    end
  ;


  {*
    Determines whether test partially matches regular expression

    @param The text to validate against the regular expression
    @return True if partial pattern match or list is empty, else false
    @comment Fix Me: What are ramifications of returning False if the list is empty?
  }
  function TRegExpList.isPartialMatch( test: string ): boolean;
    var
      i: integer;
    begin
      result := false;

      if( self.isEmpty ) then
        result := true
      else
        begin
          for i := 0 to self.Count - 1 do
            begin
              _regExpr.Expression := self[i];
              result := _regExpr.Exec( test );

              if( result ) then break;
            end
          ;
        end
      ;
    end
  ;


end.
