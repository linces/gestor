object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qry_config: TFDQuery
    Connection = connconf
    SQL.Strings = (
      'select * from tab_usuario')
    Left = 183
    Top = 32
    object qry_configUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qry_configSERVIDOR: TStringField
      FieldName = 'SERVIDOR'
      Origin = 'SERVIDOR'
      Size = 1000
    end
    object qry_configcaminho: TStringField
      FieldName = 'caminho'
      Origin = 'caminho'
      Size = 150
    end
  end
  object conn: TUniConnection
    ProviderName = 'InterBase'
    Port = 3050
    Database = 'D:\00Dev\Delphi\System ERP\Dados\DADOS.FDB'
    Username = 'sysdba'
    LoginPrompt = False
    Left = 183
    Top = 40
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object QryLogin: TUniQuery
    Connection = conn
    ObjectView = True
    Left = 112
    Top = 32
  end
  object connconf: TFDConnection
    Params.Strings = (
      'Database=D:\00Dev\Delphi\System ERP\Comandas\banco.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 183
    Top = 48
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 24
    Top = 24
  end
  object qryComanda: TUniQuery
    Connection = conn
    SQL.Strings = (
      'Select * from mesas')
    ObjectView = True
    Left = 24
    Top = 104
  end
  object qryProdutos: TUniQuery
    Connection = conn
    ObjectView = True
    Left = 96
    Top = 104
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 183
    Top = 118
  end
end
