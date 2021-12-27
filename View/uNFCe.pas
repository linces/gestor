{ SITUAÇÃO DA VENDA
  0:ABERTA
  1:GERADA
  2:TRANSMITIDA
  3:INUTILIZADA
  4:DUPLICIDADE
  5:PEDIDO
  6:CANCELADA
  7:DENEGADO
}

unit uNFCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.zip,
  System.Classes, Vcl.Graphics, System.Math, dateutils, ACBrDFeUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversaoNFE, pcnConversao, blcksock, acbrUtil, ACBrDFeSSL,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, DBGridEh,
  DBCtrlsEh, DBLookupEh, frxExportBaseDialog, ACBrEnterTab, ACBrBase, ACBrMail,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrPosPrinter, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, ACBrDFe, ACBrNFe,
  ACBrDANFCeFortesFrA4, frxExportXLS, System.Actions, Vcl.ActnList;

type
  TfrmNFCe = class(TForm)
    Panel1: TPanel;
    LblSaldo: TLabel;
    OpenDialog1: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBRelatorioD: TfrxDBDataset;
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
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    qryVendaRAZAO: TStringField;
    qryVendaCAIXA: TStringField;
    qryVendaVENDEDOR: TStringField;
    qryVendaLOGIN: TStringField;
    qryTributacao: TFDQuery;
    frxDBTributacao: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    qryItemTTOTAL: TAggregateField;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel10: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    dsCliente: TDataSource;
    qryCliente: TFDQuery;
    qryCorrecao: TFDQuery;
    dsCorrecao: TDataSource;
    qryVendaABERTO: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaFK_VENDA: TIntegerField;
    qryInutiliza: TFDQuery;
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
    Panel6: TPanel;
    btnInutilizar: TSpeedButton;
    btnFechar: TSpeedButton;
    TabGerar: TTabSheet;
    pnGerar: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    memLista: TListBox;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edtArquivo: TEdit;
    edtRelatorio: TEdit;
    Label16: TLabel;
    Button1: TButton;
    qryRelatorioD: TFDQuery;
    qryRelatorioDNUMERO: TIntegerField;
    qryRelatorioDDATA_EMISSAO: TDateField;
    qryRelatorioDCHAVE: TStringField;
    qryRelatorioDPROTOCOLO: TStringField;
    qryRelatorioDSITUACAO: TStringField;
    qryRelatorioDVIRTUAL_SITUACAO: TStringField;
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
    qryInutilizaFK_USUARIO: TIntegerField;
    qryInutilizaFK_CAIXA: TIntegerField;
    qryInutilizaFK_VENDEDOR: TIntegerField;
    qryInutilizaCPF_NOTA: TStringField;
    qryInutilizaSUBTOTAL: TFMTBCDField;
    qryInutilizaTIPO_DESCONTO: TStringField;
    qryInutilizaDESCONTO: TFMTBCDField;
    qryInutilizaTROCO: TFMTBCDField;
    qryInutilizaDINHEIRO: TFMTBCDField;
    qryInutilizaTOTAL: TFMTBCDField;
    qryInutilizaBASEICMS: TFMTBCDField;
    qryInutilizaTOTALICMS: TFMTBCDField;
    qryInutilizaBASEICMSPIS: TFMTBCDField;
    qryInutilizaTOTALICMSPIS: TFMTBCDField;
    qryInutilizaBASEICMSCOF: TFMTBCDField;
    qryInutilizaTOTALICMSCOFINS: TFMTBCDField;
    qryInutilizaBASEISS: TFMTBCDField;
    qryInutilizaTOTALISS: TFMTBCDField;
    qryInutilizaOBSERVACOES: TMemoField;
    qryInutilizaSITUACAO: TStringField;
    qryInutilizaEMAIL: TStringField;
    qryInutilizaXML: TMemoField;
    qryInutilizaPROTOCOLO: TStringField;
    qryInutilizaMOTIVOCANCELAMENTO: TStringField;
    qryInutilizaTRIB_MUN: TFMTBCDField;
    qryInutilizaTRIB_EST: TFMTBCDField;
    qryInutilizaTRIB_FED: TFMTBCDField;
    qryInutilizaTRIB_IMP: TFMTBCDField;
    qryInutilizaFLAG: TStringField;
    qryInutilizaABERTO: TStringField;
    qryInutilizaFKEMPRESA: TIntegerField;
    qryInutilizaFK_VENDA: TIntegerField;
    qryInutilizaOUTROS: TFMTBCDField;
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
    qryCorrecaoCODIGO: TIntegerField;
    qryCorrecaoFK_NFCE: TIntegerField;
    qryCorrecaoSEQUENCIA: TIntegerField;
    qryCorrecaoFK_EMPRESA: TIntegerField;
    qryCorrecaoDATA: TDateField;
    qryCorrecaoCORRECAO: TMemoField;
    qryTributacaoCST: TStringField;
    qryTributacaoCSOSN: TStringField;
    qryTributacaoTOTAL: TFMTBCDField;
    qryRelatorioDTOTAL: TFMTBCDField;
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
    qryVendaCNF: TStringField;
    QryRelatorioR: TFDQuery;
    QryRelatorioRSITUACAO: TStringField;
    QryRelatorioRDATA_EMISSAO: TDateField;
    QryRelatorioRTOTAL: TFMTBCDField;
    QryRelatorioRVIRTUAL_SITUACAO: TStringField;
    frxDBRelatorioR: TfrxDBDataset;
    qryVendaXML_CANCELAMENTO: TMemoField;
    qryXMLXML_CANCELAMENTO: TMemoField;
    qryProdutoCEST: TStringField;
    qryTotalFPG: TFDQuery;
    qryTotalFPGTIPO: TStringField;
    qryTotalFPGVALOR: TFMTBCDField;
    qryXMLTRIB_IMP: TFMTBCDField;
    qryContador: TFDQuery;
    qryContadorEMAIL: TStringField;
    dsContador: TDataSource;
    edtEmail: TDBLookupComboboxEh;
    tabDocumentos: TTabSheet;
    edtNumero: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBGrid3: TDBGrid;
    btnTransmitirLote: TButton;
    DBText4: TDBText;
    qryDocumento: TFDQuery;
    qryDocumentoCODIGO: TIntegerField;
    qryDocumentoTIPO: TStringField;
    qryDocumentoNUMERO: TIntegerField;
    qryDocumentoTOTAL: TFMTBCDField;
    qryDocumentoID_USUARIO: TIntegerField;
    dsDocumento: TDataSource;
    qryItensPedido: TFDQuery;
    qryItensOrcamento: TFDQuery;
    qryItensPedidoCODIGO: TIntegerField;
    qryItensPedidoFKVENDA: TIntegerField;
    qryItensPedidoID_PRODUTO: TIntegerField;
    qryItensPedidoITEM: TSmallintField;
    qryItensPedidoCOD_BARRA: TStringField;
    qryItensPedidoQTD: TFMTBCDField;
    qryItensPedidoE_MEDIO: TFMTBCDField;
    qryItensPedidoPRECO: TFMTBCDField;
    qryItensPedidoVALOR_ITEM: TFMTBCDField;
    qryItensPedidoVDESCONTO: TFMTBCDField;
    qryItensPedidoTOTAL: TFMTBCDField;
    qryItensPedidoSITUACAO: TStringField;
    qryItensPedidoUNIDADE: TStringField;
    qryItensPedidoQTD_DEVOLVIDA: TFMTBCDField;
    qryItensPedidoACRESCIMO: TFMTBCDField;
    qryItensPedidoOS: TStringField;
    qryItensPedidoFK_GRADE: TIntegerField;
    qryItensPedidoID_PRODUTO_SIMILAR: TIntegerField;
    qryItensPedidoID_SERIAL: TIntegerField;
    qryOrcamento: TFDQuery;
    qryPedido: TFDQuery;
    qryOrcamentoCODIGO: TIntegerField;
    qryOrcamentoTOTAL: TFMTBCDField;
    qryPedidoCODIGO: TIntegerField;
    qryPedidoTOTAL: TFMTBCDField;
    qryDocumentoTTOTAL: TAggregateField;
    qryItensOrcamentoCODIGO: TIntegerField;
    qryItensOrcamentoFK_ORCAMENTO: TIntegerField;
    qryItensOrcamentoFK_PRODUTO: TIntegerField;
    qryItensOrcamentoQTD: TFMTBCDField;
    qryItensOrcamentoPRECO: TFMTBCDField;
    qryItensOrcamentoTOTAL: TFMTBCDField;
    qryItensOrcamentoITEM: TSmallintField;
    qryItensOrcamentoFK_GRADE: TIntegerField;
    qryItensOrcamentoDESCONTO: TFMTBCDField;
    qryItensOrcamentoTOTAL_C_DESCONTO: TFMTBCDField;
    qryDocumentoSUBTOTAL: TFMTBCDField;
    qryDocumentoDESCONTO: TFMTBCDField;
    qryDocumentoACRESCIMO: TFMTBCDField;
    qryOrcamentoSUBTOTAL: TFMTBCDField;
    qryOrcamentoDESCONTO: TFMTBCDField;
    qryPedidoSUBTOTAL: TFMTBCDField;
    qryPedidoDESCONTO: TFMTBCDField;
    qryPedidoACRESCIMO: TFMTBCDField;
    qryDocumentoTDESCONTO: TAggregateField;
    qryDocumentoTACRESCIMO: TAggregateField;
    btnAdicionar: TButton;
    cbTipo: TComboBox;
    btnSair: TButton;
    qryVendaAGRUPADO: TStringField;
    QRYNFCE_D: TFDQuery;
    QRYNFCE_DCODIGO: TIntegerField;
    QRYNFCE_DFKVENDA: TIntegerField;
    QRYNFCE_DID_PRODUTO: TIntegerField;
    QRYNFCE_DITEM: TSmallintField;
    QRYNFCE_DCOD_BARRA: TStringField;
    QRYNFCE_DNCM: TStringField;
    QRYNFCE_DCFOP: TStringField;
    QRYNFCE_DCST: TStringField;
    QRYNFCE_DCSOSN: TStringField;
    QRYNFCE_DTIPO: TStringField;
    QRYNFCE_DCST_PIS: TStringField;
    QRYNFCE_DCMUNFG: TIntegerField;
    QRYNFCE_DCLISTASERV: TIntegerField;
    QRYNFCE_DSITUACAO: TStringField;
    QRYNFCE_DFLAG: TStringField;
    QRYNFCE_DUNIDADE: TStringField;
    QRYNFCE_DDESCRICAO: TStringField;
    QRYNFCE_DQTD: TFMTBCDField;
    QRYNFCE_DE_MEDIO: TFMTBCDField;
    QRYNFCE_DPRECO: TFMTBCDField;
    QRYNFCE_DVALOR_ITEM: TFMTBCDField;
    QRYNFCE_DVDESCONTO: TFMTBCDField;
    QRYNFCE_DBASE_ICMS: TFMTBCDField;
    QRYNFCE_DALIQ_ICMS: TFMTBCDField;
    QRYNFCE_DVALOR_ICMS: TFMTBCDField;
    QRYNFCE_DP_REDUCAO_ICMS: TFMTBCDField;
    QRYNFCE_DBASE_COFINS_ICMS: TFMTBCDField;
    QRYNFCE_DALIQ_COFINS_ICMS: TFMTBCDField;
    QRYNFCE_DVALOR_COFINS_ICMS: TFMTBCDField;
    QRYNFCE_DBASE_PIS_ICMS: TFMTBCDField;
    QRYNFCE_DALIQ_PIS_ICMS: TFMTBCDField;
    QRYNFCE_DVALOR_PIS_ICMS: TFMTBCDField;
    QRYNFCE_DBASE_ISS: TFMTBCDField;
    QRYNFCE_DALIQ_ISS: TFMTBCDField;
    QRYNFCE_DVALOR_ISS: TFMTBCDField;
    QRYNFCE_DTRIB_MUN: TFMTBCDField;
    QRYNFCE_DTRIB_EST: TFMTBCDField;
    QRYNFCE_DTRIB_FED: TFMTBCDField;
    QRYNFCE_DTRIB_IMP: TFMTBCDField;
    QRYNFCE_DTOTAL: TFMTBCDField;
    QRYNFCE_DOUTROS: TFMTBCDField;
    QRYNFCE_DCST_COFINS: TStringField;
    QRYNFCE_DCEST: TStringField;
    qryNFCE_M: TFDQuery;
    qryNFCE_MCODIGO: TIntegerField;
    qryNFCE_MNUMERO: TIntegerField;
    qryNFCE_MCHAVE: TStringField;
    qryNFCE_MMODELO: TStringField;
    qryNFCE_MSERIE: TStringField;
    qryNFCE_MDATA_EMISSAO: TDateField;
    qryNFCE_MDATA_SAIDA: TDateField;
    qryNFCE_MHORA_EMISSAO: TTimeField;
    qryNFCE_MHORA_SAIDA: TTimeField;
    qryNFCE_MID_EMITENTE: TIntegerField;
    qryNFCE_MID_CLIENTE: TIntegerField;
    qryNFCE_MFK_USUARIO: TIntegerField;
    qryNFCE_MFK_CAIXA: TIntegerField;
    qryNFCE_MFK_VENDEDOR: TIntegerField;
    qryNFCE_MCPF_NOTA: TStringField;
    qryNFCE_MTIPO_DESCONTO: TStringField;
    qryNFCE_MOBSERVACOES: TMemoField;
    qryNFCE_MSITUACAO: TStringField;
    qryNFCE_MEMAIL: TStringField;
    qryNFCE_MXML: TMemoField;
    qryNFCE_MPROTOCOLO: TStringField;
    qryNFCE_MMOTIVOCANCELAMENTO: TStringField;
    qryNFCE_MFLAG: TStringField;
    qryNFCE_MABERTO: TStringField;
    qryNFCE_MFKEMPRESA: TIntegerField;
    qryNFCE_MFK_VENDA: TIntegerField;
    qryNFCE_MSUBTOTAL: TFMTBCDField;
    qryNFCE_MDESCONTO: TFMTBCDField;
    qryNFCE_MTROCO: TFMTBCDField;
    qryNFCE_MDINHEIRO: TFMTBCDField;
    qryNFCE_MTOTAL: TFMTBCDField;
    qryNFCE_MBASEICMS: TFMTBCDField;
    qryNFCE_MTOTALICMS: TFMTBCDField;
    qryNFCE_MBASEICMSPIS: TFMTBCDField;
    qryNFCE_MTOTALICMSPIS: TFMTBCDField;
    qryNFCE_MBASEICMSCOF: TFMTBCDField;
    qryNFCE_MTOTALICMSCOFINS: TFMTBCDField;
    qryNFCE_MBASEISS: TFMTBCDField;
    qryNFCE_MTOTALISS: TFMTBCDField;
    qryNFCE_MTRIB_MUN: TFMTBCDField;
    qryNFCE_MTRIB_EST: TFMTBCDField;
    qryNFCE_MTRIB_FED: TFMTBCDField;
    qryNFCE_MTRIB_IMP: TFMTBCDField;
    qryNFCE_MOUTROS: TFMTBCDField;
    qryNFCE_MSAT_NUMERO_CFE: TIntegerField;
    qryNFCE_MSAT_NUMERO_SERIE: TStringField;
    qryNFCE_MCNF: TStringField;
    frxXLSExport1: TfrxXLSExport;
    qryPV_ItensID_SERIAL: TIntegerField;
    qryPV_ItensFK_GRADE: TIntegerField;
    qryItemTTOTALDESON: TAggregateField;
    qryItemVICMSDESON: TFMTBCDField;
    GroupBox1: TGroupBox;
    LblPeriodo: TLabel;
    edtLoc: TEdit;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    lblDescricao: TLabel;
    TabSet1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel9: TPanel;
    DBText1: TDBText;
    Label9: TLabel;
    Label10: TLabel;
    DBText3: TDBText;
    Button2: TButton;
    ACBrMail1: TACBrMail;
    qryVendaWHATSAPP: TStringField;
    ActionList1: TActionList;
    actEnviar: TAction;
    Panel2: TPanel;
    btnPDF: TSpeedButton;
    btnWhats: TSpeedButton;
    btnLote: TSpeedButton;
    btnEmail: TSpeedButton;
    btnRelatorio: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnTransmitir: TSpeedButton;
    btnRecuperar: TSpeedButton;
    bbInutilizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure edtLocChange(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qryVendaCalcFields(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure bbInutilizarClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryVendaBeforeDelete(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure btnCorrecaoClick(Sender: TObject);
    procedure btnSairCorrecaoClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure qryVendaAfterPost(DataSet: TDataSet);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure btnEmailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
    procedure qryRelatorioDCalcFields(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure qryVendasFPGAfterOpen(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbClienteEnter(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryRelatorioRCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnTransmitirLoteClick(Sender: TObject);
    procedure btnLoteClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSet1Change(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
  private
    vSql1, vSql2, vsql3: String;
    procedure localiza;
    procedure tamanho;
    procedure GerarXml;
    procedure compactanfce(Caminho, pasta: string);
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    procedure TTransmitir;
    function ValidaNegocios: Boolean;
    procedure GerarNFCe(NumNFe: String);
    procedure GerarRelatorio;
    procedure InutilizaNFCe;
    procedure recuperanfce;
    procedure sTransmitida;
    procedure sCancelada;
    procedure sDuplicidade;
    procedure sInutilizada;
    procedure sDenegado;
    procedure AtualizaNFCe;
    procedure FiltraRelatorioR(tipo: string);
    procedure FiltraRelatorioD(tipo: string);
    procedure FiltraImposto(tipo: string);
    function ChacaTotais: string;
    procedure RecuperaChave;
    procedure AtualizaImpostosNFCe;
    procedure ImportarOrcamento;
    procedure ImportaPedido;
    procedure ADDOrcamento;
    procedure ADDPedido;
    procedure InsereNFe;
    function RetornaItem: Integer;
    procedure CancelaPedido;
    procedure ApagaItensInutiliza(codigo: Integer);
    procedure EnviarEmail;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: String;
    FTodos: Boolean;
    { Public declarations }
  end;

var
  frmNFCe: TfrmNFCe;

implementation

{$R *.dfm}

uses Udados, ufrmStatus, uEmail, uCadProduto, uDadosWeb, uDmNFe, uDMEstoque;


procedure TfrmNFCe.EnviarEmail;
var
  Dir, ArqXML, para, Assunto: string;
  MS: TMemoryStream;
  P, N: Integer;
  PathZip, PathPDF: String;
begin
  ProgressBar1.Position := 1;

  Dir := edtArquivo.Text;

  Assunto := 'XML E DANFE NFC-e REF.' + FormatDateTime('yyyymm',
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
  ACBrMail1.AltBody.Text := 'SEGUE EM ANEXO ARQUIVOS DE NF-E';
  PathZip := edtArquivo.Text;
  PathPDF := frxPDF.FileName;
  ACBrMail1.AddAttachment(PathZip);
  ACBrMail1.AddAttachment(PathPDF);
  ACBrMail1.Send(false);
  ShowMessage('E-mail Enviado Com Sucesso!');


end;

procedure TfrmNFCe.AtualizaImpostosNFCe;
var
  i: Integer;
begin


  // importa cabecalho

  QRYNFCE_D.Close;
  QRYNFCE_D.Params[0].Value := qryNFCE_MCODIGO.Value;
  QRYNFCE_D.Open;

  i := 1;
  QRYNFCE_D.First;
  while not QRYNFCE_D.Eof do
  begin

    qryProduto.Close;
    qryProduto.Params[0].Value := QRYNFCE_DID_PRODUTO.Value;
    qryProduto.Open;

    QRYNFCE_D.Edit;
    QRYNFCE_DITEM.Value := i;
    QRYNFCE_DCOD_BARRA.Value := qryProdutoCODBARRA.Value;
    QRYNFCE_DNCM.Value := qryProdutoNCM.Value;
    QRYNFCE_DCFOP.Value := qryProdutoCFOP.Value;
    QRYNFCE_DCST.Value := qryProdutoCSTICMS.Value;
    QRYNFCE_DCST_PIS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCST_COFINS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCSOSN.Value := qryProdutoCSOSN.Value;
    QRYNFCE_DCEST.Value := qryProdutoCEST.Value;
    QRYNFCE_DTIPO.Value := qryProdutoTIPO.Value;

    QRYNFCE_DUNIDADE.Value := qryItemUNIDADE.Value;

    if (qryItemUNIDADE.IsNull) or (qryItemUNIDADE.AsString = '') then
      QRYNFCE_DUNIDADE.Value := qryProdutoUNIDADE.Value;

    QRYNFCE_DALIQ_ICMS.AsFloat := qryProdutoALIQ_ICM.Value;
    QRYNFCE_DBASE_ICMS.AsFloat := 0;
    if QRYNFCE_DALIQ_ICMS.AsFloat > 0 then
      QRYNFCE_DBASE_ICMS.AsFloat := qryItemTOTAL.AsFloat;
    QRYNFCE_DVALOR_ICMS.AsFloat :=
      SimpleRoundTo((qryProdutoALIQ_ICM.AsFloat * qryItemTOTAL.AsFloat)
      / 100, -2);

    QRYNFCE_DALIQ_COFINS_ICMS.AsFloat := qryProdutoALIQ_COF.Value;
    QRYNFCE_DBASE_COFINS_ICMS.AsFloat := 0;
    if QRYNFCE_DALIQ_COFINS_ICMS.AsFloat > 0 then
      QRYNFCE_DBASE_COFINS_ICMS.AsFloat := qryItemTOTAL.AsFloat;
    QRYNFCE_DVALOR_COFINS_ICMS.AsFloat :=
      SimpleRoundTo((qryProdutoALIQ_COF.AsFloat * qryItemTOTAL.AsFloat /
      100), -2);

    QRYNFCE_DALIQ_PIS_ICMS.Value := qryProdutoALIQ_PIS.Value;
    QRYNFCE_DBASE_PIS_ICMS.Value := 0;
    if QRYNFCE_DALIQ_PIS_ICMS.Value > 0 then
      QRYNFCE_DBASE_PIS_ICMS.Value := qryItemTOTAL.AsFloat;
    QRYNFCE_DVALOR_PIS_ICMS.Value :=
      SimpleRoundTo((qryProdutoALIQ_PIS.Value * qryItemTOTAL.AsFloat /
      100), -2);

    QRYNFCE_DOUTROS.AsFloat := qryItemOUTROS.AsFloat;

    QRYNFCE_DBASE_ISS.Value := 0;
    QRYNFCE_DALIQ_ISS.Value := 0;
    QRYNFCE_DVALOR_ISS.Value := 0;

    qryIBPT.Close;
    qryIBPT.Params[0].Value := qryProdutoNCM.Value;
    qryIBPT.Open;

    if qryIBPT.IsEmpty then
      raise Exception.Create('NCM Informado não foi encontrado!');

    QRYNFCE_DTRIB_MUN.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTMUNICIPAL.Value, '.', ',',
      [])) * QRYNFCE_DTOTAL.AsFloat) / 100, -2);

    QRYNFCE_DTRIB_EST.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTESTADUAL.Value, '.', ',',
      [])) * QRYNFCE_DTOTAL.AsFloat) / 100, -2);

    QRYNFCE_DTRIB_FED.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTNACIONALFEDERAL.Value, '.',
      ',', [])) * QRYNFCE_DTOTAL.AsFloat) / 100, -2);

    QRYNFCE_DTRIB_IMP.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTIMPORTADOSFEDERAL.Value,
      '.', ',', [])) * QRYNFCE_DTOTAL.AsFloat) / 100, -2);

    QRYNFCE_D.Post;
    Dados.Conexao.CommitRetaining;
    i := i + 1;
    QRYNFCE_D.Next;
  end;

  qrySomaNFCe.Close;
  qrySomaNFCe.Params[0].Value := qryNFCE_MCODIGO.Value;
  qrySomaNFCe.Open;

  qryNFCE_M.Edit;

  qryNFCE_MSUBTOTAL.Value := SimpleRoundTo(qrySomaNFCeTOTAL.AsFloat, -2);

  qryNFCE_MDESCONTO.Value := SimpleRoundTo(qrySomaNFCeDESCONTOS.AsFloat, -2);

  qryNFCE_MOUTROS.Value := SimpleRoundTo(qrySomaNFCeOUTROS.AsFloat, -2);

  qryNFCE_MTOTAL.Value := SimpleRoundTo(qryNFCE_MSUBTOTAL.AsFloat -
    qryNFCE_MDESCONTO.AsFloat + qryNFCE_MOUTROS.AsFloat, -2);

  qryNFCE_MBASEICMS.Value := SimpleRoundTo(qrySomaNFCeBASE_ICMS.AsFloat, -2);

  qryNFCE_MTOTALICMS.Value := SimpleRoundTo(qrySomaNFCeVALOR_ICMS.AsFloat, -2);

  qryNFCE_MBASEISS.Value := SimpleRoundTo(qrySomaNFCeBASE_ISS.AsFloat, -2);

  qryNFCE_MTOTALISS.Value := SimpleRoundTo(qrySomaNFCeVALOR_ISS.AsFloat, -2);

  qryNFCE_MBASEICMSPIS.Value :=
    SimpleRoundTo(qrySomaNFCeBASE_PIS_ICMS.AsFloat, -2);

  qryNFCE_MTOTALICMSPIS.Value :=
    SimpleRoundTo(qrySomaNFCeVALOR_PIS_ICMS.AsFloat, -2);

  qryNFCE_MBASEICMSCOF.Value :=
    SimpleRoundTo(qrySomaNFCeBASE_COF_ICMS.AsFloat, -2);

  qryNFCE_MTOTALICMSCOFINS.Value :=
    SimpleRoundTo(qrySomaNFCeVALOR_COF_ICMS.AsFloat, -2);

  qryNFCE_MTRIB_MUN.Value := SimpleRoundTo(qrySomaNFCeTOTALMUN.AsFloat, -2);

  qryNFCE_MTRIB_IMP.Value := SimpleRoundTo(qrySomaNFCeTOTALIMP.AsFloat, -2);

  qryNFCE_MTRIB_EST.Value := SimpleRoundTo(qrySomaNFCeTOTALEST.AsFloat, -2);

  qryNFCE_MTRIB_FED.Value := SimpleRoundTo(qrySomaNFCeTOTALFED.AsFloat, -2);

  qryNFCE_M.Post;
