/// Unicode text file device driver.
unit UnicodeDev;

// FIX ME: Check the file reader functions to ensure that they properly
// recognize the $FFFE start marker.

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

////////////////////////////////////////////////////////////////////////////////
//
//   Unit         :  UnicodeDev
//   Author       :  rllibby
//   Date         :  01.31.2007
//   Description  :  Unicode text file device driver. Allows standard text file
//                   routine usage after an assign is performed using the
//                   AssignUnicode procedure. The unicode file must contain a
//                   a BOM (marker) in either little / big endian format. On
//                   file creation, a little endian BOM marker is written to the
//                   file.
//   Original file : http://www.experts-exchange.com/Programming/Languages/Pascal/Delphi/Q_22142988.html
//
//   Bug fixes    : Bug fix 1 (A.Reeves)
//
//   New features :
//
////////////////////////////////////////////////////////////////////////////////
interface

////////////////////////////////////////////////////////////////////////////////
//   Include units
////////////////////////////////////////////////////////////////////////////////
uses
  Windows, SysUtils;

////////////////////////////////////////////////////////////////////////////////
//   Constants
////////////////////////////////////////////////////////////////////////////////
const
  MAX_UNICACHE      =  8192;                /// 8 KB cache for unicode characters
  MAX_ANSICACHE     =  MAX_UNICACHE div 2;  /// Cache for ASCII chars, half that of Unicode

const
  ERR_NOERROR       =  0;   /// error code no error, returned by successful operations
  ERR_NOTOPEN       =  103; /// error code not open, referring to TextRecfile mode

////////////////////////////////////////////////////////////////////////////////
//   Data types
////////////////////////////////////////////////////////////////////////////////
type
  /// Pointer to Unicode record
  PUniRec           =  ^TUniRec;
  /// Record to hold Unicode what? - phrase, character ????
  TUniRec           =  packed record
     UniEncode:     Word;        /// first 2 bytes, must be either FFFE or FEFF
     BufFull:       LongBool;    /// status of the file buffer, true if full
     BufPos:        Cardinal;    /// current position in the file buffer
     BufEnd:        Cardinal;    /// how many bytes have been read into the buffeer
     Buffer:        PChar;       /// Text string for operations 
  end;

////////////////////////////////////////////////////////////////////////////////
//   Device assignment function
////////////////////////////////////////////////////////////////////////////////
procedure AssignUnicode(var F: Text; FileName: String);

implementation


{*
  Reverses the order of bytes in UniRec's var "Buffer". Called by UniInOut()
  @param UniRec Pointer to Unicode record
}
procedure UniSwapData(UniRec: PUniRec);
var  dwLo:          Cardinal;
     dwHi:          Cardinal;
     cSwap:         Char;
begin

  // Set starting byte markers
  dwLo:=0;
  dwHi:=1;

  // While less than the data size perform the swap
  while (dwHi < UniRec^.BufEnd) do
  begin
     // Swap char
     cSwap:=UniRec^.Buffer[dwLo];
     UniRec^.Buffer[dwLo]:=UniRec^.Buffer[dwHi];
     UniRec^.Buffer[dwHi]:=cSwap;
     // Increment markers
     Inc(dwLo, 2);
     Inc(dwHi, 2);
  end;

end;


{*
  Attempts to set the file mode of F to closed. Called by UniClose()

  @param F Text file in Delphi's internal format for text files.
  The text file variable should never be declared but allows access to internal data fields
  @param ReturnError Error code passed IN from attempting to set the file mode of F to closed
  @return The value of ReturnError
}
function UniInternalClose(var F: TTextRec; ReturnError: Integer): Integer;
begin

  // Resource protection
  try
     // Check file handle
     if not(F.Handle = (-1)) then
     begin
        // Resource protection
        try
           // Close the file
           FileClose(F.Handle);
        finally
           // Set handle to invalid value
           F.Handle:=(-1);
        end;
     end;
  finally
     // Set file mode to closed
     F.Mode:=fmClosed;
     // Return passed in error code
     result:=ReturnError;
  end;

end;


{*
  Reinitialzes F. Sets the file mode of F to closed, deallocates cache memory,
  and clears ths structure of user data.

  @param F Text file in Delphi's internal format for text files.
  @return The value of ERR_NOERROR if successful or the value of ERR_NOTOPEN
  if F was already closed (not in input or output mode).
}
function UniClose(var F: TTextRec): Integer;
begin

  // Handle the mode
  if (F.Mode <> fmInput) and (F.Mode <> fmOutput) then
     // File not open
     result:=ERR_NOTOPEN
  else
  begin
     // Resource protection
     try
        // Perform internal close
        result:=UniInternalClose(F, ERR_NOERROR);
        // Deallocate cache memory
        if Assigned(PUniRec(@F.UserData)^.Buffer) then FreeMem(PUniRec(@F.UserData)^.Buffer);
     finally
        // Ensure the user data struct is cleared
        FillChar(F.UserData, SizeOf(F.UserData), 0);
     end;
  end;

