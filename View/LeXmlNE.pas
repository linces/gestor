unit LeXmlNE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, shellapi,
  StdCtrls, Buttons, Mask, DBCtrls, ACBrNFe, Inifiles, ACBrUtil, pcnAuxiliar,
  pcnConversao,
  ComCtrls, ACBrBase, ACBrDFe, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, DBLookupEh;

type
  TFrmXml = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    Label29: TLabel;
    DBEdit11: TDBEdit;
    ACBrNFe: TACBrNFe;
    btnImportar: TSpeedButton;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    dsProduto: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label25: TLabel;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit17: TDBEdit;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    Label22: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label21: TLabel;
    Label19: TLabel;
    DBEdit21: TDBEdit;
    DBGrid1: TDBGrid;
    btnFinalizar: TSpeedButton;
    qryFornecedor: TFDQuery;
    qryFornecedorEMPRESA: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorTIPO: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryFornecedorIE: TStringField;
    qryFornecedorFANTASIA: TStringField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorENDERECO: TStringField;
    qryFornecedorNUMERO: TStringField;
    qryFornecedorCOMPLEMENTO: TStringField;
    qryFornecedorCODMUN: TIntegerField;
    qryFornecedorMUNICIPIO: TStringField;
    qryFornecedorBAIRRO: TStringField;
    qryFornecedorUF: TStringField;
    qryFornecedorCEP: TStringField;
    qryFornecedorFONE1: TStringField;
    qryFornecedorFONE2: TStringField;
    qryFornecedorCELULAR1: TStringField;
    qryFornecedorCELULAR2: TStringField;
    qryFornecedorEMAIL1: TStringField;
    qryFornecedorEMAIL2: TStringField;
    qryFornecedorFOTO: TBlobField;
    qryFornecedorSEXO: TStringField;
    qryFornecedorDT_NASC: TDateField;
    qryFornecedorECIVIL: TStringField;
    qryFornecedorDIA_PGTO: TSmallintField;
    qryFornecedorOBS: TMemoField;
    qryFornecedorNUM_USU: TSmallintField;
    qryFornecedorFATURA: TStringField;
    qryFornecedorCHEQUE: TStringField;
    qryFornecedorCCF: TStringField;
    qryFornecedorSPC: TStringField;
    qryFornecedorISENTO: TStringField;
    qryFornecedorFORN: TStringField;
    qryFornecedorFUN: TStringField;
    qryFornecedorCLI: TStringField;
    qryFornecedorFAB: TStringField;
    qryFornecedorTRAN: TStringField;
    qryFornecedorADM: TStringField;
    qryFornecedorATIVO: TStringField;
    qryFornecedorDT_ADMISSAO: TDateField;
    qryFornecedorDT_DEMISSAO: TDateField;
    dsNatureza: TDataSource;
    qryCadProduto: TFDQuery;
    QRYUnidade: TFDQuery;
    QRYUnidadeCODIGO: TStringField;
    QRYUnidadeDESCRICAO: TStringField;
    pnAguarde: TPanel;
    OpenDialog: TOpenDialog;
    QRYUnidadeFK_USUARIO: TIntegerField;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    btnLoc: TBitBtn;
    Label8: TLabel;
    qryCFOP: TFDQuery;
    qryCFOPCODIGO: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPTIPO: TStringField;
    qryCFOPMOV_ES: TStringField;
    qryCFOPATIVO: TStringField;
    dsCFOP: TDataSource;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    qryCompra: TFDQuery;
    qryItensCompra: TFDQuery;
    qryCompraID: TIntegerField;
    qryCompraEMPRESA: TSmallintField;
    qryCompraDTENTRADA: TDateField;
    qryCompraDTEMISSAO: TDateField;
    qryCompraFORNECEDOR: TIntegerField;
    qryCompraMODELO: TStringField;
    qryCompraSERIE: TStringField;
    qryCompraCHAVE: TStringField;
    qryCompraNR_NOTA: TStringField;
    qryCompraGERA_CP: TStringField;
    qryCompraGERA_ES: TStringField;
    qryCompraAJUSTA_PC: TStringField;
    qryCompraAJUSTA_PV: TStringField;
    qryCompraEHFISCAL: TStringField;
    qryCompraLEUXML: TStringField;
    qryCompraSTATUS: TStringField;
    qryCompraXML: TMemoField;
    qryCompraTIPO: TStringField;
    qryItensCompraID: TIntegerField;
    qryItensCompraFK_COMPRA: TIntegerField;
    qryItensCompraEMPRESA: TSmallintField;
    qryItensCompraITEM: TSmallintField;
    qryItensCompraFK_PRODUTO: TIntegerField;
    qryItensCompraCFOP: TStringField;
    qryItensCompraCST_ICM: TStringField;
    qryItensCompraGERA_CP: TStringField;
    qryItensCompraGERA_ES: TStringField;
    qryItensCompraSITUACAO: TStringField;
    qryItensCompraFK_PRODUTO_FORN: TStringField;
    qryItensCompraCST_PIS: TStringField;
    qryItensCompraCST_COF: TStringField;
    qryItensCompraCST_IPI: TStringField;
    qryItensCompraFK_USUARIO: TIntegerField;
    qryCadProdutoCODIGO: TIntegerField;
    qryCadProdutoTIPO: TStringField;
    qryCadProdutoCODBARRA: TStringField;
    qryCadProdutoREFERENCIA: TStringField;
    qryCadProdutoGRUPO: TIntegerField;
    qryCadProdutoUNIDADE: TStringField;
    qryCadProdutoULTFORN: TIntegerField;
    qryCadProdutoLOCALIZACAO: TStringField;
    qryCadProdutoCSTICMS: TStringField;
    qryCadProdutoCSTE: TStringField;
    qryCadProdutoCSTS: TStringField;
    qryCadProdutoCSTIPI: TStringField;
    qryCadProdutoCSOSN: TStringField;
    qryCadProdutoNCM: TStringField;
    qryCadProdutoFOTO: TBlobField;
    qryCadProdutoATIVO: TStringField;
    qryCadProdutoCFOP: TStringField;
    qryCadProdutoULT_COMPRA: TIntegerField;
    qryCadProdutoULT_COMPRA_ANTERIOR: TIntegerField;
    qryCadProdutoCOD_BARRA_ATACADO: TStringField;
    qryCadProdutoEMPRESA: TSmallintField;
    qryCadProdutoCEST: TStringField;
    qryCadProdutoGRADE: TStringField;
    qryCadProdutoEFISCAL: TStringField;
    qryCadProdutoPAGA_COMISSAO: TStringField;
    qryCadProdutoCOMPOSICAO: TStringField;
    qryCadProdutoINICIO_PROMOCAO: TDateField;
    qryCadProdutoFIM_PROMOCAO: TDateField;
    qryCadProdutoESTOQUE_INICIAL: TFMTBCDField;
    qryCadProdutoAPLICACAO: TStringField;
    qryCadProdutoPRODUTO_PESADO: TStringField;
    qryCadProdutoSERVICO: TStringField;
    qryCadProdutoDT_CADASTRO: TDateField;
    qryCadProdutoDESCRICAO: TStringField;
    qryCadProdutoALIQ_ICM: TCurrencyField;
    qryCadProdutoALIQ_PIS: TCurrencyField;
    qryCadProdutoALIQ_COF: TCurrencyField;
    qryCadProdutoPR_CUSTO: TFMTBCDField;
    qryCadProdutoMARGEM: TCurrencyField;
    qryCadProdutoPR_VENDA: TFMTBCDField;
    qryCadProdutoQTD_ATUAL: TFMTBCDField;
    qryCadProdutoQTD_MIN: TFMTBCDField;
    qryCadProdutoE_MEDIO: TFMTBCDField;
    qryCadProdutoCOMISSAO: TCurrencyField;
    qryCadProdutoDESCONTO: TCurrencyField;
    qryCadProdutoPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryCadProdutoPR_VENDA_ANTERIOR: TFMTBCDField;
    qryCadProdutoPRECO_ATACADO: TFMTBCDField;
    qryCadProdutoQTD_ATACADO: TFMTBCDField;
    qryCadProdutoALIQ_IPI: TFMTBCDField;
    qryCadProdutoPESO: TFMTBCDField;
    qryCadProdutoPRECO_PROMO_ATACADO: TFMTBCDField;
    qryCadProdutoPRECO_PROMO_VAREJO: TFMTBCDField;
    qryCadProdutoPR_VENDA_PRAZO: TFMTBCDField;
    qryCadProdutoPRECO_VARIAVEL: TStringField;
    qryCadProdutoREDUCAO_BASE: TFMTBCDField;
    qryCadProdutoMVA: TFMTBCDField;
    qryCadProdutoFCP: TFMTBCDField;
    qryCadProdutoPR_CUSTO2: TFMTBCDField;
    qryCadProdutoPERC_CUSTO: TFMTBCDField;
    qryCompraSUBTOTAL: TFMTBCDField;
    qryCompraFRETE: TFMTBCDField;
    qryCompraDESPESAS: TFMTBCDField;
    qryCompraSEGURO: TFMTBCDField;
    qryCompraDESCONTO: TFMTBCDField;
    qryCompraBASE_IPI: TFMTBCDField;
    qryCompraTOTAL_IPI: TFMTBCDField;
    qryCompraBASE_ICM: TFMTBCDField;
    qryCompraTOTAL_ICM: TFMTBCDField;
    qryCompraBASE_ST: TFMTBCDField;
    qryCompraTOTAL_ST: TFMTBCDField;
    qryCompraBASE_PIS: TFMTBCDField;
    qryCompraTOTAL_PIS: TFMTBCDField;
    qryCompraBASE_COF: TFMTBCDField;
    qryCompraTOTAL_COF: TFMTBCDField;
    qryCompraTOTAL: TFMTBCDField;
    qryItensCompraVL_UNITARIO: TFMTBCDField;
    qryItensCompraQTD: TFMTBCDField;
    qryItensCompraE_MEDIO: TFMTBCDField;
    qryItensCompraVL_ITEM: TFMTBCDField;
    qryItensCompraBASE_IPI: TFMTBCDField;
    qryItensCompraALIQ_IPI: TFMTBCDField;
    qryItensCompraVL_IPI: TFMTBCDField;
    qryItensCompraBASE_ICMS: TFMTBCDField;
    qryItensCompraALIQ_ICMS: TFMTBCDField;
    qryItensCompraVL_ICMS: TFMTBCDField;
    qryItensCompraBASE_ST: TFMTBCDField;
    qryItensCompraVL_ST: TFMTBCDField;
    qryItensCompraBASE_PIS: TFMTBCDField;
    qryItensCompraALIQ_PIS: TFMTBCDField;
    qryItensCompraVL_PIS: TFMTBCDField;
    qryItensCompraBASE_COF: TFMTBCDField;
    qryItensCompraALIQ_COF: TFMTBCDField;
    qryItensCompraVL_COF: TFMTBCDField;
    qryItensCompraFRETE1: TFMTBCDField;
    qryItensCompraDESPESA: TFMTBCDField;
    qryItensCompraSEGURO: TFMTBCDField;
    qryItensCompraDESCONTO: TFMTBCDField;
    qryItensCompraALIQ_ST: TFMTBCDField;
    qryFornecedorLIMITE: TFMTBCDField;
    qryFornecedorSALARIO: TFMTBCDField;
    qryFornecedorPAI: TStringField;
    qryFornecedorMAE: TStringField;
    qryFornecedorBANCO: TStringField;
    qryFornecedorAGENCIA: TStringField;
    qryFornecedorGERENTE: TStringField;
    qryFornecedorFONE_GERENTE: TStringField;
    qryFornecedorPROPRIEDADE: TStringField;
    qryFornecedorDT_CADASTRO: TDateField;
    qryFornecedorTECNICO: TStringField;
    qryFornecedorATENDENTE: TStringField;
    btnCadastrar: TBitBtn;
    btnDesvincularTodos: TBitBtn;
    btnGrupo: TBitBtn;
    btnDesvincular: TBitBtn;
    qryItensCompraPR_VENDA: TFMTBCDField;
    qryXMLProduto: TFDQuery;
    qryXMLProdutoID_PRODUTO_LOCAL: TFloatField;
    qryXMLProdutoID_FORNECEDOR: TFloatField;
    qryXMLProdutoID_PRODUTO_FORN: TStringField;
    qryXMLProdutoUN_E: TStringField;
    qryXMLProdutoUN_S: TStringField;
    qryXMLProdutoFK_GRUPO: TIntegerField;
    qryXMLProdutoFKEMPRESA: TIntegerField;
    qryXMLProdutoQTD_E: TFMTBCDField;
    qryXMLProdutoQTD_S: TFMTBCDField;
    qryXMLDetail: TFDQuery;
    qryXMLDetailCODIGO: TIntegerField;
    qryXMLDetailFK_XML_MASTER: TIntegerField;
    qryXMLDetailFK_GRUPO: TIntegerField;
    qryXMLDetailID_PRODUTO_LOC: TIntegerField;
    qryXMLDetailID_PRODUTO_FOR: TStringField;
    qryXMLDetailDESCRICAO_FORNECEDOR: TStringField;
    qryXMLDetailDESCRICAO_LOCAL: TStringField;
    qryXMLDetailQUANT_E: TFMTBCDField;
    qryXMLDetailUND_E: TStringField;
    qryXMLDetailUND_S: TStringField;
    qryXMLDetailPRECO_E: TFMTBCDField;
    qryXMLDetailPRECO_S: TFMTBCDField;
    qryXMLDetailQUANT_S: TFMTBCDField;
    qryXMLDetailVL_ITEM: TFMTBCDField;
    qryXMLDetailNCM: TStringField;
    qryXMLDetailCFOP: TStringField;
    qryXMLDetailCODBARRA: TStringField;
    qryXMLDetailCST_IPI: TStringField;
    qryXMLDetailBASE_IPI: TFMTBCDField;
    qryXMLDetailALIQ_IPI: TFMTBCDField;
    qryXMLDetailVL_IPI: TFMTBCDField;
    qryXMLDetailCST_PIS: TStringField;
    qryXMLDetailBASE_PIS: TFMTBCDField;
    qryXMLDetailALIQ_PIS: TFMTBCDField;
    qryXMLDetailVL_PIS: TFMTBCDField;
    qryXMLDetailCST_COFINS: TStringField;
    qryXMLDetailBASE_COFINS: TFMTBCDField;
    qryXMLDetailALIQ_COFINS: TFMTBCDField;
    qryXMLDetailVL_COFINS: TFMTBCDField;
    qryXMLDetailCST_ICMS: TStringField;
    qryXMLDetailBASE_ICMS: TFMTBCDField;
    qryXMLDetailALIQ_ICMS: TFMTBCDField;
    qryXMLDetailVL_ICMS: TFMTBCDField;
    qryXMLDetailBASE_ST: TFMTBCDField;
    qryXMLDetailALIQ_ST: TFMTBCDField;
    qryXMLDetailVL_ST: TFMTBCDField;
    qryXMLDetailSEGURO: TFMTBCDField;
    qryXMLDetailDESPESAS: TFMTBCDField;
    qryXMLDetailFRETE: TFMTBCDField;
    qryXMLDetailDESCONTO: TFMTBCDField;
    qryXMLDetailREDBC: TFMTBCDField;
    qryXMLDetailFKEMPRESA: TIntegerField;
    qryXMLDetailQTD_TOTAL: TFMTBCDField;
    qryXMLDetailEMBALAGEM: TFMTBCDField;
    qryXMLDetailREFERENCIA: TStringField;
    qryXMLDetailCHECAR: TStringField;
    qryXMLDetailCEST: TStringField;
    qryXMLDetailCFOP_E: TStringField;
    qryXMLDetailCST_E: TStringField;
    qryXMLDetailPR_VENDA: TFMTBCDField;
    qryXMLDetailPR_ANTERIOR: TFMTBCDField;
    qryXMLDetailPR_MARGEM: TFMTBCDField;
    qryXMLDetailPR_SUGESTAO: TFMTBCDField;
    qryXMLDetailPR_VENDA_ANTERIOR: TFMTBCDField;
    qryXmlMaster: TFDQuery;
    qryXmlMasterCODIGO: TIntegerField;
    qryXmlMasterID_FORNECEDOR: TIntegerField;
    qryXmlMasterDATA_PEDIDO: TDateField;
    qryXmlMasterDATA_ENTRADA: TDateField;
    qryXmlMasterDATA_EMISSAO_NF: TDateField;
    qryXmlMasterNOTA_FISCAL: TStringField;
    qryXmlMasterMODELO: TStringField;
    qryXmlMasterSERIE: TStringField;
    qryXmlMasterCHAVE: TStringField;
    qryXmlMasterCFOP: TStringField;
    qryXmlMasterEMPRESA: TIntegerField;
    qryXmlMasterVIRTUAL_CNPJ: TStringField;
    qryXmlMasterVITUAL_UF: TStringField;
    qryXmlMasterVIRTUAL_FORNECEDOR: TStringField;
    qryXmlMasterXML: TMemoField;
    qryXmlMasterSUB_TOTAL: TFMTBCDField;
    qryXmlMasterFRETE: TFMTBCDField;
    qryXmlMasterOUTRAS_DESPESAS: TFMTBCDField;
    qryXmlMasterSEGURO: TFMTBCDField;
    qryXmlMasterDESCONTO: TFMTBCDField;
    qryXmlMasterTOTAL: TFMTBCDField;
    qryXmlMasterBASE_PIS: TFMTBCDField;
    qryXmlMasterTOTAL_PIS: TFMTBCDField;
    qryXmlMasterBASE_COFINS: TFMTBCDField;
    qryXmlMasterTOTAL_COFINS: TFMTBCDField;
    qryXmlMasterBASE_IPI: TFMTBCDField;
    qryXmlMasterTOTAL_IPI: TFMTBCDField;
    qryXmlMasterBASE_ICMS: TFMTBCDField;
    qryXmlMasterTOTAL_ICMS: TFMTBCDField;
    qryXmlMasterBASE_ST: TFMTBCDField;
    qryXmlMasterTOTAL_ST: TFMTBCDField;
    qryXmlMasterFK_USUARIO: TIntegerField;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryProdCSTE: TStringField;
    qryProdCSTIPI: TStringField;
    qryProdALIQ_PIS: TCurrencyField;
    qryProdALIQ_COF: TCurrencyField;
    qryProdMARGEM: TCurrencyField;
    qryXMLDetailVIRTUAL_DESCRICAO: TStringField;
    qryXMLDetailVIRTUAL_BARRA: TStringField;
    qryXMLDetailVIRTUAL_PR_VENDA: TExtendedField;
    qryXMLDetailVIRTUAL_PR_CUSTO: TExtendedField;
    qryXMLDetailVIRTUAL_MARGEM: TExtendedField;
    qryProdUNIDADE: TStringField;
    qryXMLDetailVIRTUAL_UNIDADE: TStringField;
    qryXMLProdutoCFOP: TStringField;
    qryItensCompraPR_ANTERIOR: TFMTBCDField;
    qryItensCompraPR_MARGEM: TFMTBCDField;
    qryItensCompraPR_SUGESTAO: TFMTBCDField;
    qryItensCompraPR_VENDA_ANTERIOR: TFMTBCDField;
    qryPesqForn: TFDQuery;
    qryPesqFornCODIGO: TIntegerField;
    qryPesqFornRAZAO: TStringField;
    qryPesqFornFANTASIA: TStringField;
    qryPesqFornUF: TStringField;
    qryPesqFornMUNICIPIO: TStringField;
    qryPesqFornCNPJ: TStringField;
    btnCadAuto: TBitBtn;
    qryXMLDuplicata: TFDQuery;
    qryCadProdutoRESTAUTANTE: TStringField;
    qryCadProdutoTEMPO_ESPERA: TIntegerField;
    qryCadProdutoCOMPLEMENTO: TStringField;
    qryCadProdutoTIPO_RESTAURANTE: TStringField;
    qryCadProdutoFK_MARCA: TIntegerField;
    qryCadProdutoPREFIXO_BALANCA: TStringField;
    qryCadProdutoFK_PRINCIPIO_ATIVO: TIntegerField;
    qryCadProdutoREMEDIO: TStringField;
    qryCadProdutoFK_TECIDO: TDateField;
    qryCadProdutoCFOP_EXTERNO: TIntegerField;
    qryCadProdutoETQ: TStringField;
    qryCadProdutoCSOSN_EXTERNO: TStringField;
    qryCadProdutoCST_EXTERNO: TStringField;
    qryCadProdutoALIQ_ICMS_EXTERNO: TFMTBCDField;
    qryCadProdutoORIGEM: TIntegerField;
    qryCadProdutoDATA_PRECO: TDateField;
    qryItensCompraEH_FISCAL: TStringField;
    qryCadProdutoQTD_FISCAL: TFMTBCDField;
    qryXMLDuplicataCODIGO: TIntegerField;
    qryXMLDuplicataFK_XML_MASTER: TIntegerField;
    qryXMLDuplicataDATA_VENCIMENTO: TDateField;
    qryXMLDuplicataDOCUMENTO: TStringField;
    qryXMLDuplicataVALOR: TFMTBCDField;
    qryCP: TFDQuery;
    qryCPCODIGO: TIntegerField;
    qryCPDATA: TDateField;
    qryCPFKFORNECE: TIntegerField;
    qryCPDOC: TStringField;
    qryCPDTVENCIMENTO: TDateField;
    qryCPHISTORICO: TStringField;
    qryCPDATA_PAGAMENTO: TDateField;
    qryCPSITUACAO: TStringField;
    qryCPFKEMPRESA: TIntegerField;
    qryCPFK_COMPRA: TIntegerField;
    qryCPVALOR: TCurrencyField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
    qryCPTVALOR: TAggregateField;
    qryCompraLEU_DUPLICATA: TStringField;
    qryCPFK_USUARIO: TIntegerField;
    qryXMLDetailPRECO_C_DESCONTO: TFMTBCDField;
    qryItensCompraQTD_DEVOLVIDA: TFMTBCDField;
    qryXMLDetailCSOSN: TStringField;
    qryCompraBASE_FCP: TFMTBCDField;
    qryCompraNOME: TStringField;
    qryItensCompraVFCP: TFMTBCDField;
    qryXMLDetailVFCP: TFMTBCDField;
    qryXmlMasterBASE_FCP: TFMTBCDField;
    qryItensCompraDESCRICAO: TStringField;
    qryXMLDetailPRECO_CUSTO: TFMTBCDField;

    procedure btnImportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLocClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure btnGrupoClick(Sender: TObject);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure FormDblClick(Sender: TObject);
    procedure qryCompraNewRecord(DataSet: TDataSet);
    procedure qryCompraAfterOpen(DataSet: TDataSet);
    procedure qryCompraAfterPost(DataSet: TDataSet);
    procedure qryItensCompraAfterPost(DataSet: TDataSet);
    procedure qryItensCompraNewRecord(DataSet: TDataSet);
    procedure btnDesvincularTodosClick(Sender: TObject);
    procedure qryItensCompraBeforePost(DataSet: TDataSet);
    procedure qryItensCompraBeforeEdit(DataSet: TDataSet);
    procedure qryItensCompraBeforeDelete(DataSet: TDataSet);
    procedure btnDesvincularClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryXMLDetailAfterPost(DataSet: TDataSet);
    procedure qryXMLDetailBeforePost(DataSet: TDataSet);
    procedure qryXMLDetailAfterDelete(DataSet: TDataSet);
    procedure qryXMLDetailQTD_TOTALChange(Sender: TField);
    procedure qryXMLDetailQUANT_SChange(Sender: TField);
    procedure qryXmlMasterAfterDelete(DataSet: TDataSet);
    procedure qryXmlMasterAfterPost(DataSet: TDataSet);
    procedure qryXMLDetailID_PRODUTO_LOCChange(Sender: TField);
    procedure qryXMLDetailPR_MARGEMChange(Sender: TField);
    procedure qryXMLDetailPRECO_SChange(Sender: TField);
    procedure btnCadAutoClick(Sender: TObject);
  private
    QuantidadeAnterior: extended;
    procedure Vincular;
    procedure InsereCompra;
    procedure InsereItens;
    function BuscaPrecoVenda(id: Integer): extended;
    procedure CadastraXMLProduto;
    function CadastroProduto: Integer;
    procedure LimpaXML;
    procedure GeraParcelasCP(codigo: Integer);
    procedure ApagaCP(codigo: Integer);
    function BuscaProduto: string;
    function BuscaFornecedor: string;
    procedure RatearCusto;
    { Private declarations }

  public
    { Public declarations }
    JaLeuXml: Boolean;
  end;

