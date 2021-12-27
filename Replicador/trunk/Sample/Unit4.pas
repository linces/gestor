unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Winapi.PsAPI,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls, System.Win.Registry,
  Data.DB, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, IniFiles, Jpeg, Vcl.AppEvnts,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, Vcl.Imaging.pngimage, VclTee.TeeGDIPlus,
  VclTee.TeEngine, VclTee.TeeProcs, VclTee.Chart,
  VclTee.Series,
  FDZabuuReplicator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase;

type
  TForm4 = class(TForm)
    FDZabuuReplicator1: TFDZabuuReplicator;

    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    Label11: TLabel;
    lblTempo: TLabel;
    btAcao: TButton;
    PopupMenu1: TPopupMenu;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    ActionManager1: TActionManager;
    Action1: TAction;
    PopupMenu2: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    LimparLog1: TMenuItem;
    Chart1: TChart;
    Series1: TBarSeries;
    LimparCacheReplicador1: TMenuItem;
    ReplicadorConnection: TFDConnection;
    BancosTable: TFDTable;
    BancosTableID: TIntegerField;
    BancosTableDESCRICAO: TStringField;
    BancosTableHOST: TStringField;
    BancosTablePATH: TStringField;
    BancosTableUSUARIO: TStringField;
    BancosTableSENHA: TStringField;
    BancosTableROLE: TStringField;
    BancosTablePORT: TIntegerField;
    BancosTableENVIAR: TIntegerField;
    BancosTableRECEBER: TIntegerField;
    BancosTablePRIORIDADE: TSmallintField;
    BancosTableTABELASENVIA: TStringField;
    BancosTableTABELASRECEBE: TStringField;
    dsBancoTable: TDataSource;
    Timer2: TTimer;
    procedure CriarEstruturaReplicador2Click(Sender: TObject);
    procedure FDZabuuReplicator1Log(Value: string);
    procedure Button1Click(Sender: TObject);
    procedure RemoverEstrutura1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAcaoClick(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure tsConfigShow(Sender: TObject);
    procedure able1Click(Sender: TObject);
    procedure LimparLog1Click(Sender: TObject);
    procedure LimparCacheReplicador1Click(Sender: TObject);
    procedure tsScriptsShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure fnc_registraConfiguracoes;
    procedure fnc_lerConfiguracoes;
    procedure fnc_minimizarApp;
    procedure SetChart(Title: String; Value: Currency; Clear: Boolean = false);
    procedure isAdmin;
    procedure RunOnStartup(sProgTitle, sCmdLine: string; bRunOnce: Boolean);
    procedure AtualizaConfig;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.isAdmin();
var
  reg: TRegistry;
  openResult: Boolean;
begin
  reg := TRegistry.Create(KEY_READ);
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.Access := KEY_WRITE;
  openResult := reg.OpenKey('Software\MyCompanyName\MyApplication\', True);
  if openResult = True then
  begin
    RunOnStartup(Application.Title, Application.ExeName, false);
  end;
  reg.CloseKey();
  reg.Free;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: Word);
var
  VerInfoSize, VerValueSize, Dummy: DWord;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(Pchar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(Pchar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '''', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;
  Freemem(VerInfo, VerInfoSize);
end;

function GetVersionInfo: string;
var
  V1, V2, V3, V4: Word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  result := IntToStr(V1) + '.' + IntToStr(V2) + IntToStr(V3) + '.' +
    IntToStr(V4);
end;

procedure TForm4.able1Click(Sender: TObject);
var
  IdBancoOrigem, Table: string;
  Id: Integer;
begin
  Timer1.Enabled := false;

  IdBancoOrigem := InputBox('Banco de Origem',
    'Informe o Id do Banco que será o provedor dos dados:', '');
  if not TryStrToInt(IdBancoOrigem, Id) then
    raise Exception.Create('O Id Informado é Inválido');

  Table := InputBox('Tabela', 'Informe a Tabela a ser Replicada', '');
  if Table = '' then
    raise Exception.Create('É preciso informar uma tabela válida');

  TThread.CreateAnonymousThread(
    procedure
    begin
      FDZabuuReplicator1.BackupTable(Table, Id);
    end).Start;
  Application.ProcessMessages;
end;

procedure TForm4.Abrir1Click(Sender: TObject);
begin
  TrayIcon1.Visible := false;
  Show;
  WindowState := wsNormal;
  Application.BringToFront;
end;

procedure TForm4.Action1Execute(Sender: TObject);
begin
  btAcao.Visible := not btAcao.Visible;
end;

procedure TForm4.ApplicationEvents1Minimize(Sender: TObject);
begin
  fnc_minimizarApp;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin

  Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) +
    ' - VERIFICANDO CONEXÕES...');

  try

    Timer2.Enabled := false;
    AtualizaConfig;
    Timer1.Enabled := True;

    BancosTable.Active := false;
    if not BancosTable.Active then
      BancosTable.Active := True;

    TThread.CreateAnonymousThread(
      procedure
      begin
        FDZabuuReplicator1.Replicate;
      end).Start;

  except
    Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) +
      ' ----- ATENÇÃO ----- Banco do Replicador está OffLine');
  end;

end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
end;

procedure TForm4.btAcaoClick(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TForm4.CriarEstruturaReplicador2Click(Sender: TObject);
begin
  FDZabuuReplicator1.ApplyMetadataBankReplicator;
end;

procedure TForm4.FDZabuuReplicator1Log(Value: string);
begin
  Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) + ' - ' + Value);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fnc_registraConfiguracoes;

  if MessageDlg
    ('Deseja realmente finalizar a aplicação de Replicação? Esta ação deixara os banco de dados desatualizados!',
    mtconfirmation, [mbyes, mbno], 0) = mrnO then
    Action := canone
  else
    Application.terminate;

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Action1Execute(Sender);
  isAdmin;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

Procedure TForm4.AtualizaConfig;
begin
  try
    fnc_lerConfiguracoes;
    ReplicadorConnection.Params.Clear;
    ReplicadorConnection.Params.Database := FDZabuuReplicator1.Path;
    // Conexao.Params.Add('Protocol=TCPIP');
    ReplicadorConnection.Params.Add('Server=' + FDZabuuReplicator1.Host);
    ReplicadorConnection.Params.Add('Port=' + FDZabuuReplicator1.Port);
    ReplicadorConnection.Params.UserName := FDZabuuReplicator1.User;
    ReplicadorConnection.Params.Password := FDZabuuReplicator1.Password;
    FDZabuuReplicator1.Chart(SetChart);
    lblTempo.Caption := IntToStr(TrackBar1.Position) + ' minutos';
    // fnc_minimizarApp;
  except
    Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) +
      ' ----- ATENÇÃO ----- Banco do Replicador está OffLine');
  end;
end;

procedure TForm4.RunOnStartup(sProgTitle, sCmdLine: string; bRunOnce: Boolean);
var
  sKey: string;
  reg: TRegIniFile;
begin
  if bRunOnce then
    sKey := 'Once'
  else
    sKey := '';
  reg := TRegIniFile.Create('');
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.WriteString('Software\Microsoft\Windows\CurrentVersion\Run' + sKey + #0,
    sProgTitle, sCmdLine);
  reg.Free;
end;

procedure TForm4.LimparCacheReplicador1Click(Sender: TObject);
begin
  FDZabuuReplicator1.ClearReplicateBank;
end;

procedure TForm4.LimparLog1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm4.RemoverEstrutura1Click(Sender: TObject);
begin
  FDZabuuReplicator1.removeReplicationStructure;
end;

procedure TForm4.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm4.SetChart(Title: String; Value: Currency;
Clear: Boolean = false);
begin
  if Clear then
    Chart1.Series[0].Clear
  else
    Chart1.Series[0].AddY(Value, Title);
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  try
    Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) +
      ' - VERIFICANDO CONEXÕES...');
    if not BancosTable.Active then
      BancosTable.Active := True;

    FDZabuuReplicator1.Replicate;
    Application.ProcessMessages;
  except
    Memo1.Lines.Add(FormatDateTime('hh:nn:ss', now) +
      ' ----- ATENÇÃO ----- Banco do Replicador está OffLine');
  end;

end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := false;
  AtualizaConfig;
  Timer1.Enabled := True;
end;

procedure TForm4.TrackBar1Change(Sender: TObject);
begin
  Timer1.Interval := (TrackBar1.Position * 60000);
  lblTempo.Caption := IntToStr(TrackBar1.Position) + ' minutos';
end;

procedure TForm4.tsConfigShow(Sender: TObject);
begin
  if not BancosTable.Active then
    BancosTable.Active := True;
end;

procedure TForm4.tsScriptsShow(Sender: TObject);
begin
  if not BancosTable.Active then
    BancosTable.Active := True;
end;

procedure TForm4.fnc_lerConfiguracoes;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Banco.Ini');
  try
    TrackBar1.Position := Ini.ReadInteger('REPLICACAO', 'INTERVALO', 1);
    FDZabuuReplicator1.Limit := Ini.ReadInteger('REPLICACAO', 'LIMITE', 50);
    FDZabuuReplicator1.ApplicationName := Ini.ReadString('REPLICACAO',
      'APLICACAO', 'Replicador.exe');
    FDZabuuReplicator1.Host := 'localhost';
    // Ini.ReadString('REPLICACAO', 'SERVIDOR', 'localhost');
    FDZabuuReplicator1.Password := 'masterkey';
    // Ini.ReadString('REPLICACAO', 'SENHA', 'masterkey');
    FDZabuuReplicator1.User := 'SYSDBA';
    // Ini.ReadString('REPLICACAO', 'USUARIO','SYSDBA');
    FDZabuuReplicator1.Path := ExtractFileDir(Application.ExeName) +
      '\DADOS\REPLICADOR.FDB';
    FDZabuuReplicator1.Port := Ini.ReadString('REPLIICACAO', 'PORTA', '3050');
    FDZabuuReplicator1.VendorLib := Ini.ReadString('REPLICACAO',
      'VENDORLIB', '');

  finally
    Ini.Free;
  end;

end;

procedure TForm4.fnc_minimizarApp;
begin
  Self.Hide;
  Self.WindowState := wsMinimized;
  TrayIcon1.Visible := True;
end;

procedure TForm4.fnc_registraConfiguracoes;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Banco.Ini');
  try
    Ini.WriteInteger('REPLICACAO', 'INTERVALO', TrackBar1.Position);
    Ini.WriteInteger('REPLICACAO', 'LIMITE', FDZabuuReplicator1.Limit);
    Ini.WriteString('REPLICACAO', 'APLICACAO',
      FDZabuuReplicator1.ApplicationName);
    // Ini.WriteString('REPLICACAO', 'SERVIDOR', FDZabuuReplicator1.Host);
    // Ini.WriteString('REPLICACAO', 'SENHA', FDZabuuReplicator1.Password);
    Ini.WriteString('REPLICACAO', 'PORTA', FDZabuuReplicator1.Port);
    // Ini.WriteString('REPLICACAO', 'USUARIO', FDZabuuReplicator1.User);
    Ini.WriteString('REPLICACAO', 'VENDORLIB', FDZabuuReplicator1.VendorLib);
  finally
    Ini.Free;
  end;
end;

end.
