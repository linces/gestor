unit uParResumoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  frxExportXLS;

type
  TfrmParResumoCaixa = class(TForm)
    MaskInicio: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    qryCaixas: TFDQuery;
    Label3: TLabel;
    Label1: TLabel;
    cbCaixa: TDBLookupComboboxEh;
    Label2: TLabel;
    CbUsuario: TDBLookupComboboxEh;
    qryCaixasID_USUARIO: TIntegerField;
    qryCaixasLOTE: TIntegerField;
    qryCaixasINICIO: TTimeField;
    qryCaixasFIM: TTimeField;
    qryCaixasPERIODO: TStringField;
    dsCaixas: TDataSource;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    qryUsuarioCODIGO: TSmallintField;
    qryUsuarioLOGIN: TStringField;
    qryResumo: TFDQuery;
    qryResumoHISTORICO: TStringField;
    qryResumoTIPO: TStringField;
    qryResumoENTRADA: TFMTBCDField;
    qryResumoSAIDA: TFMTBCDField;
    qryResumoTTOTAL: TAggregateField;
    qryResumoTTENTRADA: TAggregateField;
    qryResumoTTSAIDA: TAggregateField;
    dsResumo: TDataSource;
    frxDBResumo: TfrxDBDataset;
    qryCaixasDESCRICAO: TStringField;
    frxXLSExport1: TfrxXLSExport;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure qryCaixasCalcFields(DataSet: TDataSet);
    procedure CbUsuarioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    NomeCaixa: String;
    TDinheiro: Extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParResumoCaixa: TfrmParResumoCaixa;

implementation

{$R *.dfm}

uses Udados, uResumoCaixa;

procedure TfrmParResumoCaixa.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParResumoCaixa.btnImpClick(Sender: TObject);
begin


  if CbUsuario.KeyValue = null then
  begin
    ShowMessage('Selecione o usuário!');
    exit;
  end;

  if cbCaixa.KeyValue = null then
  begin
    ShowMessage('Selecione o Caixa!');
    exit;
  end;

  try
    frmResumoCaixa := TfrmResumoCaixa.Create(application);
    frmResumoCaixa.Caption := 'Fechamento de Caixa - Usuário:' + dados.vUsuario;
    frmResumoCaixa.btnImprimir.Visible := false;
    frmResumoCaixa.Tag := 2;
    frmResumoCaixa.FLote := cbCaixa.KeyValue;;
    frmResumoCaixa.FUsuario := CbUsuario.KeyValue;
    frmResumoCaixa.ShowModal;
  finally

    frmResumoCaixa.Release;
  end;

end;

procedure TfrmParResumoCaixa.CbUsuarioExit(Sender: TObject);
begin
  qryCaixas.close;
  qryCaixas.Params[0].Value := MaskInicio.Date;
  qryCaixas.Params[1].Value := -1;
  if CbUsuario.KeyValue <> null then
    qryCaixas.Params[1].Value := CbUsuario.KeyValue;
  qryCaixas.Open;
end;

procedure TfrmParResumoCaixa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParResumoCaixa.FormCreate(Sender: TObject);
begin

  qryUsuario.close;
  qryUsuario.Open;

  qryCaixas.close;
  qryCaixas.Open;

  MaskInicio.Date := Date;

end;

procedure TfrmParResumoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParResumoCaixa.FormShow(Sender: TObject);
begin
  MaskInicio.Date := Date;
end;

procedure TfrmParResumoCaixa.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'TOTAL' then
    Value := TDinheiro;

  if VarName = 'PARAMETROS' then
  begin
    Value := 'DATA:' + datetostr(MaskInicio.Date) + ' | TURNO:' + cbCaixa.Text +
      ' | USUÁRIO:' + CbUsuario.Text + ' | CAIXA:' + NomeCaixa;
  end;
end;

procedure TfrmParResumoCaixa.qryCaixasCalcFields(DataSet: TDataSet);
begin
  qryCaixasPERIODO.Value := FormatDateTime('hh:mm', qryCaixasINICIO.Value) +
    ' - ' + FormatDateTime('hh:mm', qryCaixasFIM.Value);
end;

end.