end;

procedure TfrmNFCe.actEnviarExecute(Sender: TObject);
begin
  btnWhatsClick(self);
end;

procedure TfrmNFCe.ADDOrcamento;
begin
  qryOrcamento.Close;
  qryOrcamento.Params[0].Value := StrToIntDef(edtNumero.Text, 0);
  qryOrcamento.Open;
  if qryOrcamento.IsEmpty then
    raise Exception.Create('Orçamento não foi localizado!');

  if qryDocumento.Locate('CODIGO', edtNumero.Text) then
    exit;

  qryDocumento.Insert;
  qryDocumentoCODIGO.Value := Dados.Numerador('NFCE_DOCUMENTOS', 'CODIGO',
    'N', '', '');
  qryDocumentoTIPO.Value := 'ORCAMENTO';
  qryDocumentoNUMERO.Value := qryOrcamentoCODIGO.Value;
  qryDocumentoSUBTOTAL.AsFloat := qryOrcamentoTOTAL.AsFloat;
  qryDocumentoDESCONTO.AsFloat := qryOrcamentoDESCONTO.AsFloat;
  qryDocumentoACRESCIMO.AsFloat := 0;
  qryDocumentoTOTAL.AsFloat := qryOrcamentoTOTAL.AsFloat;
  qryDocumentoID_USUARIO.AsFloat := Dados.idUsuario;
  qryDocumento.Post;
  Dados.Conexao.Commit;

end;

procedure TfrmNFCe.ADDPedido;
begin
  qryPedido.Close;
  qryPedido.Params[0].Value := StrToIntDef(edtNumero.Text, 0);
  qryPedido.Open;
  if qryPedido.IsEmpty then
    raise Exception.Create('Pedido não foi localizado!');
  qryItensPedido.Close;
  qryItensPedido.Params[0].Value := qryOrcamentoCODIGO.AsInteger;
  qryItensPedido.Open;

  if qryDocumento.Locate('CODIGO', edtNumero.Text) then
    exit;

  qryDocumento.Insert;
  qryDocumentoCODIGO.Value := Dados.Numerador('NFCE_DOCUMENTOS', 'CODIGO',
    'N', '', '');
  qryDocumentoTIPO.Value := 'PEDIDO';
  qryDocumentoNUMERO.Value := qryPedidoCODIGO.Value;
  qryDocumentoSUBTOTAL.AsFloat := qryPedidoSUBTOTAL.AsFloat;
  qryDocumentoDESCONTO.AsFloat := qryPedidoDESCONTO.AsFloat;
  qryDocumentoACRESCIMO.AsFloat := qryPedidoACRESCIMO.AsFloat;
  qryDocumentoTOTAL.AsFloat := qryPedidoTOTAL.AsFloat;
  qryDocumentoID_USUARIO.AsFloat := Dados.idUsuario;
  qryDocumento.Post;
  Dados.Conexao.Commit;

