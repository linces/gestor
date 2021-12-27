unit Replicador.Reg;

interface

uses
  System.Classes, FDZabuuReplicator, FBZabuuMetadata;

procedure Register;

implementation

procedure Register;
begin
     RegisterComponents('Zabuu Replicator', [TFDZabuuReplicator, TFBZabuuMetadata]);
end;

end.
