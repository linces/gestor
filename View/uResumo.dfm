object frmSerial: TfrmSerial
  Left = 0
  Top = 0
  ActiveControl = edtSerial
  BorderStyle = bsSizeToolWin
  Caption = 'Serial'
  ClientHeight = 132
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 512
    Height = 115
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 164
      Height = 17
      Caption = 'Informe o Serial do Produto'
    end
    object btnSerial: TButton
      Left = 16
      Top = 68
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      ModalResult = 1
      TabOrder = 0
    end
    object edtSerial: TEdit
      Left = 15
      Top = 30
      Width = 481
      Height = 25
      TabOrder = 1
    end
  end
end
