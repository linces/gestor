unit uclassDB;

interface

uses FireDAC.Comp.Client, Forms, SysUtils, DB;

type
  TDB = class(TObject)
  private
  public
    function GetMaximo(vTabela,vCampo,vCondicao:String): Integer;
end;

var
  oDB: TDB;

implementation


{ TDB }

uses Udados;

function TDB.GetMaximo(vTabela,vCampo,vCondicao:String): Integer;
var
  vSQL: String;
begin
  if (vTabela.Trim.Length >0) and (vCampo.Trim.Length > 0) then
  begin
    //monta sql
    vSQL := 'SELECT MAX(%s) from %s ';

    //condição
    if vCondicao.Trim.Length >0 then
    begin
      vSQL := vSQL + ' WHERE %s ';
      vSQL := Format(vSQL,[vCampo,vTabela,vCondicao]);
    end
    else
      vSQL := Format(vSQL,[vCampo,vTabela]);

    try
      try
        dados.qryConsulta.Close;
        dados.qryConsulta.Open(vSQL);
        dados.qryConsulta.FetchAll;
      except on e:exception do
        begin
          raise Exception.Create('Erro com a função Máximo, erro na execução :' + sLineBreak + e.Message);
        end;
      end;

      if dados.qryConsulta.IsEmpty then
        Result := 1
      else
        Result := dados.qryConsulta.Fields[0].AsInteger + 1;

    finally
      dados.qryConsulta.Close;
    end;
  end
  else
    raise Exception.Create('Erro com a função Máximo, paramentros informados.');
end;

initialization
  oDB := TDB.Create;

finalization
  FreeAndNil(oDB);

end.

