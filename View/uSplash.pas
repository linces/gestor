unit uSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses Udados;
{ TForm1 }

procedure TfrmSplash.FormShow(Sender: TObject);
begin
if FileExists(ExtractFilePath(Application.ExeName) + 'Splash.png') then
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
    'Splash.png');
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
