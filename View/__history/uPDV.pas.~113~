unit uPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math, ACBrDevice, shellapi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, Vcl.DBCtrls, Vcl.Mask, ACBrDFeSSL,
  System.Actions, ACBrDeviceSerial, pcnConversao, pcnConversaoNFe, ACBrUtil,
  Vcl.ActnList, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Tabs, blcksock,
  ACBrPosPrinter, ACBrBase, ACBrDFe, ACBrNFe, Vcl.Menus, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, DBCtrlsEh, DBLookupEh,
  ACBrBAL, Vcl.ExtDlgs, ACBrDFeReport, ACBrDFeDANFeReport, ACBrDANFCeFortesFrA4,
  ACBrEnterTab, ACBrTroco, JvComponentBase, JvXPCore, Vcl.DBCGrids, frxClass,
  frxDBSet, frxExportBaseDialog, frxExportPDF, ACBrTEFD, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage, cxDBEdit,
  ACBrLCB, ACBrInStore;

type
  TFrmPDV = class(TForm)
    ActionList1: TActionList;
    actLerPeso: TAction;
    dsPesqProd: TDataSource;
    qryPesqProd: TFDQuery;
    qryVenda: TFDQuery;
    dsVenda: TDataSource;
    qryVendaCODIGO: TIntegerField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaDATA_SAIDA: TDateField;
    qryVendaID_CLIENTE: TIntegerField;
    qryVendaFK_USUARIO: TIntegerField;
    qryVendaFK_CAIXA: TIntegerField;
    qryVendaFK_VENDEDOR: TIntegerField;
    qryVendaCPF_NOTA: TStringField;
    qryVendaTIPO_DESCONTO: TStringField;
    qryVendaOBSERVACOES: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryItem: TFDQuery;
    dsItem: TDataSource;
    qryItemCODIGO: TIntegerField;
    qryItemFKVENDA: TIntegerField;
    qryItemID_PRODUTO: TIntegerField;
    qryItemSITUACAO: TStringField;
    qryItemUNIDADE: TStringField;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryItemDESCRICAO_SL: TStringField;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_VENDEDOR: TStringField;
    qryItemTTOTAL: TAggregateField;
    qryVendaFKEMPRESA: TIntegerField;
    qryProdEFISCAL: TStringField;
    qryVendaTIPO: TStringField;
    qryVendaFKORCAMENTO: TIntegerField;
    qryVendaNECF: TIntegerField;
    qryItemITEM: TSmallintField;
    qryItemCOD_BARRA: TStringField;
    qryItemEFISCAL: TStringField;
    qrySoma: TFDQuery;
    qryConta_Movimento: TFDQuery;
    qryConta_MovimentoID_CONTA_CAIXA: TIntegerField;
    qryConta_MovimentoDATA: TDateField;
    qryConta_MovimentoHORA: TTimeField;
    qryConta_MovimentoFKVENDA: TIntegerField;
    qryConta_MovimentoLOTE: TIntegerField;
    qryConta_MovimentoID_USUARIO: TIntegerField;
    qryVendaLOTE: TIntegerField;
    qryBuscaVenda: TFDQuery;
    dsEmpresa: TDataSource;
    qryVendaVirtualEmpresa: TStringField;
    qryConta_MovimentoCODIGO: TIntegerField;
    qryVendaGERA_FINANCEIRO: TStringField;
    qryVendaFK_TABELA: TIntegerField;
    qryTabela: TFDQuery;
    qryTabelaCODIGO: TIntegerField;
    qryTabelaDESCRICAO: TStringField;
    qryTabelaFKEMPRESA: TIntegerField;
    qryTabelaATIVO: TStringField;
    qryVendaVIRTUAL_TABELA: TStringField;
    qryVendaVIRTUAL_TX_ACRESC: TFloatField;
    qryComposicao: TFDQuery;
    qryComposicaoID_PRODUTO: TIntegerField;
    qryConta_MovimentoHISTORICO: TStringField;
    qryVendaVIRTUAL_CNPJ: TStringField;
    qryBuscaVendaCODIGO: TIntegerField;
    qryVendaSUBTOTAL: TFMTBCDField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaTROCO: TFMTBCDField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaPERCENTUAL: TFMTBCDField;
    qryVendaPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryVendaACRESCIMO: TFMTBCDField;
    qryVendaPEDIDO: TStringField;
    qryItemPRECO: TFMTBCDField;
    qryItemVALOR_ITEM: TFMTBCDField;
    qryItemVDESCONTO: TFMTBCDField;
    qryItemTOTAL: TFMTBCDField;
    qryItemACRESCIMO: TFMTBCDField;
    qryProdE_MEDIO: TFMTBCDField;
    qryConta_MovimentoENTRADA: TFMTBCDField;
    qryConta_MovimentoSAIDA: TFMTBCDField;
    qrySomaTOTAL: TFMTBCDField;
    qryTabelaACRESCIMO: TFMTBCDField;
    qryItemQTD: TFMTBCDField;
    qryItemE_MEDIO: TFMTBCDField;
    qryItemQTD_DEVOLVIDA: TFMTBCDField;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteCNPJ: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteNUMERO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteMUNICIPIO: TStringField;
    qryClienteUF: TStringField;
    qryClienteCEP: TStringField;
    qryClienteFONE1: TStringField;
    qryClienteCELULAR1: TStringField;
    qryComposicaoQUANTIDADE: TFMTBCDField;
    qryVendaTOTAL_TROCA: TFMTBCDField;
    qryContas: TFDQuery;
    qryContasCODIGO: TIntegerField;
    qryContasDESCRICAO: TStringField;
    qryContasTIPO: TStringField;
    qryContasDATA_ABERTURA: TDateField;
    qryContasID_USUARIO: TIntegerField;
    qryContasEMPRESA: TIntegerField;
    qryContasLOTE: TIntegerField;
    qryContasSITUACAO: TStringField;
    qryItemFK_GRADE: TIntegerField;
    qryGrade: TFDQuery;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    dsGrade: TDataSource;
    qryGradeCODIGO: TIntegerField;
    actBusca: TAction;
    qryConta_MovimentoTROCA: TFMTBCDField;
    qryConta_MovimentoSALDO: TFMTBCDField;
    qryGradePRECO: TFMTBCDField;
    qryVendaOS: TStringField;
    qryVendaFK_OS: TIntegerField;
    actReceber: TAction;
    Timer1: TTimer;
    qryVendaFORMA_PAGAMENTO: TStringField;
    Panel6: TPanel;
    Panel2: TPanel;
    imgLogo: TImage;
    qryPesqConta: TFDQuery;
    qryPesqContaCODIGO: TIntegerField;
    qryPesqContaDESCRICAO: TStringField;
    qryPesqContaTIPO: TStringField;
    qryPesqContaDATA_ABERTURA: TDateField;
    qryPesqContaID_USUARIO: TIntegerField;
    qryPesqContaEMPRESA: TIntegerField;
    qryPesqContaLOTE: TIntegerField;
    qryPesqContaSITUACAO: TStringField;
    qryItemOS: TStringField;
    OpenPicture: TOpenPictureDialog;
    Label1: TLabel;
    qryPesqProdCODIGO: TIntegerField;
    qryPesqProdDESCRICAO: TStringField;
    qryPesqProdCFOP: TStringField;
    qryPesqProdCODBARRA: TStringField;
    qryPesqProdNCM: TStringField;
    qryPesqProdREFERENCIA: TStringField;
    qryPesqProdPR_VENDA: TFMTBCDField;
    qryPesqProdPRECO_ATACADO: TFMTBCDField;
    qryPesqProdQTD_ATACADO: TFMTBCDField;
    qryPesqProdQTD_ATUAL: TFMTBCDField;
    qryPesqProdUNIDADE: TStringField;
    qryPesqProdEFISCAL: TStringField;
    qryPesqProdE_MEDIO: TFMTBCDField;
    qryPesqProdLOCALIZACAO: TStringField;
    qryPesqProdPRECO_PROMO_VAREJO: TFMTBCDField;
    qryPesqProdPRECO_PROMO_ATACADO: TFMTBCDField;
    qryPesqProdPRECO_VARIAVEL: TStringField;
    qryPesqProdDESCONTO: TCurrencyField;
    qryPesqProdINICIO_PROMOCAO: TDateField;
    qryPesqProdFIM_PROMOCAO: TDateField;
    qryPesqProdSERVICO: TStringField;
    qryPesqProdREMEDIO: TStringField;
    qryPesqProdGRADE: TStringField;
    qryPesqProdPREFIXO_BALANCA: TStringField;
    qryPesqProdVIRTUAL_PRECO: TExtendedField;
    actAbrir: TAction;
    ACBrBAL1: TACBrBAL;
    StatusBar1: TStatusBar;
    qryPesqProdPRODUTO_PESADO: TStringField;
    qryPesqProdQTD_FISCAL: TFMTBCDField;
    qryProdQTD_FISCAL: TFMTBCDField;
    qryItemQTD_FISCAL: TExtendedField;
    actCliente: TAction;
    actReimprimir: TAction;
    qryPesqProdSERIAL: TStringField;
    Timer2: TTimer;
    qtdAtacado: TFDQuery;
    Panel1: TPanel;
    PageControl2: TPageControl;
    TabPDV: TTabSheet;
    tabRestaurante: TTabSheet;
    pnRestaurante: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Panel4: TPanel;
    imgLivre: TImage;
    ImgOcupado: TImage;
    DBText2: TDBText;
    Panel5: TPanel;
    Label11: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    tabDelivery: TTabSheet;
    PanelRestaurante: TPanel;
    DBGridR: TDBGridEh;
    PanelPDV: TPanel;
    DBGridP: TDBGridEh;
    grpSelecaoP: TGroupBox;
    EdtProdutoP: TEdit;
    Panel10: TPanel;
    Panel16: TPanel;
    GrpPrecoP: TGroupBox;
    edtPrecoP: TEdit;
    GrpQtdP: TGroupBox;
    edtQtdP: TEdit;
    grpTotalP: TGroupBox;
    lblTotalP: TLabel;
    dsMesas: TDataSource;
    PnCabecalhoR: TPanel;
    grpDescricao: TGroupBox;
    edtProdutoR: TEdit;
    grpQtd: TGroupBox;
    edtQtdR: TEdit;
    grpPreco: TGroupBox;
    edtPrecoR: TEdit;
    grpTotalItem: TGroupBox;
    lblTotalR: TLabel;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBPedido: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    qryVendaFK_MESA: TIntegerField;
    grpObs: TGroupBox;
    edtOBSR: TEdit;
    qryItemDESCRICAO_OBS: TStringField;
    qryItemOBSERVACAO: TStringField;
    qryBuscaFone: TFDQuery;
    qryBuscaFoneCODIGO: TIntegerField;
    qryBuscaFoneFANTASIA: TStringField;
    qryBuscaFoneENDERECO: TStringField;
    qryBuscaFoneNUMERO: TStringField;
    qryBuscaFoneBAIRRO: TStringField;
    qryBuscaFoneMUNICIPIO: TStringField;
    qryBuscaFoneUF: TStringField;
    qryBuscaFoneCEP: TStringField;
    qryBuscaFoneCOMPLEMENTO: TStringField;
    dsBuscaFone: TDataSource;
    qryVendaFK_ENTREGADOR: TIntegerField;
    qryEntregador: TFDQuery;
    qryEntregadorCODIGO: TIntegerField;
    qryEntregadorNOME: TStringField;
    dsEntregador: TDataSource;
    qryVendaVIRTUAL_ENTREGADOR: TStringField;
    qryVendaNOME: TStringField;
    DBGridBuscaR: TDBGridEh;
    qryBuscaFoneCELULAR1: TStringField;
    grpTotalGeralP: TGroupBox;
    DBText1: TDBText;
    PopupMenu1: TPopupMenu;
    actTEF: TAction;
    actDesconto: TAction;
    Panel7: TPanel;
    btnCancVenda: TLabel;
    btnFinaliza: TLabel;
    btnResumo: TLabel;
    btnImportar: TLabel;
    btnAvancada: TLabel;
    btnVendedor: TLabel;
    btnCaixa: TLabel;
    btnSangria: TLabel;
    BtnSuprimento: TLabel;
    btnRemoveProduto: TLabel;
    btnReceber: TLabel;
    btnBuscaPreco: TLabel;
    btnDelItem: TLabel;
    btnGaveta: TLabel;
    btnClientes: TLabel;
    btnReimprimir: TLabel;
    btnTef: TLabel;
    btnDesconto: TLabel;
    btnAtualizaMesa: TLabel;
    btnTransferirMesa: TLabel;
    btnImprimirPedidos: TLabel;
    Panel8: TPanel;
    Label14: TLabel;
    lblGeral: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter5: TSplitter;
    qryVendaVIRTUAL_CELULAR: TStringField;
    qryVendaVIRTUAL_ENDERECO: TStringField;
    qryVendaVIRTUAL_NUMERO: TStringField;
    qryVendaVIRTUAL_BAIRRO: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryVendaVIRTUAL_COMPLEMENTO: TStringField;
    qryPedido: TFDQuery;
    btnImprimeItem: TLabel;
    actImprimeItem: TAction;
    actImprimePedido: TAction;
    actTranfereMesa: TAction;
    actAtualizaMesa: TAction;
    qryPedidoCODIGO: TIntegerField;
    pnDelivery: TPanel;
    DBGridD: TDBGridEh;
    Panel13: TPanel;
    grpCliente: TGroupBox;
    edtCliente: TLabel;
    pnEndereco: TPanel;
    grpTelefone: TGroupBox;
    edtFone: TMaskEdit;
    DBGridBuscaD: TDBGridEh;
    Panel14: TPanel;
    PageControl3: TPageControl;
    TabSheet2: TTabSheet;
    Panel15: TPanel;
    GroupBox3: TGroupBox;
    EdtPrecoD: TEdit;
    GroupBox4: TGroupBox;
    EdtQtdD: TEdit;
    GroupBox6: TGroupBox;
    edtProdutoD: TEdit;
    GroupBox1: TGroupBox;
    edtObsD: TEdit;
    GroupBox5: TGroupBox;
    lblTotalD: TLabel;
    Panel19: TPanel;
    Label3: TLabel;
    lblGeralD: TLabel;
    Splitter4: TSplitter;
    Observações: TTabSheet;
    DBMemo1: TDBMemo;
    DBGridBuscaP: TDBGridEh;
    DBGridClie: TDBGridEh;
    qryProdTIPO_ALIMENTO: TStringField;
    qryItemVIRTUAL_TIPO_ALIMENTO: TStringField;
    btnAbrirMesa: TLabel;
    actAbrirMesa: TAction;
    qryProdCOMISSAOPERCENTUAL: TFMTBCDField;
    qryProdVALORCOMISSAO: TFMTBCDField;
    qryProdULTFORN: TIntegerField;
    qryPesqProdULTFORN: TIntegerField;
    qryProdFOTO: TBlobField;
    qryPesqProdFOTO: TBlobField;
    cxDBImage1: TcxDBImage;
    ACBrLCB1: TACBrLCB;
    ACBrInStore1: TACBrInStore;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtProdutoPChange(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure btnFinalizaClick(Sender: TObject);
    procedure qryVendaDESCONTOValidate(Sender: TField);
    procedure EdtProdutoPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryVendaAfterOpen(DataSet: TDataSet);
    procedure qryItemBeforeOpen(DataSet: TDataSet);
    procedure qryVendaBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnResumoClick(Sender: TObject);
    procedure edtQtdPEnter(Sender: TObject);
    procedure edtPrecoPExit(Sender: TObject);
    procedure btnSangriaClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure qryConta_MovimentoBeforePost(DataSet: TDataSet);
    procedure edtPrecoPKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdPExit(Sender: TObject);
    procedure DBGridBuscaPDblClick(Sender: TObject);
    procedure DBGridBuscaPKeyPress(Sender: TObject; var Key: Char);
    procedure qryPesqProdCalcFields(DataSet: TDataSet);
    procedure edtQtdPKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure qryItemAfterDelete(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure DBGridPDblClick(Sender: TObject);
    procedure BtnSuprimentoClick(Sender: TObject);
    procedure qryItemQTDValidate(Sender: TField);
    procedure qryItemVALOR_ITEMValidate(Sender: TField);
    procedure actReceberExecute(Sender: TObject);
    procedure actBuscaExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRemoveProdutoClick(Sender: TObject);
    procedure qryVendaAfterDelete(DataSet: TDataSet);
    procedure qryVendaAfterPost(DataSet: TDataSet);
    procedure qryItemBeforePost(DataSet: TDataSet);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure actAbrirExecute(Sender: TObject);
    procedure ACBrBAL1LePeso(Peso: Double; Resposta: AnsiString);
    procedure actClienteExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnAvancadaClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure btnCancVendaClick(Sender: TObject);
    procedure btnAtualizaMesaClick(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure edtProdutoREnter(Sender: TObject);
    procedure edtProdutoDEnter(Sender: TObject);
    procedure imgLivreDblClick(Sender: TObject);
    procedure dsItemDataChange(Sender: TObject; Field: TField);
    procedure ImgOcupadoClick(Sender: TObject);
    procedure btnFecharMesaClick(Sender: TObject);
    procedure btnTransferirMesaClick(Sender: TObject);
    procedure edtOBSRKeyPress(Sender: TObject; var Key: Char);
    procedure qryItemCalcFields(DataSet: TDataSet);
    procedure edtOBSRExit(Sender: TObject);
    procedure edtFoneChange(Sender: TObject);
    procedure btnEntregadorClick(Sender: TObject);
    procedure edtFoneExit(Sender: TObject);
    procedure edtFoneKeyPress(Sender: TObject; var Key: Char);
    procedure btnTefClick(Sender: TObject);
    procedure actTEFExecute(Sender: TObject);
    procedure btnDescontoClick(Sender: TObject);
    procedure actDescontoExecute(Sender: TObject);
    procedure edtProdutoRChange(Sender: TObject);
    procedure edtProdutoDChange(Sender: TObject);
    procedure edtObsDExit(Sender: TObject);
    procedure edtObsDKeyPress(Sender: TObject; var Key: Char);
    procedure qryVendaCalcFields(DataSet: TDataSet);
    procedure btnImprimirPedidosClick(Sender: TObject);
    procedure btnImprimeItemClick(Sender: TObject);
    procedure actImprimeItemExecute(Sender: TObject);
    procedure actImprimePedidoExecute(Sender: TObject);
    procedure actTranfereMesaExecute(Sender: TObject);
    procedure actAtualizaMesaExecute(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure btnAbrirMesaClick(Sender: TObject);
    procedure actAbrirMesaExecute(Sender: TObject);
    procedure btnReimprimirClick(Sender: TObject);
    procedure actReimprimirExecute(Sender: TObject);
    procedure imgLogoDblClick(Sender: TObject);
    procedure ACBrInStore1GetPrecoUnitario(const Codigo: string;
      var PrecoUnitario: Double);
  private
    vSql, vSQLVenda, vSqlBusca: string;
    ehCaixaRapido: string;
    vSerie: String;
    ClicouMesa, CaixaAberto, PesquisaProduto: Boolean;
    FGrade: Integer;

    vPosicao, vItem: Integer;
    vPesquisa: string;

    procedure BuscaPreco(Descricao: String);
    procedure ItemDesconhecido;
    procedure InsereItem(Descricao, OBSERVACAO: String;
      Preco, Qtd, Total: Extended);
    function GerouNFCe(operacao: string): string;
    function ValidaItem(Qtd, vPreco: Extended): Boolean;
    procedure PrecoVariavel;
    procedure tamanho;
    function UltimaVenda: Integer;
    procedure InsereComposicao(produto: Integer);
    procedure PesquisaCodBarra(FPesquisa, Descricao: String);
    procedure PesquisaDescricao(FPesquisa: String);
    procedure FecharCaixa;
    procedure AbreCaixa;
    procedure AtualizaVendedor;
    procedure AtualziaPrecoGrade(Qtd: Extended);
    procedure ChamaGrade;
    procedure PesquisaCodBarraBalanca(FPesquisa: string);
    procedure PesquisaCodBarraGeral(FPesquisa: string);
    procedure FinalizaVenda;
    procedure CalculaTotalVenda(idVenda: Integer);
    function RetornaMaiorItem(idVenda: Integer): Integer;
    procedure CarregaImagem;
    procedure GeraSqlProduto;
    procedure AtualizaDescricao(Descricao: String);
    procedure FechaVenda(Descricao: String);
    function validaComposicao(produto: Integer): Boolean;
    procedure BuscaPeso;
    procedure ConfiguraBalanca;
    procedure ChamaSerial;
    function BaixaSerial(idProduto: Integer; idVenda: Integer; valor: Extended;
      Serie: String): Integer;
    procedure ProdutoCalcFieldGenerico(Descricao: string; Qtd: Extended);
    procedure DescricaoSetFocus(Op: String);
    procedure DBGridSetFocus;
    procedure PreencheBuscaPreco;
    procedure PesquisaCliente;
    procedure AtualizaEntregador;
    procedure SituacaoPedido;
    procedure ChamaLogin;
    procedure ConfiguraTipodecaixa;
    procedure PesquisaTipoTerminal;
    procedure HabilitaPreVenda;
    procedure ChamaAbertura;
    function SituacaoCaixa: Boolean;
    procedure CaixaHoje;
    procedure ChecaATACADO(produto, venda: Integer);
    procedure Restaurante_Status_Mesa;
    procedure Retaurante_abre_mesa;
    function BuscaNumeroVenda: Integer;
    procedure AbreVenda(Codigo: Integer; tela: String);
    procedure AtualizaPreco(NovoPreco: Extended);
    procedure CadPessoaRapido(Codigo: Integer);
    procedure VerificaFone;
    procedure ImprimeRestaurante;
    procedure ReabrirPedido;
    procedure ImprimeDelivery;
    procedure ImprimeItem;
    procedure GetIdCliente;
    procedure ImprimeRestaurantePadrao;
    procedure ImprimeRestauranteBar;
    procedure ImprimeRestauranteCozinha;
    procedure AlinhaBotoes;
    procedure Carregaimagem2;

    { Private declarations }
  public
    CodigoGrade, CodigoFKFornecedor: Integer;
    PodeAtualizarEstoque: Boolean;
    valor, valorcomissao, percentual  : Real;
    codificacaobalanca, PrecoBalancaUn: string;
    procedure habilitacampos(campos: Boolean);
    procedure inserevenda;
    procedure FecharPrevenda;
    procedure MostraCaixa;
    procedure VendaExiste;
    procedure CalcTotalMesa;
    procedure DecodificaBalanca(Codigo: string);
    { Public declarations }
  end;

var
  FrmPDV: TFrmPDV;

implementation

{$R *.dfm}

uses Udados, uAbreCaixa, uSuprimento_Sangria,
  uFormaPagamento, uImportar, uResumoCaixa, uSupervisor, uCadProduto,
  uBuscaPreco, uConsReceber, uPesquisaPrincipio, uSplash, uAcesso,
  uMenuImportarPDV, uConsVendedor, uGrade, uRemoveProduto, uCadPessoa, uResumo,
  uChave, uTransfComanda, uConsEntregador, uTef, uDmNFe, uDmPDV, uDesconhecido,
  uCadPessoaRapido, udmImpressao, uReimprimir, uDMEstoque;

function TFrmPDV.BaixaSerial(idProduto: Integer; idVenda: Integer;
  valor: Extended; Serie: String): Integer;
begin
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Add(' select codigo from produto_serial');
  Dados.qryConsulta.SQL.Add(' where');
  Dados.qryConsulta.SQL.Add(' id_produto=:id and numero_serie=:serie');
  Dados.qryConsulta.Params[0].Value := idProduto;
  Dados.qryConsulta.Params[1].Value := Serie;
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.IsEmpty then
  begin
    result := Dados.qryConsulta.Fields[0].AsInteger;
  end
  else
  begin
    result := 0;
    raise Exception.Create('Serial não foi encontrado!');
  end;

end;

procedure TFrmPDV.tamanho;
begin
  DBGridBuscaP.Left := DBGridP.Left;
  DBGridBuscaP.Width := DBGridP.Width;
  DBGridBuscaP.Top := DBGridP.Top;

  if Screen.Width = 1024 then
  begin

    DBGridP.Columns[0].Width := round(Screen.Width * 0.04);
    DBGridP.Columns[1].Width := round(Screen.Width * 0.05);
    DBGridP.Columns[2].Width := round(Screen.Width * 0.30);
    DBGridP.Columns[3].Width := round(Screen.Width * 0.05);
    DBGridP.Columns[4].Width := round(Screen.Width * 0.03);
    DBGridP.Columns[5].Width := round(Screen.Width * 0.06);
    DBGridP.Columns[6].Width := round(Screen.Width * 0.06);

    DBGridBuscaP.Columns[0].Width := round(Screen.Width * 0.04);
    DBGridBuscaP.Columns[1].Width := round(Screen.Width * 0.30);
    DBGridBuscaP.Columns[2].Width := round(Screen.Width * 0.08);
    DBGridBuscaP.Columns[3].Width := round(Screen.Width * 0.05);
    DBGridBuscaP.Columns[4].Width := round(Screen.Width * 0.03);
    DBGridBuscaP.Columns[5].Width := round(Screen.Width * 0.10);
  end
  else
  begin

    DBGridP.Columns[0].Width := round(Screen.Width * 0.04);
    DBGridP.Columns[1].Width := round(Screen.Width * 0.05);
    DBGridP.Columns[2].Width := round(Screen.Width * 0.33);
    DBGridP.Columns[3].Width := round(Screen.Width * 0.05);
    DBGridP.Columns[4].Width := round(Screen.Width * 0.06);
    DBGridP.Columns[5].Width := round(Screen.Width * 0.07);
    DBGridP.Columns[6].Width := round(Screen.Width * 0.07);

    DBGridBuscaP.Columns[0].Width := round(Screen.Width * 0.04);
    DBGridBuscaP.Columns[1].Width := round(Screen.Width * 0.30);
    DBGridBuscaP.Columns[2].Width := round(Screen.Width * 0.08);
    DBGridBuscaP.Columns[3].Width := round(Screen.Width * 0.05);
    DBGridBuscaP.Columns[4].Width := round(Screen.Width * 0.03);
    DBGridBuscaP.Columns[5].Width := round(Screen.Width * 0.10);

  end;

  GrpQtdP.Width := round(Panel10.Width * 0.21);
  GrpPrecoP.Width := round(Panel10.Width * 0.21);
  grpTotalP.Width := round(Panel10.Width * 0.22);
  grpTotalGeralP.Width := round(Panel10.Width * 0.36);

end;

procedure TFrmPDV.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[3].Text := DateTimeToStr(now);
end;

procedure TFrmPDV.Timer2Timer(Sender: TObject);
begin
  {
    Timer2.Enabled := false;

    if not Dados.vRetaguarda then
    begin
    if Dados.BloqueiaValidade then
    begin
    try
    frmChave := TfrmChave.Create(Application);
    frmChave.ShowModal;
    finally
    frmChave.Release;
    Application.Terminate;
    end;
    end;
    end; }
end;

procedure TFrmPDV.btnFecharMesaClick(Sender: TObject);
begin
  btnFinalizaClick(self);
end;

function TiraPontos(Str: string): string;
var
  i, Count: Integer;
begin
  SetLength(result, Length(Str));
  Count := 0;
  for i := 1 to Length(Str) do
  begin
    if not CharInSet(Str[i], ['/', ',', '-', '.', ')', '(', ' ', '_']) then
    begin
      inc(Count);
      result[Count] := Str[i];
    end;
  end;
  SetLength(result, Count);
end;

procedure TFrmPDV.BtnSuprimentoClick(Sender: TObject);
begin

  if not BtnSuprimento.Visible then
    exit;

  if Dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
  Begin
    Dados.vAutorizar := true;
    if not Dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if not Dados.vAutorizar then
    begin
      exit;
    end;
  end;

  try
    FrmSuprimento_Sangria := TFrmSuprimento_Sangria.Create(Application);
    FrmSuprimento_Sangria.vTipo := '2';
    FrmSuprimento_Sangria.ShowModal;
  finally

    FrmSuprimento_Sangria.Release;
  end;
end;

procedure TFrmPDV.btnTransferirMesaClick(Sender: TObject);
begin

  if not btnTransferirMesa.Visible then
    exit;

  try
    frmTransfComanda := TfrmTransfComanda.Create(Application);
    frmTransfComanda.ShowModal;
  finally
    frmTransfComanda.Release;
  end;
end;

procedure TFrmPDV.btnVendedorClick(Sender: TObject);
begin

  if not btnVendedor.Visible then
    exit;

  try
    frmconsVendedor := TfrmconsVendedor.Create(Application);
    frmconsVendedor.idVendedor := qryVendaFK_VENDEDOR.Value;
    frmconsVendedor.vNome := qryVendaVIRTUAL_VENDEDOR.Value;
    frmconsVendedor.ShowModal;
  finally
    AtualizaVendedor;
    StatusBar1.Panels[2].Text := 'Vendedor:' + frmconsVendedor.vNome;
    frmconsVendedor.Release;
  end;
end;

procedure TFrmPDV.BuscaPreco(Descricao: String);
var
  vQtd, vPreco, vTotal: real;
  sTotal: string;
  vPrefixo, vProduto: String;
begin

  if (qryPesqProdPREFIXO_BALANCA.AsString = '') or
    (qryPesqProdPREFIXO_BALANCA.IsNull) then
  begin
    vProduto := '0';
    vProduto := '1';
  end
  else
  begin
    vProduto := copy(Descricao, 1, 1);
    vPrefixo := Dados.qryConfigPREFIXO_BALANCA.Value;
  end;

  if vPrefixo = vProduto then
  begin
    if Pos('*', Descricao) = 0 then
    begin
      case Dados.qryConfigMODELO_BALANCA.Value of
        3:
          begin

            sTotal := copy(Descricao, 8, 5);
            vTotal := StrToFloatDef(sTotal, 0);
            vTotal := RoundABNT((vTotal / 100), 2);
            vQtd := 1;

            if qryPesqProdVIRTUAL_PRECO.Value > 0 then
              vQtd := vTotal / qryPesqProdVIRTUAL_PRECO.AsFloat;

            if PageControl2.ActivePage = TabPDV then
            begin
              edtPrecoP.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalP.Caption := FloatToStr(vTotal);
              edtQtdP.Text := FloatToStr(SimpleRoundTo(vQtd, -3));
            end;

            if PageControl2.ActivePage = tabRestaurante then // Restaurante
            begin
              edtPrecoR.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalR.Caption := FloatToStr(vTotal);
              edtQtdR.Text := FloatToStr(SimpleRoundTo(vQtd, -3));
            end;

            if PageControl2.ActivePage = tabDelivery then // Delivery
            begin
              EdtPrecoD.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalD.Caption := FloatToStr(vTotal);
              EdtQtdD.Text := FloatToStr(SimpleRoundTo(vQtd, -3));
            end;

          end;

        1, 2, 4:
          begin

            sTotal := copy(Descricao, 8, 5);
            vQtd := (StrToFloatDef(sTotal, 1));

            if (qryPesqProdUNIDADE.Value = 'UN') or
              (qryPesqProdUNIDADE.Value = 'PC') then
              vQtd := Dados.truncar((vQtd), 3)
            else
              vQtd := Dados.truncar((vQtd / 1000), 3);

            vTotal := vQtd * qryPesqProdVIRTUAL_PRECO.AsFloat;
            vTotal := RoundABNT(vTotal, 2);

            if PageControl2.ActivePage = tabRestaurante then // Restaurante
            begin
              edtPrecoR.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalR.Caption := FormatFloat('0.00', vTotal);
              edtQtdR.Text := FormatFloat('0.000', vQtd);

            end;
            if PageControl2.ActivePage = tabDelivery then // Delivery
            begin
              EdtPrecoD.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalD.Caption := FormatFloat('0.00', vTotal);
              EdtQtdD.Text := FormatFloat('0.000', vQtd);
            end;
            if PageControl2.ActivePage = TabPDV then
            begin
              edtPrecoP.Text := FormatFloat('0.00',
                qryPesqProdVIRTUAL_PRECO.AsFloat);
              lblTotalP.Caption := FormatFloat('0.00', vTotal);
              edtQtdP.Text := FormatFloat('0.000', vQtd);
            end;

          end;
      end;
    end
    else
    begin
      try
        vQtd := StrToFloatDef((copy(Descricao, 1, Pos('*', Descricao) - 1)), 1);

        if PageControl2.ActivePage = tabRestaurante then // Restaurante
        begin
          edtQtdR.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          edtPrecoR.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          lblTotalR.Caption := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
        end;
        if PageControl2.ActivePage = tabDelivery then // Delivery
        begin
          EdtQtdD.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          EdtPrecoD.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          lblTotalD.Caption := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
        end;
        if PageControl2.ActivePage = TabPDV then
        begin
          edtQtdP.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          edtPrecoP.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);

          lblTotalP.Caption := FormatFloat('0.00',
            RoundABNT(qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd, 2));

        end;

        if qryPesqProdGRADE.Value = 'S' then
        begin
          if qryGradePRECO.AsFloat > 0 then
          begin
            if PageControl2.ActivePage = TabPDV then // PDV
            begin
              edtPrecoP.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
              lblTotalP.Caption :=
                FormatFloat('0.00', RoundABNT(qryGradePRECO.AsFloat * vQtd, 2));
            end;
            if PageControl2.ActivePage = tabRestaurante then // Restaurante
            begin
              edtPrecoR.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
              lblTotalR.Caption :=
                FormatFloat('0.00', qryGradePRECO.AsFloat * vQtd);
            end;
            if PageControl2.ActivePage = tabDelivery then // Delivery
            begin
              EdtPrecoD.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
              lblTotalD.Caption :=
                FormatFloat('0.00', qryGradePRECO.AsFloat * vQtd);
            end;

          end;
        end;

      except
        raise Exception.Create('Não foi possível Selecionar Produto!');
      end;
    end;
  end
  else
  begin
    if Pos('*', Descricao) > 1 then
    begin
      try
        vQtd := StrToFloatDef((copy(Descricao, 1, Pos('*', Descricao) - 1)), 1);

        if PageControl2.ActivePage = TabPDV then // PDV
        begin
          edtQtdP.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          edtPrecoP.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          lblTotalP.Caption := FormatFloat('0.00',
            RoundABNT(qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd, 2));
        end;
        if PageControl2.ActivePage = tabRestaurante then // Restaurante
        begin
          edtQtdR.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          edtPrecoR.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          lblTotalR.Caption := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
        end;
        if PageControl2.ActivePage = tabDelivery then // Delivery
        begin
          EdtQtdD.Text := copy(Descricao, 1, Pos('*', Descricao) - 1);
          EdtPrecoD.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          lblTotalD.Caption := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
        end;

      except
        raise Exception.Create('Não foi possível Selecionar Produto!');
      end;
    end
    else
    begin
      if PageControl2.ActivePage = TabPDV then // PDV
      begin
        vQtd := StrToFloatDef(edtQtdP.Text, 1);
        edtPrecoP.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        lblTotalP.Caption := FormatFloat('0.00',
          RoundABNT(qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd, 2));
      end;

      if PageControl2.ActivePage = tabRestaurante then // Restaurante
      begin
        vQtd := StrToFloatDef(edtQtdR.Text, 1);
        edtPrecoR.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        lblTotalR.Caption := FormatFloat('0.00',
          qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
      end;

      if PageControl2.ActivePage = tabDelivery then // Delivery
      begin
        vQtd := StrToFloatDef(EdtQtdD.Text, 1);
        EdtPrecoD.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        lblTotalD.Caption := FormatFloat('0.00',
          qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
      end;

    end;
  end;
end;

procedure TFrmPDV.DBGridPDblClick(Sender: TObject);
begin

  if not qryItem.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(Application);
      FrmCadProduto.qryProdutos.close;
      FrmCadProduto.qryProdutos.Params[0].Value := qryItemID_PRODUTO.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
      qryPesqProd.close;
      qryPesqProd.Open;
    end;

  end;
end;

procedure TFrmPDV.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin

  if PageControl2.ActivePage = tabRestaurante then
  begin
    if Dados.qryMesasSITUACAO.Value = 'L' then
    begin
      imgLivre.Visible := true;
      ImgOcupado.Visible := false;
    end
    else
    begin
      imgLivre.Visible := false;
      ImgOcupado.Visible := true;
    end;
  end;
end;

procedure TFrmPDV.DBGridBuscaPDblClick(Sender: TObject);
var
  vQtd: String;
begin
  try
    PesquisaProduto := false;

    if PageControl2.ActivePage = TabPDV then // PDV
    begin
      vQtd := copy(EdtProdutoP.Text, 1, Pos('*', EdtProdutoP.Text));
      EdtProdutoP.Text := vQtd + qryPesqProdDESCRICAO.Value;
      EdtProdutoP.SetFocus;
    end;

    if PageControl2.ActivePage = tabRestaurante then // Restaurante
    begin
      vQtd := copy(edtProdutoR.Text, 1, Pos('*', edtProdutoR.Text));
      edtProdutoR.Text := vQtd + qryPesqProdDESCRICAO.Value;

      if PanelRestaurante.Enabled then
        edtProdutoR.SetFocus;
    end;

    if PageControl2.ActivePage = tabDelivery then // Delivery
    begin
      vQtd := copy(EdtProdutoP.Text, 1, Pos('*', EdtProdutoP.Text));
      EdtProdutoP.Text := vQtd + qryPesqProdDESCRICAO.Value;
      EdtProdutoP.SetFocus;
    end;

  finally
    PesquisaProduto := true;
  end;
end;

procedure TFrmPDV.DBGridBuscaPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridBuscaPDblClick(Sender);

end;

procedure TFrmPDV.dsItemDataChange(Sender: TObject; Field: TField);
begin

  if qryItemTTOTAL.Value > 0 then
    lblGeral.Caption := FormatFloat('0.00', qryItemTTOTAL.Value)
  else
    lblGeral.Caption := FormatFloat('0.00', 0);

  if qryItemTTOTAL.Value > 0 then
    lblGeralD.Caption := FormatFloat('0.00', qryItemTTOTAL.Value)
  else
    lblGeralD.Caption := FormatFloat('0.00', 0);

end;

procedure TFrmPDV.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.Panels[2].Text := 'Vendedor:' + qryVendaVIRTUAL_VENDEDOR.Value;
end;

procedure TFrmPDV.PageControl2Change(Sender: TObject);
begin

  if PageControl2.ActivePage = TabPDV then
  begin
    Dados.FTIpoPDV := 'PDV';
  end;

  if PageControl2.ActivePage = tabRestaurante then
  begin
    Dados.FTIpoPDV := 'RESTAURANTE';
    Restaurante_Status_Mesa;
  end;

  if PageControl2.ActivePage = tabDelivery then
    Dados.FTIpoPDV := 'DELIVERY';

  FormShow(Sender);

end;

procedure TFrmPDV.PesquisaCliente;
begin
  qryBuscaFone.close;
  qryBuscaFone.ParamByName('fone').Value := '%' + edtFone.Text + '%';
  qryBuscaFone.Open;

end;

procedure TFrmPDV.edtFoneChange(Sender: TObject);
begin
  PesquisaCliente;
  if TiraPontos(edtFone.Text) <> '' then
    DBGridClie.Visible := true;
end;

procedure TFrmPDV.ReabrirPedido;
begin
  if not qryBuscaFone.IsEmpty then
  begin

    qryPedido.close;
    qryPedido.Params[0].Value := qryBuscaFoneCODIGO.Value;
    qryPedido.Open;

    If not qryPedido.IsEmpty then
    begin
      AbreVenda(qryPedidoCODIGO.Value, Dados.FTIpoPDV);
      Application.ProcessMessages;
    end
    else
    begin
      inserevenda;
      edtFone.SetFocus;
    end;

  end;
end;

procedure TFrmPDV.edtFoneExit(Sender: TObject);
begin

  if qryVenda.State in dsEditModes then
    qryVenda.Post;

  DBGridClie.Visible := false;

  if TiraPontos(edtFone.Text) <> '' then
  begin

    PesquisaCliente;
    ReabrirPedido;

    if qryBuscaFone.IsEmpty then
    begin
      edtCliente.Caption := '';
      pnEndereco.Caption := '';
      CadPessoaRapido(0);
    end;
  end;

end;

procedure TFrmPDV.edtFoneKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13]) then
    edtProdutoD.SetFocus;
end;

procedure TFrmPDV.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if PageControl2.ActivePage = TabPDV then
  begin
    if Key = #13 then
      edtQtdP.SetFocus;
  end;
  if PageControl2.ActivePage = tabRestaurante then
  begin
    if Key = #13 then
    begin
      if PanelRestaurante.Enabled then
        edtOBSR.SetFocus;
    end;
  end;
  if PageControl2.ActivePage = tabDelivery then
  begin
    if Key = #13 then
      edtObsD.SetFocus;
  end;

end;

procedure TFrmPDV.edtObsDExit(Sender: TObject);
begin
  if ehCaixaRapido = 'N' then
    EdtQtdD.SetFocus;
end;

procedure TFrmPDV.edtObsDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtQtdD.SetFocus;
end;

procedure TFrmPDV.edtOBSRExit(Sender: TObject);
begin
  if PanelRestaurante.Enabled then
  begin
    if ehCaixaRapido = 'N' then
      edtQtdR.SetFocus;
  end;
end;

procedure TFrmPDV.edtOBSRKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtQtdR.SetFocus;
end;

procedure TFrmPDV.edtPrecoPExit(Sender: TObject);
var
  Total : real;
begin

  if PageControl2.ActivePage = TabPDV then
  begin
    Total := StrToFloatDef(edtQtdP.Text, 1) * StrToFloatDef(edtPrecoP.Text, 0);
    // if copy(EdtProdutoP.Text, 1, 1) <> Dados.qryConfigPREFIXO_BALANCA.Value then
    lblTotalP.Caption := FormatFloat('0.00', RoundABNT(Total, 2));
    EdtProdutoP.SetFocus;

        valor :=  Total;
    percentual := qryProdCOMISSAOPERCENTUAL.AsFloat;

   valorcomissao := valor * percentual / 100;
   CodigoFKFornecedor := qryPesqProdULTFORN.Value;

//  ShowMessage('Perdcentual: '+floattostr(percentual)+' | Valor comissão: '+floattostr(valorcomissao)+' | Fornecedor: '+IntToStr(CodigoFKFornecedor)+' | Fornecedor: '+IntToStr(qryPesqProdULTFORN.Value));
    //  qryProdVALORCOMISSAO.AsFloat := valorcomissao;



    InsereItem(EdtProdutoP.Text, '', StrToFloatDef(edtPrecoP.Text, 0),
      StrToFloatDef(edtQtdP.Text, 1), StrToFloatDef(lblTotalP.Caption, 0));


  end;

  if PageControl2.ActivePage = tabRestaurante then
  begin
    Total := StrToFloatDef(edtQtdR.Text, 1) * StrToFloatDef(edtPrecoR.Text, 0);
    // if copy(edtProdutoR.Text, 1, 1) <> Dados.qryConfigPREFIXO_BALANCA.Value then
    lblTotalR.Caption := FormatFloat('0.00', Total);



    if PanelRestaurante.Enabled then
      edtProdutoR.SetFocus;

    InsereItem(edtProdutoR.Text, edtOBSR.Text, StrToFloatDef(edtPrecoR.Text, 0),
      StrToFloatDef(edtQtdR.Text, 1), StrToFloatDef(lblTotalR.Caption, 0));

  end;

  if PageControl2.ActivePage = tabDelivery then
  begin
    Total := StrToFloatDef(EdtQtdD.Text, 1) * StrToFloatDef(EdtPrecoD.Text, 0);
    if copy(edtProdutoD.Text, 1, 1) <> Dados.qryConfigPREFIXO_BALANCA.Value then
      lblTotalD.Caption := FormatFloat('0.00', Total);
    edtProdutoD.SetFocus;

    InsereItem(edtProdutoD.Text, edtObsD.Text, StrToFloatDef(EdtPrecoD.Text, 0),
      StrToFloatDef(EdtQtdD.Text, 1), StrToFloatDef(lblTotalD.Caption, 0));

  end;
end;

procedure TFrmPDV.edtPrecoPKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, #9, #13, #27]) then
    Key := #0;

  if Key = #13 then
  begin
    qryPesqProd.Refresh;
    DescricaoSetFocus('I');
  end;
end;

procedure TFrmPDV.edtProdutoDChange(Sender: TObject);
var
  Qtd: Integer;
  Descricao: string;
begin

  DBGridClie.Visible := false;

  if PageControl2.ActivePage = tabDelivery then
    Descricao := edtProdutoD.Text;

  if Length(Descricao) = 13 then
    Qtd := 1;

  if PageControl2.ActivePage = tabDelivery then // Restaurante
  begin
    if Pos('*', Descricao) = 0 then
      edtQtdR.Text := '1';
    DBGridBuscaD.Visible := false;
  end;

  if not PesquisaProduto then
    exit;

  vPosicao := Pos('*', trim(Descricao)) + 1;
  vPesquisa := trim(copy((Descricao), vPosicao, 1000));

  if (trim(Descricao) <> '') then
  begin

    if PageControl2.ActivePage = tabDelivery then
      DBGridBuscaD.Visible := true;

    if not Dados.EhNumero(vPesquisa) then
    begin
      if Descricao <> '' then
        PesquisaDescricao(vPesquisa);
    end;
  end;

end;

procedure TFrmPDV.edtProdutoDEnter(Sender: TObject);
begin
  edtProdutoD.SelectAll;
end;

procedure TFrmPDV.inserevenda;
var
  codigo1, codigo2: Integer;
begin

  if PageControl2.ActivePage = TabPDV then
  begin
    edtQtdP.Text := '1';
    edtPrecoP.Text := '0,00';
    lblTotalP.Caption := '0,00';
  end;
  if PageControl2.ActivePage = tabRestaurante then
  begin
    edtQtdR.Text := '1';
    edtPrecoR.Text := '0,00';
    lblTotalR.Caption := '0,00';
  end;
  if PageControl2.ActivePage = tabDelivery then
  begin
    EdtQtdD.Text := '1';
    EdtPrecoD.Text := '0,00';
    lblTotalD.Caption := '0,00';
  end;

  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Add('INSERT INTO VENDAS_MASTER (');
  Dados.qryExecute.SQL.Add('CODIGO,');
  Dados.qryExecute.SQL.Add('DATA_EMISSAO,');
  Dados.qryExecute.SQL.Add('DATA_SAIDA,');
  Dados.qryExecute.SQL.Add('ID_CLIENTE,');
  Dados.qryExecute.SQL.Add('FK_USUARIO,');
  Dados.qryExecute.SQL.Add('FK_CAIXA,');
  Dados.qryExecute.SQL.Add('FK_VENDEDOR,');
  Dados.qryExecute.SQL.Add('CPF_NOTA,');
  Dados.qryExecute.SQL.Add('SUBTOTAL,');
  Dados.qryExecute.SQL.Add('TIPO_DESCONTO,');
  Dados.qryExecute.SQL.Add('DESCONTO,');
  Dados.qryExecute.SQL.Add('TROCO,');
  Dados.qryExecute.SQL.Add('DINHEIRO,');
  Dados.qryExecute.SQL.Add('TOTAL,');
  Dados.qryExecute.SQL.Add('SITUACAO,');
  Dados.qryExecute.SQL.Add('FKEMPRESA,');
  Dados.qryExecute.SQL.Add('PERCENTUAL,');
  Dados.qryExecute.SQL.Add('TIPO,');
  Dados.qryExecute.SQL.Add('NECF,');
  Dados.qryExecute.SQL.Add('FKORCAMENTO,');
  Dados.qryExecute.SQL.Add('FK_MESA,');
  Dados.qryExecute.SQL.Add('LOTE,');
  Dados.qryExecute.SQL.Add('GERA_FINANCEIRO,');
  Dados.qryExecute.SQL.Add('PERCENTUAL_ACRESCIMO,');
  Dados.qryExecute.SQL.Add('ACRESCIMO,');
  Dados.qryExecute.SQL.Add('FK_TABELA,');
  Dados.qryExecute.SQL.Add('PEDIDO,');
  Dados.qryExecute.SQL.Add('OS,');
  Dados.qryExecute.SQL.Add('FK_OS,');
  Dados.qryExecute.SQL.Add('TOTAL_TROCA,');
  Dados.qryExecute.SQL.Add('FORMA_PAGAMENTO,');
  Dados.qryExecute.SQL.Add('FK_ENTREGADOR,');
  Dados.qryExecute.SQL.Add('TELA,');
  Dados.qryExecute.SQL.Add('FLAG_NFCE');
  Dados.qryExecute.SQL.Add(')');
  Dados.qryExecute.SQL.Add('VALUES');
  Dados.qryExecute.SQL.Add('(');
  Dados.qryExecute.SQL.Add(':CODIGO,');
  Dados.qryExecute.SQL.Add(':DATA_EMISSAO,');
  Dados.qryExecute.SQL.Add(':DATA_SAIDA,');
  Dados.qryExecute.SQL.Add(':ID_CLIENTE,');
  Dados.qryExecute.SQL.Add(':FK_USUARIO,');
  Dados.qryExecute.SQL.Add(':FK_CAIXA,');
  Dados.qryExecute.SQL.Add(':FK_VENDEDOR,');
  Dados.qryExecute.SQL.Add(':CPF_NOTA,');
  Dados.qryExecute.SQL.Add(':SUBTOTAL,');
  Dados.qryExecute.SQL.Add(':TIPO_DESCONTO,');
  Dados.qryExecute.SQL.Add(':DESCONTO,');
  Dados.qryExecute.SQL.Add(':TROCO,');
  Dados.qryExecute.SQL.Add(':DINHEIRO,');
  Dados.qryExecute.SQL.Add(':TOTAL,');
  Dados.qryExecute.SQL.Add(':SITUACAO,');
  Dados.qryExecute.SQL.Add(':FKEMPRESA,');
  Dados.qryExecute.SQL.Add(':PERCENTUAL,');
  Dados.qryExecute.SQL.Add(':TIPO,');
  Dados.qryExecute.SQL.Add(':NECF,');
  Dados.qryExecute.SQL.Add(':FKORCAMENTO,');
  Dados.qryExecute.SQL.Add(':FK_MESA,');
  Dados.qryExecute.SQL.Add(':LOTE,');
  Dados.qryExecute.SQL.Add(':GERA_FINANCEIRO,');
  Dados.qryExecute.SQL.Add(':PERCENTUAL_ACRESCIMO,');
  Dados.qryExecute.SQL.Add(':ACRESCIMO,');
  Dados.qryExecute.SQL.Add(':FK_TABELA,');
  Dados.qryExecute.SQL.Add(':PEDIDO,');
  Dados.qryExecute.SQL.Add(':OS,');
  Dados.qryExecute.SQL.Add(':FK_OS,');
  Dados.qryExecute.SQL.Add(':TOTAL_TROCA,');
  Dados.qryExecute.SQL.Add(':FORMA_PAGAMENTO,');
  Dados.qryExecute.SQL.Add(':FK_ENTREGADOR,');
  Dados.qryExecute.SQL.Add(':TELA,');
  Dados.qryExecute.SQL.Add(':FLAG_NFCE');
  Dados.qryExecute.SQL.Add(');');

  if PageControl2.ActivePage = TabPDV then
  begin
    if Dados.TerminalCaixa then
      Dados.qryExecute.ParamByName('TIPO').Value := 'V'
    else
      Dados.qryExecute.ParamByName('TIPO').Value := 'P';
  end;
  if PageControl2.ActivePage = tabRestaurante then
    Dados.qryExecute.ParamByName('TIPO').Value := 'R';
  if PageControl2.ActivePage = tabDelivery then
    Dados.qryExecute.ParamByName('TIPO').Value := 'D';

  Dados.qryExecute.ParamByName('FKEMPRESA').Value :=
    Dados.qryEmpresaCODIGO.Value;
  Dados.qryExecute.ParamByName('FK_USUARIO').Value := Dados.idUsuario;
  Dados.qryExecute.ParamByName('ID_CLIENTE').Value :=
    Dados.qryConfigCLIENTE_PADRAO.Value;

  if Dados.FTIpoPDV = 'DELIVERY' then
    Dados.qryExecute.ParamByName('ID_CLIENTE').Value :=
      qryBuscaFoneCODIGO.Value;

  Dados.qryExecute.ParamByName('FK_VENDEDOR').Value :=
    Dados.qryConfigVENDEDOR_PADRAO.Value;

  Dados.qryExecute.ParamByName('TELA').Value := Dados.FTIpoPDV;

  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    ' select FK_VENDEDOR from USUARIOS where codigo=:id';
  Dados.qryConsulta.Params[0].Value := Dados.idUsuario;
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.FieldByName('FK_VENDEDOR').IsNull then
    Dados.qryExecute.ParamByName('FK_VENDEDOR').Value :=
      Dados.qryConsulta.FieldByName('FK_VENDEDOR').Value;;

  Dados.qryExecute.ParamByName('FK_TABELA').Value := 1;

  Dados.qryExecute.ParamByName('CPF_NOTA').Value := '';

  Dados.qryExecute.ParamByName('FK_CAIXA').Value := Dados.idCaixa;
  Dados.qryExecute.ParamByName('LOTE').Value := Dados.Lote;

  Dados.qryExecute.ParamByName('DATA_EMISSAO').Value := date;
  Dados.qryExecute.ParamByName('DATA_SAIDA').Value := date;
  Dados.qryExecute.ParamByName('SUBTOTAL').Value := 0;
  Dados.qryExecute.ParamByName('TIPO_DESCONTO').Value := 'D';
  Dados.qryExecute.ParamByName('DESCONTO').Value := 0;
  Dados.qryExecute.ParamByName('PERCENTUAL').Value := 0;
  Dados.qryExecute.ParamByName('ACRESCIMO').Value := 0;
  Dados.qryExecute.ParamByName('DESCONTO').Value := 0;
  Dados.qryExecute.ParamByName('TOTAL').Value := 0;
  Dados.qryExecute.ParamByName('TROCO').Value := 0;

  Dados.qryExecute.ParamByName('FK_MESA').Clear;

  if PageControl2.ActivePage = tabRestaurante then
    Dados.qryExecute.ParamByName('FK_MESA').Value :=
      Dados.qryMesasCODIGO.AsInteger;

  Dados.qryExecute.ParamByName('DINHEIRO').Value := 0;
  Dados.qryExecute.ParamByName('SITUACAO').Value := 'X';

  codigo1 := Dados.Numerador('VENDAS_MASTER', 'CODIGO', 'N', '', '');

  Dados.qryExecute.ParamByName('CODIGO').Value := codigo1;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  AbreVenda(codigo1, Dados.FTIpoPDV);

  ConfiguraBalanca;

end;

function TFrmPDV.GerouNFCe(operacao: string): String;
begin

  if qryVenda.IsEmpty then
    exit;

  result := '';
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'select NUMERO, SITUACAO from nfce_master where fk_venda=:venda';
  Dados.qryConsulta.Params[0].Value := qryVendaCODIGO.Value;
  Dados.qryConsulta.Open;

  if operacao = 'CANCELA VENDA' then
  begin
    if (Dados.qryConsulta.FieldByName('SITUACAO').Value = 'C') or
      (Dados.qryConsulta.FieldByName('SITUACAO').IsNull) then
      // faz nada
    else

      result := 'Existe NFC-e emitida para esta venda!' + sLineBreak +
        'Número NFCe...:' + Dados.qryConsulta.FieldByName('NUMERO').AsString;

    if operacao = 'EXCLUIR ITEM' then
    begin
      if (Dados.qryConsulta.FieldByName('SITUACAO').Value = 'C') or
        (Dados.qryConsulta.FieldByName('SITUACAO').Value = 'O') then
        // faz nada
      else
      begin
        result := 'Existe NFC-e emitida para esta venda!' + sLineBreak +
          'Número NFCe...:' + Dados.qryConsulta.FieldByName('NUMERO').AsString;;
      end;
    end;

  end;

end;

function TFrmPDV.BuscaNumeroVenda: Integer;
var
  filtro: string;
begin

  filtro := '';

  if PageControl2.ActivePage = tabRestaurante then
  begin
    if not Dados.qryMesas.IsEmpty then
      filtro := ' and fk_mesa=' + Dados.qryMesasCODIGO.AsString;
  end;

  vSqlBusca :=
    ' select max(CODIGO)CODIGO from VENDAS_MASTER where SITUACAO = ''X'' and ' +
    ' fk_usuario = :ID and fkempresa = :emp and tela=:tela' + filtro;

  if Dados.TerminalCaixa then
  begin
    qryBuscaVenda.close;
    qryBuscaVenda.SQL.Text := vSqlBusca;
    qryBuscaVenda.Params[0].Value := Dados.idUsuario;
    qryBuscaVenda.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
    qryBuscaVenda.Params[2].Value := Dados.FTIpoPDV;
    qryBuscaVenda.Open;

  end
  else
  begin
    qryBuscaVenda.close;
    qryBuscaVenda.SQL.Text := vSqlBusca;
    qryBuscaVenda.Params[0].Value := Dados.idUsuario;
    qryBuscaVenda.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
    qryBuscaVenda.Params[2].Value := Dados.FTIpoPDV;
    qryBuscaVenda.Open;
  end;

  result := qryBuscaVendaCODIGO.Value;

end;

procedure TFrmPDV.FinalizaVenda;
begin
  Dados.vEnviarSefa := 'N';

  if PageControl2.ActivePage = tabRestaurante then
  begin
    if not Dados.qryMesas.IsEmpty then
    begin
      Dados.qryMesas.Edit;
      Dados.qryMesasSITUACAO.Value := 'L';
      Dados.qryMesas.Post;
    end;
  end;

  if PageControl2.ActivePage <> tabRestaurante then // se não for restaurante
  begin
    if (BuscaNumeroVenda = 0) then
      inserevenda
    else
    begin

      AbreVenda(BuscaNumeroVenda, Dados.FTIpoPDV);

      qryVenda.Edit;
      qryVendaDATA_EMISSAO.Value := now;
      qryVendaDATA_SAIDA.Value := now;
      if Dados.TerminalCaixa then
        qryVendaSITUACAO.Value := 'F';
      qryVendaFK_CAIXA.Value := Dados.idCaixa;
      qryVendaLOTE.Value := Dados.Lote;
      qryVenda.Post;
    end;
  end
  else
  begin
    AbreVenda(-1, Dados.FTIpoPDV);
  end;

end;

procedure TFrmPDV.FecharPrevenda;
begin

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaSITUACAO.Value := 'G';
  qryVendaDATA_EMISSAO.Value := now;
  qryVendaDATA_SAIDA.Value := now;
  qryVendaFK_CAIXA.Value := Dados.idCaixa;
  qryVendaLOTE.Value := Dados.Lote;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;

end;

procedure TFrmPDV.MostraCaixa;
begin
  qryPesqConta.close;
  qryPesqConta.Params[0].Value := Dados.idUsuario;
  qryPesqConta.Open;

  if not qryPesqConta.IsEmpty then
  begin
    Caption := ' PDV - Venda de Balcão | ' + qryPesqContaDESCRICAO.Value +
      ' | Op.:' + Dados.vUsuario;
    StatusBar1.Panels[0].Text := 'Conta:' + qryPesqContaDESCRICAO.Value;
    StatusBar1.Panels[1].Text := 'Usuário:' + Dados.vUsuario;
    Dados.vConta := qryPesqContaDESCRICAO.Value;
  end
  else
  begin
    Caption := ' ';
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := '';
    // StatusBar1.Panels[2].Text := '';
    StatusBar1.Panels[3].Text := '';

    Dados.vConta := '';
  end;
end;

procedure TFrmPDV.VendaExiste;
begin

  if BuscaNumeroVenda = 0 then
    inserevenda
  else
  begin

    AbreVenda(BuscaNumeroVenda, Dados.FTIpoPDV);

    qryVenda.Edit;
    qryVendaDATA_EMISSAO.Value := now;
    qryVendaDATA_SAIDA.Value := now;
    qryVendaFK_CAIXA.Value := Dados.idCaixa;
    qryVendaLOTE.Value := Dados.Lote;
  end;
end;

procedure TFrmPDV.PreencheBuscaPreco;
begin
  if PageControl2.ActivePage = TabPDV then
    BuscaPreco(EdtProdutoP.Text);
  if PageControl2.ActivePage = tabRestaurante then
    BuscaPreco(edtProdutoR.Text);
  if PageControl2.ActivePage = tabDelivery then
    BuscaPreco(edtProdutoD.Text);

end;

procedure TFrmPDV.DBGridSetFocus;
begin
  if PageControl2.ActivePage = TabPDV then
  begin
    DBGridP.Refresh;
    DBGridP.Repaint;
    DBGridP.SetFocus;
  end;
  if PageControl2.ActivePage = tabRestaurante then
  begin
    DBGridR.Refresh;
    DBGridR.Repaint;
    if PanelRestaurante.Enabled then
      DBGridR.SetFocus;
  end;
  if PageControl2.ActivePage = tabDelivery then
  begin
    DBGridD.Refresh;
    DBGridD.Repaint;
    DBGridD.SetFocus;
  end;
end;

procedure TFrmPDV.DescricaoSetFocus(Op: String);
begin

  if PageControl2.ActivePage = TabPDV then
  begin
    if PanelPDV.Enabled then
      EdtProdutoP.SetFocus;
  end;

  if PageControl2.ActivePage = tabRestaurante then
  begin
    if PanelRestaurante.Enabled then
      edtProdutoR.SetFocus;
  end;

  if PageControl2.ActivePage = tabDelivery then
  begin
    if Op = 'I' then
    begin
      if PanelPDV.Enabled then
        edtProdutoD.SetFocus;
    end
    else
    begin
      if pnDelivery.Enabled then
        edtFone.SetFocus;
    end;
  end;

end;

procedure TFrmPDV.DecodificaBalanca(Codigo: string);
begin

 if Dados.qryConfigMODELO_BALANCA.Value = 1  then begin

  codificacaobalanca := '2CCCC00TTTTTTDV';   // retirei um T
 end;
 if Dados.qryConfigMODELO_BALANCA.Value = 2  then begin

  codificacaobalanca := '2CCCCC0TTTTTDV';
                         //2CCCC0TTTTTTDV
 end;
 if Dados.qryConfigMODELO_BALANCA.Value = 3  then begin

  codificacaobalanca := '2CCCCCTTTTTTDV';
 end;
 if Dados.qryConfigMODELO_BALANCA.Value = 4  then begin

  codificacaobalanca := '2CCCCC0TTTTTDV';
 end;


 ACBrInStore1.Codificacao := codificacaobalanca;
 ACBrInStore1.Desmembrar(Codigo);

 {ShowMessage('Peso: '+FloatToStr( ACBrInStore1.Peso ));
  ShowMessage('Codigo: '+ ACBrInStore1.Codigo);
   ShowMessage('Valor: '+FloatToStr(  ACBrInStore1.Total ));   }


 if  PageControl2.ActivePage = TabPDV then
 begin
  edtQtdP.text :=  FloatToStr( ACBrInStore1.Peso )

 end;

  if  PageControl2.ActivePage = TabDelivery then
 begin
  edtQtdD.text :=  FloatToStr( ACBrInStore1.Peso )

 end;

  if  PageControl2.ActivePage = TabRestaurante then
 begin
  edtQtdR.text :=  FloatToStr( ACBrInStore1.Peso )

 end;


end;

procedure TFrmPDV.FechaVenda(Descricao: String);
begin
  if (trim(Descricao) = '') then
  begin
    if PageControl2.ActivePage = TabPDV then
    begin
      edtQtdP.Text := '1';
      edtPrecoP.Text := '0,00';
      lblTotalP.Caption := '0,00';
    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      edtQtdR.Text := '1';
      edtPrecoR.Text := '0,00';
      lblTotalR.Caption := '0,00';
    end;
    if PageControl2.ActivePage = tabDelivery then
    begin
      EdtQtdD.Text := '1';
      EdtPrecoD.Text := '0,00';
      lblTotalD.Caption := '0,00';
    end;

    btnFinalizaClick(self);
  end;
end;

procedure TFrmPDV.AtualizaDescricao(Descricao: String);
begin
  if Descricao <> '' then
  begin
    if ehCaixaRapido <> 'S' then
    begin
      try
        PesquisaProduto := false;

        if PageControl2.ActivePage = TabPDV then
          EdtProdutoP.Text := qryPesqProdDESCRICAO.Value;
        if PageControl2.ActivePage = tabRestaurante then
          edtProdutoR.Text := qryPesqProdDESCRICAO.Value;
        if PageControl2.ActivePage = tabDelivery then
          edtProdutoD.Text := qryPesqProdDESCRICAO.Value;

      finally

        PesquisaProduto := true;
      end;
    end;
  end;
end;

procedure TFrmPDV.Carregaimagem2();
begin
   if not Dados.qryParametro.Active then
    Dados.qryParametro.Open;

//  if FileExists(qryPesqProdFOTO.Value) then
 // begin,    imgLogo.Picture.LoadFromFile
 //     (qryPesqProdFOTO.Value);
//    Label1.Visible := false;
// end
 // else
  //  Label1.Visible := true;
end;

procedure TFrmPDV.PesquisaCodBarraGeral(FPesquisa: string);
begin

  qryPesqProd.close;
  qryPesqProd.IndexFieldNames := 'CODBARRA';
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
    ' AND ((PRO.CODBARRA=:BARRA) or (PRO.REFERENCIA=:REF) or (PRO.CODIGO =:CODIGO)) ORDER BY PRO.CODBARRA',
    [rfReplaceAll]);
  qryPesqProd.ParamByName('EMP').Value := qryVendaFKEMPRESA.Value;
  qryPesqProd.ParamByName('BARRA').Value := copy(FPesquisa, 1, 14);
  qryPesqProd.ParamByName('REF').Value := copy(FPesquisa, 1, 19);
  qryPesqProd.ParamByName('CODIGO').Value := copy(FPesquisa, 1, 6);
  qryPesqProd.Open;

  if not(qryPesqProd.IsEmpty) then
  begin
    PreencheBuscaPreco;
  end;

end;

procedure TFrmPDV.PesquisaCodBarraBalanca(FPesquisa: string);
begin

  qryPesqProd.close;
  qryPesqProd.IndexFieldNames := 'DESCRICAO';
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
    ' AND (PRO.PREFIXO_BALANCA=:PREFIXO) ORDER BY PRO.PREFIXO_BALANCA', []);
  qryPesqProd.ParamByName('EMP').Value := qryVendaFKEMPRESA.Value;
  qryPesqProd.ParamByName('PREFIXO').Value := copy(FPesquisa, 1, 7);
  qryPesqProd.Open;

  if not(qryPesqProd.IsEmpty) then
    PreencheBuscaPreco;

end;

procedure TFrmPDV.ChamaGrade;
begin
  if qryPesqProdGRADE.Value = 'S' then
  begin
    try
      FGrade := -1;
      frmGrade := TFrmGrade.Create(Application);
      frmGrade.qryGrade.close;
      frmGrade.qryGrade.Params[0].Value := qryPesqProdCODIGO.Value;
      frmGrade.qryGrade.Open;
      frmGrade.ShowModal;
    finally
      FGrade := frmGrade.idGrade;

      if PageControl2.ActivePage = TabPDV then
        AtualziaPrecoGrade(StrToFloatDef(edtQtdP.Text, 1));
      if PageControl2.ActivePage = tabRestaurante then
        AtualziaPrecoGrade(StrToFloatDef(edtQtdR.Text, 1));
      if PageControl2.ActivePage = tabDelivery then
        AtualziaPrecoGrade(StrToFloatDef(EdtQtdD.Text, 1));

      frmGrade.Release;
      if ehCaixaRapido = 'S' then

        if PageControl2.ActivePage = TabPDV then
          InsereItem(EdtProdutoP.Text, '', StrToFloatDef(edtPrecoP.Text, 0),
            StrToFloatDef(edtQtdP.Text, 1),
            StrToFloatDef(lblTotalP.Caption, 0));

      if PageControl2.ActivePage = tabRestaurante then
        InsereItem(edtProdutoR.Text, edtOBSR.Text, StrToFloatDef(edtPrecoR.Text,
          0), StrToFloatDef(edtQtdR.Text, 1),
          StrToFloatDef(lblTotalR.Caption, 0));

      if PageControl2.ActivePage = tabDelivery then
        InsereItem(edtProdutoD.Text, edtObsD.Text, StrToFloatDef(EdtPrecoD.Text,
          0), StrToFloatDef(EdtQtdD.Text, 1),
          StrToFloatDef(lblTotalD.Caption, 0));

    end;
  end;
end;

procedure TFrmPDV.AtualizaVendedor;
begin
  if qryVenda.Active then
  begin
    if CaixaAberto then
    begin
      if not(qryVenda.State in dsEditModes) then
        qryVenda.Edit;
      qryVendaFK_VENDEDOR.Value := frmconsVendedor.idVendedor;
      qryVenda.Post;
      Dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TFrmPDV.AtualziaPrecoGrade(Qtd: Extended);
var
  vQtd: real;

begin
  qryGrade.close;
  qryGrade.Params[0].Value := FGrade;
  qryGrade.Open;
  if qryGradePRECO.AsFloat > 0 then
  begin
    vQtd := Qtd;

    if PageControl2.ActivePage = TabPDV then
    begin
      edtPrecoP.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
      lblTotalP.Caption := FormatFloat('0.00',
        RoundABNT(qryGradePRECO.AsFloat * vQtd, 2));
    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      edtPrecoR.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
      lblTotalR.Caption := FormatFloat('0.00', qryGradePRECO.AsFloat * vQtd);
    end;

    if PageControl2.ActivePage = tabDelivery then
    begin
      EdtPrecoD.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
      lblTotalD.Caption := FormatFloat('0.00', qryGradePRECO.AsFloat * vQtd);
    end;

  end;
end;

procedure TFrmPDV.AbreCaixa;
begin
  Try
    Application.CreateForm(TfrmAbreCaixa, frmAbreCaixa);
    frmAbreCaixa.iTipo := 1;
    Dados.tela := 'PDV';
    frmAbreCaixa.ShowModal;
  Finally
    frmAbreCaixa.Release;
  End;
end;

procedure TFrmPDV.btnCaixaClick(Sender: TObject);
begin

  if not btnCaixa.Visible then
    exit;

  if btnCaixa.Tag = 1 then
  begin
    AbreCaixa;
    exit;
  end
  else
  begin
    FecharCaixa;
    exit;
  end;
end;

procedure TFrmPDV.btnCancVendaClick(Sender: TObject);
var
  vMensagem: String;
begin

  if not btnCancVenda.Visible then
    exit;

  // SituacaoPedido;

  if PageControl2.ActivePage = TabPDV then
    vMensagem := 'Deseja Cancelar Venda?' + sLineBreak +
      GerouNFCe('CANCELA VENDA');

  if PageControl2.ActivePage = tabRestaurante then
    vMensagem := 'Deseja Cancelar Mesa?' + sLineBreak +
      GerouNFCe('CANCELA VENDA');
  if PageControl2.ActivePage = tabDelivery then
    vMensagem := 'Deseja Cancelar Pedido?' + sLineBreak +
      GerouNFCe('CANCELA VENDA');

  if Application.messagebox(pwidechar(vMensagem), 'Confirmação', mb_yesno) = mrYes
  then
  begin

    if Dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
    Begin
      Dados.vAutorizar := true;
      if not Dados.eSupervisor then
      begin

        try
          frmSupervisor := TFrmSupervisor.Create(Application);
          Dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end;

      if not Dados.vAutorizar then
      begin
        exit;
      end;
    end;

    try

      if not qryVenda.IsEmpty then
      begin
        Dados.EstornaFinanceiro(qryVendaCODIGO.Value);
        qryVenda.Edit;
        qryVendaSITUACAO.Value := 'C'; // CANCELADA
        qryVenda.Post;
      end;

      if PageControl2.ActivePage = tabRestaurante then
      begin
        if not Dados.qryMesas.IsEmpty then
        begin
          Dados.qryMesas.Edit;
          Dados.qryMesasSITUACAO.Value := 'L';
          Dados.qryMesas.Post;
          Dados.Conexao.CommitRetaining;
        end;
      end;

      qryItem.DisableControls;
      qryItem.First;
      while not qryItem.eof do
      begin
        if not(qryItemOS.Value = 'S') then
        begin

          DMEstoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat,
            0, 'E', 'R');

          DMEstoque.AtualizaGrade(qryItemID_PRODUTO.Value,
            qryItemFK_GRADE.Value, qryItemQTD.AsFloat, 'E', 0);

          DMEstoque.AtualizaComposicao(qryItemID_PRODUTO.Value,
            qryItemQTD.AsFloat, 0, 'E', 'R');

        end;
        qryItem.Next;
      end;

      if PageControl2.ActivePage <> tabRestaurante then
        VendaExiste;

      if PageControl2.ActivePage = TabPDV then // PDV
      begin
        if PanelPDV.Enabled then
          EdtProdutoP.SetFocus;
        EdtProdutoP.SelectAll;

        edtPrecoP.Text := '0,00';
        lblTotalP.Caption := '0,00';
        edtQtdP.Text := '1';

      end;
      if PageControl2.ActivePage = tabRestaurante then // Restaurante
      begin
        if PanelRestaurante.Enabled then
          edtProdutoR.SetFocus;
        edtProdutoR.SelectAll;
        edtPrecoR.Text := '0,00';
        lblTotalR.Caption := '0,00';
        edtQtdR.Text := '1';
      end;

      if PageControl2.ActivePage = tabDelivery then // Delivery
      begin
        edtCliente.Caption := '';
        pnEndereco.Caption := '';
        if pnDelivery.Enabled then
          edtFone.SetFocus;
        EdtPrecoD.Text := '0,00';
        lblTotalD.Caption := '0,00';
        EdtQtdD.Text := '1';

      end;

    finally
      qryItem.EnableControls;
    end;
  end;

  VendaExiste;
  Restaurante_Status_Mesa;

