unit uTabelaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF, DBGridEh,
  DBLookupEh, frxExportBaseDialog;

type
  TfrmTabelaPreco = class(TForm)
    dsTabela: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    DBCheckBox1: TDBCheckBox;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBTabela: TfrxDBDataset;
    ACBrEnterTab1: TACBrEnterTab;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    dsEmpresa: TDataSource;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    btnImp: TSpeedButton;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure localiza;
    { Private declarations }
  public
    idx: Integer;
    vOrdem: string;
    { Public declarations }
  end;

var
  frmTabelaPreco: TfrmTabelaPreco;

implementation

{$R *.dfm}

uses Udados;


procedure TfrmTabelaPreco.bbAlterarClick(Sender: TObject);
begin

  if dados.qryTabPreco.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  dados.qryTabPreco.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmTabelaPreco.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  dados.qryTabPreco.Insert;
  dados.qryTabPrecoCODIGO.Value := dados.Numerador('TABELA_PRECO', 'CODIGO',
    'N', '', '');
  dados.qryTabPrecoATIVO.Value := 'S';
  dados.qryTabPrecoACRESCIMO.Value := 0;
  dados.qryTabPrecoFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmTabelaPreco.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmTabelaPreco.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    (Sender as TDBGrid).Canvas.Brush.Color := clGray;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmTabelaPreco.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;
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

  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  DBGrid1.Columns[2].Title.Caption := 'Acréscimo';

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Clear;

  edtLoc.SetFocus;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

end;

procedure TfrmTabelaPreco.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmTabelaPreco.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryTabPreco.Prior;
  if Key = VK_DOWN then
    dados.qryTabPreco.Next;
end;

procedure TfrmTabelaPreco.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmTabelaPreco.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmTabelaPreco.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;

PRocedure TfrmTabelaPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  if PageControl1.ActivePageIndex = 0 then
  begin
    if Key = vk_f2 then
    begin
      bbNovoClick(self);
      abort;
    end;
    if Key = vk_f3 then
    begin
      bbAlterarClick(self);
      abort;
    end;
    if Key = vk_f4 then
    begin
      btnImpClick(self);
      abort;
    end;
    if Key = vk_f6 then
    begin
      edtLoc.SetFocus;
      abort;
    end;
    if Key = VK_ESCAPE then
    begin
      close;
      abort;
    end;
  end
  else
  begin
    if Key = VK_F5 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then

      btnCancelarClick(self);
  end;

end;

procedure TfrmTabelaPreco.FormShow(Sender: TObject);
begin
  idx := 0;
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmTabelaPreco.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  filtro := ' where fkempresa=' + dados.qryEmpresaCODIGO.AsString;

  dados.qryTabPreco.SQL.Text := 'select *  from Tabela_preco /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' and codigo=' + edtLoc.Text;
      1:
        filtro := ' and descricao like ' + QuotedStr(edtLoc.Text + '%');
      2:
        filtro := ' and acrescimo  >= ' + StringReplace(edtLoc.Text,
          ',', '.', []);
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
    2:
      ordem := ' order by acrescimo ' + vOrdem;
  end;
  dados.qryTabPreco.close;
  dados.qryTabPreco.SQL.Text := StringReplace(dados.qryTabPreco.SQL.Text,
    '/*where*/', filtro + ordem, [rfReplaceAll]);
  dados.qryTabPreco.Open;
end;

procedure TfrmTabelaPreco.btnCancelarClick(Sender: TObject);
begin
  if dados.qryTabPreco.State in [dsInsert, dsEdit] then
    dados.qryTabPreco.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmTabelaPreco.btnGravarClick(Sender: TObject);
begin
  if dados.qryTabPreco.State in [dsInsert, dsEdit] then
  begin
    DBEdit1.SetFocus;
    if trim(dados.qryTabPrecoDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    dados.qryTabPreco.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmTabelaPreco.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    if dados.qryTabPreco.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelTabelaPreco.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
