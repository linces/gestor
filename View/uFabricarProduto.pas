unit uFabricarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF, DBGridEh,
  DBLookupEh, frxExportBaseDialog, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  JvComponentBase, JvEnterTab, frxExportXLS;

type
  TfrmFabricar = class(TForm)
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    qryFabricar: TFDQuery;
    dsFabricar: TDataSource;
    qryProd: TFDQuery;
    dsProduto: TDataSource;
    qryFabricarCODIGO: TIntegerField;
    qryFabricarDATA: TDateField;
    qryFabricarFK_PRODUTO: TIntegerField;
    qryFabricarDESCRICAO: TStringField;
    qryFabricarQUANTIDADE: TFMTBCDField;
    Panel2: TPanel;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    DBGrid1: TDBGridEh;
    JvEnterAsTab1: TJvEnterAsTab;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdQTD_ATUAL: TFMTBCDField;
    qryProdPR_VENDA: TFMTBCDField;
    qryFabricarVIRTUAL_PRODUTO: TStringField;
    qryFabricarNUMERO_NFE: TIntegerField;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtLoc: TEdit;
    DataInicial: TDateTimePicker;
    btnFiltrar: TBitBtn;
    DataFinal: TDateTimePicker;
    procedure edtLocChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure qryFabricarNewRecord(DataSet: TDataSet);
    procedure qryFabricarBeforePost(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qryFabricarAfterPost(DataSet: TDataSet);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1Columns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure qryFabricarAfterEdit(DataSet: TDataSet);
    procedure qryFabricarBeforeDelete(DataSet: TDataSet);
  private

    vLetras, vOrdem: string;

    procedure localiza;
    function AchouNota(Numero: Integer): Boolean;
    function AchouItemNota(Numero, Produto: Integer): Boolean;
    function NotaTransmitida(Numero: Integer): Boolean;
    procedure BaixaInsumo(aProduto: Integer; aQtd: Extended;
      aFabricar: Integer);
    procedure CancelaBaixaInsumo(aProduto: Integer; aQtd: Extended;
      aFabricar: Integer);

    { Private declarations }
  public
    idx: Integer;
    { Public declarations }
  end;

var
  frmFabricar: TfrmFabricar;

implementation

{$R *.dfm}

uses Udados, uDMEstoque;

procedure TfrmFabricar.DBGrid1ColEnter(Sender: TObject);
begin
  if DBGrid1.SelectedIndex <> 2 then
  begin
    if qryFabricarDESCRICAO.Value <> qryFabricarVIRTUAL_PRODUTO.AsString then
      if qryFabricar.State in dsEditModes then
        qryFabricarDESCRICAO.Value := qryFabricarVIRTUAL_PRODUTO.AsString;
  end
  else
  begin
    vLetras := '';
    qryProd.Filtered := false;
  end;
end;

procedure TfrmFabricar.DBGrid1Columns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if DBGrid1.SelectedIndex = 2 then
    qryFabricarFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
end;

procedure TfrmFabricar.DBGrid1Enter(Sender: TObject);
begin
  vLetras := ''; // pesquisa parte
  qryProd.Filtered := false;

end;

procedure TfrmFabricar.DBGrid1Exit(Sender: TObject);
begin
  vLetras := ''; // pesquisa parte
  qryProd.Filtered := false;

end;

procedure TfrmFabricar.DBGrid1TitleClick(Column: TColumn);
begin
  if idx = Column.Index then
  begin
    if vOrdem = ' ASC' then
      vOrdem := ' DESC'
    else
      vOrdem := ' ASC';
  end
  else
    vOrdem := ' ASC';

  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Data';
  DBGrid1.Columns[1].Title.Caption := 'Cód.';
  DBGrid1.Columns[2].Title.Caption := 'Pesquisar por Código ou Descrição';
  DBGrid1.Columns[3].Title.Caption := 'Quantidade';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  case idx of
    0:
      begin
        DataInicial.SetFocus;
      end;
    1 .. 3:
      begin
        edtLoc.SetFocus;
        edtLoc.Clear;
      end;
  end;

  localiza;

end;

procedure TfrmFabricar.DBLookupComboboxEh1Change(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFabricar.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmFabricar.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFabricar.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0, 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [3, 4]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmFabricar.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmFabricar.FormCreate(Sender: TObject);
begin

  vLetras := ''; // pesquisa parte
  qryProd.Filtered := false;

  vOrdem := ' ASC';
  DataInicial.date := StartOfTheMonth(date);
  DataFinal.date := date;

  qryProd.Close;
  qryProd.Params[0].Value := dados.qryEmpresaCODIGO.AsInteger;
  qryProd.Open;


end;


procedure TfrmFabricar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_f4 then
    btnImpClick(self);

  if Key = vk_f6 then
    edtLoc.SetFocus;

  if Key = VK_ESCAPE then
    Close;

end;

procedure TfrmFabricar.FormKeyPress(Sender: TObject; var Key: Char);
begin

  Key := UpCase(Key); // pesquisa parcial

  if DBGrid1.SelectedIndex = 2 then
  begin

    if (Key = #8) then
    begin

      if length(vLetras) = 1 then
        vLetras := ''
      else
        vLetras := copy(vLetras, 1, length(vLetras) - 1);
    end;

    if (Key in ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', ' ', '/', '-', '.', ':',
      '@', '&', '*', '%', '$', '(', ')', '=', '?', ':', ';', '{', '}', '[', ']',
      '+', '*', '#', '!']) then
    begin
      vLetras := vLetras + UpperCase(Key);
    end;

    if dados.EhNumero(vLetras) and (vLetras <> '') then
      qryProd.Filter := 'CODIGO = ' + vLetras
    else
    begin
      if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        qryProd.Filter := 'DESCRICAO LIKE ' +
          QuotedStr('%' + UpperCase(vLetras) + '%')
      else
        qryProd.Filter := 'DESCRICAO LIKE ' +
          QuotedStr(UpperCase(vLetras) + '%');
    end;

    qryProd.Filtered := true;

    if qryProdCODIGO.AsInteger > 0 then
    begin
      if vLetras <> '' then
      begin
        if not(qryFabricar.State in dsEditModes) then
          qryFabricar.Edit;
        qryFabricarFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
      end;
    end;
  end
  else
  begin
    vLetras := '';
    qryProd.Filtered := false;
  end;
end;

procedure TfrmFabricar.FormShow(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFabricar.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := 'PERÍODO DE ' + datetostr(DataInicial.date) + ' ATÉ ' +
    datetostr(DataFinal.date);

  if edtLoc.Text <> '' then
    filtro := filtro + ' | FILTRO:' + edtLoc.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := filtro;
  end;
end;

procedure TfrmFabricar.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  if trim(edtLoc.Text) <> '' then
    case idx of
      1:
        filtro := ' and fk_produto=' + edtLoc.Text;
      2:
        filtro := ' and descricao like ' + QuotedStr(parte + edtLoc.Text + '%');
      3:
        filtro := ' and QUANTIDADE >=' +
          QuotedStr(StringReplace(edtLoc.Text, ',', '.', []));
    end;

  case idx of
    0:
      ordem := ' order by data ' + vOrdem;
    1:
      ordem := ' order by fk_produto ' + vOrdem;
    2:
      ordem := ' order by descricao ' + vOrdem;
    3:
      ordem := ' order by quantidade ' + vOrdem;
  end;

  qryFabricar.Close;
  qryFabricar.SQL.Text := StringReplace(qryFabricar.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryFabricar.Params[0].AsDate := DataInicial.date;
  qryFabricar.Params[1].AsDate := DataFinal.date;
  qryFabricar.Open;
end;

procedure TfrmFabricar.qryFabricarAfterEdit(DataSet: TDataSet);
begin
  qryFabricar.Cancel;
end;

procedure TfrmFabricar.BaixaInsumo(aProduto: Integer; aQtd: Extended;
  aFabricar: Integer);
var
  qryProduto: TFDQuery;
  Quantidade: Extended;

begin
  qryProduto := TFDQuery.Create(self);
  qryProduto.Connection := dados.Conexao;

  qryProduto.Close;
  qryProduto.SQL.Clear;
  qryProduto.SQL.Text :=
    'select ID_PRODUTO, QUANTIDADE from PRODUTO_COMPOSICAO WHERE FK_PRODUTO=:PRODUTO';
  qryProduto.Params[0].Value := aProduto;
  qryProduto.Open;

  qryProduto.First;

  dmestoque.InsereProdutoFabricado(aProduto, 'E', aQtd, 0, 'PRODUTO FABRICADO',
    aFabricar);

  while not qryProduto.eof do
  begin
    Quantidade := qryProduto.FieldByName('QUANTIDADE').AsFloat * aQtd;
    dmestoque.InsereProdutoFabricado(qryProduto.FieldByName('ID_PRODUTO')
      .AsInteger, 'S', Quantidade, 0, 'PRODUTO FABRICADO', aFabricar);
    dmestoque.AtualizaEstoque(qryProduto.FieldByName('ID_PRODUTO').AsInteger,
      Quantidade, 0, 'S', 'R');
    qryProduto.Next;
  end;

end;

procedure TfrmFabricar.CancelaBaixaInsumo(aProduto: Integer; aQtd: Extended;
  aFabricar: Integer);
var
  qryProduto: TFDQuery;
  qryExecute: TFDQuery;
  Quantidade: Extended;

begin
  try

    qryProduto := TFDQuery.Create(self);
    qryProduto.Connection := dados.Conexao;

    qryExecute := TFDQuery.Create(self);
    qryExecute.Connection := dados.Conexao;
    qryProduto.Close;
    qryProduto.SQL.Clear;
    qryProduto.SQL.Text :=
      'delete from ACERTA_ESTOQUE where fk_fabrica=:fabrica';
    qryProduto.Params[0].Value := aFabricar;
    qryProduto.ExecSQL;
    dados.Conexao.CommitRetaining;

    qryProduto.Close;
    qryProduto.SQL.Clear;
    qryProduto.SQL.Text :=
      'select ID_PRODUTO, QUANTIDADE from PRODUTO_COMPOSICAO WHERE FK_PRODUTO=:PRODUTO';
    qryProduto.Params[0].Value := aProduto;
    qryProduto.Open;

    qryProduto.First;

    while not qryProduto.eof do
    begin
      Quantidade := qryProduto.FieldByName('QUANTIDADE').AsFloat * aQtd;
      dmestoque.AtualizaEstoque(qryProduto.FieldByName('ID_PRODUTO').AsInteger,
        Quantidade, 0, 'E', 'R');
      qryProduto.Next;
    end;
  finally
    qryExecute.Free;
    qryProduto.Free;
  end;

end;

procedure TfrmFabricar.qryFabricarAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;

  BaixaInsumo(qryFabricarFK_PRODUTO.AsInteger, qryFabricarQUANTIDADE.AsFloat,
    qryFabricarCODIGO.AsInteger);

  dmestoque.AtualizaEstoque(qryFabricar.FieldByName('FK_PRODUTO').AsInteger,
    qryFabricar.FieldByName('QUANTIDADE').AsInteger, 0, 'E', 'R');

  vLetras := '';
  qryProd.Filtered := false;
end;

function TfrmFabricar.AchouNota(Numero: Integer): Boolean;
begin
  result := false;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from nfe_master where numero=:numero';
  dados.qryConsulta.Params[0].Value := Numero;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
    result := true;
end;

function TfrmFabricar.AchouItemNota(Numero, Produto: Integer): Boolean;
begin
  result := false;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from nfe_detalhe where FKNFE=:numero and ID_PRODUTO=:id';
  dados.qryConsulta.Params[0].Value := Numero;
  dados.qryConsulta.Params[1].Value := Produto;
  dados.qryConsulta.Open;

  if not dados.qryConsulta.IsEmpty then
    result := true;
end;

function TfrmFabricar.NotaTransmitida(Numero: Integer): Boolean;
begin
  result := false;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from nfe_master where numero=:numero and situacao=''2''';
  dados.qryConsulta.Params[0].Value := Numero;
  dados.qryConsulta.Open;

  if not dados.qryConsulta.IsEmpty then
    result := true;
end;

procedure TfrmFabricar.qryFabricarBeforeDelete(DataSet: TDataSet);
begin
  dmestoque.AtualizaEstoque(qryFabricar.FieldByName('FK_PRODUTO').AsInteger,
    qryFabricar.FieldByName('QUANTIDADE').AsInteger, 0, 'S', 'R');

  CancelaBaixaInsumo(qryFabricarFK_PRODUTO.AsInteger,
    qryFabricarQUANTIDADE.AsFloat, qryFabricarCODIGO.AsInteger);
end;

procedure TfrmFabricar.qryFabricarBeforePost(DataSet: TDataSet);
begin

  if (qryFabricarCODIGO.IsNull) or (qryFabricarCODIGO.AsInteger = 0) then
    raise Exception.Create('Informe o Produto!');

  if not(qryFabricarQUANTIDADE.AsInteger > 0) then
    raise Exception.Create('Informe a quantidade do produto!');

  if (qryFabricarNUMERO_NFE.AsInteger > 0) then
  begin
    if not AchouNota(qryFabricarNUMERO_NFE.AsInteger) then
      raise Exception.Create('Nota não foi localizada!');

    if not AchouItemNota(qryFabricarNUMERO_NFE.AsInteger,
      qryFabricarFK_PRODUTO.AsInteger) then
      raise Exception.Create('Produto não foi localizado na nota!');

    if not NotaTransmitida(qryFabricarNUMERO_NFE.AsInteger) then
      raise Exception.Create('Nota não foi transmitida!');
  end;

  if qryFabricar.State = dsInsert then
    qryFabricarCODIGO.Value := dados.Numerador('PRODUTO_FABRICADOS', 'CODIGO',
      'N', '', '');

end;

procedure TfrmFabricar.qryFabricarNewRecord(DataSet: TDataSet);
begin
  qryFabricarDATA.Value := date;
  qryFabricarCODIGO.Value := dados.Numerador('PRODUTO_FABRICADOS', 'CODIGO',
    'N', '', '');
end;

procedure TfrmFabricar.btnFiltrarClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFabricar.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelFabrica.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
