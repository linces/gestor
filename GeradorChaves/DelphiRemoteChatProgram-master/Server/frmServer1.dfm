object formServer: TformServer
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Server App - HyperSoftware'
  ClientHeight = 272
  ClientWidth = 547
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
  object Button1: TButton
    Left = 192
    Top = 48
    Width = 153
    Height = 41
    Caption = 'Ativar Servidor'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 160
    Width = 547
    Height = 112
    Align = alBottom
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 2
    Top = 135
    Width = 455
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 465
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Server: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientRead = ServerClientRead
    Left = 88
    Top = 64
  end
end
