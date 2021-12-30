object FrameFunctionEditor: TFrameFunctionEditor
  Left = 0
  Top = 0
  Width = 390
  Height = 45
  Constraints.MinHeight = 45
  Constraints.MinWidth = 390
  TabOrder = 0
  object lblFunctionDescr: TLabel
    Left = 8
    Top = 28
    Width = 85
    Height = 13
    Caption = 'lblFunctionDescr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object lblDisabled: TEdit
    Left = 144
    Top = 16
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = '(Unused/disabled)'
    Visible = False
  end
  object btnNew: TButton
    Left = 336
    Top = 0
    Width = 49
    Height = 21
    Hint = 'Click to create a new function'
    Caption = 'New...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnNewClick
  end
  object cboChartList: TComboBox
    Left = 0
    Top = 4
    Width = 273
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cboChartListChange
  end
  object btnRemove: TButton
    Left = 336
    Top = 24
    Width = 49
    Height = 21
    Hint = 'Click to permanently remove the specified function'
    Caption = 'Remove'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object btnEdit: TButton
    Left = 280
    Top = 0
    Width = 49
    Height = 21
    Hint = 'Click to alter the specified function'
    Caption = 'Edit...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnEditClick
  end
  object btnClear: TButton
    Left = 280
    Top = 24
    Width = 49
    Height = 21
    Hint = 'Click to clear the selected function for this parameter'
    Caption = 'Clear'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnClearClick
  end
end
