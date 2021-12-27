unit Replicador.Controller.Conexao;

interface

uses Replicador.Controller.Interfaces, Replicador.Model.Interfaces,
  System.Generics.Collections, Replicador.Model.Tipificacoes,
  Replicador.Model.Factory;

Type
  TControllerConexao = class(TInterfacedObject, IControllerConexao)
  private
    FModelFactory : IModelFactory;
    FListaConexoes: TList<IModelConexao>;
    procedure SetListaConexoes(const Value: TList<IModelConexao>);
    function getListaConexoes: TList<IModelConexao>;
  public
    constructor Create;
    class function New: IControllerConexao;
    destructor Destroy; override;
    procedure AdicionaConexao(TipsConexao: TTipsConexao); overload;
    procedure AdicionaConexao(DataBase, DriverID, DBVersion, UserName, Password, RoleName, Server, Port, VendorLib : String; ID : Integer; Descrition, TableReceive, TableSend : String; Send, Receive : Boolean); overload;
    property ListaConexoes: TList<IModelConexao> read getListaConexoes
      write SetListaConexoes;
  end;

implementation

uses
  System.SysUtils;

{ TControllerConexao }

procedure TControllerConexao.AdicionaConexao(TipsConexao: TTipsConexao);
begin
  FListaConexoes.Add(FModelFactory.NewConexao(TipsConexao));
end;

procedure TControllerConexao.AdicionaConexao(DataBase, DriverID, DBVersion, UserName,
  Password, RoleName, Server, Port, VendorLib: String; ID : Integer; Descrition, TableReceive, TableSend : String;
  Send, Receive : Boolean);
var
  TipsConexao : TTipsConexao;
begin
  try
    TipsConexao.Database := DataBase;
    TipsConexao.DriverID := DriverID;
    TipsConexao.DBVersion := DBVersion;
    TipsConexao.UserName := UserName;
    TipsConexao.Password := Password;
    TipsConexao.ID := ID;
    TipsConexao.Descrition := Descrition;
    TipsConexao.TableReceive := TableReceive;
    TipsConexao.TableSend := TableSend;
    TipsConexao.RoleName := RoleName;
    TipsConexao.Server := Server;
    TipsConexao.Port := Port;
    TipsConexao.Send := Send;
    TipsConexao.Receive := Receive;
    TipsConexao.VendorLib := VendorLib;
    FListaConexoes.Add(FModelFactory.NewConexao(TipsConexao));
  except
    raise Exception.Create('Não foi possível estabelecer a conexão');
  end;
end;

constructor TControllerConexao.Create;
begin
  FModelFactory := TModelFactory.New;
  FListaConexoes := TList<IModelConexao>.Create;
end;

destructor TControllerConexao.Destroy;
var
  I: Integer;
begin
  for I := 0 to Pred(FListaConexoes.Count) do
    FListaConexoes[I].Connected(False);

  FreeAndNil(FListaConexoes);
  inherited;
end;

function TControllerConexao.getListaConexoes: TList<IModelConexao>;
begin
  Result := FListaConexoes;
end;

class function TControllerConexao.New: IControllerConexao;
begin
  Result := TControllerConexao.Create;
end;

procedure TControllerConexao.SetListaConexoes(const Value: TList<IModelConexao>);
begin
  FListaConexoes := Value;
end;

end.
