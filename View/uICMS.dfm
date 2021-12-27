object FrmICMS: TFrmICMS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela de ICMS'
  ClientHeight = 444
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1018
    Height = 378
    Align = alClient
    DataSource = dsICMS
    GradientEndColor = 15529196
    GradientStartColor = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ORIGEM'
        ReadOnly = True
        Title.Caption = 'UF>>'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AM'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AP'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GO'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MA'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MG'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MT'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PB'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P_I'
        Title.Alignment = taRightJustify
        Title.Caption = 'PI'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RJ'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RO'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RR'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP'
        Title.Alignment = taRightJustify
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_O'
        Title.Alignment = taRightJustify
        Title.Caption = 'TO'
        Width = 34
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 378
    Width = 1018
    Height = 66
    Align = alBottom
    Caption = 'F6 | Localizar  <<UF>>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object edtLoc: TEdit
      Left = 11
      Top = 32
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 35
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = edtLocChange
      OnKeyDown = edtLocKeyDown
    end
  end
  object qryICMS: TFDQuery
    BeforeInsert = qryICMSBeforeInsert
    AfterPost = qryICMSAfterPost
    BeforeDelete = qryICMSBeforeDelete
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from tabela_icms'
      'where'
      'origem like :origem'
      'order by 1')
    Left = 168
    Top = 72
    ParamData = <
      item
        Name = 'ORIGEM'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object qryICMSORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryICMSAC: TFMTBCDField
      FieldName = 'AC'
      Origin = 'AC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSAL: TFMTBCDField
      FieldName = 'AL'
      Origin = 'AL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSAM: TFMTBCDField
      FieldName = 'AM'
      Origin = 'AM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSAP: TFMTBCDField
      FieldName = 'AP'
      Origin = 'AP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSBA: TFMTBCDField
      FieldName = 'BA'
      Origin = 'BA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSCE: TFMTBCDField
      FieldName = 'CE'
      Origin = 'CE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSDF: TFMTBCDField
      FieldName = 'DF'
      Origin = 'DF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSES: TFMTBCDField
      FieldName = 'ES'
      Origin = 'ES'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSGO: TFMTBCDField
      FieldName = 'GO'
      Origin = 'GO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSMA: TFMTBCDField
      FieldName = 'MA'
      Origin = 'MA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSMG: TFMTBCDField
      FieldName = 'MG'
      Origin = 'MG'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSMS: TFMTBCDField
      FieldName = 'MS'
      Origin = 'MS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSMT: TFMTBCDField
      FieldName = 'MT'
      Origin = 'MT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSPA: TFMTBCDField
      FieldName = 'PA'
      Origin = 'PA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSPB: TFMTBCDField
      FieldName = 'PB'
      Origin = 'PB'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSPE: TFMTBCDField
      FieldName = 'PE'
      Origin = 'PE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSP_I: TFMTBCDField
      FieldName = 'P_I'
      Origin = 'P_I'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSPR: TFMTBCDField
      FieldName = 'PR'
      Origin = 'PR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSRJ: TFMTBCDField
      FieldName = 'RJ'
      Origin = 'RJ'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSRO: TFMTBCDField
      FieldName = 'RO'
      Origin = 'RO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSRN: TFMTBCDField
      FieldName = 'RN'
      Origin = 'RN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSRR: TFMTBCDField
      FieldName = 'RR'
      Origin = 'RR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSRS: TFMTBCDField
      FieldName = 'RS'
      Origin = 'RS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSSC: TFMTBCDField
      FieldName = 'SC'
      Origin = 'SC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSSE: TFMTBCDField
      FieldName = 'SE'
      Origin = 'SE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMSSP: TFMTBCDField
      FieldName = 'SP'
      Origin = 'SP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryICMST_O: TFMTBCDField
      FieldName = 'T_O'
      Origin = 'T_O'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsICMS: TDataSource
    DataSet = qryICMS
    Left = 168
    Top = 120
  end
end
