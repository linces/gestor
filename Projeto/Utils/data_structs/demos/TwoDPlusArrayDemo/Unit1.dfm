object Form1: TForm1
  Left = 1251
  Top = 29
  Width = 349
  Height = 280
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnBuild3DArray: TButton
    Left = 16
    Top = 24
    Width = 113
    Height = 25
    Caption = 'Build 2D+ array'
    TabOrder = 0
    OnClick = btnBuild3DArrayClick
  end
  object btnDebugArray: TButton
    Left = 16
    Top = 64
    Width = 113
    Height = 25
    Caption = 'Debug array'
    TabOrder = 1
    OnClick = btnDebugArrayClick
  end
  object btnClear: TButton
    Left = 16
    Top = 104
    Width = 113
    Height = 25
    Caption = 'Clear array'
    TabOrder = 2
    OnClick = btnClearClick
  end
  object btnUnsetValue: TButton
    Left = 16
    Top = 144
    Width = 113
    Height = 25
    Caption = 'Check unset value'
    TabOrder = 3
    OnClick = btnUnsetValueClick
  end
end
