{*
MyGraphicsUtils.pas - Converting metafiles to bitmaps and graphics printing
-------------------
Begin: 2005/08/04
Last revision: $Date: 2009-08-18 20:06:23 $ $Author: rhupalo $
Version number: $Revision: 1.7 $
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

unit MyGraphicsUtils;

interface

  uses
    Windows,
    Types,
    Printers,
    Graphics
  ;

  function printImageSinglePage( metaFile: TMetaFile {; printer: TPrinter} ): boolean; overload;
  function printImageSinglePage( bitmap: TBitmap {; printer: TPrinter} ): boolean; overload;

  function createBitmap( metaFile: TMetaFile ): TBitmap;

  procedure printBitmap( canvas:TCanvas; destRect: TRect;  bitmap: TBitmap);

implementation

  uses
    SysUtils
  ;

  {*
     This function prints a Windows metafile, scaled to one sheet of paper.

     @param metaFile Metafile graphic to print
     @return true on success, otherwise failure
  }
  function printImageSinglePage( metaFile: TMetaFile {; printer: TPrinter} ): boolean;
    var
      bitmap: TBitmap;
    begin
      bitmap := createBitmap( metaFile );
      result := printImageSinglePage( bitmap {, printer} );
      bitmap.free();
    end
  ;

  {*
    This function converts a Windows metafile to a Windows bitmap.

    @param metaFile graphic to be converted
    @return Graphic in bitmap format
  }
  function createBitmap( metaFile: TMetaFile ): TBitmap;
    var
      bitmap: TBitmap;
    begin
      // Convert all types of images to a bitmap for printing
      // This is the code for Windows metafiles.
      // Other conversions exist for other formats.
      bitmap := TBitmap.Create();
      bitmap.Height := metaFile.Height;
      bitmap.Width := metaFile.Width;
      bitmap.PixelFormat := pf24bit; // avoid palette problems
      bitmap.Canvas.Draw( 0 , 0, metaFile );

      result := bitmap;
    end
  ;


  {*
    Prints a bitmap, scaled to one sheet of paper.
    The original version of this function printed several images in a grid.
    Some day, it might be nice to restore that functionality.

   This function is based on work by Earl F. Glynn
   (see http://www.efg2.com/Lab/ImageProcessing/SlideShow.htm),
   which was in turn based on posting to borland.public.delphi.winapi
   by Rodney E Geraghty, 8/8/97.

   @param bitmap Bitmap graphic to be printed
   @return true on success, otherwise failure
  }
  function printImageSinglePage( bitmap: TBitmap {; printer: TPrinter} ): boolean;
    var
      Column         :  INTEGER;
      //Index          :  INTEGER;
      iDelta         :  INTEGER;
      iImageWidth    :  INTEGER;
      iFromLeftMargin:  INTEGER;
      jFromTopOfPage :  INTEGER;
      jImageHeight   :  INTEGER;
      //jDelta         :  INTEGER;
      //jLargestThisRow:  INTEGER;
      TargetRectangle:  TRect;
      //------------------------------------------------------------------
      // For now, page headers and footers are not printed.  This code
      // is still in place, should we want to change that some day.
      //------------------------------------------------------------------
      (*
      function iCenterText(s:  string):  integer;
        begin
          result := (Printer.PageWidth - Printer.Canvas.TextWidth(s)) DIV 2
        end
      ;

      procedure PrintHeaderAndFooter();
        var
          PrintedName:  STRING;
        begin
          // Header
          Printer.canvas.font.Height := MulDiv(Printer.PageHeight, 3, 100);
          Printer.canvas.font.name := 'Arial';
          Printer.canvas.font.color := clBlack;

          PrintedName := 'My name';

          jFromTopOfPage :=  MulDiv(Printer.PageHeight, 4, 100);
          {
          IF   FormPrint.CheckBoxAnnotations.Checked
          THEN Printer.Canvas.TextOut(iCenterText(PrintedName), jFromTopOfPage, PrintedName);
          }

          Printer.canvas.font.Height := MulDiv(Printer.PageHeight, 15, 1000);
          jFromTopOfPage := Printer.PageHeight - 2*Printer.Canvas.TextHeight('X');

          // Footer
          iFromLeftMargin := MulDiv(Printer.PageWidth, 2 + 16*Column, 100);
          {
          IF   FormPrint.CheckBoxAnnotations.Checked
          THEN Printer.Canvas.TextOut(iFromLeftMargin, jFromTopOfPage,
                     FormatDateTime('m/d/yy h:nn', Now) + '  ' +
                     RadioGroupFileFormat.Items[RadioGroupFileFormat.ItemIndex] +
                     '  ' + FormPrint.EditFooterLabel.Text);
          }

          iFromLeftMargin := MulDiv(Printer.PageWidth, 8, 100);
          INC (PageCount);
          {
          IF  FormPrint.CheckBoxAnnotations.Checked HEN
            Printer.Canvas.TextOut(Printer.PageWidth - Printer.Canvas.TextWidth('Page XXXXXX'), jFromTopOfPage, Page ' + IntToStr(PageCount))
            ;
          }

           jFromTopOfPage := MulDiv(Printer.PageHeight, 8, 100);

           Printer.canvas.font.Height := MulDiv(Printer.PageHeight, 1, 100);
        end
      ;
      *)
      //------------------------------------------------------------------
    begin
      try
        try
          Printer.Orientation := poPortrait;
          Printer.BeginDoc;

          Column := 0;

          //jLargestThisRow := 0; // Never used??
          //iFromLeftMargin := MulDiv(Printer.PageWidth, 8, 100); // Never used??
          jFromTopOfPage := MulDiv(Printer.PageHeight, 8, 100);
          Printer.canvas.font.Height := MulDiv(Printer.PageHeight, 1, 100);

          //------------------------------------------------------------------
          // For now, page headers and footers are not printed.  This code
          // is still in place, should we want to change that some day.
          //------------------------------------------------------------------
          (*
          // Print page header and footer
          //-----------------------------
          IF   PrintHeaderFlag
          THEN BEGIN
            IF   PageCount > 0
            THEN Printer.NewPage;
            PrintHeaderAndFooter();
            PrintHeaderFlag := FALSE
          END;
          *)
          //------------------------------------------------------------------

          // Adjust image size for 1 sheet of paper
          //----------------------------------------
          // 98% divided by number of images per row
          iDelta := 980;

          // Start 1% from left margin + Delta Width * Column Index
          iFromLeftMargin := MulDiv(Printer.PageWidth, (10 + iDelta*Column), 1000);

          // 0.5% width between images
          iImageWidth  := MulDiv(Printer.PageWidth, iDelta-5, 1000);
          jImageHeight := MulDiv(iImageWidth, bitmap.Height, bitmap.Width);

          if( jImageHeight > Printer.PageHeight - 2*jFromTopOfPage ) then
            begin
              // Single image per per page won't fit in this
              // orientation, so adjust the size to fit
              jImageHeight := Printer.PageHeight - 2*jFromTopOfPage;
              iImageWidth  := MulDiv(jImageHeight, bitmap.Width, bitmap.Height);

              iFromLeftMargin := (Printer.PageWidth - iImageWidth) DIV 2;
            end
          ;

          (* // Never used??
          if( jImageHeight > jLargestThisRow ) then
            jLargestThisRow := jImageHeight
          ;
          *)

          TargetRectangle := Rect(
            iFromLeftMargin,
            jFromTopOfPage,
            iFromLeftMargin + iImageWidth,
            jFromTopOfPage  + jImageHeight
          );

          // Print the image
          PrintBitmap( Printer.Canvas, TargetRectangle, bitmap );
          result := true;
        finally
          Printer.EndDoc();
        end;
      except
        result := false;
      end;
    end
  ;

  
  {*
     This function is used to print bitmap on any Windows printer.

     This function is based on work by Earl F. Glynn
     (see http://www.efg2.com/Lab/ImageProcessing/SlideShow.htm),
     which was in turn based on posting to borland.public.delphi.winapi
     by Rodney E Geraghty, 8/8/97.

     @param Canvas Printer canvas
     @param DestRect Rectangle holding coordinates for positioning Bitmap on Canvas
     @param Bitmap  Bitmap graphic file to be printed
     @comment WARNING: the bitmap is not scaled.
  }
  procedure PrintBitmap(Canvas:  TCanvas; DestRect:  TRect;  Bitmap:  TBitmap);
    var
      BitmapHeader:  pBitmapInfo;
      BitmapImage :  POINTER;
      HeaderSize  :  DWORD;
      ImageSize   :  DWORD;
    begin
      GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
      GetMem(BitmapHeader, HeaderSize);
      GetMem(BitmapImage,  ImageSize);
      TRY
        GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
        StretchDIBits(Canvas.Handle,
                      DestRect.Left, DestRect.Top,     // Destination Origin
                      DestRect.Right  - DestRect.Left, // Destination Width
                      DestRect.Bottom - DestRect.Top,  // Destination Height
                      0, 0,                            // Source Origin
                      Bitmap.Width, Bitmap.Height,     // Source Width & Height
                      BitmapImage,
                      TBitmapInfo(BitmapHeader^),
                      DIB_RGB_COLORS,
                      SRCCOPY)
      FINALLY
        FreeMem(BitmapHeader);
        FreeMem(BitmapImage)
      END
    end
  ;

end.
