unit uWthas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, inifiles,

  // units adicionais obrigatórias -->

  uTInject.ConfigCEF, uTInject, uBotGestor,
  uTInject.Constant, uTInject.JS,
  uTInject.Console, uTInject.Diversos, uTInject.AdjustNumber, uTInject.Config,
  uTInject.Classes,

  // <--

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Tabs,
  FireDAC.Phys.IBBase, FireDAC.Comp.DataSet, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Inject1: TInject;
    DBGrid1: TDBGrid;
    Conexao: TFDConnection;
    qryLista: TFDQuery;
    FBDriver: TFDPhysFBDriverLink;
    dsLista: TDataSource;
    TabSet1: TTabSet;
    Image1: TImage;
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnIniciar: TSpeedButton;
    btnMsg: TSpeedButton;
    qryExecute: TFDQuery;
    qryListaCODIGO: TIntegerField;
    qryListaDATA: TDateField;
    qryListaMENSAGEM: TStringField;
    qryListaANEXO: TStringField;
    qryListaFONE: TStringField;
    qryListaSTATUS: TStringField;
    qryListaHORA: TTimeField;
    qryListaORIGEM: TStringField;
    qryListaNOME: TStringField;
    qryListaEMPRESA: TStringField;
    qryListaMENSAGEM_PADRAO: TMemoField;
    btnAtualiza: TSpeedButton;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure Inject1Connected(Sender: TObject);
    procedure Inject1Disconnected(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtualizaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure EnviarMensagem;
    procedure btnMsgClick(Sender: TObject);
  private
    gestor: TBotManager;
    procedure Iniciar;
    procedure filtrar;
    procedure UpdateMensagem(mensagem: string; codigo: integer);
    procedure Conectado;
    function BloqueiaValidade: boolean;
    { Private declarations }
  public
    vPodeFechar: boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: integer;
  KeyPos: integer;
  OffSet: integer;
  Dest, Key, KeyNew: String;
  SrcPos: integer;
  SrcAsc: integer;
  TmpSrcAsc: integer;
  Range: integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;

  Key := 'XNGREXCPAJHKQWERYTUIOP98756LKJHASFGMNBVCAXZ13450';

  KeyNew := 'PRODOXCPAJHKQWERYTUIOP98765LKJHASFGMNBVCAXZ01234';

  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 128;
  if (Action = UpperCase('C')) then
  begin
    // Randomize;
    OffSet := Range;
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if not vPodeFechar then
  begin
    Action := canone;
    Exit;
  end;

  if Application.messageBox('Tem Certeza de que deseja sair?', 'Confirmação',
    mb_YesNo) = mrNo then
    Action := canone;

  Inject1.Logtout;

  Inject1.ShutDown;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  iArq: TIniFile;
  nTentativas: word;
begin

  try

    nTentativas := 1;
    iArq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Banco.ini');

    Conexao.Params.Values['DriverID'] := 'FB';
    Conexao.Params.Values['Server'] := iArq.ReadString('BD', 'IP', '');
    Conexao.Params.Values['Database'] := iArq.ReadString('BD', 'Path', '');
    FBDriver.VendorLib := ExtractFilePath(Application.ExeName) + 'fbclient.dll';

    try
      Conexao.Connected := true;
    Except
      ShowMessage('Não foi possivel conectar na base de dados!');
      Application.Terminate;
    end;

  Finally
    iArq.Free;
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  filtrar;
  Conectado;
  vPodeFechar := true;
end;

procedure TForm1.Iniciar;
begin
  //

  gestor := TBotManager.Create(self);
  // gestor.OnInteracao := GestorInteracao;
  gestor.Simultaneos := 15;
  gestor.SenhaADM := 'ADM123';
  // Defina aqui a senha o administrador do chatBot
  gestor.TempoInatividade := (300 * 1000);

  if not Inject1.Auth(false) then
  begin
    Inject1.FormQrCodeType := Ft_Http;
    Inject1.FormQrCodeStart;
  end;

  if not Inject1.FormQrCodeShowing then
    Inject1.FormQrCodeShowing := true;
end;

procedure TForm1.Inject1Connected(Sender: TObject);
begin
  btnMsg.Enabled := true;
end;

procedure TForm1.Inject1Disconnected(Sender: TObject);
begin
  btnSair.Enabled := true;
end;

procedure TForm1.UpdateMensagem(mensagem: string; codigo: integer);
begin

  if mensagem = 'ERROS' then
  begin

    qryExecute.Close;
    qryExecute.SQL.Text :=
      'update mensagem_zap set status=:st, data=:data, hora=:hr where codigo=:codigo';
    qryExecute.Params[0].Value := 'ERRO';
    qryExecute.Params[1].AsDate := now;
    qryExecute.Params[2].AsTime := now;
    qryExecute.Params[3].Value := codigo;
    qryExecute.ExecSQL;

    Conexao.CommitRetaining;
  end
  else
  begin

    qryExecute.Close;
    qryExecute.SQL.Text :=
      'update mensagem_zap set status=:st, data=:data, hora=:hr where codigo=:codigo';
    qryExecute.Params[0].Value := 'ENVIADOS';
    qryExecute.Params[1].AsDate := now;
    qryExecute.Params[2].AsTime := now;
    qryExecute.Params[3].Value := codigo;
    qryExecute.ExecSQL;

    Conexao.CommitRetaining;

  end;

end;

procedure TForm1.Conectado;
begin
  if Inject1.IsConnected then
  begin
    btnIniciar.Enabled := false;
    btnMsg.Enabled := true;
    btnSair.Enabled := true;
    Timer2.Enabled := true;
  end
  else
  begin
    btnIniciar.Enabled := true;
    btnMsg.Enabled := false;
    btnSair.Enabled := true;
  end;
end;


procedure TForm1.TabSet1Click(Sender: TObject);
begin
  filtrar;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Inject1.IsConnected then
    EnviarMensagem;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := false;
  if not BloqueiaValidade then
    Timer1.Enabled := true;

end;

procedure TForm1.filtrar;
begin
  qryLista.Close;
  case TabSet1.TabIndex of
    3:
      qryLista.Params[0].AsString := '%'
  else
    qryLista.Params[0].AsString := UpperCase(TabSet1.Tabs[TabSet1.TabIndex]);
  end;
  qryLista.Open;

end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnAtualizaClick(Sender: TObject);
begin
  filtrar;
end;

procedure TForm1.btnIniciarClick(Sender: TObject);
begin
  try
    Iniciar;
    Conectado;
  except
    btnMsg.Enabled := true;
    raise Exception.Create
      ('Entre em contato com o suporte e peça atualização para o whatsapp!');
  end;

end;

procedure TForm1.btnMsgClick(Sender: TObject);
begin
  if qryLista.IsEmpty then
    Exit;

  vPodeFechar := true;

  try
    EnviarMensagem;

  finally
    btnMsg.Enabled := true;
  end;
end;

function Getcomputer: String;
var
  lpBuffer: pchar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function TForm1.BloqueiaValidade: boolean;
var
  DataValidade: TDate;
  idEmpresa: integer;
  FMsg: string;
begin

  Result := false;
 {
  qryExecute.Close;
  qryExecute.SQL.Text :=
    'SELECT coalesce(EMPRESA_ATIVA,0) AS EMPRESA_ATIVA FROM VENDAS_TERMINAIS WHERE NOME=:NOME';
  qryExecute.Params[0].Value := Getcomputer;
  qryExecute.Open;

  idEmpresa := qryExecute.FieldByName('EMPRESA_ATIVA').AsInteger;

  if idEmpresa = 0 then
  begin
    ShowMessage('Erro ao abrir o envio de mensagens fora do ERP!');
    Application.Terminate;
  end;

  qryExecute.Close;
  qryExecute.SQL.Text := 'SELECT DATA_VALIDADE FROM EMPRESA WHERE CODIGO=:COD';
  qryExecute.Params[0].Value := idEmpresa;
  qryExecute.Open;

  if (trim(qryExecute.FieldByName('DATA_VALIDADE').AsString) = '') or
    (qryExecute.FieldByName('DATA_VALIDADE').IsNull) then
    Result := true;

  try
    DataValidade := strtodate(Crypt('D', qryExecute.FieldByName('DATA_VALIDADE')
      .AsString));
  except
    Result := true;
  end;

  if (DataValidade < Date) then // data de validade vencida
    Result := true;

  if Result = true then
  begin
    FMsg := 'Sistema bloqueado, entre em contato com a revenda';
    ShowMessage(FMsg);
    Application.Terminate;
  end;
      }
end;

procedure TForm1.EnviarMensagem;
var
 i : integer;
 mensagem : string;
begin

  try

    TabSet1.TabIndex := 0;
    Timer1.Enabled := false;

    qryLista.Close;
    qryLista.Params[0].Value := 'PENDENTES';
    qryLista.Open;

    qryLista.First;

    i := 0;

    while not qryLista.Eof do
    begin

      i := i + 1;

      if qryLista.FieldByName('ORIGEM').AsString = 'RECEBER' then
        mensagem := 'Olá ' + Inject1.Emoticons.Sorridente + ' ' +
          qryLista.FieldByName('NOME').AsString + '.\n' + 'Aqui é da loja ' +
          qryLista.FieldByName('EMPRESA').AsString + '.\n' +
          qryLista.FieldByName('MENSAGEM_PADRAO').Value +
          '\n Parcelas em Aberto:\n' + qryLista.FieldByName('MENSAGEM')
          .AsString;

      if (qryLista.FieldByName('ORIGEM').AsString = 'ORCAMENTO') or
        (qryLista.FieldByName('ORIGEM').AsString = 'NFE') OR
        (qryLista.FieldByName('ORIGEM').AsString = 'CTE') OR
        (qryLista.FieldByName('ORIGEM').AsString = 'MDFE') OR
        (qryLista.FieldByName('ORIGEM').AsString = 'NFCE') then
        mensagem := 'Olá ' + Inject1.Emoticons.Sorridente + ' ' +
          qryLista.FieldByName('NOME').AsString + '.\n' + 'Aqui é da loja ' +
          qryLista.FieldByName('EMPRESA').AsString + '.\n' +
          qryLista.FieldByName('MENSAGEM').AsString;

      try

        Inject1.Send(qryLista.FieldByName('FONE').AsString, mensagem);

        if trim(qryLista.FieldByName('ANEXO').AsString) <> '' then
          Inject1.SendFile(qryLista.FieldByName('FONE').AsString,
            qryLista.FieldByName('ANEXO').AsString, mensagem);

        if i = 5 then
        begin
          Timer1.Enabled := true;
          Break;
        end;

        UpdateMensagem('ENVIADOS', qryListaCODIGO.Value);
      except
        UpdateMensagem('ERROS', qryListaCODIGO.Value);
      end;

      sleep(1000);

      Application.ProcessMessages;
      qryLista.Next;
    end;
  finally
    filtrar;
    Timer1.Enabled := true;

    if not qryLista.IsEmpty then
      vPodeFechar := true;

  end;
end;


end.

