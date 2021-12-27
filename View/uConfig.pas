unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrUtil, blcksock,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  pcnConversao, Printers, ACBrDevice, ACBrPosPrinter,
  Vcl.ComCtrls, Vcl.DBCtrls, Data.DB, ACBrSATClass,
  Vcl.Mask, Vcl.ExtDlgs, ShellAPI, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DBCtrlsEh, ACBrBase, ACBrDFe, ACBrNFe, IdBaseComponent,
  IdComponent, IdIPWatch, Vcl.Imaging.GIFImg, DBGridEh, DBLookupEh, ACBrECF,
  ACBrBarCode, ACBrETQ;

type
  TfrmConfig = class(TForm)
    Panel1: TPanel;
    lblColaborador: TLabel;
    lblPatrocinador: TLabel;
    lblDoar1: TLabel;
    lblDoar2: TLabel;
    PageControl1: TPageControl;
    dsConfig: TDataSource;
    Panel2: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    dsEmitente: TDataSource;
    ACBrNFe1: TACBrNFe;
    TabSheet2: TTabSheet;
    rgTipoAmb: TDBRadioGroup;
    Label6: TLabel;
    DBComboBoxEh4: TDBComboBoxEh;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    TabSheet6: TTabSheet;
    Label43: TLabel;
    cbSSLLib: TDBComboBoxEh;
    Label2: TLabel;
    edtSenha: TDBEdit;
    Label25: TLabel;
    edtNumSerie: TDBEdit;
    Label33: TLabel;
    edtIdToken: TDBEdit;
    Label34: TLabel;
    edtToken: TDBEdit;
    Button1: TButton;
    cbXmlSignLib: TDBComboBoxEh;
    Label10: TLabel;
    sbtnGetCert: TSpeedButton;
    cbHttpLib: TDBComboBoxEh;
    Label9: TLabel;
    cbCryptLib: TDBComboBoxEh;
    Label8: TLabel;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    edtPahArquivoNFe: TDBEdit;
    edtPathSchema_NFe: TDBEdit;
    DBComboBoxEh6: TDBComboBoxEh;
    TabSheet8: TTabSheet;
    SpeedButton4: TSpeedButton;
    Label45: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    edtPathEnviada_NFe: TDBEdit;
    edtCancelamento_nfe: TDBEdit;
    EdtPathCCe_NFe: TDBEdit;
    edtPathInutilizacao_NFe: TDBEdit;
    edtPathDec_NFe: TDBEdit;
    edtPathEvento_NFe: TDBEdit;
    edtPathPDF_NFe: TDBEdit;
    TabSheet1: TTabSheet;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    Label42: TLabel;
    sbtnPathSalvar: TSpeedButton;
    spPathSchemas: TSpeedButton;
    Label19: TLabel;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    edtFormatoAlerta: TDBEdit;
    edtPathLogs: TDBEdit;
    edtPathSchemas: TDBEdit;
    cbxAtualizarXML: TDBCheckBox;
    cbxExibirErroSchema: TDBCheckBox;
    cbxRetirarAcentos: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBEdit13: TDBEdit;
    DBComboBoxEh2: TDBComboBoxEh;
    edtLogoMarca: TDBEdit;
    TabSheet13: TTabSheet;
    sbPathInu: TSpeedButton;
    Label35: TLabel;
    Label39: TLabel;
    Label46: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label12: TLabel;
    Label47: TLabel;
    sbPathPDF: TSpeedButton;
    sbPathEvento: TSpeedButton;
    sbPathDPEC: TSpeedButton;
    sbPathCCe: TSpeedButton;
    sbPathCan: TSpeedButton;
    sbPathNFe: TSpeedButton;
    edtPathNFe: TDBEdit;
    edtPathCan: TDBEdit;
    edtPathCCe: TDBEdit;
    edtPathInu: TDBEdit;
    edtPathDPEC: TDBEdit;
    edtPathEvento: TDBEdit;
    edtPathPDF: TDBEdit;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    Label30: TLabel;
    DBEdit7: TDBEdit;
    TabCTe: TTabSheet;
    Label44: TLabel;
    DBEdit8: TDBEdit;
    Label54: TLabel;
    edtPathCteEnviada: TDBEdit;
    btnCteEnviada: TSpeedButton;
    Label56: TLabel;
    edtPathCTeCC: TDBEdit;
    btnCteCCe: TSpeedButton;
    Label57: TLabel;
    EdtPatCTeInutiliza: TDBEdit;
    btnCteInutiliza: TSpeedButton;
    Label58: TLabel;
    EdtPathCTeEvento: TDBEdit;
    btnCteEvento: TSpeedButton;
    Label59: TLabel;
    edtPathCTePDF: TDBEdit;
    btnCtePDF: TSpeedButton;
    Label55: TLabel;
    edtPathCteSchema: TDBEdit;
    btnCteShema: TSpeedButton;
    Label60: TLabel;
    DBComboBoxEh5: TDBComboBoxEh;
    DBComboBoxEh7: TDBComboBoxEh;
    Label61: TLabel;
    DBComboBoxEh8: TDBComboBoxEh;
    Label62: TLabel;
    Label64: TLabel;
    DBComboBoxEh10: TDBComboBoxEh;
    Label65: TLabel;
    DBComboBoxEh11: TDBComboBoxEh;
    Label63: TLabel;
    DBComboBoxEh9: TDBComboBoxEh;
    Panel3: TPanel;
    Label69: TLabel;
    dsEmpresa: TDataSource;
    dsSped: TDataSource;
    TabSheet10: TTabSheet;
    TabSheet9: TTabSheet;
    lblPerfil: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    DBComboBoxEh14: TDBComboBoxEh;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBComboBoxEh17: TDBComboBoxEh;
    DBComboBoxEh18: TDBComboBoxEh;
    DBComboBoxEh19: TDBComboBoxEh;
    DBComboBoxEh20: TDBComboBoxEh;
    DBComboBoxEh16: TDBComboBoxEh;
    DBComboBoxEh15: TDBComboBoxEh;
    Balança: TTabSheet;
    Image1: TImage;
    Label66: TLabel;
    DBComboBoxEh12: TDBComboBoxEh;
    Label76: TLabel;
    edtPathMdfe: TDBEdit;
    btnPathMdfe: TSpeedButton;
    Label77: TLabel;
    edtPathEventoMDFe: TDBEdit;
    btnPathMdfeEvento: TSpeedButton;
    Label78: TLabel;
    edtPathSalvarMDFe: TDBEdit;
    edtPathEventoSalvar: TSpeedButton;
    edtPathSchemaMDFe: TSpeedButton;
    edPathSchemaMdfe: TDBEdit;
    Label79: TLabel;
    DBComboBoxEh21: TDBComboBoxEh;
    Label81: TLabel;
    edtPathPDFMDFe: TDBEdit;
    Label80: TLabel;
    btnPathMdfePDF: TSpeedButton;
    edtEmp: TDBEdit;
    Label82: TLabel;
    DBComboBoxEh22: TDBComboBoxEh;
    Label90: TLabel;
    DBEdit11: TDBEdit;
    sbtnCaminhoCert: TSpeedButton;
    dsEtiqueta: TDataSource;
    Label67: TLabel;
    DBEdit9: TDBEdit;
    ACBrECF1: TACBrECF;
    dsCampos: TDataSource;
    OpenDialog1: TOpenDialog;
    dsSistema: TDataSource;
    TabEtiquetas: TTabSheet;
    PageEtiquetas: TPageControl;
    TabSheet16: TTabSheet;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    TabSheet17: TTabSheet;
    Label95: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label96: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    DBEdit15: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    cbPorta: TDBComboBox;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    DBEdit16: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    BtnGravaEtq: TButton;
    Button4: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    ACBrBarCode1: TACBrBarCode;
    Panel7: TPanel;
    lbl9: TLabel;
    lbl8: TLabel;
    lbl7: TLabel;
    lbl6: TLabel;
    lbl10: TLabel;
    ACBrBarCode2: TACBrBarCode;
    Panel8: TPanel;
    lbl14: TLabel;
    lbl13: TLabel;
    lbl12: TLabel;
    lbl11: TLabel;
    lbl15: TLabel;
    ACBrBarCode3: TACBrBarCode;
    btnImprimir: TButton;
    ACBrETQ: TACBrETQ;
    cbDPI: TDBComboBox;
    cbBackFeed: TDBComboBox;
    cbModelo: TDBComboBox;
    TabSheet21: TTabSheet;
    Label83: TLabel;
    DBEdit35: TDBEdit;
    Label94: TLabel;
    DBEdit36: TDBEdit;
    Label124: TLabel;
    edtCfeVenda: TDBEdit;
    Label125: TLabel;
    edtCfeEnvio: TDBEdit;
    Label126: TLabel;
    edtCfePDF: TDBEdit;
    Label130: TLabel;
    edtCfeCanc: TDBEdit;
    btnCFeCanc: TSpeedButton;
    btnCFeVenda: TSpeedButton;
    btnCFeEnvio: TSpeedButton;
    btnCFePDF: TSpeedButton;
    Label29: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    TIPO_APLICATIVO: TDBRadioGroup;
    GroupBox4: TGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    WS_PROXY_HOST: TDBEdit;
    WS_PROXY_PORTA: TDBEdit;
    WS_PROXY_USUARIO: TDBEdit;
    WS_PROXY_SENHA: TDBEdit;
    TabSheet22: TTabSheet;
    edtChaveMFe: TDBEdit;
    Label123: TLabel;
    Label127: TLabel;
    edtMFeEntrada: TDBEdit;
    btnMFeEntrada: TSpeedButton;
    Label128: TLabel;
    edtMFeSaida: TDBEdit;
    btnMFeSaida: TSpeedButton;
    Label129: TLabel;
    edtCFeShemas: TDBEdit;
    btnCFeSchemas: TSpeedButton;
    dsIdiomas: TDataSource;
    Label139: TLabel;
    DBEdit39: TDBEdit;
    TabSheet5: TTabSheet;
    Label3: TLabel;
    edtSmtpHost: TDBEdit;
    edtSmtpPort: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtSmtpUser: TDBEdit;
    DBEdit10: TDBEdit;
    Label26: TLabel;
    chkSSL: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label1: TLabel;
    DBEdit4: TDBEdit;
    TabSheet11: TTabSheet;
    PageControl6: TPageControl;
    TabSheet20: TTabSheet;
    Label111: TLabel;
    Button3: TButton;
    edtServidor: TEdit;
    GroupBox2: TGroupBox;
    Label115: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    edtDataBase_Li: TEdit;
    edtSenha_LI: TEdit;
    edtUsuario_LI: TEdit;
    GroupBox1: TGroupBox;
    Label112: TLabel;
    Label114: TLabel;
    Label113: TLabel;
    edtUsuario_APP: TEdit;
    edtSenha_APP: TEdit;
    edtDataBase_APP: TEdit;
    TabSheet15: TTabSheet;
    Label93: TLabel;
    edtFTP_Caminho: TEdit;
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathCCeClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbPathPDFClick(Sender: TObject);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btnCteEnviadaClick(Sender: TObject);
    procedure btnCteCCeClick(Sender: TObject);
    procedure btnCteInutilizaClick(Sender: TObject);
    procedure btnCteEventoClick(Sender: TObject);
    procedure btnCtePDFClick(Sender: TObject);
    procedure btnCteShemaClick(Sender: TObject);
    procedure DBComboBoxEh15Exit(Sender: TObject);
    procedure btnPathMdfeClick(Sender: TObject);
    procedure btnPathMdfeEventoClick(Sender: TObject);
    procedure edtPathEventoSalvarClick(Sender: TObject);
    procedure edtPathSchemaMDFeClick(Sender: TObject);
    procedure btnPathMdfePDFClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsEtiquetaDataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure BtnGravaEtqClick(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btnCFeCancClick(Sender: TObject);
    procedure btnCFeVendaClick(Sender: TObject);
    procedure btnCFeEnvioClick(Sender: TObject);
    procedure btnCFePDFClick(Sender: TObject);
    procedure cbSSLLibExit(Sender: TObject);
    procedure btnCFeSchemasClick(Sender: TObject);
    procedure btnMFeEntradaClick(Sender: TObject);
    procedure btnMFeSaidaClick(Sender: TObject);
    procedure DBComboBox9Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    ncopias: string;
    procedure PathClick(Sender: TObject);
    function Getcomputer: String;
    procedure AtualizaSSLLibsCombo;
    procedure ConfiguraCTe;
    procedure ConfiguraEtiqueta;
    procedure Coluna01;
    procedure Coluna02;
    procedure Coluna03;
    procedure AtivarACBrETQ;
    procedure EtiquetaSimples(MultiV, MultiH, Linha, Coluna: Integer;
      Fontes, Texto, Tipo: string; LarguraBarraLarga, LarguraBarraFina,
      AlturaBarra: Integer);
    procedure CarregaDevice;
    procedure GravaLicenca;
    procedure LeLicenca;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

uses strutils, math, TypInfo, DateUtils, synacode, pcnNFe,
  pcnConversaoNFe, ACBrDFeConfiguracoes, pcnAuxiliar, ACBrDFeSSL, pcnNFeRTXT,
  FileCtrl, Udados, uDadosWeb;

const
  SELDIRHELP = 1000;

{$R *.dfm}

procedure TfrmConfig.sbPathCanClick(Sender: TObject);
begin
  PathClick(edtPathCan);
end;

procedure TfrmConfig.sbPathCCeClick(Sender: TObject);
begin
  PathClick(edtPathCCe);
end;

procedure TfrmConfig.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edtPathDPEC);
end;

