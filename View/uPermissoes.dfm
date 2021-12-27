object frmPermissoes: TfrmPermissoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Permiss'#245'es'
  ClientHeight = 528
  ClientWidth = 744
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 185
    Top = 0
    Width = 559
    Height = 528
    Align = alClient
    MultiLine = True
    TabOrder = 0
    Tabs.Strings = (
      'Teste')
    TabIndex = 0
    OnChange = TabControl1Change
    ExplicitWidth = 568
    object DBGridEh2: TDBGridEh
      Left = 4
      Top = 24
      Width = 551
      Height = 500
      Align = alClient
      DataSource = dsPermissao
      DynProps = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnCellClick = DBGridEh2CellClick
      OnDrawColumnCell = DBGridEh2DrawColumnCell
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOME'
          Footers = <>
          Title.Caption = 'Tela'
          Width = 461
        end
        item
          Alignment = taCenter
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'VISUALIZAR'
          Footers = <>
          KeyList.Strings = (
            'S'
            'N')
          Title.Caption = '     '
          Title.Hint = '.'
          Width = 33
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 185
    Height = 528
    Align = alLeft
    DataSource = dsUsuarios
    DynProps = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LOGIN'
        Footers = <>
        Title.Caption = 'Usu'#225'rios'
        Width = 156
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object chkVer: TCheckBox
    Left = 674
    Top = 52
    Width = 15
    Height = 17
    TabOrder = 2
    OnClick = chkVerClick
  end
  object dsUsuarios: TDataSource
    DataSet = Dados.qryUsuarios
    OnDataChange = dsUsuariosDataChange
    Left = 112
    Top = 192
  end
  object dsPermissao: TDataSource
    DataSet = Dados.qryPermissoes
    Left = 232
    Top = 168
  end
end
