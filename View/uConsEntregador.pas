unit uConsEntregador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ACBrBase, ACBrEnterTab, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsEntregador = class(TForm)
    edtLoc: TEdit;
    DBGrid1: TDBGrid;
    dsEntregador: TDataSource;
    qryEntregador: TFDQuery;
    qryEntregadorNOME: TStringField;
    qryEntregadorCODIGO: TIntegerField;
    procedure edtLocChange(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure Localiza;
    { Private declarations }
  public
    idEntregador: integer;
    vNome: String;
    { Public declarations }
  end;

var
  FrmConsEntregador: TFrmConsEntregador;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmConsEntregador.DBGrid1DblClick(Sender: TObject);
begin
  idEntregador := qryEntregadorCODIGO.Value;
  close;
end;

procedure TFrmConsEntregador.edtLocChange(Sender: TObject);
begin
  Localiza;
end;

procedure TFrmConsEntregador.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_up then
    qryEntregador.Prior;

  if Key = VK_DOWN then
    qryEntregador.Next;

end;

procedure TFrmConsEntregador.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TFrmConsEntregador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;

end;

procedure TFrmConsEntregador.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    idEntregador := qryEntregadorCODIGO.Value;
    vNome := qryEntregadorNOME.Value;
    close;
  end;

end;

procedure TFrmConsEntregador.FormShow(Sender: TObject);
begin
  Localiza;
end;

procedure TFrmConsEntregador.Localiza;
begin
  qryEntregador.close;
  qryEntregador.Params[0].Value := edtLoc.Text + '%';
  qryEntregador.Open;
end;

end.
