unit Replicador.Model.Scripts.Firedac;

interface

uses
  Replicador.Model.Interfaces, FireDAC.UI.Intf, FireDAC.Stan.Async, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.Script,
  Replicador.Controller.Tipificacoes;

Type
  iModelScripts = interface
    ['{AAD90CCF-04DB-4ACA-AC58-82E1EAA10D0B}']
    function Log(Value : TEvLog) : iModelScripts;
    function Executar : iModelScripts;
  end;

  TReplicadorModelScripts = class(TInterfacedObject, iModelScripts)
    private
      FConexao : IModelConexao;
      FDestiny : IModelConexao;
      FSQLProcessor1: TFDScript;
      FLog : TEvLog;
    procedure SetLog(const Value: String);
    public
      constructor Create(Replicator, Destiny : iModelConexao);
      destructor Destroy; override;
      class function New(Replicator, Destiny : iModelConexao) : iModelScripts;
      function Executar : iModelScripts;
      function BuscarRegistros : iModelScripts;
      function RegistrarExecucao : iModelScripts;
      function Log(Value : TEvLog) : iModelScripts;
      property MsgLog : String write SetLog;
  end;

implementation

uses
  System.SysUtils;

{ TReplicadorModelScripts }

function TReplicadorModelScripts.BuscarRegistros: iModelScripts;
var
  SQL : String;
begin
  SQL := '';
  SQL := SQL + ' WITH ';
  SQL := SQL + ' A As ( ';
  SQL := SQL + ' select ';
  SQL := SQL + ' * ';
  SQL := SQL + ' FROM ';
  SQL := SQL + ' SCRIPTS S ';
  SQL := SQL + ' WHERE ';
  SQL := SQL + ' S.status = 1 AND ';
  SQL := SQL + ' S.IDRECEIVER = ' + IntToStr(FDestiny.ID) + ' AND ';
  SQL := SQL + ' ((S.data is null) and (S.hora is null)) ';
  SQL := SQL + ' ), ';
  SQL := SQL + ' B AS ( ';
  SQL := SQL + ' SELECT ';
  SQL := SQL + ' * ';
  SQL := SQL + ' FROM ';
  SQL := SQL + ' SCRIPTS S ';
  SQL := SQL + ' WHERE ';
  SQL := SQL + ' S.STATUS = 1 AND ';
  SQL := SQL + ' S.IDRECEIVER = ' + IntToStr(FDestiny.ID) + ' AND ';
  SQL := SQL + ' EXTRACT(HOUR FROM S.HORA) >= EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND ';
  SQL := SQL + ' S.data = CAST(CURRENT_TIMESTAMP AS DATE) AND ';
  SQL := SQL + ' S.guuid not in (SELECT LS.script FROM LOG_SCRIPT LS WHERE Cast(DATAHORAEXEC as DATE) = CURRENT_DATE) ';
  SQL := SQL + ' ), ';
  SQL := SQL + ' C AS ( ';
  SQL := SQL + ' SELECT ';
  SQL := SQL + ' * ';
  SQL := SQL + ' FROM ';
  SQL := SQL + ' SCRIPTS S ';
  SQL := SQL + ' WHERE ';
  SQL := SQL + ' S.STATUS = 1 AND ';
  SQL := SQL + ' S.IDRECEIVER = ' + IntToStr(FDestiny.ID) + ' AND ';
  SQL := SQL + ' EXTRACT(HOUR FROM S.HORA) >= EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND ';
  SQL := SQL + ' S.data is null AND ';
  SQL := SQL + ' S.guuid not in (SELECT LS.script FROM LOG_SCRIPT LS WHERE Cast(DATAHORAEXEC as DATE) = CURRENT_DATE AND EXTRACT(HOUR FROM DATAHORAEXEC) = EXTRACT(HOUR FROM CURRENT_TIMESTAMP)) ';
  SQL := SQL + ' ), ';
  SQL := SQL + ' D AS ( ';
  SQL := SQL + ' SELECT ';
  SQL := SQL + ' * ';
  SQL := SQL + ' FROM ';
  SQL := SQL + ' SCRIPTS S ';
  SQL := SQL + ' WHERE ';
  SQL := SQL + ' S.STATUS = 1 AND ';
  SQL := SQL + ' S.IDRECEIVER = ' + IntToStr(FDestiny.ID) + ' AND ';
  SQL := SQL + ' EXTRACT(HOUR FROM S.HORA) >= EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AND ';
  SQL := SQL + ' S.data = CAST(CURRENT_TIMESTAMP AS DATE) AND ';
  SQL := SQL + ' S.guuid not in (SELECT LS.script FROM LOG_SCRIPT LS WHERE Cast(DATAHORAEXEC as DATE) = CURRENT_DATE AND EXTRACT(HOUR FROM DATAHORAEXEC) = EXTRACT(HOUR FROM CURRENT_TIMESTAMP)) ';
  SQL := SQL + ' ) ';
  SQL := SQL + ' SELECT * FROM A ';
  SQL := SQL + ' UNION ';
  SQL := SQL + ' SELECT * FROM B ';
  SQL := SQL + ' UNION ';
  SQL := SQL + ' SELECT * FROM C ';
  SQL := SQL + ' UNION ';
  SQL := SQL + ' SELECT * FROM D ';
  FConexao.Query(1).OpenSQL(SQL);
end;

constructor TReplicadorModelScripts.Create(Replicator, Destiny : iModelConexao);
begin
  FConexao := Replicator;
  FDestiny := Destiny;
  FSQLProcessor1 := TFDScript.Create(nil);
  FSQLProcessor1.Connection := TFDConnection(FDestiny.Objecto);
end;

destructor TReplicadorModelScripts.Destroy;
begin
  FSQLProcessor1.Free;
  inherited;
end;

function TReplicadorModelScripts.Executar: iModelScripts;
begin
  Result := Self;
  try
    Self.BuscarRegistros;
    while not FConexao.Query(1).DataSet.Eof do
    begin
      MsgLog := 'EXECUTANDO O SCRIPT (' + FConexao.Query(1).DataSet.FieldByName('DESCRICAO').AsString + ') NO BANCO ' + FDestiny.Descrition;

      with FSQLProcessor1 do begin
        SQLScripts.Clear;
        SQLScripts.Add;
        with SQLScripts[0].SQL do begin
          Add(FConexao.Query(1).DataSet.FieldByName('SCRIPT').AsString);
        end;
        ValidateAll;
        ExecuteAll;
      end;
      Self.RegistrarExecucao;
      FConexao.Query(1).DataSet.Next;
    end;
  Except on E : Exception do
    //MsgLog := 'ERROR: ' + E.Message;
  end;
end;

function TReplicadorModelScripts.Log(Value: TEvLog): iModelScripts;
begin
  Result := Self;
  FLog := Value;
end;

class function TReplicadorModelScripts.New(Replicator, Destiny : iModelConexao) : iModelScripts;
begin
  Result := Self.Create(Replicator, Destiny);
end;

function TReplicadorModelScripts.RegistrarExecucao: iModelScripts;
begin
  FConexao.Query(2).ExecuteSQL('INSERT INTO LOG_SCRIPT (SCRIPT) VALUES ( ' + QuotedStr(FConexao.Query(1).DataSet.FieldByName('GUUID').AsString) + ')');
end;

procedure TReplicadorModelScripts.SetLog(const Value: String);
begin
  if Assigned(FLog) then
    FLog(Value);
end;

end.
