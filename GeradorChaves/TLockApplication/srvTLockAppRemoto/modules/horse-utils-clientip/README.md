# Horse-Utils-ClientIP

![](https://img.shields.io/github/stars/dliocode/horse-utils-clientip.svg) ![](https://img.shields.io/github/forks/dliocode/horse-utils-clientip.svg) ![](https://img.shields.io/github/tag/dliocode/horse-utils-clientip.svg) ![](https://img.shields.io/github/release/dliocode/horse-utils-clientip.svg) ![](https://img.shields.io/github/issues/dliocode/horse-utils-clientip.svg)

Support: developer.dlio@gmail.com

Basic functions for Horse. 

### For install in your project using [boss](https://github.com/HashLoad/boss):
``` sh
$ boss install github.com/dliocode/horse-utils-clientip
```

## Usage

Capture the client's IP: 

```delphi
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
```

## License

MIT © [Danilo Lucas](https://github.com/dliocode/)
