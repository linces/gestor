unit UNDM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, UniProvider, InterBaseUniProvider,
  FireDAC.Comp.Client, Data.DB, MemDS, DBAccess, Uni, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    qry_config: TFDQuery;
    qry_configUSUARIO: TStringField;
    qry_configSERVIDOR: TStringField;
    qry_configcaminho: TStringField;
    conn: TUniConnection;
    QryLogin: TUniQuery;
    connconf: TFDConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qryComanda: TUniQuery;
    qryProdutos: TUniQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
