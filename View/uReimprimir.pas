unit uReimprimir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.db, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  ACBrBase, ACBrEnterTab;

type
  TfrmReimprimir = class(TForm)
    GroupBox2: TGroupBox;
    Label2: TLabel;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    ACBrEnterTab1: TACBrEnterTab;
    DBGrid2: TDBGrid;
    btnPedido: TBitBtn;
    qryVenda: TFDQuery;
    dsVenda: TDataSource;
    qryVendaNUMERO: TIntegerField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaRAZAO: TStringField;
    qryVendaTOTAL: TFMTBCDField;
    qryNFCE_M: TFDQuery;
    qryNFCE_MCODIGO: TIntegerField;
    qryNFCE_MNUMERO: TIntegerField;
    qryNFCE_MCHAVE: TStringField;
    qryNFCE_MMODELO: TStringField;
    qryNFCE_MSERIE: TStringField;
    qryNFCE_MDATA_EMISSAO: TDateField;
    qryNFCE_MDATA_SAIDA: TDateField;
    qryNFCE_MHORA_EMISSAO: TTimeField;
    qryNFCE_MHORA_SAIDA: TTimeField;
    qryNFCE_MID_EMITENTE: TIntegerField;
    qryNFCE_MID_CLIENTE: TIntegerField;
    qryNFCE_MFK_USUARIO: TIntegerField;
    qryNFCE_MFK_CAIXA: TIntegerField;
    qryNFCE_MFK_VENDEDOR: TIntegerField;
    qryNFCE_MCPF_NOTA: TStringField;
    qryNFCE_MTIPO_DESCONTO: TStringField;
    qryNFCE_MOBSERVACOES: TMemoField;
    qryNFCE_MSITUACAO: TStringField;
    qryNFCE_MEMAIL: TStringField;
    qryNFCE_MXML: TMemoField;
    qryNFCE_MPROTOCOLO: TStringField;
    qryNFCE_MMOTIVOCANCELAMENTO: TStringField;
    qryNFCE_MFLAG: TStringField;
    qryNFCE_MABERTO: TStringField;
    qryNFCE_MFKEMPRESA: TIntegerField;
    qryNFCE_MFK_VENDA: TIntegerField;
    qryNFCE_MSUBTOTAL: TFMTBCDField;
    qryNFCE_MDESCONTO: TFMTBCDField;
    qryNFCE_MTROCO: TFMTBCDField;
    qryNFCE_MDINHEIRO: TFMTBCDField;
    qryNFCE_MTOTAL: TFMTBCDField;
    qryNFCE_MBASEICMS: TFMTBCDField;
    qryNFCE_MTOTALICMS: TFMTBCDField;
    qryNFCE_MBASEICMSPIS: TFMTBCDField;
    qryNFCE_MTOTALICMSPIS: TFMTBCDField;
    qryNFCE_MBASEICMSCOF: TFMTBCDField;
    qryNFCE_MTOTALICMSCOFINS: TFMTBCDField;
    qryNFCE_MBASEISS: TFMTBCDField;
    qryNFCE_MTOTALISS: TFMTBCDField;
    qryNFCE_MTRIB_MUN: TFMTBCDField;
    qryNFCE_MTRIB_EST: TFMTBCDField;
    qryNFCE_MTRIB_FED: TFMTBCDField;
    qryNFCE_MTRIB_IMP: TFMTBCDField;
    qryNFCE_MOUTROS: TFMTBCDField;
    qryNFCE_MSAT_NUMERO_CFE: TIntegerField;
    qryNFCE_MSAT_NUMERO_SERIE: TStringField;
    qryNFCE_MCNF: TStringField;
    Label3: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReimprimir: TfrmReimprimir;

implementation

{$R *.dfm}

uses Udados, uDmNFe;

procedure TfrmReimprimir.btnPedidoClick(Sender: TObject);
var
  numero: Integer;
begin

  if qryVenda.IsEmpty then
    exit;

  numero := qryVendaNUMERO.AsInteger;

  if numero = 0 then
    raise Exception.Create('Informe o número da NFC-e');

  qryNFCE_M.close;
  qryNFCE_M.Params[0].Value := numero;
  qryNFCE_M.Open;

  if qryNFCE_M.IsEmpty then
    raise Exception.Create('NFC-e não encontrado!');

  dmnfe.ImprimirNFe(qryNFCE_MXML.AsString, qryNFCE_MSITUACAO.Value, 'NFCe',
    qryNFCE_MTRIB_FED.AsFloat, qryNFCE_MTRIB_MUN.AsFloat,
    qryNFCE_MTRIB_EST.AsFloat);

end;

procedure TfrmReimprimir.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReimprimir.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmReimprimir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F2 then
    btnFiltrar.Click;

  if Key = VK_F3 then
    btnPedido.Click;

  if Key = vk_escape then
    close;

end;

procedure TfrmReimprimir.FormShow(Sender: TObject);
begin
  maskInicio.EditText := DateToStr(date);
  maskFim.EditText := DateToStr(date);
  btnFiltrarClick(self);
end;

procedure TfrmReimprimir.btnFiltrarClick(Sender: TObject);
begin
  qryVenda.close;
  qryVenda.Params[0].Value := maskInicio.EditText;
  qryVenda.Params[1].Value := maskFim.EditText;
  qryVenda.Open;
end;

end.
