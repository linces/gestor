unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, TDI, acbrUtil, ACBrBase, ACBrDFe, ACBrNFe,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ComCtrls, IdBaseComponent, IdComponent, IdIPWatch, dateutils, serial,
  Vcl.StdCtrls, frxClass, frxDBSet, frxExportPDF, Vcl.Imaging.pngimage,
  shellapi,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxExportBaseDialog, System.Threading, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Vcl.AppEvnts, JvExControls,
  JvSpeedButton, Vcl.ExtDlgs, JvComponentBase, JvThreadTimer, LockApplication;

type
  TfrmPrincipal = class(TForm)
    MmPrincipal: TMainMenu;
    MnAdministrativo: TMenuItem;
    MnEmpresa: TMenuItem;
    MnPessoas: TMenuItem;
    MNFinanceiro: TMenuItem;
    MnSair: TMenuItem;
    MnTroca: TMenuItem;
    MnCaixa: TMenuItem;
    MnCR: TMenuItem;
    MnUsuarios: TMenuItem;
    MNCP: TMenuItem;
    MnMovimento: TMenuItem;
    N6: TMenuItem;
    MnSistema: TMenuItem;
    MNGrupo: TMenuItem;
    MNPlano: TMenuItem;
    MnCompra: TMenuItem;
    MnBackup: TMenuItem;
    MNContas: TMenuItem;
    MnTransfConta: TMenuItem;
    IdIPWatch1: TIdIPWatch;
    MnPDV: TMenuItem;
    MnOramento: TMenuItem;
    MNFPG: TMenuItem;
    MNEstoque: TMenuItem;
    MNProdutos: TMenuItem;
    MNUnidades: TMenuItem;
    N2: TMenuItem;
    MNAcerta: TMenuItem;
    N3: TMenuItem;
    MNSaldo: TMenuItem;
    MNListaConfEstoque: TMenuItem;
    MNEstoqueMinimo: TMenuItem;
    N4: TMenuItem;
    MNInventrio: TMenuItem;
    MNHistoricoProduto: TMenuItem;
    MNEstoqueNegativo: TMenuItem;
    MnRecibo: TMenuItem;
    N1: TMenuItem;
    MNHistoricodeVendas1: TMenuItem;
    MNHistoricodeCompras1: TMenuItem;
    N7: TMenuItem;
    MnRelatriodeLivroCaixa: TMenuItem;
    MnRelatriodeContasReceber: TMenuItem;
    MnRelatriodeContasPagar: TMenuItem;
    N8: TMenuItem;
    MnListagemdeCompras: TMenuItem;
    MnListadeOramento: TMenuItem;
    MnListagemdeVendas: TMenuItem;
    MnConfig: TMenuItem;
    MnFiscal: TMenuItem;
    MnNFCe: TMenuItem;
    MnNFe: TMenuItem;
    MNHistoricodeVendas2: TMenuItem;
    MNVendedores: TMenuItem;
    MnAlterarSenha: TMenuItem;
    MMPermisses: TMenuItem;
    qryPermissoes: TFDQuery;
    qryPermissoesVISUALIZAR: TStringField;
    qryPermissoesTELA: TStringField;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBEstoqueNegativoR: TfrxDBDataset;
    qryEstoqueReal: TFDQuery;
    qryEstoqueFiscal: TFDQuery;
    frxDBEstoqueNegativoF: TfrxDBDataset;
    frxDBEstoqueMinimo: TfrxDBDataset;
    qryEstoqueMinimo: TFDQuery;
    qryClientesRestricoes: TFDQuery;
    qryClientesRestricoesCODIGO: TIntegerField;
    qryClientesRestricoesRAZAO: TStringField;
    qryClientesRestricoesCCF: TStringField;
    qryClientesRestricoesSPC: TStringField;
    qryClientesRestricoesFONE1: TStringField;
    qryClientesRestricoesFONE2: TStringField;
    qryClientesRestricoesCELULAR1: TStringField;
    qryClientesRestricoesCELULAR2: TStringField;
    frxDBRestricoes: TfrxDBDataset;
    MNListaSPCCCF: TMenuItem;
    qryConferencia: TFDQuery;
    N9: TMenuItem;
    MNProdutosMaisVendidos: TMenuItem;
    MNProdutosmaislucrativos: TMenuItem;
    MNProdutosmenosvendidos: TMenuItem;
    MNProdutosmenoslucrativos: TMenuItem;
    N10: TMenuItem;
    MNFichadeCliente: TMenuItem;
    MNDiriodeCaixa: TMenuItem;
    MNZeraEstoqueNegativo: TMenuItem;
    N11: TMenuItem;
    MNFluxodeCaixa: TMenuItem;
    MNComissodeVendedores: TMenuItem;
    MNMapadeAnliseFinanceira: TMenuItem;
    MNDevoluodeMercadoria: TMenuItem;
    MNAjustaPreco: TMenuItem;
    N5: TMenuItem;
    MNImportarNFCe: TMenuItem;
    frxDBConferencia: TfrxDBDataset;
    MNCFOP1: TMenuItem;
    MnCTEOS: TMenuItem;
    MNTransportadora: TMenuItem;
    MNMotorista: TMenuItem;
    MnTomador: TMenuItem;
    MNCFOP: TMenuItem;
    N13: TMenuItem;
    MNIBPT: TMenuItem;
    MNBalanoFinanceiro: TMenuItem;
    MNCurvaABC: TMenuItem;
    MNTabelaPreco: TMenuItem;
    MNBalanca: TMenuItem;
    MNTabelaICMS: TMenuItem;
    MNCTe: TMenuItem;
    MnMDFe: TMenuItem;
    MnVeiculos: TMenuItem;
    N15: TMenuItem;
    MNPedidodeSementes: TMenuItem;
    MNPedidodeSal: TMenuItem;
    MNRelvendaProd: TMenuItem;
    N14: TMenuItem;
    MNSpedFiscal: TMenuItem;
    MNSpedContribuies: TMenuItem;
    MnContador: TMenuItem;
    MnOS: TMenuItem;
    MNEnviarSped: TMenuItem;
    MNNotasFornecedorLerXML: TMenuItem;
    MnDestinatario: TMenuItem;
    MnRemetente: TMenuItem;
    MNServicos: TMenuItem;
    MNAjustaMenu: TMenuItem;
    MNVendas: TMenuItem;
    qryEstoqueRealCODIGO: TIntegerField;
    qryEstoqueRealTIPO: TStringField;
    qryEstoqueRealCODBARRA: TStringField;
    qryEstoqueRealREFERENCIA: TStringField;
    qryEstoqueRealGRUPO: TIntegerField;
    qryEstoqueRealUNIDADE: TStringField;
    qryEstoqueRealULTFORN: TIntegerField;
    qryEstoqueRealLOCALIZACAO: TStringField;
    qryEstoqueRealALIQ_ICM: TCurrencyField;
    qryEstoqueRealALIQ_PIS: TCurrencyField;
    qryEstoqueRealALIQ_COF: TCurrencyField;
    qryEstoqueRealPR_CUSTO: TFMTBCDField;
    qryEstoqueRealMARGEM: TCurrencyField;
    qryEstoqueRealPR_VENDA: TFMTBCDField;
    qryEstoqueRealQTD_ATUAL: TFMTBCDField;
    qryEstoqueRealQTD_MIN: TFMTBCDField;
    qryEstoqueRealE_MEDIO: TFMTBCDField;
    qryEstoqueRealCSTICMS: TStringField;
    qryEstoqueRealCSTE: TStringField;
    qryEstoqueRealCSTS: TStringField;
    qryEstoqueRealCSTIPI: TStringField;
    qryEstoqueRealCSOSN: TStringField;
    qryEstoqueRealNCM: TStringField;
    qryEstoqueRealCOMISSAO: TCurrencyField;
    qryEstoqueRealDESCONTO: TCurrencyField;
    qryEstoqueRealFOTO: TBlobField;
    qryEstoqueRealATIVO: TStringField;
    qryEstoqueRealCFOP: TStringField;
    qryEstoqueRealPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryEstoqueRealPR_VENDA_ANTERIOR: TFMTBCDField;
    qryEstoqueRealULT_COMPRA: TIntegerField;
    qryEstoqueRealULT_COMPRA_ANTERIOR: TIntegerField;
    qryEstoqueRealPRECO_ATACADO: TFMTBCDField;
    qryEstoqueRealQTD_ATACADO: TFMTBCDField;
    qryEstoqueRealCOD_BARRA_ATACADO: TStringField;
    qryEstoqueRealALIQ_IPI: TFMTBCDField;
    qryEstoqueRealEMPRESA: TSmallintField;
    qryEstoqueRealCEST: TStringField;
    qryEstoqueRealGRADE: TStringField;
    qryEstoqueRealEFISCAL: TStringField;
    qryEstoqueRealPAGA_COMISSAO: TStringField;
    qryEstoqueRealPESO: TFMTBCDField;
    qryEstoqueRealCOMPOSICAO: TStringField;
    qryEstoqueRealPRECO_PROMO_ATACADO: TFMTBCDField;
    qryEstoqueRealPRECO_PROMO_VAREJO: TFMTBCDField;
    qryEstoqueRealINICIO_PROMOCAO: TDateField;
    qryEstoqueRealFIM_PROMOCAO: TDateField;
    qryEstoqueRealESTOQUE_INICIAL: TFMTBCDField;
    qryEstoqueRealPR_VENDA_PRAZO: TFMTBCDField;
    qryEstoqueRealPRECO_VARIAVEL: TStringField;
    qryEstoqueRealAPLICACAO: TStringField;
    qryEstoqueRealREDUCAO_BASE: TFMTBCDField;
    qryEstoqueRealMVA: TFMTBCDField;
    qryEstoqueRealFCP: TFMTBCDField;
    qryEstoqueRealPRODUTO_PESADO: TStringField;
    qryEstoqueRealSERVICO: TStringField;
    qryEstoqueRealDT_CADASTRO: TDateField;
    qryEstoqueRealDESCRICAO: TStringField;
    qryEstoqueRealPR_CUSTO2: TFMTBCDField;
    qryEstoqueRealPERC_CUSTO: TFMTBCDField;
    qryEstoqueMinimoCODIGO: TIntegerField;
    qryEstoqueMinimoTIPO: TStringField;
    qryEstoqueMinimoCODBARRA: TStringField;
    qryEstoqueMinimoREFERENCIA: TStringField;
    qryEstoqueMinimoGRUPO: TIntegerField;
    qryEstoqueMinimoUNIDADE: TStringField;
    qryEstoqueMinimoULTFORN: TIntegerField;
    qryEstoqueMinimoLOCALIZACAO: TStringField;
    qryEstoqueMinimoALIQ_ICM: TCurrencyField;
    qryEstoqueMinimoALIQ_PIS: TCurrencyField;
    qryEstoqueMinimoALIQ_COF: TCurrencyField;
    qryEstoqueMinimoPR_CUSTO: TFMTBCDField;
    qryEstoqueMinimoMARGEM: TCurrencyField;
    qryEstoqueMinimoPR_VENDA: TFMTBCDField;
    qryEstoqueMinimoQTD_ATUAL: TFMTBCDField;
    qryEstoqueMinimoQTD_MIN: TFMTBCDField;
    qryEstoqueMinimoE_MEDIO: TFMTBCDField;
    qryEstoqueMinimoCSTICMS: TStringField;
    qryEstoqueMinimoCSTE: TStringField;
    qryEstoqueMinimoCSTS: TStringField;
    qryEstoqueMinimoCSTIPI: TStringField;
    qryEstoqueMinimoCSOSN: TStringField;
    qryEstoqueMinimoNCM: TStringField;
    qryEstoqueMinimoCOMISSAO: TCurrencyField;
    qryEstoqueMinimoDESCONTO: TCurrencyField;
    qryEstoqueMinimoFOTO: TBlobField;
    qryEstoqueMinimoATIVO: TStringField;
    qryEstoqueMinimoCFOP: TStringField;
    qryEstoqueMinimoPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryEstoqueMinimoPR_VENDA_ANTERIOR: TFMTBCDField;
    qryEstoqueMinimoULT_COMPRA: TIntegerField;
    qryEstoqueMinimoULT_COMPRA_ANTERIOR: TIntegerField;
    qryEstoqueMinimoPRECO_ATACADO: TFMTBCDField;
    qryEstoqueMinimoQTD_ATACADO: TFMTBCDField;
    qryEstoqueMinimoCOD_BARRA_ATACADO: TStringField;
    qryEstoqueMinimoALIQ_IPI: TFMTBCDField;
    qryEstoqueMinimoEMPRESA: TSmallintField;
    qryEstoqueMinimoCEST: TStringField;
    qryEstoqueMinimoGRADE: TStringField;
    qryEstoqueMinimoEFISCAL: TStringField;
    qryEstoqueMinimoPAGA_COMISSAO: TStringField;
    qryEstoqueMinimoPESO: TFMTBCDField;
    qryEstoqueMinimoCOMPOSICAO: TStringField;
    qryEstoqueMinimoPRECO_PROMO_ATACADO: TFMTBCDField;
    qryEstoqueMinimoPRECO_PROMO_VAREJO: TFMTBCDField;
    qryEstoqueMinimoINICIO_PROMOCAO: TDateField;
    qryEstoqueMinimoFIM_PROMOCAO: TDateField;
    qryEstoqueMinimoESTOQUE_INICIAL: TFMTBCDField;
    qryEstoqueMinimoPR_VENDA_PRAZO: TFMTBCDField;
    qryEstoqueMinimoPRECO_VARIAVEL: TStringField;
    qryEstoqueMinimoAPLICACAO: TStringField;
    qryEstoqueMinimoREDUCAO_BASE: TFMTBCDField;
    qryEstoqueMinimoMVA: TFMTBCDField;
    qryEstoqueMinimoFCP: TFMTBCDField;
    qryEstoqueMinimoPRODUTO_PESADO: TStringField;
    qryEstoqueMinimoSERVICO: TStringField;
    qryEstoqueMinimoDT_CADASTRO: TDateField;
    qryEstoqueMinimoDESCRICAO: TStringField;
    qryEstoqueMinimoPR_CUSTO2: TFMTBCDField;
    qryEstoqueMinimoPERC_CUSTO: TFMTBCDField;
    qryConferenciaCODIGO: TIntegerField;
    qryConferenciaTIPO: TStringField;
    qryConferenciaCODBARRA: TStringField;
    qryConferenciaREFERENCIA: TStringField;
    qryConferenciaGRUPO: TIntegerField;
    qryConferenciaUNIDADE: TStringField;
    qryConferenciaULTFORN: TIntegerField;
    qryConferenciaLOCALIZACAO: TStringField;
    qryConferenciaALIQ_ICM: TCurrencyField;
    qryConferenciaALIQ_PIS: TCurrencyField;
    qryConferenciaALIQ_COF: TCurrencyField;
    qryConferenciaPR_CUSTO: TFMTBCDField;
    qryConferenciaMARGEM: TCurrencyField;
    qryConferenciaPR_VENDA: TFMTBCDField;
    qryConferenciaQTD_ATUAL: TFMTBCDField;
    qryConferenciaQTD_MIN: TFMTBCDField;
    qryConferenciaE_MEDIO: TFMTBCDField;
    qryConferenciaCSTICMS: TStringField;
    qryConferenciaCSTE: TStringField;
    qryConferenciaCSTS: TStringField;
    qryConferenciaCSTIPI: TStringField;
    qryConferenciaCSOSN: TStringField;
    qryConferenciaNCM: TStringField;
    qryConferenciaCOMISSAO: TCurrencyField;
    qryConferenciaDESCONTO: TCurrencyField;
    qryConferenciaFOTO: TBlobField;
    qryConferenciaATIVO: TStringField;
    qryConferenciaCFOP: TStringField;
    qryConferenciaPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryConferenciaPR_VENDA_ANTERIOR: TFMTBCDField;
    qryConferenciaULT_COMPRA: TIntegerField;
    qryConferenciaULT_COMPRA_ANTERIOR: TIntegerField;
    qryConferenciaPRECO_ATACADO: TFMTBCDField;
    qryConferenciaQTD_ATACADO: TFMTBCDField;
    qryConferenciaCOD_BARRA_ATACADO: TStringField;
    qryConferenciaALIQ_IPI: TFMTBCDField;
    qryConferenciaEMPRESA: TSmallintField;
    qryConferenciaCEST: TStringField;
    qryConferenciaGRADE: TStringField;
    qryConferenciaEFISCAL: TStringField;
    qryConferenciaPAGA_COMISSAO: TStringField;
    qryConferenciaPESO: TFMTBCDField;
    qryConferenciaCOMPOSICAO: TStringField;
    qryConferenciaPRECO_PROMO_ATACADO: TFMTBCDField;
    qryConferenciaPRECO_PROMO_VAREJO: TFMTBCDField;
    qryConferenciaINICIO_PROMOCAO: TDateField;
    qryConferenciaFIM_PROMOCAO: TDateField;
    qryConferenciaESTOQUE_INICIAL: TFMTBCDField;
    qryConferenciaPR_VENDA_PRAZO: TFMTBCDField;
    qryConferenciaPRECO_VARIAVEL: TStringField;
    qryConferenciaAPLICACAO: TStringField;
    qryConferenciaREDUCAO_BASE: TFMTBCDField;
    qryConferenciaMVA: TFMTBCDField;
    qryConferenciaFCP: TFMTBCDField;
    qryConferenciaPRODUTO_PESADO: TStringField;
    qryConferenciaSERVICO: TStringField;
    qryConferenciaDT_CADASTRO: TDateField;
    qryConferenciaDESCRICAO: TStringField;
    qryConferenciaPR_CUSTO2: TFMTBCDField;
    qryConferenciaPERC_CUSTO: TFMTBCDField;
    MMAjuda: TMenuItem;
    MNTeinamentos: TMenuItem;
    BalloonHint1: TBalloonHint;
    Label1: TLabel;
    MnMesas: TMenuItem;
    DevoluodeCompra1: TMenuItem;
    ResumoCaixa1: TMenuItem;
    MnMarca: TMenuItem;
    MNRelatriodeCartao: TMenuItem;
    MNTipodeTecido: TMenuItem;
    RelatrioporPlanodeContas1: TMenuItem;
    MNSintegra: TMenuItem;
    MnImportaXMLCo: TMenuItem;
    Etiquetas1: TMenuItem;
    N16: TMenuItem;
    MnExecuteScript: TMenuItem;
    MnFecharJanelas: TMenuItem;
    MnEntregador: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    MnListaCorrecoes: TMenuItem;
    N18: TMenuItem;
    InventrioporCSOSNCST1: TMenuItem;
    mnTabelasCampos: TMenuItem;
    MnAtualiza: TMenuItem;
    N17: TMenuItem;
    MnBoleto: TMenuItem;
    Configurao1: TMenuItem;
    Remessa1: TMenuItem;
    Retorno1: TMenuItem;
    OpenPicture: TOpenPictureDialog;
    SoftHouse1: TMenuItem;
    MNRelatriodeEstoqueGrade: TMenuItem;
    qryEstoqueGrade: TFDQuery;
    qryEstoqueGradeCODIGO: TIntegerField;
    qryEstoqueGradeDESCRICAO: TStringField;
    qryEstoqueGradeGRADE: TStringField;
    qryEstoqueGradeQTD: TFMTBCDField;
    qryEstoqueGradePRECO: TFMTBCDField;
    frxDBEstoqueGrade: TfrxDBDataset;
    qryComposicao_M: TFDQuery;
    qryComposicao_D: TFDQuery;
    qryComposicao_DID_PRODUTO: TIntegerField;
    qryComposicao_DDESCRICAO: TStringField;
    qryComposicao_DQUANTIDADE: TFMTBCDField;
    qryComposicao_DPRECO: TFMTBCDField;
    qryComposicao_MCODIGO: TIntegerField;
    qryComposicao_MDESCRICAO: TStringField;
    qryComposicao_MQTD_ATUAL: TFMTBCDField;
    qryComposicao_MPR_VENDA: TFMTBCDField;
    frxDBComposicao_M: TfrxDBDataset;
    frxDBComposicao_D: TfrxDBDataset;
    MNRelatriodeEstoqueComposio: TMenuItem;
    dsComposicao_M: TDataSource;
    erminais1: TMenuItem;
    MnRelVendasProdClie: TMenuItem;
    MnRelVendasProdVdd: TMenuItem;
    MnRelEstoqueFiscal: TMenuItem;
    MnRelProdPrecoAlterados1: TMenuItem;
    AjustaEstoqueFiscal1: TMenuItem;
    N12: TMenuItem;
    AjustaSaldodeEstoqueFiscal1: TMenuItem;
    MNRelVendasCFOPCSOSN1: TMenuItem;
    RelaVdProdMono: TMenuItem;
    ImportarNFeVenda1: TMenuItem;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    FabricarProduto1: TMenuItem;
    MnAjustaCampos: TMenuItem;
    Panel1: TPanel;
    btnCaixa: TSpeedButton;
    btnOrcamento: TSpeedButton;
    btnBackup: TSpeedButton;
    btnSair: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnReceber: TSpeedButton;
    btnPessoas: TSpeedButton;
    btnCompra: TSpeedButton;
    btnPagar: TSpeedButton;
    btnPDV: TSpeedButton;
    BtnCTe: TSpeedButton;
    btnNFe: TSpeedButton;
    btnMDFe: TSpeedButton;
    Timer2: TTimer;
    Timer3: TTimer;
    Regs1: TMenuItem;
    mnEnviarMensagem: TMenuItem;
    ClassificaodeSementes1: TMenuItem;
    Image1: TImage;
    Label2: TLabel;
    Delivery1: TMenuItem;
    Restaurante1: TMenuItem;
    HistricodeVendaspFornecedor1: TMenuItem;
    Bloqu: TLockApplication;
    procedure btnPessoasClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure MnPessoasClick(Sender: TObject);
    procedure MNGrupoClick(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure Visitantes1Click(Sender: TObject);
    procedure MNContasClick(Sender: TObject);
    procedure MNPlanoClick(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure MnCaixaClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnCompraClick(Sender: TObject);
    procedure MNCPClick(Sender: TObject);
    procedure MnCRClick(Sender: TObject);
    procedure MnCompraClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure MnTrocaClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure MnUsuariosClick(Sender: TObject);
    procedure MnEmpresaClick(Sender: TObject);
    procedure Permisses1Click(Sender: TObject);
    procedure MNUnidadesClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure MNFPGClick(Sender: TObject);
    procedure MNProdutosClick(Sender: TObject);
    procedure MnOramentoClick(Sender: TObject);
    procedure MnPDVClick(Sender: TObject);
    procedure MnConfigClick(Sender: TObject);
    procedure MnNFCeClick(Sender: TObject);
    procedure btnPDVClick(Sender: TObject);
    procedure MNHistoricodeVendas1Click(Sender: TObject);
    procedure MNHistoricodeVendas2Click(Sender: TObject);
    procedure MNHistoricodeCompras1Click(Sender: TObject);
    procedure MNAcertaClick(Sender: TObject);
    procedure MNSaldoClick(Sender: TObject);
    procedure MNHistoricoProdutoClick(Sender: TObject);
    procedure MnNFeClick(Sender: TObject);
    procedure MnTransportadorasClick(Sender: TObject);
    procedure MMPermissesClick(Sender: TObject);
    procedure MnAlterarSenhaClick(Sender: TObject);
    procedure MnListadeOramentoClick(Sender: TObject);
    procedure MNEstoqueMinimoClick(Sender: TObject);
    procedure MNListaSPCCCFClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure MNListaConfEstoqueClick(Sender: TObject);
    procedure MNEstoqueNegativoClick(Sender: TObject);
    procedure MNProdutosMaisVendidosClick(Sender: TObject);
    procedure MNProdutosmenosvendidosClick(Sender: TObject);
    procedure MNProdutosmaislucrativosClick(Sender: TObject);
    procedure MNProdutosmenoslucrativosClick(Sender: TObject);
    procedure MnRelatriodeLivroCaixaClick(Sender: TObject);
    procedure MnRelatriodeContasReceberClick(Sender: TObject);
    procedure MNFichadeClienteClick(Sender: TObject);
    procedure MNInventrioClick(Sender: TObject);
    procedure MNZeraEstoqueNegativoClick(Sender: TObject);
    procedure MnRelatriodeContasPagarClick(Sender: TObject);
    procedure MnListagemdeVendasClick(Sender: TObject);
    procedure MnListagemdeComprasClick(Sender: TObject);
    procedure MnReciboClick(Sender: TObject);
    procedure MNDiriodeCaixaClick(Sender: TObject);
    procedure MNAjustaPrecoClick(Sender: TObject);
    procedure MNMapadeAnliseFinanceiraClick(Sender: TObject);
    procedure MNFluxodeCaixaClick(Sender: TObject);
    procedure MnTransfContaClick(Sender: TObject);
    procedure MNComissodeVendedoresClick(Sender: TObject);
    procedure MNImportarNFCeClick(Sender: TObject);
    procedure MNDevoluodeMercadoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MnBackupClick(Sender: TObject);
    procedure MNCFOP1Click(Sender: TObject);
    procedure MnCTEOSClick(Sender: TObject);
    procedure MNMotoristaClick(Sender: TObject);
    procedure MnTomadorClick(Sender: TObject);
    procedure MNCFOPClick(Sender: TObject);
    procedure MNIBPTClick(Sender: TObject);
    procedure MNBalanoFinanceiroClick(Sender: TObject);
    procedure MNVendedoresClick(Sender: TObject);
    procedure MNCurvaABCClick(Sender: TObject);
    procedure MNTabelaPrecoClick(Sender: TObject);
    procedure MNBalancaClick(Sender: TObject);
    procedure MNTabelaICMSClick(Sender: TObject);
    procedure btnNFeClick(Sender: TObject);
    procedure MnVeiculosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCTeClick(Sender: TObject);
    procedure MnHistoricodeUsuriosClick(Sender: TObject);
    procedure MNPedidodeSementesClick(Sender: TObject);
    procedure MNPedidodeSalClick(Sender: TObject);
    procedure MNRelvendaProdClick(Sender: TObject);
    procedure MNSpedFiscalClick(Sender: TObject);
    procedure MNSpedContribuiesClick(Sender: TObject);
    procedure MnContadorClick(Sender: TObject);
    procedure MNEnviarSpedClick(Sender: TObject);
    procedure MNCTeClick(Sender: TObject);
    procedure MNNotasFornecedorLerXMLClick(Sender: TObject);
    procedure MnDestinatarioClick(Sender: TObject);
    procedure MnRemetenteClick(Sender: TObject);
    procedure MnMDFeClick(Sender: TObject);
    procedure btnMDFeClick(Sender: TObject);
    procedure MNServicosClick(Sender: TObject);
    procedure MNAjustaMenuClick(Sender: TObject);
    procedure MNVendasClick(Sender: TObject);
    procedure MNRegistrarClick(Sender: TObject);
    procedure MNTeinamentosClick(Sender: TObject);
    procedure MNSincronizarClick(Sender: TObject);
    procedure MNPedidosWebClick(Sender: TObject);
    procedure MnMesasClick(Sender: TObject);
    procedure DevoluodeCompra1Click(Sender: TObject);
    procedure ResumoCaixa1Click(Sender: TObject);
    procedure MnMarcaClick(Sender: TObject);
    procedure btnPessoasMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnPessoasMouseLeave(Sender: TObject);
    procedure MNRelatriodeCartaoClick(Sender: TObject);
    procedure MNTipodeTecidoClick(Sender: TObject);
    procedure RelatrioporPlanodeContas1Click(Sender: TObject);
    procedure MNSintegraClick(Sender: TObject);
    procedure MnImportaXMLCoClick(Sender: TObject);
    procedure MNAtualizaoClick(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure MnExecuteScriptClick(Sender: TObject);
    procedure MnFecharJanelasClick(Sender: TObject);
    procedure MnEntregadorClick(Sender: TObject);
    procedure ListaLCP1161Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure MnListaCorrecoesClick(Sender: TObject);
    procedure InventrioporCSOSNCST1Click(Sender: TObject);
    procedure MnAtualizaClick(Sender: TObject);
    procedure mnTabelasCamposClick(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure Remessa1Click(Sender: TObject);
    procedure Retorno1Click(Sender: TObject);
    procedure SoftHouse1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure MNRelatriodeEstoqueGradeClick(Sender: TObject);
    procedure MNRelatriodeEstoqueComposioClick(Sender: TObject);
    procedure dsComposicao_MDataChange(Sender: TObject; Field: TField);
    procedure erminais1Click(Sender: TObject);
    procedure MnRelVendasProdClieClick(Sender: TObject);
    procedure MnRelVendasProdVddClick(Sender: TObject);
    procedure MnRelEstoqueFiscalClick(Sender: TObject);
    procedure MnRelProdPrecoAlterados1Click(Sender: TObject);
    procedure AjustaEstoqueFiscal1Click(Sender: TObject);
    procedure AjustaSaldodeEstoqueFiscal1Click(Sender: TObject);
    procedure MNRelVendasCFOPCSOSN1Click(Sender: TObject);
    procedure RelaVdProdMonoClick(Sender: TObject);
    procedure ImportarNFeVenda1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
    procedure FabricarProduto1Click(Sender: TObject);
    procedure MnAjustaCamposClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Regs1Click(Sender: TObject);
    procedure mnEnviarMensagemClick(Sender: TObject);
    procedure ClassificaodeSementes1Click(Sender: TObject);
    procedure Delivery1Click(Sender: TObject);
    procedure Restaurante1Click(Sender: TObject);
    procedure HistricodeVendaspFornecedor1Click(Sender: TObject);
  private
    function ChamaLogin: Boolean;
    function VerificarExisteConexaoComInternet: Boolean;
    function CriaEmpresa: Boolean;
    procedure CarregaTabelas;
    procedure ConfiguraPais;
    procedure TituloEmpresa;
    procedure InserePermissoes;
    procedure ChecaAtualizacao;
    procedure VerificaBackup;
    procedure LicencaOnline;
    procedure CarregaImagem;
    procedure ChamaPDV;
    { Private declarations }
  public
    procedure ConfiguraSistema;
    procedure CarregaSistema;
    procedure InsereTela;
    procedure AjustaPermissoes;
    procedure HabilitaMenus;
    procedure DesabilitaMenus;
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  FTDI: TTDI;

implementation

{$R *.dfm}

uses WinInet, uProdutos, uPessoa, uGrupo, uUnidade, uContas, UpLANO, uCaixa,
  uConsReceber, uConsPagar, uCompra, uAcesso, U_Backup, UUsuarios,
  uEmpresa, Udados, uPermissoes, uOrcamento, UPagamento, uPDV, uConfig, uResumo,
  uNFCe, uParametros, uAcertaEstoque, AcertaSaldo, uHistoricoPorduto, uChave,
  uConsNFe, uTransportador, uVendedores, utrocaSenha, uParOrcamento,
  uParProduto, uParCaixa, uParReceber, uConsEmpresa, uPedidoVenda,
  uFichaCliente, uInvent·rio, uZeraEstoqueNegativo, uParPagar, uRecibo,
  uParDiario, uAjustaPreco, uParFPG, uParFinanceiro, uTransferencia,
  uParComissao, uImportarXML, uDevolucao, uDadosWeb,
  UCFOP, uParProdutoFiscal, uTomador, uIBPT, uParBalanco,
  uParCurvaABC, uTabelaPreco, uBalanca, uICMS, uVeiculos, uConsCTe, uPedido,
  uHistorico_Usuario, uHistoricoVendaProduto, uGeraSF, uGeraSP, uContador,
  uEmail, uConsCTe_RodoViario, uManifesto, uDestinatario, uRemetente, uConsMDFe,
  uConsOS, uSincronizar, uPedidoWeb, uMesas, uDevolucaoCompra, uParResumoCaixa,
  uMarca, uPrincipio_Ativo, uRespTecnico, uParFinanceiroCartao, uTipoTecido,
  uConsOS_Roupa, uParPlanoConta, uSintegra, uImportarCompra,
  uAtualizadorAutomatico, uExecute, uEtiquetas, uScript, uEntregador,
  uLCP, uTradutor, uCorrecoes, uParInventarioImposto, uSat,
  ufrmCBRconfig, ufrmRETORNOmanutencao, ufrmREMESSAmanutencao, uTerminais,
  uHistoricoVendaProduto_Cliente, uHistoricoVendaProduto_Vdd, uParEstoqueFiscal,
  uParPreco, uParCFOP_CSOSN, uParMonofasico, uImportarXMLNFe, uFabricarProduto,
  uClassificacao_Master, uSplash;

function RemoveAcento(Str: string): string;
const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  X: Integer;
begin;
  for X := 1 to Length(Str) do
    if Pos(Str[X], ComAcento) <> 0 then
      Str[X] := SemAcento[Pos(Str[X], ComAcento)];
  Result := Str;
end;

procedure TfrmPrincipal.MNIBPTClick(Sender: TObject);
begin
  try

    frmibpt := Tfrmibpt.Create(Application);
    frmibpt.ShowModal;
  finally
    frmibpt.Release;
  end;
end;

procedure TfrmPrincipal.MNImportarNFCeClick(Sender: TObject);
begin
  try
    frmImportaXML := TfrmImportaXML.Create(Application);
    frmImportaXML.ShowModal;
  finally
    frmImportaXML.Release;
  end;
end;

procedure TfrmPrincipal.MnImportaXMLCoClick(Sender: TObject);
begin
  try
    frmImportaCompra := TfrmImportaCompra.Create(Application);
    frmImportaCompra.ShowModal;
  finally
    frmImportaCompra.Release;
  end;
end;

procedure TfrmPrincipal.CarregaImagem;
begin

  if not Dados.qryParametro.Active then
    Dados.qryParametro.Open;

  if FileExists(Dados.qryParametro.FieldByName('TELA_FUNDO').AsString) then
  begin
    Image1.Picture.LoadFromFile(Dados.qryParametro.FieldByName('TELA_FUNDO')
      .AsString);
  end;

end;

procedure TfrmPrincipal.Image1DblClick(Sender: TObject);
begin
  OpenPicture.Execute;
  if Trim(OpenPicture.FileName) <> '' then
  begin

    Dados.qryParametro.Edit;
    Dados.qryParametro.FieldByName('TELA_FUNDO').AsString :=
      OpenPicture.FileName;
    Dados.qryParametro.Post;
    Dados.Conexao.CommitRetaining;

    CarregaImagem;

  end;
end;

procedure TfrmPrincipal.ImportarNFeVenda1Click(Sender: TObject);
begin
  try
    frmImportaXMLNFe := TfrmImportaXMLNFe.Create(Application);
    frmImportaXMLNFe.ShowModal;
  finally
    frmImportaXMLNFe.Release;
  end;
end;

procedure TfrmPrincipal.InsereTela;
var
  nivel, i, j, k, l, cont, cont1: Integer;

begin
  // esta funÁ„o percorre menu e sub menus e insere na tela
  try
    Dados.qryUpdate.Close;
    Dados.qryUpdate.SQL.Clear;
    Dados.qryUpdate.SQL.Add('UPDATE OR INSERT INTO TELAS (');
    Dados.qryUpdate.SQL.Add('CODIGO,');
    Dados.qryUpdate.SQL.Add('TELA,');
    Dados.qryUpdate.SQL.Add('NIVEL,');
    Dados.qryUpdate.SQL.Add('PAI,');
    Dados.qryUpdate.SQL.Add('NOME,');
    Dados.qryUpdate.SQL.Add('FLAG');
    Dados.qryUpdate.SQL.Add(')');
    Dados.qryUpdate.SQL.Add('VALUES');
    Dados.qryUpdate.SQL.Add('(');
    Dados.qryUpdate.SQL.Add(':CODIGO,');
    Dados.qryUpdate.SQL.Add(':TELA,');
    Dados.qryUpdate.SQL.Add(':NIVEL,');
    Dados.qryUpdate.SQL.Add(':PAI,');
    Dados.qryUpdate.SQL.Add(':NOME,');
    Dados.qryUpdate.SQL.Add(':FLAG)');
    Dados.qryUpdate.SQL.Add('MATCHING (CODIGO)');

    Dados.QryTelas.Close;
    Dados.QryTelas.Open;

    for i := 0 to MmPrincipal.items.Count - 1 do
    begin // verifica menu principal
      if not(Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].Name, []))
      then
      begin
        if (MmPrincipal.items.items[i].Caption <> '-') then
        begin
          Dados.qryUpdate.Close;
          Dados.qryUpdate.ParamByName('CODIGO').Value :=
            Dados.Numerador('TELAS', 'CODIGO', 'N', 'N', 'N');
          Dados.qryUpdate.ParamByName('TELA').Value :=
            MmPrincipal.items.items[i].Name;
          Dados.qryUpdate.ParamByName('NOME').Value :=
            RemoveAcento(MmPrincipal.items.items[i].Caption);
          Dados.qryUpdate.ParamByName('NIVEL').Value := 0;
          Dados.qryUpdate.ParamByName('FLAG').Value := 'S';
          Dados.qryUpdate.ParamByName('PAI').Value := i;
          Dados.qryUpdate.ExecSQL;
          Dados.Conexao.CommitRetaining;
        end;
      end
      else
      begin
        Dados.qryUpdate.Close;
        Dados.qryUpdate.ParamByName('CODIGO').Value :=
          Dados.QryTelas.FieldByName('CODIGO').Value;
        Dados.qryUpdate.ParamByName('TELA').Value :=
          MmPrincipal.items.items[i].Name;
        Dados.qryUpdate.ParamByName('NOME').Value :=
          RemoveAcento(MmPrincipal.items.items[i].Caption);
        Dados.qryUpdate.ParamByName('NIVEL').Value := 0;
        Dados.qryUpdate.ParamByName('PAI').Value := i;
        Dados.qryUpdate.ExecSQL;
        Dados.Conexao.CommitRetaining;
      end;

    end;

    for i := 0 to MmPrincipal.items.Count - 1 do
    begin // menu principal
      for j := 0 to MmPrincipal.items.items[i].Count - 1 do
      begin // verifica submenu 1∫ nivel
        if not(Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].items[j]
          .Name, [])) then
        begin
          if MmPrincipal.items.items[i].items[j].Caption <> '-' then
          begin

            Dados.qryUpdate.Close;
            Dados.qryUpdate.ParamByName('CODIGO').Value :=
              Dados.Numerador('TELAS', 'CODIGO', 'N', 'N', 'N');
            Dados.qryUpdate.ParamByName('TELA').Value := MmPrincipal.items.items
              [i].items[j].Name;
            Dados.qryUpdate.ParamByName('NOME').Value :=
              RemoveAcento(MmPrincipal.items.items[i].items[j].Caption);
            Dados.qryUpdate.ParamByName('NIVEL').Value := 1;
            Dados.qryUpdate.ParamByName('FLAG').Value := 'S';
            Dados.qryUpdate.ParamByName('PAI').Value := i;
            Dados.qryUpdate.ExecSQL;
            Dados.Conexao.CommitRetaining;

          end;
        end
        else
        begin

          Dados.qryUpdate.Close;
          Dados.qryUpdate.ParamByName('CODIGO').Value :=
            Dados.QryTelas.FieldByName('CODIGO').Value;
          Dados.qryUpdate.ParamByName('TELA').Value := MmPrincipal.items.items
            [i].items[j].Name;
          Dados.qryUpdate.ParamByName('NOME').Value :=
            RemoveAcento(MmPrincipal.items.items[i].items[j].Caption);
          Dados.qryUpdate.ParamByName('NIVEL').Value := 1;
          Dados.qryUpdate.ParamByName('PAI').Value := i;
          Dados.qryUpdate.ExecSQL;
          Dados.Conexao.CommitRetaining;

        end;
      end;
    end;

    for i := 0 to MmPrincipal.items.Count - 1 do
    begin // menu
      for j := 0 to MmPrincipal.items.items[i].Count - 1 do
      begin // submenu 1∫ nivel
        for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
        begin // submenu 2∫ nivel
          if not(Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].items
            [j].items[k].Name, [])) then
          begin
            if MmPrincipal.items.items[i].items[j].items[k].Caption <> '-' then
            begin

              Dados.qryUpdate.Close;
              Dados.qryUpdate.ParamByName('CODIGO').Value :=
                Dados.Numerador('TELAS', 'CODIGO', 'N', 'N', 'N');
              Dados.qryUpdate.ParamByName('TELA').Value :=
                MmPrincipal.items.items[i].items[j].items[k].Name;
              Dados.qryUpdate.ParamByName('NOME').Value :=
                RemoveAcento(MmPrincipal.items.items[i].items[j].items
                [k].Caption);
              Dados.qryUpdate.ParamByName('NIVEL').Value := 2;
              Dados.qryUpdate.ParamByName('FLAG').Value := 'S';
              Dados.qryUpdate.ParamByName('PAI').Value := i;
              Dados.qryUpdate.ExecSQL;
              Dados.Conexao.CommitRetaining;

            end;
          end
          else
          begin

            Dados.qryUpdate.Close;
            Dados.qryUpdate.ParamByName('CODIGO').Value :=
              Dados.QryTelas.FieldByName('CODIGO').Value;
            Dados.qryUpdate.ParamByName('TELA').Value := MmPrincipal.items.items
              [i].items[j].items[k].Name;
            Dados.qryUpdate.ParamByName('NOME').Value :=
              RemoveAcento(MmPrincipal.items.items[i].items[j].items[k]
              .Caption);
            Dados.qryUpdate.ParamByName('NIVEL').Value := 2;
            Dados.qryUpdate.ParamByName('PAI').Value := i;
            Dados.qryUpdate.ExecSQL;
            Dados.Conexao.CommitRetaining;

          end;
        end;
      end;
    end;

    for i := 0 to MmPrincipal.items.Count - 1 do
    begin // menu
      for j := 0 to MmPrincipal.items.items[i].Count - 1 do
      begin // submenu 1∫ nivel
        for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
        begin // submenu 2∫ nivel
          for l := 0 to MmPrincipal.items.items[i].items[j].items[k]
            .Count - 1 do
          begin // submenu 3∫ nivel
            if MmPrincipal.items.items[i].items[j].items[k].items[l].Caption <> '-'
            then
            begin
              if not(Dados.QryTelas.locate('TELA',
                MmPrincipal.items.items[i].items[j].items[k].items[l].Name, []))
              then
              begin

                Dados.qryUpdate.Close;
                Dados.qryUpdate.ParamByName('CODIGO').Value :=
                  Dados.Numerador('TELAS', 'CODIGO', 'N', 'N', 'N');
                Dados.qryUpdate.ParamByName('TELA').Value :=
                  MmPrincipal.items.items[i].items[j].items[k].items[l].Name;
                Dados.qryUpdate.ParamByName('NOME').Value :=
                  RemoveAcento(MmPrincipal.items.items[i].items[j].items[k]
                  .items[l].Caption);
                Dados.qryUpdate.ParamByName('NIVEL').Value := 3;
                Dados.qryUpdate.ParamByName('FLAG').Value := 'S';
                Dados.qryUpdate.ParamByName('PAI').Value := i;
                Dados.qryUpdate.ExecSQL;
                Dados.Conexao.CommitRetaining;

              end
            end
            else
            begin

              Dados.qryUpdate.Close;
              Dados.qryUpdate.ParamByName('CODIGO').Value :=
                Dados.QryTelas.FieldByName('CODIGO').Value;
              Dados.qryUpdate.ParamByName('TELA').Value :=
                MmPrincipal.items.items[i].items[j].items[k].items[l].Name;
              Dados.qryUpdate.ParamByName('NOME').Value :=
                RemoveAcento(MmPrincipal.items.items[i].items[j].items[k].items
                [l].Caption);
              Dados.qryUpdate.ParamByName('NIVEL').Value := 3;
              Dados.qryUpdate.ParamByName('PAI').Value := i;
              Dados.qryUpdate.ExecSQL;
              Dados.Conexao.CommitRetaining;

            end;
          end;
        end;
      end;
    end;
    Dados.QryTelas.Refresh;
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmPrincipal.InventrioporCSOSNCST1Click(Sender: TObject);
begin
  try
    frmParCSOSNCST := TfrmParCSOSNCST.Create(Application);
    frmParCSOSNCST.ShowModal;
  finally
    frmParCSOSNCST.Release;
  end;

