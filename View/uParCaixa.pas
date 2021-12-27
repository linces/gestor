unit uParCaixa;

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
  TfrmParCaixa = class(TForm)
    cbConta: TDBLookupComboboxEh;
    Label6: TLabel;
    Label1: TLabel;
    cbPlano: TDBLookupComboboxEh;
    MaskInicio: TDateTimePicker;
    chkPeriodo: TCheckBox;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryContas: TFDQuery;
    qryContasCODIGO: TIntegerField;
    qryContasDESCRICAO: TStringField;
    qryContasTIPO: TStringField;
    dsContas: TDataSource;
    dsPlano: TDataSource;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDBCaixa: TfrxDBDataset;
    frxDBSaldo: TfrxDBDataset;
    qrSaldo: TFDQuery;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryCaixa: TFDQuery;
    qryCaixaTENTRADA: TAggregateField;
    qryCaixaTSAIDA: TAggregateField;
    qryCaixaCODIGO: TIntegerField;
    qryCaixaEMISSAO: TDateField;
    qryCaixaDOC: TStringField;
    qryCaixaFKPLANO: TIntegerField;
    qryCaixaFKCONTA: TIntegerField;
    qryCaixaHISTORICO: TStringField;
    qryCaixaFKVENDA: TIntegerField;
    qryCaixaFKCOMPRA: TIntegerField;
    qryCaixaFKPAGAR: TIntegerField;
    qryCaixaFKRECEBER: TIntegerField;
    qryCaixaTRANSFERENCIA: TIntegerField;
    qryCaixaBLOQUEADO: TStringField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVIRTUAL_PLANO: TStringField;
    qryCaixaVIRTUAL_CONTA: TStringField;
    qryCaixaVIRTUAL_CONTA2: TStringField;
    qrSaldoSALDO: TFMTBCDField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParCaixa: TfrmParCaixa;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParCaixa.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParCaixa.btnImpClick(Sender: TObject);
var
  DTIni, DTFim: TDate;
  filtro, ordem: string;

begin
  filtro := '';
  ordem := ' ORDER BY LC.EMISSAO, LC.CODIGO';

  if cbConta.KeyValue <> null then
    if cbConta.KeyValue <> 0 then
      filtro := ' AND (LC.FKCONTA=' + inttostr(cbConta.KeyValue) + ')';

  if cbPlano.KeyValue <> null then
    if cbPlano.KeyValue <> 0 then
      filtro := filtro + ' AND (LC.FKPLANO=' + inttostr(cbPlano.KeyValue) + ')';

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND (LC.EMPRESA=' +
        inttostr(cbEmpresa.KeyValue) + ')';

  qryCaixa.close;

  qryCaixa.SQL.Clear;
  qryCaixa.SQL.Text :=
    ' SELECT LC.*, TP.DESCRICAO VIRTUAL_PLANO, CT.DESCRICAO VIRTUAL_CONTA, CT1.DESCRICAO VIRTUAL_CONTA2  FROM CAIXA LC '
    + ' LEFT JOIN PLANO TP on TP.CODIGO=LC.FKPLANO ' +
    ' LEFT JOIN contas CT on CT.CODIGO=LC.FKCONTA ' +
    ' LEFT JOIN contas CT1 on CT1.CODIGO=LC.FK_CONTA1 ' + ' WHERE ' +
    ' (LC.EMISSAO between :data1 and :data2) ' + '  AND (CT.TIPO<>''S'') ' +
    ' /*where*/ ';

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;

  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1000');
    DTFim := strtodate('01/12/9999');
  end;

  qryCaixa.SQL.Text := StringReplace(qryCaixa.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryCaixa.Params[0].AsDate := DTIni;
  qryCaixa.Params[1].AsDate := DTFim;
  qryCaixa.Open;

  qrSaldo.close;
  qrSaldo.SQL.Text :=
    ' SELECT coalesce(SUM(LC.ENTRADA-LC.SAIDA),0) SALDO FROM CAIXA LC' +
    ' WHERE' + ' LC.EMISSAO<:DATA /*where*/';

  qrSaldo.SQL.Text := StringReplace(qrSaldo.SQL.Text, '/*where*/', filtro,
    [rfReplaceAll]);
  qrSaldo.Params[0].Value := DTIni;
  qrSaldo.Open;

  vSaldoMes := 0;
  if not((qryCaixaTENTRADA.IsNull) and (qryCaixaTSAIDA.IsNull)) then
    vSaldoMes := qrSaldoSALDO.AsFloat +
      (qryCaixaTENTRADA.AsVariant - qryCaixaTSAIDA.AsVariant);

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelCaixa.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParCaixa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParCaixa.FormCreate(Sender: TObject);
begin

  qryContas.close;
  qryContas.Open;

  qryPlano.close;
  qryPlano.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

end;

procedure TfrmParCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParCaixa.FormShow(Sender: TObject);
begin
  cbConta.KeyValue := 0;
  cbPlano.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmParCaixa.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    if chkPeriodo.Checked then
      Value := 'PERÍODO DE ' + datetostr(MaskInicio.Date) + ' ATÉ ' +
        datetostr(MaskFim.Date)
    else if cbEmpresa.KeyValue <> null then
      Value := 'EMPRESA:' + VarToStr(cbEmpresa.KeyValue)
    else if cbConta.KeyValue > 0 then
      Value := 'CONTA:' + VarToStr(cbConta.KeyValue)
    else if cbPlano.KeyValue > 0 then
      Value := 'PLANO:' + VarToStr(cbPlano.KeyValue)
    else
      Value := '<Todos>';
  end;

  if VarName = 'SALDO' then
    Value := FormatFloat(',0.00', vSaldoMes)
end;

end.
