object Form1: TForm1
  Left = 878
  Top = 93
  Width = 386
  Height = 616
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object searchresult: TLabel
    Left = 16
    Top = 568
    Width = 67
    Height = 13
    Caption = 'Search Result'
  end
  object add: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 22
    Caption = 'Add'
    TabOrder = 0
    OnClick = addClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 40
    Width = 345
    Height = 521
    TabOrder = 1
  end
  object List: TButton
    Left = 104
    Top = 8
    Width = 75
    Height = 22
    Caption = 'List'
    TabOrder = 2
    OnClick = ListClick
  end
  object search: TButton
    Left = 192
    Top = 8
    Width = 75
    Height = 22
    Caption = 'Search'
    TabOrder = 3
    OnClick = searchClick
  end
  object SpinEdit1: TSpinEdit
    Left = 280
    Top = 8
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
end
