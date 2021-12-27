unit uCadCTeOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, JPeg, Vcl.ExtDlgs,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, DBGridEh, DBLookupEh, ACBrSocket, ACBrCEP,
  ACBrValidador, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadCTeOS = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    dsCTe: TDataSource;
    Panel2: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBComboBoxEh1: TDBComboBoxEh;
    ACBrEnterTab1: TACBrEnterTab;
    dsCidadeOrigem: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label3: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Label4: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Label5: TLabel;
    DBComboBoxEh2: TDBComboBoxEh;
    qryTomador: TFDQuery;
    qryTomadorCODIGO: TIntegerField;
    qryTomadorRAZAO: TStringField;
    qryTomadorFANTASIA: TStringField;
    qryTomadorFONE: TStringField;
    qryTomadorENDERECO: TStringField;
    qryTomadorNUMERO: TStringField;
    qryTomadorBAIRRO: TStringField;
    qryTomadorCODMUN: TIntegerField;
    qryTomadorMUNICIPIO: TStringField;
    qryTomadorUF: TStringField;
    qryTomadorCEP: TStringField;
    qryTomadorFKEMPRESA: TIntegerField;
    qryTomadorTIPO: TStringField;
    qryTomadorCNPJ: TStringField;
    qryTomadorIE: TStringField;
    qryTransp: TFDQuery;
    qryTranspCODIGO: TIntegerField;
    qryTranspPESSOA: TStringField;
    qryTranspCNPJ: TStringField;
    qryTranspIE: TStringField;
    qryTranspNOME: TStringField;
    qryTranspAPELIDO: TStringField;
    qryTranspENDERECO: TStringField;
    qryTranspNUMERO: TStringField;
    qryTranspBAIRRO: TStringField;
    qryTranspCOD_CIDADE: TIntegerField;
    qryTranspCIDADE: TStringField;
    qryTranspUF: TStringField;
    qryTranspCEP: TStringField;
    qryTranspPLACA: TStringField;
    qryTranspUFPLACA: TStringField;
    qryTranspRNTC: TStringField;
    qryTranspATIVO: TStringField;
    qryTranspEMPRESA: TIntegerField;
    qryTranspRENAVAM: TStringField;
    qryCFOP: TFDQuery;
    qryCFOPCODIGO: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPTIPO: TStringField;
    qryCFOPMOV_ES: TStringField;
    qryCFOPATIVO: TStringField;
    qryCte: TFDQuery;
    qryCteCODIGO: TIntegerField;
    qryCteFKEMPRESA: TIntegerField;
    qryCteNUMERO: TIntegerField;
    qryCteCHAVE: TStringField;
    qryCteCFOP: TIntegerField;
    qryCteMODELO: TIntegerField;
    qryCteSERIE: TIntegerField;
    qryCteCODMUNENVIO: TIntegerField;
    qryCteMUNICIPIOENVIO: TStringField;
    qryCteUFENVIO: TStringField;
    qryCteTIPOSERVICO: TIntegerField;
    qryCteCODMUNINI: TIntegerField;
    qryCteMUNICIPIOINI: TStringField;
    qryCteUFINI: TStringField;
    qryCteCODMUNFIM: TIntegerField;
    qryCteMINICIPIOFIM: TStringField;
    qryCteUFFIM: TStringField;
    qryCteDESCRICAOSERVICO: TStringField;
    qryCteRESPSEG: TIntegerField;
    qryCteXSEG: TStringField;
    qryCteNAPOLICE: TStringField;
    qryCteTAF: TStringField;
    qryCteNROREGESTADUAL: TStringField;
    qryCteTIPO: TStringField;
    qryCteSITUACAO: TStringField;
    qryCteFKTOMADOR: TIntegerField;
    qryCteFKTRANSPORTADOR: TIntegerField;
    qryCtePROTOCOLO: TStringField;
    qryCteXML: TMemoField;
    qryCteDATA: TDateField;
    qryCteHORA: TTimeField;
    dsCFOP: TDataSource;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    dsTransp: TDataSource;
    dsTomador: TDataSource;
    qryCidadeO: TFDQuery;
    qryCidadeD: TFDQuery;
    dsCidadeD: TDataSource;
    qryCidadeOCODIGO: TIntegerField;
    qryCidadeODESCRICAO: TStringField;
    qryCidadeOCODUF: TIntegerField;
    qryCidadeOUF: TStringField;
    qryCidadeDCODIGO: TIntegerField;
    qryCidadeDDESCRICAO: TStringField;
    qryCidadeDCODUF: TIntegerField;
    qryCidadeDUF: TStringField;
    qryCteTOTAL: TFMTBCDField;
    qryCteRECEBIDO: TFMTBCDField;
    qryCteVPIS: TFMTBCDField;
    qryCteVCOFINS: TFMTBCDField;
    qryCteVINSS: TFMTBCDField;
    qryCteVIR: TFMTBCDField;
    qryCteVCLSS: TFMTBCDField;
    qryCteVTOTTIRB: TFMTBCDField;
    qryCteQTD: TFMTBCDField;
    qryCteFINALIDADE: TIntegerField;
    qryCteDOCUMENTO: TStringField;
    qryCteDATA_ENTREGA: TDateField;
    qryCteTOMADOR: TStringField;
    qryCteFK_DESTINATARIO: TIntegerField;
    qryCteFK_VEICULO: TStringField;
    qryCteOBS_FISCO: TMemoField;
    qryCteOBS_CONTRIBUINTE: TMemoField;
    qryCteVALOR_SERVICO: TFMTBCDField;
    qryCteVALOR_CARGA: TFMTBCDField;
    qryCteCST_ICMS: TStringField;
    qryCteALIQUOTA_ICMS: TFMTBCDField;
    qryCteBASE_ICMS: TFMTBCDField;
    qryCteVALOR_ICMS: TFMTBCDField;
    qryCteOUTROS_TRIBUTOS: TFMTBCDField;
    qryCteMETRAGEM: TStringField;
    qryCteFK_REMETENTE: TIntegerField;
    qryCteCHAVE_REFERENCIADA: TStringField;
    qryCteNAVERBACAO: TStringField;
    qryCteCNPJ_SEGURADORA: TStringField;
    qryCtePESOL: TFMTBCDField;
    qryCtePESOB: TFMTBCDField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBComboBoxEh4: TDBComboBoxEh;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit7: TDBEdit;
    TabSheet3: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBComboBoxEh3: TDBComboBoxEh;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    procedure DBLookupComboboxEh5Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboboxEh4Exit(Sender: TObject);
    procedure qryCteBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCTeOS: TfrmCadCTeOS;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadCTeOS.btnCancelarClick(Sender: TObject);