end;

procedure TfrmPrincipal.MNTipodeTecidoClick(Sender: TObject);
begin
  try
    frmTipoTecido := TfrmTipoTecido.Create(Application);
    frmTipoTecido.ShowModal;
  finally
    frmTipoTecido.Release;
  end;
end;

procedure TfrmPrincipal.MNListaSPCCCFClick(Sender: TObject);
begin
  qryClientesRestricoes.Close;
  qryClientesRestricoes.Open;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelRestricoes.fr3');
  frxReport.ShowReport;

end;

procedure TfrmPrincipal.MNTabelaICMSClick(Sender: TObject);
begin
  try
    FrmICMS := TFrmICMS.Create(Application);
    FrmICMS.ShowModal;
  finally
    FrmICMS.Release;
  end;

end;

procedure TfrmPrincipal.MnAtualizaClick(Sender: TObject);
begin
  try
    FrmAtualiza := TFrmAtualiza.Create(Application);
    FrmAtualiza.ShowModal;
  finally
    FrmAtualiza.Release;
  end;
end;

procedure TfrmPrincipal.MnAjustaCamposClick(Sender: TObject);
begin
  Dados.AjustaCamposNovos('orcamento');
  Dados.AjustaCamposNovos('nfe');
  Dados.AjustaCamposNovos('os');
  Dados.AjustaCamposNovos('compra');