end;

function TfrmNFCe.RetornaItem: Integer;
begin

  Result := 1;
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    'SELECT MAX(ITEM) FROM NFCE_DETALHE WHERE FKVENDA=:COD';
  Dados.qryConsulta.Params[0].AsInteger := qryNFCE_MCODIGO.AsInteger;;
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.IsEmpty then
    Result := Dados.qryConsulta.Fields[0].AsInteger + 1;

end;

procedure TfrmNFCe.ImportaPedido;
var
  i: Integer;
begin

  qryItensPedido.Close;
  qryItensPedido.Params[0].AsInteger := qryDocumentoNUMERO.AsInteger;
  qryItensPedido.Open;

  QRYNFCE_D.Close;
  QRYNFCE_D.Params[0].Value := qryNFCE_MCODIGO.AsInteger;
  QRYNFCE_D.Open;

  i := RetornaItem;

  qryItensPedido.First;

  while not qryItensPedido.Eof do
  begin

    qryProduto.Close;
    qryProduto.Params[0].Value := qryItensPedidoID_PRODUTO.Value;
    qryProduto.Open;

    QRYNFCE_D.Insert;
    QRYNFCE_DCODIGO.Value := Dados.Numerador('NFCE_DETALHE', 'CODIGO',
      'N', '', '');
    QRYNFCE_DFKVENDA.Value := qryNFCE_MCODIGO.Value;

    QRYNFCE_DID_PRODUTO.Value := qryItensPedidoID_PRODUTO.Value;

    QRYNFCE_DITEM.Value := i;

    QRYNFCE_DCOD_BARRA.Value := qryProdutoCODBARRA.Value;

    QRYNFCE_DNCM.Value := qryProdutoNCM.Value;
    QRYNFCE_DCFOP.Value := qryProdutoCFOP.Value;
    QRYNFCE_DCST.Value := qryProdutoCSTICMS.Value;
    QRYNFCE_DCST_PIS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCST_COFINS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCSOSN.Value := qryProdutoCSOSN.Value;
    QRYNFCE_DCEST.Value := qryProdutoCEST.Value;
    QRYNFCE_DTIPO.Value := qryProdutoTIPO.Value;
    QRYNFCE_DUNIDADE.Value := qryProdutoUNIDADE.Value;

    QRYNFCE_DQTD.AsFloat := qryItensPedidoQTD.AsFloat;

    QRYNFCE_DPRECO.AsFloat := qryItensPedidoPRECO.AsFloat;

    QRYNFCE_DVALOR_ITEM.AsFloat := qryItensPedidoVALOR_ITEM.AsFloat;
    QRYNFCE_DVDESCONTO.AsFloat := qryItensPedidoVDESCONTO.AsFloat;

    if Dados.qryEmpresaCRT.Value = 1 then // simples nacional
    begin
      QRYNFCE_DALIQ_ICMS.AsFloat := 0;
      QRYNFCE_DBASE_ICMS.AsFloat := 0;
      QRYNFCE_DVALOR_ICMS.AsFloat := 0;
    end
    else
    begin
      QRYNFCE_DALIQ_ICMS.AsFloat := qryProdutoALIQ_ICM.Value;
      QRYNFCE_DBASE_ICMS.AsFloat := 0;
      if QRYNFCE_DALIQ_ICMS.AsFloat > 0 then
        QRYNFCE_DBASE_ICMS.AsFloat := qryItensPedidoTOTAL.AsFloat;
      QRYNFCE_DVALOR_ICMS.AsFloat :=
        SimpleRoundTo((qryProdutoALIQ_ICM.AsFloat * qryItensPedidoTOTAL.AsFloat)
        / 100, -2);
    end;

    QRYNFCE_DALIQ_COFINS_ICMS.AsFloat := qryProdutoALIQ_COF.Value;
    QRYNFCE_DBASE_COFINS_ICMS.AsFloat := 0;
    if QRYNFCE_DALIQ_COFINS_ICMS.AsFloat > 0 then
      QRYNFCE_DBASE_COFINS_ICMS.AsFloat := qryItensPedidoTOTAL.AsFloat;
    QRYNFCE_DVALOR_COFINS_ICMS.AsFloat :=
      SimpleRoundTo((qryProdutoALIQ_COF.AsFloat * qryItensPedidoTOTAL.AsFloat /
      100), -2);

    QRYNFCE_DALIQ_PIS_ICMS.Value := qryProdutoALIQ_PIS.Value;
    QRYNFCE_DBASE_PIS_ICMS.Value := 0;
    if QRYNFCE_DALIQ_PIS_ICMS.Value > 0 then
      QRYNFCE_DBASE_PIS_ICMS.Value := qryItensPedidoTOTAL.AsFloat;
    QRYNFCE_DVALOR_PIS_ICMS.Value :=
      SimpleRoundTo((qryProdutoALIQ_PIS.Value * qryItensPedidoTOTAL.AsFloat /
      100), -2);

    QRYNFCE_DBASE_ISS.Value := 0;
    QRYNFCE_DALIQ_ISS.Value := 0;
    QRYNFCE_DVALOR_ISS.Value := 0;

    qryIBPT.Close;
    qryIBPT.Params[0].Value := qryProdutoNCM.Value;
    qryIBPT.Open;
    if qryIBPT.IsEmpty then
    begin
      ShowMessage('NCM do produto ' + qryProdutoCODIGO.AsString + '-' +
        qryProdutoDESCRICAO.AsString + #13 + 'Não foi encontrado!');
      exit;
    end;

    QRYNFCE_DTRIB_MUN.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTMUNICIPAL.Value, '.', ',',
      [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_EST.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTESTADUAL.Value, '.', ',',
      [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_FED.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTNACIONALFEDERAL.Value, '.',
      ',', [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_IMP.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTIMPORTADOSFEDERAL.Value,
      '.', ',', [])) * qryItemTOTAL.AsFloat) / 100, -2);

    QRYNFCE_D.Post;
    Dados.Conexao.CommitRetaining;
    i := i + 1;
    qryItensPedido.Next;
  end;
end;

procedure TfrmNFCe.ImportarOrcamento;
var
  i: Integer;
begin

  i := RetornaItem;

  qryItensOrcamento.Close;
  qryItensOrcamento.Params[0].AsInteger := qryDocumentoNUMERO.AsInteger;
  qryItensOrcamento.Open;

  QRYNFCE_D.Close;
  QRYNFCE_D.Params[0].Value := qryNFCE_MCODIGO.AsInteger;
  QRYNFCE_D.Open;

  qryItensOrcamento.First;

  while not qryItensOrcamento.Eof do
  begin

    qryProduto.Close;
    qryProduto.Params[0].Value := qryItensOrcamentoFK_PRODUTO.Value;
    qryProduto.Open;

    QRYNFCE_D.Insert;
    QRYNFCE_DCODIGO.Value := Dados.Numerador('NFCE_DETALHE', 'CODIGO',
      'N', '', '');
    QRYNFCE_DFKVENDA.Value := qryNFCE_MCODIGO.Value;

    QRYNFCE_DID_PRODUTO.Value := qryItensOrcamentoFK_ORCAMENTO.Value;

    QRYNFCE_DITEM.Value := i;

    QRYNFCE_DCOD_BARRA.Value := qryProdutoCODBARRA.Value;

    QRYNFCE_DNCM.Value := qryProdutoNCM.Value;
    QRYNFCE_DCFOP.Value := qryProdutoCFOP.Value;
    QRYNFCE_DCST.Value := qryProdutoCSTICMS.Value;
    QRYNFCE_DCST_PIS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCST_COFINS.Value := qryProdutoCSTS.Value;
    QRYNFCE_DCSOSN.Value := qryProdutoCSOSN.Value;
    QRYNFCE_DCEST.Value := qryProdutoCEST.Value;
    QRYNFCE_DTIPO.Value := qryProdutoTIPO.Value;
    QRYNFCE_DUNIDADE.Value := qryProdutoUNIDADE.Value;
    QRYNFCE_DQTD.AsFloat := qryItensOrcamentoQTD.AsFloat;
    QRYNFCE_DPRECO.AsFloat := qryItensOrcamentoPRECO.AsFloat;

    QRYNFCE_DVALOR_ITEM.AsFloat := qryItensOrcamentoTOTAL.AsFloat;
    QRYNFCE_DVDESCONTO.AsFloat := qryItensOrcamentoDESCONTO.AsFloat;
    QRYNFCE_DOUTROS.AsFloat := 0;

    if Dados.qryEmpresaCRT.Value = 1 then // simples nacional
    begin
      QRYNFCE_DALIQ_ICMS.AsFloat := 0;
      QRYNFCE_DBASE_ICMS.AsFloat := 0;
      QRYNFCE_DVALOR_ICMS.AsFloat := 0;
    end
    else
    begin
      QRYNFCE_DALIQ_ICMS.AsFloat := qryProdutoALIQ_ICM.Value;
      QRYNFCE_DBASE_ICMS.AsFloat := 0;
      if QRYNFCE_DALIQ_ICMS.AsFloat > 0 then
        QRYNFCE_DBASE_ICMS.AsFloat := qryItensOrcamentoTOTAL.AsFloat;
      QRYNFCE_DVALOR_ICMS.AsFloat :=
        SimpleRoundTo((qryProdutoALIQ_ICM.AsFloat *
        qryItensOrcamentoTOTAL.AsFloat) / 100, -2);
    end;

    QRYNFCE_DALIQ_COFINS_ICMS.AsFloat := qryProdutoALIQ_COF.Value;
    QRYNFCE_DBASE_COFINS_ICMS.AsFloat := 0;
    if QRYNFCE_DALIQ_COFINS_ICMS.AsFloat > 0 then
      QRYNFCE_DBASE_COFINS_ICMS.AsFloat := qryItensOrcamentoTOTAL.AsFloat;
    QRYNFCE_DVALOR_COFINS_ICMS.AsFloat :=
      SimpleRoundTo((qryProdutoALIQ_COF.AsFloat * qryItensOrcamentoTOTAL.AsFloat
      / 100), -2);

    QRYNFCE_DALIQ_PIS_ICMS.Value := qryProdutoALIQ_PIS.Value;
    QRYNFCE_DBASE_PIS_ICMS.Value := 0;
    if QRYNFCE_DALIQ_PIS_ICMS.Value > 0 then
      QRYNFCE_DBASE_PIS_ICMS.Value := qryItensOrcamentoTOTAL.AsFloat;
    QRYNFCE_DVALOR_PIS_ICMS.Value :=
      SimpleRoundTo((qryProdutoALIQ_PIS.Value * qryItensOrcamentoTOTAL.AsFloat /
      100), -2);

    QRYNFCE_DBASE_ISS.Value := 0;
    QRYNFCE_DALIQ_ISS.Value := 0;
    QRYNFCE_DVALOR_ISS.Value := 0;

    qryIBPT.Close;
    qryIBPT.Params[0].Value := qryProdutoNCM.Value;
    qryIBPT.Open;
    if qryIBPT.IsEmpty then
    begin
      ShowMessage('NCM do produto ' + qryProdutoCODIGO.AsString + '-' +
        qryProdutoDESCRICAO.AsString + #13 + 'Não foi encontrado!');
      exit;
    end;

    QRYNFCE_DTRIB_MUN.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTMUNICIPAL.Value, '.', ',',
      [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_EST.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTESTADUAL.Value, '.', ',',
      [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_FED.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTNACIONALFEDERAL.Value, '.',
      ',', [])) * qryItemTOTAL.AsFloat) / 100, -2);
    QRYNFCE_DTRIB_IMP.AsFloat :=
      SimpleRoundTo((strtofloat(stringreplace(qryIBPTIMPORTADOSFEDERAL.Value,
      '.', ',', [])) * qryItemTOTAL.AsFloat) / 100, -2);

    QRYNFCE_D.Post;
    Dados.Conexao.CommitRetaining;
    i := i + 1;
    qryItensOrcamento.Next;
  end;
end;

procedure TfrmNFCe.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer(aStatus);
  Application.ProcessMessages;
end;

procedure TfrmNFCe.bbInutilizarClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin

  Dados.AbreTerminal;

  if Dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
    dmnfe.ImpressoraA4NFCe('NFCe')
  else
    dmnfe.ImpressoraBobina('NFCe');

  dmnfe.ConfiguraNFe('NFCe');

  TabGerar.TabVisible := false;
  TabInutilizar.TabVisible := true;
  tabDocumentos.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabInutilizar;

  DecodeDate(DATE, ano, mes, dia);
  edtModelo.Text := '65';
  edtSerie.Text := qryVendaSERIE.Value;
  edtAno.Text := IntToStr(ano);
  edtJustificativa.Text := 'QUEBRA DE SEQUÊNCIA DE NUMERAÇÃO';
  edtInicial.Text := qryVendaNUMERO.AsString;
  edtFinal.Text := qryVendaNUMERO.AsString;

end;

procedure TfrmNFCe.CancelaPedido;
begin

  qryPV.Close;
  qryPV.Params[0].Value := qryVendaFK_VENDA.Value;
  qryPV.Open;

  Dados.EstornaFinanceiro(qryPVCODIGO.Value);

  try

    qryPV_Itens.Close;
    qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
    qryPV_Itens.Open;

    qryPV_Itens.DisableControls;
    qryPV_Itens.First;

    while not qryPV_Itens.Eof do
    begin

      if qryPV_ItensID_SERIAL.AsInteger > 0 then
        Dados.estornaserial(qryPV_ItensID_SERIAL.AsInteger);

      dmEstoque.AtualizaEstoque(qryPV_ItensID_PRODUTO.AsInteger,
        qryPV_ItensQTD.AsFloat, 0, 'E', 'R');

      dmEstoque.AtualizaComposicao(qryPV_ItensID_PRODUTO.AsInteger,
        qryPV_ItensQTD.AsFloat, 0, 'E', 'R');

      dmEstoque.AtualizaGrade(qryPV_ItensID_PRODUTO.AsInteger,
        qryPV_ItensID_PRODUTO.AsInteger, 0, 'E', 0);

      qryPV_Itens.Next;
    end;

  finally
    qryPV_Itens.EnableControls;
  end;
