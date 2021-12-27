program Serial;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSerial in 'uSerial.pas' {FrmSerial};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TFrmSerial, FrmSerial);
  Application.Run;
end.
