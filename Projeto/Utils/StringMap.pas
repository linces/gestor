{*
StringMap.pas - list container for strings
--------------
Begin: 2005/01/07
Last revision: $Date: 2009-08-26 16:54:46 $ $Author: rhupalo $
Version number: $Revision: 1.7 $
Code Documentation Tags: Begin 2009-08-26, Last Revision: 2009-08-26
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2006 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit StringMap;

interface

uses
  CStringList
;


type
  /// String container; note inherits from TCStringList, not TStringList
  TStringMap = class( TCStringList )

    public
      //function find( val: integer ): string; overload;
      function find( val: string ): integer; overload;

  end
;

implementation

  {*
     Searches the strings of the list for val
     @param val Text being sought as a list item
     @return The index of the string matching val or -1 if not found
  }
  function TStringMap.find( val: string ): integer;
    var
      searchee: pchar;
      i: integer;
      found: boolean;
    begin

      found := false;

      for i := 0 to (count-1) do
        begin
          searchee := at( i );
          if( searchee = val ) then
            begin
              found := true;
              break;
            end
          ;
        end
      ;

      if( found = true ) then
        result := i
      else
        result := -1
      ;

    end
  ;
  
end.
