unit uParCFOP_CSOSN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  frxExportXLS;

type
  TfrmParCSOSN_CFOP = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Panel1: TPanel;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    chkPeriodo: TCheckBox;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBVendas: TfrxDBDataset;
    qryVendas: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    qryVendasTIPO: TStringField;
    qryVendasCFOP: TStringField;
    qryVendasTOTAL: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure bbSairClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskInicioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParCSOSN_CFOP: TfrmParCSOSN_CFOP;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParCSOSN_CFOP.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParCSOSN_CFOP.btnImpClick(Sender: TObject);
begin

  if chkPeriodo.Checked then
  begin
    qryVendas.close;
    qryVendas.Params[0].Value := MaskInicio.Date;
    qryVendas.Params[1].Value := MaskFim.Date;
    qryVendas.Params[2].Value := DADOS.qryEmpresaCODIGO.Value;
    qryVendas.Open;
  end
  else
  begin
    qryVendas.close;
    qryVendas.Params[0].Value := StrToDate('01/01/1900');
    qryVendas.Params[1].Value := StrToDate('31/12/9999');
    qryVendas.Params[2].Value := DADOS.qryEmpresaCODIGO.Value;
    qryVendas.Open;
  end;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelCFOP_CST_CSOSN.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParCSOSN_CFOP.FormActivate(Sender: TObject);
begin
  DADOS.vForm := nil;
  DADOS.vForm := self;
  DADOS.GetComponentes;
end;

procedure TfrmParCSOSN_CFOP.FormCreate(Sender: TObject);
begin
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmParCSOSN_CFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParCSOSN_CFOP.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin

  if chkPeriodo.Checked then
  begin
    if VarName = 'PARAMETRO' then
    begin
      Value := 'PERÍODO DE ' + datetostr(MaskInicio.Date) + ' ATÉ ' +
        datetostr(MaskFim.Date);
    end;
  end;

  if not chkPeriodo.Checked then
  begin
    if VarName = 'PARAMETRO' then
      Value := 'TODOS';

  end;

end;

procedure TfrmParCSOSN_CFOP.MaskInicioExit(Sender: TObject);
begin
  MaskFim.Date := EndOfTheMonth(MaskInicio.Date);
end;

end.