end;


{*
  A function called by Reset(), Rewrite(), or Append() I/O to operate on F
  Opens F and prepares F for one of these operations.

  @param F Text file in Delphi's internal format for text files.
  @return The value of ERR_NOERROR if successful or some error code
  from the TextRec or from Windows, depending on the error.
}
function UniOpen(var F: TTextRec): Integer;
var  lpUniRec:      PUniRec;
     wd: word;
begin

  // Resource protection
  try
     // Set default result
     result:=ERR_NOERROR;
     // Access the user data struct
     lpUniRec:=@F.UserData;
     // Handle the mode
     case F.Mode of
        // Called from Reset(...)
        fmInput  :
        begin
           // Open the file in read only mode
           F.Handle:=FileOpen(F.Name, fmOpenRead or fmShareDenyNone);
           // Check handle
           if (F.Handle = (-1)) then
              // Return last error
              result:=UniInternalClose(F, GetLastError)
           else
           begin
              // Read first 2 bytes, which must be either FFFE or FEFF
              if not(FileRead(F.Handle, lpUniRec^.UniEncode, SizeOf(Word)) = SizeOf(Word)) or not((lpUniRec^.UniEncode = $FFFE) or (lpUniRec^.UniEncode = $FEFF)) then
              begin
                 // Perform internal close
                 result:=UniInternalClose(F, ERROR_INVALID_DATA);
              end;
           end;
        end;
        // Called from Rewrite(...)
        fmOutput :
        begin
           // Create file
           F.Handle:=FileCreate(F.Name);
           // Check handle
           if (F.Handle = (-1)) then
              // Return last error
              result:=UniInternalClose(F, GetLastError)
           else
           begin
              // Set the default marker, which is FEFF
              lpUniRec^.UniEncode:=$FEFF;
              // FIX ME: Write documentation for this bug fix before committing this file to CVS.
              // Write the marker to the file
              wd := $FEFF;
              if not(FileWrite(F.Handle, wd(*lpUniRec^.UniEncode*), SizeOf(Word)) = SizeOf(Word))  then
              begin
                 // Return last error
                 result:=UniInternalClose(F, GetLastError);
              end;
           end;
        end;
        // Called from Append(...)
        fmInOut  :
        begin
           // Open the file in read / write mode
           F.Handle:=FileOpen(F.Name, fmOpenReadWrite or fmShareDenyNone);
           // Check handle
           if (F.Handle = (-1)) then
              // Return last error
              result:=UniInternalClose(F, GetLastError)
           else
           begin
              // Read first 2 bytes, which must be either FFFE or FEFF
              if not(FileRead(F.Handle, lpUniRec^.UniEncode, SizeOf(Word)) = SizeOf(Word)) or not((lpUniRec^.UniEncode = $FFFE) or (lpUniRec^.UniEncode = $FEFF)) then
                 // Perform internal close
                 result:=UniInternalClose(F, ERROR_INVALID_DATA)
              else
              begin
                 // Seek to end of the file
                 SetFilePointer(F.Handle, 0, nil, FILE_END);
                 // File mode needs to be switched back to output
                 F.Mode:=fmOutput;
              end;
           end;
        end
     else
        // Make sure file mode gets set to fmClosed
        result:=UniInternalClose(F, ERR_NOTOPEN);
     end;
  finally
     // Check current mode
     if (F.Mode = fmInput) or (F.Mode = fmOutput) then
     begin
        // Allocate cache buffer and set flag
        PUniRec(@F.UserData)^.Buffer:=AllocMem(MAX_UNICACHE);
        PUniRec(@F.UserData)^.BufFull:=True;
     end;
  end;

end;


{*
  Converts the text in the file buffer between ANSII and Unicode
  If F.Mode is input then the text is converted from Unicode to ANSII and cached in memory
  If F.Mode is output then the text is converted from ANSII to Unicode and written to disk

  @param F Text file in Delphi's internal format for text files.
  @return ERR_NOERROR if successful, else ERROR_INVALID_ACCESS or ERR_NOTOPEN
  @comment Not much error trapping, especially for input mode. 
}
function UniInOut(var F: TTextRec): Integer;
var  lpUniRec:      PUniRec;
     dwSize:        Cardinal;
