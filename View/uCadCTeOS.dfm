object frmCadCTeOS: TfrmCadCTeOS
  Left = 0
  Top = 0
  ActiveControl = DBEdit8
  BorderStyle = bsSingle
  Caption = 'Cadastro de CTe OS'
  ClientHeight = 487
  ClientWidth = 618
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 404
    Align = alClient
    Color = 15724527
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 83
    object Label2: TLabel
      Left = 96
      Top = 9
      Width = 95
      Height = 13
      Caption = 'Tomador do Servi'#231'o'
    end
    object Label6: TLabel
      Left = 15
      Top = 124
      Width = 96
      Height = 13
      Caption = 'Munic'#237'po de Origem '
    end
    object Label8: TLabel
      Left = 511
      Top = 126
      Width = 50
      Height = 13
      Caption = 'UF Origem'
    end
    object Label1: TLabel
      Left = 15
      Top = 46
      Width = 75
      Height = 13
      Caption = 'Transportadora'
    end
    object Label3: TLabel
      Left = 15
      Top = 84
      Width = 27
      Height = 13
      Caption = 'CFOP'
    end
    object Label4: TLabel
      Left = 15
      Top = 164
      Width = 95
      Height = 13
      Caption = 'Munic'#237'po de Destino'
    end
    object Label5: TLabel
      Left = 511
      Top = 166
      Width = 52
      Height = 13
      Caption = 'UF Destino'
    end
    object Label12: TLabel
      Left = 15
      Top = 8
      Width = 59
      Height = 13
      Caption = 'N'#250'mero CTe'
      FocusControl = DBEdit8
    end
    object DBComboBoxEh1: TDBComboBoxEh
      Left = 511
      Top = 139
      Width = 72
      Height = 21
      Ctl3D = False
      DataField = 'UFINI'
      DataSource = dsCTe
      DynProps = <>
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
      KeyItems.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 96
      Top = 23
      Width = 485
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'FKTOMADOR'
      DataSource = dsCTe
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'RAZAO'
      ListSource = dsTomador
      ParentFont = False
      TabOrder = 1
      Visible = True
      OnEnter = DBLookupComboboxEh1Enter
      OnExit = DBLookupComboboxEh1Exit
      OnKeyPress = DBLookupComboboxEh1KeyPress
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 15
      Top = 61
      Width = 566
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'FKTRANSPORTADOR'
      DataSource = dsCTe
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = dsTransp
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnEnter = DBLookupComboboxEh1Enter
      OnExit = DBLookupComboboxEh1Exit
      OnKeyPress = DBLookupComboboxEh1KeyPress
    end
    object DBLookupComboboxEh3: TDBLookupComboboxEh
      Left = 15
      Top = 99
      Width = 567
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'CFOP'
      DataSource = dsCTe
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsCFOP
      ParentFont = False
      TabOrder = 3
      Visible = True
      OnEnter = DBLookupComboboxEh1Enter
      OnExit = DBLookupComboboxEh1Exit
      OnKeyPress = DBLookupComboboxEh1KeyPress
    end
    object DBLookupComboboxEh4: TDBLookupComboboxEh
      Left = 15
      Top = 139
      Width = 490
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'CODMUNINI'
      DataSource = dsCTe
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO;UF'
      ListSource = dsCidadeOrigem
      ParentFont = False
      TabOrder = 4
      Visible = True
      OnEnter = DBLookupComboboxEh1Enter
      OnExit = DBLookupComboboxEh4Exit
      OnKeyPress = DBLookupComboboxEh1KeyPress
    end
    object DBLookupComboboxEh5: TDBLookupComboboxEh
      Left = 15
      Top = 179
      Width = 490
      Height = 21
      Ctl3D = False
      ParentCtl3D = False
      DynProps = <>
      DataField = 'CODMUNFIM'
      DataSource = dsCTe
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO;UF'
      ListSource = dsCidadeD
      ParentFont = False
      TabOrder = 6
      Visible = True
      OnEnter = DBLookupComboboxEh1Enter
      OnExit = DBLookupComboboxEh5Exit
      OnKeyPress = DBLookupComboboxEh1KeyPress
    end
    object DBComboBoxEh2: TDBComboBoxEh
      Left = 511
      Top = 179
      Width = 72
      Height = 21
      Ctl3D = False
      DataField = 'UFFIM'
      DataSource = dsCTe
      DynProps = <>
      DropDownBox.AutoDrop = True
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
      KeyItems.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      Visible = True
    end
    object DBEdit8: TDBEdit
      Left = 15
      Top = 23
      Width = 79
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'NUMERO'
      DataSource = dsCTe
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object PageControl1: TPageControl
      Left = 15
      Top = 206
      Width = 568
      Height = 140
      ActivePage = TabSheet1
      TabOrder = 8
      object TabSheet1: TTabSheet
        Caption = 'Descri'#231#227'o do Servi'#231'o'
        object Label18: TLabel
          Left = 14
          Top = 12
          Width = 99
          Height = 13
          Caption = 'Descri'#231#227'o do Servi'#231'o'
          FocusControl = DBEdit10
        end
        object Label19: TLabel
          Left = 14
          Top = 52
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = DBEdit11
        end
        object Label25: TLabel
          Left = 127
          Top = 52
          Width = 73
          Height = 13
          Caption = 'Tipo de Servi'#231'o'
        end
        object DBEdit10: TDBEdit
          Left = 14
          Top = 27
          Width = 523
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'DESCRICAOSERVICO'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 30
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 14
          Top = 67
          Width = 107
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'QTD'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBComboBoxEh4: TDBComboBoxEh
          Left = 127
          Top = 67
          Width = 135
          Height = 21
          Ctl3D = False
          DataField = 'TIPOSERVICO'
          DataSource = dsCTe
          DynProps = <>
          DropDownBox.AutoDrop = True
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'Normal'
            'Subcontratacao'
            'Redespacho'
            'Intermediario'
            'Multimodal'
            'TranspPessoas'
            'TranspValores'
            'ExcessoBagagem ')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Totais'
        ImageIndex = 1
        object Label7: TLabel
          Left = 52
          Top = 20
          Width = 66
          Height = 13
          Caption = 'Total Servi'#231'o:'
          FocusControl = DBEdit1
        end
        object Label9: TLabel
          Left = 52
          Top = 60
          Width = 80
          Height = 13
          Caption = 'Valor '#224' Receber:'
          FocusControl = DBEdit2
        end
        object Label11: TLabel
          Left = 150
          Top = 60
          Width = 61
          Height = 13
          Caption = 'Valor Cofins:'
          FocusControl = DBEdit4
        end
        object Label10: TLabel
          Left = 150
          Top = 20
          Width = 44
          Height = 13
          Caption = 'Valor Pis:'
          FocusControl = DBEdit3
        end
        object Label14: TLabel
          Left = 248
          Top = 20
          Width = 54
          Height = 13
          Caption = 'Valor INSS:'
          FocusControl = DBEdit5
        end
        object Label15: TLabel
          Left = 248
          Top = 60
          Width = 42
          Height = 13
          Caption = 'Valor IR:'
          FocusControl = DBEdit6
        end
        object Label17: TLabel
          Left = 346
          Top = 60
          Width = 85
          Height = 13
          Caption = 'Totais de Tributo:'
          FocusControl = DBEdit9
        end
        object Label16: TLabel
          Left = 346
          Top = 20
          Width = 51
          Height = 13
          Caption = 'Valor CLSS'
          FocusControl = DBEdit7
        end
        object DBEdit1: TDBEdit
          Left = 52
          Top = 35
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'TOTAL'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 52
          Top = 75
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'RECEBIDO'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 150
          Top = 75
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VCOFINS'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 150
          Top = 35
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VPIS'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 248
          Top = 35
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VINSS'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 248
          Top = 75
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VIR'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 346
          Top = 75
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VTOTTIRB'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit7: TDBEdit
          Left = 346
          Top = 35
          Width = 92
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'VCLSS'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Adicionais'
        ImageIndex = 2
        object Label20: TLabel
          Left = 18
          Top = 4
          Width = 98
          Height = 13
          Caption = 'Responsavel Seguro'
        end
        object Label21: TLabel
          Left = 156
          Top = 4
          Width = 49
          Height = 13
          Caption = 'N'#186' Ap'#243'lice'
          FocusControl = DBEdit13
        end
        object Label22: TLabel
          Left = 286
          Top = 4
          Width = 56
          Height = 13
          Caption = 'Seguradora'
          FocusControl = DBEdit14
        end
        object Label23: TLabel
          Left = 18
          Top = 46
          Width = 19
          Height = 13
          Caption = 'TAF'
          FocusControl = DBEdit15
        end
        object Label24: TLabel
          Left = 149
          Top = 46
          Width = 99
          Height = 13
          Caption = 'N'#186' Registro Estadual'
          FocusControl = DBEdit16
        end
        object DBComboBoxEh3: TDBComboBoxEh
          Left = 18
          Top = 19
          Width = 135
          Height = 21
          Ctl3D = False
          DataField = 'RESPSEG'
          DataSource = dsCTe
          DynProps = <>
          DropDownBox.AutoDrop = True
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'Remetente'
            'Expedidor'
            'Recebedor'
            'Destinatario'
            'EmitenteCTe'
            'TomadorServico')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object DBEdit13: TDBEdit
          Left = 156
          Top = 19
          Width = 125
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'NAPOLICE'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 286
          Top = 19
          Width = 256
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'XSEG'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 18
          Top = 61
          Width = 125
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'TAF'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit16: TDBEdit
          Left = 149
          Top = 61
          Width = 393
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'NROREGESTADUAL'
          DataSource = dsCTe
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 404
    Width = 618
    Height = 83
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 0
    object btnGravar: TSpeedButton
      Left = 15
      Top = 6
      Width = 80
      Height = 70
      Caption = 'F5 | Gravar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 101
      Top = 6
      Width = 80
      Height = 70
      Caption = 'Esc | Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object dsCTe: TDataSource
    DataSet = qryCte
    Left = 104
    Top = 192
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 456
    Top = 32
  end
  object dsCidadeOrigem: TDataSource
    DataSet = qryCidadeO
    Left = 344
    Top = 176
  end
  object qryTomador: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from tomador'
      'ORDER BY RAZAO')
    Left = 200
    Top = 144
    object qryTomadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTomadorRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 50
    end
    object qryTomadorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 50
    end
    object qryTomadorFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 14
    end
    object qryTomadorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryTomadorNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryTomadorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qryTomadorCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
    end
    object qryTomadorMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Size = 40
    end
    object qryTomadorUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryTomadorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryTomadorFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryTomadorTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 10
    end
    object qryTomadorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryTomadorIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
  end
  object qryTransp: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from TRANSPORTADORA'
      'order by nome')
    Left = 264
    Top = 144
    object qryTranspCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTranspPESSOA: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      Size = 10
    end
    object qryTranspCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryTranspIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qryTranspNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryTranspAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 40
    end
    object qryTranspENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryTranspNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryTranspBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qryTranspCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = 'COD_CIDADE'
    end
    object qryTranspCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 45
    end
    object qryTranspUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryTranspCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryTranspPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 7
    end
    object qryTranspUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Origin = 'UFPLACA'
      Size = 2
    end
    object qryTranspRNTC: TStringField
      FieldName = 'RNTC'
      Origin = 'RNTC'
      Size = 10
    end
    object qryTranspATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryTranspEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object qryTranspRENAVAM: TStringField
      FieldName = 'RENAVAM'
      Origin = 'RENAVAM'
    end
  end
  object qryCFOP: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from cfop'
      'WHERE'
      'ATIVO='#39'S'#39' AND'
      'TIPO='#39'S'#39)
    Left = 144
    Top = 144
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
  object qryCte: TFDQuery
    BeforeOpen = qryCteBeforeOpen
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select cte.* from cte_master cte'
      'where'
      'codigo=:cod')
    Left = 101
    Top = 144
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCteFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryCteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryCteCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryCteCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object qryCteMODELO: TIntegerField
      FieldName = 'MODELO'
      Origin = 'MODELO'
    end
    object qryCteSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'SERIE'
    end
    object qryCteCODMUNENVIO: TIntegerField
      FieldName = 'CODMUNENVIO'
      Origin = 'CODMUNENVIO'
    end
    object qryCteMUNICIPIOENVIO: TStringField
      FieldName = 'MUNICIPIOENVIO'
      Origin = 'MUNICIPIOENVIO'
      Size = 40
    end
    object qryCteUFENVIO: TStringField
      FieldName = 'UFENVIO'
      Origin = 'UFENVIO'
      Size = 2
    end
    object qryCteTIPOSERVICO: TIntegerField
      FieldName = 'TIPOSERVICO'
      Origin = 'TIPOSERVICO'
    end
    object qryCteCODMUNINI: TIntegerField
      FieldName = 'CODMUNINI'
      Origin = 'CODMUNINI'
    end
    object qryCteMUNICIPIOINI: TStringField
      FieldName = 'MUNICIPIOINI'
      Origin = 'MUNICIPIOINI'
      Size = 40
    end
    object qryCteUFINI: TStringField
      FieldName = 'UFINI'
      Origin = 'UFINI'
      Size = 2
    end
    object qryCteCODMUNFIM: TIntegerField
      FieldName = 'CODMUNFIM'
      Origin = 'CODMUNFIM'
    end
    object qryCteMINICIPIOFIM: TStringField
      FieldName = 'MINICIPIOFIM'
      Origin = 'MINICIPIOFIM'
      Size = 40
    end
    object qryCteUFFIM: TStringField
      FieldName = 'UFFIM'
      Origin = 'UFFIM'
      Size = 2
    end
    object qryCteDESCRICAOSERVICO: TStringField
      FieldName = 'DESCRICAOSERVICO'
      Origin = 'DESCRICAOSERVICO'
      Size = 120
    end
    object qryCteRESPSEG: TIntegerField
      FieldName = 'RESPSEG'
      Origin = 'RESPSEG'
    end
    object qryCteXSEG: TStringField
      FieldName = 'XSEG'
      Origin = 'XSEG'
      Size = 50
    end
    object qryCteNAPOLICE: TStringField
      FieldName = 'NAPOLICE'
      Origin = 'NAPOLICE'
    end
    object qryCteTAF: TStringField
      FieldName = 'TAF'
      Origin = 'TAF'
    end
    object qryCteNROREGESTADUAL: TStringField
      DisplayWidth = 25
      FieldName = 'NROREGESTADUAL'
      Origin = 'NROREGESTADUAL'
      Size = 25
    end
    object qryCteTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 10
    end
    object qryCteSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryCteFKTOMADOR: TIntegerField
      FieldName = 'FKTOMADOR'
      Origin = 'FKTOMADOR'
    end
    object qryCteFKTRANSPORTADOR: TIntegerField
      FieldName = 'FKTRANSPORTADOR'
      Origin = 'FKTRANSPORTADOR'
    end
    object qryCtePROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryCteXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryCteDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCteHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qryCteTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteRECEBIDO: TFMTBCDField
      FieldName = 'RECEBIDO'
      Origin = 'RECEBIDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVPIS: TFMTBCDField
      FieldName = 'VPIS'
      Origin = 'VPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVCOFINS: TFMTBCDField
      FieldName = 'VCOFINS'
      Origin = 'VCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVINSS: TFMTBCDField
      FieldName = 'VINSS'
      Origin = 'VINSS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVIR: TFMTBCDField
      FieldName = 'VIR'
      Origin = 'VIR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVCLSS: TFMTBCDField
      FieldName = 'VCLSS'
      Origin = 'VCLSS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteVTOTTIRB: TFMTBCDField
      FieldName = 'VTOTTIRB'
      Origin = 'VTOTTIRB'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryCteQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryCteFINALIDADE: TIntegerField
      FieldName = 'FINALIDADE'
      Origin = 'FINALIDADE'
    end
    object qryCteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 1
    end
    object qryCteDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object qryCteTOMADOR: TStringField
      FieldName = 'TOMADOR'
      Origin = 'TOMADOR'
      Size = 15
    end
    object qryCteFK_DESTINATARIO: TIntegerField
      FieldName = 'FK_DESTINATARIO'
      Origin = 'FK_DESTINATARIO'
    end
    object qryCteFK_VEICULO: TStringField
      FieldName = 'FK_VEICULO'
      Origin = 'FK_VEICULO'
      Size = 7
    end
    object qryCteOBS_FISCO: TMemoField
      FieldName = 'OBS_FISCO'
      Origin = 'OBS_FISCO'
      BlobType = ftMemo
    end
    object qryCteOBS_CONTRIBUINTE: TMemoField
      FieldName = 'OBS_CONTRIBUINTE'
      Origin = 'OBS_CONTRIBUINTE'
      BlobType = ftMemo
    end
    object qryCteVALOR_SERVICO: TFMTBCDField
      FieldName = 'VALOR_SERVICO'
      Origin = 'VALOR_SERVICO'
      Precision = 18
      Size = 2
    end
    object qryCteVALOR_CARGA: TFMTBCDField
      FieldName = 'VALOR_CARGA'
      Origin = 'VALOR_CARGA'
      Precision = 18
      Size = 2
    end
    object qryCteCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      Size = 3
    end
    object qryCteALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Origin = 'ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object qryCteBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object qryCteVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object qryCteOUTROS_TRIBUTOS: TFMTBCDField
      FieldName = 'OUTROS_TRIBUTOS'
      Origin = 'OUTROS_TRIBUTOS'
      Precision = 18
      Size = 2
    end
    object qryCteMETRAGEM: TStringField
      FieldName = 'METRAGEM'
      Origin = 'METRAGEM'
      Size = 3
    end
    object qryCteFK_REMETENTE: TIntegerField
      FieldName = 'FK_REMETENTE'
      Origin = 'FK_REMETENTE'
    end
    object qryCteCHAVE_REFERENCIADA: TStringField
      FieldName = 'CHAVE_REFERENCIADA'
      Origin = 'CHAVE_REFERENCIADA'
      Size = 44
    end
    object qryCteNAVERBACAO: TStringField
      FieldName = 'NAVERBACAO'
      Origin = 'NAVERBACAO'
    end
    object qryCteCNPJ_SEGURADORA: TStringField
      FieldName = 'CNPJ_SEGURADORA'
      Origin = 'CNPJ_SEGURADORA'
    end
    object qryCtePESOL: TFMTBCDField
      FieldName = 'PESOL'
      Origin = 'PESOL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryCtePESOB: TFMTBCDField
      FieldName = 'PESOB'
      Origin = 'PESOB'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
  end
  object dsCFOP: TDataSource
    DataSet = qryCFOP
    Left = 151
    Top = 194
  end
  object dsTransp: TDataSource
    DataSet = qryTransp
    Left = 272
    Top = 184
  end
  object dsTomador: TDataSource
    DataSet = qryTomador
    Left = 208
    Top = 192
  end
  object qryCidadeO: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from cidade'
      'order by descricao')
    Left = 344
    Top = 136
    object qryCidadeOCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCidadeODESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object qryCidadeOCODUF: TIntegerField
      FieldName = 'CODUF'
      Origin = 'CODUF'
    end
    object qryCidadeOUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object qryCidadeD: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select * from cidade'
      'order by descricao')
    Left = 400
    Top = 136
    object qryCidadeDCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCidadeDDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object qryCidadeDCODUF: TIntegerField
      FieldName = 'CODUF'
      Origin = 'CODUF'
    end
    object qryCidadeDUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object dsCidadeD: TDataSource
    DataSet = qryCidadeD
    Left = 400
    Top = 176
  end
end
