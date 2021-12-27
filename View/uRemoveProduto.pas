unit uRemoveProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TFrmRemoveProduto = class(TForm)
    grpSelecao: TGroupBox;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoCODBARRA: TStringField;
    qryProdutoPR_VENDA: TFMTBCDField;
    EdtProduto: TEdit;
    qryVenda: TFDQuery;
    qryVendaCODIGO: TIntegerField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaDATA_SAIDA: TDateField;
    qryVendaID_CLIENTE: TIntegerField;
    qryVendaFK_USUARIO: TIntegerField;
    qryVendaFK_CAIXA: TIntegerField;
    qryVendaFK_VENDEDOR: TIntegerField;
    qryVendaCPF_NOTA: TStringField;
    qryVendaTIPO_DESCONTO: TStringField;
    qryVendaOBSERVACOES: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryVendaVIRTUAL_CLIENTE: TStringField;
    qryVendaVIRTUAL_VENDEDOR: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaTIPO: TStringField;
    qryVendaFKORCAMENTO: TIntegerField;
    qryVendaNECF: TIntegerField;
    qryVendaLOTE: TIntegerField;
    qryVendaVirtualEmpresa: TStringField;
    qryVendaGERA_FINANCEIRO: TStringField;
    qryVendaFK_TABELA: TIntegerField;
    qryVendaVIRTUAL_TABELA: TStringField;
    qryVendaVIRTUAL_TX_ACRESC: TFloatField;
    qryVendaVIRTUAL_CNPJ: TStringField;
    qryVendaSUBTOTAL: TFMTBCDField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaTROCO: TFMTBCDField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaPERCENTUAL: TFMTBCDField;
    qryVendaPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryVendaACRESCIMO: TFMTBCDField;
    qryVendaPEDIDO: TStringField;
    qryVendaTOTAL_TROCA: TFMTBCDField;
    qryVendaOS: TStringField;
    qryVendaFK_OS: TIntegerField;
    qryVendaFORMA_PAGAMENTO: TStringField;
    qrySoma: TFDQuery;
    qrySomaTOTAL: TFMTBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtProdutoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FQueryItem: TFDQuery;
    procedure excluirProduto;
    { Private declarations }
  public
    { Public declarations }
    property QueryItem: TFDQuery read FQueryItem write FQueryItem;

  end;

var
  FrmRemoveProduto: TFrmRemoveProduto;

implementation

{$R *.dfm}

uses Udados, uDMEstoque;

procedure TFrmRemoveProduto.excluirProduto;
var
  WNotLocate: Boolean;
begin
  WNotLocate := false;
  QueryItem.First;
  while not QueryItem.Eof do
  begin
    if QueryItem.Locate('COD_BARRA', EdtProduto.Text, []) then
    begin
      WNotLocate := true;

      QueryItem.Delete;
      qrySoma.Close;
      qrySoma.Params[0].Value := qryVendaCODIGO.Value;
      qrySoma.Open;

      EdtProduto.Clear;
      break;
    end;
    QueryItem.Next;
  end;

  if not WNotLocate then
  begin
    Showmessage(' Produto não encontrado ');
    EdtProduto.Clear;
  end;

end;

procedure TFrmRemoveProduto.EdtProdutoExit(Sender: TObject);
var
  WNotLocate: Boolean;
begin
  WNotLocate := false;
  QueryItem.First;
  while not QueryItem.Eof do
  begin
    if QueryItem.Locate('COD_BARRA', EdtProduto.Text, []) then
    begin
      WNotLocate := true;
      QueryItem.Delete;
      EdtProduto.Clear;
      break;
    end;
    QueryItem.Next;
  end;

  if not WNotLocate then
    Showmessage(' Produto não encontrado ');

end;

procedure TFrmRemoveProduto.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmRemoveProduto.FormCreate(Sender: TObject);
begin
  // FQueryItem:= TFDQuery.Create(Self);
end;

procedure TFrmRemoveProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
    VK_RETURN:
      excluirProduto;
  end;

end;

end.
