//****************************************************************//
// Autor: Linces Marques
// Ultima altera��o: 22/01/2021 - 2.0.2.22
// Primeira vers�o.: 30/09/2017 - 1.0.0.0
//
//
// Dispon�vel do Delphi XE7 ao 10.4.1 Sydney
//****************************************************************//

unit LockApplication;

interface

uses
  Windows, Messages, SysUtils, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LockApplicationVars, LockApplicationInterface,
  LockApplicationFunc, inifiles, LockApplicationControle, ExtCtrls,
  LockApplicationEmail, Wininet, CadastroUnt, System.Classes, System.Threading, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, System.UITypes, unSecDados, Winapi.WinSock2, IdStack, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.JSON,  IdAntiFreezeBase, Vcl.IdAntiFreeze,System.Hash,
  Winapi.AclAPI,
  WinApi.ActiveX,
  ShellApi,
  System.Rtti, Tlhelp32, REST.Response.Adapter, RESTRequest4D.Request, ACBrBase, ACBrSocket;


type
  TLanguage = (Portugues, English, Spanish);
  TLockApplication = class(TComponent)


  private

  protected
    { Protected declarations }
{      VAut_SSL: Boolean;
       VServidor_SMTP: String;
       VUsuario_SMTP: String;
       VSenha_SMTP: String;
       VPorta_SMTP: integer;
       VEmail_Remetente: String;
       VEmail_destino: String;
       VEmail_assunto: String;
       VEmail_mensagen: TStrings;
       VDias_email: integer;
       VEnviar_Email: Boolean;}

             Mensagen: TStrings;
             Versao_do_Sistema: integer;
             Informacao_adc: boolean;
             nomeclientev: string;
             cpfclientev: string;
             enderecov: string;
             cidadev: string;
             telefonev: string;
             estadov: string;
             cepv: string;
             Versao_trialV: integer;

    function GetVAut_SSL: Boolean;
    procedure SetVAut_SSL( value: Boolean );
    function GetVEnviar_email: Boolean;
    procedure SetVEnviar_email( value: Boolean );
    function GetVServidor_email: String;
    procedure SetVServidor_email( value: String );
    function GetVUsuario_SMTP: String;
    procedure SetVUsuario_SMTP( value: String );
    function GetVSenha_SMTP: String;
    procedure SetVSenha_SMTP( value: String );
    function GetVEmail_remetente: String;
    procedure SetVEmail_remetente( value: String );
    function GetVPorta_SMTP: integer;
    procedure SetVPorta_SMTP( value: integer );
    function GetVEmail_destino: String;
    procedure SetVEmail_destino( value: String );
    function GetVEmail_assunto: String;
    procedure SetVEmail_assunto( value: String );
    procedure SetVEmail_mensagen( value: TStrings );
    function GetVDias_email: integer;
    procedure SetVDias_email( value: integer );


    function GetDias_restantes: int64;
    function GetData_vencimento: String;
    function GetEmail_Cliente: String;
    function GetChave_registrada: String;
    function GetSistema_Demo: Boolean;
    
    function GetEmpresa_email: String;
    procedure SetEmpresa_email( value: String );

    function GetEmpresa_site: String;
    procedure SetEmpresa_site( value: String );

    function GetEmpresa_telefones: String;
    procedure SetEmpresa_telefones( value: String );

    function GetChave_Crypt: String;
    procedure SetChave_Crypt( value: String );

    function GetID_Sistema: int64;
    procedure SetID_Sistema( value: int64 );

    function GetDias_Trial: int64;
    procedure SetDias_Trial( value: int64 );

    function GetTrial: Boolean;
    procedure SetTrial( value: Boolean );

    function GetMostrar_Tela: Boolean;
    procedure SetMostrar_Tela( value: Boolean );

    function GetTitulo_Janelas: String;
    procedure SetTitulo_Janelas( value: String );

    function GetLocal_Registro: String;
    procedure SetLocal_Registro( value: String );

    function GetIntervaloPing: integer;
    procedure SetIntervaloPing( value: integer );

    function Gethostbd: String;
    procedure Sethostbd( value: String );

    function Getdatabasebd: String;
    procedure Setdatabasebd( value: String );

    function Getusuariobd: String;
    procedure Setusuariobd( value: String );

    function Getpassword: String;
    procedure Setpassword( value: String );

    function Getportabd: integer;
    procedure Setportabd( value: integer );

    // Use essa propriedade para controlar quantos registros pode ser criados no seu bd,
    // exemplo:  quantas empresas em um sistema multi empresas, quantos produtos podem ser cadastrados, etc.
    function GetQuantRegistros: integer;
    procedure SetQuantRegistros( value: integer );

    function Getresturlcomporta: string;
    procedure Setresturlcomporta( value: string );

    function GetChecaRestServer: boolean;
    procedure SetChecaRestServer( value: boolean );

    function GetIDInstalacao: Int64;

    procedure Nunca_Registrado();
    procedure Ja_Registrado();
    procedure registrar( ativar: boolean );

    // INFORMACOES
    procedure ler_dados;



  public
    { Public declarations }
    Monitor: ITask;
    IdAntiFreeze1: TIdAntiFreeze;
    IntervaloCheca: TTimer;
    FmyLanguage : TLanguage;
    erro : string;
    constructor Create(AOwner: TComponent); override;
    procedure executar;
    procedure renovar;
    property IDInstalacao: Int64 read GetIDInstalacao;
    property Versao_Sistema: Integer read Versao_do_sistema;
    property Dias_RestantesU: int64 read GetDias_restantes;
    property Data_VencimentoU: string read GetData_Vencimento;
    property Email_ClienteU: string read GetEmail_Cliente;
    property Chave_RegistradaU: String read GetChave_Registrada;
    property Sistema_DemoU: Boolean read GetSistema_demo;            
    function Gera_Chave_Dias( ID_Instalacao, ID_Sistema, Dias, Versao_Sistema: int64 ):String;
    function Gera_Chave_Data( ID_Instalacao, ID_Sistema: int64; data: String; Versao_Sistema: int64 ):String;
    property Cliente_Nome: string read NomeClientev;
    property Cliente_CPF: string read cpfclientev;
    property Cliente_Cep: string read cepv;
    property Cliente_Endereco: string read enderecov;
    property Cliente_Cidade: string read cidadev;
    property Cliente_Estado: string read Estadov;
    property Cliente_Telefone: string read telefonev;

    procedure Atualizar_Cadastro;
    procedure IntervaloChecaTimer(Sender: TObject);
    procedure ConectaBD;
    function EnviaComandos(cmd, idsistema, idinstalacao: string): boolean;
    function RecebeComandos: boolean;
    function AsciiToInt(Caracter: Char): Integer;
    function Encripta(texto: string; chave: integer): String;
    function Decripta(texto: string; chave: integer): String;
    procedure CriaRegistronoBD;
    function GetIPAddress: String;
    procedure inicializalinguagem;
    function ChecaServidorRest(servidorexe: string): boolean;
    function ExecutaeAguarda(const strCommandLine : String; intVisibility: Integer = SW_SHOW) : Cardinal;
    function ExecutaNormal(sExeName, sCaminho: String): Boolean;
    function ProcessoRodando(sExeName: String): Boolean;
    function PingaRest(servidor: string):string;
    function RetornaPingaRest(servidor: string):boolean;




  published
    { Published declarations }
    property IDSistema: int64 read GetID_Sistema write SetID_Sistema;
    property Demostracao: Boolean read GetTrial write SetTrial;
    property Informacoes_adicionais: Boolean read informacao_adc write informacao_adc;
    property Mostrar_Tela_Primeira_Vez: Boolean read GetMostrar_Tela write
    SetMostrar_Tela;
    property Dias_Demostracao: int64 read GetDias_Trial write SetDias_Trial;
    property Local_Registro: String read GetLocal_registro write SetLocal_Registro;
    property Chave_Criptografia: String read GetChave_Crypt write SetChave_Crypt;
    property Titulo_das_janelas: String read GetTitulo_Janelas write SetTitulo_Janelas;
    property Email_de_contato: String read GetEmpresa_email write SetEmpresa_Email;
    property Site_da_Empresa: String read GetEmpresa_Site write SetEmpresa_Site;
    property Telefones_de_Contato: String read GetEmpresa_telefones write SetEmpresa_telefones;
    property Versao_Trial: integer read Versao_trialV write Versao_trialV;

    // EMAIL
    // SMTP_SSL: Boolean read GetVAut_SSL write SetVAut_SSL;
    property SMTP_Servidor: String read GetVServidor_email write SetVServidor_email;
    property SMTP_Usuario: String read GetVUsuario_SMTP write SetVUsuario_SMTP;
    property SMTP_Senha: String read GetVSenha_SMTP write SetVSenha_SMTP;
    property SMTP_Porta: integer read GetVPorta_SMTP write SetVPorta_SMTP;
    property EMAIL_Enviar: Boolean read GetVEnviar_email write SetVEnviar_email;
    property EMAIL_Remetente: String read GetVEmail_remetente write SetVEmail_Remetente;
    property EMAIL_Destino: String read GetVEmail_destino write SetVEmail_destino;
    property EMAIL_Assunto: String read GetVEmail_assunto write SetVEmail_assunto;
    property EMAIL_Mensagen: TStrings read Mensagen write SetVEmail_mensagen;
    property EMAIL_Dias_enviar: integer read GetVDias_email write SetVDias_email;

    property IntervaloPing: integer read GetIntervaloPing write SetIntervaloPing;
    property HostBD: string read Gethostbd write Sethostbd;
    property DatabaseBD: string read Getdatabasebd write Setdatabasebd;
    property PasswordBD: string read GetPassword write SetPassword;
    property UsuarioBD: string read Getusuariobd write Setusuariobd;
    property PortaBD: integer read Getportabd write Setportabd;

    property REST_url_com_porta: string read Getresturlcomporta write Setresturlcomporta;
    property RestServerAtivo: boolean read GetChecaRestServer write SetChecaRestServer;


    // Quantidade de registros que podem ser criados no bd.
    property QuantidaRegistrosBD: integer read GetQuantRegistros write SetQuantRegistros;

    // Idioma
    property Language : TLanguage read FmyLanguage write FmyLanguage;



  end;




