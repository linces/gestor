unit uConsNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Math, System.zip, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversao, pcnConversaoNFe, acbrUtil, ACBrDFeSSL, blcksock,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF,
  ACBrMail,
  frxExportBaseDialog, ACBrBase, ACBrEnterTab,
  ACBrDFe, ACBrNFe, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrPosPrinter,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFeESCPOS, DBCtrlsEh,
  DBLookupEh, frxExportXLS, DBGridEh, System.Actions, Vcl.ActnList;

type
  TfrmConsNFe = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnInutiliza: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    LblSaldo: TLabel;
    btnRecuperar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnEmail: TSpeedButton;
    OpenDialog1: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryVenda: TFDQuery;
    dsVenda: TDataSource;
    qryVendaTTOTAL: TAggregateField;
    ACBrEnterTab1: TACBrEnterTab;
    qryItem: TFDQuery;
    dsItem: TDataSource;
    qryXML: TFDQuery;
    qryXMLNUMERO: TIntegerField;
    qryXMLDATA_EMISSAO: TDateField;
    qryXMLCHAVE: TStringField;
    qryXMLSERIE: TStringField;
    qryXMLXML: TMemoField;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
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
    qryVendaID_TRANSPORTADOR: TIntegerField;
    qryVendaFK_USUARIO: TIntegerField;
    qryVendaFK_CAIXA: TIntegerField;
    qryVendaFK_VENDEDOR: TIntegerField;
    qryVendaTIPO_FRETE: TStringField;
    qryVendaOBSFISCO: TMemoField;
    qryVendaOBSCONTRIBUINTE: TMemoField;
    qryVendaEMAIL: TStringField;
    qryVendaXML: TMemoField;
    qryVendaPROTOCOLO: TStringField;
    qryVendaFLAG: TStringField;
    qryVendaFKORCAMENTO: TIntegerField;
    qryVendaFKVENDA: TIntegerField;
    qryVendaFKNOTA: TIntegerField;
    qryVendaESPECIE: TStringField;
    qryVendaMARCA: TStringField;
    qryVendaNVOL: TStringField;
    qryVendaQVOL: TIntegerField;
    qryVendaPLACA: TStringField;
    qryVendaUFPLACA: TStringField;
    qryVendaRNTC: TStringField;
    qryVendaSITUACAO: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaVIRTUAL_SITUACAO: TStringField;
    qryVendaTIPO_EMISSAO: TStringField;
    qryVendaFINALIDADE: TStringField;
    qryVendaMOVIMENTO: TStringField;
    qryVendaCFOP: TIntegerField;
    qryItemCODIGO: TIntegerField;
    qryItemITEM: TSmallintField;
    qryItemID_PRODUTO: TIntegerField;
    qryItemCOD_BARRA: TStringField;
    qryItemUNIDADE: TStringField;
    qryItemDESCRICAO: TStringField;
    qryVendaRAZAO: TStringField;
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel11: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    dsCorrecao: TDataSource;
    qryCorrecao: TFDQuery;
    qryCorrecaoCODIGO: TIntegerField;
    qryCorrecaoFK_NFE: TIntegerField;
    qryCorrecaoSEQUENCIA: TIntegerField;
    qryCorrecaoFK_EMPRESA: TIntegerField;
    qryCorrecaoDATA: TDateField;
    qryCorrecaoCORRECAO: TMemoField;
    BtnCCe: TSpeedButton;
    PagUtilidade: TPageControl;
    TabInutilizar: TTabSheet;
    pnInutiliza: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtAno: TEdit;
    edtModelo: TEdit;
    edtSerie: TEdit;
    edtInicial: TEdit;
    edtFinal: TEdit;
    edtJustificativa: TEdit;
    Panel5: TPanel;
    btnInutilizar: TSpeedButton;
    btnFechar: TSpeedButton;
    TabGerar: TTabSheet;
    pnGerar: TPanel;
    ProgressBar1: TProgressBar;
    TabCarta: TTabSheet;
    Panel6: TPanel;
    Label14: TLabel;
    Panel8: TPanel;
    btnCorrecao: TSpeedButton;
    btnSairCorrecao: TSpeedButton;
    qryInutiliza: TFDQuery;
    memLista: TListBox;
    frxDBEmpresa: TfrxDBDataset;
    qryVendaEMAIL1: TStringField;
    ACBrMail1: TACBrMail;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label15: TLabel;
    edtArquivo: TEdit;
    qryRelatorio: TFDQuery;
    qryRelatorioNUMERO: TIntegerField;
    qryRelatorioDATA_EMISSAO: TDateField;
    qryRelatorioCHAVE: TStringField;
    qryRelatorioSITUACAO: TStringField;
    qryRelatorioVIRTUAL_SITUACAO: TStringField;
    frxDBDataset2: TfrxDBDataset;
    qryRelatorioPROTOCOLO: TStringField;
    Button1: TButton;
    Label13: TLabel;
    edtRelatorio: TEdit;
    btnRelatorio: TSpeedButton;
    qryVendaSUBTOTAL: TFMTBCDField;
    qryVendaTIPO_DESCONTO: TStringField;
    qryVendaDESPESAS: TFMTBCDField;
    qryVendaSEGURO: TFMTBCDField;
    qryVendaFRETE: TFMTBCDField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaTROCO: TFMTBCDField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaTOTAL_ST: TFMTBCDField;
    qryVendaBASE_IPI: TFMTBCDField;
    qryVendaTOTAL_IPI: TFMTBCDField;
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
    qryVendaBASE_ICMS_ST: TFMTBCDField;
    qryVendaVALOR_ICMS_ST: TFMTBCDField;
    qryVendaVFCPUFDEST: TFMTBCDField;
    qryVendaVICMSUFDEST: TFMTBCDField;
    qryVendaVICMSUFREMET: TFMTBCDField;
    qryVendaOUTROS: TFMTBCDField;
    qryVendaCHAVE_NFE_REFERENCIADA: TStringField;
    qryVendaMOTIVO_CONTIGENCIA: TStringField;
    qryVendaCONSUMIDOR_FINAL: TStringField;
    qryVendaNPEDIDO: TStringField;
    qryItemPRECO: TFMTBCDField;
    qryItemQTD: TFMTBCDField;
    qryItemTOTAL: TFMTBCDField;
    qryXMLTRIB_FED: TFMTBCDField;
    qryXMLTRIB_EST: TFMTBCDField;
    qryXMLTRIB_MUN: TFMTBCDField;
    qryXMLSITUACAO: TStringField;
    qryInutilizaCODIGO: TIntegerField;
    qryInutilizaNUMERO: TIntegerField;
    qryInutilizaCHAVE: TStringField;
    qryInutilizaMODELO: TStringField;
    qryInutilizaSERIE: TStringField;
    qryInutilizaDATA_EMISSAO: TDateField;
    qryInutilizaDATA_SAIDA: TDateField;
    qryInutilizaHORA_EMISSAO: TTimeField;
    qryInutilizaHORA_SAIDA: TTimeField;
    qryInutilizaID_EMITENTE: TIntegerField;
    qryInutilizaID_CLIENTE: TIntegerField;
    qryInutilizaID_TRANSPORTADOR: TIntegerField;
    qryInutilizaFK_USUARIO: TIntegerField;
    qryInutilizaFK_CAIXA: TIntegerField;
    qryInutilizaFK_VENDEDOR: TIntegerField;
    qryInutilizaTIPO_FRETE: TStringField;
    qryInutilizaSUBTOTAL: TFMTBCDField;
    qryInutilizaTIPO_DESCONTO: TStringField;
    qryInutilizaDESPESAS: TFMTBCDField;
    qryInutilizaSEGURO: TFMTBCDField;
    qryInutilizaFRETE: TFMTBCDField;
    qryInutilizaDESCONTO: TFMTBCDField;
    qryInutilizaTROCO: TFMTBCDField;
    qryInutilizaDINHEIRO: TFMTBCDField;
    qryInutilizaTOTAL: TFMTBCDField;
    qryInutilizaBASE_ST: TFMTBCDField;
    qryInutilizaTOTAL_ST: TFMTBCDField;
    qryInutilizaBASE_IPI: TFMTBCDField;
    qryInutilizaTOTAL_IPI: TFMTBCDField;
    qryInutilizaBASEICMS: TFMTBCDField;
    qryInutilizaTOTALICMS: TFMTBCDField;
    qryInutilizaBASEICMSPIS: TFMTBCDField;
    qryInutilizaTOTALICMSPIS: TFMTBCDField;
    qryInutilizaBASEICMSCOF: TFMTBCDField;
    qryInutilizaTOTALICMSCOFINS: TFMTBCDField;
    qryInutilizaBASEISS: TFMTBCDField;
    qryInutilizaTOTALISS: TFMTBCDField;
    qryInutilizaOBSFISCO: TMemoField;
    qryInutilizaOBSCONTRIBUINTE: TMemoField;
    qryInutilizaEMAIL: TStringField;
    qryInutilizaXML: TMemoField;
    qryInutilizaPROTOCOLO: TStringField;
    qryInutilizaTRIB_MUN: TFMTBCDField;
    qryInutilizaTRIB_EST: TFMTBCDField;
    qryInutilizaTRIB_FED: TFMTBCDField;
    qryInutilizaTRIB_IMP: TFMTBCDField;
    qryInutilizaFLAG: TStringField;
    qryInutilizaFKORCAMENTO: TIntegerField;
    qryInutilizaFKVENDA: TIntegerField;
    qryInutilizaFKNOTA: TIntegerField;
    qryInutilizaESPECIE: TStringField;
    qryInutilizaMARCA: TStringField;
    qryInutilizaNVOL: TStringField;
    qryInutilizaQVOL: TIntegerField;
    qryInutilizaPESOB: TFMTBCDField;
    qryInutilizaPESOL: TFMTBCDField;
    qryInutilizaPLACA: TStringField;
    qryInutilizaUFPLACA: TStringField;
    qryInutilizaRNTC: TStringField;
    qryInutilizaSITUACAO: TStringField;
    qryInutilizaFKEMPRESA: TIntegerField;
    qryInutilizaTIPO_EMISSAO: TStringField;
    qryInutilizaFINALIDADE: TStringField;
    qryInutilizaMOVIMENTO: TStringField;
    qryInutilizaCFOP: TIntegerField;
    qryInutilizaCHAVE_NFE_REFERENCIADA: TStringField;
    qryInutilizaMOTIVO_CONTIGENCIA: TStringField;
    qryInutilizaBASE_ICMS_ST: TFMTBCDField;
    qryInutilizaVALOR_ICMS_ST: TFMTBCDField;
    qryInutilizaVFCPUFDEST: TFMTBCDField;
    qryInutilizaVICMSUFDEST: TFMTBCDField;
    qryInutilizaVICMSUFREMET: TFMTBCDField;
    qryInutilizaCONSUMIDOR_FINAL: TStringField;
    qryInutilizaNPEDIDO: TStringField;
    qryInutilizaOUTROS: TFMTBCDField;
    qryRelatorioTOTAL: TFMTBCDField;
    qryVendaPESOB: TFMTBCDField;
    qryVendaPESOL: TFMTBCDField;
    DBMemo1: TDBMemo;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteEMAIL1: TStringField;
    qryClienteCLI: TStringField;
    qryVendaCNF: TStringField;
    qryVendaXML_CANCELAMENTO: TMemoField;
    qryXMLXML_CANCELAMENTO: TMemoField;
    qryXMLTRIB_IMP: TFMTBCDField;
    qryContador: TFDQuery;
    qryContadorEMAIL: TStringField;
    dsContador: TDataSource;
    edtEmail: TDBLookupComboboxEh;
    btnDuplicar: TSpeedButton;
    qryVendaAux: TFDQuery;
    qryItemAux: TFDQuery;
    qryNFE_M: TFDQuery;
    qryNFE_D: TFDQuery;
    qryNFE_MCODIGO: TIntegerField;
    qryNFE_MNUMERO: TIntegerField;
    qryNFE_MCHAVE: TStringField;
    qryNFE_MMODELO: TStringField;
    qryNFE_MSERIE: TStringField;
    qryNFE_MDATA_EMISSAO: TDateField;
    qryNFE_MDATA_SAIDA: TDateField;
    qryNFE_MHORA_EMISSAO: TTimeField;
    qryNFE_MHORA_SAIDA: TTimeField;
    qryNFE_MID_EMITENTE: TIntegerField;
    qryNFE_MID_CLIENTE: TIntegerField;
    qryNFE_MID_TRANSPORTADOR: TIntegerField;
    qryNFE_MFK_USUARIO: TIntegerField;
    qryNFE_MFK_CAIXA: TIntegerField;
    qryNFE_MFK_VENDEDOR: TIntegerField;
    qryNFE_MTIPO_FRETE: TStringField;
    qryNFE_MSUBTOTAL: TFMTBCDField;
    qryNFE_MTIPO_DESCONTO: TStringField;
    qryNFE_MDESPESAS: TFMTBCDField;
    qryNFE_MSEGURO: TFMTBCDField;
    qryNFE_MFRETE: TFMTBCDField;
    qryNFE_MDESCONTO: TFMTBCDField;
    qryNFE_MTROCO: TFMTBCDField;
    qryNFE_MDINHEIRO: TFMTBCDField;
    qryNFE_MTOTAL: TFMTBCDField;
    qryNFE_MBASE_ST: TFMTBCDField;
    qryNFE_MTOTAL_ST: TFMTBCDField;
    qryNFE_MBASE_IPI: TFMTBCDField;
    qryNFE_MTOTAL_IPI: TFMTBCDField;
    qryNFE_MBASEICMS: TFMTBCDField;
    qryNFE_MTOTALICMS: TFMTBCDField;
    qryNFE_MBASEICMSPIS: TFMTBCDField;
    qryNFE_MTOTALICMSPIS: TFMTBCDField;
    qryNFE_MBASEICMSCOF: TFMTBCDField;
    qryNFE_MTOTALICMSCOFINS: TFMTBCDField;
    qryNFE_MBASEISS: TFMTBCDField;
    qryNFE_MTOTALISS: TFMTBCDField;
    qryNFE_MOBSFISCO: TMemoField;
    qryNFE_MOBSCONTRIBUINTE: TMemoField;
    qryNFE_MEMAIL: TStringField;
    qryNFE_MXML: TMemoField;
    qryNFE_MPROTOCOLO: TStringField;
    qryNFE_MTRIB_MUN: TFMTBCDField;
    qryNFE_MTRIB_EST: TFMTBCDField;
    qryNFE_MTRIB_FED: TFMTBCDField;
    qryNFE_MTRIB_IMP: TFMTBCDField;
    qryNFE_MFLAG: TStringField;
    qryNFE_MFKORCAMENTO: TIntegerField;
    qryNFE_MFKVENDA: TIntegerField;
    qryNFE_MFKNOTA: TIntegerField;
    qryNFE_MESPECIE: TStringField;
    qryNFE_MMARCA: TStringField;
    qryNFE_MNVOL: TStringField;
    qryNFE_MQVOL: TIntegerField;
    qryNFE_MPESOB: TFMTBCDField;
    qryNFE_MPESOL: TFMTBCDField;
    qryNFE_MPLACA: TStringField;
    qryNFE_MUFPLACA: TStringField;
    qryNFE_MRNTC: TStringField;
    qryNFE_MSITUACAO: TStringField;
    qryNFE_MFKEMPRESA: TIntegerField;
    qryNFE_MTIPO_EMISSAO: TStringField;
    qryNFE_MFINALIDADE: TStringField;
    qryNFE_MMOVIMENTO: TStringField;
    qryNFE_MCFOP: TIntegerField;
    qryNFE_MCHAVE_NFE_REFERENCIADA: TStringField;
    qryNFE_MNPEDIDO: TStringField;
    qryNFE_MOUTROS: TFMTBCDField;
    qryNFE_MMOTIVO_CONTIGENCIA: TStringField;
    qryNFE_MBASE_ICMS_ST: TFMTBCDField;
    qryNFE_MVALOR_ICMS_ST: TFMTBCDField;
    qryNFE_MVFCPUFDEST: TFMTBCDField;
    qryNFE_MVICMSUFDEST: TFMTBCDField;
    qryNFE_MVICMSUFREMET: TFMTBCDField;
    qryNFE_MCONSUMIDOR_FINAL: TStringField;
    qryNFE_MVFCP: TFMTBCDField;
    qryNFE_MNUMERO_AUTORIZACAO: TStringField;
    qryNFE_MCNPJ_CARTAO: TStringField;
    qryNFE_MTPINTEGRA: TSmallintField;
    qryNFE_MTPBANDEIRA: TSmallintField;
    qryNFE_MINDPAG: TSmallintField;
    qryNFE_MTPPAG: TSmallintField;
    qryNFE_MGERA_ES: TStringField;
    qryNFE_MTOTAL_DESONERACAO: TFMTBCDField;
    qryNFE_MIMPORTOU: TStringField;
    qryNFE_MCNF: TStringField;
    qryNFE_MXML_CANCELAMENTO: TMemoField;
    qryNFE_MPERC_DESCONTO: TFMTBCDField;
    qryNFE_DCODIGO: TIntegerField;
    qryNFE_DFKNFE: TIntegerField;
    qryNFE_DID_PRODUTO: TIntegerField;
    qryNFE_DITEM: TSmallintField;
    qryNFE_DCOD_BARRA: TStringField;
    qryNFE_DNCM: TStringField;
    qryNFE_DCFOP: TStringField;
    qryNFE_DCST: TStringField;
    qryNFE_DCSOSN: TStringField;
    qryNFE_DTIPO: TStringField;
    qryNFE_DQTD: TFMTBCDField;
    qryNFE_DE_MEDIO: TFMTBCDField;
    qryNFE_DBASE_ICMS: TFMTBCDField;
    qryNFE_DALIQ_ICMS: TFMTBCDField;
    qryNFE_DVALOR_ICMS: TFMTBCDField;
    qryNFE_DCST_COFINS: TStringField;
    qryNFE_DBASE_COFINS_ICMS: TFMTBCDField;
    qryNFE_DALIQ_COFINS_ICMS: TFMTBCDField;
    qryNFE_DVALOR_COFINS_ICMS: TFMTBCDField;
    qryNFE_DCST_PIS: TStringField;
    qryNFE_DBASE_PIS_ICMS: TFMTBCDField;
    qryNFE_DALIQ_PIS_ICMS: TFMTBCDField;
    qryNFE_DVALOR_PIS_ICMS: TFMTBCDField;
    qryNFE_DTRIB_MUN: TFMTBCDField;
    qryNFE_DTRIB_EST: TFMTBCDField;
    qryNFE_DTRIB_FED: TFMTBCDField;
    qryNFE_DTRIB_IMP: TFMTBCDField;
    qryNFE_DSITUACAO: TStringField;
    qryNFE_DFLAG: TStringField;
    qryNFE_DUNIDADE: TStringField;
    qryNFE_DFRETE: TFMTBCDField;
    qryNFE_DDESPESAS: TFMTBCDField;
    qryNFE_DSEGURO: TFMTBCDField;
    qryNFE_DDESCONTO: TFMTBCDField;
    qryNFE_DBASE_IPI: TFMTBCDField;
    qryNFE_DALIQ_IPI: TFMTBCDField;
    qryNFE_DVALOR_IPI: TFMTBCDField;
    qryNFE_DCST_IPI: TStringField;
    qryNFE_DOUTROS: TFMTBCDField;
    qryNFE_DBASE_ICMS_ST: TFMTBCDField;
    qryNFE_DVALOR_ICMS_ST: TFMTBCDField;
    qryNFE_DVBCUFDEST: TFMTBCDField;
    qryNFE_DVFCP: TFMTBCDField;
    qryNFE_DPICMSUFDEST: TFMTBCDField;
    qryNFE_DPICMSINTER: TFMTBCDField;
    qryNFE_DPICMSINTERPART: TFMTBCDField;
    qryNFE_DVFCPUFDEST: TFMTBCDField;
    qryNFE_DVICMSUFDEST: TFMTBCDField;
    qryNFE_DVICMSUFREMET: TFMTBCDField;
    qryNFE_DALIQ_ICMS_ST: TFMTBCDField;
    qryNFE_DGERA_ES: TStringField;
    qryNFE_DBASE_DESONERACAO: TFMTBCDField;
    qryNFE_DALIQ_DESONERACAO: TFMTBCDField;
    qryNFE_DMOTDESICMS: TSmallintField;
    qryNFE_DVICMSDESON: TFMTBCDField;
    qryNFE_DINFO_ADICIONAIS: TStringField;
    qryNFE_DCEST: TStringField;
    qryNFE_DPRECO: TFMTBCDField;
    qryNFE_DNPEDIDO: TIntegerField;
    qryNFE_DTOTAL: TFMTBCDField;
    qryNFE_DEVENDA: TStringField;
    qryNFE_DBLOQUEADO: TStringField;
    qryNFE_DE_S: TStringField;
    qryNFE_DPICMSDEFERIDO: TFMTBCDField;
    qryNFE_DVICMSDEFERIDO: TFMTBCDField;
    qryNFE_DVALOR_ICMS_ST_RET: TFMTBCDField;
    qryVendaBASE_ST: TFMTBCDField;
    qryVendaNOME: TStringField;
    qryNFE_DDESCRICAO_COMPLEMENTAR: TStringField;
    qryNFE_DDESCRICAO: TStringField;
    qryNFE_DCOD_ENQ_IPI: TStringField;
    qryNFE_DMVA: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    maskInicio: TMaskEdit;
    LblPeriodo: TLabel;
    maskFim: TMaskEdit;
    edtLoc: TEdit;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    TabSet1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btnGerar: TSpeedButton;
    btnWhats: TSpeedButton;
    qryVendaWHATSAPP: TStringField;
    ActionList1: TActionList;
    actEnviar: TAction;
    procedure edtLocChange(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryVendaCalcFields(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInutilizaClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairCorrecaoClick(Sender: TObject);
    procedure btnCorrecaoClick(Sender: TObject);
    procedure BtnCCeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qryRelatorioCalcFields(DataSet: TDataSet);
    procedure cbClienteEnter(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnWhatsClick(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
  private
    procedure localiza;
    procedure tamanho;
    procedure GerarXml;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    procedure compactanfce(Caminho, pasta: string);
    procedure habilitaBotoes;
    procedure EnviarEmail;
    procedure GerarRelatorio;
    procedure InutilizaNFCe;
    procedure RecuperaNFe;
    procedure EstornaEstoque;
    procedure ApagaCR;
    function ClonarNFeMaster: Integer;
    procedure ClonarNFeDetalhe;
    procedure Altera(Codigo: Integer);
    procedure CartaCorrecao;
    function HabilitaNumero: Boolean;
    procedure ApagaItensInutiliza(Codigo: Integer);
    { Private declarations }
  public
    operacao, idx, idNFe: Integer;
    vOrdem, vSql: String;

    { Public declarations }
  end;

var
  frmConsNFe: TfrmConsNFe;

implementation

{$R *.dfm}

uses Udados, uNFe, ufrmStatus, uEmail, uDadosWeb, uDmNFe, uDMEstoque;


procedure TfrmConsNFe.btnInutilizaClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  TabGerar.TabVisible := false;
  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := true;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabInutilizar;

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  DecodeDate(date, ano, mes, dia);
  edtModelo.Text := '55';
  edtSerie.Text := Dados.qryTerminalSERIE.Value;
  edtAno.Text := IntToStr(ano);
  edtJustificativa.Text := 'QUEBRA DE SEQUÊNCIA DE NUMERAÇÃO';
end;

procedure TfrmConsNFe.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer(aStatus);
  Application.ProcessMessages;
end;

procedure TfrmConsNFe.actEnviarExecute(Sender: TObject);
begin
  btnWhatsClick(self);
end;

procedure TfrmConsNFe.Altera(Codigo: Integer);
begin

  operacao := 1;

  try
    btnAlterar.Enabled := false;
    frmCadNFe := TfrmCadNFe.Create(Application);

    frmCadNFe.vPessoa := UpperCase(qryVendaNOME.AsString);

    frmCadNFe.qryVenda.Close;
    frmCadNFe.qryVenda.Params[0].Value := Codigo;
    frmCadNFe.qryVenda.Open;

    frmCadNFe.qryVenda.edit;
    frmCadNFe.qryVendaSERIE.Value := Dados.qryEmpresaNFE_SERIE.AsString;

    if (frmCadNFe.qryVendaNOME.IsNull) or (frmCadNFe.qryVendaNOME.AsString = '')
    then
      frmCadNFe.qryVendaNOME.AsString := qryVendaRAZAO.AsString;

    if (qryVendaSITUACAO.Value = '1') then
    begin

      frmCadNFe.btnGravar.Enabled := true;
      frmCadNFe.btnTransmitir.Enabled := false;
      frmCadNFe.btnSair.Enabled := true;
      frmCadNFe.DBGridEh1.ReadOnly := false;
      frmCadNFe.Panel3.Enabled := true;
      frmCadNFe.DBEdit1.Enabled := true;
      frmCadNFe.PageControl2.Enabled := true;
    end;

    if (qryVendaSITUACAO.Value = '4') then
    begin

      frmCadNFe.btnGravar.Enabled := true;
      frmCadNFe.btnTransmitir.Enabled := false;
      frmCadNFe.btnSair.Enabled := true;
      frmCadNFe.DBGridEh1.ReadOnly := false;
      frmCadNFe.Panel3.Enabled := false;
      frmCadNFe.DBEdit1.Enabled := true;
      frmCadNFe.PageControl2.Enabled := false;
    end;

    if (qryVendaSITUACAO.Value = '7') then
    begin

      frmCadNFe.btnGravar.Enabled := false;
      frmCadNFe.btnTransmitir.Enabled := true;
      frmCadNFe.btnSair.Enabled := false;
      frmCadNFe.DBGridEh1.ReadOnly := true;
      frmCadNFe.Panel3.Enabled := false;
      frmCadNFe.DBEdit1.Enabled := true;
      frmCadNFe.PageControl2.Enabled := true;
    end;

    frmCadNFe.ShowModal;

  finally
    frmCadNFe.Release;
    btnFiltrar.Click;
    btnAlterar.Enabled := true;
  end;

end;

procedure TfrmConsNFe.CartaCorrecao;
begin
  try
    btnCorrecao.Enabled := false;

    if (qryCorrecao.State in dsEditmodes) then
      qryCorrecao.Post;
    Dados.Conexao.CommitRetaining;

    DmNFe.CartaCorrecao(qryVendaCHAVE.Value,
      TiraPontos(Dados.qryEmpresaCNPJ.Value), qryCorrecaoSEQUENCIA.Value,
      qryCorrecaoCORRECAO.Value, 'NFe');

  finally
    btnCorrecao.Enabled := true;
  end;
end;

procedure TfrmConsNFe.EstornaEstoque;
begin

  if qryVendaMOVIMENTO.Value = 'E' then
  begin
    dmestoque.AtualizaEstoqueFiscal('NFE', qryVendaCODIGO.Value, 'S',
      Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);

    dmestoque.AtualizaEstoqueReal('NFE', qryVendaCODIGO.Value, 'S',
      qryVendaFKVENDA.AsInteger);
  end;

  if qryVendaMOVIMENTO.Value = 'S' then
  begin
    dmestoque.AtualizaEstoqueFiscal('NFE', qryVendaCODIGO.Value, 'E',
      Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);

    dmestoque.AtualizaEstoqueReal('NFE', qryVendaCODIGO.Value, 'E',
      qryVendaFKVENDA.AsInteger);
  end;
end;

procedure TfrmConsNFe.ApagaCR;
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.sql.Text := 'delete from creceber where fk_nfe=:codigo';
  Dados.qryExecute.ParamByName('codigo').AsInteger := qryVendaCODIGO.AsInteger;
  Dados.qryExecute.Prepare;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmConsNFe.btnAlterarClick(Sender: TObject);
begin

  if qryVenda.IsEmpty then
    exit;

  if (qryVendaSITUACAO.Value <> '1') and (qryVendaSITUACAO.Value <> '4') and
    (qryVendaSITUACAO.Value <> '7') then
  begin
    ShowMessage('Não é possivel alterar NFe Transmitida!');
    exit;
  end;

  Altera(qryVendaCODIGO.AsInteger);
end;

procedure TfrmConsNFe.btnCancelarClick(Sender: TObject);
var
  idLote, Justificativa: string;
begin

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  operacao := 0;

  try
    btnCancelar.Enabled := false;
    InputQuery('Cancelamento', 'Justificativa do Cancelamento', Justificativa);

    if DmNFe.CancelaNFe(qryVendaXML.Value, Justificativa, qryVendaCODIGO.Value,
      'NFe', '3') then
    begin

      EstornaEstoque;
      ApagaCR;
      ShowMessage('Cancelamento realizado com sucesso!');
    end
    else
      ShowMessage(DmNFe.ACBrNFe.webservices.EnvEvento.EventoRetorno.xMotivo);

  finally
    btnCancelar.Enabled := true;
    btnFiltrar.Click;
  end;

end;

procedure TfrmConsNFe.BtnCCeClick(Sender: TObject);
var
  cod: Integer;
begin
  TabGerar.TabVisible := false;
  TabCarta.TabVisible := true;
  TabInutilizar.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabCarta;

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  qryCorrecao.Close;
  qryCorrecao.Params[0].Value := qryVendaCODIGO.Value;
  qryCorrecao.Open;

  qryCorrecao.First;
  cod := qryCorrecaoSEQUENCIA.AsInteger + 1;
  qryCorrecao.Insert;
  qryCorrecaoCODIGO.Value := Dados.Numerador('NFE_CARTA', 'CODIGO',
    'N', '', '');
  qryCorrecaoFK_NFE.Value := qryVendaCODIGO.Value;
  qryCorrecaoSEQUENCIA.Value := cod;
  qryCorrecaoFK_EMPRESA.Value := qryVendaFKEMPRESA.Value;
  qryCorrecaoDATA.Value := date;
  DBMemo1.SetFocus;
end;

procedure TfrmConsNFe.btnCorrecaoClick(Sender: TObject);
begin
  CartaCorrecao;
end;

procedure TfrmConsNFe.btnDuplicarClick(Sender: TObject);
begin
  if qryVenda.IsEmpty then
    exit;

  if Application.MessageBox('Deseja clonar NFe ?', 'Confirmação!', MB_YESNO) = mrYES
  then
  begin
    ClonarNFeDetalhe;
  end;
end;

procedure TfrmConsNFe.btnEmailClick(Sender: TObject);
begin
  try

    DmNFe.ConfiguraNFe('NFe');
    DmNFe.ImpressoraA4NFe('NFe');

    DmNFe.ACBrNFe.NotasFiscais.Clear;
    DmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.AsString);
    DmNFe.ACBrNFe.NotasFiscais.GravarXML();

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNumero := qryVendaNUMERO.Value;
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;
    frmEmail.vTipo := 'NFE';
    frmEmail.vTituloAnexo := '';
    frmEmail.eNotaFiscal := true;
    frmEmail.AnexaArquivo := false;
    frmEmail.LstAnexo.Clear;
    frmEmail.LstAnexo.Items.Add(qryVendaCHAVE.Value);
    frmEmail.ACBrNFe1.NotasFiscais.Clear;

    frmEmail.ACBrNFe1.NotasFiscais.LoadFromString(qryVendaXML.Value);
    frmEmail.edtEmail.Text := qryVendaEMAIL1.Value;
    frmEmail.EdtAssunto.Text := 'NFE nº' + qryVendaNUMERO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO XML E DANFE NFE nº' +
      qryVendaNUMERO.AsString;

    frmEmail.ACBrNFe1.DANFE.vTribFed := qryXMLTRIB_FED.AsFloat;
    frmEmail.ACBrNFe1.DANFE.vTribEst := qryXMLTRIB_EST.AsFloat;
    frmEmail.ACBrNFe1.DANFE.vTribMun := qryXMLTRIB_MUN.AsFloat;
    frmEmail.ACBrNFe1.DANFE.PathPDF := Dados.qryConfigPATHPDF.Value;

    frmEmail.ACBrNFe1.NotasFiscais.ImprimirPDF;

    frmEmail.ShowModal;
  finally
    frmEmail.Release;
  end;
end;

procedure TfrmConsNFe.RecuperaNFe;
begin
  try
    btnRecuperar.Enabled := false;
    if DmNFe.RecuperaNFe(qryVendaCODIGO.Value, qryVendaXML.Value,
      qryVendaTRIB_FED.AsFloat, qryVendaTRIB_EST.AsFloat,
      qryVendaTRIB_MUN.AsFloat, 'NFe') then
    begin
      dmestoque.AtualizaEstoqueFiscal('NFE', qryVendaCODIGO.Value,
        qryVendaMOVIMENTO.Value, Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);

      dmestoque.AtualizaEstoqueReal('NFE', qryVendaCODIGO.Value,
        qryVendaMOVIMENTO.Value, qryVendaFKVENDA.AsInteger);
    end;

    // nada
  finally
    btnRecuperar.Enabled := true;
  end;
end;

procedure TfrmConsNFe.btnRecuperarClick(Sender: TObject);
begin

  try

    DmNFe.ConfiguraNFe('NFe');
    DmNFe.ImpressoraA4NFe('NFe');


    btnRecuperar.Enabled := false;
    operacao := 1;

    RecuperaNFe;
  finally
    btnRecuperar.Enabled := true;
    btnFiltrar.Click;
  end;

end;

procedure TfrmConsNFe.habilitaBotoes;
begin
  btnAlterar.Visible := false;
  btnCancelar.Visible := false;
  btnInutiliza.Visible := false;
  btnRecuperar.Visible := false;
  btnImprimir.Visible := false;
  BtnCCe.Visible := false;
  btnEmail.Visible := false;
  btnRelatorio.Visible := false;
  btnDuplicar.Visible := false;
  btnGerar.Visible := false;
  btnWhats.Visible := false;

  btnNovo.Left := 0;
  btnAlterar.Left := 75;
  btnCancelar.Left := 150;
  btnInutiliza.Left := 225;
  btnRecuperar.Left := 300;
  btnImprimir.Left := 450;
  BtnCCe.Left := 525;
  btnEmail.Left := 600;
  btnRelatorio.Left := 675;
  btnDuplicar.Left := 750;
  btnGerar.Left := 825;
  btnGerar.Left := 900;
  btnWhats.Left := 975;

  btnAlterar.Visible := TabSet1.TabIndex = 1;
  btnCancelar.Visible := TabSet1.TabIndex = 0;
  btnInutiliza.Visible := true;
  btnRecuperar.Visible := TabSet1.TabIndex = 3;
  btnImprimir.Visible := TabSet1.TabIndex in [0, 2, 6];
  BtnCCe.Visible := TabSet1.TabIndex = 0;
  btnEmail.Visible := TabSet1.TabIndex = 0;
  btnRelatorio.Visible := true;
  btnDuplicar.Visible := TabSet1.TabIndex in [0, 2];
  btnGerar.Visible := TabSet1.TabIndex = 0;
  btnWhats.Visible := TabSet1.TabIndex = 0;

end;

procedure TfrmConsNFe.btnRelatorioClick(Sender: TObject);
begin
  if qryVenda.IsEmpty then
    exit;
  try
    btnRelatorio.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\ListadeNFe.fr3');
    frxReport.ShowReport;
  finally
    btnRelatorio.Enabled := true;

  end;
end;

procedure TfrmConsNFe.EnviarEmail;
var
  Dir, ArqXML, para, Assunto: string;
  MS: TMemoryStream;
  P, N: Integer;
  PathZip, PathPDF: String;
begin
  ProgressBar1.Position := 1;

  Dir := edtArquivo.Text;

  Assunto := 'XML E DANFE NF-e REF.' + FormatDateTime('yyyymm',
    qryVendaDATA_EMISSAO.Value);

  ACBrMail1.Clear;
  ACBrMail1.IsHTML := false;
  ACBrMail1.Subject := Assunto;
  ACBrMail1.FromName := Dados.qryEmpresaFANTASIA.AsString;

  ACBrMail1.Host := FEmail.servidor;
  ACBrMail1.Port := FEmail.porta;
  ACBrMail1.AddAddress(LowerCase(edtEmail.EditText), '');
  ACBrMail1.Username := LowerCase(FEmail.usuario);
  ACBrMail1.From := LowerCase(FEmail.usuario);
  ACBrMail1.Password := FEmail.Senha;

  ACBrMail1.IsHTML := false;

  ACBrMail1.DefaultCharset := TMailCharset(27);
  ACBrMail1.IDECharset := TMailCharset(15);

  ACBrMail1.SetSSL := false;
  ACBrMail1.SetTLS := false;

  if FEmail.SSL then
    ACBrMail1.SetSSL := true;

  if FEmail.TLS then
    ACBrMail1.SetTLS := true;

  ACBrMail1.ReadingConfirmation := false;
  ACBrMail1.UseThread := false;
  para := LowerCase(edtEmail.Text);
  ACBrMail1.AltBody.Text := 'SEGUE EM ANEXO ARQUIVOS DE NFC-e';
  PathZip := edtArquivo.Text;
  PathPDF := frxPDF.FileName;
  ACBrMail1.AddAttachment(PathZip);
  ACBrMail1.AddAttachment(PathPDF);
  ACBrMail1.Send(false);
  ShowMessage('E-mail Enviado Com Sucesso!');


end;

procedure TfrmConsNFe.btnSairCorrecaoClick(Sender: TObject);
begin
  qryCorrecao.Cancel;
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsNFe.btnWhatsClick(Sender: TObject);
var
  arquivo: string;
  FFone: String;
begin

  if qryVenda.IsEmpty then
    exit;

  if trim(qryVendaXML.AsString) = '' then
    exit;

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  DmNFe.ACBrNFe.NotasFiscais.Clear;
  DmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.AsString);

  arquivo := DmNFe.ACBrNFe.DANFE.PathPDF + qryVendaCHAVE.Value + '-nfe.PDF';

  if not FileExists(arquivo) then
  begin

    DmNFe.ACBrNFe.NotasFiscais.ImprimirPDF;
  end;

  if FileExists(arquivo) then
  begin

    FFone := InputBox('Digite o numero do whatsapp', 'Número:',
      trim(TiraPontos(qryVendaWHATSAPP.AsString)));
    if Length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    Dados.InsereMensagemZap(arquivo, FFone,
      'Conforme solicitado, segue DANFE da Nota Número:' +
      qryVendaNUMERO.AsString, '', qryVendaRAZAO.AsString,
      Dados.qryEmpresaRAZAO.AsString, 'NFE');
  end;

end;

procedure TfrmConsNFe.Button1Click(Sender: TObject);
begin

  try
    Button1.Enabled := false;

    if (trim(edtEmail.Text) = '') then
    begin
      ShowMessage('Informe E-mail do Contador!');
      exit;
    end;

    if not FilesExists(edtArquivo.Text) then
    begin
      ShowMessage('Arquivo não existe');
      exit;
    end;

    GerarRelatorio;
    EnviarEmail;

  finally
    Button1.Enabled := true;
  end;

end;

procedure TfrmConsNFe.cbClienteClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsNFe.cbClienteEnter(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DropDown;
end;

function TfrmConsNFe.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmConsNFe.ListarArquivos(Diretorio: string; Sub: Boolean);
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
          if Sub = true then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, true);
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

procedure TfrmConsNFe.compactanfce(Caminho, pasta: string);
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

procedure TfrmConsNFe.BitBtn1Click(Sender: TObject);
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
  Dados.qryconsulta.sql.Text := ' SELECT NUMERO FROM NFE_MASTER' +
    ' WHERE SITUACAO IN (''1'',''4'',''7'') AND ' + ' FKEMPRESA=:EMPRESA AND ' +
    ' DATA_EMISSAO between :DATA1 AND :DATA2 ORDER BY numero';
  Dados.qryconsulta.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryconsulta.Params[1].AsDate := strtodate(maskInicio.EditText);
  Dados.qryconsulta.Params[2].AsDate := strtodate(maskFim.EditText);
  Dados.qryconsulta.Open;

  if not Dados.qryconsulta.IsEmpty then
  begin
    ShowMessage('Existem Notas em ABERTO, CONTINGÊNCIA ou com DUPLICIDADE!' +
      sLineBreak + 'Não é Possivel Continuar!');
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
      qryXML.Last;
      ProgressBar1.Position := 1;
      ProgressBar1.Min := 1;
      ProgressBar1.Max := qryXML.RecordCount;
      qryXML.First;
      while not qryXML.eof do
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
    ListarArquivos(DmNFe.ACBrNFe.Configuracoes.Arquivos.GetPathNFe
      (qryXMLDATA_EMISSAO.Value, TiraPontos(Dados.qryEmpresaCNPJ.AsString),
      '55'), false);
    compactanfce(DmNFe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString), FormatDateTime('yyyymm',
      qryVendaDATA_EMISSAO.Value));
  finally
    BitBtn1.Enabled := true;
  end;

end;

procedure TfrmConsNFe.BitBtn2Click(Sender: TObject);
begin
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsNFe.GerarXml;
begin

  DmNFe.ACBrNFe.NotasFiscais.Clear;
  if (qryXMLSITUACAO.Value = '2') then
    DmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML.AsString);

  if (qryXMLSITUACAO.Value = '3') then
  begin
    if not(qryXMLXML_CANCELAMENTO.IsNull) then
      DmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML_CANCELAMENTO.AsString)
    else
      DmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML.AsString);
  end;

  DmNFe.ACBrNFe.DANFE.Cancelada := false;
  if qryXMLSITUACAO.Value = 'C' then
    DmNFe.ACBrNFe.DANFE.Cancelada := true;
  DmNFe.ACBrNFe.DANFE.vTribFed := qryXMLTRIB_FED.AsFloat +
    qryXML.FieldByName('TRIB_IMP').AsFloat;
  DmNFe.ACBrNFe.DANFE.vTribEst := qryXMLTRIB_EST.AsFloat;
  DmNFe.ACBrNFe.DANFE.vTribMun := qryXMLTRIB_MUN.AsFloat;
  DmNFe.ACBrNFe.DANFE.PathPDF := Dados.qryConfigPATHPDF.Value;
  DmNFe.ACBrNFe.NotasFiscais.ImprimirPDF;

  if (qryXMLSITUACAO.Value = '2') or (qryXMLSITUACAO.Value = '3') then
    DmNFe.ACBrNFe.NotasFiscais.GravarXML();

