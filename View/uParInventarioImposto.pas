unit uParInventarioImposto;

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
  TfrmParCSOSNCST = class(TForm)
    MaskInicio: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBInventario: TfrxDBDataset;
    qryInventario: TFDQuery;
    Label3: TLabel;
    MaskFim: TDateTimePicker;
    qryInventarioTIPO: TStringField;
    qryInventarioCST: TStringField;
    qryInventarioCSOSN: TStringField;
    qryInventarioENTRADA: TFMTBCDField;
    qryInventarioSAIDA: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure bbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParCSOSNCST: TfrmParCSOSNCST;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParCSOSNCST.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParCSOSNCST.btnImpClick(Sender: TObject);
begin
  qryInventario.close;
  qryInventario.Params[0].Value := MaskInicio.Date;
  qryInventario.Params[1].Value := MaskFim.Date;
  qryInventario.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelCsosn_Cst.fr3');

  frxReport.ShowReport;

end;

procedure TfrmParCSOSNCST.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParCSOSNCST.FormCreate(Sender: TObject);
begin

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := EndOfTheMonth(Date);

end;

procedure TfrmParCSOSNCST.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    vk_escape:
      bbSairClick(self);
  end;
end;

procedure TfrmParCSOSNCST.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
    Value := 'Lista CSOSN/CST Ref:' + datetostr(MaskInicio.Date) + ' até ' +
      datetostr(MaskFim.Date);
end;

end.
