program Whats;

uses
  Vcl.Forms,
  uTInject.ConfigCEF,
  uWthas in 'uWthas.pas' {Form1},
  uBotConversa in '..\View\uBotConversa.pas',
  uBotGestor in '..\View\uBotGestor.pas';

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := false;

  if not GlobalCEFApp.StartMainProcess then
    exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
