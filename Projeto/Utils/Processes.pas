{*
Processes.pas  Functions to create processes to run apps from a parent app using the Win API
-------------
Begin: 2005/05/10
Last revision: $Date: 2009-08-27 21:51:58 $ $Author: rhupalo $
Version number: $Revision: 1.11 $
Code Documentation Tags: Begin 2009-08-23, Last Revision: 2009-08-24
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2007 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}


(*
	Some contents of this file are based on code from Dev-C++ 
	(http://www.bloodshed.net/devcpp.html or http://sourceforge.net/projects/dev-cpp).
	Copyright (C) 2004 Bloodshed Software, and released under the terms of the GPL.
  Modifications copyright (C) 2005 - 2007 Animal Population Health Institute, Colorado State University
  Some contents adapted from http://www.chami.com/tips/delphi/031598D.html

  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit Processes;

interface

uses
		Windows,
    WinSvc,
		//System,
		SysUtils
;

  type
    {*
      Procedural Type declaration, accepts an eror message. Used by runAndGetOutput
      @param Msg To return a custom error message 
    }
    TErrFunc = procedure( Msg: String )
  ; // of Object;

	type
    {*
      Procedural Type declaration, accepts a line of text. Used by runAndGetOutput
      @param Line Holds the current line of text of the file being processed
    }
    TLineOutputFunc = procedure( Line: String )
  ; // of Object;

	type
    {*
      Procedural Type declaration, accepts boolean on thread status. Used by runAndGetOutput
      @param AbortThread For callback that monitors whether to terminate the created process
    }
    TCheckAbortFunc = procedure( var AbortThread: boolean )
  ; // of object;

  // These capabilities might be nice to have some day.
  // They are mostly already written: see genprps.dll
  //function processExists( const procID: integer ): boolean;
  //function processExists( const procName: string ): boolean;
  //function processCount( const procName: string ): integer;
  //function processID( const procName: string ): integerList;

  function runProcess( const Cmd, WorkDir: string ): boolean;

  function runProcessTPI( const Cmd, WorkDir: string ):TProcessInformation;

  function runProcessTPIEx( const Cmd; WorkDir: string; hInputRead: THandle; hOutputWrite: THandle; hErrorWrite: THandle ):TProcessInformation;

  // This function would also be nice to have, and should be easy to implement in pure Delphi.
  //function killProcess( const procID: integer ): boolean;

	function runAndGetOutput(
    Cmd: string;
    WorkDir: string;
    ErrFunc: TErrFunc;
    LineOutputFunc: TLineOutputFunc;
    CheckAbortFunc: TCheckAbortFunc;
    ShowReturnValue: Boolean
  ): string;


  function startService( const sService: string ): boolean;

  function stopService( const sService: string ): boolean;

implementation

	//uses
		//Windows,
    //WinSvc,
		//System,
		//SysUtils
	//;

  {*
    Command line execution of a application by creating a new commandline process

    @param Cmd The command line string for running the program
    @param WorkDir Path to current directory for the child process
    @param hInputRead Handle to be used as the standard input handle of the process
    @param hOutputWrite Specifies a handle that will be used as the standard output handle of the process
    @param hErrorWrite Specifies a handle that will be used as the standard error handle of the process
    @return Handle pointing to a PROCESS_INFORMATION structure that receives identification information about the new process
  }
  function runProcessTPIEx( const Cmd; WorkDir: string; hInputRead: THandle; hOutputWrite: THandle; hErrorWrite: THandle ): TProcessInformation;
      var
      tsi: TStartupInfo;
      tpi: TProcessInformation;
      sa: TSecurityAttributes;
      hTempErrorWrite: THandle;
    begin
			sa.nLength := SizeOf( TSecurityAttributes );
			sa.lpSecurityDescriptor := nil;
			sa.bInheritHandle := True;
      FillChar( tsi, SizeOf( TStartupInfo ), 0 );
      tsi.cb := SizeOf( tsi );
      FillChar( tpi, SizeOf( TProcessInformation ), 0 );

			DuplicateHandle(GetCurrentProcess(), hErrorWrite, GetCurrentProcess(), @hTempErrorWrite, 0, true, DUPLICATE_SAME_ACCESS);

      // StartupInfo structure specifying how the main window for the new process should appear
      tsi.cb := SizeOf( TStartupInfo );
      tsi.dwFlags := STARTF_USESTDHANDLES;
      tsi.hStdInput := hInputRead;
      tsi.hStdOutput := hOutputWrite;
      tsi.hStdError := hTempErrorWrite;


      CreateProcess(
        nil,
        PChar(Cmd),
        @sa,
        @sa,
        true,
        DETACHED_PROCESS OR IDLE_PRIORITY_CLASS,
        nil,
        PChar(WorkDir),
        tsi,
        tpi
      );
      CloseHandle( hTempErrorWrite );
      result := tpi;
    end
  ;


  {*
    Command line execution of a application by creating a new commandline process

    @param Cmd The command line string for running the program
    @param WorkDir Path to current directory for the child process
    @return Handle pointing to a PROCESS_INFORMATION structure that receives identification information about the new process
  }
  function runProcessTPI( const Cmd, WorkDir: string ): TProcessInformation;
      var
      tsi: TStartupInfo;
      tpi: TProcessInformation;
    begin
      FillChar( tsi, SizeOf( TStartupInfo ), 0 );
      tsi.cb := SizeOf( tsi );
      FillChar( tpi, SizeOf( TProcessInformation ), 0 );
      (*
      tsi.cb := SizeOf( TStartupInfo );
      tsi.dwFlags := STARTF_USESTDHANDLES;
      tsi.hStdInput := hInputRead;
      tsi.hStdOutput := hOutputWrite;
      tsi.hStdError := hErrorWrite;
      *)

      CreateProcess(
        nil,
        PChar(Cmd),
        nil,
        nil,
        false,
        DETACHED_PROCESS OR IDLE_PRIORITY_CLASS,
        nil,
        PChar(WorkDir),
        tsi,
        tpi
      );

      result := tpi;
    end
  ;


  {*
    Command line execution of a application by creating a new commandline process

    @param Cmd The command line string for running the program
    @param WorkDir Path to current directory for the child process
    @return True if the new process was created else false
  }
  function RunProcess( const Cmd, WorkDir: string ): boolean;
    var
      tsi: TStartupInfo;
      tpi: TProcessInformation;
    begin
      FillChar( tsi, SizeOf( TStartupInfo ), 0 );
      tsi.cb := SizeOf( tsi );
      FillChar( tpi, SizeOf( TProcessInformation ), 0 );
      (*
      tsi.cb := SizeOf( TStartupInfo );
      tsi.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      tsi.hStdInput := hInputRead;
      tsi.hStdOutput := hOutputWrite;
      tsi.hStdError := hErrorWrite;
      *)

      result := CreateProcess(
        nil,
        PChar(Cmd),
        nil,
        nil,
        false,
        DETACHED_PROCESS,
        nil,
        PChar(WorkDir),
        tsi,
        tpi
      );
    end
  ;


  {*
    Command line execution of a application by creating a new commandline process

    @param Cmd The command line string for running the program
    @param WorkDir Path to current directory for the child process
    @param ErrFunc Specifies a handle that will be used as the standard error handle of the process
    @param LineOutputFunc Specifies a handle that will be used as the standard output handle of the process
    @param CheckAbortFunc Callback that monitors whether to terminate the created process
    @param ShowReturnValue If true the process exit code is appended to the output text
    @return Application output text
  }
	function RunAndGetOutput(
				Cmd: string;
				WorkDir: string;
				ErrFunc: TErrFunc;
				LineOutputFunc: TLineOutputFunc;
				CheckAbortFunc: TCheckAbortFunc;
				ShowReturnValue: Boolean
			): string;
		var
			tsi: TStartupInfo;
			tpi: TProcessInformation;
			nRead: DWORD;
			aBuf: array[0..101] of char;
			sa: TSecurityAttributes;
			hOutputReadTmp, hOutputRead, hOutputWrite: THandle;
			hInputWriteTmp, hInputRead, hInputWrite: THandle;
			hErrorWrite: THandle;
			FOutput: string;
			CurrentLine: String;
			bAbort: boolean;
		begin
			FOutput := '';
			CurrentLine := '';
			sa.nLength := SizeOf( TSecurityAttributes );
			sa.lpSecurityDescriptor := nil;
			sa.bInheritHandle := True;

			CreatePipe( hOutputReadTmp, hOutputWrite, @sa, 0 );  
			DuplicateHandle(GetCurrentProcess(), hOutputWrite, GetCurrentProcess(), @hErrorWrite, 0, true, DUPLICATE_SAME_ACCESS);
			CreatePipe(hInputRead, hInputWriteTmp, @sa, 0);

			// Create new output read handle and the input write handle. Set
			// the inheritance properties to FALSE. Otherwise, the child inherits
			// the these handles; resulting in non-closeable handles to the pipes
			// being created.
			DuplicateHandle(GetCurrentProcess(), hOutputReadTmp,  GetCurrentProcess(), @hOutputRead,  0, false, DUPLICATE_SAME_ACCESS);
			DuplicateHandle(GetCurrentProcess(), hInputWriteTmp, GetCurrentProcess(), @hInputWrite, 0, false, DUPLICATE_SAME_ACCESS);
			CloseHandle(hOutputReadTmp);
			CloseHandle(hInputWriteTmp);

			FillChar(tsi, SizeOf(TStartupInfo), 0);
			tsi.cb := SizeOf(TStartupInfo);
			tsi.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
			tsi.hStdInput := hInputRead;
			tsi.hStdOutput := hOutputWrite;
			tsi.hStdError := hErrorWrite;

			if not CreateProcess( nil, PChar(Cmd), @sa, @sa, true, 0, nil, PChar( WorkDir ), tsi, tpi ) then 
				begin
					result := 'Unable to run "' + Cmd + '": ' + SysErrorMessage( GetLastError );
					exit;
				end
			;

			CloseHandle(hOutputWrite);
			CloseHandle(hInputRead );
			CloseHandle(hErrorWrite);

			bAbort := false;

			repeat
				if Assigned( CheckAbortFunc ) then
					CheckAbortFunc( bAbort )
				;

				if bAbort then 
					begin
						TerminateProcess( tpi.hProcess, 1 );
						Break;
					end
				;

				if (not ReadFile( hOutputRead, aBuf, 16, nRead, nil ) ) or ( nRead = 0 ) then
					begin
						if GetLastError = ERROR_BROKEN_PIPE then
							Break
						else
							begin
								//MessageDlg('Pipe read error, could not execute file', mtError, [mbOK], 0);
								ErrFunc('Pipe read error, could not execute file');
							end
						;
					end
				;

				aBuf[nRead] := #0;
				FOutput := FOutput + PChar( @aBuf[0] );

				if Assigned( LineOutputFunc ) then
					begin
						CurrentLine := CurrentLine + PChar(@aBuf[0]);
						
						if CurrentLine[ Length(CurrentLine) ] = #10 then
							begin
								Delete( CurrentLine, Length( CurrentLine ), 1 );
								LineOutputFunc( CurrentLine );
								CurrentLine := '';
							end
						;
					end
				;

			until false;

			GetExitCodeProcess( tpi.hProcess, nRead );

			if ShowReturnValue then
				 Result := FOutput + ' ' + inttostr( nread )
			else
				 Result := FOutput
			;

			CloseHandle( hOutputRead );
			CloseHandle( hInputWrite );
			CloseHandle( tpi.hProcess );
			CloseHandle( tpi.hThread );
		end
	;
  
  
  
  {*
    Starts a Windows Service
    Modified from http://www.chami.com/tips/delphi/031598D.html

    @param sService Name of service
    @return True if the service was started, else false
  }
  function startService( const sService: string ): boolean;
    var
      schm   : SC_Handle;// service control manager handle
      schs   : SC_Handle; // service handle
      ss     : TServiceStatus; // service status
      psTemp : PChar; // temp char pointer
      dwChkP : DWord; // check point
    begin
      //ss.dwCurrentState := -1;

      // connect to the service control manager
      schm := OpenSCManager(
        PChar(''),
        Nil,
        SC_MANAGER_CONNECT);

      // if successful...
      if(schm > 0)then
      begin
        // open a handle to the specified service
        schs := OpenService(
          schm,
          PChar(sService),
          // we want to start the service and
          SERVICE_START or
          // query service status
          SERVICE_QUERY_STATUS);

        // if successful...
        if(schs > 0)then
        begin
          psTemp := Nil;
          if(WinSvc.StartService(
               schs,
               0,
               psTemp))then
          begin
            // check status
            if(QueryServiceStatus(
                 schs,
                 ss))then
            begin
              while(SERVICE_RUNNING
                <> ss.dwCurrentState)do
              begin
                // dwCheckPoint contains a value that the service
                // increments periodically to report its progress during
                // a lengthy operation.
                // 
                // save current value
                dwChkP := ss.dwCheckPoint;

                // wait a bit before checking status again
                // 
                // dwWaitHint is the estimated amount of time the calling
                // program should wait before calling QueryServiceStatus() again
                // 
                // idle events should be handled here...
                Sleep(ss.dwWaitHint);

                if(not QueryServiceStatus(
                     schs,
                     ss))then
                begin
                  // couldn't check status break from the loop
                  break;
                end;

                if(ss.dwCheckPoint <
                  dwChkP)then
                begin
                  // QueryServiceStatus didn't increment dwCheckPoint as it
                  // should have. avoid an infinite loop by breaking
                  break;
                end;
              end;
            end;
          end;

          // close service handle
          CloseServiceHandle(schs);
        end;

        // close service control manager handle
        CloseServiceHandle(schm);
      end;

      // return TRUE if the service status is running
      Result :=
        SERVICE_RUNNING =
          ss.dwCurrentState;
    end
   ;



  {*
    Stops a Windows Service
    Modified from http://www.chami.com/tips/delphi/031598D.html

    @param sService Name of service
    @return True if the service was stopped, else false
  }
  function stopService( const sService: string ): boolean;
    var
      schm   : SC_Handle; // service control manager handle
      schs   : SC_Handle; // service handle
      ss     : TServiceStatus; // service status
      dwChkP : DWord; // check point
    begin
      // connect to the service control manager
      schm := OpenSCManager(
        PChar(''),
        Nil,
        SC_MANAGER_CONNECT);

      // if successful...
      if(schm > 0)then
      begin
        // open a handle to the specified service
        schs := OpenService(
          schm,
          PChar(sService),
          // we want to stop the service and
          SERVICE_STOP or
          // query service status
          SERVICE_QUERY_STATUS);

        // if successful...
        if(schs > 0)then
        begin
          if(ControlService(
               schs,
               SERVICE_CONTROL_STOP,
               ss))then
          begin
            // check status
            if(QueryServiceStatus(
                 schs,
                 ss))then
            begin
              while(SERVICE_STOPPED
                <> ss.dwCurrentState)do
              begin
                // dwCheckPoint contains a value that the service
                // increments periodically to report its progress during
                // a lengthy operation.
                // 
                // save current value
                dwChkP := ss.dwCheckPoint;


                // wait a bit before checking status again
                // 
                // dwWaitHint is the estimated amount of time the calling
                // program should wait before calling QueryServiceStatus() again
                // 
                // idle events should be handled here...
                Sleep(ss.dwWaitHint);

                if(not QueryServiceStatus(
                     schs,
                     ss))then
                begin
                  // couldn't check status break from the loop
                  break;
                end;

                if(ss.dwCheckPoint <
                  dwChkP)then
                begin
                  // QueryServiceStatus didn't increment dwCheckPoint as it
                  // should have. avoid an infinite loop by breaking
                  break;
                end;
              end;
            end;
          end;

          // close service handle
          CloseServiceHandle(schs);
        end;

        // close service control manager handle
        CloseServiceHandle(schm);
      end;

      // return TRUE if the service status is stopped
      Result :=
        SERVICE_STOPPED =
          ss.dwCurrentState;
    end
  ;
  
  
end.
