{* 
  RoundToXReplacement_3c
  By John Herbster, herb-sci1@sbcglobal.net
  Last updated 06/13/2004
  This is a suggested replacement for Math.RoundTo and SimpleRoundTo functions.
}
(*
*****************************************************************************
  Please comments and suggestions to b.p.delphi.language.BASM forum
  and/or Quality Central report #8143 (http://qc.borland.com/wc/qcmain.aspx?d=8143).
-
  Rev. 03/28/2010 by Aaron Reeves, Aaron.Reeves@colostate.edu:
    (1) Added convenience function RoundDbl
    (2) Added convienience function RoundExt
    
  Rev. 06/13/2004 by JH to
    (1) replace TRoundToRange with type integer;
    (2) cause exception if abs(Digits) > 27;
    (3) to cause exception if
        abs(ScaledVal) > (high(Int64) - 2)/10^abs(Digits)
    (4) rename to RoundToXReplacement_3c; 
    (5) to build-in the PowersOfTen array; and
    (6) added function MaxRoundableValue(Digits): extended;
  Rev. 06/08/2004 by JH to replace Elbow64 with RoundUp64 and remove
      Math.Round function code example.  Also improved comments and
      renamed RoundToXReplacement_3b.
  Fix. 06/02/2004 by JH to make work with MaxRelErr = 0.  This required
      a major revision in the logic.  Renamed RoundToXReplacement_3.
  Fix. 05/30/2004 by JH to change name from RoundToXReplacement_1 to
      RoundToXReplacement_2.
  Fix. 05/30/2004 by JH to change j from Integer to Int64.
  Fix. 05/12/2004 by JH to reverse of Digits sign, except on DecimalRound.
  Pgm. 05/12/2004 by John Herbster, herb-sci1@sbcglobal.net,
      281-531-4423, 12807 Park Royal, Houston, TX  77077-2249.
-
*****************************************************************************
*)

{ TODO 3 : Needs testing, like done for the DecimalRounding_JH0 routines. }

