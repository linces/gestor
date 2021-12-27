unit uTradutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmTradutor = class(TForm)
    DBGrid1: TDBGrid;
    dsTradutor: TDataSource;
    Panel1: TPanel;
    cbIdioma: TDBLookupComboBox;
    dsIdioma: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cbIdiomaClick(Sender: TObject);
  private
    procedure Filtra;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTradutor: TfrmTradutor;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmTradutor.Filtra;
begin
  dados.qryTradutor.Close;
  dados.qryTradutor.Params[0].Value := dados.vForm.Name;
  if cbIdioma.KeyValue <> null then
    dados.qryTradutor.Params[1].Value := cbIdioma.KeyValue
  else
    dados.qryTradutor.Params[1].Value := 1;
  dados.qryTradutor.Open;
end;

procedure TfrmTradutor.cbIdiomaClick(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmTradutor.FormShow(Sender: TObject);
begin
  cbIdioma.KeyValue := Dados.qryIdiomasCODIGO.AsInteger;
  Filtra;
end;

end.
