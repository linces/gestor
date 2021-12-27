object frmIBPT: TfrmIBPT
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'IBPT'
  ClientHeight = 545
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 832
    Height = 91
    Align = alTop
    TabOrder = 0
    DesignSize = (
      832
      91)
    object Label1: TLabel
      Left = 12
      Top = 11
      Width = 106
      Height = 13
      Caption = 'Caminho do Arquivo'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lVersao: TLabel
      Left = 12
      Top = 60
      Width = 37
      Height = 13
      Caption = 'Vers'#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 97
      Top = 60
      Width = 111
      Height = 13
      Caption = 'Quantidade de itens: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbVigencia: TLabel
      Left = 274
      Top = 60
      Width = 50
      Height = 13
      Caption = 'Vig'#234'ncia: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblChave: TLabel
      Left = 459
      Top = 60
      Width = 37
      Height = 13
      Caption = 'Chave: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblFonte: TLabel
      Left = 594
      Top = 60
      Width = 33
      Height = 13
      Caption = 'Fonte:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edArquivo: TEdit
      Left = 12
      Top = 27
      Width = 669
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object btAbrir: TBitBtn
      Left = 722
      Top = 23
      Width = 99
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Atualizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00000000FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00001808FF086531FF000400FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00001808FF39A66BFF6BEBB5FF39925AFF000800FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00001800FF31A263FF39E39CFF18DB8CFF52E7ADFF398E5AFF000C
        00FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00001C00FF219E52FF29D78CFF18CF84FF18D384FF18D784FF42DF9CFF318A
        4AFF000C00FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00001C
        00FF109242FF18C773FF18C36BFF18C773FF18C77BFF18CB7BFF18CF7BFF29D7
        8CFF218642FF001000FFFF00FF00FF00FF00FF00FF00FF00FF00002400FF108E
        39FF18BA63FF18B663FF31C373FF42CB84FF42D38CFF4ACF8CFF39CB84FF29C7
        7BFF21CB7BFF108A39FF001800FFFF00FF00FF00FF00FF00FF00087129FF21B6
        5AFF52BE84FF73CF9CFF7BD7A5FF42BE7BFF107D42FF52CF94FF7BDBADFF73D7
        A5FF6BD39CFF42CB84FF108A31FF002000FFFF00FF00FF00FF00003010FF4AB2
        6BFF9CDBB5FF94DBB5FF42BA73FF003010FFFF00FF00084521FF5ACF8CFF9CDF
        BDFF94DBB5FF94DBB5FF5ACB8CFF108A31FF002800FFFF00FF00FF00FF000020
        08FF52AE73FF42AA6BFF001C08FFFF00FF00FF00FF00FF00FF00003010FF5ABE
        84FFB5E7CEFFB5E3C6FFB5E3C6FF73CF9CFF108629FF002C00FFFF00FF00FF00
        FF00001800FF001400FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF000020
        08FF52AE73FFD6F3DEFFCEEBDEFFDEEFE7FF94DBADFF085D18FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00001400FF529E63FFEFFFF7FFDEF7E7FF42965AFF001000FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000FF428E52FF39864AFF000000FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000C00FF000C00FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      TabOrder = 1
      OnClick = btAbrirClick
    end
    object Button1: TButton
      Left = 682
      Top = 24
      Width = 32
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 91
    Width = 832
    Height = 454
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Dados importados'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 824
        Height = 426
        Align = alClient
        DataSource = dsIBPT
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'NCM'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 351
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NACIONALFEDERAL'
            Title.Caption = 'Nacional'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTADOSFEDERAL'
            Title.Caption = 'Importado'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADUAL'
            Title.Caption = 'Estadual'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MUNICIPAL'
            Title.Caption = 'Municipal'
            Width = 62
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Erros'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 824
        Height = 426
        Align = alClient
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.csv'
    Filter = 'Tabela IBPTax|*.csv'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Abrir arquivo'
    Left = 613
    Top = 160
  end
  object dsIBPT: TDataSource
    DataSet = qryIBPT
    Left = 449
    Top = 170
  end
  object SaveDialog1: TSaveDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 697
    Top = 135
  end
  object ACBrIBPTax1: TACBrIBPTax
    ProxyPort = '8080'
    OnErroImportacao = ACBrIBPTax1ErroImportacao
    Left = 770
    Top = 150
  end
  object qryIBPT: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from ibpt'
      'order by 1'
      '')
    Left = 408
    Top = 272
    object qryIBPTCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qryIBPTEX: TStringField
      FieldName = 'EX'
      Origin = 'EX'
      Size = 6
    end
    object qryIBPTTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 10
    end
    object qryIBPTDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
    object qryIBPTNACIONALFEDERAL: TStringField
      FieldName = 'NACIONALFEDERAL'
      Origin = 'NACIONALFEDERAL'
      Size = 18
    end
    object qryIBPTIMPORTADOSFEDERAL: TStringField
      FieldName = 'IMPORTADOSFEDERAL'
      Origin = 'IMPORTADOSFEDERAL'
      Size = 19
    end
    object qryIBPTESTADUAL: TStringField
      FieldName = 'ESTADUAL'
      Origin = 'ESTADUAL'
      Size = 11
    end
    object qryIBPTMUNICIPAL: TStringField
      FieldName = 'MUNICIPAL'
      Origin = 'MUNICIPAL'
      Size = 12
    end
    object qryIBPTVIGENCIAINICIO: TStringField
      FieldName = 'VIGENCIAINICIO'
      Origin = 'VIGENCIAINICIO'
      Size = 15
    end
    object qryIBPTVIGENCIAFIM: TStringField
      FieldName = 'VIGENCIAFIM'
      Origin = 'VIGENCIAFIM'
      Size = 13
    end
    object qryIBPTCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 12
    end
    object qryIBPTVERSAO: TStringField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      Size = 11
    end
    object qryIBPTFONTE: TStringField
      FieldName = 'FONTE'
      Origin = 'FONTE'
      Size = 30
    end
  end
  object qryUpdate: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'delete from  ibpt')
    Left = 336
    Top = 272
  end
  object qryPesquisa: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select codigo from ibpt'
      'where'
      'codigo=:codigo')
    Left = 240
    Top = 280
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
end
