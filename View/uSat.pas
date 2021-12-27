unit uSat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.zip,
  System.Classes, Vcl.Graphics, System.Math, dateutils, ACBrValidador,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, System.TypInfo,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversaoNFE, pcnConversao, blcksock, acbrUtil, ACBrDFeSSL,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, DBGridEh,
  DBCtrlsEh, DBLookupEh, frxExportBaseDialog, ACBrEnterTab, ACBrBase, ACBrMail,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrPosPrinter, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, ACBrDFe, ACBrNFe, ACBrSATClass,
  ACBrDANFCeFortesFrA4, ACBrSATExtratoReportClass, ACBrSATExtratoFortesFr,
  ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrDFeUtil, ACBrSAT,
  ACBrIntegrador;

type
  TfrmSat = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    LblSaldo: TLabel;
    ACBrMail1: TACBrMail;
    OpenDialog1: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryVenda: TFDQuery;
    qryVendaCODIGO: TIntegerField;
    qryVendaNUMERO: TIntegerField;
    qryVendaCHAVE: TStringField;
    qryVendaMODELO: TStringField;
    qryVendaSERIE: TStringField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaDATA_SAIDA: TDateField;
    qryVendaHORA_EMISSAO: TTimeField;
    qryVendaHORA_SAIDA: TTimeField;
    qryVendaID_EMITENTE: TIntegerField;
    qryVendaID_CLIENTE: TIntegerField;
    qryVendaFK_USUARIO: TIntegerField;
    qryVendaFK_CAIXA: TIntegerField;
    qryVendaFK_VENDEDOR: TIntegerField;
    qryVendaCPF_NOTA: TStringField;
    qryVendaOBSERVACOES: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryVendaEMAIL: TStringField;
    qryVendaXML: TMemoField;
    qryVendaPROTOCOLO: TStringField;
    qryVendaMOTIVOCANCELAMENTO: TStringField;
    qryVendaFLAG: TStringField;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_VENDEDOR: TStringField;
    dsVenda: TDataSource;
    qryVendaTTOTAL: TAggregateField;
    qryVendaVIRTUAL_SITUACAO: TStringField;
    ACBrEnterTab1: TACBrEnterTab;
    PageControl1: TPageControl;
    qryItem: TFDQuery;
    dsItem: TDataSource;
    qryItemCODIGO: TIntegerField;
    qryItemID_PRODUTO: TIntegerField;
    qryItemCOD_BARRA: TStringField;
    qryItemUNIDADE: TStringField;
    qryItemDESCRICAO: TStringField;
    qryItemITEM: TSmallintField;
    qryXML: TFDQuery;
    qryXMLNUMERO: TIntegerField;
    qryXMLDATA_EMISSAO: TDateField;
    qryXMLCHAVE: TStringField;
    dsEmpresa: TDataSource;
    qryVendaRAZAO: TStringField;
    qryVendaCAIXA: TStringField;
    qryVendaVENDEDOR: TStringField;
    qryVendaLOGIN: TStringField;
    qryTributacao: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    qryItemTTOTAL: TAggregateField;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel10: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    dsCliente: TDataSource;
    qryCliente: TFDQuery;
    Panel3: TPanel;
    btnTodos: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnRelatorio: TSpeedButton;
    qryVendaABERTO: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaFK_VENDA: TIntegerField;
    btnTransmitir: TSpeedButton;
    qryProduto: TFDQuery;
    qryIBPT: TFDQuery;
    qryIBPTCODIGO: TStringField;
    qryIBPTEX: TStringField;
    qryIBPTTIPO: TStringField;
    qryIBPTDESCRICAO: TStringField;
    qryIBPTVIGENCIAINICIO: TStringField;
    qryIBPTVIGENCIAFIM: TStringField;
    qryIBPTCHAVE: TStringField;
    qryIBPTVERSAO: TStringField;
    qryIBPTFONTE: TStringField;
    qrySomaNFCe: TFDQuery;
    qryItemFKVENDA: TIntegerField;
    qryItemNCM: TStringField;
    qryItemCFOP: TStringField;
    qryItemCST: TStringField;
    qryItemCSOSN: TStringField;
    qryItemTIPO: TStringField;
    qryItemCST_COFINS: TStringField;
    qryItemCST_PIS: TStringField;
    qryItemCMUNFG: TIntegerField;
    qryItemCLISTASERV: TIntegerField;
    qryItemSITUACAO: TStringField;
    qryItemFLAG: TStringField;
    qryVendaEMAIL1: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel9: TPanel;
    DBText1: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    DBText3: TDBText;
    DBGrid1: TDBGrid;
    qryRelatorio: TFDQuery;
    qryRelatorioNUMERO: TIntegerField;
    qryRelatorioDATA_EMISSAO: TDateField;
    qryRelatorioCHAVE: TStringField;
    qryRelatorioPROTOCOLO: TStringField;
    qryRelatorioSITUACAO: TStringField;
    qryRelatorioVIRTUAL_SITUACAO: TStringField;
    frxDBDataset3: TfrxDBDataset;
    qryVendaVIRTUAL_TIPO: TStringField;
    qryVendasFPG: TFDQuery;
    qryVendasFPGCODIGO: TIntegerField;
    qryVendasFPGVENDAS_MASTER: TIntegerField;
    qryVendasFPGID_FORMA: TIntegerField;
    qryVendasFPGVIRTUAL_FORMA: TStringField;
    qryVendasFPGVIRTUAL_TIPO: TStringField;
    qryPV: TFDQuery;
    qryPV_Itens: TFDQuery;
    qryProd: TFDQuery;
    qryVendaSUBTOTAL: TFMTBCDField;
    qryVendaTIPO_DESCONTO: TStringField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaTROCO: TFMTBCDField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaBASEICMS: TFMTBCDField;
    qryVendaTOTALICMS: TFMTBCDField;
    qryVendaBASEICMSPIS: TFMTBCDField;
    qryVendaTOTALICMSPIS: TFMTBCDField;
    qryVendaBASEICMSCOF: TFMTBCDField;
    qryVendaTOTALICMSCOFINS: TFMTBCDField;
    qryVendaBASEISS: TFMTBCDField;
    qryVendaTOTALISS: TFMTBCDField;
    qryVendaTRIB_MUN: TFMTBCDField;
    qryVendaTRIB_EST: TFMTBCDField;
    qryVendaTRIB_FED: TFMTBCDField;
    qryVendaTRIB_IMP: TFMTBCDField;
    qryVendaOUTROS: TFMTBCDField;
    qryItemQTD: TFMTBCDField;
    qryItemE_MEDIO: TFMTBCDField;
    qryItemPRECO: TFMTBCDField;
    qryItemVALOR_ITEM: TFMTBCDField;
    qryItemVDESCONTO: TFMTBCDField;
    qryItemBASE_ICMS: TFMTBCDField;
    qryItemALIQ_ICMS: TFMTBCDField;
    qryItemVALOR_ICMS: TFMTBCDField;
    qryItemP_REDUCAO_ICMS: TFMTBCDField;
    qryItemBASE_COFINS_ICMS: TFMTBCDField;
    qryItemALIQ_COFINS_ICMS: TFMTBCDField;
    qryItemVALOR_COFINS_ICMS: TFMTBCDField;
    qryItemBASE_PIS_ICMS: TFMTBCDField;
    qryItemALIQ_PIS_ICMS: TFMTBCDField;
    qryItemVALOR_PIS_ICMS: TFMTBCDField;
    qryItemBASE_ISS: TFMTBCDField;
    qryItemALIQ_ISS: TFMTBCDField;
    qryItemVALOR_ISS: TFMTBCDField;
    qryItemTRIB_MUN: TFMTBCDField;
    qryItemTRIB_EST: TFMTBCDField;
    qryItemTRIB_FED: TFMTBCDField;
    qryItemTRIB_IMP: TFMTBCDField;
    qryItemTOTAL: TFMTBCDField;
    qryItemOUTROS: TFMTBCDField;
    qrySomaNFCeTOTAL: TFMTBCDField;
    qrySomaNFCeBASE_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_PIS_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_PIS_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_COF_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_COF_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_ISS: TFMTBCDField;
    qrySomaNFCeVALOR_ISS: TFMTBCDField;
    qrySomaNFCeTOTALMUN: TFMTBCDField;
    qrySomaNFCeTOTALFED: TFMTBCDField;
    qrySomaNFCeTOTALEST: TFMTBCDField;
    qrySomaNFCeTOTALIMP: TFMTBCDField;
    qrySomaNFCeDESCONTOS: TFMTBCDField;
    qrySomaNFCeOUTROS: TFMTBCDField;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdEFISCAL: TStringField;
    qryProdE_MEDIO: TFMTBCDField;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoPR_VENDA: TFMTBCDField;
    qryProdutoTIPO: TStringField;
    qryProdutoCSTICMS: TStringField;
    qryProdutoCFOP: TStringField;
    qryProdutoCSOSN: TStringField;
    qryProdutoALIQ_ICM: TCurrencyField;
    qryProdutoCSTE: TStringField;
    qryProdutoCSTS: TStringField;
    qryProdutoALIQ_PIS: TCurrencyField;
    qryProdutoALIQ_COF: TCurrencyField;
    qryProdutoNCM: TStringField;
    qryProdutoNACIONALFEDERAL: TStringField;
    qryProdutoIMPORTADOSFEDERAL: TStringField;
    qryProdutoESTADUAL: TStringField;
    qryProdutoMUNICIPAL: TStringField;
    qryProdutoCODBARRA: TStringField;
    qryPVCODIGO: TIntegerField;
    qryPVDATA_EMISSAO: TDateField;
    qryPVDATA_SAIDA: TDateField;
    qryPVID_CLIENTE: TIntegerField;
    qryPVFK_USUARIO: TIntegerField;
    qryPVFK_CAIXA: TIntegerField;
    qryPVFK_VENDEDOR: TIntegerField;
    qryPVCPF_NOTA: TStringField;
    qryPVSUBTOTAL: TFMTBCDField;
    qryPVTIPO_DESCONTO: TStringField;
    qryPVDESCONTO: TFMTBCDField;
    qryPVTROCO: TFMTBCDField;
    qryPVDINHEIRO: TFMTBCDField;
    qryPVTOTAL: TFMTBCDField;
    qryPVOBSERVACOES: TMemoField;
    qryPVSITUACAO: TStringField;
    qryPVFKEMPRESA: TIntegerField;
    qryPVPERCENTUAL: TFMTBCDField;
    qryPVTIPO: TStringField;
    qryPVNECF: TIntegerField;
    qryPVFKORCAMENTO: TIntegerField;
    qryPVLOTE: TIntegerField;
    qryPVGERA_FINANCEIRO: TStringField;
    qryPVPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryPVACRESCIMO: TFMTBCDField;
    qryPVFK_TABELA: TIntegerField;
    qryPVPEDIDO: TStringField;
    qryPVRAZAO: TStringField;
    qryPVNOME: TStringField;
    qryPV_ItensCODIGO: TIntegerField;
    qryPV_ItensFKVENDA: TIntegerField;
    qryPV_ItensID_PRODUTO: TIntegerField;
    qryPV_ItensITEM: TSmallintField;
    qryPV_ItensCOD_BARRA: TStringField;
    qryPV_ItensQTD: TFMTBCDField;
    qryPV_ItensE_MEDIO: TFMTBCDField;
    qryPV_ItensPRECO: TFMTBCDField;
    qryPV_ItensVALOR_ITEM: TFMTBCDField;
    qryPV_ItensVDESCONTO: TFMTBCDField;
    qryPV_ItensTOTAL: TFMTBCDField;
    qryPV_ItensSITUACAO: TStringField;
    qryPV_ItensUNIDADE: TStringField;
    qryPV_ItensQTD_DEVOLVIDA: TFMTBCDField;
    qryPV_ItensACRESCIMO: TFMTBCDField;
    qryPV_ItensPRODUTO: TStringField;
    qryPV_ItensUNIDADE_1: TStringField;
    qryTributacaoCST: TStringField;
    qryTributacaoCSOSN: TStringField;
    qryTributacaoTOTAL: TFMTBCDField;
    qryRelatorioTOTAL: TFMTBCDField;
    qryIBPTNACIONALFEDERAL: TStringField;
    qryIBPTIMPORTADOSFEDERAL: TStringField;
    qryIBPTESTADUAL: TStringField;
    qryIBPTMUNICIPAL: TStringField;
    qryFPG: TFDQuery;
    qryVendasFPGVALOR: TFMTBCDField;
    qryVendasFPGFK_USUARIO: TIntegerField;
    qryVendasFPGSITUACAO: TStringField;
    qryVendasFPGTIPO: TStringField;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    qryFPGGERACR: TStringField;
    qryFPGGERACH: TStringField;
    qryFPGECARTAO: TStringField;
    qryFPGUSAVD: TStringField;
    qryFPGUSACR: TStringField;
    qryFPGATIVO: TStringField;
    qryFPGPARCELAS: TIntegerField;
    qryFPGINTERVALO: TIntegerField;
    qryFPGTAXA: TFMTBCDField;
    qryFPGENTRADA: TFMTBCDField;
    qryFPGTIPO: TStringField;
    qryFPGDIAS: TSmallintField;
    qryFPGFKCONTADESTINO: TIntegerField;
    qryXMLTRIB_FED: TFMTBCDField;
    qryXMLTRIB_EST: TFMTBCDField;
    qryXMLTRIB_MUN: TFMTBCDField;
    qryXMLSITUACAO: TStringField;
    qryXMLSERIE: TStringField;
    qryXMLXML: TMemoField;
    qryXMLTOTAL: TFMTBCDField;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteCLI: TStringField;
    qryVendaSAT_NUMERO_CFE: TIntegerField;
    qryVendaSAT_NUMERO_SERIE: TStringField;
    qryVendaCNF: TStringField;
    qryVendaXML_CANCELAMENTO: TMemoField;
    TabSet1: TTabSet;
    qryProdutoCEST: TStringField;
    PagUtilidade: TPageControl;
    TabGerar: TTabSheet;
    pnGerar: TPanel;
    lblStatus: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    memLista: TListBox;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtArquivo: TEdit;
    edtRelatorio: TEdit;
    edtEmail: TDBLookupComboboxEh;
    Button1: TButton;
    qryXMLXML_CANCELAMENTO: TMemoField;
    qryContador: TFDQuery;
    qryContadorEMAIL: TStringField;
    dsContador: TDataSource;
    qryXMLSAT_NUMERO_CFE: TIntegerField;
    qryXMLVIRTUAL_SITUACAO: TStringField;
    GroupBox1: TGroupBox;
    LblPeriodo: TLabel;
    edtLoc: TEdit;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    lblDescricao: TLabel;
    btnPDF: TSpeedButton;
    procedure edtLocChange(Sender: TObject);
    procedure TabSet2Click(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qryVendaCalcFields(DataSet: TDataSet);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryVendaBeforeDelete(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure qryVendaAfterPost(DataSet: TDataSet);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure qryRelatorioCalcFields(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure qryVendasFPGAfterOpen(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbClienteEnter(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure qryXMLCalcFields(DataSet: TDataSet);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
  private
    PathArqDFe: string;
    PathPDF: string;
    PathArquivos: string;
    PathSchemas: string;
    PathTmp: string;
    procedure localiza;
    procedure tamanho;
    function TemAtributo(Attr, Val: Integer): Boolean;

    function PathApp: String;
    function PathLog: String;
    procedure EnviarCFe(ASerie, ANumero: Integer);
    function GravarCFe(const ASerie, ANumero, ASerieSat, ANumeroSat: Integer;
      const AChave, ANumeroProtocolo: String; const ADataHoraRecto: TDateTime;
      const AXML: String): Boolean;
    procedure GerarCFe(ASerie, ANumero: Integer);
    procedure TRansmitir;
    function StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    procedure GerarXml;
    procedure GerarRelatorio;
    procedure compactanfce(Caminho, pasta: string);
    procedure EnviarEmail;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: String;
    { Public declarations }
  end;

var
  frmSat: TfrmSat;

implementation

{$R *.dfm}

uses Udados, ufrmStatus, uEmail, uCadProduto, uSupervisor, uDMSat;

procedure TfrmSat.GerarCFe(ASerie, ANumero: Integer);
var
  NumItem: Integer;
  vOK: Boolean;
  CodigoGTIN: String;
  MsgErroGTIN: String;
begin

  Dados.qryNFCE_M.Close;
  Dados.qryNFCE_M.Params[0].Value := qryVendaFK_VENDA.Value;
  Dados.qryNFCE_M.Open;

  Dados.qryNFCE_D.Close;
  Dados.qryNFCE_D.Params[0].Value := Dados.qryNFCE_MCODIGO.Value;
  Dados.qryNFCE_D.Open;

  Dados.qryNFCE_D.Close;
  Dados.qryNFCE_D.Params[0].Value := Dados.qryNFCE_MCODIGO.Value;
  Dados.qryNFCE_D.Open;

  qryVendasFPG.Close;
  qryVendasFPG.Params[0].Value := qryVendaFK_VENDA.Value;
  qryVendasFPG.Open;

  if Dados.qryNFCE_D.IsEmpty then
  begin
    ShowMessage('Não Existe Produto Cadastrado Para Venda!' + #13 +
      'Vá na tela cadastro de produtos' + #13 +
      ' e marque a opção Permitir Venda');
    exit;
  end;

  try

    ASerie := Dados.qryNFCE_MSERIE.AsInteger;
    ANumero := Dados.qryNFCE_MNUMERO.Value;
    DMSat.ACBrSAT1.InicializaCFe;

    // Montando uma Venda //
    with DMSat.ACBrSAT1.CFe do
    begin
      ide.numeroCaixa := Dados.qryNFCE_MFK_CAIXA.Value;

      // dados do cliente
      if qryVendaID_CLIENTE.AsInteger <> Dados.qryConfigCLIENTE_PADRAO.AsInteger
      then
      begin
        Dados.qryconsulta.Close;
        Dados.qryconsulta.sql.Text := 'SELECT * FROM PESSOA WHERE CODIGO=:ID';
        Dados.qryconsulta.Params[0].Value := Dados.qryNFCE_MID_CLIENTE.Value;
        Dados.qryconsulta.Open;

        Dest.CNPJCPF := TiraPontos(Dados.qryNFCE_MCPF_NOTA.AsString);
        Dest.xNome := Dados.qryconsulta.FieldByName('RAZAO').AsString;
      end
      else
      begin
        if length(TiraPontos(qryVendaCPF_NOTA.Value)) >= 9 then
          Dest.CNPJCPF := TiraPontos(qryVendaCPF_NOTA.Value)
        else
          Dest.CNPJCPF := '';
        Dest.xNome := 'CONSUMIDOR FINAL';
      end;

      // endereço de entrega
      Entrega.xLgr := '';
      Entrega.nro := '';
      Entrega.xCpl := '';
      Entrega.xBairro := '';
      Entrega.xMun := '';
      Entrega.UF := '';

      // itens da venda
      NumItem := 0;

      Dados.qryNFCE_D.First;
      while not Dados.qryNFCE_D.Eof do
      begin
        NumItem := NumItem + 1;

        with Det.Add do
        begin
          CodigoGTIN := Trim(OnlyNumber(Dados.QRYNFCE_DCOD_BARRA.AsString));
          if CodigoGTIN <> '' then
          begin
            MsgErroGTIN := Trim(ACBrValidador.ValidarGTIN(CodigoGTIN));
            if MsgErroGTIN <> '' then
              raise EDatabaseError.Create('GTIN inválido: ' + MsgErroGTIN);
          end
          else
            CodigoGTIN := '';

          nItem := NumItem;
          Prod.cProd := Dados.qryNFCE_DID_PRODUTO.AsString;
          Prod.cEAN := CodigoGTIN;
          Prod.xProd := Dados.qryNFCE_DDESCRICAO.AsString;
          Prod.NCM := Dados.qryNFCE_DNCM.AsString;
          Prod.CFOP := Dados.qryNFCE_DCFOP.AsString;
          Prod.uCom := Dados.QRYNFCE_DUNIDADE.AsString;
          Prod.indRegra := irTruncamento;
          Prod.qCom := Dados.QRYNFCE_DQTD.AsFloat;
          Prod.vUnCom := Dados.QRYNFCE_DPRECO.AsFloat;
          Prod.vDesc := Dados.QRYNFCE_DVDESCONTO.AsFloat;
          Prod.vOutro := Dados.qryNFCE_DOUTROS.AsFloat;
          Prod.CEST := '';

          // observações do produto
          infAdProd := '';

          // ICMS ********************************************************
          Imposto.ICMS.orig :=
            StrToOrig(vOK, copy(Dados.QRYNFCE_DCST.Value, 1, 1));
          if not vOK then
          begin
            raise Exception.CreateFmt
              ('Código origem "%d" inválida para o item "%s - %s"',
              [copy(Dados.QRYNFCE_DCST.Value, 1, 1),
              Dados.qryNFCE_DID_PRODUTO.AsString,
              Dados.qryNFCE_DDESCRICAO.AsString]);
          end;

          if DMSat.ACBrSAT1.Config.emit_cRegTrib = RTRegimeNormal then
          begin
            Imposto.ICMS.CST :=
              StrToCSTICMS(vOK, copy(Dados.QRYNFCE_DCST.AsString, 2, 2));
            if not vOK then
            begin
              raise Exception.CreateFmt
                ('Código do CST "%s" inválido para o item "%s - %s"',
                [copy(Dados.QRYNFCE_DCST.AsString, 2, 2),
                Dados.qryNFCE_DID_PRODUTO.AsString,
                Dados.qryNFCE_DDESCRICAO.AsString]);
            end;

            Imposto.ICMS.pICMS := Dados.QRYNFCE_DALIQ_ICMS.AsFloat;
          end
          else
          begin
            Imposto.ICMS.CSOSN := StrToCSOSNIcms(vOK,
              Dados.QRYNFCE_DCSOSN.AsString);
            if not vOK then
            begin
              raise Exception.CreateFmt
                ('Código do VSOSN "%s" inválido para o item "%s - %s"',
                [Dados.QRYNFCE_DCSOSN.AsString,
                Dados.qryNFCE_DID_PRODUTO.AsString,
                Dados.qryNFCE_DDESCRICAO.AsString]);
            end;
          end;

          // PIS *********************************************************
          with Imposto.PIS do
          begin
            if (Imposto.ICMS.CSOSN = csosn500) or
              (DMSat.ACBrSAT1.Config.emit_cRegTrib = RTSimplesNacional) then
              CST := pis49
            else
              CST := StrToCSTPIS(vOK, Dados.QRYNFCE_DCST_PIS.AsString);

            if not vOK then
            begin
              raise Exception.CreateFmt
                ('Código CST do Pis "%d" inválido para o item "%s - %s"',
                [Dados.QRYNFCE_DCST_PIS.AsString,
                Dados.qryNFCE_DID_PRODUTO.AsString,
                Dados.qryNFCE_DDESCRICAO.AsString]);
            end;

            if Dados.QRYNFCE_DALIQ_PIS_ICMS.AsFloat > 0 then
            begin
              vBC := Dados.QRYNFCE_DBASE_PIS_ICMS.AsFloat;
              pPIS := Dados.QRYNFCE_DALIQ_PIS_ICMS.AsFloat / 100;

              qBCProd := 0;
              vAliqProd := 0;
            end
            else
            begin
              vBC := 0;
              pPIS := 0;
              qBCProd := 0;
              vAliqProd := 0;
            end;
          end;

          // COFINS ******************************************************
          with Imposto.COFINS do
          begin
            if (Imposto.ICMS.CSOSN = csosn500) or
              (DMSat.ACBrSAT1.Config.emit_cRegTrib = RTSimplesNacional) then
              CST := cof49
            else
              CST := StrToCSTCOFINS(vOK, Dados.QRYNFCE_DCST_COFINS.AsString);

            if not vOK then
            begin
              raise Exception.CreateFmt
                ('Código CST do Cofins "%d" inválido para o item "%s - %s"',
                [Dados.QRYNFCE_DCST_COFINS.AsString,
                Dados.qryNFCE_DID_PRODUTO.AsString,
                Dados.qryNFCE_DDESCRICAO.AsString]);
            end;

            if Dados.QRYNFCE_DALIQ_COFINS_ICMS.AsFloat > 0 then
            begin
              vBC := Dados.QRYNFCE_DBASE_COFINS_ICMS.AsFloat;
              pCOFINS := Dados.QRYNFCE_DALIQ_COFINS_ICMS.AsFloat / 100;

              qBCProd := 0;
              vAliqProd := 0;
            end
            else
            begin
              vBC := 0;
              pCOFINS := 0;
              qBCProd := 0;
              vAliqProd := 0;
            end;
          end;

          // imposto aproximado
          Imposto.vItem12741 := Dados.QRYNFCE_DTRIB_FED.AsFloat +
            Dados.QRYNFCE_DTRIB_EST.AsFloat + Dados.QRYNFCE_DTRIB_MUN.AsFloat;
        end;

        Dados.qryNFCE_D.Next;
      end;

      Total.DescAcrEntr.vDescSubtot := Dados.qryNFCE_MDESCONTO.AsFloat;

      Total.vCFeLei12741 := Dados.qryNFCE_MTRIB_FED.AsFloat +
        Dados.qryNFCE_MTRIB_EST.AsFloat + Dados.qryNFCE_MTRIB_MUN.AsFloat;

      if Dados.qryNFCE_MTOTAL.Value = qryVendaTOTAL.AsFloat then
      begin
        qryVendasFPG.First;
        while not qryVendasFPG.Eof do
        begin
          if qryVendasFPGVALOR.Value > 0 then
          begin
            if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'D' then
            begin
              with Pagto.Add do
              begin
                cMP := mpDinheiro;
                vMP := qryVendaDINHEIRO.AsFloat;
              end;
            end;
          end;

          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'Q' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCheque;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;

          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'T' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpOutros;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;

          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'C' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCartaodeCredito;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;
          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'E' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCartaodeDebito;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;
          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'F' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCreditoLoja;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;
          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'N' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCreditoLoja;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;
          if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'X' then
          begin
            if qryVendasFPGVALOR.Value > 0 then
            begin
              with Pagto.Add do
              begin
                cMP := mpCreditoLoja;
                vMP := qryVendasFPGVALOR.AsFloat;
              end;
            end;
          end;
          qryVendasFPG.Next;
        end;
      end
      else
      begin
        with Pagto.Add do
        begin
          cMP := mpDinheiro;
          vMP := Dados.qryNFCE_MTOTAL.AsFloat;
        end;
      end;

    end;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;
end;

function TfrmSat.PathApp: String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)) + 'CFe');

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TfrmSat.GravarCFe(const ASerie, ANumero, ASerieSat,
  ANumeroSat: Integer; const AChave, ANumeroProtocolo: String;
  const ADataHoraRecto: TDateTime; const AXML: String): Boolean;
begin

  Application.ProcessMessages;

  if not(Dados.qryNFCE_M.State in dsEditModes) then
    Dados.qryNFCE_M.Edit;
  Dados.qryNFCE_MPROTOCOLO.Value := ANumeroProtocolo;
  Dados.qryNFCE_MXML.Value := AXML;
  Dados.qryNFCE_MCHAVE.Value := AChave;
  Dados.qryNFCE_MSAT_NUMERO_CFE.Value := ANumeroSat;
  Dados.qryNFCE_MSAT_NUMERO_SERIE.AsInteger := ASerieSat;
  Dados.qryNFCE_MFLAG.Value := 'N';
  Dados.qryNFCE_MABERTO.Value := 'N';
  Dados.qryNFCE_MSITUACAO.Value := 'T';
  Dados.qryNFCE_MDATA_EMISSAO.Value := ADataHoraRecto;
  Dados.qryNFCE_MDATA_SAIDA.Value := ADataHoraRecto;
  Dados.qryNFCE_MHORA_EMISSAO.Value := ADataHoraRecto;
  Dados.qryNFCE_MHORA_SAIDA.Value := ADataHoraRecto;
  Dados.qryNFCE_M.Post;
  Dados.Conexao.CommitRetaining;

end;

procedure TfrmSat.EnviarCFe(ASerie, ANumero: Integer);
begin

  try
    DMSat.ACBrSAT1.EnviarDadosVenda;
  except
    on e: Exception do
    begin
      raise Exception.CreateFmt
        ('Ocorreu o seguinte erro ao tentar enviar o CF-e:' + sLineBreak +
        e.Message + sLineBreak + sLineBreak + '%d - %s',
        [DMSat.ACBrSAT1.Resposta.codigoDeErro,
        DMSat.ACBrSAT1.Resposta.mensagemRetorno]);
    end;
  end;

  if DMSat.ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
  begin
    GravarCFe(ASerie, ANumero, DMSat.ACBrSAT1.CFe.ide.nserieSAT,
      DMSat.ACBrSAT1.CFe.ide.nCFe, OnlyNumber(DMSat.ACBrSAT1.CFe.infCFe.ID), '',
      DMSat.ACBrSAT1.CFe.ide.dEmi + DMSat.ACBrSAT1.CFe.ide.hEmi,
      DMSat.ACBrSAT1.CFe.AsXMLString);
  end
  else
    raise Exception.CreateFmt('%d - %s', [DMSat.ACBrSAT1.Resposta.codigoDeErro,
      DMSat.ACBrSAT1.Resposta.mensagemRetorno]);
end;

function TfrmSat.PathLog: String;
begin

  Result := IncludeTrailingPathDelimiter(PathApp + 'Log');

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TfrmSat.StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
begin
  Result := TACBrPosPaginaCodigo
    (GetEnumValue(TypeInfo(TACBrPosPaginaCodigo), AValor));
end;

procedure TfrmSat.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin

  ProgressBar1.Position := Integer(aStatus);

  case aStatus of
    pmsStartProcess:
      lblStatus.caption := 'Iniciando processo de envio.';
    pmsConfigHeaders:
      lblStatus.caption := 'Configurando o cabeçalho do e-mail.';
    pmsLoginSMTP:
      lblStatus.caption := 'Logando no servidor de e-mail.';
    pmsStartSends:
      lblStatus.caption := 'Iniciando os envios.';
    pmsSendTo:
      lblStatus.caption := 'Processando lista de destinatários.';
    pmsSendCC:
      lblStatus.caption := 'Processando lista CC.';
    pmsSendBCC:
      lblStatus.caption := 'Processando lista BCC.';
    pmsSendReplyTo:
      lblStatus.caption := 'Processando lista ReplyTo.';
    pmsSendData:
      lblStatus.caption := 'Enviando dados.';
    pmsLogoutSMTP:
      lblStatus.caption := 'Fazendo Logout no servidor de e-mail.';
    pmsDone:
      begin
        lblStatus.caption := 'Terminando e limpando.';
        ProgressBar1.Position := ProgressBar1.Max;
      end;
  end;

  lblStatus.caption := '   ' + AMail.Subject;

  Application.ProcessMessages;
end;

procedure TfrmSat.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio + '\*.*xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, True);
          end;
      end
      else
      begin
        memLista.Items.Add(Diretorio + '\' + F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

procedure TfrmSat.GerarXml;
var
  dia, mes, ano: Word;
var
  Caminho: string;
begin

  if (Trim(qryXMLXML.AsString) = '') or (qryXMLXML.IsNull) then
    raise Exception.Create('ERRO XML não encontrado NFCe.' +
      qryVendaNUMERO.AsString);

  DMSat.ACBrSAT1.CFe.Clear;

  if (qryXMLSITUACAO.Value = 'T') then
    DMSat.ACBrSAT1.CFe.SetXMLString(qryXMLXML.AsString);

  Caminho := ExtractFilePath(Application.ExeName) + 'CFe\Remessa\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '\' + qryXMLCHAVE.AsString + '.xml';

  if (qryXMLSITUACAO.Value = 'C') then
  begin
    if not(qryXMLXML_CANCELAMENTO.IsNull) then
      DMSat.ACBrSAT1.CFe.SetXMLString(qryXMLXML_CANCELAMENTO.AsString)
    else
      DMSat.ACBrSAT1.CFe.SetXMLString(qryXMLXML.AsString);
  end;

  if (qryXMLSITUACAO.Value = 'T') or (qryXMLSITUACAO.Value = 'C') then
    DMSat.ACBrSAT1.CFe.SaveToFile(Caminho);

end;

procedure TfrmSat.GerarRelatorio;
begin

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelSat.fr3');

  frxPDF.FileName := 'Lista SAT' + '.pdf';
  frxPDF.DefaultPath := edtRelatorio.Text;
  frxPDF.ShowDialog := false;
  frxPDF.ShowProgress := false;
  frxPDF.OverwritePrompt := false;
  frxReport.PrepareReport();
  frxReport.Export(frxPDF);

end;

procedure TfrmSat.compactanfce(Caminho, pasta: string);
var
  ZipFile: TZipFile;
  arquivo: string;
begin
  // Cria uma instância da classe TZipFile
  ZipFile := TZipFile.Create;
  try
    // Indica o diretório e nome do arquivo Zip que será criado
    ZipFile.Open(Caminho + '\' + pasta + '.zip', zmWrite);
    for arquivo in memLista.Items do
      ZipFile.Add(arquivo);

    MessageDlg('Compactação concluída!', mtInformation, [mbOK], 0);
  finally
    // Libera o objeto da memória
    ZipFile.Free;
  end;
end;

procedure TfrmSat.BitBtn1Click(Sender: TObject);
var
  dia, mes, ano, dia1, mes1, ano1: Word;
begin

  DecodeDate(strtodate(maskInicio.Text), ano, mes, dia);
  DecodeDate(strtodate(maskFim.Text), ano1, mes1, dia1);

  if (mes + ano) <> (mes1 + ano1) then
  begin
    ShowMessage('Período Inválido');
    exit;
  end;

  Dados.qryconsulta.Close;
  Dados.qryconsulta.sql.Text := ' SELECT NUMERO FROM NFCE_MASTER' +
    ' WHERE SITUACAO IN (''G'',''O'') AND ' +
    ' DATA_EMISSAO between :DATA1 AND :DATA2 AND FKEMPRESA=:EMPRESA ORDER BY numero';
  Dados.qryconsulta.Params[0].AsDate := strtodate(maskInicio.EditText);
  Dados.qryconsulta.Params[1].AsDate := strtodate(maskFim.EditText);
  Dados.qryconsulta.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryconsulta.Open;

  if not Dados.qryconsulta.IsEmpty then
  begin
    ShowMessage('Existem SATs não enviados!' + sLineBreak +
      'Não é Possivel Continuar!');
    exit;
  end;

  try
    BitBtn1.Enabled := false;
    qryXML.Close;
    qryXML.Params[0].AsDate := strtodate(maskInicio.EditText);
    qryXML.Params[1].AsDate := strtodate(maskFim.EditText);
    qryXML.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
    qryXML.Open;
    if not qryXML.IsEmpty then
    begin
      ProgressBar1.Position := 1;
      ProgressBar1.Min := 1;
      ProgressBar1.Max := qryXML.RecordCount;
      qryXML.First;
      while not qryXML.Eof do
      begin
        GerarXml;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        qryXML.Next;
        Application.ProcessMessages;
      end;
    end;
    GerarRelatorio;

    Sleep(5000);

    memLista.Items.Clear;
    ListarArquivos(ExtractFilePath(Application.ExeName) + '\CFe\Remessa\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
      strtodate(maskInicio.Text)), false);
    compactanfce(ExtractFilePath(Application.ExeName) + '\CFe\Remessa\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString), FormatDateTime('yyyymm',
      strtodate(maskInicio.Text)));
  finally
    BitBtn1.Enabled := True;
  end;

end;

procedure TfrmSat.BitBtn2Click(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmSat.btnCancelarClick(Sender: TObject);
begin

  if qryVendaSITUACAO.AsString <> 'T' then
    raise Exception.Create
      ('Não é possível efetuar o cancelamento deste cupom eletrônico');

  // cancelamento da venda (limitado a 30 minutos)
  If Application.messagebox('Confirmar o cancelamento do documento fiscal?',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
  begin

    if not Dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
      if not Dados.vAutorizar then
      begin
        exit;
      end;
    end;

    try

      DMSat.ConfiguraSAT;

      if pos('8000', DMSat.ACBrSAT1.ConsultarSAT) = 0 then
        raise Exception.Create(DMSat.ACBrSAT1.ConsultarSAT);

      DMSat.ACBrSAT1.CFe.Clear;
      DMSat.ACBrSAT1.CFe.SetXMLString(qryVendaXML.AsString);
      DMSat.ACBrSAT1.CancelarUltimaVenda;

      if DMSat.ACBrSAT1.Resposta.codigoDeRetorno = 7000 then
      begin

        DMSat.ACBrSAT1.ImprimirExtratoCancelamento;

        qryVenda.Edit;
        qryVendaSITUACAO.Value := 'C';
        qryVendaFLAG.Value := 'N';
        qryVendaXML_CANCELAMENTO.Value := DMSat.ACBrSAT1.CFeCanc.AsXMLString;
        qryVenda.Post;

        ShowMessage('Cancelamento realizado com sucesso!');

      end
      else
        raise Exception.CreateFmt('%d - %s',
          [DMSat.ACBrSAT1.Resposta.codigoDeErro,
          DMSat.ACBrSAT1.Resposta.mensagemRetorno]);
    finally
      // nada
    end;
  end;
end;

procedure TfrmSat.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmSat.btnImprimirClick(Sender: TObject);
begin
  // reimpressão de cupom

  if Application.messagebox('Confirmar reimpressão do comprovante?',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
  begin

    DMSat.ConfiguraSAT;

    DMSat.ACBrSAT1.CFe.Clear;

    if qryVendaSITUACAO.AsString = 'C' then
    begin
      DMSat.ACBrSAT1.CFe.SetXMLString(qryVendaXML_CANCELAMENTO.AsString);
      DMSat.ACBrSAT1.ImprimirExtratoCancelamento;
    end
    else
    begin
      DMSat.ACBrSAT1.CFe.SetXMLString(qryVendaXML.AsString);
      DMSat.ACBrSAT1.ImprimirExtrato;
    end;
  end;
end;

procedure TfrmSat.btnPDFClick(Sender: TObject);
begin

  DMSat.ConfiguraSAT;

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'CFe\Remessa\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString)) then
    CreateDir(ExtractFilePath(Application.ExeName) + '\CFe\Remessa\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString));

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'CFe\Remessa\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text))) then
    CreateDir(ExtractFilePath(Application.ExeName) + '\CFe\Remessa\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
      strtodate(maskInicio.Text)));

  if qryVenda.IsEmpty then
    exit;
  TabGerar.TabVisible := True;
  PagUtilidade.Visible := True;
  PagUtilidade.ActivePage := TabGerar;

  edtEmail.Text := Dados.qryEmpresaEMAIL_CONTADOR.AsString;
  edtArquivo.Text := ExtractFilePath(Application.ExeName) + 'CFe\Remessa\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '.ZIP';

  edtRelatorio.Text := ExtractFilePath(Application.ExeName) + 'CFe\Remessa\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '\';
end;

procedure TfrmSat.btnRelatorioClick(Sender: TObject);
begin

  qryXML.Close;
  qryXML.Params[0].Value := maskInicio.EditText;
  qryXML.Params[1].Value := maskFim.EditText;
  qryXML.Params[2].Value := Dados.qryEmpresaCODIGO.AsInteger;
  qryXML.Open;

  if qryXML.IsEmpty then
    exit;

  try
    btnRelatorio.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelSat.fr3');
    frxReport.ShowReport;
  finally
    btnRelatorio.Enabled := True;

  end;
end;

procedure TfrmSat.btnTodosClick(Sender: TObject);
begin
  DMSat.ConfiguraSAT;
  if (qryVendaSITUACAO.AsString = 'O') or (qryVendaSITUACAO.AsString = 'G') then
  begin
    qryVenda.First;
    while not qryVenda.Eof do
    begin
      if pos('8000', DMSat.ACBrSAT1.ConsultarSAT) = 0 then
        raise Exception.Create(DMSat.ACBrSAT1.ConsultarSAT);

      TRansmitir;
      qryVenda.Next;
    end;
  end
  else
    ShowMessage
      ('Só é possivel enviar os documentos gravados ou em contingência!');

end;

procedure TfrmSat.btnTransmitirClick(Sender: TObject);
begin
  if (qryVendaSITUACAO.AsString = 'O') or (qryVendaSITUACAO.AsString = 'G') then
  begin
    if pos('8000', DMSat.ACBrSAT1.ConsultarSAT) = 0 then
      raise Exception.Create(DMSat.ACBrSAT1.ConsultarSAT);
    TRansmitir;
  end
  else
    ShowMessage
      ('Só é possivel enviar os documentos gravados ou em contingência!');
end;

procedure TfrmSat.EnviarEmail;
var
  Dir, ArqXML, para, Assunto: string;
  MS: TMemoryStream;
  P, n: Integer;
begin
  ProgressBar1.Position := 1;

  Dir := edtArquivo.Text;

  Assunto := 'XML SAT REF.' + FormatDateTime('yyyymm',
    qryVendaDATA_EMISSAO.Value);

  FEmail.GetEmail;

  ACBrMail1.Clear;
  ACBrMail1.IsHTML := false;
  ACBrMail1.Subject := Assunto;
  ACBrMail1.FromName := Dados.qryEmpresaFANTASIA.AsString;

  ACBrMail1.Host := FEmail.servidor;
  ACBrMail1.Port := FEmail.Porta;
  ACBrMail1.AddAddress(LowerCase(FEmail.usuario), '');
  ACBrMail1.Username := LowerCase(FEmail.usuario);
  ACBrMail1.From := LowerCase(FEmail.usuario);
  ACBrMail1.Password := FEmail.Senha;

  ACBrMail1.DefaultCharset := TMailCharset(27);
  ACBrMail1.IDECharset := TMailCharset(15);

  ACBrMail1.IsHTML := false;

  ACBrMail1.SetSSL := false;
  ACBrMail1.SetTLS := false;

  if FEmail.SSL then
    ACBrMail1.SetSSL := True;

  if FEmail.TLS then
    ACBrMail1.SetTLS := True;

  ACBrMail1.ReadingConfirmation := True;
  ACBrMail1.UseThread := false;
  para := LowerCase(edtEmail.Text);
  ACBrMail1.AltBody.Text := 'SEGUE EM ANEXO ARQUIVOS SAT';
  ACBrMail1.AddAttachment(edtArquivo.Text);
  ACBrMail1.AddAttachment(edtRelatorio.Text + frxPDF.FileName);
  ACBrMail1.Send(false);
  ShowMessage('E-mail Enviado Com Sucesso!');

end;

procedure TfrmSat.Button1Click(Sender: TObject);
begin
  try

    Button1.Enabled := false;

    if (Trim(edtEmail.Text) = '') then
    begin
      ShowMessage('Informe E-mail do Contador!');
      exit;
    end;

    if not FilesExists(edtArquivo.Text) then
    begin
      ShowMessage('Arquivo não existe');
      exit;
    end;

    EnviarEmail;

  finally
    Button1.Enabled := True;
  end;
end;

procedure TfrmSat.TRansmitir;
var
  i: Integer;
begin
  try
    try
      btnTransmitir.Enabled := false;
      Application.ProcessMessages;

      GerarCFe(0, 0);
      Application.ProcessMessages;
      EnviarCFe(Dados.qryNFCE_MSERIE.AsInteger, Dados.qryNFCE_MNUMERO.Value);
      Application.ProcessMessages;
    finally
      Dados.Conexao.CommitRetaining;
      btnTransmitir.Enabled := True;
    end;

  except
    on e: Exception do
      raise Exception.Create(e.Message);

  end;

end;

procedure TfrmSat.cbClienteClick(Sender: TObject);
begin

  localiza;
end;

procedure TfrmSat.cbClienteEnter(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DropDown;
end;

procedure TfrmSat.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.04);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.21);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[8].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[9].Width := round(Screen.Width * 0.08);
end;

function TfrmSat.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmSat.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmSat.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmSat.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  if idx = Column.Index then
  begin
    if vOrdem = ' ASC' then
      vOrdem := ' DESC'
    else
      vOrdem := ' ASC';
  end
  else
    vOrdem := ' ASC';

  idx := Column.Index;
  DBGrid1.Columns[0].Title.caption := 'Série';
  DBGrid1.Columns[1].Title.caption := 'Número';
  DBGrid1.Columns[2].Title.caption := 'Dt.Emissão';
  DBGrid1.Columns[3].Title.caption := 'Chave';
  DBGrid1.Columns[4].Title.caption := 'Protocolo';
  DBGrid1.Columns[5].Title.caption := 'CPF';
  DBGrid1.Columns[6].Title.caption := 'Caixa';
  DBGrid1.Columns[7].Title.caption := 'Usuário';
  DBGrid1.Columns[8].Title.caption := 'Vendedor';
  DBGrid1.Columns[9].Title.caption := 'Total';

  lblDescricao.caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.caption + '>>';

  DBGrid1.Columns[idx].Title.caption := '>>' + DBGrid1.Columns[idx]
    .Title.caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

  if (idx in [2]) then
    maskInicio.SetFocus
  else
    edtLoc.SetFocus;

end;

procedure TfrmSat.DBGrid2DblClick(Sender: TObject);
begin
  if not Dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if not qryItem.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(Application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value := qryItemID_PRODUTO.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
      qryItem.Close;
      qryItem.Params[0].Value := qryVendaCODIGO.Value;
      qryItem.Open;
    end;

  end;
end;

procedure TfrmSat.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  qryItem.Close;
  qryItem.Params[0].Value := qryVendaCODIGO.Value;
  qryItem.Open;
end;

procedure TfrmSat.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmSat.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryVenda.Prior;
  if Key = VK_DOWN then
    qryVenda.Next;
end;

procedure TfrmSat.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmSat.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';

  DecodeDate(DATE, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := datetostr(DATE);

  btnCancelar.caption := 'F2' + sLineBreak + 'Cancelar';
  btnTodos.caption := 'F3 Enviar' + sLineBreak + 'Todos';
  btnTransmitir.caption := 'F4 Enviar' + sLineBreak + 'Individual';
  btnImprimir.caption := 'F5' + sLineBreak + 'Imprimir';
  btnRelatorio.caption := 'F6' + sLineBreak + 'Relatório';
  btnPDF.caption := 'F10' + sLineBreak + 'Fechar Mês';

end;


procedure TfrmSat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnCancelar.Click;
  if Key = vk_f3 then
    btnTodos.Click;
  if Key = vk_f4 then
    btnTransmitir.Click;
  if Key = vk_f5 then
    btnImprimir.Click;
  if Key = vk_f6 then
    btnRelatorio.Click;
  if Key = vk_f9 then
    edtLoc.SetFocus;
  if Key = vk_f10 then
    btnPDFClick(self);
end;

procedure TfrmSat.FormShow(Sender: TObject);
begin

  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  if not Dados.qryTerminal.Locate('nome', Dados.Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
  end;

  qryProd.Close;
  qryProd.Open;

  qryContador.Close;
  qryContador.Open;

  tamanho;

  DBGrid1TitleClick(DBGrid1.Columns[0]);

  edtLoc.SetFocus;

end;

procedure TfrmSat.localiza;
var
  filtro, filtro1, Filtro2, ordem: string;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin

      filtro := '';
      filtro1 := '';
      Filtro2 := '';
      ordem := '';

      vSql := ' select VM.*,  pes.razao, co.descricao caixa, ve.nome vendedor, pes.email1, usu.login from NFCE_MASTER vm'
        + ' left join pessoa pes on pes.codigo=vm.id_cliente' +
        ' left join contas co on co.codigo=vm.fk_caixa' +
        ' left join vendedores ve on ve.codigo=vm.fk_vendedor' +
        ' left join usuarios usu on usu.codigo=vm.fk_usuario' + ' where' +
        ' vm.codigo>0' + ' /*where*/';

      filtro := filtro + ' and vm.fkempresa=' + Dados.qryEmpresaCODIGO.AsString;

      qryTributacao.sql.Text :=
        ' select vd.cst, vd.csosn, sum(vd.total) total from NFCE_detalhe vd' +
        ' left join NFCE_master vm on vm.codigo=vd.fkvenda' + ' where' +
        ' vm.codigo>0' + ' /*where*/' + ' group by 1,2';

      filtro := filtro + ' and vm.Data_emissao>=' +
        QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText)))
        + ' and vm.Data_emissao<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
        strtodate(maskFim.EditText)));

      Filtro2 := ' and vm.Data_emissao>=' +
        QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText)))
        + ' and vm.Data_emissao<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
        strtodate(maskFim.EditText)));

      case idx of

        0:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.serie = ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        1:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.SAT_NUMERO_CFE like ' +
                QuotedStr(edtLoc.Text + '%');
          end;

        3:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.chave like ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        4:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.protocolo like  ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        5:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.cpf_nota like ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        6:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and co.descricao like ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        7:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and usu.login like ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        8:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and ve.nome like ' +
                QuotedStr(edtLoc.Text + '%');
          end;
        9:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.total >= ' +
                stringreplace(edtLoc.Text, ',', '.', []);
          end;

      end;

      case TabSet1.TabIndex of
        0:
          filtro1 := ' and vm.situacao=''T'''; // TRANSMITIDA
        1:
          filtro1 := ' and vm.situacao=''G'''; // GRAVADO
        2:
          filtro1 := ' and vm.situacao=''O'''; // OFF
        3:
          filtro1 := ' and vm.situacao=''C'''; // CANCELADO
      end;

      case idx of
        0 .. 1:
          ordem := ' order by vm.serie, vm.SAT_NUMERO_CFE ' + vOrdem;
        2:
          ordem := ' order by vm.data_emissao ' + vOrdem;
        3:
          ordem := ' order by vm.chave ' + vOrdem;
        4:
          ordem := ' order by vm.protocolo ' + vOrdem;
        5:
          ordem := ' order by vm.cpf_nota ' + vOrdem;
        6:
          ordem := ' order by co.descricao ' + vOrdem;
        7:
          ordem := ' order by vm.serie,usu.login ' + vOrdem;
        8:
          ordem := ' order by vm.serie,ve.nome ' + vOrdem;
        9:
          ordem := ' order by vm.serie,vm.total ' + vOrdem;
      end;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          qryVenda.Close;
          qryVenda.sql.Text := vSql;
          qryVenda.sql.Text := stringreplace(qryVenda.sql.Text, '/*where*/',
            filtro + filtro1 + ordem, [rfReplaceAll]);
          qryVenda.Open;

          qryTributacao.Close;
          qryTributacao.sql.Text := stringreplace(qryTributacao.sql.Text,
            '/*where*/', filtro1 + Filtro2, [rfReplaceAll]);
          qryTributacao.Open;

          qryVenda.Last;
        end);

    end).Start;

