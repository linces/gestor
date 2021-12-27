object FrmConsVendedor: TFrmConsVendedor
  Left = 0
  Top = 0
  ActiveControl = edtLoc
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de Vendedores'
  ClientHeight = 416
  ClientWidth = 304
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtLoc: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 298
    Height = 38
    Align = alTop
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtLocChange
    OnKeyDown = edtLocKeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 304
    Height = 372
    Align = alClient
    DataSource = dsVendedor
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    Options = [dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 300
        Visible = True
      end>
  end
  object dsVendedor: TDataSource
    DataSet = qryVendedor
    Left = 152
    Top = 208
  end
  object qryVendedor: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select codigo, nome from vendedores'
      'where '
      'nome like :nome'
      'order by nome')
    Left = 150
    Top = 160
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
    object qryVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryVendedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
  end
end
