unit uPedidoWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrutil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPedidoWeb = class(TForm)
    Panel2: TPanel;
    btnSalvar: TButton;
    DBGrid1: TDBGrid;
    btnAtualizar: TButton;
    dsOrc: TDataSource;
    qryBuscaCliente: TFDQuery;
    qryBuscaClienteEMPRESA: TSmallintField;
    qryBuscaClienteCODIGO: TIntegerField;
    qryBuscaClienteTIPO: TStringField;
    qryBuscaClienteCNPJ: TStringField;
    qryBuscaClienteIE: TStringField;
    qryBuscaClienteFANTASIA: TStringField;
    qryBuscaClienteRAZAO: TStringField;
    qryBuscaClienteENDERECO: TStringField;
    qryBuscaClienteNUMERO: TStringField;
    qryBuscaClienteCOMPLEMENTO: TStringField;
    qryBuscaClienteCODMUN: TIntegerField;
    qryBuscaClienteMUNICIPIO: TStringField;
    qryBuscaClienteBAIRRO: TStringField;
    qryBuscaClienteUF: TStringField;
    qryBuscaClienteCEP: TStringField;
    qryBuscaClienteFONE1: TStringField;
    qryBuscaClienteFONE2: TStringField;
    qryBuscaClienteCELULAR1: TStringField;
    qryBuscaClienteCELULAR2: TStringField;
    qryBuscaClienteEMAIL1: TStringField;
    qryBuscaClienteEMAIL2: TStringField;
    qryBuscaClienteFOTO: TBlobField;
    qryBuscaClienteSEXO: TStringField;
    qryBuscaClienteDT_NASC: TDateField;
    qryBuscaClienteECIVIL: TStringField;
    qryBuscaClienteLIMITE: TFMTBCDField;
    qryBuscaClienteDIA_PGTO: TSmallintField;
    qryBuscaClienteOBS: TMemoField;
    qryBuscaClienteNUM_USU: TSmallintField;
    qryBuscaClienteFATURA: TStringField;
    qryBuscaClienteCHEQUE: TStringField;
    qryBuscaClienteCCF: TStringField;
    qryBuscaClienteSPC: TStringField;
    qryBuscaClienteISENTO: TStringField;
    qryBuscaClienteFORN: TStringField;
    qryBuscaClienteFUN: TStringField;
    qryBuscaClienteCLI: TStringField;
    qryBuscaClienteFAB: TStringField;
    qryBuscaClienteTRAN: TStringField;
    qryBuscaClienteADM: TStringField;
    qryBuscaClienteATIVO: TStringField;
    qryBuscaClienteDT_ADMISSAO: TDateField;
    qryBuscaClienteDT_DEMISSAO: TDateField;
    qryBuscaClienteSALARIO: TFMTBCDField;
    qryBuscaClientePAI: TStringField;
    qryBuscaClienteMAE: TStringField;
    qryBuscaClienteBANCO: TStringField;
    qryBuscaClienteAGENCIA: TStringField;
    qryBuscaClienteGERENTE: TStringField;
    qryBuscaClienteFONE_GERENTE: TStringField;
    qryBuscaClientePROPRIEDADE: TStringField;
    qryBuscaClienteDT_CADASTRO: TDateField;
    qryBuscaClienteTECNICO: TStringField;
    qryBuscaClienteATENDENTE: TStringField;
    qryBuscaClienteCODIGO_WEB: TIntegerField;
    cdsPessoas: TFDQuery;
    cdsPessoascodigo: TFDAutoIncField;
    cdsPessoastipo: TStringField;
    cdsPessoascnpj: TStringField;
    cdsPessoasie: TStringField;
    cdsPessoasfantasia: TStringField;
    cdsPessoasrazao: TStringField;
    cdsPessoasendereco: TStringField;
    cdsPessoasnumero: TStringField;
    cdsPessoascomplemento: TStringField;
    cdsPessoascodmun: TIntegerField;
    cdsPessoasmunicipio: TStringField;
    cdsPessoasbairro: TStringField;
    cdsPessoasuf: TStringField;
    cdsPessoascep: TStringField;
    cdsPessoascelular1: TStringField;
    cdsPessoascelular2: TStringField;
    cdsPessoasisento: TStringField;
    cdsPessoascodigolocal: TIntegerField;
    qryOrcamento: TFDQuery;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure Download;
    function CalculaCNPJ(pessoa, cnpj: string): string;
    procedure BaixarPessoa;
    procedure BaixaOrcamento;
    procedure StatusOrcamento(gid: string);
    procedure UpdateGidPessoa(gid: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidoWeb: TFrmPedidoWeb;

implementation

{$R *.dfm}

uses uDadosWeb, Udados;

procedure TFrmPedidoWeb.btnSalvarClick(Sender: TObject);
begin
{  try
    btnSalvar.Enabled := false;
    try
      dadosweb.ConexaoApp.close;
      dadosweb.ConexaoApp.Open;
      if dadosweb.ConexaoApp.Connected then
      begin
        Download;
        btnAtualizarClick(self);
      end;

    except
      on e: Exception do
        raise Exception.Create
          ('Erro de conexão com o banco de dados do servidor ' + e.Message);
    end;
  finally
    btnSalvar.Enabled := true;
  end;}
end;

procedure TFrmPedidoWeb.btnAtualizarClick(Sender: TObject);
begin
{  try
    try
      btnAtualizar.Enabled := false;
      dadosweb.ConexaoApp.close;
      dadosweb.ConexaoApp.Open;
      if dadosweb.ConexaoApp.Connected then
      begin
        dadosweb.cdsOrcamento.close;
        dadosweb.cdsOrcamento.Open;
      end;

    except
      on e: Exception do
        raise Exception.Create
          ('Erro de conexão com o banco de dados do servidor ' + e.Message);
    end;
  finally
    btnAtualizar.Enabled := true;
  end;  }
end;

function TFrmPedidoWeb.CalculaCNPJ(pessoa, cnpj: string): string;
begin
  result := '';
  if length(TiraPontos(cnpj)) = 11 then
    result := copy(cnpj, 1, 3) + '.' + copy(cnpj, 4, 3) + '.' + copy(cnpj, 7, 3)
      + '-' + copy(cnpj, 10, 2)
  else
    result := copy(cnpj, 1, 2) + '.' + copy(cnpj, 3, 3) + '.' + copy(cnpj, 6, 3)
      + '/' + copy(cnpj, 9, 4) + '-' + copy(cnpj, 13, 2);
end;

procedure TFrmPedidoWeb.UpdateGidPessoa(gid: string);
begin
{  dadosweb.updWeb.close;
  dadosweb.updWeb.SQL.Text :=
    ' update pessoa set gid=:gid where codigo=:codigo';
  dadosweb.updWeb.Params[0].Value := gid;
  dadosweb.updWeb.Params[1].Value := cdsPessoascodigo.Value;
  dadosweb.updWeb.ExecSQL;
  dadosweb.ConexaoApp.CommitRetaining;  }
end;

procedure TFrmPedidoWeb.BaixarPessoa;
begin
  // sincronizar pessoas

  cdsPessoas.close;
  cdsPessoas.Open;

  if not cdsPessoas.IsEmpty then
  begin
    dados.qryPessoas.close;
    dados.qryPessoas.SQL.Text := 'select * from PESSOA ' + 'where ' +
      'empresa=:id ' + ' /*where*/';
    dados.qryPessoas.Params[0].Value := dados.qryEmpresaCODIGO.Value;
    dados.qryPessoas.Open;

    while not cdsPessoas.Eof do
    begin
      try
        dados.qryPessoas.Insert;
        dados.qryPessoasCODIGO_WEB.Value := cdsPessoascodigo.Value;;
        dados.qryPessoasEMPRESA.Value := 1;
        dados.qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
          'N', '', '');
        dados.qryPessoasTIPO.Value := cdsPessoastipo.Value;
        dados.qryPessoasCNPJ.Value := CalculaCNPJ(cdsPessoastipo.Value,
          cdsPessoascnpj.Value);
        dados.qryPessoasIE.Value := cdsPessoasie.Value;
        dados.qryPessoasRAZAO.Value := cdsPessoasrazao.Value;
        dados.qryPessoasFANTASIA.Value := cdsPessoasfantasia.Value;
        dados.qryPessoasENDERECO.Value := cdsPessoasendereco.Value;
        dados.qryPessoasNUMERO.Value := 'SN';
        dados.qryPessoasMUNICIPIO.Value := cdsPessoasmunicipio.Value;
        dados.qryPessoasBAIRRO.Value := cdsPessoasbairro.Value;
        dados.qryPessoasUF.Value := cdsPessoasuf.Value;
        dados.qryPessoasCODMUN.Value := cdsPessoascodmun.Value;
        dados.qryPessoasCEP.Value := cdsPessoascep.Value;
        dados.qryPessoasDT_CADASTRO.Value := date;
        dados.qryPessoasCELULAR1.Value := cdsPessoascelular1.Value;
        dados.qryPessoasDIA_PGTO.Value := 0;
        dados.qryPessoasLIMITE.AsFloat := 0;
        dados.qryPessoasSALARIO.Value := 0;
        dados.qryPessoasFATURA.Value := 'N';
        dados.qryPessoasCHEQUE.Value := 'N';
        dados.qryPessoasCCF.Value := 'N';
        dados.qryPessoasSPC.Value := 'N';
        dados.qryPessoasISENTO.Value := '2';
        dados.qryPessoasFORN.Value := 'N';
        dados.qryPessoasFUN.Value := 'N';
        dados.qryPessoasCLI.Value := 'S';
        dados.qryPessoasFAB.Value := 'N';
        dados.qryPessoasTRAN.Value := 'N';
        dados.qryPessoasADM.Value := 'N';
        dados.qryPessoasATIVO.Value := 'S';
        dados.qryPessoasATENDENTE.Value := 'N';
        dados.qryPessoasTECNICO.Value := 'N';
        dados.qryPessoasFAB.Value := 'N';
        dados.qryPessoas.Post;

        UpdateGidPessoa(cdsPessoastipo.Value);

        dados.Conexao.CommitRetaining;

      except

        dados.Conexao.RollbackRetaining;

      end;

      cdsPessoas.Next;
    end;
  end;
