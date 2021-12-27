program Comandas;

uses
  System.StartUpCopy,
  FMX.Forms,
  unLogin in 'unLogin.pas' {frmLogin},
  undm in 'undm.pas' {dm: TDataModule},
  unfrmprincipal in 'unfrmprincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
