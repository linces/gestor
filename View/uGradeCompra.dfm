object FrmGradeCo: TFrmGradeCo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Compra | Grade de Produto'
  ClientHeight = 380
  ClientWidth = 433
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object JvDBGrid1: TJvDBGrid
    Left = 0
    Top = 0
    Width = 433
    Height = 312
    Align = alClient
    DataSource = dsGrade
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Caption = 'Quantidade'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Width = 81
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 433
    Height = 68
    Align = alBottom
    TabOrder = 1
    object lblQtdItem: TLabel
      Left = 8
      Top = 6
      Width = 120
      Height = 16
      Caption = 'Quantidade Item'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQtdTotal: TLabel
      Left = 176
      Top = 6
      Width = 128
      Height = 16
      Caption = 'Quantidade Grade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtQTD: TEdit
      Left = 8
      Top = 25
      Width = 120
      Height = 21
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object DBEdit1: TDBEdit
      Left = 176
      Top = 25
      Width = 128
      Height = 21
      DataField = 'TTOTAL'
      DataSource = dsGrade
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
  end
  object dsGrade: TDataSource
    DataSet = qryGrade
    Left = 64
    Top = 112
  end
  object qryGrade: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from COMPRA_GRADE'
      'where'
      'FK_ITENS_COMPRA=:ID')
    Left = 56
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGradeFK_COMPRA: TIntegerField
      FieldName = 'FK_COMPRA'
      Origin = 'FK_COMPRA'
    end
    object qryGradeFK_ITENS_COMPRA: TIntegerField
      FieldName = 'FK_ITENS_COMPRA'
      Origin = 'FK_ITENS_COMPRA'
    end
    object qryGradeFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
    end
    object qryGradeFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
    end
    object qryGradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
    object qryGradeQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryGradePRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryGradeTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      DisplayName = ''
      Expression = 'SUM(QTD)'
    end
  end
end