end;

procedure TfrmPrincipal.AjustaEstoqueFiscal1Click(Sender: TObject);
begin
  try
    frmAcerta := TfrmAcerta.Create(Application);
    frmAcerta.Tag := 2;
    frmAcerta.ShowModal;
  finally
    frmAcerta.Release;
  end;
end;

procedure TfrmPrincipal.AjustaPermissoes;
begin

  Dados.QryTelas.Close;
  Dados.QryTelas.Open;

  Dados.qryUsuarios.Close;
  Dados.qryUsuarios.Open;

  Dados.qryUsuarios.First;

  while not Dados.qryUsuarios.Eof do
  begin
    Dados.qryPermissoes.Close;
    Dados.qryPermissoes.Params[0].Value := Dados.qryUsuariosCODIGO.Value;
    Dados.qryPermissoes.Open;

    Dados.QryTelas.First;
    while not Dados.QryTelas.Eof do
    begin
      if not(Dados.qryPermissoes.locate('FKTELA',
        Dados.QryTelas.FieldByName('CODIGO').Value, [])) then
        InserePermissoes;

      Dados.QryTelas.Next;
    end;
    Dados.qryUsuarios.Next;
  end;
end;

procedure TfrmPrincipal.AjustaSaldodeEstoqueFiscal1Click(Sender: TObject);
begin
  try
    frmAcertaSaldo := TfrmAcertaSaldo.Create(Application);
    frmAcertaSaldo.Tag := 2;
    frmAcertaSaldo.ShowModal;
  finally
    frmAcertaSaldo.Release;
  end;

