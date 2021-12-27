inherited frmCBRcadastro: TfrmCBRcadastro
  Caption = 'CBR'
  ClientHeight = 434
  ClientWidth = 744
  ExplicitWidth = 760
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 15
  object Label6: TLabel [0]
    Left = 461
    Top = 119
    Width = 86
    Height = 13
    Caption = 'Forma de emiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label17: TLabel [1]
    Left = 439
    Top = 205
    Width = 48
    Height = 13
    Caption = 'Acr'#233'scimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  inherited pnlComandos: TPanel
    Top = 353
    Width = 738
    ExplicitTop = 353
    ExplicitWidth = 738
    inherited btnCancelar: TJvSpeedButton
      ExplicitLeft = 694
    end
  end
  inherited pageDefault: TJvPageControl
    Width = 738
    Height = 344
    ExplicitWidth = 738
    ExplicitHeight = 344
    inherited tabDefault: TTabSheet
      Caption = 'Lan'#231'amento Simples'
      ExplicitWidth = 730
      ExplicitHeight = 314
      object JvPageControl1: TJvPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 724
        Height = 308
        Align = alClient
        TabOrder = 0
        TabStop = False
      end
      object JvgGroupBox3: TJvgGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 724
        Height = 308
        Align = alClient
        Caption = 'Dados Principais'
        TabOrder = 1
        Border.Inner = bvSpace
        Border.Outer = bvNone
        Border.Bold = False
        CaptionBorder.Inner = bvSpace
        CaptionBorder.Outer = bvNone
        CaptionBorder.Bold = False
        CaptionGradient.Active = False
        CaptionGradient.Orientation = fgdHorizontal
        CaptionShift.X = 8
        CaptionShift.Y = 0
        Colors.Text = clHighlightText
        Colors.TextActive = clHighlightText
        Colors.Caption = clBtnShadow
        Colors.CaptionActive = clBtnShadow
        Colors.Client = clBtnFace
        Colors.ClientActive = clBtnFace
        Gradient.FromColor = clBlack
        Gradient.ToColor = clGray
        Gradient.Active = False
        Gradient.Orientation = fgdHorizontal
        Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
        FullHeight = 0
        object Label2: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 21
          Width = 714
          Height = 13
          Align = alTop
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExplicitWidth = 33
        end
        object Label1: TLabel
          Left = 5
          Top = 106
          Width = 117
          Height = 13
          Caption = 'Hist'#243'rico do Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 612
          Top = 19
          Width = 64
          Height = 13
          Caption = 'Data Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label13: TLabel
          Left = 612
          Top = 62
          Width = 81
          Height = 13
          Caption = 'Data Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 422
          Top = 148
          Width = 48
          Height = 13
          Caption = 'Acr'#233'scimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label18: TLabel
          Left = 522
          Top = 148
          Width = 53
          Height = 13
          Caption = 'Valor Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 622
          Top = 148
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 553
          Top = 105
          Width = 66
          Height = 13
          Caption = 'Valor Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 502
          Top = 19
          Width = 70
          Height = 13
          Caption = 'Data Cadastro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label14: TLabel
          Left = 322
          Top = 148
          Width = 45
          Height = 13
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object HISTORICO: TJvDBMaskEdit
          Left = 5
          Top = 121
          Width = 542
          Height = 23
          CharCase = ecUpperCase
          DataField = 'HISTORICO'
          DataSource = dtsDefault
          TabOrder = 4
          EditMask = ''
        end
        object DTCADASTRO: TJvDBDateTimePicker
          Left = 612
          Top = 35
          Width = 104
          Height = 23
          Date = 43719.000000000000000000
          Time = 0.600087071761663500
          TabOrder = 1
          DropDownDate = 43177.000000000000000000
          DataField = 'DTCADASTRO'
          DataSource = dtsDefault
        end
        object ID_PESSOA: TJvDBLookupCombo
          Left = 5
          Top = 35
          Width = 491
          Height = 22
          DataField = 'ID_PESSOA'
          DataSource = dtsDefault
          LookupField = 'ID_PESSOA'
          LookupDisplay = 'RAZAOSOCIAL'
          LookupSource = dtsqryPESSOAS
          TabOrder = 3
        end
        object DTVENCIMENTO: TJvDBDateTimePicker
          Left = 612
          Top = 78
          Width = 104
          Height = 23
          Date = 43719.000000000000000000
          Time = 0.600087060185615000
          TabOrder = 2
          DropDownDate = 43177.000000000000000000
          DataField = 'DTVENCIMENTO'
          DataSource = dtsDefault
        end
        object VLDESCONTO: TJvDBCalcEdit
          Left = 322
          Top = 164
          Width = 94
          Height = 23
          DecimalPlaceRound = True
          DisplayFormat = '#0.00'
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          DataField = 'VLDESCONTO'
          DataSource = dtsDefault
        end
        object VLACRESCIMO: TJvDBCalcEdit
          Left = 422
          Top = 164
          Width = 94
          Height = 23
          DecimalPlaceRound = True
          DisplayFormat = '#0.00'
          ShowButton = False
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          DataField = 'VLACRESCIMO'
          DataSource = dtsDefault
        end
        object calc_VlrTotal: TJvDBCalcEdit
          Left = 622
          Top = 164
          Width = 94
          Height = 23
          DecimalPlaceRound = True
          DisplayFormat = '#0.00'
          ShowButton = False
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          DataField = 'calc_VlrTotal'
          DataSource = dtsDefault
        end
        object JvgGroupBox2: TJvgGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 188
          Width = 714
          Height = 115
          Align = alBottom
          Caption = 'Observa'#231#245'es sobre o Lan'#231'amento'
          TabOrder = 10
          Border.Inner = bvSpace
          Border.Outer = bvNone
          Border.Bold = False
          CaptionBorder.Inner = bvSpace
          CaptionBorder.Outer = bvNone
          CaptionBorder.Bold = False
          CaptionGradient.Active = False
          CaptionGradient.Orientation = fgdHorizontal
          CaptionShift.X = 8
          CaptionShift.Y = 0
          Colors.Text = clHighlightText
          Colors.TextActive = clHighlightText
          Colors.Caption = clBtnShadow
          Colors.CaptionActive = clBtnShadow
          Colors.Client = clBtnFace
          Colors.ClientActive = clBtnFace
          Gradient.FromColor = clBlack
          Gradient.ToColor = clGray
          Gradient.Active = False
          Gradient.Orientation = fgdHorizontal
          Options = [fgoCanCollapse, fgoFilledCaption, fgoFluentlyCollapse, fgoFluentlyExpand, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
          FullHeight = 0
          object OBS: TDBMemo
            AlignWithMargins = True
            Left = 5
            Top = 21
            Width = 704
            Height = 89
            Align = alClient
            DataField = 'OBS'
            DataSource = dtsDefault
            TabOrder = 0
          end
        end
        object VALOR: TJvDBCalcEdit
          Left = 553
          Top = 121
          Width = 163
          Height = 23
          DecimalPlaceRound = True
          DisplayFormat = '#0.00'
          ShowButton = False
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          DataField = 'VALOR'
          DataSource = dtsDefault
        end
        object JvDBDateTimePicker2: TJvDBDateTimePicker
          Left = 502
          Top = 35
          Width = 104
          Height = 23
          Date = 43719.000000000000000000
          Time = 0.600087037033517800
          Enabled = False
          TabOrder = 0
          DropDownDate = 43177.000000000000000000
          DataField = 'DTCADASTRO'
          DataSource = dtsDefault
        end
        object VLJURO: TJvDBCalcEdit
          Left = 522
          Top = 164
          Width = 94
          Height = 23
          DecimalPlaceRound = True
          DisplayFormat = '#0.00'
          ShowButton = False
          TabOrder = 8
          DecimalPlacesAlwaysShown = False
          DataField = 'VLJURO'
          DataSource = dtsDefault
        end
        object REMESSA_REENVIAR: TJvDBCheckBox
          Left = 5
          Top = 149
          Width = 148
          Height = 17
          Caption = 'Marcar para Renviar'
          DataField = 'REMESSA_REENVIAR'
          DataSource = dtsDefault
          TabOrder = 11
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 421
    Top = 24
  end
  inherited dtsDefault: TDataSource
    DataSet = dtmCBR.tabCBR_TITULOS
    Left = 286
    Top = 24
  end
  object dtsqryPESSOAS: TDataSource
    DataSet = dtmCBR.qryPESSOAS
    Left = 321
    Top = 57
  end
end