procedure Register;


implementation



constructor TLockApplication.Create(AOwner: TComponent);
begin

  inherited create(AOwner);
   Func := TFunc.Create;
   Variaveis := TVariaveis.Create;
   Variaveis.ID_Sistema := 10;
   Variaveis.Dias_Trial := 15;
   Variaveis.Trial := true;
   informacao_adc := true;
   Versao_trialV := 1;
   Variaveis.Local_Registro := '\Software\Appro';
   Variaveis.Chave_Crypt := 'LockApplication';
   Variaveis.Titulo_Janelas := 'Seu t�tulo aqui';
   Variaveis.Mostrar_Tela := True;
   Variaveis.Empresa_Email := 'softarena@softarena.com.br';
   Variaveis.Empresa_Site := 'https:\\loja.softarena.com.br';
   Variaveis.Empresa_Telefones := '(34) 99158-7421';
   Variaveis.VEmail_mensagen := TStringList.Create;
   Mensagen := TStringList.Create;
   variaveis.VEmail_mensagen.Clear;
   Variaveis.VDias_email := 5;
   Variaveis.VAut_SSL := true;
   Variaveis.VEnviar_Email := true;
   Variaveis.IntervaloPing := 9;
   Variaveis.hostbd :=  '';
   Variaveis.databasebd := '';
   Variaveis.usuariobd := 'root';
   Variaveis.password := 'root';
   Variaveis.portabd := 3306;
   Variaveis.QuantRegistros := 3;
   Variaveis.Caminholib := ExtractFilePath(Application.exename) +   'libmysql.dll';


end;

function TLockApplication.GetIPAddress: String;
var  LJsonObj   : TJSONObject;
  str:string;
  http : TIdHttp;
  begin
    str:='';
    http:=TIdHTTP.Create(nil);
    try
        str:=http.Get('http://ipinfo.io/json');
        LJsonObj:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str),0)  as TJSONObject;
        str := LJsonObj.Get('ip').JsonValue.Value;
        LJsonObj.Free;
        http.Free;
    Except
    end;
  //  ShowMessage('IP: '+str);
    result:=str;
end;

function TLockApplication.AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;


Function TLockApplication.Encripta(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])+chave);
    end;
    result:=retorno;
  end;
end;


Function TLockApplication.Decripta(texto:string;chave:integer):String;
var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])-chave);
    end;
    result:=retorno;
  end;
end;

procedure TLockApplication.inicializalinguagem;
begin
    if Language = Portugues then begin
      Variaveis.Idioma := 'Portugues';
       Variaveis.Errobdlicencas := 'Erro ao conectar o banco de dados de Licen�as!';
       Variaveis.registroaltererecup := 'Registro foi alterado pelo usu�rio e ser� recuperado!';
       Variaveis.sistemanaoliberademo := 'Sistema n�o liberado para demonstra��o';
       Variaveis.chaveinfoinvalida := 'Chave informada � inv�lida!' + #13 + 'Entre em contato com o administrador do sistema';
       Variaveis.chavejautilizada := 'Chave j� utilizada antes!';
       Variaveis.licencasemprazoexp := 'Licen�a sem prazo de expira��o!';
    end;
    if Language = English then begin
      Variaveis.Idioma := 'English';
       Variaveis.Errobdlicencas := 'Error on connecting the License database!';
       Variaveis.registroaltererecup := 'Registration has been changed by the user and will be recovered!!';
       Variaveis.sistemanaoliberademo := 'System not released for demonstration';
       Variaveis.chaveinfoinvalida := 'Key entered is invalid!' + #13 + 'Contact your system administrator';
       Variaveis.chavejautilizada := 'Key already used before!';
       Variaveis.licencasemprazoexp := 'License without expiration date or days!';
    end;
    if Language = Spanish then begin
      Variaveis.Idioma := 'Spanish';
       Variaveis.Errobdlicencas := '�Error al conectar la base de datos de licencias!';
       Variaveis.registroaltererecup := 'El registro ha sido modificado por el usuario y se recuperar�.';
       Variaveis.sistemanaoliberademo := 'Sistema no publicado para demostraci�n';
       Variaveis.chaveinfoinvalida := '�La clave ingresada no es v�lida!' + #13 + 'P�ngase en contacto con el administrador de su sistema';
       Variaveis.chavejautilizada := '�La llave ya se us� antes!';
       Variaveis.licencasemprazoexp := '�Licencia sin caducidad!';
    end;
end;

procedure TLockApplication.executar;
var
 oParams : TStringList;
 server, usuario, database, password: string;
begin
  Controle := TControle.Create;
  Variaveis.ID_Instalacao := Func.GetID_Instalacao;
  inicializalinguagem;

  dmSecDados := TdmSecDados.Create( nil );

  server := Variaveis.hostbd;
  database := Variaveis.databasebd;
  usuario := Variaveis.usuariobd;
  password := Variaveis.password;

  try

    dmSecDados.zlicencas.HostName := server;
    dmSecDados.zlicencas.Port     := 3306;
    dmSecDados.zlicencas.Database := database;
    dmSecDados.zlicencas.User     := usuario;
    dmSecDados.zlicencas.Password := password;

    dmSecDados.zlicencas.Connected := true;



  except
    on E: Exception do
        ShowMessage(Variaveis.Errobdlicencas + sLineBreak + E.Message);
  end;



   ConectaBD;


   IntervaloCheca := TTimer.Create(Self);
   IntervaloCheca.Interval := Variaveis.IntervaloPing * 1000;
   IntervaloCheca.Ontimer := IntervaloChecaTimer;
   IntervaloCheca.Enabled := true;

   if Func.Protect_existe then
      begin
         if not Func.Chave_Criada then
            begin
               MessageDlg( Variaveis.registroaltererecup, mtError, [mbOK], 0);
               Func.Criar_Chave;
               Func.Protec_Recuperar;
            end;
      end;
   if Func.Chave_Criada then
      Ja_Registrado()
   else
      Nunca_Registrado();

end;

procedure TlockApplication.CriaRegistronoBD;
var
oParams: TStrings;
begin

end;

procedure TlockApplication.IntervaloChecaTimer(Sender: TObject);
begin
  RecebeComandos;
end;

function TLockApplication.EnviaComandos(cmd, idsistema, idinstalacao: string): boolean;
var
 comando : string;
begin
   if dmSecDados.zlicencas.Connected then begin
     dmSecDados.zlicencastable.Active := true
   end else if not dmSecDados.zlicencas.Connected then begin
     dmSecDados.zlicencas.Connected := true;
     dmSecDados.zlicencastable.Active := true;
   end;

     dmSecDados.zlicencastable.Close;
     dmSecDados.zlicencastable.SQL.Clear;
     dmSecDados.zlicencastable.SQL.Add('select * from licencas where (licencas.idsistema = '+QuotedStr(idsistema)+') and ');
     dmSecDados.zlicencastable.SQL.Add('(licencas.idinstalacao = '+QuotedStr(idinstalacao)+')');
     dmSecDados.zlicencastable.Open;

      if dmSecDados.zlicencastable.RecordCount > 0 then begin
        dmSecDados.zlicencastable.Edit;
       if comando = 'KILL' then begin
        dmSecDados.zlicencastable.FieldByName('comando').AsString := 'KILL';
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '0';
       end;
       if comando = 'ILEGAL' then begin
        dmSecDados.zlicencastable.FieldByName('comando').AsString := 'ILEGAL';
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '0';
       end;
       if comando = 'RENOVAR' then begin
        dmSecDados.zlicencastable.FieldByName('comando').AsString := 'RENOVAR';
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '0';
       end;
        dmSecDados.zlicencastable.Post;
        dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
      end;



end;

function TLockApplication.RecebeComandos: boolean;
var
 idnovo, conta: Integer;