end;

procedure TfrmPrincipal.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if Dados.qryEmpresaMULTI_IDIOMA.Value = 'S' then
  begin

    if Msg.Message = WM_KEYDOWN then
    begin
      if Msg.wParam = VK_F1 then
      begin
        Dados.SetComponentes;
        try
          frmTradutor := TfrmTradutor.Create(Application);
          frmTradutor.ShowModal;
        finally
          frmTradutor.Release;
        end;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.HabilitaMenus;
var
  i, j, k, l: Integer;
begin

  qryPermissoes.Close;
  qryPermissoes.Params[0].AsFloat := Dados.idUsuario;
  qryPermissoes.Open;
  qryPermissoes.First;

  // nivel 0
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    if qryPermissoes.locate('tela', MmPrincipal.items.items[i].Name, []) then
    begin
      if qryPermissoesVISUALIZAR.AsString = 'S' then
        MmPrincipal.items.items[i].Visible := true;
    end
    else
      MmPrincipal.items.items[i].Visible := false;
  end;

  // nivel 1
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      if qryPermissoes.locate('tela', MmPrincipal.items.items[i].items[j]
        .Name, []) then
      begin
        if qryPermissoesVISUALIZAR.AsString = 'S' then
          MmPrincipal.items.items[i].items[j].Enabled := true;
      end
      else
        MmPrincipal.items.items[i].items[j].Enabled := false;
    end;
  end;

  // nivel 3
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
      begin
        if qryPermissoes.locate('tela', MmPrincipal.items.items[i].items[j]
          .items[k].Name, []) then
        begin
          if qryPermissoesVISUALIZAR.AsString = 'S' then
            MmPrincipal.items.items[i].items[j].items[k].Enabled := true;
        end
        else
          MmPrincipal.items.items[i].items[j].items[k].Enabled := false;

      end;
    end;
  end;

  // nivel 4
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
      begin
        for l := 0 to MmPrincipal.items.items[i].items[j].items[k].Count - 1 do
        begin
          if qryPermissoes.locate('tela', MmPrincipal.items.items[i].items[j]
            .items[k].items[l].Name, []) then
          begin
            if qryPermissoesVISUALIZAR.AsString = 'S' then
              MmPrincipal.items.items[i].items[j].items[k].items[l]
                .Enabled := true;
          end
          else
            MmPrincipal.items.items[i].items[j].items[k].items[l]
              .Enabled := false;
        end;
      end;
    end;
  end;

  btnCaixa.Visible := MnCaixa.Enabled;
  btnPessoas.Visible := MnPessoas.Enabled;
  btnProdutos.Visible := MNProdutos.Enabled;
  btnPagar.Visible := MNCP.Enabled;
  btnReceber.Visible := MnCR.Enabled;
  btnOrcamento.Visible := MnOramento.Enabled;
  btnCompra.Visible := MnCompra.Enabled;
  btnPDV.Visible := MnPDV.Enabled;
  btnBackup.Visible := MnBackup.Enabled;
  BtnCTe.Visible := MnCTEOS.Enabled;
  btnMDFe.Visible := MnMDFe.Enabled;
  btnNFe.Visible := MnNFe.Enabled;
  MNPedidodeSementes.Visible := Dados.qryEmpresaVENDA_SEMENTE.Value = 'S';
  MNPedidodeSal.Visible := Dados.qryEmpresaVENDA_SEMENTE.Value = 'S';
  MNTipodeTecido.Visible := Dados.qryEmpresaLOJA_ROUPA.Value = 'S';
