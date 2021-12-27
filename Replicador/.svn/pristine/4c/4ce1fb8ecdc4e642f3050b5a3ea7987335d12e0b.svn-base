unit Replicador.Model.Factory;

interface

uses
  Replicador.Model.Interfaces,
  Replicador.Model.Tipificacoes,
  {$IFDEF ZEOS}
    Replicador.Model.Conexao.Zeos,
  {$ELSE}
    Replicador.Model.Conexao.Firedac,
  {$ENDIF}

  Replicador.Model.ETL;


Type
  TModelFactory = class(TInterfacedObject, IModelFactory)
  private
    FNewConexao : IModelConexao;
    function NewConexao(TipsConexao : TTipsConexao): IModelConexao;
    function NewETL(ConexaoProvider, ConexaoDestino : IModelConexao) : IModelETL;
  public
    class function New : IModelFactory;
  end;

implementation

{ TModelFactory }

function TModelFactory.NewConexao(TipsConexao : TTipsConexao): IModelConexao;
begin
  Result := TModelConexao.New(TipsConexao);
end;

function TModelFactory.NewETL(ConexaoProvider, ConexaoDestino : IModelConexao): IModelETL;
begin
  Result := TModelETL.New(ConexaoProvider, ConexaoDestino);
end;

class function TModelFactory.New: IModelFactory;
begin
  Result := TModelFactory.Create;
end;

end.
