object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'Cadastro de Produtos'
  ClientHeight = 491
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 722
    Height = 491
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lista de Produtos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          714
          49)
        object Label11: TLabel
          Left = 765
          Top = 22
          Width = 188
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Relat'#243'rio de Vendas no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10066329
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 813
        end
        object Image1: TImage
          Left = 630
          Top = 0
          Width = 84
          Height = 49
          Align = alRight
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
            00200804000000D973B27F0000000467414D410000B18F0BFC61050000000262
            4B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B0000
            000774494D4507E30A1F0C3812F3F2A833000002374944415478DAA5954F6C4C
            5114C67F27A1A6841DC5564AB50D226181489A88101A42229848946045225236
            62C36AD234111B8A062136D54422FE949096069B2EA811A69644D955D3998CC5
            75EE7BDA99F7E74EE7F1ADDE3DEF9CEF3BEF9C73CF136260E6D14A0B0D2C6491
            1EBF31CA475EF040C6A2BE12096EE034FB48C5F0E6B94B463E552030B3B9C071
            66E0C66F2E7156F2B1046629BD34313D86D925B9088159CD63E657116EF1932D
            32142050F5575587FB14EBFD2C3C0293E22D2B12845B7C608DAD854FD0C9C984
            E1161DD2EE1168E3DE57ACBC0B459A256709BA690BBCC892E1101B43EE432A93
            0E095D95A3A253371A1A9B837253AB729FCD65B63E7648C1DCE240C073823A31
            696E87B4FAB5498500851F9EE235AB42BE7BC55CE370E4EB26037C8AE029882B
            6206591753A0A71A9437B3E8A1869DDED33DB6C5F80D881961496C8D277571AA
            5BE4C48C33C7D1262F0BED924BDDE25725823E9BBC47D0C37687CFD8FF7EC267
            312FD9E052F792AF992A675C16FD62BA38E2549FBE8D97C5ECE74EC8F88C56C7
            203D890CF81E3BCADFA90D189B24EB18E536BA039E7694B5CAD7F5EA9423A3C3
            DDC9A690D60037686779C0D625C72CC132BD6733498E228DF2C55F281D9CFA07
            828C9C29ADB437AC4C183ECCDAA995A614F50C265AAA3F74A98ED887F2B5FE88
            0555876F0DADF5BF59F4D25C45F83B76FBEA2102A5A8E53C272A76A4C845CE49
            A16488FE5CEBF5E79A0E8D968F099DD94C49DB41E091CCD5FBDF4223752CD6E3
            575DBB599EF350C6A3BE7F00CA60CF1FC8041E30000000257445587464617465
            3A63726561746500323031392D31302D33315431323A35363A31382B30303A30
            3032D82A9D0000002574455874646174653A6D6F6469667900323031392D3130
            2D33315431323A35363A31382B30303A3030438592210000001974455874536F
            667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000000049
            454E44AE426082}
          OnClick = Image1Click
          ExplicitLeft = 1208
          ExplicitHeight = 62
        end
        object edtLoc: TEdit
          Left = 21
          Top = 12
          Width = 588
          Height = 26
          Color = clWhite
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edtLocChange
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 436
        Width = 714
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          714
          25)
        object Label1: TLabel
          Left = 765
          Top = 22
          Width = 188
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Relat'#243'rio de Vendas no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10066329
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 813
        end
        object btnNovo: TLabel
          Left = 13
          Top = 0
          Width = 55
          Height = 25
          Align = alLeft
          Caption = 'F3 Novo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnNovoClick
          ExplicitHeight = 20
        end
        object Splitter4: TSplitter
          Left = 145
          Top = 0
          Width = 13
          Height = 25
          ExplicitLeft = 160
          ExplicitTop = -8
        end
        object Splitter5: TSplitter
          Left = 698
          Top = 0
          Width = 16
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter6: TSplitter
          Left = 646
          Top = 0
          Width = 0
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object btnSair: TLabel
          Left = 646
          Top = 0
          Width = 52
          Height = 25
          Align = alRight
          Caption = 'F12 Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSairClick
          ExplicitHeight = 20
        end
        object Splitter7: TSplitter
          Left = 0
          Top = 0
          Width = 13
          Height = 25
          ExplicitLeft = -4
          ExplicitTop = 6
        end
        object btnAlterar: TLabel
          Left = 81
          Top = 0
          Width = 64
          Height = 25
          Align = alLeft
          Caption = 'F4 Alterar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnAlterarClick
          ExplicitHeight = 20
        end
        object Splitter8: TSplitter
          Left = 68
          Top = 0
          Width = 13
          Height = 25
          ExplicitLeft = 0
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 49
        Width = 714
        Height = 387
        Align = alClient
        Ctl3D = True
        DataSource = dsProdutos
        DynProps = <>
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Light'
        Font.Style = []
        Options = [dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -15
        TitleParams.Font.Name = 'Segoe UI Semilight'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CODIGO'
            Footers = <>
            Width = 60
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRICAO'
            Footers = <>
            Width = 450
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PR_VENDA'
            Footers = <>
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro de Produtos'
      ImageIndex = 1
      object Label26: TLabel
        Left = 47
        Top = 23
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
      end
      object Label12: TLabel
        Left = 47
        Top = 63
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label6: TLabel
        Left = 47
        Top = 142
        Width = 66
        Height = 15
        Caption = 'Pre'#231'o Venda'
      end
      object Label42: TLabel
        Left = 47
        Top = 104
        Width = 144
        Height = 15
        Caption = 'Descri'#231#227'o Complementarar'
      end
      object Panel7: TPanel
        Left = 0
        Top = 436
        Width = 714
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          714
          25)
        object Label8: TLabel
          Left = 765
          Top = 22
          Width = 188
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Relat'#243'rio de Vendas no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10066329
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 813
        end
        object btnCancelar: TLabel
          Left = 125
          Top = 0
          Width = 76
          Height = 25
          Align = alLeft
          Caption = 'F6 Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCancelarClick
          ExplicitHeight = 20
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 0
          Width = 33
          Height = 25
        end
        object Splitter2: TSplitter
          Left = 698
          Top = 0
          Width = 16
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter3: TSplitter
          Left = 698
          Top = 0
          Width = 0
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter9: TSplitter
          Left = 92
          Top = 0
          Width = 33
          Height = 25
          ExplicitLeft = 100
        end
        object btnSalvar: TLabel
          Left = 33
          Top = 0
          Width = 59
          Height = 25
          Align = alLeft
          Caption = 'F5 Salvar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSalvarClick
          ExplicitHeight = 20
        end
      end
      object edtCodigo: TDBEdit
        Left = 47
        Top = 40
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'CODIGO'
        DataSource = dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtDescricao: TDBEdit
        Left = 47
        Top = 80
        Width = 594
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'DESCRICAO'
        DataSource = dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object edtPreco: TDBEdit
        Left = 47
        Top = 157
        Width = 106
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'PR_VENDA'
        DataSource = dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object edtComplementar: TDBEdit
        Left = 47
        Top = 120
        Width = 594
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'COMPLEMENTO'
        DataSource = dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object Imagem: TDBImage
        Left = 47
        Top = 194
        Width = 208
        Height = 189
        DataField = 'FOTO'
        DataSource = dsProdutos
        TabOrder = 5
        OnClick = ImagemClick
      end
    end
  end
  object qryProdutos: TFDQuery
    BeforePost = qryProdutosBeforePost
    AfterPost = qryProdutosAfterPost
    OnNewRecord = qryProdutosNewRecord
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from produto'
      'where'
      'descricao like :descricao and TIPO_restauRante='#39'S'#39
      'order by descricao')
    Left = 272
    Top = 176
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end>
    object qryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryProdutosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 30
    end
    object qryProdutosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdutosULTFORN: TIntegerField
      FieldName = 'ULTFORN'
      Origin = 'ULTFORN'
      DisplayFormat = ',0.00'
    end
    object qryProdutosLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryProdutosALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPR_CUSTO: TFMTBCDField
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosMARGEM: TCurrencyField
      FieldName = 'MARGEM'
      Origin = 'MARGEM'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryProdutosQTD_MIN: TFMTBCDField
      FieldName = 'QTD_MIN'
      Origin = 'QTD_MIN'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryProdutosE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Origin = 'CSTICMS'
      Size = 5
    end
    object qryProdutosCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryProdutosCSTS: TStringField
      FieldName = 'CSTS'
      Origin = 'CSTS'
      Size = 5
    end
    object qryProdutosCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Origin = 'CSTIPI'
      Size = 5
    end
    object qryProdutosCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 5
    end
    object qryProdutosNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryProdutosCOMISSAO: TCurrencyField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryProdutosATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField
      FieldName = 'PR_CUSTO_ANTERIOR'
      Origin = 'PR_CUSTO_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Origin = 'PR_VENDA_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosULT_COMPRA: TIntegerField
      FieldName = 'ULT_COMPRA'
      Origin = 'ULT_COMPRA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosULT_COMPRA_ANTERIOR: TIntegerField
      FieldName = 'ULT_COMPRA_ANTERIOR'
      Origin = 'ULT_COMPRA_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Origin = 'QTD_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosCOD_BARRA_ATACADO: TStringField
      FieldName = 'COD_BARRA_ATACADO'
      Origin = 'COD_BARRA_ATACADO'
    end
    object qryProdutosALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object qryProdutosGRADE: TStringField
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
    object qryProdutosEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryProdutosPAGA_COMISSAO: TStringField
      FieldName = 'PAGA_COMISSAO'
      Origin = 'PAGA_COMISSAO'
      Size = 1
    end
    object qryProdutosPESO: TFMTBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Origin = 'COMPOSICAO'
      Size = 1
    end
    object qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
      Origin = 'INICIO_PROMOCAO'
    end
    object qryProdutosFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
      Origin = 'FIM_PROMOCAO'
    end
    object qryProdutosESTOQUE_INICIAL: TFMTBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Origin = 'ESTOQUE_INICIAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosPR_VENDA_PRAZO: TFMTBCDField
      FieldName = 'PR_VENDA_PRAZO'
      Origin = 'PR_VENDA_PRAZO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryProdutosAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
      Size = 50
    end
    object qryProdutosREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Origin = 'REDUCAO_BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosMVA: TFMTBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosFCP: TFMTBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Origin = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryProdutosSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
    end
    object qryProdutosDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutosPR_CUSTO2: TFMTBCDField
      FieldName = 'PR_CUSTO2'
      Origin = 'PR_CUSTO2'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPERC_CUSTO: TFMTBCDField
      FieldName = 'PERC_CUSTO'
      Origin = 'PERC_CUSTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosFK_PRINCIPIO_ATIVO: TIntegerField
      FieldName = 'FK_PRINCIPIO_ATIVO'
      Origin = 'FK_PRINCIPIO_ATIVO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosREMEDIO: TStringField
      FieldName = 'REMEDIO'
      Origin = 'REMEDIO'
      Size = 1
    end
    object qryProdutosTIPO_RESTAURANTE: TStringField
      FieldName = 'TIPO_RESTAURANTE'
      Origin = 'TIPO_RESTAURANTE'
      Size = 1
    end
    object qryProdutosTEMPO_ESPERA: TIntegerField
      FieldName = 'TEMPO_ESPERA'
      Origin = 'TEMPO_ESPERA'
      DisplayFormat = ',0.00'
    end
    object qryProdutosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object qryProdutosRESTAUTANTE: TStringField
      FieldName = 'RESTAUTANTE'
      Origin = 'RESTAUTANTE'
      Size = 1
    end
    object qryProdutosFK_TECIDO: TDateField
      FieldName = 'FK_TECIDO'
      Origin = 'FK_TECIDO'
    end
    object qryProdutosFK_MARCA: TIntegerField
      FieldName = 'FK_MARCA'
      Origin = 'FK_MARCA'
      DisplayFormat = ',0.00'
    end
    object qryProdutosPREFIXO_BALANCA: TStringField
      FieldName = 'PREFIXO_BALANCA'
      Origin = 'PREFIXO_BALANCA'
      Size = 8
    end
    object qryProdutosCFOP_EXTERNO: TIntegerField
      FieldName = 'CFOP_EXTERNO'
      Origin = 'CFOP_EXTERNO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosETQ: TStringField
      FieldName = 'ETQ'
      Origin = 'ETQ'
      Size = 1
    end
    object qryProdutosFK_LCP: TStringField
      FieldName = 'FK_LCP'
      Origin = 'FK_LCP'
      Size = 10
    end
    object qryProdutosISSQN: TFMTBCDField
      FieldName = 'ISSQN'
      Origin = 'ISSQN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 272
    Top = 232
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 352
    Top = 216
  end
  object OpenPicture: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jpg;*.jpeg;*.gif;*.png;*.i' +
      'co;*.emf;*.wmf;*.tif;*.tiff)|*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jp' +
      'g;*.jpeg;*.gif;*.png;*.ico;*.emf;*.wmf;*.tif;*.tiff|GIF Image (*' +
      '.gif)|*.gif|Portable Network Graphics (*.png)|*.png|JPEG Image F' +
      'ile (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp' +
      ')|*.bmp|JPEG Images (*.jpg)|*.jpg|JPEG Images (*.jpeg)|*.jpeg|GI' +
      'F Images (*.gif)|*.gif|PNG Images (*.png)|*.png|Icons (*.ico)|*.' +
      'ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIF' +
      'F Images (*.tif)|*.tif|TIFF Images (*.tiff)|*.tiff'
    Left = 360
    Top = 351
  end
end