procedure TfrmConfig.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure TfrmConfig.sbPathInuClick(Sender: TObject);
begin
  PathClick(edtPathInu);
end;

procedure TfrmConfig.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edtPathNFe);
end;

procedure TfrmConfig.sbPathPDFClick(Sender: TObject);
begin
  PathClick(edtPathPDF);
end;

procedure TfrmConfig.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter :=
    'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    if not(Dados.qryConfig.State in dsEditModes) then
      Dados.qryConfig.Edit;
    Dados.qryConfigCAMINHO_CERTIFICADO.Value := OpenDialog1.FileName;
  end;
end;

procedure TfrmConfig.sbtnGetCertClick(Sender: TObject);
begin
  ACBrNFe1.Configuracoes.Geral.SSLLib :=
    TSSLLib(Dados.qryConfigTIPO_EMISSAO.Value);
  ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=
    TSSLCryptLib(Dados.qryConfigCRYPTLIB.AsInteger);
  ACBrNFe1.Configuracoes.Geral.SSLHttpLib :=
    TSSLHttpLib(Dados.qryConfigHTTPLIB.AsInteger);
  ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(Dados.qryConfigXMLSIGN.AsInteger);
  edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
end;

procedure TfrmConfig.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter :=
    'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtLogoMarca.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmConfig.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure TfrmConfig.SpeedButton10Click(Sender: TObject);
