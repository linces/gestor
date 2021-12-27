object frmNFCe: TfrmNFCe
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsDialog
  Caption = 'NFC-e'
  ClientHeight = 603
  ClientWidth = 1194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1194
    603)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 464
    Width = 1194
    Height = 41
    Align = alBottom
    Color = 16514043
    ParentBackground = False
    TabOrder = 0
    object LblSaldo: TLabel
      Left = 633
      Top = 10
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 23
      Top = 13
      Width = 70
      Height = 13
      Caption = 'CHAVE NFC-e:'
    end
    object DBEdit1: TDBEdit
      Left = 97
      Top = 10
      Width = 516
      Height = 19
      Ctl3D = False
      DataField = 'CHAVE'
      DataSource = dsVenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Panel10: TPanel
      Left = 720
      Top = 1
      Width = 473
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 142
        Top = 10
        Width = 95
        Height = 15
        Caption = 'TOTAL DE NFC-E  |'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 248
        Top = 10
        Width = 217
        Height = 17
        DataField = 'TTOTAL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1194
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 1194
      Height = 75
      Align = alClient
      Caption = 'F12  | Filtrar '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LblPeriodo: TLabel
        Left = 7
        Top = 18
        Width = 85
        Height = 15
        Caption = 'Per'#237'odo de    at'#233
      end
      object lblDescricao: TLabel
        Left = 247
        Top = 18
        Width = 46
        Height = 15
        Caption = 'Localizar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtLoc: TEdit
        Left = 247
        Top = 35
        Width = 498
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 44
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        TextHint = 'Digite aqui sua pesquisa'
        OnChange = edtLocChange
        OnKeyDown = edtLocKeyDown
      end
      object maskInicio: TMaskEdit
        Left = 7
        Top = 35
        Width = 68
        Height = 21
        Color = clWhite
        Ctl3D = False
        EditMask = '!99/99/0000;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = maskInicioKeyPress
      end
      object maskFim: TMaskEdit
        Left = 78
        Top = 35
        Width = 70
        Height = 21
        Color = clWhite
        Ctl3D = False
        EditMask = '!99/99/0000;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 10
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = maskFimKeyPress
      end
      object btnFiltrar: TBitBtn
        Left = 154
        Top = 34
        Width = 90
        Height = 21
        Caption = 'Filtrar Per'#237'odo'
        TabOrder = 2
        OnClick = btnFiltrarClick
      end
    end
  end
  object TabSet1: TTabControl
    Left = 0
    Top = 75
    Width = 1194
    Height = 389
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 3
    Tabs.Strings = (
      'Transmitidos'
      'Duplicidade'
      'Inutilizados'
      'Gravados'
      'Conting'#234'ncia'
      'Cancelados'
      'Denegado')
    TabIndex = 0
    OnChange = TabSet1Change
    object PageControl1: TPageControl
      Left = 4
      Top = 29
      Width = 1186
      Height = 356
      ActivePage = TabSheet1
      Align = alClient
      DoubleBuffered = False
      MultiLine = True
      ParentDoubleBuffered = False
      ScrollOpposite = True
      TabOrder = 0
      TabPosition = tpRight
      object TabSheet1: TTabSheet
        Caption = 'Vendas'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1155
          Height = 348
          Align = alClient
          DataSource = dsVenda
          GradientEndColor = 15529196
          GradientStartColor = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnDblClick = DBGrid1DblClick
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Title.Caption = 'S'#233'rie>>'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Title.Caption = 'N'#250'mero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_EMISSAO'
              Title.Caption = 'Dt.Emiss'#227'o'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHAVE'
              Title.Caption = 'Chave'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROTOCOLO'
              Title.Caption = 'Protocolo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_NOTA'
              Title.Caption = 'CPF'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAIXA'
              Title.Caption = 'Caixa'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Title.Caption = 'Usu'#225'rio'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENDEDOR'
              Title.Caption = 'Vendedor'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Title.Caption = 'Total'
              Width = 95
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Itens'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 1155
          Height = 307
          Align = alClient
          DataSource = dsItem
          GradientEndColor = 15529196
          GradientStartColor = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = DBGrid2DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ITEM'
              Title.Caption = 'Item'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_BARRA'
              Title.Caption = 'C'#243'd.Barra'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PRODUTO'
              Title.Caption = 'C'#243'd.'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 544
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Title.Caption = 'Quantidade'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Caption = 'Und.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Pre'#231'o'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ITEM'
              Title.Alignment = taRightJustify
              Title.Caption = 'Total'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VDESCONTO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Desconto'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Title.Alignment = taRightJustify
              Title.Caption = 'Total'
              Width = 102
              Visible = True
            end>
        end
        object Panel9: TPanel
          Left = 0
          Top = 307
          Width = 1155
          Height = 41
          Align = alBottom
          TabOrder = 1
          object DBText1: TDBText
            Left = 1013
            Top = 10
            Width = 139
            Height = 17
            DataField = 'TTOTAL'
            DataSource = dsItem
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 725
            Top = 13
            Width = 280
            Height = 18
            Caption = 'Total Items (Sem Desconto)>>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 355
            Top = 13
            Width = 220
            Height = 18
            Caption = 'Total (Sem Desconto)>>'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 581
            Top = 10
            Width = 139
            Height = 17
            DataField = 'TOTAL'
            DataSource = dsVenda
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Button2: TButton
            Left = 14
            Top = 6
            Width = 123
            Height = 25
            Caption = 'Recuperar NFCe'
            TabOrder = 0
            OnClick = Button2Click
          end
        end
      end
    end
  end
  object PagUtilidade: TPageControl
    Left = 321
    Top = 148
    Width = 582
    Height = 278
    ActivePage = tabDocumentos
    Anchors = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object TabInutilizar: TTabSheet
      Caption = 'Inutilizar NFC-e'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnInutiliza: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 248
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 3
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 107
          Top = 10
          Width = 26
          Height = 17
          Caption = 'Ano:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 326
          Top = 9
          Width = 49
          Height = 17
          Caption = 'Modelo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 103
          Top = 33
          Width = 32
          Height = 17
          Caption = 'S'#233'rie:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 28
          Top = 61
          Width = 107
          Height = 17
          Caption = 'Numera'#231#227'o Inicial:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 34
          Top = 84
          Width = 101
          Height = 17
          Caption = 'Numera'#231#227'o Final:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 67
          Top = 107
          Width = 68
          Height = 17
          Caption = 'Justificativa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtAno: TEdit
          Left = 141
          Top = 9
          Width = 86
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtModelo: TEdit
          Left = 381
          Top = 9
          Width = 86
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object edtSerie: TEdit
          Left = 141
          Top = 34
          Width = 86
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edtInicial: TEdit
          Left = 141
          Top = 59
          Width = 86
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object edtFinal: TEdit
          Left = 141
          Top = 84
          Width = 86
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edtJustificativa: TEdit
          Left = 141
          Top = 109
          Width = 398
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object Panel6: TPanel
          Left = 3
          Top = 158
          Width = 568
          Height = 87
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 6
          object btnInutilizar: TSpeedButton
            Left = 34
            Top = 13
            Width = 80
            Height = 66
            Caption = 'Enviar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Glyph.Data = {
              361B0000424D361B000000000000360000002800000030000000300000000100
              180000000000001B00003D0200003D0200000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCFAF9
              F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBF1EFECF5F4F2FBFAFAEA
              E7E4F1EFEDFEFDFDF8F7F6FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFCFCFCD9D3CDAB9E90A19283C6BEB5F6F5F4FFFFFFF4F2F1C9C0B7
              DAD4CEE9E5E1998A79C2B9AFE9E6E28E7D6BB3A79AEFEDEAAA9D8FCFC8C0FCFC
              FBEFECEAFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD6D0705942543A1E5339
              1C5F462D9D8D7DD7D0C9EAE7E47A654F9D8E7DECE8E5958674C7BEB4F0EDEBAB
              9F91C5BCB3E2DED97B6751B8AEA2E8E5E18A7865AFA294FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF97887662492FC9C0B7E3DED97D695352371A9E8F80FEFDFDE4DFDB
              FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE7
              E4A29484CDC5BDD1CAC283705ADFD9D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF907F6C705A43E3DFDAF5F3
              F2948472614930EBE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED9D3CC8E7E6CE8E5E1
              DBD6D0D1CAC3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFCFBFB85725D563C208976639D8E7D61492F968574FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFEFDFDF0EEECF6F4F3998A79705942F8F6F6FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFBD5CEC7654E357F6B5578654D725C
              439E8E7DEFEDEAFFFFFFFFFFFFFFFFFFFEFBF7FBF4E6F9F0DDF8ECD4F6E9CEF7
              EACFF8EDD6F9F0DDFAF4E6FEFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              ECE9E6DDD8D2E7E3DFB5A99DE6E3DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D1B4
              A99CEFEDEAD1CAC2F5F3F1F2F0EEE9E6E2FCFCFBFFFFFFFEFDFCFAF2E2F2DFB7
              EAC987E4B963E0B251DEAB42DBA535DBA435DFAC43E1B151E4B963ECCE91F3E0
              BAFBF4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CDC576614ACFC8C0FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFB5A99C6D563EDDD7D1FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFDFBF6ECCF96E2B355DEA83DDAA22FDBA22EDBA22EDBA22EDBA22EDB
              A22EDBA22EDBA22EDBA22EDBA230DEAA3EE2B455F0DAABFCF9F3FFFFFFFFFFFF
              FFFFFFFFFFFFF8F7F6E3DFDBF7F6F5D6CFC8EDEAE8FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E4DFD5CFC8F6F5F3EE
              ECE9FEFEFDFFFFFFFFFFFFFFFFFFFDF8EEF0D8A8E0AE4ADBA22EDBA22ED59D2D
              C6922BB58428A073258E6623825D20835D20916923A07425B78528C9942BD69E
              2DDBA22EDAA12FE0B251F1DBAFFEFCF7FFFFFFFFFFFFFFFFFFFFFFFFE6E3DE60
              4930ADA092FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFCFBFBAEA2956E563FF5F3F2FFFFFFFFFFFFFFFFFFFFFFFFFCF7EDEAC5
              7FDDA638DBA22ED69E2DB685288E66226C4B1D573A1A5136195B42265B42265C
              43285A4025513619563A1972501E8F6622B88728DAA22EDBA22EDBA434EDD199
              FCF7EDFFFFFFFFFFFFFFFFFFFEFEFEC5BBB2E8E4E0E8E5E1FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE2DDD9C4BCB1FCFCFBFF
              FFFFFFFFFFFFFFFFFAF3E2E6C174DCA230DBA22ECF982C88602261431C583E21
              513619563C2092816FC8C0B77D69537E6A55CEC7BF8A7865563C2052371A5539
              1C62441C966C23CE972CDBA22EDDA638E9C57EFBF6EAFFFFFFFFFFFFFFFFFFFF
              FFFFD0C9C27B6751DFDAD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F5F4F2816C57CAC2B9FDFCFCFFFFFFFFFFFFFFFFFFFAF2E1E4BC67DAA22FD79F
              2DB2822867471D6D563DA193837C6852624A2FB7ADA1FAF9F8EDEBE885725D85
              735FFFFFFFFAF9F8AC9F925D45298D7B6896857462492F6D4C1EB68629DAA12E
              DBA22EE7BE6EFDFAF4FFFFFFFFFFFFFFFFFFE5E1DE978776E0DBD5FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E68E7C6AC5BBB1FEFDFDFFFFFFFF
              FFFFFEFCF9E9C47DDCA330DBA22EA6792665461D7A654FD4CEC6B7AB9F5C4328
              AEA294FAF9F8FFFFFFEDEBE885725D85735FFFFFFFFFFFFFFBFBFA9585736750
              37D0C8C1C3B9AF725D4566471DB58428DAA12EDAA12FEDD199FEFBF6FFFFFFFF
              FFFFFFFFFFFBFBFAD8D2CBDAD5CFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5
              F9F9F8F2F0EEF8F7F6FFFFFFFFFFFFFFFFFFF2DCB0DCA534DBA22EBF8C295E40
              1C83705BE0DBD5E5E1DC745F48715B43F5F4F2FFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFDED9D3715B437C6853FCFBFBD9D3CC735D456C4C1D
              BE8B29DBA22EDEAB42F3E0B9FFFFFEFFFFFFFFFFFFFFFFFF816D5A907F6DF1F0
              EDFFFFFFFFFFFFFFFFFFFEFEFEBCB1A6684F37EBE8E5FFFFFFFFFFFFFFFFFFF9
              EFDBE2B251DBA22EC08D2A69481D826E5AE8E4E0FFFFFFB5AA9E594024CEC6BE
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFEFDFDB8AD
              A15A4125D6CFC9FFFFFFE6E2DD674F36724F1DC6922BDBA22EE4B961FAF2E3FF
              FFFFFFFFFFFFFFFFD9D3CCE3DFDAFDFCFBFFFFFFFFFFFFFFFFFFFEFEFED8D2CB
              A59788FBFBFAFFFFFFFFFFFFFEFCF8ECCF94DBA535D39B2D8B63225F4529DED8
              D3FFFFFFFEFEFE79644E7C6852E9E6E2FFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFFFFFFE3DFDA6E58409C8D7CFEFEFDFFFFFFC0B6AB
              5C4327926923DBA22EDCA333EFD7A5FFFFFFFFFFFFFFFFFFFAF9F8CFC7BFC3BA
              B0FFFFFFFFFFFFFFFFFFF6F4F4E8E4E1F8F6F6FFFFFFFFFFFFFFFFFFFAF1DFE2
              B455DBA22EBA882A5F411CA39586FEFEFEFFFFFFE7E3DE573D21A39585FBF9F9
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFCFB
              FB92816E755F48EAE7E4FFFFFFF1EEEC8B7A665B3E1BCD972CDBA22EE0B04CFF
              FEFDFFFFFFFFFFFFF6F4F39989796E563FFFFFFFFFFFFFFFFFFFCCC4BC5C4227
              D0C8C0FFFFFFFFFFFFFFFFFFF3DFB7DAA22FDBA22E7E582052381B644C326952
              3869523861482E52371B60472C695238695238695238695238674F35583E2359
              40246D563E6D563E6D563E6D563E6D563E61492F553B1F6E583F79644E79644E
              69523953381C8C6522DAA12EDBA22EF7EACFFFFFFFFFFFFFFFFFFFECE9E6F1EE
              ECFFFEFEFFFFFFFFFFFFE5E1DDBDB2A7EFECE9FFFFFFFFFFFFFFFFFFE8C47ADB
              A22ED59D2D5D3F1D78634D988877988877988877664E3560472C907F6C958573
              9585739585739585738E7D6A664E34674F369888779888779888779888779888
              7798887753391C735E469787769888779888776D573E6F4E1ECF982CDBA22EEC
              CE91FFFFFFFFFFFFFFFFFFF1EFECBEB3A8D8D2CBFFFFFFFFFFFFEAE6E2F6F5F4
              FFFFFFFFFFFFFFFFFFFFFFFFDEAA42DBA22EB886285D4429BCB2A6F7F6F4F7F6
              F4F5F4F27B675177624BEFEDEAF6F4F2F6F4F2F6F4F2F6F4F2E5E1DD826F5983
              705CF7F6F4F7F6F4F7F6F4F7F6F4F7F6F4F7F6F45F462C9C8C7CF3F1EFF7F6F4
              F7F6F4A99C8D61431BB68528DBA22EE3BA63FEFBF5FFFFFFFFFFFFE3DFDA715C
              43A79A8BFFFFFFFFFFFF715C43978776F5F4F3FFFFFFFFFFFFFCF9F2DBA22EDB
              A22E966C236D573FE1DDD7FFFFFFFFFFFFF4F3F177624C86735FFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF735D47958572F5F4F3FFFFFFFFFFFFDBD5D0563A1AA07425DBA22EE1
              B255FAF3E4FFFFFFF4F3F1B5A99D745F47705942A99B8DEEEBE9BCB2A7D3CCC5
              FCFCFBFFFFFFFFFFFFFAF1DFDBA22EDBA22E896221756049F0EEEBFFFFFFFFFF
              FFEBE8E5725D45978775FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84715D8B7966F1EEECFFFFFF
              FFFFFFF3F1EF523719976D23DAA12EE1AF4EF8ECD5FFFFFFBAAEA35F472C7E6A
              5586735F5D4529A49686F3F1EFF9F8F7FFFFFFFFFFFFFFFFFFF6E8CBDBA22EDB
              A22E7B581F7A654FF9F9F8FFFFFFFFFFFFE2DDD86E573FA7998BFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF958472826F59ECE9E6FFFFFFFFFFFFFDFDFD563B1F8F6622D79F2DDF
              AD47F5E6C8FFFFFF7F6B567B6751DDD8D3E7E3E0897763654E35533A1DA59687
              FDFCFCFFFFFFFFFFFFF6E8CBDBA22EDBA22E7C58207A654FF9F9F7FFFFFFFFFF
              FFE2DDD96E573FA7998BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948472826F5AECE9E6FFFFFF
              FFFFFFFDFDFD553B1F8F6622D79F2DDFAD47F5E6C8FFFFFF8A78637B6751DED9
              D3E6E2DF897663745F46A7998BCFC8C0FEFDFDFFFFFFFFFFFFF9F1DFDBA22EDB
              A22E896221756048F0EEEBFFFFFFFFFFFFEBE8E5725D46968675FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF83705C8C7A66F1EEECFFFFFFFFFFFFF2F1EF523719986D23DAA12EE1
              AF4EF8EDD6FFFFFFC3BAB0634B317F6C5684725D60482DB5A99DFCFCFCFBFAF9
              FEFEFDFFFFFFFFFFFFFCF9F2DBA22EDBA22E976C246D573EE1DCD7FFFFFFFFFF
              FFF4F3F277624C85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF735D46958573F5F4F3FFFFFF
              FFFFFFDBD5D0563A1AA07425DBA22EE1B254FAF3E3FFFFFFF6F4F3BEB4A9654D
              33634A31B8ADA1F2F1EF927F6D7F6C58EBE8E4FFFFFFFFFFFFFFFFFFDEAA42DB
              A22EB886285D4429BCB2A6F7F5F4F7F5F4F5F4F27B675177634BF0EFECF7F5F4
              F7F5F4F7F5F4F7F5F4E6E2DE826F5A83705CF7F5F4F7F5F4F7F5F4F7F5F4F7F5
              F4F7F5F45F462B9C8C7CF3F1EFF7F5F4F7F5F4A99C8D62431CB68528DBA22EE3
              BA63FDFAF5FFFFFFFFFFFFFEFEFEFDFDFCF2F0EDFFFFFFFFFFFFC4BAB0B4A99D
              F2F0EEFFFFFFFFFFFFFFFFFFE8C47ADBA22ED59D2D5D401D78634C9787769787
              76978776654E3460472D92816F978776978776978776978776907F6D664E3566
              4E3597877697877697877697877697877697877653381B735D46978775978776
              9787766D563E704E1ECF992CDBA22EEBCE91FFFFFFFFFFFFFFFFFFE1DDD7B4A9
              9CEFECEAFFFFFFFFFFFFFBFAFAF2F0EEF6F4F3FFFFFFFFFFFFFFFFFFF3DFB6DA
              A22FDBA22E7E59205136196F59417A654E7A654E6F594052381B624A306E563F
              6E563F6E563F6E563F6B533B5A40245940246E563F6E563F6E563F6E563F6E56
              3F624A3053391D624A3069523969523960472D52371A8D6522DAA12EDBA22EF7
              E9CFFFFFFFFFFFFFFFFFFFBAB0A45C4328ECEAE7FFFFFFFFFFFFE6E2DD76614B
              A49687FFFFFFFFFFFFFFFFFFFAF0DFE2B455DBA22EBA892A5F411B91806DFDFD
              FDFFFFFFF4F2F05B4227A29485FBF9F9FFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFB92826F735D46E8E4E1FFFFFFF3F1EF
              907F6D5C3F1BCD972CDBA22EE0B04CFFFFFEFFFFFFFFFFFFFDFDFCFAF9F8F0ED
              EAFFFFFFFFFFFFFFFFFFF5F3F2C3BBB0D1CAC2FFFFFFFFFFFFFFFFFFFEFBF7ED
              D095DBA534D39C2D8B6322593F21D5CFC8FFFFFFFFFFFF8976627B6751E9E5E1
              FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFE4E0
              DB6F59419A8A79FDFDFDFFFFFFC3B9B05E4529926A23DBA22EDCA534F0D7A6FF
              FFFFFFFFFFFFFFFFE8E4E0A59788DCD7D1FFFFFFFFFFFFFFFFFFFFFFFFFEFEFD
              EBE7E4E3DED9FFFFFFFFFFFFFFFFFFF9EFDBE0B250DBA22EC18D2A69481D7C68
              52E3DFDAFFFFFFC2B8AE5B4226CDC5BDFFFFFFFFFFFFFFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFFFFFFFEFEFEBBB0A45B4226D4CEC6FFFFFFE8E5E2695239
              724F1EC6922BDBA22EE4B961F9F2E3FFFFFFFFFFFFFFFFFFD8D2CC705942D1CA
              C3FFFFFFFFFFFFFFFFFFFFFFFFF2F0ED7D69548E7F6CFAF9F9FFFFFFFFFFFFFF
              FFFFF2DCB0DCA534DBA22EBF8C2A5E401C7F6B56DBD6D0EAE6E37F6B56715C43
              F5F3F2FFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFE0DCD7745F
              477B664FFCFBFBDBD5D0755F486D4C1DBE8B2ADBA22EDEAB42F3DFB9FFFFFEFF
              FFFFFFFFFFF6F4F2EFECE9FBFAF9FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              CDC5BDD7D0CAFAF9F8FEFEFDFFFFFFFFFFFFFEFDFAE8C47BDBA230DBA22EA779
              2765461D756049D1CAC3C4BAB062492FAEA294F9F9F8FFFFFFEDEBE885725D85
              735FFFFFFFFFFFFFFCFCFB9A8A79664E34CDC6BDC4BBB2735E4766481EB68529
              DAA12EDAA12FEED29AFDFBF6FFFFFFFFFFFFFEFEFEB3A79A958573EEEBE8FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C99F9181E9E6E2FFFFFFFF
              FFFFFFFFFFFAF1E1E4BA67DAA22FD79F2DB2832867471D6951399A8A7A877460
              624A2FB7ACA1FAF9F8EDEBE885725D85735FFFFFFFFBFAFAB0A4975D44298E7C
              699C8D7C624A306E4D1EB68629DAA12EDBA22EE5BE6EFDFAF4FFFFFFFFFFFFFF
              FFFFFEFEFEC9C1B89B8B7AF7F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFD3CCC5897661E0DBD6FFFFFFFFFFFFFFFFFFFFFFFFFAF2E2E8C275DBA2
              30DBA22ECF982C88612261431C543A1C513619563C2092816EC8C0B77D69527D
              6A55CEC7BF8C7A67573D2052381B573C1E63441C966C24CE982CDBA22EDDA538
              E9C57DFCF6EAFFFFFFFFFFFFFFFFFFF1EFECC8BFB7EBE8E4FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F8F4F2F1EDE9E7CFC7BFFD
              FDFDFFFFFFFFFFFFFFFFFFFCF7EDE9C57FDCA537DBA22ED69E2DB686298E6622
              6D4C1D573B1A5136195B41265B41265C42275A4025513619573B1973501E9067
              23B98729DAA22EDBA22EDCA635EED29AFCF6ECFFFFFFFFFFFFFFFFFFFFFFFFD5
              CEC86D553EC8C0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFDFDFC9F8F8077614BE1DBD7FFFFFFFFFFFFFFFFFFFFFFFFFCF7
              EEF0D8A7E0AE4ADBA22EDBA22ED59E2DC6922BB68429A074258F6623835D2183
              5D21926923A17425B78628C9942BD69E2DDBA22EDAA12FE0B250F1DBAFFEFBF7
              FFFFFFFFFFFFFFFFFFFFFFFFE7E4DFF3F1EFD2CBC3F1EFECFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E7C5BCB2F3
              F1EFDEDAD3F7F6F4E4E0DCD8D2CCE6E2DEFAF9F8FEFCF6EDD096E1B355DEA83D
              DAA22FDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDAA22FDEA9
              3EE2B355F0D9ABFDFAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEC7BE654D33CA
              C3B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFDFCBDB3A86D563EAEA295725D455A40257661
              4ABBB1A5F9F7F6FFFEFCFAF1E1F3DFB7EACA87E4B963E0B151DDAB41DBA434DC
              A635DFAB45E0B151E4B963EBCE90F3E0B9FAF3E4FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFAF9F8D8D2CCE9E6E2AB9E90EBE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE4
              DFDBA7988B5C43277A654EBAAFA37E6A55675138DED9D3FFFFFFFFFFFFFFFFFF
              FDFBF7FAF3E5F9F0DDF7ECD4F7EACFF7E9CFF8EDD6F9EFDCFAF3E5FEFDFAFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2A69976614AD6D0C9FAF9F9FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CAC25D4429C0B7ACFFFFFFD6CF
              C95A4125CBC4BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFAC2B8AE
              D6D0C9EAE6E3B5AA9DFAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFE9E5E25C4227978776DCD7D1A39586543A1ECFC8C0FEFEFEFFFFFEFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFE1DCD7E0DBD6F5F4F26B553BB0A496FBFBFAFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD9C8B7B5C43276B543B5A41
              276B523ADCD8D2CBC3BBA59788F0EEEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFEEEBE8E3DEDAFBFBFA8C7B688E7E6AEFECE9DAD5CF
              EEEBE8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFAF9F9D8D2CBB5AA9DDFDBD5FCFCFCFEFEFEA89B8C958573EDEAE6
              9E8E7D8C7A67ECE9E6C3B9AEAEA194F0EDECB9AEA2A39585EFEDEB8C7A678874
              60EDEAE7D6D0C8D8D2CBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFBFBFAF2F0EEFCFCFBB9ADA1ADA092F1EEECB0A396928070EA
              E7E4B5AA9D9E9080EEEBE9D4CDC6CCC4BBF7F5F4FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FBFAF9F7F6F4FEFDFDF1EFEDECE9E6FCFBFAF4F2F0F0EEECFCFCFBFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Layout = blGlyphTop
            ParentFont = False
            OnClick = btnInutilizarClick
          end
          object btnFechar: TSpeedButton
            Left = 111
            Top = 13
            Width = 80
            Height = 66
            Caption = 'Fechar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Glyph.Data = {
              361B0000424D361B000000000000360000002800000030000000300000000100
              180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFEF5F3EEE3DCCED5CAB5C9BBA0C0B091BBA987B9
              A784B9A784BBA987C0B091C8BBA0D0C6B1D7D1C5F0EEE9FEFEFEFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F2DDD5C4C5B699B9A784
              B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B5A3819A8C
              6F93856A95876BA69A83CBC4B7F3F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3
              EFD3C8B2BBA987B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8
              A683B9A784B8A683B4A280998B6D93856A93856A94866A93856A94866A978A6F
              BDB4A2F0EEEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFCFBFADAD1BFBBA987B9A784B9A784B9A784B9A784B9A784
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B3A280988A6D94866A9486
              6A94866A94866A94866A94866A94866A94866A97896EC7BFB1FAF9F8FFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EDE6C3B497B9A784B8A6
              83B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8
              A683B2A17F97896D93856A94866A93856A93856A94866A93856A94866A93856A
              93856A94866A93856AA59982E9E6E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFE5DFD2BCAA89B8A683B9A784B8A683B8A683B8A683B9A784B8A683B8A683
              B9A784B8A683B8A683B9A784B8A683B1A07F96886B93856A93856A94866A9385
              6A93856A94866A93856A94866A93856A93856A94866A93856A93856A988A6FD8
              D2C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED6C5BAA885B9A784B9A784B9A784B9A7
              84B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784AF9E7D96
              876B94866A94866A94866A94866A94866A94866A94866A94866A94866A94866A
              94866A94866A94866A94866A94866A95876BCCC5B8FFFFFEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED6C5B8
              A683B8A683B9A784B8A683B9A784B8A683B8A683B8A683B9A784B8A683B8A683
              B9A784B8A683B8A683AE9D7C95876C93856A94866A93856A93856A94866A9385
              6A93856A94866A93856A94866A93856A93856A94866A93856A93856A94866A93
              856A93856ACCC5B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFE5DFD2BAA885B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683B8A683B9A784B8A683B8A683B9A784B8A683AC9C7C95866A93856A93
              856A94866A93856A93856A94866A93856A93856A94866A93856A94866A93856A
              93856A94866A93856A93856A94866A93856A93856A95876BD8D2C8FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EDE6BCAA89B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784
              B9A784AB9A7A94866A94866A94866A94866A94866A94866A94866A94866A9486
              6A94866A94866A94866A94866A94866A94866A94866A94866A94866A94866A94
              866A94866A94866A988A6FE9E6E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFCFBFAC3B497B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683B8A683B9A784B8A683B8A683A9997894866BA0947CB7AE9BC7BFB1CE
              C7BBCEC8BBC7BFB1B7AE9BA1947C94866B93856A94866A93856A94866A93856A
              93856A94866A93856A93856A94866A93856A93856A94866A93856AA59981FAF9
              F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD1BFB9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B8A683AA9A7B
              BFB6A6E9E6E0FDFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCE9E6
              E1BFB6A596896D94866A94866A94866A94866A94866A94866A94866A94866A94
              866A94866A94866A94866A94866AC7BFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              F6F3EFBBA987B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683B8A683B9A784C6BAA3F1F0ECFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
              FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEF1F0ECB5AB9894866A93856A
              93856A94866A93856A93856A94866A93856A93856A94866A93856A93856A9789
              6EF0EEEBFFFFFFFFFFFFFFFFFFFFFFFFD3C8B2B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683B9A784B8A683B8A683BAA885E0D8C9FEFEFEFEFEFE
              FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
              FEFEFEFEFFFFFFFEFEFDD1CBBF95876D93856A94866A93856A93856A94866A93
              856A93856A94866A93856A93856A94866ABCB3A2FFFFFFFFFFFFFFFFFFF7F6F2
              BBA987B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A6
              83BAA885E7E1D5FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
              FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFDBD6CD
              95876D94866A93856A93856A94866A93856A93856A94866A93856A93856A9486
              6A978A6FF3F2EFFFFFFFFFFFFFDDD5C4B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784E0D8C9FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CBBF94866A94866A94866A94866A94
              866A94866A94866A94866A94866A94866A94866ACBC4B7FFFFFFFEFEFEC5B699
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784CEC2
              AAFEFEFEFEFEFEFFFFFFFEFEFEFEFDFDF4F3F0FEFEFEFEFEFEFFFFFFFEFEFEFE
              FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEF4F3F0FEFDFDFEFEFEFFFFFFFEFEFE
              FEFEFDB5AB9893856A93856A94866A93856A93856A94866A93856A93856A9486
              6A93856AA69A83FEFEFEF5F3EEB9A784B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683BAA987F6F4EFFEFEFEFEFEFEFFFFFFFEFDFDB3A996
              95876BB7AE9BFBFBFAFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFBFBFAB7AE
              9B95876DB3AA96FEFDFDFFFFFFFEFEFEFEFEFEF1F0EC96896E93856A94866A93
              856A93856A94866A93856A93856A94866A93856A95876BEFEDE9E3DCCEB9A784
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784D5CAB5FFFF
              FFFFFFFFFFFFFFFFFFFFF4F3F095876C94866A94866AB4AA96FBFBFAFFFFFFFF
              FFFFFFFFFFFFFFFFFBFBFAB4AA9694866A94866A95876CF4F3F0FFFFFFFFFFFF
              FFFFFFFFFFFFBFB6A694866A94866A94866A94866A94866A94866A94866A9486
              6A94866A94866AD5CFC3D5CAB5B8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B9A784F1EDE6FEFEFEFEFEFEFEFEFEFFFFFFFEFEFEBAB19F
              94866A93856A93856AB4AB97FBFAFAFEFEFEFFFFFFFBFAFAB4AB9794866A9385
              6A93856ABAB19FFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFE9E6E194866B94866A93
              856A93856A94866A93856A93856A94866A93856A94866BC6BDAAC9BBA0B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784C1B193FEFDFDFEFE
              FEFEFEFEFEFEFEFFFFFFFEFEFEFCFCFCB8AE9C93856A93856A94866AB4AB97FB
              FBFAFBFBFAB4AB9793856A94866A93856AB8AE9CFCFCFCFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFFDFDFCA1957D94866A93856A93856A94866A93856A93856A9486
              6A94866BA79778C7BA9FC0B091B9A784B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784D0C4ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FCFCFCB8AF9D94866A94866A94866AB4AA96B4AA9694866A94866A94866AB8AF
              9DFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8AE9C94866A94
              866A94866A94866A94866A94866A94866AA79777B9A784C0B091BBA987B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784DAD1BFFFFFFFFEFE
              FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFCFCFBB8AF9D94866A93856A93
              856A94866A93856A93856AB8AF9DFCFCFBFEFEFEFFFFFFFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFFEFEFEC7C0B194866A93856A93856A94866A93856A94866BA696
              76B8A683B8A683BAA886B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784DFD7C7FFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
              FFFFFFFEFEFEFCFCFCB8AE9C93856A93856A94866A93856AB8AE9CFCFCFCFEFE
              FEFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFECEC8BB94866A93
              856A93856A94866A94866BA69577B8A683B8A683B8A683B8A683B9A784B9A784
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784DFD7C7FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCB8AE9C94866A94
              866A94866A94866AB8AE9CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFCEC8BB94866A94866A94866A94866AA49475B8A683B9A7
              84B9A784B9A784B9A784BBA987B8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784DAD1BFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFE
              FFFFFFFCFCFBB8AF9D94866A93856A93856A94866A93856A93856AB8AF9DFCFC
              FBFEFEFEFFFFFFFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEC7C0B194866A93
              856A94866BA49475B8A683B8A683B9A784B8A683B8A683BAA886C0B091B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784D0C4ADFFFFFFFEFE
              FEFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFCFCFCB8AF9D94866B94866A93856AB8
              AE9CB8AE9C93856A93856A94866AB8AF9DFCFCFCFFFFFFFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFFEFEFEB8AE9C94866A93856AA39375B8A683B8A683B8A683B9A7
              84B8A683B8A683C0AF90C9BBA0B9A784B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784C1B193FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
              B8AE9C94866A94866A94866AB8AF9DFCFCFCFCFCFCB8AF9D94866A94866A9486
              6AB8AE9CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCA1957C94866AA3
              9374B8A683B9A784B9A784B9A784B9A784B9A784B9A784C9BBA0D5CAB5B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B9A784F1EDE6FEFE
              FEFEFEFEFEFEFEFFFFFFFEFEFEBAB19E94866A93856A93856AB7AD9AFCFCFBFE
              FEFEFFFFFFFCFCFBB5AC9894866A93856A93856ABAB19FFEFEFEFFFFFFFEFEFE
              FEFEFEFFFFFFE9E6E194866BA29374B8A683B8A683B9A784B8A683B8A683B9A7
              84B8A683B8A683D4C9B4E3DCCEB8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683D5CAB5FEFEFEFEFEFEFEFEFEFFFFFFF4F3F095876D
              94866A93856AB3AA96FBFBFAFEFEFEFEFEFEFFFFFFFEFEFEFBFBFAB4AA969385
              6A93856A95876CF4F3F0FFFFFFFEFEFEFEFEFEFFFFFFBFB6A6A19274B8A683B8
              A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683E3DCCEF5F3EEBAA885
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784BAA987F6F4
              EFFFFFFFFFFFFFFFFFFFFEFDFDB3AA9695876CB7AE9BFBFBFAFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFBFBFAB7AE9B95876CB4AA96FEFDFDFFFFFFFFFFFF
              FFFFFFF1F0ECA49577B8A683B9A784B9A784B9A784B9A784B9A784B9A784B9A7
              84B9A784BAA885F5F3EEFEFEFEC5B699B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683B9A784CEC2AAFEFEFEFEFEFEFFFFFFFEFEFEFEFDFD
              F4F3F0FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
              FEF4F3F0FEFDFDFEFEFEFFFFFFFEFEFEFEFEFDC1B6A0B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683B8A683B9A784B8A683C5B699FEFEFEFFFFFFDDD5C4
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A7
              84E0D8C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              DCD5C6B8A683B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A7
              84B9A784DDD5C4FFFFFFFFFFFFF7F6F2BBA987B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683B9A784B8A683BAA885E7E1D5FFFFFFFEFEFEFEFEFE
              FFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
              FEFEFEFEFFFFFFFEFEFEFFFFFFE5DFD4B9A785B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683B8A683B9A784BBA987F7F6F2FFFFFFFFFFFFFFFFFF
              D3C8B2B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683BAA885E0D8C9FEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFE
              FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEE0D8C9B9A785
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A7
              84D3C8B2FFFFFFFFFFFFFFFFFFFFFFFFF6F4EFBBA987B9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784CEC1A9F6F3EF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF6F4EFCEC2A9B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784BBA987F6F4EFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFDAD1BFB8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683B8A683B9A784B8A683BAA987D5CAB5F0EDE6FDFDFDFFFFFFFEFEFEFE
              FEFEFFFFFFFEFEFEFEFEFEFDFDFDF0EDE6D5CAB5BAA987B8A683B9A784B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683DAD1
              BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAC3B497B8A683B9A784B8
              A683B8A683B9A784B8A683B9A784B8A683B8A683B8A683B9A784B8A683B8A683
              B9A784B9A784C1B192D0C4ACDAD1BEDFD6C7DFD7C7DAD1BED0C4ACC1B192B9A7
              84B8A683B9A784B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683B9A784B8A683C3B497FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFF1EDE6BCAA89B9A784B9A784B9A784B9A784B9A784B9A784B9A7
              84B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784BCAA89F1EDE6FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5DFD2BAA885B8
              A683B8A683B9A784B8A683B9A784B8A683B8A683B8A683B9A784B8A683B8A683
              B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A6
              83B8A683B9A784B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8
              A683B8A683BAA885E5DFD2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFDED6C5B8A683B8A683B9A784B8A683B9A784B8A6
              83B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8
              A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A683
              B8A683B9A784B8A683B8A683B9A784B8A683B8A683DED6C5FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
              D6C5BAA885B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784
              B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A7
              84B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784BA
              A885DED6C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5DFD2BCAA89B8A683B9A784B8A6
              83B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8
              A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B9A784B8A683
              B8A683B9A784B8A683B8A683BCAA89E5DFD2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF1EDE6C3B497B9A784B8A683B8A683B8A683B9A784B8A683B8A683
              B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A6
              83B8A683B9A784B8A683B9A784B8A683B8A683B9A784B8A683C3B497F1EDE6FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADAD1BFBBA9
              87B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9
              A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784B9A784
              B9A784BBA987DAD1BFFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3EFD3C8B2BBA987B9A784B8A683B8A683
              B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A683B8A683B9A784B8A6
              83B8A683B9A784B8A683B9A784BBA987D3C8B2F6F4EFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFF7F6F2DDD5C4C5B699B9A784B9A784B8A683B8A683B9A784B8A683B8
              A683B9A784B8A683B8A683B9A784B8A683B8A683BAA885C5B699DDD5C4F7F6F2
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F2ED
              E3DCCED4C9B4C8BBA0C0B091BAA886B8A683B9A784BAA886C0AF90C9BBA0D4C9
              B4E3DCCEF5F3EEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Layout = blGlyphTop
            ParentFont = False
            OnClick = btnFecharClick
          end
        end
      end
    end
    object TabGerar: TTabSheet
      Caption = 'Gerar PDF / XML'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnGerar: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 248
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object BitBtn1: TBitBtn
          Left = 25
          Top = 185
          Width = 89
          Height = 33
          Caption = 'Gerar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 231
          Top = 185
          Width = 90
          Height = 33
          Caption = 'Sair'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 231
          Width = 574
          Height = 17
          Align = alBottom
          TabOrder = 2
        end
        object memLista: TListBox
          Left = 18
          Top = -13
          Width = 111
          Height = 187
          ItemHeight = 15
          TabOrder = 3
          Visible = False
        end
        object GroupBox2: TGroupBox
          Left = 21
          Top = 15
          Width = 551
          Height = 161
          Caption = 'Enviar Email'
          TabOrder = 4
          object Label14: TLabel
            Left = 16
            Top = 21
            Width = 87
            Height = 15
            Caption = 'E-Mail Contador'
          end
          object Label15: TLabel
            Left = 16
            Top = 64
            Width = 42
            Height = 15
            Caption = 'Arquivo'
          end
          object Label16: TLabel
            Left = 16
            Top = 106
            Width = 99
            Height = 15
            Caption = 'Caminho Relat'#243'rio'
          end
          object edtArquivo: TEdit
            Left = 16
            Top = 79
            Width = 514
            Height = 21
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object edtRelatorio: TEdit
            Left = 16
            Top = 125
            Width = 514
            Height = 21
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
          end
          object edtEmail: TDBLookupComboboxEh
            Left = 16
            Top = 37
            Width = 514
            Height = 23
            DynProps = <>
            DataField = ''
            EditButtons = <>
            KeyField = 'EMAIL'
            ListField = 'EMAIL'
            ListSource = dsContador
            TabOrder = 0
            Visible = True
          end
        end
        object Button1: TButton
          Left = 120
          Top = 185
          Width = 105
          Height = 33
          Caption = 'Enviar E-mail'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = Button1Click
        end
      end
    end
    object tabDocumentos: TTabSheet
      Caption = 'Importar Documentos'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label18: TLabel
        Left = 208
        Top = 25
        Width = 44
        Height = 15
        Caption = 'Numero'
      end
      object Label19: TLabel
        Left = 51
        Top = 23
        Width = 23
        Height = 15
        Caption = 'Tipo'
      end
      object DBText4: TDBText
        Left = 296
        Top = 206
        Width = 121
        Height = 17
        DataField = 'TTOTAL'
        DataSource = dsDocumento
      end
      object edtNumero: TEdit
        Left = 208
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object DBGrid3: TDBGrid
        Left = 51
        Top = 80
        Width = 366
        Height = 120
        DataSource = dsDocumento
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnKeyDown = DBGrid3KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Total'
            Width = 101
            Visible = True
          end>
      end
      object btnTransmitirLote: TButton
        Left = 51
        Top = 206
        Width = 75
        Height = 25
        Caption = 'Transmitir'
        TabOrder = 4
        OnClick = btnTransmitirLoteClick
      end
      object btnAdicionar: TButton
        Left = 342
        Top = 36
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 2
        OnClick = btnAdicionarClick
      end
      object cbTipo: TComboBox
        Left = 51
        Top = 40
        Width = 145
        Height = 23
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'OR'#199'AMENTO'
        Items.Strings = (
          'OR'#199'AMENTO'
          'PEDIDO')
      end
      object btnSair: TButton
        Left = 132
        Top = 206
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 5
        OnClick = btnSairClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 505
    Width = 1194
    Height = 98
    Align = alBottom
    Color = 15724527
    ParentBackground = False
    TabOrder = 4
    ExplicitLeft = -4
    ExplicitTop = 510
    object btnPDF: TSpeedButton
      Left = 665
      Top = 1
      Width = 80
      Height = 96
      Align = alLeft
      Caption = 'F11 | Gerar PDF'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000D70D0000D70D00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFAF5EFF4ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5EC
        E0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5
        ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0
        F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5ECE0F5EDE0FBF9F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EEE3D5AF78C89B57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57CA9C5BDEC198F6EEE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7F2
        D8B788C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99C59E0C59FFCF9
        F5FFFFFFFFFFFFFFFFFFFFFFFFF2E7D8CFA76DC99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57CEA66BF5ECDFFFFFFFFFFFFFFFFFFFFFFFFFF2E7D6
        D0A66CC99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57ECDC
        C5FFFFFFFFFFFFFFFFFFFFFFFFF7F1E7D3AD76C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57E2C8A5FFFFFFFFFFFFFFFFFFFFFFFFFEFDFB
        D6B582C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57D7B5
        84FFFFFFFFFFFFFFFFFFFEFDFBFFFFFFE1C8A5C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57CCA05FFEFDFCFFFFFFFFFFFFF6EDE2FFFFFF
        ECDCC5C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57F6EFE5FFFFFFFFFFFFEBDAC2FFFFFFF7F0E5C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57ECDCC6FFFFFFFFFFFFDFC29AFFFFFF
        FFFFFECCA263C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57E0C59EFFFFFFFFFFFFD7B380FDFBF8FFFFFFD7B582C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57D6B582FDFCFAFFFFFFD1AB74F6EFE5
        FFFFFFE2C8A2C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57D3AB75F7F1E8FFFFFFCEA467EEDFCBFFFFFFEEDFCAC89A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57D0A569EFE1CDFFFFFFCB9E5DE8D3B7
        FFFFFEF5EBDDCEA265C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57CA9E5EE9D5B9FFFFFFC89958E0C6A0FDFCF9F8F1E7D5B07AC99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C89958E1C6A3FDFDFAC99A57D8B786
        F9F4ECFBF8F4DEC095C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57D8B788FBF6EFC99A57D1AA71F5EDE1FFFEFDE4CCA8CA9A59C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57D2AB75F6EEE4C99A57CB9F5E
        F2E7D6FFFFFFEBD9C0CCA062C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57CC9F5FF3E8D9C99A57C99A57E7D3B5FFFFFFF4E9DAD0A86DC99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57E9D5BAC99A57C99A57
        DDBF95FFFFFFF9F5EED3AF78C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57DFC19AC99A57C99A57D3AC75FFFFFFFEFEFDD9BA8EC99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57D3AF79C99A57C99A57
        C89A57F8F1E8FFFFFFF3E8DBCC9E60C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57CCA161C99A57C99A57C99A57E4CCABFEFDFDFFFEFEE6D1B3D2
        AC77CB9C5BCA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5A
        CA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C
        5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA
        9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACA9C5ACCA263E1C6A0C99A57C99A57
        C99A57D0A76FF1E5D3FFFFFFFEFDFBF6EFE5F2E7D7F2E6D6F2E6D6F2E6D6F2E6
        D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2
        E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6
        F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6D6F2E6
        D6F2E6D6F3E9DBFBF7F2C99A57C99A57C99A57C99A57D0A56BEAD8BDFAF5EFFE
        FEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC99A57C99A57
        C99A57C99A57C99A57CB9D5DDABA8CEFE2CFFFFFFFFBF7F3ECDCC5E9D6BBE9D6
        BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9
        D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BBE9D6BB
        E9D6BBE9D6BBE9D6BBE9D6BBF4EBDDFFFFFFFAF6EFECDCC4E9D6BBE9D6BBEFE1
        CCFFFFFFFFFFFFFFFFFFC99A57C99A57C99A57C99A57C99A57C99A57C99A57E3
        CBA8FFFEFEF5EEE2D3AB75CC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5F
        CC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F
        5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FCC9F5FE6D1B1FF
        FFFFF3E8D9D1AB74CC9F5FCC9F5FE7D1B1FFFFFFFFFFFFFFFFFFC99A57C99A57
        C99A57C99A57C99A57C99A57C99A57E3CBA8FFFEFEF5EDE1D1A76FC99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57E5CEADFFFFFFF4EADCD6B180D2A971DDC097F9F3
        EDFFFFFFFFFFFFFFFFFFC89957C99A57C99A57C99A57C99A57C99A57C99A57E3
        CBA8FFFEFEF5EDE1D1A76FC99A57C99A57C99C59D1AB74D7B380D7B380D7B380
        D7B380D7B380D7B380D7B380D7B380D7B380D7B380D7B380D7B380D7B380D7B3
        80D7B380D7B380D7B380D7B380D5B17CCCA263C99A57C99A57C99A57E5CEADFF
        FFFFFCF9F5F4EADCF6EDE1FDFAF7FFFFFFFFFFFFFFFFFFFFFFFFCDA267C99A57
        C99A57C99A57C99A57C99A57C99A57E3CBA8FFFEFEF5EDE1D1A76FC99A57C99A
        57D8B98AF4EBDDF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8
        F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F2EAF8F1E8
        E6D2B5CCA263C99A57C99A57E5CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE3C9A5C99B5BC99A57C99A57C99A57C99A57C99A57E4
        CBA9FFFEFEF5EDE1D1A76FC99A57C89A58DDC095F8F2EAFCF9F4FCF9F4FCF9F4
        FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9F4FCF9
        F4FCF9F4FCF9F4FCF9F4FCF9F4FBF7F2ECDBC3CDA467C99A57C99A57E5CEADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4ECDFC49C
        D0A86DC99C59CA9C5ACA9C5ACA9C5AE3CAA9FFFEFEF5EDE1D1A76FC99A57C99A
        57CCA062D9B788DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DE
        BF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DEBF96DBBE92
        D2A971CA9A59C99A57C99A57E5CFAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F4F6EDE1F2E7D7F2E6D6F2E6D6F2E6D6F8
        F2EAFFFFFFF5EDE1D1A76FC99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57E5CEADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDE1D1A76FC99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57E5CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF5EDE1D1A76FC99A57C99A57C99A57CA9E5DCCA263CCA263CCA263
        CCA263CCA263CCA263CCA263CCA263CCA263CCA263CCA263CCA263CCA263CCA2
        63CCA263CCA263CCA263CCA263CB9F61CA9A59C99A57C99A57C99A57E5CEADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDE1D1A76FC99A57C99A
        57D4B07AEEDFCAF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3
        E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF3E9DBF2E7D8
        E0C7A1CA9D5DC99A57C99A57E5CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF5EDE1D1A76FC99A57C89A58DFC59EFCFBF8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEFE2CFCEA66BC99A57C99A57E5CEADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDE1D1A76FC99A57C99A
        57D0A66DE1C8A3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7
        D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E7D1B3E5CFAF
        D7B586CA9D5BC99A57C99A57E5CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF5EDE1D1A76FC99A57C99A57C99A57CA9A59C99B5BC99B5BC99B5B
        C99B5BC99B5BC99B5BC99B5BC99B5BC99B5BC99B5BC99B5BC99B5BC99B5BC99B
        5BC99B5BC99B5BC99B5BC99B5BC99C59C89A58C99A57C99A57C99A57E5CEADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDE1D1A76FC99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57E5CEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF5EDE2D1A871C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57E7D1B2FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6F0DCBD91C89A57C99A
        57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C9
        9A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57C99A57
        C99A57C99A57C99A57CCA263F1E5D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFCF8F0E7F4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDF
        F4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4EC
        DFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4ECDFF4EDE1FBF7F3FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnPDFClick
      ExplicitLeft = 326
      ExplicitTop = 5
      ExplicitHeight = 84
    end
    object btnWhats: TSpeedButton
      Left = 745
      Top = 1
      Width = 90
      Height = 96
      Align = alLeft
      Caption = 'Ctrl+E Enviar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        461E0000424D461E000000000000360000002800000031000000340000000100
        180000000000101E0000232E0000232E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F5F2B6C5B5879F856A886760805D5F80
        5D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F
        805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D5F805D
        5F805D5F805D5F805D5F805D6483617792759DB19CD6DFD6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F6F2
        93AE8E49763F4372394372394372394372394372394372394372394372394372
        3943723943723943723943723943723943723943723943723943723943723943
        7239437239437239437239437239437239437239437239437239437239437239
        437239437239437239437239668D5ECBD8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFD5E2D15A8B4C477E38477E38477E38477E38
        477E38477E38477E38477E38477E38477E38477E38477E38477E38477E38477E
        38477E38477E38477E38477E38477E38477E38477E38477E38477E38477E3847
        7E38477E38477E38477E38477E38477E38477E38477E38477E38477E38477E38
        477E38477E3893B38AFCFDFCFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFD0
        E0CA528F3D4C8B364C8B364C8B364C8B364C8B364D8D37569341569442569442
        5694425694425694425694425694425694425694425694425694425694425694
        4256944256944256944256944256944256944256944256944256944256944256
        9442569442569442518F3C4C8B364C8B364C8B364C8B364C8B364C8B3681AE72
        FCFDFCFFFFFFFFFFFF00FFFFFFFFFFFFE6EFE35692424C8B364C8B364C8B367A
        B27194CD998DD0987ECB8C7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A
        7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA
        8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A85
        CE9293D09B8DC38C5B984A4C8B364C8B364C8B369ABE8EFFFFFFFFFFFF00FFFF
        FFFFFFFF78A8684C8B364C8B3672AA678FD0997BC9897DCF896DD07A5BCD6952
        CB6051CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F
        51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA5F51CA
        5F51CA5F51CA5F51CA5F51CA5F51CA5F54CB6263CF7077D1837CCB8B80CB8E90
        C791518F3C4C8B364D8C37D5E4CFFFFFFF00FFFFFFCDDFC74C8B364C8B368BC1
        897ECA897CD08744C7531BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1B
        BB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB
        2D1BBB2D1BBB2D1BBB2D1BBB2D25BE3669D0757DCC888FD098609B4F4C8B3677
        A766FFFFFF00FFFFFF86B1774C8B368DC38C7BC9876BCF771CBC2E1BBB2D1BBB
        2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1B
        BB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB
        2D1BBB2D1BBB2D3BC54B7CCD898ACE945D994B4C8B36E3EDE000FDFEFC569141
        7AB1707AC98568CF741BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB
        2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1B
        BB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D31C2
        417CCD8790CF974D8C37B0CCA600E5EFE2508E3B88CE9178D0831BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB
        2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1B
        BB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D46C85579C98385BC808FB6
        8100D5E4D086BD8278C98235C3451BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB
        2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1B
        BB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D1BBB2D
        1BBB2D1BBB2D1BBB2D1BBB2D74D07F87CD8F7FAC6F00D1E1CB8ECE9376D0811B
        BA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1EBB30
        1EBB301BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA
        2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1B
        BA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D1BBA2D
        3FC54E76C78099C59300D4E4CF78C8815BCC681CBA2E1CBA2E1CBA2E1CBA2E1C
        BA2E1CBA2E1CBA2E1CBA2E1CBA2E3BC14B30B03F31B04056C46222BC331CBA2E
        1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1C
        BA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E79CB82A5D5A700DBEE
        DB74C67D3EC44D1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1C
        BA2E8DDA95B8E4BD5FC26A20A93038B34653C4601FBB311CBA2E1CBA2E1CBA2E
        1CBA2E1DBB2F2DBE3E33BF432CBE3D1DBB2F1CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1C
        BA2E1CBA2E1CBA2E1CBA2E77CF809FD7A400DCF1DD73C57B3AC44A1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E2BBF3CFFFFFFFFFFFFFFFFFFCA
        EBCE54BD6120A9303DB54B4FC45D39C14957C36345B95327AC3720A93020A930
        20A9302BAE3A4ABB5756C46332C0421CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E72
        CF7C98D59E00DBF0DD72C57A5ED06A65D2711FBB311CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1DBB2FEEFAEFFFFFFFFFFFFFFFFFFFFFFFFFBDE6C248B95520
        A93033B14272C97CA2DBA8C0E7C5CDECD1C9EBCDB4E2B98ED49654BD6121AA31
        25AB3454C1612FBF3F1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E71CF7B97D49D00DBF0DC72C578
        54CD6047C95460D16C52CC5F1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2EB0E7
        B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFECEEDD2FBFEFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5F5E785D08D27AC362EAF3D4EC45C
        1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E71CF7A97D49B00DBF0DC71C47754CD6047C95447C95447C954
        6BD47639C4481CBA2E1CBA2E1CBA2E1CBA2E71D47CFFFFFFFFFFFFAFE0B5D1EE
        D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FDF8E7F8E9EAF9ECFEFFFEFF
        FFFFFFFFFFFFFFFFFFFFFFE2F4E455BE6121AA3155C4621CBA2E1CBA2E1CBA2E
        1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E71CE7A96D4
        9A00DAF0DC70C47554CD6047C95447C95447C95447C9544DCB5A6AD37626BE37
        1CBA2E1CBA2E32C142FFFFFFFFFFFFB7E3BC4DBC5A63D070D9F4DCFFFFFFD3F2
        D679D6833AC34A1DBB2F1CBA2E1CBA2E24BD3554CB629FE2A7F4FCF5FFFFFFFF
        FFFFFCFEFC7CCD8521AA3152C45F1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E
        1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E70CE7995D49900DAF0DB6FC37454CD6047
        C95447C95447C95447C95447C95447C95459CF655DCF691DBB2F1CBA2ED5F2D8
        FFFFFFF1FAF22BAE3B23BC341EBB3048C8571CBA2E1CBA2E1CBA2E1CBA2E1CBA
        2E1CBA2E1CBA2E1CBA2E1CBA2E2EC03FA8E5AFFFFFFFFFFFFFFFFFFF7BCC8427
        AC373DC14C1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E1CBA2E
        1CBA2E70CE7994D39800DAF0DB6EC37254CD6047C95447C95447C95447C95447
        C95447C95447C95447C95466D27147C75595DF9EFFFFFFFFFFFF56BE6336C046
        1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB9
        2E1CB92E1CB92E71D47DFCFEFCFFFFFFFDFEFD57BE6347B9541DBA2F1CB92E1C
        B92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E6FCE7994D39700DAF0
        DB6DC27154CD6047C95447C95447C95447C95447C95447C95447C95447C95447
        C95449CA56A6E6ADFFFFFFFFFFFF97DEA01CB92E1CB92E1CB92E1CB92E1CB92E
        1CB92E1CB92E1CB92E24BB3656C36339B34733B14256C26323BC351CB92E71D4
        7DFFFFFFFFFFFFE3F5E528AD384CC45A1CB92E1CB92E1CB92E1CB92E1CB92E1C
        B92E1CB92E1CB92E1CB92E6FCD7893D29600D9F0DA6CC26F54CD6047C95447C9
        5447C95447C95447C95447C95447C95447C95447C95450CC5DF1FBF2FFFFFFF9
        FEF93EC44E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E4BC3593FB64D
        82CF8BA6DDAC71C97B21AA313FB64D2DBD3E1CB92EA7E4AEFFFFFFFFFFFF88D1
        914EBD5B1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E6F
        CD7792D29400D9F0DA6BC26E54CD6047C95447C95447C95447C95447C95447C9
        5447C95447C95447C95494E09BFFFFFFFFFFFFBAE4C17DCC8B5ECA6C1CB92E1C
        B92E1CB92E1CB92E1CB92E57C46376CA80EBF8EDFFFFFFFFFFFFFFFFFFCAEBCE
        36B24456C2631CB92E2DBE3DF2FBF3FFFFFFE8F6E928AD3825BC371CB92E1CB9
        2E1CB92E1CB92E1CB92E1CB92E1CB92E1CB92E6FCD7791D29400D9EFD96AC16C
        54CD6047C95447C95447C95447C95447C95447C95447C95447C95447C954D4F3
        D7FFFFFFFBFEFB8AD0956DC47C6DC47C85D09141C3511DB92F1DB92F5CC568B8
        E4BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDECD04EC35C1DB92F1DB92F
        9CE1A4FFFFFFFFFFFF59BF6548C3561DB92F1DB92F1DB92F1DB92F1DB92F1DB9
        2F1DB92F1DB92F6FCD7791D19200D9EFD969C16B54CD6047C95447C95447C954
        47C95447C95447C95447C95447C9544FCC5BFDFFFDFFFFFFCFEBD279C9876EC5
        7D6EC57D6EC57D72C78180D18C60C96DD2EED5FFFFFFFFFFFFFFFFFFFEFFFEFF
        FFFFFFFFFFFFFFFFDBF4DE1DB92F1DB92F1DB92F51C95FFFFFFFFFFFFF93D69A
        54C4611DB92F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92F6ECD7790D1
        9100D9EFD969C06954CD6047C95447C95447C95447C95447C95447C95447C954
        47C9546CD477FFFFFFFFFFFFA9DCB071C6806FC57E6FC57E6FC57E6FC57E7FCC
        8CD9F0DDFFFFFFFFFFFFEAF9EC76D5812CBE3DACE6B3FEFFFEA8E4AF32C0421D
        B92F1DB92F1DB92F22BB34FBFEFBFFFFFFBAE5BF56C4631DB92F1DB92F1DB92F
        1DB92F1DB92F1DB92F1DB92F1DB92F6ECD7590D19000D8EFD868C06854CD6047
        C95447C95447C95447C95447C95447C95447C95447C9547FDA88FFFFFFFFFFFF
        94D39C72C78170C67F70C67F70C67F70C67FC3E7C8FFFFFFFFFFFFEDF8EF65CE
        721DB92F1DB92F1DB92F26BC371DB92F1DB92F1DB92F1DB92F1DB92F1DB92FE6
        F8E8FFFFFFCEEDD256C3631DB92F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92F
        1DB92F6ECD758FD18F00D8EFD867BF6654CD6047C95447C95448C95548C95548
        C95548C95548C95548C95584DB8DFFFFFFFFFFFF90D2987DCB8A72C68172C681
        72C68190D29CFEFFFEFFFFFFFFFFFFA2D9AB74C78286D29235C0461DB92F1DB9
        2F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92FE0F6E3FFFFFFD4EFD754C4611D
        B92F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92F1DB92F6DCC758ED08E00D8EF
        D766BF6557CE634ACA574BCA584BCA584BCA584BCA584BCA584BCA584BCA587C
        D986FFFFFFFFFFFF9BD6A389CF9473C78273C78273C782D1EDD6FFFFFFFFFFFF
        EFF9F058BB658AD09473C7827ACA897BD18822BB341DB92F1DB92F1DB92F1DB9
        2F1DB92F1DB92FF0FBF2FFFFFFC6E9CA45C2541DB92F1DB92F1DB92F1DB92F1D
        B92F1DB92F1DB92F1DB92F6DCC748ED08D00D7EFD765BF635ACF654ECB5A4ECB
        5B4ECB5B4ECB5B4ECB5B4ECB5B4FCB5B4FCB5B68D373FFFFFFFFFFFFB7E2BD82
        CC8D74C78374C78374C783E1F3E5FFFFFFFFFFFFFFFFFFA6DBAD8AD09574C783
        74C78374C78384CE9264CC711DB82F1DB82F1DB82F1DB82F34BF44FFFFFFFFFF
        FFADE0B324BA351DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F6D
        CC748DD08B00D7EFD764BE625DCF6851CB5D52CB5E52CB5E52CB5E52CB5E52CB
        5E52CB5E52CB5E53CC5FF3FCF4FFFFFFE5F5E75DBD697FCC8C75C88475C884BB
        E4C2FFFFFFFFFFFFFFFFFFE2F4E576C98575C88475C88475C88475C88475C884
        8AD39646C4551DB82F1DB82F70D27CFFFFFFFFFFFF8DD8951DB82F1DB82F1DB8
        2F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F6CCC738CCF8B00D7EFD663BE60
        60D06B54CC6055CC6155CC6155CC6155CC6155CC6155CC6155CC6155CC61C2ED
        C6FFFFFFFFFFFF7FCB8983CC8D77C88577C8857DCB8BF0F9F2FFFFFFFFFFFFA6
        DBAF77C88577C88577C88577C88577C88577C88577C8857ACA8886D3912FBE40
        C8EDCBFFFFFFFEFFFE4EC65B1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB8
        2F1DB82F1DB82F6CCC728BCF8900D7EED662BD5F63D16E57CD6358CD6458CD64
        58CD6458CD6458CD6458CD6458CD6458CD6483DA8CFFFFFFFFFFFFD6EED958BB
        658BD09678C88678C8868ED19ADBF1DFC8E9CD79C98778C88678C88678C88678
        C88678C88678C88678C88678C88678C886A6DCADFFFFFFFFFFFFC5EDC91DB82F
        1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F1DB82F6CCB728BCE
        8800D6EED561BD5D66D2705BCE665BCE675BCE675BCE675BCE675CCE675CCE67
        5CCE675CCE675CCE67DAF4DCFFFFFFFFFFFF9ED7A55BBC688CD09679C98879C9
        8879C98879C98879C98879C98879C98879C98879C98879C98879C98879C98879
        C98891D39CEAF7EBFFFFFFFFFFFF78D5821DB82F1DB82F1DB82F1DB82F1DB82F
        1DB82F1DB82F1DB82F1DB82F1DB82F6CCB718ACE8700D6EED560BC5C69D2735F
        CE6A5FCE6A5FCE6A5FCE6A5FCE6A5FCE6A5FCE6A5FCE6A5FCE6A5FCE6A7DD886
        FCFFFDFFFFFFFCFEFC89CF9258BB658ACF947CCB8B7AC9897AC9897AC9897AC9
        897AC9897AC9897AC9897AC9897AC9897FCB8D88CE92D4EED7FFFFFFFFFFFFC7
        EECB63D06E7DD78739C1491EB8301EB8301EB8301EB8301EB8301EB8301EB830
        1EB8306BCB7289CE8600D6EED560BC5A6CD37662CF6D62CF6D62CF6D62CF6D62
        CF6D62CF6D62CF6D62CF6D62CF6D62CF6D63CF6EA8E4AEFFFFFFFFFFFFFCFEFC
        9CD7A457BA646CC3778DD19782CD8F7CCA8A7CCA8A7CCA8A7CCA8A7CCA8A85CF
        928BD09576C780D9F0DCFFFFFFFFFFFFE8F8EA6FD37965D07065D0706CD37777
        D58125BB361EB8301EB8301EB8301EB8301EB8301EB8306BCB7089CE8500D6EE
        D45FBC596FD37965D07065D07065D07065D07065D07065D07065D07065D07065
        D07065D07066D07166D071BAEABFFFFFFFFFFFFFFFFFFFD5EED87DCA8757BA64
        59BB6671C57D80CB8A83CC8D7ECA886DC37860BE6CA4DAABF6FBF6FFFFFFFFFF
        FFEDFAEE7CD78568D17368D17368D17368D17368D17379D68364CF701EB8301E
        B8301EB8301EB8301EB8306BCB7088CE8400D6EED45EBB5771D47C68D17368D1
        7368D17368D17368D17368D17368D17368D17368D17368D17369D17469D17469
        D174ADE6B3FDFFFDFFFFFFFFFFFFFFFFFFE2F3E4B3E0B996D49E8ACF9390D298
        A6DBADCAE9CEF9FDF9FFFFFFFFFFFFFFFFFFE0F6E27BD7856BD2766BD2766BD2
        766CD2766CD2766CD2766CD2766CD27684DA8D47C6551EB8301EB8301EB8306B
        CB7088CD8200D5EED45DBB5675D57E6BD2766BD2766BD2766BD2766CD2766CD2
        766CD2766CD2766CD2766CD2766CD2776CD2776DD2776DD2778BDC93E0F6E3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F9FDF9B4E8B972D37C6FD2796FD2796FD2796FD2796FD2796FD2796FD2796FD2
        796FD27970D27A73D37D83D88C2FBD3F1EB7306ACA6F87CD8200D5EED35CBA54
        78D5816FD2796FD2796FD2796FD2796FD2796FD2796FD2796FD2796FD2796FD2
        7970D27A70D27A70D27A70D27A70D27A71D37B97DF9FCFF0D2F8FDF8FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFFFEE4F7E6B2E8B87BD68471D37B72D37C72D37C
        72D37C72D37C72D37C72D37C72D37C72D37C72D37C72D37C73D37D73D37D73D3
        7D7ED78774D37F6BCA7086CC8000D8EFD65BBA537ED78772D37C72D37C72D37C
        72D37C72D37C72D37C72D37C72D37C72D37C72D37C73D37D73D37D73D37D73D3
        7D73D37D73D37D73D37D73D37D75D47F8CDC94A0E2A7A7E4ADA3E3AA96DF9D7E
        D78774D47E74D47E74D47E74D47E75D47F75D47F75D47F75D47F75D47F75D47F
        75D47F75D47F75D47F75D47F76D48076D48076D48076D48076D4808CD58D89CE
        8300E5F4E35AB95189DA9175D47F75D47F75D47F75D47F75D47F75D47F75D47F
        75D47F75D47F76D48076D48076D48076D48076D48076D48076D48076D48076D4
        8076D48077D58177D58177D58177D58177D58177D58177D58177D58177D58177
        D58178D58278D58278D58278D58278D58278D58278D58278D58278D58278D582
        79D58379D58379D58379D58379D58386D08495D28F00FCFEFB5FBC5693DB9878
        D58278D58278D58278D58278D58278D58278D58278D58278D58279D58379D583
        79D58379D58379D58379D58379D58379D58379D5837AD6847AD6847AD6847AD6
        847AD6847AD6847AD6847AD6847BD6847BD6847BD6857BD6857BD6857BD6857B
        D6857CD6857CD6857CD6857CD6857CD6857CD6857CD6867DD6867DD6867DD686
        7ED7876BC265B1DEAD00FFFFFF88CD8186D1847BD6857BD6857BD6857CD6857C
        D6857CD6857CD6857CD6857CD6857CD6867CD6867DD6867DD6867DD6867DD686
        7DD6867DD6867DD6867ED6877ED6877ED6877ED6877ED6877ED6877ED6877ED6
        877ED6877ED6877FD6887FD6887FD6887FD6887FD6887FD6887FD6887FD6887F
        D6887FD68880D68980D68980D68980D68980D68994DC9A58B94EDFF2DD00FFFF
        FFC8E8C559BA4F8FDB977FD6887FD6887FD6887FD6887FD6887FD6887FD6887F
        D68880D68980D68980D68980D68980D68980D68980D68980D68980D68981D78A
        81D78A81D78A81D78A81D78A81D78A81D78A81D78A81D78A81D78A82D78B82D7
        8B82D78B82D78B82D78B82D78B82D78B82D78B82D78B82D78B83D78C83D78C83
        D78C83D78C83D78C8AD38977C66EFFFFFF00FFFFFFFEFFFD76C56C82CE7E83D8
        8C82D78B82D78B82D78B82D78B82D78B82D78B82D78B83D78C83D78C83D78C83
        D78C83D78C83D78C83D78C83D78C83D78C84D88D84D88D84D88D84D88D84D88D
        84D88D84D88D84D88D84D88D84D88D85D88E85D88E85D88E85D88E85D88E85D8
        8E85D88E85D88E85D88E85D88E86D88F86D88F86D88F86D88F9BDEA058B94CCB
        E9C8FFFFFF00FFFFFFFFFFFFDEF1DB5AB94F95D89585D88E85D88E85D88E85D8
        8E85D88E85D88E86D88F86D88F86D88F86D88F86D88F86D88F86D88F86D88F86
        D88F86D88F87D99087D99087D99087D99087D99087D99087D99088D99088D990
        88D99088D99188D99188D99188D99189D99189D99189D99189D99189D99189D9
        9189D99289D9928AD99298DD9F66BF5C90D088FFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFC3E6BE56B84993D7928CDA9489D99189D99189D99189D99189D99289D9
        928AD9928AD9928AD9928AD9928AD9928AD9928AD9928AD9928BD9938BD9938B
        D9938BD9938BD9938BD9938BD9938BD9938BD9938BD9938CD9948CD9948CD994
        8CD9948CD9948CD9948CD9948CD9948CD9948CD9948DD9958DD9959EDEA468C1
        5D7AC770F8FCF8FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFC8E8C35DBA51
        76C76EA0DEA48DDA958CD9948CD9948DD9958DD9958DD9958DD9958DD9958DD9
        958DD9958DD9958DD9958EDA968EDA968EDA968EDA968EDA968EDA968EDA968E
        DA968EDA968EDA968FDA978FDA978FDA978FDA978FDA978FDA978FDA978FDA97
        8FDA978FDA978FDA979BDEA198D79658B84B87CC7EF7FCF6FFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF6E88ACD8054B74669C15F92D590
        9EDC9FA1DEA4A1DEA4A1DEA4A1DEA4A1DEA4A1DEA4A1DEA4A1DEA4A1DEA4A2DF
        A5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2
        DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A2DFA5A1DEA49BDA9B82CD7C56B848
        64BE58BCE3B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE6F5E4ABDCA482CA7767BF5B5CBA4F5BBA4E5BBA4E
        5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA
        4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5BBA4E5B
        BA4E5BBA4E5BBA4E60BC5373C46795D28DC8E8C3FBFDFAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnWhatsClick
      ExplicitLeft = 761
      ExplicitTop = 5
    end
    object btnLote: TSpeedButton
      Left = 582
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F9 | Agrupar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFCFCFCFBFBFBFAFAFAF9F9F9F8F8F8F7F7
        F7F7F7F7F6F6F6F5F5F5F5F5F5F4F4F4F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2F2
        F2F2F2F2F2F2F2F2F3F3F3F3F3F3F3F3F3F3F3F3F4F4F4F5F5F5F5F5F5F6F6F6
        F7F7F7F8F8F8F8F8F8F9F9F9FAFAFAFBFBFBFCFCFCFDFDFDFDFDFDFEFEFEFEFE
        FEFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F0F0F0EAEAEAE5E5E5E0E0E0DCDCDCD8
        D8D8D5D5D5D2D2D2CFCFCFCDCDCDCBCBCBC9C9C9C7C7C7C6C6C6C4C4C4C3C3C3
        C2C2C2C2C2C2C2C2C2C2C2C2C1C1C1BFBFBFBFBFBFC1C1C1C2C2C2C2C2C2C2C2
        C2C2C2C2C3C3C3C4C4C4C6C6C6C7C7C7C9C9C9CBCBCBCDCDCDCFCFCFD2D2D2D5
        D5D5D8D8D8DCDCDCE0E0E0E5E5E5EAEAEAF0F0F0F8F8F8FEFEFEFBFBFBE7E7E7
        CFCFCFC3C3C3BBBBBBB6B6B6B3B3B3AFAFAFADADADADADADAAAAAAAAAAAAA8A8
        A8A8A8A8A7A7A7A8A8A8A7A7A7A6A6A6A7A7A7A6A6A6A6A6A6A7A7A7A6A6A6A6
        A6A6A6A6A6A6A6A6A6A6A6A7A7A7A6A6A6A6A6A6A7A7A7A7A7A7A8A8A8A7A7A7
        A8A8A8A9A9A9A9A9A9AAAAAAADADADADADADAFAFAFB3B3B3B6B6B6BBBBBBC3C3
        C3CFCFCFE6E6E6FBFBFBFEFEFEF4F4F4E9E9E9E0E0E0D0D0D5C1C1CBBCBCC6B9
        B9C4B5B5C0B3B3BDB0B0BBBCBCBFBFBFBFBEBEBEBCBCBCBCBCBCB9B9B9B5B2AB
        B4B1A9B3B0A8B3B0A8B3B0A8B3B0A8B4B2ABB8B8B8B7B7B7B7B7B7B8B8B8B8B8
        B8B8B8B8BABABABABABABCBCBCBCBCBCBDBDBDBABEBF6DA2C55F9EC78CAEC5BA
        C3C8CCCCCCD0D0D0D4D4D4DADADAE0E0E0E8E8E8F4F4F4FEFEFEFFFFFFFFFFFF
        FDFDFE8787BA0D0D820B0B810B0B810B0B810B0B810B0B810B0B811A1A87C2C2
        D4F0F0F0EFEFEFE2E0DBA78A479F7B299F7B299F7B299F7B299F7B299F7B299F
        7B29B09762E7E6E5EBEBEBEBEBEBEBEBEBECECECEDEDEDEDEDEDEEEEEEEFEFEF
        F0F0F181B7DB0087DD0087DD0087DD0187DC2F99DB75B4DCB2D0E2DFEAF0FBFC
        FDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFE8E8F20C0C810B0B800B0B800B0B810B
        0B800B0B800B0B810B0B800B0B8148489EFEFEFFFFFFFFCBBB969E7B299E7B29
        9F7B299E7B299E7B299F7B299E7B299E7B299F7B29DFD6C2FEFEFEFEFEFEFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE2498E10187DD0187DC0087DD01
        86DC0186DC0087DD0186DC0186DC75BBE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEEE0B0B810C0C810C0C810B0B810C0C810C0C810B0B810C0C810B0B813131
        96FFFFFFFFFFFFC8B3869F7C2A9F7C2A9F7B299F7C2A9F7C2A9F7B299F7C2A9F
        7C2A9F7B29D8CAABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E5F2FB048EE00189DE0188DE0088DD0187DD0187DD0087DD0187DC0186DC0388
        DDF8FCFEFFFFFFFFFFFFFFFFFFFFFFFFDEDEEE0C0C840C0C840C0C840C0C840C
        0C840C0C840C0C840C0C840C0C84313197FFFFFFFFFFFFC9B485A27D2BA27D2B
        A27D2BA27D2BA27D2BA27D2BA27D2BA27D2BA27D2BD9CAA9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDAF5008EE0008ADF008ADF008ADE00
        89DE0089DE0088DE0088DD0088DD1693E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEEE0C0C860D0D861010864F4F907B7B9B6B6B9626268A0D0D860C0C863232
        99FFFFFFFFFFFFCAB586A4802EA4802EA28440A09376A39984A08D62A38032A4
        802EA47F2DDACBAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        76C3EF008EE1018CE03692CA6C99B56597B5248ECF008ADF018ADE018ADE4EAE
        E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEEF0D0D880D0D88686899AAAAAA85
        8585979797A1A1A922228C0D0D8832329BFFFFFFFFFFFFCBB687A6812FA6853C
        AAA8A2999999848484AAAAAAA5987AA6812FA6812FDBCCABFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3DACE9008FE24699CAABACAC8D8D8D94
        9494A6ABAD2490D1008CE0008DE087C9F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEEF0D0D8A18188CAAAAAE6B6B6B5858585858589C9C9C5E5E9B0D0D8A3333
        9CFFFFFFFFFFFFCCB788A88332AA966B9E9E9E595959585858686868B0AFAEA8
        863CA88331DBCDACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FBFE
        0E99E50090E39AAEBA7D7D7D5858585858589191916D9FBC018DE10190E1C1E4
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEEF0E0E8C1B1B8FB5B5B862626258
        58585858589494946B6BA60E0E8C34349EFFFFFFFFFFFFCDB889AA8434B3A077
        989898575757585858606060B8B8B7AB8940AA8433DCCDACFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC9E8F90195E50092E4ADBBC26F6F6F57575758
        58588585857BA7C1018FE20996E4F0F8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEEF0F0F8E10108E9090B6A3A3A36D6D6D7F7F7FBFBFC23333980F0F8E3434
        A0FFFFFFFFFFFFCFB98AAC8636AF904DC3C2C08181816C6C6CA0A0A0C0B6A0AC
        8636AC8635DDCEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91D2F4
        0197E60094E574B2D5ADADAD6B6B6B747474B5B5B545A3D70191E333A9E9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEF00F0F900F0F901A1A928585B6B4
        B4C3A6A6C04545A00F0F900F0F903535A1FFFFFFFFFFFFD0BA8BAE8836AE8836
        B5995EC6BEACC7C2B9C2B496AF8C41AE8836AE8836DECFAEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF57BCEF0097E60096E60596E575B5D7B7C5CCB1
        C3CD58ACD90093E40094E56BC1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEF01010921010921010921010921010921010921010921010921010923535
        A3FFFFFFFFFFFFD1BB8CB08939B08939B08938B08939B08939B08938B08939B0
        8939B08938DFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FA7EB
        0198E70098E70197E70197E60096E60196E60195E60095E60197E6A4D9F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEF010109411119411119410109411
        11941111941010941111941010943535A5FFFFFFFFFFFFD3BC8DB28B3BB28B3B
        B28B3AB28B3BB28B3BB28B3AB28B3BB28B3BB28B3ADFD0AFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE6F5FD019DE9019AE80099E80199E80199E80098E701
        98E70197E70097E7029AE7DBF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEF01111961111961111961111961111961111961111961111961111963636
        A6FFFFFFFFFFFFD3BD8FB48D3CB48D3CB48D3CB48D3CB48D3CB48D3CB48D3CB4
        8D3CB48D3CE0D1B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACDFF8009FEA
        00A2EE00A0EC009BE9009AE9009AE90099E80099E80099E819A5EAFDFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEF11212981717A23939AF3C3CAF3D
        3DAF3D3DAF3C3CAF2E2EAE12129B3636A8FFFFFFFFFFFFD4BE8FB78F3FC7A158
        C7A668C7A669C7A669C7A668C7A668C49D51B68F3EE1D1B1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF74CBF401A1EC5FBEE092C1D267BCDD3BB4E613ACED01
        A3EE019DEA009BE94FBBF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEF112129A4242B2C2C2C3C3C3C3C3C3C3C3C3C3C3C3C3B3B3C21919A63737
        AAFFFFFFFFFFFFD6BF91BB9344C9BBA2C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3CB
        B58CB89040E2D2B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3CB8F102A5EF
        A7C3CEC4C4C4C3C3C3C3C3C3BFC2C4A6C2CB33B8EB009FEB88D1F5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEF113139C4645B3C2C2C2A1A1A1A1
        A1A1A1A1A1A9A9A9BCBCC61B1BA73737ACFFFFFFFFFFFFD7C091BC9444CBBEA6
        B2B2B2A1A1A1A1A1A1A1A1A1BABABACBB791BA9242E3D3B2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF4FBFE0CA8EF12ACEEC7CACB8D8D8D8E8E8E9E9E9EADADADC4
        C4C43EB5E500A1ECC2E8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DEDEF213139E4847B4C7C7C7AAAAAAAAAAAAAAAAAAB1B1B1C0C0CA1B1BA83737
        ADFFFFFFFFFFFFD8C193BE9646CDC0A8B9B9B9AAAAAAAAAAAAAAAAAABFBFBFCC
        B893BC9443E4D4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8ECFC01A6EF3EB6E8
        CBCBCBC1C1C1BCBCBCABABAB9D9D9DC6C9CA17ADED05A4EDF5FBFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEF21313A04948B5C9C9C99C9C9C9B
        9B9B9B9B9BA6A6A6C4C4CE1B1AA93737AFFFFFFFFFFFFFDAC294BF9747CFC2AA
        B3B3B39B9B9B9B9B9B9B9B9BBDBDBDCEB994BE9645E4D4B4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8FD8F800A8F06EC0E3BFBFBF8888888A8A8A9B9B9BB8B8B8B4
        CAD301A7F034B7F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF21414A24948B6D1D1D1B9B9B9B9B9B9B9B9B9BFBFBFC8C8D21B1BA93838
        B1FFFFFFFFFFFFDAC395C19848D1C4ACC5C5C5B9B9B9B9B9B9B9B9B9CACACACE
        BB95C09747E5D5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56C6F600A8F19FCCDE
        C3C3C3C6C6C6C6C6C6B6B6B6BCBCBC89C6DE00A6F06DCBF6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF21414A44B4AB7CFCFCF94949493
        9393939393A1A1A1CCCBD51C1BAA3939B2FFFFFFFFFFFFDBC496C29A4AD2C6AE
        B2B2B2939393939393939393BFBFBFCFBC96C29949E6D6B5FFFFFFFFFFFFFFFF
        FFFFFFFFFDFEFF20B6F402A9F1D0D8DCB0B0B0909090888888979797CCCCCC5D
        BDE601A8F0A5E0F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF31515A64C4BB8D9D9D9C9C9C9C9C9C9C9C9C9CDCDCDCFCFD81C1BAB3939
        B4FFFFFFFFFFFFDDC597C49B4CD4C8B0D1D1D1C9C9C9C9C9C9C9C9C9D5D5D5D0
        BC97C49B4BE7D6B6FFFFFFFFFFFFFFFFFFFFFFFFE2F6FE02AEF329B2EEDEDEDE
        DDDDDDDCDCDCD4D4D4C2C2C2D6D6D62EB3EC01AAF1DDF3FDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF31515A84C4AB9DEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDED2D2DB1C1BAB3A3AB6FFFFFFFFFFFFDEC698C69C4CD5C9B1
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDED0BD98C79D4DE8D7B7FFFFFFFFFFFFFFFF
        FFFFFFFFABE4FB00AFF55CBEEAE1E1E1E0E0E0E0E0E0DFDFDFDEDEDED6DBDE04
        A9F11CB5F3FBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF31616AA4D4CB9E1E1E1E2E2E2E1E1E1E1E1E1E2E2E2D5D5DE1D1BAC3A3A
        B7FFFFFFFFFFFFDFC799C79D4ED6CBB2E2E2E2E1E1E1E1E1E1E2E2E2E1E1E1D1
        BE98C99E4EE9D8B8FFFFFFFFFFFFFFFFFFFFFFFF73D4FA01AFF590CBE7E3E3E3
        E3E3E3E2E2E2E2E2E2E1E1E1ACD2E301ABF351C7F7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF31616AC4E4DBAE4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4D7D7E11D1CAD3B3BB9FFFFFFFFFFFFE1C89AC99F4FD7CCB3
        E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4D1BE99CBA050EAD9B8FFFFFFFFFFFFFFFF
        FFFFFFFF3AC4F901ABF3C5DCE7E6E6E6E5E5E5E5E5E5E4E4E4E4E4E47BC5E801
        AFF58AD9FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF41717AE4E4CBAE7E7E7E7E7E7E7E7E7E7E7E7E7E7E7DAD9E31D1CAD3B3B
        BBFFFFFFFFFFFFE2C99BCAA050D8CCB4E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7D1
        BF99CDA252EAD9B9FFFFFFFFFFFFFFFFFFF8FDFF07B6F817AEF0E4E7E9E7E7E7
        E8E8E8E7E7E7E7E7E7E6E6E648B9EC00B1F6C3ECFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF41818B0504EBBE8E8E8CBCBCBC9
        C9C9C9C9C9D5D5D5DBDBE41E1CAE3B3BBCFFFFFFFFFFFFE3CA9CCCA152D8CDB5
        DCDCDCC9C9C9C9C9C9C9C9C9E3E3E3D1BF99CFA454EBDABAFFFFFFFFFFFFFFFF
        FFC7EFFE00B6F947B8EDD6D6D66C6C6C878787A6A6A6CFCFCFE6E7E817ADF00A
        B6F7F2FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF41818B24F4DBBD6D6D6585858585858585858717171DDDDE61E1CAE3C3C
        BEFFFFFFFFFFFFE4CB9ECDA353D9CDB5969696585858585858585858B1B1B1D1
        BF99D1A556ECDBBAFFFFFFFFFFFFFFFFFF8EDFFD00B7FA7BC4EAB4B4B4585858
        585858585858838383CADEE902ACF335C4F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF51919B4504EBBD7D7D758585858
        58585858586F6F6FDEDEE71E1CAF3C3CC0FFFFFFFFFFFFE5CC9ECFA455D9CDB5
        969696585858585858585858AFAFAFD0BE98D3A758EDDBBBFFFFFFFFFFFFFFFF
        FF55D1FC00B2F7B0D4EAAAAAAA5D5D5D585858585858A2A2A298CDE900B4F86E
        D5FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFDFF51919B6514EBBE2E2E28E8E8E8D8D8D8D8D8DA2A2A2DFDEE71F1CB03D3D
        C1FFFFFFFFFFFFE6CD9FD0A556D8CDB5B9B9B98D8D8D8D8D8D8D8D8DCCCCCCD0
        BE98D5A959EEDCBCFFFFFFFFFFFFFEFFFF1EC3FC02AAF2CFE0EBEDEDEDE2E2E2
        C6C6C6A5A5A5D6D6D666BEEB00B8FAA6E6FDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF51A1AB84A48B9ECECECEDEDEDED
        EDEDEDEDEDEDEDEDD8D7E51D1AB03E3EC3FFFFFFFFFFFFE7CEA0D2A657D5CAAF
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDCBB88ED7AA5BEEDDBDFFFFFFFFFFFFE0F7
        FF03BEFD00B6FA1BACEE52B8EB88C4E7BCD8E9E8EBECECECEC2FB1ED00BAFBDF
        F6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E0E0F51B1BBA1B19B23532B53633B53734B53734B53633B52B28B11A19B73E3E
        C5FFFFFFFFFFFFE9CFA2D7AB5DC29C51C6A35EC6A35FC6A35FC6A35EC6A35FC5
        9D50D9AC5DEFDDBEFFFFFFFFFFFFAAE9FF01BFFE00BDFE01BCFE00BCFE01BBFD
        01B2F708AAF02AADEC01AFF619C2FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0F61B1BBC1C1CBC1C1CBC1B1BBC1C
        1CBC1C1CBC1B1BBC1C1CBC1B1BBC3F3FC7FFFFFFFFFFFFEAD0A3DBAE60DBAE60
        DBAE5FDBAE60DBAE60DBAE5FDBAE60DBAE60DBAE5FF0DEBEFFFFFFFFFFFF72DC
        FE01C2FE00BEFF01BDFE00BDFE01BDFE01BDFE00BCFE01BCFE01BCFD53D2FEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E0E0F61E1EBF1C1CBD1C1CBD1C1CBD1C1CBD1C1CBD1C1CBD1C1CBD1C1CBD4242
        C9FFFFFFFFFFFFEBD1A4DDB062DCAF60DCAF60DCAF60DCAF60DCAF60DCAF60DC
        AF60DDB264F1DFC0FFFFFFFFFFFF6DDAFF00CAFF00BEFF00BEFF00BEFF00BEFF
        00BEFF00BEFF00BDFF00BFFE8BE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4F72828C52020C01C1CBD1C1CBE1C
        1CBD1C1CBD1C1CBE1C1CBD2727C44D4DCDFFFFFFFFFFFFECD3A8E1BA73DDB062
        DDB061DCAF61DCAF61DDB061DCAF61DDB063E1BA72F3E3C7FFFFFFFFFFFFE0F7
        FF33CDFE05CCFF01CBFE00CBFF01C5FE01C0FE00BEFF01BEFE01C4FEC4F0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFF5F5FD23131C93333CB3232CB3333CB3333CB3232CB3333CB2C2CC6A9A9
        E7FFFFFFFFFFFFF8EFDFE1BA73E3BF7BE3BF7AE3BF7BE3BF7BE3BF7AE3BF7BE3
        BF7BE3BD7CFCF9F3FFFFFFFFFFFFFFFFFFFFFFFFE4F9FFAEECFF76DEFF3DD3FE
        0ECCFE00CBFF01CAFE31CCFEF9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFED7D7F4D4D4F3D4D4F3D4
        D4F3D4D4F3D4D4F3D4D4F3E4E4F7FFFFFFFFFFFFFFFFFFFFFFFFFCF9F3F9F0E2
        F9F1E2F9F1E2F9F1E2F9F1E2F9F1E2F9F1E2FEFCF9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FDFFCBF3FFB1ECFFF3FCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnLoteClick
      ExplicitLeft = 554
      ExplicitTop = 6
    end
    object btnEmail: TSpeedButton
      Left = 499
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F8 | Email'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B00003C0200003C020000000000000000000093827052371A
        5136195136195136195136195136195136195136195136195136195136195136
        1951361951361951361951361951361951361951361951361951361951361951
        3619513619513619513619513619513619513619513619513619513619513619
        5136195136195136195136195136195136195136195136195136195136195136
        1951361952371A948471816D5851361951361978634CA69889A89B8CA89B8CA8
        9B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8C
        A89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B
        8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA8
        9B8CA89B8CA89B8CA89B8CA39586705A425136195136198C786685725E60482E
        5F472D69523ABFB5ABFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F6B4A89C634C
        315F462B624A3096847385725E735E47C0B8AF7B67515C4227A19282F4F2F0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF5F3F1D9D3CDEDEBE8FFFFFFDFDAD5DED9D3FEFEFEF0EDEBD8D3CCF3F1
        EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEFEDEA948371583E2276614BC0B8AF78634D96847385725E735E47
        C9C3BCCCC6C08E7D6B5B42269D8D7DE9E6E3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D0C9685138B9AFA3FFFFFF80
        6D577B6751FCFCFBC2B8AE654E34D0C9C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE2DED991806D583F23887764C9C3
        BCCBC5BF78634D96847385725E735E47C9C3BCDAD7D3D1CCC69F9182583F2389
        7764E8E4E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF5F3F2D9D4CDEEEBE8FFFFFFDFDBD5DED9D4FEFEFEF0EDEBD9D3CCF3F2
        F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
        DAD57E6A55563C1F988A79CFCAC4DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3AFA4996750376A5239DAD4CEFBFBFAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF9F8F7CEC6BE5F472C634B31A89C8FDAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3D7D4D0B7
        AEA3735E476E573FC3BAB1F9F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4F3F1BEB3A8B8ADA1F0EDEBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F3B7ACA0654D346D
        573FB2A89CD7D3CFDAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3D9D6D2C6BFB8735E47634B31B6AA9EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F0EEA091815D
        4328593F24958473EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFDFDA496865E452B6B543CC2BAB3D8D5D1DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3D0CBC58E7E6C593F25A29383EEECE9FEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFEFDFDE5E1DD7C6752563C207F6B56A5978860472E725D45E0DCD7FDFC
        FCFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE8E5E1907F6C573D21867461CCC7C0DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3D1CDC79D90815F46
        2C907F6DE5E2DDFFFFFFFFFFFFFFFFFFFCFBFBD1CBC37B66505B41269A8A7AEE
        ECE9F8F7F6BFB5AA674F36755F48CCC3BBFBFAF9FFFFFFFFFFFFFFFFFFDCD6D0
        84715D594024968777CEC9C2DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3D6D2CEA39789634B317A654FEBE8E5FFFFFFFFFFFF
        C6BDB36B553C54391DB4A89CF3F1EFFFFFFFFFFFFFFBFBFAD9D2CC5E452A6750
        37BFB4AAFFFFFFFFFFFFDFDAD5705A425C42279A8D7DD4D0CBDAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3D9D6
        D2BBB2A8735D476B543BC3BAB0AEA19454391C6A533ACCC4BCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE6E3DE816D58573C20A7998CB8AEA2634A306C553D
        B2A89DD8D5D1DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3C4BDB575614A5C4328563C20
        7A654FD5CFC8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2
        DE988977553B1E583E22685239BCB4ABD9D6D2DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3D4CFCB75604A53381B806B56E7E3DFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EEA09283583E2261492FC4BDB6
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3D7D4D0BCB4AB715B44674F36B8ADA1F9F8F8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFDFDFDD0C8C076604961492EA99E91D5D1CCDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3ADA2
        966B553C6B543BCAC1B9FBFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDDD7D17B6650
        60482E998B7BD7D3CFDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3D8D5D1AA9F925F472D756049D1CAC2FEFEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE1DCD78876635A4227958675D3CFCADAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3CCC7C08F7F6D5B43279483
        71ECE9E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F7F5F4A89A8B5D43297D6955C2BBB3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3CBC5BF806E5A61482E9C8C7CF4F3F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFAAEA294654D33725D46BF
        B7AFD9D6D2DAD7D3DAD7D3DAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3DAD7D3DAD7D3DAD7D3C3BCB47B67525F472CB1A497F4F2F0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F8F6C3B9AF654E346E5841B5ACA1D9D5D1DAD7D3DAD7D3DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCDAD7D3DAD7D3D8D4D0ADA19566
        4F366A533BD5CEC8FBFAF9EDEBE8EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4
        EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7
        E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EAE7E4EDEAE7FAF9F8E6E1DD74
        60485F462B9F9183D5D1CCDAD7D3DAD7D3CBC5BF78634D96847385725E735E47
        C9C3BCDAD7D3D4D0CBA69A8D5E452A79644ED5CFC8FFFFFFE3DFDA91806D7F6B
        567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F
        6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B567F6B56
        7F6B567F6B568F7D6BDED9D4FFFFFFE1DDD8806D57563C20998B7CCFCAC4DAD7
        D3CBC5BF78634D96847385725E735E47C9C3BCD2CEC99789795D442952371AA6
        998AFDFDFDFFFFFFE7E3DF9E8F7F8E7D698E7D698E7D698E7D698E7D698E7D69
        8E7D698E7D698E7D698E7D698E7D698E7D698E7D698E7D698E7D698E7D698E7D
        698E7D698E7D698E7D698E7D698E7D698E7D698E7D699C8D7CE3DED9FFFFFFFE
        FEFEA6998A513619583E238A7966CEC9C3CBC5BF78634D96847385725E725D46
        B9B0A67C68545D442998887652381BAA9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619AA9D8F644B326F59
        41B5ACA177624B96847385725E624A306D573F644C32B2A69AF1EFED52381BAA
        9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA89B8C513619EDEAE7C3B9AF6C553D664F36624A3096847385725E513619
        5E452ACBC4BAF8F7F6FBFAFA52381BAA9D8FFFFFFFFFFFFFF2F0EECAC2B9C1B8
        AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1
        B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AEC1B8AE
        C1B8AEC1B8AEC9C1B8EFEDEBFFFFFFFFFFFFA89B8C513619F3F1EEFBFBFAD6D0
        C9664D34513619968473AB9E8F583E21938270F5F3F2FFFFFFFBFAFA52381BAA
        9D8FFFFFFFFFFFFFDED8D37B6650654E34654E34654E34654E34654E34654E34
        654E34654E34654E34654E34654E34654E34654E34654E34654E34654E34654E
        34654E34654E34654E34654E34654E34654E34654E3479644DD8D2CCFFFFFFFF
        FFFFA89B8C513619F3F1EEFFFFFFF4F3F1948372583F23B7AB9FEEECE9998977
        5B4127A29485EFECEAFBFAFA52381BAA9D8FFFFFFFFFFFFFF5F4F2D7D1CBD1CA
        C2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1
        CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2D1CAC2
        D1CAC2D1CAC2D7D0C9F4F2F0FFFFFFFFFFFFA89B8C513619F3F1EEEEECE9A092
        825B42279E8F7FF0EEECFFFFFFF1EFEDA19282583E23998A79EDEAE752381BAA
        9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA89B8C513619E5E0DB998978583E22A79A8BF3F1EFFFFFFFFFFFFFFFFFFF
        FFFFFFAB9E905E45297F6B5652381BAA9D8FFFFFFFFFFFFFF9F8F7E9E5E1E5E1
        DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5
        E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DDE5E1DD
        E5E1DDE5E1DDE8E5E1F8F7F6FFFFFFFFFFFFA89B8C51361979644D5F462DB2A6
        99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4F3B4A89B60492F52371AAA
        9D8FFFFFFFFFFFFFE1DCD7887561745E47745E47745E47745E47745E47745E47
        745E47745E47745E47745E47745E47745E47745E47745E47745E47745E47745E
        47745E47745E47745E47745E47745E47745E47745E4785725EDCD6D0FFFFFFFF
        FFFFA89B8C513619634A30B9AEA2F7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F6F5BFB5AB52371AAA9D8FFFFFFFFFFFFFEAE7E4AC9F919E8F
        7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E
        8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F9E8F7F
        9E8F7F9E8F7FAB9D8FE7E3DFFFFFFFFFFFFFA89B8C513619C4BCB2F9F8F7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFA52371AAA
        9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA89B8C513619F7F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFBFAFA52371AAA9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619F7F5F5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFA52371AAA
        9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA89B8C513619F7F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFBFAFA52371A9A8B7AE1DCD7E1DCD7E1DCD7E1DCD7E1DC
        D7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1
        DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7
        E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7E1DCD7998978513619F7F5F5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFC563B1E5E
        462B6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C
        6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C55
        3C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C553C6C
        553C5E452B54381CFAF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBFB4AAAA9D8FAA9D8FAA9D8FAA9D8FAA9D8F9F91
        826A523951361986735FAA9E90AA9E90AA9E90AA9E90AA9E90AA9E90AA9E90AA
        9E90AA9E90AA9E90AA9E90AA9E90AA9E90AA9E90AA9E90AA9E908A7864513619
        675138A09282AA9D8FAA9D8FAA9D8FAA9D8FAA9D8FBCB2A7FEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDBD5816E5861492FB9AFA4F7F6F5
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF8F7F6BEB5AA644C327F6B55DCD6D1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE8E4E085725D624B30A99B8EFBFAF9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBAEA294654C33816C57E5E1DD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E3DF917F6E5E4428
        A79A8CF7F6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8
        F7ACA0935D45298B7966E4E0DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF9F7F7AC9E905C45288D7B68E5E0DCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE8E4E092806F5C4228A59788F6F5F3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFB
        AEA194644B32816D58E4E1DCFFFFFFFFFFFFFFFFFFFFFFFFE8E5E185725E6149
        30A7998AFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F6BDB3A8634A307F6B55DCD6D1FF
        FFFFFFFFFFE0DCD6836F5B5F462CB5A99CF6F5F3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDDD7D26D553E685139C4BBB1C9C0B76C553D684F37D4CCC5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CA7D695462
        4B31644C3477614BCEC7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFDFDE3DEDA8C7C6986725EDBD6CFFCFCFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnEmailClick
      ExplicitLeft = 422
      ExplicitTop = -15
    end
    object btnRelatorio: TSpeedButton
      Left = 416
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F7 | Relat'#243'rio'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000CD010000CD0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD6D0C99D8F7F8A78648A79648A79648A79648A79
        648A79648A79648A79648A79648A79648A79648A79648A79648A79648A79648A
        79648A79648A79648A79648A79648A79648A79648A79648A79648A79648A7964
        8A79648A79648A79648A79648A79648A79649D8F7FD6D0C8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD9C8D7C8C
        7B679888759B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C79
        9B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C
        799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C799B8C7998
        88758C7C679C8D7CFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F8897964958572D1C9BFE1DCD4E1DCD4E1DCD4E1DC
        D4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1
        DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4
        E1DCD4E1DCD4E1DCD4E1DCD4E1DCD4D1C9BF958672897964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FEFEFEFBFBFBFAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9
        FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9
        F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FBFBFBFEFEFEEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FBFBFBD6D9E3D9DAE5F0ED
        EAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0
        EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEAF0EDEA
        F0EDEAF0EDEAF0EDEAF1EFEDFCFBFBEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FBFBFACCD4CB9BA9CAAFB4E9E5E3EAF3F0EBF3F0EBEBE8EABDC1E9
        ADB2E9E5E3EAF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF1EEEBF2EFEBF3F0EBF3F0
        EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF1EFEBFBFBFAEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FBFBFAF1EFEAD5E0ADC1CC
        BAA4AAE4B2B7E8B5B9E89FA7E2BFC7CDC7D0C3A2AAE1BABEE9D7D7EAD1D3E9BD
        C0E9A0A7E89AA2E8ACB1E8DADAEAEEECEBF3F0EBF3F0EBF3F0EBF2EFEBE8E6EA
        E8E6EAF2EFEBF3F0EBF1EFEBFBFBFAEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FBFBFAF1EFEBF2EFE9D1DEA5DBE2C0D5D6E8C9CFD0D0DCACD2DFA8
        D2DFA8D3DDB6C8CCE3B7BBE9BDC1E9D2D3E9EEEBEAE7E9D4CDD3CDB2B7E9B9BD
        E8DEDEEAD9D9EAC3C5E9BABDE9B9BDE8B4B9E8CDCEE9F3F0EBF1EFEBFBFBFAEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FBFBFAF1EFEBF3F0EBECEC
        DCCFDDA2CBDB9BCDDC9FE3E7CAF0EEE4EFEEE3D3DFA9DCE3BBF1EEEBF3F0EBF3
        F0EBD8E1B3CDDC9FC8D994DFE3D3CFD0E9ABB0E8B6BBE8CDCEE9D6D7EAE1E0EA
        DEDEEAC8CBE9F3F0EBF1EFEBFBFBFAEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FBFBFAF1EFEBF3F0EBF3F0EBEDECDFE6E9D1F3F0EBF3F0EBF3F0EB
        F3F0EBF1EFE8D0DEA5DAE3BAE1E6C6CBDB99DDE4BEF2EFE9F1EEE7CADA98E4E8
        CEF2EFEAF3F0EBEFEEE3E4E8CED8E1B6E9EBD8F2F0EAF3F0EBF1EFEBFBFBFAEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FBFBFAF1EFEBF3F0EBF3F0
        EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF1EFE8D3DEA9D5E0AEE9
        EBD7F3F0EBF3F0EBF3F0EBE9EBD5D0DDA3E7E9D3E1E6C5D3DFAAD4DFABDBE3B9
        D0DDA2E5E8CFF3F0EBF1EFEBFBFBFAEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FBFBFAF1EFEBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EB
        F3F0EBF3F0EBF3F0EBF1EFE7F1EFE7F3F0EBF3F0EBF3F0EBF3F0EBF2F0EAE5E8
        CFC8D993D5E0AEE6E9D1F1EFE6F2EFE9E7EAD2CADA97E6E9D1F1EFEBFBFBFAEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FBFBFAF1EFEBF3F0EBF3F0
        EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3
        F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EBF3F0EB
        F3F0EBF1EEE7D1DEA5EAEADBFBFBFAEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FCFCFCF7F5F2F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1
        F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5
        F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F6F5F1F7F5F2FCFCFCEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFEFEFDFEFDFDFEFD
        FDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFE
        FDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFDFEFDFD
        FEFDFDFEFDFDFEFDFDFEFEFDFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FEFEFEFBFBFBFAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9
        FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9
        F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FAF9F9FBFBFBFEFEFEEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FCFBFBEEECECE8E5E5E8E5
        E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8
        E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5
        E8E5E5E8E5E5E8E5E5EEECECFCFBFBEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FEFEFEFAFAFAF9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8
        F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8
        F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8FAFAFAFEFEFEEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FDFDFDF7F6F5F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2
        F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3
        F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F4F3F2F7F6F5FDFDFDEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FCFCFBEDEBEAE7E4E3E7E4
        E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7
        E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3
        E7E4E3E7E4E3E7E4E3EDEBEAFCFCFBEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8F6F7FDCCD1F4BDC3F1C2C8
        F2E9EBFAF0E4C7EADAB2EADAB2F8F3E7E7ECD0DCE2BADCE2BAEDF1DEE0F5FDC4
        EBFCC4EBFCE0F4FDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8E2E4F96D7ADE4F5FD55968D8B9C0F0D1B56DC19B3BC19B3BEBDEBD
        B7C373A2AE4CA2AE4CC7D398AEE3FA64C8F764C8F7ADE2FAFCFEFFFFFEFEF6F4
        F4EEEBEBEEEBEBEEEBEBEEEBEBEEEBEBEEEBEBEEEBEBEEEBEBF2F1F1FDFDFDEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8E8EAFB7986E74F5FE05E6D
        E3C5CBF5DFB962D49E28D49E28F2E1BCBFD3809FBD429FBD42D1E0A7ACE7FC60
        D0FA60D0FAACE7FCFDFFFFFFFEFEF6F5F5EEECECEEECECEEECECEEECECEEECEC
        EEECECEEECECEEECECF2F1F1FDFDFDEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8EBEDFC818DEC5363E56473E8CBD0F7E5BC62DBA227DBA227F4E3BE
        C4DA8AA1C444A1C444D6E6AFAEE9FD62D4FC62D4FCAEE9FDFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8EBEDFC818DEC5363E56473
        E8CBD0F7E5BC62DBA227DBA227F4E3BEC4DA8AA1C444A1C444D6E6AFAEE9FD62
        D4FC62D4FCAEE9FDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FDFDFEF0F2FDEBEDFCEDEFFCF9FAFEE5BC62DBA227DBA227F4E3BE
        C4DA8AA1C444A1C444D6E6AFAEE9FD62D4FC62D4FCAEE9FDFEFFFFFEFEFEF3F1
        F1E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3E7E4E3EEECEBFCFCFCEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE5BC62DBA227DBA227F4E3BEC4DA8AA1C444A1C444D6E6AFAEE9FD62
        D4FC62D4FCAEE9FDFEFFFFFFFFFFFAF9F9F5F4F3F5F4F3F5F4F3F5F4F3F5F4F3
        F5F4F3F5F4F3F5F4F3F8F7F7FEFDFDEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5BC62DBA227DBA227F4E3BE
        C4DA8AA1C444A1C444D6E6AFAEE9FD62D4FC62D4FCAEE9FDFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE5BC62DBA227DBA227F4E3BEC4DA8AA1C444A1C444D7E6AFEFFAFEDE
        F6FEDEF6FEEEFAFEFFFFFFFFFFFFFBFBFBF8F7F7F8F7F7F8F7F7F8F7F7F8F7F7
        F8F7F7F8F7F7F8F7F7FAF9F9FEFEFEEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECCE8CE5BB60E5BB60F7EBD0
        C4DA8AA1C444A1C444D7E6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3F1
        F1E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5E8E5E5EEECECFCFCFCEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCF7EDFBF4E6FBF4E6FEFCF8C4DA8AA1C444A1C444D7E6AFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFBFBFBFEFEFEEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C4DA8AA1C444A1C444D7E6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4DA8AA1C444A1C444D7E6AFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F6F6F1EFEEF1EFEEF1EFEEF1EFEEF1EFEE
        F1EFEEF1EFEEF1EFEEF5F3F3FDFDFDEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C4DA8AA1C444A1C444D7E6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F2
        F2EBE7E7EBE7E7EBE7E7EBE7E7EBE7E7EBE7E7EBE7E7EBE7E7F0EEEEFDFCFCEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9E7B3C1D884C1D884E5EFCBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFEFDFDFCFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFD
        FCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFDFC
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F78A7964A2
        9584EEEBE8FFFFFFFFFFFFFFFFFFFFFFFFFCFBFBEDEBE7E2E2E1DDDFE1DDDFE1
        DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDFE1DDDF
        E1DDDFE1DDDFE1DDDFE1E2E2E1EDEAE6FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFEE
        ECE8A395848A7964FAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFAF9F78A7964A29584EEEBE8FFFFFFFFFFFFFFFFFFFFFF
        FFFCFBFBEDEBE7AEC4DF7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7F
        A9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DE7FA9DEAEC4DFEDEAE6
        FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFEEECE8A395848A7964FAF9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F88A79649C
        8D7CEBE8E4FFFFFFFFFFFFFFFFFFFFFFFFFCFBFBEDEBE78EB1DE4487DC4487DC
        4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487
        DC4487DC4487DC4487DC8DB1DEEDEAE6FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFEB
        E8E49C8E7C8A7964FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFA294858E7F6BA79B8AAEA293AEA293AEA293AEA2
        93AA9E8FA194826D8CB34487DC4487DC4487DC4487DC4487DC4487DC4487DC44
        87DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC6D8BB3A19482
        AA9E8FAEA293AEA293AEA293AEA293A79B8A8E7F6BA29685FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDBD5B4
        AA9DA89C8BA79B8BA79B8BA79B8BA79B8BA093828877615E7BA04487DC4487DC
        4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4487
        DC4487DC4487DC4487DC5E7CA0867560A09382A79B8BA79B8BA79B8BA79B8BA6
        9A8BB4AA9DDFDAD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7F6F5F1EFECF0EEEBF0EEEBF0EEEBF0EE
        EBEFECE9E7E4DF9EBAE04486DB4487DC4487DC4487DC4487DC4487DC4487DC44
        87DC4487DC4487DC4487DC4487DC4487DC4487DC4487DC4486DB9EBBE0E7E4DF
        EFEDE9F0EEEBF0EEEBF0EEEBF0EEEBF1EFECF7F6F5FEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFEEAF1FBE5EEFA
        E5EEFAE5EEFAE5EEFA629BE24487DC4487DC4487DC4487DC6199E1E5EEFAE5EE
        FAE5EEFAE5EEFAEAF2FBFBFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4C5EE4889DD44
        87DC4487DC4889DDA4C5EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEF5FCA0C3EE5B95E05B95E0A0C2EDEFF5FCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnRelatorioClick
      ExplicitLeft = 368
      ExplicitTop = 17
    end
    object btnImprimir: TSpeedButton
      Left = 333
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F6 | Imprimir'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B00003D0200003D0200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F245136195136
        1951361951361951361951361951361951361951361951361951361951361951
        3619513619513619513619513619513619513619513619513619513619513619
        51361951361951361961472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F248C7A67A89B8CA89B8CA89B8CA89B8CA89B8CA89B8C
        A89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B
        8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8C86735F61472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBB0A561472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFFCFCFCF9F9F8F9F9F7F9F9F7F9F9F7
        F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9F7F9F9
        F7F9F9F7F9F9F7F9F9F7F9F9F7FAF9F8FDFCFCFFFFFFBBB0A561472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFF5F4F2E9E6E2E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9
        E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1EAE7E2
        F6F5F3FFFFFFBBB0A561472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFF5F4F2E9E6E2E9E6E1E9E6E1E9E6E1
        E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6
        E1E9E6E1E9E6E1E9E6E1E9E6E1EAE7E2F6F5F3FFFFFFBBB0A561472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFF5F4F2E9E6E2E3DFDAA49686745F47745F47745F47745F47745F47745F4774
        5F47745F47745F47745F47745F47745F47745F47745F479C8D7CE0DBD5EAE7E2
        F6F5F3FFFFFFBBB0A561472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFF5F4F2E9E6E2E4E0DBAEA29385735E
        85735E85735E85735E85735E85735E85735E85735E85735E85735E85735E8573
        5E85735E85735EA79A8AE1DDD7EAE7E2F6F5F3FFFFFFBBB0A561472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFF5F4F2E9E6E2E8E5E0E2DED8DDD8D1DDD8D1DDD8D1DDD8D1DDD8D1DDD8D1DD
        D8D1DDD8D1DDD8D1DDD8D1DDD8D1DDD8D1DDD8D1DDD8D1E1DDD7E8E5E0EAE7E2
        F6F5F3FFFFFFBBB0A561472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFF5F4F2E9E6E2E8E4DFD7D1CACBC3BA
        CBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3
        BACBC3BACBC3BAD5CFC7E7E3DEEAE7E2F6F5F3FFFFFFBBB0A561472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFF5F4F2E9E6E2E3DFD999897761492E61492E61492E61492E61492E61492E61
        492E61492E61492E61492E61492E61492E61492E61492E907E6BDED9D3EAE7E2
        F6F5F3FFFFFFBBB0A561472EDCD6D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFF5F4F2E9E6E2E6E3DDC4BBB0AA9D8E
        AA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D8EAA9D
        8EAA9D8EAA9D8EC0B6AAE4E0DBEAE7E2F6F5F3FFFFFFBBB0A561472EDCD6D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7AC9FB7AC9F
        B7AC9FB7AC9FB7AC9FB7AC9FB7AC9FB7AC9FB7AC9F9F9080563C1EC7BEB5FFFF
        FFF5F4F2E9E6E2E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9
        E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1EAE7E2
        F6F5F3FFFFFFBBB0A55A3F25A29283B7AC9FB7AC9FB7AC9FB7AC9FB7AC9FB7AC
        9FB7AC9FB7AC9FB7AC9F513619593F2461492E61492E61492E61492E61492E61
        492E61492E5E452A52381BC7BEB5FFFFFFF5F4F2E9E6E2E6E2DDC0B6ABA49686
        A49686A49686A49686A49686A49686A49686A49686A49686A49686A49686A496
        86A49686A49686BBB1A5E3DFDAEAE7E2F6F5F3FFFFFFBBB0A551361A5E442961
        492E61492E61492E61492E61492E61492E61492E594024513619513619968675
        DCD6D0DCD6D0DCD6D0DCD6D0DCD6D0DCD6D0DCD6D0C0B5AB5E452AC7BEB5FFFF
        FFF5F4F2E9E6E2E2DED891806D553A1E553A1E553A1E553A1E553A1E553A1E55
        3A1E553A1E553A1E553A1E553A1E553A1E553A1E553A1E877560DDD8D2EAE7E2
        F6F5F3FFFFFFBBB0A5573D21BCB1A7DCD6D0DCD6D0DCD6D0DCD6D0DCD6D0DCD6
        D0DCD6D0968775513619513619A89A8CFFFFFFFEFEFDFAFCF7FAFCF7FAFCF7FA
        FCF7FAFCF7D8D4C961492DC7BEB5FFFFFFF5F4F2E9E6E2E8E5E0E3DFD9DFD9D3
        DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9D3DFD9
        D3DFD9D3DFD9D3E2DED8E8E5E0EAE7E2F6F5F3FFFFFFBBB0A5593F23D3CFC4FA
        FCF7FAFCF7FAFCF7FAFCF7FAFCF7FEFEFDFFFFFFA89B8C513619513619A89A8C
        FFFFFFF0F5E5C6D996C6D996C6D996C6D996C6D996AEB87D5C4524C7BEB5FFFF
        FFF5F4F2E9E6E2E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9
        E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1E9E6E1EAE7E2
        F6F5F3FFFFFFBBB0A5563D1EABB47AC6D996C6D996C6D996C6D996C6D996F0F5
        E5FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F8FA34458431EC7BEB5FFFFFFFAF9F7F3F1EFF3F1EFF3F1EFF3F1EF
        F3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1EFF3F1
        EFF3F1EFF3F1EFF3F1EFF3F1EFF3F2EFFAFAF8FFFFFFBBB0A5543C1B8DA0439F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F8FA34458431EC7BEB5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBB0A5543C1B8DA0439FBF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F98B44A8B
        9C418B9C417F8739563F1DA49587CBC3BACBC3BACBC3BACBC3BACBC3BACBC3BA
        CBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3
        BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BACBC3BA9B8C7B533A1A7E85388B
        9C418B9C4197B1499FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F8998405B47205B472059441F52381A5D4429624A
        30624A30624A30624A30624A30624A30624A30624A30624A30624A30624A3062
        4A30624A30624A30624A30624A30624A30624A30624A30624A30624A30624A30
        624A30624A305C432751371959431E5B47205B472084903C9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F95AF4882
        8B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B
        828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B
        3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B828B3B82
        8B3B828B3B94AB479FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9DBC4E96B04994
        AB479AB74C9FBF4F9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9BB94C818B3A665C2861532472702F94AD479FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F8C9D4259441F6C553C83
        6F5B594023716F2F9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4FA0C051A4C257A0C051A0C051A3C257A0C052A0C0
        51A3C257A0C0529FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F7A7D3561482EDBD6D0F5F4F294847258411D9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4FADC969D8
        E5B8ADC969ACC767D5E3B3B2CC71ACC767D5E3B3B2CC719FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F818B3B5C4327B4A99DD6
        CFC87E6A555F4E239FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4FB3CC73EFF4E2B3CD74B1CB70EBF1DBB9D07EB1CB
        70EBF1DBB9D07E9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F94AB476458275F482C6A523A5A4322818A3A9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFE7EFD39FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F99B54B838F3C7C
        813691A6459EBE4E9FBF4F9FBF4FE7EFD3FFFFFFA89B8C513619513619A89A8C
        FFFFFFE7EFD39FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF
        4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9F
        BF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F
        9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4F9FBF4FE7EF
        D3FFFFFFA89B8C513619513619A89A8CFFFFFFEBF1D9ADC867ADC867ADC867AD
        C867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867
        ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC8
        67ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867ADC867AD
        C867ADC867ADC867ADC867ADC867EAF1D9FFFFFFA89B8C513619513619A89A8C
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFA89B8C5136195136199F9081EEECE9EEECE9EEECE9EEECE9EEECE9EE
        ECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9
        EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEEC
        E9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9EE
        ECE9EEECE9EEECE9EEECE9EEECE9EEECE9EEECE9A09181513619513619624A30
        745F48745F48745F48745F48745F48745F48745F48745F48745F48745F48745F
        48745F48745F48745F48745F48745F48745F48745F48745F48745F48745F4874
        5F48745F48745F48745F48745F48745F48745F48745F48745F48745F48745F48
        745F48745F48745F48745F48745F48745F48745F48745F48745F48745F48745F
        48745F48634A3051361994837294837294837294837294837294837294837294
        837294837283715D53391E7F6B56958472958472958472958472958472958472
        9584729584729584729584729584729584729584729584729584729584729584
        729584729584729584729584729584729584729584727B665053381D85715D94
        8372948372948372948372948372948372948372948372948372FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBB0A5593F23D8D1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBB0A5593F23D8D1CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBB0A5593F23D8D1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBB0A5593F23D8D1CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F24C7BEB5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBB0A5593F23D8D1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24C7BEB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBB0A5593F23D8D1CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D1CB583F248C7A67A89A
        8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA8
        9A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8C
        A89A8CA89A8C86735F593F23D8D1CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD7D1CB583F24513619513619513619513619513619513619513619
        5136195136195136195136195136195136195136195136195136195136195136
        19513619513619513619513619513619513619513619513619593F23D8D1CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnImprimirClick
      ExplicitLeft = 325
      ExplicitTop = 6
    end
    object btnTransmitir: TSpeedButton
      Left = 250
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F5 | Transmitir'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B00003D0200003D0200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFCFAF9
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBF1EFECF5F4F2FBFAFAEA
        E7E4F1EFEDFEFDFDF8F7F6FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFCD9D3CDAB9E90A19283C6BEB5F6F5F4FFFFFFF4F2F1C9C0B7
        DAD4CEE9E5E1998A79C2B9AFE9E6E28E7D6BB3A79AEFEDEAAA9D8FCFC8C0FCFC
        FBEFECEAFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD6D0705942543A1E5339
        1C5F462D9D8D7DD7D0C9EAE7E47A654F9D8E7DECE8E5958674C7BEB4F0EDEBAB
        9F91C5BCB3E2DED97B6751B8AEA2E8E5E18A7865AFA294FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF97887662492FC9C0B7E3DED97D695352371A9E8F80FEFDFDE4DFDB
        FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE7
        E4A29484CDC5BDD1CAC283705ADFD9D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF907F6C705A43E3DFDAF5F3
        F2948472614930EBE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED9D3CC8E7E6CE8E5E1
        DBD6D0D1CAC3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFBFB85725D563C208976639D8E7D61492F968574FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFDFDF0EEECF6F4F3998A79705942F8F6F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFBD5CEC7654E357F6B5578654D725C
        439E8E7DEFEDEAFFFFFFFFFFFFFFFFFFFEFBF7FBF4E6F9F0DDF8ECD4F6E9CEF7
        EACFF8EDD6F9F0DDFAF4E6FEFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        ECE9E6DDD8D2E7E3DFB5A99DE6E3DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D1B4
        A99CEFEDEAD1CAC2F5F3F1F2F0EEE9E6E2FCFCFBFFFFFFFEFDFCFAF2E2F2DFB7
        EAC987E4B963E0B251DEAB42DBA535DBA435DFAC43E1B151E4B963ECCE91F3E0
        BAFBF4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CDC576614ACFC8C0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB5A99C6D563EDDD7D1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFDFBF6ECCF96E2B355DEA83DDAA22FDBA22EDBA22EDBA22EDBA22EDB
        A22EDBA22EDBA22EDBA22EDBA230DEAA3EE2B455F0DAABFCF9F3FFFFFFFFFFFF
        FFFFFFFFFFFFF8F7F6E3DFDBF7F6F5D6CFC8EDEAE8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E4DFD5CFC8F6F5F3EE
        ECE9FEFEFDFFFFFFFFFFFFFFFFFFFDF8EEF0D8A8E0AE4ADBA22EDBA22ED59D2D
        C6922BB58428A073258E6623825D20835D20916923A07425B78528C9942BD69E
        2DDBA22EDAA12FE0B251F1DBAFFEFCF7FFFFFFFFFFFFFFFFFFFFFFFFE6E3DE60
        4930ADA092FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFCFBFBAEA2956E563FF5F3F2FFFFFFFFFFFFFFFFFFFFFFFFFCF7EDEAC5
        7FDDA638DBA22ED69E2DB685288E66226C4B1D573A1A5136195B42265B42265C
        43285A4025513619563A1972501E8F6622B88728DAA22EDBA22EDBA434EDD199
        FCF7EDFFFFFFFFFFFFFFFFFFFEFEFEC5BBB2E8E4E0E8E5E1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE2DDD9C4BCB1FCFCFBFF
        FFFFFFFFFFFFFFFFFAF3E2E6C174DCA230DBA22ECF982C88602261431C583E21
        513619563C2092816FC8C0B77D69537E6A55CEC7BF8A7865563C2052371A5539
        1C62441C966C23CE972CDBA22EDDA638E9C57EFBF6EAFFFFFFFFFFFFFFFFFFFF
        FFFFD0C9C27B6751DFDAD5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F5F4F2816C57CAC2B9FDFCFCFFFFFFFFFFFFFFFFFFFAF2E1E4BC67DAA22FD79F
        2DB2822867471D6D563DA193837C6852624A2FB7ADA1FAF9F8EDEBE885725D85
        735FFFFFFFFAF9F8AC9F925D45298D7B6896857462492F6D4C1EB68629DAA12E
        DBA22EE7BE6EFDFAF4FFFFFFFFFFFFFFFFFFE5E1DE978776E0DBD5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E68E7C6AC5BBB1FEFDFDFFFFFFFF
        FFFFFEFCF9E9C47DDCA330DBA22EA6792665461D7A654FD4CEC6B7AB9F5C4328
        AEA294FAF9F8FFFFFFEDEBE885725D85735FFFFFFFFFFFFFFBFBFA9585736750
        37D0C8C1C3B9AF725D4566471DB58428DAA12EDAA12FEDD199FEFBF6FFFFFFFF
        FFFFFFFFFFFBFBFAD8D2CBDAD5CFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5
        F9F9F8F2F0EEF8F7F6FFFFFFFFFFFFFFFFFFF2DCB0DCA534DBA22EBF8C295E40
        1C83705BE0DBD5E5E1DC745F48715B43F5F4F2FFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFDED9D3715B437C6853FCFBFBD9D3CC735D456C4C1D
        BE8B29DBA22EDEAB42F3E0B9FFFFFEFFFFFFFFFFFFFFFFFF816D5A907F6DF1F0
        EDFFFFFFFFFFFFFFFFFFFEFEFEBCB1A6684F37EBE8E5FFFFFFFFFFFFFFFFFFF9
        EFDBE2B251DBA22EC08D2A69481D826E5AE8E4E0FFFFFFB5AA9E594024CEC6BE
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFEFDFDB8AD
        A15A4125D6CFC9FFFFFFE6E2DD674F36724F1DC6922BDBA22EE4B961FAF2E3FF
        FFFFFFFFFFFFFFFFD9D3CCE3DFDAFDFCFBFFFFFFFFFFFFFFFFFFFEFEFED8D2CB
        A59788FBFBFAFFFFFFFFFFFFFEFCF8ECCF94DBA535D39B2D8B63225F4529DED8
        D3FFFFFFFEFEFE79644E7C6852E9E6E2FFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFFFFFFE3DFDA6E58409C8D7CFEFEFDFFFFFFC0B6AB
        5C4327926923DBA22EDCA333EFD7A5FFFFFFFFFFFFFFFFFFFAF9F8CFC7BFC3BA
        B0FFFFFFFFFFFFFFFFFFF6F4F4E8E4E1F8F6F6FFFFFFFFFFFFFFFFFFFAF1DFE2
        B455DBA22EBA882A5F411CA39586FEFEFEFFFFFFE7E3DE573D21A39585FBF9F9
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FB92816E755F48EAE7E4FFFFFFF1EEEC8B7A665B3E1BCD972CDBA22EE0B04CFF
        FEFDFFFFFFFFFFFFF6F4F39989796E563FFFFFFFFFFFFFFFFFFFCCC4BC5C4227
        D0C8C0FFFFFFFFFFFFFFFFFFF3DFB7DAA22FDBA22E7E582052381B644C326952
        3869523861482E52371B60472C695238695238695238695238674F35583E2359
        40246D563E6D563E6D563E6D563E6D563E61492F553B1F6E583F79644E79644E
        69523953381C8C6522DAA12EDBA22EF7EACFFFFFFFFFFFFFFFFFFFECE9E6F1EE
        ECFFFEFEFFFFFFFFFFFFE5E1DDBDB2A7EFECE9FFFFFFFFFFFFFFFFFFE8C47ADB
        A22ED59D2D5D3F1D78634D988877988877988877664E3560472C907F6C958573
        9585739585739585738E7D6A664E34674F369888779888779888779888779888
        7798887753391C735E469787769888779888776D573E6F4E1ECF982CDBA22EEC
        CE91FFFFFFFFFFFFFFFFFFF1EFECBEB3A8D8D2CBFFFFFFFFFFFFEAE6E2F6F5F4
        FFFFFFFFFFFFFFFFFFFFFFFFDEAA42DBA22EB886285D4429BCB2A6F7F6F4F7F6
        F4F5F4F27B675177624BEFEDEAF6F4F2F6F4F2F6F4F2F6F4F2E5E1DD826F5983
        705CF7F6F4F7F6F4F7F6F4F7F6F4F7F6F4F7F6F45F462C9C8C7CF3F1EFF7F6F4
        F7F6F4A99C8D61431BB68528DBA22EE3BA63FEFBF5FFFFFFFFFFFFE3DFDA715C
        43A79A8BFFFFFFFFFFFF715C43978776F5F4F3FFFFFFFFFFFFFCF9F2DBA22EDB
        A22E966C236D573FE1DDD7FFFFFFFFFFFFF4F3F177624C86735FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF735D47958572F5F4F3FFFFFFFFFFFFDBD5D0563A1AA07425DBA22EE1
        B255FAF3E4FFFFFFF4F3F1B5A99D745F47705942A99B8DEEEBE9BCB2A7D3CCC5
        FCFCFBFFFFFFFFFFFFFAF1DFDBA22EDBA22E896221756049F0EEEBFFFFFFFFFF
        FFEBE8E5725D45978775FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84715D8B7966F1EEECFFFFFF
        FFFFFFF3F1EF523719976D23DAA12EE1AF4EF8ECD5FFFFFFBAAEA35F472C7E6A
        5586735F5D4529A49686F3F1EFF9F8F7FFFFFFFFFFFFFFFFFFF6E8CBDBA22EDB
        A22E7B581F7A654FF9F9F8FFFFFFFFFFFFE2DDD86E573FA7998BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF958472826F59ECE9E6FFFFFFFFFFFFFDFDFD563B1F8F6622D79F2DDF
        AD47F5E6C8FFFFFF7F6B567B6751DDD8D3E7E3E0897763654E35533A1DA59687
        FDFCFCFFFFFFFFFFFFF6E8CBDBA22EDBA22E7C58207A654FF9F9F7FFFFFFFFFF
        FFE2DDD96E573FA7998BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948472826F5AECE9E6FFFFFF
        FFFFFFFDFDFD553B1F8F6622D79F2DDFAD47F5E6C8FFFFFF8A78637B6751DED9
        D3E6E2DF897663745F46A7998BCFC8C0FEFDFDFFFFFFFFFFFFF9F1DFDBA22EDB
        A22E896221756048F0EEEBFFFFFFFFFFFFEBE8E5725D46968675FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF83705C8C7A66F1EEECFFFFFFFFFFFFF2F1EF523719986D23DAA12EE1
        AF4EF8EDD6FFFFFFC3BAB0634B317F6C5684725D60482DB5A99DFCFCFCFBFAF9
        FEFEFDFFFFFFFFFFFFFCF9F2DBA22EDBA22E976C246D573EE1DCD7FFFFFFFFFF
        FFF4F3F277624C85735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF735D46958573F5F4F3FFFFFF
        FFFFFFDBD5D0563A1AA07425DBA22EE1B254FAF3E3FFFFFFF6F4F3BEB4A9654D
        33634A31B8ADA1F2F1EF927F6D7F6C58EBE8E4FFFFFFFFFFFFFFFFFFDEAA42DB
        A22EB886285D4429BCB2A6F7F5F4F7F5F4F5F4F27B675177634BF0EFECF7F5F4
        F7F5F4F7F5F4F7F5F4E6E2DE826F5A83705CF7F5F4F7F5F4F7F5F4F7F5F4F7F5
        F4F7F5F45F462B9C8C7CF3F1EFF7F5F4F7F5F4A99C8D62431CB68528DBA22EE3
        BA63FDFAF5FFFFFFFFFFFFFEFEFEFDFDFCF2F0EDFFFFFFFFFFFFC4BAB0B4A99D
        F2F0EEFFFFFFFFFFFFFFFFFFE8C47ADBA22ED59D2D5D401D78634C9787769787
        76978776654E3460472D92816F978776978776978776978776907F6D664E3566
        4E3597877697877697877697877697877697877653381B735D46978775978776
        9787766D563E704E1ECF992CDBA22EEBCE91FFFFFFFFFFFFFFFFFFE1DDD7B4A9
        9CEFECEAFFFFFFFFFFFFFBFAFAF2F0EEF6F4F3FFFFFFFFFFFFFFFFFFF3DFB6DA
        A22FDBA22E7E59205136196F59417A654E7A654E6F594052381B624A306E563F
        6E563F6E563F6E563F6B533B5A40245940246E563F6E563F6E563F6E563F6E56
        3F624A3053391D624A3069523969523960472D52371A8D6522DAA12EDBA22EF7
        E9CFFFFFFFFFFFFFFFFFFFBAB0A45C4328ECEAE7FFFFFFFFFFFFE6E2DD76614B
        A49687FFFFFFFFFFFFFFFFFFFAF0DFE2B455DBA22EBA892A5F411B91806DFDFD
        FDFFFFFFF4F2F05B4227A29485FBF9F9FFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFB92826F735D46E8E4E1FFFFFFF3F1EF
        907F6D5C3F1BCD972CDBA22EE0B04CFFFFFEFFFFFFFFFFFFFDFDFCFAF9F8F0ED
        EAFFFFFFFFFFFFFFFFFFF5F3F2C3BBB0D1CAC2FFFFFFFFFFFFFFFFFFFEFBF7ED
        D095DBA534D39C2D8B6322593F21D5CFC8FFFFFFFFFFFF8976627B6751E9E5E1
        FFFFFFFFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFFFFFFFE4E0
        DB6F59419A8A79FDFDFDFFFFFFC3B9B05E4529926A23DBA22EDCA534F0D7A6FF
        FFFFFFFFFFFFFFFFE8E4E0A59788DCD7D1FFFFFFFFFFFFFFFFFFFFFFFFFEFEFD
        EBE7E4E3DED9FFFFFFFFFFFFFFFFFFF9EFDBE0B250DBA22EC18D2A69481D7C68
        52E3DFDAFFFFFFC2B8AE5B4226CDC5BDFFFFFFFFFFFFFFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFFFFFFFEFEFEBBB0A45B4226D4CEC6FFFFFFE8E5E2695239
        724F1EC6922BDBA22EE4B961F9F2E3FFFFFFFFFFFFFFFFFFD8D2CC705942D1CA
        C3FFFFFFFFFFFFFFFFFFFFFFFFF2F0ED7D69548E7F6CFAF9F9FFFFFFFFFFFFFF
        FFFFF2DCB0DCA534DBA22EBF8C2A5E401C7F6B56DBD6D0EAE6E37F6B56715C43
        F5F3F2FFFFFFFFFFFFEDEBE885725D85735FFFFFFFFFFFFFFFFFFFE0DCD7745F
        477B664FFCFBFBDBD5D0755F486D4C1DBE8B2ADBA22EDEAB42F3DFB9FFFFFEFF
        FFFFFFFFFFF6F4F2EFECE9FBFAF9FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        CDC5BDD7D0CAFAF9F8FEFEFDFFFFFFFFFFFFFEFDFAE8C47BDBA230DBA22EA779
        2765461D756049D1CAC3C4BAB062492FAEA294F9F9F8FFFFFFEDEBE885725D85
        735FFFFFFFFFFFFFFCFCFB9A8A79664E34CDC6BDC4BBB2735E4766481EB68529
        DAA12EDAA12FEED29AFDFBF6FFFFFFFFFFFFFEFEFEB3A79A958573EEEBE8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C99F9181E9E6E2FFFFFFFF
        FFFFFFFFFFFAF1E1E4BA67DAA22FD79F2DB2832867471D6951399A8A7A877460
        624A2FB7ACA1FAF9F8EDEBE885725D85735FFFFFFFFBFAFAB0A4975D44298E7C
        699C8D7C624A306E4D1EB68629DAA12EDBA22EE5BE6EFDFAF4FFFFFFFFFFFFFF
        FFFFFEFEFEC9C1B89B8B7AF7F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD3CCC5897661E0DBD6FFFFFFFFFFFFFFFFFFFFFFFFFAF2E2E8C275DBA2
        30DBA22ECF982C88612261431C543A1C513619563C2092816EC8C0B77D69527D
        6A55CEC7BF8C7A67573D2052381B573C1E63441C966C24CE982CDBA22EDDA538
        E9C57DFCF6EAFFFFFFFFFFFFFFFFFFF1EFECC8BFB7EBE8E4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F8F4F2F1EDE9E7CFC7BFFD
        FDFDFFFFFFFFFFFFFFFFFFFCF7EDE9C57FDCA537DBA22ED69E2DB686298E6622
        6D4C1D573B1A5136195B41265B41265C42275A4025513619573B1973501E9067
        23B98729DAA22EDBA22EDCA635EED29AFCF6ECFFFFFFFFFFFFFFFFFFFFFFFFD5
        CEC86D553EC8C0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFC9F8F8077614BE1DBD7FFFFFFFFFFFFFFFFFFFFFFFFFCF7
        EEF0D8A7E0AE4ADBA22EDBA22ED59E2DC6922BB68429A074258F6623835D2183
        5D21926923A17425B78628C9942BD69E2DDBA22EDAA12FE0B250F1DBAFFEFBF7
        FFFFFFFFFFFFFFFFFFFFFFFFE7E4DFF3F1EFD2CBC3F1EFECFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E7C5BCB2F3
        F1EFDEDAD3F7F6F4E4E0DCD8D2CCE6E2DEFAF9F8FEFCF6EDD096E1B355DEA83D
        DAA22FDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDBA22EDAA22FDEA9
        3EE2B355F0D9ABFDFAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEC7BE654D33CA
        C3B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFCBDB3A86D563EAEA295725D455A40257661
        4ABBB1A5F9F7F6FFFEFCFAF1E1F3DFB7EACA87E4B963E0B151DDAB41DBA434DC
        A635DFAB45E0B151E4B963EBCE90F3E0B9FAF3E4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAF9F8D8D2CCE9E6E2AB9E90EBE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE4
        DFDBA7988B5C43277A654EBAAFA37E6A55675138DED9D3FFFFFFFFFFFFFFFFFF
        FDFBF7FAF3E5F9F0DDF7ECD4F7EACFF7E9CFF8EDD6F9EFDCFAF3E5FEFDFAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2A69976614AD6D0C9FAF9F9FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CAC25D4429C0B7ACFFFFFFD6CF
        C95A4125CBC4BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFAC2B8AE
        D6D0C9EAE6E3B5AA9DFAF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE9E5E25C4227978776DCD7D1A39586543A1ECFC8C0FEFEFEFFFFFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE1DCD7E0DBD6F5F4F26B553BB0A496FBFBFAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD9C8B7B5C43276B543B5A41
        276B523ADCD8D2CBC3BBA59788F0EEEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEEEBE8E3DEDAFBFBFA8C7B688E7E6AEFECE9DAD5CF
        EEEBE8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFAF9F9D8D2CBB5AA9DDFDBD5FCFCFCFEFEFEA89B8C958573EDEAE6
        9E8E7D8C7A67ECE9E6C3B9AEAEA194F0EDECB9AEA2A39585EFEDEB8C7A678874
        60EDEAE7D6D0C8D8D2CBFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFBFBFAF2F0EEFCFCFBB9ADA1ADA092F1EEECB0A396928070EA
        E7E4B5AA9D9E9080EEEBE9D4CDC6CCC4BBF7F5F4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBFAF9F7F6F4FEFDFDF1EFEDECE9E6FCFBFAF4F2F0F0EEECFCFCFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnTransmitirClick
      ExplicitLeft = 226
      ExplicitTop = 6
    end
    object btnRecuperar: TSpeedButton
      Left = 167
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F4 | Recuperar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFCF8FCF5E4F9EAC4F4D890F0CA6AEEBF4FEBB839E8
        B024FB8C18F9901DF99828F8A33CFABA6DFDDDB8FDECD6FEF9F2FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFCF8E7BCF3D282EDC155
        E8AF23E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FA8B18FA9E39FCBA73FCD4A3FFFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCF3DEF2CF79EAB530E7AD1AE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FB8916FA9122FAB160
        FCE6C8FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDF7E9F3D17FEAB227E8AC17E8AC17E8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FC8916FA8B19FBB25DFEF0DEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF0D6EFC968E8AC
        17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916
        FC8916FC8916FAA84CFDE5C7FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBEECFEEC04EE7AE1CE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FC8916FC8916FC8916FB8A18FB9E38FCE0BAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAEDCCE8B125E8AC17E8AC17E8AC
        17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916
        FC8916FC8916FC8916FC8916FA8C18FCDEB7FFFEFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        F1D6EDBE4DE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FB
        9C37FDE4C6FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDF8EAF0CA6AE7AE1CE8AC17E8AC17E8AC17E8AC
        17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E7AC19ECBC45EFC65FF1
        CE77F9AA4CF99E36F89322FC8916FC8916FC8916FC8916FC8916FC8916FC8916
        FC8916FC8916FC8916FC8916FC8916FB8A18FAA94DFEF0DEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF3D07CE7
        AB18E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8B022
        EDC254F5DC9FFDF5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEAD0FAC0
        79FBA143FA8A19FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC
        8916FC8916F9B15BFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCF2DCE9B125E8AC17E8AC17E8AC17E8AC17E8AC17E8AC
        17E8AC17E8AC17E7AD19EBBB41F5DA97FDF8ECFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF0DDFBC280FB9730FC8916FC8916
        FC8916FC8916FC8916FC8916FC8916FC8916FC8916FB8B19FCE4C5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBF1CE77E8AC17E8
        AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17ECBD4CFAECCAFFFDFA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBF7FCDCB5FB9C36FC8916FC8916FC8916FC8916FC8916FC8916FC
        8916FC8916FC8916F9B05EFFFCF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF8E6B9EAB42FE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC
        17E7AC19EFC250FEFBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7ECFC9E3A
        FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FA9122FBD3A0FFFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF6F1D07CE7AC19E8AC17E8
        AC17E8AC17E8AC17E8AC17E8AC17E7AC18ECBC45FBEFD0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCE0BCFC9C36FC8916FC8916FC8916FC8916FC
        8916FC8916FC8916FB8916FCB76CFFF9F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFCF5E1EDBE4EE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17EAB2
        26F6DEA4FFFEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8
        FCC789FA8D1BFC8916FC8916FC8916FC8916FC8916FC8916FC8916FA9B32FEEB
        D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9BFE9AF1EE8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17E8AC17F0C65FFEFBF4FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF6EAFAA84EFC8916FC8916FC8916FC
        8916FC8916FC8916FC8916FA8A17FDDAB3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF2D384E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17F8E6
        BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFACF96FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916F9B4
        5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEC359E8AC17E8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17E9B025FEFBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7EEFA8C18FC8916FC8916FC
        8916FC8916FC8916FC8916FC8916F89B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEBB93CE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17EFC968FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF8A33CFC8916FC8916FC8916FC8916FC8916FC8916FC8916F991
        1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAB128E8AC17E8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17F4D488FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB45FFC8916FC8916FC
        8916FC8916FC8916FC8916FC8916FA8C19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFDF9E7AC19E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17F5DC9EFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAC27FFC8916FC8916FC8916FC8916FC8916FC8916FC8916FC89
        16FFFAF4FFFFFFFFFFFFFFFFFFFFFFFFFDFAF2E7AC18E8AC17E8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17F5DFA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC688FC8916FC8916FC
        8916FC8916FC8916FC8916FC8916FC8916FDF3E3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEE8AE1FE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17F4D891FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9B35EFC8916FC8916FC8916FC8916FC8916FC8916FC8916FB89
        16FEFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9B633E8AC17E8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17F2CF77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A33BFC8916FC8916FC
        8916FC8916FC8916FC8916FC8916FA8C18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEC04EE8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17EBB83AFFFF
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFAF4FA911EFC8916FC8916FC8916FC8916FC8916FC8916FC8916F896
        25FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CD72E8AC17E8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17E7AD19FBF2DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD6A5FC8916FC8916FC8916FC
        8916FC8916FC8916FC8916FC8916F9AB4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6E1ADE7AD19E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17F2D2
        83FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCF9FBAD57FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FBC8
        8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF1D7EBB83BE8AC17E8AC17E8
        AC17E8AC17E8AC17E8AC17E8AC17EBB734F9EBC6FFFFFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8FEF8EFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDDB3FB9429FC8916FC8916FC8916FC
        8916FC8916FC8916FC8916FA8F1FFEE6CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDF8EDEFC865E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E7AC
        1AF0C967FDF8E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6E6F4
        D68DFBB86DFDE2C1FFFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBDBB0FA9528FC8916FC8916FC8916FC8916FC8916FC8916FC8916FBAB53FDF2
        E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFCF5DC9EE9B123E8AC17E8
        AC17E8AC17E8AC17E8AC17E8AC17E8AC17E9AF1FF4D68CFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF6E1AAE9B126FA8917FB9A32FBD09AFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF8EFFABE75FB8A16FC8916FC8916FC
        8916FC8916FC8916FA8A19FCC68BFFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF9EDEEC356E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC
        17E8AC17E8AC17F4D68AFEF9EEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFF5DA99E9
        AF1DFC8916FC8916FC8A16F8B766FEF0DFFEFEFCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCD5A5FB9C36FB8A18FC8916FC8916FC8916FCA242FDEFDBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E5B5E7AB18E8
        AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AF23F1CD70FAEED1
        FFFFFFFFFFFFFFFFFFFFFFFFF5DA99E9AF1DFC8916FC8916FC8916FB8A19FAA8
        4DFCDEB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFDE5C6FBAE55FB
        8916FC8916FC8916FBCD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFCF8EDBE4DE8AC17E8AC17E8AC17E8AC17E8AC17E8AC
        17E8AC17E8AC17E8AC17E8AE1CEBB83AF4DB9CFCF6E7FFFFFFFFFFFFF5DA99E9
        AF1DFC8916FC8916FC8916FC8916FB8917FB9830FBD4A0FFFFFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEF2E2F9B96FF9911EFAAB4FFEF8F0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF0D6EC
        BC43E7AB18E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17
        E8AC17E8B024EEC459F4D995F0CB6DE9AE1BFC8916FC8916FC8916FC8916FC89
        16FC8916FA8C1AFAB769FDEDD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFDFBF7E3B1E9B42EE8AC17E8AC17E8AC17E8AC
        17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FA8917FAA548FCE2BF
        FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FCF7F3D894E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FB9B34FCD4A2FEFCF8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC9EE9B42FE7AB18E8AC
        17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916
        FB8C18FBB463FEF7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFCF6F7E1ADEAB739E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FC8916FC8916FC8916FBC98BFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDF9FAEDCCECBF
        4CE7AB18E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916
        FC8916FC8916F8BF75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF6F6DFA6EDBD47E9AD1CE8AC17E8AC17
        E8AC17E8AC17E8AC17E8AC17E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FC8916FC8916FB8D1DFAAB50FEFAF2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCF2DBF4D891EDC45BEAB328E8AC17E8AC17E8AC17E8AC17E8AC17E8
        AC17FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FC8916FA9426
        FCC381FEF5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFDF7E7FAEDCB
        F2D383EEC258EBB732E7AB18E8AC17E8AC17FC8916FC8916FC8916FC8916FC89
        16FC8916FC8916FC8916FA911EFCDBB5FEF9F2FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAF0F3D384E9
        AE1CFC8916FC8916FC8916FC8916FC8916FC8916FB8D1DFBAD57FDEEDAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF5DA99E9AF1DFC8916FC8916FC8916FC8916FC89
        16F98C1AFCC688FEF2E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DA99E9
        AF1DFC8916FC8916FC8916FC8916FA9627FCD2A0FEFBF6FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF5DA99E9AF1DFC8916FC8916FA8B18FBAF5BFDEB
        D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DEA3E8
        AF22FC8916FA8F1FFBBB72FEF6EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBF1D7EEC257FA982DFCD099FFF9F1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnRecuperarClick
      ExplicitLeft = 145
      ExplicitTop = -6
    end
    object bbInutilizar: TSpeedButton
      Left = 84
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F3 | Inutilizar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B00003D0200003D0200000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C5136195136195136195136195136195136195136195136
        1951361951361951361951361951361951361951361951361951361951361951
        3619513619513619513619513619513619513619513619513619513619513619
        513619513619513619513619513619513619513619513619513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619A89B8CA8
        9B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8C
        A89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B
        8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA89B8CA8
        9B8CA89B8CA89B8C513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFF8F7F7F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4
        F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5
        F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F6F5F4F8
        F7F7FFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3D6D2CDCCC6
        C0CCC6C0CCC6C0CCC6C0CCC6C0CCC6C0CEC9C3D7D3CFDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3BCB4AB796550796550796550796550796550796550
        877663C6BFB8DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A563B
        1E745E4786735F86735F86735F725C45654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3D1CCC6C9C3BCC9C3BCC9C3BCC9C3BCC9C3
        BCC9C3BCC9C3BCC9C3BCC9C3BCC9C3BCC9C3BCD0CCC6DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5F46
        2BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9654E34BEB6ADDAD7D3DAD7D3DAD7D3A2
        9688735E47735E47735E47735E47735E47735E47735E47735E47735E47735E47
        735E47A19385DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3ACA19584725F84725F84725F84725F8472
        5F84725F84725F84725F84725F84725F84725FAB9F92DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5D43
        28B2A599E5E1DDE5E1DDE5E1DDAEA093654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A54391C685037745E47745E47745E47674F36
        654E34BEB6ADDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3C3BCB48E7D
        6C8E7D6C8E7D6C8E7D6C8E7D6C8E7D6C998B7BCAC4BEDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3D7D4CFD0CC
        C6D0CCC6D0CCC6D0CCC6D0CCC6D0CCC6D2CDC8D8D5D0DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3BFB8AE82705B82705B82705B82705B82705B82705B
        8F7F6DC8C2BADAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A543A
        1E6B543C7A654E7A654E7A654E6B533A654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3D1CCC6C9C3BCC9C3BCC9C3BCC9C3BCC9C3
        BCC9C3BCC9C3BCC9C3BCC9C3BCC9C3BCC9C3BCD0CCC6DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5F46
        2BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9654E34BEB6ADDAD7D3DAD7D3DAD7D3A2
        9688735E47735E47735E47735E47735E47735E47735E47735E47735E47735E47
        735E47A19385DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3ACA19584725F84725F84725F84725F8472
        5F84725F84725F84725F84725F84725F84725FAB9F92DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5D44
        29B5A89CE9E6E2E9E6E2E9E6E2B0A397654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A543A1D6D563E7C68527C68527C68526C553D
        654E34BEB6ADDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3C0B8B08472
        5F84725F84725F84725F84725F84725F918170C9C2BBDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3D7D4CFD0CC
        C6D0CCC6D0CCC6D0CCC6D0CCC6D0CCC6D2CDC8D8D5D0DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3BFB8AE82705B82705B82705B82705B82705B82705B
        8F7F6DC8C2BADAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A543A
        1E6B543C7A654E7A654E7A654E6B533A654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3D2CEC9CCC6C0CCC6C0CCC6C0CCC6C0CCC6
        C0CCC6C0CCC6C0CCC6C0CCC6C0CCC6C0CCC6C0D2CEC8DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5F46
        2BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9654E34BEB6ADDAD7D3DAD7D3DAD7D3A6
        9A8D796550796550796550796550796550796550796550796550796550796550
        796550A4978ADAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A5F462BC3B9AFFFFFFFFFFFFFFFFFFFBEB3A9
        654E34BEB6ADDAD7D3DAD7D3DAD7D3A79A8D7A67517A67517A67517A67517A67
        517A67517A67517A67517A67517A67517A6751A5998BDAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3B0A69A5D44
        29B5A89CE9E6E2E9E6E2E9E6E2B0A397654E34BEB6ADDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3B0A69A543A1D6D563E7C68527C68527C68526C553D
        654E34BEB6ADDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3C0B8B08472
        5F84725F84725F84725F84725F84725F918170C9C2BBDAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3
        E1DEFFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFE3E1DEDAD7D3DAD7D3DAD7D3DAD7
        D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DA
        D7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3
        DAD7D3DAD7D3DAD7D3DAD7D3DAD7D3E3E1DEFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619FFFFFFFF
        FFFFEBEAE8E5E3E1E5E3E1E5E3E1E5E3E1E5E3E1E5E3E1DFDBD8AEA2958E7E6B
        8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E6B8E7E
        6B8E7E6B8E7E6BB2A89BE1DEDBE5E3E1E5E3E1E5E3E1E5E3E1E5E3E1E5E3E1EB
        EAE8FFFFFFFFFFFF513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C513619FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1EFED8D7B68593F24745F48745F48745F48745F48745F4874
        5F48745F48745F48745F48745F48745F48745F48563C20978776F7F5F4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B8C513619DBD6D0DB
        D6D0DBD6D0DBD6D0DBD6D0DBD6D0DBD6D0DBD6D0DBD6D0D0C9C2816D58755F49
        EEECE9E4E0DCCEC7BFE3DFDBEEECE9D4CDC6D4CDC6EEECE9E3DFDBCEC7BFE4E0
        DBEEECE9674F36897663D5CEC7DBD6D0DBD6D0DBD6D0DBD6D0DBD6D0DBD6D0DB
        D6D0DBD6D0DBD6D0513619A89A8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA89B8C5136196B543B6B543B6B543B6B543B6B543B6B543B6B54
        3B6B543B6B543B6951385A402579644EFFFFFFD3CCC57A654FD2CAC2FFFFFF90
        7E6C8F7E6BFFFFFFD2CBC37A654FD3CCC4FFFFFF6952395B42276952396B543B
        6B543B6B543B6B543B6B543B6B543B6B543B6B543B6B543B513619A89A8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D2CBB1A598B1A598B1
        A598B1A598B1A598B1A598B1A598B1A598B1A598B1A598A99C8E725C4479644E
        FFFFFFE8E5E1B9AEA3E7E4E0FFFFFFC4BCB2C4BCB2FFFFFFE8E4E0B9AEA3E8E4
        E0FFFFFF695239745D47AA9D8FB1A598B1A598B1A598B1A598B1A598B1A598B1
        A598B1A598B1A598B1A598D8D2CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1EFED8C7B68654D33A89A8CA89A8CA89A8CA89A8CA89A8CA8
        9A8CA89A8CA89A8CA89A8CA89A8CA89A8CA89A8C5D44298E7E6AF3F1EFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EFED8C7B68513619
        5136195136195136195136195136195136195136195136195136195136195136
        195136195136198E7E6AF3F1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = bbInutilizarClick
      ExplicitLeft = 75
      ExplicitTop = -6
    end
    object btnCancelar: TSpeedButton
      Left = 1
      Top = 1
      Width = 83
      Height = 96
      Align = alLeft
      Caption = 'F2 | Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000D70D0000D70D00000000000000000000FFFFFFFFFFFF
        ECECFD9898EF5050E52222DF2121DE5050E59898F0ECECFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECECFD9898EF5050E52222DF2121DE5050E59898
        F0ECECFDFFFFFFFFFFFFFFFFFFD3D3F86363E80404D90000D90000D90000D900
        00D90404D96262E8CFCFF8FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFCFCFF86262E804
        04D90000D90000D90000D90000D90404DA6363E8D3D3F8FFFFFFEBEBFC6363E8
        0505DA0000D90000D90000D90000D90000D90000D90404D94040E3D5D5F9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD5D5F94141E30505DA0000D90000D90000D90000D90000D90000
        D90505DA6464E9ECECFD9898F00505DA0000D91818DC8181ECD7D7F9D6D6F97F
        7FEB1D1DDD0000D90000D92525DFD5D5F9FEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD5D5F92525DF0000D90000D91E
        1EDD8181ECD7D7F9D6D6F97F7FEC1717DC0000D90505DA9A9AF04C4CE40000D9
        0000D98585EDFAFAFEFFFFFFFFFFFFFAFAFEA9A9F11313DC0000D90000D93F3F
        E2CACAF8FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
        CACAF73F3FE20000D90000D91515DBADADF3FBFBFEFFFFFFFFFFFFFAFAFE8181
        EC0000D90000D94D4DE41D1DDC0000D90000D9E0E0FAFFFFFFFFFFFFFFFFFFFF
        FFFFFCFCFE9999F01313DB0000D90404DA3E3EE1D5D5FAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD5D5F93F3FE20404DA0000D91414DC9C9CF0FC
        FCFEFFFFFFFFFFFFFFFFFFFFFFFFDDDDFA0000D90000D91D1DDD1B1BDC0000D9
        0000D9E3E3FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEAAAAF22222DD0000
        D90000D92424DED4D4F9FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD5D5F92424DE
        0000D90000D92424DEACACF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
        FB0000D90000D91B1BDC4B4BE30000D90000D98A8AEEFBFBFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFBFEAAAAF21313DC0000D90000D93E3EE3C9C9F7FDFDFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFDFDFECACAF73E3EE10000D90000D91515DBADADF3FBFBFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBFF8585ED0000D90000D94B4BE59696F00404D9
        0000D92020DEAFAFF3FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9999
        F01414DC0000D90404DA3D3DE1D4D4F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4F83E3EE10404DA0000D9
        1414DC9C9CF0FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEADADF31E1E
        DD0000D90404DA9595F0EAEAFC5E5EE80404DA0000D91616DB9F9FF1FDFDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEABABF32323DE0000D90000D92323DD
        D4D4F9FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FFD4D4F92323DC0000D90000D92424DEACACF3FCFCFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFF9C9CF11515DB0000D90404DA5D5DE7EAEAFCFFFFFFCBCBF7
        3B3BE20000D90000D91616DCAFAFF3FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFBFBFEABABF21414DC0000D90000D93D3DE1C9C9F7FDFDFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFDFEC9C9F63E3EE30000D90000D91515DBADADF3
        FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEACACF31414DC0000D90000
        D93A3AE1CACAF7FFFFFFFFFFFFFDFDFED1D1F81F1FDE0000D90000D92525DFAE
        AEF2FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9A9AF01414DC0000D9
        0404DA3D3DE1D3D3F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4F93D3D
        E10404DA0000D91414DC9C9CF0FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FCFEADADF32424DE0000D90000D91F1FDED0D0F7FDFDFFFFFFFFFFFFFFFFFFFF
        FFFFFFD1D1F83A3AE10404DA0000D91616DC9E9EF1FCFCFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFCFCFEABABF22323DD0000D90000D92222DDD4D4F9FDFDFEFF
        FFFFFFFFFFFDFDFED4D4F92222DD0000D90000D92424DEACACF3FCFCFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFCFF9C9CF11515DB0000D90404DA3939E1D0D0
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFC7C7F73A3AE10000D900
        00D91515DBAEAEF3FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEACACF3
        1414DC0000D90000D93C3CE0C8C8F7FDFDFFFDFDFEC8C8F63D3DE10000D90000
        D91515DBADADF3FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEACACF314
        14DC0000D90000D93A3AE1C6C6F6FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFED1D1F82020DE0000D90000D92424DEAEAEF3FDFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9B9BF01414DC0000D90404DA3C3CE2D3
        D3F9D3D3F83C3CE00404DA0000D91414DC9C9CF0FCFCFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFCFEADADF32424DE0000D90000D92020DED1D1F8FDFDFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1F83B
        3BE00404DA0000D91515DB9E9EF1FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FCFCFEACACF22323DD0000D90000D92222DF2222DF0000D90000D92424DEACAC
        F3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF9C9CF11515DB0000D904
        04DA3A3AE1D1D1F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFFC7C7F63B3BE20000D90000D91515DBAEAE
        F3FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFADADF31515DB0000D900
        00D90000D90000D91515DBADADF3FBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBFBFEACACF31414DC0000D90000D93B3BE2C7C7F7FDFDFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFFD2D2F82121DE0000D90000D92424DEAEAEF3FCFCFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFCFE9C9CF01414DC0000D90000D91414DC9C9CF0FCFCFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEADADF32424DE0000D90000D92020DDD2
        D2F8FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2F83B3BE00404DA0000
        D91515DB9D9DF1FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEAFAFF33B
        3BE23B3BE2AEAEF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF9C9CF1
        1515DB0000D90404DA3B3BE2D2D2F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFFC8C8F73C3CE30000D90000D91515DBADADF3FBFBFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1FBE0E0FAFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFBFBFEACACF31414DC0000D90000D93B3BE2C7C7F7FEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD2D2F82121
        DC0000D90000D92424DEADADF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEADADF32424DE0000D9
        0000D92121DED2D2F8FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2F83C3CE20404DA0000D91414DC9C9CF1
        FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFCFF9C9CF11515DB0000D90404DA3C3CE2D2D2F8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FFC8C8F63D3DE10000D90000D91414DCAEAEF3FEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFAEAEF31414DC0000D90000D93D3DE3
        C8C8F7FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD3D3F82222DD0000D90000D9
        3C3CE2E2E2FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1
        FB3B3BE20000D90000D92222DDD3D3F9FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFED3D3F82222DF0000D90000D93C3CE2E2E2FBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1FB3B3BE20000D90000D92222DFD3D3F9
        FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFEC8C8F73C3CE20000D90000D91515DB
        AEAEF3FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFAEAEF31515DB0000D90000D93C3CE2C8C8F7FDFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2
        F83C3CE20404DA0000D91414DC9C9CF0FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9C9CF01515DB0000D90404DA
        3B3BE0D2D2F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFDFDFED2D2F82121DE0000D90000D92424DEADADF3FCFCFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFEADADF32424DE0000D90000D92121DED2D2F8FDFDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFC7C7F63B3BE20000
        D90000D91515DBADADF2FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFE0
        E0FAE0E0FBFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFADADF31515DB
        0000D90000D93B3BE2C7C7F7FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD2D2F83B3BE00404DA0000D91515DB9D9DF0FCFCFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFEAEAEF33B3BE23B3BE2ADADF3FCFCFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCFCFE9C9CF01515DB0000D90303D83B3BE2D2D2F8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFED1D1F72121DE0000D90000D92424
        DEAEAEF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF9C9CF11414DC00
        00D90000D91414DC9C9CF1FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE
        ADADF32424DE0000D90000D92020DDD1D1F7FDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFC7
        C7F73A3AE10000D90000D91616DBAEAEF2FCFCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFBFEACACF31414DC0000D90000D90000D90000D91414DCACACF3FBFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFFADADF31515DB0000D90000D93A
        3AE1C6C6F6FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD1D1F83B3BE20404DA0000D91515DB9E9EF0FDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEACACF32323DD0000D90000D922
        22DD2222DD0000D90000D92424DEACACF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFCFCFE9C9CF01515DB0000D90404DA3A3AE1D1D1F8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFD1D1F81F1FDD00
        00D90000D92525DFAFAFF4FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF
        9B9BF11414DC0000D90404DA3D3DE3D3D3F8D3D3F83D3DE10404DA0000D91414
        DC9C9CF1FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEADADF32424DE00
        00D90000D91F1FDDD0D0F7FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFFC6C6F63A3AE20000D90000D91616DBAFAFF3FCFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFBFBFFABABF21414DC0000D90000D93D3DE1C9C9F7FE
        FEFFFEFEFFC9C9F73D3DE10000D90000D91414DCACACF3FBFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFFADADF31515DB0000D90000D93A3AE2C6C6F7FDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1F83A3AE10404DA0000D916
        16DC9E9EF0FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEABABF32323DE
        0000D90000D92323DED4D4F9FEFEFFFFFFFFFFFFFFFEFEFFD4D4F92323DE0000
        D90000D92424DEACACF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9C
        9CF01515DB0000D90404DA3939E1D0D0F8FFFFFFFFFFFFFFFFFFFFFFFFFDFDFF
        D1D1F91F1FDE0000D90000D92626E0AFAFF3FDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFF9A9AF11313DC0000D90404DA3E3EE3D4D4F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD4D4F83E3EE10404DA0000D91414DC9C9CF1FCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFEADADF32424DE0000D90000D91F1F
        DED0D0F8FDFDFFFFFFFFFFFFFFCBCBF83A3AE20000D90000D91616DBB0B0F4FC
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFABABF31313DC0000D90000D9
        3D3DE1C9C9F7FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFCACA
        F73E3EE10000D90000D91414DCACACF3FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFCFFADADF31515DB0000D90000D93A3AE2CACAF7FEFEFFEAEAFC5D5DE7
        0404DA0000D91717DC9F9FF1FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
        FEAAAAF22222DD0000D90000D92323DDD4D4F8FEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD4D4F82323DC0000D90000D92424DE
        ACACF3FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE9C9CF01515DB0000
        D90404DA5B5BE7E9E9FC9595EF0404D90000D92020DDAFAFF2FDFDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFCFCFF9999F01414DC0000D90404DA3E3EE1D4D4F8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD4D4F83F3FE20404D90000D91414DC9C9CF1FCFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFCFCFEADADF31F1FDE0000D90202D89090EE4B4BE50000D9
        0000D98A8AEDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFFAAAAF21313
        DC0000D90000D93E3EE1C9C9F6FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFCACAF73E3EE10000D9
        0000D91414DCACACF3FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFE8787
        ED0000D90000D94848E21B1BDC0000D90000D9E3E3FBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFEAAAAF22222DD0000D90000D92424DED4D4F8FEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFFD5D5F92424DE0000D90000D92424DEACACF3FCFCFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1FA0000D90000D91A1ADC1E1EDD0000D9
        0000D9E0E0FBFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF9999F01313DB0000D90404
        DA3F3FE2D5D5F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5F9
        3F3FE20404D90000D91414DC9C9CF1FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFDEDE
        FA0000D90000D91D1DDD4D4DE40000D90000D98585EDFAFAFEFFFFFFFFFFFFFA
        FAFEA9A9F21313DC0000D90000D93F3FE2CACAF7FEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFCBCBF83F3FE20000D90000D91515DBAC
        ACF3FAFAFEFFFFFFFFFFFFF9F9FE8282EC0000D90000D94C4CE49B9BF00505D9
        0000D91818DD8181ECD9D9F9D9D9F98181EC1C1CDC0000D90000D92525DFD5D5
        F9FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFFD6D6FA2525DF0000D90000D91E1EDD8181ECD6D6F9D6D6F97F7FEC1717
        DC0000D90404DA9696F0ECECFC6464E70505D90000D90000D90000D90000D900
        00D90000D90505DA4040E3D5D5F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5F94141E30505DA00
        00D90000D90000D90000D90000D90000D90505DA6262E8EBEBFCFFFFFFD4D4F8
        6464E80505DA0000D90000D90000D90000D90505DA6262E7CFCFF8FEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFFD0D0F86363E80505DA0000D90000D90000D90000D90505
        DA6363E8D4D4F9FFFFFFFFFFFFFFFFFFECECFC9898EF5050E52222DD2121DC50
        50E59898EFECECFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECECFC98
        98EF5050E52222DD2121DC5050E59898F0ECECFCFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 0
      ExplicitTop = 0
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*-nfe.XML'
    Filter = 
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|To' +
      'dos os Arquivos (*.*)|*.*'
    Title = 'Selecione a NFe'
    Left = 56
    Top = 352
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 881
    Top = 126
  end
  object frxReport: TfrxReport
    Version = '6.6.17'
    DataSetName = 'frxDBCo'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41869.389758275500000000
    ReportOptions.LastChange = 43608.733759803200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 592
    Top = 168
    Datasets = <
      item
        DataSet = frmProdutos.frxDBProduto
        DataSetName = 'frxDBProduto'
      end
      item
        DataSet = frxDBEmpresa
        DataSetName = 'frxDBEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Compra: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.080000000000000000
      RightMargin = 5.080000000000000000
      TopMargin = 5.080000000000000000
      BottomMargin = 5.080000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.960000000000000000
        Top = 268.346630000000000000
        Width = 1084.120385200000000000
        DataSet = frmProdutos.frxDBProduto
        DataSetName = 'frxDBProduto'
        RowCount = 0
        object Memo22: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 24.960000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          ParentFont = False
        end
        object frxDBClientesCODIGO: TfrxMemoView
          AllowVectorExport = True
          Left = 2.880000000000000000
          Top = 3.839999999999980000
          Width = 48.000000000000000000
          Height = 19.200000000000000000
          DataField = 'CODIGO'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."CODIGO"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 54.720000000000000000
          Top = 3.839999999999980000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          DataField = 'CODBARRA'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."CODBARRA"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 172.800000000000000000
          Top = 3.839999999999980000
          Width = 76.800000000000000000
          Height = 19.200000000000000000
          DataField = 'REFERENCIA'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."REFERENCIA"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 254.400000000000000000
          Top = 3.000000000000000000
          Width = 316.800000000000000000
          Height = 19.200000000000000000
          DataField = 'DESCRICAO'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."DESCRICAO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 576.000000000000000000
          Top = 3.000000000000000000
          Width = 230.400000000000000000
          Height = 19.200000000000000000
          DataField = 'GRUPO_SL'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."GRUPO_SL"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 813.760000000000000000
          Top = 3.000000000000000000
          Width = 28.800000000000000000
          Height = 19.200000000000000000
          DataField = 'UNIDADE'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."UNIDADE"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 853.360000000000000000
          Top = 3.000000000000000000
          Width = 67.200000000000000000
          Height = 19.200000000000000000
          DataField = 'PR_VENDA'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."PR_VENDA"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 934.000000000000000000
          Top = 3.000000000000000000
          Width = 62.400000000000000000
          Height = 19.200000000000000000
          DataField = 'QTD_ATUAL'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."QTD_ATUAL"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 1000.400000000000000000
          Top = 3.000000000000000000
          Width = 81.600000000000000000
          Height = 19.200000000000000000
          DataField = 'TOTAL_VENDA'
          DataSet = frmProdutos.frxDBProduto
          DataSetName = 'frxDBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."TOTAL_VENDA"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2f'
              Kind = fkNumeric
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 144.000000000000000000
        Top = 18.897650000000000000
        Width = 1084.120385200000000000
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Width = 1083.840000000000000000
          Height = 144.000000000000000000
          Frame.Typ = []
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 121.304020000000000000
          Top = 6.856710000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBEmp'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."FANTASIA"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 19.200000000000000000
          Top = 101.379530000000000000
          Width = 1061.367100000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTAGEM DE PRODUTOS')
          ParentFont = False
        end
        object frxDBEmpresaENDERECO: TfrxMemoView
          AllowVectorExport = True
          Left = 120.600000000000000000
          Top = 49.600000000000000000
          Width = 624.000000000000000000
          Height = 19.200000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'END:[frxDBEmpresa."ENDERECO"],[frxDBEmpresa."NUMERO"] - [frxDBEm' +
              'presa."BAIRRO"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 121.200000000000000000
          Top = 71.400000000000000000
          Width = 624.000000000000000000
          Height = 19.200000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:[frxDBEmpresa."FONE"] EMAIL:[frxDBEmpresa."EMAIL"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 17.200000000000000000
          Top = 124.000000000000000000
          Width = 1064.995300000000000000
          Height = 19.200000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[PARAMETRO]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 96.600000000000000000
          Width = 1082.880000000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object frxDBEmpresaRAZAO: TfrxMemoView
          AllowVectorExport = True
          Left = 120.600000000000000000
          Top = 28.800000000000000000
          Width = 403.200000000000000000
          Height = 19.200000000000000000
          DataField = 'RAZAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."RAZAO"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 15.200000000000000000
          Top = 13.200000000000000000
          Width = 86.400000000000000000
          Height = 76.800000000000000000
          DataField = 'LOGOMARCA'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.000000000000000000
        Top = 185.196970000000000000
        Width = 1084.120385200000000000
        object Memo23: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clMenu
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 2.880000000000000000
          Top = 1.599999999999990000
          Width = 48.000000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 54.720000000000000000
          Top = 2.000000000000000000
          Width = 115.200000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#211'D.BARRA')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 254.400000000000000000
          Top = 2.000000000000000000
          Width = 316.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 172.800000000000000000
          Top = 2.000000000000000000
          Width = 76.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'REFER'#202'NCIA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 576.000000000000000000
          Top = 2.000000000000000000
          Width = 230.400000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GRUPO')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 817.160000000000000000
          Top = 2.000000000000000000
          Width = 28.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UND')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 853.360000000000000000
          Top = 2.000000000000000000
          Width = 67.200000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 934.000000000000000000
          Top = 2.000000000000000000
          Width = 62.400000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ESTOQUE')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 1005.000000000000000000
          Top = 2.000000000000000000
          Width = 76.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 434.645950000000000000
        Width = 1084.120385200000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 489.600000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio emitido em [DATE]- [TIME]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 657.179530000000000000
          Top = 1.000000000000000000
          Width = 96.000000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'g.[PAGE#]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 3.779530000000000000
        Top = 355.275820000000000000
        Width = 1084.120385200000000000
        object Memo25: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 3.779530000000000000
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 28.800000000000000000
        Top = 381.732530000000000000
        Width = 1084.120385200000000000
        object Memo29: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 28.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clMenu
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 124.400000000000000000
          Top = 4.000000000000000000
          Width = 153.600000000000000000
          Height = 19.200000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBProduto."PR_CUSTO">,MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 5.200000000000000000
          Top = 4.000000000000000000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO TOTAL>>>')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 478.000000000000000000
          Top = 4.000000000000000000
          Width = 163.200000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBProduto."QTD_ATUAL">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 357.600000000000000000
          Top = 4.000000000000000000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD. TOTAL>>>')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 840.400000000000000000
          Top = 3.600000000000000000
          Width = 163.200000000000000000
          Height = 19.200000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBProduto."PR_VENDA">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 714.400000000000000000
          Top = 3.600000000000000000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL>>>')
          ParentFont = False
        end
      end
    end
  end
  object frxDBRelatorioD: TfrxDBDataset
    UserName = 'frxDBRelatorioD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUMERO=NUMERO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'CHAVE=CHAVE'
      'PROTOCOLO=PROTOCOLO'
      'SITUACAO=SITUACAO'
      'VIRTUAL_SITUACAO=VIRTUAL_SITUACAO'
      'TOTAL=TOTAL')
    DataSet = qryRelatorioD
    BCDToCurrency = False
    Left = 584
    Top = 217
  end
  object qryVenda: TFDQuery
    AfterPost = qryVendaAfterPost
    BeforeDelete = qryVendaBeforeDelete
    OnCalcFields = qryVendaCalcFields
    AggregatesActive = True
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvRefreshMode]
    SQL.Strings = (
      
        'select VM.*,  pes.razao, co.descricao caixa, ve.nome vendedor, p' +
        'es.email1, usu.login, PES.WHATSAPP from NFCE_MASTER vm'
      'left join pessoa pes on pes.codigo=vm.id_cliente'
      'left join contas co on co.codigo=vm.fk_caixa'
      'left join vendedores ve on ve.codigo=vm.fk_vendedor'
      'left join usuarios usu on usu.codigo=vm.fk_usuario'
      'where '
      'VM.CODIGO>0'
      '/*where*/')
    Left = 45
    Top = 128
    object qryVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryVendaCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryVendaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryVendaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryVendaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryVendaHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryVendaHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryVendaID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryVendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryVendaFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryVendaFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryVendaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryVendaCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryVendaOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryVendaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryVendaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryVendaXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryVendaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryVendaMOTIVOCANCELAMENTO: TStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = 'MOTIVOCANCELAMENTO'
      Size = 200
    end
    object qryVendaFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryVendaVIRTUAL_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CLIENTE'
      LookupDataSet = Dados.qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'ID_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qryVendaVIRTUAL_VENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_VENDEDOR'
      LookupDataSet = Dados.qryVendedor
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'FK_VENDEDOR'
      Size = 50
      Lookup = True
    end
    object qryVendaVIRTUAL_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_SITUACAO'
      Calculated = True
    end
    object qryVendaRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryVendaCAIXA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAIXA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryVendaVENDEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VENDEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryVendaLOGIN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryVendaABERTO: TStringField
      FieldName = 'ABERTO'
      Origin = 'ABERTO'
      Size = 1
    end
    object qryVendaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryVendaFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryVendaEMAIL1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryVendaVIRTUAL_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_TIPO'
      Size = 30
      Calculated = True
    end
    object qryVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaCNF: TStringField
      FieldName = 'CNF'
      Origin = 'CNF'
    end
    object qryVendaXML_CANCELAMENTO: TMemoField
      FieldName = 'XML_CANCELAMENTO'
      Origin = 'XML_CANCELAMENTO'
      BlobType = ftMemo
    end
    object qryVendaAGRUPADO: TStringField
      FieldName = 'AGRUPADO'
      Origin = 'AGRUPADO'
      Size = 1
    end
    object qryVendaWHATSAPP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'WHATSAPP'
      Origin = 'WHATSAPP'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryVendaTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(TOTAL)'
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    OnDataChange = dsVendaDataChange
    Left = 56
    Top = 232
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 568
    Top = 120
  end
  object qryItem: TFDQuery
    AfterPost = qryItemAfterPost
    BeforeDelete = qryItemBeforeDelete
    AggregatesActive = True
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select VD.*,  PRO.DESCRICAO FROM NFCE_DETALHE VD'
      'LEFT JOIN PRODUTO pro on pro.codigo=vd.id_produto'
      'where'
      'FKVENDA=:CODIGO'
      'ORDER BY ITEM;')
    Left = 179
    Top = 168
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryItemCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItemDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItemFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryItemNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryItemCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItemCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryItemCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 4
    end
    object qryItemTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryItemCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object qryItemCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object qryItemCMUNFG: TIntegerField
      FieldName = 'CMUNFG'
      Origin = 'CMUNFG'
    end
    object qryItemCLISTASERV: TIntegerField
      FieldName = 'CLISTASERV'
      Origin = 'CLISTASERV'
    end
    object qryItemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItemFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryItemQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItemE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryItemPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemP_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'P_REDUCAO_ICMS'
      Origin = 'P_REDUCAO_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_ISS: TFMTBCDField
      FieldName = 'BASE_ISS'
      Origin = 'BASE_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_ISS: TFMTBCDField
      FieldName = 'ALIQ_ISS'
      Origin = 'ALIQ_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ISS: TFMTBCDField
      FieldName = 'VALOR_ISS'
      Origin = 'VALOR_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Origin = 'VICMSDESON'
      Precision = 18
      Size = 4
    end
    object qryItemTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TOTAL)'
    end
    object qryItemTTOTALDESON: TAggregateField
      FieldName = 'TTOTALDESON'
      DisplayName = ''
      Expression = 'SUM(VICMSDESON)'
    end
  end
  object dsItem: TDataSource
    DataSet = qryItem
    Left = 176
    Top = 224
  end
  object qryXML: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select'
      'NM.numero,'
      'NM.data_emissao,'
      'NM.chave,'
      'NM.TRIB_FED,'
      'NM.TRIB_EST,'
      'NM.TRIB_MUN,'
      'NM.TRIB_IMP,'
      'NM.situacao,'
      'NM.serie,'
      'NM.xml,'
      'NM.xml_cancelamento,'
      'NM.total'
      'FROM NFCE_MASTER NM'
      'WHERE'
      'NM.SITUACAO in ('#39'T'#39','#39'C'#39') AND'
      'NM.data_emissao between :DATA1 AND :DATA2 AND'
      'NM.FKEMPRESA=:ID'
      'ORDER BY NM.numero;')
    Left = 40
    Top = 80
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryXMLNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryXMLDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryXMLCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryXMLTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryXMLTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryXMLTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryXMLTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryXMLSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryXMLSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryXMLXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryXMLTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryXMLXML_CANCELAMENTO: TMemoField
      FieldName = 'XML_CANCELAMENTO'
      Origin = 'XML_CANCELAMENTO'
      BlobType = ftMemo
    end
  end
  object dsEmpresa: TDataSource
    DataSet = Dados.qryEmpresa
    Left = 288
    Top = 144
  end
  object qryTributacao: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select pro.csticms as cst, pro.csosn, sum(vd.total) total from N' +
        'FCE_detalhe vd'
      'left join nfce_master vm on vm.codigo=vd.fkvenda'
      'left join produto pro on pro.codigo=vd.id_produto'
      'where'
      'vm.data_emissao between :data1 and :data2'
      'and vm.fkempresa=:id'
      '/*where*/'
      'group by 1,2')
    Left = 296
    Top = 328
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTributacaoCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryTributacaoCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 4
    end
    object qryTributacaoTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object frxDBTributacao: TfrxDBDataset
    UserName = 'frxDBTributacao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CST=CST'
      'CSOSN=CSOSN'
      'TOTAL=TOTAL')
    DataSet = qryTributacao
    BCDToCurrency = False
    Left = 584
    Top = 264
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'FANTASIA=FANTASIA'
      'RAZAO=RAZAO'
      'CNPJ=CNPJ'
      'IE=IE'
      'IM=IM'
      'ENDERECO=ENDERECO'
      'NUMERO=NUMERO'
      'COMPLEMENTO=COMPLEMENTO'
      'BAIRRO=BAIRRO'
      'CIDADE=CIDADE'
      'UF=UF'
      'CEP=CEP'
      'FONE=FONE'
      'FAX=FAX'
      'EMAIL=EMAIL'
      'SITE=SITE'
      'LOGOMARCA=LOGOMARCA'
      'ID_PLANO_TRANSFERENCIA_C=ID_PLANO_TRANSFERENCIA_C'
      'ID_PLANO_TRANSFERENCIA_D=ID_PLANO_TRANSFERENCIA_D'
      'ID_CAIXA_GERAL=ID_CAIXA_GERAL'
      'BLOQUEAR_ESTOQUE_NEGATIVO=BLOQUEAR_ESTOQUE_NEGATIVO'
      'ID_CIDADE=ID_CIDADE'
      'CRT=CRT'
      'ID_UF=ID_UF'
      'ID_PLANO_VENDA=ID_PLANO_VENDA'
      'OBSFISCO=OBSFISCO'
      'CFOP=CFOP'
      'CSOSN=CSOSN'
      'CST_ICMS=CST_ICMS'
      'ALIQ_ICMS=ALIQ_ICMS'
      'CST_ENTRADA=CST_ENTRADA'
      'CST_SAIDA=CST_SAIDA'
      'ALIQ_PIS=ALIQ_PIS'
      'ALIQ_COF=ALIQ_COF'
      'CST_IPI=CST_IPI'
      'ALIQ_IPI=ALIQ_IPI')
    DataSet = Dados.qryEmpresa
    BCDToCurrency = False
    Left = 608
    Top = 336
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 1000
    Top = 176
  end
  object qryCliente: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT CODIGO,RAZAO,CLI FROM('
      
        'SELECT (0) AS CODIGO, ('#39' <todas os clientes>'#39') AS RAZAO, '#39'S'#39' as ' +
        'CLI from RDB$DataBase'
      ')'
      'UNION '
      'SELECT CODIGO,RAZAO,CLI FROM('
      
        'SELECT pe.codigo, (pe.razao||'#39' | '#39'||pe.cnpj) as razao, pe.cli FR' +
        'OM PESSOA pe'
      'where CODIGO>=0 and CLI='#39'S'#39
      ')'
      'order by 2')
    Left = 56
    Top = 288
    object qryClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryClienteRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryClienteCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
  end
  object qryCorrecao: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from NFCE_CARTA'
      'where'
      'FK_NFCE=:ID'
      'Order by sequencia desc')
    Left = 296
    Top = 256
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCorrecaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCorrecaoFK_NFCE: TIntegerField
      FieldName = 'FK_NFCE'
      Origin = 'FK_NFCE'
    end
    object qryCorrecaoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object qryCorrecaoFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
    end
    object qryCorrecaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCorrecaoCORRECAO: TMemoField
      FieldName = 'CORRECAO'
      Origin = 'CORRECAO'
      BlobType = ftMemo
    end
  end
  object dsCorrecao: TDataSource
    DataSet = qryCorrecao
    Left = 960
    Top = 120
  end
  object qryInutiliza: TFDQuery
    BeforeDelete = qryVendaBeforeDelete
    OnCalcFields = qryVendaCalcFields
    AggregatesActive = True
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select VM.* from NFCE_MASTER vm'
      'where '
      'VM.fkempresa=:id and'
      'vm.numero=:nume'
      '')
    Left = 173
    Top = 119
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUME'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryInutilizaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryInutilizaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryInutilizaCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryInutilizaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryInutilizaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryInutilizaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryInutilizaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryInutilizaHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryInutilizaHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryInutilizaID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryInutilizaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryInutilizaFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryInutilizaFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryInutilizaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryInutilizaCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryInutilizaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryInutilizaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryInutilizaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryInutilizaBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      Precision = 18
      Size = 2
    end
    object qryInutilizaOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryInutilizaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryInutilizaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryInutilizaXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryInutilizaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryInutilizaMOTIVOCANCELAMENTO: TStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = 'MOTIVOCANCELAMENTO'
      Size = 200
    end
    object qryInutilizaTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryInutilizaTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryInutilizaFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryInutilizaABERTO: TStringField
      FieldName = 'ABERTO'
      Origin = 'ABERTO'
      Size = 1
    end
    object qryInutilizaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryInutilizaFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryInutilizaOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      Precision = 18
      Size = 2
    end
  end
  object qryProduto: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      'PRO.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.pr_venda,'
      'pro.tipo,'
      'pro.csticms,'
      'pro.cfop cfop,'
      'pro.csosn,'
      'pro.aliq_icm,'
      'pro.cste,'
      'pro.csts,'
      'pro.cest,'
      'pro.aliq_pis,'
      'pro.aliq_cof,'
      'pro.ncm,'
      'ibpt.nacionalfederal,'
      'ibpt.importadosfederal,'
      'ibpt.estadual,'
      'ibpt.municipal,'
      'pro.codbarra'
      'FROM PRODUTO pro'
      'LEFT JOIN ibpt on pro.ncm = ibpt.codigo'
      'where'
      'pro.codigo=:ID')
    Left = 294
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdutoPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdutoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 30
    end
    object qryProdutoCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Origin = 'CSTICMS'
      Size = 5
    end
    object qryProdutoCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryProdutoCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 5
    end
    object qryProdutoALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      Required = True
    end
    object qryProdutoCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryProdutoCSTS: TStringField
      FieldName = 'CSTS'
      Origin = 'CSTS'
      Size = 5
    end
    object qryProdutoALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
    end
    object qryProdutoALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
    end
    object qryProdutoNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryProdutoNACIONALFEDERAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NACIONALFEDERAL'
      Origin = 'NACIONALFEDERAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryProdutoIMPORTADOSFEDERAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMPORTADOSFEDERAL'
      Origin = 'IMPORTADOSFEDERAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 19
    end
    object qryProdutoESTADUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADUAL'
      Origin = 'ESTADUAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryProdutoMUNICIPAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MUNICIPAL'
      Origin = 'MUNICIPAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdutoCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
  end
  object qryIBPT: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from IBPT'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 48
    Top = 175
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object qryIBPTCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
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
  end
  object qrySomaNFCe: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'SUM(vd.valor_item) TOTAL,'
      'SUM(vd.base_icms) BASE_ICMS,'
      'SUM(vd.valor_icms) VALOR_ICMS,'
      'SUM(vd.base_pis_icms) BASE_PIS_ICMS,'
      'SUM(vd.valor_pis_icms) VALOR_PIS_ICMS,'
      'SUM(vd.base_cofins_icms) BASE_COF_ICMS,'
      'SUM(vd.valor_cofins_icms) VALOR_COF_ICMS,'
      'SUM(vd.base_iss) BASE_ISS,'
      'SUM(vd.valor_iss) VALOR_ISS,'
      'SUM(vd.trib_mun) TOTALMUN,'
      'SUM(vd.trib_fed) TOTALFED,'
      'SUM(vd.trib_est) TOTALEST,'
      'SUM(vd.trib_imp) TOTALIMP,'
      'sum(vd.vdesconto) descontos,'
      'sum(vd.outros) outros'
      'FROM nfce_detalhe vd'
      'where'
      'vd.FKVENDA=:CODIGO')
    Left = 178
    Top = 288
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qrySomaNFCeTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeBASE_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeVALOR_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeBASE_PIS_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeVALOR_PIS_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeBASE_COF_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_COF_ICMS'
      Origin = 'BASE_COF_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeVALOR_COF_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_COF_ICMS'
      Origin = 'VALOR_COF_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeBASE_ISS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ISS'
      Origin = 'BASE_ISS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeVALOR_ISS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ISS'
      Origin = 'VALOR_ISS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeTOTALMUN: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALMUN'
      Origin = 'TOTALMUN'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeTOTALFED: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALFED'
      Origin = 'TOTALFED'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeTOTALEST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALEST'
      Origin = 'TOTALEST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeTOTALIMP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTALIMP'
      Origin = 'TOTALIMP'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeDESCONTOS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESCONTOS'
      Origin = 'DESCONTOS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaNFCeOUTROS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qryRelatorioD: TFDQuery
    OnCalcFields = qryRelatorioDCalcFields
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'NM.numero,'
      'NM.data_emissao,'
      'NM.chave,'
      'NM.PROTOCOLO,'
      'NM.TOTAL,'
      'NM.situacao'
      'FROM NFCE_MASTER NM'
      'WHERE'
      '/*pSituacao*/'
      'NM.data_emissao between :DATA1 AND :DATA2 AND'
      'NM.FKEMPRESA=:EMP'
      'ORDER BY  NM.SITUACAO, NM.DATA_EMISSAO, NM.numero;')
    Left = 376
    Top = 304
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryRelatorioDNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryRelatorioDDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryRelatorioDCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryRelatorioDPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryRelatorioDSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryRelatorioDVIRTUAL_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_SITUACAO'
      Size = 44
      Calculated = True
    end
    object qryRelatorioDTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUMERO=NUMERO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'CHAVE=CHAVE'
      'PROTOCOLO=PROTOCOLO'
      'SITUACAO=SITUACAO'
      'VIRTUAL_SITUACAO=VIRTUAL_SITUACAO'
      'TOTAL=TOTAL')
    DataSet = qryRelatorioD
    BCDToCurrency = False
    Left = 296
    Top = 400
  end
  object qryVendasFPG: TFDQuery
    AfterOpen = qryVendasFPGAfterOpen
    MasterSource = FrmPDV.dsVenda
    MasterFields = 'CODIGO'
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from vendas_fpg  fpg'
      'where'
      'fpg.vendas_master=:CODIGO'
      'order by fpg.codigo')
    Left = 184
    Top = 352
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVendasFPGCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendasFPGVENDAS_MASTER: TIntegerField
      FieldName = 'VENDAS_MASTER'
      Origin = 'VENDAS_MASTER'
      Required = True
    end
    object qryVendasFPGID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
      Origin = 'ID_FORMA'
    end
    object qryVendasFPGVIRTUAL_FORMA: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_FORMA'
      LookupDataSet = qryFPG
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_FORMA'
      Size = 30
      Lookup = True
    end
    object qryVendasFPGVIRTUAL_TIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TIPO'
      LookupDataSet = qryFPG
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TIPO'
      KeyFields = 'ID_FORMA'
      Size = 5
      Lookup = True
    end
    object qryVendasFPGVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryVendasFPGFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryVendasFPGSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryVendasFPGTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
  end
  object qryPV: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select PV.*, PES.razao, ve.nome from VENDAS_MASTER PV'
      'LEFT JOIN pessoa PES on PES.codigo= PV.id_cliente'
      'LEFT JOIN vendedores ve on ve.codigo= PV.fk_vendedor'
      'where'
      'pv.codigo=:id')
    Left = 368
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPVDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryPVDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryPVID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPVFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryPVFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryPVFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryPVCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryPVSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryPVTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryPVDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPVTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryPVDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryPVTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPVOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryPVSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryPVFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryPVPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 2
    end
    object qryPVTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryPVNECF: TIntegerField
      FieldName = 'NECF'
      Origin = 'NECF'
    end
    object qryPVFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryPVLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryPVGERA_FINANCEIRO: TStringField
      FieldName = 'GERA_FINANCEIRO'
      Origin = 'GERA_FINANCEIRO'
      Size = 1
    end
    object qryPVPERCENTUAL_ACRESCIMO: TFMTBCDField
      FieldName = 'PERCENTUAL_ACRESCIMO'
      Origin = 'PERCENTUAL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPVACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPVFK_TABELA: TIntegerField
      FieldName = 'FK_TABELA'
      Origin = 'FK_TABELA'
    end
    object qryPVPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 30
    end
    object qryPVRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPVNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
  end
  object qryPV_Itens: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select pv.*, pro.descricao produto, pro.unidade from VENDAS_DETA' +
        'LHE pv'
      'LEFT JOIN produto pro on pro.codigo=pv.id_produto'
      'WHERE'
      'FKVENDA=:CODIGO'
      'ORDER BY ITEM')
    Left = 368
    Top = 128
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPV_ItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPV_ItensFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryPV_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryPV_ItensITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryPV_ItensCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryPV_ItensQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryPV_ItensE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryPV_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryPV_ItensQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryPV_ItensACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPV_ItensUNIDADE_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE_1'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryPV_ItensID_SERIAL: TIntegerField
      FieldName = 'ID_SERIAL'
      Origin = 'ID_SERIAL'
    end
    object qryPV_ItensFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
    end
  end
  object qryProd: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, EFISCAL, E_MEDIO FROM PRODUTO')
    Left = 176
    Top = 73
    object qryProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
  end
  object qryFPG: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM FORMA_PAGAMENTO'
      'WHERE ATIVO='#39'S'#39
      'ORDER BY 1')
    Left = 184
    Top = 400
    object qryFPGCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFPGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
    object qryFPGGERACR: TStringField
      FieldName = 'GERACR'
      Origin = 'GERACR'
      Size = 1
    end
    object qryFPGGERACH: TStringField
      FieldName = 'GERACH'
      Origin = 'GERACH'
      Size = 1
    end
    object qryFPGECARTAO: TStringField
      FieldName = 'ECARTAO'
      Origin = 'ECARTAO'
      Size = 1
    end
    object qryFPGUSAVD: TStringField
      FieldName = 'USAVD'
      Origin = 'USAVD'
      Size = 1
    end
    object qryFPGUSACR: TStringField
      FieldName = 'USACR'
      Origin = 'USACR'
      Size = 1
    end
    object qryFPGATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryFPGPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'PARCELAS'
    end
    object qryFPGINTERVALO: TIntegerField
      FieldName = 'INTERVALO'
      Origin = 'INTERVALO'
    end
    object qryFPGTAXA: TFMTBCDField
      FieldName = 'TAXA'
      Origin = 'TAXA'
      Precision = 18
      Size = 2
    end
    object qryFPGENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      Precision = 18
      Size = 2
    end
    object qryFPGTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryFPGDIAS: TSmallintField
      FieldName = 'DIAS'
      Origin = 'DIAS'
    end
    object qryFPGFKCONTADESTINO: TIntegerField
      FieldName = 'FKCONTADESTINO'
      Origin = 'FKCONTADESTINO'
    end
  end
  object QryRelatorioR: TFDQuery
    OnCalcFields = QryRelatorioRCalcFields
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'NM.situacao,'
      'NM.data_emissao,'
      'sum(NM.TOTAL) as total'
      'FROM NFCE_MASTER NM'
      'WHERE'
      '/*pSituacao*/'
      'NM.data_emissao between :DATA1 AND :DATA2 AND'
      'NM.FKEMPRESA=:EMP'
      'group by 1,2'
      'ORDER by 1,2')
    Left = 376
    Top = 240
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryRelatorioRSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object QryRelatorioRVIRTUAL_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_SITUACAO'
      Size = 30
      Calculated = True
    end
    object QryRelatorioRDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object QryRelatorioRTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object frxDBRelatorioR: TfrxDBDataset
    UserName = 'frxDBRelatorioR'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SITUACAO=SITUACAO'
      'VIRTUAL_SITUACAO=VIRTUAL_SITUACAO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'TOTAL=TOTAL')
    DataSet = QryRelatorioR
    BCDToCurrency = False
    Left = 528
    Top = 177
  end
  object qryTotalFPG: TFDQuery
    AggregatesActive = True
    MasterSource = FrmPDV.dsVenda
    MasterFields = 'CODIGO'
    Connection = Dados.Conexao
    SQL.Strings = (
      'select fpg.tipo, sum(vfpg.valor) as valor from vendas_fpg  vfpg'
      'left join forma_pagamento fpg on fpg.codigo=vfpg.id_forma'
      'where'
      'vfpg.vendas_master=:CODIGO and vfpg.valor>0'
      'group by 1')
    Left = 64
    Top = 432
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTotalFPGTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryTotalFPGVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object qryContador: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select email from contador'
      'order by email')
    Left = 376
    Top = 368
    object qryContadorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
  end
  object dsContador: TDataSource
    DataSet = qryContador
    Left = 384
    Top = 424
  end
  object qryDocumento: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from NFCE_DOCUMENTOS'
      'where'
      'ID_USUARIO=:ID'
      '')
    Left = 696
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDocumentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDocumentoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object qryDocumentoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryDocumentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryDocumentoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object qryDocumentoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 4
    end
    object qryDocumentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 4
    end
    object qryDocumentoACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 4
    end
    object qryDocumentoTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TOTAL)'
    end
    object qryDocumentoTDESCONTO: TAggregateField
      FieldName = 'TDESCONTO'
      Visible = True
      Active = True
      DisplayName = ''
      Expression = 'SUM(DESCONTO)'
    end
    object qryDocumentoTACRESCIMO: TAggregateField
      FieldName = 'TACRESCIMO'
      Visible = True
      Active = True
      DisplayName = ''
      Expression = 'SUM(ACRESCIMO)'
    end
  end
  object dsDocumento: TDataSource
    DataSet = qryDocumento
    Left = 704
    Top = 320
  end
  object qryItensPedido: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from VENDAS_DETALHE'
      'WHERE'
      'FKVENDA=:ID'
      '')
    Left = 832
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensPedidoFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryItensPedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryItensPedidoITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItensPedidoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItensPedidoQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItensPedidoE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItensPedidoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItensPedidoQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryItensPedidoACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryItensPedidoOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryItensPedidoFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
    end
    object qryItensPedidoID_PRODUTO_SIMILAR: TIntegerField
      FieldName = 'ID_PRODUTO_SIMILAR'
      Origin = 'ID_PRODUTO_SIMILAR'
    end
    object qryItensPedidoID_SERIAL: TIntegerField
      FieldName = 'ID_SERIAL'
      Origin = 'ID_SERIAL'
    end
  end
  object qryItensOrcamento: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from ORCAMENTO_ITEM'
      'where'
      'FK_ORCAMENTO=:ID'
      '')
    Left = 832
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensOrcamentoFK_ORCAMENTO: TIntegerField
      FieldName = 'FK_ORCAMENTO'
      Origin = 'FK_ORCAMENTO'
      Required = True
    end
    object qryItensOrcamentoFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
    end
    object qryItensOrcamentoQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItensOrcamentoPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryItensOrcamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryItensOrcamentoITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItensOrcamentoFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
    end
    object qryItensOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryItensOrcamentoTOTAL_C_DESCONTO: TFMTBCDField
      FieldName = 'TOTAL_C_DESCONTO'
      Origin = 'TOTAL_C_DESCONTO'
      Precision = 18
      Size = 2
    end
  end
  object qryOrcamento: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select CODIGO, TOTAL, SUBTOTAL, DESCONTO from ORCAMENTO'
      'WHERE'
      'CODIGO=:ID'
      '')
    Left = 928
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
  end
  object qryPedido: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select CODIGO, TOTAL, SUBTOTAL, DESCONTO, ACRESCIMO from VENDAS_' +
        'MASTER'
      'WHERE'
      'CODIGO=:ID'
      '')
    Left = 920
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPedidoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryPedidoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPedidoACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
  end
  object QRYNFCE_D: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT ND.*, PRO.DESCRICAO FROM NFCE_DETALHE ND'
      'LEFT JOIN PRODUTO PRO ON PRO.CODIGO=ND.ID_PRODUTO'
      'WHERE'
      'ND.FKVENDA=:NFE')
    Left = 480
    Top = 312
    ParamData = <
      item
        Name = 'NFE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QRYNFCE_DCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QRYNFCE_DFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object QRYNFCE_DID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object QRYNFCE_DITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object QRYNFCE_DCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object QRYNFCE_DNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object QRYNFCE_DCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object QRYNFCE_DCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object QRYNFCE_DCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 4
    end
    object QRYNFCE_DTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object QRYNFCE_DCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object QRYNFCE_DCMUNFG: TIntegerField
      FieldName = 'CMUNFG'
      Origin = 'CMUNFG'
    end
    object QRYNFCE_DCLISTASERV: TIntegerField
      FieldName = 'CLISTASERV'
      Origin = 'CLISTASERV'
    end
    object QRYNFCE_DSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object QRYNFCE_DFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object QRYNFCE_DUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object QRYNFCE_DDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QRYNFCE_DQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object QRYNFCE_DE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object QRYNFCE_DPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DP_REDUCAO_ICMS: TFMTBCDField
      FieldName = 'P_REDUCAO_ICMS'
      Origin = 'P_REDUCAO_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DBASE_ISS: TFMTBCDField
      FieldName = 'BASE_ISS'
      Origin = 'BASE_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DALIQ_ISS: TFMTBCDField
      FieldName = 'ALIQ_ISS'
      Origin = 'ALIQ_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DVALOR_ISS: TFMTBCDField
      FieldName = 'VALOR_ISS'
      Origin = 'VALOR_ISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRYNFCE_DCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object QRYNFCE_DCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 8
    end
  end
  object qryNFCE_M: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM NFCE_MASTER'
      'WHERE'
      'CODIGO=:ID')
    Left = 480
    Top = 256
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryNFCE_MCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFCE_MNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryNFCE_MCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFCE_MMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryNFCE_MSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFCE_MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryNFCE_MDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryNFCE_MHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryNFCE_MHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryNFCE_MID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryNFCE_MID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryNFCE_MFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryNFCE_MFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryNFCE_MFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryNFCE_MCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryNFCE_MTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryNFCE_MOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryNFCE_MSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFCE_MEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryNFCE_MXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryNFCE_MPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryNFCE_MMOTIVOCANCELAMENTO: TStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = 'MOTIVOCANCELAMENTO'
      Size = 200
    end
    object qryNFCE_MFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryNFCE_MABERTO: TStringField
      FieldName = 'ABERTO'
      Origin = 'ABERTO'
      Size = 1
    end
    object qryNFCE_MFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryNFCE_MFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryNFCE_MSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MSAT_NUMERO_CFE: TIntegerField
      FieldName = 'SAT_NUMERO_CFE'
      Origin = 'SAT_NUMERO_CFE'
      DisplayFormat = ',0.00'
    end
    object qryNFCE_MSAT_NUMERO_SERIE: TStringField
      FieldName = 'SAT_NUMERO_SERIE'
      Origin = 'SAT_NUMERO_SERIE'
      Size = 10
    end
    object qryNFCE_MCNF: TStringField
      FieldName = 'CNF'
      Origin = 'CNF'
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 296
    Top = 193
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnMailProcess = ACBrMail1MailProcess
    Left = 728
    Top = 192
  end
  object ActionList1: TActionList
    Left = 1008
    Top = 248
    object actEnviar: TAction
      Caption = 'Enviar'
      ShortCut = 16453
      OnExecute = actEnviarExecute
    end
  end
end
