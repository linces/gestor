object dmCTe: TdmCTe
  OldCreateOrder = False
  Height = 232
  Width = 523
  object ACBrCTe: TACBrCTe
    OnStatusChange = ACBrCTeStatusChange
    Configuracoes.Geral.SSLLib = libOpenSSL
    Configuracoes.Geral.SSLCryptLib = cryOpenSSL
    Configuracoes.Geral.SSLHttpLib = httpOpenSSL
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.Salvar = False
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.Salvar = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SalvarApenasCTeProcessados = True
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.Certificados.VerificarValidade = False
    Configuracoes.RespTec.IdCSRT = 0
    DACTE = ACBrCTeDACTeRL1
    Left = 127
    Top = 36
  end
  object ACBrCTeDACTeRL1: TACBrCTeDACTeRL
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
    ACBrCTE = ACBrCTe
    ImprimirHoraSaida = False
    TipoDACTE = tiSemGeracao
    TamanhoPapel = tpA4
    Cancelada = False
    ExibeResumoCanhoto = False
    EPECEnviado = False
    ImprimeDescPorc = False
    PrintDialog = True
    Left = 240
    Top = 37
  end
end