end;

procedure TfrmNFCe.btnCancelarClick(Sender: TObject);
var
  Justificativa: string;
begin

  try

    Dados.AbreTerminal;
    if Dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
      dmnfe.ImpressoraA4NFCe('NFCe')
    else
      dmnfe.ImpressoraBobina('NFCe');

    dmnfe.ConfiguraNFe('NFCe');

    btnCancelar.Enabled := false;

    InputQuery('Cancelamento', 'Justificativa do Cancelamento', Justificativa);

    if dmnfe.CancelaNFe(qryVendaXML.Value, Justificativa, qryVendaCODIGO.Value,
      'NFCe', 'C') then
    begin
      CancelaPedido;

      dmEstoque.AtualizaEstoqueFiscal('NFCE', qryVendaCODIGO.Value, 'E',
        Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);

      ShowMessage('Cancelamento realizado com sucesso!');
    end
    else
    begin
      ShowMessage(dmnfe.ACBrNFe.webservices.EnvEvento.EventoRetorno.xMotivo);
    end;
  finally
    btnCancelar.Enabled := true;
    btnFiltrarClick(self);
  end;

end;

procedure TfrmNFCe.btnCorrecaoClick(Sender: TObject);
begin
  if (qryCorrecao.State in dsEditmodes) then
    qryCorrecao.Post;
  Dados.Conexao.CommitRetaining;

  dmnfe.ACBrNFe.EventoNFe.Evento.Clear;
  with dmnfe.ACBrNFe.EventoNFe.Evento.Add do
  begin
    infEvento.chNFe := qryVendaCHAVE.Value;
    infEvento.CNPJ := TiraPontos(Dados.qryEmpresaCNPJ.Value);
    infEvento.dhEvento := now;
    infEvento.tpEvento := teCCe;
    infEvento.nSeqEvento := qryCorrecaoSEQUENCIA.Value;
    infEvento.detEvento.xCorrecao := qryCorrecaoCORRECAO.Value;
  end;
  dmnfe.ACBrNFe.EnviarEvento(StrToInt('1'));

end;

procedure TfrmNFCe.btnEmailClick(Sender: TObject);
begin
  try

    Dados.AbreTerminal;
    dmnfe.ImpressoraA4NFCe('NFCe');
    dmnfe.ConfiguraNFe('NFCe');

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNumero := qryVendaNUMERO.Value;
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := 'NFCE';
    frmEmail.vTituloAnexo := '';
    frmEmail.eNotaFiscal := true;
    frmEmail.AnexaArquivo := false;

    dmnfe.ACBrNFe.NotasFiscais.Clear;
    dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.AsString);
    dmnfe.ACBrNFe.NotasFiscais.GravarXML();

    frmEmail.ACBrNFe1.NotasFiscais.Clear;
    frmEmail.LstAnexo.Items.Add(qryVendaCHAVE.Value);
    frmEmail.ACBrNFe1.NotasFiscais.LoadFromString(qryVendaXML.AsString);
    frmEmail.edtEmail.Text := qryVendaEMAIL1.Value;
    frmEmail.ACBrNFe1.Configuracoes.Geral.ModeloDF := TpcnModeloDF(1);
    frmEmail.EdtAssunto.Text := 'NFC-e nº' + qryVendaNUMERO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO XML E DANFE NFC-e nº' +
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

