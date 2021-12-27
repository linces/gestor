unit FDZabuuReplicator;

interface

uses System.Classes, System.SysUtils, Replicador.Controller.Interfaces,
  Replicador.Controller.Factory, Replicador.Controller.Tipificacoes,
  Replicador.View.Intefaces, System.SyncObjs;

type
  TFDZabuuReplicator = class(TComponent)
  private
    FPath: String;
    FTypeDB: String;
    FPassword: String;
    FHost: String;
    FUser: String;
    FLog: TEvLog;
    FMasterKey: String;
    FApplicationName: String;
    FLimit: Integer;
    FFactor: Integer;
    FRoleName: String;
    FPort: String;
    FSequencer: Boolean;
    FChart : TChartValue;
    FInjectBankID: Boolean;
    FDBVersion: String;
    FVendorLib: String;
    procedure SetHost(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetPath(const Value: String);
    procedure SetTypeDB(const Value: String);
    procedure SetUser(const Value: String);
    procedure SetLog(const Value: TEvLog);
    procedure SetApplicationName(const Value: String);
    procedure SetMasterKey(const Value: String);
    procedure SetLimit(const Value: Integer);
    procedure SetFactor(const Value: Integer);
    procedure SetRoleName(const Value: String);
    procedure SetPort(const Value: String);
    procedure SetSequencer(const Value: Boolean);
    procedure SetInjectBankID(const Value: Boolean);
    procedure SetDBVersion(const Value: String);
    procedure SetVendorLib(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Replicate;
    procedure ApplyMetadata;
    procedure ApplyMetadataBankReplicator;
    procedure ApplyMetadataMultiBranch;
    procedure removeReplicationStructure;
    procedure BackupFull(IdBancoOrigem : Integer);
    procedure BackupTable(Table : String; IdBancoOrigem : Integer);
    procedure Chart(Value : TChartValue);
    procedure ClearReplicateBank;
  published
    property Host: String read FHost write SetHost;
    property Path: String read FPath write SetPath;
    property User: String read FUser write SetUser;
    property Password: String read FPassword write SetPassword;
    property TypeDB: String read FTypeDB write SetTypeDB;
    property Log : TEvLog read FLog write SetLog;
    property ApplicationName: String read FApplicationName write SetApplicationName;
    property MasterKey: String read FMasterKey write SetMasterKey;
    property Limit : Integer read FLimit write SetLimit;
    property Factor : Integer read FFactor write SetFactor;
    property RoleName : String read FRoleName write SetRoleName;
    property Port : String read FPort write SetPort;
    property Sequencer : Boolean read FSequencer write SetSequencer;
    property InjectBankID : Boolean read FInjectBankID write SetInjectBankID;
    property DBVersion : String read FDBVersion write SetDBVersion;
    property VendorLib : String read FVendorLib write SetVendorLib;
  end;

procedure memoryFree;

implementation

uses
  Winapi.Windows, System.Threading, Replicador.Controller.ThreadSafe;

{ TFDZabuuReplicator }

procedure TFDZabuuReplicator.ApplyMetadata;
var
  ControllerMetadata: IControllerMetadata;
begin
   TThread.Queue(nil,
    procedure
    begin
      TThread.CreateAnonymousThread(
      procedure
      begin
        ControllerMetadata := TControllerFactory.New.Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
        ControllerMetadata.Log := Log;
        ControllerMetadata.InjectBankId(FInjectBankID);
        ControllerMetadata.createReplicationStructure(ApplicationName, MasterKey);
        memoryFree;
      end).Start;
    end
   );

end;

procedure TFDZabuuReplicator.ApplyMetadataBankReplicator;
var
  ControllerMetadata: IControllerMetadata;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerMetadata := TControllerFactory.New.Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerMetadata.Log := Log;
    ControllerMetadata.InjectBankId(FInjectBankID);
    ControllerMetadata.createReplicationBank(MasterKey);
    memoryFree;
  end).Start;
end;

procedure TFDZabuuReplicator.ApplyMetadataMultiBranch;
var
  ControllerMetadata: IControllerMetadata;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerMetadata := TControllerFactory.New.Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerMetadata.Log := Log;
    ControllerMetadata.InjectBankId(FInjectBankID);
    ControllerMetadata.createReplicationBranch(ApplicationName, MasterKey, Factor);
    memoryFree;
  end).Start;
end;

