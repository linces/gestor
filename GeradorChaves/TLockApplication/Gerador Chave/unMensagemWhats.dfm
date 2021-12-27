object frmMensagemWhats: TfrmMensagemWhats
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mensagem via Whatsapp'
  ClientHeight = 193
  ClientWidth = 674
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
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 55
    Height = 13
    Caption = 'Mensagem:'
  end
  object Edit1: TEdit
    Left = 24
    Top = 64
    Width = 633
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 24
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 168
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
