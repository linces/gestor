program Comandas;

uses
  System.StartUpCopy,
  FMX.Forms,
  uLogin in 'uLogin.pas' {FrmLogin},
  uAbertura in 'uAbertura.pas' {frmAcesso},
  UMenu in 'UMenu.pas' {frmMenu},
  uDados in 'uDados.pas' {Dados: TDataModule},
  ControlMover in 'ControlMover.pas',
  Loading in 'Loading.pas',
  uConfig in 'uConfig.pas' {frmConfig},
  uComanda in 'uComanda.pas' {frmComanda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmAcesso, frmAcesso);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmComanda, frmComanda);
  Application.Run;
end.
