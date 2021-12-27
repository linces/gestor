unit uScript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmScript = class(TForm)
    qryParametro: TFDQuery;
    qryParametroVERSAO: TIntegerField;
    qryParametroDATA_SCRIPT: TDateField;
    qryParametroESTILO: TStringField;
    qryParametroLINK_TREINAMENTO: TStringField;
    qryParametroTITULO_SISTEMA: TStringField;
    qryParametroSUB_TITULO_SISTEMA: TStringField;
    qryParametroEMAIL_SUPORTE: TStringField;
    qryParametroSITE: TStringField;
    qryParametroFONE1: TStringField;
    qryParametroFONE2: TStringField;
    qryParametroCONTATO: TStringField;
    qryConsulta: TFDQuery;
    IBScript: TFDScript;
    Panel2: TPanel;
    MemoSql: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    lblMsg: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    procedure ExecuteScript;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScript: TfrmScript;

implementation

{$R *.dfm}

uses Udados, U_Backup;

procedure TfrmScript.Button1Click(Sender: TObject);
begin
  try
    lblMsg.Caption := '';
    frmBackup := TfrmBackup.Create(Application);
    frmBackup.ShowModal;
  finally
    frmBackup.Release;
    ExecuteScript;
  end;
end;

procedure TfrmScript.ExecuteScript;
begin
  try
    IBScript.ExecuteScript(MemoSql.Lines);
    Dados.Conexao.CommitRetaining;
    ShowMessage('SQL executado com sucesso!');
  except
    on e: exception do
      ShowMessage(e.Message);
  end;
end;

end.