procedure TfrmNFCe.btnFecharClick(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmNFCe.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

function TfrmNFCe.ValidaNegocios: Boolean;
var
  Msg: String;
  Inicio: TDateTime;
  Ok: Boolean;
  Tempo: String;
begin
  Result := true;
  Inicio := now;
  Ok := dmnfe.ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(Msg);
  Tempo := FormatDateTime('hh:nn:ss:zzz', now - Inicio);

  if not Ok then
  begin
    Result := false;
    ShowMessage('Erros encontrados' + #13 + Msg + #13 + sLineBreak + #13 +
      'Tempo: ' + Tempo);
  end;
end;

procedure TfrmNFCe.GerarNFCe(NumNFe: String);
var
  vMsg: string;
  FAliqDeson: Extended;
  FIcmsDeson: Extended;
  FTOTALDESON: Extended;
begin
  try

    FAliqDeson := 0;
    FTOTALDESON := 0;
    vMsg := '';

    qryNFCE_M.Close;
    qryNFCE_M.Params[0].Value := qryVendaCODIGO.Value;
    qryNFCE_M.Open;

    with dmnfe.ACBrNFe.NotasFiscais.Add.NFe do
    begin
      ide.cNF := qryNFCE_MCNF.AsInteger;
      // Caso não seja preenchido será gerado um número aleatório pelo componente
      ide.natOp := 'VENDA';
      ide.indPag := ipVista;
      ide.modelo := 65;
      if Dados.qryConfigTIPO_APLICATIVO.Value = 'S' then
        ide.modelo := 59;
      ide.serie := Dados.qryTerminalSERIE.AsInteger;
      ide.nNF := StrToInt(NumNFe);
      ide.dEmi := now;
      // Ide.dSaiEnt := now;
      // Ide.hSaiEnt := now;
      ide.tpNF := tnSaida;

      ide.tpEmis := TpcnTipoEmissao(0);
      // não mudar é forma de emissão mesmo
      if Dados.qryConfigAMBIENTE.Value = 0 then
        ide.tpAmb := taProducao
      else
        ide.tpAmb := taHomologacao;

      ide.cUF := Dados.qryEmpresaID_UF.Value;
      ide.cMunFG := Dados.qryEmpresaID_CIDADE.Value;
      ide.finNFe := fnNormal;
      ide.tpImp := tiNFCe;
      ide.indFinal := cfConsumidorFinal;
      ide.indPres := pcPresencial;

      Emit.CNPJCPF := TiraPontos(Dados.qryEmpresaCNPJ.AsString);
      Emit.IE := TiraPontos(Dados.qryEmpresaIE.AsString);
      Emit.xNome := Dados.qryEmpresaRAZAO.AsString;
      Emit.xFant := Dados.qryEmpresaFANTASIA.AsString;
      Emit.EnderEmit.fone := TiraPontos(Dados.qryEmpresaFONE.AsString);
      Emit.EnderEmit.CEP := StrToIntDef(Dados.qryEmpresaCEP.AsString, 0);
      Emit.EnderEmit.xLgr := Dados.qryEmpresaENDERECO.AsString;
      Emit.EnderEmit.nro := Dados.qryEmpresaNUMERO.AsString;
      Emit.EnderEmit.xCpl := Dados.qryEmpresaCOMPLEMENTO.AsString;
      Emit.EnderEmit.xBairro := Dados.qryEmpresaBAIRRO.AsString;
      Emit.EnderEmit.cMun := Dados.qryEmpresaID_CIDADE.AsInteger;
      Emit.EnderEmit.xMun := Dados.qryEmpresaCIDADE.AsString;
      Emit.EnderEmit.fone := Dados.qryEmpresaFONE.AsString;
      Emit.EnderEmit.UF := Dados.qryEmpresaUF.AsString;
      Emit.EnderEmit.cPais := 1058;
      Emit.IM := Dados.qryEmpresaIM.AsString;
      Emit.EnderEmit.xPais := 'BRASIL';
      Emit.IEST := '';

      case Dados.qryEmpresaCRT.Value of
        1:
          Emit.CRT := crtSimplesNacional;
        // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3- crtRegimeNormal)
        2:
          Emit.CRT := crtSimplesExcessoReceita;
        3:
          Emit.CRT := crtRegimeNormal;
      end;

      Dados.qryConsulta.Close;
      Dados.qryConsulta.SQL.Text := 'SELECT * FROM PESSOA WHERE CODIGO=:ID';
      Dados.qryConsulta.Params[0].Value := qryNFCE_MID_CLIENTE.Value;
      Dados.qryConsulta.Open;

      if qryVendaID_CLIENTE.AsInteger <> Dados.qryConfigCLIENTE_PADRAO.AsInteger
      then
      begin
        Dest.CNPJCPF := TiraPontos(qryNFCE_MCPF_NOTA.AsString);
        Dest.EnderDest.cPais := 1058;
        Dest.EnderDest.xPais := 'BRASIL';
        Dest.ISUF := '';
        Dest.xNome := Dados.qryConsulta.FieldByName('RAZAO').AsString;
        Dest.EnderDest.fone := TiraPontos(Dados.qryConsulta.FieldByName('FONE1')
          .AsString);
        Dest.EnderDest.CEP :=
          StrToIntDef(TiraPontos(Dados.qryConsulta.FieldByName('CEP')
          .AsString), 0);
        Dest.EnderDest.xLgr := Dados.qryConsulta.FieldByName
          ('ENDERECO').AsString;
        Dest.EnderDest.nro := Dados.qryConsulta.FieldByName('NUMERO').AsString;
        Dest.EnderDest.xCpl := '';
        Dest.EnderDest.xBairro := Dados.qryConsulta.FieldByName('BAIRRO').Value;
        Dest.EnderDest.cMun := Dados.qryConsulta.FieldByName('codmun')
          .AsInteger;
        Dest.EnderDest.xMun := Dados.qryConsulta.FieldByName
          ('municipio').AsString;
        Dest.EnderDest.UF := Dados.qryConsulta.FieldByName('UF').AsString;
      end
      else
      begin
        if Trim(qryNFCE_MCPF_NOTA.Value) <> '' then
          Dest.CNPJCPF := TiraPontos(qryNFCE_MCPF_NOTA.AsString);
        Dest.EnderDest.cPais := 1058;
        Dest.EnderDest.xPais := 'BRASIL';
        Dest.ISUF := '';
        Dest.xNome := 'CONSUMIDOR FINAL';
        if Trim(Dados.qryConsulta.FieldByName('RAZAO').AsString) <> '' then
          Dest.xNome := Dados.qryConsulta.FieldByName('RAZAO').AsString;

        Dest.EnderDest.cMun := Dados.qryEmpresaID_CIDADE.AsInteger;
        Dest.EnderDest.xMun := Dados.qryEmpresaCIDADE.AsString;
        Dest.EnderDest.UF := Dados.qryEmpresaUF.AsString;

      end;

      Dest.indIEDest := inNaoContribuinte;

      QRYNFCE_D.Close;
      QRYNFCE_D.Params[0].Value := qryNFCE_MCODIGO.Value;
      QRYNFCE_D.Open;

      QRYNFCE_D.First;

      while not QRYNFCE_D.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem := QRYNFCE_DITEM.Value;
          Prod.cProd := QRYNFCE_DID_PRODUTO.AsString;

          Prod.cEAN := 'SEM GTIN';

          if Dados.qryEmpresaINFORMAR_GTIN.Value = 'S' then
          begin
            if (QRYNFCE_DCOD_BARRA.Value <> 'SEM GTIN') and
              (QRYNFCE_DCOD_BARRA.Value <> '777') and
              (Trim(QRYNFCE_DCOD_BARRA.Value) <> '') then
              Prod.cEAN := FormatFloat('0000000000000',
                StrToFloatDef(QRYNFCE_DCOD_BARRA.Value, 0));
          end;

          Prod.xProd := QRYNFCE_DDESCRICAO.AsString;
          Prod.NCM := QRYNFCE_DNCM.AsString;
          Prod.EXTIPI := '';
          Prod.CFOP := QRYNFCE_DCFOP.AsString;
          Prod.uCom := QRYNFCE_DUNIDADE.AsString;
          Prod.uTrib := QRYNFCE_DUNIDADE.AsString;
          Prod.qCom := QRYNFCE_DQTD.AsFloat;;
          Prod.vUnCom := SimpleRoundTo(QRYNFCE_DPRECO.AsFloat, -2);
          Prod.vProd := SimpleRoundTo(QRYNFCE_DVALOR_ITEM.AsFloat, -2);

          Prod.cEANTrib := 'SEM GTIN';

          if Dados.qryEmpresaINFORMAR_GTIN.Value = 'S' then
          begin
            if (QRYNFCE_DCOD_BARRA.Value <> 'SEM GTIN') and
              (QRYNFCE_DCOD_BARRA.Value <> '777') and
              (Trim(QRYNFCE_DCOD_BARRA.Value) <> '') then
              Prod.cEANTrib := FormatFloat('0000000000000',
                StrToFloatDef(QRYNFCE_DCOD_BARRA.Value, 0));
          end;

          Prod.uTrib := QRYNFCE_DUNIDADE.AsString;
          Prod.qTrib := QRYNFCE_DQTD.AsFloat;
          Prod.vUnTrib := QRYNFCE_DPRECO.AsFloat;

          Prod.vOutro := QRYNFCE_DOUTROS.AsFloat;
          Prod.vFrete := 0;
          Prod.vSeg := 0;
          Prod.vDesc := QRYNFCE_DVDESCONTO.AsFloat;

          Prod.CEST := QRYNFCE_DCEST.Value;

          Dados.qryConsulta.Close;
          Dados.qryConsulta.SQL.Text :=
            'SELECT COD_BENEFICIO, MOTIVO_DESONERACAO, ALIQ_DESON, ORIGEM, COMBUSTIVEL, ANP, GLP, GNN, GNI, PESO_LIQ, DESCRICAO FROM PRODUTO WHERE CODIGO=:ID';
          Dados.qryConsulta.Params[0].Value := QRYNFCE_DID_PRODUTO.Value;
          Dados.qryConsulta.Open;

          if Trim(Dados.qryConsulta.FieldByName('COD_BENEFICIO').AsString) <> ''
          then
          begin
            FAliqDeson := Dados.BuscaIcms('', Dados.qryEmpresaUF.Value,
              Dados.qryEmpresaUF.Value) / 100;
            FIcmsDeson :=
              SimpleRoundTo((QRYNFCE_DTOTAL.AsFloat / (1 - FAliqDeson) *
              FAliqDeson), -2);
            FTOTALDESON := FTOTALDESON + FIcmsDeson;
          end;

          if Trim(Dados.qryConsulta.FieldByName('COD_BENEFICIO').AsString) <> ''
          then
            Prod.cBenef := Dados.qryConsulta.FieldByName
              ('COD_BENEFICIO').AsString;

          if Dados.qryConsulta.FieldByName('combustivel').AsString = 'S' then
          begin

            Prod.comb.cProdANP := Dados.qryConsulta.FieldByName('ANP')
              .AsInteger;
            Prod.comb.descANP := Dados.qryConsulta.FieldByName
              ('DESCRICAO').AsString;
            Prod.comb.UFcons := Dest.EnderDest.UF;

          end;

          with Imposto do
          begin
            vTotTrib := QRYNFCE_DTRIB_MUN.AsFloat + QRYNFCE_DTRIB_IMP.AsFloat +
              QRYNFCE_DTRIB_EST.AsFloat + QRYNFCE_DTRIB_FED.AsFloat;
            with ICMS do
            begin

              if FTOTALDESON > 0 then
              begin
                ICMS.motDesICMS := TpcnMotivoDesoneracaoICMS
                  (Dados.qryConsulta.FieldByName('MOTIVO_DESONERACAO')
                  .AsInteger);
                ICMS.vICMSDeson := FIcmsDeson;
              end;

              if Dados.qryEmpresaCRT.Value <> 1 then
              begin // empresas que não são do simples nacional

                if copy(QRYNFCE_DCST.Value, 2, 2) = '00' then
                  CST := cst00;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '10' then
                  CST := cst10;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '20' then
                begin
                  CST := cst20;
                  vMsg := 'Credito presumido na base de calculo do icms 77,5% de acordo com a resolução nº004 de 17 de janeiro de 2017';
                end;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '30' then
                  CST := cst30;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '40' then
                  CST := cst40;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '41' then
                  CST := cst41;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '45' then
                  CST := cst45;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '50' then
                  CST := cst50;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '51' then
                  CST := cst51;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '60' then
                  CST := cst60;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '70' then
                  CST := cst70;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '80' then
                  CST := cst80;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '81' then
                  CST := cst81;
                if copy(QRYNFCE_DCST.Value, 2, 2) = '90' then
                  CST := cst90;

              end;

              case Dados.qryConsulta.FieldByName('ORIGEM').AsInteger of
                0:
                  ICMS.orig := oeNacional;
                1:
                  ICMS.orig := oeEstrangeiraImportacaoDireta;
                2:
                  ICMS.orig := oeEstrangeiraAdquiridaBrasil;
                3:
                  ICMS.orig := oeNacionalConteudoImportacaoSuperior40;
                4:
                  ICMS.orig := oeNacionalProcessosBasicos;
                5:
                  ICMS.orig := oeNacionalConteudoImportacaoInferiorIgual40;
                6:
                  ICMS.orig := oeEstrangeiraImportacaoDiretaSemSimilar;
                7:
                  ICMS.orig := oeNacionalConteudoImportacaoSuperior70
              else
                ICMS.orig := oeNacional;
              end;

              if Dados.qryEmpresaCRT.Value = 1 then
              begin // empresas que são do simples nacional

                if QRYNFCE_DCSOSN.Value = '101' then
                  CSOSN := csosn101;
                CSOSN := csosn102;
                if QRYNFCE_DCSOSN.Value = '102' then
                  CSOSN := csosn102;
                if QRYNFCE_DCSOSN.Value = '103' then
                  CSOSN := csosn103;
                if QRYNFCE_DCSOSN.Value = '201' then
                  CSOSN := csosn201;
                if QRYNFCE_DCSOSN.Value = '202' then
                  CSOSN := csosn202;
                if QRYNFCE_DCSOSN.Value = '203' then
                  CSOSN := csosn203;
                if QRYNFCE_DCSOSN.Value = '300' then
                  CSOSN := csosn300;
                if QRYNFCE_DCSOSN.Value = '400' then
                  CSOSN := csosn400;
                if QRYNFCE_DCSOSN.Value = '500' then
                  CSOSN := csosn500;
                if QRYNFCE_DCSOSN.Value = '900' then
                  CSOSN := csosn900;
              end;

              ICMS.modBC := dbiValorOperacao;
              ICMS.vBC := QRYNFCE_DBASE_ICMS.AsFloat;
              ICMS.pICMS := QRYNFCE_DALIQ_ICMS.AsFloat;
              ICMS.vICMS := QRYNFCE_DVALOR_ICMS.AsFloat;
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST := 0;
              // QRYNFCE_DALIQ_ICMS.Value;;
              ICMS.pRedBCST := 0;
              ICMS.vBCST := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;
              ICMS.pRedBC := 0;

            end;
            with PIS do
            begin
              if QRYNFCE_DCST_PIS.Value = '01' then
                CST := pis01;
              if QRYNFCE_DCST_PIS.Value = '02' then
                CST := pis02;
              if QRYNFCE_DCST_PIS.Value = '03' then
                CST := pis03;
              if QRYNFCE_DCST_PIS.Value = '04' then
                CST := pis04;
              if QRYNFCE_DCST_PIS.Value = '05' then
                CST := pis05;
              if QRYNFCE_DCST_PIS.Value = '06' then
                CST := pis06;
              if QRYNFCE_DCST_PIS.Value = '07' then
                CST := pis07;
              if QRYNFCE_DCST_PIS.Value = '08' then
                CST := pis08;
              if QRYNFCE_DCST_PIS.Value = '09' then
                CST := pis09;
              if QRYNFCE_DCST_PIS.Value = '49' then
                CST := pis49;
              if QRYNFCE_DCST_PIS.Value = '99' then
                CST := pis99;

              PIS.vBC := QRYNFCE_DBASE_PIS_ICMS.AsFloat;
              PIS.pPIS := QRYNFCE_DALIQ_PIS_ICMS.AsFloat;
              PIS.vPIS := QRYNFCE_DVALOR_PIS_ICMS.AsFloat;
            end;

            with COFINS do
            begin
              if QRYNFCE_DCST_COFINS.Value = '01' then
                CST := cof01;
              if QRYNFCE_DCST_COFINS.Value = '02' then
                CST := cof02;
              if QRYNFCE_DCST_COFINS.Value = '03' then
                CST := cof03;
              if QRYNFCE_DCST_COFINS.Value = '04' then
                CST := cof04;
              if QRYNFCE_DCST_COFINS.Value = '05' then
                CST := cof05;
              if QRYNFCE_DCST_COFINS.Value = '06' then
                CST := cof06;
              if QRYNFCE_DCST_COFINS.Value = '07' then
                CST := cof07;
              if QRYNFCE_DCST_COFINS.Value = '08' then
                CST := cof08;
              if QRYNFCE_DCST_COFINS.Value = '09' then
                CST := cof09;
              if QRYNFCE_DCST_COFINS.Value = '49' then
                CST := cof49;
              if QRYNFCE_DCST_COFINS.Value = '99' then
                CST := cof99;

              COFINS.vBC := QRYNFCE_DBASE_COFINS_ICMS.AsFloat;
              COFINS.pCOFINS := QRYNFCE_DALIQ_COFINS_ICMS.AsFloat;
              COFINS.vCOFINS := QRYNFCE_DVALOR_COFINS_ICMS.AsFloat;
            end;
          end;
        end;
        QRYNFCE_D.Next;
      end;

      Total.ICMSTot.vTotTrib := qryNFCE_MTRIB_MUN.AsFloat +
        qryNFCE_MTRIB_IMP.AsFloat + qryNFCE_MTRIB_EST.AsFloat +
        qryNFCE_MTRIB_FED.AsFloat;
      Total.ICMSTot.vBC := qryNFCE_MBASEICMS.AsFloat;
      Total.ICMSTot.vICMS := qryNFCE_MTOTALICMS.AsFloat;
      Total.ICMSTot.vBCST := 0;
      Total.ICMSTot.vST := 0;
      if FTOTALDESON > 0 then
        Total.ICMSTot.vICMSDeson := FTOTALDESON;
      Total.ICMSTot.vProd := qryNFCE_MSUBTOTAL.AsFloat;
      Total.ICMSTot.vFrete := 0;
      Total.ICMSTot.vSeg := 0;
      Total.ICMSTot.vDesc := qryNFCE_MDESCONTO.AsFloat;
      Total.ICMSTot.vOutro := qryNFCE_MOUTROS.AsFloat;
      Total.ICMSTot.vII := 0;
      Total.ICMSTot.vIPI := 0;
      Total.ICMSTot.vPIS := qryNFCE_MTOTALICMSPIS.AsFloat;
      Total.ICMSTot.vCOFINS := qryNFCE_MTOTALICMSCOFINS.AsFloat;
      Total.ICMSTot.vNF := qryNFCE_MTOTAL.AsFloat;

      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

      if qryNFCE_MFK_VENDA.AsInteger > 0 then
      begin
        if qryNFCE_MTOTAL.Value = qryVendaTOTAL.AsFloat then
        begin
          qryTotalFPG.Close;
          qryTotalFPG.Params[0].Value := qryVendaFK_VENDA.Value;
          qryTotalFPG.Open;

          qryTotalFPG.First;
          while not qryTotalFPG.Eof do
          begin
            if qryTotalFPGVALOR.Value > 0 then
            begin
              if (uppercase(qryTotalFPGTIPO.Value) = 'D') or
                (uppercase(qryTotalFPGTIPO.Value) = 'X') then
              // DINHEIRO E DEPOSITO
              begin
                with pag.Add do
                begin
                  tPag := fpDinheiro;
                  vPag := qryNFCE_MDINHEIRO.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'Q' then // CHEQUE
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpCheque;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'T' then // TROCA
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpOutro;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'C' then // CARTAO CREDITO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpCartaoCredito;
                  vPag := qryTotalFPGVALOR.AsFloat;
                  tpIntegra := tiPagNaoIntegrado;
                end;
              end;
            end;
            if uppercase(qryTotalFPGTIPO.Value) = 'E' then // CARTADO DEBITO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpCartaoDebito;
                  vPag := qryTotalFPGVALOR.AsFloat;
                  tpIntegra := tiPagNaoIntegrado;
                end;
              end;
            end;
            if uppercase(qryTotalFPGTIPO.Value) = 'F' then // FATURADO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpCreditoLoja;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;
            if uppercase(qryTotalFPGTIPO.Value) = 'T' then // OUTROS
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpOutro;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;
            if uppercase(qryTotalFPGTIPO.Value) = 'R' then // VALE REFEICAO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpValeRefeicao;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'V' then // CONVENIO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpOutro;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'P' then // VALE PRESENTE
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpValePresente;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;

            if uppercase(qryTotalFPGTIPO.Value) = 'B' then // BOLETO
            begin
              if qryTotalFPGVALOR.Value > 0 then
              begin
                with pag.Add do
                begin
                  tPag := fpBoletoBancario;
                  vPag := qryTotalFPGVALOR.AsFloat;
                end;
              end;
            end;
            qryTotalFPG.Next;
          end;
        end
        else
        begin
          with pag.Add do
          begin
            tPag := fpDinheiro;
            vPag := qryNFCE_MTOTAL.AsFloat;
          end;
        end;
      end
      else
      begin
        with pag.Add do
        begin
          tPag := fpDinheiro;
          vPag := qryNFCE_MTOTAL.AsFloat;
        end;
      end;

      pag.vTroco := qryNFCE_MTROCO.AsFloat;
      InfAdic.infCpl := '';

      // responsavel tecnico 22-03-2019
      if Dados.qryEmpresaRESPONSAVEL_TECNICO.Value = 'S' then
      begin

        Dados.qryParametro.Close;
        Dados.qryParametro.Open;

        infRespTec.CNPJ := TiraPontos(Dados.qryParametroCNPJ.Value);
        infRespTec.xContato := Dados.qryParametroCONTATO.Value;
        infRespTec.Email := Dados.qryParametroEMAIL_SUPORTE.Value;
        infRespTec.fone := TiraPontos(Dados.qryParametroFONE1.Value);
        infRespTec.hashCSRT := '';
      end;

      if (Dados.qryTerminalTIPOIMPRESSORA.Value = '1') or
        (Dados.qryTerminalTIPOIMPRESSORA.Value = '2') then
      begin
        dmnfe.ACBrNFe.DANFE.vTribFed := qryNFCE_MTRIB_FED.AsFloat +
          qryNFCE_MTRIB_IMP.AsFloat;
        dmnfe.ACBrNFe.DANFE.vTribEst := qryNFCE_MTRIB_EST.AsFloat;
        dmnfe.ACBrNFe.DANFE.vTribMun := qryNFCE_MTRIB_MUN.AsFloat;
      end;

      InfAdic.infCpl := qryNFCE_MOBSERVACOES.Value + sLineBreak +
        Dados.qryEmpresaOBSNFCE.Value;

      InfAdic.infAdFisco := vMsg;
      dmnfe.ACBrNFe.NotasFiscais.GerarNFe;
    end;
  except
    on e: Exception do
      raise Exception.Create('Erro:' + e.Message);
  end;
end;

procedure TfrmNFCe.TTransmitir;
begin

  btnTransmitir.Enabled := false;
  Application.ProcessMessages;

  qryNFCE_M.Close;
  qryNFCE_M.Params[0].Value := qryVendaCODIGO.Value;
  qryNFCE_M.Open;

  QRYNFCE_D.Close;
  QRYNFCE_D.Params[0].Value := qryNFCE_MCODIGO.Value;
  QRYNFCE_D.Open;

  AtualizaImpostosNFCe;

  dmnfe.ACBrNFe.NotasFiscais.Clear;

  GerarNFCe(qryNFCE_MNUMERO.AsString); // passo 4 gerar xml

  if not ValidaNegocios then
    exit;

  try

    if dmnfe.ACBrNFe.Enviar('1', false, true) then
    begin
      sTransmitida;
      if not FTodos then
        ShowMessage('NFCe transmitido com sucesso!');

    end;

  except
    on e: Exception do
    begin
      case dmnfe.ACBrNFe.webservices.Enviar.cStat of
        101, 218: // cancelada
          begin
            sCancelada;
          end;
        204, 539: // duplicidade
          begin
            dmnfe.ACBrNFe.Consultar;
            if dmnfe.ACBrNFe.webservices.Consulta.cStat = 100 then
              sTransmitida
            else
            begin
              sDuplicidade;
              RecuperaChave;
            end;
          end;
        110:
          begin // Denegado
            sDenegado;
          end;
        563: // inutilizada
          begin
            sInutilizada;
          end
      else
        begin
          case dmnfe.ACBrNFe.webservices.Retorno.cStat of
            101: // cancelada
              sCancelada;

            110:
              sDenegado;

            204, 539: // duplicidade
              begin
                dmnfe.ACBrNFe.Consultar;
                if dmnfe.ACBrNFe.webservices.Consulta.cStat = 100 then
                  sTransmitida
                else
                begin
                  sDuplicidade;
                  RecuperaChave;
                end;
              end;
            563: // inutilizada
              begin
                sInutilizada;
              end
          else
            begin
              ShowMessage('Retorno:' + dmnfe.ACBrNFe.webservices.Retorno.cStat.
                ToString + ' - ' + dmnfe.ACBrNFe.webservices.Retorno.xMotivo +
                sLineBreak + 'Erro:' + e.Message);
              exit;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmNFCe.RecuperaChave;
var
  ChaveTemp, ChaveTemp2, Chaveatual, chaveanterior: string;
  chavexml: string;
begin

  Chaveatual := '';
  chaveanterior := '';
  ChaveTemp := '';

  chaveanterior := copy(qryNFCE_MXML.AsString,
    pos('Id="', qryNFCE_MXML.AsString) + 7, 44);

  ChaveTemp := copy(dmnfe.ACBrNFe.webservices.Consulta.xMotivo,
    pos('[', dmnfe.ACBrNFe.webservices.Consulta.xMotivo) + 1,
    pos(']', dmnfe.ACBrNFe.webservices.Consulta.xMotivo) - 1);

  if ChaveTemp = '' then
  begin
    ChaveTemp := copy(dmnfe.ACBrNFe.webservices.Enviar.xMotivo,
      pos('[chNFe:', dmnfe.ACBrNFe.webservices.Enviar.xMotivo) + 7);
    ChaveTemp := copy(ChaveTemp, 1, 45);
  end;

  Chaveatual := copy(Trim(ChaveTemp), 1, pos(']', ChaveTemp) - 1);
  Dados.Conexao.CommitRetaining;
  if Chaveatual <> '' then
  begin

    Dados.qryExecute.Close;
    Dados.qryExecute.SQL.Text :=
      ' UPDATE NFCE_MASTER SET XML=:XML, CHAVE=:CHAVE WHERE CODIGO=:CODIGO';
    Dados.qryExecute.ParamByName('XML').AsString :=
      stringreplace(qryVendaXML.AsString, chaveanterior, Chaveatual,
      [rfReplaceAll]);
    Dados.qryExecute.ParamByName('CHAVE').AsString := Chaveatual;
    Dados.qryExecute.ParamByName('CODIGO').Value := qryVendaCODIGO.Value;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmNFCe.recuperanfce;

begin
  dmnfe.ACBrNFe.NotasFiscais.Clear;
  dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.Value);
  dmnfe.ACBrNFe.Consultar;

  if dmnfe.ACBrNFe.webservices.Consulta.cStat = 100 then
  begin

    qryVenda.Edit;
    qryVendaCHAVE.Value :=
      copy(dmnfe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
    qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.procNFe.nProt;

    qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XMLAssinado;
    qryVendaSITUACAO.Value := 'T';
    qryVendaFLAG.Value := 'N';
    qryVendaDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryVendaDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryVendaHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryVendaHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryVenda.Post;
    Dados.Conexao.CommitRetaining;
    dmnfe.ACBrNFe.NotasFiscais.Items[0].GravarXML();

    dmnfe.ACBrNFe.DANFE := dmnfe.ACBrNFeDANFCeFortesA41;
    dmnfe.ACBrNFe.DANFE.vTribFed := qryVendaTRIB_FED.AsFloat +
      qryVendaTRIB_IMP.AsFloat;
    dmnfe.ACBrNFe.DANFE.vTribEst := qryVendaTRIB_EST.AsFloat;
    dmnfe.ACBrNFe.DANFE.vTribMun := qryVendaTRIB_MUN.AsFloat;
    dmnfe.ACBrNFe.DANFE.PathPDF := Dados.qryConfigPATHPDF.Value;
    dmnfe.ACBrNFe.NotasFiscais.ImprimirPDF;
    Application.ProcessMessages;

  end
  else
  begin
    Application.ProcessMessages;
    ShowMessage('Status:' + #13 +
      IntToStr(dmnfe.ACBrNFe.webservices.Consulta.cStat) + '-' +
      dmnfe.ACBrNFe.webservices.Consulta.xMotivo);
    if dmnfe.ACBrNFe.webservices.Consulta.cStat = 613 then
      RecuperaChave;
    if dmnfe.ACBrNFe.webservices.Consulta.cStat = 101 then
      sCancelada;

  end;
end;

procedure TfrmNFCe.sTransmitida;
begin

  if not(qryVenda.State in dsEditmodes) then
    qryVenda.Edit;

  qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  // atualiza status da nfce
  if dmnfe.ACBrNFe.webservices.Enviar.cStat = 100 then
  begin
    dmnfe.ACBrNFe.NotasFiscais.Items[0].GravarXML('');
    if not(qryVenda.State in dsEditmodes) then
      qryVenda.Edit;
    qryVendaCHAVE.Value :=
      copy(dmnfe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
    qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.procNFe.nProt;
    qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
    qryVendaFLAG.Value := 'N';
    qryVendaABERTO.Value := 'N';
    qryVendaSITUACAO.Value := 'T';
    qryVendaDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryVendaDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryVendaHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryVendaHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryVendaFK_VENDA.Value := qryVendaCODIGO.Value;
    qryVenda.Post;
    Dados.Conexao.CommitRetaining;

    dmEstoque.AtualizaEstoqueFiscal('NFCE', qryVendaCODIGO.Value, 'S',
      Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);
  end;
end;

procedure TfrmNFCe.sCancelada;
begin
  if not(qryVenda.State in dsEditmodes) then
    qryVenda.Edit;
  qryVendaCHAVE.Value := copy(dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.infNFe.id, 4, 100);
  qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVendaFLAG.Value := 'N';
  qryVendaABERTO.Value := 'N';
  qryVendaSITUACAO.Value := 'C';
  qryVendaDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.dEmi;
  qryVendaDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].NFe.ide.dEmi;
  qryVendaHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVendaHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage('Retorno:' + dmnfe.ACBrNFe.webservices.Enviar.cStat.ToString +
    ' - ' + dmnfe.ACBrNFe.webservices.Enviar.xMotivo);
end;

procedure TfrmNFCe.sDuplicidade;
begin
  if not(qryVenda.State in dsEditmodes) then
    qryVenda.Edit;
  qryVendaFLAG.Value := 'N';
  qryVendaABERTO.Value := 'N';
  qryVendaSITUACAO.Value := 'D';
  qryVendaDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.dEmi;
  qryVendaDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].NFe.ide.dEmi;
  qryVendaHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVendaHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage('Retorno:' + dmnfe.ACBrNFe.webservices.Enviar.cStat.ToString +
    ' - ' + dmnfe.ACBrNFe.webservices.Enviar.xMotivo);
