object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  ActiveControl = edtCod
  BorderStyle = bsDialog
  Caption = 'Pesquisa Detalhada'
  ClientHeight = 362
  ClientWidth = 1018
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label28: TLabel
    Left = 0
    Top = 45
    Width = 1018
    Height = 13
    Align = alTop
    Caption = '    D'#234' um duplo clique para selecionar produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 218
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 45
    Align = alTop
    TabOrder = 0
    object grpReferencia: TGroupBox
      Left = 316
      Top = 1
      Width = 162
      Height = 43
      Align = alRight
      Caption = 'F4 | Refer'#234'ncia'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object edtReferencia: TEdit
        Left = 1
        Top = 17
        Width = 160
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodChange
        ExplicitHeight = 22
      end
    end
    object grpDescricao: TGroupBox
      Left = 109
      Top = 1
      Width = 207
      Height = 43
      Align = alClient
      Caption = 'F3 | Descri'#231#227'o'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object edtDescricao: TEdit
        Left = 1
        Top = 17
        Width = 205
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodChange
        ExplicitHeight = 22
      end
    end
    object grpAplicacao: TGroupBox
      Left = 478
      Top = 1
      Width = 164
      Height = 43
      Align = alRight
      Caption = 'F5 | Aplica'#231#227'o'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object edtAplicacao: TEdit
        Left = 1
        Top = 17
        Width = 162
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodChange
        ExplicitHeight = 22
      end
    end
    object grpCodigo: TGroupBox
      Left = 1
      Top = 1
      Width = 108
      Height = 43
      Align = alLeft
      Caption = 'F2 | C'#243'digo'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object edtCod: TEdit
        Left = 1
        Top = 17
        Width = 106
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodChange
        ExplicitHeight = 22
      end
    end
    object btnFiltrar: TBitBtn
      Left = 980
      Top = 1
      Width = 37
      Height = 43
      Align = alRight
      Caption = 'F8'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600001E0100001E0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA193818C7B65DCD6D0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91816C
        86745D85735C9B907FFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF91816C86745D84725B6D5E47776852DCD7D1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF91816C86745D84725B6D5E476D5E47847662FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91816C86745D84725B6D5E
        476D5E4780725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91816C
        86745D84725B6D5E476D5E4780725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF91816C86745D84725B6D5E476D5E4780725DFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF91816C86745D84725B6D5E476D5E4780725DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91816C86745D84725B6D5E
        476D5E4780725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91816C
        86745D84725B6D5E476D5E4780725DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCFC8BF86745D86745D84725B6D5E476D5E476E5F48CAC3BAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE3DFD987755E86745D86745D84725B6D5E476D5E476D5E4770
        614AE0DCD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF1EFEC89786286745D86745D86745D84725B6D5E
        476D5E476D5E476D5E4774654FF0EEEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBF98F7E6986745D86745D86745D
        86745D84725B6D5E476D5E476D5E476D5E476D5E477D6E59FBFAF9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A8B7886745D86
        745D86745D86745D86745D84725B6D5E476D5E476D5E476D5E476D5E476D5E47
        8B7E6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACA0
        9086745D86745D86745D86745D86745D86745D84725B6D5E476D5E476D5E476D
        5E476D5E476D5E476D5E47A19686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC2B9AD86745D86745D86745D86745D86745D86745D86745D84725B6D5E
        476D5E476D5E476D5E476D5E476D5E476D5E476D5E47BBB3A7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD7D1C987755E86745D86745D86745D86745D86745D86745D
        86745D84725B6D5E476D5E476D5E476D5E476D5E476D5E476D5E476D5E476F60
        49D2CCC5FFFFFFFFFFFFD8D2CE95877976634D77644E77644E77644E77644E77
        644E77644E77644E77644E75624C62523C62523C62523C62523C62523C62523C
        62523C62523C62523C63533D8E8274D6D1CC65513D5E49345E49345E49345E49
        345E49345E49345E49345E49345E49345E49345D49344F3E294F3E294F3E294F
        3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E29594834624D395E4934
        5E49345E49345E49345E49345E49345E49345E49345E49345E49345D48334F3E
        294F3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E2955
        442F624D395E49345E49345E49345E49345E49345E49345E49345E49345E4934
        5E49345D48334F3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E
        294F3E294F3E2955442F624D395E49345E49345E49345E49345E49345E49345E
        49345E49345E49345E49345D48334F3E294F3E294F3E294F3E294F3E294F3E29
        4F3E294F3E294F3E294F3E294F3E2955442F7665535E49345E49345E49345E49
        345E49345E49345E49345E49345E49345E49345D48334F3E294F3E294F3E294F
        3E294F3E294F3E294F3E294F3E294F3E294F3E294F3E296D5E4C}
      Layout = blGlyphTop
      ParentFont = False
      TabOrder = 6
      OnClick = btnFiltrarClick
    end
    object grpBarras: TGroupBox
      Left = 791
      Top = 1
      Width = 189
      Height = 43
      Align = alRight
      Caption = 'F7 | C'#243'digo de Barras'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      object edtBarra: TEdit
        Left = 1
        Top = 17
        Width = 187
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtBarraChange
        ExplicitHeight = 22
      end
    end
    object grpMarca: TGroupBox
      Left = 642
      Top = 1
      Width = 149
      Height = 43
      Align = alRight
      Caption = 'F6 | Marca'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      object edtMarca: TEdit
        Left = 1
        Top = 17
        Width = 147
        Height = 25
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodChange
        ExplicitHeight = 22
      end
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 58
    Width = 1018
    Height = 304
    Align = alClient
    DataSource = dsPesquisa
    DynProps = <>
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleParams.Font.Charset = ANSI_CHARSET
    TitleParams.Font.Color = clWindowText
    TitleParams.Font.Height = -13
    TitleParams.Font.Name = 'Courier New'
    TitleParams.Font.Style = []
    TitleParams.ParentFont = False
    OnDblClick = DBGridEh1DblClick
    OnKeyPress = DBGridEh1KeyPress
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
        FieldName = 'DESCRICAO'
        Footers = <>
        Title.Caption = 'Descri'#231#227'o'
        Width = 501
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MARCA'
        Footers = <>
        Title.Caption = 'Marca'
        Width = 210
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PR_VENDA'
        Footers = <>
        Title.Caption = 'Pre'#231'o'
        Width = 102
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'QTD_ATUAL'
        Footers = <>
        Title.Caption = 'Estoque'
        Width = 88
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object qryPesquisa: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select pro.codigo, pro.codbarra, pro.descricao, pro.pr_venda, pr' +
        'o.qtd_atual, ma.descricao as marca  from produto pro'
      'left join marca ma on ma.codigo=pro.fk_marca'
      'where'
      '(pro.ativo='#39'S'#39')'
      '(pro.codigo between :cod1 and :cod2) and'
      'pro.descricao like :descricao and'
      'pro.aplicacao like :apli and'
      'pro.referencia like :ref and'
      'pro.marca like :marca'
      '/*where*/'
      'order by pro.descricao')
    Left = 352
    Top = 184
    ParamData = <
      item
        Name = 'COD1'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COD2'
        ParamType = ptInput
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'APLI'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Name = 'REF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'MARCA'
        ParamType = ptInput
      end>
    object qryPesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryPesquisaCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryPesquisaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryPesquisaPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPesquisaQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryPesquisaMARCA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 440
    Top = 184
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 496
    Top = 184
  end
end
