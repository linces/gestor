unit uSincronizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrutil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmSincronizar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    ProgressBar1: TProgressBar;
    qryPessoas: TFDQuery;
    qryPessoasCODIGO: TIntegerField;
    qryPessoasEMPRESA: TSmallintField;
    qryPessoasTIPO: TStringField;
    qryPessoasCNPJ: TStringField;
    qryPessoasIE: TStringField;
    qryPessoasFANTASIA: TStringField;
    qryPessoasRAZAO: TStringField;
    qryPessoasPAI: TStringField;
    qryPessoasMAE: TStringField;
    qryPessoasENDERECO: TStringField;
    qryPessoasNUMERO: TStringField;
    qryPessoasCOMPLEMENTO: TStringField;
    qryPessoasCODMUN: TIntegerField;
    qryPessoasMUNICIPIO: TStringField;
    qryPessoasBAIRRO: TStringField;
    qryPessoasUF: TStringField;
    qryPessoasCEP: TStringField;
    qryPessoasFONE1: TStringField;
    qryPessoasFONE2: TStringField;
    qryPessoasCELULAR1: TStringField;
    qryPessoasCELULAR2: TStringField;
    qryPessoasEMAIL1: TStringField;
    qryPessoasEMAIL2: TStringField;
    qryPessoasFOTO: TBlobField;
    qryPessoasSEXO: TStringField;
    qryPessoasDT_NASC: TDateField;
    qryPessoasECIVIL: TStringField;
    qryPessoasDIA_PGTO: TSmallintField;
    qryPessoasOBS: TMemoField;
    qryPessoasNUM_USU: TSmallintField;
    qryPessoasFATURA: TStringField;
    qryPessoasCHEQUE: TStringField;
    qryPessoasCCF: TStringField;
    qryPessoasSPC: TStringField;
    qryPessoasISENTO: TStringField;
    qryPessoasFORN: TStringField;
    qryPessoasFUN: TStringField;
    qryPessoasCLI: TStringField;
    qryPessoasFAB: TStringField;
    qryPessoasTRAN: TStringField;
    qryPessoasADM: TStringField;
    qryPessoasATIVO: TStringField;
    qryPessoasDT_ADMISSAO: TDateField;
    qryPessoasDT_DEMISSAO: TDateField;
    qryPessoasATENDENTE: TStringField;
    qryPessoasLIMITE: TFMTBCDField;
    qryPessoasBANCO: TStringField;
    SA: TStringField;
    qryPessoasGERENTE: TStringField;
    qryPessoasFONE_GERENTE: TStringField;
    qryPessoasPROPRIEDADE: TStringField;
    qryPessoasSALARIO: TFMTBCDField;
    qryPessoasTECNICO: TStringField;
    qryProdutos: TFDQuery;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosTIPO: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosGRUPO: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosULTFORN: TIntegerField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosCSTICMS: TStringField;
    qryProdutosCSTE: TStringField;
    qryProdutosCSTS: TStringField;
    qryProdutosCSTIPI: TStringField;
    qryProdutosCSOSN: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosCOMISSAO: TCurrencyField;
    qryProdutosDESCONTO: TCurrencyField;
    qryProdutosFOTO: TBlobField;
    qryProdutosATIVO: TStringField;
    qryProdutosCFOP: TStringField;
    qryProdutosULT_COMPRA: TIntegerField;
    qryProdutosULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdutosCOD_BARRA_ATACADO: TStringField;
    qryProdutosEMPRESA: TSmallintField;
    qryProdutosCEST: TStringField;
    qryProdutosGRADE: TStringField;
    qryProdutosEFISCAL: TStringField;
    qryProdutosPAGA_COMISSAO: TStringField;
    qryProdutosPESO: TFMTBCDField;
    qryProdutosCOMPOSICAO: TStringField;
    qryProdutosINICIO_PROMOCAO: TDateField;
    qryProdutosFIM_PROMOCAO: TDateField;
    qryProdutosESTOQUE_INICIAL: TFMTBCDField;
    qryProdutosPRECO_VARIAVEL: TStringField;
    qryProdutosAPLICACAO: TStringField;
    qryProdutosREDUCAO_BASE: TFMTBCDField;
    qryProdutosMVA: TFMTBCDField;
    qryProdutosFCP: TFMTBCDField;
    qryProdutosPRODUTO_PESADO: TStringField;
    qryProdutosSERVICO: TStringField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosDT_CADASTRO: TDateField;
    qryProdutosGRUPO_SL: TStringField;
    qryProdutosALIQ_ICM: TCurrencyField;
    qryProdutosALIQ_PIS: TCurrencyField;
    qryProdutosALIQ_COF: TCurrencyField;
    qryProdutosPR_CUSTO: TFMTBCDField;
    qryProdutosMARGEM: TCurrencyField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosQTD_ATUAL: TFMTBCDField;
    qryProdutosQTD_MIN: TFMTBCDField;
    qryProdutosE_MEDIO: TFMTBCDField;
    qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdutosPRECO_ATACADO: TFMTBCDField;
    qryProdutosQTD_ATACADO: TFMTBCDField;
    qryProdutosALIQ_IPI: TFMTBCDField;
    qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdutosPR_VENDA_PRAZO: TFMTBCDField;
    qryProdutosPR_CUSTO2: TFMTBCDField;
    qryProdutosPERC_CUSTO: TFMTBCDField;
    qryCidade: TFDQuery;
    qryCidadeCODIGO: TIntegerField;
    qryCidadeDESCRICAO: TStringField;
    qryCidadeCODUF: TIntegerField;
    qryCidadeUF: TStringField;
    chkClientes: TCheckBox;
    chkProduto: TCheckBox;
    ChkCidade: TCheckBox;
    chkVendedores: TCheckBox;
    qryVendedores: TFDQuery;
    qryVendedoresCODIGO: TIntegerField;
    qryVendedoresNOME: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure Upload;
    procedure UploadPessoa;
    procedure UploadCidade;
    procedure UploadProduto;
    procedure UploadVendedor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSincronizar: TFrmSincronizar;