end;

procedure TFrmPDV.btnDelItemClick(Sender: TObject);
var
  vMensagem: string;
begin
  try
    if btnDelItem.Enabled = false then
      exit;

    if not btnDelItem.Visible then
      exit;

    vMensagem := 'Deseja Excluir Item?' + sLineBreak +
      GerouNFCe('EXCLUIR ITEM');

    if not qryItem.IsEmpty then
    begin
      if Application.messagebox(pwidechar(vMensagem), 'Confirmação', mb_yesno) = mrYes
      then
      begin

        if Dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
        Begin
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
        end;

        qryItem.delete;

        qrySoma.close;
        qrySoma.Params[0].Value := qryVendaCODIGO.Value;
        qrySoma.Open;

        qryVenda.Edit;
        qryVendaSUBTOTAL.Value := qrySomaTOTAL.Value;

        if ((qryVendaFK_OS.AsInteger = 0) or (qryVendaFK_OS.IsNull)) and
          ((qryVendaFKORCAMENTO.AsInteger = 0) or (qryVendaFKORCAMENTO.IsNull))
        then
          qryVendaDESCONTO.Value := 0;

        qryVendaSUBTOTAL.Value := qryVendaSUBTOTAL.Value;
        qryVenda.Post;

        Dados.Conexao.CommitRetaining;
      end;
    end;
  finally
    DescricaoSetFocus('I');
  end;
