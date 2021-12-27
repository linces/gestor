unit uUnidade;

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
  DBCtrlsEh, frxClass, frxDBSet, frxExportPDF, ACBrBase, ACBrEnterTab,
  frxExportBaseDialog, frxExportXLS;

type
  TfrmUnidade = class(TForm)
    dsUnidade: TDataSource;
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
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBUnidade: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
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
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    idx: Integer;
    vOrdem: string;
    procedure localiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnidade: TfrmUnidade;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmUnidade.bbAlterarClick(Sender: TObject);
begin
  if Dados.qryUnidade.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  Dados.qryUnidade.edit;
  Panel1.Enabled := true;
  DBEdit1.SetFocus;

end;

procedure TfrmUnidade.bbNovoClick(Sender: TObject);
begin

  PageControl1.ActivePage := Cadastro;

  Dados.qryUnidade.Insert;
  Panel1.Enabled := true;
  DBEdit1.SetFocus;

end;

procedure TfrmUnidade.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmUnidade.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmUnidade.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
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
  DBGrid1.Columns[0].Title.Caption := 'Sigla';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
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

procedure TfrmUnidade.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmUnidade.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qryUnidade.Prior;
  if Key = VK_DOWN then
    Dados.qryUnidade.Next;
end;

procedure TfrmUnidade.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;


procedure TfrmUnidade.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;

procedure TfrmUnidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

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
  end
  else
  begin
    if Key = vk_f5 then
      btnGravarClick(self);

    if Key = VK_ESCAPE then

      btnCancelarClick(self);

  end;

end;

procedure TfrmUnidade.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmUnidade.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  Dados.qryUnidade.SQL.Text := 'select * from unidade /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where codigo like ' + QuotedStr(edtLoc.Text + '%');
      1:
        filtro := ' where descricao like ' + QuotedStr(edtLoc.Text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
  end;

  Dados.qryUnidade.close;
  Dados.qryUnidade.SQL.Text := StringReplace(Dados.qryUnidade.SQL.Text,
    '/*where*/', filtro + ordem, [rfReplaceAll]);
  Dados.qryUnidade.Open;

end;

procedure TfrmUnidade.btnCancelarClick(Sender: TObject);
begin
  if Dados.qryUnidade.State in [dsInsert, dsEdit] then
    Dados.qryUnidade.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmUnidade.btnGravarClick(Sender: TObject);
begin
  DBEdit1.SetFocus;

  if Dados.qryUnidade.State in [dsInsert, dsEdit] then
  begin

    if trim(Dados.qryUnidadeCODIGO.Value) = '' then
    begin
      ShowMessage('Digite a Sigla !');
      DBEdit1.SetFocus;
      exit;
    end;

    if trim(Dados.qryUnidadeDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    Dados.qryUnidade.Post;
    Dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmUnidade.btnImpClick(Sender: TObject);
begin
  try

    if Dados.qryUnidade.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    btnImp.Enabled := False;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelUnidade.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