begin
  PathClick(edtPathEnviada_NFe);
end;

procedure TfrmConfig.btnPathMdfeEventoClick(Sender: TObject);
begin
  PathClick(edtPathEventoMDFe);
end;

procedure TfrmConfig.btnPathMdfePDFClick(Sender: TObject);
begin
  PathClick(edtPathPDFMDFe);
end;

procedure TfrmConfig.SpeedButton1Click(Sender: TObject);
begin
  PathClick(edtPahArquivoNFe);
end;

procedure TfrmConfig.SpeedButton2Click(Sender: TObject);
begin
  PathClick(edtPathSchema_NFe);
end;

procedure TfrmConfig.SpeedButton4Click(Sender: TObject);
begin
  PathClick(edtPathInutilizacao_NFe);
end;

procedure TfrmConfig.SpeedButton5Click(Sender: TObject);
begin
  PathClick(edtPathPDF_NFe);
end;

procedure TfrmConfig.SpeedButton6Click(Sender: TObject);
begin
  PathClick(edtPathEvento_NFe);
end;

procedure TfrmConfig.SpeedButton7Click(Sender: TObject);
begin
  PathClick(edtPathDec_NFe);
end;

procedure TfrmConfig.SpeedButton8Click(Sender: TObject);
begin
  PathClick(EdtPathCCe_NFe);
end;

procedure TfrmConfig.SpeedButton9Click(Sender: TObject);
begin
  PathClick(edtCancelamento_nfe);
end;

procedure TfrmConfig.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TfrmConfig.bbAlterarClick(Sender: TObject);
begin
  Dados.qryEtiqueta.Edit;
  PageEtiquetas.ActivePageIndex := 1;
end;