var
  FrmXml: TFrmXml;

implementation

{$R *.dfm}

uses Udados, uCadProduto, PesquisaProduto, uCadCompra, uGrupo;

procedure TFrmXml.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmXml.FormDblClick(Sender: TObject);
begin

  if qryXMLDetailID_PRODUTO_LOC.IsNull then
    exit;

  if not dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if not qryXMLDetail.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value :=
        qryXMLDetailID_PRODUTO_LOC.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
    end;

  end;

end;

procedure TFrmXml.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    if application.messageBox('Deseja Sair da Tela?', 'Confirmação', mb_YesNo) = mrYes
    then
      Close;
  end;
end;

procedure TFrmXml.FormShow(Sender: TObject);
begin
  dados.vCodGrupo := 0;
  btnImportar.Caption := 'Importa' + sLineBreak + 'XML';
  btnFinalizar.Caption := 'Finaliza' + sLineBreak + 'Importação';
  dados.vCodGrupo := 0;
  dados.QRYUnidade.Close;
  dados.QRYUnidade.SQL.Text :=
    'select * from unidade /*where*/ order by descricao';
  dados.QRYUnidade.Open;

  qryProd.Close;
  qryProd.Open;

  qryPesqForn.Close;
  qryPesqForn.Open;

  dados.qryGrupo.Close;
  dados.qryGrupo.SQL.Text := 'select * from grupo /*where*/ order by descricao';
  dados.qryGrupo.Open;

  dados.qryFornecedor.Close;
  dados.qryFornecedor.Open;

  DBGridEh1.Columns[9].Visible := false;
  if dados.qryEmpresaRATEAR_FRETE.Value = 'S' then
    DBGridEh1.Columns[9].Visible := True;

  qryCFOP.Close;
  qryCFOP.Open;

  qryXmlMaster.Close;
  qryXmlMaster.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  qryXmlMaster.Params[1].Value := dados.idUsuario;
  qryXmlMaster.Open;

  qryXMLDetail.Close;
  qryXMLDetail.Params[0].Value := qryXmlMasterCODIGO.Value;
  qryXMLDetail.Params[1].Value := dados.qryEmpresaCODIGO.Value;
  qryXMLDetail.Open;

  if dados.qryEmpresaAUTO_CADASTRO_PRODUTO.Value = 'S' then
    btnCadAuto.Visible := True
  else
    btnCadAuto.Visible := false;

