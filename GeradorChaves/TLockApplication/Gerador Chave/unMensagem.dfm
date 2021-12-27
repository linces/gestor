object frmMensagem: TfrmMensagem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Enviar mensagem direta ao sistema no cliente'
  ClientHeight = 127
  ClientWidth = 468
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
    Left = 48
    Top = 29
    Width = 186
    Height = 13
    Caption = 'Mensagem:    (250 caracteres m'#225'ximo)'
  end
  object Edit1: TEdit
    Left = 48
    Top = 48
    Width = 377
    Height = 21
    MaxLength = 250
    TabOrder = 0
  end
  object Button1: TButton
    Left = 48
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
