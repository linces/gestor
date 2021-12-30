{*
SqlClasses.pas - Connect to and manipulate a database
---------------
Begin: 2005/01/07
Last revision: $Date: 2012-08-14 19:11:56 $ $Author: areeves $
Version number: $Revision: 1.79 $
Code Documentation Tags: Begin 2009-08-06, Last Revision: 2009-08-26
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>, <aaron@aaronreeves.com>
--------------------------------------------------
Copyright (C) 2005 - 2012 Colorado State University

Code in this file is based on original C++ code for the program JetSQLConsole:
please see http://www.aaronreeves.com/jetsqlconsole.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit SqlClasses;

interface

  uses
    Contnrs,
    Classes,
    Variants,
    DB,
    ADOX_TLB, // MS ADOX classes: Project -> Import Type Library -> Microsoft ADO Ext 2.x for DLL and Security
              // See http://delphi.about.com/library/nosearch/npf072401.htm for installation details
    ADODB,
    ADOInt,
    JRO_TLB,  // MS Jet engine: Project -> Import Type Library -> Microsoft Jet and Replication Objects 2.6 Library
    QStringMaps,
    CStringList
   ;
    (*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
    *)

  { If this function returns false, the Sqlite DLL didn't load and this type cannot be used. }
  function sqliteDllLoaded( msg: pstring = nil ): boolean;

  const
    DATABASE_NULL_VALUE: string = 'NULL';  /// NULL
  type TSqlDBType = ( DBUnspecified, DBMySQL, DBMSAccess, DBSqlite, DBDbf ); /// enumerated database types, MySQL and Access are specifically supported.  At least partial support is available for Sqlite databases and DBF files.
  type TSqlDBAction = ( DBNoAction, DBOpen, DBCreate );  /// enumerated types of Connection state to a database
  type TQueryType = ( QUnspecified, QInsert, QUpdate ); /// enumerated types of SQL command operation types
  type TQueryDictionary = class( TQStringStringMap ) end; /// List for holding the keys and values of insert and update queries

  function writeQuery(
    const table: string;
    queryType: TQueryType;
    list: TQueryDictionary;
    const whereClause: string = ''
  ): string; overload;

  function writeQuery(
    const table: string;
    queryType: TQueryType;
    list: TQStringVariantMap;
    const whereClause: string = ''
  ): string; overload;

  function sqlQuote( const val: string; const dbType: TSqlDBType ): string;
  function sqlBool( const val: boolean; const dbType: TSqlDBType ): string;  
  function sqlDateTime( const val: TDateTime; const dbType: TSqlDBType ): string;

  type TSqlResult = class; // Forward declaration for the benefit of TSqlDatabase

  {*
    Class for connecting to a database and implementing DML and DDL commands.
    Two database vendors are supported (MySQL, Access).
  }
  {type} TSqlDatabase = class
    protected
      _type: TSqlDBType;  /// type of database, either Access, MySQL, or Sqlite
      _name: string;      /// full path to database file
      _user: string;      /// databae user name
      _password: string;  /// database password
      _host: string;      /// MySQL parameter only; server name or IP address
      _isOpen: boolean;   /// True if connection successfull, false otherwise
      _port: integer;     /// MySQL parameter only, port of host server

      _errorOnOpen: boolean;  /// Flag set to true if ADO connection fails
      _lastError: string;     /// Error msg created when an SQL command fails

      _adoConn: TADOConnection; /// ADO component
      _adoCat: TADOXCatalog;    /// ADO component
      _adoQuery: TAdoQuery;     /// ADO component
      _adoTable: TADOTable;     /// ADO component
      _adoDataset: TADODataSet; /// ADO component
      _adoConnStr: string;      /// ADO component

      _sqlite: pointer; /// Handle to Sqlite database, if database type is DBSqlite

      _quickUpdate: boolean;  /// used by TSqlDatabase
      _quickInsert: boolean;  /// used by TSqlDatabase
      _quickTableName: string;
      _quickUpdateIndex: integer;
      
      _transactionInProgress: boolean;

      _sqlResult: TSqlResult;  /// See class

      _checkingOpen: boolean;
      _autoReopen: boolean;

      procedure createSqlResult();
      procedure initialize();
      procedure setType( val: TSqlDBType ); 
      procedure setName( val: string );
      procedure setUser( val: string );
      procedure setPassword( val: string );
      procedure setHost( val: string );
      procedure setIsOpen( val: boolean );
      procedure setPort( val: integer );

      function getType(): TSqlDBType;
      function getName(): string;
      function getUser(): string;
      function getPassword(): string;
      function getHost(): string;
      function getIsOpen(): boolean;
      function getPort(): integer;

      procedure waitForExecuteComplete();

    public
      constructor create(); overload; /// Default Constructor, no parameters
      constructor create(
        dbType: TSqlDBType;
        dbName: string;
        dbAction: TSqlDBAction;
        dbUser: string = '';
        dbPassword: string = '';
        dbHost: string = '';
        dbPort: integer = 3306
      ); overload;

      destructor destroy(); override;

      function execute( query: string ): boolean; virtual;

      function lastInsertID(): integer;

      procedure saveFileInBlob( fileName, tableName, fieldName: string; row: integer = 1 );
      function getFileFromBlob( filename, tableName, fieldName: string; row: integer = 1 ): boolean;

      procedure writeBlobFromStream( srcStream: TStream; tableName, fieldName: string; row: integer = 1 );
      function createStreamFromBlob( tableName, fieldName: string; row: integer = 1 ): TMemoryStream;

      function count( query: string ): integer; // Shortcut for TSqlResult.numRows

      function open(): boolean;
      procedure close();
      //function lockTables(): boolean;
      //function unlockTables(): boolean;

      function createTableList(): TStringList;
      function createTableConstraintList( const table: string ): TStringList;

      function indexExists( const index: string; const table: string ): boolean;
      function fieldExists( const field: string; const table: string ): boolean;
      function tableExists( const table: string ): boolean;
      function recordsExist( const table: string ): boolean;
      function getDatabaseBoolean( const fieldName: string; const tableName: string ): boolean;
      function getDatabaseCount( const tableName: string ): integer;

      procedure startQuickUpdate( tableName, indexName: string );
      procedure quickUpdate( indexValue: variant; fieldName: string; newValue: variant ); overload; virtual;
      procedure quickUpdate( fieldName: string; newValue: variant ); overload;
      procedure quickDelete( fieldName: string; indexValue: variant );
      procedure endQuickUpdate();

      procedure startQuickInsert( tableName: string );
      function quickInsert( dict: TQStringVariantMap; keyField: string = '' ): integer; virtual;
      procedure endQuickInsert();

      function compact( reOpen: boolean = false ): boolean;

      function sqlQuote( const val: string ): string;
      function sqlBool( const val: boolean ): string;

      function startTransaction(): boolean;
      function commitTransaction(): boolean;
      function rollbackTransaction(): boolean;

      property connectionString: string read _adoConnStr;
      property autoReopen: boolean read _autoReopen write _autoReopen;
      property dbType: TSqlDBType read getType write setType;
      property name: string read getName write setName;
      property user: string read getUser write setUser;
      property password: string read getPassword write setPassword;
      property host: string read getHost write setHost;
      property isOpen: boolean read getIsOpen write setIsOpen;
      property port: integer read getPort write setPort;

      property adoQuery: TAdoQuery read _adoQuery;            
    end
  ;

  {*
    Class to contain the field names and the datarow element of a recordset
  }
  {type} TSqlRow = class
    protected
      _va: array of variant;  /// array of field values
      _fm: TCStringList;      /// list of field names or indexes
      _count: integer;        /// count of fields in row

    public
      constructor create( fm: TCStringList ); overload;
      procedure append( v: variant );
      function field( fieldIndex: integer ): variant; overload;
      function field( fieldName: string ): variant; overload;
      function fieldExists( fieldName: string ): boolean;
      procedure debug();
      property fieldCount: integer read _count;   /// number of fields in row, read-only
      property numFields: integer read _count;    /// number of fields in row, read-only
    end
  ;

  {*
    Class to represent the rows in a recordset
  }
  {type} TRowList = class( TObjectList )
    protected
      _currentIndex: integer;  /// index of current record

      procedure setObject( index: integer; item: TSqlRow );
      function getObject( index: integer ): TSqlRow;

    public
      function append( dm: TSqlRow ): integer;
      procedure insert( index: integer; dm: TSqlRow );
      property objects[ index: integer]: TSqlRow read getObject write setObject; default;
      function first(): TSqlRow;
      function last(): TSqlRow;
      function next(): TSqlRow;
      function current(): TSqlRow;
    end
  ;

  {*
     Main class using the other helper classes to access and query a database
  }
  {type} TSqlResult = class
    protected
      _numRows: integer;      /// number of rows in record set
      _affectedRows: integer; /// number of rows affected by the query operation
      _numFields: integer;    /// number of fields in the record set
      _success: boolean;      /// whether the SQL operation was successful
      _conn: TSqlDatabase;    /// see class

      _rs: TRowList;          /// container holding the data rows
      _fieldMap: TCStringList; ///list of the field names in the record set 

      _lastError: string;     /// Last error message raised from an exception

      procedure initialize();
      procedure doQuery( query: string; dbConn: TSqlDatabase );
      procedure runSelectQuery( query: string; dbConn: TSqlDatabase );
      procedure runOtherQuery( query: string; dbConn: TSqlDatabase );

      function isSelect( query: string ): boolean;
      function isOther( query: string ): boolean;

      procedure setNumRows( val: integer );
      procedure setAffectedRows( val: integer );
      procedure setNumFields( val: integer );
      procedure setSuccess( val: boolean );
      procedure setConn( val: TSqlDatabase );

      function getNumRows(): integer;
      function getAffectedRows(): integer;
      function getNumFields(): integer;
      function getSuccess(): boolean;
      function getConn(): TSqlDatabase;

    public
      constructor create( query: string; dbConn: TSqlDatabase ); overload;
      constructor create( dbConn: TSqlDatabase ); overload;
      constructor create(); overload;
      destructor destroy(); override;

      procedure runQuery( query: string );
      procedure describeTable( tableName: string );

      function fetchArrayFirst(): TSqlRow;
      function fetchArrayNext(): TSqlRow;
      function fetchArray( i: integer ): TSqlRow;

      procedure debug();

      property numRows: integer read getNumRows;            /// Returns the number of rows in the result recordset
      property affectedRows: integer read getAffectedRows;  /// Returns the number of rows in the databse that the query will affect
      property numFields: integer read getNumFields;        /// Returns the number of fields in the result recordset
      property success: boolean read getSuccess;            /// Returns whether the query operation was a successs
      property conn: TSqlDatabase read getConn write setConn;   /// Returns or sets the queries database connection object
    end
  ;

implementation

	uses
    Windows,
		Forms, // declares the 'application' class
  	SysUtils,
    DateUtils,
    StrUtils,
    MyStrUtils,
    DebugWindow,
    MyDialogs,
    ComObj // Defines exceptions affecting ADO classes
  ;

  const
  	DBSQLCLASSES: boolean = true; /// set to true to enable debugging messages for this unit.

    SQLITE_OK = 0; /// Indicates that something SQLite-related worked properly
    SQLITE_ROW = 100;  /// sqlite3_step() has another row ready
    SQLITE_DONE = 101;  /// sqlite3_step() has finished executing

    // Sqlite data types
    SQLITE_INTEGER = 1;
    SQLITE_FLOAT = 2;
    SQLITE3_TEXT = 3;
    SQLITE_BLOB = 4;
    SQLITE_NULL = 5;

    DSQLITE_READ_ONLY = 0;
    DSQLITE_READ_WRITE = 1;

  var
    loadErrors: string;
    sqliteLoaded: boolean;
    dsqlitewrapperLoaded: boolean;

    sqlite3_open: function( dbName: pchar; dbPtrPtr: pointer ): integer; cdecl;
    sqlite3_close: function( dbPtr: pointer ): integer; cdecl;
    sqlite3_exec: function( dbPtr: pointer; sql: pchar; unused1, unused2: pointer; errMsg: pchar ): integer; cdecl; // Executes a query.
    sqlite3_changes: function( dbPtr: pointer ): integer; cdecl; // Returns number of rows affected by an INSERT, UPDATE, or DELETE query.
    sqlite3_prepare_v2: function( dbPtr: pointer; sql: pchar; sqlLen: integer; stmtPtrPtr: pointer; tailPtrPtr: pointer ): integer; cdecl; // Sets up a SELECT query.
    sqlite3_step: function( stmtPtr: pointer ): integer; cdecl; // Used to step through results for a SELECT query.
    sqlite3_data_count: function( stmtPtr: pointer ): integer; cdecl; // Returns column count for a SELECT query.
    sqlite3_column_name: function( stmtPtr: pointer; idx: integer ): pchar; cdecl; // Returns name of column idx for a SELECT query.
    sqlite3_column_type: function( stmtPtr: pointer; idx: integer ): integer; cdecl; // Returns the data type (SQLITE_INTEGER - SQLITE_NULL) for a SELECT query;
    sqlite3_column_text: function( stmtPtr: pointer; idx: integer ): pchar; cdecl; // Returns value of a field (as text) for a SELECT query.
    sqlite3_column_int: function( stmtPtr: pointer; idx: integer ): integer; cdecl; // Returns value of a field (as an integer) for a SELECT query.
    sqlite3_column_double: function( stmtPtr: pointer; idx: integer ): double; cdecl; // Returns value of a field (as a double) for a SELECT query.

    sqlite3_finalize: function( stmtPtr: pointer ): integer; cdecl; // Finalizes a SELECT query.
    sqlite3_last_insert_rowid: function( dbPtr: pointer ): int64; cdecl;

    sqlite3_bind_blob: function( stmtPtr: pointer; idx: integer; dat: pointer; size: integer; unused: pointer ): integer; cdecl;
    sqlite3_blob_open: function( dbPtr: pointer; dbName, tableName, fieldName: pchar; rowNum: integer; flags: integer; blobPtrPtr: pointer ): integer; cdecl;
    sqlite3_blob_bytes: function( blobPtr: pointer ): integer; cdecl;
    sqlite3_blob_close: function( blobPtr: pointer ): integer; cdecl;
    sqlite3_blob_read: function( blobPtr: pointer; dat: pointer; datSize: integer; offset: integer ): integer; cdecl;
    sqlite3_blob_write: function( blobPtr: pointer; dat: pointer; datSize: integer; offset: integer ): integer; cdecl;

    dsqlite3_blob_open: function( dbPtr: pointer; dbName, tableName, fieldName: pchar; rowNum: integer; flags: integer ): pointer; cdecl;
//-----------------------------------------------------------------------------
// Helper functions
//-----------------------------------------------------------------------------
  {*
    Writes the SQL command text based on the input parameters
    @param table Name of table where SQL operation will occur
    @param queryType Type of query, see class
    @param list Changes (fieldnames, values) for update and insert queries, see class
    @param whereClause Where clause for SQL statement including keyword 'WHERE'
    @return A SQL statement
    @throws raises exception if query type is not an Insert or Update
  }
	function writeQuery(
  		const table: string;
      queryType: TQueryType;
      list: TQueryDictionary;
      const whereClause: string = ''
  	): string;
  	var
      fields, values: string;
      it: TQStringStringMapIterator;
  	begin
    	fields := '';
      values := ''; 

    	if( queryType = QInsert ) then
      	begin

        it := TQStringStringMapIterator.create( list );
          // INSERT query
        	while( not it.Done() ) do
          	begin
            	fields := fields + '`' + it.key() + '`';
              values := values + it.value();
              it.incr();
              if( not it.Done() ) then
              	begin
              		fields := fields + ', ';
                  values := values + ', ';
                end
              ;
            end
          ;
          it.Free();

          result := 'INSERT INTO `' + table + '` ( ' + fields + ' ) VALUES ( ' + values + ' )';

        end
      else if( queryType = QUpdate ) then
      	begin

      		// UPDATE query
          it := TQStringStringMapIterator.create( list );
          while( not it.Done() ) do
          	begin
           		values := values + '`' + it.key() + '` = ' + it.value();
              it.incr();
              if( not it.Done() ) then
                values := values + ', ';
            end
          ;
          it.Free();
          result := 'UPDATE `' + table + '` SET ' + values + ' ' + whereClause;

        end
      else
      	begin
      		// Unhandled query
      		raise exception.create( 'This part of WriteQuery hasn''t been written yet' );
          result := '';
        end
      ;
    end
  ;


  {*
    Writes the SQL command text based on the input parameters
    @param table Name of table where SQL operation will occur
    @param queryType Type of query, see class
    @param list Changes (fieldnames, values) for update and insert queries, see class
    @param whereClause Where clause for SQL statement including keyword 'WHERE'
    @return A SQL statement
    @throws raises exception if query type is not an Insert or Update
  }
  function writeQuery(
    const table: string;
    queryType: TQueryType;
    list: TQStringVariantMap;
    const whereClause: string = ''
  ): string;
  	var
      fields, values: string;
      //it: TQStringVariantMapIterator;
      i: integer;
  	begin
    	fields := '';
      values := ''; 

    	if( queryType = QInsert ) then
      	begin
          for i := 0 to list.count - 1 do
            begin
              fields := fields + '`' + list.keyAtIndex( i ) + '`';
              values := values + string( list.itemAtIndex( i ) );

              if( i < (list.count - 1 ) ) then
              	begin
              		fields := fields + ', ';
                  values := values + ', ';
                end
              ;
            end
          ;

          result := 'INSERT INTO `' + table + '` ( ' + fields + ' ) VALUES ( ' + values + ' )';

        end
      else if( queryType = QUpdate ) then
      	begin

      		// UPDATE query
          for i := 0 to list.count - 1 do
          	begin
           		values := values + '`' + list.keyAtIndex( i ) + '` = ' + string( list.itemAtIndex( i ) );

              if( i < (list.count - 1 ) ) then
                values := values + ', '
              ;
            end
          ;
          result := 'UPDATE `' + table + '` SET ' + values + ' ' + whereClause;

        end
      else
      	begin
      		// Unhandled query
      		raise exception.create( 'This part of WriteQuery hasn''t been written yet' );
          result := '';
        end
      ;
    end
  ;


  {*
   Manages quote marks inside a string to meet database specific requirements
   Quote marks within a string are reformatted with an escape character
   @param val The string value that contains an unescaped quote mark
   @param dbType Indicates the database type (Access or MySQL), see class
   @return Reformatted string
  }
  function sqlQuote( const val: string; const dbType: TSqlDBType ): string;
    begin
      case dbType of
        DBSqlite:
          begin
            // In MySql and Sqlite, single quotes (') are used to indicate strings.
            // Quote marks inside a string are escaped with a another single quote: ''
            result := stringReplace( val, '''', '''''', [rfReplaceAll] );
            result := '''' + result + '''';
          end
        ;
        DBMySQL:
          begin
            // In MySql, single quotes (') are used to indicate strings.
            // Quote marks inside a string are escaped with a back slash: \'
            result := stringReplace( val, '''', '\''', [rfReplaceAll] );
            result := '''' + result + '''';
          end
        ;
        DBMSAccess:
          begin
            // In MSAccess, double quotes (") are used to indicate strings.
            // Quote marks inside a string are escaped with another quote mark: ""
            result := stringReplace( val, '"', '""', [rfReplaceAll] );
            result := '"' + result + '"';
          end
        ;
        DBDbf:
          begin
            // FIX ME: Not sure what to do for DBF files.  For now, follow Access.
            result := stringReplace( val, '"', '""', [rfReplaceAll] );
            result := '"' + result + '"';
          end
        ;
        else // Default case
          begin
            raise exception.create( 'Unsupported database type in sqlQuote()' );
            result := val;
          end
        ;
      end;
    end
  ;


  {*
   Manages boolean values to meet database specific requirements
   @param val The boolean value to be formatted
   @param dbType Indicates the database type
   @return Formatted string (e.g., "true" or "false", or "1" or "0", depending on the database type)
  }
  function sqlBool( const val: boolean; const dbType: TSqlDBType ): string;
    begin
      case dbType of
        DBMSAccess: result := usBoolToText( val );
        DBMySQL: result := usBoolToText( val );
        DBDbf: result := usBoolToText( val ); // FIX ME: Not sure about this...
        DBSqlite:
          begin
            if( val ) then
              result := '1'
            else
              result := '0'
            ;
          end
        ;
        else raise exception.Create( 'Unsupported database type in sqlBool()' );
      end;
    end
  ;


  function sqlDateTime( const val: TDateTime; const dbType: TSqlDBType ): string;
    var
      year, month, day: string;
      hour, minute, second: string;
    begin
      if( DBMySQL = dbType ) then
        begin
          year := intToStr( yearOf( val ) );
          month := paddedInt( monthOf( val ), 2 );
          day := paddedInt( dayOf( val ), 2 );

          hour := paddedInt( monthOf( val ), 2 );
          minute := paddedInt( monthOf( val ), 2 );
          second := paddedInt( monthOf( val ), 2 );

          result := year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
          result := sqlQuote( result, DBMySQL );
        end
      else
        result := sqlQuote( dateToStr( val ), dbType )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Construction/initialization/destruction
//-----------------------------------------------------------------------------

  /// initializes TSqlDatabase instance
	constructor TSqlDatabase.create();
  	begin
			initialize();
    end
  ;

  {*
    Creates a connection to a database and attemps to open it.
    The databse must be an Access or MySQL; no logic for type dbUnspecified.
    A Access database can be specified or created.
    A MySQL database cannot be created, only opened.

    @param dbType Database type, see type
    @param dbName Full path to database file
    @param dbAction Connection state, see type
    @param dbUser Database access user name
    @param dbPassword Database access password
    @param dbHost Server domain name or IP Address hosting database
    @param dbPort Port to access database on the host server
    @Comment Error handling should be added for TSqlDBType is dbUnspecified.
  }
	constructor TSqlDatabase.create( dbType: TSqlDBType; dbName: string; dbAction: TSqlDBAction; dbUser: string = ''; dbPassword: string = ''; dbHost: string = ''; dbPort: integer = 3306 );
    var
    	createStr: string;
  	begin
      // Perform initialization, regardless of type.
      //--------------------------------------------
    	initialize();


      // Sqlite databases do not use ADO.
      //---------------------------------
      if( DBSqlite = dbType ) then
        begin
          // Sqlite will create a new database if the file doesn't exist,
          // and will open an existing database if the user wants to create a new one.
          // Make sure that DBOpen and DBCreate are OK.
          if( ( DBCreate = dbAction ) and ( fileExists( dbName ) ) ) then
            raise exception.Create( 'Database "' + dbName + '" already exists when trying to create it in TSqlDatabase.create()' )
          ;

          if( ( DBOpen = dbAction ) and not( fileExists( dbName ) ) ) then
            raise exception.Create( 'Database "' + dbName + '" does not exist when trying to open it in TSqlDatabase.create()' )
          ;

          setType( DBSqlite );
          setName( dbName );

          // These aren't actually used for Sqlite databases.
          setUser( dbUser );
          setPassword( dbPassword );
          setHost( dbHost );
          setPort( dbPort );

          open();
          
          exit;
        end
      ;


      // If not Sqlite, set up ADO objects.
      //-----------------------------------
      _adoConn := TADOConnection.create( nil );
      _adoCat := TADOXCatalog.create( nil );

      _adoQuery := nil; // This is set below.

      // _adoTable is used only during a quick update, and is created by startQuickUpdate()

      case dbType of
        DBMSAccess:
          begin
            // Make sure that the file exists
            // Try connecting to the database
            _adoConnStr := 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + dbName;

            if( dbAction = DBCreate ) then
              begin
                createStr := _adoConnStr;
                createStr := createStr + ';Jet OLEDB:Engine Type=5;';
                _adoCat.Create1( createStr );
              end
            ;
          end
        ;
        DBMySQL:
          begin
            _adoConnStr := 'Driver={mySQL ODBC 5.1 Driver};server=' + dbHost + ';Port=' + intToStr( dbPort ) + ';Database=' + dbName + ';Uid=' + dbUser + ';Pwd=' + dbPassword + ';';

            // MySql doesn't support database creation.
          end
        ;
        DBDbf:
          begin
            _adoConnStr := Format( 'Provider=Microsoft.JET.OLEDB.4.0;Data Source=%s;Extended Properties=dBase IV;',[directory( dbName )] );

            // DBF doesn't currently support database creation.
          end
        ;
      end;

      _adoConn.ConnectionString := _adoConnStr;
      _adoConnStr := _adoConnStr + ';Persist Security Info=False';
			
      _adoConn.LoginPrompt := False;
      _adoConn.Mode := cmShareDenyNone; // FIX ME: some day, this might be a parameter that can be specified.

      // 0 should make these infinite.
      _adoConn.CommandTimeout := 0;
      _adoConn.ConnectionTimeout := 0;

      try
        _adoConn.Open;

        if( _adoConn.State = [stOpen] ) then
          begin
            _adoQuery := TAdoQuery.Create( nil );
            _adoQuery.Connection := _adoConn;
            _adoQuery.CommandTimeout := 0;

            setIsOpen( true );
            setName( dbName );
            setUser( dbUser );
            setPassword( dbPassword );
            setHost( dbHost );
            setPort( dbPort );

            case dbType of
              DBMSAccess: setType( DBMSAccess );
              DBMySQL: setType( DBMySQL );
              DBDbf: setType( DBDbf );
            end;

          end
        else
          begin
            freeAndNil( _adoConn );
            freeAndNil( _adoCat );
            freeAndNil( _adoQuery );
            setIsOpen( false );
          end
        ;
      except
        freeAndNil( _adoConn );
        freeAndNil( _adoCat );
        freeAndNil( _adoQuery );
        setIsOpen( false );
        _errorOnOpen := true;
      end;
    end
  ;


  /// Sets properties and private members to false or null values.
  procedure TSqlDatabase.initialize();
  	begin
    	setIsOpen( false );
      setType( DBUnspecified );
      setName( '' );
      setUser( '' );
      setPassword( '');
      setHost( '' );

      _adoConn := nil;
      _adoCat := nil;
      _adoQuery := nil;
      _adoTable := nil;
      _adoConnStr := '';
      _sqlite := nil;

      _sqlResult := nil;

      _errorOnOpen := false;
      _autoReopen := true;
      _checkingOpen := false;
      
      _transactionInProgress := false;
    end
  ;

  /// Creates instance of TSQLResult for private member object
	procedure TSqlDatabase.createSqlResult();
  	begin
      _sqlResult := TSqlResult.create( self );
    end
  ;

  /// Frees memory of private member _sqlResult and component members after DB connection is closed
  destructor TSqlDatabase.destroy();
		begin
      if( DBSqlite = dbType ) then
        self.close()
      ;

      if( nil <> _sqlResult ) then
        freeAndNil( _sqlResult )
      ;

      if( nil <> _adoConn ) then
        begin
          while (_adoConn.State = [stConnecting, stExecuting, stFetching] ) do
            //dbcout( 'Not ready to close!', DBSQLCLASSES );
            application.processMessages;
            //sleep( 100 )
          ;

          self.close();
        end
      ;

    	freeAndNil( _adoConn );
      freeAndNil( _adoCat );
      freeAndNil( _adoQuery );
      freeAndNil( _adoTable );
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// TSqlDatabase: Opening and closing
//-----------------------------------------------------------------------------

  {*
    Opens a connection to the database
    @return True if successfull, else false
  }
  function TSqlDatabase.open(): boolean;
  	begin
      // Sqlite...
      //----------
      if( DBSqlite = dbType ) then
        begin
          dbcout2( 'Begin TSqlDatabase.open()...' );
          dbcout2( _sqlite );

          if( SQLITE_OK = sqlite3_open( pchar( name ), @_sqlite ) ) then
            begin
              dbcout2( _sqlite );

              setIsOpen( true );
              result := true;
                          
              dbcout2( 'Sqlite database is open.' );

              // This compresses the database file as queries are performed.
              self.execute( 'PRAGMA auto_vacuum = 1' );
              self.execute( 'VACUUM' );
            end
          else
            begin
              setIsOpen( false );
              _errorOnOpen := true;
              result := false;
            end
          ;

          dbcout2( 'Done TSqlDatabase.open()' );
          exit;
        end
      ;

      // ADO databases...
      //-----------------
			_adoConn.Open();

			if( _adoConn.State = [stOpen] ) then
      	begin
       		setIsOpen( true );
          result := true;
        end
      else
      	begin
        	setIsOpen( false );
          result := false;
        end
      ;

    end
  ;

  
    // This function seems to accomplish nothing.
  ///Processes messages in the Windows message que while the database connection is busy
  procedure TSqlDatabase.waitForExecuteComplete();
    begin
      if( nil <> _adoConn ) then
        begin
          while( _adoConn.State = [stConnecting, stExecuting, stFetching] ) do
            application.processMessages()
          ;
        end
      ;
    end
  ;

  {*
    Closes the database connection; if the connection is busy then messages are
    processed from the Windows message que until the connection is not busy
  }
  procedure TSqlDatabase.close();
  	begin
      // SQLite...
      //----------
      if( DBSqlite = dbType ) then
        begin
          if( isOpen ) then
            begin
              sqlite3_close( _sqlite );
              _sqlite := nil;
            end
          ;

          setIsOpen( false );
          exit;
        end
      ;


      // ADO databases...
      //-----------------
      if( nil <> _adoConn ) then
        begin
          while( _adoConn.State = [stConnecting, stExecuting, stFetching] ) do
            application.processMessages()
          ;
          _adoConn.close();
          end
        ;

      if( nil <> _adoCat ) then
        _adoCat.Disconnect
      ;

      if( nil <> _adoConn ) then
        begin
          while( _adoConn.State <> [stClosed] ) do
            application.processMessages()
          ;
        end
      ;

      setIsOpen( false );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Table, field, and index utilities
//-----------------------------------------------------------------------------

{*
  Documentation about the tables in the database

  @return A list of tables in the database.
  @comment System and Temp tables are not included
}
  function TSqlDatabase.createTableList(): TStringList;
    var
      list: TStringList;
      i, tableCnt: integer;
      tmpTableName: widestring;
      cat: _Catalog;
      row: TSqlRow;
    begin
      // Setup...
      //---------
      list := TStringList.Create();

      // Sqlite...
      //----------
      if( DBSqlite = dbType ) then
        begin
          if( nil = _sqlResult ) then
            createSqlResult()
          ;
          _sqlResult.runQuery( 'SELECT name FROM sqlite_master WHERE type=''table'' ORDER BY name' );

          row := _sqlResult.fetchArrayFirst();
          while( nil <> row ) do
            begin
              list.add( row.field( 'name' ) );
              row := _sqlResult.fetchArrayNext();
            end
          ;
        end
      else
        begin
          // ADO databases...
          //-----------------
          cat := coCatalog.create();
          cat.Set_ActiveConnection( _adoConnStr );

          _adoCat.ConnectTo( cat );

          tableCnt := _adoCat.Tables.Count;

          for i := 0 to tableCnt - 1 do
            begin
              tmpTableName := _adoCat.Tables[i].Name;

              if( ('MSys' <> leftStr( tmpTableName, 4 ) ) and ( '~TMP' <> leftStr( tmpTableName, 4 ) ) ) then
                list.Add( tmpTableName )
              ;
            end
          ;

          _adoCat.Disconnect();
        end
      ;

      result := list;
    end
  ;


  function TSqlDatabase.createTableConstraintList( const table: string ): TStringList;
    var
      list: TStringList;
      tmpStr: string;
      ds: TAdoDataSet;
    begin
      if( DBSqlite = dbType ) then
        raise exception.create( 'Sqlite databases are not yet supported in TSqlDatabase.createTableConstraintList()' )
      ;

      // Useful references for this function:
      // http://www.w3schools.com/ado/met_conn_openschema.asp (BEST RESOURCE FOR INFORMATION)
      // http://www.swissdelphicenter.ch/torry/showcode.php?id=1433 (BEST RESOURCE FOR CODE)
      // http://www.delphigroups.info/2/3/295094.html
      // http://support.microsoft.com/kb/185979
      // http://bytes.com/topic/access/answers/643385-how-get-complete-table-schema-including-constraints-thru-sql-query

      list := TStringList.Create();
      ds := TAdoDataset.Create( nil );
      ds.Connection := self._adoConn;

      if( self.tableExists( table ) ) then
        begin
          // The first two lines here are useful references, but they don't do what this function is intended to do.
          //_adoConn.openSchema( siTables, EmptyParam, EmptyParam, ds ); // works
          //_adoConn.openSchema( siReferentialConstraints, EmptyParam, EmptyParam, ds ); // works
          _adoConn.openSchema( siKeyColumnUsage, EmptyParam, EmptyParam, ds );

          // Column headers for siKeyColumnUsage:
            // CONSTRAINT_CATALOG
            // CONSTRAINT_SCHEMA
            // CONSTRAINT_NAME
            // TABLE_CATALOG
            // TABLE_SCHEMA
            // TABLE_NAME
            // COLUMN_NAME
            // COLUMN_GUID
            // COLUMN_PROPID
            // ORDINAL_POSITION

          tmpStr := fixup( table );
          ds.First();
          
          while( not ds.Eof ) do
            begin
              if( tmpStr = fixup( ds.FieldByName( 'TABLE_NAME' ).AsString ) ) then
                list.Append( ds.FieldByName( 'CONSTRAINT_NAME' ).AsString )
              ;
              (*
              dbcout2( ds.FieldByName( 'CONSTRAINT_CATALOG' ).AsString );
              dbcout2( ds.FieldByName( 'CONSTRAINT_SCHEMA' ).AsString );
              dbcout2( ds.FieldByName( 'CONSTRAINT_NAME' ).AsString );
              dbcout2( ds.FieldByName( 'TABLE_CATALOG' ).AsString );
              dbcout2( ds.FieldByName( 'TABLE_SCHEMA' ).AsString );
              dbcout2( ds.FieldByName( 'TABLE_NAME' ).AsString );
              dbcout2( ds.FieldByName( 'COLUMN_NAME' ).AsString );
              dbcout2( ds.FieldByName( 'COLUMN_GUID' ).AsString );
              dbcout2( ds.FieldByName( 'COLUMN_PROPID' ).AsString );
              dbcout2( ds.FieldByName( 'ORDINAL_POSITION' ).AsString );
              *)
              ds.Next();
            end
          ;
        end
      ;

      ds.Free();
      
      result := list;
    end
  ;


  {*
    Confirms whether a specified field name is within a specified table

    @param field Field name of interest
    @param table Name of table thought to contain the field name
    @return True if the field name is found
  }
  function TSqlDatabase.fieldExists( const field: string; const table: string ): boolean;
    var
      i, j: integer;
      cat: _Catalog;
      tableFound, columnFound: boolean;
      row: TSqlRow;
      str, searchStr: string;
    begin
      // Sqlite...
      //----------
      if( DBSqlite = dbType ) then
        begin
          result := false;

          if( not( tableExists( table ) ) ) then
              raise exception.Create( 'Table "' + table + '" does not exist in TSqlDatabase.fieldExists()' )
          ;

          searchStr := fixup( field );

          if( nil = _sqlResult ) then
            createSqlResult()
          ;
          _sqlResult.runQuery( 'PRAGMA table_info( ' + table + ' )' );

          row := _sqlResult.fetchArrayFirst();
          while( nil <> row ) do
            begin
              str := fixup( string( row.field( 'name' ) ) );
              if( str = searchStr ) then
                begin
                  result := true;
                  break;
                end
              ;
              row := _sqlResult.fetchArrayNext();
            end
          ;
          exit;
        end
      ;

      // ADO databases...
      //-----------------
      tableFound := false;
      columnFound := false;

      cat := coCatalog.create();
      cat.Set_ActiveConnection( _adoConnStr );

      _adoCat.ConnectTo( cat );

      // Find the table...
      for i := 0 to _adoCat.Tables.Count - 1 do
        begin
          if( table = _adoCat.Tables[i].Name ) then
            begin
              tableFound := true;
              break;
            end
          ;
        end
      ;

      // ... then find the column in the table.
      if( tableFound ) then
        begin
          for j := 0 to _adoCat.Tables[i].Columns.Count - 1 do
            begin
              if( field = _adoCat.Tables[i].Columns[j].Name ) then
                begin
                  columnFound := true;
                  break;
                end
              ;
            end
        end
      ;
      _adoCat.Disconnect();

      result := (tableFound and columnFound);
    end
  ;


  {*
    Confirms whether the specified table occurs within the database

    @param table Name of table you are looking for
    @return True if the table name is found
  }
  function TSqlDatabase.tableExists( const table: string ): boolean;
    var
      i: integer;
      cat: _Catalog;
      row: TSqlRow;
    begin
      result := false;

      // Sqlite tables...
      //-----------------
      if( DBSqlite = dbType ) then
        begin
          if( nil = _sqlResult ) then
            createSqlResult()
          ;

          _sqlResult.runQuery( 'SELECT COUNT(*) AS val FROM sqlite_master WHERE name = ''' + table + '''' );
          row := _sqlResult.fetchArrayFirst();
          result := ( 0 <> row.field( 'val' ) );

          exit;
        end
      ;

      // ADO databases...
      //-----------------
      cat := coCatalog.create();
      cat.Set_ActiveConnection( _adoConnStr );

      _adoCat.ConnectTo( cat );

      for i := 0 to _adoCat.Tables.Count - 1 do
        begin
          if( table = _adoCat.Tables[i].Name ) then
            begin
              result := true;
              break;
            end
          ;
        end
      ;
      _adoCat.Disconnect();
    end
  ;

  {*
    Confirms whether the specified table contains one or more records

    @param table Name of table you are investigating
    @return True if the table contains records
  }
	function TSqlDatabase.recordsExist( const table: string ): boolean;
    var
      row: TSqlRow;
    begin
      if( not( tableExists( table ) ) ) then
        begin
          raise exception.Create( 'Table "' + table + '" does not exist in TSqlDatabase.recordsExist()' );
          result := false;
        end
      else
        begin
          if( nil = _sqlResult ) then
            createSqlResult()
          ;

          _sqlResult.runQuery( 'SELECT COUNT(*) AS val FROM ' + table );

          row := _sqlResult.fetchArrayFirst();

          result := ( 0 < row.field( 'val' ) );
        end
      ;
    end
  ;

  {*
    Confirms whether the specified index occurs for the specified table

    @param index Name of index you are looking for
    @param table Name of table
    @return True if the index name is found
  }
  function TSqlDatabase.indexExists( const index: string; const table: string ): boolean;
    var
      i, j: integer;
      cat: _Catalog;
      tableFound, indexFound: boolean;
      row: TSqlRow;
      str, searchStr: string;
    begin
      // Sqlite tables...
      //-----------------
      if( DBSqlite = dbType ) then
        begin
          result := false;
          
          if( nil = _sqlResult ) then
            createSqlResult()
          ;
          searchStr := fixup( index );

          _sqlResult.runQuery( 'PRAGMA index_list( ' + table + ')' );
          row := _sqlResult.fetchArrayFirst();
          while( nil <> row ) do
            begin
              str := fixup( string( row.field( 'name' ) ) );

              if( searchStr = str ) then
                begin
                  result := true;
                  break;
                end
              ;

              row := _sqlResult.fetchArrayNext();
            end
          ;

          exit;
        end
      ;


      // ADO databases...
      //-----------------
      tableFound := false;
      indexFound := false;

      cat := coCatalog.create();
      cat.Set_ActiveConnection( _adoConnStr );

      _adoCat.ConnectTo( cat );

      // Find the table...
      for i := 0 to _adoCat.Tables.Count - 1 do
        begin
          if( table = _adoCat.Tables[i].Name ) then
            begin
              tableFound := true;
              break;
            end
          ;
        end
      ;

      // ... then find the index on the table.
      if( tableFound ) then
        begin
          for j := 0 to _adoCat.Tables[i].Indexes.Count - 1 do
            begin
              if( index = _adoCat.Tables[i].Indexes[j].Name ) then
                begin
                  indexFound := true;
                  break;
                end
              ;
            end
        end
      ;
      _adoCat.Disconnect();

      result := ( tableFound and indexFound );
    end
  ;

  {*
    Confirms whether the specified field name occurs for the specified table

    @param fieldName Name of field you are looking for
    @param tableName Name of table
    @return True if the field name is located
  }
  function TSqlDatabase.getDatabaseBoolean( const fieldName: string; const tableName: string ): boolean;
  	var
      row: TSqlRow;
  	begin
      if( nil = _sqlResult ) then
        createSqlResult()
      ;

      _sqlResult.runQuery( 'SELECT ' + fieldName + ' FROM ' + tableName );

      //The first row contains the field name, only one field is in query - field(0)
      row := _sqlResult.fetchArrayFirst();
      if( true = row.field(0) ) then
      	result := true
      else
      	result := false
      ;
    end
  ;

  {*
    Returns the number of records in the specified table

    @param tableName Name of table
    @return record count
  }
  function TSqlDatabase.getDatabaseCount( const tableName: string ): integer;
  	var
      row: TSqlRow;
  	begin
      if( nil = _sqlResult ) then
        createSqlResult()
      ;

      _sqlResult.runQuery( 'SELECT COUNT(*) AS val FROM ' + tableName );

      row := _sqlResult.fetchArrayFirst();

      result := row.field('val');
    end
  ;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// TSqlDatabase: Compacting
//-----------------------------------------------------------------------------


  {*
    Compacts an Access or Sqlite database, a MySQL database type is ignored
    @param reOpen Indicate whether you want the database reopened after compacting
    @return True if compact succeeds (Access) or if the database is MySQL (no action performed)
  }
  function TSqlDatabase.compact( reOpen: boolean = false ): boolean;
    var
      JE: TJetEngine; //Jet Engine
      sdbTemp: WideString; //TEMP database
      sdbTempConn: WideString; //Connection string
      val: boolean;
    const
      SProvider = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=';
    begin
      case dbType of
        DBDbf: result := true;
        DBMySQL: result := true;
        DBSqlite: result := self.execute( 'VACUUM' );
        DBMSAccess:
          begin
            val := false;

            if( fileIsReadOnly( name ) ) then // The file is read-only.  Give up now.
              begin
                result := false;
                dbcout( 'Database ' + name + ' is read-only, and cannot be compacted.', true );
                if( reopen and not( isOpen ) ) then open();
                exit;
              end
            ;

            if( isOpen ) then close();

            sdbTemp := ExtractFileDir( name ) + 'TEMP' + ExtractFileName( name );
            sdbTempConn := SProvider + sdbtemp;

            if FileExists( sdbTemp ) then DeleteFile( sdbTemp );

            JE:= TJetEngine.Create( Application );

            try
              try
                JE.CompactDatabase( SProvider + name, sdbTempConn );
                DeleteFile( name );
                RenameFile( sdbTemp, name );
                val := true;
              except
                on E:Exception do
                  begin
                    val := false;
                  end
                ;
              end;
            finally
              JE.FreeOnRelease;
              result := val;
              if( reOpen ) then open();
            end;
          end
        ;
        else // Default case
          begin
            raise exception.create( 'Unsupported database type in TSqlDatabase.compact()' );
            result := false;
          end
        ;
      end;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Basic queries
//-----------------------------------------------------------------------------

  {*
    Executes a query through the ADO Query component
    @param query SQL statement
    @return Returns true if the query executes, else false
    @throws If an exception is thrown the error message is reported
  }
  function TSqlDatabase.execute( query: string ): boolean;
    var
      err: pchar;
  	begin
      if( not self.isOpen and self.autoReopen ) then
        self.open()
      ;

      // For Sqlite...
      //--------------
      if( DBSqlite = dbType ) then
        begin
          if( SQLITE_OK = sqlite3_exec( _sqlite, pchar( query ), nil, nil, @err ) ) then
            result := true
          else
            begin
              dbcout( endl + endl + 'BAD QUERY (' + err + '):' + endl + query, true );
              _lastError := err;
              result := false;
            end
          ;
          exit;
        end
      ;

      // For ADO databases...
      //---------------------
      _adoQuery.SQL.clear();
      _adoQuery.SQL.add( query );

			try
        _adoQuery.ExecSQL();
        result := true;
			except
				on e: Exception do
					begin
						dbcout( endl + endl + 'BAD QUERY (' + e.Message + '):' + endl + query, true );
            _lastError := e.Message;
						result := false;
					end
				;
			end;

    end
  ;

  {*
    Information regarding the last insert SQL operation
    @return autoincremented primary key value of the last inserted record
  }
	function TSqlDatabase.lastInsertID(): integer;
    var
      row: TSqlRow;
      q: string;
  	begin
      if( nil = _sqlResult ) then
        createSqlResult()
      ;

      case dbType of
        DBMSAccess: q := 'SELECT @@IDENTITY';
        DBMySQL: q := 'SELECT LAST_INSERT_ID()';
        DBSqlite: q := 'SELECT last_insert_rowid()';
        else raise exception.Create( 'Unsupported database type in TSqlDatabase.lastInsertID()' );
      end;

      _sqlResult.runQuery( q );
      row := _sqlResult.fetchArrayFirst();
      result := integer( row.field( 0 ) );
    end
  ;

  {*
    Returns the record count of the executed query
    @param query SQL statement
    @return record count
  }
  function TSqlDatabase.count( query: string ): integer;
    var
      // Sqlite-specific variables
      rc: integer;
      err: integer;
      stmtPtr: pointer;
      tailPtr: pointer;
    begin
      if( not isOpen and autoReopen ) then
        open()
      ;

      // Sqlite...
      //----------
      if( DBSqlite = dbType ) then
        begin
          query := trim( query );

          err := sqlite3_prepare_v2( _sqlite, pchar( query ), length( query ), @stmtPtr, @tailPtr );

          if( SQLITE_OK = err ) then
            begin
              rc := 0;
              while( SQLITE_ROW = sqlite3_step( stmtPtr ) ) do
                inc( rc )
              ;
              sqlite3_finalize( stmtPtr );

              result := rc;
            end
          else
            result := 0
          ;
          exit;
        end

      // ADO databases...
      //-----------------
      else
        begin
          _adoQuery.SQL.clear();
          _adoQuery.SQL.add( query );
          _adoQuery.open();

          result := _adoQuery.RecordCount;
        end
      ;
    end
  ;


  {*
    Provides access to sqlQuote module function
    @param val Text containing quotes requiring escape characters
    @return Value formatted with escape characters
  }
  function TSqlDatabase.sqlQuote( const val: string ): string;
    begin
      result := SqlClasses.sqlQuote( val, _type );
    end
  ;


  {*
    Encodes boolean values for insertion into the database.
    @param val Boolean value
    @return Formatted value (e.g., "true" or "false", or "1" or "0", depending on the database type)
  }
  function TSqlDatabase.sqlBool( const val: boolean ): string;
    begin
      result := SqlClasses.sqlBool( val, _type );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: quick updates, inserts, and deletions
//-----------------------------------------------------------------------------
  {*
    ADO table preparation for executing a quick update query.

    @param tableName Targeted table
    @param indexName Name of index that will be searched to perform update
    @throws If the specified index does not exist then a missing index output
    message is created and the update will not be performed.
  }
  procedure TSqlDatabase.startQuickUpdate( tableName, indexName: string );
    begin
      if( _quickUpdate or _quickInsert ) then
        raise exception.Create( 'Cannot start quick update/insert: quick update/insert already in progress' )
      ;

      if( not( tableExists( tableName ) ) ) then
        raise exception.create( 'Table "' + tableName + '" does not exist in TSqlDatabase.startQuickUpdate()' )
      else
        _quickTableName := tableName
      ;

      _quickUpdate := true;
      _quickUpdateIndex := -1;

      case dbType of
        DBMSAccess:
          begin
            if( nil <> _adoTable ) then
              raise exception.Create( 'Cannot start quick update/insert: quick update/insert already in progress' )
            else
              begin
                try
                  _adoTable := TADOTable.Create( nil );

                  _adoTable.Connection := _adoConn;
                  _adoTable.Cursorlocation := clUseServer;
                  _adoTable.TableName := tableName;
                  _adoTable.TableDirect := True;
                  _adoTable.Indexname := indexName;
                  _adoTable.LockType := ltOptimistic;
                  _adoTable.Open();
                except
                  dbcout( 'TSqlDatabase.startQuickUpdate: missing index "' + indexName + '" on table "' + tableName + '"', true );
                  freeAndNil( _adoTable );
                  _quickUpdate := false;
                  _quickTableName := '';
                end;
              end
            ;
          end
        ;
        DBMySQL:
          begin
            // FIX ME: does MySql have any mechanism for speeding up inserts and updates?
          end
        ;
        DBDbf:
          begin
            // FIX ME: Not sure what to do here.
          end
        ;
        DBSqlite:
          begin
            // This approach is based on http://www.sqlite.org/faq.html#q19,
            // which indicates that transactions are the way to go to speed up inserts in Sqlite.
            startTransaction();
          end
        ;
      end;
    end
  ;


  {*
    Update to a single record field value is performed by seeking the specified index.

    @param indexValue Index value of key being sought
    @param fieldName Name of field to be updated
    @param newValue Updated value
    @comment More warnings may be needed here if startQuickUpdate had failed.
  }
  procedure TSqlDatabase.quickUpdate( indexValue: variant; fieldName: string; newValue: variant );
    var
      q: string;
      qq: string;
    begin
      if( not( _quickUpdate ) ) then
        raise exception.Create( 'No quick updated in progress in TSqlDatabase.quickUpdate() 1' )
      ;

      case dbType of
        DBMSAccess:
          begin
            _adoTable.Seek( indexValue );
            _adoTable.Edit();
            _adoTable.FieldByName( fieldName ).Value := newValue;
            _adoTable.Post();
          end
        ;
        DBMySql:
          begin
            raise exception.create( 'Unsupported database type in TSqlDatabase.quickUpdate()' )
          end
        ;
        DBDbf:
          begin
            raise exception.create( 'Unsupported database type in TSqlDatabase.quickUpdate()' )
          end
        ;
        DBSqlite:
          begin
            // Sqlite databases will work as long as the index field is an integer.
            if( not( varIsOrdinal( indexValue ) ) ) then
              raise exception.create( 'Unsupported index data type in TSqlDatabase.quickUpdate()' )
            else
              _quickUpdateIndex := integer( indexValue )
            ;

            if( varIsNumeric( newValue ) ) then
              qq := string( newValue )
            else if( varIsStr( newValue ) ) then
              qq := sqlQuote( string( newValue ) )
            else
              raise exception.create( 'Unsupported variant type in TSqlDatabase.quickUpdate()' )
            ;
            q := 'UPDATE `' + _quickTableName + '` SET `' + fieldName + '` = ' + qq + ' WHERE rowid = ' + intToStr( _quickUpdateIndex );
            self.execute( q );
          end
        ;
      end;
    end
  ;


  {*
    An update of many records field value is performed by replacement.

    @param fieldName Name of field to receive update
    @param newValue Updated value
    @comment More warnings may be needed here if startQuickUpdate had failed.
  }
  procedure TSqlDatabase.quickUpdate( fieldName: string; newValue: variant );
    var
      q: string;
      qq: string;
    begin
      if( not( _quickUpdate ) ) then
        raise exception.Create( 'No quick updated in progress in TSqlDatabase.quickUpdate() 2' )
      ;

      case dbType of
        DBMSAccess:
          begin
            _adoTable.Edit();
            _adoTable.FieldByName( fieldName ).Value := newValue;
            _adoTable.Post();
          end
        ;
        DBMySql:
          begin
            raise exception.create( 'Unsupported database type in TSqlDatabase.quickUpdate()' )
          end
        ;
        DBDbf:
          begin
            raise exception.create( 'Unsupported database type in TSqlDatabase.quickUpdate()' )
          end
        ;
        DBSqlite:
          begin
            if( varIsNumeric( newValue ) ) then
              qq := string( newValue )
            else if( varIsStr( newValue ) ) then
              qq := sqlQuote( string( newValue ) )
            else
              raise exception.create( 'Unsupported variant type in TSqlDatabase.quickUpdate()' )
            ;

            // _quickUpdateIndex was set when the other quickUpdate() was called.
            q := 'UPDATE `' + _quickTableName + '` SET `' + fieldName + '` = ' + qq + ' WHERE rowid = ' + intToStr( _quickUpdateIndex );
            self.execute( q );
          end
        ;
      end;
    end
  ;


  /// Frees the ADO table component
  procedure TSqlDatabase.endQuickUpdate();
    begin
      endQuickInsert();
    end
  ;


  {*
    ADO table preparation for inserting a record to the specified table

    @param tableName Name of table to insert record
    @comment Confirm that MySQL will support quick updates and inserts
  }
  procedure TSqlDatabase.startQuickInsert( tableName: string );
    begin
      if( _quickInsert or _quickUpdate ) then
        raise exception.Create( 'Cannot start quick update/insert: quick update/insert already in progress' )
      ;

      if( not( tableExists( tableName ) ) ) then
        raise exception.create( 'Table "' + tableName + '" does not exist in TSqlDatabase.startQuickInsert()' )
      else
        _quickTableName := tableName
      ;

      _quickInsert := true;

      case dbType of
        DBMSAccess:
          begin
            if( nil <> _adoTable ) then
              raise exception.Create( 'Cannot start quick update/insert: quick update/insert already in progress' )
            else
              begin
                try
                  _adoTable := TADOTable.Create( nil );

                  _adoTable.Connection := _adoConn;
                  _adoTable.Cursorlocation := clUseServer;
                  _adoTable.TableName := tableName;
                  _adoTable.TableDirect := True;
                  //_adoTable.Indexname := indexName;
                  _adoTable.LockType := ltOptimistic;

                  _adoTable.Open();
                except
                  freeAndNil( _adoTable );
                  _quickInsert := false;
                  _quickTableName := '';
                end;
              end
            ;
          end
        ;
        DBMySQL:
          begin
            // FIX ME: does MySql have any mechanism for speeding up inserts and updates?
          end
        ;
        DBDbf:
          begin
            // FIX ME: does MySql have any mechanism for speeding up inserts and updates?
          end
        ;
        DBSqlite:
          begin
            // This approach is based on http://www.sqlite.org/faq.html#q19,
            // which indicates that transactions are the way to go to speed up inserts in Sqlite.
            startTransaction();
          end
        ;
      end;
    end
  ;

  {*
    Inserts a single record, but the function itself can be used to do a batch of updates

    @param dict Structure holding the values for the record fields
    @param keyField Use to indicate whether or not to return the key value for the new record.
    @return Returns the value of the key for the new record, if there is one
    @comment filling the dict does not occur through a class method
    @comment Confirm that MySQL will support quick updates and inserts
  }
  function TSqlDatabase.quickInsert( dict: TQStringVariantMap; keyField: string = '' ): integer;
    var
      i: integer;
      q: string;
    begin
      result := -1;
      
      if( not( _quickInsert ) ) then
        raise exception.Create( 'No quick insert in progress in TSqlDatabase.quickInsert()' )
      ;

      if( strIsEmpty( _quickTableName ) ) then
        raise exception.create( 'Table name is not specified in TSqlDatabase.quickInsert()' )
      ;

      case dbType of
        DBMSAccess:
          begin
            try
              _adoTable.Insert();
              for i := 0 to dict.Count -1 do
                _adoTable.FieldByName( dict.keyAtIndex(i) ).Value := dict.itemAtIndex(i);
              ;

              _adoTable.Post();

              if( '' <> keyField ) then
                result := _adoTable.fieldByName(keyField).AsInteger
              else
                result := -1
              ;
            except on e: exception do
              begin
                dbcout( 'EXCEPTION: ' + e.message, true );
                dict.debug();
                raise; // Re-raise the exception
              end;
            end;
          end
        ;
        DBMySQL:
          begin
            // FIX ME: does MySql support any way to speed up inserts and updates?
            q := writeQuery( _quickTableName, QInsert, dict );
            self.execute( q );
            result := lastInsertID();
          end
        ;
        DBDbf:
          begin
            // FIX ME: Not sure what to do here.
            raise exception.Create( 'DBF files not yet fully supported' );
          end
        ;
        DBSqlite:
          begin
            q := writeQuery( _quickTableName, QInsert, dict );
            self.execute( q );
            result := integer( sqlite3_last_insert_rowid( _sqlite ) ); 
          end
        ;
      end;
    end
  ;


 {*
    Frees ADO table after quick insert
    @comment Confirm that MySQL will support quick updates and inserts
  }
  procedure TSqlDatabase.endQuickInsert();
    begin
      case dbType of
        DBMSAccess:
          begin
            if( nil <> _adoTable ) then
              begin
                _adoTable.Close();
                freeAndNil( _adoTable );
              end
            ;
          end
        ;
        DBDbf:
          begin
            // FIX ME: does MySql support quick inserts and updates?
          end
        ;
        DBMySql:
          begin
            // FIX ME: does MySql support quick inserts and updates?
          end
        ;
        DBSqlite:
          begin
            // This approach is based on http://www.sqlite.org/faq.html#q19,
            // which indicates that transactions are the way to go to speed up inserts in Sqlite.
            commitTransaction();
          end
        ;
      end;

      _quickTableName := '';
      _quickInsert := false;
      _quickUpdate := false;
      _quickUpdateIndex := -1;
    end
  ;

  {*
    Deletes a single record by seeking the records index value
    @param fieldName Unused argument
    @param indexValue of record to delete
    @comment More warnings may be needed here if startQuickUpdate had failed.
  }
  procedure TSqlDatabase.quickDelete( fieldName: string; indexValue: variant );
    begin
      if( not( _quickUpdate ) ) then
        begin
          // FIX ME: more warnings??
          exit;
        end
      ;

      _adoTable.Seek( indexValue );
      _adoTable.Delete();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Blobs
//-----------------------------------------------------------------------------

  {*
    Saves the specified file to the specified blob field in an Access database
    @param fileName Full file Name of file to be saved to database
    @param tableName Destination table
    @param fieldName Blob field of table
    @comment As currently implementd this always occurs to the first record of the table
    @throws Raises an exception if the database type is not Access
  }
  procedure TSqlDatabase.saveFileInBlob( fileName, tableName, fieldName: string; row: integer = 1 );
    var
      Stream1: TStream;
    begin
      if( DBMySQL <> dbType ) then
        begin
          Stream1 := TFileStream.Create( fileName, fmOpenRead );
          writeBlobFromStream( stream1, tableName, fieldName, row );

          Stream1.Free();
        end
      else
        raise exception.Create( 'TSqlDatabase.saveFileInBlob not testing in MySql' )
      ;
    end
  ;

  {*
    Helper function for saveFileInBlob
    @param srcStream Instance of TStream (provided by saveFileInBlob)
    @param tableName Destination table
    @param fieldName Blob field of table
    @throws Raises an exception if the database type is not Access
  }
  procedure TSqlDatabase.writeBlobFromStream( srcStream: TStream; tableName, fieldName: string; row: integer = 1 );
  	var
      // For Sqlite
      blobHandle: pointer;
      dat: pbyte;
      size: integer;
      err: integer;
      q: string;

      // For ADO databases
    	destStream: TStream;
      table: TAdoTable;
  	begin
      case dbType of
        DBSqlite:
          begin
            // Copy data from the stream into a buffer that will work with C DLLs
            //-------------------------------------------------------------------
            size := srcStream.Size;
            getMem( dat, size );
            srcStream.Position := 0;
            srcStream.ReadBuffer( dat^, size ); // Read FROM stream INTO buffer

            // Resize the BLOB field in the database
            //--------------------------------------
            q := 'UPDATE ' + tableName + ' SET ' + fieldname + ' = zeroblob( ' + intToStr( size ) + ' ) WHERE rowid = ' + intToStr( row );
            self.execute( q );

            // Get a handle for the BLOB field, and use it.
            //---------------------------------------------
            blobHandle := dsqlite3_blob_open( _sqlite, pchar( 'main' ), pchar( tableName ), pchar( fieldName ), row, DSQLITE_READ_WRITE );
            if( nil <> blobHandle ) then
              begin
                err := sqlite3_blob_write( blobHandle, dat, size, 0 );
                if( SQLITE_OK <> err ) then
                  raise exception.Create( 'TSqlDatabasewriteBlobFromStream() failed: code' + intToStr( err ) )
                ;
                freeMem( dat );
              end
            else
              raise exception.Create( 'No BLOB handle in TSqlDatabasewriteBlobFromStream()' )
            ;
          end
        ;
        DBMSAccess:
          begin
            table := TADOTable.Create( nil );
            table.Connection := _adoConn;
            table.TableName := tableName;
            table.Open();

            //try
              table.Edit();
              table[FieldName] := null;
              destStream := table.CreateBlobStream( table.FieldByName(FieldName), bmReadWrite );
              destStream.CopyFrom( srcStream, 0 );
            //finally
              destStream.Free();
            //end;

            table.Post();
            table.Close();
            table.Free();
          end
        ;
        else
          raise exception.Create( 'TSqlDatabase.writeBlobFromStream not tested in MySql or DBF' )
        ;
      end;
    end
  ;

  {*
    Creates a file from the specified (blob) field in an Access database
    @param srcStream Instance of TStream (provided by saveFileInBlob)
    @param fileName Full file name of the file to be created
    @param tableName Table holding the blob field
    @param fieldName Blob field of table
    @return True if operations succeed, else false
  }
  function TSqlDatabase.getFileFromBlob( fileName, tableName, fieldName: string; row: integer = 1 ): boolean;
  	var
      fileStream, dbStream: TStream;
  	begin
      dbStream := nil;
      fileStream := nil;
      
      try
        try
          dbStream := self.createStreamFromBlob( tableName, fieldName, row );
          if( nil <> dbStream ) then
            begin
              fileStream := TFileStream.Create( fileName, fmCreate );
              fileStream.CopyFrom( dbStream, 0 );
              result := true;
            end
          else
            result := false;
          ;
        except
          result := false;
        end;
      finally
        freeAndNil( dbStream );
        freeAndNil( fileStream );
      end;
    end
  ;

  {*
    Loads the specified Access (blob) field into memory

    @param tableName table to acquire the blob contents
    @param fieldName field containing blob
    @return Returns the blob field contents in memory
    @throws Raises an exception if the database type is not Access
    @comment As currently implemented this always occurs to the first record of the table
  }
  function TSqlDatabase.createStreamFromBlob( tableName, fieldName: string; row: integer = 1 ): TMemoryStream;
  	var
    	srcStream: TStream;
      destStream: TMemoryStream;
      table: TAdoTable;

      // For Sqlite databases
      blobHandle: pointer;
      size: integer;
      dat: pbyte;
      //dat1: pbyte;
      //b: byte;
      //i: integer;
  	begin
      case dbType of
        DBSqlite:
          begin
            blobHandle := dsqlite3_blob_open( _sqlite, pchar( 'main' ), pchar( tableName ), pchar( fieldName ), row, DSQLITE_READ_ONLY );
            if( nil <> blobHandle ) then
              begin
                // Fill a buffer with data from the database
                //------------------------------------------
                size := sqlite3_blob_bytes( blobHandle );
                getMem( dat, size );
                if( SQLITE_OK = sqlite3_blob_read( blobHandle, dat, size, 0 ) ) then
                  begin
                    (*
                    // Debugging....
                    //--------------
                    // b is a byte.
                    // Pointer arithmetic is used to show the contents of the buffer.
                    dbcout2( 'Writing b''s...' );
                    dat1 := dat;
                    for i := 0 to size - 1 do
                      begin
                        b := dat1^;
                        dbcout2( b );
                        inc( dat1 );
                      end
                    ;
                    dbcout2( 'Done.' );
                    *)
                    
                    // Copy the buffer to a memory stream for use elsewhere.
                    //------------------------------------------------------
                    destStream := TMemoryStream.Create();
                    destStream.WriteBuffer( dat^, size );  // Write INTO stream FROM buffer
                    freeMem( dat );
                    destStream.Position := 0;

                    result := destStream;
                  end
                else
                  result := nil
                ;

                sqlite3_blob_close( blobHandle );
              end
            else
              result := nil
            ;
          end
        ;
        DBMSAccess:
          begin
            table := TADOTable.Create( nil );
            table.Connection := _adoConn;
            table.TableName := tableName;
            table.Open();

            srcStream := table.CreateBlobStream( table.FieldByName(FieldName), bmRead );
            destStream := TMemoryStream.Create();
            destStream.CopyFrom( srcStream, 0 );

            result := destStream;

            srcStream.Free();

            table.Close();
            table.Free();
          end
        ;
        else
          raise exception.Create( 'TSqlDatabase.getFileFromBlob not testing in MySql or DBF' )
        ;
      end;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Transactions
//-----------------------------------------------------------------------------
  function TSqlDatabase.startTransaction(): boolean;
    begin
      if( _transactionInProgress ) then
        raise exception.Create( 'SQLDatabase transaction is already in progress.  Another transaction cannot be initiated at this time.' )
      ;

      case dbType of
        DBSqlite:
          begin
            result := self.execute( 'BEGIN TRANSACTION RESTOREPOINT' );
            if( result ) then
              _transactionInProgress := true
            ;
          end
        ;
        DBMSAccess:
          begin
            _adoConn.BeginTrans;
            _transactionInProgress := true;
            result := true;
          end
        ;
        DBMySql:
          begin
            result := self.execute( 'START TRANSACTION' );
            if( result ) then
              _transactionInProgress := true
            ;
          end
        else
          begin
            raise exception.create( 'Other database types are not supported in TSqlDatabase.startTransaction()' );
            result := false;
          end
        ;
      end;
    end
  ;


  function TSqlDatabase.commitTransaction(): boolean;
    begin
      if( not( _transactionInProgress ) ) then
        raise exception.Create( 'There is no SQLDatabase transaction in progress.' )
      ;

      case dbType of
        DBSqlite:
          begin
            result := self.execute( 'COMMIT TRANSACTION RESTOREPOINT' );
            if( result ) then
              _transactionInProgress := false
            ;
          end
        ;
        DBMSAccess:
          begin
            _adoConn.CommitTrans;
            _transactionInProgress := false;
            result := true;
          end
        ;
        DBMySql:
          begin
            result := self.execute( 'COMMIT' );
            if( result ) then
              _transactionInProgress := false
            ;
          end
        else
          begin
            raise exception.create( 'Other database types are not supported in TSqlDatabase.startTransaction()' );
            result := false;
          end
        ;
      end;
    end
  ;


  function TSqlDatabase.rollbackTransaction(): boolean;
    begin
      if( not( _transactionInProgress ) ) then
        raise exception.Create( 'There is no SQLDatabase transaction in progress.' )
      ;

      case dbType of
        DBSqlite:
          begin
            result := self.execute( 'ROLLBACK TRANSACTION RESTOREPOINT' );
            if( result ) then
              _transactionInProgress := false
            ;
          end
        ;
        DBMSAccess:
          begin
            _adoConn.RollbackTrans;
            _transactionInProgress := false;
            result := true;
          end
        ;
        DBMySql:
          begin
            result := self.execute( 'ROLLBACK' );
            if( result ) then
              _transactionInProgress := false
            ;
          end
        else
          begin
            raise exception.create( 'Other database types are not supported in TSqlDatabase.startTransaction()' );
            result := false;
          end
        ;
      end;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlDatabase: Properties
//-----------------------------------------------------------------------------
  {*
    For Property: Sets the database type
    @param val Setter
  }
  procedure TSqlDatabase.setType( val: TSqlDBType ); begin _type := val; end;
  {*
    For Property: Sets the full file path to the database
    @param val Setter
  }
  procedure TSqlDatabase.setName( val: string ); begin _name := val; end;
  {*
    For Property: Sets the database user name
    @param val Setter
  }
  procedure TSqlDatabase.setUser( val: string ); begin _user := val; end;
  {*
    For Property: Sets the database password
    @param val Setter
  }
  procedure TSqlDatabase.setPassword( val: string ); begin _password := val; end;
  {*
    For Property: Sets the database server name
    @param val Setter
  }
  procedure TSqlDatabase.setHost( val: string ); begin _host := val; end;
  {*
    For Property: Sets a flag indicating the database connection state
    @param val Setter
  }
  procedure TSqlDatabase.setIsOpen( val: boolean ); begin _isOpen := val; end;
  {*
    For Property: Sets the server connection port
    @param val Setter
  }
  procedure TSqlDatabase.setPort( val: integer ); begin _port := val; end;

  {*
    For Property: Returns the database type
    @return value of _type Internal member
  }
  function TSqlDatabase.getType(): TSqlDBType; begin Result := _type; end;
  {*
    For Property: Returns the database name and path
    @return value of _name Internal member
  }
  function TSqlDatabase.getName(): string; begin Result := _name; end;
  {*
    For Property: Returns the database database user name
    @return value of _user Internal member
  }
  function TSqlDatabase.getUser(): string; begin Result := _user; end;
  {*
    For Property: Returns the database database password
    @return value of _password Internal member
  }
  function TSqlDatabase.getPassword(): string; begin Result := _password; end;
  {*
    For Property: Returns the database server host name
    @return value of _host Internal member
  }
  function TSqlDatabase.getHost(): string; begin Result := _host; end;
  {*
    For Property: Returns whether a connection is open
    @return value of _isOpen Internal member
  }
  function TSqlDatabase.getIsOpen(): boolean;
    begin
      // Access and MySQL use ADO.
      // Sqlite does not.

      case dbType of
        DBSqlite: result := _isOpen;
        DBMSAccess: result := ( _isOpen and ( stOpen in self._adoConn.State ) );
        DBDbf: result := ( _isOpen and ( stOpen in self._adoConn.State ) );
        DBMySql: result := ( _isOpen and ( stOpen in self._adoConn.State ) );
        else
          begin
            raise exception.create( 'Unrecognized database type in TSqlDatabase.getIsOpen()' );
            result := false;
          end
        ;
      end;

      (*
      // AR: This is a first attempt to capture the following exception that occurs when using mySQL databases:
      //
      // Project LivestockCMSurvey.exe raised exception class EOleException with message '[MySQL][ODBC 5.1 Driver][mysqld-5.1.55-log]MySQL server has gone away'. Process stopped. Use Step or Run to continue.
      //
      // Unfortunately, it was an unsuccessful first attempt...

      if( (not _checkingOpen ) and result and ( DBMySql = self.dbType ) ) then
        begin
          try
            _checkingOpen := true;

            try
              _adoQuery.SQL.clear();
              _adoQuery.SQL.add( 'SELECT NOW()' );
              _adoQuery.ExecSQL();
            except
              on e: exception do
                begin
                  dbmsg( 'Exception caught here' );
                  result := false;
                end
              ;
            end;
          finally
            _checkingOpen := false;
          end;
        end
      ;
    *)
    end
  ;


  {*
    For Property: Returns the port number to connect to
    @return value of _isPort Internal member
  }
  function TSqlDatabase.getPort(): integer; begin Result := _port; end;

//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// TSqlRow
//-----------------------------------------------------------------------------

  {*
    Creates a list for holding field names of the row
    @param fm List of field names
  }
  constructor TSqlRow.create( fm: TCStringList );
    begin
      _fm := fm;
      _count := 0;
      _va := nil;
    end
  ;

  {*
    Adds a data element
    @param v Value to be added
  }
  procedure TSqlRow.append( v: variant );
    begin
      inc( _count );
      setLength( _va, _count );
      _va[_count-1] := v;
    end
  ;

  {*
    Validates a field name
    @param fieldName in question
    @return True if name is valid
  }
  function TSqlRow.fieldExists( fieldName: string ): boolean;
    begin
      result := ( -1 <> _fm.indexOf( fieldName ) );
    end
  ;

  {*
    Returns the value of the field at the specified index
    @param fieldIndex field index in row
    @return Value of field
    @throws An exception is raised if the specified field index is not valid.
  }
  function TSqlRow.field( fieldIndex: integer ): variant;
    begin
      if( ( _count > fieldIndex )  ) then
        result := _va[fieldIndex]
      else
        begin
          raise exception.Create( 'Field "' + intToStr( fieldIndex ) + '" is not in in TSqlRow' );
          result := null;
        end
      ;
    end
  ;

  {*
    Returns the value for the specified field name in the row
    @param fieldName Name of field in row
    @return Value of field
    @throws An exception is raised if the specified field name is not valid.
  }
  function TSqlRow.field( fieldName: string ): variant;
    var
      i: integer;
    begin
      try
        i := _fm.indexOf( fieldName );

        if( -1 <> i ) then
          result := _va[i]
        else
          begin
            raise exception.Create( 'Field "' + fieldName + '" is not in in TSqlRow' );
            result := null;
          end
        ;
      except
        raise exception.Create( 'Field is missing: ' + fieldName );
        result := null;
      end;
    end
  ;

  /// Outputs a string of row values, empty elements are indicated as 'NULL'
  procedure TSqlRow.debug();
    var
      str: string;
      i: integer;
    begin
      str := '';

      for i := low( _va ) to high( _va ) do
        begin
          if( _va[i] = NULL ) then
            str := str + 'NULL, '
          else
            str := str + string( _va[i] ) + ', '
          ;
        end
      ;

      str := leftStr( str, length( str ) - 2 );
      dbcout( str, true );
    end
  ;
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// TRowList
//-----------------------------------------------------------------------------

  {*
    Adds a row to the list (record set)

    @param dm A row of data
    @return The row number of the items position in the list
  }
  function TRowList.append( dm: TSqlRow ): integer;
    begin
      result := inherited Add( dm );
    end
  ;


  {*
    Sets the specified row as the current row

    @param index requested positon in the list
  }
  procedure TRowList.setObject( index: integer; item: TSqlRow );
    begin
      inherited SetItem( index, item );
    end
  ;

  {*
    Returns the data row at the specified index in the record set

    @param index requested positon in the list
    @return A row of data, see class
  }
  function TRowList.getObject( index: integer ): TSqlRow;
    begin
      result := inherited GetItem( index ) as TSqlRow;
    end
  ;

  {*
    Adds a data row to the record set at a  specific index

    @param index requested positon in the list
    @param dm A row of data, see class
  }
  procedure TRowList.insert(index: integer; dm: TSqlRow);
    begin
      inherited Insert(index, dm);
    end
  ;

  {*
    Returns the first row of data in the recordset

    @return A row of data, see class
  }
  function TRowList.first() : TSqlRow;
    begin
      _currentIndex := 0;
      if( 0 = self.Count ) then
        result := nil
      else
        result := getObject( _currentIndex )
      ;
    end
  ;

  {*
    Returns the last row of data in the recordset
    @return A row of data, see class
  }
  function TRowList.last() : TSqlRow;
    begin
      if( 0 = self.Count ) then
        result := nil
      else
        begin
          _currentIndex := self.Count - 1;
          result := getObject( _currentIndex );
        end
      ;
    end
  ;

  {*
    Returns the next row of data in the recordset
    @return A row of data, see class
  }
  function TRowList.next() : TSqlRow;
    begin
      _currentIndex := _currentIndex + 1;
      if( _currentIndex > (self.Count - 1) ) then
        result := nil
      else
        result := getObject( _currentIndex )
      ;
    end
  ;

  {*
    Returns the current row of data in the recordset
    @return A row of data, see class
  }
  function TRowList.current() : TSqlRow;
    begin
      if( _currentIndex > (self.Count - 1) ) then
        result := nil
      else
        result := getObject( _currentIndex )
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlResult: Construction/initialization/destruction
//-----------------------------------------------------------------------------


  {*
    Initializes the object, sets a connection, and initiates a query
    @param query SQL statement to be implemented
    @param dbConn Object implementing connection to database, see class
  }
  constructor TSqlResult.create( query: string; dbConn: TSqlDatabase );
    begin
      initialize();
      _conn := dbConn;
      if( length( query ) > 0 ) then
        doQuery( query, dbConn )
      ;
    end
  ;


  {*
    Initializes the object, sets a connection, and initiates a query
    @param dbConn Object implementing connection to database, see class
  }
  constructor TSqlResult.create( dbConn: TSqlDatabase );
  	begin
   		initialize();
      _conn := dbConn;
    end
  ;


  {*
    Initializes the object, sets a connection, and initiates a query
  }
  constructor TSqlResult.create();
    begin
      initialize();
    end
  ;


  {*
    Initializes private members to 0, false, or nil
  }
  procedure TSqlResult.initialize();
    begin
      _rs := TRowList.Create();
      _fieldMap := TCStringList.create();
      _affectedRows := 0;
      _numRows := 0;
      _numFields := 0;
      _success := false;
      _conn := nil;
    end
  ;
  

  {*
    Initializes private members to 0, false, or nil
  }
  destructor TSqlResult.destroy();
    begin
      freeAndNil( _rs );
      freeAndNil( _fieldMap );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlResult: useful functions
//-----------------------------------------------------------------------------

  {*
    Creates a recordset of the field names within a table
    @param tableName Name of table
    @comment Data type and field descriptions are not currently implemented for all database types
  }
  procedure TSqlResult.describeTable( tableName: string );
    var
      i, j: integer;
      cat: _Catalog;
      tableFound: boolean;
      row: TSqlRow;
      res: TSqlResult;
      resRow: TSqlRow;
    begin
      // Setup...
      //---------
    	_rs.Clear();
      _fieldMap.Clear();

      _fieldMap.Append( 'Field' );
      _fieldMap.Append( 'Type' );
      _fieldMap.Append( 'Description' );

      // Sqlite...
      //----------
      if( DBSqlite = _conn.dbType ) then
        begin
          if( not( _conn.tableExists( tableName ) ) ) then
            raise exception.Create( 'Table "' + tableName + '" does not exist in TSqlDatabase.describeTable()' )
          ;
          // Create a new result set to get the information we want, then force it into the right fields.
          res := TSqlResult.create( 'PRAGMA table_info( ' + tableName + ' )', _conn );
          resRow := res.fetchArrayFirst();
          while( nil <> resRow ) do
            begin
              row := TSqlRow.create( _fieldMap );
              row.append( resRow.field( 'name' ) );
              row.append( resRow.field( 'type' ) ); // the data type
              row.append( '(Not available for Sqlite)' ); // the description field
              _rs.append( row );

              resRow := res.fetchArrayNext();
            end
          ;

          res.Free();
          exit;
        end
      ;


      // ADO Tables...
      //--------------
      tableFound := false;

      cat := coCatalog.create();
      cat.Set_ActiveConnection( _conn._adoConnStr );

      _conn._adoCat.ConnectTo( cat );


      cat := coCatalog.create();
      cat.Set_ActiveConnection( _conn._adoConnStr );

      _conn._adoCat.ConnectTo( cat );

      // Find the table...
      for i := 0 to _conn._adoCat.Tables.Count - 1 do
        begin
          if( tableName = _conn._adoCat.Tables[i].Name ) then
            begin
              tableFound := true;
              break;
            end
          ;
        end
      ;

      // ... then find the column in the table.
      // FIX ME: order is alphabetical, instead of "typical"
      if( tableFound ) then
        begin
          for j := 0 to _conn._adoCat.Tables[i].Columns.Count - 1 do
            begin
              row := TSqlRow.create( _fieldMap );
              dbcout2( _conn._adoCat.Tables[i].Columns[j].Name );
              row.append( _conn._adoCat.Tables[i].Columns[j].Name );
              row.append( 'FIX ME' ); // the data type
              row.append( 'FIX ME' ); // the description field
              _rs.append( row );
            end
        end
      ;
      _conn._adoCat.Disconnect();
    end
  ;

  {*
    Prepares several internal members and implements the specified query

    @param query SQL Statement
  }
	procedure TSqlResult.runQuery( query: string );
  	begin
    	_rs.Clear();
      _fieldMap.Clear();

   		if( length( query ) > 0 ) then
      	doQuery( query, _conn )
      ;
    end
  ;

  {*
    Implements queries(applies success tracking and exception handling overhead)

    @param query SQL statement to be implemented
    @param dbConn Object implementing connection to database, see class
    @throws Raises exception and output msg if the query can not be implemented
  }
  procedure TSqlResult.doQuery( query: string; dbConn: TSqlDatabase );
    begin
      if( not dbConn.isOpen and dbConn.autoReopen ) then
        dbConn.open()
      ;

      if( isSelect( query ) ) then
      	begin
        	try
        		runSelectQuery( query, dbConn );
            _success := true;
          except
            on e: Exception do
              begin
                dbcout( endl + 'BAD QUERY: ' + query + endl, true );
                _lastError := e.message;
                _success := false;
              end
            ;
          end;
        end
      else if( isOther( query ) ) then
      	begin
        	try
        		runOtherQuery( query, dbConn );
            _success := true;
          except
            on e: Exception do
              begin
                dbcout( endl + 'BAD QUERY: ' + query + endl, true );
                _lastError := e.message;
                _success := false;
              end
            ;
          end;
        end
      else
        begin
        	dbcout( endl + 'BAD QUERY: ' + query + endl, true );
          raise exception.Create('Bad query: ' + query);
          _lastError := 'unspecified';
          _success := false;
        end
      ;
    end
  ;

  {*
    Called by procedure doQuery to implement a Select type query

    @param query SQL statement to be implemented
    @param dbConn Object implementing connection to database, see class
  }
  procedure TSqlResult.runSelectQuery( query: string; dbConn: TSqlDatabase );
    var
      f: TField;
      fc: integer; // field (column) counter
      rc: integer; // row counter
      row: TSqlRow;
      str: string;
      ct: TCursorType;

      // Sqlite-specific variables
      i: integer;
      err: integer;
      stmtPtr: pointer;
      tailPtr: pointer;
      dataType: integer;
    begin
      if( not dbConn.isOpen and dbConn.autoReopen ) then
        dbConn.open()
      ;

      // Sqlite...
      //----------
      if( DBSqlite = dbConn.dbType ) then
        begin
          rc := 0;
          fc := 0;

          query := trim( query );

          err := sqlite3_prepare_v2( dbConn._sqlite, pchar( query ), length( query ), @stmtPtr, @tailPtr );

          if( SQLITE_OK = err ) then
            begin
              while( SQLITE_ROW = sqlite3_step( stmtPtr ) ) do
                begin
                  // Get field names the first time through.
                  //----------------------------------------
                  if( 0 = rc ) then
                    begin
                      fc := sqlite3_data_count( stmtPtr );

                      for i := 0 to fc - 1 do
                        begin
                          str := sqlite3_column_name( stmtPtr, i );
                          _fieldMap.append( str );
                        end
                      ;
                    end
                  ;

                  // Fill the recordset.
                  //--------------------
                  row := TSqlRow.create( _fieldMap );
                  for i := 0 to fc - 1 do
                    begin
                      dataType := sqlite3_column_type( stmtPtr, i );

                      case dataType of
                        SQLITE_NULL: row.append( NULL );
                        SQLITE_INTEGER: row.append( sqlite3_column_int( stmtPtr, i ) );
                        SQLITE_FLOAT: row.append( sqlite3_column_double( stmtPtr, i ) );
                        SQLITE3_TEXT:
                          begin
                            str := sqlite3_column_text( stmtPtr, i );
                            row.append( variant( str ) );
                          end
                        ;
                        SQLITE_BLOB: row.append( '(BLOB)' );
                      end;
                    end
                  ;
                  _rs.append( row );

                  inc( rc );
                end
              ;
              sqlite3_finalize( stmtPtr );
            end
          else
            raise exception.Create( 'Sqlite query failed with code ' + intToStr( err ) )
          ;

          _numRows := rc;
          _numFields := fc;

          exit;
        end
      ;


      // ADO databases...
      //-----------------
      dbConn._adoQuery.SQL.Clear();
      dbConn._adoQuery.SQL.Add( query );

      // For SELECT queries, a cursor type of ctOpenForwardOnly is so much faster that it's insane.
      // Remember the current cursor type to restore it at the end.  (This may not actually matter
      // for other query types, but I'm too lazy at the moment to check.)
      ct := dbConn._adoQuery.CursorType;
      dbConn._adoQuery.CursorType := ctOpenForwardOnly;

      dbConn._adoQuery.Open();

      _numFields := dbConn._adoQuery.FieldCount;

      // Get field names and fill the map
      //---------------------------------
      fc := 0;
      while( fc < dbConn._adoQuery.FieldCount ) do
        begin
          f := dbConn._adoQuery.Fields[fc];
          str := f.FullName;
          _fieldMap.append( str );
          inc( fc );
        end
      ;

      // fill the record set (New method: cursor type = ctOpenForwardOnly)
      //------------------------------------------------------------------
      if( not dbConn._adoQuery.Recordset.EOF ) then
        begin
          dbConn._adoQuery.Recordset.MoveFirst();

           // Put the data in an array
          while( not dbConn._adoQuery.Recordset.EOF ) do
            begin
              row := TSqlRow.create( _fieldMap );

              fc := 0;
              while( fc < dbConn._adoQuery.FieldCount ) do
                begin
                  row.append( dbConn._adoQuery.Recordset.Fields[fc].Value );
                  inc( fc );
                end
              ;

              //row.debug();

              _rs.append( row );

              dbConn._adoQuery.Recordset.MoveNext();
            end
          ;
        end
      ;

      _numRows := _rs.Count;


(***
      // fill the record set (Original method: cursor type = ctKeyset)
      //--------------------------------------------------------------
      _numRows := dbConn._adoQuery.RecordCount;
      rc := 0;

      while( rc < dbConn._adoQuery.RecordCount ) do
        begin
          row := TSqlRow.create( _fieldMap );

          fc := 0;
          while( fc < dbConn._adoQuery.FieldCount ) do
            begin
              f := dbConn._adoQuery.Fields[fc];
              row.append( f.value );
              fc := fc + 1;
            end
          ;

          //row.debug();

          _rs.append( row );
          inc(  rc );
          dbConn._adoQuery.Next();
        end
      ;
*)

      dbConn._adoQuery.SQL.clear();
      dbConn._adoQuery.Close();

      // Restore the existing cursor type
      //---------------------------------
      dbConn._adoQuery.CursorType := ct;
    end
  ;


  {*
    Called by procedure doQuery to implement non-Select types of queries

    @param query SQL statement to be implemented
    @param dbConn Object implementing connection to database, see class
  }
  procedure TSqlResult.runOtherQuery( query: string; dbConn: TSqlDatabase );
    begin
      if( not dbConn.isOpen and dbConn.autoReopen ) then
        dbConn.open()
      ;

      // SQLlite...
      //-----------
      if( DBSqlite = dbConn.dbType ) then
        begin
          if( dbConn.execute( query ) ) then
            begin
              _affectedRows := sqlite3_changes( dbConn._sqlite );
              _success := true;
            end
          else
            begin
              raise exception.Create( 'Sqlite query failed with message: ' + dbConn._lastError );
              _affectedRows := -1; // indicates an error condition
              _success := false;
            end
          ;
          
          exit;
        end
      ;

      // ADO databases...
      //-----------------
      dbConn._adoQuery.SQL.Clear();
      dbConn._adoQuery.SQL.add( query );

      if( 0 = dbConn._adoQuery.execSQL() ) then
        begin
          _affectedRows := dbConn._adoQuery.RowsAffected;
          _success := true;
        end
      else
        begin
          _affectedRows := -1; // indicates an error condition
          _success := false;
        end
      ;
    end
  ;

  {*
    Determines if query is a select type query

    @param query SQL statement
    @return true if the query is a select type query
    @comment tests for the initial word 'select'
  }
  function TSqlResult.isSelect( query: string ): boolean;
    begin
      if( 'select' = leftStr( fixup( query ), 6 ) ) then
        result := true
      else if( ( DBSqlite = _conn.dbType ) and ( 'pragma' = leftStr( fixup( query ), 6 ) ) ) then
        result := true
      else
        result := false
      ;
    end
  ;

  {*
    Determines if query is a type other than select

    @param SQL statement
    @return true if the query is not a select type query
    @comment tests for five SQL keywords or phrases
  }
  function TSqlResult.isOther( query: string ): boolean;
    var
      fq: string;
    begin
      fq := fixup( query );

      if
        ( leftStr( fq, 6 ) = 'insert' )
      or
        ( leftStr( fq, 6 ) = 'update' )
      or
        ( leftStr( fq, 6 ) = 'delete' )
      or
        ( leftStr( fq, 12 ) = 'create table' )
      or
        ( leftStr( fq, 11 ) = 'alter table' )
      then
        result := true
      else
        result := false
      ;
    end
  ;


  {*
    Returns the first row in the recordset

    @return A row of data, see class
  }
  function TSqlResult.fetchArrayFirst(): TSqlRow;
    begin
      result := _rs.first();
    end
  ;


  {*
    Returns the next row in the recordset

    @return A row of data, see class
  }
  function TSqlResult.fetchArrayNext(): TSqlRow;
    begin
      result := _rs.next();
    end
  ;


  {*
    Returns the row in the recordset at the specified index

    @param i Location of row in the list to be retrieved
    @return A row of data, see class
  }
  function TSqlResult.fetchArray( i: integer ): TSqlRow;
    begin
      result := _rs.getObject( i );
    end
  ;


  {*
    Displays contents to the debugging window
  }
  procedure TSqlResult.debug();
    var
      row: TSqlRow;
    begin
      dbcout( '---- TSQLRESULT DEBUG', true );

      row := self.fetchArrayFirst();
      while( nil <> row ) do
        begin
          row.debug();
          row := self.fetchArrayNext();
        end
      ;

      dbcout( '---- DONE TSQLRESULT DEBUG', true );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// TSqlResult: properties
//-----------------------------------------------------------------------------

  {*
    For Property: Sets the recordset number of rows counter
    @param val Setter
  }
  procedure TSqlResult.setNumRows( val: integer ); begin _numRows := val; end;

  {*
    For Property: Sets the affected row counter
    @param val Setter
  }
  procedure TSqlResult.setAffectedRows( val: integer ); begin _affectedRows := val; end;

  {*
    For Property: Sets the number of fields counter
    @param val Setter
  }
  procedure TSqlResult.setNumFields( val: integer ); begin _numFields := val; end;

  {*
    For Property: Sets whether providing a query resultset was a success
    @param val Setter
  }
  procedure TSqlResult.setSuccess( val: boolean ); begin _success := val; end;

  {*
    For Property: Sets the database connection of the private member
    @param val Setter
  }
  procedure TSqlResult.setConn( val: TSqlDatabase ); begin _conn := val; end;

  {*
    For Property: Returns the number of rows in the query recordset
    @return value of _numRows internal member
  }
  function TSqlResult.getNumRows(): integer; begin Result := _numRows; end;

  {*
    For Property: Returns the number of affected rows of the database
    @return value of _affectedRows internal member
  }
  function TSqlResult.getAffectedRows(): integer; begin Result := _affectedRows; end;

  {*
    For Property: Returns the number of fields in the query recordset
    @return value of _numFields internal member
  }
  function TSqlResult.getNumFields(): integer; begin Result := _numFields; end;

  {*
    For Property: Returns whether the query operation was a sucess
    @return value of _success internal member
  }
  function TSqlResult.getSuccess(): boolean; begin Result := _success; end;

  {*
    For Property: Returns the SQL operations database connection object
    @return value of _conn internal member
  }
  function TSqlResult.getConn(): TSqlDatabase; begin Result := _conn; end;

//-----------------------------------------------------------------------------


//*****************************************************************************
// DLL Loading
//*****************************************************************************
  function sqliteDllLoaded( msg: pstring = nil ): boolean;
    begin
      result := sqliteLoaded and dsqlitewrapperLoaded;

      if( nil <> msg ) then
        msg^ := msg^ + loadErrors
      ;
    end
  ;
  

  procedure loadSqliteDLL( dllHandle: THandle );
    var
      result: boolean;
    begin
      result := true;

      dbcout( 'Attempting to set function pointers in loadSqliteDLL...', DBSQLCLASSES );

      sqlite3_open := GetProcAddress( dllHandle, 'sqlite3_open' );
      if( nil = @sqlite3_open ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_open.' + endl;
          result := false;
        end
      ;

      sqlite3_close := GetProcAddress( dllHandle, 'sqlite3_close' );
      if( nil = @sqlite3_close ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_close.' + endl;
          result := false;
        end
      ;

      sqlite3_exec := GetProcAddress( dllHandle, 'sqlite3_exec' );
      if( nil = @sqlite3_exec ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_exec.' + endl;
          result := false;
        end
      ;

      sqlite3_changes := GetProcAddress( dllHandle, 'sqlite3_changes' );
      if( nil = @sqlite3_changes ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_changes.' + endl;
          result := false;
        end
      ;

      sqlite3_prepare_v2 := GetProcAddress( dllHandle, 'sqlite3_prepare_v2' );
      if( nil = @sqlite3_prepare_v2 ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_prepare_v2.' + endl;
          result := false;
        end
      ;

      sqlite3_step := GetProcAddress( dllHandle, 'sqlite3_step' );
      if( nil = @sqlite3_step ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_step.' + endl;
          result := false;
        end
      ;

      sqlite3_data_count := GetProcAddress( dllHandle, 'sqlite3_data_count' );
      if( nil = @sqlite3_data_count ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_data_count.' + endl;
          result := false;
        end
      ;

      sqlite3_column_name := GetProcAddress( dllHandle, 'sqlite3_column_name' );
      if( nil = @sqlite3_column_name ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_column_name.' + endl;
          result := false;
        end
      ;

      sqlite3_column_text := GetProcAddress( dllHandle, 'sqlite3_column_text' );
      if( nil = @sqlite3_column_text ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_column_text.' + endl;
          result := false;
        end
      ;

      sqlite3_finalize := GetProcAddress( dllHandle, 'sqlite3_finalize' );
      if( nil = @sqlite3_finalize ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_finalize.' + endl;
          result := false;
        end
      ;

      sqlite3_last_insert_rowid := GetProcAddress( dllHandle, 'sqlite3_last_insert_rowid' );
      if( nil = @sqlite3_last_insert_rowid ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_last_insert_rowid.' + endl;
          result := false;
        end
      ;

      sqlite3_bind_blob := GetProcAddress( dllHandle, 'sqlite3_bind_blob' );
      if( nil = @sqlite3_bind_blob ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_bind_blob.' + endl;
          result := false;
        end
      ;

      sqlite3_column_type := GetProcAddress( dllHandle, 'sqlite3_column_type' );
      if( nil = @sqlite3_column_type ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_column_type.' + endl;
          result := false;
        end
      ;

      sqlite3_column_int := GetProcAddress( dllHandle, 'sqlite3_column_int' );
      if( nil = @sqlite3_column_int ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_column_int.' + endl;
          result := false;
        end
      ;

      sqlite3_column_double := GetProcAddress( dllHandle, 'sqlite3_column_double' );
      if( nil = @sqlite3_column_double ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_column_double.' + endl;
          result := false;
        end
      ;

      sqlite3_blob_open := GetProcAddress( dllHandle, 'sqlite3_blob_open' );
      if( nil = @sqlite3_blob_open ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_blob_open.' + endl;
          result := false;
        end
      ;

      sqlite3_blob_close := GetProcAddress( dllHandle, 'sqlite3_blob_close' );
      if( nil = @sqlite3_blob_close ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_blob_close.' + endl;
          result := false;
        end
      ;

      sqlite3_blob_bytes := GetProcAddress( dllHandle, 'sqlite3_blob_bytes' );
      if( nil = @sqlite3_blob_bytes ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_blob_bytes.' + endl;
          result := false;
        end
      ;

      sqlite3_blob_read := GetProcAddress( dllHandle, 'sqlite3_blob_read' );
      if( nil = @sqlite3_blob_read ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_blob_read.' + endl;
          result := false;
        end
      ;

      sqlite3_blob_write := GetProcAddress( dllHandle, 'sqlite3_blob_write' );
      if( nil = @sqlite3_blob_write ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: sqlite3_blob_write.' + endl;
          result := false;
        end
      ;

      sqliteLoaded := result;
    end
  ;


  procedure loadDSqliteWrapperDLL( dllHandle: THandle );
    var
      result: boolean;
    begin
      result := true;

      dbcout( 'Attempting to set function pointers in loadDSqliteWrapperDLL...', DBSQLCLASSES );

      dsqlite3_blob_open := GetProcAddress( dllHandle, 'dsqlite3_blob_open' );
      if( nil = @dsqlite3_blob_open ) then
        begin
          loadErrors := loadErrors + 'MISSING FUNCTION: dsqlite3_blob_open.' + endl;
          result := false;
        end
      ;

      dsqlitewrapperLoaded := result;
    end
  ;


  // Dynamic loading takes more code than static loading,
  // but it is far more graceful when it doesn't work.
  procedure loadDynamicDLL();
     var
      dllHandle: THandle; //Handle used to open the DLL.  Defined in unit Windows.
    begin
      // Load pointers from library sqlite3.dll
      //---------------------------------------
      try
        dllHandle := loadLibrary( 'sqlite3.dll' );
        dbcout( 'loadLibrary sqlite3.dll successful.', DBSQLCLASSES );
      except
        dllHandle := 0;
        dbcout( 'loadLibrary sqlite3.dll failed.', DBSQLCLASSES );
      end;

      if( dllHandle >= 32 ) then // library was successfully loaded.  Assign function pointers now.
        loadSqliteDLL( dllHandle )
      ;

      // Load pointers from library dsqlitewrapper.dll
      //----------------------------------------------
      try
        dllHandle := loadLibrary( 'dsqlitewrapper.dll' );
        dbcout( 'loadLibrary dsqlitewrapper.dll successful.', DBSQLCLASSES );
      except
        dllHandle := 0;
        dbcout( 'loadLibrary dsqlitewrapper.dll failed.', DBSQLCLASSES );
      end;

      if( dllHandle >= 32 ) then // library was successfully loaded.  Assign function pointers now.
        loadDSqliteWrapperDLL( dllHandle )
      ;
    end
  ;
//*****************************************************************************

initialization
  loadErrors := '';
  sqliteLoaded := false;
  loadDynamicDLL();

end.
