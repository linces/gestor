unit Ping2;

interface

function PingHost(const HostName: AnsiString; TimeoutMS: cardinal = 500): boolean;

implementation

uses Windows, SysUtils, WinSock;

function IcmpCreateFile: THandle; stdcall; external 'iphlpapi.dll';
function IcmpCloseHandle(icmpHandle: THandle): boolean; stdcall;
  external 'iphlpapi.dll';
function IcmpSendEcho(icmpHandle: THandle; DestinationAddress: In_Addr;
  RequestData: Pointer; RequestSize: Smallint; RequestOptions: Pointer;
  ReplyBuffer: Pointer; ReplySize: DWORD; Timeout: DWORD): DWORD; stdcall;
  external 'iphlpapi.dll';

type
  TEchoReply = packed record
    Addr: In_Addr;
    Status: DWORD;
    RoundTripTime: DWORD;
  end;

  PEchoReply = ^TEchoReply;

var
  WSAData: TWSAData;

procedure Startup;
begin
  if WSAStartup($0101, WSAData) <> 0 then
    raise Exception.Create('WSAStartup');
end;

procedure Cleanup;
begin
  if WSACleanup <> 0 then
    raise Exception.Create('WSACleanup');
end;

function PingHost(const HostName: AnsiString;
  TimeoutMS: cardinal = 500): boolean;
const
  rSize = $400;
var
  e: PHostEnt;
  a: PInAddr;
  h: THandle;
  d: string;
  r: array [0 .. rSize - 1] of byte;
  i: cardinal;
begin
  Startup;
  e := gethostbyname(PAnsiChar(HostName));
  if e = nil then
    RaiseLastOSError;
  if e.h_addrtype = AF_INET then
    Pointer(a) := e.h_addr^
  else
    raise Exception.Create('Name doesn''t resolve to an IPv4 address');

  d := FormatDateTime('yyyymmddhhnnsszzz', Now);

  h := IcmpCreateFile;
  if h = INVALID_HANDLE_VALUE then
    RaiseLastOSError;
  try
    i := IcmpSendEcho(h, a^, PChar(d), Length(d), nil, @r[0], rSize, TimeoutMS);
    Result := (i <> 0) and (PEchoReply(@r[0]).Status = 0);
  finally
    IcmpCloseHandle(h);
  end;
  Cleanup;
end;

end.
