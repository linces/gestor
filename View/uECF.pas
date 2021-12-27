unit uECF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math, ACBrDevice,
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
  ACBrBAL, ACBrECF, ACBrTEFD;

type
  TFrmECF = class(TForm)
    ActionList1: TActionList;
    actLerPeso: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    GrpQtd: TGroupBox;
    edtQtd: TEdit;
    GrpPreco: TGroupBox;
    edtPreco: TEdit;
    GrpTotal: TGroupBox;
    edtTotal: TEdit;
    grpSelecao: TGroupBox;
    EdtProduto: TEdit;
    Panel3: TPanel;
    btnFechavendas: TSpeedButton;
    btnOrcamento: TSpeedButton;
    btnDelItem: TSpeedButton;
    btnCancVenda: TSpeedButton;
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
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox5: TGroupBox;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    btnFinaliza: TSpeedButton;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryItemDESCRICAO_SL: TStringField;
    GroupBox6: TGroupBox;
    DBText1: TDBText;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_VENDEDOR: TStringField;
    qryItemTTOTAL: TAggregateField;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid2: TDBGridEh;
    DBGrid1: TDBGridEh;
    qryPesqProdNCM: TStringField;
    Panel6: TPanel;
    Timer1: TTimer;
    qryVendaFKEMPRESA: TIntegerField;
    qryFechamento: TFDQuery;
    qryFechamentoCODIGO: TIntegerField;
    qryFechamentoDATA: TDateField;
    qryFechamentoHORA: TTimeField;
    qryFechamentoFK_USUARIO: TIntegerField;
    qryFechamentoFKEMPRESA: TIntegerField;
    btnResumo: TSpeedButton;
    btnSangria: TSpeedButton;
    btnComanda: TSpeedButton;
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
    GroupBox7: TGroupBox;
    DBEdit3: TDBEdit;
    dsEmpresa: TDataSource;
    qryVendaVirtualEmpresa: TStringField;
    qryConta_MovimentoCODIGO: TIntegerField;
    qryCMovimento: TFDQuery;
    qryCMovimentoCODIGO: TIntegerField;
    qryCMovimentoID_CONTA_CAIXA: TIntegerField;
    qryCMovimentoID_USUARIO: TIntegerField;
    qryCMovimentoHISTORICO: TStringField;
    qryCMovimentoDATA: TDateField;
    qryCMovimentoHORA: TTimeField;
    qryCMovimentoFKVENDA: TIntegerField;
    qryCMovimentoLOTE: TIntegerField;
    qryPesqProdLOCALIZACAO: TStringField;
    qryPesqProdFIM_PROMOCAO: TDateField;
    qryPesqProdINICIO_PROMOCAO: TDateField;
    qryPesqProdVIRTUAL_PRECO: TFloatField;
    GrpNumero: TGroupBox;
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
    DBText2: TDBText;
    qryComposicao: TFDQuery;
    qryComposicaoID_PRODUTO: TIntegerField;
    qryVendaComp: TFDQuery;
    qryVendaCompCODIGO: TIntegerField;
    qryVendaCompFK_VENDA_DETALHE: TIntegerField;
    qryVendaCompID_PRODUTO: TIntegerField;
    qryConta_MovimentoHISTORICO: TStringField;
    BtnSuprimento: TSpeedButton;
    qryPesqProdSERVICO: TStringField;
    qryVendaVIRTUAL_CNPJ: TStringField;
    DBEdit4: TDBEdit;
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
    qryCMovimentoENTRADA: TFMTBCDField;
    qryCMovimentoSAIDA: TFMTBCDField;
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
    btnBuscaPreco: TSpeedButton;
    qryVendaTOTAL_TROCA: TFMTBCDField;
    qryCMovimentoTROCA: TFMTBCDField;
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
    grpGrade: TGroupBox;
    qryGrade: TFDQuery;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    dsGrade: TDataSource;
    cbGrade: TDBLookupComboboxEh;
    qryGradeCODIGO: TIntegerField;
    qryPesqProdPREFIXO_BALANCA: TStringField;
    ACBrBAL1: TACBrBAL;
    ActionList2: TActionList;
    btnBalanca: TSpeedButton;
    btnReceber: TSpeedButton;
    actBusca: TAction;
    btnMedicamento: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFechavendasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtProdutoChange(Sender: TObject);
    procedure btnDelItemClick(Sender: TObject);
    procedure btnCancVendaClick(Sender: TObject);
    procedure btnFinalizaClick(Sender: TObject);
    procedure qryVendaDESCONTOValidate(Sender: TField);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryVendaAfterOpen(DataSet: TDataSet);
    procedure qryItemBeforeOpen(DataSet: TDataSet);
    procedure qryVendaBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure qryItemAfterPost(DataSet: TDataSet);
    procedure btnResumoClick(Sender: TObject);
    procedure edtQtdEnter(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure qryVendaBeforePost(DataSet: TDataSet);
    procedure btnSangriaClick(Sender: TObject);
    procedure dsVendaDataChange(Sender: TObject; Field: TField);
    procedure DBLookupComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure qryConta_MovimentoBeforePost(DataSet: TDataSet);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdExit(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure qryVendaAfterPost(DataSet: TDataSet);
    procedure qryPesqProdCalcFields(DataSet: TDataSet);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure qryItemBeforePost(DataSet: TDataSet);
    procedure qryItemAfterDelete(DataSet: TDataSet);
    procedure qryItemBeforeDelete(DataSet: TDataSet);
    procedure qryVendaCompAfterPost(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnSuprimentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnComandaClick(Sender: TObject);
    procedure dsPesqProdDataChange(Sender: TObject; Field: TField);
    procedure cbGradeEnter(Sender: TObject);
    procedure cbGradeKeyPress(Sender: TObject; var Key: Char);
    procedure btnBalancaClick(Sender: TObject);
    procedure actBuscaExecute(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnMedicamentoClick(Sender: TObject);
    procedure qryItemQTDValidate(Sender: TField);
    procedure qryItemVALOR_ITEMValidate(Sender: TField);
  private
    vSql: string;
    ehCaixaRapido: string;
    TerminalCaixa: Boolean;
    procedure BuscaPreco;
    procedure ItemDesconhecido;
    procedure InsereItem;
    function Getcomputer: String;
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
    procedure AtivarBalanca;

    { Private declarations }
  public
    CodigoGrade: Integer;
    PodeAtualizarEstoque: Boolean;
    IdVenda, Lote: Integer;
    procedure habilitacampos(campos: Boolean);
    procedure inserevenda;
    procedure BuscaVenda;
    { Public declarations }
  end;

var
  FrmECF: TFrmECF;

implementation

{$R *.dfm}

uses Udados, uAbreCaixa, uSuprimento_Sangria,
  uFormaPagamento, uImportar, uResumoCaixa, uSupervisor, uCadProduto,
  uBuscaPreco, uComanda, uConsReceber, uPesquisaPrincipio, uPDV;

procedure TFrmECF.tamanho;
begin
  DBGrid2.Left := DBGrid1.Left;
  DBGrid2.Width := DBGrid1.Width;
  DBGrid2.Top := DBGrid1.Top;

  DBGrid1.Columns[0].Width := round(Screen.Width * 0.04);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.50);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.04);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.09);

  DBGrid2.Columns[0].Width := round(Screen.Width * 0.04);
  DBGrid2.Columns[1].Width := round(Screen.Width * 0.12);
  DBGrid2.Columns[2].Width := round(Screen.Width * 0.08);
  DBGrid2.Columns[3].Width := round(Screen.Width * 0.38);
  DBGrid2.Columns[4].Width := round(Screen.Width * 0.07);
  DBGrid2.Columns[5].Width := round(Screen.Width * 0.06);
  DBGrid2.Columns[6].Width := round(Screen.Width * 0.03);
  DBGrid2.Columns[7].Width := round(Screen.Width * 0.07);

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

procedure TFrmECF.BtnSuprimentoClick(Sender: TObject);
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

procedure TFrmECF.BuscaPreco;
var
  vQtd, vPreco, vTotal: real;
begin
  if copy(EdtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
  begin
    case dados.qryConfigMODELO_BALANCA.Value of
      3:
        begin
          vTotal := strtofloat(copy(EdtProduto.Text, 7, 4) + ',' +
            copy(EdtProduto.Text, 11, 2));
          vQtd := 0;
          edtPreco.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          if qryPesqProdVIRTUAL_PRECO.Value > 0 then
            vQtd := vTotal / qryPesqProdVIRTUAL_PRECO.AsFloat;
          edtTotal.Text := FormatFloat('0.00', vTotal);
          edtQtd.Text := FormatFloat('0.000', vQtd);
        end;
      1, 2, 4:
        begin
          vQtd := strtofloat(copy(EdtProduto.Text, 8, 2) + ',' +
            copy(EdtProduto.Text, 10, 3));
          edtPreco.Text := FormatFloat('0.00',
            qryPesqProdVIRTUAL_PRECO.AsFloat);
          vTotal := SimpleRoundTo(vQtd * qryPesqProdVIRTUAL_PRECO.AsFloat, -2);
          edtTotal.Text := FormatFloat('0.00', vTotal);
          edtQtd.Text := FormatFloat('0.000', vQtd);
        end;
    end;
  end
  else
  begin
    if Pos('*', EdtProduto.Text) > 1 then
    begin
      try
        vQtd := strtofloat(copy(EdtProduto.Text, 1,
          Pos('*', EdtProduto.Text) - 1));
        edtQtd.Text := copy(EdtProduto.Text, 1, Pos('*', EdtProduto.Text) - 1);
        edtPreco.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
        edtTotal.Text := FormatFloat('0.00',
          qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);
      except
        raise Exception.Create('Não foi possível Selecionar Produto!');
      end;
    end
    else
    begin
      vQtd := strtofloat(edtQtd.Text);
      edtPreco.Text := FormatFloat('0.00', qryPesqProdVIRTUAL_PRECO.AsFloat);
      edtTotal.Text := FormatFloat('0.00',
        qryPesqProdVIRTUAL_PRECO.AsFloat * vQtd);

    end;
  end;
end;

procedure TFrmECF.DBGrid1DblClick(Sender: TObject);
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

procedure TFrmECF.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dados.vEnviarSefa = 'S' then
  begin
    DBGrid1.Canvas.Font.Color := clBlack;
    if qryItemEFISCAL.Value = 'S' then
      if qryItemQTD.Value > qryItemE_MEDIO.Value then
      begin
        DBGrid1.Canvas.Font.Color := clRed;
      end;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmECF.DBGrid2DblClick(Sender: TObject);
begin
  EdtProduto.Text := qryPesqProdDESCRICAO.Value;
  // DBGrid2.Visible := false;
end;

procedure TFrmECF.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid2DblClick(Sender);

end;

procedure TFrmECF.DBLookupComboBox3Exit(Sender: TObject);
begin
  EdtProduto.SetFocus;
end;

procedure TFrmECF.DBLookupComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtProduto.SetFocus;
end;

procedure TFrmECF.dsPesqProdDataChange(Sender: TObject; Field: TField);
begin
  if qryPesqProdGRADE.Value = 'S' then
  begin
    qryGrade.Close;
    qryGrade.Params[0].Value := qryPesqProdCODIGO.Value;
    qryGrade.Open;
    grpGrade.Visible := true;
  end
  else
    grpGrade.Visible := false;
end;

procedure TFrmECF.dsVendaDataChange(Sender: TObject; Field: TField);
begin
  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := qryVendaFKEMPRESA.AsInteger;
  dados.qryConfig.Open;

  qryTabela.Close;
  qryTabela.Params[0].Value := FrmPDV.qryVendaFKEMPRESA.Value;
  qryTabela.Open;

end;

procedure TFrmECF.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edtQtd.SetFocus;
  end;
end;

procedure TFrmECF.edtPrecoExit(Sender: TObject);
var
  Total: real;
begin
  Total := strtofloat(edtQtd.Text) * strtofloat(edtPreco.Text);
  if copy(EdtProduto.Text, 1, 1) <> dados.qryConfigPREFIXO_BALANCA.Value then
    edtTotal.Text := FormatFloat('0.00', Total);
  EdtProduto.SetFocus;
  InsereItem;
end;

procedure TFrmECF.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    qryPesqProd.Refresh;
    EdtProduto.SetFocus;
  end;
end;

procedure TFrmECF.inserevenda;
var
  codigo: Integer;
begin
  edtQtd.Text := '1';
  edtPreco.Text := '0,00';
  edtTotal.Text := '0,00';

  qryVenda.Close;
  qryVenda.Params[0].Value := codigo;
  qryVenda.Open;

  qryVenda.Insert;

  if TerminalCaixa then
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
  qryVendaLOTE.Value := Lote;

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

  codigo := dados.Numerador('VENDAS_MASTER', 'CODIGO', 'N', '', '');
  qryVendaCODIGO.AsFloat := codigo;

  qryVenda.Post;
  dados.Conexao.CommitRetaining;
end;

function TFrmECF.GerouNFCe(operacao: string): String;
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

procedure TFrmECF.BuscaVenda;
begin
  if TerminalCaixa then
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

procedure TFrmECF.cbGradeEnter(Sender: TObject);
begin
  cbGrade.DropDown;
end;

procedure TFrmECF.cbGradeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtQtd.SetFocus;
end;

procedure TFrmECF.btnBalancaClick(Sender: TObject);
begin
 if not btnBalanca.Visible then exit;

  try
    btnBalanca.Enabled := false;
    AtivarBalanca;
    edtQtd.Text := FloatToStr(ACBrBAL1.LePeso(2000));
  finally
    btnBalanca.Enabled := true;
  end;
end;

procedure TFrmECF.btnCancVendaClick(Sender: TObject);
var
  vMensagem: String;
begin
  vMensagem := 'Deseja Cancelar Venda?' + sLineBreak +
    GerouNFCe('CANCELA VENDA');
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
        qryVenda.Params[0].Value := FrmPDV.qryBuscaVendaCODIGO.Value;
        qryVenda.Open;

        qryVenda.Edit;
        qryVendaDATA_EMISSAO.Value := now;
        qryVendaDATA_SAIDA.Value := now;
        qryVendaFK_CAIXA.Value := dados.idCaixa;
        qryVendaLOTE.Value := Lote;
      end;

      EdtProduto.SetFocus;
      EdtProduto.SelectAll;
    finally
      qryItem.EnableControls;
      edtPreco.Text := '0,00';
      edtTotal.Text := '0,00';
      edtQtd.Text := '1';

    end;
  end;
end;

procedure TFrmECF.btnComandaClick(Sender: TObject);
begin
  try
    FrmComanda := TFrmComanda.Create(application);
    FrmComanda.ShowModal;
  finally

    FrmComanda.Release;
  end;
end;

procedure TFrmECF.btnDelItemClick(Sender: TObject);
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
          end;

          if not dados.vAutorizar then
          begin
            exit;
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
    EdtProduto.SetFocus;
  end;
end;

procedure TFrmECF.btnFechavendasClick(Sender: TObject);
var
  Data: Tdate;
  Hora: TTime;
  idLote: Integer;
begin

  if not btnFechavendas.Visible then
    exit;

  if application.messageBox('Tem certeza de que deseja Fechar Caixa?',
    'Confirmação', mb_YesNo) = mrno then
    exit;

  dados.vPodeFecharCaixa := false;

  if dados.qryEmpresaEXIBE_RESUMO_CAIXA.Value = 'S' then
  begin
    try
      frmResumoCaixa := TfrmResumoCaixa.Create(application);
      frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + dados.vUsuario;
      frmResumoCaixa.BitBtn2.Visible := true;
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
      'UPDATE CONTAS SET DATA_ABERTURA=NULL, SITUACAO=''F'', LOTE=0 WHERE CODIGO=:COD';
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

procedure TFrmECF.btnFinalizaClick(Sender: TObject);
var
  cont: Integer;
begin
  if dados.qryConfigCLIENTE_PADRAO.IsNull then
  begin
    ShowMessage
      ('Vá é em configurações e informe o código do cliente Consumidor Final!');
    exit;
  end;

  if TerminalCaixa then
  begin
    if (qryVenda.State in dsEditModes) then
      qryVenda.Post;
    dados.Conexao.CommitRetaining;

    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      EdtProduto.SetFocus;
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
      frmFechavenda.Height := 600;
      dados.Tela := 'FPG';
      dados.vEnviarSefa := 'N';

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'delete from vendas_fpg  where vendas_master=:codigo';
      dados.qryExecute.Params[0].Value := FrmPDV.qryVendaCODIGO.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      frmFechavenda.ShowModal;
    finally
      frmFechavenda.Release;
      dados.Tela := 'PDV';
      DBGrid1.Refresh;
      DBGrid1.Repaint;
      DBGrid1.SetFocus;
      EdtProduto.SetFocus;
    end;
  end
  else
  begin

    qryItem.Refresh;
    if (qryItem.IsEmpty) then
    begin
      ShowMessage('Digite os itens!');
      EdtProduto.SetFocus;
      exit;
    end;

    if not(qryVenda.State in dsEditModes) then
      qryVenda.Edit;
    qryVendaSITUACAO.Value := 'G';
    qryVenda.Post;
    dados.Conexao.CommitRetaining;

    qryVenda.Edit;
    qryVendaDATA_EMISSAO.Value := now;
    qryVendaDATA_SAIDA.Value := now;
    qryVendaFK_CAIXA.Value := dados.idCaixa;
    qryVendaLOTE.Value := Lote;
    qryVenda.Post;

    application.ProcessMessages;
    ShowMessage('Pedido finalizado com sucesso!');
    inserevenda;
  end;
  dados.Conexao.CommitRetaining;

  FrmPDV.qryVenda.Filtered := false;
end;

procedure TFrmECF.btnMedicamentoClick(Sender: TObject);
begin
  try
    frmPesquisaPrincipio := tfrmPesquisaPrincipio.Create(application);
    frmPesquisaPrincipio.EdtProduto.Text :=
      frmPesquisaPrincipio.EdtProduto.Text;
    frmPesquisaPrincipio.ShowModal;
  finally
    frmPesquisaPrincipio.Release;
    EdtProduto.SetFocus;
  end;
end;

procedure TFrmECF.btnOrcamentoClick(Sender: TObject);
begin
  if not btnOrcamento.Visible then
    exit;
  try
    frmImportar := TfrmImportar.Create(application);
    frmImportar.ShowModal;
  finally
    frmImportar.Release;
  end;
end;

procedure TFrmECF.btnResumoClick(Sender: TObject);
begin
  if not btnResumo.Visible then
    exit;
  try
    frmResumoCaixa := TfrmResumoCaixa.Create(application);
    frmResumoCaixa.Caption := 'Resumo Caixa - Usuário:' + dados.vUsuario;
    frmResumoCaixa.BitBtn2.Visible := false;
    frmResumoCaixa.ShowModal;
  finally

    frmResumoCaixa.Release;
  end;
end;

procedure TFrmECF.btnSangriaClick(Sender: TObject);
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

procedure TFrmECF.InsereItem;
var
  vItem: Integer;
begin
  PodeAtualizarEstoque := true;

  if qryVenda.State in [dsInsert, dsEdit] then
    qryVenda.Post;

  dados.Conexao.CommitRetaining;

  if copy(EdtProduto.Text, 1, 1) = '*' then
    exit;

  if trim(EdtProduto.Text) = '' then
    exit;

  if qryPesqProd.IsEmpty then
    exit;

  if strtofloat(edtPreco.Text) <= 0 then
  begin
    ShowMessage('Produto está com o preço inválido');
    exit;
  end;

  if qryPesqProdGRADE.Value = 'S' then
    if cbGrade.KeyValue = null then
    begin
      ShowMessage('Informe a Grade do Produto');
      cbGrade.SetFocus;
      exit;
    end;

  if strtofloat(edtQtd.Text) <= 0 then
  begin
    ShowMessage('Produto está com a quantidade inválida');
  end;

  if not ValidaItem then
  begin
    EdtProduto.SetFocus;
    exit;
  end;

  qryItem.Last;
  vItem := qryItemITEM.AsInteger + 1;
  qryItem.Append;
  qryItemCODIGO.AsFloat := dados.Numerador('VENDAS_DETALHE', 'CODIGO',
    'N', '', '');
  qryItemID_PRODUTO.Value := qryPesqProdCODIGO.AsInteger;
  qryItemFKVENDA.Value := qryVendaCODIGO.Value;
  qryItemITEM.Value := vItem;
  qryItemQTD.AsString := edtQtd.Text;
  qryItemUNIDADE.AsString := qryPesqProdUNIDADE.Value;
  qryItemPRECO.AsString := edtPreco.Text;
  qryItemVALOR_ITEM.AsString := edtTotal.Text;
  qryItemCOD_BARRA.Value := qryPesqProdCODBARRA.Value;
  qryItemE_MEDIO.Value := qryPesqProdE_MEDIO.AsFloat;
  qryItemEFISCAL.Value := qryPesqProdEFISCAL.Value;
  if qryPesqProdGRADE.Value = 'S' then
    qryItemFK_GRADE.Value := cbGrade.KeyValue;
  qryItem.Post;
  dados.Conexao.CommitRetaining;

  EdtProduto.Clear;
  edtPreco.Text := '0,00';
  edtTotal.Text := '0,00';
  edtQtd.Text := '1';
  EdtProduto.SetFocus;

  dados.Conexao.CommitRetaining;
  qryItem.Refresh;

end;

procedure TFrmECF.ItemDesconhecido;
begin
  if dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    edtPreco.ReadOnly := true;
    if ehCaixaRapido = 'N' then
      edtPreco.ReadOnly := false;
  end;
  if qryPesqProdCODIGO.AsInteger = 0 then
    exit;

  if trim(EdtProduto.Text) <> '' then
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

procedure TFrmECF.qryConta_MovimentoBeforePost(DataSet: TDataSet);
begin
  if qryConta_Movimento.State = dsInsert then
    qryConta_MovimentoCODIGO.AsFloat := dados.Numerador('CONTAS_MOVIMENTO',
      'CODIGO', 'N', '', '');
end;

procedure TFrmECF.qryItemAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmECF.qryItemAfterPost(DataSet: TDataSet);
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

procedure TFrmECF.qryItemBeforeDelete(DataSet: TDataSet);
begin
  if dados.Tela <> 'FPG' then
  begin
    atualizacomposicao('+', qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
    atualizagrade('+', qryItemQTD.AsFloat, qryItemFK_GRADE.Value);
    dados.AtualizaEstoque(qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
  end;
end;

procedure TFrmECF.qryItemBeforeOpen(DataSet: TDataSet);
begin
  qryProd.Close;
  qryProd.Open;
end;

procedure TFrmECF.qryItemBeforePost(DataSet: TDataSet);
begin
  qryItemTOTAL.AsFloat := qryItemVALOR_ITEM.AsFloat - qryItemVDESCONTO.AsFloat +
    qryItemACRESCIMO.AsFloat;

  if dados.Tela <> 'FPG' then
    dados.AtualizaEstoque(-1 * qryItemQTD.AsFloat, qryItemID_PRODUTO.Value);
end;

procedure TFrmECF.qryItemQTDValidate(Sender: TField);
begin

if qryItemQTD.Value <0 then
 raise Exception.Create('Quantidade Inválida!');

if qryItemQTD.Value >9999 then
 raise Exception.Create('Quantidade maior que o permitido!!');

end;

procedure TFrmECF.qryItemVALOR_ITEMValidate(Sender: TField);
begin

if qryItemVALOR_ITEM.Value <0 then
 raise Exception.Create('Valor Inválido!');


if qryItemVALOR_ITEM.Value > 999999 then
 raise Exception.Create('Valor maior que o permitido!!');

end;

function TFrmECF.ValidaItem: Boolean;
var
  preco, percentual: real;
begin
  if dados.Tela <> 'PDV' then
    exit;

  Result := true;

  if dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
  begin
    if qryPesqProdQTD_ATUAL.Value < strtofloat(edtQtd.Text) then
    begin
      if (qryPesqProdSERVICO.Value <> 'S') then // se não for servico
      begin
        EdtProduto.Clear;
        edtQtd.Text := '1';
        edtPreco.Text := '0,00';
        edtTotal.Text := '0,00';
        ShowMessage('Estoque insuficiente!');
        Result := false;
        exit;
      end;
    end;
  end;

  preco := strtofloat(edtPreco.Text);

  if not((qryPesqProdINICIO_PROMOCAO.Value >= date) and
    (date <= qryPesqProdFIM_PROMOCAO.Value)) then // não está em promoção
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

procedure TFrmECF.qryPesqProdCalcFields(DataSet: TDataSet);
var
  Qtde: real;
  valida1, valida2: Boolean;
begin
  Qtde := 0;
  if trim(edtQtd.Text) <> '' then
    Qtde := strtofloat(edtQtd.Text);
  if (qryPesqProdINICIO_PROMOCAO.Value >= date) and
    (date <= qryPesqProdFIM_PROMOCAO.Value) then
  begin // produto em promoção
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

procedure TFrmECF.qryVendaAfterOpen(DataSet: TDataSet);
begin
  qryItem.Close;
  qryItem.Open;

end;

procedure TFrmECF.qryVendaAfterPost(DataSet: TDataSet);
begin
  if qryVendaSITUACAO.Value = 'F' then
  begin
    qryCMovimento.Close;
    qryCMovimento.Params[0].Value := qryVendaCODIGO.Value;
    qryCMovimento.Open;
    if qryCMovimento.IsEmpty then
      qryCMovimento.Insert
    else
      qryCMovimento.Edit;
    qryCMovimentoCODIGO.Value := dados.Numerador('CONTAS_MOVIMENTO', 'CODIGO',
      'N', '', '');
    qryCMovimentoID_CONTA_CAIXA.Value := qryVendaFK_CAIXA.Value;
    qryCMovimentoID_USUARIO.Value := qryVendaFK_USUARIO.Value;
    qryCMovimentoHISTORICO.Value := 'REF.VENDA Nº' + qryVendaCODIGO.AsString;
    qryCMovimentoDATA.Value := date;
    qryCMovimentoHORA.Value := TIME;
    qryCMovimentoENTRADA.Value := qryVendaTOTAL.Value;
    qryCMovimentoTROCA.AsFloat := qryVendaTOTAL_TROCA.AsFloat;
    qryCMovimentoSAIDA.Value := 0;
    qryCMovimentoFKVENDA.Value := qryVendaCODIGO.Value;
    qryCMovimentoLOTE.Value := qryVendaLOTE.Value;
    qryCMovimento.Post;

  end;
  dados.Conexao.CommitRetaining;
end;

procedure TFrmECF.qryVendaBeforeOpen(DataSet: TDataSet);
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

procedure TFrmECF.qryVendaBeforePost(DataSet: TDataSet);
begin

  if qryVendaID_CLIENTE.Value <> dados.qryConfigCLIENTE_PADRAO.Value then
  begin
    if trim(qryVendaVIRTUAL_CNPJ.Value) <> '' then
      qryVendaCPF_NOTA.Value := TiraPontos(qryVendaVIRTUAL_CNPJ.Value);
  end;

  FrmPDV.qryVendaTOTAL.Value := FrmPDV.qryVendaSUBTOTAL.Value -
    FrmPDV.qryVendaDESCONTO.Value + FrmPDV.qryVendaACRESCIMO.Value;

end;

procedure TFrmECF.qryVendaCompAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmECF.qryVendaDESCONTOValidate(Sender: TField);
begin
  qryVendaTOTAL.Value := qryVendaSUBTOTAL.Value - qryVendaDESCONTO.Value +
    qryVendaACRESCIMO.Value;
end;

procedure TFrmECF.btnReceberClick(Sender: TObject);
begin
  try
    frmConsReceber := TfrmConsReceber.Create(application);
    dados.vLancamentoCaixa := true;
    dados.vidLote := Lote;
    frmConsReceber.ShowModal;
  finally
    dados.vLancamentoCaixa := false;
    frmConsReceber.Release;
  end;
end;

procedure TFrmECF.PrecoVariavel;
begin
  if dados.qryEmpresaCAIXA_RAPIDO.AsString = 'S' then
  begin
    if qryPesqProdPRECO_VARIAVEL.Value = 'S' then
      ehCaixaRapido := 'N'
    else
      ehCaixaRapido := 'S';
  end;
end;

function TFrmECF.EhNumero(S: string): Boolean;
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

procedure TFrmECF.PesquisaCodBarra; // pesquisa codigo de barra balança
var
  vPosicao: Integer;
  vPesquisa: string;
begin

  vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
  vPesquisa := trim(copy(EdtProduto.Text, vPosicao, 1000));

  if EhNumero(vPesquisa) then
  begin
    if copy(EdtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
    begin
      qryPesqProd.Close;
      qryPesqProd.SQL.Text := vSql;
      qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
        ' AND (PRO.ATIVO=''S'')  AND (PRO.PREFIXO_BALANCA LIKE ' +
        QuotedStr(copy(vPesquisa, 1, 6) + '%') + ')' +
        ' order by PRO.PREFIXO_BALANCA', []);
      qryPesqProd.Params[0].Value := qryVendaFKEMPRESA.Value;
      qryPesqProd.Open;
    end
    else
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
  end;

  if not(qryPesqProd.IsEmpty) then
  begin
    PrecoVariavel;
    BuscaPreco;
    ItemDesconhecido;
  end;
end;

procedure TFrmECF.PesquisaDescricao; // pesquisa
var
  vPosicao, vItem: Integer;
  vPesquisa: string;
begin
  vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
  vPesquisa := trim(copy(EdtProduto.Text, vPosicao, 1000));

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

procedure TFrmECF.EdtProdutoChange(Sender: TObject);
var

  vQtd, vpreco1, vpreco2: real;

begin
  // pesquisa produtos
  if EdtProduto.ReadOnly then
    exit;

  if trim(EdtProduto.Text) <> '' then
    DBGrid2.Visible := true
  else
    DBGrid2.Visible := false;

  if dados.qryEmpresaCHECA_ESTOQUE_FISCAL.Value = 'N' then
  // FLAG mudou para ocultar estoque negativo
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
    if (trim(EdtProduto.Text) <> '') then
    begin
      PesquisaDescricao;
    end;
  end;

  if (ActiveControl <> DBLookupComboBox1) then
    EdtProduto.SetFocus;

  application.ProcessMessages;
end;

procedure TFrmECF.EdtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if copy(grpSelecao.Caption, 1, 2) = 'F1' then
  begin
    if DBGrid2.Visible then
    begin
      if Key = VK_UP then
      begin
        if ActiveControl <> DBLookupComboBox1 then
        begin
          qryPesqProd.Prior;
          BuscaPreco;
          EdtProduto.SetFocus;
        end;
      end;
      if Key = VK_DOWN then
      begin
        if ActiveControl <> DBLookupComboBox1 then
        begin
          qryPesqProd.Next;
          BuscaPreco;
          EdtProduto.SetFocus;
        end;
      end;
    end
    else
    begin
      if Key = VK_UP then
      begin
        if ActiveControl <> DBLookupComboBox1 then
        begin
          qryItem.Prior;
          EdtProduto.SetFocus;
        end;
      end;
      if Key = VK_DOWN then
      begin
        if ActiveControl <> DBLookupComboBox1 then
        begin
          qryItem.Next;
          EdtProduto.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TFrmECF.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  // produtos

  if EdtProduto.ReadOnly then
    exit;

  if (Key in [#13]) then
  begin

    if copy(grpSelecao.Caption, 1, 2) = 'F1' then
      PesquisaCodBarra;

    DBGrid2.Visible := false;

    if EdtProduto.Text <> '' then
    begin
      if ehCaixaRapido <> 'S' then
        EdtProduto.Text := qryPesqProdDESCRICAO.Value;
    end;

    if (trim(EdtProduto.Text) = '') then
    begin
      edtQtd.Text := '1';
      edtPreco.Text := '0,00';
      edtTotal.Text := '0,00';
      btnFinaliza.Click;
    end;

    if ehCaixaRapido = 'S' then
    begin
      if copy(EdtProduto.Text, 1, 1) = '*' then
      begin
        if not(Key in ['1' .. '9', #8, #9, #13, #27]) then
          Key := #0;
        if trim(copy(EdtProduto.Text, 2, Length(EdtProduto.Text))) <> '' then
          edtQtd.Text := copy(EdtProduto.Text, 2, Length(EdtProduto.Text));
        EdtProduto.Clear;
        if ActiveControl <> DBLookupComboBox1 then
          EdtProduto.SetFocus;
      end
      else
      begin
        if ActiveControl <> DBLookupComboBox1 then
          if ActiveControl = EdtProduto then
            EdtProduto.SetFocus;

        ItemDesconhecido;
        InsereItem
      end;
    end
    else if trim(EdtProduto.Text) <> '' then
    begin
      if qryPesqProdGRADE.Value = 'S' then
        cbGrade.SetFocus
      else
        edtQtd.SetFocus;
    end
    else
      EdtProduto.SetFocus;
  end;

  if ehCaixaRapido = 'S' then
  begin
    qryPesqProd.Refresh;
    EdtProduto.SetFocus;
  end;

end;

procedure TFrmECF.edtQtdEnter(Sender: TObject);
begin

  if ehCaixaRapido = 'S' then
    EdtProduto.SetFocus;
end;

procedure TFrmECF.edtQtdExit(Sender: TObject);
var
  Total: real;
begin
  Total := strtofloat(edtQtd.Text) * strtofloat(edtPreco.Text);
  if copy(EdtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
    exit;
  edtTotal.Text := FormatFloat('0.00', Total);
end;

procedure TFrmECF.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key In ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;

  if Key = #13 then
  begin
    edtPreco.SetFocus;
  end;
end;

procedure TFrmECF.FormActivate(Sender: TObject);
begin
  if Panel1.Enabled then
    EdtProduto.SetFocus;
end;

procedure TFrmECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (qryVenda.State in dsEditModes) then
    qryVenda.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TFrmECF.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.AsInteger;
  dados.qryConfig.Open;
  ehCaixaRapido := dados.qryEmpresaCAIXA_RAPIDO.AsString;

end;

procedure TFrmECF.FormKeyDown(Sender: TObject; var Key: Word;
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
    EdtProduto.SetFocus;
    EdtProduto.SelectAll;
  end;

  if Key = VK_F2 then
  begin
    btnFechavendas.Click;
  end;

  if Key = VK_F3 then
  begin
    DBLookupComboBox2.SetFocus;
    DBLookupComboBox2.DropDown;
  end;

  if Key = VK_F4 then
  begin
    DBLookupComboBox1.SetFocus;
    DBLookupComboBox1.DropDown;
  end;

  if Key = VK_F5 then
  begin
    if btnComanda.Visible then
      btnComanda.Click;
    if btnMedicamento.Visible then
      btnMedicamento.Click;
  end;

  if Key = VK_F6 then
  begin
    btnOrcamento.Click;
  end;

  if Key = VK_F7 then
  begin
    btnCancVenda.Click;
  end;

  if Key = VK_F8 then
  begin
    btnFinaliza.Click;
  end;

  if Key = VK_F9 then
  begin
    btnResumo.Click;
  end;

  if Key = VK_F10 then
  begin
    btnSangria.Click;
  end;

  if Key = VK_F11 then
  begin
    BtnSuprimento.Click;
  end;

  if Key = VK_F12 then
  begin
    btnBuscaPreco.Click;
  end;

  if Key = vk_delete then
  begin
    if ActiveControl = DBGrid1 then
    begin
      btnDelItem.Click;
      abort;
    end
    else if ActiveControl = EdtProduto then
    begin
      if EdtProduto.Text = '' then
      begin
        btnDelItem.Click;
        abort;
      end;
    end;

  end;

end;

procedure TFrmECF.InsereComposicao(produto: Integer);
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

procedure TFrmECF.Timer1Timer(Sender: TObject);
begin
  FrmPDV.Timer1.Enabled := false;
  if not btnFechavendas.Visible then
    Close;
end;

procedure TFrmECF.actBuscaExecute(Sender: TObject);
begin
  try
    FrmBuscaPreco := TFrmBuscaPreco.Create(application);
    FrmBuscaPreco.ShowModal;
  finally

    FrmBuscaPreco.Release;
  end;
end;

procedure TFrmECF.AtivarBalanca;
begin
  if ACBrBAL1.Ativo then
    ACBrBAL1.Desativar;

  // configura porta de comunicação
  ACBrBAL1.Modelo := TACBrBALModelo(dados.qryTerminalBALANCA_MARCA.AsInteger);
  ACBrBAL1.Device.HandShake :=
    TACBrHandShake(dados.qryTerminalBALANCA_HANDSHAKING.AsInteger);
  ACBrBAL1.Device.Parity := TACBrSerialParity
    (dados.qryTerminalBALANCA_PARIDADE.AsInteger);
  ACBrBAL1.Device.Stop := TACBrSerialStop
    (dados.qryTerminalBALANCA_STOPBITS.AsInteger);
  ACBrBAL1.Device.Data := dados.qryTerminalBALANCA_DATABITS.Value;
  ACBrBAL1.Device.Baud := dados.qryTerminalVELOCIDADE.AsInteger;
  ACBrBAL1.Device.Porta := dados.qryTerminalPORTA.Value;
  ACBrBAL1.ArqLOG := '';

  // Conecta com a balança
  ACBrBAL1.Ativar;

end;

procedure TFrmECF.atualizacomposicao(tipo: string; qtd_atual: real;
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

procedure TFrmECF.atualizagrade(tipo: string; qtd_atual: real;
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

function TFrmECF.Getcomputer: String;
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

function TFrmECF.UltimaVenda: Integer;
begin
  Result := 0;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select ultima_venda, ultimo_pedido from usuarios where codigo=:id';
  dados.qryConsulta.Params[0].Value := dados.IdUsuario;
  dados.qryConsulta.Open;
  if TerminalCaixa then
    Result := dados.qryConsulta.Fields[0].AsInteger
  else
    Result := dados.qryConsulta.Fields[1].AsInteger;
end;

procedure TFrmECF.FormShow(Sender: TObject);
begin
  tamanho;
  btnBalanca.Visible := false;
  if dados.qryEmpresaLER_PESO.Value = 'S' then
    btnBalanca.Visible := true;

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
  dados.qryTerminal.Open;

  if not dados.qryTerminal.Locate('nome', Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
    Close;
  end;

  TerminalCaixa := dados.qryTerminalEH_CAIXA.AsString = 'S';

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

    if not TerminalCaixa then // verifica ce o terminal é caixa
    begin
      FrmPDV.Caption := 'PV - Pedido de Venda';
      habilitacampos(true);
      btnFechavendas.Visible := false;
      btnOrcamento.Visible := false;
      btnComanda.Visible := false;
      btnResumo.Visible := false;
      btnSangria.Visible := false;
      BtnSuprimento.Visible := false;

    end
    else
    begin // verifica se caixa está aberto
      dados.qryConsulta.Close;
      dados.qryConsulta.SQL.Text :=
        'select CODIGO, DATA_ABERTURA, LOTE, SITUACAO from contas where id_usuario=:id';
      dados.qryConsulta.Params[0].Value := dados.IdUsuario;
      dados.qryConsulta.Open;

      if dados.qryConsulta.FieldByName('SITUACAO').AsString = 'A' then
      begin
        dados.idCaixa := dados.qryConsulta.Fields[0].Value;
        FrmPDV.Lote := dados.qryConsulta.Fields[2].Value;
        if dados.qryConsulta.FieldByName('DATA_ABERTURA').Value < date then
        begin
          ShowMessage('Caixa não é de hoje!');
          btnFechavendas.Visible := true;
          btnOrcamento.Enabled := false;
          btnComanda.Enabled := false;
          BtnSuprimento.Enabled := false;
          btnSangria.Enabled := false;
          btnDelItem.Enabled := false;
          btnCancVenda.Enabled := false;
          btnFinaliza.Enabled := false;
          btnReceber.Enabled := false;
          Panel1.Enabled := false;
          exit;
        end;

        habilitacampos(true);
        if not btnFechavendas.Visible then
          Timer1.Enabled := true;
        EdtProduto.SetFocus;
      end
      else
      begin
        // não existe caixa aberto para para usuario

        Try
          application.CreateForm(TfrmAbreCaixa, frmAbreCaixa);
          frmAbreCaixa.iTipo := 1;
          frmAbreCaixa.ShowModal;
        Finally
          frmAbreCaixa.Release;
        End;
      end;
    end;

    qryPesqProd.Close;
    qryPesqProd.SQL.Text := vSql;
    qryPesqProd.SQL.Text := StringReplace(qryPesqProd.SQL.Text, '/*where*/',
      'AND PRO.ATIVO=''S'' AND PRO.DESCRICAO LIKE ' +
      QuotedStr(EdtProduto.Text), []);
    qryPesqProd.Open;

    BuscaVenda;
    if qryBuscaVendaCODIGO.IsNull then
      inserevenda
    else
    begin

      qryVenda.Close;
      qryVenda.Params[0].Value := FrmPDV.qryBuscaVendaCODIGO.Value;
      qryVenda.Open;

      qryVenda.Edit;
      qryVendaDATA_EMISSAO.Value := now;
      qryVendaDATA_SAIDA.Value := now;
      qryVendaFK_CAIXA.Value := dados.idCaixa;
      qryVendaLOTE.Value := Lote;
    end;
    EdtProduto.SetFocus;
    Close;

    if not(dados.qryEmpresaRESTAURANTE.Value = 'S') then
      btnComanda.Visible := false;

    if not(dados.qryEmpresaFARMACIA.Value = 'S') then
      btnMedicamento.Visible := false;

  finally
    qryContas.Close;
    qryContas.Open;
    if qryContas.Locate('codigo', qryVendaFK_CAIXA.Value, []) then
      Caption := 'PDV - Venda de Balcão | Caixa: ' + qryContasDESCRICAO.Value;

  end;

end;

procedure TFrmECF.habilitacampos(campos: Boolean);
begin
  BtnSuprimento.Enabled := campos;
  btnSangria.Enabled := campos;
  btnFechavendas.Visible := campos;
  btnOrcamento.Enabled := campos;
  btnComanda.Enabled := campos;
  btnDelItem.Enabled := campos;
  btnCancVenda.Enabled := campos;
  btnFinaliza.Enabled := campos;
  btnReceber.Enabled := campos;
  Panel1.Enabled := campos;
end;

end.
