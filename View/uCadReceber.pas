unit uCadReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB, dateutils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrEnterTab, Vcl.Samples.Spin;

type
  TfrmCadReceber = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    qryCR: TFDQuery;
    dsCR: TDataSource;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRVIRTUAL_CLIENTE: TStringField;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    Label6: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    qryCRTIPO: TStringField;
    Label8: TLabel;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesMUNICIPIO: TStringField;
    qryClientesUF: TStringField;
    qryClientesCEP: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesCELULAR1: TStringField;
    Label10: TLabel;
    SpinEdit1: TSpinEdit;
    qryDuplica: TFDQuery;
    qryDuplicaCODIGO: TIntegerField;
    qryDuplicaDATA: TDateField;
    qryDuplicaFKCLIENTE: TIntegerField;
    qryDuplicaDOC: TStringField;
    qryDuplicaDTVENCIMENTO: TDateField;
    qryDuplicaHISTORICO: TStringField;
    qryDuplicaDATA_RECEBIMENTO: TDateField;
    qryDuplicaSITUACAO: TStringField;
    qryDuplicaFKEMPRESA: TIntegerField;
    qryDuplicaFK_VENDA: TIntegerField;
    qryDuplicaFKCONTA: TIntegerField;
    qryDuplicaTIPO: TStringField;
    qryDuplicaNBOLETO: TIntegerField;
    qryDuplicaID_VENDEDOR: TIntegerField;
    DBEdit6: TDBEdit;
    qryCRVIRTUAL_EMPRESA: TStringField;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryCRVRECEBIDO: TCurrencyField;
    qryDuplicaVALOR: TCurrencyField;
    qryDuplicaDESCONTO: TCurrencyField;
    qryDuplicaJUROS: TFMTBCDField;
    qryDuplicaVRECEBIDO: TCurrencyField;
    qryDuplicaVL_RESTANTE: TFMTBCDField;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    qryCRREMESSA: TStringField;
    qryCRREMESSA_REENVIAR: TStringField;
    qryDuplicaREMESSA: TStringField;
    qryDuplicaREMESSA_REENVIAR: TStringField;
    qryCRID_CBR_REMESSA_UUID: TStringField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryCRBeforePost(DataSet: TDataSet);
    procedure qryCRBeforeOpen(DataSet: TDataSet);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh4Enter(Sender: TObject);
    procedure DBLookupComboboxEh4Exit(Sender: TObject);
    procedure qryCRAfterPost(DataSet: TDataSet);
    procedure qryDuplicaBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    procedure duplica(parcelas: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReceber: TfrmCadReceber;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadReceber.btnCancelarClick(Sender: TObject);
begin
  qryCR.Cancel;
  close;
end;

procedure TfrmCadReceber.btnGravarClick(Sender: TObject);
begin
  DBEdit2.SetFocus;

  if qryCR.State in [dsInsert, dsEdit] then
  begin

    if (qryCRFKCLIENTE.IsNull) then
    begin
      ShowMessage('Digite o Cliente!');
      DBLookupComboboxEh4.SetFocus;
      exit;
    end;

    if (qryCRDOC.IsNull) then
    begin
      ShowMessage('Digite o Documento!');
      DBEdit2.SetFocus;
      exit;
    end;

    if (qryCRDTVENCIMENTO.IsNull) then
    begin
      ShowMessage('Digite a data de vencimento!');
      DBEdit7.SetFocus;
      exit;
    end;

    if not(qryCRVALOR.Value > 0) then
    begin
      ShowMessage('Digite o Valor!');
      DBEdit4.SetFocus;
      exit;
    end;

    qryCR.Post;
    dados.Conexao.CommitRetaining;
    close;
  end;
end;

procedure TfrmCadReceber.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadReceber.DBLookupComboboxEh4Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadReceber.DBLookupComboboxEh4Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadReceber.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);

  if Key = VK_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do cadastro de contas a receber?',
      'Confirmação', mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmCadReceber.duplica(parcelas: integer);
