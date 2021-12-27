unit uConsVendedor;

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
  TFrmConsVendedor = class(TForm)
    edtLoc: TEdit;
    DBGrid1: TDBGrid;
    dsVendedor: TDataSource;
    qryVendedor: TFDQuery;
    qryVendedorNOME: TStringField;
    qryVendedorCODIGO: TIntegerField;
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
    idVendedor: integer;
    vNome: String;
    { Public declarations }
  end;

var
  FrmConsVendedor: TFrmConsVendedor;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmConsVendedor.DBGrid1DblClick(Sender: TObject);
begin
  idVendedor := qryVendedorCODIGO.Value;
  vNome := qryVendedorNOME.Value;
  close;
end;

procedure TFrmConsVendedor.edtLocChange(Sender: TObject);
begin
  Localiza;
end;

procedure TFrmConsVendedor.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_up then
    qryVendedor.Prior;

  if Key = VK_DOWN then
    qryVendedor.Next;

end;

procedure TFrmConsVendedor.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmConsVendedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;

end;

procedure TFrmConsVendedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    idVendedor := qryVendedorCODIGO.Value;
    vNome := qryVendedorNOME.Value;
    close;
  end;

end;

procedure TFrmConsVendedor.FormShow(Sender: TObject);
begin
  Localiza;
end;

procedure TFrmConsVendedor.Localiza;
begin
  qryVendedor.close;
  qryVendedor.Params[0].Value := edtLoc.Text + '%';
  qryVendedor.Open;
end;

end.
