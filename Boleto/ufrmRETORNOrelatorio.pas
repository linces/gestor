unit ufrmRETORNOrelatorio;

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
  TfrmRETORNOrelatorio = class(TfrmDefault)
    RLReport: TRLReport;
    RLCabecalho: TRLBand;
    RLEmpresa: TRLLabel;
    RLTitulo: TRLLabel;
    RLOpcoes1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    H1: TRLLabel;
    dtsqryDefault: TDataSource;
    RLPDFFilter1: TRLPDFFilter;
    qryDefault: TFDQuery;
    qryDefaultITEM: TFDQuery;
    dtsqryDefaultITEM: TDataSource;
    RLGrupo: TRLGroup;
    RLOpcoes: TRLLabel;
    RLOpcoes2: TRLLabel;
    qryDefaultRAZAOSOCIAL: TStringField;
    qryDefaultID_EMPRESA: TIntegerField;
    qryDefaultID_CBR_RETORNO: TLargeintField;
    qryDefaultDTHORA_CADASTRO: TSQLTimeStampField;
    qryDefaultDTHORA_PROCESSAMENTO: TSQLTimeStampField;
    qryDefaultDTHORA_ARQUIVAMENTO: TSQLTimeStampField;
    qryDefaultARQUIVO: TMemoField;
    qryDefaultARQUIVO_NOME: TStringField;
    qryDefaultARQUIVO_DATA: TSQLTimeStampField;
    qryDefaultARQUIVO_NUMERO: TIntegerField;
    qryDefaultARQUIVO_LOCAL: TStringField;
    qryDefaultARQUIVO_MD5: TStringField;
    qryDefaultARQUIVO_QUANT_TITULOS: TIntegerField;
    qryDefaultSITUACAO: TSmallintField;
    qryDefaultITEMID_EMPRESA: TIntegerField;
    qryDefaultITEMID_CBR_RETORNO: TLargeintField;
    qryDefaultITEMNOSSO_NUMERO: TStringField;
    qryDefaultITEMVALOR_DOCUMENTO: TFMTBCDField;
    qryDefaultITEMVALOR_PAGO: TFMTBCDField;
    qryDefaultITEMVALOR_JUROS: TFMTBCDField;
    qryDefaultITEMVALOR_DESCONTO: TFMTBCDField;
    qryDefaultITEMVALOR_DESPESA: TFMTBCDField;
    qryDefaultITEMTIPO_OCORRENCIA_DESC: TStringField;
    qryDefaultITEMTITULO_JALIQUIDADO: TStringField;
    qryDefaultITEMTITULO_SEMREGISTRO: TStringField;
    qryDefaultITEMTITULO_LIQUIDADO_LIMITEP: TStringField;
    qryDefaultITEMTITULO_RECUSADO: TStringField;
    qryDefaultITEMTITULO_LOCALIZADO: TStringField;
    qryDefaultITEMRAZAOSOCIAL: TStringField;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLDBText3: TRLDBText;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText13: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText14: TRLDBText;
    RLBand3: TRLBand;
    RLLabel14: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel15: TRLLabel;
    qryDefaultITEMCNPJ: TStringField;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure qryDefaultAfterOpen(DataSet: TDataSet);
    procedure qryDefaultBeforeOpen(DataSet: TDataSet);
    procedure qryDefaultITEMTIPO_OCORRENCIA_DESCGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryDefaultITEMCPF_CNPJGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDefaultITEMRAZAOSOCIALGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FID_CBR_RETORNO: Integer;
  public
    class procedure ShowRelatorio(vID_CBR_RETORNO: Integer);
  end;

var
  frmRETORNOrelatorio: TfrmRETORNOrelatorio;

implementation

{$R *.dfm}

uses ufuncoes, Udados;

{ TfrmDefault1 }

procedure TfrmRETORNOrelatorio.qryDefaultAfterOpen(DataSet: TDataSet);
begin
  qryDefaultITEM.Active := DataSet.Active;
end;

procedure TfrmRETORNOrelatorio.qryDefaultBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    dados.qryempresaCodigo.value;
end;

procedure TfrmRETORNOrelatorio.qryDefaultITEMCPF_CNPJGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := FormatarCNPJCPF(Sender.AsString);
end;

procedure TfrmRETORNOrelatorio.qryDefaultITEMRAZAOSOCIALGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 22);
end;

procedure TfrmRETORNOrelatorio.qryDefaultITEMTIPO_OCORRENCIA_DESCGetText
  (Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 15);
end;

procedure TfrmRETORNOrelatorio.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;

  qryDefault.Close;
  qryDefault.ParamByName('ID_CBR_RETORNO').AsInteger := FID_CBR_RETORNO;
  qryDefault.Open;
  qryDefault.FetchAll;

  RLEmpresa.Caption := qryDefault.FieldByName('RAZAOSOCIAL').AsString.Trim;
  RLTitulo.Caption := 'Retorno Número.....: ' + qryDefault.FieldByName
    ('ID_CBR_RETORNO').AsString;
  RLOpcoes.Caption := 'Data Cadastro......: ' +
    FormatDateTime('dd/mm/yyy hh:mm:ss',
    qryDefault.FieldByName('DTHORA_CADASTRO').AsDateTime);
  if not qryDefault.FieldByName('DTHORA_PROCESSAMENTO').IsNull then
    RLOpcoes1.Caption := 'Data Processamento.: ' +
      FormatDateTime('dd/mm/yyy hh:mm:ss',
      qryDefault.FieldByName('DTHORA_PROCESSAMENTO').AsDateTime)
  else if not qryDefault.FieldByName('DTHORA_ARQUIVAMENTO').IsNull then
    RLOpcoes1.Caption := 'Data Arquivamento..: ' +
      FormatDateTime('dd/mm/yyy hh:mm:ss',
      qryDefault.FieldByName('DTHORA_ARQUIVAMENTO').AsDateTime)
  else
    RLOpcoes1.Caption := 'Data Arquivamento..: Arquivo ainda não processado.';
  RLOpcoes2.Caption := 'Arquivo............: ' + qryDefault.FieldByName
    ('ARQUIVO_LOCAL').AsString + qryDefault.FieldByName('ARQUIVO_NOME')
    .AsString;
end;

class procedure TfrmRETORNOrelatorio.ShowRelatorio(vID_CBR_RETORNO: Integer);
begin
  frmRETORNOrelatorio := TfrmRETORNOrelatorio.Create(Nil);
  try
    frmRETORNOrelatorio.FID_CBR_RETORNO := vID_CBR_RETORNO;
    frmRETORNOrelatorio.RLReport.PreviewModal;
  finally
    FreeAndNil(frmRETORNOrelatorio);
  end;
end;

end.
