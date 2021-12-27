object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 547
  Width = 483
  object qry_config: TFDQuery
    CachedUpdates = True
    Connection = connconf
    SQL.Strings = (
      'select * from TAB_USUARIO')
    Left = 184
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
  object RESTClient: TRESTClient
    Authenticator = HTTPBasicAuthenticator
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:9000'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 360
    Top = 272
  end
  object RequestLogin: TRESTRequest
    AutoCreateParams = False
    Client = RESTClient
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ValidarLogin'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 80
    Top = 184
  end
  object HTTPBasicAuthenticator: THTTPBasicAuthenticator
    Username = 'testserver'
    Password = 'testserver'
    Left = 344
    Top = 456
  end
  object RequestListarComanda: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ListarComanda'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 200
    Top = 184
  end
  object RequestListarProduto: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ListarProduto'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 80
    Top = 248
  end
  object RequestListarCategoria: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ListarCategoria'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 205
    Top = 240
  end
  object RequestAdicionarProdutoComanda: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'AdicionarProdutoComanda'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 85
    Top = 312
  end
  object RequestListarProdutoComanda: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ListarProdutoComanda'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 208
    Top = 296
  end
  object RequestExcluirProdutoComanda: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ExcluirProdutoComanda'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 85
    Top = 384
  end
  object RequestEncerrarComanda: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'EncerrarComanda'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 205
    Top = 368
  end
  object RequestOpcional: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        Name = 'usuario'
        Value = 'HEBER'
      end>
    Resource = 'ListarOpcional'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 80
    Top = 448
  end
  object conn: TUniConnection
    ProviderName = 'InterBase'
    Port = 3050
    Database = 'D:\00Dev\Delphi\System ERP\Dados\DADOS.FDB'
    Username = 'sysdba'
    Server = '192.168.100.3'
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
  object connconf: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=D:\00Dev\Delphi\System ERP\Comandas\banco.db')
    LoginPrompt = False
    Left = 344
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
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 344
    Top = 104
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 240
    Top = 104
  end
  object RESTResponse1: TRESTResponse
    Left = 360
    Top = 176
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    FieldDefs = <>
    Left = 360
    Top = 232
  end
end
