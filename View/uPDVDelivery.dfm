object FrmDelivery: TFrmDelivery
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Delivery'
  ClientHeight = 783
  ClientWidth = 1306
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 1306
    Height = 783
    Align = alClient
    Caption = 'Panel6'
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 946
      Height = 781
      Align = alClient
      TabOrder = 0
      object DBGrid1: TDBGridEh
        Left = 1
        Top = 100
        Width = 944
        Height = 504
        Align = alClient
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
        OnDblClick = DBGrid1DblClick
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
            Width = 428
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'QTD'
            Footers = <>
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
            Title.Caption = 'Pre'#231'o R$'
            Width = 103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR_ITEM'
            Footers = <>
            Title.Caption = 'Total R$'
            Width = 120
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel9: TPanel
        Left = 1
        Top = 604
        Width = 944
        Height = 176
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 691
          Top = 5
          Width = 248
          Height = 166
          Align = alRight
          Caption = 'Total '
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI Semilight'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object DBText1: TDBText
            Left = 1
            Top = 26
            Width = 246
            Height = 139
            Align = alClient
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'TTOTAL'
            DataSource = dsItem
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -64
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 21
            ExplicitWidth = 226
            ExplicitHeight = 86
          end
        end
        object Panel10: TPanel
          Left = 5
          Top = 5
          Width = 686
          Height = 166
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 10
          TabOrder = 1
          object GrpPreco: TGroupBox
            Left = 180
            Top = 78
            Width = 264
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
            TabOrder = 0
            object edtPreco: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 29
              Width = 256
              Height = 45
              TabStop = False
              Align = alClient
              Alignment = taRightJustify
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -37
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = '0,00'
              OnExit = edtPrecoExit
              OnKeyPress = edtPrecoKeyPress
            end
          end
          object GrpQtd: TGroupBox
            Left = 10
            Top = 78
            Width = 170
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
            TabOrder = 1
            object edtQtd: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 29
              Width = 162
              Height = 45
              TabStop = False
              Align = alClient
              Alignment = taRightJustify
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -37
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              Text = '1'
              OnEnter = edtQtdEnter
              OnExit = edtQtdExit
              OnKeyPress = edtQtdKeyPress
            end
          end
          object grpTotal: TGroupBox
            Left = 444
            Top = 78
            Width = 232
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
            TabOrder = 2
            object lblTotal: TLabel
              Left = 1
              Top = 26
              Width = 230
              Height = 51
              Align = alClient
              Alignment = taRightJustify
              Caption = '0,00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -37
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitLeft = 163
              ExplicitWidth = 68
              ExplicitHeight = 50
            end
          end
          object grpSelecao: TGroupBox
            Left = 10
            Top = 10
            Width = 666
            Height = 68
            Align = alTop
            Caption = 'C'#243'digo de Barras | Descri'#231#227'o'
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
            object edtProduto: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 24
              Width = 658
              Height = 40
              Align = alClient
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -32
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edtProdutoChange
              OnKeyDown = edtProdutoKeyDown
              OnKeyPress = edtProdutoKeyPress
            end
          end
        end
      end
      object DBGrid2: TDBGridEh
        Left = 1
        Top = 100
        Width = 944
        Height = 504
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
        OnDblClick = DBGrid2DblClick
        OnKeyPress = DBGrid2KeyPress
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CODIGO'
            Footers = <>
            Title.Caption = 'C'#243'digo'
            Width = 57
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRICAO'
            Footers = <>
            Title.Caption = 'Descri'#231#227'o'
            Width = 506
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
            Title.Caption = 'Estoque'
            Width = 81
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
            Width = 93
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 944
        Height = 99
        Align = alTop
        TabOrder = 3
        object grpCliente: TGroupBox
          Left = 313
          Top = 1
          Width = 630
          Height = 67
          Align = alClient
          Caption = 'Cliente'
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -15
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          object edtCliente: TEdit
            AlignWithMargins = True
            Left = 4
            Top = 24
            Width = 622
            Height = 39
            Align = alClient
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Segoe UI Semilight'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = edtClienteChange
            OnEnter = edtClienteEnter
            OnKeyDown = edtClienteKeyDown
            OnKeyPress = edtClienteKeyPress
          end
        end
        object grpTelefone: TGroupBox
          Left = 1
          Top = 1
          Width = 312
          Height = 67
          Align = alLeft
          Caption = 'F12 | Telefone'
          Color = 11299390
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -15
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object edtFone: TMaskEdit
            Left = 1
            Top = 21
            Width = 310
            Height = 45
            Align = alClient
            BorderStyle = bsNone
            EditMask = '####-####;0;'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Segoe UI Semilight'
            Font.Style = []
            MaxLength = 9
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnChange = edtFoneChange
            OnExit = edtFoneExit
            OnKeyDown = edtFoneKeyDown
            OnKeyPress = edtFoneKeyPress
          end
        end
        object pnEndereco: TPanel
          Left = 1
          Top = 68
          Width = 942
          Height = 30
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object DBGrid3: TDBGridEh
        Left = -3
        Top = 71
        Width = 943
        Height = 321
        Color = 14869218
        DataSource = dsBuscaCliente
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
        TabOrder = 4
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = 'Segoe UI'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        Visible = False
        OnDblClick = DBGrid3DblClick
        OnKeyDown = DBGrid3KeyDown
        OnKeyPress = DBGrid3KeyPress
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUMERO'
            Footers = <>
            Title.Caption = 'Numero'
            Width = 60
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel2: TPanel
      Left = 947
      Top = 1
      Width = 358
      Height = 781
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object imgLogo: TImage
        Left = 0
        Top = 199
        Width = 358
        Height = 435
        Align = alClient
        Center = True
        ExplicitTop = 192
        ExplicitHeight = 410
      end
      object Panel7: TPanel
        Left = 0
        Top = 634
        Width = 358
        Height = 147
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object btnSangria: TSpeedButton
          Left = 179
          Top = 39
          Width = 100
          Height = 20
          Caption = 'F10 | Retirada'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnSangriaClick
        end
        object BtnSuprimento: TSpeedButton
          Left = 185
          Top = 57
          Width = 109
          Height = 20
          Caption = 'F11 | Suprimento'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = BtnSuprimentoClick
        end
        object btnAvancada: TSpeedButton
          Left = 3
          Top = 57
          Width = 128
          Height = 20
          Caption = 'F5 | Busca Avan'#231'ada'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnAvancadaClick
        end
        object btnVendedor: TSpeedButton
          Left = 3
          Top = 39
          Width = 152
          Height = 20
          Caption = 'F4 | Selecione Vendedor'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnVendedorClick
        end
        object btnCancVenda: TSpeedButton
          Left = 13
          Top = 93
          Width = 107
          Height = 20
          BiDiMode = bdLeftToRight
          Caption = 'F7 | Cancela Pedido'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          ParentBiDiMode = False
          OnClick = btnCancVendaClick
        end
        object btnResumo: TSpeedButton
          Left = 187
          Top = 20
          Width = 121
          Height = 20
          Caption = 'F9 | Resumo Caixa'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnResumoClick
        end
        object btnFinaliza: TSpeedButton
          Left = 193
          Top = 3
          Width = 119
          Height = 20
          BiDiMode = bdLeftToRight
          Caption = 'F8 | Concluir Pedido'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          ParentBiDiMode = False
          OnClick = btnFinalizaClick
        end
        object btnCaixa: TSpeedButton
          Left = 3
          Top = 3
          Width = 101
          Height = 20
          BiDiMode = bdRightToLeft
          Caption = 'F2 | Abrir Caixa'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          ParentBiDiMode = False
          OnClick = btnCaixaClick
        end
        object btnDelItem: TSpeedButton
          Left = 176
          Top = 74
          Width = 126
          Height = 24
          Caption = 'Del | Deleta Item'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnDelItemClick
        end
        object btnEntregador: TSpeedButton
          Left = 12
          Top = 75
          Width = 140
          Height = 20
          Caption = 'F6 | Selecione Entregador'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          OnClick = btnEntregadorClick
        end
        object btnCadCliente: TSpeedButton
          Left = 11
          Top = 21
          Width = 115
          Height = 20
          BiDiMode = bdRightToLeft
          Caption = 'F3 | Cadastra Cliente'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Light'
          Font.Style = []
          ParentFont = False
          ParentBiDiMode = False
          OnClick = btnCadClienteClick
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 358
        Height = 199
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lblDataHora: TLabel
          Left = 40
          Top = 68
          Width = 244
          Height = 45
          AutoSize = False
          Caption = '09/11/2019 08:00'
          Color = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object lblCaixa: TLabel
          Left = 38
          Top = -2
          Width = 246
          Height = 81
          Caption = 'CAIXA 01'
          Color = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -60
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label19: TLabel
          Left = 40
          Top = 119
          Width = 50
          Height = 15
          AutoSize = False
          Caption = 'Operador'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblOperador: TLabel
          Left = 38
          Top = 137
          Width = 4
          Height = 21
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 205
          Top = 119
          Width = 64
          Height = 15
          AutoSize = False
          Caption = 'Entregador'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEntregador: TLabel
          Left = 205
          Top = 137
          Width = 4
          Height = 21
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 929
    Top = 225
    object actLerPeso: TAction
      ShortCut = 16464
    end
    object actBusca: TAction
      Caption = 'Ctrl+L | Busca Pre'#231'o'
    end
    object actReceber: TAction
      Caption = 'Ctrl + R | Receber'
      ShortCut = 16466
    end
  end
  object dsPesqProd: TDataSource
    DataSet = qryPesqProd
    Left = 176
    Top = 144
  end
  object qryPesqProd: TFDQuery
    OnCalcFields = qryPesqProdCalcFields
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      'PRO.CODIGO,'
      'PRO.DESCRICAO,'
      'PRO.CFOP,'
      'PRO.NCM,'
      'PRO.CODBARRA,'
      'PRO.REFERENCIA,'
      'PRO.PR_VENDA,'
      'PRO.PRECO_ATACADO,'
      'PRO.QTD_ATACADO,'
      'PRO.QTD_ATUAL,'
      'PRO.E_MEDIO,'
      'PRO.UNIDADE,'
      'PRO.EFISCAL,'
      'PRO.LOCALIZACAO,'
      'PRO.PRECO_PROMO_VAREJO,'
      'PRO.PRECO_PROMO_ATACADO,'
      'PRO.FIM_PROMOCAO,'
      'PRO.INICIO_PROMOCAO,'
      'PRO.DESCONTO,'
      'PRO.PRECO_VARIAVEL,'
      'PRO.SERVICO,'
      'PRO.REMEDIO,'
      'PRO.GRADE,'
      'PRO.PREFIXO_BALANCA'
      ''
      ''
      ''
      'FROM PRODUTO PRO'
      '/*where*/')
    Left = 177
    Top = 88
    object qryPesqProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesqProdDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
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
      Required = True
    end
    object qryPesqProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Required = True
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
    object qryPesqProdNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryPesqProdLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryPesqProdFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
    end
    object qryPesqProdINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
    end
    object qryPesqProdVIRTUAL_PRECO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_PRECO'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryPesqProdPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryPesqProdSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
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
      DisplayFormat = ',0.00'
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
    object qryPesqProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryPesqProdPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPesqProdPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPesqProdDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
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
  end
  object qryVenda: TFDQuery
    BeforeOpen = qryVendaBeforeOpen
    AfterOpen = qryVendaAfterOpen
    BeforePost = qryVendaBeforePost
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select * from VENDAS_MASTER'
      'where'
      'codigo=:cod')
    Left = 245
    Top = 88
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    object qryVendaFK_ENTREGADOR: TIntegerField
      FieldName = 'FK_ENTREGADOR'
      Origin = 'FK_ENTREGADOR'
      DisplayFormat = ',0.00'
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
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    OnDataChange = dsVendaDataChange
    Left = 248
    Top = 144
  end
  object qryItem: TFDQuery
    BeforeOpen = qryItemBeforeOpen
    BeforePost = qryItemBeforePost
    AfterPost = qryItemAfterPost
    BeforeDelete = qryItemBeforeDelete
    AfterDelete = qryItemAfterDelete
    AggregatesActive = True
    MasterSource = dsVenda
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evMode, evCache]
    FetchOptions.Mode = fmAll
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * FROM VENDAS_DETALHE'
      'where'
      'FKVENDA=:CODIGO'
      'ORDER BY ITEM;')
    Left = 315
    Top = 88
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
    Left = 317
    Top = 152
  end
  object qryCliente: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, razao||'#39' '#39'||cnpj as razao , cnpj, endereco, numer' +
        'o, bairro, municipio, uf, cep, fone1, celular1  FROM pessoa'
      'where'
      '(CLI='#39'S'#39') AND'
      '(ATIVO='#39'S'#39') AND'
      '(CCF='#39'N'#39') AND'
      '((RAZAO LIKE :NOME) OR'
      '(CNPJ LIKE :CPF))'
      'order by razao')
    Left = 312
    Top = 208
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
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 313
    Top = 265
  end
  object qryProd: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, EFISCAL, E_MEDIO FROM PRODUTO')
    Left = 248
    Top = 193
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
  end
  object qryFechamento: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from resumo_caixa'
      'where'
      'data between  :data1 and :data2 and'
      'fk_usuario=:id and'
      'fkempresa=:id'
      ''
      'order by data desc')
    Left = 240
    Top = 264
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
    object qryFechamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFechamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryFechamentoHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qryFechamentoFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryFechamentoFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
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
    Left = 242
    Top = 312
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
    Left = 48
    Top = 216
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
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select max(CODIGO) codigo from VENDAS_MASTER'
      'where'
      'SITUACAO='#39'X'#39' and'
      'fk_usuario=:ID and'
      'TIPO=:tp and'
      'fkempresa=:emp;')
    Left = 37
    Top = 80
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
    Left = 392
    Top = 320
  end
  object qryTabela: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from tabela_preco'
      'where'
      'fkempresa=:id'
      'order by descricao')
    Left = 168
    Top = 200
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
    Left = 248
    Top = 376
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
  object qryVendaComp: TFDQuery
    AfterPost = qryVendaCompAfterPost
    AfterDelete = qryVendaCompAfterPost
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from vendas_composicao'
      'where'
      'fk_venda_detalhe=:fk')
    Left = 160
    Top = 256
    ParamData = <
      item
        Name = 'FK'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVendaCompCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaCompFK_VENDA_DETALHE: TIntegerField
      FieldName = 'FK_VENDA_DETALHE'
      Origin = 'FK_VENDA_DETALHE'
    end
    object qryVendaCompID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object qryVendaCompQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryVendaCompQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
  end
  object qryContas: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas')
    Left = 48
    Top = 152
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
    Left = 548
    Top = 104
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
    Left = 560
    Top = 152
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 624
    Top = 184
  end
  object qryPesqConta: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from contas where id_usuario=:id AND SITUACAO='#39'A'#39';')
    Left = 640
    Top = 392
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
  object qryEntregador: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * from entregador'
      'order by nome')
    Left = 392
    Top = 192
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
    Left = 393
    Top = 265
  end
  object qryBuscaFone: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT codigo, fantasia , endereco, numero, bairro, municipio, u' +
        'f, cep, complemento   FROM pessoa'
      'where'
      
        '(fone1 like :fone) or (fone2 like :fone) or (celular1 like :fone' +
        ') or (celular2 like :fone)'
      'order by fantasia')
    Left = 560
    Top = 216
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
      DisplayFormat = ',0.00'
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
  end
  object dsBuscaCliente: TDataSource
    DataSet = qryBuscaFone
    Left = 568
    Top = 272
  end
end
