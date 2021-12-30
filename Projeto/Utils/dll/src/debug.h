/*
debug.h
-------
Begin: 2007/03/12
Last revision: $Date: 2007-03-26 05:05:44 $ $Author: areeves $
Version: $Revision: 1.2 $
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2007 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*/


#ifndef GENPRPS_DEBUG_H
#define GENPRPS_DEBUG_H

#ifdef DLL_EXPORTS
# define DLL_API extern "C" __declspec( dllexport )
#elif defined(DLL_IMPORTS)
# define DLL_API extern "C" __declspec( dllimport )
#else
# define DLL_API
#endif



// Function pointer types
//-----------------------
typedef void (*TFnVoid_1_CharP) (char *);


// Function pointers
//------------------
extern TFnVoid_1_CharP gui_debug;


// Functions used to set the function pointers
//--------------------------------------------
DLL_API void setDebugFn( TFnVoid_1_CharP fn) ;


// Helper functions (not exported by the DLL)
//-------------------------------------------
void clear_debug_fns( void );
void dbcout( char* msg );


#endif // GENPRPS_DEBUG_H