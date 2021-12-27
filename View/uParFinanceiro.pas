unit uParFinanceiro;

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
  TfrmParFinanceiro = class(TForm)
    MaskInicio: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBDiario: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryDiario: TFDQuery;
    Label3: TLabel;
    Label4: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryDiarioCONTA: TStringField;
    qryDiarioENTRADA: TFMTBCDField;
    qryDiarioSAIDA: TFMTBCDField;
    qryDiarioSALDO: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParFinanceiro: TfrmParFinanceiro;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParFinanceiro.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParFinanceiro.btnImpClick(Sender: TObject);
var
  id1, id2: integer;
begin
  id1 := 1;
  id2 := 100;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
    begin
      id1 := cbEmpresa.KeyValue;
      id2 := cbEmpresa.KeyValue;
    end;

  qryDiario.close;
  qryDiario.Params[0].AsDate := MaskInicio.Date;
  qryDiario.Params[1].AsInteger := id1;
  qryDiario.Params[2].AsInteger := id2;
  qryDiario.Open;
  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelFinanceiro.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParFinanceiro.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParFinanceiro.FormCreate(Sender: TObject);
begin
  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := Date;

end;

procedure TfrmParFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParFinanceiro.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := 0;
  MaskInicio.Date := Date;
end;

procedure TfrmParFinanceiro.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'DATA:' + datetostr(MaskInicio.Date) + ' | EMPRESA:' +
      cbEmpresa.Text;
  end;
end;

end.
