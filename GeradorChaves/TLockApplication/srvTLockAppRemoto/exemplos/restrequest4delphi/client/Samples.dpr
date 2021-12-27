program Samples;

uses
  System.StartUpCopy,
  FMX.Forms,
  Samples.Services.User in 'src\services\Samples.Services.User.pas' {UserService: TDataModule},
  Samples.Providers.Frames.User in 'src\providers\frames\Samples.Providers.Frames.User.pas' {UserFrame: TFrame},
  Samples.Views.Main in 'src\views\Samples.Views.Main.pas' {HeaderFooterForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THeaderFooterForm, HeaderFooterForm);
  Application.Run;
end.
