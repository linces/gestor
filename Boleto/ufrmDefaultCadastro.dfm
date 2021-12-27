inherited frmDefaultCadastro: TfrmDefaultCadastro
  Caption = 'frmDefaultCadastro'
  ClientHeight = 507
  ClientWidth = 706
  ExplicitTop = -123
  ExplicitWidth = 722
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlComandos: TPanel
    Top = 412
    Width = 700
    Height = 92
    ExplicitTop = 412
    ExplicitWidth = 700
    ExplicitHeight = 92
    inherited btnConfirmar: TSpeedButton
      Height = 92
      ExplicitHeight = 92
    end
    inherited btnCancelar: TSpeedButton
      Height = 92
      ExplicitHeight = 92
    end
  end
  object pageDefault: TJvPageControl [1]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 700
    Height = 403
    ActivePage = tabDefault
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object tabDefault: TTabSheet
      Caption = 'Principal'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 157
    Top = 304
  end
  object dtsDefault: TDataSource
    Left = 270
    Top = 371
  end
end
