unit uDMEstoque;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  TDMEstoque = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaComposicao(aProduto: Integer;
      aQuantidade, aQuantidade_Anterior: Extended; aMovimento, aTipo: String);
    procedure AtualizaEstoque(aProduto: Integer;
      aQuantidade, aQuantidade_Anterior: Extended; aMovimento, aTipo: String);
    procedure AtualizaGrade(aProduto: Integer; aGrade: Integer;
      aQuantidade: Extended; aMovimento: String; aPreco: Extended);
    procedure AddEstoqueCompra(aCompra: Integer; aFiscal: String);
    procedure AddEstoqueGRadeCompra(aCompra: Integer);
    procedure RemoveEstoqueCompra(aCompra: Integer; aFiscal: String);
    procedure RemoveEstoqueGRadeCompra(aCompra: Integer);
    procedure EstoqueGRadeDevCompra(aDevolucao: Integer);
    procedure EstoqueDevCompra(aCompra: Integer);
    procedure InsereProdutoFabricado(aProduto: Integer; aSituacao: String;
      aQtd_A: Extended; aQtd_F: Extended; aTransacao: String;
      aFabrica: Integer);
    procedure ApagaCompra_GRade(aCompra: Integer);
    procedure ApagaDevolucao_GRade(aDevolucao: Integer);
    procedure EstoqueGradeOS(aDevolucao: Integer; Operacao: String);
    procedure CancelaOS(aDevolucao: Integer);
    procedure AtualizaEstoqueFiscal(aTabela: String; aCodigo: Integer;
      aMovimento: String; aFiscal: String);
    procedure AtualizaEstoqueReal(aTabela: String; aCodigo: Integer;
      aMovimento: String; Fk_venda: Integer);

  end;

var
  DMEstoque: TDMEstoque;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados;

{$R *.dfm}
{ TEstoque }

procedure TDMEstoque.AtualizaEstoque(aProduto: Integer; aQuantidade: Extended;
  aQuantidade_Anterior: Extended; aMovimento: String; aTipo: String);
var
  QtdEstoque: Extended;
  qryConsulta: TFDQuery;
  qryExecute: TFDQuery;
begin

  try
    qryConsulta := TFDQuery.Create(self);
    qryConsulta.Connection := dados.Conexao;

    qryExecute := TFDQuery.Create(self);
    qryExecute.Connection := dados.Conexao;

    qryConsulta.Close;
    qryConsulta.SQL.Clear;
    qryConsulta.SQL.Add(' select * from produto');
    qryConsulta.SQL.Add(' where');
    qryConsulta.SQL.Add(' codigo=:id');
    qryConsulta.Params[0].Value := aProduto;
    qryConsulta.Open;

    if not qryConsulta.IsEmpty then
    begin

      QtdEstoque := aQuantidade - aQuantidade_Anterior;

      if QtdEstoque > 0 then
      begin

        if aMovimento = 'E' then // Movimento de entrada
        begin

          if aTipo = 'R' then
          begin // Estoque Real

            qryExecute.Close;
            qryExecute.SQL.Clear;
            qryExecute.SQL.Add(' update produto');
            qryExecute.SQL.Add(' set');
            qryExecute.SQL.Add(' QTD_ATUAL=QTD_ATUAL + :QTD_ATUAL');
            qryExecute.SQL.Add(' where');
            qryExecute.SQL.Add
              ('codigo=:id and ((servico is null) or (servico=''N''))');
            qryExecute.Params[0].Value := QtdEstoque;
            qryExecute.Params[1].Value := aProduto;
            qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;

          end;

          if aTipo = 'F' then
          begin // Estoque Fiscal

            qryExecute.Close;
            qryExecute.SQL.Clear;
            qryExecute.SQL.Add(' update produto');
            qryExecute.SQL.Add(' set');
            qryExecute.SQL.Add(' QTD_FISCAL=QTD_FISCAL + :QTD_FISCAL');
            qryExecute.SQL.Add(' where');
            qryExecute.SQL.Add
              (' codigo=:id and ((servico is null) or (servico=''N''))');
            qryExecute.Params[0].Value := QtdEstoque;
            qryExecute.Params[1].Value := aProduto;
            qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;

          end;
        end;

        if aMovimento = 'S' then // Movimento de Saída
        begin
          if aTipo = 'R' then
          begin // Estoque Real

            qryExecute.Close;
            qryExecute.SQL.Clear;
            qryExecute.SQL.Add(' update produto');
            qryExecute.SQL.Add(' set');
            qryExecute.SQL.Add(' QTD_ATUAL=QTD_ATUAL - :QTD_ATUAL');
            qryExecute.SQL.Add(' where');
            qryExecute.SQL.Add
              (' codigo=:id and ((servico is null) or (servico=''N''))');
            qryExecute.Params[0].Value := QtdEstoque;
            qryExecute.Params[1].Value := aProduto;
            qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;

          end;

          if aTipo = 'F' then
          begin // Estoque Fiscal

            qryExecute.Close;
            qryExecute.SQL.Clear;
            qryExecute.SQL.Add(' update produto');
            qryExecute.SQL.Add(' set');
            qryExecute.SQL.Add(' QTD_FISCAL=QTD_FISCAL - :QTD_FISCAL');
            qryExecute.SQL.Add(' where');
            qryExecute.SQL.Add
              (' codigo=:id and ((servico is null) or (servico=''N''))');
            qryExecute.Params[0].Value := QtdEstoque;
            qryExecute.Params[1].Value := aProduto;
            qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;
          end;
        end;
      end
      else
        raise Exception.Create('Saldo do estoque não pode ser negativo !');
    end;
  finally
    qryConsulta.Free;
    qryExecute.Free;
  end;
