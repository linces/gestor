unit Replicador.Model.Metadata.Master;

interface

uses
  Replicador.Model.Interfaces;

Type
  iMetadataMasterValidations = interface;

  iMetadataMaster = interface
    ['{E5AF82DD-42EF-49F1-A3C6-F12ECCBA4199}']
    function Validations : iMetadataMasterValidations;
  end;

  iMetadataMasterValidations = interface
    ['{5A32EE7D-585F-43C0-B8EF-52AA0C70049F}']
    function CheckTable (NameTable : String) : Boolean;
    function CheckGenerator (NameGenerator : String) : Boolean;
    function CheckIndex (NameIndex : String) : Boolean;
    function &End : iMetadataMaster;
  end;

  TModelMetadataMaster = class(TInterfacedObject, iMetadataMaster, iMetadataMasterValidations)
    private
      FConnection : iModelConexao;
    public
      constructor Create(Connection : iModelConexao);
      destructor Destroy; override;
      class function New(Connection : iModelConexao) : iMetadataMaster;
      function Validations : iMetadataMasterValidations;
      function CheckTable (NameTable : String) : Boolean;
      function CheckGenerator (NameGenerator : String) : Boolean;
      function CheckIndex (NameIndex : String) : Boolean;
      function &End : iMetadataMaster;
  end;

implementation

uses
  System.SysUtils;

{ TModelMetadataMaster }

function TModelMetadataMaster.CheckGenerator(NameGenerator: String): Boolean;
begin
  Result := False;
  FConnection.Query(1).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT rdb$generator_name from rdb$generators where rdb$generator_name = ' + QuotedStr(NameGenerator) + ')');
  if FConnection.Query(1).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
    Result := True;
end;

function TModelMetadataMaster.CheckIndex(NameIndex: String): Boolean;
begin
  Result := False;
  FConnection.Query(1).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM RDB$INDICES WHERE RDB$INDEX_NAME = ' + QuotedStr(NameIndex) + ')');
  if FConnection.Query(1).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
    Result := True;
end;

function TModelMetadataMaster.CheckTable(NameTable: String): Boolean;
var
  SQL: string;
begin
  Result := False;
  SQL := '';
  SQL := SQL + ' SELECT COUNT(*) QTDE ';
  SQL := SQL + ' FROM RDB$RELATIONS ';
  SQL := SQL + ' WHERE RDB$FLAGS=1 and RDB$RELATION_NAME=' + QuotedStr(NameTable);
  FConnection.Query(1).OpenSQL(SQL);
  if FConnection.Query(1).DataSet.FieldByName('QTDE').AsInteger > 0 then
    Result := True;
end;

function TModelMetadataMaster.&End: iMetadataMaster;
begin
  Result := Self;
end;

constructor TModelMetadataMaster.Create(Connection : iModelConexao);
begin
  FConnection := Connection;
end;

destructor TModelMetadataMaster.Destroy;
begin

  inherited;
end;

class function TModelMetadataMaster.New(Connection : iModelConexao) : iMetadataMaster;
begin
  Result := Self.Create(Connection);
end;

function TModelMetadataMaster.Validations: iMetadataMasterValidations;
begin
  Result := Self;
end;

end.
