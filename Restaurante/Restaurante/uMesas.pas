unit uMesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCGrids, TDI,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmMesas = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    Panel1: TPanel;
    imgLivre: TImage;
    imgOcupada: TImage;
    Panel2: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Shape2: TShape;
    DBText1: TDBText;
    dsMesas: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses uDados, uPedidos, uMenu;

procedure TfrmMesas.FormShow(Sender: TObject);
begin
  Dados.qryMesas.Close;
  Dados.qryMesas.Open;
end;

end.