end;

procedure TfrmSat.qryItemAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmSat.qryItemBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmSat.qryRelatorioCalcFields(DataSet: TDataSet);
begin
  if qryRelatorioSITUACAO.Value = 'T' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryRelatorioSITUACAO.Value = 'C' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryRelatorioSITUACAO.Value = 'G' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryRelatorioSITUACAO.Value = 'O' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CONTINGÊNCIA';

end;

procedure TfrmSat.qryVendaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmSat.qryVendaBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmSat.qryVendaCalcFields(DataSet: TDataSet);
begin
  if qryVendaSITUACAO.Value = 'T' then
    qryVendaVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryVendaSITUACAO.Value = 'C' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryVendaSITUACAO.Value = 'G' then
    qryVendaVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryVendaSITUACAO.Value = 'O' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CONTINGÊNCIA';
end;

procedure TfrmSat.qryVendasFPGAfterOpen(DataSet: TDataSet);
begin
  qryFPG.Close;
  qryFPG.Open;
end;

procedure TfrmSat.qryXMLCalcFields(DataSet: TDataSet);
begin
  if qryXMLSITUACAO.Value = 'T' then
    qryXMLVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryXMLSITUACAO.Value = 'C' then
    qryXMLVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryXMLSITUACAO.Value = 'G' then
    qryXMLVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryXMLSITUACAO.Value = 'O' then
    qryXMLVIRTUAL_SITUACAO.Value := 'OFF Line';
end;

procedure TfrmSat.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmSat.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
