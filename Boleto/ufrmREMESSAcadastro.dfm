inherited frmREMESSAcadastro: TfrmREMESSAcadastro
  Caption = 'REMESSA'
  ClientHeight = 637
  ClientWidth = 1019
  OnClose = FormClose
  ExplicitWidth = 1035
  ExplicitHeight = 676
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
    Top = 542
    Width = 1013
    ExplicitTop = 542
    ExplicitWidth = 1013
    inherited btnConfirmar: TSpeedButton
      ExplicitLeft = 578
    end
    inherited btnCancelar: TSpeedButton
      ExplicitLeft = 694
    end
  end
  inherited pageDefault: TJvPageControl
    Width = 1013
    Height = 533
    ExplicitWidth = 1013
    ExplicitHeight = 533
    inherited tabDefault: TTabSheet
      Caption = 'Dados da REMESSA'
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 1005
      ExplicitHeight = 503
      object JvPageControl1: TJvPageControl
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 999
        Height = 497
        Align = alClient
        TabOrder = 0
        TabStop = False
      end
      object JvgGroupBox3: TJvgGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 999
        Height = 497
        Align = alClient
        Caption = 'Lista de T'#237'tulos da Remssa'
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
        object dbGrid: TJvDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 21
          Width = 989
          Height = 432
          Align = alClient
          DataSource = dtsqryREMESSA_TITULOS
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          MultiSelect = True
          AlternateRowColor = clInactiveCaption
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#243'd.'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAZAO'
              Title.Caption = 'Raz'#227'o'
              Width = 355
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Valor R$'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTEMISSAO'
              Title.Caption = 'Dt. Emiss'#227'o'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVENCIMENTO'
              Title.Caption = 'Dt. Vencimento'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Title.Caption = 'Hist'#243'rico'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMESSA_REENVIO'
              Title.Caption = 'Reenvio'
              Width = 50
              Visible = True
            end>
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 459
          Width = 989
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object btnTITULOSlimpar: TJvSpeedButton
            AlignWithMargins = True
            Left = 243
            Top = 3
            Width = 110
            Height = 27
            Hint = 'Cancela opera'#231#227'o atual'
            Align = alLeft
            Caption = 'Limpar'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000001B2856664463
              D8FF0E142B3300000000000000000E142B334463D8FF1B285666000000000000
              0000848484FF848484FF848484FF848484FF848484FFFFFFFFFF4463D8FF4463
              D8FF4463D8FFDAE0F7FFDAE0F7FF4463D8FF4463D8FF4463D8FF000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0F7FF4463
              D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B33000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0
              F7FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B3300000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0
              F7FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B3300000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0F7FF4463
              D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B33000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4463D8FF4463
              D8FF4463D8FFDAE0F7FFDAE0F7FF4463D8FF4463D8FF4463D8FF000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4C1EFFF4463
              D8FFDAE0F7FFFFFFFFFFFFFFFFFFDAE0F7FF4463D8FF1B285666000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF848484FF848484FF848484FF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
              0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
              83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            Layout = blGlyphLeft
            OnClick = btnTITULOSlimparClick
            ExplicitLeft = 694
          end
          object btnTITULOSexcluir: TJvSpeedButton
            AlignWithMargins = True
            Left = 127
            Top = 3
            Width = 110
            Height = 27
            Hint = 'Cancela opera'#231#227'o atual'
            Align = alLeft
            Caption = 'Excluir'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000001B2856664463
              D8FF0E142B3300000000000000000E142B334463D8FF1B285666000000000000
              0000848484FF848484FF848484FF848484FF848484FFFFFFFFFF4463D8FF4463
              D8FF4463D8FFDAE0F7FFDAE0F7FF4463D8FF4463D8FF4463D8FF000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0F7FF4463
              D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B33000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0
              F7FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B3300000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE0
              F7FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B3300000000000000000000
              0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFFFFFFFFFDAE0F7FF4463
              D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF0E142B33000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4463D8FF4463
              D8FF4463D8FFDAE0F7FFDAE0F7FF4463D8FF4463D8FF4463D8FF000000000000
              0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFFFFFFFFFB4C1EFFF4463
              D8FFDAE0F7FFFFFFFFFFFFFFFFFFDAE0F7FF4463D8FF1B285666000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
              0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
              4DFFB8824DFFB8824DFFFFFFFFFF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFF
              FFFF848484FF848484FF848484FF848484FF0000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF848484FFFAFAFAFA7B7B7BDD1A1A1A330000000000000000000000000000
              0000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF848484FF7B7B7BDD1A1A1A33000000000000000000000000000000000000
              0000848484FF848484FF848484FF848484FF848484FF848484FF848484FF8383
              83FE848484FF1A1A1A3300000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            Layout = blGlyphLeft
            OnClick = btnTITULOSexcluirClick
            ExplicitLeft = 694
          end
          object btnTITULOauto: TJvSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 118
            Height = 27
            Hint = 'Confirma opera'#231#227'o atual'
            Align = alLeft
            Caption = 'Incluir T'#237'tulos'
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
            OnClick = btnTITULOautoClick
          end
        end
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 134
    Top = 192
  end
  inherited dtsDefault: TDataSource
    DataSet = dtmCBR.tabCBR_REMESSA
    Left = 134
    Top = 104
  end
  object dtsqryREMESSA_TITULOS: TDataSource
    DataSet = dtmCBR.qryREMESSA_TITULOS
    OnDataChange = dtsqryREMESSA_TITULOSDataChange
    Left = 302
    Top = 104
  end
end