end;

procedure TfrmConsNFe.GerarRelatorio;
begin
  qryRelatorio.Close;
  qryRelatorio.Params[0].AsDate := strtodate(maskInicio.Text);
  qryRelatorio.Params[1].AsDate := strtodate(maskFim.Text);
  qryRelatorio.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  qryRelatorio.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelNFE.fr3');

  frxPDF.FileName := 'Lista NF-e Ref.' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '.pdf';
  frxPDF.DefaultPath := edtRelatorio.Text;
  frxPDF.ShowDialog := false;
  frxPDF.ShowProgress := false;
  frxPDF.OverwritePrompt := false;
  frxReport.PrepareReport();
  frxReport.Export(frxPDF);

end;

procedure TfrmConsNFe.btnFecharClick(Sender: TObject);
begin
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsNFe.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmConsNFe.InutilizaNFCe;
var
  i: Integer;
begin
  for i := StrToInt(edtInicial.Text) to StrToInt(edtFinal.Text) do
  begin

    Dados.qryconsulta.Close;
    Dados.qryconsulta.sql.Text :=
      'SELECT SITUACAO FROM NFE_MASTER WHERE NUMERO=:NUME';
    Dados.qryconsulta.Params[0].Value := i;
    Dados.qryconsulta.Open;

    if Dados.qryconsulta.Fields[0].Value = 'O' then
    begin
      ShowMessage('Não é possível initulizar NFCe OFFLINE!');
      abort;
    end;

    qryInutiliza.Close;
    qryInutiliza.Params[0].Value := i;
    qryInutiliza.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
    qryInutiliza.Open;
    if not qryInutiliza.IsEmpty then
    begin
      qryInutiliza.edit;
      qryInutilizaSITUACAO.Value := '5';
      qryInutiliza.Post;
      Dados.Conexao.CommitRetaining;
      Application.ProcessMessages;
      ApagaItensInutiliza(qryInutilizaCODIGO.Value);

    end
    else
    begin
      qryInutiliza.Insert;
      qryInutilizaCODIGO.Value := Dados.Numerador('NFE_MASTER', 'CODIGO',
        'N', '', '');
      qryInutilizaNUMERO.Value := i;
      qryInutilizaCHAVE.Value := 'CHAVE NÃO GERADA';
      qryInutilizaMODELO.Value := '55';
      qryInutilizaSERIE.Value := Dados.qryTerminalSERIE.Value;
      qryInutilizaDATA_EMISSAO.Value := date;
      qryInutilizaDATA_SAIDA.Value := date;
      qryInutilizaID_EMITENTE.Value := Dados.qryEmpresaCODIGO.Value;
      qryInutilizaFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryInutilizaID_CLIENTE.Value := 0;
      qryInutilizaFK_USUARIO.Value := 0;
      qryInutilizaFK_CAIXA.Value := 0;
      qryInutilizaFK_VENDEDOR.Value := 0;
      qryInutilizaSUBTOTAL.Value := 0;
      qryInutilizaTOTAL.Value := 0;
      qryInutilizaSITUACAO.Value := '5';
      qryInutiliza.Post;
      Dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TfrmConsNFe.ApagaItensInutiliza(Codigo: Integer);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.sql.Text := 'delete from NFE_DETALHE where codigo=:codigo';
  Dados.qryExecute.Params[0].Value := Codigo;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmConsNFe.btnInutilizarClick(Sender: TObject);