procedure TfrmConfig.bbNovoClick(Sender: TObject);
begin
  Dados.qryEtiqueta.Insert;
  Dados.qryEtiquetaCODIGO.Value := Dados.Numerador('ETIQUETAS', 'CODIGO',
    'N', '', '');
  Dados.qryEtiquetaLARGURA.AsFloat := 0;
  Dados.qryEtiquetaALTURA.AsFloat := 0;
  Dados.qryEtiquetaESQUERDA.AsFloat := 0;
  Dados.qryEtiquetaTOPO.AsFloat := 0;
  Dados.qryEtiquetaCOLUNAS.AsFloat := 0;
  Dados.qryEtiquetaESPACAMENTO.AsFloat := 0;
  Dados.qryEtiquetaBARRA_ALTURA.AsFloat := 0;
  Dados.qryEtiquetaBARRA_LARGURA.AsFloat := 0;
  Dados.qryEtiquetaBARRA_FINA.AsFloat := 0;
  PageEtiquetas.ActivePageIndex := 1;
end;

procedure TfrmConfig.btnCFeCancClick(Sender: TObject);
begin
  PathClick(edtCfeCanc);
end;

procedure TfrmConfig.btnCFeEnvioClick(Sender: TObject);
begin
  PathClick(edtCfeEnvio);
end;

procedure TfrmConfig.btnCFePDFClick(Sender: TObject);
begin
  PathClick(edtCfePDF);
end;

procedure TfrmConfig.btnCFeSchemasClick(Sender: TObject);
begin
  PathClick(edtCFeShemas);
end;

procedure TfrmConfig.btnCFeVendaClick(Sender: TObject);
begin
  PathClick(edtCfeVenda);
end;

procedure TfrmConfig.btnCteCCeClick(Sender: TObject);
begin
  PathClick(edtPathCTeCC);
end;

procedure TfrmConfig.btnCteEnviadaClick(Sender: TObject);
begin
  PathClick(edtPathCteEnviada);
end;

procedure TfrmConfig.btnCteEventoClick(Sender: TObject);
begin
  PathClick(EdtPathCTeEvento);
end;

procedure TfrmConfig.btnCteInutilizaClick(Sender: TObject);
begin
  PathClick(EdtPatCTeInutiliza);
end;

procedure TfrmConfig.btnCtePDFClick(Sender: TObject);
begin
  PathClick(edtPathCTePDF);
end;

procedure TfrmConfig.btnCteShemaClick(Sender: TObject);
begin
  PathClick(edtPathCteSchema);
end;

procedure TfrmConfig.btnGravarClick(Sender: TObject);
begin

  if Dados.qryConfig.State in [dsinsert, dsedit] then
    Dados.qryConfig.Post;

  if Dados.qryParametro.State in [dsinsert, dsedit] then
    Dados.qryParametro.Post;

  if Dados.qrySped_Config.State in [dsinsert, dsedit] then
    Dados.qrySped_Config.Post;

  BtnGravaEtq.Click;

  GravaLicenca;

  Dados.Conexao.CommitRetaining;

  Close;
end;

procedure TfrmConfig.AtivarACBrETQ;
begin
  with ACBrETQ do
  begin
    Desativar;

    DPI := TACBrETQDPI(cbDPI.ItemIndex);
    Modelo := TACBrETQModelo(cbModelo.ItemIndex);
    Porta := cbPorta.Text;
    LimparMemoria := true;
    Temperatura := 15;
    Velocidade := -1;
    BackFeed := TACBrETQBackFeed(cbBackFeed.ItemIndex);
    Unidade := etqMilimetros;

    Ativar;
  end;
end;

procedure TfrmConfig.EtiquetaSimples(MultiV, MultiH, Linha, Coluna: Integer;
  Fontes, Texto, Tipo: string; LarguraBarraLarga, LarguraBarraFina,
  AlturaBarra: Integer);
begin
  with ACBrETQ do
  begin
    if Modelo in [etqPpla, etqPplb] then
    begin
      if Tipo = 'TEXTOA' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto,
          0, false);
      if Tipo = 'TEXTOB' then
        ImprimirTexto(orNormal, StrToIntDef(Fontes, 2), MultiH, MultiV, Linha,
          Coluna, Texto);
      if Tipo = 'BARRA' then
        ImprimirBarras(orNormal, barEAN13, LarguraBarraLarga, LarguraBarraFina,
          Linha, Coluna, Texto, AlturaBarra, becSIM);
    end
    else
    // if Modelo = etqZPLII then
    begin
      if Tipo = 'TEXTOA' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto,
          0, false);
      if Tipo = 'TEXTOB' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto);

      if Tipo = 'BARRA' then
        ImprimirBarras(orNormal, barEAN13, LarguraBarraLarga, LarguraBarraFina,
          Linha, Coluna, Texto, AlturaBarra, becSIM);

    end;
  end;
end;

procedure TfrmConfig.btnImprimirClick(Sender: TObject);
var
  Texto: string;
  Fator: Integer;