end;

procedure TFrmPDV.btnDescontoClick(Sender: TObject);
begin
  if not btnDesconto.Visible then
    exit;

  if Dados.qryEmpresaDESCONTO_ITEM_PDV.Value = 'S' then
  Begin
    Dados.vAutorizar := true;
    if not Dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if not Dados.vAutorizar then
    begin
      exit;
    end;

    try
      frmDesconhecido := TfrmDesconhecido.Create(Application);
      frmDesconhecido.lblProduto.Caption := qryItemDESCRICAO_SL.Value;
      frmDesconhecido.edtPreco.Text :=
        FormatFloat('0.00', qryItemPRECO.AsFloat);
      frmDesconhecido.ShowModal;
    finally
      if (StrToFloatDef(frmDesconhecido.edtPreco.Text, 0) > 0) and
        (StrToFloatDef(frmDesconhecido.edtPreco.Text, 0) <> qryItemPRECO.AsFloat)
      then
        AtualizaPreco(StrToFloatDef(frmDesconhecido.edtPreco.Text, 0));
      frmDesconhecido.Release;

    end;

  end;
end;

procedure TFrmPDV.btnEntregadorClick(Sender: TObject);
begin
  try
    FrmConsEntregador := TfrmconsEntregador.Create(Application);
    FrmConsEntregador.idEntregador := qryVendaFK_ENTREGADOR.Value;
    FrmConsEntregador.vNome := qryVendaVIRTUAL_ENTREGADOR.Value;
    FrmConsEntregador.ShowModal;
  finally
    AtualizaEntregador;
    // lblEntregador.Caption := FrmConsEntregador.vNome;
    FrmConsEntregador.Release;
  end;
