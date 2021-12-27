unit uTransferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, DBGridEh, Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmTransferencia = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsEmpresa: TDataSource;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    Label5: TLabel;
    Label2: TLabel;
    edtValor: TEdit;
    qryContasO: TFDQuery;
    qryContasOCODIGO: TIntegerField;
    qryContasODESCRICAO: TStringField;
    qryContasOTIPO: TStringField;
    qryContasD: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsContaD: TDataSource;
    dsContaO: TDataSource;
    cbContaO: TDBLookupComboboxEh;
    cbContaD: TDBLookupComboboxEh;
    qrySaldo: TFDQuery;
    qrySaldoSALDO: TFMTBCDField;
    DataEmissao: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsContaODataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    function SaidaConta: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

{$R *.dfm}

uses Udados;

function TfrmTransferencia.SaidaConta: integer;
begin
  result := 0;
  dados.qryCaixa.Close;
  dados.qryCaixa.Params[0].Value := -1;
  dados.qryCaixa.Open;

  dados.qryCaixa.Insert;
  dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  dados.qryCaixaEMISSAO.Value := StrToDateDef(DataEmissao.EditText,Date);
  dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  dados.qryCaixaDOC.Value := 'TRF.' + dados.qryCaixaCODIGO.AsString;
  dados.qryCaixaHISTORICO.Value := 'TRANSFERÊNCIA P/ ' + cbContaD.Text;
  dados.qryCaixaENTRADA.Value := 0;
  DADOS.qryCaixaTIPO_MOVIMENTO.Value:='TS';
  dados.qryCaixaSAIDA.AsString := edtValor.Text;
  dados.qryCaixaHORA_EMISSAO.Value := time;
  dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
  dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_TRANSFERENCIA_D.Value;
  dados.qryCaixaFKCONTA.Value := cbContaO.KeyValue;
  dados.qryCaixaFKVENDA.Value := 0;
  dados.qryCaixaTRANSFERENCIA.Value := dados.qryCaixaCODIGO.Value;
  result := dados.qryCaixaCODIGO.Value;
  dados.qryCaixa.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmTransferencia.BitBtn1Click(Sender: TObject);
var
  codigo: integer;
begin
  if not BitBtn1.Enabled then
    exit;

  If Application.messagebox('Deseja realmente fazer transferência?',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
  begin
    if trim(cbContaO.Text) = '' then
    begin
      ShowMessage('Selecione Conta de origem!');
      cbContaO.SetFocus;
      exit;
    end;

    if trim(cbContaD.Text) = '' then
    begin
      ShowMessage('Selecione Conta de Destino!');
      cbContaD.SetFocus;
      exit;
    end;

    if cbContaO.Text = cbContaD.Text then
    begin
      ShowMessage('Transferência não pode ser feita pra mesma conta!');
      exit;
    end;

    if trim(edtValor.Text) = '' then
    begin
      ShowMessage('Informe o valor!');
      exit;
    end;

    if strtofloat(edtValor.Text) = 0 then
    begin
      ShowMessage('Valor não pode ser zero!');
      exit;
    end;

    qrySaldo.Close;
    qrySaldo.Params[0].AsDate := StrToDate(DataEmissao.EditText);
    qrySaldo.Params[1].Value := cbContaO.KeyValue;
    qrySaldo.Open;

    if (qrySaldoSALDO.AsFloat) < strtofloat(edtValor.Text) then
    begin
      ShowMessage('Saldo da Conta ' + cbContaO.Text + ' Insuficiente!' + #13 +
        'Saldo Atual:' + FormatFloat(',0.00', qrySaldoSALDO.AsFloat));
      exit;
    end;
    try
      try
        BitBtn1.Enabled := false;
        codigo := SaidaConta;

        dados.qryCaixa.Close;
        dados.qryCaixa.Params[0].Value := -1;
        dados.qryCaixa.Open;

        dados.qryCaixa.Insert;
        dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
          'N', '', '');
        dados.qryCaixaEMISSAO.Value := StrToDateDef(DataEmissao.EditText,date);
        dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
        dados.qryCaixaDOC.Value := 'TRF.' + dados.qryCaixaCODIGO.AsString;
        dados.qryCaixaHISTORICO.Value := 'TRANSFERÊNCIA - ' + cbContaO.Text;
        dados.qryCaixaENTRADA.AsString := edtValor.Text;
        DADOS.qryCaixaTIPO_MOVIMENTO.Value:='TE';
        dados.qryCaixaSAIDA.Value := 0;
        dados.qryCaixaHORA_EMISSAO.Value := time;
        dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
        dados.qryCaixaFKPLANO.Value :=
          dados.qryEmpresaID_PLANO_TRANSFERENCIA_C.Value;
        dados.qryCaixaFKCONTA.Value := cbContaD.KeyValue;
        dados.qryCaixaFKVENDA.Value := 0;
        dados.qryCaixaTRANSFERENCIA.Value := codigo;
        dados.qryCaixa.Post;

        dados.Conexao.CommitRetaining;

        ShowMessage('Transferência realizada com sucesso!');
      except
        dados.Conexao.RollbackRetaining;
        ShowMessage('Transferência não foi realizada! ');
        exit;
      end;
    finally
      BitBtn1.Enabled := true;
    end;
  end;
  Close;
end;

procedure TfrmTransferencia.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransferencia.dsContaODataChange(Sender: TObject; Field: TField);
begin
  qryContasD.Close;
  qryContasD.Params[0].Value := qryContasOCODIGO.Value;
  qryContasD.Open;
end;

procedure TfrmTransferencia.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmTransferencia.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmTransferencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn1Click(self);
  if Key = VK_ESCAPE then
    BitBtn2Click(self);
end;

procedure TfrmTransferencia.FormShow(Sender: TObject);
begin
  qryContasO.Close;
  qryContasO.Open;

  qryContasD.Close;
  qryContasD.Open;

  qryEmpresa.Close;
  qryEmpresa.Open;

  cbContaO.KeyValue := 0;
  cbContaD.KeyValue := 0;
  DataEmissao.EditText := datetostr(Date);

end;

end.
