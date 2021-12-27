unit uDadosWeb;

interface

uses
  System.SysUtils, Forms, dialogs, System.Classes, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  MemDS, DBAccess, Uni, UniProvider, MySQLUniProvider;

type
  TDadosWeb = class(TDataModule)
    ConexaoAPP: TFDConnection;
    TransacaoAPP: TFDTransaction;
    Cursor: TFDGUIxWaitCursor;
    MysqlAPP: TFDPhysMySQLDriverLink;
    cdsProdutos: TFDQuery;
    cdsPessoas: TFDQuery;
    cdsOrcamento: TFDQuery;
    cdsItens: TFDQuery;
    CdsCidade: TFDQuery;
    cdsVendedor: TFDQuery;
    cdsProdutoscodigo: TIntegerField;
    cdsProdutosdescricao: TStringField;
    cdsProdutostipo: TStringField;
    cdsProdutoscodbarra: TStringField;
    cdsProdutosreferencia: TStringField;
    cdsProdutosunidade: TStringField;
    cdsProdutospr_custo: TBCDField;
    cdsProdutospr_venda: TBCDField;
    cdsProdutosqtd_atual: TBCDField;
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
    cdsOrcamentocodigo: TFDAutoIncField;
    cdsOrcamentodata: TDateField;
    cdsOrcamentofk_cliente: TIntegerField;
    cdsOrcamentoforma_pagamento: TStringField;
    cdsOrcamentovalidade: TSmallintField;
    cdsOrcamentosituacao: TStringField;
    cdsOrcamentototal: TBCDField;
    cdsOrcamentosubtotal: TBCDField;
    cdsOrcamentopercentual: TBCDField;
    cdsOrcamentodesconto: TBCDField;
    cdsOrcamentocodigolocal: TIntegerField;
    cdsOrcamentofk_vendedor: TIntegerField;
    cdsOrcamentorazao: TStringField;
    cdsOrcamentocnpj: TStringField;
    cdsOrcamentotipo: TStringField;
    cdsItenscodigo: TFDAutoIncField;
    cdsItensfk_orcamento: TIntegerField;
    cdsItensfk_produto: TIntegerField;
    cdsItensqtd: TBCDField;
    cdsItenspreco: TBCDField;
    cdsItenstotal: TBCDField;
    cdsItenscodigolocal: TIntegerField;
    cdsItensdescricao: TStringField;
    CdsCidadecodigo: TIntegerField;
    CdsCidadedescricao: TStringField;
    CdsCidadecoduf: TIntegerField;
    CdsCidadeuf: TStringField;
    cdsVendedorcodigo: TIntegerField;
    cdsVendedornome: TStringField;
    updOrcamento: TFDQuery;
    TransacaoChave: TFDTransaction;
    ConexaoChave: TFDConnection;
    MysqlChave: TFDPhysMySQLDriverLink;
    qryEmpresa: TFDQuery;
    procedure qryEmpresaAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure LeDados;
    procedure LimpaDados;
    { Private declarations }
  public
    { Public declarations }
    procedure CadastraEmpresa;
    procedure RetornaSerial;

  end;

var
  DadosWeb: TDadosWeb;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados;
{$R *.dfm}

procedure TDadosWeb.RetornaSerial;
begin
  try
    if not DadosWeb.ConexaoChave.Connected then
    begin
      DadosWeb.ConexaoChave.close;
      DadosWeb.ConexaoChave.Open;
    end;

    DadosWeb.qryEmpresa.close;
    DadosWeb.qryEmpresa.Params[0].Value := dados.qryEmpresacnpj.Value;
    DadosWeb.qryEmpresa.Open;
    if not DadosWeb.qryEmpresa.IsEmpty then
    begin
      dados.qryEmpresa.Edit;

      if not DadosWeb.qryEmpresa.fieldbyname('validade_licenca').IsNull then
        dados.qryEmpresaDATA_VALIDADE.AsString :=
          dados.crypt('C', DadosWeb.qryEmpresa.fieldbyname('validade_licenca')
          .AsString);

      if not DadosWeb.qryEmpresa.fieldbyname('nterminais').IsNull then
        dados.qryEmpresaNTERM.AsString :=
          dados.crypt('C', DadosWeb.qryEmpresa.fieldbyname('nterminais')
          .AsString);

      if not DadosWeb.qryEmpresa.fieldbyname('bloqueado').IsNull then
        dados.qryEmpresaCSENHA.AsString :=
          dados.crypt('C', DadosWeb.qryEmpresa.fieldbyname('bloqueado')
          .AsString);

      dados.qryEmpresaNSERIE.AsString := dados.crypt('C', '...');
      dados.qryEmpresaCHECA.Value := dados.crypt('C', 'PRODUCAO');
      dados.qryEmpresa.Post;
      dados.Conexao.CommitRetaining;
    end;
  except
    // nada
  end;

