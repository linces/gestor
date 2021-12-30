inherited FrameArrayConvergence: TFrameArrayConvergence
  Width = 660
  Height = 420
  object pnlControls: TPanel
    Left = 0
    Top = 377
    Width = 660
    Height = 43
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object rdgConvergenceParam: TRadioGroup
      Left = 1
      Top = 1
      Width = 658
      Height = 41
      Align = alClient
      Caption = ' Parameter '
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Mean'
        'Standard deviation'
        'Median'
        'Quartile difference')
      TabOrder = 0
      OnClick = rdgConvergenceParamClick
    end
  end
  object chtConvergence: TChart
    Left = 0
    Top = 0
    Width = 660
    Height = 377
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Stability of the mean over iteration')
    BottomAxis.Title.Caption = 'Iteration'
    LeftAxis.Title.Caption = 'Mean'
    Legend.Visible = False
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object serConvergence: TLineSeries
      Marks.ArrowLength = 8
      Marks.Style = smsValue
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'serConvergence'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end
