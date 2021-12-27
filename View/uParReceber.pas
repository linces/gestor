unit uParReceber;

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
  TfrmParReceber = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Label4: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label3: TLabel;
    cbSituacao: TComboBox;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesCLI: TStringField;
    dsClientes: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBReceber: TfrxDBDataset;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryCR: TFDQuery;
    qryCRTTOTAL: TAggregateField;
    qryCRTJUROS: TAggregateField;
    qryCRTDESCONTO: TAggregateField;
    qryCRTRECEBIDO: TAggregateField;
    qryCRTSALDO: TAggregateField;
    Label1: TLabel;
    cbPeriodo: TComboBox;
    MaskInicio: TDateTimePicker;
    Label5: TLabel;
    MaskFim: TDateTimePicker;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    qryCRTIPO: TStringField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryCRRAZAO: TStringField;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRDIAS_ATRASO: TFloatField;
    qryCRJUROS_ATRASO: TFloatField;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure qryCRCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParReceber: TfrmParReceber;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParReceber.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParReceber.btnImpClick(Sender: TObject);
var
  ordem, filtro, filtro1, filtro2: string;
  data1, data2: tdate;
  vSql: string;
begin
  filtro := '';
  filtro1 := '';
  filtro2 := '';

  if cbPeriodo.Text = '<Todos>' then
  begin

    ordem := ' order by cr.Data,cr.CODIGO';
    vSql := ' select CR.*, pessoa.razao from creceber CR ' +
      ' left join pessoa on pessoa.codigo=cr.fkcliente' + ' where' +
      ' cr.doc like :doc and' + ' cr.data between :data1 and :data2' +
      ' /*where*/ ' + ' /*ordem*/ ';

    dados.qryExecute.close;
    dados.qryExecute.SQL.Text :=
      'select min(data) menor, max(data) maior from creceber';
    dados.qryExecute.Open;

    data1 := dados.qryExecute.Fields[0].AsDateTime;
    data2 := dados.qryExecute.Fields[1].AsDateTime;
  end;

  if cbPeriodo.Text = 'Emissão' then
  begin

    ordem := ' order by cr.Data,cr.CODIGO';
    vSql := ' select CR.*, pessoa.razao from creceber CR ' +
      ' left join pessoa on pessoa.codigo=cr.fkcliente' + ' where' +
      ' cr.doc like :doc and' + ' cr.data between :data1 and :data2' +
      ' /*where*/ ' + ' /*ordem*/ ';

  end;

  if cbPeriodo.Text = 'Vencimento' then
  begin

    ordem := ' order by cr.DTVENCIMENTO,cr.CODIGO';
    vSql := ' select CR.*, pessoa.razao from creceber CR ' +
      ' left join pessoa on pessoa.codigo=cr.fkcliente' + ' where' +
      ' cr.doc like :doc and' + ' cr.DTVENCIMENTO between :data1 and :data2' +
      ' /*where*/ ' + ' /*ordem*/ ';

  end;

  if cbPeriodo.Text = 'Recebimento' then
  begin

    ordem := ' order by cr.DATA_RECEBIMENTO,cr.CODIGO';
    vSql := ' select CR.*, pessoa.razao from creceber CR ' +
      ' left join pessoa on pessoa.codigo=cr.fkcliente' + ' where' +
      ' cr.doc like :doc and' + ' cr.DATA_RECEBIMENTO between :data1 and :data2'
      + ' /*where*/ ' + ' /*ordem*/ ';

  end;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND CR.FKEMPRESA=' + inttostr(cbEmpresa.KeyValue);

  if DBLookupComboboxEh1.KeyValue <> null then
    if DBLookupComboboxEh1.KeyValue <> 0 then
      filtro := filtro + ' AND CR.FKCLIENTE=' +
        inttostr(DBLookupComboboxEh1.KeyValue);

  if cbPeriodo.Text <> '<Todos>' then
  begin
    data1 := MaskInicio.Date;
    data2 := MaskFim.Date;
  end;

  if cbSituacao.Text <> '<Todos>' then
  begin
    if cbSituacao.Text = 'À Receber' then
      filtro2 := ' and cr.dtvencimento>=current_date and cr.situacao<>''T''';
    if cbSituacao.Text = 'Recebidas' then
      filtro2 := ' and cr.situacao=''T''';
    if cbSituacao.Text = 'Atrasadas' then
      filtro2 := ' and cr.dtvencimento<current_date and cr.situacao<>''T''';
  end;

  qryCR.close;
  qryCR.SQL.Text := vSql;
  qryCR.SQL.Text := StringReplace(qryCR.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  qryCR.Params[0].Value := '%';
  qryCR.Params[1].Value := data1;
  qryCR.Params[2].Value := data2;
  qryCR.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelReceber.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParReceber.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParReceber.FormCreate(Sender: TObject);
begin
  qryClientes.close;
  qryClientes.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

end;

procedure TfrmParReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParReceber.FormShow(Sender: TObject);
begin
  DBLookupComboboxEh1.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParReceber.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    if cbPeriodo.Text = '<Todos>' then
      Value := '<TODO O PERÍODO>'
    else
      Value := cbPeriodo.Text + ' DE ' + datetostr(MaskInicio.Date) + ' ATÉ ' +
        datetostr(MaskFim.Date);
  end;

  if VarName = 'SALDO' then
    Value := FormatFloat(',0.00', vSaldoMes)
end;

procedure TfrmParReceber.qryCRCalcFields(DataSet: TDataSet);
begin
  qryCRDIAS_ATRASO.AsFloat := dados.DiasAtraso(qryCRDTVENCIMENTO.Value, Date,
    dados.qryEmpresaCARENCIA_JUROS.Value);
  qryCRJUROS_ATRASO.AsFloat :=
    ((qryCRDIAS_ATRASO.AsFloat * dados.qryEmpresaJUROS_DIA.AsFloat) * 100) *
    dados.qryCRTSALDO.Value;

end;

end.
