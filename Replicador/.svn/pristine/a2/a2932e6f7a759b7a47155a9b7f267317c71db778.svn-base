unit Replicador.Model.Interfaces;

interface

uses
  Replicador.Model.Tipificacoes,
  Data.DB,
  Datasnap.DBClient,
  System.Classes,
  Replicador.Controller.Tipificacoes, FireDAC.Stan.Param;

Type
  IModelQuery = interface;

  IModelConexao = interface
    ['{F42FBDC0-9B31-4EC3-9D62-ED79E0B12CC4}']
    function Objecto : TObject;
    function Query(Value : Integer) : iModelQuery;
    function Connected(Value : Boolean) : iModelConexao;
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    function GetDescrition : String;
    function GetTableReceive : String;
    function GetTableSend : String;
    procedure SetDescrition(const Value: String);
    procedure SetTableReceive(const Value: String);
    procedure SetTableSend(const Value: String);
    function GetConnectionStatus: Boolean;
    procedure SetConnectionStatus(const Value: Boolean);
    function GetReceive: Boolean;
    function GetSend: Boolean;
    procedure SetReceive(const Value: Boolean);
    procedure SetSend(const Value: Boolean);
    function GetTables(Tipo : String): TStringList;
    property ID: Integer read GetID write SetID;
    property Descrition : String read GetDescrition write SetDescrition;
    property TableReceive : String read GetTableReceive write SetTableReceive;
    property TableSend : String read GetTableSend write SetTableSend;
    property ConnectionStatus : Boolean read GetConnectionStatus write SetConnectionStatus;
    property Send : Boolean read GetSend write SetSend;
    property Receive : Boolean read GetReceive write SetReceive;
    function StartTransaction : IModelConexao;
    function Commit : IModelConexao;
    function Rollback : IModelConexao;
    function GetPrimaryKeys(Table : String) : TStringList;
    function IdNewQuery : Integer;
  end;

  IModelQuery = interface
    ['{B762BAE9-B8D5-4B20-A990-24226E016534}']
    function SQL : TStrings;
    function Open : IModelQuery;
    function FieldByName(Value : String) : TField;
    function Eof : Boolean;
    function Next : IModelQuery;
    function First : IModelQuery;
    function OpenSQL(Value : String) : iModelQuery;
    function Params : TFDParams;
    function Close : IModelQuery;
    function ExecSQL : IModelQuery;
    function DataSet : TDataSet;
    function ExecuteSQL(aSQL: String) : iModelQuery;
    function ParamCheck(Value : Boolean) : iModelQuery;
    function Execute(ArraySize : Integer; Position : Integer) : iModelQuery;
  end;

  IModelETL = interface
    ['{68F876D1-9E84-4909-8CD7-43B25B469576}']
    function Log(Value : TEvLog) : IModelETL;
    function InjectBankId (Value : Boolean) : IModelETL;
    procedure ExecutaETL(Tabela : String; Fields : String; Where : String; Limit : Integer; IDBanco : Integer; IDReceiver : Integer); overload;
    procedure ExecutaETL(aSQL, Tabela, Where, Group, OrderBy: String; delete : boolean = false; FieldsToSQL : string = ''); overload;
  end;

  IModelFactory = interface
    ['{CCAC94ED-D79F-46AD-A2AE-B53300405254}']
    function NewConexao(TipsConexao: TTipsConexao): IModelConexao;
    function NewETL(ConexaoProvider, ConexaoDestino: IModelConexao): IModelETL;
  end;

implementation

end.