end;

function TFrmXml.BuscaPrecoVenda(id: Integer): extended;
begin

  result := 0;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select pr_venda from produto where codigo=:codigo';
  dados.qryConsulta.Params[0].Value := id;
  dados.qryConsulta.Open;

  result := dados.qryConsulta.FieldByName('pr_venda').AsFloat;

end;

procedure TFrmXml.CadastraXMLProduto;
begin
  if qryXMLDetailID_PRODUTO_LOC.AsInteger > 0 then
  begin
    qryXMLProduto.Close;
    qryXMLProduto.Params[0].Value := qryXmlMasterID_FORNECEDOR.Value;
    // código fornecedor
    qryXMLProduto.Params[1].Value := qryXMLDetailID_PRODUTO_FOR.Value;
    // código produto fornecedor
    qryXMLProduto.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryXMLProduto.Open;
    // código produto local
    if qryXMLProduto.IsEmpty then
    begin
      qryXMLProduto.Insert;
      qryXMLProdutoFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryXMLProdutoID_FORNECEDOR.Value := qryXmlMasterID_FORNECEDOR.Value;
      qryXMLProdutoID_PRODUTO_LOCAL.Value := qryXMLDetailID_PRODUTO_LOC.Value;
      qryXMLProdutoID_PRODUTO_FORN.Value := qryXMLDetailID_PRODUTO_FOR.Value;
    end
    else
      qryXMLProduto.Edit;
    qryXMLProdutoUN_E.Value := qryXMLDetailUND_E.Value;
    qryXMLProdutoUN_S.Value := qryXMLDetailUND_S.Value;
    qryXMLProdutoFK_GRUPO.Value := qryXMLDetailFK_GRUPO.Value;
    qryXMLProdutoCFOP.Value := qryXMLDetailCFOP_E.Value;

    if qryXMLProdutoUN_S.Value = qryXMLProdutoUN_E.Value then
    begin
      qryXMLProdutoQTD_E.Value := 1;
      qryXMLProdutoQTD_S.Value := qryXMLDetailQUANT_S.Value;
    end
    else
    begin
      qryXMLProdutoQTD_E.Value := 1;
      qryXMLProdutoQTD_S.Value := qryXMLDetailQUANT_S.Value;
    end;

    qryXMLProduto.Post;
    dados.Conexao.CommitRetaining;
  end;
end;

procedure TFrmXml.ApagaCP(codigo: Integer);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text := 'DELETE FROM CPAGAR WHERE FK_COMPRA=:ID';
  dados.qryExecute.Params[0].Value := codigo;
  dados.qryExecute.Prepare;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

function TFrmXml.BuscaProduto: string;
begin
  result := '';
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'SELECT DESCRICAO FROM PRODUTO WHERE CODIGO=:CODIGO';
  dados.qryConsulta.Params[0].Value := qryItensCompraFK_PRODUTO.Value;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
    result := dados.qryConsulta.FieldByName('DESCRICAO').AsString;
end;

function TFrmXml.BuscaFornecedor: string;
begin
  result := '';
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'SELECT RAZAO FROM PESSOA WHERE CODIGO=:CODIGO';
  dados.qryConsulta.Params[0].Value := qryCompraFORNECEDOR.Value;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
    result := dados.qryConsulta.FieldByName('RAZAO').AsString;
end;

procedure TFrmXml.GeraParcelasCP(codigo: Integer);
begin

  qryCP.Close;
  qryCP.Params[0].Value := codigo;
  qryCP.Open;

  qryXMLDuplicata.First;
  while not qryXMLDuplicata.Eof do
  begin
    qryCP.Insert;
    qryCPCODIGO.Value := dados.Numerador('CPAGAR', 'CODIGO', 'N', '', '');
    qryCPDATA.Value := Date;
    qryCPFKFORNECE.Value := qryCompraFORNECEDOR.Value;
    qryCPDOC.Value := qryXMLDuplicataDOCUMENTO.AsString;
    qryCPVALOR.AsFloat := qryXMLDuplicataVALOR.AsFloat;
    qryCPDTVENCIMENTO.Value := qryXMLDuplicataDATA_VENCIMENTO.AsDateTime;
    qryCPHISTORICO.Value := 'REF.COMPRA Nº' + codigo.ToString;
    qryCPDESCONTO.Value := 0;
    qryCPJUROS.Value := 0;
    qryCPVLPAGO.Value := 0;
    qryCPVL_RESTANTE.Value := qryCPVALOR.AsFloat;
    qryCPSITUACAO.Value := 'A';
    qryCPFKEMPRESA.Value := qryCompraEMPRESA.Value;
    qryCPFK_USUARIO.Value := dados.idUsuario;
    qryCPFK_COMPRA.Value := codigo;
    qryCP.Post;
    dados.Conexao.CommitRetaining;
    qryXMLDuplicata.Next;
  end;
end;

procedure TFrmXml.btnImportarClick(Sender: TObject);
var
  CNPJ_CPF, CNPJ_CPF_MASCARA, Tipo, crt: string;
  n, i, j: Integer;
  idFornecedor: Integer;
  vCRT: Integer;
