object FrmContaDeposito: TFrmContaDeposito
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conta do Dep'#243'sito'
  ClientHeight = 184
  ClientWidth = 457
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 25
    Top = 26
    Width = 136
    Height = 16
    Alignment = taRightJustify
    Caption = 'Conta de Destino:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 111
    Width = 457
    Height = 73
    Align = alBottom
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 446
      Top = 1
      Width = 10
      Height = 71
      Align = alRight
      ExplicitLeft = 368
    end
    object Splitter2: TSplitter
      Left = 368
      Top = 1
      Width = 10
      Height = 71
      Align = alRight
      ExplicitLeft = 374
    end
    object btnVoltar: TBitBtn
      Left = 378
      Top = 1
      Width = 68
      Height = 71
      Align = alRight
      Caption = 'F5|Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FEFEFEDBDBEE6969CB3C3CC24C4CC5A1A1DCFDFDFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FDFEA1A1DC4C4CC53C3CC26A6ACBDBDBEFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE
        D7D7ED4848C83B3BD83B3BD93B3BD93B3BD18C8CD5FEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8C
        8CD53B3BD03B3BD93B3BD93B3BD84848C8D8D8EEFEFEFEFFFFFFFEFEFED7D7ED
        4949CA3C3CDA3C3CDA3C3CDA3B3BDA3C3CDA3C3CD38C8CD6FEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8C8CD63C
        3CD33C3CDA3B3BDA3C3CDA3C3CDA3C3CDA4949CAD8D8EEFEFEFEDBDBEF4949CB
        3C3CDA3D3DDB3D3DDB3D3DDB3D3DDB3C3CDB3D3DDB3D3DD48C8CD7FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8C8CD73D3DD43D
        3DDB3C3CDB3D3DDB3D3DDB3D3DDB3D3DDB3C3CDA4949CBDCDCF06C6CD53D3DDB
        3E3EDB3D3DDC3D3DDC3D3DDC3D3DDC3D3DDC3D3DDB3E3EDB3E3ED58D8DD7FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8D8DD73E3ED53E3EDB3D
        3DDB3D3DDC3D3DDC3D3DDC3D3DDC3D3DDC3E3EDB3D3DDB6C6CD54141D83E3EDC
        3E3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDC3E3EDC3F3FD68D8D
        D7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8D8DD73F3FD63E3EDC3E3EDC3E
        3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDD3E3EDC4141D85353E04040DD
        3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDD3F3FDD3F3F
        D68D8DD7FEFEFEFFFFFFFFFFFFFEFEFE8D8DD73F3FD63F3FDD3F3FDD3F3FDE3F
        3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE3F3FDE4040DD5353E0A5A5EF4141DE
        4141DE4040DE4040DE4040DE4040DE4040DE4040DE4040DE4040DE3F3FDE4040
        DE4040D78E8ED8FDFDFEFDFDFE8E8ED84040D74040DE3F3FDE4040DE4040DE40
        40DE4040DE4040DE4040DE4040DE4040DE4141DE4141DEA5A5EFFDFDFE9191EB
        4141DE4141DF4141DF4141DF4141DF4141DF4141DF4141DF4141DF4141DF4040
        DE4141DE4141D88E8ED98E8ED94141D84141DE4040DE4141DF4141DF4141DF41
        41DF4141DF4141DF4141DF4141DF4141DF4141DE9191EBFDFDFEFFFFFFFEFEFF
        9191EB4242DF4242E04141E04141E04141E04141E04141E04141E04141E04141
        E04141DF4242DF4141D94141D94242DF4141DF4141E04141E04141E04141E041
        41E04141E04141E04141E04242E04242DF9191EBFEFEFFFFFFFFFFFFFFFFFFFF
        FEFEFF9191EC4242E04343E14242E14242E14242E14242E14242E14242E14242
        E14242E14242E04242E04242E04242E04242E14242E14242E14242E14242E142
        42E14242E14242E14343E14242E09191ECFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFF9292ED4343E14444E14343E24343E24343E24343E24343E24343
        E24343E24343E24343E24343E24343E24343E24343E24343E24343E24343E243
        43E24343E24444E14343E19292EDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFF9393ED4444E24545E24444E24444E24444E24444E24444
        E24444E24444E24444E24444E24444E24444E24444E24444E24444E24444E244
        44E24545E24444E29393EDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFF9393ED4545E24545E34545E34545E34545E34545
        E34545E34545E34545E34545E34545E34545E34545E34545E34545E34545E345
        45E34545E29393EDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9393EE4646E34646E34545E44545E44545
        E44545E44545E44545E44545E44545E44545E44545E44545E44545E44646E346
        46E39393EEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFE9393EE4646E44646E54646E54646
        E54646E54646E54646E54646E54646E54646E54646E54646E54646E54646E493
        93EEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFE9191E24747E54747E54747E54747
        E54747E54747E54747E54747E54747E54747E54747E54747E54747E54747E591
        91E2FDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9191DC4747DF4848E54848E64848E64848
        E64848E64848E64848E64848E64848E64848E64848E64848E64848E64848E547
        47DF9191DCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFE9292DC4747DF4949E64848E64949E74949E74949
        E74949E74949E74949E74949E74949E74949E74949E74949E74949E74848E649
        49E64747E09292DCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFE9393DC4848E04A4AE74949E74949E84949E84949E84949
        E84949E84949E84949E84949E84949E84949E84949E84949E84949E84949E849
        49E74A4AE74848E09393DCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFE9393DC4949E04A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A4A
        E84A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A4AE84A
        4AE84A4AE84A4AE84949E19393DCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFE9393DD4A4AE14B4BE84A4AE84B4BE94B4BE94B4BE94B4BE94B4BE94B4B
        E94B4BE94B4BE94B4BE94B4BE94B4BE94B4BE94B4BE94B4BE94B4BE94B4BE94B
        4BE94B4BE94A4AE84B4BE84A4AE29393DDFEFEFEFFFFFFFFFFFFFFFFFFFEFEFE
        9393DD4B4BE24C4CE94B4BE94C4CEA4C4CEA4C4CEA4C4CEA4C4CEA4C4CEA4C4C
        EA4C4CEA4D4DEA4D4DEA4D4DEA4D4DEA4C4CEA4C4CEA4C4CEA4C4CEA4C4CEA4C
        4CEA4C4CEA4C4CEA4B4BE94C4CE94B4BE29393DEFEFEFEFFFFFFFDFDFE9494DE
        4B4BE34D4DEA4C4CEA4C4CEB4C4CEB4C4CEB4C4CEB4C4CEB4C4CEB4C4CEB4C4C
        EB4D4DEB4D4DEA9797F29797F24D4DEA4D4DEB4C4CEB4C4CEB4C4CEB4C4CEB4C
        4CEB4C4CEB4C4CEB4C4CEB4C4CEA4D4DEA4B4BE39494DEFDFDFEA9A9E44C4CE3
        4D4DEB4D4DEB4D4DEC4D4DEC4D4DEC4D4DEC4D4DEC4D4DEC4D4DEC4D4DEC4E4E
        EB4D4DEB9898F2FDFDFEFDFDFE9898F24D4DEB4E4EEB4D4DEC4D4DEC4D4DEC4D
        4DEC4D4DEC4D4DEC4D4DEC4D4DEC4D4DEB4D4DEB4C4CE4A9A9E55E5EE24E4EEC
        4D4DEC4E4EEC4E4EEC4E4EEC4E4EEC4E4EEC4E4EEC4E4EEC4E4EEC4F4FEC4E4E
        EC9898F2FEFEFFFFFFFFFFFFFFFEFEFF9898F24E4EEC4F4FEC4E4EEC4E4EEC4E
        4EEC4E4EEC4E4EEC4E4EEC4E4EEC4E4EEC4D4DEC4E4EEC5E5EE25151EA4F4FEC
        4F4FED4F4FED4F4FED4F4FED4F4FED4F4FED4F4FED4F4FED5050ED4F4FEC9999
        F3FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9999F34F4FEC5050ED4F4FED4F
        4FED4F4FED4F4FED4F4FED4F4FED4F4FED4F4FED4F4FEC5151EA7C7CF25050ED
        5151EE5050EE5050EE5050EE5050EE5050EE5050EE5050EE5050ED9A9AF3FEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9A9AF35050ED5050EE50
        50EE5050EE5050EE5050EE5050EE5050EE5151EE5050ED7C7CF2DFDFF85E5EEE
        5151EE5151EF5050EF5050EF5050EF5050EF5151EE5151EE9A9AF4FEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9A9AF45151EE51
        51EE5050EF5050EF5050EF5050EF5151EF5151EE5E5EEEE0E0F9FEFEFEDCDCF8
        5E5EEF5151EF5252EF5151EF5151EF5252EF5151EF9A9AF4FEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9A9AF451
        51EF5252EF5151EF5151EF5252EF5151EF5E5EEFDCDCF8FEFEFEFFFFFFFEFEFE
        DCDCF85F5FEF5252EF5353F05353F05252EF9B9BF5FEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF9B
        9BF55252EF5353F05353F05252EF5F5FEFDCDCF9FEFEFEFFFFFFFFFFFFFFFFFF
        FEFEFEE0E0F87E7EF45555F06464F2AEAEF8FDFDFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
        FDFEAEAEF86464F25555F07E7EF4E0E0F9FEFEFEFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      TabOrder = 1
      OnClick = btnVoltarClick
    end
    object btnAvancar: TBitBtn
      Left = 300
      Top = 1
      Width = 68
      Height = 71
      Align = alRight
      Caption = 'F4|Concluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
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
        FFFFFFFFFFFFEFEDEAE1B36ED5A866C7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7
        C3BDC7C3BDD5A866E1B36EF0EDEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE1B36EDB9834DDB06CE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1
        DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3
        E1DCE3E1DCDDB06CDB9834E2B36EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDC9A39DB9834E2B571F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECE2B571DB9834DC9A39FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECDEDBD7D5D1CCD5D1CCD5D1
        CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCDEDBD7F1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECDEDBD7D5D1CCD5D1CCD5D1
        CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCD5D1CCDEDBD7F1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECD5D1CCC7C3BDC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDD5D1CCF1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B571F1F0ECF1F0ECE7E5E1E3E1DCE3E1DCE3E1
        DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE3E1DCE7E5E1F1
        F0ECF1F0ECE2B571DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834E2B470F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECE2B470DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DDA046EEE4D3F1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECEEE4D3DDA046DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834DA9733D19130CF9030CF90
        30CF9030CF9030CF9030CF9030CF9030CF9030CF9030CF9030D19130DA9733DB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834C98B2EB98029B98029B980
        29B98029B98029B98029B98029B98029B98029B98029B98029B98029C98B2EDB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834D6AC6BEEEBE3F1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECEEEBE3D6AC6BDB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834E9D1ADF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECE7C89AE2B571E2B571E2B571ECDCC3E9D1ADDB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECE2B571DB9834DB9834DB9834E9D2AEE9D2AEDB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECE2B571DB9834DB9834DB9834E9D2AEE9D2AEDB
        9834DB9834DB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDB9834DB9834DB9834DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECE2B571DB9834DB9834DB9834E9D2AEE9D2AEDB
        9834DB9834DB9834DB9834E0C396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDC9A39DB9834DB9834DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECD3AA6BC4882CC4882CC4882CE2CCABE9D2AEDB
        9834DB9834DB9834E0C396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE1B36EDB9834DB9834DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECD7BD93CBA468CBA468CBA468E4D6BFE9D2AEDB
        9834DB9834E0C396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF0EDEAE2B36EDC9A39DB9834DB9834E9D2AEF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECE9D2AEDB
        9834E0C396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
      TabOrder = 0
      OnClick = btnAvancarClick
    end
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 25
    Top = 43
    Width = 411
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    DynProps = <>
    DataField = ''
    DropDownBox.AutoDrop = True
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    KeyField = 'CODIGO'
    ListField = 'DESCRICAO'
    ListSource = dsConta
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object qryConta: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from contas'
      'where'
      'tipo='#39'B'#39
      'ORDER BY DESCRICAO')
    Left = 211
    Top = 12
    object qryContaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object qryContaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryContaID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object qryContaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object qryContaDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryContaLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryContaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
  end
  object dsConta: TDataSource
    DataSet = qryConta
    Left = 267
    Top = 12
  end
end
