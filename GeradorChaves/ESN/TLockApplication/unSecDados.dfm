object dmSecDados: TdmSecDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 136
  Width = 219
  object zlicencas: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = '3.211.227.45'
    Port = 0
    Database = 'licencas'
    User = 'linces'
    Password = 'Secnil12345'
    Protocol = 'mysql'
    Left = 32
    Top = 24
  end
  object zlicencastable: TZQuery
    Connection = zlicencas
    DisableZFields = True
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM licencas')
    Params = <>
    Left = 104
    Top = 24
    object zlicencastableid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object zlicencastableidsistema: TWideStringField
      FieldName = 'idsistema'
      Required = True
      Size = 64
    end
    object zlicencastableidinstalacao: TWideStringField
      FieldName = 'idinstalacao'
      Required = True
      Size = 64
    end
    object zlicencastabledatainstalacao: TDateTimeField
      FieldName = 'datainstalacao'
      Required = True
    end
    object zlicencastableultimasincronizacao: TDateTimeField
      FieldName = 'ultimasincronizacao'
      Required = True
    end
    object zlicencastableestadolicenca: TIntegerField
      FieldName = 'estadolicenca'
      Required = True
    end
    object zlicencastableversao: TWideStringField
      FieldName = 'versao'
      Required = True
      Size = 1
    end
    object zlicencastablegerarchavepor: TWideStringField
      FieldName = 'gerarchavepor'
      Size = 1
    end
    object zlicencastablediasavencer: TIntegerField
      FieldName = 'diasavencer'
    end
    object zlicencastabledataavencer: TDateField
      FieldName = 'dataavencer'
    end
    object zlicencastablechave: TWideStringField
      FieldName = 'chave'
      Size = 64
    end
    object zlicencastabledataultimachave: TDateField
      FieldName = 'dataultimachave'
    end
    object zlicencastableonoff: TShortintField
      FieldName = 'onoff'
    end
    object zlicencastablenome: TWideStringField
      FieldName = 'nome'
      Size = 128
    end
    object zlicencastableemail: TWideStringField
      FieldName = 'email'
      Size = 128
    end
    object zlicencastablecpfcnpj: TWideStringField
      FieldName = 'cpfcnpj'
      Size = 15
    end
    object zlicencastablecep: TWideStringField
      FieldName = 'cep'
      Size = 10
    end
    object zlicencastableendereco: TWideStringField
      FieldName = 'endereco'
      Size = 128
    end
    object zlicencastablecidade: TWideStringField
      FieldName = 'cidade'
      Size = 128
    end
    object zlicencastableestado: TWideStringField
      FieldName = 'estado'
      Size = 2
    end
    object zlicencastablecelular: TWideStringField
      FieldName = 'celular'
      Size = 15
    end
    object zlicencastableultimoip: TWideStringField
      FieldName = 'ultimoip'
      Size = 15
    end
    object zlicencastablecomando: TWideStringField
      FieldName = 'comando'
      Size = 32
    end
    object zlicencastableexecutado: TWideStringField
      FieldName = 'executado'
      Size = 1
    end
  end
end
