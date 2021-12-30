/*
encr.h
------
Begin: 2007/03/12
Last revision: $Date: 2007-03-26 05:05:44 $ $Author: areeves $
Version: $Revision: 1.2 $
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Contents of this file are based on and adapted from code written for the Atriplex Distributed 
Computing System by Aaron Reeves, and released under the terms of the GNU General Public License.

Original code Copyright (C) 2003 - 2007 Aaron Reeves
Modifications Copyright (C) 2007 Animal Population Health Institute, Colorado State University 
*/


#ifndef GENPRPS_ENCR_H
#define GENPRPS_ENCR_H


#ifdef DLL_EXPORTS
# define DLL_API  extern "C" __declspec( dllexport ) 
#elif defined(DLL_IMPORTS)
# define DLL_API extern "C" __declspec( dllimport )
#else
# define DLL_API
#endif



DLL_API char* rc4Encrypt( char* str, char* password );
DLL_API char* hexEncode( char* str );
DLL_API char* hexDecode( char* str );



#endif // GENPRPS_ENCR_H


 