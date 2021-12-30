{*
ARMath.pas  Vector sorting and percentile calculations, significant digit string
            formating and useful functions for validating numeric input
----------
Begin: 2005/02/03
Last revision: $Date: 2009-08-11 17:59:07 $ $Author: rhupalo $
Version number: $Revision: 1.22 $
Code Documentation Tags: Begin 2009-04-06, Last Revision: 2009-08-06
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2008 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.


  This unit contains some simple types and useful basic mathematical
  functions which do not require external libraries.

  Some of these functions may be automatically tested.  If the symbol
  TESTING is defined in Defs.inc, the appropriate test code is automatically
  run when this unit is initialized.  Please see the test code and the
  initialization section at the end of this unit.
}


(*
  Short function descriptions are provided in the interface section.  More
  detailed comments are provided in the implementation section as needed.

  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)


unit ARMath;

interface

  uses
    Math,
    Contnrs,
    MyDelphiArrayUtils
  ;

  //--------------------
  // Unit self-test
  //--------------------
  procedure selfTest();


  //-------------------------
  // Useful types and aliases
  //-------------------------

  type uint = longword; /// unsigned 32-bit integer


  //-------------------------
  // Array handling functions
  //-------------------------
  { Returns the median (50th percentile) from the raw or sorted array }
  function ArrayMedian( arr: TARDoubleArray ): double;
  function medianSortedData( sortedData: TARDoubleArray ): double;

  { Returns the specified quantile value from the raw or sorted array }
  function arrayQuantile( arr: TARDoubleArray; quantile: double ): double;
  function quantileSortedData( sortedData: TARDoubleArray; quantile: double ): double;


  //----------------------------
  // Number formatting functions
  //----------------------------
  { Determines how many significant digits are present in a string representation of a numeric value }
  function significantDigits( str: string ): integer;

  { Formats a string representation of the number val with d significant digits }
  function showSignificantDigits( val: double; d: integer ): string;

  
  //--------------
  // Miscellaneous
  //--------------
  { Indicates whether val is not "not a number" (NaN) }
  function isNumber( const val: double ): boolean;

  { Indicates whether 0.0 <= val <= 1.0 }
  function isProbability( const val: double ): boolean;
  function isProportion( const val: double ): boolean;


  //------------------
  // Testing functions
  //------------------
  procedure zzTestSignificantDigits();
  procedure zzTestShowSignificantDigits();


  const
    DBARMATH: boolean = false; /// Set to true to enable debugging messages for this unit

implementation

  uses
    SysUtils,
    StrUtils,

    MyStrUtils,
    DebugWindow,
    RoundToXReplacement_3c
  ;



//-----------------------------------------------------------------------------
// Array handling functions
//-----------------------------------------------------------------------------


  {*
    Provides the data value for a specified quantile from a sorted array
    @param quantile A value between 0 and 1
    @param sortedData Sorted (ascending) array of data values
    @return Value in the array at the specified quantile
    @comment Function is based on code for the GNU Scientific Library, version 1.6
  }
  function quantileSortedData( sortedData: TARDoubleArray; quantile: double ): double;
    var
      index: double;
      lhs: integer;
      delta: double;
      n: integer;
    begin
      n := length( sortedData );
      index := quantile * ( n - 1 );
      lhs := trunc( index );
      delta := index - lhs;

      if( 0 = n ) then
        result := 0.0
      else if( n - 1 = lhs ) then
        result := sortedData[n-1]
      else
        result := ( 1 - delta ) * sortedData[lhs] + delta * sortedData[lhs + 1]
      ;
    end
  ;

  {*
    Provides the data value for a specified quantile from an un-sorted array
    @param quantile A value between 0 and 1
    @param arr Un-sorted array of data values
    @return Value in the array at the specified quantile
  }
  function arrayQuantile( arr: TARDoubleArray; quantile: double ): double;
    begin
      quickSort( arr );
      result := quantileSortedData( arr, quantile );
    end
  ;

  {*
    Provides the data value for the median of a sorted array
    @param sortedData Sorted array of data values
    @return Value in the array at the 0.5 quantile
  }
  function medianSortedData( sortedData: TARDoubleArray ): double;
    begin
      result := quantileSortedData( sortedData, 0.5 );
    end
  ;

  {*
    Provides the data value for the median of an un-sorted array
    @param arr Un-sorted array of data values
    @return Value in the array at the 0.5 quantile
  }
  function ArrayMedian( arr: TARDoubleArray ): double;
    begin
      quickSort( arr );
      result := quantileSortedData( arr, 0.5 );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Number formatting functions
