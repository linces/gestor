unit uBotGestor;

interface

uses
  System.Classes, Vcl.ExtCtrls, System.Generics.Collections,
  uBotConversa,
  uTInject,
  uTInject.classes;

type
  TBotManager = class(TComponent)
  private
    FSenhaADM: String;
    FSimultaneos: Integer;
    FTempoInatividade: Integer;
    FConversas: TObjectList<TBotConversa>;

    FOnInteracao: TNotifyConversa;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AdministrarChatList(AInject: TInject; AChats: TChatList);
    procedure ProcessarResposta(AMessagem: TMessagesClass);

    function BuscarConversa(AID: String): TBotConversa;
    function NovaConversa(AMessage: TMessagesClass): TBotConversa;
    function BuscarConversaEmEspera: TBotConversa;
    function AtenderProximoEmEspera: TBotConversa;

    property SenhaADM: String read FSenhaADM write FSenhaADM;
    property Simultaneos: Integer read FSimultaneos write FSimultaneos default 1;
    property Conversas: TObjectList<TBotConversa> read FConversas;
    property TempoInatividade: Integer read FTempoInatividade write FTempoInatividade;

    //Procedures notificadoras
    procedure ProcessarInteracao(Conversa: TBotConversa);
    procedure ConversaSituacaoAlterada(Conversa: TBotConversa);

    //Notify
    property OnInteracao: TNotifyConversa read FOnInteracao write FOnInteracao;
  end;

implementation

uses
  System.StrUtils, System.SysUtils;

{ TBotManager }

constructor TBotManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConversas := TObjectList<TBotConversa>.Create;
end;

destructor TBotManager.Destroy;
begin
  FreeAndNil(FConversas);
  inherited Destroy;
end;

procedure TBotManager.AdministrarChatList(AInject: TInject; AChats: TChatList);
var
  AChat   : TChatClass;
  AMessage: TMessagesClass;
begin
  //Loop em todos os chats
  for AChat in AChats.result do
  begin
    //Não considerar chats de grupos
    if not AChat.isGroup then
    begin
      //Define que a mensagem ja foi lida,
      //para evitar recarrega-la novamente.
      AInject.ReadMessages( AChat.id );

      //Pode haver mais de uma mensagem, pego a ultima
      AMessage := AChat.messages[ Low( AChat.messages ) ];

      //Não considerar mensagens enviadas por mim
      if not AMessage.sender.isMe then
      begin
        //Carregar Conversa e passar a mensagem
        ProcessarResposta( AMessage );
      end;
      end;
    end;
end;

procedure TBotManager.ProcessarResposta(AMessagem: TMessagesClass);
var
  AConversa: TBotConversa;
begin
  AConversa := BuscarConversa( AMessagem.sender.id );
  if not Assigned(AConversa) then
     AConversa := NovaConversa( AMessagem );

  //Tratando a situacao em que vem a mesma mensagem.
  if AConversa.IDMensagem <> AMessagem.T then
  begin
    AConversa.IDMensagem := AMessagem.t;
    AConversa.Resposta   := AMessagem.body;

    //Tratando a situacao em que vem a localizacao.
    if (AMessagem.lat <> 0) and (AMessagem.lng <> 0) then
    begin
      AConversa.Lat        := AMessagem.lat;
      AConversa.Lng        := AMessagem.lng;
    end;

    //Houve interacao, reinicia o timer de inatividade da conversa;
    AConversa.ReiniciarTimer;

    //Notifica mensagem recebida
    ProcessarInteracao( AConversa );
  end;
end;

function TBotManager.BuscarConversa(AID: String): TBotConversa;
var
  AConversa: TBotConversa;
begin
  Result := nil;
  for AConversa in FConversas do
  begin
    if AConversa.ID = AID then
    begin
      Result := AConversa;
      Break;
    end;
  end;
end;

function TBotManager.NovaConversa(AMessage: TMessagesClass): TBotConversa;
var
  ADisponivel: Boolean;
begin
  ADisponivel := (Conversas.Count < Simultaneos);

  Result := TBotConversa.Create(Self);
  with Result do
  begin

    case AMessage.body = SenhaADM of
      False : TipoUsuario := tpCliente;
      True  : TipoUsuario := tpAdm;
    end;

    TempoInatividade := Self.TempoInatividade;
    ID           := AMessage.Sender.id;
    Telefone     := Copy(AMessage.sender.id,1,Pos('@',AMessage.sender.id)-1);

    //Capturar nome publico, ou formatado (numero/nome).
    Nome         := IfThen(AMessage.sender.PushName <> EmptyStr
                          ,AMessage.sender.PushName
                          ,AMessage.sender.FormattedName);

    //Eventos para controle externos
    OnSituacaoAlterada := ConversaSituacaoAlterada;
    OnRespostaRecebida := ProcessarInteracao;
  end;
  FConversas.Add( Result );

  //Validando a disponibilidade ou tipo adm
  if (ADisponivel) or (Result.TipoUsuario = tpAdm)
  then Result.Situacao := saNova
  else Result.Situacao := saEmEspera;
end;

function TBotManager.BuscarConversaEmEspera: TBotConversa;
var
  AConversa: TBotConversa;
begin
  Result := nil;
  for AConversa in FConversas do
  begin
    if AConversa.Situacao = saEmEspera then
    begin
      Result := AConversa;
      Break;
    end;
  end;
end;

function TBotManager.AtenderProximoEmEspera: TBotConversa;
var
  AConversa: TBotConversa;
begin
  Result := BuscarConversaEmEspera;

  if Assigned( Result ) then
  begin
    Result.Situacao := saNova;
    Result.ReiniciarTimer;

    ProcessarInteracao(Result);
  end;
end;

procedure TBotManager.ProcessarInteracao(Conversa: TBotConversa);
begin
  if Assigned( OnInteracao ) then
     OnInteracao( Conversa );
end;

procedure TBotManager.ConversaSituacaoAlterada(Conversa: TBotConversa);
begin
  //Se ficou inativo
  if Conversa.Situacao in [saInativa, saFinalizada] then
  begin
    //Encaminha
    OnInteracao(Conversa);

    //Destroy
    Conversas.Remove( Conversa );

    //Atende proximo da fila
    AtenderProximoEmEspera;
  end;
end;


end.
