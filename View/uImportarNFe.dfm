object frmImportarNFe: TfrmImportarNFe
  Left = 0
  Top = 0
  ActiveControl = PageImportar
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importar'
  ClientHeight = 388
  ClientWidth = 600
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
  object pageMenu: TPageControl
    Left = 0
    Top = 0
    Width = 600
    Height = 388
    ActivePage = TabSheetImportar
    Align = alClient
    TabOrder = 0
    object TabSheetMenu: TTabSheet
      Caption = 'Menu'
      ImageIndex = 1
      object btnPedido: TButton
        Left = 168
        Top = 57
        Width = 225
        Height = 44
        BiDiMode = bdLeftToRight
        Caption = 'F2 Pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnPedidoClick
      end
      object btnOrcamento: TButton
        Left = 168
        Top = 109
        Width = 225
        Height = 44
        BiDiMode = bdLeftToRight
        Caption = 'F3 Or'#231'amento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object btnDevcompra: TButton
        Left = 168
        Top = 162
        Width = 225
        Height = 44
        BiDiMode = bdLeftToRight
        Caption = 'F4 Devolu'#231#227'o de Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object btnDevVenda: TButton
        Left = 168
        Top = 212
        Width = 225
        Height = 44
        BiDiMode = bdLeftToRight
        Caption = 'F5 Devolu'#231#227'o de Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
        OnClick = Button4Click
      end
    end
    object TabSheetImportar: TTabSheet
      Caption = 'Importar'
      object PageImportar: TPageControl
        Left = 0
        Top = 97
        Width = 592
        Height = 226
        ActivePage = TabSheetOrcamento
        Align = alClient
        TabOrder = 0
        object TabSheetOrcamento: TTabSheet
          Caption = 'Or'#231'amento'
          ImageIndex = 1
          object DBGrid3: TDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 198
            Align = alClient
            DataSource = dsOrcamento
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid3DrawColumnCell
            OnDblClick = DBGrid3DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'SELECAO'
                Title.Caption = ' '
                Width = 21
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'd.'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLIENTE'
                Title.Caption = 'Cliente'
                Width = 311
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 70
                Visible = True
              end>
          end
          object chkorcamento: TCheckBox
            Left = 18
            Top = 6
            Width = 16
            Height = 15
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnClick = chkorcamentoClick
          end
        end
        object TabSheetVenda: TTabSheet
          Caption = 'Venda'
          ImageIndex = 2
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 198
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
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid2DrawColumnCell
            OnDblClick = DBGrid2DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'SELECAO'
                Title.Caption = ' '
                Width = 21
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'd.'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_EMISSAO'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Title.Caption = 'Cliente'
                Width = 318
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 63
                Visible = True
              end>
          end
          object ChkVenda: TCheckBox
            Left = 18
            Top = 6
            Width = 14
            Height = 15
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            OnClick = ChkVendaClick
          end
        end
        object TabSheetDevC: TTabSheet
          Caption = 'Devolu'#231#227'o Compra'
          ImageIndex = 4
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 198
            Align = alClient
            DataSource = dsDevolucaoC
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'd.'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'Cliente'
                Width = 308
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 87
                Visible = True
              end>
          end
        end
        object TabSheetDevV: TTabSheet
          Caption = 'Devolu'#231#227'o Venda'
          ImageIndex = 5
          object DBGrid5: TDBGrid
            Left = 0
            Top = 0
            Width = 584
            Height = 198
            Align = alClient
            DataSource = dsDevolucaoV
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODIGO'
                Title.Caption = 'C'#243'd.'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAZAO'
                Title.Caption = 'Cliente'
                Width = 323
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 77
                Visible = True
              end>
          end
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 97
        Align = alTop
        Caption = 'Filtrar'
        TabOrder = 1
        object Label1: TLabel
          Left = 15
          Top = 55
          Width = 44
          Height = 15
          Caption = 'N'#250'mero'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 125
          Top = 55
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
        object Label3: TLabel
          Left = 13
          Top = 16
          Width = 100
          Height = 15
          Caption = 'Selecione o Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtNumero: TEdit
          Left = 15
          Top = 69
          Width = 106
          Height = 21
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          NumbersOnly = True
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object maskInicio: TMaskEdit
          Left = 125
          Top = 69
          Width = 74
          Height = 21
          Ctl3D = False
          EditMask = '!99/99/0000;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Text = '  /  /    '
        end
        object maskFim: TMaskEdit
          Left = 205
          Top = 69
          Width = 75
          Height = 21
          Ctl3D = False
          EditMask = '!99/99/0000;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 10
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Text = '  /  /    '
        end
        object btnFiltrar: TBitBtn
          Left = 286
          Top = 66
          Width = 88
          Height = 25
          Caption = 'F9 |  Pesquisar'
          TabOrder = 4
          OnClick = btnFiltrarClick
        end
        object edtPessoa: TEdit
          Left = 13
          Top = 30
          Width = 524
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object BtnImportar: TBitBtn
        Left = 0
        Top = 323
        Width = 592
        Height = 37
        Align = alBottom
        Caption = 'F10 | Importar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnImportarClick
        ExplicitTop = 325
      end
    end
  end
  object qryOrcamento: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select orc.* from orcamento orc'
      'where'
      '(orc.data between :data1 and :data2) and'
      '(orc.cliente like :cliente) and'
      '(orc.situacao='#39'F'#39')'
      'order by orc.data desc')
    Left = 64
    Top = 200
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
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object qryOrcamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOrcamentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryOrcamentoFKVENDEDOR: TIntegerField
      FieldName = 'FKVENDEDOR'
      Origin = 'FKVENDEDOR'
    end
    object qryOrcamentoFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Origin = 'FK_CLIENTE'
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
    end
    object qryOrcamentoSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryOrcamentoSELECAO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SELECAO'
    end
  end
  object qryItemO: TFDQuery
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select OI.*, pro.descricao as produto from ORCAMENTO_ITEM OI'
      'left join produto pro on pro.codigo=oi.fk_produto'
      'where'
      'oi.fk_orcamento=:codigo'
      ''
      '')
    Left = 64
    Top = 248
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItemOCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemOFK_ORCAMENTO: TIntegerField
      FieldName = 'FK_ORCAMENTO'
      Origin = 'FK_ORCAMENTO'
      Required = True
    end
    object qryItemOFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
    end
    object qryItemOQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryItemOPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryItemOTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryItemOITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItemOPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryPV: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select PV.* from VENDAS_MASTER PV'
      'where'
      '(pv.data_emissao between :data1 and :data2) and'
      '(pv.nome like :nome) and'
      '(pv.SITUACAO='#39'F'#39')'
      'order by pv.data_emissao desc'
      ''
      ''
      '')
    Left = 136
    Top = 199
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
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object qryPVCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPVDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryPVDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
    end
    object qryPVID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPVFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryPVFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryPVFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryPVCPF_NOTA: TStringField
      FieldName = 'CPF_NOTA'
      Origin = 'CPF_NOTA'
    end
    object qryPVSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 18
      Size = 2
    end
    object qryPVTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryPVDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPVTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      Precision = 18
      Size = 2
    end
    object qryPVDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryPVTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryPVOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
    object qryPVSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryPVFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      Required = True
    end
    object qryPVPERCENTUAL: TFMTBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Precision = 18
      Size = 2
    end
    object qryPVTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryPVNECF: TIntegerField
      FieldName = 'NECF'
      Origin = 'NECF'
    end
    object qryPVFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryPVLOTE: TIntegerField
      FieldName = 'LOTE'
      Origin = 'LOTE'
    end
    object qryPVGERA_FINANCEIRO: TStringField
      FieldName = 'GERA_FINANCEIRO'
      Origin = 'GERA_FINANCEIRO'
      Size = 1
    end
    object qryPVPERCENTUAL_ACRESCIMO: TFMTBCDField
      FieldName = 'PERCENTUAL_ACRESCIMO'
      Origin = 'PERCENTUAL_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPVACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPVFK_TABELA: TIntegerField
      FieldName = 'FK_TABELA'
      Origin = 'FK_TABELA'
    end
    object qryPVPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 30
    end
    object qryPVFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
    end
    object qryPVSELECAO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SELECAO'
    end
    object qryPVNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
  end
  object qryPV_Itens: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select PV.*, pro.descricao as produto from VENDAS_DETALHE pv'
      'left join produto pro on pro.codigo=pv.id_produto'
      'WHERE'
      'pv.FKVENDA=:CODIGO'
      'ORDER BY ITEM')
    Left = 136
    Top = 255
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPV_ItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPV_ItensFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
      Required = True
    end
    object qryPV_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryPV_ItensITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryPV_ItensCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryPV_ItensQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Precision = 18
      Size = 3
    end
    object qryPV_ItensE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Origin = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensVDESCONTO: TFMTBCDField
      FieldName = 'VDESCONTO'
      Origin = 'VDESCONTO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryPV_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryPV_ItensQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object qryPV_ItensACRESCIMO: TFMTBCDField
      FieldName = 'ACRESCIMO'
      Origin = 'ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object qryPV_ItensOS: TStringField
      FieldName = 'OS'
      Origin = 'OS'
      Size = 1
    end
    object qryPV_ItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryDevVenda: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select PV.*, pes.RAZAO from DEVOLUCAO_MASTER PV'
      'left join pessoa pes on pes.codigo=pv.fk_cliente'
      'where'
      '(pv.data between :data1 and :data2) and'
      '(pes.razao like :nome) and'
      '(PV.SITUACAO='#39'F'#39')'
      'order by pv.data desc')
    Left = 216
    Top = 199
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
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object qryDevVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryDevVendaFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
      DisplayFormat = ',0.00'
    end
    object qryDevVendaFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Origin = 'FK_CLIENTE'
      DisplayFormat = ',0.00'
    end
    object qryDevVendaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryDevVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevVendaOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 50
    end
    object qryDevVendaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryDevVendaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryDevVendaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
      DisplayFormat = ',0.00'
    end
    object qryDevVendaTIPO_DEVOLUCAO: TStringField
      FieldName = 'TIPO_DEVOLUCAO'
      Origin = 'TIPO_DEVOLUCAO'
    end
    object qryDevVendaRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryItensDevVenda: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select PV.*,pro.descricao as produto  from DEVOLUCAO_DETALHE PV'
      'left join produto pro on pro.codigo=pv.fk_produto'
      'where'
      'FK_DEVOLUCAO=:COD'
      '')
    Left = 216
    Top = 255
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensDevVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryItensDevVendaFK_DEVOLUCAO: TIntegerField
      FieldName = 'FK_DEVOLUCAO'
      Origin = 'FK_DEVOLUCAO'
      DisplayFormat = ',0.00'
    end
    object qryItensDevVendaFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryItensDevVendaQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryItensDevVendaQTD_VENDIDA: TFMTBCDField
      FieldName = 'QTD_VENDIDA'
      Origin = 'QTD_VENDIDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryItensDevVendaPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensDevVendaFK_DEVOLUCAO_ITEM: TIntegerField
      FieldName = 'FK_DEVOLUCAO_ITEM'
      Origin = 'FK_DEVOLUCAO_ITEM'
      DisplayFormat = ',0.00'
    end
    object qryItensDevVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItensDevVendaPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryDevCompra: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    SQL.Strings = (
      'select PV.*, pes.razao from DEVOLUCA_COMPRA_M PV'
      'left join pessoa pes on pes.codigo=pv.fk_fornecedor'
      'where'
      '(PV.data BETWEEN :DATA1 and :DATA2) and'
      '(pes.razao like :nome) and'
      '(PV.SITUACAO='#39'F'#39')'
      'order by pv.data desc')
    Left = 320
    Top = 199
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
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object qryDevCompraCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0'
    end
    object qryDevCompraDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryDevCompraFK_FORNECEDOR: TIntegerField
      FieldName = 'FK_FORNECEDOR'
      Origin = 'FK_FORNECEDOR'
      DisplayFormat = ',0.00'
    end
    object qryDevCompraTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevCompraNUMERO_COMPRA: TIntegerField
      FieldName = 'NUMERO_COMPRA'
      Origin = 'NUMERO_COMPRA'
      DisplayFormat = ',0.00'
    end
    object qryDevCompraFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
      DisplayFormat = ',0.00'
    end
    object qryDevCompraSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryDevCompraFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
      DisplayFormat = ',0.00'
    end
    object qryDevCompraOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object qryDevCompraRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qryDevItensCompra: TFDQuery
    AggregatesActive = True
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select PV.*, pro.descricao as produto  from DEVOLUCAO_COMPRA_D P' +
        'V'
      'left join produto pro on pro.codigo=pv.id_produto'
      'where'
      'pv.FK_DEVOLUCAO_COMPRA_M=:COD')
    Left = 320
    Top = 255
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDevItensCompraCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryDevItensCompraFK_DEVOLUCAO_COMPRA_M: TIntegerField
      FieldName = 'FK_DEVOLUCAO_COMPRA_M'
      Origin = 'FK_DEVOLUCAO_COMPRA_M'
      DisplayFormat = ',0.00'
    end
    object qryDevItensCompraID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      DisplayFormat = ',0.00'
    end
    object qryDevItensCompraQTD_COMPRADA: TFMTBCDField
      FieldName = 'QTD_COMPRADA'
      Origin = 'QTD_COMPRADA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevItensCompraQTD_DEVOLVIDA: TFMTBCDField
      FieldName = 'QTD_DEVOLVIDA'
      Origin = 'QTD_DEVOLVIDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevItensCompraPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevItensCompraTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryDevItensCompraFK_COMPRA_ITEM: TIntegerField
      FieldName = 'FK_COMPRA_ITEM'
      Origin = 'FK_COMPRA_ITEM'
      DisplayFormat = ',0.00'
    end
    object qryDevItensCompraPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsOrcamento: TDataSource
    DataSet = qryOrcamento
    Left = 64
    Top = 312
  end
  object dsVenda: TDataSource
    DataSet = qryPV
    Left = 136
    Top = 312
  end
  object dsDevolucaoC: TDataSource
    DataSet = qryDevCompra
    Left = 328
    Top = 312
  end
  object dsDevolucaoV: TDataSource
    DataSet = qryDevVenda
    Left = 216
    Top = 312
  end
end
