{*
Resources.pas - Finding and loading files in memory, optionally writing them to disk
--------------
Begin: 2005/03/02
Last revision: $Date: 2009-08-25 17:47:26 $ $Author: rhupalo $
Version number: $Revision: 1.12 $
Code Documentation Tags: Begin 2009-08-25, Last Revision: 2009-08-25
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2006 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

    Functions modified from:
    http://www.delphi3000.com/articles/article_2606.asp
    Original functions were written by Ernesto De Spirito
}

(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
*)

unit Resources;

interface

  uses
    Windows,
    SysUtils
  ;

  // Functions below modified from http://www.delphi3000.com/articles/article_2606.asp
  // Original functions were written by Ernesto De Spirito
  function getResourceAsPointer( ResName: pchar; ResType: pchar; out Size: longword ): pointer;

  function getResourceAsString( ResName: pchar ): string;

  function saveResourceAsFile( const ResName: string; ResType: pchar; const FileName: string ): boolean;

implementation

  uses
    Classes
  ;

  {*
     For WAV and other binary files we need a pointer to the resource loaded in memory.
     This function does so using the API
     Sample call:
        sample_wav: pointer;
        size: longword; 
        sample_wav := GetResourceAsPointer('sample_wav', 'wave', size);
        - then using the API sndPlaySound declared in the MMSystem unit:
        sndPlaySound(sample_wav, SND_MEMORY or SND_NODEFAULT or SND_ASYNC);

     @param ResName Resource name, the file name loaded im memory
     @param ResType Type of file
     @param Size Value assigned within function
     @return Pointer to ResName
  }
  function getResourceAsPointer( ResName: pchar; ResType: pchar; out Size: longword ): pointer;
    var
      InfoBlock: HRSRC;
      GlobalMemoryBlock: HGLOBAL;
    begin
      InfoBlock := FindResource(hInstance, resname, restype);

      if InfoBlock = 0 then raise Exception.Create(SysErrorMessage(GetLastError));

      size := SizeofResource(hInstance, InfoBlock);

      if size = 0 then raise Exception.Create(SysErrorMessage(GetLastError));

      GlobalMemoryBlock := LoadResource(hInstance, InfoBlock);

      if GlobalMemoryBlock = 0 then raise Exception.Create(SysErrorMessage(GetLastError));

      Result := LockResource(GlobalMemoryBlock);

      if Result = nil then raise Exception.Create(SysErrorMessage(GetLastError));
    end
  ;

  {*
     For text files we need to load a resource in a string.
     This function does so using the API by calling GetResourceAsPointer()

     @param ResName Resource name, the text file name loaded im memory
     @return The contents of file ResName
  }
  function getResourceAsString( ResName: pchar ): string;
    var
      ResData: PChar;
      ResSize: Longword;
    begin
      ResData := GetResourceAsPointer(resname, 'text', ResSize);
      SetString(Result, ResData, ResSize);
    end
  ;


  {*
    There are some resources (like fonts and animated cursors) that can't be used from memory.
    We necessarily have to save these resources to a temporary disk file and load them from there.
    The following function saves a resource to a file:

    @param ResName Resource name, the file name loaded im memory
    @param ResType Type of file
    @param Filename Atarget full path and filename for created file
    @return True if ResName written to file as FileName, esle false
  }
  function SaveResourceAsFile( const ResName: string; ResType: pchar; const FileName: string ): boolean;
    var
      resStream: TResourceStream;
    begin
      resStream := TResourceStream.Create( hInstance, ResName, ResType );

      try
        try
          resStream.SaveToFile( FileName );
          result := true;
        except
          result := false;
        end;
      finally
        resStream.Free();
      end;
    end
  ;