begin
  ncopias := InputBox('Informe o numero de cópias', 'Quantidade', '1');

  AtivarACBrETQ;

  if Panel6.Visible then // imprime 1 coluna
  begin
    Fator := 0;

    if lbl1.Visible then
    begin // codigo
      Dados.qryEtq_Campos.First;
      if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
        EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
          Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
          Dados.qryEtq_CamposFONTES.AsString, lbl1.Caption, 'TEXTOA', 0, 0, 0)
    end;

    if lbl2.Visible then
    begin // Descrição
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl2.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl3.Visible then
    begin // quantidade
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl3.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl4.Visible then
    begin // preço
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl4.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl5.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl5.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if ACBrBarCode1.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, '9788543105932', 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
  end;

  if Panel7.Visible then // imprime 2 colunas
  begin
    Fator := Dados.qryEtiquetaLARGURA.AsInteger;
    if lbl6.Visible then
    begin // codigo
      Dados.qryEtq_Campos.First;
      if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
        EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
          Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
          Dados.qryEtq_CamposFONTES.AsString, lbl6.Caption, 'TEXTOA', 0, 0, 0)
    end;

    if lbl7.Visible then
    begin // Descrição
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl7.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl8.Visible then
    begin // quantidade
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl8.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl9.Visible then
    begin // preço
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl9.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl10.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl10.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if ACBrBarCode2.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, '9788543105933', 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
  end;

  if Panel8.Visible then // imprime 3 colunas
  begin
    Fator := Dados.qryEtiquetaLARGURA.AsInteger * 2;
    if lbl11.Visible then
    begin // codigo
      Dados.qryEtq_Campos.First;
      if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
        EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
          Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
          Dados.qryEtq_CamposFONTES.AsString, lbl11.Caption, 'TEXTOA', 0, 0, 0)
    end;

    if lbl12.Visible then
    begin // Descrição
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl12.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl13.Visible then
    begin // quantidade
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl13.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl14.Visible then
    begin // preço
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl14.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if lbl15.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, lbl15.Caption, 'TEXTOB', 0, 0, 0);
    end;

    if ACBrBarCode2.Visible then
    begin // referencia
      if not Dados.qryEtq_Campos.eof then
        Dados.qryEtq_Campos.Next;
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, '9788543105933', 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
  end;

  ACBrETQ.Imprimir(StrToIntDef(ncopias, 1), 0);;
  ACBrETQ.Desativar;

  // AbreTabela;

end;

procedure TfrmConfig.btnMFeEntradaClick(Sender: TObject);
begin
  PathClick(edtMFeEntrada);
end;

procedure TfrmConfig.btnMFeSaidaClick(Sender: TObject);
begin
  PathClick(edtMFeSaida);
end;

procedure TfrmConfig.btnPathMdfeClick(Sender: TObject);
begin
  PathClick(edtPathMdfe);
end;

procedure TfrmConfig.btnSairClick(Sender: TObject);
begin
  if application.messageBox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_YesNo) = mrYes then
    Close;
end;

procedure TfrmConfig.Button1Click(Sender: TObject);
begin

  if Dados.qryConfig.State in dsEditModes then
    Dados.qryConfig.Post;
  Dados.Conexao.CommitRetaining;

  Dados.qryConfig.Refresh;

  if trim(Dados.qryConfigCAMINHO_CERTIFICADO.Value) <> '' then
    ACBrNFe1.Configuracoes.Certificados.ArquivoPFX :=
      Dados.qryConfigCAMINHO_CERTIFICADO.Value;

  if trim(Dados.qryConfigNUMEROSERIECERTFICADO.Value) <> '' then
    ACBrNFe1.Configuracoes.Certificados.NumeroSerie :=
      Dados.qryConfigNUMEROSERIECERTFICADO.Value;

  if trim(Dados.qryConfigSENHACERTIFICADO.Value) <> '' then
    ACBrNFe1.Configuracoes.Certificados.Senha :=
      Dados.qryConfigSENHACERTIFICADO.Value;

  ACBrNFe1.Configuracoes.Geral.SSLLib :=
    TSSLLib(Dados.qryConfigTIPO_EMISSAO.Value);

  ACBrNFe1.Configuracoes.Geral.SSLCryptLib :=
    TSSLCryptLib(Dados.qryConfigCRYPTLIB.AsInteger);

  ACBrNFe1.Configuracoes.Geral.SSLHttpLib :=
    TSSLHttpLib(Dados.qryConfigHTTPLIB.AsInteger);

  ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(Dados.qryConfigXMLSIGN.AsInteger);

  ACBrNFe1.SSL.NumeroSerie := Dados.qryConfigNUMEROSERIECERTFICADO.Value;

  ACBrNFe1.SSL.CarregarCertificado;

  ShowMessage(FormatDateBr(ACBrNFe1.SSL.CertDataVenc));
end;

procedure TfrmConfig.Button2Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.*';
  OpenDialog1.Filter := 'PNG|*.png';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  OpenDialog1.Execute;
  if OpenDialog1.FileName <> '' then
  begin
    if not(Dados.qryParametro.State in dsEditModes) then
      Dados.qryParametro.Edit;
    Dados.qryParametroTELA_ABERTURA.Value := OpenDialog1.FileName;
  end;
end;

procedure TfrmConfig.GravaLicenca;
begin
  if not(Dados.qryParametro.State in dsEditModes) then
    Dados.qryParametro.Edit;
  try
    Dados.qryParametroSERVIDOR_APP.Value := edtServidor.Text;
    Dados.qryParametroFTP_SERVIDOR.Value := edtFTP_Caminho.Text;
    Dados.qryParametroUSUARIO_APP.Value :=
      Dados.Crypt('C', edtUsuario_APP.Text);
    Dados.qryParametroSENHA_APP.Value := Dados.Crypt('C', edtSenha_APP.Text);
    Dados.qryParametroDATABASE_APP.Value :=
      Dados.Crypt('C', edtDataBase_APP.Text);

    Dados.qryParametroUSUARIO_LI.Value := Dados.Crypt('C', edtUsuario_LI.Text);
    Dados.qryParametroSENHA_LI.Value := Dados.Crypt('C', edtSenha_LI.Text);
    Dados.qryParametroDATABASE_LI.Value :=
      Dados.Crypt('C', edtDataBase_Li.Text);
  except
    Dados.qryParametroSENHA_APP.Clear;
    Dados.qryParametroDATABASE_APP.Clear;
    Dados.qryParametroUSUARIO_APP.Clear;

    Dados.qryParametroUSUARIO_LI.Clear;
    Dados.qryParametroSENHA_LI.Clear;
    Dados.qryParametroDATABASE_LI.Clear;

  end;
  Dados.qryParametro.Post;

end;

