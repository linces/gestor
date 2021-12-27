unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ExtDlgs, Data.DB, jpeg, ACBrBase, ACBrEnterTab,
  Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, ACBrSocket, ACBrNCMs, DBCtrlsEh,
  DBLookupEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvComponentBase, JvEnterTab;

type
  TFrmCadProduto = class(TForm)
    Panel2: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    OpenPicture: TOpenPictureDialog;
    dsProdutos: TDataSource;
    dsCsoSn: TDataSource;
    qryCSTE: TFDQuery;
    qryCSTECODIGO: TStringField;
    qryCSTEDESCRICAO: TStringField;
    qryCSTETIPO: TStringField;
    dsCSTE: TDataSource;
    dsCSTIPI: TDataSource;
    qryCSTIPI: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryIBPT: TFDQuery;
    qryIBPTCODIGO: TStringField;
    qryIBPTDESCRICAO: TStringField;
    dsIBPT: TDataSource;
    qryProdutos: TFDQuery;
    qryProdutosEMPRESA: TSmallintField;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosTIPO: TStringField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosGRUPO: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosULTFORN: TIntegerField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosCSTICMS: TStringField;
    qryProdutosCSTE: TStringField;
    qryProdutosCSTS: TStringField;
    qryProdutosCSTIPI: TStringField;
    qryProdutosCSOSN: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosFOTO: TBlobField;
    qryProdutosATIVO: TStringField;
    qryProdutosGRUPO_SL: TStringField;
    qryProdutosCFOP: TStringField;
    qryProdutosVIRTUAL_GRUPO: TStringField;
    qryProdutosVIRTUAL_FORNECEDOR: TStringField;
    qryProdutosULT_COMPRA: TIntegerField;
    qryProdutosULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdutosCOD_BARRA_ATACADO: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosGRADE: TStringField;
    qryProdutosCEST: TStringField;
    qryProdutosEFISCAL: TStringField;
    qryProdutosPAGA_COMISSAO: TStringField;
    qryProdutosCOMPOSICAO: TStringField;
    qryProdutosVIRTUAL_EMPRESA: TStringField;
    qryProdutosVIRTUAL_UNIDADE: TStringField;
    qryProdutosINICIO_PROMOCAO: TDateField;
    qryProdutosFIM_PROMOCAO: TDateField;
    qryProdutosAPLICACAO: TStringField;
    qryProdutosPRECO_VARIAVEL: TStringField;
    qryComposicao: TFDQuery;
    dsComposicao: TDataSource;
    qryProd: TFDQuery;
    qryComposicaoFK_PRODUTO: TIntegerField;
    qryComposicaoID_PRODUTO: TIntegerField;
    qryComposicaoVIRTUAL_CUSTO: TExtendedField;
    qryComposicaoVIRTUAL_VENDA: TExtendedField;
    qryComposicaoTVENDA: TAggregateField;
    qryComposicaoVITUAL_PRODUTO: TStringField;
    qryProdutosSERVICO: TStringField;
    qryProdutosPRODUTO_PESADO: TStringField;
    qryProdutosDT_CADASTRO: TDateField;
    qryProdutosALIQ_ICM: TCurrencyField;
    qryProdutosALIQ_PIS: TCurrencyField;
    qryProdutosALIQ_COF: TCurrencyField;
    qryProdutosPR_CUSTO: TFMTBCDField;
    qryProdutosMARGEM: TCurrencyField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosQTD_ATUAL: TFMTBCDField;
    qryProdutosQTD_MIN: TFMTBCDField;
    qryProdutosE_MEDIO: TFMTBCDField;
    qryProdutosCOMISSAO: TCurrencyField;
    qryProdutosDESCONTO: TCurrencyField;
    qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdutosPRECO_ATACADO: TFMTBCDField;
    qryProdutosQTD_ATACADO: TFMTBCDField;
    qryProdutosALIQ_IPI: TFMTBCDField;
    qryProdutosPESO: TFMTBCDField;
    qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdutosESTOQUE_INICIAL: TFMTBCDField;
    qryProdutosPR_VENDA_PRAZO: TFMTBCDField;
    qryProdutosREDUCAO_BASE: TFMTBCDField;
    qryProdutosMVA: TFMTBCDField;
    qryProdutosFCP: TFMTBCDField;
    qryProdutosPR_CUSTO2: TFMTBCDField;
    qryProdutosPERC_CUSTO: TFMTBCDField;
    qryComposicaoQUANTIDADE: TFMTBCDField;
    qryComposicaoPRECO: TFMTBCDField;
    qryComposicaoTOTAL: TFMTBCDField;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdutosRESTAUTANTE: TStringField;
    qryProdutosTEMPO_ESPERA: TIntegerField;
    qryProdutosCOMPLEMENTO: TStringField;
    qryProdutosTIPO_RESTAURANTE: TStringField;
    qryProdutosREMEDIO: TStringField;
    dsGrade: TDataSource;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    qryGradeTQTD: TAggregateField;
    qryProdutosFK_PRINCIPIO_ATIVO: TIntegerField;
    qryProdutosPREFIXO_BALANCA: TStringField;
    dsPrincipio: TDataSource;
    qryProdutosFK_MARCA: TIntegerField;
    dsMarca: TDataSource;
    qryGradePRECO: TFMTBCDField;
    qryProdutosCFOP_EXTERNO: TIntegerField;
    qryProdutosCOMBUSTIVEL: TStringField;
    qryProdutosANP: TStringField;
    qryProdutosGLP: TFMTBCDField;
    qryProdutosGNN: TFMTBCDField;
    qryProdutosGNI: TFMTBCDField;
    qryProdutosPESO_LIQ: TFMTBCDField;
    qryProdutosCSOSN_EXTERNO: TStringField;
    qryProdutosCST_EXTERNO: TStringField;
    qryProdutosALIQ_ICMS_EXTERNO: TFMTBCDField;
    qryProdutosORIGEM: TIntegerField;
    qryProdutosVIRTUAL_ORIGEM: TStringField;
    qryProdutosDATA_PRECO: TDateField;
    qryProdutosQTD_FISCAL: TFMTBCDField;
    qryProdutosVALOR_PEQUENA: TFMTBCDField;
    qryProdutosTIPO_ALIMENTO: TStringField;
    qryProdutosVALOR_MEDIA: TFMTBCDField;
    qryProdutosVALOR_GRANDE: TFMTBCDField;
    qryProdutosTRIBUTACAO_MONOFASICA: TStringField;
    qryProdutosQTD_SABORES: TIntegerField;
    qryProdutosICMS_DIFERIDO: TFMTBCDField;
    qryProdutosIMPRIME_TICKET: TStringField;
    qryProdutosMVA_NORMAL: TFMTBCDField;
    qryProdutosSERIAL: TStringField;
    qrySerial: TFDQuery;
    qrySerialCODIGO: TIntegerField;
    qrySerialID_PRODUTO: TIntegerField;
    qrySerialNUMERO_SERIE: TStringField;
    dsSerial: TDataSource;
    qrySerialDOC_SAIDA: TStringField;
    qrySerialSITUACAO: TStringField;
    qrySerialDATA_BAIXA: TDateField;
    qryProdutosCOD_ENQ_IPI: TStringField;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabBasico: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label26: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBComboBox1: TDBComboBox;
    btnGrupo: TBitBtn;
    btnUnidade: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;


    DBEdit20: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;

    btnMarca: TBitBtn;
    DBEdit40: TDBEdit;
    DBEdit38: TDBEdit;
    GroupBox1: TGroupBox;
    DBEdit8: TDBEdit;
    TabImpostos: TTabSheet;
    Label55: TLabel;
    Label43: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label31: TLabel;
    Label29: TLabel;
    Label27: TLabel;
    Label39: TLabel;
    Label57: TLabel;
    Label38: TLabel;
    Label56: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label16: TLabel;
    SpeedButton3: TSpeedButton;
    Label20: TLabel;
    Label45: TLabel;
    Label52: TLabel;
    SpeedButton4: TSpeedButton;
    Label53: TLabel;
    Label54: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    DBCheckBox11: TDBCheckBox;
    DBEdit36: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit29: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit28: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit47: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit45: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit46: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    tabComposicao: TTabSheet;
    DBGridEh2: TDBGridEh;
    TabGrade: TTabSheet;
    Label44: TLabel;
    DBEdit37: TDBEdit;
    TabPromocao: TTabSheet;
    Label28: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit26: TDBEdit;
    TabSheetImagem: TTabSheet;
    DBImage1: TDBImage;
    tabRestaurante: TTabSheet;
    Label42: TLabel;
    Label30: TLabel;
    DBEdit35: TDBEdit;
    DBEdit3: TDBEdit;
    tabSerial: TTabSheet;
    DBGridEh3: TDBGridEh;
    Label37: TLabel;
    DBEdit23: TDBEdit;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    qryProdutosCOD_BENEFICIO: TStringField;
    Label59: TLabel;
    DBEdit34: TDBEdit;
    qryProdutosALIQ_DESON: TFMTBCDField;
    qryProdutosMOTIVO_DESONERACAO: TIntegerField;
    qryProdutosVIRTUAL_DESONERACAO: TStringField;
    dsDesoneracao: TDataSource;
    DBLookupComboBox6: TDBLookupComboBox;
    Label61: TLabel;
    DBCheckBox14: TDBCheckBox;
    qryProdutosFABRICADO: TStringField;
    qryProdutosCHATBOOT: TStringField;
    DBCheckBox15: TDBCheckBox;
    JvDBGrid1: TJvDBGrid;
    JvEnterAsTab1: TJvEnterAsTab;
    Label25: TLabel;
    DBEdit24: TDBEdit;
    DBEdit49: TDBEdit;
    Label58: TLabel;
    qryProdutosPESO_L: TFMTBCDField;
    qryProdutosPESO_B: TFMTBCDField;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Label60: TLabel;
    dsPessoa: TDataSource;
    Label62: TLabel;
    DBEdit50: TDBEdit;
    qryProdutosFK_TECIDO: TDateField;
    qryProdutosETQ: TStringField;
    qryProdutosFK_LCP: TStringField;
    qryProdutosISSQN: TFMTBCDField;
    qryProdutosTIPO_TRIBUTACAO: TStringField;
    qryProdutosID_PRODUTO_SIMILAR: TIntegerField;
    qryProdutosID_MENU: TIntegerField;
    qryProdutosCOMISSAOPERCENTUAL: TFMTBCDField;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure Button1Click(Sender: TObject);
    procedure DBImage1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure btnGrupoClick(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBLookupComboBox6Enter(Sender: TObject);
    procedure DBLookupComboboxEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure DBLookupComboBox4Enter(Sender: TObject);
    procedure DBLookupComboBox5Enter(Sender: TObject);
    procedure DBLookupComboboxEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12Exit(Sender: TObject);
    procedure qryProdutosNewRecord(DataSet: TDataSet);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure qryComposicaoID_PRODUTOChange(Sender: TField);
    procedure qryComposicaoNewRecord(DataSet: TDataSet);
    procedure qryComposicaoBeforePost(DataSet: TDataSet);
    procedure qryComposicaoAfterPost(DataSet: TDataSet);
    procedure qryProdutosAfterOpen(DataSet: TDataSet);
    procedure DBCheckBox5Click(Sender: TObject);
    procedure qryProdutosBeforePost(DataSet: TDataSet);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure qryProdutosAfterEdit(DataSet: TDataSet);
    procedure DBEdit33Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBCheckBox8Click(Sender: TObject);
    procedure qryGradeNewRecord(DataSet: TDataSet);
    procedure btnMarcaClick(Sender: TObject);
    procedure DBLookupComboboxEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure qryProdutosBeforeCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure qryProdutosCESTValidate(Sender: TField);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure qryProdutosBeforeEdit(DataSet: TDataSet);
    procedure DBCheckBox9Click(Sender: TObject);
    procedure qryProdutosAfterInsert(DataSet: TDataSet);
    procedure qrySerialNewRecord(DataSet: TDataSet);
    procedure qryGradeBeforePost(DataSet: TDataSet);
    procedure qrySerialBeforePost(DataSet: TDataSet);
    procedure qrySerialBeforeInsert(DataSet: TDataSet);
    procedure DBEdit38Exit(Sender: TObject);
    procedure DBLookupComboboxEh4Exit(Sender: TObject);
    procedure DBCheckBox7Click(Sender: TObject);
    procedure DBCheckBox14Click(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
  private
    vOperacao: String;
    vPrecoAnterior: Extended;
    vQtdAnterior: Extended;
    function ValidaCST: boolean;
    function GeraEAN(Codigo: Integer): string;
    procedure ApagaGrade;
    procedure AcertaEstoque;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses Udados, uProdutos, uGrupo, uUnidade, uTabelaIcms, uPrincipio_Ativo, uMarca;

function CalculaDigEAN13(Cod: String): String;
  function Par(Cod: Integer): boolean;
  begin
    Result := Cod Mod 2 = 0;
  end;

var
  i, SomaPar, SomaImpar: Integer;
begin
  SomaPar := 0;
  SomaImpar := 0;
  for i := 1 to 12 do
    if Par(i) then
      SomaPar := SomaPar + StrToInt(Cod[i])
    else
      SomaImpar := SomaImpar + StrToInt(Cod[i]);
  SomaPar := SomaPar * 3;
  i := 0;
  while i < (SomaPar + SomaImpar) do
    Inc(i, 10);
  Result := IntToStr(i - (SomaPar + SomaImpar));
end;

function TFrmCadProduto.GeraEAN(Codigo: Integer): string;
begin
  Result := '777' + FormatFloat('000000000', Codigo);
  Result := Result + CalculaDigEAN13(Result);
end;

procedure TFrmCadProduto.SpeedButton3Click(Sender: TObject);
begin
  if FrmTabela = nil then
    FrmTabela := TFrmTabela.Create(Application);
  FrmTabela.Show;
end;

procedure TFrmCadProduto.ApagaGrade;
begin
  dados.qryExecute.close;
  dados.qryExecute.SQL.Text :=
    'delete from produto_grade where FK_PRODUTO=:codigo';
  dados.qryExecute.Params[0].Value := qryProdutosCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

procedure TFrmCadProduto.AcertaEstoque;
var
  vQtdAjuste: Extended;
begin

  if vOperacao = 'NOVO' then
  begin
    if qryProdutosESTOQUE_INICIAL.Value > 0 then
    begin

      dados.qryAcerta.close;
      dados.qryAcerta.Open;
      dados.qryAcerta.insert;
      dados.qryAcertaCODIGO.Value := dados.Numerador('ACERTA_ESTOQUE', 'CODIGO',
        'N', '', '');
      dados.qryAcertaFKPRODUTO.Value := qryProdutosCODIGO.Value;
      dados.qryAcertaDATA.Value := Date;
      dados.qryAcertaQTD_A.AsFloat := qryProdutosQTD_ATUAL.AsFloat;
      dados.qryAcertaQTD_F.Value := 0;
      dados.qryAcertaE_S.Value := 'E';
      dados.qryAcerta.Post;
      dados.Conexao.CommitRetaining;
    end;
  end
  else
  begin

    vQtdAjuste := qryProdutosQTD_ATUAL.AsFloat - vQtdAnterior;

    if vQtdAjuste <> 0 then
    begin

      dados.qryAcerta.close;
      dados.qryAcerta.Open;
      dados.qryAcerta.insert;
      dados.qryAcertaCODIGO.Value := dados.Numerador('ACERTA_ESTOQUE', 'CODIGO',
        'N', '', '');
      dados.qryAcertaFKPRODUTO.Value := qryProdutosCODIGO.Value;
      dados.qryAcertaDATA.Value := Date;
      dados.qryAcertaQTD_F.Value := 0;
      if vQtdAjuste > 0 then
      begin
        dados.qryAcertaE_S.Value := 'E';
        dados.qryAcertaQTD_A.AsFloat := vQtdAjuste;
      end
      else
      begin
        dados.qryAcertaE_S.Value := 'S';
        dados.qryAcertaQTD_A.AsFloat := -1 * vQtdAjuste;
      end;

      dados.qryAcerta.Post;
      dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TFrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  close;
end;

function TFrmCadProduto.ValidaCST: boolean;
var
  tabelaa, tabelab: Word;
begin
  Result := true;
  if length(qryProdutosCSTICMS.AsString) <> 3 then
  begin
    ShowMessage('CST ICMS inválido');
    Result := false;
    exit;
  end;

  tabelaa := StrToInt(copy(qryProdutosCSTICMS.AsString, 1, 1));
  tabelab := StrToInt(copy(qryProdutosCSTICMS.AsString, 2, 2));

  case tabelaa of
    0 .. 7: // nada
    else
    begin
      ShowMessage('CST ICMS inválido');
      Result := false;
      exit;
    end;
  end;
  case tabelab of
    0, 10, 20, 30, 40, 41, 50, 51, 60, 70, 90: // nada
    else
    begin
      ShowMessage('CST ICMS inválido');
      Result := false;
      exit;
    end;
  end;
end;

procedure TFrmCadProduto.btnGravarClick(Sender: TObject);
var
  vProduto: String;
begin
  PageControl1.ActivePage := TabBasico;
  if (qryProdutos.State in dsEditModes) then
  begin

    if qryGrade.State in dsEditModes then
      qryGrade.Post;

    if qryComposicao.State in dsEditModes then
      qryComposicao.Post;

    DBEdit9.SetFocus;

    if (DBEdit12.Text <> 'SEM GTIN') and (trim(DBEdit12.Text) <> '') then
    begin
      dados.qryConsulta.close;
      dados.qryConsulta.SQL.Text :=
        'select codigo, descricao from produto where codbarra=:codbarra and codigo<>:cod';
      dados.qryConsulta.Params[0].Value := DBEdit12.Text;
      dados.qryConsulta.Params[1].Value := DBEdit23.Text;
      dados.qryConsulta.Open;
      if not dados.qryConsulta.IsEmpty then
      begin
        ShowMessage('Já existe produto cadastrado com este CÓDIGO DE BARRAS!' +
          sLineBreak + dados.qryConsulta.Fields[0].AsString + '-' +
          dados.qryConsulta.Fields[1].AsString);
        exit;
      end;
    end;

    dados.qryConsulta.close;
    dados.qryConsulta.SQL.Text :=
      'select codigo, descricao from produto where descricao=:descricao and codigo<>:cod';
    dados.qryConsulta.Params[0].Value := DBEdit8.Text;
    dados.qryConsulta.Params[1].Value := DBEdit23.Text;
    dados.qryConsulta.Open;
    if not dados.qryConsulta.IsEmpty then
    begin
      if Application.messageBox
        ('Já existe produto cadastrado com esta DESCRIÇÃO!' + sLineBreak +
        'Deseja Continuar?', 'Confirmação', mb_YesNo) = mrNo then
        exit;
    end;

    if not(qryProdutos.State in dsEditModes) then
      qryProdutos.Edit;

    if qryProdutosCSTICMS.AsString = '' then
      qryProdutosCSTICMS.AsString := '041';

    if qryProdutosCSTICMS.IsNull then
      qryProdutosCSTICMS.AsString := '041';

    qryProdutosCST_EXTERNO.AsString := qryProdutosCSTICMS.AsString;

    if not ValidaCST then
    begin
      DBEdit16.SetFocus;
      exit;
    end;

    if length(qryProdutosCFOP.AsString) <> 4 then
    begin
      raise Exception.Create('CFOP Inválida!');
    end;

    if (qryProdutosDESCRICAO.IsNull) or (trim(qryProdutosDESCRICAO.Value) = '')
    then
    begin
      Application.ProcessMessages;
      ShowMessage('Digite DESCRIÇÃO!');
      DBEdit8.SetFocus;
      exit;
    end;

    if qryProdutosPR_VENDA.Value = 0 then
    begin
      Application.ProcessMessages;
      ShowMessage('Digite o PREÇO DE VENDA!');
      DBEdit5.SetFocus;
      exit;
    end;

    if trim(qryProdutosUNIDADE.Value) = '' then
    begin
      Application.ProcessMessages;
      ShowMessage('Digite a UNIDADE!');
      DBLookupComboboxEh4.SetFocus;
      exit;
    end;

    if (copy(qryProdutosCSTICMS.Value, 2, 2) = '10') or
      (copy(qryProdutosCSTICMS.Value, 2, 2) = '30') or
      (copy(qryProdutosCSTICMS.Value, 2, 2) = '60') or
      (copy(qryProdutosCSTICMS.Value, 2, 2) = '70') then
    begin
      if (trim(qryProdutosCEST.Value) = '') or (qryProdutosCEST.IsNull) then
      begin
        Application.ProcessMessages;
        ShowMessage('Informe o CEST!');
        exit;
      end;
    end;

    dados.vCodProduto := qryProdutosCODIGO.Value;
    qryProdutos.Post;
    dados.Conexao.CommitRetaining;
  end;
  close;
end;

procedure TFrmCadProduto.btnGrupoClick(Sender: TObject);
begin
  try
    frmGrupo := TfrmGrupo.Create(Application);
    btnGrupo.Enabled := false;
    frmGrupo.ShowModal;

  finally
    if qryProdutos.State in dsEditModes then
      qryProdutosGRUPO.Value := dados.qryGrupoCODIGO.Value;
    btnGrupo.Enabled := true;
    DBLookupComboboxEh4.SetFocus;
    frmGrupo.Release;
  end;
end;

procedure TFrmCadProduto.btnMarcaClick(Sender: TObject);
begin
  try
    frmMarca := TfrmMarca.Create(Application);
    btnMarca.Enabled := false;
    frmMarca.ShowModal;

  finally
    if qryProdutos.State in dsEditModes then
      qryProdutosFK_MARCA.Value := dados.qryMarcaCODIGO.Value;
    btnMarca.Enabled := true;
    DBLookupComboboxEh2.SetFocus;
    frmMarca.Release;
  end;
end;

procedure TFrmCadProduto.btnUnidadeClick(Sender: TObject);
begin
  try
    frmUnidade := TfrmUnidade.Create(Application);
    btnUnidade.Enabled := false;
    frmUnidade.ShowModal;

  finally
    if qryProdutos.State in dsEditModes then
      qryProdutosUNIDADE.Value := dados.qryUnidadeCODIGO.Value;
    btnUnidade.Enabled := true;
    DBEdit11.SetFocus;
    frmUnidade.Release;
  end;

end;

procedure TFrmCadProduto.Button1Click(Sender: TObject);
begin
  qryProdutosFOTO.Clear;
  DBImage1.Picture := nil;
end;

procedure TFrmCadProduto.DBCheckBox14Click(Sender: TObject);
begin

  if DBCheckBox14.Checked then
  begin
    tabComposicao.TabVisible := true;
    tabComposicao.Caption := 'Itens Produto';
    DBCheckBox5.Checked := false;
  end;

  if not DBCheckBox14.Checked then
  begin
    tabComposicao.TabVisible := false;
  end;

end;

procedure TFrmCadProduto.DBCheckBox4Click(Sender: TObject);
begin
 if DBCheckBox4.Checked then begin
  dbedit50.Visible := true;
  label62.Visible := true;
 end;
 if not DBCheckBox4.Checked then begin
  dbedit50.Visible := false;
  label62.Visible := false;
 end;
end;

procedure TFrmCadProduto.DBCheckBox5Click(Sender: TObject);
begin

  if DBCheckBox5.Checked then
  begin
    tabComposicao.TabVisible := true;
    DBCheckBox14.Checked := false;
    tabComposicao.Caption := 'Composição';
  end;

  if not DBCheckBox5.Checked then
  begin
    tabComposicao.TabVisible := false;
  end;

end;

procedure TFrmCadProduto.DBCheckBox7Click(Sender: TObject);
begin
  if DBCheckBox7.Checked then
    tabSerial.TabVisible := true;

  if not DBCheckBox7.Checked then
    tabSerial.TabVisible := false;
end;

procedure TFrmCadProduto.DBCheckBox8Click(Sender: TObject);
begin
  if DBCheckBox8.Checked then
    TabGrade.TabVisible := true;

  if not DBCheckBox8.Checked then
    TabGrade.TabVisible := false;
end;

procedure TFrmCadProduto.DBCheckBox9Click(Sender: TObject);
begin
  if DBCheckBox9.Checked then
    tabRestaurante.TabVisible := true;

  if not DBCheckBox9.Checked then
    tabRestaurante.TabVisible := false;

end;

procedure TFrmCadProduto.DBComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnUnidade.Click;
end;

procedure TFrmCadProduto.DBEdit11Exit(Sender: TObject);
begin
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;
  qryProdutosPR_CUSTO2.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO.AsFloat +
    (qryProdutosPR_CUSTO.AsFloat * qryProdutosPERC_CUSTO.AsFloat / 100), -2);
end;

procedure TFrmCadProduto.DBEdit12Exit(Sender: TObject);
begin
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

  if trim(DBEdit12.EditText) = '' then
    DBEdit12.Text := GeraEAN(qryProdutosCODIGO.AsInteger);
  qryProdutosCODBARRA.Value := DBEdit12.Text;
end;

procedure TFrmCadProduto.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    SpeedButton3.Click;
end;

procedure TFrmCadProduto.DBEdit1Exit(Sender: TObject);
begin
  if trim(DBEdit1.EditText) = '' then
    DBEdit1.EditText := DBEdit23.EditText;

end;

procedure TFrmCadProduto.DBEdit24Exit(Sender: TObject);
begin
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

end;

procedure TFrmCadProduto.DBEdit32Exit(Sender: TObject);
begin
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

  qryProdutosPR_CUSTO2.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO.AsFloat +
    (qryProdutosPR_CUSTO.AsFloat * qryProdutosPERC_CUSTO.AsFloat / 100), -2);

  qryProdutosPR_VENDA.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO2.AsFloat +
    (qryProdutosPR_CUSTO2.AsFloat * qryProdutosMARGEM.AsFloat / 100), -2);

