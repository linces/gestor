object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 435
  Width = 593
  object con: TUniConnection
    ProviderName = 'InterBase'
    Port = 3050
    Database = 'D:\00Dev\Delphi\System ERP\Dados\DADOS.FDB'
    SpecificOptions.Strings = (
      'InterBase.ClientLibrary=gds32.dll')
    Username = 'sysdba'
    Server = '192.168.100.3'
    LoginPrompt = False
    Left = 16
    Top = 8
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object queryLogin: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from usuarios')
    CachedUpdates = True
    Left = 24
    Top = 200
    object queryLoginCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object queryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Size = 30
    end
    object queryLoginHIERARQUIA: TSmallintField
      FieldName = 'HIERARQUIA'
    end
    object queryLoginECAIXA: TStringField
      FieldName = 'ECAIXA'
      Size = 1
    end
    object queryLoginSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      Size = 1
    end
    object queryLoginATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object queryLoginULTIMO_PEDIDO: TIntegerField
      FieldName = 'ULTIMO_PEDIDO'
    end
    object queryLoginULTIMA_VENDA: TIntegerField
      FieldName = 'ULTIMA_VENDA'
    end
    object queryLoginSENHA_APP: TStringField
      FieldName = 'SENHA_APP'
      Size = 30
    end
    object queryLoginAPP_SENHA: TStringField
      FieldName = 'APP_SENHA'
      Size = 30
    end
    object queryLoginFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
    end
    object queryLoginFLAG: TStringField
      FieldName = 'FLAG'
      Size = 1
    end
    object queryLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
  end
  object queryPedidosCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pedidos')
    Left = 48
    Top = 336
    object queryPedidosConid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object queryPedidosConid_venda: TIntegerField
      FieldName = 'id_venda'
      Required = True
    end
    object queryPedidosConvalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object queryPedidosConmesa: TStringField
      FieldName = 'mesa'
      Required = True
      Size = 10
    end
    object queryPedidosConfuncionario: TStringField
      FieldName = 'funcionario'
      Required = True
      Size = 25
    end
    object queryPedidosCondata: TDateField
      FieldName = 'data'
      Required = True
    end
  end
  object queryPedidosExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pedidos')
    Left = 152
    Top = 328
  end
  object queryMesasCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from mesas')
    Left = 64
    Top = 120
  end
  object queryPratosCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pratos')
    Left = 152
    Top = 120
  end
  object queryItensPedido: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from detalhes_pedidos')
    Left = 264
    Top = 128
    object queryItensPedidoid: TIntegerField
      FieldName = 'id'
    end
    object queryItensPedidoid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Required = True
    end
    object queryItensPedidoprato: TStringField
      FieldName = 'prato'
      Required = True
      Size = 30
    end
    object queryItensPedidovalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object queryItensPedidovalor_total: TFloatField
      FieldName = 'valor_total'
      Required = True
    end
  end
  object queryItensPedidoExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from detalhes_pedidos')
    Left = 384
    Top = 120
  end
  object queryPratosCon2: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from pratos')
    Left = 152
    Top = 184
  end
  object queryMovExec: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 496
    Top = 120
  end
  object queryMovCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 496
    Top = 184
  end
  object queryReservasCon: TUniQuery
    Connection = con
    SQL.Strings = (
      'select * from reservas')
    Left = 288
    Top = 208
  end
  object queryProdutosCon: TUniQuery
    Connection = con
    SQL.Strings = (
      
        'select id, nome, descricao, valor, quantidade, imagem from produ' +
        'tos')
    Left = 88
    Top = 256
    object queryProdutosConid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object queryProdutosConnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 30
    end
    object queryProdutosCondescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object queryProdutosConvalor: TFloatField
      FieldName = 'valor'
    end
    object queryProdutosConquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object queryProdutosConimagem: TBlobField
      FieldName = 'imagem'
    end
  end
  object UniTable1: TUniTable
    Connection = con
    Left = 384
    Top = 280
  end
  object qry_config: TFDQuery
    CachedUpdates = True
    Connection = connconf
    SQL.Strings = (
      'select * from TAB_USUARIO')
    Left = 248
    Top = 8
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
  object connconf: TFDConnection
    Params.Strings = (
      'Database=D:\00Dev\Delphi\System ERP\Mobile Comanda\banco.db'
      'DriverID=SQLite')
    LoginPrompt = False
    AfterConnect = connconfAfterConnect
    BeforeConnect = connconfBeforeConnect
    Left = 184
    Top = 8
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 88
    Top = 8
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 304
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 424
    Top = 64
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = con
    Left = 56
    Top = 64
  end
  object IdIOHandlerStack1: TIdIOHandlerStack
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    Left = 176
    Top = 96
  end
  object IdIOHandlerStream1: TIdIOHandlerStream
    MaxLineAction = maException
    Port = 0
    FreeStreams = False
    Left = 312
    Top = 320
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=D:\00Dev\Delphi\System ERP\Dados\DADOS.FDB'
      'Server=192.168.100.3'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 480
    Top = 296
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    VendorLib = 'gds32.dll'
    Left = 472
    Top = 360
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://192.168.100.3:9000'
    Params = <>
    RedirectsWithGET = [Post301, Post302, Post303, Post307, Post308, Put301, Put302, Put303, Delete303]
    SecureProtocols = [SSL2, SSL3, TLS1, TLS11, TLS12]
    Left = 400
    Top = 232
  end
  object ValidarLogin: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 240
    Top = 288
  end
  object RESTResponse1: TRESTResponse
    Left = 192
    Top = 296
  end
end