begin

  LimpaXML;

  if not JaLeuXml then
  begin
    If application.messageBox('Deseja Importar Novo XML?', 'Confirmação',
      mb_YesNo + mb_iconquestion) <> idyes then
      exit;

  end;

  try
    btnImportar.Enabled := false;
    pnAguarde.Visible := True;
    if not JaLeuXml then
    begin

      ACBrNFe.NotasFiscais.Clear;
      OpenDialog.Execute;
      if OpenDialog.FileName <> '' then
        ACBrNFe.NotasFiscais.LoadFromFile(OpenDialog.FileName)
      else
      begin
        ShowMessage('Arquivo inválido!');
        exit;

      end;
    end;

    qryXmlMaster.Close;
    qryXmlMaster.Params[0].Value := dados.qryEmpresaCODIGO.Value;
    qryXmlMaster.Params[1].Value := dados.idUsuario;
    qryXmlMaster.Open;

    qryXMLDetail.Close;
    qryXMLDetail.Params[0].Value := qryXmlMasterCODIGO.Value;
    qryXMLDetail.Params[1].Value := dados.qryEmpresaCODIGO.Value;
    qryXMLDetail.Open;

    CNPJ_CPF := ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
    // formata CNPJ

    if length(CNPJ_CPF) = 11 then
    begin
      CNPJ_CPF_MASCARA := Copy(CNPJ_CPF, 1, 3) + '.' + Copy(CNPJ_CPF, 4, 3) +
        '.' + Copy(CNPJ_CPF, 7, 3) + '-' + Copy(CNPJ_CPF, 10, 2);
      Tipo := 'FÍSICA';
    end;
    if length(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF) = 14 then
    begin
      CNPJ_CPF_MASCARA := Copy(CNPJ_CPF, 1, 2) + '.' + Copy(CNPJ_CPF, 3, 3) +
        '.' + Copy(CNPJ_CPF, 6, 3) + '/' + Copy(CNPJ_CPF, 9, 4) + '-' +
        Copy(CNPJ_CPF, 13, 2);
      Tipo := 'JURÍDICA';
    end;

    // Tipo de empresa
    case ACBrNFe.NotasFiscais.Items[0].NFe.Emit.crt of
      crtSimplesNacional:
        vCRT := 0;
      crtSimplesExcessoReceita .. crtRegimeNormal:
        vCRT := 1;

    end;


    // consulta fornecedor

    qryFornecedor.Close;
    qryFornecedor.Params[0].AsString := CNPJ_CPF_MASCARA;
    qryFornecedor.Open;

    if qryFornecedor.IsEmpty then
    begin // cadastra fornecedor senão existir
      qryFornecedor.Insert;
      qryFornecedorEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryFornecedorCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
        'N', '', '');
      qryFornecedorRAZAO.Value := ACBrNFe.NotasFiscais.Items[0].NFe.Emit.xNome;
      qryFornecedorFANTASIA.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.xFant;
      qryFornecedorENDERECO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.xLgr;
      qryFornecedorNUMERO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.nro;
      qryFornecedorBAIRRO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.xBairro;
      qryFornecedorMUNICIPIO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.xMun;
      qryFornecedorCODMUN.AsInteger := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.cMun;
      qryFornecedorUF.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.UF;
      qryFornecedorCEP.AsInteger := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.CEP;
      qryFornecedorFONE1.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Emit.EnderEmit.fone;
      crt := CRTToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.crt);
      qryFornecedorCNPJ.Value := CNPJ_CPF_MASCARA;
      qryFornecedorTIPO.Value := Tipo;
      qryFornecedorIE.Value := ACBrNFe.NotasFiscais.Items[0].NFe.Emit.IE;
      qryFornecedorATIVO.Value := 'S';
      qryFornecedorLIMITE.Value := 0;
      qryFornecedorFATURA.Value := 'N';
      qryFornecedorCHEQUE.Value := 'N';
      qryFornecedorCCF.Value := 'N';
      qryFornecedorSPC.Value := 'N';
      qryFornecedorISENTO.Value := 'N';
      qryFornecedorADM.Value := 'N';
      qryFornecedorTRAN.Value := 'N';
      qryFornecedorCLI.Value := 'N';
      qryFornecedorFORN.Value := 'S';
      qryFornecedorFAB.Value := 'N';
      qryFornecedorFUN.Value := 'N';
      qryFornecedorDT_CADASTRO.Value := Date;
      qryFornecedor.Post;
      dados.Conexao.CommitRetaining;
    end;
    idFornecedor := qryFornecedorCODIGO.Value;
    dados.qryFornecedor.Close;
    dados.qryFornecedor.Open;

    // importa cabeçalho para xml
    with dados do
    begin
      qryXmlMaster.Insert;
      qryXmlMasterCODIGO.Value := dados.idUsuario;
      qryXmlMasterFK_USUARIO.Value := dados.idUsuario;
      qryXmlMasterEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryXmlMasterID_FORNECEDOR.Value := idFornecedor;
      qryXmlMasterDATA_ENTRADA.Value := Date;
      qryXmlMasterDATA_EMISSAO_NF.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Ide.dEmi;
      qryXmlMasterNOTA_FISCAL.AsInteger := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Ide.nNF;
      qryXmlMasterMODELO.AsInteger := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Ide.modelo;
      qryXmlMasterSERIE.AsInteger := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Ide.serie;
      qryXmlMasterCHAVE.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.procNFe.chNFe;
      qryXmlMasterSUB_TOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vProd;
      qryXmlMasterFRETE.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vFrete;
      qryXmlMasterSEGURO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vSeg;
      qryXmlMasterOUTRAS_DESPESAS.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vOutro;
      qryXmlMasterDESCONTO.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vDesc;
      qryXmlMasterTOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vNF;
      qryXmlMasterBASE_PIS.Value := 0;
      qryXmlMasterBASE_COFINS.Value := 0;
      qryXmlMasterBASE_IPI.Value := 0;
      qryXmlMasterBASE_ICMS.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vBC;
      qryXmlMasterTOTAL_ICMS.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vICMS;
      qryXmlMasterBASE_ST.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vBCST;
      qryXmlMasterTOTAL_ST.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vST;
      qryXmlMasterTOTAL_IPI.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vIPI;
      qryXmlMasterBASE_FCP.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vFCP;
      qryXmlMasterTOTAL_PIS.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vPIS;
      qryXmlMasterTOTAL_COFINS.Value := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Total.ICMSTot.vCOFINS;
      qryXmlMasterXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;

      if qryXmlMasterVITUAL_UF.Value = dados.qryEmpresaUF.Value then
        qryXmlMasterCFOP.Value := '1102';

      if qryXmlMasterVITUAL_UF.Value <> dados.qryEmpresaUF.Value then
        qryXmlMasterCFOP.Value := '2102';

      qryXmlMaster.Post;
      Conexao.CommitRetaining;
    end;


    // importa itens do xml

    for n := 0 to ACBrNFe.NotasFiscais.Count - 1 do
    begin
      with ACBrNFe.NotasFiscais.Items[n].NFe do
      begin
        for i := 0 to Det.Count - 1 do
        begin
          qryXMLDetail.Insert;
          with Det.Items[i] do
          begin

            qryXMLDetailFK_XML_MASTER.Value := qryXmlMasterCODIGO.Value;

            qryXMLDetailCFOP_E.Value := qryXmlMasterCFOP.Value;

            qryXMLDetailCODIGO.Value := dados.Numerador('XML_DETAIL', 'CODIGO',
              'N', '', '');

            qryXMLDetailFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;

            qryXMLDetailID_PRODUTO_LOC.Clear;
            qryXMLDetailID_PRODUTO_FOR.Value := prod.cProd;
            qryXMLDetailCFOP.Value := prod.CFOP;
            qryXMLDetailDESCRICAO_FORNECEDOR.Value := UpperCase(prod.xProd);
            qryXMLDetailDESCRICAO_LOCAL.Value := UpperCase(prod.xProd);
            qryXMLDetailUND_E.Value := UpperCase(prod.uCom);
            qryXMLDetailUND_S.Value := UpperCase(prod.uCom);
            qryXMLDetailREFERENCIA.Value := UpperCase(prod.cProd);
            qryXMLDetailQUANT_E.Value := prod.qCom;
            qryXMLDetailQUANT_S.Value := 1;
            qryXMLDetailFK_GRUPO.Value := 0;
            qryXMLDetailPR_ANTERIOR.Value := 0;
            qryXMLDetailPRECO_CUSTO.Value := 0;
            qryXMLDetailPR_MARGEM.Value := dados.qryEmpresaLUCRO_PADRAO.AsFloat;
            qryXMLDetailPR_SUGESTAO.Value := 0;
            qryXMLDetailPR_VENDA_ANTERIOR.Value := 0;
            qryXMLDetailEMBALAGEM.Value := prod.qCom;
            qryXMLDetailCEST.Value := prod.CEST;
            qryXMLDetailPRECO_E.Value := prod.vUnCom;
            qryXMLDetailVL_ITEM.Value := prod.vProd;
            qryXMLDetailPRECO_S.Value := qryXMLDetailPRECO_E.Value;
            qryXMLDetailCODBARRA.Value := prod.cEAN;

            qryXMLProduto.Close;
            qryXMLProduto.Params[0].Value := idFornecedor;
            qryXMLProduto.Params[1].Value := prod.cProd;
            qryXMLProduto.Params[2].Value := dados.qryEmpresaCODIGO.Value;
            qryXMLProduto.Open;

            if not qryXMLProduto.IsEmpty then
            begin

              qryXMLDetailID_PRODUTO_LOC.AsFloat :=
                qryXMLProdutoID_PRODUTO_LOCAL.Value;

              if not qryXMLProdutoCFOP.IsNull then
                qryXMLDetailCFOP_E.Value := qryXMLProdutoCFOP.Value;

              qryXMLDetailDESCRICAO_LOCAL.Value :=
                dados.BuscaDescricaoProduto
                (qryXMLDetailID_PRODUTO_LOC.AsInteger);

              qryXMLDetailUND_S.Value := qryXMLProdutoUN_S.Value;
              qryXMLDetailFK_GRUPO.Value := qryXMLProdutoFK_GRUPO.Value;
              qryXMLDetailQUANT_S.Value := qryXMLProdutoQTD_S.AsFloat;

              if qryXMLDetailQTD_TOTAL.Value > 0 then
                qryXMLDetailPRECO_S.Value :=
                  (qryXMLDetailVL_ITEM.Value / qryXMLDetailQTD_TOTAL.Value);
            end;

            qryXMLDetailNCM.Value := prod.NCM;
            qryXMLDetailFRETE.Value := prod.vFrete;
            qryXMLDetailSEGURO.Value := prod.vSeg;
            qryXMLDetailDESPESAS.Value := prod.vOutro;
            qryXMLDetailDESCONTO.Value := prod.vDesc;
            qryXMLDetailPRECO_C_DESCONTO.AsFloat := qryXMLDetailPRECO_E.AsFloat
              - qryXMLDetailDESCONTO.AsFloat;

            if vCRT = 0 then
            begin
              qryXMLDetailCST_ICMS.Value := '041';
              qryXMLDetailCST_E.Value := '041';
              qryXMLDetailCSOSN.Value := CSOSNIcmsToStr(Imposto.ICMS.CSOSN);
            end
            else
            begin
              qryXMLDetailCST_ICMS.Value := OrigToStr(Imposto.ICMS.orig) +
                CSTICMSToStr(Imposto.ICMS.CST);
              qryXMLDetailCST_E.Value := OrigToStr(Imposto.ICMS.orig) +
                CSTICMSToStr(Imposto.ICMS.CST);
            end;

            qryXMLDetailBASE_ICMS.AsCurrency := Imposto.ICMS.vBC;
            qryXMLDetailVL_ICMS.AsCurrency := Imposto.ICMS.vICMS;
            qryXMLDetailALIQ_ICMS.AsCurrency := Imposto.ICMS.pICMS;
            if crt = '1' then
              qryXMLDetailCST_ICMS.Value := '041';

            if (CSTICMSToStr(Imposto.ICMS.CST) = '00') and
              (qryXMLDetailVL_ICMS.Value = 0) then
              qryXMLDetailCST_ICMS.Value := '041';

            qryXMLDetailCST_IPI.Value := CSTIPIToStr(Imposto.IPI.CST);
            qryXMLDetailBASE_IPI.AsCurrency := Imposto.IPI.vBC;
            qryXMLDetailVL_IPI.AsCurrency := Imposto.IPI.vIPI;
            qryXMLDetailALIQ_IPI.AsCurrency := Imposto.IPI.pIPI;

            qryXMLDetailCST_PIS.Value := CSTPISToStr(Imposto.PIS.CST);
            qryXMLDetailBASE_PIS.AsCurrency := Imposto.PIS.vBC;
            qryXMLDetailVL_PIS.AsCurrency := Imposto.PIS.vPIS;
            qryXMLDetailALIQ_PIS.AsCurrency := Imposto.PIS.pPIS;

            qryXMLDetailCST_COFINS.Value := CSTCOFINSToStr(Imposto.COFINS.CST);
            qryXMLDetailBASE_COFINS.AsCurrency := Imposto.COFINS.vBC;
            qryXMLDetailALIQ_COFINS.AsCurrency := Imposto.COFINS.pCOFINS;
            qryXMLDetailVL_COFINS.AsCurrency := Imposto.COFINS.vCOFINS;

            qryXMLDetailREDBC.AsCurrency := Imposto.ICMS.pRedBC;
            qryXMLDetailALIQ_ST.AsCurrency := Imposto.ICMS.pICMSST;
            qryXMLDetailBASE_ST.AsCurrency := Imposto.ICMS.vBCST;
            qryXMLDetailVL_ST.AsCurrency := Imposto.ICMS.vICMSST;
            qryXMLDetailVL_ST.AsCurrency := Imposto.ICMS.vFCPST;

            qryXMLDetailQTD_TOTAL.Value := qryXMLDetailEMBALAGEM.Value *
              qryXMLDetailQUANT_S.Value;

            qryXMLDetail.Post;
            dados.Conexao.CommitRetaining;

            QRYUnidade.Close;
            QRYUnidade.Params[0].Value := UpperCase(Copy(prod.uCom, 1, 2));
            QRYUnidade.Open;
            if QRYUnidade.IsEmpty then
            begin
              QRYUnidade.Insert;
              QRYUnidadeCODIGO.Value := UpperCase(Copy(prod.uCom, 1, 2));
              QRYUnidadeDESCRICAO.Value := UpperCase(prod.uCom);
              QRYUnidadeFK_USUARIO.Value := dados.idUsuario;
              QRYUnidade.Post;
              dados.Conexao.CommitRetaining;
            end;
          end;
        end;
      end;

      qryXmlMaster.Edit;
      qryXmlMasterBASE_PIS.Value := qryXmlMasterBASE_PIS.Value +
        qryXMLDetailBASE_PIS.Value;
      qryXmlMasterBASE_COFINS.Value := qryXmlMasterBASE_COFINS.Value +
        qryXMLDetailBASE_COFINS.Value;
      qryXmlMasterBASE_IPI.Value := qryXmlMasterBASE_IPI.Value +
        qryXMLDetailBASE_IPI.Value;
      qryXmlMaster.Post;
      dados.Conexao.CommitRetaining;
    end;

    qryXMLDuplicata.Close;
    qryXMLDuplicata.Open;

    for j := 0 to ACBrNFe.NotasFiscais.Items[0].NFe.Cobr.Dup.Count - 1 do
    begin

      qryXMLDuplicata.Insert;
      qryXMLDuplicata.FieldByName('codigo').AsInteger :=
        dados.Numerador('XML_DUPLICATA', 'CODIGO', 'N', '', '');
      qryXMLDuplicataFK_XML_MASTER.AsInteger := qryXmlMasterCODIGO.AsInteger;
      qryXMLDuplicataDATA_VENCIMENTO.AsDateTime := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Cobr.Dup.Items[j].dVenc;
      qryXMLDuplicataDOCUMENTO.AsString := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Cobr.Dup.Items[j].nDup;
      qryXMLDuplicataVALOR.AsFloat := ACBrNFe.NotasFiscais.Items[0]
        .NFe.Cobr.Dup.Items[j].vDup;
      qryXMLDuplicata.Post;

      dados.Conexao.CommitRetaining;

    end;

    qryXMLDetail.Close;
    qryXMLDetail.Params[0].Value := qryXmlMasterCODIGO.Value;
    qryXMLDetail.Params[1].Value := dados.qryEmpresaCODIGO.Value;
    qryXMLDetail.Open;

    dados.QRYUnidade.Close;
    dados.QRYUnidade.Open;

  finally
    btnImportar.Enabled := True;
    pnAguarde.Visible := false;
  end;
  if dados.qryEmpresaRATEAR_FRETE.Value = 'S' then
    RatearCusto;

