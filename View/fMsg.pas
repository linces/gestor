unit fMsg;
{
  Formuário principal do programa
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, System.Notification, Vcl.OleCtrls, SHDocVw;

type
  TfmMSG = class(TForm)
    Memo_Msg: TRichEdit;
    StatusLBL: TLabel;
    TrayIcon1: TTrayIcon;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ExibirMensagem(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StatusLBLClick(Sender: TObject);
  private
    { Private declarations }
    FDef_Caption:String;
    FDef_LoadFromFile:String;
    FDef_Text:String;
    FDelete_After:Boolean;
    FMax_Height:Cardinal;
    FMax_Width:Cardinal;
    FTimeToClose: TDateTime;
    FTerminate: Boolean;
    FOnMinimize: TNotifyEvent;
    procedure GetApp_Params(var AList:TStringList; AClearBefore:Boolean=true);
    procedure SairToTray(Sender: TObject);
  public
    { Public declarations }
  published
    property Def_Caption:String read FDef_Caption write FDef_Caption;
    property Def_LoadFromFile:String read FDef_LoadFromFile write FDef_LoadFromFile;
    property Def_Text:String read FDef_Text write FDef_Text;
    property Delete_After:Boolean read FDelete_After write FDelete_After;
    property TimeToClose:TDateTime read FTimeToClose;
    property Terminate:Boolean read FTerminate;
    procedure AddSeconds(iSeconds:Integer);

  end;

var
  fmMSG: TfmMSG;
  FDef_Caption:String='Como usar este programa:';

const
  MSG_MIN_LENGTH=120;
  MSG_TO_CLOSE='Clique aqui para fechar';
  _TIMER_PULSE=1000;

implementation
uses
  StrUtils,
  DateUtils,
  ShellAPI,
  utils_shell,
  utils_strfun;
{$R *.dfm}

procedure TfmMSG.SairToTray(Sender: TObject);
begin
  TrayIcon1.BalloonFlags:=bfInfo;
  TrayIcon1.IconIndex:=0;
  TrayIcon1.Visible:=false;
end;

procedure TfmMSG.StatusLBLClick(Sender: TObject);
begin
  if Timer1.Enabled then
  begin
    Timer1.Enabled:=false;
    StatusLBL.Caption:='Autofechamento desligado, feche essa janela manualmente.';
  end
  else
  begin
    AddSeconds(30);
  end;
end;

procedure TfmMSG.Timer1Timer(Sender: TObject);
begin
  //Timer1.Enabled:=false;
  if (FTimeToClose>now) and (FTimeToClose>IncDay(date, -1)) then
  begin
    if Self.Showing then
    begin
      StatusLBL.Caption:=' Desapare�o em '+IntToStr(SecondsBetween(now,TimeToClose))+' segundos';
    end;
  end;
  if (FTimeToClose<now) then
  begin
     FTerminate:=true;
     Close;
  end;
  //Timer1.Enabled:=true;
end;

procedure TfmMSG.ExibirMensagem(Sender: TObject);
begin
  if Self.Showing then
  begin
    Hide;
  end
  else
  begin
    if Pos('.htm',lowercase(ExtractFileExt(FDef_LoadFromFile)))>0 then
    begin
      utils_shell.AbrirArquivoAsIE(FDef_LoadFromFile);
    end
    else
    begin
      Show;
    end;
  end;
end;

procedure TfmMSG.GetApp_Params(var AList:TStringList; AClearBefore:Boolean=true);
var
  sParamLine, sParamName, sParamValue:String;
  nParamCount, i: Integer;
  procedure Avaliar(AParamLine:String; var AParam_Name:String; var AParam_Value:String);
  var
    nPos:Integer;
  begin
    nPos:=Pos('=',AParamLine);
    if nPos>0 then
    begin
      AParam_Name:=UPPERCASE(Trim(Copy(AParamLine,1,nPos-1)));
      AParam_Value:=Trim(Copy(AParamLine,nPos+1, Length(AParamLine)));
      if (LeftStr(AParam_Value,1)='''') and (RightStr(AParam_Value,1)='''') then
        AParam_Value:=Copy(AParam_Value,2,Length(AParam_Value)-2);
      if (LeftStr(AParam_Value,1)='"') and (RightStr(AParam_Value,1)='"') then
        AParam_Value:=Copy(AParam_Value,2,Length(AParam_Value)-2);
    end
    else
    begin
      AParam_Name:=UPPERCASE(Trim(AParamLine));
      AParam_Value:='';
    end;
  end;

begin
  if AClearBefore then
    AList.Clear;
  nParamCount:=ParamCount;
  for i:=1 to nParamCount do
  begin
    sParamLine:=ParamStr(i);
    Avaliar(sParamLine, sParamName, sParamValue);
    if LeftStr(sParamName,1)='-' then
      sParamName:=RightStr(sParamName, Length(sParamName)-1);
    if sParamName<>'' then
    begin
      AList.Values[sParamName]:=sParamValue;
    end;
  end;
end;

procedure TfmMSG.AddSeconds(iSeconds: Integer);
begin
  Timer1.Enabled:=false;
  Timer1.Interval:=_TIMER_PULSE;
  if iSeconds<=0 then  // Infinito
  begin
    // permanece com o timer desligado
  end;
  if iSeconds>0 then  // Adiciona segundos ao tempo atual
  begin
    FTimeToClose:=IncSecond(now, iSeconds);
    StatusLBL.Visible:=true;
    Timer1.Enabled:=true;
  end;

end;

procedure TfmMSG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTerminate:=true;
  if (FDelete_After) and (FileExists(FDef_LoadFromFile)) then
  begin
    DeleteFile(FDef_LoadFromFile);
  end;
end;

procedure TfmMSG.FormCreate(Sender: TObject);
var
  sParam_Name, sParam_Value, sTempVar:String;
  L:TStringList;
  i, iLen, iHeight, iWidth:Cardinal;
begin
  //
  FTerminate:=false;
  FDelete_After:=false;
  StatusLBL.Visible:=false;
  Self.Caption:=FDef_Caption;

  // BallonFlags: Informa o tipo do bal�o que o ícone vai exibir
  // BallonHint: A mensagem que o bal�o exibir
  // BallonTimeout: O tempo que ele ficar exibido em milisegundos
  // BallonTitle: T��tulo da mensagem
  // Icon: Icone a ser exibido
  // Visible: se ser� mostrado ou n�o.
  TrayIcon1.BalloonFlags:=bfInfo;
  TrayIcon1.IconIndex:=0;
  TrayIcon1.Visible:=true;
  Timer1.Interval:=_TIMER_PULSE;
  Timer1.Enabled:=false;
  //
  //WebBrowser1.Visible:=false;

  //
  Memo_Msg.ScrollBars:=ssBoth;
  Memo_Msg.Clear;
  Memo_Msg.Lines.Add(
    'Este programa serve para exibir mensagens na tela, geralmente usado com scripts '+
    '(bat/cmd/vbs/...) para exibir mensagens na tela.'+sLineBreak+
    'Atrav�s de um parametro -C tamb�m � possivel definir a dura��o em segundos que a mensagem '+
    'dever� desaparecer.');
  Memo_Msg.Lines.Add('As op��es dispon�veis s�o:');
  Memo_Msg.Lines.Add('-DEL=Apaga o arquivo ap�s a exibi��o ');
  Memo_Msg.Lines.Add('-MSG=Mensagem Texto ');
  Memo_Msg.Lines.Add('   A mensagem a ser exibida, se ela for de at� 120 caracteres ser� exibida no system tray do Windows.');
  Memo_Msg.Lines.Add('-I=Arquivo ou -INPUT=Arquivo');
  Memo_Msg.Lines.Add('   A mensagem a ser exibida ser� carregada a partir de um arquivo definido.');
  Memo_Msg.Lines.Add('   S�o aceitos arquivos .TXT ou .RTF.');
  Memo_Msg.Lines.Add('-C=Titulo da janela ou -CAPTION=Titulo da Janela');
  Memo_Msg.Lines.Add('   A Mensagem ou texto a ser exibido como titulo da janela.');
  Memo_Msg.Lines.Add('-T=TempoSegundos ou -TIME=TempoSegundos');
  Memo_Msg.Lines.Add('  Autofecha a janela ap�s a quantidade de segundos que for definida.');
  // Parametros
  L:=TStringList.Create;
  GetApp_Params(L, true);

  sParam_Name:='MSG';
  if (L.IndexOfName(sParam_Name)>=0) then
  begin
    sParam_Value:=UPPERCASE(L.Values[sParam_Name]);
    if FileExists(sParam_Value) then
    begin
      FDef_LoadFromFile:=sParam_Value;
    end
    else
    begin
      FDef_Text:=sParam_Value;
    end;
  end;

  sParam_Name:='DEL';
  if (L.IndexOfName(sParam_Name)>=0) then
  begin
    FDelete_After:=true;
    sParam_Value:=UPPERCASE(L.Values[sParam_Name]);
    if Pos(sParam_Value,'NAO,NO,FALSE,')>0 then
      FDelete_After:=false;
  end;

  sParam_Name:='C';     // --CAPTION
  if (L.IndexOfName(sParam_Name)>=0) then
  begin
    sParam_Value:=UPPERCASE(L.Values[sParam_Name]);
    if sParam_Value<>'' then
      FDef_Caption:=sParam_Value;
  end;

  sParam_Name:='I'; // -INPUT
  if (L.IndexOfName(sParam_Name)>=0) then
  begin
    sParam_Value:=UPPERCASE(L.Values[sParam_Name]);
    if FileExists(sParam_Value) then
    begin
      FDef_LoadFromFile:=sParam_Value;
    end;
  end;

  sParam_Name:='T'; // -TIME
  if (L.IndexOfName(sParam_Name)>=0) then
  begin
    sParam_Value:=Trim(L.Values[sParam_Name]);
    if StrToIntDef(sParam_Value,0)>0 then
    begin
      i:=StrToIntDef(sParam_Value,30);
      AddSeconds(i);
    end;
  end;

  if (FDef_Text<>'') then
  begin
    Memo_Msg.Text:=FDef_Text;
  end;

  if FDef_Caption<>'' then
  begin
    Memo_Msg.Lines.Insert(0, FDef_Caption);
    Self.Caption:=FDef_Caption;
  end;

  if (FDef_LoadFromFile<>'') then
  begin
    if FileExists(FDef_LoadFromFile) then
    begin
      Memo_Msg.Lines.LoadFromFile(FDef_LoadFromFile);
      if FDef_Caption<>'' then
      begin
        Memo_Msg.Lines.Insert(0, FDef_Caption);
      end;
    end
    else
    begin
      Memo_Msg.Lines.Add(FDef_LoadFromFile);
      if FDef_Caption<>'' then
      begin
        Memo_Msg.Lines.Insert(0, FDef_Caption);
      end;
    end;
  end;

  //
  TrayIcon1.Hint:=Def_Caption+sLineBreak+Def_Text;
  TrayIcon1.BalloonHint:=Def_Text;
  TrayIcon1.BalloonTitle:=Def_Caption;
  //TrayIcon1.BalloonTimeout:=xxx;
  // Maximos
  FMax_Height:=(Screen.Height div 3);
  FMax_Width:=(Screen.Width div 2);

  iHeight:=(Memo_Msg.Lines.Count*(Self.Canvas.TextHeight(Memo_Msg.Text)));
  iLen:=Length(Memo_Msg.Lines[0]);
  iWidth:=80;
  for i := 0 to Pred(Memo_Msg.Lines.Count) do
  begin
    sTempVar:=Memo_Msg.Lines[i];
    iLen:=Length(sTempVar);
    if iLen>iWidth then
      iWidth:=iLen;
    Application.ProcessMessages;
  end;
  iWidth:=(iWidth*(Self.Canvas.TextWidth('O')));

  if iHeight>FMax_Height then
    iHeight:=FMax_Height;
  if iWidth>FMax_Width then
    iWidth:=FMax_Width;

  Self.Height:=iHeight;
  Self.Width:=iWidth;
  Memo_Msg.ScrollBars:=ssVertical;

  if Assigned(L) then
    FreeAndNil(L);
end;

procedure TfmMSG.FormShow(Sender: TObject);
begin
  Application.OnMinimize := SairToTray;
end;

end.