end;

procedure TfrmPrincipal.HistricodeVendaspFornecedor1Click(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '6';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MnHistoricodeUsuriosClick(Sender: TObject);
begin
  try
    frmHistorico_usuario := TfrmHistorico_usuario.Create(Application);
    frmHistorico_usuario.ShowModal;
  finally
    frmHistorico_usuario.Release;
  end;

end;

procedure TfrmPrincipal.DesabilitaMenus;
var
  i, j, k, l: Integer;
begin

  qryPermissoes.Close;
  qryPermissoes.Params[0].AsFloat := Dados.idUsuario;
  qryPermissoes.Open;
  qryPermissoes.First;

  // nivel 0
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    if qryPermissoes.locate('tela', MmPrincipal.items.items[i].Name, []) then
      MmPrincipal.items.items[i].Visible := false;
  end;

  // nivel 1
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
      MmPrincipal.items.items[i].items[j].Enabled := false;
  end;

  // nivel 3
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
        MmPrincipal.items.items[i].items[j].items[k].Enabled := false;
    end;
  end;

  // nivel 4
  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
      begin
        for l := 0 to MmPrincipal.items.items[i].items[j].items[k].Count - 1 do
          MmPrincipal.items.items[i].items[j].items[k].items[l].Enabled
            := false;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.InserePermissoes;
begin
  Dados.qryPermissoes.Insert;
  Dados.qryPermissoesFKUSUARIO.AsFloat := Dados.qryUsuariosCODIGO.Value;
  Dados.qryPermissoesFKTELA.AsFloat := Dados.qryTelasCODIGO.Value;
  if Dados.qryUsuarios.RecordCount = 1 then
  begin
    Dados.qryPermissoesVISUALIZAR.Value := 'S';
    Dados.qryPermissoesEXCLUIR.Value := 'S';
    Dados.qryPermissoesEDITAR.Value := 'S';
    Dados.qryPermissoesINCLUIR.Value := 'S';
    Dados.qryPermissoesVISIVEL.Value := 'S';
  end
  else
  begin
    Dados.qryPermissoesVISUALIZAR.Value := 'N';
    Dados.qryPermissoesEXCLUIR.Value := 'N';
    Dados.qryPermissoesEDITAR.Value := 'N';
    Dados.qryPermissoesINCLUIR.Value := 'N';
    Dados.qryPermissoesVISIVEL.Value := 'N';
  end;
  Dados.qryPermissoes.Post;
end;

procedure TfrmPrincipal.DevoluodeCompra1Click(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmDevolucaoCompra);
  end
  else
    FTDI.MostrarFormulario(TfrmDevolucaoCompra, false);
end;

procedure TfrmPrincipal.dsComposicao_MDataChange(Sender: TObject;
  Field: TField);
begin
  qryComposicao_D.Close;
  qryComposicao_D.Params[0].Value := qryComposicao_MCODIGO.Value;
  qryComposicao_D.Open;

end;

procedure TfrmPrincipal.erminais1Click(Sender: TObject);
begin
  try
    frmTerminais := TfrmTerminais.Create(Application);
    frmTerminais.ShowModal;
  finally
    frmTerminais.Release;
  end;
end;

procedure TfrmPrincipal.Etiquetas1Click(Sender: TObject);
begin
  try
    frmEtiquetas := TfrmEtiquetas.Create(Application);
    frmEtiquetas.ShowModal;
  finally
    frmEtiquetas.Release;
  end;
end;

procedure TfrmPrincipal.MnExecuteScriptClick(Sender: TObject);
begin
  try
    frmScript := TfrmScript.Create(Application);
    frmScript.ShowModal;
  finally
    frmScript.Release;
  end;
end;

procedure TfrmPrincipal.MnDestinatarioClick(Sender: TObject);
begin
  try
    frmDestinatario := TfrmDestinatario.Create(Application);
    frmDestinatario.ShowModal;
  finally
    frmDestinatario.Release;
  end;
end;

procedure TfrmPrincipal.MNDevoluodeMercadoriaClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, Tfrmdevolucao);
  end
  else
    FTDI.MostrarFormulario(Tfrmdevolucao, false);
end;

procedure TfrmPrincipal.MNDiriodeCaixaClick(Sender: TObject);
begin
  try
    frmParDiario := TfrmParDiario.Create(Application);
    frmParDiario.ShowModal;
  finally
    frmParDiario.Release;
  end;
end;

procedure TfrmPrincipal.MNEnviarSpedClick(Sender: TObject);
begin
  try

    Dados.qrySped_contador.Close;
    Dados.qrySped_contador.Open;
    Dados.qrySped_contador.locate('fk_empresa',
      Dados.qryEmpresaCODIGO.Value, []);

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := 'SPED';
    frmEmail.vTituloAnexo := 'SPED';
    frmEmail.eNotaFiscal := false;
    frmEmail.AnexaArquivo := true;
    frmEmail.edtEmail.Text := LowerCase(Dados.qrySped_contadorEMAIL.Value);
    frmEmail.EdtAssunto.Text := 'SPED GERADO EM ' +
      FormatDateTime('MMYYYY', Date);
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO ' + frmEmail.EdtAssunto.Text;
    frmEmail.ShowModal;

  finally
    frmEmail.Release;
  end;
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmProdutos);
  end
  else
    FTDI.MostrarFormulario(TfrmProdutos, false);
end;

procedure TfrmPrincipal.btnReceberClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsReceber);
  end
  else
    FTDI.MostrarFormulario(TfrmConsReceber, false);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if Application.messagebox('Deseja Sair do Sistema?', 'ConfirmaÁ„o', mb_yesno)
    = mrYes then
  begin
    btnBackup.Click;
    Dados.AtualizaTerminal;
    Dados.vFechaPrograma := true;
    Application.Terminate;
  end;

end;

procedure TfrmPrincipal.btnWhatsClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName) + 'Whats.exe';
  if FileExists(caminho) then
    ShellExecute(0, 'open', PChar(caminho), '', '', SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.btnMDFeClick(Sender: TObject);
begin
  MnMDFeClick(SELF);
end;

procedure TfrmPrincipal.btnNFeClick(Sender: TObject);
begin

  MnNFeClick(SELF);
end;

procedure TfrmPrincipal.btnOrcamentoClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmOrcamento);
  end
  else
    FTDI.MostrarFormulario(TfrmOrcamento, false);
end;

procedure TfrmPrincipal.btnPagarClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsPagar);
  end
  else
    FTDI.MostrarFormulario(TfrmConsPagar, false);
end;

procedure TfrmPrincipal.ChamaPDV;
begin
//ShowMessage('Entrei');
  dados.qryNFCe_OFF.Close;
  dados.qryNFCe_OFF.Open;
  if dados.qryTerminalEH_CAIXA.Value = 'S' then
  begin
    if not dados.qryNFCe_OFF.IsEmpty then
    begin
      ShowMessage('Existem NFC-e OFFline emitidos em data anterior!' +
        sLineBreak +
        'Segundo normativa: … necess·rio transmiti-los em no m·ximo 24 horas apÛs emiss„o.');
    end;
  end;
  try
    dados.vRetaguarda := true;
    frmPdv := TfrmPdv.Create(Application);
    frmPdv.ShowModal;
  finally
    frmPdv.Release;
  end;
end;

procedure TfrmPrincipal.btnPDVClick(Sender: TObject);
begin
  Dados.ChecaPDV;
  ChamaPDV;
end;

procedure TfrmPrincipal.MnCRClick(Sender: TObject);
begin
  btnReceberClick(SELF);
end;

procedure TfrmPrincipal.MNEstoqueNegativoClick(Sender: TObject);
begin
  qryEstoqueReal.Close;
  qryEstoqueReal.Open;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelEstoqueNegativoR.fr3');
  frxReport.ShowReport;

end;

procedure TfrmPrincipal.MnCompraClick(Sender: TObject);
begin
  btnCompraClick(SELF);
end;

procedure TfrmPrincipal.MNSaldoClick(Sender: TObject);
begin
  try
    frmAcertaSaldo := TfrmAcertaSaldo.Create(Application);
    frmAcertaSaldo.Tag := 1;
    frmAcertaSaldo.ShowModal;
  finally
    frmAcertaSaldo.Release;
  end;
end;

procedure TfrmPrincipal.MNTabelaPrecoClick(Sender: TObject);
begin
  try
    frmTabelaPreco := TfrmTabelaPreco.Create(Application);
    frmTabelaPreco.ShowModal;
  finally
    frmTabelaPreco.Release;
  end;
end;

procedure TfrmPrincipal.MnConfigClick(Sender: TObject);
begin
  try
    frmConfig := TfrmConfig.Create(Application);
    frmConfig.ShowModal;
  finally
    frmConfig.Release;
  end;
end;

procedure TfrmPrincipal.MNContasClick(Sender: TObject);
begin
  try
    frmContas := TfrmContas.Create(Application);
    frmContas.ShowModal;
  finally
    frmContas.Release;
  end;

end;

procedure TfrmPrincipal.MnCaixaClick(Sender: TObject);
begin
  btnCaixaClick(SELF);
end;

procedure TfrmPrincipal.Delivery1Click(Sender: TObject);
begin
  Dados.FTIpoPDV := 'DELIVERY';
  ChamaPDV;
end;

procedure TfrmPrincipal.Departamentos1Click(Sender: TObject);
begin
  try
    frmUnidade := TfrmUnidade.Create(Application);
    frmUnidade.ShowModal;
  finally
    frmUnidade.Release;
  end;
end;

function TfrmPrincipal.CriaEmpresa: Boolean;

begin
  Result := true;
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text := 'select * from empresa';
  Dados.qryConsulta.Open;

  if Dados.qryConsulta.IsEmpty then
    Result := false;

  if not Result then
  begin
    try

      Dados.LimpaTerminais;

      frmempresa := Tfrmempresa.Create(Application);

      frmempresa.qryEmpresa.Close;
      frmempresa.qryEmpresa.Params[0].Value := -1;
      frmempresa.qryEmpresa.Open;

      frmempresa.qryEmpresa.Insert;
      frmempresa.qryEmpresaCODIGO.Value := Dados.Numerador('EMPRESA', 'CODIGO',
        'N', '', '');
      frmempresa.ShowModal;
    finally
      frmempresa.Release;
    end;
  end;

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text := 'select * from empresa';
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.IsEmpty then
    Result := true
  else
  begin
    ShowMessage('N„o existe empresa cadastrada, sistema ser· finalizado!');
    Dados.vFechaPrograma := true;
    Dados.AtualizaTerminal;
    Application.Terminate;
  end;

end;

procedure TfrmPrincipal.mnTabelasCamposClick(Sender: TObject);
begin
  try
    frmExecute := TfrmExecute.Create(Application);
    ShowMessage('Comandos executados com sucesso!');
  finally
    frmExecute.Release;
  end;
end;

procedure TfrmPrincipal.MNCTeClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsCTe_Rodo);
  end
  else
    FTDI.MostrarFormulario(TfrmConsCTe_Rodo, false);
end;

procedure TfrmPrincipal.MNCurvaABCClick(Sender: TObject);
begin
  try
    frmParCurvaABC := TfrmParCurvaABC.Create(Application);
    frmParCurvaABC.ShowModal;
  finally
    frmParCurvaABC.Release;
  end;
end;

procedure TfrmPrincipal.MnCTEOSClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsCTe);
  end
  else
    FTDI.MostrarFormulario(TfrmConsCTe, false);
end;

function TfrmPrincipal.ChamaLogin: Boolean;
var
  CriaUsuario: Boolean;
