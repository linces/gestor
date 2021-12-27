object FrmEstrutura: TFrmEstrutura
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Sincroniza'#231#227'o'
  ClientHeight = 455
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabPage: TPageControl
    Left = 0
    Top = 0
    Width = 852
    Height = 455
    ActivePage = TabLista
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabLista: TTabSheet
      Caption = 'Lista de Tarefas'
      object MemoScript: TMemo
        Left = 0
        Top = 0
        Width = 844
        Height = 425
        Align = alClient
        TabOrder = 0
      end
    end
    object TabScript: TTabSheet
      Caption = 'Script Execute'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 844
        Height = 425
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
    object TbConfig: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 844
        Height = 153
        Align = alTop
        DataSource = dsBancoTable
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOST'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PATH'
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ROLE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PORT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ENVIAR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'RECEBER'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PRIORIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TABELASENVIA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TABELASRECEBE'
            Visible = False
          end>
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 153
        Width = 844
        Height = 272
        Align = alClient
        Caption = ' Cadastros de Bancos '
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 19
          Width = 51
          Height = 15
          Caption = 'Descri'#231#227'o'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 166
          Top = 19
          Width = 25
          Height = 15
          Caption = 'Host'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 322
          Top = 16
          Width = 49
          Height = 15
          Caption = 'Caminho'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 10
          Top = 64
          Width = 40
          Height = 15
          Caption = 'Usu'#225'rio'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 166
          Top = 64
          Width = 32
          Height = 15
          Caption = 'Senha'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 322
          Top = 64
          Width = 23
          Height = 15
          Caption = 'Role'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 428
          Top = 64
          Width = 28
          Height = 15
          Caption = 'Porta'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 484
          Top = 64
          Width = 54
          Height = 15
          Caption = 'Prioridade'
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 10
          Top = 104
          Width = 418
          Height = 15
          Caption = 
            'TABELAS ENVIAR (separa os nomes por virgula ou deixar em branco ' +
            'para todas)'
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 10
          Top = 144
          Width = 425
          Height = 15
          Caption = 
            'TABELAS RECEBER (separa os nomes por virgula ou deixar em branco' +
            ' para todas)'
          FocusControl = DBEdit10
        end
        object DBEdit1: TDBEdit
          Left = 10
          Top = 35
          Width = 150
          Height = 21
          Ctl3D = False
          DataField = 'DESCRICAO'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 166
          Top = 35
          Width = 150
          Height = 21
          Ctl3D = False
          DataField = 'HOST'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 322
          Top = 35
          Width = 343
          Height = 21
          Ctl3D = False
          DataField = 'PATH'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 10
          Top = 80
          Width = 150
          Height = 21
          Ctl3D = False
          DataField = 'USUARIO'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 166
          Top = 80
          Width = 150
          Height = 21
          Ctl3D = False
          DataField = 'SENHA'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 322
          Top = 80
          Width = 100
          Height = 21
          Ctl3D = False
          DataField = 'ROLE'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 428
          Top = 80
          Width = 50
          Height = 21
          Ctl3D = False
          DataField = 'PORT'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object DBCheckBox1: TDBCheckBox
          Left = 561
          Top = 82
          Width = 53
          Height = 17
          Caption = 'Enviar'
          DataField = 'ENVIAR'
          DataSource = dsBancoTable
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 612
          Top = 82
          Width = 58
          Height = 17
          Caption = 'Receber'
          DataField = 'RECEBER'
          DataSource = dsBancoTable
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEdit8: TDBEdit
          Left = 484
          Top = 80
          Width = 71
          Height = 21
          Ctl3D = False
          DataField = 'PRIORIDADE'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 10
          Top = 120
          Width = 655
          Height = 21
          Ctl3D = False
          DataField = 'TABELASENVIA'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBEdit10: TDBEdit
          Left = 10
          Top = 160
          Width = 655
          Height = 21
          Ctl3D = False
          DataField = 'TABELASRECEBE'
          DataSource = dsBancoTable
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBNavigator1: TDBNavigator
          Left = 2
          Top = 231
          Width = 840
          Height = 39
          DataSource = dsBancoTable
          Align = alBottom
          TabOrder = 12
        end
      end
    end
    object Tabelas: TTabSheet
      Caption = 'Tabelas'
      ImageIndex = 3
      object DBGrid2: TDBGrid
        Left = 241
        Top = 0
        Width = 603
        Height = 366
        Align = alClient
        DataSource = dsTabelas
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ORDEM'
            Title.Caption = 'Ordem'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TABELA'
            ReadOnly = True
            Width = 322
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENVIA'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECEBE'
            Width = 51
            Visible = True
          end>
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 241
        Height = 366
        Align = alLeft
        DataSource = dsBancoTable
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Servidor'
            Width = 200
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 366
        Width = 844
        Height = 59
        Align = alBottom
        TabOrder = 2
        object Button1: TButton
          Left = 169
          Top = 1
          Width = 168
          Height = 57
          Align = alLeft
          Caption = 'Clonar Tabelas'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 1
          Top = 1
          Width = 168
          Height = 57
          Align = alLeft
          Caption = 'Atualiza Tabelas'
          TabOrder = 1
          OnClick = Button2Click
        end
      end
    end
  end
  object qryBuscaTabelas: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT RDB$RELATION_CONSTRAINTS.RDB$RELATION_NAME AS TABELAS,'
      'RDB$INDEX_SEGMENTS.RDB$FIELD_NAME AS CAMPO'
      'FROM RDB$RELATION_CONSTRAINTS,'
      'RDB$INDICES,'
      'RDB$INDEX_SEGMENTS'
      
        'WHERE RDB$RELATION_CONSTRAINTS.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KE' +
        'Y'#39
      
        'AND RDB$RELATION_CONSTRAINTS.RDB$INDEX_NAME = RDB$INDICES.RDB$IN' +
        'DEX_NAME'
      
        'AND RDB$INDEX_SEGMENTS.RDB$INDEX_NAME = RDB$INDICES.RDB$INDEX_NA' +
        'ME'
      'AND'
      'RDB$INDEX_SEGMENTS.RDB$FIELD_POSITION=0'
      'ORDER BY 1'
      '')
    Left = 144
    Top = 104
    object qryBuscaTabelasTABELAS: TWideStringField
      FieldName = 'TABELAS'
      Origin = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object qryBuscaTabelasCAMPO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAMPO'
      Origin = 'RDB$FIELD_NAME'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 31
    end
  end
  object qryExecute: TFDScript
    SQLScripts = <>
    Connection = Conexao
    ScriptOptions.IgnoreError = True
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evAutoClose]
    FetchOptions.AutoClose = False
    Left = 142
    Top = 47
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 48
    object CriarEstruturadoReplicadorCliente1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object CriarEstruturadoReplicadorCliente2: TMenuItem
        Caption = 'Criar Estrutura'
        OnClick = CriarEstruturadoReplicadorCliente2Click
      end
      object RemoverEstruturaCliente1: TMenuItem
        Caption = 'Remover Estrutura'
        OnClick = RemoverEstruturaCliente1Click
      end
      object LimpaCacheReplicao1: TMenuItem
        Caption = 'Limpa Cache Replica'#231#227'o'
        OnClick = LimpaCacheReplicao1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
  end
  object qryEmpresa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select fk_filial from empresa')
    Left = 360
    Top = 48
    object qryEmpresaFK_FILIAL: TIntegerField
      FieldName = 'FK_FILIAL'
      Origin = 'FK_FILIAL'
    end
  end
  object qryTabelas: TFDQuery
    BeforePost = qryTabelasBeforePost
    AfterPost = qryTabelasAfterPost
    AfterDelete = qryTabelasAfterDelete
    Connection = Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from tabela'
      'where'
      'fk_servidor=:id'
      'order by ordem')
    Left = 368
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTabelasCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabelasTABELA: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Size = 50
    end
    object qryTabelasENVIA: TStringField
      DisplayLabel = 'Envia'
      FieldName = 'ENVIA'
      Origin = 'ENVIA'
      Size = 1
    end
    object qryTabelasRECEBE: TStringField
      DisplayLabel = 'Recebe'
      FieldName = 'RECEBE'
      Origin = 'RECEBE'
      Size = 1
    end
    object qryTabelasORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
    object qryTabelasFK_SERVIDOR: TIntegerField
      FieldName = 'FK_SERVIDOR'
      Origin = 'FK_SERVIDOR'
    end
  end
  object dsTabelas: TDataSource
    DataSet = qryTabelas
    Left = 368
    Top = 168
  end
  object FDZabuuReplicator1: TFDZabuuReplicator
    Host = 'localhost'
    Path = 'D:\ProgramasNovos\Replicador\Win32\Release\REPLICADOR.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    TypeDB = 'FB'
    Log = FDZabuuReplicator1Log
    ApplicationName = 'Replicador.exe'
    Limit = 50
    Factor = 1
    Port = '3555'
    Sequencer = False
    InjectBankID = True
    Left = 256
    Top = 56
  end
  object dsBancoTable: TDataSource
    DataSet = BancosTable
    OnDataChange = dsBancoTableDataChange
    Left = 244
    Top = 112
  end
  object BancosTable: TFDTable
    IndexFieldNames = 'ID'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'BANCOS'
    TableName = 'BANCOS'
    Left = 140
    Top = 153
    object BancosTableID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object BancosTableDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'Descri'#231#227'o'
      Size = 60
    end
    object BancosTableHOST: TStringField
      DisplayLabel = 'Host'
      FieldName = 'HOST'
      Origin = 'Host'
      Size = 60
    end
    object BancosTablePATH: TStringField
      DisplayLabel = 'Caminho'
      FieldName = 'PATH'
      Origin = 'PATH'
      Size = 255
    end
    object BancosTableUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      LookupCache = True
      Origin = 'USUARIO'
      Size = 60
    end
    object BancosTableSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 60
    end
    object BancosTableROLE: TStringField
      DisplayLabel = 'Role'
      FieldName = 'ROLE'
      Origin = '"ROLE"'
      Size = 60
    end
    object BancosTablePORT: TIntegerField
      DisplayLabel = 'Porta'
      FieldName = 'PORT'
      Origin = 'PORT'
    end
    object BancosTableENVIAR: TIntegerField
      DisplayLabel = 'Enviar'
      FieldName = 'ENVIAR'
      Origin = 'ENVIAR'
    end
    object BancosTableRECEBER: TIntegerField
      DisplayLabel = 'Receber'
      FieldName = 'RECEBER'
      Origin = 'RECEBER'
    end
    object BancosTablePRIORIDADE: TSmallintField
      DisplayLabel = 'Prioridade'
      FieldName = 'PRIORIDADE'
      Origin = 'PRIORIDADE'
    end
    object BancosTableTABELASENVIA: TStringField
      DisplayLabel = 'Envia'
      FieldName = 'TABELASENVIA'
      Origin = 'TABELASENVIA'
      Size = 4096
    end
    object BancosTableTABELASRECEBE: TStringField
      DisplayLabel = 'Recebe'
      FieldName = 'TABELASRECEBE'
      Origin = 'TABELASRECEBE'
      Size = 4096
    end
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Protocol=TCPIP'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Left = 32
    Top = 146
  end
  object qryAux: TFDQuery
    Connection = Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from tabela'
      'where'
      'fk_servidor=:id'
      'order by ordem')
    Left = 448
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryAuxCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAuxTABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Size = 50
    end
    object qryAuxENVIA: TStringField
      FieldName = 'ENVIA'
      Origin = 'ENVIA'
      Size = 1
    end
    object qryAuxRECEBE: TStringField
      FieldName = 'RECEBE'
      Origin = 'RECEBE'
      Size = 1
    end
    object qryAuxORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
    object qryAuxFK_SERVIDOR: TIntegerField
      FieldName = 'FK_SERVIDOR'
      Origin = 'FK_SERVIDOR'
    end
  end
  object qryNumerador: TFDQuery
    Connection = Conexao
    Left = 32
    Top = 96
  end
  object FBDriver: TFDPhysFBDriverLink
    Left = 256
    Top = 176
  end
end
