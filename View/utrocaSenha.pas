unit utrocaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JvComponentBase, JvEnterTab;

type
  TFrmTrocaSenha = class(TForm)
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrocaSenha: TFrmTrocaSenha;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmTrocaSenha.btnGravarClick(Sender: TObject);
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'SELECT * FROM USUARIOS WHERE CODIGO=:COD and SENHA=:SENHA';
  dados.qryConsulta.Params[0].Value := dados.idUsuario;
  dados.qryConsulta.Params[1].Value := dados.Crypt('C', Edit1.Text);
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    ShowMessage('Senha atual incorreta!');
    exit;
  end;

  if Edit2.Text <> Edit3.Text then
  begin
    ShowMessage('Senhas não são iguais!');
    exit;
  end;

  dados.qryUsuarios.Close;
  dados.qryUsuarios.Open;

  if dados.qryUsuarios.Locate('codigo', dados.idUsuario, []) then
  begin
    dados.qryUsuarios.Edit;
    dados.qryUsuariosSENHA.Value := dados.Crypt('C', Edit2.Text);
    dados.qryUsuarios.Post;
    dados.Conexao.CommitRetaining;
  end;

  Close;
end;

procedure TFrmTrocaSenha.btnSairClick(Sender: TObject);
begin
  if Application.messageBox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_YesNo) = mrYes then
    Close;
end;

procedure TFrmTrocaSenha.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmTrocaSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F10 then
    btnGravarClick(self);
  if Key = VK_ESCAPE then
    btnSairClick(self);
end;

end.
