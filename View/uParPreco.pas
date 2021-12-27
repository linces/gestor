unit uParPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frxExportXLS;

type
  TfrmPrecoAlterado = class(TForm)
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryProduto: TFDQuery;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoLOCALIZACAO: TStringField;
    qryProdutoPR_VENDA: TFMTBCDField;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBProduto: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    procedure bbSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecoAlterado: TfrmPrecoAlterado;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmPrecoAlterado.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrecoAlterado.btnImpClick(Sender: TObject);
begin
  if chkPeriodo.Checked then
  begin
    qryProduto.close;
    qryProduto.Params[0].AsDate := MaskInicio.Date;
    qryProduto.Params[1].AsDate := MaskFim.Date;
    qryProduto.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryProduto.Open;
  end
  else
  begin
    qryProduto.close;
    qryProduto.Params[0].AsDate := StrToDate('01/01/1900');
    qryProduto.Params[1].AsDate := StrToDate('31/12/9999');
    qryProduto.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryProduto.Open;

  end;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelProdutoPreco.fr3');
  frxReport.ShowReport;
end;

procedure TfrmPrecoAlterado.FormCreate(Sender: TObject);
begin
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmPrecoAlterado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmPrecoAlterado.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    if chkPeriodo.Checked then
      Value := 'PERÍODO DE ' + datetostr(MaskInicio.Date) + ' ATÉ ' +
        datetostr(MaskFim.Date)
    else
      Value := '';
  end;

end;

end.
