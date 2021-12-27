object frmTerminais: TfrmTerminais
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Terminais'
  ClientHeight = 565
  ClientWidth = 711
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Semilight'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 214
    Height = 481
    Align = alLeft
    DataSource = dsTerminais
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI Semilight'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 173
        Visible = True
      end>
  end
  object PageControl3: TPageControl
    Left = 214
    Top = 0
    Width = 497
    Height = 481
    ActivePage = TabSheet11
    Align = alClient
    TabOrder = 1
    object TabSheet11: TTabSheet
      Caption = 'Configura'#231#245'es'
      object Label24: TLabel
        Left = 313
        Top = 4
        Width = 41
        Height = 17
        Caption = 'N'#186' Vias'
        FocusControl = DBEdit6
      end
      object Label13: TLabel
        Left = 3
        Top = 41
        Width = 124
        Height = 17
        Caption = 'Modelo da Impressora'
      end
      object Label15: TLabel
        Left = 3
        Top = 78
        Width = 93
        Height = 17
        Caption = 'Caminho Padr'#227'o'
      end
      object Label1: TLabel
        Left = 3
        Top = 202
        Width = 61
        Height = 17
        Caption = 'Velocidade'
      end
      object Label23: TLabel
        Left = 248
        Top = 4
        Width = 50
        Height = 17
        Caption = 'N'#186' Inicial'
      end
      object Label27: TLabel
        Left = 375
        Top = 4
        Width = 28
        Height = 17
        Caption = 'S'#233'rie'
        FocusControl = DBEdit6
      end
      object Label135: TLabel
        Left = 107
        Top = 202
        Width = 81
        Height = 17
        Caption = 'P'#225'gina C'#243'digo'
      end
      object Label136: TLabel
        Left = 213
        Top = 285
        Width = 44
        Height = 17
        Caption = 'Colunas'
      end
      object Label141: TLabel
        Left = 3
        Top = 283
        Width = 84
        Height = 17
        Caption = 'Largura Bobina'
      end
      object Label142: TLabel
        Left = 3
        Top = 242
        Width = 87
        Height = 17
        Caption = 'Marg. Esquerda'
      end
      object Label143: TLabel
        Left = 111
        Top = 242
        Width = 73
        Height = 17
        Caption = 'Marg. Direita'
      end
      object Label144: TLabel
        Left = 217
        Top = 242
        Width = 75
        Height = 17
        Caption = 'Marg. Inferior'
      end
      object Label145: TLabel
        Left = 322
        Top = 242
        Width = 82
        Height = 17
        Caption = 'Marg. Superior'
      end
      object Label146: TLabel
        Left = 107
        Top = 283
        Width = 87
        Height = 17
        Caption = 'Tamanho Fonte'
      end
      object Label3: TLabel
        Left = 223
        Top = 202
        Width = 37
        Height = 17
        Caption = 'Op'#231#227'o'
      end
      object Label4: TLabel
        Left = 3
        Top = 330
        Width = 113
        Height = 17
        Caption = 'Linhas Entre Cupons'
      end
      object Label5: TLabel
        Left = 143
        Top = 329
        Width = 111
        Height = 17
        Caption = 'Espa'#231'o Entre Linhas'
      end
      object Label17: TLabel
        Left = 2
        Top = 119
        Width = 99
        Height = 17
        Caption = 'Caminho Cozinha'
      end
      object Label21: TLabel
        Left = 3
        Top = 160
        Width = 72
        Height = 17
        Caption = 'Caminho Bar'
      end
      object DBEdit6: TDBEdit
        Left = 313
        Top = 22
        Width = 56
        Height = 21
        Ctl3D = False
        DataField = 'NVIAS'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit17: TDBEdit
        Left = 375
        Top = 22
        Width = 35
        Height = 21
        Ctl3D = False
        DataField = 'SERIE'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit18: TDBEdit
        Left = 248
        Top = 22
        Width = 61
        Height = 21
        Ctl3D = False
        DataField = 'NUMERACAO_INICIAL'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object cbModeloImpressora: TDBComboBox
        Left = 3
        Top = 57
        Width = 462
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'MODELO'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'TEXTO'
          'ELGIN'
          'EPSON'
          'BEMATECH'
          'DARUMA'
          'VOX'
          'DIEBOLD'
          'EPSONP2'
          'POSSTAR'
          'GPRINTER'
          'JIANG')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object cbVelocidade: TDBComboBox
        Left = 3
        Top = 218
        Width = 91
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'VELOCIDADE'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '75'
          '110'
          '134'
          '150'
          '300'
          '600'
          '1200'
          '1800'
          '2400'
          '4800'
          '7200'
          '9600'
          '14400'
          '19200'
          '38400'
          '57600'
          '115200'
          '128000')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBCheckBox3: TDBCheckBox
        Left = 3
        Top = 374
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Usa Gaveta'
        DataField = 'USAGAVETA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 3
        Top = 426
        Width = 239
        Height = 17
        TabStop = False
        Caption = 'Perguntar se quer Imprimir -PDV'
        DataField = 'IMPRIME'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 248
        Top = 408
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'PDV'
        DataField = 'PDV'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbPortaImpressora: TDBComboBox
        Left = 3
        Top = 95
        Width = 462
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'PORTA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '75'
          '110'
          '134'
          '150'
          '300'
          '600'
          '1200'
          '1800'
          '2400'
          '4800'
          '7200'
          '9600'
          '14400'
          '19200'
          '38400'
          '57600'
          '115200'
          '128000')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object cbPaginaCodigo: TDBComboBox
        Left = 107
        Top = 218
        Width = 110
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'PAGINA_CODIGO'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit41: TDBEdit
        Left = 3
        Top = 302
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'LARGURA_BOBINA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
      end
      object DBEdit42: TDBEdit
        Left = 3
        Top = 259
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'MARGEM_ESQUERDA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
      end
      object DBEdit43: TDBEdit
        Left = 111
        Top = 259
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'MARGEM_DIREITA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 14
      end
      object DBEdit44: TDBEdit
        Left = 217
        Top = 259
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'MARGEM_SUPERIOR'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
      end
      object DBEdit45: TDBEdit
        Left = 322
        Top = 259
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'MARGEM_SUPERIOR'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
      end
      object DBEdit46: TDBEdit
        Left = 107
        Top = 302
        Width = 98
        Height = 21
        Ctl3D = False
        DataField = 'TAMANHO_FONTE'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 18
      end
      object DBComboBoxEh3: TDBComboBoxEh
        Left = 226
        Top = 218
        Width = 183
        Height = 23
        DataField = 'FLAG'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          ''
          'OF'
          'ON'
          'PE'
          'FI')
        KeyItems.Strings = (
          ''
          'O'
          'N'
          'P'
          'F')
        ParentFont = False
        TabOrder = 9
        Visible = True
        OnKeyDown = DBComboBoxEh3KeyDown
      end
      object DBCheckBox1: TDBCheckBox
        Left = 372
        Top = 370
        Width = 81
        Height = 17
        TabStop = False
        Caption = 'Exibe F3'
        DataField = 'EXIBE_F3'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 23
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox5: TDBCheckBox
        Left = 372
        Top = 387
        Width = 81
        Height = 17
        TabStop = False
        Caption = 'Exibe F4'
        DataField = 'EXIBE_F4'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 372
        Top = 403
        Width = 78
        Height = 17
        TabStop = False
        Caption = 'Exibe F5'
        DataField = 'EXIBE_F5'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox7: TDBCheckBox
        Left = 372
        Top = 421
        Width = 78
        Height = 17
        TabStop = False
        Caption = 'Exibe F6'
        DataField = 'EXIBE_F6'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 347
        Width = 134
        Height = 21
        Ctl3D = False
        DataField = 'LINHAS_ENTRE_CUPOM'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
      end
      object DBEdit2: TDBEdit
        Left = 143
        Top = 347
        Width = 122
        Height = 21
        Ctl3D = False
        DataField = 'ESPACO_ENTRE_LINHAS'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 21
      end
      object DBCheckBox9: TDBCheckBox
        Left = 3
        Top = 409
        Width = 202
        Height = 17
        TabStop = False
        Caption = 'Imprimir QrCOde/Logo Lateral'
        DataField = 'QRCODE_LATERAL'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 27
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBEdit3: TDBEdit
        Left = 211
        Top = 302
        Width = 54
        Height = 21
        Ctl3D = False
        DataField = 'COLUNAS'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 19
      end
      object GroupBox1: TGroupBox
        Left = 271
        Top = 286
        Width = 194
        Height = 78
        Caption = 'Logo Marca'
        TabOrder = 22
        object Label6: TLabel
          Left = 8
          Top = 20
          Width = 19
          Height = 17
          Caption = 'KC1'
        end
        object Label7: TLabel
          Left = 53
          Top = 20
          Width = 21
          Height = 17
          Caption = 'KC2'
        end
        object Label8: TLabel
          Left = 143
          Top = 20
          Width = 39
          Height = 17
          Caption = 'Fator Y'
        end
        object Label9: TLabel
          Left = 98
          Top = 20
          Width = 39
          Height = 17
          Caption = 'Fator X'
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 37
          Width = 42
          Height = 21
          Ctl3D = False
          DataField = 'L1'
          DataSource = dsTerminais
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 53
          Top = 37
          Width = 42
          Height = 21
          Ctl3D = False
          DataField = 'L2'
          DataSource = dsTerminais
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit7: TDBEdit
          Left = 98
          Top = 37
          Width = 42
          Height = 21
          Ctl3D = False
          DataField = 'L3'
          DataSource = dsTerminais
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 143
          Top = 37
          Width = 42
          Height = 21
          Ctl3D = False
          DataField = 'L4'
          DataSource = dsTerminais
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 3
        Top = 4
        Width = 239
        Height = 39
        Caption = 'Tip de Impressora'
        Columns = 2
        DataField = 'TIPOIMPRESSORA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          'Papel A4'
          'Bobina')
        ParentFont = False
        TabOrder = 28
        Values.Strings = (
          '1'
          '2')
      end
      object DBCheckBox10: TDBCheckBox
        Left = 248
        Top = 374
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Delivery'
        DataField = 'DELIVERY'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 29
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox11: TDBCheckBox
        Left = 248
        Top = 391
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Restaurante'
        DataField = 'RESTAURANTE'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 30
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox12: TDBCheckBox
        Left = 3
        Top = 391
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Caixa'
        DataField = 'EH_CAIXA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 31
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbCozinha: TDBComboBox
        Left = 3
        Top = 136
        Width = 462
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'CAMINHO_COZINHA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '75'
          '110'
          '134'
          '150'
          '300'
          '600'
          '1200'
          '1800'
          '2400'
          '4800'
          '7200'
          '9600'
          '14400'
          '19200'
          '38400'
          '57600'
          '115200'
          '128000')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object cbBar: TDBComboBox
        Left = 3
        Top = 178
        Width = 462
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'CAMINHO_BAR'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '75'
          '110'
          '134'
          '150'
          '300'
          '600'
          '1200'
          '1800'
          '2400'
          '4800'
          '7200'
          '9600'
          '14400'
          '19200'
          '38400'
          '57600'
          '115200'
          '128000')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Balan'#231'as'
      ImageIndex = 1
      object Label28: TLabel
        Left = 27
        Top = 7
        Width = 44
        Height = 17
        Caption = 'Balan'#231'a'
      end
      object Label84: TLabel
        Left = 27
        Top = 48
        Width = 29
        Height = 17
        Caption = 'Porta'
      end
      object Label85: TLabel
        Left = 27
        Top = 88
        Width = 61
        Height = 17
        Caption = 'Velocidade'
      end
      object Label86: TLabel
        Left = 27
        Top = 208
        Width = 48
        Height = 17
        Caption = 'Stop Bits'
      end
      object Label87: TLabel
        Left = 27
        Top = 169
        Width = 49
        Height = 17
        Caption = 'Paridade'
      end
      object Label88: TLabel
        Left = 27
        Top = 129
        Width = 50
        Height = 17
        Caption = 'Data Bits'
      end
      object Label89: TLabel
        Left = 27
        Top = 250
        Width = 72
        Height = 17
        Caption = 'Handshaking'
      end
      object DBComboBoxEh28: TDBComboBoxEh
        Left = 27
        Top = 267
        Width = 187
        Height = 23
        DataField = 'BALANCA_HANDSHAKING'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          'Nenhum'
          'XON/XOFF'
          'RTS/CTS'
          'DTR/DSR')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        ParentFont = False
        TabOrder = 6
        Visible = True
      end
      object DBComboBoxEh27: TDBComboBoxEh
        Left = 27
        Top = 227
        Width = 187
        Height = 23
        DataField = 'BALANCA_STOPBITS'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          's1'
          's1,5'
          's2')
        KeyItems.Strings = (
          '0'
          '1'
          '2')
        ParentFont = False
        TabOrder = 5
        Visible = True
      end
      object DBComboBoxEh26: TDBComboBoxEh
        Left = 27
        Top = 186
        Width = 187
        Height = 23
        DataField = 'BALANCA_PARIDADE'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          'none'
          'odd'
          'even'
          'mark'
          'space')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
      object DBComboBoxEh25: TDBComboBoxEh
        Left = 27
        Top = 146
        Width = 187
        Height = 23
        DataField = 'BALANCA_DATABITS'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          '5'
          '6'
          '7'
          '8')
        KeyItems.Strings = (
          '5'
          '6'
          '7'
          '8')
        ParentFont = False
        TabOrder = 3
        Visible = True
      end
      object DBComboBox5: TDBComboBox
        Left = 27
        Top = 65
        Width = 187
        Height = 23
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'BALANCA_PORTA'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9'
          'COM10')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object cbBalanca: TDBComboBoxEh
        Left = 27
        Top = 25
        Width = 187
        Height = 23
        DataField = 'BALANCA_MARCA'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          'balNenhum'
          'balFilizola'
          'balToledo'
          'balToledo2090'
          'balToledo2180'
          'balUrano'
          'balLucasTec'
          'balMagna'
          'balDigitron'
          'balMagellan'
          'balUranoPOP'
          'balLider'
          'balRinnert'
          'balMuller'
          'balSaturno'
          'balAFTS'
          'balGenerica'
          'balLibratek'
          'balMicheletti'
          'balAlfa'
          'balToledo9091_8530_8540'
          'balWeightechWT1000'
          'balMarelCG62XL'
          'balWeightechWT3000_ABS'
          'balToledo2090N'
          'balToledoBCS21'
          'balPrecision'
          'balDigitron_UL'
          'balLibratekWT3000IR')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28')
        ParentFont = False
        TabOrder = 0
        Visible = True
      end
      object DBComboBox4: TDBComboBox
        Left = 27
        Top = 105
        Width = 187
        Height = 23
        BevelKind = bkFlat
        DataField = 'BALANCA_VELOCIDADE'
        DataSource = dsTerminais
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        Items.Strings = (
          '110'
          '300'
          '600'
          '1200'
          '2400'
          '4800'
          '9600'
          '14400'
          '19200'
          '38400'
          '56000'
          '57600')
        ParentFont = False
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'SAT'
      ImageIndex = 2
      object Label2: TLabel
        Left = 24
        Top = 18
        Width = 24
        Height = 17
        Caption = 'Tipo'
      end
      object Label20: TLabel
        Left = 24
        Top = 78
        Width = 118
        Height = 17
        Caption = 'Caminho da DLL SAT'
        FocusControl = DBEdit14
      end
      object btnSat: TSpeedButton
        Left = 398
        Top = 95
        Width = 23
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = btnSatClick
      end
      object cbSatTipoDLL: TDBComboBox
        Left = 24
        Top = 35
        Width = 247
        Height = 25
        DataField = 'TIPO_SAT_DLL'
        DataSource = dsTerminais
        TabOrder = 0
      end
      object DBEdit14: TDBEdit
        Left = 24
        Top = 95
        Width = 368
        Height = 25
        DataField = 'CAMINHO_SAT_DLL'
        DataSource = dsTerminais
        TabOrder = 1
      end
      object DBCheckBox8: TDBCheckBox
        Left = 24
        Top = 126
        Width = 97
        Height = 17
        Caption = 'Emulador'
        DataField = 'MODELO_SAT_DLL'
        DataSource = dsTerminais
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TEF'
      ImageIndex = 3
      object Label39: TLabel
        Left = 3
        Top = 8
        Width = 92
        Height = 17
        Caption = 'Gerenciador TEF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 3
        Top = 227
        Width = 79
        Height = 17
        Caption = 'Troco M'#225'ximo'
        Color = clBtnFace
        ParentColor = False
      end
      object Label10: TLabel
        Left = 101
        Top = 227
        Width = 69
        Height = 17
        Caption = 'M'#225'x.Cart'#245'es'
        Color = clBtnFace
        ParentColor = False
      end
      object Label18: TLabel
        Left = 339
        Top = 99
        Width = 44
        Height = 17
        Caption = 'Registro'
        Color = clBtnFace
        ParentColor = False
      end
      object Label16: TLabel
        Left = 3
        Top = 139
        Width = 92
        Height = 17
        Caption = 'Nome Aplica'#231#227'o'
        Color = clBtnFace
        ParentColor = False
      end
      object Label19: TLabel
        Left = 339
        Top = 139
        Width = 37
        Height = 17
        Caption = 'Vers'#227'o'
        Color = clBtnFace
        ParentColor = False
      end
      object Label14: TLabel
        Left = 3
        Top = 99
        Width = 71
        Height = 17
        Caption = 'Raz'#227'o Social'
        Color = clBtnFace
        ParentColor = False
      end
      object Label11: TLabel
        Left = 3
        Top = 56
        Width = 45
        Height = 17
        Alignment = taRightJustify
        Caption = 'Arq.Log:'
        Color = clBtnFace
        ParentColor = False
      end
      object SbArqLog: TSpeedButton
        Left = 411
        Top = 73
        Width = 24
        Height = 22
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SbArqLogClick
      end
      object cbxGP: TDBComboBoxEh
        Left = 3
        Top = 27
        Width = 432
        Height = 25
        DataField = 'TEF_GERENCIADOR'
        DataSource = dsTerminais
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          'Nenhum '
          'TefDial '
          'TefDisc'
          'HiperTef'
          'CliSiTef'
          'TefGpu'
          'VeSPague'
          'Banese'
          'TefAuttar'
          'GoodCard'
          'FoxWin'
          'CliDTEF'
          'Petrocard'
          'CrediShop'
          'TicketCar'
          'ConvCard'
          'Cappta'
          'PayGo')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17')
        TabOrder = 0
        Visible = True
      end
      object edLog: TDBEdit
        Left = 2
        Top = 74
        Width = 403
        Height = 25
        DataField = 'TEF_LOG'
        DataSource = dsTerminais
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 2
        Top = 115
        Width = 331
        Height = 25
        DataField = 'TEF_SOFT_HOUSE'
        DataSource = dsTerminais
        TabOrder = 2
      end
      object DBEdit11: TDBEdit
        Left = 339
        Top = 115
        Width = 96
        Height = 25
        DataField = 'TEF_REGISTRO'
        DataSource = dsTerminais
        TabOrder = 3
      end
      object DBEdit12: TDBEdit
        Left = 2
        Top = 156
        Width = 331
        Height = 25
        DataField = 'TEF_APLICACAO'
        DataSource = dsTerminais
        TabOrder = 4
      end
      object DBEdit13: TDBEdit
        Left = 339
        Top = 156
        Width = 96
        Height = 25
        DataField = 'TEF_VERSAO'
        DataSource = dsTerminais
        TabOrder = 5
      end
      object DBEdit15: TDBEdit
        Left = 2
        Top = 244
        Width = 92
        Height = 25
        DataField = 'TEF_TROCO_MAXIMO'
        DataSource = dsTerminais
        TabOrder = 8
      end
      object DBEdit16: TDBEdit
        Left = 100
        Top = 244
        Width = 92
        Height = 25
        DataField = 'TEF_MAX_CARTOES'
        DataSource = dsTerminais
        TabOrder = 9
      end
      object cbIMprimirViaReduzida: TDBCheckBox
        Left = 2
        Top = 184
        Width = 169
        Height = 17
        Caption = 'Imprimir Via Reduzida'
        DataField = 'TEF_VIA_REDUZIDA'
        DataSource = dsTerminais
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbMultiplosCartoes: TDBCheckBox
        Left = 2
        Top = 207
        Width = 169
        Height = 17
        Caption = 'Multiplos Cart'#245'es'
        DataField = 'TEF_MULTIPLO_CARTOES'
        DataSource = dsTerminais
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 481
    Width = 711
    Height = 84
    Align = alBottom
    TabOrder = 2
    object btnGravar: TBitBtn
      Left = 86
      Top = 1
      Width = 85
      Height = 82
      Align = alLeft
      Caption = 'F10 | Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semilight'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FBFAF9D9CEC2AB8E768D6A487C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522F9C7B5FEDE8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCCCBBAD86613E7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7E532FDFD5CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD5CC
        8F6C4C7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFAF8F7B399857C522D7C522E9B7B5EDACEC4FFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9A7654F7E4CAF7E4CAF7E4CAF7E4CAF7E4CA
        F7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4
        CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CA9B76547C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1ECE9A1836A
        7C522D845D3ACEBEB0FEFEFEFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFEDE7E299795C7C522D8D6848E1D7CEFFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D8962
        3DB19170B19170B19170B19170B19170B19170B19170B19170B19170B19170B1
        9170B19170B19170B19170CDB394F1DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE3DB
        D3C3B19FE9E2DBFEFEFEECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D845C38CCB2
        94FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFF0ECE897775A7C522EAA8E77F5F2EFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D865E3ACFB597FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522D99795CEEE8E2ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D8F6845C8AC8EC8AC8EC8AC8EC8AC8EC8AC8E
        C8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EE2CCAFF9E6
        CCFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D926C
        49D4BC9ED4BC9ED4BC9ED4BC9ED4BC9ED6BDA0E3CCB0F6E3C9FAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7D532E8E6945DDC6AAFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7E542FD4BA9DFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D855D39A17E5CA17E5CA17E5CA17E5CA17E5C
        A3815FC2A586F2DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D865E
        3AA58361A58361A58361A58361A58361A58361A58361A58361A58361A58361A5
        8361A58361A58361A58361A58361A58361A58361A58361A58361A58361A58361
        A58361865E3A7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFE0D5CC7E54307C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430E0D6CDFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFEBE5DF9472547C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D957354EBE5DFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF5F2EFDCD1C7D7CABED7CABED7CABED7CABED7CABED7CABE
        D7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CA
        BED7CABED7CABED7CABED7CABED7CABED7CABED7CABEDDD1C7F6F3F0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFDF9F7F6F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9
        F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F6
        FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DAD39470537C522E7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522F927151E4DBD3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2AE
        9D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522DC2AF9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522D7F5631815934815934
        8159348159348159348159348159348159348159348159348159348159348159
        348159348159348159347F56317C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEF0DCC1D4BA9CEAD4B9FAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEA3805F7C52
        2D8D6643F8E5CBFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE88613E7C522D7C522DEFDBC1FAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1EDE7E29A795D
        7C522D8D6848E1D7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D7CF8E69
        4A7C522D99785CEDE8E2F2EDE9A285697C522D845D3ACFBFB1FFFFFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFECFBFB2845D3C7C522DA3856BF2EEEAFAF8F6B39985
        7C522D7C522E9B7B60DACEC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDACDC39B7B5E7C52
        2E7C522DB39B85FAF8F7FFFFFFDFD5CC8F6B4B7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D906C4BDED4CBFFFFFFFFFFFFFDFCFB
        CBBBAC8862407C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D8862
        40CCBBADFDFCFCFFFFFFFFFFFFFFFFFFFCFBFAD9CEC2AA8E768D68487C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D8D6848A88E76D9CEC3FCFBFAFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnSair: TBitBtn
      Left = 171
      Top = 1
      Width = 85
      Height = 82
      Align = alLeft
      Caption = 'Esc | Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semilight'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF3F0ECDED3CABFAA99A88C73977558845D3B845B39
        916C4E9F7F63C2AF9DE0D5CCF1ECE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EFECD0C1B4A68970875F
        3D7D532E7C522D7C522D7C522D7C522D7C522D7C522D7C532E855E3AA08167D3
        C5B9F7F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE4AB8E78845D3C7C522D7C522D7C522D7C522F845D3C906D4E8F6C4C
        855E3A7C522E7C522D7C522D7C522D86613EAB9078EEE8E3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFBFADFD5CC8C66467C522D7C522D86613EA285
        6BC8B7A8F3F0EDFFFFFFFFFFFFFFFFFFFFFFFFF1ECE8C6B3A39F7F64845D3C7C
        522D7C522D8C6647E2D8CFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDDBD0C58F
        6C4C7C522D7C522D99795CD3C5B9F7F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF4F0EDCFC0B29572547D532E7C522D937051DED4CBFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEE9E39E7F637C522F7D532EA4876CE6DFD7FFFFFFF1EC
        E8ECE5E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E3DDF1EDEAFEFEFEE2
        D9D19E7F637C522E7E532F9D7F63EDE8E2FFFFFFFFFFFFFFFFFFFFFFFFFBFAF8
        EEE9E4E9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3
        DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCEAE3DDA88B727C522D7C
        522DAB9078F6F3F0FEFDFDCBBAAB855F3C7C522DBAA38FF6F3F0FFFFFFFFFFFF
        F3F0EDB299837C522D896342CFC0B4FEFEFEF1ECE8A5876D7C522D7C522DA98C
        75FEFEFEFFFFFFFFFFFFFEFDFDD5C7BB9C7B5F93705093705093705093705093
        7050937050937050937050937050937050937050937050937050937050937050
        937050937050916E507E532E7C522D916C4EEEE9E4FDFCFCD4C6BA865F3D7C52
        2D7C522D825B39BAA491F6F3F0F4F0EDB49C878259357C522D7C522D896342D8
        CCC2FEFEFEE9E2DC8965437C522D7F5734E4DBD4FFFFFFFFFFFFF6F4F1AC907A
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430CB
        BAABFEFDFDD4C7BB8E6A4A7C522D7C522D7C522D7C522D825B39BAA490B19983
        8259357C522D7C522D7C522D7C522D906E4FD9CDC2FEFEFDC2AE9C7C522E7C52
        2DAD927AFEFDFDFFFFFFF4F0EDA68B727C522D8059349575579C7B5F9C7B5F9C
        7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F
        9C7B5F8F6C4C7D542F7C522DA18368F1EDE9E6DED78D68487C522D7F5631AE8E
        6DC1A385845B377C522D7C522D7C522D7C522D865E3AC5A98BA987667E55307C
        522D957254EBE4DEEEE8E49B7B5E7C522D916E4EE7DFD9FFFFFFF4F0EDA68B72
        7C522D906E4FE7DFD8FDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFC
        FBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBC9B8A98159377E5532BEA997FD
        FCFCE3DBD38761407C522D825934BA9C7CF3DFC5C0A283875F3B7C522D7C522D
        8A623EC6AA8CF2DEC4B394738057327C522D8E6A4BE8E0DAFBF9F8B7A08C7E53
        2E845D3ACFBFB1FFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFDBFAA977C522F896342D6CABEFFFFFFF8F6F4BAA4918259357C522D855D
        39C3A788F4E0C6C0A485845C3887603BC7AC8DF5E2C8BB9D7D845B377C522D82
        5B39C1AD9BFAF8F6FFFFFFCEBFB1855D3A7C522FBDA895FFFEFEF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F4AF967F7C522D8F6B4CE4DCD4FF
        FFFFFFFFFFFCFBFBC2AF9E8058347C522D7C532EC4A789F6E3C9EDD8BEF0DCC1
        F5E1C7BC9F7E7C522D7C522D825B37C9B7A7FDFDFDFFFFFFFFFFFFDDD2C88C66
        477C522DB29983F9F7F5F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2EEEBA5886D7C522D926E50EBE5DFFFFFFFFFFFFFFFFFFFFCFCFBB69E897D54
        2F7C522D8D6744DEC7AAFAE8CEFAE8CED9C0A38B64407C522D7F5634BBA592FD
        FDFCFFFFFFFFFFFFFFFFFFE5DCD58F6B4B7C522DAB9078F6F3F1F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EEEBA4886E7C522D926E50E9E2DCFF
        FFFFFFFFFFFFFFFFFEFEFEAD937B7C522F7C522D8E6844E0C9ADFAE8CEFAE8CE
        DAC2A68C65417C522D7D5530B69D88FFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522DAC927AF6F3F1F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F5F4AE947C7C522D8D6847DFD5CCFFFFFFFFFFFFF3F0EDB199837C522D7C52
        2D865E3AD0B799F3DFC4DCC4A8E0C8ACF3E0C5CAAF90845B377C522D7C522DBA
        A38EF6F3F0FFFFFFFFFFFFDACEC38963427C522DB49E88FBF9F9F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFBB9A3907C522E835D39CFC0B2FF
        FFFFF6F3F0B79F8C8259357C522D8A623EC6AB8CF2DEC4BC9F7F875F3B89623E
        C2A687F3DFC5C0A283875F3B7C522D835B39BDA895F7F5F3FFFEFEC8B6A78259
        357E5430C0AC9AFEFDFDF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCFC0B2845D3A7C522FB49E88FAF8F7E2D9D0865F3D7C522D845C38C2A5
        87F5E3C8BB9D7D845B377C522D7C522D855D39C3A788F4E0C6BB9D7D8159347C
        522D8C6647E6DED7F8F6F3B096807D532E876141D6C9BDFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E29472557C522D8E6A4BE4
        DBD3ECE6E099785A7C522F7D532EA2805EB192717C522D7C522D825B38805834
        7C522D7C532EB697779D7A587C522E7E532E9F7F64EFE9E4DFD5CC8864427C52
        2D99795CF2EEEBFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFCB8A18C7C522D7C522DB49C87FDFCFCD8CCC1906E4F7C522D7C53
        2E7C522D7C522D865F3DBFAB99B8A28E825B387C522D7C522D7C532E7C522D95
        7354DDD2C8FCFBFBAB90797C522D7C522DC1AD9CFEFEFEFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0ECE7835B387C522D82
        5B39DCD1C7FCFCFBDDD2C9825B397C522D7C522D825B39BFAA98F8F6F3F6F3F0
        B8A28E8259357C522D7C522D875F3DE2D8D0FEFDFDD4C5B98057337C522D865F
        3DF4F0EDFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4B1A08159377C522D8D6847D9CCC1FBFAF9DCD1C79777
        5A8F6C4CC9B8A8FDFDFDFFFFFFFFFFFFFCFBFBC2AF9E8F6C4B9B7B5EE1D8D1FF
        FFFFE4DCD48F6C4C7C522D845B38CBBAACFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0EDAE957E7F
        56327C532E906C4CCAB9ABFAF9F8ECE6E1E6DED6FEFEFDFFFFFFFFFFFFFFFFFF
        FFFFFFFEFDFCE4DBD4EEE8E4FEFDFDFFFFFFD9CCC28A63427F5633B39B86F5F2
        F0FFFFFFFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDE7E2A184687C522D7C522D865F3DAF967FE9E2
        DCFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6F3F1C9B7A8C4B1A0F1EDE9FFFFFFFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FAF9AF967F835D397C522D7C522D7E5532987759C2AF9DD6C9BDDFD5CCEEE9E4
        FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF7F5F2AE947C7C522D947255F0EBE6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F2C9B8A99B7A5E7C522D7C52
        2D7C522D7C522D7C522D805733A1836AE7DFD9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD9CDC2
        9F7F64C9B8A8FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFCFCEEE8E3C0AC9A9472557F54307C522D7C522D7C522D886442
        D7CBC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEFEBE6CFC0B3C2AE9DB59F8AD2C3B7F9F8F6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD
        F6F2EFF1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1EC
        E8F1ECE8F1ECE8F1EDE9F7F5F3FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAF9F8CBBBACCEBEB0F7F5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEDED4CAAB9078A08167A08167A08167A08167A0
        8167A08167A08167A08167A08167A08167A08167A08167A28468B09880ECE6E1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD3CA7D532E815937D9CEC3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F2B0967F
        7C522E7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522FC6B3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCBBBAD7C522D7C522DCCBDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF9F8F6B9A38F7F57337C522D7C522D805732926D4A93
        6D4A936D4A936D4A936D4A936D4A936D4A936D4A8D67437C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE7E2
        A78C747C522D7C522D835B36C9AE90E8D3B7E8D3B8E8D3B8E8D3B8E8D3B8E8D3
        B8E8D3B8CFB5977C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EDE99B7A5E7C522D7C522D95704DDC
        C4A7FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF0ECE7A88C728057337C522D8E6844D5BB9EFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE5DFA68A717C522D7C
        522D8E6845DEC6A9FAE7CDFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEFEAE699785A7C522D7C522D977250DEC7AAFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBE6A6
        896E7E55327C522D8F6A46D7BEA1FAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE4DEA4876D7C522D7C522D906A47DFC8
        ACFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE59674587C522D7C522D997452E0C9ADDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9E5A2856B7E55327C52
        2D926C49BC9F7F7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE8E1DBA2856B7C522D7C522D865E3A7C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E39372
        547C522D7C522D7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E2A283687E54307C522D7C522D896341
        9676589676589676589676589676589676589676589676589676589676589676
        589676589676589676589676589676589676588C67467C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE8E1DAA081677C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522ED2C4B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E19774587C522E7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F54309E7F63EBE5DFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnExcluir: TBitBtn
      Left = 1
      Top = 1
      Width = 85
      Height = 82
      Align = alLeft
      Caption = 'F4 | Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semilight'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B00003D0200003D0200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D325136195136195136195136195136195136
        1951361951361951361951361951361951361951361951361951361951361951
        3619513619513619513619513619513619513619513619513619513619513619
        513619513619513619513619513619513619513619654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D327A
        654FA7998AA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8C
        A89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B
        8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA4
        9586735E46654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFF6F5F5ECEBE9ECEB
        E9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9EC
        EBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9ECEBE9
        ECEBE9ECEBE9EDECEAF8F7F6FFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3CFCAC4CBC6BFDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3D6D2CD8F7F6E806D59C6C0B9DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3D8D5D0AA9F92573D21806D59CCC6BFDAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3907F6E583E235136195136195136195136195136195136197E
        6B56DAD7D3B6ADA3725D466750376750376750376750376D573F9F9283DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D35C43286A543B90806E
        93837292827185736053381C5F472CA29586DAD7D3C0B9B08F7E6C8775628775
        6287756285735F68503761492FDAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D37E6A56664F36C0B9B1D8D5D1D2CEC88674615C42289F9283D5
        D1CCDAD7D3D8D4D0D3CFCAD3CEC9D3CEC9D3CEC9BFB8AF6C563D7D6A55DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3C0B8B0654D34806D59
        D8D5D0DAD7D3B1A79CA89D90D9D6D2DAD7D3DAD7D3DAD7D3DAD7D3D4D0CBD0CB
        C5D8D4D08B7B68624B31BEB6ADDAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3D5D1CD9687775A4125B8B0A6DAD7D3DAD7D3D9D6D2DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3A5988A8F7F6EB3A99E5C4328928372D4D0CBDAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3C7C1B96C563D
        7B6852D1CCC7DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D39C8E7E5D44
        2A685238685138C2BCB4DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3B0A598685037B1A79CDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3BBB3A9594025513619644C326F5941BCB4ABDAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3D7D4CF
        B4AA9FD4CFCADAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3C7C1B96F5A
        42583E23715B44877562C4BDB5DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3C0B9B0B2A89ED4D1CBDAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3D5D1CCB7AEA4B8AFA5C8C1BAD3CEC9D9D6D2DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        D5D1CC8B7A68513619573D2075604AAA9F92DAD7D3DAD7D3CDC8C1C1B9B0D6D2
        CDDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3C9C3BB735E485136195B42267560499F
        9182DAD7D3D7D3CE90806E725D47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        BCB5AB5C42276C563E5C4328A29688D1CCC7DAD7D3B9B0A6644C338A7A67D6D2
        CDDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3BBB2A8806D58C0B8B069523A75614AC9
        C3BCCEC9C37E6B5661492ED0CCC6DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3D7D4D0D8D5D1A89C8F5C44289F9283A99D905D43299E9182DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CDC8C17C695461
        492F69523A75604AC9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3BBB3AA75604A715C45B6ADA2DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3D9D6D2C9
        C3BCC7C0B9D9D6D1DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFEEECEBDAD7D4DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFEEECEBDAD7D4DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DCD9D6F1F0EEFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFFAFAFAF6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4
        F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5
        F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F7F6F5FBFBFBFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF654D32A29485FCFCFBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4F2958573654D32FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654D32A2
        9485FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
        F4F2958573654D32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDEAE6968673746049543A1D644C3279644D79644E79644E79644E7964
        4E79644E79644E79644E79644E79644E79644E79644E79644E79644E79644E79
        644E79644E79644E79644E79644E79644E79644E79644E79644E79644E79644E
        79644E79644E79644E79644E79644E77624B61492E563B1E78644D998978EEEB
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E4E07A654E6952398D7B688D
        7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B68
        8D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B
        688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D7B688D
        7B688D7B688D7B68664F3578654DE8E4E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE8E4E07A654E917F6DF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EF
        EDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1
        EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFED
        F1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFEDF1EFED89786378654DE8E4
        E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E4E07A654E968574FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F4F3F1AEA193A59788FFFFFFFDFDFCA39585A7998AFFFFFFFFFFFF9C8D7DB3A7
        9AF7F6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF8E7D6978654DE8E4E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE8E5E17B655192816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F1ADA093A49687FFFFFFFDFDFCA2
        9485A69989FFFFFFFFFFFF9C8D7CB2A79AF7F6F4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A79657A654FE8E5
        E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFECE98874606C553DFDFDFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFDF3F1EFF2F0EEFFFFFFFFFFFEF1EFEDF2F0EEFFFFFFFFFFFFF1EEECF4F2
        F0FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBFAFA674F35897763EFEDEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFDBFB5AA60492F6A523A8F7D6B92816F92816F92816F92816F9281
        6F92816F92816F92816F92816F92816F92816F92816F92816F92816F92816F92
        816F92816F92816F92816F92816F92816F92816F92816F92816F92816F92816F
        92816F92816F92816F92816F92816F92816F8E7C6A685138654D32C3B9AFFFFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F4BFB5AB8977647D
        68537D68537D68537D68537D68537D68537D68537D68537D685367513751371A
        7B654F7D68537D68537D68537D68537D68537D68537D68537D68537D68537D68
        537C685251371B6A52397D68537D68537D68537D68537D68537D68537D68537D
        68537D69558B7965C3BAB0F8F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFDFDF0EEEBEAE6E3E9E6E2E9E6E2E9E6E2E9E6E2E9E6
        E2E9E6E2E9E6E2E9E6E2A1928354381DE3DEDAE9E6E2E9E6E2E9E6E2E9E6E2E9
        E6E2E9E6E2E9E6E2E9E6E2E9E6E2E9E6E2E6E2DE553B1EA7998AE9E6E2E9E6E2
        E9E6E2E9E6E2E9E6E2E9E6E2E9E6E2E9E6E2EAE6E3F1EEECFEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADA09354381D
        F7F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFBFAFA553B1FB3A79AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFADA09354381DA49587A89A8CA89A8CA89A8CA89A8CA8
        9A8CA89A8CA89A8CA89A8CA89A8CA89A8CA69889553B1FB3A79AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADA09354381D
        5136195136195136195136195136195136195136195136195136195136195136
        19513619563B1FB3A79AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object dsTerminais: TDataSource
    DataSet = qryTerminal
    Left = 632
    Top = 256
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 536
    Top = 248
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 256
  end
  object qryTerminal: TFDQuery
    OnNewRecord = qryTerminalNewRecord
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from VENDAS_TERMINAIS'
      'order by NOME')
    Left = 512
    Top = 296
    object qryTerminalIP: TStringField
      FieldName = 'IP'
      Origin = 'IP'
      Required = True
    end
    object qryTerminalNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 35
    end
    object qryTerminalIMPRIME: TStringField
      FieldName = 'IMPRIME'
      Origin = 'IMPRIME'
      Size = 1
    end
    object qryTerminalUSAGAVETA: TStringField
      FieldName = 'USAGAVETA'
      Origin = 'USAGAVETA'
      Size = 1
    end
    object qryTerminalFABIMPRESSORA: TStringField
      FieldName = 'FABIMPRESSORA'
      Origin = 'FABIMPRESSORA'
    end
    object qryTerminalMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
    end
    object qryTerminalPORTA: TStringField
      FieldName = 'PORTA'
      Origin = 'PORTA'
      Size = 50
    end
    object qryTerminalCONTINGENCIA: TStringField
      FieldName = 'CONTINGENCIA'
      Origin = 'CONTINGENCIA'
      Size = 1
    end
    object qryTerminalNVIAS: TSmallintField
      FieldName = 'NVIAS'
      Origin = 'NVIAS'
      DisplayFormat = '0'
    end
    object qryTerminalSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object qryTerminalNUMERACAO_INICIAL: TIntegerField
      FieldName = 'NUMERACAO_INICIAL'
      Origin = 'NUMERACAO_INICIAL'
      DisplayFormat = '0'
    end
    object qryTerminalEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryTerminalVELOCIDADE: TIntegerField
      FieldName = 'VELOCIDADE'
      Origin = 'VELOCIDADE'
      DisplayFormat = '0'
    end
    object qryTerminalIMPRIME_FECHAMENTO: TStringField
      FieldName = 'IMPRIME_FECHAMENTO'
      Origin = 'IMPRIME_FECHAMENTO'
      Size = 1
    end
    object qryTerminalLOGADO: TStringField
      FieldName = 'LOGADO'
      Origin = 'LOGADO'
      Size = 1
    end
    object qryTerminalEH_CAIXA: TStringField
      FieldName = 'EH_CAIXA'
      Origin = 'EH_CAIXA'
      Size = 1
    end
    object qryTerminalVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      DisplayFormat = ',0.00'
    end
    object qryTerminalTIPO_BROWSER: TStringField
      FieldName = 'TIPO_BROWSER'
      Origin = 'TIPO_BROWSER'
      Size = 30
    end
    object qryTerminalBALANCA_PORTA: TStringField
      FieldName = 'BALANCA_PORTA'
      Origin = 'BALANCA_PORTA'
      Size = 10
    end
    object qryTerminalBALANCA_VELOCIDADE: TStringField
      FieldName = 'BALANCA_VELOCIDADE'
      Origin = 'BALANCA_VELOCIDADE'
      Size = 10
    end
    object qryTerminalBALANCA_MARCA: TStringField
      FieldName = 'BALANCA_MARCA'
      Origin = 'BALANCA_MARCA'
      Size = 10
    end
    object qryTerminalBALANCA_PARIDADE: TStringField
      FieldName = 'BALANCA_PARIDADE'
      Origin = 'BALANCA_PARIDADE'
    end
    object qryTerminalBALANCA_DATABITS: TStringField
      FieldName = 'BALANCA_DATABITS'
      Origin = 'BALANCA_DATABITS'
      Size = 10
    end
    object qryTerminalBALANCA_STOPBITS: TStringField
      FieldName = 'BALANCA_STOPBITS'
      Origin = 'BALANCA_STOPBITS'
      Size = 10
    end
    object qryTerminalBALANCA_HANDSHAKING: TStringField
      FieldName = 'BALANCA_HANDSHAKING'
      Origin = 'BALANCA_HANDSHAKING'
    end
    object qryTerminalDATA_VERSAO: TSQLTimeStampField
      FieldName = 'DATA_VERSAO'
      Origin = 'DATA_VERSAO'
    end
    object qryTerminalDESTINO_IMPRESSAO: TStringField
      FieldName = 'DESTINO_IMPRESSAO'
      Origin = 'DESTINO_IMPRESSAO'
      Size = 30
    end
    object qryTerminalDT_VERSAO: TStringField
      FieldName = 'DT_VERSAO'
      Origin = 'DT_VERSAO'
      Size = 50
    end
    object qryTerminalESC_POS_DIRETO: TStringField
      FieldName = 'ESC_POS_DIRETO'
      Origin = 'ESC_POS_DIRETO'
      Size = 1
    end
    object qryTerminalPAGINA_CODIGO: TStringField
      FieldName = 'PAGINA_CODIGO'
      Origin = 'PAGINA_CODIGO'
      Size = 30
    end
    object qryTerminalDATA_SISTEMA: TDateField
      FieldName = 'DATA_SISTEMA'
      Origin = 'DATA_SISTEMA'
    end
    object qryTerminalIMPRIME_DUAS_LINHAS: TStringField
      FieldName = 'IMPRIME_DUAS_LINHAS'
      Origin = 'IMPRIME_DUAS_LINHAS'
      Size = 1
    end
    object qryTerminalMARGEM_DIREITA: TFMTBCDField
      FieldName = 'MARGEM_DIREITA'
      Origin = 'MARGEM_DIREITA'
      Precision = 18
      Size = 2
    end
    object qryTerminalMARGEM_ESQUERDA: TFMTBCDField
      FieldName = 'MARGEM_ESQUERDA'
      Origin = 'MARGEM_ESQUERDA'
      Precision = 18
      Size = 2
    end
    object qryTerminalMARGEM_INFERIOR: TFMTBCDField
      FieldName = 'MARGEM_INFERIOR'
      Origin = 'MARGEM_INFERIOR'
      Precision = 18
      Size = 2
    end
    object qryTerminalMARGEM_SUPERIOR: TFMTBCDField
      FieldName = 'MARGEM_SUPERIOR'
      Origin = 'MARGEM_SUPERIOR'
      Precision = 18
      Size = 2
    end
    object qryTerminalLARGURA_BOBINA: TIntegerField
      FieldName = 'LARGURA_BOBINA'
      Origin = 'LARGURA_BOBINA'
    end
    object qryTerminalESPACO_ENTRE_LINHAS: TStringField
      FieldName = 'ESPACO_ENTRE_LINHAS'
      Origin = 'ESPACO_ENTRE_LINHAS'
      Size = 1
    end
    object qryTerminalLINHAS_ENTRE_CUPOM: TStringField
      FieldName = 'LINHAS_ENTRE_CUPOM'
      Origin = 'LINHAS_ENTRE_CUPOM'
      Size = 1
    end
    object qryTerminalDT_ULTIMA_ATUALIZACAO: TSQLTimeStampField
      FieldName = 'DT_ULTIMA_ATUALIZACAO'
      Origin = 'DT_ULTIMA_ATUALIZACAO'
    end
    object qryTerminalTAMANHO_FONTE: TIntegerField
      FieldName = 'TAMANHO_FONTE'
      Origin = 'TAMANHO_FONTE'
    end
    object qryTerminalFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryTerminalEXIBE_F3: TStringField
      FieldName = 'EXIBE_F3'
      Origin = 'EXIBE_F3'
      Size = 1
    end
    object qryTerminalEXIBE_F4: TStringField
      FieldName = 'EXIBE_F4'
      Origin = 'EXIBE_F4'
      Size = 1
    end
    object qryTerminalEXIBE_F5: TStringField
      FieldName = 'EXIBE_F5'
      Origin = 'EXIBE_F5'
      Size = 1
    end
    object qryTerminalEXIBE_F6: TStringField
      FieldName = 'EXIBE_F6'
      Origin = 'EXIBE_F6'
      Size = 1
    end
    object qryTerminalFRENTE: TStringField
      FieldName = 'FRENTE'
      Origin = 'FRENTE'
      Size = 40
    end
    object qryTerminalRETAGUARDA: TStringField
      FieldName = 'RETAGUARDA'
      Origin = 'RETAGUARDA'
      Size = 40
    end
    object qryTerminalCAMINHO_SAT_DLL: TStringField
      FieldName = 'CAMINHO_SAT_DLL'
      Origin = 'CAMINHO_SAT_DLL'
      Size = 200
    end
    object qryTerminalMODELO_SAT_DLL: TStringField
      FieldName = 'MODELO_SAT_DLL'
      Origin = 'MODELO_SAT_DLL'
      Size = 30
    end
    object qryTerminalTIPO_SAT_DLL: TStringField
      FieldName = 'TIPO_SAT_DLL'
      Origin = 'TIPO_SAT_DLL'
      Size = 30
    end
    object qryTerminalQRCODE_LATERAL: TStringField
      FieldName = 'QRCODE_LATERAL'
      Origin = 'QRCODE_LATERAL'
      Size = 1
    end
    object qryTerminalDATA_SCRIPT: TSQLTimeStampField
      FieldName = 'DATA_SCRIPT'
      Origin = 'DATA_SCRIPT'
    end
    object qryTerminalPARAMETROS_ADICIONAIS: TStringField
      FieldName = 'PARAMETROS_ADICIONAIS'
      Origin = 'PARAMETROS_ADICIONAIS'
      Size = 200
    end
    object qryTerminalCOLUNAS: TIntegerField
      FieldName = 'COLUNAS'
      Origin = 'COLUNAS'
    end
    object qryTerminalL1: TIntegerField
      FieldName = 'L1'
      Origin = 'L1'
    end
    object qryTerminalL2: TIntegerField
      FieldName = 'L2'
      Origin = 'L2'
    end
    object qryTerminalL3: TIntegerField
      FieldName = 'L3'
      Origin = 'L3'
    end
    object qryTerminalL4: TIntegerField
      FieldName = 'L4'
      Origin = 'L4'
    end
    object qryTerminalTIPOIMPRESSORA: TStringField
      FieldName = 'TIPOIMPRESSORA'
      Origin = 'TIPOIMPRESSORA'
      Size = 1
    end
    object qryTerminalEMPRESA_ATIVA: TIntegerField
      FieldName = 'EMPRESA_ATIVA'
      Origin = 'EMPRESA_ATIVA'
    end
    object qryTerminalTEF_LOG: TStringField
      FieldName = 'TEF_LOG'
      Origin = 'TEF_LOG'
      Size = 200
    end
    object qryTerminalTEF_GERENCIADOR: TIntegerField
      FieldName = 'TEF_GERENCIADOR'
      Origin = 'TEF_GERENCIADOR'
    end
    object qryTerminalTEF_MAX_CARTOES: TIntegerField
      FieldName = 'TEF_MAX_CARTOES'
      Origin = 'TEF_MAX_CARTOES'
    end
    object qryTerminalTEF_TROCO_MAXIMO: TSingleField
      FieldName = 'TEF_TROCO_MAXIMO'
      Origin = 'TEF_TROCO_MAXIMO'
    end
    object qryTerminalTEF_SOFT_HOUSE: TStringField
      FieldName = 'TEF_SOFT_HOUSE'
      Origin = 'TEF_SOFT_HOUSE'
      Size = 100
    end
    object qryTerminalTEF_REGISTRO: TStringField
      FieldName = 'TEF_REGISTRO'
      Origin = 'TEF_REGISTRO'
      Size = 30
    end
    object qryTerminalTEF_APLICACAO: TStringField
      FieldName = 'TEF_APLICACAO'
      Origin = 'TEF_APLICACAO'
      Size = 50
    end
    object qryTerminalTEF_VERSAO: TStringField
      FieldName = 'TEF_VERSAO'
      Origin = 'TEF_VERSAO'
      Size = 10
    end
    object qryTerminalTEF_VIA_REDUZIDA: TStringField
      FieldName = 'TEF_VIA_REDUZIDA'
      Origin = 'TEF_VIA_REDUZIDA'
      Size = 1
    end
    object qryTerminalTEF_SUPORTA_DESCONTO: TStringField
      FieldName = 'TEF_SUPORTA_DESCONTO'
      Origin = 'TEF_SUPORTA_DESCONTO'
      Size = 1
    end
    object qryTerminalTEF_SUPORTA_SAQUE: TStringField
      FieldName = 'TEF_SUPORTA_SAQUE'
      Origin = 'TEF_SUPORTA_SAQUE'
      Size = 1
    end
    object qryTerminalTEF_REAJUSTA_VALOR: TStringField
      FieldName = 'TEF_REAJUSTA_VALOR'
      Origin = 'TEF_REAJUSTA_VALOR'
      Size = 1
    end
    object qryTerminalTEF_MULTIPLO_CARTOES: TStringField
      FieldName = 'TEF_MULTIPLO_CARTOES'
      Origin = 'TEF_MULTIPLO_CARTOES'
      Size = 1
    end
    object qryTerminalRESTAURANTE: TStringField
      FieldName = 'RESTAURANTE'
      Origin = 'RESTAURANTE'
      Size = 1
    end
    object qryTerminalDELIVERY: TStringField
      FieldName = 'DELIVERY'
      Origin = 'DELIVERY'
      Size = 1
    end
    object qryTerminalPDV: TStringField
      FieldName = 'PDV'
      Origin = 'PDV'
      Size = 1
    end
    object qryTerminalCAMINHO_BAR: TStringField
      FieldName = 'CAMINHO_BAR'
      Origin = 'CAMINHO_BAR'
      Size = 100
    end
    object qryTerminalCAMINHO_COZINHA: TStringField
      FieldName = 'CAMINHO_COZINHA'
      Origin = 'CAMINHO_COZINHA'
      Size = 100
    end
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 344
    Top = 280
  end
end
