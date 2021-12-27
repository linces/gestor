object frmTEF_Adm: TfrmTEF_Adm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'TEF - Administrativo'
  ClientHeight = 428
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 327
    Top = 180
    Width = 37
    Height = 16
    Caption = 'Label1'
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 282
    Width = 440
    Height = 107
    Align = alBottom
    TabOrder = 0
    object Label2: TLabel
      Left = 48
      Top = 10
      Width = 140
      Height = 16
      Caption = 'PWINFO_AUTNAME(21):'
    end
    object Label3: TLabel
      Left = 48
      Top = 30
      Width = 130
      Height = 16
      Caption = 'PWINFO_AUTVER(22):'
    end
    object Label4: TLabel
      Left = 48
      Top = 52
      Width = 130
      Height = 16
      Caption = 'PWINFO_AUTDEV(23):'
    end
    object Label5: TLabel
      Left = 48
      Top = 73
      Width = 130
      Height = 16
      Caption = 'PWINFO_AUTCAP(36):'
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 440
    Height = 282
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
  object Button1: TButton
    Left = 0
    Top = 389
    Width = 440
    Height = 39
    Align = alBottom
    Caption = 'Limpar Log'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 136
    object Operaes1: TMenuItem
      Caption = 'Opera'#231#245'es'
      object PWiInit1: TMenuItem
        Caption = 'Inicializar'
        OnClick = PWiInit1Click
      end
      object PWOPERINSTALL1: TMenuItem
        Caption = 'Instala'#231#227'o'
        OnClick = PWOPERINSTALL1Click
      end
      object N5PWOPERREPRINTReimpresso1: TMenuItem
        Caption = 'Reimpress'#227'o'
        OnClick = N5PWOPERREPRINTReimpresso1Click
      end
      object PWOPERVERSIONVersodaDLL1: TMenuItem
        Caption = 'Vers'#227'o da DLL'
        OnClick = PWOPERVERSIONVersodaDLL1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object PWOPERRPTDETAIL1: TMenuItem
        Caption = 'Relat'#243'rios'
        OnClick = PWOPERRPTDETAIL1Click
      end
      object N7PWOPERADMIN1: TMenuItem
        Caption = 'Administrativo'
        OnClick = N7PWOPERADMIN1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object PWiConfirmation1: TMenuItem
        Caption = 'Confirma'#231#227'o'
        OnClick = PWiConfirmation1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
    end
    object este1: TMenuItem
      Caption = 'Teste'
      object PWOPERSALEVenda1: TMenuItem
        Caption = 'Venda '
        OnClick = PWOPERSALEVenda1Click
      end
      object PWOPERSALEVOIDCancelamento1: TMenuItem
        Caption = 'Cancelamento'
        OnClick = PWOPERSALEVOIDCancelamento1Click
      end
      object N8TestaAutoAtendimento1: TMenuItem
        Caption = 'Auto Atendimento'
        OnClick = N8TestaAutoAtendimento1Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 224
    object Abortar: TAction
      Caption = 'Abortar'
      ShortCut = 32795
      OnExecute = AbortarExecute
    end
  end
end
