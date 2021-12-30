{*
CsvParser.pas  - Operations on a string list created from delimited text files or a strings
-------------
Begin: 2005/09/01
Last revision: $Date: 2012-08-14 19:08:44 $ $Author: areeves $
Version number: $Revision: 1.17 $
Code Documentation Tags: Begin 2009-08-11, Last Revision: 2009-08-12
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2012 Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Based on code by Jim Cooper
http://bdn.borland.com/borcon2004/article/paper/0,1963,32129,00.html
}

(*
 Documentation generation tags begin with {* or ///
 Replacing these with (* or // foils the documentation generator
*)

unit CsvParser;

interface

  uses
    Forms, // for the Application object
    Classes,

    QStringMaps,

    FunctionPointers,
    StringSuperList,
    I88n
  ;

  type

  /// For holding the contents of a CSV file/string
  {type} TCSVContents = class( TStringSuperList )
    protected
      _hasHeaderRow: boolean; /// Whether a header row of field names exists
      _success: boolean;      /// Used throughout class to indicate the success of some operation
      _separator: char;       /// line field delimiter
      _headers: TQStringIntMap;

      procedure setSeparator( const val: char );

      function getColumnCount(): integer;
      function getRowCount(): integer;
      function getAvgFieldCount(): integer;

      function getHasHeaderRow(): boolean;
      procedure setHasHeaderRow( val: boolean );

      function getSuccess(): boolean;

    public
      constructor create(
        const separator: char;
        const hasHeaderRow: boolean = false
      );

      constructor createFromFile(
        const fileName: string;
        const separator: char;
        const hasHeaderRow: boolean = false
      );

      constructor createFromString(
        str: string;
        const separator: char;
        const hasHeaderRow: boolean = false
      );

      destructor destroy(); override;

      procedure setString( str: string );

      function value( c, r: integer ): string; overload;
      function value( colName: string; r: integer ): string; overload;
      procedure setValue( c, r: integer; val: string ); overload;
      procedure setValue( colName: string; r: integer; val: string ); overload;

      function header( c: integer ): string;

      function rowIsEmpty( r: integer ): boolean;

      procedure debug();

      property columnCount: integer read getColumnCount;
      property rowCount: integer read getRowCount;
      property hasHeaderRow: boolean read getHasHeaderRow write setHasHeaderRow;
      property parseSuccess: boolean read getSuccess;
      property success: boolean read getSuccess;
      property avgFieldCount: integer read getAvgFieldCount;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TCsvParser and related classes, written by Jim Cooper
//-----------------------------------------------------------------------------
  {type} TCsvParser = class;  // Forward declaration for the benefit of TCsvParserState

   /// For some reason DelpiCodeToDoc is not detecting this member ...
  {type} TParserStateClass = class of TCsvParserState;


  /// Determines behaviour of parser after a character is parsed and type is identified
  {type} TCsvParserState = class(TObject)
    private
      FParser : TCsvParser;  /// Object doing the line parsing

      procedure ChangeState(NewState : TParserStateClass);
      procedure AddCharToCurrField(Ch : Char);
      procedure AddCurrFieldToList;

    protected
      _separator: char;  /// Line field delimiter character

    public
      constructor Create(AParser : TCsvParser; const separator: char );

      {*
        Used by the state objects to act on each line character as processing proceeds
        @param Ch  Character at Pos
        @param Pos Line position of Ch
      }
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); virtual; abstract;
    end
  ;

    /// Starting decision state 
  {type} TCsvParserFieldStartState = class(TCsvParserState)
    public
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); override;
    end
  ;

    /// Decision state to determine what to do while scanning the characters of a field
  {type} TCsvParserScanFieldState = class(TCsvParserState)
    public
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); override;
    end
  ;

    /// Decision state when a double-quote character is detected
  {type} TCsvParserScanQuotedState = class(TCsvParserState)
    public
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); override;
    end
  ;

   /// Decision state to determine what to do after an ending quote
  {type} TCsvParserEndQuotedState = class(TCsvParserState)
    public
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); override;
    end
  ;

   /// State to raise exception and show character on line causing parsing problem
  {type} TCsvParserGotErrorState = class(TCsvParserState)
    public
      procedure ProcessChar(Ch : AnsiChar;Pos : Integer); override;
    end
  ;

  /// Parses a line character by character
  {type} TCsvParser = class(TObject)
    private
      FState           : TCsvParserState;             /// Current state of parser instance
      // Cache state objects for greater performance
      FFieldStartState : TCsvParserFieldStartState;   /// Starting state
      FScanFieldState  : TCsvParserScanFieldState;    /// Within a field
      FScanQuotedState : TCsvParserScanQuotedState;   /// Detect quote
      FEndQuotedState  : TCsvParserEndQuotedState;    /// process end quote
      FGotErrorState   : TCsvParserGotErrorState;     /// Error state
      // Fields used during parsing                   
      FCurrField       : string;                      /// Current field in field list
      FFieldList       : TStrings;                    /// List of field names

      function  GetState : TParserStateClass;
      procedure SetState(const Value : TParserStateClass);

    protected
      _separator: char;  /// line field delimiter
      
      procedure AddCharToCurrField(Ch : Char);
      procedure AddCurrFieldToList;

      property State : TParserStateClass read GetState write SetState;
    public
      constructor Create( const sep: char );
      destructor  Destroy; override;

      procedure ExtractFields(const s : string;AFieldList : TStrings);
    end
  ;
