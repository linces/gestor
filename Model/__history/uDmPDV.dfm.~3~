object dmPDV: TdmPDV
  OldCreateOrder = False
  Height = 637
  Width = 937
  object qryBuscaVenda: TFDQuery
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select coalesce(max(CODIGO),0) codigo from VENDAS_MASTER'
      'where'
      'SITUACAO='#39'X'#39' and'
      'fk_usuario=:ID and'
      'TIPO=:tp and'
      'fkempresa=:emp'
      '/*where*/')
    Left = 45
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TP'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryBuscaVendaCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
  end
  object qrySoma: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'SUM(vd.valor_item) TOTAL'
      'FROM VENDAS_detalhe vd'
      'where'
      'vd.FKVENDA=:CODIGO')
    Left = 122
    Top = 32
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qrySomaTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qryNFCE_M: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM NFCE_MASTER'
      'WHERE'
      'NUMERO=:ID')
    Left = 192
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryNFCE_MCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFCE_MNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryNFCE_MCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFCE_MMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryNFCE_MSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFCE_MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryNFCE_MDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryNFCE_MHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryNFCE_MHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryNFCE_MID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryNFCE_MID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryNFCE_MFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryNFCE_MFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryNFCE_MFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryNFCE_MCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryNFCE_MTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryNFCE_MOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryNFCE_MSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFCE_MEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryNFCE_MXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryNFCE_MPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryNFCE_MMOTIVOCANCELAMENTO: TStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = 'MOTIVOCANCELAMENTO'
      Size = 200
    end
    object qryNFCE_MFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryNFCE_MABERTO: TStringField
      FieldName = 'ABERTO'
      Origin = 'ABERTO'
      Size = 1
    end
    object qryNFCE_MFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryNFCE_MFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryNFCE_MSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MSAT_NUMERO_CFE: TIntegerField
      FieldName = 'SAT_NUMERO_CFE'
      Origin = 'SAT_NUMERO_CFE'
      DisplayFormat = ',0.00'
    end
    object qryNFCE_MSAT_NUMERO_SERIE: TStringField
      FieldName = 'SAT_NUMERO_SERIE'
      Origin = 'SAT_NUMERO_SERIE'
      Size = 10
    end
    object qryNFCE_MCNF: TStringField
      FieldName = 'CNF'
      Origin = 'CNF'
    end
  end
  object qryContas: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas')
    Left = 40
    Top = 88
    object qryContasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryContasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryContasDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryContasID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryContasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryContasLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      DisplayFormat = ',0.00'
    end
    object qryContasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object qryVenda: TFDQuery
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select * from VENDAS_MASTER'
      'where'
      'codigo=:cod')
    Left = 133
    Top = 80
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryVendaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryVendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryVendaFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryVendaFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryVendaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryVendaCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryVendaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryVendaOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryVendaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryVendaVIRTUAL_CLIENTE: TStringField
      DisplayWidth = 80
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CLIENTE'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'ID_CLIENTE'
      Size = 80
      Lookup = True
    end
    object qryVendaVIRTUAL_VENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_VENDEDOR'
      LookupDataSet = Dados.qryVdd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'FK_VENDEDOR'
      Size = 50
      Lookup = True
    end
    object qryVendaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryVendaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryVendaFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryVendaNECF: TIntegerField
      FieldName = 'NECF'
      Origin = 'NECF'
    end
    object qryVendaLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryVendaVirtualEmpresa: TStringField
      FieldKind = fkLookup
      FieldName = 'VirtualEmpresa'
      LookupDataSet = Dados.qryEmpresa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'FANTASIA'
      KeyFields = 'FKEMPRESA'
      Size = 50
      Lookup = True
    end
    object qryVendaGERA_FINANCEIRO: TStringField
      FieldName = 'GERA_FINANCEIRO'
      Origin = 'GERA_FINANCEIRO'
      Size = 1
    end
    object qryVendaFK_TABELA: TIntegerField
      FieldName = 'FK_TABELA'
      Origin = 'FK_TABELA'
    end
    object qryVendaVIRTUAL_TABELA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TABELA'
      LookupDataSet = qryTabela
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FK_TABELA'
      Size = 30
      Lookup = True
    end
    object qryVendaVIRTUAL_TX_ACRESC: TFloatField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TX_ACRESC'
      LookupDataSet = qryTabela
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ACRESCIMO'
      KeyFields = 'FK_TABELA'
      Lookup = True
    end
    object qryVendaVIRTUAL_CNPJ: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CNPJ'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CNPJ'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      DisplayFormat = ',0.00%'
      Precision = 18
      Size = 2
    end
    object qryVendaPERCENTUAL_ACRESCIMO: TFMTBCDField
      FieldName = 'PERCENTUAL_ACRESCIMO'
      Origin = 'PERCENTUAL_ACRESCIMO'
      DisplayFormat = ',0.00%'
      Precision = 18
      Size = 2
    end
    object qryVendaACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 30
    end
    object qryVendaTOTAL_TROCA: TFMTBCDField
      FieldName = 'TOTAL_TROCA'
      Origin = 'TOTAL_TROCA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryVendaFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
      DisplayFormat = ',0.00'
    end
    object qryVendaFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'FORMA_PAGAMENTO'
      Size = 250
    end
    object qryVendaFK_MESA: TIntegerField
      FieldName = 'FK_MESA'
      Origin = 'FK_MESA'
    end
    object qryVendaFK_ENTREGADOR: TIntegerField
      FieldName = 'FK_ENTREGADOR'
      Origin = 'FK_ENTREGADOR'
    end
    object qryVendaVIRTUAL_ENTREGADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ENTREGADOR'
      LookupDataSet = qryEntregador
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'FK_ENTREGADOR'
      Size = 50
      Lookup = True
    end
    object qryVendaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object dsEmpresa: TDataSource
    DataSet = Dados.qryEmpresa
    Left = 192
    Top = 88
  end
  object dsItem: TDataSource
    DataSet = qryItem
    Left = 261
    Top = 24
  end
  object qryBuscaFone: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, fantasia , endereco, numero, bairro, municipio, u' +
        'f, cep, complemento, celular1   FROM pessoa'
      'where'
      '(celular1 like :fone)'
      'order by fantasia')
    Left = 280
    Top = 144
    ParamData = <
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 14
        Value = Null
      end>
    object qryBuscaFoneCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryBuscaFoneFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryBuscaFoneENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryBuscaFoneNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryBuscaFoneBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryBuscaFoneMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryBuscaFoneUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryBuscaFoneCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryBuscaFoneCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryBuscaFoneCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
  end
  object qryGrade: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select CODIGO, FK_PRODUTO, DESCRICAO, QTD, PRECO from produto_gr' +
        'ade'
      'where'
      'codigo=:codigo'
      '')
    Left = 196
    Top = 144
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryGradeFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
    object qryGradeQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryGradePRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsPesqProd: TDataSource
    DataSet = qryPesqProd
    Left = 136
    Top = 128
  end
  object qryPesqProd: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    SQL.Strings = (
      'SELECT '
      'PRO.CODIGO, '
      'PRO.DESCRICAO, '
      'PRO.CFOP,'
      'PRO.CODBARRA, '
      'PRO.NCM, '
      'PRO.REFERENCIA, '
      'PRO.PR_VENDA,'
      'PRO.PRECO_ATACADO, '
      'PRO.QTD_ATACADO, '
      'PRO.QTD_ATUAL,'
      'PRO.QTD_FISCAL,'
      'PRO.UNIDADE, '
      'PRO.EFISCAL,'
      'PRO.E_MEDIO, '
      'PRO.LOCALIZACAO,'
      'PRO.PRODUTO_PESADO,'
      'PRO.PRECO_PROMO_VAREJO,'
      'PRO.PRECO_PROMO_ATACADO, '
      'PRO.PRECO_VARIAVEL, '
      'PRO.DESCONTO,'
      'PRO.INICIO_PROMOCAO,'
      'PRO.FIM_PROMOCAO, '
      'PRO.SERVICO, '
      'PRO.REMEDIO, '
      'PRO.GRADE, '
      'PRO.FOTO,'
      'PRO.SERIAL, '
      'PRO.PREFIXO_BALANCA'
      'FROM PRODUTO PRO'
      'WHERE (PRO.EMPRESA=:EMP) AND (PRO.ATIVO='#39'S'#39')'
      '/*where*/'
      '')
    Left = 41
    Top = 136
    ParamData = <
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesqProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesqProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryPesqProdCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryPesqProdCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryPesqProdNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryPesqProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryPesqProdPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Origin = 'QTD_ATACADO'
      Precision = 18
      Size = 3
    end
    object qryPesqProdQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryPesqProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryPesqProdEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryPesqProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryPesqProdLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryPesqProdPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryPesqProdDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryPesqProdINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
      Origin = 'INICIO_PROMOCAO'
    end
    object qryPesqProdFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
      Origin = 'FIM_PROMOCAO'
    end
    object qryPesqProdSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
    end
    object qryPesqProdREMEDIO: TStringField
      FieldName = 'REMEDIO'
      Origin = 'REMEDIO'
      Size = 1
    end
    object qryPesqProdGRADE: TStringField
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
    object qryPesqProdPREFIXO_BALANCA: TStringField
      FieldName = 'PREFIXO_BALANCA'
      Origin = 'PREFIXO_BALANCA'
      Size = 8
    end
    object qryPesqProdVIRTUAL_PRECO: TExtendedField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_PRECO'
      DisplayFormat = ',0.00'
      Precision = 19
      Calculated = True
    end
    object qryPesqProdPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Origin = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryPesqProdQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
    object qryPesqProdSERIAL: TStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      Size = 1
    end
    object qryPesqProdFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object qryConta_Movimento: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas_movimento'
      'where'
      'lote=:lote and id_conta_caixa=:id'
      'order by 1')
    Left = 48
    Top = 192
    ParamData = <
      item
        Name = 'LOTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryConta_MovimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConta_MovimentoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
      Origin = 'ID_CONTA_CAIXA'
    end
    object qryConta_MovimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object qryConta_MovimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryConta_MovimentoHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qryConta_MovimentoFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
    end
    object qryConta_MovimentoLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryConta_MovimentoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object qryConta_MovimentoENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoTROCA: TFMTBCDField
      FieldName = 'TROCA'
      Origin = 'TROCA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoSALDO: TFMTBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    Left = 136
    Top = 184
  end
  object dsGrade: TDataSource
    DataSet = qryGrade
    Left = 208
    Top = 200
  end
  object dsBuscaFone: TDataSource
    DataSet = qryBuscaFone
    Left = 280
    Top = 200
  end
  object qryEntregador: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * from entregador'
      'order by nome')
    Left = 288
    Top = 256
    object qryEntregadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryEntregadorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
  end
  object qryPesqConta: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas where id_usuario=:id AND SITUACAO='#39'A'#39';')
    Left = 208
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesqContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryPesqContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryPesqContaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryPesqContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryPesqContaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object qryProd: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT CODIGO, DESCRICAO, EFISCAL, E_MEDIO, FOTO, QTD_FISCAL FRO' +
        'M PRODUTO')
    Left = 136
    Top = 233
    object qryProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qryProdEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryProdQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
    object qryProdFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object qryTabela: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from tabela_preco'
      'where'
      'fkempresa=:id'
      'order by descricao')
    Left = 48
    Top = 248
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTabelaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
    object qryTabelaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryTabelaATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryTabelaACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
  end
  object qryComposicao: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select id_produto,quantidade from produto_composicao'
      'where'
      'fk_produto=:produto')
    Left = 40
    Top = 320
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryComposicaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryComposicaoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
  end
  object qryCliente: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, razao||'#39' '#39'||cnpj as razao , cnpj, endereco, numer' +
        'o, bairro, municipio, uf, cep, fone1, celular1  FROM pessoa'
      'where'
      '(CLI='#39'S'#39') AND'
      '(ATIVO='#39'S'#39') AND'
      '(CCF='#39'N'#39') AND'
      '((RAZAO LIKE :NOME) OR'
      '(CNPJ LIKE :CPF))'
      'order by razao')
    Left = 136
    Top = 280
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'CPF'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 18
      end>
    object qryClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryClienteRAZAO: TStringField
      DisplayWidth = 100
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 100
    end
    object qryClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryClienteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryClienteFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryClienteCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
  end
  object dsEntregador: TDataSource
    DataSet = qryEntregador
    Left = 289
    Top = 321
  end
  object qtdAtacado: TFDQuery
    Left = 152
    Top = 408
  end
  object qryItem: TFDQuery
    AggregatesActive = True
    MasterSource = dsVenda
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evMode, evCache]
    FetchOptions.Mode = fmAll
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * FROM VENDAS_DETALHE'
      'where'
      'FKVENDA=:CODIGO'
      'ORDER BY ITEM;')
    Left = 35
    Top = 392
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItemCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryItemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItemDESCRICAO_SL: TStringField
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_SL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_PRODUTO'
      Size = 100
      Lookup = True
    end
    object qryItemEFISCAL: TStringField
      FieldKind = fkLookup
      FieldName = 'EFISCAL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'EFISCAL'
      KeyFields = 'ID_PRODUTO'
      Size = 1
      Lookup = True
    end
    object qryItemPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 2
    end
    object qryItemVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 2
    end
    object qryItemACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      MaxValue = '99999'
      MinValue = '0'
      Precision = 18
      Size = 3
    end
    object qryItemE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryItemQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryItemFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
      DisplayFormat = ',0.00'
    end
    object qryItemOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryItemQTD_FISCAL: TExtendedField
      FieldKind = fkLookup
      FieldName = 'QTD_FISCAL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'QTD_FISCAL'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemDESCRICAO_OBS: TStringField
      DisplayWidth = 250
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_OBS'
      Size = 250
      Calculated = True
    end
    object qryItemOBSERVACAO: TStringField
      DisplayWidth = 150
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 150
    end
    object qryItemTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(VALOR_ITEM)'
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 153
    Top = 345
  end
end