begin
 qryCte.Cancel;
 Close;
end;

procedure TfrmCadCTeOS.btnGravarClick(Sender: TObject);
begin
 if qryCteFKTOMADOR.IsNull then begin
   ShowMessage('Informe o Tomador do Serviço');
   DBLookupComboboxEh1.SetFocus;
   exit;
 end;

 if qryCteFKTRANSPORTADOR.IsNull then begin
   ShowMessage('Informe o Transportador');
   DBLookupComboboxEh2.SetFocus;
   exit;
 end;

 if qryCteCFOP.IsNull then begin
   ShowMessage('Informe o CFOP');
   DBLookupComboboxEh3.SetFocus;
   exit;
 end;

 if qryCteCODMUNINI.IsNull then begin
   ShowMessage('Informe o Municipio de Origem');
   DBLookupComboboxEh4.SetFocus;
   exit;
 end;

 if qryCteCODMUNFIM.IsNull then begin
   ShowMessage('Informe o Municipio de Destino');
   DBLookupComboboxEh4.SetFocus;
   exit;
 end;

 qryCte.post;
 dados.Conexao.CommitRetaining;
 Close;


end;

procedure TfrmCadCTeOS.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTeOS.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTeOS.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadCTeOS.DBLookupComboboxEh4Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
  qryCteUFINI.Value := qryCidadeOUF.Value;
  qryCteMUNICIPIOINI.Value := qryCidadeODESCRICAO.Value;
end;

procedure TfrmCadCTeOS.DBLookupComboboxEh5Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
  qryCteUFFIM.Value := qryCidadeDUF.Value;
  qryCteMINICIPIOFIM.Value := qryCidadeDDESCRICAO.Value;
end;

procedure TfrmCadCTeOS.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmCadCTeOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_f5 then
  btnGravarClick(self);
 if key = VK_ESCAPE then
  btnCancelarClick(self);
end;

procedure TfrmCadCTeOS.qryCteBeforeOpen(DataSet: TDataSet);
begin
 qryCFOP.Close;
 qryCFOP.Open;

 qryTransp.Close;
 qryTransp.Open;

 qryTomador.Close;
 qryTomador.Open;

 qryCidadeO.Close;
 qryCidadeO.Open;

 qryCidadeD.Close;
 qryCidadeD.Open;

end;

end.
