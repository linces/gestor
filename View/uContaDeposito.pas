unit uContaDeposito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEh, Vcl.Mask, DBCtrlsEh, DBLookupEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmContaDeposito = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    Label5: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    qryConta: TFDQuery;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    dsConta: TDataSource;
    procedure btnAvancarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    PodeFechar: Boolean;
    { Private declarations }
  public
    idForma, idCodigo: Integer;
    vValor: Extended;
    { Public declarations }
  end;

var
  FrmContaDeposito: TFrmContaDeposito;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmContaDeposito.btnAvancarClick(Sender: TObject);
begin
  if trim(DBLookupComboboxEh1.Text) <> '' then
  begin
    dados.vChamaImpressao := true;
    PodeFechar := true;
    Close;
  end
  else
  begin
    ShowMessage('Informe a conta de destino!');
    exit;
  end;

  dados.qryCaixa.Close;
  dados.qryCaixa.Params[0].Value := -1;
  dados.qryCaixa.Open;

  dados.qryCaixa.Insert;
  dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  dados.qryCaixaEMISSAO.Value := date;
  dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  dados.qryCaixaEMISSAO.Value := date;
  dados.qryCaixaDOC.Value := inttostr(idCodigo);
  dados.qryCaixaHISTORICO.Value := 'VENDA Nº' + inttostr(idCodigo) +
    ' DINHEIRO';
  dados.qryCaixaENTRADA.Value := vValor;
  dados.qryCaixaTIPO_MOVIMENTO.Value := 'DP';
  dados.qryCaixaSAIDA.Value := 0;
  dados.qryCaixaHORA_EMISSAO.Value := time;
  dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
  dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_VENDA.Value;
  dados.qryCaixaFKCONTA.Value := DBLookupComboboxEh1.KeyValue;
  dados.qryCaixaFKVENDA.Value := idCodigo;
  dados.qryCaixaTRANSFERENCIA.Value := 0;
  dados.qryCaixaFPG.Value := idForma;
  dados.qryCaixa.Post;

end;

procedure TFrmContaDeposito.btnVoltarClick(Sender: TObject);
begin
  PodeFechar := true;
  dados.vChamaImpressao := false;
  Close;
end;

procedure TFrmContaDeposito.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmContaDeposito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not PodeFechar then
    Action := canone;
end;

procedure TFrmContaDeposito.FormCreate(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;
end;

procedure TFrmContaDeposito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f4:
      btnAvancar.Click;
    vk_f5:
      btnVoltar.Click;
  end;
end;

procedure TFrmContaDeposito.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBLookupComboboxEh1.SetFocus;
end;

end.
