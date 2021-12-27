unit U_Backup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.Comp.UI;

type
  TfrmBackup = class(TForm)
    op: TOpenDialog;
    Panel1: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    btnSair: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    edtbanco: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Memo: TMemo;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    IBBackup: TFDIBBackup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function tbDriveLetters: string;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure IBBackupProgress(ASender: TFDPhysDriverService;
      const AMessage: string);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmBackup.BitBtn1Click(Sender: TObject);
begin
  try
    try
      Memo.Lines.Clear;
      BitBtn1.Enabled := false;
      if (trim(edtbanco.Text) <> '') and (ComboBox1.Text <> '') and
        (trim(Edit2.Text) <> '') then
      begin
        IBBackup.UserName := dados.Conexao.Params.Values['User_Name'];
        IBBackup.Password := dados.Conexao.Params.Values['Password'];
        IBBackup.Host := dados.Conexao.Params.Values['Server'];
        IBBackup.Protocol := ipTCPIP;

        IBBackup.Database := dados.Conexao.Params.Values['Database'];
        IBBackup.BackupFiles.Add(ComboBox1.Text + Edit2.Text);

        IBBackup.Backup;
        Memo.Lines.Add('Backup concluído com sucesso!');

      end;
    except
      on e: Exception do
        ShowMessage('Erro a gerar backup' + sLineBreak + e.Message);
    end;
  finally
    BitBtn1.Enabled := true;
  end;

end;

procedure TfrmBackup.ComboBox1Change(Sender: TObject);
begin

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'backup') then
    CreateDir(ExtractFilePath(Application.ExeName) + 'backup');
  if ComboBox1.Text = 'C:' then
  begin
    Edit2.Text := '\' + copy(ExtractFileDir(Application.ExeName), 4, 10000) +
      '\backup\' + FormatDateTime('dd MM hh nn ss', now) + '.fbk'
  end
  else
    Edit2.Text := '\' + FormatDateTime('dd MM hh nn ss', now) + '.fbk';
end;

function TfrmBackup.tbDriveLetters: string;
var
  Drives: LongWord;
  I: byte;
begin
  Result := '';
  Drives := GetLogicalDrives;
  if Drives <> 0 then
    for I := 65 to 90 do
      if ((Drives shl (31 - (I - 65))) shr 31) = 1 then
        ComboBox1.Items.Add(Char(I) + ':');
end;

procedure TfrmBackup.FormShow(Sender: TObject);
var
  I: integer;
begin

  tbDriveLetters;
  ComboBox1.ItemIndex := 0;
  ComboBox1.Text := 'C:';
  Edit2.Text := '\' + copy(ExtractFileDir(Application.ExeName), 4, 10000) +
    '\backup\' + FormatDateTime('dd MM hh nn ss', now) + '.fbk';
  edtbanco.Text := dados.Conexao.Params.Values['database'];

end;

procedure TfrmBackup.IBBackupProgress(ASender: TFDPhysDriverService;
  const AMessage: string);
begin
  Memo.Lines.Add(AMessage);
end;

procedure TfrmBackup.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmBackup.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnSairClick(self);

  if Key = vk_f10 then
    BitBtn1Click(self);
end;

procedure TfrmBackup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

end.
