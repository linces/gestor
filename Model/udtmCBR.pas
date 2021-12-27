unit udtmCBR;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Vcl.Dialogs,

  ACBrMail, ACBrBase, ACBrDFe, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrNFe, ACBrNFeNotasFiscais, pcnNFe,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBoleto, ACBrBoletoFCFR,
  ACBrExtenso, ACBrBoletoFCFortesFr;

type
  TdtmCBR = class(TDataModule)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    tabCBR_TITULOS: TFDQuery;
    qryPESSOAS: TFDQuery;
    tabCBR_TITULOScalc_VlrTotal: TCurrencyField;
    ACBrExtenso: TACBrExtenso;
    ACBrBoleto1: TACBrBoleto;
    qryCBR_CONFIG: TFDQuery;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    tabCBR_REMESSA: TFDQuery;
    tabCBR_REMESSAID_EMPRESA: TIntegerField;
    tabCBR_REMESSAID_CBR_REMESSA: TLargeintField;
    tabCBR_REMESSADATA: TSQLTimeStampField;
    tabCBR_REMESSAIDBANCO: TSmallintField;
    tabCBR_REMESSAAGENCIA: TStringField;
    tabCBR_REMESSAAGENCIA_DIGITO: TStringField;
    tabCBR_REMESSACONTA: TStringField;
    tabCBR_REMESSACONTA_DIGITO: TStringField;
    tabCBR_REMESSACODIGO_CEDENTE: TStringField;
    tabCBR_REMESSACONVENIO: TStringField;
    tabCBR_REMESSAMODALIDADE: TStringField;
    tabCBR_REMESSALOCAL_DE_PAGAMENTO: TStringField;
    tabCBR_REMESSAMENSAGEM: TStringField;
    tabCBR_REMESSAINSTRUCAO1: TStringField;
    tabCBR_REMESSAINSTRUCAO2: TStringField;
    tabCBR_REMESSAPERCENTUAL_JUROS: TFMTBCDField;
    tabCBR_REMESSAPERCENTUAL_MULTA: TFMTBCDField;
    tabCBR_REMESSACARTEIRA: TStringField;
    tabCBR_REMESSADATA_GERACAO: TSQLTimeStampField;
    tabCBR_REMESSALOCAL_ARQUIVO: TStringField;
    tabCBR_REMESSADATA_PROC_BANCO: TSQLTimeStampField;
    tabCBR_REMESSA_TITULOS: TFDQuery;
    dtstabCBR_REMESSA: TDataSource;
    qryREMESSA_TITULOS: TFDQuery;
    tabCBR_REMESSAID_CBR_REMESSA_UUID: TStringField;
    qryCBR_TITULOS_SEL: TFDQuery;
    tabCBR_REMESSAARQUIVO: TMemoField;
    tabCBR_REMESSACANCELADA: TStringField;
    qryREMESSA_TITULOSID_CBR_REMESSA_UUID: TStringField;
    qryREMESSA_TITULOSFKEMPRESA: TIntegerField;
    qryREMESSA_TITULOSCODIGO: TIntegerField;
    qryREMESSA_TITULOSVALOR: TCurrencyField;
    qryREMESSA_TITULOSHISTORICO: TStringField;
    qryREMESSA_TITULOSDATA: TDateField;
    qryREMESSA_TITULOSDTVENCIMENTO: TDateField;
    qryREMESSA_TITULOSRAZAO: TStringField;
    qryREMESSA_TITULOSCNPJ: TStringField;
    qryREMESSA_TITULOSENDERECO: TStringField;
    qryREMESSA_TITULOSNUMERO: TStringField;
    qryREMESSA_TITULOSBAIRRO: TStringField;
    qryREMESSA_TITULOSCOMPLEMENTO: TStringField;
    qryREMESSA_TITULOSCEP: TStringField;
    qryREMESSA_TITULOSUF: TStringField;
    qryREMESSA_TITULOSMUNICIPIO: TStringField;
    qryREMESSA_TITULOSREMESSA_REENVIO: TStringField;
    qryCBR_TITULOS_SELCODIGO: TIntegerField;
    qryCBR_TITULOS_SELDATA: TDateField;
    qryCBR_TITULOS_SELFKCLIENTE: TIntegerField;
    qryCBR_TITULOS_SELDOC: TStringField;
    qryCBR_TITULOS_SELVALOR: TCurrencyField;
    qryCBR_TITULOS_SELDTVENCIMENTO: TDateField;
    qryCBR_TITULOS_SELHISTORICO: TStringField;
    qryCBR_TITULOS_SELDATA_RECEBIMENTO: TDateField;
    qryCBR_TITULOS_SELDESCONTO: TCurrencyField;
    qryCBR_TITULOS_SELJUROS: TFMTBCDField;
    qryCBR_TITULOS_SELVRECEBIDO: TCurrencyField;
    qryCBR_TITULOS_SELVL_RESTANTE: TFMTBCDField;
    qryCBR_TITULOS_SELSITUACAO: TStringField;
    qryCBR_TITULOS_SELFKEMPRESA: TIntegerField;
    qryCBR_TITULOS_SELFK_VENDA: TIntegerField;
    qryCBR_TITULOS_SELFKCONTA: TIntegerField;
    qryCBR_TITULOS_SELTIPO: TStringField;
    qryCBR_TITULOS_SELNBOLETO: TIntegerField;
    qryCBR_TITULOS_SELID_VENDEDOR: TIntegerField;
    qryCBR_TITULOS_SELFLAG: TStringField;
    qryCBR_TITULOS_SELFK_OS: TIntegerField;
    qryCBR_TITULOS_SELBLOQUEADO: TStringField;
    qryCBR_TITULOS_SELFK_USUARIO: TIntegerField;
    qryCBR_TITULOS_SELCARTAO: TStringField;
    qryCBR_TITULOS_SELFPG_VENDA: TIntegerField;
    qryCBR_TITULOS_SELREMESSA: TStringField;
    qryCBR_TITULOS_SELREMESSA_REENVIAR: TStringField;
    qryCBR_TITULOS_SELREMESSA_DATA: TDateField;
    qryCBR_TITULOS_SELREMESSA_ARQUIVO: TStringField;
    qryCBR_TITULOS_SELREGISTRO_ID_CBR_RETORNO: TLargeintField;
    qryCBR_TITULOS_SELREGISTRO_STATUS: TStringField;
    qryCBR_TITULOS_SELREGISTRO_DATA: TSQLTimeStampField;
    qryCBR_TITULOS_SELREGISTRO_ARQUIVO: TStringField;
    qryCBR_TITULOS_SELREGISTRO_HISTORICO: TStringField;
    qryCBR_TITULOS_SELREGISTRO_SEM_REGISTRO: TStringField;
    qryCBR_TITULOS_SELREGISTRO_LIMITE_PRAZO: TStringField;
    qryCBR_TITULOS_SELRETORNO_HISTORICO: TStringField;
    qryCBR_TITULOS_SELOBS: TStringField;
    qryCBR_TITULOS_SELID_CBR_REMESSA_UUID: TStringField;
    qryCBR_TITULOS_SELRAZAO: TStringField;
    qryCBR_TITULOS_SELCNPJ: TStringField;
    qryCBR_TITULOS_SELENDERECO: TStringField;
    qryCBR_TITULOS_SELNUMERO: TStringField;
    qryCBR_TITULOS_SELBAIRRO: TStringField;
    qryCBR_TITULOS_SELCOMPLEMENTO: TStringField;
    qryCBR_TITULOS_SELCEP: TStringField;
    qryCBR_TITULOS_SELUF: TStringField;
    qryCBR_TITULOS_SELMUNICIPIO: TStringField;
    qryPESSOASEMPRESA: TSmallintField;
    qryPESSOASCODIGO: TIntegerField;
    qryPESSOASTIPO: TStringField;
    qryPESSOASCNPJ: TStringField;
    qryPESSOASIE: TStringField;
    qryPESSOASFANTASIA: TStringField;
    qryPESSOASRAZAO: TStringField;
    qryPESSOASENDERECO: TStringField;
    qryPESSOASNUMERO: TStringField;
    qryPESSOASCOMPLEMENTO: TStringField;
    qryPESSOASCODMUN: TIntegerField;
    qryPESSOASMUNICIPIO: TStringField;
    qryPESSOASBAIRRO: TStringField;
    qryPESSOASUF: TStringField;
    qryPESSOASCEP: TStringField;
    qryPESSOASFONE1: TStringField;
    qryPESSOASFONE2: TStringField;
    qryPESSOASCELULAR1: TStringField;
    qryPESSOASCELULAR2: TStringField;
    qryPESSOASEMAIL1: TStringField;
    qryPESSOASEMAIL2: TStringField;
    qryPESSOASFOTO: TBlobField;
    qryPESSOASSEXO: TStringField;
    qryPESSOASDT_NASC: TDateField;
    qryPESSOASECIVIL: TStringField;
    qryPESSOASLIMITE: TFMTBCDField;
    qryPESSOASDIA_PGTO: TSmallintField;
    qryPESSOASOBS: TMemoField;
    qryPESSOASNUM_USU: TSmallintField;
    qryPESSOASFATURA: TStringField;
    qryPESSOASCHEQUE: TStringField;
    qryPESSOASCCF: TStringField;
    qryPESSOASSPC: TStringField;
    qryPESSOASISENTO: TStringField;
    qryPESSOASFORN: TStringField;
    qryPESSOASFUN: TStringField;
    qryPESSOASCLI: TStringField;
    qryPESSOASFAB: TStringField;
    qryPESSOASTRAN: TStringField;
    qryPESSOASADM: TStringField;
    qryPESSOASATIVO: TStringField;
    qryPESSOASDT_ADMISSAO: TDateField;
    qryPESSOASDT_DEMISSAO: TDateField;
    qryPESSOASSALARIO: TFMTBCDField;
    qryPESSOASPAI: TStringField;
    qryPESSOASMAE: TStringField;
    qryPESSOASBANCO: TStringField;
    qryPESSOASAGENCIA: TStringField;
    qryPESSOASGERENTE: TStringField;
    qryPESSOASFONE_GERENTE: TStringField;
    qryPESSOASPROPRIEDADE: TStringField;
    qryPESSOASDT_CADASTRO: TDateField;
    qryPESSOASTECNICO: TStringField;
    qryPESSOASATENDENTE: TStringField;
    qryPESSOASCODIGO_WEB: TIntegerField;
    qryPESSOASREFERENCIA: TIntegerField;
    tabCBR_REMESSA_TITULOSID_EMPRESA: TIntegerField;
    tabCBR_REMESSA_TITULOSID_CBR_REMESSA: TLargeintField;
    tabCBR_REMESSA_TITULOSID_CBR_TITULOS: TLargeintField;
    tabCBR_REMESSA_TITULOSDT_EMISSAO: TSQLTimeStampField;
    tabCBR_REMESSA_TITULOSDT_VENCIMENTO: TSQLTimeStampField;
    tabCBR_REMESSA_TITULOSVALOR: TFMTBCDField;
    tabCBR_REMESSA_TITULOSCLI_RAZAOSOCIAL: TStringField;
    tabCBR_REMESSA_TITULOSCLI_CNPJCPF: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDERECO: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDNUMERO: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDBAIRRO: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDCIDADE: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDUF: TStringField;
    tabCBR_REMESSA_TITULOSCLI_ENDCEP: TStringField;
    tabCBR_REMESSA_TITULOSDT_PAGAMENTO: TDateField;
    tabCBR_REMESSA_TITULOSCANCELAMENTO_LOJA: TStringField;
    tabCBR_REMESSA_TITULOSPAGAMENTO_LOJA: TStringField;
    tabCBR_REMESSA_TITULOSALTERACAO_LOJA: TStringField;
    tabCBR_TITULOSCODIGO: TIntegerField;
    tabCBR_TITULOSDATA: TDateField;
    tabCBR_TITULOSFKCLIENTE: TIntegerField;
    tabCBR_TITULOSDOC: TStringField;
    tabCBR_TITULOSVALOR: TCurrencyField;
    tabCBR_TITULOSDTVENCIMENTO: TDateField;
    tabCBR_TITULOSHISTORICO: TStringField;
    tabCBR_TITULOSDATA_RECEBIMENTO: TDateField;
    tabCBR_TITULOSDESCONTO: TCurrencyField;
    tabCBR_TITULOSJUROS: TFMTBCDField;
    tabCBR_TITULOSVL_RESTANTE: TFMTBCDField;
    tabCBR_TITULOSSITUACAO: TStringField;
    tabCBR_TITULOSFKEMPRESA: TIntegerField;
    tabCBR_TITULOSFK_VENDA: TIntegerField;
    tabCBR_TITULOSVRECEBIDO: TCurrencyField;
    tabCBR_TITULOSFKCONTA: TIntegerField;
    tabCBR_TITULOSTIPO: TStringField;
    tabCBR_TITULOSNBOLETO: TIntegerField;
    tabCBR_TITULOSID_VENDEDOR: TIntegerField;
    tabCBR_TITULOSFLAG: TStringField;
    tabCBR_TITULOSFK_OS: TIntegerField;
    tabCBR_TITULOSBLOQUEADO: TStringField;
    tabCBR_TITULOSFK_USUARIO: TIntegerField;
    tabCBR_TITULOSCARTAO: TStringField;
    tabCBR_TITULOSFPG_VENDA: TIntegerField;
    tabCBR_TITULOSREMESSA: TStringField;
    tabCBR_TITULOSREMESSA_REENVIAR: TStringField;
    tabCBR_TITULOSREMESSA_DATA: TDateField;
    tabCBR_TITULOSREMESSA_ARQUIVO: TStringField;
    tabCBR_TITULOSREGISTRO_ID_CBR_RETORNO: TLargeintField;
    tabCBR_TITULOSREGISTRO_STATUS: TStringField;
    tabCBR_TITULOSREGISTRO_DATA: TSQLTimeStampField;
    tabCBR_TITULOSREGISTRO_ARQUIVO: TStringField;
    tabCBR_TITULOSRETORNO_ID_CBR_RETORNO: TIntegerField;
    tabCBR_TITULOSREGISTRO_HISTORICO: TStringField;
    tabCBR_TITULOSREGISTRO_SEM_REGISTRO: TStringField;
    tabCBR_TITULOSREGISTRO_LIMITE_PRAZO: TStringField;
    tabCBR_TITULOSRETORNO_HISTORICO: TStringField;
    tabCBR_TITULOSOBS: TStringField;
    tabCBR_TITULOSID_CBR_REMESSA_UUID: TStringField;
    tabCBR_TITULOSRETORNO_SEM_REGISTRO: TStringField;
    tabCBR_TITULOSRETORNO_LIMITE_PRAZO: TStringField;
    qryCBR_TITULOS_SELRETORNO_ID_CBR_RETORNO: TIntegerField;
    qryCBR_TITULOS_SELRETORNO_SEM_REGISTRO: TStringField;
    qryCBR_TITULOS_SELRETORNO_LIMITE_PRAZO: TStringField;
    qryCBR_TITULOS_SELPAGAMENTO_LOJA: TStringField;
    qryCBR_TITULOS_SELCANCELAMENTO_LOJA: TStringField;
    qryCBR_TITULOS_SELCANCELAMENTO_DATA: TSQLTimeStampField;
    qryCBR_TITULOS_SELALTERACAO_LOJA: TStringField;
    qryCBR_CONFIGID_EMPRESA: TIntegerField;
    qryCBR_CONFIGDIRRECEBE: TStringField;
    qryCBR_CONFIGDIRENVIA: TStringField;
    qryCBR_CONFIGDIRRECEBEBKP: TStringField;
    qryCBR_CONFIGVLRTARIFABOLETA: TFMTBCDField;
    qryCBR_CONFIGTIPOCOBRANCA: TStringField;
    qryCBR_CONFIGCODBANCO: TSmallintField;
    qryCBR_CONFIGAGENCIA: TSmallintField;
    qryCBR_CONFIGCONTA: TStringField;
    qryCBR_CONFIGCONTADIG: TStringField;
    qryCBR_CONFIGCODCEDENTE: TStringField;
    qryCBR_CONFIGCODCEDENTEDIG: TStringField;
    qryCBR_CONFIGCONVENIO: TStringField;
    qryCBR_CONFIGCARTEIRA: TStringField;
    qryCBR_CONFIGMODALIDADE: TStringField;
    qryCBR_CONFIGESPECIEDOC: TStringField;
    qryCBR_CONFIGCOBMOEDA: TStringField;
    qryCBR_CONFIGCOBACEITE: TStringField;
    qryCBR_CONFIGLOCALPAGTO: TStringField;
    qryCBR_CONFIGINSTRUCAO1: TStringField;
    qryCBR_CONFIGINSTRUCAO2: TStringField;
    qryCBR_CONFIGEMP_RAZAOSOCIAL: TStringField;
    qryCBR_CONFIGEMP_CNPJ: TStringField;
    qryCBR_CONFIGEMP_ENDERECO: TStringField;
    qryCBR_CONFIGEMP_COMPLEMENTO: TStringField;
    qryCBR_CONFIGEMP_BAIRRO: TStringField;
    qryCBR_CONFIGCIDADE: TStringField;
    qryCBR_CONFIGEMP_UF: TStringField;
    qryCBR_CONFIGEMP_CEP: TStringField;
    qryCBR_CONFIGEMP_TELEFONE: TStringField;
    qryCBR_CONFIGCNAB: TStringField;
    qryCBR_CONFIGAGENCIAD: TStringField;
    ACBrMail1: TACBrMail;
    procedure qryPESSOABeforeOpen(DataSet: TDataSet);
    procedure tabCBR_TITULOSAfterOpen(DataSet: TDataSet);
    procedure tabCBR_TITULOSCalcFields(DataSet: TDataSet);
    procedure tabCBR_REMESSANewRecord(DataSet: TDataSet);
    procedure tabCBR_REMESSAAfterOpen(DataSet: TDataSet);
    procedure tabCBR_REMESSABeforePost(DataSet: TDataSet);
    procedure qryPESSOASBeforeOpen(DataSet: TDataSet);
    procedure tabCBR_TITULOSBeforeOpen(DataSet: TDataSet);
    procedure tabCBR_REMESSABeforeOpen(DataSet: TDataSet);
    procedure qryCBR_CONFIGBeforeOpen(DataSet: TDataSet);
  private
    procedure SetarDisplayLabel(vDataSet: TDataSet);
  public
    procedure ConfigurarBoleta;
    procedure EnviarEmal(email, Cliente: string);
  end;

