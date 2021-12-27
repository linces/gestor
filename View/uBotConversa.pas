unit uBotConversa;

interface

uses
  System.Classes, Vcl.ExtCtrls, uTInject;

type
  TTipoUsuario = (tpCliente, tpAdm);
  TSituacaoConversa = (saIndefinido,
                      saNova,
                      saEmAtendimento,
                      saEmEspera,
                      saInativa,
                      saFinalizada);

  TBotConversa = class;
  TNotifyConversa = procedure(Conversa: TBotConversa) of object;

  TBotConversa = class(TComponent)
  private
    //Enumerado
    FTipoUsuario: TTipoUsuario;
    FSituacao: TSituacaoConversa;
    //Propriedades
    FID: String;
    FTelefone: String;
    FIDMensagem: Extended;
    FNome: String;
    FEtapa: Integer;
    FPergunta: String;
    FResposta: String;
    FLat     : Extended;
    FLng     : Extended;
    FTempoInatividade: Integer;
    //Objeto
    FTimerSleep: TTimer;

    //Notifys Eventos
    FOnSituacaoAlterada: TNotifyConversa;
    FOnRespostaRecebida: TNotifyConversa;
	
	  //curso -->
    FItensPizza       : TStringList;
    FIDPedido         : integer;
    FEnderecoCliente  : string;
    FTipo             : string;
    FFormaPGT         : string;
    FIDInc            : integer;
    FMaiorValor       : currency;
    FPrimeiroSabor    : string;
    //<--
	
    procedure TimerSleepExecute(Sender: TObject);

    procedure SetSituacao(const Value: TSituacaoConversa);
    procedure SetTempoInatividade(const Value: Integer);
  public
    //Construtores destrutores
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property TipoUsuario: TTipoUsuario read FTipoUsuario write FTipoUsuario default tpCliente;
    property Situacao: TSituacaoConversa read FSituacao write SetSituacao default saIndefinido;
    property ID: String read FID write FID;
    property Telefone: String read FTelefone write FTelefone;
    property IDMensagem: Extended read FIDMensagem write FIDMensagem;
    property Nome: String read FNome write FNome;
    property Etapa: Integer read FEtapa write FEtapa default 0;
    property Pergunta: String read FPergunta write FPergunta;
    property Resposta: String read FResposta write FResposta;

    property Lat: Extended read FLat write FLat;
    property Lng: Extended read FLng write FLng;
	
	  //curso -->
	  property Items            : TStringList read FItensPizza      write FItensPizza;
    property IDPedido         : integer     read FIDPedido        write FIDPedido;
    property EnderecoCliente  : string      read FEnderecoCliente write FEnderecoCliente;
    property Tipo             : string      read FTipo            write FTipo;
    property FormaPGT         : string      read FFormaPGT        write FFormaPGT;
    property IDInc            : integer     read FIDInc           write FIDInc;
    property MaiorValor       : currency    read FMaiorValor      write FMaiorValor;
    property PrimeiroSabor    : string      read FPrimeiroSabor   write FPrimeiroSabor;
    //<--

    property TempoInatividade: Integer read FTempoInatividade write SetTempoInatividade;

    property OnSituacaoAlterada: TNotifyConversa read FOnSituacaoAlterada write FOnSituacaoAlterada;
    property OnRespostaRecebida: TNotifyConversa read FOnRespostaRecebida write FOnRespostaRecebida;

    procedure ReiniciarTimer;
  end;

implementation

uses
  System.SysUtils;

{ TBotConversa }

constructor TBotConversa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  //Prepara Timer
  FTimerSleep := TTimer.Create(Self);
  with FTimerSleep do
  begin
    Enabled  := False;
    Interval := TempoInatividade;
    OnTimer  := TimerSleepExecute;
  end;
end;

destructor TBotConversa.Destroy;
begin
  FTimerSleep.Free;
  inherited Destroy;
end;

procedure TBotConversa.SetSituacao(const Value: TSituacaoConversa);
begin
  //DoChange
  if FSituacao <> Value then
  begin
    FSituacao := Value;

    //Habilita Time se situacao ativa.
    FTimerSleep.Enabled := FSituacao = saEmAtendimento;

    if Assigned( OnSituacaoAlterada ) then
       OnSituacaoAlterada(Self);
  end;
end;

procedure TBotConversa.SetTempoInatividade(const Value: Integer);
begin
  FTempoInatividade := Value;
  FTimerSleep.Interval := FTempoInatividade;
end;

procedure TBotConversa.TimerSleepExecute(Sender: TObject);
begin
  Self.Situacao := saInativa;
end;

procedure TBotConversa.ReiniciarTimer;
begin
  //Se estiver em atendimento reinicia o timer de inatividade
  if Situacao in [saNova, saEmAtendimento] then
  begin
    FTimerSleep.Enabled := False;
    FTimerSleep.Enabled := True;
  end;
end;

end.
