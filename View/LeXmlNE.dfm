object FrmXml: TFrmXml
  Left = 268
  Top = 27
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Importar XML'
  ClientHeight = 627
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 286
      Top = 41
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 828
      Top = 2
      Width = 64
      Height = 13
      Caption = 'Data Entrada'
      FocusControl = DBEdit3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 917
      Top = 2
      Width = 64
      Height = 13
      Caption = 'Data Emiss'#227'o'
      FocusControl = DBEdit4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 926
      Top = 42
      Width = 52
      Height = 13
      Caption = 'Nota Fiscal'
      FocusControl = DBEdit5
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 208
      Top = 2
      Width = 53
      Height = 13
      Caption = 'Chave NFe'
      FocusControl = DBEdit7
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 751
      Top = 41
      Width = 25
      Height = 13
      Caption = 'CNPJ'
      FocusControl = DBEdit10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 898
      Top = 43
      Width = 13
      Height = 13
      Caption = 'UF'
      FocusControl = DBEdit10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnImportar: TSpeedButton
      Left = 0
      Top = 0
      Width = 95
      Height = 82
      Align = alLeft
      Caption = 'Importar via XML'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000DD000000DD0000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E0DAA49982
        8B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D
        608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B
        7D60A49982E4E0DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA499828B7D60
        8B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D
        608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B
        7D608B7D60A49982FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D
        608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D
        608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B
        7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFEFCF7B768F8C07B8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92856992
        8569928569928569FFFFFFFFFFFFFFFFFFFAD09BF39621F4A1388B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDEDD9F6AE54F7BB70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDECD8F39927F39621F7B6658B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFAD7AAF39A2AF39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDECD8F4A33CF39621F39621F9CC928B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFA
        F5F7BD73F39621F39621F39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFDFBDAB1F49B2CF39621F39621F39621FCE1C08B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDD9F5A7
        45F39621F39621F39621F39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFEF5EAFC
        E7CCFAD09DF5A43FF39621F39621F39621F39621F4A036FEF9F38B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD7AAF39A2AF396
        21F39621F39621F39621F39621F39621F39621F39621F39621F39621F39621F3
        9621F39621F39621F39621F39621F39621F39621FBDEBAFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFEFAF5F7BD73F39621F39621F396
        21F39621F39621F39621F39621F39621F39621F39621F39621F39621F39621F3
        9621F39621F39621F39621F39621F39621F7BC71FFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFF6B25BF39621F39621F39621F396
        21F39621F39621F39621F39621F39621F39621F39621F39621F39621F39621F3
        9621F39621F39621F39621F39621F4A23BFEF8F0FFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFF6B25BF39621F39621F39621F396
        21F39621F39621F39621F39621F39621F39621F39621F39621F39621F39621F3
        9621F39621F39621F39621F7BC71FEF8F0FFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D608B7D608B7D60FFFFFFFFFFFFFEFAF5F7BD73F39621F39621F396
        21F39621F39621F39621F39621F39621F39621F39621F39621F39621F39621F3
        9621F39621F4A036FBDEBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B7D608B7D60
        8B7D608B7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFAD7AAF39A2AF396
        21F39621F39621F39621F39621F39621F39621F39621F39621F4A138F7B665F9
        CC92FCE1C0FEF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA499828B7D60
        8B7D608B7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDD9F5A7
        45F39621F39621F39621F39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E0DAA49982
        8B7D608B7D608B7D608B7D60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFA
        F5F7BD73F39621F39621F39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFAD7AAF39A2AF39621F39621FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDEDD9F6AE54F7BB70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnImportarClick
    end
    object btnFinalizar: TSpeedButton
      Left = 95
      Top = 0
      Width = 95
      Height = 82
      Align = alLeft
      Caption = 'Finalizar Importa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000DD000000DD0000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9F9F8ECEBE8E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2ECEBE8F9F9F8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECEBE8E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2ECEBE8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1
        CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8D1CAD8
        D1CAD8D1CADCD7D1E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        EED081E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E3CB90E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E9C25AFAF1DAEAC35CE8BE50F3DEA5F2D999F0D48BF2DA
        9BE8BE50E8BE50E8BE50F9EDCEE8BE50F3DDA2FFFFFFFFFFFFFBF4E1E8BF52E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50F6E5B9F8EBCAEFD287FDF9EEEAC562F3DDA2F6E5
        B8E9C25AEDCD78E8BE50FFFFFFE8BE50F6E5B8F2D999E9C25BE9C056E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50E9C054FAF1DAFEFDFAEDCD78E8BE50F3DDA2F6E5
        B8F8EBC9FEFDFBEDCD78FFFFFFE8BE50F6E5B8F1D692E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50EAC562FDF8EDFDF8ECF1D998E8BE50F3DDA2FDF9
        F0FBF4E0F0D48CFDF8EDFFFFFFE8BE50F6E5B8F1D692E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50FAF0D7F4DFA8EBC769FDFAF1EDCB73F3DDA2FEFC
        F7ECC86BE8BE50F5E3B4FFFFFFE8BE50F6E5B8F1D692E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50F0D38AE8BE51E8BE50ECCA72EBC667ECC86BEECF
        7EE8BE50E8BE50E9C055F1D998E8BE50ECCA72EAC460E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E8BE50E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        EED081E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE
        50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8BE50E8
        BE50E8BE50E8C979E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2DFDBD6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2E7E5E2DFDBD6D8D1CAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2E7E5E2DFDBD6D8D1CAD8D1CAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2E7E5E2DFDBD6D8D1CAD8D1CAD8D1CAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2E7E5E2DFDBD6D8D1CAD8D1CAD8D1CAD8D1CAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7
        E5E2DFDBD6D8D1CAD8D1CAD8D1CAD8D1CAD8D1CAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2DDDAD6C6
        C1BBBDB7B0BDB7B0BDB7B0BDB7B0BDB7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2C6C1BBBD
        B7B0BDB7B0BDB7B0BDB7B0BDB7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2BDB7B0BD
        B7B0BDB7B0BDB7B0BDB7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2BDB7B0BD
        B7B0BDB7B0BDB7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2BDB7B0BD
        B7B0BDB7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2BDB7B0BD
        B7B0D8D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFECEBE8E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2BDB7B0D8
        D4D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9F9F8ECEBE8E7E5E2E7E5E2E7E5E2E7E5E2E7E5
        E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2E7E5E2D8D4D0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnFinalizarClick
    end
    object Label8: TLabel
      Left = 208
      Top = 41
      Width = 27
      Height = 13
      Caption = 'CFOP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 286
      Top = 55
      Width = 33
      Height = 21
      TabStop = False
      Color = 15724527
      Ctl3D = False
      DataField = 'ID_FORNECEDOR'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 827
      Top = 18
      Width = 85
      Height = 21
      Ctl3D = False
      DataField = 'DATA_ENTRADA'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 917
      Top = 18
      Width = 85
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'DATA_EMISSAO_NF'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 926
      Top = 55
      Width = 76
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'NOTA_FISCAL'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit7: TDBEdit
      Left = 208
      Top = 18
      Width = 613
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'CHAVE'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit9: TDBEdit
      Left = 325
      Top = 55
      Width = 420
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'VIRTUAL_FORNECEDOR'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit10: TDBEdit
      Left = 751
      Top = 55
      Width = 140
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'VIRTUAL_CNPJ'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit11: TDBEdit
      Left = 897
      Top = 55
      Width = 23
      Height = 21
      TabStop = False
      Ctl3D = False
      DataField = 'VITUAL_UF'
      DataSource = dsMaster
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object DBLookupComboboxEh4: TDBLookupComboboxEh
      Left = 208
      Top = 55
      Width = 71
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'CFOP'
      DataSource = dsMaster
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'CODIGO'
      ListSource = dsCFOP
      ParentFont = False
      Style = csDropDownEh
      TabOrder = 8
      Visible = True
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 493
    Width = 1008
    Height = 134
    ActivePage = TabSheet1
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Detalhes Itens - Fornecedor'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1000
        Height = 104
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        DataSource = dsDetail
        FixedColor = 15395562
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PRODUTO_FOR'
            Title.Caption = 'C'#243'digo'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRA'
            Title.Caption = 'C'#243'd.Barra'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST_E'
            Title.Caption = 'CST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_FORNECEDOR'
            Title.Caption = 'Descri'#231#227'o'
            Width = 394
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANT_E'
            Title.Alignment = taRightJustify
            Title.Caption = 'Quantidade'
            Width = 148
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UND_E'
            Title.Caption = 'Unidade'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_E'
            Title.Alignment = taRightJustify
            Title.Caption = 'Pre'#231'o'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ITEM'
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 103
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Totais'
      ImageIndex = 1
      object Label10: TLabel
        Left = 16
        Top = 8
        Width = 49
        Height = 14
        Caption = 'SubTotal'
        FocusControl = DBEdit12
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 16
        Top = 48
        Width = 47
        Height = 14
        Caption = 'Base PIS'
        FocusControl = DBEdit18
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 128
        Top = 48
        Width = 50
        Height = 14
        Caption = 'Total PIS'
        FocusControl = DBEdit19
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 124
        Top = 9
        Width = 29
        Height = 14
        Caption = 'Frete'
        FocusControl = DBEdit13
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 236
        Top = 9
        Width = 50
        Height = 14
        Caption = 'Despesas'
        FocusControl = DBEdit14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 236
        Top = 48
        Width = 61
        Height = 14
        Caption = 'Base Cofins'
        FocusControl = DBEdit20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 348
        Top = 8
        Width = 39
        Height = 14
        Caption = 'Seguro'
        FocusControl = DBEdit15
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 346
        Top = 48
        Width = 64
        Height = 14
        Caption = 'Total Cofins'
        FocusControl = DBEdit26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 458
        Top = 48
        Width = 44
        Height = 14
        Caption = 'Base IPI'
        FocusControl = DBEdit27
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 458
        Top = 9
        Width = 52
        Height = 14
        Caption = 'Desconto'
        FocusControl = DBEdit16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 569
        Top = 10
        Width = 28
        Height = 14
        Caption = 'Total'
        FocusControl = DBEdit17
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 676
        Top = 10
        Width = 56
        Height = 14
        Caption = 'Base ICMS'
        FocusControl = DBEdit22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 676
        Top = 48
        Width = 44
        Height = 14
        Caption = 'Base ST'
        FocusControl = DBEdit24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 781
        Top = 48
        Width = 47
        Height = 14
        Caption = 'Total ST'
        FocusControl = DBEdit25
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 781
        Top = 10
        Width = 59
        Height = 14
        Caption = 'Total ICMS'
        FocusControl = DBEdit23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 568
        Top = 48
        Width = 47
        Height = 14
        Caption = 'Total IPI'
        FocusControl = DBEdit21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit12: TDBEdit
        Left = 16
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'SUB_TOTAL'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit18: TDBEdit
        Left = 16
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'BASE_PIS'
        DataSource = dsMaster
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
      object DBEdit19: TDBEdit
        Left = 128
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL_PIS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit13: TDBEdit
        Left = 126
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'FRETE'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit14: TDBEdit
        Left = 236
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'OUTRAS_DESPESAS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit20: TDBEdit
        Left = 237
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'BASE_COFINS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit15: TDBEdit
        Left = 347
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'SEGURO'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit26: TDBEdit
        Left = 347
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL_COFINS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit27: TDBEdit
        Left = 458
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'BASE_IPI'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit16: TDBEdit
        Left = 457
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'DESCONTO'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit17: TDBEdit
        Left = 568
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit22: TDBEdit
        Left = 676
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'BASE_ICMS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object DBEdit24: TDBEdit
        Left = 676
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'BASE_ST'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object DBEdit25: TDBEdit
        Left = 782
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL_ST'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit23: TDBEdit
        Left = 783
        Top = 24
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL_ICMS'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object DBEdit21: TDBEdit
        Left = 568
        Top = 64
        Width = 100
        Height = 21
        TabStop = False
        Ctl3D = False
        DataField = 'TOTAL_IPI'
        DataSource = dsMaster
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
    end
  end
  object pnAguarde: TPanel
    Left = 232
    Top = 312
    Width = 475
    Height = 73
    Caption = 'Aguarde...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 1008
    Height = 411
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 936
      Top = 2
      Width = 70
      Height = 407
      Align = alRight
      TabOrder = 0
      object btnLoc: TBitBtn
        Left = 1
        Top = 115
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Pesquisar'
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
          FFFFFFFFFFF6F5F3D7D1C8C7C1B1C8BFB4D7D3C8F7F6F4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF3F2EFC9C0B5C5BEB0C5BEB0C5BEB0C5BEB0C9C0B3F7F6F4FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F1EFC9C0B5C5BEB0D8D2CAFAF9F8FAF9F8D6D1C8C5BEB0D7D2C9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F1EFC7
          C2B5C5BEB0D9D4CBFEFEFEFFFFFFFFFFFFFAF9F8C5BEB0C8BFB2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F1EEC7C2B5C5
          BEB0D9D4CBFEFEFEFFFFFFFFFFFFFFFFFFFAF9F8C5BEB0C8BFB4FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F1EEC7C2B5C5BEB0D9
          D4CBFEFEFEFFFFFFFFFFFFFFFFFFFEFEFED8D2CAC5BEB0D7D2C7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F3F1E2DED7D3CFC4CBC5B6C4C0
          B2C6BDAFCBC3B8D3CFC4E2DED7F5F4F2FFFFFFF2F1EEC7C2B5C5BEB0D9D4CBFE
          FEFEFFFFFFFFFFFFFFFFFFFEFEFED9D4CBC5BEB0C7C2B5F6F5F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF1EFECD3CDC3C5BEB0C5BEB0C5BEB0C5BEB0C5BE
          B0C5BEB0C5BEB0C5BEB0C5BEB0C5BEB0D3CEC3C7C2B5C5BEB0D9D4CBFEFEFEFF
          FFFFFFFFFFFFFFFFFEFEFED9D4CBC5BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFCDCD7D0C5BEB0C5BEB0C7C3B6DDD9D1EDEBE7F8F7F6FDFD
          FDFEFEFEF8F8F6EDEBE7DCD7D0C7C2B5C5BEB0C5BEB0D9D4CBFEFEFEFFFFFFFF
          FFFFFFFFFFFEFEFED9D4CBC5BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFBFAD2CBC1C5BEB0C7BEB2E2DFD8FCFCFBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBE3E0DADCD7CFFEFEFEFFFFFFFFFFFFFF
          FFFFFEFEFED9D4CBC5BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFCD2CBC1C5BEB0CDC6B8F5F4F1FFFFFFFFFFFFFCE7B9F7C960F6B526F2A9
          0AF2A90AF6B327F7C861FCE8BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FEFED9D4CBC5BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DCD8CFC5BEB0CDC6B8F9F8F7FFFFFFFDF1D6F6BB3BF4A903F4A903F4A903F4A9
          03F4A903F4A903F4A903F4A903F7BD3DFDF2D9FFFFFFFFFFFFFFFFFFFEFEFED9
          D4CBC5BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EFEB
          C5BEB0C5BEB3F5F4F1FFFFFFFCE9BFF5AB0FF4A903F3AF1BFAD686FDEFD2FFFC
          F7FFFCF7FDEFD1FAD685F5B11AF4A903F5AB10FCEAC1FFFFFFFFFFFFDAD7CDC5
          BEB0C7C2B5F2F1EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CCC2
          C5BEB0E3DFD9FFFFFFFDF1D6F5AB0FF4A903F8C659FEFBF2FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFAF1F8C657F4A903F5AB10FDF2D9FFFFFFE3E0D9C5
          BEB0D3CEC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F0C5BEB0
          C7C3B6FCFCFCFFFFFFF6BC39F4A903F8C659FFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF8C555F4A903F7BD3DFFFFFFFCFCFBC7
          C2B5C5BEB0F5F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DED7C5BEB0
          DDD9D1FFFFFFFCE7B8F4A903F3B11CFEFBF2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAF0F5B019F4A903FCE8BBFFFFFFDC
          D7D0C5BEB0E2DED7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4CEC4C5BEB0
          EEECE8FFFFFFF8C75EF4A903FAD687FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD685F4A903F7C861FFFFFFED
          EBE7C5BEB0D3CFC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAC2B7C5BEB0
          F9F8F6FFFFFFF5B425F4A903FDF0D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFD1F4A903F6B327FFFFFFF8
          F8F6C5BEB0CBC3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4BDB2C5BEB0
          FEFDFDFFFFFFF2A909F4A903FFFDF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F4A903F2A90AFFFFFFFE
          FEFEC5BEB0C6BDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4BDB2C5BEB0
          FEFDFDFFFFFFF2AB08F4A903FFFDF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F4A903F2A90AFFFFFFFD
          FDFDC5BEB0C4C0B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAC2B7C5BEB0
          F9F8F6FFFFFFF5B224F4A903FDF0D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFD2F4A903F6B526FFFFFFF8
          F7F6C5BEB0CBC5B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CDC4C5BEB0
          EEECE8FFFFFFF8C85DF4A903FAD789FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD686F4A903F7C960FFFFFFED
          EBE7C5BEB0D3CFC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DED6C5BEB0
          DEDAD2FFFFFFFCE6B6F4A903F3B01EFFFBF4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBF2F3AF1BF4A903FCE7B9FFFFFFDD
          D9D1C5BEB0E2DED7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F0C5BEB0
          C7C3B6FDFCFCFFFFFEF5BB37F4A903F8C75CFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF8C659F4A903F6BB3BFFFFFFFCFCFBC7
          C3B6C5BEB0F5F3F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CDC2
          C5BEB0E3E0DAFFFFFFFDF0D5F4AD0EF4A903F8C75CFEFBF3FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFBF2F8C659F4A903F5AB0FFDF1D6FFFFFFE2DFD8C5
          BEB0D3CDC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EEEB
          C5BEB0C5C1B1F5F4F2FFFFFFFCE8BDF4AD0EF4A903F3B21DFAD789FDF0D5FFFD
          F8FFFDF8FDF0D4FAD788F3B11CF4A903F5AB0FFCE9BFFFFFFFF5F4F1C7BEB2C5
          BEB0F1EFECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DCD7CFC5BEB0CDC7BBF9F9F7FFFFFFFDF0D5F5BB37F4A903F4A903F4A903F4A9
          03F4A903F4A903F4A903F4A903F6BC39FDF1D6FFFFFFF9F8F7CDC6B8C5BEB0DC
          D7D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFCFCD0CCC1C5BEB0CDC7BBF5F4F2FFFFFFFFFFFEFCE6B6F8C85DF5B224F2AB
          08F2A909F5B425F8C75EFCE7B8FFFFFFFFFFFFF5F4F1CDC6B8C5BEB0D2CBC1FD
          FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBFAF9D0CCC1C5BEB0C5C1B1E3E0DAFDFCFCFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE3DFD9C5BEB3C5BEB0D2CBC1FBFBFAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFCFCDCD7CFC5BEB0C5BEB0C7C3B6DEDAD2EEECE8F9F8F6FEFD
          FDFEFDFDF9F8F6EEECE8DDD9D1C7C3B6C5BEB0C5BEB0DCD8CFFDFDFCFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF0EEEBD1CDC2C5BEB0C5BEB0C5BEB0C5BEB0C5BE
          B0C5BEB0C5BEB0C5BEB0C5BEB0C5BEB0D2CCC2F1EFEBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F0E1DED6D3CDC4CAC2B7C4BD
          B2C4BDB2CAC2B7D4CEC4E1DED7F4F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 0
        OnClick = btnLocClick
      end
      object btnCadastrar: TBitBtn
        Left = 1
        Top = 1
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Cadastrar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241D7A97DFFFFFFE2F2E071C06667BC5C8DCD85F5
          FBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241E9D0B7FFFFFF7AC47067BC5C67BC5C67BC5CBC
          E2B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFFBF7F3FFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2E0B3DD
          ADB3DDADB3DDADB3DDADB3DDADB3DDADB3DDAD67BC5C67BC5C67BC5C67BC5C8D
          CD85B3DDADB3DDADB3DDADB3DDADB3DDADB3DDADBCE2B7F5FBF5C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF7EB71C06667BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C8DCD85C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3DDAD67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5CC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACC67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C71C066C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A471C0
          6667BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C7AC470E2F2E0C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71C06667BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A467BC5C67BC5C71C066E2
          F2E0FFFFFFE5C8ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACCB3DDADECF7EBFF
          FFFFF0E0CFD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
          D8C3C88A4DD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 1
        OnClick = btnCadastrarClick
      end
      object btnDesvincularTodos: TBitBtn
        Left = 1
        Top = 229
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Desv.Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241F8EFE7FFFFFF5B57F2241FEE322DEFADABF9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF1F1FE6965F3241FEE322DEFADABF9F4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41D3A171FFFFFFADABF9241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE322DEFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF4E7DBFFFFFF918FF6241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFF
          FFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEEC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4E3FD322DEF241FEE241FEE241FEE241FEE241FEEADABF9FF
          FFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEE6965F3C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE241FEE9F
          9DF84D49F1241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE24
          1FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE24
          1FEE241FEE241FEE241FEE9F9DF8FFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEE4D
          49F1322DEF241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF4D49F1241FEE241FEE241FEE241FEE241FEE4D49F1F1
          F1FED6D5FC322DEF241FEE241FEE241FEE241FEE241FEEADABF9C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFADABF9241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFF
          FFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE322DEFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF918FF6241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFDE
          B994E9D0B7FFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEEC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4E3FD322DEF241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFD3
          A171C48241E9D0B7FFFFFFD6D5FC322DEF241FEE241FEE6965F3C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE4E3FD918FF6ADABF9FFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFE4E3FD918FF6ADABF9FFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 2
        OnClick = btnDesvincularTodosClick
      end
      object btnGrupo: TBitBtn
        Left = 1
        Top = 286
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Grupo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000C40E0000C40E00000000000000000000F6F6F6F1F1F1
          ECECECE7E7E7E2E2E2DCDCDCD8D8D8D3D3D3CDCDCDC9C9C9C5C5C5C2C2C2BDBD
          BDBBBBBBB8B8B8B7B7B7B6B6B6B6B6B6B7B7B7BABABABDBDBDC0C0C0C4C4C4C8
          C8C8CDCDCDD1D1D1D6D6D6DBDBDBE0E0E0E6E6E6EBEBEBF0F0F0C6A873A16D0F
          9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A
          0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F
          6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0A9F6A0AA16D0FC3A570D1A737D0A64C
          D0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A6
          4CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0
          A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CD0A64CA16C0ED0A634F8F8F7
          F8F8F8F8F8F8F7F7F7F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F5F5F5F5F5F5F4F4
          F4F3F3F3F2F2F2F2F2F2F1F1F1F1F1F0EFEFEFEEEEEEEEEEEDEDEDEDECECECEB
          EBEBEBEBEAEAEAE9E9E9E9E8E8E8E7E7E7E6E6E6E7E7E69F6A0AD0A634FFFFFF
          C8C7C6C3C2C1C3C2C1C2C2C0C2C2C0ADACAAE7E7E6C2C1C0C2C1C0C1C1C0C1C1
          C0C1C1BFC1C0BFADACAAE6E6E5C0BFBEC0BFBEBFBEBDBFBEBDBFBEBCBEBEBCAB
          AAA9E5E5E4BDBDBBBDBCBBBDBCBBBCBCBABCBBBAFFFFFF9F6A0AD0A634FFFFFF
          E8E8E8E6E6E6E6E6E6E6E6E6E6E6E5BBBBB9F5F5F5E6E6E5E5E5E5E5E5E5E4E4
          E4E4E4E4E4E4E3BABAB8F4F4F3E2E2E2E2E2E1E2E2E1E1E1E1E0E0DFE0E0DFB9
          B8B7F2F2F2DEDEDDDEDEDDDDDDDCDCDCDCDCDCDCFFFFFF9F6A0AD0A634FFFFFF
          F4F4F4F5F5F5F5F5F5F5F5F5F5F5F5C1C1C0FBFBFBF5F5F5F5F5F5F4F4F4F4F4
          F4F4F4F4F4F4F4C1C0BFFAFAFAF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2C0
          C0BEFAFAFAF2F2F1F1F1F1F1F1F1F1F1F1F1F1F1FFFFFF9F6A0AD0A634FFFFFF
          C0BFBEBBBBBABBBBBABBBBB9BBBBB9AAAAA8E4E3E3BBBAB9BBBAB9BBBAB9BBBA
          B9BBBAB9BBBAB8AAA9A7E4E3E3BAB9B8BAB9B8BAB9B8B9B9B8B9B9B7B9B8B7A9
          A8A7E3E3E2B8B8B6B8B8B6B8B7B6B8B7B6B8B7B6FFFFFF9F6A0AD0A634FFFFFF
          FAFAFAF9F9F9F9F9F9F9F9F9F8F8F8C3C2C1FCFCFCF8F8F8F7F7F7F7F7F7F7F7
          F7F6F6F6F6F6F6C1C1C0FBFBFBF5F5F4F3F3F3F2F2F2F2F2F2F1F1F1F1F1F0BF
          BFBEF8F8F8EEEEEDEDEDEDECECECEBEBEBEBEBEAFFFFFF9F6A0AD0A634FFFFFF
          FAFAFAFAFAFAF9F9F9F9F9F9F9F9F9C3C2C1FCFCFCF8F8F8F8F8F8F7F7F7F7F7
          F7F7F7F7F6F6F6C2C1C0FBFBFBF5F5F5F4F4F4F4F4F4F3F3F2F2F2F2F1F1F1C0
          BFBEF9F9F9EEEEEEEEEEEDEDEDEDECECECEBEBEBFFFFFF9F6A0AD0A634FFFFFF
          FAFAFAFAFAFAFAFAFAF9F9F9F9F9F9C3C2C1FCFCFCF8F8F8F8F8F8F8F8F8F7F7
          F7F7F7F7F7F7F7C2C2C0FBFBFBF5F5F5F5F5F5F5F5F4F4F4F4F2F2F2F2F2F2C0
          BFBEF9F9F9F0F0F0EEEEEEEEEEEDEDEDEDECECECFFFFFF9F6A0AD0A634FFFFFF
          C4C4C2C3C3C2C3C3C2C3C3C2C3C2C1ADACABE7E7E6C3C2C1C3C2C1C3C2C1C3C2
          C1C2C2C0C2C2C0ADACAAE7E7E6C2C1C0C1C1C0C1C1C0C1C1BFC1C0BFC0C0BEAC
          ACAAE6E5E5C0BFBEBFBFBEBFBEBDBFBEBCBEBEBCFFFFFF9F6A0AD0A634FFFFFF
          E9E9E9E8E8E8E8E8E7E8E8E7E8E8E7BCBBBAF5F5F5E7E7E7E6E6E6E6E6E6E6E6
          E6E6E6E6E6E6E5BBBBB9F5F5F5E6E6E5E5E5E5E4E4E4E4E4E4E4E4E3E4E4E3BA
          B9B8F3F3F3E2E2E1E2E2E1E1E1E1DFDFDFE0E0DFFFFFFF9F6A0AD0A634FFFFFF
          F6F6F6F5F5F5F5F5F5F5F5F5F5F5F5C1C1C0FBFBFBF5F5F5F5F5F5F5F5F5F5F5
          F5F5F5F5F5F5F5C1C1C0FBFBFBF5F5F5F5F5F5F4F4F4F4F4F4F4F4F4F4F4F4C1
          C0BFFAFAFAF3F3F3F3F3F3F3F3F3F3F3F3F3F3F2FFFFFF9F6A0AD0A634FFFFFF
          BDBCBBBCBBBABCBBBABCBBBABCBBBAABAAA8E4E4E3BBBBBABBBBBABBBBBABBBB
          BABBBBB9BBBBB9AAAAA8E4E4E3BBBBBABBBBBABBBBBABBBBB9BBBAB9BBBAB9AA
          A9A8E4E3E3BAB9B8BAB9B8B9B9B8B9B9B7B9B9B8FFFFFF9F6A0AD0A634FFFFFF
          FCFCFCFBFBFBFBFBFBFBFBFBFBFBFBC3C3C2FDFDFDFAFAFAFAFAFAFBFBFBFBFB
          FBFBFBFBFAFAFAC3C3C2FDFDFDF9F9F9F9F9F9F9F9F9F9F9F9F8F8F8F7F7F7C2
          C2C0FBFBFBF6F6F6F5F5F5F4F4F4F3F3F3F3F3F2FFFFFFA16C0ED0A634FFFFFF
          FCFCFCFCFCFCFBFBFBFBFBFBFBFBFBC4C3C2FEFEFEFCFCFCFCFCFCFBFBFBFBFB
          FBFBFBFBFBFBFBC3C3C2FDFDFDFAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F8F8F8C2
          C2C0FCFCFCF6F6F6F6F6F6F5F5F5F4F4F4F3F3F3FFFFFFAC7F2BD0A634FFFFFF
          FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCC4C4C2FEFEFEFCFCFCFCFCFCFCFCFCFBFB
          FBFBFBFBFBFBFBC4C3C2FDFDFDFAFAFAFAFAFAF9F9F9F9F9F9F9F9F9F9F9F9C3
          C2C1FCFCFCF7F7F7F7F7F6F6F6F6F5F5F5F4F4F4FFFFFFB08536D0A634FFFFFF
          C5C5C4C4C4C2C4C4C2C4C4C2C4C4C2AEADABE7E7E7C4C4C2C4C4C2C4C4C2C4C4
          C2C4C3C2C4C3C2AEADABE7E7E7C3C3C2C3C3C2C3C3C2C3C2C1C3C2C1C3C2C1AD
          ACABE7E7E6C2C2C0C2C2C0C2C1C0C2C1C0C1C1C0FFFFFFB18638D2A838FFFFFF
          EAEAE9E9E9E8E8E8E8E8E8E8E8E8E8BCBCBAF6F6F6E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E7E7E7BCBBBAF5F5F5E7E7E7E7E7E6E7E7E6E7E7E6E6E6E6E6E6E6BB
          BBBAF5F5F5E6E6E5E5E5E5E5E5E5E4E4E4E5E5E5FFFFFFB2883BD9B75AFFFFFF
          F7F7F6F6F6F6F6F6F6F6F6F6F6F6F6C2C1C0FBFBFBF6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6C2C1C0FBFBFBF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5C1
          C1C0FBFBFBF5F5F5F5F5F5F5F5F5F5F5F5F5F5F5FFFFFFB48A3FDFC376FFFFFF
          BEBDBCBDBCBBBDBCBBBDBCBBBDBCBBABAAA8E5E4E4BDBCBBBDBCBBBDBCBBBDBC
          BBBDBCBBBDBCBBABAAA8E5E4E4BCBCBABCBCBABCBCBABCBCBABCBCBABCBCBAAB
          AAA8E4E4E3BCBBBABCBBBABBBBBABBBBB9BBBBBAFFFFFFB58C42E1C67CFEFEFD
          FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDC5C4C3FEFEFEFDFDFDFDFDFDFDFDFDFDFD
          FDFCFCFCFCFCFCC4C4C2FEFEFEFCFCFCFBFBFBFBFBFBFBFBFBFAFAFAFAFAFAC3
          C3C2FDFDFDF9F9F9F9F9F9F9F9F9F9F9F9F8F8F8F8F8F8B68E46E2C77FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC5C4C3FEFEFEFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFCFCFCC4C4C2FEFEFEFCFCFCFBFBFBFBFBFBFBFBFBFBFBFBFAFAFAC3
          C3C2FDFDFDF9F9F9F9F9F9F9F9F9F9F9F9F8F8F8F9F9F9B79049E3C985ECCEA1
          E7C186E8C087E8C187E8C289E8C288E5BC7CE3B570E0AF66E0AD61E0AD61DFAC
          5FDFAC5FDFAC5EDFAC5EDFAB5CDFAB5CDFAA5ADFAA5ADFAA5ADEA959DEA959DE
          A957DEA957DDA756DDA756DDA756DDA754DDA652E4B979B9934EE4CC8AF1DCB5
          EDD19AEDD19BEDD19DEED19DEDCD92EAC886E8C279E6BD70E5BB6BE5BB6AE5BB
          6AE5BA69E5BA69E5BA69E5B967E5B967E5B866E5B866E5B864E5B864E4B863E4
          B863E4B863E3B661E3B661E3B661E3B660E3B55EEAC788BB9550E5CD8EF4E2C4
          F0D7A9F1D8AAF1D8ABEFD5A3EDCD94EAC888E9C37DE7BF74E6BB6DE6BB6DE5BB
          6BE5BB6BE5BB6BE5BB6AE5BB6AE5BA69E5BA69E5BA69E5B967E5B967E5B866E5
          B866E5B866E5B864E5B864E4B863E4B863E3B661EBCB92BC9754E6D093F6E9D0
          F2DEB7F2DFB9F2DBB1EFD5A4EDCF96EBC98AE9C47EE8BF75E6BD71E6BD6EE6BD
          6EE6BD6EE6BB6DE6BB6DE5BB6BE5BB6BE5BB6BE5BB6AE5BB6AE5BA69E5BA69E5
          BA69E5B967E5B967E5B866E5B866E5B866E5B864EDD09ABC9855E7D297F8EEDB
          F5E4C4F4E2BFF2DCB3EFD6A5EED099EBCB8DE9C481E8C078E6BE72E6BD70E6BD
          70E6BD70E6BD6EE6BD6EE6BD6EE6BB6DE6BB6DE6BB6DE5BB6BE5BB6BE5BB6BE5
          BB6AE5BB6AE5BA69E5BA69E5BA69E5B967E5B967EED3A2BE9A59E8D39BFAF3E4
          F6E8CBF5E3C1F3DDB6EFD6A7EED19BEBCB8EE9C582E8C27AE7BE73E7BE73E6BE
          71E6BE71E6BE71E6BD70E6BD70E6BD70E6BD70E6BD6EE6BD6EE6BD6EE6BB6DE6
          BB6DE6BB6DE5BB6BE5BB6BE5BB6AE5BB6AE5BA69EFD8ABBF9B5CE7D39CFBF5EA
          FAF3E6F9F0E0F8EDDAF6EAD3F6E8CDF4E4C7F3E2C1F2DFBCF1DDB8F1DDB8F1DD
          B7F1DDB7F1DDB7F1DDB7F1DCB7F1DCB7F1DCB7F1DCB6F1DCB6F1DCB6F1DCB6F1
          DCB5F1DCB5F1DCB5F1DCB5F1DCB5F1DCB5F0DBB4F0DBB4C1A062EFE1BBE8D49E
          E8D39BE8D298E7D195E5CF92E4CE8FE4CB8BE4CB88E3C985E2C984E2C984E2C9
          84E2C882E2C882E2C882E2C881E2C881E2C881E2C881E2C77FE2C77FE2C77FE2
          C77FE2C67EE2C67EE2C67EE1C67DE1C67DE1C67DE1C67FEEDFB6}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 3
        OnClick = btnGrupoClick
      end
      object btnDesvincular: TBitBtn
        Left = 1
        Top = 172
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Desvincular'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241F8EFE7FFFFFF5B57F2241FEE322DEFADABF9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF1F1FE6965F3241FEE322DEFADABF9F4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41D3A171FFFFFFADABF9241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE322DEFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF4E7DBFFFFFF918FF6241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFF
          FFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEEC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4E3FD322DEF241FEE241FEE241FEE241FEE241FEEADABF9FF
          FFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEE6965F3C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE241FEE9F
          9DF84D49F1241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D5FC322DEF241FEE241FEE24
          1FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE24
          1FEE241FEE241FEE241FEE9F9DF8FFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE24
          1FEE241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF1F1FE4D49F1241FEE241FEE241FEE241FEE241FEE4D
          49F1322DEF241FEE241FEE241FEE241FEE241FEEADABF9FFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF4D49F1241FEE241FEE241FEE241FEE241FEE4D49F1F1
          F1FED6D5FC322DEF241FEE241FEE241FEE241FEE241FEEADABF9C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFADABF9241FEE241FEE241FEE241FEE241FEE4D49F1F1F1FEFF
          FFFFFFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEE322DEFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF918FF6241FEE241FEE241FEE241FEE4D49F1F1F1FEFFFFFFDE
          B994E9D0B7FFFFFFD6D5FC322DEF241FEE241FEE241FEE241FEEC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE4E3FD322DEF241FEE241FEE4D49F1F1F1FEFFFFFFFFFFFFD3
          A171C48241E9D0B7FFFFFFD6D5FC322DEF241FEE241FEE6965F3C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE4E3FD918FF6ADABF9FFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFE4E3FD918FF6ADABF9FFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 4
        OnClick = btnDesvincularClick
      end
      object btnCadAuto: TBitBtn
        Left = 1
        Top = 58
        Width = 68
        Height = 57
        Align = alTop
        Caption = 'Cad.Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241D7A97DFFFFFFE2F2E071C06667BC5C8DCD85F5
          FBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241E9D0B7FFFFFF7AC47067BC5C67BC5C67BC5CBC
          E2B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFFBF7F3FFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2E0B3DD
          ADB3DDADB3DDADB3DDADB3DDADB3DDADB3DDAD67BC5C67BC5C67BC5C67BC5C8D
          CD85B3DDADB3DDADB3DDADB3DDADB3DDADB3DDADBCE2B7F5FBF5C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF7EB71C06667BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C8DCD85C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3DDAD67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5CC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACC67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C71C066C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A471C0
          6667BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C7AC470E2F2E0C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71C06667BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A467BC5C67BC5C71C066E2
          F2E0FFFFFFE5C8ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACCB3DDADECF7EBFF
          FFFFF0E0CFD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
          D8C3C88A4DD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 5
        OnClick = btnCadAutoClick
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 934
      Height = 407
      Align = alClient
      DataSource = dsDetail
      DynProps = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleParams.Font.Charset = ANSI_CHARSET
      TitleParams.Font.Color = clWindowText
      TitleParams.Font.Height = -12
      TitleParams.Font.Name = 'Tahoma'
      TitleParams.Font.Style = []
      TitleParams.ParentFont = False
      OnDblClick = DBGridEh1DblClick
      OnKeyPress = DBGridEh1KeyPress
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ID_PRODUTO_LOC'
          Footers = <>
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 43
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DESCRICAO_LOCAL'
          Footers = <>
          Title.Caption = 'Descri'#231#227'o'
          Width = 299
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CFOP_E'
          Footers = <>
          Title.Caption = 'CFOP'
          Width = 50
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EMBALAGEM'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd.Emb.'
          Width = 71
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'QUANT_S'
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd.Unid.'
          Width = 75
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'QTD_TOTAL'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtd.Total'
          Width = 79
        end
        item
          AutoDropDown = True
          CellButtons = <>
          DropDownBox.ColumnDefValues.AutoDropDown = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'UND_S'
          Footers = <>
          Title.Caption = 'Und'
          Width = 36
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRECO_S'
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = 'Prc.Unit'#225'rio'
          Width = 89
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'PR_ANTERIOR'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Pr.Custo Ant'
          Width = 94
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRECO_CUSTO'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Custo Atual'
          Width = 75
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'PR_MARGEM'
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = 'Margem'
          Width = 51
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'PR_SUGESTAO'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Pr.Sugerido'
          Width = 85
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'PR_VENDA_ANTERIOR'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Pr.Vd.Ant'
          Width = 85
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PR_VENDA'
          Footers = <>
          Title.Alignment = taRightJustify
          Title.Caption = 'Pr.Venda'
          Width = 86
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 264
    Top = 160
  end
  object dsMaster: TDataSource
    DataSet = qryXmlMaster
    Left = 104
    Top = 168
  end
  object dsDetail: TDataSource
    DataSet = qryXMLDetail
    Left = 112
    Top = 216
  end
  object dsProduto: TDataSource
    DataSet = qryXMLProduto
    Left = 112
    Top = 280
  end
  object qryFornecedor: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from pessoa'
      'where'
      'cnpj=:cnpj')
    Left = 192
    Top = 152
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object qryFornecedorEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object qryFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryFornecedorIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object qryFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryFornecedorRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 100
    end
    object qryFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryFornecedorNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryFornecedorCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
      Required = True
    end
    object qryFornecedorMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryFornecedorUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryFornecedorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryFornecedorFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryFornecedorFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryFornecedorCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryFornecedorCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Origin = 'CELULAR2'
      Size = 14
    end
    object qryFornecedorEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      Size = 60
    end
    object qryFornecedorEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Origin = 'EMAIL2'
      Size = 60
    end
    object qryFornecedorFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryFornecedorSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 10
    end
    object qryFornecedorDT_NASC: TDateField
      FieldName = 'DT_NASC'
      Origin = 'DT_NASC'
    end
    object qryFornecedorECIVIL: TStringField
      FieldName = 'ECIVIL'
      Origin = 'ECIVIL'
      Size = 10
    end
    object qryFornecedorDIA_PGTO: TSmallintField
      FieldName = 'DIA_PGTO'
      Origin = 'DIA_PGTO'
    end
    object qryFornecedorOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object qryFornecedorNUM_USU: TSmallintField
      FieldName = 'NUM_USU'
      Origin = 'NUM_USU'
    end
    object qryFornecedorFATURA: TStringField
      FieldName = 'FATURA'
      Origin = 'FATURA'
      Size = 1
    end
    object qryFornecedorCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CHEQUE'
      Size = 1
    end
    object qryFornecedorCCF: TStringField
      FieldName = 'CCF'
      Origin = 'CCF'
      Size = 1
    end
    object qryFornecedorSPC: TStringField
      FieldName = 'SPC'
      Origin = 'SPC'
      Size = 1
    end
    object qryFornecedorISENTO: TStringField
      FieldName = 'ISENTO'
      Origin = 'ISENTO'
      Size = 1
    end
    object qryFornecedorFORN: TStringField
      FieldName = 'FORN'
      Origin = 'FORN'
      Required = True
      Size = 1
    end
    object qryFornecedorFUN: TStringField
      FieldName = 'FUN'
      Origin = 'FUN'
      Required = True
      Size = 1
    end
    object qryFornecedorCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
    object qryFornecedorFAB: TStringField
      FieldName = 'FAB'
      Origin = 'FAB'
      Required = True
      Size = 1
    end
    object qryFornecedorTRAN: TStringField
      FieldName = 'TRAN'
      Origin = 'TRAN'
      Required = True
      Size = 1
    end
    object qryFornecedorADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Required = True
      Size = 1
    end
    object qryFornecedorATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryFornecedorDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      Origin = 'DT_ADMISSAO'
    end
    object qryFornecedorDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      Origin = 'DT_DEMISSAO'
    end
    object qryFornecedorLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Origin = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object qryFornecedorSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
    object qryFornecedorPAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 50
    end
    object qryFornecedorMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 50
    end
    object qryFornecedorBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Size = 30
    end
    object qryFornecedorAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryFornecedorGERENTE: TStringField
      FieldName = 'GERENTE'
      Origin = 'GERENTE'
      Size = 30
    end
    object qryFornecedorFONE_GERENTE: TStringField
      FieldName = 'FONE_GERENTE'
      Origin = 'FONE_GERENTE'
      Size = 15
    end
    object qryFornecedorPROPRIEDADE: TStringField
      FieldName = 'PROPRIEDADE'
      Origin = 'PROPRIEDADE'
      Size = 50
    end
    object qryFornecedorDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryFornecedorTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
      Size = 1
    end
    object qryFornecedorATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Origin = 'ATENDENTE'
      Size = 1
    end
  end
  object dsNatureza: TDataSource
    DataSet = Dados.qryCFOP
    Left = 320
    Top = 160
  end
  object qryCadProduto: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from Produto'
      'where'
      'codbarra like :codigo or'
      'descricao like :descricao')
    Left = 184
    Top = 208
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object qryCadProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadProdutoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 30
    end
    object qryCadProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryCadProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryCadProdutoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
    end
    object qryCadProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryCadProdutoULTFORN: TIntegerField
      FieldName = 'ULTFORN'
      Origin = 'ULTFORN'
    end
    object qryCadProdutoLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryCadProdutoCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Origin = 'CSTICMS'
      Size = 5
    end
    object qryCadProdutoCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryCadProdutoCSTS: TStringField
      FieldName = 'CSTS'
      Origin = 'CSTS'
      Size = 5
    end
    object qryCadProdutoCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Origin = 'CSTIPI'
      Size = 5
    end
    object qryCadProdutoCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 5
    end
    object qryCadProdutoNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryCadProdutoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryCadProdutoATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryCadProdutoCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryCadProdutoULT_COMPRA: TIntegerField
      FieldName = 'ULT_COMPRA'
      Origin = 'ULT_COMPRA'
      Required = True
    end
    object qryCadProdutoULT_COMPRA_ANTERIOR: TIntegerField
      FieldName = 'ULT_COMPRA_ANTERIOR'
      Origin = 'ULT_COMPRA_ANTERIOR'
      Required = True
    end
    object qryCadProdutoCOD_BARRA_ATACADO: TStringField
      FieldName = 'COD_BARRA_ATACADO'
      Origin = 'COD_BARRA_ATACADO'
    end
    object qryCadProdutoEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryCadProdutoCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object qryCadProdutoGRADE: TStringField
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
    object qryCadProdutoEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryCadProdutoPAGA_COMISSAO: TStringField
      FieldName = 'PAGA_COMISSAO'
      Origin = 'PAGA_COMISSAO'
      Size = 1
    end
    object qryCadProdutoCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Origin = 'COMPOSICAO'
      Size = 1
    end
    object qryCadProdutoINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
      Origin = 'INICIO_PROMOCAO'
    end
    object qryCadProdutoFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
      Origin = 'FIM_PROMOCAO'
    end
    object qryCadProdutoESTOQUE_INICIAL: TFMTBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Origin = 'ESTOQUE_INICIAL'
      Precision = 18
      Size = 3
    end
    object qryCadProdutoAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
      Size = 50
    end
    object qryCadProdutoPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Origin = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryCadProdutoSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
    end
    object qryCadProdutoDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryCadProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryCadProdutoALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      Required = True
    end
    object qryCadProdutoALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
    end
    object qryCadProdutoALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
    end
    object qryCadProdutoPR_CUSTO: TFMTBCDField
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCadProdutoMARGEM: TCurrencyField
      FieldName = 'MARGEM'
      Origin = 'MARGEM'
      Required = True
    end
    object qryCadProdutoPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCadProdutoQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCadProdutoQTD_MIN: TFMTBCDField
      FieldName = 'QTD_MIN'
      Origin = 'QTD_MIN'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCadProdutoE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryCadProdutoCOMISSAO: TCurrencyField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
    end
    object qryCadProdutoDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryCadProdutoPR_CUSTO_ANTERIOR: TFMTBCDField
      FieldName = 'PR_CUSTO_ANTERIOR'
      Origin = 'PR_CUSTO_ANTERIOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Origin = 'PR_VENDA_ANTERIOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Origin = 'QTD_ATACADO'
      Precision = 18
      Size = 3
    end
    object qryCadProdutoALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPESO: TFMTBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPR_VENDA_PRAZO: TFMTBCDField
      FieldName = 'PR_VENDA_PRAZO'
      Origin = 'PR_VENDA_PRAZO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryCadProdutoREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Origin = 'REDUCAO_BASE'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoMVA: TFMTBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoFCP: TFMTBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPR_CUSTO2: TFMTBCDField
      FieldName = 'PR_CUSTO2'
      Origin = 'PR_CUSTO2'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoPERC_CUSTO: TFMTBCDField
      FieldName = 'PERC_CUSTO'
      Origin = 'PERC_CUSTO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoRESTAUTANTE: TStringField
      FieldName = 'RESTAUTANTE'
      Origin = 'RESTAUTANTE'
      Size = 1
    end
    object qryCadProdutoTEMPO_ESPERA: TIntegerField
      FieldName = 'TEMPO_ESPERA'
      Origin = 'TEMPO_ESPERA'
    end
    object qryCadProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object qryCadProdutoTIPO_RESTAURANTE: TStringField
      FieldName = 'TIPO_RESTAURANTE'
      Origin = 'TIPO_RESTAURANTE'
      Size = 1
    end
    object qryCadProdutoFK_MARCA: TIntegerField
      FieldName = 'FK_MARCA'
      Origin = 'FK_MARCA'
    end
    object qryCadProdutoPREFIXO_BALANCA: TStringField
      FieldName = 'PREFIXO_BALANCA'
      Origin = 'PREFIXO_BALANCA'
      Size = 8
    end
    object qryCadProdutoFK_PRINCIPIO_ATIVO: TIntegerField
      FieldName = 'FK_PRINCIPIO_ATIVO'
      Origin = 'FK_PRINCIPIO_ATIVO'
    end
    object qryCadProdutoREMEDIO: TStringField
      FieldName = 'REMEDIO'
      Origin = 'REMEDIO'
      Size = 1
    end
    object qryCadProdutoFK_TECIDO: TDateField
      FieldName = 'FK_TECIDO'
      Origin = 'FK_TECIDO'
    end
    object qryCadProdutoCFOP_EXTERNO: TIntegerField
      FieldName = 'CFOP_EXTERNO'
      Origin = 'CFOP_EXTERNO'
    end
    object qryCadProdutoETQ: TStringField
      FieldName = 'ETQ'
      Origin = 'ETQ'
      Size = 1
    end
    object qryCadProdutoCSOSN_EXTERNO: TStringField
      FieldName = 'CSOSN_EXTERNO'
      Origin = 'CSOSN_EXTERNO'
      Size = 3
    end
    object qryCadProdutoCST_EXTERNO: TStringField
      FieldName = 'CST_EXTERNO'
      Origin = 'CST_EXTERNO'
      Size = 3
    end
    object qryCadProdutoALIQ_ICMS_EXTERNO: TFMTBCDField
      FieldName = 'ALIQ_ICMS_EXTERNO'
      Origin = 'ALIQ_ICMS_EXTERNO'
      Precision = 18
      Size = 2
    end
    object qryCadProdutoORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
    end
    object qryCadProdutoDATA_PRECO: TDateField
      FieldName = 'DATA_PRECO'
      Origin = 'DATA_PRECO'
    end
    object qryCadProdutoQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
  end
  object QRYUnidade: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from unidade'
      'where'
      'codigo=:cod')
    Left = 272
    Top = 216
    ParamData = <
      item
        Name = 'COD'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
    object QRYUnidadeCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object QRYUnidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object QRYUnidadeFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Xml|*.Xml|Todos|*'
    Left = 488
    Top = 320
  end
  object qryCFOP: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from cfop'
      'WHERE'
      'ATIVO='#39'S'#39' AND'
      'TIPO='#39'E'#39
      'ORDER BY CODIGO')
    Left = 392
    Top = 176
    object qryCFOPCODIGO: TIntegerField
      DisplayWidth = 20
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object qryCFOPTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryCFOPMOV_ES: TStringField
      FieldName = 'MOV_ES'
      Origin = 'MOV_ES'
      Size = 1
    end
    object qryCFOPATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
  end
  object dsCFOP: TDataSource
    DataSet = qryCFOP
    Left = 392
    Top = 235
  end
  object qryCompra: TFDQuery
    AfterOpen = qryCompraAfterOpen
    AfterPost = qryCompraAfterPost
    OnNewRecord = qryCompraNewRecord
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from compra'
      'where'
      'id=:id')
    Left = 194
    Top = 269
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCompraEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryCompraDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
      Required = True
    end
    object qryCompraDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
      Required = True
    end
    object qryCompraFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object qryCompraMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 5
    end
    object qryCompraSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 5
    end
    object qryCompraCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 44
    end
    object qryCompraNR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object qryCompraGERA_CP: TStringField
      FieldName = 'GERA_CP'
      Origin = 'GERA_CP'
      Required = True
      Size = 1
    end
    object qryCompraGERA_ES: TStringField
      FieldName = 'GERA_ES'
      Origin = 'GERA_ES'
      Required = True
      Size = 1
    end
    object qryCompraAJUSTA_PC: TStringField
      FieldName = 'AJUSTA_PC'
      Origin = 'AJUSTA_PC'
      Required = True
      Size = 1
    end
    object qryCompraAJUSTA_PV: TStringField
      FieldName = 'AJUSTA_PV'
      Origin = 'AJUSTA_PV'
      Required = True
      Size = 1
    end
    object qryCompraEHFISCAL: TStringField
      FieldName = 'EHFISCAL'
      Origin = 'EHFISCAL'
      Required = True
      Size = 1
    end
    object qryCompraLEUXML: TStringField
      FieldName = 'LEUXML'
      Origin = 'LEUXML'
      Required = True
      Size = 1
    end
    object qryCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      Size = 1
    end
    object qryCompraXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryCompraTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryCompraSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ICM: TFMTBCDField
      FieldName = 'BASE_ICM'
      Origin = 'BASE_ICM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ICM: TFMTBCDField
      FieldName = 'TOTAL_ICM'
      Origin = 'TOTAL_ICM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_PIS: TFMTBCDField
      FieldName = 'TOTAL_PIS'
      Origin = 'TOTAL_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_COF: TFMTBCDField
      FieldName = 'BASE_COF'
      Origin = 'BASE_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_COF: TFMTBCDField
      FieldName = 'TOTAL_COF'
      Origin = 'TOTAL_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraLEU_DUPLICATA: TStringField
      FieldName = 'LEU_DUPLICATA'
      Origin = 'LEU_DUPLICATA'
      Size = 1
    end
    object qryCompraBASE_FCP: TFMTBCDField
      FieldName = 'BASE_FCP'
      Origin = 'BASE_FCP'
      Precision = 18
      Size = 4
    end
    object qryCompraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object qryItensCompra: TFDQuery
    BeforeEdit = qryItensCompraBeforeEdit
    BeforePost = qryItensCompraBeforePost
    AfterPost = qryItensCompraAfterPost
    BeforeDelete = qryItensCompraBeforeDelete
    OnNewRecord = qryItensCompraNewRecord
    MasterFields = 'ID'
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from compra_itens ic'
      'where'
      'ic.fk_compra=:id'
      'order by ic.item')
    Left = 266
    Top = 269
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensCompraFK_COMPRA: TIntegerField
      FieldName = 'FK_COMPRA'
      Origin = 'FK_COMPRA'
      Required = True
    end
    object qryItensCompraEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryItensCompraITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      Required = True
    end
    object qryItensCompraFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      Required = True
    end
    object qryItensCompraCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItensCompraCST_ICM: TStringField
      FieldName = 'CST_ICM'
      Origin = 'CST_ICM'
      Size = 5
    end
    object qryItensCompraGERA_CP: TStringField
      FieldName = 'GERA_CP'
      Origin = 'GERA_CP'
      Size = 1
    end
    object qryItensCompraGERA_ES: TStringField
      FieldName = 'GERA_ES'
      Origin = 'GERA_ES'
      Size = 1
    end
    object qryItensCompraSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItensCompraFK_PRODUTO_FORN: TStringField
      FieldName = 'FK_PRODUTO_FORN'
      Origin = 'FK_PRODUTO_FORN'
      Size = 30
    end
    object qryItensCompraCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object qryItensCompraCST_COF: TStringField
      FieldName = 'CST_COF'
      Origin = 'CST_COF'
      Size = 3
    end
    object qryItensCompraCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object qryItensCompraFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryItensCompraVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Origin = 'VL_UNITARIO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryItensCompraVL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_IPI: TFMTBCDField
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_ICMS: TFMTBCDField
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraVL_ST: TFMTBCDField
      FieldName = 'VL_ST'
      Origin = 'VL_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_PIS: TFMTBCDField
      FieldName = 'VL_PIS'
      Origin = 'VL_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_COF: TFMTBCDField
      FieldName = 'BASE_COF'
      Origin = 'BASE_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_COF: TFMTBCDField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_COF: TFMTBCDField
      FieldName = 'VL_COF'
      Origin = 'VL_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraFRETE1: TFMTBCDField
      FieldName = 'FRETE1'
      Origin = 'FRETE1'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraDESPESA: TFMTBCDField
      FieldName = 'DESPESA'
      Origin = 'DESPESA'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_ST: TFMTBCDField
      FieldName = 'ALIQ_ST'
      Origin = 'ALIQ_ST'
      Precision = 18
      Size = 2
    end
    object qryItensCompraPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensCompraPR_ANTERIOR: TFMTBCDField
      FieldName = 'PR_ANTERIOR'
      Origin = 'PR_ANTERIOR'
      Precision = 18
      Size = 4
    end
    object qryItensCompraPR_MARGEM: TFMTBCDField
      FieldName = 'PR_MARGEM'
      Origin = 'PR_MARGEM'
      Precision = 18
      Size = 4
    end
    object qryItensCompraPR_SUGESTAO: TFMTBCDField
      FieldName = 'PR_SUGESTAO'
      Origin = 'PR_SUGESTAO'
      Precision = 18
      Size = 4
    end
    object qryItensCompraPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Origin = 'PR_VENDA_ANTERIOR'
      Precision = 18
      Size = 4
    end
    object qryItensCompraEH_FISCAL: TStringField
      FieldName = 'EH_FISCAL'
      Origin = 'EH_FISCAL'
      Size = 1
    end
    object qryItensCompraQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryItensCompraVFCP: TFMTBCDField
      FieldName = 'VFCP'
      Origin = 'VFCP'
      Precision = 18
      Size = 4
    end
    object qryItensCompraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
  end
  object qryXMLProduto: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from XMLPRODUTO'
      'where'
      'ID_FORNECEDOR=:cod and'
      'ID_PRODUTO_FORN=:prod and'
      'fkempresa=:id')
    Left = 488
    Top = 176
    ParamData = <
      item
        Name = 'COD'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'PROD'
        DataType = ftString
        ParamType = ptInput
        Size = 30
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryXMLProdutoID_PRODUTO_LOCAL: TFloatField
      FieldName = 'ID_PRODUTO_LOCAL'
      Origin = 'ID_PRODUTO_LOCAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryXMLProdutoID_FORNECEDOR: TFloatField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryXMLProdutoID_PRODUTO_FORN: TStringField
      FieldName = 'ID_PRODUTO_FORN'
      Origin = 'ID_PRODUTO_FORN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object qryXMLProdutoUN_E: TStringField
      FieldName = 'UN_E'
      Origin = 'UN_E'
      Size = 3
    end
    object qryXMLProdutoUN_S: TStringField
      FieldName = 'UN_S'
      Origin = 'UN_S'
      Size = 3
    end
    object qryXMLProdutoFK_GRUPO: TIntegerField
      FieldName = 'FK_GRUPO'
      Origin = 'FK_GRUPO'
    end
    object qryXMLProdutoFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryXMLProdutoQTD_E: TFMTBCDField
      FieldName = 'QTD_E'
      Origin = 'QTD_E'
      Precision = 18
      Size = 2
    end
    object qryXMLProdutoQTD_S: TFMTBCDField
      FieldName = 'QTD_S'
      Origin = 'QTD_S'
      Precision = 18
      Size = 2
    end
    object qryXMLProdutoCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
  end
  object qryXMLDetail: TFDQuery
    BeforePost = qryXMLDetailBeforePost
    AfterPost = qryXMLDetailAfterPost
    AfterDelete = qryXMLDetailAfterDelete
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM XML_DETAIL'
      'WHERE '
      'FK_XML_MASTER=:ID and'
      'fkempresa=:emp'
      ''
      'order by codigo')
    Left = 488
    Top = 240
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMP'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryXMLDetailCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryXMLDetailFK_XML_MASTER: TIntegerField
      FieldName = 'FK_XML_MASTER'
      Origin = 'FK_XML_MASTER'
      Required = True
    end
    object qryXMLDetailFK_GRUPO: TIntegerField
      FieldName = 'FK_GRUPO'
      Origin = 'FK_GRUPO'
    end
    object qryXMLDetailID_PRODUTO_LOC: TIntegerField
      FieldName = 'ID_PRODUTO_LOC'
      Origin = 'ID_PRODUTO_LOC'
      OnChange = qryXMLDetailID_PRODUTO_LOCChange
    end
    object qryXMLDetailID_PRODUTO_FOR: TStringField
      FieldName = 'ID_PRODUTO_FOR'
      Origin = 'ID_PRODUTO_FOR'
    end
    object qryXMLDetailDESCRICAO_FORNECEDOR: TStringField
      FieldName = 'DESCRICAO_FORNECEDOR'
      Origin = 'DESCRICAO_FORNECEDOR'
      Size = 100
    end
    object qryXMLDetailDESCRICAO_LOCAL: TStringField
      FieldName = 'DESCRICAO_LOCAL'
      Origin = 'DESCRICAO_LOCAL'
      Size = 50
    end
    object qryXMLDetailQUANT_E: TFMTBCDField
      FieldName = 'QUANT_E'
      Origin = 'QUANT_E'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailUND_E: TStringField
      FieldName = 'UND_E'
      Origin = 'UND_E'
      Size = 3
    end
    object qryXMLDetailUND_S: TStringField
      FieldName = 'UND_S'
      Origin = 'UND_S'
      Size = 3
    end
    object qryXMLDetailPRECO_E: TFMTBCDField
      FieldName = 'PRECO_E'
      Origin = 'PRECO_E'
      DisplayFormat = ',0.0000'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailPRECO_S: TFMTBCDField
      FieldName = 'PRECO_S'
      Origin = 'PRECO_S'
      OnChange = qryXMLDetailPRECO_SChange
      DisplayFormat = ',0.0000'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailQUANT_S: TFMTBCDField
      FieldName = 'QUANT_S'
      Origin = 'QUANT_S'
      OnChange = qryXMLDetailQUANT_SChange
      Precision = 18
      Size = 4
    end
    object qryXMLDetailVL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryXMLDetailCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryXMLDetailCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryXMLDetailCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object qryXMLDetailBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailVL_IPI: TFMTBCDField
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object qryXMLDetailBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailVL_PIS: TFMTBCDField
      FieldName = 'VL_PIS'
      Origin = 'VL_PIS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 3
    end
    object qryXMLDetailBASE_COFINS: TFMTBCDField
      FieldName = 'BASE_COFINS'
      Origin = 'BASE_COFINS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailALIQ_COFINS: TFMTBCDField
      FieldName = 'ALIQ_COFINS'
      Origin = 'ALIQ_COFINS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailVL_COFINS: TFMTBCDField
      FieldName = 'VL_COFINS'
      Origin = 'VL_COFINS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Size = 3
    end
    object qryXMLDetailBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailVL_ICMS: TFMTBCDField
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailALIQ_ST: TFMTBCDField
      FieldName = 'ALIQ_ST'
      Origin = 'ALIQ_ST'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailVL_ST: TFMTBCDField
      FieldName = 'VL_ST'
      Origin = 'VL_ST'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailREDBC: TFMTBCDField
      FieldName = 'REDBC'
      Origin = 'REDBC'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryXMLDetailQTD_TOTAL: TFMTBCDField
      FieldName = 'QTD_TOTAL'
      Origin = 'QTD_TOTAL'
      OnChange = qryXMLDetailQTD_TOTALChange
      Precision = 18
      Size = 4
    end
    object qryXMLDetailEMBALAGEM: TFMTBCDField
      FieldName = 'EMBALAGEM'
      Origin = 'EMBALAGEM'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryXMLDetailCHECAR: TStringField
      FieldName = 'CHECAR'
      Origin = 'CHECAR'
      Size = 1
    end
    object qryXMLDetailCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 8
    end
    object qryXMLDetailCFOP_E: TStringField
      FieldName = 'CFOP_E'
      Origin = 'CFOP_E'
      Size = 4
    end
    object qryXMLDetailCST_E: TStringField
      FieldName = 'CST_E'
      Origin = 'CST_E'
      Size = 4
    end
    object qryXMLDetailPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXMLDetailPR_ANTERIOR: TFMTBCDField
      FieldName = 'PR_ANTERIOR'
      Origin = 'PR_ANTERIOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailPR_MARGEM: TFMTBCDField
      FieldName = 'PR_MARGEM'
      Origin = 'PR_MARGEM'
      OnChange = qryXMLDetailPR_MARGEMChange
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailPR_SUGESTAO: TFMTBCDField
      FieldName = 'PR_SUGESTAO'
      Origin = 'PR_SUGESTAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Origin = 'PR_VENDA_ANTERIOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailVIRTUAL_DESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_DESCRICAO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_PRODUTO_LOC'
      Size = 100
      Lookup = True
    end
    object qryXMLDetailVIRTUAL_BARRA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_BARRA'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODBARRA'
      KeyFields = 'ID_PRODUTO_LOC'
      Lookup = True
    end
    object qryXMLDetailVIRTUAL_PR_VENDA: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PR_VENDA'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'PR_VENDA'
      KeyFields = 'ID_PRODUTO_LOC'
      Precision = 19
      Lookup = True
    end
    object qryXMLDetailVIRTUAL_PR_CUSTO: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PR_CUSTO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'PR_CUSTO'
      KeyFields = 'ID_PRODUTO_LOC'
      Precision = 19
      Lookup = True
    end
    object qryXMLDetailVIRTUAL_MARGEM: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_MARGEM'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'MARGEM'
      KeyFields = 'ID_PRODUTO_LOC'
      Precision = 19
      Lookup = True
    end
    object qryXMLDetailVIRTUAL_UNIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_UNIDADE'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'ID_PRODUTO_LOC'
      Size = 3
      Lookup = True
    end
    object qryXMLDetailPRECO_C_DESCONTO: TFMTBCDField
      FieldName = 'PRECO_C_DESCONTO'
      Origin = 'PRECO_C_DESCONTO'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 3
    end
    object qryXMLDetailVFCP: TFMTBCDField
      FieldName = 'VFCP'
      Origin = 'VFCP'
      Precision = 18
      Size = 4
    end
    object qryXMLDetailPRECO_CUSTO: TFMTBCDField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
  end
  object qryXmlMaster: TFDQuery
    AfterPost = qryXmlMasterAfterPost
    AfterDelete = qryXmlMasterAfterDelete
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT * FROM XML_MASTER'
      'where'
      'empresa=:id and'
      'fk_usuario=:usu'
      '')
    Left = 392
    Top = 296
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'USU'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryXmlMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryXmlMasterID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
    end
    object qryXmlMasterDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
      EditMask = '!99/99/0000;1;_'
    end
    object qryXmlMasterDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
      EditMask = '!99/99/0000;1;_'
    end
    object qryXmlMasterDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'DATA_EMISSAO_NF'
      EditMask = '!99/99/0000;1;_'
    end
    object qryXmlMasterNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Origin = 'NOTA_FISCAL'
    end
    object qryXmlMasterMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 2
    end
    object qryXmlMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 2
    end
    object qryXmlMasterCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 44
    end
    object qryXmlMasterCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryXmlMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object qryXmlMasterVIRTUAL_CNPJ: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CNPJ'
      LookupDataSet = qryPesqForn
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CNPJ'
      KeyFields = 'ID_FORNECEDOR'
      Lookup = True
    end
    object qryXmlMasterVITUAL_UF: TStringField
      FieldKind = fkLookup
      FieldName = 'VITUAL_UF'
      LookupDataSet = qryPesqForn
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UF'
      KeyFields = 'ID_FORNECEDOR'
      Size = 2
      Lookup = True
    end
    object qryXmlMasterVIRTUAL_FORNECEDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_FORNECEDOR'
      LookupDataSet = qryPesqForn
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'ID_FORNECEDOR'
      Size = 50
      Lookup = True
    end
    object qryXmlMasterXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryXmlMasterSUB_TOTAL: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterOUTRAS_DESPESAS: TFMTBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Origin = 'OUTRAS_DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL_PIS: TFMTBCDField
      FieldName = 'TOTAL_PIS'
      Origin = 'TOTAL_PIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterBASE_COFINS: TFMTBCDField
      FieldName = 'BASE_COFINS'
      Origin = 'BASE_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL_COFINS: TFMTBCDField
      FieldName = 'TOTAL_COFINS'
      Origin = 'TOTAL_COFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL_ICMS: TFMTBCDField
      FieldName = 'TOTAL_ICMS'
      Origin = 'TOTAL_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterTOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryXmlMasterFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryXmlMasterBASE_FCP: TFMTBCDField
      FieldName = 'BASE_FCP'
      Origin = 'BASE_FCP'
      Precision = 18
      Size = 4
    end
  end
  object qryProd: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select  CODIGO, DESCRICAO, CODBARRA, REFERENCIA, PR_VENDA, PR_CU' +
        'STO, MARGEM,  CSTE, CSTIPI, ALIQ_PIS, ALIQ_COF, UNIDADE from Pro' +
        'duto PRO'
      'order by descricao')
    Left = 568
    Top = 184
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
    object qryProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryProdPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdPR_CUSTO: TFMTBCDField
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryProdCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Origin = 'CSTIPI'
      Size = 5
    end
    object qryProdALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
    end
    object qryProdALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
    end
    object qryProdMARGEM: TCurrencyField
      FieldName = 'MARGEM'
      Origin = 'MARGEM'
      Required = True
    end
  end
  object qryPesqForn: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select codigo, razao, fantasia, uf, municipio, cnpj from pessoa'
      'order by codigo'
      '')
    Left = 640
    Top = 184
    object qryPesqFornCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesqFornRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 100
    end
    object qryPesqFornFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryPesqFornUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryPesqFornMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryPesqFornCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
  end
  object qryXMLDuplicata: TFDQuery
    MasterSource = dsMaster
    MasterFields = 'CODIGO'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from XML_DUPLICATA'
      'WHERE'
      'FK_XML_MASTER=:CODIGO'
      'order by 2')
    Left = 568
    Top = 240
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryXMLDuplicataCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryXMLDuplicataFK_XML_MASTER: TIntegerField
      FieldName = 'FK_XML_MASTER'
      Origin = 'FK_XML_MASTER'
    end
    object qryXMLDuplicataDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
    object qryXMLDuplicataDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object qryXMLDuplicataVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 4
    end
  end
  object qryCP: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select Cp.* from cpagar CP'
      'where'
      'cp.fk_compra=:id'
      'order by cp.doc')
    Left = 112
    Top = 352
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCPDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCPFKFORNECE: TIntegerField
      FieldName = 'FKFORNECE'
      Origin = 'FKFORNECE'
    end
    object qryCPDOC: TStringField
      FieldName = 'DOC'
      Origin = 'DOC'
      Size = 15
    end
    object qryCPDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object qryCPHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object qryCPDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
    end
    object qryCPSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 10
    end
    object qryCPFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryCPFK_COMPRA: TIntegerField
      FieldName = 'FK_COMPRA'
      Origin = 'FK_COMPRA'
    end
    object qryCPVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryCPDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
    end
    object qryCPJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCPVLPAGO: TCurrencyField
      FieldName = 'VLPAGO'
      Origin = 'VLPAGO'
      DisplayFormat = ',0.00'
    end
    object qryCPVL_RESTANTE: TFMTBCDField
      FieldName = 'VL_RESTANTE'
      Origin = 'VL_RESTANTE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCPFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryCPTVALOR: TAggregateField
      FieldName = 'TVALOR'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
end
