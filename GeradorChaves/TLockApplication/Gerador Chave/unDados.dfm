object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 438
  Width = 552
  object dsLicencasTable: TDataSource
    DataSet = uniLicencasTable
    Left = 112
    Top = 72
  end
  object ConfigprincipalConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 114
    Top = 9
  end
  object LockApplication1: TLockApplication
    IDSistema = 123995677
    Demostracao = True
    Informacoes_adicionais = True
    Mostrar_Tela_Primeira_Vez = True
    Dias_Demostracao = 5
    Local_Registro = '\Software\Appro1'
    Chave_Criptografia = 'LockApplicat2'
    Titulo_das_janelas = 'ERP SoftArena'
    Email_de_contato = 'softarena@softarena.com.br'
    Site_da_Empresa = 'https:\\loja.softarena.com.br'
    Telefones_de_Contato = '(34) 99158-7421'
    Versao_Trial = 1
    SMTP_Servidor = 'smtp.gmail.com'
    SMTP_Usuario = 'rejanebs2013@gmail.com'
    SMTP_Senha = 'secnil123456'
    SMTP_Porta = 465
    EMAIL_Enviar = True
    EMAIL_Remetente = 'softarena@softarena.com.br'
    EMAIL_Destino = 'softarena@softarena.com.br'
    EMAIL_Assunto = 'Recebimento de Licen'#231'a'
    EMAIL_Dias_enviar = 5
    IntervaloPing = 9
    HostBD = '3.211.227.45'
    DatabaseBD = 'licencas'
    PasswordBD = 'Secnil12345'
    UsuarioBD = 'linces'
    PortaBD = 3306
    REST_url_com_porta = 'http://3.211.227.45:9003/ping'
    RestServerAtivo = False
    QuantidaRegistrosBD = 3
    Language = Portugues
    Left = 424
    Top = 40
  end
  object dsConfigs: TDataSource
    DataSet = ConfigsTable
    Left = 104
    Top = 136
  end
  object ConfigsTable: TFDTable
    CachedUpdates = True
    Connection = ConfigprincipalConnection
    UpdateOptions.UpdateTableName = 'configs'
    TableName = 'configs'
    Left = 24
    Top = 136
    object ConfigsTableserver: TStringField
      FieldName = 'server'
      Origin = 'server'
      Required = True
      Size = 128
    end
    object ConfigsTabledatabase: TStringField
      FieldName = 'database'
      Origin = '"database"'
      Size = 128
    end
    object ConfigsTableuser: TStringField
      FieldName = 'user'
      Origin = 'user'
      Size = 128
    end
    object ConfigsTablepassword: TStringField
      FieldName = 'password'
      Origin = 'password'
      Size = 128
    end
    object ConfigsTablecel: TStringField
      FieldName = 'cel'
      Origin = 'cel'
      Size = 14
    end
    object ConfigsTableidioma: TStringField
      FieldName = 'idioma'
      Origin = 'idioma'
      Size = 14
    end
    object ConfigsTableipserver: TStringField
      FieldName = 'ipserver'
      Origin = 'ipserver'
      Size = 15
    end
    object ConfigsTableiniciarwhats: TStringField
      FieldName = 'iniciarwhats'
      Origin = 'iniciarwhats'
      FixedChar = True
      Size = 1
    end
    object ConfigsTableprotegercomsenha: TStringField
      FieldName = 'protegercomsenha'
      Origin = 'protegercomsenha'
      FixedChar = True
      Size = 1
    end
  end
  object IdIcmpClient1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 58
    Left = 432
    Top = 104
  end
  object RESTClient1: TRESTClient
    Params = <>
    HandleRedirects = False
    ConnectTimeout = 0
    ReadTimeout = 0
    SynchronizedEvents = False
    OnHTTPProtocolError = RESTClient1HTTPProtocolError
    Left = 256
    Top = 208
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvReadTimeout]
    Client = RESTClient1
    Params = <>
    ReadTimeout = 0
    SynchronizedEvents = False
    OnHTTPProtocolError = RESTRequest1HTTPProtocolError
    Left = 352
    Top = 208
  end
  object tblretorno: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 435
    Top = 208
  end
  object zLicencas: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    HostName = 'localhost'
    Port = 0
    Database = 'licencas'
    User = 'root'
    Password = 'secnil12345'
    Protocol = 'mysql'
    LibraryLocation = 'D:\GeradorChaves\TLockApplication\Gerador Chave\libmysql.dll'
    Left = 24
    Top = 8
  end
  object zLicencasTable: TZQuery
    Connection = zLicencas
    SQL.Strings = (
      'SELECT * FROM licencas.licencas')
    Params = <>
    Left = 24
    Top = 72
    object zLicencasTableid: TZIntegerField
      FieldName = 'id'
      Required = True
    end
    object zLicencasTableidsistema: TZUnicodeStringField
      FieldName = 'idsistema'
      Size = 64
    end
    object zLicencasTableidinstalacao: TZUnicodeStringField
      FieldName = 'idinstalacao'
      Size = 64
    end
    object zLicencasTabledatainstalacao: TZDateTimeField
      FieldName = 'datainstalacao'
      InvalidDisplayText = 'NADT'
    end
    object zLicencasTableultimasincronizacao: TZDateTimeField
      FieldName = 'ultimasincronizacao'
      InvalidDisplayText = 'NADT'
    end
    object zLicencasTableestadolicenca: TZIntegerField
      FieldName = 'estadolicenca'
      Required = True
    end
    object zLicencasTableversao: TZUnicodeStringField
      FieldName = 'versao'
      Required = True
      Size = 1
    end
    object zLicencasTablegerarchavepor: TZUnicodeStringField
      FieldName = 'gerarchavepor'
      Size = 1
    end
    object zLicencasTablediasavencer: TZIntegerField
      FieldName = 'diasavencer'
    end
    object zLicencasTabledataavencer: TZDateField
      FieldName = 'dataavencer'
      InvalidDisplayText = 'NAD'
    end
    object zLicencasTablechave: TZUnicodeStringField
      FieldName = 'chave'
      Size = 64
    end
    object zLicencasTabledataultimachave: TZDateField
      FieldName = 'dataultimachave'
      InvalidDisplayText = 'NAD'
    end
    object zLicencasTableonoff: TZShortIntField
      FieldName = 'onoff'
    end
    object zLicencasTablenome: TZUnicodeStringField
      FieldName = 'nome'
      Size = 128
    end
    object zLicencasTableemail: TZUnicodeStringField
      FieldName = 'email'
      Size = 128
    end
    object zLicencasTablecpfcnpj: TZUnicodeStringField
      FieldName = 'cpfcnpj'
      Size = 15
    end
    object zLicencasTablecep: TZUnicodeStringField
      FieldName = 'cep'
      Size = 10
    end
    object zLicencasTableendereco: TZUnicodeStringField
      FieldName = 'endereco'
      Size = 128
    end
    object zLicencasTablecidade: TZUnicodeStringField
      FieldName = 'cidade'
      Size = 128
    end
    object zLicencasTableestado: TZUnicodeStringField
      FieldName = 'estado'
      Size = 2
    end
    object zLicencasTablecelular: TZUnicodeStringField
      FieldName = 'celular'
      Size = 15
    end
    object zLicencasTableultimoip: TZUnicodeStringField
      FieldName = 'ultimoip'
      Size = 15
    end
    object zLicencasTablecomando: TZUnicodeStringField
      FieldName = 'comando'
      Size = 32
    end
    object zLicencasTableexecutado: TZUnicodeStringField
      FieldName = 'executado'
      Size = 1
    end
    object zLicencasTablemsgdireta: TZUnicodeStringField
      FieldName = 'msgdireta'
      Size = 250
    end
  end
  object CriaBase: TZQuery
    Connection = zLicencas
    Params = <>
    Left = 184
    Top = 72
  end
  object uniLicencas: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'licencas'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 280
    Top = 16
    EncryptedPassword = '8CFF9AFF9CFF91FF96FF93FFCEFFCDFFCCFFCBFFCAFF'
  end
  object uniqryLicencas: TUniQuery
    Connection = uniLicencas
    Left = 56
    Top = 264
  end
  object uniLicencasTable: TUniTable
    TableName = 'licencas'
    Connection = uniLicencas
    AfterScroll = uniLicencasTableAfterScroll
    Left = 56
    Top = 328
    object uniLicencasTableid: TIntegerField
      FieldName = 'id'
    end
    object uniLicencasTableidsistema: TStringField
      FieldName = 'idsistema'
      Size = 64
    end
    object uniLicencasTableidinstalacao: TStringField
      FieldName = 'idinstalacao'
      Size = 64
    end
    object uniLicencasTabledatainstalacao: TDateTimeField
      FieldName = 'datainstalacao'
    end
    object uniLicencasTableultimasincronizacao: TDateTimeField
      FieldName = 'ultimasincronizacao'
    end
    object uniLicencasTableestadolicenca: TIntegerField
      FieldName = 'estadolicenca'
      Required = True
    end
    object uniLicencasTableversao: TStringField
      FieldName = 'versao'
      Required = True
      FixedChar = True
      Size = 1
    end
    object uniLicencasTablegerarchavepor: TStringField
      FieldName = 'gerarchavepor'
      FixedChar = True
      Size = 1
    end
    object uniLicencasTablediasavencer: TIntegerField
      FieldName = 'diasavencer'
    end
    object uniLicencasTabledataavencer: TDateField
      FieldName = 'dataavencer'
    end
    object uniLicencasTablechave: TStringField
      FieldName = 'chave'
      Size = 64
    end
    object uniLicencasTabledataultimachave: TDateField
      FieldName = 'dataultimachave'
    end
    object uniLicencasTableonoff: TBooleanField
      FieldName = 'onoff'
    end
    object uniLicencasTablenome: TStringField
      FieldName = 'nome'
      Size = 128
    end
    object uniLicencasTableemail: TStringField
      FieldName = 'email'
      Size = 128
    end
    object uniLicencasTablecpfcnpj: TStringField
      FieldName = 'cpfcnpj'
      Size = 15
    end
    object uniLicencasTablecep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object uniLicencasTableendereco: TStringField
      FieldName = 'endereco'
      Size = 128
    end
    object uniLicencasTablecidade: TStringField
      FieldName = 'cidade'
      Size = 128
    end
    object uniLicencasTableestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object uniLicencasTablecelular: TStringField
      FieldName = 'celular'
      Size = 15
    end
    object uniLicencasTableultimoip: TStringField
      FieldName = 'ultimoip'
      Size = 15
    end
    object uniLicencasTablecomando: TStringField
      FieldName = 'comando'
      Size = 32
    end
    object uniLicencasTableexecutado: TStringField
      FieldName = 'executado'
      FixedChar = True
      Size = 1
    end
    object uniLicencasTablemsgdireta: TStringField
      FieldName = 'msgdireta'
      Size = 250
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 288
    Top = 72
  end
end
