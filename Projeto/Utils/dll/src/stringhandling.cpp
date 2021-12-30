/*
stringhandling.h
----------------
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

#include "stringhandling.h"

#include "debug.h"

char* theString = NULL;

void initialize_string_memory( void ) {
  theString = NULL;
}


void free_string_memory( void ) {
  if( NULL != theString ) {
    dbcout( "Attempting free_string_memory..." );
    //delete theString;
    //theString = NULL;
    dbcout( "Done free_string_memory" );
  }
}


void set_string( char* str ) {
  dbcout( "Attempting set_string..." );
  if( NULL != theString ) {
    dbcout( "The old string was:" );
    dbcout( theString );
    //delete theString;
    //theString = NULL;
  }
  theString = str;
  dbcout( "The new string is:" );
  dbcout( theString );
  dbcout( "Done set_string" );
}