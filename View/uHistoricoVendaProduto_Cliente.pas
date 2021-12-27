unit uHistoricoVendaProduto_Cliente;

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
  TfrmHistoricoVendaProduto_Cliente = class(TForm)
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBHistorico: TfrxDBDataset;
    Label6: TLabel;
    cbCliente: TDBLookupComboboxEh;
    qryHistorico: TFDQuery;
    qryHistoricoDATA: TDateField;
    qryHistoricoREFERENCIA: TStringField;
    qryHistoricoNUMERO: TIntegerField;
    qryHistoricoCODIGO: TIntegerField;
    qryHistoricoDESCRICAO: TStringField;
    qryHistoricoQTD: TFMTBCDField;
    qryHistoricoTOTAL: TFMTBCDField;
    qryCliente: TFDQuery;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    dsCliente: TDataSource;
    Label4: TLabel;
    cbTipo: TComboBox;
    Label5: TLabel;
    cbGrupo: TDBLookupComboboxEh;
    qryGrupos: TFDQuery;
    qryGruposCODIGO: TIntegerField;
    qryGruposDESCRICAO: TStringField;
    dsGrupos: TDataSource;
    qryHistoricoRAZAO: TStringField;
    qryHistoricoGRUPO: TStringField;
    qryHistoricoIDPESSOA: TIntegerField;
    qryHistoricoR: TFDQuery;
    frxDBHistoricor: TfrxDBDataset;
    qryHistoricoRIDPESSOA: TIntegerField;
    qryHistoricoRRAZAO: TStringField;
    qryHistoricoRCODIGO: TIntegerField;
    qryHistoricoRDESCRICAO: TStringField;
    qryHistoricoRGRUPO: TStringField;
    qryHistoricoRQTD: TFMTBCDField;
    qryHistoricoRTOTAL: TFMTBCDField;
    Label2: TLabel;
    cbRef: TDBLookupComboboxEh;
    cbCodigo: TDBLookupComboboxEh;
    Label3: TLabel;
    Label1: TLabel;
    cbProduto: TDBLookupComboboxEh;
    qryCodigo: TFDQuery;
    StringField1: TStringField;
    dsRef: TDataSource;
    dsProduto: TDataSource;
    qryproduto: TFDQuery;
    qryprodutoCODIGO: TIntegerField;
    qryprodutoDESCRICAO: TStringField;
    qryReferencia: TFDQuery;
    qryReferenciaCODIGO: TStringField;
    qryReferenciaREFERENCIA: TStringField;
    dsCodigo: TDataSource;
    frxXLSExport1: TfrxXLSExport;
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormActivate(Sender: TObject);
    procedure cbRefExit(Sender: TObject);
    procedure cbCodigoExit(Sender: TObject);
  private
    { Private declarations }
    vSql: string;
    procedure Detalhado;
    procedure Resumo;
  public
    { Public declarations }
  end;

var
  frmHistoricoVendaProduto_Cliente: TfrmHistoricoVendaProduto_Cliente;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmHistoricoVendaProduto_Cliente.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmHistoricoVendaProduto_Cliente.Detalhado;
var
  Data1, Data2: TDate;

begin
  Data1 := strtodate('01/01/1000');
  Data2 := strtodate('31/12/9999');

  if chkPeriodo.Checked then
  begin
    Data1 := MaskInicio.date;
    Data2 := MaskFim.date;
  end;

  qryHistorico.close;
  qryHistorico.Params[0].Value := Data1;
  qryHistorico.Params[1].Value := Data2;
  qryHistorico.Params[2].Value := '%';
  qryHistorico.Params[3].Value := '%';
  qryHistorico.Params[4].Value := '%';

  if cbCliente.KeyValue <> 0 then
    qryHistorico.Params[2].Value := cbCliente.KeyValue;

  if cbGrupo.KeyValue <> 0 then
    qryHistorico.Params[3].Value := cbGrupo.KeyValue;

  if cbProduto.KeyValue <> 0 then
    qryHistorico.Params[4].Value := cbProduto.KeyValue;

  qryHistorico.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelHistoricoVendaProdutoCliente.fr3');
  frxReport.ShowReport;

end;

procedure TfrmHistoricoVendaProduto_Cliente.Resumo;
var
  Data1, Data2: TDate;

begin
  Data1 := strtodate('01/01/1000');
  Data2 := strtodate('31/12/9999');

  if chkPeriodo.Checked then
  begin
    Data1 := MaskInicio.date;
    Data2 := MaskFim.date;
  end;

  qryHistoricoR.close;
  qryHistoricoR.Params[0].Value := Data1;
  qryHistoricoR.Params[1].Value := Data2;
  qryHistoricoR.Params[2].Value := '%';
  qryHistoricoR.Params[3].Value := '%';
  qryHistoricoR.Params[4].Value := '%';

  if cbCliente.KeyValue <> 0 then
    qryHistoricoR.Params[2].Value := cbCliente.KeyValue;

  if cbGrupo.KeyValue <> 0 then
    qryHistoricoR.Params[3].Value := cbGrupo.KeyValue;

  if cbProduto.KeyValue <> 0 then
    qryHistoricoR.Params[4].Value := cbProduto.KeyValue;

  qryHistoricoR.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelHistoricoVendaProdutoClienteR.fr3');
  frxReport.ShowReport;

end;

procedure TfrmHistoricoVendaProduto_Cliente.btnImpClick(Sender: TObject);
begin

  MaskInicio.SetFocus;

  if cbTipo.Text = 'Resumido' then
    Resumo
  else
    Detalhado;

end;

procedure TfrmHistoricoVendaProduto_Cliente.cbCodigoExit(Sender: TObject);
begin
  cbProduto.KeyValue := cbCodigo.KeyValue;
  cbRef.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmHistoricoVendaProduto_Cliente.cbRefExit(Sender: TObject);
begin
  cbCodigo.KeyValue := cbRef.KeyValue;
  cbProduto.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmHistoricoVendaProduto_Cliente.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmHistoricoVendaProduto_Cliente.FormCreate(Sender: TObject);
begin
  MaskInicio.date := StartOfTheMonth(date);
  MaskFim.date := date;

  qryCliente.close;
  qryCliente.Open;

  qryGrupos.close;
  qryGrupos.Open;

  qryproduto.close;
  qryproduto.Open;

  qryReferencia.close;
  qryReferencia.Open;

  qryCodigo.close;
  qryCodigo.Open;

  cbProduto.KeyValue := 0;
  cbRef.KeyValue := 0;
  cbCodigo.KeyValue := 0;
  cbCliente.KeyValue := 0;
  cbGrupo.KeyValue := 0;
  cbTipo.ItemIndex := 0;
end;

procedure TfrmHistoricoVendaProduto_Cliente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_f4 then
    btnImpClick(self);

  if Key = vk_escape then
    close;
end;

procedure TfrmHistoricoVendaProduto_Cliente.frxReportGetValue
  (const VarName: string; var Value: Variant);
var
  Filtro: String;
begin
  Filtro := '';

  if cbCliente.KeyValue <> 0 then
    Filtro := Filtro + 'CLIENTE:' + cbCliente.Text;

  if cbGrupo.KeyValue <> 0 then
    Filtro := Filtro + ' GRUPO:' + cbGrupo.Text;

  if (chkPeriodo.Checked) then
    Filtro := Filtro + ' PERÍODO DE:' + datetostr(MaskInicio.date) + ' ATÉ ' +
      datetostr(MaskFim.date);

  if VarName = 'PARAMETRO' then
  begin
    if Filtro <> '' then
      Value := Filtro
    else
      Value := '<Todos>';
  end;

end;

end.