begin


     dmSecDados.zlicencastable.Close;
     dmSecDados.zlicencastable.SQL.Clear;
     dmSecDados.zlicencastable.SQL.Add('select * from licencas');
     dmSecDados.zlicencastable.Open;

     idnovo :=  dmSecDados.zlicencastable.FieldByName('id').AsInteger + 1;


  if dmSecDados.zlicencas.Connected then begin
     dmSecDados.zlicencastable.Close;
     dmSecDados.zlicencastable.SQL.Clear;
     dmSecDados.zlicencastable.SQL.Add('select * from licencas where (licencas.idsistema = '+QuotedStr(InttoStr(Variaveis.ID_Sistema))+') and ');
     dmSecDados.zlicencastable.SQL.Add('(licencas.idinstalacao = '+QuotedStr(InttoStr(Variaveis.ID_Instalacao))+')');
     dmSecDados.zlicencastable.Open;


     // Checa se voltou algum registro associado ao sistema em uso    // Se j� tem registro
     if dmSecDados.zlicencastable.RecordCount > 0 then begin
         dmSecDados.zlicencastable.Edit;
         dmSecDados.zlicencastable.FieldByName('idsistema').AsString :=  inttostr(Variaveis.ID_Sistema);
         dmSecDados.zlicencastable.FieldByName('idinstalacao').AsString :=  InttoStr(Variaveis.ID_Instalacao);
         dmSecDados.zlicencastable.FieldByName('ultimasincronizacao').AsDateTime := now;

         if Variaveis.SISTEMA_DEMO = true then begin
            dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger := 0;
            dmSecDados.zlicencastable.FieldByName('chave').AsString :=   'DEMONSTRA��O';
         end        else
         if Variaveis.SISTEMA_DEMO = false then begin
            dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger := 1;
            dmSecDados.zlicencastable.FieldByName('chave').AsString := Variaveis.CHAVE_Registrada;
         end;

         dmSecDados.zlicencastable.FieldByName('versao').AsString :=  inttostr(Versao_trialV);
         dmSecDados.zlicencastable.FieldByName('nome').AsString :=  nomeclientev;
         dmSecDados.zlicencastable.FieldByName('email').AsString :=  Email_ClienteU;
         dmSecDados.zlicencastable.FieldByName('diasavencer').AsString :=  Variaveis.Dias_Restantes.ToString;
         dmSecDados.zlicencastable.FieldByName('cpfcnpj').AsString :=  cpfclientev;
         dmSecDados.zlicencastable.FieldByName('cep').AsString :=  cepv;
         dmSecDados.zlicencastable.FieldByName('endereco').AsString :=  enderecov;
         dmSecDados.zlicencastable.FieldByName('cidade').AsString :=  cidadev;
         dmSecDados.zlicencastable.FieldByName('estado').AsString :=  estadov;
         dmSecDados.zlicencastable.FieldByName('celular').AsString :=  telefonev;

         dmSecDados.zlicencastable.FieldByName('ultimoip').AsString :=  GetIPAddress;

         dmSecDados.zlicencastable.FieldByName('dataultimachave').AsDateTime :=  now;


         if  Variaveis.Dias_Restantes.ToString <> 'NULL' then begin
          dmSecDados.zlicencastable.FieldByName('dataavencer').AsString :=  Variaveis.Data_Vencimento
         end else if Variaveis.Dias_Restantes.ToString = '' then begin
          dmSecDados.zlicencastable.FieldByName('dataavencer').AsString :=  Variaveis.Data_Vencimento;
         end;

      //    ShowMessage('Tem registro, vou postar');
          dmSecDados.zlicencastable.Post;
          dmSecDados.zlicencastable.ApplyUpdates;
          dmSecDados.zlicencastable.CommitUpdates;


     if  dmSecDados.zlicencastable.FieldByName('comando').AsString = 'CHAT' then begin
       if  dmSecDados.zlicencastable.FieldByName('executado').AsString = '0' then begin
        ShowMessage(dmSecDados.zlicencastable.FieldByName('msgdireta').AsString);
        dmSecDados.zlicencastable.Edit;
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '1';
        dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
        exit;
       end;
     end;



        if  dmSecDados.zlicencastable.FieldByName('comando').AsString = 'KILL' then begin
       if  dmSecDados.zlicencastable.FieldByName('executado').AsString = '0' then begin
        dmSecDados.zlicencastable.Edit;
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '1';
       dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
        ShowMessage(Mensagen.Text);
        Halt;
       end;
     end;

     if  dmSecDados.zlicencastable.FieldByName('comando').AsString = 'KILL' then begin
       if  dmSecDados.zlicencastable.FieldByName('executado').AsString = '0' then begin
        dmSecDados.zlicencastable.Edit;
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '1';
       dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
        ShowMessage(Mensagen.Text);
        Halt;
       end;
     end;
     if  dmSecDados.zlicencastable.FieldByName('comando').AsString = 'ILEGAL' then begin
       if  dmSecDados.zlicencastable.FieldByName('executado').AsString = '0' then begin
        dmSecDados.zlicencastable.Edit;
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '1';
        dmSecDados.zlicencastable.Post;
        dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
        ShowMessage(Mensagen.Text);
        Sleep(999);
        Application.ProcessMessages;
        ShowMessage(Mensagen.Text);
        Sleep(999);
        Application.ProcessMessages;
        ShowMessage(Mensagen.Text);
        Sleep(999);
        Application.ProcessMessages;
       end;
     end;
     if  dmSecDados.zlicencastable.FieldByName('comando').AsString = 'RENOVAR' then begin
       if  dmSecDados.zlicencastable.FieldByName('executado').AsString = '0' then begin
        IntervaloCheca.Enabled := false;
        renovar;
        dmSecDados.zlicencastable.Edit;
        dmSecDados.zlicencastable.FieldByName('executado').AsString := '1';
        dmSecDados.zlicencastable.Post;
        dmSecDados.zlicencastable.ApplyUpdates;
        dmSecDados.zlicencastable.CommitUpdates;
      //  if not Assigned(Bloqueio) then begin
         IntervaloCheca.Enabled := true;
    //    end;
       end;
     end;

    end


  else if dmSecDados.zlicencastable.RecordCount <= 0 then begin

   {  dmSecDados.zlicencastable.Close;
     dmSecDados.zlicencastable.SQL.Clear;
     dmSecDados.zlicencastable.SQL.Add('select * from licencas');
     dmSecDados.zlicencastable.Open;     }

         dmSecDados.zlicencastable.Insert;
         dmSecDados.qryMax.Open;
         idnovo :=  dmSecDados.qryMax.FieldByname('codigo').AsInteger;
         dmSecDados.qryMax.Close;

//         dmSecDados.zlicencastable.FieldByName('id').AsInteger :=  dmSecDados.zlicencastable.FieldByName('id').AsInteger + 1;
         dmSecDados.zlicencastable.FieldByName('id').AsInteger :=  idnovo;
         dmSecDados.zlicencastable.FieldByName('idsistema').AsString :=  inttostr(Variaveis.ID_Sistema);
         dmSecDados.zlicencastable.FieldByName('idinstalacao').AsString :=  InttoStr(Variaveis.ID_Instalacao);
         dmSecDados.zlicencastable.FieldByName('ultimasincronizacao').AsDateTime := now;

         if Variaveis.SISTEMA_DEMO = true then begin
            dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger := 0;
            dmSecDados.zlicencastable.FieldByName('chave').AsString :=   'DEMONSTRA��O';
         end        else
         if Variaveis.SISTEMA_DEMO = false then begin
            dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger := 1;
            dmSecDados.zlicencastable.FieldByName('chave').AsString := Variaveis.CHAVE_Registrada;
         end;

         dmSecDados.zlicencastable.FieldByName('versao').AsString :=  inttostr(Versao_trialV);
         dmSecDados.zlicencastable.FieldByName('nome').AsString :=  nomeclientev;
         dmSecDados.zlicencastable.FieldByName('email').AsString :=  Email_ClienteU;
         dmSecDados.zlicencastable.FieldByName('diasavencer').AsString :=  Variaveis.Dias_Restantes.ToString;
         dmSecDados.zlicencastable.FieldByName('cpfcnpj').AsString :=  cpfclientev;
         dmSecDados.zlicencastable.FieldByName('cep').AsString :=  cepv;
         dmSecDados.zlicencastable.FieldByName('endereco').AsString :=  enderecov;
         dmSecDados.zlicencastable.FieldByName('cidade').AsString :=  cidadev;
         dmSecDados.zlicencastable.FieldByName('estado').AsString :=  estadov;
         dmSecDados.zlicencastable.FieldByName('celular').AsString :=  telefonev;
         dmSecDados.zlicencastable.FieldByName('ultimoip').AsString :=  GetIPAddress;
        //dmSecDados.zlicencastable.FieldByName('ultimoip').AsString :=  PingaRest(Variaveis.resturlcomporta);


         dmSecDados.zlicencastable.FieldByName('dataultimachave').AsDateTime :=  now;
         dmSecDados.zlicencastable.FieldByName('datainstalacao').AsDateTime :=  now;

         if  Variaveis.Dias_Restantes.ToString <> 'NULL' then begin
          dmSecDados.zlicencastable.FieldByName('dataavencer').AsString :=  Variaveis.Data_Vencimento
         end else if Variaveis.Dias_Restantes.ToString = '' then begin
          dmSecDados.zlicencastable.FieldByName('dataavencer').AsString :=  Variaveis.Data_Vencimento;
         end;

       //   ShowMessage('N�o tem registro, vou postar: '+Variaveis.resturlcomporta);
          dmSecDados.zlicencastable.Post;
          dmSecDados.zlicencastable.ApplyUpdates;
          dmSecDados.zlicencastable.CommitUpdates;

  end;

    end





end;


