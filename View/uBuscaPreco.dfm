object FrmBuscaPreco: TFrmBuscaPreco
  Left = 0
  Top = 0
  ActiveControl = EdtProduto
  BorderStyle = bsDialog
  Caption = 'Busca Pre'#231'o'
  ClientHeight = 170
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object grpSelecao: TGroupBox
      Left = 0
      Top = 0
      Width = 718
      Height = 62
      Align = alClient
      Caption = 'Passe o C'#243'digo de Barras,  Descri'#231#227'o ou Refer'#234'ncia'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object EdtProduto: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 22
        Width = 710
        Height = 36
        Align = alClient
        CharCase = ecUpperCase
        Color = 14737602
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = EdtProdutoChange
        ExplicitHeight = 33
      end
    end
  end
  object grpProduto: TGroupBox
    Left = 0
    Top = 62
    Width = 718
    Height = 108
    Align = alClient
    TabOrder = 1
    object lblCodigo: TLabel
      Left = 34
      Top = 18
      Width = 99
      Height = 22
      Alignment = taCenter
      Caption = 'lblCodigo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblPreco: TLabel
      Left = 34
      Top = 45
      Width = 102
      Height = 33
      Caption = 'Label5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qryProduto: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select codigo, descricao, codbarra,  pr_venda from produto'
      'where'
      '(empresa=:empresa) and('
      '(codbarra like :texto) or'
      '(descricao like :texto) or'
      '(referencia like :texto));')
    Left = 456
    Top = 80
    ParamData = <
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        Name = 'TEXTO'
        ParamType = ptInput
      end>
    object qryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdutoPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 280
    Top = 80
  end
end
