unit uParFPG;

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
  TfrmParFPG = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBFPG: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryDiario: TFDQuery;
    qryUsuarioCODIGO: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    qryDiarioDESCRICAO: TStringField;
    qryDiarioVALOR: TFMTBCDField;
    cbTipo: TComboBox;
    lblTitulo: TLabel;
    qryDiarioD: TFDQuery;
    qryDiarioDDESCRICAO: TStringField;
    qryDiarioDCODIGO: TIntegerField;
    qryDiarioDDATA_EMISSAO: TDateField;
    qryDiarioDCAIXA: TStringField;
    qryDiarioDLOGIN: TStringField;
    qryDiarioDVALOR: TFMTBCDField;
    frxDBFPGD: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSql1,vSql2: string;
    vSaldoMes: Extended;
    procedure ImprimeResumido;
    procedure ImprimeDetalhado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParFPG: TfrmParFPG;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParFPG.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParFPG.ImprimeResumido;
var
  filtro: string;
  DTIni, DTFim: TDate;
begin
  filtro := '';
  if vSql1 = '' then
    vSql1 := qryDiario.SQL.Text;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' and vm.fkempresa=' + inttostr(cbEmpresa.KeyValue);

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;
  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1900');
    DTFim := strtodate('01/12/9999');
  end;

  qryDiario.close;
  qryDiario.SQL.Text := vSql1;
  qryDiario.SQL.Text := StringReplace(qryDiario.SQL.Text, '/*where*/', filtro,
    [rfReplaceAll]);
  qryDiario.Params[0].AsDate := DTIni;
  qryDiario.Params[1].AsDate := DTFim;
  qryDiario.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelVendasFpg.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParFPG.ImprimeDetalhado;
var
  filtro: string;
  DTIni, DTFim: TDate;
begin
  filtro := '';

  if vSql2 = '' then
    vSql2 := qryDiarioD.SQL.Text;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' and vm.fkempresa=' + inttostr(cbEmpresa.KeyValue);

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;
  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1900');
    DTFim := strtodate('01/12/9999');
  end;

  qryDiarioD.close;
  qryDiarioD.SQL.Text := vSql2;
  qryDiarioD.SQL.Text := StringReplace(qryDiarioD.SQL.Text, '/*where*/', filtro,
    [rfReplaceAll]);
  qryDiarioD.Params[0].AsDate := DTIni;
  qryDiarioD.Params[1].AsDate := DTFim;
  qryDiarioD.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelVendasFPGD.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParFPG.btnImpClick(Sender: TObject);
begin
  if cbTipo.ItemIndex = 0 then
    ImprimeResumido
  else
    ImprimeDetalhado;
end;

procedure TfrmParFPG.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParFPG.FormCreate(Sender: TObject);
begin
  qryUsuario.close;
  qryUsuario.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(Date);

end;

procedure TfrmParFPG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParFPG.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := 0;
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmParFPG.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'Empresa:' + cbEmpresa.Text + ' | Periodo de :' +
      datetostr(MaskInicio.Date) + ' até' + datetostr(MaskFim.Date);
  end;
end;

end.
