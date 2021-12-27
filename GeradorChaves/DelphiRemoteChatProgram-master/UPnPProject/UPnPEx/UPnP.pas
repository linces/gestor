unit UPnP;    ///Esta em turo e precisa ser traduzido para portugues ou inglês

interface

uses
Windows, ActiveX, OleAuto, Variants, SysUtils;

type
PortAcmak = class
public
    class function Ekle(const Aktiflik: Boolean; const CikisPort, GirisPort: DWORD;
      const IPAdresi, Protokol, Aciklama: String): Boolean;
    class function Kaldir(const CikisPort: DWORD; const Protokol: String): Boolean;
end;

implementation

class function PortAcmak.Ekle(const Aktiflik: Boolean; const CikisPort, GirisPort: DWORD;
const IPAdresi, Protokol, Aciklama: String): Boolean;
var
n, p: Variant;
Begin
Result := False;
try
    n := CreateOleObject('HNetCfg.NATUPnP');
    p := n.StaticPortMappingCollection;
    if not VarIsClear(p) then
    begin
      p.Add(CikisPort, UpperCase(Protokol), GirisPort, IPAdresi, Aktiflik, Aciklama);
      Result := True;
    end;
except
// on e: exception do showmessage(e.Message);
end;
end;

class function PortAcmak.Kaldir(const CikisPort: DWORD; const Protokol: String): Boolean;
var
n, p: Variant;
Begin
Result := False;
try
    n := CreateOleObject('HNetCfg.NATUPnP');
    p := n.StaticPortMappingCollection;
    if not VarIsClear(p) then
      Result := p.Remove(CikisPort, UpperCase(Protokol)) = S_OK;
except
// on e: exception do showmessage(e.Message);
end;
end;

end.