procedure TfrmConfig.LeLicenca;
begin
  try
    edtServidor.Text := Dados.qryParametroSERVIDOR_APP.Value;

    edtFTP_Caminho.Text := Dados.qryParametroFTP_SERVIDOR.Value;

    edtSenha_APP.Text := Dados.Crypt('D', Dados.qryParametroSENHA_APP.Value);

    edtSenha_LI.Text := Dados.Crypt('D', Dados.qryParametroSENHA_LI.Value);

    edtDataBase_APP.Text := Dados.Crypt('D',
      Dados.qryParametroDATABASE_APP.Value);

    edtDataBase_Li.Text := Dados.Crypt('D',
      Dados.qryParametroDATABASE_LI.Value);

    edtUsuario_APP.Text := Dados.Crypt('D',
      Dados.qryParametroUSUARIO_APP.Value);

    edtUsuario_LI.Text := Dados.Crypt('D', Dados.qryParametroUSUARIO_LI.Value);

  Except
    edtSenha_APP.Text := '';
    edtSenha_LI.Text := '';
    edtDataBase_APP.Text := '';
    edtDataBase_Li.Text := '';
    edtUsuario_APP.Text := '';
    edtUsuario_LI.Text := '';
  end;

end;

procedure TfrmConfig.Button3Click(Sender: TObject);
begin
  with dadosweb do
  begin
    MysqlAPP.VendorLib := ExtractFilePath(application.ExeName) + 'libmysql.dll';
    MysqlChave.VendorLib := ExtractFilePath(application.ExeName) +
      'libmysql.dll';

    ConexaoAPP.Params.Values['Server'] := edtServidor.Text;

    ConexaoAPP.Params.Values['Database'] := edtDataBase_APP.Text;
    ConexaoAPP.Params.Values['User_Name'] := edtUsuario_APP.Text;
    ConexaoAPP.Params.Values['Password'] := edtSenha_APP.Text;

    ConexaoChave.Params.Values['Server'] := edtServidor.Text;

    ConexaoChave.Params.Values['Database'] := edtDataBase_Li.Text;
    ConexaoChave.Params.Values['User_Name'] := edtUsuario_LI.Text;
    ConexaoChave.Params.Values['Password'] := edtSenha_LI.Text;

    dadosweb.ConexaoAPP.Close;
    dadosweb.ConexaoAPP.Open;
    if dadosweb.ConexaoAPP.Connected then
    begin
      ShowMessage('Conexão APP ok!');
    end
    else
      ShowMessage('Erro Conexão APP!');

    dadosweb.ConexaoChave.Close;
    dadosweb.ConexaoChave.Open;
    if dadosweb.ConexaoChave.Connected then
    begin
      ShowMessage('Conexão Servidor ok!');
    end
    else
      ShowMessage('Erro Conexão Servidor!');
  end;

end;

procedure TfrmConfig.Coluna01;
begin
  Panel6.Visible := true;
  Panel6.Width := Dados.qryEtiquetaLARGURA.AsInteger * 3;
  Panel6.Height := Dados.qryEtiquetaALTURA.AsInteger;
  Panel6.Left := Dados.qryEtiquetaESQUERDA.AsInteger;
  Panel6.Top := Dados.qryEtiquetaTOPO.AsInteger;

  ACBrBarCode1.Height := Dados.qryEtiquetaBARRA_ALTURA.AsInteger * 5;
  ACBrBarCode1.Width := Dados.qryEtiquetaBARRA_LARGURA.AsInteger * 40;

  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.eof do
  begin
    case Dados.qryEtq_Campos.RecNo of
      1:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl1.Visible := true;
            lbl1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl1.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode1.Visible := true;
            ACBrBarCode1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      2:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl2.Visible := true;
            lbl2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl2.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode1.Visible := true;
            ACBrBarCode1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      3:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl3.Visible := true;
            lbl3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl3.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode1.Visible := true;
            ACBrBarCode1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      4:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl4.Visible := true;
            lbl4.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl4.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl4.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode1.Visible := true;
            ACBrBarCode1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      5:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl5.Visible := true;
            lbl5.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl5.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl5.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode1.Visible := true;
            ACBrBarCode1.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode1.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
    end;
    Dados.qryEtq_Campos.Next;
    Panel6.Repaint;
    application.ProcessMessages;
  end;
end;

procedure TfrmConfig.Coluna02;
begin
  Panel7.Visible := true;
  Panel7.Width := Dados.qryEtiquetaLARGURA.AsInteger * 3;
  Panel7.Height := Dados.qryEtiquetaALTURA.AsInteger;
  Panel7.Left := Panel6.Left + Panel6.Width +
    Dados.qryEtiquetaESQUERDA.AsInteger;
  Panel7.Top := Dados.qryEtiquetaTOPO.AsInteger;

  ACBrBarCode2.Height := Dados.qryEtiquetaBARRA_ALTURA.AsInteger * 5;
  ACBrBarCode2.Width := Dados.qryEtiquetaBARRA_LARGURA.AsInteger * 40;

  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.eof do
  begin
    case Dados.qryEtq_Campos.RecNo of
      1:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl6.Visible := true;
            lbl6.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl6.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl6.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode2.Visible := true;
            ACBrBarCode2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      2:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl7.Visible := true;
            lbl7.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl7.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl7.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode2.Visible := true;
            ACBrBarCode2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      3:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl8.Visible := true;
            lbl8.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl8.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl8.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode2.Visible := true;
            ACBrBarCode2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      4:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl9.Visible := true;
            lbl9.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl9.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl9.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode2.Visible := true;
            ACBrBarCode2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      5:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl10.Visible := true;
            lbl10.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl10.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl10.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode2.Visible := true;
            ACBrBarCode2.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode2.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
    end;
    Dados.qryEtq_Campos.Next;
    Panel7.Repaint;
    application.ProcessMessages;
  end;
