{*
InterfaceUtils.pas - interface-to-object cast
-------------------
Begin: 2005/04/02
Last revision: $Date: 2009-08-14 22:24:22 $ $Author: rhupalo $
Version number: $Revision: 1.7 $
Code Documentation Tags: Begin 2009-08-14, Last Revision: 2009-08-14
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University
-
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
-
  Performs an "interface-to-object cast", something which apparently is
  more difficult than a person might think.
-
  This function, rightfully described as a potentially fragile hack,
  was written by Hallvard Vassbotn and is copied from his blog
  (http://hallvards.blogspot.com/2004/07/hack-7-interface-to-object-in-delphi.html).
  It was also published in the October 2004 issue of Delphi Magazine
  (http://www.thedelphimagazine.com).  Unfortunately, the article is not
  available online, but can be purchased from the Delpi Magazine website
}

(*
  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit InterfaceUtils;

interface

  function GetImplementingObject(const I: IInterface): TObject;

implementation

  {*
    Hack to return object implementing the interface
    @param I Interface implemented by an object
    @return The object implementing I
    @comment Could introduce implementation dependancies to user of the interface
  }
  function GetImplementingObject(const I: IInterface): TObject;
    const
      AddByte = $04244483;
      AddLong = $04244481;
    type
      PAdjustSelfThunk = ^TAdjustSelfThunk;
      TAdjustSelfThunk = packed record
        case AddInstruction: longint of
          AddByte : (AdjustmentByte: shortint);
          AddLong : (AdjustmentLong: longint);
      end;

      PInterfaceMT = ^TInterfaceMT;
      TInterfaceMT = packed record
        QueryInterfaceThunk: PAdjustSelfThunk;
      end;

      TInterfaceRef = ^PInterfaceMT;
    var
      QueryInterfaceThunk: PAdjustSelfThunk;
    begin
      Result := Pointer(I);

      if Assigned(Result) then
        begin
          try
            QueryInterfaceThunk := TInterfaceRef(I)^. QueryInterfaceThunk;
            case QueryInterfaceThunk.AddInstruction of
              AddByte: Inc(PChar(Result), QueryInterfaceThunk.AdjustmentByte);
              AddLong: Inc(PChar(Result), QueryInterfaceThunk.AdjustmentLong);
              else Result := nil;
            end;
          except
            Result := nil;
          end;
        end
      ;
    end
  ;

end.
