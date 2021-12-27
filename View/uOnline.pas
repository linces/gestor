unit uOnline;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Data.DB, DBAccess, Uni, MemDS, UniProvider,
  MySQLUniProvider, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    conexao: TUniConnection;
    MySQL: TMySQLUniProvider;
    qryEmpresa: TUniQuery;
    qryEmpresacodigo: TIntegerField;
    qryEmpresacnpj: TStringField;
    qryEmpresarazao: TStringField;
    qryEmpresaendereco: TStringField;
    qryEmpresacidade: TStringField;
    qryEmpresabairro: TStringField;
    qryEmpresacep: TStringField;
    qryEmpresauf: TStringField;
    qryEmpresafone: TStringField;
    qryEmpresaemail: TStringField;
    qryEmpresadata: TDateTimeField;
    qryEmpresanterminais: TIntegerField;
    qryEmpresaserial: TStringField;
    qryEmpresavalidade_licenca: TDateField;
    qryEmpresabloqueado: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    RllContato: TLabel;
    BitBtn1: TBitBtn;
    btnSair: TSpeedButton;
  private
    procedure CadastraEmpresa;
    procedure RetornaSerial;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Udados;



end.
