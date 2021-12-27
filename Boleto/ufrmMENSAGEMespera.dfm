object frmMENSAGEMespera: TfrmMENSAGEMespera
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsNone
  Caption = 'Aguarde'
  ClientHeight = 60
  ClientWidth = 507
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 60
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object imgIcone: TImage
      Left = 0
      Top = 0
      Width = 52
      Height = 60
      Align = alLeft
      Center = True
    end
    object lblMensagem: TJvLabel
      Left = 54
      Top = 11
      Width = 107
      Height = 20
      Caption = 'lblMensagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bookman Old Style'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Timer1: TTimer
    Interval = 100
    Left = 310
    Top = 10
  end
end