//-----------------------------------------------------------------------------

implementation

  uses
    SysUtils,

    MyStrUtils,
    DebugWindow
  ;

  {*
    Creates empty CSV string list

    @param separator Line data delimiter character
    @param hasHeaderRow Whether a fieldname header line exists
  }
  constructor TCSVContents.create(
        const separator: char;
        const hasHeaderRow: boolean = false
      );
    begin
      inherited create();
      _hasHeaderRow := hasHeaderRow;

      if( hasHeaderRow ) then
        _headers := TQStringIntMap.create()
      else
        _headers := nil
      ;

      _success := true;
      setSeparator( separator );
    end
  ;


  {*
    Creates CSV string list and populates it from a file

    @param fileName CSV data file
    @param separator field delimiter character used in filename
    @param hasHeaderRow Whether a header line exists in filename
  }
  constructor TCSVContents.createFromFile(
        const fileName: string;
        const separator: char;
        const hasHeaderRow: boolean = false
      );
    var
      fs: TFileStream;
      csvText: string;
    begin
      inherited create();
      _hasHeaderRow := hasHeaderRow;

      if( hasHeaderRow ) then
        _headers := TQStringIntMap.create()
      else
        _headers := nil
      ;

      _success := true;
      setSeparator( separator );

      csvText := '';

      try
        fs := TFileStream.Create( fileName, fmOpenRead );

        try
          if( 0 <> fs.Size ) then
            begin
              setLength( csvText, fs.size );
              fs.Read( csvText[1], fs.Size );
            end
          ;
        finally
          fs.Free();
        end;

        setString( csvText );
      except
        _success := false;
      end;
    end
  ;


  {*
    Creates CSV string list and populates the first line from str

    @param str CSV string
    @param separator field delimiter character used in str
    @param hasHeaderRow Whether a header line exists in str
    @comment Document how the string should be formed when hasHeaderRow is True
  }
  constructor TCSVContents.createFromString(
        str: string;
        const separator: char;
        const hasHeaderRow: boolean = false
      );
    begin
      inherited create();
      _hasHeaderRow := hasHeaderRow;

      if( hasHeaderRow ) then
        _headers := TQStringIntMap.create()
      else
        _headers := nil
      ;

      _success := true;
      setSeparator( separator );

      setString( str );
    end
  ;


  /// Destructor for the object instance
  destructor TCSVContents.destroy();
    begin
      freeAndNil( _headers );
      inherited destroy();
    end
  ;


  {*
    Sets field separator character for protected member
    @param val Separator character
  }
  procedure TCSVContents.setSeparator( const val: char );
    begin
      _separator := val;
    end
  ;


  {*
    Returns the text in row r column c of the csv list
    @param c Column number
    @param r Row number
    @return Data in element rc or an empty string if index rc does not exist
  }
  function TCSVContents.value( c, r: integer ): string;
    var
      row: TStringList;
    begin
      if( hasHeaderRow ) then inc( r );

      row := self.at(r);

      if( nil <> row ) then
        begin
          if( c < row.Count ) then
            result := row[c]
          else
            begin
              //raise exception.Create( 'Index out of bounds in TCSVContents.value()' );
              result := '';
            end
          ;
        end
      else
        begin
          //raise exception.Create( 'Index out of bounds in TCSVContents.value()' );
          result := '';
        end
      ;
    end
  ;


  {*
    Returns the text in row r of column 'colName' of the csv list.
    Note that this object just have a header row, otherwise this function will raise an exception.
    @param colName Name of the column
    @param r Row number
    @return Data in element rc or an empty string if index rc does not exist
  }
  function TCSVContents.value( colName: string; r: integer ): string;
    begin
      if( not( hasHeaderRow ) ) then
        raise exception.Create( 'Cannot retrieve data by column name for CSVContents without headers' )
      ;

      result := value( _headers.Item[ fixup( colName ) ], r );
    end
  ;


  {*
    Checks whether row r is empty (does not exist)
    @param r Row number
    @return True if row r does not exist, false if the row is located
  }
  function TCSVContents.rowIsEmpty( r: integer ): boolean;
    var
      row: TStringList;
    begin
      if( hasHeaderRow ) then inc( r );

      row := self.at(r);

      if( nil = row ) then
        begin
          result := true;
          exit;
        end
      ;

      if( 0 = row.Count ) then
        result := true
      else
        result := false
      ;
    end
  ;


  {*
    Returns the data in column c of the header row

    @param c Index of column to be read from the header row
    @return Contents of the header row in column c
  }
  function TCSVContents.header( c: integer ): string;
    begin
      if( hasHeaderRow and ( -1 < self.rowCount ) ) then
        result := self.at(0)[c]
      else
        result := ''
      ;

    end
  ;


  {*
    Writes the contents of val to column c row r of the CSV list

    @param c Column index
    @param r Row index
    @param val data text to insert
    @throws An exception is raised if c or r exceed index bounds
  }
  procedure TCSVContents.setValue( c, r: integer; val: string );
    begin
      if( hasHeaderRow ) then inc( r );

      if( ( r < self.rowCount ) and ( c < self.columnCount ) ) then
        self.at(r)[c] := val
      else
        raise exception.Create( 'Array index out of bounds in TCSVContents.setValue' )
      ;
    end
  ;


  {*
    Writes the contents of val to the column with the name colName of row r of the CSV list.
    Note that this object must have a header row for this function to work.

    @param colName Name of the selected column
    @param r Row index
    @param val data text to insert
    @throws An exception is raised if c or r exceed index bounds
  }
  procedure TCSVContents.setValue( colName: string; r: integer; val: string );
    begin
      if( not( hasHeaderRow ) ) then
        raise exception.Create( 'Cannot retrieve data by column name for CSVContents without headers' )
      ;

      self.setValue( _headers.Item[ fixup( colName ) ], r, val );
    end
  ;


  {*
    Appends the contents of str into the CSV list
    @param str Text string to be appended
  }
  procedure TCSVContents.setString( str: string );
    var
      TempList: TStringList;
      FieldList: TStringList;
      i: Integer;
      FParser: TCsvParser;
    begin
      self.Clear();
      _headers.clear();

      // Break the document into lines
      FParser := TCsvParser.create( _separator );
      TempList  := TStringList.Create();

      try
        try
          TempList.Text := str;

          for i := 0 to TempList.Count - 1 do
            begin
              FieldList := TStringList.Create();
              FParser.ExtractFields( TempList[i], FieldList );
              self.append( fieldList );
            end
          ;

          (*
          if( 0 < self.Count ) then
            begin
              _success := true;
              rowLength := self.at(0).count;
              // Check that all rows are the same length
              for j := 1 to self.Count -1 do
                if( self.at(j).Count <> rowLength ) then
                  begin
                    dbcout( 'Row length mismatch' );
                    _success := false;
                  end
                ;
              ;
            end
          else
            _success := true
          ;
          *)

          {rbh20101004: fix me!
            Some kind of check would be useful; without one, this function returns true
            when any text file (with or without commas, even an xml file) is sucessfully read.
            This can occur in a call from TFormHerdListEditor.createListFromFile when the file type is UNKNOWN_FILE_FORMAT.
            Any text file passed here that can be read will evaluate successful and then the import will fail later anyhow.

            As a work-around, I added the property avgFieldCount. It's value can be used as a check; a value of 6 or 7 indicates
            the file might be a herd file for example.
          }

          _success := true;

        except
          _success := false;
        end;

      finally
        TempList.Free();
        FParser.Free();
      end;

      if( _success and hasHeaderRow ) then
        begin
          for i := 0 to self.columnCount - 1 do
            _headers.insert( fixup( header(i) ), i )
          ;
        end
      ;
    end
  ;


  {*
    Count of the number of columns in the CSV list
    @return Count of Columns
  }
  function TCSVContents.getColumnCount(): integer;
    begin
      if( 0 < self.Count ) then
        result := self.at(0).count
      else
        result := 0
      ;
    end
  ;


  {*
    Count of the number of rows in the CSV list
    @return Count of rows
    @comment The header row, if there is one, is not included in the count
  }
  function TCSVContents.getRowCount(): integer;
    begin
      if( hasHeaderRow ) then
        result := self.Count - 1
      else
        result := self.Count
      ;
    end
  ;

  {*
    Count of the average number of fields in the lines of the CSV list
    @return Count of average number of fields delimited in each line
    @comment The header row, if there is one, is included in the average
  }
  function TCSVContents.getAvgFieldCount(): integer;
    var
      i : integer;
      sum: double;
    begin

      if ( 1 > self.Count ) then
        begin
          result := 0;
          exit;
        end
      ;

      sum := 0;
      for i := 0 to self.Count -1 do
        begin
          sum := sum + self.at(i).Count;
        end
      ;
      result := Round( sum / self.Count );
    end
  ;


  {*
    Indicates whether this CSV list has a header row
    @return True if CSV list has a header row
  }
  function TCSVContents.getHasHeaderRow(): boolean;
    begin
      result := _hasHeaderRow;
    end
  ;


  {*
    Sets private member for whether this CSV list has a header row
    @param val True if CSV list has a header row
  }
  procedure TCSVContents.setHasHeaderRow( val: boolean );
    begin
      _hasHeaderRow := val;
    end
  ;


  {*
    Returns whether the last operation was sucessful
    @return Returns true if _sucess is true.
  }
  function TCSVContents.getSuccess(): boolean;
    begin
      result := _success;
    end
  ;


  /// Outputs a table of the header and field values and a count of rows and columns
  procedure TCSVContents.debug();
    var
      r, c: integer;
      str: string;
    begin
      dbcout( '---Begin CSV contents', true );

      if( _success ) then
        begin
          dbcout( 'Has header row: ' + usBoolToText( hasHeaderRow ), true );
          dbcout( 'Number of rows: ' + intToStr( self.rowCount ), true );
          dbcout( 'Number of columns: ' + intToStr( self.columnCount ), true );

          if( hasHeaderRow ) then
            begin
              str := 'HEADER: ';
              for c := 0 to self.getColumnCount - 1 do
                begin
                  str := str + self.header( c );

                  if( c < self.getColumnCount - 1 ) then
                    str := str + _separator + ' '
                  ;
                end
              ;
              dbcout( str, true );
            end
          ;

          for r := 0 to self.getRowCount - 1 do
            begin
              str := '';

              for c := 0 to self.getColumnCount - 1 do
                begin
                  str := str + self.value( c, r );

                  if( c < self.getColumnCount - 1 ) then
                    str := str + _separator + ' '
                  ;
                end
              ;

              dbcout( str, true );
            end
          ;
        end
      else
        dbcout( '(CSV parsing failed)', true )
      ;

      dbcout( '---End CSV contents', true );
    end
  ;


