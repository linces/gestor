unit frmServer1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls;

type
  TformServer = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button2: TButton;
    Server: TServerSocket;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formServer: TformServer;

implementation

{$R *.dfm}

procedure TformServer.Button1Click(Sender: TObject);
begin
 Server.Port := 1063;
 Server.Active := True;

 Memo1.Lines.Add('Servidor Ativo!');
end;

procedure TformServer.Button2Click(Sender: TObject);
var
 I: Integer;
begin
  for I := 0 to Server.Socket.ActiveConnections - 1 do
 begin
 Server.Socket.Connections[I].SendText(Edit1.Text);
 end;

 Memo1.Lines.Add('Sua Mensagem: '+Edit1.Text);
end;

procedure TformServer.ServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Memo1.Lines.Add('Mensagem do Cliente: '+Socket.ReceiveText);
end;

end.
