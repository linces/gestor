{*
FunctionPointers.pas  - accessing methods of Delphi object instances and C dlls
--------------------
Begin: 2005/07/15
Last revision: $Date: 2010-06-12 20:00:05 $ $Author: areeves $
Version number: $Revision: 1.26 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-13
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University
-
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
-
  This unit defines types of function pointers, which are required
  to pass a function pointer as a parameter to another function.
  Methods are defined for member functions of Delphi objects and methods
  to pass a Delphi function pointer to a C DLL or routine. A naming
  convention is established for each of these groups of methods.
-
  Types beginning with 'TObjFn' are member functions of Delphi objects,
  to reference a method of a Delphi object instance.
    Notation is as follows:
    1. TObjFn is the standard function name prefix
    1. return type follows TObjFn (procedure return void, functions return a value of some kind)
    2. number of parameters follows return type
    3. parameter types follows number of parameters
    Example: TObjFnBool2IntString
-
  Types beginning in 'TCFn' may be used to pass a Delphi function pointer to a C DLL or routine
    Notation is as follows: (this is less than ideal, but it is adequate for now).
    1. TCFn is the standard function name prefix
    2. Return type follows TCFn (procedure return void, functions return a value of some kind)
    3. Number of parameters taken by the function is separated by underscore characters
    4. Parameter types are specified in order, in mixed case text, based on the C/C++ type name
    5. Pointers are specified by adding a capital P to the end of the parameter type name
    Example: TCFnBool_1_CharP
}

unit FunctionPointers;

