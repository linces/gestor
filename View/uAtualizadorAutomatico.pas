unit uAtualizadorAutomatico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.zip,
  Vcl.Buttons, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, IdHTTP, IdAntiFreeze, Vcl.Menus;

type
  TFrmAtualiza = class(TForm)
    IdHTTP: TIdHTTP;
    Panel1: TPanel;
    Label1: TLabel;
    pbDownload: TProgressBar;
    lbStatus: TLabel;
    pmMenu: TPopupMenu;
    RestaurarAplicao1: TMenuItem;
    N5: TMenuItem;
    SairdaAplicao1: TMenuItem;
    btnDepois: TBitBtn;
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btnDepoisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SairdaAplicao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FnTamanhoTotal: integer;
    sNomeArquivoAtualizacao: string;
    UrlUpdate: string;
    FAtualizaUpdate: Boolean;

    fnDate: string;
    function ObterDiretorioDoExecutavel: string;
    procedure DescompactarAtualizacao(sNomeArquivo: string);
    procedure Carrega;
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure BaixarUpdate;
    procedure FUpdate;
    procedure AlteraFrente;
    procedure AlteraReguarda;
    function GetHandleOnTaskBar: THandle;
    procedure BaixaAtualizacao;

  public
    vPodeFechar: Boolean;
    function PodeAtualizar: Boolean;
  end;

var
  FrmAtualiza: TFrmAtualiza;

implementation

uses
  IdException,
  // declarada para usar a função "InternetGetConnectedState"
  WinInet,
  // declarada para acessar os arquivos INI
  IniFiles,
  // declarada para executar a linha de comando do 7-zip
  ShellAPI, Udados;

{$R *.dfm}
{ TForm1 }

function TFrmAtualiza.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
  resultado: real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  Result := FormatFloat('0%', resultado);
end;

function TFrmAtualiza.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado: real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result := FormatFloat('0.000 KBs', resultado);
end;

Function TFrmAtualiza.GetHandleOnTaskBar: THandle;
Begin
{$IFDEF COMPILER11_UP}
  If Application.MainFormOnTaskBar And Assigned(Application.MainForm) Then
    Result := Application.MainForm.Handle
  Else
{$ENDIF COMPILER11_UP}
    Result := Application.Handle;
End;

procedure TFrmAtualiza.SairdaAplicao1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAtualiza.Carrega;
begin
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'atualiza.zip';
end;

function TFrmAtualiza.PodeAtualizar: Boolean;
var
  DataBloqueio: TDate;
begin

  Result := False;
  FAtualizaUpdate := False;

  Carrega;
  FUpdate;

  if (FAtualizaUpdate) then
    Result := True;

end;

procedure TFrmAtualiza.FUpdate;
var
  DataExe: string;
begin
  try
    if (trim(Dados.qryTerminal.FieldByName('DT_VERSAO').Value) = '') or
      (Dados.qryTerminal.FieldByName('DT_VERSAO').IsNull) then
      DataExe := DateToStr(Date - 1000)
    else
      DataExe := Dados.qryTerminal.FieldByName('DT_VERSAO').Value;
  except
    DataExe := DateToStr(Date - 1000);
  end;
  try
    IdHTTP.Head(UrlUpdate);
    fnDate := FormatDateTime('dd/mm/yyyy hh:mm:ss',
      IdHTTP.Response.LastModified);
  except
    on e: EIdHttpProtocolException do
    begin
      FAtualizaUpdate := False;
      fnDate := '';
    end;
  end;
  if fnDate <> '' then
  begin
    if StrToDateTime(DataExe) < StrToDateTime(fnDate) then
      FAtualizaUpdate := True
    else
      ShowMessage('Versão já está atualizada!');

  end;
end;

function ZipFileDecompress(FZipfile, APath: string): integer;
var
  z: TZipFile;
begin
  Result := 0;
  z := TZipFile.Create;
  try
    if FileExists(FZipfile) then
      z.Open(FZipfile, zmReadWrite)
    else
      raise exception.Create('Não encontrei: ' + FZipfile);
    z.ExtractAll(APath);
    z.Close;
    Result := 1;
  finally
    z.Free;
  end;
end;

procedure TFrmAtualiza.DescompactarAtualizacao(sNomeArquivo: string);
begin
  try
    ZipFileDecompress(sNomeArquivo, ObterDiretorioDoExecutavel);
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;
end;

procedure TFrmAtualiza.FormCreate(Sender: TObject);
begin
  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  Carrega;

end;