end;

procedure TFrmXml.btnFinalizarClick(Sender: TObject);
begin
  DBEdit9.SetFocus;
  if (qryXmlMasterCFOP.IsNull) or (trim(qryXmlMasterCFOP.Value) = '') then
  begin
    ShowMessage('Informe o CFOP de Entrada!');
    exit;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select  nr_nota from compra where nr_nota=:nota and fornecedor=:forn and status=''F''';
  dados.qryConsulta.Params[0].Value := qryXmlMasterNOTA_FISCAL.Value;
  dados.qryConsulta.Params[1].Value := qryXmlMasterID_FORNECEDOR.Value;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
  begin
    ShowMessage('Já existe nota cadastrada com este Número!');
    exit;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select  count(*) from xml_detail where id_produto_loc is null and FK_XML_MASTER=:id';
  dados.qryConsulta.Params[0].Value := qryXmlMasterCODIGO.Value;
  dados.qryConsulta.Open;
  if dados.qryConsulta.Fields[0].Value > 0 then
  begin
    ShowMessage('Existem produtos sem vincular!');
    exit;
  end;

  try

    if qryXMLDetail.State in dsEditModes then
      qryXMLDetail.Post;

    qryXMLDetail.DisableControls;
    pnAguarde.Visible := True;
    application.ProcessMessages;
    btnFinalizar.Enabled := false;

    Vincular;
    try
      InsereCompra;

      frmCadCompra := TfrmCadCompra.Create(application);
      frmCadCompra.qryCompra.Close;
      frmCadCompra.qryCompra.Params[0].Value := qryCompraID.Value;
      frmCadCompra.qryCompra.Open;
      frmCadCompra.vpessoa := qryCompraNOME.Value;
      frmCadCompra.ShowModal;
    finally
      FrmXml.Release;
      LimpaXML;
    end;
    FrmXml.Close;
  finally
    qryXMLDetail.EnableControls;
    btnFinalizar.Enabled := True;
    pnAguarde.Visible := false;
  end;

end;

procedure TFrmXml.btnGrupoClick(Sender: TObject);
begin
  try
    frmGrupo := TfrmGrupo.Create(application);
    frmGrupo.ShowModal;
  finally
    frmGrupo.Release;
    dados.qryGrupo.Close;
    dados.qryGrupo.Open;
  end;
end;

procedure TFrmXml.btnLocClick(Sender: TObject);
begin
  if (qryXMLDetailID_PRODUTO_LOC.AsInteger > 0) then
  begin
    ShowMessage('Produto já vinculado!');
    exit;
  end;

  try
    btnLoc.Enabled := false;
    dados.vCodProduto := 0;
    dados.vCodGrupo := 0;
    dados.vPrecoProduto := 0;

    FrmPesquisaProduto := TFrmPesquisaProduto.Create(application);
    FrmPesquisaProduto.FFornecedor := qryXmlMasterID_FORNECEDOR.Value;
    FrmPesquisaProduto.FProduto := qryXMLDetailID_PRODUTO_FOR.Value;

    FrmPesquisaProduto.idx := 2;
    FrmPesquisaProduto.edtLoc.Text :=
      Copy(qryXMLDetailDESCRICAO_FORNECEDOR.Value, 1, 40);
    FrmPesquisaProduto.ShowModal;
    application.ProcessMessages;
  finally
    if dados.vCodProduto <> 0 then
    begin
      if not(qryXMLDetail.State in dsEditModes) then
        qryXMLDetail.Edit;
      qryXMLDetailID_PRODUTO_LOC.Value := dados.vCodProduto;
      qryXMLDetailFK_GRUPO.Value := dados.vCodGrupo;
      qryXMLDetailPR_VENDA.Value := dados.vPrecoProduto;
      qryXMLDetail.Post;
      dados.Conexao.CommitRetaining;
    end;
    btnLoc.Enabled := True;
    FrmPesquisaProduto.Release;

  end;
end;

procedure TFrmXml.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmXml.DBGridEh1DblClick(Sender: TObject);
begin

  if not dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if qryXMLDetailID_PRODUTO_LOC.AsInteger > 0 then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value :=
        qryXMLDetailID_PRODUTO_LOC.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
    end;

  end;
end;

procedure TFrmXml.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);

end;

procedure TFrmXml.InsereCompra;
begin

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select  id from compra where nr_nota=:nota and fornecedor=:forn and status<>''F''';
  dados.qryConsulta.Params[0].Value := qryXmlMasterNOTA_FISCAL.Value;
  dados.qryConsulta.Params[1].Value := qryXmlMasterID_FORNECEDOR.Value;
  dados.qryConsulta.Open;

  qryXMLDuplicata.Close;
  qryXMLDuplicata.Params[0].Value := qryXmlMasterCODIGO.AsInteger;
  qryXMLDuplicata.Open;

  if dados.qryConsulta.IsEmpty then
  begin
    qryCompra.Close;
    qryCompra.Params[0].Value := -1;
    qryCompra.Open;
    qryCompra.Insert;
  end
  else
  begin
    qryCompra.Close;
    qryCompra.Params[0].Value := dados.qryConsulta.Fields[0].AsInteger;
    qryCompra.Open;
    qryCompra.Edit;
  end;

  qryCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryCompraDTEMISSAO.Value := qryXmlMasterDATA_EMISSAO_NF.Value;
  qryCompraFORNECEDOR.Value := qryXmlMasterID_FORNECEDOR.Value;
  qryCompraNOME.Value := BuscaFornecedor;

  qryCompraMODELO.Value := qryXmlMasterMODELO.Value;
  qryCompraSERIE.Value := qryXmlMasterSERIE.Value;
  qryCompraBASE_FCP.AsFloat := qryXmlMasterBASE_FCP.AsFloat;
  qryCompraCHAVE.Value := qryXmlMasterCHAVE.Value;
  qryCompraFRETE.Value := qryXmlMasterFRETE.Value;
  qryCompraSUBTOTAL.Value := qryXmlMasterSUB_TOTAL.Value;
  qryCompraDESPESAS.Value := qryXmlMasterOUTRAS_DESPESAS.Value;
  qryCompraSEGURO.Value := qryXmlMasterSEGURO.Value;
  qryCompraDESCONTO.Value := qryXmlMasterDESCONTO.Value;
  qryCompraBASE_IPI.Value := qryXmlMasterBASE_IPI.Value;
  qryCompraBASE_ICM.Value := qryXmlMasterBASE_ICMS.Value;
  qryCompraBASE_ST.Value := qryXmlMasterBASE_ST.Value;
  qryCompraBASE_PIS.Value := qryXmlMasterBASE_PIS.Value;
  qryCompraBASE_COF.Value := qryXmlMasterBASE_COFINS.Value;
  qryCompraTOTAL_IPI.Value := qryXmlMasterTOTAL_IPI.Value;
  qryCompraTOTAL_ICM.Value := qryXmlMasterTOTAL_ICMS.Value;
  qryCompraTOTAL_ST.Value := qryXmlMasterTOTAL_ST.Value;
  qryCompraTOTAL_PIS.Value := qryXmlMasterTOTAL_PIS.Value;
  qryCompraTOTAL_COF.Value := qryXmlMasterTOTAL_COFINS.Value;
  qryCompraTOTAL.Value := qryXmlMasterTOTAL.Value;
  qryCompraEHFISCAL.Value := 'S';
  qryCompraLEUXML.Value := 'S';
  qryCompraAJUSTA_PC.Value := 'N';
  qryCompraAJUSTA_PV.Value := 'N';
  qryCompraNR_NOTA.Value := qryXmlMasterNOTA_FISCAL.Value;
  qryCompraXML.Value := qryXmlMasterXML.Value;

  if qryXMLDuplicata.RecordCount > 0 then
    qryCompra.FieldByName('LEU_DUPLICATA').AsString := 'S';

  qryCompra.Post;
  InsereItens;

  ApagaCP(qryCompraID.AsInteger);
  GeraParcelasCP(qryCompraID.AsInteger);

