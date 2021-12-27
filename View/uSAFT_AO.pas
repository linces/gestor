unit uSAFT_AO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TFrmSaft_ao = class(TForm)
    Label3: TLabel;
    dtIni: TDateTimePicker;
    Label4: TLabel;
    dtFim: TDateTimePicker;
    Panel2: TPanel;
    btnExecute: TSpeedButton;
    btnSair: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSaft_ao: TFrmSaft_ao;

implementation

{$R *.dfm}

end.
