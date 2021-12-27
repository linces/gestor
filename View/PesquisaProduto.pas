unit PesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaProduto = class(TForm)
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoCODBARRA: TStringField;
    qryProdutoDESCRICAO: TStringField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    Panel3: TPanel;
    bbSair: TSpeedButton;
    bbVincular: TSpeedButton;
    qryProdutoGRUPO: TIntegerField;
    qryChecaVinculo: TFDQuery;
    qryChecaVinculoID_FORNECEDOR: TFloatField;
    qryChecaVinculoID_PRODUTO_FORN: TStringField;
    qryChecaVinculoID_PRODUTO_LOCAL: TFloatField;
    qryChecaVinculoFK_GRUPO: TIntegerField;
    qryChecaVinculoFKEMPRESA: TIntegerField;
    qryProdutoPR_VENDA: TFMTBCDField;
    DBGrideh1: TDBGrid;
    procedure edtLocChange(Sender: TObject);
    procedure bbSairClick(Sender: TObject);
    procedure bbVincularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrideh1TitleClick(Column: TColumn);
  private
  var
    procedure localiza;
    { Private declarations }
  public
    FProduto: String;
    FFornecedor, idx: integer;
    { Public declarations }
  end;

var
  frmPesquisaProduto: TfrmPesquisaProduto;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmPesquisaProduto.bbSairClick(Sender: TObject);
begin
  dados.vCodProduto := 0;
  close;
end;

procedure TfrmPesquisaProduto.bbVincularClick(Sender: TObject);
begin

  qryChecaVinculo.close;
  qryChecaVinculo.Params[0].Value := FFornecedor;
  qryChecaVinculo.Params[1].Value := FProduto;
  qryChecaVinculo.Params[2].Value := qryProdutoCODIGO.Value;
  qryChecaVinculo.Open;

  if not qryChecaVinculo.IsEmpty then
  begin
    If Application.messagebox
      ('Produto já está vinculado! Deseja Fazer Novo Vínculo?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      qryChecaVinculo.Delete;
      dados.Conexao.CommitRetaining;
    end
    else
      exit;
  end;

  dados.vCodProduto := qryProduto.FieldByName('CODIGO').Value;
  dados.vCodGrupo := qryProduto.FieldByName('GRUPO').Value;
  dados.vPrecoProduto := qryProduto.FieldByName('PR_VENDA').Value;
  close;
end;

procedure TfrmPesquisaProduto.DBGridEh1DblClick(Sender: TObject);
begin
  bbVincular.Click;
end;

procedure TfrmPesquisaProduto.DBGrideh1TitleClick(Column: TColumn);
begin

  idx := Column.Index;

  DBGrideh1.Columns[0].Title.Caption := 'Código';
  DBGrideh1.Columns[1].Title.Caption := 'Código Barras';
  DBGrideh1.Columns[2].Title.Caption := 'Descrição';

  GroupBox1.Caption := 'F5 | Localizar <<' + DBGrideh1.Columns[idx]
    .Title.Caption + '>>';

  DBGrideh1.Columns[idx].Title.Caption := '>>' + DBGrideh1.Columns[idx]
    .Title.Caption;


  edtLoc.SetFocus;

  localiza;
end;

procedure TfrmPesquisaProduto.localiza;
var
  filtro, filtro1, filtro2, ordem: string;
begin

  filtro1 := '';
  ordem := '';

  if (trim(edtLoc.Text) <> '') then
    case idx of
      0:
        filtro1 := ' WHERE CODIGO like ' +
          QuotedStr(copy(edtLoc.Text,1, 10) + '%');
      1:
        filtro1 := ' WHERE CODBARRA LIKE ' + QuotedStr(edtLoc.Text + '%');
      2:
        filtro1 := ' WHERE DESCRICAO LIKE ' +
          QuotedStr('%' + edtLoc.Text + '%');
    end;

  case idx of
    0:
      ordem := ' order by CODIGO';
    1:
      ordem := ' order by CODBARRA';
    2:
      ordem := ' order by DESCRICAO';
  end;

  qryProduto.close;
  qryProduto.SQL.Text :=
    ' select codigo, codbarra, descricao, grupo, pr_venda from produto  /*where*/';
  qryProduto.SQL.Text := StringReplace(qryProduto.SQL.Text, '/*where*/',
    filtro1 + ordem, [rfReplaceAll]);
  qryProduto.Open;
end;

procedure TfrmPesquisaProduto.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPesquisaProduto.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryProduto.Prior;
  if Key = VK_DOWN then
    qryProduto.Next;
end;

procedure TfrmPesquisaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    bbSair.Click;
  if Key = vk_f2 then
    bbVincular.Click;

  if Key = 13 then
    DBGridEh1DblClick(self);
end;

procedure TfrmPesquisaProduto.FormShow(Sender: TObject);
begin
  edtLoc.SetFocus;
  DBGrideh1TitleClick(DBGrideh1.Columns[0]);
end;

end.
