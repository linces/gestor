unit uParCurvaABC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, Vcl.Mask, DBGridEh,
  DBCtrlsEh, DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmParCurvaABC = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Panel1: TPanel;
    chkPeriodo: TCheckBox;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBVendas: TfrxDBDataset;
    qryVendas: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    MaskInicio: TMaskEdit;
    MaskFim: TMaskEdit;
    Label4: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryCurva: TFDQuery;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryVendasTTOTAL: TAggregateField;
    qryVendasID_PRODUTO: TIntegerField;
    qryVendasDESCRICAO: TStringField;
    qryVendasQTD: TFMTBCDField;
    qryVendasTOTAL: TFMTBCDField;
    qryVendasCURVA: TStringField;
    qryCurvaID_PRODUTO: TIntegerField;
    qryCurvaQTD: TFMTBCDField;
    qryCurvaTOTAL: TFMTBCDField;
    qryCurvaPERCENTUAL: TFMTBCDField;
    qryCurvaCURVA: TStringField;
    qryCurvaFKEMPRESA: TIntegerField;
    qryCurvaDESCRICAO: TStringField;
    frxXLSExport1: TfrxXLSExport;
    procedure btnImpClick(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    vSql: String;
  public
    { Public declarations }
  end;

var
  frmParCurvaABC: TfrmParCurvaABC;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParCurvaABC.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParCurvaABC.btnImpClick(Sender: TObject);
var
  filtro: string;
  Dataini, DataFim: TDate;
  Emp1, Emp2: Integer;
  vsoma: extended;
begin

  filtro := '';

  if vSql = '' then
    vSql := qryVendas.SQL.Text;

  Dataini := strtodate('01/01/1000');
  DataFim := strtodate('31/12/9999');

  if chkPeriodo.Checked then
  begin
    Dataini := strtodate(MaskInicio.EditText);
    DataFim := strtodate(MaskFim.EditText);
  end;

  Emp1 := 0;
  Emp2 := 1000;

  if cbEmpresa.KeyValue = null then
  begin
    if cbEmpresa.KeyValue <> 0 then
    begin
      Emp1 := cbEmpresa.KeyValue;
      Emp2 := cbEmpresa.KeyValue;
    end;
  end;

  qryVendas.close;
  qryVendas.Params[0].Value := Emp1;
  qryVendas.Params[1].Value := Emp2;
  qryVendas.Params[2].Value := Dataini;
  qryVendas.Params[3].Value := DataFim;
  qryVendas.Open;

  qryVendas.Last;

  vsoma := 0;

  qryVendas.First;

  dados.qryExecute.close;
  dados.qryExecute.SQL.Text := 'DELETE FROM CURVA_ABC';
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

  qryCurva.close;
  qryCurva.Open;

  while not qryVendas.Eof do
  begin
    vsoma := vsoma + qryVendasTOTAL.AsFloat;
    qryCurva.Insert;
    qryCurvaID_PRODUTO.Value := qryVendasID_PRODUTO.Value;
    qryCurvaQTD.Value := qryVendasQTD.AsFloat;
    qryCurvaTOTAL.Value := qryVendasTOTAL.AsFloat;
    qryCurvaPERCENTUAL.Value := 0;
    if qryVendasTTOTAL.AsVariant > 0 then
      qryCurvaPERCENTUAL.AsFloat := vsoma / qryVendasTTOTAL.AsVariant * 100;
    if qryCurvaPERCENTUAL.Value <= 80 then
      qryCurvaCURVA.Value := 'A';
    if (qryCurvaPERCENTUAL.Value > 80) and (qryCurvaPERCENTUAL.Value <= 95) then
      qryCurvaCURVA.Value := 'B';
    if qryCurvaPERCENTUAL.Value > 95 then
      qryCurvaCURVA.Value := 'C';
    qryCurva.Post;

    dados.Conexao.CommitRetaining;
    qryVendas.Next;
  end;

  if qryCurva.IsEmpty then
  begin
    ShowMessage('Não existe nenhum registro para ser visualizado!');
    exit;

  end;

  qryCurva.Refresh;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelCurvaABC.fr3');
  frxReport.ShowReport;
  vsoma := 0;

end;

procedure TfrmParCurvaABC.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParCurvaABC.FormCreate(Sender: TObject);
begin
  MaskInicio.Text := DateToStr(StartOfTheMonth(Date));
  MaskFim.Text := DateToStr(Date);

  qryEmpresa.close;
  qryEmpresa.Open;
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParCurvaABC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParCurvaABC.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if chkPeriodo.Checked then
  begin
    if VarName = 'PARAMETRO' then
    begin
      Value := 'PERÍODO DE ' + MaskInicio.EditText + ' ATÉ ' + MaskFim.EditText;
    end;
  end;

  if not chkPeriodo.Checked then
  begin
    if VarName = 'PARAMETRO' then
      Value := 'TODOS';

  end;

end;

end.
