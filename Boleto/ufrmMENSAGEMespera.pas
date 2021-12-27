unit ufrmMensagemEspera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ExtCtrls, StdCtrls, JvExControls, JvLabel;

type
  TfrmMENSAGEMespera = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    imgIcone: TImage;
    lblMensagem: TJvLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    WindowsList: TTaskWindowList;
  public
  end;

var
  frmMENSAGEMespera: TfrmMENSAGEMespera;

procedure AbrirEspera(AOwner: TComponent; const AMensagem: string; const ATempo:Integer = 0);
procedure FecharEspera;

implementation

{$R *.dfm}
procedure AbrirEspera(AOwner: TComponent; const AMensagem: string; const ATempo:Integer = 0);
begin
  if frmMensagemEspera <> nil then
  begin
    if frmMensagemEspera.ShowHint then
      frmMensagemEspera.Hide;

    frmMensagemEspera.lblMensagem.Caption := AMensagem;
    frmMensagemEspera.Show;
  end
  else
  begin
    frmMensagemEspera                     := TfrmMensagemEspera.Create(AOwner);
    frmMensagemEspera.WindowsList         := DisableTaskWindows(frmMensagemEspera.Handle);
    frmMensagemEspera.lblMensagem.Caption := AMensagem;
    frmMensagemEspera.Show;
  end;

  frmMensagemEspera.Width := 110 + (Length(Trim(AMensagem)) * 8);
  frmMensagemEspera.Update;
  frmMensagemEspera.BringToFront;
  frmMensagemEspera.Position := poOwnerFormCenter;

  Application.ProcessMessages;

  Sleep(ATempo * 1000);
end;

procedure FecharEspera;
begin
  if frmMensagemEspera <> nil then
  begin
    if frmMensagemEspera.WindowsList <> nil then
      EnableTaskWindows(frmMensagemEspera.WindowsList);

    FreeAndNil(frmMensagemEspera);
  end;
end;

procedure TfrmMENSAGEMespera.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

end.
