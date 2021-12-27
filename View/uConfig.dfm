object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 608
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 722
    Height = 490
    Align = alClient
    TabOrder = 0
    object lblColaborador: TLabel
      Left = 18
      Top = 511
      Width = 261
      Height = 13
      Cursor = crHandPoint
      Caption = 'Veja a lista de Colaboradores do Projeto ACBr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPatrocinador: TLabel
      Left = 16
      Top = 535
      Width = 265
      Height = 13
      Cursor = crHandPoint
      Caption = 'Veja a lista de Patrocinadores do Projeto ACBr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDoar1: TLabel
      Left = 21
      Top = 559
      Width = 255
      Height = 13
      Cursor = crHandPoint
      Caption = 'Para se tornar Patrocinador do Projeto ACBr,'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDoar2: TLabel
      Left = 117
      Top = 575
      Width = 63
      Height = 13
      Cursor = crHandPoint
      Caption = 'clique aqui'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 720
      Height = 488
      ActivePage = Balança
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = 'WebService'
        ImageIndex = 2
        object Label6: TLabel
          Left = 3
          Top = 148
          Width = 129
          Height = 15
          Caption = 'Selecione UF de Destino:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object rgTipoAmb: TDBRadioGroup
          Left = 3
          Top = 11
          Width = 246
          Height = 69
          Caption = 'Ambiente'
          DataField = 'AMBIENTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'Produ'#231#227'o'
            'Homologa'#231#227'o')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
        end
        object DBComboBoxEh4: TDBComboBoxEh
          Left = 3
          Top = 167
          Width = 246
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'UF'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          KeyItems.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object gbxRetornoEnvio: TGroupBox
          Left = 283
          Top = 3
          Width = 313
          Height = 177
          Caption = 'Retorno de Envio de NFe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label36: TLabel
            Left = 115
            Top = 43
            Width = 52
            Height = 15
            Caption = 'Tentativas'
          end
          object Label37: TLabel
            Left = 20
            Top = 83
            Width = 46
            Height = 15
            Caption = 'Intervalo'
          end
          object Label38: TLabel
            Left = 21
            Top = 43
            Width = 49
            Height = 15
            Hint = 
              'Aguardar quantos segundos para primeira consulta de retorno de e' +
              'nvio'
            Caption = 'Aguardar'
          end
          object DBEdit1: TDBEdit
            Left = 20
            Top = 59
            Width = 74
            Height = 23
            DataField = 'AGUARDAR'
            DataSource = dsConfig
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 115
            Top = 59
            Width = 74
            Height = 23
            DataField = 'TENTATIVAS'
            DataSource = dsConfig
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 20
            Top = 99
            Width = 74
            Height = 23
            DataField = 'INTERVALO'
            DataSource = dsConfig
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object TIPO_APLICATIVO: TDBRadioGroup
          Left = 3
          Top = 86
          Width = 246
          Height = 56
          Caption = 'Tipo de Aplicativo'
          Columns = 2
          DataField = 'TIPO_APLICATIVO'
          DataSource = dsConfig
          Items.Strings = (
            'NFC-e'
            'SAT')
          TabOrder = 3
          Values.Strings = (
            'N'
            'S')
        end
        object GroupBox4: TGroupBox
          Left = 3
          Top = 210
          Width = 593
          Height = 126
          Caption = 'Proxy'
          TabOrder = 4
          object Label131: TLabel
            Left = 15
            Top = 24
            Width = 22
            Height = 13
            Caption = 'Host'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label132: TLabel
            Left = 510
            Top = 24
            Width = 26
            Height = 13
            Caption = 'Porta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label133: TLabel
            Left = 15
            Top = 67
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label134: TLabel
            Left = 183
            Top = 67
            Width = 30
            Height = 13
            Caption = 'Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object WS_PROXY_HOST: TDBEdit
            Left = 15
            Top = 40
            Width = 489
            Height = 21
            DataField = 'PROXY_HOST'
            DataSource = dsConfig
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object WS_PROXY_PORTA: TDBEdit
            Left = 510
            Top = 40
            Width = 68
            Height = 21
            DataField = 'PROXY_PORTA'
            DataSource = dsConfig
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object WS_PROXY_USUARIO: TDBEdit
            Left = 15
            Top = 83
            Width = 162
            Height = 21
            DataField = 'PROXY_USUARIO'
            DataSource = dsConfig
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object WS_PROXY_SENHA: TDBEdit
            Left = 183
            Top = 83
            Width = 162
            Height = 21
            DataField = 'PROXY_SENHA'
            DataSource = dsConfig
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 3
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Certificado'
        ImageIndex = 3
        object Label43: TLabel
          Left = 10
          Top = 10
          Width = 85
          Height = 15
          Caption = 'Tipo de Emiss'#227'o'
        end
        object Label2: TLabel
          Left = 12
          Top = 56
          Width = 32
          Height = 15
          Caption = 'Senha'
        end
        object Label25: TLabel
          Left = 10
          Top = 94
          Width = 88
          Height = 15
          Caption = 'N'#250'mero de S'#233'rie'
        end
        object Label33: TLabel
          Left = 10
          Top = 140
          Width = 78
          Height = 15
          Caption = 'IdToken/IdCSC'
        end
        object Label34: TLabel
          Left = 8
          Top = 184
          Width = 58
          Height = 15
          Caption = 'Token/CSC'
        end
        object Label10: TLabel
          Left = 266
          Top = 98
          Width = 63
          Height = 15
          Caption = 'XMLSignLib'
        end
        object sbtnGetCert: TSpeedButton
          Left = 237
          Top = 113
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
        object Label9: TLabel
          Left = 266
          Top = 55
          Width = 40
          Height = 15
          Caption = 'HttpLib'
        end
        object Label8: TLabel
          Left = 266
          Top = 14
          Width = 45
          Height = 15
          Caption = 'CryptLib'
        end
        object Label82: TLabel
          Left = 266
          Top = 140
          Width = 45
          Height = 15
          Caption = 'SSL Type'
        end
        object Label90: TLabel
          Left = 8
          Top = 224
          Width = 127
          Height = 15
          Caption = 'Caminho do Certificado'
        end
        object sbtnCaminhoCert: TSpeedButton
          Left = 491
          Top = 238
          Width = 23
          Height = 24
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
          OnClick = sbtnCaminhoCertClick
        end
        object cbSSLLib: TDBComboBoxEh
          Left = 12
          Top = 29
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'TIPO_EMISSAO'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'libNone'
            'libOpenSSL'
            'libCapicom'
            'libCapicomDelphiSoap'
            'libWinCrypt'
            'libCustom')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          MRUList.Active = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnChange = cbSSLLibChange
          OnExit = cbSSLLibExit
        end
        object edtSenha: TDBEdit
          Left = 10
          Top = 70
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'SENHACERTIFICADO'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edtNumSerie: TDBEdit
          Left = 10
          Top = 113
          Width = 221
          Height = 21
          Ctl3D = False
          DataField = 'NUMEROSERIECERTFICADO'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edtIdToken: TDBEdit
          Left = 10
          Top = 155
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'IDTOKEN'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object edtToken: TDBEdit
          Left = 10
          Top = 199
          Width = 221
          Height = 21
          Ctl3D = False
          DataField = 'TOKEN'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object Button1: TButton
          Left = 149
          Top = 306
          Width = 215
          Height = 32
          Caption = 'Verificar Data de Validade'
          TabOrder = 10
          OnClick = Button1Click
        end
        object cbXmlSignLib: TDBComboBoxEh
          Left = 266
          Top = 113
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'XMLSIGN'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'xsNone'
            'xsXmlSec'
            'xsMsXml'
            'xsMsXmlCapicom'
            'xsLibXml2')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          Visible = True
        end
        object cbHttpLib: TDBComboBoxEh
          Left = 266
          Top = 70
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'HTTPLIB'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'httpNone'
            'httpWinINet'
            'httpWinHttp'
            'httpOpenSSL'
            'httpIndy')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          MRUList.Active = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object cbCryptLib: TDBComboBoxEh
          Left = 266
          Top = 28
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'CRYPTLIB'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'cryNone'
            'cryOpenSSL'
            'cryCapicom'
            'cryWinCrypt')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          MRUList.Active = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object DBComboBoxEh22: TDBComboBoxEh
          Left = 266
          Top = 155
          Width = 222
          Height = 21
          Ctl3D = False
          DataField = 'SSL_TIPO'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'LT_all'
            'LT_SSLv2'
            'LT_SSLv3'
            'LT_TLSv1'
            'LT_TLSv1_1'
            'LT_TLSv1_2'
            'LT_SSHv2')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
          Visible = True
        end
        object DBEdit11: TDBEdit
          Left = 10
          Top = 241
          Width = 475
          Height = 21
          Ctl3D = False
          DataField = 'CAMINHO_CERTIFICADO'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'NF-e'
        ImageIndex = 4
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 712
          Height = 458
          ActivePage = TabSheet7
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          TabOrder = 0
          object TabSheet7: TTabSheet
            Caption = 'Geral'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object Label16: TLabel
              Left = 14
              Top = 63
              Width = 34
              Height = 15
              Caption = 'Vers'#227'o'
            end
            object Label17: TLabel
              Left = 14
              Top = 150
              Width = 220
              Height = 15
              Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
            end
            object SpeedButton1: TSpeedButton
              Left = 497
              Top = 122
              Width = 23
              Height = 24
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
              OnClick = SpeedButton1Click
            end
            object SpeedButton2: TSpeedButton
              Left = 497
              Top = 166
              Width = 23
              Height = 24
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
            object Label11: TLabel
              Left = 14
              Top = 105
              Width = 188
              Height = 15
              Caption = 'Salvar Arquivos de Envio e Resposta'
            end
            object Label29: TLabel
              Left = 275
              Top = 63
              Width = 96
              Height = 15
              Caption = 'Forma de Emiss'#227'o'
            end
            object edtPahArquivoNFe: TDBEdit
              Left = 14
              Top = 123
              Width = 477
              Height = 21
              Ctl3D = False
              DataField = 'PATHSALVARNFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
            end
            object edtPathSchema_NFe: TDBEdit
              Left = 14
              Top = 170
              Width = 477
              Height = 21
              Ctl3D = False
              DataField = 'PATHSCHEMAS_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
            end
            object DBComboBoxEh6: TDBComboBoxEh
              Left = 14
              Top = 78
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'VERSAONFE'
              DataSource = dsConfig
              DynProps = <>
              DragCursor = crDefault
              EditButtons = <>
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              Items.Strings = (
                've200'
                've300'
                've310'
                've400')
              KeyItems.Strings = (
                '0'
                '1'
                '2'
                '3')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              Visible = True
            end
            object DBComboBoxEh1: TDBComboBoxEh
              Left = 275
              Top = 78
              Width = 216
              Height = 21
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'FORMAEMISSAO'
              DataSource = dsConfig
              DynProps = <>
              DragCursor = crDefault
              EditButtons = <>
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              Items.Strings = (
                'Normal'
                'Conting'#234'ncia'
                'SCAN'
                'DPEC'
                'FSDA'
                'SVCAN'
                'SVCRS'
                'SVCSP'
                'OffLine')
              KeyItems.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 1
              Visible = True
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'Arquivos'
            ImageIndex = 4
            object SpeedButton4: TSpeedButton
              Left = 489
              Top = 173
              Width = 23
              Height = 24
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
              OnClick = SpeedButton4Click
            end
            object Label45: TLabel
              Left = 5
              Top = 53
              Width = 77
              Height = 15
              Caption = 'Pasta Enviadas'
            end
            object Label48: TLabel
              Left = 4
              Top = 87
              Width = 158
              Height = 15
              Caption = 'Pasta Arquivos Cancelamento'
            end
            object Label49: TLabel
              Left = 3
              Top = 121
              Width = 214
              Height = 15
              Caption = 'Pasta Arquivos CC-e - Carta de Corre'#231#227'o'
            end
            object Label50: TLabel
              Left = 3
              Top = 159
              Width = 141
              Height = 15
              Caption = 'Pasta Arquivos Inutiliza'#231#227'o'
            end
            object Label51: TLabel
              Left = 3
              Top = 196
              Width = 110
              Height = 15
              Caption = 'Pasta Arquivos DPEC'
            end
            object Label52: TLabel
              Left = 3
              Top = 275
              Width = 52
              Height = 15
              Caption = 'Pasta PDF'
            end
            object Label53: TLabel
              Left = 3
              Top = 235
              Width = 117
              Height = 15
              Caption = 'Pasta Arquivos Evento'
            end
            object SpeedButton5: TSpeedButton
              Left = 489
              Top = 286
              Width = 23
              Height = 24
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
              OnClick = SpeedButton5Click
            end
            object SpeedButton6: TSpeedButton
              Left = 489
              Top = 246
              Width = 23
              Height = 24
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
              OnClick = SpeedButton6Click
            end
            object SpeedButton7: TSpeedButton
              Left = 489
              Top = 210
              Width = 23
              Height = 24
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
              OnClick = SpeedButton7Click
            end
            object SpeedButton8: TSpeedButton
              Left = 489
              Top = 134
              Width = 23
              Height = 24
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
              OnClick = SpeedButton8Click
            end
            object SpeedButton9: TSpeedButton
              Left = 489
              Top = 100
              Width = 23
              Height = 24
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
              OnClick = SpeedButton9Click
            end
            object SpeedButton10: TSpeedButton
              Left = 489
              Top = 65
              Width = 23
              Height = 24
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
              OnClick = SpeedButton10Click
            end
            object edtPathEnviada_NFe: TDBEdit
              Left = 3
              Top = 67
              Width = 484
              Height = 23
              DataField = 'PATHENVIADA_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtCancelamento_nfe: TDBEdit
              Left = 3
              Top = 101
              Width = 484
              Height = 23
              DataField = 'PATHCAN_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object EdtPathCCe_NFe: TDBEdit
              Left = 3
              Top = 135
              Width = 484
              Height = 23
              DataField = 'PATHCCE_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtPathInutilizacao_NFe: TDBEdit
              Left = 3
              Top = 174
              Width = 484
              Height = 23
              DataField = 'PATHINUTI_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edtPathDec_NFe: TDBEdit
              Left = 3
              Top = 211
              Width = 484
              Height = 23
              DataField = 'PATHDPEC_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object edtPathEvento_NFe: TDBEdit
              Left = 3
              Top = 249
              Width = 484
              Height = 23
              DataField = 'PATHEVENTO_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object edtPathPDF_NFe: TDBEdit
              Left = 3
              Top = 289
              Width = 484
              Height = 23
              DataField = 'PATHPDF_NFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'NFC-e'
        object PageControl4: TPageControl
          Left = 0
          Top = 0
          Width = 712
          Height = 458
          ActivePage = TabSheet4
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          MultiLine = True
          ParentFont = False
          TabOrder = 0
          object TabSheet4: TTabSheet
            Caption = 'Geral'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object Label31: TLabel
              Left = 3
              Top = 65
              Width = 98
              Height = 14
              Caption = 'Formato Alerta'
            end
            object Label32: TLabel
              Left = 3
              Top = 196
              Width = 84
              Height = 14
              Caption = 'Vers'#227'o NFC-e'
            end
            object Label42: TLabel
              Left = 3
              Top = 150
              Width = 273
              Height = 14
              Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
            end
            object sbtnPathSalvar: TSpeedButton
              Left = 486
              Top = 122
              Width = 23
              Height = 24
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
              OnClick = sbtnPathSalvarClick
            end
            object spPathSchemas: TSpeedButton
              Left = 486
              Top = 166
              Width = 23
              Height = 24
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
              OnClick = spPathSchemasClick
            end
            object Label19: TLabel
              Left = 3
              Top = 236
              Width = 98
              Height = 14
              Caption = 'Cliente Padr'#227'o'
            end
            object Label7: TLabel
              Left = 3
              Top = 275
              Width = 70
              Height = 14
              Caption = 'Logo Marca'
            end
            object sbtnLogoMarca: TSpeedButton
              Left = 482
              Top = 291
              Width = 23
              Height = 24
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
              OnClick = sbtnLogoMarcaClick
            end
            object Label21: TLabel
              Left = 135
              Top = 236
              Width = 105
              Height = 14
              Caption = 'Vendedor Padr'#227'o'
            end
            object Label30: TLabel
              Left = 261
              Top = 236
              Width = 140
              Height = 14
              Caption = 'Transportador Padr'#227'o'
            end
            object Label64: TLabel
              Left = 134
              Top = 196
              Width = 91
              Height = 14
              Caption = 'Vers'#227'o QrCode'
            end
            object edtFormatoAlerta: TDBEdit
              Left = 3
              Top = 79
              Width = 502
              Height = 21
              Ctl3D = False
              DataField = 'FORMATOALERTA'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
            end
            object edtPathLogs: TDBEdit
              Left = 3
              Top = 123
              Width = 477
              Height = 21
              Ctl3D = False
              DataField = 'PATHSALVAR'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 5
            end
            object edtPathSchemas: TDBEdit
              Left = 3
              Top = 169
              Width = 477
              Height = 21
              Ctl3D = False
              DataField = 'PATHSCHEMAS'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
            end
            object cbxAtualizarXML: TDBCheckBox
              Left = 3
              Top = 3
              Width = 294
              Height = 17
              Caption = 'Atualizar XML'
              DataField = 'ATUALIZARXML'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbxExibirErroSchema: TDBCheckBox
              Left = 3
              Top = 20
              Width = 142
              Height = 17
              Caption = 'Exibir Erro Schema'
              DataField = 'VISUALIZAERROSCHEMA'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbxRetirarAcentos: TDBCheckBox
              Left = 3
              Top = 39
              Width = 381
              Height = 17
              Caption = 'Retirar Acentos dos XMLs enviados'
              DataField = 'RETIRARACENTOS'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 3
              Top = 105
              Width = 381
              Height = 17
              Caption = 'Salvar Arquivos de Envio e Resposta'
              DataField = 'SALVARARQUIVO'
              DataSource = dsConfig
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit13: TDBEdit
              Left = 3
              Top = 250
              Width = 126
              Height = 21
              Ctl3D = False
              DataField = 'CLIENTE_PADRAO'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 8
            end
            object DBComboBoxEh2: TDBComboBoxEh
              Left = 3
              Top = 211
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'VERSAODF'
              DataSource = dsConfig
              DynProps = <>
              DragCursor = crDefault
              EditButtons = <>
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              Items.Strings = (
                've200'
                've300'
                've310'
                've400')
              KeyItems.Strings = (
                '0'
                '1'
                '2'
                '3')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              Visible = True
            end
            object edtLogoMarca: TDBEdit
              Left = 3
              Top = 293
              Width = 473
              Height = 19
              Ctl3D = False
              DataField = 'LOGOMARCA'
              DataSource = dsConfig
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 10
            end
            object DBEdit5: TDBEdit
              Left = 135
              Top = 250
              Width = 120
              Height = 21
              Ctl3D = False
              DataField = 'VENDEDOR_PADRAO'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 9
            end
            object DBEdit7: TDBEdit
              Left = 261
              Top = 250
              Width = 140
              Height = 21
              Ctl3D = False
              DataField = 'TRANSPORTADOR_PADRAO'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 11
            end
            object DBComboBoxEh10: TDBComboBoxEh
              Left = 135
              Top = 211
              Width = 118
              Height = 21
              CharCase = ecUpperCase
              Ctl3D = False
              DataField = 'VERSAOQRCODE'
              DataSource = dsConfig
              DynProps = <>
              DragCursor = crDefault
              EditButtons = <>
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              Items.Strings = (
                'veqr000'
                'veqr100'
                'veqr200')
              KeyItems.Strings = (
                '0'
                '1'
                '2'
                '')
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 12
              Visible = True
            end
          end
          object TabSheet13: TTabSheet
            Caption = 'Arquivos'
            ImageIndex = 4
            object sbPathInu: TSpeedButton
              Left = 493
              Top = 167
              Width = 23
              Height = 24
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
              OnClick = sbPathInuClick
            end
            object Label35: TLabel
              Left = 3
              Top = 25
              Width = 126
              Height = 15
              Caption = 'Pasta Arquivos NFe'
            end
            object Label39: TLabel
              Left = 3
              Top = 66
              Width = 189
              Height = 15
              Caption = 'Pasta Arquivos Cancelamento'
            end
            object Label46: TLabel
              Left = 3
              Top = 108
              Width = 273
              Height = 15
              Caption = 'Pasta Arquivos CC-e - Carta de Corre'#231#227'o'
            end
            object Label40: TLabel
              Left = 3
              Top = 150
              Width = 189
              Height = 15
              Caption = 'Pasta Arquivos Inutiliza'#231#227'o'
            end
            object Label41: TLabel
              Left = 3
              Top = 191
              Width = 133
              Height = 15
              Caption = 'Pasta Arquivos DPEC'
            end
            object Label12: TLabel
              Left = 3
              Top = 275
              Width = 63
              Height = 15
              Caption = 'Pasta PDF'
            end
            object Label47: TLabel
              Left = 3
              Top = 233
              Width = 147
              Height = 15
              Caption = 'Pasta Arquivos Evento'
            end
            object sbPathPDF: TSpeedButton
              Left = 493
              Top = 289
              Width = 23
              Height = 24
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
              OnClick = sbPathPDFClick
            end
            object sbPathEvento: TSpeedButton
              Left = 493
              Top = 248
              Width = 23
              Height = 24
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
              OnClick = sbPathEventoClick
            end
            object sbPathDPEC: TSpeedButton
              Left = 493
              Top = 207
              Width = 23
              Height = 24
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
              OnClick = sbPathDPECClick
            end
            object sbPathCCe: TSpeedButton
              Left = 493
              Top = 126
              Width = 23
              Height = 24
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
              OnClick = sbPathCCeClick
            end
            object sbPathCan: TSpeedButton
              Left = 493
              Top = 85
              Width = 23
              Height = 24
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
              OnClick = sbPathCanClick
            end
            object sbPathNFe: TSpeedButton
              Left = 493
              Top = 45
              Width = 23
              Height = 24
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
              OnClick = sbPathNFeClick
            end
            object edtPathNFe: TDBEdit
              Left = 3
              Top = 46
              Width = 484
              Height = 23
              DataField = 'PATHNFE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtPathCan: TDBEdit
              Left = 3
              Top = 86
              Width = 484
              Height = 23
              DataField = 'PATHCAN'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtPathCCe: TDBEdit
              Left = 3
              Top = 127
              Width = 484
              Height = 23
              DataField = 'PATHCCE'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtPathInu: TDBEdit
              Left = 3
              Top = 167
              Width = 484
              Height = 23
              DataField = 'PATHINUTI'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object edtPathDPEC: TDBEdit
              Left = 3
              Top = 208
              Width = 484
              Height = 23
              DataField = 'PATHDPEC'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object edtPathEvento: TDBEdit
              Left = 3
              Top = 248
              Width = 484
              Height = 23
              DataField = 'PATHEVENTO'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edtPathPDF: TDBEdit
              Left = 3
              Top = 289
              Width = 484
              Height = 23
              DataField = 'PATHPDF'
              DataSource = dsConfig
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
        end
      end
      object TabCTe: TTabSheet
        Caption = 'CT-e'
        ImageIndex = 5
        object Label44: TLabel
          Left = 13
          Top = 16
          Width = 25
          Height = 15
          Caption = 'S'#233'rie'
          FocusControl = DBEdit8
        end
        object Label54: TLabel
          Left = 13
          Top = 61
          Width = 100
          Height = 15
          Caption = 'Pasta Arquivos CTe'
        end
        object btnCteEnviada: TSpeedButton
          Left = 499
          Top = 73
          Width = 23
          Height = 24
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
          OnClick = btnCteEnviadaClick
        end
        object Label56: TLabel
          Left = 13
          Top = 100
          Width = 214
          Height = 15
          Caption = 'Pasta Arquivos CC-e - Carta de Corre'#231#227'o'
        end
        object btnCteCCe: TSpeedButton
          Left = 503
          Top = 114
          Width = 23
          Height = 24
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
          OnClick = btnCteCCeClick
        end
        object Label57: TLabel
          Left = 13
          Top = 140
          Width = 141
          Height = 15
          Caption = 'Pasta Arquivos Inutiliza'#231#227'o'
        end
        object btnCteInutiliza: TSpeedButton
          Left = 499
          Top = 154
          Width = 23
          Height = 24
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
          OnClick = btnCteInutilizaClick
        end
        object Label58: TLabel
          Left = 13
          Top = 183
          Width = 117
          Height = 15
          Caption = 'Pasta Arquivos Evento'
        end
        object btnCteEvento: TSpeedButton
          Left = 499
          Top = 194
          Width = 23
          Height = 24
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
          OnClick = btnCteEventoClick
        end
        object Label59: TLabel
          Left = 13
          Top = 228
          Width = 52
          Height = 15
          Caption = 'Pasta PDF'
        end
        object btnCtePDF: TSpeedButton
          Left = 499
          Top = 239
          Width = 23
          Height = 24
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
          OnClick = btnCtePDFClick
        end
        object Label55: TLabel
          Left = 13
          Top = 265
          Width = 220
          Height = 15
          Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
        end
        object btnCteShema: TSpeedButton
          Left = 499
          Top = 283
          Width = 23
          Height = 24
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
          OnClick = btnCteShemaClick
        end
        object Label60: TLabel
          Left = 75
          Top = 18
          Width = 34
          Height = 15
          Caption = 'Vers'#227'o'
        end
        object Label61: TLabel
          Left = 167
          Top = 18
          Width = 41
          Height = 15
          Caption = 'Modelo'
        end
        object Label62: TLabel
          Left = 247
          Top = 18
          Width = 93
          Height = 15
          Caption = 'Processo Emiss'#227'o'
        end
        object Label65: TLabel
          Left = 13
          Top = 314
          Width = 56
          Height = 15
          Caption = 'Tipo Dacte'
        end
        object Label63: TLabel
          Left = 392
          Top = 18
          Width = 93
          Height = 15
          Caption = 'Tipo Contribuinte'
        end
        object DBEdit8: TDBEdit
          Left = 13
          Top = 33
          Width = 56
          Height = 21
          Ctl3D = False
          DataField = 'CTE_SERIE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object edtPathCteEnviada: TDBEdit
          Left = 13
          Top = 75
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'PATH_ENVIADAS_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edtPathCTeCC: TDBEdit
          Left = 13
          Top = 114
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'PATH_CCE_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object EdtPatCTeInutiliza: TDBEdit
          Left = 13
          Top = 155
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'PATH_INU_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object EdtPathCTeEvento: TDBEdit
          Left = 13
          Top = 197
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'PATH_EVENTO_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object edtPathCTePDF: TDBEdit
          Left = 13
          Top = 242
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'PATH_PDF_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object edtPathCteSchema: TDBEdit
          Left = 13
          Top = 285
          Width = 482
          Height = 21
          Ctl3D = False
          DataField = 'PATH_SCHEMA_CTE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object DBComboBoxEh5: TDBComboBoxEh
          Left = 75
          Top = 34
          Width = 86
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VERSAO_CTE'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            've200'
            've300')
          KeyItems.Strings = (
            '0'
            '1'
            '')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = True
        end
        object DBComboBoxEh7: TDBComboBoxEh
          Left = 167
          Top = 34
          Width = 74
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'MODELO_CTE'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'CTE'
            'CTE OS')
          KeyItems.Strings = (
            '0'
            '1')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object DBComboBoxEh8: TDBComboBoxEh
          Left = 247
          Top = 33
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'PROCESSO_EMISSAO_CTE'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'AplicativoContribuinte'
            'AvulsaFisco'
            'AvulsaContribuinte'
            'ContribuinteAplicativoFisco')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = True
        end
        object DBComboBoxEh11: TDBComboBoxEh
          Left = 13
          Top = 329
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'TIPO_DACTE'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'Fast'
            'Fortes')
          KeyItems.Strings = (
            '0'
            '1')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
          Visible = True
        end
        object DBComboBoxEh9: TDBComboBoxEh
          Left = 392
          Top = 33
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'TIPO_CONTRIBUINTE_CTE'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            'Contribuinte'
            'Isento'
            'NaoContribuinte')
          KeyItems.Strings = (
            '0'
            '1'
            '2')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
          Visible = True
        end
      end
      object TabSheet10: TTabSheet
        Caption = 'MDF-e'
        ImageIndex = 8
        object Label76: TLabel
          Left = 19
          Top = 67
          Width = 112
          Height = 15
          Caption = 'Pasta Arquivos MDFe'
        end
        object btnPathMdfe: TSpeedButton
          Left = 507
          Top = 81
          Width = 23
          Height = 24
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
          OnClick = btnPathMdfeClick
        end
        object Label77: TLabel
          Left = 19
          Top = 104
          Width = 117
          Height = 15
          Caption = 'Pasta Arquivos Evento'
        end
        object btnPathMdfeEvento: TSpeedButton
          Left = 507
          Top = 120
          Width = 23
          Height = 24
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
          OnClick = btnPathMdfeEventoClick
        end
        object Label78: TLabel
          Left = 19
          Top = 143
          Width = 112
          Height = 15
          Caption = 'Pasta Arquivos Salvar'
        end
        object edtPathEventoSalvar: TSpeedButton
          Left = 507
          Top = 159
          Width = 23
          Height = 24
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
          OnClick = edtPathEventoSalvarClick
        end
        object edtPathSchemaMDFe: TSpeedButton
          Left = 507
          Top = 238
          Width = 23
          Height = 24
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
          OnClick = edtPathSchemaMDFeClick
        end
        object Label79: TLabel
          Left = 19
          Top = 224
          Width = 220
          Height = 15
          Caption = 'Diret'#243'rios com os arquivos XSD(Schemas)'
        end
        object Label81: TLabel
          Left = 19
          Top = 26
          Width = 34
          Height = 15
          Caption = 'Vers'#227'o'
        end
        object Label80: TLabel
          Left = 19
          Top = 185
          Width = 102
          Height = 15
          Caption = 'Pasta Arquivos PDF'
        end
        object btnPathMdfePDF: TSpeedButton
          Left = 507
          Top = 198
          Width = 23
          Height = 24
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
          OnClick = btnPathMdfePDFClick
        end
        object Label139: TLabel
          Left = 111
          Top = 26
          Width = 25
          Height = 15
          Caption = 'S'#233'rie'
        end
        object edtPathMdfe: TDBEdit
          Left = 19
          Top = 83
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_PATH_MDFE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edtPathEventoMDFe: TDBEdit
          Left = 19
          Top = 120
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_PATH_EVENTO'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object edtPathSalvarMDFe: TDBEdit
          Left = 19
          Top = 159
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_PATH_SALVAR'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object edPathSchemaMdfe: TDBEdit
          Left = 19
          Top = 240
          Width = 482
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_PATH_SCHEMA'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object DBComboBoxEh21: TDBComboBoxEh
          Left = 19
          Top = 42
          Width = 86
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'MDFE_VERSAO'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            've100'
            've300')
          KeyItems.Strings = (
            '0'
            '1'
            '')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object edtPathPDFMDFe: TDBEdit
          Left = 19
          Top = 201
          Width = 484
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_PATH_SALVAR'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit39: TDBEdit
          Left = 111
          Top = 42
          Width = 90
          Height = 21
          Ctl3D = False
          DataField = 'MDFE_SERIE'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object TabSheet9: TTabSheet
        Caption = 'Sped'
        ImageIndex = 7
        object lblPerfil: TLabel
          Left = 32
          Top = 25
          Width = 30
          Height = 15
          Caption = 'Perfil:'
        end
        object Label70: TLabel
          Left = 116
          Top = 25
          Width = 93
          Height = 15
          Caption = 'Regime Tribut'#225'rio'
        end
        object Label71: TLabel
          Left = 277
          Top = 25
          Width = 50
          Height = 15
          Caption = 'Atividade'
        end
        object Label72: TLabel
          Left = 32
          Top = 63
          Width = 106
          Height = 15
          BiDiMode = bdLeftToRight
          Caption = 'Incid'#234'ncia Tribut'#225'ria'
          ParentBiDiMode = False
        end
        object Label73: TLabel
          Left = 277
          Top = 63
          Width = 126
          Height = 15
          BiDiMode = bdLeftToRight
          Caption = 'M'#233'todo de Apropria'#231#227'o'
          ParentBiDiMode = False
        end
        object Label74: TLabel
          Left = 277
          Top = 105
          Width = 105
          Height = 15
          BiDiMode = bdLeftToRight
          Caption = 'Regime Cumulativo'
          ParentBiDiMode = False
        end
        object Label75: TLabel
          Left = 32
          Top = 105
          Width = 111
          Height = 15
          BiDiMode = bdLeftToRight
          Caption = 'Tipo de Contribui'#231#227'o'
          ParentBiDiMode = False
        end
        object DBComboBoxEh14: TDBComboBoxEh
          Left = 31
          Top = 39
          Width = 79
          Height = 23
          DataField = 'IND_PERFIL'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'A'
            'B'
            'C')
          KeyItems.Strings = (
            'A'
            'B'
            'C')
          TabOrder = 0
          Visible = True
        end
        object DBCheckBox6: TDBCheckBox
          Left = 31
          Top = 161
          Width = 277
          Height = 17
          Caption = 'Ocorreu averba'#231#227'o de exporta'#231#227'o no per'#237'odo'
          DataField = 'IND_EXP'
          DataSource = dsSped
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 31
          Top = 181
          Width = 488
          Height = 16
          Caption = 
            'Existem informa'#231#245'es acerca de cr'#233'ditos de ICMS a serem controlad' +
            'os'
          DataField = 'IND_CCRF'
          DataSource = dsSped
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox7: TDBCheckBox
          Left = 31
          Top = 221
          Width = 488
          Height = 16
          Caption = 'Usinas de a'#231#250'car e/'#225'lcool '
          DataField = 'IND_USINA'
          DataSource = dsSped
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 31
          Top = 201
          Width = 472
          Height = 17
          Caption = 
            #201' comercio varejista de combust'#237'veis com movimenta'#231#227'o e/ou estoq' +
            'ue no per'#237'odo'
          DataField = 'IND_COMB'
          DataSource = dsSped
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox10: TDBCheckBox
          Left = 31
          Top = 281
          Width = 472
          Height = 17
          Caption = 'Realizou vendas com Cart'#227'o de Cr'#233'dito ou de d'#233'bito'
          DataField = 'IND_CART'
          DataSource = dsSped
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 31
          Top = 261
          Width = 488
          Height = 16
          Caption = 'A empresa '#233' distribuidora de energia '
          DataField = 'IND_EE'
          DataSource = dsSped
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 31
          Top = 241
          Width = 277
          Height = 17
          Caption = 'Existem informa'#231#245'es de Valor Agregado'
          DataField = 'IND_VA'
          DataSource = dsSped
          TabOrder = 9
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox9: TDBCheckBox
          Left = 31
          Top = 301
          Width = 488
          Height = 16
          Caption = 'Foram emitidos documentos fiscais em papel'
          DataField = 'IND_FORM'
          DataSource = dsSped
          TabOrder = 10
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox13: TDBCheckBox
          Left = 31
          Top = 322
          Width = 488
          Height = 16
          Caption = 'A empresa prestou servi'#231'os de transporte a'#233'reo'
          DataField = 'IND_AER'
          DataSource = dsSped
          TabOrder = 11
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBComboBoxEh17: TDBComboBoxEh
          Left = 32
          Top = 76
          Width = 239
          Height = 23
          DataField = 'COD_INC_TRIB'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'REGIME N'#195'O CUMULATIVO'
            'REGIME CUMULATIVO'
            'REGIME CUMULATIVO E N'#195'O CUMULATIVO')
          KeyItems.Strings = (
            '1'
            '2'
            '3')
          TabOrder = 12
          Visible = True
        end
        object DBComboBoxEh18: TDBComboBoxEh
          Left = 277
          Top = 76
          Width = 250
          Height = 23
          DataField = 'IND_APRO_CRED'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            ''
            'APROPRIA'#199#195'O DIRETA'
            'RECEITA BRUTA')
          KeyItems.Strings = (
            '0'
            '1'
            '2')
          TabOrder = 13
          Visible = True
        end
        object DBComboBoxEh19: TDBComboBoxEh
          Left = 277
          Top = 118
          Width = 250
          Height = 23
          DataField = 'IND_REG_CUM'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'CAIXA'
            'COMPET'#202'NCIA'
            'COMPET'#202'NCIA DETALHADA')
          KeyItems.Strings = (
            '1'
            '2'
            '9')
          TabOrder = 15
          Visible = True
        end
        object DBComboBoxEh20: TDBComboBoxEh
          Left = 32
          Top = 118
          Width = 239
          Height = 23
          DataField = 'COD_TIPO_CONT'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'AL'#205'QUOTA B'#193'SICA'
            'AL'#205'QUOTA ESPEC'#205'FICA')
          KeyItems.Strings = (
            '1'
            '2')
          TabOrder = 14
          Visible = True
        end
        object DBComboBoxEh16: TDBComboBoxEh
          Left = 277
          Top = 39
          Width = 155
          Height = 23
          DataField = 'IND_ATIV'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'OUTROS'
            'INDUSTRIAL'
            'COM'#201'RCIO'
            'SERVI'#199'OS')
          KeyItems.Strings = (
            'O'
            'I'
            'C'
            'P')
          TabOrder = 2
          Visible = True
        end
        object DBComboBoxEh15: TDBComboBoxEh
          Left = 116
          Top = 39
          Width = 155
          Height = 23
          DataField = 'COD_REGIME_TRIBUTARIO'
          DataSource = dsSped
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            'LUCRO REAL'
            'LUCRO PRESUMIDO')
          KeyItems.Strings = (
            'R'
            'P')
          TabOrder = 1
          Visible = True
          OnExit = DBComboBoxEh15Exit
        end
      end
      object Balança: TTabSheet
        Caption = 'Balan'#231'a'
        ImageIndex = 6
        object Image1: TImage
          Left = 3
          Top = 7
          Width = 510
          Height = 360
          AutoSize = True
          Picture.Data = {
            0954474946496D616765474946383761FE0168017700002C00000000FE016801
            87FFFFFFF7F7F7EFEFEFE7E7E7D7D7D7DFDFDFC7C7C7CFCFCF8F8F8F979797BF
            BFBFB7B7B7AFAFAF8787877F7F7F9F9F9FA7A7A77777776F6F6F575757272727
            3F3F3F2F2F2F1F1F1F6767673737375F5F5F4747471717170F0F0F0000004F4F
            4FFDFDFDFCFCFCFBFBFBFAFAFAF9F9F9F8F8F8FAC7A5FAA66EFB9551FA9451FA
            9450F6C3A1F4E3D8F4F4F4F5F5F5F6F6F6FAB78AFB9652FF6600F98334F6A269
            F0DFD4F2F2F2FAC7A6FD761CF49F67ECECECF0F0F0FAE9DEFC8637FA7319ECB9
            98EBEBEBF3F3F3FBC8A6FF771CFFAA71FFCCAAFFBB8DFF8838F38D49E5E5E5FB
            B88BFFEEE2F08A47E0E0E0E8E8E8FF9955EE8845DBDBDBEEEEEEE09D70D9D9D9
            E2E2E2C9B8ADED7628C3C3C3DADADAC4A38CC8C8C8DCDCDCE9E9E9FFDDC6DF79
            36B8B8B8FC9652ADADADBEBEBEE6E6E6FD761BAF8E77C9C9C9E1E1E1EDEDEDFA
            D8C2CE7A41A8A8A8C1C1C1FBA76FF16A109E9E9EB9B9B9CECECEE4E4E4F1F1F1
            989898B0B0B0DEDEDE969696C4C4C4929292A2A2A2D3D3D3FA95518D8D8D9D9D
            9DB2B2B28C8C8CB1B1B1F7C4A2D56F2CAC7A588E8E8EB3B3B3D0D0D0E3E3E3F7
            914DB4B4B4D2D2D2F3AF82E26C1D888888A4A4A4D4D4D4EFDFD3BA76498B8B8B
            959595ABABABBDBDBDF39F66EF680EEAD9CEF97218898989939393E9B694D56F
            2BACACACEAEAEAEE89459281768A8A8AA0A0A0F17A2B9090909A9A9AAAAAAAE9
            833FF0690EA5A5A5CBCBCBCCCCCCD79467938277949494A3A3A3BBAA9FE07A37
            9F7E68B99881E77122F0690FBB774A999999A1A1A1B98664DA7431D6702DBB78
            4B958479A6A6A6BBBBBBBCBCBC9C9C9C9B9B9BC0C0C0B5B5B5C6C6C6DDDDDDD8
            D8D86969697E7E7E818181141414A9A9A9D1D1D1B6B6B6D5D5D56E89AF6E89AF
            6F89AE6F89AE6E88AD6E83A86E82A76E82A76C81A96980AC687FAC6A7FAA697F
            A4677EA1657E9F647D9E5E759552678A415889294C881B2E871525851C258136
            28734D215E6F1B448817319E1223B00D158E070A7503034302022902020B0101
            0000000000000000000000000000000000000000000000000000000000000000
            0008FF0001081C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2C58B1833
            6ADCC8B1A3C78F20438A1C49B2A4C9932853AA5CC9526280002D63CA9C49B3A6
            CD9B3873367CC913A6CE9F40830A1D4AB4E848014805F034CAB4A9D3A750A3A6
            1C407500D29752B36ADDCAB5EB5302040A14A0AAD427C3B062D3AA5DCBB6ADDB
            B770E3CA9D1B778057A803E8EADDCBB7AF5FB104EE0A3560E0C081B056B1261C
            802081820590234B9E4CB9B2E5CB98336BDE9C99410303828B1240E080B3E9D3
            A853AB86AC204183D03A19B036805869C2050FCCC2B618E04181DD400B20B00B
            BCA20007C56B3E7800818102DA056C1F2CD04040F28B022210BF5EF333778A0A
            107CFF6F89A0F103E707A2EB2698E0C1F88A0624BC974960C27C890816DC47D9
            A00102E60BA4275D410230B0DF44C81DA852020F5985D440D609949484134A48
            9083103E08E1403E0510A187036A68D687BA0DD85001FA2948527FFF4110A07A
            070D00C143095050810515001081051428A0A3054002704105155C7000000650
            1098400C0069010600340064063E02A0C106000C80C16B355A80DC034052F05B
            0012880780051100E08081355290A2031450E0DE4309AA78529D0C45C001051D
            B847010717047601071C4450C005717AE0A3051A102401A117203968076902B0
            0007BF25B0415E1670304100080CCAC16B0054900100016C090003F23DCA0172
            037CFFC04106BF3944408A7686C4228002AE27908C0F057000070A085023010C
            78408004FA79900099138CD94007A4AA19ED001A2C5001041E0E7481070C24FB
            41011E14C6C102113008419A0274D023001E283B417B1E1C008107A02220C002
            1E408467AE23FDAB500006640B40A10140D001BC0008908101C765609D001E38
            70A440183CEB5F93A8FAF48007587AD081021614ABC1041FBC7640A40B48A068
            A9FD2650810416147080A21568905D06BE22642FC0BAFAC72B8C06011BEC05BF
            49001A00A47D80A607BF35002592161830B59A53279001CA11182AD0AB1440B0
            010211CCB980031154CC01831948D0807C1E68208106F7C2E49307119E4B27D0
            2509FFAC9000121CD9AF403C7B20A5B200682A90030F20609F40CC365C6E070E
            486060E21BF4EBAC030ED87D780413D89780010930983906108C3A319295EAB8
            74430C5CCC3747BBBAD86B8C333E2400D256CE39EF04185440814052135F68B9
            8BCBC7F4C9A55509400707742041020E20303502123850C18ED67940F3F01E68
            DB01031718E832BFB542BFF7EC22F9BD58E00C0B7441001E7C6CA6E2F09E2C31
            E4FA1540EC050AC85DE224B0810C40A07A1A80C90168160106A88F0218700007
            02F0300EDC287288428006025380092CA9210A901DFB3252BB17996820467388
            003810180454A03F141880040840B1C038A05100A080DC72B6380A706E0305A8
            C004FFCAB3A4726160032DDB5D7F32C08008CC0803CCB18004D246AEE338EB66
            FF5156F01A00277F8D3024EE43889640B3A3067CE0030C4B927E5C68A5421130
            451A48199592E59ACB394E01F8621606B297013372E9020DA8000682B72302DC
            EB0310A0400410F081034420030ED8C0D51A12A02F6AA484B72B9A001DA22F81
            4000031B4C5C601830A3C708A452029893D506A99F4F0EB24A9D431601185430
            833D403F0280C0038873CB341D00038149C020CDD4000D3440840C09A3252DA2
            4C831428421A7480752A353A0010C03D08A8D27304224C5515609006439281D2
            C4AD004400030662C0D21EE080A5D96B97A92AA50430A09F003020823DBB0D32
            9739FF114C12AD2029BC8859F2892A8AF84A3708054933F929918502AC920CAD
            883F4FF8AB4DF2D3A111750846ED04D18C4A64A23D0BE8453D9A918DAAA8A324
            7D084871E75193A6F4202E3D104A5FCA90956AD22901480B41175200B36C6721
            31A5E940822A93BC8C652239AD9562183253A126C4A600B5A8410E50A40B7CE0
            A70DC192401470398C68E0015C6D40AD20420007702B710C6A085185DA4C035C
            E0AD148890430AC0009F2CE0751639C0079ED301B93E048AE2198003C6BA90A6
            3AF52050BD90540BC280DC084003AD73C8C23C422BE225C039E289CF40982310
            325D2C7C0C7A80F2048000039809A6876DE8422080C3C60AE46201504087087B
            0004FFF844008121005E25A2003402203C037022005C069A0238A00156F91883
            16B880D748A04A18A0D6070D62D8D41224B1285C2C4170C34D2821C003A75AC0
            B7C242010F3CEE6B03716D053C40816751A4020BB0590518E0C3594E80011F08
            40B65E48BF5F066661FD51DE000CF8AD84AC95A6CDFC24AA0E60810054C001F8
            B2C0040245AE09C4F0B5EE05005815E601E14E440115C84B0321D02A887DB55F
            05F80006D204B50012608F9733C0C23E90D68354D7BAC4139AEDFEA9D8C24AE0
            01C25C0002A814C106809594F6E9ED4038309005C826470F886C443680A30CA4
            295264BAA59186E7A108E8275BB811C0F61A302304906A70A8C5B14617D2A4F2
            E4A8FF011350C00424908104C4F7B93A4AD10132EC220DD8A5015D8D88013C70
            23F788165E09B0DE04E6842DD0184097101800B1F2A3A3DF38A0C6D4DDA79A73
            DC22138654BB4DCEA60160D236CE1900BF5D6BA240D0CC64813839023EFA1945
            32F05326038E01D411529614006B006040013C1B4003727A81010873D506DEB4
            5A579B40E20C5968D8535A0440E31F0C0FA43912C854A0212267823C004A500B
            006EEC632C32334D9760794D920A008127CEC9C69ADE34762BCAE64D4A2997C6
            750ED4B2BD81F376002DCCA19839D344D887288920F8B294D31AA501091B005B
            14980055AD591D001460DA9ABAC064D3AC6C8534F3013874B503406C80063C12
            0104FFE0000334B03402948D3910088F91477600AC5232470351807B0CA0BDBA
            62C002EDE6B9051A304B002C9049D579C0062AF0EE4C77BC20F3CE12A805822C
            C6BACDE868D30FAB4EABA6AE2DD240CB9200041C3911BF660985D1F1649504D0
            D382BA7DC14B43B3410EFCD266DAAC20F6FA0DBB73634D088C7500E1920D6E7F
            CB80CB12C0E60D313B84C60A0133E534A1BF6A80E9305D901BE338EA2235C901
            9AFE91E09E952105B040BC143FD4A77B7C254E16495939AF90E8D6559FA61F08
            E6A71E12011C60A73AA17B4A75CF1DCB5B77F62D8D3D42787F1DDFA716F81925
            7EF2438355C2229EA9F15633F2172243AD0EB59103B9D5AA3D90DF044CF724D6
            B714FFF7ADD300903D3FD9C29F7B43DC3A3214C6ABC6A5FD6D073C80810064F8
            241108390080371C007C40039D0411C67758D3A710FD426243056E30712869C2
            5DA7147D21D170086729EED12FA4837B05A17C11B5500A20012F1129C8B62CA3
            F43213F42B9D8312034001BE4581A8323A71171103E854058810C284005D4531
            05504D01D01F06B247C5A22605101E8F5528D214120F202513685C472758E7C7
            71E9577A0B210143D43A2F7640B55226FA418448A12FF4A400830235BA522639
            C72005D05EAF31001BE710312854337810107001A17339F4933D8DB20018706A
            4CB325F9554C183000066001895301184811028025C3331014404AF2A172AC42
            7AE8FFF78450E87181B272027128061065FE77000AE023D9E63802800107571A
            3954701B812E7AC521E581000D765C089086940481BFA7639EC6520B61835992
            0013D36A0B43681B4001C222101B505BA69238A00162833811132044E032104E
            C42AAB724B12E088C3078904B150F4241093B58302D138F497011BE41309F04B
            13F025BF817220E13809502F5427640B3400AD7100E7A586B0787CB2984951D5
            104CE68C02312E56622925271F9DF3580240749756000B83001B708C12410001
            D457C4C12C4CF73CBD552D6B468D8BC31007402509C02E3AC200D8230006D032
            E261012EF70103592A25972D1D408A1A21007E38014AA11F15702C03B00109D0
            6A02FF388F04588F3C965D94E42C629126036001B49673EE11001B60243A4243
            44773357A29014F11AA49425D74895DBB66C16A9260DE148FA7181BED67483A7
            23A4021AC6022A68F37D1E011A0360361DF28330A89332C893142575F8411108
            88362601191BA1810CE55220099503213709E08AB5779515B18634D58622016C
            B2F5147C395227A1735081982FA5985FF498CB8499A141992965994E4157DB81
            2CEB216E0BD021EA549116A9992931648F53001A005F05E14215001A646265F2
            987E9E894268315DD3951E80B11D47558968991137F37EBF152F60D859EB0532
            46F72D1D8695A9C953FFB11CD5A461973510D3096417535BD91780B41337DC67
            25E6FFD57E12E2015F08000A135D5286109C4952B9297FC859318F859C5C9639
            C889736983931EC0751B7189FE9723B0B642A72563ABF64BFD0226D21889D4D8
            4C03B09CF1E281F1D901A0119FCFE9601E00885182381D914AF082250BE0232F
            2321BEC82FFBD728DEF88AB829979FE610C8839EDE9325CC098C93B436D4B26A
            982600CE8311E5372714949C8EB292034194D0B9A02C5A2B1380661920888423
            40E9587E30F15DD3853A1A515E8CE6011C80552B8366F792A3B0277CEF3910E1
            838D68860168C6434CE201B18273CEB25D62A211AD68260D4A01BB0561A7A501
            619A4C59A9950C3100EA4841CAA3267DD5301650634FB99F4CA3A1A8A2017009
            7A71FFD230C165A80491012C241032762A28EAA52A4A8B0C71A70576A64B62A6
            FB07885EF81B6BAA9B807910A79936F614188CC21EA53A5CCB38A490E8507C7A
            24145463E567170230A8BFF2A21D9023504A10A77A1011801C0E70010503A22B
            782617D6301D108F85B5A88999A937D510771A2FE955A6383460E6F92D154879
            1A11011DA02DC3F39A1F831CA33300DF821B04507EE0C200097A915949ABEAB8
            7F83E360BE28A8698547F1998368EA111FF32DC3B35EDFE2770DC6AF05E6321D
            F02A971A7B5FBA6A29422E80C82F21274402F15D4546658856105C5A1199C33B
            C9426830512E10162F2AE7A01510AF7A1A9D7B5AAF0A307F0D90392992826965
            5E60FFBA011F1341E99272B43757ED34101B1918EDE28E9C5339C3C5395ED6B0
            A6F7B0CF832B37192F93043CA8024A4D962319307FF1020106C0012A8B11BD76
            11AA39420EB5ABD3D529153056023001B94329D8494F8832287E864423D1A04D
            789B98DA69F6D8630D611500657639558900D53049411C5D8B111D8B20791AB6
            5ED19E1EF5B0D6E15330411C6917B9B73531965BB955B11D91FBB809F5202EF9
            2B2F91179D25B89E4B1C64611B9BFB76D598B80C4130325489B0B6678B63280B
            5056B1C672F19129383490BE61005C3510B4A11F00E9133653783AD239823523
            5FB56B96324F968201B64518BF84010B041A0F50562CC9B819F5B0BE98905F33
            2F26FFA9232AD7281C905F48E98B9E92301C30351FD05E8D6101D09400106001
            82656403217605246909649086629B05B37F14900167F3274882B3C2436369F2
            000634490A3AAB0C2166247A9CE363A9F3171F977280FB998E263A38047001C1
            084821E72635832F816A29568637A3E7941D6A710B93369AC35E6BA972F1A25C
            00B0010E74B8DA1B510F8B2F5CBB6A68B23F762A33F012572B842FE0D51B8426
            10E5451ADF15215DF331AE993D9DB5010DC001682AB237132D1D5087A7227AE3
            63A7FD225E83C95E0E203AFBE9BD19C8BA0B21006E32380A60C5DAF235E5026B
            E5B52ACEF23158923995187104E02C57532E81D22F171021E295AB0B6B7BEB0B
            2F68FFC4A76A82ADF142BFC9C22F1E702FEEF101E2B55BAE26AD9549ADF7B8A9
            0130C8AB0649FB43A60F902317EA21DF423F8288C74ABC9FFE8137A754365023
            37A412001F102A1DC0A709D9C71A60908D026200900156BA72D8BA00ED65C55E
            62C69AE22B8A3B3B0BC5C611FCC6E18373566C0074DC2F74C4CA7A6C717CECC7
            0321A1812C24840C48687AC8C3026E8BDC2F250B2F170A78E193B5F5E37F970C
            6F298AB73D496F9E0CCAF022CAD641CAA6DC60BB63C4AB1CA34BFCCA4E2CCB51
            5CCBB7AC71BA1C00BCECCBBF65B5C30CC69672CC175AC689E32C68BCBAF3FAC0
            6DBC55704CCD73AC00759CCDCCB9CD65E841DE8C8D6ED5C7E2EC6AE48C865C7B
            CE8AFF0CA38DFCC290FCCE931CCF968CACF47CB7433397997710F8A2CFE0E500
            A35C3FFF8CCA028DC45A55D04D1CCB504CCB9DB5D0B90C320E1D37100DCCC23C
            BEC56CD1C99CD1CBAC7E1DBDC61FFD5B212DC7D64CD2D87CC7273D3829DDC7C7
            C6D2E1ACCF855CCE339DC8E1C9C8EBFCC8EE2CC9942CCF3EED7440BD6342DDB3
            F0F2C91172D4495DCAF002D0A92CB2AC9C43AE1CD53A82D0548D2A56DDD00FBD
            C5111DCC13FDD54F1BD6E938D6695CD67F73D6D21CC70733D225EDD6790CD7DD
            3CD7CFD3D2823CCE869CD7E86CD37DDDCE910CCF953CCF84EDB09CACB70B51D4
            8BCDCFBEA6D48FCDD4AAECD4AD6C6696FDC4B37C759A8DCB9CADD59ECDD5A11D
            C660FF8DD1A5BDD10DFC84CFACDA69DDDA6BFDDAF412DB7BACD2B40DCE2E6DD7
            316DCE7A9DCE37CDCE390DD83C2DDC95A7C99D59DC3E99CFC98DD4FDCCDCA71C
            D0CF3DD9500DCB973DD5D66DCBD88DD59DFDCB12EDD5DE3DDAE0ADD1CCACC6A9
            1DCDE75DCDD76CC7EB5DC3B2EDDE5703DFB70DD3B98DC8BBCDD78EECDB3A1DD8
            3D8DC996E2DFEE09E0F87CDC8A1DCA04BEDC8E7DE0913DD04F5DD90C4EDD095D
            D511BECBDA4DE1A06DE1158DE1CA2CDEF2CAB21DEEC61FEEDA6D3DE2283DDB27
            6EDB2F6D29F3ADDB35EDE238FDD7C02DD8349EC30CB5C33BBECF3DEECFCD8DE0
            924DD0447ED00EAED0499ED5BDBCDD154ECC178ECC196EDA1C4DE50901CD563E
            CD6AFF1DE226CDDEDC6CE2DFECE5F2BDE234BDD7EAFCE2F97DE633FED3C46DCF
            876DAD6DCED805FEE390DDD40A5EE7525DDD78CED012BEE49FDDD57EFEE4801E
            E51B8EDA856EDE888EDE8A0EDB24DEDE72DDE5758DDB78CDE2635EE965FEDB3B
            1DDC83DDDFF51CD42B2AE03CDED84B2DE7421EDD067DEA477EDDAAAEE47BCEE4
            AE4ED1C60CE5622DE52B4BA466EDE1B70EE26C2DE2DA5CE2BDFEE8BFAEE2C13E
            E9F6DDDB977EEC68AEE94B8BE374E9EC6E0EED711EE4D04DD9D25DE498FDE09B
            BDEADBDEEADD0DEB172DEB644DE80861E8207DEE58AEEE6FCDEB2B5DDBEF0EE6
            925EDFBC6DE9666EEF993EDCF9CEE9CDAEE346ADDC700EE4A44EE7036FE7A88E
            E4D9FFAEE75BDDE7DEFEDD0E7FDA107F10128FD6149FDE59BEEE18FFDE900EEC
            322DEC947EDF7E6DEC32CEDFDB65E38DABEF436D10C8FDECA11EED005FEA2F6F
            ED990DE1333FE10AEFE4DF1EEBE13EEB3BEF4CB6CEDAE8AEDE42DFE8ED4ED7F1
            6DF4F4DDE2C48EDF21DFF4C9FEF4CB6ED8276F809FAEF2063EEA09EEF2D5DEE0
            318FED57ADED35DFE4AF3EF60D5FF60F4FEE553EF16A5FF18BBEEB6E9FF128FE
            E5777DF4F2FEF1C51EE3FB9DF74D06F5DB2BF5885DF5FD7EF5FFDEF243BEF586
            7FED5E9FF834CFE78C7FF3E01EDE662FF9B56EEE950FF416CFE871ADF9450FEF
            9EEFF1646EF74C3FFA696EFA3A8CFA9E9EF26F1EF8CE3DE7AF5FF846DEF507AF
            F8B6FFDFEDA24DF6BA1FF90E5CEE87FEFBB9AEE5EC4EFC1BDFF9733FEC4A0FE3
            FA8DECCDBFF7B358AD283FE0FECEF2837FFDD35DF0A90E101D0678D810808007
            0D053A6800A0A002800C1E3830D0E0C1038005141270F060C1C10400093C2428
            08C0E449072755AE64D9D2E54B983165CEA459D3264A9902282CB8D890E38287
            00381A88A080C24506231F1004B0A167010A130E26C070B283810B07015C1060
            72C185061E0674E020E00087AA1E3E001808C0814500162D0C48CAD303040F0F
            007CF86AA0E5820337050F265CD8F0CC060D103C8000B88080002D074098E921
            0057931E3238C8D01543DE871D0308B860D94385004B37983C8A40B187AE0022
            4458FF5A4083840626037C4070412041830815327408512245B8193776FC1872
            64C995290F4FA75EDD3A4CE93075F234A9E067D0A1458F02489A4075D3A751A7
            56357935EB45CC18C18A256B166DDCB56DDF5E944BD7835DBCF4E2EB02BF5802
            EC3A04135450A6C4166BEC80C7226369B2CA2E8B4D33CE3C032D2E0B462B2D80
            D352630A80D65E8B6DB6DA6ECB0D80DD7AFBADA083125AA8A187229AA8A28B94
            E3C823904422494295B25B7048228914D2A5ED7AF2EE3FF03C20CA28A49462CA
            2993A0926A24F600704FABF8BE0A6BACB2CE4A2BBF8BF68BAB23FF00CC6BAFBE
            FE0AAC4838E32CAC41C61C834C32CA64B22C3E0C3B03E0B30742EB9034D3503B
            8F44FF0F5C4300369350F4C036DC74E3CDB78160146EC6E26C442E478D766CCE
            47E88294735452073BB2A524BBFBCEA4F0A0244FCAD5A804C0CAF5ACC28ACBD8
            BCA42FCCFBD462AB4CB8FAABCBA200D924D0CD52935556253A1F8C10CF0AF9DC
            CC4F4005F5B05011574354514665A3ED51152575B1D2E06424AEC6E370C4A853
            E67A7C0E489C969577DE53594AD52726597552BC28CD9B32BD2BA9B2F5BDAD72
            9D0F4CFBC6FCD5AD60D11CF6AE35072C70A503E7B518CE66ED84F7240AF5B430
            B369350C94C36B413474C412173DF15B48576C9152E0621C8E46E36E4C8E5D1E
            9DFB91A57A2FF679C19E55BA7749A0F47D72BCF2CE9395562C07C6D5AB83EB13
            13BFFF85CD14F63F62236ED3C0377FF6DABA8C21BC73C23C63DAF3C290FF1CC9
            5A424D1631A894BB7514D2EC267DB1DC998BB320DD9B97CB19D48DDDFA7A7005
            833E69688B18C8A03D2725F8EA22BC1010095D9308B8E08303126528B35B2DEB
            20360638786B20D8326788A9B622689882C9B0CE6B24632756A962C26B1F2CEC
            67C98EF6420B22A0A0AB093C50A0430ECA12A003D33A144902932A6A2082B062
            4BA081141140C024012A78007901340B20F30F0E0269010B00C01182E073E460
            510F2840602DC079B67DFEC30CC77EA7A722C0A080044C7240020128A0000DA8
            0A013060000368A07F0FD89C001A008101484001658BC00108E6000915C0010B
            9880FF001C909B0144803218D08B00AAA200FD994F027A2940040C28010D0646
            62C8A25F0D19A4983A892D706C291BC704109BCC7C0C000F48C0010A74800514
            60010038006504C000BD2400020528C003066012032C80000720805ED8320011
            15602D05F8A2019EA8970304460008F08B0208C0962506203103300004F22440
            3B3EA0006F8C5F746CF8C79A1CE9011F20E4E1F047B12B9E04022BEA4E0212E9
            96040029802A21629538A01593346003B23BC0FE141901329EC4368934210634
            5020034C40030A881D0D01F9CA93E06E6C2BE918F6D2F7BB939C2D9364F1A202
            4A93A50054800127598A8492D281A09864001C29085EC468129174E07ACABC00
            0556FF24800F5C404806D889490EB0810B5C20025E29DE38FB282A58A6537E2A
            91D2350F799288786045A5F100062263008BF42402C5EBC95EBAC51390CCEA92
            3D494006107015937C260359F1E7DECAF699253AC722CC53403D355096096C8D
            625D53E71F65B9C35A020002A8894BD9745980BB20C002C0DB40E6281316D8C9
            C6225D190005AC78979388E4320EA8CD5AE2F2009E0C332E13081E8B366081B0
            4C13000E354952101081047445333C39C05276E6C78E66B56717608F4E92C231
            B14080757159C05202E3019070352E11009101503A5300C074730418285B2830
            4ECD00E0784B54C01513D59044BE95957BA1402887E8A49266940383DDE88240
            F058FFC88220AB87F928B40CF41FAB04A043CE11A907CE5A950D800421EE9B15
            5918C513CAFC3533E56B40051070C9D5A0F487BDD3AB07186090597980AD13AB
            00B14C1211064474207A71AD55498AD5C24416B2938DD3A96ADA4F0140800014
            50648EFE83D2000CE002D7432B002A70BAC088B3219F89CC020C10DA2A55002A
            761DA703A8AB800E7CE0AF03095E04AE08A2D20C56BE16296F5E92A2800728A0
            A5AEA48E721F1B02034B96B936A9ACEE56A23AC66284892659CAAC8E85D8EF5A
            52A9D16B084E3D70815C0ED301C214E0F50632809A8E9327C80331E93A801906
            5C002F42C5C0E510F25B8224CA84036C89FD5C9260041B78C1855B49012CC081
            1D56FFF7557D854D0138D0BFEE56202DE11DA74C6313800C0494967795CD7B3B
            900108740002C7B3804872034E9178F1010D384B503602DC98D0CE30910D419D
            4570673C8BA0CE417EEC906FE8208D5956911988304B448211CFC62537150828
            5D95AABAAE5434B5CCCBCC5A1AB03895A0740002A02D4F80FAA8810030AFC1AB
            C807C89846D9CC259318B0664C7CAC123ADB39CF77DE7364FD5C9D2351800381
            79244BF082E8050C8400DAE52E432C703ABD70C08B90D64D965195610A50F720
            6FAC005E29A3CA33D1D3337ED91B160900228E1278309095F50848408212A43B
            DDE71EC108F4CCE75BBBA4C1B4EC213EEF125C97E0B30010E0C0152D00120EAC
            C8D1FF276136013AB0C43525B403DEDD1C3BDDBAA6819091030BB8CCF5D02200
            A2E63389DAFB13433D7210A1BEE4D500207708EE6C6E74ABBB04EC76779D971B
            EFC21CC922A5A9724B32770091BC512D6F61A5052CB080F56DE5BB96318904BA
            85652DAFC4E870DECA93C51C97EDCAB32144D12D8B3890017CE6069B14E8769C
            C37D93039B7C042638010A50908214A840052B60410B5CF0820094A0DD7A7E39
            CC33894367CD5225212D003D13DE92DEDE58A2F13908238D1E9BFDF4130007F1
            00425792BEE31E052E0030BA45DE58B998EECD22ECC1D1057ADDE399845D0463
            2FFBD9D3BEF6B6BF3DEE7387B7DD6F72A4008C06882E09DE62296C911569B77D
            9171FFB24D4FB280860780023E6D49023410D184C6143D0D00E2282BC7114612
            20020D87899CC16E6718C44006DBE77EF76530031AD4C0062D78C1CA47E07205
            DB7DDE7BEF214DEE795F09192032B12F80FC631F80FAEFDD2FF797900266AF12
            0380BFC860000C6291276A80FD8B3D263A00059C9E90030033621157930910C0
            3EEDF33EEF033FF1233FF3433FD7B30921C13F141B00C39A90F913002A8A0D14
            7C96EC2A00301A0D2A8A101274C1D10029C858411AD4AB118C0C0198411A9C41
            30D22B09F9A12FF23AC2A8C010B8011CC04026E4BE1CD0811DB001175839BA4B
            BF785B3F8EE9A10568000D70009E728904F8A0C41843324C0C09801E322CC016
            2AC3FF3194800E48800898BD0360C306718D3674003BA443C5708D07888C0670
            000D789E24F39F984042256CC2267CC2289C4212A8C20FA4092139000AE8802F
            033197D0009FCB444DF4B988C8804DFC4450F43D5AC24450B4001BF1C452FC44
            8D989509E8C40EAABEAF0BBD10E0811E40445BF4811F0002010882F23B3F0453
            3FBC0B34073B09CDF2BFFFE398114C46650C000970801E4C466454C64D33800E
            F93C69BC46309A80A8C2C665C41EC5C9AE097C890AA4455B44445CD4455E943B
            977B449938950750AAC25838398900E41B0CC57B09EB93452160C221208222F8
            C77F348223604224480220D88129F4452B1C322C54A6F6F3AECB330C07E89F9B
            1880FFF2290C0C78409AF8A699089A0ADC470CEC47800CC881C4C0823CC8845C
            477614399640809183897B24120978489B884971A3C01050020C248225800923
            1802EF63822670825D5CB95FBCC260D421413B890A88C89883479A3032C3C000
            9A8C098E6CC71FCBC99DECC997F8C9A01CCAA22481A35C49D05B09979C0E9B5C
            9099348CB46CAC9AF848EF1B02AE948927F03E2888822490021B50C78564AE86
            E4219668CA99C81E8BF0A2A2738B691A00BDC00B89909D5949094E138CD14828
            CA504016D918CB8C3D01EBC89680CBEE934B9AA8CBEEBBCBBCDCCBF3EB4BB214
            1CB37C3513FA1F203A00A93A09560A00382C0A0329C19BA04A95B0CC630492C9
            6CCBFFD989C51F03011EF0BE27B88922F0BE29A0822A908220E0CB5BFBCB9032
            09C1CC0907B83C14F48B8B90008A84A021423E08E9AB0130A07D5B1CFC8B0902
            E82008B0800B18A6668C0B0A08AEAE63009DCB00FAB4005D4B3A965C89C72ACE
            EE3B4E9B48CEEE5BCEE67CCED34C4DE43A89B39409CBD9A25921230670247954
            00BF2800096080344AC60208003BBA32DC640903601EC61BA63A221FCB5814E9
            902EF2E9A004200B949A897C14C710A845EE2382C11050EEB302E61480166844
            D4EC28E97CC8EA8C098C9380EB31AF8573920FA0C815810023D5A30D78800B58
            3306D80006A08087984E9618990F20A1A25B0004482209080C2B258F017000CA
            7080FF0FD000085000E2C30E96A8401ADD3E1B150C1CDD3E1DAD021EF5510445
            279558D098703208804D226A000640000690C7489A15EEEC1F08400023358F08
            9D00BF108005384662648071222061920DCA5300054800033800FBF2D4488280
            08B052ED8451E18C5310D049EE03D01BEDBE2BC0822C48821D78810365C8A4CC
            1D7A0B4CA77C0901480002808C07B0A0B80000EB21C421CA9300B81E36B3A3FE
            51004C438C03D48061AA0005408062ED1F03BA5408F01004D800DC3828EADBCF
            93782C58DD3E59B5535AB5555CD5D5B144D053015498982E0220A30D4000ED41
            3868EA8A01E222F250000C70A30D2280C5A0893365A28242000F1A222A1AA703
            D000FFD8A40C05988008700006708817958918EDCC1058C2ED1B82C32082EED3
            822DE0822ED84B11F8D1740A52609D8933BD2213529D92D21E066880CB0BB3AB
            CBD900880003600CF7992A306DC70160A599BD000578A00228D302E0D6252200
            FA8C806912BC704CD790E53E92350C93E53E9455599675D90FACD75723808B2C
            8009E08C0798C8B26080DB9A15A82AA2C638BE03F8200CD80005088C0084090D
            0A89B882800410310608D161B2D2FE09000340587C3B25E0FCBD5685351000C9
            EDF382E900CAEDFB0230388026900217D855BFEC55BDCBC298AD1F8A5C09CB6C
            0902A85699B02FF8BA88BE1BA6C633808A7A1424CA0C0E30238E1824CE4CD7C8
            ED3EFFCA3D0CCB9501CCD55CCEF5DCD424DB99F81ED91C3650F50E8C50C10550
            80E83588C76888000836EB7DDCC75C3C8B585A6F2A0DE7C88000908EB07097D3
            6155590C831A6D897CBAC7F65D092FE83E3118032A2083E76C595E0534A51C46
            A60C5653814A99BD48C2B850C120006DB95A920B01F5A553F6CDA706865FF9A5
            5FFB2D01FCED53E49509DF6409791C44EB1021B6445F0A148132E0BEB9CCA5F6
            EDA713BEC79294013300833340833478810AFE5CFDF555F61B5DC3802ADDA809
            A91C4CB7D28D378A948640DA0420A320ACAAAE80A20878537425391126619648
            E19570E09558E1167EE1189EE1E36DC9571B5C080CB97D33007904A09578A2C3
            3080FF04A04836AD1C087C00BD08D5377AA3676D80D1A08D64F558ED35091050
            03EE3B82289E3C07A6E233510923E0BE3560833620802E6801E30552D0052921
            F5DF9600DCC3FC3D02A80035F6B57A1425018E09366A002D722DD9589C6D3DA5
            A7A263FABC0C43C53804D000FD740921D9E33EFEE39E10E4F75D8942DEBE434E
            E4456E6476BCE0982058F371A3C12500EAE937F8B2540620A36DED1FB7CDB70F
            55898DED8C03B000A1A2E309509CC980434F7D80B41D544ABD63239489107003
            EE33823F6627FE50BCC9338925E0BE37808338908339A08312985747AEE1D075
            481C860903704600189FFEA9A00FD8D80358382F260F0D788061ADC71E364C97
            D850FFA0FDE7EB9180AAE080B84200FCBB9E29D28A56C6D2F7D95D9328E7734E
            6713CE8C75668977DEBE789EE77ABE67B185B952FDD3571B80FDB12704E09F43
            E5B9ED000C06C08005C8D9040855C7AC124C05C08B088009A08C03C85B688590
            0F4889715A4B71CAB2B69089BCC5C9059681223069947E6095E8BE3AB00303B8
            032908002DCEE71CB2618ED1E89518D298089FB51DDCC17580F31A09F8D222BC
            ED800348DBFE711C4EF68A99D04626BA1EDD2C9369851EA19A800B90B2D1202A
            91AEC0ADEEEA2966E75AFE6A96106BB2366BB48EE97873E3D54CDEE9E99F0FD2
            58D7E8AECEE0424CDCA38C750D8DB48905F8EB3485C0FE61330ACB22BDCA009B
            1DD8FFC6350904C8E30ABC40AEF6EA41AEECCCE63E3C80803C2000209061CFAE
            A1BFA4BC9AA34E496E0905F82A63EE809C15300F782381088B8A728BB7480CC3
            EAE1D51DDFAA3080DCC0D6B8520007C8D8C900DAA61280358B2AC8F6E4EC086E
            EEA36C75EE6FFF5E89EE4BEEE56EEEB45E493BFA53468A33E1898BBA8DEDB058
            DB0B00D304C8282F5CB3085829C988E69398803FD48BB584CC30850D9B22202C
            3AD4B525094C8209510D3D114081FD26EE7646E998EC3E3DD88331E0032760E4
            E7A69FE80E09D981EB98C800EA0AAEE81DEA0AB880A1B600505D25BC25A10D18
            00E6E3988BACCA93B01C0CE80A02A0386B66220AB0276A948ACBAB2601C98006
            6062FF96C039586BF11737EE93FEEFB0E6BE1ABFF11C1F811DF7B3614DDCAE78
            1EBDFA213EEF733E1F800300232E42B12DC2E85185C0621DCF43DF50D9F3F33D
            6A743FCFAE774CA863B5BFA565C02D1C8048C2BF35D32B434D563FE7F33D925E
            9A000111E8833577F31817E437DF3E048003C0988320A0F305EB712502553022
            346E54464B854D9C332F04DA8004885E2D1A6AF903AA7C0DDC67A4A36AB4A25D
            878CEC4231C850A01F8ABD4D8BBD65C7F620048A689746250AD73447F5EDE3EF
            36C7EC726F751978F5589FF53AF7B30188EDE835A52C5A007AAF777BAF77E98D
            5E508D5E7C6A6AE96D5E7DFFF77BBFF77C1F787A07D52C32800F00DA7CA7D07F
            97DDFF86A7507ECF5BCF32787ADFD8B73CF5543FF776667574F7833F000439A8
            021BA0751A5EEB7DDECD3432AF322B788BC7F77F6F5E0AD5800392F97DB7F982
            07300221F697B7F8F32A8A9E1FF86DB5807917FA40E74F8D1F7718775F9BEC3E
            9017799237F93ED50DC810C450BF7AACFFA18BC87AAEEFFAABFF9348F27AAC07
            F5AF07BBA41FEECAAE654006CEEE0B843F1004394083926FF7DAE9F1DDF4AEC0
            E03FBDDF7BBE47CCCBE4FBBE37DBBF077CC2FF93CA24FCBD6F88D500FC1F3B7B
            729771C877F39368FBB78FFBB99FFA964C70C2E86DEB58CBC2E0FC5217814188
            D506BEE5148E711C25844080034138802A60F75A7FE49A00F2FF150C8B9C4A2A
            7F89FFF332FBD167D7D2F7F8E25689D45FFDD67F7DA9C77CDF7EC997007DEAF0
            FCCDB78E0A7C81EE73895B3E13293E09D194814230840738044448842028F097
            957D9AA07DC1C043C130EFC1D0CD9BD87D9B88FEE9FF7DB05689ECDFFEEEFFFE
            F0A77B98B3D7E79713E70708000207122C48D083C1840A138608A0480644230B
            271A5C02116203047B16319AE34204088A2247922C69B041C60710161C282020
            40C90A044C2A748080268002167012C40001A7810D381B3E8CC8B3E245191937
            76FC18F228D4A8520D22703015E15492127E42C59A150088128D2E0E5932F5C9
            45478FF4408A1369C08B105FE7F2448940254B973049CA9C6A13A7CEA83E810A
            A519FF762CC4B267D3AE6DFB362EDDC8921356BD3A59E1D6A85EB382182129E9
            13A945924EA254C9D2A5285D4A3CBDECBAA05DBC2D5FC69C29F52FCDC05007D3
            0C8AB3F3E78BA1A38EBE58FA74EAD5AD5F338F5A59EA66E699BB460E110453D2
            2250970CB998A981A13F820C3411306279F3CBB157CEDE3BB2EFED9BB977EEE6
            6AD2F7D0EBD9B77787F83DFC78E59D971E813C3DA75981D31D15DD546169B249
            525EF0C45D528570D2C91E711C3040107215E8DA7A79D1C6976D51E166926E47
            F1765F618695F0608413F6079185186AC8A1871FEA28D281D411A8204F0C4AD5
            99009E24258376265178D1270DF85107286344110A6B3B4E16627BB5F9251F8A
            F4A9FF685F49F819364291472659D2921035F96494535669259C9459055D8260
            E224A45421B4E08428471251521133CA90C928A4E851CA226754B1C308714686
            A55E5AC60798973CAD18668B34E9C9A79F800A4AA8A1882ACAA8A3A50ED4E382
            7522281909521460CA91474838D112441C492827A7A0924A1B9100E1027AA642
            05E988EF9508D58925A568A99D23898953ABAFC63AEB42B5DE3A4AAEBBF6FA6B
            B0C2EA886A90AAFA1819082D84C2872A47CA700411D40AB48411681DB9CA288F
            2080072B71B492041D22789B15B1EE89049F895C2A5B294E9792F4AC61E6A2AB
            2EBBEE0200AFBC49D16B2FBEFAF2EBEFBF71827BA7B8A94E36021D73B8F28ABA
            29ABFF4C082C9C20108B2C829C9145B11D0F9B127B9192B825A582352B12C334
            916C32CA2A1B7D11CB2EC32C33CD02DBFCED9CABA60724C89705B00317ADCC42
            CBD129AF52CB23949C52892CA018C087144174FB7449014B5A70CFF51126D5D5
            596FDDB5BA5F873D76D967A7BD36DBCC7D4C139E93514DF86B2DEC40402B87D8
            720BDE32E092CB23A418A2872EAC886100223AD80078E022B9BDF3A4F3F93CB7
            548A33EE38E4784F5EF9E5996FDEF9E7A1EF38B849854B7678EECC294E852B60
            A4B20B2FBDBCA1AE2FBF00434A2097E3010704809CC1471AB5DB5E17CE223A3D
            11C1C81A4CD2B209FF4C51D03CFD1EFCF0C51F7F64F2CB37AFC7F3D14F5F3DE8
            D74FFF867B49BA47C67BFECD0540471310D10641B0E101A8C0831E4E81004330
            1001A7D0432C74F18760884118AEA082145A503FFB296474C6E299E9E4D69B4C
            45E57F011C60010F98C00536F081119C60052F98C10D72902EF82389FEE8C23F
            1CA6670441E802E386018854C8E201C440451D92A88B62FC610F10B0C302CE36
            871DBCA98626F1E0C08E759464810F61345198B34818151F02B1154224A21191
            A844263A118A52A4220DADF8951B8E248773D9611D0914969231CE1860008418
            52C18641A602148238C6259011893B08C005399263DBB29725D2C12D845F42DD
            57F638873EFE3190836443210F99C84536F29190145CD4C6D51C3C8AC48E2409
            002CFF09E2B41094800E034846245C810C2C184301C6680332CEC0082ACC210D
            0168D440F6124B916C8F6D58A448F7B6F8BD9184EF8BE39B48F92822806D1264
            00040981136C894B5DF2D2976D888330897987631A44000219803745E2CE5392
            848EAD0C59B8BEF2807D226026045840411450800288800436004212D050803B
            D4810189008232F430A0823C00000C704002E40950FB3D937B5AE40917A9E945
            9380116862140904329219061840960918C030BA70D0842EF40E5958861D5E22
            8C6328E4260F60C034DBC9007AD63395229BDA35F3F895083080000EB04A0114
            000001B804000620007C0A409007444020CFD1AA40B40A81006020023F2BC05E
            0610FF00AEC013000118A8CD3ABA90688234A814A9264993AA906C4EA401F07C
            800602B051011040AB06388004E67900814940020269C001003080C806A0B000
            5800590FD052002C56201B1AC84CB8629BB712952A46CD2752A536950880B501
            0050C0029CDA800B0C60010BF0C0020650152E15A001EE74000102F00007FC44
            021F3040020420010664740119F840020A80000D68E0B20E88407515F0540538
            B5AB1D93AB42E88A93908A04AF252929F94E4A11D70A040202706D0122D00084
            2080014C054004F20B56AB4A00261D786D7E939B010F0CA0010A60AA6B23E000
            0A3060B813A82E573120140A48C0030148800726505A82D89322AECC0A2B3D3C
            9708FFD8E6260C608002222B81033C8000081000037E92808D02A00205300007
            2EAB55E62620B256490001324AE2022C40AA0358AE550E2093C45EF800C98DAB
            2475F6C1D275E974BDF9004ED80B00F7FEB8A53986EC4D2250D1D812E4030760
            6A001CE0E38BFE360037C9A86B37D4D20224C0005619C0040C0050162740AF56
            ECF0443E3C95104FC4021E3834A2138DE8D32684B58FB5288AB51A01164BF7B2
            437D80540562000C6800A09C464003F639931F071900730A800110509505B856
            001030404501D0E3C842F92E39AB19343F3A5EBB4EC4BC2441EF440E400108EC
            B3D8C5AE7342D83B000708C02A28064075219B51044895CC035900043E00CB09
            3880FF010D402E4C1CE0E60B9BDAADEF6D70745B4DED960E00C8B4DEB057198D
            B81FF9F9470D20B255200081030854CD4046C001048080DE16A402FFB5AA010A
            C000E946B6AB3DF6E9021E8000A61E0003743E00043200806F1B80A59BFD6E94
            71ED5110565984F7F1C075F3ABF2FCF2CE01B64D809001E0E2032044CD1340C0
            0022A08007C4532001A80005DAFB6A0714D89D1168B69B65AD00033720020B88
            40BB1780000B5C18A837FE38BC01BD10414B85D0E959800314C05D9917E09F07
            503301047000808A3DD3A0A535AAA3C859774A35E0B42EB2CC25600005105601
            3196799103D0D65ACB46CA5924F9C1AC6C12B50386008E87895609F01384A0D5
            002DFF757CCF0722508110D6B260D52AE8A7EA78C942A0EC8227C001223B00CB
            7213DEF1B60CBD6D27750878D7F5EA097933C3AB6B9A90F7AE233D6FBD5D83D8
            0668D8F636D3BA42B81E15AFC7699BB937FE54C09B10F1F29ED70BF1F548800D
            FDEDD304F909513E5498CFFDED4BDF20D43749EF7BFDFB5F077FFCEE372DEC53
            6BAA012CBCE72AD1B73B098075AB0EBE2402B83FCFD95EF915DCEEA19FF52904
            F68984F631073C65DE3C25D3F34D4403BE5F49789F4180DF51889F6B24C0068C
            9D406C85024C806B591EE7B99501FCDC40F45CE615C4B23140915985E029C40A
            06CE0012C4F99544FA5DDFFA655FFB4985026CC0AB0D444620C0715D168DB9D5
            0308FF80DB91C47B6544053C20052E8405160406F284065E8605609A7B409D40
            7495E5C158031CD701108007C858A80180C43D9941B41BE735C0859D219FB5D4
            0334801A864E0D0EC40D92440E22E00E2A600F46450254D4162E967D49D64C14
            C067399E076815AA0D446725C4003C002C3D404609C0C73DA26451E0141E4481
            389DB060004BD098A3951BA6459C007C409115407FFD1D644900A641E1400840
            057CC0C4B9A05441560424805425806B4140017ACB1D0A441E8EC41E26440252
            04060C557AA0DCC00DC428E61B6C2998070499022C62CE39806349C075ED5737
            7145469C59B70180361E9D0178C007689BFB6DE24054214D3080A2BD233CC6A3
            3C22FF5AED51846ECD1317961B04F89D37D962816D995421C0556D4006C413ED
            259664BD98335AC0C4055C0350400238404B599B1DE2DEDB784FDC64A09A591E
            4776A4477E2448EE1D375E9B4BC41A7E81153432803B499BC0010006B4D44DA0
            C458711E5C495604A85A7269C04F58854C9A1A4CB4583ACA5BEF44E1F7699632
            8AA34A6A171A4611CF49806D2DDB5B49224F06C0DFADA16F0D840B961B70799B
            9DC1D8483E4D30D6D82FEAE1011A631F52840450C039AE255BB6A55BBEE5396E
            4046194445B5DB5E105D1702A44A9A9A93FD6303CC846B499D066C9601101B4C
            D05F327D00061CD8654D577CB5D75812953A0A043B12D5016C40530D440224E3
            BE59FF5568D9575309C00230C05AE91B67E95B3389A67BB89A69621C57E89B02
            44A0B084E5308A44311AC4314E8402CCE0656CC00440C05152D702F0E2524A9E
            B71D00CEB99C01340073C99AD42DE1401480495A942E56D48C011C72AA846C4A
            A650F60F51424590811D6F7E670759242561A4255D8F68569540E8DF40B9D34B
            C456B3A59D64815E5551D557C66241BCE754D5E4406D2777C61F79D284E0B1E7
            808A8E794E5925951CF4D1DE6D1EE8514C260054268456E842D06664DA6659E2
            E6595AA887F65477F25085AED512022703D01AEA158401889C3C29807B0D849E
            1184541D658B2644C7B9202C1AC4091604806E5C821E1E95251E0705C036E5E8
            5C10FF698F4E847B084C928E849146868452E829751B02D8C756300005B81664
            999B5B955E8B3CE093BA55633180C509048D02C04DE09C5B4D95CF1984606514
            91124420D2DE04B8933251D488C0C497F6D58FE61AE275510D694002A85A86E2
            040448C0A06EE842581B8C25D39942055522C04619A66448E8C11D68C4E95989
            285B570D159D21806329403986567D35E68B1A84DF69DA0946DCA45ED49649D6
            8C8DD94FC522AC7D00694A9CDBCDA5A9C5D706ECDDAC6E1903D469125A54398A
            95A45E689F8E5C90022A074D40D9D1275CB9D37E11563211C42F125BD94D002C
            D946708196B4E6447422E10230E26669D55C7E2501C453B40A9E3741A101685B
            D03DFF40912540938E4494668005E4ABBEEE2BBFF6ABBFFE2BC006ACC0022C44
            520496D2DEBB69995500579D91219A168086DDC5B2010007E89F91022741B0D8
            B241402032A6CE1998B7B5DBB2C59A02E05C05FC1403E45C3C51E21C569407B0
            D44B851A720A006D91D87BE1999B4140CE21ABAD69CF454A53465E8FC140C053
            B1040760C05F1280345A540570C0505D17B3ED154A1EC0391E40D3398056355D
            460D97066818D82D220654C04DAED565C9972F5E97C124407EF15B7E2D9C03CC
            1707468D697E1B7BD5E11C85681DBDD540ED2DDFF6ADDFFE2DE006AEE00EAEE0
            86697B6918011C25A76EDC72AE249ABE177E79936B3DC0066C809DE6D76B66DA
            1812FF80542980366AD54D5069B821266299E94C481D504E9A40BC54EB7515E9
            3AE54F54146B8D9B6BE1A55062E89F8EC400681C0775C0539118ED8D6BAA2A40
            7249EE024840DA55DC4FE82C040E840354C075FD040204C099BD16D176558ACD
            E55D3856EA01A5B8ED63A8BE9A8FC987D24AD61C861BB1A169BAAAE14AA061C9
            0AC4B0DA10DE7EA8047655E23AEFEA7615B32D5C00FC577202EBC605F0041C21
            8C5EC04CE4229199DA8D3EE6A40159E30E958109C4CEB9E489B654ED4D2F41DC
            99F4EE220050C0B2691606A4D952965B79F6EC2429287A9A040270809ED9960B
            BF300CC7B00CCF300DC7304B2984AEE6040458008A55E2C311EDD2B5EB9632AF
            CCA9FFDA5E6C1EE7E1DC017480B7112F13FF652556E9B93E808FAD95934DD503
            1C9645C5DACE522FBD6E5CC4995A61A96173AE98B83D2E94CE2FFD2E04509DAA
            ACC1DC5C4A22733D408EA9A4610E6A4BC15CFC1A8403604006C0A9D4F930CCA1
            61540D6A6022400EA3AE40E931560A0C5704B25B05A2E52217CC95A6000CEABB
            9D44B2CE55A14EC4839699045097288F322997B2299F322A9F32B785D7DEF1DD
            4A20D7F1122FEA45800198954A28580148E41E17044BC4E2BDCD67749D5DE256
            5AB3495720235B04081718DF85C21900427661AAA1AC2C87594B282467654003
            54C096D1610EDFED1A37C72BAB976408968B7633C899B0E1F9E9B272DFBE69D6
            4BA4FF9E2536EC54EDA3654140996A567EBED30356164CA45E6769963FB5A764
            C173554516E8A55EE46931685DD540B70469A55D65C9E8BD791626CE85847EB3
            3D2274810CC061196EA9E0EE3A93E7702AC485FD214673981A9FB44A03CC26EB
            5EEEAE344CAB704AC3742B1720B5FA5C61192939C39623C28460C51374F27227
            974450475F4B4FDF50D784A2421F2CD5AB4944A04F97C4F32DD3F1CDF44A6744
            027C4060AD693261AC0457453C094CCE25EA4C184007DC840050807709652E22
            F20CDE2957938FAA011C5D80F48252602A05A2C46995DC45A75425356731D7C7
            9126412C6F494C67320D6702ECE542A45E41B4DE65A85A4CEBA1CF115D909166
            656DFF66C74D40C0D9594B2117614BD699C29C50088006588054C99B2CBAD300
            6C13AC656D9F219754619A3226235565B1E6859549F3293AB3A84B87F4F64180
            073CE0A451AD55042055BDD56E52809DEE175A29C4D21D1606B42B9838D5ABBE
            55CF8DE46FB56974861D72BA616B87550A3618B8C204507137947240D74E007B
            B7B77BBF377CC7B77CCF377DD7B77DDFB77C7F809F3127505554E9DD45C92A40
            06506D9E71577EE51C8B2963819DD84F9836C4F29DC4059D96194459DD241AFA
            A24A7A40617E80754FDA3E1D400620626C619AB55640261B756F27696D52C427
            D3D300608004F49CC2CA1AF5368003586E534D6300D8B84FBD2D6F02D73B11A9
            5D34FF6605685812A20407A8158F3BA2033CC00598DA69DBC63F5E960608DB97
            FD05A8412F9A7AE60338162F2EB5FFD5B0988F399997B9999FF998E73341DCDB
            7FCADA0388E08B62DA4B5DD6A03ADD087EB1C896DD655940444EEF8B6D85AE4A
            9C3222E200144007AADA1C3EE63F66D49DB9DCE47E80C4A5920798B354D8F5B0
            503AF469A98C0B215F362381C59C5306F0701B6806679EBC322ED6328063DD1B
            4049E489A1A95409DC4C58985FD919E75D80364A006C05D67D85EE655594551C
            96BC925B974F369CA452F94664FBEA7ACA6EB9E7969BA8BE139878B5862BA407
            3CB9CF2D93DA0AC4B87EDB85B918E9C95AE43A99ADC7E8DE719E946A728AFFAC
            A558FFB6E3BD3BBCC7BBBCCF3BBDD7BBBDDFBBBCE727D1A2ED3CB157E982D94A
            D2995666ED6B4D000530627ED9C674D07640A69A64F1645431AE6DA1694B5D98
            56119D327AD794B757AB836EB9C19A4BBE16AC9D604595AFB1DF4E41540573CA
            DADBEA993761000580DAC63D155835DB5349A444AE6E03BCE800041D0E7BC0CE
            875BA82973A3FE847C115DA5ADD5530DC40478C0AAD5F5519B1F601704197240
            056400D667BDD66F3DD777BDD77F3DD887FDD65B4075AD61D9E99D33961D22E3
            178C715707E8D6AE0E67A525B3061475C6F1DB05DCF66362DA0360C0C6D15F2E
            6F4874458D6D090042647155C6977BA844630AFCC065040074806937C0F14662
            6F15FFF5C9677E5EC689A51FC5187E676C5E9B0B4B30A49935675955B58DAB11
            867E425022178AE6C45F96D8F1DF894AA460C57E4E14996BD5168D05C0128EDE
            ED1FA2D401D4DEF598381216EE6BBEF2E736E7473D012E7F49702C04947D739C
            DDA13A35F4673FF939BF0D4EFDC913A96F4F46916A3FF97B68E7973FFAA7BFFA
            1FC5F91B3B5527449336F592C2FF42BCFFFADFBFFBB57F4C232A2F9EF8400004
            840000082E80A040004185040924708880618281052002180061E1C202091E1C
            189811644891234996347912654A952B59B674F912664C99331B3440F000C282
            0305047C3C5981C04CA1438912FC408000828A053E0E20D060408002000C4038
            A090FF804F0809081C30002000040A0AA87A5840B5414801089032F80A602AD8
            0253B3C2B5485040DC8445F9F6F5FB177060C17F6BDECCB9B3674AA08319FF4D
            10F100020C1B002870208142810F13223B4090B041040771199055B851B4C50F
            12021C481B92C26782A81F0090A0C1C103D1021234701094420402961D34367E
            1C7972E5CA0BE3D4C9D3A7C9C5CBA9ABECE0C081F0AB02241C7830D041E40154
            0168588020AD82AB001070F02D0100030C003C585CA0C0EA6B90041C60E84000
            0206E052E083AFEA636080E20A908081E206A88D8008AA9B90C20A2DACAEB9C3
            A04329000AAC3200C410451C91C4124D3C11C514555CD1C4B832AA8820031240
            2002FFEF066A20B2842478C0020512204B81B74A5BC8810D20E800218C2AF8E0
            B1F86C22E8008C0058C081061388408105C68348CBB40248A041000EA0E00104
            8ABB10CD34D55CF3A50C9F4BEC24083EF860833AEDBC13CF3CF5DC93CF3EFDFC
            13D03D2B8091C8851048E0000C0C58C000025D73CA8101248060410218080A80
            0730200044012660A882B008BA8050850E8880AD05BA7AA0A1AAC62B8E018A72
            6255420162BD94CD5C75DD355737118B8ED75DDF9ACD0110A36A3401013CAA2C
            C8A91A5D4FCC041A552080DA084A0BD3AE442AA0D8650F504FAA81AE9AAA8146
            8F654801D3825D97DD7607F3754377E50D16BE79EDBD175F99E08533DF7E2904
            D6DFFF8005EE775F80073E18E199020820CB051C7E18E288259E98E28A2DBE18
            E38C2FE63761E66C72EED78E451E99A52811450AE594555E99E5965D7E19E698
            6596992317496EACE09B75DE39A3C8786EE9C1BD7E062CE7A18DEE3803838F1E
            894AA19726AAE8A7A5C6F70001A73EE9019BAF8E29EA9316BE2FDDB0C51E9BEC
            B2CD3E1BEDB4D55E1B6D46B7464EC2947A0A602F0184B63B21BBE9FEC869B0F0
            26886E7E7DE21BCEC017FA6861C0F1E2576F95627D9BA68F35E498A40064E4EA
            80CC35DF9CF3CE3DFF1CF4D0451F9D74D10D684020C8073BF324023AF0C0030E
            04A8A0030E3248D0030B3C80A0020E624F4B000F2A5068000F2EA0C0830010C8
            FD82FFD722F0802C0AFE73A0830B386080810E2CE040038236801E800CEA5BC0
            02EE6ABF20280738E08002684D7A5C7598BA2609FBF83332C06AFBFD621DA5D4
            16A0802018A8C97C34F001827040211548C007C663910BC4A8020FD8405EF642
            3D047A600210B81D0020A081044C500113E08907186001006CE0021B20C0061C
            50BE4C9DEA351AD0CFFBB4A6BF94CC4F2406A8970D0972131EF2857F27918084
            1AD0240544A0011ED00007C82200D911C40303D0809406F0C4E231800311C040
            5C22F03C067CC04C674AD0F224D00188D0A9001708400520E081044C20031841
            C007144001ABF52725F0FBE10D25F726A565C46D7B0440DC043993209A6488EC
            E940FF006B52AC0E7CC589095980075E5781840CE08153D2C0033EB510D194F1
            88582488022CD0000D04400312F21DEC18B081F32831018B048003961837CFE4
            B1868514090E4122006B097286BA7CC9214B22817A610076C373C06324303C01
            7420214C040001B60880E0C1AE3E09C066BD8C5980FA480040B0E340D5E023A9
            CB10E4011AF0107D0C883CD841E475B9CBA548F428CC91F03223BC49893661B7
            48DD61F084C6F3C03559191F0FC0489B1D5028003E10BBEB11047970F1400618
            0A3B0AE0CE77D6BA8005C603BBF2C0A702B0FBC0C226904C9504D39E2C2166E5
            8436172861AA810D74119CE6E2A29AAE273153394042E6C2D3F5B446210140CA
            6C3EFF32179F10A06F344C2949F0B9107DAA2403E9EBA41D25F018F7C4A77B60
            9980313F9280AC22E036080840540892010E4CC0001EC000030008000136003E
            9AAA0C0730501CE399090113A08C6D02E0CA0362EA24285D6A4A566ABF7A0E76
            214D55C853396481AF48C0340F70C004527881843CC08054B9C0012AD0C03712
            442CCD34E65E2CF080DDC930024D32800392A8810B9C85039E31E04133E0C1E4
            0500AEC56B60696F88D89614367E87F52D00148B972635F62B1F980F005EBBA3
            E5A133B30E889D07E2E6D56B45609319A18001326024072C0081839C005C0990
            0103C5933E04D0801B31E04C0BB4F12D1400AC49043B5C92005775C2F56D71AD
            795CFFAF8DC522E2F38001314016EA02E08303F1C055D249107E7AB4A4B093D2
            F512908144950776E5BB25034413373646B18D76C56656B039BCDEDA97B0BAD4
            2F62F9CB5894F06BA85469E05512374DAC008E0005C09450758CA9B80C40006F
            89F101603AAC204F45A85899EF7C51525F148704BFD6AC294B6A6C4DA15CC461
            F95B89C314A265FACD73B02DF6EF0F9DFCE48CE077001BA040063A40489448E0
            35028040525B82D9B924003E796108DF5C4480063EC03753410F4180DCC090AC
            38CC7D0C59495C4C66339F04CD4D0A407D04D080E56AEA2A0AC0807F9709B8AB
            0CA08B75A9F3990870014DA7058910A2515A661481F1A0EF370FB09601348019
            A521FF7AA962D665991F4D103447C0000560403619D08020CDA838B12DA2423A
            6D11A864402919A0F349865D81DE2985350C9800013E209601B846011B08807C
            CA639B0AB8BAAC441E283DC19C6B45C78B248DE621AF7B8DE621EE2800931CB1
            1205549FF035B0D96BD90A412460E8954060024E211744589B5B7F7350402B6C
            886D1060000E8C4796149836AE53AAEB9204EE8F2309F94B08701F9DB8045705
            6972AF4B8266B12AE4013B64D8B001204B0BC4A5D903400004E6138048B924E6
            444ACB931810BC69C2993521C4C05924309505CCA703738126BB1FEDF191D4F1
            02D6F3B249381097AA096503988B000316169799B6F42378D51115C77A4F96DF
            B724FF034880A105F0812E7664030630616F56A310C93000020F788C0713C051
            84B0E43C0BC189AF3BA08184546F2A0AE080251184E0063280C812D0DDADDBDD
            F177534E2D63068902AC8659B8749A370E180895CEA2108EE2852E11C8DA4B3E
            B01E1AB156ACA1218B01244316EC48843E727F8A9420A045138784DE8F8E3252
            EF67B5AA91C67D035800F6549510D2A76AE43091514A3070939152DDCC561789
            021A3097084C40E0E16140023000010258E032AD07C0EB2BF30027A693352ED1
            8005E834960A149D46C6E4FD7CE901146078C6AEAFCA63AB624484686E97DE6E
            24A2CC2F660F301440D44C82FC1A80C91682E3EC49FC424287B083EC9E0779C6
            AB03FFCA2584A0C8F51AA82A38022DB24F24260001BC22283608CE4C69D298ED
            2A7203F05089011E6091784E051F1002A14C3960104D3A50983E70F47E89A1D4
            65001460790EA0931EEEA26204027C639A80AF250A64216ECE36CE0222EAE388
            6E29022000812A2D2196690186C79BDCAE08414202B7460977EDF3B24FDE3242
            019CD0752000B2B2E3001E283738E0B814087B1200239808034E494A56420286
            0500120E2C1A0A3E14C003C46D963CA0E96AC397F6822D0CA0022EE0E14022F9
            CC6C0E9505249665B11882C81606098B82C93267205A431571A9EAEED024F2D0
            A9982C2CC822DFECCF22586521A204020E025304CFFD1AB12FB8EC240AE00CDB
            100EFFE3B0504C22F058682126600280AD20D00F0028600344A8189123071522
            012A60036A2302CC51F44AA20E0B890907A30052E72FF2AD162B4737F28F08A5
            91D9725103AE0246B2EB47AC49034E89FC142240A6440024C52DA64D284C6B21
            FCADE2BE0A12952AFC7091D1D6713018924D4AF1C9A2EC00CCEA9114E2121771
            54D66FDC3CC0010CC82D1AC453BEABEBFEE2BB46D1DF6A64AFBECB713ACF032D
            32DE30D27E3812C53C12033C6234A0E82C646F012444220E603C62CE005E679A
            5E2E8AFC6223E86321B48946C28946D485DA70720975722474B1970C0E2CC4B2
            A80A603C5EB128C4D22C01672D57C227EDCB239B04031AC8DF50E77BDEA92E18
            4002FF748203820D2AC5722886AD9F14222D066053BE029526921DB9D20E0DC3
            8F7291270DA5C2E46F003E2095D2CE4B72E7948A0539DE50213023EF4EC8022A
            402B034B1FA7B12444A300282AF21804020C4DACF6B0F80600F0E68F3B1CC012
            01B3281E280A2BE336D2020382738750A21D81C92B45022C8987351BF103C80E
            03126285D242D674504CA4E2112FB02F2420BC5490220680A2D64237A3F134E7
            B04A060251E2A3E0828A5AA86253A62928E271011AC00101E32BF8633CD44321
            4084258A738FDE3123D82A850C4D133FC05A22082322E0022400223450D60680
            4C1AE00334322636E00064490523C4412D220218F35A4E731F5702F4BC06B36A
            8231FFA4223039D4381D73D176F27D44C847F6C2030C2000A4ED2668734A9802
            AD4C8B32180022F40E2D55C2006AC342192A36246489680445DF72B8E67028FC
            6C5EF893CC8E33F4A8112306A0016094202C60D246EC2D34400A17C0B26AF300
            B4D42FD60B763A6996A822E9C4243D4FCC4399746AA074DEA4B497225321B64B
            2FEFA23716E03B180223C004D07CAE2B4E692C1A2069020380888C3D9AE92C2E
            20028CC42D3DD4D78402097F342520600334202E1EA00224C069A8C91AA94203
            2AC07D46424E6DC83F41828EAC296E42C3270AE02DD84F92C6037F342D02282A
            30BE62FD40CBD028852594D4B7F0EB4B262038C76BAC3AA8FD068293346011F7
            AAD2FFD0B4D8FAA2002C4003CC6A000CE002FC23B3C06203B228460920774A6A
            2B6F5145E1ED2BED3424361025B84503768E310600454B0258114B58D7AF0332
            00110D5313D54742226302AEE3351E0079AC6654FB22C932E0A2742C001A8F03
            A7E2A02A4DA83C00274F557F52B52F04E0F0E4655E076B0E2DA0BA48C8D72496
            204A48688CE9790268AFF0C2024AF525B4094D0B2A23C45521C4675C2BB25C43
            349FD0F56D3676A9E69002EA45BAF6820038A022BC2D46CC6292C663323402B2
            8622013860C796243A9E474AFA6A14BF8C5C41C65C91536789C25251628E5E8E
            B808F47E0AA8F516805825B44325D5678176DDE0821041EB0AE3439A0ECAAD52
            9628FF30356211D18024E002A6222196E731060299B60EFC9ECC62ADC9D222E0
            36CEA20034C5D8AE0503BA4880080D8908531987E20030A8030CE8481AEA970A
            C0761AEA412E9102DA4A5E25354D4FE26741CB0302F63FE4B681449103AA0781
            24605B1547260A80022CC01B2D47AD0EEC325FC702320075602703A28A221197
            4E7336EED063C0AA4400C407773B40401A24EB9A6DFF44B6E6DC6C289CA21B3F
            25D8D2EA97740E8A8204292D8BBE54770EB355219EE7FCAE03E62E80565F1729
            365787D46A11EDEF03E25524F8A3FCC02201962921B27190D0433B6CC237B28F
            627BB2799DAA6BCD8220D60B5374472134004DBB917732EB02F86735D51625D6
            CB5AFF8A27EA40427A1ED284D6976D51623A01C700BA48199F22217695D93805
            3BBA4840AE54300238261A387E125724ADC68247967B27605BA5AB3C2860203A
            78210C60DB84C253BE6FAE4A25A47ECA77566E850BC987550788A148881F6E92
            E2C28815623212127C981888E6439B9C312DEA6421BEC7459007097936A52450
            46F32748332528AA4201E0358FA7A936002FC77ED04F1F067E18E641E2C37216
            4B011E9783DC6F4A30A218130223E2910116202CE62C53A6AF3623AE36327764
            FD774E6F160F239860B9178909628CC56495CE94B982E96B47EF12DD579B1A0A
            23E2C812076C03B44DA434203C138B7D4F42853C005342CA12C9A28D2EA0411A
            2A28FFD6EB9AD4C32933B1AE1C2003CE44742769D20840897B880290893E62F4
            99EA03613B6A2D60273760E72C680B762C31C8A0272AFF539451F581172B821B
            517CE6A8037E894EAE657732A7016467A37C03D8EA2E96FF53802E0903F08DB9
            DCE2DE7EA3F818576C992A984DE228B8B7A1D2EA2BDAC802CEA3A4A6029926ED
            9102112235B126066536C6A203266D353FE201324002EA23766434A236E0F592
            879FE4739DE9E38360A7298137AD00738B21A78B6D030A3565E916020220E24B
            1A915B78C3986E434687F32FD08D6B26BA242A3A2E2E3A46392877385A643F9A
            920C40A47B88A41BC0A4E102A555FA5033C5A561BA2F3BA43E68BAA3BE047670
            1A7CFFDCE82E7B1AA3DFB961B376724AF9660A1A98B3F8AAC135AB6374AB35DA
            AB3D3A79C27AACD9A3ACCF9A771520A52576AD5BFAA5E9E3AD67BAA6E9FA7505
            D3C0763A46537AAF813A9E2B769E8DEB24764F218224DF24690174AC32DEE2EB
            1C465902E900C0264B8ACA29CE62270CCD2C737B4A164092768ACB802AB72D50
            FACE22DFC2C60004608FA9856589CBAA4902AB8D02B133BAABF3EAAB1B3BA445
            91AC6F50B2D3DAB259BAAD355BA6E3BAB36F1AB4753AAF491BB14DDBAF1FF322
            4F02A6E9F204FFD6ADA8AB7F61C76EC0DB032E2A99B3F4A0588B98AF65024C6B
            46F14895FDB6B139CA9B6EA773591900426A7790A93E361701E2C95033C50304
            1660FFE8D89E24F0BA2B0AA3B97AA3B99BB1415AACC11BB2C57B29C87BA5D1E9
            BC631AAE4573AED93BA7F19AA7E1FBA74122A87736B5FBCBBE6B0E4649E5F55E
            BA0112CE787AC282738736738720420A3DDA035324A38DFA0AAE2EB885605ADA
            8A670330E953B439A048E8A5339C1069F783B85A8342BCBA47A2C4B55ABB53BC
            A3F79BC51F9B8C4A3AC6295BADCD3BB36D9CB373BCAEDB9BC747DBA7F9BACB4E
            DB814919328B7CEAE803C9C743C999DCB202E0C9396AD85298CA6D026A7BA8FD
            926703B67C82BB9C3EBEFC12C57C9A00E82EF5D2A30E20CD6367CDDBA8CD49F1
            CD4522CEB31BC517DBCE1DDBC5F3DCACF7BCB2679CADFF7CB3D55BD03F7BC745
            5BAFFFE31BC815FD87873C3945D2C8A128D26DE37529DDC9611AD3A5BCC20F8A
            D3AFFCD3B57C8770E3C94D3DCC2F60CC559D95CE9C951340CD2943D6D77AB0DF
            F4246EFDC4155BC577FDBB471AC64F9ACFCB9BC6893DBD719C3E3CDBAE43FBBD
            0F5DBE6D566B7116821DFDC81120C9AFBD782AFDD2A35CD3BDDDCA3D3DCB437D
            DC497DA2CCF8DCD3BDCC591DCDDD1DD6E17D77E49D306B3D24EC3DB1B7BBCEC1
            7ADFC35BCFFD3DD82FBBC68B9DE06D7AD0933DE14BBBD9E77B45CF15E2A95DE2
            259DE29BDCD2B51DE3A75CE33B9D3DC2DDE3B9BCDC451ED5C97CD5D9DDD5519E
            10557ED63342C48589C40D1BBBEF5DE6BBFBCE7B3DB281BDCF03DEAD075EAE0B
            5EC7FFEF5AD97D1CD14399E8B7764A4DA23E1EFDAE267EC92B3EDBE963DB33BE
            CAA51ECB415DD4CB03E4CD3DEBD5DDCC5BFDD5BF9ECD597E6DE99DA2CDDEC463
            9ECED59ED7F9FDE6D1FADF851DB3E3FEC6E7DEE791DDEE839ED9E179EF1D9E9E
            8F1ED293DEDA079FE92F3ED3A13EF1C1BDE31B9FDCBD1CEBD13DD54B9EEB2B3F
            D657DECD09DBBA395FCE733DDF69BEC545FFD771FEED871DF5039DEE7FBEF57B
            5CE1879EE1FFBAD1FD7EDA6B5FF0B1BDE90DFFE9BBBDF7399EF13FFEEAC13CF2
            8D9FF2BD3EF9C37EDEC7B3DE9D1FD7F17DE601C243000F1D0C1CB8E001000004
            1E243468500181C2021414741858204300850F324848E88183810014126EB030
            0080FFC0041E3C3460D05281CA041B5A1AB868C043CE940A7B3228D033A8D0A1
            448B1A3D8A34A9D2A54C893E44F000C2820305046C442A2081D2841D0428F470
            01014A001F1B4C1800D6AA059028615A5058C10382060838105088000304811B
            1A48E8A9C1C15A951904A0DD30E0C20400042800A8E981C1C784073824406879
            0380BD10340E6DD034B4E8D1A44B9BEEE940E907021E8002F8A053E7660F1616
            2098D01A000681040D22C4DBF061C489152FB6F60CA0E3479522499A1CBBB2E5
            CB983321DF0C9073E7D09FA7BB7BFFFEFD69D4A955AF1ECDBA1540D7AF61C796
            3D9B36C060DA03DCC2954BD72E5EBD7CFD02160C52618725B658638FB524594B
            0054FF76594834CDD699793D81065E85165E585A6A49AD96DB6BB119305B6DB7
            E5B6DB40051D94D042C1412411001459841172CA81D45C498F4117004B2EC1E4
            814C1ED064134EB1F1141477181E892478E24945955549A19714575EA9D45E4A
            EFA175815A6CD547DB7D73D575D742FC05D0D75F0A05369F801E20A618638E41
            9620659661F62067C8054561927AEE69A1864871E81A6CD985681B6E4095D81B
            8AC039C42271301E77D58CCC8D64E3492945B723753F5A27A4764219C967A8A2
            16B524794E62A55594EA4D09965856BA045F96F26D691F00717DA99F987B91E9
            DF99001266D89A04BA796064932D38A7839AD929A142798E0A6DB447F97914A0
            0A09FF2ADB5E221AAA1B6F27FEA622A3C3B9585C8C917A4423A5CF5D9AA3743C
            FA08A44E9D7A40A44FAE498BAF9EA536D92C51502225257BAE92052B965AAAD4
            5697B6E207E67EBB96F95F9AC1B259E09B081ECB209DCB7A10E167F97E9C2FB5
            4659EBE1A0DA164AA2B7BEA5C890B82DBE685C46E72E1792BA37B2ABE3743D56
            172476436E772FC8428747D778FC3E992AC0AB0AEC5EC1F1CD97F05B0BE31A66
            5E0FF70A009A014E3CAC8170629C6C6610DE39E1D066F329725124630BE2C923
            1EAAB2A2E10AF772B9907284EEA4CEDDAC52BB99EEBC69CFD9D10BF4D98697B6
            6F7948A7B71E95035FF934AD0ADF9A5FD56342ECABC403B6E9F5C50A66ACECD8
            FD3EFF7B78E9DEA54DD4DA1F12FA76B726AEBC28DD8EC62C63DE35EF6D69DF39
            BFCBB3BC3E7B5A64D0A381407CF120982E6AE2A79E97F451013BDEB45906CF8A
            30975253DEB0AEFD9999F5AF1EA84931B15F7F1E769D1C93ED2CF2EA9F86FA50
            AA9B4C1BCA70BF2E77CBB293FBA8CC78D35CE3BABABBABA9785D6770F55208A8
            9A62BCE2852081C45BDF9194D7AFA1FCCB794B83DEABA417B9EAD50A7BB9B2DA
            F622B6B5CD55AC5871425683C4C62C8F558881C773E0A8DA2794F7652B7EAD43
            D4B758B6A271C1CC5CFB4B17EE70B4BB0072EA7784FB94F09062BC102851044C
            6CA20894B8C0E2B95049456392E250C53856558960189415D4ACE7A5CA39EC83
            990BFFA1B03867316391EF84E6EB985048471A1646318153D4130C8322C3B6D1
            905B3684DDDC1A853FDACDCC87950222000127C079151000073C8A0243C0C411
            90800425A86425273982113C718E753C0D0417A7AAC6B52A7AB13A187D36C8B0
            0E5E0E6B5A039608C5E73939B171636EC4936992B8442732118AC6EBE485EED8
            933CCE8602B681CDFC1205AE06E4904205E0C0A308608141EAED3715C01143FE
            062FC8C08880854B0AF1963802139C00052848410A54A08215B0A0052E784100
            4A90C9274AD197A2F9241643A9C5C739CD8B92BB5E2A2D7735EEB5F27B5C4323
            09C1364BD1A950348F8CE4242D794912C45389F3A4677780792DD6B8A62607D8
            D95EFF18C000072C20650268C90246BA18C67420300EC8008502F012E300A001
            5E19C003FA22908F8C840309A900052E35000220C4017B011C0232A0208170D3
            88DE5C220C622083A84A75AA3298010D6A608316BCA00412A5680B2DBA147B32
            2F8B4CBB6029A977CAC9FD738CBC12A8F7C0D7B534961074283CDFE886070270
            8A939CE644A73AD9E94E786A929360CD90500680800424604AAFD1E884341026
            00284003494BC0072010940930A02707388B50B28259D60CC42709A89755182B
            00C6F6840020EAC9000A609E033C40214B0D1E129578031C5075B754CD810E76
            60031770559E5F2DEC51C46A94091AE579A334EBF4BE884AAAB11573DDD3DC19
            4738FF3E596A4CA16F64A853A1CA5BA95A15AB5AE5EA08BC6ADCD1888C021680
            8D9F4886D49AC8642FB0F90B4B60039A02E0A6450F2809667B52800EC4250204
            90E9423A509305D036243B1B004F3B305B8528C0031F9808423AC001A0B0242E
            10600DF0ECE5C810F0A007E12D71547DF003200820085B3DEF02D37BDC2A9A2A
            829F6DDE722BD85C2E9E15BA6A95AEF6DA0A42575E17966AD46EE852D85D04E2
            56B726EEED6F833BDC28C2B829228B005C2A9C510FDCA5999BF500060060A308
            5440258B894085395012890C04369BED094B36C3815DA568037FB94006BEB218
            09C824031CC851AA04B0160D48D8250A1880577C6AAB0FE464C28B6C6450F22A
            04DEFF0E810845A874A58D7004DE22210940D881705D5CDC294F48C647BBA7D2
            44B9C58F3860C792730C0090EA630468E0610E106804AC1BBECE15D984984100
            2DD13753258FB8C9E145B18A590C4F8A8A5A29690B80062CD0DA990E00CB39F1
            0A05BE4C810A43C0313F9AA946163061352B60C26D5608061C23800E34A0C209
            09400624828168AAC7021B88C0A5288C81AB68A0036D4A4E48AE7D1F015C6003
            1D2D69A38FA890BC2A61B74458C2518C3004AA32A1094E5831575FBC6C3C91FA
            8A63C5E757D49DE1AC6999E0BB2940624092A507C845217B7140041CA065DA26
            40E501A880015A34ED04D8C80217782D41118C2C01A8DC030FD0C0E75CD21267
            DE19FFC9B65C0AA4254D694B1701D39AE6B4A7938DF18C17256D08E8C0018672
            958203600282BE0068B6AD92D91ED52B0558F9A0CBAD9BC5A0A5B5297137689E
            1D80017400E9982508062E2068952CE00381EFEC0160BE91B6B7640301A82951
            1C0D80A74F75080E57CA13A80A852824410A364876A8458DDCA228B70010287D
            509E0780A90425001060EC0120601ED6078500705788D0BF0E1377F7442AAB5F
            40D020502F03D4FEF54251406B555ECBB22945E10CAF7C51202E718A5B9C0459
            D7FA5044A6CCAFD3F80010568995914A96B7FC660215D8086B5A24D9C8042502
            0969FBD77B5273D07C209A259DAD0404ED01C728D3D92D69C95F4C0E0068F15F
            0198FF00C0665B42413C3C40554F101A45405553400555200541E079D6177AFE
            D23C14410148156DCF131708B6112A77011CF075CA348275677461620025A15A
            1D65011DB000B9776763071621170008B12601C8531E90523057125F77721CD0
            013DB11B3C457A76B55021166993E77C4871795395799BD779E7F579D6070022
            93741B905244B10115B0011D701713360114606539F10117D066AC9127233580
            8C1119F436141260011366656036010AE011FE46005A981C0B00731C73200CB0
            1B5F67747488148E965724265544301A0E385556108102D00224200255985E17
            284119D8226EA7122AE115D536615F47016366017FC10182C601A0818377B100
            4228FF1041B11B59F3013437831EB00003911A05A00106C0120240001A500030
            0700CE261114C61815F075B6F8155FD60109C074CAE74820A08053C5804DE188
            5205811248815468854221320B1001118001B5377B13F00149130174C6131080
            0134657B18106D05800191A51009500113408F13A101E3020006B00117500177
            210015606732316A13F18F61A11003800115D0008BC4548F06020B2755D5D888
            53750558900549B0032FC08D19878935361405F0011940241596527BB120EAE7
            1263C76E5A51018256743147000A502241D1018B51801031008E811604E06E5F
            A610231561B3117829811629051429F815ABD1010E901D177057B7A58851C588
            A271FF8D51058955208994688919273286965A10090086410004200005A09602
            4015AF657263A99686E6966F19348D779686261401709669B996073015AF3500
            7E69006A1997044015264700277515BE8896B075148D94574C260343701A4430
            555AB0055CD0059D57895A179241A15C634701AAE51557A1923DD96532618E2A
            01221910782C1159EC27219601000960018E09143F19940066015BD81829C218
            1C20350A811B6BD87FA9B1654E814413498DA5919519B9911DF991DD78854171
            0012E000D9C93DC5F772D9E99DDF099EE1F99D11F0008B9900DD190106E913DD
            299EEDE99ED9492104D000D91901D1F67841433C4B18555ED01D1117555F0006
            07D0FF0452E002D339659FD913CA850106B87B0901130AE60163B69A1E2068AE
            091C91F51112F21BB6A95A3F0900162094A0A11D5AB168E432663D116E434100
            13B09DCA1962924999A661995285999AC9995F296A18459DA371407915068B48
            14FD079C42A1203DE1055325066340056440819DB96C086A7BCDD351DFF30170
            647BC161015EE1001700011D80590BCA1206A94C18FA8A3D3152067001751814
            80A7729BD551B22610441917C3581312A058A9D7120F8000EF97A7CA785CD1A8
            9F32C09FA7E19F3200A0024AA0066A7D3ABAA3A1D1A322500652D5845F21A443
            4AA9969A695165066070066890062FE0A4A0B771CB935C36060112707FF91814
            0A50FF011FA06001B88FCC447EE8C7AAE6C100E5271412500111D02F07B0011B
            506E1AA0856D26AC13A06035678E7CB8005AA885EF57001B308B4961A53DE1A3
            403A14424AA4D86AA448AAA44C5A02A16A858CDAA84CD1A36A20554770AD45DA
            7FD96AA94620556BC0066D40005DD0028A6A5C505A96CD93001A10011280016A
            0A9AF7A7851830016457AC1AC0A2C28AB005FB015A58B0E6782702E0AF5AB8B0
            0F3B011800AD045BB0183B011180B00AABB1D0DAB01BA0010DFB010D8B0156B2
            B11FA09E2E5A142000A9929AAEDAAA12953AA4992A039BDAA99F0AAE8B6A1A26
            1754A0691403F05A60A75AC8734021E006526504E97A7A434AB30AB10452F506
            7010FF07723007745002D57789A34A63A0D93CACE552E3561406006E0A705227
            356E6BEB0107306E69BBB670FBAA287AB6696BB7750BB70A70100FB0B6687BB6
            7DFBB7E336122BE9970B4096E963142060AE5185AEEC7AA935FBB441E1AE5105
            AFF24AAFF6BA6CE24A140E309F6DF801AAF55F0CD0170476584549AEC38801DD
            27000AC6007B1A00176B7B85F600341500A90BB08F792FD51A5545E0B43D51A4
            90FBBB3D31557560070670075210003D7BAF5E0B4A99D5B2A33184A26292A661
            A94631AD0AA1B44CDBBB941AA4433AB55155B5579BB55B8BA3E9A5B9D7C71302
            10015A910118807E1492001A220006F000B6D10001F072AFBABA472B14352159
            5B28FF0010108E0AD00006B08712310010A000B3E57581B714A09257E02503BC
            9BAD91CBBDC1AB10538507109007040004A05ABE9D84AFA17987A711BDA1729B
            D41B56891B023FBABBDB0BB9BEBBAE4231BCC57BBCC91BC28575BE42811BAD91
            1A08E00063E600A9D222459510F3B80110D000E008680837929DB86140C100B5
            0BA12E9201B8170076AA1218DB00366614102C02282055146CC1DC1BC3180C00
            53A5077B30067CE004F59AC35334C25E5CC2A671C27C32BDA551BDA4C2C2124C
            C6325CC6358BC61ACCC11E0CC2D4B9C341E1005701AC1B7054ACB7590BD05AF1
            AB1001901A15108C0B70BFF55977AA025B072068A08101B39510F5A115A051BB
            3081FF96D5A91460DC07630CC349059C832C5508000753310741300271EC4273
            3C14755C1A778C2432718311667201A0B72E526E01C0CCAA37007ABBC72E3B14
            302BC62F5CC180ECB841A1C66CECC6708CC8A6519ED772000D70AA10F00005C0
            8B53B20094850005F000126B530B90000CA001C82C000AF0B55F2159129001E7
            9C1A1D91018A5692E72CA22EB701048001EEFBC0B92B02AF6CCD812CCB364BC3
            52E5077F000872500536B0CB4FCABCA6D613C07C14066001197001F792C01C10
            149895C516D09B4351BF4D2100EFC648EA369403B0010F00950F70ABC33812B3
            1801A0EC0013B6C22FDBD0B07CCD667CD4195CCBB77C00B9BCD1DD98C8F0077F
            68C9FFCC61925AF057007BE9155B6D15555196019814AFBAC08D0714C80C7B01
            101565091402C000ADD78F6EDDCA0CEDD0133CB38F6BB3183C5581F007822007
            68A0D1BCEC40BECCC3CF5B140FF0653C0122F27901EB57960D005B4E02142311
            0110702F8E6914B2555A0E00832E42D97F91D625A5CC9D780015F000E419CD49
            888045FDD0D87CC1506BA95355D1179DD14F1DAE3F3B11419112EF9724AA0A9A
            AEC1BF95ADDB87C8D0835091DD1BB5ACAD10D7480881000782700055A0CB80BD
            3E82EDBCADDC125FC6019291133C286112319008F20016C0100BF06E98037941
            71738C642305C000EACB48AD57DAA16D010EA00119C000DC87D24A71BD303BD7
            7FFCFFB8820CE0012EBC52A5D77CEDD7B4EDB3A42100F93D845791251A42007F
            212110A015F98C14B31B7315901A01D0DE45F58BB01180ADC7018847011BC0A8
            101C022F30554571DCC80D004F28038560080F700888900841A0BC8545DD1F4D
            D84481D30BA958E9C910EE5887039034732100F7EB527DC7140A20110C8010E8
            0CA10C30018AC51A036000F3B5CE13D0611220CCD69BB82240DC5165914F4BB3
            121D14CACDDCCE0DDD08AE75B71B1A8E9D000D30CEEDAC11F9F6101150007441
            00142E010F40000F60BAB377B82E12000860B819A0154207668C219412017B0B
            B0182CAA17F689BB41110201A008DADB1DDF1B5574B1078BC00873E002390E56
            3B4EFF9C3D3E140920940650010B20017ED8100450007FA601D8A9D3E72C01B5
            ABC407F0011CEED547E1CE10529B1B7154A0C1CF8296001B110108606F73CE7E
            434D1479A5E252C5E2332CC3680CE3324EE3368EE3D2DD49CE5E1A10E06BC607
            8E10A1124E4E0022058E11A0930E308B0FE92F162E001A201131C8180AF65337
            C8180F091A36DD110E00E8A7BD7A8EFD6825D008524579DD01E38EF0087A0009
            71100903F0022100921DDD71D59D1405A0DB07E0F1693984AFC558B68100B067
            154018000730120360B8163E8C0A31BD8C157BB697A0442AED4491E99B1E554D
            DBE95305EAA24EEAA63E6502308FA4014D28611B9C7B673DD2000410010CD000
            8151FF6140AC59F20E76F94C600C30846DBD100AF1D310A059039001B6318CF3
            3C87F686654861CE08380292D09CA691959340099560099710055D5002E0AE3E
            A83E76AA9E9757113468C127AE216F42B1CA8CF1C46529F8FAED4808AFF0933A
            1A0DFFF0113FF115DFA87BEEF2A4A260EA0B95F0B61052A1BEF5E9E45341C06D
            1814807E147E18015EC1F5AF6A00F3997AEB6B00C74754C92101853E11838EBD
            41800953E5DF4DB104859A090D60087B6D004D20006EDEB5506145A42A7ABA0F
            D246F1006602B51D60908797970F60E9A2E100F1E62177C1F25718A10590A609
            A1B76D47B0AC218C8C9FB86DFFF6CE3955724FF7768FF77AEF4B59919E7DABFF
            FBBFFFB6B36F7C00A14081010303050A2C38B020C184071D3E8488506244840B
            215A6C18D140040401007C04090044094D9B649C94E125E44A9621970C4129A3
            10A74E7BE21C181024444B9E3D7DFE041A94658306081E405870A080008F3F05
            2460394141D00208006080A0A028000F1E181C68C091C056040D242838806001
            4F033F0F044050E08307020006720500C12A808E6B1148B88A2182010F421BFC
            0C110453CC22425BBE4499A981A13F820C341130028463CE9D3D7F067040F468
            D2A54D9F469D5AF56AD6AD59B7ED096284004F316534E60C19E5A7067EEA801A
            13255489CDA08D1F074AD42852A54C810688C060A554A11108148670C04281AE
            131CFF1C60E020A9050316F83AD870C041D39505801AF8406083840376EB164E
            1001C0020407D61EB820810A248080B0A006D0CFA7914A8A4925CF743B69A69A
            6ECA6927E42EC430430D37E4F0B3105A704214DB8870AC0898221B85143D4A59
            E48C2A7618A143193953EEA8A49662CFA70522102024EA827A2003F38ECA6080
            EE1A00CF010612B8C0800C0068C0810A0C58AFA51E7DD220000C1CF800039CA4
            03A00201CC5A20000A16586B4C0430380AAFE4D65270B6DA18EB0C421978F30D
            38E1889BB14F3FFF04B44F12A428C014DB8E70B0A72588B02D93513839059554
            DA880408178A0B34D31A99C351280620F071AA0335A8CB800630084003AFD262
            002DFF07B2348A81021E4840D495C6FC294AAB36D0E0ADFAF272E001B81C4040
            81BA0088A001050420B6B09F040AEAC310472CF1C4931C5591451761CCB4DBA0
            14D8EB33658D9BE04AA1029820C30F8C03A18550F850C536198E2022D18F9630
            E209795719E51104F060258E5692A043046F352DCAC6E672FC8900071C30E080
            0A1060A8628B19522821823A2040638F155260818B090A79648B072280820217
            6AE800893006F900BA4C366001021D1BB4D043ED7D8CD1981C8554524A2DC5F4
            60A343820003E3340015B40BCC0D4A000E32ECE0B811E898C39557E4E5BA6B42
            60E10481586411E48C2C9C3BFACF4D6F449B3363273E8066B90992B980B9EFC6
            9BA0FF94BFCAFB62EEEC36F957C7DA7D37DE43EB5D095F7D6DE3D75F800526D8
            E0B427CF4B69D03000F3B3A73913E0820CA73E2E801DB86865165ABA467D955A
            1EA1E4944A6401C5003EA408A268CA395C7B61D07E34AEEA6E8B3CCE590DAFCE
            7A6BD48F97E1EBB0C72EFB6C866FF73669E330376E73C73AFFFCC2167620A095
            436CB905F99370C9E511520CD1431756C43000111D6CB01D7A0D73EFF433DE41
            F33DD3ED82EF5074D24D171FE356D7BAD7C56E76B593DFD1A477B9CC79C67A42
            C11E8640879CED51C1156048C52E78D18B37C8CB17BF00062902813E3CC00102
            8038031FD200BF04CA887E6DEBCCFD3E93BF40EDCF38C2DBD0F6BAF7BDF0898F
            7CE6FF439FFAD8E73E16B6F0600BFC0CF59C0635A044F04213444E00E8D00444
            B441106C78002AF0A0875320C0105F44C029F4100B5DFC21186210862BA82085
            16C4CF88177AE1F3842243CFD0105036040D0E73B8030B6250831CF420084548
            4213A25085457C63B790E819256A8E894EF19C048717842E746F188048852C1E
            400C54D4C193BA28C61FF600013B888C0F73D8019F12B9A138EECE56F8F3161E
            3FA3C70D49918A56C4A216B9E845308A918C6644A31AD9E8C655F669919D69A4
            031FE9132722078A171A09D6BA670C3000420CA960433653010A411CE312C888
            C41D04E0020B15737E09E3140C3943C7CED8F14FB2F40C2D3734024A5A12939A
            E4A4FF27EB004A5192D294A854A53903754CCE24B3330F8C5A249FD819052400
            0210E89100E0041256EC000DCA4846245C810C2C184301C6604633CEC0084654
            220D018851481410800240405640699A4041D24AFBBD7286B174CF0DFF14CD39
            4CB39AD7CC261BB6D9CD6F86739CE59429A008EA18837206A14D54A8333B13A5
            0530E0307701C0007AF4800234601124B0011792808602DCE10E6C70061004F0
            8C406C66001F198047D622810418A02E02B85200DEFA118F242824CB941F4D3D
            C34ECEB8D34FF0EC8C3C415300C6822400570A4109E8008D8C6EB4A31F6D0332
            A2C1082ACC210988B0414BDECAD29CFAE4B14915CA5285D254C73C1592D9735B
            4E29FF6680AD226002078040010824000C34204B8EDD405D32B0D5063C00000E
            B8C003ECCA110514002CC41A00026C9B550440C00195BB2D0028A081BD1A51B0
            31B4691D71CABF0C3DAC0117A84F56FE1A083AC00108632DEB1DD090085D4002
            A5D210564BA032010D5CB761F945ED4F541B14D60AC5B5CC8C6AF038D0010637
            B8038A5DC0B11850D501380C001F6000C51E802607306BA200788075D65555BE
            1C400211080044BF8396040C403D03704FAF1C2090EB422C3C01F0405C13F9DD
            7586B79DE3D5298602E080B71E403F30064041EA4380BA01A0001F2640823470
            18BB7C8400FF2180045AF59102EC55A2575200041220D725432BC0201930500A
            1C94FF03F7A499C779265022FC91B330600006B0CA02A26B80563120A2C60549
            5510201D045C000111508003DC635C458B062A1F49345116D0801EAD07D0D77D
            F48ED1C936390685B08E316C9F10CB19C57A66C87BC5B4011E80000750202D07
            E8C0931D9000CB7D646A03C0808BA50B81015840020648400106A31F0C6C8002
            0F68E8073480AC04F077C8ACAE2A47CE8CE65A33B28107052C4FDEACC80508A0
            AB2976CF753F3069550FFA010340F65F11E001F72C005456B10E88A1D3B10370
            752C1B46569817A000FDF4075C7C29268F1DF369A1847A46A3768C07C49C0086
            37DCE171790E913F72DD07D4FB23FDB18A5512509F06C0262F59018C97086094
            478FFFB9230D08C0A3EFFC64090CD9C910208A93ABEAF169A7F9276B064A9BB5
            9D60453AE0A16DA16DBE33B0EF2763A0000A48F74A6E0C80143F1400764EF2D3
            61BC9487E244030960006D1F2A1D013C00D03E0EECA6755753E4185C460817CA
            C3D4BEF6B5C7FB2701A034D3F553714023A923D715D971CD65A6746B60201B46
            408F4C3E26B800E0CA5C6540CBAFDBD20CCBDCCFD3A6F6F4AEEDD46C5B89E7B7
            FB3506680EF96E097C8E60073590A1B7810D3C205800A8150112205D2A0540CB
            0EA3F54A84F411603B74001D86D29005A01FAD488000C5A6B500963481090C99
            E1B3EA6ECDAB8DCCC9B7B6F22CD9F6ED185B5ACE7BCBF39E067DC1457FBBC706
            2047FFC21A724EBDCFF4F1DFCAB14D791EFA3D725AF5ABBFFA916760F59E7FAB
            CBBFDFFEC6B93E50081E14B37708EDF20B0F25B93FF9B1399FC0B99FD039CB9B
            1CBC32173E6B951E09806BBBB3CF60800A34804EABBEFCFB89FD038AFEE390FF
            1BC010DC9002EC8903F4890484BEFA0314D373BA8F488006800009283EACFB08
            E70819B5A8419050A790888087FA00FF3297B699BF16D2409FE0C09FF0C00D01
            416F619801D02ABEA23E0018C296D0AB27FC0C271480E46326E821419E30C19E
            40C15BA180B4998008C00990A8958FC82D06F03E31FB00185B8001D98FEA6229
            863B1696F02F610B00FE980AD50BB6A3EB8F002BC29E38429F48420D59C24051
            B509FF9828AD2834A0B329E322002D7C3B98230AC1A11109D88006F8B0FD6009
            3EE3C2E52BA8E633B029E42B0FA8800C50C55564C55674C5577CC50A80BE1E6C
            3C1714153D4392026831A9A8C0BADA11742B000BB0B3CD038908F03A255935E1
            EB9CE6228009D32D4C34A741E48942EC8943CC90440494EF68C6F5DBB0C72A8C
            2EE33229AC8F1EB43290A0441D448052D980D0808D0BA43D73C1C40018B9F20B
            3A0EA88F00800D060034CAE9C296F8429E08C3F620808124C88234C88344C884
            BCC396F0AB34DC8F01C845E9A8AB095B1688B18F8DE000D8D015547BAC1E6900
            0FC88F01E0B70B68C6B7F23AD492C696A0469EB0460CC1C63F898EC00309E5FA
            8808FFB01B9789000DE018A8D0B28D7000FDC80F44B39206708F03488F08B0C9
            0838BD64A9009F53CA4CCBAA98DA920858800E40B964511A7D0C45C9933FD412
            008A392E90A82EEA82C82FE10B078C30F5D88F914BB27564C890D88A05E82ABB
            F03BF7B0499414BBFA19ACECE3BF583A47A3F1007E43958F483A45B32B886B00
            0230AE0810C9BA088B04A095A6F0B6630980F9603897598B2D413D5C8131408B
            0E736C1A634C325D64BAB6E8803DDCC7C9E94796F8C7960848F921800CB84B48
            3BB641CB0B024831D35388B1403DDBCCB08DE389D4E40BDF448004C0CD552345
            4D5B0E4E73A5B28BA5DE62BBE894CEE99C4EB7F309F36096BDAAB88F78126389
            BBFEFF584C01301610CB8A38A4320268C1A73097392B365309802761BA47034B
            B86A1A1A3416AB301599D90FE154205164AAE4CC39530CB0917398281441E448
            C9A8E0CB0EF4167091AE0785D00895D009A550A2048AE21CCB9AD4800C038CA4
            88AE18543DBED000037029C6ACAE8E132D0BFD88AF4832F1302E02F900828080
            550B0974E32BCC7980318180B150800F000FA84C9BD55C89D66489D73C337C24
            880365A5BCDCC1CF734E25BD1E27ACD149DC2B8F78B202D03C8F1080FAC8C2B7
            EA52370B89F2C342C2A4B231FD2B737CC22CCC2AADF23E019D11210D09225D09
            2385D23A758C049D8E0545423BDD10F510C03FD1322585539090D390A053CA11
            4981FF80460D39080C140AC179253D750CB99C2A2675542394D46AE4D34D553E
            AE749A4B4DA0A7288A0CEDB452F58902E800C8D4A31CB9D42599291E342DC762
            0986F98004380B1AB1D4E63C8E96E45429C4AB30353FD0382D1D4C3E08E40C39
            62C0A8F19341FD884205090B68008793D669A5D66AB5D66B9D56E86B311D5C80
            ED64380578AB861215866B0B5D84289E88405BCC32A5F0BAB752CCFA783231FB
            08FE188005988074938E08A492D04093BF12B376ABABBCD808A48B2900F01C1A
            BDD35C25BB5DEDD59E483CA89342E94A802C49B9857C8AA8EB0C569B4FD44BBE
            310330A0C0AA9558B5BFE8449600528CC51066BD0A00454009A0CE9785D99885
            59A5FF9CD52D993913733A0D38D1BC28800938BA0A78808EA30FA4E08901A880
            90E1115A030B97A995D94A8A0720000BE8BA07D0327B1D0B97834C08D08FEF80
            C199FC8AC1D8B8A4B499EFC880A6008BD0F8D8E450D8BD7CD286650963D4B1AC
            6A310128BD005829C3C34DBB28000E88A85F0980450509D59B440CB845738492
            2A333C270BC79568C6B528808524B27A5D0F2B2CAD1EB18A9CAAB00BF0081743
            0E957556DA0BB0219395490C80073034BEF088EB1A3492FC0E1734AE2713CB40
            944209A830F7C80A3369B8A0F5BA8AE3B80590B8FDCC0BB8838EB7C234C3038C
            AC6A002F4D37B5A03405900E0738163C435B509DA9B505AFB675DB90F000A368
            8A01FF88A90E838A109B800A1839C2108028E38821FB492ADC4EA66B516933B2
            8F04380650CA1DFD492A0B8D53E9009C24C789FB8803501A0FE80056A3596193
            DFE4854805C8317E8B8093E50CCF6559117C8AEE2A88E3E2B703D8BD860A9328
            33AE875ABCCC293F294C4D971A00C01080AC30AE05D8B8B680988D4B60A850B1
            12DB3DD47BBA7D84BA1C5B8BC32032774396D22A8CB2C0D5E51C3BB665D8EC5D
            8904D85251B1D1898BAEC34DB9B36D31A33B2EE8488089C2ABF5034E90A0D464
            815ABC284EC05035BB3A2E2A4BC360E9881EFE88287998B72A0CD180129F33CD
            E372424CFBCAB7A20FE38060B74D950F881261313D780B8B8923961CCE8065CB
            0F99FFB492829DB0A77B18E9088FC474E3B8B8BD1923D1A72BBC02708028D90F
            A5648F4463CC49565DF1940E1585120F4897205618BDBCDEE071B78772E55786
            E55896E559A6E55AB6E55A5EC89E588B4A8ECA79ED30AB388CAF3C5B4A93C9EB
            52000CE02E27FBD68BABCF9AA90BAF6351A51934A8E8BA88C90B409349AC1B33
            BDF35FB84CB2B658927DBB0ABD8B32800B3664F9CBA0C863231E4AC0AA0AEACD
            5E3C0D15E4C0807AB6E77BC6E77CD6E77DE6E77EF6677FD680926D8901CEE204
            5600FAF8B67D5B927D1D5A6413968D4BCC96580095414AE76A15FD0036FD244A
            B5A8AE963AE82B51BD05D0BC0AE48F625C09FD40CF8396C7FE288C06C830A5A1
            DD6EFF4DB4E35867765E09BBEDB4B88167B795679058499B6E981D85C7D1603A
            DB75AEB828CAB8128D1E7131C0853455DB2B26738F2D6D46C3BBD21975B20358
            482623802C148DD2CAE56371AEBAF85BF4CC2AADAE0B9CD852A5A069FF5CAD08
            06EAB84E582156E51E93EBCEEBE36E09DA19BBBF9A066AE7C2609080C65CEE0C
            77E4AB623D5FC7206CBE22EA9F30D04AA5EB26C5BEBBA6EC00F36B4EDD914C46
            C34CDE807589B990801888E30C97750009C8A9A48BCF10158A6DBEE910533B66
            4ADE1A65C3B94E65C9D6BF4CADECDCEECFE911683BD5D91CD90B66393ADA8339
            BB3031784DB7147B3C9628E92473DCEC286AD3EB18C3D30BE47EA58841B10884
            D8D2FF3D16EC1016749B0AE1A35A91F408B4C8B50AEB6DB8B45EBBD6EDF67E23
            CFFD80B2208AF9A6EFFAB6EFFBC6EFFCD6EFFDCE6FBF0AD32D6138B1040970ED
            38B03010F150962CE30FB9D8301F43511D9400FE2051E9CA80AA0080B39832D7
            E30F38510F05860BEF68B93446920318AE60B119FE3800AC7B001F8D3BE3BC2E
            AA643847EDE98FF869F79E3ED3628F3645D7E9EBAEBD33DC9E28809D768C745E
            56B70E8AB4A0D02457F22567F2266F72FF6209541370C2844812CDCCE34A710F
            D35BE9EA9515552F28691A96D20ABBB0AE8B0BD1C3E0B33107368F702964094B
            10DBAB4B3400C60295AE75B48B030B8F304E469342E8F5891907801A6F6FF3CA
            8082FF459A3B84B92A610987312FF730805863BA7B954224E60956E3EB0CE92A
            9F13F2943572F74EB1BE9AF2122ECB2B038027F90E615161FB8080D23D6518BB
            1203B9F0EBBAAA02850ED2BC2A50B9AE0A7E3900D800D7F3C8D16A5FC35B8B92
            168DBDA098C3A837DC72F3E82272401774DDCEC304D1B301875A021015D865BA
            6E0389240D89C43B8CF75C47B83BC77FDB4C29CCA982E83238994430CBA957F2
            2F6E57A44E77EF471F5134544AA1FC0E0459372C27BD5837B987317442ED800D
            28BE58376D83674BDFF5B95837C31A94808F648A13F3DB80B53230414A247618
            0CA08014434AE3B2008A414ABE7476DC76EF29EEBA17B75559D3F800E0000F78
            8025FFE100619180BF38F76E7BC20118C3C2E8BA6613779ED8DE6541BD84E18A
            10A32B98A6F905F00A6003E21A6DDDE891F792A70A5051C10EB9AE4F91296727
            46A8EF891E3CC9A7A35BAD608AE495C5D10C311EB6FAD0A8AE97CF0B191316AB
            B0000CD8D66FF632F088803144B401808A3194578AB38BB330AE419B954C1380
            0C78FA0E5159AD1761B5CF9419CDD1AB5FEF81237C0D90FCC9A7FCCAB7FCCBC7
            FCCCD7FCCDE7FCCECFFCECFA09287732453BDAF5803BD23C61D563CC0EFE156B
            9E298AE95166971A0DB81234912D384195084F34B863C7B0C4CF5A818AE2AA37
            5BF980801FA8C247FCE4CF95C7178A66ACC0E787FEE897FEE9A7FEEAB7FEEBC7
            FEECFFBF7E5E038AE375F81854B135994BBA7D78980EB1579F35C83CE89CDA00
            986BB70E58A69EFD80931C8BD573F39A71738EB0C949333CAFCB3480C8E06141
            0202000E224CA87021C3860A216070287122C58A162F62CCA87123C78E1E2936
            6880E0018405070A0808F07125CB962E29AA4C1860E6C1992A630A4879932642
            9B377BF20420C06180013101F03C8A344002A4356B06CD19F4E5448854AF62D5
            28C08081030EBD26F46A90E181B206621A1870702C00B60B0718B86A346BC891
            254FA6CCAA772FDFBE7E9142F8DBD1AAE0C22E052470D040714307091F2856BB
            F0408490110A08D5C0E0A087B80522345450D9810297891D04BE5A97A449944A
            0DC3FF8E2D7B36ED84846BE396885872070003188006B080C00400071C1010C0
            60814A050F16203CD04021020D1F8676C8E0DB314304A937FFF63AA0C1830210
            1804280B41AD0109670DA0AF091D0077AAABEFBACEAD7F3FFFFE162104E7DF7E
            014880007C13046012050B2880C0011E00509D790640E040011F2C5041696D65
            6080020B0C5581001894D6C0020F0C509F420A4C804004030C8000830C2860C1
            01152C709E730A48208003143000017CF121E4808A2EDDD75A5E0232D9A493B0
            41E0C106155059A595576299A5965B72D9A5975F6AB9C1420144F0000107E4C4
            000321090980060040509A9A0E7C60804188ADB54101650520C0401638E65803
            1870FF3740020FC4D51601053C60418AE7355040536F2AA7805A873210170739
            5E56A40598A926126B78BDF6A4A9A7A2EA510004B0DAAAABAFC21AABACB3D25A
            ABADB7D6BA1062A002D0157D0595D65B493E02A0C006F0158BC04107288B5002
            814120017DBE59F0014230AA54800492495000025B39A05C84BEC5B9990307F8
            FA66010C0C05400211D1252A7E4BA65AAFBDF7E2BB1F626C11708106E40D5019
            8425B96B64020100D82C000578B098040140785005054C576C800AF53B017216
            93F6DBB8BF19108103CA2AE055C811803580071534206DA87629596ABE33D35C
            B3CD3777C400AFB325492ACE3F031DB4D0341F20196D3DE737B4D24B33DDB4D3
            1221FF4DEFD353535DB5D5A8462DF3D55B73DDB5D77A8904B3CF5F935DB6D967
            5B14F6A849A3DDB6DB6F732D12A625B38D94007B2AC0C00309208040487F031E
            B8E083135EB8E187239EB8E28B33DEB8E38F431EB9E493535EB9E597639EB9E6
            92F73DF7D835DD7D40DE7BF75DBAE9A7A39EBAEAABB3DEBAEBAFC31EBBECB3D3
            5EBBEDB7E39EBBEEBBF3DEBBEFBF03CFBBE775F78977907BF31DBCF2CB33DFBC
            F3CF431FBDF4D3535FBDE9091CAAE3E7760F4080010BE88D3CF6E3935FBEF9E7
            A39FBEFAEBB3DFBEFBEFC31FBFFCF3D35FBFFDF7E39FBFFEFBF3DFBFFFF63FE0
            01CBB1D300A4D6A7EE890E7C105860001BE8C007423082129C20052B68C10B62
            3083FF1ADC20073BE8C10F823084221C21094B68C213A2D0830B3C0F830E4080
            02BEA6287BF2D002C0A7A61BE230873ADC210F7BE8C31F023188421C22118B68
            C4232231894A5C22139BE8C42742318A525C620D15D09502CC4521072CC099B8
            A2802F82318C621C2319CB68C633A2318D6A5C231BDBE8C637C2318E729C231D
            EB68C73BE2318F7ADC231DB9E2422C4AAD2702184001B888AB432232918A5C24
            231BE9C847423292929C24252B69C94B6232938D2C240C89D2A741C22894A21C
            25294B69CA53A23295AA5C252B5BE9CA57C23296B29C252D6B69CB5BE23297BA
            DC252F732915AD69D127C21C26318B69CC63223399CA5C26339BE9CC6742339A
            D29C1E2635AB69CD6B62339BDADC26376D02B76F82339CE21C2739CB694E2605
            04003B}
        end
        object Label66: TLabel
          Left = 35
          Top = 371
          Width = 41
          Height = 15
          Caption = 'Modelo'
        end
        object Label67: TLabel
          Left = 181
          Top = 371
          Width = 92
          Height = 15
          Caption = 'Prefixo C'#243'd.Barra'
        end
        object Label1: TLabel
          Left = 284
          Top = 370
          Width = 37
          Height = 15
          Caption = 'Digitos'
        end
        object DBComboBoxEh12: TDBComboBoxEh
          Left = 35
          Top = 385
          Width = 140
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'MODELO_BALANCA'
          DataSource = dsConfig
          DynProps = <>
          DragCursor = crDefault
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Items.Strings = (
            '01'
            '02'
            '03'
            '04'
            '')
          KeyItems.Strings = (
            '1'
            '2'
            '3'
            '4')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit9: TDBEdit
          Left = 181
          Top = 385
          Width = 90
          Height = 21
          Ctl3D = False
          DataField = 'PREFIXO_BALANCA'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 283
          Top = 385
          Width = 90
          Height = 21
          Ctl3D = False
          DataField = 'ZERO_BALANCA'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object TabEtiquetas: TTabSheet
        Caption = 'Etiquetas'
        ImageIndex = 10
        object PageEtiquetas: TPageControl
          Left = 0
          Top = 0
          Width = 712
          Height = 458
          ActivePage = TabSheet16
          Align = alClient
          TabOrder = 0
          object TabSheet16: TTabSheet
            Caption = 'Lista'
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 704
              Height = 375
              Align = alClient
              DataSource = dsEtiqueta
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
                  FieldName = 'CODIGO'
                  Title.Caption = 'C'#243'digo'
                  Width = 53
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 525
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 0
              Top = 375
              Width = 704
              Height = 53
              Align = alBottom
              TabOrder = 1
              object bbAlterar: TSpeedButton
                Left = 95
                Top = 5
                Width = 85
                Height = 35
                Caption = 'Alterar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Layout = blGlyphTop
                ParentFont = False
                OnClick = bbAlterarClick
              end
              object bbNovo: TSpeedButton
                Left = 4
                Top = 5
                Width = 85
                Height = 35
                Caption = 'Novo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Layout = blGlyphTop
                ParentFont = False
                OnClick = bbNovoClick
              end
            end
          end
          object TabSheet17: TTabSheet
            Caption = 'Configura'#231#245'es'
            ImageIndex = 1
            object Label95: TLabel
              Left = 14
              Top = 12
              Width = 51
              Height = 15
              Caption = 'Descri'#231#227'o'
              FocusControl = DBEdit15
            end
            object Label97: TLabel
              Left = 272
              Top = 55
              Width = 62
              Height = 15
              Caption = 'Barra Altura'
              FocusControl = DBEdit23
            end
            object Label98: TLabel
              Left = 383
              Top = 55
              Width = 70
              Height = 15
              Caption = 'Barra Largura'
              FocusControl = DBEdit24
            end
            object Label99: TLabel
              Left = 496
              Top = 55
              Width = 52
              Height = 15
              Caption = 'Barra Fina'
              FocusControl = DBEdit25
            end
            object Label100: TLabel
              Left = 212
              Top = 97
              Width = 28
              Height = 15
              Caption = 'Porta'
            end
            object Label101: TLabel
              Left = 495
              Top = 97
              Width = 41
              Height = 15
              Caption = 'Modelo'
            end
            object Label96: TLabel
              Left = 445
              Top = 13
              Width = 40
              Height = 15
              Caption = 'Largura'
              FocusControl = DBEdit16
            end
            object Label117: TLabel
              Left = 534
              Top = 12
              Width = 32
              Height = 15
              Caption = 'Altura'
              FocusControl = DBEdit19
            end
            object Label118: TLabel
              Left = 14
              Top = 55
              Width = 48
              Height = 15
              Caption = 'Esquerda'
              FocusControl = DBEdit20
            end
            object Label119: TLabel
              Left = 100
              Top = 55
              Width = 26
              Height = 15
              Caption = 'Topo'
              FocusControl = DBEdit21
            end
            object Label120: TLabel
              Left = 186
              Top = 55
              Width = 43
              Height = 15
              Caption = 'Colunas'
              FocusControl = DBEdit22
            end
            object Label121: TLabel
              Left = 14
              Top = 97
              Width = 75
              Height = 15
              Caption = 'DPI Impress'#227'o'
            end
            object Label122: TLabel
              Left = 105
              Top = 97
              Width = 50
              Height = 15
              Caption = 'BackFeed'
            end
            object DBEdit15: TDBEdit
              Left = 14
              Top = 28
              Width = 416
              Height = 23
              DataField = 'DESCRICAO'
              DataSource = dsEtiqueta
              TabOrder = 0
            end
            object DBEdit23: TDBEdit
              Left = 272
              Top = 70
              Width = 105
              Height = 23
              DataField = 'BARRA_ALTURA'
              DataSource = dsEtiqueta
              MaxLength = 20
              TabOrder = 6
            end
            object DBEdit24: TDBEdit
              Left = 383
              Top = 70
              Width = 106
              Height = 23
              DataField = 'BARRA_LARGURA'
              DataSource = dsEtiqueta
              MaxLength = 20
              TabOrder = 7
            end
            object DBEdit25: TDBEdit
              Left = 495
              Top = 70
              Width = 118
              Height = 23
              DataField = 'BARRA_FINA'
              DataSource = dsEtiqueta
              MaxLength = 20
              TabOrder = 8
            end
            object cbPorta: TDBComboBox
              Left = 212
              Top = 112
              Width = 277
              Height = 23
              DataField = 'PORTA'
              DataSource = dsEtiqueta
              Items.Strings = (
                'LPT1'
                'LPT2'
                'COM1'
                'COM2'
                'COM3'
                '\\localhost\ZEBRA'
                '\\127.0.0.1\ARGOX'
                'Digite a porta')
              TabOrder = 11
            end
            object GroupBox3: TGroupBox
              Left = 14
              Top = 143
              Width = 497
              Height = 169
              Caption = 'Campos'
              TabOrder = 13
              object DBGrid3: TDBGrid
                Left = 2
                Top = 17
                Width = 493
                Height = 150
                Align = alClient
                DataSource = dsCampos
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    PickList.Strings = (
                      'C'#211'DIGO'
                      'DESCRI'#199#195'O'
                      'C'#211'DIGO DE BARRA'
                      'REFER'#202'NCIA'
                      'PRE'#199'O'
                      'PRE'#199'O ATACADO'
                      'LOCALIZA'#199#195'O'
                      'UNIDADE'
                      'GRUPO')
                    Title.Caption = 'Campo'
                    Width = 243
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COLUNA'
                    Title.Caption = 'Coluna'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LINHA'
                    Title.Caption = 'Linha'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FONTES'
                    Title.Caption = 'T.Fonte'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CARACTERES'
                    Title.Caption = 'Caracteres'
                    Visible = True
                  end>
              end
            end
            object DBEdit16: TDBEdit
              Left = 445
              Top = 28
              Width = 80
              Height = 23
              DataField = 'LARGURA'
              DataSource = dsEtiqueta
              TabOrder = 1
            end
            object DBEdit19: TDBEdit
              Left = 533
              Top = 28
              Width = 80
              Height = 23
              DataField = 'ALTURA'
              DataSource = dsEtiqueta
              TabOrder = 2
            end
            object DBEdit20: TDBEdit
              Left = 14
              Top = 70
              Width = 80
              Height = 23
              DataField = 'ESQUERDA'
              DataSource = dsEtiqueta
              TabOrder = 3
            end
            object DBEdit21: TDBEdit
              Left = 100
              Top = 70
              Width = 80
              Height = 23
              DataField = 'TOPO'
              DataSource = dsEtiqueta
              TabOrder = 4
            end
            object DBEdit22: TDBEdit
              Left = 186
              Top = 70
              Width = 80
              Height = 23
              DataField = 'COLUNAS'
              DataSource = dsEtiqueta
              MaxLength = 3
              TabOrder = 5
            end
            object BtnGravaEtq: TButton
              Left = 517
              Top = 212
              Width = 97
              Height = 25
              Caption = 'Gravar'
              TabOrder = 14
              OnClick = BtnGravaEtqClick
            end
            object Button4: TButton
              Left = 516
              Top = 150
              Width = 97
              Height = 25
              Caption = 'Visualizar'
              TabOrder = 15
              OnClick = Button4Click
            end
            object Panel5: TPanel
              Left = 0
              Top = 283
              Width = 704
              Height = 145
              Align = alBottom
              TabOrder = 16
              object Panel6: TPanel
                Left = 22
                Top = 24
                Width = 185
                Height = 113
                TabOrder = 0
                object lbl1: TLabel
                  Left = 5
                  Top = 2
                  Width = 18
                  Height = 15
                  Caption = '001'
                end
                object lbl2: TLabel
                  Left = 5
                  Top = 18
                  Width = 39
                  Height = 15
                  Caption = 'BATATA'
                end
                object lbl3: TLabel
                  Left = 5
                  Top = 34
                  Width = 32
                  Height = 15
                  Caption = '05 UN'
                end
                object lbl4: TLabel
                  Left = 5
                  Top = 51
                  Width = 43
                  Height = 15
                  Caption = 'R$ 10,00'
                end
                object lbl5: TLabel
                  Left = 5
                  Top = 67
                  Width = 61
                  Height = 15
                  Caption = 'REF. 102030'
                end
                object ACBrBarCode1: TACBrBarCode
                  Left = 5
                  Top = 84
                  Width = 100
                  Height = 20
                  Modul = 1
                  Ratio = 2.000000000000000000
                  Typ = bcCodeEAN13
                  ShowTextFont.Charset = DEFAULT_CHARSET
                  ShowTextFont.Color = clWindowText
                  ShowTextFont.Height = -11
                  ShowTextFont.Name = 'Tahoma'
                  ShowTextFont.Style = []
                end
              end
              object Panel7: TPanel
                Left = 215
                Top = 24
                Width = 185
                Height = 113
                TabOrder = 1
                object lbl9: TLabel
                  Left = 5
                  Top = 52
                  Width = 43
                  Height = 15
                  Caption = 'R$ 10,00'
                end
                object lbl8: TLabel
                  Left = 5
                  Top = 35
                  Width = 32
                  Height = 15
                  Caption = '10 UN'
                end
                object lbl7: TLabel
                  Left = 5
                  Top = 19
                  Width = 59
                  Height = 15
                  Caption = 'MELANCIA'
                end
                object lbl6: TLabel
                  Left = 5
                  Top = 3
                  Width = 18
                  Height = 15
                  Caption = '002'
                end
                object lbl10: TLabel
                  Left = 5
                  Top = 68
                  Width = 61
                  Height = 15
                  Caption = 'REF. 102030'
                end
                object ACBrBarCode2: TACBrBarCode
                  Left = 5
                  Top = 85
                  Width = 100
                  Height = 20
                  Modul = 1
                  Ratio = 2.000000000000000000
                  Typ = bcCodeEAN13
                  ShowTextFont.Charset = DEFAULT_CHARSET
                  ShowTextFont.Color = clWindowText
                  ShowTextFont.Height = -11
                  ShowTextFont.Name = 'Tahoma'
                  ShowTextFont.Style = []
                end
              end
              object Panel8: TPanel
                Left = 406
                Top = 24
                Width = 185
                Height = 113
                TabOrder = 2
                object lbl14: TLabel
                  Left = 5
                  Top = 52
                  Width = 43
                  Height = 15
                  Caption = 'R$ 10,00'
                end
                object lbl13: TLabel
                  Left = 5
                  Top = 35
                  Width = 32
                  Height = 15
                  Caption = '10 UN'
                end
                object lbl12: TLabel
                  Left = 5
                  Top = 19
                  Width = 49
                  Height = 15
                  Caption = 'BANANA'
                end
                object lbl11: TLabel
                  Left = 5
                  Top = 3
                  Width = 18
                  Height = 15
                  Caption = '003'
                end
                object lbl15: TLabel
                  Left = 5
                  Top = 68
                  Width = 61
                  Height = 15
                  Caption = 'REF. 102030'
                end
                object ACBrBarCode3: TACBrBarCode
                  Left = 5
                  Top = 85
                  Width = 100
                  Height = 20
                  Modul = 1
                  Ratio = 2.000000000000000000
                  Typ = bcCodeEAN13
                  ShowTextFont.Charset = DEFAULT_CHARSET
                  ShowTextFont.Color = clWindowText
                  ShowTextFont.Height = -11
                  ShowTextFont.Name = 'Tahoma'
                  ShowTextFont.Style = []
                end
              end
            end
            object btnImprimir: TButton
              Left = 517
              Top = 181
              Width = 97
              Height = 25
              Caption = 'Imprimir'
              TabOrder = 17
              OnClick = btnImprimirClick
            end
            object cbDPI: TDBComboBox
              Left = 14
              Top = 112
              Width = 80
              Height = 23
              DataField = 'DPI'
              DataSource = dsEtiqueta
              Items.Strings = (
                'dpi203'
                'dpi300'
                'dpi600')
              TabOrder = 9
            end
            object cbBackFeed: TDBComboBox
              Left = 105
              Top = 112
              Width = 93
              Height = 23
              DataField = 'BACKFEED'
              DataSource = dsEtiqueta
              Items.Strings = (
                'bfNone'
                'bfOn'
                'bfOff')
              TabOrder = 10
            end
            object cbModelo: TDBComboBox
              Left = 495
              Top = 112
              Width = 118
              Height = 23
              DataField = 'MODELO'
              DataSource = dsEtiqueta
              Items.Strings = (
                'etqNenhum'
                'etqPpla'
                'etqPplb'
                'etqZPLI'
                'etqEpl2')
              TabOrder = 12
            end
          end
        end
      end
      object TabSheet21: TTabSheet
        Caption = 'SAT'
        ImageIndex = 11
        object Label83: TLabel
          Left = 26
          Top = 34
          Width = 104
          Height = 15
          Caption = 'C'#243'digo de Ativa'#231#227'o'
          FocusControl = DBEdit35
        end
        object Label94: TLabel
          Left = 145
          Top = 32
          Width = 74
          Height = 15
          Caption = 'Assinatura AC'
          FocusControl = DBEdit36
        end
        object Label124: TLabel
          Left = 26
          Top = 176
          Width = 86
          Height = 15
          Caption = 'Pasta CFe Venda'
          FocusControl = edtCfeVenda
        end
        object Label125: TLabel
          Left = 26
          Top = 224
          Width = 83
          Height = 15
          Caption = 'Pasta CFe Envio'
          FocusControl = edtCfeEnvio
        end
        object Label126: TLabel
          Left = 26
          Top = 272
          Width = 75
          Height = 15
          Caption = 'Pasta CFe PDF'
          FocusControl = edtCfePDF
        end
        object Label130: TLabel
          Left = 26
          Top = 127
          Width = 131
          Height = 15
          Caption = 'Pasta CFe Cancelamento'
          FocusControl = edtCfeCanc
        end
        object btnCFeCanc: TSpeedButton
          Left = 628
          Top = 143
          Width = 23
          Height = 24
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
          OnClick = btnCFeCancClick
        end
        object btnCFeVenda: TSpeedButton
          Left = 630
          Top = 192
          Width = 23
          Height = 24
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
          OnClick = btnCFeVendaClick
        end
        object btnCFeEnvio: TSpeedButton
          Left = 632
          Top = 240
          Width = 23
          Height = 24
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
          OnClick = btnCFeEnvioClick
        end
        object btnCFePDF: TSpeedButton
          Left = 630
          Top = 288
          Width = 23
          Height = 24
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
          OnClick = btnCFePDFClick
        end
        object Label129: TLabel
          Left = 26
          Top = 82
          Width = 101
          Height = 15
          Caption = 'Pasta CFe Schemas'
          FocusControl = edtCFeShemas
        end
        object btnCFeSchemas: TSpeedButton
          Left = 628
          Top = 98
          Width = 23
          Height = 24
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
          OnClick = btnCFeSchemasClick
        end
        object DBEdit35: TDBEdit
          Left = 26
          Top = 51
          Width = 115
          Height = 23
          DataField = 'CODIGO_ATIVACAO'
          DataSource = dsConfig
          MaxLength = 32
          PasswordChar = '*'
          TabOrder = 0
        end
        object DBEdit36: TDBEdit
          Left = 145
          Top = 51
          Width = 513
          Height = 23
          DataField = 'CODIGO_VINCULACAO'
          DataSource = dsConfig
          TabOrder = 1
        end
        object edtCfeVenda: TDBEdit
          Left = 26
          Top = 192
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_VENDA'
          DataSource = dsConfig
          TabOrder = 4
        end
        object edtCfeEnvio: TDBEdit
          Left = 26
          Top = 240
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_ENVIO'
          DataSource = dsConfig
          TabOrder = 5
        end
        object edtCfePDF: TDBEdit
          Left = 26
          Top = 288
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_PDF'
          DataSource = dsConfig
          TabOrder = 6
        end
        object edtCfeCanc: TDBEdit
          Left = 26
          Top = 143
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_CANCELAMENTO'
          DataSource = dsConfig
          TabOrder = 3
        end
        object edtCFeShemas: TDBEdit
          Left = 26
          Top = 98
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_SCHEMA'
          DataSource = dsConfig
          TabOrder = 2
        end
      end
      object TabSheet22: TTabSheet
        Caption = 'MFe'
        ImageIndex = 12
        object Label123: TLabel
          Left = 16
          Top = 16
          Width = 115
          Height = 15
          Caption = 'Chave de Acesso MFe'
          FocusControl = edtChaveMFe
        end
        object Label127: TLabel
          Left = 16
          Top = 60
          Width = 66
          Height = 15
          Caption = 'MFe Entrada'
          FocusControl = edtMFeEntrada
        end
        object btnMFeEntrada: TSpeedButton
          Left = 620
          Top = 76
          Width = 23
          Height = 24
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
          OnClick = btnMFeEntradaClick
        end
        object Label128: TLabel
          Left = 16
          Top = 103
          Width = 54
          Height = 15
          Caption = 'MFe Sa'#237'da'
          FocusControl = edtMFeSaida
        end
        object btnMFeSaida: TSpeedButton
          Left = 620
          Top = 119
          Width = 23
          Height = 24
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
          OnClick = btnMFeSaidaClick
        end
        object edtChaveMFe: TDBEdit
          Left = 16
          Top = 32
          Width = 625
          Height = 23
          DataField = 'CHAVE_ACESSO_MFE'
          DataSource = dsConfig
          TabOrder = 0
        end
        object edtMFeEntrada: TDBEdit
          Left = 16
          Top = 76
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_CANCELAMENTO'
          DataSource = dsConfig
          TabOrder = 1
        end
        object edtMFeSaida: TDBEdit
          Left = 16
          Top = 119
          Width = 600
          Height = 23
          DataField = 'PASTA_CFE_CANCELAMENTO'
          DataSource = dsConfig
          TabOrder = 2
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Email'
        ImageIndex = 12
        object Label3: TLabel
          Left = 43
          Top = 40
          Width = 76
          Height = 15
          Caption = 'Servidor SMTP'
        end
        object Label4: TLabel
          Left = 489
          Top = 40
          Width = 28
          Height = 15
          Caption = 'Porta'
        end
        object Label5: TLabel
          Left = 43
          Top = 80
          Width = 40
          Height = 15
          Caption = 'Usu'#225'rio'
        end
        object Label26: TLabel
          Left = 402
          Top = 80
          Width = 32
          Height = 15
          Caption = 'Senha'
        end
        object edtSmtpHost: TDBEdit
          Left = 43
          Top = 57
          Width = 442
          Height = 21
          Ctl3D = False
          DataField = 'EMAILHOST'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object edtSmtpPort: TDBEdit
          Left = 491
          Top = 57
          Width = 51
          Height = 21
          Ctl3D = False
          DataField = 'EMAILPORTA'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object edtSmtpUser: TDBEdit
          Left = 43
          Top = 97
          Width = 358
          Height = 21
          Ctl3D = False
          DataField = 'EMAILUSER'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit10: TDBEdit
          Left = 404
          Top = 97
          Width = 137
          Height = 21
          Ctl3D = False
          DataField = 'EMAILSENHA'
          DataSource = dsConfig
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object chkSSL: TDBCheckBox
          Left = 43
          Top = 130
          Width = 40
          Height = 17
          Caption = 'SSL'
          DataField = 'EMAILSSL'
          DataSource = dsConfig
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 43
          Top = 153
          Width = 40
          Height = 17
          Caption = 'TLS'
          DataField = 'EMAILTLS'
          DataSource = dsConfig
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object TabSheet11: TTabSheet
        Caption = 'Conex'#227'o'
        ImageIndex = 12
        object PageControl6: TPageControl
          Left = 16
          Top = 3
          Width = 625
          Height = 413
          ActivePage = TabSheet20
          TabOrder = 0
          object TabSheet20: TTabSheet
            Caption = 'Banco MySql'
            ImageIndex = 1
            object Label111: TLabel
              Left = 16
              Top = 1
              Width = 43
              Height = 15
              Caption = 'Servidor'
            end
            object Button3: TButton
              Left = 224
              Top = 344
              Width = 169
              Height = 25
              Caption = 'Testar Conexao'
              TabOrder = 0
              OnClick = Button3Click
            end
            object edtServidor: TEdit
              Left = 16
              Top = 17
              Width = 577
              Height = 23
              TabOrder = 1
            end
            object GroupBox2: TGroupBox
              Left = 16
              Top = 190
              Width = 577
              Height = 146
              Caption = 'Conex'#227'o Licen'#231'a'
              Color = 16514043
              ParentBackground = False
              ParentColor = False
              TabOrder = 2
              object Label115: TLabel
                Left = 16
                Top = 57
                Width = 48
                Height = 15
                Caption = 'Database'
              end
              object Label91: TLabel
                Left = 16
                Top = 97
                Width = 32
                Height = 15
                Caption = 'Senha'
              end
              object Label92: TLabel
                Left = 16
                Top = 16
                Width = 40
                Height = 15
                Caption = 'Usu'#225'rio'
              end
              object edtDataBase_Li: TEdit
                Left = 16
                Top = 73
                Width = 500
                Height = 23
                TabOrder = 0
              end
              object edtSenha_LI: TEdit
                Left = 16
                Top = 111
                Width = 200
                Height = 23
                PasswordChar = '*'
                TabOrder = 1
              end
              object edtUsuario_LI: TEdit
                Left = 16
                Top = 32
                Width = 500
                Height = 23
                TabOrder = 2
              end
            end
            object GroupBox1: TGroupBox
              Left = 16
              Top = 43
              Width = 577
              Height = 139
              Caption = 'Conexao APP'
              Color = 16514043
              ParentBackground = False
              ParentColor = False
              TabOrder = 3
              object Label112: TLabel
                Left = 16
                Top = 13
                Width = 40
                Height = 15
                Caption = 'Usuario'
              end
              object Label114: TLabel
                Left = 16
                Top = 54
                Width = 48
                Height = 15
                Caption = 'Database'
              end
              object Label113: TLabel
                Left = 16
                Top = 91
                Width = 32
                Height = 15
                Caption = 'Senha'
              end
              object edtUsuario_APP: TEdit
                Left = 16
                Top = 28
                Width = 500
                Height = 23
                TabOrder = 0
              end
              object edtSenha_APP: TEdit
                Left = 16
                Top = 105
                Width = 200
                Height = 23
                PasswordChar = '*'
                TabOrder = 1
              end
              object edtDataBase_APP: TEdit
                Left = 16
                Top = 68
                Width = 500
                Height = 23
                TabOrder = 2
              end
            end
          end
          object TabSheet15: TTabSheet
            Caption = 'Atualiza'#231#227'o'
            ImageIndex = 2
            object Label93: TLabel
              Left = 16
              Top = 13
              Width = 183
              Height = 15
              Caption = 'Caminho do Arquivo p/ Download'
            end
            object edtFTP_Caminho: TEdit
              Left = 17
              Top = 28
              Width = 568
              Height = 23
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 531
    Width = 722
    Height = 77
    Align = alBottom
    TabOrder = 1
    object btnGravar: TBitBtn
      Left = 1
      Top = 1
      Width = 75
      Height = 75
      Align = alLeft
      Caption = 'F10 | Gravar'
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FBFAF9D9CEC2AB8E768D6A487C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522F9C7B5FEDE8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCCCBBAD86613E7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7E532FDFD5CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD5CC
        8F6C4C7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFAF8F7B399857C522D7C522E9B7B5EDACEC4FFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9A7654F7E4CAF7E4CAF7E4CAF7E4CAF7E4CA
        F7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4
        CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CA9B76547C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1ECE9A1836A
        7C522D845D3ACEBEB0FEFEFEFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFEDE7E299795C7C522D8D6848E1D7CEFFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D8962
        3DB19170B19170B19170B19170B19170B19170B19170B19170B19170B19170B1
        9170B19170B19170B19170CDB394F1DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE3DB
        D3C3B19FE9E2DBFEFEFEECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D845C38CCB2
        94FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFF0ECE897775A7C522EAA8E77F5F2EFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D865E3ACFB597FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522D99795CEEE8E2ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D8F6845C8AC8EC8AC8EC8AC8EC8AC8EC8AC8E
        C8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EE2CCAFF9E6
        CCFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D926C
        49D4BC9ED4BC9ED4BC9ED4BC9ED4BC9ED6BDA0E3CCB0F6E3C9FAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7D532E8E6945DDC6AAFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7E542FD4BA9DFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D855D39A17E5CA17E5CA17E5CA17E5CA17E5C
        A3815FC2A586F2DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D865E
        3AA58361A58361A58361A58361A58361A58361A58361A58361A58361A58361A5
        8361A58361A58361A58361A58361A58361A58361A58361A58361A58361A58361
        A58361865E3A7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFE0D5CC7E54307C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430E0D6CDFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFEBE5DF9472547C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D957354EBE5DFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF5F2EFDCD1C7D7CABED7CABED7CABED7CABED7CABED7CABE
        D7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CA
        BED7CABED7CABED7CABED7CABED7CABED7CABED7CABEDDD1C7F6F3F0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFDF9F7F6F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9
        F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F6
        FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DAD39470537C522E7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522F927151E4DBD3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2AE
        9D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522DC2AF9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522D7F5631815934815934
        8159348159348159348159348159348159348159348159348159348159348159
        348159348159348159347F56317C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEF0DCC1D4BA9CEAD4B9FAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEA3805F7C52
        2D8D6643F8E5CBFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE88613E7C522D7C522DEFDBC1FAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1EDE7E29A795D
        7C522D8D6848E1D7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D7CF8E69
        4A7C522D99785CEDE8E2F2EDE9A285697C522D845D3ACFBFB1FFFFFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFECFBFB2845D3C7C522DA3856BF2EEEAFAF8F6B39985
        7C522D7C522E9B7B60DACEC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDACDC39B7B5E7C52
        2E7C522DB39B85FAF8F7FFFFFFDFD5CC8F6B4B7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D906C4BDED4CBFFFFFFFFFFFFFDFCFB
        CBBBAC8862407C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D8862
        40CCBBADFDFCFCFFFFFFFFFFFFFFFFFFFCFBFAD9CEC2AA8E768D68487C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D8D6848A88E76D9CEC3FCFBFAFFFFFFFFFFFF}
      Layout = blGlyphTop
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnSair: TBitBtn
      Left = 76
      Top = 1
      Width = 75
      Height = 75
      Align = alLeft
      Caption = 'Esc | Sair'
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF3F0ECDED3CABFAA99A88C73977558845D3B845B39
        916C4E9F7F63C2AF9DE0D5CCF1ECE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EFECD0C1B4A68970875F
        3D7D532E7C522D7C522D7C522D7C522D7C522D7C522D7C532E855E3AA08167D3
        C5B9F7F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE4AB8E78845D3C7C522D7C522D7C522D7C522F845D3C906D4E8F6C4C
        855E3A7C522E7C522D7C522D7C522D86613EAB9078EEE8E3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFBFADFD5CC8C66467C522D7C522D86613EA285
        6BC8B7A8F3F0EDFFFFFFFFFFFFFFFFFFFFFFFFF1ECE8C6B3A39F7F64845D3C7C
        522D7C522D8C6647E2D8CFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDDBD0C58F
        6C4C7C522D7C522D99795CD3C5B9F7F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF4F0EDCFC0B29572547D532E7C522D937051DED4CBFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEE9E39E7F637C522F7D532EA4876CE6DFD7FFFFFFF1EC
        E8ECE5E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E3DDF1EDEAFEFEFEE2
        D9D19E7F637C522E7E532F9D7F63EDE8E2FFFFFFFFFFFFFFFFFFFFFFFFFBFAF8
        EEE9E4E9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3
        DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCEAE3DDA88B727C522D7C
        522DAB9078F6F3F0FEFDFDCBBAAB855F3C7C522DBAA38FF6F3F0FFFFFFFFFFFF
        F3F0EDB299837C522D896342CFC0B4FEFEFEF1ECE8A5876D7C522D7C522DA98C
        75FEFEFEFFFFFFFFFFFFFEFDFDD5C7BB9C7B5F93705093705093705093705093
        7050937050937050937050937050937050937050937050937050937050937050
        937050937050916E507E532E7C522D916C4EEEE9E4FDFCFCD4C6BA865F3D7C52
        2D7C522D825B39BAA491F6F3F0F4F0EDB49C878259357C522D7C522D896342D8
        CCC2FEFEFEE9E2DC8965437C522D7F5734E4DBD4FFFFFFFFFFFFF6F4F1AC907A
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430CB
        BAABFEFDFDD4C7BB8E6A4A7C522D7C522D7C522D7C522D825B39BAA490B19983
        8259357C522D7C522D7C522D7C522D906E4FD9CDC2FEFEFDC2AE9C7C522E7C52
        2DAD927AFEFDFDFFFFFFF4F0EDA68B727C522D8059349575579C7B5F9C7B5F9C
        7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F
        9C7B5F8F6C4C7D542F7C522DA18368F1EDE9E6DED78D68487C522D7F5631AE8E
        6DC1A385845B377C522D7C522D7C522D7C522D865E3AC5A98BA987667E55307C
        522D957254EBE4DEEEE8E49B7B5E7C522D916E4EE7DFD9FFFFFFF4F0EDA68B72
        7C522D906E4FE7DFD8FDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFC
        FBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBC9B8A98159377E5532BEA997FD
        FCFCE3DBD38761407C522D825934BA9C7CF3DFC5C0A283875F3B7C522D7C522D
        8A623EC6AA8CF2DEC4B394738057327C522D8E6A4BE8E0DAFBF9F8B7A08C7E53
        2E845D3ACFBFB1FFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFDBFAA977C522F896342D6CABEFFFFFFF8F6F4BAA4918259357C522D855D
        39C3A788F4E0C6C0A485845C3887603BC7AC8DF5E2C8BB9D7D845B377C522D82
        5B39C1AD9BFAF8F6FFFFFFCEBFB1855D3A7C522FBDA895FFFEFEF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F4AF967F7C522D8F6B4CE4DCD4FF
        FFFFFFFFFFFCFBFBC2AF9E8058347C522D7C532EC4A789F6E3C9EDD8BEF0DCC1
        F5E1C7BC9F7E7C522D7C522D825B37C9B7A7FDFDFDFFFFFFFFFFFFDDD2C88C66
        477C522DB29983F9F7F5F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2EEEBA5886D7C522D926E50EBE5DFFFFFFFFFFFFFFFFFFFFCFCFBB69E897D54
        2F7C522D8D6744DEC7AAFAE8CEFAE8CED9C0A38B64407C522D7F5634BBA592FD
        FDFCFFFFFFFFFFFFFFFFFFE5DCD58F6B4B7C522DAB9078F6F3F1F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EEEBA4886E7C522D926E50E9E2DCFF
        FFFFFFFFFFFFFFFFFEFEFEAD937B7C522F7C522D8E6844E0C9ADFAE8CEFAE8CE
        DAC2A68C65417C522D7D5530B69D88FFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522DAC927AF6F3F1F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F5F4AE947C7C522D8D6847DFD5CCFFFFFFFFFFFFF3F0EDB199837C522D7C52
        2D865E3AD0B799F3DFC4DCC4A8E0C8ACF3E0C5CAAF90845B377C522D7C522DBA
        A38EF6F3F0FFFFFFFFFFFFDACEC38963427C522DB49E88FBF9F9F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFBB9A3907C522E835D39CFC0B2FF
        FFFFF6F3F0B79F8C8259357C522D8A623EC6AB8CF2DEC4BC9F7F875F3B89623E
        C2A687F3DFC5C0A283875F3B7C522D835B39BDA895F7F5F3FFFEFEC8B6A78259
        357E5430C0AC9AFEFDFDF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCFC0B2845D3A7C522FB49E88FAF8F7E2D9D0865F3D7C522D845C38C2A5
        87F5E3C8BB9D7D845B377C522D7C522D855D39C3A788F4E0C6BB9D7D8159347C
        522D8C6647E6DED7F8F6F3B096807D532E876141D6C9BDFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E29472557C522D8E6A4BE4
        DBD3ECE6E099785A7C522F7D532EA2805EB192717C522D7C522D825B38805834
        7C522D7C532EB697779D7A587C522E7E532E9F7F64EFE9E4DFD5CC8864427C52
        2D99795CF2EEEBFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFCB8A18C7C522D7C522DB49C87FDFCFCD8CCC1906E4F7C522D7C53
        2E7C522D7C522D865F3DBFAB99B8A28E825B387C522D7C522D7C532E7C522D95
        7354DDD2C8FCFBFBAB90797C522D7C522DC1AD9CFEFEFEFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0ECE7835B387C522D82
        5B39DCD1C7FCFCFBDDD2C9825B397C522D7C522D825B39BFAA98F8F6F3F6F3F0
        B8A28E8259357C522D7C522D875F3DE2D8D0FEFDFDD4C5B98057337C522D865F
        3DF4F0EDFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4B1A08159377C522D8D6847D9CCC1FBFAF9DCD1C79777
        5A8F6C4CC9B8A8FDFDFDFFFFFFFFFFFFFCFBFBC2AF9E8F6C4B9B7B5EE1D8D1FF
        FFFFE4DCD48F6C4C7C522D845B38CBBAACFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0EDAE957E7F
        56327C532E906C4CCAB9ABFAF9F8ECE6E1E6DED6FEFEFDFFFFFFFFFFFFFFFFFF
        FFFFFFFEFDFCE4DBD4EEE8E4FEFDFDFFFFFFD9CCC28A63427F5633B39B86F5F2
        F0FFFFFFFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDE7E2A184687C522D7C522D865F3DAF967FE9E2
        DCFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6F3F1C9B7A8C4B1A0F1EDE9FFFFFFFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FAF9AF967F835D397C522D7C522D7E5532987759C2AF9DD6C9BDDFD5CCEEE9E4
        FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF7F5F2AE947C7C522D947255F0EBE6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F2C9B8A99B7A5E7C522D7C52
        2D7C522D7C522D7C522D805733A1836AE7DFD9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD9CDC2
        9F7F64C9B8A8FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFCFCEEE8E3C0AC9A9472557F54307C522D7C522D7C522D886442
        D7CBC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEFEBE6CFC0B3C2AE9DB59F8AD2C3B7F9F8F6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD
        F6F2EFF1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1EC
        E8F1ECE8F1ECE8F1EDE9F7F5F3FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAF9F8CBBBACCEBEB0F7F5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEDED4CAAB9078A08167A08167A08167A08167A0
        8167A08167A08167A08167A08167A08167A08167A08167A28468B09880ECE6E1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD3CA7D532E815937D9CEC3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F2B0967F
        7C522E7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522FC6B3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCBBBAD7C522D7C522DCCBDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF9F8F6B9A38F7F57337C522D7C522D805732926D4A93
        6D4A936D4A936D4A936D4A936D4A936D4A936D4A8D67437C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE7E2
        A78C747C522D7C522D835B36C9AE90E8D3B7E8D3B8E8D3B8E8D3B8E8D3B8E8D3
        B8E8D3B8CFB5977C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EDE99B7A5E7C522D7C522D95704DDC
        C4A7FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF0ECE7A88C728057337C522D8E6844D5BB9EFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE5DFA68A717C522D7C
        522D8E6845DEC6A9FAE7CDFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEFEAE699785A7C522D7C522D977250DEC7AAFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBE6A6
        896E7E55327C522D8F6A46D7BEA1FAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE4DEA4876D7C522D7C522D906A47DFC8
        ACFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE59674587C522D7C522D997452E0C9ADDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9E5A2856B7E55327C52
        2D926C49BC9F7F7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE8E1DBA2856B7C522D7C522D865E3A7C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E39372
        547C522D7C522D7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E2A283687E54307C522D7C522D896341
        9676589676589676589676589676589676589676589676589676589676589676
        589676589676589676589676589676589676588C67467C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE8E1DAA081677C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522ED2C4B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E19774587C522E7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F54309E7F63EBE5DFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label69: TLabel
      Left = 1
      Top = 1
      Width = 720
      Height = 15
      Align = alTop
      Caption = 'Empresa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 48
    end
    object edtEmp: TDBEdit
      Left = 1
      Top = 16
      Width = 720
      Height = 24
      TabStop = False
      Align = alClient
      DataField = 'FANTASIA'
      DataSource = dsEmpresa
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 25
    end
  end
  object dsConfig: TDataSource
    DataSet = Dados.qryConfig
    Left = 216
    Top = 256
  end
  object dsEmitente: TDataSource
    DataSet = Dados.qryEmpresa
    Left = 216
    Top = 312
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
    Left = 408
    Top = 376
  end
  object dsEmpresa: TDataSource
    DataSet = Dados.qryEmpresa
    Left = 440
    Top = 256
  end
  object dsSped: TDataSource
    DataSet = Dados.qrySped_Config
    Left = 280
    Top = 256
  end
  object dsEtiqueta: TDataSource
    DataSet = Dados.qryEtiqueta
    OnDataChange = dsEtiquetaDataChange
    Left = 544
    Top = 256
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 328
    Top = 240
  end
  object dsCampos: TDataSource
    DataSet = Dados.qryEtq_Campos
    Left = 488
    Top = 256
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 256
  end
  object dsSistema: TDataSource
    DataSet = Dados.qryParametro
    Left = 392
    Top = 256
  end
  object ACBrETQ: TACBrETQ
    Porta = 'LPT1'
    Ativo = False
    Left = 328
    Top = 400
  end
  object dsIdiomas: TDataSource
    DataSet = Dados.qryIdiomas
    Left = 344
    Top = 256
  end
end