end;

procedure TFrmPDV.AtualizaEntregador;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaFK_ENTREGADOR.Value := FrmConsEntregador.idEntregador;
  qryVenda.Post;
end;

procedure TFrmPDV.FecharCaixa;
var
  Data: Tdate;
  Hora: TTime;
  idLote: Integer;
begin

  if Application.messagebox('Tem certeza de que deseja Fechar Caixa?',
    'Confirmação', mb_yesno) = mrno then
    exit;

  Dados.vPodeFecharCaixa := false;

  try
    frmResumoCaixa := TfrmResumoCaixa.Create(Application);
    frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + Dados.vUsuario;

    frmResumoCaixa.FUsuario := Dados.idUsuario;
    frmResumoCaixa.FLote := Dados.Lote;
    frmResumoCaixa.Tag := 1;
    frmResumoCaixa.VwResumo := false;

    frmResumoCaixa.qryResumo.Open;

    frmResumoCaixa.ShowModal;
  finally
    frmResumoCaixa.Release;
  end;

  if Dados.vPodeFecharCaixa then
  begin

    AbreVenda(BuscaNumeroVenda, Dados.FTIpoPDV);

    if qryVendaCODIGO.Value > 0 then
      Dados.EstornaFinanceiro(qryVendaCODIGO.Value);

    Dados.qryExecute.close;
    Dados.qryExecute.SQL.Text :=
      'UPDATE CONTAS SET ID_USUARIO=NULL, DATA_ABERTURA=NULL, SITUACAO=''F'', LOTE=0 WHERE CODIGO=:COD';
    Dados.qryExecute.Params[0].Value := Dados.idCaixa;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;

    if qryVendaCODIGO.Value > 0 then
    begin
      Dados.qryExecute.close;
      Dados.qryExecute.SQL.Text :=
        'delete from CONTAS_MOVIMENTO WHERE fkvenda=:COD';
      Dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining;
    end;

    close;
  end;

end;

procedure TFrmPDV.SituacaoPedido;
begin
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'SELECT CODIGO FROM VENDAS_MASTER WHERE SITUACAO=''F'' and CODIGO=:CODIGO';
  Dados.qryConsulta.Params[0].Value := qryVendaCODIGO.Value;
  Dados.qryConsulta.Open;
  if not qryVenda.IsEmpty then
  begin
    VendaExiste;
    raise Exception.Create('Venda foi finalizada em outra instancia do sistema!'
      + sLineBreak +
      'Evite abrir o PDV com o mesmo usuário em mais de uma instância do Sistema!');
  end;
end;

procedure TFrmPDV.btnFinalizaClick(Sender: TObject);
var
  cont: Integer;
begin

  if not btnFinaliza.Visible then
    exit;

  // SituacaoPedido;

//  Dados.BloqueiaCliente;

  if Dados.qryConfigCLIENTE_PADRAO.IsNull then
  begin
    ShowMessage
      ('Vá é em configurações e informe o código do cliente Consumidor Final!');
    exit;
  end;

  if Dados.FTIpoPDV = 'DELIVERY' then
  begin
    if qryVendaID_CLIENTE.Value = Dados.qryConfigCLIENTE_PADRAO.Value then
    begin
      if pnDelivery.Enabled then
        edtFone.SetFocus;
      raise Exception.Create('Informe o Cliente!');
    end;
  end;

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;

  if (qryVendaNOME.IsNull) or (qryVendaNOME.AsString = '') then
    qryVendaNOME.AsString := qryVendaVIRTUAL_CLIENTE.AsString;
  qryVenda.Post;

  Dados.Conexao.CommitRetaining;

  if Dados.TerminalCaixa then
  begin

    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      DescricaoSetFocus('');
      exit;
    end;

    try
      frmFechavenda := TfrmFechaVenda.Create(Application);
      frmFechavenda.vPessoa := qryVendaNOME.Value;
      if Dados.qryEmpresaTABELA_PRECO.Value = 'S' then
        frmFechavenda.Tag := 2
      else
        frmFechavenda.Tag := 1;
      frmFechavenda.PageControl1.ActivePageIndex := 0;
      frmFechavenda.Caption := 'Forma de Pagamento';
      frmFechavenda.Height := 600;
      Dados.tela := 'FPG';
      Dados.vEnviarSefa := 'N';

      frmFechavenda.qryVenda.close;
      frmFechavenda.qryVenda.Params[0].Value := qryVendaCODIGO.Value;
      frmFechavenda.qryVenda.Open;

      frmFechavenda.qryItem.close;
      frmFechavenda.qryItem.Params[0].Value := qryVendaCODIGO.Value;
      frmFechavenda.qryItem.Open;

      Dados.qryExecute.close;
      Dados.qryExecute.SQL.Text :=
        'update vendas_fpg set valor=0 where vendas_master=:codigo and FEZ_TEF=''N''';
      Dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining;

      frmFechavenda.JvDBGrid1.Visible := true;
      frmFechavenda.PageControl2.ActivePageIndex := 0;

      frmFechavenda.pngeral.Enabled := true;
      frmFechavenda.Totais.Enabled := true;

      if Dados.checanfce(qryVendaCODIGO.Value) then
      begin
        frmFechavenda.pngeral.Enabled := false;
        frmFechavenda.Totais.Enabled := false;
      end;

      frmFechavenda.ShowModal;
    finally

      edtFone.Text := '';

      if frmFechavenda.vFinalizou then
        FinalizaVenda;

      frmFechavenda.Release;

      Dados.tela := 'PDV';
      DBGridSetFocus;
      DescricaoSetFocus('');

    end;
  end
  else
  begin

    qryItem.Refresh;
    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      DescricaoSetFocus('');
      exit;
    end;

    try
      frmFechavenda := TfrmFechaVenda.Create(Application);
      frmFechavenda.vPessoa := qryVendaNOME.Value;
      if Dados.qryEmpresaTABELA_PRECO.Value = 'S' then
        frmFechavenda.Tag := 2
      else
        frmFechavenda.Tag := 1;
      frmFechavenda.PageControl1.ActivePageIndex := 0;
      frmFechavenda.Caption := 'Forma de Pagamento';
      frmFechavenda.Height := 350;
      Dados.tela := 'FPG';
      Dados.vEnviarSefa := 'N';

      frmFechavenda.qryVenda.close;
      frmFechavenda.qryVenda.Params[0].Value := qryVendaCODIGO.Value;
      frmFechavenda.qryVenda.Open;

      Dados.qryExecute.close;
      Dados.qryExecute.SQL.Text :=
        'update vendas_fpg set valor=0  where vendas_master=:codigo and FEZ_TEF=''N''';
      Dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining;

      frmFechavenda.JvDBGrid1.Visible := false;
      frmFechavenda.PageControl2.ActivePageIndex := 1;

      frmFechavenda.ShowModal;
    finally

      if frmFechavenda.vFinalizou then
      begin
        FecharPrevenda;
        FinalizaVenda;
      end;

      frmFechavenda.Release;

      Dados.tela := 'PDV';

      Dados.Conexao.CommitRetaining;

      DBGridSetFocus;
      DescricaoSetFocus('');

    end;

  end;

end;

procedure TFrmPDV.ConfiguraBalanca;
begin
  try

    if not(Dados.qryEmpresaLER_PESO.Value = 'S') then
      exit;

    if ACBrBAL1.Ativo then
      ACBrBAL1.Desativar;

    // configura porta de comunicação
    ACBrBAL1.modelo := TACBrBALModelo
      (strtointdef(Dados.qryTerminalBALANCA_MARCA.Value, 0));
    ACBrBAL1.Device.HandShake :=
      TACBrHandShake(Dados.qryTerminalBALANCA_HANDSHAKING.AsInteger);
    ACBrBAL1.Device.Parity := TACBrSerialParity
      (strtointdef(Dados.qryTerminalBALANCA_PARIDADE.AsString, 0));
    ACBrBAL1.Device.Stop :=
      TACBrSerialStop
      (strtointdef(Dados.qryTerminalBALANCA_STOPBITS.AsString, 0));

    ACBrBAL1.Device.Data :=
      strtointdef(Dados.qryTerminalBALANCA_DATABITS.Value, 5);
    ACBrBAL1.Device.Baud :=
      strtointdef(Dados.qryTerminalBALANCA_VELOCIDADE.Value, 9600);
    ACBrBAL1.Device.Porta := Dados.qryTerminalBALANCA_PORTA.Value;

    // Conecta com a balança
    ACBrBAL1.Ativar;

  except
    on e: Exception do
      raise Exception.Create
        ('Balança Habilitada! Verifique a configuração da Balança:' + sLineBreak
        + e.Message);
  end;

end;

procedure TFrmPDV.btnAbrirMesaClick(Sender: TObject);
var
  numero: Integer;
begin
  numero := strtointdef(InputBox('Mesa', 'Número:', ''), 0);
  if not Dados.qryMesas.Locate('codigo', numero, []) then
    raise Exception.Create('Mesa não existe!');

  if Dados.qryMesasSITUACAO.Value = 'O' then
    raise Exception.Create('Mesa já está ocupada!');

  imgLivreDblClick(Sender);

end;

procedure TFrmPDV.btnAtualizaMesaClick(Sender: TObject);
begin

  if not btnAtualizaMesa.Visible then
    exit;

  if PageControl2.ActivePage = tabRestaurante then
  begin
    Retaurante_abre_mesa;
    Restaurante_Status_Mesa;
  end;

end;

procedure TFrmPDV.btnAvancadaClick(Sender: TObject);
begin
  if not btnAvancada.Visible then
    exit;

  try
    frmPesquisa := tfrmPesquisa.Create(Application);
    frmPesquisa.ShowModal;
  finally
    if trim(frmPesquisa.vDescricao) <> '' then
    begin

      if PageControl2.ActivePage = TabPDV then // PDV
        EdtProdutoP.Text := frmPesquisa.vDescricao;
      if PageControl2.ActivePage = tabRestaurante then // Restaurante
        edtProdutoR.Text := frmPesquisa.vDescricao;
      if PageControl2.ActivePage = tabDelivery then // Delivery
        edtProdutoD.Text := frmPesquisa.vDescricao;

    end;
    frmPesquisa.Release;
    DescricaoSetFocus('I');

  end;

end;

procedure TFrmPDV.btnResumoClick(Sender: TObject);
begin

  if not btnResumo.Visible then
    exit;
  try
    frmResumoCaixa := TfrmResumoCaixa.Create(Application);
    frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + Dados.vUsuario;
    frmResumoCaixa.FUsuario := Dados.idUsuario;
    frmResumoCaixa.FLote := Dados.Lote;
    frmResumoCaixa.Tag := 1;

    frmResumoCaixa.VwResumo := true;

    frmResumoCaixa.qryResumo.close;
    frmResumoCaixa.qryResumo.Open;

    frmResumoCaixa.ShowModal;
  finally
    frmResumoCaixa.Release;
  end;
end;

procedure TFrmPDV.btnSangriaClick(Sender: TObject);
begin
  Dados.Conexao.CommitRetaining;

  if not btnSangria.Visible then
    exit;

  if Dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
  Begin
    Dados.vAutorizar := true;
    if not Dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if not Dados.vAutorizar then
    begin
      exit;
    end;
  end;

  try
    FrmSuprimento_Sangria := TFrmSuprimento_Sangria.Create(Application);
    FrmSuprimento_Sangria.vTipo := '1';
    FrmSuprimento_Sangria.ShowModal;
  finally
    FrmSuprimento_Sangria.Release;

  end;

end;

function TFrmPDV.RetornaMaiorItem(idVenda: Integer): Integer;
begin
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Add
    ('Select coalesce(max(item),0)+1 item from vendas_detalhe');
  Dados.qryConsulta.SQL.Add('where');
  Dados.qryConsulta.SQL.Add('fkvenda=:codigo');

  Dados.qryConsulta.ParamByName('codigo').AsInteger := idVenda;

  Dados.qryConsulta.Open;
  result := Dados.qryConsulta.FieldByName('item').AsInteger;
end;

procedure TFrmPDV.InsereItem(Descricao, OBSERVACAO: String;
  Preco, Qtd, Total: Extended);
var
  idItem, MaiorItem: Integer;
