unit uAtualizadorAutomatico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.zip,
  Vcl.Buttons, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, IdHTTP, IdAntiFreeze;

type
  TFrmAtualiza = class(TForm)
    btnAtualizacao: TBitBtn;
    Bevel1: TBevel;
    pbDownload: TProgressBar;
    lbStatus: TLabel;
    dsEmpresa: TDataSource;
    Image1: TImage;
    Label1: TLabel;
    IdHTTP: TIdHTTP;
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure btnAtualizacaoClick(Sender: TObject);
    procedure IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormShow(Sender: TObject);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);

  private
    FnTamanhoTotal: integer;
    sNomeArquivoAtualizacao: string;

    FAtualizaUpdate, FAtualizaFrente, FAtualizaRetaguarda: Boolean;

    fnDate: string;
    function ObterDiretorioDoExecutavel: string;
    procedure DescompactarAtualizacao;
    procedure Carrega;
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    procedure BaixarUpdate;
    procedure BaixarFrente;
    procedure BaixarRetaguarda;
    procedure FUpdate(var Result: Boolean);
    procedure FFrente(var Result: Boolean);
    procedure FRetaguarda(var Result: Boolean);

  public
    vPodeFechar: Boolean;
    function PodeAtualizar: Boolean;
  end;

var
  FrmAtualiza: TFrmAtualiza;

const
  UrlUpdate: string = 'http://br900.teste.website/~prodoc65/update/update.zip';
  UrlFrente: string = 'http://br900.teste.website/~prodoc65/update/Frente.exe';
  UrlRetaguarda
    : string = 'http://br900.teste.website/~prodoc65/update/Retaguarda.exe';

implementation

uses
  IdException,
  // declarada para usar a função "InternetGetConnectedState"
  WinInet,
  // declarada para acessar os arquivos INI
  IniFiles,
  // declarada para executar a linha de comando do 7-zip
  ShellAPI, Udados, uDadosWeb;

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

procedure TFrmAtualiza.Carrega;
begin
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'update.zip';
end;

function TFrmAtualiza.PodeAtualizar: Boolean;
var
  DataBloqueio: TDate;
begin

  Result := false;
  FAtualizaUpdate := false;
  FAtualizaFrente := false;
  FAtualizaRetaguarda := false;

  if Dados.crypt('D', Dados.qryEmpresaCSENHA.asString) = 'S' then
  begin
    // verifica se empresa esta liberada
    if tag = 2 then
      ShowMessage('Não é possivel atualizar sistema com licença bloqueada!');
    exit;
  end;

  DataBloqueio := StrToDateDef(Dados.crypt('D',
    Dados.qryEmpresaDATA_VALIDADE.Value), Date);

  if DataBloqueio < Date then
  begin
    if tag = 2 then
      ShowMessage('Não é possivel atualizar sistema com licença vencida!');

    exit;
  end;

  Carrega;
  FUpdate(Result);
  FFrente(Result);
  FRetaguarda(Result);

  begin
    if tag = 2 then
    begin
      if not(FAtualizaUpdate and FAtualizaFrente and FAtualizaRetaguarda) then
        ShowMessage('Não existe atualização disponível!');
    end;
  end;
end;