end;

procedure TFrmXml.InsereItens;
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text := 'delete from compra_itens where fk_compra=:id';
  dados.qryExecute.Params[0].Value := qryCompraID.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
  qryXMLDetail.First;
  while not qryXMLDetail.Eof do
  begin
    qryItensCompra.Insert;
    qryItensCompraVL_UNITARIO.Value := qryXMLDetailPRECO_S.Value;
    qryItensCompraFK_PRODUTO.Value := qryXMLDetailID_PRODUTO_LOC.Value;

    qryItensCompraDESCRICAO.Value := BuscaProduto;

    qryItensCompraFK_PRODUTO_FORN.Value := qryXMLDetailID_PRODUTO_FOR.Value;

    qryItensCompraCFOP.Value := qryXMLDetailCFOP_E.Value;

    qryItensCompraCST_ICM.Value := qryXMLDetailCST_ICMS.Value;

    qryItensCompraCST_PIS.Value := qryXMLDetailCST_PIS.Value;

    qryItensCompraCST_COF.Value := qryXMLDetailCST_COFINS.Value;

    qryItensCompraCST_IPI.Value := qryXMLDetailCST_COFINS.Value;

    qryItensCompraVL_UNITARIO.Value := qryXMLDetailPRECO_S.Value;
    qryItensCompraQTD.Value := qryXMLDetailQTD_TOTAL.Value;
    qryItensCompraE_MEDIO.Value := qryXMLDetailQTD_TOTAL.Value;
    qryItensCompraVL_ITEM.Value := qryItensCompraVL_UNITARIO.Value *
      qryItensCompraQTD.Value;
    qryItensCompraBASE_IPI.Value := qryXMLDetailBASE_IPI.Value;
    qryItensCompraBASE_PIS.Value := qryXMLDetailBASE_PIS.Value;
    qryItensCompraBASE_COF.Value := qryXMLDetailBASE_COFINS.Value;

    qryItensCompraBASE_ST.Value := qryXMLDetailBASE_ST.Value;
    qryItensCompraALIQ_ST.Value := qryXMLDetailALIQ_ST.AsFloat;
    qryItensCompraVL_ST.AsFloat := qryXMLDetailVL_ST.AsFloat;
    qryItensCompraVFCP.AsFloat := qryXMLDetailVFCP.AsFloat;
    qryItensCompraEH_FISCAL.Value := 'S';

    qryItensCompraBASE_ICMS.Value := qryXMLDetailBASE_ICMS.Value;
    qryItensCompraALIQ_IPI.Value := qryXMLDetailALIQ_IPI.AsFloat;
    qryItensCompraALIQ_PIS.Value := qryXMLDetailALIQ_PIS.AsFloat;
    qryItensCompraALIQ_COF.Value := qryXMLDetailALIQ_COFINS.AsFloat;

    qryItensCompraALIQ_ICMS.Value := qryXMLDetailALIQ_ICMS.AsFloat;
    qryItensCompraVL_IPI.Value := qryXMLDetailVL_IPI.AsFloat;
    qryItensCompraVL_PIS.Value := qryXMLDetailVL_PIS.AsFloat;
    qryItensCompraVL_COF.Value := qryXMLDetailVL_COFINS.AsFloat;
    qryItensCompraVL_ICMS.Value := qryXMLDetailVL_ICMS.AsFloat;
    qryItensCompraFRETE1.AsFloat := qryXMLDetailFRETE.AsFloat;
    qryItensCompraDESPESA.AsFloat := qryXMLDetailDESPESAS.AsFloat;
    qryItensCompraSEGURO.AsFloat := qryXMLDetailSEGURO.AsFloat;
    qryItensCompraDESCONTO.AsFloat := qryXMLDetailDESCONTO.AsFloat;
    qryItensCompraPR_VENDA.AsFloat := qryXMLDetailPR_VENDA.AsFloat;
    qryItensCompraPR_ANTERIOR.AsFloat := qryXMLDetailPR_ANTERIOR.AsFloat;
    qryItensCompraPR_MARGEM.AsFloat := qryXMLDetailPR_MARGEM.AsFloat;
    qryItensCompraPR_SUGESTAO.AsFloat := qryXMLDetailPR_SUGESTAO.AsFloat;
    qryItensCompraPR_VENDA_ANTERIOR.AsFloat :=
      qryXMLDetailPR_VENDA_ANTERIOR.AsFloat;

    qryItensCompra.Post;
    dados.Conexao.CommitRetaining;
    qryXMLDetail.Next;
  end;
  qryItensCompra.Refresh;
end;

procedure TFrmXml.qryCompraAfterOpen(DataSet: TDataSet);
begin
  qryItensCompra.Close;
  qryItensCompra.Open;
end;

procedure TFrmXml.qryCompraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmXml.qryCompraNewRecord(DataSet: TDataSet);
begin
  qryCompraID.Value := dados.Numerador('COMPRA', 'ID', 'N', '', '');
  qryCompraSTATUS.Value := 'A';
  qryCompraDTENTRADA.Value := Date;
  qryCompraDTEMISSAO.Value := Date;
  qryCompraSUBTOTAL.Value := 0;
  qryCompraTOTAL.Value := 0;
  qryCompraFRETE.Value := 0;
  qryCompraDESPESAS.Value := 0;
  qryCompraSEGURO.Value := 0;
  qryCompraDESCONTO.Value := 0;
  qryCompraBASE_IPI.Value := 0;
  qryCompraBASE_ICM.Value := 0;
  qryCompraBASE_ST.Value := 0;
  qryCompraBASE_PIS.Value := 0;
  qryCompraBASE_COF.Value := 0;
  qryCompraTOTAL_IPI.Value := 0;
  qryCompraTOTAL_ICM.Value := 0;
  qryCompraTOTAL_ST.Value := 0;
  qryCompraTOTAL_PIS.Value := 0;
  qryCompraTOTAL_COF.Value := 0;
  qryCompraGERA_CP.Value := 'S';
  qryCompraGERA_ES.Value := 'S';
  qryCompraAJUSTA_PC.Value := 'S';
  qryCompraLEUXML.Value := 'N';
  qryCompraEHFISCAL.Value := 'S';
  qryCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;

end;

procedure TFrmXml.qryItensCompraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmXml.qryItensCompraBeforeDelete(DataSet: TDataSet);
begin
  // dados.AtualizaEstoque(-1 * qryItensCompraQTD.AsFloat,
  // qryItensCompraFK_PRODUTO.Value);
end;

procedure TFrmXml.qryItensCompraBeforeEdit(DataSet: TDataSet);
begin
  QuantidadeAnterior := qryItensCompraQTD.AsFloat;
end;

procedure TFrmXml.qryItensCompraBeforePost(DataSet: TDataSet);
begin
  { if qryItensCompra.State = dsInsert then
    dados.AtualizaEstoque(qryItensCompraQTD.AsFloat,
    qryItensCompraFK_PRODUTO.Value);

    if qryItensCompra.State = dsEdit then
    dados.AtualizaEstoque(qryItensCompraQTD.AsFloat - QuantidadeAnterior,
    qryItensCompraFK_PRODUTO.Value);
    QuantidadeAnterior := 0; }
end;

procedure TFrmXml.qryItensCompraNewRecord(DataSet: TDataSet);
begin
  qryItensCompraID.Value := dados.Numerador('COMPRA_ITENS', 'ID', 'N', '', '');
  qryItensCompraITEM.Value := dados.Numerador('COMPRA_ITENS', 'ITEM', 'S',
    'FK_COMPRA', qryCompraID.AsString);
  qryItensCompraFK_COMPRA.Value := qryCompraID.Value;
  qryItensCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryItensCompraVL_UNITARIO.Value := 0;
  qryItensCompraQTD.Value := 1;
  qryItensCompraBASE_IPI.Value := 0;
  qryItensCompraBASE_ICMS.Value := 0;
  qryItensCompraBASE_ST.Value := 0;
  qryItensCompraQTD_DEVOLVIDA.Value := 0;
  qryItensCompraBASE_PIS.Value := 0;
  qryItensCompraBASE_COF.Value := 0;
  qryItensCompraALIQ_IPI.Value := 0;
  qryItensCompraALIQ_ICMS.Value := 0;
  qryItensCompraALIQ_PIS.Value := 0;
  qryItensCompraALIQ_COF.Value := 0;
  qryItensCompraVL_IPI.Value := 0;
  qryItensCompraVL_ICMS.Value := 0;
  qryItensCompraVL_ST.Value := 0;
  qryItensCompraVL_PIS.Value := 0;
  qryItensCompraVL_COF.Value := 0;
  qryItensCompraFRETE1.Value := 0;
  qryItensCompraDESPESA.Value := 0;
  qryItensCompraDESCONTO.Value := 0;
  qryItensCompraSEGURO.Value := 0;

  qryItensCompraPR_ANTERIOR.Value := 0;
  qryItensCompraPR_MARGEM.Value := 0;
  qryItensCompraPR_SUGESTAO.Value := 0;
  qryItensCompraPR_VENDA_ANTERIOR.Value := 0;

  qryItensCompraGERA_CP.Value := qryCompraAJUSTA_PV.Value;
  qryItensCompraGERA_ES.Value := qryCompraGERA_ES.Value;
  qryItensCompraSITUACAO.Value := qryCompraSTATUS.Value;
  qryItensCompraCFOP.Value := '....';
  qryItensCompraCST_ICM.Value := '...';

end;

procedure TFrmXml.qryXMLDetailAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmXml.qryXMLDetailAfterPost(DataSet: TDataSet);
begin
  dados.vCodGrupo := qryXMLDetailFK_GRUPO.Value;
  dados.Conexao.CommitRetaining;
  CadastraXMLProduto;
end;

procedure TFrmXml.qryXMLDetailBeforePost(DataSet: TDataSet);
begin
  if qryXMLDetail.State = dsInsert then
    qryXMLDetailCODIGO.Value := dados.Numerador('XML_DETAIL', 'CODIGO',
      'N', '', '');

  qryXMLDetailCHECAR.Value := 'S';

  if (qryXMLDetailDESCRICAO_LOCAL.Value = qryXMLDetailVIRTUAL_DESCRICAO.Value)
    or (qryXMLDetailCODBARRA.Value = qryXMLDetailVIRTUAL_BARRA.Value) then
    qryXMLDetailCHECAR.Value := 'N';
end;

