unit Replicador.Controller.Interfaces;

interface

uses Replicador.Model.Tipificacoes, System.Generics.Collections,
  Replicador.Model.Interfaces, Replicador.Controller.Tipificacoes;

Type
  TChartValue = procedure (Title: String; Value: Currency; Clear : Boolean = false) of Object;

  IControllerConexao = interface
    ['{7A4CD3FA-AD05-45F0-BA9B-26F9020DE52B}']
    procedure SetListaConexoes(const Value: TList<IModelConexao>);
    function getListaConexoes: TList<IModelConexao>;
    procedure AdicionaConexao(TipsConexao: TTipsConexao); overload;
    procedure AdicionaConexao(DataBase, DriverID, DBVersion, UserName, Password, RoleName, Server, Port, VendorLib : String; ID : Integer; Descrition, TableReceive, TableSend : String; Send, Receive : Boolean); overload;
    property ListaConexoes : TList<IModelConexao> read getListaConexoes write SetListaConexoes;
  end;

  IControllerETL = interface
    ['{E69C666F-DDD4-4449-AEBB-091FFE57442A}']
    function NewETL(ConexaoProvider, ConexaoDest : IModelConexao) : IModelETL;
  end;

  IControllerReplicator = interface
    ['{F2C41067-6CAC-484E-AD38-0E7235CEC137}']
    function InjectBankId (Value : Boolean) : IControllerReplicator;
    procedure Replicate(Limit : Integer; MasterKey : String; Sequencer : Boolean);
    procedure BackupFull(ApplicationName : String; IdBancoOrigem : Integer);
    procedure BackupTable(ApplicationName, Table: String; IdBancoOrigem: Integer);
    procedure ChartValue(Value : TChartValue);
    procedure ClearReplicateBank;
    procedure SetLog(const Value: TEvLog);
    function GetLog : TEvLog;
    property Log : TEvLog read GetLog write SetLog;
  end;

  IControllerMetadata = interface
    ['{743215BB-74A6-4386-B641-BCBB766BF2EA}']
    function InjectBankId (Value : Boolean) : IControllerMetadata;
    procedure createReplicationStructure(ApplicationName, MasterKey: String);
    procedure createReplicationBank(MasterKeys : String);
    procedure createReplicationBranch(ApplicationName, MasterKey : String; Factor : Integer);
    procedure removeReplicationStructure;
    procedure disableReplicationStructure(ApplicationName, MasterKey: String);
    procedure enableReplicationStructure(ApplicationName, MasterKey: String);
    procedure SetLog(const Value: TEvLog);
    function GetLog : TEvLog;
    property Log : TEvLog read GetLog write SetLog;
  end;

  IControllerFactory = interface
    ['{B7EBBD21-FC92-437D-BC30-F59F3BB08A93}']
    function Conexao: IControllerConexao;
    function NewControllerETL : IControllerETL;
    function Replicator(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerReplicator;
    function Metadata(Host, Path, TypeDB, DBVersion, User, Password, RoleName, Server, Port, VendorLib : String) : IControllerMetadata;
  end;



implementation

end.