var
  sNomeArquivo1, sNomeArquivo2, Justificativa: String;
  i: Integer;
  ok: Boolean;
begin
  try
    btnInutiliza.Enabled := false;
    Justificativa := edtJustificativa.Text;

    ok := DmNFe.Inutilizar(Justificativa, Dados.qryEmpresaCNPJ.Value,
      edtAno.Text, edtModelo.Text, edtSerie.Text, StrToInt(edtInicial.Text),
      StrToInt(edtFinal.Text), 'NFe');

    if ok then
    begin
      InutilizaNFCe;

      sNomeArquivo1 := DmNFe.ACBrNFe.Configuracoes.Arquivos.GetPathInu
        (TiraPontos(Dados.qryEmpresaCNPJ.AsString)) + '\' +
        copy(DmNFe.ACBrNFe.webservices.Inutilizacao.id, 3, 41) + '-inu.xml';

      sNomeArquivo2 := DmNFe.ACBrNFe.Configuracoes.Arquivos.GetPathInu
        (TiraPontos(Dados.qryEmpresaCNPJ.AsString)) + '\' +
        copy(DmNFe.ACBrNFe.webservices.Inutilizacao.id, 3, 41) + '-ped-inu.xml';

      if FilesExists(sNomeArquivo1) then
      begin
        DeleteFile(sNomeArquivo1);
      end;

      ShowMessage('Inutilizado com sucesso!');
    end
    else
      ShowMessage(DmNFe.ACBrNFe.webservices.Retorno.xMotivo);

  finally
    btnInutiliza.Enabled := true;
    btnFiltrar.Click;
  end;
