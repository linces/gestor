program srvTLockApp;

uses
  Horse,
  System.SysUtils,
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  undm in 'undm.pas' {dm: TDataModule},
  Utils.DataSet.JSON.Helper in 'classes-uteis\Utils.DataSet.JSON.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
