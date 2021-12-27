object frmTradutor: TfrmTradutor
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tradutor'
  ClientHeight = 367
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 51
    Width = 469
    Height = 316
    Align = alClient
    DataSource = dsTradutor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TEXTO_PT_BR'
        Title.Caption = 'Texto Portugu'#234's'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXTO_TRADUZIDO'
        Title.Caption = 'Texto Traduzido'
        Width = 186
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cbIdioma: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 233
      Height = 21
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = dsIdioma
      ReadOnly = True
      TabOrder = 0
      OnClick = cbIdiomaClick
    end
  end
  object dsTradutor: TDataSource
    DataSet = Dados.qryTradutor
    Left = 352
    Top = 184
  end
  object dsIdioma: TDataSource
    DataSet = Dados.qryIdiomas
    Left = 224
    Top = 184
  end
end