//-----------------------------------------------------------------------------
  (*
    Determines how many significant digits are present in a string representation
    of a numeric value.  This function is tested by zzTestSignificantDigits().

    For example:

    "1" has 1 significant digit.
    "-1.00" has 3 significant digits.
    "0.004" has 1 significant digit.
    "0.0040" has 2 significant digits.

    For integers, all digits are currently considered significant:
    "1" has 1 significant digit.
    "1000" has 4 significant digits.

    Scientific notation is not (yet?) supported:
    "100" has 3 significant digits.
    "1E2" should have 1 significant digit, but this capability is not supported.
  *)

  {*
    Returns the number of significant digits of a numeric value stored as a string
    @param str Numeric value represented as a string
    @return Number of significant digits
    @comment Scientific notation format is not supported
  }
  function significantDigits( str: string ): integer;
    var
      dp: integer; // decimal point position
      fp: integer; // position of first nonzero digit
      flt: double;
      charCount: integer;
    begin
      str := fixup( str );
      flt := usStrToFloat( str );

      charCount := length( str );

      // Was the number negative? If so, subtract 1 from the
      // character count so that the minus sign is not counted as a digit.
      if( 0 > flt ) then
        charCount := charCount - 1
      ;

      // Determine the position of the decimal point.
      // Remember: ansiPos is 1-indexed. If '.' is in the
      // first position of the string, ansiPos stupidly returns 1.
      // Subtract 1 to make this value right with the world.
      dp := ansiPos( '.', str );
      dp := dp - 1;

      if( 0 > dp ) then
        begin
          // No decimal point was found.  Count all digits of the integer as significant.
          // (Technically this isn't quite right, but scientific notation is not supported.)
          result := charCount;
        end
      else
        begin
          // There is a decimal point.
          // Is it to the right or left of the first nonzero character?
          fp := firstNonZeroChar( str );

          // Again, don't forget the minus sign.
          if( 0 > flt ) then
            fp := fp - 1
          ;

          //dbcout( 'dp: ' + intToStr( dp ) + ', firstNonZeroChar: ' + intToStr( fp ) + ', test: ' + boolToText( dp < fp ) );

          if( dp < fp ) then
            begin
              // The decimal point is to the left of the first nonzero character
              // Disregard anything that came before the first actual nonzero character.
              result := charCount - fp;
            end
          else
            begin
              // The decimal point is "in the middle" of the string.
              // Subtract 1, so that it is not counted as a digit.
              result := charCount - 1;
            end
          ;
       end
      ;
    end
  ;


  {*
    Formats a string representation of the number val with d significant digits.
    This function is tested by zzTestShowSignificantDigits()

    @param val Number to be represented as a string
    @param d Desired number of significant digits
    @return String representation of input number
  }
  function showSignificantDigits( val: double; d: integer ): string;
    var
      str: string;
      i: integer;
      nextVal: double;
      absval: double;

      tempStr: string;
      fp: integer; // first nonzero position
    begin
      dbcout( '*** Show ' + intToStr( d ) + ' significant digits of ' + usFloatToStr( val, 15, false ), DBARMATH );

      absval := abs( val );

      if( d < 1 ) then d := 1;

      // If the value is less than 1 but greater than or equal
      // to 0.1, just fix at d places.
      //------------------------------------------------------
      if( ( 0.1 <= absval ) and ( 1 > absval ) ) then
        begin
          str := format( '%.'+ intToStr(d) + 'f', [val] );

          nextVal := usStrToFloat( str );

          if( nextVal >= 1 ) then
            str := leftStr( str, length(str) - 1 )
          ;

        end

      // If abs( value ) is 1 or more, determine how many
      // digits are to the left of the decimal point and move
      // the fix point to the left.
      //------------------------------------------------------
      else if ( 1 <= absval ) then
        begin
          i := length( intToStr( trunc( absval ) ) );
          d := d - i;

          if( d < 0 ) then
            begin
              val := roundDblTo( val, -1 * d );
              str := format( '%.0f', [val] );
            end
          else
            begin
              str := format( '%.'+ intToStr(d) + 'f', [val] );

              nextVal := usStrToFloat( str );

              if( ( d > 0 ) and ( nextVal / power( 10, i ) >= 1 ) ) then
                str := leftStr( str, length(str) - 1 )
              ;
            end
          ;
        end

      // If abs( value ) is less than 0.1, determine how many
      // leading zeros there are, and move the fix point to the right.
      //---------------------------------------------------------------
      else if( absVal < 0.1 ) then
        begin
          tempStr := usFloatToStr( val, 15, false );

          fp := firstNonZeroChar( tempStr ) - 2;

          dbcout( '--- fp is ' + intToStr( fp ), DBARMATH );

          if( fp = -3 ) then // All digits are zeroes
            begin
              str := leftStr( tempStr, d+1 ); // Show the right number of zeroes
              if( rightStr( str, 1 ) = '.' ) then str := leftStr( str, length( str ) - 1 );
            end
          else
            begin
              d := d + fp;
              str := format( '%.'+ intToStr(d) + 'f', [val] );

              nextVal := usStrToFloat( str );

              
              if( nextVal / power( 10, -1 * fp ) >= 1 ) then
                str := leftStr( str, length(str) - 1 )
              ;
            end
          ;
        end

      // If all else fails...
      //----------------------
      else
        str := usFloatToStr( val )
      ;


      if( charAt( str, length(str) - 1 ) = '.' ) then
        str := leftStr( str, length(str) - 1 )
      ;

      result := str;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Miscellaneous
