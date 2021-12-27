object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'Adicionar Item'
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 5592405
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      722
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
    object DBText2: TDBText
      Left = 16
      Top = -4
      Width = 77
      Height = 30
      AutoSize = True
      DataField = 'NOME'
      DataSource = dsMesa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 18
      Top = 22
      Width = 57
      Height = 21
      AutoSize = True
      DataField = 'DATA'
      DataSource = dsMesa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 638
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
  object Panel7: TPanel
    Left = 0
    Top = 466
    Width = 722
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Color = 5592405
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      722
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
    object Label17: TLabel
      Left = 13
      Top = 0
      Width = 118
      Height = 25
      Align = alLeft
      Caption = 'F10 Salvar Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = Label17Click
      ExplicitHeight = 20
    end
    object Splitter1: TSplitter
      Left = 0
      Top = 0
      Width = 13
      Height = 25
    end
    object Splitter2: TSplitter
      Left = 706
      Top = 0
      Width = 16
      Height = 25
      Align = alRight
      ExplicitLeft = 684
    end
    object Splitter3: TSplitter
      Left = 654
      Top = 0
      Width = 0
      Height = 25
      Align = alRight
      ExplicitLeft = 684
    end
    object Label9: TLabel
      Left = 654
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
      OnClick = Label9Click
      ExplicitHeight = 20
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 722
    Height = 417
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 28
      Top = 15
      Width = 47
      Height = 17
      Caption = 'Produto'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 28
      Top = 108
      Width = 68
      Height = 17
      Caption = 'Quantidade'
      FocusControl = DBEdit2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 28
      Top = 156
      Width = 83
      Height = 17
      Caption = 'Pre'#231'o Unit'#225'rio'
      FocusControl = DBEdit3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 28
      Top = 204
      Width = 29
      Height = 17
      Caption = 'Total'
      FocusControl = DBEdit4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 28
      Top = 252
      Width = 111
      Height = 17
      Caption = 'Tempo de Preparo'
      FocusControl = DBEdit5
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 28
      Top = 299
      Width = 135
      Height = 17
      Caption = 'Informa'#231#245'es Adicionais'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 28
      Top = 61
      Width = 100
      Height = 17
      Caption = 'Comanda/Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 28
      Top = 33
      Width = 41
      Height = 28
      TabStop = False
      DataField = 'FK_PRODUTO'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 28
      Top = 126
      Width = 195
      Height = 28
      DataField = 'QTD'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 28
      Top = 173
      Width = 195
      Height = 28
      DataField = 'PRECO'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 28
      Top = 221
      Width = 195
      Height = 28
      TabStop = False
      DataField = 'TOTAL'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 28
      Top = 269
      Width = 195
      Height = 28
      TabStop = False
      DataField = 'VIRTUAL_TEMPO'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBMemo1: TDBMemo
      Left = 28
      Top = 318
      Width = 195
      Height = 78
      TabStop = False
      DataField = 'VIRTUAL_COMPLEMENTO'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object Panel9: TPanel
      Left = 247
      Top = 118
      Width = 414
      Height = 291
      BevelOuter = bvNone
      TabOrder = 8
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 75
      Top = 33
      Width = 586
      Height = 28
      DataField = 'FK_PRODUTO'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsProduto
      ParentFont = False
      TabOrder = 1
      OnEnter = DBLookupComboBox1Enter
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 28
      Top = 80
      Width = 195
      Height = 28
      DataField = 'FK_COMANDA_PESSOA'
      DataSource = dsItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = dsComanda_Pessoa
      ParentFont = False
      TabOrder = 2
      OnEnter = DBLookupComboBox2Enter
    end
  end
  object DBImage1: TDBImage
    Left = 256
    Top = 129
    Width = 405
    Height = 316
    DataField = 'FOTO'
    DataSource = dsProduto
    TabOrder = 3
    TabStop = False
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 336
    Top = 256
  end
  object qryItens: TFDQuery
    BeforePost = qryItensBeforePost
    AfterPost = qryItensAfterPost
    OnNewRecord = qryItensNewRecord
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * '
      'from comanda_itens ci'
      'where'
      'ci.fk_comanda_pessoa=:comanda'
      'order by ci.codigo')
    Left = 256
    Top = 176
    ParamData = <
      item
        Name = 'COMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryItensFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      OnChange = qryItensFK_PRODUTOChange
      DisplayFormat = ',0.00'
    end
    object qryItensQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      OnChange = qryItensQTDChange
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      OnChange = qryItensQTDChange
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItensVIRTUAL_TEMPO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TEMPO'
      LookupDataSet = Dados.qryProdutos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'TEMPO_ESPERA'
      KeyFields = 'FK_PRODUTO'
      Size = 30
      Lookup = True
    end
    object qryItensVIRTUAL_PRECO: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PRECO'
      LookupDataSet = Dados.qryProdutos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'PR_VENDA'
      KeyFields = 'FK_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItensVIRTUAL_COMPLEMENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_COMPLEMENTO'
      LookupDataSet = Dados.qryProdutos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'COMPLEMENTO'
      KeyFields = 'FK_PRODUTO'
      Size = 100
      Lookup = True
    end
    object qryItensFK_COMANDA_PESSOA: TIntegerField
      FieldName = 'FK_COMANDA_PESSOA'
      Origin = 'FK_COMANDA_PESSOA'
      DisplayFormat = ',0.00'
    end
    object qryItensPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryItensDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
  end
  object dsProduto: TDataSource
    DataSet = Dados.qryProdutos
    Left = 272
    Top = 256
  end
  object dsMesa: TDataSource
    Left = 400
    Top = 256
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 352
    Top = 216
  end
  object qryComanda_Pessoa: TFDQuery
    OnNewRecord = qryItensNewRecord
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from comanda_pessoa'
      'where'
      'fk_comanda=:comanda and situacao='#39'A'#39
      'order by nome')
    Left = 472
    Top = 176
    ParamData = <
      item
        Name = 'COMANDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryComanda_PessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryComanda_PessoaFK_COMANDA: TIntegerField
      FieldName = 'FK_COMANDA'
      Origin = 'FK_COMANDA'
      DisplayFormat = ',0.00'
    end
    object qryComanda_PessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object qryComanda_PessoaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryComanda_PessoaPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
  end
  object dsComanda_Pessoa: TDataSource
    DataSet = qryComanda_Pessoa
    Left = 480
    Top = 256
  end
end