end;

function TfrmConsNFe.HabilitaNumero: Boolean;
begin
  Result := false;
end;

procedure TfrmConsNFe.btnNovoClick(Sender: TObject);
begin
  operacao := 1;
  try
    btnNovo.Enabled := false;
    frmCadNFe := TfrmCadNFe.Create(Application);

    frmCadNFe.vPessoa := '';

    frmCadNFe.qryVenda.Close;
    frmCadNFe.qryVenda.Params[0].Value := -1;
    frmCadNFe.qryVenda.Open;

    frmCadNFe.qryVenda.Insert;

    frmCadNFe.qryVendaCODIGO.Value := Dados.Numerador('NFE_MASTER', 'CODIGO',
      'N', '', '');
    frmCadNFe.qryVendaFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;

    frmCadNFe.qryVendaSITUACAO.Value := '1';
    frmCadNFe.qryVendaDATA_EMISSAO.Value := date;
    frmCadNFe.qryVendaDATA_SAIDA.Value := date;
    frmCadNFe.qryVendaSUBTOTAL.Value := 0;
    frmCadNFe.qryVendaTPPAG.Value := 0;
    frmCadNFe.qryVendaINDPAG.Value := 0;
    frmCadNFe.qryVendaTPINTEGRA.Value := 0;
    frmCadNFe.qryVendaTPBANDEIRA.Value := 0;
    frmCadNFe.qryVendaPERC_DESCONTO.Value := 0;
    frmCadNFe.qryVendaTOTAL.Value := 0;
    frmCadNFe.qryVendaFRETE.Value := 0;
    frmCadNFe.qryVendaOUTROS.Value := 0;
    frmCadNFe.qryVendaSEGURO.Value := 0;
    frmCadNFe.qryVendaDESCONTO.Value := 0;
    frmCadNFe.qryVendaBASEICMS.Value := 0;
    frmCadNFe.qryVendaBASE_ST.Value := 0;
    frmCadNFe.qryVendaBASEICMSPIS.Value := 0;
    frmCadNFe.qryVendaBASEICMSCOF.Value := 0;
    frmCadNFe.qryVendaTOTAL_IPI.Value := 0;
    frmCadNFe.qryVendaTOTALICMS.Value := 0;
    frmCadNFe.qryVendaTOTAL_ST.Value := 0;
    frmCadNFe.qryVendaTOTALICMSPIS.Value := 0;
    frmCadNFe.qryVendaTOTALICMSCOFINS.Value := 0;
    frmCadNFe.qryVendaFINALIDADE.Value := '1';
    frmCadNFe.qryVendaTIPO_FRETE.Value := '5';
    frmCadNFe.qryVendaFINALIDADE.Value := '0';
    frmCadNFe.qryVendaMOVIMENTO.Value := 'S';
    frmCadNFe.qryVendaMARCA.Value := 'MARCA';
    frmCadNFe.qryVendaESPECIE.Value := 'ESPECIE';
    frmCadNFe.qryVendaOBSFISCO.Value := Dados.qryEmpresaOBSFISCO.Value;
    frmCadNFe.qryVendaPESOB.Value := 0;
    frmCadNFe.qryVendaPESOL.Value := 0;
    frmCadNFe.qryVendaID_TRANSPORTADOR.Value :=
      Dados.qryConfigTRANSPORTADOR_PADRAO.Value;
    frmCadNFe.qryVendaQVOL.Value := 1;
    frmCadNFe.qryVendaCONSUMIDOR_FINAL.Value := 'N';
    frmCadNFe.qryVendaMODELO.Value := '55';
    frmCadNFe.qryVendaCFOP.Value := 5102;

    try
      frmCadNFe.qryVendaSERIE.Value :=
        IntToStr(Dados.qryEmpresaNFE_SERIE.Value);
    except
      frmCadNFe.qryVendaSERIE.Value := '1';
    end;

    frmCadNFe.btnGravar.Enabled := true;
    frmCadNFe.btnTransmitir.Enabled := true;
    frmCadNFe.btnSair.Enabled := true;
    frmCadNFe.DBGridEh1.ReadOnly := false;
    frmCadNFe.Panel3.Enabled := true;
    frmCadNFe.ShowModal;

  finally
    frmCadNFe.Release;
    btnFiltrar.Click;
    btnNovo.Enabled := true;
  end;
