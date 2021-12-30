{*
ZipFunctions.pas - file compression and extraction operations
----------------
Begin: 2005/07/20
Last revision: $Date: 2009-08-27 21:05:18 $ $Author: rhupalo $
Version number: $Revision: 1.10 $
Code Documentation Tags: Begin 2009-08-27, Last Revision: 2009-08-27
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)


unit ZipFunctions;

interface

  uses
    SysUtils
  ;

  function unzipArchive( const sourceFile: TFileName; destDir: string = ''; errMsg: pstring = nil  ): boolean;

  function extractFileFromZip(
    const zipArchive: TFileName;
    const zippedFileName: TFileName;
    const destPathName: TFileName;
    errCode: pinteger = nil;
    errMsg: pstring = nil
  ): boolean;

  const
    // Error codes used in extractFileFromZip
    ZIP_ERROR_NO_ERROR: integer = 0;                /// No errors unzipping
    ZIP_ERROR_UNSPECIFIED: integer = 1;             /// Unanticipated error occurred
    ZIP_ERROR_ARCHIVE_DOES_NOT_EXIST: integer = 2;  /// Archive to open not found
    ZIP_ERROR_COPY_FILE_FAILED: integer = 3;        /// Extracted file could not be moved to destination folder
    ZIP_ERROR_EXTRACT_FAILED: integer = 4;          /// The file specified could not be extracted


implementation

  uses
    Classes,
    StrUtils,

    ZipMstr,

    DebugWindow,
    MyStrUtils,
    WindowsUtils
  ;


  {*
    Unzip a file, extracting zippedFileName from zipArchive to destPathName

    @param zipArchive The fullpath of the zip archive holding zippedFileName
    @param zippedFileName Name of the archived file to unzip
    @param destPathName Path to folder where the uzipped file is to be put
    @param errCode Where any error code will be placed or 0 if all goes well
    @param errMsg Where any error message will be placed
    @return True if the operation is sucessful, else false
    @comment FIX ME: see if it's possible to read from the specified file
  }
  function extractFileFromZip(
        const zipArchive: TFileName;
        const zippedFileName: TFileName;
        const destPathName: TFileName;
        errCode: pinteger = nil;
        errMsg: pstring = nil
      ): boolean;
   var
      zipper: TZipMaster;
    begin
      zipper := nil;

      if( nil <> errCode ) then errCode^ := ZIP_ERROR_NO_ERROR;

      if( not( fileExists( zipArchive ) ) ) then
        begin
          result := false;
          if( nil <> errCode ) then errCode^ := ZIP_ERROR_ARCHIVE_DOES_NOT_EXIST;
          if( nil <> errMsg ) then errMsg^ := 'Zip archive ' + zipArchive + ' does not exist.';
          exit;
        end
      ;

      // FIX ME: see if it's possible to read from the specified file

      // If we get by the initial error checking, it's safe to extract the file.
      try
        try

          // Extract the file in the archive to the Windows temp directory
          // Once extracted, copy the file to the designated filename.
          zipper := TZipMaster.Create( nil );
          zipper.ZipFileName := zipArchive;

          //if( 1 <> zipper.Count ) then
          if( 0 = zipper.Count ) then
            result := false
          else
            begin
              zipper.FSpecArgs.Add( zippedFileName );

              zipper.ExtrBaseDir := tempDir();

              // If the file to be extracted already exists, overwrite it
              zipper.ExtrOptions := zipper.ExtrOptions + [ExtrOverwrite];

              if( 0 = zipper.Extract() ) then
                begin
                  if( WindowsCopyFile( tempDir() + zippedFileName, destPathName ) ) then
                    result := true
                  else
                    begin
                      if( nil <> errCode ) then errCode^ := ZIP_ERROR_COPY_FILE_FAILED;
                      if( nil <> errMsg ) then errMsg^ := 'Extracted file could not be moved to ' + destPathName;
                      result := false;
                    end
                  ;

                  deleteFile( tempDir() + zippedFileName );
                end
              else
                begin
                  if( nil <> errCode ) then errCode^ := ZIP_ERROR_EXTRACT_FAILED;
                  if( nil <> errMsg ) then errMsg^ := 'Contents of archive ' + zipArchive + ' could not be extracted.';
                  result := false;
                end
              ;
            end
          ;

        except
          if( nil <> errCode ) then errCode^ := ZIP_ERROR_UNSPECIFIED;
          if( nil <> errMsg ) then errMsg^ := 'Unspecified error.';
          result := false;
        end;
      finally
        freeAndNil( zipper );
      end;

    end
  ;


  {*
    Unzip the files from zipArchive to destDir

    @param sourceFile The fullpath of the zip archive
    @param destDir Path to folder where the uzipped files are to be placed
    @param errMsg Where any error message will be placed
    @return True if the operation is sucessful, else false
    @comment FIX ME: see if it's possible to read from the specified file
  }
  function unzipArchive( const sourceFile: TFileName; destDir: string = ''; errMsg: pstring = nil ): boolean;
    var
      zipper: TZipMaster;
    begin
      zipper := nil;

      if
        ( '' <> destDir )
      and
        ( not( directoryExists( destDir ) ) )
      then
        begin
          result := false;
          if( nil <> errMsg ) then errMsg^ := 'Directory ' + destDir + ' does not exist.';
          exit;
        end
      ;

      // FIX ME: see if it's possible to write to the specified directory

      if( not( fileExists( sourceFile ) ) ) then
        begin
          result := false;
          if( nil <> errMsg ) then errMsg^ := 'Zip archive ' + sourceFile + ' does not exist.';
          exit;
        end
      ;

      // FIX ME: see if it's possible to read from the specified file

      // If we get by the initial error checking, it's safe to extract the file.
      try
        try
          zipper := TZipMaster.Create( nil );
          zipper.ZipFileName := sourceFile;

          zipper.FSpecArgs.Add('*.*');

          if( '' = destDir ) then
            zipper.ExtrBaseDir := GetCurrentDir()
          else
            zipper.ExtrBaseDir := destDir
          ;

          // If the file to be extracted already exists, overwrite it
          zipper.ExtrOptions := zipper.ExtrOptions + [ExtrOverwrite];
          zipper.Extract();

          result := true;

        except
          if( nil <> errMsg ) then errMsg^ := 'Unspecified error.';
          result := false;
        end;
      finally
        freeAndNil( zipper );
      end;

    end
  ;


end.