begin

  PodeAtualizarEstoque := true;


 // ShowMessage('Perdcentual: '+floattostr(percentual)+' | Valor comissão: '+floattostr(valorcomissao));
   //  qryProdVALORCOMISSAO.AsFloat := valorcomissao;


  if (qryVenda.State in dsEditModes) then
    qryVenda.Post;

  Dados.Conexao.CommitRetaining;

  if copy(Descricao, 1, 1) = '*' then
    exit;

  if trim(Descricao) = '' then
    exit;

  if qryPesqProd.IsEmpty then
    exit;

  if Dados.checanfce(qryVendaCODIGO.Value) then
  begin
    if PageControl2.ActivePage = TabPDV then
    begin
      EdtProdutoP.Clear;
      edtPrecoP.Text := '0,00';
      lblTotalP.Caption := '0,00';
      edtQtdP.Text := '1';
      EdtProdutoP.SetFocus;
    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      edtProdutoR.Clear;
      edtPrecoR.Text := '0,00';
      lblTotalR.Caption := '0,00';
      edtQtdR.Text := '1';
      edtProdutoR.SetFocus;
    end;
    if PageControl2.ActivePage = tabDelivery then
    begin
      edtProdutoD.Clear;
      EdtPrecoD.Text := '0,00';
      lblTotalD.Caption := '0,00';
      EdtQtdD.Text := '1';
      edtProdutoD.SetFocus;
    end;

    raise Exception.Create
      ('Operação não permitida, Já existe NFC-e gerada para esta venda!' +
      sLineBreak + 'NFC-e Número' + Dados.qryConsulta.FieldByName('NUMERO')
      .AsString);
  end;

  if Preco <= 0 then
  begin
    ShowMessage('Produto está com o preço inválido');
    exit;
  end;

  if Qtd <= 0 then
  begin
    ShowMessage('Produto está com a quantidade inválida');
  end;

  if Qtd > 9999 then
  begin
    ShowMessage('Produto está com a quantidade inválida');

    if PageControl2.ActivePage = TabPDV then
    begin
      EdtProdutoP.Clear;
      EdtProdutoP.SetFocus;
      edtQtdP.Text := '1';
    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      edtProdutoR.Clear;
      edtOBSR.Clear;
      if PanelRestaurante.Enabled then
        edtProdutoR.SetFocus;
      edtQtdR.Text := '1';

    end;
    if PageControl2.ActivePage = tabDelivery then
    begin
      edtProdutoD.Clear;
      edtProdutoD.SetFocus;
      EdtQtdD.Text := '1';
    end;

  end;

  if PageControl2.ActivePage = TabPDV then
  begin
    if not ValidaItem(StrToFloatDef(edtQtdP.Text, 1),
      StrToFloatDef(edtPrecoP.Text, 0)) then
    begin
      DescricaoSetFocus('I');
      exit;
    end;
  end;

  if PageControl2.ActivePage = tabRestaurante then
  begin
    if not ValidaItem(StrToFloatDef(edtQtdR.Text, 1),
      StrToFloatDef(edtPrecoR.Text, 0)) then
    begin
      DescricaoSetFocus('I');
      exit;
    end;
  end;

  if PageControl2.ActivePage = tabDelivery then
  begin
    if not ValidaItem(StrToFloatDef(EdtQtdD.Text, 1),
      StrToFloatDef(EdtPrecoD.Text, 0)) then
    begin
      DescricaoSetFocus('I');
      exit;
    end;
  end;

  if not validaComposicao(qryPesqProdCODIGO.AsInteger) then
  begin
    DescricaoSetFocus('I');
    exit;
  end;

  MaiorItem := RetornaMaiorItem(qryVendaCODIGO.AsInteger);

  try
    Dados.qryExecute.SQL.Clear;

    Dados.qryExecute.SQL.Add('INSERT INTO VENDAS_DETALHE');
    Dados.qryExecute.SQL.Add('(');

    Dados.qryExecute.SQL.Add('CODIGO,');
    Dados.qryExecute.SQL.Add('FKVENDA,');
    Dados.qryExecute.SQL.Add('FK_MESA,');
    Dados.qryExecute.SQL.Add('ID_PRODUTO,');
    Dados.qryExecute.SQL.Add('ITEM,');
    Dados.qryExecute.SQL.Add('COD_BARRA,');
    Dados.qryExecute.SQL.Add('QTD,');
    Dados.qryExecute.SQL.Add('E_MEDIO,');
    Dados.qryExecute.SQL.Add('PRECO,');
    Dados.qryExecute.SQL.Add('VALOR_ITEM,');
    Dados.qryExecute.SQL.Add('VDESCONTO,');
    Dados.qryExecute.SQL.Add('TOTAL,');
    Dados.qryExecute.SQL.Add('SITUACAO,');
    Dados.qryExecute.SQL.Add('UNIDADE,');
    Dados.qryExecute.SQL.Add('QTD_DEVOLVIDA,');
    Dados.qryExecute.SQL.Add('ACRESCIMO,');
    Dados.qryExecute.SQL.Add('OS,');
    Dados.qryExecute.SQL.Add('OBSERVACAO,');
    Dados.qryExecute.SQL.Add('FK_GRADE,');
        Dados.qryExecute.SQL.Add('VALORCOMISSAOFORNECEDOR,');
     Dados.qryExecute.SQL.Add('FKFORNECEDOR,');
  Dados.qryExecute.SQL.Add('DATA_VENDA,');
    Dados.qryExecute.SQL.Add('ID_SERIAL)');

    Dados.qryExecute.SQL.Add('VALUES (');

    Dados.qryExecute.SQL.Add(':CODIGO,');
    Dados.qryExecute.SQL.Add(':FKVENDA,');
    Dados.qryExecute.SQL.Add(':FK_MESA,');
    Dados.qryExecute.SQL.Add(':ID_PRODUTO,');
    Dados.qryExecute.SQL.Add(':ITEM,');
    Dados.qryExecute.SQL.Add(':COD_BARRA,');
    Dados.qryExecute.SQL.Add(':QTD,');
    Dados.qryExecute.SQL.Add(':E_MEDIO,');
    Dados.qryExecute.SQL.Add(':PRECO,');
    Dados.qryExecute.SQL.Add(':VALOR_ITEM,');
    Dados.qryExecute.SQL.Add(':VDESCONTO,');
    Dados.qryExecute.SQL.Add(':TOTAL,');
    Dados.qryExecute.SQL.Add(':SITUACAO,');
    Dados.qryExecute.SQL.Add(':UNIDADE,');
    Dados.qryExecute.SQL.Add(':QTD_DEVOLVIDA,');
    Dados.qryExecute.SQL.Add(':ACRESCIMO,');
    Dados.qryExecute.SQL.Add(':OS,');
    Dados.qryExecute.SQL.Add(':OBSERVACAO,');
    Dados.qryExecute.SQL.Add(':FK_GRADE,');
     Dados.qryExecute.SQL.Add(':VALORCOMISSAOFORNECEDOR,');
    Dados.qryExecute.SQL.Add(':FKFORNECEDOR,');
    Dados.qryExecute.SQL.Add(':DATA_VENDA,');
    Dados.qryExecute.SQL.Add(':ID_SERIAL');

    Dados.qryExecute.SQL.Add(');');

    Dados.qryExecute.ParamByName('ID_PRODUTO').Value :=
      qryPesqProdCODIGO.AsInteger;
    Dados.qryExecute.ParamByName('FKVENDA').Value := qryVendaCODIGO.Value;
    Dados.qryExecute.ParamByName('ITEM').Value :=
      RetornaMaiorItem(qryVendaCODIGO.Value);

    Dados.qryExecute.ParamByName('QTD').AsFloat := Qtd;
    Dados.qryExecute.ParamByName('UNIDADE').AsString :=
      qryPesqProdUNIDADE.Value;

    Dados.qryExecute.ParamByName('OBSERVACAO').AsString := OBSERVACAO;
    Dados.qryExecute.ParamByName('PRECO').AsFloat := Preco;
    Dados.qryExecute.ParamByName('VALOR_ITEM').AsFloat :=
      RoundABNT(Preco * Qtd, 2);
    Dados.qryExecute.ParamByName('COD_BARRA').Value :=
      trim(qryPesqProdCODBARRA.Value);
    Dados.qryExecute.ParamByName('ID_SERIAL').Value := strtointdef(vSerie, 0);
    Dados.qryExecute.ParamByName('E_MEDIO').Value := qryPesqProdE_MEDIO.AsFloat;
    idItem := Dados.Numerador('VENDAS_DETALHE', 'CODIGO', 'N', '', '');

    Dados.qryExecute.ParamByName('FK_MESA').Clear;

    if PageControl2.ActivePage = tabRestaurante then
      Dados.qryExecute.ParamByName('FK_MESA').AsInteger :=
        Dados.qryMesasCODIGO.AsInteger;

    Dados.qryExecute.ParamByName('TOTAL').AsFloat :=
      Dados.qryExecute.ParamByName('VALOR_ITEM').AsFloat;

    Dados.qryExecute.ParamByName('CODIGO').AsFloat := idItem;
    Dados.qryExecute.ParamByName('QTD_DEVOLVIDA').AsFloat := 0;
    Dados.qryExecute.ParamByName('FK_GRADE').AsFloat := FGrade;
        Dados.qryExecute.ParamByName('VALORCOMISSAOFORNECEDOR').AsFloat := valorcomissao;
       Dados.qryExecute.ParamByName('FKFORNECEDOR').AsInteger := CodigoFKFornecedor;
            Dados.qryExecute.ParamByName('DATA_VENDA').AsDate := now;
    Dados.qryExecute.Prepare;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;

    if (qryPesqProdQTD_ATACADO.AsFloat > 0) and
      (qryPesqProdPRECO_ATACADO.AsFloat > 0) then
      ChecaATACADO(qryPesqProdCODIGO.AsInteger, qryVendaCODIGO.AsInteger);

    if PageControl2.ActivePage = TabPDV then
    begin
      EdtProdutoP.Clear;
      edtPrecoP.Text := '0,00';
      lblTotalP.Caption := '0,00';
      edtQtdP.Text := '1';
      if PanelPDV.Enabled then
        EdtProdutoP.SetFocus;

    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      edtProdutoR.Clear;
      edtOBSR.Clear;
      edtPrecoR.Text := '0,00';
      lblTotalR.Caption := '0,00';
      edtQtdR.Text := '1';
      if PanelRestaurante.Enabled then
        edtProdutoR.SetFocus;
    end;

    if PageControl2.ActivePage = tabDelivery then
    begin
      edtProdutoD.Clear;
      edtObsD.Clear;
      EdtPrecoD.Text := '0,00';
      lblTotalD.Caption := '0,00';
      EdtQtdD.Text := '1';
      if PanelPDV.Enabled then
        edtProdutoD.SetFocus;
    end;

    Dados.Conexao.CommitRetaining;
    qryItem.Refresh;

    qryItem.Locate('codigo', idItem, []);

    CalculaTotalVenda(qryVendaCODIGO.Value);

    InsereComposicao(qryItemID_PRODUTO.Value);

    if Dados.tela <> 'FPG' then
    begin

      DMEstoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
        'S', 'R');

      DMEstoque.AtualizaGrade(qryItemID_PRODUTO.Value, qryItemFK_GRADE.Value,
        qryItemQTD.AsFloat, 'S', 0);

      DMEstoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat,
        0, 'S', 'R');

    end;

  except
    on e: Exception do
      raise Exception.Create(e.Message + sLineBreak +
        'Entre em contato com o suporte!');
  end;

end;

procedure TFrmPDV.ItemDesconhecido;
var
  Descricao: string;
begin
  PrecoVariavel;
  if Dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    if PageControl2.ActivePage = TabPDV then
    begin
      Descricao := EdtProdutoP.Text;
      edtPrecoP.ReadOnly := true;
      if ehCaixaRapido = 'N' then
        edtPrecoP.ReadOnly := false;
    end;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      Descricao := edtProdutoR.Text;
      edtPrecoR.ReadOnly := true;
      if ehCaixaRapido = 'N' then
        edtPrecoR.ReadOnly := false;
    end;

    if PageControl2.ActivePage = tabDelivery then
    begin
      Descricao := edtProdutoD.Text;
      EdtPrecoD.ReadOnly := true;
      if ehCaixaRapido = 'N' then
        EdtPrecoD.ReadOnly := false;
    end;

  end;

  if qryPesqProdCODIGO.AsInteger = 0 then
    exit;

  if trim(Descricao) <> '' then
  begin

    if (qryPesqProdPRECO_VARIAVEL.Value = 'S') then
    begin
      if PageControl2.ActivePage = TabPDV then
        edtPrecoP.ReadOnly := false;
      if PageControl2.ActivePage = tabRestaurante then
        edtPrecoR.ReadOnly := false;
      if PageControl2.ActivePage = tabDelivery then
        EdtPrecoD.ReadOnly := false;
    end

    else

    begin
      if Dados.qryEmpresaBLOQUEAR_PRECO.Value = 'S' then
      begin
        if PageControl2.ActivePage = TabPDV then
          edtPrecoP.ReadOnly := true;
        if PageControl2.ActivePage = tabRestaurante then
          edtPrecoR.ReadOnly := true;
        if PageControl2.ActivePage = tabDelivery then
          EdtPrecoD.ReadOnly := true;

      end
      else
      begin
        if PageControl2.ActivePage = TabPDV then
          edtPrecoP.ReadOnly := false;
        if PageControl2.ActivePage = tabRestaurante then
          edtPrecoR.ReadOnly := false;
        if PageControl2.ActivePage = tabDelivery then
          EdtPrecoD.ReadOnly := false;

      end;
    end;

  end;
end;

procedure TFrmPDV.btnTefClick(Sender: TObject);
begin
  if not btnTef.Visible then
    exit;
  frmtef.Administrativo;
end;

procedure TFrmPDV.btnImportarClick(Sender: TObject);
begin

  if not btnImportar.Visible then
    exit;

  try
    frmImportarPDV := TfrmImportarPDV.Create(Application);
    frmImportarPDV.ShowModal;
  finally
    frmImportarPDV.Release;
  end;
end;

procedure TFrmPDV.btnImprimeItemClick(Sender: TObject);
begin

  if not btnImprimeItem.Enabled then
    exit;

  if qryItem.IsEmpty then
    exit;

  if qryVenda.State in dsEditModes then
    qryVenda.Post;

  if Application.messagebox('Deseja Imprimir Item', ' Confirmação ', mb_yesno)
    <> mrYes then
    exit;

  if not qryItem.IsEmpty then
    ImprimeItem;
end;

procedure TFrmPDV.btnImprimirPedidosClick(Sender: TObject);
begin

  if not btnImprimirPedidos.Visible then
    exit;

  if qryItem.IsEmpty then
    exit;

  if qryVenda.State in dsEditModes then
    qryVenda.Post;

  if Application.messagebox('Deseja Imprimir Pedido?', ' Confirmação ',
    mb_yesno) <> mrYes then
    exit;

  if Dados.FTIpoPDV = 'RESTAURANTE' then
    ImprimeRestaurante;

  if Dados.FTIpoPDV = 'DELIVERY' then
    ImprimeDelivery;
end;

procedure TFrmPDV.AlinhaBotoes;
var
  aBotoesLeft: array [0 .. 22] of Integer;
  aBotoesTop: array [0 .. 22] of Integer;
  i: Integer;
begin

  // alinha left
  aBotoesLeft[0] := 9;
  aBotoesLeft[1] := 9;
  aBotoesLeft[2] := 9;
  aBotoesLeft[3] := 9;
  aBotoesLeft[4] := 9;
  aBotoesLeft[5] := 9;

  aBotoesLeft[6] := 147;
  aBotoesLeft[7] := 147;
  aBotoesLeft[8] := 147;
  aBotoesLeft[9] := 147;
  aBotoesLeft[10] := 147;
  aBotoesLeft[11] := 147;

  aBotoesLeft[12] := 305;
  aBotoesLeft[13] := 305;
  aBotoesLeft[14] := 305;
  aBotoesLeft[15] := 305;
  aBotoesLeft[16] := 305;
  aBotoesLeft[17] := 305;

  aBotoesLeft[18] := 504;
  aBotoesLeft[19] := 504;
  aBotoesLeft[20] := 504;
  aBotoesLeft[21] := 504;
  aBotoesLeft[22] := 504;

  // alinha top

  aBotoesTop[0] := 0;
  aBotoesTop[1] := 16;
  aBotoesTop[2] := 32;
  aBotoesTop[3] := 48;
  aBotoesTop[4] := 64;
  aBotoesTop[5] := 80;

  aBotoesTop[6] := 0;
  aBotoesTop[7] := 16;
  aBotoesTop[8] := 32;
  aBotoesTop[9] := 48;
  aBotoesTop[10] := 64;
  aBotoesTop[11] := 80;

  aBotoesTop[12] := 0;
  aBotoesTop[13] := 16;
  aBotoesTop[14] := 32;
  aBotoesTop[15] := 48;
  aBotoesTop[16] := 64;
  aBotoesTop[17] := 80;

  aBotoesTop[18] := 0;
  aBotoesTop[19] := 16;
  aBotoesTop[20] := 32;
  aBotoesTop[21] := 48;
  aBotoesTop[22] := 64;

  i := 0;
  if btnCaixa.Visible then
  begin
    btnCaixa.Left := aBotoesLeft[i];
    btnCaixa.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnVendedor.Visible then
  begin
    btnVendedor.Left := aBotoesLeft[i];
    btnVendedor.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnAvancada.Visible then
  begin
    btnAvancada.Left := aBotoesLeft[i];
    btnAvancada.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnImportar.Visible then
  begin
    btnImportar.Left := aBotoesLeft[i];
    btnImportar.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnCancVenda.Visible then
  begin
    btnCancVenda.Left := aBotoesLeft[i];
    btnCancVenda.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnFinaliza.Visible then
  begin
    btnFinaliza.Left := aBotoesLeft[i];
    btnFinaliza.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnResumo.Visible then
  begin
    btnResumo.Left := aBotoesLeft[i];
    btnResumo.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnSangria.Visible then
  begin
    btnSangria.Left := aBotoesLeft[i];
    btnSangria.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if BtnSuprimento.Visible then
  begin
    BtnSuprimento.Left := aBotoesLeft[i];
    BtnSuprimento.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnRemoveProduto.Visible then
  begin
    btnRemoveProduto.Left := aBotoesLeft[i];
    btnRemoveProduto.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnDelItem.Visible then
  begin
    btnDelItem.Left := aBotoesLeft[i];
    btnDelItem.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnGaveta.Visible then
  begin
    btnGaveta.Left := aBotoesLeft[i];
    btnGaveta.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnReceber.Visible then
  begin
    btnReceber.Left := aBotoesLeft[i];
    btnReceber.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnBuscaPreco.Visible then
  begin
    btnBuscaPreco.Left := aBotoesLeft[i];
    btnBuscaPreco.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnClientes.Visible then
  begin
    btnClientes.Left := aBotoesLeft[i];
    btnClientes.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnReimprimir.Visible then
  begin
    btnReimprimir.Left := aBotoesLeft[i];
    btnReimprimir.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnDesconto.Visible then
  begin
    btnDesconto.Left := aBotoesLeft[i];
    btnDesconto.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnTef.Visible then
  begin
    btnTef.Left := aBotoesLeft[i];
    btnTef.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnImprimirPedidos.Visible then
  begin
    btnImprimirPedidos.Left := aBotoesLeft[i];
    btnImprimirPedidos.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnImprimeItem.Visible then
  begin
    btnImprimeItem.Left := aBotoesLeft[i];
    btnImprimeItem.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnTransferirMesa.Visible then
  begin
    btnTransferirMesa.Left := aBotoesLeft[i];
    btnTransferirMesa.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnAtualizaMesa.Visible then
  begin
    btnAtualizaMesa.Left := aBotoesLeft[i];
    btnAtualizaMesa.Top := aBotoesTop[i];
    i := i + 1;
  end;

  if btnAbrirMesa.Visible then
  begin
    btnAbrirMesa.Left := aBotoesLeft[i];
    btnAbrirMesa.Top := aBotoesTop[i];
    i := i + 1;
  end;

end;

procedure TFrmPDV.ImprimeItem;
var
  vEndereco, sTexto: String;
  SL: TStringList;
begin

  try
    qryItem.DisableControls;
    SL := TStringList.Create;

    SL.Add('<n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');

    SL.Add('</linha_simples>');
    sTexto := qryVendaFK_MESA.AsString;
    SL.Add('</ae>Mesa...: ' + sTexto);
    SL.Add('Data/Hora...:' + DateTimeToStr(now));
    SL.Add('</linha_simples>');
    SL.Add(PadRight('PRODUTO', 36) + PadRight('QTD', 6));
    SL.Add('</linha_simples>');

    SL.Add(PadRight(qryItem.FieldByName('DESCRICAO_SL').AsString, 36) +
      PadRight(qryItem.FieldByName('QTD').AsString, 6));
    if trim(qryItem.FieldByName('OBSERVACAO').AsString) <> '' then
      SL.Add(qryItem.FieldByName('OBSERVACAO').AsString);

    SL.Add('</linha_dupla>');
    SL.Add('</corte>');

    DMImpressao.ConfiguraImpressora('');

    SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'Restaurante.txt');

    if DMImpressao.aCBrPosPrinter1.Ativo then
    begin
      DMImpressao.ImprimeLogo;
      DMImpressao.ImprimeTexto(SL.Text);
    end
    else
      ShowMessage('Erro ao imprimir!');
  finally
    SL.Free;
    qryItem.EnableControls;
  end;

end;

procedure TFrmPDV.ImprimeRestaurante;
begin
  ImprimeRestaurantePadrao;
  ImprimeRestauranteBar;
  ImprimeRestauranteCozinha;

end;

procedure TFrmPDV.ImprimeRestaurantePadrao;
var
  vEndereco, sTexto: String;
  SL: TStringList;
begin
  if Dados.qryTerminalCAMINHO_BAR.AsString = Dados.qryTerminalCAMINHO_COZINHA.AsString
  then
  begin

    try
      qryItem.DisableControls;
      SL := TStringList.Create;

      SL.Add('<n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');

      SL.Add('</linha_simples>');

      sTexto := 'Pedido No. ' + FormatFloat('0000', qryVendaCODIGO.AsFloat);
      SL.Add('<n>' + PadCenter(sTexto, Dados.qryTerminalCOLUNAS.AsInteger, '*')
        + '</n>');
      SL.Add('</linha_simples>');
      sTexto := qryVendaFK_MESA.AsString;
      SL.Add('</ae>Mesa...: ' + sTexto);
      SL.Add('Data/Hora...:' + DateTimeToStr(now));
      SL.Add('</linha_simples>');
      SL.Add(PadRight('PRODUTO', 36) + PadRight('QTD', 6));
      SL.Add('</linha_simples>');

      qryItem.First;
      While not qryItem.eof do
      begin
        SL.Add(PadRight(qryItem.FieldByName('DESCRICAO_SL').AsString, 36) +
          PadRight(qryItem.FieldByName('QTD').AsString, 6));
        if trim(qryItem.FieldByName('OBSERVACAO').AsString) <> '' then
          SL.Add(qryItem.FieldByName('OBSERVACAO').AsString);
        SL.Add('</linha_simples>');
        qryItem.Next;
      end;
      SL.Add('</corte>');

      if trim(Dados.qryTerminalCAMINHO_COZINHA.AsString) <> '' then
        DMImpressao.ConfiguraImpressora(Dados.qryTerminalCAMINHO_COZINHA.Value)
      else
        DMImpressao.ConfiguraImpressora('');

      SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'Restaurante.txt');

      if DMImpressao.aCBrPosPrinter1.Ativo then
      begin
        DMImpressao.ImprimeLogo;
        DMImpressao.ImprimeTexto(SL.Text);
      end
      else
        raise Exception.Create('Erro ao imprimir!');
    finally
      SL.Free;
      qryItem.EnableControls;
    end;
  end;

end;

procedure TFrmPDV.ImprimeRestauranteBar;
var
  vEndereco, sTexto: String;
  SL: TStringList;
  FExisteItem: Boolean;
begin
  FExisteItem := false;
  if Dados.qryTerminalCAMINHO_BAR.AsString <> Dados.qryTerminalCAMINHO_COZINHA.AsString
  then
  begin

    try
      qryItem.DisableControls;
      SL := TStringList.Create;

      SL.Add('<n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');

      SL.Add('</linha_simples>');

      sTexto := 'Pedido No. ' + FormatFloat('0000', qryVendaCODIGO.AsFloat);
      SL.Add('<n>' + PadCenter(sTexto, Dados.qryTerminalCOLUNAS.AsInteger, '*')
        + '</n>');
      SL.Add('</linha_simples>');
      sTexto := qryVendaFK_MESA.AsString;
      SL.Add('</ae>Mesa...: ' + sTexto);
      SL.Add('Data/Hora...:' + DateTimeToStr(now));
      SL.Add('</linha_simples>');
      SL.Add(PadRight('PRODUTO', 36) + PadRight('QTD', 6));
      SL.Add('</linha_simples>');

      qryItem.First;
      While not qryItem.eof do
      begin
        if qryItemVIRTUAL_TIPO_ALIMENTO.Value = 'B' then
        begin
          FExisteItem := true;
          SL.Add(PadRight(qryItem.FieldByName('DESCRICAO_SL').AsString, 36) +
            PadRight(qryItem.FieldByName('QTD').AsString, 6));
          if trim(qryItem.FieldByName('OBSERVACAO').AsString) <> '' then
            SL.Add(qryItem.FieldByName('OBSERVACAO').AsString);
          SL.Add('</linha_simples>');

        end;
        qryItem.Next;
      end;
      SL.Add('</corte>');

      if FExisteItem then
      begin

        if trim(Dados.qryTerminalCAMINHO_BAR.AsString) <> '' then
          DMImpressao.ConfiguraImpressora(Dados.qryTerminalCAMINHO_BAR.Value)
        else
          DMImpressao.ConfiguraImpressora('');

        SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'Restaurante.txt');

        if DMImpressao.aCBrPosPrinter1.Ativo then
        begin
          DMImpressao.ImprimeLogo;
          DMImpressao.ImprimeTexto(SL.Text);
        end
        else
          raise Exception.Create('Erro ao imprimir!');
      end;

    finally
      SL.Free;
      qryItem.EnableControls;
    end;
  end;

end;

procedure TFrmPDV.ImprimeRestauranteCozinha;
var
  vEndereco, sTexto: String;
  SL: TStringList;
  FExisteItem: Boolean;
