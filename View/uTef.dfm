object FrmTEF: TFrmTEF
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'TEF'
  ClientHeight = 372
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pMensagem: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 125
    Align = alTop
    Anchors = []
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object pMensagemOperador: TPanel
      Left = 4
      Top = 4
      Width = 626
      Height = 58
      Align = alTop
      Caption = 'pMensagemOperador'
      TabOrder = 0
      Visible = False
      object Label15: TLabel
        Left = 1
        Top = 1
        Width = 624
        Height = 13
        Align = alTop
        Caption = 'Mensagem Operador'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 117
      end
    end
    object pMensagemCliente: TPanel
      Left = 4
      Top = 62
      Width = 626
      Height = 55
      Align = alClient
      Caption = 'pMensagemCliente'
      TabOrder = 1
      Visible = False
      object Label17: TLabel
        Left = 1
        Top = 1
        Width = 624
        Height = 13
        Align = alTop
        Caption = 'Mensagem Cliente'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 104
      end
    end
  end
  object pLogs: TPanel
    Left = 0
    Top = 125
    Width = 638
    Height = 247
    Align = alClient
    TabOrder = 1
    object sbLimparLog: TSpeedButton
      Left = 666
      Top = 1
      Width = 23
      Height = 117
    end
    object mLog: TMemo
      Left = 1
      Top = 1
      Width = 636
      Height = 137
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
    end
    object mImpressao: TMemo
      Left = 1
      Top = 138
      Width = 636
      Height = 108
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Lucida Console'
      Font.Pitch = fpFixed
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
  end
  object ACBrTEFD1: TACBrTEFD
    EsperaSTS = 7
    TEFPayGo.ArqTemp = 'C:\PAYGO\REQ\intpos.tmp'
    TEFPayGo.ArqReq = 'C:\PAYGO\REQ\intpos.001'
    TEFPayGo.ArqSTS = 'C:\PAYGO\RESP\intpos.sts'
    TEFPayGo.ArqResp = 'C:\PAYGO\RESP\intpos.001'
    TEFPayGoWeb.SuportaViasDiferenciadas = True
    TEFPayGoWeb.UtilizaSaldoTotalVoucher = False
    TEFPayGoWeb.ConfirmarTransacoesPendentes = True
    TEFDial.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDial.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDial.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDial.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDial.GPExeName = 'C:\TEF_DIAL\tef_dial.exe'
    TEFDisc.ArqTemp = 'C:\TEF_Disc\req\intpos.tmp'
    TEFDisc.ArqReq = 'C:\TEF_Disc\req\intpos.001'
    TEFDisc.ArqSTS = 'C:\TEF_Disc\resp\intpos.sts'
    TEFDisc.ArqResp = 'C:\TEF_Disc\resp\intpos.001'
    TEFDisc.GPExeName = 'C:\TEF_Disc\tef_Disc.exe'
    TEFHiper.ArqTemp = 'c:\HiperTEF\req\IntPos.tmp'
    TEFHiper.ArqReq = 'C:\HiperTEF\req\IntPos.001'
    TEFHiper.ArqSTS = 'C:\HiperTEF\resp\IntPos.sts'
    TEFHiper.ArqResp = 'C:\HiperTEF\resp\IntPos.001'
    TEFHiper.GPExeName = 'C:\HiperTEF\HiperTEF.exe'
    TEFVeSPague.EnderecoIP = 'localhost'
    TEFVeSPague.Porta = '60906'
    TEFVeSPague.TemPendencias = False
    TEFVeSPague.TransacaoCRT = 'Cartao Vender'
    TEFVeSPague.TransacaoCHQ = 'Cheque Consultar'
    TEFVeSPague.TransacaoCNC = 'Administracao Cancelar'
    TEFVeSPague.TransacaoReImpressao = 'Administracao Reimprimir'
    TEFVeSPague.TransacaoPendente = 'Administracao Pendente'
    TEFGPU.ArqTemp = 'C:\TEF_GPU\req\intpos.tmp'
    TEFGPU.ArqReq = 'C:\TEF_GPU\req\intpos.001'
    TEFGPU.ArqSTS = 'C:\TEF_GPU\resp\intpos.sts'
    TEFGPU.ArqResp = 'C:\TEF_GPU\resp\intpos.001'
    TEFGPU.GPExeName = 'C:\TEF_GPU\GPU.exe'
    TEFBanese.ArqTemp = 'C:\bcard\req\pergunta.tmp'
    TEFBanese.ArqReq = 'C:\bcard\req\pergunta.txt'
    TEFBanese.ArqSTS = 'C:\bcard\resp\status.txt'
    TEFBanese.ArqResp = 'C:\bcard\resp\resposta.txt'
    TEFBanese.ArqRespBkp = 'C:\bcard\resposta.txt'
    TEFBanese.ArqRespMovBkp = 'C:\bcard\copiamovimento.txt'
    TEFAuttar.ArqTemp = 'C:\Auttar_TefIP\req\intpos.tmp'
    TEFAuttar.ArqReq = 'C:\Auttar_TefIP\req\intpos.001'
    TEFAuttar.ArqSTS = 'C:\Auttar_TefIP\resp\intpos.sts'
    TEFAuttar.ArqResp = 'C:\Auttar_TefIP\resp\intpos.001'
    TEFAuttar.GPExeName = 'C:\Program Files (x86)\Auttar\IntegradorTEF-IP.exe'
    TEFGood.ArqTemp = 'C:\good\gettemp.dat'
    TEFGood.ArqReq = 'C:\good\getreq.dat'
    TEFGood.ArqSTS = 'C:\good\getstat.dat'
    TEFGood.ArqResp = 'C:\good\getresp.dat'
    TEFGood.GPExeName = 'C:\good\GETGoodMed.exe'
    TEFFoxWin.ArqTemp = 'C:\FwTEF\req\intpos.tmp'
    TEFFoxWin.ArqReq = 'C:\FwTEF\req\intpos.001'
    TEFFoxWin.ArqSTS = 'C:\FwTEF\rsp\intpos.sts'
    TEFFoxWin.ArqResp = 'C:\FwTEF\rsp\intpos.001'
    TEFFoxWin.GPExeName = 'C:\FwTEF\bin\FwTEF.exe'
    TEFCliDTEF.ArqResp = ''
    TEFPetrocard.ArqTemp = 'C:\CardTech\req\intpos.tmp'
    TEFPetrocard.ArqReq = 'C:\CardTech\req\intpos.001'
    TEFPetrocard.ArqSTS = 'C:\CardTech\resp\intpos.sts'
    TEFPetrocard.ArqResp = 'C:\CardTech\resp\intpos.001'
    TEFPetrocard.GPExeName = 'C:\CardTech\sac.exe'
    TEFCrediShop.ArqTemp = 'C:\tef_cshp\req\intpos.tmp'
    TEFCrediShop.ArqReq = 'C:\tef_cshp\req\intpos.001'
    TEFCrediShop.ArqSTS = 'C:\tef_cshp\resp\intpos.sts'
    TEFCrediShop.ArqResp = 'C:\tef_cshp\resp\intpos.001'
    TEFCrediShop.GPExeName = 'C:\tef_cshp\vpos_tef.exe'
    TEFTicketCar.ArqTemp = 'C:\TCS\TX\INTTCS.tmp'
    TEFTicketCar.ArqReq = 'C:\TCS\TX\INTTCS.001'
    TEFTicketCar.ArqSTS = 'C:\TCS\RX\INTTCS.RET'
    TEFTicketCar.ArqResp = 'C:\TCS\RX\INTTCS.001'
    TEFTicketCar.GPExeName = 'C:\TCS\tcs.exe'
    TEFTicketCar.NumLoja = 0
    TEFTicketCar.NumCaixa = 0
    TEFTicketCar.AtualizaPrecos = False
    TEFConvCard.ArqTemp = 'C:\ger_convenio\tx\crtsol.tmp'
    TEFConvCard.ArqReq = 'C:\ger_convenio\tx\crtsol.001'
    TEFConvCard.ArqSTS = 'C:\ger_convenio\rx\crtsol.ok'
    TEFConvCard.ArqResp = 'C:\ger_convenio\rx\crtsol.001'
    TEFConvCard.GPExeName = 'C:\ger_convcard\convcard.exe'
    OnAguardaResp = ACBrTEFD1AguardaResp
    OnExibeMsg = ACBrTEFD1ExibeMsg
    OnBloqueiaMouseTeclado = ACBrTEFD1BloqueiaMouseTeclado
    OnComandaECF = ACBrTEFD1ComandaECF
    OnComandaECFSubtotaliza = ACBrTEFD1ComandaECFSubtotaliza
    OnComandaECFPagamento = ACBrTEFD1ComandaECFPagamento
    OnComandaECFAbreVinculado = ACBrTEFD1ComandaECFAbreVinculado
    OnComandaECFImprimeVia = ACBrTEFD1ComandaECFImprimeVia
    OnInfoECF = ACBrTEFD1InfoECF
    OnAntesFinalizarRequisicao = ACBrTEFD1AntesFinalizarRequisicao
    OnDepoisConfirmarTransacoes = ACBrTEFD1DepoisConfirmarTransacoes
    OnGravarLog = ACBrTEFD1GravarLog
    Left = 312
    Top = 184
  end
  object FVenda: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 176
    object FVendaFCOLUNAS: TStringField
      FieldName = 'FCOLUNAS'
    end
    object FVendaFDHINICIO: TDateTimeField
      FieldName = 'FDHINICIO'
    end
    object FVendaFNUMERACAO: TIntegerField
      FieldName = 'FNUMERACAO'
    end
    object FVendaFVALORINICIAL: TFloatField
      FieldName = 'FVALORINICIAL'
    end
    object FVendaFVALORVENDA: TFloatField
      FieldName = 'FVALORVENDA'
    end
    object FVendaFVALORTROCO: TFloatField
      FieldName = 'FVALORTROCO'
    end
    object FVendaFVALORACRESCIMO: TFloatField
      FieldName = 'FVALORACRESCIMO'
    end
    object FVendaFVALORDESCONTO: TFloatField
      FieldName = 'FVALORDESCONTO'
    end
    object FVendaFVALORPAGO: TFloatField
      FieldName = 'FVALORPAGO'
    end
  end
  object FItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 176
    object FItensFVENDA: TIntegerField
      FieldName = 'FVENDA'
    end
    object FItensREDE: TStringField
      FieldName = 'REDE'
      Size = 50
    end
    object FItensVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object FItensTIPOPAGAMENTO: TStringField
      FieldName = 'TIPOPAGAMENTO'
      Size = 50
    end
    object FItensDESCRICAOPAGAMENTO: TStringField
      FieldName = 'DESCRICAOPAGAMENTO'
      Size = 50
    end
    object FItensCOLUNAS: TStringField
      FieldName = 'COLUNAS'
      Size = 50
    end
  end
end
