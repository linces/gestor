unit uAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.Themes, Vcl.Styles,
  Vcl.DBCtrls, JvExStdCtrls, JvGroupBox, Vcl.ExtDlgs, acPNG;

type
  TfrmAcesso = class(TForm)
    qryUsuarios: TFDQuery;
    qryUsuariosLOGIN: TStringField;
    qryUsuariosSENHA: TStringField;
    qryUsuariosCODIGO: TSmallintField;
    qryUsuariosATIVO: TStringField;
    qrySupervisor: TFDQuery;
    qrySupervisorCODIGO: TSmallintField;
    qrySupervisorLOGIN: TStringField;
    qrySupervisorSENHA: TStringField;
    qrySupervisorHIERARQUIA: TSmallintField;
    qrySupervisorECAIXA: TStringField;
    qrySupervisorSUPERVISOR: TStringField;
    qrySupervisorATIVO: TStringField;
    dsSupervisor: TDataSource;
    qryUsuariosSUPERVISOR: TStringField;
    dsEmpresa: TDataSource;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    qryPermissao: TFDQuery;
    qryPermissaoVISUALIZAR: TStringField;
    dsIdioma: TDataSource;
    qryEmpresaMULTI_IDIOMA: TStringField;
    OpenPicture: TOpenPictureDialog;
    Panel3: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    CbUsuario: TDBLookupComboBox;
    edtSenha: TEdit;
    CbEmpresa: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CbUsuarioEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label4DblClick(Sender: TObject);
    procedure imgLogoDblClick(Sender: TObject);
  private
    fechar: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcesso: TfrmAcesso;

implementation

{$R *.dfm}

uses Udados, uSplash, uChave;

procedure TfrmAcesso.BitBtn1Click(Sender: TObject);
begin

  qryUsuarios.Close;
  qryUsuarios.Params[0].Value := CbUsuario.Text;
  qryUsuarios.Open;

  if not(CbUsuario.KeyValue > 0) then
  begin
    ShowMessage('Informe o usuário');
    exit;
  end;

  if qryUsuariosSENHA.Value <> Dados.crypt('C', edtSenha.Text) then
  begin
    Application.ProcessMessages;
    ShowMessage('Senha incorreta!');
    edtSenha.SetFocus;
    edtSenha.Clear;
    exit;
  end;

  Dados.idUsuario := qryUsuariosCODIGO.Value;
  Dados.vUsuario := qryUsuariosLOGIN.Value;
  fechar := true;

  if not Dados.vRetaguarda then
  begin
    qryPermissao.Close;
    qryPermissao.Params[0].Value := Dados.idUsuario;
    qryPermissao.Open;
    if qryPermissaoVISUALIZAR.Value <> 'S' then
    begin
      ShowMessage('Usuário não é caixa!');
      Dados.vFechaPrograma := true;
      Application.Terminate;
    end;

  end;

  Dados.qryEmpresa.Close;
  Dados.qryEmpresa.Open;

  Dados.idempresa := CbEmpresa.KeyValue;

  if Dados.qryEmpresa.Locate('CODIGO', CbEmpresa.KeyValue, []) then
  begin
    Dados.qryEmpresa.Edit;
    if (Dados.qryEmpresaNTERM.IsNull) or (trim(Dados.qryEmpresaNTERM.Value) = '')
    then
      Dados.qryEmpresaNTERM.AsString := Dados.crypt('C', '3');

    if (Dados.qryEmpresaCSENHA.IsNull) or
      (trim(Dados.qryEmpresaCSENHA.Value) = '') then
      Dados.qryEmpresaCSENHA.AsString := Dados.crypt('C', 'N');

    Dados.qryEmpresa.Post;
    Dados.Conexao.CommitRetaining;
  end;

  Dados.eSupervisor := qryUsuariosSUPERVISOR.Value = 'S';

  if not Dados.qryTerminal.Locate('nome', Dados.Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!' + sLineBreak +
      'Acesse o retaguarda para realizar o cadastro do terminal');
    Dados.vFechaPrograma := true;
    Application.Terminate;;
  end
  else
  begin
    if Dados.qryTerminalLOGADO.Value <> 'S' then
    begin

      try

        Dados.qryTerminal.Edit;
        Dados.qryTerminalLOGADO.Value := 'S';
        Dados.qryTerminal.Post;
        Dados.Conexao.CommitRetaining;

      except
        Dados.qryExecute.Close;
        Dados.qryExecute.SQL.Text :=
          'update empresa set nterm=NULL where codigo=:cod';
        Dados.qryExecute.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
        Dados.qryExecute.ExecSQL;
        Dados.Conexao.CommitRetaining;

      end;

    end;
  end;
  Close;
end;

procedure TfrmAcesso.CbUsuarioEnter(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DropDown;
end;

procedure TfrmAcesso.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not fechar then
    Action := caNone;
end;



procedure TfrmAcesso.FormCreate(Sender: TObject);
begin

  dados.ChecaServidorRest;
  qryEmpresa.Close;
  qryEmpresa.Open;

  Dados.qryIdiomas.Close;
  Dados.qryIdiomas.Open;
  Dados.qryIdiomas.First;

  qrySupervisor.Close;
  qrySupervisor.Open;

  Panel3.Width := ROUND(Screen.Width / 2);

  // cbIdiomas.KeyValue := Dados.qryIdiomasCODIGO.Value;
  CbEmpresa.KeyValue := qryEmpresaCODIGO.Value;
  CbUsuario.KeyValue := qrySupervisorCODIGO.Value;


end;

procedure TfrmAcesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmAcesso.FormShow(Sender: TObject);
begin
  fechar := false;
  CbUsuario.SetFocus;
  CbUsuario.KeyValue := 0;

end;

procedure TfrmAcesso.imgLogoDblClick(Sender: TObject);
begin
  if Dados.qryParametroBLOQUEAR_PERSONALIZACAO.Value = 'S' then
    exit;

  Label4DblClick(self);
end;

procedure TfrmAcesso.Label4DblClick(Sender: TObject);
begin
  OpenPicture.Execute;
  if trim(OpenPicture.FileName) <> '' then
  begin

    Dados.qryParametro.Edit;
    Dados.qryParametro.FieldByName('TELA_FUNDO_LOGIN').AsString :=
      OpenPicture.FileName;
    Dados.qryParametro.Post;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmAcesso.SpeedButton1Click(Sender: TObject);
begin
  fechar := true;
  Dados.vFechaPrograma := true;
  Application.Terminate;
end;

end.
