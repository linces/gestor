object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 348
  ClientWidth = 401
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
    Width = 401
    Height = 348
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lista de Usu'#225'rios'
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 49
        Width = 393
        Height = 244
        Align = alClient
        DataSource = dsUsuarios
        DynProps = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -13
        TitleParams.Font.Name = 'Segoe UI'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN'
            Footers = <>
            Title.Caption = 'Usu'#225'rio'
            Width = 208
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 393
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          393
          49)
        object Label11: TLabel
          Left = 444
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
          Left = 309
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
      end
      object Panel2: TPanel
        Left = 0
        Top = 293
        Width = 393
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          393
          25)
        object Label1: TLabel
          Left = 444
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
          Left = 377
          Top = 0
          Width = 16
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter6: TSplitter
          Left = 325
          Top = 0
          Width = 0
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object btnSair: TLabel
          Left = 325
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro de Us'#225'rios'
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
        Width = 40
        Height = 15
        Caption = 'Usu'#225'rio'
      end
      object Label42: TLabel
        Left = 47
        Top = 104
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object Panel7: TPanel
        Left = 0
        Top = 293
        Width = 393
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          393
          25)
        object Label8: TLabel
          Left = 444
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
          Left = 377
          Top = 0
          Width = 16
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter3: TSplitter
          Left = 377
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
        DataSource = dsUsuarios
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
        Width = 200
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'LOGIN'
        DataSource = dsUsuarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object edtComplementar: TDBEdit
        Left = 47
        Top = 120
        Width = 200
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'SENHA'
        DataSource = dsUsuarios
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
      end
    end
  end
  object qryUsuarios: TFDQuery
    AfterPost = qryUsuariosAfterPost
    OnNewRecord = qryUsuariosNewRecord
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from usuarios'
      'order by login')
    Left = 272
    Top = 176
    object qryUsuariosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 10
    end
    object qryUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 30
    end
    object qryUsuariosHIERARQUIA: TSmallintField
      FieldName = 'HIERARQUIA'
      Origin = 'HIERARQUIA'
      DisplayFormat = ',0.00'
    end
    object qryUsuariosECAIXA: TStringField
      FieldName = 'ECAIXA'
      Origin = 'ECAIXA'
      Size = 1
    end
    object qryUsuariosSUPERVISOR: TStringField
      FieldName = 'SUPERVISOR'
      Origin = 'SUPERVISOR'
      Size = 1
    end
    object qryUsuariosATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryUsuariosULTIMO_PEDIDO: TIntegerField
      FieldName = 'ULTIMO_PEDIDO'
      Origin = 'ULTIMO_PEDIDO'
      DisplayFormat = ',0.00'
    end
    object qryUsuariosULTIMA_VENDA: TIntegerField
      FieldName = 'ULTIMA_VENDA'
      Origin = 'ULTIMA_VENDA'
      DisplayFormat = ',0.00'
    end
    object qryUsuariosAPP_SENHA: TStringField
      FieldName = 'APP_SENHA'
      Origin = 'APP_SENHA'
      Size = 30
    end
    object qryUsuariosSENHA_APP: TStringField
      FieldName = 'SENHA_APP'
      Origin = 'SENHA_APP'
      Size = 30
    end
    object qryUsuariosFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
      DisplayFormat = ',0.00'
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 272
    Top = 232
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 272
    Top = 288
  end
end
