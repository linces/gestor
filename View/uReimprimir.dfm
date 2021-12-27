object frmReimprimir: TfrmReimprimir
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Reimprimir NFCe'
  ClientHeight = 299
  ClientWidth = 813
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 0
    Top = 62
    Width = 813
    Height = 17
    Align = alTop
    Caption = 'NFCe Transmitidos ou Conting'#234'ncia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 207
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 813
    Height = 62
    Align = alTop
    Caption = 'Filtrar'
    TabOrder = 0
    object Label2: TLabel
      Left = 13
      Top = 12
      Width = 41
      Height = 15
      Caption = 'Per'#237'odo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object maskInicio: TMaskEdit
      Left = 13
      Top = 26
      Width = 77
      Height = 23
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object maskFim: TMaskEdit
      Left = 97
      Top = 26
      Width = 79
      Height = 23
      Ctl3D = False
      EditMask = '!99/99/0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object btnFiltrar: TBitBtn
      Left = 182
      Top = 26
      Width = 145
      Height = 25
      Caption = 'F2 |  Pesquisar NFCe'
      TabOrder = 2
      OnClick = btnFiltrarClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 79
    Width = 813
    Height = 183
    Align = alClient
    DataSource = dsVenda
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI Semibold'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZAO'
        Title.Caption = 'Cliente'
        Width = 469
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total'
        Width = 112
        Visible = True
      end>
  end
  object btnPedido: TBitBtn
    Left = 0
    Top = 262
    Width = 813
    Height = 37
    Align = alBottom
    Caption = 'F3 | Imprimir NFC-e'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnPedidoClick
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 248
    Top = 152
  end
  object qryVenda: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    UpdateOptions.AssignedValues = [uvRefreshMode]
    SQL.Strings = (
      
        'select VM.numero, vm.data_emissao,  pes.razao, vm.total from NFC' +
        'E_MASTER vm'
      'left join pessoa pes on pes.codigo=vm.id_cliente'
      'where '
      
        '(vm.data_emissao between :data1 and :data2) and (vm.situacao in ' +
        '('#39'T'#39','#39'O'#39'))'
      'order by vm.numero desc')
    Left = 45
    Top = 128
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryVendaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryVendaRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    Left = 120
    Top = 128
  end
  object qryNFCE_M: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT * FROM NFCE_MASTER'
      'WHERE'
      'NUMERO=:ID')
    Left = 432
    Top = 8
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryNFCE_MCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFCE_MNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryNFCE_MCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryNFCE_MMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryNFCE_MSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryNFCE_MDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryNFCE_MDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryNFCE_MHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryNFCE_MHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryNFCE_MID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryNFCE_MID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryNFCE_MFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryNFCE_MFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryNFCE_MFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryNFCE_MCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryNFCE_MTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryNFCE_MOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryNFCE_MSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryNFCE_MEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryNFCE_MXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryNFCE_MPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryNFCE_MMOTIVOCANCELAMENTO: TStringField
      FieldName = 'MOTIVOCANCELAMENTO'
      Origin = 'MOTIVOCANCELAMENTO'
      Size = 200
    end
    object qryNFCE_MFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryNFCE_MABERTO: TStringField
      FieldName = 'ABERTO'
      Origin = 'ABERTO'
      Size = 1
    end
    object qryNFCE_MFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryNFCE_MFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryNFCE_MSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      Precision = 18
      Size = 2
    end
    object qryNFCE_MSAT_NUMERO_CFE: TIntegerField
      FieldName = 'SAT_NUMERO_CFE'
      Origin = 'SAT_NUMERO_CFE'
      DisplayFormat = ',0.00'
    end
    object qryNFCE_MSAT_NUMERO_SERIE: TStringField
      FieldName = 'SAT_NUMERO_SERIE'
      Origin = 'SAT_NUMERO_SERIE'
      Size = 10
    end
    object qryNFCE_MCNF: TStringField
      FieldName = 'CNF'
      Origin = 'CNF'
    end
  end
end
