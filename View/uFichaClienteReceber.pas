unit uFichaClienteReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrEnterTab;

type
  TfrmCadFichaClieR = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    qryFicha: TFDQuery;
    dsFicha: TDataSource;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    qryFichaCODIGO: TIntegerField;
    qryFichaFKPESSOA: TIntegerField;
    qryFichaDATA_EMISSAO: TDateField;
    qryFichaDATA_VENCIMENTO: TDateField;
    qryFichaHISTORICO: TStringField;
    qryFichaFKVENDA: TIntegerField;
    qryFichaFKEMPRESA: TIntegerField;
    qryFichaFKPLANO: TIntegerField;
    qryFichaBLOQUEADO: TStringField;
    qryFichaVIRTUAL_CLIENTE: TStringField;
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
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryFichaENTRADA: TFMTBCDField;
    qryFichaSAIDA: TFMTBCDField;
    qryFichaDOCUMENTO: TStringField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    DBLookupCombobox1: TDBLookupComboboxEh;
    Label3: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    qryFichaTTOTAL: TAggregateField;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    qryFichaFKPEDIDO: TIntegerField;
    qryFichaFK_FPG: TIntegerField;
    qryFichaFK_CONTA: TIntegerField;
    Shape1: TShape;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Label9: TLabel;
    qryCaixaID_SUBCAIXA: TIntegerField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    qryCaixaFPG: TIntegerField;
    qryFPG: TFDQuery;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    dsFPG: TDataSource;
    dsConta: TDataSource;
    qryConta: TFDQuery;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    dsPlano: TDataSource;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    qryPlanoDC: TStringField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryFichaBeforeOpen(DataSet: TDataSet);
    procedure qryFichaAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    procedure GeraCaixa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFichaClieR: TfrmCadFichaClieR;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadFichaClieR.btnCancelarClick(Sender: TObject);
begin
  qryFicha.Cancel;
  close;
end;

procedure TfrmCadFichaClieR.GeraCaixa;
begin
  qryCaixa.close;
  qryCaixa.Params[0].Value := qryFichaCODIGO.Value;
  qryCaixa.Open;

  if qryCaixa.IsEmpty then
  begin
    qryCaixa.Insert;
    qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  end
  else
    qryCaixa.Edit;
  qryCaixaEMISSAO.Value := DATE;
  qryCaixaDOC.AsString := 'NT.' + qryFichaCODIGO.AsString;
  qryCaixaHORA_EMISSAO.Value := Now;
  qryCaixaFKCONTA.Value := qryFichaFK_CONTA.Value;
  qryCaixaFKPLANO.Value := qryFichaFKPLANO.Value;
  qryCaixaFKCONTA.Value := qryFichaFK_CONTA.Value;
  qryCaixaHISTORICO.Value := 'NOTA Nº' + qryFichaCODIGO.AsString + ' ' +
    qryFichaVIRTUAL_CLIENTE.Value;
  qryCaixaENTRADA.Value := qryFichaENTRADA.Value;
  qryCaixaSAIDA.Value := 0;
  qryCaixaFK_FICHA_CLI.Value := qryFichaCODIGO.Value;
  qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryCaixaFPG.Value := qryFichaFK_FPG.Value;
  qryCaixaTIPO_MOVIMENTO.Value := 'RE';
  qryCaixa.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadFichaClieR.btnGravarClick(Sender: TObject);
begin
  try
    if qryFicha.State in [dsInsert, dsEdit] then
    begin

      if (qryFichaFKPESSOA.IsNull) then
      begin
        ShowMessage('Selecione o Cliente!');
        DBLookupComboboxEh4.SetFocus;
        exit;
      end;

      if (qryFichaFKPLANO.IsNull) then
      begin
        ShowMessage('Selecione o Plano de Contas!');
        DBLookupCombobox1.SetFocus;
        exit;
      end;

      if (qryFichaFK_CONTA.IsNull) then
      begin
        ShowMessage('Selecione a Conta de Destino!');
        DBLookupComboboxEh1.SetFocus;
        exit;
      end;

      if (qryFichaFK_FPG.IsNull) then
      begin
        ShowMessage('Selecione a Forma de Pagamento!');
        DBLookupComboboxEh2.SetFocus;
        exit;
      end;

      if (qryFichaHISTORICO.IsNull) then
      begin
        ShowMessage('Informe o Histórico!');
        DBEdit7.SetFocus;
        exit;
      end;

      if (not(qryFichaENTRADA.Value > 0)) then
      begin
        ShowMessage('Digite o Valor!');
        DBEdit6.SetFocus;
        exit;
      end;

      qryFicha.Post;
      Dados.Conexao.CommitRetaining;

      if qryFichaENTRADA.Value > 0 then
        GeraCaixa;
      close;
    end;
  except
    On e: exception do
      raise exception.Create(e.message);
  end;
end;

procedure TfrmCadFichaClieR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = VK_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair da ficha de clientes?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmCadFichaClieR.FormShow(Sender: TObject);
begin

  qryConta.close;
  qryConta.Open;

  qryPlano.close;
  qryPlano.Open;

  qryFPG.close;
  qryFPG.Open;

end;

procedure TfrmCadFichaClieR.qryFichaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadFichaClieR.qryFichaBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryClientes.close;
  Dados.qryClientes.Open;
end;

end.