begin

  // Get user data record
  lpUniRec:=@F.UserData;

  // Check file struct
  if Assigned(lpUniRec^.Buffer) and not(F.Handle = (-1)) then
  begin
     // Set default bytes read
     F.BufEnd:=0;
     // Handle mode
     case F.Mode of
        // Input mode
        fmInput  :
        begin
           // Set buffer position
           F.BufPos:=0;
           // Read from file (cache the data)
           while (F.BufEnd < F.BufSize) do
           begin
              // Check to see if we need to refill the read ahead buffer
              if ((lpUniRec^.BufFull) and (lpUniRec^.BufPos = lpUniRec^.BufEnd)) then
              begin
                 // Read next block of data
                 lpUniRec^.BufPos:=0;
                 // Read file data
                 if not(ReadFile(F.Handle, lpUniRec^.Buffer^, MAX_UNICACHE, lpUniRec^.BufEnd, nil)) then lpUniRec^.BufEnd:=0;
                 // Check the data size read
                 if (lpUniRec^.BufEnd > 0) then
                 begin
                    // Swap bytes if big-endian data
                    if (lpUniRec^.UniEncode = $FFFE) then UniSwapData(lpUniRec);
                    // Convert unicode data to ansi data
                    StrPCopy(lpUniRec^.Buffer, WideCharLenToString(PWideChar(lpUniRec^.Buffer), lpUniRec^.BufEnd div 2));
                    // Update the buffer length
                    lpUniRec^.BufEnd:=StrLen(lpUniRec^.Buffer);
                 end;
                 // Was this a full buffer read
                 lpUniRec^.BufFull:=(lpUniRec^.BufEnd = MAX_ANSICACHE);
              end;
              // Check to see if we are at the end of file
              if (lpUniRec^.BufPos = lpUniRec^.BufEnd) then break;
              // Calculate cache block move size
              dwSize:=(lpUniRec^.BufEnd - lpUniRec^.BufPos);
              // How much can the file buffer handle
              if (dwSize > (F.BufSize - F.BufEnd)) then dwSize:=(F.BufSize - F.BufEnd);
              // Move the data
              Move(lpUniRec^.Buffer[lpUniRec^.BufPos], F.BufPtr[F.BufEnd], dwSize);
              // Update cache and file buffer pointers
              Inc(lpUniRec^.BufPos, dwSize);
              Inc(F.BufEnd, dwSize);
           end;
           // Set result
           result:=ERR_NOERROR;
        end;
        // Output mode
        fmOutput :
        begin
           // Set default result
           result:=ERR_NOERROR;
           // Check buf pos
           if (F.BufPos > 0) then
           begin
              // Convert the data in the file buffer to unicode
              lpUniRec^.BufEnd:=2 * MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, F.BufPtr, F.BufPos, PWideChar(lpUniRec^.Buffer), MAX_ANSICACHE);
              // Clear file buf pos
              F.BufPos:=0;
              // Swap bytes if big-endian data
              if (lpUniRec^.UniEncode = $FFFE) then UniSwapData(lpUniRec);
              // Write the data to the file
              FileWrite(F.Handle, lpUniRec^.Buffer^, lpUniRec^.BufEnd);
           end;
        end;
     else
        // Invalid mode
        result:=ERROR_INVALID_ACCESS
     end;
  end
  else
     // Invalid state
     result:=ERR_NOTOPEN;

end;


{*
  If the mode of F is output then the data is written to disk

  @param F Text file in Delphi's internal format for text files.
  @return The value of ERR_NOERROR if successful or an error code returned from UniInOut()
}
function UniFlush(var F: TTextRec): Integer;
begin

  // Check the mode for output
  if (F.Mode = fmOutput) then
     // Flush the data to disk
     result:=UniInOut(F)
  else
     // Don't error
     result:=ERR_NOERROR;
end;


{*
  Initializes F for handling Unicode operations for FileName

  @param F Text file type, standard of I/O procedures
  @param FileName Full path to text file to be converted
}
procedure AssignUnicode(var F: Text; FileName: String);
begin

  // Cast as TTextRec structure
  with TTextRec(F) do
  begin
     // Clear struct
     FillChar(TTextRec(F), SizeOf(TTextRec), 0);
     // Copy the filename into the struct
     StrPCopy(@Name, FileName);
     // Set file mode
     Mode:=fmClosed;
     // Invalidate the handle
     Handle:=(-1);
     // Clear the user data struct
     FillChar(UserData, SizeOf(UserData), 0);
     // Set internal buffer settings
     BufSize:=SizeOf(Buffer);
     BufPtr:=@Buffer;
     BufEnd:=0;
     // Bind the unicode handling text routines
     OpenFunc:=@UniOpen;
     InOutFunc:=@UniInOut;
     FlushFunc:=@UniFlush;
     CloseFunc:=@UniClose;
  end;

end;

end.