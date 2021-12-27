unit uTransferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmTransferencia = class(TForm)
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    qryMesasD: TFDQuery;
    dsMesasD: TDataSource;
    dsMesasO: TDataSource;
    Panel5: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Label1: TLabel;
    Panel7: TPanel;
    Label8: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label9: TLabel;
    Label3: TLabel;
    qryMesasDCODIGO: TIntegerField;
    qryMesasDNOME: TStringField;
    qryMesasDQTD: TIntegerField;
    qryMesasDDATA: TSQLTimeStampField;
    qryMesasDSITUACAO: TStringField;
    qryMesasDFK_MOVIMENTO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

{$R *.dfm}

uses uDados;



end.
