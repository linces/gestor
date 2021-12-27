object DMSat: TDMSat
  OldCreateOrder = False
  Height = 280
  Width = 385
  object ACBrPosPrinter1: TACBrPosPrinter
    PaginaDeCodigo = pc860
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 169
    Top = 88
  end
  object ACBrSAT1: TACBrSAT
    Extrato = ACBrSATExtratoFortes1
    NomeDLL = 'c:\sat\SAT.DLL'
    ValidarNumeroSessaoResposta = True
    NumeroTentativasValidarSessao = 3
    Config.infCFe_versaoDadosEnt = 0.050000000000000000
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = True
    Config.PaginaDeCodigo = 65001
    Config.XmlSignLib = xsMsXml
    ConfigArquivos.SalvarCFe = True
    ConfigArquivos.SalvarCFeCanc = True
    ConfigArquivos.SalvarEnvio = True
    ConfigArquivos.SepararPorCNPJ = True
    ConfigArquivos.SepararPorAno = True
    ConfigArquivos.SepararPorMes = True
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanIPFIX
    Rede.lanIP = '192.168.137.2'
    Rede.lanMask = '255.255.255.0'
    Rede.lanGW = '192.168.137.1'
    Rede.lanDNS1 = '192.168.137.1'
    Rede.lanDNS2 = '192.168.137.1'
    Rede.proxy = 0
    Rede.proxy_porta = 0
    OnGetcodigoDeAtivacao = ACBrSAT1GetcodigoDeAtivacao
    OnGetsignAC = ACBrSAT1GetsignAC
    Left = 169
    Top = 24
  end
  object ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS
    UsaSeparadorPathPDF = True
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    Site = 'http://www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
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
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    ImprimeDescAcrescItem = False
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    Left = 56
    Top = 24
  end
  object ACBrSATExtratoFortes1: TACBrSATExtratoFortes
    UsaSeparadorPathPDF = True
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    Site = 'http://www.projetoacbr.com.br'
    MargemInferior = 4.000000000000000000
    MargemSuperior = 2.000000000000000000
    MargemEsquerda = 2.000000000000000000
    MargemDireita = 2.000000000000000000
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
    ACBrSAT = ACBrSAT1
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    FormularioContinuo = True
    EspacoFinal = 50
    LogoWidth = 100
    LogoHeigth = 70
    Left = 57
    Top = 88
  end
  object ACBrIntegrador1: TACBrIntegrador
    PastaInput = 'C:\Integrador\Input\'
    PastaOutput = 'C:\Integrador\Output\'
    Left = 56
    Top = 144
  end
end