//-----------------------------------------------------------------------------
// TCsvParser and related classes, written by Jim Cooper
//-----------------------------------------------------------------------------

  {*
    Create CSV String Parser instance
    @param region sets System Regional setting
    @throws Exception raised if region is not region setting type is unrecognized
  }
  constructor TCsvParser.Create( const sep: char );
  begin
    inherited Create();

    _separator := sep;

    FFieldStartState := TCsvParserFieldStartState.Create( Self, _separator );
    FScanFieldState  := TCsvParserScanFieldState.Create( Self, _separator );
    FScanQuotedState := TCsvParserScanQuotedState.Create( Self, _separator );
    FEndQuotedState  := TCsvParserEndQuotedState.Create( Self, _separator );
    FGotErrorState   := TCsvParserGotErrorState.Create( Self, _separator );
  end;


  /// Destructor of object instance
  destructor TCsvParser.Destroy;
  begin
    FFieldStartState.Free;
    FScanFieldState.Free;
    FScanQuotedState.Free;
    FEndQuotedState.Free;
    FGotErrorState.Free;
    inherited;
  end;


  {*
    Returns the state of the parser
    @return state
  }
  function TCsvParser.GetState : TParserStateClass;
  begin
    Result := TParserStateClass(FState.ClassType);
  end;


  {*
    Sets the state of the parser
    @param Value state
  }
  procedure TCsvParser.SetState(const Value : TParserStateClass);
  begin
    if Value = TCsvParserFieldStartState then begin
      FState := FFieldStartState;
    end else if Value = TCsvParserScanFieldState then begin
      FState := FScanFieldState;
    end else if Value = TCsvParserScanQuotedState then begin
      FState := FScanQuotedState;
    end else if Value = TCsvParserEndQuotedState then begin
      FState := FEndQuotedState;
    end else if Value = TCsvParserGotErrorState then begin
      FState := FGotErrorState;
    end;
  end;


  {*
    Creates a list of field names from the contents of s, delimited by _separator (regional setting delimiter)

    @param s String containing field names
    @param AFieldList
    @throws Raises exception if a closing quote is missing from around a field name
    @comment Field names can be contained in quotes ( "my field name" )
  }
  procedure TCsvParser.ExtractFields(const s : string;AFieldList : TStrings);
    var
      i  : Integer;
      Ch : AnsiChar;
  begin
    FFieldList := AFieldList;
    Assert(Assigned(FFieldList),'FieldList not assigned');
    // Initialize by clearing the string list, and starting in FieldStart state
    FFieldList.Clear;
    State      := TCsvParserFieldStartState;
    FCurrField := '';

    // Read through all the characters in the string
    for i := 1 to Length(s) do begin
      // Get the next character
      Ch := s[i];
      FState.ProcessChar(Ch,i);
    end;

    // If we are in the ScanQuoted or GotError state at the end
    // of the string, there was a problem with a closing quote
    if (State = TCsvParserScanQuotedState) or
       (State = TCsvParserGotErrorState) then begin
      raise Exception.Create('Missing closing quote');
    end;

    // If the current field is not empty, add it to the list
    if (FCurrField <> '') then begin
      AddCurrFieldToList;
    end;
  end;


  {*
    A field name is created character by character as the line is parsed
    @param Ch Character to add to the current field name
  }
  procedure TCsvParser.AddCharToCurrField(Ch : Char);
  begin
    FCurrField := FCurrField + Ch;
  end;


  {*
    Appends current field name to the list
  }
  procedure TCsvParser.AddCurrFieldToList;
  begin
    FFieldList.Add(FCurrField);
    // Clear the field in preparation for collecting the next one
    FCurrField := '';
  end;


  { TCsvParserState }

  {*
     Constructor for an instance of TCsvParserState

     @param AParser instance of TCsvParser
     @param separator Delimiter character to set private member _separator
  }
  constructor TCsvParserState.Create(AParser : TCsvParser; const separator: char );
  begin
    inherited Create();
    _separator := separator;
    FParser := AParser;
  end;


  {*
    Changes the state of the instance of TCsvParserState to NewState
    @param NewState State change
  }
  procedure TCsvParserState.ChangeState(NewState : TParserStateClass);
  begin
    FParser.State := NewState;
  end;


  {*
    Adds Ch to the current field
    @param Ch Character to add
  }
  procedure TCsvParserState.AddCharToCurrField(Ch : Char);
  begin
    FParser.AddCharToCurrField(Ch);
  end;


  {*
    Adds current field to the field list
  }
  procedure TCsvParserState.AddCurrFieldToList;
  begin
    FParser.AddCurrFieldToList;
  end;


  { TCsvParserFieldStartState }

  {*
    Processes the current character of the line and changes state if Ch is a double-quote
    @param Ch Current character - a delimiter, quote, or part of field name
    @param Pos Not being used by procedure, but needed for TCsvParserGotErrorState
    @throws Raises exception if _serarator character is not valid
  }
  procedure TCsvParserFieldStartState.ProcessChar(Ch : AnsiChar;Pos : Integer);
  begin
    if( #0 = _separator ) then
      raise exception.Create( '_separator unspecifed in TCsvParserFieldStartState.ProcessChar()' )
    ;

    if( '"' = Ch ) then
      ChangeState(TCsvParserScanQuotedState)
    else if( _separator = Ch ) then
      AddCurrFieldToList
    else
      begin
        AddCharToCurrField(Ch);
        ChangeState(TCsvParserScanFieldState);
      end
    ;
  end;


  { TCsvParserScanFieldState }

  {*
    Processes the current character of the line and changes state if Ch is the field delimiter
    @param Ch Current character - a delimiter, quote, or part of field name
    @param Pos Not being used by procedure, but needed for TCsvParserGotErrorState
    @throws Raises exception if _separator character is not valid
  }
  procedure TCsvParserScanFieldState.ProcessChar(Ch : AnsiChar;Pos : Integer);
  begin
    if( #0 = _separator ) then
      raise exception.Create( '_separator unspecifed in TCsvParserScanFieldState.ProcessChar()' )
    ;

    if (_separator = Ch ) then begin
      AddCurrFieldToList;
      ChangeState(TCsvParserFieldStartState);
    end else begin
      AddCharToCurrField(Ch);
    end;
  end;


  { TCsvParserScanQuotedState }

  {*
    Processes the current character of the line and changes state if Ch is a double-quote
    @param Ch Current character - a delimiter, quote, or part of field name
    @param Pos Not being used by procedure, but needed for TCsvParserGotErrorState
  }
  procedure TCsvParserScanQuotedState.ProcessChar(Ch : AnsiChar;Pos : Integer);
  begin
    if ( '"' = Ch ) then begin
      ChangeState(TCsvParserEndQuotedState);
    end else begin
      AddCharToCurrField(Ch);
    end;
  end;


  { TCsvParserEndQuotedState }

  {*
    Processes the current character of the line following an ending double quote
    @param Ch Current character - a delimiter, quote, or part of field name
    @param Pos Not being used by procedure, but needed for TCsvParserGotErrorState
    @throws Raises exception if _separator character is not valid
  }
  procedure TCsvParserEndQuotedState.ProcessChar(Ch : AnsiChar;Pos : Integer);
  begin
    if( #0 = _separator ) then
      raise exception.Create( '_separator unspecifed in TCsvParserEndQuotedState.ProcessChar()' )
    ;

    if ( _separator = Ch) then begin
      AddCurrFieldToList;
      ChangeState(TCsvParserFieldStartState);
    end else begin
      ChangeState(TCsvParserGotErrorState);
    end;
  end;


  { TCsvParserGotErrorState }

  {*
    Error occured at the current character of the line
    @param Ch Current character
    @param Pos Indicates line position where parsing failed
    @throws Raises exception indicating line position
  }
  procedure TCsvParserGotErrorState.ProcessChar(Ch : AnsiChar;Pos : Integer);
  begin
    raise Exception.Create(Format('Error in line at position %d',[Pos]));
  end;
//-----------------------------------------------------------------------------


end.
