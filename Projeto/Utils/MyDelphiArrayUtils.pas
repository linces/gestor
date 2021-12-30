{*
MyDelphiArrayUtils.pas - initializing and sorting arrays
----------------------
Begin: 2005/10/21
Last revision: $Date: 2010-05-20 05:03:24 $ $Author: areeves $
Version number: $Revision: 1.12 $
Code Documentation Tags: Begin 2009-08-14, Last Revision: 2009-08-14
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

unit MyDelphiArrayUtils;

interface

  type TARDoubleArray = array of double;      /// Array for double reals (5.0 x 10^-324 .. 1.7 x 10^308)
  type TARIntArray = array of integer;        /// Array for integers
  type TARExtendedArray = array of extended;  /// Array for extended reals (3.6 x 10^-4951 .. 1.1 x 10^4932)
  type TARStringArray = array of string;      /// Array for strings

  procedure fillArray( var arr: TARIntArray; val: integer ); overload;
  procedure fillArray( var arr: TARDoubleArray; val: double ); overload;
  procedure fillArray( var arr: TARExtendedArray; val: extended ); overload;

  procedure zeroArray( var arr: TARIntArray ); overload;
  procedure zeroArray( var arr: TARDoubleArray ); overload;
  procedure zeroArray( var arr: TARExtendedArray ); overload;

  function arrayIsZeroed( const arr: TARIntArray ): boolean; overload;
  function arrayIsZeroed( const arr: TARDoubleArray ): boolean; overload;
  function arrayIsZeroed( const arr: TARExtendedArray ): boolean; overload;

  { Sort values in the array.  Quicksort algorithm adapted from http://www.vb-helper.com/dart1.htm }
  procedure quickSort( arr: TARDoubleArray ); overload;
  procedure quickSort( arr: TARIntArray ); overload;

  function arrayContains( const arr: TARStringArray; const item: string; const caseSensitive: boolean = false  ): boolean; overload;
  function arrayContains( const arr: array of string; const item: string; const caseSensitive: boolean = false ): boolean; overload;

  // Debugging
  //----------
  procedure arDoubleArrayDebug( arr: TARDoubleArray );

implementation

  uses
    SysUtils,

    DebugWindow,
    MyStrUtils
  ;

  {*
    Fills every element in array arr with val

    @param arr An array for integers
    @param val An integer value
  }
  procedure fillArray( var arr: TARIntArray; val: integer );
    var
      i: integer;
    begin
      for i := low( arr ) to high( arr ) do
        arr[i] := val
      ;
    end
  ;

  {*
    Fills every element in array arr with val

    @param arr An array for double real numbers
    @param val A double value
  }
  procedure fillArray( var arr: TARDoubleArray; val: double );
    var
      i: integer;
    begin
      for i := low( arr ) to high( arr ) do
        arr[i] := val
      ;
    end
  ;

  {*
    Fills every element in array arr with val

    @param arr An array for extended real numbers
    @param val A double value
  }
  procedure fillArray( var arr: TARExtendedArray; val: extended );
    var
      i: integer;
    begin
      for i := low( arr ) to high( arr ) do
        arr[i] := val
      ;
    end
  ;

  {*
    Initializes the value of all the array elements to 0
    @param arr An array for integer numbers
  }
  procedure zeroArray( var arr: TARIntArray );
    begin
      fillArray( arr, 0 );
    end
  ;

  {*
    Initializes the value of all the array elements to 0.0
    @param arr An array for double real numbers
  }
  procedure zeroArray( var arr: TARDoubleArray );
    begin
      fillArray( arr, 0.0 );
    end
  ;

  {*
    Initializes the value of all the array elements to 0.0
    @param arr An array for extended real numbers
  }
  procedure zeroArray( var arr: TARExtendedArray );
    begin
      fillArray( arr, 0.0 );
    end
  ;

  {*
    Validates whether all elements of the array have a value of 0
    @param arr An array for integer numbers
    @return True if validation is success, else false
  }
  function arrayIsZeroed( const arr: TARIntArray ): boolean;
    var
      i: integer;
    begin
      result := true;

      for i := low( arr ) to high( arr ) do
        if( 0 <> arr[i] ) then
          begin
            result := false;
            break;
          end
        ;
      ;
    end
  ;

  {*
    Validates whether all elements of the array have a value of 0.0
    @param arr An array for double real numbers
    @return True if validation is success, else false
  }
  function arrayIsZeroed( const arr: TARDoubleArray ): boolean;
    var
      i: integer;
    begin
      result := true;

      for i := low( arr ) to high( arr ) do
        if( 0.0 <> arr[i] ) then
          begin
            result := false;
            break;
          end
        ;
      ;
    end
  ;

  {*
    Validates whether all elements of the array have a value of 0.0
    @param arr An array for extended real numbers
    @return True if validation is success, else false
  }
  function arrayIsZeroed( const arr: TARExtendedArray ): boolean;
    var
      i: integer;
    begin
      result := true;

      for i := low( arr ) to high( arr ) do
        if( 0.0 <> arr[i] ) then
          begin
            result := false;
            break;
          end
        ;
      ;
    end
  ;


  {*
    Sorts the double real numbers in arr, ascending order
    @param arr An array of integers
  }
  procedure quickSort( arr: TARDoubleArray );
      /// Inline function that uses 0 and the length of array for min and max
      procedure sort( arr: TARDoubleArray; min, max: integer );
        var
          med_value: double;
          hi, lo, i: integer;
        begin
          // If the list has <= 1 element, it's sorted.
          if (min >= max) then Exit;

          // Pick a dividing item randomly.
          i := min + Trunc(Random(max - min + 1));
          med_value := arr[i];

          // Swap it to the front so we can find it easily.
          arr[i] := arr[min];

          // Move the items smaller than this into the left
          // half of the list. Move the others into the right.
          lo := min;
          hi := max;
          while( true ) do
            begin
              // Look down from hi for a value < med_value.
              while (arr[hi] >= med_value) do
                begin
                  hi := hi - 1;
                  if (hi <= lo) then Break;
                end
              ;

              if (hi <= lo) then
                begin
                  // We're done separating the items.
                  arr[lo] := med_value;
                  Break;
                end
              ;

              // Swap the lo and hi values.
              arr[lo] := arr[hi];

              // Look up from lo for a value >= med_value.
              lo := lo + 1;
              while (arr[lo] < med_value) do
                begin
                  lo := lo + 1;
                  if (lo >= hi) then Break;
                end
              ;

              if (lo >= hi) then
                begin
                  // We're done separating the items.
                  lo := hi;
                  arr[hi] := med_value;
                  Break;
                end
              ;

              // Swap the lo and hi values.
              arr[hi] := arr[lo];
            end
          ; // while (True) do

          // Sort the two sublists.
          sort( arr, min, lo - 1 );
          sort( arr, lo + 1, max );
        end
      ;
    begin
      if( 1 < length( arr ) ) then
        begin
          // FIX ME: See the big comment in the int quicksort function below.
          dbcout( 'In quickSort (double): ' + usFloatToStr( arr[0] ), true );
          sort( arr, 0, length( arr ) );
        end
      ;

    sort( arr, 0, length( arr ) );
    end
  ;

  {*
    Sorts the integers in arr, ascending order
    @param arr An array of integers
  }
  procedure quickSort( arr: TARIntArray );
      /// Inline function that uses 0 and the length of array for min and max
      procedure sort( arr: TARIntArray; min, max: integer );
        var
          med_value: integer;
          hi, lo, i: integer;
        begin
          // If the list has <= 1 element, it's sorted.
          if (min >= max) then Exit;

          // Pick a dividing item randomly.
          i := min + Trunc(Random(max - min + 1));
          med_value := arr[i];

          // Swap it to the front so we can find it easily.
          arr[i] := arr[min];

          // Move the items smaller than this into the left
          // half of the list. Move the others into the right.
          lo := min;
          hi := max;
          while( true ) do
            begin
              // Look down from hi for a value < med_value.
              while (arr[hi] >= med_value) do
                begin
                  hi := hi - 1;
                  if (hi <= lo) then Break;
                end
              ;

              if (hi <= lo) then
                begin
                  // We're done separating the items.
                  arr[lo] := med_value;
                  Break;
                end
              ;

              // Swap the lo and hi values.
              arr[lo] := arr[hi];

              // Look up from lo for a value >= med_value.
              lo := lo + 1;
              while (arr[lo] < med_value) do
                begin
                  lo := lo + 1;
                  if (lo >= hi) then Break;
                end
              ;

              if (lo >= hi) then
                begin
                  // We're done separating the items.
                  lo := hi;
                  arr[hi] := med_value;
                  Break;
                end
              ;

              // Swap the lo and hi values.
              arr[hi] := arr[lo];
            end
          ; // while (True) do

          // Sort the two sublists.
          sort( arr, min, lo - 1 );
          sort( arr, lo + 1, max );
        end
      ;
    begin
      if( 1 < length( arr ) ) then
        begin
          // FIX ME:
          // For reasons that are unknown and evidently quite bizarre, quickSort
          // occasionally screws things up if the array hasn't been used.
          // In the LibAPHI demo with default parameters and 500 iterations,
          // a 0 appears from nowhere in the model output upon array sorting.
          //
          // This debugging statement seems to 'solve' the problem.
          // The problem warrants further investigation.
          dbcout( 'In quickSort (int): ' + intToStr( arr[0] ), true );
          sort( arr, 0, length( arr ) );
        end
      ;
    end
  ;


  {*
    Does the string array contain the indicated string?

    @param arr A string array
    @param item The string to search for
    @param caseSensitive is the search case-sensitive?
    @return True if item is in arr, else false
  }
  function arrayContains( const arr: TARStringArray; const item: string; const caseSensitive: boolean = false ): boolean;
    var
      i: integer;
      testItem, testArr: string;
    begin
      if( caseSensitive ) then
        testItem := item
      else
        testItem := ansiLowerCase( item )
      ;

      result := false; // Until shown otherwise

      for i := 0 to length( arr ) - 1 do
        begin
          if( caseSensitive ) then
            testArr := arr[i]
          else
            testArr := ansiLowerCase( arr[i] )
          ;

          if( testItem = testArr ) then
            begin
              result := true;
              break;
            end
          ;
        end
      ;
    end
  ;


  {*
    Does the array of strings contain the indicated string?

    @param arr An array of strings
    @param item The string to search for
    @param caseSensitive is the search case-sensitive?
    @return True if item is in arr, else false
  }
  function arrayContains( const arr: array of string; const item: string; const caseSensitive: boolean = false ): boolean;
    var
      i: integer;
      testItem, testArr: string;
    begin
      if( caseSensitive ) then
        testItem := item
      else
        testItem := ansiLowerCase( item )
      ;

      result := false; // Until shown otherwise

      for i := 0 to length( arr ) - 1 do
        begin
          if( caseSensitive ) then
            testArr := arr[i]
          else
            testArr := ansiLowerCase( arr[i] )
          ;

          if( testItem = testArr ) then
            begin
              result := true;
              break;
            end
          ;
        end
      ;
    end
  ;

//-----------------------------------------------------------------------------
// Debugging
//-----------------------------------------------------------------------------
  {*
    Displays debugging output for the specified array
    @param arr An array of doubles
  }
  procedure arDoubleArrayDebug( arr: TARDoubleArray );
    var
      i: integer;
    begin
      dbcout( endl + '---arDoubleArrayDebug:', true );
      for i := 0 to length( arr ) - 1 do
        dbcout( arr[i], true )
      ;
      dbcout( '---Done.', true );
    end
  ;
//-----------------------------------------------------------------------------

end.