procedure TLockApplication.ConectaBD;
begin

   if dmSecDados.zlicencas.Connected then begin
     dmSecDados.zlicencastable.Active := true
   end else if not dmSecDados.zlicencas.Connected then begin
     dmSecDados.zlicencas.Connected := true;
     dmSecDados.zlicencastable.Active := true;
   end;

     dmSecDados.zlicencastable.Close;
     dmSecDados.zlicencastable.SQL.Clear;
     dmSecDados.zlicencastable.SQL.Add('select * from licencas where (licencas.idsistema = '+QuotedStr(InttoStr(Variaveis.ID_Sistema))+') and ');
     dmSecDados.zlicencastable.SQL.Add('(licencas.idinstalacao = '+QuotedStr(InttoStr(Variaveis.ID_Instalacao))+')');
     dmSecDados.zlicencastable.Open;

     // Checa se voltou algum registro associado ao sistema em uso
     if dmSecDados.zlicencastable.RecordCount > 0 then begin
         dmSecDados.zlicencastable.Edit;
         dmSecDados.zlicencastable.FieldByName('idsistema').AsString :=  inttostr(Variaveis.ID_Sistema);
         dmSecDados.zlicencastable.FieldByName('idinstalacao').AsString :=  InttoStr(Variaveis.ID_Instalacao);
         dmSecDados.zlicencastable.FieldByName('datainstalacao').AsDateTime := now;
         dmSecDados.zlicencastable.FieldByName('ultimasincronizacao').AsDateTime := now;
         dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger := StrToInt(Variaveis.SISTEMA_DEMO.ToString);;
         dmSecDados.zlicencastable.FieldByName('chave').AsString :=  Chave_RegistradaU;
         dmSecDados.zlicencastable.FieldByName('versao').AsString :=  inttostr(Versao_trialV); // Vers�o_Trial
         dmSecDados.zlicencastable.Post;
     end;
     if dmSecDados.zlicencastable.RecordCount <= 0 then begin
         dmSecDados.zlicencastable.Insert;
         dmSecDados.zlicencastable.FieldByName('idsistema').AsString :=  inttostr(Variaveis.ID_Sistema);
         dmSecDados.zlicencastable.FieldByName('idinstalacao').AsString :=  InttoStr(Variaveis.ID_Instalacao);
         dmSecDados.zlicencastable.FieldByName('datainstalacao').AsDateTime := now;
         dmSecDados.zlicencastable.FieldByName('ultimasincronizacao').AsDateTime := now;
         dmSecDados.zlicencastable.FieldByName('estadolicenca').AsInteger :=  StrToInt(Variaveis.SISTEMA_DEMO.ToString);
         dmSecDados.zlicencastable.FieldByName('chave').AsString := Chave_RegistradaU;
         dmSecDados.zlicencastable.FieldByName('versao').AsString :=  inttostr(Versao_trialV); // Vers�o_Trial
         dmSecDados.zlicencastable.Post;
     end;

end;

procedure TlockApplication.renovar;
begin
   Controle.Relogio.Enabled := False;
   registrar( true );
   Controle.Relogio.Enabled := True;
end;

procedure TLockApplication.Nunca_Registrado();
label InicioTrue, Sem_Mostrar_Tela;
var
   Retorno_Processa: TStrings;
   erro_processa: Boolean;
   ChaveTemp : Int64;
   Conta_dias: double;
begin
   Retorno_Processa := TStringList.Create;



   case Variaveis.Mostrar_Tela of
       False:begin
                variaveis.CHAVE_TELA := 'DEMONSTRA��O';
                variaveis.EMAIL_TELA := 'N�O INFORMADO';
                goto Sem_Mostrar_Tela;
             end;
       True: begin
                Bloqueio := TBloqueio.Create( nil );
                if Variaveis.Trial then
                   Bloqueio.TELA_ContraChave := 'DEMONSTRA��O';
                Bloqueio.Ativar := False;
                Variaveis.Ja_Foi_Trial := False;
                InicioTrue: Bloqueio.ShowModal;// INICIO CASO SEM SUCESSO NO REGISTRO
                if not Bloqueio.Fechado_Sem_Registro then
                   begin
                      variaveis.CHAVE_TELA := Bloqueio.TELA_ContraChave;
                      variaveis.EMAIL_TELA := Bloqueio.TELA_Email;
                      Sem_Mostrar_Tela: if (variaveis.CHAVE_TELA = 'DEMONSTRA��O') and not (variaveis.Trial) then
                         begin
                            MessageDlg( 'Sistema n�o liberado para demonstra��o', mtWarning, [mbOK], 0 );
                            goto inicioTrue;
                         end;

                         if not ( Variaveis.CHAVE_TELA = 'DEMONSTRA��O') then
                            begin   // INICIO CHAVE NORMAL

                               try       // MOMENTO DE PROCESSAMENTO DA CHAVE;
                                   erro_Processa := False;
                                   func.Processa_Chave( Variaveis.CHAVE_TELA, Retorno_Processa );
                                   if not ( pos( 'CHAVE_INVALIDA', Retorno_Processa[0] ) > 0 ) then // VER SE CHAVE � VALIDA
                                      begin
                                         variaveis.DIAS_SEPARADO := StrToInt64( Retorno_Processa[0] );
                                         Variaveis.CHAVE_SEPARADA := StrToInt64( Retorno_processa[1] );
                                         Variaveis.DATA_SEPARADA :=  Retorno_processa[2];
                                         StrToDate( Variaveis.DATA_SEPARADA );
                                         Versao_do_Sistema := StrToint( Retorno_Processa[3] ) - Variaveis.ID_Sistema;
                                      end
                                   else   // CHAVE INV�LIDA
                                      erro_processa := true;
                               except
                                  erro_processa := True;
                               end;      // FIM PROCESSAMENTO DA CHAVE;

                               if Erro_Processa then   // SE OUVER ERRO NA CHAVE VOLTA PARA A TELA
                                  begin
                                      MessageDlg( 'Chave informada � inv�lida!' + #13 +
                                      'Entre em contato com o administrador do sistema', mtError, [mbok],0);
                                      goto InicioTrue;
                                  end;

                               ChaveTemp := Func.FGerar_Chave( Variaveis.ID_Instalacao,
                               Variaveis.ID_Sistema, StrToDate( Variaveis.DATA_SEPARADA ) );
                               if not (Chavetemp = Variaveis.CHAVE_SEPARADA )then
                                  begin                                      // CHAVE N�O CORRETA
                                      MessageDlg( 'Chave informada � inv�lida!' + #13 +
                                      'Entre em contato com o administrador do sistema', mtError, [mbok],0);
                                      goto InicioTrue;
                                  end;
                               Func.Criar_Chave;
                               if Func.ver_chave_lista( Variaveis.CHAVE_TELA ) then
                                   begin
                                      MessageDlg( 'Chave j� utilizada antes!', mtError, [mbok],0);
                                      goto InicioTrue;
                                   end;
                               Func.Gravar_Valor( 'CHAVE', Variaveis.CHAVE_TELA );
                               Func.Gravar_Valor('QuantRegistros', IntTostr(Variaveis.QuantRegistros));
                               if Variaveis.DIAS_SEPARADO = 0 then
                                  begin
                                     Variaveis.Dias_Restantes := -1;
                                     Variaveis.Data_Vencimento := '';
                                     Func.Gravar_Valor( 'DATA_VENCIMENTO', '');
                                     Func.Gravar_Valor( 'EMAIL', variaveis.EMAIL_TELA );
                                     Func.Gravar_Valor('QuantRegistros', IntToStr(Variaveis.QuantRegistros));
                                     MessageDlg( 'Licen�a sem prazo de expira��o!', mtInformation, [mbok],0);
                                  end
                               else
                                  begin
                                     Conta_dias := Variaveis.DIAS_SEPARADO - ( date - StrtoDate( variaveis.DATA_SEPARADA) );
                                     Variaveis.Dias_Restantes := StrToInt64(FloatToStr( Conta_Dias));
                                     Variaveis.Data_Vencimento := DateToStr( date + Variaveis.Dias_Restantes );
                                     Func.Gravar_Valor( 'DATA_VENCIMENTO', variaveis.Data_Vencimento );
                                     Func.Gravar_Valor( 'EMAIL', variaveis.EMAIL_TELA );
                                     Func.Gravar_Valor('QuantRegistros', IntToStr(Variaveis.QuantRegistros));
                                     MessageDlg( 'Licen�a para ' + IntToStr( Variaveis.Dias_Restantes ) + ' dia(s)!', mtInformation, [mbok],0);
                           //          Enviar_email;
                                  end;

                               Variaveis.Email_Cliente := func.Ler_Valor( 'EMAIL');
                               Variaveis.CHAVE_Registrada := func.Ler_Valor( 'CHAVE');
                               if Variaveis.CHAVE_Registrada = 'DEMONSTRA��O' then
                                  begin
                                   Variaveis.SISTEMA_DEMO := true;
                                   Versao_do_sistema := Versao_trialV;
                                  end
                               else
                                  Variaveis.SISTEMA_DEMO := false;

                              try
                              if Variaveis.VEnviar_Email then

                              if ( Variaveis.Dias_Restantes <= Variaveis.VDias_email ) and ( Variaveis.Dias_Restantes > -1 ) then
                                 begin
                                    if InternetCheckConnection('http://www.google.com.br/', 1, 0) then
                                    if Func.Ler_Valor( 'DATA_EMAIL' ) <> '' then
                                       begin
                                          if date > StrToDate( func.Ler_Valor( 'DATA_EMAIL' ) ) then
                                             begin
                                                Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Func.Gravar_Valor('QuantRegistros', IntToStr(Variaveis.QuantRegistros));
                                                Variaveis.VEmail_mensagen := Mensagen;
                                                enviar_email;

                                             end;
                                       end
                                    else
                                       begin
                                          Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                          Func.Gravar_Valor('QuantRegistros', InttoStr(Variaveis.QuantRegistros));
                                          Variaveis.VEmail_mensagen := Mensagen;
                                  //        enviar_email;
                                       end;
                                 end;
                              except
                                  Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                              end;
                               if Informacao_adc then
                               begin
                               cadastro := TCadastro.Create( nil );
                               Cadastro.Showmodal;
                               Func.Gravar_Valor( 'NOMECLIENTE', cadastro.Nome.Text );
                               Func.Gravar_Valor( 'CPF', cadastro.cpf.Text );
                               Func.Gravar_Valor( 'CEP', cadastro.cep.Text );
                               Func.Gravar_Valor( 'ENDERECO', cadastro.endereco.Text );
                               Func.Gravar_Valor( 'CIDADE', cadastro.cidade.Text );
                               Func.Gravar_Valor( 'ESTADO', cadastro.estado.Text );
                               Func.Gravar_Valor( 'TELEFONE', cadastro.telefone.Text );
                               Func.Gravar_Valor('QuantRegistros', IntTostr(Variaveis.QuantRegistros));
                               cadastro.Free;

                               end;
                               if informacao_adc then
                               ler_dados;
                               Func.Gravar_hora_data;
                               Func.Protec_Grava;
                               Func.Iniciar_Relogio;
                            //   enviar_email;

                           end     // FIM CHAVE NORMAL
                         else


                            begin    // INICIO CHAVE DEMO


                               Func.Criar_Chave;
                               if Func.ver_chave_lista( Variaveis.CHAVE_TELA ) then
                                   begin
                                      MessageDlg( 'Chave j� utilizada antes!', mtError, [mbok],0);
                                      goto InicioTrue;
                                   end;
                                     Func.Gravar_Valor( 'CHAVE', Variaveis.CHAVE_TELA );
                                     Variaveis.Dias_Restantes := Variaveis.Dias_Trial;
                                     Variaveis.Data_Vencimento := DateToStr( date + Variaveis.Dias_Restantes );
                                     Func.Gravar_Valor( 'DATA_VENCIMENTO', variaveis.Data_Vencimento );
                                     Func.Gravar_Valor( 'EMAIL', variaveis.EMAIL_TELA );
                                     Func.Gravar_Valor('QuantRegistros', IntToStr(Variaveis.QuantRegistros));
                                     MessageDlg( 'Demonstra��o de ' + IntToStr( Variaveis.Dias_Restantes ) + ' dia(s)!', mtInformation, [mbok],0);

                               Variaveis.Email_Cliente := func.Ler_Valor( 'EMAIL');
                               Variaveis.CHAVE_Registrada := func.Ler_Valor( 'CHAVE');
                               if Variaveis.CHAVE_Registrada = 'DEMONSTRA��O' then
                                  begin
                                  Variaveis.SISTEMA_DEMO := true;
                                  Versao_do_sistema := Versao_trialV;
                                  end
                               else
                                  Variaveis.SISTEMA_DEMO := false;

                              try
                              if Variaveis.VEnviar_Email then                              
                              if ( Variaveis.Dias_Restantes <= Variaveis.VDias_email ) and ( Variaveis.Dias_Restantes > -1 ) then
                                 begin
                                    if InternetCheckConnection('http://www.google.com.br/', 1, 0) then
                                    if Func.Ler_Valor( 'DATA_EMAIL' ) <> '' then
                                       begin
                                          if date > StrToDate( func.Ler_Valor( 'DATA_EMAIL' ) ) then
                                             begin
                                                Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Func.Gravar_Valor('QuantRegistros', IntToStr(Variaveis.QuantRegistros));
                                                Variaveis.VEmail_mensagen := Mensagen;
                                          //      enviar_email;
                                             end;
                                       end
                                    else
                                       begin
                                          Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Variaveis.VEmail_mensagen := Mensagen;
                                //          enviar_email;
                                       end;
                                 end;
                              except
                                  Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                              end;
                              if Informacao_adc then
                               begin
                               cadastro := TCadastro.Create( nil );
                               Cadastro.Showmodal;
                               Func.Gravar_Valor( 'NOMECLIENTE', cadastro.Nome.Text );
                               Func.Gravar_Valor( 'CPF', cadastro.cpf.Text );
                               Func.Gravar_Valor( 'CEP', cadastro.cep.Text );
                               Func.Gravar_Valor( 'ENDERECO', cadastro.endereco.Text );
                               Func.Gravar_Valor( 'CIDADE', cadastro.cidade.Text );
                               Func.Gravar_Valor( 'ESTADO', cadastro.estado.Text );
                               Func.Gravar_Valor( 'TELEFONE', cadastro.telefone.Text );
                               cadastro.Free;
                               end;

                               if informacao_adc then
                                  ler_dados;
                               func.Gravar_hora_data;
                               Func.Protec_Grava;
                               func.Iniciar_Relogio;
                         //      enviar_email;

                            end;     // FIM CHAVE DEMO

                      Bloqueio.Free; // FINAL
                   end
                else
                   begin
                      Bloqueio.Free;

                      Func.fechar_sistema;
                   end;
             end;
   end;
   Enviar_email;

    Retorno_Processa.Free;
