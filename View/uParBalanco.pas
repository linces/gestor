unit uParBalanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog;

type
  TfrmParBalanco = class(TForm)
    MaskInicio: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBBalanco: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryBalanco: TFDQuery;
    Label3: TLabel;
    Label4: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryBalancoNOME: TStringField;
    Maskfim: TDateTimePicker;
    Label1: TLabel;
    qryBalancoCONTA: TStringField;
    qryBalancoDATA: TDateField;
    qryBalancoENTRADA: TFMTBCDField;
    qryBalancoSAIDA: TFMTBCDField;
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
  frmParBalanco: TfrmParBalanco;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParBalanco.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParBalanco.btnImpClick(Sender: TObject);
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

  qryBalanco.close;
  qryBalanco.ParamByName('DATA1').AsDate := MaskInicio.Date;
  qryBalanco.ParamByName('DATA2').AsDate := Maskfim.Date;
  qryBalanco.ParamByName('ID1').Value := ID1;
  qryBalanco.ParamByName('ID2').Value := ID2;
  qryBalanco.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelBalancoFi.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParBalanco.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParBalanco.FormCreate(Sender: TObject);
begin
  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(date);
  Maskfim.Date    := EndOfTheMonth(date);
end;

procedure TfrmParBalanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParBalanco.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParBalanco.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'PERÍODO DE :' + datetostr(MaskInicio.Date) +  'ATÉ: ' + datetostr(Maskfim.Date)+ ' | EMPRESA:' +
      cbEmpresa.Text;
  end;
end;

end.
