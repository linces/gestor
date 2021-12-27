inherited frmREMESSArelatorio: TfrmREMESSArelatorio
  Caption = 'frmREMESSArelatorio'
  PixelsPerInch = 96
  TextHeight = 15
  object RLReport: TRLReport [0]
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Margins.BottomMargin = 15.000000000000000000
    DataSource = dtsqryDefaultITEM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReportBeforePrint
    object RLCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLEmpresa: TRLLabel
        Left = 0
        Top = 11
        Width = 718
        Height = 19
        Align = faWidth
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLTitulo: TRLLabel
        Left = 1
        Top = 31
        Width = 161
        Height = 14
        Caption = 'REMESSA DE T'#205'TULOS N: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLOpcoes1: TRLLabel
        Left = 1
        Top = 61
        Width = 70
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 664
        Top = 31
        Width = 49
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 664
        Top = 46
        Width = 49
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itHour
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLOpcoes: TRLLabel
        Left = 1
        Top = 46
        Width = 63
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLOpcoes2: TRLLabel
        Left = 1
        Top = 76
        Width = 70
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 18
      BandType = btColumnHeader
      Color = clSilver
      ParentColor = False
      Transparent = False
      object H1: TRLLabel
        Left = 0
        Top = 0
        Width = 63
        Height = 18
        Align = faLeft
        Alignment = taRightJustify
        Caption = 'C'#243'd.Tit.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object H2: TRLLabel
        Left = 69
        Top = 1
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Valor R$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 136
        Top = 1
        Width = 77
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 216
        Top = 1
        Width = 161
        Height = 14
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 510
        Top = 1
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Pag.Loja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 577
        Top = 1
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Alt.Loja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 643
        Top = 1
        Width = 70
        Height = 14
        Alignment = taRightJustify
        Caption = 'Canc.Loja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 380
        Top = 1
        Width = 127
        Height = 14
        Alignment = taJustify
        Caption = 'Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLGrupo: TRLGroup
      Left = 38
      Top = 155
      Width = 718
      Height = 72
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        DataFields = 'ID_CBR_TITULOS'
        object RLBand1: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          object RLDBText1: TRLDBText
            Left = 69
            Top = 2
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR'
            DataSource = dtsqryDefaultITEM
            DisplayMask = ',#0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 136
            Top = 2
            Width = 77
            Height = 14
            Alignment = taRightJustify
            DataField = 'DT_VENCIMENTO'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 216
            Top = 2
            Width = 161
            Height = 14
            DataField = 'CLI_RAZAOSOCIAL'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 510
            Top = 3
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'PAGAMENTO_LOJA'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 577
            Top = 3
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'ALTERACAO_LOJA'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 646
            Top = 1
            Width = 67
            Height = 14
            Alignment = taRightJustify
            DataField = 'CANCELAMENTO_LOJA'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = -33
            Top = 2
            Width = 97
            Height = 14
            Alignment = taRightJustify
            DataField = 'ID_CBR_TITULOS'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 380
            Top = 3
            Width = 127
            Height = 14
            Alignment = taJustify
            DataField = 'CLI_CNPJCPF'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
        end
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 227
      Width = 718
      Height = 38
      BandType = btFooter
      object RLLabel14: TRLLabel
        Left = 640
        Top = 6
        Width = 56
        Height = 14
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 698
        Top = 6
        Width = 20
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
  end
  object dtsqryDefault: TDataSource
    DataSet = qryDefault
    Left = 400
    Top = 304
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport(Open Source) v3.24(BETA9) \251 Copyright '#169' 1999-200' +
      '6 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 504
    Top = 248
  end
  object qryDefault: TFDQuery
    BeforeOpen = qryDefaultBeforeOpen
    AfterOpen = qryDefaultAfterOpen
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      '  EMPRESA.RAZAO AS RAZAOSOCIAL,'
      '  CBR_REMESSA.*'
      'FROM '
      '  CBR_REMESSA'
      
        '    INNER JOIN EMPRESA ON CBR_REMESSA.ID_EMPRESA = EMPRESA.CODIG' +
        'O'
      'WHERE'
      '  1=1'
      '  AND CBR_REMESSA.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_REMESSA.ID_CBR_REMESSA = :ID_CBR_REMESSA'
      '  AND CBR_REMESSA.CANCELADA = '#39'N'#39)
    Left = 320
    Top = 304
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_REMESSA'
        DataType = ftLargeint
        ParamType = ptInput
      end>
  end
  object qryDefaultITEM: TFDQuery
    IndexFieldNames = 'ID_EMPRESA;ID_CBR_REMESSA'
    MasterSource = dtsqryDefault
    MasterFields = 'ID_EMPRESA;ID_CBR_REMESSA'
    DetailFields = 'ID_EMPRESA;ID_CBR_REMESSA'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT'
      '  CBR_REMESSA_TITULOS.*'
      'FROM '
      '  CBR_REMESSA_TITULOS'
      'WHERE'
      '  1=1'
      '  AND CBR_REMESSA_TITULOS.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_REMESSA_TITULOS.ID_CBR_REMESSA = :ID_CBR_REMESSA')
    Left = 328
    Top = 400
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_REMESSA'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
    object qryDefaultITEMID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultITEMID_CBR_REMESSA: TLargeintField
      FieldName = 'ID_CBR_REMESSA'
      Origin = 'ID_CBR_REMESSA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultITEMID_CBR_TITULOS: TLargeintField
      FieldName = 'ID_CBR_TITULOS'
      Origin = 'ID_CBR_TITULOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultITEMDT_EMISSAO: TSQLTimeStampField
      FieldName = 'DT_EMISSAO'
      Origin = 'DT_EMISSAO'
    end
    object qryDefaultITEMDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'DT_VENCIMENTO'
    end
    object qryDefaultITEMVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMCLI_RAZAOSOCIAL: TStringField
      FieldName = 'CLI_RAZAOSOCIAL'
      Origin = 'CLI_RAZAOSOCIAL'
      OnGetText = qryDefaultITEMCLI_RAZAOSOCIALGetText
      Size = 100
    end
    object qryDefaultITEMCLI_CNPJCPF: TStringField
      FieldName = 'CLI_CNPJCPF'
      Origin = 'CLI_CNPJCPF'
      OnGetText = qryDefaultITEMCLI_CNPJCPFGetText
      Size = 15
    end
    object qryDefaultITEMCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'CLI_ENDERECO'
      Size = 100
    end
    object qryDefaultITEMCLI_ENDNUMERO: TStringField
      FieldName = 'CLI_ENDNUMERO'
      Origin = 'CLI_ENDNUMERO'
    end
    object qryDefaultITEMCLI_ENDBAIRRO: TStringField
      FieldName = 'CLI_ENDBAIRRO'
      Origin = 'CLI_ENDBAIRRO'
      Size = 100
    end
    object qryDefaultITEMCLI_ENDCIDADE: TStringField
      FieldName = 'CLI_ENDCIDADE'
      Origin = 'CLI_ENDCIDADE'
      Size = 100
    end
    object qryDefaultITEMCLI_ENDUF: TStringField
      FieldName = 'CLI_ENDUF'
      Origin = 'CLI_ENDUF'
      FixedChar = True
      Size = 2
    end
    object qryDefaultITEMCLI_ENDCEP: TStringField
      FieldName = 'CLI_ENDCEP'
      Origin = 'CLI_ENDCEP'
      Size = 8
    end
    object qryDefaultITEMDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
    end
    object qryDefaultITEMCANCELAMENTO_LOJA: TStringField
      FieldName = 'CANCELAMENTO_LOJA'
      Origin = 'CANCELAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMPAGAMENTO_LOJA: TStringField
      FieldName = 'PAGAMENTO_LOJA'
      Origin = 'PAGAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMALTERACAO_LOJA: TStringField
      FieldName = 'ALTERACAO_LOJA'
      Origin = 'ALTERACAO_LOJA'
      FixedChar = True
      Size = 1
    end
  end
  object dtsqryDefaultITEM: TDataSource
    DataSet = qryDefaultITEM
    Left = 424
    Top = 400
  end
end