end;

procedure TfrmConsNFe.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.28);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.26);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.09);
end;

procedure TfrmConsNFe.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmConsNFe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmConsNFe.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmConsNFe.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Dt.Emissão';
  DBGrid1.Columns[2].Title.Caption := 'Dt.Saída';
  DBGrid1.Columns[3].Title.Caption := 'Cliente';
  DBGrid1.Columns[4].Title.Caption := 'Chave';
  DBGrid1.Columns[5].Title.Caption := 'Protocolo';
  DBGrid1.Columns[6].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

  if (idx in [1 .. 2]) then
    maskInicio.SetFocus
  else
    edtLoc.SetFocus;

end;

procedure TfrmConsNFe.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
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
    DBGrid2.Canvas.Font.Style := [];
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsNFe.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  qryItem.Close;
  qryItem.Params[0].Value := qryVendaCODIGO.Value;
  qryItem.Open;
end;

procedure TfrmConsNFe.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsNFe.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryVenda.Prior;
  if Key = VK_DOWN then
    qryVenda.Next;
end;

procedure TfrmConsNFe.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmConsNFe.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';
  DecodeDate(date, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := DateToStr(date);

  TabGerar.TabVisible := false;
  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := false;

  btnNovo.Caption := 'F2' + sLineBreak + 'Novo';
  btnAlterar.Caption := 'F3' + sLineBreak + 'Alterar';
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnInutiliza.Caption := 'F5' + sLineBreak + 'Inutilizar';
  btnRecuperar.Caption := 'F6' + sLineBreak + 'Recuperar';
  btnImprimir.Caption := 'F7' + sLineBreak + 'Imprimir';
  BtnCCe.Caption := 'F8' + sLineBreak + 'CCe';
  btnEmail.Caption := 'F9' + sLineBreak + 'Email';
  btnRelatorio.Caption := 'F10' + sLineBreak + 'Relatório';
  btnDuplicar.Caption := 'F11' + sLineBreak + 'Duplicar';
  btnGerar.Caption := 'F12' + sLineBreak + 'Fechar Mês';

end;

function TfrmConsNFe.ClonarNFeMaster: Integer;
var
  i: Integer;
begin

  Result := 0;

  qryNFE_M.Close;
  qryNFE_M.Params[0].Value := qryVendaCODIGO.Value;
  qryNFE_M.Open;

  qryVendaAux.Close;
  qryVendaAux.Params[0].Value := -1;
  qryVendaAux.Open;
  qryVendaAux.Insert;
  for i := 0 to qryNFE_M.Fields.Count - 1 do
  begin
    if (qryNFE_M.Fields[i].FieldName <> 'CHAVE') and
      (qryNFE_M.Fields[i].FieldName <> 'XML') and
      (qryNFE_M.Fields[i].FieldName <> 'PROTOCOLO') and
      (qryNFE_M.Fields[i].FieldName <> 'CNF') then
      try
        qryVendaAux.FieldByName(qryNFE_M.Fields[i].FieldName).Value :=
          qryNFE_M.FieldByName(qryNFE_M.Fields[i].FieldName).Value;
      except
        ShowMessage(qryNFE_M.Fields[i].FieldName);
      end;
  end;

  qryVendaAux.FieldByName('CODIGO').AsInteger := Dados.Numerador('NFE_MASTER',
    'CODIGO', 'N', '', '');
  qryVendaAux.FieldByName('NUMERO').AsInteger :=
    Dados.GeraNumeroNFe(Dados.qryEmpresaCODIGO.AsInteger,
    qryVendaSERIE.AsInteger) + 1;
  qryVendaAux.FieldByName('DATA_EMISSAO').AsDateTime := date;
  qryVendaAux.FieldByName('DATA_SAIDA').AsDateTime := date;
  qryVendaAux.FieldByName('HORA_EMISSAO').AsDateTime := time;
  qryVendaAux.FieldByName('HORA_SAIDA').AsDateTime := date;
  qryVendaAux.FieldByName('SITUACAO').AsInteger := 1;

  qryVendaAux.Post;
  Dados.Conexao.CommitRetaining;

  Result := qryVendaAux.FieldByName('CODIGO').AsInteger;

end;

procedure TfrmConsNFe.ClonarNFeDetalhe;
var
  j: Integer;
begin

  qryNFE_D.Close;
  qryNFE_D.Params[0].Value := qryVendaCODIGO.Value;
  qryNFE_D.Open;

  qryItemAux.Close;
  qryItemAux.Params[0].Value := -1;
  qryItemAux.Open;

  idNFe := ClonarNFeMaster;

  qryNFE_D.First;
  while not qryNFE_D.eof do
  begin

    qryItemAux.Insert;
    qryItemAux.FieldByName('CODIGO').AsInteger := Dados.Numerador('NFE_DETALHE',
      'CODIGO', 'N', '', '');
    qryItemAux.FieldByName('FKNFE').AsInteger := idNFe;

    for j := 0 to qryNFE_D.Fields.Count - 1 do
    begin

      if (qryNFE_D.Fields[j].FieldName <> 'FKNFE') and
        (qryNFE_D.Fields[j].FieldName <> 'CODIGO') then
        qryItemAux.FieldByName(qryNFE_D.Fields[j].FieldName).Value :=
          qryNFE_D.Fields[j].Value;
    end;
    qryItemAux.FieldByName('SITUACAO').AsInteger := 1;
    qryItemAux.Post;
    Dados.Conexao.CommitRetaining;

    qryNFE_D.Next;
  end;

  Altera(idNFe);

end;

procedure TfrmConsNFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f1 then
    maskInicio.SetFocus;
  if Key = vk_f2 then
    btnNovo.Click;
  if Key = vk_f3 then
    btnAlterar.Click;
  if Key = vk_f4 then
    btnCancelar.Click;
  if Key = vk_f5 then
    btnInutiliza.Click;
  if Key = vk_f6 then
    btnRecuperar.Click;
  if Key = vk_f7 then
    btnImprimir.Click;
  if Key = vk_f8 then
    BtnCCe.Click;
  if Key = vk_f9 then
    btnEmail.Click;
  if Key = vk_f10 then
    btnRelatorio.Click;
  if Key = vk_f11 then
    btnDuplicar.Click;
  if Key = vk_f12 then
    btnGerar.Click;
end;

procedure TfrmConsNFe.FormShow(Sender: TObject);
begin

  idx := 0;
  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  if not Dados.qryTerminal.Locate('nome', Dados.nometerminal, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
  end;

  tamanho;
  maskInicio.EditText := DateToStr(StartOfTheMonth(date));
  maskFim.EditText := DateToStr(date);

  DBGrid1TitleClick(DBGrid1.Columns[idx]);

  edtLoc.SetFocus;

  habilitaBotoes;

  qryContador.Close;
  qryContador.Open;

  if not qryContador.IsEmpty then
    edtEmail.KeyValue := qryContadorEMAIL.Value;
end;

procedure TfrmConsNFe.localiza;
var
  filtro, filtro1, ordem, parte: string;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin

      filtro := '';
      filtro1 := '';
      ordem := '';
      parte := '';

      if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        parte := '%';

      vSql := ' select NFE.*, PES.razao, PES.EMAIL1, pes.whatsapp from NFE_MASTER NFE  '
        + ' LEFT JOIN PESSOA PES ON PES.codigo=NFE.id_cliente ' + ' where ' +
        ' nfe.situacao in (''1'',''2'',''3'',''4'',''5'',''6'',''7'') ' +
        ' /*where*/ ';

      filtro := filtro + ' and NFE.fkempresa=' +
        Dados.qryEmpresaCODIGO.AsString;

      filtro := filtro + ' and NFE.Data_emissao>=' +
        QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText)))
        + ' and NFE.Data_emissao<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
        strtodate(maskFim.EditText)));

      case idx of
        0 .. 1:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and nfe.numero like ' +
                QuotedStr(edtLoc.Text + '%');
          end;

        2:
          begin
            filtro := filtro + ' and nfe.Data_saida>=' +
              QuotedStr(FormatDateTime('mm-dd-yyyy',
              strtodate(maskInicio.EditText))) + ' and nfe.Data_saida<=' +
              QuotedStr(FormatDateTime('mm-dd-yyyy',
              strtodate(maskFim.EditText)));
          end;

        3:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and PES.razao like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;

        4:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and nfe.chave like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        5:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and nfe.protocolo like  ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        6:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and nfe.total >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;

      end;

      case TabSet1.TabIndex of
        0:
          filtro1 := ' and nfe.situacao=''2'''; // TRANSMITIDA
        1:
          filtro1 := ' and nfe.situacao=''1'''; // ABERTA
        2:
          filtro1 := ' and nfe.situacao=''3'''; // CANCELADA
        3:
          filtro1 := ' and nfe.situacao=''4'''; // DUPLICIDADE
        4:
          filtro1 := ' and nfe.situacao=''5'''; // INUTILIZADA
        5:
          filtro1 := ' and nfe.situacao=''6'''; // DENEGADA
        6:
          filtro1 := ' and nfe.situacao=''7'''; // CONTINGENCIA

      end;

      case idx of
        0:
          ordem := ' order by nfe.numero' + vOrdem;
        1:
          ordem := ' order by nfe.data_emissao ' + vOrdem;
        2:
          ordem := ' order by nfe.data_saida ' + vOrdem;
        3:
          ordem := ' order by pes.razao ' + vOrdem;
        4:
          ordem := ' order by nfe.chave ' + vOrdem;
        5:
          ordem := ' order by nfe.protocolo' + vOrdem;
        6:
          ordem := ' order by nfe.total ' + vOrdem;

      end;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          qryVenda.Close;
          qryVenda.sql.Text := vSql;
          qryVenda.sql.Text := StringReplace(qryVenda.sql.Text, '/*where*/',
            filtro + filtro1 + ordem, [rfReplaceAll]);
          qryVenda.Open;
        end);

    end).Start;

