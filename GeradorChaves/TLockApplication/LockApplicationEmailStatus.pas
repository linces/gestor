unit LockApplicationEmailStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdServerIOHandler, IdSSL, IdSSLOpenSSL, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdCustomTCPServer, IdTCPServer, IdCmdTCPServer, IdSMTPServer;

type
  TStatusEmail = class(TForm)
    Panel1: TPanel;
    IdSMTP1: TIdSMTP;
    IdSMTPServer1: TIdSMTPServer;
    IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatusEmail: TStatusEmail;

implementation

{$R *.dfm}

end.