//-----------------------------------------------------------------------------

  {*
    Indicates whether val is a number

    @param val Numeric value
    @return True if input value is a valid number
  }
  function isNumber( const val: double ): boolean;
    begin
      result := not( isNaN( val ) );
    end
  ;

  {*
    Indicates whether val is a probability

    @param val Numeric value
    @return True if input is a proportion between 0 and 1
  }
  function isProbability( const val: double ): boolean;
    begin
      result := isProportion( val );
    end
  ;

  {*
    Helper function to isProbability
    indicates whether val is a proportion

    @param val Numeric value
    @return True if input is a proportion between 0 and 1
  }
  function isProportion( const val: double ): boolean;
    begin
      if( not( isNumber( val ) ) ) then
        result := false
      else
        result := ( ( 0.0 <= val ) and ( 1.0 >= val ) )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Automated testing code.
//-----------------------------------------------------------------------------

  {*
    Automated testing of the function showSignificantDigits()
  }
  procedure zzTestShowSignificantDigits();
    var
      f: double;
      str: string;
    begin
      f := strToFloat( '0.3003875015456' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 0.3003875015456, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '0.3' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.2958593758176' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.2958593758176, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.30' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.3258246410987' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.3258246410987, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.32582' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.24801144096091' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.24801144096091, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.2480' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.6759830991468' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.6759830991468, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.676' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.5380395114935' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.5380395114935, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.53804' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.1179284519676' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.1179284519676, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.1179' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.680139982358' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.680139982358, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.68' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.1978594317807' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.1978594317807, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.20' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.2647016599567' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.2647016599567, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.2647' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.35298496805171' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.35298496805171, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.35' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.186325644464' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.186325644464, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.1863' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.3558299148126' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.3558299148126, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.3558' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.2449393445395' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.2449393445395, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.245' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.5355320225017' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.5355320225017, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.536' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.9319234922332' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.9319234922332, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.93192' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.280229251739' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.280229251739, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.2802' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.8069872427731' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 0.8069872427731, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '0.8' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.2695979772288' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 0.2695979772288, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '0.3' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.16355094406481' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.16355094406481, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.16' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.7433988411894' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.7433988411894, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.74340' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.35093833928931' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.35093833928931, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.35094' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.25923126600446' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.25923126600446, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.259' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.88646482457989' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.88646482457989, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.8865' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '0.03003875015456' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 0.03003875015456, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '0.03' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.002958593758176' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.002958593758176, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.0030' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0003258246410987' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.0003258246410987, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.00032582' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.024801144096091' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.024801144096091, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.02480' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0000006759830991468' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.0000006759830991468, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.000000676' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0163216931387' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.0163216931387, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.0163' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0127056465717' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.0127056465717, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.013' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '10.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '9.997' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '9.9970' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 6 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 6 ) + ' sig digits is ' + str );
      if( '9.99700' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '100.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '99.996' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 6 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 6 ) + ' sig digits is ' + str );
      if( '99.9960' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 7 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 7 ) + ' sig digits is ' + str );
      if( '99.99600' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '1000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '1000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '1000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '1000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '1000.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 6 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 6 ) + ' sig digits is ' + str );
      if( '999.996' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 7 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 7 ) + ' sig digits is ' + str );
      if( '999.9960' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '999.996' );
      str := showSignificantDigits( f, 8 );
      dbtest( usFloatToStr( 999.996, 15 ) +  ' to ' + intToStr( 8 ) + ' sig digits is ' + str );
      if( '999.99600' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '0.1' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '0.10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.1000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.10000' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 6 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 6 ) + ' sig digits is ' + str );
      if( '0.0999996' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 7 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 7 ) + ' sig digits is ' + str );
      if( '0.09999960' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.0999996' );
      str := showSignificantDigits( f, 8 );
      dbtest( usFloatToStr( 0.0999996, 15 ) +  ' to ' + intToStr( 8 ) + ' sig digits is ' + str );
      if( '0.099999600' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '43.3003875015456' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 43.3003875015456, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '40' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '6.2958593758176' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 6.2958593758176, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '6.3' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '47.3258246410987' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 47.3258246410987, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '47.326' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '2.24801144096091' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 2.24801144096091, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '2.248' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '15.6759830991468' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 15.6759830991468, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '15.7' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '19.5380395114935' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 19.5380395114935, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '19.538' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '44.1179284519676' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 44.1179284519676, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '44.12' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '19.680139982358' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 19.680139982358, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '20' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '50.1978594317807' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 50.1978594317807, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '50' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '43.0127056465717' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 43.0127056465717, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '43' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '44.2647016599567' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 44.2647016599567, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '44.26' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '5.35298496805171' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 5.35298496805171, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '5.4' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '41.186325644464' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 41.186325644464, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '41.19' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '38.3558299148126' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 38.3558299148126, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '38.36' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '34.2449393445395' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 34.2449393445395, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '34.2' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '32.5355320225017' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 32.5355320225017, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '32.5' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '17.9319234922332' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 17.9319234922332, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '17.932' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '32.280229251739' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 32.280229251739, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '32.28' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '47.8069872427731' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 47.8069872427731, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '50' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '25.2695979772288' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 25.2695979772288, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '30' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '22.0163216931387' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 22.0163216931387, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '22.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '6.16355094406481' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 6.16355094406481, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '6.2' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '39.7433988411894' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 39.7433988411894, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '39.743' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '6.35093833928931' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 6.35093833928931, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '6.3509' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.25923126600446' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 9.25923126600446, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '9.26' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '5.88646482457989' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 5.88646482457989, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '5.886' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '100.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '10' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '9.997' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 9.997, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '10.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '100.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '100.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 0 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 0 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '99.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 99.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '100' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );

      f := strToFloat( '0.996' );
      str := showSignificantDigits( f, 1 );
      dbtest( usFloatToStr( 0.996, 15 ) +  ' to ' + intToStr( 1 ) + ' sig digits is ' + str );
      if( '1' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.996' );
      str := showSignificantDigits( f, 2 );
      dbtest( usFloatToStr( 0.996, 15 ) +  ' to ' + intToStr( 2 ) + ' sig digits is ' + str );
      if( '1.0' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.996' );
      str := showSignificantDigits( f, 3 );
      dbtest( usFloatToStr( 0.996, 15 ) +  ' to ' + intToStr( 3 ) + ' sig digits is ' + str );
      if( '0.996' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.996' );
      str := showSignificantDigits( f, 4 );
      dbtest( usFloatToStr( 0.996, 15 ) +  ' to ' + intToStr( 4 ) + ' sig digits is ' + str );
      if( '0.9960' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      f := strToFloat( '0.996' );
      str := showSignificantDigits( f, 5 );
      dbtest( usFloatToStr( 0.996, 15 ) +  ' to ' + intToStr( 5 ) + ' sig digits is ' + str );
      if( '0.99600' <> str ) then raise exception.create( 'ARMath.zzTestShowSignificantDigits failed' );

      dbtest( endl );
    end
  ;


  {*
    Tests the function significantDigits()
  }
  procedure zzTestSignificantDigits();
    var
      d: string;
      sd: integer;
    begin
      // Positive integers
      //------------------
      d := '100';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 3 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '4';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );


      // Negative integers
      //------------------
      d := '-50';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 2 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-7';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );


      // Positive floats >= 1
      //-------------------------------
      d := '1.0044';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 5 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '1.0';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 2 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '2.7';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 2 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '150.00240';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 8 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );


      // Negative floats <= -1
      //----------------------
      d := '-1.00';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 3 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-1.001';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 4 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-1.004400';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 7 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      // Positive floats < 1
      //---------------------
      d := '0.00555000';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 6 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '0.05';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '0.004';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '0.0400';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 3 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );


      // Negative floats > -1
      //----------------------
      d := '-0.00555000';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 6 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-0.05'; 
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-0.004';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 1 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );

      d := '-0.0400';
      sd := significantDigits( d );
      dbtest( '%s has %d significant digits.', [d, sd] );
      if( sd <> 3 ) then raise exception.Create( 'ARMAth.zzTestSignificantDigits failed.' );
    end
  ;

  {*
    Calls the automated testing functions zzTestSignificantDigits and zzTestShowSignificantDigits
  }
  procedure selfTest();
    begin
      //testfirstNonZeroChar();
      zzTestSignificantDigits();
      zzTestShowSignificantDigits();
    end
  ;
//-----------------------------------------------------------------------------



  initialization
    setRoundMode( rmNearest ); // This is probably the default, but I don't want to risk it.

end.
