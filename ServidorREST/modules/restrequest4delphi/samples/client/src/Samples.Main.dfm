object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'REST Request - Samples'
  ClientHeight = 561
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 861
    object Image1: TImage
      AlignWithMargins = True
      Left = 10
      Top = 0
      Width = 129
      Height = 78
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Center = True
      Proportional = True
      ExplicitLeft = 24
      ExplicitHeight = 97
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 78
    Width = 984
    Height = 483
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 861
    ExplicitHeight = 334
    object Splitter1: TSplitter
      Left = 0
      Top = 209
      Width = 984
      Height = 8
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = -16
      ExplicitTop = 106
      ExplicitWidth = 861
    end
    object Panel3: TPanel
      Left = 0
      Top = 217
      Width = 984
      Height = 266
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 215
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '  Response'
        Color = 6710886
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitTop = 8
        ExplicitWidth = 861
        object lblStatusCode: TLabel
          AlignWithMargins = True
          Left = 976
          Top = 2
          Width = 3
          Height = 15
          Margins.Left = 5
          Margins.Top = 2
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alRight
          Alignment = taRightJustify
        end
        object Label3: TLabel
          AlignWithMargins = True
          Left = 903
          Top = 2
          Width = 68
          Height = 15
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Alignment = taRightJustify
          Caption = 'Status code:'
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 22
        Width = 984
        Height = 244
        ActivePage = TabSheet6
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object TabSheet6: TTabSheet
          Caption = 'Body'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object mmBody: TMemo
            Left = 0
            Top = 0
            Width = 976
            Height = 214
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 400
            ExplicitTop = 64
            ExplicitWidth = 185
            ExplicitHeight = 89
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 984
      Height = 209
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '  Request'
        Color = 6710886
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 861
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 22
        Width = 984
        Height = 187
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = 'Request'
          ExplicitLeft = 0
          ExplicitTop = 24
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            976
            157)
          object Label1: TLabel
            Left = 10
            Top = 53
            Width = 75
            Height = 15
            Caption = 'Custom body:'
          end
          object edtBaseURL: TLabeledEdit
            Left = 10
            Top = 24
            Width = 648
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            EditLabel.Width = 24
            EditLabel.Height = 15
            EditLabel.Caption = 'URL:'
            TabOrder = 0
            Text = 'http://localhost:8888/users'
            TextHint = 'http://localhost:8888/users'
          end
          object edtAccept: TLabeledEdit
            Left = 664
            Top = 24
            Width = 219
            Height = 23
            Anchors = [akTop, akRight]
            EditLabel.Width = 40
            EditLabel.Height = 15
            EditLabel.Caption = 'Accept:'
            TabOrder = 1
            Text = 'application/json'
            TextHint = 'application/json'
          end
          object mmCustomBody: TMemo
            Left = 10
            Top = 74
            Width = 873
            Height = 71
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              
                '{"name":"Vinicius","lastName":"Sanchez","email":"vinicius@fioril' +
                'li.com.br"}')
            TabOrder = 2
          end
          object btnDELETE: TButton
            Left = 888
            Top = 118
            Width = 72
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'DELETE'
            TabOrder = 3
            OnClick = btnDELETEClick
          end
          object btnPUT: TButton
            Left = 889
            Top = 87
            Width = 72
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'PUT'
            TabOrder = 4
            OnClick = btnPUTClick
          end
          object btnPOST: TButton
            Left = 889
            Top = 56
            Width = 72
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'POST'
            TabOrder = 5
            OnClick = btnPOSTClick
          end
          object btnGET: TButton
            Left = 889
            Top = 25
            Width = 72
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'GET'
            TabOrder = 6
            OnClick = btnGETClick
          end
        end
      end
    end
  end
end
