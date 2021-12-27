unit unMensagemWhats;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMensagemWhats = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagemWhats: TfrmMensagemWhats;

implementation

{$R *.dfm}

uses unDados, unPrincipal;

procedure TfrmMensagemWhats.Button1Click(Sender: TObject);
begin

  try
    if not Principal.TInject1.Auth then
       Exit;

 //  Principal.TInject1.send(Edit2.Text+'@c.us', Edit1.text);
  // ShowMessage(Dados.zLicencasTablecelular.Text+'@c.us');
    Principal.TInject1.send(Dados.zLicencasTablecelular.Text+'@c.us', Edit1.text);
  finally
  end;
end;

end.
