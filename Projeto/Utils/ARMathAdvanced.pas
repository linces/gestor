{*
ARMathAdvanced.pas - natural logs, gamma function, factorials, binomial distribution
------------------
Begin: 2005/02/03
Last revision: $Date: 2011-10-25 05:05:07 $ $Author: areeves $
Version number: $Revision: 1.12 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-13
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

	Some functions used in this unit are contained in the GNU Scientific Library (GSL), version 1.0.
	A Windows DLL version of the GSL may be downloaded from http://gnuwin32.sourceforge.net/packages/gsl.htm.

	Some day soon, detailed documentation for using the GSL DLL may be found at http://www.aaronreeves.com/gsldll.

  This unit contains mathematical functions which require the GNU Scientific
  Library (the GSL) and/or similar external libraries.  The GSL DLL is
  automatically loaded when this unit is initialized.
}


(*
  Short function descriptions are provided in the interface section.  More
  detailed comments are provided in the implementation section when needed.

  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit ARMathAdvanced;

interface

  uses
    Windows,
    Math,

    ARMath
  ;

  //-----------------------------------
  // Library initialization and cleanup
  //-----------------------------------
  { Loads the DLL for the GNU Scientific library. }
  procedure setupGSL();

  { Unloads the DLL for the GNU Scientific library. }
  procedure closeGSL();


  //---------------------------------
  // Logarithms and related functions
  //---------------------------------
  function gslExp( x: double ): double;
  function gslLog( x: double ): double;
  function gslPower( x: double; n: integer ): double;

  //---------------------------------
  // Factorials and related functions
  //---------------------------------
  { Computes the n! }
  function factorial( n: integer ): double;

  { Computes the natural log of n! }
  function lnFactorial( n: integer ): double;

  { Computes ( n choose m ), or b!/(m!(n-m!)) }
  function choose( const n, m: integer ): double;

  { Computes the natural log of ( n choose m ) }
  function lnChoose( const n, m: integer ): double;

  //---------------
  // Gamma function
  //---------------
  { Calculates Gamma( x ).  See "Gamma Function" in GNU Scientific Library Reference Manual. }
  function gamma( x: double ): double;

  { Calculates the natural log of Gamma( x ).  See "Gamma Function" in GNU Scientific Library Reference Manual. }
  function lnGamma( x: double ): double;


  //---------------------
  // Binomial probability
  //---------------------
  { Calculates the probability of exactly x successes in n trials where each trial has a probability of p. }
  function binomProb( x, n: integer; p: double ): extended;

  { Calculates the probability of x or fewer successes in n trials where each trial has a probability of p. }
  function cumBinomProb( x, n: integer; p: double ): double; overload;

  { Same as above, but fills an array in the process.  See detailed comments. }
  function cumBinomProb( x, n: integer; p: double; var arr: array of double ): double; overload;

  { Calculates the binomial coeffecient for x successes and n trials.  Used in functions above. }
  function binomCoeff( x, n: integer ): extended;


  var
    hndLibGSL: THandle; /// Handle for the GSL DLL

    unitARMathAdvancedReady: boolean; /// indicates whether the required libraries were loaded during initialization.

    // Pointers to GSL functions
    //--------------------------
    gsl_sf_lngamma: function( x: double ): double; cdecl;             /// Pointer to GSL function
    gsl_sf_gamma: function( x: double ): double; cdecl;               /// Pointer to GSL function
    gsl_sf_fact: function( n: longword ): double; cdecl;              /// Pointer to GSL function
    gsl_sf_lnfact: function( n: longword ): double; cdecl;            /// Pointer to GSL function
    gsl_sf_choose: function( n, m: longword ): double; cdecl;         /// Pointer to GSL function
    gsl_sf_lnchoose: function( n, m: longword ): double; cdecl;       /// Pointer to GSL function
    gsl_sf_exp: function( x: double ): double; cdecl;                 /// Pointer to GSL function
    gsl_sf_log: function( x: double ): double; cdecl;                 /// Pointer to GSL function
    gsl_sf_pow_int: function( x: double; n: integer ): double; cdecl; /// Pointer to GSL function

  const
    DBARMATHADVANCED: boolean = false; /// set to true to enable debugging messages for this unit.


implementation

  uses
    SysUtils,
    MyStrUtils
  ;


//-----------------------------------------------------------------------------
// Library initialization and cleanup
//-----------------------------------------------------------------------------
  {*
    Loads the DLL for the GNU Scientific library
  }
  procedure setupGSL();
    var
      ok: boolean;
    begin
      ok := true; // until shown otherwise.

      hndLibGSL := LoadLibrary( 'libgsl.dll' );

      if( hndLibGSL >= 32 ) then // Libary was successfully loaded.  Set up the function pointers
        begin
          gsl_sf_gamma := getProcAddress( hndLibGSL, 'gsl_sf_gamma' );
          if( nil = @gsl_sf_gamma ) then
            ok := false
          ;
          gsl_sf_lngamma := getProcAddress( hndLibGSL, 'gsl_sf_lngamma' );
          if( nil = @gsl_sf_lngamma ) then
            ok := false
          ;

          gsl_sf_fact := getProcAddress( hndLibGSL, 'gsl_sf_fact' );
          if( nil = @gsl_sf_fact ) then
            ok := false
          ;
          gsl_sf_lnfact := getProcAddress( hndLibGSL, 'gsl_sf_lnfact' );
          if( nil = @gsl_sf_lnfact ) then
            ok := false
          ;

          gsl_sf_choose := getProcAddress( hndLibGSL, 'gsl_sf_choose' );
          if( nil = @gsl_sf_choose ) then
            ok := false
          ;
          gsl_sf_lnchoose := getProcAddress( hndLibGSL, 'gsl_sf_lnchoose' );
          if( nil = @gsl_sf_lnchoose ) then
            ok := false
          ;

          gsl_sf_exp := getProcAddress( hndLibGSL, 'gsl_sf_exp' );
          if( nil = @gsl_sf_exp ) then
            ok := false
          ;
          gsl_sf_log := getProcAddress( hndLibGSL, 'gsl_sf_log' );
          if( nil = @gsl_sf_log ) then
            ok := false
          ;
          gsl_sf_pow_int := getProcAddress( hndLibGSL, 'gsl_sf_pow_int' );
          if( nil = @gsl_sf_pow_int ) then
            ok := false
          ;
        end
      else
        ok := false
      ;

      unitARMathAdvancedReady := ok;
    end
  ;


  {*
    Unloads the DLL for the GNU Scientific library.
  }
  procedure closeGSL();
    begin
      freeLibrary( hndLibGSL );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Gamma function
//-----------------------------------------------------------------------------
  {*
    Calculates Gamma( d ). The gamma function is used to approximate several other functions,
    such as factorials and is an extension of the factorial function to real and complex numbers.
    See "Gamma Function" in GNU Scientific Library Reference Manual.

    @param x Value for which a factorial solution is sought
    @return The Gamma of x
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function gamma( x: double ): double;
    begin
      if( nil = @gsl_sf_gamma ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_gamma' );
          result := NaN;
        end
      else
        result := gsl_sf_gamma( x )
      ;
    end
  ;

  {*
    Calculates the natural log of Gamma( d ). lnGamma is used to approximate several other functions.
    See "Gamma Function" in GNU Scientific Library Reference Manual.

    @param x Value for which a log of Gamma solution is sought
    @return The natural log gamma value of x
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function lnGamma( x: double ): double;
    begin
      if( nil = @gsl_sf_lngamma ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_lngamma' );
          result := NaN;
        end
      else
        result := gsl_sf_lngamma( x )
      ;
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Logarithms and related functions
//-----------------------------------------------------------------------------

  {*
    Calculates exp(x), where e (approximately 2.718) is raised to the power x.
    See "Exponential Function" in GNU Scientific Library Reference Manual.

    @param x Value for exponent of e
    @return exp(x)
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function gslExp( x: double ): double;
    begin
      if( nil = @gsl_sf_exp ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_exp' );
          result := NaN;
        end
      else
        result := gsl_sf_exp( x )
      ;
    end
  ;

  {*
    Calculates the natural logarithm of x, where x > 0. The natural logarithm of
    a number x is the power to which e (2.718) would have to be raised to equal x.
    See "Logarithm and Related Functions" in GNU Scientific Library Reference Manual.

    @param x Real number greater than zero
    @return Log(x)
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function gslLog( x: double ): double;
    begin
      if( nil = @gsl_sf_log ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_log' );
          result := NaN;
        end
      else
        result := gsl_sf_log( x )
      ;
    end
  ;

  {*
    Calculates the power x^n for integer n (x raised to the nth power).
    See "Logarithm and Related Functions" in GNU Scientific Library Reference Manual.

    @param x Base value
    @param n Exponent
    @return  x^n
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function gslPower( x: double; n: integer ): double;
    begin
      if( nil = @gsl_sf_pow_int ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_pow_int' );
          result := NaN;
        end
      else
        result := gsl_sf_pow_int( x, n )
      ;
    end
  ;


//-----------------------------------------------------------------------------
// Factorial
//-----------------------------------------------------------------------------
  {*
    Computes n! the product of all positive integers <= n.
    See "Factorials" in GNU Scientific Library Reference Manual.

    @param n Integer >= 0 and <= 170 (max prevents memory overflow)
    @return n!
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function factorial( n: integer ): double;
    begin
      if( nil = @gsl_sf_fact ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_fact' );
          result := NaN;
        end
      else
        result := gsl_sf_fact( n )
      ;
    end
  ;

(*
    var
      val: double;
      q: integer;
    begin
      if( i = 0 ) then
        val := 1
      else if( i > 32 ) then
        val := exp( lnGamma( i+1 ) )
      else
        begin
          val := i;
          q := i-1;

          while( 0 < q ) do
            begin
              val := val * q;
              q := q - 1;
            end
          ;
        end
      ;

      result := val;
    end
  ;
*)


  {*
    Computes the natural log of n! (the product of all positive integers <= n).
    See "Factorials" in GNU Scientific Library Reference Manual.

    @param n Integer >= 0 and <= 170 (max prevents memory overflow)
    @return Log(n!)
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
  }
  function lnFactorial( n: integer ): double;
    begin
      if( nil = @gsl_sf_lnfact ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_lnfact' );
          result := NaN;
        end
      else
        result := gsl_sf_lnfact( n )
      ;
    end
  ;

(*
    begin
      if( i <=1 ) then
        result := 0
      else
        result := lnGamma( i + 1 )
      ;
    end
  ;
*)


  {*
    Computes n choose m, or n!/(m!(n-m!)); the number of ways that
    m things can be 'chosen' from a set of n things
    See "Factorials" in GNU Scientific Library Reference Manual.

    @param n n-element set
    @param m m-element subsets
    @return n choose m
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
    @comment GSL documentation does not state limits to avoid overflow, but N max may be 170.
  }
  function choose( const n, m: integer ): double;
    begin
      if( nil = @gsl_sf_choose ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_choose' );
          result := NaN;
        end
      else
        result := gsl_sf_choose( n, m )
      ;
    end
  ;
(*
    begin
      result := exp( lnChoose( a, b ) );
    end
  ;
*)


  {*
    Computes the natural log of n choose m, or n!/(m!(n-m!));
    the number of ways that m things can be 'chosen' from a set of n things
    See "Factorials" in GNU Scientific Library Reference Manual.

    @param n n-element set
    @param m m-element subsets
    @return n choose m
    @throws Exception is raised if the GSL can not be accessed and NaN is returned
    @comment GSL documentation does not state limits to avoid overflow, but N max may be 170.
  }
  function lnChoose( const n, m: integer ): double;
    begin
      if( nil = @gsl_sf_lnchoose ) then
        begin
          raise exception.Create( 'Missing or unloaded library function: gsl_sf_lnchoose' );
          result := NaN;
        end
      else
        result := gsl_sf_lnchoose( n, m )
      ;
    end
  ;
  
(*
    begin
      result := lnFactorial( a ) - lnFactorial( b ) - lnFactorial( a - b );
    end
  ;
*)
//-----------------------------------------------------------------------------


  {*
    Calculates the binomial coeffecient for x successes and n trials.
    The approach used in this function is based on a suggestion from
    Press et al., _Numerical Recipes in C_, 2nd ed.

    @param x Number of successes
    @param n Number of trials
    @return binomial coefficient, the number of outcomes that give x successes
    @comment No checking of max input values that will result in overflows
  }
  function binomCoeff( x, n: integer ): extended;
    var
      nf, xf, df: extended;
      d: extended;
    begin
      nf := lnFactorial( n );
      xf := lnFactorial( x );
      df := lnFactorial( n-x );
      d := exp( nf - xf - df );

      if( d < power(2,32) ) then
        result := floor( d + 0.5 )
      else
        result := d
      ;
    end
  ;


  {*
    Calculates the probability of exactly x successes in n
    independent trials where each trial has a probability of p.

    @param x Number of successes
    @param n Number of trials
    @param p trial probability of sucess
    @return probability of exactly x successes
    @comment No checking whether input will result in memory overflow
  }
  function binomProb( x, n: integer; p: double ): extended;
    begin
      if( x = 0 ) then // Probability of exactly 0 requires less calculation
        result := power((1 - p), n )
      else
        result := binomCoeff(x, n) * power(p, x) * power( (1-p), (n-x) )
      ;
    end
  ;

  {*
    Calculates the cumulative probability of x successes (i.e., the
    probability of x or fewer successes) in n independent trials
    where each trial has a probability of p.

    @param x Number of successes
    @param n Number of trials
    @param p trial probability of success
    @return probability of x or fewer successes
    @comment No checking whether input will result in memory overflow
  }
  function cumBinomProb( x, n: integer; p: double ): double;
    var
      i: integer;
      cp: double;
    begin

      cp := 0;

      for i := 0 to x do
        cp := cp + binomProb( i, n, p )
      ;

      result := cp;
    end
  ;


  {*
    Function fills an array as it builds the requested
    cumulative binomial probability, so that several cumulative
    probabilties are provided.  This function is computationally
    more efficient than calling cumBinProb() independently for each
    desired x and n.

    Consider these sample parameters:
    x = 3, n = 4, arr with 4 elements

    Once the function runs, the array will contain the cumulative
    probilities for 0 of 4, 1 of 4, 2 of 4, and 3 of 4.  The return value
    will be the cumulative probability of 3 of 4.

    If the array has only 3 elements, it will contain the cumulative
    probabilities for 0, 1, and 2 of 4.  The return value of the
    function, however, will still be the cumulative probability of 3 of 4.

    @param x Number of successes
    @param n Number of trials
    @param p trial probability of success
    @return cumulative probability of x of n
  }
  function cumBinomProb( x, n: integer; p: double; var arr: array of double ): double;
    var
      i: integer;
      a: integer; // array element counter.
      cp: double; // the cumulative probability
    begin

      cp := 0;
      a := low( arr );

      for i := 0 to x do
        begin
          cp := cp + binomProb( i, n, p );
          //dbcout( intToStr(x) + ' ' + intToStr(n) + ' ' + floatToStr( p ) + ' ' + floatToStr(cp), DBARMATHADVANCED );
          if( a <= high( arr ) ) then
            begin
              arr[a] := cp;
              inc( a );
            end
          ;
        end
      ;

      result := cp;

    end
  ;


  initialization

    setupGSL();

end.
