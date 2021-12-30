{*
NetworkUtils.pas - Obtaining network drives, ports, and http content
----------------
Begin: 2006/05/31
Last revision: $Date: 2010-06-25 19:41:11 $ $Author: areeves $
Version: $Revision: 1.11 $
Code Documentation Tags: Begin 2009-08-18, Last Revision: 2009-08-19
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2006 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
*)

unit NetworkUtils;

interface

  uses
    Classes,
    SysUtils
  ;

  // Functions for Windows network operations
  //-----------------------------------------
  { Fill a list of mapped network drives. }
  function GetNetworkDriveMappings( driveList: TStrings ): integer;

  { Indicates whether a specified path is a network path or on a network drive.
  This function DOES NOT indicate whether the path is accessible! }
  function isNetworkDrive( const path: string ): boolean;


  // Functions for TCP/IP network operations
  //----------------------------------------
  { Determine the computer's IP address }
  function localIPAddress(): string;

  { Is the specified local port available?
    NOTE: this function requires genprps.dll }
  function portIsAvailable( const port: integer ): boolean;


  // Classes and functions for HTTP connections
  //-------------------------------------------


  type
    {*
      Type to hold returned content and whether the http request was a success
      @param success Whether the http get request was a success
      @param returnedText HTTP text content of URL
    }
    TObjFnEndGetSimpleHTTPText = procedure( success: boolean; returnedText: string ) of object;

  type
    /// Http client for requesting a url and storing the returned page (text) content
    TSimpleHTTPThread = class( TThread )
      protected
        _returnedText: string;                /// HTTP contents at _url
        _success: boolean;                    /// Whether _url was successfully retrieved

        _url: string;                          /// web content sought
        _userAgent: string;                   /// information for http request header

        _endFn: TObjFnEndGetSimpleHTTPText;   /// object to hold returned content and status of request

        procedure getSimpleHTTPText();
        procedure endFn();

        procedure execute(); override;
      public
        constructor create( CreateSuspended: Boolean; url, userAgent: string; fn: TObjFnEndGetSimpleHttpText ); reintroduce;
      end
    ;


  function networkDllLoadErrors(): string;


implementation

  uses
    Windows,
    IdHTTP,
    WinSock,
    StrUtils,

    MyStrUtils,
    DebugWindow,
    FunctionPointers
  ;

  const
    DBSHOWMSG: boolean = false; /// Set to true to enable debugging messages for this unit

  var
    dllLoadErrors: string;             /// Check hear for error comments if atrConfLoaded is false
    atrConfLoaded: boolean;            /// Status indicating whether loading the dll and locating the functions suceeded
    _portIsAvailable: TCFnBool_1_Int;  /// for function pointer to dll accepting a port number and returning whether it is available

//-----------------------------------------------------------------------------
// Functions for Windows network operations
//-----------------------------------------------------------------------------
  {*
    Fill a list of mapped network drives.
    Modified from http://www.chami.com/tips/delphi/112896D.html.

    Sample usage:
      driveList := TStringList.Create();
      nMappingsCount := GetNetworkDriveMappings( driveList );
      for i := 0 to nMappingsCount - 1 do
        MessageBox( 0, PChar( driveList.Strings[ i ] ), 'Network drive mappings', MB_OK )
      ;
      driveList.Free();

    @param driveList Function populates list with up to 26 mapped drives
    @return Count of the number of mapped drives
  }
  function GetNetworkDriveMappings( driveList: TStrings ): integer;
    var
      i: integer;
      sNetPath: string;
      dwMaxNetPathLen: DWord;
    begin
      driveList.Clear();
      dwMaxNetPathLen := MAX_PATH;
      SetLength( sNetPath, dwMaxNetPathLen );

      for i := 0 to 25 do
        begin
          if( NO_ERROR = Windows.WNetGetConnection( PChar( '' + Chr( 65 + i ) + ':' ), PChar( sNetPath ), dwMaxNetPathLen ) ) then
            driveList.Add( Chr( 65 + i ) + ': ' + sNetPath )
          ;
        end
      ;
      Result := driveList.Count;
    end
  ;

  {*
    Determines if the drive of path is a network drive

    @param path Path to some resource
    @return True if the resource is on a network drive, else false
  }
  function isNetworkDrive( const path: string ): boolean;
    var
      driveList: TStringList;
      driveLetter: string;
      i: integer;
    begin
      result := false;

      driveLetter := leftStr( fixup( path ), 1 );

      driveList := TStringList.Create();

      getNetworkDriveMappings( driveList );

      for i := 0 to driveList.Count - 1 do
        begin
          if( leftStr( fixup( driveList.Strings[i] ), 1 ) = driveLetter ) then
            begin
              result := true;
              break;
            end
          ;
        end
      ;
      driveList.Free();
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Functions for TCP/IP network operations
//-----------------------------------------------------------------------------


  {*
    Get the local IP Address of system
    Based on code from http://www.experts-exchange.com/Programming/Languages/Pascal/Delphi/Q_20780234.html

    @return Local IP address
  }
  function localIPAddress(): string;
    var wsdata : TWSAData;
        he : PHostEnt;
        ss : pchar;
        ip : TInAddr;
        i  : cardinal;
        co : string;
    begin
      i := MAX_COMPUTERNAME_LENGTH + 1;
      SetLength(co,i);
      GetComputerName(PChar(co),i);
      WSAStartup(MakeWord(1, 1), wsdata);
      he := gethostbyname(pchar(co));
      if he<>nil then begin
        ip.S_addr := integer(pointer(he^. h_addr_list^)^);
        ss := inet_ntoa(ip);
        Result := string(ss);
      end;
      WSACleanup();
    end
  ;

  {*
    Checks if a particular port is available

    @param port Port number of interest
    @return True is port is open, else false
    @throws Raises exception if the library  genprps.dll is not loaded
  }
  function portIsAvailable( const port: integer ): boolean;
    begin
      if( nil <> @_portIsAvailable ) then
        result := _portIsAvailable( port )
      else
        begin
          raise exception.create( 'DLL not loaded: function portIsAvailable() cannot be called.' );
          result := false;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Classes and functions for HTTP connections
//-----------------------------------------------------------------------------

  {*
    Background thread for HTTP processing
    This thread class is based on code by Marco Cantu:
    see Mastering Delphi 7 chapter 19, or http://www.marcocantu.com/md7

    @param CreateSuspended If true, Resume must be called before execution, else Execute is called immediatley
    @param url URL to search for and retrieve
    @param userAgent The name of the browser client for the HTTP request header or 'User-Agent: NULL'
    @param fn Type holding a boolean of whether the page was located and a string for the URL contents
  }
  constructor TSimpleHTTPThread.create( CreateSuspended: Boolean; url, userAgent: string; fn: TObjFnEndGetSimpleHttpText );
    begin
      inherited create( CreateSuspended );
      FreeOnTerminate := True;
      
      _url := url;
      _userAgent := userAgent;
      _endFn := fn;
    end
  ;


  {*
    Calls getSimpleHTTPText() when the thread is executed.
    Thread executes when Create is called if CreateSuspended set to false, or
    when Resume is first called after the thread is created if CreateSuspended set to true.
  }
  procedure TSimpleHTTPThread.execute();
    begin
      getSimpleHTTPText();
      synchronize( endFn );
    end
  ;


  {*
    Implements an HTTP Client to get _url.
    If sucessfull then _returnedText is filled with the requested content
    and _success is true, else _success is false and _returnedText is ''
  }
  procedure TSimpleHTTPThread.getSimpleHTTPText();
    var
      Http1: TIdHTTP;
    begin
      Http1 := TIdHTTP.Create( nil );
      http1.ReadTimeout := 5000; // Milliseconds
      dbcout( Http1.ReadTimeout, DBSHOWMSG );

      try
        try
          if( 0 < length( _userAgent ) ) then Http1.Request.UserAgent := 'User-Agent: ' + _userAgent;
          _returnedText := Http1.Get( _url );
          _success := true;
        except
          _returnedText := '';
          _success := false;
        end;
      finally
        Http1.Free();
      end;

    end
  ;

  {*
    If the pointer is not empty, then the private variables
    _success and _returnedText are filled.
  }
  procedure TSimpleHTTPThread.endFn();
    begin
      if( nil <> @_endFn ) then _endFn( _success, _returnedText );
    end
  ;
//-----------------------------------------------------------------------------



//*****************************************************************************
// DLL Loading
//*****************************************************************************

  {*
    Wrapper around unit variable holding error messages generated in loadAtrConfDLL()
    @return Error messages from attempting to load genprps.dll
  }
  function networkDllLoadErrors(): string;
    begin
      result := dllLoadErrors;
    end
  ;

  // Dynamic loading takes more code than static loading,
  // but it is far more graceful when it doesn't work.

  {*
     Loads genprps.dll and checks for several function names

     @comment The unit variable atrconfLoaded can be checked to see if the
     dll loaded and all checks were successful. If atrconfLoaded returns false
     then check myStrUtilsDllLoadErrors for specifics about what went wrong.
  }
  procedure loadAtrConfDLL();
     var
      success: boolean;
      dllHandle: THandle; //Handle used to open the DLL.  Defined in unit Windows.
      setDebugFn: procedure( fn: TCFnVoid_1_CharP ); cdecl;
    begin
      // Initialize global variables and pointers
      //-----------------------------------------
      atrconfLoaded := false; // will be set to true if all functions are properly loaded.
      dllLoadErrors := ''; // messages will be added if there are problems
      @_portIsAvailable := nil;
      @setDebugFn := nil;

      // Load the DLL
      //-------------
      try
        dllHandle := loadLibrary( 'genprps.dll' );
        success := true;
        dbcout( 'loadLibrary genprps.dll successful.', DBSHOWMSG );
      except
        dllHandle := 0;
        success := false;
        dbcout( 'loadLibrary genprps.dll failed.', DBSHOWMSG );
      end;

      if( success ) then
        begin
          _portIsAvailable := GetProcAddress( dllHandle, 'portIsAvailable' );
          if( nil = @_portIsAvailable ) then
            begin
              dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION: portIsAvailable.';
              success := false;
            end
          ;

          setDebugFn := GetProcAddress( dllHandle, 'setDebugFn' );
          if( nil <> @setDebugFn ) then
          	begin
              if( DBSHOWMSG ) then
          		  setDebugFn( @cdbcout )
              else
                setDebugFn( nil )
              ;
            end
          else
          	begin
          		dllLoadErrors := dllLoadErrors + endl + 'MISSING FUNCTION setDebugFn';
              success := false;
            end
          ;

        end
      ;

      atrconfLoaded := success;
    end
  ;
//*****************************************************************************

initialization

  loadAtrConfDLL();


end.


