unit uParOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, frxClass, frxDBSet, frxExportPDF, DBGridEh, Vcl.Mask, DBCtrlsEh,
  DBLookupEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dateutils, frxExportBaseDialog;

type
  TfrmParOrcamento = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBOrcamento: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    lblTitulo: TLabel;
    cbVendedor: TDBLookupComboboxEh;
    qryVendedor: TFDQuery;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    dsVendedor: TDataSource;
    qryOrcamento: TFDQuery;
    Label2: TLabel;
    cbCliente: TDBLookupComboboxEh;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesCLI: TStringField;
    dsClientes: TDataSource;
    Label3: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    chkPeriodo: TCheckBox;
    qryOrcamentoCODIGO: TIntegerField;
    qryOrcamentoDATA: TDateField;
    qryOrcamentoFKVENDEDOR: TIntegerField;
    qryOrcamentoFK_CLIENTE: TIntegerField;
    qryOrcamentoCLIENTE: TStringField;
    qryOrcamentoTELEFONE: TStringField;
    qryOrcamentoCELULAR: TStringField;
    qryOrcamentoENDERECO: TStringField;
    qryOrcamentoNUMERO: TStringField;
    qryOrcamentoBAIRRO: TStringField;
    qryOrcamentoCIDADE: TStringField;
    qryOrcamentoUF: TStringField;
    qryOrcamentoCNPJ: TStringField;
    qryOrcamentoFORMA_PAGAMENTO: TStringField;
    qryOrcamentoVALIDADE: TSmallintField;
    qryOrcamentoOBS: TMemoField;
    qryOrcamentoSITUACAO: TStringField;
    qryOrcamentoCEP: TStringField;
    qryOrcamentoFKEMPRESA: TIntegerField;
    qryOrcamentoVENDEDOR: TStringField;
    qryOrcamentoTOTAL: TFMTBCDField;
    qryOrcamentoSUBTOTAL: TFMTBCDField;
    qryOrcamentoPERCENTUAL: TFMTBCDField;
    qryOrcamentoDESCONTO: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParOrcamento: TfrmParOrcamento;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParOrcamento.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParOrcamento.btnImpClick(Sender: TObject);
var
  vSql, filtro: string;
  data1, data2: tdate;
begin
  vSql := ' select orc.*, ve.nome vendedor from orcamento orc ' +
    ' left join vendedores ve on ve.codigo=orc.fkvendedor ' + ' where' +
    ' (orc.data between :data1 and :data2) ' + ' /*where*/ ' +
    ' order by orc.data, orc.codigo';

  data1 := strtodate('01/01/0100');
  data2 := strtodate('31/12/9999');

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND (ORC.FKEMPRESA=' +
        inttostr(cbEmpresa.KeyValue) + ')';

  if cbCliente.KeyValue <> null then
    if cbCliente.KeyValue <> 0 then
      filtro := filtro + ' AND (ORC.FK_CLIENTE=' +
        inttostr(cbCliente.KeyValue) + ')';

  if cbVendedor.KeyValue <> null then
    if cbVendedor.KeyValue <> 0 then
      filtro := filtro + ' AND (ORC.FKVENDEDOR=' +
        inttostr(cbVendedor.KeyValue) + ')';

  if chkPeriodo.Checked then
  begin
    data1 := MaskInicio.Date;
    data2 := MaskFim.Date;
  end;

  qryOrcamento.close;
  qryOrcamento.SQL.Text := vSql;
  qryOrcamento.SQL.Text := StringReplace(qryOrcamento.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);
  qryOrcamento.Params[0].Value := data1;
  qryOrcamento.Params[1].Value := data2;
  qryOrcamento.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelHistOrcamento.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParOrcamento.FormCreate(Sender: TObject);
begin

  qryVendedor.close;
  qryVendedor.Open;

  qryClientes.close;
  qryClientes.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

  cbVendedor.KeyValue := 0;
  cbCliente.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    vk_escape:
      bbSairClick(self);
  end;
end;

procedure TfrmParOrcamento.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  if cbEmpresa.KeyValue <> null then
    filtro := filtro + ' EMPRESA:' + cbEmpresa.Text;

  if cbCliente.KeyValue <> null then
    filtro := filtro + ' CLIENTE:' + cbCliente.Text;

  if cbVendedor.KeyValue <> null then
    filtro := filtro + ' VENDEDOR:' + cbVendedor.Text;

  if (chkPeriodo.Checked) then
    filtro := filtro + ' | PERÍODO DE:' + datetostr(MaskInicio.Date) + ' ATÉ ' +
      datetostr(MaskFim.Date);
  if VarName = 'PARAMETRO' then
  begin
    Value := filtro;
  end;

end;

end.
