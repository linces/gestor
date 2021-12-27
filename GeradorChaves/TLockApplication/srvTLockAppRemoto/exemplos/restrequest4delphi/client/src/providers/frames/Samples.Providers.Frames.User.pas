unit Samples.Providers.Frames.User;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls,
  FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TUserFrame = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    imgUser: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lblNome: TLabel;
    lblEmail: TLabel;
    Rectangle1: TRectangle;
  end;

implementation

{$R *.fmx}

end.
