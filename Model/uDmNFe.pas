unit uDmNFe;

interface

uses
  System.SysUtils, vcl.Forms, System.Classes, ACBrNFeDANFeESCPOS,
  ACBrNFeDANFEClass, db,
  pcnConversao, pcnConversaoNFe, ACBrDFeSSL, System.Math, blcksock,
  ACBrDANFCeFortesFrA4, ACBrPosPrinter, ACBrDFe, ACBrNFe, ACBrBase, acbrUtil,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, System.TypInfo,
  ACBrMail;

type
  TdmNFe = class(TDataModule)
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFe: TACBrNFe;
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFCeFortesA41: TACBrNFeDANFCeFortesA4;
    ACBrMail1: TACBrMail;
    procedure ACBrNFeStatusChange(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
  private
    procedure AtualizaNFe(Chave, Protocolo, XML, XMLCancelmaneto, Situacao,
      Flag: String; Codigo: Integer);
    procedure AtualizaNFCe(Chave, Protocolo, XML, XMLCancelmaneto, Situacao,
      Flag: String; Codigo: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure ImpressoraA4NFe(Tipo: String);
    procedure ImpressoraBobina(Tipo: String);
    function StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
    procedure ConfiguraNFe(Tipo: String);
    procedure ImpressoraA4NFCe(Tipo: String);
    function CancelaNFe(XML: string; Justificativa: String; Codigo: Integer;
      Tipo: String; Situacao: String): boolean;
    function CartaCorrecao(Chave: string; CNPJ: string; Sequencia: Integer;
      Texto: String; Tipo: String): boolean;
    function Inutilizar(Justificativa: String; CNPJ: String; Ano: String;
      Modelo: String; Serie: String; nInicial: Integer; nFinal: Integer;
      Tipo: String): boolean;
    procedure ImprimirNFe(XML: String; Situacao: String; Tipo: String;
      TRIBF, TRIBM, TRIBE: Extended);
    function RecuperaNFe(Codigo: Integer; XML: string;
      TRIB_FED, TRIB_EST, TRIB_MUN: Extended; Tipo: String): boolean;
    procedure EnviarEmal(email, Numero, XML, Cliente: string);
    function ConsultaIE(aDocumento, aUF: String): String;
  end;

var
  dmNFe: TdmNFe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados, ufrmStatus, uDMEstoque;

{$R *.dfm}

procedure TdmNFe.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  Application.ProcessMessages;
end;

procedure TdmNFe.ACBrNFeStatusChange(Sender: TObject);
begin
  case ACBrNFe.Status of
    stIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stNFeStatusServico:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeRetRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeConsulta:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeCancelamento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNfeInutilizacao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeRecibo:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeCadastro:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeEmail:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Email...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeCCe:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stNFeEvento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.Caption := 'Enviando Evento...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;
  Application.ProcessMessages;

end;

procedure TdmNFe.AtualizaNFe(Chave, Protocolo, XML, XMLCancelmaneto, Situacao,
  Flag: String; Codigo: Integer);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE NFE_MASTER SET CHAVE=:CHAVE, PROTOCOLO=:PROTOCOLO, XML=:XML, SITUACAO=:SITUACAO, FLAG=:FLAG WHERE CODIGO=:CODIGO';
  dados.qryExecute.ParamByName('CHAVE').Value := Chave;
  dados.qryExecute.ParamByName('PROTOCOLO').Value := Protocolo;
  dados.qryExecute.ParamByName('XML').Value := XML;
  dados.qryExecute.ParamByName('SITUACAO').Value := Situacao;
  dados.qryExecute.ParamByName('FLAG').Value := Flag;
  dados.qryExecute.ParamByName('CODIGO').Value := Codigo;
  dados.qryExecute.Prepare;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

procedure TdmNFe.AtualizaNFCe(Chave, Protocolo, XML, XMLCancelmaneto, Situacao,
  Flag: String; Codigo: Integer);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE NFCE_MASTER SET CHAVE=:CHAVE, PROTOCOLO=:PROTOCOLO, XML=:XML, SITUACAO=:SITUACAO, FLAG=:FLAG WHERE CODIGO=:CODIGO';
  dados.qryExecute.ParamByName('CHAVE').Value := Chave;
  dados.qryExecute.ParamByName('PROTOCOLO').Value := Protocolo;
  dados.qryExecute.ParamByName('XML').Value := XML;
  dados.qryExecute.ParamByName('SITUACAO').Value := Situacao;
  dados.qryExecute.ParamByName('FLAG').Value := Flag;
  dados.qryExecute.ParamByName('CODIGO').Value := Codigo;
  dados.qryExecute.Prepare;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

function TdmNFe.RecuperaNFe(Codigo: Integer; XML: string;
  TRIB_FED, TRIB_EST, TRIB_MUN: Extended; Tipo: String): boolean;
begin
  Result := False;
  dmNFe.ConfiguraNFe(Tipo);
  dmNFe.ImpressoraA4NFe('NFE');

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.NotasFiscais.LoadFromString(XML);
  ACBrNFe.Consultar;

  if ACBrNFe.WebServices.Consulta.cStat = 100 then
  begin

    if Tipo = 'NFe' then
    begin
      AtualizaNFe(copy(dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4,
        100), dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
        dmNFe.ACBrNFe.NotasFiscais.Items[0].XMLAssinado, '', '2', 'N', Codigo);
      Result := true;
    end;

    if Tipo = 'NFCe' then
    begin
      AtualizaNFCe(copy(dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4,
        100), dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
        dmNFe.ACBrNFe.NotasFiscais.Items[0].XMLAssinado, '', 'T', 'N', Codigo);
      Result := true;
    end;

    ACBrNFe.NotasFiscais.GravarXML();

    ACBrNFe.DANFE.vTribFed := TRIB_FED;
    ACBrNFe.DANFE.vTribEst := TRIB_EST;
    ACBrNFe.DANFE.vTribMun := TRIB_MUN;
    ACBrNFe.DANFE.PathPDF := dados.qryConfigPATHPDF.Value;

    ACBrNFe.NotasFiscais.ImprimirPDF;

  end
  else
  begin
    raise Exception.Create('Status:' + #13 +
      IntToStr(ACBrNFe.WebServices.Consulta.cStat) + '-' +
      ACBrNFe.WebServices.Consulta.XMotivo);
  end;
end;

function TdmNFe.Inutilizar(Justificativa: String; CNPJ: String; Ano: String;
  Modelo: String; Serie: String; nInicial: Integer; nFinal: Integer;
  Tipo: String): boolean;
begin
  dmNFe.ConfiguraNFe(Tipo);
  Result := False;
  if length(Justificativa) < 15 then
    raise Exception.Create
      ('Justificativa de Inutilização deve ter mais de 15 caracteres!');

  try
    ACBrNFe.WebServices.Inutiliza(CNPJ, Justificativa, StrToInt(Ano),
      StrToInt(Modelo), StrToInt(Serie), nInicial, nFinal);

  except
    on e: Exception do
    begin
      if (ACBrNFe.WebServices.Inutilizacao.cStat = 256) or
        (ACBrNFe.WebServices.Inutilizacao.cStat = 563) then
        Result := true
      else
        raise Exception.Create(ACBrNFe.WebServices.Inutilizacao.cStat.ToString +
          '|' + ACBrNFe.WebServices.Inutilizacao.XMotivo);
    end;
  end;

  if ACBrNFe.WebServices.Inutilizacao.cStat = 102 then
    Result := true;

end;

function TdmNFe.CartaCorrecao(Chave: string; CNPJ: string; Sequencia: Integer;
  Texto: String; Tipo: String): boolean;
begin
  try
    dmNFe.ConfiguraNFe(Tipo);

    Result := False;
    ACBrNFe.EventoNFe.Evento.Clear;
    with ACBrNFe.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := Chave;
      infEvento.CNPJ := TiraPontos(CNPJ);
      if dados.qryEmpresaTIPO.Value = 'FÍSICA' then
        infEvento.CNPJ := '000' + TiraPontos(CNPJ);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCCe;
      infEvento.nSeqEvento := Sequencia;
      infEvento.detEvento.xCorrecao := Texto;
    end;
    if ACBrNFe.EnviarEvento(StrToInt('1')) then
    begin
      ACBrNFe.ImprimirEvento;
      Result := true;
    end
    else
      raise Exception.Create(ACBrNFe.WebServices.EnvEvento.XMotivo);
  except
    on e: Exception do
      raise Exception.Create('Erro:' + sLineBreak +
        ACBrNFe.WebServices.EnvEvento.XMotivo);
  end;
end;

function TdmNFe.CancelaNFe(XML: string; Justificativa: String; Codigo: Integer;
  Tipo: String; Situacao: String): boolean;
begin
  try

    ConfiguraNFe(Tipo);

    Result := False;

    if length(Justificativa) < 15 then
      raise Exception.Create
        ('Justificativa de cancelamento deve ter mais de 15 caracteres!');

    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromString(XML);

    ACBrNFe.EventoNFe.Evento.Clear;
    ACBrNFe.EventoNFe.idLote := StrToInt('1');

    with ACBrNFe.EventoNFe.Evento.New do
    begin
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := Justificativa;
    end;

    ACBrNFe.EnviarEvento(StrToInt('1'));

    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromString(XML);
    ACBrNFe.Consultar;

    if ACBrNFe.WebServices.Consulta.cStat = 101 then
    begin
      Result := true;

      if Tipo = 'NFe' then
      begin
        AtualizaNFe(copy(dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4,
          100), dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
          dmNFe.ACBrNFe.NotasFiscais.Items[0].XMLAssinado,
          dmNFe.ACBrNFe.NotasFiscais.Items[0].XML, Situacao, 'N', Codigo);
      end;

      if Tipo = 'NFCe' then
      begin
        AtualizaNFCe(copy(dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4,
          100), dmNFe.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt,
          dmNFe.ACBrNFe.NotasFiscais.Items[0].XMLAssinado,
          dmNFe.ACBrNFe.NotasFiscais.Items[0].XML, Situacao, 'N', Codigo);
      end;

    end
    else
      raise Exception.Create(ACBrNFe.WebServices.EnvEvento.XMotivo);
  except
    on e: Exception do
      raise Exception.Create('Erro:' + sLineBreak +
        ACBrNFe.WebServices.EnvEvento.XMotivo);
  end;

end;

procedure TdmNFe.ImpressoraA4NFe(Tipo: String);
begin
  ACBrNFe.DANFE := ACBrNFeDANFeRL1;
  ACBrNFe.DANFE.PathPDF := dados.qryConfigPATHPDF_NFE.Value;
  ACBrNFeDANFeRL1.Sistema := dados.qryParametroEMPRESA.Value + ' | ' +
    dados.qryParametroFONE1.Value + ' ' + dados.qryParametroFONE2.Value;
  ACBrNFeDANFeRL1.Site := dados.qryParametroSITE.Value;
  if FilesExists(dados.qryConfigLOGOMARCA.Value) then
    ACBrNFeDANFeRL1.Logo := dados.qryConfigLOGOMARCA.Value;
end;

procedure TdmNFe.ImpressoraA4NFCe(Tipo: String);
begin
  ACBrNFe.DANFE := ACBrNFeDANFCeFortesA41;
  ACBrNFe.DANFE.PathPDF := dados.qryConfigPATHPDF.Value;
  ACBrNFeDANFCeFortesA41.Sistema := dados.qryParametroEMPRESA.Value + ' | ' +
    dados.qryParametroFONE1.Value + ' ' + dados.qryParametroFONE2.Value;
  ACBrNFeDANFCeFortesA41.Site := dados.qryParametroSITE.Value;
  if FilesExists(dados.qryConfigLOGOMARCA.Value) then
    ACBrNFeDANFCeFortesA41.Logo := dados.qryConfigLOGOMARCA.Value;
end;

function TdmNFe.StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
begin
  Result := TACBrPosPaginaCodigo
    (GetEnumValue(TypeInfo(TACBrPosPaginaCodigo), AValor));
end;

procedure TdmNFe.ImprimirNFe(XML: String; Situacao: String; Tipo: String;
  TRIBF, TRIBM, TRIBE: Extended);
begin

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.NotasFiscais.LoadFromString(XML);

  ACBrNFe.DANFE.Cancelada := False;
  if (Situacao = '3') or (Situacao = 'C') then
    ACBrNFe.DANFE.Cancelada := true;

  ACBrNFe.DANFE.vTribFed := TRIBF;
  ACBrNFe.DANFE.vTribEst := TRIBE;
  ACBrNFe.DANFE.vTribMun := TRIBM;
  ACBrNFe.NotasFiscais.Imprimir;

  if (Situacao = '2') or (Situacao = 'T') then
  begin
    if dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
      ACBrNFe.NotasFiscais.ImprimirPDF;

  end;
end;

procedure TdmNFe.ConfiguraNFe(Tipo: String);
var
  Ok: boolean;
begin
  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  dados.qryconsulta.Close;
  dados.qryconsulta.SQL.Text :=
    'select CONTINGENCIA,PORTA,MODELO,NVIAS,IMPRIME,USAGAVETA from VENDAS_TERMINAIS where NOME='
    + QuotedStr(dados.Getcomputer);
  dados.qryconsulta.Open;

  if (dados.qryConfig.IsEmpty) then
  begin
    raise Exception.Create('Configure os parâmetros para emissão do NFe/NFCe!');
    exit;
  end;

  with ACBrNFe.Configuracoes.Geral do // configurações gerais
  begin

    CamposFatObrigatorios := False;
    ExibirErroSchema := true;
    FormatoAlerta := dados.qryConfigFORMATOALERTA.Value;
    FormaEmissao := TpcnTipoEmissao(teNormal);
    VersaoDF := TpcnVersaoDF(dados.qryConfigVERSAONFE.Value);

    ModeloDF := TpcnModeloDF(moNFe);

    if Tipo = 'NFCe' then
    begin
      ModeloDF := TpcnModeloDF(moNFCe);
      VersaoQRCode := TpcnVersaoQrCode(dados.qryConfigVERSAOQRCODE.Value);
      IdCSC := dados.qryConfigIDTOKEN.Value;
      CSC := dados.qryConfigTOKEN.Text;
    end;

    Salvar := False;
    SSLLib := TSSLLib(dados.qryConfigTIPO_EMISSAO.Value);
    SSLCryptLib := TSSLCryptLib(dados.qryConfigCRYPTLIB.AsInteger);
    SSLHttpLib := TSSLHttpLib(dados.qryConfigHTTPLIB.AsInteger);
    SSLXmlSignLib := TSSLXmlSignLib(dados.qryConfigXMLSIGN.AsInteger);
    ACBrNFe.SSL.SSLType := TSSLType(dados.qryconfigSSL_TIPO.AsInteger);
    Salvar := true;
  end;

  // certificado
  if dados.qryConfigSENHACERTIFICADO.AsString <> '' then
    ACBrNFe.Configuracoes.Certificados.Senha :=
      dados.qryConfigSENHACERTIFICADO.Value;
  if dados.qryConfigCAMINHO_CERTIFICADO.AsString <> '' then
    ACBrNFe.Configuracoes.Certificados.ArquivoPFX :=
      dados.qryConfigCAMINHO_CERTIFICADO.Value;

  if dados.qryConfigNUMEROSERIECERTFICADO.AsString <> '' then
    ACBrNFe.Configuracoes.Certificados.NumeroSerie :=
      dados.qryConfigNUMEROSERIECERTFICADO.Value;

  // ACBrNFe.SSL.CarregarCertificado;

  with ACBrNFe.Configuracoes.WebServices do // configura webservice
  begin
    UF := dados.qryConfigUF.AsString;
    Ambiente := StrToTpAmb(Ok, IntToStr(dados.qryConfigAMBIENTE.Value + 1));

    Visualizar := False;
    if dados.qryConfigVISUALIZAR.Value = 'S' then
      Visualizar := true;

    Salvar := False;
    if dados.qryConfigSALVARSOAP.Value = 'S' then
      Salvar := true;

    AjustaAguardaConsultaRet := False;
    if dados.qryConfigAJUSTARAUTO.Value = 'S' then
      AjustaAguardaConsultaRet := true;

    if NaoEstaVazio(dados.qryConfigAGUARDAR.AsString) then
      AguardarConsultaRet := ifThen(StrToInt(dados.qryConfigAGUARDAR.AsString) <
        1000, StrToInt(dados.qryConfigAGUARDAR.AsString) * 1000,
        StrToInt(dados.qryConfigAGUARDAR.AsString))
    else
      dados.qryConfigAGUARDAR.AsString := IntToStr(AguardarConsultaRet);

    if NaoEstaVazio(dados.qryConfigTENTATIVAS.AsString) then
      Tentativas := StrToInt(dados.qryConfigTENTATIVAS.AsString)
    else
      dados.qryConfigTENTATIVAS.AsString := IntToStr(Tentativas);

    if NaoEstaVazio(dados.qryConfigINTERVALO.AsString) then
      IntervaloTentativas := ifThen(StrToInt(dados.qryConfigINTERVALO.AsString)
        < 1000, StrToInt(dados.qryConfigINTERVALO.AsString) * 1000,
        StrToInt(dados.qryConfigINTERVALO.AsString))
    else
      dados.qryConfigINTERVALO.AsString :=
        IntToStr(ACBrNFe.Configuracoes.WebServices.IntervaloTentativas);

    ProxyHost := dados.qryConfigPROXY_HOST.Value;
    ProxyPort := dados.qryConfigPROXY_PORTA.Value;
    ProxyUser := dados.qryConfigPROXY_USUARIO.Value;
    ProxyPass := dados.qryConfigPROXY_SENHA.Value;

  end;

  with ACBrNFe.Configuracoes.Arquivos do
  // configura caminho dos arqivos
  begin
    Salvar := False;
    SepararPorMes := true;
    AdicionarLiteral := False;
    if dados.qryConfigLITERAL.Value = 'S' then
      AdicionarLiteral := true;

    EmissaoPathNFe := true;
    SalvarEvento := true;
    SepararPorCNPJ := true;
    SepararPorModelo := False;

    if Tipo = 'NFe' then
    begin
      PathSalvar := dados.qryConfigPATHSALVARNFE.Value;
      PathSchemas := dados.qryConfigPATHSCHEMAS_NFE.Value;
      PathNFe := dados.qryConfigPATHENVIADA_NFE.Value;
      PathInu := dados.qryConfigPATHINUTI_NFE.Value;
      PathEvento := dados.qryConfigPATHEVENTO_NFE.Value;
    end;

    if Tipo = 'NFCe' then
    begin
      PathSalvar := dados.qryConfigPATHSALVAR.Value;
      PathSchemas := dados.qryConfigPATHSCHEMAS.Value;
      PathNFe := dados.qryConfigPATHNFE.Value;
      PathInu := dados.qryConfigPATHINUTI.Value;
      PathEvento := dados.qryConfigPATHEVENTO.Value;
    end;

  end;

end;

function TdmNFe.ConsultaIE(aDocumento: String; aUF: String): String;
begin
  try
    Result := '';

    if trim(aDocumento) = '' then
      exit;
    if trim(aUF) = '' then
      exit;

    ConfiguraNFe('NFe');
    ACBrNFe.WebServices.ConsultaCadastro.Clear;
    ACBrNFe.WebServices.ConsultaCadastro.UF := aUF;
    if length(aDocumento) > 11 then
      ACBrNFe.WebServices.ConsultaCadastro.CNPJ := aDocumento
    else
      ACBrNFe.WebServices.ConsultaCadastro.CPF := aDocumento;

    if ACBrNFe.WebServices.ConsultaCadastro.Executar then
    begin
      if dados.qryPessoas.State in dsEditModes then
      begin
        if ACBrNFe.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0]
          .xRegApur = 'NORMAL' then

          dados.qryPessoasREGIME_TRIBUTARIO.Value := 'NORMAL'
        else
          dados.qryPessoasREGIME_TRIBUTARIO.Value := 'SIMPLES';

        dados.qryPessoasIE.Value :=
          TiraPontos(ACBrNFe.WebServices.ConsultaCadastro.RetConsCad.InfCad.
          Items[0].IE);
      end;
    end;
    Result := ACBrNFe.WebServices.ConsultaCadastro.XMotivo;
  except
    // nada
  end;
end;

procedure TdmNFe.EnviarEmal(email, Numero, XML, Cliente: string);
var
  mensagem: Tstrings;
  para: string;
begin
  if trim(dados.qryEmpresaEMAIL.AsString) = '' then
    exit;

  try
    mensagem := TstringList.Create;
    mensagem.Add('SEGUE EM ANEXO XML e DANFE NFE nº ' + Numero);
    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromString(XML);

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

    ACBrMail1.IsHTML := False;

    ACBrMail1.SetSSL := False;
    ACBrMail1.SetTLS := False;

    if FEmail.SSL then
      ACBrMail1.SetSSL := true;

    if FEmail.TLS then
      ACBrMail1.SetTLS := true;

    ACBrMail1.ReadingConfirmation := true;
    ACBrMail1.UseThread := False;

    if (email = '') then
      para := LowerCase(dados.qryEmpresaEMAIL.Value)
    else
      para := LowerCase(email);

    ACBrNFe.NotasFiscais.Items[0].EnviarEmail(para, 'NFE-' + Cliente,
      mensagem, true
      // Enviar PDF junto
      , nil // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
      , nil); // Lista de anexos - TStrings}

  finally
    mensagem.Free;
  end;
end;

procedure TdmNFe.ImpressoraBobina(Tipo: String);
begin

  ACBrPosPrinter1.Desativar;

  ACBrNFe.DANFE := ACBrNFeDANFeESCPOS1;
  ACBrNFe.DANFE.PathPDF := dados.qryConfigPATHPDF_NFE.Value;
  if dados.qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
    ACBrPosPrinter1.Modelo := ppEscDaruma
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
    ACBrPosPrinter1.Modelo := ppEscBematech
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
    ACBrPosPrinter1.Modelo := ppEscPosEpson
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
    ACBrPosPrinter1.Modelo := ppEscDiebold
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
    ACBrPosPrinter1.Modelo := ppEscPosEpson
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'VOX' then
    ACBrPosPrinter1.Modelo := ppEscVox
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'POSSTAR' then
    ACBrPosPrinter1.Modelo := ppEscPosStar
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'JIANG' then
    ACBrPosPrinter1.Modelo := ppEscZJiang
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'GPRINTER' then
    ACBrPosPrinter1.Modelo := ppEscGPrinter
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSONP2' then
    ACBrPosPrinter1.Modelo := ppEscEpsonP2
  else
    ACBrPosPrinter1.Modelo := ppTexto;
  ACBrPosPrinter1.porta := LowerCase(dados.qryTerminal.FieldByName('PORTA')
    .AsString);

  ACBrPosPrinter1.Device.Baud := dados.qryTerminalVELOCIDADE.Value;

  ACBrPosPrinter1.PaginaDeCodigo :=
    StrToPaginaCodigo(dados.qryTerminalPAGINA_CODIGO.AsString);

  ACBrPosPrinter1.EspacoEntreLinhas :=
    dados.qryTerminalESPACO_ENTRE_LINHAS.AsInteger;
  ACBrPosPrinter1.LinhasEntreCupons :=
    dados.qryTerminalLINHAS_ENTRE_CUPOM.AsInteger;

  ACBrNFeDANFeESCPOS1.LarguraBobina := dados.qryTerminalLARGURA_BOBINA.Value;

  ACBrNFeDANFeESCPOS1.MargemDireita := dados.qryTerminalMARGEM_DIREITA.AsFloat;
  ACBrNFeDANFeESCPOS1.MargemEsquerda :=
    dados.qryTerminalMARGEM_ESQUERDA.AsFloat;
  ACBrNFeDANFeESCPOS1.MargemInferior :=
    dados.qryTerminalMARGEM_INFERIOR.AsFloat;
  ACBrNFeDANFeESCPOS1.MargemSuperior :=
    dados.qryTerminalMARGEM_SUPERIOR.AsFloat;

  ACBrNFeDANFeESCPOS1.Sistema := dados.qryParametroEMPRESA.Value + ' | ' +
    dados.qryParametroFONE1.Value + ' ' + dados.qryParametroFONE2.Value;
  ACBrNFeDANFeESCPOS1.Site := dados.qryParametroSITE.Value;

  ACBrPosPrinter1.ImprimirLogo(dados.qryTerminalL1.AsInteger,
    dados.qryTerminalL2.AsInteger, dados.qryTerminalL3.AsInteger,
    dados.qryTerminalL4.AsInteger);

  ACBrPosPrinter1.ConfigLogo.IgnorarLogo := true;
  ACBrPosPrinter1.ColunasFonteNormal :=
    StrToIntDef(dados.qryTerminalCOLUNAS.AsString, 42);
  ACBrPosPrinter1.ConfigLogo.KeyCode1 :=
    StrToIntDef(dados.qryTerminalL1.AsString, 32);
  ACBrPosPrinter1.ConfigLogo.KeyCode2 :=
    StrToIntDef(dados.qryTerminalL2.AsString, 32);
  ACBrPosPrinter1.ConfigLogo.FatorX :=
    StrToIntDef(dados.qryTerminalL3.AsString, 1);
  ACBrPosPrinter1.ConfigLogo.FatorY :=
    StrToIntDef(dados.qryTerminalL4.AsString, 1);
  ACBrNFeDANFeESCPOS1.ViaConsumidor := true;

  ACBrNFeDANFeESCPOS1.ImprimeQRCodeLateral := False;
  if (dados.qryTerminalQRCODE_LATERAL.Value = 'S') then
    ACBrNFeDANFeESCPOS1.ImprimeQRCodeLateral := true;

  if FilesExists(dados.qryConfigLOGOMARCA.Value) then
    ACBrNFeDANFeESCPOS1.Logo := dados.qryConfigLOGOMARCA.Value;

  ACBrPosPrinter1.Ativar;

end;

end.
