unit uParPagar;

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
  TfrmParPagar = class(TForm)
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Label4: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label3: TLabel;
    cbSituacao: TComboBox;
    qryForn: TFDQuery;
    qryFornCODIGO: TIntegerField;
    qryFornRAZAO: TStringField;
    qryFornCNPJ: TStringField;
    dsForn: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBPagar: TfrxDBDataset;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryCP: TFDQuery;
    qryCPTTOTAL: TAggregateField;
    qryCPTJUROS: TAggregateField;
    qryCPTDESCONTO: TAggregateField;
    qryCPTRECEBIDO: TAggregateField;
    qryCPTSALDO: TAggregateField;
    qryFornFORN: TStringField;
    qryCPCODIGO: TIntegerField;
    qryCPDATA: TDateField;
    qryCPFKFORNECE: TIntegerField;
    qryCPDOC: TStringField;
    qryCPDTVENCIMENTO: TDateField;
    qryCPHISTORICO: TStringField;
    qryCPDATA_PAGAMENTO: TDateField;
    qryCPSITUACAO: TStringField;
    qryCPFKEMPRESA: TIntegerField;
    qryCPFK_COMPRA: TIntegerField;
    qryCPRAZAO: TStringField;
    Label1: TLabel;
    cbPeriodo: TComboBox;
    Label5: TLabel;
    qryCPVALOR: TCurrencyField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
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
  frmParPagar: TfrmParPagar;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParPagar.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParPagar.btnImpClick(Sender: TObject);
var
  ordem, filtro, filtro1, filtro2: string;
  data1, data2: tdate;
  vSql: string;
begin

  filtro := '';
  filtro1 := '';
  filtro2 := '';

  // todos as contas a pagar
  if (cbPeriodo.Text = '<Todos>') then
  begin

    ordem := ' order by cp.data';
    vSql := ' select CP.*, pessoa.razao from cpagar CP ' +
      ' left join pessoa on pessoa.codigo=cp.fkfornece' + ' where' +
      ' cp.doc like :doc and' + ' cp.data between :data1 and :data2 and' +
      ' cp.fkempresa=:id' + ' /*where*/' + ' /*ordem*/';

    dados.qryExecute.close;
    dados.qryExecute.SQL.Text :=
      'select min(data) menor, max(data) maior from cpagar';
    dados.qryExecute.Open;

    data1 := dados.qryExecute.Fields[0].AsDateTime;
    data2 := dados.qryExecute.Fields[1].AsDateTime;
  end;

  // por data de Emissão
  if cbPeriodo.Text = 'Emissão' then
  begin

    ordem := ' order by cp.DATA, cp.CODIGO';
    vSql := ' select CP.*, pessoa.razao from cpagar CP ' +
      ' left join pessoa on pessoa.codigo=cp.fkfornece' + ' where' +
      ' cp.doc like :doc and' + ' cp.DATA between :data1 and :data2 and' +
      ' cp.fkempresa=:id' + ' /*where*/' + ' /*ordem*/';
  end;


  // por data de vencimento
  if cbPeriodo.Text = 'Vencimento' then
  begin

    ordem := ' order by cp.DTVENCIMENTO, cp.CODIGO';
    vSql := ' select CP.*, pessoa.razao from cpagar CP ' +
      ' left join pessoa on pessoa.codigo=cp.fkfornece' + ' where' +
      ' cp.doc like :doc and' + ' cp.DTVENCIMENTO between :data1 and :data2 and' +
      ' cp.fkempresa=:id' + ' /*where*/' + ' /*ordem*/';
  end;

  // por data de pagamento
  if cbPeriodo.Text = 'Pagamento' then
  begin

    ordem := ' order by cp.DATA_PAGAMENTO, cp.CODIGO';
    vSql := ' select CP.*, pessoa.razao from cpagar CP ' +
      ' left join pessoa on pessoa.codigo=cp.fkfornece' + ' where' +
      ' cp.doc like :doc and' + ' cp.DATA_PAGAMENTO between :data1 and :data2 and' +
      ' cp.fkempresa=:id' + ' /*where*/' + ' /*ordem*/';
  end;


  //

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND CP.FKEMPRESA=' + inttostr(cbEmpresa.KeyValue);

  if DBLookupComboboxEh1.KeyValue <> null then
    if DBLookupComboboxEh1.KeyValue <> 0 then
      filtro := filtro + ' AND CP.FKFORNECE=' +
        inttostr(DBLookupComboboxEh1.KeyValue);

  if cbPeriodo.Text <> '<Todos>' then
  begin
    data1 := MaskInicio.Date;
    data2 := MaskFim.Date;
  end;

  if cbSituacao.Text <> '<Todos>' then
  begin
    if cbSituacao.Text = 'À Pagar' then
      filtro2 := ' and cp.dtvencimento>=current_date and cp.situacao<>''T''';
    if cbSituacao.Text = 'Pagas' then
      filtro2 := ' and cp.situacao=''T''';
    if cbSituacao.Text = 'Atrasadas' then
      filtro2 := ' and cp.dtvencimento<current_date and cp.situacao<>''T''';
  end;

  qryCP.close;
  qryCP.SQL.Text := vSql;
  qryCP.SQL.Text := StringReplace(qryCP.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  qryCP.Params[0].Value := '%';
  qryCP.Params[1].Value := data1;
  qryCP.Params[2].Value := data2;
  qryCP.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelPagar.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParPagar.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParPagar.FormCreate(Sender: TObject);
begin
  qryForn.close;
  qryForn.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

end;

procedure TfrmParPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParPagar.FormShow(Sender: TObject);
begin
  DBLookupComboboxEh1.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParPagar.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    if cbPeriodo.Text = '<Todos>' then
      Value := '<TODO O PERÍODO>'
    else
      Value := cbPeriodo.Text+' DE '+ datetostr(MaskInicio.Date) + ' ATÉ ' +
        datetostr(MaskFim.Date);
  end;

  if VarName = 'SALDO' then
    Value := FormatFloat(',0.00', vSaldoMes)
end;

end.
