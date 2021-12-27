unit uParProdutoFiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, frxClass,
  frxExportPDF, frxDBSet, frxExportBaseDialog, frxExportXLS;

type
  TfrmParProdutoFiscal = class(TForm)
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryProdutoR: TFDQuery;
    qryProdutoRFK_PRODUTO: TIntegerField;
    qryProdutoRDESCRICAO: TStringField;
    qryProdutoRENTRADA: TFMTBCDField;
    qryProdutoRSAIDA: TBCDField;
    qryProdutoRSALDO: TFMTBCDField;
    qryPesqProduto: TFDQuery;
    qryPesqProdutoCODIGO: TIntegerField;
    qryPesqProdutoDESCRICAO: TStringField;
    dsProduto: TDataSource;
    qryProdutoD: TFDQuery;
    qryProdutoDTIPO: TStringField;
    qryProdutoDNUMERO: TIntegerField;
    qryProdutoDFK_PRODUTO: TIntegerField;
    qryProdutoDDESCRICAO: TStringField;
    qryProdutoDENTRADA: TFMTBCDField;
    qryProdutoDSAIDA: TBCDField;
    MaskInicio: TDateTimePicker;
    chkPeriodo: TCheckBox;
    MaskFim: TDateTimePicker;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBProdutoD: TfrxDBDataset;
    frxDBProdutoR: TfrxDBDataset;
    qryProdutoDRAZAO: TStringField;
    frxXLSExport1: TfrxXLSExport;
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParProdutoFiscal: TfrmParProdutoFiscal;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParProdutoFiscal.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParProdutoFiscal.btnImpClick(Sender: TObject);
begin
  if DBLookupComboboxEh2.KeyValue = 0 then
  begin
    qryProdutoR.close;
    qryProdutoR.Open;
    frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
      '\Relatorio\RelProdutoR.fr3');
    frxReport.ShowReport;
  end
  else
  begin

    qryProdutoD.close;
    qryProdutoD.Params[0].Value := DBLookupComboboxEh2.KeyValue;
    qryProdutoD.Params[1].Value := '01/01/1000';
    qryProdutoD.Params[2].Value := '31/12/9999';
    if chkPeriodo.Checked then
    begin
      qryProdutoD.Params[1].AsDate := MaskInicio.Date;
      qryProdutoD.Params[2].AsDate := MaskFim.Date;
    end;
    qryProdutoD.Open;

    frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
      '\Relatorio\RelProdutoD.fr3');
    frxReport.ShowReport;

  end;
end;

procedure TfrmParProdutoFiscal.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParProdutoFiscal.FormCreate(Sender: TObject);
begin
  qryPesqProduto.close;
  qryPesqProduto.Open;
  DBLookupComboboxEh2.KeyValue := 0;
end;

end.
