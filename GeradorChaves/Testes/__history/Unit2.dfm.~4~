object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 525
  ClientWidth = 699
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
  object lbEmailBody: TLabel
    Left = 8
    Top = 251
    Width = 55
    Height = 13
    Caption = 'Email body:'
  end
  object lbedtEmailTo: TLabeledEdit
    Left = 8
    Top = 184
    Width = 401
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'Email to:'
    TabOrder = 0
    Text = 'WHO-ARE-TARGET-EMAIL@gmail.com'
  end
  object lbedtEmailSubject: TLabeledEdit
    Left = 8
    Top = 224
    Width = 401
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Subject:'
    TabOrder = 1
    Text = 'Testing send email from Delphi using Indy'
  end
  object mmEmailBody: TMemo
    Left = 8
    Top = 270
    Width = 401
    Height = 251
    Lines.Strings = (
      
        'To send emails using your non-standard Google or Other app, you ' +
        'must enable '
      'Gmail'#39's 2-step verification.'
      
        'This way, you will have more security when an application will u' +
        'se your account '
      'to send emails.'
      '1) Go to https://myaccount.google.com/'
      '2) On the left side, access the "Security" option'
      
        '3) Now activate "2-step verification" for your Gmail email accou' +
        'nt'
      
        '4) Gmail will ask for confirmation that you really are making th' +
        'is change ... '
      'complete the task.'
      
        '5) Now that your account has "2-step verification" enabled, you ' +
        'will ask GMail to '
      'generate an app password for you to use in your app.'
      
        '6) This password is 16 characters long, and will be used in your' +
        ' app instead of '
      
        'your GMail account password. Thus, GMail guarantees that your pa' +
        'ssword will be '
      'preserved from access.'
      
        '7) This application password has a validity, so read all the inf' +
        'ormation from '
      'GMail.'
      
        '8) Ready! Now you just have to configure your app to use your 16' +
        ' character '
      'account and app password, instead of your real password.')
    TabOrder = 2
  end
  object btnEmailSend: TButton
    Left = 415
    Top = 355
    Width = 98
    Height = 25
    Caption = 'Send...'
    TabOrder = 3
    OnClick = btnEmailSendClick
  end
  object lbedtEmailFrom: TLabeledEdit
    Left = 8
    Top = 99
    Width = 401
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = 'Email From:'
    TabOrder = 4
    Text = 'rejanebs2013@gmail.com'
  end
  object lbedtEmailHost: TLabeledEdit
    Left = 8
    Top = 16
    Width = 401
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Email Host:'
    TabOrder = 5
    Text = 'smtp.gmail.com'
  end
  object lbedtHostPort: TLabeledEdit
    Left = 416
    Top = 16
    Width = 73
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Port:'
    TabOrder = 6
    Text = '465'
  end
  object lbedtHostUserName: TLabeledEdit
    Left = 8
    Top = 56
    Width = 233
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'User Name:'
    TabOrder = 7
    Text = 'rejanebs2013@gmail.com'
  end
  object lbedtHostPassword: TLabeledEdit
    Left = 312
    Top = 56
    Width = 313
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'User Password:'
    TabOrder = 8
    Text = 'Secnil1234567'
  end
  object lbedtEmailBCCList: TLabeledEdit
    Left = 8
    Top = 139
    Width = 401
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'BCC list:'
    TabOrder = 9
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':465'
    Intercept = IdLogEvent1
    MaxLineAction = maException
    Port = 465
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 456
    Top = 176
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 568
    Top = 120
  end
  object IdSMTP1: TIdSMTP
    Intercept = IdLogEvent1
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    Port = 465
    SASLMechanisms = <>
    UseTLS = utUseImplicitTLS
    Left = 568
    Top = 192
  end
  object IdLogEvent1: TIdLogEvent
    Left = 568
    Top = 280
  end
  object IdLogFile1: TIdLogFile
    Intercept = IdLogEvent1
    Filename = 'IndyLog.txt'
    Left = 576
    Top = 360
  end
end