implementation

{$R *.dfm}

uses uDadosWeb, Udados;

procedure TFrmSincronizar.UploadPessoa;
begin
{  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100;

  if chkClientes.Checked then
  begin

    chkClientes.Font.Style := [fsBold];
    chkVendedores.Font.Style := [];
    Application.ProcessMessages;

    Sleep(500);

    qryPessoas.close;
    qryPessoas.Open;
    qryPessoas.First;

    dadosweb.cdsPessoas.close;
    dadosweb.cdsPessoas.Open;

    while not qryPessoas.Eof do
    begin
      if dadosweb.cdsPessoas.Locate('GID',
        tirapontos(qryPessoas.FieldByName('GID').Value), []) then
        dadosweb.cdsPessoas.Edit
      else
        dadosweb.cdsPessoas.Insert;
      dadosweb.cdsPessoas.FieldByName('TIPO').Value :=
        qryPessoas.FieldByName('TIPO').Value;
      dadosweb.cdsPessoas.FieldByName('CNPJ').Value :=
        tirapontos(qryPessoas.FieldByName('CNPJ').Value);
      dadosweb.cdsPessoas.FieldByName('IE').Value :=
        tirapontos(qryPessoas.FieldByName('IE').Value);
      dadosweb.cdsPessoas.FieldByName('FANTASIA').Value :=
        qryPessoas.FieldByName('FANTASIA').Value;
      dadosweb.cdsPessoas.FieldByName('RAZAO').Value :=
        qryPessoas.FieldByName('RAZAO').Value;
      dadosweb.cdsPessoas.FieldByName('ENDERECO').Value :=
        qryPessoas.FieldByName('ENDERECO').Value;
      dadosweb.cdsPessoas.FieldByName('COMPLEMENTO').Value := '';
      dadosweb.cdsPessoas.FieldByName('NUMERO').Value :=
        qryPessoas.FieldByName('NUMERO').Value;
      dadosweb.cdsPessoas.FieldByName('CODMUN').Value :=
        qryPessoas.FieldByName('CODMUN').Value;
      dadosweb.cdsPessoas.FieldByName('MUNICIPIO').Value :=
        qryPessoas.FieldByName('MUNICIPIO').Value;
      dadosweb.cdsPessoas.FieldByName('BAIRRO').Value :=
        qryPessoas.FieldByName('BAIRRO').Value;
      dadosweb.cdsPessoas.FieldByName('UF').Value :=
        qryPessoas.FieldByName('UF').Value;
      dadosweb.cdsPessoas.FieldByName('CEP').Value :=
        qryPessoas.FieldByName('CEP').Value;
      dadosweb.cdsPessoas.FieldByName('CELULAR1').Value :=
        qryPessoas.FieldByName('CELULAR1').Value;
      dadosweb.cdsPessoas.FieldByName('ISENTO').Value := '0';
      dadosweb.cdsPessoas.FieldByName('GID').Value :=
        qryPessoas.FieldByName('GID').Value;
      dadosweb.cdsPessoas.Post;
      qryPessoas.Next;
    end;
  end;}
