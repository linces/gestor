unit uDMSat;

interface

uses
  System.SysUtils, System.Classes, ACBrSATExtratoReportClass,
  ACBrSATExtratoFortesFr, ACBrDFeReport, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase, ACBrPosPrinter, ACBrSATClass,
  ACBrIntegrador, pcnConversao, pcnConversaoNFe, acbrutil;

type
  TDMSat = class(TDataModule)
    ACBrPosPrinter1: TACBrPosPrinter;
    ACBrSAT1: TACBrSAT;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrSATExtratoFortes1: TACBrSATExtratoFortes;
    ACBrIntegrador1: TACBrIntegrador;
    procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
  private
    procedure DiretoriosDeArquivos;
    function PathLog: String;
    function PathApp: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraSAT;

  end;

var
  DMSat: TDMSat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados, uDmNFe;
{$R *.dfm}

function TDMSat.PathApp: String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)) + 'CFe');

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function TDMSat.PathLog: String;
begin

  Result := IncludeTrailingPathDelimiter(PathApp + 'Log');

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

procedure TDMSat.DiretoriosDeArquivos;
begin

  if not DirectoryExists(PathLog) then
    ForceDirectories(PathLog);

  ACBrSAT1.ArqLOG := PathLog + FormatDateTime('"SAT_"yyyymmdd".TXT"', DATE);
  ACBrPosPrinter1.ArqLOG := PathLog + FormatDateTime
    ('"POSPRINTER_"yyyymmdd".TXT"', DATE);
end;

procedure TDMSat.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := AnsiString(dados.qryConfigCODIGO_ATIVACAO.Value);
end;

procedure TDMSat.ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
  Chave := AnsiString(dados.qryConfigCODIGO_VINCULACAO.AsString);
end;

procedure TDMSat.ConfiguraSAT;

