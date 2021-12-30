{*
CompressionUtils.pas  - functions for compressing and decompressing files
--------------------
Begin: 2006/06/19
Last revision: $Date: 2009-08-13 19:10:48 $ $Author: rhupalo $
Version number: $Revision: 1.4 $
Code Documentation Tags: Begin 2009-08-10, Last Revision: 2009-08-10
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2006 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit CompressionUtils;

interface

  uses
    Classes
  ;

	function compressStream( aSource, aTarget: TStream ): boolean;
	function DecompressStream( aSource, aStreamDest: TStream ): boolean;

implementation

	uses
		SysUtils,
		ZLib
	;

  {*
    Compresses a stream from aSource as it is written to aTarget
    @param aSource input file
    @param aTarget compressed output file
    @return True is operation was a sucess
  }
	// Modifed from Marco Cantu: see Mastering Delphi 7
	function compressStream( aSource, aTarget: TStream ): boolean;
		var
			comprStream: TCompressionStream;
		begin
			comprStream := TCompressionStream.Create( clMax, aTarget );
			try
				try
					comprStream.CopyFrom( aSource, aSource.Size );
					result := true;
				except
					result := false;
				end;
			finally
				comprStream.Free;
			end;
		end
	;

  {*
    Decompresses a stream from aSource as it is written to aTarget
    @param aSource compressed input file (created by compressStream)
    @param aStreamDest decompressed output file
    @return True is operation was a sucess
  }
	// Modifed from Marco Cantu: see Mastering Delphi 7
	function DecompressStream( aSource, aStreamDest: TStream ): boolean;
		var
			decompStream: TDecompressionStream;
			nRead: Integer;
			Buffer: array [0..1023] of Char;
		begin
			decompStream := TDecompressionStream.Create(aSource);

			try
				try
					repeat
						nRead := decompStream.Read(Buffer, 1024);
						aStreamDest.Write( buffer, nRead );
					until nRead = 0;
					result := true;
				except
					result := false;
				end;

			finally
				decompStream.Free;
			end;
		end
	;


  end.