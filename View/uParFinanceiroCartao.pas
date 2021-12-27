unit uParFinanceiroCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxChart,
  frxExportBaseDialog, FireDAC.DatS, frxExportXLS;

type
  TfrmParFinanceiroCartao = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    qryUsuario: TFDQuery;
    dsUsuario: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxCartao: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    dsEmpresa: TDataSource;
    qryCartao: TFDQuery;
    qryUsuarioCODIGO: TIntegerField;
    qryUsuarioLOGIN: TStringField;
    Label2: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    chkPeriodo: TCheckBox;
    MaskInicio: TDateTimePicker;
    MaskFim: TDateTimePicker;
    frxXLSExport1: TfrxXLSExport;
    cbLocal: TComboBox;
    Label1: TLabel;
    qryCartaoCODIGO: TIntegerField;
    qryCartaoDATA_CREDITO: TDateField;
    qryCartaoHISTORICO: TStringField;
    qryCartaoENTRADA: TSingleField;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure bbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSql: string;
    vSaldoMes: Extended;
    { Private declarations }
  public
    { Public declarations }
    DTIni, DTFim: TDate;
  end;

var
  frmParFinanceiroCartao: TfrmParFinanceiroCartao;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParFinanceiroCartao.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParFinanceiroCartao.btnImpClick(Sender: TObject);
var
  filtro: string;
  aSql: String;
begin
  case cbLocal.ItemIndex of
    0:
      begin
        aSql := 'select cx.codigo, cx.emissao as data_credito,  cx.historico, cast(cx.entrada as float) as entrada from caixa cx '
          + ' left join vendas_master vm on vm.codigo = cx.fkvenda where cx.emissao '
          + ' between :data1 and :data2 and cx.ecartao in (''S'', ''C'', ''D'') AND '
          + ' cx.ENTRADA > 0 /*where*/ order by cx.emissao ';
      end;
    1:
      begin
        aSql := ' select cr.codigo, cr.dtvencimento as data_credito,  cr.historico, cast(cr.valor as float) AS ENTRADA from creceber cr '
          + ' where' + ' cr.data between :data1 and :data2 and' +
          ' cr.tipo in (''R'') AND' + ' CR.valor > 0' + ' /*where*/' +
          ' order by cR.data';
      end;
  end;

  filtro := '';

  vSql := aSql;

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
    begin
      case cbLocal.ItemIndex of
        0:
          filtro := filtro + ' and cx.empresa=' + inttostr(cbEmpresa.KeyValue);
        1:
          filtro := filtro + ' and cr.fkempresa=' +
            inttostr(cbEmpresa.KeyValue);

      end;

    end;

  DTIni := MaskInicio.Date;
  DTFim := MaskFim.Date;

  if not chkPeriodo.Checked then
  begin
    DTIni := strtodate('01/01/1900');
    DTFim := strtodate('01/12/9999');
  end;

  qryCartao.close;
  qryCartao.SQL.Text := vSql;
  qryCartao.SQL.Text := StringReplace(qryCartao.SQL.Text, '/*where*/', filtro,
    [rfReplaceAll]);
  qryCartao.Params[0].AsDate := DTIni;
  qryCartao.Params[1].AsDate := DTFim;
  qryCartao.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelFinanceiroCartao.fr3');
  frxReport.ShowReport;

end;

procedure TfrmParFinanceiroCartao.FormCreate(Sender: TObject);
begin
  qryUsuario.close;
  qryUsuario.Open;

  qryEmpresa.close;
  qryEmpresa.Open;

  MaskInicio.Date := StartOfTheMonth(Date);
  cbLocal.ItemIndex := 0;

end;

procedure TfrmParFinanceiroCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    VK_ESCAPE:
      close;
  end
end;

procedure TfrmParFinanceiroCartao.FormShow(Sender: TObject);
begin
  cbEmpresa.KeyValue := 0;
  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;
end;

procedure TfrmParFinanceiroCartao.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
  begin
    Value := 'Empresa:' + cbEmpresa.Text + ' | Periodo de :' + datetostr(DTIni)
      + ' até ' + datetostr(DTFim);
  end;
end;

end.
