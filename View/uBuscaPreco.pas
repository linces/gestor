unit uBuscaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmBuscaPreco = class(TForm)
    Panel2: TPanel;
    grpSelecao: TGroupBox;
    EdtProduto: TEdit;
    grpProduto: TGroupBox;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoCODBARRA: TStringField;
    lblCodigo: TLabel;
    LblPreco: TLabel;
    qryProdutoPR_VENDA: TFMTBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtProdutoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure LimpaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaPreco: TFrmBuscaPreco;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmBuscaPreco.EdtProdutoChange(Sender: TObject);
begin
  // begin
  if copy(EdtProduto.Text, 1, 1) = dados.qryConfigPREFIXO_BALANCA.Value then
  begin
    qryProduto.Close;
    qryProduto.ParamByName('empresa').Value := dados.qryEmpresaCODIGO.AsInteger;
    qryProduto.ParamByName('texto').Value := copy(EdtProduto.Text, 1, 6) + '%';
    qryProduto.Open;
  end
  else
  begin
    qryProduto.Close;
    qryProduto.ParamByName('empresa').Value := dados.qryEmpresaCODIGO.AsInteger;
    qryProduto.ParamByName('texto').Value := EdtProduto.Text + '%';
    qryProduto.Open;
  end;

  lblCodigo.Caption := qryProdutoCODIGO.AsString + ' - ' +
    qryProdutoDESCRICAO.AsString;
  LblPreco.Caption := FormatFloat('R$ ,0.00', qryProdutoPR_VENDA.AsFloat);

  if qryProduto.IsEmpty then
    LimpaCampos;
  if trim(EdtProduto.Text) = '' then
    LimpaCampos;

end;

procedure TFrmBuscaPreco.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmBuscaPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
end;

procedure TFrmBuscaPreco.FormShow(Sender: TObject);
begin
  LimpaCampos;
end;

procedure TFrmBuscaPreco.LimpaCampos;
begin
  lblCodigo.Caption := '';
  LblPreco.Caption := '';
end;

end.
