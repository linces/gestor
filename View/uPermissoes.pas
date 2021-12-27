unit uPermissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, DBGridEh, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.Buttons;

type
  TfrmPermissoes = class(TForm)
    TabControl1: TTabControl;
    dsUsuarios: TDataSource;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    dsPermissao: TDataSource;
    chkVer: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure dsUsuariosDataChange(Sender: TObject; Field: TField);
    procedure TabControl1Change(Sender: TObject);
    procedure DBGridEh2CellClick(Column: TColumnEh);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chkVerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermissoes: TfrmPermissoes;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmPermissoes.chkVerClick(Sender: TObject);
begin
  if chkVer.Checked then
  begin
    dados.qryPermissoes.first;
    while not dados.qryPermissoes.Eof do
    begin
      dados.qryPermissoes.Edit;
      dados.qryPermissoesVISUALIZAR.Value := 'S';
      dados.qryPermissoes.Post;
      dados.qryPermissoes.Next;
    end;
  end;
  if not chkVer.Checked then
  begin
    dados.qryPermissoes.first;
    while not dados.qryPermissoes.Eof do
    begin
      dados.qryPermissoes.Edit;
      dados.qryPermissoesVISUALIZAR.Value := 'N';
      dados.qryPermissoes.Post;
      dados.qryPermissoes.Next;
    end;
  end;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmPermissoes.DBGridEh2CellClick(Column: TColumnEh);
begin
  if Column.FieldName = 'VISUALIZAR' then
  begin
    dados.qryPermissoes.Edit;
    if dados.qryPermissoesVISUALIZAR.AsString = 'S' then
      dados.qryPermissoesVISUALIZAR.AsString := 'N'
    else
      dados.qryPermissoesVISUALIZAR.AsString := 'S';
    dados.qryPermissoes.Post;
  end;

  if Column.FieldName = 'EDITAR' then
  begin
    dados.qryPermissoes.Edit;
    if dados.qryPermissoesEDITAR.AsString = 'S' then
      dados.qryPermissoesEDITAR.AsString := 'N'
    else
      dados.qryPermissoesEDITAR.AsString := 'S';
    dados.qryPermissoes.Post;
  end;

  if Column.FieldName = 'EXCLUIR' then
  begin
    dados.qryPermissoes.Edit;
    if dados.qryPermissoesEXCLUIR.AsString = 'S' then
      dados.qryPermissoesEXCLUIR.AsString := 'N'
    else
      dados.qryPermissoesEXCLUIR.AsString := 'S';
    dados.qryPermissoes.Post;
  end;

  if Column.FieldName = 'INCLUIR' then
  begin
    dados.qryPermissoes.Edit;
    if dados.qryPermissoesINCLUIR.AsString = 'S' then
      dados.qryPermissoesINCLUIR.AsString := 'N'
    else
      dados.qryPermissoesINCLUIR.AsString := 'S';
    dados.qryPermissoes.Post;
  end;

end;

procedure TfrmPermissoes.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'VISUALIZAR' then
  begin
    DBGridEh2.Canvas.FillRect(Rect);
    iCheck := 0;
    if dados.qryPermissoesVISUALIZAR.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGridEh2.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);
  end;

  if Column.FieldName = 'INCLUIR' then
  begin
    DBGridEh2.Canvas.FillRect(Rect);
    iCheck := 0;
    if dados.qryPermissoesINCLUIR.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGridEh2.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);
  end;

  if Column.FieldName = 'EDITAR' then
  begin
    DBGridEh2.Canvas.FillRect(Rect);
    iCheck := 0;
    if dados.qryPermissoesEDITAR.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGridEh2.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);
  end;

  if Column.FieldName = 'EXCLUIR' then
  begin
    DBGridEh2.Canvas.FillRect(Rect);
    iCheck := 0;
    if dados.qryPermissoesEXCLUIR.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGridEh2.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);
  end;

end;

procedure TfrmPermissoes.dsUsuariosDataChange(Sender: TObject; Field: TField);
begin
  dados.qryPermissoes.Close;
  dados.qryPermissoes.Params[0].Value := dados.qryUsuariosCODIGO.Value;
  dados.qryPermissoes.Open;
end;

procedure TfrmPermissoes.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmPermissoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.qryPermissoes.Filtered := false;
end;

procedure TfrmPermissoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
end;

procedure TfrmPermissoes.FormShow(Sender: TObject);
begin
  dados.qryUsuarios.Close;
  dados.qryUsuarios.Open;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'select tela from telas ' + ' where' +
    ' nivel=0 order by pai';
  dados.qryConsulta.Open;
  dados.qryConsulta.first;
  TabControl1.Tabs.Clear;
  TabControl1.Tabs.Add('Todos');

  while not dados.qryConsulta.Eof do
  begin
    TabControl1.Tabs.Add(copy(dados.qryConsulta.Fields[0].AsString, 3, 10000));
    dados.qryConsulta.Next;
  end;

  TabControl1.TabIndex := 0;

end;

procedure TfrmPermissoes.TabControl1Change(Sender: TObject);
begin
  dados.qryPermissoes.Filtered := false;
  if TabControl1.TabIndex <> 0 then
  begin
    dados.qryPermissoes.Filter := 'PAI=' + inttostr(TabControl1.TabIndex - 1);;
    dados.qryPermissoes.Filtered := true;
  end;
end;

end.
