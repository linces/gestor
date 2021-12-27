object Form1: TForm1
  Left = 301
  Top = 184
  Caption = 'Exemplo do Controle de Licen'#231'as'
  ClientHeight = 385
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 213
    Width = 81
    Height = 13
    Caption = 'Dados do Cliente'
  end
  object Button1: TButton
    Left = 8
    Top = 179
    Width = 169
    Height = 25
    Caption = 'Renovar licen'#231'a'
    TabOrder = 0
    OnClick = Button1Click
  end
  object dados: TMemo
    Left = 8
    Top = 232
    Width = 337
    Height = 113
    Lines.Strings = (
      'dados')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 351
    Width = 169
    Height = 25
    Caption = 'Atualizar Cadastro'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 183
    Top = 351
    Width = 169
    Height = 25
    Caption = 'Enviar Dados por Email'
    TabOrder = 3
    OnClick = Button3Click
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 64
    Top = 72
  end
  object LockApplication1: TLockApplication
    IDSistema = 888777
    Demostracao = True
    Informacoes_adicionais = True
    Mostrar_Tela_Primeira_Vez = True
    Dias_Demostracao = 5
    Local_Registro = '\Software\MicrosoftWincerRg2'
    Chave_Criptografia = 'MicrosoftWincerRg2'
    Titulo_das_janelas = 'ERP SoftArena'
    Email_de_contato = 'softarena@softarena.com.br'
    Site_da_Empresa = 'https:\\loja.softarena.com.br'
    Telefones_de_Contato = '(34) 99158-7421'
    Versao_Trial = 1
    SMTP_Servidor = 'smtp.gmail.com'
    SMTP_Usuario = 'rejanebs2013@gmail.com'
    SMTP_Porta = 465
    EMAIL_Enviar = True
    EMAIL_Remetente = 'softarena@softarena.com.br'
    EMAIL_Destino = 'softarena@softarena.com.br'
    EMAIL_Assunto = 'Recebimento de Licen'#231'a'
    EMAIL_Mensagen.Strings = (
      'sdfsfsdf')
    EMAIL_Dias_enviar = 5
    IntervaloPing = 9
    DatabaseBD = 'licencas'
    PortaBD = 3306
    REST_url_com_porta = 'http://3.211.227.45:9003/ping'
    RestServerAtivo = True
    QuantidaRegistrosBD = 3
    Language = Portugues
    Left = 231
    Top = 56
  end
end
