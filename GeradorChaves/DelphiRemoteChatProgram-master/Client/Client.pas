unit Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TformClient = class(TForm)
    ClientSocket1: TClientSocket;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formClient: TformClient;

implementation

{$R *.dfm}

procedure TformClient.Button1Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText(Edit1.Text);
 Memo1.Lines.Add('Sua Mensagem: '+Edit1.Text);
end;

procedure TformClient.Button2Click(Sender: TObject);
begin
 ClientSocket1.Host := Edit2.Text;
 ClientSocket1.Port := StrToInt(Edit3.Text);
 ClientSocket1.Active := True;

 Memo1.Lines.Add('Conectado ao Servidor!');
end;

procedure TformClient.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Memo1.Lines.Add('Mensagem do Servidor: '+Socket.ReceiveText);
end;

end.
