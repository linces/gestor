object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 207
  Width = 505
  object qryMesas: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from Mesas')
    Left = 32
    Top = 24
    object qryMesasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMesasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryMesasTOTAL: TSingleField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object qryMesasFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
    end
  end
  object qryPedidos: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from Mesas_pedido'
      'where'
      'fk_mesa=:mesa and situacao='#39'A'#39)
    Left = 104
    Top = 24
    ParamData = <
      item
        Name = 'MESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPedidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidosFK_MESA: TIntegerField
      FieldName = 'FK_MESA'
      Origin = 'FK_MESA'
    end
    object qryPedidosDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object qryPedidosTOTAL: TSingleField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object qryPedidosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object qryItens: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from Mesas_pedido_itens'
      'where'
      'FK_MESA_PEIDDO=:pedido'
      'order by codigo')
    Left = 176
    Top = 24
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'FK_MESA'
      Origin = 'FK_MESA'
    end
    object DateField1: TDateField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object SingleField1: TSingleField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object StringField1: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
end