begin
  FExisteItem := false;
  if Dados.qryTerminalCAMINHO_BAR.AsString <> Dados.qryTerminalCAMINHO_COZINHA.AsString
  then
  begin

    try
      qryItem.DisableControls;
      SL := TStringList.Create;

      SL.Add('<n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');

      SL.Add('</linha_simples>');

      sTexto := 'Pedido No. ' + FormatFloat('0000', qryVendaCODIGO.AsFloat);
      SL.Add('<n>' + PadCenter(sTexto, Dados.qryTerminalCOLUNAS.AsInteger, '*')
        + '</n>');
      SL.Add('</linha_simples>');
      sTexto := qryVendaFK_MESA.AsString;
      SL.Add('</ae>Mesa...: ' + sTexto);
      SL.Add('Data/Hora...:' + DateTimeToStr(now));
      SL.Add('</linha_simples>');
      SL.Add(PadRight('PRODUTO', 36) + PadRight('QTD', 6));
      SL.Add('</linha_simples>');

      qryItem.First;
      While not qryItem.eof do
      begin
        if qryItemVIRTUAL_TIPO_ALIMENTO.Value <> 'B' then
        begin
          FExisteItem := true;
          SL.Add(PadRight(qryItem.FieldByName('DESCRICAO_SL').AsString, 36) +
            PadRight(qryItem.FieldByName('QTD').AsString, 6));
          if trim(qryItem.FieldByName('OBSERVACAO').AsString) <> '' then
            SL.Add(qryItem.FieldByName('OBSERVACAO').AsString);
          SL.Add('</linha_simples>');

        end;
        qryItem.Next;
      end;
      SL.Add('</corte>');

      if FExisteItem then
      begin

        if trim(Dados.qryTerminalCAMINHO_COZINHA.AsString) <> '' then
          DMImpressao.ConfiguraImpressora
            (Dados.qryTerminalCAMINHO_COZINHA.Value)
        else
          DMImpressao.ConfiguraImpressora('');

        SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'Restaurante.txt');

        if DMImpressao.aCBrPosPrinter1.Ativo then
        begin
          DMImpressao.ImprimeLogo;
          DMImpressao.ImprimeTexto(SL.Text);
        end
        else
          raise Exception.Create('Erro ao imprimir!');
      end;

    finally
      SL.Free;
      qryItem.EnableControls;
    end;
  end;

end;

procedure TFrmPDV.ImprimeDelivery;
var
  vEndereco, sTexto: String;
  SL: TStringList;
begin

  try
    qryItem.DisableControls;
    SL := TStringList.Create;

    SL.Add('<n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');

    SL.Add('</linha_simples>');

    sTexto := 'Pedido No. ' + FormatFloat('0000', qryVendaCODIGO.AsFloat);
    SL.Add('<n>' + PadCenter(sTexto, Dados.qryTerminalCOLUNAS.AsInteger, '*')
      + '</n>');
    SL.Add('</linha_simples>');
    sTexto := qryVendaFK_MESA.AsString;

    SL.Add('Data:' + qryVendaDATA_EMISSAO.AsString);
    SL.Add('Hora......:' + timetostr(time));
    SL.Add('</linha_simples>');
    SL.Add('Cliente..:' + qryVendaVIRTUAL_CLIENTE.AsString);
    SL.Add('Endereco.: ' + qryVendaVIRTUAL_ENDERECO.AsString + ',' +
      qryVendaVIRTUAL_NUMERO.AsString);
    SL.Add('Comp.....:' + qryVendaVIRTUAL_COMPLEMENTO.AsString);
    SL.Add('Bairro...: ' + qryVendaVIRTUAL_BAIRRO.AsString);
    SL.Add('Fone.....: ' + qryVendaVIRTUAL_CELULAR.AsString);
    SL.Add('</linha_simples>');

    SL.Add('<c>' + PadRight('COD', 5) + PadRight('PRODUTO', 26) +
      PadRight('QTD', 6) + PadRight('VALOR', 8) + PadLeft('TOTAL', 10)
      + '</c>');
    SL.Add('</linha_simples>');

    qryItem.First;
    While not qryItem.eof do
    begin
      SL.Add('<c>' + PadRight(qryItem.FieldByName('ID_PRODUTO').AsString, 5) +
        PadRight(qryItem.FieldByName('DESCRICAO_SL').AsString, 24) +
        PadLeft(qryItem.FieldByName('QTD').AsString, 6) +
        PadLeft(FormatFloat('0.00', qryItem.FieldByName('PRECO').AsFloat), 8) +
        PadLeft(FormatFloat('0.00', qryItem.FieldByName('VALOR_ITEM').AsFloat),
        10) + '</c>');

      if trim(qryItemOBSERVACAO.AsString) <> '' then
        SL.Add('<c>' + qryItemOBSERVACAO.Value + '</c>');

      SL.Add('</linha_simples>');
      qryItem.Next;
    end;
    if trim(qryVendaOBSERVACOES.AsString) <> '' then
      SL.Add('Observações:' + qryVendaOBSERVACOES.Value);
    SL.Add('</linha_dupla>');
    SL.Add('</corte>');

    DMImpressao.ConfiguraImpressora('');

    SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'delivery.txt');

    if DMImpressao.aCBrPosPrinter1.Ativo then
    begin
      DMImpressao.ImprimeLogo;
      DMImpressao.ImprimeTexto(SL.Text);
    end
    else
      ShowMessage('Erro ao imprimir!');
  finally
    SL.Free;
    qryItem.EnableControls;
  end;

end;

procedure TFrmPDV.qryConta_MovimentoBeforePost(DataSet: TDataSet);
begin
  if qryConta_Movimento.State = dsInsert then
    qryConta_MovimentoCODIGO.AsFloat := Dados.Numerador('CONTAS_MOVIMENTO',
      'CODIGO', 'N', '', '');
end;

procedure TFrmPDV.CalcTotalMesa;
begin

  try

    qryItem.DisableControls;

    qryItem.First;

    while not qryItem.eof do
    begin

      CalculaTotalVenda(qryVendaCODIGO.Value);
      InsereComposicao(qryItemID_PRODUTO.Value);

      qryItem.Next;

    end;
  finally
    qryItem.EnableControls;
  end;
end;

procedure TFrmPDV.GetIdCliente;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaID_CLIENTE.Value := qryBuscaFoneCODIGO.Value;
  qryVenda.Post;
  Dados.Conexao.CommitRetaining;

end;

procedure TFrmPDV.VerificaFone;
begin
  if Length(TiraPontos(edtFone.EditText)) <> 9 then
  begin
    if pnDelivery.Enabled then
      edtFone.SetFocus;
    raise Exception.Create('Número de Telefone Inválido!');
  end;
end;

procedure TFrmPDV.AtualizaPreco(NovoPreco: Extended);
var
  FPreco, FPrecoMinimo: Extended;
begin
  FPrecoMinimo := 0;
  FPreco := 0;

  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'select QTD_ATACADO, DESCONTO, PRECO_ATACADO, PR_VENDA from produto where codigo=:codigo';
  Dados.qryConsulta.Params[0].Value := qryItemID_PRODUTO.Value;
  Dados.qryConsulta.Open;

  if Dados.qryConsulta.FieldByName('QTD_ATACADO').AsFloat > 0 then
  // checa se quantidade atacado
  Begin
    if qryItemQTD.AsFloat > Dados.qryConsulta.FieldByName('QTD_ATACADO').AsFloat
    then
      FPreco := Dados.qryConsulta.FieldByName('PRECO_ATACADO').AsFloat
    else
      FPreco := Dados.qryConsulta.FieldByName('PR_VENDA').AsFloat
  End
  else
    FPreco := Dados.qryConsulta.FieldByName('PR_VENDA').AsFloat;

  if Dados.qryConsulta.FieldByName('DESCONTO').AsFloat > 0 then
  begin
    // checa se existe desconto

    FPrecoMinimo := FPreco -
      ((FPreco * Dados.qryConsulta.FieldByName('DESCONTO').AsFloat) / 100);

    if NovoPreco < FPrecoMinimo then
      raise Exception.Create('Desconto maior que o permitido!');

  end;

  qryItem.Edit;
  qryItemPRECO.AsFloat := NovoPreco;
  qryItemVALOR_ITEM.AsFloat := RoundABNT(NovoPreco * qryItemQTD.AsFloat, 2);
  qryItem.Post;
  Dados.Conexao.CommitRetaining;

end;

procedure TFrmPDV.AbreVenda(Codigo: Integer; tela: String);
begin
  qryVenda.close;
  qryVenda.Params[0].AsInteger := Codigo;
  qryVenda.Params[1].AsString := tela;
  qryVenda.Open;
end;

procedure TFrmPDV.Retaurante_abre_mesa;
begin
  Dados.qryMesas.close;
  Dados.qryMesas.Open;
end;

procedure TFrmPDV.Restaurante_Status_Mesa;
begin
  if Dados.qryMesasSITUACAO.Value = 'O' then
    PanelRestaurante.Enabled := true
  else
    PanelRestaurante.Enabled := false;
end;

procedure TFrmPDV.CaixaHoje;
begin
  if Dados.qryConsulta.FieldByName('DATA_ABERTURA').Value < date then
  begin
    btnCaixa.Caption := 'F2 Fechar Caixa               ';
    btnCaixa.Tag := 2;
    btnImportar.Enabled := false;
    BtnSuprimento.Enabled := false;
    btnSangria.Enabled := false;
    btnDelItem.Enabled := false;
    btnRemoveProduto.Enabled := false;
    btnCancVenda.Enabled := false;
    btnAvancada.Enabled := false;
    btnFinaliza.Enabled := false;
    btnReceber.Enabled := false;
    PanelPDV.Enabled := false;
    pnRestaurante.Enabled := false;
    pnDelivery.Enabled := false;
    raise Exception.Create('Caixa não é de hoje!');
  end
  else
  begin
    btnCaixa.Caption := 'F2 Fechar Caixa               ';
    btnCaixa.Tag := 2;
  end;
end;

function TFrmPDV.SituacaoCaixa: Boolean;
begin
  // verifica se caixa está aberto
  result := false;
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'select CODIGO, DATA_ABERTURA, LOTE, SITUACAO from contas where id_usuario=:id AND SITUACAO=''A''';
  Dados.qryConsulta.Params[0].Value := Dados.idUsuario;
  Dados.qryConsulta.Open;
  if Dados.qryConsulta.FieldByName('SITUACAO').AsString = 'A' then
    result := true;
end;

procedure TFrmPDV.ChamaAbertura;
begin
  if not Dados.vRetaguarda then
  begin
    try
      frmSplash := TfrmSplash.Create(Application);
      frmSplash.ShowModal;
    finally
      frmSplash.Release;
    end;
  end;
end;

procedure TFrmPDV.HabilitaPreVenda;
begin
  Caption := 'PV - Pedido de Venda';
  StatusBar1.Panels[0].Text := 'PRÉ-VENDA';
  StatusBar1.Panels[1].Text := 'Usuário:' + Dados.vUsuario;
  StatusBar1.Panels[2].Text := 'Vendedor:' + qryVendaVIRTUAL_VENDEDOR.Value;
  habilitacampos(true);

  btnCaixa.Enabled := false;
  btnImportar.Enabled := false;
  btnResumo.Enabled := false;
  btnSangria.Enabled := false;
  BtnSuprimento.Enabled := false;
end;

procedure TFrmPDV.PesquisaTipoTerminal;
begin
  Dados.qryTerminal.close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;
  if not Dados.qryTerminal.Locate('nome', Dados.Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
    close;
  end;
  Dados.TerminalCaixa := Dados.qryTerminalEH_CAIXA.AsString = 'S';
end;

procedure TFrmPDV.ConfiguraTipodecaixa;
begin
  if ehCaixaRapido = 'N' then
  begin

    edtQtdP.ReadOnly := false;
    edtPrecoP.ReadOnly := false;
    edtQtdP.Color := $E0E0C2;
    edtPrecoP.Color := $E0E0C2;

    edtQtdR.ReadOnly := false;
    edtPrecoR.ReadOnly := false;
    edtQtdR.Color := $E0E0C2;
    edtPrecoR.Color := $E0E0C2;

    EdtQtdD.ReadOnly := false;
    EdtPrecoD.ReadOnly := false;
    EdtQtdD.Color := $E0E0C2;
    EdtPrecoD.Color := $E0E0C2;

  end
  else
  begin
    if Dados.qryEmpresaBLOQUEAR_PRECO.Value = 'S' then
    begin
      edtPrecoP.ReadOnly := true;
      edtPrecoR.ReadOnly := true;
      EdtPrecoD.ReadOnly := true;
    end
    else
    begin
      edtPrecoP.ReadOnly := false;
      edtPrecoR.ReadOnly := false;
      EdtPrecoD.ReadOnly := false;
    end;
  end;
end;

procedure TFrmPDV.ChamaLogin;
begin
  if not Dados.vRetaguarda then
  begin
    try
      frmAcesso := TfrmAcesso.Create(Application);
      frmAcesso.ShowModal;
    finally
      frmAcesso.Release;
    end;
  end;
end;

procedure TFrmPDV.qryItemAfterDelete(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
  CalculaTotalVenda(qryVendaCODIGO.Value);
end;

procedure TFrmPDV.qryItemAfterPost(DataSet: TDataSet);
begin

  CalculaTotalVenda(qryVendaCODIGO.Value);

  InsereComposicao(qryItemID_PRODUTO.Value);

  if Dados.FTIpoPDV = 'RESTAURANTE' then
    ImprimeItem;

end;

procedure TFrmPDV.qryItemBeforeDelete(DataSet: TDataSet);
begin

  if Dados.tela <> 'FPG' then
  begin

    if Dados.checanfce(qryVendaCODIGO.Value) then
    begin
      raise Exception.Create
        ('Operação não permitida, Já existe NFC-e gerada para esta venda!' +
        sLineBreak + 'NFC-e número' + Dados.qryConsulta.FieldByName('NUMERO')
        .AsString);
    end;

    DMEstoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
      'E', 'R');

    DMEstoque.AtualizaGrade(qryItemID_PRODUTO.Value, qryItemFK_GRADE.Value,
      qryItemQTD.AsFloat, 'E', 0);

    DMEstoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
      'E', 'R');

  end;
end;

procedure TFrmPDV.qryItemBeforeOpen(DataSet: TDataSet);
begin
  qryProd.close;
  qryProd.Open;
end;

procedure TFrmPDV.qryItemBeforePost(DataSet: TDataSet);
var
 valorcomissao, valor, percentual : Real;
begin
  qryItemTOTAL.AsFloat := qryItemVALOR_ITEM.AsFloat - qryItemVDESCONTO.AsFloat +
    qryItemACRESCIMO.AsFloat;

  valor :=  qryItemVALOR_ITEM.AsFloat;
  percentual := qryProdCOMISSAOPERCENTUAL.AsFloat;

  valorcomissao := valor * percentual / 100;

  ShowMessage('Valor comissão: '+FloatToIntStr(valorcomissao));

  if Dados.tela <> 'FPG' then
  begin
    DMEstoque.AtualizaEstoque(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
      'S', 'R');
    DMEstoque.AtualizaGrade(qryItemID_PRODUTO.Value, qryItemFK_GRADE.Value,
      qryItemQTD.AsFloat, 'S', 0);

    DMEstoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
      'S', 'R');

    DMEstoque.AtualizaComposicao(qryItemID_PRODUTO.Value, qryItemQTD.AsFloat, 0,
      'S', 'R');

  end;

end;

procedure TFrmPDV.qryItemCalcFields(DataSet: TDataSet);
begin
  qryItemDESCRICAO_OBS.AsString := qryItemDESCRICAO_SL.AsString +
    qryItemOBSERVACAO.AsString;
end;

procedure TFrmPDV.qryItemQTDValidate(Sender: TField);
begin

  if qryItemQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryItemQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!!');

end;

procedure TFrmPDV.qryItemVALOR_ITEMValidate(Sender: TField);
begin

  if qryItemVALOR_ITEM.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryItemVALOR_ITEM.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!!');

end;

function TFrmPDV.ValidaItem(Qtd, vPreco: Extended): Boolean;
var
  Preco, percentual: real;
begin
  if Dados.tela <> 'PDV' then
    exit;

  result := true;

  if Dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
  begin

    if qryPesqProdQTD_ATUAL.Value < 0 then
    begin
      if (qryPesqProdSERVICO.Value <> 'S') then
      // se não for servico
      begin
        if PageControl2.ActivePage = TabPDV then
        begin
          EdtProdutoP.Clear;
          edtQtdP.Text := '1';
          edtPrecoP.Text := '0,00';
          lblTotalP.Caption := '0,00';
        end;
        if PageControl2.ActivePage = tabRestaurante then
        begin
          edtProdutoR.Clear;
          edtOBSR.Clear;
          edtQtdR.Text := '1';
          edtPrecoR.Text := '0,00';
          lblTotalR.Caption := '0,00';
        end;
        if PageControl2.ActivePage = tabDelivery then
        begin
          edtProdutoD.Clear;
          edtObsD.Clear;
          EdtQtdD.Text := '1';
          EdtPrecoD.Text := '0,00';
          lblTotalD.Caption := '0,00';
        end;

        result := false;
        raise Exception.Create('Estoque Negativo!');
      end;
    end
    else
    begin
      if qryPesqProdQTD_ATUAL.Value < Qtd then
      begin
        if (qryPesqProdSERVICO.Value <> 'S') then
        // se não for servico
        begin
          if PageControl2.ActivePage = TabPDV then
          begin
            EdtProdutoP.Clear;
            edtQtdP.Text := '1';
            edtPrecoP.Text := '0,00';
            lblTotalP.Caption := '0,00';
          end;
          if PageControl2.ActivePage = tabRestaurante then
          begin
            edtProdutoR.Clear;
            edtOBSR.Clear;
            edtQtdR.Text := '1';
            edtPrecoR.Text := '0,00';
            lblTotalR.Caption := '0,00';
          end;
          if PageControl2.ActivePage = tabDelivery then
          begin
            edtProdutoD.Clear;
            edtObsD.Clear;
            EdtQtdD.Text := '1';
            EdtPrecoD.Text := '0,00';
            lblTotalD.Caption := '0,00';
          end;
          result := false;
          raise Exception.Create('Estoque insuficiente!');
        end;
      end;
    end;

    if qryPesqProd.FieldByName('GRADE').AsString = 'S' then
    begin

      Dados.qryConsulta.close;
      Dados.qryConsulta.SQL.Text :=
        ' select qtd from PRODUTO_GRADE where CODIGO=:cod ';
      Dados.qryConsulta.ParamByName('cod').Value := FGrade;
      Dados.qryConsulta.Open;
      if Dados.qryConsulta.FieldByName('qtd').AsFloat < Qtd then
        raise Exception.Create('Quantidade Grade Insuficiente');
    end;
  end;

  Preco := vPreco;

  if not((qryPesqProdINICIO_PROMOCAO.Value >= date) and
    (date <= qryPesqProdFIM_PROMOCAO.Value)) then
  // não está em promoção
  begin //

    if qryPesqProdDESCONTO.Value > 0 then
    begin
      percentual := 100 - ((Preco / qryPesqProdPR_VENDA.AsFloat) * 100);
      if percentual > qryPesqProdDESCONTO.AsFloat then
      begin
        ShowMessage('Desconto máximo para este produto é de' +
          qryPesqProdDESCONTO.AsString + '%');
        result := false;
        exit;
      end;
    end;

  end
  else
  begin
    if Dados.qryEmpresaDESCONTO_PROD_PROMO.Value = 'S' then
    begin
      if qryPesqProdDESCONTO.Value > 0 then
      begin
        percentual := 100 - ((Preco / qryPesqProdVIRTUAL_PRECO.Value) * 100);
        if percentual > qryPesqProdDESCONTO.AsFloat then
        begin
          ShowMessage('Desconto máximo para este produto é de' +
            qryPesqProdDESCONTO.AsString + '%');
          result := false;
          exit;
        end;
      end;
    end
    else
    begin
      if qryPesqProdVIRTUAL_PRECO.AsFloat < Preco then
      begin
        ShowMessage('Não é permitido descontos para produtos em promoção!');
        result := false;
        exit;
      end;
    end;
  end;

end;

procedure TFrmPDV.ProdutoCalcFieldGenerico(Descricao: string; Qtd: Extended);
var
  Qtde: real;
  valida1, valida2: Boolean;
begin

  if Pos('*', Descricao) > 1 then
  begin

    Qtde := StrToFloatDef((copy(Descricao, 1, Pos('*', Descricao) - 1)), 1);
  end
  else
  begin
    Qtde := 0;
    if trim(Qtd.ToString) <> '' then
      Qtde := StrToFloatDef(Qtd.ToString, 1);
  end;

  if (date >= qryPesqProdINICIO_PROMOCAO.AsDateTime) and
    (date <= qryPesqProdFIM_PROMOCAO.AsDateTime) then
  begin
    // produto em promoção
    qryPesqProdVIRTUAL_PRECO.AsFloat := qryPesqProdPRECO_PROMO_VAREJO.AsFloat;
    if (Qtde >= qryPesqProdQTD_ATACADO.AsFloat) and
      (qryPesqProdQTD_ATACADO.AsFloat > 0) and
      (qryPesqProdPRECO_PROMO_ATACADO.AsFloat > 0) then
      qryPesqProdVIRTUAL_PRECO.AsFloat :=
        qryPesqProdPRECO_PROMO_ATACADO.AsFloat;
  end
  else
  begin

    qryPesqProdVIRTUAL_PRECO.AsFloat := qryPesqProdPR_VENDA.AsFloat;
    if ((Qtde >= qryPesqProdQTD_ATACADO.AsFloat) and
      (qryPesqProdQTD_ATACADO.AsFloat > 0) and (qryPesqProdPRECO_ATACADO.AsFloat
      > 0)) then
      qryPesqProdVIRTUAL_PRECO.AsFloat := qryPesqProdPRECO_ATACADO.AsFloat;

  end;
end;

procedure TFrmPDV.qryPesqProdCalcFields(DataSet: TDataSet);
begin
  if PageControl2.ActivePage = TabPDV then
    ProdutoCalcFieldGenerico(edtProdutoD.Text, StrToFloatDef(edtQtdP.Text, 1));
  if PageControl2.ActivePage = tabRestaurante then
    ProdutoCalcFieldGenerico(edtProdutoR.Text, StrToFloatDef(edtQtdR.Text, 1));
  if PageControl2.ActivePage = tabDelivery then
    ProdutoCalcFieldGenerico(edtProdutoD.Text, StrToFloatDef(EdtQtdD.Text, 1));
end;

