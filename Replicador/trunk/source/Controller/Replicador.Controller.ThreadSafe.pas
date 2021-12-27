unit Replicador.Controller.ThreadSafe;

interface

Type
  iControllerThreadSafe = interface
    ['{3B57AF1E-908B-46EC-9240-45C873E7A8F2}']
    function Enter : iControllerThreadSafe;
    function Release : iControllerThreadSafe;
  end;

  TControllerThreadSafe = class(TInterfacedObject, iControllerThreadSafe)
    private
      FARQ : TextFile;
      FName : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerThreadSafe;
      function Enter : iControllerThreadSafe;
      function Release : iControllerThreadSafe;
  end;

implementation

uses
  System.SysUtils, System.Classes;

{ TControllerThreadSafe }

constructor TControllerThreadSafe.Create;
begin
  FName := 'ThreadSafe.tsf';
  AssignFile(FARQ, FName);
end;

destructor TControllerThreadSafe.Destroy;
begin

  inherited;
end;

function TControllerThreadSafe.Enter: iControllerThreadSafe;
begin
  if FileExists(FNAME) then
    Abort;
  Rewrite(FARQ);
  CloseFile(FARQ);
end;

class function TControllerThreadSafe.New: iControllerThreadSafe;
begin
  Result := Self.Create;
end;

function TControllerThreadSafe.Release: iControllerThreadSafe;
begin
  if FileExists(FNAME) then
    DeleteFile(FNAME);
end;

end.