begin
  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'select CONTINGENCIA,PORTA,MODELO,NVIAS,IMPRIME,USAGAVETA,VELOCIDADE from VENDAS_TERMINAIS where NOME='
    + QuotedStr(dados.Getcomputer);
  dados.qryconsulta.Open;

  DiretoriosDeArquivos;

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  if dados.qryConfig.IsEmpty then
    raise Exception.Create
      ('Módulo DF-e ainda não foi configurado, impossível continuar!');

  ACBrSAT1.DesInicializar;
  if not dados.qryConfig.IsEmpty then
  begin

    ACBrSAT1.Integrador := nil;

    if dados.qryTerminalTIPO_SAT_DLL.Value = 'satNenhum' then
      ACBrSAT1.Modelo := TACBrSATModelo(satNenhum);

    if dados.qryTerminalTIPO_SAT_DLL.Value = 'satDinamico_cdecl' then
      ACBrSAT1.Modelo := TACBrSATModelo(satDinamico_cdecl);

    if dados.qryTerminalTIPO_SAT_DLL.Value = 'satDinamico_stdcall' then
      ACBrSAT1.Modelo := TACBrSATModelo(satDinamico_stdcall);

    if dados.qryTerminalTIPO_SAT_DLL.Value = 'mfe_Integrador_XML' then
    begin
      ACBrSAT1.Modelo := TACBrSATModelo(mfe_Integrador_XML);
      ACBrSAT1.Integrador := ACBrIntegrador1;
      ACBrIntegrador1.PastaInput := dados.qryConfigMFE_INPUT.AsString;
      ACBrIntegrador1.PastaOutput := dados.qryConfigMFE_OUTPUT.AsString;
      ACBrIntegrador1.Timeout := 10;
    end;

    ACBrSAT1.NomeDLL := dados.qryTerminalCAMINHO_SAT_DLL.Value;

    ACBrSAT1.Config.ide_numeroCaixa := dados.idCaixa;
    ACBrSAT1.Config.ide_CNPJ := TiraPontos(dados.qryParametroCNPJ.AsString);
    ACBrSAT1.Config.emit_CNPJ := TiraPontos(dados.qryEmpresaCNPJ.AsString);
    ACBrSAT1.Config.emit_IE := TiraPontos(dados.qryEmpresaIE.AsString);
    ACBrSAT1.Config.emit_IM := TiraPontos(dados.qryEmpresaIM.AsString);
    ACBrSAT1.Config.emit_cRegTribISSQN := RTISSMicroempresaMunicipal;
    ACBrSAT1.Config.emit_indRatISSQN := irSim;
    ACBrSAT1.Config.PaginaDeCodigo := 0;
    ACBrSAT1.Config.EhUTF8 := false;
    ACBrSAT1.Config.infCFe_versaoDadosEnt :=
      StrToFloatDef(dados.qryConfigCFE_VERSAO.AsString, 0.07);

    if dados.qryConfigAMBIENTE.Value = 0 then
      ACBrSAT1.Config.ide_tpAmb := taProducao
    else
      ACBrSAT1.Config.ide_tpAmb := taHomologacao;

    case pos('S', (dados.qryTerminalMODELO_SAT_DLL.Value)) of
      0:
        begin
          ACBrSAT1.Config.emit_IE := TiraPontos(dados.qryEmpresaIE.AsString);
          ACBrSAT1.Config.ide_CNPJ :=
            TiraPontos(dados.qryParametroCNPJ.AsString);
          ACBrSAT1.Config.emit_CNPJ :=
            TiraPontos(dados.qryEmpresaCNPJ.AsString);

        end;
      1:
        begin
          ACBrSAT1.Config.ide_CNPJ := '11111111111111';
          ACBrSAT1.Config.emit_IE := '111111111111';
          ACBrSAT1.Config.emit_CNPJ := '11111111111111';
        end;
    end;

    case dados.qryEmpresaCRT.AsInteger of
      1:
        ACBrSAT1.Config.emit_cRegTrib := RTSimplesNacional;
      2:
        ACBrSAT1.Config.emit_cRegTrib := RTSimplesNacional;
      3:
        ACBrSAT1.Config.emit_cRegTrib := RTRegimeNormal;
    end;

    ACBrSAT1.Config.ArqSchema := dados.qryConfigPASTA_CFE_SCHEMA.AsString;
    ACBrSAT1.ConfigArquivos.PastaCFeVenda :=
      dados.qryConfigPASTA_CFE_VENDA.AsString;
    ACBrSAT1.ConfigArquivos.PastaCFeCancelamento :=
      dados.qryConfigPASTA_CFE_CANCELAMENTO.AsString;
    ACBrSAT1.ConfigArquivos.PastaEnvio :=
      dados.qryConfigPASTA_CFE_ENVIO.AsString;

    ACBrSAT1.CFe.IdentarXML := false;
    ACBrSAT1.CFe.TamanhoIdentacao := 1;

    ACBrSAT1.Inicializar;
  end;

  // configurações impressão escpos

  if dados.qryTerminalTIPOIMPRESSORA.AsString = '1' then
  begin
    ACBrSAT1.Extrato := ACBrSATExtratoFortes1;
    ACBrSATExtratoFortes1.Impressora := dados.qryTerminalPORTA.Value;
  end
  else
  begin
    ACBrSAT1.Extrato := ACBrSATExtratoESCPOS1;

    ACBrPosPrinter1.EspacoEntreLinhas :=
      dados.qryTerminalESPACO_ENTRE_LINHAS.AsInteger;
    ACBrPosPrinter1.LinhasEntreCupons :=
      dados.qryTerminalLINHAS_ENTRE_CUPOM.AsInteger;
    ACBrPosPrinter1.ColunasFonteNormal :=
      StrToIntDef(dados.qryTerminalCOLUNAS.AsString, 42);

    ACBrSATExtratoESCPOS1.MargemDireita :=
      dados.qryTerminalMARGEM_DIREITA.AsFloat;
    ACBrSATExtratoESCPOS1.MargemEsquerda :=
      dados.qryTerminalMARGEM_ESQUERDA.AsFloat;
    ACBrSATExtratoESCPOS1.MargemInferior :=
      dados.qryTerminalMARGEM_INFERIOR.AsFloat;
    ACBrSATExtratoESCPOS1.MargemSuperior :=
      dados.qryTerminalMARGEM_SUPERIOR.AsFloat;

    ACBrPosPrinter1.Porta := LowerCase(dados.qryTerminal.FieldByName('PORTA')
      .AsString);
    ACBrPosPrinter1.Device.Baud := dados.qryTerminalVELOCIDADE.Value;

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

    ACBrPosPrinter1.Ativar;

  end;

  ACBrSAT1.Extrato.Sistema := dados.qryParametroEMPRESA.Value;

  ACBrSAT1.Extrato.ImprimeDescAcrescItem := false;
  ACBrSAT1.Extrato.ImprimeCodigoEan := True;

  if FilesExists(dados.qryConfigLOGOMARCA.AsString) then
    ACBrSAT1.Extrato.Logo := dados.qryConfigLOGOMARCA.AsString;

  ACBrSAT1.Extrato.Site := dados.qryEmpresaSITE.AsString;
  ACBrSAT1.Extrato.Email := dados.qryEmpresaEMAIL.AsString;

end;

end.
