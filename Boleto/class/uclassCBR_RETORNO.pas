unit uclassCBR_RETORNO;

interface

uses
  FireDAC.Comp.Client, Forms, SysUtils, Data.DB, System.Classes;

type
  TCbrRETORNO = class(TObject)
  private
  public
    function GetNewIDCBR_RETORNO: Integer;
    function GetNewIDCBR_RETORNO_TITULOS(vID_CBR_RETORNO: Integer): Integer;
  end;

var
  oCbrRETORNO: TCbrRETORNO;

implementation

uses
  Udados;

function TCbrRETORNO.GetNewIDCBR_RETORNO: Integer;
begin
  Result := 1;

  try
    dados.QryConsulta.Close;
    dados.QryConsulta.SQL.Clear;
    dados.QryConsulta.SQL.Text := 'select MAX(ID_CBR_RETORNO) from CBR_RETORNO';
    dados.QryConsulta.Open;

    if Not dados.QryConsulta.IsEmpty then
      Result := dados.QryConsulta.Fields[0].AsInteger + 1;
  finally
    dados.QryConsulta.Close;
  end;

  if Result <= 0 then
    raise Exception.Create('Erro na geração do identificador dos Retornos!');
end;

function TCbrRETORNO.GetNewIDCBR_RETORNO_TITULOS(vID_CBR_RETORNO
  : Integer): Integer;
begin
  Result := 1;

  try
    dados.QryConsulta.Close;
    dados.QryConsulta.SQL.Clear;
    dados.QryConsulta.SQL.Text :=
      Format('select MAX(ID_CBR_RETORNO_TITULOS) from CBR_RETORNO_TITULOS where ID_CBR_RETORNO = %d',
      [vID_CBR_RETORNO]);
    dados.QryConsulta.Open;

    if Not dados.QryConsulta.IsEmpty then
      Result := dados.QryConsulta.Fields[0].AsInteger + 1;
  finally
    dados.QryConsulta.Close;
  end;

  if Result <= 0 then
    raise Exception.Create
      ('Erro na geração do identificador dos Títulos do Retorno!');

end;

initialization

oCbrRETORNO := TCbrRETORNO.Create;

finalization

FreeAndNil(oCbrRETORNO);

end.
