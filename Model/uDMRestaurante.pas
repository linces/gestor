unit uDMRestaurante;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    qryMesas: TFDQuery;
    qryMesasCODIGO: TIntegerField;
    qryMesasSITUACAO: TStringField;
    qryMesasTOTAL: TSingleField;
    qryMesasFK_EMPRESA: TIntegerField;
    qryPedidos: TFDQuery;
    qryPedidosCODIGO: TIntegerField;
    qryPedidosFK_MESA: TIntegerField;
    qryPedidosDATA_PEDIDO: TDateField;
    qryPedidosTOTAL: TSingleField;
    qryPedidosSITUACAO: TStringField;
    qryItens: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateField1: TDateField;
    SingleField1: TSingleField;
    StringField1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados;

{$R *.dfm}

end.
