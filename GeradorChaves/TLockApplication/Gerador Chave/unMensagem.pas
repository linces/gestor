unit unMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMensagem = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

uses unDados, unPrincipal;

procedure TfrmMensagem.Button1Click(Sender: TObject);
begin

 if Dados.zLicencasTable.Active then begin

   Dados.zLicencasTable.Edit;
   Dados.zLicencasTablecomando.text := 'CHAT';
   Dados.zLicencasTableexecutado.text := '0';
   Dados.zLicencasTable.FieldByName('msgdireta').AsString := Edit1.Text;
   Dados.zLicencasTable.Post;

 end;

end;

end.