begin
  CriaUsuario := false;

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text := 'select * from usuarios';
  Dados.qryConsulta.Open;
  if Dados.qryConsulta.IsEmpty then
    CriaUsuario := true;
  Result := CriaUsuario;
  if not CriaUsuario then
  begin
    try
      frmAcesso := TfrmAcesso.Create(Application);
      frmAcesso.ShowModal;
    finally
      frmAcesso.Release;
    end;
  end
  else
  begin
    try
      frmUsuarios := TfrmUsuarios.Create(Application);
      frmUsuarios.Tela := 'Novo';
      frmUsuarios.ShowModal;
    finally
      frmUsuarios.Release;
    end;
  end;

end;

procedure TfrmPrincipal.MNComissodeVendedoresClick(Sender: TObject);
begin
  try
    frmParComissao := TfrmParComissao.Create(Application);
    frmParComissao.ShowModal;
  finally
    frmParComissao.Release;
  end;
end;

procedure TfrmPrincipal.MnContadorClick(Sender: TObject);
begin
  try
    frmContador := TfrmContador.Create(Application);
    frmContador.ShowModal;
  finally
    frmContador.Release;
  end;
end;

procedure TfrmPrincipal.MNEstoqueMinimoClick(Sender: TObject);
begin
  qryEstoqueMinimo.Close;
  qryEstoqueMinimo.Open;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelEstoqueMinimo.fr3');
  frxReport.ShowReport;

end;

procedure TfrmPrincipal.MNFPGClick(Sender: TObject);
begin
  try
    frmFPG := TfrmFPG.Create(Application);
    frmFPG.ShowModal;
  finally
    frmFPG.Release;
  end;
end;

procedure TfrmPrincipal.MNFichadeClienteClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmFichaCliente);
  end
  else
    FTDI.MostrarFormulario(TfrmFichaCliente, false);
end;

procedure TfrmPrincipal.MNFluxodeCaixaClick(Sender: TObject);
begin
  try
    frmParFinanceiro := TfrmParFinanceiro.Create(Application);
    frmParFinanceiro.ShowModal;
  finally
    frmParFinanceiro.Release;
  end;
end;

procedure TfrmPrincipal.MnFecharJanelasClick(Sender: TObject);
begin
  if FTDI <> nil then
  begin
    FTDI.Fechar(true);
    FreeAndNil(FTDI);
  end;
end;

procedure TfrmPrincipal.FabricarProduto1Click(Sender: TObject);
begin
  try
    frmFabricar := TfrmFabricar.Create(Application);
    frmFabricar.ShowModal;
  finally
    frmFabricar.Release;
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := SELF;
  Dados.GetComponentes;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  Dados.vRetaguarda := true;

  VerificaVersao := true;
  Dados.FVerificouOnline := false;
  Dados.vFechaPrograma := false;
  VerificaValidade := true;

  CarregaTabelas;

  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  Dados.CriaTerminal;

  try
    frmSplash := TfrmSplash.Create(Application);
    frmSplash.ShowModal;
  finally
    frmSplash.Release;
  end;

  ConfiguraSistema;

  Bloqu.executar;

  if Bloqu.RestServerAtivo = true then begin
    Bloqu.ChecaServidorRest('srvTLockApp.exe');
  end;

end;

procedure TfrmPrincipal.LicencaOnline;
begin
  DadosWeb.CadastraEmpresa;
  DadosWeb.RetornaSerial;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
  Task: ITask;
begin
  Timer1.Enabled := false;
  if not Dados.IsGlobalOffline then
  begin
    Task := TTask.Create(LicencaOnline);
    Task.Start;
  end;
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
var
  DataIni, DataFim, Databloqueio, DataValidade: TDate;
begin
 { try

    Timer2.Enabled := false;
    if VerificaValidade then
    begin

      if Dados.qryEmpresaCHECA.AsString = Dados.crypt('C', 'DEMONSTRACAO') then
      begin
        if Dados.ChecaValidade then
          MNRegistrarClick(SELF);
      end
      else if Dados.qryEmpresaCHECA.AsString <> Dados.crypt('C', 'DEMONSTRACAO')
      then
      begin

        if (Trim(Dados.qryEmpresaDATA_VALIDADE.Value) = '') or
          (Dados.qryEmpresaDATA_VALIDADE.IsNull) then
        begin
          ShowMessage('AtenÁ„o!' + sLineBreak + 'Chave de registro inv·lida!');
          MNRegistrarClick(SELF);
          exit;
        end;

        if Dados.crypt('D', Dados.qryEmpresaCSENHA.AsString) = 'S' then
        begin
          ShowMessage('AtenÁ„o!' + sLineBreak +
            'LicenÁa Bloqueada, entre em contato com o suporte');
          MNRegistrarClick(SELF);
        end;

        try
          Databloqueio :=
            StrToDateDef(Dados.crypt('D',
            Dados.qryEmpresaDATA_VALIDADE.Value), Date);
        except
          Dados.qryEmpresa.Edit;
          Dados.qryEmpresaNSERIE.Value := '...';
          Dados.qryEmpresaDATA_VALIDADE.Value :=
            Dados.crypt('C', datetostr(Date));
          Dados.qryEmpresa.Post;
        end;

        if (Date > Databloqueio) then
        begin
          ShowMessage
            ('AtenÁ„o, sistema bloqueado, entre em contato com o Suporte!');
          MNRegistrarClick(SELF);
        end;
      end;
    end;
    VerificaValidade := false;
  finally
    Timer3.Enabled := true;
  end;        }

end;

procedure TfrmPrincipal.Timer3Timer(Sender: TObject);
begin
  try
    Timer3.Enabled := false;

    if (Trim(Dados.qryParametroFTP_SERVIDOR.AsString) = '') or
      (Dados.qryParametroFTP_SERVIDOR.IsNull) then
      exit;

    if not Dados.IsGlobalOffline then
    begin
      try
        try
          FrmAtualiza := TFrmAtualiza.Create(Application);
          FrmAtualiza.Tag := 1;
          if FrmAtualiza.PodeAtualizar then
            FrmAtualiza.ShowModal;
        finally
          FrmAtualiza.Release;
        end;
      except
        // faz nada
      end;
    end;
  finally
    Timer1.Enabled := true;
  end;
end;

procedure TfrmPrincipal.TituloEmpresa;
begin
  if Trim(Dados.qryParametroTITULO_SISTEMA.Value) <> '' then
  begin
    Caption := Dados.qryParametroTITULO_SISTEMA.Value + ' | ' +
      Dados.qryParametroSUB_TITULO_SISTEMA.Value + ' | ' +
      Dados.qryEmpresaFANTASIA.AsString;
  end
  else
    Caption := Caption + ' | ' + Dados.qryEmpresaFANTASIA.AsString;
end;

procedure TfrmPrincipal.ConfiguraSistema;
begin

  Dados.qryParametro.Close;
  Dados.qryParametro.Open;

end;

procedure TfrmPrincipal.CarregaTabelas;
begin
  try
    frmExecute := TfrmExecute.Create(Application);
  finally
    frmExecute.Release;
  end;
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  try
    frmCBRconfig := TfrmCBRconfig.Create(Application);
    frmCBRconfig.ShowModal;
  finally
    frmCBRconfig.Release;
  end;

end;

procedure TfrmPrincipal.ConfiguraPais;
begin
  if Dados.qryEmpresaCODIGO_PAIS.Value = 400 then
  begin
    MnFiscal.Visible := false;
    MnFiscal.Enabled := false;
    MnOS.Caption := 'Folha de ServiÁo';
    MnPessoas.Caption := 'Cadastros';
    btnPessoas.Caption := 'Cadastros';
    btnOrcamento.Caption := 'Factura Proforma';
    MnOramento.Caption := 'Factura Proforma';
  end
  else
  begin
    MnOS.Caption := 'OS';
    MnPessoas.Caption := 'Pessoas';
    btnPessoas.Caption := 'Pessoas';

  end;

end;

procedure TfrmPrincipal.VerificaBackup;
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName) + 'Backup.exe';
  if FileExists(caminho) then
    ShellExecute(0, 'open', PChar(caminho), '', '', SW_SHOWNORMAL);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  CarregaSistema;
  CarregaImagem;
  Timer2.Enabled := true;
end;

procedure TfrmPrincipal.MnVeiculosClick(Sender: TObject);
begin
  try
    frmVeiculos := TfrmVeiculos.Create(Application);
    frmVeiculos.ShowModal;
  finally
    frmVeiculos.Release;
  end;
end;

function TfrmPrincipal.VerificarExisteConexaoComInternet: Boolean;
var
  nFlags: Cardinal;
begin
  // retorna True se houver conex„o com a internet
  Result := InternetGetConnectedState(@nFlags, 0);
end;

procedure TfrmPrincipal.MNBalancaClick(Sender: TObject);
begin
  try
    FrmBalanca := TFrmBalanca.Create(Application);
    FrmBalanca.ShowModal;
  finally
    FrmBalanca.Release;
  end;
end;

procedure TfrmPrincipal.MNBalanoFinanceiroClick(Sender: TObject);
begin
  try
    frmParBalanco := TfrmParBalanco.Create(Application);
    frmParBalanco.ShowModal;
  finally
    frmParBalanco.Release;
  end;
end;

procedure TfrmPrincipal.MNMotoristaClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmTransportadora);
  end
  else
    FTDI.MostrarFormulario(TfrmTransportadora, false);
end;

procedure TfrmPrincipal.CarregaSistema;
var
  vData: TDateTime;
begin
  if not CriaEmpresa then
  begin
    Dados.AtualizaTerminal;
    Dados.vFechaPrograma := true;
    Application.Terminate;
  end;

  if ChamaLogin then
    exit;

  if Dados.vFechaPrograma then
    exit;

  TituloEmpresa;

  FileAge(ParamStr(0), vData);

  StatusBar1.Panels[0].Text := Application.Title;
  StatusBar1.Panels[1].Text := 'Usu·rio...: ' + Dados.vUsuario;
  StatusBar1.Panels[2].Text := 'IP........: ' + IdIPWatch1.LocalIP;
  StatusBar1.Panels[3].Text := 'Atualizado Em: ' + datetostr(vData);
  StatusBar1.Panels[4].Text := 'Vers„o....: ' + Dados.GetBuildInfo
    (Application.ExeName);
  StatusBar1.Panels[5].Text := 'Licenciado.: ' +
    Dados.crypt('D', Dados.qryEmpresaDATA_VALIDADE.Value);
  StatusBar1.Panels[5].Text := 'Licenciado.: ' +
    Dados.crypt('D', Dados.qryEmpresaDATA_VALIDADE.Value);

  InsereTela;
  AjustaPermissoes;
  DesabilitaMenus;
  HabilitaMenus;

  if Dados.qryEmpresaUSA_PDV.AsString <> 'S' then
  begin
    MnPDV.Visible := false;
    btnPDV.Visible := false;
  end;

  if Dados.qryConfigTIPO_APLICATIVO.Value = 'S' then
    MnNFCe.Caption := 'SAT'
  Else
    MnNFCe.Caption := 'NFC-e';

  Dados.vLiberaProduto := btnProdutos.Visible;
  Dados.vLiberaPessoa := btnPessoas.Visible;

  Dados.AtualizaTerminal;

end;

procedure TfrmPrincipal.MNCFOP1Click(Sender: TObject);
begin
  try
    frmCFOP := TfrmCFOP.Create(Application);
    frmCFOP.ShowModal;
  finally
    frmCFOP.Release;
  end;
end;

procedure TfrmPrincipal.MNCFOPClick(Sender: TObject);
begin
  try
    frmCFOP := TfrmCFOP.Create(Application);
    frmCFOP.ShowModal;
  finally
    frmCFOP.Release;
  end;
end;

procedure TfrmPrincipal.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := ' ORDERNADO P/ DESCRI«√O ';
  end;
end;

procedure TfrmPrincipal.MNCPClick(Sender: TObject);
begin
  btnPagarClick(SELF);
end;

