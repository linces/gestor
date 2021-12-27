object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 397
  Width = 533
  object conn: TUniConnection
    ProviderName = 'InterBase'
    Port = 3050
    Database = 'D:\00Dev\Delphi\System ERP\Dados\DADOS.FDB'
    Username = 'sysdba'
    LoginPrompt = False
    Left = 280
    Top = 32
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object QryLogin: TUniQuery
    Connection = conn
    ObjectView = True
    Left = 112
    Top = 32
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
end
