unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  IdBaseComponent,
  IdComponent,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdMessage,
  IdTCPConnection,
  IdTCPClient,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdLogFile,
  IdIntercept,
  IdLogBase,
  IdLogEvent,  IdAntiFreezeBase, IdAntiFreeze;

type
  TForm2 = class(TForm)
    lbedtEmailTo: TLabeledEdit;
    lbedtEmailSubject: TLabeledEdit;
    mmEmailBody: TMemo;
    lbEmailBody: TLabel;
    btnEmailSend: TButton;
    lbedtEmailFrom: TLabeledEdit;
    lbedtEmailHost: TLabeledEdit;
    lbedtHostPort: TLabeledEdit;
    lbedtHostUserName: TLabeledEdit;
    lbedtHostPassword: TLabeledEdit;
    lbedtEmailBCCList: TLabeledEdit;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdLogEvent1: TIdLogEvent;
    IdLogFile1: TIdLogFile;
    procedure btnEmailSendClick(Sender: TObject);
  private
    function fncSendEmail(): boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
{ TForm1 }

uses
  IdText,
  IdEMailAddress;

procedure TForm2.btnEmailSendClick(Sender: TObject);
begin
 //  btnEmailSend.Enabled := false;

  if fncSendEmail then
    ShowMessage('Successfully send!')
  else
    ShowMessage('It was not possible send email!');

end;

function TForm2.fncSendEmail(): boolean;
var
  lMyIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  lMyIdText              : TIdText;
  lMyIdEMailAddressItem  : TIdEMailAddressItem;
begin
  result := false;
  //
  lMyIdSSLIOHandlerSocket := nil;
  lMyIdText               := nil;
  //
  try
    lMyIdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    lMyIdSSLIOHandlerSocket.SSLOptions.Method := TIdSSLVersion.sslvSSLv23;
    lMyIdSSLIOHandlerSocket.SSLOptions.Mode   := TIdSSLMode.sslmClient;
    //
    //
    IdMessage1.CharSet      := 'utf-8';
    IdMessage1.Encoding     := TIdMessageEncoding.meMIME;
    IdMessage1.From.Name    := 'From <<Licenças SoftArena>>';
    IdMessage1.From.Address := lbedtEmailFrom.Text;
    IdMessage1.Priority     := TIdMessagePriority.mpNormal;
    IdMessage1.Subject      := lbedtEmailSubject.Text;
    //
    // referent to the Tartgets
    // lMyIdEMailAddressItem                :=
    IdMessage1.Recipients.Add;
    IdMessage1.Recipients.EMailAddresses := lbedtEmailTo.Text;
    IdMessage1.CCList.EMailAddresses     := lbedtEmailTo.Text;
    // IdMessage1.BccList.EMailAddresses    := lbedtEmailBCCList.Text;
    // IdMessage1.BccList.EMailAddresses    := 'others@gmail.com'; // ocult copy!
    //
    // setting the message's body type
    lMyIdText := TIdText.Create(IdMessage1.MessageParts);
    // it's means that the email sended, can dont have any HTML format!
    // the message will can contain special chars "charset=iso-8859-1"
    // else, the chars will have HTML codes!
    IdMessage1.ContentType := 'text/html; text/plain; charset=iso-8859-1';
    IdMessage1.Body.Add(mmEmailBody.Text);
    //
    // preparing server...
    IdSMTP1.IOHandler := lMyIdSSLIOHandlerSocket;
    IdSMTP1.UseTLS    := utUseImplicitTLS;
    IdSMTP1.AuthType  := TIdSMTPAuthenticationType.satDefault;
    IdSMTP1.Host      := lbedtEmailHost.Text;
    IdSMTP1.AuthType  := TIdSMTPAuthenticationType.satDefault;
    IdSMTP1.Port      := StrToInt(lbedtHostPort.Text); // set direct 465 SSL port
    IdSMTP1.Username  := lbedtHostUserName.Text;
    IdSMTP1.Password  := lbedtHostPassword.Text;
    //
    // connecting and authenticating...
    try
      IdSMTP1.Connect;
      IdSMTP1.Authenticate;
      //
      // if connected and authenticated...
      if IdSMTP1.Connected then
      begin
        try
          IdSMTP1.Send(IdMessage1);
          //
          result := true;
        except
          on E: Exception do
            ShowMessage('Error on sending email' + sLineBreak + E.Message);
        end;
      end;
    except
      on E: Exception do
        ShowMessage('Error on connecting / authenticating on server' + sLineBreak + E.Message);
    end;
  finally
    if not(lMyIdText = nil) then
      lMyIdText.Free;
    ///
    if not(lMyIdSSLIOHandlerSocket = nil) then
      lMyIdSSLIOHandlerSocket.Free;
  end;
end;

end.