{ TODO 3 : Need to resolve name and sign convention for # of decimal digits. }
{ Should the number decimal digits for rounding to cents should be -2 or +2? }

(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
*)

unit RoundToXReplacement_3c;

interface

Type

{ Note that errors would start creeping in, if Digits were to be allowed
  to be outside the -27 .. + 27 range. }

  /// Defined rounding methods} {From DecimalRounding_JH0
  tDecimalRoundingCtrl =
   (drNone,     /// No rounding.
    drHalfEven, /// Round to nearest else to even digit. a.k.a Bankers
    drHalfOdd,  /// Round to nearest else to odd digit.
    drHalfPos,  /// Round to nearest else toward positive.
    drHalfNeg,  /// Round to nearest else toward negative.
    drHalfDown, /// Round to nearest else toward zero.
    drHalfUp,   /// Round to nearest else away from zero.
    drRndNeg,   /// Round toward negative.               a.k.a. Floor
    drRndPos,   /// Round toward positive.               a.k.a. Ceil
    drRndDown,  /// Round toward zero.                   a.k.a. Trunc
    drRndUp);   /// Round away from zero.

function RoundExt( const Value: extended ): integer;

function RoundDbl( const Value: double ): integer;
    
function RoundExtTo (
    const Value: extended;
    const Digits: integer;   {Allowable Digits range: -27 to +27}
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;

function RoundDblTo (
    const Value: double; {This might be type extended}
    const Digits: integer;   {Allowable Digits range: -27 to +27}
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;

function RoundSglTo (
    const Value: single; {This might be type extended}
    const Digits: integer;   {Allowable Digits range: -27 to +27}
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;

Function DecimalRound(
    const Value: extended;
    const Digits: integer;   {Allowable Digits range: -27 to +27}
    const MaxRelErr: double; {Must be non-negative}
    const Ctrl: tDecimalRoundingCtrl = drHalfEven)
    : extended;
{ The DecimalRounding function is for doing the best possible job of rounding
  floating binary point numbers to the specified (Digits) number of decimal
  fraction digits.  MaxRelErr is the maximum relative error that will allowed
  when determining when to apply the rounding rule.  This is the workhorse
  function called by the other rounding functions above. }

function MaxRoundableValue(
    const Digits: integer   {Allowable Digits range: -27 to +27}
    ): extended;

Const
  /// Not used here!  Must REM out for DelphiCodeToDoc v23B, does not parse "; end = ("
  DecimalRoundingCtrlStrs: array [tDecimalRoundingCtrl] of
      record Abbr: string[9]; Dscr: string[59]; end = (
    (Abbr: 'None'    ; Dscr: 'No rounding.'),
    (Abbr: 'HalfEven'; Dscr: 'Round to nearest or to even digit'),
    (Abbr: 'HalfOdd' ; Dscr: 'Round to nearest or to odd digit'),
    (Abbr: 'HalfPos' ; Dscr: 'Round to nearest or toward positive'),
    (Abbr: 'HalfNeg' ; Dscr: 'Round to nearest or toward negative'),
    (Abbr: 'HalfDown'; Dscr: 'Round to nearest or toward zero'),
    (Abbr: 'HalfUp'  ; Dscr: 'Round to nearest or away from zero'),
    (Abbr: 'RndNeg'  ; Dscr: 'Round toward negative. (a.k.a. Floor)'),
    (Abbr: 'RndPos'  ; Dscr: 'Round toward positive. (a.k.a. Ceil)'),
    (Abbr: 'RndDown' ; Dscr: 'Round toward zero. (a.k.a. Trunc)'),
    (Abbr: 'RndUp'   ; Dscr: 'Round away from zero.') );

{$WRITEABLECONST OFF}

{ The following "epsilon" values are representative of the resolution of the
  floating point numbers divided by the number being represented.  These
  constants are supplied to the rounding routines to determine how much
  correction should be allowed for the natural errors in representing the
  decimal fractions.  For safety it is advised to use a multiple of these
  values for data that have been massaged through arithmetic calculations. }
Const
  SglEps = 1.1920928955e-07; /// corr factor for singles to rounding routines, use multiple of this
  DblEps = 2.2204460493e-16; /// corr factor for doubles to rounding routines, use multiple of this
  ExtEps = 1.0842021725e-19; /// corr factor for extendeds to rounding routines, use multiple of this
{ The above epsilon values are approximations to the smallest power of two
  for which "1 + epsilon <> 1".  For "1 - epsilon <> 1", divide the above
  values by 2. }
  KnownErrorLimit = 1.234375; /// If MaxRelErr < XxxEps * KnownErrorLimit, then errors in DecimalRound() can be demonstrated
{ If MaxRelErr < XxxEps * KnownErrorLimit where XxxEps is the appropriate
  SGLEpx, DblEps, or ExtEps for the data being rounding, then errors in
  the DecimalRound function can be demonstrated. }
{ Limit (minimum) comparison limits: }
  LimRelErrSgl = SglEps * KnownErrorLimit;  /// Minimum comparison limit for singles
  LimRelErrDbl = DblEps * KnownErrorLimit;  /// Minimum comparison limit for doubles
  LimRelErrExt = ExtEps * KnownErrorLimit;  /// Minimum comparison limit for extendeds
{ Standard comparison limits: }
  SafetyFactor = 4;  /// Supposedly the standard comparison limit, yet the standard input param value is 2 ...
  MaxRelErrSgl = SglEps * KnownErrorLimit * SafetyFactor; /// Standard comparison limit for singles
  MaxRelErrDbl = DblEps * KnownErrorLimit * SafetyFactor; /// Standard comparison limit for doubles
  MaxRelErrExt = ExtEps * KnownErrorLimit * SafetyFactor; /// Standard comparison limit for extendeds

function Floor64(const X: Extended): Int64;
{ For abs(x) < high(Int64), Floor64 returns the most positive integer value
  less than or equal to X. }

function Ceil64(const X: Extended): Int64;
{ For abs(x) < high(Int64), Ceil64 returns the lowest integer value greater
  than or equal to X. }

function RoundUp64(const x: extended): Int64;
{ For abs(x) < high(Int64), this is like the Trunc function, except that
  RoundUp64 rounds away from zero instead of toward it. }

implementation

Uses SysUtils, Math;

{*
  Rounds X up returns an integer, for abs(x) < high(Int64)
  @param X Input numeric, a floating point number
  @return The lowest integer value greater than or equal to X.
}
function Ceil64(const X: Extended): Int64;
begin
  Result := Trunc(X);
  if Frac(X) > 0
    then Inc(Result);
end;

{*
  Truncates X and returns an integer, for abs(x) < high(Int64)
  @param X Input numeric, a floating point number
  @return The most positive integer value less than or equal to X
  @comment Rounds towards 0
}
function Floor64(const X: Extended): Int64;
begin
  Result := Trunc(X);
  if Frac(X) < 0
    then Dec(Result);
end;

{ TODO 2 : Need to rewrite Ceil64 and Floor64 with BASM code. }

{*
  Rounds X up and returns an integer, for abs(x) < high(Int64)
  @param X Input numeric, a floating point number
  @return The lowest integer value greater than or equal to X.
  @comment Like the Trunc function, except it rounds away from zero instead of toward it.
}
function RoundUp64(const x: extended): Int64;
begin
  Result := trunc(x) + Math.Sign(frac(x));
end;


function RoundExt( const Value: extended ): integer;
begin
  result := trunc( roundExtTo( value, 0 ) );
end;

function RoundDbl( const Value: double ): integer;
begin
  result := trunc( roundDblTo( value, 0 ) );
end;

{*
  Rounding function for rounding extended type floating point numbers
  to the specified (Digits) number of decimal fraction digits.

  @param Value Input double type floating point number
  @param Digits Desired decimal fractional digits to round to
  @param Ctrl One of the rounding method enumerations of tDecimalRoundingCtrl
  @param SafetyFactor The maximum relative error that will allowed when determining when
  to apply the rounding rule, must be positive.
  @return Rounded extended floating point number
}
function RoundExtTo
   (const Value: extended;
    const Digits: integer;
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;
begin
  Result := DecimalRound(Value,-Digits,LimRelErrExt*SafetyFactor,Ctrl);
end;

{*
  Rounding function for rounding extended type floating point numbers
  to the specified (Digits) number of decimal fraction digits.

  @param Value Input double type floating point number
  @param Digits Desired decimal fractional digits to round to
  @param Ctrl One of the rounding method enumerations of tDecimalRoundingCtrl
  @param SafetyFactor The maximum relative error that will allowed when determining when
  to apply the rounding rule, must be positive.
  @return Rounded double type floating point number
}
function RoundDblTo
   (const Value: double; {This might be type extended}
    const Digits: integer;
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;
begin
  Result := DecimalRound(Value,-Digits,LimRelErrDbl*SafetyFactor,Ctrl);
end;

{*
  Rounding function for rounding single type floating point numbers
  to the specified (Digits) number of decimal fraction digits.

  @param Value Input double type floating point number
  @param Digits Desired decimal fractional digits to round to
  @param Ctrl One of the rounding method enumerations of tDecimalRoundingCtrl
  @param SafetyFactor The maximum relative error that will allowed when determining when
  to apply the rounding rule, must be positive.
  @return Rounded single type floating point number
}
function RoundSglTo
   (const Value: single; {This might be type extended}
    const Digits: integer;
    const Ctrl: tDecimalRoundingCtrl = drHalfEven;
    const SafetyFactor: double = 2)
    : extended;
begin
  Result := DecimalRound(Value,-Digits,LimRelErrExt*SafetyFactor,Ctrl);
end;

type
  /// Record used by IsNAN() to hold input parameter before evaluation
  TExtPackedRec = packed record
    Man: Int64;  /// to hold input parmaeter of IsNan(), hopefully a real number
    Exp: word;    /// never assigned but used in IsNAN() evaluation ...
  end;

const ExtExpBits: word = $7FFF; /// 15 bits, used by IsNAN function

{ TODO 2 : Maybe calls to this IsNaN can be replaced by calls to Math.IsNaN. }

{*
  Private function, checks if input to DecimalRound() is a number and <> 0
  @param ext Expecting a real number
  @return True if ext is a number, else false
}
Function IsNAN (const ext: extended): boolean;
var InputX: TExtPackedRec absolute ext;
begin
  Result := (InputX.Man <> 0) and ((InputX.Exp and ExtExpBits)=ExtExpBits);
end;

Const
  /// Holds 28 values, 1e00 - 1e27 for MaxRoundedVlue() calculation
  PowersOfTen: array [0..27] of extended = (
    1e00,1e01,1e02,1e03,1e04,1e05,1e06,1e07,1e08,1e09,
    1e10,1e11,1e12,1e13,1e14,1e15,1e16,1e17,1e18,1e19,
    1e20,1e21,1e22,1e23,1e24,1e25,1e26,1e27);
  /// The value 2^63-3, the max extended value applied in MaxRoundableValue()
  MaxScaledValue: extended = (high(Int64) - 2);

 {*
   Returns result of 2^63-3 / 1eDigits
   @param Digits Allowable digits, ranging from 0 - 27
   @return Max roundable value for N Digits
   @comment No error checking of Digits, could raise array bounds error
 }
function MaxRoundableValue(
    const Digits: integer {Allowable Digits range: -27 to +27})
    : extended;
begin
  Result := MaxScaledValue/PowersOfTen[abs(Digits)];
end;

{*
  For doing the best possible job of rounding floating binary point numbers to
  the specified (Digits) number of decimal fraction digits.
  This is the workhorse function called by the other rounding functions.

  @param Value Input floating point number
  @param Digits Desired decimal fractional digits to round to
  @param MaxRelErr The maximum relative error that will allowed when determining when
  to apply the rounding rule, must be positive.
  @param Ctrl One of the rounding method enumerations of tDecimalRoundingCtrl
  @return Rounded floating point number
}
Function DecimalRound (
    const Value: extended;
    const Digits: integer;   {Allowable Digits range: -27 to +27}
    const MaxRelErr: double; {Must be non-negative}
    const Ctrl: tDecimalRoundingCtrl = drHalfEven): extended;

var RndedVal, j: Int64; Scale, ScaledVal, ScaledErr: extended;
    Negate: boolean; Ctrl2: tDecimalRoundingCtrl;

begin

  If IsNaN(Value) or (Ctrl = drNone)
    then begin Result := Value; EXIT end;

  If (MaxRelErr < 0)
    then raise Exception.Create('DecimalRound: MaxRelErr must be >= 0.');

  If (abs(Digits) > 27)
    then raise Exception.Create('DecimalRound: Digits must be in -27 to +27 range.');

{ Scale the value to be rounded: }
  Scale := PowersOfTen[abs(Digits)];
  If Digits >= 0
    then ScaledVal := Value * Scale
    else ScaledVal := Value / Scale;
  Assert(MaxRelErr >= 0,
      'DecimalRound: MaxRelErr < 0');
  ScaledErr := abs(ScaledVal) * MaxRelErr;

{ Negate if negative and rounding is to be symmetrical about 0: }
  Negate := (ScaledVal < 0) and
            (Ctrl in [drHalfDown,drHalfUp,drRndDown,drRndUp]);
  If Negate
    then ScaledVal := - ScaledVal;

{ Check ScaledVal size before the trunc, floor, or ceil checks it: }
  If (abs(ScaledVal) > MaxScaledValue)
    then raise Exception.Create('DecimalRound: Scaled value is too large to round.');

{ Check for bankers rounding and set Ctrl2: }
  If not (Ctrl in [drHalfEven,drHalfOdd])
    then Ctrl2 := Ctrl
    else begin
      j := floor64(ScaledVal);
      If odd(j) xor (Ctrl = drHalfEven)
        then Ctrl2 := drHalfNeg  {Ceil64 (ScaledVal - 0.5 - ScaledErr)}{OK}
        else Ctrl2 := drHalfPos; {Floor64(ScaledVal + 0.5 + ScaledErr)}{OK}
      end;

{ Branch to do the different roundings: }
  Case Ctrl2 of
    drRndPos,drRndUp:
      RndedVal := Ceil64 (ScaledVal - ScaledErr);       {OK}
    drHalfNeg,drHalfDown:
      RndedVal := Ceil64 (ScaledVal - 0.5 - ScaledErr); {OK}
    drRndNeg,drRndDown:
      RndedVal := Floor64(ScaledVal + ScaledErr);       {OK}
    drHalfPos,drHalfUp:
      RndedVal := Floor64(ScaledVal + 0.5 + ScaledErr); {OK}
    else RndedVal := trunc(ScaledVal); {This line should never be executed.}
    end;

{ Finally convert back to the right order and correct negation: }
  If Digits >= 0
    then Result := RndedVal / Scale
    else Result := RndedVal * Scale;
  If Negate
    then Result := - Result;

end{DecimalRound};

end{RoundToXReplacement_3c}.

