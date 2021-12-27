unit uParDiario;

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
  TfrmParDiario = class(TForm)
    MaskInicio: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Label4: TLabel;
    cbCaixa: TDBLookupComboboxEh;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBDiario: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryDiario: TFDQuery;
    Label1: TLabel;
    cbUsuario: TDBLookupComboboxEh;
    Label3: TLabel;
    qryConta: TFDQuery;
    dsConta: TDataSource;
    qryUsuarioCODIGO: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    qryDiarioNUMERO: TIntegerField;
    qryDiarioHISTORICO: TStringField;
    qryDiarioLOGIN: TStringField;
    qryDiarioDESCRICAO: TStringField;
    qryDiarioDATA: TDateField;
    qryDiarioHORA: TTimeField;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryDiarioENTRADA: TFMTBCDField;
    qryDiarioSAIDA: TFMTBCDField;
    qryDiarioTROCA: TFMTBCDField;
    qryDiarioSALDO: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
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
  frmParDiario: TfrmParDiario;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParDiario.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParDiario.btnImpClick(Sender: TObject);
var
  filtro: string;
  vSql: string;
begin
  filtro := '';

  vSql := ' select cm.fkvenda as numero, cm.historico, usu.login, co.descricao, cm.data, cm.hora, cm.entrada, cm.saida,  cm.troca, cm.saldo from contas_movimento cm'+
          ' left join usuarios usu on usu.codigo=cm.id_usuario'+
          ' left join contas co on co.codigo=cm.id_conta_caixa'+
          ' WHERE DATA=:DATA /*where*/'+
          ' order by cm.data, cm.hora,cm.fkvenda';

  if cbCaixa.KeyValue <> null then
    if cbCaixa.KeyValue <> 0 then
      filtro := filtro + ' AND CM.ID_CONTA_CAIXA=' + inttostr(cbCaixa.KeyValue);


  if cbUsuario.KeyValue <> null then
    if cbUsuario.KeyValue <> 0 then
      filtro := filtro + ' AND CM.ID_USUARIO=' +inttostr(cbUsuario.KeyValue);

  qryDiario.close;
  qryDiario.SQL.Text := vSql;
  qryDiario.SQL.Text := StringReplace(qryDiario.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);
  qryDiario.Params[0].AsDate := MaskInicio.Date;
  qryDiario.Open;
  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelDiario.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParDiario.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmParDiario.FormCreate(Sender: TObject);
begin
  qryUsuario.close;
  qryUsuario.Open;

  qryConta.close;
  qryConta.Open;

  qryEmpresa.Close;
  qryEmpresa.Open;


  MaskInicio.Date := StartOfTheMonth(Date);

end;

procedure TfrmParDiario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParDiario.FormShow(Sender: TObject);
begin
  cbCaixa.KeyValue := 0;
  cbUsuario.KeyValue := 0;
  MaskInicio.Date := date;
end;

procedure TfrmParDiario.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
      Value := 'DATA:' + datetostr(MaskInicio.Date);

  end;
end;

end.