end;

Procedure TFrmSincronizar.UploadCidade;
begin
{  if ChkCidade.Checked then
  begin

    chkClientes.Font.Style := [];
    ChkCidade.Font.Style := [fsBold];
    chkVendedores.Font.Style := [];
    Application.ProcessMessages;

    Sleep(500);

    qryCidade.close;
    qryCidade.Open;
    qryCidade.First;

    dadosweb.cdsCidade.close;
    dadosweb.cdsCidade.Open;

    while not qryCidade.Eof do
    begin
      if not dadosweb.cdsCidade.Locate('CODIGO', qryCidade.FieldByName('CODIGO')
        .Value, []) then
      begin
        dadosweb.cdsCidade.Insert;
        dadosweb.cdsCidade.FieldByName('CODIGO').Value :=
          qryCidade.FieldByName('CODIGO').Value;
        dadosweb.cdsCidade.FieldByName('descricao').Value :=
          qryCidade.FieldByName('DESCRICAO').Value;
        dadosweb.cdsCidade.FieldByName('coduf').Value :=
          qryCidade.FieldByName('CODUF').Value;
        dadosweb.cdsCidade.FieldByName('uf').Value :=
          qryCidade.FieldByName('UF').Value;
        dadosweb.cdsCidade.Post;
      end;
      qryCidade.Next;
    end;
  end;}

end;

