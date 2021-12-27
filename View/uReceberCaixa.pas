unit uReceberCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, ACBrBase, ACBrEnterTab,
  Vcl.ComCtrls, Vcl.Tabs;

type
  TfrmReceberCaixa = class(TForm)
    Panel4: TPanel;
    dsCR: TDataSource;
    qryCR: TFDQuery;
    qryCaixa: TFDQuery;
    qryCaixaCODIGO: TIntegerField;
    qryCaixaEMISSAO: TDateField;
    qryCaixaDOC: TStringField;
    qryCaixaFKPLANO: TIntegerField;
    qryCaixaFKCONTA: TIntegerField;
    qryCaixaHISTORICO: TStringField;
    qryCaixaFKVENDA: TIntegerField;
    qryCaixaFKCOMPRA: TIntegerField;
    qryCaixaFKPAGAR: TIntegerField;
    qryCaixaFKRECEBER: TIntegerField;
    qryCaixaTRANSFERENCIA: TIntegerField;
    qryCaixaBLOQUEADO: TStringField;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    qryPlanoDC: TStringField;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    qryRecebimento: TFDQuery;
    dsCRR: TDataSource;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
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
    qryCRRAZAO: TStringField;
    qryRecebimentoCODIGO: TIntegerField;
    qryRecebimentoFKCLIENTE: TIntegerField;
    qryRecebimentoFKRECEBER: TIntegerField;
    qryRecebimentoDATA: TDateField;
    qryRecebimentoFKPLANO: TIntegerField;
    qryRecebimentoFKUSUARIO: TIntegerField;
    qryRecebimentoFKKEMPRESA: TIntegerField;
    qryRecebimentoFKCONTA: TIntegerField;
    qryRecebimentoFK_FORMA_PGTO: TIntegerField;
    qryRecebimentoNUMERO_CHEQUE: TIntegerField;
    qryRecebimentoTSALDO: TFloatField;
    dsPlano: TDataSource;
    qryConta: TFDQuery;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    dsConta: TDataSource;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRTIPO: TStringField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryRecebimentoVALOR_PARCELA: TFMTBCDField;
    qryRecebimentoPERC_JUROS: TFMTBCDField;
    qryRecebimentoJUROS: TFMTBCDField;
    qryRecebimentoPERC_DESCONTO: TFMTBCDField;
    qryRecebimentoDESCONTO: TFMTBCDField;
    qryRecebimentoVALOR_RECEBIDO: TFMTBCDField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    Panel5: TPanel;
    Label18: TLabel;
    cbCliente: TDBLookupComboboxEh;
    Panel12: TPanel;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    dbGrid1: TDBGridEh;
    Panel6: TPanel;
    btnBaixar: TSpeedButton;
    TabSet1: TTabSet;
    TabSet2: TTabSet;
    Panel7: TPanel;
    Label9: TLabel;
    DBText11: TDBText;
    TabSheet5: TTabSheet;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBText1: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    Panel3: TPanel;
    btnEstornar: TSpeedButton;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label20: TLabel;
    Label17: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupCombobox1: TDBLookupComboboxEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    Label10: TLabel;
    DBText3: TDBText;
    Label11: TLabel;
    DBText4: TDBText;
    Label12: TLabel;
    DBText5: TDBText;
    Label13: TLabel;
    DBText6: TDBText;
    Label14: TLabel;
    DBText7: TDBText;
    Label15: TLabel;
    DBText8: TDBText;
    Label16: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    procedure qryCRAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryRecebimentoCalcFields(DataSet: TDataSet);
    procedure qryRecebimentoNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBLookupCombobox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCombobox1Exit(Sender: TObject);
    procedure DBLookupCombobox1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceberCaixa: TfrmReceberCaixa;

implementation

{$R *.dfm}

uses Udados, uVendaCartao;

procedure TfrmReceberCaixa.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReceberCaixa.btnGravarClick(Sender: TObject);
var
  Valor1, valor2: Extended;
