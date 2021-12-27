unit uAbertura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.Objects;

type
  TfrmAcesso = class(TForm)
    Timer1: TTimer;
    Rectangle1: TRectangle;
    Image1: TImage;
    Cheff: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

implementation

{$R *.fmx}

uses UMenu, uDados, uLogin;

procedure TfrmAcesso.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TfrmAcesso.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;

  dados.qryConfigura.Close;
  dados.qryConfigura.Open;

  if dados.qryConfigura.IsEmpty then
  begin
    frmMenu.Show;
    frmMenu.TabControl.TabIndex := 3;
  end
  else
  begin
     frmlogin.Show;
  end;
end;

end.
