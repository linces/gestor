unit uCadCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  ACBrBase, ACBrEnterTab, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadCaixa = class(TForm)
    Panel4: TPanel;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    dsCaixa: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    dsPlano: TDataSource;
    dsConta: TDataSource;
    qryContas: TFDQuery;
    qryContasCODIGO: TIntegerField;
    qryContasDESCRICAO: TStringField;
    qryContasTIPO: TStringField;
    qryContasID_USUARIO: TIntegerField;
    qryContasEMPRESA: TIntegerField;
    qryContasDATA_ABERTURA: TDateField;
    qryContasLOTE: TIntegerField;
    qryContasSITUACAO: TStringField;
    qrSaldo: TFDQuery;
    qrSaldoSALDO: TBCDField;
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
    qryCaixaTSALDO: TExtendedField;
    qryCaixaBLOQUEADO: TStringField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaECARTAO: TStringField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaVIRTUAL_EMPRESA: TStringField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    qryCaixaID_SUBCAIXA: TIntegerField;
    qryCaixaFPG: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    dsFPG: TDataSource;
    qryFPG: TFDQuery;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    DBEdit7: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh3Exit(Sender: TObject);
    procedure DBLookupComboboxEh2Exit(Sender: TObject);
    procedure DBLookupComboboxEh3Enter(Sender: TObject);
    procedure DBLookupComboboxEh2KeyPress(Sender: TObject; var Key: Char);
    procedure qryCaixaAfterPost(DataSet: TDataSet);
    procedure qryCaixaAfterDelete(DataSet: TDataSet);
    procedure qryCaixaNewRecord(DataSet: TDataSet);
    procedure qryCaixaBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    function Operacao: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCaixa: TfrmCadCaixa;

implementation

{$R *.dfm}

uses uCaixa, Udados;

procedure TfrmCadCaixa.btnCancelarClick(Sender: TObject);
begin
  qryCaixa.Cancel;
  close;
end;

function TfrmCadCaixa.Operacao: string;
begin
  dados.qryExecute.close;
  dados.qryExecute.SQL.Text := 'SELECT DC FROM PLANO WHERE CODIGO=:COD';
  dados.qryExecute.Params[0].Value := DBLookupComboboxEh1.KeyValue;
  dados.qryExecute.Open;
  Result := dados.qryExecute.Fields[0].AsString;
end;

procedure TfrmCadCaixa.qryCaixaAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCaixa.qryCaixaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCaixa.qryCaixaBeforePost(DataSet: TDataSet);
begin
  if qryCaixa.State = dsinsert then
    qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
end;

procedure TfrmCadCaixa.qryCaixaNewRecord(DataSet: TDataSet);
begin
  qryCaixaDT_CADASTRO.Value := Date;
end;

procedure TfrmCadCaixa.btnGravarClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  DecodeDate(qryCaixaEMISSAO.Value, ano, mes, dia);
  if qryCaixa.State in [dsinsert, dsEdit] then
  begin
    DBEdit7.SetFocus;
    if (qryCaixaFKPLANO.IsNull) then
    begin
      ShowMessage('Selecione Plano de contas!');
      DBLookupComboboxEh1.SetFocus;
      exit;
    end;

    if (qryCaixaFKCONTA.IsNull) then
    begin
      ShowMessage('Selecione a Conta!');
      DBLookupComboboxEh2.SetFocus;
      exit;
    end;


    if (qryCaixaFPG.IsNull) then
    begin
      ShowMessage('Selecione a Forma de Pagamento!');
      DBLookupComboboxEh3.SetFocus;
      exit;
    end;

    if qryCaixaENTRADA.Value > 0 then
      qryCaixaTIPO_MOVIMENTO.Value := 'RD'
    else
      qryCaixaTIPO_MOVIMENTO.Value := 'DD';
    qryCaixa.Post;
    dados.Conexao.CommitRetaining;
    close;
  end;
end;

procedure TfrmCadCaixa.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
  if Operacao = 'C' then
  begin
    DBEdit4.ReadOnly := false;
    DBEdit5.ReadOnly := true;
    qryCaixaSAIDA.Value := 0;

  end;

  if Operacao = 'D' then
  begin
    DBEdit4.ReadOnly := true;
    DBEdit5.ReadOnly := false;
    qryCaixaENTRADA.Value := 0;
  end;
end;

procedure TfrmCadCaixa.DBLookupComboboxEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCaixa.DBLookupComboboxEh2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadCaixa.DBLookupComboboxEh3Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCaixa.DBLookupComboboxEh3Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCaixa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmCadCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F5 then
    btnGravarClick(Self);
  if Key = VK_ESCAPE then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do cadastro de caixa?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmCadCaixa.FormShow(Sender: TObject);
begin
  dados.qryPlano.SQL.Text := 'SELECT * FROM PLANO /*where*/ order by descricao';
  dados.qryPlano.close;
  dados.qryPlano.Open;

  qryContas.close;
  qryContas.Open;

 qryFPG.Close;
 qryFPG.Open;


  if Panel1.Enabled then
    DBEdit7.setFocus;
end;

end.
