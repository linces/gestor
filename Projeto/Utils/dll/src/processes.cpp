/*
processes.cpp
-------------
Begin: 2007/03/12
Last revision: $Date: 2007-03-26 05:05:03 $ $Author: areeves $
Version: $Revision: 1.1 $
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Contents of this file are based on and adapted from code written for the Atriplex Distributed
Computing System by Aaron Reeves, and released under the terms of the GNU General Public License.

Original code Copyright (C) 2007 Aaron Reeves and Reeves Digital Development
Modifications Copyright (C) 2007 Animal Population Health Institute, Colorado State University
*/

#include "stdafx.h" // VC++ crap.  Get rid of it to compile with MingGW/GCC.

#include "processes.h"

#include "cprocesslist.h"

DLL_API bool processExistsByName( const char* appName ) {
  bool result;
  CProcessList* c = new CProcessList();
  result = c->processExists( appName );
  delete c;
  return result;
}


DLL_API bool processExistsByID( const unsigned long pid ) {
  bool result;
  CProcessList* c = new CProcessList();
  result = c->processExists( pid );
  delete c;
  return result;
}


DLL_API bool processExistsByIDAndParent( const unsigned long pid, const unsigned int parentPID ) {
  bool result;
  CProcessList* c = new CProcessList();
  result = c->processExists( pid, parentPID );
  delete c;
  return result;
}


DLL_API int processCount( const char* appName ) {
  int result;
  CProcessList* c = new CProcessList();
  result = c->processCount( appName );
  delete c;
  return result;
}


#ifdef UNDEFINED_FOR_TESTING
int main( void ) {
  CProcessList* list;
  PROCESSENTRY32* found;

  // Test basic list operations
  //---------------------------
  list = new CProcessList();
  list->debug();
  cout << endl << endl;

  // Test the ability to find a particular process by its process ID
  ///---------------------------------------------------------------
  int idToFind = 4256; // Change this to something that you actually want to find...

  found = list->lookUp( idToFind );
  if( NULL == found ) {
    cout << "Cannot find process " << idToFind << endl;
  }
  else {
    cout << "Process with ID " << idToFind << " is " << found->szExeFile << endl;
  }

  // Test the ability to find a particular process by its exe name
  ///-------------------------------------------------------------
  char* exeName = "ApacheMonitor.exe"; // Change this to something that you actually want to find...
  found = list->lookUp( exeName );
  if( NULL == found ) {
    cout << "Cannot find process " << exeName << endl;
  }
  else {
    cout << "Process " << exeName << " has processID " << found->th32ProcessID << endl;
  }

  // Test the ability to count processes
  //------------------------------------
  exeName = "devcpp.exe";
  int nFound = list->processCount( exeName );
  if( 1 == nFound ) {
    cout << "There is " << nFound << " process currently running with the name " << exeName << endl;
  }
  else {
    cout << "There are " << nFound << " processes currently running with the name " << exeName << endl;
  }

  delete list;

  // Test the DLL functions
  //-----------------------
  if( !( processExistsByID( idToFind ) ) ) {
    cout << "Cannot find process " << idToFind << " using processExists()" << endl;
  }
  else {
    cout << "Process with ID " << idToFind << " exists, according to processExists()" << endl;
  }

  exeName = "ApacheMonitor.exe";
  if( !( processExistsByName( exeName ) ) ) {
    cout << "Cannot find process " << exeName << " using processExists()" << endl;
  }
  else {
    cout << "Process " << exeName << " exists, according to processExists()" << endl;
  }

  exeName = "devcpp.exe";
  nFound = processCount( exeName );
  if( 1 == nFound ) {
    cout << "There is " << nFound << " process currently running with the name " << exeName << " according to processCount()" << endl;
  }
  else {
    cout << "There are " << nFound << " processes currently running with the name " << exeName << " according to processCount()" << endl;
  }
}
#endif
