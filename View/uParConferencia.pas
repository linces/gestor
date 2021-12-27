unit uParConferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frxExportXLS, DBGridEh, Vcl.Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmConferecia = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    edtFinal: TEdit;
    edtInicial: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbGrupo: TDBLookupComboboxEh;
    cbMarca: TDBLookupComboboxEh;
    Label4: TLabel;
    frxDBConferencia: TfrxDBDataset;
    qryConferencia: TFDQuery;
    qryConferenciaCODIGO: TIntegerField;
    qryConferenciaTIPO: TStringField;
    qryConferenciaCODBARRA: TStringField;
    qryConferenciaREFERENCIA: TStringField;
    qryConferenciaGRUPO: TIntegerField;
    qryConferenciaUNIDADE: TStringField;
    qryConferenciaULTFORN: TIntegerField;
    qryConferenciaLOCALIZACAO: TStringField;
    qryConferenciaALIQ_ICM: TCurrencyField;
    qryConferenciaALIQ_PIS: TCurrencyField;
    qryConferenciaALIQ_COF: TCurrencyField;
    qryConferenciaPR_CUSTO: TFMTBCDField;
    qryConferenciaMARGEM: TCurrencyField;
    qryConferenciaPR_VENDA: TFMTBCDField;
    qryConferenciaQTD_ATUAL: TFMTBCDField;
    qryConferenciaQTD_MIN: TFMTBCDField;
    qryConferenciaE_MEDIO: TFMTBCDField;
    qryConferenciaCSTICMS: TStringField;
    qryConferenciaCSTE: TStringField;
    qryConferenciaCSTS: TStringField;
    qryConferenciaCSTIPI: TStringField;
    qryConferenciaCSOSN: TStringField;
    qryConferenciaNCM: TStringField;
    qryConferenciaCOMISSAO: TCurrencyField;
    qryConferenciaDESCONTO: TCurrencyField;
    qryConferenciaFOTO: TBlobField;
    qryConferenciaATIVO: TStringField;
    qryConferenciaCFOP: TStringField;
    qryConferenciaPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryConferenciaPR_VENDA_ANTERIOR: TFMTBCDField;
    qryConferenciaULT_COMPRA: TIntegerField;
    qryConferenciaULT_COMPRA_ANTERIOR: TIntegerField;
    qryConferenciaPRECO_ATACADO: TFMTBCDField;
    qryConferenciaQTD_ATACADO: TFMTBCDField;
    qryConferenciaCOD_BARRA_ATACADO: TStringField;
    qryConferenciaALIQ_IPI: TFMTBCDField;
    qryConferenciaEMPRESA: TSmallintField;
    qryConferenciaCEST: TStringField;
    qryConferenciaGRADE: TStringField;
    qryConferenciaEFISCAL: TStringField;
    qryConferenciaPAGA_COMISSAO: TStringField;
    qryConferenciaPESO: TFMTBCDField;
    qryConferenciaCOMPOSICAO: TStringField;
    qryConferenciaPRECO_PROMO_ATACADO: TFMTBCDField;
    qryConferenciaPRECO_PROMO_VAREJO: TFMTBCDField;
    qryConferenciaINICIO_PROMOCAO: TDateField;
    qryConferenciaFIM_PROMOCAO: TDateField;
    qryConferenciaESTOQUE_INICIAL: TFMTBCDField;
    qryConferenciaPR_VENDA_PRAZO: TFMTBCDField;
    qryConferenciaPRECO_VARIAVEL: TStringField;
    qryConferenciaAPLICACAO: TStringField;
    qryConferenciaREDUCAO_BASE: TFMTBCDField;
    qryConferenciaMVA: TFMTBCDField;
    qryConferenciaFCP: TFMTBCDField;
    qryConferenciaPRODUTO_PESADO: TStringField;
    qryConferenciaSERVICO: TStringField;
    qryConferenciaDT_CADASTRO: TDateField;
    qryConferenciaDESCRICAO: TStringField;
    qryConferenciaPR_CUSTO2: TFMTBCDField;
    qryConferenciaPERC_CUSTO: TFMTBCDField;
    Label5: TLabel;
    edtLocal: TEdit;
    qryGrupo: TFDQuery;
    qryMarca: TFDQuery;
    qryMarcaCODIGO: TIntegerField;
    qryMarcaDESCRICAO: TStringField;
    qryGrupoCODIGO: TIntegerField;
    qryGrupoDESCRICAO: TStringField;
    dsGrupo: TDataSource;
    dsMarca: TDataSource;
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferecia: TfrmConferecia;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmConferecia.btnImpClick(Sender: TObject);
begin
  try
    qryConferencia.Close;
    qryConferencia.Params[0].Value := StrToIntDef(edtInicial.Text, 0);
    qryConferencia.Params[1].Value := StrToIntDef(edtFinal.Text, 999999);
    qryConferencia.Params[2].Value := trim(cbGrupo.Text) + '%';
    qryConferencia.Params[3].Value := trim(cbMarca.Text) + '%';
    qryConferencia.Params[4].Value := edtLocal.Text + '%';
    qryConferencia.Open;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelEstoqueConf.fr3');
    frxReport.ShowReport;
  finally
    // nada
  end;

end;

procedure TfrmConferecia.FormCreate(Sender: TObject);
begin

  qryGrupo.Close;
  qryGrupo.Open;

  qryMarca.Close;
  qryMarca.Open;

end;

end.
