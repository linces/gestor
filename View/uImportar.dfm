object frmImportar: TfrmImportar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importar'
  ClientHeight = 299
  ClientWidth = 525
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 525
    Height = 62
    Align = alTop
    Caption = 'Filtrar'
    TabOrder = 0
    object Label2: TLabel
      Left = 5
      Top = 15
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
      Left = 5
      Top = 29
      Width = 100
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
      Left = 109
      Top = 29
      Width = 100
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
      Left = 215
      Top = 29
      Width = 88
      Height = 25
      Caption = 'F9 |  Pesquisar'
      TabOrder = 2
      OnClick = btnFiltrarClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 62
    Width = 525
    Height = 237
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Pedido de Venda'
      TabVisible = False
      object Label3: TLabel
        Left = 0
        Top = 0
        Width = 517
        Height = 15
        Align = alTop
        Caption = 'Pedidos cancelados n'#227'o s'#227'o exibidos na pesquisa.'
        ExplicitWidth = 263
      end
      object btnPedido: TBitBtn
        Left = 0
        Top = 190
        Width = 517
        Height = 37
        Align = alBottom
        Caption = 'F2 | Importar Pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnPedidoClick
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 15
        Width = 517
        Height = 175
        Align = alClient
        DataSource = dsPedido
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'N'#250'mero'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Title.Caption = 'Data'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Total'
            Width = 125
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Or'#231'amento'
      ImageIndex = 1
      TabVisible = False
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 517
        Height = 15
        Align = alTop
        Caption = 'S'#243' s'#227'o exibidos or'#231'amentos fechados'
        ExplicitWidth = 199
      end
      object btnOrcamento: TBitBtn
        Left = 0
        Top = 190
        Width = 517
        Height = 37
        Align = alBottom
        Caption = 'F3 | Importar Or'#231'amento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOrcamentoClick
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 15
        Width = 517
        Height = 175
        Align = alClient
        DataSource = dsOrcamento
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'N'#250'mero'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Title.Caption = 'Total'
            Width = 125
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Importar OS'
      ImageIndex = 2
      TabVisible = False
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 517
        Height = 15
        Align = alTop
        Caption = 'S'#243' s'#227'o exibidas OS fechadas'
        ExplicitWidth = 150
      end
      object btnOS: TBitBtn
        Left = 0
        Top = 190
        Width = 517
        Height = 37
        Align = alBottom
        Caption = 'F4 | Importar OS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOSClick
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 15
        Width = 517
        Height = 175
        Align = alClient
        DataSource = DsOs_Master
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'N'#250'mero'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Title.Caption = 'Data'
            Width = 137
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_GERAL'
            Title.Caption = 'Total'
            Width = 125
            Visible = True
          end>
      end
    end
  end
  object qryPedido: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from vendas_master vm'
      'where'
      '(VM.DATA_EMISSAO BETWEEN :DATA1 AND :DATA2) and vm.Total>0'
      'order by vm.data_emissao desc, vm.codigo desc')
    Left = 88
    Top = 96
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryPedidoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryPedidoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryPedidoDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPedidoFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryPedidoFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryPedidoFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryPedidoCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryPedidoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryPedidoTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryPedidoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPedidoTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryPedidoDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryPedidoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPedidoOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryPedidoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryPedidoFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryPedidoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 2
    end
    object qryPedidoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryPedidoNECF: TIntegerField
      FieldName = 'NECF'
      Origin = 'NECF'
    end
    object qryPedidoFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryPedidoLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryPedidoGERA_FINANCEIRO: TStringField
      FieldName = 'GERA_FINANCEIRO'
      Origin = 'GERA_FINANCEIRO'
      Size = 1
    end
    object qryPedidoPERCENTUAL_ACRESCIMO: TFMTBCDField
      FieldName = 'PERCENTUAL_ACRESCIMO'
      Origin = 'PERCENTUAL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPedidoACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPedidoFK_TABELA: TIntegerField
      FieldName = 'FK_TABELA'
      Origin = 'FK_TABELA'
    end
    object qryPedidoPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 30
    end
    object qryPedidoFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
    end
  end
  object dsPedido: TDataSource
    DataSet = qryPedido
    Left = 136
    Top = 88
  end
  object qryOrcamento: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * FROM ORCAMENTO '
      'WHERE'
      'SITUACAO='#39'F'#39' and (DATA BETWEEN :DATA1 AND :DATA2)'
      'ORDER BY 1')
    Left = 208
    Top = 32
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryOrcamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryOrcamentoFKVENDEDOR: TIntegerField
      FieldName = 'FKVENDEDOR'
      Origin = 'FKVENDEDOR'
      DisplayFormat = ',0.00'
    end
    object qryOrcamentoFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Origin = 'FK_CLIENTE'
      DisplayFormat = ',0.00'
    end
    object qryOrcamentoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 50
    end
    object qryOrcamentoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object qryOrcamentoCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 13
    end
    object qryOrcamentoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryOrcamentoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryOrcamentoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qryOrcamentoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 35
    end
    object qryOrcamentoUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryOrcamentoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryOrcamentoFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Origin = 'FORMA_PAGAMENTO'
      Size = 60
    end
    object qryOrcamentoVALIDADE: TSmallintField
      FieldName = 'VALIDADE'
      Origin = 'VALIDADE'
      DisplayFormat = ',0.00'
    end
    object qryOrcamentoOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object qryOrcamentoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryOrcamentoTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryOrcamentoFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryOrcamentoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoCODIGO_WEB: TIntegerField
      FieldName = 'CODIGO_WEB'
      Origin = 'CODIGO_WEB'
      DisplayFormat = ',0.00'
    end
  end
  object dsOrcamento: TDataSource
    DataSet = qryOrcamento
    Left = 208
    Top = 88
  end
  object qryOS_Detalhe: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from os_detalhe'
      'where'
      'fk_OS_MASTER=:ID'
      'order by 1')
    Left = 80
    Top = 28
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryOS_DetalheCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOS_DetalheFK_OS_MASTER: TIntegerField
      FieldName = 'FK_OS_MASTER'
      Origin = 'FK_OS_MASTER'
      Required = True
    end
    object qryOS_DetalheFK_FUNCIONARIO: TIntegerField
      FieldName = 'FK_FUNCIONARIO'
      Origin = 'FK_FUNCIONARIO'
    end
    object qryOS_DetalheFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
    end
    object qryOS_DetalheDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
    end
    object qryOS_DetalheHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
    end
    object qryOS_DetalheDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'DATA_TERMINO'
    end
    object qryOS_DetalheHORA_TERMINO: TTimeField
      FieldName = 'HORA_TERMINO'
      Origin = 'HORA_TERMINO'
    end
    object qryOS_DetalheDISCRIMINACAO: TStringField
      FieldName = 'DISCRIMINACAO'
      Origin = 'DISCRIMINACAO'
      Size = 50
    end
    object qryOS_DetalheFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryOS_DetalheFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
    end
    object qryOS_DetalheTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryOS_DetalheSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 10
    end
    object qryOS_DetalheQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryOS_DetalhePRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryOS_DetalheTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
  end
  object qryOs_Master: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * FROM OS_MASTER '
      'WHERE '
      'SITUACAO='#39'F'#39'AND (DATA_INICIO BETWEEN :DATA1 AND :DATA2)'
      'ORDER BY 1')
    Left = 376
    Top = 68
    ParamData = <
      item
        Name = 'DATA1'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryOs_MasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryOs_MasterDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      Required = True
    end
    object qryOs_MasterHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
      Required = True
    end
    object qryOs_MasterPREVISAO_ENTREGA: TDateField
      FieldName = 'PREVISAO_ENTREGA'
      Origin = 'PREVISAO_ENTREGA'
    end
    object qryOs_MasterDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'DATA_TERMINO'
    end
    object qryOs_MasterHORA_TERMINO: TTimeField
      FieldName = 'HORA_TERMINO'
      Origin = 'HORA_TERMINO'
    end
    object qryOs_MasterDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = 'DATA_ENTREGA'
    end
    object qryOs_MasterHORA_ENTREGA: TTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = 'HORA_ENTREGA'
    end
    object qryOs_MasterFK_ATENDENDE: TIntegerField
      FieldName = 'FK_ATENDENDE'
      Origin = 'FK_ATENDENDE'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterPROBLEMA: TMemoField
      FieldName = 'PROBLEMA'
      Origin = 'PROBLEMA'
      BlobType = ftMemo
    end
    object qryOs_MasterOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryOs_MasterFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object qryOs_MasterNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryOs_MasterFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryOs_MasterFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryOs_MasterSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryOs_MasterNUMERO_SERIE: TStringField
      FieldName = 'NUMERO_SERIE'
      Origin = 'NUMERO_SERIE'
      Size = 30
    end
    object qryOs_MasterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object qryOs_MasterMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 30
    end
    object qryOs_MasterMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 30
    end
    object qryOs_MasterANO: TIntegerField
      FieldName = 'ANO'
      Origin = 'ANO'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 7
    end
    object qryOs_MasterKM: TFMTBCDField
      FieldName = 'KM'
      Origin = 'KM'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterSUBTOTAL_PECAS: TFMTBCDField
      FieldName = 'SUBTOTAL_PECAS'
      Origin = 'SUBTOTAL_PECAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterSUBTOTAL_SERVICOS: TFMTBCDField
      FieldName = 'SUBTOTAL_SERVICOS'
      Origin = 'SUBTOTAL_SERVICOS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterVL_DESC_PECAS: TFMTBCDField
      FieldName = 'VL_DESC_PECAS'
      Origin = 'VL_DESC_PECAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterVL_DESC_SERVICOS: TFMTBCDField
      FieldName = 'VL_DESC_SERVICOS'
      Origin = 'VL_DESC_SERVICOS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterDESC_PERC_PECAS: TFMTBCDField
      FieldName = 'DESC_PERC_PECAS'
      Origin = 'DESC_PERC_PECAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterDESC_PERC_SERVICOS: TFMTBCDField
      FieldName = 'DESC_PERC_SERVICOS'
      Origin = 'DESC_PERC_SERVICOS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryOs_MasterTOTAL_SERVICOS: TFMTBCDField
      FieldName = 'TOTAL_SERVICOS'
      Origin = 'TOTAL_SERVICOS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryOs_MasterTOTAL_PRODUTOS: TFMTBCDField
      FieldName = 'TOTAL_PRODUTOS'
      Origin = 'TOTAL_PRODUTOS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryOs_MasterTOTAL_GERAL: TFMTBCDField
      FieldName = 'TOTAL_GERAL'
      Origin = 'TOTAL_GERAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 4
    end
    object qryOs_MasterENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryOs_MasterBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qryOs_MasterCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 35
    end
    object qryOs_MasterUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 50
    end
    object qryOs_MasterDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryOs_MasterNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryOs_MasterNOME_TIME: TStringField
      FieldName = 'NOME_TIME'
      Origin = 'NOME_TIME'
      Size = 50
    end
    object qryOs_MasterTIPO_SERVICO: TStringField
      FieldName = 'TIPO_SERVICO'
      Origin = 'TIPO_SERVICO'
      Size = 100
    end
    object qryOs_MasterFK_TIPO_TECIDO: TIntegerField
      FieldName = 'FK_TIPO_TECIDO'
      Origin = 'FK_TIPO_TECIDO'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryOs_MasterFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryOs_MasterFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Origin = 'FK_CLIENTE'
      DisplayFormat = ',0.00'
    end
  end
  object DsOs_Master: TDataSource
    DataSet = qryOs_Master
    Left = 296
    Top = 80
  end
  object qryItensO: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'select oi.*, pro.descricao VIRTUAL_PRODUTO, pro.pr_venda VIRTUAL' +
        '_PRECO, pro.unidade VIRTUAL_UNIDADE, pro.LOCALIZACAO VIRTUAL_LOC' +
        'AL, pro.REFERENCIA VIRTUAL_REFERENCIA, gr.DESCRICAO as Grade fro' +
        'm orcamento_item oi '
      'left join produto pro on pro.codigo=oi.fk_produto'
      'left join PRODUTO_GRADE gr on gr.codigo=oi.fk_grade'
      'where'
      'oi.fk_orcamento=:CODIGO'
      'order by oi.item')
    Left = 386
    Top = 152
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensOCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensOFK_ORCAMENTO: TIntegerField
      FieldName = 'FK_ORCAMENTO'
      Origin = 'FK_ORCAMENTO'
      Required = True
    end
    object qryItensOFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
    end
    object qryItensOQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItensOPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensOTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensOITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItensOVIRTUAL_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VIRTUAL_PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryItensOVIRTUAL_PRECO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VIRTUAL_PRECO'
      Origin = 'PR_VENDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryItensOVIRTUAL_UNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VIRTUAL_UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object qryItensOVIRTUAL_LOCAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VIRTUAL_LOCAL'
      Origin = 'LOCALIZACAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryItensOVIRTUAL_REFERENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VIRTUAL_REFERENCIA'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryItensOFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
      DisplayFormat = ',0.00'
    end
    object qryItensOGRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GRADE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 248
    Top = 152
  end
  object qryItens: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from VENDAS_DETALHE'
      'where '
      'fkvenda=:codigo')
    Left = 88
    Top = 168
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object qryItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryItensITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItensCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItensQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItensE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryItensPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryItensVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object qryItensVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      Precision = 18
      Size = 2
    end
    object qryItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryItensSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItensQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryItensACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryItensOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryItensFK_GRADE: TIntegerField
      FieldName = 'FK_GRADE'
      Origin = 'FK_GRADE'
    end
    object qryItensID_PRODUTO_SIMILAR: TIntegerField
      FieldName = 'ID_PRODUTO_SIMILAR'
      Origin = 'ID_PRODUTO_SIMILAR'
    end
    object qryItensID_SERIAL: TIntegerField
      FieldName = 'ID_SERIAL'
      Origin = 'ID_SERIAL'
    end
  end
end
