program Replicador;

uses
  Vcl.Forms,
  windows,
  Unit4 in 'Unit4.pas' {Form3} ,
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

var
  HprevHist: Thandle;

begin

  HprevHist := FindWindow(Nil, PChar('Gestor | Replicador'));

  if (HprevHist <> 0) then
  begin
    Application.Terminate;
    Exit;
  end
  else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := true;
    Application.Title := 'Gestor | Replicador';
    TStyleManager.TrySetStyle('Sapphire Kamri');
    Application.CreateForm(TForm4, Form4);
    Application.Run;
  end;

end.
