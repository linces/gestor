unit Replicador.Model.Log;

interface

Type
  iModelLog = interface
    ['{FE95D453-5378-4ACE-B160-A21363E44287}']
  end;

  TModelLog = class(TInterfacedObject, iModelLog)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelLog;
      class procedure GravarLog(aString : String);
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TModelLog }

constructor TModelLog.Create;
begin

end;

destructor TModelLog.Destroy;
begin

  inherited;
end;

class procedure TModelLog.GravarLog(aString: String);
begin
  TThread.Queue(TThread.CurrentThread,
  procedure
  var
    arq: TextFile;
    NomeArq: string;
  begin
    if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'LOG') then
      CreateDir(ExtractFilePath(ParamStr(0)) + 'LOG');

    NomeArq := ExtractFilePath(ParamStr(0)) + 'LOG\LOG_' + FormatDateTime('dd_mm_yyyy', now) + '.txt';
    AssignFile(arq, NomeArq);
    if not FileExists(NomeArq) then Rewrite(arq) else Append(arq);
    Writeln(arq, FormatDateTime('hh:nn:ss', now) + ' - ' + aString);
    CloseFile(arq);
  end);
end;

class function TModelLog.New: iModelLog;
begin
  Result := Self.Create;
end;

end.