end;


procedure TLockApplication.Ja_Registrado();
label inicio, inicioTRIAL;
var
   CHAVE_RETIRADA: String;
   DATA_VENCIMENTO: String;
   Erro_Processa: Boolean;
   Retorno_Processa: TStrings;
   Chave_temp: Int64;
   Conta: Double;
begin
    Func.Protec;
    CHAVE_RETIRADA := Func.Ler_Valor( 'CHAVE' );

       // Thread respons�vel por fazer as checagens ao bd em tempo de execu��o
//   Monitor := TTask.Create ( procedure ()
//    begin
//        IntervaloCheca.Interval := Variaveis.IntervaloPing * 1000;
//        IntervaloCheca.Ontimer := IntervaloChecaTimer;
//        IntervaloCheca.Enabled := true;
//        ShowMessage('Criei  a thread');
//    end);
//   Monitor.start;

   if not ( CHAVE_RETIRADA = 'DEMONSTRA��O' )then

       inicio: begin       // INCIO CHAVE NORMAL
          CHAVE_RETIRADA := Func.Ler_Valor( 'CHAVE' );
          if CHAVE_RETIRADA = 'DEMONSTRA��O' then
             begin
             Variaveis.SISTEMA_DEMO := True;
             Versao_do_sistema := Versao_trialV;
             end
          else
             Variaveis.SISTEMA_DEMO := False;
          Variaveis.CHAVE_Registrada := CHAVE_RETIRADA;
          Data_Vencimento := Func.Ler_Valor( 'DATA_VENCIMENTO' );
          Variaveis.Data_Vencimento := Data_vencimento;
          Variaveis.Email_Cliente := Func.Ler_Valor( 'EMAIL');
          Variaveis.Ja_Foi_Trial := Func.ver_chave_lista( 'DESMOSTRA��O' );

          retorno_Processa := TStringList.Create;
          try       // MOMENDO DE PROCESSAMENTO DA CHAVE;
             erro_Processa := False;
             func.Processa_Chave( Chave_retirada, Retorno_Processa );
             if not ( pos( 'CHAVE_INVALIDA', Retorno_Processa[0] ) > 0 ) then // VER SE CHAVE � VALIDA
                begin
                   variaveis.DIAS_SEPARADO := StrToInt64( Retorno_Processa[0] );
                   Variaveis.CHAVE_SEPARADA := StrToInt64( Retorno_processa[1] );
                   Variaveis.DATA_SEPARADA :=  Retorno_processa[2];
                   StrTodate( Variaveis.DATA_SEPARADA );
                   Versao_do_Sistema := StrToint( Retorno_Processa[3] ) - Variaveis.ID_Sistema;
                end
             else   // CHAVE INV�LIDA
                erro_processa := true;
          except
             erro_processa := True;
          end;      // FIM PROCESSAMENTO DA CHAVE;

          if erro_processa then
             begin
                messagedlg( 'Licen�a registrada � inv�lida!', mtError, [mbOK], 0 );
                registrar( false );
                goto inicio;
             end;

          Chave_temp := Func.FGerar_Chave( Variaveis.ID_Instalacao,
          Variaveis.ID_Sistema, StrToDate( Variaveis.DATA_SEPARADA ) );

          if not (Variaveis.CHAVE_SEPARADA = Chave_temp) then
             begin
                messagedlg( 'Licen�a registra � inv�lida!', mtError, [mbOK], 0 );
                registrar( false );
                goto inicio;
             end;

          if Variaveis.Data_Vencimento = '' then
             begin   // CHAVE SEM PRAZO
                if Func.ver_chave_lista( Chave_Retirada ) then
                   begin
                      messagedlg( 'Licen�a registra j� utilizada!', mtError, [mbOK], 0 );
                      registrar( false );
                      goto inicio;
                   end;
                Variaveis.Dias_Restantes := -1;
                               if informacao_adc then
                                  ler_dados;
                Controle.Gravar_Dados( Application );
                Func.Protec_Grava;
                Func.Iniciar_Relogio;

             end     // FIM CHAVE SEM PRAZO
          else
             begin   /// VER DIAS RESTANTES;

                Conta := (StrToDate(Func.Ler_Valor( 'DATA_VENCIMENTO' )) - date);
                Variaveis.Dias_Restantes := StrToInt64(FloatToStr( Conta ));

                if Variaveis.Dias_Restantes <= 0 then
                   begin
                       if not Func.ver_chave_lista( chave_retirada ) then
                          Func.gravar_chave_lista( chave_retirada );

                      messagedlg( 'Licen�a expirou!' + #13 +
                      'Entre em contato com o administrador do sistema!', mtError, [mbOK], 0 );
                      registrar( false );
                      goto inicio;
                   end;
                if Func.ver_chave_lista( Chave_Retirada ) then
                   begin
                      messagedlg( 'Licen�a registra j� utilizada!', mtError, [mbOK], 0 );
                      registrar( false );
                      goto inicio;
                   end;

                              try
                              if Variaveis.VEnviar_Email then                              
                              if ( Variaveis.Dias_Restantes <= Variaveis.VDias_email ) and ( Variaveis.Dias_Restantes > -1 ) then
                                 begin
                                    if InternetCheckConnection('http://www.google.com.br/', 1, 0) then
                                    if Func.Ler_Valor( 'DATA_EMAIL' ) <> '' then
                                       begin
                                          if date > StrToDate( func.Ler_Valor( 'DATA_EMAIL' ) ) then
                                             begin
                                                Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Variaveis.VEmail_mensagen := Mensagen;
                                       //         enviar_email;
                                             end;
                                       end
                                    else
                                       begin
                                          Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Variaveis.VEmail_mensagen := Mensagen;
                                //         enviar_email;
                                       end;
                                 end;
                              except
                                  Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                              end;
                               if informacao_adc then
                                  ler_dados;
                Controle.Gravar_Dados( Application );
                Func.Protec_Grava;
                Func.Iniciar_Relogio;

             end;   // FIM VER DIAS

       end         // FIM CHAVE NORMAL

   else

       inicioTrial: begin      /// INICIO CHAVE DEMO

          CHAVE_RETIRADA := Func.Ler_Valor( 'CHAVE' );
          if CHAVE_RETIRADA = 'DEMONSTRA��O' then
             begin
             Variaveis.SISTEMA_DEMO := True;
             Versao_do_sistema := Versao_trialV;
             end
          else
             Variaveis.SISTEMA_DEMO := False;
          Variaveis.CHAVE_Registrada := CHAVE_RETIRADA;
          Data_Vencimento := Func.Ler_Valor( 'DATA_VENCIMENTO' );
          Variaveis.Data_Vencimento := Data_vencimento;
          Variaveis.Email_Cliente := Func.Ler_Valor( 'EMAIL');
          Variaveis.Ja_Foi_Trial := Func.ver_chave_lista( 'DESMOSTRA��O' );
                Conta := (StrToDate(Func.Ler_Valor( 'DATA_VENCIMENTO' )) - date);
                Variaveis.Dias_Restantes := StrToInt64(FloatToStr( Conta ));

                if Variaveis.Dias_Restantes <= 0 then
                   begin
                       if not Func.ver_chave_lista( chave_retirada ) then
                          Func.gravar_chave_lista( chave_retirada );

                      messagedlg( 'Prazo de demonstra��o expirou!' + #13 +
                      'Entre em contato com o administrador do sistema!', mtError, [mbOK], 0 );
                      registrar( false );
                      goto iniciotrial;
                   end;
                if Func.ver_chave_lista( Chave_Retirada ) then
                   begin
                      messagedlg( 'Licen�a registra j� utilizada!', mtError, [mbOK], 0 );
                      registrar( false );
                      goto iniciotrial;
                   end;

                              try
                                                            if Variaveis.VEnviar_Email then
                              if ( Variaveis.Dias_Restantes <= Variaveis.VDias_email ) and ( Variaveis.Dias_Restantes > -1 ) then
                                 begin
                                    if InternetCheckConnection('http://www.google.com.br/', 1, 0) then
                                    if Func.Ler_Valor( 'DATA_EMAIL' ) <> '' then
                                       begin
                                          if date > StrToDate( func.Ler_Valor( 'DATA_EMAIL' ) ) then
                                             begin
                                                Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Variaveis.VEmail_mensagen := Mensagen;
                                        //        enviar_email;
                                             end;
                                       end
                                    else
                                       begin
                                          Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                                                Variaveis.VEmail_mensagen := Mensagen;
                                    //      enviar_email;
                                       end;
                                 end;
                              except
                                  Func.Gravar_Valor( 'DATA_EMAIL', dateToStr( date ) );
                              end;
                               if informacao_adc then
                                  ler_dados;
                Controle.Gravar_Dados( Application );
                Func.Protec_Grava;
                Func.Iniciar_Relogio;


       end;       // FIM CHAVE DEMO
