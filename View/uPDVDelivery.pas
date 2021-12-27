unit uPDVDelivery;

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
  FireDAC.Stan.Def, FireDAC.Stan.Pool, Vcl.DBCtrls, Vcl.Mask,
  System.Actions,
  Vcl.ActnList, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Tabs,
  ACBrPosPrinter, ACBrBase, ACBrDFe, ACBrNFe, Vcl.Menus, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, DBCtrlsEh, DBLookupEh,
  ACBrBAL;

type
  TFrmDelivery = class(TForm)
    ActionList1: TActionList;
    actLerPeso: TAction;
    dsPesqProd: TDataSource;
    qryPesqProd: TFDQuery;
    qryPesqProdCODIGO: TIntegerField;
    qryPesqProdDESCRICAO: TStringField;
    qryPesqProdCFOP: TStringField;
    qryPesqProdCODBARRA: TStringField;
    qryPesqProdREFERENCIA: TStringField;
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
    qryPesqProdUNIDADE: TStringField;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryItemDESCRICAO_SL: TStringField;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_VENDEDOR: TStringField;
    qryItemTTOTAL: TAggregateField;
    qryPesqProdNCM: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryFechamento: TFDQuery;
    qryFechamentoCODIGO: TIntegerField;
    qryFechamentoDATA: TDateField;
    qryFechamentoHORA: TTimeField;
    qryFechamentoFK_USUARIO: TIntegerField;
    qryFechamentoFKEMPRESA: TIntegerField;
    qryPesqProdEFISCAL: TStringField;
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
    qryPesqProdLOCALIZACAO: TStringField;
    qryPesqProdFIM_PROMOCAO: TDateField;
    qryPesqProdINICIO_PROMOCAO: TDateField;
    qryPesqProdVIRTUAL_PRECO: TFloatField;
    qryPesqProdPRECO_VARIAVEL: TStringField;
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
    qryVendaComp: TFDQuery;
    qryVendaCompCODIGO: TIntegerField;
    qryVendaCompFK_VENDA_DETALHE: TIntegerField;
    qryVendaCompID_PRODUTO: TIntegerField;
    qryConta_MovimentoHISTORICO: TStringField;
    qryPesqProdSERVICO: TStringField;
    qryVendaVIRTUAL_CNPJ: TStringField;
    qryBuscaVendaCODIGO: TIntegerField;
    qryPesqProdPR_VENDA: TFMTBCDField;
    qryPesqProdPRECO_ATACADO: TFMTBCDField;
    qryPesqProdQTD_ATACADO: TFMTBCDField;
    qryPesqProdQTD_ATUAL: TFMTBCDField;
    qryPesqProdE_MEDIO: TFMTBCDField;
    qryPesqProdPRECO_PROMO_VAREJO: TFMTBCDField;
    qryPesqProdPRECO_PROMO_ATACADO: TFMTBCDField;
    qryPesqProdDESCONTO: TCurrencyField;
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
    qryVendaCompQTD: TFMTBCDField;
    qryVendaCompQTD_DEVOLVIDA: TFMTBCDField;
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
    qryPesqProdREMEDIO: TStringField;
    qryPesqProdGRADE: TStringField;
    qryGrade: TFDQuery;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    dsGrade: TDataSource;
    qryGradeCODIGO: TIntegerField;
    qryPesqProdPREFIXO_BALANCA: TStringField;
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
    Panel1: TPanel;
    DBGrid1: TDBGridEh;
    Panel9: TPanel;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    Panel10: TPanel;
    GrpPreco: TGroupBox;
    edtPreco: TEdit;
    GrpQtd: TGroupBox;
    edtQtd: TEdit;
    grpTotal: TGroupBox;
    lblTotal: TLabel;
    DBGrid2: TDBGridEh;
    Panel2: TPanel;
    imgLogo: TImage;
    Panel7: TPanel;
    btnSangria: TSpeedButton;
    BtnSuprimento: TSpeedButton;
    btnAvancada: TSpeedButton;
    btnVendedor: TSpeedButton;
    btnCancVenda: TSpeedButton;
    btnResumo: TSpeedButton;
    btnFinaliza: TSpeedButton;
    btnCaixa: TSpeedButton;
    Panel8: TPanel;
    lblDataHora: TLabel;
    lblCaixa: TLabel;
    Label19: TLabel;
    lblOperador: TLabel;
    Label3: TLabel;
    lblEntregador: TLabel;
    qryPesqConta: TFDQuery;
    qryPesqContaCODIGO: TIntegerField;
    qryPesqContaDESCRICAO: TStringField;
    qryPesqContaTIPO: TStringField;
    qryPesqContaDATA_ABERTURA: TDateField;
    qryPesqContaID_USUARIO: TIntegerField;
    qryPesqContaEMPRESA: TIntegerField;
    qryPesqContaLOTE: TIntegerField;
    qryPesqContaSITUACAO: TStringField;
    btnDelItem: TSpeedButton;
    Panel3: TPanel;
    grpCliente: TGroupBox;
    edtCliente: TEdit;
    grpTelefone: TGroupBox;
    grpSelecao: TGroupBox;
    edtProduto: TEdit;
    btnEntregador: TSpeedButton;
    btnCadCliente: TSpeedButton;
    pnEndereco: TPanel;
    qryVendaFK_ENTREGADOR: TIntegerField;
    qryEntregador: TFDQuery;
    dsEntregador: TDataSource;
    qryEntregadorCODIGO: TIntegerField;
    qryEntregadorNOME: TStringField;
    qryVendaVIRTUAL_ENTREGADOR: TStringField;
    edtFone: TMaskEdit;
    qryBuscaFone: TFDQuery;
    dsBuscaCliente: TDataSource;
    qryBuscaFoneCODIGO: TIntegerField;
    qryBuscaFoneFANTASIA: TStringField;
    qryBuscaFoneENDERECO: TStringField;
    qryBuscaFoneNUMERO: TStringField;
    qryBuscaFoneBAIRRO: TStringField;
    qryBuscaFoneMUNICIPIO: TStringField;
    qryBuscaFoneUF: TStringField;
    qryBuscaFoneCEP: TStringField;
    qryBuscaFoneCOMPLEMENTO: TStringField;
    DBGrid3: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure btnCancVendaClick(Sender: TObject);
    procedure btnFinalizaClick(Sender: TObject);
    procedure qryVendaDESCONTOValidate(Sender: TField);
    procedure qryVendaAfterOpen(DataSet: TDataSet);
    procedure qryItemBeforeOpen(DataSet: TDataSet);
    procedure qryVendaBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure btnResumoClick(Sender: TObject);
    procedure edtQtdEnter(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure qryVendaBeforePost(DataSet: TDataSet);
    procedure btnSangriaClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure qryConta_MovimentoBeforePost(DataSet: TDataSet);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdExit(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure qryPesqProdCalcFields(DataSet: TDataSet);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure qryItemBeforePost(DataSet: TDataSet);
    procedure qryItemAfterDelete(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure qryVendaCompAfterPost(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnSuprimentoClick(Sender: TObject);
    procedure btnAvancadaClick(Sender: TObject);
    procedure qryItemQTDValidate(Sender: TField);
    procedure qryItemVALOR_ITEMValidate(Sender: TField);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure btnComandaClick(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure btnEntregadorClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtFoneChange(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtFoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtFoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoChange(Sender: TObject);
    procedure edtFoneExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    vSql: string;
    ehCaixaRapido: string;
    PesquisaProduto: Boolean;
    procedure BuscaPreco;
    procedure ItemDesconhecido;
    procedure InsereItem;
    function GerouNFCe(operacao: string): string;
    function ValidaItem: Boolean;
    procedure PrecoVariavel;
    procedure tamanho;
    function UltimaVenda: Integer;
    procedure atualizacomposicao(tipo: string; qtd_atual: real;
      produto: Integer);
    procedure InsereComposicao(produto: Integer);
    function EhNumero(S: string): Boolean;
    procedure PesquisaCodBarra;
    procedure PesquisaDescricao;
    procedure atualizagrade(tipo: string; qtd_atual: real; produto: Integer);
    procedure FecharCaixa;
    procedure AbreCaixa;
    procedure AtualizaVendedor;
    procedure AtualziaPrecoGrade;
    procedure ChamaGrade;
    procedure PesquisaCodBarraBalanca(vPesquisa: string);
    procedure PesquisaCodBarraGeral(vPesquisa: string);
    procedure AtualizaEntregador;
    procedure PesquisaCliente;
    procedure LimpaValores;
    procedure FinalizaVenda;

    { Private declarations }
  public
    CodigoGrade: Integer;
    PodeAtualizarEstoque: Boolean;
    procedure habilitacampos(campos: Boolean);
    procedure inserevenda;
    procedure BuscaVenda;
    procedure FecharPrevenda;
    procedure MostraCaixa;
    { Public declarations }
  end;

var
  FrmDelivery: TFrmDelivery;

implementation

{$R *.dfm}

uses Udados, uAbreCaixa, uSuprimento_Sangria,
  uFormaPagamento, uImportar, uResumoCaixa, uSupervisor, uCadProduto,
  uBuscaPreco, uConsReceber, uPesquisaPrincipio, uSplash, uAcesso,
  uConsVendedor, uGrade, uCadPessoa, uConsEntregador;

procedure TFrmDelivery.tamanho;
begin
  DBGrid2.Left := DBGrid1.Left;
  DBGrid2.Width := DBGrid1.Width;
  DBGrid2.Top := DBGrid1.Top;

  DBGrid1.Columns[0].Width := round(Screen.Width * 0.04);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.35);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.04);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.07);

  DBGrid2.Columns[0].Width := round(Screen.Width * 0.04);
  DBGrid2.Columns[1].Width := round(Screen.Width * 0.35);
  DBGrid2.Columns[2].Width := round(Screen.Width * 0.08);
  DBGrid2.Columns[3].Width := round(Screen.Width * 0.05);
  DBGrid2.Columns[4].Width := round(Screen.Width * 0.03);
  DBGrid2.Columns[5].Width := round(Screen.Width * 0.10);

  GrpQtd.Width := round(Panel10.Width * 0.25);
  GrpPreco.Width := round(Panel10.Width * 0.35);
  grpTotal.Width := round(Panel10.Width * 0.40);

end;

procedure TFrmDelivery.Timer1Timer(Sender: TObject);
begin
  lblDataHora.Caption := DateTimeToStr(now);
end;

function TiraPontos(Str: string): string;
var
  i, Count: Integer;
begin
  SetLength(Result, Length(Str));
  Count := 0;
  for i := 1 to Length(Str) do
  begin
    if not CharInSet(Str[i], ['/', ',', '-', '.', ')', '(', ' ']) then
    begin
      inc(Count);
      Result[Count] := Str[i];
    end;
  end;
  SetLength(Result, Count);
end;

procedure TFrmDelivery.BtnSuprimentoClick(Sender: TObject);
begin

  if not BtnSuprimento.Visible then
    exit;

  if dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
  Begin
    dados.vAutorizar := true;
    if not dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if not dados.vAutorizar then
    begin
      exit;
    end;
  end;

  try
    FrmSuprimento_Sangria := TFrmSuprimento_Sangria.Create(application);
    FrmSuprimento_Sangria.vTipo := '2';
    FrmSuprimento_Sangria.ShowModal;
  finally

    FrmSuprimento_Sangria.Release;
  end;
end;

procedure TFrmDelivery.btnVendedorClick(Sender: TObject);
begin
  try
    frmconsVendedor := TfrmconsVendedor.Create(application);
    frmconsVendedor.idVendedor := qryVendaFK_VENDEDOR.Value;
    frmconsVendedor.vNome := qryVendaVIRTUAL_VENDEDOR.Value;
    frmconsVendedor.ShowModal;
  finally
    AtualizaVendedor;
    frmconsVendedor.Release;
  end;
end;

procedure TFrmDelivery.BuscaPreco;
var
  vQtd, vPreco, vTotal: real;
  sTotal: string;
begin
  if copy(edtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
  begin
    if Pos('*', edtProduto.Text) = 0 then
    begin
      case dados.qryConfigMODELO_BALANCA.Value of
        3:
          begin

            sTotal := copy(edtProduto.Text, 8, 5);
            vTotal := StrToFloatDef(sTotal, 0);
            vTotal := dados.truncar((vTotal / 100), 2);
            vQtd := 1;

            edtPreco.Text := FormatFloat('0.00',
              qryPesqProdVIRTUAL_PRECO.AsFloat);

            if qryPesqProdVIRTUAL_PRECO.Value > 0 then
              vQtd := vTotal / qryPesqProdVIRTUAL_PRECO.AsFloat;

            lblTotal.Caption := FloatToStr(vTotal);

            edtQtd.Text := FloatToStr(SimpleRoundTo(vQtd, -3));

          end;
        1, 2, 4:
          begin

            sTotal := copy(edtProduto.Text, 8, 5);
            vQtd := (StrToFloatDef(sTotal, 1));
            vQtd := dados.truncar((vQtd / 1000), 3);

            edtPreco.Text := FormatFloat('0.00',
              qryPesqProdVIRTUAL_PRECO.AsFloat);

            vTotal := vQtd * qryPesqProdVIRTUAL_PRECO.AsFloat;
            vTotal := dados.truncar(vTotal, 2);

            lblTotal.Caption := FormatFloat('0.00', vTotal);
            edtQtd.Text := FormatFloat('0.000', vQtd);

          end;
      end;
    end
    else
    begin
      try
        vQtd := StrToFloatDef
          ((copy(edtProduto.Text, 1, Pos('*', edtProduto.Text) - 1)), 1);
        edtQtd.Text := copy(edtProduto.Text, 1, Pos('*', edtProduto.Text) - 1);
        edtPreco.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        lblTotal.Caption := FormatFloat('0.00',
          qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);

        if qryPesqProdGRADE.Value = 'S' then
        begin
          if qryGradePRECO.AsFloat > 0 then
          begin
            edtPreco.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
            lblTotal.Caption := FormatFloat('0.00',
              qryGradePRECO.AsFloat * vQtd);
          end;
        end;

      except
        raise Exception.Create('Não foi possível Selecionar Produto!');
      end;
    end;
  end
  else
  begin
    if Pos('*', edtProduto.Text) > 1 then
    begin
      try
        vQtd := StrToFloatDef
          ((copy(edtProduto.Text, 1, Pos('*', edtProduto.Text) - 1)), 1);
        edtQtd.Text := copy(edtProduto.Text, 1, Pos('*', edtProduto.Text) - 1);
        edtPreco.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        lblTotal.Caption := FormatFloat('0.00',
          qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
      except
        raise Exception.Create('Não foi possível Selecionar Produto!');
      end;
    end
    else
    begin
      vQtd := StrToFloatDef(edtQtd.Text, 1);
      edtPreco.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
      lblTotal.Caption := FormatFloat('0.00',
        qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);

    end;
  end;
end;

procedure TFrmDelivery.DBEdit1Exit(Sender: TObject);
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  if qryVendaACRESCIMO.AsFloat = 0 then
  begin
    qryVendaDESCONTO.AsFloat :=
      dados.truncar((qryVendaSUBTOTAL.AsFloat * qryVendaPERCENTUAL.AsFloat
      / 100), 2);
  end
  else
  begin
    qryVendaDESCONTO.AsFloat := 0;
    qryVendaPERCENTUAL.AsFloat := 0;
  end;
end;

procedure TFrmDelivery.DBEdit5Exit(Sender: TObject);
begin

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;

  if qryVendaACRESCIMO.AsFloat = 0 then
  begin
    if qryVendaSUBTOTAL.Value > 0 then
      qryVendaPERCENTUAL.Value :=
        dados.truncar(100 - ((qryVendaTOTAL.AsFloat * 100) /
        qryVendaSUBTOTAL.AsFloat), 2);
  end
  else
    qryVendaPERCENTUAL.Value := 0;
end;

procedure TFrmDelivery.DBGrid1DblClick(Sender: TObject);
begin
  if not dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if not qryItem.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value := qryItemID_PRODUTO.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
      qryPesqProd.Close;
      qryPesqProd.Open;
    end;

  end;
end;

procedure TFrmDelivery.DBGrid2DblClick(Sender: TObject);
begin
  try
    PesquisaProduto := false;
    edtProduto.Text := qryPesqProdDESCRICAO.Value;

    edtProduto.SetFocus;
  finally
    PesquisaProduto := true;
  end;
  // DBGrid2.Visible := false;
end;

procedure TFrmDelivery.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid2DblClick(Sender);

end;

procedure TFrmDelivery.DBGrid3DblClick(Sender: TObject);
begin
  edtCliente.Text := qryBuscaFoneFANTASIA.Value;
  edtCliente.SetFocus;
  DBGrid3.Visible := false;
end;

procedure TFrmDelivery.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtCliente.Text := qryBuscaFoneFANTASIA.Value;
  edtCliente.SetFocus;
end;

procedure TFrmDelivery.DBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid3DblClick(Sender);
end;

procedure TFrmDelivery.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := qryVendaFKEMPRESA.AsInteger;
  dados.qryConfig.Open;

  qryTabela.Close;
  qryTabela.Params[0].Value := qryVendaFKEMPRESA.Value;
  qryTabela.Open;

end;

procedure TFrmDelivery.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edtQtd.SetFocus;
  end;
end;

procedure TFrmDelivery.edtPrecoExit(Sender: TObject);
var
  Total: real;
begin
  Total := StrToFloatDef(edtQtd.Text, 1) * StrToFloatDef(edtPreco.Text, 0);
  if copy(edtProduto.Text, 1, 1) <> dados.qryConfigPREFIXO_BALANCA.Value then
    lblTotal.Caption := FormatFloat('0.00', Total);
  edtProduto.SetFocus;
  InsereItem;
end;

procedure TFrmDelivery.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    qryPesqProd.Refresh;
    if Panel1.Enabled then
      edtProduto.SetFocus;
  end;
end;

procedure TFrmDelivery.edtProdutoChange(Sender: TObject);
var
  vQtd, vpreco1, vpreco2: real;

begin

  if not PesquisaProduto then
    exit;

  if edtProduto.ReadOnly then
    exit;

  if trim(edtProduto.Text) <> '' then
    DBGrid2.Visible := true
  else
    DBGrid2.Visible := false;

  if dados.qryEmpresaCHECA_ESTOQUE_FISCAL.Value = 'N' then
  begin
    vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
      ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
      ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' +
      ' PRO.UNIDADE, PRO.EFISCAL,PRO.E_MEDIO, PRO.LOCALIZACAO,' +
      ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO, PRO.PRECO_VARIAVEL, PRO.DESCONTO,'
      + ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.PREFIXO_BALANCA'
      + ' FROM PRODUTO PRO' +
      ' WHERE (PRO.EMPRESA=:EMP) and (PRO.QTD_ATUAL>0) /*where*/';
  end
  else
  begin
    vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
      ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
      ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' +
      ' PRO.UNIDADE, PRO.EFISCAL,PRO.E_MEDIO, PRO.LOCALIZACAO,' +
      ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO, PRO.PRECO_VARIAVEL, PRO.DESCONTO,'
      + ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.PREFIXO_BALANCA '
      + ' FROM PRODUTO PRO' + ' WHERE (PRO.EMPRESA=:EMP) /*where*/';
  end;

  if copy(grpSelecao.Caption, 1, 2) = 'F1' then
  begin
    if (trim(edtProduto.Text) <> '') then
    begin
      PesquisaDescricao;
    end;
  end;

  if Panel1.Enabled then
    edtProduto.SetFocus;

  application.ProcessMessages;
end;

procedure TFrmDelivery.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if copy(grpSelecao.Caption, 1, 2) = 'F1' then
  begin
    if DBGrid2.Visible then
    begin
      if Key = VK_UP then
      begin
        qryPesqProd.Prior;
        BuscaPreco;
        edtProduto.SetFocus;
      end;
      if Key = VK_DOWN then
      begin
        qryPesqProd.Next;
        BuscaPreco;
        edtProduto.SetFocus;
      end;
    end
    else
    begin
      if Key = VK_UP then
      begin
        qryItem.Prior;
        edtProduto.SetFocus;

      end;
      if Key = VK_DOWN then
      begin
        qryItem.Next;
        edtProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmDelivery.LimpaValores;
begin
  edtProduto.Clear;
  edtQtd.Text := '1';
  edtPreco.Text := '0,00';
  lblTotal.Caption := '0,00';

end;

procedure TFrmDelivery.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  // produtos

  if edtProduto.ReadOnly then
    exit;

  if (Key in [#13]) then
  begin

    if copy(grpSelecao.Caption, 1, 2) = 'F1' then
      PesquisaCodBarra;

    DBGrid2.Visible := false;

    if edtProduto.Text <> '' then
    begin
      if ehCaixaRapido <> 'S' then
      begin
        try
          PesquisaProduto := false;
          edtProduto.Text := qryPesqProdDESCRICAO.Value;
        finally
          PesquisaProduto := true;
        end;

      end;
    end;

    if (trim(edtProduto.Text) = '') then
    begin
      LimpaValores;
      btnFinaliza.Click;
    end;

    if ehCaixaRapido = 'S' then
    begin
      if copy(edtProduto.Text, 1, 1) = '*' then
      begin
        if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
          Key := #0;
        if trim(copy(edtProduto.Text, 2, Length(edtProduto.Text))) <> '' then
          edtQtd.Text := copy(edtProduto.Text, 2, Length(edtProduto.Text));
        edtProduto.Clear;
        edtProduto.SetFocus;
      end
      else
      begin
        if ActiveControl = edtProduto then
          edtProduto.SetFocus;

        ItemDesconhecido;
        InsereItem
      end;
    end
    else if trim(edtProduto.Text) <> '' then
    begin
      edtQtd.SetFocus;
    end
    else
      edtProduto.SetFocus;
  end;

  if ehCaixaRapido = 'S' then
  begin
    qryPesqProd.Refresh;
    edtProduto.SetFocus;
  end;
end;

procedure TFrmDelivery.inserevenda;
var
  codigo1, codigo2: Integer;
begin
  edtQtd.Text := '1';
  edtPreco.Text := '0,00';
  lblTotal.Caption := '0,00';
  edtFone.Clear;
  edtCliente.Clear;

  codigo1 := dados.Numerador('VENDAS_MASTER', 'CODIGO', 'N', '', '');

  qryVenda.Close;
  qryVenda.Params[0].Value := codigo1;
  qryVenda.Open;

  qryVenda.Insert;

  if dados.TerminalCaixa then
    qryVendaTIPO.Value := 'V'
  else
    qryVendaTIPO.Value := 'P';

  qryVendaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryVendaFK_USUARIO.Value := dados.IdUsuario;
  qryVendaID_CLIENTE.Value := dados.qryConfigCLIENTE_PADRAO.Value;
  qryVendaFK_VENDEDOR.Value := dados.qryConfigVENDEDOR_PADRAO.Value;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    ' select FK_VENDEDOR from USUARIOS where codigo=:id';
  dados.qryConsulta.Params[0].Value := dados.IdUsuario;
  dados.qryConsulta.Open;

  if not dados.qryConsulta.FieldByName('FK_VENDEDOR').IsNull then
    qryVendaFK_VENDEDOR.Value := dados.qryConsulta.FieldByName
      ('FK_VENDEDOR').Value;;

  qryVendaFK_TABELA.Value := 1;

  qryVendaCPF_NOTA.Value := '';

  qryVendaFK_CAIXA.Value := dados.idCaixa;
  qryVendaLOTE.Value := dados.Lote;

  qryVendaDATA_EMISSAO.Value := date;
  qryVendaDATA_SAIDA.Value := date;
  qryVendaSUBTOTAL.Value := 0;
  qryVendaTIPO_DESCONTO.Value := 'D';
  qryVendaDESCONTO.Value := 0;
  qryVendaPERCENTUAL.Value := 0;
  qryVendaACRESCIMO.Value := 0;
  qryVendaDESCONTO.Value := 0;
  qryVendaTOTAL.Value := 0;
  qryVendaTROCO.Value := 0;
  qryVendaDINHEIRO.Value := 0;
  qryVendaSITUACAO.Value := 'X';
  codigo2 := dados.Numerador('VENDAS_MASTER', 'CODIGO', 'N', '', '');

  qryVendaCODIGO.AsFloat := codigo2;

  qryVenda.Post;
  dados.Conexao.CommitRetaining;
  if codigo1 <> codigo2 then
  begin
    qryVenda.Close;
    qryVenda.Params[0].Value := codigo2;
    qryVenda.Open;
  end;
end;

function TFrmDelivery.GerouNFCe(operacao: string): String;
begin
  Result := '';
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select NUMERO, SITUACAO from nfce_master where fk_venda=:venda';
  dados.qryConsulta.Params[0].Value := qryVendaCODIGO.Value;
  dados.qryConsulta.Open;

  if operacao = 'CANCELA VENDA' then
  begin
    if (dados.qryConsulta.FieldByName('SITUACAO').Value = 'C') or
      (dados.qryConsulta.FieldByName('SITUACAO').IsNull) then
      // faz nada
    else

      Result := 'Existe NFC-e emitida para esta venda!';

    if operacao = 'EXCLUIR ITEM' then
    begin
      if (dados.qryConsulta.FieldByName('SITUACAO').Value = 'C') or
        (dados.qryConsulta.FieldByName('SITUACAO').Value = 'O') then
        // faz nada
      else
      begin
        Result := 'Existe NFC-e emitida para esta venda!';
      end;
    end;

  end;

end;

procedure TFrmDelivery.BuscaVenda;
begin
  if dados.TerminalCaixa then
  begin
    qryBuscaVenda.Close;
    qryBuscaVenda.Params[0].Value := dados.IdUsuario;
    qryBuscaVenda.Params[1].Value := 'V';
    qryBuscaVenda.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryBuscaVenda.Open;
  end
  else
  begin
    qryBuscaVenda.Close;
    qryBuscaVenda.Params[0].Value := dados.IdUsuario;
    qryBuscaVenda.Params[1].Value := 'P';
    qryBuscaVenda.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryBuscaVenda.Open;
  end;

end;

procedure TFrmDelivery.FecharPrevenda;
begin

  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaSITUACAO.Value := 'G';
  qryVenda.Post;

  dados.Conexao.CommitRetaining;
  qryVenda.Edit;
  qryVendaDATA_EMISSAO.Value := now;
  qryVendaDATA_SAIDA.Value := now;
  qryVendaFK_CAIXA.Value := dados.idCaixa;
  qryVendaLOTE.Value := dados.Lote;
  qryVenda.Post;
end;

procedure TFrmDelivery.MostraCaixa;
begin
  qryPesqConta.Close;
  qryPesqConta.Params[0].Value := dados.IdUsuario;
  qryPesqConta.Open;

  if not qryPesqConta.IsEmpty then
  begin
    Caption := ' Delivery | ' + qryPesqContaDESCRICAO.Value + ' | Op.:' +
      dados.vUsuario;
    lblCaixa.Caption := qryPesqContaDESCRICAO.Value;
    lblOperador.Caption := dados.vUsuario;
    lblEntregador.Caption := qryVendaVIRTUAL_ENTREGADOR.Value;
    dados.vConta := qryPesqContaDESCRICAO.Value;
  end
  else
  begin
    Caption := ' ';
    lblCaixa.Caption := '';
    lblOperador.Caption := '';
    lblEntregador.Caption := '';
    lblDataHora.Caption := '';
    dados.vConta := '';
  end;
end;

procedure TFrmDelivery.PesquisaCliente;
begin
  if edtFone.Text <> '' then
  begin
    qryBuscaFone.Close;
    qryBuscaFone.ParamByName('fone').Value := '%' + edtFone.Text + '%';
    qryBuscaFone.Open;
    edtCliente.Text := qryBuscaFoneFANTASIA.Value;
    pnEndereco.Caption := qryBuscaFoneENDERECO.Value + ',' +
      qryBuscaFoneNUMERO.Value + ' | ' + qryBuscaFoneBAIRRO.Value + ' | ' +
      qryBuscaFoneCEP.Value;
  end;
end;

procedure TFrmDelivery.PesquisaCodBarraGeral(vPesquisa: string);
begin
  qryPesqProd.Close;
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
    ' AND (PRO.ATIVO=''S'')  AND ((PRO.CODBARRA = ' + QuotedStr(vPesquisa) +
    ') OR (PRO.REFERENCIA = ' + QuotedStr(vPesquisa) + '))' +
    ' order by PRO.CODBARRA', []);
  qryPesqProd.Params[0].Value := qryVendaFKEMPRESA.Value;
  qryPesqProd.Open;
end;

procedure TFrmDelivery.PesquisaCodBarraBalanca(vPesquisa: string);
begin
  qryPesqProd.Close;
  qryPesqProd.SQL.Text := vSql;
  qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
    ' AND (PRO.ATIVO=''S'')  AND (PRO.PREFIXO_BALANCA LIKE ' +
    QuotedStr(copy(vPesquisa, 1, 7) + '%') + ')' +
    ' order by PRO.PREFIXO_BALANCA', []);
  qryPesqProd.Params[0].Value := qryVendaFKEMPRESA.Value;
  qryPesqProd.Open;
end;

procedure TFrmDelivery.ChamaGrade;
begin
  if qryPesqProdGRADE.Value = 'S' then
  begin
    try
      frmGrade := TFrmGrade.Create(application);
      frmGrade.qryGrade.Close;
      frmGrade.qryGrade.Params[0].Value := qryPesqProdCODIGO.Value;
      frmGrade.qryGrade.Open;
      frmGrade.ShowModal;
    finally
      AtualziaPrecoGrade;
      frmGrade.Release;
    end;
  end;
end;

procedure TFrmDelivery.AtualizaVendedor;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaFK_VENDEDOR.Value := frmconsVendedor.idVendedor;
  qryVenda.Post;
end;

procedure TFrmDelivery.AtualizaEntregador;
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaFK_ENTREGADOR.Value := FrmConsEntregador.idEntregador;
  qryVenda.Post;
end;

procedure TFrmDelivery.AtualziaPrecoGrade;
var
  vQtd: real;

begin
  qryGrade.Close;
  qryGrade.Params[0].Value := frmGrade.idGrade;
  qryGrade.Open;
  if qryGradePRECO.AsFloat > 0 then
  begin
    vQtd := StrToFloatDef(edtQtd.Text, 1);
    edtPreco.Text := FormatFloat('0.00', qryGradePRECO.AsFloat);
    lblTotal.Caption := FormatFloat('0.00', qryGradePRECO.AsFloat * vQtd);
  end;
end;

procedure TFrmDelivery.AbreCaixa;
begin
  Try
    application.CreateForm(TfrmAbreCaixa, frmAbreCaixa);
    dados.Tela := 'Delivery';
    frmAbreCaixa.iTipo := 1;
    frmAbreCaixa.ShowModal;
  Finally
    frmAbreCaixa.Release;
  End;
end;

procedure TFrmDelivery.btnCadClienteClick(Sender: TObject);
begin
  try
    frmCadPessoa := TfrmCadPessoa.Create(application);
    if Not dados.qryPessoas.Active then
      dados.qryPessoas.Open;
    dados.qryPessoas.Insert;
    frmCadPessoa.ShowModal;
  finally
    frmCadPessoa.Release;

    qryCliente.Close;
    qryCliente.Open;

    qryBuscaFone.Close;
    qryBuscaFone.Open;

  end;
end;

procedure TFrmDelivery.btnCaixaClick(Sender: TObject);
begin

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

procedure TFrmDelivery.btnCancVendaClick(Sender: TObject);
var
  vMensagem: String;
begin
  vMensagem := 'Deseja Cancelar Pedido?' + sLineBreak +
    GerouNFCe('CANCELA PEDIDO');
  if application.messageBox(pwidechar(vMensagem), 'Confirmação', mb_YesNo) = mrYes
  then
  begin

    if dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
    Begin
      dados.vAutorizar := true;
      if not dados.eSupervisor then
      begin

        try
          frmSupervisor := TFrmSupervisor.Create(application);
          dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end;

      if not dados.vAutorizar then
      begin
        exit;
      end;
    end;

    try
      dados.EstornaFinanceiro(qryVendaCODIGO.Value);
      qryVenda.Edit;
      qryVendaSITUACAO.Value := 'C'; // CANCELADA
      qryVenda.Post;

      qryItem.DisableControls;
      qryItem.First;
      while not qryItem.eof do
      begin
        dados.AtualizaEstoque(qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
        qryItem.Next;
      end;

      BuscaVenda;
      if qryBuscaVendaCODIGO.IsNull then
        inserevenda
      else
      begin

        qryVenda.Close;
        qryVenda.Params[0].Value := qryBuscaVendaCODIGO.Value;
        qryVenda.Open;

        qryVenda.Edit;
        qryVendaDATA_EMISSAO.Value := now;
        qryVendaDATA_SAIDA.Value := now;
        qryVendaFK_CAIXA.Value := dados.idCaixa;
        qryVendaLOTE.Value := dados.Lote;
      end;
      if Panel1.Enabled then
        edtFone.SetFocus;
    finally
      qryItem.EnableControls;
    end;
  end;
end;

procedure TFrmDelivery.btnComandaClick(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(application.ExeName) + 'Cheff.exe';
  if FileExists(caminho) then
    ShellExecute(0, 'open', PChar(caminho), '', '', SW_SHOWNORMAL);
end;

procedure TFrmDelivery.btnDelItemClick(Sender: TObject);
var
  vMensagem: string;
begin
  try
    if btnDelItem.Enabled = false then
      exit;

    vMensagem := 'Deseja Excluir Item?' + sLineBreak +
      GerouNFCe('EXCLUIR ITEM');

    if not qryItem.IsEmpty then
    begin
      if application.messageBox(pwidechar(vMensagem), 'Confirmação', mb_YesNo) = mrYes
      then
      begin

        if dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
        Begin
          if not dados.eSupervisor then
          begin

            try
              frmSupervisor := TFrmSupervisor.Create(application);
              dados.vAutorizar := false;
              frmSupervisor.ShowModal;
            finally
              frmSupervisor.Release;
            end;
            if not dados.vAutorizar then
            begin
              exit;
            end;
          end;
        end;

        qryItem.delete;

        qrySoma.Close;
        qrySoma.Params[0].Value := qryVendaCODIGO.Value;
        qrySoma.Open;

        qryVenda.Edit;
        qryVendaSUBTOTAL.Value := qrySomaTOTAL.Value;
        qryVendaDESCONTO.Value := 0;
        qryVendaSUBTOTAL.Value := qryVendaSUBTOTAL.Value;
        qryVenda.Post;

        dados.Conexao.CommitRetaining;
      end;
    end;
  finally
    if Panel1.Enabled then
      edtFone.SetFocus;
  end;
end;

procedure TFrmDelivery.btnEntregadorClick(Sender: TObject);
begin
  try
    FrmConsEntregador := TfrmconsEntregador.Create(application);
    FrmConsEntregador.idEntregador := qryVendaFK_ENTREGADOR.Value;
    FrmConsEntregador.vNome := qryVendaVIRTUAL_ENTREGADOR.Value;
    FrmConsEntregador.ShowModal;
  finally
    AtualizaEntregador;
    lblEntregador.Caption := FrmConsEntregador.vNome;
    FrmConsEntregador.Release;
  end;
end;

procedure TFrmDelivery.FecharCaixa;
var
  Data: Tdate;
  Hora: TTime;
  idLote: Integer;
begin

  if application.messageBox('Tem certeza de que deseja Fechar Caixa?',
    'Confirmação', mb_YesNo) = mrno then
    exit;

  dados.vPodeFecharCaixa := false;

  if dados.qryEmpresaEXIBE_RESUMO_CAIXA.Value = 'S' then
  begin
    try
      frmResumoCaixa := TfrmResumoCaixa.Create(application);
      frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + dados.vUsuario;
      frmResumoCaixa.btnImprimir.Visible := true;
      frmResumoCaixa.ShowModal;
    finally
      frmResumoCaixa.Release;
    end;
  end
  else
    dados.vPodeFecharCaixa := true;

  if dados.vPodeFecharCaixa then
  begin

    dados.EstornaFinanceiro(qryVendaCODIGO.Value);

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'UPDATE CONTAS SET ID_USUARIO=NULL, DATA_ABERTURA=NULL, SITUACAO=''F'', LOTE=0 WHERE CODIGO=:COD';
    dados.qryExecute.Params[0].Value := dados.idCaixa;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'delete from CONTAS_MOVIMENTO WHERE fkvenda=:COD';
    dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;

    Close;
  end;

end;

procedure TFrmDelivery.FinalizaVenda;
begin
  dados.vEnviarSefa := 'N';

  BuscaVenda;

  if qryBuscaVendaCODIGO.IsNull then
    inserevenda
  else
  begin
    qryVenda.Close;
    qryVenda.Params[0].Value := qryBuscaVendaCODIGO.Value;
    qryVenda.Open;

    qryVenda.Edit;
    qryVendaDATA_EMISSAO.Value := now;
    qryVendaDATA_SAIDA.Value := now;
    if dados.TerminalCaixa then
      qryVendaSITUACAO.Value := 'F';
    qryVendaFK_CAIXA.Value := dados.idCaixa;
    qryVendaLOTE.Value := dados.Lote;
    qryVenda.Post;
  end;
  qryVenda.Filtered := false;

end;

procedure TFrmDelivery.btnFinalizaClick(Sender: TObject);
var
  cont: Integer;
begin
  if dados.qryConfigCLIENTE_PADRAO.IsNull then
  begin
    ShowMessage
      ('Vá em configurações e informe o código do cliente Consumidor Final!');
    exit;
  end;

  if qryVendaFK_ENTREGADOR.IsNull then
  begin
    ShowMessage('Informe o entregador!');
    exit;
  end;

  if dados.TerminalCaixa then
  begin
    if (qryVenda.State in dsEditModes) then
      qryVenda.Post;
    dados.Conexao.CommitRetaining;

    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      if Panel1.Enabled then
        edtProduto.SetFocus;
      exit;
    end;

    try
      frmFechavenda := TfrmFechaVenda.Create(application);
      if dados.qryEmpresaTABELA_PRECO.Value = 'S' then
        frmFechavenda.Tag := 2
      else
        frmFechavenda.Tag := 1;

      frmFechavenda.qryVenda.Close;
      frmFechavenda.qryVenda.Params[0].Value := qryVendaCODIGO.Value;
      frmFechavenda.qryVenda.Open;

      frmFechavenda.qryItem.Close;
      frmFechavenda.qryItem.Params[0].Value := qryVendaCODIGO.Value;
      frmFechavenda.qryItem.Open;

      frmFechavenda.PageControl1.ActivePageIndex := 0;
      frmFechavenda.vTerminalCaixa := dados.TerminalCaixa;
      frmFechavenda.Caption := 'Forma de Pagamento';
      frmFechavenda.Height := 600;
      dados.Tela := 'FPG';
      dados.vEnviarSefa := 'N';

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'delete from vendas_fpg  where vendas_master=:codigo';
      dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      frmFechavenda.JvDBGrid1.Visible := true;
      frmFechavenda.PnTotais.Visible := true;

      frmFechavenda.ShowModal;
    finally
      if frmFechavenda.vFinalizou then
        FinalizaVenda;

      frmFechavenda.Release;

      dados.Tela := 'Delivery';

      qryVenda.Refresh;
      qryItem.Refresh;

      DBGrid1.Refresh;
      DBGrid1.Repaint;
      lblEntregador.Caption := '';
      if Panel1.Enabled then
        edtFone.SetFocus;

    end;
  end
  else
  begin

    qryItem.Refresh;
    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      if Panel1.Enabled then
        edtProduto.SetFocus;
      exit;
    end;

    try
      frmFechavenda := TfrmFechaVenda.Create(application);
      if dados.qryEmpresaTABELA_PRECO.Value = 'S' then
        frmFechavenda.Tag := 2
      else
        frmFechavenda.Tag := 1;
      frmFechavenda.PageControl1.ActivePageIndex := 0;
      frmFechavenda.Caption := 'Forma de Pagamento';
      frmFechavenda.Height := 350;
      dados.Tela := 'FPG';
      dados.vEnviarSefa := 'N';

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'delete from vendas_fpg  where vendas_master=:codigo';
      dados.qryExecute.Params[0].Value := qryVendaCODIGO.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      frmFechavenda.JvDBGrid1.Visible := false;
      frmFechavenda.PnTotais.Visible := false;

      frmFechavenda.ShowModal;
    finally
      if frmFechavenda.vFinalizou then
      begin
        FecharPrevenda;
        FinalizaVenda;
      end;
      frmFechavenda.Release;

      dados.Tela := 'Delivery';

      DBGrid1.Refresh;
      DBGrid1.Repaint;
      lblEntregador.Caption := '';
      if Panel1.Enabled then
        edtFone.SetFocus;
    end;

  end;
  dados.Conexao.CommitRetaining;

  qryVenda.Filtered := false;
end;

procedure TFrmDelivery.btnAvancadaClick(Sender: TObject);
begin
  try
    frmPesquisa := tfrmPesquisa.Create(application);
    frmPesquisa.ShowModal;
  finally

    if trim(frmPesquisa.vDescricao) <> '' then
      edtProduto.Text := frmPesquisa.vDescricao;

    frmPesquisa.Release;

    if Panel1.Enabled then
      edtProduto.SetFocus;
  end;
end;

procedure TFrmDelivery.btnResumoClick(Sender: TObject);
begin
  if not btnResumo.Visible then
    exit;
  try
    frmResumoCaixa := TfrmResumoCaixa.Create(application);
    frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + dados.vUsuario;
    frmResumoCaixa.btnImprimir.Visible := false;
    frmResumoCaixa.ShowModal;
  finally

    frmResumoCaixa.Release;
  end;
end;

procedure TFrmDelivery.btnSangriaClick(Sender: TObject);
begin
  if not btnSangria.Visible then
    exit;

  if dados.qryEmpresaEXCLUI_PDV.Value = 'S' then
  Begin
    dados.vAutorizar := true;
    if not dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if not dados.vAutorizar then
    begin
      exit;
    end;
  end;

  try
    FrmSuprimento_Sangria := TFrmSuprimento_Sangria.Create(application);
    FrmSuprimento_Sangria.vTipo := '1';
    FrmSuprimento_Sangria.ShowModal;
  finally
    FrmSuprimento_Sangria.Release;

  end;

end;

procedure TFrmDelivery.InsereItem;
var
  vItem: Integer;
begin
  PodeAtualizarEstoque := true;

  if qryVenda.State in [dsInsert, dsEdit] then
    qryVenda.Post;

  dados.Conexao.CommitRetaining;

  if copy(edtProduto.Text, 1, 1) = '*' then
    exit;

  if trim(edtProduto.Text) = '' then
    exit;

  if qryPesqProd.IsEmpty then
    exit;

  if StrToFloatDef(edtPreco.Text, 0) <= 0 then
  begin
    ShowMessage('Produto está com o preço inválido');
    exit;
  end;

  if StrToFloatDef(edtQtd.Text, 0) <= 0 then
  begin
    ShowMessage('Produto está com a quantidade inválida');
  end;

  if not ValidaItem then
  begin
    if Panel1.Enabled then
      edtProduto.SetFocus;
    exit;
  end;

  qryItem.Last;
  vItem := qryItemITEM.AsInteger + 1;

  ChamaGrade;

  qryItem.Append;
  qryItemCODIGO.AsFloat := dados.Numerador('VENDAS_DETALHE', 'CODIGO',
    'N', '', '');
  qryItemID_PRODUTO.Value := qryPesqProdCODIGO.AsInteger;
  qryItemFKVENDA.Value := qryVendaCODIGO.Value;
  qryItemITEM.Value := vItem;
  qryItemQTD.AsString := edtQtd.Text;
  qryItemUNIDADE.AsString := qryPesqProdUNIDADE.Value;
  qryItemPRECO.AsString := edtPreco.Text;
  qryItemVALOR_ITEM.AsString := lblTotal.Caption;
  qryItemCOD_BARRA.Value := qryPesqProdCODBARRA.Value;
  qryItemE_MEDIO.Value := qryPesqProdE_MEDIO.AsFloat;
  qryItemEFISCAL.Value := qryPesqProdEFISCAL.Value;

  qryItem.Post;
  dados.Conexao.CommitRetaining;

  LimpaValores;
  if Panel1.Enabled then
    edtProduto.SetFocus;

  dados.Conexao.CommitRetaining;
  qryItem.Refresh;

end;

procedure TFrmDelivery.ItemDesconhecido;
begin
  if dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    edtPreco.ReadOnly := true;
    if ehCaixaRapido = 'N' then
      edtPreco.ReadOnly := false;
  end;
  if qryPesqProdCODIGO.AsInteger = 0 then
    exit;

  if trim(edtProduto.Text) <> '' then
  begin
    if (qryPesqProdPRECO_VARIAVEL.Value = 'S') then
    begin
      edtPreco.ReadOnly := false;
    end
    else
    begin
      if dados.qryEmpresaBLOQUEAR_PRECO.Value = 'S' then
        edtPreco.ReadOnly := true
      else
        edtPreco.ReadOnly := false;
    end;

  end;
end;

procedure TFrmDelivery.qryConta_MovimentoBeforePost(DataSet: TDataSet);
begin
  if qryConta_Movimento.State = dsInsert then
    qryConta_MovimentoCODIGO.AsFloat := dados.Numerador('CONTAS_MOVIMENTO',
      'CODIGO', 'N', '', '');
end;

procedure TFrmDelivery.qryItemAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmDelivery.qryItemAfterPost(DataSet: TDataSet);
begin

  dados.Conexao.CommitRetaining;

  qrySoma.Close;
  qrySoma.Params[0].Value := qryVendaCODIGO.Value;
  qrySoma.Open;

  qryVenda.Edit;
  qryVendaSUBTOTAL.Value := qrySomaTOTAL.Value;
  qryVendaTOTAL.Value := qrySomaTOTAL.Value;
  qryVenda.Post;

  if dados.Tela <> 'FPG' then
  begin
    InsereComposicao(qryItemID_PRODUTO.Value);
    atualizacomposicao('-', qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
    atualizagrade('-', qryItemQTD.AsFloat, qryItemFK_GRADE.Value);
  end;

end;

procedure TFrmDelivery.qryItemBeforeDelete(DataSet: TDataSet);
begin
  if dados.Tela <> 'FPG' then
  begin
    atualizacomposicao('+', qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
    atualizagrade('+', qryItemQTD.AsFloat, qryItemFK_GRADE.Value);
    dados.AtualizaEstoque(qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
  end;
end;

procedure TFrmDelivery.qryItemBeforeOpen(DataSet: TDataSet);
begin
  qryProd.Close;
  qryProd.Open;
end;

procedure TFrmDelivery.qryItemBeforePost(DataSet: TDataSet);
begin
  qryItemTOTAL.AsFloat := qryItemVALOR_ITEM.AsFloat - qryItemVDESCONTO.AsFloat +
    qryItemACRESCIMO.AsFloat;

  if dados.Tela <> 'FPG' then
    dados.AtualizaEstoque(-1 * qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
end;

procedure TFrmDelivery.qryItemQTDValidate(Sender: TField);
begin

  if qryItemQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryItemQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!!');

end;

procedure TFrmDelivery.qryItemVALOR_ITEMValidate(Sender: TField);
begin

  if qryItemVALOR_ITEM.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryItemVALOR_ITEM.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!!');

end;

function TFrmDelivery.ValidaItem: Boolean;
var
  preco, percentual: real;
begin
  if dados.Tela <> 'PDV' then
    exit;

  Result := true;

  if dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
  begin
    if qryPesqProdQTD_ATUAL.Value < StrToFloatDef(edtQtd.Text, 1) then
    begin
      if (qryPesqProdSERVICO.Value <> 'S') then
      // se não for servico
      begin
        LimpaValores;
        ShowMessage('Estoque insuficiente!');
        Result := false;
        exit;
      end;
    end;
  end;

  preco := StrToFloatDef(edtPreco.Text, 0);

  if not((qryPesqProdINICIO_PROMOCAO.Value >= date) and
    (date <= qryPesqProdFIM_PROMOCAO.Value)) then
  // não está em promoção
  begin //
    if qryPesqProdDESCONTO.Value > 0 then
    begin
      percentual := 100 - ((preco / qryPesqProdPR_VENDA.AsFloat) * 100);
      if percentual > qryPesqProdDESCONTO.AsFloat then
      begin
        ShowMessage('Desconto máximo para este produto é de' +
          qryPesqProdDESCONTO.AsString + '%');
        Result := false;
        exit;
      end;
    end;
  end
  else
  begin
    if dados.qryEmpresaDESCONTO_PROD_PROMO.Value = 'S' then
    begin
      if qryPesqProdDESCONTO.Value > 0 then
      begin
        percentual := 100 - ((preco / qryPesqProdVIRTUAL_PRECO.Value) * 100);
        if percentual > qryPesqProdDESCONTO.AsFloat then
        begin
          ShowMessage('Desconto máximo para este produto é de' +
            qryPesqProdDESCONTO.AsString + '%');
          Result := false;
          exit;
        end;
      end;
    end
    else
    begin
      if qryPesqProdVIRTUAL_PRECO.AsFloat < preco then
      begin
        ShowMessage('Não é permitido descontos para produtos em promoção!');
        Result := false;
        exit;
      end;
    end;
  end;

end;

procedure TFrmDelivery.qryPesqProdCalcFields(DataSet: TDataSet);
var
  Qtde: real;
  valida1, valida2: Boolean;
begin
  Qtde := 0;
  if trim(edtQtd.Text) <> '' then
    Qtde := StrToFloatDef(edtQtd.Text, 1);
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

procedure TFrmDelivery.qryVendaAfterOpen(DataSet: TDataSet);
begin
  qryItem.Close;
  qryItem.Open;

end;

procedure TFrmDelivery.qryVendaBeforeOpen(DataSet: TDataSet);
begin
  dados.qryVendedor.Close;
  dados.qryVendedor.Open;

  dados.qryClientes.Close;
  dados.qryClientes.Params[0].Value := '%';
  dados.qryClientes.Open;

  qryCliente.Close;
  qryCliente.Params[0].Value := '%';
  qryCliente.Params[1].Value := '%';
  qryCliente.Open;

end;

procedure TFrmDelivery.qryVendaBeforePost(DataSet: TDataSet);
begin

  if qryVendaID_CLIENTE.Value <> dados.qryConfigCLIENTE_PADRAO.Value then
  begin
    if trim(qryVendaVIRTUAL_CNPJ.Value) <> '' then
      qryVendaCPF_NOTA.Value := TiraPontos(qryVendaVIRTUAL_CNPJ.Value);
  end;

  qryVendaTOTAL.Value := qryVendaSUBTOTAL.Value - qryVendaDESCONTO.Value +
    qryVendaACRESCIMO.Value;

end;

procedure TFrmDelivery.qryVendaCompAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmDelivery.qryVendaDESCONTOValidate(Sender: TField);
begin
  qryVendaTOTAL.Value := qryVendaSUBTOTAL.Value - qryVendaDESCONTO.Value +
    qryVendaACRESCIMO.Value;
end;

procedure TFrmDelivery.PrecoVariavel;
begin
  if dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    if qryPesqProdPRECO_VARIAVEL.Value = 'S' then
      ehCaixaRapido := 'N'
    else
      ehCaixaRapido := 'S';
  end;
end;

function TFrmDelivery.EhNumero(S: string): Boolean;
var
  i: Integer;
begin
  Result := true;
  for i := 1 to Length(S) do
  begin
    if not(S[i] in ['0' .. '9']) then
    begin
      Result := false;
      Break;
    end;
  end;
end;

procedure TFrmDelivery.PesquisaCodBarra;
// pesquisa codigo de barra balança
var
  vPosicao: Integer;
  vPesquisa: string;
begin
  vPosicao := Pos('*', trim(edtProduto.Text)) + 1;
  vPesquisa := trim(copy(edtProduto.Text, vPosicao, 1000));

  if EhNumero(vPesquisa) then
  begin
    if copy(edtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
    begin
      if Pos('*', edtProduto.Text) = 0 then
        PesquisaCodBarraBalanca(vPesquisa)
      else
        PesquisaCodBarraGeral(vPesquisa);
    end
    else
      PesquisaCodBarraGeral(vPesquisa);
  end;

  if not(qryPesqProd.IsEmpty) then
  begin
    PrecoVariavel;
    BuscaPreco;
    ItemDesconhecido;
  end;
end;

procedure TFrmDelivery.PesquisaDescricao; // pesquisa
var
  vPosicao, vItem: Integer;
  vPesquisa: string;
begin
  vPosicao := Pos('*', trim(edtProduto.Text)) + 1;
  vPesquisa := trim(copy(edtProduto.Text, vPosicao, 1000));

  if not EhNumero(vPesquisa) then
  begin

    qryPesqProd.Close;
    qryPesqProd.SQL.Text := vSql;
    qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
      ' AND (PRO.ATIVO=''S'')  AND ((PRO.DESCRICAO LIKE ' +
      QuotedStr(vPesquisa + '%') + ') OR (PRO.REFERENCIA LIKE ' +
      QuotedStr(vPesquisa + '%') + '))' + ' order by PRO.DESCRICAO', []);
    qryPesqProd.Params[0].Value := qryVendaFKEMPRESA.Value;
    qryPesqProd.Open;
  end
  else
  begin
    if dados.qryEmpresaPESQUISA_REFERENCIA.Value = 'S' then
    begin

      qryPesqProd.Close;
      qryPesqProd.SQL.Text := vSql;
      qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
        ' AND (PRO.ATIVO=''S'')  AND (PRO.REFERENCIA LIKE ' +
        QuotedStr(vPesquisa + '%') + ')' + ' order by PRO.DESCRICAO', []);
      qryPesqProd.Params[0].Value := qryVendaFKEMPRESA.Value;
      qryPesqProd.Open;
    end;

  end;

  if not(qryPesqProd.IsEmpty) then
  begin
    PrecoVariavel;
    BuscaPreco;
    ItemDesconhecido;
  end;

end;

procedure TFrmDelivery.edtClienteChange(Sender: TObject);
begin
  PesquisaCliente;
end;

procedure TFrmDelivery.edtClienteEnter(Sender: TObject);
begin
  DBGrid3.Visible := true;
end;

procedure TFrmDelivery.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DBGrid3.Visible then
  begin
    if Key = VK_UP then
    begin
      qryBuscaFone.Prior;
      if ActiveControl = edtCliente then
        edtFone.SetFocus;
      if ActiveControl = edtCliente then
        edtCliente.SetFocus;
    end;
  end;
  if Key = VK_DOWN then
  begin
    qryBuscaFone.Next;
    if ActiveControl = edtCliente then
      edtFone.SetFocus;
    if ActiveControl = edtCliente then
      edtCliente.SetFocus;

  end;
end;

procedure TFrmDelivery.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13]) then
  begin
    DBGrid3.Visible := false;
    edtProduto.SetFocus;
  end;
end;

procedure TFrmDelivery.edtFoneChange(Sender: TObject);
begin
  DBGrid3.Visible := true;
  PesquisaCliente;
end;

procedure TFrmDelivery.edtFoneExit(Sender: TObject);
begin
  if not(qryVenda.State in dsEditModes) then
    qryVenda.Edit;
  qryVendaID_CLIENTE.Value := qryBuscaFoneCODIGO.Value;
  qryVenda.Post;
end;

procedure TFrmDelivery.edtFoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if DBGrid3.Visible then
  begin
    if Key = VK_UP then
    begin
      qryBuscaFone.Prior;
      if ActiveControl = edtFone then
        edtFone.SetFocus;
      if ActiveControl = edtCliente then
        edtCliente.SetFocus;
    end;
  end;
  if Key = VK_DOWN then
  begin
    qryBuscaFone.Next;
    if ActiveControl = edtFone then
      edtFone.SetFocus;
    if ActiveControl = edtCliente then
      edtCliente.SetFocus;

  end;
end;

procedure TFrmDelivery.edtFoneKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#13]) or (Key in [#9]) or (Key in [#27]) then
  begin
    DBGrid3.Visible := false;
    edtProduto.SetFocus;
  end;
end;

procedure TFrmDelivery.edtQtdEnter(Sender: TObject);
begin

  if ehCaixaRapido = 'S' then
    edtProduto.SetFocus;
end;

procedure TFrmDelivery.edtQtdExit(Sender: TObject);
var
  Total: real;
begin
  Total := StrToFloatDef(edtQtd.Text, 1) * StrToFloatDef(edtPreco.Text, 0);
  if copy(edtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
    exit;
  lblTotal.Caption := FormatFloat('0.00', Total);
end;

procedure TFrmDelivery.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key In ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;

  if Key = #13 then
  begin
    edtPreco.SetFocus;
  end;
end;

procedure TFrmDelivery.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmDelivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (qryVenda.State in dsEditModes) then
    qryVenda.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TFrmDelivery.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.AsInteger;
  dados.qryConfig.Open;

  dados.qryEntregador.Close;
  dados.qryEntregador.Open;

  ehCaixaRapido := dados.qryEmpresaCAIXA_RAPIDO.AsString;

  if FileExists(dados.qryParametroTELA_FUNDO_ECF.Value) then
    imgLogo.Picture.LoadFromFile(dados.qryParametroTELA_FUNDO_ECF.Value);

  if not dados.vRetaguarda then
  begin
    try
      frmSplash := TfrmSplash.Create(application);
      frmSplash.ShowModal;
    finally
      frmSplash.Release;
    end;
  end;

end;

procedure TFrmDelivery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_escape then
  begin
    if not DBGrid2.Visible then
    begin
      if application.messageBox('Tem certeza de que deseja sair?',
        'Confirmação', mb_YesNo) = mrYes then
        Close;
    end;
  end;

  if Key = VK_F1 then
  begin
    edtProduto.SetFocus;
    edtProduto.SelectAll;
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
    if btnCadCliente.Visible then
      btnCadCliente.Click;
  end;

  if Key = VK_F4 then
  begin
    if btnVendedor.Enabled then
      btnVendedorClick(self);
  end;

  if Key = VK_F5 then
  begin
    if btnAvancada.Enabled then
      btnAvancada.Click;
  end;

  if Key = VK_F6 then
  begin
    if btnEntregador.Enabled then
      btnEntregador.Click;
  end;

  if Key = VK_F7 then
  begin
    if btnCancVenda.Enabled then
      btnCancVenda.Click;
  end;

  if Key = VK_F8 then
  begin
    if btnFinaliza.Enabled then
      btnFinaliza.Click;
  end;

  if Key = VK_F9 then
  begin
    if btnResumo.Enabled then
      btnResumo.Click;
  end;

  if Key = VK_F10 then
  begin
    if btnSangria.Enabled then
      btnSangria.Click;
  end;

  if Key = VK_F11 then
  begin
    if BtnSuprimento.Enabled then
      BtnSuprimento.Click;
  end;

  if Key = VK_F12 then
  begin
    if Panel1.Enabled then
      edtFone.SetFocus;
  end;

  if Key = vk_delete then
  begin
    if btnDelItem.Enabled then
    begin

      if ActiveControl = DBGrid1 then
      begin
        btnDelItem.Click;
        exit;
      end
      else if ActiveControl = edtProduto then
      begin
        if edtProduto.Text = '' then
        begin
          btnDelItem.Click;
          exit;
        end;
      end;
    end;
  end;

end;

procedure TFrmDelivery.InsereComposicao(produto: Integer);
begin
  qryVendaComp.Close;
  qryVendaComp.Params[0].Value := produto;
  qryVendaComp.Open;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select composicao from produto where codigo=:id';
  dados.qryConsulta.Params[0].Value := produto;

  dados.qryConsulta.Open;
  if dados.qryConsulta.Fields[0].AsString = 'S' then
  begin
    qryComposicao.Close;
    qryComposicao.Params[0].Value := produto;
    qryComposicao.Open;
    qryComposicao.First;
    while not qryComposicao.eof do
    begin
      qryVendaComp.Insert;
      qryVendaCompCODIGO.Value := dados.Numerador('VENDAS_COMPOSICAO', 'CODIGO',
        'N', '', '');
      qryVendaCompFK_VENDA_DETALHE.Value := qryItemCODIGO.Value;
      qryVendaCompID_PRODUTO.Value := qryComposicaoID_PRODUTO.Value;
      qryVendaCompQTD.Value := qryItemQTD.AsFloat *
        qryComposicaoQUANTIDADE.AsFloat;
      qryVendaComp.Post;
      qryComposicao.Next;
    end;
  end;

end;

procedure TFrmDelivery.atualizacomposicao(tipo: string; qtd_atual: real;
  produto: Integer);
begin

  if tipo = '+' then
  begin

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select composicao from produto where codigo=:id';
    dados.qryConsulta.Params[0].Value := produto;

    dados.qryConsulta.Open;
    if dados.qryConsulta.Fields[0].AsString = 'S' then
    begin
      qryComposicao.Close;
      qryComposicao.Params[0].Value := produto;
      qryComposicao.Open;
      qryComposicao.First;
      while not qryComposicao.eof do
      begin

        dados.qryExecute.Close;
        dados.qryExecute.SQL.Text :=
          'update produto set qtd_atual=qtd_atual+:qtd1 where codigo=:cod';
        dados.qryExecute.Params[0].AsFloat := qtd_atual *
          qryComposicaoQUANTIDADE.AsFloat;
        dados.qryExecute.Params[1].Value := qryComposicaoID_PRODUTO.Value;
        dados.qryExecute.ExecSQL;
        dados.Conexao.CommitRetaining;
        qryComposicao.Next;
      end;
    end;
  end;

  if tipo = '-' then
  begin

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select composicao from produto where codigo=:id';
    dados.qryConsulta.Params[0].Value := produto;

    dados.qryConsulta.Open;
    if dados.qryConsulta.Fields[0].AsString = 'S' then
    begin
      qryComposicao.Close;
      qryComposicao.Params[0].Value := produto;
      qryComposicao.Open;
      qryComposicao.First;
      while not qryComposicao.eof do
      begin

        dados.qryExecute.Close;
        dados.qryExecute.SQL.Text :=
          'update produto set qtd_atual=qtd_atual-:qtd1 where codigo=:cod';
        dados.qryExecute.Params[0].AsFloat := qtd_atual *
          qryComposicaoQUANTIDADE.AsFloat;
        dados.qryExecute.Params[1].Value := qryComposicaoID_PRODUTO.Value;
        dados.qryExecute.ExecSQL;
        dados.Conexao.CommitRetaining;
        qryComposicao.Next;
      end;
    end;
  end;

end;

procedure TFrmDelivery.atualizagrade(tipo: string; qtd_atual: real;
  produto: Integer);
begin

  if tipo = '+' then
  begin

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text := 'select grade from produto where codigo=:id';
    dados.qryConsulta.Params[0].Value := qryItemID_PRODUTO.Value;

    dados.qryConsulta.Open;
    if dados.qryConsulta.Fields[0].AsString = 'S' then
    begin
      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'update produto_grade set qtd=qtd+:qtd1 where codigo=:cod';
      dados.qryExecute.Params[0].AsFloat := qtd_atual * qryItemQTD.AsFloat;
      dados.qryExecute.Params[1].Value := qryItemFK_GRADE.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;
    end;
  end;

  if tipo = '-' then
  begin

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text := 'select grade from produto where codigo=:id';
    dados.qryConsulta.Params[0].Value := qryItemID_PRODUTO.Value;
    dados.qryConsulta.Open;
    if dados.qryConsulta.Fields[0].AsString = 'S' then
    begin
      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'update  produto_grade set qtd=qtd-:qtd1 where codigo=:cod';
      dados.qryExecute.Params[0].AsFloat := qtd_atual * qryItemQTD.AsFloat;
      dados.qryExecute.Params[1].Value := qryItemFK_GRADE.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;
    end;

  end;

end;

function TFrmDelivery.UltimaVenda: Integer;
begin
  Result := 0;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select ultima_venda, ultimo_pedido from usuarios where codigo=:id';
  dados.qryConsulta.Params[0].Value := dados.IdUsuario;
  dados.qryConsulta.Open;
  if dados.TerminalCaixa then
    Result := dados.qryConsulta.Fields[0].AsInteger
  else
    Result := dados.qryConsulta.Fields[1].AsInteger;
end;

procedure TFrmDelivery.FormShow(Sender: TObject);
begin

  PesquisaProduto := true;

  if not dados.vRetaguarda then
  begin
    try
      frmAcesso := TfrmAcesso.Create(application);
      frmAcesso.ShowModal;
    finally
      frmAcesso.Release;
    end;
  end;

  tamanho;

  if dados.qryEmpresaPESQUISA_REFERENCIA.Value = 'S' then
    grpSelecao.Caption := 'F1 CÓDIGO DE BARRAS | DESCRIÇÃO | REFERÊNCIA'
  else
    grpSelecao.Caption := 'F1 CÓDIGO DE BARRAS | DESCRIÇÃO';

  if dados.qryEmpresaEXIBE_RESUMO_CAIXA.Value = 'S' then
    btnResumo.Visible := true
  else
    btnResumo.Visible := false;

  if ehCaixaRapido = 'N' then
  begin
    edtQtd.ReadOnly := false;
    edtPreco.ReadOnly := false;
    edtQtd.Color := $00E0E0C2;
    edtPreco.Color := $00E0E0C2;
  end
  else
  begin
    if dados.qryEmpresaBLOQUEAR_PRECO.Value = 'S' then
      edtPreco.ReadOnly := true
    else
      edtPreco.ReadOnly := false;
  end;

  dados.Tela := 'PDV';

  dados.qryTerminal.Close;
  dados.qryTerminal.Params[0].Value := dados.Getcomputer;
  dados.qryTerminal.Open;

  if not dados.qryTerminal.Locate('nome', dados.Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
    Close;
  end;

  dados.TerminalCaixa := dados.qryTerminalEH_CAIXA.AsString = 'S';

  try

    if dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
    begin
      vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
        ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
        ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' +
        ' PRO.E_MEDIO, PRO.EFISCAL,' + ' PRO.UNIDADE, PRO.LOCALIZACAO,' +
        ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO,PRO.DESCONTO,' +
        ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.PRECO_VARIAVEL, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.PREFIXO_BALANCA'
        + ' FROM PRODUTO PRO' +
        '  WHERE (PRO.EMPRESA=:EMP) AND(PRO.QTD_ATUAL>0) /*where*/';
    end
    else
    begin
      vSql := ' SELECT PRO.CODIGO,' + ' PRO.DESCRICAO,' + ' PRO.CFOP,' +
        ' PRO.CODBARRA,' + ' PRO.NCM, PRO.REFERENCIA,' + ' PRO.PR_VENDA,' +
        ' PRO.PRECO_ATACADO, ' + 'PRO.QTD_ATACADO,' + ' PRO.QTD_ATUAL,' +
        ' PRO.E_MEDIO, PRO.EFISCAL,' + ' PRO.UNIDADE, PRO.LOCALIZACAO,' +
        ' PRO.PRECO_PROMO_VAREJO,PRO.PRECO_PROMO_ATACADO,PRO.DESCONTO,' +
        ' PRO.INICIO_PROMOCAO,PRO.FIM_PROMOCAO, PRO.PRECO_VARIAVEL, PRO.SERVICO, PRO.REMEDIO, PRO.GRADE, PRO.PREFIXO_BALANCA'
        + ' FROM PRODUTO PRO' + '  WHERE (PRO.EMPRESA=:EMP) /*where*/';
    end;

    if not dados.TerminalCaixa then // verifica ce o terminal é caixa
    begin
      Caption := 'PV - Pedido de Venda';
      lblCaixa.Caption := 'PRÉ-VENDA';
      lblOperador.Caption := dados.vUsuario;
      lblEntregador.Caption := qryVendaVIRTUAL_ENTREGADOR.Value;
      habilitacampos(true);
      btnCaixa.Visible := false;
      btnEntregador.Visible := false;
      btnCadCliente.Visible := false;
      btnResumo.Visible := false;
      btnSangria.Visible := false;
      BtnSuprimento.Visible := false;
    end
    else
    begin // verifica se caixa está aberto

      dados.qryConsulta.Close;
      dados.qryConsulta.SQL.Text :=
        'select CODIGO, DATA_ABERTURA, LOTE, SITUACAO from contas where id_usuario=:id AND SITUACAO=''A''';
      dados.qryConsulta.Params[0].Value := dados.IdUsuario;
      dados.qryConsulta.Open;

      if dados.qryConsulta.FieldByName('SITUACAO').AsString = 'A' then
      begin
        dados.idCaixa := dados.qryConsulta.Fields[0].Value;
        dados.Lote := dados.qryConsulta.Fields[2].Value;

        if dados.qryConsulta.FieldByName('DATA_ABERTURA').Value < date then
        begin
          ShowMessage('Caixa não é de hoje!');
          btnCaixa.Caption := 'F2 | Fechar Caixa';
          btnCaixa.Tag := 2;
          btnEntregador.Enabled := false;
          btnCadCliente.Enabled := false;
          BtnSuprimento.Enabled := false;
          btnSangria.Enabled := false;
          btnDelItem.Enabled := false;
          btnCancVenda.Enabled := false;
          btnAvancada.Enabled := false;
          btnFinaliza.Enabled := false;
          Panel1.Enabled := false;
          exit;
        end
        else
        begin
          btnCaixa.Caption := 'F2 | Fechar Caixa';
          btnCaixa.Tag := 2;
        end;

        habilitacampos(true);
        edtFone.SetFocus;
      end
      else
      begin
        // não existe caixa aberto para para usuario

        btnCaixa.Caption := 'F2 | Abrir Caixa';
        btnCaixa.Tag := 1;
        habilitacampos(false);
      end;
    end;

    qryPesqProd.Close;
    qryPesqProd.SQL.Text := vSql;
    qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
      'AND PRO.ATIVO=''S'' AND PRO.DESCRICAO LIKE ' +
      QuotedStr(edtProduto.Text), []);
    qryPesqProd.Open;

    BuscaVenda;
    if qryBuscaVendaCODIGO.IsNull then
      inserevenda
    else
    begin

      qryVenda.Close;
      qryVenda.Params[0].Value := qryBuscaVendaCODIGO.Value;
      qryVenda.Open;

      qryVenda.Edit;
      qryVendaDATA_EMISSAO.Value := now;
      qryVendaDATA_SAIDA.Value := now;
      qryVendaFK_CAIXA.Value := dados.idCaixa;
      qryVendaLOTE.Value := dados.Lote;
    end;
    if Panel1.Enabled then
      edtFone.SetFocus;
    // Close;

  finally
    MostraCaixa;
  end;

end;

procedure TFrmDelivery.habilitacampos(campos: Boolean);
begin

  btnAvancada.Enabled := campos;
  BtnSuprimento.Enabled := campos;
  btnSangria.Enabled := campos;
  btnEntregador.Enabled := campos;
  btnCadCliente.Enabled := campos;
  btnResumo.Enabled := campos;
  btnDelItem.Enabled := campos;
  btnCancVenda.Enabled := campos;
  btnFinaliza.Enabled := campos;
  Panel1.Enabled := campos;
end;

end.
