unit uclassCBR_REMESSA;

interface

uses
  FireDAC.Comp.Client, Forms, SysUtils, Data.DB, System.Classes;

type
  TCbrREMESSA = class(TObject)
  private
  public
    function GetNewID: Integer;
  end;

var
  oCbrREMESSA: TCbrREMESSA;

implementation

{ TProduto }

uses Udados;

function TCbrREMESSA.GetNewID: Integer;
begin
  Result := 1;

  try
    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Clear;
    dados.qryConsulta.SQL.Text := 'select MAX(ID_CBR_REMESSA) from CBR_REMESSA';
    dados.qryConsulta.Open;

    if Not dados.qryConsulta.IsEmpty then
      Result := dados.qryConsulta.Fields[0].AsInteger + 1;
  finally
    dados.qryConsulta.Close;
  end;

  if Result <= 0 then
    raise Exception.Create('Erro na geração do identificador das Remessas!');
end;

initialization

oCbrREMESSA := TCbrREMESSA.Create;

finalization

FreeAndNil(oCbrREMESSA);

end.
