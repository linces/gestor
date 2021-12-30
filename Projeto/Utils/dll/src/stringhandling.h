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


#ifndef GENPRPS_STRINGHANDLING_H
#define GENPRPS_STRINGHANDLING_H

void initialize_string_memory( void );

void free_string_memory( void );

void set_string( char* str );


#endif // GENPRPS_STRINGHANDLING_H