end;

procedure TFrmCadProduto.DBEdit33Exit(Sender: TObject);
begin
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

  if qryProdutosPR_CUSTO.Value > 0 then

    qryProdutosPERC_CUSTO.AsFloat :=
      SimpleRoundTo(((qryProdutosPR_CUSTO2.AsFloat * 100) /
      qryProdutosPR_CUSTO.AsFloat) - 100, -2);

  if qryProdutosPERC_CUSTO.AsFloat < 0 then
    qryProdutosPERC_CUSTO.AsFloat := 0;

  qryProdutosPR_VENDA.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO2.AsFloat +
    (qryProdutosPR_CUSTO2.AsFloat * qryProdutosMARGEM.AsFloat / 100), -2);

end;

procedure TFrmCadProduto.DBEdit38Exit(Sender: TObject);
begin
  if (qryProdutosPREFIXO_BALANCA.IsNull) or
    (trim(qryProdutosPREFIXO_BALANCA.AsString) = '') then
    qryProdutosPREFIXO_BALANCA.AsInteger := 2000000 +
      qryProdutosCODIGO.AsInteger;
end;

procedure TFrmCadProduto.DBEdit4Exit(Sender: TObject);
begin

  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

  qryProdutosPR_VENDA.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO2.AsFloat +
    (qryProdutosPR_CUSTO2.AsFloat * qryProdutosMARGEM.AsFloat / 100), -2);

