inherited frmRETORNOrelatorio: TfrmRETORNOrelatorio
  Caption = 'frmRETORNOrelatorio'
  ClientHeight = 647
  ClientWidth = 1191
  ExplicitWidth = 1207
  ExplicitHeight = 685
  PixelsPerInch = 96
  TextHeight = 15
  object RLReport: TRLReport [0]
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
    Margins.BottomMargin = 15.000000000000000000
    DataSource = dtsqryDefaultITEM
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    BeforePrint = RLReportBeforePrint
    object RLCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 99
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLEmpresa: TRLLabel
        Left = 0
        Top = 11
        Width = 1047
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
        Left = 0
        Top = 34
        Width = 63
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLOpcoes1: TRLLabel
        Left = 2
        Top = 64
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
        Left = 988
        Top = 34
        Width = 56
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 988
        Top = 51
        Width = 56
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Info = itHour
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLOpcoes: TRLLabel
        Left = 1
        Top = 49
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
        Left = 3
        Top = 79
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
      Width = 1047
      Height = 16
      BandType = btColumnHeader
      Color = clSilver
      ParentColor = False
      Transparent = False
      object H1: TRLLabel
        Left = 0
        Top = 0
        Width = 70
        Height = 16
        Align = faLeft
        Alignment = taRightJustify
        Caption = 'Noss.Num.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 76
        Top = 0
        Width = 70
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vl.Docum.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 149
        Top = 0
        Width = 56
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vl.Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 209
        Top = 0
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vl.Juros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 275
        Top = 0
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vl.Desc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 341
        Top = 0
        Width = 63
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vl.Desp.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 407
        Top = 0
        Width = 149
        Height = 14
        Alignment = taJustify
        Caption = 'Ocorr'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 559
        Top = 0
        Width = 28
        Height = 14
        Alignment = taJustify
        Caption = 'Rc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 590
        Top = 0
        Width = 28
        Height = 14
        Alignment = taJustify
        Caption = 'Nr.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 621
        Top = 0
        Width = 28
        Height = 14
        Alignment = taJustify
        Caption = 'Jl.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 652
        Top = 0
        Width = 28
        Height = 14
        Alignment = taJustify
        Caption = 'Lt.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 683
        Top = 0
        Width = 28
        Height = 14
        Alignment = taJustify
        Caption = 'Lc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 714
        Top = 0
        Width = 151
        Height = 14
        Alignment = taJustify
        Caption = 'Sacado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 869
        Top = 0
        Width = 149
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
      Top = 153
      Width = 1047
      Height = 80
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 1047
        Height = 49
        DataFields = 'ID_CBR_RETORNO'
        object RLBand1: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 18
          object RLDBText3: TRLDBText
            Left = 0
            Top = 2
            Width = 70
            Height = 14
            Alignment = taRightJustify
            DataField = 'NOSSO_NUMERO'
            DataSource = dtsqryDefaultITEM
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText1: TRLDBText
            Left = 77
            Top = 2
            Width = 69
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR_DOCUMENTO'
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
            Left = 149
            Top = 2
            Width = 56
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR_PAGO'
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
          object RLDBText4: TRLDBText
            Left = 209
            Top = 2
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR_JUROS'
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
          object RLDBText5: TRLDBText
            Left = 275
            Top = 2
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR_DESCONTO'
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
          object RLDBText6: TRLDBText
            Left = 341
            Top = 2
            Width = 63
            Height = 14
            Alignment = taRightJustify
            DataField = 'VALOR_DESPESA'
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
          object RLDBText7: TRLDBText
            Left = 407
            Top = 2
            Width = 149
            Height = 14
            Alignment = taJustify
            DataField = 'TIPO_OCORRENCIA_DESC'
            DataSource = dtsqryDefaultITEM
            DisplayMask = ',#0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            SecondHoldStyle = hsCopyHeight
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 559
            Top = 2
            Width = 28
            Height = 14
            Alignment = taJustify
            DataField = 'TITULO_RECUSADO'
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
          object RLDBText9: TRLDBText
            Left = 590
            Top = 2
            Width = 28
            Height = 14
            Alignment = taJustify
            DataField = 'TITULO_SEMREGISTRO'
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
          object RLDBText10: TRLDBText
            Left = 621
            Top = 2
            Width = 28
            Height = 14
            Alignment = taJustify
            DataField = 'TITULO_JALIQUIDADO'
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
          object RLDBText11: TRLDBText
            Left = 652
            Top = 1
            Width = 28
            Height = 14
            Alignment = taJustify
            DataField = 'TITULO_LIQUIDADO_LIMITEP'
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
          object RLDBText12: TRLDBText
            Left = 683
            Top = 1
            Width = 28
            Height = 14
            Alignment = taJustify
            DataField = 'TITULO_LOCALIZADO'
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
          object RLDBText13: TRLDBText
            Left = 714
            Top = 1
            Width = 151
            Height = 14
            Alignment = taJustify
            DataField = 'RAZAOSOCIAL'
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
          object RLDBText14: TRLDBText
            Left = 869
            Top = -1
            Width = 35
            Height = 14
            Alignment = taJustify
            DataField = 'CNPJ'
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
        end
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 233
      Width = 1047
      Height = 24
      BandType = btFooter
      object RLLabel14: TRLLabel
        Left = 966
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
      object RLSystemInfo3: TRLSystemInfo
        Left = 1024
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
      object RLLabel15: TRLLabel
        Left = 1
        Top = 6
        Width = 875
        Height = 14
        Caption = 
          'Legenda: [Rc - Recusado], [Nr  N'#227'o Registrado], [Jl - J'#225' Liquida' +
          'do], [Lt - Liquidado por Limite de Tempo], [Lc - Localizado]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object dtsqryDefault: TDataSource
    DataSet = qryDefault
    Left = 352
    Top = 344
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
      '  EMPRESA.razao AS RAZAOSOCIAL,'
      '  CBR_RETORNO.*'
      'FROM '
      '  CBR_RETORNO'
      
        '    INNER JOIN EMPRESA ON CBR_RETORNO.ID_EMPRESA = EMPRESA.codig' +
        'o'
      'WHERE'
      '  1=1'
      '  AND CBR_RETORNO.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_RETORNO.ID_CBR_RETORNO = :ID_CBR_RETORNO')
    Left = 248
    Top = 328
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_RETORNO'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object qryDefaultRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Size = 100
    end
    object qryDefaultID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultID_CBR_RETORNO: TLargeintField
      FieldName = 'ID_CBR_RETORNO'
      Origin = 'ID_CBR_RETORNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultDTHORA_CADASTRO: TSQLTimeStampField
      FieldName = 'DTHORA_CADASTRO'
      Origin = 'DTHORA_CADASTRO'
    end
    object qryDefaultDTHORA_PROCESSAMENTO: TSQLTimeStampField
      FieldName = 'DTHORA_PROCESSAMENTO'
      Origin = 'DTHORA_PROCESSAMENTO'
    end
    object qryDefaultDTHORA_ARQUIVAMENTO: TSQLTimeStampField
      FieldName = 'DTHORA_ARQUIVAMENTO'
      Origin = 'DTHORA_ARQUIVAMENTO'
    end
    object qryDefaultARQUIVO: TMemoField
      FieldName = 'ARQUIVO'
      Origin = 'ARQUIVO'
      BlobType = ftMemo
    end
    object qryDefaultARQUIVO_NOME: TStringField
      FieldName = 'ARQUIVO_NOME'
      Origin = 'ARQUIVO_NOME'
      Size = 250
    end
    object qryDefaultARQUIVO_DATA: TSQLTimeStampField
      FieldName = 'ARQUIVO_DATA'
      Origin = 'ARQUIVO_DATA'
    end
    object qryDefaultARQUIVO_NUMERO: TIntegerField
      FieldName = 'ARQUIVO_NUMERO'
      Origin = 'ARQUIVO_NUMERO'
    end
    object qryDefaultARQUIVO_LOCAL: TStringField
      FieldName = 'ARQUIVO_LOCAL'
      Origin = 'ARQUIVO_LOCAL'
      Size = 300
    end
    object qryDefaultARQUIVO_MD5: TStringField
      FieldName = 'ARQUIVO_MD5'
      Origin = 'ARQUIVO_MD5'
      Size = 300
    end
    object qryDefaultARQUIVO_QUANT_TITULOS: TIntegerField
      FieldName = 'ARQUIVO_QUANT_TITULOS'
      Origin = 'ARQUIVO_QUANT_TITULOS'
    end
    object qryDefaultSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
  end
  object qryDefaultITEM: TFDQuery
    IndexFieldNames = 'ID_EMPRESA;ID_CBR_RETORNO'
    MasterSource = dtsqryDefault
    MasterFields = 'ID_EMPRESA;ID_CBR_RETORNO'
    DetailFields = 'ID_EMPRESA;ID_CBR_RETORNO'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT'
      '  CBR_RETORNO_TITULOS.ID_EMPRESA,'
      '  CBR_RETORNO_TITULOS.ID_CBR_RETORNO,'
      ''
      '  CBR_RETORNO_TITULOS.NOSSO_NUMERO,'
      '  CBR_RETORNO_TITULOS.VALOR_DOCUMENTO,'
      '  CBR_RETORNO_TITULOS.VALOR_PAGO,'
      '  CBR_RETORNO_TITULOS.VALOR_JUROS,'
      '  CBR_RETORNO_TITULOS.VALOR_DESCONTO,'
      '  CBR_RETORNO_TITULOS.VALOR_DESPESA,'
      '  CBR_RETORNO_TITULOS.TIPO_OCORRENCIA_DESC,'
      '  CBR_RETORNO_TITULOS.TITULO_JALIQUIDADO,'
      '  CBR_RETORNO_TITULOS.TITULO_SEMREGISTRO,'
      '  CBR_RETORNO_TITULOS.TITULO_LIQUIDADO_LIMITEP,'
      '  CBR_RETORNO_TITULOS.TITULO_RECUSADO,'
      '  CBR_RETORNO_TITULOS.TITULO_LOCALIZADO,'
      '  PESSOA.RAZAO AS RAZAOSOCIAL,'
      '  PESSOA.cnpj'
      'FROM'
      '  CBR_RETORNO_TITULOS'
      
        '    LEFT JOIN CRECEBER ON CBR_RETORNO_TITULOS.TITULO = CRECEBER.' +
        'codigo AND CBR_RETORNO_TITULOS.ID_EMPRESA = CRECEBER.fkempresa'
      
        '    LEFT JOIN PESSOA      ON CRECEBER.fkempresa     = PESSOA.emp' +
        'resa          AND CRECEBER.fkcliente          = PESSOA.codigo'
      'WHERE'
      '  1=1'
      '  AND CBR_RETORNO_TITULOS.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_RETORNO_TITULOS.ID_CBR_RETORNO = :ID_CBR_RETORNO')
    Left = 248
    Top = 400
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_RETORNO'
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
    object qryDefaultITEMID_CBR_RETORNO: TLargeintField
      FieldName = 'ID_CBR_RETORNO'
      Origin = 'ID_CBR_RETORNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDefaultITEMNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
      Origin = 'NOSSO_NUMERO'
      Size = 50
    end
    object qryDefaultITEMVALOR_DOCUMENTO: TFMTBCDField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VALOR_DOCUMENTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMVALOR_JUROS: TFMTBCDField
      FieldName = 'VALOR_JUROS'
      Origin = 'VALOR_JUROS'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Origin = 'VALOR_DESCONTO'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMVALOR_DESPESA: TFMTBCDField
      FieldName = 'VALOR_DESPESA'
      Origin = 'VALOR_DESPESA'
      DisplayFormat = ',#0.00'
      Precision = 18
      Size = 2
    end
    object qryDefaultITEMTIPO_OCORRENCIA_DESC: TStringField
      FieldName = 'TIPO_OCORRENCIA_DESC'
      Origin = 'TIPO_OCORRENCIA_DESC'
      OnGetText = qryDefaultITEMTIPO_OCORRENCIA_DESCGetText
      Size = 300
    end
    object qryDefaultITEMTITULO_RECUSADO: TStringField
      FieldName = 'TITULO_RECUSADO'
      Origin = 'TITULO_RECUSADO'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMTITULO_SEMREGISTRO: TStringField
      FieldName = 'TITULO_SEMREGISTRO'
      Origin = 'TITULO_SEMREGISTRO'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMTITULO_JALIQUIDADO: TStringField
      FieldName = 'TITULO_JALIQUIDADO'
      Origin = 'TITULO_JALIQUIDADO'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMTITULO_LIQUIDADO_LIMITEP: TStringField
      FieldName = 'TITULO_LIQUIDADO_LIMITEP'
      Origin = 'TITULO_LIQUIDADO_LIMITEP'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMTITULO_LOCALIZADO: TStringField
      FieldName = 'TITULO_LOCALIZADO'
      Origin = 'TITULO_LOCALIZADO'
      FixedChar = True
      Size = 1
    end
    object qryDefaultITEMRAZAOSOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = qryDefaultITEMRAZAOSOCIALGetText
      Size = 100
    end
    object qryDefaultITEMCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dtsqryDefaultITEM: TDataSource
    DataSet = qryDefaultITEM
    Left = 352
    Top = 424
  end
end
