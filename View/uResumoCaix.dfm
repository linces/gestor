object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Resumo Caixa'
  ClientHeight = 352
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 464
    Height = 67
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 0
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 464
    Height = 285
    Align = alClient
    DynProps = <>
    TabOrder = 1
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