(*
Source: http://www.delphi3000.com/articles/article_2606.asp
Author: Ernesto De Spirito
Accessed: 2/25/05

It is possible to embed any kind of file in an executable using resource
files (.RES). Certain kinds of resources are recognized by the API
and can be used directly. Others are simply taken as binary data and
its up to you to use them. In this article we will see examples of both kinds.

To create the resource file we start with the source file (.RC),
for example named RESOURCES.RC, which is a simple text file that
contains the resource entries (name, class and file):

  sample_bmp   BITMAP     sample.bmp
  sample_ico   ICON       sample.ico
  sample_cur   CURSOR     sample.cur
  sample_ani   ANICURSOR  sample.ani
  sample_jpg   JPEG       sample.jpg
  sample_wav   WAVE       sample.wav
  sample_txt   TEXT       sample.txt

The names of the resources (sample_bmp, sample_ico, etc.) are arbitrary.
The kind of resource may be one recognized by the APIs (BITMAP, ICON, CURSOR)
or arbitrary (JPEG, WAVE, TEXT). The file names specify the files that
will be included in the .RES file (and later in the .EXE).

Now we have to compile the .RC file to produce the .RES file.
For that we can use the Borland Resource Compiler (brcc32.exe) that
you can probably find in Delphi's BIN folder. It's a simple command-line
utility that expects the name of the source file as parameter:

  C:\DELPHI\P0025>brcc32 resources
  Borland Resource Compiler  Version 5.40
  Copyright (c) 1990, 1999 Inprise Corporation.  All rights reserved.

  C:\DELPHI\P0025>_

To instruct the linker to embed the resource file in the executable,
we use the resource file directive ($R or $RESOURCE) in our Pascal source code:

  {$R resources.res}

Loading the resources in your application is easy for the "recognized" resources
like BITMAP, ICON and CURSOR since the Windows API provides functions
(LoadBitmap, LoadIcon and LoadCursor respectively) to get handles for these
elements, that for example we can assign to the Handle property of the
corresponding object:

    Image1.Picture.Bitmap.Handle :=
      LoadBitmap(hInstance, 'sample_bmp');
    Icon.Handle := LoadIcon(hInstance, 'sample_ico');
    Screen.Cursors[1] := LoadCursor(hInstance, 'sample_cur');

For more alternatives when loading image resources, see the API LoadImage.

Other resources are little bit more difficult to manage.
Let's start with JPEG images. The following function uses
TResourceStream to load the resource as a stream that will be
loaded into a TJPEGImage object:

  function GetResourceAsJpeg(const resname: string): TJPEGImage;
  var
    Stream: TResourceStream;
  begin
    Stream := TResourceStream.Create(hInstance, ResName, 'JPEG');
    try
      Result := TJPEGImage.Create;
      Result.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end;

Example:

  var
    Jpg: TJPEGImage;
  begin
    // ...
    Jpg := GetResourceAsJpeg('sample_jpg');
    Image2.Picture.Bitmap.Assign(Jpg);
    Jpg.Free;
    // ...
  end;

For WAV files we need a pointer to the resource loaded in memory,
and for a text file we need to load a resource in a string. We can
do it using TResourceStream, but let's see an example using the API:

  function GetResourceAsPointer(ResName: pchar; ResType: pchar;
                                out Size: longword): pointer;
  var
    InfoBlock: HRSRC;
    GlobalMemoryBlock: HGLOBAL;
  begin
    InfoBlock := FindResource(hInstance, resname, restype);
    if InfoBlock = 0 then
      raise Exception.Create(SysErrorMessage(GetLastError));
    size := SizeofResource(hInstance, InfoBlock);
    if size = 0 then
      raise Exception.Create(SysErrorMessage(GetLastError));
    GlobalMemoryBlock := LoadResource(hInstance, InfoBlock);
    if GlobalMemoryBlock = 0 then
      raise Exception.Create(SysErrorMessage(GetLastError));
    Result := LockResource(GlobalMemoryBlock);
    if Result = nil then
      raise Exception.Create(SysErrorMessage(GetLastError));
  end;

  function GetResourceAsString(ResName: pchar; ResType: pchar): string;
  var
    ResData: PChar;
    ResSize: Longword;
  begin
    ResData := GetResourceAsPointer(resname, restype, ResSize);
    SetString(Result, ResData, ResSize);
  end;

Sample calls:

  var
    sample_wav: pointer;

  procedure TForm1.FormCreate(Sender: TObject);
  var
    size: longword;
  begin
    ...
    sample_wav := GetResourceAsPointer('sample_wav', 'wave', size);
    Memo1.Lines.Text := GetResourceAsString('sample_txt', 'text');
  end;

Once we have the wave resource loaded into memory we can play it as
many times as we want by using the API sndPlaySound declared in the
MMSystem unit:

  procedure TForm1.Button1Click(Sender: TObject);
  begin
    sndPlaySound(sample_wav, SND_MEMORY or SND_NODEFAULT or SND_ASYNC);
  end;

There are some resources (like fonts and animated cursors) that can't
be used from memory. We necessarily have to save these resources to a
temporary disk file and load them from there. The following function saves
a resource to a file:

  procedure SaveResourceAsFile(const ResName: string; ResType: pchar;
    const FileName: string);
  begin
    with TResourceStream.Create(hInstance, ResName, ResType) do
      try
        SaveToFile(FileName);
      finally
        Free;
      end;
  end;

The following function makes use of the previous one to save a resource
in a temporary file:

  function SaveResourceAsTempFile(const ResName: string;
    ResType: pchar): string;
  begin
    Result := CreateTempFile;
    SaveResourceAsFile(ResName, ResType, Result);
  end;

The discussion of the function CreateTempFile falls beyond the scope of this
article and its implementation can be seen in the example attached to the newsletter.

The following function makes use of SaveResourceAsTempFile to save an
animated-cursor resource to a temporary file, then it loads the cursor
from the file with LoadImage and finally deletes the temporary file.
The function returns the handle returned by LoadImage:

  function GetResourceAsAniCursor(const ResName: string): HCursor;
  var
    CursorFile: string;
  begin
    CursorFile := SaveResourceAsTempFile(ResName, 'ANICURSOR');
    Result := LoadImage(0, PChar(CursorFile), IMAGE_CURSOR, 0,
                        0, LR_DEFAULTSIZE or LR_LOADFROMFILE);
    DeleteFile(CursorFile);
    if Result = 0 then
      raise Exception.Create(SysErrorMessage(GetLastError));
  end;

Sample call:

  Screen.Cursors[1] := GetResourceAsAniCursor('sample_ani');
  Form1.Cursor := 1;

Well, that's it. I hope you find it useful. You can find more
information about resource files in the MSDN Library:

http://msdn.microsoft.com/library/en-us/winui/hh/winui/rc_6cs3.asp


unit Unit1;

{
Copyright (c) 2001 Ernesto De Spirito <edespirito @ latiumsoftware.com>

This program is explained in the Pascal Newsletter #25:
  http://www.latiumsoftware.com/en/pascal/0025.php
License: http://www.latiumsoftware.com/en/legal.php
Visit my web site: http://www.latiumsoftware.com/en/

Este programa se explica en el Boletín Pascal #25:
  http://www.latiumsoftware.com/es/pascal/0025.php
Licencia: http://www.latiumsoftware.com/es/legal.php
Visite mi sitio web: http://www.latiumsoftware.com/es/
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
{$R resources.res}

uses MMSystem, FileCtrl, Jpeg;

var
  sample_wav: pointer;

function GetResourceAsPointer(ResName: pchar; ResType: pchar;
                              out Size: longword): pointer;
var
  InfoBlock: HRSRC;
  GlobalMemoryBlock: HGLOBAL;
begin
  InfoBlock := FindResource(hInstance, resname, restype);
  if InfoBlock = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
  size := SizeofResource(hInstance, InfoBlock);
  if size = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
  GlobalMemoryBlock := LoadResource(hInstance, InfoBlock);
  if GlobalMemoryBlock = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
  Result := LockResource(GlobalMemoryBlock);
  if Result = nil then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetResourceAsString(ResName: pchar; ResType: pchar): string;
var
  ResData: PChar;
  ResSize: Longword;
begin
  ResData := GetResourceAsPointer(resname, restype, ResSize);
  SetString(Result, ResData, ResSize);
end;

function GetWindowsDir: TFileName;
var
  WinDir: array [0..MAX_PATH-1] of char;
begin
  SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

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
end;

function CreateTempFile: TFileName;
var
  TempFileName: array [0..MAX_PATH-1] of char;
begin
  if GetTempFileName(PChar(GetTempDir), '~', 0, TempFileName) = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
  Result := TempFileName;
end;

procedure SaveResourceAsFile(const ResName: string; ResType: pchar;
  const FileName: string);
begin
  with TResourceStream.Create(hInstance, ResName, ResType) do
    try
      SaveToFile(FileName);
    finally
      Free;
    end;
end;

function SaveResourceAsTempFile(const ResName: string; ResType: pchar): string;
begin
  Result := CreateTempFile;
  SaveResourceAsFile(ResName, ResType, Result);
end;

function GetResourceAsAniCursor(const ResName: string): HCursor;
var
  CursorFile: string;
begin
  CursorFile := SaveResourceAsTempFile(ResName, 'ANICURSOR');
  Result := LoadImage(0, PChar(CursorFile), IMAGE_CURSOR, 0,
                      0, LR_DEFAULTSIZE or LR_LOADFROMFILE);
  DeleteFile(CursorFile);
  if Result = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetResourceAsJpeg(const ResName: string): TJPEGImage;
var
  Stream: TResourceStream;
begin
  Stream := TResourceStream.Create(hInstance, ResName, 'JPEG');
  try
    Result := TJPEGImage.Create;
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  size: longword;
  Jpg: TJPEGImage;
begin
  Image1.Picture.Bitmap.Handle :=
    LoadBitmap(hInstance, 'sample_bmp');
  Jpg := GetResourceAsJpeg('sample_jpg');
  Image2.Picture.Bitmap.Assign(Jpg);
  Jpg.Free;
  Image3.Picture.Icon.Handle := LoadIcon(hInstance, 'sample_ico');
  Screen.Cursors[1] := GetResourceAsAniCursor('sample_ani');
  Screen.Cursors[2] := LoadCursor(hInstance, 'sample_cur');
  Memo1.Lines.Text := GetResourceAsString('sample_txt', 'text');
  sample_wav := GetResourceAsPointer('sample_wav', 'wave', size);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  sndPlaySound(sample_wav, SND_MEMORY or SND_NODEFAULT or SND_ASYNC);
end;


end.
*)


end.
