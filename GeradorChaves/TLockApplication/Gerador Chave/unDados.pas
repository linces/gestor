unit unDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Comp.UI,
  FireDAC.VCLUI.Login, Messages, Controls, Forms, vcl.Dialogs,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  Datasnap.DBClient, ZAbstractConnection, ZConnection, DCPrc4, DCPsha1,
  LockApplication, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, ShellApi,
  System.Rtti, Tlhelp32, REST.Response.Adapter, RESTRequest4D.Request,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,  System.JSON, WinSock, IdTCPClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Uni, MemDS, DBAccess,
  UniProvider, MySQLUniProvider;

type
  TDados = class(TDataModule)
    dsLicencasTable: TDataSource;
    ConfigprincipalConnection: TFDConnection;
    LockApplication1: TLockApplication;
    dsConfigs: TDataSource;
    ConfigsTable: TFDTable;
    ConfigsTableserver: TStringField;
    ConfigsTabledatabase: TStringField;
    ConfigsTableuser: TStringField;
    ConfigsTablepassword: TStringField;
    ConfigsTablecel: TStringField;
    ConfigsTableidioma: TStringField;
    IdIcmpClient1: TIdIcmpClient;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    tblretorno: TFDMemTable;
    zLicencas: TZConnection;
    zLicencasTable: TZQuery;
    zLicencasTableid: TZIntegerField;
    zLicencasTableidsistema: TZUnicodeStringField;
    zLicencasTableidinstalacao: TZUnicodeStringField;
    zLicencasTabledatainstalacao: TZDateTimeField;
    zLicencasTableultimasincronizacao: TZDateTimeField;
    zLicencasTableestadolicenca: TZIntegerField;
    zLicencasTableversao: TZUnicodeStringField;
    zLicencasTablegerarchavepor: TZUnicodeStringField;
    zLicencasTablediasavencer: TZIntegerField;
    zLicencasTabledataavencer: TZDateField;
    zLicencasTablechave: TZUnicodeStringField;
    zLicencasTabledataultimachave: TZDateField;
    zLicencasTableonoff: TZShortIntField;
    zLicencasTablenome: TZUnicodeStringField;
    zLicencasTableemail: TZUnicodeStringField;
    zLicencasTablecpfcnpj: TZUnicodeStringField;
    zLicencasTablecep: TZUnicodeStringField;
    zLicencasTableendereco: TZUnicodeStringField;
    zLicencasTablecidade: TZUnicodeStringField;
    zLicencasTableestado: TZUnicodeStringField;
    zLicencasTablecelular: TZUnicodeStringField;
    zLicencasTableultimoip: TZUnicodeStringField;
    zLicencasTablecomando: TZUnicodeStringField;
    zLicencasTableexecutado: TZUnicodeStringField;
    zLicencasTablemsgdireta: TZUnicodeStringField;
    CriaBase: TZQuery;
    uniLicencas: TUniConnection;
    uniqryLicencas: TUniQuery;
    uniLicencasTable: TUniTable;
    MySQLUniProvider1: TMySQLUniProvider;
    uniLicencasTableid: TIntegerField;
    uniLicencasTableidsistema: TStringField;
    uniLicencasTableidinstalacao: TStringField;
    uniLicencasTabledatainstalacao: TDateTimeField;
    uniLicencasTableultimasincronizacao: TDateTimeField;
    uniLicencasTableestadolicenca: TIntegerField;
    uniLicencasTableversao: TStringField;
    uniLicencasTablegerarchavepor: TStringField;
    uniLicencasTablediasavencer: TIntegerField;
    uniLicencasTabledataavencer: TDateField;
    uniLicencasTablechave: TStringField;
    uniLicencasTabledataultimachave: TDateField;
    uniLicencasTableonoff: TBooleanField;
    uniLicencasTablenome: TStringField;
    uniLicencasTableemail: TStringField;
    uniLicencasTablecpfcnpj: TStringField;
    uniLicencasTablecep: TStringField;
    uniLicencasTableendereco: TStringField;
    uniLicencasTablecidade: TStringField;
    uniLicencasTableestado: TStringField;
    uniLicencasTablecelular: TStringField;
    uniLicencasTableultimoip: TStringField;
    uniLicencasTablecomando: TStringField;
    uniLicencasTableexecutado: TStringField;
    uniLicencasTablemsgdireta: TStringField;
    ConfigsTableipserver: TStringField;
    ConfigsTableiniciarwhats: TStringField;
    ConfigsTableprotegercomsenha: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
    procedure uniLicencasTableAfterScroll(DataSet: TDataSet);
  private
    function Pinga(ip: string): boolean;




  public
    Idioma: string;
    licencasemprazoexp: string;
    chavejautilizada: string;
    chaveinfoinvalida: string;
    sistemanaoliberademo: string;
    Errobdlicencas: string;
    registroaltererecup: string;
    erro, strTotalRegistros, strRegistroAtual: string;
    procedure inicializalinguagem;
    function decriptar(Str, Keystr: string): string;
    function encriptar(Str, Keystr: string): string;
    function PingaRest(servidor: string): boolean;
        function PortTCP_IsOpen(dwPort: Word; ipAddressStr: AnsiString): boolean;
            function PortIsOpen(const APort: Integer; const AAddress: string): Boolean;
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unConexao, unPrincipal, Ping2;

