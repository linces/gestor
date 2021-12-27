unit uMesas;

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
  frxExportBaseDialog;

type
  TfrmMesas = class(TForm)
    dsMesas: TDataSource;
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
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
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
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure localiza;
    procedure Insere;
    { Private declarations }
  public
    idx: Integer;
    vOrdem: string;
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmMesas.bbAlterarClick(Sender: TObject);
begin

  if Dados.qryMesas.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  Dados.qryMesas.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmMesas.bbNovoClick(Sender: TObject);
var
  i, Qtd: Integer;

begin
  if Application.messageBox('Tem Certeza de que Deseja Gerar Mesas?',
    'Confirmação', mb_YesNo) = mrYes then
  begin
    Qtd := StrToIntDef(InputBox('Informe a Quantidade de Mesas',
      'Quantidade:', ''), 0);
    for i := 1 to Qtd do
      Insere;
  end;

end;

procedure TfrmMesas.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmMesas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmMesas.DBGrid1TitleClick(Column: TColumn);
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

procedure TfrmMesas.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmMesas.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qryMesas.Prior;
  if Key = VK_DOWN then
    Dados.qryMesas.Next;
end;

procedure TfrmMesas.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmMesas.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;



procedure TfrmMesas.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;

PRocedure TfrmMesas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmMesas.FormShow(Sender: TObject);
begin
  idx := 0;
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmMesas.Insere;
begin
  Dados.qryMesas.Insert;
  Dados.qryMesasCODIGO.Value := Dados.Numerador('MESAS', 'CODIGO', 'N',
    'N', 'N');
  Dados.qryMesasSITUACAO.Value := 'L';
  Dados.qryMesasTOTAL.Value := 0;
  Dados.qryMesasFK_EMPRESA.Value := Dados.idEmpresa;
  Dados.qryMesas.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmMesas.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  Dados.qryMesas.SQL.Text := 'select * from mesaS /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where codigo=' + edtLoc.Text;
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
  end;
  Dados.qryMesas.close;
  Dados.qryMesas.SQL.Text := StringReplace(Dados.qryMesas.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  Dados.qryMesas.Open;
end;

procedure TfrmMesas.btnCancelarClick(Sender: TObject);
begin
  if Dados.qryMesas.State in [dsInsert, dsEdit] then
    Dados.qryMesas.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmMesas.btnGravarClick(Sender: TObject);
begin
  if Dados.qryMesas.State in [dsInsert, dsEdit] then
  begin
    if trim(DBEdit2.EditText) = '' then
    begin
      ShowMessage('Digite o Nome da Mesa!');
      DBEdit2.SetFocus;
      exit;
    end;

    Dados.qryMesas.Post;
    Dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

end.
