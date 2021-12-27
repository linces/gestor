program ServerApp;

uses
  Vcl.Forms,
  frmServer1 in 'frmServer1.pas' {formServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformServer, formServer);
  Application.Run;
end.
