unit Serial;

interface

uses
  Windows, SysUtils;

Function SerialNum(FDrive: String): String;

implementation

Function SerialNum(FDrive: String): String;
Var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: Array [0 .. 11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen,
      Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  Except
    Result := '';
  end;
end;

end.