procedure TFrmXml.qryXMLDetailID_PRODUTO_LOCChange(Sender: TField);
begin
  qryXMLDetailPR_ANTERIOR.AsFloat := qryXMLDetailVIRTUAL_PR_CUSTO.AsFloat;
  if dados.qryEmpresaLUCRO_PADRAO.AsFloat > 0 then
    qryXMLDetailPR_MARGEM.AsFloat := dados.qryEmpresaLUCRO_PADRAO.AsFloat
  else
    qryXMLDetailPR_MARGEM.AsFloat := qryXMLDetailVIRTUAL_MARGEM.Value;
  qryXMLDetailPR_VENDA_ANTERIOR.AsFloat := qryXMLDetailVIRTUAL_PR_VENDA.AsFloat;
end;

procedure TFrmXml.RatearCusto;
var
  FPercentual: extended;
  FCustoTotal: extended;
  Fpreco: extended;
begin

  FPercentual := 0;
  FCustoTotal := qryXmlMasterTOTAL.AsFloat - qryXmlMasterSUB_TOTAL.AsFloat;

  try
    qryXMLDetail.First;
    qryXMLDetail.DisableControls;

    while not qryXMLDetail.Eof do
    begin

      FPercentual := qryXMLDetailVL_ITEM.AsFloat /
        qryXmlMasterSUB_TOTAL.AsFloat;

      if qryXMLDetailQTD_TOTAL.AsFloat > 0 then
      begin
        qryXMLDetail.Edit;
        qryXMLDetailPRECO_CUSTO.AsFloat := (FCustoTotal * FPercentual) /
          qryXMLDetailQTD_TOTAL.AsFloat;

        Fpreco := qryXMLDetailPRECO_S.AsFloat + qryXMLDetailPRECO_CUSTO.AsFloat;

        qryXMLDetailPR_SUGESTAO.AsFloat := Fpreco +
          (Fpreco * qryXMLDetailPR_MARGEM.AsFloat / 100);

        qryXMLDetailPR_VENDA.AsFloat := qryXMLDetailPR_SUGESTAO.AsFloat;

        qryXMLDetail.Post;
        dados.Conexao.CommitRetaining;
      end;

      qryXMLDetail.Next;

    end;

  finally
    qryXMLDetail.EnableControls;
  end;

end;

procedure TFrmXml.qryXMLDetailPRECO_SChange(Sender: TField);
var
  Fpreco: extended;
begin

  qryXMLDetailPR_SUGESTAO.AsFloat := qryXMLDetailPRECO_S.AsFloat +
    (qryXMLDetailPRECO_S.AsFloat * qryXMLDetailPR_MARGEM.AsFloat / 100);

  qryXMLDetailPR_VENDA.AsFloat := qryXMLDetailPR_SUGESTAO.AsFloat;

  if dados.qryEmpresaRATEAR_FRETE.Value = 'S' then
  begin
    Fpreco := qryXMLDetailPRECO_S.AsFloat + qryXMLDetailPRECO_CUSTO.AsFloat;
    qryXMLDetailPR_SUGESTAO.AsFloat := Fpreco +
      (Fpreco * qryXMLDetailPR_MARGEM.AsFloat / 100);

    qryXMLDetailPR_VENDA.AsFloat := qryXMLDetailPR_SUGESTAO.AsFloat;
  end;

end;

procedure TFrmXml.qryXMLDetailPR_MARGEMChange(Sender: TField);
begin
  qryXMLDetailPR_SUGESTAO.AsFloat := qryXMLDetailPRECO_S.AsFloat +
    (qryXMLDetailPRECO_S.AsFloat * qryXMLDetailPR_MARGEM.AsFloat / 100);

  qryXMLDetailPR_VENDA.AsFloat := qryXMLDetailPR_SUGESTAO.AsFloat;

end;

procedure TFrmXml.qryXMLDetailQTD_TOTALChange(Sender: TField);
begin
  if qryXMLDetailQTD_TOTAL.Value > 0 then
    qryXMLDetailPRECO_S.Value := qryXMLDetailVL_ITEM.Value /
      qryXMLDetailQTD_TOTAL.Value;
end;

procedure TFrmXml.qryXMLDetailQUANT_SChange(Sender: TField);
begin
  qryXMLDetailQTD_TOTAL.Value := qryXMLDetailEMBALAGEM.Value *
    qryXMLDetailQUANT_S.Value;
end;

procedure TFrmXml.qryXmlMasterAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmXml.qryXmlMasterAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmXml.Vincular;
begin
  qryXMLDetail.First;
  while not qryXMLDetail.Eof do
  begin
    CadastraXMLProduto;
    qryXMLDetail.Next;
  end;
end;

function TFrmXml.CadastroProduto: Integer;
begin

  try
    result := 0;

    qryCadProduto.Close;
    if (trim(qryXMLDetailCODBARRA.AsString) = '') or
      (trim(qryXMLDetailCODBARRA.AsString) = 'SEM GTIN') or
      (qryXMLDetailCODBARRA.IsNull) then
      qryCadProduto.Params[0].Value := '-1'
    else
      qryCadProduto.Params[0].Value := qryXMLDetailCODBARRA.Value;
    qryCadProduto.Params[1].Value := qryXMLDetailDESCRICAO_LOCAL.Value;
    qryCadProduto.Open;

    if qryCadProduto.IsEmpty then
    begin

      qryCadProduto.Insert;
      qryCadProdutoCODIGO.Value := dados.Numerador('PRODUTO', 'CODIGO',
        'N', '', '');
      qryCadProdutoATIVO.Value := 'S';
      qryCadProdutoDESCRICAO.Value := qryXMLDetailDESCRICAO_LOCAL.Value;
      qryCadProdutoCODBARRA.Value := qryXMLDetailCODBARRA.Value;
      qryCadProdutoREFERENCIA.Value := qryXMLDetailREFERENCIA.Value;;

      qryCadProdutoORIGEM.Value := 0;

      qryCadProdutoULTFORN.Value := qryXmlMasterID_FORNECEDOR.Value;
      qryCadProdutoPR_CUSTO_ANTERIOR.Value := 0;
      qryCadProdutoPR_VENDA_ANTERIOR.Value := 0;
      qryCadProdutoULT_COMPRA.Value := 0;
      qryCadProdutoULT_COMPRA_ANTERIOR.Value := 0;
      qryCadProdutoEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryCadProdutoPRECO_ATACADO.Value := 0;
      qryCadProdutoCOMISSAO.Value := 0;
      qryCadProdutoAPLICACAO.Value := '';
      qryCadProdutoPRECO_VARIAVEL.Value := 'N';
      qryCadProdutoGRADE.Value := 'N';
      qryCadProdutoGRUPO.Value := qryXMLDetailFK_GRUPO.Value;

      if length(qryXMLDetailCEST.Value) = 7 then
        qryCadProdutoCEST.Value := qryXMLDetailCEST.Value;

      qryCadProdutoUNIDADE.Value := qryXMLDetailUND_E.Value;
      qryCadProdutoQTD_ATUAL.Value := 0;
      qryCadProdutoQTD_MIN.Value := 1;
      qryCadProdutoE_MEDIO.Value := 0;
      qryCadProdutoNCM.Value := qryXMLDetailNCM.Value;
      qryCadProdutoCFOP.Value := dados.qryEmpresaCFOP.Value;
      qryCadProdutoCFOP.Value := dados.qryEmpresaCFOP_EXTERNO.Value;
      qryCadProdutoQTD_ATACADO.Value := 0;
      qryCadProdutoPRECO_ATACADO.Value := 0;
      qryCadProdutoTIPO.Value := '00-MERCADORIA PARA REVENDA';
      qryCadProdutoALIQ_ICM.Value := dados.qryEmpresaALIQ_ICMS.AsFloat;
      qryCadProdutoALIQ_PIS.Value := dados.qryEmpresaALIQ_PIS.AsFloat;
      qryCadProdutoALIQ_COF.Value := dados.qryEmpresaALIQ_COF.AsFloat;
      qryCadProdutoALIQ_IPI.Value := dados.qryEmpresaALIQ_IPI.AsFloat;
      qryCadProdutoCSTICMS.Value := dados.qryEmpresaCST_ICMS.Value;
      qryCadProdutoCST_EXTERNO.Value := dados.qryEmpresaCST_EXTERNO.Value;
      qryCadProdutoCSTE.Value := dados.qryEmpresaCST_ENTRADA.Value;
      qryCadProdutoCSTS.Value := dados.qryEmpresaCST_SAIDA.Value;
      qryCadProdutoCSTIPI.Value := dados.qryEmpresaCST_IPI.Value;
      qryCadProdutoCSOSN.Value := dados.qryEmpresaCSOSN.Value;
      qryCadProdutoQTD_FISCAL.Value := 0;
      qryCadProdutoDT_CADASTRO.Value := Date;
      qryCadProdutoCSOSN_EXTERNO.Value := dados.qryEmpresaCSOSN_EXTERNO.Value;

      qryCadProdutoDATA_PRECO.Value := Date;

      if (qryXMLDetailCFOP.Value = '5401') or (qryXMLDetailCFOP.Value = '5405')
      then
      begin
        qryCadProdutoCFOP.Value := '5405';
        qryCadProdutoCSOSN.Value := '500';
      end
      else
      begin
        qryCadProdutoCFOP.Value := dados.qryEmpresaCFOP.Value;
        qryCadProdutoCFOP_EXTERNO.Value :=
          dados.qryEmpresaCFOP_EXTERNO.AsInteger;
      end;

      qryCadProdutoPAGA_COMISSAO.Value := 'N';
      qryCadProdutoEFISCAL.Value := 'S';

      qryCadProdutoPR_CUSTO.Value := qryXMLDetailPRECO_S.Value;
      qryCadProdutoPERC_CUSTO.Value := 0;
      qryCadProdutoPR_CUSTO2.Value := qryXMLDetailPRECO_S.Value;

      if qryXMLDetailPR_VENDA.AsFloat > 0 then
        qryCadProdutoPR_VENDA.Value := qryXMLDetailPR_VENDA.AsFloat
      else
        qryCadProdutoPR_VENDA.Value := qryCadProdutoPR_VENDA.Value;

      qryCadProdutoMARGEM.Value :=
        ((qryCadProdutoPR_VENDA.AsFloat / qryCadProdutoPR_CUSTO.AsFloat)
        - 1) * 100;

      qryCadProduto.Post;
      dados.Conexao.CommitRetaining;
    end;

    result := qryCadProdutoCODIGO.AsInteger;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;
end;

procedure TFrmXml.LimpaXML;
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'delete from xml_master where codigo=:cod';
  dados.qryConsulta.Params[0].Value := dados.idUsuario;
  dados.qryConsulta.ExecSQL;
  dados.Conexao.CommitRetaining;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'delete from xml_detail where FK_XML_MASTER=:id';
  dados.qryConsulta.Params[0].Value := dados.idUsuario;
  dados.qryConsulta.ExecSQL;
  dados.Conexao.CommitRetaining;

  dados.qryExecute.Close; // apaga xml duplicata
  dados.qryExecute.SQL.Text :=
    'delete from xml_duplicata where fk_xml_master=:codigo';
  dados.qryExecute.Params[0].Value := qryXmlMasterCODIGO.AsInteger;
  dados.qryExecute.ExecSQL;

end;

procedure TFrmXml.btnCadastrarClick(Sender: TObject);
var
  idProduto: Integer;
