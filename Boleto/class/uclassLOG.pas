unit uclassLOG;

interface

uses FireDAC.Comp.Client, Forms, SysUtils;

type
  TLog = class(TObject)
  private
  public
    procedure Logar(aLog: String);
end;

var
  oLog: TLog;

implementation

{ TLog }
procedure TLog.Logar(aLog: String);
var
  ArquivoLog: TextFile;
  PathArquivo: TFileName;
begin
  PathArquivo :=
    ExtractFilePath(Application.ExeName) + 'Log\' + FormatDateTime('dd ''_'' MM ''_'' yyy',Date) + '_LOG.Txt';

  if Not DirectoryExists(ExtractFileDir(Application.ExeName)+'\Log') then
    MkDir(ExtractFileDir(Application.ExeName)+'\Log');

  AssignFile(ArquivoLog, PathArquivo);
  try
    if FileExists(PathArquivo) then
      Append(ArquivoLog)
    else
      Rewrite(ArquivoLog);

    Writeln(ArquivoLog,'#>_ ' + FormatDateTime('hh:mm:ss',Time) + '|' + aLog);
  finally
    CloseFile(ArquivoLog);
  end;
end;

initialization
  oLog := TLog.Create;

finalization
  FreeAndNil(oLog);

end.

