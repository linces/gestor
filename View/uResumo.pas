unit uResumo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSerial = class(TForm)
    Panel1: TPanel;
    btnSerial: TButton;
    edtSerial: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSerial: TfrmSerial;

implementation

{$R *.dfm}


procedure TfrmSerial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TfrmSerial.FormShow(Sender: TObject);
begin
  close;
end;

end.
