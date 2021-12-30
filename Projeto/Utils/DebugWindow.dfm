object DebugWindow: TDebugWindow
  Left = 1070
  Top = 432
  Width = 708
  Height = 715
  Caption = 'DebugWindow'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = mmoKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object gbxDebugging: TGroupBox
    Left = 0
    Top = 0
    Width = 700
    Height = 528
    Align = alClient
    Caption = 'Debugging '
    TabOrder = 0
    object mmoDebug: TMemo
      Left = 2
      Top = 15
      Width = 696
      Height = 448
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = mmoKeyDown
    end
    object pnlControls: TPanel
      Left = 2
      Top = 488
      Width = 696
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnClearDebug: TButton
        Left = 241
        Top = 7
        Width = 113
        Height = 25
        Caption = 'Clear'
        TabOrder = 0
        OnClick = btnClearClick
      end
      object btnCopyDebug: TButton
        Left = 369
        Top = 7
        Width = 113
        Height = 25
        Caption = 'Copy'
        TabOrder = 1
        OnClick = btnCopyClick
      end
    end
    object pnlLineCount: TPanel
      Left = 2
      Top = 463
      Width = 696
      Height = 25
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object lblDebugLineCount: TLabel
        Left = 8
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Lines: 0'
      end
    end
  end
  object gbxXlation: TGroupBox
    Left = 0
    Top = 528
    Width = 700
    Height = 160
    Align = alBottom
    Caption = 'Translation '
    TabOrder = 1
    object mmoXlation: TMemo
      Left = 2
      Top = 15
      Width = 696
      Height = 80
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = mmoKeyDown
    end
    object Panel1: TPanel
      Left = 2
      Top = 120
      Width = 696
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnClearXlation: TButton
        Left = 241
        Top = 7
        Width = 113
        Height = 25
        Caption = 'Clear'
        TabOrder = 0
        OnClick = btnClearClick
      end
      object btnCopyXlation: TButton
        Left = 369
        Top = 7
        Width = 113
        Height = 25
        Caption = 'Copy'
        TabOrder = 1
        OnClick = btnCopyClick
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 95
      Width = 696
      Height = 25
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object lblXlationLineCount: TLabel
        Left = 8
        Top = 4
        Width = 37
        Height = 13
        Caption = 'Lines: 0'
      end
    end
  end
end
