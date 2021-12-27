unit uNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, math,
  System.Classes, Vcl.Graphics, pcnConversao, pcnConversaoNFe, acbrUtil,
  blcksock, pcnNFe, ACBrNFeNotasFiscais, acbrDFEUtil, ACBrDFeSSL,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dbutilseh,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrEnterTab, ACBrMail, ACBrBase,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrPosPrinter, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, ACBrDFe, ACBrNFe, Vcl.Grids,
  Vcl.DBGrids, aCBRBoleto, ACBrBoletoConversao, JvComponentBase, JvEnterTab;

type
  TfrmCadNFe = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnTransmitir: TSpeedButton;
    btnImprimir: TSpeedButton;
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
    qryVendaTTOTAL: TAggregateField;
    dsVenda: TDataSource;
    dsItem: TDataSource;
    qryItem: TFDQuery;
    qryVendaVIRTUAL_CFOP: TStringField;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_UF_CLIENTE: TStringField;
    qryVendaVIRTUAL_TRANSP: TStringField;
    qryVendaVIRTUAL_PLACA: TStringField;
    qryVendaVIRTUAL_RNTC: TStringField;
    qryVendaVIRTUAL_UFPLACA: TStringField;
    qrySoma: TFDQuery;
    dsFatura: TDataSource;
    qryProduto: TFDQuery;
    btnImportar: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    qryVendaVIRTUAL_EMPRESA: TStringField;
    qryClientes: TFDQuery;
    qryTransp: TFDQuery;
    qryCFOP: TFDQuery;
    dsCFOP: TDataSource;
    qryVendaVIRTUAL_EMAIL: TStringField;
    qryVendaCHAVE_NFE_REFERENCIADA: TStringField;
    qryVendaNPEDIDO: TStringField;
    qryPesquisaNFe: TFDQuery;
    qryVendaCONSUMIDOR_FINAL: TStringField;
    qryVendaVIRTUAL_ISENTO: TStringField;
    TabSheet8: TTabSheet;
    TabSheet6: TTabSheet;
    DBGridEh3: TDBGridEh;
    DBGridEh1: TDBGridEh;
    btnGravar: TSpeedButton;
    qryVendaMOTIVO_CONTIGENCIA: TStringField;
    btnProdutos: TSpeedButton;
    btnTransp: TSpeedButton;
    qryIBPT: TFDQuery;
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
    qryVendaBASE_ICMS_ST: TFMTBCDField;
    qryVendaVALOR_ICMS_ST: TFMTBCDField;
    qryVendaVFCPUFDEST: TFMTBCDField;
    qryVendaVICMSUFDEST: TFMTBCDField;
    qryVendaVICMSUFREMET: TFMTBCDField;
    qryVendaOUTROS: TFMTBCDField;
    qryVendaPESOB: TFMTBCDField;
    qryVendaPESOL: TFMTBCDField;
    qryVendaTRIB_MUN: TFMTBCDField;
    qryVendaTRIB_EST: TFMTBCDField;
    qryVendaTRIB_FED: TFMTBCDField;
    qryVendaTRIB_IMP: TFMTBCDField;
    qryItemCODIGO: TIntegerField;
    qryItemFKNFE: TIntegerField;
    qryItemID_PRODUTO: TIntegerField;
    qryItemITEM: TSmallintField;
    qryItemCOD_BARRA: TStringField;
    qryItemNCM: TStringField;
    qryItemCFOP: TStringField;
    qryItemCST: TStringField;
    qryItemCSOSN: TStringField;
    qryItemTIPO: TStringField;
    qryItemQTD: TFMTBCDField;
    qryItemE_MEDIO: TFMTBCDField;
    qryItemPRECO: TFMTBCDField;
    qryItemTOTAL: TFMTBCDField;
    qryItemBASE_ICMS: TFMTBCDField;
    qryItemALIQ_ICMS: TFMTBCDField;
    qryItemVALOR_ICMS: TFMTBCDField;
    qryItemCST_COFINS: TStringField;
    qryItemBASE_COFINS_ICMS: TFMTBCDField;
    qryItemALIQ_COFINS_ICMS: TFMTBCDField;
    qryItemVALOR_COFINS_ICMS: TFMTBCDField;
    qryItemCST_PIS: TStringField;
    qryItemBASE_PIS_ICMS: TFMTBCDField;
    qryItemALIQ_PIS_ICMS: TFMTBCDField;
    qryItemVALOR_PIS_ICMS: TFMTBCDField;
    qryItemTRIB_MUN: TFMTBCDField;
    qryItemTRIB_EST: TFMTBCDField;
    qryItemTRIB_FED: TFMTBCDField;
    qryItemTRIB_IMP: TFMTBCDField;
    qryItemSITUACAO: TStringField;
    qryItemFLAG: TStringField;
    qryItemUNIDADE: TStringField;
    qryItemFRETE: TFMTBCDField;
    qryItemDESPESAS: TFMTBCDField;
    qryItemSEGURO: TFMTBCDField;
    qryItemDESCONTO: TFMTBCDField;
    qryItemBASE_IPI: TFMTBCDField;
    qryItemALIQ_IPI: TFMTBCDField;
    qryItemVALOR_IPI: TFMTBCDField;
    qryItemBASE_ICMS_ST: TFMTBCDField;
    qryItemVALOR_ICMS_ST: TFMTBCDField;
    qryItemVBCUFDEST: TFMTBCDField;
    qryItemVFCP: TFMTBCDField;
    qryItemPICMSUFDEST: TFMTBCDField;
    qryItemPICMSINTER: TFMTBCDField;
    qryItemPICMSINTERPART: TFMTBCDField;
    qryItemVFCPUFDEST: TFMTBCDField;
    qryItemVICMSUFDEST: TFMTBCDField;
    qryItemVICMSUFREMET: TFMTBCDField;
    qryItemCST_IPI: TStringField;
    qryItemOUTROS: TFMTBCDField;
    qryItemALIQ_ICMS_ST: TFMTBCDField;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoPR_VENDA: TFMTBCDField;
    qryProdutoTIPO: TStringField;
    qryProdutoCSTICMS: TStringField;
    qryProdutoCFOP: TStringField;
    qryProdutoCSOSN: TStringField;
    qryProdutoCEST: TStringField;
    qryProdutoALIQ_ICM: TCurrencyField;
    qryProdutoALIQ_IPI: TFMTBCDField;
    qryProdutoCSTIPI: TStringField;
    qryProdutoCSTE: TStringField;
    qryProdutoCSTS: TStringField;
    qryProdutoALIQ_PIS: TCurrencyField;
    qryProdutoALIQ_COF: TCurrencyField;
    qryProdutoFCP: TFMTBCDField;
    qryProdutoNCM: TStringField;
    qryProdutoNACIONALFEDERAL: TStringField;
    qryProdutoIMPORTADOSFEDERAL: TStringField;
    qryProdutoESTADUAL: TStringField;
    qryProdutoMUNICIPAL: TStringField;
    qryProdutoCODBARRA: TStringField;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesMUNICIPIO: TStringField;
    qryClientesUF: TStringField;
    qryClientesCEP: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesCELULAR1: TStringField;
    qryClientesEMAIL1: TStringField;
    qryClientesISENTO: TStringField;
    qryCFOPCODIGO: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPTIPO: TStringField;
    qryCFOPMOV_ES: TStringField;
    qryCFOPOPERACAO: TStringField;
    qryCFOPATIVO: TStringField;
    qryPesquisaNFeCODIGO: TIntegerField;
    qryIBPTCODIGO: TStringField;
    qryIBPTNACIONALFEDERAL: TStringField;
    qryIBPTIMPORTADOSFEDERAL: TStringField;
    qryIBPTESTADUAL: TStringField;
    qryIBPTMUNICIPAL: TStringField;
    qryTranspCODIGO: TIntegerField;
    qryTranspPESSOA: TStringField;
    qryTranspCNPJ: TStringField;
    qryTranspIE: TStringField;
    qryTranspNOME: TStringField;
    qryTranspAPELIDO: TStringField;
    qryTranspENDERECO: TStringField;
    qryTranspNUMERO: TStringField;
    qryTranspBAIRRO: TStringField;
    qryTranspCOD_CIDADE: TIntegerField;
    qryTranspCIDADE: TStringField;
    qryTranspUF: TStringField;
    qryTranspCEP: TStringField;
    qryTranspPLACA: TStringField;
    qryTranspUFPLACA: TStringField;
    qryTranspRNTC: TStringField;
    qryTranspATIVO: TStringField;
    qryTranspEMPRESA: TIntegerField;
    qryTranspRENAVAM: TStringField;
    qryTranspMOTORISTA: TStringField;
    qryTranspCPF_MOTORISTA: TStringField;
    qrySomaSUBTOTAL: TFMTBCDField;
    qrySomaBIPI: TFMTBCDField;
    qrySomaBICMS: TFMTBCDField;
    qrySomaBPIS: TFMTBCDField;
    qrySomaBCOFINS: TFMTBCDField;
    qrySomaVLIPI: TFMTBCDField;
    qrySomaVLICMS: TFMTBCDField;
    qrySomaVLPIS: TFMTBCDField;
    qrySomaVLCOF: TFMTBCDField;
    qrySomaDESCONTO: TFMTBCDField;
    qrySomaDESPESAS: TFMTBCDField;
    qrySomaFRETE: TFMTBCDField;
    qrySomaSEGURO: TFMTBCDField;
    qrySomaTMUN: TFMTBCDField;
    qrySomaTEST: TFMTBCDField;
    qrySomaTFED: TFMTBCDField;
    qrySomaTIMP: TFMTBCDField;
    qrySomaVFCPUFDEST: TFMTBCDField;
    qrySomaVICMSUFDEST: TFMTBCDField;
    qrySomaVICMSUFREMET: TFMTBCDField;
    qrySomaBASE_ICMS_ST: TFMTBCDField;
    qrySomaVALOR_ICMS_ST: TFMTBCDField;
    qryItemVITUAL_CODBARRA: TStringField;
    qryItemVIRTUAL_ALIQ_COF: TExtendedField;
    qryItemVIRTUAL_ALIQ_PIS: TExtendedField;
    qryItemVIRTUAL_CST_S: TStringField;
    qryItemVIRTUAL_ALIQ_ICMS: TExtendedField;
    qryItemVIRTUAL_CSOSN: TStringField;
    qryItemVIRTUAL_CST: TStringField;
    qryItemVIRTUAL_NCM: TIntegerField;
    qryItemVIRTUAL_UN: TStringField;
    qryItemVIRTUAL_PRECO: TExtendedField;
    qryItemVIRTUAL_PRODUTO: TStringField;
    qryItemVIRTUAL_FCP: TExtendedField;
    qryItemVIRTUAL_MVA: TExtendedField;
    qryItemVIRTUAL_REDUCAO: TExtendedField;
    qryProd: TFDQuery;
    qryVendaVFCP: TFMTBCDField;
    qryVendaINDPAG: TSmallintField;
    qryVendaTPINTEGRA: TSmallintField;
    qryVendaCNPJ_CARTAO: TStringField;
    qryVendaNUMERO_AUTORIZACAO: TStringField;
    qryVendaTPBANDEIRA: TSmallintField;
    qryVendaTPPAG: TSmallintField;
    qryItemGERA_ES: TStringField;
    qryProdutoCFOP_EXTERNO: TIntegerField;
    qryItemVIRTUAL_CFOPI: TStringField;
    qryItemVIRTUAL_CFOPE: TStringField;
    qryItemVICMSDESON: TFMTBCDField;
    qryItemMOTDESICMS: TSmallintField;
    DBText2: TDBText;
    qryItemVIRTUAL_MOTIVO: TStringField;
    qryItemBASE_DESONERACAO: TFMTBCDField;
    qryItemALIQ_DESONERACAO: TFMTBCDField;
    btnPessoas: TSpeedButton;
    qryVendaTOTAL_DESONERACAO: TFMTBCDField;
    qrySomaDESONERACAO: TFMTBCDField;
    qryNatureza: TFDQuery;
    qryItemNPEDIDO: TIntegerField;
    qryReferencia: TFDQuery;
    dsReferencia: TDataSource;
    qryReferenciaCODIGO: TIntegerField;
    qryReferenciaFK_NFE: TIntegerField;
    qryReferenciaREFERENCIA: TStringField;
    qryVendaCNF: TStringField;
    qryItemEVENDA: TStringField;
    qryProdutoCST_EXTERNO: TStringField;
    qryProdutoCSOSN_EXTERNO: TStringField;
    qryProdutoALIQ_ICMS_EXTERNO: TFMTBCDField;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label38: TLabel;
    Label8: TLabel;
    Label43: TLabel;
    Label48: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBComboBoxEh4: TDBComboBoxEh;
    DBEdit10: TDBEdit;
    DBEdit27: TDBEdit;
    DBComboBoxEh5: TDBComboBoxEh;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBComboBoxEh2: TDBComboBoxEh;
    DBComboBoxEh3: TDBComboBoxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBEdit38: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    btnPreview: TSpeedButton;
    TabSheet11: TTabSheet;
    Label27: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit32: TDBEdit;
    TabSheet12: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    TabSheet13: TTabSheet;
    DBMemoEh2: TDBMemoEh;
    TabSheet14: TTabSheet;
    Label9: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label42: TLabel;
    DBEdit35: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit26: TDBEdit;
    qryVendaVIRTUAL_CNPJ: TStringField;
    qryCR: TFDQuery;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    qryCRTIPO: TStringField;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryCRCARTAO: TStringField;
    qryCRFPG_VENDA: TIntegerField;
    qryCRREMESSA: TStringField;
    qryCRREMESSA_REENVIAR: TStringField;
    qryCRTVALOR: TAggregateField;
    qryCRBoleto: TFDQuery;
    qryVendaIMPORTOU: TStringField;
    qryCRID_CBR_REMESSA_UUID: TStringField;
    qryCRREMESSA_ARQUIVO: TStringField;
    qryItemE_S: TStringField;
    qryCRFK_NFE: TIntegerField;
    DBEdit36: TDBEdit;
    Label36: TLabel;
    qryVendaPERC_DESCONTO: TFMTBCDField;
    qryItemVALOR_ICMS_ST_RET: TFMTBCDField;
    qryItemVIRTUAL_DIFERIDO: TFloatField;
    qryItemPICMSDEFERIDO: TFMTBCDField;
    qryItemVICMSDEFERIDO: TFMTBCDField;
    qryClientesREGIME_TRIBUTARIO: TStringField;
    qryVendaVIRTUAL_REGIME: TStringField;
    qryItemVIRTUAL_MVA_NORMAL: TFloatField;
    qryProdutoCOD_ENQ_IPI: TStringField;
    qryVendaBASE_ST: TFMTBCDField;
    qryItemDESCRICAO_COMPLEMENTAR: TStringField;
    qryProdCODIGO: TIntegerField;
    qryProdTIPO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    qryProdGRUPO: TIntegerField;
    qryProdUNIDADE: TStringField;
    qryProdULTFORN: TIntegerField;
    qryProdLOCALIZACAO: TStringField;
    qryProdALIQ_ICM: TCurrencyField;
    qryProdALIQ_PIS: TCurrencyField;
    qryProdALIQ_COF: TCurrencyField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryProdMARGEM: TCurrencyField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdQTD_ATUAL: TFMTBCDField;
    qryProdQTD_MIN: TFMTBCDField;
    qryProdE_MEDIO: TFMTBCDField;
    qryProdCSTICMS: TStringField;
    qryProdCSTE: TStringField;
    qryProdCSTS: TStringField;
    qryProdCSTIPI: TStringField;
    qryProdCSOSN: TStringField;
    qryProdNCM: TStringField;
    qryProdCOMISSAO: TCurrencyField;
    qryProdDESCONTO: TCurrencyField;
    qryProdFOTO: TBlobField;
    qryProdATIVO: TStringField;
    qryProdCFOP: TStringField;
    qryProdPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdULT_COMPRA: TIntegerField;
    qryProdULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdPRECO_ATACADO: TFMTBCDField;
    qryProdQTD_ATACADO: TFMTBCDField;
    qryProdCOD_BARRA_ATACADO: TStringField;
    qryProdALIQ_IPI: TFMTBCDField;
    qryProdEMPRESA: TSmallintField;
    qryProdCEST: TStringField;
    qryProdGRADE: TStringField;
    qryProdEFISCAL: TStringField;
    qryProdPAGA_COMISSAO: TStringField;
    qryProdPESO: TFMTBCDField;
    qryProdCOMPOSICAO: TStringField;
    qryProdPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdINICIO_PROMOCAO: TDateField;
    qryProdFIM_PROMOCAO: TDateField;
    qryProdESTOQUE_INICIAL: TFMTBCDField;
    qryProdPR_VENDA_PRAZO: TFMTBCDField;
    qryProdPRECO_VARIAVEL: TStringField;
    qryProdAPLICACAO: TStringField;
    qryProdREDUCAO_BASE: TFMTBCDField;
    qryProdMVA: TFMTBCDField;
    qryProdFCP: TFMTBCDField;
    qryProdPRODUTO_PESADO: TStringField;
    qryProdSERVICO: TStringField;
    qryProdDT_CADASTRO: TDateField;
    qryProdDESCRICAO: TStringField;
    qryProdPR_CUSTO2: TFMTBCDField;
    qryProdPERC_CUSTO: TFMTBCDField;
    qryProdRESTAUTANTE: TStringField;
    qryProdTEMPO_ESPERA: TIntegerField;
    qryProdCOMPLEMENTO: TStringField;
    qryProdFK_MARCA: TIntegerField;
    qryProdPREFIXO_BALANCA: TStringField;
    qryProdFK_PRINCIPIO_ATIVO: TIntegerField;
    qryProdREMEDIO: TStringField;
    qryProdTIPO_RESTAURANTE: TStringField;
    qryProdCFOP_EXTERNO: TIntegerField;
    qryProdETQ: TStringField;
    qryProdCSOSN_EXTERNO: TStringField;
    qryProdCST_EXTERNO: TStringField;
    qryProdALIQ_ICMS_EXTERNO: TFMTBCDField;
    qryProdORIGEM: TIntegerField;
    qryProdGLP: TFMTBCDField;
    qryProdGNN: TFMTBCDField;
    qryProdGNI: TFMTBCDField;
    qryProdPESO_LIQ: TFMTBCDField;
    qryProdANP: TStringField;
    qryProdCOMBUSTIVEL: TStringField;
    qryProdFK_LCP: TStringField;
    qryProdISSQN: TFMTBCDField;
    qryProdTIPO_TRIBUTACAO: TStringField;
    qryProdQTD_FISCAL: TFMTBCDField;
    qryProdID_PRODUTO_SIMILAR: TIntegerField;
    qryProdDATA_PRECO: TDateField;
    qryProdTRIBUTACAO_MONOFASICA: TStringField;
    qryProdID_MENU: TIntegerField;
    qryProdVALOR_PEQUENA: TFMTBCDField;
    qryProdVALOR_MEDIA: TFMTBCDField;
    qryProdVALOR_GRANDE: TFMTBCDField;
    qryProdTIPO_ALIMENTO: TStringField;
    qryProdSERIAL: TStringField;
    qryProdMVA_NORMAL: TFMTBCDField;
    qryProdIMPRIME_TICKET: TStringField;
    qryProdICMS_DIFERIDO: TFMTBCDField;
    qryProdQTD_SABORES: TIntegerField;
    qryProdCOD_ENQ_IPI: TStringField;
    qryProdTOTAL_COMPRA: TFMTBCDField;
    qryProdTOTAL_VENDA: TFMTBCDField;
    qryItemMVA: TFMTBCDField;
    qryItemCOD_ENQ_IPI: TStringField;
    qryItemDESCRICAO: TStringField;
    dsProduto: TDataSource;
    dsClientes: TDataSource;
    qryVendaNOME: TStringField;
    Panel5: TPanel;
    grpSelecao: TGroupBox;
    EdtProduto: TEdit;
    qryProdutoQTD_ATUAL: TFMTBCDField;
    TabSheet4: TTabSheet;
    Label44: TLabel;
    DBComboBoxEh6: TDBComboBoxEh;
    DBEdit8: TDBEdit;
    Label46: TLabel;
    DBComboBoxEh7: TDBComboBoxEh;
    DBEdit37: TDBEdit;
    Label47: TLabel;
    Label45: TLabel;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet9: TTabSheet;
    Label26: TLabel;
    DBEdit25: TDBEdit;
    edtParcela: TEdit;
    Label25: TLabel;
    BtnGerar: TBitBtn;
    btnBoleto: TBitBtn;
    DBGridEh2: TDBGridEh;
    Label41: TLabel;
    DBEdit9: TDBEdit;
    qryCaixa: TFDQuery;
    dsCaixa: TDataSource;
    pnPessoa: TPanel;
    Label2: TLabel;
    DBEdit40: TDBEdit;
    DBGridPessooa: TDBGridEh;
    JvEnterAsTab1: TJvEnterAsTab;
    DBGridEh5: TDBGridEh;
    Label37: TLabel;
    qryCaixaCODIGO: TIntegerField;
    qryCaixaEMISSAO: TDateField;
    qryCaixaDOC: TStringField;
    qryCaixaFKPLANO: TIntegerField;
    qryCaixaFKCONTA: TIntegerField;
    qryCaixaHISTORICO: TStringField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaFKVENDA: TIntegerField;
    qryCaixaFKCOMPRA: TIntegerField;
    qryCaixaFKPAGAR: TIntegerField;
    qryCaixaFKRECEBER: TIntegerField;
    qryCaixaTRANSFERENCIA: TIntegerField;
    qryCaixaBLOQUEADO: TStringField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    qryCaixaID_SUBCAIXA: TIntegerField;
    qryCaixaFK_OS: TIntegerField;
    qryCaixaFPG: TIntegerField;
    qryCaixaRESUMO_CAIXA: TStringField;
    qryCaixaFK_NFE: TIntegerField;
    qryItemVIRTUAL_COMBUSTIVEL: TStringField;
    TabSheet10: TTabSheet;
    Label49: TLabel;
    DBEdit39: TDBEdit;
    Label50: TLabel;
    DBEdit41: TDBEdit;
    Label51: TLabel;
    DBEdit42: TDBEdit;
    Label52: TLabel;
    DBEdit43: TDBEdit;
    qryItemVBCSTRET: TFMTBCDField;
    qryItemVICMSSTRET: TFMTBCDField;
    qryItemVBCSTDEST: TFMTBCDField;
    qryItemVICMSSTDEST: TFMTBCDField;
    qryProdutoCOD_BENEFICIO: TStringField;
    qryProdutoMOTIVO_DESONERACAO: TIntegerField;
    DBEdit44: TDBEdit;
    Label54: TLabel;
    qryItemPESO_L: TFMTBCDField;
    qryItemPESO_B: TFMTBCDField;
    qryProdutoPESO_L: TFMTBCDField;
    qryProdutoPESO_B: TFMTBCDField;
    qrySomaPESO_B: TFMTBCDField;
    qrySomaPESO_L: TFMTBCDField;
    qryVendaNUMERACAO: TStringField;
    qryVendaGERA_ES: TStringField;
    DBEdit45: TDBEdit;
    Label53: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure qryVendaAfterOpen(DataSet: TDataSet);
    procedure qryItemBeforeInsert(DataSet: TDataSet);
    procedure qryVendaAfterPost(DataSet: TDataSet);
    procedure qryVendaAfterDelete(DataSet: TDataSet);
    procedure qryItemAfterDelete(DataSet: TDataSet);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure qryItemNewRecord(DataSet: TDataSet);
    procedure qryItemID_PRODUTOChange(Sender: TField);
    procedure qryItemQTDValidate(Sender: TField);
    procedure qryItemALIQ_ICMSValidate(Sender: TField);
    procedure qryVendaDESCONTOChange(Sender: TField);
    procedure qryVendaCalcFields(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure QryFaturaAfterPost(DataSet: TDataSet);
    procedure QryFaturaAfterDelete(DataSet: TDataSet);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure btnImportarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure qryItemCFOPValidate(Sender: TField);
    procedure qryVendaBeforePost(DataSet: TDataSet);
    procedure qryItemBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryVendaAfterEdit(DataSet: TDataSet);
    procedure qryItemAfterEdit(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure qryVendaAfterInsert(DataSet: TDataSet);
    procedure qryItemAfterInsert(DataSet: TDataSet);
    procedure DBComboBoxEh4KeyPress(Sender: TObject; var Key: Char);
    procedure qryVendaNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ACBrNFeStatusChange(Sender: TObject);
    procedure qryItemBeforeEdit(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure btnTranspClick(Sender: TObject);
    procedure QryFaturaBeforeEdit(DataSet: TDataSet);
    procedure QryFaturaAfterInsert(DataSet: TDataSet);
    procedure PageControl2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryReferenciaNewRecord(DataSet: TDataSet);
    procedure qryReferenciaAfterPost(DataSet: TDataSet);
    procedure btnPreviewClick(Sender: TObject);
    procedure qryVendaID_CLIENTEValidate(Sender: TField);
    procedure btnBoletoClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBEdit36Exit(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Columns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBEdit40Change(Sender: TObject);
    procedure DBEdit40KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1EditChange(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit40KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridPessooaDblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnPessoaExit(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure EdtProdutoExit(Sender: TObject);
    procedure EdtProdutoEnter(Sender: TObject);
    procedure EdtProdutoChange(Sender: TObject);
    procedure qryVendaCFOPValidate(Sender: TField);
    procedure qryItemBASE_ICMSValidate(Sender: TField);
  private
    vSql, vLetras: string;

    QuantidadeAnterior: extended;
    ProdutoAnterior: Integer;
    NotaF: NotaFiscal;
    Servico: TDetCollectionItem;
    Produto: TDetCollectionItem;
    Volume: TVolCollectionItem;
    Duplicata: TDupCollectionItem;
    Pagamento: TpagCollectionItem;
    ObsComplementar: TobsContCollectionItem;
    ObsFisco: TobsFiscoCollectionItem;
    Referenciada: TNFrefCollectionItem;
    DI: TDICollectionItem;
    Adicao: TAdiCollectionItem;
    ProcReferenciado: TprocRefCollectionItem;
    procedure CalculaTotais;
    procedure GerarNFCe(NumNFe: String);
    procedure estado;
    function ValidaNegocios: Boolean;
    procedure RatearItens;
    procedure CalculaLeiTransparecia;
    procedure CalculaCombatePobreza;
    procedure CalculaST;
    procedure NaturezaOperacao;
    procedure sTransmitida;
    procedure sCancelada;
    procedure sDenegada;
    procedure sDuplicidade;
    procedure sInutilizada;
    procedure sDenegado;
    function RetornaMaiorItem(Id: Integer): Integer;
    function ChecaConfiguracao: Boolean;
    function ChecaContingencia: Boolean;
    function ChecaParcela: Boolean;
    procedure ExcluiCR;
    procedure InsereItem;
    procedure CSTRegimeNormal;
    procedure CSTRegimeSimples;
    procedure CSTOrigem;
    procedure GetCliente(Pessoa: string);
    function ExisteRecebimento(Venda: Integer): Boolean;
    procedure InsereCaixa;
    function ExisteCaixa(Venda: Integer): Boolean;
    function ApagaCaixa(Venda: Integer): Boolean;
    function NotaPlaca: String;
    procedure Nota_Ide(NumNFe: string);
    procedure Nota_Emitente;
    procedure Nota_Destinatario;
    procedure Nota_Produto;
    procedure Nota_Produto_Adicionais;
    procedure Nota_Produto_Combustiveis;
    procedure Nota_Produto_Lei_Transparencia;
    procedure Nota_Produto_Zera_Impostos;
    procedure Nota_Produto_Desoneracao;
    procedure Nota_Produto_CST;
    procedure Nota_Produto_ICMS;
    procedure Nota_Produto_Icms_Retido;
    procedure Nota_Produto_Icms_diferido;
    procedure Nota_Produto_ICMS_ST;
    procedure Nota_Produto_Icms_Partilha;
    procedure Nota_Produto_CST_IPI;
    procedure Nota_produto_IPI;
    procedure Nota_produto_Pis;
    procedure Nota_Produto_Cofins;
    procedure Nota_Produto_Complementar;
    procedure Nota_total;
    procedure Nots_Total_Lei_Transparencia;
    procedure Nota_Total_Partilha;
    procedure Nota_Transportadora;
    procedure Nota_Bahia;
    procedure Nota_Volume;
    procedure Nota_Pagamento;
    procedure Nota_Duplicta;
    procedure Nota_Responsavel;
    procedure Notas_Adicionais;
    procedure Nota_Finaliza_NFe;
    procedure TotalNFe;
    procedure ZeraImpostos;
    procedure Calcula_Icms_Proprio;
    procedure Calcula_ICMS_Proprio_Reducao;
    procedure Calcula_IPI;
    procedure Calcula_PIS;
    procedure CalculaCOFINS;
    procedure Zera_ICMS_Simples_Nacional;
    procedure CalculaDiferimento;
    function CalculaCredito: extended;
    procedure UPdateItens(codigo: Integer);
    procedure AtualizaEstoque;
    procedure GeraCaixa;
    procedure AtualizaCFOP(cfop: string);
    { Private declarations }
  public
    { Public declarations }
    vPessoa: string;
    FPodeAlterar: Boolean;
    vPosicao: Integer;
    vPesquisa: string;
    vQtd: extended;
    procedure BuscaProduto;
    procedure AbreCR;
    procedure AbreCaixa;

  end;

var
  frmCadNFe: TfrmCadNFe;

implementation

{$R *.dfm}

uses Udados, ufrmStatus, uImportarNFe, uDadosWeb, uCadProduto, uCadPessoa,
  uCadTransp, udtmCBR, uDmNFe, uDMEstoque;

procedure TfrmCadNFe.InsereItem;
var
  vPosicao: Integer;
  vPesquisa: string;
  vQtd: extended;

begin

  try

    vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
    vPesquisa := trim(copy((EdtProduto.Text), vPosicao, 1000));

    vQtd := StrToFloatDef(copy(EdtProduto.Text, 1,
      Pos('*', EdtProduto.Text) - 1), 1);

    qryItem.Insert;
    qryItem.FieldByName('ID_PRODUTO').Value :=
      Dados.buscacodigoProduto('select codigo from produto where codbarra=:cod',
      vPesquisa);
    qryItem.FieldByName('DESCRICAO').Value := qryItemVIRTUAL_PRODUTO.AsString;
    qryItem.FieldByName('QTD').AsFloat := vQtd;
    qryItem.Post;

    qryItem.Last;
  except
    on e: exception do
    begin
      // qryItem.Cancel;
      raise exception.Create('Erro:' + e.Message);
    end;
  end;

end;

procedure TfrmCadNFe.JvDBGrid1EditChange(Sender: TObject);
begin
  if true then

end;

procedure TfrmCadNFe.CSTRegimeNormal;
begin
  // empresas que não são do simples nacional
  if copy(qryItemCST.Value, 2, 2) = '00' then
    Produto.Imposto.ICMS.CST := cst00;
  if copy(qryItemCST.Value, 2, 2) = '10' then
    Produto.Imposto.ICMS.CST := cst10;
  if copy(qryItemCST.Value, 2, 2) = '20' then
    Produto.Imposto.ICMS.CST := cst20;
  if copy(qryItemCST.Value, 2, 2) = '30' then
    Produto.Imposto.ICMS.CST := cst30;
  if copy(qryItemCST.Value, 2, 2) = '40' then
    Produto.Imposto.ICMS.CST := cst40;
  if copy(qryItemCST.Value, 2, 2) = '41' then
    Produto.Imposto.ICMS.CST := cst41;
  if copy(qryItemCST.Value, 2, 2) = '45' then
    Produto.Imposto.ICMS.CST := cst45;
  if copy(qryItemCST.Value, 2, 2) = '50' then
    Produto.Imposto.ICMS.CST := cst50;
  if copy(qryItemCST.Value, 2, 2) = '51' then
    Produto.Imposto.ICMS.CST := cst51;

  if qryItemVIRTUAL_COMBUSTIVEL.Value = 'S' then
  begin
    if copy(qryItemCST.Value, 2, 2) = '60' then
      Produto.Imposto.ICMS.CST := cstRep60;
  end
  else
  begin
    if copy(qryItemCST.Value, 2, 2) = '60' then
      Produto.Imposto.ICMS.CST := cst60;
  end;

  if copy(qryItemCST.Value, 2, 2) = '70' then
    Produto.Imposto.ICMS.CST := cst70;
  if copy(qryItemCST.Value, 2, 2) = '80' then
    Produto.Imposto.ICMS.CST := cst80;
  if copy(qryItemCST.Value, 2, 2) = '81' then
    Produto.Imposto.ICMS.CST := cst81;
  if copy(qryItemCST.Value, 2, 2) = '90' then
    Produto.Imposto.ICMS.CST := cst90;

end;

procedure TfrmCadNFe.CSTRegimeSimples;
begin
  // empresas do simples nacional
  if qryItemCSOSN.Value = '101' then
    Produto.Imposto.ICMS.CSOSN := csosn101;
  if qryItemCSOSN.Value = '102' then
    Produto.Imposto.ICMS.CSOSN := csosn102;
  if qryItemCSOSN.Value = '103' then
    Produto.Imposto.ICMS.CSOSN := csosn103;
  if qryItemCSOSN.Value = '201' then
    Produto.Imposto.ICMS.CSOSN := csosn201;
  if qryItemCSOSN.Value = '202' then
    Produto.Imposto.ICMS.CSOSN := csosn202;
  if qryItemCSOSN.Value = '203' then
    Produto.Imposto.ICMS.CSOSN := csosn203;
  if qryItemCSOSN.Value = '300' then
    Produto.Imposto.ICMS.CSOSN := csosn300;
  if qryItemCSOSN.Value = '400' then
    Produto.Imposto.ICMS.CSOSN := csosn400;

  if qryItemCSOSN.Value = '500' then
    Produto.Imposto.ICMS.CSOSN := csosn500;

  if qryItemCSOSN.Value = '900' then
    Produto.Imposto.ICMS.CSOSN := csosn900;
end;

procedure TfrmCadNFe.CSTOrigem;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text := 'SELECT ORIGEM FROM PRODUTO WHERE CODIGO=:ID';
  Dados.qryconsulta.Params[0].Value := qryItemID_PRODUTO.Value;
  Dados.qryconsulta.Open;
  case Dados.qryconsulta.FieldByName('ORIGEM').AsInteger of
    0:
      Produto.Imposto.ICMS.orig := oeNacional;
    1:
      Produto.Imposto.ICMS.orig := oeEstrangeiraImportacaoDireta;
    2:
      Produto.Imposto.ICMS.orig := oeEstrangeiraAdquiridaBrasil;
    3:
      Produto.Imposto.ICMS.orig := oeNacionalConteudoImportacaoSuperior40;
    4:
      Produto.Imposto.ICMS.orig := oeNacionalProcessosBasicos;
    5:
      Produto.Imposto.ICMS.orig := oeNacionalConteudoImportacaoInferiorIgual40;
    6:
      Produto.Imposto.ICMS.orig := oeEstrangeiraImportacaoDiretaSemSimilar;
    7:
      Produto.Imposto.ICMS.orig := oeNacionalConteudoImportacaoSuperior70;
  else
    Produto.Imposto.ICMS.orig := oeNacional;
  end;
end;

procedure TfrmCadNFe.EdtProdutoChange(Sender: TObject);
begin
  vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
  vPesquisa := trim(copy((EdtProduto.Text), vPosicao, 1000));
  vQtd := StrToFloatDef(copy(EdtProduto.Text, 1,
    Pos('*', EdtProduto.Text) - 1), 1);
end;

procedure TfrmCadNFe.EdtProdutoEnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := false;
end;

procedure TfrmCadNFe.EdtProdutoExit(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := true;
end;

procedure TfrmCadNFe.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin

  if not Panel3.Enabled then
    exit;

  if (Key in [#13]) then
  begin
    if (qryVenda.State in dsEditModes) then
      qryVenda.Post;
    if ActiveControl = EdtProduto then
    begin
      if EdtProduto.Text <> '' then
      begin
        InsereItem;
        EdtProduto.SetFocus;
        EdtProduto.Clear;
        Key := #0;
      end
      else
      begin
        DBEdit12.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmCadNFe.CalculaLeiTransparecia;
var
  vTributos, vImportado, vNacional, vEstadual, vMunicipal: extended;
begin
  vImportado := 0;
  vNacional := 0;
  vEstadual := 0;
  vMunicipal := 0;

  if qryVendaFINALIDADE.Value <> '3' then
  begin // dif devolucao

    if not(qryProdutoNCM.IsNull) or (qryProdutoNCM.Value <> '') then
    begin
      if qryProdutoIMPORTADOSFEDERAL.Value <> '' then
        vImportado :=
          strtofloat(StringReplace(qryProdutoIMPORTADOSFEDERAL.Value, '.',
          ',', []));
      if qryProdutoNACIONALFEDERAL.Value <> '' then
        vNacional := strtofloat(StringReplace(qryProdutoNACIONALFEDERAL.Value,
          '.', ',', []));
      if qryProdutoESTADUAL.Value <> '' then
        vEstadual := strtofloat(StringReplace(qryProdutoESTADUAL.Value, '.',
          ',', []));
      if qryProdutoMUNICIPAL.Value <> '' then
        vMunicipal := strtofloat(StringReplace(qryProdutoMUNICIPAL.Value, '.',
          ',', []));
    end;
  end;

  qryItemTRIB_IMP.Value := 0;
  qryItemTRIB_EST.Value := 0;
  qryItemTRIB_FED.Value := 0;
  qryItemTRIB_MUN.Value := 0;

  if vImportado > 0 then
    qryItemTRIB_IMP.AsString := FormatFloat('0.00',
      (qryItemTOTAL.AsFloat * vImportado) / 100);
  if vNacional > 0 then
    qryItemTRIB_FED.AsString := FormatFloat('0.00',
      (qryItemTOTAL.AsFloat * vNacional) / 100);
  if vEstadual > 0 then
    qryItemTRIB_EST.AsString := FormatFloat('0.00',
      (qryItemTOTAL.AsFloat * vEstadual) / 100);
  if vMunicipal > 0 then
    qryItemTRIB_MUN.AsString := FormatFloat('0.00',
      (qryItemTOTAL.AsFloat * vMunicipal) / 100);

end;

procedure TfrmCadNFe.CalculaCombatePobreza;
var
  vDifal: extended;
begin
  // Calulca fundo de combate a probreza

  qryItemVBCUFDEST.Value := 0;
  qryItemVFCP.Value := 0;
  qryItemPICMSUFDEST.Value := 0;
  qryItemPICMSINTER.Value := 0;
  qryItemPICMSINTERPART.Value := 0;
  qryItemVFCPUFDEST.Value := 0;
  qryItemVICMSUFDEST.Value := 0;
  qryItemVICMSUFREMET.Value := 0;

  if Dados.qryEmpresaRECOLHE_FCP.Value = 'S' then

    if Dados.qryEmpresaUF.Value <> qryVendaVIRTUAL_UF_CLIENTE.Value then
      if qryVendaCONSUMIDOR_FINAL.Value = 'S' then
        if qryVendaVIRTUAL_ISENTO.Value = '2' then
        begin

          vDifal := 0;
          if qryItemVIRTUAL_FCP.AsFloat > 0 then
          begin

            if (copy(qryItemCST.Value, 2, 2) = '00') or
              (copy(qryItemCST.Value, 2, 2) = '10') or
              (copy(qryItemCST.Value, 2, 2) = '20') or
              (copy(qryItemCST.Value, 2, 2) = '70') or
              (copy(qryItemCST.Value, 2, 2) = '51') or
              (copy(qryItemCST.Value, 2, 2) = '90') or
              (qryItemCSOSN.Value = '101') or (qryItemCSOSN.Value = '102') or
              (qryItemCSOSN.Value = '103') or (qryItemCSOSN.Value = '201') or
              (qryItemCSOSN.Value = '202') or (qryItemCSOSN.Value = '203') or
              (qryItemCSOSN.Value = '900') then

            begin

              qryItemVBCUFDEST.AsFloat := qryItemBASE_ICMS.AsFloat;
              qryItemVFCP.AsFloat := qryItemVIRTUAL_FCP.AsFloat;
              qryItemPICMSUFDEST.AsFloat :=
                Dados.BuscaIcms('', qryVendaVIRTUAL_UF_CLIENTE.AsString,
                qryVendaVIRTUAL_UF_CLIENTE.AsString);
              qryItemPICMSINTER.AsFloat :=
                Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
                qryVendaVIRTUAL_UF_CLIENTE.AsString);
              qryItemPICMSINTERPART.AsFloat :=
                Dados.qryEmpresaDIFAL_DESTINO.AsFloat;
              qryItemVFCPUFDEST.AsFloat :=
                SimpleRoundTo(qryItemVBCUFDEST.AsFloat *
                (qryItemVFCP.AsFloat / 100), -2);

              vDifal := SimpleRoundTo(qryItemVBCUFDEST.AsFloat *
                ((qryItemPICMSUFDEST.AsFloat - qryItemPICMSINTER.AsFloat) /
                100), -2);

              qryItemVICMSUFDEST.AsFloat :=
                SimpleRoundTo(vDifal * (Dados.qryEmpresaDIFAL_DESTINO.AsFloat /
                100), -2);
              qryItemVICMSUFREMET.AsFloat :=
                SimpleRoundTo(vDifal * (Dados.qryEmpresaDIFAL_ORIGEM.AsFloat /
                100), -2);
            end;

            if (copy(qryItemCST.Value, 2, 2) = '60') or
              (qryItemCSOSN.Value = '500') then
            begin

              qryItemVBCUFDEST.AsFloat := qryItemTOTAL.AsFloat;
              qryItemVFCP.Value := qryItemVIRTUAL_FCP.AsFloat;
              qryItemPICMSUFDEST.Value :=
                Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
                qryVendaVIRTUAL_UF_CLIENTE.AsString);
              qryItemPICMSINTER.Value :=
                Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
                qryVendaVIRTUAL_UF_CLIENTE.AsString);
              qryItemPICMSINTERPART.Value :=
                Dados.qryEmpresaDIFAL_DESTINO.AsFloat;
              qryItemVFCPUFDEST.AsFloat :=
                SimpleRoundTo(qryItemVBCUFDEST.AsFloat *
                (qryItemVFCP.AsFloat / 100), -2);

              vDifal := SimpleRoundTo(qryItemVBCUFDEST.AsFloat *
                ((qryItemPICMSUFDEST.AsFloat - qryItemPICMSINTER.AsFloat) /
                100), -2);

              qryItemVICMSUFDEST.Value :=
                SimpleRoundTo(vDifal * (Dados.qryEmpresaDIFAL_DESTINO.AsFloat /
                100), -2);
              qryItemVICMSUFREMET.Value :=
                SimpleRoundTo(vDifal * (Dados.qryEmpresaDIFAL_ORIGEM.AsFloat /
                100), -2);
            end;
          end;

        end;

end;

procedure TfrmCadNFe.CalculaST;
var
  vICMSProprio, vICMSDentro, vMVA, vReducao, pICMSST, vBCST, vICMSST: extended;
begin
  // calculo substuição tributária

  if qryVendaFINALIDADE.Value = '3' then
    exit;

  qryItemBASE_ICMS_ST.Value := 0;
  qryItemVALOR_ICMS_ST.Value := 0;
  vMVA := 0;
  pICMSST := 0;
  vReducao := 0;
  vBCST := 0;
  vICMSST := 0;
  vICMSProprio := 0;

  if (qryItemVIRTUAL_MVA_NORMAL.AsFloat = 0) and (qryItemVIRTUAL_MVA.AsFloat = 0)
  then
    exit;

  if (Pos('10', qryItemCST.Value) <> 0) or (Pos('30', qryItemCST.Value) <> 0) or
    (Pos('70', qryItemCST.Value) <> 0) or (Pos('90', qryItemCST.Value) <> 0) or
    (Pos('201', qryItemCSOSN.Value) <> 0) or
    (Pos('202', qryItemCSOSN.Value) <> 0) or
    (Pos('900', qryItemCSOSN.Value) <> 0) then
  begin

    vReducao := qryItemVIRTUAL_REDUCAO.AsFloat;

    if qryVendaVIRTUAL_REGIME.AsString = 'NORMAL' then
      vMVA := qryItemVIRTUAL_MVA_NORMAL.AsFloat
    else
      vMVA := qryItemVIRTUAL_MVA.AsFloat;

    if vMVA = 0 then
      vMVA := qryItemVIRTUAL_MVA.AsFloat;

    if vMVA > 0 then // calcula base de substituição tributária
    begin
      vBCST := SimpleRoundTo((qryItemTOTAL.AsFloat + qryItemSEGURO.AsFloat +
        qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat - qryItemDESCONTO.AsFloat)
        * (1 + (vMVA / 100)) * (1 - (vReducao / 100)), -2);
    end;

    if qryVendaVIRTUAL_UF_CLIENTE.Value = Dados.qryEmpresaUF.Value then
    begin
      pICMSST := Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
        Dados.qryEmpresaUF.AsString);
    end
    else
    begin
      pICMSST := Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
        qryVendaVIRTUAL_UF_CLIENTE.AsString);
    end;

    vICMSDentro := Dados.BuscaIcms('', Dados.qryEmpresaUF.AsString,
      Dados.qryEmpresaUF.AsString);

    vICMSProprio := (vICMSDentro * qryItemTOTAL.AsFloat) / 100;

    vICMSST := (vBCST * pICMSST) / 100;

    if (not(qryItem.State in dsEditModes)) then
      qryItem.Edit;
    qryItemBASE_ICMS_ST.AsFloat := vBCST;
    qryItemALIQ_ICMS_ST.AsFloat := pICMSST;

    qryItemVALOR_ICMS_ST.AsFloat := vICMSST;

    if Dados.qryEmpresaUSA_CREDITO_SIMPLES.Value = 'S' then
      qryItemVALOR_ICMS_ST.AsFloat := vICMSST - vICMSProprio;

    qryItemVALOR_ICMS_ST_RET.AsFloat := qryItemVALOR_ICMS_ST.AsFloat;

  end;
end;

procedure TfrmCadNFe.CalculaDiferimento;
var
  pRedBC, vBC, pICMS, vICMSOp, pDif, vICMSDif, vICMS: extended;
begin
  // calculo substuição tributária

  if qryVendaFINALIDADE.Value = '3' then // devolução
    exit;

  if (Pos('51', qryItemCST.Value) <> 0) then
  begin
    qryItemPICMSDEFERIDO.Value := 0;
    qryItemVICMSDEFERIDO.Value := 0;

    pRedBC := 0;
    vBC := 0;
    pICMS := 0;
    vICMSOp := 0;
    pDif := 0;
    vICMSDif := 0;
    vICMS := 0;

    vBC := SimpleRoundTo((qryItemTOTAL.AsFloat + qryItemSEGURO.AsFloat +
      qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat - qryItemDESCONTO.AsFloat) *
      (1 - (pRedBC / 100)), -2);
    pICMS := qryItemALIQ_ICMS.AsFloat;
    pDif := qryItemVIRTUAL_DIFERIDO.AsFloat;
    vICMSOp := (pICMS * vBC) / 100;
    vICMSDif := (vICMSOp * pDif) / 100;
    vICMS := vICMSOp - vICMSDif;

    if (not(qryItem.State in dsEditModes)) then
      qryItem.Edit;

    qryItemBASE_ICMS.AsFloat := vBC;
    qryItemPICMSDEFERIDO.AsFloat := pDif;
    qryItemVICMSDEFERIDO.AsFloat := vICMSDif;
    qryItemVALOR_ICMS.AsFloat := vICMS;

  end;
end;

function TfrmCadNFe.RetornaMaiorItem(Id: Integer): Integer;
begin
  result := 1;

  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Clear;
  Dados.qryconsulta.SQL.Add
    ('select first 1 codigo, coalesce(max(total),0) total from NFE_DETALHE');
  Dados.qryconsulta.SQL.Add('where FKNFE=:cod');
  Dados.qryconsulta.SQL.Add('group by 1');
  Dados.qryconsulta.SQL.Add('order by 2 desc');
  Dados.qryconsulta.Params[0].Value := Id;
  Dados.qryconsulta.Open;

  result := Dados.qryconsulta.Fields[0].AsInteger;

end;

procedure TfrmCadNFe.RatearItens;
var
  pPercentual, vDiferenca, vSaldo, vTributos, vImportado, vNacional, vEstadual,
    vMunicipal: extended;
  vBase, vSomaFrete, vSomaSeguro, vSomaDespesa, vSomaDesconto: extended;
  vFrete, vSeguro, vDespesa, vDesconto: extended;
  Item: Integer;
begin
  try
    qryItem.DisableControls;

    vSomaDesconto := 0;
    vSomaFrete := 0;
    vSomaSeguro := 0;
    vSomaDespesa := 0;

    vDesconto := 0;
    vFrete := 0;
    vSeguro := 0;
    vDespesa := 0;
    Item := 1;

    qryItem.First;
    while not qryItem.Eof do
    begin

      qryProduto.Close;
      qryProduto.Params[0].AsInteger := qryItemID_PRODUTO.AsInteger;
      qryProduto.Open;

      if not(qryItem.State in dsEditModes) then
        qryItem.Edit;


      // calcula desconto

      pPercentual := qryVendaDESCONTO.AsFloat / qryVendaSUBTOTAL.AsFloat;
      vDesconto := pPercentual * qryItemTOTAL.AsFloat;
      qryItemDESCONTO.AsFloat := SimpleRoundTo(vDesconto, -2);

      vSomaDesconto := vSomaDesconto + qryItemDESCONTO.AsFloat;

      // calcula seguro

      pPercentual := qryVendaSEGURO.AsFloat / qryVendaSUBTOTAL.AsFloat;
      vSeguro := pPercentual * qryItemTOTAL.AsFloat;
      qryItemSEGURO.AsFloat := SimpleRoundTo(vSeguro, -2);

      vSomaSeguro := vSomaSeguro + qryItemSEGURO.AsFloat;

      // calcula outros

      pPercentual := qryVendaOUTROS.AsFloat / qryVendaSUBTOTAL.AsFloat;
      vDespesa := pPercentual * qryItemTOTAL.AsFloat;
      qryItemOUTROS.AsFloat := SimpleRoundTo(vDespesa, -2);
      vSomaDespesa := vSomaDespesa + qryItemOUTROS.AsFloat;

      // calcula frete

      pPercentual := qryVendaFRETE.AsFloat / qryVendaSUBTOTAL.AsFloat;
      vFrete := pPercentual * qryItemTOTAL.AsFloat;
      qryItemFRETE.AsFloat := SimpleRoundTo(vFrete, -2);
      vSomaFrete := vSomaFrete + qryItemFRETE.AsFloat;

      CalculaLeiTransparecia;
      CalculaCombatePobreza;
      CalculaST;

      qryItemITEM.AsInteger := Item;
      qryItem.Post;
      Dados.Conexao.CommitRetaining;

      qryItem.Next;
      Item := Item + 1;
      Application.ProcessMessages;
    end;

    // verifica se exite diferença entre itens e total
    qryItem.Locate('CODIGO', RetornaMaiorItem(qryVendaCODIGO.Value));

    qryItem.Edit;
    vDiferenca := qryVendaFRETE.AsFloat - vSomaFrete;

    if vDiferenca <> 0 then
      qryItemFRETE.Value := qryItemFRETE.AsFloat + vDiferenca;

    vDiferenca := qryVendaDESCONTO.AsFloat - vSomaDesconto;
    if vDiferenca <> 0 then
      qryItemDESCONTO.Value := qryItemDESCONTO.AsFloat + vDiferenca;

    vDiferenca := qryVendaOUTROS.AsFloat - vSomaDespesa;
    if vDiferenca <> 0 then
      qryItemOUTROS.Value := qryItemOUTROS.AsFloat + vDiferenca;

    vDiferenca := qryVendaSEGURO.AsFloat - vSomaSeguro;
    if vDiferenca <> 0 then
      qryItemSEGURO.Value := qryItemSEGURO.AsFloat + vDiferenca;

    qryItem.Post;
    Dados.Conexao.CommitRetaining;
  finally
    qryItem.EnableControls;
  end;

end;

procedure TfrmCadNFe.ACBrNFeStatusChange(Sender: TObject);
begin
  case DmNFe.ACBrNFe.Status of
    stIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stNFeStatusServico:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeRetRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeConsulta:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeCancelamento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeInutilizacao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeRecibo:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeCadastro:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeEmail:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Email...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeCCe:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeEvento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Evento...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;
  Application.ProcessMessages;

end;

procedure TfrmCadNFe.CalculaTotais;
begin
  try
    qryVenda.DisableControls;

    qrySoma.Close;
    qrySoma.Params[0].Value := qryVendaCODIGO.Value;
    qrySoma.Open;

    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;

    qryVendaSUBTOTAL.AsFloat := qrySomaSUBTOTAL.AsFloat;

    qryVendaBASE_IPI.AsFloat := qrySomaBIPI.AsFloat;
    qryVendaBASEICMS.AsFloat := qrySomaBICMS.AsFloat;
    qryVendaBASE_ICMS_ST.AsFloat := qrySomaBASE_ICMS_ST.AsFloat;
    qryVendaBASEICMSPIS.AsFloat := qrySomaBPIS.AsFloat;
    qryVendaBASEICMSCOF.AsFloat := qrySomaBCOFINS.AsFloat;
    qryVendaTOTAL_IPI.AsFloat := qrySomaVLIPI.AsFloat;
    qryVendaTOTALICMS.AsFloat := qrySomaVLICMS.AsFloat;
    qryVendaVALOR_ICMS_ST.AsFloat := qrySomaVALOR_ICMS_ST.AsFloat;
    qryVendaTOTALICMSPIS.AsFloat := qrySomaVLPIS.AsFloat;
    qryVendaTOTALICMSCOFINS.AsFloat := qrySomaVLCOF.AsFloat;
    qryVendaTOTAL_DESONERACAO.AsFloat := qrySomaDESONERACAO.AsFloat;
    qryVendaPESOB.AsFloat := qrySomaPESO_B.AsFloat;
    qryVendaPESOL.AsFloat := qrySomaPESO_L.AsFloat;
    qryVendaTOTAL.Value := (qryVendaSUBTOTAL.Value + qryVendaTOTAL_IPI.Value +
      qryVendaFRETE.Value + qryVendaOUTROS.Value + qryVendaSEGURO.Value +
      qryVendaVALOR_ICMS_ST.AsFloat) - qryVendaDESCONTO.Value -
      qryVendaTOTAL_DESONERACAO.AsFloat;

    qryVendaVFCPUFDEST.Value := qrySomaVFCPUFDEST.Value;
    qryVendaVICMSUFDEST.Value := qrySomaVICMSUFDEST.Value;
    qryVendaVICMSUFREMET.Value := qrySomaVICMSUFREMET.Value;

    qryVendaTRIB_MUN.Value := qrySomaTMUN.AsFloat;
    qryVendaTRIB_IMP.Value := qrySomaTIMP.AsFloat;
    qryVendaTRIB_EST.Value := qrySomaTEST.AsFloat;
    qryVendaTRIB_FED.Value := qrySomaTFED.AsFloat;

    qryVenda.Post;
  finally
    qryVenda.EnableControls;
  end;
end;

procedure TfrmCadNFe.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

function TfrmCadNFe.CalculaCredito: extended;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'select coalesce(sum(total),0) as total from nfe_detalhe where fknfe=:codigo and (csosn in (''101'',''201'',''900''))';
  Dados.qryconsulta.Params[0].Value := qryVendaCODIGO.Value;
  Dados.qryconsulta.Open;
  if Dados.qryconsulta.Fields[0].AsFloat > 0 then
    result := Dados.qryconsulta.Fields[0].AsFloat
  else
    result := 0;
end;

procedure TfrmCadNFe.GetCliente(Pessoa: string);
begin

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;

  if not qryClientes.IsEmpty then
  begin
    qryVendaID_CLIENTE.AsInteger := qryClientesCODIGO.AsInteger;
    qryVendaNOME.AsString := qryClientesRAZAO.AsString;
  end
  else
  begin
    qryVendaID_CLIENTE.Clear;
    qryVendaNOME.Clear;
    raise exception.Create('Pessoa não foi encontrada!');
  end;
end;

procedure TfrmCadNFe.GerarNFCe(NumNFe: String);
Var
  vICMSIntra, vICMSInter, vDifal: extended;
begin

  DmNFe.ACBrNFe.NotasFiscais.Clear;
  NotaF := DmNFe.ACBrNFe.NotasFiscais.Add;
  Nota_Ide(NumNFe);
  Nota_Emitente;
  Nota_Destinatario;

  qryItem.First;

  while not qryItem.Eof do
  begin
    try

      Produto := NotaF.NFe.Det.Add;
      Nota_Produto;
      Nota_Produto_Adicionais;
      Nota_Produto_Combustiveis;
      Nota_Produto_Lei_Transparencia;
      Nota_Produto_Zera_Impostos;
      Nota_Produto_Desoneracao;
      Nota_Produto_CST;
      Nota_Produto_ICMS;
      Nota_Produto_Icms_Retido;
      Nota_Produto_ICMS_ST;
      Nota_Produto_Icms_diferido;
      Nota_Produto_Icms_Partilha;
      Nota_Produto_CST_IPI;
      Nota_produto_IPI;
      Nota_produto_Pis;
      Nota_Produto_Cofins;
      Nota_Produto_Complementar;
      qryItem.Next;
    except
      raise exception.Create('erro no cadastro de produto' + sLineBreak +
        'Item:' + qryItemITEM.AsString);
    end;
  end;
  Nota_total;
  Nots_Total_Lei_Transparencia;
  Nota_Total_Partilha;
  Nota_Transportadora;
  Nota_Bahia;
  Nota_Volume;
  Nota_Pagamento;
  Nota_Duplicta;
  Nota_Responsavel;
  Notas_Adicionais;
  DmNFe.ACBrNFe.NotasFiscais.GerarNFe;
  Nota_Finaliza_NFe;

end;

procedure TfrmCadNFe.QryFaturaAfterDelete(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadNFe.QryFaturaAfterInsert(DataSet: TDataSet);
begin
  btnGravar.Enabled := true;
end;

procedure TfrmCadNFe.QryFaturaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadNFe.QryFaturaBeforeEdit(DataSet: TDataSet);
begin
  btnGravar.Enabled := true;
end;

function TfrmCadNFe.ValidaNegocios: Boolean;
var
  Msg: String;
  Inicio: TDateTime;
  Ok: Boolean;
  Tempo: String;
begin
  result := true;
  Inicio := Now;
  Ok := DmNFe.ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(Msg);
  Tempo := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

  if not Ok then
  begin
    result := false;
    ShowMessage('Erros encontrados' + #13 + Msg + #13 + sLineBreak + #13 +
      'Tempo: ' + Tempo);
  end;
end;

function TfrmCadNFe.ChecaConfiguracao: Boolean;
begin
  result := false;
  Dados.qryConfig.Close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  if (Dados.qryConfig.IsEmpty) then
  begin
    ShowMessage('Configure os parametros para emissão do NF-e!');
    result := true;
  end;
end;

function TfrmCadNFe.ChecaContingencia: Boolean;
begin
  result := false;
  if (Dados.qryConfigFORMAEMISSAO.Value <> 0) and (qryVendaSITUACAO.Value = '7')
  then
  begin
    ShowMessage('Nota já foi transmitida em modo de CONTINGÊNCIA!!!');
    result := true;
  end;

end;

procedure TfrmCadNFe.UPdateItens(codigo: Integer);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'update nfe_detalhe set situacao=''2'' where fknfe=:codigo';
  Dados.qryExecute.Params[0].Value := codigo;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

end;

procedure TfrmCadNFe.GeraCaixa;
begin
  if not(ExisteCaixa(qryVendaCODIGO.AsInteger)) then
  begin
    ApagaCaixa(qryVendaCODIGO.AsInteger);
    InsereCaixa;
  end;
end;

procedure TfrmCadNFe.btnTransmitirClick(Sender: TObject);
begin
  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  qryItem.Refresh;

 // Dados.BloqueiaCliente;

  PageControl2.ActivePageIndex := 0;

  Dados.qryEmpresa.Locate('CODIGO', qryVendaFKEMPRESA.Value, []);

  try
    try
      btnTransmitir.Enabled := false;
      btnPreview.Enabled := btnTransmitir.Enabled;
      Application.ProcessMessages;

      if ChecaConfiguracao then
        exit;

      if ChecaContingencia then
        exit;

      GerarNFCe(qryVendaNUMERO.AsString);

      if Dados.qryConfigFORMAEMISSAO.Value = 0 then
      begin

        try
          if DmNFe.ACBrNFe.Enviar(qryVendaCODIGO.Value, false) then
            sTransmitida;
        except
          on e: exception do
          begin

            case DmNFe.ACBrNFe.WebServices.Enviar.cStat of
              101: // cancelada
                begin
                  DmNFe.ACBrNFe.Consultar;
                  sCancelada;
                end;
              110, 302, 303: // denegada
                begin
                  sDenegada;
                end;
              204, 539: // duplicidade
                begin
                  DmNFe.ACBrNFe.Consultar;
                  if DmNFe.ACBrNFe.WebServices.Consulta.cStat = 100 then
                    sTransmitida
                  else
                    sDuplicidade;
                end;
              563: // inutilizada
                begin
                  sInutilizada;
                end
            else
              begin
                case DmNFe.ACBrNFe.WebServices.Retorno.cStat of
                  101: // cancelada
                    begin
                      sCancelada;
                    end;
                  302, 303: // denegada
                    begin
                      sDenegado;
                    end;
                  204, 539: // duplicidade
                    begin
                      sDuplicidade;
                    end;
                  563: // inutilizada
                    begin
                      sInutilizada;
                    end
                else
                  begin
                    ShowMessage('Retorno:' + DmNFe.ACBrNFe.WebServices.Retorno.
                      cStat.ToString + ' - ' +
                      DmNFe.ACBrNFe.WebServices.Retorno.xMotivo + sLineBreak +
                      'Erro:' + e.Message);
                    exit
                  end;
                end;
              end;
            end;
          end;
        end;
      end
      else
      begin
        DmNFe.ACBrNFe.NotasFiscais.Assinar;

        if not(qryVenda.State in dsEditModes) then
          qryVenda.Edit;
        qryVendaCHAVE.Value :=
          copy(DmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.Id, 4, 100);
        qryVendaXML.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0].XML;
        qryVendaSITUACAO.Value := '7';
        qryVenda.Post;

      end;
    except
      on e: exception do
        raise exception.Create(e.Message);
    end;
  finally
    if qryVendaSITUACAO.Value = '1' then
    begin
      btnTransmitir.Enabled := true;
      btnPreview.Enabled := btnTransmitir.Enabled;
    end;

    Application.ProcessMessages;
  end;

end;

function TfrmCadNFe.ChecaParcela: Boolean;
var
  valor1, valor2: string;
begin
  result := false;

  if qryCR.State in dsEditModes then
    qryCR.Post;

  begin
    if not qryCR.IsEmpty then
    begin
      valor1 := FormatFloat('0.00', SimpleRoundTo(qryCRTVALOR.Value, -2));

      valor2 := qryVendaTOTAL.AsString;

      if valor1.ToExtended <> valor2.ToExtended then
      begin
        ShowMessage('Atenção!' +
          'Não é possivel avançar. Total das parcelas difere do Valor total da venda!');
        result := true;
      end;
    end;
  end;
end;

procedure TfrmCadNFe.btnBoletoClick(Sender: TObject);
var
  Femail: string;
begin
  if ChecaParcela then
    exit;

  try
    btnBoleto.Enabled := false;

    if qryVendaSUBTOTAL.AsFloat = 0 then
      raise exception.Create('Informe o valor da nota!');

    // boleto

    qryCRBoleto.Close;
    qryCRBoleto.Params[0].Value := qryVendaCODIGO.Value;
    qryCRBoleto.Open;

    if qryCRBoleto.IsEmpty then
    begin
      ShowMessage('Não existem contas a serem baixadas');
      exit;
    end;

    qryCRBoleto.First;
    while not qryCRBoleto.Eof do
    begin
      Dados.UpdateTipoBoleto(qryCRBoleto.FieldByName('codigo').AsInteger);
      qryCRBoleto.Next;
    end;

    dtmCBR.ConfigurarBoleta;
    dtmCBR.ACBrBoleto1.ListadeBoletos.Clear;

    qryCRBoleto.Close;
    qryCRBoleto.Params[0].Value := qryVendaCODIGO.Value;
    qryCRBoleto.Open;

    qryCRBoleto.First;
    while not qryCRBoleto.Eof do
    begin

      // popular a lista de boletos selecionados
      with dtmCBR.ACBrBoleto1.CriarTituloNaLista do
      begin
        // OcorrenciaOriginal.Tipo := toRemessaBaixar;
        NumeroDocumento := qryVendaNUMERO.AsString;
        DataProcessamento := Now;
        DataDocumento := qryCRBoleto.FieldByName('DATA').Value;
        Vencimento := qryCRBoleto.FieldByName('DTVENCIMENTO').Value;
        ValorDocumento := qryCRBoleto.FieldByName('VALOR').Value;
        EspecieDoc := dtmCBR.qryCBR_CONFIGESPECIEDOC.AsString;
        EspecieMod := dtmCBR.qryCBR_CONFIGCOBMOEDA.AsString;
        Carteira := dtmCBR.qryCBR_CONFIGCARTEIRA.AsString;

        // bb exige que carteira seja enviada antes do nosso numero
        if dtmCBR.ACBrBoleto1.Banco.Numero = 1 then
          nossonumero := Carteira + qryCRBoleto.FieldByName('NBOLETO').AsString
        else
          nossonumero := qryCRBoleto.FieldByName('NBOLETO').Value;

        Aceite := atNao;

        Sacado.NomeSacado := qryCRBoleto.FieldByName('RAZAO').AsString;
        Sacado.CNPJCPF := qryCRBoleto.FieldByName('CNPJ').AsString;
        Sacado.Logradouro := qryCRBoleto.FieldByName('ENDERECO').AsString;
        Sacado.Numero := qryCRBoleto.FieldByName('NUMERO').AsString;;
        Sacado.Bairro := qryCRBoleto.FieldByName('BAIRRO').AsString;;
        Sacado.Cidade := qryCRBoleto.FieldByName('MUNICIPIO').AsString;;
        Sacado.UF := qryCRBoleto.FieldByName('UF').AsString;;
        Sacado.CEP := qryCRBoleto.FieldByName('CEP').AsString;;
        Sacado.Complemento := qryCRBoleto.FieldByName('COMPLEMENTO').AsString;;

        ValorDesconto := 0.00;
        ValorMoraJuros := 0.00;
        ValorAbatimento := 0.00;
        PercentualMulta := 0.00;
        DataMoraJuros := 0.0;
        DataDesconto := 0.0;
        DataAbatimento := 0.0;
        DataProtesto := 0.0;

        LocalPagamento := dtmCBR.qryCBR_CONFIGLOCALPAGTO.AsString;
        mensagem.Text := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
        // Instrucao1         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
        // Instrucao2         := dtmCBR.qryCBR_CONFIGINSTRUCAO2.AsString;
        // TextoLivre         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
      end;
      qryCRBoleto.Next;
    end;
    dtmCBR.ACBrBoleto1.Imprimir;

    If Application.messagebox
      ('Deseja enviar boleto(s) para o email do cliente?', 'Confirmação',
      mb_yesno + mb_iconquestion) = IDYES then
    begin
      Femail := InputBox('Email do Cliente', 'Email:',
        qryCRBoleto.FieldByName('email1').AsString);
      if trim(Femail) <> '' then
      begin
        dtmCBR.EnviarEmal(Femail, qryCRBoleto.FieldByName('RAZAO').AsString);
      end;
    end;
  finally
    btnBoleto.Enabled := true;
  end;
end;

procedure TfrmCadNFe.ExcluiCR;
begin

  qryCR.First;

  if not qryCRID_CBR_REMESSA_UUID.IsNull then
    Dados.DeletaRemessa(qryCRREMESSA_ARQUIVO.AsString,
      qryCRID_CBR_REMESSA_UUID.AsString);

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := 'delete from creceber where fk_nfe=:codigo';
  Dados.qryExecute.ParamByName('codigo').AsInteger := qryVendaCODIGO.AsInteger;
  Dados.qryExecute.Prepare;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

end;

function TfrmCadNFe.ExisteRecebimento(Venda: Integer): Boolean;
begin
  result := false;
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'SELECT CODIGO FROM CRECEBER WHERE FK_VENDA=:VENDA';
  Dados.qryconsulta.Params[0].Value := Venda;
  Dados.qryconsulta.Open;
  if not Dados.qryconsulta.IsEmpty then
    result := true;

end;

function TfrmCadNFe.ApagaCaixa(Venda: Integer): Boolean;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text := 'DELETE FROM CAIXA WHERE FK_NFE=:VENDA';
  Dados.qryconsulta.Params[0].Value := qryVendaCODIGO.Value;
  Dados.qryconsulta.ExecSQL;
  qryCaixa.Refresh;
end;

function TfrmCadNFe.ExisteCaixa(Venda: Integer): Boolean;
begin
  result := false;
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text := 'SELECT CODIGO FROM CAIXA WHERE FK_NFE=:VENDA';
  Dados.qryconsulta.Params[0].Value := Venda;
  Dados.qryconsulta.Open;
  if not Dados.qryconsulta.IsEmpty then
    result := true;
end;

procedure TfrmCadNFe.BuscaProduto;
begin
  qryProduto.Close;
  qryProduto.Params[0].AsInteger := qryItemID_PRODUTO.AsInteger;
  qryProduto.Open;

  qryItemPESO_L.AsFloat := qryProdutoPESO_L.AsFloat;
  qryItemPESO_B.AsFloat := qryProdutoPESO_B.AsFloat;

  qryItemPRECO.AsFloat := qryProdutoPR_VENDA.AsFloat;
  qryItemCFOP.Value := qryVendaCFOP.AsString;
  qryItemUNIDADE.Value := qryProdutoUNIDADE.Value;

  if qryVendaVIRTUAL_UF_CLIENTE.Value <> Dados.qryEmpresaUF.Value then
  begin
    qryItemALIQ_ICMS.AsFloat := qryProdutoALIQ_ICMS_EXTERNO.AsFloat;
    qryItemCST.Value := qryProdutoCST_EXTERNO.Value;
    qryItemCSOSN.Value := qryProdutoCSOSN_EXTERNO.Value;
  end
  else
  begin
    qryItemALIQ_ICMS.AsFloat := qryProdutoALIQ_ICM.AsFloat;
    qryItemCST.Value := qryProdutoCSTICMS.Value;
    qryItemCSOSN.Value := qryProdutoCSOSN.Value;

  end;

  if Dados.qryEmpresaPUXA_CFOP_PRODUTO.Value = 'S' then
  begin
    qryItemCFOP.Value := qryProdutoCFOP.Value;
    if qryVendaVIRTUAL_UF_CLIENTE.Value <> Dados.qryEmpresaUF.Value then
      qryItemCFOP.Value := qryProdutoCFOP_EXTERNO.AsString;
  end;

  qryItemCST_COFINS.Value := qryProdutoCSTS.Value;
  qryItemCST_PIS.Value := qryProdutoCSTS.Value;
  qryItemCST_IPI.Value := qryProdutoCSTIPI.Value;
  qryItemCOD_BARRA.Value := qryProdutoCODBARRA.Value;
  qryItemNCM.Value := qryProdutoNCM.Value;
  qryItemALIQ_COFINS_ICMS.AsFloat := qryProdutoALIQ_COF.AsFloat;
  qryItemALIQ_PIS_ICMS.AsFloat := qryProdutoALIQ_PIS.AsFloat;
  qryItemALIQ_IPI.AsFloat := qryProdutoALIQ_IPI.AsFloat;

  if qryProdutoCOD_BENEFICIO.AsString <> '' then
  begin
    qryItemMOTDESICMS.AsFloat := qryProdutoMOTIVO_DESONERACAO.AsFloat;
    qryItemBASE_DESONERACAO.AsFloat := qryItemTOTAL.AsFloat +
      qryItemSEGURO.AsFloat + qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat -
      qryItemDESCONTO.AsFloat;
    qryItemALIQ_DESONERACAO.AsFloat :=
      Dados.BuscaIcms('', Dados.qryEmpresaUF.Value, Dados.qryEmpresaUF.Value);
    qryItemVICMSDESON.AsFloat :=
      (qryItemBASE_DESONERACAO.AsFloat * qryItemALIQ_DESONERACAO.AsFloat) / 100;
  end;

  qryItemTIPO.AsString := qryProdutoTIPO.Value;
  if (trim(qryProdutoCODBARRA.AsString) = '') or (qryProdutoCODBARRA.IsNull)
  then
    qryItemCOD_BARRA.Value := 'SEM GTIN'
  else
    qryItemCOD_BARRA.Value := qryProdutoCODBARRA.AsString;

  if (copy(qryItemCST.Value, 2, 2) = '00') or
    (copy(qryItemCST.Value, 2, 2) = '10') or
    (copy(qryItemCST.Value, 2, 2) = '20') or
    (copy(qryItemCST.Value, 2, 2) = '70') or
    (copy(qryItemCST.Value, 2, 2) = '51') or
    (copy(qryItemCST.Value, 2, 2) = '90') then
  begin
    if qryVendaVIRTUAL_UF_CLIENTE.Value = Dados.qryEmpresaUF.Value then
      qryItemALIQ_ICMS.Value := qryProdutoALIQ_ICM.Value;
    if qryVendaVIRTUAL_UF_CLIENTE.Value <> Dados.qryEmpresaUF.Value then
      qryItemALIQ_ICMS.Value := Dados.BuscaIcms('', Dados.qryEmpresaUF.Value,
        iff(qryVendaVIRTUAL_UF_CLIENTE.AsString = '',
        qryVendaVIRTUAL_UF_CLIENTE.Value, Dados.qryEmpresaUF.Value));
  end
  else if (copy(qryItemCST.Value, 2, 2) = '40') or
    (copy(qryItemCST.Value, 2, 2) = '41') or
    (copy(qryItemCST.Value, 2, 2) = '50') or
    (copy(qryItemCST.Value, 2, 2) = '90') then
  begin
    qryItemALIQ_ICMS.Value := 0;
  end;

  if qryProdutoALIQ_PIS.Value > 0 then
    qryItemALIQ_PIS_ICMS.Value := qryProdutoALIQ_PIS.Value;
  if qryProdutoALIQ_COF.Value > 0 then
    qryItemALIQ_COFINS_ICMS.Value := qryProdutoALIQ_COF.Value;
  if qryProdutoALIQ_IPI.Value > 0 then
    qryItemALIQ_IPI.Value := qryProdutoALIQ_IPI.Value;
  qryItemNCM.Value := qryProdutoNCM.Value;
end;

procedure TfrmCadNFe.AtualizaEstoque;
begin
  if Dados.qryConfigGERA_FI_ES.Value = 'S' then
  begin
    if (qryVendaFKVENDA.IsNull) or (qryVendaFKVENDA.AsInteger = 0) then
    begin
      if ProdutoAnterior > 0 then
      begin
        dmestoque.AtualizaEstoque(ProdutoAnterior, QuantidadeAnterior, 0,
          'S', 'R');
        dmestoque.AtualizaComposicao(ProdutoAnterior, QuantidadeAnterior, 0,
          'S', 'R');
      end;
      dmestoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
        'S', 'R');
      dmestoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat,
        0, 'S', 'R');
    end;
  end;
end;

procedure TfrmCadNFe.Zera_ICMS_Simples_Nacional;
begin
  if qryVendaFINALIDADE.Value <> '3' then
  begin
    if Dados.qryEmpresaCRT.Value = 1 then
    // empresa do simples nacional
    begin
      if qryVendaFINALIDADE.Value = '0' then
      begin
        // finalidade normal
        qryItemALIQ_ICMS.AsFloat := 0;
        qryItemBASE_ICMS.AsFloat := 0;
        qryItemVALOR_ICMS.AsFloat := 0;
      end;
    end;
  end;
end;

procedure TfrmCadNFe.CalculaCOFINS;
begin
  if qryVendaFINALIDADE.Value = '3' then
    exit;

  qryItemBASE_COFINS_ICMS.Value := qryItemTOTAL.AsFloat;
  qryItemVALOR_COFINS_ICMS.Value :=
    SimpleRoundTo(qryItemTOTAL.AsFloat * qryItemALIQ_COFINS_ICMS.AsFloat
    / 100, -2);
end;

procedure TfrmCadNFe.Calcula_PIS;
begin
  if qryVendaFINALIDADE.Value = '3' then
    exit;

  qryItemBASE_PIS_ICMS.Value := qryItemTOTAL.AsFloat;
  qryItemVALOR_PIS_ICMS.Value :=
    SimpleRoundTo(qryItemTOTAL.AsFloat * qryItemALIQ_PIS_ICMS.AsFloat /
    100, -2);
end;

procedure TfrmCadNFe.Calcula_IPI;
begin
  if qryVendaFINALIDADE.Value = '3' then
    exit;

  qryItemBASE_IPI.Value := qryItemTOTAL.AsFloat;
  qryItemVALOR_IPI.Value := SimpleRoundTo(qryItemTOTAL.AsFloat *
    qryItemALIQ_IPI.AsFloat / 100, -2);
end;

procedure TfrmCadNFe.Calcula_ICMS_Proprio_Reducao;
var
  pRedBC, vBC, pICMS, vICMS: extended;
begin

  if qryVendaFINALIDADE.Value = '3' then
    exit;

  if (Pos('20', qryItemCST.Value) > 0) or (Pos('90', qryItemCST.Value) > 0) or
    (Pos('900', qryItemCSOSN.Value) > 0) then
  begin

    pRedBC := 0;
    vBC := 0;
    pICMS := 0;
    vICMS := 0;

    pRedBC := qryItemVIRTUAL_REDUCAO.AsFloat;

    if qryVendaCONSUMIDOR_FINAL.Value = 'S' then
      vBC := (qryItemTOTAL.AsFloat + qryItemVALOR_IPI.AsFloat +
        qryItemSEGURO.AsFloat + qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat -
        qryItemDESCONTO.AsFloat) * (1 - (pRedBC / 100))
    else
      vBC := (qryItemTOTAL.AsFloat + qryItemSEGURO.AsFloat +
        qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat - qryItemDESCONTO.AsFloat)
        * (1 - (pRedBC / 100));

    pICMS := qryItemALIQ_ICMS.AsFloat;

    vICMS := (vBC * pICMS) / 100;

    qryItemBASE_ICMS.AsFloat := vBC;
    qryItemVALOR_ICMS.AsFloat := vICMS;

  end;

end;

procedure TfrmCadNFe.Calcula_Icms_Proprio;
begin

  if qryVendaFINALIDADE.Value = '3' then
    exit;

  if (Pos('00', qryItemCST.Value) > 0) or (Pos('10', qryItemCST.Value) > 0) or
    (Pos('70', qryItemCST.Value) > 0) or (Pos('90', qryItemCST.Value) > 0) then
  begin

    if qryVendaCONSUMIDOR_FINAL.Value = 'S' then
      qryItemBASE_ICMS.Value := qryItemTOTAL.Value + qryItemVALOR_IPI.AsFloat +
        qryItemSEGURO.AsFloat + qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat -
        qryItemDESCONTO.AsFloat
    else
      qryItemBASE_ICMS.Value := qryItemTOTAL.Value + qryItemSEGURO.AsFloat +
        qryItemFRETE.AsFloat + qryItemOUTROS.AsFloat - qryItemDESCONTO.AsFloat;

    qryItemVALOR_ICMS.Value := SimpleRoundTo(qryItemBASE_ICMS.AsFloat *
      qryItemALIQ_ICMS.AsFloat / 100, -2);

  end;
end;

procedure TfrmCadNFe.ZeraImpostos;
begin
  if qryItemALIQ_ICMS.AsFloat = 0 then
  begin
    qryItemBASE_ICMS.AsFloat := 0;
    qryItemVALOR_ICMS.AsFloat := 0;
  end;

  if qryItemALIQ_PIS_ICMS.AsFloat = 0 then
  begin
    qryItemBASE_PIS_ICMS.AsFloat := 0;
    qryItemVALOR_PIS_ICMS.AsFloat := 0;
  end;

  if qryItemALIQ_COFINS_ICMS.AsFloat = 0 then
  begin
    qryItemBASE_COFINS_ICMS.AsFloat := 0;
    qryItemVALOR_COFINS_ICMS.AsFloat := 0;
  end;

  if qryItemALIQ_IPI.AsFloat = 0 then
  begin
    qryItemBASE_IPI.AsFloat := 0;
    qryItemVALOR_IPI.AsFloat := 0;
  end;
end;

procedure TfrmCadNFe.Nota_Finaliza_NFe;
begin
  if (qryVendaCHAVE.IsNull) or (trim(qryVendaCHAVE.AsString) = '') then
  begin
    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;
    qryVendaCHAVE.Value :=
      copy(DmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.Id, 4, 100);
    qryVendaXML.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0].XML;
    qryVenda.Post;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmCadNFe.Notas_Adicionais;
var
  ObsCredito: string;
  ValorCredito: extended;
begin
  ObsCredito := '';
  if Dados.qryEmpresaALIQUOTA_SIMPLES.AsFloat > 0 then
  begin
    ValorCredito := CalculaCredito;
    if ValorCredito > 0 then
    begin
      if not(Dados.qryEmpresaALIQUOTA_SIMPLES.AsFloat > 0) then
        raise exception.Create
          ('Informe a aliquota do simples no cadastro de empresa!');

      ObsCredito := 'PERMITE O APROVEITAMENTO DE CRÉDITO NO VALOR DE ' +
        FormatFloat(' R$ ,0.00',
        ((ValorCredito * Dados.qryEmpresaALIQUOTA_SIMPLES.AsFloat) / 100)) +
        ' CORRESPONDENTE A ALÍQUOTA DE ' + FormatFloat('0.00%',
        Dados.qryEmpresaALIQUOTA_SIMPLES.AsFloat) +
        ' NOS TERMOS DO ARTIGO 23 DA LC 123';
    end;
  end;
  NotaF.NFe.InfAdic.infCpl := ObsCredito +
    ' Fonte IBPT - Valor Aprox.Tributos R$' + FormatFloat(',0.00',
    qryVendaTRIB_MUN.AsFloat + qryVendaTRIB_EST.AsFloat +
    qryVendaTRIB_FED.AsFloat + qryVendaTRIB_IMP.AsFloat) + sLineBreak +
    qryVendaOBSCONTRIBUINTE.Value + sLineBreak + NotaPlaca;
  NotaF.NFe.InfAdic.infAdFisco := qryVendaOBSFISCO.Value;
  NotaF.NFe.exporta.UFembarq := '';
  NotaF.NFe.exporta.xLocEmbarq := '';
  NotaF.NFe.compra.xNEmp := '';
  NotaF.NFe.compra.xPed := qryVendaNPEDIDO.Value;
  NotaF.NFe.compra.xCont := '';
end;

procedure TfrmCadNFe.Nota_Responsavel;
begin
  // responsavel tecnico 22-03-2019
  if Dados.qryEmpresaRESPONSAVEL_TECNICO.Value = 'S' then
  begin
    Dados.qryRespTecnico.Close;
    Dados.qryRespTecnico.Open;
    NotaF.NFe.infRespTec.CNPJ := TiraPontos(Dados.qryParametroCNPJ.Value);
    NotaF.NFe.infRespTec.xContato := Dados.qryParametroCONTATO.Value;
    NotaF.NFe.infRespTec.email := Dados.qryParametroEMAIL_SUPORTE.Value;
    NotaF.NFe.infRespTec.fone := TiraPontos(Dados.qryParametroFONE1.Value);
    NotaF.NFe.infRespTec.hashCSRT := '';
  end;
end;

procedure TfrmCadNFe.Nota_Duplicta;
var
  idParcela: Integer;
begin
  if (qryVendaINDPAG.Value = 1) or (qryVendaINDPAG.Value = 2) then
  begin
    qryCR.First;
    if not qryCR.IsEmpty then
    begin
      NotaF.NFe.Cobr.Fat.nFat := qryVendaNUMERO.AsString;
      NotaF.NFe.Cobr.Fat.vOrig := qryVendaTOTAL.AsFloat;
      NotaF.NFe.Cobr.Fat.vDesc := 0;
      NotaF.NFe.Cobr.Fat.vLiq := qryVendaTOTAL.AsFloat;
      qryCR.First;
      idParcela := 1;
      while not qryCR.Eof do
      begin
        Duplicata := NotaF.NFe.Cobr.Dup.Add;
        Duplicata.nDup := FormatFloat('000', idParcela);
        Duplicata.dVenc := qryCRDTVENCIMENTO.Value;
        Duplicata.vDup := qryCRVALOR.AsFloat;
        qryCR.Next;
        idParcela := idParcela + 1;
      end;
      qryCR.Refresh;
    end;
  end;
end;

procedure TfrmCadNFe.Nota_Pagamento;
begin
  if qryVendaFINALIDADE.Value <> '3' then
  begin
    Pagamento := NotaF.NFe.pag.Add;
    Pagamento.indPag := TpcnIndicadorPagamento(qryVendaINDPAG.Value);
    Pagamento.tPag := TpcnFormaPagamento(qryVendaTPPAG.Value);
    case qryVendaTPPAG.Value of
      2 .. 3:
        begin
          Pagamento.tpIntegra := TtpIntegra(qryVendaTPINTEGRA.Value);
          Pagamento.CNPJ := qryVendaCNPJ_CARTAO.Value;
          Pagamento.tBand := TpcnBandeiraCartao(qryVendaTPBANDEIRA.Value);
          Pagamento.cAut := qryVendaNUMERO_AUTORIZACAO.Value;
        end;
    end;
  end
  else
  begin
    Pagamento := NotaF.NFe.pag.Add;
    Pagamento.tPag := fpSemPagamento;
    Pagamento.vPag := 0;
  end;
end;

procedure TfrmCadNFe.Nota_Volume;
begin
  Volume := NotaF.NFe.Transp.Vol.Add;
  Volume.qVol := qryVendaQVOL.Value;
  Volume.esp := qryVendaESPECIE.Value;
  Volume.marca := qryVendaMARCA.Value;
  Volume.nVol := qryVendaNUMERACAO.Value;
  Volume.pesoL := qryVendaPESOL.AsFloat;
  Volume.pesoB := qryVendaPESOB.AsFloat;
end;

procedure TfrmCadNFe.Nota_Bahia;
begin
  if Dados.qryConfigUF.Value = 'BA' then
    NotaF.NFe.autXML.Add.CNPJCPF := '13937073000156';
end;

procedure TfrmCadNFe.Nota_Transportadora;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'select * from TRANSPORTADORA where codigo=:cod';
  Dados.qryconsulta.Params[0].Value := qryVendaID_TRANSPORTADOR.Value;
  Dados.qryconsulta.Open;
  NotaF.NFe.Transp.modFrete := TpcnModalidadeFrete
    (qryVendaTIPO_FRETE.AsInteger);
  if (qryVendaID_TRANSPORTADOR.AsFloat <> Dados.qryConfigTRANSPORTADOR_PADRAO.
    AsFloat) and (qryVendaTIPO_FRETE.Value <> '5') then
  begin
    try
      NotaF.NFe.Transp.Transporta.CNPJCPF := Dados.qryconsulta.FieldByName
        ('CNPJ').Value;
      NotaF.NFe.Transp.Transporta.xNome := Dados.qryconsulta.FieldByName
        ('NOME').Value;
      if Dados.qryconsulta.FieldByName('PESSOA').AsString <> 'FÍSICA' then
      begin
        if Dados.qryconsulta.FieldByName('IE').IsNull then
          NotaF.NFe.Transp.Transporta.IE := ''
        else
          NotaF.NFe.Transp.Transporta.IE := Dados.qryconsulta.FieldByName
            ('IE').AsString;
      end;
      NotaF.NFe.Transp.Transporta.xEnder := Dados.qryconsulta.FieldByName
        ('ENDERECO').AsString;
      NotaF.NFe.Transp.Transporta.xMun := Dados.qryconsulta.FieldByName
        ('CIDADE').Value;
      NotaF.NFe.Transp.Transporta.UF := Dados.qryconsulta.FieldByName
        ('UF').Value;
    except
      raise exception.Create('Erro no cadastro de transportador');
    end;
  end;
end;

procedure TfrmCadNFe.Nota_Total_Partilha;
begin
  // partilha do icms e fundo de probreza
  if qryVendaVFCPUFDEST.AsFloat > 0 then
  begin
    NotaF.NFe.Total.ICMSTot.vFCPUFDest := qryVendaVFCPUFDEST.AsFloat;
    NotaF.NFe.Total.ICMSTot.vICMSUFDest := qryVendaVICMSUFDEST.AsFloat;
    NotaF.NFe.Total.ICMSTot.vICMSUFRemet := qryVendaVICMSUFREMET.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nots_Total_Lei_Transparencia;
begin
  // lei da transparencia de impostos
  NotaF.NFe.Total.ICMSTot.vTotTrib := 0;
  if qryVendaFINALIDADE.Value <> '3' then
  begin
    NotaF.NFe.Total.ICMSTot.vTotTrib := qryVendaTRIB_MUN.AsFloat +
      qryVendaTRIB_EST.AsFloat + qryVendaTRIB_FED.AsFloat +
      qryVendaTRIB_IMP.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_total;
begin
  NotaF.NFe.Total.ICMSTot.vBC := qryVendaBASEICMS.AsFloat;
  NotaF.NFe.Total.ICMSTot.vICMS := qryVendaTOTALICMS.AsFloat;
  NotaF.NFe.Total.ICMSTot.vBCST := qryVendaBASE_ICMS_ST.AsFloat;
  NotaF.NFe.Total.ICMSTot.vST := qryVendaVALOR_ICMS_ST.AsFloat;
  NotaF.NFe.Total.ICMSTot.vProd := qryVendaSUBTOTAL.AsFloat;
  NotaF.NFe.Total.ICMSTot.vFrete := qryVendaFRETE.AsFloat;
  NotaF.NFe.Total.ICMSTot.vSeg := qryVendaSEGURO.AsFloat;
  NotaF.NFe.Total.ICMSTot.vDesc := qryVendaDESCONTO.AsFloat;
  NotaF.NFe.Total.ICMSTot.vICMSDeson := qryVendaTOTAL_DESONERACAO.AsFloat;
  NotaF.NFe.Total.ICMSTot.vII := 0;
  NotaF.NFe.Total.ICMSTot.vIPI := qryVendaTOTAL_IPI.AsFloat;
  NotaF.NFe.Total.ICMSTot.vPIS := qryVendaTOTALICMSPIS.AsFloat;
  NotaF.NFe.Total.ICMSTot.vCOFINS := qryVendaTOTALICMSCOFINS.AsFloat;
  NotaF.NFe.Total.ICMSTot.vOutro := qryVendaOUTROS.AsFloat;
  NotaF.NFe.Total.ICMSTot.vNF := qryVendaTOTAL.AsFloat;
end;

procedure TfrmCadNFe.Nota_Produto_Complementar;
begin
  if trim(qryItemDESCRICAO_COMPLEMENTAR.AsString) <> '' then
    Produto.infAdProd := qryItemDESCRICAO_COMPLEMENTAR.Value;
end;

procedure TfrmCadNFe.Nota_Produto_Cofins;
begin
  with Produto.Imposto.COFINS do
  begin
    if qryItemCST_COFINS.Value = '01' then
      CST := cof01;
    if qryItemCST_COFINS.Value = '02' then
      CST := cof02;
    if qryItemCST_COFINS.Value = '03' then
      CST := cof03;
    if qryItemCST_COFINS.Value = '04' then
      CST := cof04;
    if qryItemCST_COFINS.Value = '05' then
      CST := cof05;
    if qryItemCST_COFINS.Value = '06' then
      CST := cof06;
    if qryItemCST_COFINS.Value = '07' then
      CST := cof07;
    if qryItemCST_COFINS.Value = '08' then
      CST := cof08;
    if qryItemCST_COFINS.Value = '09' then
      CST := cof09;
    if qryItemCST_COFINS.Value = '49' then
      CST := cof49;
    if qryItemCST_COFINS.Value = '99' then
      CST := cof99;
    vBC := qryItemBASE_COFINS_ICMS.AsFloat;
    pCOFINS := qryItemALIQ_COFINS_ICMS.AsFloat;
    vCOFINS := qryItemVALOR_COFINS_ICMS.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_produto_Pis;
begin
  with Produto.Imposto.PIS do
  begin
    if qryItemCST_PIS.Value = '01' then
      CST := pis01;
    if qryItemCST_PIS.Value = '02' then
      CST := pis02;
    if qryItemCST_PIS.Value = '03' then
      CST := pis03;
    if qryItemCST_PIS.Value = '04' then
      CST := pis04;
    if qryItemCST_PIS.Value = '05' then
      CST := pis05;
    if qryItemCST_PIS.Value = '06' then
      CST := pis06;
    if qryItemCST_PIS.Value = '07' then
      CST := pis07;
    if qryItemCST_PIS.Value = '08' then
      CST := pis08;
    if qryItemCST_PIS.Value = '09' then
      CST := pis09;
    if qryItemCST_PIS.Value = '49' then
      CST := pis49;
    if qryItemCST_PIS.Value = '99' then
      CST := pis99;
    vBC := qryItemBASE_PIS_ICMS.AsFloat;
    pPIS := qryItemALIQ_PIS_ICMS.AsFloat;
    vPIS := qryItemVALOR_PIS_ICMS.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_produto_IPI;
begin
  with Produto.Imposto.IPI do
  begin
    if (qryVendaFINALIDADE.Value = '3') and (qryVendaMOVIMENTO.Value = 'S') then
    begin
      if not qryItemCOD_ENQ_IPI.IsNull then
        cEnq := qryItemCOD_ENQ_IPI.AsString;
    end
    else
    begin
      if not qryProdutoCOD_ENQ_IPI.IsNull then
        cEnq := qryProdutoCOD_ENQ_IPI.AsString;
    end;
    clEnq := '999';
    CNPJProd := '';
    cSelo := '';
    qSelo := 0;
    vBC := 0;
    qUnid := 0;
    vUnid := 0;
    pIPI := 0;
    vIPI := 0;
    vBC := qryItemBASE_IPI.AsFloat;
    qUnid := qryItemQTD.AsFloat;
    vUnid := qryItemPRECO.AsFloat;
    pIPI := qryItemALIQ_IPI.AsFloat;
    vIPI := qryItemVALOR_IPI.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_CST_IPI;
begin
  with Produto.Imposto.IPI do
  begin
    if qryItemCST_IPI.Value = '00' then
      CST := ipi00;
    if qryItemCST_IPI.Value = '01' then
      CST := ipi01;
    if qryItemCST_IPI.Value = '02' then
      CST := ipi02;
    if qryItemCST_IPI.Value = '03' then
      CST := ipi03;
    if qryItemCST_IPI.Value = '04' then
      CST := ipi04;
    if qryItemCST_IPI.Value = '05' then
      CST := ipi05;
    if qryItemCST_IPI.Value = '49' then
      CST := ipi49;
    if qryItemCST_IPI.Value = '50' then
      CST := ipi50;
    if qryItemCST_IPI.Value = '51' then
      CST := ipi51;
    if qryItemCST_IPI.Value = '52' then
      CST := ipi52;
    if qryItemCST_IPI.Value = '53' then
      CST := ipi53;
    if qryItemCST_IPI.Value = '54' then
      CST := ipi54;
    if qryItemCST_IPI.Value = '55' then
      CST := ipi55;
    if qryItemCST_IPI.Value = '99' then
      CST := ipi99;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_Icms_Partilha;
begin
  if qryVendaCONSUMIDOR_FINAL.Value = 'S' then // consumidor final
  begin
    if (Pos('102', qryItemCSOSN.Value) <> 0) or
      (Pos('103', qryItemCSOSN.Value) <> 0) or
      (Pos('400', qryItemCSOSN.Value) <> 0) or
      (Pos('500', qryItemCSOSN.Value) <> 0) or
      (Pos('00', qryItemCST.Value) <> 0) or (Pos('20', qryItemCST.Value) <> 0)
      or (Pos('40', qryItemCST.Value) <> 0) or
      (Pos('41', qryItemCST.Value) <> 0) or (Pos('60', qryItemCST.Value) <> 0)
    then
    begin
      if qryItemVBCUFDEST.AsFloat > 0 then
      begin
        Produto.Imposto.ICMSUFDest.vBCUFDest := qryItemVBCUFDEST.AsFloat;
        Produto.Imposto.ICMSUFDest.vBCFCPUFDest := qryItemVBCUFDEST.AsFloat;
        Produto.Imposto.ICMSUFDest.pFCPUFDest := qryItemVFCP.AsFloat;
        Produto.Imposto.ICMSUFDest.pICMSUFDest := qryItemPICMSUFDEST.AsFloat;
        Produto.Imposto.ICMSUFDest.pICMSInter := qryItemPICMSINTER.AsFloat;
        Produto.Imposto.ICMSUFDest.pICMSInterPart :=
          qryItemPICMSINTERPART.AsFloat;
        Produto.Imposto.ICMSUFDest.vFCPUFDest := qryItemVFCPUFDEST.AsFloat;
        Produto.Imposto.ICMSUFDest.vICMSUFDest := qryItemVICMSUFDEST.AsFloat;
        Produto.Imposto.ICMSUFDest.vICMSUFRemet := qryItemVICMSUFREMET.AsFloat;
      end;
    end;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_ICMS_ST;
begin
  if (Pos('10', qryItemCST.Value) <> 0) or (Pos('30', qryItemCST.Value) <> 0) or
    (Pos('70', qryItemCST.Value) <> 0) or (Pos('90', qryItemCST.Value) <> 0) or
    (Pos('201', qryItemCSOSN.Value) <> 0) or
    (Pos('202', qryItemCSOSN.Value) <> 0) or
    (Pos('900', qryItemCSOSN.Value) <> 0) then
  begin
    Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
    Produto.Imposto.ICMS.pMVAST := qryItemVIRTUAL_MVA.AsFloat;
    Produto.Imposto.ICMS.pRedBCST := 0;
    Produto.Imposto.ICMS.vBCST := qryItemBASE_ICMS_ST.AsFloat;
    Produto.Imposto.ICMS.pICMSST :=
      Dados.BuscaIcms('', qryVendaVIRTUAL_UF_CLIENTE.AsString,
      qryVendaVIRTUAL_UF_CLIENTE.AsString);
    Produto.Imposto.ICMS.vICMSST := qryItemVALOR_ICMS_ST.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_Icms_diferido;
begin
  // Valor do ICMS Diferido no CST=51 difere do produto Valor ICMS Operação e percentual diferimento
  if Pos('51', qryItemCST.Value) <> 0 then
  begin
    Produto.Imposto.ICMS.pDif := qryItemPICMSDEFERIDO.AsFloat;
    Produto.Imposto.ICMS.vICMSDif := qryItemVICMSDEFERIDO.AsFloat;
    Produto.Imposto.ICMS.pRedBC := 0;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_Icms_Retido;
begin

  // Produto tributado pelo ICMS 60 ou CSOSN 500,  para operações que não sejam para consumidor final (tag: indFinal=0, Normal)

  if qryVendaFINALIDADE.Value <> '3' then // não é devolução
  begin
    if (Pos('500', qryItemCSOSN.Value) <> 0) or
      (Pos('60', qryItemCST.Value) <> 0) then
    begin
      Produto.Imposto.ICMS.vBCSTRet := qryItemVBCSTRET.AsFloat;
      Produto.Imposto.ICMS.vICMSSTRet := qryItemVICMSSTRET.AsFloat;
      Produto.Imposto.ICMS.vBCSTDest := qryItemVBCSTDEST.AsFloat;
      Produto.Imposto.ICMS.vICMSSTDest := qryItemVICMSSTDEST.AsFloat;
    end;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_ICMS;
begin
  if qryItemALIQ_ICMS.Value > 0 then
  begin
    Produto.Imposto.ICMS.modBC := dbiValorOperacao;
    Produto.Imposto.ICMS.vBC := qryItemBASE_ICMS.AsFloat;
    Produto.Imposto.ICMS.pICMS := qryItemALIQ_ICMS.AsFloat;
    Produto.Imposto.ICMS.vICMS := qryItemVALOR_ICMS.AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_CST;
begin
  if (qryVendaFINALIDADE.Value = '3') and (qryVendaMOVIMENTO.Value = 'S') then
  begin
    if qryItemALIQ_ICMS.Value > 0 then
      CSTRegimeNormal
    else
      CSTRegimeSimples;
  end
  else
  begin
    if Dados.qryEmpresaCRT.Value = 1 then
      CSTRegimeSimples
    else
      CSTRegimeNormal;
  end;
  CSTOrigem;
end;

procedure TfrmCadNFe.Nota_Produto_Desoneracao;
begin
  if qryItemVICMSDESON.AsFloat > 0 then
  begin
    Produto.Imposto.ICMS.vICMSDeson := qryItemVICMSDESON.AsFloat;
    // deseoneração
    Produto.Imposto.ICMS.motDesICMS := TpcnMotivoDesoneracaoICMS
      (qryItemMOTDESICMS.Value);
  end;
end;

procedure TfrmCadNFe.Nota_Produto_Zera_Impostos;
begin
  Produto.Imposto.ICMS.modBC := dbiValorOperacao;
  Produto.Imposto.ICMS.vBC := 0;
  Produto.Imposto.ICMS.pICMS := 0;

  Produto.Imposto.ICMS.vBC := 0;
  Produto.Imposto.ICMS.pICMS := 0;
  Produto.Imposto.ICMS.vICMS := 0;
  Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
  Produto.Imposto.ICMS.pMVAST := 0;
  Produto.Imposto.ICMS.pRedBCST := 0;
  Produto.Imposto.ICMS.vBCST := 0;
  Produto.Imposto.ICMS.pICMSST := 0;
  Produto.Imposto.ICMS.vICMSST := 0;
  Produto.Imposto.ICMS.pRedBC := 0;
  Produto.Imposto.ICMS.vBCSTRet := 0;
  Produto.Imposto.ICMS.vICMSSTRet := 0;
  Produto.Imposto.ICMS.pST := 0;
  Produto.Imposto.ICMS.vICMSSubstituto := 0;
end;

procedure TfrmCadNFe.Nota_Produto_Lei_Transparencia;
begin
  Produto.Imposto.vTotTrib := qryItemTRIB_IMP.AsFloat + qryItemTRIB_MUN.AsFloat
    + qryItemTRIB_EST.AsFloat + qryItemTRIB_FED.AsFloat;
end;

procedure TfrmCadNFe.Nota_Produto_Combustiveis;
begin
  // combustivel
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'SELECT ORIGEM, COMBUSTIVEL, ANP, GLP,GNN, GNI, PESO_LIQ, DESCRICAO FROM PRODUTO WHERE CODIGO=:ID';
  Dados.qryconsulta.Params[0].Value := qryItemID_PRODUTO.Value;
  Dados.qryconsulta.Open;
  if Dados.qryconsulta.FieldByName('combustivel').AsString = 'S' then
  begin
    Produto.Prod.comb.cProdANP := Dados.qryconsulta.FieldByName('ANP')
      .AsInteger;
    Produto.Prod.comb.descANP := Dados.qryconsulta.FieldByName
      ('DESCRICAO').AsString;
    Produto.Prod.comb.UFcons := NotaF.NFe.Dest.EnderDest.UF;
    Produto.Prod.comb.pGLP := Dados.qryconsulta.FieldByName('GLP').AsFloat;
    Produto.Prod.comb.pGNn := Dados.qryconsulta.FieldByName('GNN').AsFloat;
    Produto.Prod.comb.pGNi := Dados.qryconsulta.FieldByName('GNI').AsFloat;
    Produto.Prod.comb.vPart := Dados.qryconsulta.FieldByName
      ('PESO_LIQ').AsFloat;
  end;
end;

procedure TfrmCadNFe.Nota_Produto_Adicionais;
var
  FAliqDeson: extended;
begin

  qryProduto.Close;
  qryProduto.Params[0].Value := qryItemID_PRODUTO.Value;
  qryProduto.Open;

  Produto.Prod.CEST := qryProdutoCEST.Value;
  Produto.Prod.cBenef := qryProdutoCOD_BENEFICIO.Value;
  Produto.Imposto.ICMS.motDesICMS := TpcnMotivoDesoneracaoICMS
    (qryProdutoMOTIVO_DESONERACAO.AsInteger);

  Produto.infAdProd := '';
end;

procedure TfrmCadNFe.Nota_Produto;
begin
  // Número sequencial, para cada item deve ser incrementado
  Produto.Prod.nItem := qryItemITEM.Value;
  Produto.Prod.xPed := qryVendaNPEDIDO.Value;
  Produto.Prod.cProd := qryItemID_PRODUTO.AsString;
  Produto.Prod.cEAN := 'SEM GTIN';
  if Dados.qryEmpresaINFORMAR_GTIN.Value = 'S' then
  begin
    if (qryItemCOD_BARRA.Value <> 'SEM GTIN') and
      (qryItemCOD_BARRA.Value <> '777') and (trim(qryItemCOD_BARRA.Value) <> '')
    then
      Produto.Prod.cEAN := qryItemCOD_BARRA.Value;
  end;
  Produto.Prod.xProd := qryItemVIRTUAL_PRODUTO.Value;
  Produto.Prod.NCM := qryItemNCM.Value;
  // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
  Produto.Prod.EXTIPI := '';
  Produto.Prod.cfop := qryItemCFOP.Value;
  Produto.Prod.uCom := qryItemUNIDADE.Value;
  Produto.Prod.qCom := qryItemQTD.AsFloat;
  Produto.Prod.vUnCom := qryItemPRECO.AsFloat;
  Produto.Prod.vProd := qryItemTOTAL.AsFloat;
  Produto.Prod.nItemPed := qryItemNPEDIDO.AsString;
  Produto.Prod.cEANTrib := 'SEM GTIN';
  if Dados.qryEmpresaINFORMAR_GTIN.Value = 'S' then
  begin
    if (qryItemCOD_BARRA.Value <> 'SEM GTIN') and
      (qryItemCOD_BARRA.Value <> '777') and (trim(qryItemCOD_BARRA.Value) <> '')
    then
      Produto.Prod.cEANTrib := qryItemCOD_BARRA.Value;
  end;
  Produto.Prod.uTrib := qryItemUNIDADE.Value;
  Produto.Prod.qTrib := qryItemQTD.AsFloat;
  Produto.Prod.vUnTrib := qryItemPRECO.AsFloat;
  Produto.Prod.vOutro := qryItemOUTROS.AsFloat;
  Produto.Prod.vFrete := qryItemFRETE.AsFloat;
  Produto.Prod.vSeg := qryItemSEGURO.AsFloat;
  Produto.Prod.vDesc := qryItemDESCONTO.AsFloat;
end;

procedure TfrmCadNFe.Nota_Destinatario;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text := 'select * from pessoa where codigo=:cod';
  Dados.qryconsulta.Params[0].Value := qryVendaID_CLIENTE.Value;
  Dados.qryconsulta.Open;
  try
    NotaF.NFe.Dest.CNPJCPF :=
      TiraPontos(Dados.qryconsulta.FieldByName('CNPJ').Value);
    NotaF.NFe.Dest.ISUF := '';
    NotaF.NFe.Dest.xNome := Dados.qryconsulta.FieldByName('RAZAO').Value;
    case StrToIntDef(Dados.qryconsulta.FieldByName('ISENTO').Value, 3) of
      0:
        begin
          NotaF.NFe.Dest.indIEDest := inContribuinte;
          NotaF.NFe.Dest.IE :=
            TiraPontos(Dados.qryconsulta.FieldByName('IE').Value);
        end;
      1:
        begin
          NotaF.NFe.Dest.indIEDest := inIsento;
          NotaF.NFe.Dest.IE :=
            TiraPontos(Dados.qryconsulta.FieldByName('IE').Value);
        end;
      2:
        begin
          NotaF.NFe.Dest.indIEDest := inNaoContribuinte;
          NotaF.NFe.Dest.IE := '';
        end;
      3:
        raise exception.Create
          ('Informe o Tipo de Contribuinte no cadastro de pessoas!');
    end;
    if trim(TiraPontos(Dados.qryconsulta.FieldByName('FONE1').AsString)) <> ''
    then
      NotaF.NFe.Dest.EnderDest.fone :=
        TiraPontos(Dados.qryconsulta.FieldByName('FONE1').AsString)
    else if trim(TiraPontos(Dados.qryconsulta.FieldByName('FONE2').AsString)) <> ''
    then
      NotaF.NFe.Dest.EnderDest.fone :=
        TiraPontos(Dados.qryconsulta.FieldByName('CELULAR1').AsString)
    else if trim(TiraPontos(Dados.qryconsulta.FieldByName('CELULAR1').AsString))
      <> '' then
      NotaF.NFe.Dest.EnderDest.fone :=
        TiraPontos(Dados.qryconsulta.FieldByName('CELULAR2').AsString)
    else
      NotaF.NFe.Dest.EnderDest.fone :=
        TiraPontos(Dados.qryconsulta.FieldByName('CELULAR2').AsString);

    NotaF.NFe.Dest.EnderDest.CEP :=
      StrToInt(TiraPontos(Dados.qryconsulta.FieldByName('CEP').AsString));
    NotaF.NFe.Dest.EnderDest.xLgr := Dados.qryconsulta.FieldByName
      ('ENDERECO').Value;
    NotaF.NFe.Dest.EnderDest.nro := Dados.qryconsulta.FieldByName
      ('NUMERO').Value;
    NotaF.NFe.Dest.EnderDest.xCpl := '';
    NotaF.NFe.Dest.EnderDest.xBairro := Dados.qryconsulta.FieldByName
      ('BAIRRO').Value;
    NotaF.NFe.Dest.EnderDest.cMun := Dados.qryconsulta.FieldByName
      ('CODMUN').Value;
    NotaF.NFe.Dest.EnderDest.xMun := Dados.qryconsulta.FieldByName
      ('MUNICIPIO').Value;
    NotaF.NFe.Dest.EnderDest.UF := Dados.qryconsulta.FieldByName('UF').Value;
    NotaF.NFe.Dest.EnderDest.cPais := 1058;
    NotaF.NFe.Dest.EnderDest.xPais := 'BRASIL';
  except
    raise exception.Create('Erro no cadastro de destinatário!');
  end;
end;

procedure TfrmCadNFe.Nota_Emitente;
begin
  try
    if TiraPontos(Dados.qryEmpresaCNPJ.AsString) = '03904057000103' then
      NotaF.NFe.Emit.CNPJCPF := '0390405700010'
    else
      NotaF.NFe.Emit.CNPJCPF := TiraPontos(Dados.qryEmpresaCNPJ.AsString);
    NotaF.NFe.Emit.IE := TiraPontos(Dados.qryEmpresaIE.AsString);
    NotaF.NFe.Emit.xNome := Dados.qryEmpresaRAZAO.AsString;
    NotaF.NFe.Emit.xFant := Dados.qryEmpresaFANTASIA.AsString;
    NotaF.NFe.Emit.EnderEmit.fone := Dados.qryEmpresaFONE.AsString;
    NotaF.NFe.Emit.EnderEmit.CEP :=
      StrToInt(TiraPontos(Dados.qryEmpresaCEP.AsString));
    NotaF.NFe.Emit.EnderEmit.xLgr := Dados.qryEmpresaENDERECO.AsString;
    NotaF.NFe.Emit.EnderEmit.nro := Dados.qryEmpresaNUMERO.AsString;
    NotaF.NFe.Emit.EnderEmit.xCpl := Dados.qryEmpresaCOMPLEMENTO.AsString;
    NotaF.NFe.Emit.EnderEmit.xBairro := Dados.qryEmpresaBAIRRO.AsString;
    NotaF.NFe.Emit.EnderEmit.cMun := Dados.qryEmpresaID_CIDADE.AsInteger;
    NotaF.NFe.Emit.EnderEmit.xMun := Dados.qryEmpresaCIDADE.AsString;
    NotaF.NFe.Emit.EnderEmit.UF := Dados.qryEmpresaUF.AsString;
    NotaF.NFe.Emit.EnderEmit.cPais := 1058;
    NotaF.NFe.Emit.EnderEmit.xPais := 'BRASIL';
    NotaF.NFe.Emit.IEST := '';
    NotaF.NFe.Emit.IM := Dados.qryEmpresaIM.AsString;
    NotaF.NFe.Emit.CNAE := TiraPontos(Dados.qryEmpresaCNAE.AsString);
    if (qryVendaFINALIDADE.Value = '3') and (qryVendaMOVIMENTO.Value = 'S') then
    begin
      if qryVendaBASEICMS.AsFloat > 0 then
        NotaF.NFe.Emit.CRT := crtRegimeNormal
      else
        NotaF.NFe.Emit.CRT := crtSimplesNacional;
    end
    else
    begin
      case Dados.qryEmpresaCRT.Value of
        1:
          NotaF.NFe.Emit.CRT := crtSimplesNacional;
        2:
          NotaF.NFe.Emit.CRT := crtSimplesExcessoReceita;
        3:
          NotaF.NFe.Emit.CRT := crtRegimeNormal;
      end;
    end;
  except
    raise exception.Create('Erro no cadastro do emitente!');
  end;
end;

procedure TfrmCadNFe.Nota_Ide(NumNFe: string);
begin
  try
    // Caso não seja preenchido será gerado um número aleatório pelo componente
    NotaF.NFe.Ide.natOp := copy(qryVendaVIRTUAL_CFOP.Value, 1, 30);
    NotaF.NFe.Ide.indFinal := cfNao;
    if qryVendaCONSUMIDOR_FINAL.AsString = 'S' then
      NotaF.NFe.Ide.indFinal := cfConsumidorFinal;
    NotaF.NFe.Ide.indPres := pcOutros;
    NotaF.NFe.Ide.modelo := 55;
    NotaF.NFe.Ide.serie := qryVendaSERIE.AsInteger;
    NotaF.NFe.Ide.nNF := StrToInt(NumNFe);
    NotaF.NFe.Ide.cNF := qryVendaCNF.AsInteger;
    NotaF.NFe.Ide.dEmi := qryVendaDATA_EMISSAO.Value;
    NotaF.NFe.Ide.dSaiEnt := qryVendaDATA_SAIDA.Value + Time;
    NotaF.NFe.Ide.hSaiEnt := Now;
    NotaF.NFe.Ide.tpNF := tnEntrada;
    if qryVendaMOVIMENTO.Value = 'S' then
      NotaF.NFe.Ide.tpNF := tnSaida;
    NotaF.NFe.Ide.tpEmis := TpcnTipoEmissao(Dados.qryConfigFORMAEMISSAO.Value);
    NotaF.NFe.Ide.tpAmb := taHomologacao;
    if Dados.qryConfigAMBIENTE.Value = 0 then
      NotaF.NFe.Ide.tpAmb := taProducao;
    NotaF.NFe.Ide.verProc := '1.0';
    // Versão do seu sistema
    NotaF.NFe.Ide.cUF := Dados.qryEmpresaID_UF.Value;
    NotaF.NFe.Ide.cMunFG := Dados.qryEmpresaID_CIDADE.Value;
    NotaF.NFe.Ide.idDest := doInterna;
    qryClientes.Locate('codigo', qryVendaID_CLIENTE.Value, []);
    if (qryClientesUF.Value <> Dados.qryEmpresaUF.Value) then
      NotaF.NFe.Ide.idDest := doInterestadual;
    NotaF.NFe.Ide.finNFe := TpcnFinalidadeNFe(qryVendaFINALIDADE.AsInteger);
    if Dados.qryConfigFORMAEMISSAO.Value <> 0 then
    begin
      NotaF.NFe.Ide.dhCont := date;
      NotaF.NFe.Ide.xJust := qryVendaMOTIVO_CONTIGENCIA.Value;
    end;
    if (qryVendaCFOP.Value = 5929) or (qryVendaCFOP.Value = 6929) then
    begin
      qryReferencia.First;
      while not qryReferencia.Eof do
      begin
        with NotaF.NFe.Ide.NFref.Add do
          refNFe := qryReferenciaREFERENCIA.Value;
        qryReferencia.Next;
      end;
    end
    else
    begin
      if (qryVendaFINALIDADE.Value = '1') then
      begin
        // nota complementar
        qryReferencia.First;
        while not qryReferencia.Eof do
        begin
          Referenciada := NotaF.NFe.Ide.NFref.Add;
          Referenciada.refNFe := qryReferenciaREFERENCIA.Value;
          qryReferencia.Next;
        end;
      end;
      if (qryVendaFINALIDADE.Value = '3') then
      // devolução
      begin
        qryReferencia.First;
        while not qryReferencia.Eof do
        begin
          with NotaF.NFe.Ide.NFref.Add do
          begin
            refNFe := qryReferenciaREFERENCIA.Value;
          end;
          qryReferencia.Next;
        end;
      end;
    end;
    if Assigned(DmNFe.ACBrNFe.DANFE) then
      NotaF.NFe.Ide.tpImp := DmNFe.ACBrNFe.DANFE.TipoDANFE;
  except
    raise exception.Create('Erro na configuração da nota!');
  end;
end;

function TfrmCadNFe.NotaPlaca: String;
begin
  result := '';
  if length(qryVendaPLACA.Value) >= 7 then
    result := ' Placa Veículo:' + qryVendaPLACA.Value + '-' +
      qryVendaUFPLACA.Value;
end;

procedure TfrmCadNFe.InsereCaixa;
begin
  qryCaixa.Insert;
  qryCaixaEMISSAO.Value := date;
  qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryCaixaEMISSAO.Value := date;
  qryCaixaDOC.Value := qryVendaNUMERO.AsString;
  qryCaixaTIPO_MOVIMENTO.Value := 'CC';
  qryCaixaHISTORICO.Value := 'NFe Nº ' + qryVendaNUMERO.AsString + ' ' +
    qryVendaVIRTUAL_CLIENTE.AsString;
  qryCaixaENTRADA.AsFloat := qryVendaDINHEIRO.AsFloat;
  qryCaixaSAIDA.Value := 0;
  qryCaixaHORA_EMISSAO.Value := Time;
  qryCaixaID_USUARIO.Value := Dados.idUsuario;
  qryCaixaFKPLANO.Value := Dados.qryEmpresaID_PLANO_VENDA.Value;
  qryCaixaFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryCaixaFK_CARTAO.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryCaixaFPG.Value := Dados.qryEmpresaCOD_FPG_DINHEIRO.Value;
  qryCaixaECARTAO.Value := 'C';
  qryCaixaFK_NFE.Value := qryVendaCODIGO.Value;
  qryCaixaTRANSFERENCIA.Value := 0;
  qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  qryCaixa.Post;
end;

procedure TfrmCadNFe.BtnGerarClick(Sender: TObject);
var
  i: Integer;
  vDif, vSoma: Real;
begin

  if qryVendaSUBTOTAL.AsFloat = 0 then
    raise exception.Create('Informe o valor da nota!');

  if not qryCaixa.IsEmpty then
  begin
    raise exception.Create('Já existe lançamento no caixa!');
  end;

  if ExisteRecebimento(qryVendaFKVENDA.AsInteger) then
  begin
    raise exception.Create('Operação não permitida!' + sLineBreak +
      'Conta gerada pela Venda nº' + qryVendaFKVENDA.AsString);
  end;

  if qryVendaINDPAG.Value = 0 then
    raise exception.Create
      ('Forma de pagamento selecionada não permite gerar parcelas!');

  if Application.messagebox('Deseja Gerar Parcelas?', 'Confirmação', mb_yesno)
    <> mrYes then
    exit;

  try

    if StrToInt(edtParcela.Text) = 0 then
    begin
      ShowMessage('Digite o numero de parcelas ');
      exit;
    end;

    ExcluiCR;
    ApagaCaixa(0);

    BtnGerar.Enabled := false;
    vSoma := 0;
    for i := 1 to StrToInt(edtParcela.Text) do
    begin
      qryCR.Insert;
      qryCR.FieldByName('CODIGO').Value := Dados.Numerador('CRECEBER', 'CODIGO',
        'N', '', '');
      qryCR.FieldByName('DATA').Value := date;
      qryCR.FieldByName('FKCLIENTE').Value := qryVenda.FieldByName('ID_CLIENTE')
        .AsInteger;
      qryCR.FieldByName('DOC').Value := qryVenda.FieldByName('NUMERO').AsString
        + '/' + FormatFloat('000', i);
      qryCR.FieldByName('VALOR').AsString :=
        FormatFloat('0.00', SimpleRoundTo(qryVenda.FieldByName('TOTAL').AsFloat
        / StrToInt(edtParcela.Text), -2));
      qryCR.FieldByName('DTVENCIMENTO').Value := date +
        (i * Dados.BuscaIntervalo('F'));

      qryCR.FieldByName('HISTORICO').Value := 'REF. NFe Nº' +
        qryVenda.FieldByName('NUMERO').AsString;
      qryCR.FieldByName('DESCONTO').Value := 0;
      qryCR.FieldByName('JUROS').Value := 0;
      qryCR.FieldByName('VRECEBIDO').Value := 0;
      qryCR.FieldByName('VL_RESTANTE').AsFloat :=
        qryVenda.FieldByName('TOTAL').AsFloat;
      qryCR.FieldByName('FPG_VENDA').Value := Dados.buscafpg('F');
      qryCR.FieldByName('SITUACAO').Value := 'A';
      qryCR.FieldByName('REMESSA').Value := 'N';
      qryCR.FieldByName('REMESSA_REENVIAR').Value := 'S';

      qryCR.FieldByName('TIPO').Value := 'T';
      qryCR.FieldByName('CARTAO').Value := 'F';

      qryCR.FieldByName('FKEMPRESA').Value := Dados.qryEmpresaCODIGO.Value;
      qryCR.FieldByName('FK_NFE').Value := qryVendaCODIGO.AsInteger;
      qryCR.Post;
      vSoma := vSoma + qryCRVALOR.AsFloat;
    end;

    qryCR.Refresh;
    qryCR.First;

    vDif := qryVendaTOTAL.AsFloat - vSoma;

    if vDif <> 0 then
    begin
      qryCR.Edit;
      qryCRVALOR.Value := SimpleRoundTo(qryCRVALOR.Value + vDif, -2);
      qryCR.Post;
      Dados.Conexao.CommitRetaining;
    end;

    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;

    if qryCRTVALOR.Value > 0 then
      qryVendaDINHEIRO.AsFloat := qryVendaTOTAL.AsFloat - qryCRTVALOR.Value
    else
      qryVendaDINHEIRO.Value := 0;

  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmCadNFe.btnGravarClick(Sender: TObject);
begin
  PageControl2.ActivePageIndex := 0;
  DBEdit2.SetFocus;

  if (trim(qryVendaNOME.Value) = '') or (qryVendaNOME.IsNull) then
  begin
    ShowMessage('Informe o nome');
    DBEdit40.SetFocus;
    exit;
  end;

  if qryItem.IsEmpty then
  begin
    ShowMessage('Informe os itens da NF-e');
    exit;
  end;

  if (qryVendaINDPAG.Value = 0) and (qryCR.RecordCount > 0) then
  begin
    ShowMessage
      ('Atenção! você informou forma de Pagamento a Vista e Gerou Parcelas À prazo!'
      + 'É necessário corrijir os lançamentos!');
    exit;
  end;

  if (qryVendaFINALIDADE.Value <> '0') then
  begin

    qryReferencia.Close;
    qryReferencia.Params[0].Value := qryVendaCODIGO.Value;
    qryReferencia.Open;

    if (trim(qryReferenciaREFERENCIA.Value) = '') or
      (qryReferenciaREFERENCIA.IsNull) then
    begin
      ShowMessage('Informe a chave referenciada');
      exit;
    end;
  end;

  try

    if (qryCR.State IN dsEditModes) then
      qryCR.Post;

    if qryItemID_PRODUTO.IsNull then
    begin
      if (qryItem.State IN dsEditModes) then
        qryItem.Cancel;
    end
    else
    begin
      if (qryItem.State IN dsEditModes) then
        qryItem.Post;
    end;

    if (qryVenda.State IN dsEditModes) then
      qryVenda.Post;

    RatearItens;
    CalculaTotais;

    btnGravar.Enabled := false;
  finally
    // btnGravar.Enabled := true;
  end;
  btnTransmitir.Enabled := true;
  btnPreview.Enabled := btnTransmitir.Enabled;
  Application.ProcessMessages;

end;

procedure TfrmCadNFe.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadNFe.DBComboBoxEh4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNFe.TotalNFe;
begin
  if qryVenda.State in dsEditModes then
    qryVenda.Edit;

  qryVendaTOTAL.Value := (qryVendaSUBTOTAL.Value + qryVendaTOTAL_IPI.Value +
    qryVendaFRETE.Value + qryVendaOUTROS.Value + qryVendaSEGURO.Value +
    qryVendaVALOR_ICMS_ST.AsFloat) - qryVendaDESCONTO.Value -
    qryVendaTOTAL_DESONERACAO.AsFloat;
end;

procedure TfrmCadNFe.DBEdit18Exit(Sender: TObject);
begin
  TotalNFe;
end;

procedure TfrmCadNFe.DBEdit1Exit(Sender: TObject);
begin
  DBEdit40.SetFocus;
end;

procedure TfrmCadNFe.DBEdit22Exit(Sender: TObject);
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaDESCONTO.AsFloat := SimpleRoundTo(qryVendaSUBTOTAL.AsFloat *
    (qryVendaPERC_DESCONTO.AsFloat / 100), -2);

  TotalNFe;

end;

procedure TfrmCadNFe.DBEdit36Exit(Sender: TObject);
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaPERC_DESCONTO.AsFloat :=
    SimpleRoundTo(((qryVendaDESCONTO.AsFloat / qryVendaSUBTOTAL.AsFloat) *
    100), -2);
  TotalNFe;
end;

procedure TfrmCadNFe.DBEdit40Change(Sender: TObject);
begin
  if vPessoa <> DBEdit40.Text then
  begin
    DBGridPessooa.Visible := true;
    pnPessoa.Height := 125;
  end;

  qryClientes.Close;

  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    qryClientes.Params[0].Value := '%' + DBEdit40.Text + '%';
    qryClientes.Params[1].Value := copy(DBEdit40.Text, 1, 14) + '%';
  end
  else
  begin
    qryClientes.Params[0].Value := DBEdit40.Text + '%';
    qryClientes.Params[1].Value := copy(DBEdit40.Text, 1, 14) + '%';
  end;

  qryClientes.Open;

end;

procedure TfrmCadNFe.DBEdit40KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryClientes.Prior;
  if Key = VK_DOWN then
    qryClientes.Next;
end;

procedure TfrmCadNFe.DBEdit40KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    qryVendaNOME.AsString := qryClientesRAZAO.Value;
end;

procedure TfrmCadNFe.DBEdit5Exit(Sender: TObject);
begin
  if (qryVenda.State in dsEditModes) then
  begin
    qryVendaUFPLACA.Value := qryVendaVIRTUAL_UFPLACA.Value;
    qryVendaPLACA.Value := qryVendaVIRTUAL_PLACA.Value;
    qryVendaRNTC.Value := qryVendaVIRTUAL_RNTC.Value;
  end;
end;

procedure TfrmCadNFe.DBGridEh1ColEnter(Sender: TObject);
begin

  if DBGridEh1.SelectedIndex <> 1 then
  begin
    if qryItemDESCRICAO.Value <> qryItemVIRTUAL_PRODUTO.AsString then
      if qryItem.State in dsEditModes then
        qryItemDESCRICAO.Value := qryItemVIRTUAL_PRODUTO.AsString;
  end
  else
  begin
    vLetras := '';
    qryProd.Filtered := false;
  end;

end;

procedure TfrmCadNFe.DBGridEh1Columns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if (Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    if DBGridEh1.SelectedIndex = 1 then
      qryItemID_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
  end;
end;

procedure TfrmCadNFe.DBGridEh1DblClick(Sender: TObject);
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
      qryProd.Close;
      qryProd.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
      qryProd.Open;
    end;
  end;
end;

procedure TfrmCadNFe.DBGridEh1Enter(Sender: TObject);
begin
  vLetras := '';
  // pesquisa parte
  qryProd.Filtered := false;
  FPodeAlterar := true;

end;

procedure TfrmCadNFe.DBGridEh1Exit(Sender: TObject);
begin
  vLetras := '';
  // pesquisa parte
  qryProd.Filtered := false;
  FPodeAlterar := false;
end;

procedure TfrmCadNFe.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  case Key of
    vk_delete:
      begin
        if Application.messagebox('Deseja Excluir Produto?', 'Confirmação',
          mb_yesno) = mrYes then
          qryItem.delete;
      end;
  end;
end;

procedure TfrmCadNFe.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadNFe.DBGridEh4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    if qryCaixa.IsEmpty then
      exit;

    If Application.messagebox('Tem certeza que Excluir Item?', 'Confirmação',
      mb_yesno + mb_iconquestion) = IDYES then
    begin
      qryCaixa.delete;
    end;
  end;

end;

procedure TfrmCadNFe.DBGridPessooaDblClick(Sender: TObject);
begin
  DBEdit40.EditText := qryClientesRAZAO.Value;
  qryVendaNOME.AsString := qryClientesRAZAO.Value
end;

procedure TfrmCadNFe.AtualizaCFOP(cfop: string);
var
  qryCFOP: TFDQuery;
begin
  if qryItem.IsEmpty then
    exit;

  If Application.messagebox('Deseja alterar o CFOP dos Itens?', 'Confirmação',
    mb_yesno + mb_iconquestion) = IDYES then
  begin
    try
      qryCFOP := TFDQuery.Create(self);
      qryCFOP.Connection := Dados.Conexao;

      qryCFOP.Close;
      qryCFOP.SQL.Clear;
      qryCFOP.SQL.Text := 'UPDATE NFE_DETALHE SET CFOP=:CFOP WHERE FKNFE=:NFE';
      qryCFOP.Params[0].Value := cfop;
      qryCFOP.Params[1].Value := qryVendaCODIGO.AsInteger;
      qryCFOP.ExecSQL;

      qryItem.Refresh;
    finally
      qryCFOP.Free;
    end;

  end;

end;

procedure TfrmCadNFe.AbreCR;
begin
  qryCR.Close;
  qryCR.Params[0].Value := qryVendaCODIGO.Value;
  qryCR.Open;
end;

procedure TfrmCadNFe.AbreCaixa;
begin
  qryCaixa.Close;
  qryCaixa.Params[0].Value := qryVendaCODIGO.Value;
  qryCaixa.Open;
end;

procedure TfrmCadNFe.dsVendaDataChange(Sender: TObject; Field: TField);
begin

  estado;
  AbreCR;
  AbreCaixa;

end;

procedure TfrmCadNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Application.messagebox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_yesno) <> mrYes then
    Action := caNone;

  if not qryItem.IsEmpty then
  begin
    if qryVenda.State in dsEditModes then
      qryVenda.Post;

    if qryItem.State in dsEditModes then
      qryItem.Post;

    if qryReferencia.State in dsEditModes then
      qryReferencia.Post;
  end
  else
  begin
    qryVenda.Cancel;
  end;

end;

procedure TfrmCadNFe.FormCreate(Sender: TObject);
begin

  if not(Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    DBGridEh1.Columns[1].FieldName := 'VIRTUAL_PRODUTO';
    DBGridEh1.Columns[0].ReadOnly := false;
  end
  else
  begin
    DBGridEh1.Columns[1].FieldName := 'DESCRICAO';
    DBGridEh1.Columns[0].ReadOnly := true;
  end;

  vLetras := ''; // pesquisa parte
  qryProd.Filtered := false;
end;

procedure TfrmCadNFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f2:
      begin
        if btnGravar.Enabled then
          btnGravarClick(self);
      end;

    vk_f3:
      begin
        if btnPreview.Enabled then
          btnPreviewClick(self);
      end;

    vk_f4:
      begin
        if btnTransmitir.Enabled then
          btnTransmitirClick(self);
      end;

    vk_f5:
      begin
        if btnImprimir.Enabled then
          btnImprimirClick(self);
      end;

    VK_F6:
      begin
        if btnImportar.Enabled then
          btnImportarClick(self);
      end;

    VK_F8:
      begin
        if btnProdutos.Enabled then
          btnProdutosClick(self);
      end;

    VK_F9:
      begin
        if btnPessoas.Enabled then
          btnPessoasClick(self);
      end;

    VK_F10:
      begin
        if btnTransp.Enabled then
          btnTranspClick(self);
      end;

    VK_F11:
      begin
        EdtProduto.SetFocus;
      end;

    VK_ESCAPE:
      begin
        if not(qryItem.State in dsEditModes) then
        begin
          Close;
        end;
      end;
  end;

end;

procedure TfrmCadNFe.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if FPodeAlterar then
  begin
    if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    begin

      Key := UpCase(Key); // pesquisa parcial

      if DBGridEh1.SelectedIndex = 1 then
      begin

        qryProd.Filtered := false;

        if (Key = #8) then
        begin

          if length(vLetras) = 1 then
            vLetras := ''
          else
            vLetras := copy(vLetras, 1, length(vLetras) - 1);
        end;

        if (Key in ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', ' ', '/', '-', '.', ':',
          '@', '&', '*', '%', '$', '(', ')', '=', '?', ':', ';', '{', '}', '[',
          ']', '+', '*', '#', '!']) then
        begin
          vLetras := vLetras + UpperCase(Key);
        end;

        if Dados.EhNumero(vLetras) and (vLetras <> '') then
          qryProd.Filter := 'CODIGO = ' + vLetras
        else
        begin
          if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
            qryProd.Filter := 'DESCRICAO LIKE ' +
              QuotedStr('%' + UpperCase(vLetras) + '%');
        end;

        qryProd.Filtered := true;

        if qryProdCODIGO.AsInteger > 0 then
        begin
          if vLetras <> '' then
          begin
            if not(qryItem.State in dsEditModes) then
              qryItem.Edit;
            qryItemID_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
          end;
        end;

      end
      else
      begin
        vLetras := '';
        qryProd.Filtered := false;
      end;
    end;
  end;

  if Key = #13 then
  begin

    if DBGridEh1.Columns.Grid.SelectedIndex = DBGridEh1.Columns.Count then
    begin

      if qryItemID_PRODUTO.IsNull then
      begin
        if qryItem.State in dsEditModes then
        begin
          qryItem.Cancel;
          DBEdit18.SetFocus;
        end;
      end;

    end;
  end;

end;

procedure TfrmCadNFe.FormShow(Sender: TObject);
begin

  qryTransp.Close;
  qryTransp.Open;

  qryClientes.Close;
  qryClientes.Params[0].AsString := '%';
  qryClientes.Params[1].AsString := '%';
  qryClientes.Open;

  qryProd.Close;
  qryProd.Params[0].AsInteger := Dados.qryEmpresaCODIGO.AsInteger;
  qryProd.Open;

  qryCFOP.Close;
  qryCFOP.Open;

  Dados.qryDesoneracao.Close;
  Dados.qryDesoneracao.Open;

  if Dados.qryConfigFORMAEMISSAO.Value = 0 then
    Caption := 'Emissão de NFe'
  else
    Caption := 'Emissão de NFe - EM CONTINGÊNCIA';

  btnTransmitir.Enabled := false;
  btnPreview.Enabled := btnTransmitir.Enabled;

  btnProdutos.Visible := Dados.vLiberaProduto;
  btnPessoas.Visible := Dados.vLiberaPessoa;

  PageControl2.ActivePageIndex := 0;

  if Dados.qryEmpresaPUXA_CFOP_PRODUTO.Value = 'S' then
  begin
    DBLookupComboboxEh3.Left := DBEdit38.Left;
    DBLookupComboboxEh3.Width := 552;
    DBEdit38.Visible := false;
  end
  else
  begin
    DBLookupComboboxEh3.Left := 73;
    DBLookupComboboxEh3.Width := 495;
    DBEdit38.Visible := true;
  end;

  if Dados.qryEmpresaCRT.Value = 1 then
  begin
    DBGridEh1.Columns[3].Visible := false;
    DBGridEh1.Columns[4].Visible := true;
  end
  else
  begin
    DBGridEh1.Columns[3].Visible := true;
    DBGridEh1.Columns[4].Visible := false;

  end;

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;

  if (qryVendaNOME.IsNull) or (qryVendaNOME.AsString = '') then
    qryVendaNOME.AsString := qryVendaVIRTUAL_CLIENTE.AsString;

  Dados.AjustaCamposNovos('nfe');

end;

procedure TfrmCadNFe.qryItemAfterDelete(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadNFe.qryItemAfterEdit(DataSet: TDataSet);
begin

  btnTransmitir.Enabled := false;
  btnPreview.Enabled := btnTransmitir.Enabled;
  btnGravar.Enabled := true;
end;

procedure TfrmCadNFe.qryItemAfterInsert(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadNFe.NaturezaOperacao;
begin

  if Dados.qryEmpresaPUXA_CFOP_PRODUTO.Value = 'N' then
    exit;

  try
    qryVenda.DisableControls;
    qryNatureza.Close;
    qryNatureza.Params[0].Value := qryVendaCODIGO.Value;
    qryNatureza.Open;
    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;
    qryVendaCFOP.Value := qryNatureza.FieldByName('CFOP').Value;
    qryVenda.Post;
  finally
    qryVenda.EnableControls;
  end;
end;

procedure TfrmCadNFe.PageControl2Change(Sender: TObject);
begin
  if PageControl2.ActivePage = TabSheet6 then
  begin
    AbreCR;
    AbreCaixa;
  end;

  if PageControl2.ActivePage = TabSheet2 then
  begin

    qryReferencia.Close;
    qryReferencia.Params[0].Value := qryVendaCODIGO.Value;
    qryReferencia.Open;

  end;

end;

procedure TfrmCadNFe.PageControl3Change(Sender: TObject);
begin

  AbreCR;
  AbreCaixa;

end;

procedure TfrmCadNFe.pnPessoaExit(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
  begin
    if vPessoa <> DBEdit40.EditText then
      GetCliente(DBEdit40.EditText);
  end;
  DBGridPessooa.Visible := false;
  pnPessoa.Height := 36;

end;

procedure TfrmCadNFe.sTransmitida;
begin
  if DmNFe.ACBrNFe.WebServices.Retorno.cStat = 100 then
  begin

    DmNFe.ACBrNFe.NotasFiscais.Items[0].GravarXML;
    DmNFe.ACBrNFe.NotasFiscais.ImprimirPDF;

    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;

    qryVendaCHAVE.Value :=
      copy(DmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.Id, 4, 100);

    qryVendaXML.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0].XML;

    qryVendaPROTOCOLO.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0]
      .NFe.procNFe.nProt;

    qryVendaFLAG.Value := 'N';

    qryVendaSITUACAO.Value := '2';

    if Dados.qryConfigFORMAEMISSAO.Value <> 0 then
      // Nota emitida em contigencia
      qryVendaSITUACAO.Value := '7';

    qryVendaHORA_EMISSAO.Value := Now;
    qryVendaHORA_SAIDA.Value := Now;

    qryVenda.Post;

    Dados.Conexao.CommitRetaining;

    if Dados.qryEmpresaENVIAR_EMAIL_NFE.AsString = 'S' then
      DmNFe.EnviarEmal(qryVendaVIRTUAL_EMAIL.AsString, qryVendaNUMERO.AsString,
        qryVendaXML.AsString, qryVendaVIRTUAL_CLIENTE.AsString);

    Application.ProcessMessages;

    UPdateItens(qryVendaCODIGO.Value);

    dmestoque.AtualizaEstoqueFiscal('NFE', qryVendaCODIGO.Value,
      qryVendaMOVIMENTO.Value, Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value);

    dmestoque.AtualizaEstoqueReal('NFE', qryVendaCODIGO.Value,
      qryVendaMOVIMENTO.Value, qryVendaFKVENDA.AsInteger);

    ShowMessage('Nota Transmitida com sucesso!!');

    GeraCaixa;
  end;
end;

procedure TfrmCadNFe.TabSheet1Enter(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TfrmCadNFe.sCancelada;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaSITUACAO.Value := '3';
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage(DmNFe.ACBrNFe.WebServices.Retorno.xMotivo);
  Close;
end;

procedure TfrmCadNFe.sDenegada;
begin
  DmNFe.ACBrNFe.NotasFiscais.Items[0].GravarXML;
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaCHAVE.Value := copy(DmNFe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.infNFe.Id, 4, 100);
  qryVendaXML.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVendaPROTOCOLO.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaFLAG.Value := 'N';
  qryVendaSITUACAO.Value := '6';
  qryVendaHORA_EMISSAO.Value := Now;
  qryVendaHORA_SAIDA.Value := Now;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  Close;
end;

procedure TfrmCadNFe.sDuplicidade;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaSITUACAO.Value := '4';
  qryVendaHORA_EMISSAO.Value := Now;
  qryVendaHORA_SAIDA.Value := Now;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage(DmNFe.ACBrNFe.WebServices.Retorno.xMotivo);
  Close;
end;

procedure TfrmCadNFe.sInutilizada;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaSITUACAO.Value := '5';
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  ShowMessage(DmNFe.ACBrNFe.WebServices.Retorno.xMotivo);
  Close;
end;

procedure TfrmCadNFe.sDenegado;
begin
  DmNFe.ACBrNFe.NotasFiscais.Items[0].GravarXML;
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaCHAVE.Value := copy(DmNFe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.infNFe.Id, 4, 100);
  qryVendaXML.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0].XML;
  qryVendaPROTOCOLO.Value := DmNFe.ACBrNFe.NotasFiscais.Items[0]
    .NFe.procNFe.nProt;
  qryVendaFLAG.Value := 'N';
  qryVendaSITUACAO.Value := '6';
  qryVendaHORA_EMISSAO.Value := Now;
  qryVendaHORA_SAIDA.Value := Now;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;
  Close;
end;

procedure TfrmCadNFe.qryItemAfterPost(DataSet: TDataSet);
begin

  vLetras := '';
  qryProd.Filtered := false;

  Dados.Conexao.CommitRetaining;
  CalculaTotais;
  NaturezaOperacao;

end;

procedure TfrmCadNFe.qryItemALIQ_ICMSValidate(Sender: TField);
begin
  if not(qryItem.State in dsEditModes) then
    qryItemVALOR_ICMS.Value :=
      SimpleRoundTo(qryItemTOTAL.AsFloat * qryItemALIQ_ICMS.AsFloat / 100, -2);
end;

procedure TfrmCadNFe.qryItemBASE_ICMSValidate(Sender: TField);
begin
  qryItemVALOR_ICMS.AsFloat := qryItemBASE_ICMS.AsFloat *
    qryItemALIQ_ICMS.AsFloat / 100;
end;

procedure TfrmCadNFe.qryItemBeforeDelete(DataSet: TDataSet);
begin
  if qryVendaSITUACAO.Value <> '1' then
    Abort;

  if Dados.qryConfigGERA_FI_ES.Value = 'S' then
  begin
    if (qryItemEVENDA.IsNull) or (qryItemEVENDA.Value = 'N') then
    begin
      dmestoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
        'E', 'R');
      dmestoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat,
        0, 'E', 'R');
    end;
  end;
end;

procedure TfrmCadNFe.qryItemBeforeEdit(DataSet: TDataSet);
begin
  QuantidadeAnterior := qryItemQTD.AsFloat;
  ProdutoAnterior := qryItemID_PRODUTO.AsInteger;

  if qryVenda.State in dsEditModes then
    qryVenda.Post;

  if qryCR.State in dsEditModes then
    qryCR.Post;

end;

procedure TfrmCadNFe.qryItemBeforeInsert(DataSet: TDataSet);
begin
  if not qryCFOP.Locate('CODIGO', qryVendaCFOP.Value, []) then
    raise exception.Create('CFOP não encontrado!');

  if (qryVendaID_CLIENTE.IsNull) then
    raise exception.Create('Cliente não encontrado!');

  QuantidadeAnterior := 0;
  ProdutoAnterior := 0;

  if qryVenda.State in dsEditModes then
    qryVenda.Post;
end;

procedure TfrmCadNFe.qryItemBeforePost(DataSet: TDataSet);
begin

  if (qryItemDESCRICAO.IsNull) or (qryItemDESCRICAO.AsString = '') then
  begin
    // pesquisa parcial
    raise exception.Create('Informe a Descrição do Produto');

  end;

  qryItemGERA_ES.Value := 'N';

  if Dados.qryEmpresaBAIXAR_ESTOQUE_NFE.Value = 'S' then
  begin
    if (qryItemEVENDA.IsNull) or (qryItemEVENDA.Value = 'N') then
      qryItemGERA_ES.Value := 'S';
  end;

  if qryItemQTD.AsFloat > 0 then
    qryItemPRECO.AsFloat := SimpleRoundTo(qryItemTOTAL.AsFloat /
      qryItemQTD.AsFloat, -3);

  AtualizaEstoque;

  ZeraImpostos;
  Calcula_Icms_Proprio;
  Calcula_ICMS_Proprio_Reducao;
  Calcula_IPI;
  Calcula_PIS;
  CalculaCOFINS;
  Zera_ICMS_Simples_Nacional;
  CalculaLeiTransparecia;
  CalculaCombatePobreza;
  CalculaDiferimento;
  CalculaST;
  ZeraImpostos;

end;

procedure TfrmCadNFe.qryItemCFOPValidate(Sender: TField);
begin
  if not qryCFOP.Locate('CODIGO', qryItemCFOP.Value, []) then
    raise exception.Create('CFOP não encontrado!');
end;

procedure TfrmCadNFe.qryItemID_PRODUTOChange(Sender: TField);
begin
  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    if DBGridEh1.SelectedIndex = 1 then
      BuscaProduto;
  end
  else
  begin
    if DBGridEh1.SelectedIndex < 2 then
      BuscaProduto;
  end;
end;

procedure TfrmCadNFe.qryItemNewRecord(DataSet: TDataSet);
begin
  qryItemCODIGO.Value := Dados.Numerador('NFE_DETALHE', 'CODIGO', 'N', '', '');
  qryItemITEM.Value := Dados.Numerador('NFE_DETALHE', 'ITEM', 'S', 'FKNFE',
    qryVendaCODIGO.AsString);
  qryItemFKNFE.Value := qryVendaCODIGO.Value;
  qryItemPRECO.Value := 0;
  qryItemQTD.Value := 1;
  qryItemFRETE.Value := 0;
  qryItemDESCONTO.Value := 0;
  qryItemMVA.Value := 0;
  qryItemOUTROS.Value := 0;
  qryItemSEGURO.Value := 0;
  qryItemVICMSDESON.Value := 0;
  qryItemVALOR_ICMS.Value := 0;
  qryItemVALOR_COFINS_ICMS.Value := 0;
  qryItemVALOR_PIS_ICMS.Value := 0;
  qryItemVALOR_IPI.Value := 0;
  qryItemBASE_ICMS.Value := 0;
  qryItemBASE_COFINS_ICMS.Value := 0;
  qryItemBASE_PIS_ICMS.Value := 0;
  qryItemBASE_IPI.Value := 0;
  qryItemALIQ_ICMS.Value := 0;
  qryItemALIQ_COFINS_ICMS.Value := 0;
  qryItemALIQ_PIS_ICMS.Value := 0;
  qryItemALIQ_IPI.Value := 0;
  qryItemVBCSTRET.AsFloat := 0;
  qryItemVICMSSTRET.AsFloat := 0;
  qryItemVBCSTDEST.AsFloat := 0;
  qryItemVICMSSTDEST.AsFloat := 0;
  qryItemEVENDA.Value := 'N';
  qryItemE_S.Value := qryVendaMOVIMENTO.Value;
end;

procedure TfrmCadNFe.qryItemQTDValidate(Sender: TField);
begin
  qryItemTOTAL.Value := SimpleRoundTo(qryItemPRECO.AsFloat *
    qryItemQTD.AsFloat, -2);
end;

procedure TfrmCadNFe.qryReferenciaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadNFe.qryReferenciaNewRecord(DataSet: TDataSet);
begin
  qryReferenciaFK_NFE.Value := qryVendaCODIGO.Value;
  qryReferenciaCODIGO.Value := Dados.Numerador('NFE_REFERENCIA', 'CODIGO',
    'N', '', '');;

end;

procedure TfrmCadNFe.qryVendaAfterDelete(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadNFe.qryVendaAfterEdit(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnPreview.Enabled := btnTransmitir.Enabled;
  btnGravar.Enabled := true;
end;

procedure TfrmCadNFe.qryVendaAfterInsert(DataSet: TDataSet);
begin

  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadNFe.qryVendaAfterOpen(DataSet: TDataSet);
begin
  qryItem.Close;
  qryItem.Open;
end;

procedure TfrmCadNFe.qryVendaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadNFe.qryVendaBeforePost(DataSet: TDataSet);
begin
  if qryVendaCNF.IsNull then
    qryVendaCNF.AsInteger := GerarCodigoDFe(qryVendaNUMERO.Value);

  if (qryVenda.State = dsInsert) then
  begin

    qryPesquisaNFe.Close;
    qryPesquisaNFe.Params[0].Value := qryVendaNUMERO.Value;
    qryPesquisaNFe.Params[1].Value := qryVendaCODIGO.Value;
    qryPesquisaNFe.Params[2].Value := qryVendaFKEMPRESA.Value;
    qryPesquisaNFe.Params[3].Value := qryVendaSERIE.Value;
    qryPesquisaNFe.Open;
    if qryPesquisaNFe.RecordCount > 0 then
    begin
      ShowMessage('Já existe nota com esta numeração!');
      Abort;
      exit;
    end;

  end;

  qryVendaFK_USUARIO.Value := Dados.idUsuario;
  qryVendaID_EMITENTE.Value := qryVendaFKEMPRESA.Value;

end;

procedure TfrmCadNFe.qryVendaCalcFields(DataSet: TDataSet);
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
    qryVendaVIRTUAL_SITUACAO.Value := 'USO DENEGADO';
  if qryVendaSITUACAO.Value = '7' then
    qryVendaVIRTUAL_SITUACAO.Value := 'CONTINGÊNCIA';

end;

procedure TfrmCadNFe.qryVendaCFOPValidate(Sender: TField);
begin

  AtualizaCFOP(qryVendaCFOP.AsString);
end;

procedure TfrmCadNFe.qryVendaDESCONTOChange(Sender: TField);
begin
  if (qryVenda.State in dsEditModes) then
  begin
    qryVendaTOTAL.Value := (qryVendaSUBTOTAL.Value + qryVendaTOTAL_IPI.Value +
      qryVendaFRETE.Value + qryVendaOUTROS.Value + qryVendaSEGURO.Value) -
      qryVendaDESCONTO.Value;
  end;
end;

procedure TfrmCadNFe.qryVendaID_CLIENTEValidate(Sender: TField);
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;

  // qryClientes.Locate('codigo', qryVendaID_CLIENTE.Value, []);

  if qryVendaMOVIMENTO.Value = 'S' then
  begin
    if (qryVendaVIRTUAL_UF_CLIENTE.Value = Dados.qryEmpresaUF.Value) then
      if (copy(qryVendaCFOP.AsString, 1, 1) <> '5') then
        qryVendaCFOP.Value := 5102

  end
  else
  begin
    if (copy(qryVendaCFOP.AsString, 1, 1) <> '6') then
      qryVendaCFOP.Value := 6102;
    qryVendaMOVIMENTO.Value := 'S';
  end;

  if length(TiraPontos(qryClientesCNPJ.Value)) = 11 then
    qryVendaCONSUMIDOR_FINAL.Value := 'S';
end;

procedure TfrmCadNFe.qryVendaNewRecord(DataSet: TDataSet);
begin

  qryVendaFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryVendaSERIE.Value := Dados.qryEmpresaNFE_SERIE.AsString;

  qryVendaNUMERO.Value := Dados.GeraNumeroNFe(qryVendaFKEMPRESA.AsInteger,
    qryVendaSERIE.AsInteger) + 1;

  if qryVendaNUMERO.Value = 1 then
    qryVendaNUMERO.Value :=
      StrToIntDef(Dados.qryEmpresaN_INICIAL_NFE.AsString, 1);

  qryVendaCNF.AsInteger := GerarCodigoDFe(qryVendaNUMERO.Value);

end;

procedure TfrmCadNFe.btnImportarClick(Sender: TObject);
begin

  // DBGridEh1.SelectedIndex := 3;

  if Dados.qryEmpresaPUXA_CFOP_PRODUTO.Value <> 'S' then
  begin
    if qryVendaCFOP.IsNull then
    begin
      ShowMessage('Informe Natureza de Operação');
      exit;
    end;
  end;

  if qryVendaID_CLIENTE.IsNull then
  begin
    ShowMessage('Informe o Cliente/Fornecedor');
    exit;
  end;

  try
    frmImportarNFe := TfrmImportarNFe.Create(Application);
    frmImportarNFe.ShowModal;
  except
    frmImportarNFe.Release;
  end;
end;

procedure TfrmCadNFe.estado;
begin
  DBEdit44.Enabled := not(qryVendaFKVENDA.Value > 0);
  btnGravar.Enabled := qryVendaSITUACAO.Value = '1';
  btnTransmitir.Enabled := (qryVendaSITUACAO.Value = '7');
  btnPreview.Enabled := btnTransmitir.Enabled;
  btnImprimir.Enabled := (qryVendaSITUACAO.Value = '2') or
    (qryVendaSITUACAO.Value = '7');
  btnImportar.Enabled := qryVendaSITUACAO.Value = '1';
  Panel3.Enabled := qryVendaSITUACAO.Value = '1';
  DBGridEh1.ReadOnly := qryVendaSITUACAO.Value <> '1';
  DBGridEh2.ReadOnly := qryVendaSITUACAO.Value <> '1';
  BtnGerar.Enabled := qryVendaSITUACAO.Value = '1';
  edtParcela.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet2.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet3.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet1.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet5.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet6.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet8.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet11.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet12.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet13.Enabled := qryVendaSITUACAO.Value = '1';
  TabSheet14.Enabled := qryVendaSITUACAO.Value = '1';

end;

procedure TfrmCadNFe.btnImprimirClick(Sender: TObject);
begin
  if (qryVendaSITUACAO.Value = '2') or (qryVendaSITUACAO.Value = '7') then
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
end;

procedure TfrmCadNFe.btnTranspClick(Sender: TObject);
begin
  try
    btnTransp.Enabled := false;
    FrmCadTransp := TFrmCadTransp.Create(Application);
    Dados.qryTransp.Close;
    Dados.qryTransp.Open;
    Dados.qryTransp.Insert;
    Dados.qryTranspCODIGO.Value := Dados.Numerador('TRANSPORTADORA', 'CODIGO',
      'N', '', '');
    Dados.qryTranspATIVO.Value := 'S';
    Dados.qryTranspEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
    Dados.qryTranspUF.Value := Dados.qryEmpresaUF.Value;
    Dados.qryTranspCOD_CIDADE.Value := Dados.qryEmpresaID_CIDADE.Value;
    Dados.qryTranspCIDADE.Value := Dados.qryEmpresaCIDADE.Value;
    FrmCadTransp.ShowModal;
  finally
    btnTransp.Enabled := false;
    FrmCadTransp.Release;

    qryTransp.Close;
    qryTransp.Open;

  end;

end;

procedure TfrmCadNFe.btnPessoasClick(Sender: TObject);
begin
  try
    btnPessoas.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    if Not Dados.qryPessoas.Active then
      Dados.qryPessoas.Open;
    Dados.qryPessoas.Insert;
    frmCadPessoa.ShowModal;
  finally
    frmCadPessoa.Release;

    qryClientes.Close;
    qryClientes.Params[0].AsString := '%';
    qryClientes.Params[1].AsString := '%';
    qryClientes.Open;

    btnPessoas.Enabled := true;
    Dados.qryFornecedor.Close;
    Dados.qryFornecedor.Open;

  end;
end;

procedure TfrmCadNFe.btnPreviewClick(Sender: TObject);
begin
  qryItem.Refresh;

  DmNFe.ConfiguraNFe('NFe');
  DmNFe.ImpressoraA4NFe('NFe');

  PageControl2.ActivePageIndex := 0;

  DmNFe.ACBrNFe.NotasFiscais.Clear;
  GerarNFCe(qryVendaNUMERO.AsString);
  DmNFe.ACBrNFe.NotasFiscais.Imprimir;

  btnTransmitir.Enabled := true;

end;

procedure TfrmCadNFe.btnProdutosClick(Sender: TObject);
var
  idProduto: Integer;
begin

  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.ShowModal;

  finally
    FrmCadProduto.Release;
    qryProd.Close;
    qryProd.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
    qryProd.Open;
  end;

end;

end.
