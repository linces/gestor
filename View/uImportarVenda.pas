unit uImportarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TfrmImportarVenda = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtNumero: TEdit;
    qryVenda: TFDQuery;
    qryVendaCODIGO: TIntegerField;
    qryVendaDATA: TDateField;
    qryVendaFKVENDEDOR: TIntegerField;
    qryVendaFK_CLIENTE: TIntegerField;
    qryVendaCLIENTE: TStringField;
    qryVendaTELEFONE: TStringField;
    qryVendaCELULAR: TStringField;
    qryVendaENDERECO: TStringField;
    qryVendaNUMERO: TStringField;
    qryVendaBAIRRO: TStringField;
    qryVendaCIDADE: TStringField;
    qryVendaUF: TStringField;
    qryVendaCNPJ: TStringField;
    qryVendaFORMA_PAGAMENTO: TStringField;
    qryVendaVALIDADE: TSmallintField;
    qryVendaOBS: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryVendaTOTAL: TBCDField;
    qryVendaCEP: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    btnImportar: TSpeedButton;
    qryItens: TFDQuery;
    qryItensCODIGO: TIntegerField;
    qryItensFKVENDA: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensITEM: TSmallintField;
    qryItensCOD_BARRA: TStringField;
    qryItensQTD: TBCDField;
    qryItensE_MEDIO: TBCDField;
    qryItensQTD_DEVOLVIDA: TBCDField;
    qryItensPRECO: TBCDField;
    qryItensVALOR_ITEM: TBCDField;
    qryItensVDESCONTO: TBCDField;
    qryItensTOTAL: TBCDField;
    qryItensSITUACAO: TStringField;
    qryItensUNIDADE: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarVenda: TfrmImportarVenda;

implementation

{$R *.dfm}

uses uPDV, Udados, uNFe, uCadDevolucao;

procedure TfrmImportarVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f3 then
    btnImportar.Click;
  if Key = VK_ESCAPE then
    Close;
end;

end.
