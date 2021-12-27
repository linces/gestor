object frmGerarXml: TfrmGerarXml
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gerar PDF e XML'
  ClientHeight = 226
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 270
    Height = 131
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 14
      Width = 51
      Height = 13
      Caption = 'Per'#237'odo de'
    end
    object Label2: TLabel
      Left = 135
      Top = 14
      Width = 17
      Height = 13
      Caption = 'At'#233
    end
    object DateTimePicker1: TDateTimePicker
      Left = 32
      Top = 33
      Width = 97
      Height = 21
      Date = 42622.376256446760000000
      Time = 42622.376256446760000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = DateTimePicker1Exit
    end
    object DateTimePicker2: TDateTimePicker
      Left = 135
      Top = 33
      Width = 97
      Height = 21
      Date = 42622.376256446760000000
      Time = 42622.376256446760000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = DateTimePicker2Exit
    end
    object BitBtn1: TBitBtn
      Left = 32
      Top = 80
      Width = 89
      Height = 33
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 142
      Top = 80
      Width = 90
      Height = 33
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 196
    Width = 270
    Height = 30
    Align = alBottom
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 270
    Height = 65
    Align = alTop
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Selecionada'
      'Todas')
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object qryXML: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select'
      'NM.numero,'
      'NM.data_emissao,'
      'NM.chave,'
      'NM.TRIB_FED,'
      'NM.TRIB_EST,'
      'NM.TRIB_MUN,'
      'NM.situacao,'
      'NM.serie,'
      'NM.xml'
      'FROM VENDAS_MASTER NM'
      'WHERE'
      'NM.SITUACAO='#39'2'#39' AND'
      'NM.data_emissao between :DATA1 AND :DATA2'
      'ORDER BY NM.numero;')
    Left = 16
    Top = 176
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
        Value = Null
      end>
    object qryXMLNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryXMLDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryXMLCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryXMLTRIB_FED: TBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryXMLTRIB_EST: TBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryXMLTRIB_MUN: TBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryXMLSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryXMLSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryXMLXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.Salvar = False
    Configuracoes.Geral.ExibirErroSchema = False
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.Salvar = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 32
    Top = 64
  end
  object ACBrNFeDANFCeFortesA41: TACBrNFeDANFCeFortesA4
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiSemGeracao
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 10.000000000000000000
    MargemSuperior = 10.000000000000000000
    MargemEsquerda = 10.000000000000000000
    MargemDireita = 10.000000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 2
    CasasDecimais._vUnCom = 2
    CasasDecimais._Mask_qCom = ',0.00'
    CasasDecimais._Mask_vUnCom = ',0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 8
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    Left = 98
    Top = 62
  end
end
