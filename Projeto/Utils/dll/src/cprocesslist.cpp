/*
cprocesslist.cpp
----------------
Begin: 2007/03/25
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
Modified code Copyright (C) 2007 Animal Population Health Institute, Colorado State University
*/

#include "stdafx.h" // VC++ crap.  Get rid of it to compile with MingGW/GCC.

#include <ctype.h>

#include "cprocesslist.h"

#ifdef DEBUG
  #include <iostream>
  using namespace std;
#endif


char* newLowerCaseCharArray( char* val ) {
  unsigned long size = strlen( val ) + 1;
  char* result = new char[ size ];
  memset( result, 0, size );

  for( unsigned int i = 0; i < size; ++i ) {
    result[i] = tolower( val[i] );
  }

  return result;
}


CProcessListItem::CProcessListItem(  PROCESSENTRY32* val ) {
  pValue = val;
  pProcessName = newLowerCaseCharArray( pValue->szExeFile );
  pNext = NULL;
}


CProcessListItem::~CProcessListItem( void ) {
  delete pValue;
  delete pProcessName;
  pValue = NULL;
}


PROCESSENTRY32* CProcessListItem::value( void ) {
  return this->pValue;
}


CProcessList::CProcessList( void ) {
  PROCESSENTRY32 *processInfo;
  HANDLE hSnapShot;

  pFirst = NULL;
  pCurrent = NULL;
  pLast = NULL;

  processInfo = new PROCESSENTRY32;
  processInfo->dwSize = sizeof( PROCESSENTRY32 );

  // Take a snapshot
  hSnapShot = CreateToolhelp32Snapshot( TH32CS_SNAPPROCESS, 0 );

  while( Process32Next( hSnapShot, processInfo ) != false ) {
    this->append( processInfo );
    processInfo = new PROCESSENTRY32;
    processInfo->dwSize = sizeof( PROCESSENTRY32 );
  }

  CloseHandle( hSnapShot );
}


CProcessList::~CProcessList( void ) {
  CProcessListItem* i;

  for( i = this->first(); i != NULL; i = this->next() ) {
    delete i;
  }
}


CProcessListItem* CProcessList::first( void ) {
  pCurrent = pFirst;
  return pFirst;
}


CProcessListItem* CProcessList::next( void ) {
  if( NULL == pCurrent ) {
    return NULL;
  }
  else {
    pCurrent = pCurrent->pNext;
    return pCurrent;
  }
}


void CProcessList::append( PROCESSENTRY32* val ) {
  CProcessListItem* item = new CProcessListItem( val );

  if( NULL == pFirst ) {
    pFirst = item;
    pLast = pFirst;
  }
  else {
    pLast->pNext = item;
    pLast = item;
  }
}


void CProcessList::debug( void ) {
  #ifdef DEBUG
    CProcessListItem* i;

    for( i = this->first(); i != NULL; i = this->next() ) {
      cout << i->value()->szExeFile << " has processID " << i->value()->th32ProcessID << endl;
    }
  #endif
}


PROCESSENTRY32* CProcessList::lookUp( const unsigned long pid, const unsigned long parentPID ) {
  CProcessListItem* i;
  PROCESSENTRY32* processInfo;

  // Look up the desired process ID
  for( i = this->first(); NULL != i; i = this->next() ) {
    processInfo = i->value();

    if( processInfo->th32ProcessID == pid && parentPID == 0 ) {
      return processInfo;
      break;
    }
    else if( processInfo->th32ProcessID == pid && processInfo->th32ParentProcessID == parentPID ) {
      return processInfo;
      break;
    }
  }

  // if no match is found...
  return NULL;
}



PROCESSENTRY32* CProcessList::lookUp( const char* appName ) {
  CProcessListItem* i;
  PROCESSENTRY32* processInfo;
  char* toFind;
  char* processName = NULL;
  PROCESSENTRY32* result = NULL;

  toFind = newLowerCaseCharArray( (char*)appName );

  for( i = this->first(); NULL != i; i = this->next() ) {
    processInfo = i->value();

    processName = newLowerCaseCharArray( processInfo->szExeFile );

    if( 0 == strcmp( processName, toFind ) ) {
      result = processInfo;
      break;
    }

    delete processName;
    processName = NULL;
  }

  delete toFind;
  delete processName;

  return result;
}


bool CProcessList::processExists( const char* appName ) {
  return( NULL != lookUp( appName ) );
}


bool CProcessList::processExists( const unsigned long pid, const unsigned long parentPID ) {
  return( NULL != lookUp( pid, parentPID ) );
}


int CProcessList::processCount( const char* appName ) {
  CProcessListItem* i;
  PROCESSENTRY32* processInfo;
  char* toFind;
  char* processName = NULL;
  int result = 0;

  toFind = newLowerCaseCharArray( (char*)appName );

  for( i = this->first(); NULL != i; i = this->next() ) {
    processInfo = i->value();

    processName = newLowerCaseCharArray( processInfo->szExeFile );

    if( 0 == strcmp( processName, toFind ) ) {
      ++result;
    }

    delete processName;
    processName = NULL;
  }

  delete toFind;
  delete processName;

  return result;
}



