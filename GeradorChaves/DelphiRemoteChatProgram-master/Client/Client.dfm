object formClient: TformClient
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ClientApp - HyperSoftware'
  ClientHeight = 267
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 152
    Width = 592
    Height = 115
    Align = alBottom
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 0
    Top = 130
    Width = 511
    Height = 21
    Align = alCustom
    TabOrder = 1
  end
  object Button1: TButton
    Left = 512
    Top = 120
    Width = 80
    Height = 31
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 358
    Top = 16
    Width = 153
    Height = 33
    Caption = 'Conectar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 104
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'ServerIP'
  end
  object Edit3: TEdit
    Left = 231
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'ServerPORT'
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 272
    Top = 72
  end
end
