unit uclassUTIL;

interface

uses FireDAC.Comp.Client, Forms, System.SysUtils;

type
  TUtil = class(TObject)
  private
  public
    function GetGUID:TGUID;
end;

var
  oUtil: TUtil;

implementation

{ TUtil }

function TUtil.GetGUID: TGUID;
begin
  System.SysUtils.CreateGUID(Result);
end;

initialization
  oUtil := TUtil.Create;

finalization
  FreeAndNil(oUtil);

end.