procedure TfrmPrincipal.MNHistoricodeVendas1Click(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '1';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MNHistoricodeCompras1Click(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '3';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MNHistoricoProdutoClick(Sender: TObject);
begin
  try
    frmHistoricoProduto := TfrmHistoricoProduto.Create(Application);
    frmHistoricoProduto.ShowModal;
  finally
    frmHistoricoProduto.Release;
  end;
end;

procedure TfrmPrincipal.MNInventrioClick(Sender: TObject);
begin
  try
    FrmInventario := TFrmInventario.Create(Application);
    FrmInventario.ShowModal;
  finally
    FrmInventario.Release;
  end;
end;

procedure TfrmPrincipal.MNListaConfEstoqueClick(Sender: TObject);
begin
  try
    qryConferencia.Close;
    qryConferencia.Open;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelEstoqueConf.fr3');
    frxReport.ShowReport;
  finally
    // nada
  end;
end;

procedure TfrmPrincipal.MNHistoricodeVendas2Click(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '2';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MnEmpresaClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsEmpresa);
  end
  else
    FTDI.MostrarFormulario(TfrmConsEmpresa, false);
end;

procedure TfrmPrincipal.MnEntregadorClick(Sender: TObject);
begin
  try
    frmEntregador := TfrmEntregador.Create(Application);
    frmEntregador.ShowModal;
  finally
    frmEntregador.Release;
  end;
end;

procedure TfrmPrincipal.mnEnviarMensagemClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName) + 'Whats.exe';
  if FileExists(caminho) then
    ShellExecute(0, 'open', PChar(caminho), '', '', SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.MNGrupoClick(Sender: TObject);
begin
  try
    frmGrupo := TfrmGrupo.Create(Application);
    frmGrupo.ShowModal;
  finally
    frmGrupo.Release;
  end;
end;

procedure TfrmPrincipal.MnPessoasClick(Sender: TObject);
begin
  btnPessoasClick(SELF);
end;

procedure TfrmPrincipal.MnListadeOramentoClick(Sender: TObject);
begin
  try
    frmParOrcamento := TfrmParOrcamento.Create(Application);
    frmParOrcamento.ShowModal;
  finally
    frmParOrcamento.Release;
  end;
end;

procedure TfrmPrincipal.MnListagemdeComprasClick(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '3';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MnListagemdeVendasClick(Sender: TObject);
begin
  try
    FrmParametros := TFrmParametros.Create(Application);
    FrmParametros.vTipo := '4';
    FrmParametros.ShowModal;
  finally
    FrmParametros.Release;
  end;
end;

procedure TfrmPrincipal.MnMarcaClick(Sender: TObject);
begin
  try
    frmMarca := TfrmMarca.Create(Application);
    frmMarca.ShowModal;
  finally
    frmMarca.Release;
  end;
end;

procedure TfrmPrincipal.MnMDFeClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsMDFe);
  end
  else
    FTDI.MostrarFormulario(TfrmConsMDFe, false);
end;

procedure TfrmPrincipal.MnMesasClick(Sender: TObject);
begin
  try
    FrmMesas := TFrmMesas.Create(Application);
    FrmMesas.ShowModal;
  finally
    FrmMesas.Release;
  end;
end;

procedure TfrmPrincipal.MnNFCeClick(Sender: TObject);
begin

  if Dados.qryConfigTIPO_APLICATIVO.Value = 'S' then
  begin
    if FTDI = nil then
    begin
      Align := alClient;
      FTDI := TTDI.Create(SELF, TfrmSAT);
    end
    else
      FTDI.MostrarFormulario(TfrmSAT, false);

  end
  Else
  begin
    if FTDI = nil then
    begin
      Align := alClient;
      FTDI := TTDI.Create(SELF, TfrmNFCe);
    end
    else
      FTDI.MostrarFormulario(TfrmNFCe, false);
  end;
end;

procedure TfrmPrincipal.MnNFeClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmConsNFe);
  end
  else
    FTDI.MostrarFormulario(TfrmConsNFe, false);
end;

procedure TfrmPrincipal.MnPDVClick(Sender: TObject);
begin
  Dados.FTIpoPDV := 'PDV';
  btnPDV.Click;
end;

procedure TfrmPrincipal.MnOramentoClick(Sender: TObject);
begin
  btnOrcamento.Click;
end;

procedure TfrmPrincipal.MNPedidodeSalClick(Sender: TObject);
begin
  Dados.Tela := 'SAL';
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmPedido);
  end
  else
    FTDI.MostrarFormulario(TfrmPedido, false);
end;

procedure TfrmPrincipal.MNPedidodeSementesClick(Sender: TObject);
begin
  Dados.Tela := 'SEMENTE';
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmPedido);
  end
  else
    FTDI.MostrarFormulario(TfrmPedido, false);
end;

procedure TfrmPrincipal.MNPedidosWebClick(Sender: TObject);
begin
  try
    FrmPedidoWeb := TFrmPedidoWeb.Create(Application);
    FrmPedidoWeb.ShowModal;
  finally
    FrmPedidoWeb.Release;
  end;

end;

procedure TfrmPrincipal.Permisses1Click(Sender: TObject);
begin
  try
    frmPermissoes := TfrmPermissoes.Create(Application);
    frmPermissoes.ShowModal;
  finally
    frmPermissoes.Release;
  end;

end;

procedure TfrmPrincipal.MNRelatriodeEstoqueComposioClick(Sender: TObject);
begin

  qryComposicao_M.Close;
  qryComposicao_M.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelEstoqueComposicao.fr3');
  frxReport.ShowReport;
end;

procedure TfrmPrincipal.MNRelatriodeEstoqueGradeClick(Sender: TObject);
begin
  qryEstoqueGrade.Close;
  qryEstoqueGrade.Open;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelEstoqueGrade.fr3');
  frxReport.ShowReport;

end;

procedure TfrmPrincipal.MnRelVendasProdVddClick(Sender: TObject);
begin
  try
    frmHistoricoVendaProduto_vdd := TfrmHistoricoVendaProduto_vdd.Create
      (Application);
    frmHistoricoVendaProduto_vdd.ShowModal;
  finally
    frmHistoricoVendaProduto_vdd.Release;
  end;

end;

procedure TfrmPrincipal.MnRelVendasProdClieClick(Sender: TObject);
begin

  try
    frmHistoricoVendaProduto_Cliente := TfrmHistoricoVendaProduto_Cliente.Create
      (Application);
    frmHistoricoVendaProduto_Cliente.ShowModal;
  finally
    frmHistoricoVendaProduto_Cliente.Release;
  end;

end;

procedure TfrmPrincipal.MnRelEstoqueFiscalClick(Sender: TObject);
begin
  try
    frmParEstoqueFI := TfrmParEstoqueFI.Create(Application);
    frmParEstoqueFI.ShowModal;
  finally
    frmParEstoqueFI.Release;
  end;
end;

procedure TfrmPrincipal.MnRelProdPrecoAlterados1Click(Sender: TObject);
begin
  try
    frmPrecoAlterado := TfrmPrecoAlterado.Create(Application);
    frmPrecoAlterado.ShowModal;
  finally
    frmPrecoAlterado.Release;
  end;
end;

procedure TfrmPrincipal.Regs1Click(Sender: TObject);
begin
  try
    frmChave := TfrmChave.Create(Application);
    frmChave.ShowModal;
  finally
    frmChave.Release;
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.RelatrioporPlanodeContas1Click(Sender: TObject);
begin
  try
    frmParPlanoConta := TfrmParPlanoConta.Create(Application);
    frmParPlanoConta.ShowModal;
  finally
    frmParPlanoConta.Release;
  end;
end;

procedure TfrmPrincipal.RelaVdProdMonoClick(Sender: TObject);
begin
  try
    frmParProdutoMono := TfrmParProdutoMono.Create(Application);
    frmParProdutoMono.ShowModal;
  finally
    frmParProdutoMono.Release;
  end;
end;

procedure TfrmPrincipal.Remessa1Click(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmREMESSAmanutencao);

  end
  else
    FTDI.MostrarFormulario(TfrmREMESSAmanutencao, false);
end;

procedure TfrmPrincipal.Restaurante1Click(Sender: TObject);
begin
  Dados.FTIpoPDV := 'RESTAURANTE';
  ChamaPDV;
end;

procedure TfrmPrincipal.ResumoCaixa1Click(Sender: TObject);
begin
  try
    frmParResumoCaixa := TfrmParResumoCaixa.Create(Application);
    frmParResumoCaixa.ShowModal;
  finally
    frmParResumoCaixa.Release;
  end;

end;

procedure TfrmPrincipal.Retorno1Click(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmRETORNOmanutencao);

  end
  else
    FTDI.MostrarFormulario(TfrmRETORNOmanutencao, false);

end;

procedure TfrmPrincipal.SoftHouse1Click(Sender: TObject);
begin
  try
    frmRespTecnico := TfrmRespTecnico.Create(Application);
    frmRespTecnico.ShowModal;
  finally
    frmRespTecnico.Release;
  end;
end;

procedure TfrmPrincipal.MNSincronizarClick(Sender: TObject);
begin
  try
    FrmSincronizar := TfrmSincronizar.Create(Application);
    FrmSincronizar.ShowModal;
  finally
    FrmSincronizar.Release;
  end;
end;

procedure TfrmPrincipal.MNSintegraClick(Sender: TObject);
begin
  try
    frmSintegra := TfrmSintegra.Create(Application);
    frmSintegra.ShowModal;
  finally
    frmSintegra.Release;
  end;
end;

procedure TfrmPrincipal.MNRegistrarClick(Sender: TObject);
begin
  try
    frmChave := TfrmChave.Create(Application);
    frmChave.ShowModal;
  finally
    frmChave.Release;
    Dados.AtualizaTerminal;
    Dados.vFechaPrograma := true;
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.MNRelatriodeCartaoClick(Sender: TObject);
begin
  try
    frmParFinanceiroCartao := TfrmParFinanceiroCartao.Create(Application);
    frmParFinanceiroCartao.ShowModal;
  finally
    frmParFinanceiroCartao.Release;
  end;
end;

procedure TfrmPrincipal.MNTeinamentosClick(Sender: TObject);
var
  url: string;
  nchrome, nmozila, nie: string;
begin
  nchrome := 'C:\Program Files (x86)\Google\Chrome\Application';
  url := Dados.qryParametroLINK_TREINAMENTO.Value;
  if FileExists(nchrome + '\chrome.exe') then // abre
    ShellExecute(handle, 'Open', 'chrome.exe', PChar(url), PChar(nchrome),
      SW_SHOWMAXIMIZED)
  else
    ShellExecute(Application.handle, nil, PChar(url), nil, nil,
      SW_SHOWMINIMIZED);
end;

procedure TfrmPrincipal.MNProdutosmaislucrativosClick(Sender: TObject);
begin
  try
    frmParProduto := TfrmParProduto.Create(Application);
    frmParProduto.Caption := 'Produtos - Mais Lucrativo';
    frmParProduto.Tag := 3;
    frmParProduto.ShowModal;
  finally
    frmParProduto.Release;
  end;
end;

procedure TfrmPrincipal.MNProdutosMaisVendidosClick(Sender: TObject);
begin
  try
    frmParProduto := TfrmParProduto.Create(Application);
    frmParProduto.Tag := 1;
    frmParProduto.Caption := 'Produtos - Mais Vendidos';
    frmParProduto.ShowModal;
  finally
    frmParProduto.Release;
  end;
end;

procedure TfrmPrincipal.MNProdutosmenoslucrativosClick(Sender: TObject);
begin
  try
    frmParProduto := TfrmParProduto.Create(Application);
    frmParProduto.Caption := 'Produtos - Menos Lucrativos';
    frmParProduto.Tag := 4;
    frmParProduto.ShowModal;
  finally
    frmParProduto.Release;
  end;
end;

procedure TfrmPrincipal.MNProdutosmenosvendidosClick(Sender: TObject);
begin
  try
    frmParProduto := TfrmParProduto.Create(Application);
    frmParProduto.Caption := 'Produtos - Menos Vendidos';
    frmParProduto.Tag := 2;
    frmParProduto.ShowModal;
  finally
    frmParProduto.Release;

  end;
end;

procedure TfrmPrincipal.MNRelvendaProdClick(Sender: TObject);
begin
  try
    frmHistoricoVendaProduto := TfrmHistoricoVendaProduto.Create(Application);
    frmHistoricoVendaProduto.ShowModal;
  finally
    frmHistoricoVendaProduto.Release;
  end;
end;

procedure TfrmPrincipal.MNRelVendasCFOPCSOSN1Click(Sender: TObject);
begin
  try
    frmParCSOSN_CFOP := TfrmParCSOSN_CFOP.Create(Application);
    frmParCSOSN_CFOP.ShowModal;
  finally
    frmParCSOSN_CFOP.Release;
  end;

end;

procedure TfrmPrincipal.MnRemetenteClick(Sender: TObject);
begin
  try
    frmRemetente := TFrmRemetente.Create(Application);
    frmRemetente.ShowModal;
  finally
    frmRemetente.Release;
  end;

end;

