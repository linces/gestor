program UPnPEx;

uses
  Vcl.Forms,
  UPnPFRM1 in 'UPnPFRM1.pas' {UPnPFRM},
  UPnP in 'UPnP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUPnPFRM, UPnPFRM);
  Application.Run;
end.