end;

procedure TfrmConfig.Coluna03;
begin
  Panel8.Visible := true;
  Panel8.Width := Dados.qryEtiquetaLARGURA.AsInteger * 3;
  Panel8.Height := Dados.qryEtiquetaALTURA.AsInteger;
  Panel8.Left := Panel7.Left + Panel7.Width +
    Dados.qryEtiquetaESQUERDA.AsInteger;
  Panel8.Top := Dados.qryEtiquetaTOPO.AsInteger;

  ACBrBarCode3.Height := Dados.qryEtiquetaBARRA_ALTURA.AsInteger * 5;
  ACBrBarCode3.Width := Dados.qryEtiquetaBARRA_LARGURA.AsInteger * 40;

  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.eof do
  begin
    case Dados.qryEtq_Campos.RecNo of
      1:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl11.Visible := true;
            lbl11.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl11.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl11.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode3.Visible := true;
            ACBrBarCode3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      2:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl12.Visible := true;
            lbl12.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl12.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl12.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode3.Visible := true;
            ACBrBarCode3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      3:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl13.Visible := true;
            lbl13.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl13.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl13.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode3.Visible := true;
            ACBrBarCode3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      4:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl14.Visible := true;
            lbl14.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl14.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl14.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode3.Visible := true;
            ACBrBarCode3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
      5:
        begin
          if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
          begin
            lbl15.Visible := true;
            lbl15.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            lbl15.Top := Dados.qryEtq_CamposLINHA.Value * 5;
            lbl15.Font.Size := Dados.qryEtq_CamposFONTES.Value * 5;
          end
          else
          begin
            ACBrBarCode3.Visible := true;
            ACBrBarCode3.Left := Dados.qryEtq_CamposCOLUNA.Value * 5;
            ACBrBarCode3.Top := Dados.qryEtq_CamposLINHA.Value * 5;
          end;
        end;
    end;
    Dados.qryEtq_Campos.Next;
    Panel8.Repaint;
    application.ProcessMessages;
  end;
end;

procedure TfrmConfig.ConfiguraEtiqueta;
begin
  Panel6.Visible := false;
  Panel7.Visible := false;
  Panel8.Visible := false;

  lbl1.Visible := false;
  lbl2.Visible := false;
  lbl3.Visible := false;
  lbl4.Visible := false;
  lbl5.Visible := false;
  ACBrBarCode1.Visible := false;

  lbl6.Visible := false;
  lbl7.Visible := false;
  lbl8.Visible := false;
  lbl9.Visible := false;
  lbl10.Visible := false;
  ACBrBarCode2.Visible := false;

  lbl11.Visible := false;
  lbl12.Visible := false;
  lbl13.Visible := false;
  lbl14.Visible := false;
  lbl15.Visible := false;
  ACBrBarCode3.Visible := false;

  case Dados.qryEtiquetaCOLUNAS.Value of
    0 .. 1:
      begin
        Coluna01;

      end;
    2:
      begin
        Coluna01;
        Coluna02;
      end;
    3:
      begin
        Coluna01;
        Coluna02;
        Coluna03;
      end;
  end;
end;

procedure TfrmConfig.Button4Click(Sender: TObject);
begin
  if (Dados.qryEtiqueta.State in dsEditModes) then
    Dados.qryEtiqueta.Post;
  ConfiguraEtiqueta;
end;

procedure TfrmConfig.BtnGravaEtqClick(Sender: TObject);
begin
  if (Dados.qryEtiqueta.State in dsEditModes) then
    Dados.qryEtiqueta.Post;
  PageEtiquetas.ActivePageIndex := 0;
end;

procedure TfrmConfig.AtualizaSSLLibsCombo;
begin
  cbSSLLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLLib);
  cbCryptLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
  cbHttpLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
  cbXmlSignLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);

  // cbSSLType.Enabled := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]) ;
end;

procedure TfrmConfig.cbSSLLibChange(Sender: TObject);
begin
  if (Dados.qryConfig.State in dsEditModes) then
  begin
    try
      if cbSSLLib.ItemIndex <> -1 then
        ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
    finally
      AtualizaSSLLibsCombo;
    end;
  end;
end;

procedure TfrmConfig.cbSSLLibExit(Sender: TObject);
begin
  if Dados.qryConfig.State in dsEditModes then
    Dados.qryConfig.Edit;

  if Dados.qryConfigTIPO_EMISSAO.Value = 1 then
    Dados.qryConfigNUMEROSERIECERTFICADO.AsString := '';

  if Dados.qryConfigTIPO_EMISSAO.Value = 4 then
    Dados.qryConfigCAMINHO_CERTIFICADO.AsString := '';

end;

procedure TfrmConfig.cbXmlSignLibChange(Sender: TObject);
begin
  if (Dados.qryConfig.State in dsEditModes) then
  begin
    try
      if cbXmlSignLib.ItemIndex <> -1 then
        ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib :=
          TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
    finally
      AtualizaSSLLibsCombo;
    end;
  end;
end;

procedure TfrmConfig.DBComboBox9Change(Sender: TObject);
begin

  Dados.ConfiguraEstilo(Dados.qryParametroESTILO.Value);

end;

