/*
cprocesslist.h
--------------
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

#ifndef  CPROCESSLIST_H
#define CPROCESSLIST_H

#include <windows.h>
#include <tlhelp32.h>

class CProcessList;


class CProcessListItem {
  public:
    CProcessListItem( PROCESSENTRY32* val );
    virtual ~CProcessListItem( void );
    
    PROCESSENTRY32* value( void );
    
  private:
    PROCESSENTRY32* pValue;
    char* pProcessName;
    CProcessListItem* pNext;
    
  friend class CProcessList;  
};


class CProcessList {
  public:
    CProcessList( void );
    virtual ~CProcessList( void );
    
    bool processExists( const char* appName );
    bool processExists( const unsigned long pid, const unsigned long parentPID = 0 );
    int processCount( const char* appName );
    
    /** Look up a process by its process ID and (optionally) its parent ID. */
    PROCESSENTRY32* lookUp( const unsigned long childPID, const unsigned long parentPID = 0 );
    
    /** Look up a process by its exe name.  
        WARNING: there may be multiple processes with the same exe name. This function only 
        returns the first one that it finds, so use it carefully.  If you want a list
        of all processes with this name, use another function that I haven't written yet... */
    PROCESSENTRY32* lookUp( const char* appName );
  
    void debug( void );
  private: 
    void append( PROCESSENTRY32* val );
    
    CProcessListItem* first( void );
    CProcessListItem* next( void );
    
    CProcessListItem* pFirst;
    CProcessListItem* pLast;
    CProcessListItem* pCurrent;
};

#endif // CPROCESSLIST_H