end;

procedure TLockApplication.registrar( ativar: boolean);
label InicioTrue;
var
   Erro_Processa, fechar: Boolean;
   Retorno_Processa: TStrings;
   ChaveTemp: int64;
   Conta_dias: double;
begin

                Retorno_Processa := TStringList.create;
                Bloqueio := TBloqueio.Create( nil );
                Bloqueio.TELA_Email := Func.Ler_Valor( 'EMAIL');
                Bloqueio.Ativar := ativar;
                InicioTrue: Bloqueio.ShowModal;// INICIO CASO SEM SUCESSO NO REGISTRO
                if not Bloqueio.Fechado_Sem_Registro then
                   begin
                      variaveis.CHAVE_TELA := Bloqueio.TELA_ContraChave;
                      variaveis.EMAIL_TELA := Bloqueio.TELA_Email;
                      if (variaveis.CHAVE_TELA = 'DEMONSTRA��O') then
                         begin
                            MessageDlg( 'Sistema n�o pode ser registrado como Demonstra��o', mtWarning, [mbOK], 0 );
                            goto inicioTrue;
                         end;

                            begin   // INICIO CHAVE NORMAL

                               try       // MOMENDO DE PROCESSAMENTO DA CHAVE;
                                   erro_Processa := False;
                                   func.Processa_Chave( Variaveis.CHAVE_TELA, Retorno_Processa );
                                   if not ( pos( 'CHAVE_INVALIDA', Retorno_Processa[0] ) > 0 ) then // VER SE CHAVE � VALIDA
                                      begin
                                         variaveis.DIAS_SEPARADO := StrToInt64( Retorno_Processa[0] );
                                         Variaveis.CHAVE_SEPARADA := StrToInt64( Retorno_processa[1] );
                                         Variaveis.DATA_SEPARADA :=  Retorno_processa[2];
                                         StrTodate( Variaveis.DATA_SEPARADA );
                                         Versao_do_Sistema := StrToint( Retorno_Processa[3] ) - Variaveis.ID_Sistema;
                                      end
                                   else   // CHAVE INV�LIDA
                                      erro_processa := true;
                               except
                                  erro_processa := True;
                               end;      // FIM PROCESSAMENTO DA CHAVE;

                               if Erro_Processa then   // SE OUVER ERRO NA CHAVE VOLTA PARA A TELA
                                  begin
                                      MessageDlg( 'Chave informada � inv�lida!' + #13 +
                                      'Entre em contato com o administrador do sistema', mtError, [mbok],0);
                                      goto InicioTrue;
                                  end;

                               ChaveTemp := Func.FGerar_Chave( Variaveis.ID_Instalacao,
                               Variaveis.ID_Sistema, StrToDate( Variaveis.DATA_SEPARADA ) );
                               if not (Chavetemp = Variaveis.CHAVE_SEPARADA )then
                                  begin                                      // CHAVE N�O CORRETA
                                      MessageDlg( 'Chave informada � inv�lida!' + #13 +
                                      'Entre em contato com o administrador do sistema', mtError, [mbok],0);
                                      goto InicioTrue;
                                  end;

                               Func.Criar_Chave;
                               if Func.ver_chave_lista( Variaveis.CHAVE_TELA ) or (  Variaveis.CHAVE_TELA = Func.Ler_Valor( 'CHAVE' ) )then
                                   begin
                                      MessageDlg( 'Chave j� utilizada antes!', mtError, [mbok],0);
                                      goto InicioTrue;
                                   end;
                               Func.gravar_chave_lista( Func.Ler_Valor( 'CHAVE' ));
                               Func.Gravar_Valor( 'CHAVE', Variaveis.CHAVE_TELA );
                               if Variaveis.DIAS_SEPARADO = 0 then
                                  begin
                                     Variaveis.Dias_Restantes := -1;
                                     Variaveis.Data_Vencimento := '';
                                     Func.Gravar_Valor( 'DATA_VENCIMENTO', '');
                                     Func.Gravar_Valor( 'EMAIL', variaveis.EMAIL_TELA );
                                     MessageDlg( 'Licen�a sem prazo de expira��o!', mtInformation, [mbok],0);
                                  end
                               else
                                  begin
                                     Conta_dias := Variaveis.DIAS_SEPARADO - ( date - StrtoDate( variaveis.DATA_SEPARADA) );
                                     Variaveis.Dias_Restantes := StrToInt64(FloatToStr( Conta_Dias));
                                     Variaveis.Data_Vencimento := DateToStr( date + Variaveis.Dias_Restantes );
                                     Func.Gravar_Valor( 'DATA_VENCIMENTO', variaveis.Data_Vencimento );
                                     Func.Gravar_Valor( 'EMAIL', variaveis.EMAIL_TELA );
                                     MessageDlg( 'Licen�a para ' + IntToStr( Variaveis.Dias_Restantes ) + ' dia(s)!', mtInformation, [mbok],0);
                                  end;

                               Variaveis.Email_Cliente := func.Ler_Valor( 'EMAIL');
                               Variaveis.CHAVE_Registrada := func.Ler_Valor( 'CHAVE');
                               if Variaveis.CHAVE_Registrada = 'DEMONSTRA��O' then
                                 begin
                                  Variaveis.SISTEMA_DEMO := true;
                                  versao_do_Sistema := Versao_trialV;
                                 end
                               else
                                  Variaveis.SISTEMA_DEMO := false;

                            end;     // FIM CHAVE NORMAL
                      Retorno_Processa.Free;
                      Bloqueio.Free; // FINAL
                   end
                else
                   begin
                      if ativar then
                         fechar := false
                      else
                         fechar := true;
                      Bloqueio.Free;
                      Retorno_processa.Free;
                      if fechar then
                         func.fechar_sistema;
                   end;
                   enviar_email;

