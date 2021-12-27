unit Replicador.Controller.Replicacao;

interface

uses SysUtils, Replicador.Controller.Interfaces,
  Replicador.Controller.Constantes.Traducao,
  Replicador.Controller.Tipificacoes, System.Threading,
  Replicador.Controller.Metadata, SyncObjs, System.Classes,
  Replicador.Model.Interfaces;

type
  TControllerReplicacao = class(TInterfacedObject, IControllerReplicator)
  private
    FConexaoLocal: IControllerConexao;
    FCritical : TCriticalSection;
    FLog: TEvLog;
    FMsgLog: String;
    FHost, FPath, FTypeDB, FUser, FPassword, FRoleName, FServer, FPort : String;
    FControllerETL: IControllerETL;
    FControllerMetadata : IControllerMetadata;
    FChartValue : TChartValue;
    FInjectBankId : Boolean;
    FDBVersion : String;
    FVendorLib : String;
    procedure SetConexaoLocal(const Value: IControllerConexao);
    procedure verifyRegisteredBanks;
    procedure createReplicationList;
    procedure searchRecordsReplication(Limit : Integer; MasterKey : String);
    procedure replicatingScheduleData(Limit : Integer; MasterKeys : String; Sequencer : Boolean);
    procedure createFieldsScheduleData(var Fields : String; MasterKeys : String);
    procedure cleanReplication(Limit, I, X : Integer);
    procedure searchPrimaryKeys;
    function GetLog: TEvLog;
    procedure SetLog(const Value: TEvLog);
    function GetMsgLog: String;
    procedure SetMsgLog(const Value: String);
    procedure SetControllerETL(const Value: IControllerETL);
    procedure formatedTablesWhere(var aSQL: String; Tables : String);
    procedure replicateInsertUpdate(Limit : Integer; Keys: string; MasterKeys: string; I: Integer; X: Integer; var Where: string; var SQL: string);
    procedure replicateInsertUpdateSequencer(Limit : Integer; Keys: string; MasterKeys: string; I: Integer; X: Integer; var Where: string; var SQL: string);
    procedure replicateBackupFull(Origem, Destino: Integer);
    procedure replicateBackupTable(Table : String; Origem, Destino: Integer);
    procedure replicateDelete(Limit : Integer; Keys: string; MasterKeys: string; I: Integer; X: Integer; Where: string);
    procedure findFieldsTable(Banco : IModelConexao; Tabela : String; var Fields : String);
    procedure findSQLTable(Banco : Integer; Tabela : String; var aSQL : String);
    procedure ChartValue(Value : TChartValue);
    procedure SetChart(Title: String; Value : Currency; Clear : Boolean = false);
    procedure ClearReplicateBank;
    procedure ClearCacheReplicate(Provider, Destino : Integer);
    procedure ReplicateInsertUpdateTable(Tabela: String; ConexaoReplicador, ConexaoProvider, ConexaoDestino: IModelConexao; Limit: Integer; MsgLog: TEvLog);
    function InjectBankId (Value : Boolean) : IControllerReplicator;
  public
    constructor Create(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib: String);
    destructor Destroy; override;
    class function New(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib: String) : IControllerReplicator;
    procedure Replicate(Limit : Integer; MasterKey : String; Sequencer : Boolean = false);
    property Conexoes: IControllerConexao read FConexaoLocal write SetConexaoLocal;
    property ControllerETL: IControllerETL read FControllerETL write SetControllerETL;
    procedure BackupFull(ApplicationName : String; IdBancoOrigem : Integer);
    procedure BackupTable(ApplicationName, Table : String; IdBancoOrigem : Integer);
    property Log: TEvLog read GetLog write SetLog;
    property MsgLog: String read GetMsgLog write SetMsgLog;

  end;

implementation

uses
  Replicador.Controller.Factory, System.IniFiles, StrUtils,
  Winapi.Windows, Replicador.Controller.ETL, Replicador.Controller.ThreadSafe,
  Replicador.Model.Metadata.Replicador.Script, Replicador.Model.Scripts.Firedac;

{ TControllerReplicacao }


procedure TControllerReplicacao.BackupFull(ApplicationName : String; IdBancoOrigem : Integer);
var
  I: Integer;
  X: Integer;
begin
  MsgLog := 'AGUARDE... INICIANDO O BACKUP FULL';
  MsgLog := 'ATENÇÃO... ESSE PROCESSO PODE DEMORAR MINUTOS OU HORAS DEPENDENDO DA QUANTIDADE DE REGISTROS';
  verifyRegisteredBanks;
  createReplicationList;

  FControllerMetadata := TControllerMetadata.New(FHost, FPath, FTypeDB, FDBVersion, FUser, FPassword, FRoleName, FServer, FPort, FVendorLib);
  FControllerMetadata.Log := FLog;

  for I := 0 to Pred(Conexoes.ListaConexoes.Count) do
  begin
    if Conexoes.ListaConexoes[I].ID = IdBancoOrigem then
    begin
      for X := 1 to Conexoes.ListaConexoes.Count - 1 do
      begin
        if Conexoes.ListaConexoes[X].Receive then
        begin
          if X <> I then
          begin
             replicateBackupFull(I, X);
          end;
        end;
      end;
    end;
  end;
  MsgLog := '===== BACKUP FULL FINALIZADO =====';
