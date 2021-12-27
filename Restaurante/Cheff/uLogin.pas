unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.Objects, FMX.Ani;

type
  TFrmLogin = class(TForm)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    edtUsuario: TEdit;
    Image1: TImage;
    Layout3: TLayout;
    edtSenha: TEdit;
    Layout4: TLayout;
    btnAcessar: TButton;
    btnSair: TButton;
    Button1: TButton;
    ColorKeyAnimation1: TColorKeyAnimation;
    procedure btnSairClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses uDados, UMenu, uConfig;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
  Dados.qryConfigura.Close;
  Dados.qryConfigura.Open;

  if Dados.qryConfigura.IsEmpty then
    frmConfig.show
  else
  begin
    if (Dados.qryConfigurasenha.Value <> edtSenha.Text) or
      (Dados.qryConfigurausuario.Value <> edtUsuario.Text) then
    begin
      ShowMessage('Usuário/senha inválido!');
      exit;
    end;
    frmmenu.show;
    frmmenu.LayoutAguarde.Visible := false;
    Dados.RDWDataBase.PoolerService := Dados.qryConfiguraip.AsString;
  end;

end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.Button1Click(Sender: TObject);
begin
  frmConfig.show;
end;

end.
