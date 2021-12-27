unit Replicador.Model.ETL;

interface

uses Replicador.Model.Interfaces, Replicador.Model.Tipificacoes,
    Replicador.Model.Conexao.Firedac, System.Classes,
  Replicador.Controller.Tipificacoes;

Type
  TModelETL = class(TInterfacedObject, IModelETL)
  private
    FConexaoProvider : IModelConexao;
    FConexaoDestino: IModelConexao;
    FInjectBankId : boolean;
    FLog : TEvLog;
    procedure fnc_listPK(var ListaFields: TStringList; Tabela: string; var ListaPK: TStringList);
    procedure SetLog(const Value: String);
  public
    constructor Create(ConexaoProvider, ConexaoDestino: IModelConexao);
    class function New(ConexaoProvider, ConexaoDestino: IModelConexao): IModelETL;
    destructor Destroy; override;
    procedure ExecutaETL(Tabela : String; Fields : String; Where : String; Limit : Integer; IDBanco : Integer; IDReceiver : Integer); overload;
    procedure ExecutaETL(aSQL, Tabela, Where, Group, OrderBy: String; delete : boolean = false; FieldsToSQL : string = ''); overload;
    function InjectBankId (Value : Boolean) : IModelETL;
    function Log(Value : TEvLog) : IModelETL;
    property MsgLog : String write SetLog;
  end;

implementation

uses
  System.SysUtils, System.IniFiles,
  System.Threading, FireDAC.Stan.Param,
  Replicador.Model.Log;

{ TModelETL }

constructor TModelETL.Create(ConexaoProvider, ConexaoDestino: IModelConexao);
begin
  FConexaoProvider  := ConexaoProvider;
  FConexaoDestino := ConexaoDestino;
  FInjectBankId := False;
end;

destructor TModelETL.Destroy;
begin

  inherited;
end;

procedure TModelETL.ExecutaETL(aSQL, Tabela, Where, Group, OrderBy: String; delete : boolean = false; FieldsToSQL : string = '');
var
  ListaFields, ListaPK : TStringList;
  I: Integer;
  X: Integer;
  ArraySize : Integer;
  idNewQuery : Integer;
  Params : TFDParams;
begin
  idNewQuery := FConexaoDestino.IdNewQuery;
  //FConexaoDestino.Conexao.AutoCommit := false;
  ListaFields := TStringList.Create;
  try
    FConexaoProvider.Query(2).OpenSQL('SELECT ' + FieldsToSQL + ' ' + aSQL + ' FROM ' + Tabela + ' ' + Where + ' ' + Group + ' ' + OrderBy);
    ArraySize := FConexaoProvider.Query(2).DataSet.RecordCount;
    ListaFields.CommaText := aSQL;
    fnc_listPK(ListaFields, Tabela, ListaPK);
    try
      FConexaoDestino.StartTransaction;
      if FInjectBankId then
        FConexaoDestino.Query(idNewQuery).SQL.Text := 'UPDATE OR INSERT INTO ' + Tabela + '(' + aSQL + ', RPL_IDFILIAL) VALUES (' + ListaFields.CommaText + ', ' + IntToStr(FConexaoProvider.ID) + ') matching (' + ListaPK.CommaText + ')'
      else
       FConexaoDestino.Query(idNewQuery).SQL.Text := 'UPDATE OR INSERT INTO ' + Tabela + '(' + aSQL + ') VALUES (' + ListaFields.CommaText + ') matching (' + ListaPK.CommaText + ')';

       TModelLog.GravarLog('===== Insercao de Registro =====');
       TModelLog.GravarLog(FConexaoDestino.Query(idNewQuery).SQL.Text);

      Params := FConexaoDestino.Query(idNewQuery).Params;
      Params.ArraySize := ArraySize;
      FConexaoProvider.Query(2).First;
      for I := 0 to Pred(ArraySize) do
      begin
        for X := 0 to Pred(FConexaoProvider.Query(2).DataSet.Fields.Count) do
        begin
          Params[X].Values[I] := FConexaoProvider.Query(2).FieldByName(Params[X].DisplayName).AsVariant;
          try
            TModelLog.GravarLog(Params[X].DisplayName + ' : ' + FConexaoProvider.Query(2).FieldByName(Params[X].DisplayName).AsString);
          except
          end;
        end;
        FConexaoProvider.Query(2).Next;
      end;
       FConexaoDestino.Query(idNewQuery).Execute(ArraySize, 0);
       FConexaoDestino.Commit;
       TModelLog.GravarLog('===== Inserido com Sucesso =====');
       except on E : Exception do
    begin
      TModelLog.GravarLog('!!!!!!! Erro na Insercao !!!!!!!');
      TModelLog.GravarLog(E.Message);
      TModelLog.GravarLog('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      FConexaoDestino.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
  finally
    ListaFields.Free;
    ListaPK.Free;
  end;
end;

class function TModelETL.New(ConexaoProvider, ConexaoDestino: IModelConexao): IModelETL;
begin
  Result := TModelETL.Create(ConexaoProvider, ConexaoDestino);
end;

procedure TModelETL.SetLog(const Value: String);
begin
  if Assigned(FLog) then
    FLog(Value);
end;

procedure TModelETL.fnc_listPK(var ListaFields: TStringList; Tabela: string; var ListaPK: TStringList);
var
  I: Integer;
begin
  ListaPK := FConexaoDestino.GetPrimaryKeys(Tabela);
  for I := 0 to Pred(ListaFields.Count) do
  begin
    ListaFields[I] := ':' + ListaFields[I];
  end;
end;

function TModelETL.InjectBankId(Value: Boolean): IModelETL;
begin
  Result := Self;
  FInjectBankId := Value;
end;

function TModelETL.Log(Value: TEvLog): IModelETL;
begin
  Result := Self;
  FLog := Value;
end;

procedure TModelETL.ExecutaETL(Tabela, Fields: String; Where : String; Limit, IDBanco, IDReceiver: Integer);
var
  ListaFields: TStringList;
  I: Integer;
  X: Integer;
  ArraySize : Integer;
  ateste: string;
begin
  try
    //FConexaoDestino.Conexao.AutoCommit := false;
    FConexaoProvider.Query(1).OpenSQL('SELECT ' + Fields + ' FROM ' + Tabela + ' ' + Where );
    ArraySize := FConexaoProvider.Query(1).DataSet.RecordCount;
    ListaFields := TStringList.Create;
    ListaFields.CommaText :=  Fields;
    for I := 0 to Pred(ListaFields.Count) do
    begin
      ListaFields[I] := ':' + ListaFields[I];
    end;
    try
      FConexaoDestino.StartTransaction;
      for I := 0 to Pred(ArraySize) do
      begin
        FConexaoDestino.Query(2).SQL.Clear;
        FConexaoDestino.Query(2).SQL.Text := 'INSERT INTO ' + Tabela + '(IDBANCO, IDRECEIVER, ' + Fields + ') VALUES (' + IntToStr(IDBanco) + ', ' + IntToStr(IDReceiver) + ', ' + ListaFields.CommaText + ')';
        for X := 0 to Pred(FConexaoDestino.Query(2).Params.Count) do
        begin
            FConexaoDestino.Query(2).Params[X].Value := FConexaoProvider.Query(1).DataSet.FieldByName(FConexaoDestino.Query(2).Params[X].DisplayName).Value;
        end;
         FConexaoDestino.Query(2).ExecSQL;
        FConexaoProvider.Query(1).DataSet.Next;
      end;
      FConexaoDestino.Commit;
    except on E : Exception do
    begin
      FConexaoDestino.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
  Except on E : Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
