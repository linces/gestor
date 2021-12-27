unit uBaixaPagar;

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
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, ACBrBase, ACBrEnterTab;

type
  TfrmBaixaPagar = class(TForm)
    Panel4: TPanel;
    dsCP: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    qryCP: TFDQuery;
    Label20: TLabel;
    DBEdit3: TDBEdit;
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
    Label17: TLabel;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    qryPlanoDC: TStringField;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    qryCPCODIGO: TIntegerField;
    qryCPDATA: TDateField;
    qryCPFKFORNECE: TIntegerField;
    qryCPDOC: TStringField;
    qryCPDTVENCIMENTO: TDateField;
    qryCPHISTORICO: TStringField;
    qryCPDATA_PAGAMENTO: TDateField;
    qryCPSITUACAO: TStringField;
    qryCPFKEMPRESA: TIntegerField;
    qryCPRAZAO: TStringField;
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
    ACBrEnterTab1: TACBrEnterTab;
    qryCPFK_COMPRA: TIntegerField;
    dsPlano: TDataSource;
    qryPagamento: TFDQuery;
    dsCPP: TDataSource;
    qryPagamentoCODIGO: TIntegerField;
    qryPagamentoFKPAGAR: TIntegerField;
    qryPagamentoDATA: TDateField;
    qryPagamentoFKPLANO: TIntegerField;
    qryPagamentoFKUSUARIO: TIntegerField;
    qryPagamentoFKKEMPRESA: TIntegerField;
    qryPagamentoFKCONTA: TIntegerField;
    qryPagamentoFK_FORMA_PGTO: TIntegerField;
    qryPagamentoNUMERO_CHEQUE: TIntegerField;
    qryPagamentoFKFORNECEDOR: TIntegerField;
    qryPagamentoTSALDO: TFloatField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    DBLookupCombobox1: TDBLookupComboboxEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label5: TLabel;
    qryConta: TFDQuery;
    dsConta: TDataSource;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    qrSaldo: TFDQuery;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCPVALOR: TCurrencyField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
    qrSaldoSALDO: TFMTBCDField;
    qryPagamentoVALOR_PARCELA: TFMTBCDField;
    qryPagamentoPERC_JUROS: TFMTBCDField;
    qryPagamentoJUROS: TFMTBCDField;
    qryPagamentoPERC_DESCONTO: TFMTBCDField;
    qryPagamentoDESCONTO: TFMTBCDField;
    qryPagamentoVALOR_RECEBIDO: TFMTBCDField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    qryPagamentoSALDO_C_JUROS: TExtendedField;
    qryCaixaFPG: TIntegerField;
    procedure qryCPAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryPagamentoCalcFields(DataSet: TDataSet);
    procedure qryPagamentoNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBLookupCombobox1Enter(Sender: TObject);
    procedure DBLookupCombobox1Exit(Sender: TObject);
    procedure DBLookupCombobox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaPagar: TfrmBaixaPagar;

implementation

{$R *.dfm}

uses Udados, uVendaCartao;

procedure TfrmBaixaPagar.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaPagar.btnGravarClick(Sender: TObject);
var
  Valor1, valor2: Extended;
