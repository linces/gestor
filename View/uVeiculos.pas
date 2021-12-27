unit uVeiculos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF,
  DBLookupEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, frxExportBaseDialog,
  FireDAC.Stan.StorageBin, frxExportXLS, JvComponentBase, JvEnterTab, DBGridEh,
  GridsEh, DBAxisGridsEh, Vcl.Grids, Vcl.DBGrids;

type
  TfrmVeiculos = class(TForm)
    dsVeiculo_Cavalo: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBCheckBox1: TDBCheckBox;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBVeiculos: TfrxDBDataset;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label8: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dsVeiculo_Reboque: TDataSource;
    Label11: TLabel;
    dsCidade: TDataSource;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dsVeiculo_CavaloStateChange(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    idx: Integer;
    vOrdem: string;
    procedure localiza;
    { Public declarations }
  end;

var
  frmVeiculos: TfrmVeiculos;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmVeiculos.bbAlterarClick(Sender: TObject);
begin

  if dados.qryVeiculos_cavalo.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  dados.qryVeiculos_cavalo.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmVeiculos.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;
  dados.qryVeiculos_cavalo.Insert;
  dados.qryVeiculos_cavaloATIVO.Value := 'S';
  Panel1.Enabled := true;

end;

procedure TfrmVeiculos.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmVeiculos.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmVeiculos.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Placa';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  DBGrid1.Columns[2].Title.Caption := 'RENAVAM';
  DBGrid1.Columns[3].Title.Caption := 'RNTC';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.Clear;

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmVeiculos.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmVeiculos.dsVeiculo_CavaloStateChange(Sender: TObject);
begin
  dados.qryVeiculos_Reboque.close;
  dados.qryVeiculos_Reboque.Params[0].Value :=
    dados.qryVeiculos_cavaloPLACA.Value;
  dados.qryVeiculos_Reboque.Open;
end;

procedure TfrmVeiculos.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmVeiculos.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryVeiculos_cavalo.Prior;
  if Key = VK_DOWN then
    dados.qryVeiculos_cavalo.Next;
end;

procedure TfrmVeiculos.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmVeiculos.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmVeiculos.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;

PRocedure TfrmVeiculos.FormKeyDown(Sender: TObject; var Key: Word;
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
  end
  else
  begin
    if Key = VK_F5 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then
      if Application.messageBox
        ('Tem Certeza de que deseja sair do cadastro de Grupos?', 'Confirmação',
        mb_YesNo) = mrYes then
      begin
        btnCancelarClick(self);
      end;
  end;

end;

procedure TfrmVeiculos.FormShow(Sender: TObject);
begin
  idx := 0;
  PageControl1.ActivePage := Lista;

  dados.qryCidade.close;
  dados.qryCidade.Open;

  dados.qryVeiculo_Carroceria.close;
  dados.qryVeiculo_Carroceria.Open;

  dados.qryVeiculo_tipo.close;
  dados.qryVeiculo_tipo.Open;

  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmVeiculos.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  dados.qryVeiculos_cavalo.SQL.Text :=
    'select * from veiculos_cavalo /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where placa=' + edtLoc.Text;
      1:
        filtro := ' where descricao like ' + QuotedStr(edtLoc.Text + '%');
      2:
        filtro := ' where RENAVAM like ' + QuotedStr(edtLoc.Text + '%');
      3:
        filtro := ' where RNTC like ' + QuotedStr(edtLoc.Text + '%');

    end;

  case idx of
    0:
      ordem := ' order by placa ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
    2:
      ordem := ' order by RENAVAM ' + vOrdem;
    3:
      ordem := ' order by RNTC ' + vOrdem;
  end;
  dados.qryVeiculos_cavalo.close;
  dados.qryVeiculos_cavalo.SQL.Text :=
    StringReplace(dados.qryVeiculos_cavalo.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  dados.qryVeiculos_cavalo.Open;
end;

procedure TfrmVeiculos.btnCancelarClick(Sender: TObject);
begin
  if dados.qryVeiculos_cavalo.State in [dsInsert, dsEdit] then
    dados.qryVeiculos_cavalo.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmVeiculos.btnGravarClick(Sender: TObject);
begin
  if dados.qryVeiculos_cavalo.State in [dsInsert, dsEdit] then
  begin
    DBCheckBox1.SetFocus;

    if trim(dados.qryVeiculos_cavaloPLACA.Value) = '' then
    begin
      ShowMessage('Digite a Placa!');
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(dados.qryVeiculos_cavaloDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    dados.qryVeiculos_cavalo.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmVeiculos.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    if dados.qryVeiculos_cavalo.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelVeiculos.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
