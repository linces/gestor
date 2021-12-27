unit uContador;

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
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF,
  frxExportBaseDialog, DBGridEh, DBLookupEh, JvComponentBase, JvEnterTab;

type
  TfrmContador = class(TForm)
    dsContador: TDataSource;
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
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBContador: TfrxDBDataset;
    ACBrEnterTab1: TACBrEnterTab;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label26: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBComboBoxEh1: TDBComboBoxEh;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    dsCidade: TDataSource;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    btnImp: TSpeedButton;
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
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    vOrdem: String;
    procedure localiza;
    { Private declarations }
  public
    idx: Integer;
    { Public declarations }
  end;

var
  frmContador: TfrmContador;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmContador.bbAlterarClick(Sender: TObject);
begin

  if not bbAlterar.Visible then
    exit;


  if Dados.qrySped_Contador.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  Dados.qrySped_Contador.edit;
  Dados.qrySped_contadorFK_USUARIO.Value := Dados.idUsuario;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmContador.bbNovoClick(Sender: TObject);
begin

  if not bbNovo.Visible then
    exit;

  PageControl1.ActivePage := Cadastro;

  Dados.qrySped_Contador.Insert;
  Dados.qrySped_ContadorCODIGO.Value := Dados.Numerador('CONTADOR', 'CODIGO',
    'N', '', '');
  Dados.qrySped_contadorFK_EMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qrySped_contadorFK_USUARIO.Value := Dados.idUsuario;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmContador.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmContador.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmContador.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Nome';
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

procedure TfrmContador.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmContador.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qrySped_Contador.Prior;
  if Key = VK_DOWN then
    Dados.qrySped_Contador.Next;
end;

procedure TfrmContador.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmContador.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;


procedure TfrmContador.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
end;

procedure TfrmContador.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmContador.FormShow(Sender: TObject);
begin

  Dados.qryCidade.close;
  Dados.qryCidade.Open;

  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmContador.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  Dados.qrySped_Contador.SQL.Text :=
    'select * from CONTADOR where FK_empresa=:id /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' and codigo=' + edtLoc.Text;
      1:
        filtro := ' and nome like ' + QuotedStr(parte + edtLoc.Text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by nome ' + vOrdem;
  end;
  Dados.qrySped_Contador.close;
  Dados.qrySped_Contador.SQL.Text :=
    StringReplace(Dados.qrySped_Contador.SQL.Text, '/*where*/', filtro + ordem,
    [rfReplaceAll]);
  Dados.qrySped_Contador.ParamByName('id').Value :=
    Dados.qryEmpresaCODIGO.Value;
  Dados.qrySped_Contador.Open;
end;

procedure TfrmContador.btnCancelarClick(Sender: TObject);
begin
  if Dados.qrySped_Contador.State in [dsInsert, dsEdit] then
    Dados.qrySped_Contador.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmContador.btnGravarClick(Sender: TObject);
begin
  if Dados.qrySped_Contador.State in [dsInsert, dsEdit] then
  begin
    DBEdit1.SetFocus;
    if trim(Dados.qrySped_ContadorNOME.Value) = '' then
    begin
      ShowMessage('Digite o Nome!');
      DBEdit2.SetFocus;
      exit;
    end;
    Dados.qrySped_Contador.Post;
    Dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmContador.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    if Dados.qrySped_Contador.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelContador.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
