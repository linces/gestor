unit uCadPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrEnterTab, Vcl.Samples.Spin;

type
  TfrmCadPagar = class(TForm)
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
    qryCP: TFDQuery;
    dsCP: TDataSource;
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
    qryCPVIRTUAL_FORNE: TStringField;
    ACBrEnterTab1: TACBrEnterTab;
    qryCPFK_COMPRA: TIntegerField;
    Label6: TLabel;
    dsEmpresa: TDataSource;
    qryFornecedor: TFDQuery;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorUF: TStringField;
    qryFornecedorCNPJ: TStringField;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    qryDuplica: TFDQuery;
    qryDuplicaCODIGO: TIntegerField;
    qryDuplicaDATA: TDateField;
    qryDuplicaFKFORNECE: TIntegerField;
    qryDuplicaDOC: TStringField;
    qryDuplicaDTVENCIMENTO: TDateField;
    qryDuplicaHISTORICO: TStringField;
    qryDuplicaDATA_PAGAMENTO: TDateField;
    qryDuplicaSITUACAO: TStringField;
    qryDuplicaFKEMPRESA: TIntegerField;
    qryDuplicaFK_COMPRA: TIntegerField;
    DBEdit6: TDBEdit;
    qryCPVIRTUAL_EMPRESA: TStringField;
    qryCPVALOR: TCurrencyField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
    qryDuplicaVALOR: TCurrencyField;
    qryDuplicaDESCONTO: TCurrencyField;
    qryDuplicaJUROS: TFMTBCDField;
    qryDuplicaVLPAGO: TCurrencyField;
    qryDuplicaVL_RESTANTE: TFMTBCDField;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryCPBeforeOpen(DataSet: TDataSet);
    procedure DBDateTimeEditEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure qryCPAfterPost(DataSet: TDataSet);
    procedure qryCPBeforePost(DataSet: TDataSet);
    procedure qryDuplicaBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    procedure duplica(parcelas: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPagar: TfrmCadPagar;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadPagar.btnCancelarClick(Sender: TObject);
begin
  qryCP.Cancel;
  close;
end;

procedure TfrmCadPagar.duplica(parcelas: integer);
var
  i: integer;
  dia, mes, ano: Word;
  dia1, mes1, ano1: Word;
  fdata, ultimadata: Tdate;
begin
  qryDuplica.close;
  qryDuplica.Open;
  ultimadata := EndOfTheMonth(qryCPDTVENCIMENTO.Value) + 1;
  DecodeDate(qryCPDTVENCIMENTO.Value, ano, mes, dia);
  for i := 1 to parcelas - 1 do
  begin

    DecodeDate(ultimadata, ano1, mes1, dia1);

    qryDuplica.Insert;
    qryDuplicaCODIGO.Value := dados.Numerador('CPAGAR', 'CODIGO', 'N', '', '');
    qryDuplicaDATA.Value := Date;
    qryDuplicaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    qryDuplicaVALOR.Value := qryCPVALOR.Value;
    qryDuplicaDESCONTO.Value := 0;
    qryDuplicaJUROS.Value := 0;
    qryDuplicaVLPAGO.Value := 0;
    qryDuplicaVL_RESTANTE.Value := qryDuplicaVALOR.Value;
    qryDuplicaSITUACAO.Value := 'A';
    qryDuplicaDOC.Value := qryCPDOC.Value;
    qryDuplicaFKFORNECE.Value := qryCPFKFORNECE.Value;

    try
      fdata := strtodate(inttostr(dia) + '/' + inttostr(mes1) + '/' +
        inttostr(ano1));
    except
      fdata := EndOfTheMonth(strtodate('01' + '/' + inttostr(mes1) + '/' +
        inttostr(ano1)));
    end;

    if mes1 <> 2 then
      qryDuplicaDTVENCIMENTO.AsDateTime := fdata;
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
    qryDuplicaHISTORICO.Value := qryCPHISTORICO.Value;
    qryDuplica.Post;

    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmCadPagar.btnGravarClick(Sender: TObject);
begin

  DBEdit2.SetFocus;

  if qryCP.State in [dsInsert, dsEdit] then
  begin

    if (qryCPFKFORNECE.IsNull) or (qryCPFKFORNECE.AsInteger = 0) then
    begin
      ShowMessage('Digite o FORNECEDOR!');
      DBLookupComboboxEh4.SetFocus;
      exit;
    end;

    if (qryCPDOC.IsNull) then
    begin
      ShowMessage('Digite o DOCUMENTO!');
      DBEdit2.SetFocus;
      exit;
    end;

    if (qryCPDTVENCIMENTO.IsNull) then
    begin
      ShowMessage('Digite a DATA DE VENCIMENTO!');
      DBEdit7.SetFocus;
      exit;
    end;

    if not(qryCPVALOR.Value > 0) then
    begin
      ShowMessage('Digite o VALOR!');
      DBEdit4.SetFocus;
      exit;
    end;

    qryCP.Post;
    dados.Conexao.CommitRetaining;
    close;
  end;
end;

procedure TfrmCadPagar.DBDateTimeEditEh1Exit(Sender: TObject);
begin
  DBEdit2.SetFocus;
end;

procedure TfrmCadPagar.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadPagar.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadPagar.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPagar.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = VK_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do cadastro de contas a pagar?',
      'Confirmação', mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmCadPagar.qryCPAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  duplica(SpinEdit1.Value);
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadPagar.qryCPBeforeOpen(DataSet: TDataSet);
begin
  qryFornecedor.close;
  qryFornecedor.Open;
end;

procedure TfrmCadPagar.qryCPBeforePost(DataSet: TDataSet);
begin
  if dados.qryCP.State in [dsInsert] then
    dados.qryCPCODIGO.Value := dados.Numerador('CPAGAR', 'CODIGO', 'N', '', '');
  qryCPVL_RESTANTE.Value := qryCPVALOR.Value - qryCPVLPAGO.Value;
end;

procedure TfrmCadPagar.qryDuplicaBeforePost(DataSet: TDataSet);
begin
  qryDuplicaVL_RESTANTE.Value := qryDuplicaVALOR.Value - qryDuplicaVLPAGO.Value;
end;

end.