end;

procedure TFrmCadProduto.DBEdit5Exit(Sender: TObject);
begin

  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;

  if qryProdutosPR_CUSTO.Value > 0 then
    qryProdutosMARGEM.AsFloat :=
      ((qryProdutosPR_VENDA.AsFloat * 100) /
      qryProdutosPR_CUSTO2.AsFloat) - 100;

  if qryProdutosMARGEM.Value < 0 then
    qryProdutosMARGEM.AsFloat := 0;

end;

procedure TFrmCadProduto.DBImage1Click(Sender: TObject);
var
  JPG: TJPegImage;
  Bmp: TBitmap;
begin
  if (qryProdutos.State in dsEditModes) then
  begin
    OpenPicture.Execute;
    if OpenPicture.FileName <> '' then
    begin
      JPG := TJPegImage.Create;
      JPG.LoadFromFile(OpenPicture.FileName);
      Bmp := TBitmap.Create;
      Bmp.Assign(JPG);
      JPG.Free;
      DBImage1.Picture.Bitmap.Assign(Bmp);
      Bmp.Free;
    end;
  end;
end;

procedure TFrmCadProduto.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboBox2Enter(Sender: TObject);
begin
  DBLookupComboBox2.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboBox3Enter(Sender: TObject);
begin
  DBLookupComboBox3.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboBox4Enter(Sender: TObject);