procedure TFrmPDV.CalculaTotalVenda(idVenda: Integer);
begin

  qrySoma.close;
  qrySoma.Params[0].Value := idVenda;
  qrySoma.Open;

  if qrySomaTOTAL.AsFloat = 0 then
  begin
    Dados.qryExecute.close;
    Dados.qryExecute.SQL.Text :=
      'UPDATE VENDAS_MASTER SET SUBTOTAL=:SUBTOTAL,TOTAL=:TOTAL, ACRESCIMO=:ACRESCIMO, DESCONTO=:DESCONTO, PERCENTUAL=:PERCENTUAL, PERCENTUAL_ACRESCIMO=:PERCENTUAL_ACRESCIMO WHERE CODIGO=:CODIGO';
    Dados.qryExecute.ParamByName('TOTAL').Value := 0;
    Dados.qryExecute.ParamByName('SUBTOTAL').Value := 0;
    Dados.qryExecute.ParamByName('ACRESCIMO').Value := 0;

    if ((qryVendaFK_OS.AsInteger = 0) or (qryVendaFK_OS.IsNull)) and
      ((qryVendaFKORCAMENTO.AsInteger = 0) or (qryVendaFKORCAMENTO.IsNull)) then
    begin
      Dados.qryExecute.ParamByName('DESCONTO').Value := 0;
      Dados.qryExecute.ParamByName('PERCENTUAL').Value := 0;
    end;

    Dados.qryExecute.ParamByName('PERCENTUAL_ACRESCIMO').Value := 0;
    Dados.qryExecute.ParamByName('CODIGO').Value := qryVendaCODIGO.Value;
    Dados.qryExecute.ExecSQL;
  end
  else
  begin

    Dados.qryExecute.close;
    Dados.qryExecute.SQL.Text :=
      'UPDATE VENDAS_MASTER SET SUBTOTAL=:SUBTOTAL, TOTAL=:TOTAL,  PERCENTUAL=:PERCENTUAL, PERCENTUAL_ACRESCIMO=:PERCENTUAL_ACRESCIMO WHERE CODIGO=:CODIGO';
    Dados.qryExecute.ParamByName('SUBTOTAL').AsFloat := qrySomaTOTAL.AsFloat;
    Dados.qryExecute.ParamByName('TOTAL').AsFloat :=
      Dados.qryExecute.ParamByName('SUBTOTAL').AsFloat -
      qryVendaDESCONTO.AsFloat + qryVendaACRESCIMO.AsFloat;
    Dados.qryExecute.ParamByName('PERCENTUAL').AsFloat :=
      (FrmPDV.qryVendaDESCONTO.AsFloat / Dados.qryExecute.ParamByName
      ('SUBTOTAL').AsFloat) * 100;
    Dados.qryExecute.ParamByName('PERCENTUAL_ACRESCIMO').AsFloat :=
      (FrmPDV.qryVendaACRESCIMO.AsFloat / Dados.qryExecute.ParamByName
      ('SUBTOTAL').AsFloat) * 100;
    Dados.qryExecute.ParamByName('CODIGO').Value := qryVendaCODIGO.Value;
    Dados.qryExecute.ExecSQL;
  end;

  Dados.Conexao.CommitRetaining;
  qryVenda.Refresh;
end;

procedure TFrmPDV.qryVendaAfterDelete(DataSet: TDataSet);
begin
  CalculaTotalVenda(qryVendaCODIGO.Value);
end;

procedure TFrmPDV.qryVendaAfterOpen(DataSet: TDataSet);
begin
  qryItem.close;
  qryItem.Open;

end;

procedure TFrmPDV.qryVendaAfterPost(DataSet: TDataSet);
begin
  CalculaTotalVenda(qryVendaCODIGO.Value);
end;

procedure TFrmPDV.qryVendaBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryVendedor.close;
  Dados.qryVendedor.Open;

  Dados.qryClientes.close;
  Dados.qryClientes.Params[0].Value := '%';
  Dados.qryClientes.Open;

  qryCliente.close;
  qryCliente.Params[0].Value := '%';
  qryCliente.Params[1].Value := '%';
  qryCliente.Open;

end;

procedure TFrmPDV.qryVendaCalcFields(DataSet: TDataSet);
begin
  if (qryVendaID_CLIENTE.AsInteger <> Dados.qryConfigCLIENTE_PADRAO.Value) then
  begin

    edtCliente.Caption := qryVendaVIRTUAL_CLIENTE.Value + ' | ' +
      qryVendaVIRTUAL_CELULAR.AsString;
    pnEndereco.Caption := qryVendaVIRTUAL_ENDERECO.Value + ',' +
      qryVendaVIRTUAL_NUMERO.Value + ' | ' + qryVendaVIRTUAL_BAIRRO.Value +
      ' | ' + qryVendaVIRTUAL_COMPLEMENTO.Value;
  end
  else
  begin
    edtCliente.Caption := 'CLIENTE NÃO FOI LOCALIZADO';
    pnEndereco.Caption := '';
    edtFone.Text := '';
  end;
end;

procedure TFrmPDV.qryVendaDESCONTOValidate(Sender: TField);
begin
  qryVendaTOTAL.Value := qryVendaSUBTOTAL.Value - qryVendaDESCONTO.Value +
    qryVendaACRESCIMO.Value;
end;

procedure TFrmPDV.btnReimprimirClick(Sender: TObject);
begin

  if not btnReimprimir.Visible then
    exit;

  try
    frmReimprimir := TfrmReimprimir.Create(Application);
    frmReimprimir.ShowModal;
  finally
    frmReimprimir.Release;
  end;
end;

procedure TFrmPDV.btnRemoveProdutoClick(Sender: TObject);
begin
  if not btnRemoveProduto.Visible then
    exit;

  try
    FrmRemoveProduto := TFrmRemoveProduto.Create(Application);
    FrmRemoveProduto.QueryItem := qryItem;
    FrmRemoveProduto.qrySoma := qrySoma;
    FrmRemoveProduto.qryVenda := qryVenda;
    FrmRemoveProduto.ShowModal;
  finally
    FrmRemoveProduto.Release;

  end;
end;

procedure TFrmPDV.PrecoVariavel;
begin
  if Dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    if qryPesqProdPRECO_VARIAVEL.Value = 'S' then
    begin
      ehCaixaRapido := 'N';
      edtPrecoP.ReadOnly := false;
    end
    else
      ehCaixaRapido := 'S';
  end;
end;

procedure TFrmPDV.PesquisaCodBarra(FPesquisa, Descricao: String);
begin
  if copy(Descricao, 1, 1) = Dados.qryConfigPREFIXO_BALANCA.Value then
  begin
    if (Length(FPesquisa) >= 13) then
    begin
      if Pos('*', Descricao) = 0 then
        PesquisaCodBarraBalanca(FPesquisa)
      else

        PesquisaCodBarraGeral(FPesquisa);
    end
    else
      PesquisaCodBarraGeral(FPesquisa);
  end
  else
    PesquisaCodBarraGeral(FPesquisa);

end;

procedure TFrmPDV.PesquisaDescricao(FPesquisa: String);
// pesquisa
begin

  qryPesqProd.close;
  qryPesqProd.IndexFieldNames := 'DESCRICAO';
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.SQL.Text := StringReplace(vSql, '/*where*/',
    ' AND ((PRO.DESCRICAO LIKE :DESCRICAO) or (PRO.REFERENCIA LIKE :REF)) ORDER BY DESCRICAO',
    [rfReplaceAll]);
  qryPesqProd.ParamByName('EMP').Value := qryVendaFKEMPRESA.Value;
  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    qryPesqProd.ParamByName('DESCRICAO').Value := '%' + FPesquisa + '%'
  else
    qryPesqProd.ParamByName('DESCRICAO').Value := FPesquisa + '%';
  qryPesqProd.ParamByName('REF').Value := copy(FPesquisa, 1, 19) + '%';

  qryPesqProd.Open;

  if not(qryPesqProd.IsEmpty) then
  begin
    PrecoVariavel;
    PreencheBuscaPreco;

    ItemDesconhecido;
  end;

end;

procedure TFrmPDV.GeraSqlProduto;
begin

  if Dados.qryEmpresaCHECA_ESTOQUE_FISCAL.Value = 'N' then
  begin
    vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
      ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
      ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' + ' PRO.FOTO,' +
      ' PRO.QTD_FISCAL,' +
      ' PRO.UNIDADE, PRO.EFISCAL,PRO.E_MEDIO, PRO.LOCALIZACAO, PRO.PRODUTO_PESADO,'
      + ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO, PRO.PRECO_VARIAVEL, PRO.DESCONTO,'
      + ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.SERIAL, PRO.ULTFORN, PRO.PREFIXO_BALANCA'
      + ' FROM PRODUTO PRO' +
      ' WHERE (PRO.EMPRESA=:EMP) and (PRO.QTD_ATUAL>0) AND (PRO.ATIVO=''S'') ' +
      '/*where*/';
  end
  else
  begin
    vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
      ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
      ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' +  ' PRO.FOTO,' +
      ' PRO.QTD_FISCAL,' +
      ' PRO.UNIDADE, PRO.EFISCAL,PRO.E_MEDIO, PRO.LOCALIZACAO, PRO.PRODUTO_PESADO, '
      + ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO, PRO.PRECO_VARIAVEL, PRO.DESCONTO,'
      + ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.SERIAL, PRO.ULTFORN, PRO.PREFIXO_BALANCA '
      + ' FROM PRODUTO PRO' + ' WHERE (PRO.EMPRESA=:EMP) AND (PRO.ATIVO=''S'') '
      + ' /*where*/';
  end;

  qryPesqProd.close;
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.ParamByName('EMP').Value := qryVendaFKEMPRESA.Value;
  qryPesqProd.Open;

end;

procedure TFrmPDV.EdtProdutoPChange(Sender: TObject);
var
  Qtd: Integer;
  Descricao: string;
begin

  if PageControl2.ActivePage = TabPDV then
    Descricao := EdtProdutoP.Text;

  if PageControl2.ActivePage = tabDelivery then
    Descricao := edtProdutoD.Text;

  if Length(Descricao) = 13 then
    Qtd := 1;

  if PageControl2.ActivePage = TabPDV then // PDV
  begin
    if Pos('*', Descricao) = 0 then begin
      edtQtdP.Text := '1';
    end;
    DBGridBuscaP.Visible := false;
  end;

  if PageControl2.ActivePage = tabDelivery then // Restaurante
  begin
    if Pos('*', Descricao) = 0 then
      edtQtdR.Text := '1';
    DBGridBuscaD.Visible := false;
  end;

  if not PesquisaProduto then
    exit;

  vPosicao := Pos('*', trim(Descricao)) + 1;
  vPesquisa := trim(copy((Descricao), vPosicao, 1000));

  if (trim(Descricao) <> '') then
  begin

    if PageControl2.ActivePage = TabPDV then
      DBGridBuscaP.Visible := true;
    if PageControl2.ActivePage = tabRestaurante then
      DBGridBuscaR.Visible := true;
    if PageControl2.ActivePage = tabDelivery then
      DBGridBuscaD.Visible := true;

    if not Dados.EhNumero(vPesquisa) then
    begin
      if Descricao <> '' then
        PesquisaDescricao(vPesquisa);
    end;
  end;



end;

procedure TFrmPDV.EdtProdutoPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (DBGridBuscaP.Visible) or (DBGridBuscaD.Visible) or (DBGridBuscaR.Visible)
  then
  begin
    if Key = VK_UP then
    begin
      qryPesqProd.Prior;
      PreencheBuscaPreco;
      DescricaoSetFocus('I')
    end;
    if Key = VK_DOWN then
    begin
      qryPesqProd.Next;
      PreencheBuscaPreco;
      DescricaoSetFocus('I')
    end;
  end
  else
  begin
    if Key = VK_UP then
    begin
      qryItem.Prior;
      DescricaoSetFocus('I')

    end;
    if Key = VK_DOWN then
    begin
      qryItem.Next;
      DescricaoSetFocus('I')
    end;
  end;

end;

procedure TFrmPDV.BuscaPeso;
begin

  if qryPesqProd.FieldByName('PRODUTO_PESADO').AsString = 'S' then
  begin
    if Dados.qryEmpresaLER_PESO.Value = 'S' then
    begin
      try
        ACBrBAL1.LePeso(2000);
      except
        on e: Exception do
          raise Exception.Create(e.Message);

      end;
    end;

  end;

end;

procedure TFrmPDV.ChamaSerial;
begin
  vSerie := '0';
  if qryPesqProdSERIAL.Value = 'S' then
  begin
    try
      frmSerial := TfrmSerial.Create(Application);
      frmSerial.ShowModal;
    finally
      vSerie := IntToStr(BaixaSerial(qryPesqProdCODIGO.AsInteger,
        qryVendaCODIGO.AsInteger, StrToFloatDef(edtPrecoP.Text, 0),
        frmSerial.edtSerial.Text));
      frmSerial.Release;
      if ehCaixaRapido = 'S' then
      begin
        if PageControl2.ActivePage = TabPDV then
          InsereItem(EdtProdutoP.Text, '', StrToFloatDef(edtPrecoP.Text, 0),
            StrToFloatDef(edtQtdP.Text, 1),
            StrToFloatDef(lblTotalP.Caption, 0));

        if PageControl2.ActivePage = tabRestaurante then
          InsereItem(edtProdutoR.Text, edtOBSR.Text,
            StrToFloatDef(edtPrecoR.Text, 0), StrToFloatDef(edtQtdR.Text, 1),
            StrToFloatDef(lblTotalR.Caption, 0));

        if PageControl2.ActivePage = tabDelivery then
          InsereItem(edtProdutoD.Text, edtObsD.Text,
            StrToFloatDef(EdtPrecoD.Text, 0), StrToFloatDef(EdtQtdD.Text, 1),
            StrToFloatDef(lblTotalD.Caption, 0));

      end;
    end;
  end;

end;

procedure TFrmPDV.EdtProdutoPKeyPress(Sender: TObject; var Key: Char);
var
  Qtd: Integer;
  Descricao: String;
