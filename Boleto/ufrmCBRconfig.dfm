inherited frmCBRconfig: TfrmCBRconfig
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es da Cobran'#231'a'
  ClientHeight = 475
  ClientWidth = 670
  Position = poDesktopCenter
  ExplicitWidth = 676
  ExplicitHeight = 504
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlComandos: TPanel
    Top = 387
    Width = 664
    Height = 85
    ExplicitTop = 387
    ExplicitWidth = 664
    ExplicitHeight = 85
    inherited btnConfirmar: TSpeedButton
      Width = 100
      Height = 85
      Caption = 'F5 Gravar'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 100
      ExplicitHeight = 85
    end
    inherited btnCancelar: TSpeedButton
      Left = 100
      Width = 100
      Height = 85
      Caption = 'Esc Cancelar'
      ExplicitLeft = 50
      ExplicitTop = 0
      ExplicitWidth = 100
      ExplicitHeight = 85
    end
  end
  inherited pageDefault: TJvPageControl
    Width = 664
    Height = 378
    HideAllTabs = True
    ExplicitWidth = 664
    ExplicitHeight = 378
    inherited tabDefault: TTabSheet
      TabVisible = False
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 656
      ExplicitHeight = 368
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 123
        Align = alTop
        Caption = 'Diret'#243'rios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label25: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 20
          Width = 640
          Height = 15
          Align = alTop
          Caption = 'Remessa'
          ExplicitWidth = 46
        end
        object Label2: TLabel
          Left = 324
          Top = 18
          Width = 42
          Height = 15
          Caption = 'Retorno'
        end
        object sbtnGetCert: TSpeedButton
          Left = 295
          Top = 34
          Width = 23
          Height = 21
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
          OnClick = sbtnGetCertClick
        end
        object SpeedButton2: TSpeedButton
          Left = 614
          Top = 34
          Width = 23
          Height = 21
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
          OnClick = SpeedButton2Click
        end
        object Label5: TLabel
          Left = 5
          Top = 61
          Width = 191
          Height = 15
          Caption = 'Diret'#243'rio de backup do recebimento'
        end
        object SpeedButton3: TSpeedButton
          Left = 295
          Top = 77
          Width = 23
          Height = 21
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
          OnClick = SpeedButton3Click
        end
        object Label9: TLabel
          AlignWithMargins = True
          Left = 473
          Top = 61
          Width = 36
          Height = 15
          Caption = 'Layout'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 330
          Top = 61
          Width = 96
          Height = 15
          Caption = 'Numera'#231#227'o Inicial'
        end
        object DIRRECEBE: TJvDBMaskEdit
          Left = 5
          Top = 34
          Width = 284
          Height = 21
          DataField = 'DIRENVIA'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          EditMask = ''
        end
        object DIRENVIA: TJvDBMaskEdit
          Left = 324
          Top = 34
          Width = 284
          Height = 21
          DataField = 'DIRRECEBE'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          EditMask = ''
        end
        object DIRRECEBEBKP: TJvDBMaskEdit
          Left = 5
          Top = 77
          Width = 284
          Height = 21
          DataField = 'DIRRECEBEBKP'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          EditMask = ''
        end
        object JvDBComboBox1: TJvDBComboBox
          Left = 473
          Top = 77
          Width = 164
          Height = 23
          DataField = 'CNAB'
          DataSource = dtsDefault
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'CNAB 240'
            'CNAB 400')
          ParentFont = False
          TabOrder = 4
          Values.Strings = (
            'CNAB 240'
            'CNAB 400')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object JvDBMaskEdit1: TJvDBMaskEdit
          Left = 330
          Top = 77
          Width = 133
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'NUMERO_BOLETO'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          EditMask = ''
        end
      end
      object GroupBox6: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 132
        Width = 650
        Height = 233
        Align = alClient
        Caption = 'Cobran'#231'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 15
          Width = 23
          Height = 15
          Caption = 'Tipo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 252
          Top = 14
          Width = 33
          Height = 15
          Caption = 'Banco'
        end
        object Label6: TLabel
          Left = 301
          Top = 13
          Width = 43
          Height = 15
          Caption = 'Ag'#234'ncia'
        end
        object Label7: TLabel
          Left = 389
          Top = 13
          Width = 32
          Height = 15
          Caption = 'Conta'
        end
        object Label12: TLabel
          Left = 516
          Top = 14
          Width = 86
          Height = 15
          Caption = 'C'#243'digo Cedente'
        end
        object Convênio: TLabel
          Left = 5
          Top = 60
          Width = 51
          Height = 15
          Caption = 'Convenio'
        end
        object Label14: TLabel
          Left = 389
          Top = 60
          Width = 39
          Height = 15
          Caption = 'Esp'#233'cie'
        end
        object Label16: TLabel
          Left = 473
          Top = 59
          Width = 37
          Height = 15
          Caption = 'Moeda'
        end
        object Label17: TLabel
          Left = 558
          Top = 60
          Width = 33
          Height = 15
          Caption = 'Aceite'
        end
        object lbCarteira: TLabel
          Left = 132
          Top = 59
          Width = 41
          Height = 15
          Caption = 'Carteira'
        end
        object lbModalidade: TLabel
          Left = 252
          Top = 59
          Width = 63
          Height = 15
          Caption = 'Modalidade'
        end
        object Label4: TLabel
          Left = 5
          Top = 102
          Width = 108
          Height = 15
          Caption = 'Local de Pagamento'
        end
        object Label8: TLabel
          Left = 5
          Top = 141
          Width = 372
          Height = 15
          Caption = 
            'Instru'#231#227'o 1 (Texto de responsabilidade do benefici'#225'rio.)  286 Ca' +
            'racteres'
        end
        object TIPOCOBRANCA: TJvDBComboBox
          Left = 5
          Top = 31
          Width = 241
          Height = 23
          DataField = 'TIPOCOBRANCA'
          DataSource = dtsDefault
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object CODBANCO: TJvDBMaskEdit
          Left = 252
          Top = 34
          Width = 43
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CODBANCO'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          EditMask = ''
        end
        object AGENCIA: TJvDBMaskEdit
          Left = 301
          Top = 34
          Width = 55
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'AGENCIA'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          EditMask = ''
        end
        object CONTA: TJvDBMaskEdit
          Left = 389
          Top = 34
          Width = 94
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CONTA'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          EditMask = ''
        end
        object AGENCIADIG: TJvDBMaskEdit
          Left = 359
          Top = 34
          Width = 24
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'AGENCIAD'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          EditMask = ''
        end
        object CONTADIG: TJvDBMaskEdit
          Left = 489
          Top = 34
          Width = 21
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CONTADIG'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          EditMask = ''
        end
        object CODCEDENTE: TJvDBMaskEdit
          Left = 516
          Top = 34
          Width = 121
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CODCEDENTE'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          EditMask = ''
        end
        object CONVENIO: TJvDBMaskEdit
          Left = 5
          Top = 75
          Width = 117
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CONVENIO'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          EditMask = ''
        end
        object ESPECIEDOC: TJvDBMaskEdit
          Left = 389
          Top = 75
          Width = 78
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'ESPECIEDOC'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          EditMask = ''
        end
        object COBMOEDA: TJvDBMaskEdit
          Left = 473
          Top = 75
          Width = 79
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'COBMOEDA'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          EditMask = ''
        end
        object COBACEITE: TJvDBMaskEdit
          Left = 558
          Top = 75
          Width = 79
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'COBACEITE'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          EditMask = ''
        end
        object CARTEIRA: TJvDBMaskEdit
          Left = 128
          Top = 75
          Width = 118
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'CARTEIRA'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          EditMask = ''
        end
        object MODALIDADE: TJvDBMaskEdit
          Left = 252
          Top = 75
          Width = 131
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'MODALIDADE'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          EditMask = ''
        end
        object LOCALPAGTO: TJvDBMaskEdit
          Left = 7
          Top = 118
          Width = 630
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'LOCALPAGTO'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          EditMask = ''
        end
        object INSTRUCAO1: TJvDBMaskEdit
          Left = 5
          Top = 157
          Width = 632
          Height = 21
          BevelInner = bvLowered
          BevelOuter = bvRaised
          DataField = 'INSTRUCAO1'
          DataSource = dtsDefault
          Flat = True
          ParentFlat = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          EditMask = ''
        end
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 445
    Top = 24
  end
  inherited dtsDefault: TDataSource
    DataSet = qryDefault
    Left = 254
    Top = 19
  end
  object ACBrNFe1: TACBrNFe
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
    Left = 542
    Top = 34
  end
  object OpenDialog: TOpenDialog
    Filter = 'Arquivos de imagem|*.jpg;*.jpeg;*.bmp'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Procurar logomarca'
    Left = 364
    Top = 24
  end
  object qryDefault: TFDQuery
    BeforeOpen = qryDefaultBeforeOpen
    OnNewRecord = qryDefaultNewRecord
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  CBR_CONFIG'
      'WHERE'
      '  1=1'
      '  AND CBR_CONFIG.ID_EMPRESA = :ID_EMPRESA'
      ''
      '')
    Left = 174
    Top = 18
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDefaultID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultDIRRECEBE: TStringField
      FieldName = 'DIRRECEBE'
      Origin = 'DIRRECEBE'
      Size = 300
    end
    object qryDefaultDIRENVIA: TStringField
      FieldName = 'DIRENVIA'
      Origin = 'DIRENVIA'
      Size = 300
    end
    object qryDefaultDIRRECEBEBKP: TStringField
      FieldName = 'DIRRECEBEBKP'
      Origin = 'DIRRECEBEBKP'
      Size = 300
    end
    object qryDefaultVLRTARIFABOLETA: TFMTBCDField
      FieldName = 'VLRTARIFABOLETA'
      Origin = 'VLRTARIFABOLETA'
      Precision = 18
      Size = 2
    end
    object qryDefaultTIPOCOBRANCA: TStringField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA'
      Size = 30
    end
    object qryDefaultCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
      Origin = 'CODBANCO'
    end
    object qryDefaultAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryDefaultAGENCIADIG: TStringField
      FieldName = 'AGENCIADIG'
      Origin = 'AGENCIADIG'
      FixedChar = True
      Size = 1
    end
    object qryDefaultCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object qryDefaultCONTADIG: TStringField
      FieldName = 'CONTADIG'
      Origin = 'CONTADIG'
      FixedChar = True
      Size = 1
    end
    object qryDefaultCODCEDENTE: TStringField
      FieldName = 'CODCEDENTE'
      Origin = 'CODCEDENTE'
    end
    object qryDefaultCODCEDENTEDIG: TStringField
      FieldName = 'CODCEDENTEDIG'
      Origin = 'CODCEDENTEDIG'
      FixedChar = True
      Size = 1
    end
    object qryDefaultCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Origin = 'CONVENIO'
      Size = 15
    end
    object qryDefaultCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 15
    end
    object qryDefaultMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Origin = 'MODALIDADE'
      Size = 15
    end
    object qryDefaultESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Origin = 'ESPECIEDOC'
      FixedChar = True
      Size = 3
    end
    object qryDefaultCOBMOEDA: TStringField
      FieldName = 'COBMOEDA'
      Origin = 'COBMOEDA'
      Size = 10
    end
    object qryDefaultCOBACEITE: TStringField
      FieldName = 'COBACEITE'
      Origin = 'COBACEITE'
      Size = 10
    end
    object qryDefaultLOCALPAGTO: TStringField
      FieldName = 'LOCALPAGTO'
      Origin = 'LOCALPAGTO'
      Size = 100
    end
    object qryDefaultINSTRUCAO1: TStringField
      FieldName = 'INSTRUCAO1'
      Origin = 'INSTRUCAO1'
      Size = 300
    end
    object qryDefaultINSTRUCAO2: TStringField
      FieldName = 'INSTRUCAO2'
      Origin = 'INSTRUCAO2'
      Size = 300
    end
    object qryDefaultCNAB: TStringField
      FieldName = 'CNAB'
      Origin = 'CNAB'
      Size = 10
    end
    object qryDefaultNUMERO_BOLETO: TIntegerField
      FieldName = 'NUMERO_BOLETO'
      Origin = 'NUMERO_BOLETO'
    end
    object qryDefaultAGENCIAD: TStringField
      FieldName = 'AGENCIAD'
      Origin = 'AGENCIAD'
      Size = 10
    end
  end
end
