unit Replicador.View.Replicacao;

interface

uses
  System.Classes;

type
  TViewReplicacao = class(TComponent)
  private
    FPath: String;
    FTypeDB: String;
    FPassword: String;
    FHost: String;
    FUser: String;
    procedure SetHost(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetPath(const Value: String);
    procedure SetTypeDB(const Value: String);
    procedure SetUser(const Value: String);
  public
    constructor Create; virtual;
  published
    property Host: String read FHost write SetHost;
    property Path: String read FPath write SetPath;
    property User: String read FUser write SetUser;
    property Password: String read FPassword write SetPassword;
    property TypeDB: String read FTypeDB write SetTypeDB;
  end;

implementation

{ TViewReplicacao }

constructor TViewReplicacao.Create;
begin
  Host := 'localhost';
  User := 'SYSDBA';
  Password := 'masterkey';
  TypeDB := 'FB';
end;

procedure TViewReplicacao.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TViewReplicacao.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TViewReplicacao.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TViewReplicacao.SetTypeDB(const Value: String);
begin
  FTypeDB := Value;
end;

procedure TViewReplicacao.SetUser(const Value: String);
begin
  FUser := Value;
end;

end.