{$R *.dfm}

function TDados.encriptar(Str, Keystr: string): string;
var
  i: integer;
  Cipher: TDCP_rc4;
begin

      Cipher:= TDCP_rc4.Create(Self);
      Cipher.InitStr(KeyStr,TDCP_sha1);
      result := Cipher.EncryptString(Str);
      Cipher.Burn;
      Cipher.Free;

end;

function TDados.decriptar(Str, Keystr: string): string;
var
  i: integer;
  Cipher: TDCP_rc4;
begin

      Cipher:= TDCP_rc4.Create(Self);
      Cipher.InitStr(KeyStr,TDCP_sha1);
      result := Cipher.DecryptString(Str);
      Cipher.Burn;
      Cipher.Free;

end;

procedure TDados.DataModuleCreate(Sender: TObject);
var
 oParams : TStringList;
 server, usuario, database, password: string;
begin

  inicializalinguagem;

  ConfigprincipalConnection.Connected := false;
  ConfigprincipalConnection.Params.database := ExtractFilePath(Application.exename) + 'gerenciador.db';
  ConfigprincipalConnection.Params.Add('DriverID=SQLite');
  ConfigprincipalConnection.Connected := true;

  if ConfigprincipalConnection.Connected then begin
    ConfigsTable.Active := true;

    // Zeos
    zLicencas.Connected := false;
    zLicencas.LoginPrompt := false;
    zLicencas.Protocol := 'mysql';
    zLicencas.LibraryLocation := ExtractFilePath(Application.ExeName) +
      'libmysql.dll';
    zLicencas.HostName := decriptar(ConfigsTableserver.Text, 'xxslhhe193006');
    zLicencas.Database := decriptar(ConfigsTabledatabase.Text, 'xxslhhe193006');
    zLicencas.Port := 3306;
    zLicencas.User := decriptar(ConfigsTableuser.Text, 'xxslhhe193006');
    zLicencas.Password := decriptar(ConfigsTablepassword.Text, 'xxslhhe193006');

    // Unidac
    uniLicencas.Connected := false;
    uniLicencas.ProviderName := 'mysql';
    uniLicencas.Server       := decriptar(ConfigsTableserver.Text, 'xxslhhe193006');
    uniLicencas.Database     := decriptar(ConfigsTabledatabase.Text, 'xxslhhe193006');
    uniLicencas.Username     := decriptar(ConfigsTableuser.Text, 'xxslhhe193006');
    uniLicencas.Password     := decriptar(ConfigsTablepassword.Text, 'xxslhhe193006');
    uniLicencas.Port         := 3306;


    if ConfigsTable.Active then
    begin
     ConfigsTable.Edit;
    end;

    try
     zLicencas.Connected := true;
     uniLicencas.Connected := true;
    except
    on E: Exception do
      ShowMessage( E.Message+'. Erro no bd de licenças.'+sLineBreak+'Verifique se o servidor e banco de dados estão definidos corretamente!');
    end;

  end;

  if uniLicencas.Connected then begin
  //  ShowMessage('Unidac Conectado');
        uniLicencasTable.Active := true;
    Principal := TPrincipal.Create(Self);
    Principal.Showmodal;
  end


