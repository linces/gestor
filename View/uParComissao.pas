unit uParComissao;

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
  TfrmParComissao = class(TForm)
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    Label4: TLabel;
    cbVendedor: TDBLookupComboboxEh;
    Label3: TLabel;
    cbSituacao: TComboBox;
    qryVendedor: TFDQuery;
    dsVendedor: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBResumido: TfrxDBDataset;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryResumido: TFDQuery;
    Label1: TLabel;
    qryDetalhado: TFDQuery;
    frxDBDetalhado: TfrxDBDataset;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    qryResumidoCODIGO: TIntegerField;
    qryResumidoNOME: TStringField;
    qryDetalhadoNOME: TStringField;
    qryDetalhadoNUMERO: TIntegerField;
    qryDetalhadoDATA_EMISSAO: TDateField;
    qryDetalhadoCODIGO: TIntegerField;
    qryDetalhadoDESCRICAO: TStringField;
    qryDetalhadoQTD: TFMTBCDField;
    qryResumidoCOMISSAO: TFMTBCDField;
    qryDetalhadoPRECO: TFMTBCDField;
    qryDetalhadoTOTAL: TFMTBCDField;
    qryDetalhadoPERC_COMISSAO: TFMTBCDField;
    qryDetalhadoVALOR_COMISSAO: TFMTBCDField;
    Label5: TLabel;
    ComboBox1: TComboBox;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    vSqlResumido, vSqlDetalhado: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParComissao: TfrmParComissao;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParComissao.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParComissao.btnImpClick(Sender: TObject);
var
  filtro: string;
  data1, data2: tdate;
begin
  filtro := '';

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND VM.FKEMPRESA=' + inttostr(cbEmpresa.KeyValue);

  if cbVendedor.KeyValue <> null then
    if cbVendedor.KeyValue <> 0 then
      filtro := filtro + ' AND vm.fk_vendedor=' + inttostr(cbVendedor.KeyValue);

  if cbSituacao.ItemIndex = 0 then
  begin
    qryResumido.close;
    qryResumido.SQL.Text := vSqlResumido;
    qryResumido.SQL.Text := StringReplace(qryResumido.SQL.Text, '/*where*/',
      filtro, [rfReplaceAll]);
    qryResumido.Params[0].Value := MaskInicio.Date;
    qryResumido.Params[1].Value := MaskFim.Date;
    qryResumido.Open;

    if qryResumido.IsEmpty then
    begin
      ShowMessage('Registros não encontrado.');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
      '\Relatorio\RelComissaoResumido.fr3');

  end;

  if cbSituacao.ItemIndex = 1 then
  begin
    qryDetalhado.close;
    qryDetalhado.SQL.Text := vSqlDetalhado;
    qryDetalhado.SQL.Text := StringReplace(qryDetalhado.SQL.Text, '/*where*/',
      filtro, [rfReplaceAll]);
    qryDetalhado.Params[0].Value := MaskInicio.Date;
    qryDetalhado.Params[1].Value := MaskFim.Date;
    qryDetalhado.Open;
    if qryDetalhado.IsEmpty then
    begin
      ShowMessage('Registros não encontrado.');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
      '\Relatorio\RelComissaoDetalhado.fr3');

  end;

  frxReport.ShowReport;

end;

procedure TfrmParComissao.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParComissao.FormCreate(Sender: TObject);
begin
  qryVendedor.close;
  qryVendedor.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  vSqlResumido := qryResumido.SQL.Text;
  vSqlDetalhado := qryDetalhado.SQL.Text;

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

end;

procedure TfrmParComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end;
end;

procedure TfrmParComissao.FormShow(Sender: TObject);
begin
  cbVendedor.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
end;

procedure TfrmParComissao.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'PERÍODO DE ' + datetostr(MaskInicio.Date) + ' ATÉ ' +
      datetostr(MaskFim.Date) + ' | EMPRESA: ' + cbEmpresa.Text +
      ' | VENDEDORES:' + cbVendedor.Text;
  end;
end;

end.
