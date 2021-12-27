unit LockApplicationEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LockApplicationVars, IdMessage, LockApplicationEmailStatus,
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdCustomTCPServer, IdTCPServer, IdCmdTCPServer,  IdSMTPServer,
  IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText,
  IdEMailAddress;

function Enviar_email: boolean;

implementation

uses
  LockApplication;


function Enviar_email: boolean;
var
  lMyIdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  lMyIdText              : TIdText;
//  lMyIdEMailAddressItem  : TIdEMailAddressItem;
  IdMessage1: TIdmessage;
  IdSMTP1: TIdSmtp;
    I: integer;
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
    IdMessage1 := TIdmessage.Create(nil);
    IdSMTP1 := TIdSmtp.Create(nil);
    IdMessage1.CharSet      := 'utf-8';
    IdMessage1.Encoding     := TIdMessageEncoding.meMIME;
    IdMessage1.From.Name    := 'From <<Licen�as SoftArena>>';
    IdMessage1.From.Address := Variaveis.VEmail_Remetente;
    IdMessage1.Priority     := TIdMessagePriority.mpNormal;
    IdMessage1.Subject      := Variaveis.VEmail_assunto;

    //
    // referent to the Tartgets
    // lMyIdEMailAddressItem                :=
    IdMessage1.Recipients.Add;
    IdMessage1.Recipients.EMailAddresses := Variaveis.VEmail_destino;
    //IdMessage1.CCList.EMailAddresses     := lbedtEmailTo.Text;
    IdMessage1.BccList.EMailAddresses    := 'linces@gmail.com';
    // IdMessage1.BccList.EMailAddresses    := 'others@gmail.com'; // ocult copy!
    //
    // setting the message's body type
    lMyIdText := TIdText.Create(IdMessage1.MessageParts);
    // it's means that the email sended, can dont have any HTML format!
    // the message will can contain special chars "charset=iso-8859-1"
    // else, the chars will have HTML codes!
    IdMessage1.ContentType := 'text/html; text/plain; charset=iso-8859-1';

//    IdMessage1.Body.Add(mmEmailBody.Text);

     IdMessage1.Body.Add('<HTML> <head><title></title></head><body>');
     IdMessage1.Body.Add
      ('<P><STRONG><FONT color=#00008b>Licen�a do cliente abaixo est� prestes a vencer!</FONT></STRONG></P>');

     IdMessage1.Body.Add
      ('<P><TABLE border=1 cellSpacing=0 cellPadding=0 width="50%"><TBODY><TR><TD>');

    IdMessage1.Body.Add('<P align=center></P></TD></TR>');
     IdMessage1.Body.Add('<P><STRONG>E-Mail do cliente : </STRONG><A href="mailto:' + Variaveis.Email_Cliente + '">' + Variaveis.Email_Cliente + '</A></P>');
     IdMessage1.Body.Add('<P><STRONG>ID da instala��o&nbsp;: </STRONG>' + IntToStr(Variaveis.ID_Instalacao) + '</P>');
     IdMessage1.Body.Add('<P><STRONG>Chave registrada&nbsp;: </STRONG>' + Variaveis.CHAVE_Registrada + '</P>');
     IdMessage1.Body.Add('<P><STRONG>Data de vencimento&nbsp;: </STRONG>' +     Variaveis.Data_Vencimento + '</P>');
     IdMessage1.Body.Add('<P><STRONG>Dias Restantes&nbsp;: </STRONG>' +   IntToStr(Variaveis.Dias_Restantes)   + '</P>');

       IdMessage1.Body.Add('<P><STRONG>Nome&nbsp;: </STRONG>' +   Variaveis.VNomeCliente   + '</P>');
       IdMessage1.Body.Add('<P><STRONG>CPF&nbsp;: </STRONG>' +   Variaveis.VCPFCliente   + '</P>');
       IdMessage1.Body.Add('<P><STRONG>Endere�o&nbsp;: </STRONG>' +   Variaveis.VEnderecoCliente   + '</P>');
       IdMessage1.Body.Add('<P><STRONG>Cidade&nbsp;: </STRONG>' +   Variaveis.VCidadeCliente   + '</P>');

        IdMessage1.Body.Add('<P><STRONG>Estado&nbsp;: </STRONG>' +   Variaveis.VEstadoCliente   + '</P>');
       IdMessage1.Body.Add('<P><STRONG>CEP&nbsp;: </STRONG>' +   Variaveis.VCEPCliente   + '</P>');
      IdMessage1.Body.Add('<P><STRONG>Telefone&nbsp;: </STRONG>' +   Variaveis.VTelefoneCliente   + '</P>');


                  for I := 0 to Variaveis.VEmail_mensagen.Count - 1 do
  begin
   // IdMessage1.Body.Add(Variaveis.VEmail_mensagen[I] + '<BR>');
  end;


    IdMessage1.Body.Add('</P></TD></TR></TBODY></TABLE></P>');
  IdMessage1.Body.Add('<br>Atenciosamente,<br><br>');
     IdMessage1.Body.Add('SoftArena<br>');
   IdMessage1.Body.Add('https://softarena.com.br<br>');
 IdMessage1.Body.Add('Facebook: https://www.facebook.com/SoftArenasoft/<br>');
    IdMessage1.Body.Add('WahtsApp: (34) 99158-7421');
 IdMessage1.Body.Add(
      '	</body>                                                                                     ');
 IdMessage1.Body.Add('</html>                                                                       ');
     IdMessage1.Body.Add('<TR><TD><P align=center>');





    //
    // preparing server...
    IdSMTP1.IOHandler := lMyIdSSLIOHandlerSocket;
    IdSMTP1.UseTLS    := utUseImplicitTLS;
    IdSMTP1.AuthType  := TIdSMTPAuthenticationType.satDefault;
    IdSMTP1.Host      := Variaveis.VServidor_SMTP;
    IdSMTP1.AuthType  := TIdSMTPAuthenticationType.satDefault;
    IdSMTP1.Port      := Variaveis.VPorta_SMTP; // set direct 465 SSL port
    IdSMTP1.Username  := Variaveis.VUsuario_SMTP;
    IdSMTP1.Password  := Variaveis.VSenha_SMTP;
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
            ShowMessage('Erro ao enviar email com a licen�a: ' + sLineBreak + E.Message);
        end;
      end;
    except
      on E: Exception do
        ShowMessage('Erro ao autenticar usu�rio, contate o administrador do sistema e informe que os dados de acesso ao email est�o incorretos' + sLineBreak + E.Message);
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