end;

function TLockApplication.Gera_Chave_Data( ID_Instalacao, ID_Sistema: int64;
   data: String; Versao_Sistema: int64 ):String;
var
   RetornoHex, S, ver: String;
   I, V, DataNumeros: int64;
   Dias: Double;
begin
   try
   Dias := (StrToDate( Data ) - date);
   S := '9' + FloatToStr( Dias ) + '9';
   I := Func.FGerar_Chave( ID_Instalacao, ID_Sistema, date );
   V := StrToInt64( S );
   DataNumeros := Func.Processa_Data( formatDateTime( 'dd/mm/yy', date ) );
   ver := '9' + IntToStr( Versao_Sistema + ID_Sistema ) + '9';
   RetornoHex := IntToHex( V, 8 ) + '-' +IntToHex( I, 8 ) + '-' + IntToHex( DataNumeros, 8 ) +
   '-' + inttoHex( StrToInt64( ver ), 8 );
   Result := RetornoHex;
   except
      raise Exception.Create('Erro ao gerar a chave');
   end;
end;

function TLockApplication.Gera_Chave_Dias( ID_Instalacao, ID_Sistema,
   Dias, Versao_Sistema: int64 ):String;
var
   RetornoHex, S, ver: String;
   V, I, DataNumeros: int64;
begin
   try
   S := '9' + IntToStr( Dias ) + '9';
   I := Func.FGerar_Chave( ID_Instalacao, ID_Sistema, date );
   V := StrToInt64( S );
   DataNumeros := Func.Processa_Data( formatDateTime( 'dd/mm/yy', date ) );
   ver := '9' + IntToStr( Versao_Sistema + ID_Sistema ) + '9';
   RetornoHex := IntToHex( V, 8 ) + '-' + IntToHex( I, 8 )+ '-' + IntToHex( DataNumeros, 8 )+
   '-' + inttoHex( StrToInt64( ver ), 8 );
   Result := RetornoHex;
   except
      raise Exception.Create('Erro ao gerar a chave');
   end;
end;


/// ==============================Fun��es de variaveis   ==================


function TLockApplication.GetDias_restantes : int64;
begin
   Result := Variaveis.Dias_Restantes;
end;
function TLockApplication.GetData_vencimento: String;
begin
   Result := variaveis.Data_Vencimento;
end;
function TLockApplication.GetEmail_Cliente: String;
begin
   Result := variaveis.Email_Cliente;
end;
function TLockApplication.GetChave_registrada: String;
begin
   Result := Variaveis.CHAVE_Registrada;
end;

function TLockApplication.GetChecaRestServer: boolean;
begin
 Result := Variaveis.ChecaRestServer;
end;

function TLockApplication.Getdatabasebd: String;
begin
  result := Variaveis.databasebd;
end;

function TLockApplication.GetSistema_Demo: Boolean;
begin
   Result := Variaveis.SISTEMA_DEMO;
end;

function TLockApplication.GetTitulo_Janelas: String;
var
  S: String;
begin
   S := Variaveis.Titulo_Janelas;
   result := S;
end;
procedure TLockApplication.SetTitulo_Janelas( value: String );
begin
   if Value <> '' then
      Variaveis.Titulo_Janelas := value
   else
      raise Exception.Create('Valor null � inv�lido!');
end;

function TLockApplication.GetEmpresa_site: String;
var
  S: String;
begin
   S := Variaveis.Empresa_Site;
   result := S;
end;
procedure TLockApplication.SetEmpresa_site( value: String );
begin
   if value = '' then
      Variaveis.Empresa_Site := value
   else
   begin
//       if (pos( 'http://', value ) > 0) or (pos( 'https://', value ) > 0) then
          Variaveis.Empresa_Site := value
//       else
//          raise Exception.Create('Site inv�lido!' + #13 + 'Site deve ter "http://" ou "https://"' );
   end;
end;

function TLockApplication.GetEmpresa_telefones: String;
var
  S: String;
begin
   S := Variaveis.Empresa_Telefones;
   result := S;
end;


function TLockApplication.Gethostbd: String;
begin
  result := Variaveis.hostbd;
end;

procedure TLockApplication.SetEmpresa_telefones( value: String );
begin
  Variaveis.Empresa_Telefones := value;
end;

procedure TLockApplication.Sethostbd(value: String);
begin
  Variaveis.hostbd := value;
end;

function TLockApplication.GetEmpresa_email: String;
var
  S: String;
begin
   S := Variaveis.Empresa_Email;
   result := S;
end;
procedure TLockApplication.SetEmpresa_email( value: String );
begin
   if value = '' then
      Variaveis.Empresa_Email := value
   else
   begin
       if pos( '@', value ) > 0 then
          Variaveis.Empresa_Email := value
       else
          raise Exception.Create('E-Mail inv�lido!');
   end;
end;


function TLockApplication.GetChave_Crypt: String;
var
  S: String;
begin
   S := Variaveis.Chave_Crypt;
   Result := S;
end;

procedure TLockApplication.SetChave_Crypt( value: String );
begin
   if Value <> '' then
      Variaveis.Chave_Crypt := value
   else
      raise Exception.Create('Chave_Criptografia n�o pode ser null');
end;

procedure TLockApplication.SetChecaRestServer(value: boolean);
begin
 Variaveis.ChecaRestServer := value;
end;

procedure TLockApplication.Setdatabasebd(value: String);
begin
  Variaveis.databasebd := value;
end;

function TLockApplication.GetIDInstalacao: int64;
var
   Value: int64;
begin
   Value := Variaveis.ID_Instalacao;
   Result := Value;
end;

function TLockApplication.GetLocal_Registro: String;
begin
   result := Variaveis.Local_Registro;
end;


procedure TLockApplication.SetLocal_Registro( value: String );
begin
   if value = '' then
      raise Exception.Create('Local_Registro n�o pode ser null')
   else
      Variaveis.Local_Registro := value;
end;

function TLockApplication.GetTrial: Boolean;
begin
  result := Variaveis.Trial;
end;

function TLockApplication.Getusuariobd: String;
begin
  result := Variaveis.usuariobd;
end;

procedure TLockApplication.SetTrial( value: Boolean );
begin
  Variaveis.Trial := value;
end;

procedure TLockApplication.Setusuariobd(value: String);
begin
  Variaveis.usuariobd := value;
end;

function TLockApplication.GetMostrar_Tela: Boolean;
begin
   result := Variaveis.Mostrar_Tela;
end;

function TLockApplication.Getpassword: String;
begin
   result := Variaveis.password;
end;

function TLockApplication.Getportabd: integer;
begin
  result := Variaveis.portabd;
end;

function TLockApplication.GetQuantRegistros: integer;
begin
 result := Variaveis.QuantRegistros;
end;

function TLockApplication.Getresturlcomporta: string;
begin
 result := Variaveis.resturlcomporta;
end;

procedure TLockApplication.SetMostrar_Tela( value: Boolean );
begin
   Variaveis.Mostrar_Tela := value;
end;


procedure TLockApplication.Setpassword(value: String);
begin
 Variaveis.password := value;
end;

procedure TLockApplication.Setportabd(value: integer);
begin
  Variaveis.portabd := value;
end;

procedure TLockApplication.SetQuantRegistros(value: integer);
begin
  Variaveis.QuantRegistros := value;
end;

procedure TLockApplication.Setresturlcomporta(value: string);
begin
  Variaveis.resturlcomporta := value;
end;

function TLockApplication.GetDias_Trial: int64;
begin
   result := Variaveis.Dias_Trial;
end;
procedure TLockApplication.SetDias_Trial( value: int64 );
begin
   if value < 1 then
      begin
         raise Exception.Create('Dias_Trial deve ser maior que 0!');
      end
   else
      Variaveis.Dias_Trial := value;
end;

function TLockApplication.GetID_Sistema: int64;
begin
   result := Variaveis.ID_Sistema;
end;

function TLockApplication.GetIntervaloPing: integer;
begin
  result := Variaveis.IntervaloPing;
end;

procedure TLockApplication.SetID_Sistema( value: int64 );
begin
   if value < 1 then
      begin
         raise Exception.Create('IDSistema n�o pode ser menor que 1!');
      end
   else
      Variaveis.ID_Sistema := Value;
end;



procedure TLockApplication.SetIntervaloPing(value: integer);
begin
   if value = 0 then
      raise Exception.Create('Intervalo de ping n�o pode ser 0 ou vazio!')
   else
      Variaveis.IntervaloPing := value;
