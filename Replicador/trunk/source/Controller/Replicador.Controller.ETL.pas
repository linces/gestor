unit Replicador.Controller.ETL;

interface

uses Replicador.Controller.Interfaces, Replicador.Model.Factory,
  Replicador.Model.Interfaces, Replicador.Model.Tipificacoes, Data.DB;

Type
  TControllerETL = class(TInterfacedObject, IControllerETL)
    private
      FModelETL : IModelETL;
    public
      class function New : IControllerETL;
      function NewETL(ConexaoProvider, ConexaoDest : IModelConexao) : IModelETL;
  end;

implementation

{ TControllerETL }

class function TControllerETL.New : IControllerETL;
begin
  Result := TControllerETL.Create;//(ConexaoProvider, ConexaoDest, SQLProvider, TabelaDestino);
end;

function TControllerETL.NewETL(ConexaoProvider, ConexaoDest: IModelConexao): IModelETL;
begin
  FModelETL := TModelFactory.New.NewETL(ConexaoProvider, ConexaoDest);
  Result := FModelETL;
end;

end.
