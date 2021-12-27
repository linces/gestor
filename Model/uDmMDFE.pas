unit uDmMDFE;

interface

uses
  System.SysUtils, vcl.Forms, System.Classes, ACBrDFeReport,
  ACBrMDFeDAMDFeClass,
  ACBrMDFeDAMDFeRLClass, ACBrBase, ACBrDFe, ACBrMDFe, ACBrDFeSSL, blcksock,
  pmdfeConversaomdfe, pcnConversao;

type
  TDmMDFe = class(TDataModule)
    ACBrMDFe: TACBrMDFe;
    ACBrMDFeDAMDFeRL1: TACBrMDFeDAMDFeRL;
    procedure ACBrMDFeStatusChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraMDFe;
  end;

var
  DmMDFe: TDmMDFe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados, ufrmStatus;

{$R *.dfm}

procedure TDmMDFe.ACBrMDFeStatusChange(Sender: TObject);
begin
  case DmMDFe.ACBrMDFe.Status of
    stMDFeIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stMDFeStatusServico:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Verificando Status do servico...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stMDFeRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Enviando dados do MDFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stMDFeRetRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Recebendo dados do MDFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stMDFeConsulta:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Consultando MDFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stMDFeEvento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Enviando Evento de MDFe...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
    stMDFeRecibo:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Consultando Recibo de Lote...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;

  Application.ProcessMessages;

end;

procedure TDmMDFe.ConfiguraMDFe;
var
  Ok: Boolean;
  PathMensal: String;
begin

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  // Configurações -> Certificados

  ACBrMDFe.Configuracoes.Geral.SSLLib :=
    TSSLLib(dados.qryConfigTIPO_EMISSAO.Value);
  ACBrMDFe.Configuracoes.Geral.SSLCryptLib :=
    TSSLCryptLib(dados.qryConfigCRYPTLIB.AsInteger);
  ACBrMDFe.Configuracoes.Geral.SSLHttpLib :=
    TSSLHttpLib(dados.qryConfigHTTPLIB.AsInteger);
  ACBrMDFe.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(dados.qryConfigXMLSIGN.AsInteger);

  ACBrMDFe.SSL.SSLType := TSSLType(dados.qryconfigSSL_TIPO.AsInteger);

  ACBrMDFe.Configuracoes.Certificados.ArquivoPFX :=
    dados.qryConfigCAMINHO_CERTIFICADO.Value;
  ACBrMDFe.Configuracoes.Certificados.NumeroSerie :=
    dados.qryConfigNUMEROSERIECERTFICADO.Value;
  ACBrMDFe.Configuracoes.Certificados.Senha :=
    dados.qryConfigSENHACERTIFICADO.Value;

  // Configurações -> Arquivos
  ACBrMDFe.Configuracoes.Arquivos.AdicionarLiteral := false;
  ACBrMDFe.Configuracoes.Arquivos.EmissaoPathMDFe := true;
  ACBrMDFe.Configuracoes.Arquivos.SepararPorMes := true;

  ACBrMDFe.Configuracoes.Arquivos.PathMDFe :=
    Trim(dados.qryConfigMDFE_PATH_MDFE.Value);
  ACBrMDFe.Configuracoes.Arquivos.PathEvento :=
    Trim(dados.qryConfigMDFE_PATH_EVENTO.Value);
  ACBrMDFe.Configuracoes.Arquivos.PathSalvar :=
    Trim(dados.qryConfigMDFE_PATH_SALVAR.Value);

  ACBrMDFe.Configuracoes.Arquivos.Salvar := true;
  ACBrMDFe.Configuracoes.Arquivos.PathSchemas :=
    Trim(dados.qryConfigMDFE_PATH_SCHEMA.Value);

  PathMensal := ACBrMDFe.Configuracoes.Arquivos.GetPathMDFe(0);

  // Configurações -> Geral
  ACBrMDFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(Ok, IntToStr(0));
  ACBrMDFe.Configuracoes.Geral.Salvar := true;

  ACBrMDFe.SSL.DescarregarCertificado;

  case dados.qryConfigMDFE_VERSAO.Value of
    0:
      ACBrMDFe.Configuracoes.Geral.VersaoDF := ve100;
    1:
      ACBrMDFe.Configuracoes.Geral.VersaoDF := ve300;
  end;

  ACBrMDFe.Configuracoes.Arquivos.PathSalvar :=
    dados.qryConfigMDFE_PATH_SALVAR.Value;

  // Configurações -> WebServices
  ACBrMDFe.Configuracoes.WebServices.AguardarConsultaRet := 60;
  ACBrMDFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := false;
  ACBrMDFe.Configuracoes.WebServices.Ambiente := taProducao;
  if dados.qryConfigAMBIENTE.Value = 1 then
    ACBrMDFe.Configuracoes.WebServices.Ambiente := taHomologacao;

  ACBrMDFe.Configuracoes.WebServices.IntervaloTentativas := 5;
  ACBrMDFe.Configuracoes.WebServices.Tentativas := 1000;
  ACBrMDFe.Configuracoes.WebServices.UF := dados.qryConfigUF.Value;

  ACBrMDFe.Configuracoes.WebServices.Visualizar := false;
  if dados.qryConfigVISUALIZAR.Value = 'S' then
    ACBrMDFe.Configuracoes.WebServices.Visualizar := true;
  ACBrMDFe.Configuracoes.WebServices.Salvar := false;

  ACBrMDFe.Configuracoes.WebServices.ProxyHost := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyPort := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyUser := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyPass := '';

  // DAMDFe
  if ACBrMDFe.DAMDFe <> nil then
  begin
    ACBrMDFe.DAMDFe.PathPDF := dados.qryConfigMDFE_PATH_PDF.Value;
    ACBrMDFe.DAMDFe.ExpandeLogoMarca := false;
    ACBrMDFe.DAMDFe.Logo := dados.qryConfigLOGOMARCA.Value;
    ACBrMDFe.DAMDFe.MostraPreview := true;
    ACBrMDFe.DAMDFe.TipoDAMDFe := StrToTpImp(Ok, IntToStr(1));
  end;

  ACBrMDFeDAMDFeRL1.Sistema := dados.qryEmpresaRAZAO.Value + ' | ' +
    dados.qryEmpresaFONE.Value;
  ACBrMDFeDAMDFeRL1.Site := dados.qryEmpresaSITE.Value;

end;

end.