procedure TFrmSincronizar.UploadProduto;
begin
{  if chkProduto.Checked then
  begin
    chkClientes.Font.Style := [];
    ChkCidade.Font.Style := [];
    chkProduto.Font.Style := [fsBold];
    chkVendedores.Font.Style := [];
    Application.ProcessMessages;

    Sleep(500);

    qryProdutos.close;
    qryProdutos.Open;
    qryProdutos.First;

    dadosweb.cdsProdutos.close;
    dadosweb.cdsProdutos.Open;

    while not qryProdutos.Eof do
    begin
      if dadosweb.cdsProdutos.Locate('GID', qryProdutos.FieldByName('GID')
        .Value, []) then
        dadosweb.cdsProdutos.Edit
      else
        dadosweb.cdsProdutos.Insert;
      dadosweb.cdsProdutos.FieldByName('CODIGO').Value :=
        qryProdutos.FieldByName('CODIGO').Value;
      dadosweb.cdsProdutos.FieldByName('TIPO').Value :=
        qryProdutos.FieldByName('TIPO').Value;
      dadosweb.cdsProdutos.FieldByName('descricao').Value :=
        qryProdutos.FieldByName('DESCRICAO').Value;
      dadosweb.cdsProdutos.FieldByName('codbarra').Value :=
        qryProdutos.FieldByName('CODBARRA').Value;
      dadosweb.cdsProdutos.FieldByName('referencia').Value :=
        qryProdutos.FieldByName('REFERENCIA').Value;
      dadosweb.cdsProdutos.FieldByName('unidade').Value :=
        qryProdutos.FieldByName('UNIDADE').Value;
      dadosweb.cdsProdutos.FieldByName('pr_custo').Value :=
        qryProdutos.FieldByName('PR_CUSTO').AsFloat;
      dadosweb.cdsProdutos.FieldByName('pr_venda').Value :=
        qryProdutos.FieldByName('PR_VENDA').AsFloat;
      dadosweb.cdsProdutos.FieldByName('qtd_atual').Value :=
        qryProdutos.FieldByName('QTD_ATUAL').AsFloat;
      dadosweb.cdsProdutos.FieldByName('GID').Value :=
        qryProdutos.FieldByName('GID').AsFloat;

      dadosweb.cdsProdutos.Post;
      qryProdutos.Next;
    end;
  end;}
end;

procedure TFrmSincronizar.UploadVendedor;
begin
{  if chkVendedores.Checked then
  begin
    chkClientes.Font.Style := [];
    ChkCidade.Font.Style := [];
    chkProduto.Font.Style := [];
    chkVendedores.Font.Style := [fsBold];
    Application.ProcessMessages;

    qryVendedores.close;
    qryVendedores.Open;
    qryVendedores.First;

    dadosweb.cdsVendedor.close;
    dadosweb.cdsVendedor.Open;

    while not qryVendedores.Eof do
    begin
      if dadosweb.cdsVendedor.Locate('GID', qryVendedores.FieldByName('GID')
        .Value, []) then
        dadosweb.cdsVendedor.Edit
      else
        dadosweb.cdsVendedor.Insert;
      dadosweb.cdsVendedor.FieldByName('codigo').Value :=
        qryVendedores.FieldByName('CODIGO').Value;
      dadosweb.cdsVendedor.FieldByName('nome').Value :=
        qryVendedores.FieldByName('NOME').Value;
      dadosweb.cdsVendedor.FieldByName('GID').Value :=
        qryVendedores.FieldByName('GID').Value;
      dadosweb.cdsVendedor.Post;
      qryVendedores.Next;
    end;
  end;}
end;

procedure TFrmSincronizar.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmSincronizar.Upload;
var
  cont: integer;
begin

  // sincronizar pessoas

  UploadPessoa;
  Application.ProcessMessages;
  ProgressBar1.Position := 25;
  Sleep(500);

  UploadCidade;
  Application.ProcessMessages;
  ProgressBar1.Position := 50;
  Sleep(500);

  UploadProduto;
  Application.ProcessMessages;
  ProgressBar1.Position := 75;
  Sleep(500);

  UploadVendedor;
  Application.ProcessMessages;
  ProgressBar1.Position := 100;

  Application.ProcessMessages;
  ShowMessage('Sincronização Conluida!');
end;

procedure TFrmSincronizar.btnSalvarClick(Sender: TObject);
begin
{  try
    btnSalvar.Enabled := false;
    try
      dadosweb.ConexaoApp.close;
      dadosweb.ConexaoApp.Open;
      if dadosweb.ConexaoApp.Connected then
      begin
        Upload;
      end;

    except
      on e: Exception do
        raise Exception.Create
          ('Erro de conexão com o banco de dados do servidor ' + e.Message);
    end;
  finally
    ChkCidade.Font.Style := [];
    chkProduto.Font.Style := [];
    chkClientes.Font.Style := [];
    chkVendedores.Font.Style := [];
    btnSalvar.Enabled := true;
  end;}
end;

end.
