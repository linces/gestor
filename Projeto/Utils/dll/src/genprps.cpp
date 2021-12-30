/*
atrconf.cpp
------------
Begin: 2007/03/10
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
#include "stringhandling.h"

BOOL APIENTRY
DllMain (HINSTANCE hInst /* Library instance handle. */ ,
         DWORD reason /* Reason this function is being called. */ ,
         LPVOID reserved /* Not used. */ )
{
  switch (reason)
    {
    case DLL_PROCESS_ATTACH:
      clear_debug_fns();
      initialize_string_memory();
      break;
    case DLL_PROCESS_DETACH:
      free_string_memory();
      break;
    case DLL_THREAD_ATTACH:
      clear_debug_fns();
      initialize_string_memory();
      break;
    case DLL_THREAD_DETACH:
      free_string_memory();
      break;
    }

  /* Returns TRUE on success, FALSE on failure */
  return TRUE;
}