var
  dtmCBR: TdtmCBR;

implementation

uses
  ufrmDefault, uclassDB, ufuncoes, ACBrUtil, Vcl.Forms, Winapi.Windows,
  ufrmMensagemEspera,
  ACBrValidador, uclassCBR_TITULOS,
  TypInfo, uclassCBR_REMESSA, uclassUTIL, Udados;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdtmCBR.ConfigurarBoleta;
  function StrToTipoCobranca(const AValor: String): TACBrTipoCobranca;
  begin
    Result := TACBrTipoCobranca
      (GetEnumValue(TypeInfo(TACBrTipoCobranca), AValor))
  end;

begin
  try
    qryCBR_CONFIG.Close;
    qryCBR_CONFIG.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
    qryCBR_CONFIG.Open;
    qryCBR_CONFIG.FetchAll;

    if qryCBR_CONFIG.IsEmpty then
      raise Exception.Create
        ('Configuração da cobrança não foi efetuada, favor corrigir.');

    // dados da empresa cedente

    if qryCBR_CONFIGCNAB.Value = 'CNAB 400' then
      ACBrBoleto1.LayoutRemessa := c400
    else
      ACBrBoleto1.LayoutRemessa := c240;

    ACBrBoleto1.Banco.TamanhoMaximoNossoNum := 7;
    ACBrBoleto1.Banco.TipoCobranca :=

      StrToTipoCobranca(qryCBR_CONFIG.FieldByName('TIPOCOBRANCA').AsString);
    ACBrBoleto1.Cedente.Nome := qryCBR_CONFIG.FieldByName
      ('EMP_RAZAOSOCIAL').AsString;
    ACBrBoleto1.Cedente.CNPJCPF := qryCBR_CONFIG.FieldByName
      ('EMP_CNPJ').AsString;
    ACBrBoleto1.Cedente.CodigoCedente := qryCBR_CONFIG.FieldByName('CODCEDENTE')
      .AsString.Trim;
    ACBrBoleto1.Cedente.Convenio := qryCBR_CONFIG.FieldByName('CONVENIO')
      .AsString.Trim;
    ACBrBoleto1.Cedente.Modalidade := qryCBR_CONFIG.FieldByName('MODALIDADE')
      .AsString.Trim;
    ACBrBoleto1.Cedente.Agencia := qryCBR_CONFIG.FieldByName('AGENCIA')
      .AsString.Trim;
    ACBrBoleto1.Cedente.AgenciaDigito := qryCBR_CONFIG.FieldByName('AGENCIAD')
      .AsString.Trim;
    ACBrBoleto1.Cedente.Conta := qryCBR_CONFIG.FieldByName('CONTA')
      .AsString.Trim;
    ACBrBoleto1.Cedente.ContaDigito := qryCBR_CONFIG.FieldByName('CONTADIG')
      .AsString.Trim;
    ACBrBoleto1.Cedente.Logradouro := qryCBR_CONFIG.FieldByName
      ('EMP_ENDERECO').AsString;
    ACBrBoleto1.Cedente.Complemento := qryCBR_CONFIG.FieldByName
      ('EMP_COMPLEMENTO').AsString;
    ACBrBoleto1.Cedente.Bairro := qryCBR_CONFIG.FieldByName
      ('EMP_BAIRRO').AsString;
    ACBrBoleto1.Cedente.Cidade := qryCBR_CONFIG.FieldByName('CIDADE').AsString;
    ACBrBoleto1.Cedente.CEP := qryCBR_CONFIG.FieldByName('EMP_CEP').AsString;
    ACBrBoleto1.Cedente.UF := qryCBR_CONFIG.FieldByName('EMP_UF').AsString;
    ACBrBoleto1.Cedente.Telefone := qryCBR_CONFIG.FieldByName
      ('EMP_TELEFONE').AsString;
    ACBrBoleto1.DirArqRetorno := qryCBR_CONFIG.FieldByName('DIRRECEBE')
      .AsString;
    ACBrBoleto1.DirArqRemessa := qryCBR_CONFIG.FieldByName('DIRENVIA').AsString;

    ACBrBoletoFCFortes1.DirLogo := ExtractFilePath(Application.ExeName) +
      'Boleto\Logos';
  finally
    // qryCBR_CONFIG.Close;
  end;

  if not DirectoryExists(ACBrBoleto1.DirArqRetorno) then
    raise Exception.Create('Diretório de Retorno não existe, favor verificar!' +
      sLineBreak + sLineBreak + ACBrBoleto1.DirArqRetorno);

  if not DirectoryExists(ACBrBoleto1.DirArqRemessa) then
    raise Exception.Create('Diretório de Remessa não existe, favor verificar!' +
      sLineBreak + sLineBreak + ACBrBoleto1.DirArqRemessa);
