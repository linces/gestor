{*
WindowsDebugging.pas  - disables Windows fault reporting for an application
--------------------
Begin: 2008/03/11
Last revision: $Date: 2009-08-26 21:49:40 $ $Author: rhupalo $
Version: $Revision: 1.4 $
Code Documentation Tags: Begin 2009-08-26, Last Revision: 2009-08-26
Project: APHI General Purpose Delphi Library: Windows debugging and fault reporting for Delphi
Website: http://www.naadsm.org/opensource/delphi
Author: Shaun Case <Shaun.Case@Colostate.edu>
------------------------------------------------------
Copyright (C) 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

   This unit is known to work on Windows XP, but has not been tested on other
   versions of Windows.  (It 'should' function with Vista also.)
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit WindowsDebugging;

interface

  uses
    Windows, 
    Messages, 
    SysUtils, 
    Variants, 
    Classes, 
    Graphics, 
    Controls, 
    Forms,
    Dialogs, 
    
    DebugWindow
  ;

  // If this function returns false, the DLL didn't load and these classes cannot be used.
  function faultRepDllLoaded( msg: pstring = nil ): boolean;

  //  This function disables fault reporting for the application mentioned in the parameter szApplication
  //  Registry testing shows that the path is removed from the szApplication parameter when it is added
  //  to the Registry for the registry key: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting\ExclusionList.
  //  This would imply, then, that any application with the executable name specified, regardless of its location
  //  on the hard drive will be excluded. 
  function wdAddERExcludedApplication( szApplication: String ): Boolean;

implementation

  const
    SHOWDEBUGMSG: boolean = false; /// set to true to enable debugging messages for this unit.

  var
    loadErrors: string; /// Any error messages trying to load dll or access dll function

    /// Pointer to dll function AddERExcludedApplicationA
    pAddERExcludedApplication: function( szApplication: PChar ): Boolean; stdcall;

    qFaultRepLoaded: boolean;  /// Status on whether fault reporting dll is loaded



//*****************************************************************************
// Calling the AddERExcludedApplication function in the DLL
//*****************************************************************************

  {*
    Disables fault reporting for szApplication by adding it to the Registry under
    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting\ExclusionList

    @param szApplication Full path to application
    @comment Requires faultrep.dll to be loaded
    @return True if registry entry is sucessful, else false
    @throws Raises exception if the entry attempt fails
  }
  function wdAddERExcludedApplication( szApplication: String ): Boolean;
    var
      ret_val: Boolean;
    begin
      ret_val := false;

      if ( faultRepDllLoaded() ) then
        begin
          if ( assigned ( pAddERExcludedApplication ) ) then
            ret_val := pAddERExcludedApplication( PChar( szApplication  ) )
          ;
        end
      ;

      if ( not ret_val ) then
        raise exception.create( 'Internal Function: pAddERExcludedApplication not assigned.  DLL is not yet loaded!!!' )
      ;

      result := ret_val;
    end
    ;
//*****************************************************************************


//*****************************************************************************
// Checking the DLL
//*****************************************************************************

  {*
    Checks to see if the faultrep.dll loaded

    @param msg Address of msg. Function call takes the form:
    var
      msg: string;
    ok := faultRepDllLoaded(@msg);
    if not ok then showmessage(msg);

    @return If false, the DLL didn't load and these classes cannot be used,
    check msg for reason.
  }
  function faultRepDllLoaded( msg: pstring = nil ): boolean;
    begin
      result :=
        qFaultRepLoaded
      ;

      if( nil <> msg ) then
        msg^ := msg^ + loadErrors
      ;
    end
  ;
//*****************************************************************************


  //---------------------------------------------------------------------------
  // FaultRep: Loading function pointers from the DLL
  //---------------------------------------------------------------------------

    {*
      Assigns function pointer to dll function AddERExcludedApplicationA .
      Called from loadDynamicDLL(). If this fails a message is added to loadErrors.

      @param dllHandle Handle to faultrep.dll
    }
    procedure loadFaultRepDLL( dllHandle: THandle );
      var
        result: boolean;
      begin
        result := true;

        dbcout( 'Attempting to set function pointers in loadFaultRepDLL...', SHOWDEBUGMSG );

        pAddERExcludedApplication := GetProcAddress( dllHandle, 'AddERExcludedApplicationA' );

        if( not assigned( pAddERExcludedApplication ) ) then
          begin
            loadErrors := loadErrors + 'MISSING FUNCTION: AddERExcludedApplication.';
            result := false;
          end
        ;

        qFaultRepLoaded := result;
      end
    ;
  //---------------------------------------------------------------------------
//*****************************************************************************


//*****************************************************************************
// DLL Loading
//*****************************************************************************
  // Dynamic loading takes more code than static loading,
  // but it is far more graceful when it doesn't work.

  /// Attempts to Load faultrep.dll, result message sent to dbcout
  procedure loadDynamicDLL();
     var
      dllHandle: THandle; //Handle used to open the DLL.  Defined in unit Windows.
    begin
      try
        dllHandle := loadLibrary( 'faultrep.dll' );
        dbcout( 'loadLibrary faultrep.dll successful.', SHOWDEBUGMSG );
      except
        dllHandle := 0;
        dbcout( 'loadLibrary faultrep.dll failed.', SHOWDEBUGMSG );
      end;

      if( dllHandle >= 32 ) then // library was successfully loaded.  Assign function pointers now.
        begin
          loadFaultRepDLL( dllHandle );
        end
      ;
    end
  ;
//*****************************************************************************

initialization
  loadErrors := '';

  qFaultRepLoaded := false;

  loadDynamicDLL();

end.
 