{  if zLicencas.Connected then
  begin
    zLicencasTable.Active := true;
    Principal := TPrincipal.Create(Self);
    Principal.Showmodal;
  end  }
  else if not zLicencas.Connected then begin
    frmConexao := TfrmConexao.Create(Self);
    frmConexao.Showmodal;
  end;


end;


procedure TDados.inicializalinguagem;
begin
    if LockApplication1.Language = Portugues then begin
       Idioma := 'Portugues';
       Errobdlicencas := 'Erro ao conectar o banco de dados de Licenças!';
       registroaltererecup := 'Registro foi alterado pelo usuário e será recuperado!';
       sistemanaoliberademo := 'Sistema não liberado para demonstração';
       chaveinfoinvalida := 'Chave informada é inválida!' + #13 + 'Entre em contato com o administrador do sistema';
       chavejautilizada := 'Chave já utilizada antes!';
       licencasemprazoexp := 'Licença sem prazo de expiração!';
    end;
    if LockApplication1.Language = English then begin
       Idioma := 'English';
       Errobdlicencas := 'Error on connecting the License database!';
       registroaltererecup := 'Registration has been changed by the user and will be recovered!!';
       sistemanaoliberademo := 'System not released for demonstration';
       chaveinfoinvalida := 'Key entered is invalid!' + #13 + 'Contact your system administrator';
       chavejautilizada := 'Key already used before!';
       licencasemprazoexp := 'License without expiration date or days!';
    end;
    if LockApplication1.Language = Spanish then begin
       Idioma := 'Spanish';
       Errobdlicencas := '¡Error al conectar la base de datos de licencias!';
       registroaltererecup := 'El registro ha sido modificado por el usuario y se recuperará.';
       sistemanaoliberademo := 'Sistema no publicado para demostración';
       chaveinfoinvalida := '¡La clave ingresada no es válida!' + #13 + 'Póngase en contacto con el administrador de su sistema';
       chavejautilizada := '¡La llave ya se usó antes!';
       licencasemprazoexp := '¡Licencia sin caducidad!';
    end;
end;

function Tdados.Pinga(ip: string):boolean;
var
  IdICMPClient: TIdICMPClient;
begin

  try

    IdICMPClient := TIdICMPClient.Create( nil );

    IdICMPClient.Host := ip;
    IdICMPClient.ReceiveTimeout := 500;
    IdICMPClient.Ping;

    result := (IdICMPClient.ReplyStatus.BytesReceived > 0 );

  finally
    IdICMPClient.Free;
  end
end;



function TDados.PingaRest(servidor: string): boolean;
var
    json, super : string;
    Resposta: IResponse;

    jarray : TJSONArray;

    LJsonValue : TJSONValue;
    LItem     : TJSONValue;

begin
    Application.ProcessMessages;



   try
     RESTClient1.BaseURL := servidor;
     resposta := TRequest.New.BaseURL(RESTClient1.BaseURL+'/ping')
    .Accept('application/json')
    //.DataSetAdapter(tblretorno)
    .Get;

    Application.ProcessMessages;

    if Resposta.StatusCode <> 200 then
    begin
        Application.ProcessMessages;
        result := false;
      //  exit;

  Application.ProcessMessages;
//        erro := 'Erro: ' + Resposta.StatusCode.ToString;
    end
    else
    begin
     if Resposta.StatusCode = 200 then begin
       result := true;
     end;
    end;
   except
      result := false;
      exit
   end;
end;

procedure TDados.RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
begin
 ShowMessage('Erro cliente');
 exit;
end;

procedure TDados.RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
begin
 Showmessage('Erro');
 exit;
end;

