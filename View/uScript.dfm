object frmScript: TfrmScript
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Script'
  ClientHeight = 333
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 41
    Align = alTop
    Caption = 
      'ATEN'#199#195'O!!! ANTES DE EXECUTAR O CAMANDO SQL FA'#199'A O BACKUP DO SIST' +
      'EMA.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object MemoSql: TMemo
    Left = 0
    Top = 41
    Width = 682
    Height = 251
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 292
    Width = 682
    Height = 41
    Align = alBottom
    TabOrder = 2
    object lblMsg: TLabel
      Left = 141
      Top = 9
      Width = 7
      Height = 15
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 15
      Top = 6
      Width = 113
      Height = 25
      Caption = 'Executar SQL'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object qryParametro: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from CONFIG')
    Left = 198
    Top = 96
    object qryParametroVERSAO: TIntegerField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParametroDATA_SCRIPT: TDateField
      FieldName = 'DATA_SCRIPT'
      Origin = 'DATA_SCRIPT'
    end
    object qryParametroESTILO: TStringField
      FieldName = 'ESTILO'
      Origin = 'ESTILO'
      Size = 30
    end
    object qryParametroLINK_TREINAMENTO: TStringField
      FieldName = 'LINK_TREINAMENTO'
      Origin = 'LINK_TREINAMENTO'
      Size = 200
    end
    object qryParametroTITULO_SISTEMA: TStringField
      FieldName = 'TITULO_SISTEMA'
      Origin = 'TITULO_SISTEMA'
      Size = 50
    end
    object qryParametroSUB_TITULO_SISTEMA: TStringField
      FieldName = 'SUB_TITULO_SISTEMA'
      Origin = 'SUB_TITULO_SISTEMA'
      Size = 100
    end
    object qryParametroEMAIL_SUPORTE: TStringField
      FieldName = 'EMAIL_SUPORTE'
      Origin = 'EMAIL_SUPORTE'
      Size = 100
    end
    object qryParametroSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 100
    end
    object qryParametroFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryParametroFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryParametroCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 14
    end
  end
  object qryConsulta: TFDQuery
    Connection = Dados.Conexao
    Left = 46
    Top = 103
  end
  object IBScript: TFDScript
    SQLScripts = <>
    Connection = Dados.Conexao
    Params = <>
    Macros = <>
    Left = 318
    Top = 87
  end
end
