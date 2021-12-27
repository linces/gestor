object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Cheff - Servidor de Impress'#227'o'
  ClientHeight = 117
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 1
    Top = 52
    Width = 1000
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 117
    Align = alClient
    Caption = 'Servidor de Impress'#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=LOCALHOST'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evAutoClose]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayDate, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtBCD
        TargetDataType = dtFmtBCD
      end>
    FormatOptions.FmtDisplayNumeric = ',0.00'
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 40
    Top = 8
  end
  object Transacao: TFDTransaction
    Connection = Conexao
    Left = 88
    Top = 8
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 8
  end
  object FBDriver: TFDPhysFBDriverLink
    Left = 200
    Top = 8
  end
  object qryTerminal: TFDQuery
    AggregatesActive = True
    Connection = Conexao
    SQL.Strings = (
      'select * from  VENDAS_TERMINAIS'
      'where '
      'nome=:nome')
    Left = 256
    Top = 9
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 35
        Value = Null
      end>
    object qryTerminalIP: TStringField
      FieldName = 'IP'
      Origin = 'IP'
      Required = True
    end
    object qryTerminalNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 35
    end
    object qryTerminalIMPRIME: TStringField
      FieldName = 'IMPRIME'
      Origin = 'IMPRIME'
      Size = 1
    end
    object qryTerminalUSAGAVETA: TStringField
      FieldName = 'USAGAVETA'
      Origin = 'USAGAVETA'
      Size = 1
    end
    object qryTerminalFABIMPRESSORA: TStringField
      FieldName = 'FABIMPRESSORA'
      Origin = 'FABIMPRESSORA'
    end
    object qryTerminalMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
    end
    object qryTerminalPORTA: TStringField
      FieldName = 'PORTA'
      Origin = 'PORTA'
      Size = 50
    end
    object qryTerminalCONTINGENCIA: TStringField
      FieldName = 'CONTINGENCIA'
      Origin = 'CONTINGENCIA'
      Size = 1
    end
    object qryTerminalNVIAS: TSmallintField
      FieldName = 'NVIAS'
      Origin = 'NVIAS'
      DisplayFormat = ',0.00'
    end
    object qryTerminalTIPOIMPRESSORA: TStringField
      FieldName = 'TIPOIMPRESSORA'
      Origin = 'TIPOIMPRESSORA'
      Size = 1
    end
    object qryTerminalSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object qryTerminalNUMERACAO_INICIAL: TIntegerField
      FieldName = 'NUMERACAO_INICIAL'
      Origin = 'NUMERACAO_INICIAL'
      DisplayFormat = ',0.00'
    end
    object qryTerminalEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryTerminalVELOCIDADE: TIntegerField
      FieldName = 'VELOCIDADE'
      Origin = 'VELOCIDADE'
      DisplayFormat = ',0.00'
    end
    object qryTerminalIMPRIME_FECHAMENTO: TStringField
      FieldName = 'IMPRIME_FECHAMENTO'
      Origin = 'IMPRIME_FECHAMENTO'
      Size = 1
    end
    object qryTerminalLOGADO: TStringField
      FieldName = 'LOGADO'
      Origin = 'LOGADO'
      Size = 1
    end
    object qryTerminalEH_CAIXA: TStringField
      FieldName = 'EH_CAIXA'
      Origin = 'EH_CAIXA'
      Size = 1
    end
    object qryTerminalVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      DisplayFormat = ',0.00'
    end
    object qryTerminalTIPO_BROWSER: TStringField
      FieldName = 'TIPO_BROWSER'
      Origin = 'TIPO_BROWSER'
      Size = 30
    end
    object qryTerminalBALANCA_PORTA: TStringField
      FieldName = 'BALANCA_PORTA'
      Origin = 'BALANCA_PORTA'
      Size = 10
    end
    object qryTerminalBALANCA_MARCA: TStringField
      FieldName = 'BALANCA_MARCA'
      Origin = 'BALANCA_MARCA'
      Size = 10
    end
    object qryTerminalBALANCA_PARIDADE: TStringField
      FieldName = 'BALANCA_PARIDADE'
      Origin = 'BALANCA_PARIDADE'
    end
    object qryTerminalBALANCA_STOPBITS: TStringField
      FieldName = 'BALANCA_STOPBITS'
      Origin = 'BALANCA_STOPBITS'
      Size = 10
    end
    object qryTerminalBALANCA_HANDSHAKING: TStringField
      FieldName = 'BALANCA_HANDSHAKING'
      Origin = 'BALANCA_HANDSHAKING'
    end
    object qryTerminalBALANCA_VELOCIDADE: TStringField
      FieldName = 'BALANCA_VELOCIDADE'
      Origin = 'BALANCA_VELOCIDADE'
      Size = 10
    end
    object qryTerminalBALANCA_DATABITS: TStringField
      FieldName = 'BALANCA_DATABITS'
      Origin = 'BALANCA_DATABITS'
      Size = 10
    end
    object qryTerminalDATA_VERSAO: TSQLTimeStampField
      FieldName = 'DATA_VERSAO'
      Origin = 'DATA_VERSAO'
    end
    object qryTerminalDESTINO_IMPRESSAO: TStringField
      FieldName = 'DESTINO_IMPRESSAO'
      Origin = 'DESTINO_IMPRESSAO'
      Size = 30
    end
    object qryTerminalDT_VERSAO: TStringField
      FieldName = 'DT_VERSAO'
      Origin = 'DT_VERSAO'
      Size = 50
    end
  end
  object ACBrPosPrinter2: TACBrPosPrinter
    Modelo = ppEscBematech
    PaginaDeCodigo = pc860
    EspacoEntreLinhas = 5
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    ConfigLogo.IgnorarLogo = True
    LinhasEntreCupons = 10
    ControlePorta = True
    VerificarImpressora = True
    Left = 386
    Top = 9
  end
  object ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    TipoDANFE = tiNFCe
    ImprimeDescAcrescItem = False
    Left = 490
    Top = 9
  end
  object qryEmpresas: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Select * from empresa')
    Left = 40
    Top = 56
    object qryEmpresasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryEmpresasFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryEmpresasRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 50
    end
    object qryEmpresasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object qryEmpresasCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryEmpresasIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object qryEmpresasIM: TStringField
      FieldName = 'IM'
      Origin = 'IM'
    end
    object qryEmpresasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryEmpresasNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryEmpresasCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object qryEmpresasBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryEmpresasCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 35
    end
    object qryEmpresasUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryEmpresasCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryEmpresasFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Required = True
      Size = 30
    end
    object qryEmpresasFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 14
    end
    object qryEmpresasSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 60
    end
    object qryEmpresasLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
    end
    object qryEmpresasFUNDACAO: TDateField
      FieldName = 'FUNDACAO'
      Origin = 'FUNDACAO'
      Required = True
    end
    object qryEmpresasUSU_CAD: TSmallintField
      FieldName = 'USU_CAD'
      Origin = 'USU_CAD'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryEmpresasUSU_ATU: TSmallintField
      FieldName = 'USU_ATU'
      Origin = 'USU_ATU'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasNSERIE: TStringField
      FieldName = 'NSERIE'
      Origin = 'NSERIE'
      Required = True
      Size = 30
    end
    object qryEmpresasCSENHA: TStringField
      FieldName = 'CSENHA'
      Origin = 'CSENHA'
      Required = True
      Size = 30
    end
    object qryEmpresasNTERM: TStringField
      FieldName = 'NTERM'
      Origin = 'NTERM'
      Size = 30
    end
    object qryEmpresasID_PLANO_TRANSFERENCIA_C: TIntegerField
      FieldName = 'ID_PLANO_TRANSFERENCIA_C'
      Origin = 'ID_PLANO_TRANSFERENCIA_C'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_PLANO_TRANSFERENCIA_D: TIntegerField
      FieldName = 'ID_PLANO_TRANSFERENCIA_D'
      Origin = 'ID_PLANO_TRANSFERENCIA_D'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_CAIXA_GERAL: TIntegerField
      FieldName = 'ID_CAIXA_GERAL'
      Origin = 'ID_CAIXA_GERAL'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasBLOQUEAR_ESTOQUE_NEGATIVO: TStringField
      FieldName = 'BLOQUEAR_ESTOQUE_NEGATIVO'
      Origin = 'BLOQUEAR_ESTOQUE_NEGATIVO'
      Size = 1
    end
    object qryEmpresasID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasCRT: TSmallintField
      FieldName = 'CRT'
      Origin = 'CRT'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_UF: TSmallintField
      FieldName = 'ID_UF'
      Origin = 'ID_UF'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_PLANO_VENDA: TIntegerField
      FieldName = 'ID_PLANO_VENDA'
      Origin = 'ID_PLANO_VENDA'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasOBSFISCO: TMemoField
      FieldName = 'OBSFISCO'
      Origin = 'OBSFISCO'
      BlobType = ftMemo
    end
    object qryEmpresasCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryEmpresasCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object qryEmpresasCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Size = 3
    end
    object qryEmpresasALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasCST_ENTRADA: TStringField
      FieldName = 'CST_ENTRADA'
      Origin = 'CST_ENTRADA'
      Size = 3
    end
    object qryEmpresasCST_SAIDA: TStringField
      FieldName = 'CST_SAIDA'
      Origin = 'CST_SAIDA'
      Size = 3
    end
    object qryEmpresasALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasALIQ_COF: TFMTBCDField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object qryEmpresasALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasIMP_F5: TStringField
      FieldName = 'IMP_F5'
      Origin = 'IMP_F5'
      Size = 1
    end
    object qryEmpresasIMP_F6: TStringField
      FieldName = 'IMP_F6'
      Origin = 'IMP_F6'
      Size = 1
    end
    object qryEmpresasMOSTRA_RESUMO_CAIXA: TStringField
      FieldName = 'MOSTRA_RESUMO_CAIXA'
      Origin = 'MOSTRA_RESUMO_CAIXA'
      Size = 1
    end
    object qryEmpresasLIMITE_DIARIO: TFMTBCDField
      FieldName = 'LIMITE_DIARIO'
      Origin = 'LIMITE_DIARIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasPRAZO_MAXIMO: TSmallintField
      FieldName = 'PRAZO_MAXIMO'
      Origin = 'PRAZO_MAXIMO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_PLA_CONTA_FICHA_CLI: TIntegerField
      FieldName = 'ID_PLA_CONTA_FICHA_CLI'
      Origin = 'ID_PLA_CONTA_FICHA_CLI'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_PLANO_CONTA_RETIRADA: TIntegerField
      FieldName = 'ID_PLANO_CONTA_RETIRADA'
      Origin = 'ID_PLANO_CONTA_RETIRADA'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasUSA_PDV: TStringField
      FieldName = 'USA_PDV'
      Origin = 'USA_PDV'
      Size = 1
    end
    object qryEmpresasRECIBO_VIAS: TStringField
      FieldName = 'RECIBO_VIAS'
      Origin = 'RECIBO_VIAS'
      Size = 1
    end
    object qryEmpresasID_PLANO_TAXA_CARTAO: TIntegerField
      FieldName = 'ID_PLANO_TAXA_CARTAO'
      Origin = 'ID_PLANO_TAXA_CARTAO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasOBS_CARNE: TMemoField
      FieldName = 'OBS_CARNE'
      Origin = 'OBS_CARNE'
      BlobType = ftMemo
    end
    object qryEmpresasCAIXA_UNICO: TStringField
      FieldName = 'CAIXA_UNICO'
      Origin = 'CAIXA_UNICO'
      Size = 1
    end
    object qryEmpresasCAIXA_RAPIDO: TStringField
      FieldName = 'CAIXA_RAPIDO'
      Origin = 'CAIXA_RAPIDO'
      Size = 1
    end
    object qryEmpresasEMPRESA_PADRAO: TSmallintField
      FieldName = 'EMPRESA_PADRAO'
      Origin = 'EMPRESA_PADRAO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasID_PLANO_CONTA_DEVOLUCAO: TIntegerField
      FieldName = 'ID_PLANO_CONTA_DEVOLUCAO'
      Origin = 'ID_PLANO_CONTA_DEVOLUCAO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasN_INICIAL_NFCE: TIntegerField
      FieldName = 'N_INICIAL_NFCE'
      Origin = 'N_INICIAL_NFCE'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasN_INICIAL_NFE: TIntegerField
      FieldName = 'N_INICIAL_NFE'
      Origin = 'N_INICIAL_NFE'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasCHECA_ESTOQUE_FISCAL: TStringField
      FieldName = 'CHECA_ESTOQUE_FISCAL'
      Origin = 'CHECA_ESTOQUE_FISCAL'
      Size = 1
    end
    object qryEmpresasDESCONTO_PROD_PROMO: TStringField
      FieldName = 'DESCONTO_PROD_PROMO'
      Origin = 'DESCONTO_PROD_PROMO'
      Size = 1
    end
    object qryEmpresasDATA_CADASTRO: TStringField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Size = 100
    end
    object qryEmpresasDATA_VALIDADE: TStringField
      FieldName = 'DATA_VALIDADE'
      Origin = 'DATA_VALIDADE'
      Size = 100
    end
    object qryEmpresasFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 50
    end
    object qryEmpresasLANCAR_CARTAO_CREDITO: TStringField
      FieldName = 'LANCAR_CARTAO_CREDITO'
      Origin = 'LANCAR_CARTAO_CREDITO'
      Size = 1
    end
    object qryEmpresasFILTRAR_EMPRESA_LOGIN: TStringField
      FieldName = 'FILTRAR_EMPRESA_LOGIN'
      Origin = 'FILTRAR_EMPRESA_LOGIN'
      Size = 1
    end
    object qryEmpresasENVIAR_EMAIL_NFE: TStringField
      FieldName = 'ENVIAR_EMAIL_NFE'
      Origin = 'ENVIAR_EMAIL_NFE'
      Size = 1
    end
    object qryEmpresasTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Origin = 'TRANSPORTADORA'
      Size = 1
    end
    object qryEmpresasTABELA_PRECO: TStringField
      FieldName = 'TABELA_PRECO'
      Origin = 'TABELA_PRECO'
      Size = 1
    end
    object qryEmpresasTAXA_VENDA_PRAZO: TFMTBCDField
      FieldName = 'TAXA_VENDA_PRAZO'
      Origin = 'TAXA_VENDA_PRAZO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasEMAIL_CONTADOR: TStringField
      FieldName = 'EMAIL_CONTADOR'
      Origin = 'EMAIL_CONTADOR'
      Size = 100
    end
    object qryEmpresasAUTOPECAS: TStringField
      FieldName = 'AUTOPECAS'
      Origin = 'AUTOPECAS'
      Size = 1
    end
    object qryEmpresasATUALIZA_PR_VENDA: TStringField
      FieldName = 'ATUALIZA_PR_VENDA'
      Origin = 'ATUALIZA_PR_VENDA'
      Size = 1
    end
    object qryEmpresasINFORMAR_GTIN: TStringField
      FieldName = 'INFORMAR_GTIN'
      Origin = 'INFORMAR_GTIN'
      Size = 1
    end
    object qryEmpresasRECOLHE_FCP: TStringField
      FieldName = 'RECOLHE_FCP'
      Origin = 'RECOLHE_FCP'
      Size = 1
    end
    object qryEmpresasDIFAL_ORIGEM: TFMTBCDField
      FieldName = 'DIFAL_ORIGEM'
      Origin = 'DIFAL_ORIGEM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasDIFAL_DESTINO: TFMTBCDField
      FieldName = 'DIFAL_DESTINO'
      Origin = 'DIFAL_DESTINO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasEXCLUI_PDV: TStringField
      FieldName = 'EXCLUI_PDV'
      Origin = 'EXCLUI_PDV'
      Size = 1
    end
    object qryEmpresasVENDA_SEMENTE: TStringField
      FieldName = 'VENDA_SEMENTE'
      Origin = 'VENDA_SEMENTE'
      Size = 1
    end
    object qryEmpresasCHECA: TStringField
      FieldName = 'CHECA'
      Origin = 'CHECA'
      Size = 50
    end
    object qryEmpresasEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryEmpresasULTIMONSU: TStringField
      FieldName = 'ULTIMONSU'
      Origin = 'ULTIMONSU'
      Size = 30
    end
    object qryEmpresasULTIMO_PEDIDO: TIntegerField
      FieldName = 'ULTIMO_PEDIDO'
      Origin = 'ULTIMO_PEDIDO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasTIPO_CONTRATO: TIntegerField
      FieldName = 'TIPO_CONTRATO'
      Origin = 'TIPO_CONTRATO'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasTIPO_EMPRESA: TIntegerField
      FieldName = 'TIPO_EMPRESA'
      Origin = 'TIPO_EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasQTD_MESAS: TSmallintField
      FieldName = 'QTD_MESAS'
      Origin = 'QTD_MESAS'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasBLOQUEAR_PRECO: TStringField
      FieldName = 'BLOQUEAR_PRECO'
      Origin = 'BLOQUEAR_PRECO'
      Size = 1
    end
    object qryEmpresasEXIBE_RESUMO_CAIXA: TStringField
      FieldName = 'EXIBE_RESUMO_CAIXA'
      Origin = 'EXIBE_RESUMO_CAIXA'
      Size = 1
    end
    object qryEmpresasID_PLANO_COMPRA: TIntegerField
      FieldName = 'ID_PLANO_COMPRA'
      Origin = 'ID_PLANO_COMPRA'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasRESPONSAVEL_TECNICO: TStringField
      FieldName = 'RESPONSAVEL_TECNICO'
      Origin = 'RESPONSAVEL_TECNICO'
      Size = 1
    end
    object qryEmpresasCARENCIA_JUROS: TIntegerField
      FieldName = 'CARENCIA_JUROS'
      Origin = 'CARENCIA_JUROS'
      DisplayFormat = ',0.00'
    end
    object qryEmpresasPESQUISA_REFERENCIA: TStringField
      FieldName = 'PESQUISA_REFERENCIA'
      Origin = 'PESQUISA_REFERENCIA'
      Size = 1
    end
    object qryEmpresasRESTAURANTE: TStringField
      FieldName = 'RESTAURANTE'
      Origin = 'RESTAURANTE'
      Size = 1
    end
    object qryEmpresasEXIBE_F3: TStringField
      FieldName = 'EXIBE_F3'
      Origin = 'EXIBE_F3'
      Size = 1
    end
    object qryEmpresasEXIBE_F4: TStringField
      FieldName = 'EXIBE_F4'
      Origin = 'EXIBE_F4'
      Size = 1
    end
    object qryEmpresasLER_PESO: TStringField
      FieldName = 'LER_PESO'
      Origin = 'LER_PESO'
      Size = 1
    end
    object qryEmpresasCHECA_LIMITE: TStringField
      FieldName = 'CHECA_LIMITE'
      Origin = 'CHECA_LIMITE'
      Size = 1
    end
    object qryEmpresasEMITE_ECF: TStringField
      FieldName = 'EMITE_ECF'
      Origin = 'EMITE_ECF'
      Size = 1
    end
    object qryEmpresasLOJA_ROUPA: TStringField
      FieldName = 'LOJA_ROUPA'
      Origin = 'LOJA_ROUPA'
      Size = 1
    end
    object qryEmpresasTIPO_JUROS: TStringField
      FieldName = 'TIPO_JUROS'
      Origin = 'TIPO_JUROS'
      Size = 1
    end
    object qryEmpresasJUROS_DIA: TFMTBCDField
      FieldName = 'JUROS_DIA'
      Origin = 'JUROS_DIA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasJUROS_MES: TFMTBCDField
      FieldName = 'JUROS_MES'
      Origin = 'JUROS_MES'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasFARMACIA: TStringField
      FieldName = 'FARMACIA'
      Origin = 'FARMACIA'
      Size = 1
    end
    object qryEmpresasDESCONTO_MAXIMO: TFMTBCDField
      FieldName = 'DESCONTO_MAXIMO'
      Origin = 'DESCONTO_MAXIMO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryEmpresasHABILITA_DESCONTO_PDV: TStringField
      FieldName = 'HABILITA_DESCONTO_PDV'
      Origin = 'HABILITA_DESCONTO_PDV'
      Size = 1
    end
    object qryEmpresasPAGAMENTO_DINHEIRO: TStringField
      FieldName = 'PAGAMENTO_DINHEIRO'
      Origin = 'PAGAMENTO_DINHEIRO'
      Size = 1
    end
    object qryEmpresasRESPONSAVEL_EMPRESA: TStringField
      FieldName = 'RESPONSAVEL_EMPRESA'
      Origin = 'RESPONSAVEL_EMPRESA'
      Size = 50
    end
    object qryEmpresasPUXA_CFOP_PRODUTO: TStringField
      FieldName = 'PUXA_CFOP_PRODUTO'
      Origin = 'PUXA_CFOP_PRODUTO'
      Size = 1
    end
    object qryEmpresasLANCAR_CARTAO_CR: TStringField
      FieldName = 'LANCAR_CARTAO_CR'
      Origin = 'LANCAR_CARTAO_CR'
      Size = 1
    end
    object qryEmpresasUSA_BLUETOOTH_RESTA: TStringField
      FieldName = 'USA_BLUETOOTH_RESTA'
      Origin = 'USA_BLUETOOTH_RESTA'
      Size = 1
    end
  end
  object qryComanda_Itens: TFDQuery
    AggregatesActive = True
    Connection = Conexao
    SQL.Strings = (
      
        'Select ci.codigo, cp.nome as pessoa, me.nome mesa, ci.data_hora,' +
        ' ci.fk_produto,pro.descricao,ci.qtd from comanda_itens ci'
      'left join comanda_pessoa cp on cp.codigo=ci.fk_comanda_pessoa'
      'left join comanda_master cm on cm.codigo=cp.fk_comanda'
      'left join mesa me on me.codigo=cm.fk_mesa'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'where'
      'ci.fk_comanda_pessoa=:codigo and'
      'ci.situacao='#39'S'#39
      'order by ci.data_hora'
      '')
    Left = 136
    Top = 56
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryComanda_ItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryComanda_ItensPESSOA: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      Size = 30
    end
    object qryComanda_ItensMESA: TStringField
      FieldName = 'MESA'
      Origin = 'MESA'
      Size = 30
    end
    object qryComanda_ItensDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object qryComanda_ItensFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryComanda_ItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryComanda_ItensQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 320
    Top = 64
  end
  object qryComanda_pessoa: TFDQuery
    AggregatesActive = True
    Connection = Conexao
    SQL.Strings = (
      
        'Select cp.codigo,  cp.nome as pessoa, count(*) qtd from comanda_' +
        'itens ci'
      'left join comanda_pessoa cp on cp.codigo=ci.fk_comanda_pessoa'
      'where'
      'ci.situacao='#39'S'#39
      'group by 1,2')
    Left = 256
    Top = 56
    object qryComanda_pessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = ',0.00'
    end
    object qryComanda_pessoaPESSOA: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      Size = 30
    end
    object qryComanda_pessoaQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      DisplayFormat = ',0.00'
    end
  end
  object qryAtualiza: TFDQuery
    AggregatesActive = True
    Connection = Conexao
    SQL.Strings = (
      'update comanda_itens set situacao='#39'N'#39' where codigo=:codigo;')
    Left = 392
    Top = 65
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object StringField1: TStringField
      FieldName = 'IP'
      Origin = 'IP'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 35
    end
    object StringField3: TStringField
      FieldName = 'IMPRIME'
      Origin = 'IMPRIME'
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'USAGAVETA'
      Origin = 'USAGAVETA'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'FABIMPRESSORA'
      Origin = 'FABIMPRESSORA'
    end
    object StringField6: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
    end
    object StringField7: TStringField
      FieldName = 'PORTA'
      Origin = 'PORTA'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'CONTINGENCIA'
      Origin = 'CONTINGENCIA'
      Size = 1
    end
    object SmallintField1: TSmallintField
      FieldName = 'NVIAS'
      Origin = 'NVIAS'
      DisplayFormat = ',0.00'
    end
    object StringField9: TStringField
      FieldName = 'TIPOIMPRESSORA'
      Origin = 'TIPOIMPRESSORA'
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object IntegerField1: TIntegerField
      FieldName = 'NUMERACAO_INICIAL'
      Origin = 'NUMERACAO_INICIAL'
      DisplayFormat = ',0.00'
    end
    object IntegerField2: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object IntegerField3: TIntegerField
      FieldName = 'VELOCIDADE'
      Origin = 'VELOCIDADE'
      DisplayFormat = ',0.00'
    end
    object StringField11: TStringField
      FieldName = 'IMPRIME_FECHAMENTO'
      Origin = 'IMPRIME_FECHAMENTO'
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'LOGADO'
      Origin = 'LOGADO'
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'EH_CAIXA'
      Origin = 'EH_CAIXA'
      Size = 1
    end
    object SmallintField2: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      DisplayFormat = ',0.00'
    end
    object StringField14: TStringField
      FieldName = 'TIPO_BROWSER'
      Origin = 'TIPO_BROWSER'
      Size = 30
    end
    object StringField15: TStringField
      FieldName = 'BALANCA_PORTA'
      Origin = 'BALANCA_PORTA'
      Size = 10
    end
    object StringField16: TStringField
      FieldName = 'BALANCA_MARCA'
      Origin = 'BALANCA_MARCA'
      Size = 10
    end
    object StringField17: TStringField
      FieldName = 'BALANCA_PARIDADE'
      Origin = 'BALANCA_PARIDADE'
    end
    object StringField18: TStringField
      FieldName = 'BALANCA_STOPBITS'
      Origin = 'BALANCA_STOPBITS'
      Size = 10
    end
    object StringField19: TStringField
      FieldName = 'BALANCA_HANDSHAKING'
      Origin = 'BALANCA_HANDSHAKING'
    end
    object StringField20: TStringField
      FieldName = 'BALANCA_VELOCIDADE'
      Origin = 'BALANCA_VELOCIDADE'
      Size = 10
    end
    object StringField21: TStringField
      FieldName = 'BALANCA_DATABITS'
      Origin = 'BALANCA_DATABITS'
      Size = 10
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'DATA_VERSAO'
      Origin = 'DATA_VERSAO'
    end
    object StringField22: TStringField
      FieldName = 'DESTINO_IMPRESSAO'
      Origin = 'DESTINO_IMPRESSAO'
      Size = 30
    end
    object StringField23: TStringField
      FieldName = 'DT_VERSAO'
      Origin = 'DT_VERSAO'
      Size = 50
    end
  end
end