procedure TDados.uniLicencasTableAfterScroll(DataSet: TDataSet);
begin
if uniLicencas.Connected then
  begin
    if uniLicencasTable.Active then
    begin
      if (Assigned(Principal) = true) then
      begin
        Principal.strTotalRegistros.Caption := 'Total de registros: ' +
          IntToStr(uniLicencasTable.RecordCount);
        Principal.strRegistroAtual.Caption := 'Registro atual: ' +
          IntToStr(uniLicencasTable.RecNo);
      end;

      Application.ProcessMessages;

     if PortIsOpen(9002, Dados.uniLicencasTableultimoip.Text) then
      begin
        if PingaRest('http://' + Dados.uniLicencasTableultimoip.Text   + ':9002') then begin
        uniLicencasTable.Edit;
        uniLicencasTableonoff.Value := true;
        uniLicencasTable.Post;
       end;

      end

      else if not PortIsOpen(9002, Dados.uniLicencasTableultimoip.Text) then
      begin
        uniLicencasTable.Edit;
        uniLicencasTableonoff.Value := false;
        uniLicencasTable.Post;
      end;

    end;

end;

end;

//procedure TDados.zLicencasTableAfterScroll(DataSet: TDataSet);
//begin
//
//if zLicencas.Connected then
//  begin
//    if zLicencasTable.Active then
//    begin
//      if (Assigned(Principal) = true) then
//      begin
//        Principal.strTotalRegistros.Caption := 'Total de registros: ' +
//          IntToStr(zLicencasTable.RecordCount);
//        Principal.strRegistroAtual.Caption := 'Registro atual: ' +
//          IntToStr(zLicencasTable.RecNo);
//      end;
//
//      Application.ProcessMessages;
//
//     if PortIsOpen(9002, Dados.zLicencasTableultimoip.Text) then
//      begin
//        if PingaRest('http://' + Dados.zLicencasTableultimoip.Text   + ':9002') then begin
//        zLicencasTable.Edit;
//        zLicencasTableonoff.Value := 1;
//        zLicencasTable.Post;
//       end;
//
//      end
//
//      else if not PortIsOpen(9002, Dados.zLicencasTableultimoip.Text) then
//      begin
//        zLicencasTable.Edit;
//        zLicencasTableonoff.Value := 0;
//        zLicencasTable.Post;
//      end;
//
//    end;
//
//    // Principal.DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//end;
//
//end;




function TDados.PortTCP_IsOpen(dwPort : Word; ipAddressStr:AnsiString) : boolean;
var
  client : sockaddr_in;
  sock   : Integer;

  ret    : Integer;
  wsdata : WSAData;
begin
 Result:=False;
 ret := WSAStartup($0002, wsdata); //initiates use of the Winsock DLL
  if ret<>0 then exit;
  try
    client.sin_family      := AF_INET;  //Set the protocol to use , in this case (IPv4)
    client.sin_port        := htons(dwPort); //convert to TCP/IP network byte order (big-endian)
    client.sin_addr.s_addr := inet_addr(PAnsiChar(ipAddressStr));  //convert to IN_ADDR  structure
    sock  :=socket(AF_INET, SOCK_STREAM, 0);    //creates a socket
    Result:=connect(sock,client,SizeOf(client))=0;  //establishes a connection to a specified socket
    ShowMessage('Aberto'+ipAddressStr);
  finally
    WSACleanup;
  end;
end;

function TDados.PortIsOpen(const APort: Integer; const AAddress: string):
    Boolean;
var
  LTcpClient: TIdTCPClient;
begin
  LTcpClient := TIdTCPClient.Create(nil);
  try
    try
      LTcpClient.Host := AAddress;      //which server to test
      LTcpClient.Port := APort;         //which port to test
      LTcpClient.ConnectTimeout := 100; //assume a port to be clodes if it does not respond within 200ms (some ports will immediately reject, others are using a "stealth" mechnism)
      LTcpClient.Connect;               //try to connect
      result := true;                   //port is open
    except
      result := false;
    end;
  finally
    freeAndNil(LTcpClient);
  end;
end;



end.
