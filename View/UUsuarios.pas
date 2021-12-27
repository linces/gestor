unit UUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls, shellapi,
  Grids, DBGrids, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmUsuarios = class(TForm)
    dsUser: TDataSource;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    dsPermissoes: TDataSource;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label2: TLabel;
    edtConfirma: TEdit;
    btnExibe: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    qryVendedor: TFDQuery;
    dsVendedor: TDataSource;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    qryVendedorCMA: TFMTBCDField;
    qryVendedorCMP: TFMTBCDField;
    qryVendedorATIVO: TStringField;
    qryVendedorEMPRESA: TIntegerField;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure bbexcluirClick(Sender: TObject);
    Procedure CMDialogChar(var msg: tcmdialogchar); message cm_dialogchar;
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExibeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tela, operacao: string;
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

uses Udados;

{$R *.DFM}

Procedure TFrmUsuarios.CMDialogChar(var msg: tcmdialogchar);
var
  i: Integer;
begin
  with PageControl1 do
    for i := 0 to PageCount - 1 do
      if IsAccel(msg.CharCode, Pages[i].Caption) and (Pages[i].TabVisible) then
      begin
        msg.Result := 1;
        ActivePage := Pages[i];
        break;
      end;
end;

procedure TFrmUsuarios.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dados.aUsuario = 'Novo' then
  begin
    dados.AtualizaTerminal;
    dados.vFechaPrograma := true;
    Application.Terminate;
  end;
end;


procedure TFrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if PageControl1.ActivePageIndex = 0 then
  begin
    if Key = vk_f2 then
      btnNovoClick(self);
    if Key = vk_f3 then
      btnAlterarClick(self);
    abort;
  end;

  if PageControl1.ActivePageIndex = 1 then
  begin
    if Key = vk_f10 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then
      btnCancelarClick(self);
    abort;
  end;

end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
  qryVendedor.Close;
  qryVendedor.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  qryVendedor.open;

  dados.qryUsuarios.Close;
  dados.qryUsuarios.open;
  if dados.aUsuario = 'Principal' then
    PageControl1.ActivePageIndex := 0;

  if dados.aUsuario = 'Novo' then
    btnNovo.Click;

  btnExibe.Visible := false;
  if dados.eSupervisor then
    btnExibe.Visible := true;

end;

procedure TFrmUsuarios.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    selectnext(Sender as twincontrol, true, true);
end;

procedure TFrmUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TFrmUsuarios.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

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

procedure TFrmUsuarios.btnAlterarClick(Sender: TObject);
var
  senha: string;
begin
  operacao := 'Alterar';
  PageControl1.ActivePageIndex := 1;
  dados.qryUsuarios.Edit;
  senha := dados.Crypt('D', dados.qryUsuariosSENHA.Value);
  dados.qryUsuariosSENHA.Value := senha;
  edtConfirma.Text := dados.qryUsuariosSENHA.Value;
  DBEdit1.SetFocus;
end;

procedure TFrmUsuarios.btnCancelarClick(Sender: TObject);
begin

  dados.qryUsuarios.Cancel;
  if dados.aUsuario <> 'Novo' then
    PageControl1.ActivePageIndex := 0;
  if dados.aUsuario = 'Novo' then
  begin
    dados.AtualizaTerminal;
    dados.vFechaPrograma := true;
    Application.Terminate
  end;

end;

procedure TFrmUsuarios.btnGravarClick(Sender: TObject);
begin
  if trim(dados.qryUsuariosLOGIN.Text) = '' then
  begin
    ShowMessage('Digite o usuário!');
    exit;
  end;

  if trim(dados.qryUsuariosSENHA.Text) = '' then
  begin
    ShowMessage('Digite a senha!');
    exit;
  end;

  if trim(edtConfirma.Text) = '' then
  begin
    ShowMessage('Digite a senha!');
    exit;
  end;

  if edtConfirma.Text <> dados.qryUsuariosSENHA.Text then
  begin
    ShowMessage('Senhas são diferentes!' + sLineBreak +
      'Senhas devem ser iguais!');
    DBEdit3.SetFocus;
    exit;
  end;
  dados.qryUsuariosSENHA.Value :=
    dados.Crypt('C', dados.qryUsuariosSENHA.Value);
  dados.qryUsuariosECAIXA.Value := 'C';
  dados.qryUsuarios.Post;

  if dados.aUsuario = 'Principal' then
    PageControl1.ActivePageIndex := 0;

  if operacao = 'Novo' then
  begin
    ShowMessage('Usuário cadastrado com sucesso!' + sLineBreak +
      'Reinicie o sistema para liberar permissões!');
    dados.vFechaPrograma := true;
    Application.Terminate;

  end;

end;

procedure TFrmUsuarios.btnNovoClick(Sender: TObject);
var
  eSupervisor: Boolean;
begin

  operacao := 'Novo';

  qryVendedor.First;
  eSupervisor := dados.qryUsuarios.IsEmpty;
  PageControl1.ActivePageIndex := 1;
  dados.qryUsuarios.Insert;
  dados.qryUsuariosCODIGO.Value := dados.Numerador('USUARIOS', 'CODIGO',
    'N', '', '');
  dados.qryUsuariosATIVO.Value := 'S';
  dados.qryUsuariosSUPERVISOR.Value := 'N';
  dados.qryUsuariosFK_VENDEDOR.Value := qryVendedorCODIGO.AsInteger;
  DBCheckBox1.Enabled := true;
  DBCheckBox2.Enabled := true;
  if eSupervisor then
  begin
    dados.qryUsuariosSUPERVISOR.Value := 'S';
    DBCheckBox2.Enabled := false;
    DBCheckBox1.Enabled := false;
  end;
  DBEdit1.SetFocus;
end;

procedure TFrmUsuarios.btnExibeClick(Sender: TObject);
begin
  if btnExibe.Caption = 'Exibir' then
  begin
    DBEdit3.PasswordChar := #0;
    edtConfirma.PasswordChar := #0;
    btnExibe.Caption := 'Ocultar';
    exit;
  end
  else
  begin
    DBEdit3.PasswordChar := '*';
    edtConfirma.PasswordChar := '*';
    btnExibe.Caption := 'Exibir';

  end;
end;

procedure TFrmUsuarios.bbexcluirClick(Sender: TObject);
begin
  if dados.qryUsuariosLOGIN.Value <> 'SUPERVISOR' then
  begin
    If Application.messageBox('Deseja Excluir o Usuário?', 'Confirmação',
      mb_YesNo + mb_iconquestion) = idyes then
    begin
      dados.qryUsuarios.delete;
      PageControl1.ActivePageIndex := 0;
    end;
  end;
end;

end.
