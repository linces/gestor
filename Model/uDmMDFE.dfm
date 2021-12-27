object DmMDFe: TDmMDFe
  OldCreateOrder = False
  Height = 173
  Width = 254
  object ACBrMDFe: TACBrMDFe
    OnStatusChange = ACBrMDFeStatusChange
    Configuracoes.Geral.SSLLib = libOpenSSL
    Configuracoes.Geral.SSLCryptLib = cryOpenSSL
    Configuracoes.Geral.SSLHttpLib = httpOpenSSL
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.SepararPorCNPJ = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DAMDFE = ACBrMDFeDAMDFeRL1
    Left = 94
    Top = 23
  end
  object ACBrMDFeDAMDFeRL1: TACBrMDFeDAMDFeRL
    MostraStatus = False
    UsaSeparadorPathPDF = True
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 5.000000000000000000
    MargemSuperior = 5.000000000000000000
    MargemEsquerda = 5.000000000000000000
    MargemDireita = 5.000000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrMDFe = ACBrMDFe
    ImprimeHoraSaida = False
    TipoDAMDFe = tiSemGeracao
    TamanhoPapel = tpA4
    Cancelada = False
    Encerrado = False
    ImprimeDadosExtras = [deValorTotal, deRelacaoDFe]
    PrintDialog = True
    Left = 94
    Top = 80
  end
end