begin

  if (qryXMLDetailID_PRODUTO_LOC.AsInteger > 0) then
  begin
    ShowMessage('Já existe produto vinculado!');
    exit;
  end;

  if not(qryXMLDetailPR_VENDA.AsFloat > 0) then
  begin
    ShowMessage('Informe o Preço de Venda!');
    exit;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'SELECT CODIGO, CODBARRA FROM PRODUTO WHERE CODBARRA=:COD and descricao=:descri';
  dados.qryConsulta.Params[0].Value := qryXMLDetailCODBARRA.Value;
  dados.qryConsulta.Params[1].Value := qryXMLDetailDESCRICAO_LOCAL.Value;

  dados.qryConsulta.Open;

  if not dados.qryConsulta.IsEmpty then
  begin
    if application.messageBox
      ('Já existe produtos com este código de barras. Deseja Vincular a ele?',
      'Confirmação', mb_YesNo) = mrYes then
    begin

      qryXMLDetail.Edit;
      qryXMLDetailID_PRODUTO_LOC.Value := dados.qryConsulta.Fields[0].Value;
      qryXMLDetail.Post;
      dados.Conexao.CommitRetaining;
      qryXMLDetail.Next;
      exit;
    end;
  end;

  if (qryXMLDetailFK_GRUPO.IsNull) then
  begin
    ShowMessage('Informe o grupo do Item!');
    exit;
  end;

  FrmCadProduto := TFrmCadProduto.Create(application);

  FrmCadProduto.qryProdutos.Close;
  FrmCadProduto.qryProdutos.Params[0].Value := -1;
  FrmCadProduto.qryProdutos.Open;
  FrmCadProduto.qryProdutos.Insert;
  FrmCadProduto.qryProdutosCODIGO.Value := dados.Numerador('PRODUTO', 'CODIGO',
    'N', '', '');
  FrmCadProduto.qryProdutosATIVO.Value := 'S';
  FrmCadProduto.qryProdutosPR_CUSTO.Value := qryXMLDetailPRECO_S.Value;
  FrmCadProduto.qryProdutosPERC_CUSTO.Value := 0;
  FrmCadProduto.qryProdutosPR_CUSTO2.Value := qryXMLDetailPRECO_S.Value;

  if qryXMLDetailPR_VENDA.AsFloat > 0 then
    FrmCadProduto.qryProdutosPR_VENDA.Value := qryXMLDetailPR_VENDA.AsFloat
  else
    FrmCadProduto.qryProdutosPR_VENDA.Value :=
      FrmCadProduto.qryProdutosPR_VENDA.Value;

  FrmCadProduto.qryProdutosMARGEM.Value :=
    ((FrmCadProduto.qryProdutosPR_VENDA.AsFloat /
    FrmCadProduto.qryProdutosPR_CUSTO.AsFloat) - 1) * 100;

  FrmCadProduto.qryProdutosDESCRICAO.Value := qryXMLDetailDESCRICAO_LOCAL.Value;
  FrmCadProduto.qryProdutosCODBARRA.Value := qryXMLDetailCODBARRA.Value;
  FrmCadProduto.qryProdutosREFERENCIA.Value := qryXMLDetailREFERENCIA.Value;;

  FrmCadProduto.qryProdutosORIGEM.Value := 0;

  FrmCadProduto.qryProdutosULTFORN.Value := qryXmlMasterID_FORNECEDOR.Value;
  FrmCadProduto.qryProdutosPR_CUSTO_ANTERIOR.Value := 0;
  FrmCadProduto.qryProdutosPR_VENDA_ANTERIOR.Value := 0;
  FrmCadProduto.qryProdutosULT_COMPRA.Value := 0;
  FrmCadProduto.qryProdutosULT_COMPRA_ANTERIOR.Value := 0;
  FrmCadProduto.qryProdutosEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  FrmCadProduto.qryProdutosPRECO_ATACADO.Value := 0;
  FrmCadProduto.qryProdutosCOMISSAO.Value := 0;
  FrmCadProduto.qryProdutosAPLICACAO.Value := '';
  FrmCadProduto.qryProdutosPRECO_VARIAVEL.Value := 'N';
  FrmCadProduto.qryProdutosGRADE.Value := 'N';
  FrmCadProduto.qryProdutosDATA_PRECO.Value := Date;
  FrmCadProduto.qryProdutosGRUPO.Value := qryXMLDetailFK_GRUPO.Value;

  if length(qryXMLDetailCEST.Value) = 7 then
    FrmCadProduto.qryProdutosCEST.Value := qryXMLDetailCEST.Value;

  FrmCadProduto.qryProdutosUNIDADE.Value := qryXMLDetailVIRTUAL_UNIDADE.Value;
  FrmCadProduto.qryProdutosQTD_ATUAL.Value := 0;
  FrmCadProduto.qryProdutosQTD_FISCAL.Value := 0;
  FrmCadProduto.qryProdutosQTD_MIN.Value := 2;
  FrmCadProduto.qryProdutosE_MEDIO.Value := 0;
  FrmCadProduto.qryProdutosNCM.Value := qryXMLDetailNCM.Value;
  FrmCadProduto.qryProdutosCFOP.Value := dados.qryEmpresaCFOP.Value;
  FrmCadProduto.qryProdutosCFOP.Value := dados.qryEmpresaCFOP_EXTERNO.Value;
  FrmCadProduto.qryProdutosQTD_ATACADO.Value := 0;
  FrmCadProduto.qryProdutosPRECO_ATACADO.Value := 0;
  FrmCadProduto.qryProdutosTIPO.Value := '00-MERCADORIA PARA REVENDA';
  FrmCadProduto.qryProdutosALIQ_ICM.Value := dados.qryEmpresaALIQ_ICMS.AsFloat;
  FrmCadProduto.qryProdutosALIQ_PIS.Value := dados.qryEmpresaALIQ_PIS.AsFloat;
  FrmCadProduto.qryProdutosALIQ_COF.Value := dados.qryEmpresaALIQ_COF.AsFloat;
  FrmCadProduto.qryProdutosALIQ_IPI.Value := dados.qryEmpresaALIQ_IPI.AsFloat;
  FrmCadProduto.qryProdutosCSTICMS.Value := dados.qryEmpresaCST_ICMS.Value;
  FrmCadProduto.qryProdutosCST_EXTERNO.Value :=
    dados.qryEmpresaCST_EXTERNO.Value;
  FrmCadProduto.qryProdutosCSTE.Value := dados.qryEmpresaCST_ENTRADA.Value;
  FrmCadProduto.qryProdutosCSTS.Value := dados.qryEmpresaCST_SAIDA.Value;
  FrmCadProduto.qryProdutosCSTIPI.Value := dados.qryEmpresaCST_IPI.Value;

  if qryXMLDetailCSOSN.IsNull then
    FrmCadProduto.qryProdutosCSOSN.Value := dados.qryEmpresaCSOSN.Value
  else
    FrmCadProduto.qryProdutosCSOSN.Value := qryXMLDetailCSOSN.Value;

  if (qryXMLDetailCFOP.Value = '5401') or (qryXMLDetailCFOP.Value = '5405') then
  begin
    FrmCadProduto.qryProdutosCFOP.Value := '5405';
    FrmCadProduto.qryProdutosCSOSN.Value := '500';
  end;

  FrmCadProduto.qryProdutosPAGA_COMISSAO.Value := 'N';
  FrmCadProduto.qryProdutosEFISCAL.Value := 'S';
  dados.vCodProduto := 0;

  FrmCadProduto.DBEdit9.ReadOnly := True;
  FrmCadProduto.Tag := 1;
  FrmCadProduto.ShowModal;

  try
    btnCadastrar.Enabled := false;
    if dados.vCodProduto <> 0 then
    begin
      if not(qryXMLDetail.State in dsEditModes) then
        qryXMLDetail.Edit;
      qryXMLDetailID_PRODUTO_LOC.Value := dados.vCodProduto;
      qryXMLDetail.Post;
      dados.Conexao.CommitRetaining;
    end;
  finally
    FrmCadProduto.DBEdit9.ReadOnly := false;
    if FrmCadProduto <> nil then
      FrmCadProduto.Release;
    btnCadastrar.Enabled := True;
    qryXMLDetail.Next;
  end;
end;

procedure TFrmXml.btnCadAutoClick(Sender: TObject);
begin
  if application.messageBox
    ('Desejea cadastrar todos os produtos automaticamente?', 'Confirmação',
    mb_YesNo) <> mrYes then
    exit;

  if not(dados.qryEmpresaAUTO_CADASTRO_PRODUTO.Value = 'S') then
    exit;

  try
    btnCadAuto.Enabled := false;
    qryXMLDetail.First;
    while not qryXMLDetail.Eof do
    begin
      if not(qryXMLDetailID_PRODUTO_LOC.AsInteger > 0) then
      begin
        qryXMLDetail.Edit;
        qryXMLDetailID_PRODUTO_LOC.AsInteger := CadastroProduto;
        qryXMLDetail.Post;
        dados.Conexao.CommitRetaining;

      end;
      qryXMLDetail.Next;
    end;

  finally
    btnCadAuto.Enabled := True;
  end;
end;

procedure TFrmXml.btnDesvincularClick(Sender: TObject);
begin
  try
    if application.messageBox
      ('Tem certeza de que deseja desvincular os produtos desta nota',
      'Confirmação', mb_YesNo) = mrno then
      exit;

    btnDesvincular.Enabled := false;

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'delete from xmlproduto where ID_FORNECEDOR=:idforn and ID_PRODUTO_LOCAL=:id_prod_loc';
    dados.qryExecute.Params[0].Value := qryXmlMasterID_FORNECEDOR.Value;;
    dados.qryExecute.Params[1].Value := qryXMLDetailID_PRODUTO_LOC.Value;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;

    qryXMLDetail.Edit;
    qryXMLDetailID_PRODUTO_LOC.Clear;
    qryXMLDetail.Post;
    dados.Conexao.CommitRetaining;

  finally
    btnDesvincular.Enabled := True;
    qryXMLDetail.EnableControls;
  end;
end;

procedure TFrmXml.btnDesvincularTodosClick(Sender: TObject);
begin
  if application.messageBox
    ('Tem certeza de que deseja desvincular os produtos desta nota',
    'Confirmação', mb_YesNo) = mrno then
    exit;
  try
    btnDesvincularTodos.Enabled := false;
    qryXMLDetail.DisableControls;
    qryXMLDetail.First;
    while not qryXMLDetail.Eof do
    begin
      dados.qryExecute.Close;
      dados.qryExecute.SQL.Clear;
      dados.qryExecute.SQL.Text :=
        'delete from xmlproduto where ID_FORNECEDOR=:idforn and ID_PRODUTO_LOCAL=:id_prod_loc';
      dados.qryExecute.Params[0].Value := qryXmlMasterID_FORNECEDOR.Value;;
      dados.qryExecute.Params[1].Value := qryXMLDetailID_PRODUTO_LOC.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Clear;
      dados.qryExecute.SQL.Text :=
        'update XML_DETAIL set ID_PRODUTO_LOC=null  where CODIGO=:id';
      dados.qryExecute.Params[0].Value := qryXMLDetailCODIGO.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      qryXMLDetail.Next;
    end;

  finally
    btnDesvincularTodos.Enabled := True;
    qryXMLDetail.EnableControls;
    qryXMLDetail.Refresh;
  end;
end;

end.
