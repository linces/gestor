unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Horse, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, sButton, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, Vcl.Grids,
  Vcl.DBGrids, UniProvider, InterBaseUniProvider, DBAccess, Uni, Vcl.Mask,
  Vcl.DBCtrls, System.Json, Utils.DataSet.JSON.Helper, Horse.Jhonson, Horse.Compression, REST.Types,
  REST.Client, REST.Response.Adapter, Horse.Cors, Horse.Paginate, Horse.Utils.ClientIP;

type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    BalloonHint1: TBalloonHint;
    lblServer: TLabel;
    StatusBar1: TStatusBar;
    btnIniciar: TsButton;
    PopupMenu1: TPopupMenu;
    R1: TMenuItem;
    F1: TMenuItem;
    imgAnimacao: TImageList;
    DataSource1: TDataSource;
    qryPessoas: TFDQuery;
    qryUsuarios: TFDQuery;
    qryProdutos: TFDQuery;
    qryMesas: TFDQuery;
    qryGrupos: TFDQuery;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    function conectar:boolean;
    procedure modificar;
    function parar:boolean;
    procedure sButton1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure ClearToDefaults;
    function Crypt(Action, Src: String): String;
    function grupos(id: TJSONstring; tipo: string): TJSONArray;
  public
    conectado : integer;
    servidor, caminho,codigo : string;
    procedure Status;
    procedure Start;
    procedure Stop;
    function produtos(id: TJSONstring; descricao: TJSONstring; grupo: TJSONstring; pagina: TJSONstring; tipo: string): TJSONArray;
    function mesas(id: TJSONstring; tipo: string): TJSONArray;
    function pessoas(id: TJSONstring; tipo: string):TJSONArray;
    function usuarios(nome: TJSONstring; senha: TJSONstring; tipo: string):TJSONArray;
    function executar(const AEndPoint: string; ARequestMethod: TRestRequestMethod): boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;


implementation

{$R *.dfm}


procedure TfrmPrincipal.Start;
begin
  THorse.Use(Compression());
  THorse.Use(Jhonson);
  Thorse.Use(Cors);
  THorse.Use(Paginate);

    THorse.Get('',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('Escutando na porta: '+ THorse.Port.ToString);
    end);

    THorse.Get('ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
       Res.Send(ClientIP(Req));
    end);

  THorse.Listen(9002);
  Status;
end;

function TfrmPrincipal.pessoas(id: TJSONstring; tipo: string): TJSONArray;
var
 cod : string;
begin
try
  cod :=   StringReplace( id.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);

    if  cod <> '' then
    begin
      qryPessoas.Close;
      qryPessoas.SQL.Clear;
      qryPessoas.SQL.Add('select * from pessoa where codigo = :codus');

       qryPessoas.ParamByName('codus').AsInteger := StrToInt(cod);

      qryPessoas.Open;
    end
    else if cod = '' then
    begin
      qryPessoas.Close;
      qryPessoas.SQL.Clear;
      qryPessoas.SQL.Add('select * from pessoa');
      qryPessoas.Open;
    end;

    if qryPessoas.IsEmpty then
      result := TJSONArray.Create('Result', 'Nenhum resultado encontrado!')
    else
      result := qryPessoas.DatasetToJSON();
  finally

  end;
end;


function TfrmPrincipal.grupos(id: TJSONstring; tipo: string): TJSONArray;
var
 cod : string;
