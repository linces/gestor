{*
ImageResources.pas  - Retrieves bit maps stored as resources in the executable
-------------------
Begin: 2005/03/02
Last revision: $Date: 2009-08-13 20:51:41 $ $Author: rhupalo $
Version number: $Revision: 1.4 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-13
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

As special exceptions, the copyright holder gives permission to link this program with Diamond Access
for Delphi and/or public domain software.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit ImageResources;

interface

  uses
    Graphics
  ;

  type
  /// Bitmap enumerated information style types
  TBitmapStyle = (
  	BITUnspecified = 0,
    BITQuestion = 1,
    BITWarning = 2,
    BITInformation = 3,
    BITCritical = 4,
    BITSuccess = 5
  );

  function bitmapFromResource( resourceName: string ): TBitmap;

  function bitmapStyle( style: TBitmapStyle ): TBitmap;


implementation

  uses
    SysUtils,
    
    MyStrUtils,
    DebugWindow
  ;

  const
    DBSHOWMSG: boolean = false; /// Set to true to enable debugging messages for this unit

  {*
    Loads a bitmap resource from the applications executable
    @param resourceName Name of graphic
    @return Bitmap
    @throws Catches the exception from the system if loading the image fails
  }
  function bitmapFromResource( resourceName: string ): TBitmap;
    var
      bmp: TBitmap;
    begin
      bmp := nil;

      try
        bmp := TBitmap.create();
        bmp.LoadFromResourceName( HInstance, resourceName );
      except
        dbcout( 'Exception caught in bitmapFromResource() with resource name ' + resourceName, DBSHOWMSG );
        freeAndNil( bmp );
      end;

      result := bmp;
    end
  ;

  {*
    Returns the bitmap for a particular bitmap information style
    @param style One of the bitmap information style enumerations
    @return Bitmap for the requested type of information style
  }
  function bitmapStyle( style: TBitmapStyle ): TBitmap;
    begin
      try
        case style of
          BITQuestion: result := bitmapFromResource( 'question' );
          BITWarning: result := bitmapFromResource( 'warning' );
          BITInformation: result := bitmapFromResource( 'info' );
          BITCritical: result := bitmapFromResource( 'critical' );
          BITSuccess: result := bitmapFromResource( 'success' ); // FIX ME: change this to the Success icon
        else
          result := nil
        end;
      except
        dbmsg( 'Cannot find resource ' + intToStr( ord( style ) ) );
        result := nil;
      end;
    end
  ;

end.