end;

//    VARIAVEIS DE EMAIL
{      VAut_SSL: Boolean;
       VServidor_SMTP: String;
       VUsuario_SMTP: String;
       VSenha_SMTP: String;
       VPorta_SMTP: integer;
       VEmail_Remetente: String;
       VEmail_destino: String;
       VEmail_assunto: String;
       VEmail_mensagen: TStrings;
       VDias_email: integer;
       VEnviar_Email: Boolean;}

function TLockApplication.GetVAut_SSL: Boolean;
begin
   Result := Variaveis.VAut_SSL;
end;
procedure TLockApplication.SetVAut_SSL( value: Boolean );
begin
   Variaveis.VAut_SSL := value;
end;

function TLockApplication.GetVEnviar_email: Boolean;
begin
   Result := Variaveis.VEnviar_Email;
end;
procedure TLockApplication.SetVEnviar_email( value: Boolean );
begin
   Variaveis.VEnviar_Email := value;
end;

function TLockApplication.GetVServidor_email: String;
begin
   result := Variaveis.VServidor_SMTP;
end;
procedure TLockApplication.SetVServidor_email( value: String );
begin
   Variaveis.VServidor_SMTP := value;
end;

function TLockApplication.GetVusuario_SMTP: String;
begin
   result := Variaveis.VUsuario_SMTP;
end;

procedure TLockApplication.SetVUsuario_SMTP( value: String );
begin
   Variaveis.VUsuario_SMTP := value;
end;

function TLockApplication.GetVSenha_SMTP: String;
begin
   result := Variaveis.VSenha_SMTP;
end;
procedure TLockApplication.SetVSenha_SMTP( value: String );
begin
   Variaveis.VSenha_SMTP := value;
end;

function TLockApplication.GetVEmail_remetente: String;
begin
   result := Variaveis.VEmail_Remetente;
end;
procedure TLockApplication.SetVEmail_remetente( value: String );
begin
   Variaveis.VEmail_Remetente := value;
end;

function TLockApplication.GetVPorta_SMTP: integer;
begin
   result := Variaveis.VPorta_SMTP;
end;
procedure TLockApplication.SetVPorta_SMTP( value: integer );
begin
   Variaveis.VPorta_SMTP := value;
end;

function TLockApplication.GetVEmail_destino: String;
begin
   result := Variaveis.VEmail_destino;
end;
procedure TLockApplication.SetVEmail_destino( value: String );
begin
   Variaveis.VEmail_destino := value;
end;

function TLockApplication.GetVEmail_assunto: String;
begin
   result := Variaveis.VEmail_assunto;
end;
procedure TLockApplication.SetVEmail_assunto( value: String );
begin
   Variaveis.VEmail_assunto := value;
end;

procedure TLockApplication.SetVEmail_mensagen( value: TStrings );
begin
   Variaveis.VEmail_mensagen.Clear;
   Variaveis.VEmail_mensagen.Assign( value );
   Mensagen.Clear;
   Mensagen.Assign( Value );
end;

function TLockApplication.GetVDias_email: integer;
begin
   result := Variaveis.VDias_email;
end;
procedure TLockApplication.SetVDias_email( value: integer );
begin
   Variaveis.VDias_email := value;
end;

procedure TLockApplication.ler_dados;
begin
    nomeclientev := func.Ler_Valor( 'NOMECLIENTE' );
    cpfclientev := func.Ler_Valor( 'CPF' );
    enderecov := func.Ler_Valor( 'ENDERECO' );
    cidadev := func.Ler_Valor( 'CIDADE' );
    telefonev := func.Ler_Valor( 'TELEFONE' );
    estadov := func.Ler_Valor( 'ESTADO' );
    cepv  := func.Ler_Valor('CEP');
    Variaveis.VNomeCliente :=   nomeclientev;
        Variaveis.VCPFCliente :=    cpfclientev;
       Variaveis.VCEPCliente :=   cepv;
       Variaveis.VEnderecoCliente := enderecov;


       Variaveis.VCidadeCliente :=   cidadev;
       Variaveis.VEstadoCliente := estadov;
       Variaveis.VTelefoneCliente :=   telefonev;




end;

procedure TLockApplication.Atualizar_Cadastro;
begin
   Cadastro := TCadastro.Create( nil );
   Cadastro.Nome.Text := nomeclientev;
   Cadastro.cpf.Text := cpfclientev;
   Cadastro.endereco.Text := enderecov;
   Cadastro.cidade.Text := cidadev;
   Cadastro.telefone.Text := telefonev;
   Cadastro.estado.Text := estadov;
   Cadastro.cep.text := cepv;

   Cadastro.Showmodal;
   Func.Gravar_Valor( 'NOMECLIENTE', cadastro.Nome.Text );
   Func.Gravar_Valor( 'CPF', cadastro.cpf.Text );
   Func.Gravar_Valor( 'ENDERECO', cadastro.endereco.Text );
   Func.Gravar_Valor( 'CIDADE', cadastro.cidade.Text );
   Func.Gravar_Valor( 'ESTADO', cadastro.estado.Text );
   Func.Gravar_Valor( 'TELEFONE', cadastro.telefone.Text );
   Func.Gravar_Valor( 'CEP', cadastro.cep.Text );

   cadastro.Free;
   ler_dados;
   Enviar_email;
end;

function TLockApplication.ProcessoRodando (sExeName: String) : Boolean;      // N�o precisa passar o caminho, s� o nome do exe
var
   hSnapShot : THandle;
   ProcessEntry32 : TProcessEntry32;
begin
    Result := false;

    hSnapShot := CreateToolhelp32Snapshot (TH32CS_SNAPPROCESS, 0);
    Win32Check (hSnapShot <> INVALID_HANDLE_VALUE);

    sExeName := LowerCase (sExeName);

    FillChar (ProcessEntry32, SizeOf (TProcessEntry32), #0);
    ProcessEntry32.dwSize := SizeOf (TProcessEntry32);

    if (Process32First (hSnapShot, ProcessEntry32)) then
        repeat
            if (Pos (sExeName,
                     LowerCase (ProcessEntry32.szExeFile)) = 1) then
            begin
                Result := true;
                Break;
            end; { if }
        until (Process32Next (hSnapShot, ProcessEntry32) = false);

    CloseHandle (hSnapShot);
end; { ProcessRunning }


function TLockApplication.ExecutaNormal (sExeName, sCaminho: String) : Boolean;       // nome do executavel e o caminho dele separadamente
var
   hSnapShot : THandle;
   ProcessEntry32 : TProcessEntry32;
   Handle: THandle;
   Programa : PWideChar;
begin
  Programa :=  pchar(sCaminho + sExename);
  ShellExecute(Handle, 'open',
  Programa, nil, nil, SW_SHOWNORMAL) ;
end;


function TLockApplication.ExecutaeAguarda(const strCommandLine : String; intVisibility: Integer = SW_SHOW) : Cardinal;   // Executavel com o caminho completo
var
  StartupInfo : TStartupInfo;
  ProcessInformation : TProcessInformation;
  intWaitState : DWORD;
begin
  Result := 0;
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.wShowWindow := intVisibility;

  if (CreateProcess(nil, PChar(strCommandLine), nil, nil, False, 0, nil, nil, StartupInfo, ProcessInformation)) then
  begin
    intWaitState := WaitForSingleObject(ProcessInformation.hProcess, INFINITE);

    if (intWaitState = WAIT_OBJECT_0) then
      if (GetExitCodeProcess(ProcessInformation.hProcess, intWaitState)) then
        Result := intWaitState;

    CloseHandle(ProcessInformation.hProcess);
    CloseHandle(ProcessInformation.hThread);
  end;
end;

function TLockApplication.ChecaServidorRest(servidorexe: string):boolean;
begin
 if not ProcessoRodando(servidorexe) then begin
   ExecutaNormal(servidorexe, ExtractFilePath(Application.ExeName));
    Sleep(2090);
{  if application.messagebox('Servi�o de licen�a n�o est� em execu��o. Tentaremos iniciar autom�ticamente, ok?',
    'Confirmar', mb_yesno + mb_iconquestion) = 6 Then
  begin
     ExecutaNormal(servidorexe, ExtractFilePath(Application.ExeName));
     Sleep(9090);
  end
  else
  begin
    ShowMessage('A aplica��o s� pode ser iniciada caso o servi�o de licen�as esteja em execu��o.');
    Application.Terminate;
  end;   }
end;
end;

function TLockApplication.PingaRest(servidor: string):string;
var
    json, super : string;
    jsonObj: TJsonObject;
    jsonValue : TJSONValue;
    Resposta: IResponse;

    jarray : TJSONArray;

    LJsonValue : TJSONValue;
    LItem     : TJSONValue;

begin
     dmSecDados.RESTClient1.BaseURL := servidor;
     resposta := TRequest.New.BaseURL(dmSecDados.RESTClient1.BaseURL+'/ping')
    .Accept('application/json')
    .DataSetAdapter(dmSecDados.tblretorno)
    .Get;


    if Resposta.StatusCode <> 200 then
    begin
        result := Resposta.Content;
    end
    else
    begin
     if Resposta.StatusCode <> 200 then begin
        result := resposta.content;
     end;
    end;


end;

function TLockApplication.RetornaPingaRest(servidor: string):boolean;
begin

end;



procedure Register;
begin
  RegisterComponents('Softarena', [TLockApplication]);
end;

end.