end;

procedure TDMEstoque.AtualizaGrade(aProduto: Integer; aGrade: Integer;
  aQuantidade: Extended; aMovimento: String; aPreco: Extended);
begin

  if aMovimento = 'E' then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'update produto_grade set qtd = qtd + :qtd1 where codigo=:cod';
    dados.qryExecute.Params[0].AsFloat := aQuantidade;
    dados.qryExecute.Params[1].Value := aGrade;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;
  end;

  if aMovimento = 'S' then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'update produto_grade set qtd = qtd - :qtd1 where codigo=:cod';
    dados.qryExecute.Params[0].AsFloat := aQuantidade;
    dados.qryExecute.Params[1].Value := aGrade;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;
  end;

  if aPreco > 0 then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'update produto_grade set PRECO = :PRECO where codigo=:cod';
    dados.qryExecute.Params[0].AsFloat := aPreco;
    dados.qryExecute.Params[1].Value := aGrade;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;

  end;

end;

procedure TDMEstoque.AtualizaComposicao(aProduto: Integer;
  aQuantidade: Extended; aQuantidade_Anterior: Extended; aMovimento: String;
  aTipo: String);

var
  ehComposicao: Boolean;
  qryPesquisa: TFDQuery;

begin
  try
    qryPesquisa := TFDQuery.Create(self);
    qryPesquisa.Connection := dados.Conexao;

    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Text :=
      'select COMPOSICAO from produto where codigo=:codigo';
    qryPesquisa.Params[0].Value := aProduto;
    qryPesquisa.Open;

    ehComposicao := qryPesquisa.FieldByName('COMPOSICAO').AsString = 'S';

    if ehComposicao then
    begin
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Text :=
        'select ID_PRODUTO , QUANTIDADE from PRODUTO_COMPOSICAO where fk_produto=:codigo';
      qryPesquisa.Params[0].Value := aProduto;
      qryPesquisa.Open;

      qryPesquisa.First;

      while not qryPesquisa.Eof do
      begin

        DMEstoque.AtualizaEstoque(qryPesquisa.FieldByName('ID_PRODUTO')
          .AsInteger, aQuantidade * qryPesquisa.FieldByName('QUANTIDADE')
          .AsFloat, aQuantidade_Anterior * qryPesquisa.FieldByName('QUANTIDADE')
          .AsFloat, aMovimento, aTipo);

        qryPesquisa.Next;
      end;

    end;
  finally
    qryPesquisa.Free;
  end;

end;

procedure TDMEstoque.AddEstoqueCompra(aCompra: Integer; aFiscal: String);

