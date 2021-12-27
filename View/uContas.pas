unit uContas;

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
  DBCtrlsEh, frxClass, frxExportPDF, frxDBSet, frxExportBaseDialog,
  frxExportXLS;

type
  TfrmContas = class(TForm)
    dsContas: TDataSource;
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
    Panel3: TPanel;
    Panel4: TPanel;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    btnImp: TSpeedButton;
    frxDBContas: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    DBCheckBox1: TDBCheckBox;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
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
  frmContas: TfrmContas;

implementation

{$R *.dfm}

uses Udados, uSupervisor;

procedure TfrmContas.bbAlterarClick(Sender: TObject);
begin
  if dados.qryContasCODIGO.Value = 1 then
    raise Exception.Create('Não é permitido alterar o caixa geral!');

  if dados.qryContas.IsEmpty then
    exit;
  PageControl1.ActivePage := Cadastro;
  dados.qryContas.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmContas.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  dados.qryContas.Insert;
  dados.qryContasCODIGO.Value := dados.Numerador('CONTAS', 'CODIGO',
    'N', '', '');
  dados.qryContasEMPRESA.Value := dados.qryEmpresaCODIGO.Value;

  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmContas.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmContas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmContas.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  DBGrid1.Columns[2].Title.Caption := 'Tipo';

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Clear;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;

  localiza;
end;

procedure TfrmContas.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmContas.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryContas.Prior;
  if Key = VK_DOWN then
    dados.qryContas.Next;
end;

procedure TfrmContas.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmContas.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmContas.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';

  dados.qryPesqUsuario.close;
  dados.qryPesqUsuario.Open;


end;

procedure TfrmContas.FormKeyDown(Sender: TObject; var Key: Word;
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
    if Key = vk_f5 then
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

procedure TfrmContas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmContas.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmContas.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  dados.qryContas.SQL.Text := 'select * from contas /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where codigo=' + edtLoc.Text;
      1:
        filtro := ' where descricao like ' +
          QuotedStr(parte + edtLoc.Text + '%');
      2:
        filtro := ' where tipo = ' + QuotedStr(parte + edtLoc.Text);
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
    2:
      ordem := ' order by tipo ' + vOrdem;
  end;

  dados.qryContas.close;
  dados.qryContas.SQL.Text := StringReplace(dados.qryContas.SQL.Text,
    '/*where*/', filtro + ordem, [rfReplaceAll]);
  dados.qryContas.Open;
end;

procedure TfrmContas.btnCancelarClick(Sender: TObject);
begin
  if dados.qryContas.State in [dsInsert, dsEdit] then
    dados.qryContas.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmContas.btnGravarClick(Sender: TObject);
begin
  if dados.qryContas.State in [dsInsert, dsEdit] then
  begin
    if trim(dados.qryContasDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    dados.qryContas.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmContas.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelContas.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
