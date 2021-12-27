unit undm;

interface

uses
 System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, REST.Types, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON, System.NetEncoding, System.IOUtils, FireDAC.Phys.SQLiteWrapper.Stat, DBAccess, Uni, MemDS, UniProvider,
  InterBaseUniProvider, SQLiteUniProvider;

type
  Tdm = class(TDataModule)
    conn: TUniConnection;
    QryLogin: TUniQuery;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qryComanda: TUniQuery;
    qryProdutos: TUniQuery;

    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation



{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin

 {   with connconf do
    begin
 //       Params.Values['DriverID'] := 'SQLite';

    //    {$IFDEF MSWINDOWS}
    //      Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\DB\banco.db';
    //    {$ELSE}
//          Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'banco.db');     ]
    //                Params.Values['Database'] := 'banco.db';
      //  {$ENDIF}
{
       try
            Connected := true;

            qry_Config.Active := false;
            qry_Config.SQL.Clear;
            qry_Config.SQL.Add('SELECT * FROM TAB_USUARIO');
            qry_Config.Active := true;
            qry_Config.Open;

            if Connected then
            begin
              try
                dm.conn.ProviderName := 'InterBase';
                dm.conn.Server :=  qry_Config.FieldByName('SERVIDOR').AsString;
                dm.conn.Username := 'sysdba';
                dm.conn.Password := 'masterkey';
                dm.conn.Database := qry_Config.FieldByName('CAMINHO').AsString;
                dm.conn.SpecificOptions.Values['ClientLibrary'] := 'fbclient.dll';
                dm.conn.LoginPrompt := false;
                dm.conn.Connected := true;
            except on e:exception do
            raise Exception.Create('Erro ao acessar banco de dados de produtos: ' + e.Message);
              end;
            end;


        except on e:exception do
            raise Exception.Create('Erro de conexão com o banco de dados: ' + e.Message);
        end;

    end;               }
end;

end.
