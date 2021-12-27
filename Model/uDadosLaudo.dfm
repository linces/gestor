object DadosLaudo: TDadosLaudo
  OldCreateOrder = False
  Height = 266
  Width = 500
  object qryLaudo: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO laudo'
      
        '  (codigo, data_classificacao, municipio_classificacao, local_cl' +
        'assificao, numero_contrato, lacre, origem, destino, placa, peso_' +
        'liquido, peso_tara, peso_bruto, nota_fiscal, produto, veiculo_vi' +
        'storia, motorista, cpf_motorista, tipo_produto, queimados, ardid' +
        'os, mofados, avariados, impurezas, amassados, umidade, esverdead' +
        'os, picados, fermentados, insetos, sementes_toxicas, classificad' +
        'or, data_emissao, laudo, situacao, cnpj, cliente)'
      'VALUES'
      
        '  (:codigo, :data_classificacao, :municipio_classificacao, :loca' +
        'l_classificao, :numero_contrato, :lacre, :origem, :destino, :pla' +
        'ca, :peso_liquido, :peso_tara, :peso_bruto, :nota_fiscal, :produ' +
        'to, :veiculo_vistoria, :motorista, :cpf_motorista, :tipo_produto' +
        ', :queimados, :ardidos, :mofados, :avariados, :impurezas, :amass' +
        'ados, :umidade, :esverdeados, :picados, :fermentados, :insetos, ' +
        ':sementes_toxicas, :classificador, :data_emissao, :laudo, :situa' +
        'cao, :cnpj, :cliente)')
    SQLDelete.Strings = (
      'DELETE FROM laudo'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLUpdate.Strings = (
      'UPDATE laudo'
      'SET'
      
        '  codigo = :codigo, data_classificacao = :data_classificacao, mu' +
        'nicipio_classificacao = :municipio_classificacao, local_classifi' +
        'cao = :local_classificao, numero_contrato = :numero_contrato, la' +
        'cre = :lacre, origem = :origem, destino = :destino, placa = :pla' +
        'ca, peso_liquido = :peso_liquido, peso_tara = :peso_tara, peso_b' +
        'ruto = :peso_bruto, nota_fiscal = :nota_fiscal, produto = :produ' +
        'to, veiculo_vistoria = :veiculo_vistoria, motorista = :motorista' +
        ', cpf_motorista = :cpf_motorista, tipo_produto = :tipo_produto, ' +
        'queimados = :queimados, ardidos = :ardidos, mofados = :mofados, ' +
        'avariados = :avariados, impurezas = :impurezas, amassados = :ama' +
        'ssados, umidade = :umidade, esverdeados = :esverdeados, picados ' +
        '= :picados, fermentados = :fermentados, insetos = :insetos, seme' +
        'ntes_toxicas = :sementes_toxicas, classificador = :classificador' +
        ', data_emissao = :data_emissao, laudo = :laudo, situacao = :situ' +
        'acao, cnpj = :cnpj, cliente = :cliente'
      'WHERE'
      '  codigo = :Old_codigo')
    SQLLock.Strings = (
      'SELECT * FROM laudo'
      'WHERE'
      '  codigo = :Old_codigo'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT codigo, data_classificacao, municipio_classificacao, loca' +
        'l_classificao, numero_contrato, lacre, origem, destino, placa, p' +
        'eso_liquido, peso_tara, peso_bruto, nota_fiscal, produto, veicul' +
        'o_vistoria, motorista, cpf_motorista, tipo_produto, queimados, a' +
        'rdidos, mofados, avariados, impurezas, amassados, umidade, esver' +
        'deados, picados, fermentados, insetos, sementes_toxicas, classif' +
        'icador, data_emissao, laudo, situacao, cnpj, cliente FROM laudo'
      'WHERE'
      '  codigo = :codigo')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM laudo')
    Connection = Conexao
    SQL.Strings = (
      'select * from laudo'
      'where'
      'situacao='#39'P'#39' and cnpj=:cnpj')
    Left = 208
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cnpj'
        Value = nil
      end>
    object qryLaudocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object qryLaudodata_classificacao: TDateField
      FieldName = 'data_classificacao'
    end
    object qryLaudomunicipio_classificacao: TStringField
      FieldName = 'municipio_classificacao'
      Size = 150
    end
    object qryLaudolocal_classificao: TStringField
      FieldName = 'local_classificao'
      Size = 50
    end
    object qryLaudonumero_contrato: TStringField
      FieldName = 'numero_contrato'
      Size = 50
    end
    object qryLaudolacre: TStringField
      FieldName = 'lacre'
      Size = 50
    end
    object qryLaudoorigem: TStringField
      FieldName = 'origem'
      Size = 50
    end
    object qryLaudodestino: TStringField
      FieldName = 'destino'
      Size = 50
    end
    object qryLaudoplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object qryLaudopeso_liquido: TFloatField
      FieldName = 'peso_liquido'
    end
    object qryLaudopeso_tara: TFloatField
      FieldName = 'peso_tara'
    end
    object qryLaudopeso_bruto: TFloatField
      FieldName = 'peso_bruto'
    end
    object qryLaudonota_fiscal: TIntegerField
      FieldName = 'nota_fiscal'
    end
    object qryLaudoproduto: TStringField
      FieldName = 'produto'
      Size = 50
    end
    object qryLaudoveiculo_vistoria: TStringField
      FieldName = 'veiculo_vistoria'
      Size = 5
    end
    object qryLaudomotorista: TStringField
      FieldName = 'motorista'
      Size = 50
    end
    object qryLaudocpf_motorista: TStringField
      FieldName = 'cpf_motorista'
      Size = 11
    end
    object qryLaudotipo_produto: TStringField
      FieldName = 'tipo_produto'
      Size = 10
    end
    object qryLaudoqueimados: TFloatField
      FieldName = 'queimados'
    end
    object qryLaudoardidos: TFloatField
      FieldName = 'ardidos'
    end
    object qryLaudomofados: TFloatField
      FieldName = 'mofados'
    end
    object qryLaudoavariados: TFloatField
      FieldName = 'avariados'
    end
    object qryLaudoimpurezas: TFloatField
      FieldName = 'impurezas'
    end
    object qryLaudoamassados: TFloatField
      FieldName = 'amassados'
    end
    object qryLaudoumidade: TFloatField
      FieldName = 'umidade'
    end
    object qryLaudoesverdeados: TFloatField
      FieldName = 'esverdeados'
    end
    object qryLaudopicados: TFloatField
      FieldName = 'picados'
    end
    object qryLaudofermentados: TFloatField
      FieldName = 'fermentados'
    end
    object qryLaudoinsetos: TStringField
      FieldName = 'insetos'
      Size = 5
    end
    object qryLaudosementes_toxicas: TStringField
      FieldName = 'sementes_toxicas'
      Size = 5
    end
    object qryLaudoclassificador: TStringField
      FieldName = 'classificador'
      Size = 50
    end
    object qryLaudodata_emissao: TDateField
      FieldName = 'data_emissao'
    end
    object qryLaudolaudo: TStringField
      FieldName = 'laudo'
      Size = 50
    end
    object qryLaudosituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object qryLaudocnpj: TStringField
      FieldName = 'cnpj'
      Required = True
    end
    object qryLaudocliente: TStringField
      FieldName = 'cliente'
      Required = True
      Size = 50
    end
  end
  object MySQL: TMySQLUniProvider
    Left = 136
    Top = 10
  end
  object Conexao: TUniConnection
    AutoCommit = False
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'laudo'
    Username = 'linces'
    Server = '3.211.227.45'
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 10
    EncryptedPassword = 'ACFF9AFF9CFF91FF96FF93FFCEFFCDFFCCFFCBFFCAFF'
  end
  object qryExecute: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      '')
    Left = 280
    Top = 10
  end
end
