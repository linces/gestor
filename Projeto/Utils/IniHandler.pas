{*
IniHandler.pas  - ini configuration file management
--------------
Begin: 2005/03/01
Last revision: $Date: 2011-10-25 04:40:49 $ $Author: areeves $
Version number: $Revision: 1.16 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-13
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
Author: Aaron Reeves <aaron@aaronreeves.com>
--------------------------------------------------
Copyright (C) 2005 - 2011 Animal Population Health Institute, Colorado State University
Modifications Copyright (C) 2011 Gryphon Scientific
-
This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
  Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit IniHandler;

interface

  uses
    Variants,
    CStringList,
    QStringMaps
  ;

  type
    /// For maintainting Windows initialization (ini) files
    TIniHandler = class
      protected
        sections: TQStringObjectMap; /// Holds additional instances of TQStringVariantMap, one for each section of the INI file
        iniSettings: TQStringVariantMap; /// holds name-value pairs from input ini file
        fileName: string;                /// holds the ini path and filename


        function isComment( const str: string ): boolean;
        function isSection( const str: string ): boolean;
        function extractSectionName( const str: string ): string;
        procedure makeIniSettings( iniLines: TCStringList );

      public
        constructor create( const iniFileName: string );
        destructor destroy(); override;

        function section( const name: string ): TQStringVariantMap;
        function val( const key: string; const section: string = '' ): variant;
        function str( const key: string; const section: string = '' ): string;
        function hasKey( const key: string ): boolean;
        procedure update( const key: string; const val: variant );

        procedure writeFile();

        procedure debug();
      end
    ;

implementation

  uses
    SysUtils,
    StrUtils,
    MyStrUtils,
    DebugWindow
  ;

  CONST DBSHOWMSG = false; /// Set to true to enable debugging messages for this unit

//-----------------------------------------------------------------------------
// Construction/initialization/destruction
//-----------------------------------------------------------------------------

  {*
    Creates ini file management object, filled with parameters from iniFileName

    @param iniFileName Path and ini filename
    @comment iniFileName must exist
  }
  constructor TIniHandler.create( const iniFileName: string );
    var
      iniFile: TextFile;
      tmp: string;
      iniLines: TCStringList;
    begin
      sections := TQStringObjectMap.create();
      iniSettings := TQStringVariantMap.create();
      fileName := iniFileName;

      if( not( fileExists( fileName ) ) )then
        begin
          exit;
        end
      else
        begin
          iniLines := TCStringList.create();

          try
          	try
              assignFile( iniFile, iniFileName );
              reset( iniFile );

              while not( eof( iniFile ) ) do
                begin
                  readln( iniFile, tmp );
                  iniLines.append( tmp );
                end
              ;

            	closeFile( iniFile );
            	makeIniSettings( iniLines );
            except
              // fail silently
            end;
          finally
            freeAndNil( iniLines );
          end;

        end
      ;

    end
  ;

  /// Frees memory of the object
  destructor TIniHandler.destroy();
    var
      i: integer;
      map: TQStringVariantMap;
    begin
      for i := 0 to sections.count - 1 do
        begin
          map := sections.itemAtIndex( i ) as TQStringVariantMap;
          map.Free();
        end
      ;
      freeAndNil( sections );
      freeAndNil( iniSettings );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Read functions
//-----------------------------------------------------------------------------
  function TIniHandler.section( const name: string ): TQStringVariantMap;
    begin
      result := sections[name] as TQStringVariantMap;
    end
  ;

  {*
    Returns the value for key

    @param key Name of field
    @return Value for key, if not found then null is returned
    @comment The key and value are also sent to dbcout
    @comment Note that a variant is being returned, caller beware!
  }
  function TIniHandler.val( const key: string; const section: string = '' ): variant;
    var
      map: TQStringVariantMap;
    begin
      if( strIsEmpty( section ) ) then
        map := iniSettings
      else
        map := sections[section] as TQStringVariantMap
      ;

      if( nil = map ) then
        result := null
      else
        begin
          if( map.contains( key ) ) then
            result := map[key]
          else
            result := null
          ;
        end
      ;

      dbcout( key, DBSHOWMSG );
      dbcout( varToStr( result ), DBSHOWMSG );
    end
  ;

  {*
    Returns the value for key as a string

    @param key Name of field
    @return Text value for key, if not found then null is returned
  }
	function TIniHandler.str( const key: string; const section: string = '' ): string;
  	var
    	v: variant;
    begin
   		v := val( key, section );
      if( null = v ) then
      	result := ''
      else
      	result := string( v )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Write functions
//-----------------------------------------------------------------------------

  {*
    Updates setting key with val

    @param key Field name
    @param val Value to be set
    @comment Currently no checking that key exists
  }
  procedure TIniHandler.update( const key: string; const val: variant );
    begin
      //if( iniSettings.HasKey( key ) ) then iniSettings.Delete( key );
      iniSettings[key] := val;
      //showMessage( iniSettings[key] );
    end
  ;

  /// Writes the ini file from the iniSettings list to disk
  procedure TIniHandler.writeFile();
    var
      iniFile: textfile;
      i, j: integer;
      s: string;
      v: variant;
      map: TQStringVariantMap;
      sectionName: string;
    begin

    	try
        dbcout( 'Writing ini file ' + fileName, DBSHOWMSG );
        assignFile( iniFile, fileName );
        rewrite( iniFile );

        for i := 0 to (iniSettings.Count-1) do
          begin
            s := iniSettings.keyAtIndex( i );

            v := iniSettings.itemAtIndex( i );
            if( ( null <> v ) and ( not( strIsEmpty( string( v ) ) ) ) ) then
              s := s + ' = ' + string( iniSettings.itemAtIndex( i ) )
            ;
            writeln( iniFile, s );
          end
        ;

        for j := 0 to sections.count - 1 do
          begin
            writeln( iniFile, endl );
            sectionName := sections.keyAtIndex( j );
            map := sections.itemAtIndex( j ) as TQStringVariantMap;

            writeln( iniFile, '[' + sectionName + ']' );
            for i := 0 to map.count - 1 do
              begin
                s := map.keyAtIndex( i );
                v := map.itemAtIndex( i );

                if( null <> v ) and ( not( strIsEmpty( string( v ) ) ) ) then
                  s := s + ' = ' + string( map.itemAtIndex( i ) )
                ;
                writeln( iniFile, s );
              end
            ;
          end
        ;

        closeFile( iniFile );
      except
      	// fail silently.  writing an INI file isn't worth it.
      end;
      
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Reading functions
//-----------------------------------------------------------------------------

  {*
    Searches the ini file for fieldname key

    @param key Configuration setting (field) name
    @return True if key is located, else false
  }
  function TIniHandler.hasKey( const key: string ): boolean;
    begin
      if( not( iniSettings.contains( key ) ) ) then
        result := false
      else
        begin
          if( iniSettings[key] = null ) then
            result := false
          else
            result := true
          ;
        end
      ;
    end
  ;


  function TIniHandler.isComment( const str: string ): boolean;
    begin
      // Assumes format "# This is a comment"
      result := ( '#' = charAt( str, 0 ) );
    end
  ;

  function TIniHandler.isSection( const str: string ): boolean;
    begin
      // Assumes format "[sectionName]"
      result := ( '[' = charAt( str, 0 ) );
    end
  ;


  function TIniHandler.extractSectionName( const str: string ): string;
    begin
      // Assumes format "[sectionName]"
      result := leftStr( str, length( str ) - 1 );
      result := rightStr( result, length( result ) - 1 );
    end
  ;


  {*
    Worker method for TIniHandler constructor to fill member iniSettings from
    and input ini file. iniLines contains all the lines of the ini file. This
    method skips the section names and epmty lines, creating name-value pairs
    for iniSettings list. Also outputs (to dbcout) the contents of iniSettings
    as it is populated.

    @param iniLines Contents of an ini file
  }
  procedure TIniHandler.makeIniSettings( iniLines: TCStringList );
    var
      p: PChar;
      str: string;
      line: TCStringList;
      sectionSettings: TQStringVariantMap;
      sectionName: string;
    begin
      line := TCStringList.create();

      p := iniLines.first();

      // Until the first section heading is encountered, everything goes into iniSettings
      // (This is the "default" or "main" section.)
      sectionSettings := iniSettings;

      while( nil <> p ) do
        begin
          str := trim( p );
          dbcout( str, DBSHOWMSG );

          if( ( not( strIsEmpty( str ) ) ) and ( not( isComment( str ) ) ) ) then
            begin
              if( isSection( str ) ) then
                begin
                  sectionName := extractSectionName( str );
                  sectionSettings := TQStringVariantMap.create();
                  sections.insert( sectionName, sectionSettings );
                end
              else
                begin
                  // Assumes format "key" or "key = value".
                  // If "key" only, a null variant is inserted into the map with that key.
                  // Otherwise, a key/value pair is inserted into the map.
                  if( 0 = ansiPos( '=', str ) ) then
                    sectionSettings[trim(str)] := null
                  else
                    begin
                      line.clear();
                      dbcout( 'STR: ' + str, DBSHOWMSG );
                      line.explode( str, '=' );
                      dbcout( 'LINE:', DBSHOWMSG );
                      if( DBSHOWMSG ) then
                        line.debug()
                      ;
                      sectionSettings[trim(line.first())] := trim( line.last() );
                    end
                  ;
                end
              ;
            end
          ;

          p := iniLines.next();
        end
      ;

      line.Clear();
      line.Free();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Debugging
//-----------------------------------------------------------------------------
  procedure TIniHandler.debug();
    var
      j: integer;
      section: string;
      m: TQStringVariantMap;

      procedure mapDebug( map: TQStringVariantMap );
        var
          i: integer;
          key, val: string;
        begin
          for i := 0 to map.count - 1 do
            begin
              key := map.keyAtIndex( i );
              val := string( map[ key ] );
              if( strIsEmpty( val ) ) then
                val := '(null value)'
              ;
              dbcout( 'Key: ' + key + ', value: ' + val, true );
            end
          ;
        end
      ;
    begin
      dbcout( endl + '=== begin INI debug', true );
      dbcout( 'Main section:', true );
      mapDebug( iniSettings );

      for j := 0 to sections.count - 1 do
        begin
          dbcout( endl, true );
          section := sections.keyAtIndex( j );
          dbcout( 'Section "' + section + '"', true );
          m := sections[section] as TQStringVariantMap;
          mapDebug( m );
        end
      ;

      dbcout( '=== end INI debug', true );
    end
  ;
//-----------------------------------------------------------------------------

end.