end;

procedure TdtmCBR.SetarDisplayLabel(vDataSet: TDataSet);
var
  vTab: TFDQuery;
begin
  vTab := TFDQuery(vDataSet);

  if vTab.GetNamePath = 'tabNFE' then
  begin
    vTab.FieldByName('ID_EMPRESA').DisplayLabel := '';
  end;
end;

procedure TdtmCBR.tabCBR_REMESSAAfterOpen(DataSet: TDataSet);
begin
  qryREMESSA_TITULOS.Active := DataSet.Active;
end;

procedure TdtmCBR.tabCBR_REMESSABeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    Dados.qryEmpresaCODIGO.Value;
end;

procedure TdtmCBR.tabCBR_REMESSABeforePost(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
    DataSet.FieldByName('ID_CBR_REMESSA').AsInteger := oCbrREMESSA.GetNewID;
end;

procedure TdtmCBR.tabCBR_REMESSANewRecord(DataSet: TDataSet);
begin
  try
    qryCBR_CONFIG.Close;
    qryCBR_CONFIG.Open;
    qryCBR_CONFIG.FetchAll;

    if qryCBR_CONFIG.IsEmpty then
      raise Exception.Create
        ('Erro, não foi localizado registro de configuração para gerar a remessa, favor conferir!');

    DataSet.FieldByName('ID_EMPRESA').AsInteger := Dados.qryEmpresaCODIGO.Value;
    DataSet.FieldByName('ID_CBR_REMESSA_UUID').AsString :=
      oUtil.GetGUID.ToString;
    DataSet.FieldByName('DATA').AsDateTime := Now;
    DataSet.FieldByName('IDBANCO').AsInteger := qryCBR_CONFIGCODBANCO.AsInteger;
    DataSet.FieldByName('AGENCIA').AsString :=
      qryCBR_CONFIGAGENCIA.AsString.Trim;
    DataSet.FieldByName('AGENCIA_DIGITO').AsString :=
      qryCBR_CONFIGAGENCIAD.AsString.Trim;
    DataSet.FieldByName('CONTA').AsString := qryCBR_CONFIGCONTA.AsString.Trim;
    DataSet.FieldByName('CONTA_DIGITO').AsString :=
      qryCBR_CONFIGCONTADIG.AsString.Trim;
    DataSet.FieldByName('CODIGO_CEDENTE').AsString :=
      qryCBR_CONFIGCODCEDENTE.AsString.Trim;
    DataSet.FieldByName('CONVENIO').AsString :=
      qryCBR_CONFIGCONVENIO.AsString.Trim;
    DataSet.FieldByName('MODALIDADE').AsString :=
      qryCBR_CONFIGMODALIDADE.AsString.Trim;
    DataSet.FieldByName('LOCAL_DE_PAGAMENTO').AsString :=
      qryCBR_CONFIGLOCALPAGTO.AsString.Trim;
    DataSet.FieldByName('MENSAGEM').AsString := EmptyStr;
    DataSet.FieldByName('INSTRUCAO1').AsString :=
      qryCBR_CONFIGINSTRUCAO1.AsString.Trim;
    DataSet.FieldByName('INSTRUCAO2').AsString :=
      qryCBR_CONFIGINSTRUCAO2.AsString.Trim;
    DataSet.FieldByName('PERCENTUAL_JUROS').AsCurrency := 0.00;
    DataSet.FieldByName('PERCENTUAL_MULTA').AsCurrency := 0.00;
    DataSet.FieldByName('CARTEIRA').AsString :=
      qryCBR_CONFIGCARTEIRA.AsString.Trim;
    DataSet.FieldByName('CANCELADA').AsString := 'N';
  finally
    qryCBR_CONFIG.Close;
  end;
end;

procedure TdtmCBR.tabCBR_TITULOSAfterOpen(DataSet: TDataSet);
begin
  qryPESSOAS.Active := DataSet.Active;
end;

procedure TdtmCBR.tabCBR_TITULOSBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    Dados.qryEmpresaCODIGO.Value;
end;

procedure TdtmCBR.tabCBR_TITULOSCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('calc_VlrTotal').AsCurrency :=
      (FieldByName('VALOR').AsCurrency + FieldByName('VLACRESCIMO').AsCurrency +
      FieldByName('VLJURO').AsCurrency) - FieldByName('VLDESCONTO').AsCurrency;
  end;
end;

procedure TdtmCBR.EnviarEmal(email, Cliente: string);
var
  mensagem: Tstrings;
  para: string;
begin

  if Trim(Dados.qryEmpresaEMAIL.AsString) = '' then
    exit;

  try
    mensagem := TstringList.Create;
    mensagem.Add('SEGUE EM ANEXO BOLETO DE COBRANÇA');

    FEmail.GetEmail;

    ACBrMail1.FromName := Cliente;
    ACBrMail1.Host := FEmail.servidor;
    ACBrMail1.Port := FEmail.porta;
    ACBrMail1.AddAddress(LowerCase(FEmail.usuario), '');
    ACBrMail1.Username := LowerCase(FEmail.usuario);
    ACBrMail1.From := LowerCase(FEmail.usuario);
    ACBrMail1.Password := FEmail.Senha;

    ACBrMail1.DefaultCharset := TMailCharset(27);
    ACBrMail1.IDECharset := TMailCharset(15);

    ACBrMail1.IsHTML := false;

    ACBrMail1.SetSSL := false;
    ACBrMail1.SetTLS := false;

    if FEmail.SSL then
      ACBrMail1.SetSSL := true;

    if FEmail.TLS then
      ACBrMail1.SetTLS := true;

    ACBrMail1.ReadingConfirmation := true;
    ACBrMail1.UseThread := false;

    if (email = '') then
      para := LowerCase(Dados.qryEmpresaEMAIL.Value)
    else
      para := LowerCase(email);

    ACBrBoleto1.EnviarEmail(para, 'Boleto -' + Cliente, mensagem, true
      // Enviar PDF junto
      , nil // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
      , nil); // Lista de anexos - TStrings}

  finally
    mensagem.Free;
  end;
end;

procedure TdtmCBR.qryCBR_CONFIGBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    Dados.qryEmpresaCODIGO.Value;
end;

procedure TdtmCBR.qryPESSOABeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    Dados.qryEmpresaCODIGO.Value;
end;

procedure TdtmCBR.qryPESSOASBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ID_EMPRESA').AsInteger :=
    Dados.qryEmpresaCODIGO.Value;
end;

end.
