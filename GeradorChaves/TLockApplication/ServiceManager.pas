unit ServiceManager;

interface

uses
  SysUtils, Windows, Winsvc;

type
  TServiceManager = class;

  { The states a service can be in. }
  TServiceState = (ssStopped,
                   ssStartPending,
                   ssStopPending,
                   ssRunning,
                   ssContinuePending,
                   ssPausePending,
                   ssPaused);

  { Enumeration of the standard "controls" a service can accept. The shutdown control, if not
    accepted is ignored. The shutdown control can only be sent when a shutdown occurs. }
  TServiceAccept = (saStop,
                    saPauseContinue,
                    saShutdown);

  { The set of "controls" a service can accept. }
  TServiceAccepts = set of TServiceAccept;

  { The service startup enumeration determines how a service is started. ssAutomatic will start the
    service automatically at startup. ssManual will allow applications and other services to start
    this service manually and ssDisabled will disallow the service to be started altogether (but it
    will be kept in the service database). }
  TServiceStartup = (ssAutomatic,
                     ssManual,
                     ssDisabled);

  { Gives information of and controls a single Service. Can be accessed via @link(TServiceManager). }
  TServiceInfo = class
  private
    { Placeholder of the Index property.  Assigned by the ServiceManager that created this instance. }
    FIndex: Integer;
    { Link the the creating service manager. }
    FServiceManager: TServiceManager;
    { Handle of the service during several member calls. }
    FHandle: SC_HANDLE;
    { Status of thi service. This contains several fields for several properties. }
    FServiceStatus: TServiceStatus;
    { Key name of this service. }
    FServiceName: string;
    { Display name oif this service. }
    FDisplayName: string;
    { Are de depenedents searched. If so the @link(FDependents) array is filled with those. }
    FDependentsSearched: Boolean;
    { Array of @link(TServiceInfo) instances that depent on this service. Only filled when
      @link(FDependentsSearched) is True. }
    FDependents: array of TServiceInfo;
    { Placeholder for the live}
    FLive: Boolean;
    // Query Config
    FConfigQueried: Boolean;
    FOwnProcess: Boolean;
    FInteractive: Boolean;
    FStartType: TServiceStartup;
    FBinaryPath: string;
    FUserName: string;
    function GetDependent(Index: Integer): TServiceInfo;
    function GetDepenentCount: Integer;
    function GetState: TServiceState;
    function GetOwnProcess: Boolean;
    function GetInteractive: Boolean;
    function GetStartType: TServiceStartup;
    function GetBinaryPath: string;
    procedure SetState(const Value: TServiceState);
    function GetServiceAccept: TServiceAccepts;
    procedure SetStartType(const Value: TServiceStartup);
  protected
    { Cleanup the handle created with @link(GetHandle). }
    procedure CleanupHandle;
    { Open a handle to the service with the given access rights.
      This handle can be deleted via @link(CleanupHandle). }
    procedure GetHandle(Access: DWORD);
    { Query all dependent services (list them via the @link(TServiceManager). }
    procedure SearchDependants;
    { Query the current status of this service }
    procedure Query;
    { Wait for a given status of this service... }
    procedure WaitFor(State: DWORD);
    { Fetch the configuration information }
    procedure QueryConfig;
  public
    constructor Create;
    destructor Destroy; override;
    { Action: Pause a running service. }
    procedure ServicePause(Wait: Boolean);
    { Action: Continue a paused service. }
    procedure ServiceContinue(Wait: Boolean);
    { Action: Stop a running service. }
    procedure ServiceStop(Wait: Boolean);
    { Action: Start a not running service.
      You can use the @link(State) property to change the state from ssStopped to ssRunning }
    procedure ServiceStart(Wait: Boolean);
    { Name of this service. }
    property ServiceName: string read FServiceName;
    { Display name of this service }
    property DisplayName: string read FDisplayName;
    { Number of dependant services of this service }
    property DependentCount: Integer read GetDepenentCount;
    { Access to serviced that depent on this service }
    property Dependents[Index: Integer]: TServiceInfo read GetDependent;
    { The current state of the service. You can set the service only to the non-transitional states.
      You can restart the service by first setting the State to first ssStopped and second ssRunning. }
    property State: TServiceState read GetState write SetState;
    { Are various properties using live information or historic information. }
    property Live: Boolean read FLive write FLive;
    { When service is running, does it run as a separate process (own process) or combined with
      other services under svchost. }
    property OwnProcess: Boolean read GetOwnProcess;
    { Is the service capable of interacting with the desktop.
      Possible: The logon must the Local System Account. }
    property Interactive: Boolean read GetInteractive;
    { How is this service started. See @link(TServiceStartup) for a description of startup types.
      If you want to set this property, the manager must be activeted with AllowLocking set to True. }
    property StartType: TServiceStartup read GetStartType write SetStartType;
    { Path to the binary that implements the service. }
    property BinaryPath: string read GetBinaryPath;
    { See what controls the service accepts. }
    property Accepts: TServiceAccepts read GetServiceAccept;
    { Index in ServiceManagers list }
    property Index: Integer read FIndex;
  end;

  { A service manager allows the services of a particular machine to be explored and modified. }
  TServiceManager = class
  private
    FManager: SC_HANDLE;
    FLock: SC_LOCK;
    FMachineName: string;
    FServices: array of TServiceInfo;
    FAllowLocking: Boolean;
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetMachineName(const Value: string);
    function GetServiceCount: Integer;
    function GetService(Index: Integer): TServiceInfo;
    function GetServiceByName(Name: string): TServiceInfo;
    procedure SetAllowLocking(const Value: Boolean);
  protected
    { Internal function that frees up all the @link(TServiceInfo) classes. }
    procedure CleanupServices;
    { Internal function for locking the manager }
    procedure Lock;
    { Internal function for unlocking the manager }
    procedure Unlock;
  public
    constructor Create;
    destructor Destroy; override;
    { Requeries the states, names etc of all services on the given @link(MachineName).
      Works only while active. }
    procedure RebuildServicesList;
    { Delete a service... }
    procedure DeleteService(Index: Integer);
    { Get the number of services. This number is refreshed when the @link(Active) is
      set to True or @link(RebuildServicesList) is called. Works only while active. }
    property ServiceCount: Integer read GetServiceCount;
    { Find a servce by index in the services list. This list is refreshed when the @link(Active) is
      set to True or @link(RebuildServicesList) is called. Works only while active. Valid Index
      values are 0..@link(ServiceCount) - 1. }
    property Services[Index: Integer]: TServiceInfo read GetService;
    { Find services by name (case insensitive). Works only while active. If no service can be found
      an exception will be raised. }
    property ServiceByName[Name: string]: TServiceInfo read GetServiceByName;
//  published
    { Activate / deactivate the service managaer. In active state can you access the individual
      service }
    property Active: Boolean read GetActive write SetActive;
    { The machine name for which you want the services list. }
    property MachineName: string read FMachineName write SetMachineName;
    { Allow locking... Is needed only when changing several properties in TServiceInfo.
      Property can only be set while inactive. }
    property AllowLocking: Boolean read FAllowLocking write SetAllowLocking;
  end;

implementation

{ TServiceManager }

procedure TServiceManager.RebuildServicesList;
var
  {Services,} S: PEnumServiceStatus;
  Services{, S}: PEnumServiceStatus;
  BytesNeeded,ServicesReturned,ResumeHandle: DWORD;
  i: Integer;
begin
  if not Active then raise Exception.Create('BuildServicesList só funciona quando o serviço está ativo');
  // Cleanup
  CleanupServices;
  // Get the amount of memory we need...
  ServicesReturned := 0;
  ResumeHandle := 0;
  Services := nil;
  if EnumServicesStatus(FManager, SERVICE_WIN32, SERVICE_ACTIVE or SERVICE_INACTIVE,
                     Services^.ServiceStatus,0, BytesNeeded,ServicesReturned,ResumeHandle) then Exit;
  if GetLastError <> ERROR_MORE_DATA then RaiseLastOSError;
  // And... Get all the data...
  GetMem(Services,BytesNeeded);
  try
    ServicesReturned := 0;
    ResumeHandle := 0;
    S := Services;
    if not EnumServicesStatus(FManager, SERVICE_WIN32, SERVICE_ACTIVE or SERVICE_INACTIVE,
                       Services^,BytesNeeded, BytesNeeded,ServicesReturned,ResumeHandle) then Exit;
    SetLength(FServices,ServicesReturned);
    for i := 0 to ServicesReturned - 1 do begin
      FServices[i] := TServiceInfo.Create;
      FServices[i].FServiceName := S^.lpServiceName;
      FServices[i].FDisplayName := S^.lpDisplayName;
      FServices[i].FServiceStatus := S^.ServiceStatus;
      FServices[i].FServiceManager := Self;
      FServices[i].FIndex := i;
      Inc(S);
    end;
  finally
    FreeMem(Services);
  end;
end;

procedure TServiceManager.CleanupServices;
var
  i: Integer;
begin
  for i := 0 to High(FServices) do FServices[i].Free;
  SetLength(FServices,0);
end;

constructor TServiceManager.Create;
begin
  inherited Create;
  FManager := 0;
end;

destructor TServiceManager.Destroy;
begin
  Active := False;
  inherited Destroy;
end;

function TServiceManager.GetActive: Boolean;
begin
  Result := FManager <> 0;
end;

function TServiceManager.GetService(Index: Integer): TServiceInfo;
begin
  // Sanity check
  if (Index < 0) or (Index >= Length(FServices)) then raise Exception.Create('Index out of bounds');
  // Fetch the object of interest
  Result := FServices[Index];
end;

function TServiceManager.GetServiceByName(Name: string): TServiceInfo;
var
  i: Integer;
begin
  Name := Uppercase(Name);
  for i := 0 to High(FServices) do begin
    Result := FServices[i];
    if Uppercase(Result.ServiceName) = Name then Exit;
  end;
  raise Exception.Create('Service not found');
end;

function TServiceManager.GetServiceCount: Integer;
begin
  Result := Length(FServices);
end;

procedure TServiceManager.SetActive(const Value: Boolean);
var
  VersionInfo: TOSVersionInfo;
  DesiredAccess: DWORD;
begin
  if Value then begin
    if FManager <> 0 then Exit;
    // Check that we are NT, 2000, XP or above...
    VersionInfo.dwOSVersionInfoSize := sizeof(VersionInfo);
    if not Windows.GetVersionEx(VersionInfo) then RaiseLastOSError;
    if VersionInfo.dwPlatformId <> VER_PLATFORM_WIN32_NT    then begin
      raise Exception.Create('This program only works on Windows NT, 2000 or XP');
    end;
    // Open service manager
    DesiredAccess := SC_MANAGER_CONNECT or SC_MANAGER_ENUMERATE_SERVICE;
    if FAllowLocking then Inc(DesiredAccess,SC_MANAGER_LOCK);
    FManager := OpenSCManager(PChar(FMachineName),nil,DesiredAccess);
    if FManager = 0 then RaiseLastOSError;
    // Fetch the srvices list
    RebuildServicesList;
  end else begin
    if FManager = 0 then Exit;
    // CleanupServices
    CleanupServices;
    // Close service manager
    if Assigned(FLock) then Unlock;
    CloseServiceHandle(FManager);
    FManager := 0;
  end;
end;

procedure TServiceManager.SetMachineName(const Value: string);
begin
  if Active then raise Exception.Create('Cannot change machine name while active');
  FMachineName := Value;
end;

procedure TServiceManager.DeleteService(Index: Integer);
begin
  // todo: implementation
  raise Exception.Create('Not implemented');
end;

procedure TServiceManager.Lock;
begin
  if not FAllowLocking then raise Exception.Create('Locking of the service manager not allowed!');
  FLock := LockServiceDatabase(FManager);
  if FLock = nil then RaiseLastOSError;
end;

procedure TServiceManager.Unlock;
begin
  // We are unlocked already
  if FLock = nil then Exit;
  // Unlock...
  if not UnlockServiceDatabase(FLock) then RaiseLastOSError;
  FLock := nil;
end;

procedure TServiceManager.SetAllowLocking(const Value: Boolean);
begin
  if Active then raise Exception.Create('Cannot change allow locking while active');
  FAllowLocking := Value;
end;

{ TServiceInfo }

procedure TServiceInfo.CleanupHandle;
begin
  if FHandle = 0 then Exit;
  CloseServiceHandle(FHandle);
  FHandle := 0;
end;

constructor TServiceInfo.Create;
begin
  FDependentsSearched := False;
  FConfigQueried := False;
  FHandle := 0;
  FLive := False;
end;

destructor TServiceInfo.Destroy;
begin
  CleanupHandle;
  inherited Destroy;
end;

function TServiceInfo.GetDependent(Index: Integer): TServiceInfo;
begin
  SearchDependants;
  if (Index < 0) or (Index >= Length(FDependents)) then raise Exception.Create('Index out of bounds');
  Result := FDependents[Index];
end;

function TServiceInfo.GetDepenentCount: Integer;
begin
  SearchDependants;
  Result := Length(FDependents);
end;

procedure TServiceInfo.GetHandle(Access: DWORD);
begin
  if FHandle <> 0 then Exit;
  FHandle := OpenService(FServiceManager.FManager,PChar(FServiceName),Access);
  if FHandle = 0 then RaiseLastOSError;
end;

function TServiceInfo.GetState: TServiceState;
begin
  if FLive then Query;
  case FServiceStatus.dwCurrentState of
    SERVICE_STOPPED:          Result := ssStopped;
    SERVICE_START_PENDING:    Result := ssStartPending;
    SERVICE_STOP_PENDING:     Result := ssStopPending;
    SERVICE_RUNNING:          Result := ssRunning;
    SERVICE_CONTINUE_PENDING: Result := ssContinuePending;
    SERVICE_PAUSE_PENDING:    Result := ssPausePending;
    SERVICE_PAUSED:           Result := ssPaused;
    else                      raise Exception.Create('Service State unknown');
  end;
end;

procedure TServiceInfo.Query;
var
  Status: TServiceStatus;
begin
  if FHandle <> 0 then begin
    if not QueryServiceStatus(FHandle,Status) then RaiseLastOSError;
  end else begin
    GetHandle(SERVICE_QUERY_STATUS);
    try
      if not QueryServiceStatus(FHandle,Status) then RaiseLastOSError;
    finally
      CleanupHandle;
    end;
  end;
  FServiceStatus := Status;
end;

procedure TServiceInfo.ServiceContinue(Wait: Boolean);
var
  Status: TServiceStatus;
begin
  GetHandle(SERVICE_QUERY_STATUS or SERVICE_PAUSE_CONTINUE);
  try
    if not (saPauseContinue in Accepts) then raise Exception.Create('Service cannot be continued');
    if not ControlService(FHandle,SERVICE_CONTROL_CONTINUE,Status) then RaiseLastOSError;
    if Wait then WaitFor(SERVICE_RUNNING);
  finally
    CleanupHandle;
  end;
end;

procedure TServiceInfo.ServicePause(Wait: Boolean);
var
  Status: TServiceStatus;
begin
  GetHandle(SERVICE_QUERY_STATUS or SERVICE_PAUSE_CONTINUE);
  try
    if not (saPauseContinue in Accepts) then raise Exception.Create('Service cannot be paused');
    if not ControlService(FHandle,SERVICE_CONTROL_PAUSE,Status) then RaiseLastOSError;
    if Wait then WaitFor(SERVICE_PAUSED);
  finally
    CleanupHandle;
  end;
end;

procedure TServiceInfo.ServiceStart(Wait: Boolean);
var
  P: PCHar;
begin
  GetHandle(SERVICE_QUERY_STATUS or SERVICE_START);
  try
    P := nil;
    if not StartService(FHandle,0,P) then RaiseLastOSError;
    if Wait then WaitFor(SERVICE_RUNNING);
  finally
    CleanupHandle;
  end;
end;

procedure TServiceInfo.ServiceStop(Wait: Boolean);
var
  Status: TServiceStatus;
begin
  GetHandle(SERVICE_QUERY_STATUS or SERVICE_STOP);
  try
    if not (saStop in Accepts) then raise Exception.Create('Service cannot be Stopped');
    if not ControlService(FHandle,SERVICE_CONTROL_STOP,Status) then RaiseLastOSError;
    if Wait then WaitFor(SERVICE_STOPPED);
  finally
    CleanupHandle;
  end;
end;

procedure TServiceInfo.WaitFor(State: DWORD);
var
  OldCheckPoint, Wait: DWORD;
begin
  Query;
  while State <> FServiceStatus.dwCurrentState do begin
    OldCheckPoint := FServiceStatus.dwCheckPoint;
    Wait := FServiceStatus.dwWaitHint;
    if Wait <= 0 then Wait := 5000;
    Sleep(Wait);
    Query;
    if State = FServiceStatus.dwCurrentState then Break;
    if FServiceStatus.dwCheckPoint <> OldCheckPoint then begin
      raise Exception.Create('Service did not react within timeframe given');
    end;
  end;
end;

procedure TServiceInfo.SearchDependants;
var
  Services, S: PEnumServiceStatus;
  BytesNeeded, ServicesReturned: DWORD;
  i: Integer;
begin
  if FDependentsSearched then Exit;
  // No dependants found...
  SetLength(FDependents,0);
  // We need a handle to the service to do any good...
  GetHandle(SERVICE_ENUMERATE_DEPENDENTS);
  try
    // See how many dependantw we have...
    Services := nil;
    BytesNeeded := 0;
    ServicesReturned := 0;
    if EnumDependentServices(FHandle,SERVICE_ACTIVE + SERVICE_INACTIVE, Services^,
                          0, BytesNeeded, ServicesReturned) then Exit;
    if GetLastError <> ERROR_MORE_DATA then RaiseLastOSError;
    // Allocate the buffer needed and fetch all info...
    GetMem(Services,BytesNeeded);
    try
      if not EnumDependentServices(FHandle,SERVICE_ACTIVE + SERVICE_INACTIVE, Services^,
                          BytesNeeded, BytesNeeded, ServicesReturned) then RaiseLastOSError;
      // Now process it...
      S := Services;
      SetLength(FDependents,ServicesReturned);
      for i := 0 to High(FDependents) do begin
        FDependents[i] := FServiceManager.ServiceByName[S^.lpServiceName];
        Inc(S);
      end;
    finally
      FreeMem(Services);
    end;
  finally
    CleanupHandle;
  end;
  FDependentsSearched := True;
end;

procedure TServiceInfo.QueryConfig;
var
  Buffer: PQueryServiceConfig;
  BytesNeeded: DWORD;
begin
  GetHandle(SERVICE_QUERY_CONFIG);
  try
    // See how large our buffer must be...
    Buffer := nil;
    assert(QueryServiceConfig(FHandle,Buffer,0,BytesNeeded) = False);
    if GetLastError <> ERROR_INSUFFICIENT_BUFFER then RaiseLastOSError;
    GetMem(Buffer,BytesNeeded);
    try
      // Perform the query...
      if not QueryServiceConfig(FHandle,Buffer,BytesNeeded,BytesNeeded) then RaiseLastOSError;
      // Analyse the query...
      assert(Buffer^.dwServiceType and SERVICE_WIN32 <> 0); // It must be a WIN32 service
      FOwnProcess := (Buffer^.dwServiceType and SERVICE_WIN32) = SERVICE_WIN32_OWN_PROCESS;
      FInteractive := (Buffer^.dwServiceType and SERVICE_INTERACTIVE_PROCESS) = SERVICE_INTERACTIVE_PROCESS;
      case Buffer^.dwStartType of
        SERVICE_AUTO_START:    FStartType := ssAutomatic;
        SERVICE_DEMAND_START:  FStartType := ssManual;
        SERVICE_DISABLED:      FStartType := ssDisabled;
        else                   raise Exception.Create('Service Start Type unknown');
      end;
      FBinaryPath := Buffer^.lpBinaryPathName;
      FUsername := Buffer^.lpServiceStartName;
      FConfigQueried := True;
    finally
      FreeMem(Buffer);
    end;
  finally
    CleanupHandle;
  end;
end;

function TServiceInfo.GetOwnProcess: Boolean;
begin
  if FLive or not FConfigQueried then QueryConfig;
  Result := FOwnProcess;
end;

function TServiceInfo.GetInteractive: Boolean;
begin
  if FLive or not FConfigQueried then QueryConfig;
  Result := FInteractive;
end;

function TServiceInfo.GetStartType: TServiceStartup;
begin
  if FLive or not FConfigQueried then QueryConfig;
  Result := FStartType;
end;

function TServiceInfo.GetBinaryPath: string;
begin
  if FLive or not FConfigQueried then QueryConfig;
  Result := FBinaryPath;
end;

function TServiceInfo.GetServiceAccept: TServiceAccepts;
begin
  Result := [];
  if FLive then Query;
  if FServiceStatus.dwControlsAccepted and SERVICE_ACCEPT_PAUSE_CONTINUE <> 0 then Result := Result + [saPauseContinue];
  if FServiceStatus.dwControlsAccepted and SERVICE_ACCEPT_STOP <> 0 then Result := Result + [saStop];
  if FServiceStatus.dwControlsAccepted and SERVICE_ACCEPT_SHUTDOWN <> 0 then Result := Result + [saShutdown];
end;



procedure TServiceInfo.SetState(const Value: TServiceState);
var
  OldState: TServiceState;
begin
  // Make sure we have the latest current state and that it is not a transitional state.
  if not FLive then Query;
  OldState := GetState;
  case OldState of
    ssStartPending:    WaitFor(SERVICE_RUNNING);
    ssStopPending:     WaitFor(SERVICE_STOPPED);
    ssContinuePending: WaitFor(SERVICE_RUNNING);
    ssPausePending:    WaitFor(SERVICE_PAUSED);
  end;
  OldState := GetState;
  // See what we need to do...
  case Value of
    ssStopped: if OldState <> ssStopped then ServiceStop(True);
    ssRunning: case OldState of
                 ssStopped: ServiceStart(True);
                 ssPaused:  ServiceContinue(True);
               end;
    ssPaused:  case OldState of
                 ssStopped: begin
                              ServiceStart(True);
                              try
                                ServicePause(True); // some services do not support pause/continue!
                              except
                                ServiceStop(True);
                                raise;
                              end;
                            end;
                 ssRunning: ServicePause(True);
               end;
    else       raise Exception.Create('Cannot set a transitional state in TServiceInfo.');
  end;
end;


procedure TServiceInfo.SetStartType(const Value: TServiceStartup);
const
  NewStartTypes: array [TServiceStartup] of DWORD =
    (SERVICE_AUTO_START, SERVICE_DEMAND_START, SERVICE_DISABLED);
begin
  // Check if it is not a change?
  QueryConfig;
  if Value = FStartType then Exit;
  // Alter it...
  FServiceManager.Lock;
  try
    GetHandle(SERVICE_CHANGE_CONFIG);
    try
      // We locked the manager and are allowed to change the configuration...
      if not ChangeServiceConfig(FHandle,SERVICE_NO_CHANGE,NewStartTypes[Value],SERVICE_NO_CHANGE,
                                 nil,nil,nil,nil,nil,nil,nil) then RaiseLastOSError;
      // well... we changed it, mark as such
      FStartType := Value;
    finally
      CleanupHandle;
    end;
  finally
    FServiceManager.Unlock;
  end;
end;

end.
