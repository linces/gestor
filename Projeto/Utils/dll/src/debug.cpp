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


#include "stdafx.h"

#include "debug.h"


TFnVoid_1_CharP gui_debug;



DLL_API void setDebugFn (TFnVoid_1_CharP fn) {
  // Once this gui_debug has been set, don't let a subsequent call to setDebugFn change it.
  if( NULL == gui_debug )
    gui_debug = fn;
  else
    dbcout( "attempt made to reset gui_debug" );
}


void clear_debug_fns( void ) {
  gui_debug = NULL;
}


void dbcout( char* msg )
{
  char msg2[512];
  
  if( NULL != gui_debug ) {
    sprintf( msg2, "genprps.dll: %s", msg );
    gui_debug( msg2 );
  }
}