procedure TFrmAtualiza.FormShow(Sender: TObject);
begin
  if not Dados.qryParametro.Active then
    Dados.qryParametro.Open;
  UrlUpdate := Dados.qryParametroFTP_SERVIDOR.Value;
end;

procedure TFrmAtualiza.BaixarUpdate;
var
  fileDownload: TFileStream;
  // idant: TIdAntiFreeze;
begin
  // idant := TIdAntiFreeze.Create(nil);
  Label1.Caption := 'Aguarde!!! Baixando Arquivos...';
  fileDownload := TFileStream.Create(ObterDiretorioDoExecutavel + 'atualiza' +
    ExtractFileExt(UrlUpdate), fmCreate);
  try
    pbDownload.Visible := True;
    lbStatus.Visible := True;
    Label1.Visible := True;
    try
      IdHTTP.Get(UrlUpdate, fileDownload);
    except
      FAtualizaUpdate := False;
      fnDate := '';
    end;
  finally
    FreeAndNil(fileDownload);
    AlteraFrente;
    AlteraReguarda;
    DescompactarAtualizacao(sNomeArquivoAtualizacao);
  end;
end;

procedure TFrmAtualiza.btnDepoisClick(Sender: TObject);
begin
  try
    btnDepois.Enabled := False;
    BaixaAtualizacao;
  finally
    btnDepois.Enabled := True;
  end;
end;

procedure TFrmAtualiza.AlteraFrente;
var
  arquivo: string;
begin

  arquivo := ExtractFilePath(Application.ExeName) + 'Frente.exe';

  if FileExists(arquivo + '(a)') then
    DeleteFile(arquivo + '(a)');

  RenameFile(arquivo, arquivo + '(a)');
end;

procedure TFrmAtualiza.BaixaAtualizacao;
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin
  if not PodeAtualizar then
    exit;

  Label1.Caption := 'Baixando...';
  lbStatus.Caption := 'Aguarde...';
  Application.ProcessMessages;

  // processa a atualização
  if FAtualizaUpdate then
    BaixarUpdate;

  if fnDate <> '' then
  begin
    Dados.qryTerminal.Edit;
    Dados.qryTerminal.FieldByName('DT_VERSAO').Value := DateTimeToStr(now);
    Dados.qryTerminal.Post;
    Dados.Conexao.CommitRetaining;
  end;

  Label1.Caption := '';

end;

procedure TFrmAtualiza.AlteraReguarda;
var
  arquivo: string;
begin
  arquivo := ExtractFilePath(Application.ExeName) + '\Retaguarda.exe';

  if FileExists(arquivo + '(a)') then
    DeleteFile(arquivo + '(a)');

  RenameFile(arquivo, arquivo + '(a)');
end;

procedure TFrmAtualiza.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin
  if FnTamanhoTotal = 0 then
    exit;

  // obtém o tamanho total do arquivo em bytes
  nTamanhoTotal := FnTamanhoTotal div 1024;

  // obtém a quantidade de bytes já baixados
  nTransmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  nPorcentagem := (nTransmitidos * 100) / nTamanhoTotal;

  // atualiza o componente TLabel com a porcentagem
  lbStatus.Caption := 'Download: ' + format('%s%%',
    [FormatFloat('##0', nPorcentagem)]);

  Label1.Caption := Label1.Caption;

  // atualiza a barra de preenchimento do componente TProgressBar
  pbDownload.Position := AWorkCount div 1024;

  // processa as mensagens pendentes do sistema para atualizar os componentes
  Application.ProcessMessages;
end;

procedure TFrmAtualiza.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pbDownload.Max := FnTamanhoTotal div 1024;
end;

procedure TFrmAtualiza.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  pbDownload.Position := AWorkCount;
  lbStatus.Caption := 'Taxa de Transferência:' + RetornaKiloBytes(AWorkCount);
  Caption := 'Download em ... ' + RetornaPorcentagem(pbDownload.Max,
    AWorkCount);

  Label1.Caption := Label1.Caption;
  Application.ProcessMessages;
end;

procedure TFrmAtualiza.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pbDownload.Max := AWorkCountMax;
end;

procedure TFrmAtualiza.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  pbDownload.Position := 0;
  Caption := 'Finalizado ...';
  lbStatus.Caption := 'Download Finalizado ...';
  pbDownload.Visible := False;
  Label1.Visible := False;

  Label1.Caption := '';

  ShowMessage(lbStatus.Caption);

  IdHTTP.Disconnect;

  Application.ProcessMessages;

  Close;

end;

function TFrmAtualiza.ObterDiretorioDoExecutavel: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

end.
