object dmSecDados: TdmSecDados
  OldCreateOrder = False
  Height = 240
  Width = 339
  object LocalConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=local')
    Connected = True
    LoginPrompt = False
    Left = 82
    Top = 45
  end
  object LicencasTable: TFDQuery
    Active = True
    Connection = LocalConnection
    SQL.Strings = (
      'SELECT * FROM licencas.licencas')
    Left = 82
    Top = 93
  end
end
