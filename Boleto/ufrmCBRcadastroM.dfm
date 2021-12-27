inherited frmCBRcadastroM: TfrmCBRcadastroM
  Caption = 'CBR'
  ClientHeight = 577
  ClientWidth = 744
  ExplicitWidth = 760
  ExplicitHeight = 615
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
    Top = 482
    Width = 738
    ExplicitTop = 482
    ExplicitWidth = 738
    inherited btnCancelar: TJvSpeedButton
      ExplicitLeft = 694
    end
    object btnGeraParcelas: TJvSpeedButton
      AlignWithMargins = True
      Left = 625
      Top = 3
      Width = 110
      Height = 86
      Hint = 'Confirma opera'#231#227'o atual'
      Align = alRight
      Caption = 'Gera Parcelas'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000251A0F33B8824DFF251A0F33000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FFFFFFFFFFF1E6
        DBFFB8824DFFB8824DFFB8824DFFFFFFFFFF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6DBFFB882
        4DFFB8824DFFB8824DFFF1E6DBFFFFFFFFFF0000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6DBFFB8824DFFB882
        4DFFB8824DFFF1E6DBFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFFFFFFFFFFEFEFFFFFFFFFFFFF1E6DBFFB8824DFFFFFFFFFFB882
        4DFFF1E6DBFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000848484FFF0F6FCFFA1CBEFFFF1E6DBFFB8824DFFFFFFFFFFB8824DFFF1E6
        DBFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
        0000FEFFFFFF8CC0EBFF65AAE5FFD5C5B5FFFFFFFFFFB8824DFFF1E6DBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000345A7A884578
        A3B67EB8E9FF68B4E8FF6AB6E9FF9BC8EEFFCDC3B8FFF1E6DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000182A394060A6
        E1FC6FBFECFF72C4EEFF72C4EEFF6BB8EAFF64ACE6FF91C2ECFFFCFDFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000365E
        7F8E6AB8EAFF72C4EEFF72C4EEFF68B4E8FF86BCEAFFF2F8FDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000003860
        83926BB8EAFF6DBBEBFF72C3EEFF61A9E4FFFBFDFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000004F89
        BAD06CAEE6FF93C3ECFF65AAE5FF61A8E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FF848484FF848484FF848484FF0000000000000000010102021B2E
        3F46FCFDFEFFFFFFFFFFE6F1FBFF86BCEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
        0000848484FFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
        0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
        83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Layout = blGlyphLeft
      OnClick = btnGeraParcelasClick
      ExplicitLeft = 578
      ExplicitHeight = 27
    end
  end
  inherited pageDefault: TJvPageControl
    Width = 738
    Height = 473
    ExplicitWidth = 738
    ExplicitHeight = 473
    inherited tabDefault: TTabSheet
      Caption = 'Lan'#231'amento M'#250'ltiplo'
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 730
      ExplicitHeight = 443
      object JvgGroupBox1: TJvgGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 724
        Height = 437
        Align = alClient
        Caption = 'Dados Principais'
        TabOrder = 0
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
        object Label7: TLabel
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
        object Label8: TLabel
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
        object Label9: TLabel
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
        object Label10: TLabel
          Left = 612
          Top = 62
          Width = 69
          Height = 13
          Caption = '1'#186' Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 553
          Top = 106
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
        object Label21: TLabel
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
        object Label23: TLabel
          Left = 502
          Top = 62
          Width = 71
          Height = 13
          Caption = 'Interv. de dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 392
          Top = 62
          Width = 75
          Height = 13
          Caption = 'Nu. de Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 5
          Top = 148
          Width = 66
          Height = 13
          Caption = 'Observa'#231#245'es '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object ID_PESSOA: TJvDBLookupCombo
          Left = 5
          Top = 35
          Width = 491
          Height = 22
          LookupField = 'ID_PESSOA'
          LookupDisplay = 'RAZAOSOCIAL'
          LookupSource = dtsqryPESSOAS
          TabOrder = 0
        end
        object DT_CADASTRO: TJvDateEdit
          Left = 502
          Top = 35
          Width = 104
          Height = 23
          ShowNullDate = False
          TabOrder = 1
        end
        object DT_EMISSAO: TJvDateEdit
          Left = 612
          Top = 35
          Width = 104
          Height = 23
          ShowNullDate = False
          TabOrder = 2
        end
        object DT_PRIVENCIMENTO: TJvDateEdit
          Left = 612
          Top = 77
          Width = 104
          Height = 23
          ShowNullDate = False
          TabOrder = 3
        end
        object INTERVADO_DIAS: TJvSpinEdit
          Left = 502
          Top = 77
          Width = 104
          Height = 23
          Decimal = 0
          MaxValue = 30.000000000000000000
          MinValue = 1.000000000000000000
          Value = 5.000000000000000000
          TabOrder = 4
        end
        object NUM_PARCELAS: TJvSpinEdit
          Left = 392
          Top = 77
          Width = 104
          Height = 23
          Decimal = 0
          MaxValue = 99.000000000000000000
          MinValue = 1.000000000000000000
          Value = 1.000000000000000000
          TabOrder = 5
        end
        object HISTORICO: TJvMaskEdit
          Left = 5
          Top = 121
          Width = 542
          Height = 23
          TabOrder = 6
          Text = 'HISTORICO'
        end
        object VLR_PRINCIPAL: TJvCalcEdit
          Left = 553
          Top = 121
          Width = 163
          Height = 23
          DisplayFormat = ',#0.00'
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
        end
        object tjvbg: TJvgGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 216
          Width = 714
          Height = 216
          Align = alBottom
          Caption = 'Lan'#231'amentos gerados'
          TabOrder = 8
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
          object JvDBGrid1: TJvDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 21
            Width = 704
            Height = 190
            Align = alClient
            DataSource = dtsDefault
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Expanded = False
                FieldName = 'DTVENCIMENTO'
                Title.Caption = 'Data de Vencimento'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Title.Caption = 'Valor da Parcela'
                Visible = True
              end>
          end
        end
        object OBS: TJvMemo
          Left = 5
          Top = 163
          Width = 711
          Height = 38
          Lines.Strings = (
            'MULTI_OBS')
          TabOrder = 9
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
    Left = 174
    Top = 120
  end
  object dtsqryPESSOAS: TDataSource
    DataSet = dtmCBR.qryPESSOAS
    Left = 289
    Top = 121
  end
end