end;

procedure TControllerReplicacao.BackupTable(ApplicationName, Table: String;
  IdBancoOrigem: Integer);
var
  I: Integer;
  X: Integer;
begin
  MsgLog := 'AGUARDE... INICIANDO O BACKUP TABLE';
  MsgLog := 'ATENÇÃO... ESSE PROCESSO PODE DEMORAR MINUTOS OU HORAS DEPENDENDO DA QUANTIDADE DE REGISTROS';
  verifyRegisteredBanks;
  createReplicationList;
  for I := 0 to Pred(Conexoes.ListaConexoes.Count) do
  begin
    if Conexoes.ListaConexoes[I].ID = IdBancoOrigem then
    begin
      for X := 1 to Conexoes.ListaConexoes.Count - 1 do
      begin
        if Conexoes.ListaConexoes[X].Receive then
        begin
          if X <> I then
          begin
             replicateBackupTable(Table, I, X);
          end;
        end;
      end;
    end;
  end;
  MsgLog := '===== BACKUP TABLE FINALIZADO =====';
end;

procedure TControllerReplicacao.ReplicateInsertUpdateTable(Tabela: String; ConexaoReplicador, ConexaoProvider, ConexaoDestino: IModelConexao; Limit: Integer; MsgLog: TEvLog);
var
  aSQL: string;
  aWhereDelete: string;
  Fields: string;
  aWhere: string;
  aDelete: string;
  SQL : String;
