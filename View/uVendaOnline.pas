unit uVendaOnline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, shellapi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFrmVendaOnline = class(TForm)
    Image1: TImage;
    procedure Label1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendaOnline: TFrmVendaOnline;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmVendaOnline.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Publicidade.png') then
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'Publicidade.png');

end;

procedure TFrmVendaOnline.Image1Click(Sender: TObject);
begin
  Label1Click(self);
end;

procedure TFrmVendaOnline.Label1Click(Sender: TObject);
var
  url: string;
  nchrome, nmozila, nie: string;
begin
  try
    nchrome := 'C:\Program Files (x86)\Google\Chrome\Application';
    url := dados.qryParametroLINK_VENDA.AsString;
    if FileExists(nchrome + '\chrome.exe') then // abre
      ShellExecute(handle, 'Open', 'chrome.exe', PChar(url), PChar(nchrome),
        SW_SHOWMAXIMIZED)
    else
      ShellExecute(Application.handle, nil, PChar(url), nil, nil,
        SW_SHOWMINIMIZED);
  finally
    Close;
  end;
end;

end.