end;

procedure TfrmNFCe.sInutilizada;
begin
  if not(qryVenda.State in dsEditmodes) then
    qryVenda.Edit;
  qryVendaCHAVE.Value := copy(dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.infNFe.id, 4, 100);
  qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVendaFLAG.Value := 'N';
  qryVendaABERTO.Value := 'N';
  qryVendaSITUACAO.Value := 'D';
  qryVendaDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.dEmi;
  qryVendaDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].NFe.ide.dEmi;
  qryVendaHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVendaHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.ide.hSaiEnt;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage('Retorno:' + dmnfe.ACBrNFe.webservices.Enviar.cStat.ToString +
    ' - ' + dmnfe.ACBrNFe.webservices.Enviar.xMotivo);
end;

procedure TfrmNFCe.sDenegado;
begin
  if not(qryVenda.State in dsEditmodes) then
    qryVenda.Edit;
  qryVendaCHAVE.Value := copy(dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.infNFe.id, 4, 100);
  qryVendaPROTOCOLO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVendaFLAG.Value := 'N';
  qryVendaABERTO.Value := 'N';
  qryVendaSITUACAO.Value := 'X';
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage('Retorno:' + dmnfe.ACBrNFe.webservices.Enviar.cStat.ToString +
    ' - ' + dmnfe.ACBrNFe.webservices.Enviar.xMotivo);
end;

procedure TfrmNFCe.AtualizaNFCe;
var
  N, i, j: Integer;
