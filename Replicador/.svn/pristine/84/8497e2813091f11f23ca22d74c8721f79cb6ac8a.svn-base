unit FBZabuuMetadata;

interface

uses
  System.Classes, FDZabuuReplicator, Replicador.Controller.Factory,
  Replicador.Controller.Interfaces, Replicador.Controller.Tipificacoes;

type
  TFBZabuuMetadata = class(TComponent)
  private
    FFBZabuuReplicator: TFDZabuuReplicator;
    FMasterKey: String;
    FApplicationName: String;
    FLog: TEvLog;
    procedure SetFBZabuuReplicator(const Value: TFDZabuuReplicator);
    procedure SetApplicationName(const Value: String);
    procedure SetMasterKey(const Value: String);
    procedure SetLog(const Value: TEvLog);
  public
    procedure ApplyMetadata;
    procedure ApplyMetadataBankReplicator;
  published
    property FBZabuuReplicator: TFDZabuuReplicator read FFBZabuuReplicator
      write SetFBZabuuReplicator;
    property ApplicationName: String read FApplicationName
      write SetApplicationName;
    property MasterKey: String read FMasterKey write SetMasterKey;
    property Log : TEvLog read FLog write SetLog;
  end;

implementation

{ TFBZabuuMetadata }

procedure TFBZabuuMetadata.ApplyMetadata;
var
  ControllerMetadata: IControllerMetadata;
begin
  ControllerMetadata := TControllerFactory.New.Metadata(FBZabuuReplicator.Host,
    FBZabuuReplicator.Path, FBZabuuReplicator.TypeDB, FBZabuuReplicator.DBVersion, FBZabuuReplicator.User,
    FBZabuuReplicator.Password, FBZabuuReplicator.RoleName, FBZabuuReplicator.Host, FBZabuuReplicator.Port,
    FBZabuuReplicator.VendorLib);

  ControllerMetadata.Log := Log;
  ControllerMetadata.createReplicationStructure(ApplicationName, MasterKey);
end;

procedure TFBZabuuMetadata.ApplyMetadataBankReplicator;
var
  ControllerMetadata: IControllerMetadata;
begin
  ControllerMetadata := TControllerFactory.New.Metadata(FBZabuuReplicator.Host,
    FBZabuuReplicator.Path, FBZabuuReplicator.TypeDB, FBZabuuReplicator.DBVersion, FBZabuuReplicator.User,
    FBZabuuReplicator.Password, FBZabuuReplicator.RoleName, FBZabuuReplicator.Host, FBZabuuReplicator.Port,
    FBZabuuReplicator.VendorLib);

  ControllerMetadata.Log := Log;
  ControllerMetadata.createReplicationBank(MasterKey);

end;

procedure TFBZabuuMetadata.SetApplicationName(const Value: String);
begin
  FApplicationName := Value;
end;

procedure TFBZabuuMetadata.SetFBZabuuReplicator(const Value
  : TFDZabuuReplicator);
begin
  FFBZabuuReplicator := Value;
end;

procedure TFBZabuuMetadata.SetLog(const Value: TEvLog);
begin
  FLog := Value;
end;

procedure TFBZabuuMetadata.SetMasterKey(const Value: String);
begin
  FMasterKey := Value;
end;

end.
