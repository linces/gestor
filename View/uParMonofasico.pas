unit uParMonofasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  DBGridEh, Vcl.Mask, DBCtrlsEh, DBLookupEh, frxExportXLS;

type
  TfrmParProdutoMono = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Panel1: TPanel;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    chkPeriodo: TCheckBox;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    qryVendasR: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    Label2: TLabel;
    cbRef: TDBLookupComboboxEh;
    cbCodigo: TDBLookupComboboxEh;
    cbProduto: TDBLookupComboboxEh;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbTipo: TComboBox;
    qryVendasD: TFDQuery;
    qryVendasDCODIGO: TIntegerField;
    qryVendasDDESCRICAO: TStringField;
    qryVendasDNUMERO: TIntegerField;
    qryVendasDDATA_EMISSAO: TDateField;
    qryVendasDTOTAL: TFMTBCDField;
    frxDBVendasD: TfrxDBDataset;
    dsCodigo: TDataSource;
    dsRef: TDataSource;
    qryCodigo: TFDQuery;
    StringField1: TStringField;
    qryReferencia: TFDQuery;
    qryReferenciaCODIGO: TStringField;
    qryReferenciaREFERENCIA: TStringField;
    dsProduto: TDataSource;
    qryproduto: TFDQuery;
    qryprodutoCODIGO: TIntegerField;
    qryprodutoDESCRICAO: TStringField;
    frxDBVendasR: TfrxDBDataset;
    qryVendasRCODIGO: TIntegerField;
    qryVendasRDESCRICAO: TStringField;
    qryVendasRTOTAL: TFMTBCDField;
    qryVendasRNCM: TStringField;
    qryVendasDTIPO: TStringField;
    qryVendasDCHAVE: TStringField;
    frxXLSExport1: TfrxXLSExport;
    procedure bbSairClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MaskInicioExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure cbRefExit(Sender: TObject);
    procedure cbCodigoExit(Sender: TObject);
  private
    procedure Resumido;
    procedure Detalhado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParProdutoMono: TfrmParProdutoMono;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParProdutoMono.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParProdutoMono.btnImpClick(Sender: TObject);
begin

  if cbTipo.ItemIndex = 0 then
    Resumido
  else
    Detalhado;

end;

procedure TfrmParProdutoMono.cbCodigoExit(Sender: TObject);
begin
  cbProduto.KeyValue := cbCodigo.KeyValue;
  cbRef.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmParProdutoMono.cbRefExit(Sender: TObject);
begin
  cbCodigo.KeyValue := cbRef.KeyValue;
  cbProduto.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmParProdutoMono.Resumido;
begin
  qryVendasR.close;
  if chkPeriodo.Checked then
  begin
    qryVendasR.Params[0].Value := MaskInicio.Date;
    qryVendasR.Params[1].Value := MaskFim.Date;
  end
  else
  begin
    qryVendasR.Params[0].Value := StrToDate('01/01/1900');
    qryVendasR.Params[1].Value := StrToDate('31/12/9999');
  end;
  qryVendasR.Params[2].Value := DADOS.qryEmpresaCODIGO.Value;
  qryVendasR.Open;
  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelProdutoMonoR.fr3');
  frxReport.ShowReport;
end;

procedure TfrmParProdutoMono.Detalhado;
begin
  qryVendasD.close;
  if chkPeriodo.Checked then
  begin
    qryVendasD.Params[0].Value := MaskInicio.Date;
    qryVendasD.Params[1].Value := MaskFim.Date;
  end
  else
  begin
    qryVendasD.Params[0].Value := StrToDate('01/01/1900');
    qryVendasD.Params[1].Value := StrToDate('31/12/9999');
  end;
  qryVendasD.Params[2].Value := DADOS.qryEmpresaCODIGO.Value;
  qryVendasD.Params[3].Value := '%';

  if cbProduto.KeyValue <> null then
    if cbProduto.KeyValue <> 0 then
      qryVendasD.Params[3].Value := cbProduto.KeyValue;
  qryVendasD.Open;
  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelProdutoMonoD.fr3');
  frxReport.ShowReport;
end;

procedure TfrmParProdutoMono.FormActivate(Sender: TObject);
begin
  DADOS.vForm := nil;
  DADOS.vForm := self;
  DADOS.GetComponentes;
end;

procedure TfrmParProdutoMono.FormCreate(Sender: TObject);
begin
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

  qryproduto.close;
  qryproduto.Open;

  qryReferencia.close;
  qryReferencia.Open;

  qryCodigo.close;
  qryCodigo.Open;

  cbProduto.KeyValue := 0;
  cbRef.KeyValue := 0;
  cbCodigo.KeyValue := 0;
  cbTipo.ItemIndex := 0;
end;

procedure TfrmParProdutoMono.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParProdutoMono.frxReportGetValue(const VarName: string;
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

procedure TfrmParProdutoMono.MaskInicioExit(Sender: TObject);
begin
  MaskFim.Date := EndOfTheMonth(MaskInicio.Date);
end;

end.
