object DadosWeb: TDadosWeb
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 361
  Width = 524
  object ConexaoAPP: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = TransacaoAPP
    UpdateTransaction = TransacaoAPP
    Left = 106
    Top = 32
  end
  object TransacaoAPP: TFDTransaction
    Connection = ConexaoAPP
    Left = 175
    Top = 32
  end
  object Cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 231
    Top = 27
  end
  object MysqlAPP: TFDPhysMySQLDriverLink
    Left = 48
    Top = 32
  end
  object cdsProdutos: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      
        'select codigo, descricao, tipo, codbarra,referencia, unidade, pr' +
        '_custo, pr_venda, qtd_atual  from produto'
      'order by descricao')
    Left = 288
    Top = 24
    object cdsProdutoscodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
    object cdsProdutostipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 30
    end
    object cdsProdutoscodbarra: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codbarra'
      Origin = 'codbarra'
    end
    object cdsProdutosreferencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'referencia'
      Origin = 'referencia'
    end
    object cdsProdutosunidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 3
    end
    object cdsProdutospr_custo: TBCDField
      FieldName = 'pr_custo'
      Origin = 'pr_custo'
      Required = True
      Precision = 10
      Size = 2
    end
    object cdsProdutospr_venda: TBCDField
      FieldName = 'pr_venda'
      Origin = 'pr_venda'
      Required = True
      Precision = 10
      Size = 2
    end
    object cdsProdutosqtd_atual: TBCDField
      FieldName = 'qtd_atual'
      Origin = 'qtd_atual'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object cdsPessoas: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      'select * from pessoa'
      'order by razao')
    Left = 360
    Top = 24
    object cdsPessoascodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPessoastipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 10
    end
    object cdsPessoascnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
    end
    object cdsPessoasie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      Required = True
    end
    object cdsPessoasfantasia: TStringField
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Required = True
      Size = 50
    end
    object cdsPessoasrazao: TStringField
      FieldName = 'razao'
      Origin = 'razao'
      Required = True
      Size = 50
    end
    object cdsPessoasendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 50
    end
    object cdsPessoasnumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 10
    end
    object cdsPessoascomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Required = True
      Size = 50
    end
    object cdsPessoascodmun: TIntegerField
      FieldName = 'codmun'
      Origin = 'codmun'
      Required = True
    end
    object cdsPessoasmunicipio: TStringField
      FieldName = 'municipio'
      Origin = 'municipio'
      Required = True
      Size = 35
    end
    object cdsPessoasbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 35
    end
    object cdsPessoasuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
    object cdsPessoascep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 8
    end
    object cdsPessoascelular1: TStringField
      FieldName = 'celular1'
      Origin = 'celular1'
      Required = True
      Size = 14
    end
    object cdsPessoascelular2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular2'
      Origin = 'celular2'
      Size = 14
    end
    object cdsPessoasisento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'isento'
      Origin = 'isento'
      Size = 1
    end
    object cdsPessoascodigolocal: TIntegerField
      FieldName = 'codigolocal'
      Origin = 'codigolocal'
      Required = True
    end
  end
  object cdsOrcamento: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      'select orc.*, pes.razao,pes.cnpj,pes.tipo from orcamento orc'
      'left join pessoa pes on pes.codigo=orc.fk_cliente'
      'where '
      'orc.situacao='#39'A'#39
      'order by orc.data')
    Left = 48
    Top = 96
    object cdsOrcamentocodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsOrcamentodata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object cdsOrcamentofk_cliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fk_cliente'
      Origin = 'fk_cliente'
    end
    object cdsOrcamentoforma_pagamento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'forma_pagamento'
      Origin = 'forma_pagamento'
      Size = 60
    end
    object cdsOrcamentovalidade: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'validade'
      Origin = 'validade'
    end
    object cdsOrcamentosituacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 1
    end
    object cdsOrcamentototal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentosubtotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'subtotal'
      Origin = 'subtotal'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentopercentual: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'percentual'
      Origin = 'percentual'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentodesconto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'desconto'
      Origin = 'desconto'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentocodigolocal: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigolocal'
      Origin = 'codigolocal'
    end
    object cdsOrcamentofk_vendedor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fk_vendedor'
      Origin = 'fk_vendedor'
    end
    object cdsOrcamentorazao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'razao'
      Origin = 'razao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsOrcamentocnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cnpj'
      Origin = 'cnpj'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsOrcamentotipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object cdsItens: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      'select orc.*, pro.descricao from orcamento_item orc'
      'left join produto pro on pro.codigo=orc.fk_produto'
      'where '
      'orc.fk_orcamento=:CODIGO')
    Left = 112
    Top = 96
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object cdsItenscodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsItensfk_orcamento: TIntegerField
      FieldName = 'fk_orcamento'
      Origin = 'fk_orcamento'
      Required = True
    end
    object cdsItensfk_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fk_produto'
      Origin = 'fk_produto'
    end
    object cdsItensqtd: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'qtd'
      Origin = 'qtd'
      Precision = 15
      Size = 3
    end
    object cdsItenspreco: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 15
      Size = 2
    end
    object cdsItenstotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      Precision = 15
      Size = 2
    end
    object cdsItenscodigolocal: TIntegerField
      FieldName = 'codigolocal'
      Origin = 'codigolocal'
      Required = True
    end
    object cdsItensdescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object CdsCidade: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      'select  * from cidade'
      'order by descricao')
    Left = 160
    Top = 96
    object CdsCidadecodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      Required = True
    end
    object CdsCidadedescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 35
    end
    object CdsCidadecoduf: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'coduf'
      Origin = 'coduf'
    end
    object CdsCidadeuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object cdsVendedor: TFDQuery
    Connection = ConexaoAPP
    SQL.Strings = (
      'select  * from vendedor'
      'order by nome')
    Left = 223
    Top = 96
    object cdsVendedorcodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendedornome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
  end
  object updOrcamento: TFDQuery
    Connection = ConexaoAPP
    Transaction = TransacaoAPP
    UpdateTransaction = TransacaoAPP
    SQL.Strings = (
      'select * from orcamento '
      'where'
      'situacao='#39'A'#39)
    Left = 304
    Top = 96
  end
  object TransacaoChave: TFDTransaction
    Connection = ConexaoChave
    Left = 223
    Top = 192
  end
  object ConexaoChave: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = TransacaoChave
    UpdateTransaction = TransacaoChave
    Left = 130
    Top = 192
  end
  object MysqlChave: TFDPhysMySQLDriverLink
    Left = 40
    Top = 192
  end
  object qryEmpresa: TFDQuery
    Connection = ConexaoChave
    SQL.Strings = (
      'select * from empresa'
      'where'
      'cnpj=:cnpj')
    Left = 308
    Top = 192
    ParamData = <
      item
        Name = 'CNPJ'
        ParamType = ptInput
        Value = Null
      end>
  end
end
