unit uFrmPadrao_Master_Datail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvSpeedButton,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    Shape1: TShape;
    DBText1: TDBText;
    btnFinalizar: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnPessoas: TSpeedButton;
    btnConfirmar: TJvSpeedButton;
    btnCancelar: TJvSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
