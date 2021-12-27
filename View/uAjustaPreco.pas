unit uAjustaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmAjustaPreco = class(TForm)
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosEMPRESA: TSmallintField;
    qryProdutosTIPO: TStringField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosGRUPO: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosULTFORN: TIntegerField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosCSTICMS: TStringField;
    qryProdutosCSTE: TStringField;
    qryProdutosCSTS: TStringField;
    qryProdutosCSTIPI: TStringField;
    qryProdutosCSOSN: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosFOTO: TBlobField;
    qryProdutosATIVO: TStringField;
    qryProdutosCFOP: TStringField;
    qryProdutosULT_COMPRA: TIntegerField;
    qryProdutosULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdutosCOD_BARRA_ATACADO: TStringField;
    qryProdutosGRADE: TStringField;
    qryProdutosCEST: TStringField;
    qryProdutosEFISCAL: TStringField;
    qryProdutosPAGA_COMISSAO: TStringField;
    qryProdutosCOMPOSICAO: TStringField;
    qryProdutosFIM_PROMOCAO: TDateField;
    qryProdutosPRECO_VARIAVEL: TStringField;
    qryProdutosAPLICACAO: TStringField;
    qryProdutosPRODUTO_PESADO: TStringField;
    qryProdutosSERVICO: TStringField;
    qryProdutosDT_CADASTRO: TDateField;
    qryProdutosALIQ_ICM: TCurrencyField;
    qryProdutosALIQ_PIS: TCurrencyField;
    qryProdutosALIQ_COF: TCurrencyField;
    qryProdutosPR_CUSTO: TFMTBCDField;
    qryProdutosMARGEM: TCurrencyField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosQTD_ATUAL: TFMTBCDField;
    qryProdutosQTD_MIN: TFMTBCDField;
    qryProdutosE_MEDIO: TFMTBCDField;
    qryProdutosCOMISSAO: TCurrencyField;
    qryProdutosDESCONTO: TCurrencyField;
    qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdutosPRECO_ATACADO: TFMTBCDField;
    qryProdutosQTD_ATACADO: TFMTBCDField;
    qryProdutosALIQ_IPI: TFMTBCDField;
    qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdutosINICIO_PROMOCAO: TDateField;
    qryProdutosPR_CUSTO2: TFMTBCDField;
    qryProdutosPERC_CUSTO: TFMTBCDField;
    qryProdutosPESO: TFMTBCDField;
    qryProdutosESTOQUE_INICIAL: TFMTBCDField;
    qryProdutosPR_VENDA_PRAZO: TFMTBCDField;
    qryProdutosREDUCAO_BASE: TFMTBCDField;
    qryProdutosMVA: TFMTBCDField;
    qryProdutosFCP: TFMTBCDField;
    Label1: TLabel;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure qryProdutosPR_CUSTOValidate(Sender: TField);
    procedure qryProdutosBeforePost(DataSet: TDataSet);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure qryProdutosBeforeEdit(DataSet: TDataSet);
  private
    vPrecoAnterior: Extended;
    procedure localiza;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  FrmAjustaPreco: TFrmAjustaPreco;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmAjustaPreco.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmAjustaPreco.DBGrid1TitleClick(Column: TColumn);
begin
  edtLoc.Clear;

  idx := Column.Index;

  if idx <= 3 then
  begin

    DBGrid1.Columns[0].Title.Caption := 'Código';
    DBGrid1.Columns[1].Title.Caption := 'Referência';
    DBGrid1.Columns[2].Title.Caption := 'Cód.Barras';
    DBGrid1.Columns[3].Title.Caption := 'Descrição';

    GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
      .Title.Caption + '>>';

    DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
      .Title.Caption;

    edtLoc.Width := DBGrid1.Columns[idx].Width + 50;

    edtLoc.SetFocus;

    localiza;

  end;

end;

procedure TFrmAjustaPreco.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TFrmAjustaPreco.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryProdutos.Prior;
  if Key = VK_DOWN then
    qryProdutos.Next;
end;

procedure TFrmAjustaPreco.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TFrmAjustaPreco.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TFrmAjustaPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f6 then
    edtLoc.SetFocus;

end;

procedure TFrmAjustaPreco.FormShow(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TFrmAjustaPreco.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  if vSql = '' then
    vSql := qryProdutos.SQL.Text;

  filtro := '';
  filtro1 := '';
  ordem := '';

  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  if (trim(edtLoc.Text) <> '') then
    case idx of
      0:
        filtro1 := ' and pro.CODIGO=' + edtLoc.Text;
      1:
        filtro1 := ' and pro.REFERENCIA LIKE' + QuotedStr(edtLoc.Text + '%');
      2:
        filtro1 := ' and pro.CODBARRA LIKE ' + QuotedStr(edtLoc.Text + '%');
      3:
        filtro1 := ' and pro.DESCRICAO LIKE ' +
          QuotedStr(parte + edtLoc.Text + '%');

    end;

  case idx of
    0:
      ordem := ' order by pro.CODIGO';
    1:
      ordem := ' order by pro.REFERENCIA';
    2:
      ordem := ' order by pro.CODBARRA';
    3:
      ordem := ' order by pro.DESCRICAO';
  end;

  qryProdutos.close;
  qryProdutos.SQL.Text := vSql;
  qryProdutos.SQL.Text := StringReplace(qryProdutos.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryProdutos.Open;
end;

procedure TFrmAjustaPreco.qryProdutosAfterPost(DataSet: TDataSet);
begin

  if vPrecoAnterior <> qryProdutosPR_VENDA.AsFloat then
    dados.AlteraDataPreco(qryProdutosCODIGO.Value);
  dados.Conexao.CommitRetaining;
end;

procedure TFrmAjustaPreco.qryProdutosBeforeEdit(DataSet: TDataSet);
begin
  vPrecoAnterior := qryProdutosPR_VENDA.AsFloat;
end;

procedure TFrmAjustaPreco.qryProdutosBeforePost(DataSet: TDataSet);
begin

  if qryProdutosPR_CUSTO.Value > qryProdutosPR_VENDA.Value then
  begin
    raise Exception.Create
      ('Preço de custo não pode ser menor que preço de venda');
  end;

end;

procedure TFrmAjustaPreco.qryProdutosPR_CUSTOValidate(Sender: TField);
begin
  qryProdutosPR_CUSTO2.Value := qryProdutosPR_CUSTO.Value +
    (qryProdutosPR_CUSTO.Value * qryProdutosPERC_CUSTO.Value / 100);

  qryProdutosPR_VENDA.Value := qryProdutosPR_CUSTO2.Value +
    (qryProdutosPR_CUSTO2.Value * qryProdutosMARGEM.Value / 100);

end;

end.
