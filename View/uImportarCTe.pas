unit uImportarCTe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, ACBrBase, ACBrDFe, ACBrNFe;

type
  TfrmImportarCTe = class(TForm)
    Panel1: TPanel;
    btnNFCe: TSpeedButton;
    qryNota: TFDQuery;
    qryItens: TFDQuery;
    edtCaminho: TEdit;
    btnPesq: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    btnSair: TSpeedButton;
    cbEmpresa: TDBLookupComboBox;
    Abrir: TOpenDialog;
    dsEmpresa: TDataSource;
    qryDestinatario: TFDQuery;
    ACBrNFe: TACBrNFe;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioNOME: TStringField;
    qryDestinatarioENDERECO: TStringField;
    qryDestinatarioNUMERO: TStringField;
    qryDestinatarioBAIRRO: TStringField;
    qryDestinatarioID_CIDADE: TIntegerField;
    qryDestinatarioCIDADE: TStringField;
    qryDestinatarioCEP: TStringField;
    qryDestinatarioUF: TStringField;
    qryDestinatarioPESSOA: TStringField;
    qryDestinatarioCNPJ: TStringField;
    qryDestinatarioIE: TStringField;
    qryDestinatarioFONE: TStringField;
    qryDestinatarioFK_EMPRESA: TIntegerField;
    qryDestinatarioFK_USUARIO: TIntegerField;
    qryDestinatarioATIVO: TIntegerField;
    qryItensCODIGO: TIntegerField;
    qryItensFKNFE: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensITEM: TSmallintField;
    qryItensCOD_BARRA: TStringField;
    qryItensNCM: TStringField;
    qryItensCFOP: TStringField;
    qryItensCST: TStringField;
    qryItensCSOSN: TStringField;
    qryItensTIPO: TStringField;
    qryItensQTD: TFMTBCDField;
    qryItensE_MEDIO: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensBASE_ICMS: TFMTBCDField;
    qryItensALIQ_ICMS: TFMTBCDField;
    qryItensVALOR_ICMS: TFMTBCDField;
    qryItensCST_COFINS: TStringField;
    qryItensBASE_COFINS_ICMS: TFMTBCDField;
    qryItensALIQ_COFINS_ICMS: TFMTBCDField;
    qryItensVALOR_COFINS_ICMS: TFMTBCDField;
    qryItensCST_PIS: TStringField;
    qryItensBASE_PIS_ICMS: TFMTBCDField;
    qryItensALIQ_PIS_ICMS: TFMTBCDField;
    qryItensVALOR_PIS_ICMS: TFMTBCDField;
    qryItensTRIB_MUN: TFMTBCDField;
    qryItensTRIB_EST: TFMTBCDField;
    qryItensTRIB_FED: TFMTBCDField;
    qryItensTRIB_IMP: TFMTBCDField;
    qryItensSITUACAO: TStringField;
    qryItensFLAG: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensFRETE: TFMTBCDField;
    qryItensDESPESAS: TFMTBCDField;
    qryItensSEGURO: TFMTBCDField;
    qryItensDESCONTO: TFMTBCDField;
    qryItensBASE_IPI: TFMTBCDField;
    qryItensALIQ_IPI: TFMTBCDField;
    qryItensVALOR_IPI: TFMTBCDField;
    qryItensBASE_ICMS_ST: TFMTBCDField;
    qryItensVALOR_ICMS_ST: TFMTBCDField;
    qryItensVBCUFDEST: TFMTBCDField;
    qryItensVFCP: TFMTBCDField;
    qryItensPICMSUFDEST: TFMTBCDField;
    qryItensPICMSINTER: TFMTBCDField;
    qryItensPICMSINTERPART: TFMTBCDField;
    qryItensVFCPUFDEST: TFMTBCDField;
    qryItensVICMSUFDEST: TFMTBCDField;
    qryItensVICMSUFREMET: TFMTBCDField;
    qryItensCST_IPI: TStringField;
    qryItensOUTROS: TFMTBCDField;
    qryItensALIQ_ICMS_ST: TFMTBCDField;
    qryNotaCODIGO: TIntegerField;
    qryNotaNUMERO: TIntegerField;
    qryNotaCHAVE: TStringField;
    qryNotaMODELO: TStringField;
    qryNotaSERIE: TStringField;
    qryNotaDATA_EMISSAO: TDateField;
    qryNotaDATA_SAIDA: TDateField;
    qryNotaHORA_EMISSAO: TTimeField;
    qryNotaHORA_SAIDA: TTimeField;
    qryNotaID_EMITENTE: TIntegerField;
    qryNotaID_CLIENTE: TIntegerField;
    qryNotaID_TRANSPORTADOR: TIntegerField;
    qryNotaFK_USUARIO: TIntegerField;
    qryNotaFK_CAIXA: TIntegerField;
    qryNotaFK_VENDEDOR: TIntegerField;
    qryNotaTIPO_FRETE: TStringField;
    qryNotaSUBTOTAL: TFMTBCDField;
    qryNotaTIPO_DESCONTO: TStringField;
    qryNotaDESPESAS: TFMTBCDField;
    qryNotaSEGURO: TFMTBCDField;
    qryNotaFRETE: TFMTBCDField;
    qryNotaDESCONTO: TFMTBCDField;
    qryNotaTROCO: TFMTBCDField;
    qryNotaDINHEIRO: TFMTBCDField;
    qryNotaTOTAL: TFMTBCDField;
    qryNotaBASE_ST: TFMTBCDField;
    qryNotaTOTAL_ST: TFMTBCDField;
    qryNotaBASE_IPI: TFMTBCDField;
    qryNotaTOTAL_IPI: TFMTBCDField;
    qryNotaBASEICMS: TFMTBCDField;
    qryNotaTOTALICMS: TFMTBCDField;
    qryNotaBASEICMSPIS: TFMTBCDField;
    qryNotaTOTALICMSPIS: TFMTBCDField;
    qryNotaBASEICMSCOF: TFMTBCDField;
    qryNotaTOTALICMSCOFINS: TFMTBCDField;
    qryNotaBASEISS: TFMTBCDField;
    qryNotaTOTALISS: TFMTBCDField;
    qryNotaOBSFISCO: TMemoField;
    qryNotaOBSCONTRIBUINTE: TMemoField;
    qryNotaEMAIL: TStringField;
    qryNotaXML: TMemoField;
    qryNotaPROTOCOLO: TStringField;
    qryNotaTRIB_MUN: TFMTBCDField;
    qryNotaTRIB_EST: TFMTBCDField;
    qryNotaTRIB_FED: TFMTBCDField;
    qryNotaTRIB_IMP: TFMTBCDField;
    qryNotaFLAG: TStringField;
    qryNotaFKORCAMENTO: TIntegerField;
    qryNotaFKVENDA: TIntegerField;
    qryNotaFKNOTA: TIntegerField;
    qryNotaESPECIE: TStringField;
    qryNotaMARCA: TStringField;
    qryNotaNVOL: TStringField;
    qryNotaQVOL: TIntegerField;
    qryNotaPESOB: TFMTBCDField;
    qryNotaPESOL: TFMTBCDField;
    qryNotaPLACA: TStringField;
    qryNotaUFPLACA: TStringField;
    qryNotaRNTC: TStringField;
    qryNotaSITUACAO: TStringField;
    qryNotaFKEMPRESA: TIntegerField;
    qryNotaTIPO_EMISSAO: TStringField;
    qryNotaFINALIDADE: TStringField;
    qryNotaMOVIMENTO: TStringField;
    qryNotaCFOP: TIntegerField;
    qryNotaCHAVE_NFE_REFERENCIADA: TStringField;
    qryNotaMOTIVO_CONTIGENCIA: TStringField;
    qryNotaBASE_ICMS_ST: TFMTBCDField;
    qryNotaVALOR_ICMS_ST: TFMTBCDField;
    qryNotaVFCPUFDEST: TFMTBCDField;
    qryNotaVICMSUFDEST: TFMTBCDField;
    qryNotaVICMSUFREMET: TFMTBCDField;
    qryNotaCONSUMIDOR_FINAL: TStringField;
    qryNotaNPEDIDO: TStringField;
    qryNotaOUTROS: TFMTBCDField;
    chkLerXml: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure btnNFCeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkLerXmlClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ImportaNFe(Empresa, Nota: Integer);
    procedure ImportaXml(caminho: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarCTe: TfrmImportarCTe;

implementation

{$R *.dfm}

uses Udados, uCadCTe;

procedure TfrmImportarCTe.ImportaNFe(Empresa, Nota: Integer);
var
  MaiorProduto: Integer;
  Descricao: String;
  QtdProduto, PrecoProduto: Extended;
  Unidade: String;
begin
  MaiorProduto := 0;
  PrecoProduto := 0;
  QtdProduto := 0;

  if trim(edtNumero.Text) = '' then
  begin
    ShowMessage('Digite o número da Nota');
    edtNumero.SetFocus;
    exit;
  end;

  qryNota.Close;
  qryNota.Params[0].Value := cbEmpresa.KeyValue;
  qryNota.Params[1].Value := edtNumero.Text;
  qryNota.Open;

  qryItens.Close;
  qryItens.Params[0].Value := qryNotaCODIGO.Value;;
  qryItens.Open;

  if not qryNota.IsEmpty then
  begin

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.add
      ('SELECT NFD.id_produto , MAX(NFD.qtd) qtd,  max(nfd.preco)preco FROM nfe_detalhe NFD');
    dados.qryconsulta.sql.add
      ('left join nfe_master NFM on nfm.codigo=nfd.fknfe');
    dados.qryconsulta.sql.add('WHERE NFM.CODIGO=:nfe');
    dados.qryconsulta.sql.add('GROUP BY 1 ORDER BY 2 DESC');
    dados.qryconsulta.Params[0].Value := qryNota.Fields[0].Value;
    dados.qryconsulta.Open;

    MaiorProduto := dados.qryconsulta.Fields[0].AsInteger;
    QtdProduto := dados.qryconsulta.Fields[1].AsFloat;
    PrecoProduto := dados.qryconsulta.Fields[2].AsFloat;

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.add
      ('select pro.DESCRICAO, un.codigo from produto pro');
    dados.qryconsulta.sql.add('left join unidade un on pro.unidade=un.codigo');
    dados.qryconsulta.sql.add('where pro.codigo=:id');
    dados.qryconsulta.Params[0].Value := MaiorProduto;
    dados.qryconsulta.Open;

    Descricao := dados.qryconsulta.Fields[0].AsString;
    Unidade := dados.qryconsulta.Fields[1].AsString;

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.add('SELECT CD.CHAVE FROM CTE_DETALHE CD');
    dados.qryconsulta.sql.add
      ('LEFT JOIN cte_master CM on cm.codigo=CD.fk_cte_master');
    dados.qryconsulta.sql.add('WHERE CD.CHAVE=:CHAVE and CM.situacao =''T''');
    dados.qryconsulta.Params[0].Value := qryNotaCHAVE.Value;
    dados.qryconsulta.Open;

    if not dados.qryconsulta.IsEmpty then
    begin
      ShowMessage('Nota já foi cadastrada!');
    end;

    // verifica se destinatario existe

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.add('select * from pessoa');
    dados.qryconsulta.sql.add('where');
    dados.qryconsulta.sql.add('codigo=:cod');
    dados.qryconsulta.Params[0].Value := qryNotaID_CLIENTE.Value;
    dados.qryconsulta.Open;

    qryDestinatario.Close;
    qryDestinatario.Params[0].Value := dados.qryconsulta.FieldByName
      ('CNPJ').AsString;

    qryDestinatario.Open;

    if qryDestinatario.IsEmpty then
    begin
      qryDestinatario.Insert;
      qryDestinatarioCODIGO.AsFloat := dados.Numerador('CTE_DESTINATARIO',
        'CODIGO', 'N', '', '');
      qryDestinatarioNOME.Value := dados.qryconsulta.FieldByName
        ('RAZAO').AsString;
      qryDestinatarioCNPJ.Value := dados.qryconsulta.FieldByName
        ('CNPJ').AsString;
      qryDestinatarioIE.Value := dados.qryconsulta.FieldByName('IE').AsString;
      qryDestinatarioENDERECO.Value := dados.qryconsulta.FieldByName
        ('ENDERECO').AsString;
      qryDestinatarioNUMERO.Value := dados.qryconsulta.FieldByName
        ('NUMERO').AsString;
      qryDestinatarioBAIRRO.Value := dados.qryconsulta.FieldByName
        ('BAIRRO').AsString;
      qryDestinatarioID_CIDADE.Value := dados.qryconsulta.FieldByName
        ('CODMUN').Value;
      qryDestinatarioCEP.Value := dados.qryconsulta.FieldByName('CEP').Value;
      qryDestinatarioUF.Value := dados.qryconsulta.FieldByName('UF').Value;
      qryDestinatarioCIDADE.Value := dados.qryconsulta.FieldByName
        ('MUNICIPIO').Value;
      qryDestinatario.Post;
      dados.Conexao.CommitRetaining;
    end;

    // insere dados cte master
    if not(FrmCadCte.qryCTE_M.State in [dsInsert, dsEdit]) then
      FrmCadCte.qryCTE_M.Edit;

    FrmCadCte.qryCTE_MFK_REMETENTE.Value := 0;
    FrmCadCte.qryCTE_MFKTRANSPORTADOR.Value := qryNotaID_TRANSPORTADOR.Value;
    FrmCadCte.qryCTE_MUFINI.Value := dados.qryEmpresaUF.Value;
    FrmCadCte.qryCTE_MUFFIM.Value := qryDestinatarioUF.Value;
    FrmCadCte.qryCTE_MFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
    FrmCadCte.qryCTE_MCODMUNINI.Value := dados.qryEmpresaID_CIDADE.Value;
    FrmCadCte.qryCTE_MCODMUNFIM.Value := qryDestinatarioID_CIDADE.Value;
    FrmCadCte.qryCTE_MMUNICIPIOINI.Value := dados.qryEmpresaCIDADE.Value;
    FrmCadCte.qryCTE_MMINICIPIOFIM.Value := qryDestinatarioCIDADE.Value;
    FrmCadCte.qryCTE_MQTD.Value := 0;
    FrmCadCte.qryCTE_MRECEBIDO.Value := 0;
    FrmCadCte.qryCTE_MVALOR_CARGA.Value := 0;
    FrmCadCte.qryCTE_MVALOR_SERVICO.Value := 0;
    FrmCadCte.qryCTE_MMETRAGEM.Value := 'M3';
    FrmCadCte.qryCTE_M.Post;
    dados.Conexao.CommitRetaining;



    // insere dados cte detalhe

    FrmCadCte.qryCTE_D.Append;
    FrmCadCte.qryCTE_DFK_CTE_MASTER.Value := FrmCadCte.qryCTE_MCODIGO.Value;
    FrmCadCte.qryCTE_DCODIGO.AsFloat := dados.Numerador('CTE_DETALHE', 'CODIGO',
      'N', '', '');
    FrmCadCte.qryCTE_DCHAVE.Value := qryNotaCHAVE.Value;
    FrmCadCte.qryCTE_DNUMERO.Value := MaiorProduto;
    FrmCadCte.qryCTE_DDESCRICAO.Value := Descricao;
    FrmCadCte.qryCTE_DFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
    FrmCadCte.qryCTE_DQTD.Value := QtdProduto;
    FrmCadCte.qryCTE_DUNIDADE.Value := Unidade;
    FrmCadCte.qryCTE_DPRECO.Value := PrecoProduto;
    FrmCadCte.qryCTE_DTOTAL.Value := qryNotaTOTAL.Value;
    FrmCadCte.qryCTE_D.Post;
    dados.Conexao.CommitRetaining;

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.add
      ('select sum(cte.total)valor , sum(cte.qtd) qtd from cte_detalhe CTE');
    dados.qryconsulta.sql.add('where');
    dados.qryconsulta.sql.add('cte.fk_cte_master=:id');
    dados.qryconsulta.Params[0].Value := FrmCadCte.qryCTE_MCODIGO.Value;
    dados.qryconsulta.Open;

    // Atualiza total
    if not(FrmCadCte.qryCTE_M.State in [dsInsert, dsEdit]) then
      FrmCadCte.qryCTE_M.Edit;
    FrmCadCte.qryCTE_MVALOR_CARGA.Value := dados.qryconsulta.FieldByName
      ('valor').AsFloat;
    if FrmCadCte.qryCTE_MALIQUOTA_ICMS.Value > 0 then
      FrmCadCte.qryCTE_MRECEBIDO.Value := FrmCadCte.qryCTE_MVALOR_CARGA.Value;
    FrmCadCte.qryCTE_MQTD.Value := dados.qryconsulta.FieldByName('qtd').AsFloat;
    FrmCadCte.qryCTE_MMETRAGEM.Value := Unidade;
    FrmCadCte.qryCTE_M.Post;
    dados.Conexao.CommitRetaining;
  end
  else
  begin
    ShowMessage('Nota não foi encontrada ou não foi gerada por este emitente!');
    exit;
  end;
  edtNumero.Clear;
  edtNumero.SetFocus;

end;

procedure TfrmImportarCTe.ImportaXml(caminho: string);

var
  i, n: Integer;
  pesob, pesol: real;
  cpf_cnpj: string;
  pessoafisica: boolean;
begin
  ACBrNFe.NotasFiscais.Clear;
  if FileExists(edtCaminho.Text) then
  begin
    ACBrNFe.NotasFiscais.LoadFromFile(edtCaminho.Text);
  end
  else
  begin
    ShowMessage('Arquivo Inválido!');
    exit;
  end;

  // insere destinario senao existir

  if length(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF) = 11 then
  begin
    cpf_cnpj := copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 1, 3) + '.'
      + copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 4, 3) + '.' +
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 7, 3) + '-' +
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 10, 2);
    pessoafisica := true;
  end;

  if length(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF) = 14 then
  begin
    cpf_cnpj := copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 1, 2) + '.'
      + copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 3, 3) + '.' +
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 6, 3) + '/' +
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 9, 4) + '-' +
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 13, 2);
    pessoafisica := false;
  end;

  qryDestinatario.Close;
  qryDestinatario.Params[0].Value := cpf_cnpj;
  qryDestinatario.Open;

  if qryDestinatario.IsEmpty then
  begin
    qryDestinatario.Insert;
    qryDestinatarioCODIGO.AsFloat := dados.Numerador('CTE_DESTINATARIO',
      'CODIGO', 'N', '', '');
    qryDestinatarioNOME.Value := ACBrNFe.NotasFiscais.Items[0].NFe.dest.xNome;
    qryDestinatarioCNPJ.Value := cpf_cnpj;
    if pessoafisica then
      qryDestinatarioPESSOA.Value := 'FÍSICA'
    else
      qryDestinatarioPESSOA.Value := 'JURÍDICA';

    qryDestinatarioIE.Value := ACBrNFe.NotasFiscais.Items[0].NFe.dest.IE;
    qryDestinatarioENDERECO.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.xLgr;
    qryDestinatarioNUMERO.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.nro;
    qryDestinatarioBAIRRO.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.xBairro;
    qryDestinatarioID_CIDADE.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.cMun;
    qryDestinatarioCIDADE.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.xMun;
    qryDestinatarioCEP.AsInteger := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.CEP;
    qryDestinatarioUF.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.dest.enderDest.UF;
    qryDestinatarioFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    qryDestinatarioFK_USUARIO.Value := dados.idUsuario;
    qryDestinatarioATIVO.Value := 0;
    qryDestinatario.Post;
    dados.Conexao.CommitRetaining;
  end;


  // atualiza cte master

  if not(FrmCadCte.qryCTE_M.State in [dsInsert, dsEdit]) then
    FrmCadCte.qryCTE_M.Edit;
  FrmCadCte.qryCTE_MFK_REMETENTE.Value := 0;
  FrmCadCte.qryCTE_MFKTRANSPORTADOR.Value := 0;
  FrmCadCte.qryCTE_MUFINI.Value := dados.qryEmpresaUF.Value;
  FrmCadCte.qryCTE_MUFFIM.Value := ACBrNFe.NotasFiscais.Items[0]
    .NFe.dest.enderDest.UF;
  FrmCadCte.qryCTE_MFK_DESTINATARIO.Value := qryNotaID_CLIENTE.Value;
  FrmCadCte.qryCTE_MCODMUNINI.Value := dados.qryEmpresaID_CIDADE.Value;
  FrmCadCte.qryCTE_MCODMUNFIM.Value := ACBrNFe.NotasFiscais.Items[0]
    .NFe.dest.enderDest.cMun;
  FrmCadCte.qryCTE_MMUNICIPIOINI.Value := dados.qryEmpresaCIDADE.Value;
  FrmCadCte.qryCTE_MMINICIPIOFIM.Value := ACBrNFe.NotasFiscais.Items[0]
    .NFe.dest.enderDest.xMun;

  pesob := 0;
  pesol := 0;

  for n := 0 to ACBrNFe.NotasFiscais.Items[0].NFe.Transp.Vol.Count - 1 do
  begin
    pesob := pesob + ACBrNFe.NotasFiscais.Items[0].NFe.Transp.Vol.Items
      [0].pesob;
    pesol := pesol + ACBrNFe.NotasFiscais.Items[0].NFe.Transp.Vol.Items
      [0].pesol;
  end;

  FrmCadCte.qryCTE_MRECEBIDO.Value := 0;
  FrmCadCte.qryCTE_MVALOR_CARGA.Value := ACBrNFe.NotasFiscais.Items[0]
    .NFe.Total.ICMSTot.vNF;
  FrmCadCte.qryCTE_MVALOR_SERVICO.Value := 0;
  FrmCadCte.qryCTE_MMETRAGEM.Value := 'M3';
  if FrmCadCte.qryCTE_M.State in [dsInsert, dsEdit] then
    FrmCadCte.qryCTE_M.Post;
  dados.Conexao.CommitRetaining;

  // insere itens cte

  FrmCadCte.qryCTE_D.Append;
  FrmCadCte.qryCTE_DFK_CTE_MASTER.Value := FrmCadCte.qryCTE_MCODIGO.Value;
  FrmCadCte.qryCTE_DCODIGO.AsFloat := dados.Numerador('CTE_DETALHE', 'CODIGO',
    'N', '', '');
  FrmCadCte.qryCTE_DCHAVE.Value :=
    copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 100);
  FrmCadCte.qryCTE_DNUMERO.Value := ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF;
  FrmCadCte.qryCTE_DFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
  for n := 0 to ACBrNFe.NotasFiscais.Count - 1 do
  begin
    with ACBrNFe.NotasFiscais.Items[n].NFe do
    begin
      for i := 0 to Det.Count - 1 do
      begin
        with Det.Items[i] do
        begin
          FrmCadCte.qryCTE_DDESCRICAO.Value := Prod.xProd;
        end;
      end;
    end;
  end;

  FrmCadCte.qryCTE_DPRECO.Value := ACBrNFe.NotasFiscais.Items[0]
    .NFe.Total.ICMSTot.vNF;
  FrmCadCte.qryCTE_D.Post;

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Clear;
  dados.qryconsulta.sql.add
    ('select sum(cte.total)valor , sum(cte.qtd) qtd from cte_detalhe CTE');
  dados.qryconsulta.sql.add('where');
  dados.qryconsulta.sql.add('cte.fk_cte_master=:id');
  dados.qryconsulta.Params[0].Value := FrmCadCte.qryCTE_MCODIGO.Value;
  dados.qryconsulta.Open;

  if not(FrmCadCte.qryCTE_M.State in [dsInsert, dsEdit]) then
    FrmCadCte.qryCTE_M.Edit;
  FrmCadCte.qryCTE_MVALOR_CARGA.Value := dados.qryconsulta.Fields[0].AsFloat;
  FrmCadCte.qryCTE_MQTD.Value := dados.qryconsulta.Fields[1].AsFloat;
  FrmCadCte.qryCTE_MMETRAGEM.Value := 'M3';
  FrmCadCte.qryCTE_M.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmImportarCTe.btnNFCeClick(Sender: TObject);
