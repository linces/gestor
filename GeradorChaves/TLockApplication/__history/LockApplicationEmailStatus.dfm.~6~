object StatusEmail: TStatusEmail
  Left = 292
  Top = 214
  BorderStyle = bsNone
  Caption = 'StatusEmail'
  ClientHeight = 50
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 322
    Height = 50
    Align = alClient
    Caption = 'Enviando e-mail com informa'#231#245'es de licen'#231'a, Aguarde...'
    TabOrder = 0
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL2
    PipeLine = True
    UseVerp = True
    SASLMechanisms = <>
    UseTLS = utUseRequireTLS
    Left = 32
    Top = 8
  end
  object IdSMTPServer1: TIdSMTPServer
    Bindings = <>
    DefaultPort = 587
    IOHandler = IdServerIOHandlerSSLOpenSSL1
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    HelpReply.Code = ''
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '500'
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.EnhancedCode.StatusClass = 5
    ReplyUnknownCommand.EnhancedCode.Subject = 5
    ReplyUnknownCommand.EnhancedCode.Details = 2
    ReplyUnknownCommand.EnhancedCode.Available = True
    ReplyUnknownCommand.EnhancedCode.ReplyAsStr = '5.5.2'
    ServerName = 'Indy SMTP Server'
    UseTLS = utUseExplicitTLS
    Left = 182
    Top = 65534
  end
  object IdSSLIOHandlerSocketOpenSSL2: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 587
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 152
    Top = 65534
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 214
    Top = 65534
  end
end