begin
  dmnfe.ACBrNFe.NotasFiscais.Clear;
  dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.Value);

  try
    Dados.qryExecute.Close;
    Dados.qryExecute.SQL.Text := 'DELETE FROM NFCE_DETALHE WHERE FKVENDA=:ID';
    Dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;

    qryNFCE_M.Close;
    qryNFCE_M.Params[0].AsInteger := qryVendaCODIGO.Value;
    qryNFCE_M.Open;

    QRYNFCE_D.Close;
    QRYNFCE_D.Params[0].AsInteger := qryVendaCODIGO.Value;
    QRYNFCE_D.Open;

    qryNFCE_M.Edit;
    qryNFCE_MDATA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryNFCE_MDATA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.dEmi;
    qryNFCE_MHORA_EMISSAO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryNFCE_MHORA_SAIDA.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.hSaiEnt;
    qryNFCE_MSERIE.AsInteger := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.ide.serie;
    qryNFCE_MSUBTOTAL.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vProd;
    qryNFCE_MDESCONTO.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vDesc;
    qryNFCE_MTOTAL.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vNF;
    qryNFCE_MTOTALICMSPIS.Value := 0;
    qryNFCE_MTOTALICMSCOFINS.Value := 0;
    qryNFCE_MBASEICMS.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vBC;
    qryNFCE_MTOTALICMS.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vICMS;
    qryNFCE_MTOTALICMSPIS.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vPIS;
    qryNFCE_MTOTALICMSCOFINS.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vCOFINS;
    qryNFCE_MXML.Value := dmnfe.ACBrNFe.NotasFiscais.Items[0].XML;
    qryNFCE_M.Post;
    Dados.Conexao.CommitRetaining;

    for N := 0 to dmnfe.ACBrNFe.NotasFiscais.Count - 1 do
    begin
      with dmnfe.ACBrNFe.NotasFiscais.Items[N].NFe do
      begin
        for i := 0 to Det.Count - 1 do
        begin
          with Det.Items[i] do
          begin

            QRYNFCE_D.Insert;
            QRYNFCE_DFKVENDA.Value := qryVendaCODIGO.Value;
            QRYNFCE_DCODIGO.Value := Dados.Numerador('NFCE_DETALHE', 'CODIGO',
              'N', '', '');
            QRYNFCE_DID_PRODUTO.Value := Prod.cProd.ToInteger;

            QRYNFCE_DITEM.Value := Prod.nItem;
            QRYNFCE_DNCM.Value := Prod.NCM;
            QRYNFCE_DCFOP.Value := Prod.CFOP;
            QRYNFCE_DPRECO.Value := Prod.vUnCom;
            QRYNFCE_DUNIDADE.Value := Prod.uCom;
            QRYNFCE_DQTD.Value := Prod.qCom;
            QRYNFCE_DVALOR_ITEM.Value := Prod.vProd;
            QRYNFCE_DCOD_BARRA.Value := Prod.cEAN;
            QRYNFCE_DVDESCONTO.Value := Prod.vDesc;
            QRYNFCE_DOUTROS.Value := Prod.vOutro;
            QRYNFCE_DCST.Value := OrigToStr(Imposto.ICMS.orig) +
              CSTICMSToStr(Imposto.ICMS.CST);

            QRYNFCE_DBASE_ICMS.AsCurrency := Imposto.ICMS.vBC;
            QRYNFCE_DVALOR_ICMS.AsCurrency := Imposto.ICMS.vICMS;
            QRYNFCE_DALIQ_ICMS.AsCurrency := Imposto.ICMS.pICMS;

            QRYNFCE_DCST_PIS.Value := CSTPISToStr(Imposto.PIS.CST);
            QRYNFCE_DBASE_PIS_ICMS.AsCurrency := Imposto.PIS.vBC;
            QRYNFCE_DVALOR_PIS_ICMS.AsCurrency := Imposto.PIS.vPIS;
            QRYNFCE_DALIQ_PIS_ICMS.AsCurrency := Imposto.PIS.pPIS;

            QRYNFCE_DCST_COFINS.Value := CSTCOFINSToStr(Imposto.COFINS.CST);
            QRYNFCE_DBASE_COFINS_ICMS.AsCurrency := Imposto.COFINS.vBC;
            QRYNFCE_DALIQ_COFINS_ICMS.AsCurrency := Imposto.COFINS.pCOFINS;
            QRYNFCE_DVALOR_COFINS_ICMS.AsCurrency := Imposto.COFINS.vCOFINS;
          end;

          QRYNFCE_D.Post;
          Dados.Conexao.CommitRetaining;
        end;
      end;
    end;
    ShowMessage('NFC-e recuperado com sucesso!');
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TfrmNFCe.btnRecuperarClick(Sender: TObject);
begin

  dmnfe.ConfiguraNFe('NFCe');

  if qryVenda.IsEmpty then
    exit;

  Dados.AbreTerminal;
  if Dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
    dmnfe.ImpressoraA4NFCe('NFCe')
  else
    dmnfe.ImpressoraBobina('NFCe');

  dmnfe.ConfiguraNFe('NFCe');


  try
    btnRecuperar.Enabled := false;
    // DmNFe.ACBrNFe.Configuracoes.Geral.ValidarDigest := false;

    If Application.messagebox('Deseja Recuperar Todos?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      while not qryVenda.Eof do
      begin
        if dmnfe.RecuperaNFe(qryVendaCODIGO.Value, qryVendaXML.Value,
          qryVendaTRIB_FED.AsFloat, qryVendaTRIB_EST.AsFloat,
          qryVendaTRIB_MUN.AsFloat, 'NFCe') then
        begin
          dmEstoque.AtualizaEstoqueFiscal('NFCE', qryVendaCODIGO.Value, 'S',
            Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);
        end;

        qryVenda.Next;
      end;
    end
    else
    begin
      dmnfe.RecuperaNFe(qryVendaCODIGO.Value, qryVendaXML.Value,
        qryVendaTRIB_FED.AsFloat, qryVendaTRIB_EST.AsFloat,
        qryVendaTRIB_MUN.AsFloat, 'NFCe');
    end

  finally
    btnFiltrarClick(self);
    btnRecuperar.Enabled := true;
  end;
end;

procedure TfrmNFCe.FiltraRelatorioR(tipo: string);
var
  filtro: string;
begin
  filtro := '';
  QryRelatorioR.Close;

  if tipo = 'RELATORIO' then
  begin

    case TabSet1.TabIndex of
      0:
        filtro := ' SITUACAO = ''T'' AND ';
      1:
        filtro := ' SITUACAO = ''D'' AND';
      2:
        filtro := ' SITUACAO = ''I'' AND';
      3:
        filtro := ' SITUACAO = ''G'' AND';
      4:
        filtro := ' SITUACAO = ''O'' AND';
      5:
        filtro := ' SITUACAO = ''C'' AND';
      6:
        filtro := ' SITUACAO = ''X'' AND';
    end;
  end
  else
    filtro := ' SITUACAO IN (''T'',''I'',''C'') AND';

  QryRelatorioR.SQL.Text := vSql2;
  QryRelatorioR.SQL.Text := stringreplace(QryRelatorioR.SQL.Text,
    '/*pSituacao*/', filtro, []);
  QryRelatorioR.Params[0].AsDate := strtodate(maskInicio.Text);
  QryRelatorioR.Params[1].AsDate := strtodate(maskFim.Text);
  QryRelatorioR.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  QryRelatorioR.Open;

end;

procedure TfrmNFCe.FiltraRelatorioD(tipo: string);
var
  filtro: string;
begin
  filtro := '';
  qryRelatorioD.Close;

  if tipo = 'RELATORIO' then
  begin

    case TabSet1.TabIndex of
      0:
        filtro := ' SITUACAO = ''T'' AND ';
      1:
        filtro := ' SITUACAO = ''D'' AND';
      2:
        filtro := ' SITUACAO = ''I'' AND';
      3:
        filtro := ' SITUACAO = ''G'' AND';
      4:
        filtro := ' SITUACAO = ''O'' AND';
      5:
        filtro := ' SITUACAO = ''C'' AND';
      6:
        filtro := ' SITUACAO = ''X'' AND';
    end;
  end
  else
    filtro := ' SITUACAO IN (''T'',''I'',''C'') AND';

  qryRelatorioD.SQL.Text := vSql1;
  qryRelatorioD.SQL.Text := stringreplace(qryRelatorioD.SQL.Text,
    '/*pSituacao*/', filtro, []);
  qryRelatorioD.Params[0].AsDate := strtodate(maskInicio.Text);
  qryRelatorioD.Params[1].AsDate := strtodate(maskFim.Text);
  qryRelatorioD.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  qryRelatorioD.Open;
end;

procedure TfrmNFCe.btnRelatorioClick(Sender: TObject);
begin
  FiltraRelatorioR('RELATORIO');
  FiltraRelatorioD('RELATORIO');
  FiltraImposto('RELATORIO');

  try
    btnRelatorio.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\ListadeNFCe.fr3');
    frxReport.ShowReport;
  finally
    btnRelatorio.Enabled := true;

  end;
end;

procedure TfrmNFCe.btnSairClick(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmNFCe.btnSairCorrecaoClick(Sender: TObject);
begin
  qryCorrecao.Cancel;
  PagUtilidade.Visible := false;
end;

procedure TfrmNFCe.btnTransmitirClick(Sender: TObject);
begin

  if (qryVendaSITUACAO.Value = 'D') or (qryVendaSITUACAO.Value = 'O') or
    (qryVendaSITUACAO.Value = 'G') then
  Begin
    try

      btnTransmitir.Enabled := false;

      Dados.AbreTerminal;
      if Dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
        dmnfe.ImpressoraA4NFCe('NFCe')
      else
        dmnfe.ImpressoraBobina('NFCe');

      dmnfe.ConfiguraNFe('NFCe');

      If Application.messagebox('Deseja Enviar Todos?', 'Confirmação',
        mb_yesno + mb_iconquestion) = idyes then
      begin
        while not qryVenda.Eof do
        begin
          FTodos := true;
          TTransmitir;
          qryVenda.Next;
        end;
      end
      else
      begin
        FTodos := false;
        TTransmitir;
      end;

      btnFiltrarClick(self);

    finally
      btnTransmitir.Enabled := true;
      qryItem.EnableControls;
    end;
  End;
end;

procedure TfrmNFCe.Button1Click(Sender: TObject);
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

    GerarRelatorio;
    EnviarEmail;

  finally
    Button1.Enabled := true;
  end;

end;

procedure TfrmNFCe.Button2Click(Sender: TObject);
begin
  AtualizaNFCe;
end;

procedure TfrmNFCe.btnAdicionarClick(Sender: TObject);
begin
  if cbTipo.ItemIndex = 0 then
    ADDOrcamento;

  if cbTipo.ItemIndex = 1 then
    ADDPedido;

end;

procedure TfrmNFCe.btnTransmitirLoteClick(Sender: TObject);
begin

  InsereNFe;

  qryDocumento.First;
  while not qryDocumento.Eof do
  begin

    if qryDocumentoTIPO.Value = 'ORCAMENTO' then
      ImportarOrcamento;

    if qryDocumentoTIPO.Value = 'PEDIDO' then
      ImportaPedido;

    qryDocumento.Next;
  end;
  AtualizaImpostosNFCe;
end;

procedure TfrmNFCe.btnWhatsClick(Sender: TObject);
var
  arquivo: string;
  chave: String;
  FFone: String;
begin

  if qryVenda.IsEmpty then
    exit;

  if Trim(qryVendaXML.AsString) = '' then
    exit;

  Dados.AbreTerminal;
  dmnfe.ImpressoraA4NFCe('NFCe');
  dmnfe.ConfiguraNFe('NFCe');

  dmnfe.ACBrNFe.NotasFiscais.Clear;
  dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryVendaXML.AsString);

  chave := qryVendaCHAVE.AsString + '-nfe.PDF';

  arquivo := dmnfe.ACBrNFe.DANFE.PathPDF + '\' + chave;

  if not FileExists(arquivo) then
  begin

    dmnfe.ACBrNFe.NotasFiscais.ImprimirPDF;
  end;

  if FileExists(arquivo) then
  begin
    FFone := InputBox('Digite o numero do whatsapp', 'Número:',
      Trim(TiraPontos(qryVendaWHATSAPP.AsString)));
    if Length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    Dados.InsereMensagemZap(arquivo, FFone,
      'Conforme solicitado, segue DANFE da NFCe Número:' +
      qryVendaNUMERO.AsString, '', qryVendaRAZAO.AsString,
      Dados.qryEmpresaRAZAO.AsString, 'NFE');
  end;
end;

procedure TfrmNFCe.cbClienteClick(Sender: TObject);
begin

  localiza;
end;

procedure TfrmNFCe.cbClienteEnter(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DropDown;
end;

procedure TfrmNFCe.compactanfce(Caminho, pasta: string);
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

procedure TfrmNFCe.ListarArquivos(Diretorio: string; Sub: Boolean);
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

procedure TfrmNFCe.GerarRelatorio;
begin

  FiltraRelatorioR('EMAIL');
  FiltraRelatorioD('EMAIL');
  FiltraImposto('EMAIL');

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\ListadeNFCe.fr3');

  frxPDF.FileName := 'Lista NFC-e' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '.pdf';
  frxPDF.DefaultPath := edtRelatorio.Text;
  frxPDF.ShowDialog := false;
  frxPDF.ShowProgress := false;
  frxPDF.OverwritePrompt := false;
  frxReport.PrepareReport();
  frxReport.Export(frxPDF);

end;

procedure TfrmNFCe.BitBtn1Click(Sender: TObject);
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

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text := ' SELECT NUMERO FROM NFCE_MASTER' +
    ' WHERE SITUACAO IN (''D'',''G'',''O'') AND ' +
    ' DATA_EMISSAO between :DATA1 AND :DATA2 AND FKEMPRESA=:EMPRESA ORDER BY numero';
  Dados.qryConsulta.Params[0].AsDate := strtodate(maskInicio.EditText);
  Dados.qryConsulta.Params[1].AsDate := strtodate(maskFim.EditText);
  Dados.qryConsulta.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.IsEmpty then
  begin
    ShowMessage('Existem NFC-E com DUPLICIDADE, GRAVADO E/OU OFFLINE!' +
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
    ListarArquivos(dmnfe.ACBrNFe.Configuracoes.Arquivos.GetPathNFe
      (qryXMLDATA_EMISSAO.Value, TiraPontos(Dados.qryEmpresaCNPJ.AsString),
      '65'), false);
    compactanfce(dmnfe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
      TiraPontos(Dados.qryEmpresaCNPJ.AsString), FormatDateTime('yyyymm',
      qryVendaDATA_EMISSAO.Value));
  finally
    BitBtn1.Enabled := true;
  end;
end;

procedure TfrmNFCe.BitBtn2Click(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmNFCe.GerarXml;
var
  dia, mes, ano: Word;
begin
  dmnfe.ACBrNFeDANFCeFortesA41.MostraPreview := false;
  dmnfe.ACBrNFeDANFCeFortesA41.MostraStatus := false;
  try

    if (Trim(qryXMLXML.AsString) = '') or (qryXMLXML.IsNull) then
      raise Exception.Create('ERRO XML não encontrado NFCe.' +
        qryVendaNUMERO.AsString);

    dmnfe.ACBrNFe.NotasFiscais.Clear;
    if (qryXMLSITUACAO.Value = 'T') then
      dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML.AsString);

    if (qryXMLSITUACAO.Value = 'C') then
    begin
      if not(qryXMLXML_CANCELAMENTO.IsNull) then
        dmnfe.ACBrNFe.NotasFiscais.LoadFromString
          (qryXMLXML_CANCELAMENTO.AsString)
      else
        dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML.AsString);
    end;

    dmnfe.ACBrNFe.DANFE := dmnfe.ACBrNFeDANFCeFortesA41;
    dmnfe.ACBrNFe.DANFE.Cancelada := false;
    if qryVendaSITUACAO.Value = 'C' then
      dmnfe.ACBrNFe.DANFE.Cancelada := true;
    dmnfe.ACBrNFe.DANFE.vTribFed := qryXMLTRIB_FED.AsFloat +
      qryXML.FieldByName('TRIB_IMP').AsFloat;
    dmnfe.ACBrNFe.DANFE.vTribEst := qryXMLTRIB_EST.AsFloat;
    dmnfe.ACBrNFe.DANFE.vTribMun := qryXMLTRIB_MUN.AsFloat;
    dmnfe.ACBrNFe.DANFE.PathPDF := Dados.qryConfigPATHPDF.Value;
    dmnfe.ACBrNFe.NotasFiscais.ImprimirPDF;

    if (qryXMLSITUACAO.Value = 'T') or (qryXMLSITUACAO.Value = 'C') then
      dmnfe.ACBrNFe.NotasFiscais.GravarXML();

  finally
    dmnfe.ACBrNFeDANFCeFortesA41.MostraPreview := true;
    dmnfe.ACBrNFeDANFCeFortesA41.MostraStatus := true;
  end;

end;

procedure TfrmNFCe.tamanho;
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

function TfrmNFCe.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmNFCe.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmNFCe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmNFCe.DBGrid1TitleClick(Column: TColumn);
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

procedure TfrmNFCe.DBGrid2DblClick(Sender: TObject);
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

procedure TfrmNFCe.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    If Application.messagebox('Deseja excluir DOCUMENTO?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      qryDocumento.Delete;
      Dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TfrmNFCe.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  qryItem.Close;
  qryItem.Params[0].Value := qryVendaCODIGO.Value;
  qryItem.Open;
end;

procedure TfrmNFCe.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmNFCe.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryVenda.Prior;
  if Key = VK_DOWN then
    qryVenda.Next;
end;

procedure TfrmNFCe.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmNFCe.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';

  DecodeDate(DATE, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := datetostr(DATE);
  TabGerar.TabVisible := false;
  tabDocumentos.TabVisible := false;
  TabInutilizar.TabVisible := false;

  btnCancelar.caption := 'F2' + sLineBreak + 'Cancelar';
  bbInutilizar.caption := 'F3' + sLineBreak + 'Inutilizar';
  btnRecuperar.caption := 'F4' + sLineBreak + 'Recuperar';
  btnTransmitir.caption := 'F5' + sLineBreak + 'Transmitir';
  btnImprimir.caption := 'F6' + sLineBreak + 'Imprimir';
  btnRelatorio.caption := 'F7' + sLineBreak + 'Relatório';
  btnEmail.caption := 'F8' + sLineBreak + 'Email';
  btnLote.caption := 'F9' + sLineBreak + 'Importar Lote';
  btnPDF.caption := 'F11' + sLineBreak + 'Fechar Mês';


end;

procedure TfrmNFCe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnCancelar.Click;
  if Key = vk_f3 then
    bbInutilizar.Click;
  if Key = vk_f4 then
    btnRecuperar.Click;
  if Key = vk_f5 then
    btnTransmitir.Click;
  if Key = vk_f6 then
    btnImprimir.Click;
  if Key = vk_f7 then
    btnRelatorio.Click;
  if Key = vk_f8 then
    btnEmail.Click;
  if Key = vk_f9 then
    btnLote.Click;
  if Key = vk_f10 then
    edtLoc.SetFocus;
  if Key = vk_f11 then
    btnPDF.Click;
  if Key = vk_f12 then
    maskInicio.SetFocus;
end;

procedure TfrmNFCe.FormShow(Sender: TObject);
begin

  if vSql1 = '' then
    vSql1 := qryRelatorioD.SQL.Text;

  if vSql2 = '' then
    vSql2 := QryRelatorioR.SQL.Text;

  if vsql3 = '' then
    vsql3 := qryTributacao.SQL.Text;

  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  if not Dados.qryTerminal.Locate('nome', Dados.Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
  end;

  qryProd.Close;
  qryProd.Open;

  idx := 0;
  DBGrid1TitleClick(DBGrid1.Columns[idx]);

  edtLoc.SetFocus;

  qryContador.Close;
  qryContador.Open;

  if not qryContador.IsEmpty then
    edtEmail.KeyValue := qryContadorEMAIL.Value;

  dmnfe.ACBrNFeDANFCeFortesA41.Site := Dados.qryEmpresaSITE.Value;
  dmnfe.ACBrNFeDANFCeFortesA41.Sistema := Dados.qryEmpresaRAZAO.Value;

end;

procedure TfrmNFCe.FiltraImposto(tipo: string);
var
  filtro: string;
begin
  filtro := '';
  QryRelatorioR.Close;

  if tipo = 'RELATORIO' then
  begin

    case TabSet1.TabIndex of
      0:
        filtro := ' AND VM.SITUACAO = ''T''';
      1:
        filtro := ' AND VM.SITUACAO = ''D''';
      2:
        filtro := ' AND VM.SITUACAO = ''I''';
      3:
        filtro := ' AND VM.SITUACAO = ''G''';
      4:
        filtro := ' AND VM.SITUACAO = ''O''';
      5:
        filtro := ' AND VM.SITUACAO = ''C''';
      6:
        filtro := ' AND VM.SITUACAO = ''X''';
    end;
  end
  else
    filtro := ' AND VM.SITUACAO IN (''T'',''I'',''C'')';

  qryTributacao.Close;
  qryTributacao.SQL.Text := stringreplace(qryTributacao.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);
  qryTributacao.Params[0].AsDate := strtodate(maskInicio.Text);
  qryTributacao.Params[1].AsDate := strtodate(maskFim.Text);
  qryTributacao.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  qryTributacao.Open;

end;

procedure TfrmNFCe.localiza;
var
  filtro, filtro1, Filtro2, ordem, parte: string;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin

      filtro := '';
      filtro1 := '';
      Filtro2 := '';
      ordem := '';
      parte := '';

      if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        parte := '%';

      vSql := ' select VM.*,  pes.razao, co.descricao caixa, ve.nome vendedor, pes.whatsapp, pes.email1, usu.login from NFCE_MASTER vm'
        + ' left join pessoa pes on pes.codigo=vm.id_cliente' +
        ' left join contas co on co.codigo=vm.fk_caixa' +
        ' left join vendedores ve on ve.codigo=vm.fk_vendedor' +
        ' left join usuarios usu on usu.codigo=vm.fk_usuario' + ' where' +
        ' vm.codigo>0' + ' /*where*/';

      filtro := filtro + ' and vm.fkempresa=' + Dados.qryEmpresaCODIGO.AsString;

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
              filtro := filtro + ' and vm.numero like ' +
                QuotedStr(edtLoc.Text + '%');
          end;

        3:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.chave like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        4:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and vm.protocolo like  ' +
                QuotedStr(parte + edtLoc.Text + '%');
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
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        7:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and usu.login like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        8:
          begin
            if (Trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and ve.nome like ' +
                QuotedStr(parte + edtLoc.Text + '%');
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
          filtro1 := ' and vm.situacao=''D'''; // DUPLICADO
        2:
          filtro1 := ' and vm.situacao=''I'''; // INUTILIZADO
        3:
          filtro1 := ' and vm.situacao=''G'''; // GRAVADO
        4:
          filtro1 := ' and vm.situacao=''O'''; // OFF
        5:
          filtro1 := ' and vm.situacao=''C'''; // CANCELADO
        6:
          filtro1 := ' and vm.situacao=''X'''; // DENEGADO
      end;

      case idx of
        0 .. 1:
          ordem := ' order by vm.serie, vm.numero ' + vOrdem;
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
          qryVenda.SQL.Text := vSql;
          qryVenda.SQL.Text := stringreplace(qryVenda.SQL.Text, '/*where*/',
            filtro + filtro1 + ordem, [rfReplaceAll]);
          qryVenda.Open;
        end);

    end).Start;

end;

procedure TfrmNFCe.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;

end;

procedure TfrmNFCe.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;

end;

procedure TfrmNFCe.qryItemAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmNFCe.qryItemBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmNFCe.qryRelatorioDCalcFields(DataSet: TDataSet);
begin
  if qryRelatorioDSITUACAO.Value = 'T' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryRelatorioDSITUACAO.Value = 'D' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryRelatorioDSITUACAO.Value = 'C' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryRelatorioDSITUACAO.Value = 'I' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'INUTILIZADO';
  if qryRelatorioDSITUACAO.Value = 'G' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryRelatorioDSITUACAO.Value = 'O' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'OFF LINE';
  if qryRelatorioDSITUACAO.Value = 'X' then
    qryRelatorioDVIRTUAL_SITUACAO.Value := 'DENEGADO';

end;

procedure TfrmNFCe.QryRelatorioRCalcFields(DataSet: TDataSet);
begin
  if QryRelatorioRSITUACAO.Value = 'T' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if QryRelatorioRSITUACAO.Value = 'D' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if QryRelatorioRSITUACAO.Value = 'C' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if QryRelatorioRSITUACAO.Value = 'I' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'INUTILIZADO';
  if QryRelatorioRSITUACAO.Value = 'G' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if QryRelatorioRSITUACAO.Value = 'O' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'OFF LINE';
  if QryRelatorioRSITUACAO.Value = 'X' then
    QryRelatorioRVIRTUAL_SITUACAO.Value := 'DENEGADO';
end;

procedure TfrmNFCe.qryVendaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmNFCe.qryVendaBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TfrmNFCe.qryVendaCalcFields(DataSet: TDataSet);
begin
  if qryVendaSITUACAO.Value = 'T' then
    qryVendaVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryVendaSITUACAO.Value = 'D' then
    qryVendaVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryVendaSITUACAO.Value = 'C' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryVendaSITUACAO.Value = 'I' then
    qryVendaVIRTUAL_SITUACAO.Value := 'INUTILIZADO';
  if qryVendaSITUACAO.Value = 'G' then
    qryVendaVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryVendaSITUACAO.Value = 'O' then
    qryVendaVIRTUAL_SITUACAO.Value := 'OFF Line';
  if qryVendaSITUACAO.Value = 'X' then
    qryVendaVIRTUAL_SITUACAO.Value := 'DENEGADO';
end;

procedure TfrmNFCe.qryVendasFPGAfterOpen(DataSet: TDataSet);
begin
  qryFPG.Close;
  qryFPG.Open;
end;

function TfrmNFCe.ChacaTotais: string;
begin
  Result := '';
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Add('select vm.numero from nfce_master vm');
  Dados.qryConsulta.SQL.Add('where');
  Dados.qryConsulta.SQL.Add
    ('total <> (select sum(vd.total) from nfce_detalhe vd where vd.fkvenda=vm.codigo) and');
  Dados.qryConsulta.SQL.Add
    ('vm.situacao=''T'' and vm.data_emissao between :data1 and :data2');
  Dados.qryConsulta.Params[0].Value := strtodate(maskInicio.Text);
  Dados.qryConsulta.Params[1].AsDate := strtodate(maskFim.Text);
  Dados.qryConsulta.Open;

  Dados.qryConsulta.First;

  while not Dados.qryConsulta.Eof do
  begin
    Result := Result + sLineBreak + Dados.qryConsulta.Fields[0].AsString;
    Dados.qryConsulta.Next;
  end;

end;

procedure TfrmNFCe.btnPDFClick(Sender: TObject);

begin

  Dados.AbreTerminal;
  dmnfe.ImpressoraA4NFCe('NFCe');
  dmnfe.ConfiguraNFe('NFCe');

  if ChacaTotais <> '' then
  begin
    ShowMessage('Recupere as NFC-e:' + sLineBreak + ChacaTotais);
    exit;
  end;

  if qryVenda.IsEmpty then
    exit;
  TabGerar.TabVisible := true;
  TabInutilizar.TabVisible := false;
  tabDocumentos.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabGerar;

  edtEmail.Text := Dados.qryEmpresaEMAIL_CONTADOR.AsString;
  edtArquivo.Text := dmnfe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '.ZIP';

  edtRelatorio.Text := dmnfe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\' +
    TiraPontos(Dados.qryEmpresaCNPJ.AsString) + '\' + FormatDateTime('yyyymm',
    strtodate(maskInicio.Text)) + '\';
end;

procedure TfrmNFCe.btnImprimirClick(Sender: TObject);
begin

  if qryVenda.IsEmpty then
    exit;
  try

    Dados.AbreTerminal;
    if Dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
      dmnfe.ImpressoraA4NFCe('NFCe')
    else
      dmnfe.ImpressoraBobina('NFCe');

    dmnfe.ConfiguraNFe('NFCe');

    btnImprimir.Enabled := false;
    dmnfe.ImprimirNFe(qryVendaXML.Value, qryVendaSITUACAO.Value, 'NFCe',
      qryVendaTRIB_FED.AsFloat, qryVendaTRIB_MUN.AsFloat,
      qryVendaTRIB_EST.AsFloat);
  finally
    btnImprimir.Enabled := true;
  end;
end;

procedure TfrmNFCe.InsereNFe;
begin

  qryNFCE_M.Close;
  qryNFCE_M.Open;

  qryNFCE_M.Insert;
  qryNFCE_MSERIE.Value := Dados.qryTerminalSERIE.Value;
  qryNFCE_MCODIGO.Value := Dados.Numerador('NFCE_MASTER', 'CODIGO',
    'N', '', '');

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'SELECT COALESCE(MAX(NUMERO),0) qtd FROM NFCE_MASTER WHERE SERIE=:SERIE AND FKEMPRESA=:EMPRESA';
  Dados.qryExecute.Params[0].Value := Dados.qryTerminalSERIE.Value;
  Dados.qryExecute.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryExecute.Open;

  if Dados.qryExecute.Fields[0].AsInteger = 0 then
    qryNFCE_MNUMERO.Value := Dados.qryTerminalNUMERACAO_INICIAL.Value
  else
    qryNFCE_MNUMERO.Value := Dados.qryExecute.Fields[0].AsInteger + 1;
  qryNFCE_MCNF.AsInteger := GerarCodigoDFe(qryNFCE_MNUMERO.Value);

  qryNFCE_MMODELO.Value := '65';
  qryNFCE_MSITUACAO.Value := 'G';
  qryNFCE_MFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryNFCE_MID_EMITENTE.Value := Dados.qryEmpresaCODIGO.Value;
  qryNFCE_MDATA_EMISSAO.Value := DATE;
  qryNFCE_MDATA_SAIDA.Value := DATE;
  qryNFCE_MDINHEIRO.AsFloat := 0;
  qryNFCE_MID_CLIENTE.Value := Dados.qryConfigCLIENTE_PADRAO.AsInteger;
  qryNFCE_MFK_USUARIO.Value := Dados.idUsuario;
  qryNFCE_MFK_CAIXA.Value := Dados.qryEmpresaID_CAIXA_GERAL.AsInteger;
  qryNFCE_MSERIE.Value := Dados.qryTerminalSERIE.AsString;
  qryNFCE_MFK_VENDEDOR.Value := 1;
  qryNFCE_MSUBTOTAL.AsFloat := qryDocumentoTOTAL.AsFloat;
  qryNFCE_MOUTROS.AsFloat := 0;
  qryNFCE_MDESCONTO.AsFloat := 0;
  qryNFCE_MTOTAL.AsFloat := 0;
  qryNFCE_MTIPO_DESCONTO.Value := 'D';
  qryNFCE_MTROCO.AsFloat := 0;
  qryNFCE_M.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmNFCe.ApagaItensInutiliza(codigo: Integer);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := 'delete from NFCE_DETALHE where codigo=:codigo';
  Dados.qryExecute.Params[0].Value := codigo;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmNFCe.InutilizaNFCe;
var
  i: Integer;
begin
  for i := StrToInt(edtInicial.Text) to StrToInt(edtFinal.Text) do
  begin

    qryInutiliza.Close;
    qryInutiliza.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
    qryInutiliza.Params[1].Value := i;
    qryInutiliza.Open;
    if not qryInutiliza.IsEmpty then
    begin
      qryInutiliza.Edit;
      qryInutilizaSITUACAO.Value := 'I';
      qryInutilizaCHAVE.Value := 'CHAVE NÃO GERADA';
      qryInutiliza.Post;

      ApagaItensInutiliza(qryInutilizaCODIGO.Value);

      Dados.Conexao.CommitRetaining;
      Application.ProcessMessages;
    end
    else
    begin
      qryInutiliza.Insert;
      qryInutilizaCODIGO.Value := Dados.Numerador('NFCE_MASTER', 'CODIGO',
        'N', '', '');
      qryInutilizaNUMERO.Value := i;
      qryInutilizaCHAVE.Value := 'CHAVE NÃO GERADA';
      qryInutilizaMODELO.Value := '65';
      qryInutilizaSERIE.Value := Dados.qryTerminalSERIE.Value;
      qryInutilizaDATA_EMISSAO.Value := DATE;
      qryInutilizaDATA_SAIDA.Value := DATE;
      qryInutilizaID_EMITENTE.Value := Dados.qryEmpresaCODIGO.Value;
      qryInutilizaFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryInutilizaID_CLIENTE.Value := 0;
      qryInutilizaFK_USUARIO.Value := 0;
      qryInutilizaFK_CAIXA.Value := 0;
      qryInutilizaFK_VENDEDOR.Value := 0;
      qryInutilizaSUBTOTAL.Value := 0;
      qryInutilizaTOTAL.Value := 0;
      qryInutilizaSITUACAO.Value := 'I';
      qryInutiliza.Post;
      Dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TfrmNFCe.btnInutilizarClick(Sender: TObject);
var
  sNomeArquivo1, sNomeArquivo2, Justificativa: String;
begin
  try
    btnInutilizar.Enabled := false;
    PagUtilidade.Visible := false;
    Application.ProcessMessages;
    Justificativa := edtJustificativa.Text;

    if dmnfe.Inutilizar(Justificativa, Dados.qryEmpresaCNPJ.Value, edtAno.Text,
      edtModelo.Text, edtSerie.Text, StrToInt(edtInicial.Text),
      StrToInt(edtFinal.Text), 'NFCe') then
    begin

      InutilizaNFCe;

      sNomeArquivo1 := dmnfe.ACBrNFe.Configuracoes.Arquivos.GetPathInu
        (TiraPontos(Dados.qryEmpresaCNPJ.AsString)) + '\' +
        copy(dmnfe.ACBrNFe.webservices.Inutilizacao.id, 3, 41) + '-inu.xml';

      sNomeArquivo2 := dmnfe.ACBrNFe.Configuracoes.Arquivos.GetPathInu
        (TiraPontos(Dados.qryEmpresaCNPJ.AsString)) + '\' +
        copy(dmnfe.ACBrNFe.webservices.Inutilizacao.id, 3, 41) + '-ped-inu.xml';

      if FilesExists(sNomeArquivo1) then
      begin
        DeleteFile(sNomeArquivo1);
      end;
      ShowMessage('Inutilizado com sucesso!');
    end;
  finally
    btnInutilizar.Enabled := true;
    PagUtilidade.Visible := true;
    Application.ProcessMessages;
    btnFiltrarClick(self);
  end;
end;

procedure TfrmNFCe.btnLoteClick(Sender: TObject);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'delete from nfce_documentos where id_usuario=:id';
  Dados.qryExecute.Params[0].Value := Dados.idUsuario;
  Dados.qryExecute.ExecSQL;

  qryDocumento.Close;
  qryDocumento.Open;

  TabGerar.TabVisible := false;
  tabDocumentos.TabVisible := true;
  TabInutilizar.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := tabDocumentos;

  Dados.AbreTerminal;
  dmnfe.ImpressoraA4NFCe('NFCe');
  dmnfe.ConfiguraNFe('NFCe');

end;

procedure TfrmNFCe.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

end.
