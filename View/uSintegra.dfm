object frmSintegra: TfrmSintegra
  Left = 729
  Top = 230
  BorderStyle = bsSingle
  Caption = 'Sintegra'
  ClientHeight = 453
  ClientWidth = 570
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 545
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 570
    Height = 120
    Align = alTop
    Caption = ' Cabe'#231'alho do Arquivo '
    TabOrder = 0
    object Label3: TLabel
      Left = 377
      Top = 68
      Width = 54
      Height = 13
      Caption = 'Conv'#234'nio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 3
      Top = 68
      Width = 207
      Height = 13
      Caption = 'Natureza das Opera'#231#245'es Informadas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 247
      Top = 68
      Width = 59
      Height = 13
      Caption = 'Finalidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 3
      Top = 24
      Width = 32
      Height = 13
      Caption = 'CNPJ'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 427
      Top = 25
      Width = 13
      Height = 13
      Caption = 'IE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 377
      Top = 84
      Width = 176
      Height = 21
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 2
      Text = '3 - Conv'#234'nio 57/95 Alt. 76/03'
      Items.Strings = (
        '1 - Conv'#234'nio 57/95 Vers'#227'o 31/99 Alt. 30/02'
        '2 - Conv'#234'nio 57/95 Vers'#227'o 69/02 Alt. 142/02  '
        '3 - Conv'#234'nio 57/95 Alt. 76/03')
    end
    object ComboBox2: TComboBox
      Left = 3
      Top = 84
      Width = 238
      Height = 21
      Style = csDropDownList
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 2
      ParentFont = False
      TabOrder = 3
      Text = '3 - Totalidade das opera'#231#245'es do informante'
      Items.Strings = (
        
          '1 - Interestaduais - Somente opera'#231#245'es sujeitas ao regime de Sub' +
          'stitui'#231#227'o Tribut'#225'ria'
        
          '2 - Interestaduais - Opera'#231#245'es com ou sem Substitui'#231#227'o Tribut'#225'ri' +
          'a'
        '3 - Totalidade das opera'#231#245'es do informante')
    end
    object ComboBox3: TComboBox
      Left = 247
      Top = 84
      Width = 124
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 4
      Text = '1 - Normal'
      Items.Strings = (
        '1 - Normal'
        '2 - Retifica'#231#227'o Total de Arquivo'
        '5 - Desfazimento de Arquivo')
    end
    object Edit2: TEdit
      Left = 2
      Top = 40
      Width = 419
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 28
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '11111111111111'
    end
    object Edit3: TEdit
      Left = 426
      Top = 40
      Width = 127
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 28
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'ISENTO'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 570
    Height = 53
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 25
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 200
    Width = 570
    Height = 200
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 120
    Width = 570
    Height = 80
    Align = alTop
    TabOrder = 3
    object GroupBox3: TGroupBox
      Left = 2
      Top = 15
      Width = 271
      Height = 63
      Align = alLeft
      Caption = ' Per'#237'odo '
      TabOrder = 0
      object Label7: TLabel
        Left = 9
        Top = 19
        Width = 35
        Height = 13
        Caption = 'Inicial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 127
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Final'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MaskEdit1: TMaskEdit
        Left = 10
        Top = 35
        Width = 88
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/06/2019'
      end
      object MaskEdit2: TMaskEdit
        Left = 127
        Top = 35
        Width = 88
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '30/06/2019'
      end
    end
    object GroupBox4: TGroupBox
      Left = 273
      Top = 15
      Width = 271
      Height = 63
      Align = alLeft
      Caption = 'Invent'#225'rio'
      TabOrder = 1
      object MaskEdit3: TMaskEdit
        Left = 168
        Top = 35
        Width = 88
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '01/06/2019'
      end
      object CheckBox1: TCheckBox
        Left = 14
        Top = 37
        Width = 115
        Height = 17
        Caption = 'Gerar Invent'#225'rio'
        TabOrder = 1
      end
    end
  end
  object qry50: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'T'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'CO.dtentrada,'
      'CO.modelo,'
      'CO.serie,'
      'CO.nr_nota,'
      'CI.cfop,'
      'CI.aliq_icms,'
      'CO.status,'
      'SUM(CI.total) AS TOTAL,'
      'SUM(CI.base_icms) AS BASE,'
      'SUM(CI.base_st) AS BASE_ST,'
      'SUM(CI.vl_icms) AS VALOR,'
      'SUM(CI.vl_st) AS VALOR_ST'
      ''
      'From compra_itens CI'
      'left join compra CO  on CO.id=CI.fk_compra'
      'left join pessoa PES on PES.codigo=CO.fornecedor '
      'where'
      
        'CO.dtentrada BETWEEN :DT1 AND :DT2 AND CO.STATUS='#39'F'#39' and  co.mod' +
        'elo='#39'55'#39' and co.serie<>'#39'920'#39' and co.EMPRESA=:empresa'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_icms) AS BASE,'
      'SUM(NFD.valor_icms) AS VALOR,'
      'SUM(NFD.base_icms_st) AS BASE_ST,'
      'SUM(NFD.valor_icms_st) AS VALOR_ST'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'E'#39' AND (NF' +
        'M.situacao =2) and nfm.serie<>'#39'920'#39' and'
      'nfm.fkempresa=:empresa'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_icms) AS BASE,'
      'SUM(NFD.valor_icms) AS VALOR,'
      'SUM(NFD.base_icms_st) AS BASE_ST,'
      'SUM(NFD.valor_icms_st) AS VALOR_ST'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'S'#39' AND (NF' +
        'M.situacao =2) and nfm.serie<>'#39'920'#39' and'
      'nfm.fkempresa=:empresa'
      'group by 1,2,3,4,5,6,7,8,9,10,11')
    Left = 55
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftSmallint
        ParamType = ptInput
      end>
    object qry50TABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qry50CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qry50UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qry50IE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qry50DTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
    end
    object qry50MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qry50SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qry50NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object qry50CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qry50ALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry50STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
    object qry50TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qry50BASE: TFMTBCDField
      FieldName = 'BASE'
      Origin = 'BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qry50VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qry50BASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Precision = 18
      Size = 6
    end
    object qry50VALOR_ST: TFMTBCDField
      FieldName = 'VALOR_ST'
      Origin = 'VALOR_ST'
      Precision = 18
      Size = 6
    end
  end
  object qry51: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'T'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'CO.dtentrada,'
      'CO.modelo,'
      'CO.serie,'
      'CO.nr_nota,'
      'CI.cfop,'
      'CI.aliq_icms,'
      'CO.status,'
      'SUM(CI.total) AS TOTAL,'
      'SUM(CI.base_ipi) AS BASE,'
      'SUM(CI.vl_ipi) AS VALOR'
      ''
      'From compra_itens CI'
      'left join compra CO  on CO.id=CI.fk_compra'
      'left join pessoa PES on PES.codigo=CO.fornecedor'
      'where'
      
        'CO.dtentrada BETWEEN :DT1 AND :DT2  AND CO.STATUS='#39'F'#39' and  co.mo' +
        'delo='#39'55'#39' and (ci.vl_ipi>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_ipi) AS BASE,'
      'SUM(NFD.valor_ipi) AS VALOR'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'E'#39' AND (NF' +
        'M.situacao =2) and (nfm.total_ipi>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_ipi) AS BASE,'
      'SUM(NFD.valor_ipi) AS VALOR'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'S'#39' AND (NF' +
        'M.situacao =2) and (nfm.total_ipi>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      ''
      ''
      ''
      '')
    Left = 103
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qry51TABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qry51CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qry51UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qry51IE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qry51DTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
    end
    object qry51MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qry51SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qry51NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object qry51CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qry51ALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry51STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
    object qry51TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qry51BASE: TFMTBCDField
      FieldName = 'BASE'
      Origin = 'BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qry51VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
  end
  object QRY53: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'T'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'CO.dtentrada,'
      'CO.modelo,'
      'CO.serie,'
      'CO.nr_nota,'
      'CI.cfop,'
      'CI.aliq_st,'
      'CO.status,'
      'SUM(CI.vl_item) AS TOTAL,'
      'SUM(CI.base_st) AS BASE,'
      'SUM(CI.vl_st) AS VALOR'
      ''
      'From compra_itens CI'
      'left join compra CO  on CO.id=CI.fk_compra'
      'left join pessoa PES on PES.codigo=CO.fornecedor'
      'where'
      
        'CO.dtentrada BETWEEN :DT1 AND :DT2  AND CO.STATUS='#39'F'#39' and  co.mo' +
        'delo='#39'55'#39' and (co.total_st>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms_st,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_icms_st) AS BASE,'
      'SUM(NFD.valor_icms_st) AS VALOR'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'E'#39' AND (NF' +
        'M.situacao =2) and (nfm.valor_icms_st>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      'union all'
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.aliq_icms_st,'
      'NFM.situacao,'
      'SUM(NFD.vl_operacao) AS TOTAL,'
      'SUM(NFD.base_icms_st) AS BASE,'
      'SUM(NFD.valor_icms_st) AS VALOR'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'S'#39' AND (NF' +
        'M.situacao =2) and (nfm.valor_icms_st>0)'
      'group by 1,2,3,4,5,6,7,8,9,10,11'
      ''
      ''
      ''
      ''
      '')
    Left = 151
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QRY53TABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRY53CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object QRY53UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QRY53IE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object QRY53DTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
    end
    object QRY53MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object QRY53SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object QRY53NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object QRY53CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object QRY53ALIQ_ST: TFMTBCDField
      FieldName = 'ALIQ_ST'
      Origin = 'ALIQ_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QRY53STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 1
    end
    object QRY53TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY53BASE: TFMTBCDField
      FieldName = 'BASE'
      Origin = 'BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY53VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
  end
  object QRY54: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'T'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'CO.dtentrada,'
      'CO.modelo,'
      'CO.serie,'
      'CO.nr_nota,'
      'CI.cfop,'
      'CI.cst_icm,'
      'CI.item,'
      'CI.fk_produto,'
      'pro.descricao,'
      'pro.unidade,'
      'ci.qtd,'
      'ci.vl_item,'
      'ci.desconto,'
      'ci.base_icms,'
      'ci.base_st,'
      'ci.vl_ipi,'
      'ci.aliq_icms'
      'From compra_itens CI'
      'left join compra CO  on CO.id=CI.fk_compra'
      'left join pessoa PES on PES.codigo=CO.fornecedor'
      'left join produto pro on pro.codigo=Ci.fk_produto'
      'where'
      
        'CO.dtentrada BETWEEN :DT1 AND :DT2  AND CO.STATUS='#39'F'#39' and  co.mo' +
        'delo='#39'55'#39'  and co.serie<>'#39'920'#39' and co.empresa=:empresa'
      ''
      ''
      'union all'
      ''
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFM.numero,'
      'NFD.cfop,'
      'NFD.cst,'
      'NFD.item,'
      'NFD.id_produto,'
      'pro.descricao,'
      'pro.unidade,'
      'NFD.QTD,'
      'NFD.vl_operacao as total,'
      'NFD.desconto,'
      'NFD.base_icms,'
      'NFD.base_icms_st,'
      'NFD.valor_ipi,'
      'NFD.aliq_icms'
      ''
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'E'#39' AND (NF' +
        'M.situacao =2)  and NFM.serie<>'#39'920'#39' and'
      'nfm.fkempresa=:empresa'
      ''
      ''
      'union all'
      ''
      'Select'
      #39'P'#39' as tabela,'
      'PES.cnpj,'
      'PES.UF,'
      'PES.IE,'
      'NFeM.data_emissao,'
      'NFeM.modelo,'
      'NFeM.serie,'
      'NFeM.numero,'
      'NFD.cfop,'
      'NFD.cst,'
      'NFD.item,'
      'NFD.id_produto,'
      'pro.descricao,'
      'pro.unidade,'
      'NFD.QTD,'
      'NFD.vl_operacao as total,'
      'NFD.desconto,'
      'NFD.base_icms,'
      'NFD.base_icms_st,'
      'NFD.valor_ipi,'
      'NFD.aliq_icms'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfem  on nfem.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFeM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'where'
      
        'NFeM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'S'#39' AND (N' +
        'FeM.situacao =2) and NFeM.serie<>'#39'920'#39' and'
      'nfem.fkempresa=:empresa'
      ''
      ''
      ''
      '')
    Left = 207
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end>
    object QRY54TABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QRY54CNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object QRY54UF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QRY54IE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object QRY54DTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
    end
    object QRY54MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object QRY54SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object QRY54NR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object QRY54CFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object QRY54CST_ICM: TStringField
      FieldName = 'CST_ICM'
      Origin = 'CST_ICM'
      Size = 5
    end
    object QRY54ITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      DisplayFormat = ',0.00'
    end
    object QRY54FK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object QRY54DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object QRY54UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object QRY54QTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54VL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54DESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54BASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54BASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54VL_IPI: TFMTBCDField
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object QRY54ALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qry61: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'Select'
      #39'P'#39' as tabela,'
      'NFM.data_emissao,'
      'NFM.modelo,'
      'NFM.serie,'
      'NFD.aliq_icms,'
      'MIN(NFM.numero)MENOR_NUMERO,'
      'MAX(NFM.numero) MAIOR_NUMERO,'
      'SUM(NFD.total) TOTAL,'
      'SUM(NFD.base_icms) BASE,'
      'SUM(NFD.valor_icms) VALOR'
      'From nfce_detalhe NFD'
      'left join nfce_master NFM  on NFM.codigo=NFD.fkvenda'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2  AND NFM.situacao='#39'T'#39' and' +
        ' NFM.fkempresa=:EMPRESA'
      'group by 1,2,3,4,5'
      ''
      'union all'
      ''
      'Select'
      #39'P'#39' as tabela,'
      'NFEM.data_emissao,'
      'NFEM.modelo,'
      'NFEM.serie,'
      'NFED.aliq_icms,'
      'MIN(NFEM.numero)MENOR_NUMERO,'
      'MAX(NFEM.numero) MAIOR_NUMERO,'
      'SUM(NFED.vl_operacao) TOTAL,'
      'SUM(NFED.base_icms) BASE,'
      'SUM(NFED.valor_icms) VALOR'
      'From nfe_detalhe NFED'
      'left join nfe_master NFEM  on NFEM.codigo=NFED.fknfe'
      'where'
      
        'NFEM.data_emissao BETWEEN :DT1 AND :DT2  AND NFEM.situacao='#39'2'#39' A' +
        'ND NFEM.serie='#39'920'#39' AND NFEM.fkempresa=:empresa'
      'group by 1,2,3,4,5')
    Left = 343
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end>
    object qry61TABELA: TStringField
      FieldName = 'TABELA'
      Origin = 'TABELA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qry61DATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qry61MODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qry61SERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qry61ALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry61MENOR_NUMERO: TIntegerField
      FieldName = 'MENOR_NUMERO'
      Origin = 'MENOR_NUMERO'
      DisplayFormat = ',0.00'
    end
    object qry61MAIOR_NUMERO: TIntegerField
      FieldName = 'MAIOR_NUMERO'
      Origin = 'MAIOR_NUMERO'
      DisplayFormat = ',0.00'
    end
    object qry61TOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry61BASE: TFMTBCDField
      FieldName = 'BASE'
      Origin = 'BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry61VALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qry61R: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select'
      'data_emissao,'
      'id_produto,'
      'descricao,'
      'unidade,'
      'aliq_icms,'
      'sum(qtd) qtd,'
      'sum(valor_item) valor_item,'
      'sum(base_icms) base_icms'
      'from('
      'Select'
      'NFM.data_emissao,'
      'NFD.id_produto,'
      'pro.descricao, '
      'pro.unidade,'
      'NFD.qtd,'
      'NFD.valor_item,'
      'NFD.base_icms,'
      'NFD.aliq_icms'
      'FROM'
      'nfce_detalhe NFD'
      'left join nfce_master NFM  on NFM.codigo=NFD.fkvenda'
      'left join produto PRO  on PRO.codigo=NFD.id_produto'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2  AND NFM.situacao='#39'T'#39' AND' +
        ' NFM.fkempresa=:empresa'
      ''
      ''
      'union all'
      ''
      'Select'
      'NFEM.data_emissao,'
      'NFED.id_produto,'
      'pro.descricao, '
      'pro.unidade,'
      'NFED.qtd,'
      'NFED.total,'
      'NFED.base_icms,'
      'NFED.aliq_icms'
      'From nfe_detalhe NFED'
      'left join nfe_master NFEM  on NFEM.codigo=NFED.fknfe'
      'left join produto PRO  on PRO.codigo=NFED.id_produto'
      'where'
      
        'NFEM.data_emissao BETWEEN :DT1 AND :DT2  AND NFEM.situacao='#39'2'#39' A' +
        'ND NFEM.serie='#39'920'#39' and nfem.fkempresa=:empresa'
      ')'
      'group by 1,2,3,4,5')
    Left = 263
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qry61RDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qry61RID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qry61RDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qry61RUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qry61RQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qry61RVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry61RBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry61RALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object qry75: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select distinct(codigo) as codigo, descricao, unidade, ncm from ' +
        '('
      'Select'
      'pro.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.ncm'
      'From compra_itens CI'
      'left join compra CO  on CO.id=CI.fk_compra'
      'left join pessoa PES on PES.codigo=CO.fornecedor'
      'left join produto pro on pro.codigo=Ci.fk_produto'
      'where'
      
        'CO.dtentrada BETWEEN :DT1 AND :DT2  AND CO.STATUS='#39'F'#39' and  co.mo' +
        'delo='#39'55'#39'  and co.serie<>'#39'920'#39' and co.empresa=:empresa'
      ''
      ''
      'union all'
      ''
      ''
      'Select'
      'pro.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.ncm'
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'E'#39' AND (NF' +
        'M.situacao =2)  and NFM.serie<>'#39'920'#39' and nfm.fkempresa=:empresa'
      ''
      ''
      'union all'
      ''
      'Select'
      'pro.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.ncm'
      ''
      'From nfe_detalhe nfd'
      'left join nfe_master nfm  on nfm.codigo=nfd.fknfe'
      'left join pessoa PES on PES.codigo=NFM.id_cliente'
      'left join CFOP on CFOP.codigo=NFD.cfop'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2 AND CFOP.tipo='#39'S'#39' AND (NF' +
        'M.situacao =2) and NFM.serie<>'#39'920'#39' and nfm.fkempresa=:empresa'
      ''
      'union all'
      ''
      
        'select pro.codigo, pro.descricao, pro.unidade, pro.ncm  from com' +
        'pra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      
        'co.dtentrada<=:data and co.status='#39'F'#39' AND co.ehfiscal='#39'S'#39' and co' +
        '.empresa=:empresa'
      ''
      'union all'
      ''
      
        'select pro.codigo, pro.descricao, pro.unidade, pro.ncm   from nf' +
        'ce_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join nfce_master vm on vm.codigo=vd.fkvenda'
      'where'
      
        'vm.data_emissao<=:data and VM.situacao='#39'T'#39' and vm.fkempresa=:emp' +
        'resa'
      ''
      'union all'
      ''
      
        'select pro.codigo, pro.descricao, pro.unidade, pro.ncm   from nf' +
        'e_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      
        'nfm.data_emissao<:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39'S' +
        #39' and cfop.mov_es='#39'S'#39' and nfm.fkempresa=:empresa'
      ''
      'union all'
      
        'select pro.codigo, pro.descricao, pro.unidade, pro.ncm   from nf' +
        'e_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      
        'nfm.data_emissao<=:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39 +
        'E'#39' and cfop.mov_es='#39'S'#39' and nfm.fkempresa=:empresa'
      ''
      'union all'
      ''
      'Select'
      'pro.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.ncm'
      'FROM'
      'nfce_detalhe NFD'
      'left join nfce_master NFM  on NFM.codigo=NFD.fkvenda'
      'left join produto PRO  on PRO.codigo=NFD.id_produto'
      'where'
      
        'NFM.data_emissao BETWEEN :DT1 AND :DT2  AND NFM.situacao='#39'T'#39' and' +
        ' nfm.fkempresa=:empresa'
      ''
      ''
      'union all'
      ''
      'Select'
      'pro.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.ncm'
      'From nfe_detalhe NFED'
      'left join nfe_master NFEM  on NFEM.codigo=NFED.fknfe'
      'left join produto PRO  on PRO.codigo=NFED.id_produto'
      'where'
      
        'NFEM.data_emissao BETWEEN :DT1 AND :DT2  AND NFEM.situacao='#39'2'#39' A' +
        'ND NFEM.serie='#39'920'#39' and nfem.fkempresa=:empresa'
      ''
      ')'
      ''
      'order by codigo'
      ''
      '')
    Left = 447
    Top = 128
    ParamData = <
      item
        Name = 'DT1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT2'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qry75CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      DisplayFormat = ',0.00'
    end
    object qry75DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qry75UNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qry75NCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
  end
  object qry74: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select fk_produto, descricao,pr_custo, sum(qtde) qtde, sum(efisc' +
        'als) qtds, sum(qtde-efiscals) saldo from('
      
        'select ci.fk_produto, pro.descricao, pro.pr_custo, ci.e_medio qt' +
        'de, 0 as efiscals  from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      
        'co.dtentrada<=:data and co.status='#39'F'#39' AND co.ehfiscal='#39'S'#39'  and c' +
        'o.empresa=:empresa'
      'union all'
      
        'select vd.id_produto, pro.descricao, pro.pr_custo, 0 as qtde,  v' +
        'd.qtd as efiscals   from nfce_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join nfce_master vm on vm.codigo=vd.fkvenda'
      'where'
      
        'vm.data_emissao<=:data and VM.situacao='#39'T'#39' and vm.fkempresa=empr' +
        'esa'
      ''
      'union all'
      
        'select nfd.id_produto, pro.descricao, pro.pr_custo, 0 as qtde,  ' +
        'nfd.qtd as efiscals   from nfe_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      
        'nfm.data_emissao<=:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39 +
        'S'#39' and cfop.mov_es='#39'S'#39' and nfm.fkempresa=:empresa'
      ''
      'union all'
      
        'select nfd.id_produto, pro.descricao, pro.pr_custo, nfd.qtd as q' +
        'tde,  0 as efiscals   from nfe_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      
        'nfm.data_emissao<:data and nfm.situacao='#39'2'#39' and nfm.movimento='#39'E' +
        #39' and cfop.mov_es='#39'S'#39' and nfm.fkempresa=:empresa'
      ''
      ')'
      'group by 1,2,3'
      'having sum(qtde-efiscals)>0'
      'order by 2'
      '')
    Left = 399
    Top = 128
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        ParamType = ptInput
      end>
    object qry74FK_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object qry74DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qry74PR_CUSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qry74QTDE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qry74QTDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDS'
      Origin = 'QTDS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qry74SALDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
  end
end
