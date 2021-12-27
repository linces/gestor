unit uLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, DB, ComCtrls;

procedure ListaComponentes(vform: TForm);

var
  Lista: TStrings;

implementation

procedure ListaComponentes(vform: TForm);
var
  i: Integer;
begin
  try
    Lista := TStringList.Create;
    for i := 0 to vform.ComponentCount - 1 do
      if vform.Components[i] is TCustomEdit then
      finally

      end;
  end;

  { ------------fim------------- }
  { ---Execução de procedures--- }
end.
