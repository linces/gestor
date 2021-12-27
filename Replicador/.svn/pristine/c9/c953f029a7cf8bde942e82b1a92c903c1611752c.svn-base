unit Replicador.Model.Metadata.Replicador.Script;

interface

uses
  Replicador.Model.Interfaces, Replicador.Model.Metadata.Master;

Type
  iMetadataReplicadorScript = interface
    ['{387A779C-38EC-43B4-9566-7BF2E758FE13}']
    function CreateTables : iMetadataReplicadorScript;
    function CreateConstraint : iMetadataReplicadorScript;
    function CreateTrigger : iMetadataReplicadorScript;
    function Executar : iMetadataReplicadorScript;
  end;

  TModelMetadataReplicadorScript = class(TInterfacedObject, iMetadataReplicadorScript)
    private
      FConexao : IModelConexao;
      FMetadataMaster : iMetadataMaster;
      function CreateTables : iMetadataReplicadorScript;
      function CreateConstraint : iMetadataReplicadorScript;
      function CreateTrigger : iMetadataReplicadorScript;
    public
      constructor Create(Connection : iModelConexao) ;
      destructor Destroy; override;
      class function New(Connection : iModelConexao) : iMetadataReplicadorScript;
      function Executar : iMetadataReplicadorScript;
  end;

implementation

{ TModelMetadataReplicadorScript }


constructor TModelMetadataReplicadorScript.Create(Connection : iModelConexao) ;
begin
  FConexao := Connection;
  FMetadataMaster := TModelMetadataMaster.New(FConexao);
end;

function TModelMetadataReplicadorScript.CreateConstraint: iMetadataReplicadorScript;
var
  SQL : String;
begin
  Result := Self;
  try
    if not FMetadataMaster.Validations.CheckIndex('PK_SCRIPTS') then
    begin
      SQL := '';
      SQL := SQL + ' ALTER TABLE SCRIPTS ';
      SQL := SQL + ' ADD CONSTRAINT PK_SCRIPTS ';
      SQL := SQL + ' PRIMARY KEY (GUUID) ';
      FConexao.Query(1).ExecuteSQL(SQL);
    end;
  except

  end;

  try
    if not FMetadataMaster.Validations.CheckIndex('SCRIPTS_IDX1') then
    begin
      SQL := '';
      SQL := SQL + ' CREATE INDEX SCRIPTS_IDX1 ';
      SQL := SQL + ' ON SCRIPTS (DATA,HORA,IDRECEIVER) ';
      FConexao.Query(1).ExecuteSQL(SQL);
    end;
  except

  end;

  try
    if not FMetadataMaster.Validations.CheckIndex('PK_LOG_SCRIPT') then
    begin
      SQL := SQL + ' ALTER TABLE LOG_SCRIPT ';
      SQL := SQL + ' ADD CONSTRAINT PK_LOG_SCRIPT ';
      SQL := SQL + ' PRIMARY KEY (GUUID) ';
      FConexao.Query(1).ExecuteSQL(SQL);
    end;
  except

  end;
end;

function TModelMetadataReplicadorScript.CreateTables: iMetadataReplicadorScript;
var
  SQL : String;
begin
  Result := Self;
  try
    if not FMetadataMaster.Validations.CheckTable('SCRIPTS') then
    begin
      SQL := '';
      SQL := SQL + ' CREATE TABLE SCRIPTS ( ';
      SQL := SQL + ' GUUID VARCHAR(32) NOT NULL, ';
      SQL := SQL + ' DESCRICAO VARCHAR(255), ';
      SQL := SQL + ' IDRECEIVER INTEGER, ';
      SQL := SQL + ' SCRIPT BLOB SUB_TYPE 1 SEGMENT SIZE 80, ';
      SQL := SQL + ' STATUS INTEGER, ';
      SQL := SQL + ' DATA DATE, ';
      SQL := SQL + ' HORA TIME) ';
      FConexao.Query(1).ExecuteSQL(SQL);
    end;
  except

  end;

  try
    if not FMetadataMaster.Validations.CheckTable('LOG_SCRIPT') then
    begin
      SQL := '';
      SQL := SQL + ' CREATE TABLE LOG_SCRIPT ( ';
      SQL := SQL + ' GUUID VARCHAR(32) NOT NULL, ';
      SQL := SQL + ' SCRIPT VARCHAR(32), ';
      SQL := SQL + ' DATAHORAEXEC TIMESTAMP) ';
      FConexao.Query(1).ExecuteSQL(SQL);
    end;

  except

  end;
end;

function TModelMetadataReplicadorScript.CreateTrigger: iMetadataReplicadorScript;
var
  SQL : String;
begin
  FConexao.Query(1).ParamCheck(false);
  try
    SQL := '';
    SQL := SQL + ' CREATE OR ALTER TRIGGER SCRIPTS_BI0 FOR SCRIPTS ';
    SQL := SQL + ' ACTIVE BEFORE INSERT POSITION 0 ';
    SQL := SQL + ' AS ';
    SQL := SQL + ' declare variable UUID  Varchar(32); ';
    SQL := SQL + ' begin ';
    SQL := SQL + ' execute procedure get_hex_uuid returning_values :UUID; ';
    SQL := SQL + ' New.GUUID = :UUID; ';
    SQL := SQL + ' end ';
    FConexao.Query(1).ExecuteSQL(SQL);
  except

  end;

  try
    SQL := '';
    SQL := SQL + ' CREATE OR ALTER TRIGGER LOG_SCRIPT_BI0 FOR LOG_SCRIPT ';
    SQL := SQL + ' ACTIVE BEFORE INSERT POSITION 0 ';
    SQL := SQL + ' AS ';
    SQL := SQL + ' declare variable UUID  Varchar(32); ';
    SQL := SQL + ' begin ';
    SQL := SQL + ' execute procedure get_hex_uuid returning_values :UUID; ';
    SQL := SQL + ' New.GUUID = :UUID; ';
    SQL := SQL + ' New.datahoraexec = current_timestamp; ';
    SQL := SQL + ' end ';
    FConexao.Query(1).ExecuteSQL(SQL);
  except

  end;
  FConexao.Query(1).ParamCheck(true);
end;

destructor TModelMetadataReplicadorScript.Destroy;
begin
  inherited;
end;

function TModelMetadataReplicadorScript.Executar: iMetadataReplicadorScript;
begin
  Result := Self;
  Self
  .CreateTables
  .CreateConstraint
  .CreateTrigger;
end;

class function TModelMetadataReplicadorScript.New(Connection : iModelConexao) : iMetadataReplicadorScript;
begin
  Result := Self.Create(Connection);
end;

end.
