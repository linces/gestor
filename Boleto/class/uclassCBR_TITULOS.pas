unit uclassCBR_TITULOS;

interface

uses
  FireDAC.Comp.Client, Forms, SysUtils, Data.DB, System.Classes;

type
  TCbrTIT = class(TObject)
  private
  public
    function GetNewID:Integer;
  end;

var
  oCbrTIT: TCbrTIT;

implementation


{ TProduto }

uses Udados;

function TCbrTIT.GetNewID: Integer;
begin
  Result := 1;


  try
    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Clear;
    dados.qryConsulta.SQL.Text := 'select MAX(ID_CBR_TITULOS) from CBR_TITULOS';
    dados.qryConsulta.Open;

    if Not dados.qryConsulta.IsEmpty then
      Result := dados.qryConsulta.Fields[0].AsInteger + 1;
  finally
    dados.qryConsulta.Close;
  end;

  if Result <= 0 then
    raise Exception.Create('Erro na geração do identificador dos Titulos!');
end;


initialization
  oCbrTIT := TCbrTIT.Create;

finalization
  FreeAndNil(oCbrTIT);

end.