begin
  DBLookupComboBox4.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboBox5Enter(Sender: TObject);
begin
  DBLookupComboBox5.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboBox6Enter(Sender: TObject);
begin
  DBLookupComboBox6.DropDown;
end;

procedure TFrmCadProduto.DBLookupComboboxEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if Key = VK_F2 then
//    btnMarca.Click;
end;

procedure TFrmCadProduto.DBLookupComboboxEh3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnGrupo.Click;
end;

procedure TFrmCadProduto.DBLookupComboboxEh4Exit(Sender: TObject);
var
  prefixo: string;
  barra: Integer;
begin

  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;
  if (DBLookupComboboxEh4.Text = 'KG') then
  begin
    if qryProdutosPREFIXO_BALANCA.IsNull then
    begin
      prefixo := '2' + dados.qryConfigZERO_BALANCA.AsString;
      barra := StrToIntDef(prefixo, 2000000) + qryProdutosCODIGO.AsInteger;
      qryProdutosPREFIXO_BALANCA.AsInteger := barra;
    end;
  end;

end;

procedure TFrmCadProduto.DBLookupComboboxEh4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnUnidade.Click;
end;

procedure TFrmCadProduto.dsProdutosDataChange(Sender: TObject; Field: TField);
begin

  if DBCheckBox8.Checked then
    TabGrade.TabVisible := true
  else
    TabGrade.TabVisible := false;

  if DBCheckBox7.Checked then
    tabSerial.TabVisible := true
  else
    tabSerial.TabVisible := false;

  if (DBCheckBox5.Checked) or (DBCheckBox14.Checked) then
    tabComposicao.TabVisible := true
  else
    tabComposicao.TabVisible := false;

  if DBCheckBox9.Checked then
    tabRestaurante.TabVisible := true
  else
    tabRestaurante.TabVisible := false;

