{*
I88n.pas  - support for language translation of model output
--------
Begin: 2008/01/23
Last revision: $Date: 2010-05-20 05:01:32 $ $Author: areeves $
Version number: $Revision: 1.14 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-31
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2008 - 2010 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
   Documentation generation tags begin with {* or ///
   Replacing these with (* or // foils the documentation generator
*)

unit I88n;

{$INCLUDE Defs.inc}

interface

  uses
    Controls,
    Classes
  ;


  type
  /// Enumeration of language types
  TI88nLanguageCode = (
    I88nUnknown,
    I88nEnglish,
    I88nSpanish
  );
  
  // FIX ME: Rename all functions with the prefix 'i88n'.
  function systemLanguage(): TI88nLanguageCode;

  function languageSupported( val: TI88nLanguageCode ): boolean;

  procedure setLanguage( const val: TI88nLanguageCode );
  function i88nLanguage(): TI88nLanguageCode;
  function i88nLanguageCodeString(): string;

  procedure buildI88nDictionaryFromFile( const fileName: string );

  function tr( const english: string ): string;

  function sysDecPt(): char;
  function sysListSep(): char;

  function csvDecPt(): char;
  function csvListSep(): char;

  function i88nCsv( const stringList: TStringList ): string;

  function i88nLicense(): string;

  type
  /// Container for localization settings
  TI88nSettings = class
    protected
      _useCustomListSeparator: boolean;  /// Flag to use custom character instead of the system locale charcter
      _useCustomDecimalSymbol: boolean;  /// Flag to use custom character instead of the system locale charcter

      _customListSeparator: char;  /// A custom list value separator (alternative to the system locale character)
      _customDecimalSymbol: char;  /// A custom decimal character (an alternative to the system locale character)

      function getListSeparator(): char;
      function getDecimalSymbol(): char;

      procedure setListSeparator( val: char );
      procedure setDecimalSymbol( val: char );

    public
      constructor create(); virtual;
      destructor destroy(); override;

      property useCustomListSeparator: boolean read _useCustomListSeparator write _useCustomListSeparator;
      property useCustomDecimalSymbol: boolean read _useCustomDecimalSymbol write _useCustomDecimalSymbol;

      property listSeparator: char read getListSeparator write setListSeparator;
      property decimalSymbol: char read getDecimalSymbol write setDecimalSymbol;
  end
  ;

  procedure i88nSetSettings( settings: TI88nSettings );

implementation

  {$R 'licenses\licenses.res' 'licenses\licenses.rc'}

  uses
    Windows,
    SysUtils,
    StrUtils,

    CStringList,
    MyStrUtils,
    DebugWindow,
    QStringMaps,
    Resources
    (*,
    MyDialogs
    *)
  ;

  var
    _languageSet: boolean;         /// Whether a language is set
    _language: TI88nLanguageCode;  /// The language
    _dict: TQStringStringMap;      /// English to other language phrase mapping
    _settings: TI88nSettings;      /// translation settings
    {$IFDEF DEBUG}
      _missingDictionaryNoted: boolean;  /// Languages' dictionary is missing
    {$ENDIF}

  //---------------------------------------------------------------------------
  // Public functions
  //---------------------------------------------------------------------------

  {*
     Uses current locale settings to determine translation language type
    @return I88nUnknown if not english or spanish
  }
  function systemLanguage(): TI88nLanguageCode;
    begin
      case SysLocale.PriLangID of
        LANG_ENGLISH: result := I88nEnglish;
        LANG_SPANISH: result := I88nSpanish;
        else result := I88nUnknown;
      end;
    end
  ;


  {*
    Determines whether translation services are supported for val
    @param val Language type code
    @return True if translation is supported for val
  }
  function languageSupported( val: TI88nLanguageCode ): boolean;
    begin
      result := (
        ( I88nEnglish = val )
      or
        ( I88nSpanish = val )
      );
    end
  ;

  /// Loads phrase translations into a list
  procedure buildDictionary();
    var
      bigString: string;
      strList: TCStringList;
      ptr: pchar;
      key, val: string;
      //i: integer;
    begin
      case _language of
        {$IFDEF DEBUG}
        I88nEnglish: bigString := getResourceAsString( 'englishToSpanish' );
        {$ENDIF}
        I88nSpanish: bigString := getResourceAsString( 'englishToSpanish' );
        // Other languages might some day be added here.
      end;

      if( nil <> _dict ) then
        freeAndNil( _dict )
      ;
      _dict := TQStringStringMap.create();

      strList := TCStringList.create();
      strList.text := bigString;

      ptr := strList.first();
      while nil <> ptr do
        begin
          key := getElementStr( 0, CHAR_TAB, ptr );
          val := getElementStr( 1, CHAR_TAB, ptr );
          _dict.insert( key, val );
          ptr := strList.next();
        end
      ;

      strList.free();

      (*
      // Debugging code
      for i := 0 to _dict.count - 1 do
        begin
          dbcout( _dict.keyAtIndex(i), true );
          dbcout( _dict.itemAtIndex(i), true );
        end
      ;
      *)
    end
  ;


  {*
    Sets the language and builds a translation dictionary
    @param val Language type
    @comment The language can not be changed while the program is running
  }
  procedure setLanguage( const val: TI88nLanguageCode );
    begin
      if( true = _languageSet ) then
        dbcout( 'I88n: Language is already set.  It cannot be changed while the program is running.', true )
      else
        begin
          _languageSet := true;

          case val of
            I88nEnglish:
              begin
                _language := I88nEnglish;
                {$IFDEF DEBUG}
                  // If debugging, build the dictionary anyway to look for missing phrases.
                  buildDictionary();
                {$ELSE}
                  freeAndNil( _dict );
                {$ENDIF}
              end
            ;
            I88nSpanish:
              begin
                _language := I88nSpanish;
                buildDictionary();
              end
            ;
            else
              begin
                dbcout( 'I88n: Language set to an inappropriate value.', true );
                _language := I88nEnglish;
              end
            ;
          end;
        end
      ;
    end
  ;

  {*
    Returns the code for current language 
    @return Current language type
  }
  function i88nLanguage(): TI88nLanguageCode;
    begin
      result := _language;
    end
  ;


  {*
    Returns a 2-character code (e.g., "en" for English") for the currently selected language
    @return String containing 2-character code for the currently selected language
  }
  function i88nLanguageCodeString(): string;
    begin
      case _language of
        I88nEnglish: result := 'en';
        I88nSpanish: result := 'es';
      else
        begin
          raise exception.Create( 'Unrecognized language in i88nLanguageCodeString' );
          result := 'en';
        end
      ;
      end;
    end
  ;


  {*
    Builds a translation dictionary from a delimited text file
    @param fileName Language type
    @comment Method does not set the language type
  }
  procedure buildI88nDictionaryFromFile( const fileName: string );
    var
      strToParse: string;
      dictFile: TextFile;
      key, val: string;
    begin
      if( nil <> _dict ) then
        freeAndNil( _dict )
      ;

      _dict := TQStringStringMap.create();

      try
        try
          AssignFile( dictFile, fileName );
          Reset( dictFile );

          while not eof( dictFile ) do
            begin
              readLn( dictFile, strToParse );
              key := getElementStr( 0, CHAR_TAB, strToParse );
              val := getElementStr( 1, CHAR_TAB, strToParse );
              _dict.insert( key, val );
            end
          ;
        except
          dbcout( 'I88n: Dictionary file could not be opened.', true );
          freeAndNil( _dict );
          exit;
        end;
      finally
        closeFile( dictFile );
      end;
    end
  ;

  {*
    Returns the decimal seperator character used by the system
    @return locale decimal seperator character
  }
  function sysDecPt(): char;
    begin
      result := DecimalSeparator;
    end
  ;

  {*
    Returns the locale character used to separate items in a list
    @return locale list item seperator character
  }
  function sysListSep(): char;
    begin
      result := ListSeparator;
    end
  ;


  {*
    Returns the decimal seperator character used by the system
    @return locale decimal seperator character
  }
  function csvDecPt(): char;
    begin
      if( nil = _settings ) then
        result := SysUtils.DecimalSeparator
      else
        result := _settings.decimalSymbol
      ;
    end
  ;

  {*
    Returns the locale character used to separate items in a list
    @return locale list item seperator character
  }
  function csvListSep(): char;
    begin
      if( nil = _settings ) then
        result := SysUtils.ListSeparator
      else
        result := _settings.listSeparator
      ;
    end
  ;


  {*
    Translation of phrase in english to _language using the phrase dictionary
    @param english The phrase in English
    @return translated phrase if found, else the english input phrase
    @comment If the programming is running in Debug more info is provided about
    what is missing if the translation phrase isn't found.
  }
  function tr( const english: string ): string;
    begin
      {$IFDEF DEBUG }
        // When debugging is enabled, this block will write any missing phrases or translations to the
        // debug window for easy retrieval and correction.
        if( nil = _dict ) then
          begin
            if( not( _missingDictionaryNoted ) ) then
              begin
                dbXlation( 'I88n:    Missing dict!' );
                _missingDictionaryNoted := true;
              end
            ;
          end
        else if( not( _dict.HasKey( english ) ) ) then
          dbXlation( 'I88n:  Missing phrase:' + '  ' + english )
        else
          begin
            result := _dict.Item[ english ];
            if( 0 = length( trim( result ) ) ) then
              dbXlation( 'I88n: Missing xlation:' + '  ' + english )
            ;
          end
        ;
      {$ENDIF}

      if( I88nEnglish = _language ) then
        result := english
      else if( nil = _dict ) then
        result := english
      else if( not( _dict.HasKey( english ) ) ) then
        result := english
      else
        begin
          result := _dict.Item[ english ];
          if( 0 = length( trim( result ) ) ) then
            result := english
          ;
        end
      ;
    end
  ;

  {*
    Returns the locale setting values used for separating items in a list
    @param stringList The collection of current parameters for delimiting list values
    @return Delimiter based on locale setting
    @comment FIX ME: A lot of uncertainty regarding what is going on here. Revisit!!
  }
  function i88nCsv( const stringList: TStringList ): string;
    var
      oldDelimiter: char;
      oldQuote: char;
    begin
      oldDelimiter := stringList.Delimiter;
      oldQuote := stringList.QuoteChar;

      stringList.Delimiter := csvListSep();
      stringList.QuoteChar := '"';

      result := stringList.DelimitedText;

      stringList.Delimiter := oldDeLimiter;
      stringList.QuoteChar := oldQuote;
    end
  ;

  {*
    FIX ME: Total uncertainty regarding what is going on here. Revisit!!
    @return Uncertain
  }
  function i88nLicense(): string;
    var
      str: string;
    begin
      case _language of
        I88nEnglish: str := getResourceAsString( 'gpl' );
        I88nSpanish: str := getResourceAsString( 'gplSpanish' );
        // Other languages might some day be added here.
      else
        str := getResourceAsString( 'gpl' )
      ;
      end;

      result := str;
    end
  ;

  {*
    Setter for private member _settings
    @param settings localization settings object, see class
    @return current I88 localization settings
  }
  procedure i88nSetSettings( settings: TI88nSettings );
    begin
      _settings := settings;
    end
  ;
  //---------------------------------------------------------------------------



  //---------------------------------------------------------------------------
  // TI88nSettings
  //---------------------------------------------------------------------------

    /// Creates I88 settings object using the System for assigning list and decimal characters
    constructor TI88nSettings.create();
      begin
        inherited create();

        _useCustomListSeparator := false;
        _useCustomDecimalSymbol := false;

        _customListSeparator := SysUtils.listSeparator;
        _customDecimalSymbol := SysUtils.decimalSeparator;
      end
    ;

    /// Frees object
    destructor TI88nSettings.destroy();
      begin
        inherited destroy();
      end
    ;

    {*
      Returns a custom list separator if one is defined or the one for the locale
      @return List separator character
    }
    function TI88nSettings.getListSeparator(): char;
      begin
        if( _useCustomListSeparator ) then
          result := _customListSeparator
        else
          result := SysUtils.ListSeparator
        ;
      end
    ;

    {*
      Returns a custom decimal separator if one is defined or the one for the locale
      @return Decimal separator character
    }
    function TI88nSettings.getDecimalSymbol(): char;
      begin
        if( _useCustomDecimalSymbol ) then
          result := _customDecimalSymbol
        else
          result := SysUtils.DecimalSeparator
        ;
      end
    ;

    {*
      Setter for defining a custom list separator character
      @param val Character to set as the list value separator
    }
    procedure TI88nSettings.setListSeparator( val: char ); begin _customListSeparator := val; end;
    
    {*
      Setter for defining a custom list decimal symbol
      @param val Character to set as the decimal symbol
    }
    procedure TI88nSettings.setDecimalSymbol( val: char ); begin _customDecimalSymbol := val; end;
    
  //---------------------------------------------------------------------------


initialization
  _dict := nil;
  _language := I88nEnglish;
  _languageSet := false;
  _settings := nil;
  {$IFDEF DEBUG}
    _missingDictionaryNoted := false;
  {$ENDIF}

finalization
  if( nil <> _dict ) then
    _dict.Free()
  ;

end.