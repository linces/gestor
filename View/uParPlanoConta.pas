unit uParPlanoConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxChart,
  frxExportBaseDialog, FireDAC.DatS, frxExportXLS;

type
  TfrmParPlanoConta = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxPlanoR: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryFinanceiroD: TFDQuery;
    qryUsuarioCODIGO: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    cbPlano: TDBLookupComboboxEh;
    Label1: TLabel;
    qryPlano: TFDQuery;
    IntegerField1: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    dsPlano: TDataSource;
    qryFinanceiroDCODIGO: TIntegerField;
    qryFinanceiroDDOC: TStringField;
    qryFinanceiroDEMISSAO: TDateField;
    qryFinanceiroDPLANO: TStringField;
    qryFinanceiroDHISTORICO: TStringField;
    qryFinanceiroDENTRADA: TFMTBCDField;
    qryFinanceiroDSAIDA: TFMTBCDField;
    qryFinanceiroR: TFDQuery;
    qryFinanceiroRCODIGO: TIntegerField;
    qryFinanceiroRPLANO: TStringField;
    qryFinanceiroRENTRADA: TFMTBCDField;
    qryFinanceiroRSAIDA: TFMTBCDField;
    cbTipo: TComboBox;
    lblTitulo: TLabel;
    frxPlanoD: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    qryFinanceiroDCONTA_COMPLETA: TStringField;
    qryFinanceiroRCONTA_COMPLETA: TStringField;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSqlD, vSqlR: string;
    vSaldoMes: Extended;
    procedure Detalhado;
    procedure Resumido;
    { Private declarations }
  public
    { Public declarations }
    DTIni, DTFim: TDate;
  end;

var
  frmParPlanoConta: TfrmParPlanoConta;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParPlanoConta.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParPlanoConta.Resumido;
var
  filtro: string;
begin
  filtro := '';

  if vSqlR = '' then
    vSqlR := qryFinanceiroR.SQL.Text;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' and cx.empresa=' + inttostr(cbEmpresa.KeyValue);

  if cbPlano.KeyValue <> null then
    if cbPlano.KeyValue <> 0 then
      filtro := filtro + ' and cx.FKPLANO=' + inttostr(cbPlano.KeyValue);

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;

  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1900');
    DTFim := strtodate('01/12/9999');
  end;

  qryFinanceiroR.close;
  qryFinanceiroR.SQL.Text := vSqlR;
  qryFinanceiroR.SQL.Text := StringReplace(qryFinanceiroR.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);
  qryFinanceiroR.Params[0].AsDate := DTIni;
  qryFinanceiroR.Params[1].AsDate := DTFim;
  qryFinanceiroR.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelFinanceiroPlanoR.fr3');
  frxReport.ShowReport;
end;

procedure TfrmParPlanoConta.btnImpClick(Sender: TObject);
begin
  case cbTipo.ItemIndex of
    0:
      Resumido;
    1:
      Detalhado;
  end;

end;

procedure TfrmParPlanoConta.Detalhado;
var
  filtro: string;
begin
  filtro := '';

  if vSqlD = '' then
    vSqlD := qryFinanceiroD.SQL.Text;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' and cx.empresa=' + inttostr(cbEmpresa.KeyValue);

  if cbPlano.KeyValue <> null then
    if cbPlano.KeyValue <> 0 then
      filtro := filtro + ' and cx.FKPLANO=' + inttostr(cbPlano.KeyValue);

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;

  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1900');
    DTFim := strtodate('01/12/9999');
  end;

  qryFinanceiroD.close;
  qryFinanceiroD.SQL.Text := vSqlD;
  qryFinanceiroD.SQL.Text := StringReplace(qryFinanceiroD.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);
  qryFinanceiroD.Params[0].AsDate := DTIni;
  qryFinanceiroD.Params[1].AsDate := DTFim;
  qryFinanceiroD.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelFinanceiroPlanoD.fr3');
  frxReport.ShowReport;
end;

procedure TfrmParPlanoConta.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParPlanoConta.FormCreate(Sender: TObject);
begin
  qryUsuario.close;
  qryUsuario.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  qryPlano.close;
  qryPlano.Open;

  MaskInicio.Date := StartOfTheMonth(Date);

end;

procedure TfrmParPlanoConta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParPlanoConta.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := 0;
  cbPlano.KeyValue := 0;
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmParPlanoConta.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'Empresa:' + cbEmpresa.Text + ' | Periodo de :' + datetostr(DTIni)
      + ' até ' + datetostr(DTFim);
  end;
end;

end.
