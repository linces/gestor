object frmConfiguracoes: TfrmConfiguracoes
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'Configura'#231#245'es'
  ClientHeight = 491
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label136: TLabel
    Left = 3
    Top = 288
    Width = 12
    Height = 13
    Caption = #1
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 722
    Height = 442
    ActivePage = TabSheet2
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 387
        Width = 714
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Color = 5592405
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          714
          25)
        object Label8: TLabel
          Left = 765
          Top = 22
          Width = 188
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Relat'#243'rio de Vendas no Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10066329
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 813
        end
        object btnCancelar: TLabel
          Left = 125
          Top = 0
          Width = 76
          Height = 25
          Align = alLeft
          Caption = 'F6 Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCancelarClick
          ExplicitHeight = 20
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 0
          Width = 33
          Height = 25
        end
        object Splitter2: TSplitter
          Left = 698
          Top = 0
          Width = 16
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter3: TSplitter
          Left = 698
          Top = 0
          Width = 0
          Height = 25
          Align = alRight
          ExplicitLeft = 684
        end
        object Splitter9: TSplitter
          Left = 92
          Top = 0
          Width = 33
          Height = 25
          ExplicitLeft = 100
        end
        object btnSalvar: TLabel
          Left = 33
          Top = 0
          Width = 59
          Height = 25
          Align = alLeft
          Caption = 'F5 Salvar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnSalvarClick
          ExplicitHeight = 20
        end
      end
      object PageControl3: TPageControl
        Left = 214
        Top = 0
        Width = 500
        Height = 387
        ActivePage = TabSheet11
        Align = alClient
        TabOrder = 1
        object TabSheet11: TTabSheet
          Caption = 'Impressoras'
          object Label13: TLabel
            Left = 3
            Top = 82
            Width = 118
            Height = 15
            Caption = 'Modelo da Impressora'
          end
          object Label15: TLabel
            Left = 3
            Top = 125
            Width = 28
            Height = 15
            Caption = 'Porta'
          end
          object Label1: TLabel
            Left = 3
            Top = 164
            Width = 58
            Height = 15
            Caption = 'Velocidade'
          end
          object Label135: TLabel
            Left = 3
            Top = 212
            Width = 78
            Height = 15
            Caption = 'P'#225'gina C'#243'digo'
          end
          object Label2: TLabel
            Left = 3
            Top = 262
            Width = 21
            Height = 15
            Caption = 'Vias'
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 492
            Height = 67
            Align = alTop
            Caption = 'Tip de Impressora'
            Columns = 2
            DataField = 'TIPOIMPRESSORA'
            DataSource = dsTerminal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Items.Strings = (
              'Papel A4'
              'Bobina')
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              '1'
              '2')
          end
          object cbModeloImpressora: TDBComboBox
            Left = 3
            Top = 98
            Width = 286
            Height = 25
            BevelKind = bkFlat
            Ctl3D = False
            DataField = 'MODELO'
            DataSource = dsTerminal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Items.Strings = (
              'TEXTO'
              'ELGIN'
              'EPSON'
              'BEMATECH'
              'DARUMA'
              'VOX'
              'DIEBOLD'
              'EPSONP2')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
          object cbVelocidade: TDBComboBox
            Left = 3
            Top = 183
            Width = 286
            Height = 25
            BevelKind = bkFlat
            Ctl3D = False
            DataField = 'VELOCIDADE'
            DataSource = dsTerminal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Items.Strings = (
              '75'
              '110'
              '134'
              '150'
              '300'
              '600'
              '1200'
              '1800'
              '2400'
              '4800'
              '7200'
              '9600'
              '14400'
              '19200'
              '38400'
              '57600'
              '115200'
              '128000')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object cbPortaImpressora: TDBComboBox
            Left = 3
            Top = 140
            Width = 286
            Height = 25
            BevelKind = bkFlat
            Ctl3D = False
            DataField = 'PORTA'
            DataSource = dsTerminal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Items.Strings = (
              '75'
              '110'
              '134'
              '150'
              '300'
              '600'
              '1200'
              '1800'
              '2400'
              '4800'
              '7200'
              '9600'
              '14400'
              '19200'
              '38400'
              '57600'
              '115200'
              '128000')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
          object cbPaginaCodigo: TDBComboBox
            Left = 3
            Top = 231
            Width = 286
            Height = 25
            BevelKind = bkFlat
            Ctl3D = False
            DataField = 'PAGINA_CODIGO'
            DataSource = dsTerminal
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
          end
          object DBEdit1: TDBEdit
            Left = 3
            Top = 277
            Width = 121
            Height = 21
            Ctl3D = False
            DataField = 'NVIAS'
            DataSource = dsTerminal
            ParentCtl3D = False
            TabOrder = 5
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 214
        Height = 387
        Align = alLeft
        DataSource = dsTerminal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 173
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = 5592405
    ParentBackground = False
    TabOrder = 1
    object Image1: TImage
      Left = 638
      Top = 0
      Width = 84
      Height = 49
      Align = alRight
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200804000000D973B27F0000000467414D410000B18F0BFC61050000000262
        4B47440000AA8D2332000000097048597300000EC400000EC401952B0E1B0000
        000774494D4507E30A1F0C3812F3F2A833000002374944415478DAA5954F6C4C
        5114C67F27A1A6841DC5564AB50D226181489A88101A42229848946045225236
        62C36AD234111B8A062136D54422FE949096069B2EA811A69644D955D3998CC5
        75EE7BDA99F7E74EE7F1ADDE3DEF9CEF3BEF9C73CF136260E6D14A0B0D2C6491
        1EBF31CA475EF040C6A2BE12096EE034FB48C5F0E6B94B463E552030B3B9C071
        66E0C66F2E7156F2B1046629BD34313D86D925B9088159CD63E657116EF1932D
        32142050F5575587FB14EBFD2C3C0293E22D2B12845B7C608DAD854FD0C9C984
        E1161DD2EE1168E3DE57ACBC0B459A256709BA690BBCC892E1101B43EE432A93
        0E095D95A3A253371A1A9B837253AB729FCD65B63E7648C1DCE240C073823A31
        696E87B4FAB5498500851F9EE235AB42BE7BC55CE370E4EB26037C8AE029882B
        6206591753A0A71A9437B3E8A1869DDED33DB6C5F80D881961496C8D277571AA
        5BE4C48C33C7D1262F0BED924BDDE25725823E9BBC47D0C37687CFD8FF7EC267
        312FD9E052F792AF992A675C16FD62BA38E2549FBE8D97C5ECE74EC8F88C56C7
        203D890CF81E3BCADFA90D189B24EB18E536BA039E7694B5CAD7F5EA9423A3C3
        DDC9A690D60037686779C0D625C72CC132BD6733498E228DF2C55F281D9CFA07
        828C9C29ADB437AC4C183ECCDAA995A614F50C265AAA3F74A98ED887F2B5FE88
        0555876F0DADF5BF59F4D25C45F83B76FBEA2102A5A8E53C272A76A4C845CE49
        A16488FE5CEBF5E79A0E8D968F099DD94C49DB41E091CCD5FBDF4223752CD6E3
        575DBB599EF350C6A3BE7F00CA60CF1FC8041E30000000257445587464617465
        3A63726561746500323031392D31302D33315431323A35363A31382B30303A30
        3032D82A9D0000002574455874646174653A6D6F6469667900323031392D3130
        2D33315431323A35363A31382B30303A3030438592210000001974455874536F
        667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000000049
        454E44AE426082}
      OnClick = Image1Click
      ExplicitTop = -6
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 352
    Top = 216
  end
  object OpenPicture: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jpg;*.jpeg;*.gif;*.png;*.i' +
      'co;*.emf;*.wmf;*.tif;*.tiff)|*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.jp' +
      'g;*.jpeg;*.gif;*.png;*.ico;*.emf;*.wmf;*.tif;*.tiff|GIF Image (*' +
      '.gif)|*.gif|Portable Network Graphics (*.png)|*.png|JPEG Image F' +
      'ile (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp' +
      ')|*.bmp|JPEG Images (*.jpg)|*.jpg|JPEG Images (*.jpeg)|*.jpeg|GI' +
      'F Images (*.gif)|*.gif|PNG Images (*.png)|*.png|Icons (*.ico)|*.' +
      'ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|TIF' +
      'F Images (*.tif)|*.tif|TIFF Images (*.tiff)|*.tiff'
    Left = 360
    Top = 351
  end
  object dsTerminal: TDataSource
    DataSet = Dados.qryTerminal
    Left = 520
    Top = 200
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 352
    Top = 248
  end
end
