program ClientApp;

uses
  Vcl.Forms,
  Client in 'Client.pas' {formClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformClient, formClient);
  Application.Run;
end.
