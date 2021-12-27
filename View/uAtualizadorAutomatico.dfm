object FrmAtualiza: TFrmAtualiza
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Atualizador Autom'#225'tico'
  ClientHeight = 423
  ClientWidth = 757
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    757
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 31
    Top = 25
    Width = 691
    Height = 370
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 75
      Width = 71
      Height = 20
      Caption = 'Baixando...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lbStatus: TLabel
      Left = 50
      Top = 136
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object pbDownload: TProgressBar
      Left = 50
      Top = 101
      Width = 607
      Height = 24
      TabOrder = 0
    end
    object btnDepois: TBitBtn
      Left = 50
      Top = 188
      Width = 303
      Height = 37
      Caption = 'Baixar Atualiza'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnDepoisClick
    end
  end
  object IdHTTP: TIdHTTP
    OnWork = IdHTTPWork
    OnWorkBegin = IdHTTPWorkBegin
    OnWorkEnd = IdHTTPWorkEnd
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 496
    Top = 48
  end
  object pmMenu: TPopupMenu
    Left = 538
    Top = 192
    object RestaurarAplicao1: TMenuItem
      Caption = 'Restaurar Aplica'#231#227'o'
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object SairdaAplicao1: TMenuItem
      Caption = 'Sair da Aplica'#231#227'o'
      OnClick = SairdaAplicao1Click
    end
  end
end