end;

procedure TfrmConsNFe.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;
end;

procedure TfrmConsNFe.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmConsNFe.qryRelatorioCalcFields(DataSet: TDataSet);
begin
  if qryRelatorioSITUACAO.Value = '1' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryRelatorioSITUACAO.Value = '2' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryRelatorioSITUACAO.Value = '3' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryRelatorioSITUACAO.Value = '4' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryRelatorioSITUACAO.Value = '5' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
  if qryRelatorioSITUACAO.Value = '6' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'DENEGADA';
  if qryRelatorioSITUACAO.Value = '7' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CONTINGÊNCIA';

end;

procedure TfrmConsNFe.qryVendaCalcFields(DataSet: TDataSet);
begin
  if qryVendaSITUACAO.Value = '1' then
    qryVendaVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryVendaSITUACAO.Value = '2' then
    qryVendaVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryVendaSITUACAO.Value = '3' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryVendaSITUACAO.Value = '4' then
    qryVendaVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryVendaSITUACAO.Value = '5' then
    qryVendaVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
  if qryVendaSITUACAO.Value = '6' then
    qryVendaVIRTUAL_SITUACAO.Value := 'DENEGADA';
  if qryVendaSITUACAO.Value = '7' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CONTINGÊNCIA';

end;

procedure TfrmConsNFe.btnGerarClick(Sender: TObject);
begin

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  TabGerar.TabVisible := true;
  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabGerar;

  edtEmail.Text := Dados.qryEmpresaEMAIL_CONTADOR.AsString;
  edtArquivo.Text := DmNFe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '.ZIP';

  edtRelatorio.Text := DmNFe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '\';

end;

procedure TfrmConsNFe.btnImprimirClick(Sender: TObject);
begin
  try
    btnImprimir.Enabled := false;

    DmNFe.ConfiguraNFe('NFe');
    DmNFe.ImpressoraA4NFe('NFe');

    DmNFe.ImprimirNFe(qryVendaXML.Value, qryVendaSITUACAO.Value, 'NFe',
      qryVendaTRIB_FED.AsFloat, qryVendaTRIB_MUN.AsFloat,
      qryVendaTRIB_EST.AsFloat);

  finally
    btnImprimir.Enabled := true;
  end;

end;

procedure TfrmConsNFe.TabSet1Change(Sender: TObject);
begin
  habilitaBotoes;
  localiza;
end;

end.
