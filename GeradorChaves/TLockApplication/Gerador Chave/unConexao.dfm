object frmConexao: TfrmConexao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conex'#227'o'
  ClientHeight = 277
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 8
    Width = 214
    Height = 19
    Caption = 'Configurar Conex'#227'o de Dados'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 69
    Top = 66
    Width = 31
    Height = 13
    Caption = 'server'
  end
  object Label3: TLabel
    Left = 69
    Top = 93
    Width = 45
    Height = 13
    Caption = 'database'
  end
  object Label4: TLabel
    Left = 69
    Top = 120
    Width = 21
    Height = 13
    Caption = 'user'
  end
  object Label5: TLabel
    Left = 69
    Top = 147
    Width = 46
    Height = 13
    Caption = 'password'
  end
  object Button1: TButton
    Left = 72
    Top = 224
    Width = 209
    Height = 25
    Caption = 'Criar Base e Salvar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 133
    Top = 58
    Width = 145
    Height = 21
    DataField = 'server'
    DataSource = DataSource1
    TabOrder = 0
    OnEnter = DBEdit1Enter
  end
  object DBEdit2: TDBEdit
    Left = 133
    Top = 85
    Width = 145
    Height = 21
    DataField = 'database'
    DataSource = DataSource1
    TabOrder = 1
    OnEnter = DBEdit2Enter
  end
  object DBEdit3: TDBEdit
    Left = 133
    Top = 112
    Width = 145
    Height = 21
    DataField = 'user'
    DataSource = DataSource1
    TabOrder = 2
    OnEnter = DBEdit3Enter
  end
  object DBEdit4: TDBEdit
    Left = 133
    Top = 139
    Width = 145
    Height = 21
    DataField = 'password'
    DataSource = DataSource1
    TabOrder = 3
    OnEnter = DBEdit4Enter
  end
  object ConfigsConnection: TFDConnection
    Params.Strings = (
      'Database='
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 264
    Top = 91
  end
  object FDTable1: TFDTable
    BeforePost = FDTable1BeforePost
    CachedUpdates = True
    Connection = ConfigsConnection
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.UpdateTableName = 'configs'
    TableName = 'configs'
    Left = 256
    Top = 144
    object FDTable1server: TStringField
      FieldName = 'server'
      Origin = 'server'
      Required = True
      Size = 128
    end
    object FDTable1database: TStringField
      FieldName = 'database'
      Origin = '"database"'
      Size = 128
    end
    object FDTable1user: TStringField
      FieldName = 'user'
      Origin = 'user'
      Size = 128
    end
    object FDTable1password: TStringField
      FieldName = 'password'
      Origin = 'password'
      Size = 128
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 112
    Top = 184
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=3.211.227.45'
      'User_Name=linces'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 168
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 184
    Top = 176
  end
  object FDScript1: TFDScript
    SQLScriptFileName = 
      'F:\00 Projetos\02 Delphi\endsisframework\Repositorio\Componentes' +
      '\10.4\GeradorChaves\TLockApplication\Gerador Chave\licencas.sql'
    SQLScripts = <>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    Left = 16
    Top = 40
  end
  object CriarBase: TFDScript
    SQLScriptFileName = 
      'F:\00 Projetos\02 Delphi\endsisframework\Repositorio\Componentes' +
      '\10.4\GeradorChaves\TLockApplication\Gerador Chave\licencas.sql'
    SQLScripts = <>
    Connection = FDConnection1
    ScriptOptions.BreakOnError = True
    ScriptOptions.Verify = True
    ScriptOptions.RaisePLSQLErrors = True
    Params = <>
    Macros = <>
    FormatOptions.AssignedValues = [fvADOCompatibility]
    FormatOptions.ADOCompatibility = True
    FetchOptions.AssignedValues = [evLiveWindowFastFirst, evDetailServerCascade]
    FetchOptions.LiveWindowFastFirst = True
    FetchOptions.DetailServerCascade = True
    ResourceOptions.AssignedValues = [rvPersistent]
    Left = 128
    Top = 16
  end
  object CriabaseConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=criabase')
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    LoginPrompt = False
    Left = 302
    Top = 16
  end
end
