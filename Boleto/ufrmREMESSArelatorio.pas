unit ufrmREMESSArelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLFilters, RLPDFFilter, Vcl.StdCtrls, RLReport,
  Vcl.Imaging.jpeg, ACBrBase, ACBrEnterTab;

type
  TfrmREMESSArelatorio = class(TfrmDefault)
    RLReport: TRLReport;
    RLCabecalho: TRLBand;
    RLEmpresa: TRLLabel;
    RLTitulo: TRLLabel;
    RLOpcoes1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    H1: TRLLabel;
    H2: TRLLabel;
    dtsqryDefault: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    qryDefault: TFDQuery;
    qryDefaultITEM: TFDQuery;
    dtsqryDefaultITEM: TDataSource;
    qryDefaultITEMID_EMPRESA: TIntegerField;
    qryDefaultITEMID_CBR_REMESSA: TLargeintField;
    qryDefaultITEMID_CBR_TITULOS: TLargeintField;
    qryDefaultITEMDT_EMISSAO: TSQLTimeStampField;
    qryDefaultITEMDT_VENCIMENTO: TSQLTimeStampField;
    qryDefaultITEMVALOR: TFMTBCDField;
    qryDefaultITEMCLI_RAZAOSOCIAL: TStringField;
    qryDefaultITEMCLI_CNPJCPF: TStringField;
    qryDefaultITEMCLI_ENDERECO: TStringField;
    qryDefaultITEMCLI_ENDNUMERO: TStringField;
    qryDefaultITEMCLI_ENDBAIRRO: TStringField;
    qryDefaultITEMCLI_ENDCIDADE: TStringField;
    qryDefaultITEMCLI_ENDUF: TStringField;
    qryDefaultITEMCLI_ENDCEP: TStringField;
    qryDefaultITEMDT_PAGAMENTO: TDateField;
    qryDefaultITEMCANCELAMENTO_LOJA: TStringField;
    qryDefaultITEMPAGAMENTO_LOJA: TStringField;
    qryDefaultITEMALTERACAO_LOJA: TStringField;
    RLGrupo: TRLGroup;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLOpcoes: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLOpcoes2: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLLabel14: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel6: TRLLabel;
    RLDBText8: TRLDBText;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure qryDefaultAfterOpen(DataSet: TDataSet);
    procedure qryDefaultBeforeOpen(DataSet: TDataSet);
    procedure qryDefaultITEMCLI_RAZAOSOCIALGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryDefaultITEMCLI_CNPJCPFGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FID_CBR_REMESSA: Integer;
  public
    class procedure ShowRelatorio(vID_CBR_REMESSA: Integer);
  end;

var
  frmREMESSArelatorio: TfrmREMESSArelatorio;

implementation

{$R *.dfm}

uses ufuncoes, Udados;

{ TfrmDefault1 }

procedure TfrmREMESSArelatorio.qryDefaultAfterOpen(DataSet: TDataSet);
begin
  qryDefaultITEM.Active := DataSet.Active;
end;

procedure TfrmREMESSArelatorio.qryDefaultBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    dados.qryempresaCodigo.value;
end;

procedure TfrmREMESSArelatorio.qryDefaultITEMCLI_CNPJCPFGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := FormatarCNPJCPF(Sender.AsString);
end;

procedure TfrmREMESSArelatorio.qryDefaultITEMCLI_RAZAOSOCIALGetText
  (Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 22);
end;

procedure TfrmREMESSArelatorio.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  qryDefault.Close;
  qryDefault.ParamByName('ID_CBR_REMESSA').AsInteger := FID_CBR_REMESSA;
  qryDefault.Open;
  qryDefault.FetchAll;

  RLEmpresa.Caption := qryDefault.FieldByName('RAZAOSOCIAL').AsString.Trim;
  RLTitulo.Caption := 'Remessa Número.: ' + qryDefault.FieldByName
    ('ID_CBR_REMESSA').AsString;
  RLOpcoes.Caption := 'Data Geração...: ' + FormatDateTime('dd/mm/yyy hh:mm:ss',
    qryDefault.FieldByName('DATA_GERACAO').AsDateTime);
  RLOpcoes1.Caption := 'Arquivo Gerado.: ' + qryDefault.FieldByName
    ('LOCAL_ARQUIVO').AsString;
  RLOpcoes2.Caption := 'Conta Cedente..: ' + FormatFloat('000',
    qryDefault.FieldByName('IDBANCO').AsInteger) + ' ' +
    FormatFloat('00000', qryDefault.FieldByName('AGENCIA').AsInteger) + ' ' +
    qryDefault.FieldByName('CONTA').AsString;
end;

class procedure TfrmREMESSArelatorio.ShowRelatorio(vID_CBR_REMESSA: Integer);
begin
  frmREMESSArelatorio := TfrmREMESSArelatorio.Create(Nil);
  try
    frmREMESSArelatorio.FID_CBR_REMESSA := vID_CBR_REMESSA;
    frmREMESSArelatorio.RLReport.PreviewModal;
  finally
    FreeAndNil(frmREMESSArelatorio);
  end;
end;

end.
