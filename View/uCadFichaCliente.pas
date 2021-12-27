unit uCadFichaCliente;

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
  TfrmCadFichaCliente = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Label9: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
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
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryFichaBeforeOpen(DataSet: TDataSet);
    procedure qryFichaAfterPost(DataSet: TDataSet);
  private
    procedure GeraCaixa;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFichaCliente: TfrmCadFichaCliente;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadFichaCliente.btnCancelarClick(Sender: TObject);
begin
  qryFicha.Cancel;
  close;
end;

procedure TfrmCadFichaCliente.GeraCaixa;
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
  qryCaixaFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryCaixaFKPLANO.Value := qryFichaFKPLANO.Value;
  qryCaixaHISTORICO.Value := 'NOTA Nº' + qryFichaCODIGO.AsString + ' ' +
    qryFichaVIRTUAL_CLIENTE.Value;
  qryCaixaENTRADA.Value := qryFichaENTRADA.Value;
  qryCaixaSAIDA.Value := 0;
  qryCaixaFK_FICHA_CLI.Value := qryFichaCODIGO.Value;
  qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryCaixa.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadFichaCliente.btnGravarClick(Sender: TObject);
begin
  try
    DBEdit3.SetFocus;

    if qryFicha.State in [dsInsert, dsEdit] then
    begin

      if (qryFichaFKPESSOA.IsNull) then
      begin
        ShowMessage('Selecione o Cliente!');
        DBLookupComboboxEh4.SetFocus;
        exit;
      end;

      if (qryFichaHISTORICO.IsNull) then
      begin
        ShowMessage('Informe o Histórico!');
        DBEdit3.SetFocus;
        exit;
      end;

      if (not(qryFichaENTRADA.Value > 0)) and (not(qryFichaSAIDA.Value > 0))
      then
      begin
        ShowMessage('Digite o Valor!');
        DBEdit4.SetFocus;
        exit;
      end;

      qryFicha.Post;
      Dados.Conexao.CommitRetaining;

      close;
    end;
  except
    On e: exception do
      raise exception.Create(e.message);
  end;
end;

procedure TfrmCadFichaCliente.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFichaCliente.qryFichaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadFichaCliente.qryFichaBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryClientes.close;
  Dados.qryClientes.Open;
end;

end.