begin
  aSQL := 'SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM replicacao WHERE tabela = ' + QuotedStr(Tabela) + ') ';
  ConexaoReplicador.Query(2).OpenSQL(aSQL);
  if ConexaoReplicador.Query(2).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
  begin
    //Replicando Insert e Update
    SQL := '';
    SQL := SQL + ' SELECT ';
    SQL := SQL + ' LIST(REGISTROS) AS REGISTROS, ';
    SQL := SQL + ' LIST(GUUID) AS GUUID, ';
    SQL := SQL + ' TABELA, ';
    SQL := SQL + ' COUNT(*) AS TOTAL ';
    SQL := SQL + ' FROM ( ';
    SQL := SQL + ' SELECT ';
    SQL := SQL + ' FIRST ' + IntToStr(Limit) + ' REGISTROS, ';
    SQL := SQL + ' TABELA, ';
    SQL := SQL + ' GUUID ';
    SQL := SQL + ' FROM ';
    SQL := SQL + ' REPLICACAO ';
    SQL := SQL + ' WHERE ';
    SQL := SQL + ' ACAO IN (''I'', ''U'') AND ';
    SQL := SQL + ' TABELA = ' + QuotedStr(Tabela) + ' AND ';
    SQL := SQL + ' IDRECEIVER = ' + IntToStr(ConexaoDestino.ID) + ' AND ';
    SQL := SQL + ' IDBANCO = ' + IntToStr(ConexaoProvider.ID);
    SQL := SQL + ' ) ';
    SQL := SQL + ' GROUP BY ';
    SQL := SQL + ' TABELA ';
    ConexaoReplicador.Query(1).OpenSQL(SQL);
    while not ConexaoReplicador.Query(1).DataSet.Eof do
    begin
      if ConexaoProvider.ConnectionStatus and ConexaoDestino.ConnectionStatus then
      begin
        aWhereDelete := ' GUUID IN (''' + stringReplace(ConexaoReplicador.Query(1).DataSet.FieldByName('GUUID').AsString, ',', ''', ''', [rfReplaceAll, rfIgnoreCase]) + ''')';
        MsgLog('REPLICANDO ' + ConexaoProvider.Descrition + ' -> ' + ConexaoDestino.Descrition + ' | ' + ConexaoReplicador.Query(1).DataSet.FieldByName('TOTAL').AsString + ' REGISTRO(S) DA TABELA: ' + ConexaoReplicador.Query(1).DataSet.FieldByName('TABELA').AsString);
        findFieldsTable(ConexaoProvider, ConexaoReplicador.Query(1).DataSet.FieldByName('TABELA').AsString, Fields);
        aWhere := ' WHERE (' + stringReplace(ConexaoReplicador.Query(1).DataSet.FieldByName('REGISTROS').AsString, ',', ') OR (', [rfReplaceAll, rfIgnoreCase]) + ')';

        TControllerETL.New
          .NewETL(ConexaoProvider, ConexaoDestino)
          .InjectBankId(FInjectBankId)
          .Log(FLog)
          .ExecutaETL(Fields, ConexaoReplicador.Query(1).DataSet.FieldByName('TABELA').AsString, aWhere, '', '');

        aDelete := 'DELETE FROM REPLICACAO WHERE ACAO IN (''I'', ''U'') AND ' + ' TABELA = ' + QuotedStr(Tabela) + ' AND IDRECEIVER = ' + IntToStr(ConexaoDestino.ID) + ' AND IDBANCO = ' + IntToStr(ConexaoProvider.ID) + ' AND ' + aWhereDelete;
        ConexaoReplicador.Query(ConexaoReplicador.IdNewQuery).ExecuteSQL(aDelete);
      end;
      ConexaoReplicador.Query(1).DataSet.Next;
    end;
  end;
end;

procedure TControllerReplicacao.ChartValue(Value: TChartValue);
begin
  FChartValue := Value;
end;

procedure TControllerReplicacao.cleanReplication(Limit, I, X : Integer);
begin
  if Conexoes.ListaConexoes[X].ConnectionStatus then
    Conexoes.ListaConexoes[0].Query(1).ExecuteSQL('DELETE FROM REPLICACAO WHERE IDBANCO = ' + IntToStr(Conexoes.ListaConexoes[I].ID) + ' AND IDRECEIVER = ' +  IntToStr(Conexoes.ListaConexoes[X].ID));
end;

procedure TControllerReplicacao.ClearCacheReplicate(Provider, Destino: Integer);
var
  Tabelas : TStringList;
  Z, Y: Integer;
  SQL: String;
  I: Integer;
begin
  Tabelas := TStringList.Create;
  try
    Tabelas.CommaText := Conexoes.ListaConexoes[Destino].TableReceive;
    if Tabelas.CommaText = '' then Tabelas := Conexoes.ListaConexoes[Destino].GetTables('I');
    for Z := 0 to Pred(Tabelas.Count) do
      Tabelas[Z] := QuotedStr(Tabelas[Z]);

    for Y := 0 to Pred(Tabelas.Count) do
      Tabelas[Y] := QuotedStr(Tabelas[Y]);


    if Tabelas.CommaText = '' then
      raise Exception.Create('Não foram configuradas tabelas para replicação');

    SQL := '';
    SQL := SQL + 'DELETE FROM ';
    SQL := SQL + 'REPLICACAO ';
    SQL := SQL + 'WHERE ';
    SQL := SQL + 'IDRECEIVER = '+ IntToStr(Conexoes.ListaConexoes[Destino].ID)+' AND ';
    SQL := SQL + 'IDBANCO = '+ IntToStr(Conexoes.ListaConexoes[Provider].ID)+' AND ';
    SQL := SQL + 'TABELA NOT IN ('+Tabelas.CommaText+'); ';
    Conexoes.ListaConexoes[0].Query(1).ExecuteSQL(SQL);
  finally
    Tabelas.Free;
  end;
end;

procedure TControllerReplicacao.ClearReplicateBank;
begin
  Conexoes.ListaConexoes[0].Query(1).ExecuteSQL('DELETE FROM REPLICACAO');
  MsgLog := 'CACHE DE REGISTROS DO REPLICADOR LIMPO COM SUCESSO';
end;

constructor TControllerReplicacao.Create(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib: String);
begin
  FCritical := TCriticalSection.Create;
  FHost := Host;
  FPath := Path;
  FTypeDB := TypeDB;
  FUser := User;
  FPassword := Password;
  FRoleName := RoleName;
  FServer := Server;
  FPort := Port;
  FDBVersion := DBVersion;
  FVendorLib := VendorLib;
  Conexoes := TControllerFactory.New.Conexao;
  ControllerETL := TControllerFactory.New.NewControllerETL;
  Conexoes.AdicionaConexao(Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib, 0, 'Local', '', '', True, True);
end;

procedure TControllerReplicacao.createFieldsScheduleData(var Fields: String;
  MasterKeys: String);
var
  Keys: TStringList;
  AuxKey: string;
  Y: Integer;
begin
  Keys := TStringList.Create;
  try
    Keys.CommaText := MasterKeys;
    begin
      AuxKey := ', ';
      for Y := 0 to Keys.Count - 1 do
      begin
        Fields := Fields + ' LIST(' + Keys[Y] + ') AS ' + Keys[Y] + AuxKey;
      end;
    end;
  finally
    Keys.Free;
  end;

end;

procedure TControllerReplicacao.createReplicationList;
var
  Enviar: Boolean;
  Receber: Boolean;
begin
  with Conexoes.ListaConexoes[0].Query(1).DataSet do
  begin
    while not Eof do
    begin
      Enviar := false;
      Receber := false;
      if FieldByName('ENVIAR').AsInteger = 1 then Enviar := true;
      if FieldByName('RECEBER').AsInteger = 1 then Receber := true;
      try
         Conexoes.AdicionaConexao(FieldByName('PATH').AsString,
                                  'FB',
                                  FDBVersion,
                                  FieldByName('USUARIO').AsString,
                                  FieldByName('SENHA').AsString,
                                  FieldByName('ROLE').AsString,
                                  FieldByName('HOST').AsString,
                                  FieldByName('PORT').AsString,
                                  FVendorLib,
                                  FieldByName('ID').AsInteger,
                                  FieldByName('DESCRICAO').AsString,
                                  FieldByName('TABELASRECEBE').AsString,
                                  FieldByName('TABELASENVIA').AsString,
                                  Enviar,
                                  Receber);
      except
         MsgLog := '---- ATENÇÃO ---- BANCO ' + UpperCase(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('DESCRICAO').AsString) + ' ESTÁ FORA DA REDE';
      end;
      Next;
    end;
  end;

end;

destructor TControllerReplicacao.Destroy;
begin
  FreeAndNil(FCritical);
  inherited;
end;

function TControllerReplicacao.GetLog: TEvLog;
begin
  Result := FLog;
end;

function TControllerReplicacao.GetMsgLog: String;
begin
  Result := FMsgLog;
end;

function TControllerReplicacao.InjectBankId(Value: Boolean): IControllerReplicator;
begin
  Result := Self;
  FInjectBankId := Value;
end;

class function TControllerReplicacao.New(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib: String) : IControllerReplicator;
begin
  Result := TControllerReplicacao.Create(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib);
end;

procedure TControllerReplicacao.Replicate(Limit : Integer; MasterKey : String; Sequencer : Boolean = false);
begin
  try
    TControllerThreadSafe.New.Enter;
    try
      MsgLog := 'INICIANDO CICLO DE REPLICAÇÃO';
      verifyRegisteredBanks;
      createReplicationList;
      searchRecordsReplication(Limit, MasterKey);
      replicatingScheduleData(Limit, MasterKey, Sequencer);
      MsgLog := 'FINALIZADO CICLO DE REPLICAÇÃO';
      MsgLog := '------------------------------------------------------------------';
    except
      on E: Exception do
      begin
        if (Pos('aborted', E.Message) > 0) or (Pos('complete network request', E.Message) > 0) then
          MsgLog := 'ATENÇÃO: Ciclo Abortado pois foi perdida a conexão com o servidor'
        else
          MsgLog := 'ERROR: ' + E.Message;
        MsgLog := '------------------------------------------------------------------';
      end;
    end;
  finally
    TControllerThreadSafe.New.Release;
  end;
end;

procedure TControllerReplicacao.replicateBackupTable(Table : String; Origem, Destino: Integer);
var
  Y: Integer;
  aSQL: string;
  fields: string;
begin
  if Conexoes.ListaConexoes[Origem].ConnectionStatus AND Conexoes.ListaConexoes[Destino].ConnectionStatus then
  begin
    try
      Conexoes.ListaConexoes[Origem].Query(1).OpenSQL('SELECT COUNT(*) AS TOTAL FROM ' + Table);
      MsgLog := 'BACKUP TABLE ' + Conexoes.ListaConexoes[Origem].Descrition + ' -> ' + Conexoes.ListaConexoes[Destino].Descrition + ' | ' + Table + '(' + Conexoes.ListaConexoes[Origem].Query(1).DataSet.FieldByName('TOTAL').AsString + ' Registros)';
      findFieldsTable(Conexoes.ListaConexoes[Origem], Table, fields);
      aSQL := 'SELECT ' + fields + ' FROM ' + Table;
      ControllerETL
        .NewETL(Conexoes.ListaConexoes[Origem], Conexoes.ListaConexoes[Destino])
        .InjectBankId(FInjectBankId)
        .ExecutaETL(fields, Table, '', '', '');
    except
    on E: Exception do
      MsgLog := 'ERROR: ' + E.Message;
    end;
  end;
end;

procedure TControllerReplicacao.replicateBackupFull(Origem, Destino: Integer);
var
  Tabelas: TStringList;
  Y: Integer;
  aSQL: string;
  fields: String;
begin
    Tabelas := TStringList.Create;
    try
      Tabelas := Conexoes.ListaConexoes[Origem].GetTables('I');
      for Y := 0 to Tabelas.Count -1 do
      begin
        aSQL := '';
        if Conexoes.ListaConexoes[Origem].ConnectionStatus AND Conexoes.ListaConexoes[Destino].ConnectionStatus then
        begin
          try
            if UpperCase(Tabelas[Y]) <> 'REPLICACAO' then
            begin
              Conexoes.ListaConexoes[Origem].Query(1).OpenSQL('SELECT COUNT(*) AS TOTAL FROM ' + Tabelas[Y]);
              MsgLog := 'BACKUP FULL ' + Conexoes.ListaConexoes[Origem].Descrition + ' -> ' + Conexoes.ListaConexoes[Destino].Descrition + ' | ' + Tabelas[Y] + '(' + Conexoes.ListaConexoes[Origem].Query(1).DataSet.FieldByName('TOTAL').AsString + ' Registros)';
              findSQLTable(Origem, Tabelas[Y], aSQL);
              if aSQL.IsEmpty  then
              begin
                findFieldsTable(Conexoes.ListaConexoes[Origem], Tabelas[Y], fields);
                aSQL := 'SELECT ' + fields + ' FROM ' + Tabelas[Y];
              end;
              ControllerETL
                .NewETL(Conexoes.ListaConexoes[Origem], Conexoes.ListaConexoes[Destino])
                .InjectBankId(FInjectBankId)
                .ExecutaETL(fields, Tabelas[Y], '', '', '');
          end;
          except
          on E: Exception do
            MsgLog := 'ERROR: ' + E.Message;
          end;
        end;
      end;
    finally
      Tabelas.Free;
    end;
end;

procedure TControllerReplicacao.replicateDelete(Limit : Integer; Keys: string; MasterKeys: string; I: Integer; X: Integer; Where: string);
var
  SQL: string;
  Tabelas, TabelasReceive : TStringList;
  Y: Integer;
begin
  Tabelas := TStringList.Create;
  TabelasReceive := TStringList.Create;
  try
    //try
      Conexoes.ListaConexoes[0].Query(2).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM replicacao WHERE ACAO IN (''D''))');
      if Conexoes.ListaConexoes[0].Query(2).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
      begin
        Tabelas.CommaText := Conexoes.ListaConexoes[I].TableSend;
        if Tabelas.CommaText = '' then Tabelas := Conexoes.ListaConexoes[I].GetTables('D');
        for Y := 0 to Tabelas.Count -1 do
        begin
          SQL := ' SELECT LIST(REGISTROS) AS REGISTROS, TABELA, COUNT(*) AS TOTAL FROM REPLICACAO WHERE ACAO IN (''D'') AND ' +
             ' TABELA = ' + QuotedStr(Tabelas[Y]) + ' AND IDRECEIVER = ' + IntToStr(Conexoes.ListaConexoes[X].ID) + ' AND IDBANCO = ' + IntToStr(Conexoes.ListaConexoes[I].ID) + Where + ' GROUP BY TABELA ';
            Conexoes.ListaConexoes[0].Query(1).OpenSQL(SQL);
            while not Conexoes.ListaConexoes[0].Query(1).DataSet.Eof do
            begin
              if Conexoes.ListaConexoes[I].ConnectionStatus AND Conexoes.ListaConexoes[X].ConnectionStatus then
              begin
                TabelasReceive.CommaText := Conexoes.ListaConexoes[X].TableReceive;
                if TabelasReceive.CommaText = '' then TabelasReceive := Conexoes.ListaConexoes[I].GetTables('D');
                if TabelasReceive.IndexOf(Tabelas[Y]) >= 0 then
                begin
                  MsgLog := 'REPLICANDO ' + Conexoes.ListaConexoes[I].Descrition + ' -> ' + Conexoes.ListaConexoes[X].Descrition + ' | (DELETE) TABELA: ' + Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString;
                  SQL := 'DELETE FROM ' + Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString + ' WHERE (' + stringReplace(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('REGISTROS').AsString, ',', ') OR (', [rfReplaceAll, rfIgnoreCase]) + ')';
                  Conexoes.ListaConexoes[X].Query(1).ExecuteSQL(SQL);
                end;
              end;
              Conexoes.ListaConexoes[0].Query(1).DataSet.Next;
            end;

            Conexoes.ListaConexoes[0].Query(2).ExecuteSQL('DELETE FROM REPLICACAO WHERE ACAO IN (''D'') AND ' +
             ' TABELA = ' + QuotedStr(Tabelas[Y]) + ' AND IDRECEIVER = ' + IntToStr(Conexoes.ListaConexoes[X].ID) + ' AND IDBANCO = ' + IntToStr(Conexoes.ListaConexoes[I].ID) + Where);
        end;
      end;

//    except
//    on E: Exception do
//    begin
//      if Pos('complete network request', E.Message) > 0 then
//      begin
//        MsgLog := 'ATENÇÃO: Conexão com o Servidor Perdida';
//        abort;
//      end
//      else
//      begin
//        MsgLog := 'ERROR: ' + E.Message;
//        abort;
//      end;
//    end;

  //end;
  finally
    Tabelas.Free;
    TabelasReceive.Free;
  end;
end;

procedure TControllerReplicacao.replicateInsertUpdate(Limit : Integer; Keys: string; MasterKeys: string; I: Integer; X: Integer; var Where: string; var SQL: string);
var
  Lista: TStringList;
  Z: Integer;
  Tabelas: TStringList;
  Registros : TStringList;
  Y: Integer;
  N: Integer;
  Tabela: string;
begin
  //try
    TReplicadorModelScripts.New(Conexoes.ListaConexoes[0], Conexoes.ListaConexoes[X]).Log(FLog).Executar;
    Conexoes.ListaConexoes[0].Query(2).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM replicacao WHERE ACAO IN (''I'', ''U''))');
    if Conexoes.ListaConexoes[0].Query(2).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
    begin
      Where := '';
      Tabelas := TStringList.Create;
      Registros := TStringList.Create;
      try
        Tabelas.CommaText := Conexoes.ListaConexoes[X].TableReceive;
        if Tabelas.CommaText = '' then Tabelas := Conexoes.ListaConexoes[X].GetTables('I');
        for Y := 0 to Pred(Tabelas.Count) do
        begin
          ReplicateInsertUpdateTable(Tabelas[Y],Conexoes.ListaConexoes[0], Conexoes.ListaConexoes[I], Conexoes.ListaConexoes[X], Limit, FLog);
        end;
      finally
        Tabelas.Free;
        Registros.Free;
      end;
    end;
end;

procedure TControllerReplicacao.replicateInsertUpdateSequencer(Limit: Integer;
  Keys, MasterKeys: string; I, X: Integer; var Where, SQL: string);
var
  Lista: TStringList;
  Z: Integer;
  Fields: string;
  aWhere: string;
  Tabelas: TStringList;
  Y: Integer;
  aSQL: string;
begin
  try
    Conexoes.ListaConexoes[0].Query(2).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM replicacao WHERE ACAO IN (''I'', ''U'', ''D''))');
    if Conexoes.ListaConexoes[0].Query(2).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
    begin
      Tabelas := TStringList.Create;
      try
        Tabelas.CommaText := Conexoes.ListaConexoes[X].TableReceive;
        if Tabelas.CommaText = '' then Tabelas := Conexoes.ListaConexoes[I].GetTables('I');
        //Replicando Insert e Update
        SQL := ' SELECT REGISTROS, GUUID, ACAO, TABELA FROM REPLICACAO WHERE ' +
               ' IDRECEIVER = ' + IntToStr(Conexoes.ListaConexoes[X].ID) + ' AND IDBANCO = ' + IntToStr(Conexoes.ListaConexoes[I].ID);

        Conexoes.ListaConexoes[0].Query(1).OpenSQL(SQL);
        while not Conexoes.ListaConexoes[0].Query(1).DataSet.Eof do
        begin
          if Conexoes.ListaConexoes[I].ConnectionStatus AND Conexoes.ListaConexoes[X].ConnectionStatus then
          begin
            if (Tabelas.IndexOf(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString) > 0) or (Tabelas[0] = Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString)  then
            begin
              findFieldsTable(Conexoes.ListaConexoes[I], Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString, Fields);
              aWhere :=  ' WHERE ' + Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('REGISTROS').AsString;
              if Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('ACAO').AsString <> 'D' then
              begin
                MsgLog := 'REPLICANDO ' + Conexoes.ListaConexoes[I].Descrition + ' -> ' + Conexoes.ListaConexoes[X].Descrition + ' |  REGISTRO(S) DA TABELA: ' + Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString;
                ControllerETL.NewETL(Conexoes.ListaConexoes[I], Conexoes.ListaConexoes[X]).ExecutaETL(Fields, Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString, aWhere, '', '');
              end
              else
                Conexoes.ListaConexoes[X].Query(1).ExecuteSQL('DELETE FROM ' + Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('TABELA').AsString + aWhere);

             end;
            Conexoes.ListaConexoes[0].Query(2).ExecuteSQL('DELETE FROM REPLICACAO WHERE GUUID = ' + QuotedStr(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('GUUID').AsString));
          end;
          Conexoes.ListaConexoes[0].Query(1).DataSet.Next;
        end;
      finally
        Tabelas.Free;
      end;
    end;
  except
    on E: Exception do
      MsgLog := 'ERROR: ' + E.Message;
  end;

end;

procedure TControllerReplicacao.findFieldsTable(Banco: IModelConexao; Tabela: String;
  var Fields: String);
var
  SQL: string;
  Ini : TIniFile;
  Campos: string;
  I: Integer;
  Lista : TStringList;
begin
  Fields := '*';
  if FileExists(ExtractFilePath(ParamStr(0)) + 'FIELDS.ini') then
  begin
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'FIELDS.ini');
    try
      Fields := Ini.ReadString(Banco.Descrition, Tabela, '*');
    finally
      Ini.Free;
    end;
  end;

  if Fields = '*' then
  begin
      SQL := SQL + 'SELECT ';
      SQL := SQL + 'lIST(trim(FF.RDB$FIELD_NAME)) as FIELDS ';
      SQL := SQL + 'FROM ';
      SQL := SQL + 'RDB$FIELDS F ';
      SQL := SQL + 'INNER JOIN RDB$RELATION_FIELDS FF ON FF.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME ';
      SQL := SQL + 'INNER JOIN RDB$RELATIONS T ON T.RDB$RELATION_NAME = FF.RDB$RELATION_NAME ';
      SQL := SQL + 'WHERE ';
      if FInjectBankId then
        SQL := SQL + 'FF.RDB$FIELD_NAME <> ' + QuotedStr('RPL_IDFILIAL') + ' AND ';
      SQL := SQL + 'FF.RDB$FIELD_NAME <> ' + QuotedStr('UPDATE') + ' AND ';
      SQL := SQL + 'FF.RDB$RELATION_NAME = ' + QuotedStr(Tabela) + ' AND ';
      SQL := SQL + '((T.RDB$SYSTEM_FLAG IS NULL)OR ';
      SQL := SQL + '(T.RDB$SYSTEM_FLAG <> 1))AND ';
      SQL := SQL + '(T.RDB$VIEW_BLR IS NULL) AND ';
      SQL := SQL + '(F.RDB$COMPUTED_SOURCE IS NULL) ';
    Banco.Query(2).OpenSQL(SQL);
    Fields := Banco.Query(2).DataSet.FieldByName('FIELDS').AsString;
  end;
end;

procedure TControllerReplicacao.findSQLTable(Banco: Integer; Tabela: String;
  var aSQL: String);
var
  SQL: string;
  Ini : TIniFile;
  Campos: string;
  I: Integer;
  teste: string;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'SQLTABLE.ini') then
  begin
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'SQLTABLE.ini');
    try
      aSQL := Ini.ReadString(Conexoes.ListaConexoes[Banco].Descrition, Tabela, '');
    finally
      Ini.Free;
    end;
  end;

  if not aSQL.IsEmpty then
    StringReplace(aSQL, '^', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TControllerReplicacao.formatedTablesWhere(var aSQL: String; Tables : String);
var
  Tabelas: TStringList;
  Separador: string;
  I: Integer;
begin
  Tabelas := TStringList.Create;
  try
    Tabelas.CommaText := Tables;
    Separador := '';
    if Tabelas.Count <= 0 then
      exit;
    for I := 0 to Tabelas.Count - 1 do
    begin
      aSQL := aSQL + Separador + QuotedStr(Tabelas[I]);
      if (I <> Tabelas.Count - 1) then
        Separador := ',';
    end;
    aSQL := ' AND TABELA IN (' + aSQL + ') ';
  finally
    Tabelas.Free;
  end;
end;

procedure TControllerReplicacao.replicatingScheduleData (Limit : Integer; MasterKeys : String; Sequencer : Boolean);
var
  I: Integer;
  X: Integer;
  SQL, Where, Keys: string;
  Tempo: integer;
  dt: Tdatetime;
  Z: Integer;
begin
  //try
    try
      createFieldsScheduleData(Keys, MasterKeys);
      for I := 1 to Conexoes.ListaConexoes.Count - 1 do
      begin
        if Conexoes.ListaConexoes[I].ConnectionStatus then
        begin
          if Conexoes.ListaConexoes[0].ConnectionStatus  then
          begin
            if Conexoes.ListaConexoes[I].Send then
            begin
              for X := 1 to Conexoes.ListaConexoes.Count - 1 do
              begin
                if Conexoes.ListaConexoes[X].Receive then
                begin
                  if X <> I then
                  begin
                    if Sequencer then
                     replicateInsertUpdateSequencer(Limit, Keys, MasterKeys, I, X, Where, SQL)
                    else
                     replicateInsertUpdate(Limit, Keys, MasterKeys, I, X, Where, SQL);
                     replicateDelete(Limit, Keys, MasterKeys, I, X, Where);
                     ClearCacheReplicate(I, X);
                  end;
                end;
              end;
            end;
          end
          else
            MsgLog := '-- ATENÇÃO -- BANCO REPLICADOR ESTÁ FORA DA REDE';
        end;
      end;
    finally
      if Conexoes.ListaConexoes[0].ConnectionStatus then
      begin
        Conexoes.ListaConexoes[0].Query(1).ExecuteSQL('delete from replicacao where idreceiver not in (SELECT ID FROM bancos WHERE RECEBER = 1)');
        Conexoes.ListaConexoes[0].Query(2).ExecuteSQL('delete from replicacao where idreceiver = 0');
      end;
    end;
//  except
//    on E: Exception do
//    begin
//      if (Pos('complete network request', E.Message) > 0) or (Pos('aborted', E.Message) > 0) then
//      begin
//        MsgLog := 'ATENÇÃO: Conexão com o Servidor Perdida';
//        abort;
//      end
//      else
//      begin
//        MsgLog := 'ERROR: ' + E.Message;
//        abort;
//      end;
//    end;
//  end;
end;

procedure TControllerReplicacao.searchPrimaryKeys;
var
  I: Integer;
  SQL: string;
  Conexao2 : IControllerConexao;
begin
  Conexoes.ListaConexoes[0].Query(1).DataSet.First;
  for I := 1 to Conexoes.ListaConexoes[0].Query(1).DataSet.RecordCount -1 do
  begin
    SQL := 'select                                                                           ' +
           '     s.rdb$field_name AS PK,                                                     ' +
           '     i.rdb$relation_name as TABELA                                               ' +
           ' from                                                                            ' +
           '     rdb$indices i                                                               ' +
           ' left join rdb$index_segments s on i.rdb$index_name = s.rdb$index_name           ' +
           ' left join rdb$relation_constraints rc on rc.rdb$index_name = i.rdb$index_name   ' +
           ' where                                                                           ' +
           '     rc.rdb$constraint_type = ''PRIMARY KEY''                                    ';
    Conexoes.ListaConexoes[I].Query(1).OpenSQL(SQL);
    while not Conexoes.ListaConexoes[I].Query(1).DataSet.Eof do
    begin
      SQL := 'UPDATE OR INSERT INTO TABELAS (PK, TABELA) VALUES (' + QuotedStr(Conexoes.ListaConexoes[I].Query(1).DataSet.FieldByName('PK').AsString) + ', ' +
                                                                     QuotedStr(Conexoes.ListaConexoes[I].Query(1).DataSet.FieldByName('TABELA').AsString) + ');';

      Conexoes.ListaConexoes[0].Query(2).ExecuteSQL(SQL);
      Conexoes.ListaConexoes[I].Query(1).DataSet.Next;
    end;
    Conexoes.ListaConexoes[0].Query(1).DataSet.Next;
  end;
end;

procedure TControllerReplicacao.searchRecordsReplication(Limit : Integer; MasterKey : String);
var
  I: Integer;
  SQL: string;
  Where: string;
  ORDERBY: string;
  aWHERE: string;
  Tabelas, ListaGuuid: TStringList;
  OrderTable: TIniFile;
  Y: Integer;
  aAux: string;
  Fields: string;
  FieldsToSQL: string;
  Z: Integer;
begin
  //try
    SetChart('', 0, True);
    Conexoes.ListaConexoes[0].Query(2).OpenSQL('SELECT COUNT(*) AS TOTAL FROM REPLICACAO');
    MsgLog := 'REGISTROS EM CACHE NO REPLICADOR (' + Conexoes.ListaConexoes[0].Query(2).DataSet.FieldByName('TOTAL').AsString + ' Registros Pendentes)';

    SetChart('REPLICADOR', Conexoes.ListaConexoes[0].Query(2).DataSet.FieldByName('TOTAL').AsCurrency);

    ControllerETL := TControllerFactory.New.NewControllerETL;
    Conexoes.ListaConexoes[0].Query(1).DataSet.First;

    for I := 1 to Conexoes.ListaConexoes[0].Query(1).DataSet.RecordCount do
    begin
      if Conexoes.ListaConexoes[I].ConnectionStatus then
      begin
        if Conexoes.ListaConexoes[0].ConnectionStatus then
        begin
          if Conexoes.ListaConexoes[I].Send then
          begin

            Conexoes.ListaConexoes[I].Query(1).OpenSQL('SELECT COUNT(*) AS TOTAL FROM REPLICACAO');
            SetChart(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('DESCRICAO').AsString, Conexoes.ListaConexoes[I].Query(1).DataSet.FieldByName('TOTAL').AsCurrency);

            MsgLog := 'BUSCANDO REGISTROS NO BANCO: ' + UpperCase(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('DESCRICAO').AsString) + ' (' + Conexoes.ListaConexoes[I].Query(1).DataSet.FieldByName('TOTAL').AsString + ' Registros Pendentes)';

            Conexoes.ListaConexoes[I].Query(2).OpenSQL('SELECT 1 AS EXISTE FROM RDB$RELATIONS WHERE RDB$FLAGS=1 and RDB$RELATION_NAME='+QuotedStr('REPLICACAO'));
            if Conexoes.ListaConexoes[I].Query(2).DataSet.FieldByName('EXISTE').AsInteger = 0 then
              raise Exception.Create('NÃO EXISTE A ESTRUTURA DE REPLICAÇÃO NO BANCO: ' + Conexoes.ListaConexoes[I].Descrition);

            Conexoes.ListaConexoes[I].Query(2).OpenSQL('SELECT 1 AS EXISTE FROM rdb$database WHERE EXISTS(SELECT * FROM replicacao WHERE ACAO IN (''I'', ''U'', ''D''))');
            if Conexoes.ListaConexoes[I].Query(2).DataSet.FieldByName('EXISTE').AsInteger >= 1 then
            begin
              Tabelas := TStringList.Create;
              try
                Where := '';
                SQL := '';
                SQL := SQL + Where + ' ORDER BY DATAINCLUSAO';
                Fields := 'GUUID, TABELA, REGISTROS, ACAO, DATAINCLUSAO';
                Conexoes.ListaConexoes[I].Query(1).OpenSQL('SELECT list(GUUID) as GUUID FROM (SELECT FIRST ' + IntToStr(Limit) + ' GUUID FROM REPLICACAO ' + Where + ' ORDER BY DATAINCLUSAO)' );
                ListaGuuid:= TStringList.Create;
                try
                  ListaGuuid.CommaText := Conexoes.ListaConexoes[I].Query(1).DataSet.FieldByName('GUUID').AsString;
                  for Z := 0 to Pred(ListaGuuid.Count) do
                  begin
                     ListaGuuid[Z] := QuotedStr(ListaGuuid[Z]);
                  end;
                finally
                  Where := ' WHERE GUUID IN (' + ListaGuuid.CommaText + ')';
                  ListaGuuid.Free;
                end;
                ControllerETL.NewETL(Conexoes.ListaConexoes[I], Conexoes.ListaConexoes[0]).ExecutaETL('REPLICACAO', Fields,  Where, Limit, Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('ID').AsInteger, 0);
                Conexoes.ListaConexoes[I].Query(2).ExecuteSQL('DELETE FROM REPLICACAO ' + Where);
              finally
                Tabelas.Free;
              end;
            end;
          end;
        end
        else
          MsgLog := '-- ATENÇÃO -- BANCO REPLICADOR ESTÁ FORA DA REDE';
      end
      else
          MsgLog := '-- ATENÇÃO -- BANCO ' + UpperCase(Conexoes.ListaConexoes[0].Query(1).DataSet.FieldByName('DESCRICAO').AsString) + ' ESTÁ FORA DA REDE';

      Conexoes.ListaConexoes[0].Query(1).DataSet.Next;
    end;
//  except
//    on E: Exception do
//    begin
//      if Pos('complete network request', E.Message) > 0 then
//      begin
//        MsgLog := 'ATENÇÃO: Conexão com o Servidor Perdida';
//        abort;
//      end
//      else
//      begin
//        MsgLog := 'ERROR: ' + E.Message;
//        abort;
//      end;
//
//    end;
//  end;
end;


procedure TControllerReplicacao.SetChart(Title: String; Value : Currency; Clear : Boolean = false);
begin
  if Assigned(FChartValue) then
    FChartValue(Title, Value, Clear);
end;

procedure TControllerReplicacao.SetConexaoLocal(const Value
  : IControllerConexao);
begin
  FConexaoLocal := Value;
end;

procedure TControllerReplicacao.SetControllerETL(const Value: IControllerETL);
begin
  FControllerETL := Value;
end;

procedure TControllerReplicacao.SetLog(const Value: TEvLog);
begin
  FLog := Value;
end;

procedure TControllerReplicacao.SetMsgLog(const Value: String);
begin
  if Assigned(FLog) then
    FLog(Value);
  FMsgLog := Value;
end;

procedure TControllerReplicacao.verifyRegisteredBanks;
begin
  Conexoes.ListaConexoes[0].Query(1).OpenSQL('SELECT * FROM BANCOS ORDER BY PRIORIDADE');

  if Conexoes.ListaConexoes[0].Query(1).DataSet.RecordCount < 2 then
    raise Exception.Create(ERR_MINBANK);

end;

end.
