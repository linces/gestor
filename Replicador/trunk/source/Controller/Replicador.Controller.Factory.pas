unit Replicador.Controller.Factory;

interface

uses
  Replicador.Controller.Interfaces,
  Replicador.Controller.Conexao,
  Replicador.Controller.ETL,
  Replicador.Controller.Replicacao,
  Replicador.Controller.Metadata;

Type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    function Conexao : IControllerConexao;
    function NewControllerETL : IControllerETL;
    function Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerReplicator;
    function Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerMetadata;
    class function New : IControllerFactory;
  end;

implementation

{ TControllerFactory }

function TControllerFactory.Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerMetadata;
begin
  Result := TControllerMetadata.New(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib);
end;

class function TControllerFactory.New: IControllerFactory;
begin
  Result := TControllerFactory.Create;
end;

function TControllerFactory.Conexao: IControllerConexao;
begin
  Result := TControllerConexao.New;
end;

function TControllerFactory.NewControllerETL: IControllerETL;
begin
  Result := TControllerETL.New;
end;

function TControllerFactory.Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerReplicator;
begin
  Result := TControllerReplicacao.New(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib);
end;

end.