begin
try
    cod :=   StringReplace( id.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
    if  cod <> '' then
    begin
      qryGrupos.Close;
      qryGrupos.SQL.Clear;
      qryGrupos.SQL.Add('select * from grupo where codigo = :codus');
      qryGrupos.ParamByName('codus').AsInteger := StrToInt(cod);
      qryGrupos.Open;
    end
    else if cod = '' then
    begin
      qryGrupos.Close;
      qryGrupos.SQL.Clear;
      qryGrupos.SQL.Add('select * from grupo');
      qryGrupos.Open;
    end;
    if qryGrupos.IsEmpty then
      result := TJSONArray.Create('Result', 'Nenhum resultado encontrado!')
    else
      result := qryGrupos.DatasetToJSON();
  finally
  end;
end;


function TfrmPrincipal.produtos(id: TJSONstring; descricao: TJSONstring; grupo: TJSONstring; pagina: TJSONstring; tipo: string): TJSONArray;
var
 cod, desc, grup, pag : string;
 pg_inicio, pg_fim: integer;
begin
try

  cod :=   StringReplace( id.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
  desc :=  StringReplace( descricao.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
  grup := StringReplace( grupo.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
  pag :=  StringReplace( pagina.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);

        qryProdutos.Close;
        qryProdutos.SQL.Clear;
        qryProdutos.SQL.Add('SELECT * ');
        qryProdutos.SQL.Add('FROM produto P ');
        qryProdutos.SQL.Add('WHERE  P.codigo > 0 ');


        if (cod <> '') and (cod <> '0') then
        begin
            qryProdutos.SQL.Add(' AND  P.codigo = :codus ');
            qryProdutos.ParamByName('codus').AsInteger := StrToInt(cod);
        end;


        if desc <> '' then
        begin
            qryProdutos.SQL.Add(' AND P.DESCRICAO LIKE :TERMO_BUSCA');
            qryProdutos.ParamByName('TERMO_BUSCA').AsString := '%' + desc + '%';
        end;


        if grup <> '' then
        begin
            qryProdutos.SQL.Add(' AND P.grupo = :ID_CATEGORIA');
            qryProdutos.ParamByName('ID_CATEGORIA').AsInteger := grup.toInteger;
        end;

        qryProdutos.SQL.Add(' ORDER BY P.DESCRICAO');

        if pag <> '' then
        begin
            //inicio= (pagina - 1) * 10 + 1
            //fim= pagina * 10

            pg_inicio := (pag.ToInteger - 1) * 10 + 1;
            pg_fim := pag.ToInteger * 10;
            qryProdutos.SQL.Add(' ROWS ' + pg_inicio.ToString + ' TO ' + pg_fim.ToString);
        end;

        qryProdutos.Open;


    if qryProdutos.IsEmpty then
      result := TJSONArray.Create('Result', 'Nenhum resultado encontrado!')
    else
      result := qryProdutos.DatasetToJSON();
  finally

  end;
end;


function TfrmPrincipal.mesas(id: TJSONstring; tipo: string): TJSONArray;
var
 cod : string;
begin
try
  cod :=   StringReplace( id.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
    if  cod <> '' then
    begin
      qryMesas.Close;
      qryMesas.SQL.Clear;
      qryMesas.SQL.Add('select * from mesas where codigo = :codus');
      qryMesas.ParamByName('codus').AsInteger := StrToInt(cod);
      qryMesas.Open;
    end
    else if cod = '' then
    begin
      qryMesas.Close;
      qryMesas.SQL.Clear;
      qryMesas.SQL.Add('select * from mesas');
      qryMesas.Open;
    end;

    if qryMesas.IsEmpty then
      result := TJSONArray.Create('Result', 'Nenhum resultado encontrado!')
    else
      result := qryMesas.DatasetToJSON();
  finally
  end;
end;

procedure TfrmPrincipal.btnIniciarClick(Sender: TObject);
begin
 if btnIniciar.Caption = 'Parar' then begin
   parar;
   exit;
 end;
 if btnIniciar.Caption = 'Iniciar' then begin
   conectar;
 end;
end;





procedure TfrmPrincipal.F1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;

  { Esconde a tela seta o estado para minizado na tray. }
  Hide();
  WindowState := wsMinimized;

  { Mostra o icone animado na tray e exibe o hint. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    TrayIcon1.Hint := 'SoftArena - Servidor de Dados Internos!';
    TrayIcon1.AnimateInterval := 200;

    TrayIcon1.BalloonTitle := 'Restaurar a janela principal.';
    TrayIcon1.BalloonHint :=
    'Dê um duplo click no ícone para restaurar a janela principal do Servidor de Dados.';
    TrayIcon1.BalloonFlags := bfInfo;

    conectar;
end;

procedure TfrmPrincipal.FormPaint(Sender: TObject);
begin
 frmPrincipal.Hide;
end;

procedure TfrmPrincipal.ClearToDefaults;
begin
 //
end;

function TfrmPrincipal.conectar: boolean;
begin
   Start;
end;


function TfrmPrincipal.executar(const AEndPoint: string;
  ARequestMethod: TRestRequestMethod): boolean;
begin
 try

  except on E:Exception do
  begin
   // Tratamento de erro
  end;
 end;
end;

procedure TfrmPrincipal.modificar;
begin


  lblServer.Caption := 'Servidor REST: Parado';
  lblServer.ShowHint := true;
//  Panel1.Visible := true;
  lblServer.Hint := 'Inicie-o clicando no botão "Iniciar" abaixo!';
  conectado := 0;
  btnIniciar.Caption := 'Iniciar';

end;

function TfrmPrincipal.parar: boolean;
begin
stop;

end;



procedure TfrmPrincipal.R1Click(Sender: TObject);
begin
     TrayIcon1DblClick(Self);
end;

procedure TfrmPrincipal.sButton1Click(Sender: TObject);
begin



    conectar;

end;


procedure TfrmPrincipal.Status;
begin
  if THorse.IsRunning then
  begin
   StatusBar1.Panels[0].Text := 'Status: Online  ';
   StatusBar1.Panels[1].Text := 'Escutando a porta: '+IntToStr(THorse.Port);
  end
  else
  begin
   StatusBar1.Panels[0].Text := 'Status: Offline  ';
   StatusBar1.Panels[1].Text := 'Não escutando a porta: '+IntToStr(THorse.Port);
  end;
end;

procedure TfrmPrincipal.Stop;
begin
   THorse.StopListen;
   Status;
end;

procedure TfrmPrincipal.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

function TfrmPrincipal.Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key, KeyNew: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
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



function TfrmPrincipal.usuarios(nome, senha: TJSONstring;
  tipo: string): TJSONArray;
var
 user, pass : string;
begin
try
  user :=   StringReplace( nome.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);
  pass :=   StringReplace( senha.ToString,'"', '', [rfIgnoreCase, rfReplaceAll]);

    if  (user <> '') and (pass <> '') then
    begin
      qryUsuarios.Close;
      qryUsuarios.SQL.Clear;
      qryUsuarios.SQL.Add('select * from usuarios where login = :usuario and senha = :senha');
      qryUsuarios.ParamByName('usuario').AsString := user;
      qryUsuarios.ParamByName('senha').AsString := pass;
      qryUsuarios.Open;
    end
    else if  (user = '') or (pass = '')  then
    begin
      qryUsuarios.Close;
      qryUsuarios.SQL.Clear;
      qryUsuarios.SQL.Add('select * from usuarios');
      qryUsuarios.Open;
    end;

    if qryUsuarios.IsEmpty then
      result := TJSONArray.Create('Result', 'invalido')
    else
      result := qryUsuarios.DatasetToJSON();

  finally

  end;
end;

end.
