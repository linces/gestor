object frmImportaCompra: TfrmImportaCompra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Importar Compra em Lote'
  ClientHeight = 331
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 69
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 692
      Height = 67
      Align = alClient
      Caption = 'Caminho'
      TabOrder = 0
      object edtNumero: TEdit
        Left = 24
        Top = 20
        Width = 612
        Height = 28
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 272
    Width = 694
    Height = 59
    Align = alBottom
    TabOrder = 1
    object btnImportar: TSpeedButton
      Left = 1
      Top = 1
      Width = 230
      Height = 57
      Align = alLeft
      Caption = 'Importar Todos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFD
        FDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6F6F6E6E6E6DDDDDDD6D6D6D2D2D2CDCDCDCBCBCBC8C8C8C6C6C6C5C5C5
        C5C5C5C3C3C3C3C3C3C5C5C5C5C5C5C7C7C7C9C9C9CBCBCBCFCFCFD3D3D3D8D8
        D8E0E0E0ECECECFCFCFCF4F4F4E0E0E0D6D6D6CFCFCFCACACAC6C6C6C3C3C3C1
        C1C1BFBFBFBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBEC0C0C0C0C0BFA89467
        AC8C4AB7A682D1D1D0D9D9D9E7E7E7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDC8B894AA8434B58E3DBF9747DFCEACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFD8C9A7A88333B38C3CBE9645C99F4FDDBB7FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE6DCC6A98434B28B3BBC9445C89E4FDBB46BEEDB
        B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EBDEAB893DB08A39BB9342C69C4D
        D9B369EDD5A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5F0B2934DAF8838B9
        9241C49B4BD4AC61EBCE96FEFDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2EDEDEDF6F6F6FFFFFFFDFDFCBBA1
        64AD8737B89041C39A4AD0A659E9C98CFCF8F2FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4D1D1D1B9B9B9B4B4B4B4B4B4B4B4B4
        BFBFBFC5BBA6AC883BB68F3EC19849CDA253E6C683F9F2E4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3BABABAB8B8B8C9C9C9D2
        D2D2D4D4D4D2D2D2C2C2C2B8B8B8B8B2A7BE9D5BCBA051E2C07AF6EAD2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5BCBCBCC6C6
        C6DCDCDCDFDFDFE6E6E6EBEBEBEBEBEBE8E8E8DBDBDBBEBEBEBDBAB3DABB7EF2
        E0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6
        C1C1C1C9C9C9DEDEDEE6E6E6C6E1F188C9F07CC5F19AD2F3E5F1F9F5F5F5E4E4
        E4C0C0C0CCC7BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDBDBDBC2C2C2DEDEDEACCCE4C5DFF10E95EB219DEC3DAAEE2CA4EE
        3EABEFEFF5FAB3D6F4C5D0DBC2C2C2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBD2D2D2E0E0E069B3EDBCDBF147A7ED3A
        A1EDD2E6F5F8F8F8F7F8F993C4F3CCE4F9569EE6C5C5C6DDDDDDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6C9C9C9DCDCDCE6E6E668B4
        EEBBDCF1E8EFF36CB5EF45A2EEBDDCF5F7F8FADDEBF9E6F2FB50A5EDB9C1CDD8
        D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2CCCCCC
        D8DBDE9BC4EB5CAEEDBFDDF1F4F4F4F2F4F59CCAF24EA4EFB6D8F5E7F1FAADD8
        F873BDF1CBD1D6DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFAFAD1D1D1DEDEDFD9E4ED4FA9EFB2D4F1B7D5F2F5F5F5F7F7F78CC1F2
        66ADF0AAD2F6E2F1FC5EABECCFD0D2E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDED5D5D5EEEEEEEBF3F7D0E2F46CAFF0E1
        EBF5F7F7F7A1CCF49CCCF6F4F9FCC7E5FADAE6EFD8D8D8EBEBEBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD8D8D8E8E8E8F4F4
        F4F8F8F8CBE4F8ACD5F7BADCF8ADD7F8EAF3FBFCFCFCFAFAFADFDFDFE0E0E0FA
        FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        E2E2E2D8D8D8EEEEEEF4F4F4F8F8F8E8F1F9DDEDF9F3F7FBFBFBFBF9F9F9E7E7
        E7DFDFDFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF9F9F9E2E2E2DADADAE7E7E7F2F2F2F5F5F5F7F7F7F7F7F7
        F1F1F1E0E0E0E0E0E0E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBE7E7E7E1E1E1DCDCDCDA
        DADADCDCDCDADADADFDFDFE3E3E3ECECECFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F6F6ECECECE8E8E8E7E7E7E9E9E9EEEEEEFBFBFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = btnImportarClick
    end
    object btnIndividual: TSpeedButton
      Left = 231
      Top = 1
      Width = 230
      Height = 57
      Align = alLeft
      Caption = 'Importar Individual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFD
        FDFDFDFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6F6F6E6E6E6DDDDDDD6D6D6D2D2D2CDCDCDCBCBCBC8C8C8C6C6C6C5C5C5
        C5C5C5C3C3C3C3C3C3C5C5C5C5C5C5C7C7C7C9C9C9CBCBCBCFCFCFD3D3D3D8D8
        D8E0E0E0ECECECFCFCFCF4F4F4E0E0E0D6D6D6CFCFCFCACACAC6C6C6C3C3C3C1
        C1C1BFBFBFBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBEBEBEC0C0C0C0C0BFA89467
        AC8C4AB7A682D1D1D0D9D9D9E7E7E7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDC8B894AA8434B58E3DBF9747DFCEACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFD8C9A7A88333B38C3CBE9645C99F4FDDBB7FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE6DCC6A98434B28B3BBC9445C89E4FDBB46BEEDB
        B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EBDEAB893DB08A39BB9342C69C4D
        D9B369EDD5A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5F0B2934DAF8838B9
        9241C49B4BD4AC61EBCE96FEFDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2F2F2EDEDEDF6F6F6FFFFFFFDFDFCBBA1
        64AD8737B89041C39A4AD0A659E9C98CFCF8F2FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4D1D1D1B9B9B9B4B4B4B4B4B4B4B4B4
        BFBFBFC5BBA6AC883BB68F3EC19849CDA253E6C683F9F2E4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3BABABAB8B8B8C9C9C9D2
        D2D2D4D4D4D2D2D2C2C2C2B8B8B8B8B2A7BE9D5BCBA051E2C07AF6EAD2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5BCBCBCC6C6
        C6DCDCDCDFDFDFE6E6E6EBEBEBEBEBEBE8E8E8DBDBDBBEBEBEBDBAB3DABB7EF2
        E0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6
        C1C1C1C9C9C9DEDEDEE6E6E6C6E1F188C9F07CC5F19AD2F3E5F1F9F5F5F5E4E4
        E4C0C0C0CCC7BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDBDBDBC2C2C2DEDEDEACCCE4C5DFF10E95EB219DEC3DAAEE2CA4EE
        3EABEFEFF5FAB3D6F4C5D0DBC2C2C2EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBD2D2D2E0E0E069B3EDBCDBF147A7ED3A
        A1EDD2E6F5F8F8F8F7F8F993C4F3CCE4F9569EE6C5C5C6DDDDDDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6C9C9C9DCDCDCE6E6E668B4
        EEBBDCF1E8EFF36CB5EF45A2EEBDDCF5F7F8FADDEBF9E6F2FB50A5EDB9C1CDD8
        D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2CCCCCC
        D8DBDE9BC4EB5CAEEDBFDDF1F4F4F4F2F4F59CCAF24EA4EFB6D8F5E7F1FAADD8
        F873BDF1CBD1D6DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFAFAD1D1D1DEDEDFD9E4ED4FA9EFB2D4F1B7D5F2F5F5F5F7F7F78CC1F2
        66ADF0AAD2F6E2F1FC5EABECCFD0D2E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDED5D5D5EEEEEEEBF3F7D0E2F46CAFF0E1
        EBF5F7F7F7A1CCF49CCCF6F4F9FCC7E5FADAE6EFD8D8D8EBEBEBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD8D8D8E8E8E8F4F4
        F4F8F8F8CBE4F8ACD5F7BADCF8ADD7F8EAF3FBFCFCFCFAFAFADFDFDFE0E0E0FA
        FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        E2E2E2D8D8D8EEEEEEF4F4F4F8F8F8E8F1F9DDEDF9F3F7FBFBFBFBF9F9F9E7E7
        E7DFDFDFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF9F9F9E2E2E2DADADAE7E7E7F2F2F2F5F5F5F7F7F7F7F7F7
        F1F1F1E0E0E0E0E0E0E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBE7E7E7E1E1E1DCDCDCDA
        DADADCDCDCDADADADFDFDFE3E3E3ECECECFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F6F6ECECECE8E8E8E7E7E7E9E9E9EEEEEEFBFBFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = btnIndividualClick
    end
    object Button1: TButton
      Left = 461
      Top = 1
      Width = 230
      Height = 57
      Align = alLeft
      Caption = 'Processar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 69
    Width = 694
    Height = 203
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Notas'
      object memLista: TListBox
        Left = 0
        Top = 0
        Width = 686
        Height = 175
        Align = alClient
        ItemHeight = 13
        ParentColor = True
        TabOrder = 0
        OnKeyDown = memListaKeyDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Erros'
      ImageIndex = 1
      object ListBoxErro: TListBox
        Left = 0
        Top = 0
        Width = 686
        Height = 175
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 8
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 184
    Top = 9
  end
  object qryProdutos: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from Produto'
      'where'
      '(descricao=:descricao) and'
      '(codbarra=:cod)')
    Left = 52
    Top = 112
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
        Value = Null
      end
      item
        Name = 'COD'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object qryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 30
    end
    object qryProdutosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
    object qryProdutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdutosULTFORN: TIntegerField
      FieldName = 'ULTFORN'
      Origin = 'ULTFORN'
      DisplayFormat = ',0.00'
    end
    object qryProdutosLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      Size = 40
    end
    object qryProdutosALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPR_CUSTO: TFMTBCDField
      FieldName = 'PR_CUSTO'
      Origin = 'PR_CUSTO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosMARGEM: TCurrencyField
      FieldName = 'MARGEM'
      Origin = 'MARGEM'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryProdutosQTD_MIN: TFMTBCDField
      FieldName = 'QTD_MIN'
      Origin = 'QTD_MIN'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 6
    end
    object qryProdutosE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Origin = 'CSTICMS'
      Size = 5
    end
    object qryProdutosCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryProdutosCSTS: TStringField
      FieldName = 'CSTS'
      Origin = 'CSTS'
      Size = 5
    end
    object qryProdutosCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Origin = 'CSTIPI'
      Size = 5
    end
    object qryProdutosCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 5
    end
    object qryProdutosNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryProdutosCOMISSAO: TCurrencyField
      FieldName = 'COMISSAO'
      Origin = 'COMISSAO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryProdutosATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField
      FieldName = 'PR_CUSTO_ANTERIOR'
      Origin = 'PR_CUSTO_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Origin = 'PR_VENDA_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosULT_COMPRA: TIntegerField
      FieldName = 'ULT_COMPRA'
      Origin = 'ULT_COMPRA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosULT_COMPRA_ANTERIOR: TIntegerField
      FieldName = 'ULT_COMPRA_ANTERIOR'
      Origin = 'ULT_COMPRA_ANTERIOR'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Origin = 'PRECO_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Origin = 'QTD_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosCOD_BARRA_ATACADO: TStringField
      FieldName = 'COD_BARRA_ATACADO'
      Origin = 'COD_BARRA_ATACADO'
    end
    object qryProdutosALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryProdutosCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object qryProdutosGRADE: TStringField
      FieldName = 'GRADE'
      Origin = 'GRADE'
      Size = 1
    end
    object qryProdutosEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Origin = 'EFISCAL'
      Size = 1
    end
    object qryProdutosPAGA_COMISSAO: TStringField
      FieldName = 'PAGA_COMISSAO'
      Origin = 'PAGA_COMISSAO'
      Size = 1
    end
    object qryProdutosPESO: TFMTBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Origin = 'COMPOSICAO'
      Size = 1
    end
    object qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Origin = 'PRECO_PROMO_ATACADO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Origin = 'PRECO_PROMO_VAREJO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
      Origin = 'INICIO_PROMOCAO'
    end
    object qryProdutosFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
      Origin = 'FIM_PROMOCAO'
    end
    object qryProdutosESTOQUE_INICIAL: TFMTBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Origin = 'ESTOQUE_INICIAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object qryProdutosPR_VENDA_PRAZO: TFMTBCDField
      FieldName = 'PR_VENDA_PRAZO'
      Origin = 'PR_VENDA_PRAZO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Origin = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryProdutosAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
      Size = 50
    end
    object qryProdutosREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Origin = 'REDUCAO_BASE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosMVA: TFMTBCDField
      FieldName = 'MVA'
      Origin = 'MVA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosFCP: TFMTBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Origin = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryProdutosSERVICO: TStringField
      FieldName = 'SERVICO'
      Origin = 'SERVICO'
      Size = 1
    end
    object qryProdutosDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutosPR_CUSTO2: TFMTBCDField
      FieldName = 'PR_CUSTO2'
      Origin = 'PR_CUSTO2'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosPERC_CUSTO: TFMTBCDField
      FieldName = 'PERC_CUSTO'
      Origin = 'PERC_CUSTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryProdutosRESTAUTANTE: TStringField
      FieldName = 'RESTAUTANTE'
      Origin = 'RESTAUTANTE'
      Size = 1
    end
    object qryProdutosTEMPO_ESPERA: TIntegerField
      FieldName = 'TEMPO_ESPERA'
      Origin = 'TEMPO_ESPERA'
      DisplayFormat = ',0.00'
    end
    object qryProdutosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object qryProdutosFK_MARCA: TIntegerField
      FieldName = 'FK_MARCA'
      Origin = 'FK_MARCA'
      DisplayFormat = ',0.00'
    end
    object qryProdutosPREFIXO_BALANCA: TStringField
      FieldName = 'PREFIXO_BALANCA'
      Origin = 'PREFIXO_BALANCA'
      Size = 8
    end
    object qryProdutosFK_PRINCIPIO_ATIVO: TIntegerField
      FieldName = 'FK_PRINCIPIO_ATIVO'
      Origin = 'FK_PRINCIPIO_ATIVO'
      DisplayFormat = ',0.00'
    end
    object qryProdutosREMEDIO: TStringField
      FieldName = 'REMEDIO'
      Origin = 'REMEDIO'
      Size = 1
    end
    object qryProdutosTIPO_RESTAURANTE: TStringField
      FieldName = 'TIPO_RESTAURANTE'
      Origin = 'TIPO_RESTAURANTE'
      Size = 1
    end
    object qryProdutosFK_TECIDO: TDateField
      FieldName = 'FK_TECIDO'
      Origin = 'FK_TECIDO'
    end
    object qryProdutosCFOP_EXTERNO: TIntegerField
      FieldName = 'CFOP_EXTERNO'
      Origin = 'CFOP_EXTERNO'
    end
    object qryProdutosGLP: TFMTBCDField
      FieldName = 'GLP'
      Origin = 'GLP'
      Precision = 18
      Size = 4
    end
    object qryProdutosGNN: TFMTBCDField
      FieldName = 'GNN'
      Origin = 'GNN'
      Precision = 18
      Size = 4
    end
    object qryProdutosGNI: TFMTBCDField
      FieldName = 'GNI'
      Origin = 'GNI'
      Precision = 18
      Size = 4
    end
    object qryProdutosPESO_LIQ: TFMTBCDField
      FieldName = 'PESO_LIQ'
      Origin = 'PESO_LIQ'
      Precision = 18
      Size = 4
    end
    object qryProdutosCSOSN_EXTERNO: TStringField
      FieldName = 'CSOSN_EXTERNO'
      Origin = 'CSOSN_EXTERNO'
      Size = 3
    end
    object qryProdutosCST_EXTERNO: TStringField
      FieldName = 'CST_EXTERNO'
      Origin = 'CST_EXTERNO'
      Size = 3
    end
    object qryProdutosALIQ_ICMS_EXTERNO: TFMTBCDField
      FieldName = 'ALIQ_ICMS_EXTERNO'
      Origin = 'ALIQ_ICMS_EXTERNO'
      Precision = 18
      Size = 2
    end
    object qryProdutosORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
    end
    object qryProdutosQTD_FISCAL: TFMTBCDField
      FieldName = 'QTD_FISCAL'
      Origin = 'QTD_FISCAL'
      Precision = 18
      Size = 4
    end
    object qryProdutosMVA_NORMAL: TFMTBCDField
      FieldName = 'MVA_NORMAL'
      Origin = 'MVA_NORMAL'
      Precision = 18
      Size = 4
    end
    object qryProdutosANP: TStringField
      FieldName = 'ANP'
      Origin = 'ANP'
    end
    object qryProdutosCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      Size = 1
    end
    object qryProdutosIMPRIME_TICKET: TStringField
      FieldName = 'IMPRIME_TICKET'
      Origin = 'IMPRIME_TICKET'
      Size = 1
    end
    object qryProdutosICMS_DIFERIDO: TFMTBCDField
      FieldName = 'ICMS_DIFERIDO'
      Origin = 'ICMS_DIFERIDO'
      Precision = 18
      Size = 4
    end
  end
  object qryFornecedor: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from pessoa'
      'where'
      'cnpj=:cnpj')
    Left = 136
    Top = 112
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object qryFornecedorEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFornecedorTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object qryFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryFornecedorIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object qryFornecedorFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryFornecedorRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 50
    end
    object qryFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryFornecedorNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryFornecedorCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
      Required = True
    end
    object qryFornecedorMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryFornecedorUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryFornecedorCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryFornecedorFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryFornecedorFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryFornecedorCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryFornecedorCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Origin = 'CELULAR2'
      Size = 14
    end
    object qryFornecedorEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      Size = 60
    end
    object qryFornecedorEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Origin = 'EMAIL2'
      Size = 60
    end
    object qryFornecedorFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryFornecedorSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 10
    end
    object qryFornecedorDT_NASC: TDateField
      FieldName = 'DT_NASC'
      Origin = 'DT_NASC'
    end
    object qryFornecedorECIVIL: TStringField
      FieldName = 'ECIVIL'
      Origin = 'ECIVIL'
      Size = 10
    end
    object qryFornecedorDIA_PGTO: TSmallintField
      FieldName = 'DIA_PGTO'
      Origin = 'DIA_PGTO'
    end
    object qryFornecedorOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object qryFornecedorNUM_USU: TSmallintField
      FieldName = 'NUM_USU'
      Origin = 'NUM_USU'
    end
    object qryFornecedorFATURA: TStringField
      FieldName = 'FATURA'
      Origin = 'FATURA'
      Size = 1
    end
    object qryFornecedorCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CHEQUE'
      Size = 1
    end
    object qryFornecedorCCF: TStringField
      FieldName = 'CCF'
      Origin = 'CCF'
      Size = 1
    end
    object qryFornecedorSPC: TStringField
      FieldName = 'SPC'
      Origin = 'SPC'
      Size = 1
    end
    object qryFornecedorISENTO: TStringField
      FieldName = 'ISENTO'
      Origin = 'ISENTO'
      Size = 1
    end
    object qryFornecedorFORN: TStringField
      FieldName = 'FORN'
      Origin = 'FORN'
      Required = True
      Size = 1
    end
    object qryFornecedorFUN: TStringField
      FieldName = 'FUN'
      Origin = 'FUN'
      Required = True
      Size = 1
    end
    object qryFornecedorCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
    object qryFornecedorFAB: TStringField
      FieldName = 'FAB'
      Origin = 'FAB'
      Required = True
      Size = 1
    end
    object qryFornecedorTRAN: TStringField
      FieldName = 'TRAN'
      Origin = 'TRAN'
      Required = True
      Size = 1
    end
    object qryFornecedorADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Required = True
      Size = 1
    end
    object qryFornecedorATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryFornecedorDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      Origin = 'DT_ADMISSAO'
    end
    object qryFornecedorDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      Origin = 'DT_DEMISSAO'
    end
    object qryFornecedorLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Origin = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object qryFornecedorSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
    object qryFornecedorPAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 50
    end
    object qryFornecedorMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 50
    end
    object qryFornecedorBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Size = 30
    end
    object qryFornecedorAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryFornecedorGERENTE: TStringField
      FieldName = 'GERENTE'
      Origin = 'GERENTE'
      Size = 30
    end
    object qryFornecedorFONE_GERENTE: TStringField
      FieldName = 'FONE_GERENTE'
      Origin = 'FONE_GERENTE'
      Size = 15
    end
    object qryFornecedorPROPRIEDADE: TStringField
      FieldName = 'PROPRIEDADE'
      Origin = 'PROPRIEDADE'
      Size = 50
    end
    object qryFornecedorDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryFornecedorTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
      Size = 1
    end
    object qryFornecedorATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Origin = 'ATENDENTE'
      Size = 1
    end
  end
  object qryCompra: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from compra'
      'where'
      'chave=:id')
    Left = 58
    Top = 173
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 44
        Value = Null
      end>
    object qryCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCompraEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryCompraDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
      Origin = 'DTENTRADA'
      Required = True
    end
    object qryCompraDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
      Required = True
    end
    object qryCompraFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
    end
    object qryCompraMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 5
    end
    object qryCompraSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 5
    end
    object qryCompraCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 44
    end
    object qryCompraNR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      Origin = 'NR_NOTA'
      Size = 15
    end
    object qryCompraGERA_CP: TStringField
      FieldName = 'GERA_CP'
      Origin = 'GERA_CP'
      Required = True
      Size = 1
    end
    object qryCompraGERA_ES: TStringField
      FieldName = 'GERA_ES'
      Origin = 'GERA_ES'
      Required = True
      Size = 1
    end
    object qryCompraAJUSTA_PC: TStringField
      FieldName = 'AJUSTA_PC'
      Origin = 'AJUSTA_PC'
      Required = True
      Size = 1
    end
    object qryCompraAJUSTA_PV: TStringField
      FieldName = 'AJUSTA_PV'
      Origin = 'AJUSTA_PV'
      Required = True
      Size = 1
    end
    object qryCompraEHFISCAL: TStringField
      FieldName = 'EHFISCAL'
      Origin = 'EHFISCAL'
      Required = True
      Size = 1
    end
    object qryCompraLEUXML: TStringField
      FieldName = 'LEUXML'
      Origin = 'LEUXML'
      Required = True
      Size = 1
    end
    object qryCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      Size = 1
    end
    object qryCompraXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryCompraTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryCompraSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ICM: TFMTBCDField
      FieldName = 'BASE_ICM'
      Origin = 'BASE_ICM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ICM: TFMTBCDField
      FieldName = 'TOTAL_ICM'
      Origin = 'TOTAL_ICM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_PIS: TFMTBCDField
      FieldName = 'TOTAL_PIS'
      Origin = 'TOTAL_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraBASE_COF: TFMTBCDField
      FieldName = 'BASE_COF'
      Origin = 'BASE_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL_COF: TFMTBCDField
      FieldName = 'TOTAL_COF'
      Origin = 'TOTAL_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryCompraTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
      Precision = 18
      Size = 6
    end
  end
  object qryItensCompra: TFDQuery
    MasterFields = 'ID'
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from compra_itens ic'
      'where'
      'ic.fk_compra=:id'
      'order by ic.item')
    Left = 138
    Top = 173
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensCompraFK_COMPRA: TIntegerField
      FieldName = 'FK_COMPRA'
      Origin = 'FK_COMPRA'
      Required = True
    end
    object qryItensCompraEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryItensCompraITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      Required = True
    end
    object qryItensCompraFK_PRODUTO: TIntegerField
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      Required = True
    end
    object qryItensCompraCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryItensCompraCST_ICM: TStringField
      FieldName = 'CST_ICM'
      Origin = 'CST_ICM'
      Size = 5
    end
    object qryItensCompraGERA_CP: TStringField
      FieldName = 'GERA_CP'
      Origin = 'GERA_CP'
      Size = 1
    end
    object qryItensCompraGERA_ES: TStringField
      FieldName = 'GERA_ES'
      Origin = 'GERA_ES'
      Size = 1
    end
    object qryItensCompraSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItensCompraFK_PRODUTO_FORN: TStringField
      FieldName = 'FK_PRODUTO_FORN'
      Origin = 'FK_PRODUTO_FORN'
      Size = 30
    end
    object qryItensCompraCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 3
    end
    object qryItensCompraCST_COF: TStringField
      FieldName = 'CST_COF'
      Origin = 'CST_COF'
      Size = 3
    end
    object qryItensCompraCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 3
    end
    object qryItensCompraFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryItensCompraVL_UNITARIO: TFMTBCDField
      FieldName = 'VL_UNITARIO'
      Origin = 'VL_UNITARIO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryItensCompraVL_ITEM: TFMTBCDField
      FieldName = 'VL_ITEM'
      Origin = 'VL_ITEM'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_IPI: TFMTBCDField
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_ICMS: TFMTBCDField
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraVL_ST: TFMTBCDField
      FieldName = 'VL_ST'
      Origin = 'VL_ST'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_PIS: TFMTBCDField
      FieldName = 'BASE_PIS'
      Origin = 'BASE_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_PIS: TFMTBCDField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_PIS: TFMTBCDField
      FieldName = 'VL_PIS'
      Origin = 'VL_PIS'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraBASE_COF: TFMTBCDField
      FieldName = 'BASE_COF'
      Origin = 'BASE_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_COF: TFMTBCDField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensCompraVL_COF: TFMTBCDField
      FieldName = 'VL_COF'
      Origin = 'VL_COF'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraFRETE1: TFMTBCDField
      FieldName = 'FRETE1'
      Origin = 'FRETE1'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraDESPESA: TFMTBCDField
      FieldName = 'DESPESA'
      Origin = 'DESPESA'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryItensCompraALIQ_ST: TFMTBCDField
      FieldName = 'ALIQ_ST'
      Origin = 'ALIQ_ST'
      Precision = 18
      Size = 2
    end
    object qryItensCompraBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      Size = 1
    end
  end
end