procedure TfrmPrincipal.MNServicosClick(Sender: TObject);
begin
  if Dados.qryEmpresaLOJA_ROUPA.Value = 'S' then
  begin

    if FTDI = nil then
    begin
      Align := alClient;
      FTDI := TTDI.Create(SELF, TfrmConsOS_Roupa);
    end
    else
      FTDI.MostrarFormulario(TfrmConsOS_Roupa, false);
  end
  else
  begin

    if FTDI = nil then
    begin
      Align := alClient;
      FTDI := TTDI.Create(SELF, TfrmConsOS);
    end
    else
      FTDI.MostrarFormulario(TfrmConsOS, false);
  end;
end;

procedure TfrmPrincipal.MNSpedContribuiesClick(Sender: TObject);
begin
  try
    FrmSpedSP := TFrmSpedSP.Create(Application);
    FrmSpedSP.ShowModal;
  finally
    FrmSpedSP.Release;
  end;

end;

procedure TfrmPrincipal.MNSpedFiscalClick(Sender: TObject);
begin
  try
    FrmSpedSF := TFrmSpedSF.Create(Application);
    FrmSpedSF.ShowModal;
  finally
    FrmSpedSF.Release;
  end;
end;

procedure TfrmPrincipal.MnListaCorrecoesClick(Sender: TObject);
begin
  try
    frmCorrecoes := TfrmCorrecoes.Create(Application);
    frmCorrecoes.ShowModal;
  finally
    frmCorrecoes.Release;
    Dados.AtualizaTerminal;
  end;
end;

procedure TfrmPrincipal.ListaLCP1161Click(Sender: TObject);
begin
  try
    frmLCP := TfrmLCP.Create(Application);
    frmLCP.ShowModal;
  finally
    frmLCP.Release;
  end;
end;

procedure TfrmPrincipal.ChecaAtualizacao;
begin
  try

    if not Dados.IsGlobalOffline then
    begin
      try
        try
          FrmAtualiza := TFrmAtualiza.Create(Application);
          FrmAtualiza.Tag := 1;
          if FrmAtualiza.PodeAtualizar then
            FrmAtualiza.ShowModal;
        finally
          FrmAtualiza.Release;
        end;
      except
      end;

    end;

  finally
  end;
end;

procedure TfrmPrincipal.ClassificaodeSementes1Click(Sender: TObject);
begin
  try
    frmLaudo := TfrmLaudo.Create(Application);
    frmLaudo.ShowModal;
  finally
    frmLaudo.Release;
  end;

end;

procedure TfrmPrincipal.MNPlanoClick(Sender: TObject);
begin
  try
    frmPlano := TfrmPlano.Create(Application);
    frmPlano.ShowModal;
  finally
    frmPlano.Release;
  end;
end;

procedure TfrmPrincipal.MNProdutosClick(Sender: TObject);
begin
  btnProdutosClick(SELF);
end;

procedure TfrmPrincipal.MnTransfContaClick(Sender: TObject);
begin
  try
    FrmTransferencia := TFrmTransferencia.Create(Application);
    FrmTransferencia.ShowModal;
  finally
    FrmTransferencia.Release;
  end;
end;

procedure TfrmPrincipal.MnTransportadorasClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmTransportadora);

  end
  else
    FTDI.MostrarFormulario(TfrmTransportadora, false);
end;

procedure TfrmPrincipal.MnTrocaClick(Sender: TObject);
begin
  if FTDI <> nil then
  begin
    FTDI.Fechar(true);
    FreeAndNil(FTDI);
  end;
  CarregaSistema;
  ConfiguraSistema;
  Timer1.Enabled := true;
end;

procedure TfrmPrincipal.MnReciboClick(Sender: TObject);
begin
  try
    Frmrecibo := TFrmrecibo.Create(Application);
    Frmrecibo.ShowModal;
  finally
    Frmrecibo.Release;
  end;
end;

procedure TfrmPrincipal.MnRelatriodeContasPagarClick(Sender: TObject);
begin
  try
    frmParPagar := TfrmParPagar.Create(Application);
    frmParPagar.ShowModal;
  finally
    frmParPagar.Release;

  end;
end;

procedure TfrmPrincipal.MnRelatriodeContasReceberClick(Sender: TObject);
begin
  try
    frmParReceber := TfrmParReceber.Create(Application);
    frmParReceber.ShowModal;
  finally
    frmParReceber.Release;
  end;
end;

procedure TfrmPrincipal.MnRelatriodeLivroCaixaClick(Sender: TObject);
begin
  try
    frmParCaixa := TfrmParCaixa.Create(Application);
    frmParCaixa.ShowModal;
  finally
    frmParCaixa.Release;
  end;
end;

procedure TfrmPrincipal.MnSairClick(Sender: TObject);
begin
  btnSairClick(SELF);
end;

procedure TfrmPrincipal.MNUnidadesClick(Sender: TObject);
begin
  try
    frmUnidade := TfrmUnidade.Create(Application);
    frmUnidade.ShowModal;
  finally
    frmUnidade.Release;
  end;
end;

procedure TfrmPrincipal.MnUsuariosClick(Sender: TObject);
begin
  try
    frmUsuarios := TfrmUsuarios.Create(Application);
    frmUsuarios.Tela := 'Principal';
    frmUsuarios.ShowModal;
  finally
    frmUsuarios.Release;
  end;
end;

procedure TfrmPrincipal.MNVendasClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmPedidoVenda);
  end
  else
    FTDI.MostrarFormulario(TfrmPedidoVenda, false);
end;

procedure TfrmPrincipal.MNVendedoresClick(Sender: TObject);
begin
  try
    frmVendedor := TfrmVendedor.Create(Application);
    frmVendedor.ShowModal;
  finally
    frmVendedor.Release;
  end;
end;

procedure TfrmPrincipal.MNNotasFornecedorLerXMLClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmManifesto);
  end
  else
    FTDI.MostrarFormulario(TfrmManifesto, false);
end;

procedure TfrmPrincipal.MnTomadorClick(Sender: TObject);
begin
  try
    frmTomador := TfrmTomador.Create(Application);
    frmTomador.ShowModal;
  finally
    frmTomador.Release;
  end;
end;

procedure TfrmPrincipal.Visitantes1Click(Sender: TObject);
begin
  btnProdutosClick(SELF);
end;

procedure TfrmPrincipal.MNZeraEstoqueNegativoClick(Sender: TObject);
begin
  try
    frmZeraNegativo := TfrmZeraNegativo.Create(Application);
    frmZeraNegativo.ShowModal;
  finally
    frmZeraNegativo.Release;
  end;
end;

procedure TfrmPrincipal.MNMapadeAnliseFinanceiraClick(Sender: TObject);
begin
  try
    frmParFPG := TfrmParFPG.Create(Application);
    frmParFPG.ShowModal;
  finally
    frmParFPG.Release;
  end;
end;

procedure TfrmPrincipal.MMPermissesClick(Sender: TObject);
begin
  try
    frmPermissoes := TfrmPermissoes.Create(Application);
    frmPermissoes.ShowModal;
  finally
    frmPermissoes.Release;
  end;
end;

procedure TfrmPrincipal.MNAcertaClick(Sender: TObject);
begin
  try
    frmAcerta := TfrmAcerta.Create(Application);
    frmAcerta.Tag := 1;
    frmAcerta.ShowModal;
  finally
    frmAcerta.Release;
  end;
end;

procedure TfrmPrincipal.MnAlterarSenhaClick(Sender: TObject);
begin
  try
    frmTrocaSenha := TfrmTrocaSenha.Create(Application);
    frmTrocaSenha.ShowModal;
  finally
    frmTrocaSenha.Release;
  end;
end;

procedure TfrmPrincipal.MNAtualizaoClick(Sender: TObject);
begin

  if not Dados.IsGlobalOffline then
  begin
    try
      FrmAtualiza := TFrmAtualiza.Create(Application);
      FrmAtualiza.Tag := 2;
      FrmAtualiza.ShowModal;
    finally
      FrmAtualiza.Release;
    end;
  end
  else
    ShowMessage('Verifique a conex„o com a internet!');

end;

procedure TfrmPrincipal.MnBackupClick(Sender: TObject);
begin
  try
    frmBackup := TfrmBackup.Create(Application);
    frmBackup.ShowModal;
  finally
    frmBackup.Release;
  end;
end;

procedure TfrmPrincipal.MNAjustaPrecoClick(Sender: TObject);
begin
  try
    frmAjustaPreco := TfrmAjustaPreco.Create(Application);
    frmAjustaPreco.ShowModal;
  finally
    frmAjustaPreco.Release;
  end;
end;

procedure TfrmPrincipal.MNAjustaMenuClick(Sender: TObject);
var
  nivel, i, j, k, l, cont, cont1: Integer;

begin
  // esta funÁ„o percorre menu e sub menus e insere na tela

  Dados.QryTelas.Close;
  Dados.QryTelas.Open;

  for i := 0 to MmPrincipal.items.Count - 1 do
  begin
    // verifica menu principal
    if (Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].Name, [])) then
    begin
      if (MmPrincipal.items.items[i].Caption <> '-') then
      begin
        Dados.QryTelas.Edit;
        Dados.qryTelasFLAG.Value := '*';
        Dados.QryTelas.Post;
      end;
    end
  end;

  for i := 0 to MmPrincipal.items.Count - 1 do
  begin // menu principal
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      // verifica submenu 1∫ nivel
      if (Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].items[j]
        .Name, [])) then
      begin
        if MmPrincipal.items.items[i].items[j].Caption <> '-' then
        begin
          Dados.QryTelas.Edit;
          Dados.qryTelasFLAG.Value := '*';
          Dados.QryTelas.Post;
        end;
      end;
    end;
  end;

  for i := 0 to MmPrincipal.items.Count - 1 do
  begin // menu
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      // submenu 1∫ nivel
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
      begin
        // submenu 2∫ nivel
        if (Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].items[j]
          .items[k].Name, [])) then
        begin
          if MmPrincipal.items.items[i].items[j].items[k].Caption <> '-' then
          begin
            Dados.QryTelas.Edit;
            Dados.qryTelasFLAG.Value := '*';
            Dados.QryTelas.Post;
          end;
        end;
      end;
    end;
  end;

  for i := 0 to MmPrincipal.items.Count - 1 do
  begin // menu
    for j := 0 to MmPrincipal.items.items[i].Count - 1 do
    begin
      // submenu 1∫ nivel
      for k := 0 to MmPrincipal.items.items[i].items[j].Count - 1 do
      begin
        // submenu 2∫ nivel
        for l := 0 to MmPrincipal.items.items[i].items[j].items[k].Count - 1 do
        begin
          // submenu 3∫ nivel
          if MmPrincipal.items.items[i].items[j].items[k].items[l].Caption <> '-'
          then
          begin
            if (Dados.QryTelas.locate('TELA', MmPrincipal.items.items[i].items
              [j].items[k].items[l].Name, [])) then
            begin
              Dados.QryTelas.Edit;
              Dados.qryTelasFLAG.Value := '*';
              Dados.QryTelas.Post;
            end
          end;
        end;
      end;
    end;
  end;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := 'delete from telas where flag<>''*''';;
  Dados.qryExecute.ExecSQL;

  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := 'update telas set flag=''S''';;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Application.ProcessMessages;
  ShowMessage('Menu Ajusta com sucesso!');

end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin
  try
    frmBackup := TfrmBackup.Create(Application);
    frmBackup.ShowModal;
  finally
    frmBackup.Release;
  end;
end;

procedure TfrmPrincipal.btnCaixaClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmCaixa);
  end
  else
    FTDI.MostrarFormulario(TfrmCaixa, false);
end;

procedure TfrmPrincipal.btnCompraClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmCompra);
  end
  else
    FTDI.MostrarFormulario(TfrmCompra, false);
end;

procedure TfrmPrincipal.BtnCTeClick(Sender: TObject);
begin
  if MNCTe.Enabled then
    MNCTeClick(SELF)
  else
    MnCTEOSClick(SELF);
end;

procedure TfrmPrincipal.btnPessoasClick(Sender: TObject);
begin
  if FTDI = nil then
  begin
    Align := alClient;
    FTDI := TTDI.Create(SELF, TfrmPessoas);
  end
  else
    FTDI.MostrarFormulario(TfrmPessoas, false);
end;

procedure TfrmPrincipal.btnPessoasMouseLeave(Sender: TObject);
begin
  (Sender as TSpeedButton).Font.Style := [];
  (Sender as TSpeedButton).Font.Color := clGray;

end;

procedure TfrmPrincipal.btnPessoasMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  (Sender as TSpeedButton).Font.Style := [fsBold];
  (Sender as TSpeedButton).Font.Color := clBlue;
end;

end.
