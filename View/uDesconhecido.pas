unit uDesconhecido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ACBrBase, ACBrEnterTab;

type
  Tfrmdesconhecido = class(TForm)
    Label1: TLabel;
    edtPreco: TEdit;
    btnConcluir: TBitBtn;
    btnFechar: TBitBtn;
    lblProduto: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPrecoEnter(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    fecha: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdesconhecido: Tfrmdesconhecido;

implementation

{$R *.dfm}


procedure Tfrmdesconhecido.btnConcluirClick(Sender: TObject);
begin
  fecha := true;
  close;
end;

procedure Tfrmdesconhecido.btnFecharClick(Sender: TObject);
begin
  fecha := true;
  close;
end;

procedure Tfrmdesconhecido.edtPrecoEnter(Sender: TObject);
begin
  edtPreco.SelectAll;
end;

procedure Tfrmdesconhecido.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnConcluir.SetFocus;
end;

procedure Tfrmdesconhecido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not fecha then
    Action := caNone
end;

procedure Tfrmdesconhecido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F3 then
    edtPreco.SetFocus;

  if Key = VK_ESCAPE then
    btnFechar.Click;

  if Key = VK_F10 then
    btnConcluir.Click;

end;

procedure Tfrmdesconhecido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if ActiveControl <> edtPreco then
      Key := #0;
  end;
end;

procedure Tfrmdesconhecido.FormShow(Sender: TObject);
begin
  fecha := false;
end;

end.