begin

  DBEdit2.SetFocus;

  if (qryRecebimentoFKPLANO.IsNull) or (qryRecebimentoFKPLANO.AsInteger = 0)
  then
  begin
    ShowMessage('Digite PLANO DE CONTAS!');
    DBLookupCombobox1.SetFocus;
    exit;
  end;

  if (qryRecebimentoFKCONTA.IsNull) then
  begin
    ShowMessage('Configure a conta caixa no cadastro de empresa!');
    DBLookupComboboxEh1.SetFocus;
    exit;
  end;

  if qryRecebimentoDATA.IsNull then
  begin
    ShowMessage('Digite DATA DE  PAGAMENTO!');
    DBDateTimeEditEh1.SetFocus;
    exit;
  end;
  Valor1 := SimpleRoundTo(qryRecebimentoVALOR_RECEBIDO.AsFloat, -2);
  valor2 := SimpleRoundTo(qryRecebimentoTSALDO.Value, -2);
  if (Valor1 > valor2) then
  begin
    ShowMessage('VALOR RECEBIDO não pode ser maior que valor da conta!');
    DBEdit4.SetFocus;
    exit;
  end;

  if valor2 > 0 then
  begin
    if not(qryRecebimentoVALOR_RECEBIDO.Value > 0) then
    begin
      ShowMessage('Digite o valor Recebido!');
      DBEdit4.SetFocus;
      exit;
    end;
  end;

  try
    btnGravar.Enabled := false;
    try
      if (qryRecebimento.State in dsEditModes) then
        qryRecebimento.Post;
      Dados.Conexao.CommitRetaining;

      qryCaixa.Close;
      qryCaixa.Params[0].Value := qryRecebimentoCODIGO.AsString;
      qryCaixa.Open;

      if qryCaixa.IsEmpty then
      begin
        qryCaixa.Insert;
        qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
      end
      else
        qryCaixa.Edit;
      qryCaixaEMISSAO.Value := qryRecebimentoDATA.Value;
      qryCaixaDOC.AsString := 'REC.' + qryCRCODIGO.AsString + '/' +
        qryRecebimentoCODIGO.AsString;
      qryCaixaHORA_EMISSAO.Value := Now;
      qryCaixaTIPO_MOVIMENTO.Value := 'RE';
      qryCaixaFKCONTA.Value := qryRecebimentoFKCONTA.Value;
      qryCaixaFKPLANO.Value := qryRecebimentoFKPLANO.Value;
      qryCaixaHISTORICO.Value := qryCRRAZAO.Value;
      qryCaixaENTRADA.Value := qryRecebimentoVALOR_RECEBIDO.Value;
      qryCaixaSAIDA.Value := 0;
      qryCaixaFKRECEBER.Value := qryRecebimentoCODIGO.Value;
      qryCaixaEMPRESA.Value := qryCRFKEMPRESA.Value;
      qryCaixa.Post;
      Dados.Conexao.CommitRetaining;

      Dados.qrysomarec.Close;
      Dados.qrysomarec.Params[0].Value := qryCRCODIGO.Value;
      Dados.qrysomarec.Open;

      qryCR.Edit;
      qryCRDATA_RECEBIMENTO.Value := qryRecebimentoDATA.Value;
      qryCRDESCONTO.Value := Dados.qrysomarecDESCONTO.AsFloat;
      qryCRJUROS.Value := Dados.qrysomarecJUROS.AsFloat;
      qryCRVRECEBIDO.Value := Dados.qrysomarecRECEBIDO.AsFloat;
      qryCRVL_RESTANTE.Value := qryCRVALOR.AsFloat -
        (qryCRVRECEBIDO.AsFloat - qryCRJUROS.AsFloat + qryCRDESCONTO.AsFloat);
      if qryCRVL_RESTANTE.Value = 0 then
        qryCRSITUACAO.Value := 'T';

      if (qryCRVL_RESTANTE.Value > 0) and (qryCRVRECEBIDO.Value > 0) then
        qryCRSITUACAO.Value := 'P';
      qryCR.Post;
      Dados.Conexao.CommitRetaining;
      Application.ProcessMessages;
      ShowMessage('Baixa de título efetuada com sucesso!');
      Close;

    except
      on E: Exception do
      begin
        raise Exception.create('Erro ao Baixar parcela!' + #13 + E.Message);
      end;
    end;
  finally
    btnGravar.Enabled := true;
  end;

end;

procedure TfrmReceberCaixa.DBEdit1Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoPERC_JUROS.Value :=
    (qryRecebimentoJUROS.Value / qryRecebimentoVALOR_PARCELA.Value) * 100;
end;

procedure TfrmReceberCaixa.DBEdit5Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoPERC_DESCONTO.Value :=
    (qryRecebimentoDESCONTO.Value / qryRecebimentoVALOR_PARCELA.Value) * 100;
end;

procedure TfrmReceberCaixa.DBEdit6Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoDESCONTO.Value :=
    SimpleRoundTo((qryRecebimentoVALOR_PARCELA.AsFloat *
    qryRecebimentoPERC_DESCONTO.AsFloat) / 100, -2);
end;

procedure TfrmReceberCaixa.DBEdit7Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoJUROS.Value :=
    SimpleRoundTo((qryRecebimentoVALOR_PARCELA.AsFloat *
    qryRecebimentoPERC_JUROS.AsFloat) / 100, -2);
end;

procedure TfrmReceberCaixa.DBLookupCombobox1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmReceberCaixa.DBLookupCombobox1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmReceberCaixa.DBLookupCombobox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmReceberCaixa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmReceberCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmReceberCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = vk_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do contas a receber?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmReceberCaixa.FormShow(Sender: TObject);
begin
  qryRecebimento.Close;
  qryRecebimento.Params[0].Value := qryCRCODIGO.Value;
  qryRecebimento.Open;
  qryRecebimento.Insert;
  DBLookupCombobox1.SetFocus;
end;

procedure TfrmReceberCaixa.qryCRAfterOpen(DataSet: TDataSet);
begin
  qryPlano.Close;
  qryPlano.Open;

  qryConta.Close;
  qryConta.Open;

end;

procedure TfrmReceberCaixa.qryRecebimentoCalcFields(DataSet: TDataSet);
begin
  qryRecebimentoTSALDO.Value := qryCRVL_RESTANTE.AsFloat -
    qryRecebimentoDESCONTO.AsFloat + qryRecebimentoJUROS.AsFloat;
end;

procedure TfrmReceberCaixa.qryRecebimentoNewRecord(DataSet: TDataSet);
begin
  qryRecebimentoCODIGO.Value := Dados.Numerador('CRRECEBIMENTO', 'CODIGO',
    'N', '', '');
  qryRecebimentoFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryRecebimentoFK_FORMA_PGTO.Value := 1; // dinheiro
  qryRecebimentoFKRECEBER.Value := qryCRCODIGO.Value;
  qryRecebimentoDATA.Value := DATE;
  qryRecebimentoVALOR_PARCELA.Value := qryCRVL_RESTANTE.Value;
  qryRecebimentoPERC_JUROS.Value := 0;
  qryRecebimentoJUROS.Value := 0;
  qryRecebimentoPERC_DESCONTO.Value := 0;
  qryRecebimentoDESCONTO.Value := 0;
  qryRecebimentoVALOR_RECEBIDO.Value := 0;
  qryRecebimentoFKKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
end;

end.
