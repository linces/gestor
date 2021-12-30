{*
WindowsUtils.pas - Creating shortcuts, browser dialogs, and obtaining info about the user and OS
-----------------
Begin: 2005/01/07
Last revision: $Date: 2012-10-23 22:27:16 $ $Author: areeves $
Version: $Revision: 1.28 $
Code Documentation Tags: Begin 2009-08-27, Last Revision: 2009-08-27
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2012 Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

{$INCLUDE Defs.inc}

unit WindowsUtils;

interface

	uses
  	SysUtils,
    Registry,
    Windows,
    ShellAPI,
    ShlObj,
    Classes
  ;

  // Basic file operations
  //----------------------
  // Creates or overwrites destFile with sourceFile, if sourceFile exists.
	function windowsCopyFile( sourceFileName, destFileName: string ) : boolean;

  //function fileExists(const FileName: string): Boolean;  // in SysUtils
  //function directoryExists( const FileName: string ): boolean // in SysUtils
  //function deleteFile( constFileName: string): boolean;  // in SysUtils??


  // Determining key directory paths
  //---------------------------------
	// Returns the location of the Windows temporary directory.
	function tempDir(): String;

  // Returns the path of the current directory, with a trailing backslash.
  function currentDir(): string;

  // Returns the path where the running executable is.
  function appDir(): string;

  // Returns the path of the WINDOWS directory.
  function windowsDir(): string;

  // Returns the path of the WINDOWS SYSTEM directory.
  function windowsSystemDir(): string;

  // Returns the path of the PROGRAM FILES directory.
  function programFilesDir(): string;


  // Working with temporary files
  //-----------------------------
  // Creates a temporary file and returns its path name.  See usage comments below.
  function tempFileName( folder: string = ''; createFile: boolean = false ): TFileName;


  // Files and directories
  //----------------------
  // Fills list with all files in path
  procedure getAllFileList( path: string; attr: integer; list: TStringList );

  // Creates a list of all files with the extention ".fileExt" in directory dir, recursing the specified number of subdirectories
  function createFileList( dir: string; fileExt: string; dirRecurseLevel: integer = 0 ): TStringList;

  // Fills list with all directories contained in dir
  procedure GetAllSubdirectories(const dir: string; list: TStringList);
  function createDirectoryList( const dir: string; recurseLevel: integer = 0 ): TStringList;

  // Websites, etc.
  //---------------
  procedure followWebLink( const link: string );

  // File attributes
  //----------------
  {$WARNINGS OFF}
  // Returns whether a file is read-only.
  function fileIsReadOnly( const fileName: string ): boolean;

  // Is the indicated path a directory?
  function isDirectory( const pathName: string ): boolean;

  // Sets a file's read-only status to true.
  procedure setFileReadOnly( const fileName: string );

  // (Attempts to) set a file's read-only status to false.
  procedure setFileReadWrite( const fileName: string );

  // Returns file size in bytes.
  function getFileSize( const fileName: string ): integer;
  {$WARNINGS ON}


  // Directory permissions
  //----------------------
  function canWriteToDirectory( const dir: string ): boolean;


  // Windows registry
  //-----------------
  function GetRegistryData(RootKey: HKEY; Key, Value: string): variant;
  procedure SetRegistryData( RootKey: HKEY; Key, Value: string; RegDataType: TRegDataType; Data: variant );


  // Windows version
  //----------------
  const
    { operating system (OS)constants }
    cOsUnknown = -3;      /// OS unknown
    cOsUnknown9x = -2;    /// OS 9.x
    cOsUnknownNT = -1;    /// OS WIN NT unknown type
    cOsWin95 = 0;         /// OS WIN 95
    cOsWin98 = 1;         /// OS WIN 98
    cOsWin98SE = 2;       /// OS WIN 98 SE
    cOsWinME = 3;         /// OS WIN ME
    cOsWinNT = 4;         /// OS WIN NT
    cOsWin2000 = 5;       /// OS WIN 2000
    cOsXP = 6;            /// OS WIN XP
    cOs2003 = 7;          /// OS WIN 2003
    cOsVista = 8;         /// OS WIN Vista

  function GetOperatingSystem(): Integer; // Returns one of the above constants
  function getShortOSVersionText(): string;
  function GetOSVersionText(): string;


  // Creating shortcuts
  //-------------------
  type
    /// Places for locating a Shortcut
    ShortcutType = (
      ShortcutDesktop,
      ShortcutQuickLaunch,
      ShortcutSendTo,
      ShortcutStartMenu,
      ShortcutStartMenuPrograms,
      ShortcutOtherFolder
    );

  function CreateShortcut(
    SourceFileName: string;    // the file the shortcut points to
    Location: ShortcutType;    // shortcut location
    Description: string;       // description property of the shortcut
    SubFolder: string = '';    // subfolder of location
    WorkingDir: string = '';   // working directory property of the shortcut
    Parameters: string = ''
  ): string;


  // Users and their permissions
  //-----------------------------
  function currentUserName(): string;
  function userIsAdministrator(): boolean; //returns true for admins (or Win95/98/ME)


  // Computer name
  //--------------
  function computerName(): string;


  // Memory usage
  //-------------
  function GetProcessMemorySize(_sProcessName: string; var _nMemSize: Cardinal): Boolean;
  function getCurrentProcessMemorySize(): cardinal;

  // Some other stuff
  //-----------------
  type
    /// Objectives of a browsing event
    TBrowseFlag = (
      BFFolders = BIF_RETURNONLYFSDIRS,     /// Param value used by BrowseDialog; show only folders
      BFFiles = BIF_BROWSEINCLUDEFILES,     /// Param value used by BrowseDialog; show files to
      BFComputers = BIF_BROWSEFORCOMPUTER,  /// Param value used by BrowseDialog; Browse for computers
      BFPrinters = BIF_BROWSEFORPRINTER     /// Param value used by BrowseDialog; Browse for printeers
    );

  { Return value is the selected path, or an empty string if no path is selected. }
  function BrowseDialog( const Title: string; const BFlag: TBrowseFlag ): string;

implementation

  uses
    ActiveX,
    ComObj,
    psAPI,
  
    Forms,

    StrUtils,

    MyStrUtils
  ;


//-----------------------------------------------------------------------------
// Determining key directory paths
//-----------------------------------------------------------------------------
  {*
    Get the path to the current directory
    @return the path of the current directory, with a trailing backslash.
  }
  function currentDir(): string;
  	begin
    	result := getCurrentDir();
      if( rightStr( result, 1 ) <> '\' ) then
      	result := result + '\'
      ;
    end
  ;


  {*
    Get path to the running application
    Based on http://www.efg2.com/Lab/Library/Delphi/IO/Directories.htm
    @return the path to the running executable
  }
  function appDir(): string;
  	begin
    	result := ExtractFilePath( Paramstr(0) );
      if( rightStr( result, 1 ) <> '\' ) then
      	result := result + '\'
      ;
    end
  ;

  {*
    Get the location of the Windows temporary directory
    Based on http://delphi.about.com/cs/adptips2000/a/bltip0900_5.htm
    @return Path to the Windows temporary directory.
  }
  function tempDir(): String;
    var
      lng: DWORD;
      thePath: string;
    begin
      SetLength( thePath, MAX_PATH );
      lng := GetTempPath( MAX_PATH, PChar( thePath ) );
      SetLength( thePath, lng );

      // FIX ME: with a trailing backslash, or not?

      result := thePath;
    end
  ;

  {
  An alternative function for retrieving the temp directory.
  By Ernesto de Spirito: see http://www.latiumsoftware.com/en/delphi/00017.php
  }
  (*
  function GetTempDir: TFileName;
    var
      TmpDir: array [0..MAX_PATH-1] of char;
    begin
      try
        SetString(Result, TmpDir, GetTempPath(MAX_PATH, TmpDir));
        if not DirectoryExists(Result) then
          if not CreateDirectory(PChar(Result), nil) then begin
            Result := IncludeTrailingBackslash(GetWindowsDir) + 'TEMP';
            if not DirectoryExists(Result) then
              if not CreateDirectory(Pointer(Result), nil) then begin
                Result := ExtractFileDrive(Result) + '\TEMP';
                if not DirectoryExists(Result) then
                  if not CreateDirectory(Pointer(Result), nil) then begin
                    Result := ExtractFileDrive(Result) + '\TMP';
                    if not DirectoryExists(Result) then
                      if not CreateDirectory(Pointer(Result), nil) then begin
                        raise Exception.Create(SysErrorMessage(GetLastError));
                      end;
                  end;
              end;
          end;
      except
        Result := '';
        raise;
      end;
  end
  ;
  *)


  {*
    Get the path of the WINDOWS directory.
    Modified from http://www.latiumsoftware.com/en/delphi/00017.php
    @return Path to the WINDOWS directory
  }
  function windowsDir(): string;
    var
      winDir: array [0..MAX_PATH-1] of char;
    begin
      SetString( result, WinDir, GetWindowsDirectory(winDir, MAX_PATH) );
      if( 0 = length( result ) ) then
        raise Exception.Create(SysErrorMessage(GetLastError))
      ;
      if( rightStr( result, 1 ) <> '\' ) then
      	result := result + '\'
      ;
    end
  ;



  {*
    Get the path of the WINDOWS SYSTEM directory.
    Modified from http://www.latiumsoftware.com/en/delphi/00017.php
    @return Path of the WINDOWS SYSTEM directory
  }
  function windowsSystemDir(): string;
    var
      sysDir: array [0..MAX_PATH-1] of char;
    begin
      SetString( result, sysDir, GetSystemDirectory(sysDir, MAX_PATH) );
      if( 0 = length( result ) ) then
        raise Exception.Create(SysErrorMessage(GetLastError))
      ;
      if( rightStr( result, 1 ) <> '\' ) then
      	result := result + '\'
      ;
    end
  ;


  {*
    Get the path of the PROGRAM FILES directory.
    Modified from http://www.latiumsoftware.com/en/delphi/00017.php
    @return Path of the PROGRAM FILES directory
  }
  function programFilesDir(): string;
    begin
      result := GetRegistryData( HKEY_LOCAL_MACHINE, '\Software\Microsoft\Windows\CurrentVersion', 'ProgramFilesDir' );
      // 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ProgramFilesPath' is equivalent.
      if( rightStr( result, 1 ) <> '\' ) then
      	result := result + '\'
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Creating a temporary file
//-----------------------------------------------------------------------------
  {
  Creates a temporary file and returns its path name.
  Based on http://www.latiumsoftware.com/en/delphi/00027.php

  This temporary file is not deleted automatically by Windows, so the application
  is responsible for deleting the files created with this function when it no
  longer needs them. For example you can use a code like this:

  procedure TForm1.Button1Click(Sender: TObject);
  var
    TempFileName: TFileName;
  begin
    TempFileName := CreateTempFile;
    try
      // Open the file
      // Use the file
      // Close the file
    except
      try
        // Close the file if opened
      finally
        SysUtils.DeleteFile(TempFileName);
      end;
    end;
  end;

  @return: TFileName (actually just a string)
  }

  {*
     Create a temporary file on disk or create a temporary file full path name

     @param folder Path to folder where you want to create the temp file. If
     folder is an empty string then the WINDOWS temp folder will be used
     @param createFile If true the file is actually created, else it is not
     @return Full pathname for a temporary file
     @throws Raise an exception showing the system error message if creating the file fails
     @comment The function always creates the temp file, but if createFile is false
     then the temporary file is deleted. This is useful because if the target directory
     is read-only or does not exist, then an exception will be raised when the system
     attempts to create the file. 
  }
  function tempFileName( folder: string = ''; createFile: boolean = false ): TFileName;
    var
      tempFileName: array [0..MAX_PATH-4] of char; // leave an extra 3 characters at the front for my own purposes
    begin

    	if( '' = folder ) then folder := tempDir();

      if( 0 =  GetTempFileName( PChar( folder ), '~', 0, TempFileName ) ) then
        raise Exception.Create( SysErrorMessage( GetLastError ) )
      ;

      if( not createFile ) then deleteFile( tempFileName );

      result := tempFileName;
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Files and directories
//-----------------------------------------------------------------------------
  procedure getAllFileList( path: string; attr: integer; list: TStringList );
    var
      Res: TSearchRec;
      EOFound: Boolean;
    begin
      EOFound:= False;

      if( rightStr( Path, 1 ) <> '\' ) then
        Path := Path + '\'
      ;

      if( 0 > FindFirst( Path + '*.*', Attr, Res ) ) then
        exit
      else
        begin
          while( not EOFound ) do
            begin
              if( (res.Name <> '.') AND (res.Name <> '..') ) then
                List.Add(Res.Name)
              ;
              EOFound := ( 0 <> FindNext( Res ) );
            end
          ;
        end
      ;

      SysUtils.FindClose( Res );
    end
  ;


  procedure GetAllSubdirectories(const dir : string; list : TStringList) ;
    var
      sr : TSearchRec;
      str: string;
    begin
        try
        if( 0 > FindFirst(IncludeTrailingPathDelimiter(dir)+ '*.*', faDirectory, sr) ) then
          Exit
        else
          begin
            repeat
              if ((sr.Attr and faDirectory <> 0) AND (sr.Name <> '.') AND (sr.Name <> '..')) then
                begin
                  str := IncludeTrailingPathDelimiter(dir) + sr.Name + '\';
                  List.append( str ) ;
                end
              ;
            until FindNext(sr) <> 0;
          end
        ;
      finally
        SysUtils.FindClose(sr) ;
      end;

    end
  ;


  function createDirectoryList( const dir: string; recurseLevel: integer = 0 ): TStringList;
    var
      sr : TSearchRec;
      str: string;
      list: TStringList;
      subList: TStringList;
      i: integer;
    begin

      list := TStringList.Create();

      try
        if( 0 > FindFirst(IncludeTrailingPathDelimiter(dir)+ '*.*', faDirectory, sr) ) then
          begin
            result := list;
            exit;
          end
        else
          begin
            repeat
              if ((sr.Attr and faDirectory <> 0) AND (sr.Name <> '.') AND (sr.Name <> '..')) then
                begin
                  str := IncludeTrailingPathDelimiter(dir) + sr.Name + '\';
                  List.append( str ) ;
                  if( 0 <> recurseLevel ) then
                    begin
                      subList := createDirectoryList( str, ( recurseLevel - 1 ) );
                      for i := 0 to subList.count - 1 do
                        list.Append( subList.strings[i] )
                      ;
                      subList.Free();
                    end
                  ;
                end
              ;
            until FindNext(sr) <> 0;
          end
        ;
      finally
        SysUtils.FindClose(sr);
        result := list;
      end;
    end
  ;

  // Creates a list of all files with the extention ".fileExt" in directory dir,
  // recursing the specified number of subdirectories.
  // File extension of ".*' will include all files.
  function createFileList( dir: string; fileExt: string; dirRecurseLevel: integer = 0 ): TStringList;
    var
      dirList: TStringList;
      tmpDirList: TStringList;
      fileList: TStringList;
      tmpFileList: TStringList;
      i, j: integer;
      //k: integer;
      dotExt: string;
      path: string;
    begin
      if( '.' <> leftStr( fileExt, 1 ) ) then
        dotExt := fixup( '.' + fileExt )
      else
        dotExt := fixup( fileExt )
      ;

      fileList := TStringList.Create();

      if( rightStr( dir, 1 ) <> '\' ) then
        dir := dir + '\'
      ;

      // Create the list of directories, recursing if necessary to include subdirectories.
      dirList := TStringList.Create();
      dirList.Append( dir );

      if( 0 <> dirRecurseLevel ) then
        begin
          tmpDirList := createDirectoryList( dir, dirRecurseLevel );
          for i := 0 to tmpDirList.Count - 1 do
            dirList.Append( tmpDirList.Strings[i] )
          ;
          tmpDirList.Free();
        end
      ;

      (*
      dbcout2( 'Directories...' );
      for i := 0 to dirList.Count - 1 do
        dbcout2( dirList.Strings[i] )
      ;
      *)

      tmpFileList := TStringList.Create();

      for i := 0 to dirList.Count - 1 do
        begin
          getAllFileList( dirList.Strings[i], faAnyFile, tmpFileList );

          (*
          dbcout2( 'All files...' );
          for k := 0 to tmpFileList.Count - 1 do
            dbcout2( tmpFileList.Strings[k] )
          ;
          *)

          for j := 0 to tmpFileList.count - 1 do
            begin
              path := directory( dirList.Strings[i] ) + tmpFileList.Strings[j];
              if( '.*' = dotExt ) then
                begin
                  if( not( isDirectory( path ) ) ) then
                    fileList.Append( path )
                  ;
                end
              else if( dotExt = fixup( rightStr( tmpFileList.Strings[j], 4 ) ) ) then
                fileList.Append( path )
              ;
            end
          ;

          tmpFileList.Clear();
        end
      ;

      tmpFileList.Free();

      (*
      dbcout2( endl + 'Selected files:' );
      for i := 0 to fileList.Count - 1 do
       dbcout2( fileList.Strings[i] )
      ;
      *)

      result := fileList;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Copying a file
//-----------------------------------------------------------------------------
  {*
    Creates or overwrites destFile with sourceFile, if sourceFile exists.
    @param sourceFileName Full path to file that will be the source for destFileName
    @param destFileName Full path to file to be created or over-written
    @return Returns true on success, false on failure.
  }
  function WindowsCopyFile( sourceFileName, destFileName: string ) : boolean;
    var
      copyFailed: boolean;
    begin
      copyFailed := false;

      if FileExists( PChar( sourceFileName ) ) then
        begin
          // Screen.Cursor := crHourGlass;
          deleteFile( PChar( destFileName ) );
          CopyFile( PChar( sourceFileName ), PChar( destFileName ), copyFailed );
          // Screen.Cursor := crDefault;
        end
      ;

      result := not copyFailed;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Internet, etc.
//-----------------------------------------------------------------------------

  {*
    Opens the URL link with your default web browser
    @param link A web page address
  }
  procedure followWebLink( const link: string );
    begin
      ShellExecute(
        Application.Handle,
        PChar( 'open' ),
        PChar( link ),
        PChar( 0 ),
        nil,
        SW_NORMAL
      );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// File attributes: read-only vs. read-write
//-----------------------------------------------------------------------------
  {$WARNINGS OFF}

  {*
    Determines if fileName is read-only
    @param fileName Full path to a file
    @return True if the file is currently read-only else false
  }
  function fileIsReadOnly( const fileName: string ): boolean;
    begin
      result :=( ( fileGetAttr( fileName ) and faReadOnly ) > 0 );
    end
  ;

  {*
    Determines if path is a directory
    @param path Full path to a file or directory
    @return True if the path is a directory
  }
  function isDirectory( const pathName: string ): boolean;
    begin
      result :=( ( fileGetAttr( pathName ) and faDirectory ) > 0 );
    end
  ;


  {*
    Sets fileName to be read-only
    @param fileName Full path to a file
  }
  procedure setFileReadOnly( const fileName: string );
    begin
      fileSetAttr( fileName, ( fileGetAttr( fileName ) and ( faReadOnly ) ) );
    end
  ;


  {*
    Sets fileName to be read-write
    @param fileName Full path to a file
  }
  procedure setFileReadWrite( const fileName: string );
    begin
      fileSetAttr( fileName, ( fileGetAttr( fileName ) and not( faReadOnly ) ) );
    end
  ;

  {*
    Determines file size
    @param fileName Full path to a file
    @return File size in bytes
  }
  function getFileSize( const fileName: string ): integer;
    var
      searchResult: TSearchRec;
      val: integer;
    begin
      val := sysUtils.findFirst( fileName, faAnyFile, searchResult );
      if( 0 = val ) then
        result := searchResult.Size
      else
        result := -1
      ;
      sysUtils.findClose( searchResult );
    end
  ;
  {$WARNINGS ON}
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
  // Directory permissions
//-----------------------------------------------------------------------------

  {*
    Determines whether Dir can be written to
    @param Dir Full path to the directory
    @return True if possible else false
    @comment Actually tests write access by attempting
    to create and then delete a temp file in Dir
  }
  function canWriteToDirectory( const dir: string ): boolean;
    begin
      try
        tempFileName( dir );
        result := true;
      except
        result := false;
      end;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for determinining Windows version.
// Based on work by Chris Stone and Nico Bendlin.
// See http://www.swissdelphicenter.ch/torry/showcode.php?id=316
// Also see http://www.delphidabbler.com/articles?article=23
//
// Note: these functions may not be foolproof: see
// http://17slon.com/blogs/gabr/2007/02/four-ways-to-detect-vista.html
//-----------------------------------------------------------------------------

  {*
    Determines the Windows Operating System
    @return Integer corresponding to 1 of 12 WIN OS constants,
    see documentation of the constants in the interface section of this unit
    @comment The function getShortOSVersionText returns an interpretable name
    for each OS constant rather than an integer
  }
  function GetOperatingSystem(): Integer;
  var
    osVerInfo: TOSVersionInfo;
    majorVer, minorVer: Integer;
  begin
    { set operating system type flag }
    osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
    if GetVersionEx(osVerInfo) then
    begin
      majorVer := osVerInfo.dwMajorVersion;
      minorVer := osVerInfo.dwMinorVersion;
      case osVerInfo.dwPlatformId of
        VER_PLATFORM_WIN32_NT: { Windows NT/2000/XP }
          begin
            if majorVer <= 4 then
              Result := cOsWinNT
            else if (majorVer = 5) and (minorVer = 0) then
              Result := cOsWin2000
            else if (majorVer = 5) and (minorVer = 1) then
              Result := cOsXP
            else if (majorVer = 5) and (minorVer = 2) then
              result := cOs2003
            else if( majorVer = 6) then
              result := cOsVista
            else
              Result := cOsUnknownNT;
          end;
        VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
          begin
            if (majorVer = 4) and (minorVer = 0) then
              Result := cOsWin95
            else if (majorVer = 4) and (minorVer = 10) then
            begin
              if osVerInfo.szCSDVersion[1] = 'A' then
                Result := cOsWin98SE
              else
                Result := cOsWin98;
            end
            else if (majorVer = 4) and (minorVer = 90) then
              Result := cOsWinME
            else
              Result := cOsUnknown;
          end;
        else
          Result := cOsUnknown9x;
      end;
    end
    else
      Result := cOsUnknown;
  end;


  {*
    Determines the Windows Operating System
    @return A name corresponding to the Windows OS version
  }
  function getShortOSVersionText(): string;
    var
      vers: integer;
    begin
      vers := getOperatingSystem();

      result := 'Unknown';

      case vers of
        cOsUnknown: result := 'Unknown';
        cOsUnknown9x: result := 'Unknown 9x';
        cOsUnknownNT: result := 'Unknown NT';
        cOsWin95: result := 'Windows 95';
        cOsWin98: result := 'Windows 98';
        cOsWin98SE: result := 'Windows 98SE';
        cOsWinME: result := 'Windows ME';
        cOsWinNT: result := 'Windows NT 4';
        cOsWin2000: result := 'Windows 2000';
        cOsXP: result := 'Windows XP';
        cOs2003: result := 'Windows Server 2003';
        cOsVista: result := 'Windows Vista';
      end;
    end
  ;


  {************************************************}
  { Function to detect OS Version by Nico Bendlin  }
  { Modified to detect Vista (A. Reeves, 3/8/2007) }
  {************************************************}

  {$IFDEF CONDITIONALEXPRESSIONS}
    {$IF Defined(TOSVersionInfoEx)}
      {$DEFINE TOSVERSIONINFOEX_DEFINED}
    {$IFEND}
  {$ENDIF}
  {$IFNDEF TOSVERSIONINFOEX_DEFINED}

  type
    /// Pointer to TOSVersionInfoEx record
    POSVersionInfoEx = ^TOSVersionInfoEx;

    /// Record to hold information about the Operating System version
    TOSVersionInfoEx = packed record
      dwOSVersionInfoSize: DWORD;
      dwMajorVersion     : DWORD;
      dwMinorVersion     : DWORD;
      dwBuildNumber      : DWORD;
      dwPlatformId       : DWORD;
      szCSDVersion       : array [0..127] of AnsiChar;
      wServicePackMajor  : Word;
      wServicePackMinor  : Word;
      wSuiteMask         : Word;
      wProductType       : Byte;
      wReserved          : Byte;
    end;

  const
    VER_SERVER_NT                       = $80000000;
    {$EXTERNALSYM VER_SERVER_NT}
    VER_WORKSTATION_NT                  = $40000000;
    {$EXTERNALSYM VER_WORKSTATION_NT}
    VER_SUITE_SMALLBUSINESS             = $00000001;
    {$EXTERNALSYM VER_SUITE_SMALLBUSINESS}
    VER_SUITE_ENTERPRISE                = $00000002;
    {$EXTERNALSYM VER_SUITE_ENTERPRISE}
    VER_SUITE_BACKOFFICE                = $00000004;
    {$EXTERNALSYM VER_SUITE_BACKOFFICE}
    VER_SUITE_COMMUNICATIONS            = $00000008;
    {$EXTERNALSYM VER_SUITE_COMMUNICATIONS}
    VER_SUITE_TERMINAL                  = $00000010;
    {$EXTERNALSYM VER_SUITE_TERMINAL}
    VER_SUITE_SMALLBUSINESS_RESTRICTED  = $00000020;
    {$EXTERNALSYM VER_SUITE_SMALLBUSINESS_RESTRICTED}
    VER_SUITE_EMBEDDEDNT                = $00000040;
    {$EXTERNALSYM VER_SUITE_EMBEDDEDNT}
    VER_SUITE_DATACENTER                = $00000080;
    {$EXTERNALSYM VER_SUITE_DATACENTER}
    VER_SUITE_SINGLEUSERTS              = $00000100;
    {$EXTERNALSYM VER_SUITE_SINGLEUSERTS}
    VER_SUITE_PERSONAL                  = $00000200;
    {$EXTERNALSYM VER_SUITE_PERSONAL}
    VER_SUITE_BLADE                     = $00000400;
    {$EXTERNALSYM VER_SUITE_BLADE}
    VER_SUITE_EMBEDDED_RESTRICTED       = $00000800;
    {$EXTERNALSYM VER_SUITE_EMBEDDED_RESTRICTED}
    VER_SUITE_SECURITY_APPLIANCE        = $00001000;
    {$EXTERNALSYM VER_SUITE_SECURITY_APPLIANCE}

  const
    VER_NT_WORKSTATION              = $0000001;
    {$EXTERNALSYM VER_NT_WORKSTATION}
    VER_NT_DOMAIN_CONTROLLER        = $0000002;
    {$EXTERNALSYM VER_NT_DOMAIN_CONTROLLER}
    VER_NT_SERVER                   = $0000003;
    {$EXTERNALSYM VER_NT_SERVER}

  {$ENDIF}  // TOSVERSIONINFOEX_DEFINED

  {*
     Helper function used by GetOSVersionText(). Makes call to Windows.pas GetVersionEx() to fill Info
     @param Info TOSVersionInfoEx record that is filled, if call GetVersionEx fails
     then Info.dwOSVersionInfoSize is 0.
     @return True if OS information can be provided, else false
  }
  function GetOSVersionInfo(var Info: TOSVersionInfoEx): Boolean;
  begin
    FillChar(Info, SizeOf(TOSVersionInfoEx), 0);
    Info.dwOSVersionInfoSize := SizeOf(TOSVersionInfoEx);
    Result := GetVersionEx(TOSVersionInfo(Addr(Info)^));
    if (not Result) then
    begin
      FillChar(Info, SizeOf(TOSVersionInfoEx), 0);
      Info.dwOSVersionInfoSize := SizeOf(TOSVersionInfoEx);
      Result := GetVersionEx(TOSVersionInfo(Addr(Info)^));
      if (not Result) then
        Info.dwOSVersionInfoSize := 0;
    end;
  end;


  {*
    Provides a name to describe the WIN OS
    @return A short descriptive name of the WIN OS name and edition
  }
  function GetOSVersionText: string;
  var
    Info: TOSVersionInfoEx;
    Key: HKEY;
  begin
    Result := '';
    if (not GetOSVersionInfo(Info)) then
      Exit;
    case Info.dwPlatformId of
      { Win32s }
      VER_PLATFORM_WIN32s:
        Result := 'Microsoft Win32s';
      { Windows 9x }
      VER_PLATFORM_WIN32_WINDOWS:
        if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 0) then
        begin
          Result := 'Microsoft Windows 95';
          if (Info.szCSDVersion[1] in ['B', 'C']) then
            Result := Result +' OSR2';
        end
        else if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 10) then
        begin
          Result := 'Microsoft Windows 98';
          if (Info.szCSDVersion[1] = 'A') then
            Result := Result + ' SE';
        end
        else if (Info.dwMajorVersion = 4) and (Info.dwMinorVersion = 90) then
          Result := 'Microsoft Windows Millennium Edition';
      { Windows NT }
      VER_PLATFORM_WIN32_NT:
        begin
          { Version }
          if (Info.dwMajorVersion = 6) then
            Result := 'Microsoft Windows Vista'
          else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 2) then
            Result := 'Microsoft Windows Server 2003'
          else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 1) then
            Result := 'Microsoft Windows XP'
          else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 0) then
            Result := 'Microsoft Windows 2000'
          else
            Result := 'Microsoft Windows NT';
          { Extended }
          if (Info.dwOSVersionInfoSize >= SizeOf(TOSVersionInfoEx)) then
          begin
            { ProductType }
            if (Info.wProductType = VER_NT_WORKSTATION) then
            begin
              if (Info.dwMajorVersion = 4) then
                Result := Result + #10'Workstation 4.0'
              else if(Info.wSuiteMask and VER_SUITE_PERSONAL <> 0) then
                Result := Result + #10'Home Edition'
              else
                Result := Result + #10'Professional';
            end
            else if (Info.wProductType = VER_NT_SERVER) then
            begin
               if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 2) then
               begin
                 if (Info.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                   Result := Result + #10'Datacenter Edition'
                 else if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                   Result := Result + #10'Enterprise Edition'
                 else if (Info.wSuiteMask = VER_SUITE_BLADE) then
                   Result := Result + #10'Web Edition'
                 else
                   Result := Result + #10'Standard Edition';
               end
               else if (Info.dwMajorVersion = 5) and (Info.dwMinorVersion = 0) then
               begin
                 if (Info.wSuiteMask and VER_SUITE_DATACENTER <> 0) then
                    Result := Result + #10'Datacenter Server'
                 else if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                    Result := Result + #10'Advanced Server'
                 else
                    Result := Result + #10'Server';
               end
               else
               begin
                 Result := Result + #10'Server ' +
                   IntToStr(Info.dwMajorVersion) + '.' +
                   IntToStr(Info.dwMinorVersion);
                 if (Info.wSuiteMask and VER_SUITE_ENTERPRISE <> 0) then
                   Result := Result + ', Enterprise Edition';
               end;
            end;
          end;
          { CSDVersion }
          if (Info.dwMajorVersion = 4) and
            (StrIComp(Info.szCSDVersion, 'Service Pack 6') = 0) and
            (RegOpenKeyEx(HKEY_LOCAL_MACHINE,
              'SOFTWARE\Microsoft\Windows NT\CurrentVersion\Hotfix\Q246009', 0,
              KEY_QUERY_VALUE, Key) = ERROR_SUCCESS) then
          begin
            Result := Result + #10'Service Pack 6a';
            RegCloseKey(Key);
          end
          else
            Result := Result + #10 + StrPas(Info.szCSDVersion);
          Result := Result + #10'(Build ' +
            IntToStr(Info.dwBuildNumber and $FFFF) + ')';
        end;
    end;
  end;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Functions for dealing with the Windows registry.
// Based on work by Ernesto De Spirito.
// See http://latiumsoftware.com/en/delphi/00004.php
//-----------------------------------------------------------------------------

  {*
    To simplify reading a data value from the registry you can use the following function
    that can read any data type from the registry and returns it as a variant (string or integer).
    The function performs exception handling.

    Sample Call:
    ShowMessage(
      GetRegistryData(
        HKEY_LOCAL_MACHINE,
        '\Hardware\Description\System\CentralProcessor\0',
        'Identifier'));

    @param RootKey One of the registry sections e.g. HKEY_LOCAL_MACHINE or HKEY_LOCAL_MACHINE
    @param Key Specific key name under RootKey
    @param Value A value under Key
    @return The data for Value
  }
  function GetRegistryData(RootKey: HKEY; Key, Value: string): variant;
    var
      Reg: TRegistry;
      RegDataType: TRegDataType;
      DataSize, Len: integer;
      s: string;
    label
      cantread;
    begin
      Reg := nil;
      try
        Reg := TRegistry.Create(KEY_QUERY_VALUE);
        Reg.RootKey := RootKey;
        if Reg.OpenKeyReadOnly(Key) then
          begin
            try
              RegDataType := Reg.GetDataType(Value);
              if (RegDataType = rdString) or
                 (RegDataType = rdExpandString) then
                Result := Reg.ReadString(Value)
              else if RegDataType = rdInteger then
                Result := Reg.ReadInteger(Value)
              else if RegDataType = rdBinary then
                begin
                  DataSize := Reg.GetDataSize(Value);
                  if DataSize = -1 then goto cantread;
                  SetLength(s, DataSize);
                  Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
                  if Len <> DataSize then goto cantread;
                  Result := s;
                end
            else
    cantread:
              {$IFNDEF DEBUG}
                raise Exception.Create(SysErrorMessage(ERROR_CANTREAD))
              {$ENDIF}
            ;
            except
              s := ''; // Deallocates memory if allocated
              Reg.CloseKey;
              raise;
            end;

            Reg.CloseKey;
          end
        else
          // FIX ME: the error returned by this call is very bizarre
          raise Exception.Create(SysErrorMessage(GetLastError))
        ;
      except
        Reg.Free;
        raise;
      end;

      Reg.Free;
    end
  ;


  {*
    To simplify writing a data value to the registry you can use the following procedure
    that can write any data type to the registry. The procedure performs exception handling.

    Sample Call:
    SetRegistryData(
      HKEY_LOCAL_MACHINE,
      '\Software\Microsoft\Windows\CurrentVersion',
      'RegisteredOrganization',
      rdString,
      'Latium Software');

    @param RootKey One of the registry sections e.g. HKEY_LOCAL_MACHINE or HKEY_LOCAL_MACHINE
    @param Key Specific key name under RootKey
    @param Value A value under Key
    @param Data The data to set for Value
  }
  procedure SetRegistryData(
      RootKey: HKEY;
      Key, Value: string;
      RegDataType: TRegDataType;
      Data: variant
    );
    var
      Reg: TRegistry;
      s: string;
    begin
      Reg := TRegistry.Create(KEY_WRITE);

      try
        Reg.RootKey := RootKey;
        if Reg.OpenKey(Key, True) then
          begin
            try
              if RegDataType = rdUnknown then
                RegDataType := Reg.GetDataType(Value);
              if RegDataType = rdString then
                Reg.WriteString(Value, Data)
              else if RegDataType = rdExpandString then
                Reg.WriteExpandString(Value, Data)
              else if RegDataType = rdInteger then
                Reg.WriteInteger(Value, Data)
              else if RegDataType = rdBinary then
                begin
                  s := Data;
                  Reg.WriteBinaryData(Value, PChar(s)^, Length(s));
                end
              else
                raise Exception.Create(SysErrorMessage(ERROR_CANTWRITE))
              ;
            except
              Reg.CloseKey;
              raise;
            end;
            Reg.CloseKey;
          end
        else
          raise Exception.Create(SysErrorMessage(GetLastError))
        ;
      finally
        Reg.Free;
      end;
    end
  ;
//-----------------------------------------------------------------------------



{*
  Creating shortcuts
  Based on code written by Thomas Stutz
  See http://www.swissdelphicenter.ch/torry/showcode.php?id=317

  Sample usage
  ------------
  const
   PROGR = 'c:\YourProgram.exe';
  var
    resPath: string;
  begin
    //Create a Shortcut in the Quckick launch toolbar
    resPath := CreateShortcut(PROGR, ShortcutQuickLaunch, 'Description' );
    
    //Create a Shortcut on the Desktop
    resPath := CreateShortcut(PROGR, ShortcutDesktop, 'Description' );
    
    //Create a Shortcut in the Startmenu /"Programs"-Folder
    resPath := CreateShortcut(PROGR, ShortcutStartMenuPrograms, 'Description', 'MyApplication' );
    
    if( '' <> resPath ) then
      dbcout( "Shortcut successfully created in " + resPath )
    else
      dbcout( "Shortcut could not be created." )
    ;

    @param SourceFileName The file the shortcut points to
    @param Location Shortcut location
    @param Description Description property of the shortcut
    @param SubFolder Subfolder of location
    @param WorkingDir Working directory property of the shortcut
    @param Parameters Application parameters if any
    @return Path to where shortcut was created
 }
  function CreateShortcut(
        SourceFileName: string; // the file the shortcut points to
        Location: ShortcutType; // shortcut location
        Description: string; //  description property of the shortcut
        SubFolder: string = '';  // subfolder of location
        WorkingDir: string = ''; // working directory property of the shortcut
        Parameters: string = '' 
      ): string;
    const
      SHELL_FOLDERS_ROOT = 'Software\MicroSoft\Windows\CurrentVersion\Explorer';
      QUICK_LAUNCH_ROOT = 'Software\MicroSoft\Windows\CurrentVersion\GrpConv';
    var
      MyObject: IUnknown;
      MySLink: IShellLink;
      MyPFile: IPersistFile;
      Directory, LinkName: string;
      WFileName: WideString;
      RegIni: TRegIniFile;
      reg: TRegistry;
      res: integer;
    begin
      result := '';
    
      MyObject := CreateComObject(CLSID_ShellLink);
      MySLink := MyObject as IShellLink;
      MyPFile := MyObject as IPersistFile;

      MySLink.SetPath(PChar(SourceFileName));
      MySLink.SetArguments(PChar(Parameters));
      MySLink.SetDescription(PChar(Description));

      LinkName := ChangeFileExt(SourceFileName, '.lnk');
      LinkName := ExtractFileName(LinkName);

      // Quicklauch
      if( ShortcutQuickLaunch = Location ) then
        begin
          RegIni := TRegIniFile.Create(QUICK_LAUNCH_ROOT);
          try
            Directory := RegIni.ReadString( 'MapGroups', 'Quick Launch', '' );
          finally
            RegIni.Free;
          end;
        end
      else if( ShortcutStartMenuPrograms = Location ) then
        begin
          reg := TRegistry.Create();
          try
            reg.RootKey := HKEY_CURRENT_USER;
            reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', False);
            Directory := reg.ReadString('Programs');
            reg.CloseKey;
          finally
            reg.Free;
          end;      
        end
      else // Other locations
        begin
          RegIni := TRegIniFile.Create( SHELL_FOLDERS_ROOT );
          try
            case Location of
              ShortcutOtherFolder: Directory := SubFolder;
              ShortcutDesktop: Directory := RegIni.ReadString('Shell Folders', 'Desktop', '');
              ShortcutStartMenu: Directory := RegIni.ReadString('Shell Folders', 'Start Menu', '');
              ShortcutSendTo: Directory := RegIni.ReadString('Shell Folders', 'SendTo', '');
            end;
          finally
            RegIni.Free;
          end;
        end
      ;

      if( '' <> Directory ) then
        begin
          if( ( '' <> SubFolder ) and (ShortcutOtherFolder <> Location) ) then
            WFileName := Directory + '\' + SubFolder + '\' + LinkName
          else
            WFileName := Directory + '\' + LinkName
          ;

          if( '' = WorkingDir ) then
            res := MySLink.SetWorkingDirectory(PChar(ExtractFilePath(SourceFileName)))
          else
            res := MySLink.SetWorkingDirectory(PChar(WorkingDir))
          ;

          if( S_OK = res ) then
            res := MyPFile.Save(PWChar(WFileName), False)
          ;

          if( S_OK = res ) then // Success!
            Result := WFileName
          ;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Users and their permissions
//-----------------------------------------------------------------------------


  // Based on code from http://www.experts-exchange.com/Programming/Languages/Pascal/Delphi/Q_20780234.html
  {*
     Get current user
     @return Current User Name
  }
  function currentUserName(): string;
    var
      i : cardinal;
    begin
      result := '';
      try
        i := 255;
        SetLength(result,i);
        GetUserName(PChar(result),i);
        SetLength(result,(i));
      except
        // Do nothing: an empty string will returned.
      end;
    end
  ;

  // Based on code from http://www.delphifaq.com/faq/delphi_windows_API/f350.shtml
  {*
    Determine whether the current user has local adminstrative rights
    @return True if the current user has admin rights, else false
  }
  function userIsAdministrator(): boolean;
    const
      SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
      SECURITY_BUILTIN_DOMAIN_RID = $00000020;
      DOMAIN_ALIAS_RID_ADMINS     = $00000220;
    var
      hAccessToken: THandle;
      ptgGroups: PTokenGroups;
      dwInfoBufferSize: DWORD;
      psidAdministrators: PSID;
      x: Integer;
      bSuccess: BOOL;
    begin
      if Win32Platform <> VER_PLATFORM_WIN32_NT then
      begin
        Result := True;
        exit;
      end;

      Result := False;
      bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, hAccessToken);
      if not bSuccess then
        begin
          if GetLastError = ERROR_NO_TOKEN then
            bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hAccessToken)
          ;
        end
      ;

      if bSuccess then
        begin
          GetMem(ptgGroups, 1024);
          bSuccess := GetTokenInformation(hAccessToken, TokenGroups, ptgGroups, 1024, dwInfoBufferSize);
          CloseHandle(hAccessToken);

          if bSuccess then
            begin
              AllocateAndInitializeSid(
                SECURITY_NT_AUTHORITY, 2,
                SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS,
                0, 0, 0, 0, 0, 0, psidAdministrators
              );

              {$R-}
                for x := 0 to ptgGroups.GroupCount - 1 do
                  begin
                    if EqualSid(psidAdministrators, ptgGroups.Groups[x].Sid) then
                      begin
                        Result := True;
                        break;
                      end
                    ;
                  end
                ;
              {$R+}
              FreeSid(psidAdministrators);
            end
          ;
          FreeMem(ptgGroups);
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Computer name
//-----------------------------------------------------------------------------
  // Based on code from http://www.experts-exchange.com/Programming/Languages/Pascal/Delphi/Q_20780234.html

  {*
    Get the computers name
    @return Name of computer or an empty string if it has none
  }
  function computerName(): string;
    var
      i : cardinal;
    begin
      result := '';
      try
        i := 255;
        SetLength(result,i);
        GetComputerName(PChar(result),i);
        SetLength(result,(i));
      except
        // Do nothing: an empty string will returned.
      end;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Memory usage
//-----------------------------------------------------------------------------
  {*
    Reports memory used by a named process.

    @param _sProcessName the name of the process for which to return memory usage
    @param _nMemSize a variable to store memory usage
    @return true on success, otherwise false
  }
  // This function is based on code from
  // http://www.delphitricks.com/source-code/systeminfo/get_info_on_memory_usage_from_a_given_process.html
  function GetProcessMemorySize(_sProcessName: string; var _nMemSize: Cardinal): Boolean;
    var
      l_nWndHandle, l_nProcID, l_nTmpHandle: HWND;
      l_pPMC: PPROCESS_MEMORY_COUNTERS;
      l_pPMCSize: Cardinal;
    begin
      l_nWndHandle := FindWindow(nil, PChar(_sProcessName));
      if l_nWndHandle = 0 then
      begin
        Result := False;
        Exit;
      end;
      l_pPMCSize := SizeOf(PROCESS_MEMORY_COUNTERS);
      GetMem(l_pPMC, l_pPMCSize);
      l_pPMC^.cb := l_pPMCSize;
      GetWindowThreadProcessId(l_nWndHandle, @l_nProcID);
      l_nTmpHandle := OpenProcess(PROCESS_ALL_ACCESS, False, l_nProcID);
      if (GetProcessMemoryInfo(l_nTmpHandle, l_pPMC, l_pPMCSize)) then
        _nMemSize := l_pPMC^.WorkingSetSize
      else
        _nMemSize := 0;
      FreeMem(l_pPMC);
      Result := True;
    end
  ;


  {*
    Reports memory used by the current process.

    @return memory usage
  }
  // This function is based on code from
  // http://stackoverflow.com/questions/437683/how-to-get-the-memory-used-by-a-delphi-program
  function getCurrentProcessMemorySize(): cardinal;
    var
      MemCounters: TProcessMemoryCounters;
    begin
      result := 0;
      
      MemCounters.cb := SizeOf(MemCounters);
      if GetProcessMemoryInfo(GetCurrentProcess,
          @MemCounters,
          SizeOf(MemCounters)) then
        Result := MemCounters.WorkingSetSize
      else
        RaiseLastOSError;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Some other stuff
//-----------------------------------------------------------------------------

  {*
    Displays a browser dialog box that enables the user to select a folder.

    @param Title Caption for the dialog window
    @param BFlag Identify browsing object; computers, printers, folders, files
    @return Path to user selected item
    @comment BFlag is defined in the implmentation section of this unit
  }
  function BrowseDialog( const Title: string; const BFlag: TBrowseFlag ): string;
    var
      lpItemID : PItemIDList;
      BrowseInfo : TBrowseInfo;
      DisplayName : array[0..MAX_PATH] of char;
      TempPath : array[0..MAX_PATH] of char;
      Flag: integer;
    begin
      Flag := integer( BFlag );
      Result:='';
      FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
      with BrowseInfo do begin
        hwndOwner := Application.Handle;
        pszDisplayName := @DisplayName;
        lpszTitle := PChar(Title);
        ulFlags := Flag;
      end;
      lpItemID := SHBrowseForFolder(BrowseInfo);
      if lpItemId <> nil then begin
        SHGetPathFromIDList(lpItemID, TempPath);
        Result := TempPath;
        GlobalFreePtr(lpItemID);
      end;
    end
  ;

end.