end;

procedure TDadosWeb.CadastraEmpresa;
begin
  try
    DadosWeb.qryEmpresa.close;
    DadosWeb.qryEmpresa.Params[0].Value := dados.qryEmpresacnpj.Value;
    DadosWeb.qryEmpresa.Open;

    if DadosWeb.qryEmpresa.IsEmpty then
    begin
      DadosWeb.qryEmpresa.Insert;
      DadosWeb.qryEmpresa.fieldbyname('cnpj').Value :=
        dados.qryEmpresacnpj.Value;
      DadosWeb.qryEmpresa.fieldbyname('data').Value := date;
    end
    else
      DadosWeb.qryEmpresa.Edit;
    DadosWeb.qryEmpresa.fieldbyname('razao').Value :=
      dados.qryEmpresarazao.Value;
    DadosWeb.qryEmpresa.fieldbyname('endereco').Value :=
      dados.qryEmpresaendereco.Value;
    DadosWeb.qryEmpresa.fieldbyname('cidade').Value :=
      dados.qryEmpresacidade.Value;
    DadosWeb.qryEmpresa.fieldbyname('bairro').Value :=
      dados.qryEmpresabairro.Value;
    DadosWeb.qryEmpresa.fieldbyname('cep').Value := dados.qryEmpresacep.Value;
    DadosWeb.qryEmpresa.fieldbyname('uf').Value := dados.qryEmpresauf.Value;
    DadosWeb.qryEmpresa.fieldbyname('fone').Value := dados.qryEmpresafone.Value;
    DadosWeb.qryEmpresa.fieldbyname('email').Value :=
      dados.qryEmpresaemail.Value;
    DadosWeb.qryEmpresa.Post;
  except

  end;
end;

procedure TDadosWeb.DataModuleCreate(Sender: TObject);
begin
  try
    if dados.qryParametro.Active then
      dados.qryParametro.Open;
    LeDados;
  except
    LimpaDados;
  end;
end;

procedure TDadosWeb.LeDados;
begin
  MysqlAPP.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
  MysqlChave.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';

  if trim(dados.qryParametroSERVIDOR_APP.AsString) <> '' then
    ConexaoAPP.Params.Values['Server'] := dados.qryParametroSERVIDOR_APP.Value;

  if trim(dados.qryParametroDATABASE_APP.AsString) <> '' then
    ConexaoAPP.Params.Values['Database'] :=
      dados.crypt('D', dados.qryParametroDATABASE_APP.Value);

  if trim(dados.qryParametroUSUARIO_APP.AsString) <> '' then
    ConexaoAPP.Params.Values['User_Name'] :=
      dados.crypt('D', dados.qryParametroUSUARIO_APP.Value);

  if trim(dados.qryParametroSENHA_APP.AsString) <> '' then
    ConexaoAPP.Params.Values['Password'] :=
      dados.crypt('D', dados.qryParametroSENHA_APP.Value);

  if trim(dados.qryParametroSERVIDOR_APP.AsString) <> '' then
    ConexaoChave.Params.Values['Server'] :=
      dados.qryParametroSERVIDOR_APP.Value;

  if trim(dados.qryParametroDATABASE_LI.AsString) <> '' then
    ConexaoChave.Params.Values['Database'] :=
      dados.crypt('D', dados.qryParametroDATABASE_LI.Value);

  if trim(dados.qryParametroUSUARIO_LI.AsString) <> '' then
    ConexaoChave.Params.Values['User_Name'] :=
      dados.crypt('D', dados.qryParametroUSUARIO_LI.Value)
  else
    ConexaoAPP.Params.Values['User_Name'] :=
      dados.crypt('D', dados.qryParametroUSUARIO_APP.Value);

  if trim(dados.qryParametroSENHA_LI.AsString) <> '' then
    ConexaoChave.Params.Values['Password'] :=
      dados.crypt('D', dados.qryParametroSENHA_LI.Value);
end;

procedure TDadosWeb.LimpaDados;
begin
  dados.qryParametro.Edit;
  dados.qryParametroSERVIDOR_APP.Value := '';
  dados.qryParametroDATABASE_APP.Value := '';
  dados.qryParametroUSUARIO_APP.Value := '';
  dados.qryParametroSENHA_APP.Value := '';
  dados.qryParametroSERVIDOR_APP.Value := '';
  dados.qryParametroDATABASE_LI.Value := '';
  dados.qryParametroUSUARIO_LI.Value := '';
  dados.qryParametroSENHA_LI.Value := '';
  dados.qryParametro.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TDadosWeb.qryEmpresaAfterPost(DataSet: TDataSet);
begin
  if dados.qryEmpresa.Active then
  begin
    dados.qryEmpresa.Edit;
    dados.qryEmpresaFLAG.Value := dados.crypt('C', 'ENVIADO');
    dados.qryEmpresa.Post;
  end;
end;

end.
