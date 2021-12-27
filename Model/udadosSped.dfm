object DadosSped: TDadosSped
  OldCreateOrder = False
  Height = 360
  Width = 609
  object qrProdutos: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select'
      'DISTINCT(COD_PROD) COD_PROD,'
      'DESCRICAO,'
      'CODBARRA AS GTIN,'
      'CODIGO AS ABREVIATURA,'
      'TIPO AS TIPO_ITEM,'
      'NCM'
      'FROM('
      'select'
      'DISTINCT(PROD.codigo)AS COD_PROD,'
      'PROD.descricao,'
      'PROD.codbarra,'
      'UND.codigo,'
      'PROD.tipo,'
      'PROD.ncm'
      'from  compra_itens ITECO'
      'left JOIN compra PEDICO on ITECO.fk_compra=PEDICO.id'
      'left JOIN produto PROD on ITECO.fk_produto=PROD.codigo'
      'left JOIN unidade UND on PROD.unidade= UND.codigo'
      'where'
      'PEDICO.dtentrada between :data1 and :data2 and'
      'PEDICO.STATUS='#39'F'#39' and'
      'PEDICO.empresa=:EMPRESA'
      ')'
      '')
    Left = 360
    Top = 24
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qrProdutosCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
      Origin = 'COD_PROD'
    end
    object qrProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qrProdutosGTIN: TStringField
      FieldName = 'GTIN'
      Origin = 'GTIN'
    end
    object qrProdutosABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Origin = 'ABREVIATURA'
      Size = 10
    end
    object qrProdutosTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
      Size = 30
    end
    object qrProdutosNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
  end
  object qryConfig_Sped: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from sped_config'
      'where fk_empresa=:id')
    Left = 368
    Top = 79
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryConfig_SpedFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConfig_SpedIND_PERFIL: TStringField
      FieldName = 'IND_PERFIL'
      Origin = 'IND_PERFIL'
      Size = 1
    end
    object qryConfig_SpedIND_ATIV: TStringField
      FieldName = 'IND_ATIV'
      Origin = 'IND_ATIV'
      Size = 1
    end
    object qryConfig_SpedIND_EXP: TStringField
      FieldName = 'IND_EXP'
      Origin = 'IND_EXP'
      Size = 1
    end
    object qryConfig_SpedIND_CCRF: TStringField
      FieldName = 'IND_CCRF'
      Origin = 'IND_CCRF'
      Size = 1
    end
    object qryConfig_SpedIND_COMB: TStringField
      FieldName = 'IND_COMB'
      Origin = 'IND_COMB'
      Size = 1
    end
    object qryConfig_SpedIND_USINA: TStringField
      FieldName = 'IND_USINA'
      Origin = 'IND_USINA'
      Size = 1
    end
    object qryConfig_SpedIND_VA: TStringField
      FieldName = 'IND_VA'
      Origin = 'IND_VA'
      Size = 1
    end
    object qryConfig_SpedIND_EE: TStringField
      FieldName = 'IND_EE'
      Origin = 'IND_EE'
      Size = 1
    end
    object qryConfig_SpedIND_CART: TStringField
      FieldName = 'IND_CART'
      Origin = 'IND_CART'
      Size = 1
    end
    object qryConfig_SpedIND_FORM: TStringField
      FieldName = 'IND_FORM'
      Origin = 'IND_FORM'
      Size = 1
    end
    object qryConfig_SpedIND_AER: TStringField
      FieldName = 'IND_AER'
      Origin = 'IND_AER'
      Size = 1
    end
    object qryConfig_SpedCOD_INC_TRIB: TStringField
      FieldName = 'COD_INC_TRIB'
      Origin = 'COD_INC_TRIB'
      Size = 1
    end
    object qryConfig_SpedIND_APRO_CRED: TStringField
      FieldName = 'IND_APRO_CRED'
      Origin = 'IND_APRO_CRED'
      Size = 1
    end
    object qryConfig_SpedCOD_TIPO_CONT: TStringField
      FieldName = 'COD_TIPO_CONT'
      Origin = 'COD_TIPO_CONT'
      Size = 1
    end
    object qryConfig_SpedCOD_REGIME_TRIBUTARIO: TStringField
      FieldName = 'COD_REGIME_TRIBUTARIO'
      Origin = 'COD_REGIME_TRIBUTARIO'
      Size = 1
    end
    object qryConfig_SpedIND_REG_CUM: TStringField
      FieldName = 'IND_REG_CUM'
      Origin = 'IND_REG_CUM'
      Size = 1
    end
    object qryConfig_SpedFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
  end
  object qryItens_NFe_S: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'NFE.fknfe,'
      'NFE.codigo,'
      'NFE.id_produto,'
      'pro.descricao,'
      'NFE.qtd,'
      'NFE.unidade,'
      'NFE.total,'
      #39'1'#39' AS IND_MOV,'
      'NFE.cfop,'
      'nfe.cst,'
      'NFE.base_icms,'
      'NFE.aliq_icms,'
      'NFE.valor_icms,'
      'NFE.base_icms_st,'
      'NFE.aliq_icms_st,'
      'NFE.valor_icms_st,'
      'NFE.cst_ipi,'
      'NFE.base_ipi,'
      'NFE.aliq_ipi,'
      'NFE.valor_ipi,'
      'NFE.CST_PIS,'
      'NFE.base_pis_icms,'
      'NFE.aliq_pis_icms,'
      'NFE.valor_pis_icms,'
      'NFE.cst_cofins,'
      'NFE.base_cofins_icms,'
      'NFE.aliq_cofins_icms,'
      'NFE.valor_cofins_icms,'
      'NFE.frete,'
      'NFE.seguro,'
      'NFE.despesas,'
      'NFE.desconto'
      'From nfe_detalhe NFE'
      'left join nfe_master nfm  on NFE.fknfe=nfm.codigo'
      'left join produto pro on NFE.id_produto=pro.codigo'
      'where'
      'NFM.codigo=:ID')
    Left = 368
    Top = 135
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItens_NFe_SFKNFE: TIntegerField
      FieldName = 'FKNFE'
      Origin = 'FKNFE'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItens_NFe_SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItens_NFe_SID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItens_NFe_SDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItens_NFe_SQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryItens_NFe_SUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItens_NFe_STOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SIND_MOV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_MOV'
      Origin = 'IND_MOV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryItens_NFe_SCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItens_NFe_SCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryItens_NFe_SBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SBASE_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SALIQ_ICMS_ST: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ST'
      Origin = 'ALIQ_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object qryItens_NFe_SBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object qryItens_NFe_SBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object qryItens_NFe_SBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_SDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object QryItens_NFCe_S: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'NFCD.fkvenda,'
      'NFCD.codigo,'
      'NFCD.id_produto,'
      'pro.descricao,'
      'NFCD.qtd QUANTIDADE,'
      'NFCD.unidade,'
      'NFCD.total,'
      #39'1'#39' AS IND_MOV,'
      'NFCD.CFOP,'
      'NFCD.cst,'
      'NFCD.base_icms,'
      'NFCD.aliq_icms,'
      'NFCD.valor_icms,'
      '0 AS base_icms_st,'
      '0 AS aliq_icms_st,'
      '0 AS valor_icms_st,'
      #39'99'#39' as cst_ipi,'
      '0 as base_ipi,'
      '0 as aliq_ipi,'
      '0 as valor_ipi,'
      'NFCD.cst_pis,'
      'NFCD.base_pis_icms,'
      'NFCD.aliq_pis_icms,'
      'NFCD.valor_pis_icms,'
      'NFCD.cst_cofins,'
      'NFCD.base_cofins_icms,'
      'NFCD.aliq_cofins_icms,'
      'NFCD.valor_cofins_icms,'
      '0 as frete,'
      '0 as seguro,'
      '0 as despesas,'
      'NFCD.vdesconto'
      'From nfce_detalhe NFCD'
      'left join nfce_master nfcm  on NFCD.fkvenda=nfcm.codigo'
      'left join produto pro on nfcd.id_produto=pro.codigo'
      'where'
      'NFCM.codigo=:ID'
      '')
    Left = 374
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryItens_NFCe_SFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryItens_NFCe_SQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object QryItens_NFCe_SUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object QryItens_NFCe_STOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SIND_MOV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_MOV'
      Origin = 'IND_MOV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object QryItens_NFCe_SCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object QryItens_NFCe_SCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object QryItens_NFCe_SBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SBASE_ICMS_ST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SALIQ_ICMS_ST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_ICMS_ST'
      Origin = 'ALIQ_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SVALOR_ICMS_ST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SCST_IPI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryItens_NFCe_SBASE_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SALIQ_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SVALOR_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QryItens_NFCe_SBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QryItens_NFCe_SBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QryItens_NFCe_SFRETE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE'
      Origin = 'FRETE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SSEGURO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SDESPESAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object QryItens_NFCe_SVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryNFCE_S: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'NFCE.codigo,'
      #39'1'#39' as IND_OPER,'
      #39'0'#39' as IND_EMIT,'
      #39'2'#39'||NFCE.id_cliente as id_cliente,'
      'NFCE.modelo as Modelo,'
      'NFCE.situacao,'
      'NFCE.serie,'
      'NFCE.numero,'
      'NFCE.chave,'
      'NFCE.data_emissao,'
      'NFCE.data_saida,'
      'NFCE.total,'
      'NFCE.desconto,'
      'NFCE.subtotal,'
      '9 AS tipo_frete,'
      '0 AS frete,'
      '0 AS seguro,'
      '0 AS despesas,'
      'nfCe.baseicms,'
      'nfCe.totalicms,'
      '0 AS base_st,'
      '0 AS total_st,'
      '0 AS base_ipi,'
      '0 AS total_ipi,'
      'nfCe.baseicmspis,'
      'nfCe.totalicmspis,'
      'nfCe.baseicmscof,'
      'nfCe.totalicmscofins'
      'From NFCE_MASTER NFCE'
      'where'
      'NFCE.data_emissao between :data1 and :data2 and'
      'nfCE.FKEMPRESA=:EMPRESA and'
      'NFCE.situacao in ('#39'T'#39','#39'C'#39')')
    Left = 290
    Top = 184
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryNFCE_SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SIND_OPER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_OPER'
      Origin = 'IND_OPER'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFCE_SIND_EMIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_EMIT'
      Origin = 'IND_EMIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFCE_SID_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryNFCE_SMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryNFCE_SSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFCE_SSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFCE_SNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFCE_SDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryNFCE_SDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryNFCE_STOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_SDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_SSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_STIPO_FRETE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SFRETE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE'
      Origin = 'FRETE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SSEGURO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SDESPESAS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_STOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_SBASE_ST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_STOTAL_ST: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SBASE_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_STOTAL_IPI: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryNFCE_SBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_STOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_SBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFCE_STOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryNFE_S: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'NFE.codigo,'
      #39'1'#39' as IND_OPER,'
      #39'0'#39' as IND_EMIT,'
      #39'2'#39'||NFE.id_cliente as id_cliente,'
      'NFE.modelo as Modelo,'
      'NFE.situacao,'
      'NFE.serie,'
      'NFE.numero,'
      'NFE.chave,'
      'NFE.data_emissao,'
      'NFE.data_saida,'
      'NFE.total,'
      'NFE.desconto,'
      'NFE.subtotal,'
      'NFE.tipo_frete,'
      'NFE.frete,'
      'NFE.seguro,'
      'nfe.despesas,'
      'nfe.baseicms,'
      'nfe.totalicms,'
      'nfe.base_st,'
      'nfe.total_st,'
      'nfe.base_ipi,'
      'nfe.total_ipi,'
      'nfe.baseicmspis,'
      'nfe.totalicmspis,'
      'nfe.baseicmscof,'
      'nfe.totalicmscofins'
      'From NFE_MASTER NFE'
      'left join cfop on cfop.codigo=NFE.cfop'
      'where'
      'NFE.data_emissao between :data1 and :data2 and'
      'nfE.fkempresa=:EMPRESA and'
      'cfop.tipo='#39'S'#39' and'
      'NFE.situacao in ('#39'2'#39','#39'3'#39','#39'5'#39','#39'6'#39')')
    Left = 290
    Top = 136
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryNFE_SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryNFE_SIND_OPER: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_OPER'
      Origin = 'IND_OPER'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFE_SIND_EMIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_EMIT'
      Origin = 'IND_EMIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFE_SID_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryNFE_SMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryNFE_SSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFE_SSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFE_SNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      DisplayFormat = ',0.00'
    end
    object qryNFE_SCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFE_SDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryNFE_SDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryNFE_STOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      Size = 30
    end
    object qryNFE_SFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_SBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFE_STOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qrUnidades: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select'
      'distinct(UND.codigo) abreviatura,'
      'und.descricao'
      'from  compra_itens ITECO'
      'left JOIN compra PEDICO on ITECO.fk_compra=PEDICO.id'
      'left JOIN produto PROD on ITECO.fk_produto=PROD.codigo'
      'left JOIN unidade UND on PROD.unidade= UND.codigo'
      'where'
      'PEDICO.dtentrada between :data1 and :data2 and'
      'PEDICO.STATUS='#39'F'#39' and'
      'PEDICO.empresa=:EMPRESA')
    Left = 288
    Top = 80
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qrUnidadesABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Origin = 'ABREVIATURA'
      Size = 10
    end
    object qrUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
  end
  object qryConsC100: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select codigo from sped_c100'
      'where'
      'fk_sped=:id and'
      'not(COD_SIT in ('#39'02'#39','#39'03'#39','#39'04'#39'))')
    Left = 296
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryConsC100CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryConsUnidade: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select codigo,unidade,descricao from sped_unidade'
      'where'
      'fk_sped=:sped and'
      'fk_empresa=:empresa')
    Left = 216
    Top = 24
    ParamData = <
      item
        Name = 'SPED'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryConsUnidadeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsUnidadeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryConsUnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
  end
  object qrParticipantes: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select'
      'DISTINCT('#39'1'#39'||FORN.codigo)AS COD_PART,'
      'FORN.cnpj,'
      'FORN.ie,'
      'FORN.razao,'
      'FORN.fantasia,'
      'FORN.endereco,'
      'FORN.numero,'
      'FORN.bairro,'
      'forn.codmun'
      'from  compra PEDICO'
      'left JOIN pessoa Forn on PEDICO.fornecedor=FORN.codigo'
      'where'
      'PEDICO.dtentrada between :data1 and :data2 and'
      'PEDICO.STATUS='#39'F'#39' and'
      'pedico.modelo in ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39','#39'65'#39') and'
      'PEDICO.empresa=:EMPRESA'
      'union'
      ''
      'select'
      'DISTINCT('#39'2'#39'||NFe.id_cliente)AS COD_PART,'
      'CLI.cnpj,'
      'CLI.ie,'
      'CLI.razao,'
      'CLI.fantasia,'
      'CLI.endereco,'
      'CLI.numero,'
      'CLI.bairro,'
      'CLI.codmun'
      'from  nfe_master NFE'
      'left JOIN PESSOA CLI on NFE.id_cliente=CLI.codigo'
      'where'
      'NFE.data_emissao between :data1 and :data2  and'
      '(nfe.fkempresa=:empresa) and'
      '(nfe.situacao ='#39'2'#39')')
    Left = 216
    Top = 80
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qrParticipantesCOD_PART: TStringField
      FieldName = 'COD_PART'
      Origin = 'COD_PART'
      Size = 12
    end
    object qrParticipantesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qrParticipantesIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qrParticipantesRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 50
    end
    object qrParticipantesFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 50
    end
    object qrParticipantesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qrParticipantesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qrParticipantesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qrParticipantesCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
    end
  end
  object qryItensC: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'ITECO.fk_compra,'
      'ITECO.fk_produto,'
      'pro.descricao,'
      'ITECO.qtd,'
      'pro.unidade,'
      'ITECO.vl_item,'
      #39'0'#39' AS IND_MOV,'
      'ITECO.CFOP,'
      'ITECO.cst_icm,'
      'coalesce(ITECO.base_icms,0) base_icms,'
      'coalesce(ITECO.aliq_icms,0) aliq_icms,'
      'coalesce(ITECO.vl_icms,0) vl_icms,'
      'coalesce(ITECO.base_st,0) base_st,'
      'coalesce(ITECO.aliq_st,0) aliq_st,'
      'coalesce(ITECO.vl_st,0) vl_st,'
      'ITECO.cst_ipi,'
      'coalesce(ITECO.base_ipi,0) base_ipi,'
      'coalesce(ITECO.aliq_ipi,0) aliq_ipi,'
      'coalesce(ITECO.vl_ipi,0) vl_ipi,'
      'ITECO.cst_pis,'
      'coalesce(ITECO.base_pis,0) base_pis,'
      'coalesce(ITECO.aliq_pis,0) aliq_pis,'
      'coalesce(ITECO.vl_pis,0) vl_pis,'
      'ITECO.cst_cof,'
      'coalesce(ITECO.base_cof,0) base_cof,'
      'coalesce(ITECO.aliq_cof,0) aliq_cof,'
      'coalesce(ITECO.vl_cof,0) vl_cof,'
      'coalesce(ITECO.frete1,0) frete1,'
      'coalesce(ITECO.seguro,0) seguro,'
      'coalesce(ITECO.despesa,0) despesa,'
      'coalesce(ITECO.desconto,0) desconto'
      'From compra_itens ITECO'
      'left join compra  pedico on iteco.fk_compra=pedico.id'
      'left join produto pro    on pro.codigo=iteco.fk_produto'
      'where'
      'pedico.id=:id')
    Left = 215
    Top = 136
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensCFK_COMPRA: TIntegerField
      FieldName = 'FK_COMPRA'
      Origin = 'FK_COMPRA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItensCFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItensCDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItensCQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryItensCVL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCIND_MOV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_MOV'
      Origin = 'IND_MOV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryItensCCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItensCCST_ICM: TStringField
      FieldName = 'CST_ICM'
      Origin = 'CST_ICM'
      Size = 5
    end
    object qryItensCBASE_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCALIQ_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCVL_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCBASE_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCALIQ_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_ST'
      Origin = 'ALIQ_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCVL_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ST'
      Origin = 'VL_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object qryItensCBASE_IPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCALIQ_IPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCVL_IPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object qryItensCBASE_PIS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCALIQ_PIS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCVL_PIS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_PIS'
      Origin = 'VL_PIS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCCST_COF: TStringField
      FieldName = 'CST_COF'
      Origin = 'CST_COF'
      Size = 3
    end
    object qryItensCBASE_COF: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_COF'
      Origin = 'BASE_COF'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCALIQ_COF: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCVL_COF: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_COF'
      Origin = 'VL_COF'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCFRETE1: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE1'
      Origin = 'FRETE1'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCSEGURO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCDESPESA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESPESA'
      Origin = 'DESPESA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryItensCDESCONTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
  end
  object qryItens_NFe_E: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'NFD.fknfe,'
      'NFD.id_produto,'
      'pro.descricao,'
      'NFD.qtd,'
      'pro.unidade,'
      'NFD.total,'
      #39'0'#39' AS IND_MOV,'
      'NFD.CFOP,'
      'NFD.cst,'
      'NFD.base_icms,'
      'NFD.aliq_icms,'
      'NFD.valor_icms,'
      'NFD.base_icms_st,'
      'NFD.aliq_icms_st,'
      'NFD.valor_icms_st,'
      'NFD.cst_ipi,'
      'NFD.base_ipi,'
      'NFD.aliq_ipi,'
      'NFD.valor_ipi,'
      'NFD.cst_pis,'
      'NFD.base_pis_icms,'
      'NFD.aliq_pis_icms,'
      'NFD.valor_pis_icms,'
      'NFD.cst_cofins,'
      'NFD.base_cofins_icms,'
      'NFD.aliq_cofins_icms,'
      'NFD.valor_cofins_icms,'
      'NFD.frete,'
      'NFD.seguro,'
      'NFD.despesas,'
      'NFD.desconto'
      'From nfe_detalhe nfd'
      'left join nfe_master nfm on nfd.fknfe=nfm.codigo'
      'left join produto pro    on pro.codigo=nfd.id_produto'
      'where'
      'nfd.fknfe=:id'
      '')
    Left = 215
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItens_NFe_EFKNFE: TIntegerField
      FieldName = 'FKNFE'
      Origin = 'FKNFE'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItens_NFe_EID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItens_NFe_EDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItens_NFe_EQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryItens_NFe_EUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryItens_NFe_ETOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EIND_MOV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_MOV'
      Origin = 'IND_MOV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryItens_NFe_ECFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItens_NFe_ECST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryItens_NFe_EBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EBASE_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EALIQ_ICMS_ST: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ST'
      Origin = 'ALIQ_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_ECST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object qryItens_NFe_EBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_ECST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object qryItens_NFe_EBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_ECST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object qryItens_NFe_EBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_ESEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItens_NFe_EDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryNFe_E: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'0'#39' as TPOperacao,'
      #39'0'#39' as TPEmissao,'
      #39'1'#39'||NFEM.id_cliente as id_fornecedor,'
      'NFEM.codigo AS id_pedidocompra,'
      'NFEM.codigo,'
      'NFEM.situacao AS STATUS,'
      'NFEM.serie,'
      'NFEM.numero,'
      'NFEM.chave,'
      'NFEM.data_emissao,'
      'NFEM.total,'
      'NFEM.desconto,'
      'NFEM.frete,'
      'NFEM.seguro,'
      'NFEM.despesas,'
      'NFEM.subtotal,'
      'NFEM.baseicms,'
      'NFEM.totalicms,'
      'NFEM.base_st,'
      'NFEM.total_st,'
      'NFEM.total_ipi,'
      'NFEM.totalicmspis,'
      'NFEM.totalicmscofins'
      'From nfe_master NFEM'
      'left join cfop on cfop.codigo=nfem.cfop'
      'where NFEM.data_emissao between :data1 and :data2 and'
      'NFEM.situacao in ('#39'2'#39','#39'3'#39','#39'6'#39') and'
      'NFEM.id_emitente=:ID and'
      'cfop.tipo='#39'E'#39
      'ORDER BY numero;')
    Left = 127
    Top = 80
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qryNFe_ETPOPERACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TPOPERACAO'
      Origin = 'TPOPERACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFe_ETPEMISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TPEMISSAO'
      Origin = 'TPEMISSAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryNFe_EID_FORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryNFe_EID_PEDIDOCOMPRA: TIntegerField
      FieldName = 'ID_PEDIDOCOMPRA'
      Origin = 'CODIGO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryNFe_ECODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryNFe_ESTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFe_ESERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFe_ENUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      DisplayFormat = ',0.00'
    end
    object qryNFe_ECHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFe_EDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryNFe_ETOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_EDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_EFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ESEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_EDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ESUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_EBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ETOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_EBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ETOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ETOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ETOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryNFe_ETOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryCompra: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      'PEDICO.ID,'
      #39'0'#39' as TPOperacao,'
      #39'1'#39' as TPEmissao,'
      #39'1'#39'||PEDICO.fornecedor as id_fornecedor,'
      'PEDICO.modelo,'
      'PEDICO.status,'
      'PEDICO.serie,'
      'PEDICO.nr_nota,'
      'PEDICO.chave,'
      'PEDICO.dtemissao,'
      'PEDICO.dtentrada,'
      'PEDICO.total,'
      'PEDICO.desconto,'
      'PEDICO.frete,'
      'PEDICO.seguro,'
      'PEDICO.despesas,'
      'PEDICO.subtotal,'
      'PEDICO.base_icm,'
      'PEDICO.total_icm,'
      'PEDICO.base_st,'
      'PEDICO.total_st,'
      'PEDICO.total_ipi,'
      'PEDICO.total_pis,'
      'PEDICO.total_cof'
      'From compra PEDICO'
      'where '
      'PEDICO.dtentrada between :data1 and :data2 and'
      'PEDICO.STATUS in ('#39'F'#39','#39'C'#39') and'
      'pedico.modelo in ('#39'01'#39','#39'1B'#39','#39'04'#39','#39'55'#39','#39'65'#39') and'
      'PEDICO.empresa=:ID'
      'ORDER BY nr_nota;')
    Left = 127
    Top = 24
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qryCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryCompraTPOPERACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TPOPERACAO'
      Origin = 'TPOPERACAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryCompraTPEMISSAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TPEMISSAO'
      Origin = 'TPEMISSAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryCompraID_FORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryCompraMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 5
    end
    object qryCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      Size = 1
    end
    object qryCompraSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 5
    end
    object qryCompraNR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object qryCompraCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 44
    end
    object qryCompraDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
      Required = True
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryCompraDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
      Required = True
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryCompraTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ICM: TFMTBCDField
      FieldName = 'BASE_ICM'
      Origin = 'BASE_ICM'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ICM: TFMTBCDField
      FieldName = 'TOTAL_ICM'
      Origin = 'TOTAL_ICM'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_PIS: TFMTBCDField
      FieldName = 'TOTAL_PIS'
      Origin = 'TOTAL_PIS'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_COF: TFMTBCDField
      FieldName = 'TOTAL_COF'
      Origin = 'TOTAL_COF'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
  end
  object qryConsC170: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT '
      'sp.CST_ICMS,'
      'sp.CFOP,'
      'sp.ALIQ_ICM,'
      'SUM(sp.VL_ITEM)VL_ITEM,'
      'SUM(sp.VL_OPR)VL_OPR,'
      'SUM(sp.VL_BC_ICMS)VL_BC_ICMS,'
      'SUM(sp.VL_ICMS)VL_ICMS,'
      'SUM(sp.VL_BC_ICMS_ST)VL_BC_ICMS_ST,'
      'SUM(sp.VL_ICMS_ST)VL_ICMS_ST,'
      'SUM(sp.VL_IPI)VL_IPI'
      'FROM sped_C170 sp'
      'left join sped_c100 sp100 on sp100.codigo=sp.fk_c100'
      'WHERE'
      'sp.fk_c100=:reg and'
      'not sp100.cod_sit in ('#39'02'#39','#39'03'#39','#39'04'#39') and'
      'sp100.cod_mod in ('#39'55'#39','#39'65'#39')'
      ''
      ''
      'group by 1,2,3')
    Left = 48
    Top = 184
    ParamData = <
      item
        Name = 'REG'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryConsC170CST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Size = 3
    end
    object qryConsC170CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryConsC170ALIQ_ICM: TFMTBCDField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_ITEM: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_OPR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_OPR'
      Origin = 'VL_OPR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_BC_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_BC_ICMS'
      Origin = 'VL_BC_ICMS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_BC_ICMS_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_BC_ICMS_ST'
      Origin = 'VL_BC_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_ICMS_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS_ST'
      Origin = 'VL_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsC170VL_IPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryC170_NFe_S: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      '/* ITENS NFE */'
      ''
      'Select'
      #39'NFE'#39' as tabela,'
      'NFE.fknfe,'
      'NFE.codigo,'
      'NFE.id_produto,'
      'pro.descricao,'
      'NFE.qtd,'
      'NFE.unidade,'
      'NFE.total,'
      #39'1'#39' AS IND_MOV,'
      'NFE.cfop,'
      'nfe.cst,'
      'NFE.base_icms,'
      'NFE.aliq_icms,'
      'NFE.valor_icms,'
      'NFE.base_icms_st,'
      'NFE.aliq_icms_st,'
      'NFE.valor_icms_st,'
      'NFE.cst_ipi,'
      'NFE.base_ipi,'
      'NFE.aliq_ipi,'
      'NFE.valor_ipi,'
      'NFE.CST_PIS,'
      'NFE.base_pis_icms,'
      'NFE.aliq_pis_icms,'
      'NFE.valor_pis_icms,'
      'NFE.cst_cofins,'
      'NFE.base_cofins_icms,'
      'NFE.aliq_cofins_icms,'
      'NFE.valor_cofins_icms,'
      'NFE.frete,'
      'NFE.seguro,'
      'NFE.despesas,'
      'NFE.desconto'
      'From nfe_detalhe NFE'
      'left join nfe_master nfm  on NFE.fknfe=nfm.codigo'
      'left join produto pro on NFE.id_produto=pro.codigo'
      'where'
      'NFM.codigo=:ID')
    Left = 55
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryC170_NFe_STABELA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TABELA'
      Origin = 'TABELA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryC170_NFe_SFKNFE: TIntegerField
      FieldName = 'FKNFE'
      Origin = 'FKNFE'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryC170_NFe_SCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryC170_NFe_SID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryC170_NFe_SDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryC170_NFe_SQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryC170_NFe_SUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryC170_NFe_STOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SIND_MOV: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IND_MOV'
      Origin = 'IND_MOV'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryC170_NFe_SCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryC170_NFe_SCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryC170_NFe_SBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SBASE_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SALIQ_ICMS_ST: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ST'
      Origin = 'ALIQ_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object qryC170_NFe_SBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object qryC170_NFe_SBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object qryC170_NFe_SBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryC170_NFe_SDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryEmpresa: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select codigo, fantasia from empresa'
      'ORDER BY razao')
    Left = 56
    Top = 24
    object qryEmpresaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEmpresaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
  end
  object qryContador: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from contador'
      'ORDER BY NOME')
    Left = 56
    Top = 80
    object qryContadorCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContadorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryContadorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 15
    end
    object qryContadorCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 11
    end
    object qryContadorCRC: TStringField
      FieldName = 'CRC'
      Origin = 'CRC'
      Size = 10
    end
    object qryContadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryContadorNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryContadorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object qryContadorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryContadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object qryContadorCOD_MUN: TIntegerField
      FieldName = 'COD_MUN'
      Origin = 'COD_MUN'
    end
    object qryContadorFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 12
    end
    object qryContadorFAX: TStringField
      FieldName = 'FAX'
      Origin = 'FAX'
      Size = 12
    end
    object qryContadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryContadorUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryContadorFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryContadorFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
    end
  end
  object qryInventario: TFDQuery
    OnCalcFields = qryInventarioCalcFields
    AggregatesActive = True
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select fk_produto, descricao,pr_custo, sum(qtde) qtde, sum(qtds)' +
        ' qtds, sum(qtde-qtds) saldo from('
      
        'select ci.fk_produto, pro.descricao, pro.pr_custo, ci.qtd qtde, ' +
        '0 as qtds  from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'co.dtentrada<:data and co.status='#39'F'#39' AND co.ehfiscal='#39'S'#39
      ''
      'union all'
      
        'select vd.id_produto, pro.descricao, pro.pr_custo, 0 as qtde,  v' +
        'd.qtd as qdts   from nfce_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join nfce_master vm on vm.codigo=vd.fkvenda'
      'where'
      'vm.data_emissao<:data and VM.situacao='#39'T'#39
      ''
      'union all'
      ''
      
        'select nfd.id_produto, pro.descricao, pro.pr_custo, 0 as qtde,  ' +
        'nfd.qtd as qtds   from nfe_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'where'
      
        'nfm.data_emissao<:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39'S' +
        #39
      ''
      'union all'
      
        'select nfd.id_produto, pro.descricao, pro.pr_custo, nfd.qtd as q' +
        'tde,  0 as qtds   from nfe_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'where'
      
        'nfm.data_emissao<:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39'E' +
        #39
      ''
      ')'
      'group by 1,2,3'
      'having sum(qtde-qtds)>0'
      'order by 2')
    Left = 46
    Top = 248
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
    object qryInventarioFK_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qryInventarioDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryInventarioPR_CUSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryInventarioQTDE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryInventarioQTDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDS'
      Origin = 'QTDS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryInventarioSALDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryInventarioTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL'
      Calculated = True
    end
  end
end