begin

  if not chkLerXml.Checked then
    ImportaNFe(0, 0)
  else
    ImportaXml('');
  Close;
end;

procedure TfrmImportarCTe.btnPesqClick(Sender: TObject);
begin
  try
    Abrir.Execute;
    edtCaminho.Text := Abrir.FileName;
  except
    raise Exception.Create('Erro ao carragar arquivo XML!');
  end;
end;

procedure TfrmImportarCTe.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarCTe.chkLerXmlClick(Sender: TObject);
begin
  case chkLerXml.Checked of
    true:
      begin
        cbEmpresa.Visible := false;
        edtCaminho.Visible := true;
        edtNumero.Visible := false;
        Label3.Visible := false;
        Label2.Caption := 'Caminho';
        btnPesq.Visible := true;
      end;
    false:
      begin
        cbEmpresa.Visible := true;
        edtCaminho.Visible := false;
        edtNumero.Visible := true;
        Label3.Visible := true;
        Label2.Caption := 'Empresa';
        btnPesq.Visible := false;
      end;
  end;
end;

procedure TfrmImportarCTe.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmImportarCTe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnNFCe.Click;
  if Key = VK_ESCAPE then
    btnSairClick(self);
end;

procedure TfrmImportarCTe.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := dados.qryEmpresaCODIGO.Value;
end;

end.