var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from COMPRA_ITENS where FK_COMPRA=:ID and QTD>0';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin

      if aFiscal = 'S' then
      begin

        if dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value = 'S' then
          DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
            qryEstoque.FieldByName('QTD').Value, 0, 'E', 'F');

        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, 'E', 'R');

      end
      else
      begin
        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, 'E', 'R');
      end;
      qryEstoque.Next;
    end;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.RemoveEstoqueCompra(aCompra: Integer; aFiscal: String);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from COMPRA_ITENS where FK_COMPRA=:ID and QTD>0';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin

      if aFiscal = 'S' then
      begin

        if dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value = 'S' then
          DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
            qryEstoque.FieldByName('QTD').Value, 0, 'S', 'F');

        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, 'S', 'R');

      end
      else
      begin
        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, 'S', 'R');
      end;
      qryEstoque.Next;
    end;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.AddEstoqueGRadeCompra(aCompra: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from COMPRA_GRADE where FK_COMPRA=:ID and QTD>0';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin
      DMEstoque.AtualizaGrade(qryEstoque.FieldByName('FK_PRODUTO').AsInteger,
        qryEstoque.FieldByName('FK_GRADE').AsInteger,
        qryEstoque.FieldByName('QTD').Value, 'E',
        qryEstoque.FieldByName('PRECO').Value);
      qryEstoque.Next;
    end;

  finally
    qryEstoque.Free;
  end;
end;

procedure TDMEstoque.ApagaCompra_GRade(aCompra: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      'delete from compra_grade where FK_COMPRA=:compra and qtd=0 ';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.ExecSQL;
    dados.Conexao.CommitRetaining;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.ApagaDevolucao_GRade(aDevolucao: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      'delete from devolucao_compra_grade where FK_DEVOLUCAO=:DEVOLUCAO and qtd_devolvida=0';
    qryEstoque.Params[0].Value := aDevolucao;
    qryEstoque.ExecSQL;
    dados.Conexao.CommitRetaining;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.EstoqueGRadeDevCompra(aDevolucao: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from DEVOLUCAO_COMPRA_GRADE where FK_DEVOLUCAO=:ID and QTD_DEVOLVIDA>0';
    qryEstoque.Params[0].Value := aDevolucao;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin
      DMEstoque.AtualizaGrade(qryEstoque.FieldByName('FK_PRODUTO').AsInteger,
        qryEstoque.FieldByName('FK_GRADE').AsInteger,
        qryEstoque.FieldByName('QTD_DEVOLVIDA').Value, 'S', 0);
      qryEstoque.Next;
    end;

  finally
    qryEstoque.Free;
  end;
end;

procedure TDMEstoque.EstoqueGradeOS(aDevolucao: Integer; Operacao: String);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select FK_PRODUTO, fk_grade, qtd from os_detalhe where FK_OS_MASTER=:ID and fk_grade>0';
    qryEstoque.Params[0].Value := aDevolucao;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin
      DMEstoque.AtualizaGrade(qryEstoque.FieldByName('FK_PRODUTO').AsInteger,
        qryEstoque.FieldByName('FK_GRADE').AsInteger,
        qryEstoque.FieldByName('QTD').Value, Operacao, 0);
      qryEstoque.Next;
    end;

  finally
    qryEstoque.Free;
  end;
end;

procedure TDMEstoque.CancelaOS(aDevolucao: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text := ' select * from OS_DETALHE where FK_OS_MASTER=:ID';
    qryEstoque.Params[0].Value := aDevolucao;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin

      DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('FK_PRODUTO').Value,
        qryEstoque.FieldByName('QTD').Value, 0, 'E', 'R');

      DMEstoque.AtualizaComposicao(qryEstoque.FieldByName('FK_PRODUTO').Value,
        qryEstoque.FieldByName('QTD').Value, 0, 'E', 'R');

      qryEstoque.Next;
    end;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.AtualizaEstoqueFiscal(aTabela: String; aCodigo: Integer;
  aMovimento: String; aFiscal: String);
var
  qryEstoque: TFDQuery;
begin
  if aFiscal = 'S' then
  begin

    try
      qryEstoque := TFDQuery.Create(self);
      qryEstoque.Connection := dados.Conexao;

      qryEstoque.Close;
      qryEstoque.SQL.Clear;
      if aTabela = 'NFCE' then
        qryEstoque.SQL.Text := ' select * from NFCE_DETALHE where FKVENDA=:ID';
      if aTabela = 'NFE' then
        qryEstoque.SQL.Text := ' select * from NFE_DETALHE where FKNFE=:ID';
      qryEstoque.Params[0].Value := aCodigo;
      qryEstoque.Open;

      qryEstoque.First;
      while not qryEstoque.Eof do
      begin
        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('ID_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, aMovimento, 'F');
        qryEstoque.Next;
      end;
    finally
      qryEstoque.Free;
    end;

  end;
end;

procedure TDMEstoque.AtualizaEstoqueReal(aTabela: String; aCodigo: Integer;
  aMovimento: String; Fk_venda: Integer);
var
  qryEstoque: TFDQuery;
begin
  if Fk_venda > 0 then
    exit;

  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    if aTabela = 'NFCE' then
      qryEstoque.SQL.Text := ' select * from NFCE_DETALHE where FKVENDA=:ID';
    if aTabela = 'NFE' then
      qryEstoque.SQL.Text := ' select * from NFE_DETALHE where FKNFE=:ID';
    qryEstoque.Params[0].Value := aCodigo;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin
      if qryEstoque.FieldByName('GERA_ES').Value = 'S' then
        DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('ID_PRODUTO').Value,
          qryEstoque.FieldByName('QTD').Value, 0, aMovimento, 'R');
      qryEstoque.Next;
    end;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.EstoqueDevCompra(aCompra: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from DEVOLUCAO_COMPRA_D where FK_DEVOLUCAO_COMPRA_M=:ID and QTD_DEVOLVIDA>0';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin

      DMEstoque.AtualizaEstoque(qryEstoque.FieldByName('ID_PRODUTO').Value,
        qryEstoque.FieldByName('QTD_DEVOLVIDA').Value, 0, 'S', 'R');

      DMEstoque.AtualizaComposicao(qryEstoque.FieldByName('ID_PRODUTO').Value,
        qryEstoque.FieldByName('QTD_DEVOLVIDA').Value, 0, 'E', 'R');

      qryEstoque.Next;
    end;
  finally
    qryEstoque.Free;
  end;

end;

procedure TDMEstoque.InsereProdutoFabricado(aProduto: Integer;
  aSituacao: String; aQtd_A: Extended; aQtd_F: Extended; aTransacao: String;
  aFabrica: Integer);
var
  qryInsere: TFDQuery;
begin
  try
    qryInsere := TFDQuery.Create(self);
    qryInsere.Connection := dados.Conexao;

    qryInsere.Close;
    qryInsere.SQL.Clear;
    qryInsere.SQL.Add
      ('INSERT INTO ACERTA_ESTOQUE (CODIGO, FKPRODUTO, DATA, E_S, QTD_F, QTD_A, TRANSACAO, FK_FABRICA)');
    qryInsere.SQL.Add('VALUES(');
    qryInsere.SQL.Add
      (':CODIGO, :FKPRODUTO, :DATA, :E_S, :QTD_F, :QTD_A, :TRANSACAO, :FK_FABRICA)');
    qryInsere.ParamByName('CODIGO').AsInteger :=
      dados.Numerador('ACERTA_ESTOQUE', 'CODIGO', 'N', '', '');
    qryInsere.ParamByName('FKPRODUTO').AsInteger := aProduto;
    qryInsere.ParamByName('E_S').Value := aSituacao;
    qryInsere.ParamByName('QTD_F').AsFloat := aQtd_F;
    qryInsere.ParamByName('QTD_A').AsFloat := aQtd_A;
    qryInsere.ParamByName('DATA').AsDate := DATE;
    qryInsere.ParamByName('TRANSACAO').AsString := aTransacao;
    qryInsere.ParamByName('FK_FABRICA').AsInteger := aFabrica;
    qryInsere.ExecSQL;
    dados.Conexao.CommitRetaining;
  finally
    qryInsere.Free;
  end;
end;

procedure TDMEstoque.RemoveEstoqueGRadeCompra(aCompra: Integer);
var
  qryEstoque: TFDQuery;
begin
  try
    qryEstoque := TFDQuery.Create(self);
    qryEstoque.Connection := dados.Conexao;

    qryEstoque.Close;
    qryEstoque.SQL.Clear;
    qryEstoque.SQL.Text :=
      ' select * from COMPRA_GRADE where FK_COMPRA=:ID and QTD>0';
    qryEstoque.Params[0].Value := aCompra;
    qryEstoque.Open;

    qryEstoque.First;
    while not qryEstoque.Eof do
    begin
      DMEstoque.AtualizaGrade(qryEstoque.FieldByName('FK_PRODUTO').AsInteger,
        qryEstoque.FieldByName('FK_GRADE').AsInteger,
        qryEstoque.FieldByName('QTD').Value, 'S', 0);
      qryEstoque.Next;
    end;

  finally
    qryEstoque.Free;
  end;
end;

end.