procedure TfrmConfig.DBComboBoxEh15Exit(Sender: TObject);
begin
  if DBComboBoxEh15.Text = 'LUCRO REAL' then // REAL
  begin
    Dados.qrySped_ConfigCOD_INC_TRIB.Value := '1';
    Dados.qrySped_ConfigIND_APRO_CRED.Value := '1';
    Dados.qrySped_ConfigCOD_TIPO_CONT.Value := '1';
    Dados.qrySped_ConfigIND_REG_CUM.Value := '9';
  end;

  if DBComboBoxEh15.Text = 'LUCRO PRESUMIDO' then // PRESUMIDO
  begin
    Dados.qrySped_ConfigCOD_INC_TRIB.Value := '2';
    Dados.qrySped_ConfigIND_APRO_CRED.Value := '';
    Dados.qrySped_ConfigCOD_TIPO_CONT.Value := '1';
    Dados.qrySped_ConfigIND_REG_CUM.Value := '2';
  end;
end;

procedure TfrmConfig.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'] then
    Key := #0;
end;

procedure TfrmConfig.DBGrid2DblClick(Sender: TObject);
begin
  bbAlterar.Click;
end;

procedure TfrmConfig.dsEtiquetaDataChange(Sender: TObject; Field: TField);
begin
  Dados.qryEtq_Campos.Close;
  Dados.qryEtq_Campos.Params[0].Value := Dados.qryEtiquetaCODIGO.Value;
  Dados.qryEtq_Campos.Open;
end;

procedure TfrmConfig.edtPathEventoSalvarClick(Sender: TObject);
begin
  PathClick(edtPathSalvarMDFe);
end;

procedure TfrmConfig.edtPathSchemaMDFeClick(Sender: TObject);
begin
  PathClick(edPathSchemaMdfe);
end;

function TfrmConfig.Getcomputer: String;
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TfrmConfig.ConfiguraCTe;
begin
  Dados.CriaPastas;
  if Dados.qryConfigCTE_SERIE.IsNull then
    Dados.qryConfigCTE_SERIE.Value := '1';

  if Dados.qryConfigVERSAO_CTE.IsNull then
    Dados.qryConfigVERSAO_CTE.Value := 1;

  if Dados.qryConfigMODELO_CTE.IsNull then
    Dados.qryConfigVERSAO_CTE.Value := 1;

  if Dados.qryConfigPATH_ENVIADAS_CTE.IsNull then
    Dados.qryConfigPATH_ENVIADAS_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'CTe\Enviadas');

  if Dados.qryConfigPATH_ENVIADAS_CTE.IsNull then
    Dados.qryConfigPATH_CCE_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'CTe\CCe');

  if Dados.qryConfigPATH_EVENTO_CTE.IsNull then
    Dados.qryConfigPATH_EVENTO_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'CTe\Eventos');

  if Dados.qryConfigPATH_INU_CTE.IsNull then
    Dados.qryConfigPATH_INU_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'CTe\Inutilizacao');

  if Dados.qryConfigPATH_PDF_CTE.IsNull then
    Dados.qryConfigPATH_PDF_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'CTe\PDF');

  if Dados.qryConfigPATH_SCHEMA_CTE.IsNull then
    Dados.qryConfigPATH_SCHEMA_CTE.Value :=
      (ExtractFilePath(application.ExeName) + 'Schemas\CTe');

end;

procedure TfrmConfig.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
var
  T: TSSLLib;
  i: TpcnTipoEmissao;
  J: TpcnModeloDF;
  K: TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
  PagCodigo: TACBrPosPaginaCodigo;
  Senha: string;
begin

  Dados.qryConfig.Close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  Dados.qrySped_Config.Close;
  Dados.qrySped_Config.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qrySped_Config.Open;

  Dados.qryParametro.Close;
  Dados.qryParametro.Open;

  if Dados.qryParametro.IsEmpty then
  begin
    Dados.qryParametro.Insert;
    Dados.qryParametroVERSAO.Value := 300;
  end
  else
    Dados.qryParametro.Edit;

  if Dados.qryConfig.IsEmpty then
  begin
    Dados.qryConfig.Insert;
  end
  else
  begin
    Dados.qryConfig.Edit;
    Senha := Dados.Crypt('D', Dados.qryConfigEMAILSENHA.Value);
    Dados.qryConfigEMAILSENHA.Value := Senha;
  end;

  if Dados.qrySped_Config.IsEmpty then
    Dados.qrySped_Config.Insert
  else
    Dados.qrySped_Config.Edit;

  PageControl1.ActivePageIndex := 0;

  Dados.CriaPastas;

  ConfiguraCTe;

end;

procedure TfrmConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f10 then
    btnGravar.Click;

  if Key = vk_escape then
    btnSair.Click;
end;

procedure TfrmConfig.CarregaDevice;
var
  i: TACBrETQModelo;
  J: TACBrETQDPI;
  X: Integer;
  // K: TACBrETQUnidade;
  L: TACBrETQBackFeed;
begin

  ACBrETQ.Device.AcharPortasSeriais(cbPorta.Items);
  cbPorta.Items.Add('LPT1');
  cbPorta.Items.Add('LPT2');
  cbPorta.Items.Add('LPT3');
  cbPorta.Items.Add('/dev/ttyS0');
  cbPorta.Items.Add('/dev/ttyS1');
  cbPorta.Items.Add('/dev/ttyUSB0');
  cbPorta.Items.Add('/dev/ttyUSB1');

  for X := 0 to Printer.Printers.Count - 1 do
    cbPorta.Items.Add('RAW:' + Printer.Printers[X]);

  cbDPI.ItemIndex := 0;
  cbModelo.ItemIndex := 1;
  cbPorta.ItemIndex := 0;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin

  TabSheet16.TabVisible := false;
  TabSheet17.TabVisible := false;
  PageEtiquetas.ActivePageIndex := 0;

  Dados.qryEtiqueta.Close;
  Dados.qryEtiqueta.Open;
  CarregaDevice;
  LeLicenca;
end;

procedure TfrmConfig.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TEdit(Sender).Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
    Dir := TDBEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    TDBEdit(Sender).Text := Dir;
end;

end.