procedure TFDZabuuReplicator.BackupFull(IdBancoOrigem : Integer);
var
  ControllerReplicator: IControllerReplicator;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerReplicator := TControllerFactory.New.Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerReplicator.ChartValue(FChart);
    ControllerReplicator.Log := Log;
    ControllerReplicator.InjectBankId(FInjectBankID);
    ControllerReplicator.BackupFull(ApplicationName, IdBancoOrigem);
    memoryFree;
  end).Start;

end;

procedure TFDZabuuReplicator.BackupTable(Table: String; IdBancoOrigem: Integer);
var
  ControllerReplicator: IControllerReplicator;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerReplicator := TControllerFactory.New.Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerReplicator.ChartValue(FChart);
    ControllerReplicator.Log := Log;
    ControllerReplicator.InjectBankId(FInjectBankID);
    ControllerReplicator.BackupTable(ApplicationName, Table, IdBancoOrigem);
    memoryFree;
  end).Start;
end;

procedure TFDZabuuReplicator.Chart(Value: TChartValue);
begin
  FChart := Value;
end;

procedure TFDZabuuReplicator.ClearReplicateBank;
var
  ControllerReplicator: IControllerReplicator;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerReplicator := TControllerFactory.New.Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerReplicator.Log := Log;
    ControllerReplicator.InjectBankId(FInjectBankID);
    ControllerReplicator.ClearReplicateBank;
    memoryFree;
  end).Start;

end;

constructor TFDZabuuReplicator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TControllerThreadSafe.New.Release;
  FHost := 'localhost';
  FUser := 'SYSDBA';
  FPassword := 'masterkey';
  FTypeDB := 'FB';
  FLimit := 50;
  FFactor := 100;
  FPort := '3050';
end;

destructor TFDZabuuReplicator.Destroy;
begin
  inherited;
end;

procedure TFDZabuuReplicator.removeReplicationStructure;
var
  ControllerMetadata: IControllerMetadata;
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    ControllerMetadata := TControllerFactory.New.Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
    ControllerMetadata.Log := Log;
    ControllerMetadata.InjectBankId(FInjectBankID);
    ControllerMetadata.removeReplicationStructure;
    memoryFree;
  end).Start;
end;

procedure TFDZabuuReplicator.Replicate;
var
  ControllerReplicator: IControllerReplicator;
  a: Integer;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      ControllerReplicator := TControllerFactory.New.Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Host, Port, VendorLib);
      ControllerReplicator.ChartValue(FChart);
      ControllerReplicator.Log := Log;
      ControllerReplicator.InjectBankId(FInjectBankID);
      ControllerReplicator.Replicate(Limit, MasterKey, FSequencer);
      memoryFree;
    end
  ).Start;
end;

procedure TFDZabuuReplicator.SetApplicationName(const Value: String);
begin
  FApplicationName := Value;
end;

procedure TFDZabuuReplicator.SetDBVersion(const Value: String);
begin
  FDBVersion := Value;
end;

procedure TFDZabuuReplicator.SetFactor(const Value: Integer);
begin
  FFactor := Value;
end;

procedure TFDZabuuReplicator.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TFDZabuuReplicator.SetInjectBankID(const Value: Boolean);
begin
  FInjectBankID := Value;
end;

procedure TFDZabuuReplicator.SetLimit(const Value: Integer);
begin
  FLimit := Value;
end;

procedure TFDZabuuReplicator.SetLog(const Value: TEvLog);
begin
  FLog := Value;
end;

procedure TFDZabuuReplicator.SetMasterKey(const Value: String);
begin
  FMasterKey := Value;
end;

procedure TFDZabuuReplicator.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TFDZabuuReplicator.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TFDZabuuReplicator.SetPort(const Value: String);
begin
  FPort := Value;
end;

procedure TFDZabuuReplicator.SetRoleName(const Value: String);
begin
  FRoleName := Value;
end;

procedure TFDZabuuReplicator.SetSequencer(const Value: Boolean);
begin
  FSequencer := Value;
end;

procedure TFDZabuuReplicator.SetTypeDB(const Value: String);
begin
  FTypeDB := Value;
end;

procedure TFDZabuuReplicator.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TFDZabuuReplicator.SetVendorLib(const Value: String);
begin
  FVendorLib := Value;
end;

procedure memoryFree;
var
  MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
    //
  end;
end;

end.
