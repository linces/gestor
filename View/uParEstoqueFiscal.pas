unit uParEstoqueFiscal;

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
  TfrmParEstoqueFI = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBInventarioR: TfrxDBDataset;
    qryInventarioR: TFDQuery;
    Label2: TLabel;
    cbRef: TDBLookupComboboxEh;
    cbCodigo: TDBLookupComboboxEh;
    Label3: TLabel;
    Label1: TLabel;
    cbProduto: TDBLookupComboboxEh;
    cbTipo: TComboBox;
    Label4: TLabel;
    cbOpcao: TComboBox;
    Label6: TLabel;
    qryCodigo: TFDQuery;
    StringField1: TStringField;
    dsProduto: TDataSource;
    qryproduto: TFDQuery;
    qryprodutoCODIGO: TIntegerField;
    qryprodutoDESCRICAO: TStringField;
    dsRef: TDataSource;
    qryReferencia: TFDQuery;
    qryReferenciaCODIGO: TStringField;
    qryReferenciaREFERENCIA: TStringField;
    dsCodigo: TDataSource;
    qryInventarioD: TFDQuery;
    StringField2: TStringField;
    frxDBInventarioD: TfrxDBDataset;
    qryInventarioRFK_PRODUTO: TIntegerField;
    qryInventarioRDESCRICAO: TStringField;
    qryInventarioRQTDE: TFMTBCDField;
    qryInventarioRQTDS: TFMTBCDField;
    qryInventarioRSALDO: TFMTBCDField;
    qryInventarioDFK_PRODUTO: TIntegerField;
    qryInventarioDDESCRICAO: TStringField;
    qryInventarioDNUMERO: TStringField;
    qryInventarioDCHAVE: TStringField;
    qryInventarioDDTENTRADA: TDateField;
    qryInventarioDQTDE: TFMTBCDField;
    qryInventarioDQTDS: TFMTBCDField;
    qryInventarioDSALDO: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure bbSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRefExit(Sender: TObject);
    procedure cbCodigoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    vSaldoMes: Extended;
    procedure Resumo;
    procedure Detalhado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParEstoqueFI: TfrmParEstoqueFI;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmParEstoqueFI.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParEstoqueFI.Resumo;
begin
  qryInventarioR.close;

  if cbProduto.KeyValue <> 0 then
    qryInventarioR.ParamByName('produto').Value := cbProduto.KeyValue
  else
    qryInventarioR.ParamByName('produto').Value := '%';
  qryInventarioR.ParamByName('empresa').Value := dados.qryEmpresaCODIGO.Value;
  qryInventarioR.Open;

  case cbOpcao.ItemIndex of
    0:
      qryInventarioR.Filtered := false;
    1:
      begin
        qryInventarioR.Filtered := false;
        qryInventarioR.Filter := 'SALDO<0';
        qryInventarioR.Filtered := true;
      end;
    2:
      begin
        qryInventarioR.Filtered := false;
        qryInventarioR.Filter := 'SALDO=0';
        qryInventarioR.Filtered := true;
      end;

    3:
      begin
        qryInventarioR.Filtered := false;
        qryInventarioR.Filter := 'SALDO>0';
        qryInventarioR.Filtered := true;
      end;

  end;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelEstoqueFiscalR.fr3');

  frxReport.ShowReport;

end;

procedure TfrmParEstoqueFI.Detalhado;
begin
  qryInventarioD.close;

  if cbProduto.KeyValue <> 0 then
    qryInventarioD.ParamByName('produto').Value := cbProduto.KeyValue
  else
    qryInventarioD.ParamByName('produto').Value := '%';
  qryInventarioD.ParamByName('empresa').Value := dados.qryEmpresaCODIGO.Value;
  qryInventarioD.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelEstoqueFiscalD.fr3');

  frxReport.ShowReport;

end;

procedure TfrmParEstoqueFI.btnImpClick(Sender: TObject);
begin
  case cbTipo.ItemIndex of
    0:
      Resumo;
    1:
      Detalhado;
  end;
end;

procedure TfrmParEstoqueFI.cbCodigoExit(Sender: TObject);
begin
  cbProduto.KeyValue := cbCodigo.KeyValue;
  cbRef.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmParEstoqueFI.cbRefExit(Sender: TObject);
begin
  cbCodigo.KeyValue := cbRef.KeyValue;
  cbProduto.KeyValue := cbCodigo.KeyValue;
end;

procedure TfrmParEstoqueFI.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmParEstoqueFI.FormCreate(Sender: TObject);
begin
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
  cbOpcao.ItemIndex := 0;
end;

procedure TfrmParEstoqueFI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnImpClick(self);
    vk_escape:
      close;
  end;
end;

end.