interface

  uses
    MyDelphiArrayUtils
  ;

  (*
    Types beginning with 'TObjFn' are member functions of Delphi objects,
    to reference a method of a Delphi object instance.
    1. TObjFn is the standard function name prefix
    1. return type follows TObjFn (procedure return void, functions return a value of some kind)
    2. number of parameters follows return type
    3. parameter types follows number of parameters
  *)

  type TObjFnBool1Int = function( val: integer ): boolean of object;
  type TObjFnBool2IntString = function( val: integer; str: string = '' ): boolean of object;
  type TObjFnVoid0 = procedure() of object;
  type TObjFnBool0 = function(): boolean of object;
  type TObjFnVoid1Int = procedure( val: integer ) of object;
  type TObjFnVoid1ConstInt = procedure( const val: integer ) of object;
  type TObjFnVoid1String = procedure( val: string ) of object;
  type TObjFnVoid1Bool = procedure( val: boolean ) of object;

  (*
    Types beginning in 'TCFn' may be used to pass a Delphi function pointer to a C DLL or routine
    Notation is as follows: (this is less than ideal, but it is adequate for now).
    1. TCFn is the standard function name prefix
    2. Return type follows TCFn (procedure return void, functions return a value of some kind)
    3. Number of parameters taken by the function is separated by underscore characters
    4. Parameter types are specified in order, in mixed case text, based on the C/C++ type name
    5. Pointers are specified by adding a capital P to the end of the parameter type name
  *)

  // Void functions
  type TCFnVoid_0 = procedure(); cdecl;
  type TCFnVoid_1_Bool = procedure( val: boolean ); cdecl;
	type TCFnVoid_1_CharP = procedure( msg: pchar ); cdecl;
  type TCFnVoid_1_Int = procedure( val: integer ); cdecl;
  type TCFnVoid_1_Pointer = procedure( val: pointer ); cdecl;
  type TCFnVoid_2_CharP_Int = procedure( val1: pchar; val2: integer ); cdecl;
  type TCFnVoid_2_Int_CharP = procedure( val1: integer; val2: pchar ); cdecl;
  type TCFnVoid_2_Int_Double = procedure( val1: integer; val2: double ); cdecl;
  type TCFnVoid_2_Int_Int = procedure( val1, val2: integer ); cdecl;
  type TCFnVoid_3_CharP_CharP_CharP = procedure( val1, val2, val3: pchar ); cdecl;
  type TCFnVoid_3_Int_Int_Double = procedure( val1: integer; val2: integer; val3: double ); cdecl;
  type TCFnVoid_3_Int_Int_Int = procedure( val1, val2, val3: integer ); cdecl;
  type TCFnVoid_5_Int_Int_Int_Int_Int = procedure( val1, val2, val3, val4, val5: integer ); cdecl;

  // Functions that return a bool
  type TCFnBool_0 = function(): boolean; cdecl;
  type TCFnBool_1_CharP = function( val: pchar ): boolean; cdecl;
  type TCFnBool_1_Int = function( val: integer ): boolean; cdecl;

  // Functions that return a char*
  type TCFnCharP_0 = function(): pchar; cdecl;
  type TCFnCharP_1_Cardinal = function( val: cardinal ): pchar; cdecl;
  type TCFnPChar_1_CharP = function( val: pchar ): pchar; cdecl;
  type TCFnPChar_2_CharP_CharP = function( val1, val2: pchar ): pchar; cdecl;

  // Functions that return an int
  type TCFnInt_0 = function(): integer; cdecl;
  type TCFnInt_1_Int = function( val1: integer ): integer; cdecl;
  type TCFnInt_2_Cardinal_Double = function( val1: cardinal; val2: double ): integer; cdecl;
  type TCFnInt_3_Cardinal_Double_Int = function( val1: cardinal; val2: double; val3: integer ): integer; cdecl;
  type TCFnInt_3_Cardinal_Double_Double = function( val1: cardinal; val2, val3: double ): integer; cdecl;
  type TCFnInt_4_Cardinal_Int_Int_Int = function( val1: cardinal; val2, val3, val4: integer ): integer; cdecl;
  type TCFnInt_5_Double_Double_Double_PDouble_PDouble = function( val1, val2, val3: double; val4, val5: pdouble ): integer; cdecl;

  // Functions that return a cardinal (unsigned long int)
  type TCFnCardinal_1_Cardinal = function( val: cardinal ): cardinal; cdecl;

  // Functions that return a pointer
  type TCFnPointer_3_Int_DArr_DArr = function( val: integer; arr1, arr2: TARDoubleArray ): pointer; cdecl;

  // Functions that return a double
  type TCFnDouble_1_Int = function( val1: integer ): double; cdecl;
  type TCFnDouble_1_Pointer = function( val1: pointer ): double; cdecl;
  type TCFnDouble_2_Int_Double = function( val1: integer; val2: double ): double; cdecl;
  type TCFnDouble_2_Cardinal_Double = function( val1: cardinal; val2: double ): double; cdecl;
  type TCFnDouble_2_Cardinal_Pointer = function( val1: cardinal; ptr: pointer ): double; cdecl;
  type TCFnDouble_2_Double_Double = function( val1, val2: double ): double; cdecl;
  type TCFnDouble_2_Double_Pointer = function( val: double; ptr: pointer ): double; cdecl;
  type TCFnDouble_3_Int_Int_Int = function( val1, val2, val3: integer ): double; cdecl;
  type TCFnDouble_3_Int_Double_Double = function( val1: integer; val2, val3: double ): double; cdecl;
  type TCFnDouble_3_Double_Double_Double = function( val1, val2, val3: double ): double; cdecl;
  type TCFnDouble_3_Cardinal_Double_Double = function( val1: cardinal; val2, val3: double ): double; cdecl;
  type TCFnDouble_3_Int_Double_Int = function( val1: integer; val2: double; val3: integer ): double; cdecl;
  type TCFnDouble_4_Double_Double_Double_Double = function( val1, val2, val3, val4: double ): double; cdecl;
  type TCFnDouble_4_Int_Int_Int_Int = function( val1, val2, val3, val4: integer ): double; cdecl;
  type TCFnDouble_4_Cardinal_Double_Double_Double = function( val1: cardinal; val2, val3, val4: double ): double; cdecl;
  type TCFnDouble_5_Double_Double_Double_Double_Double = function( val1, val2, val3, val4, val5: double ): double; cdecl;
  type TCFnDouble_5_Cardinal_Double_Double_Double_Double = function( val1: cardinal; val2, val3, val4, val5: double ): double; cdecl;

implementation

end.
