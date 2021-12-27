unit unservico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, Horse, Horse.Jhonson, Horse.Compression, REST.Types,
  REST.Client, REST.Response.Adapter, Horse.Cors, Horse.Paginate, Horse.Utils.ClientIP;

type
  Tserverservice = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  serverservice: Tserverservice;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  serverservice.Controller(CtrlCode);
end;

function Tserverservice.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure Tserverservice.ServiceCreate(Sender: TObject);
begin
   THorse.Get('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(ClientIP(Req));
    end);
end;

procedure Tserverservice.ServiceStart(Sender: TService; var Started: Boolean);
begin
  THorse.Listen(9002);
  Started := True;
end;

procedure Tserverservice.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  THorse.StopListen;
  Stopped := True;
end;

end.