var
  i: integer;
  dia, mes, ano: Word;
  dia1, mes1, ano1: Word;
  fData, ultimadata: Tdate;
begin
  qryDuplica.close;
  qryDuplica.Open;
  ultimadata := EndOfTheMonth(qryCRDTVENCIMENTO.Value) + 1;
  DecodeDate(qryCRDTVENCIMENTO.Value, ano, mes, dia);
  for i := 1 to parcelas - 1 do
  begin

    DecodeDate(ultimadata, ano1, mes1, dia1);

    qryDuplica.Insert;
    qryDuplicaCODIGO.Value := dados.Numerador('CRECEBER', 'CODIGO',
      'N', '', '');
    qryDuplicaDATA.Value := Date;
    qryDuplicaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    qryDuplicaVALOR.Value := qryCRVALOR.Value;
    qryDuplicaTIPO.Value := qryCRTIPO.Value;
    qryDuplicaREMESSA.Value := 'N';
    qryDuplicaREMESSA_REENVIAR.Value := 'S';
    qryDuplicaDESCONTO.Value := 0;
    qryDuplicaJUROS.Value := 0;
    qryDuplicaVRECEBIDO.Value := 0;
    qryDuplicaVL_RESTANTE.Value := qryDuplicaVALOR.Value;
    qryDuplicaSITUACAO.Value := 'A';
    qryDuplicaDOC.Value := qryCRDOC.Value;
    qryDuplicaFKCLIENTE.Value := qryCRFKCLIENTE.Value;

    try
      fData := strtodate(inttostr(dia) + '/' + inttostr(mes1) + '/' +
        inttostr(ano1));
    except
      fData := EndOfTheMonth(strtodate('01' + '/' + inttostr(mes1) + '/' +
        inttostr(ano1)));
    end;

    if mes1 <> 2 then
      qryDuplicaDTVENCIMENTO.AsDateTime := fData;

    if mes1 = 2 then
    begin
      if dia > 28 then
        qryDuplicaDTVENCIMENTO.AsString := '28/' + inttostr(mes1) + '/' +
          inttostr(ano1)
      else
        qryDuplicaDTVENCIMENTO.AsString := inttostr(dia) + '/' + inttostr(mes1)
          + '/' + inttostr(ano1);
    end;

    ultimadata := EndOfTheMonth(qryDuplicaDTVENCIMENTO.Value) + 1;

    qryDuplicaHISTORICO.Value := qryCRHISTORICO.Value;
    qryDuplica.Post;

    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmCadReceber.qryCRAfterPost(DataSet: TDataSet);
begin
  dados.UpdateTipoBoleto(qryCR.FieldByName('codigo').AsInteger);
  dados.Conexao.CommitRetaining;

  duplica(SpinEdit1.Value);
end;

procedure TfrmCadReceber.qryCRBeforeOpen(DataSet: TDataSet);
begin
  qryClientes.close;
  qryClientes.Open;

end;

procedure TfrmCadReceber.qryCRBeforePost(DataSet: TDataSet);
begin

  if qryCRTIPO.AsString = 'B' then
  begin
    if qryCRNBOLETO.IsNull then
      qryCRNBOLETO.Value := dados.RetornoNumeroBoleto;

    qryCRID_CBR_REMESSA_UUID.Clear;
    qryCRREMESSA_REENVIAR.Value := 'S';
    qryCRREMESSA.Value := 'N';
  end;

  if qryCR.State in [dsInsert] then
    qryCRCODIGO.Value := dados.Numerador('CRECEBER', 'CODIGO', 'N', '', '');
  qryCRVL_RESTANTE.Value := qryCRVALOR.Value - qryCRVRECEBIDO.Value;
end;

procedure TfrmCadReceber.qryDuplicaBeforePost(DataSet: TDataSet);
begin
  qryDuplicaVL_RESTANTE.Value := qryDuplicaVALOR.Value -
    qryDuplicaVRECEBIDO.Value;
end;

end.