end;

procedure TFrmCadProduto.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
  begin
    if qryProdutosGRADE.Value = 'S' then
    begin
      if qryProdutosQTD_ATUAL.AsFloat <> qryGradeTQTD.Value then
      begin
        Action := caNone;
        raise Exception.Create
          ('Quantidade em Grade é Diferente de Estoque Atual!!');
      end;
    end;
  end;

  if (qryProdutos.State in dsEditModes) then
  begin
    qryProdutos.Cancel;
    dados.vCodProduto := 0;
  end;
end;

procedure TFrmCadProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravar.Click;
  if Key = VK_ESCAPE then
  begin
    if ActiveControl <> DBGridEh2 then
    begin
      if Application.messageBox('Tem Certeza de que deseja sair da tela?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelar.Click;
      end
    end;
  end;

end;

procedure TFrmCadProduto.cbEmpresaEnter(Sender: TObject);
begin
  // ACBrEnterTab1.EnterAsTab := false;
end;

procedure TFrmCadProduto.cbEmpresaExit(Sender: TObject);
begin

  // ACBrEnterTab1.EnterAsTab := true;
end;

procedure TFrmCadProduto.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(FrmCadProduto.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmCadProduto.FormShow(Sender: TObject);
begin

  dados.qryCSOSN.close;
  dados.qryCSOSN.Open;

  qryCSTE.close;
  qryCSTE.Open;

  qryCSTIPI.close;
  qryCSTIPI.Open;

  qryIBPT.close;
  qryIBPT.Open;

  dados.qryUnidade.close;
  dados.qryUnidade.SQL.Text := 'select * from unidade /*where*/';
  dados.qryUnidade.Open;

  dados.qryPesqEmp.close;
  dados.qryPesqEmp.Open;

  dados.qryDesoneracao.close;
  dados.qryDesoneracao.Open;

  dados.qryPessoas.Open;

  PageControl1.ActivePage := TabBasico;

  DBEdit8.SetFocus;
  if tag = 1 then
    DBEdit11.SetFocus;

end;

procedure TFrmCadProduto.qryComposicaoAfterPost(DataSet: TDataSet);
var
  total: Extended;
begin
  total := 0;

  if qryComposicaoTVENDA.AsVariant > 0 then
    total := qryComposicaoTVENDA.Value;

  dados.Conexao.CommitRetaining;
  if not(qryProdutos.State in dsEditModes) then
    qryProdutos.Edit;
  qryProdutosPR_CUSTO.Value := total;
  qryProdutosPR_VENDA.AsFloat := SimpleRoundTo(qryProdutosPR_CUSTO.AsFloat +
    (qryProdutosPR_CUSTO.AsFloat * qryProdutosMARGEM.AsFloat / 100), -2);
  qryProdutos.Post;
end;

procedure TFrmCadProduto.qryComposicaoBeforePost(DataSet: TDataSet);
begin
  qryComposicaoTOTAL.Value := qryComposicaoQUANTIDADE.AsFloat *
    qryComposicaoPRECO.AsFloat;
end;

procedure TFrmCadProduto.qryComposicaoID_PRODUTOChange(Sender: TField);
begin
  if qryComposicao.State in dsEditModes then
    qryComposicaoPRECO.Value := qryComposicaoVIRTUAL_VENDA.Value;
end;

procedure TFrmCadProduto.qryComposicaoNewRecord(DataSet: TDataSet);
begin
  qryComposicaoFK_PRODUTO.Value := qryProdutosCODIGO.Value;
  qryComposicaoQUANTIDADE.Value := 1;
  qryComposicaoPRECO.Value := 0;
  qryComposicaoTOTAL.Value := 0;
end;

procedure TFrmCadProduto.qryGradeBeforePost(DataSet: TDataSet);
begin
  if qryGrade.State = dsInsert then
    qryGradeCODIGO.Value := dados.Numerador('PRODUTO_GRADE', 'CODIGO',
      'N', '', '');
end;

procedure TFrmCadProduto.qryGradeNewRecord(DataSet: TDataSet);
begin
  qryGradeFK_PRODUTO.Value := qryProdutosCODIGO.Value;

end;

procedure TFrmCadProduto.qryProdutosAfterEdit(DataSet: TDataSet);
begin

  vQtdAnterior := qryProdutosQTD_ATUAL.AsFloat;

  if Pos('.', qryProdutosREFERENCIA.Value) > 0 then
    qryProdutosREFERENCIA.Value := copy(qryProdutosREFERENCIA.Value, 1,
      length(qryProdutosREFERENCIA.Value) - 1);
end;

procedure TFrmCadProduto.qryProdutosAfterInsert(DataSet: TDataSet);
begin
  vQtdAnterior := 0;
end;

procedure TFrmCadProduto.qryProdutosAfterOpen(DataSet: TDataSet);
begin

  dados.qryGrupo.close;
  dados.qryGrupo.Open;

  dados.qryUnidade.close;
  dados.qryUnidade.Open;

  dados.qryFornecedor.close;
  dados.qryFornecedor.Open;

  qryComposicao.close;
  qryComposicao.Open;

  qrySerial.close;
  qrySerial.Params[0].Value := qryProdutosCODIGO.Value;
  qrySerial.Open;

  dados.qryMarca.close;
  dados.qryMarca.SQL.Text := 'select * from Marca /*where*/';
  dados.qryMarca.Open;

  dados.qryPrincipio.close;
  dados.qryPrincipio.SQL.Text := ' select * from principio_ativo' + ' /*where*/'
    + ' order by descricao';
  dados.qryPrincipio.Open;

  qryGrade.close;
  qryGrade.Open;

end;

procedure TFrmCadProduto.qryProdutosAfterPost(DataSet: TDataSet);
begin

  AcertaEstoque;

  if qryProdutosGRADE.Value = 'N' then
    ApagaGrade;

  vQtdAnterior := 0;
  vOperacao := '';

end;

procedure TFrmCadProduto.qryProdutosBeforeCancel(DataSet: TDataSet);
begin
  if qryProdutos.State = dsInsert then
    ApagaGrade;
end;

procedure TFrmCadProduto.qryProdutosBeforeEdit(DataSet: TDataSet);
begin
  vPrecoAnterior := qryProdutosPR_VENDA.AsFloat;
end;

procedure TFrmCadProduto.qryProdutosBeforePost(DataSet: TDataSet);
begin

  vOperacao := 'ALTERAR';

  if qryProdutos.State = dsEdit then
  begin
    if vQtdAnterior <> qryProdutosQTD_ATUAL.AsFloat then
    begin

    end;
  end;

  if vPrecoAnterior <> qryProdutosPR_VENDA.AsFloat then
    qryProdutosDATA_PRECO.AsDateTime := Date;

  if qryProdutos.State = dsInsert then
  begin
    vOperacao := 'NOVO';
    qryProdutosCODIGO.Value := dados.Numerador('PRODUTO', 'CODIGO',
      'N', '', '');
    qryProdutosESTOQUE_INICIAL.AsFloat := qryProdutosQTD_ATUAL.AsFloat;
  end;

  if length(qryProdutosCFOP.AsString) <> 4 then
  begin
    raise Exception.Create('CFOP Inválida!');
  end;

  if length(qryProdutosNCM.AsString) <> 8 then
  begin
    raise Exception.Create('NCM Inválido!');
  end;

  if (trim(qryProdutosCODBARRA.AsString) = '') or (qryProdutosCODBARRA.IsNull)
  then
    qryProdutosCODBARRA.Value := 'SEM GTIN';

  if (trim(qryProdutosREFERENCIA.AsString) = '') or
    (qryProdutosREFERENCIA.IsNull) then
    qryProdutosREFERENCIA.Value := qryProdutosCODIGO.AsString;

end;

procedure TFrmCadProduto.qryProdutosCESTValidate(Sender: TField);
begin
  if (not(qryProdutosCEST.IsNull)) and (trim(qryProdutosCEST.Value) <> '') then
    if (length(qryProdutosCEST.Value) <> 7) then
      raise Exception.Create('CEST Inválido!');
end;

procedure TFrmCadProduto.qryProdutosNewRecord(DataSet: TDataSet);
begin
  qryProdutosCODIGO.Value := dados.Numerador('PRODUTO', 'CODIGO', 'N', '', '');
  qryProdutosATIVO.Value := 'S';
  qryProdutosPR_VENDA.Value := 0;
  qryProdutosPR_CUSTO.Value := 0;
  qryProdutosQTD_MIN.Value := 1;
  qryProdutosE_MEDIO.Value := 0;
  qryProdutosNCM.Value := '00000000';
  qryProdutosMARGEM.AsFloat := dados.qryEmpresaLUCRO_PADRAO.AsFloat;
  qryProdutosQTD_ATUAL.Value := 0;
  qryProdutosQTD_ATACADO.Value := 0;
  qryProdutosPESO_L.Value := 0;
  qryProdutosPESO_B.Value := 0;
  qryProdutosICMS_DIFERIDO.Value := 0;
  qryProdutosCOMBUSTIVEL.Value := 'N';
  qryProdutosPRODUTO_PESADO.Value := 'N';
  qryProdutosFABRICADO.Value := 'N';
  qryProdutosCHATBOOT.Value := 'N';
  qryProdutosPAGA_COMISSAO.Value := 'N';
  qryProdutosEFISCAL.Value := 'S';
  qryProdutosSERVICO.Value := 'N';
  qryProdutosPRECO_VARIAVEL.Value := 'N';
  qryProdutosCOMPOSICAO.Value := 'N';
  qryProdutosRESTAUTANTE.Value := 'N';
  qryProdutosSERVICO.Value := 'N';
  qryProdutosSERIAL.Value := 'N';
  qryProdutosGRADE.Value := 'N';
  qryProdutosCOMPOSICAO.Value := 'N';
  qryProdutosPRECO_VARIAVEL.Value := 'N';
  qryProdutosPR_CUSTO_ANTERIOR.Value := 0;
  qryProdutosPR_VENDA_ANTERIOR.Value := 0;
  qryProdutosQTD_FISCAL.Value := 0;
  qryProdutosULT_COMPRA.Value := 0;
  qryProdutosMVA_NORMAL.AsFloat := 0;
  qryProdutosULT_COMPRA_ANTERIOR.Value := 0;
  qryProdutosEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryProdutosPRECO_ATACADO.Value := 0;
  qryProdutosCFOP.Value := dados.qryEmpresaCFOP.Value;
  qryProdutosALIQ_ICM.Value := dados.qryEmpresaALIQ_ICMS.AsFloat;
  qryProdutosALIQ_PIS.Value := dados.qryEmpresaALIQ_PIS.AsFloat;
  qryProdutosALIQ_COF.Value := dados.qryEmpresaALIQ_COF.AsFloat;
  qryProdutosALIQ_IPI.Value := dados.qryEmpresaALIQ_IPI.AsFloat;
  qryProdutosCSTICMS.Value := dados.qryEmpresaCST_ICMS.Value;
  qryProdutosCSTE.Value := dados.qryEmpresaCST_ENTRADA.Value;
  qryProdutosCSTS.Value := dados.qryEmpresaCST_SAIDA.Value;
  qryProdutosCSTIPI.Value := dados.qryEmpresaCST_IPI.Value;
  qryProdutosCSOSN.Value := dados.qryEmpresaCSOSN.Value;
  qryProdutosDATA_PRECO.Value := Date;
  qryProdutosORIGEM.Value := 0;

  qryProdutosCFOP_EXTERNO.AsString := dados.qryEmpresaCFOP_EXTERNO.Value;
  qryProdutosCST_EXTERNO.AsString := dados.qryEmpresaCST_EXTERNO.Value;
  qryProdutosCSOSN_EXTERNO.AsString := dados.qryEmpresaCSOSN_EXTERNO.Value;
  qryProdutosALIQ_ICMS_EXTERNO.AsFloat :=
    dados.qryEmpresaALIQ_ICMS_EXTERNO.AsFloat;

  qryProdutosCOMISSAO.Value := 0;
  qryProdutosDESCONTO.Value := 0;

  qryProdutosDT_CADASTRO.Value := Date;
  qryProdutosTIPO.Value := '00-MERCADORIA PARA REVENDA';
end;

procedure TFrmCadProduto.qrySerialBeforeInsert(DataSet: TDataSet);
begin
  if qryProdutos.State = dsInsert then
    qryProdutos.Post;
  dados.Conexao.CommitRetaining;
  qryProdutos.Edit;
end;

procedure TFrmCadProduto.qrySerialBeforePost(DataSet: TDataSet);
begin

  qrySerialNUMERO_SERIE.AsString := UpperCase(qrySerialNUMERO_SERIE.Value);

  if qrySerial.State = dsInsert then
    qrySerialCODIGO.Value := dados.Numerador('PRODUTO_SERIAL', 'CODIGO',
      'N', '', '');

end;

procedure TFrmCadProduto.qrySerialNewRecord(DataSet: TDataSet);
begin
  qrySerialID_PRODUTO.Value := qryProdutosCODIGO.Value;
end;

end.

{ TODO -oUCadProduto -cGrade : 18-07-2019 - Mudando o componente DGBRID da grade }