begin

  DBDateTimeEditEh1.SetFocus;

  if (qryPagamentoFKPLANO.IsNull) or (qryPagamentoFKPLANO.AsInteger = 0) then
  begin
    ShowMessage('Digite o TIPO DE CONTA!');
    DBLookupCombobox1.SetFocus;
    exit;
  end;

  if qryPagamentoDATA.IsNull then
  begin
    ShowMessage('Digite DATA DE  PAGAMENTO!');
    DBDateTimeEditEh1.SetFocus;
    exit;
  end;
  Valor1 := SimpleRoundTo(qryPagamentoVALOR_RECEBIDO.AsFloat, -2);
  valor2 := SimpleRoundTo(qryPagamentoTSALDO.AsFloat, -2);
  if (Valor1 > valor2) then
  begin
    ShowMessage('VALOR PAGO não pode ser maior que valor da conta!');
    DBEdit4.SetFocus;
    exit;
  end;

  if (qryPagamentoFKCONTA.IsNull) then
  begin
    ShowMessage('Configure a conta caixa no cadastro de empresa!');
    DBLookupComboboxEh1.SetFocus;
    exit;
  end;

  if valor2 > 0 then
  begin
    if not(qryPagamentoVALOR_RECEBIDO.Value > 0) then
    begin
      ShowMessage('Digite o valor Pago!');
      DBEdit4.SetFocus;
      exit;
    end;
  end;

  try
    btnGravar.Enabled := false;
    try
      if (qryPagamento.State in dsEditModes) then
        qryPagamento.Post;

      if qryPagamentoVALOR_RECEBIDO.AsFloat > 0 then
      begin

        qryCaixa.Close;
        qryCaixa.Params[0].Value := qryPagamentoCODIGO.Value;
        qryCaixa.Open;

        if qryCaixa.IsEmpty then
        begin
          qryCaixa.Insert;
          qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO',
            'N', '', '');
        end
        else
          qryCaixa.Edit;
        qryCaixaEMISSAO.Value := qryPagamentoDATA.Value;
        qryCaixaDOC.AsString := 'PAG.' + qryCPCODIGO.AsString + '/' +
          qryPagamentoCODIGO.AsString;
        qryCaixaHORA_EMISSAO.Value := Now;
        qryCaixaFKCONTA.Value := qryPagamentoFKCONTA.Value;
        qryCaixaFPG.Value := Dados.buscafpg('D');
        qryCaixaFKPLANO.Value := qryPagamentoFKPLANO.Value;
        qryCaixaTIPO_MOVIMENTO.Value := 'PA';
        qryCaixaHISTORICO.Value := qryCPRAZAO.Value;
        qryCaixaENTRADA.Value := 0;
        qryCaixaSAIDA.Value := qryPagamentoVALOR_RECEBIDO.Value;
        qryCaixaFKPAGAR.Value := qryPagamentoCODIGO.Value;
        qryCaixaEMPRESA.Value := qryCPFKEMPRESA.Value;
        qryCaixa.Post;
        Dados.Conexao.CommitRetaining;
      end;

      Dados.qrySomaPaga.Close;
      Dados.qrySomaPaga.Params[0].Value := qryCPCODIGO.Value;
      Dados.qrySomaPaga.Open;

      qryCP.Edit;
      qryCPDATA_PAGAMENTO.Value := qryPagamentoDATA.Value;
      qryCPDESCONTO.Value := Dados.qrySomaPagaDESCONTO.AsFloat;
      qryCPJUROS.Value := Dados.qrySomaPagaJUROS.AsFloat;
      qryCPVLPAGO.Value := Dados.qrySomaPagaRECEBIDO.AsFloat;
      qryCPVL_RESTANTE.AsFloat := qryCPVALOR.AsFloat -
        (qryCPVLPAGO.AsFloat - qryCPJUROS.AsFloat + qryCPDESCONTO.AsFloat);

      if SimpleRoundTo(qryCPVL_RESTANTE.AsFloat, -2) <= 0.01 then
        qryCPSITUACAO.Value := 'T'
      else
        qryCPSITUACAO.Value := 'P';

      qryCP.Post;
      Dados.Conexao.CommitRetaining;

    except
      on e: exception do
        raise exception.create('Erro ao Baixar parcela!' + #13 + e.Message);
    end;

    Application.ProcessMessages;
    ShowMessage('Baixa de título efetuada com sucesso!');
    Close;
  finally
    btnGravar.Enabled := true;
  end;

end;

procedure TfrmBaixaPagar.DBEdit1Exit(Sender: TObject);
begin
  if qryPagamento.State in dsEditModes then
    qryPagamento.Edit;
  qryPagamentoPERC_JUROS.Value :=
    (qryPagamentoJUROS.Value / qryPagamentoVALOR_PARCELA.Value) * 100;
end;

procedure TfrmBaixaPagar.DBEdit5Exit(Sender: TObject);
begin
  if qryPagamento.State in dsEditModes then
    qryPagamento.Edit;
  qryPagamentoPERC_DESCONTO.Value :=
    (qryPagamentoDESCONTO.Value / qryPagamentoVALOR_PARCELA.Value) * 100;

end;

procedure TfrmBaixaPagar.DBEdit6Exit(Sender: TObject);
begin
  if qryPagamento.State in dsEditModes then
    qryPagamento.Edit;
  qryPagamentoDESCONTO.Value :=
    SimpleRoundTo((qryPagamentoVALOR_PARCELA.AsFloat *
    qryPagamentoPERC_DESCONTO.AsFloat) / 100, -2);

end;

procedure TfrmBaixaPagar.DBEdit7Exit(Sender: TObject);
begin
  if qryPagamento.State in dsEditModes then
    qryPagamento.Edit;
  qryPagamentoJUROS.Value :=
    SimpleRoundTo((qryPagamentoVALOR_PARCELA.AsFloat *
    qryPagamentoPERC_JUROS.AsFloat) / 100, -2);
end;

procedure TfrmBaixaPagar.DBLookupCombobox1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmBaixaPagar.DBLookupCombobox1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmBaixaPagar.DBLookupCombobox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmBaixaPagar.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmBaixaPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaixaPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_f5 then
    btnGravarClick(self);

  if Key = vk_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair da baixa de contas a pagar?',
      'Confirmação', mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmBaixaPagar.FormShow(Sender: TObject);
begin
  qryPagamento.Close;
  qryPagamento.Params[0].Value := qryCPCODIGO.Value;
  qryPagamento.Open;
  qryPagamento.Insert;
  DBLookupCombobox1.SetFocus;
end;

procedure TfrmBaixaPagar.qryCPAfterOpen(DataSet: TDataSet);
begin
  qryConta.Close;
  qryConta.Open;

  qryPlano.Close;
  qryPlano.Open;

end;

procedure TfrmBaixaPagar.qryPagamentoCalcFields(DataSet: TDataSet);
begin
  qryPagamentoSALDO_C_JUROS.Value :=
    SimpleRoundTo(qryCPVL_RESTANTE.AsFloat + qryPagamentoJUROS.AsFloat, -2);

  qryPagamentoTSALDO.Value := SimpleRoundTo(qryPagamentoSALDO_C_JUROS.AsFloat -
    qryPagamentoDESCONTO.AsFloat, -2);
end;

procedure TfrmBaixaPagar.qryPagamentoNewRecord(DataSet: TDataSet);
begin
  qryPagamentoCODIGO.Value := Dados.Numerador('CPPAGAMENTO', 'CODIGO',
    'N', '', '');
  qryPagamentoFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryPagamentoFK_FORMA_PGTO.Value := 1; // dinheiro
  qryPagamentoFKPAGAR.Value := qryCPCODIGO.Value;
  qryPagamentoDATA.Value := date;
  qryPagamentoVALOR_PARCELA.AsFloat := qryCPVL_RESTANTE.AsFloat;
  qryPagamentoPERC_JUROS.Value := 0;
  qryPagamentoJUROS.Value := 0;
  qryPagamentoPERC_DESCONTO.Value := 0;
  qryPagamentoDESCONTO.Value := 0;
  qryPagamentoVALOR_RECEBIDO.Value := 0;
  qryPagamentoFKKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
end;

end.
