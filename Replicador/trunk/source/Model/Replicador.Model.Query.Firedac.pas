unit Replicador.Model.Query.Firedac;

interface

uses
  Replicador.Model.Interfaces, Replicador.Model.Log,
  System.Classes, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI;

Type
  TModelQuery = class(TInterfacedObject, iModelQuery)
    private
      FConnection : iModelConexao;
      FQuery : TFDQuery;
      FParams : TParams;
    public
      constructor Create(Connection : iModelConexao);
      destructor Destroy; override;
      class function New(Connection : iModelConexao) : iModelQuery;
      function SQL : TStrings;
      function Open : IModelQuery;
      function FieldByName(Value : String) : TField;
      function Eof : Boolean;
      function First : IModelQuery;
      function Next : IModelQuery;
      function OpenSQL(Value : String) : iModelQuery;
      //function Params : TParams;
      function Close : IModelQuery;
      function ExecSQL : IModelQuery;
      function DataSet : TDataSet;
      function ExecuteSQL(aSQL: String) : iModelQuery;
      function ParamCheck(Value : Boolean) : iModelQuery;
      function Params : TFDParams;
      function Execute(ArraySize : Integer; Position : Integer) : iModelQuery;
  end;

implementation

uses
  System.SysUtils, Replicador.Model.Conexao.Firedac;

{ TModelQuery }

function TModelQuery.Close: IModelQuery;
begin
  Result := Self;
  FQuery.Close;
end;

constructor TModelQuery.Create(Connection : iModelConexao);
begin
  FConnection := Connection;
  FQuery := TFDQuery.Create(TFDConnection(FConnection.Objecto));
  FQuery.Connection := TFDConnection(FConnection.Objecto);
  FQuery.FetchOptions.RowsetSize := 1000000;
end;

function TModelQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelQuery.Eof: Boolean;
begin
  Result := FQuery.Eof;
end;

function TModelQuery.ExecSQL: IModelQuery;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

function TModelQuery.Execute(ArraySize, Position: Integer): iModelQuery;
begin
  Result := Self;
  FQuery.Execute(ArraySize, Position);
end;

function TModelQuery.ExecuteSQL(aSQL: String): iModelQuery;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  TModelConexao.GravarLog(aSQL);
  FQuery.SQL.Add(aSQL);
  FQuery.ExecSQL;
end;

function TModelQuery.FieldByName(Value: String): TField;
begin
  Result := FQuery.FieldByName(Value);
end;

function TModelQuery.First: IModelQuery;
begin
  Result := Self;
  FQuery.First;
end;

class function TModelQuery.New(Connection : iModelConexao) : iModelQuery;
begin
  Result := Self.Create(Connection);
end;

function TModelQuery.Next: IModelQuery;
begin
  Result := Self;
  FQuery.Next;
end;

function TModelQuery.Open: IModelQuery;
begin
  Result := Self;
  FQuery.Open;
end;

function TModelQuery.OpenSQL(Value: String): iModelQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Text := Value;
  TModelConexao.GravarLog(Value);
  FQuery.Open;
end;

function TModelQuery.ParamCheck(Value: Boolean): iModelQuery;
begin
  Result := Self;
end;

function TModelQuery.Params: TFDParams;
begin
  Result := FQuery.Params;
end;

function TModelQuery.SQL: TStrings;
begin
  Result := FQuery.SQL;
end;

end.
