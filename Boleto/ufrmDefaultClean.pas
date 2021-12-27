unit ufrmDefaultClean;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, Vcl.Graphics, Vcl.Menus,
  Vcl.StdCtrls, ACBrBase, ACBrEnterTab, Vcl.ImgList, JvExControls,
  JvSpeedButton, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmDefaultClean = class(TfrmDefault)
    pnlComandos: TPanel;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure bConfirmaClick(Sender: TObject);
    procedure bCancelaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
  public
    FAlterado: Boolean;
    property Alterado: Boolean read FAlterado write FAlterado;
  end;

var
  frmDefaultClean: TfrmDefaultClean;

implementation

{$R *.dfm}

procedure TfrmDefaultClean.bCancelaClick(Sender: TObject);
begin
  ModalResult := mrCancel;

  Alterado := False;
  Close;
end;

procedure TfrmDefaultClean.bConfirmaClick(Sender: TObject);
begin
  Alterado := True;

  Close;
  ModalResult := mrOk;
end;

procedure TfrmDefaultClean.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;

  Alterado := False;

  Close;
end;

procedure TfrmDefaultClean.btnConfirmarClick(Sender: TObject);
begin
  Alterado := True;

  Close;
  ModalResult := mrOk;
end;

procedure TfrmDefaultClean.FormCreate(Sender: TObject);
begin
  inherited;
  btnConfirmar.Caption := 'F5 | Gravar';
  btnCancelar.Caption := 'F11 | Cancelar';
end;

procedure TfrmDefaultClean.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f5 then
    btnConfirmarClick(Self);
  if Key = vk_f11 then
    btnCancelarClick(Self);

end;

end.