end;

procedure TFrmPedidoWeb.StatusOrcamento(gid: string);
begin
{  dadosweb.updWeb.close;
  dadosweb.updWeb.SQL.Text :=
    ' update orcamento set situacao=''B'' where gid=:gid';
  dadosweb.updWeb.Params[0].Value := gid;
  dadosweb.updWeb.ExecSQL;
  dadosweb.ConexaoApp.CommitRetaining;}
end;

procedure TFrmPedidoWeb.BaixaOrcamento;
var
  item: Integer;
begin

{  dadosweb.cdsOrcamento.close;
  dadosweb.cdsOrcamento.Open;

  dadosweb.cdsOrcamento.First;

  if not dadosweb.cdsOrcamento.IsEmpty then
  begin
    while not dadosweb.cdsOrcamento.Eof do
    begin
      qryOrcamento.close;
      qryOrcamento.Params[0].Value := dadosweb.cdsOrcamento.FieldByName
        ('gid').asstring;
      qryOrcamento.Open;

      if not qryOrcamento.IsEmpty then
        qryOrcamento.Edit
      else
        qryOrcamento.Insert;

      qryOrcamento.FieldByName('GID').Value := dadosweb.cdsOrcamento.FieldByName
        ('GID').Value;

      qryOrcamento.FieldByName('FKEMPRESA').Value := 1;
      qryOrcamento.FieldByName('CODIGO').Value :=
        dados.Numerador('ORCAMENTO', 'CODIGO', 'N', '', '');
      qryOrcamento.FieldByName('CNPJ').Value :=
        CalculaCNPJ(dadosweb.cdsOrcamento.FieldByName('TIPO').Value,
        dadosweb.cdsOrcamento.FieldByName('CNPJ').Value);

      qryBuscaCliente.Open;

      qryBuscaCliente.close;
      qryBuscaCliente.Params[0].Value :=
        CalculaCNPJ(dadosweb.cdsOrcamento.FieldByName('TIPO').Value,
        dadosweb.cdsOrcamento.FieldByName('CNPJ').Value);
      qryBuscaCliente.Open;

      qryOrcamento.FieldByName('CLIENTE').Value :=
        qryBuscaCliente.FieldByName('RAZAO').Value;
      qryOrcamento.FieldByName('FKVENDEDOR').Value :=
        dadosweb.cdsOrcamento.FieldByName('fk_vendedor').Value;
      qryOrcamento.FieldByName('ENDERECO').Value :=
        qryBuscaClienteENDERECO.Value;
      qryOrcamento.FieldByName('NUMERO').Value := qryBuscaClienteNUMERO.Value;
      qryOrcamento.FieldByName('CIDADE').Value :=
        qryBuscaClienteMUNICIPIO.Value;
      qryOrcamento.FieldByName('BAIRRO').Value := qryBuscaClienteBAIRRO.Value;
      qryOrcamento.FieldByName('UF').Value := qryBuscaClienteUF.Value;
      qryOrcamento.FieldByName('CEP').Value := qryBuscaClienteCEP.Value;
      qryOrcamento.FieldByName('FK_CLIENTE').Value :=
        qryBuscaCliente.FieldByName('CODIGO').Value;

      qryOrcamento.FieldByName('FORMA_PAGAMENTO').Value :=
        dadosweb.cdsOrcamento.FieldByName('forma_pagamento').Value;
      qryOrcamento.FieldByName('SITUACAO').Value := 'A';
      qryOrcamento.FieldByName('DATA').Value :=
        dadosweb.cdsOrcamento.FieldByName('DATA').Value;
      qryOrcamento.FieldByName('SUBTOTAL').Value :=
        dadosweb.cdsOrcamento.FieldByName('subtotal').Value;
      qryOrcamento.FieldByName('DESCONTO').Value :=
        dadosweb.cdsOrcamento.FieldByName('DESCONTO').Value;
      qryOrcamento.FieldByName('TOTAL').Value :=
        dadosweb.cdsOrcamento.FieldByName('TOTAL').Value;
      qryOrcamento.FieldByName('GID').Value := dadosweb.cdsOrcamento.FieldByName
        ('GID').Value;
      qryOrcamento.Post;

      StatusOrcamento(dadosweb.cdsOrcamento.FieldByName('GID').Value);

      dadosweb.ConexaoApp.CommitRetaining;

      dadosweb.cdsItens.close;
      dadosweb.cdsItens.Params[0].Value := dadosweb.cdsOrcamento.FieldByName
        ('codigo').Value;
      dadosweb.cdsItens.Open;

      dados.qryExecute.close;
      dados.qryExecute.SQL.Text :=
        ' delete from orcamento_item where fk_orcamento=:id';
      dados.qryExecute.Params[0].Value := dados.qryOrcamento.FieldByName
        ('CODIGO').Value;
      dados.qryExecute.ExecSQL;

      dados.qryItensO.close;
      dados.qryItensO.Open;
      item := 1;
      while not dadosweb.cdsItens.Eof do
      begin
        dados.qryItensO.Insert;
        dados.qryItensOCODIGO.Value := dados.Numerador('ORCAMENTO_ITEM',
          'CODIGO', 'N', '', '');
        dados.qryItensO.FieldByName('FK_PRODUTO').Value :=
          dadosweb.cdsItens.FieldByName('fk_produto').Value;
        dados.qryItensO.FieldByName('FK_ORCAMENTO').Value :=
          dados.qryOrcamento.FieldByName('CODIGO').Value;
        dados.qryItensO.FieldByName('QTD').Value :=
          dadosweb.cdsItens.FieldByName('qtd').Value;
        dados.qryItensO.FieldByName('PRECO').Value :=
          dadosweb.cdsItens.FieldByName('preco').Value;
        dados.qryItensO.FieldByName('TOTAL').Value :=
          dadosweb.cdsItens.FieldByName('TOTAL').Value;
        dados.qryItensO.FieldByName('ITEM').Value := item;
        dados.qryItensO.Post;
        dadosweb.cdsItens.Next;
        item := item + 1;
      end;

      dados.Conexao.CommitRetaining;

      dadosweb.cdsOrcamento.Next;
    end;
  end; }
end;

procedure TFrmPedidoWeb.Download;
begin

  // Baixa Pessoa
  BaixarPessoa;

  // sincronizar ORCAMENTO
  BaixaOrcamento;

  ShowMessage('Sincronização Conluida!');
end;

procedure TFrmPedidoWeb.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

end.
