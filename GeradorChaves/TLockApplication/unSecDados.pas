unit unSecDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Dialogs, FireDAC.Comp.UI, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmSecDados = class(TDataModule)
    zlicencas: TZConnection;
    zlicencastable: TZQuery;
    zlicencastableid: TIntegerField;
    zlicencastableidsistema: TWideStringField;
    zlicencastableidinstalacao: TWideStringField;
    zlicencastabledatainstalacao: TDateTimeField;
    zlicencastableultimasincronizacao: TDateTimeField;
    zlicencastableestadolicenca: TIntegerField;
    zlicencastableversao: TWideStringField;
    zlicencastablegerarchavepor: TWideStringField;
    zlicencastablediasavencer: TIntegerField;
    zlicencastabledataavencer: TDateField;
    zlicencastablechave: TWideStringField;
    zlicencastabledataultimachave: TDateField;
    zlicencastableonoff: TShortintField;
    zlicencastablenome: TWideStringField;
    zlicencastableemail: TWideStringField;
    zlicencastablecpfcnpj: TWideStringField;
    zlicencastablecep: TWideStringField;
    zlicencastableendereco: TWideStringField;
    zlicencastablecidade: TWideStringField;
    zlicencastableestado: TWideStringField;
    zlicencastablecelular: TWideStringField;
    zlicencastableultimoip: TWideStringField;
    zlicencastablecomando: TWideStringField;
    zlicencastableexecutado: TWideStringField;
    zlicencastablemsgdireta: TWideStringField;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    tblretorno: TFDMemTable;
    qryMax: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSecDados: TdmSecDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses LockApplication, LockApplicationVars;

{$R *.dfm}

procedure TdmSecDados.DataModuleCreate(Sender: TObject);
var
 oParams : TStringList;
 server, usuario, database, password, msgerro: string;
begin
  server := Variaveis.hostbd;
  database := Variaveis.databasebd;
  usuario := Variaveis.usuariobd;
  password := Variaveis.password;

  try

    zlicencas.HostName := server;
    zlicencas.Port     := 3306;
    zlicencas.Database := database;
    zlicencas.User     := usuario;
    zlicencas.Password := password;

    zlicencas.Connected := true;

{    if zlicencas.connected = true then begin
      showMessage('Conectado');
    end;     }



  except
    on E: Exception do
      ShowMessage(Variaveis.Errobdlicencas + sLineBreak + E.Message);
  end;


end;

end.
