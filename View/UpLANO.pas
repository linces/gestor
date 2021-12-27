unit UpLANO;

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
  DBCtrlsEh, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  frxExportXLS,
  JvComponentBase, JvEnterTab;

type
  TfrmPlano = class(TForm)
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
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDBPlano: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    btnImp: TSpeedButton;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
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
  frmPlano: TfrmPlano;

implementation

{$R *.dfm}

uses Udados;


procedure TfrmPlano.bbAlterarClick(Sender: TObject);
begin
  if Dados.qryPlano.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  Dados.qryPlano.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmPlano.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  Dados.qryPlano.Insert;
  Dados.qryPlanoCODIGO.Value := Dados.Numerador('PLANO', 'CODIGO', 'N', '', '');
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmPlano.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmPlano.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmPlano.DBGrid1TitleClick(Column: TColumn);
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

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmPlano.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPlano.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qryPlano.Prior;
  if Key = VK_DOWN then
    Dados.qryPlano.Next;
end;

procedure TfrmPlano.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmPlano.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmPlano.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;

procedure TfrmPlano.FormKeyDown(Sender: TObject; var Key: Word;
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
    if Key = VK_F5 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then
      btnCancelarClick(self);

  end;

end;

procedure TfrmPlano.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmPlano.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmPlano.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  Dados.qryPlano.SQL.Text := 'select * from PLANO /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where codigo=' + edtLoc.Text;
      1:
        filtro := ' where descricao like ' + QuotedStr(edtLoc.Text + '%');
      2:
        filtro := ' where DC = ' + QuotedStr(edtLoc.Text);
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
    2:
      ordem := ' order by DC ' + vOrdem;
  end;

  Dados.qryPlano.close;
  Dados.qryPlano.SQL.Text := StringReplace(Dados.qryPlano.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  Dados.qryPlano.Open;
end;

procedure TfrmPlano.btnCancelarClick(Sender: TObject);
begin
  if Dados.qryPlano.State in [dsInsert, dsEdit] then
    Dados.qryPlano.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmPlano.btnGravarClick(Sender: TObject);
begin
  if Dados.qryPlano.State in [dsInsert, dsEdit] then
  begin
    if trim(Dados.qryPlanoDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    Dados.qryPlano.Post;
    Dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmPlano.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelPlano.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
