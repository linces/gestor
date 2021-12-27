unit uHistoricoPorduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  dateutils,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh, frxClass,
  frxDBSet, frxExportPDF, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxExportBaseDialog, frxExportXLS;

type
  TfrmHistoricoProduto = class(TForm)
    Label1: TLabel;
    cbProduto: TDBLookupComboboxEh;
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    qryproduto: TFDQuery;
    qryprodutoCODIGO: TIntegerField;
    qryprodutoDESCRICAO: TStringField;
    dsProduto: TDataSource;
    qryHistorico: TFDQuery;
    qryHistoricoTIPO: TStringField;
    qryHistoricoCODIGO: TIntegerField;
    qryHistoricoDESCRICAO: TStringField;
    qryHistoricoDATA: TDateField;
    qryHistoricoNUMERO: TIntegerField;
    frxDBHistorico: TfrxDBDataset;
    cbRef: TDBLookupComboboxEh;
    Label2: TLabel;
    qryReferencia: TFDQuery;
    dsRef: TDataSource;
    qryReferenciaREFERENCIA: TStringField;
    qryReferenciaCODIGO: TStringField;
    cbCodigo: TDBLookupComboboxEh;
    Label3: TLabel;
    qryCodigo: TFDQuery;
    StringField1: TStringField;
    dsCodigo: TDataSource;
    Label4: TLabel;
    qryHistoricoQTDRENTRADA: TFMTBCDField;
    qryHistoricoQTDRSAIDA: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskInicioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbRefChange(Sender: TObject);
    procedure cbCodigoChange(Sender: TObject);
    procedure cbCodigoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    vSql: string;
  public
    { Public declarations }
  end;

var
  frmHistoricoProduto: TfrmHistoricoProduto;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmHistoricoProduto.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmHistoricoProduto.btnImpClick(Sender: TObject);
var
  Cod1, Cod2: Integer;
  Data1, Data2: TDate;

begin
  chkPeriodo.SetFocus;
  Cod1 := 0;
  Cod2 := 1000000;
  Data1 := strtodate('01/01/1000');
  Data2 := strtodate('31/12/9999');

  if cbProduto.KeyValue <> null then
    if cbProduto.KeyValue <> 0 then
    begin
      Cod1 := cbProduto.KeyValue;
      Cod2 := cbProduto.KeyValue;
    end;

  if chkPeriodo.Checked then
  begin
    Data1 := MaskInicio.date;
    Data2 := MaskFim.date;
  end;

  qryHistorico.close;
  qryHistorico.Params[0].Value := Data1;
  qryHistorico.Params[1].Value := Data2;
  qryHistorico.Params[2].Value := Cod1;
  qryHistorico.Params[3].Value := Cod2;
  qryHistorico.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelHistoricoProduto.fr3');
  frxReport.ShowReport;

end;

procedure TfrmHistoricoProduto.cbCodigoChange(Sender: TObject);
begin
  cbProduto.KeyValue := cbCodigo.KeyValue;
  cbRef.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmHistoricoProduto.cbCodigoExit(Sender: TObject);
begin
  cbCodigo.KeyValue := cbProduto.KeyValue;
  cbRef.KeyValue := cbProduto.KeyValue;
end;

procedure TfrmHistoricoProduto.cbRefChange(Sender: TObject);
begin
  cbCodigo.KeyValue := cbRef.KeyValue;
  cbProduto.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmHistoricoProduto.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmHistoricoProduto.FormCreate(Sender: TObject);
begin
  MaskInicio.date := StartOfTheMonth(date);
  MaskFim.date := date;

  qryproduto.close;
  qryproduto.Open;

  qryReferencia.close;
  qryReferencia.Open;

  qryCodigo.close;
  qryCodigo.Open;

  cbProduto.KeyValue := 0;
  cbRef.KeyValue := 0;
  cbCodigo.KeyValue := 0;

end;

procedure TfrmHistoricoProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f4 then
    btnImpClick(self);

  if Key = vk_escape then
    close;
end;

procedure TfrmHistoricoProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmHistoricoProduto.MaskInicioExit(Sender: TObject);
begin
  MaskFim.date := EndOfTheMonth(MaskInicio.date);
end;

end.
