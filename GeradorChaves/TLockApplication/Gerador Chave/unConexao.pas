unit unConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Bde.DBTables, Vcl.StdCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxDBEdit, Vcl.Mask,
  Vcl.DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ZAbstractConnection, ZConnection,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, ZSqlProcessor, ZSqlMetadata,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TfrmConexao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    DBEdit1: TDBEdit;
    ConfigsConnection: TFDConnection;
    FDTable1: TFDTable;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    FDTable1server: TStringField;
    FDTable1database: TStringField;
    FDTable1user: TStringField;
    FDTable1password: TStringField;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDSchemaAdapter1: TFDSchemaAdapter;
    FDScript1: TFDScript;
    CriarBase: TFDScript;
    CriabaseConnection: TFDConnection;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FDTable1BeforePost(DataSet: TDataSet);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
   function BDExiste: boolean;
  end;

var
  frmConexao: TfrmConexao;

implementation

{$R *.dfm}

uses unDados;

function TfrmConexao.BDExiste: boolean;
begin
 result := false;
//
end;

procedure TfrmConexao.Button1Click(Sender: TObject);
var
 oParams : TStringList;
 usuario,server,database,password : String;
begin

if DBEdit3.Tag = 0 then begin
  usuario :=  Dados.decriptar(DBEdit3.Text,'xxslhhe193006')
end;
if DBEdit3.Tag <> 0 then begin
  usuario :=  DBEdit3.Text;
end;

if DBEdit1.Tag = 0 then begin
  server :=  Dados.decriptar(DBEdit1.Text,'xxslhhe193006')
end;
if DBEdit1.Tag <> 0 then begin
  server :=  DBEdit1.Text;
end;

if DBEdit2.Tag = 0 then begin
  database :=  Dados.decriptar(DBEdit2.Text,'xxslhhe193006')
end;
if DBEdit2.Tag <> 0 then begin
  database :=  DBEdit2.Text;
end;

if DBEdit4.Tag = 0 then begin
  password :=  Dados.decriptar(DBEdit4.Text,'xxslhhe193006')
end;
if DBEdit4.Tag <> 0 then begin
  password :=  DBEdit4.Text;
end;

  FDConnection1.Connected := false;
  oParams := TStringList.Create;
  oParams.Add('Server=' + server);
  oParams.Add('Database=' + database);
  oParams.Add('User_Name=' + usuario);
  oParams.Add('Password=' + password);
  oParams.Add('DriverID=MySQL');
  FDConnection1.Params.UserName := usuario;
  FDConnection1.Params.password := password;
  FDConnection1.DriverName := 'MySQL';
  FDConnection1.LoginPrompt := false;

  try
   FDConnection1.Connected := true;
  except
     ShowMessage('Erro ao conectar a base principal.')
  end;


   if FDConnection1.Connected then begin
     CriarBase.Connection := FDConnection1;
    with CriarBase do
    begin
     SQLScriptFileName := ExtractFilePath(Application.exename) + 'licencas.sql';
     ValidateAll;
     ExecuteAll;
    end;
   end;


end;

procedure TfrmConexao.Button2Click(Sender: TObject);
begin
 if FDTable1.State in [dsEdit, dsInSert] then begin
     FDTable1.Post;
     FDTable1.ApplyUpdates(0);
 end;
end;

procedure TfrmConexao.DBEdit1Enter(Sender: TObject);
begin
if DBEdit1.Tag <> 1 then
 DBEdit1.Text :=  Dados.decriptar(DBEdit1.Text,'xxslhhe193006');
 DBEdit1.Tag := 1;
end;

procedure TfrmConexao.DBEdit2Enter(Sender: TObject);
begin
if DBEdit2.Tag <> 1 then
 DBEdit2.Text :=  Dados.decriptar(DBEdit2.Text,'xxslhhe193006');
 DBEdit2.Tag := 1;
end;

procedure TfrmConexao.DBEdit3Enter(Sender: TObject);
begin
if DBEdit3.Tag <> 1 then
 DBEdit3.Text :=  Dados.decriptar(DBEdit3.Text,'xxslhhe193006');
 DBEdit3.Tag := 1;
end;

procedure TfrmConexao.DBEdit4Enter(Sender: TObject);
begin
if DBEdit4.Tag <> 1 then
 DBEdit4.Text :=  Dados.decriptar(DBEdit4.Text,'xxslhhe193006');
 DBEdit4.Tag := 1;
end;

procedure TfrmConexao.FDTable1BeforePost(DataSet: TDataSet);
begin
if DBEdit1.Tag = 1 then begin
  FDTable1server.Text :=  Dados.encriptar(DBEdit1.Text,'xxslhhe193006');
end;
if DBEdit2.Tag = 1 then begin
  FDTable1database.Text :=  Dados.encriptar(DBEdit2.Text,'xxslhhe193006');
end;
if DBEdit3.Tag = 1 then begin
  FDTable1user.Text :=  Dados.encriptar(DBEdit3.Text,'xxslhhe193006');
end;
if DBEdit4.Tag = 1 then begin
  FDTable1password.Text :=  Dados.encriptar(DBEdit4.Text,'xxslhhe193006');
end;
end;

procedure TfrmConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FDTable1.State in [dsEdit] then begin
     FDTable1.Post;
     FDTable1.ApplyUpdates(0);
 end;
end;

procedure TfrmConexao.FormCreate(Sender: TObject);
begin

  ConfigsConnection.Connected := false;
  ConfigsConnection.Params.Database := ExtractFilePath(Application.exename)+'gerenciador.db';
  ConfigsConnection.Params.Add('DriverID=SQLite');
  ConfigsConnection.Connected := true;

   if ConfigsConnection.Connected then begin
    FDTable1.Active := true;
     if FDTable1.Active then begin
      FDTable1.Edit;
     end;
   end;



end;

end.