begin


  // produtos
  if PageControl2.ActivePage = TabPDV then
  begin


    Descricao := EdtProdutoP.Text;
    if Length(EdtProdutoP.Text) = 13 then
      Qtd := 1;

    vPosicao := Pos('*', trim(EdtProdutoP.Text)) + 1;
    vPesquisa := trim(copy((EdtProdutoP.Text), vPosicao, 1000));

    if EdtProdutoP.ReadOnly then
      exit;

    if copy(EdtProdutoP.Text, 1, 1) = '*' then
    begin
      if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
        Key := #0;
      exit;
    end;

  end;

  if PageControl2.ActivePage = tabRestaurante then
  begin

    Descricao := edtProdutoR.Text;

    if Length(edtProdutoR.Text) = 13 then
      Qtd := 1;

    vPosicao := Pos('*', trim(edtProdutoR.Text)) + 1;
    vPesquisa := trim(copy((edtProdutoR.Text), vPosicao, 1000));

    if edtProdutoR.ReadOnly then
      exit;

    if copy(edtProdutoR.Text, 1, 1) = '*' then
    begin
      if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
        Key := #0;
      exit;
    end;

  end;

  if PageControl2.ActivePage = tabDelivery then
  begin



    Descricao := edtProdutoD.Text;
    if Length(edtProdutoD.Text) = 13 then
      Qtd := 1;

    vPosicao := Pos('*', trim(edtProdutoD.Text)) + 1;
    vPesquisa := trim(copy((edtProdutoD.Text), vPosicao, 1000));

    if edtProdutoD.ReadOnly then
      exit;

    if copy(edtProdutoD.Text, 1, 1) = '*' then
    begin
      if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
        Key := #0;
      exit;
    end;

  end;

  if (Key = #13) then
  begin

    try
      if (Dados.EhNumero(vPesquisa)) and (vPesquisa <> '') then
      begin
        PesquisaCodBarra(vPesquisa, Descricao);
        if not qryPesqProd.IsEmpty then
        begin
          BuscaPeso;
          PreencheBuscaPreco;
        end;
      end
      else
      begin
        if PageControl2.ActivePage = TabPDV then
          AtualizaDescricao(EdtProdutoP.Text);
        if PageControl2.ActivePage = tabRestaurante then
          AtualizaDescricao(edtProdutoR.Text);
        if PageControl2.ActivePage = tabDelivery then
          AtualizaDescricao(edtProdutoD.Text);
        BuscaPeso;
        PreencheBuscaPreco;
      end;

      if PageControl2.ActivePage = TabPDV then
        FechaVenda(EdtProdutoP.Text);
      if PageControl2.ActivePage = tabRestaurante then
        FechaVenda(edtProdutoR.Text);
      if PageControl2.ActivePage = tabDelivery then
        FechaVenda(edtProdutoD.Text);

      PrecoVariavel;

      if ehCaixaRapido = 'S' then
      begin

        if qryPesqProdGRADE.Value = 'S' then
        begin
          ChamaGrade;
        end
        else if qryPesqProdSERIAL.Value = 'S' then
        begin
          if PageControl2.ActivePage = TabPDV then
            ChamaSerial;
        end
        else
        begin
          if copy(Descricao, 1, 1) = '*' then
          begin
            if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
              Key := #0;
            if PageControl2.ActivePage = TabPDV then
            begin
              EdtProdutoP.Clear;
              EdtProdutoP.SetFocus;
              edtQtdP.Text := '1';
            end;

            if PageControl2.ActivePage = tabRestaurante then
            begin
              edtProdutoR.Clear;
              edtProdutoR.SetFocus;
              edtQtdR.Text := '1';
            end;

            if PageControl2.ActivePage = tabDelivery then
            begin
              edtProdutoD.Clear;
              edtProdutoD.SetFocus;
              EdtQtdD.Text := '1';
            end;

          end
          else
          begin
            if PageControl2.ActivePage = TabPDV then
            begin
              if ActiveControl = EdtProdutoP then
                EdtProdutoP.SetFocus;
            end;
            if PageControl2.ActivePage = tabRestaurante then
            begin
              if ActiveControl = edtProdutoR then
              begin
                if PanelRestaurante.Enabled then
                  edtProdutoR.SetFocus;
              end;
            end;
            if PageControl2.ActivePage = tabDelivery then
            begin
              if ActiveControl = edtProdutoD then
                edtProdutoD.SetFocus;
            end;

            BuscaPeso;
            ItemDesconhecido;

            if PageControl2.ActivePage = TabPDV then
              InsereItem(EdtProdutoP.Text, '', StrToFloatDef(edtPrecoP.Text, 0),
                StrToFloatDef(edtQtdP.Text, 1),
                StrToFloatDef(lblTotalP.Caption, 0));

            if PageControl2.ActivePage = tabRestaurante then
              InsereItem(edtProdutoR.Text, edtOBSR.Text,
                StrToFloatDef(edtPrecoR.Text, 0), StrToFloatDef(edtQtdR.Text,
                1), StrToFloatDef(lblTotalR.Caption, 0));

            if PageControl2.ActivePage = tabDelivery then
              InsereItem(edtProdutoD.Text, edtObsD.Text,
                StrToFloatDef(EdtPrecoD.Text, 0), StrToFloatDef(EdtQtdD.Text,
                1), StrToFloatDef(lblTotalD.Caption, 0));

          end;
        end;

      end
      else if trim(Descricao) <> '' then
      begin

        if PageControl2.ActivePage = TabPDV then
        begin
          ChamaGrade;
          ChamaSerial;
          edtQtdP.SetFocus;
        end;
        if PageControl2.ActivePage = tabRestaurante then
          edtOBSR.SetFocus;
        if PageControl2.ActivePage = tabDelivery then
          edtObsD.SetFocus;

      end
      else
      begin
        if PageControl2.ActivePage = TabPDV then
          EdtProdutoP.SetFocus;
        if PageControl2.ActivePage = tabRestaurante then
        begin
          if PanelRestaurante.Enabled then
            edtProdutoR.SetFocus;
        end;
        // if PageControl2.ActivePage = tabDelivery then
        // edtProdutoD.SetFocus;

      end;

    finally
      if (qryPesqProdGRADE.AsString = 'N') and (ehCaixaRapido = 'S') then
      begin
        if PageControl2.ActivePage = TabPDV then
          EdtProdutoP.Clear;
        if PageControl2.ActivePage = tabRestaurante then
        begin
          edtOBSR.Clear;
          edtProdutoR.Clear;
        end;
        if PageControl2.ActivePage = tabDelivery then
        begin
          edtObsD.Clear;
          edtProdutoD.Clear;
        end;

      end;
    end;
  end;

end;

procedure TFrmPDV.edtProdutoRChange(Sender: TObject);
var
  Qtd: Integer;
  Descricao: string;
begin
  if PageControl2.ActivePage = tabRestaurante then
    Descricao := edtProdutoR.Text;

  if Length(Descricao) = 13 then
    Qtd := 1;

  if PageControl2.ActivePage = tabRestaurante then // Restaurante
  begin
    if Pos('*', Descricao) = 0 then
      edtQtdR.Text := '1';
    DBGridBuscaR.Visible := false;
  end;

  if not PesquisaProduto then
    exit;

  vPosicao := Pos('*', trim(Descricao)) + 1;
  vPesquisa := trim(copy((Descricao), vPosicao, 1000));

  if (trim(Descricao) <> '') then
  begin

    if PageControl2.ActivePage = tabRestaurante then
      DBGridBuscaR.Visible := true;

    if not Dados.EhNumero(vPesquisa) then
    begin
      if Descricao <> '' then
        PesquisaDescricao(vPesquisa);
    end;
  end;

end;

procedure TFrmPDV.edtProdutoREnter(Sender: TObject);
begin
  edtProdutoR.SelectAll;
end;

procedure TFrmPDV.edtQtdPEnter(Sender: TObject);
begin
  //      ShowMessage('O "2" esta na posição ' + IntToStr(Pos('2', EdtProdutoP.Text)));
  if ehCaixaRapido = 'S' then
  begin

    if PageControl2.ActivePage = TabPDV then
      EdtProdutoP.SetFocus;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      if PanelRestaurante.Enabled then
        edtProdutoR.SetFocus;
    end;
    if PageControl2.ActivePage = tabDelivery then
      edtProdutoD.SetFocus;
  end;

   if PageControl2.ActivePage = TabPDV then
  begin
     if Pos('2', EdtProdutoP.Text) = 1 then begin
 PrecoBalancaUn := edtPrecoP.text;
    DecodificaBalanca(EdtProdutoP.Text);

  end;
  end;

    if PageControl2.ActivePage = tabRestaurante then
  begin
     if Pos('2', EdtProdutoR.Text) = 1 then begin
      PrecoBalancaUn := edtPrecoR.text;
    DecodificaBalanca(EdtProdutoR.Text);
  end;
  end;

     if PageControl2.ActivePage = tabDelivery then
  begin
     if Pos('2', EdtProdutoD.Text) = 1 then begin
      PrecoBalancaUn := edtPrecoD.text;
    DecodificaBalanca(EdtProdutoD.Text);
  end;
  end;
end;

procedure TFrmPDV.edtQtdPExit(Sender: TObject);
var
  Total: real;
begin
  if PageControl2.ActivePage = TabPDV then
  begin
    Total := StrToFloatDef(edtQtdP.Text, 1) * StrToFloatDef(edtPrecoP.Text, 0);
    lblTotalP.Caption := FormatFloat('0.00', RoundABNT(Total, 2));
  end;
  if PageControl2.ActivePage = tabRestaurante then
  begin
    Total := StrToFloatDef(edtQtdR.Text, 1) * StrToFloatDef(edtPrecoR.Text, 0);
    lblTotalR.Caption := FormatFloat('0.00', Total);
  end;
  if PageControl2.ActivePage = tabDelivery then
  begin
    Total := StrToFloatDef(EdtQtdD.Text, 1) * StrToFloatDef(EdtPrecoD.Text, 0);
    lblTotalD.Caption := FormatFloat('0.00', Total);
  end;

end;

procedure TFrmPDV.edtQtdPKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key In ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;

  if Key = #13 then
  begin
    if PageControl2.ActivePage = TabPDV then
      edtPrecoP.SetFocus;
    if PageControl2.ActivePage = tabRestaurante then
    begin
      if PanelRestaurante.Enabled then
        edtPrecoR.SetFocus;
    end;
    if PageControl2.ActivePage = tabDelivery then
      EdtPrecoD.SetFocus;

  end;
end;

procedure TFrmPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (PageControl2.ActivePage = TabPDV) then
  begin
    if (qryVenda.State in dsEditModes) then
      qryVenda.Post;
    Dados.Conexao.CommitRetaining;
  end
  else
  begin
    if (qryVenda.State = dsInsert) then
      qryVenda.Cancel;
  end;

  qryVenda.close;
  qryItem.close;
  qryPesqProd.close;
  qryPesqProd.close;

end;

procedure TFrmPDV.CarregaImagem;
begin


  if not Dados.qryParametro.Active then
    Dados.qryParametro.Open;

  if FileExists(Dados.qryParametro.FieldByName('TELA_FUNDO_ECF').AsString) then
  begin
    imgLogo.Picture.LoadFromFile
      (Dados.qryParametro.FieldByName('TELA_FUNDO_ECF').Value);
    Label1.Visible := false;
  end
  else
    Label1.Visible := true;

end;

procedure TFrmPDV.ChecaATACADO(produto, venda: Integer);
begin
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Add
    ('select  vd.id_produto, pro.qtd_atacado, pro.preco_atacado, vd.qtd, SUM(vd.qtd) QTD  from vendas_detalhe vd');
  Dados.qryConsulta.SQL.Add
    ('left join produto pro on pro.codigo=vd.id_produto');
  Dados.qryConsulta.SQL.Add('where');
  Dados.qryConsulta.SQL.Add('vd.fkvenda=:vd and vd.id_produto=:id');
  Dados.qryConsulta.SQL.Add('group by 1,2,3,4');
  Dados.qryConsulta.SQL.Add('having sum(vd.qtd)>=pro.qtd_atacado');
  Dados.qryConsulta.SQL.Add('order by 1');
  Dados.qryConsulta.Params[0].Value := venda;
  Dados.qryConsulta.Params[1].Value := produto;
  Dados.qryConsulta.Open;

  Dados.qryConsulta.First;

  if not Dados.qryConsulta.IsEmpty then
  begin
    Dados.qryExecute.close;
    Dados.qryExecute.SQL.Text :=
      'update vendas_detalhe set preco=:preco,  valor_item= qtd*:preco where ID_PRODUTO=:ID';
    Dados.qryExecute.Params[0].Value := Dados.qryConsulta.Fields[2].AsFloat;
    Dados.qryExecute.Params[1].Value := produto;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;

    { Dados.qryExecute.close;
      Dados.qryExecute.SQL.Text :=
      'update vendas_detalhe set valor_item= qtd*preco where ID_PRODUTO=:ID';
      Dados.qryExecute.Params[0].Value := produto;
      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining; }
  end;

end;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin

  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  TabPDV.TabVisible := false;
  tabRestaurante.TabVisible := false;
  tabDelivery.TabVisible := false;

  GeraSqlProduto;

  Dados.qryTerminal.close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  Dados.qryTerminal.Locate('NOME', Dados.Getcomputer, []);

  if not Dados.vRetaguarda then
    Dados.ChecaPDV;

  if Dados.FTIpoPDV = 'PDV' then
    PageControl2.ActivePage := TabPDV;

  if Dados.FTIpoPDV = 'DELIVERY' then
  begin
    tabDelivery.TabVisible := true;

    if Dados.qryTerminalPDV.Value = 'S' then
      TabPDV.TabVisible := true;

    if Dados.qryTerminalRESTAURANTE.Value = 'S' then
      tabRestaurante.TabVisible := true;

    PageControl2.ActivePage := tabDelivery;
    edtFone.Text := '';
  end;

  if Dados.FTIpoPDV = 'RESTAURANTE' then
  begin
    tabRestaurante.TabVisible := true;

    if Dados.qryTerminalPDV.Value = 'S' then
      TabPDV.TabVisible := true;

    if Dados.qryTerminalDELIVERY.Value = 'S' then
      tabDelivery.TabVisible := true;

    PageControl2.ActivePage := tabRestaurante;

    btnAtualizaMesaClick(self);
  end;

  qryTabela.close;
  qryTabela.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  qryTabela.Open;

  Dados.qryConfig.close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.AsInteger;
  Dados.qryConfig.Open;
  ehCaixaRapido := Dados.qryEmpresaCAIXA_RAPIDO.AsString;

  CarregaImagem;

  ChamaAbertura;
  ChamaLogin;
end;

procedure TFrmPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_escape then
  begin
    if not DBGridBuscaP.Visible then
    begin
      if Application.messagebox('Tem certeza de que deseja sair?',
        'Confirmação', mb_yesno) = mrYes then
        close;
    end;
  end;

  if Key = VK_F12 then
  begin
    if PageControl2.ActivePage = TabPDV then
    begin
      EdtProdutoP.SetFocus;
      EdtProdutoP.SelectAll;
    end;

    if PageControl2.ActivePage = tabRestaurante then
    begin
      if PanelRestaurante.Enabled then
        edtProdutoR.SetFocus;
      edtProdutoR.SelectAll;
    end;

    if PageControl2.ActivePage = tabDelivery then
    begin
      edtProdutoD.SetFocus;
      edtProdutoD.SelectAll;
    end;
  end;

  if Key = VK_F1 then
  begin
    if Dados.FTIpoPDV = 'DELIVERY' then
    begin
      if pnDelivery.Enabled then
        edtFone.SetFocus;
    end;
  end;

  if Key = VK_F2 then
  begin
    if btnCaixa.Tag = 1 then
    begin
      AbreCaixa;
      exit;
    end
    else if btnCaixa.Tag = 2 then
    begin
      FecharCaixa;
      exit;
    end;
  end;

  if Key = VK_F3 then
  begin
    if btnVendedor.Enabled then
      btnVendedorClick(self);
  end;

  if Key = VK_F4 then
  begin
    if btnAvancada.Enabled then
      btnAvancadaClick(self);
  end;

  if Key = VK_F5 then
  begin
    if btnImportar.Enabled then
      btnImportarClick(self);
  end;

  if Key = VK_F6 then
  begin
    if btnCancVenda.Enabled then
      btnCancVendaClick(self);
  end;

  if Key = VK_F7 then
  begin
    if btnFinaliza.Enabled then
      btnFinalizaClick(self);
  end;

  if Key = VK_F8 then
  begin
    if btnResumo.Enabled then
      btnResumoClick(self);
  end;

  if Key = VK_F9 then
  begin
    if btnSangria.Enabled then
      btnSangriaClick(self);
  end;

  if Key = VK_F10 then
  begin
    if BtnSuprimento.Enabled then
      BtnSuprimentoClick(self);
  end;

  if Key = VK_F11 then
  begin
    if btnRemoveProduto.Enabled then
      btnRemoveProdutoClick(self);
  end;

  if Key = vk_delete then
  begin
    if btnDelItem.Enabled then
    begin

      if (ActiveControl = DBGridP) or (ActiveControl = DBGridD) or
        (ActiveControl = DBGridR) then
      begin
        btnDelItemClick(self);
        exit;
      end
      else if (ActiveControl = EdtProdutoP) or (ActiveControl = edtProdutoR) or
        (ActiveControl = edtProdutoD) then
      begin
        if EdtProdutoP.Text = '' then
        begin
          btnDelItemClick(self);
          exit;
        end;
      end;
    end;
  end;
end;

procedure TFrmPDV.ImgOcupadoClick(Sender: TObject);
begin

  if Dados.qryMesas.IsEmpty then
    exit;

  AbreVenda(BuscaNumeroVenda, Dados.FTIpoPDV);

  Restaurante_Status_Mesa;

  if PanelRestaurante.Enabled then
    edtProdutoR.SetFocus;

end;

procedure TFrmPDV.InsereComposicao(produto: Integer);
var
  FQuantidade: Extended;
  ehComposicao: String;

begin

  if Dados.tela = 'FPG' then
    exit;

  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Text :=
    'select composicao from produto where codigo=:id';
  Dados.qryConsulta.Params[0].Value := produto;
  Dados.qryConsulta.Open;
  ehComposicao := Dados.qryConsulta.Fields[0].AsString;

  if ehComposicao = 'S' then
  begin

    qryComposicao.close;
    qryComposicao.Params[0].Value := produto;
    qryComposicao.Open;

    qryComposicao.First;
    while not qryComposicao.eof do
    begin

      FQuantidade := qryItemQTD.AsFloat * qryComposicao.FieldByName
        ('QUANTIDADE').AsFloat;

      Dados.qryExecute.SQL.Clear;
      Dados.qryExecute.SQL.Add('INSERT INTO VENDAS_COMPOSICAO (');
      Dados.qryExecute.SQL.Add('CODIGO,');
      Dados.qryExecute.SQL.Add('FK_VENDA_DETALHE,');
      Dados.qryExecute.SQL.Add('ID_PRODUTO,');
      Dados.qryExecute.SQL.Add('QTD,');
      Dados.qryExecute.SQL.Add('QTD_DEVOLVIDA)');
      Dados.qryExecute.SQL.Add('VALUES (');
      Dados.qryExecute.SQL.Add(':CODIGO,');
      Dados.qryExecute.SQL.Add(':FK_VENDA_DETALHE,');
      Dados.qryExecute.SQL.Add(':ID_PRODUTO,');
      Dados.qryExecute.SQL.Add(':QTD,');
      Dados.qryExecute.SQL.Add(':QTD_DEVOLVIDA');
      Dados.qryExecute.SQL.Add(');');

      Dados.qryExecute.ParamByName('CODIGO').Value :=
        Dados.Numerador('VENDAS_COMPOSICAO', 'CODIGO', 'N', '', '');
      Dados.qryExecute.ParamByName('FK_VENDA_DETALHE').Value :=
        qryItemCODIGO.Value;
      Dados.qryExecute.ParamByName('ID_PRODUTO').Value :=
        qryComposicaoID_PRODUTO.Value;
      Dados.qryExecute.ParamByName('QTD').Value := qryItemQTD.AsFloat *
        qryComposicao.FieldByName('QUANTIDADE').AsFloat;

      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining;

      qryComposicao.Next;
    end;
  end;

end;

function TFrmPDV.validaComposicao(produto: Integer): Boolean;
var
  FQuantidade: Extended;
  ehComposicao: Boolean;

begin

  result := true;

  if Dados.tela = 'FPG' then
    exit;

  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Clear;
  Dados.qryConsulta.SQL.Text :=
    'select composicao from produto where codigo=:id and composicao=''S''';
  Dados.qryConsulta.Params[0].Value := produto;
  Dados.qryConsulta.Open;

  ehComposicao := not Dados.qryConsulta.IsEmpty;

  if ehComposicao then
  begin

    qryComposicao.close;
    qryComposicao.Params[0].Value := produto;
    qryComposicao.Open;

    qryComposicao.First;
    while not qryComposicao.eof do
    begin

      FQuantidade := qryItemQTD.AsFloat * qryComposicao.FieldByName
        ('QUANTIDADE').AsFloat;

      if Dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
      begin
        Dados.qryConsulta.close;
        Dados.qryConsulta.SQL.Clear;
        Dados.qryConsulta.SQL.Text :=
          'select qtd_atual from produto where codigo=:codigo';
        Dados.qryConsulta.Params[0].AsInteger := qryComposicaoID_PRODUTO.Value;
        Dados.qryConsulta.Open;

        if Dados.qryConsulta.FieldByName('qtd_atual').AsFloat < FQuantidade then
        begin
          result := false;
          raise Exception.Create('Estoque Insuficinete dos Itens deste KIT !');
        end;
      end;
      qryComposicao.Next;
    end;
  end;

end;

procedure TFrmPDV.ACBrBAL1LePeso(Peso: Double; Resposta: AnsiString);
var
  valid: Integer;
  vPeso: Extended;
begin

  if Peso > 0 then
  begin
    if PageControl2.ActivePage = TabPDV then
      edtQtdP.Text := FormatFloat('0.0000', Peso);
    if PageControl2.ActivePage = tabRestaurante then
      edtQtdR.Text := FormatFloat('0.0000', Peso);
    if PageControl2.ActivePage = tabDelivery then
      EdtQtdD.Text := FormatFloat('0.0000', Peso);
  end
  else
  begin
    valid := Trunc(ACBrBAL1.UltimoPesoLido);
    case valid of
      0:
        begin
          raise Exception.Create('TimeOut !' + sLineBreak +
            'Coloque o produto sobre a Balança!');
          if PageControl2.ActivePage = TabPDV then
            EdtProdutoP.SetFocus;
          if PageControl2.ActivePage = tabRestaurante then
          begin
            if PanelRestaurante.Enabled then
              edtProdutoR.SetFocus;
          end;
          if PageControl2.ActivePage = tabDelivery then
            edtProdutoD.SetFocus;
        end;
      -1:
        begin
          raise Exception.Create('Peso Instavel ! ' + sLineBreak +
            'Tente Nova Leitura');
          if PageControl2.ActivePage = TabPDV then
            EdtProdutoP.SetFocus;
          if PageControl2.ActivePage = tabRestaurante then
          begin
            if PanelRestaurante.Enabled then
              edtProdutoR.SetFocus;
          end;
          if PageControl2.ActivePage = tabDelivery then
            edtProdutoD.SetFocus;

        end;
      -2:
        begin
          raise Exception.Create('Peso Negativo !');
          if PageControl2.ActivePage = TabPDV then
            EdtProdutoP.SetFocus;
          if PageControl2.ActivePage = tabRestaurante then
          begin
            if PanelRestaurante.Enabled then
              edtProdutoR.SetFocus;
          end;

          if PageControl2.ActivePage = tabDelivery then
            edtProdutoD.SetFocus;

        end;
      -10:
        begin
          raise Exception.Create('Sobrepeso !');
          if PageControl2.ActivePage = TabPDV then
            EdtProdutoP.SetFocus;
          if PageControl2.ActivePage = tabRestaurante then
          begin
            if PanelRestaurante.Enabled then
              edtProdutoR.SetFocus;
          end;
          if PageControl2.ActivePage = tabDelivery then
            edtProdutoD.SetFocus;

        end;
    end;
  end;
end;

procedure TFrmPDV.ACBrInStore1GetPrecoUnitario(const Codigo: string;
  var PrecoUnitario: Double);
begin

 PrecoUnitario :=   StrToFloat(PrecoBalancaUn);
end;

procedure TFrmPDV.actAbrirExecute(Sender: TObject);
begin

  if not btnGaveta.Visible then
    exit;

  dmnfe.ImpressoraBobina('NFCe');
  if dmnfe.aCBrPosPrinter1.Ativo then
    dmnfe.aCBrPosPrinter1.AbrirGaveta(1);
end;

procedure TFrmPDV.actAbrirMesaExecute(Sender: TObject);
begin
  btnAbrirMesaClick(self);
end;

procedure TFrmPDV.actAtualizaMesaExecute(Sender: TObject);
begin
  btnAtualizaMesaClick(self);
end;

procedure TFrmPDV.actBuscaExecute(Sender: TObject);
begin
  if not btnBuscaPreco.Visible then
    exit;
  try
    FrmBuscaPreco := TFrmBuscaPreco.Create(Application);
    FrmBuscaPreco.ShowModal;
  finally
    FrmBuscaPreco.Release;
  end;
end;

procedure TFrmPDV.CadPessoaRapido(Codigo: Integer);
begin

  VerificaFone;

  try
    frmCadPessoaRapido := TfrmCadPessoaRapido.Create(Application);
    frmCadPessoaRapido.qryPessoas.close;
    frmCadPessoaRapido.qryPessoas.Params[0].Value := Codigo;
    frmCadPessoaRapido.qryPessoas.Open;
    if frmCadPessoaRapido.qryPessoas.IsEmpty then
    begin
      frmCadPessoaRapido.qryPessoas.Insert;
    end
    else
      frmCadPessoaRapido.qryPessoas.Edit;
    frmCadPessoaRapido.ShowModal;
  finally
    frmCadPessoaRapido.Release;
    qryCliente.close;
    qryCliente.Open;
    edtFone.SetFocus;
  end;

end;

procedure TFrmPDV.actClienteExecute(Sender: TObject);
begin
  if not btnClientes.Visible then
    exit;

  if Dados.FTIpoPDV <> 'DELIVERY' then
  begin
    try
      frmCadPessoa := TfrmCadPessoa.Create(Application);
      if Not Dados.qryPessoas.Active then
        Dados.qryPessoas.Open;
      Dados.qryPessoas.Insert;
      frmCadPessoa.ShowModal;
    finally
      frmCadPessoa.Release;
      qryCliente.close;
      qryCliente.Open;
    end;
  end
  else
  begin
    if TiraPontos(edtFone.EditText) <> '' then
    begin
      PesquisaCliente;
      if not qryBuscaFone.IsEmpty then
        CadPessoaRapido(qryBuscaFoneCODIGO.Value);
    end;
  end;

end;

procedure TFrmPDV.actDescontoExecute(Sender: TObject);
begin
  btnDescontoClick(self);
end;

procedure TFrmPDV.actImprimeItemExecute(Sender: TObject);
begin
  btnImprimeItemClick(self);
end;

procedure TFrmPDV.actImprimePedidoExecute(Sender: TObject);
begin
  btnImprimirPedidosClick(self);
end;

procedure TFrmPDV.actReceberExecute(Sender: TObject);
begin
  if not btnReceber.Visible then
    exit;
  try
    frmConsReceber := TfrmConsReceber.Create(Application);
    Dados.vLancamentoCaixa := true;
    Dados.vidLote := Dados.Lote;
    frmConsReceber.ShowModal;
  finally
    Dados.vLancamentoCaixa := false;
    frmConsReceber.Release;
  end;
end;

procedure TFrmPDV.actReimprimirExecute(Sender: TObject);
begin
  btnReimprimirClick(self);
end;

procedure TFrmPDV.actTEFExecute(Sender: TObject);
begin
  btnTefClick(self);
end;

procedure TFrmPDV.actTranfereMesaExecute(Sender: TObject);
begin
  btnTransferirMesaClick(self);
end;

function TFrmPDV.UltimaVenda: Integer;
begin
  result := 0;
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'select ultima_venda, ultimo_pedido from usuarios where codigo=:id';
  Dados.qryConsulta.Params[0].Value := Dados.idUsuario;
  Dados.qryConsulta.Open;
  if Dados.TerminalCaixa then
    result := Dados.qryConsulta.Fields[0].AsInteger
  else
    result := Dados.qryConsulta.Fields[1].AsInteger;
end;

procedure TFrmPDV.FormShow(Sender: TObject);
begin
 // ShowMessage('Entrei show');
  btnResumo.Visible := true;
  Dados.tela := 'PDV';
  PesquisaProduto := true;

  btnTef.Visible := false;
  if Dados.qryEmpresaUSA_TEF.Value = 'S' then
    btnTef.Visible := true;

  btnDesconto.Visible := false;
  if Dados.qryEmpresaDESCONTO_ITEM_PDV.Value = 'S' then
    btnDesconto.Visible := true;
  tamanho;

  DBGridBuscaP.Columns[6].Visible := false;
  if Dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value = 'S' then
    DBGridBuscaP.Columns[6].Visible := true;

  if (Dados.qryEmpresaEXIBE_RESUMO_CAIXA.Value = 'S') then
    btnResumo.Visible := true
  else
    btnResumo.Visible := false;

  ConfiguraTipodecaixa;
  PesquisaTipoTerminal;
  Retaurante_abre_mesa;

  try

    if not Dados.TerminalCaixa then
    // verifica ce o terminal é caixa
    begin
      HabilitaPreVenda;
    end
    else
    begin

      CaixaAberto := SituacaoCaixa;

      if CaixaAberto then
      begin

        Dados.idCaixa := Dados.qryConsulta.Fields[0].Value;
        Dados.Lote := Dados.qryConsulta.Fields[2].Value;
        CaixaHoje;
        habilitacampos(true);
        DescricaoSetFocus('');
      end
      else
      begin
        // não existe caixa aberto para para usuario

        btnCaixa.Caption := 'F2 Abrir Caixa                 ';
        btnCaixa.Tag := 1;
        habilitacampos(false);
      end;
    end;

    VendaExiste;

    // Close;

  finally
    MostraCaixa;
    Application.ProcessMessages;
    DescricaoSetFocus('');
    ConfiguraBalanca;
    Timer2.Enabled := true;
  end;

end;

procedure TFrmPDV.habilitacampos(campos: Boolean);
begin

  btnAvancada.Visible := campos;
  BtnSuprimento.Visible := campos;
  btnSangria.Visible := campos;
  btnImportar.Visible := campos;
  btnResumo.Visible := campos;
  btnBuscaPreco.Visible := campos;
  btnDelItem.Visible := campos;
  btnRemoveProduto.Visible := campos;
  btnCancVenda.Visible := campos;
  btnFinaliza.Visible := campos;
  btnReceber.Visible := campos;
  PanelPDV.Enabled := campos;
  pnRestaurante.Enabled := campos;
  pnDelivery.Enabled := campos;

  if Dados.FTIpoPDV = 'PDV' then
  begin
    btnImprimeItem.Visible := false;
    btnImprimirPedidos.Visible := false;
    btnTransferirMesa.Visible := false;
    btnAtualizaMesa.Visible := false;
    btnAbrirMesa.Visible := false;
    btnImportar.Visible := true;
    btnAvancada.Visible := true;
    btnRemoveProduto.Visible := true;
  end;

  if Dados.FTIpoPDV = 'DELIVERY' then
  begin
    btnImprimeItem.Visible := true;
    btnImprimirPedidos.Visible := true;
    btnAtualizaMesa.Visible := false;
    btnTransferirMesa.Visible := false;
    btnImportar.Visible := false;
    btnAvancada.Visible := false;
    btnRemoveProduto.Visible := false;
    btnAbrirMesa.Visible := false;
  end;

  if Dados.FTIpoPDV = 'RESTAURANTE' then
  begin
    btnTransferirMesa.Visible := true;
    btnImprimirPedidos.Visible := true;
    btnImprimeItem.Visible := true;
    btnAtualizaMesa.Visible := true;
    btnImportar.Visible := false;
    btnAvancada.Visible := false;
    btnRemoveProduto.Visible := false;
    btnAbrirMesa.Visible := true;
  end;
  AlinhaBotoes;

end;

procedure TFrmPDV.imgLivreDblClick(Sender: TObject);

begin
  if PageControl2.ActivePage = tabRestaurante then
  begin
    if not Dados.qryMesas.IsEmpty then
    begin
      Dados.qryMesas.Edit;
      Dados.qryMesasSITUACAO.AsString := 'O';
      Dados.qryMesas.Post;
    end;
  end;

  VendaExiste;

  Restaurante_Status_Mesa;

  if PanelRestaurante.Enabled then
    edtProdutoR.SetFocus;

end;

procedure TFrmPDV.imgLogoDblClick(Sender: TObject);
begin

  if Dados.qryParametroBLOQUEAR_PERSONALIZACAO.Value = 'S' then
    exit;

  OpenPicture.Execute;
  if trim(OpenPicture.FileName) <> '' then
  begin

    Dados.qryParametro.Edit;
    Dados.qryParametro.FieldByName('TELA_FUNDO_ECF').AsString :=
      OpenPicture.FileName;
    Dados.qryParametro.Post;
    Dados.Conexao.CommitRetaining;
    CarregaImagem;
  end;
end;

end.
