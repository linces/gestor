object FrmPDV: TFrmPDV
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'PDV'
  ClientHeight = 803
  ClientWidth = 1294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 1294
    Height = 784
    Align = alClient
    Caption = 'Panel6'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 371
      Height = 782
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        371
        782)
      object imgLogo: TImage
        Left = 0
        Top = 0
        Width = 371
        Height = 417
        Align = alCustom
        AutoSize = True
        Center = True
        OnDblClick = imgLogoDblClick
      end
      object Label1: TLabel
        Left = 79
        Top = 308
        Width = 187
        Height = 84
        Alignment = taCenter
        Anchors = []
        Caption = 
          'D'#202' UM DUPLO CLIQUE E COLOQUE SUA LOGO AQUI FORMATO PNG - 327 x 3' +
          '95 Pixels'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        OnDblClick = imgLogoDblClick
        ExplicitLeft = 63
        ExplicitTop = 299
      end
      object cxDBImage1: TcxDBImage
        Left = 40
        Top = 462
        AutoSize = True
        DataBinding.DataField = 'FOTO'
        DataBinding.DataSource = dsPesqProd
        Properties.GraphicClassName = 'TdxSmartImage'
        TabOrder = 0
        Height = 207
        Width = 305
      end
    end
    object Panel1: TPanel
      Left = 372
      Top = 1
      Width = 921
      Height = 782
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 921
        Height = 673
        ActivePage = TabPDV
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Style = tsButtons
        TabOrder = 0
        OnChange = PageControl2Change
        object TabPDV: TTabSheet
          Caption = 'PDV'
          object PanelPDV: TPanel
            Left = 0
            Top = 0
            Width = 913
            Height = 639
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            Color = 15066597
            ParentBackground = False
            TabOrder = 0
            object DBGridP: TDBGridEh
              Left = 5
              Top = 81
              Width = 903
              Height = 425
              Align = alClient
              Color = clBtnFace
              DataSource = dsItem
              DynProps = <>
              EvenRowColor = clBtnFace
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = clBtnFace
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghExtendVertLines]
              ParentFont = False
              TabOrder = 1
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -13
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              OnDblClick = DBGridPDblClick
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ITEM'
                  Footers = <>
                  Title.Caption = 'Item'
                  Width = 45
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ID_PRODUTO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 54
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO_SL'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 395
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Qtd'
                  Width = 75
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIDADE'
                  Footers = <>
                  Title.Caption = 'Und.'
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PRECO'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Pre'#231'o R$'
                  Width = 103
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'VALOR_ITEM'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Total R$'
                  Width = 120
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object grpSelecaoP: TGroupBox
              Left = 5
              Top = 5
              Width = 903
              Height = 76
              Align = alTop
              Caption = 'F12  C'#243'digo | C'#243'digo de Barras | Descri'#231#227'o | Refer'#234'ncia'
              Color = 11299390
              Ctl3D = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentColor = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              object EdtProdutoP: TEdit
                AlignWithMargins = True
                Left = 4
                Top = 24
                Width = 895
                Height = 48
                Align = alClient
                BorderStyle = bsNone
                CharCase = ecUpperCase
                Color = 16312022
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -37
                Font.Name = 'Segoe UI'
                Font.Style = []
                MaxLength = 40
                ParentFont = False
                TabOrder = 0
                OnChange = EdtProdutoPChange
                OnKeyDown = EdtProdutoPKeyDown
                OnKeyPress = EdtProdutoPKeyPress
              end
            end
            object Panel10: TPanel
              Left = 5
              Top = 506
              Width = 903
              Height = 128
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object Panel16: TPanel
                Left = 0
                Top = 0
                Width = 903
                Height = 128
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 10
                TabOrder = 0
                object GrpPrecoP: TGroupBox
                  Left = 180
                  Top = 10
                  Width = 189
                  Height = 108
                  Align = alLeft
                  Caption = 'Pre'#231'o'
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI Semilight'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  object edtPrecoP: TEdit
                    AlignWithMargins = True
                    Left = 4
                    Top = 29
                    Width = 181
                    Height = 75
                    TabStop = False
                    Align = alClient
                    Alignment = taRightJustify
                    BorderStyle = bsNone
                    CharCase = ecUpperCase
                    Color = clSkyBlue
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -43
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    MaxLength = 999999
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    Text = '0,00'
                    OnExit = edtPrecoPExit
                    OnKeyPress = edtPrecoPKeyPress
                  end
                end
                object GrpQtdP: TGroupBox
                  Left = 10
                  Top = 10
                  Width = 170
                  Height = 108
                  Align = alLeft
                  Caption = 'Qtd'
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI Semilight'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 1
                  object edtQtdP: TEdit
                    AlignWithMargins = True
                    Left = 4
                    Top = 29
                    Width = 162
                    Height = 75
                    TabStop = False
                    Align = alClient
                    Alignment = taRightJustify
                    BorderStyle = bsNone
                    CharCase = ecUpperCase
                    Color = clSkyBlue
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -43
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    MaxLength = 999999
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                    Text = '1'
                    OnEnter = edtQtdPEnter
                    OnExit = edtQtdPExit
                    OnKeyPress = edtQtdPKeyPress
                  end
                end
                object grpTotalP: TGroupBox
                  Left = 369
                  Top = 10
                  Width = 239
                  Height = 108
                  Align = alLeft
                  Caption = 'Total do Item'
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI Semilight'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 2
                  object lblTotalP: TLabel
                    Left = 1
                    Top = 26
                    Width = 237
                    Height = 81
                    Align = alClient
                    Alignment = taRightJustify
                    Caption = '0,00'
                    Color = clSilver
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -48
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    ExplicitLeft = 150
                    ExplicitWidth = 88
                    ExplicitHeight = 65
                  end
                end
                object grpTotalGeralP: TGroupBox
                  Left = 608
                  Top = 10
                  Width = 285
                  Height = 108
                  Align = alClient
                  Caption = 'Total '
                  Ctl3D = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Segoe UI Semilight'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 3
                  object DBText1: TDBText
                    Left = 1
                    Top = 26
                    Width = 283
                    Height = 81
                    Align = alClient
                    Alignment = taRightJustify
                    AutoSize = True
                    DataField = 'TOTAL'
                    DataSource = dsVenda
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clBlack
                    Font.Height = -48
                    Font.Name = 'Segoe UI'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ExplicitLeft = 95
                    ExplicitWidth = 189
                    ExplicitHeight = 65
                  end
                end
              end
            end
            object DBGridBuscaP: TDBGridEh
              Left = 5
              Top = 81
              Width = 903
              Height = 425
              Align = alClient
              Color = 14869218
              DataSource = dsPesqProd
              DynProps = <>
              EvenRowColor = 15854823
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = 16447733
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 3
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -15
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              Visible = False
              OnDblClick = DBGridBuscaPDblClick
              OnKeyPress = DBGridBuscaPKeyPress
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CODIGO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 59
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 493
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'VIRTUAL_PRECO'
                  Footers = <>
                  Title.Caption = 'Pre'#231'o'
                  Width = 93
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD_ATUAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Estoque'
                  Width = 77
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIDADE'
                  Footers = <>
                  Title.Caption = 'Und'
                  Width = 32
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'LOCALIZACAO'
                  Footers = <>
                  Title.Caption = 'Local'
                  Width = 82
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD_FISCAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Est.Fiscal'
                  Width = 72
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        object tabRestaurante: TTabSheet
          Caption = 'Retaurante'
          ImageIndex = 1
          object pnRestaurante: TPanel
            Left = 0
            Top = 33
            Width = 333
            Height = 606
            Align = alLeft
            BevelOuter = bvNone
            BorderWidth = 1
            Caption = 'Panel1'
            TabOrder = 0
            object DBCtrlGrid1: TDBCtrlGrid
              Left = 1
              Top = 1
              Width = 331
              Height = 604
              Align = alClient
              AllowDelete = False
              AllowInsert = False
              ColCount = 4
              Color = clBtnFace
              DataSource = dsMesas
              PanelHeight = 75
              PanelWidth = 78
              ParentColor = False
              TabOrder = 0
              RowCount = 8
              SelectedColor = clBtnHighlight
              ShowFocus = False
              OnPaintPanel = DBCtrlGrid1PaintPanel
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 78
                Height = 75
                Align = alClient
                TabOrder = 0
                object ImgOcupado: TImage
                  Left = 1
                  Top = 24
                  Width = 76
                  Height = 50
                  Align = alClient
                  Center = True
                  Picture.Data = {
                    0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
                    004008030000009DB781EC0000000467414D410000B18F0BFC61050000010850
                    4C5445000000DFBF10E6BC15E6BB16DDBB11E5BB18E5BA17E5BA17E5B918E5B9
                    16E5BA17E7B918E5BA18E5BA17E6BA17E5BA17FFFF00E4B816E5BB17E4BA18E3
                    BC16E6BA16E5BB16E5BA17E4BA17E5BA17E6BB16E6BF1AE5BA17E4BC1BE6B917
                    E5BB18E5BA16E5BB17E6BA17E6BB17E5BA18FFAA00E6BB17E4BB17E6BA17E4BA
                    16E6B917E5BA17E4BA17EABF15E6BA18E5BA17E5B917FF8000E6B917E5BA17E5
                    BA17E5BB16E9BC16E4BC14E6BA18E5BA17E5BA17E6BA17E5BA17EABF15EBB114
                    E6BA17E5BA17E5B918E3B815E4B918E4B918E6BA17E5BB17E5BA17EDB612E4B9
                    18E5B71AE4BA16E3BA15E4B61BE6BB16E5BB16E4BA15E5BA17E8B917E5BA17E5
                    BA17E7B618E5BA17000000FA4EF0970000005674524E53001048470F61F1F46A
                    45FE49CECCFAF9012F4F552E46D8D643FC5314EF136E6C9F9DAA8381036599B5
                    B6DCF3981897E8620266EAFB9517268DCFEDE6BA0C0D6FBC8B24545FF0F2AE0E
                    AC2768251C52CD30C716FDD715B161996600000001624B47440088051D480000
                    00097048597300000EC400000EC401952B0E1B0000000774494D4507E30A1E0D
                    1A27BB8D2762000001F74944415478DAEDD4DF4FDA501407F0FB6DA96E8B730A
                    712F9BC40C799BBEF8832546832399866024CEF847BAC5E882511215906C893F
                    B2876D3C9831B681311A5034C6642AB05D4A4B577B5BA8F0604CCF43D37B38E7
                    D3DE4BEF056930600116D02400340AB76915FB400404C912FE98EE97FAF01001
                    3A0AE1C264BFDC8736BF385E393709C87D689F146FC2672601B90F735262DE24
                    20F7DD41A083FEBBBA5D7FB95C2DA00B5EC307C7706808385A466BBC7A1C0706
                    C0B36CB0E6E43F21A30F385FD5B17C5BBFF5819EE13A809D9FFAC08BC13A80DD
                    D4BD065C0375009F93FA80FB472F7E4D2BB5517B3FF98A974A2281ABA4EBBB3E
                    508E3E64A5AF710F48FBC8BAFD315C95440AD896CB8C76A387EEA76F7DC838E3
                    C441816332065C5FB67C19C28652A401AA112E7AD6AB830A2007F7889BBC59AE
                    05689CAC31014108686B99403E52600010583B8D0990489601F06F59A578D3D1
                    1090C7C4136D36D1BDCA006CFCB4B6F41CFED3E79AECC53273111F709A45DCB7
                    834C25F6558B132E8D7F204C80F081E8C4FFA58B3E3E543D81E7A44DA20E3550
                    0DBAE9E40FCF022CA06940304E2F3E72BD49C8886D41FA61A6F0915EDD4E922E
                    9FA137F26302299F5AA5BC0874BEE615BBF45EBA79EA553D93992F6EE43540EC
                    48BA99E55400335F8CE5C429742AB991D677AA2918E7A52934161660014D01FE
                    01E0ABD850C655267E0000002574455874646174653A63726561746500323031
                    392D31302D33305431333A32363A33392B30303A30308C4F7BC3000000257445
                    5874646174653A6D6F6469667900323031392D31302D33305431333A32363A33
                    392B30303A3030FD12C37F0000001974455874536F667477617265007777772E
                    696E6B73636170652E6F72679BEE3C1A0000000049454E44AE426082}
                  OnClick = ImgOcupadoClick
                  ExplicitLeft = 25
                  ExplicitTop = 64
                  ExplicitHeight = 54
                end
                object imgLivre: TImage
                  Left = 1
                  Top = 24
                  Width = 76
                  Height = 50
                  Align = alClient
                  Center = True
                  Picture.Data = {
                    0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
                    004008030000009DB781EC0000000467414D410000B18F0BFC61050000010850
                    4C54450000001060200B5C190B5D191155110D5C180C5C180B5C180C5B180B5C
                    160C5C180A5B180C5C180D5D180C5C180C5C180000000B5C160D5A170C5D180B
                    5E160B5B1A0C5C180C5C180B5B170C5C180C5C190D591A0C5C170D5E1B0C5D17
                    0C5C180B5B180B5D180C5C180C5B170C5D180055000D5B190C5C170D5C180D5C
                    180C5C180C5C180C5C170B60150C5B180C5C180D5B170080000D5D190C5C180C
                    5C180C5C180B59160D5E1B0D5C180C5C170C5D180C5C180C5C19155515146214
                    0B5C170C5C180D5C180E5C150C5B180B5B180C5C180C5C180C5C17125B120C5C
                    180D5C1A0C5D190E5A15095B1B0C5D190C5C180B5A1B0C5C180C5D170C5C180C
                    5D180C61180C5C180000007D9EA74D0000005674524E53001048470F61F1F46A
                    45FE49CECCFAF9012F4F552E46D8D643FC5314EF136E6C9F9DAA8381036599B5
                    B6DCF3981897E8620266EAFB9517268DCFEDE6BA0C0D6FBC8B24545FF0F2AE0E
                    AC2768251C52CD30C716FDD715B161996600000001624B47440088051D480000
                    00097048597300000EC400000EC401952B0E1B0000000774494D4507E30A1E0D
                    1420BB6A9F4F000001F74944415478DAEDD4DF4FDA501407F0FB6DA96E8B730A
                    712F9BC40C799BBEF8832546832399866024CEF847BAC5E882511215906C893F
                    B2876D3C9831B681311A5034C6642AB05D4A4B577B5BA8F0604CCF43D37B38E7
                    D3DE4BEF056930600116D02400340AB76915FB400404C912FE98EE97FAF01001
                    3A0AE1C264BFDC8736BF385E393709C87D689F146FC2672601B90F735262DE24
                    20F7DD41A083FEBBBA5D7FB95C2DA00B5EC307C7706808385A466BBC7A1C0706
                    C0B36CB0E6E43F21A30F385FD5B17C5BBFF5819EE13A809D9FFAC08BC13A80DD
                    D4BD065C0375009F93FA80FB472F7E4D2BB5517B3FF98A974A2281ABA4EBBB3E
                    508E3E64A5AF710F48FBC8BAFD315C95440AD896CB8C76A387EEA76F7DC838E3
                    C441816332065C5FB67C19C28652A401AA112E7AD6AB830A2007F7889BBC59AE
                    05689CAC31014108686B99403E52600010583B8D0990489601F06F59A578D3D1
                    1090C7C4136D36D1BDCA006CFCB4B6F41CFED3E79AECC53273111F709A45DCB7
                    834C25F6558B132E8D7F204C80F081E8C4FFA58B3E3E543D81E7A44DA20E3550
                    0DBAE9E40FCF022CA06940304E2F3E72BD49C8886D41FA61A6F0915EDD4E922E
                    9FA137F26302299F5AA5BC0874BEE615BBF45EBA79EA553D93992F6EE43540EC
                    48BA99E55400335F8CE5C429742AB991D677AA2918E7A52934161660014D01FE
                    01E0ABD850C655267E0000002574455874646174653A63726561746500323031
                    392D31302D33305431333A32303A33322B30303A303083565F7E000000257445
                    5874646174653A6D6F6469667900323031392D31302D33305431333A32303A33
                    322B30303A3030F20BE7C20000001974455874536F667477617265007777772E
                    696E6B73636170652E6F72679BEE3C1A0000000049454E44AE426082}
                  OnClick = ImgOcupadoClick
                  OnDblClick = imgLivreDblClick
                  ExplicitLeft = 65
                  ExplicitTop = -14
                  ExplicitHeight = 54
                end
                object DBText2: TDBText
                  Left = 1
                  Top = 1
                  Width = 76
                  Height = 23
                  Align = alTop
                  Alignment = taCenter
                  DataField = 'CODIGO'
                  DataSource = dsMesas
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -16
                  Font.Name = 'Segoe UI Semibold'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ExplicitLeft = -4
                  ExplicitTop = 81
                  ExplicitWidth = 90
                end
              end
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 913
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Color = 5592405
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              913
              33)
            object Label11: TLabel
              Left = 1237
              Top = 22
              Width = 187
              Height = 17
              Anchors = [akTop, akRight]
              Caption = 'Relat'#243'rio de Vendas no Per'#237'odo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 10066329
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 1251
            end
            object DBText3: TDBText
              Left = 30
              Top = 0
              Width = 83
              Height = 33
              Align = alLeft
              AutoSize = True
              DataField = 'VIRTUAL_MESA'
              DataSource = dsMesas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -24
              Font.Name = 'Segoe UI Semilight'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 32
            end
            object DBText4: TDBText
              Left = 143
              Top = 0
              Width = 86
              Height = 33
              Align = alLeft
              AutoSize = True
              DataField = 'VIRTUAL_SITUACAO'
              DataSource = dsMesas
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -24
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitHeight = 32
            end
            object Splitter3: TSplitter
              Left = 113
              Top = 0
              Width = 30
              Height = 33
              ExplicitLeft = 83
            end
            object Splitter5: TSplitter
              Left = 0
              Top = 0
              Width = 30
              Height = 33
              ExplicitLeft = -21
            end
          end
          object PanelRestaurante: TPanel
            Left = 333
            Top = 33
            Width = 580
            Height = 606
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object DBGridR: TDBGridEh
              Left = 0
              Top = 221
              Width = 580
              Height = 319
              Align = alClient
              Ctl3D = True
              DataSource = dsItem
              DynProps = <>
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -15
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ID_PRODUTO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 56
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO_SL'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 297
                end
                item
                  Alignment = taRightJustify
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Qtd.'
                  Width = 58
                end
                item
                  Alignment = taRightJustify
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PRECO'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Pre'#231'o'
                  Width = 73
                end
                item
                  Alignment = taRightJustify
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TOTAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Total'
                  Width = 58
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object PnCabecalhoR: TPanel
              Left = 0
              Top = 0
              Width = 580
              Height = 221
              Align = alTop
              BevelOuter = bvNone
              BorderWidth = 5
              Color = 16250871
              ParentBackground = False
              TabOrder = 1
              object grpDescricao: TGroupBox
                Left = 5
                Top = 5
                Width = 570
                Height = 65
                Align = alTop
                Caption = 'F12 C'#243'digo de Barras | Descri'#231#227'o | Refer'#234'ncia'
                Color = 11299390
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object edtProdutoR: TEdit
                  AlignWithMargins = True
                  Left = 4
                  Top = 24
                  Width = 562
                  Height = 37
                  Align = alClient
                  BorderStyle = bsNone
                  CharCase = ecUpperCase
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -27
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  OnChange = edtProdutoRChange
                  OnEnter = edtProdutoREnter
                  OnKeyDown = EdtProdutoPKeyDown
                  OnKeyPress = EdtProdutoPKeyPress
                end
              end
              object grpQtd: TGroupBox
                Left = 5
                Top = 138
                Width = 164
                Height = 78
                Align = alLeft
                Caption = 'Quantidade'
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Segoe UI Semilight'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 2
                object edtQtdR: TEdit
                  AlignWithMargins = True
                  Left = 4
                  Top = 29
                  Width = 156
                  Height = 45
                  TabStop = False
                  Align = alClient
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  CharCase = ecUpperCase
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -27
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = '1'
                  OnEnter = edtQtdPEnter
                  OnExit = edtQtdPExit
                  OnKeyPress = edtQtdPKeyPress
                end
              end
              object grpPreco: TGroupBox
                Left = 169
                Top = 138
                Width = 234
                Height = 78
                Align = alClient
                Caption = 'Pre'#231'o Unit'#225'rio'
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Segoe UI Semilight'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 3
                object edtPrecoR: TEdit
                  AlignWithMargins = True
                  Left = 4
                  Top = 29
                  Width = 226
                  Height = 45
                  TabStop = False
                  Align = alClient
                  Alignment = taRightJustify
                  BorderStyle = bsNone
                  CharCase = ecUpperCase
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -27
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  Text = '0,00'
                  OnExit = edtPrecoPExit
                  OnKeyPress = edtPrecoPKeyPress
                end
              end
              object grpTotalItem: TGroupBox
                Left = 403
                Top = 138
                Width = 172
                Height = 78
                Align = alRight
                Caption = 'Total do Item'
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Segoe UI Semilight'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 4
                object lblTotalR: TLabel
                  Left = 1
                  Top = 26
                  Width = 170
                  Height = 51
                  Align = alClient
                  Alignment = taRightJustify
                  Caption = '0,00'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -27
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  ExplicitLeft = 120
                  ExplicitWidth = 51
                  ExplicitHeight = 37
                end
              end
              object grpObs: TGroupBox
                Left = 5
                Top = 70
                Width = 570
                Height = 68
                Align = alTop
                Caption = 'Observa'#231#245'es'
                Color = 11299390
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                object edtOBSR: TEdit
                  AlignWithMargins = True
                  Left = 4
                  Top = 24
                  Width = 562
                  Height = 40
                  Align = alClient
                  BorderStyle = bsNone
                  CharCase = ecUpperCase
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  MaxLength = 150
                  ParentFont = False
                  TabOrder = 0
                  OnExit = edtOBSRExit
                  OnKeyPress = edtOBSRKeyPress
                end
              end
            end
            object DBGridBuscaR: TDBGridEh
              Left = 0
              Top = 221
              Width = 580
              Height = 319
              Align = alClient
              Color = 14869218
              DataSource = dsPesqProd
              DynProps = <>
              EvenRowColor = 15854823
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = 16447733
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 2
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -15
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              Visible = False
              OnDblClick = DBGridBuscaPDblClick
              OnKeyPress = DBGridBuscaPKeyPress
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CODIGO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 56
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 339
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'VIRTUAL_PRECO'
                  Footers = <>
                  Title.Caption = 'Pre'#231'o'
                  Width = 62
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD_ATUAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Estoque'
                  Width = 60
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIDADE'
                  Footers = <>
                  Title.Caption = 'Und'
                  Width = 35
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 540
              Width = 580
              Height = 66
              Align = alBottom
              BevelOuter = bvNone
              Color = 14581528
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 3
              object Label14: TLabel
                Left = 381
                Top = 0
                Width = 81
                Height = 66
                Margins.Left = 5
                Align = alRight
                Caption = 'TOTAL GERAL R$'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                WordWrap = True
                ExplicitHeight = 50
              end
              object lblGeral: TLabel
                Left = 462
                Top = 0
                Width = 88
                Height = 66
                Align = alRight
                Caption = '0,00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -48
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitHeight = 65
              end
              object Splitter1: TSplitter
                Left = 0
                Top = 0
                Width = 30
                Height = 66
                ExplicitLeft = -8
                ExplicitTop = 6
                ExplicitHeight = 61
              end
              object Splitter2: TSplitter
                Left = 550
                Top = 0
                Width = 30
                Height = 66
                Align = alRight
                ExplicitLeft = 854
                ExplicitTop = 2
                ExplicitHeight = 61
              end
            end
          end
        end
        object tabDelivery: TTabSheet
          Caption = 'Delivery'
          ImageIndex = 2
          object pnDelivery: TPanel
            Left = 0
            Top = 0
            Width = 913
            Height = 639
            Align = alClient
            TabOrder = 0
            object DBGridD: TDBGridEh
              Left = 1
              Top = 74
              Width = 911
              Height = 297
              Align = alClient
              Color = clBtnFace
              DataSource = dsItem
              DynProps = <>
              EvenRowColor = clBtnFace
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = clBtnFace
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghExtendVertLines]
              ParentFont = False
              TabOrder = 3
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -13
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              OnDblClick = DBGridPDblClick
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ITEM'
                  Footers = <>
                  Title.Caption = 'Item'
                  Width = 45
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ID_PRODUTO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 54
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO_SL'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 395
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Qtd'
                  Width = 75
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIDADE'
                  Footers = <>
                  Title.Caption = 'Und.'
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PRECO'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Pre'#231'o R$'
                  Width = 103
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'VALOR_ITEM'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Total R$'
                  Width = 120
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object Panel13: TPanel
              Left = 1
              Top = 1
              Width = 911
              Height = 73
              Align = alTop
              BevelOuter = bvNone
              Color = 16053492
              ParentBackground = False
              TabOrder = 0
              object grpCliente: TGroupBox
                Left = 202
                Top = 0
                Width = 709
                Height = 73
                Align = alClient
                Caption = 'Cliente'
                Color = clBtnFace
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentBackground = False
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                object edtCliente: TLabel
                  Left = 1
                  Top = 21
                  Width = 707
                  Height = 24
                  Align = alClient
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -21
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  ExplicitWidth = 6
                  ExplicitHeight = 30
                end
                object pnEndereco: TPanel
                  Left = 1
                  Top = 45
                  Width = 707
                  Height = 27
                  Align = alBottom
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -16
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object grpTelefone: TGroupBox
                Left = 0
                Top = 0
                Width = 202
                Height = 73
                Align = alLeft
                Caption = 'F1 | Celular'
                Color = 11299390
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clGray
                Font.Height = -15
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                object edtFone: TMaskEdit
                  Left = 1
                  Top = 21
                  Width = 200
                  Height = 51
                  Align = alClient
                  Alignment = taCenter
                  Ctl3D = False
                  EditMask = '# ####-####;0;_'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -32
                  Font.Name = 'Segoe UI Semilight'
                  Font.Style = []
                  MaxLength = 11
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  Text = ''
                  OnChange = edtFoneChange
                  OnExit = edtFoneExit
                  OnKeyPress = edtFoneKeyPress
                end
              end
            end
            object DBGridBuscaD: TDBGridEh
              Left = 1
              Top = 74
              Width = 911
              Height = 297
              Align = alClient
              Color = 14869218
              DataSource = dsPesqProd
              DynProps = <>
              EvenRowColor = 15854823
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = 16447733
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 1
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -15
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              Visible = False
              OnDblClick = DBGridBuscaPDblClick
              OnKeyPress = DBGridBuscaPKeyPress
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CODIGO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 59
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DESCRICAO'
                  Footers = <>
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 493
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'VIRTUAL_PRECO'
                  Footers = <>
                  Title.Caption = 'Pre'#231'o'
                  Width = 93
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD_ATUAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Estoque'
                  Width = 77
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UNIDADE'
                  Footers = <>
                  Title.Caption = 'Und'
                  Width = 32
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'LOCALIZACAO'
                  Footers = <>
                  Title.Caption = 'Local'
                  Width = 82
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QTD_FISCAL'
                  Footers = <>
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Est.Fiscal'
                  Width = 72
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object Panel14: TPanel
              Left = 1
              Top = 371
              Width = 911
              Height = 267
              Align = alBottom
              BevelOuter = bvNone
              BorderWidth = 5
              Color = 16250871
              ParentBackground = False
              TabOrder = 2
              object PageControl3: TPageControl
                Left = 5
                Top = 5
                Width = 901
                Height = 257
                ActivePage = TabSheet2
                Align = alClient
                TabOrder = 0
                object TabSheet2: TTabSheet
                  Caption = 'Itens Pedido'
                  object Panel15: TPanel
                    Left = 0
                    Top = 0
                    Width = 893
                    Height = 226
                    Align = alClient
                    BevelOuter = bvNone
                    BorderWidth = 10
                    TabOrder = 0
                    object GroupBox3: TGroupBox
                      Left = 193
                      Top = 141
                      Width = 213
                      Height = 75
                      Align = alClient
                      Caption = 'Pre'#231'o Unit'#225'rio'
                      Ctl3D = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 0
                      object EdtPrecoD: TEdit
                        AlignWithMargins = True
                        Left = 4
                        Top = 25
                        Width = 205
                        Height = 46
                        TabStop = False
                        Align = alClient
                        Alignment = taRightJustify
                        BorderStyle = bsNone
                        CharCase = ecUpperCase
                        Color = clWhite
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -32
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 0
                        Text = '0,00'
                        OnExit = edtPrecoPExit
                        OnKeyPress = edtPrecoPKeyPress
                      end
                    end
                    object GroupBox4: TGroupBox
                      Left = 10
                      Top = 141
                      Width = 183
                      Height = 75
                      Align = alLeft
                      Caption = 'Quantidade'
                      Ctl3D = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 1
                      object EdtQtdD: TEdit
                        AlignWithMargins = True
                        Left = 4
                        Top = 25
                        Width = 175
                        Height = 46
                        TabStop = False
                        Align = alClient
                        Alignment = taRightJustify
                        BorderStyle = bsNone
                        CharCase = ecUpperCase
                        Color = clWhite
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -32
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 0
                        Text = '1'
                        OnEnter = edtQtdPEnter
                        OnExit = edtQtdPExit
                        OnKeyPress = edtQtdPKeyPress
                      end
                    end
                    object GroupBox6: TGroupBox
                      Left = 10
                      Top = 10
                      Width = 873
                      Height = 67
                      Align = alTop
                      Caption = 'F12 C'#243'digo de Barras | Descri'#231#227'o | Refer'#234'ncia'
                      Color = 11299390
                      Ctl3D = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clGray
                      Font.Height = -15
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentColor = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 2
                      object edtProdutoD: TEdit
                        AlignWithMargins = True
                        Left = 4
                        Top = 24
                        Width = 865
                        Height = 39
                        Align = alClient
                        BorderStyle = bsNone
                        CharCase = ecUpperCase
                        Color = clWhite
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -29
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                        OnChange = edtProdutoDChange
                        OnEnter = edtProdutoDEnter
                        OnKeyDown = EdtProdutoPKeyDown
                        OnKeyPress = EdtProdutoPKeyPress
                      end
                    end
                    object GroupBox1: TGroupBox
                      Left = 10
                      Top = 77
                      Width = 873
                      Height = 64
                      Align = alTop
                      Caption = ' Observa'#231#245'es'
                      Color = 11299390
                      Ctl3D = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clGray
                      Font.Height = -15
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentColor = False
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 3
                      object edtObsD: TEdit
                        AlignWithMargins = True
                        Left = 4
                        Top = 24
                        Width = 865
                        Height = 36
                        Align = alClient
                        BorderStyle = bsNone
                        CharCase = ecUpperCase
                        Color = clWhite
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -29
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        MaxLength = 200
                        ParentFont = False
                        TabOrder = 0
                        OnExit = edtObsDExit
                        OnKeyPress = edtObsDKeyPress
                      end
                    end
                    object GroupBox5: TGroupBox
                      Left = 406
                      Top = 141
                      Width = 216
                      Height = 75
                      Align = alRight
                      Caption = 'Total do Item'
                      Ctl3D = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      ParentCtl3D = False
                      ParentFont = False
                      TabOrder = 4
                      object lblTotalD: TLabel
                        Left = 1
                        Top = 22
                        Width = 214
                        Height = 52
                        Align = alClient
                        Alignment = taRightJustify
                        Caption = '0,00'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -43
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ExplicitLeft = 137
                        ExplicitWidth = 78
                        ExplicitHeight = 59
                      end
                    end
                    object Panel19: TPanel
                      Left = 622
                      Top = 141
                      Width = 261
                      Height = 75
                      Align = alRight
                      BevelOuter = bvNone
                      Color = 14581528
                      Ctl3D = False
                      ParentBackground = False
                      ParentCtl3D = False
                      TabOrder = 5
                      object Label3: TLabel
                        Left = 62
                        Top = 0
                        Width = 81
                        Height = 75
                        Margins.Left = 5
                        Align = alRight
                        Caption = 'TOTAL GERAL R$'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWhite
                        Font.Height = -19
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        WordWrap = True
                        ExplicitHeight = 50
                      end
                      object lblGeralD: TLabel
                        Left = 143
                        Top = 0
                        Width = 88
                        Height = 75
                        Align = alRight
                        Caption = '0,00'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWhite
                        Font.Height = -48
                        Font.Name = 'Segoe UI'
                        Font.Style = []
                        ParentFont = False
                        ExplicitHeight = 65
                      end
                      object Splitter4: TSplitter
                        Left = 231
                        Top = 0
                        Width = 30
                        Height = 75
                        Align = alRight
                        ExplicitLeft = 854
                        ExplicitTop = 2
                        ExplicitHeight = 61
                      end
                    end
                  end
                end
                object Observações: TTabSheet
                  Caption = 'Observa'#231#245'es'
                  ImageIndex = 1
                  object DBMemo1: TDBMemo
                    Left = 0
                    Top = 0
                    Width = 893
                    Height = 226
                    Align = alClient
                    DataField = 'OBSERVACOES'
                    DataSource = dsVenda
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    MaxLength = 580
                    ParentFont = False
                    TabOrder = 0
                    OnKeyDown = FormKeyDown
                  end
                end
              end
            end
            object DBGridClie: TDBGridEh
              Left = 1
              Top = 74
              Width = 911
              Height = 297
              Align = alClient
              Color = 14869218
              Ctl3D = True
              DataSource = dsBuscaFone
              DynProps = <>
              EvenRowColor = 15854823
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              OddRowColor = 16447733
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              TitleParams.Font.Charset = ANSI_CHARSET
              TitleParams.Font.Color = clWindowText
              TitleParams.Font.Height = -13
              TitleParams.Font.Name = 'Segoe UI'
              TitleParams.Font.Style = []
              TitleParams.ParentFont = False
              Visible = False
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CODIGO'
                  Footers = <>
                  Title.Caption = 'C'#243'digo'
                  Width = 61
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FANTASIA'
                  Footers = <>
                  Title.Caption = 'Nome'
                  Width = 340
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ENDERECO'
                  Footers = <>
                  Title.Caption = 'Endere'#231'o'
                  Width = 312
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NUMERO'
                  Footers = <>
                  Title.Caption = 'Numero'
                  Width = 56
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CELULAR1'
                  Footers = <>
                  Title.Caption = 'Celular'
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  Footers = <>
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 673
        Width = 921
        Height = 109
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object btnCancVenda: TLabel
          Left = 9
          Top = 65
          Width = 115
          Height = 20
          Caption = 'F6 Canc.Venda     '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCancVendaClick
        end
        object btnFinaliza: TLabel
          Left = 9
          Top = 83
          Width = 117
          Height = 20
          Caption = 'F7 Concluir venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnFinalizaClick
        end
        object btnResumo: TLabel
          Left = 147
          Top = 0
          Width = 112
          Height = 20
          Caption = 'F8 Resumo Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnResumoClick
        end
        object btnImportar: TLabel
          Left = 9
          Top = 48
          Width = 153
          Height = 20
          Caption = 'F5 Importar                   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnImportarClick
        end
        object btnAvancada: TLabel
          Left = 10
          Top = 32
          Width = 126
          Height = 20
          Caption = 'F4 Busca Avan'#231'ada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnAvancadaClick
        end
        object btnVendedor: TLabel
          Left = 9
          Top = 16
          Width = 83
          Height = 20
          Caption = 'F3 Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnVendedorClick
        end
        object btnCaixa: TLabel
          Left = 9
          Top = 0
          Width = 92
          Height = 20
          Caption = 'F2 Abrir Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCaixaClick
        end
        object btnSangria: TLabel
          Left = 147
          Top = 16
          Width = 155
          Height = 20
          Caption = 'F9 Retirada                    '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSangriaClick
        end
        object BtnSuprimento: TLabel
          Left = 147
          Top = 33
          Width = 136
          Height = 20
          Caption = 'F10 Suprimento        '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = BtnSuprimentoClick
        end
        object btnRemoveProduto: TLabel
          Left = 147
          Top = 49
          Width = 120
          Height = 20
          Caption = 'F11 Remover Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnRemoveProdutoClick
        end
        object btnReceber: TLabel
          Left = 305
          Top = 0
          Width = 108
          Height = 20
          Caption = 'Ctrl + R Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = actReceberExecute
        end
        object btnBuscaPreco: TLabel
          Left = 305
          Top = 16
          Width = 175
          Height = 20
          Caption = 'Ctrl + L Busca Pre'#231'o           '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = actBuscaExecute
        end
        object btnDelItem: TLabel
          Left = 147
          Top = 65
          Width = 109
          Height = 20
          Caption = 'Del  Deleta Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnDelItemClick
        end
        object btnGaveta: TLabel
          Left = 147
          Top = 84
          Width = 142
          Height = 20
          Caption = 'Ctrl + A  Abrir Gaveta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = actAbrirExecute
        end
        object btnClientes: TLabel
          Left = 305
          Top = 33
          Width = 110
          Height = 20
          Caption = 'Ctrl + C  Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = actClienteExecute
        end
        object btnReimprimir: TLabel
          Left = 305
          Top = 49
          Width = 166
          Height = 20
          Caption = 'Ctrl + I  Reimprimir NFCe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnReimprimirClick
        end
        object btnTef: TLabel
          Left = 305
          Top = 83
          Width = 177
          Height = 20
          Caption = 'Ctrl + T Administrativo TEF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnTefClick
        end
        object btnDesconto: TLabel
          Left = 305
          Top = 66
          Width = 178
          Height = 20
          Caption = 'Ctrl + D  Desconto no Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnDescontoClick
        end
        object btnAtualizaMesa: TLabel
          Left = 504
          Top = 49
          Width = 166
          Height = 20
          Caption = 'Ctrl + M  Atualizar Mesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnAtualizaMesaClick
        end
        object btnTransferirMesa: TLabel
          Left = 504
          Top = 33
          Width = 154
          Height = 20
          Caption = 'Ctrl + B Transferir Mesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnTransferirMesaClick
        end
        object btnImprimirPedidos: TLabel
          Left = 504
          Top = 0
          Width = 164
          Height = 20
          Caption = 'Ctrl + S  Imprimir Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnImprimirPedidosClick
        end
        object btnImprimeItem: TLabel
          Left = 504
          Top = 16
          Width = 148
          Height = 20
          Caption = 'Ctrl + E  Imprimir Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnImprimeItemClick
        end
        object btnAbrirMesa: TLabel
          Left = 504
          Top = 67
          Width = 128
          Height = 20
          Caption = 'Ctrl + N Abrir Mesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnAbrirMesaClick
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 784
    Width = 1294
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 300
      end>
  end
  object ActionList1: TActionList
    Left = 273
    Top = 25
    object actAbrir: TAction
      Caption = 'Ctrl + A | Abrir Gaveta'
      ShortCut = 16449
      OnExecute = actAbrirExecute
    end
    object actReceber: TAction
      Caption = 'Ctrl + R | Receber'
      ShortCut = 16466
      OnExecute = actReceberExecute
    end
    object actLerPeso: TAction
      ShortCut = 16464
    end
    object actBusca: TAction
      Caption = 'Ctrl+L | Busca Pre'#231'o'
      ShortCut = 16460
      OnExecute = actBuscaExecute
    end
    object actCliente: TAction
      Caption = 'CTRL + C | Clientes'
      ShortCut = 16451
      OnExecute = actClienteExecute
    end
    object actReimprimir: TAction
      Caption = 'Ctrl+I | Imprimir NFCe'
      ShortCut = 16457
      OnExecute = actReimprimirExecute
    end
    object actTEF: TAction
      Caption = 'Ctrl + T TEF'
      ShortCut = 16468
      OnExecute = actTEFExecute
    end
    object actDesconto: TAction
      Caption = 'Cltr+D  Desconto Item'
      ShortCut = 16452
      OnExecute = actDescontoExecute
    end
    object actImprimePedido: TAction
      Caption = 'Imprimir Pedido'
      ShortCut = 16467
      OnExecute = actImprimePedidoExecute
    end
    object actImprimeItem: TAction
      Caption = 'Imprime Item'
      ShortCut = 16453
      OnExecute = actImprimeItemExecute
    end
    object actTranfereMesa: TAction
      Caption = 'Trnasferir Mesas'
      ShortCut = 16450
      OnExecute = actTranfereMesaExecute
    end
    object actAtualizaMesa: TAction
      Caption = 'Atualiza Mesa'
      ShortCut = 16461
      OnExecute = actAtualizaMesaExecute
    end
    object actAbrirMesa: TAction
      Caption = 'Abrir Mesa'
      ShortCut = 16462
      OnExecute = actAbrirMesaExecute
    end
  end
  object dsPesqProd: TDataSource
    DataSet = qryPesqProd
    Left = 128
    Top = 120
  end
  object qryPesqProd: TFDQuery
    OnCalcFields = qryPesqProdCalcFields
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    SQL.Strings = (
      'SELECT '
      'PRO.CODIGO, '
      'PRO.DESCRICAO, '
      'PRO.CFOP,'
      'PRO.CODBARRA, '
      'PRO.NCM, '
      'PRO.REFERENCIA, '
      'PRO.PR_VENDA,'
      'PRO.PRECO_ATACADO, '
      'PRO.QTD_ATACADO, '
      'PRO.QTD_ATUAL,'
      'PRO.QTD_FISCAL,'
      'PRO.UNIDADE, '
      'PRO.EFISCAL,'
      'PRO.E_MEDIO, '
      'PRO.LOCALIZACAO,'
      'PRO.PRODUTO_PESADO,'
      'PRO.PRECO_PROMO_VAREJO,'
      'PRO.PRECO_PROMO_ATACADO, '
      'PRO.PRECO_VARIAVEL, '
      'PRO.DESCONTO,'
      'PRO.INICIO_PROMOCAO,'
      'PRO.FIM_PROMOCAO, '
      'PRO.SERVICO, '
      'PRO.REMEDIO, '
      'PRO.GRADE, '
      'PRO.SERIAL, '
      'PRO.PREFIXO_BALANCA,'
      'PRO.COMISSAOPERCENTUAL,'
      'PRO.TIPO_ALIMENTO,'
      'PRO.VALORCOMISSAO,'
      'PRO.FOTO,'
      'PRO.ULTFORN'
      'FROM PRODUTO PRO'
      'WHERE (PRO.EMPRESA=:EMP) AND (PRO.ATIVO='#39'S'#39')'
      '/*where*/'
      '')
    Left = 33
    Top = 128
    ParamData = <
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesqProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesqProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryPesqProdCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryPesqProdCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryPesqProdNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryPesqProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryPesqProdPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Origin = 'QTD_ATACADO'
      Precision = 18
      Size = 3
    end
    object qryPesqProdQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryPesqProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryPesqProdEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryPesqProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryPesqProdLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryPesqProdPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryPesqProdDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryPesqProdINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
      Origin = 'INICIO_PROMOCAO'
    end
    object qryPesqProdFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
      Origin = 'FIM_PROMOCAO'
    end
    object qryPesqProdSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
    end
    object qryPesqProdREMEDIO: TStringField
      FieldName = 'REMEDIO'
      Origin = 'REMEDIO'
      Size = 1
    end
    object qryPesqProdGRADE: TStringField
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
    object qryPesqProdPREFIXO_BALANCA: TStringField
      FieldName = 'PREFIXO_BALANCA'
      Origin = 'PREFIXO_BALANCA'
      Size = 8
    end
    object qryPesqProdVIRTUAL_PRECO: TExtendedField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_PRECO'
      DisplayFormat = ',0.00'
      Precision = 19
      Calculated = True
    end
    object qryPesqProdPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Origin = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryPesqProdQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
    object qryPesqProdSERIAL: TStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      Size = 1
    end
    object qryPesqProdULTFORN: TIntegerField
      FieldName = 'ULTFORN'
      Origin = 'ULTFORN'
    end
    object qryPesqProdFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object qryVenda: TFDQuery
    BeforeOpen = qryVendaBeforeOpen
    AfterOpen = qryVendaAfterOpen
    AfterPost = qryVendaAfterPost
    AfterDelete = qryVendaAfterDelete
    OnCalcFields = qryVendaCalcFields
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select * from VENDAS_MASTER'
      'where'
      'codigo=:cod and tela=:tela')
    Left = 125
    Top = 72
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TELA'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object qryVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryVendaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
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
    object qryVendaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
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
    object qryVendaVIRTUAL_CLIENTE: TStringField
      DisplayWidth = 80
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CLIENTE'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'ID_CLIENTE'
      Size = 80
      Lookup = True
    end
    object qryVendaVIRTUAL_VENDEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_VENDEDOR'
      LookupDataSet = Dados.qryVdd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'FK_VENDEDOR'
      Size = 50
      Lookup = True
    end
    object qryVendaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryVendaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryVendaFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryVendaNECF: TIntegerField
      FieldName = 'NECF'
      Origin = 'NECF'
    end
    object qryVendaLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryVendaVirtualEmpresa: TStringField
      FieldKind = fkLookup
      FieldName = 'VirtualEmpresa'
      LookupDataSet = Dados.qryEmpresa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'FANTASIA'
      KeyFields = 'FKEMPRESA'
      Size = 50
      Lookup = True
    end
    object qryVendaGERA_FINANCEIRO: TStringField
      FieldName = 'GERA_FINANCEIRO'
      Origin = 'GERA_FINANCEIRO'
      Size = 1
    end
    object qryVendaFK_TABELA: TIntegerField
      FieldName = 'FK_TABELA'
      Origin = 'FK_TABELA'
    end
    object qryVendaVIRTUAL_TABELA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TABELA'
      LookupDataSet = qryTabela
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FK_TABELA'
      Size = 30
      Lookup = True
    end
    object qryVendaVIRTUAL_TX_ACRESC: TFloatField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TX_ACRESC'
      LookupDataSet = qryTabela
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ACRESCIMO'
      KeyFields = 'FK_TABELA'
      Lookup = True
    end
    object qryVendaVIRTUAL_CNPJ: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CNPJ'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CNPJ'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      OnValidate = qryVendaDESCONTOValidate
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
    object qryVendaPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      DisplayFormat = ',0.00%'
      Precision = 18
      Size = 2
    end
    object qryVendaPERCENTUAL_ACRESCIMO: TFMTBCDField
      FieldName = 'PERCENTUAL_ACRESCIMO'
      Origin = 'PERCENTUAL_ACRESCIMO'
      DisplayFormat = ',0.00%'
      Precision = 18
      Size = 2
    end
    object qryVendaACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 30
    end
    object qryVendaTOTAL_TROCA: TFMTBCDField
      FieldName = 'TOTAL_TROCA'
      Origin = 'TOTAL_TROCA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryVendaFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
      DisplayFormat = ',0.00'
    end
    object qryVendaFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'FORMA_PAGAMENTO'
      Size = 250
    end
    object qryVendaFK_MESA: TIntegerField
      FieldName = 'FK_MESA'
      Origin = 'FK_MESA'
    end
    object qryVendaFK_ENTREGADOR: TIntegerField
      FieldName = 'FK_ENTREGADOR'
      Origin = 'FK_ENTREGADOR'
    end
    object qryVendaVIRTUAL_ENTREGADOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ENTREGADOR'
      LookupDataSet = qryEntregador
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'FK_ENTREGADOR'
      Size = 50
      Lookup = True
    end
    object qryVendaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryVendaVIRTUAL_ENDERECO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ENDERECO'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ENDERECO'
      KeyFields = 'ID_CLIENTE'
      Size = 100
      Lookup = True
    end
    object qryVendaVIRTUAL_CELULAR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CELULAR'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CELULAR1'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaVIRTUAL_NUMERO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_NUMERO'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NUMERO'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaVIRTUAL_BAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_BAIRRO'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'BAIRRO'
      KeyFields = 'ID_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qryVendaVIRTUAL_COMPLEMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_COMPLEMENTO'
      LookupDataSet = qryCliente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'COMPLEMENTO'
      KeyFields = 'ID_CLIENTE'
      Size = 100
      Lookup = True
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    OnDataChange = dsVendaDataChange
    Left = 128
    Top = 176
  end
  object qryItem: TFDQuery
    BeforeOpen = qryItemBeforeOpen
    BeforePost = qryItemBeforePost
    AfterPost = qryItemAfterPost
    BeforeDelete = qryItemBeforeDelete
    AfterDelete = qryItemAfterDelete
    OnCalcFields = qryItemCalcFields
    AggregatesActive = True
    MasterSource = dsVenda
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode, evCache]
    FetchOptions.Mode = fmAll
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * FROM VENDAS_DETALHE'
      'where'
      'FKVENDA=:CODIGO'
      'ORDER BY ITEM;')
    Left = 187
    Top = 24
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
    object qryItemFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItemCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryItemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItemDESCRICAO_SL: TStringField
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_SL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_PRODUTO'
      Size = 100
      Lookup = True
    end
    object qryItemEFISCAL: TStringField
      FieldKind = fkLookup
      FieldName = 'EFISCAL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'EFISCAL'
      KeyFields = 'ID_PRODUTO'
      Size = 1
      Lookup = True
    end
    object qryItemPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      OnValidate = qryItemVALOR_ITEMValidate
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
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
    object qryItemTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 2
    end
    object qryItemACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      OnValidate = qryItemQTDValidate
      MaxValue = '99999'
      MinValue = '0'
      Precision = 18
      Size = 3
    end
    object qryItemE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryItemQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryItemFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
      DisplayFormat = ',0.00'
    end
    object qryItemOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryItemQTD_FISCAL: TExtendedField
      FieldKind = fkLookup
      FieldName = 'QTD_FISCAL'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'QTD_FISCAL'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemDESCRICAO_OBS: TStringField
      DisplayWidth = 250
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO_OBS'
      Size = 250
      Calculated = True
    end
    object qryItemOBSERVACAO: TStringField
      DisplayWidth = 150
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 150
    end
    object qryItemVIRTUAL_TIPO_ALIMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TIPO_ALIMENTO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TIPO_ALIMENTO'
      KeyFields = 'ID_PRODUTO'
      Lookup = True
    end
    object qryItemTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(VALOR_ITEM)'
    end
  end
  object dsItem: TDataSource
    DataSet = qryItem
    OnDataChange = dsItemDataChange
    Left = 269
    Top = 80
  end
  object qryCliente: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, razao as razao , cnpj, endereco, numero, bairro, ' +
        'municipio, complemento, uf, cep, fone1, celular1  FROM pessoa'
      'where'
      '(CLI='#39'S'#39') AND'
      '(ATIVO='#39'S'#39') AND'
      '(CCF='#39'N'#39') AND'
      '((RAZAO LIKE :NOME) OR'
      '(CNPJ LIKE :CPF))'
      'order by razao')
    Left = 128
    Top = 272
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'CPF'
        DataType = ftString
        FDDataType = dtWideString
        ParamType = ptInput
        Size = 18
      end>
    object qryClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryClienteRAZAO: TStringField
      DisplayWidth = 100
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 100
    end
    object qryClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryClienteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryClienteFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryClienteCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 145
    Top = 337
  end
  object qryProd: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 128
    Top = 225
    object qryProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
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
    object qryProdQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
    object qryProdTIPO_ALIMENTO: TStringField
      FieldName = 'TIPO_ALIMENTO'
      Origin = 'TIPO_ALIMENTO'
      Size = 1
    end
    object qryProdCOMISSAOPERCENTUAL: TFMTBCDField
      FieldName = 'COMISSAOPERCENTUAL'
      Origin = 'COMISSAOPERCENTUAL'
      Precision = 18
      Size = 2
    end
    object qryProdVALORCOMISSAO: TFMTBCDField
      FieldName = 'VALORCOMISSAO'
      Origin = 'VALORCOMISSAO'
      Precision = 18
      Size = 2
    end
    object qryProdULTFORN: TIntegerField
      FieldName = 'ULTFORN'
      Origin = 'ULTFORN'
    end
    object qryProdFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object qrySoma: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'SUM(vd.valor_item) TOTAL'
      'FROM VENDAS_detalhe vd'
      'where'
      'vd.FKVENDA=:CODIGO')
    Left = 114
    Top = 24
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qrySomaTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qryConta_Movimento: TFDQuery
    BeforePost = qryConta_MovimentoBeforePost
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas_movimento'
      'where'
      'lote=:lote and id_conta_caixa=:id'
      'order by 1')
    Left = 40
    Top = 184
    ParamData = <
      item
        Name = 'LOTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryConta_MovimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConta_MovimentoID_CONTA_CAIXA: TIntegerField
      FieldName = 'ID_CONTA_CAIXA'
      Origin = 'ID_CONTA_CAIXA'
    end
    object qryConta_MovimentoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object qryConta_MovimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryConta_MovimentoHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qryConta_MovimentoFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
    end
    object qryConta_MovimentoLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryConta_MovimentoID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object qryConta_MovimentoENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoSAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoTROCA: TFMTBCDField
      FieldName = 'TROCA'
      Origin = 'TROCA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConta_MovimentoSALDO: TFMTBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryBuscaVenda: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select coalesce(max(CODIGO),0) codigo from VENDAS_MASTER'
      'where'
      'SITUACAO='#39'X'#39' and'
      'fk_usuario=:ID and'
      'TIPO=:tp and'
      'fkempresa=:emp'
      '/*where*/')
    Left = 37
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TP'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryBuscaVendaCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
  end
  object dsEmpresa: TDataSource
    DataSet = Dados.qryEmpresa
    Left = 184
    Top = 80
  end
  object qryTabela: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from tabela_preco'
      'where'
      'fkempresa=:id'
      'order by descricao')
    Left = 40
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTabelaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTabelaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
    object qryTabelaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryTabelaATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryTabelaACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
  end
  object qryComposicao: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select id_produto,quantidade from produto_composicao'
      'where'
      'fk_produto=:produto')
    Left = 32
    Top = 312
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryComposicaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryComposicaoQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
  end
  object qryContas: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas')
    Left = 32
    Top = 80
    object qryContasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryContasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryContasTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryContasDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryContasID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryContasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryContasLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      DisplayFormat = ',0.00'
    end
    object qryContasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object qryGrade: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select CODIGO, FK_PRODUTO, DESCRICAO, QTD, PRECO from produto_gr' +
        'ade'
      'where'
      'codigo=:codigo'
      '')
    Left = 188
    Top = 136
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryGradeFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
    object qryGradeQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryGradePRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsGrade: TDataSource
    DataSet = qryGrade
    Left = 200
    Top = 192
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 192
    Top = 304
  end
  object qryPesqConta: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas where id_usuario=:id AND SITUACAO='#39'A'#39';')
    Left = 200
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPesqContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryPesqContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryPesqContaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryPesqContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryPesqContaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      DisplayFormat = ',0.00'
    end
    object qryPesqContaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object OpenPicture: TOpenPictureDialog
    Filter = 
      'All (*.png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;' +
      '*.tif;*.tiff)|*.png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.ico;*.e' +
      'mf;*.wmf;*.tif;*.tiff|Portable Network Graphics (*.png_old)|*.pn' +
      'g_old|GIF Image (*.gif)|*.gif|Portable Network Graphics (*.png)|' +
      '*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.j' +
      'peg|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles' +
      ' (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIFF Images (*.tif)|*.tif' +
      '|TIFF Images (*.tiff)|*.tiff'
    Left = 464
    Top = 172
  end
  object ACBrBAL1: TACBrBAL
    Modelo = balToledo
    Porta = 'COM1'
    OnLePeso = ACBrBAL1LePeso
    Left = 192
    Top = 376
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 24
    Top = 440
  end
  object qtdAtacado: TFDQuery
    Connection = Dados.Conexao
    Left = 144
    Top = 400
  end
  object dsMesas: TDataSource
    DataSet = Dados.qryMesas
    Left = 408
    Top = 176
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
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
    Left = 464
    Top = 238
  end
  object frxReport: TfrxReport
    Version = '6.8.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42203.460160023100000000
    ReportOptions.LastChange = 44077.368255138900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var Linha,qtd:Integer;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' if linha>14 then begin'
      '  Header2.StartNewPage:=True;'
      '  line49.visible:=false;'
      ' end;'
      '   if linha<14 then begin'
      '    qtd:=14-linha;'
      '    footer1.height:=footer1.height+(qtd*16);'
      '  end;'
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      'Linha:=0;'
      ''
      'end;'
      ''
      'procedure DetailData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  Linha:=Linha+1;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 400
    Top = 232
    Datasets = <
      item
        DataSet = frxDBEmpresa
        DataSetName = 'frxDBEmpresa'
      end
      item
        DataSet = frxDBItens
        DataSetName = 'frxDBItens'
      end
      item
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Endereco'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'COlonna MT'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 7.500000000000000000
      RightMargin = 7.500000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 52.913420000000000000
        ParentFont = False
        Top = 109.606370000000000000
        Width = 737.008350000000000000
        RowCount = 0
        object Memo84: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo116: TfrxMemoView
          AllowVectorExport = True
          Left = 102.263080000000000000
          Top = 3.000000000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."CODIGO"]')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          AllowVectorExport = True
          Left = 430.127830000000000000
          Top = 3.722820000000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DATA:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 17.759060000000000000
          Top = 18.897637800000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CLIENTE:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 35.771653540000000000
          Width = 76.195300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VENDEDOR:')
          ParentFont = False
        end
        object frxDBPVRAZAO: TfrxMemoView
          AllowVectorExport = True
          Left = 101.559060000000000000
          Top = 18.897637800000000000
          Width = 599.735560000000000000
          Height = 15.420470000000000000
          DataField = 'VIRTUAL_CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."VIRTUAL_CLIENTE"]')
          ParentFont = False
        end
        object frxDBPVNOME: TfrxMemoView
          AllowVectorExport = True
          Left = 101.559060000000000000
          Top = 34.771653540000000000
          Width = 403.200000000000000000
          Height = 15.420470000000000000
          DataField = 'VIRTUAL_VENDEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."VIRTUAL_VENDEDOR"]')
          ParentFont = False
        end
        object frxDBPVDATA_EMISSAO: TfrxMemoView
          AllowVectorExport = True
          Left = 495.016080000000000000
          Top = 3.779530000000000000
          Width = 205.379530000000000000
          Height = 15.420470000000000000
          DataField = 'DATA_EMISSAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."DATA_EMISSAO"]')
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          AllowVectorExport = True
          Left = 18.118120000000000000
          Top = 2.779530000000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PEDIDO:')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 226.771800000000000000
        Width = 737.008350000000000000
        OnAfterPrint = 'DetailData1OnAfterPrint'
        DataSet = frxDBItens
        DataSetName = 'frxDBItens'
        RowCount = 0
        object Memo82: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'COlonna MT'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          ParentFont = False
        end
        object frxDBItensID_PRODUTO: TfrxMemoView
          AllowVectorExport = True
          Left = -62.031540000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 2.559060000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'ITEM'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ITEM"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 45.174830000000000000
          Top = 2.559060000000000000
          Width = 342.500990000000000000
          Height = 15.118120000000000000
          DataField = 'DESCRICAO_SL'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItens."DESCRICAO_SL"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 398.107360000000000000
          Top = 2.559060000000000000
          Width = 89.272480000000000000
          Height = 15.118120000000000000
          DataField = 'PRECO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."PRECO"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 496.160000000000000000
          Top = 2.559060000000000000
          Width = 85.492950000000000000
          Height = 15.118120000000000000
          DataField = 'QTD'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."QTD"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 643.720000000000000000
          Top = 2.559060000000000000
          Width = 91.200000000000000000
          Height = 15.118120000000000000
          DataField = 'VALOR_ITEM'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."VALOR_ITEM"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 587.360000000000000000
          Top = 2.779530000000000000
          Width = 47.092950000000000000
          Height = 15.118120000000000000
          DataField = 'UNIDADE'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."UNIDADE"]')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 41.040940000000000000
          Top = -0.220470000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 391.520000000000000000
          Top = -0.220470000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 491.440940000000000000
          Top = -0.220470000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 583.520000000000000000
          Top = -0.220470000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 639.240940000000000000
          Top = -0.220470000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 185.196970000000000000
        Width = 737.008350000000000000
        object Memo83: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 2.779530000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ITEM')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 45.174830000000000000
          Top = 2.779530000000000000
          Width = 342.500990000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PRODUTO')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 426.907360000000000000
          Top = 2.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PRE'#199'O')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 496.200940000000000000
          Top = 2.779530000000000000
          Width = 85.492950000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 641.760940000000000000
          Top = 2.779530000000000000
          Width = 91.011070000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 587.400940000000000000
          Top = 3.000000000000000000
          Width = 47.092950000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'UND')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 41.040940000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 391.560940000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line50: TfrxLineView
          AllowVectorExport = True
          Left = 491.440940000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line51: TfrxLineView
          AllowVectorExport = True
          Left = 583.560940000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 639.240940000000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'COlonna MT'
        Font.Style = []
        Height = 117.165366540000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 737.008350000000000000
        OnAfterCalcHeight = 'Footer1OnAfterCalcHeight'
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 737.007874015748000000
          Height = 28.800000000000000000
          Frame.Typ = []
        end
        object frxDBOrcamentoOBS: TfrxMemoView
          AllowVectorExport = True
          Left = 127.579530000000000000
          Top = 51.015770000000000000
          Width = 595.200000000000000000
          Height = 32.881880000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."OBSERVACOES"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 51.015770000000000000
          Width = 114.595300000000000000
          Height = 16.320000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Observa'#231#245'es:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 84.415770000000000000
          Width = 384.000000000000000000
          Height = 28.800000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Declaro que recebi os itens descritos acima, [frxDBEmpresa."CIDA' +
              'DE"]-[frxDBEmpresa."UF"], [DATE]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 396.600000000000000000
          Top = 84.518120000000000000
          Width = 326.400000000000000000
          Height = 28.800000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '___________________________________________'
            'ASSINATURA')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 523.104330000000000000
          Top = 5.379530000000000000
          Width = 93.051961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total>>>')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 4.779530000000000000
          Width = 93.051961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SubTotal>>>')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 274.318120000000000000
          Top = 3.779530000000000000
          Width = 102.651961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto>>>')
          ParentFont = False
        end
        object frxDBPVSUBTOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 113.118120000000000000
          Top = 4.943290000000000000
          Width = 153.600000000000000000
          Height = 19.200000000000000000
          DataField = 'SUBTOTAL'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."SUBTOTAL"]')
          ParentFont = False
        end
        object frxDBPVDESCONTO: TfrxMemoView
          AllowVectorExport = True
          Left = 379.918120000000000000
          Top = 4.343290000000000000
          Width = 124.800000000000000000
          Height = 19.200000000000000000
          DataField = 'DESCONTO'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."DESCONTO"]')
          ParentFont = False
        end
        object frxDBPVTOTAL: TfrxMemoView
          AllowVectorExport = True
          Left = 619.918120000000000000
          Top = 4.943290000000000000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          DataField = 'TOTAL'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."TOTAL"]')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          AllowVectorExport = True
          Left = 172.579530000000000000
          Top = 31.236240000000000000
          Width = 549.845640000000000000
          Height = 17.763760000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FFPG]')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          AllowVectorExport = True
          Left = 9.425170000000000000
          Top = 30.236240000000000000
          Width = 159.949660000000000000
          Height = 16.320000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Forma de Pagamento:')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 52.913420000000000000
        ParentFont = False
        Top = 517.795610000000000000
        Width = 737.008350000000000000
        RowCount = 0
        object Memo80: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 112.601670000000000000
          Top = 2.645669290000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."CODIGO"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 440.466420000000000000
          Top = 2.645669290000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DATA:')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 29.097650000000000000
          Top = 17.763779530000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CLIENTE:')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 19.897650000000000000
          Top = 33.637795280000000000
          Width = 76.195300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VENDEDOR:')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 112.897650000000000000
          Top = 33.637795280000000000
          Width = 403.200000000000000000
          Height = 15.420470000000000000
          DataField = 'VIRTUAL_VENDEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."VIRTUAL_VENDEDOR"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 524.354670000000000000
          Top = 2.645669290000000000
          Width = 201.600000000000000000
          Height = 15.420470000000000000
          DataField = 'DATA_EMISSAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."DATA_EMISSAO"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 28.456710000000000000
          Top = 2.645669290000000000
          Width = 66.595300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PEDIDO n'#186)
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 112.385900000000000000
          Top = 17.763779530000000000
          Width = 614.853680000000000000
          Height = 15.420470000000000000
          DataField = 'VIRTUAL_CLIENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."VIRTUAL_CLIENTE"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'COlonna MT'
        Font.Style = []
        Height = 85.149660000000000000
        ParentFont = False
        Top = 408.189240000000000000
        Width = 737.008350000000000000
        object Memo79: TfrxMemoView
          Align = baBottom
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 737.008350000000000000
          Height = 81.370130000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo86: TfrxMemoView
          AllowVectorExport = True
          Left = 109.883550000000000000
          Top = 17.338590000000000000
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
        object Memo87: TfrxMemoView
          AllowVectorExport = True
          Left = 110.179530000000000000
          Top = 36.081880000000000000
          Width = 624.000000000000000000
          Height = 15.420470000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
        object Memo97: TfrxMemoView
          AllowVectorExport = True
          Left = 109.779530000000000000
          Top = 67.845640000000000000
          Width = 624.000000000000000000
          Height = 15.420470000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:[frxDBEmpresa."FONE"] EMAIL:[frxDBEmpresa."EMAIL"]')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 16.563760000000000000
          Width = 86.400000000000000000
          Height = 65.461410000000000000
          DataField = 'LOGOMARCA'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo112: TfrxMemoView
          AllowVectorExport = True
          Left = 109.779530000000000000
          Top = 51.445640000000000000
          Width = 624.000000000000000000
          Height = 19.200000000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."CIDADE"]- [frxDBEmpresa."UF"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line49: TfrxLineView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = -0.220470000000000000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Style = fsDashDot
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -7
        Font.Name = 'COlonna MT'
        Font.Style = []
        Height = 66.252010000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 737.008350000000000000
        object Memo85: TfrxMemoView
          AllowVectorExport = True
          Left = 101.663080000000000000
          Top = 0.774830000000000000
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
        object Memo88: TfrxMemoView
          AllowVectorExport = True
          Left = 101.959060000000000000
          Top = 19.518120000000000000
          Width = 624.000000000000000000
          Height = 15.420470000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
        object Memo89: TfrxMemoView
          AllowVectorExport = True
          Left = 101.559060000000000000
          Top = 49.281880000000000000
          Width = 624.000000000000000000
          Height = 15.420470000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:[frxDBEmpresa."FONE"] EMAIL:[frxDBEmpresa."EMAIL"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 86.400000000000000000
          Height = 65.461410000000000000
          DataField = 'LOGOMARCA'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo90: TfrxMemoView
          AllowVectorExport = True
          Left = 101.559060000000000000
          Top = 33.881880000000000000
          Width = 624.000000000000000000
          Height = 15.420470000000000000
          AutoWidth = True
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."CIDADE"]- [frxDBEmpresa."UF"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 593.386210000000000000
        Width = 737.008350000000000000
        object Memo78: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 2.779530000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ITEM')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 48.954360000000000000
          Top = 2.779530000000000000
          Width = 342.500990000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PRODUTO')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 430.686890000000000000
          Top = 2.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PRE'#199'O')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 499.980470000000000000
          Top = 2.779530000000000000
          Width = 85.492950000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 645.540470000000000000
          Top = 1.779530000000000000
          Width = 91.011070000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
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
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 591.180470000000000000
          Top = 3.000000000000000000
          Width = 47.092950000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'UND')
          ParentFont = False
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 44.976377950000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 395.338582680000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 495.118110240000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 586.582677170000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 642.897637800000000000
          Height = 19.260470000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 634.961040000000000000
        Width = 737.008350000000000000
        OnAfterPrint = 'DetailData1OnAfterPrint'
        DataSet = frxDBItens
        DataSetName = 'frxDBItens'
        RowCount = 0
        object Memo81: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 50.174830000000000000
          Top = 2.000000000000000000
          Width = 334.941930000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 398.107360000000000000
          Top = 2.000000000000000000
          Width = 89.272480000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 499.160000000000000000
          Top = 2.000000000000000000
          Width = 85.492950000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 643.720000000000000000
          Top = 2.000000000000000000
          Width = 91.200000000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 590.360000000000000000
          Top = 2.220470000000000000
          Width = 47.092950000000000000
          Height = 15.118120000000000000
          DataField = 'ID_PRODUTO'
          DataSet = frxDBItens
          DataSetName = 'frxDBItens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItens."ID_PRODUTO"]')
          ParentFont = False
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = 44.976377950000000000
          Top = 2.220470000000000000
          Height = 15.480940000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Left = 395.338582680000000000
          Top = 2.220470000000000000
          Height = 15.480940000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line22: TfrxLineView
          AllowVectorExport = True
          Left = 495.118110240000000000
          Top = 2.220470000000000000
          Height = 15.480940000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = 586.582677170000000000
          Top = 2.220470000000000000
          Height = 15.480940000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line24: TfrxLineView
          AllowVectorExport = True
          Left = 642.897637800000000000
          Top = 2.220470000000000000
          Height = 15.480940000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 109.606370000000000000
        Top = 676.535870000000000000
        Width = 737.008350000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 737.007874020000000000
          Height = 28.800000000000000000
          Frame.Typ = []
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 107.902350000000000000
          Top = 50.795300000000000000
          Width = 614.097650000000000000
          Height = 29.102350000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."OBSERVACOES"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 2.779530000000000000
          Top = 51.795300000000000000
          Width = 99.477180000000000000
          Height = 16.320000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Observa'#231#245'es:')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 80.415770000000000000
          Width = 384.000000000000000000
          Height = 25.020470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Declaro que recebi os itens descritos acima, [frxDBEmpresa."CIDA' +
              'DE"]-[frxDBEmpresa."UF"], [DATE]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 396.600000000000000000
          Top = 79.518120000000000000
          Width = 326.400000000000000000
          Height = 28.800000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '___________________________________________'
            'ASSINATURA')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Left = 523.104330000000000000
          Top = 5.379530000000000000
          Width = 93.051961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total>>>')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 4.779530000000000000
          Width = 93.051961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SubTotal>>>')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 274.318120000000000000
          Top = 3.779530000000000000
          Width = 102.651961180000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto>>>')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 113.118120000000000000
          Top = 4.943290000000000000
          Width = 153.600000000000000000
          Height = 19.200000000000000000
          DataField = 'SUBTOTAL'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."SUBTOTAL"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 379.918120000000000000
          Top = 4.343290000000000000
          Width = 124.800000000000000000
          Height = 19.200000000000000000
          DataField = 'DESCONTO'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."DESCONTO"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 619.918120000000000000
          Top = 4.943290000000000000
          Width = 115.200000000000000000
          Height = 19.200000000000000000
          DataField = 'TOTAL'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBPV."TOTAL"]')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          AllowVectorExport = True
          Left = 166.933890000000000000
          Top = 31.236240000000000000
          Width = 549.845640000000000000
          Height = 17.763760000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FFPG]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 159.949660000000000000
          Height = 16.320000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Forma de Pagamento:')
          ParentFont = False
        end
      end
    end
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'FANTASIA=FANTASIA'
      'RAZAO=RAZAO'
      'TIPO=TIPO'
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
      'FUNDACAO=FUNDACAO'
      'USU_CAD=USU_CAD'
      'USU_ATU=USU_ATU'
      'NSERIE=NSERIE'
      'CSENHA=CSENHA'
      'NTERM=NTERM')
    BCDToCurrency = False
    Left = 552
    Top = 254
  end
  object frxDBPedido: TfrxDBDataset
    UserName = 'frxDBPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DATA_EMISSAO=DATA_EMISSAO'
      'DATA_SAIDA=DATA_SAIDA'
      'ID_CLIENTE=ID_CLIENTE'
      'FK_USUARIO=FK_USUARIO'
      'FK_CAIXA=FK_CAIXA'
      'FK_VENDEDOR=FK_VENDEDOR'
      'CPF_NOTA=CPF_NOTA'
      'TIPO_DESCONTO=TIPO_DESCONTO'
      'OBSERVACOES=OBSERVACOES'
      'SITUACAO=SITUACAO'
      'VIRTUAL_CLIENTE=VIRTUAL_CLIENTE'
      'VIRTUAL_VENDEDOR=VIRTUAL_VENDEDOR'
      'FKEMPRESA=FKEMPRESA'
      'TIPO=TIPO'
      'FKORCAMENTO=FKORCAMENTO'
      'NECF=NECF'
      'LOTE=LOTE'
      'VirtualEmpresa=VirtualEmpresa'
      'GERA_FINANCEIRO=GERA_FINANCEIRO'
      'FK_TABELA=FK_TABELA'
      'VIRTUAL_TABELA=VIRTUAL_TABELA'
      'VIRTUAL_TX_ACRESC=VIRTUAL_TX_ACRESC'
      'VIRTUAL_CNPJ=VIRTUAL_CNPJ'
      'SUBTOTAL=SUBTOTAL'
      'DESCONTO=DESCONTO'
      'TROCO=TROCO'
      'DINHEIRO=DINHEIRO'
      'TOTAL=TOTAL'
      'PERCENTUAL=PERCENTUAL'
      'PERCENTUAL_ACRESCIMO=PERCENTUAL_ACRESCIMO'
      'ACRESCIMO=ACRESCIMO'
      'PEDIDO=PEDIDO'
      'TOTAL_TROCA=TOTAL_TROCA'
      'OS=OS'
      'FK_OS=FK_OS'
      'FORMA_PAGAMENTO=FORMA_PAGAMENTO'
      'FK_MESA=FK_MESA')
    DataSet = qryVenda
    BCDToCurrency = False
    Left = 632
    Top = 254
  end
  object frxDBItens: TfrxDBDataset
    UserName = 'frxDBItens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'FKVENDA=FKVENDA'
      'ITEM=ITEM'
      'COD_BARRA=COD_BARRA'
      'ID_PRODUTO=ID_PRODUTO'
      'SITUACAO=SITUACAO'
      'UNIDADE=UNIDADE'
      'DESCRICAO_SL=DESCRICAO_SL'
      'EFISCAL=EFISCAL'
      'PRECO=PRECO'
      'VALOR_ITEM=VALOR_ITEM'
      'VDESCONTO=VDESCONTO'
      'TOTAL=TOTAL'
      'ACRESCIMO=ACRESCIMO'
      'QTD=QTD'
      'E_MEDIO=E_MEDIO'
      'QTD_DEVOLVIDA=QTD_DEVOLVIDA'
      'FK_GRADE=FK_GRADE'
      'OS=OS'
      'QTD_FISCAL=QTD_FISCAL'
      'DESCRICAO_OBS=DESCRICAO_OBS'
      'OBSERVACAO=OBSERVACAO'
      'TTOTAL=TTOTAL')
    DataSet = qryItem
    BCDToCurrency = False
    Left = 632
    Top = 318
  end
  object qryBuscaFone: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, fantasia , endereco, numero, bairro, municipio, u' +
        'f, cep, complemento, celular1   FROM pessoa'
      'where'
      '(celular1 like :fone)'
      'order by fantasia')
    Left = 272
    Top = 136
    ParamData = <
      item
        Name = 'FONE'
        DataType = ftString
        ParamType = ptInput
        Size = 14
        Value = Null
      end>
    object qryBuscaFoneCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryBuscaFoneFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryBuscaFoneENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryBuscaFoneNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryBuscaFoneBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryBuscaFoneMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryBuscaFoneUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryBuscaFoneCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryBuscaFoneCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryBuscaFoneCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
  end
  object dsBuscaFone: TDataSource
    DataSet = qryBuscaFone
    Left = 272
    Top = 192
  end
  object qryEntregador: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * from entregador'
      'order by nome')
    Left = 280
    Top = 248
    object qryEntregadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryEntregadorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
  end
  object dsEntregador: TDataSource
    DataSet = qryEntregador
    Left = 281
    Top = 313
  end
  object PopupMenu1: TPopupMenu
    Left = 792
    Top = 392
  end
  object qryPedido: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select CODIGO from vendas_master'
      'where'
      'ID_CLIENTE=:CODIGO and situacao='#39'X'#39)
    Left = 544
    Top = 184
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object qryPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ACBrLCB1: TACBrLCB
    Porta = 'COM3'
    Intervalo = 300
    Left = 265
    Top = 377
  end
  object ACBrInStore1: TACBrInStore
    OnGetPrecoUnitario = ACBrInStore1GetPrecoUnitario
    Left = 208
    Top = 420
  end
end
