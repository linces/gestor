unit unframWpp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  AdvGlassButton, uTInject;

type
  TframWpp = class(TFrame)
    Label1: TLabel;
    Inject1: TInject;
    AdvGlassButton1: TAdvGlassButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
