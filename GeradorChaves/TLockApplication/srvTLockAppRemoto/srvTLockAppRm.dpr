program srvTLockAppRm;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Json, Horse, Horse.Jhonson, Horse.Compression, REST.Types,
  REST.Client, REST.Response.Adapter, Horse.Cors, Horse.Paginate, Horse.Utils.ClientIP, Posix.Unistd;

begin
  try
  THorse.Use(Compression());
  THorse.Use(Jhonson);
  Thorse.Use(Cors);
  THorse.Use(Paginate);

    THorse.Get('',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('Escutando na porta: '+ THorse.Port.ToString);
    end);

    THorse.Get('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       Res.Send(ClientIP(Req));
    end);

  THorse.Listen(9003);
  finally
 //   on E: Exception do
 //     Writeln(E.ClassName, ': ', E.Message);
 end;
end.
