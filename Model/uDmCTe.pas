unit uDmCTe;

interface

uses
  System.SysUtils, System.Classes, vcl.Forms, ACBrDFeReport, ACBrCTeDACTEClass,
  ACBrCTeDACTeRLClass, ACBrBase, ACBrDFe, ACBrCTe, ACBrDFeSSL, blcksock,
  pcteConversaoCTe, pcnConversao;

type
  TdmCTe = class(TDataModule)
    ACBrCTe: TACBrCTe;
    ACBrCTeDACTeRL1: TACBrCTeDACTeRL;
    procedure ACBrCTeStatusChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ConfiguraCTe;
    { Public declarations }
  end;

var
  dmCTe: TdmCTe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados, ufrmStatus;

{$R *.dfm}

procedure TdmCTe.ACBrCTeStatusChange(Sender: TObject);
begin
  case ACBrCTe.Status of
    stCTeIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stCTeStatusServico:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Verificando Status do servico...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Enviando dados do CTe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeRetRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Recebendo dados do CTe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeConsulta:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Consultando CTe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeCancelamento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Enviando cancelamento de CTe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeInutilizacao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Enviando pedido de Inutilização...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeRecibo:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Consultando Recibo de Lote...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeCadastro:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Consultando Cadastro...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stCTeEmail:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);

        frmStatus.lblstatus.Caption := 'Enviando Email...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;

  Application.ProcessMessages;

end;

procedure TdmCTe.ConfiguraCTe;
var
  Ok: boolean;
  PathMensal: String;
begin

  ACBrCTe.Configuracoes.Geral.SSLLib :=
    TSSLLib(dados.qryConfigTIPO_EMISSAO.Value);
  ACBrCTe.Configuracoes.Geral.SSLCryptLib :=
    TSSLCryptLib(dados.qryConfigCRYPTLIB.AsInteger);
  ACBrCTe.Configuracoes.Geral.SSLHttpLib :=
    TSSLHttpLib(dados.qryConfigHTTPLIB.AsInteger);
  ACBrCTe.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(dados.qryConfigXMLSIGN.AsInteger);

  ACBrCTe.SSL.SSLType := TSSLType(dados.qryconfigSSL_TIPO.AsInteger);

  ACBrCTe.Configuracoes.Certificados.NumeroSerie :=
    dados.qryConfigNUMEROSERIECERTFICADO.Value;
  ACBrCTe.Configuracoes.Certificados.Senha :=
    dados.qryConfigSENHACERTIFICADO.Value;
  ACBrCTe.Configuracoes.Certificados.ArquivoPFX :=
    dados.qryConfigCAMINHO_CERTIFICADO.Value;

  ACBrCTe.Configuracoes.Arquivos.AdicionarLiteral := true;
  ACBrCTe.Configuracoes.Arquivos.EmissaoPathCTe := true;
  ACBrCTe.Configuracoes.Arquivos.SepararPorMes := true;
  ACBrCTe.Configuracoes.Arquivos.SepararPorCNPJ := true;

  ACBrCTe.Configuracoes.Arquivos.PathEvento :=
    trim(dados.qryConfigPATH_EVENTO_CTE.Value);
  ACBrCTe.Configuracoes.Arquivos.PathSalvar :=
    trim(dados.qryConfigPATH_SALVAR_CTE.Value);
  ACBrCTe.Configuracoes.Arquivos.PathCTe :=
    trim(dados.qryConfigPATH_ENVIADAS_CTE.Value);
  ACBrCTe.Configuracoes.Arquivos.PathSchemas :=
    dados.qryConfigPATH_SCHEMA_CTE.Value;
  ACBrCTe.Configuracoes.Arquivos.PathInu := dados.qryConfigPATH_INU_CTE.Value;

  PathMensal := ACBrCTe.Configuracoes.Arquivos.GetPathCTe(0);
  case dados.qryConfigVERSAO_CTE.Value of
    0:
      ACBrCTe.Configuracoes.Geral.VersaoDF := TVersaoCTe(0);
    1:
      ACBrCTe.Configuracoes.Geral.VersaoDF := TVersaoCTe(1);
  end;

  // ACBrCTe.SSL.DescarregarCertificado;


  // Configurações -> Geral

  ACBrCTe.Configuracoes.Arquivos.PathSalvar := PathMensal;
  ACBrCTe.DACTE.PathPDF := dados.qryConfigPATH_PDF_CTE.Value;

  // Configurações -> WebServices
  ACBrCTe.Configuracoes.WebServices.AguardarConsultaRet := 15;
  ACBrCTe.Configuracoes.WebServices.AjustaAguardaConsultaRet := true;
  ACBrCTe.Configuracoes.WebServices.IntervaloTentativas := 5;
  ACBrCTe.Configuracoes.WebServices.Tentativas := 15;
  ACBrCTe.Configuracoes.WebServices.UF := dados.qryConfigUF.Text;
  ACBrCTe.Configuracoes.WebServices.Visualizar := false;
  if dados.qryConfigVISUALIZAR.Value = 'S' then
    ACBrCTe.Configuracoes.WebServices.Visualizar := true;
  ACBrCTe.Configuracoes.WebServices.Salvar := false;

  // DAMDFe
  if ACBrCTe.DACTE <> nil then
  begin
    ACBrCTe.DACTE.PathPDF := dados.qryConfigPATH_PDF_CTE.Value;
    ACBrCTe.DACTE.ExpandeLogoMarca := false;
    ACBrCTe.DACTE.Logo := dados.qryConfigLOGOMARCA.Value;
    ACBrCTe.DACTE.TipoDACTE := StrToTpImp(Ok, IntToStr(1));
  end;

  // ACBrCTe.Configuracoes.Arquivos.Salvar := true;

  ACBrCTe.Configuracoes.WebServices.Ambiente := taProducao;
  if dados.qryConfigAMBIENTE.Value = 1 then
    ACBrCTe.Configuracoes.WebServices.Ambiente := taHomologacao;

  ACBrCTeDACTeRL1.Sistema := dados.qryParametroEMPRESA.Value + ' | ' +
    dados.qryParametroFONE1.Value + ' ' + dados.qryparametroFONE2.Value;
  ACBrCTeDACTeRL1.Site := dados.qryparametroSITE.Value;

end;

end.
