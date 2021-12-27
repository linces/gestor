unit LockApplicationInterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, lockApplicationVars, ExtCtrls, StdCtrls, ShellApi,
  lockApplicationFunc, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TBloqueio = class(TForm)
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    TituloPanel: TPanel;
    Titulo: TLabel;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Site: TLabel;
    Label4: TLabel;
    Email: TLabel;
    Label6: TLabel;
    Telefones: TLabel;
    Label3: TLabel;
    EID_Instalacao: TEdit;
    Label5: TLabel;
    Eemail: TEdit;
    Label7: TLabel;
    Echave: TEdit;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SiteClick(Sender: TObject);
    procedure EmailClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TELA_ContraChave: String;
    TELA_Email: String;

    Ativar: Boolean;
    Fechado_Sem_Registro: Boolean;
    Pode_Sair: Boolean;
  end;

var
  Bloqueio: TBloqueio;

implementation

{$R *.dfm}

procedure TBloqueio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not Pode_Sair then
      Action := caNone;
end;

procedure TBloqueio.FormCreate(Sender: TObject);
begin
// LocalConnection.Connected := false;
// LicencasTable.Active := false;
//
//
// FDPhysMySQLDriverLink1.VendorLib := ExtractFilePath(Application.exename)+'libmysql.dll';
//// ConexaoLocal.Params.Database := ExtractFilePath(Application.exename)+'gerenciador.db';
//
// try
//
// if Variaveis.hostbd <> '' then begin
//  LicencasTable.Active := true;
//  LocalConnection.Connected  := true;
// end;
//
// except
//   on E: Exception do
//   ShowMessage('Erro ao conectar o banco de dados de Licen�as!' + sLineBreak + E.Message);
// end;
end;

procedure TBloqueio.FormShow(Sender: TObject);
begin

   Pode_Sair := false;
   Bloqueio.Caption := variaveis.Titulo_Janelas;
   Site.Caption := Variaveis.Empresa_Site;
   Email.Caption := Variaveis.Empresa_Email;
   Telefones.Caption := Variaveis.Empresa_Telefones;
   EID_instalacao.Text := IntToStr( Variaveis.ID_Instalacao );
   if TELA_Email <> '' then
      Eemail.Text := TELA_Email
   else
      Eemail.Clear;
   if TELA_ContraChave <> '' then
      Echave.Text := TELA_Contrachave
   else
      Echave.Clear;
   case Ativar of
      True: begin
           Titulo.Caption := 'Digite a chave pra renovar o sistema!'
           +#13 + 'Obtenha a chave com o administrador do sistema.';
      end;
      False: begin
           Titulo.Caption := 'Sistema n�o est� liberado para uso neste computador!'
           +#13 + 'Entre em contato com o administrador do sistema.';
      end;
   end;
end;

procedure TBloqueio.SiteClick(Sender: TObject);
begin
   ShellExecute(handle,'open',pchar(  Variaveis.Empresa_Site ), '','',SW_SHOWNORMAL);
end;

procedure TBloqueio.EmailClick(Sender: TObject);
begin
   ShellExecute(handle,'open',pchar( 'mailto:' + Variaveis.Empresa_Email ), '','',SW_SHOWNORMAL);
end;

procedure TBloqueio.SpeedButton1Click(Sender: TObject);
begin

   Pode_sair := True;
   case Ativar of
       True: begin
            Fechado_sem_registro := True;
            close;
       end;
       False: begin
            Fechado_sem_registro := True;
            close;
       end;
   end;

end;

procedure TBloqueio.SpeedButton2Click(Sender: TObject);
begin
   if Echave.Text <> '' then
   begin
   if pos( '@', Eemail.Text ) > 0 then
   begin
   if Echave.Text = 'DEMOSTRA��O' then
      begin
         case Variaveis.Ja_Foi_Trial of
            true: MessageDlg( 'Sistema j� foi registrado como demostra�ao antes!', mtWarning, [mbOK], 0 );
            false: begin
                Fechado_sem_registro := False;
                Pode_Sair := True;
                TELA_ContraChave := echave.Text;
                TELA_Email := Eemail.Text;
                close;
            end;
         end;
      end
   else      // ELSE do DEMOSTRA��O
      begin
                Fechado_sem_registro := False;
                Pode_Sair := True;
                TELA_ContraChave := echave.Text;
                TELA_Email := Eemail.Text;
                close;
      end;
   end
   else   // ELSE EMAIL
      MessageDlg( 'E-mail informado � inv�lido!', mtWarning, [mbOK], 0 );
   end
   else   // ELSE DO CAMPO VAZIO
      MessageDlg( 'Chave n�o informada!', mtWarning, [mbOK], 0 );
end;

end.
