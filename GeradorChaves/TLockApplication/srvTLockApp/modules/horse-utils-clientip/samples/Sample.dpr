program Sample;

uses
  Horse,
  Horse.Utils.ClientIP;

begin
  THorse.Get('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(ClientIP(Req));
    end);

  THorse.Listen(9000);
end.
