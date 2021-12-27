object frmEmpresa: TfrmEmpresa
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  BorderWidth = 3
  Caption = 'Cadastro de Empresa'
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
      Caption = 'Cadastro de Empresa'
      ImageIndex = 1
      object Label1: TLabel
        Left = 19
        Top = 11
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 88
        Top = 11
        Width = 65
        Height = 15
        Caption = 'Raz'#227'o Social'
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 17
        Top = 54
        Width = 79
        Height = 15
        Caption = 'Nome Fantasia'
        FocusControl = DBEdit6
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 96
        Width = 21
        Height = 15
        Caption = 'CEP'
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 105
        Top = 96
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 590
        Top = 96
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
        FocusControl = DBEdit14
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 17
        Top = 132
        Width = 77
        Height = 15
        Caption = 'Complemento'
        FocusControl = DBEdit12
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 17
        Top = 176
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 92
        Top = 175
        Width = 37
        Height = 15
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 621
        Top = 176
        Width = 14
        Height = 15
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
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
      object DBEdit1: TDBEdit
        Left = 17
        Top = 27
        Width = 63
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'CODIGO'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 27
        Width = 559
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'RAZAO'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit6: TDBEdit
        Left = 17
        Top = 70
        Width = 630
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FANTASIA'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 17
        Top = 111
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'CEP'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 104
        Top = 111
        Width = 480
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'ENDERECO'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit14: TDBEdit
        Left = 590
        Top = 111
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'NUMERO'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit12: TDBEdit
        Left = 17
        Top = 148
        Width = 630
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'COMPLEMENTO'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit15: TDBEdit
        Left = 17
        Top = 191
        Width = 72
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DataField = 'ID_CIDADE'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object cbCidade: TDBLookupComboboxEh
        Left = 94
        Top = 191
        Width = 521
        Height = 21
        Ctl3D = False
        ParentCtl3D = False
        DynProps = <>
        DataField = 'ID_CIDADE'
        DataSource = dsEmpresa
        DropDownBox.AutoDrop = True
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO;UF'
        ListSource = dsCidade
        ParentFont = False
        TabOrder = 9
        Visible = True
      end
      object DBEdit7: TDBEdit
        Left = 621
        Top = 191
        Width = 26
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DataField = 'UF'
        DataSource = dsEmpresa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 49
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 5592405
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
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
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 74
    Top = 163
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'frxDBEmpresa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'FANTASIA=FANTASIA'
      'RAZAO=RAZAO'
      'TIPO=TIPO'
      'CNPJ=CNPJ'
      'IE=IE'
      'IM=IM'
      'ENDERECO=ENDERECO'
      'NUMERO=NUMERO'
      'COMPLEMENTO=COMPLEMENTO'
      'BAIRRO=BAIRRO'
      'CIDADE=CIDADE'
      'UF=UF'
      'CEP=CEP'
      'FONE=FONE'
      'FAX=FAX'
      'SITE=SITE'
      'LOGOMARCA=LOGOMARCA'
      'FUNDACAO=FUNDACAO'
      'USU_CAD=USU_CAD'
      'USU_ATU=USU_ATU'
      'NSERIE=NSERIE'
      'CSENHA=CSENHA'
      'NTERM=NTERM'
      'ID_PLANO_TRANSFERENCIA_C=ID_PLANO_TRANSFERENCIA_C'
      'ID_PLANO_TRANSFERENCIA_D=ID_PLANO_TRANSFERENCIA_D'
      'ID_CAIXA_GERAL=ID_CAIXA_GERAL'
      'BLOQUEAR_ESTOQUE_NEGATIVO=BLOQUEAR_ESTOQUE_NEGATIVO'
      'ID_CIDADE=ID_CIDADE'
      'CRT=CRT'
      'ID_UF=ID_UF'
      'ID_PLANO_VENDA=ID_PLANO_VENDA'
      'OBSFISCO=OBSFISCO'
      'CFOP=CFOP'
      'CSOSN=CSOSN'
      'CST_ICMS=CST_ICMS'
      'ALIQ_ICMS=ALIQ_ICMS'
      'CST_ENTRADA=CST_ENTRADA'
      'CST_SAIDA=CST_SAIDA'
      'ALIQ_PIS=ALIQ_PIS'
      'ALIQ_COF=ALIQ_COF'
      'CST_IPI=CST_IPI'
      'ALIQ_IPI=ALIQ_IPI'
      'IMP_F5=IMP_F5'
      'IMP_F6=IMP_F6'
      'MOSTRA_RESUMO_CAIXA=MOSTRA_RESUMO_CAIXA'
      'LIMITE_DIARIO=LIMITE_DIARIO'
      'PRAZO_MAXIMO=PRAZO_MAXIMO'
      'ID_PLA_CONTA_FICHA_CLI=ID_PLA_CONTA_FICHA_CLI'
      'ID_PLANO_CONTA_RETIRADA=ID_PLANO_CONTA_RETIRADA'
      'USA_PDV=USA_PDV'
      'RECIBO_VIAS=RECIBO_VIAS'
      'ID_PLANO_TAXA_CARTAO=ID_PLANO_TAXA_CARTAO'
      'OBS_CARNE=OBS_CARNE'
      'CAIXA_UNICO=CAIXA_UNICO'
      'CAIXA_RAPIDO=CAIXA_RAPIDO'
      'EMPRESA_PADRAO=EMPRESA_PADRAO'
      'ID_PLANO_CONTA_DEVOLUCAO=ID_PLANO_CONTA_DEVOLUCAO'
      'N_INICIAL_NFCE=N_INICIAL_NFCE'
      'N_INICIAL_NFE=N_INICIAL_NFE'
      'CHECA_ESTOQUE_FISCAL=CHECA_ESTOQUE_FISCAL'
      'DESCONTO_PROD_PROMO=DESCONTO_PROD_PROMO'
      'DATA_CADASTRO=DATA_CADASTRO'
      'DATA_VALIDADE=DATA_VALIDADE'
      'FLAG=FLAG'
      'LANCAR_CARTAO_CREDITO=LANCAR_CARTAO_CREDITO'
      'FILTRAR_EMPRESA_LOGIN=FILTRAR_EMPRESA_LOGIN'
      'ENVIAR_EMAIL_NFE=ENVIAR_EMAIL_NFE'
      'TRANSPORTADORA=TRANSPORTADORA'
      'TABELA_PRECO=TABELA_PRECO'
      'TAXA_VENDA_PRAZO=TAXA_VENDA_PRAZO'
      'EMAIL_CONTADOR=EMAIL_CONTADOR'
      'AUTOPECAS=AUTOPECAS'
      'ATUALIZA_PR_VENDA=ATUALIZA_PR_VENDA'
      'INFORMAR_GTIN=INFORMAR_GTIN'
      'RECOLHE_FCP=RECOLHE_FCP'
      'DIFAL_ORIGEM=DIFAL_ORIGEM'
      'DIFAL_DESTINO=DIFAL_DESTINO'
      'EXCLUI_PDV=EXCLUI_PDV'
      'VENDA_SEMENTE=VENDA_SEMENTE'
      'CHECA=CHECA'
      'EMAIL=EMAIL'
      'ULTIMONSU=ULTIMONSU'
      'ULTIMO_PEDIDO=ULTIMO_PEDIDO'
      'TIPO_CONTRATO=TIPO_CONTRATO'
      'TIPO_EMPRESA=TIPO_EMPRESA'
      'QTD_MESAS=QTD_MESAS'
      'BLOQUEAR_PRECO=BLOQUEAR_PRECO'
      'EXIBE_RESUMO_CAIXA=EXIBE_RESUMO_CAIXA'
      'ID_PLANO_COMPRA=ID_PLANO_COMPRA'
      'RESPONSAVEL_TECNICO=RESPONSAVEL_TECNICO'
      'CARENCIA_JUROS=CARENCIA_JUROS'
      'PESQUISA_REFERENCIA=PESQUISA_REFERENCIA'
      'RESTAURANTE=RESTAURANTE'
      'EXIBE_F3=EXIBE_F3'
      'EXIBE_F4=EXIBE_F4'
      'LER_PESO=LER_PESO'
      'CHECA_LIMITE=CHECA_LIMITE'
      'EMITE_ECF=EMITE_ECF'
      'LOJA_ROUPA=LOJA_ROUPA'
      'TIPO_JUROS=TIPO_JUROS'
      'JUROS_DIA=JUROS_DIA'
      'JUROS_MES=JUROS_MES'
      'FARMACIA=FARMACIA'
      'DESCONTO_MAXIMO=DESCONTO_MAXIMO'
      'HABILITA_DESCONTO_PDV=HABILITA_DESCONTO_PDV'
      'PAGAMENTO_DINHEIRO=PAGAMENTO_DINHEIRO'
      'RESPONSAVEL_EMPRESA=RESPONSAVEL_EMPRESA'
      'PUXA_CFOP_PRODUTO=PUXA_CFOP_PRODUTO'
      'LANCAR_CARTAO_CR=LANCAR_CARTAO_CR'
      'USA_BLUETOOTH_RESTA=USA_BLUETOOTH_RESTA')
    DataSet = Dados.qryEmpresas
    BCDToCurrency = False
    Left = 72
    Top = 216
  end
  object frxReport: TfrxReport
    Version = '6.4.10'
    DataSetName = 'frxDBCo'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41869.389758275500000000
    ReportOptions.LastChange = 43700.648592569440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 154
    Top = 163
    Datasets = <
      item
      end
      item
        DataSet = frxDBEmpresa
        DataSetName = 'frxDBEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Compra: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.080000000000000000
      RightMargin = 5.080000000000000000
      TopMargin = 5.080000000000000000
      BottomMargin = 5.080000000000000000
      Frame.Typ = []
      MirrorMode = []
      HGuides.Strings = (
        '19,2')
      VGuides.Strings = (
        '3,91')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.960000000000000000
        Top = 268.800000000000000000
        Width = 1084.120385200000000000
        RowCount = 0
        object Memo22: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 24.960000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          ParentFont = False
        end
        object frxDBClientesCODIGO: TfrxMemoView
          AllowVectorExport = True
          Left = 2.880000000000000000
          Top = 2.880000000000000000
          Width = 48.000000000000000000
          Height = 19.200000000000000000
          DataField = 'CODIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."CODIGO"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 53.600000000000000000
          Top = 2.880000000000000000
          Width = 124.800000000000000000
          Height = 19.200000000000000000
          DataField = 'REFERENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."REFERENCIA"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 182.400000000000000000
          Top = 2.880000000000000000
          Width = 316.800000000000000000
          Height = 19.200000000000000000
          DataField = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."DESCRICAO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 502.560000000000000000
          Top = 2.880000000000000000
          Width = 172.800000000000000000
          Height = 19.200000000000000000
          DataField = 'GRUPO_SL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."GRUPO_SL"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 889.760000000000000000
          Top = 2.880000000000000000
          Width = 28.800000000000000000
          Height = 19.200000000000000000
          DataField = 'UNIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProduto."UNIDADE"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 751.360000000000000000
          Top = 2.880000000000000000
          Width = 67.200000000000000000
          Height = 19.200000000000000000
          DataField = 'PR_VENDA'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."PR_VENDA"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 824.320000000000000000
          Top = 2.880000000000000000
          Width = 62.400000000000000000
          Height = 19.200000000000000000
          DataField = 'QTD_ATUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."QTD_ATUAL"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 1002.240000000000000000
          Top = 2.880000000000000000
          Width = 81.600000000000000000
          Height = 19.200000000000000000
          DataField = 'TOTAL_VENDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."TOTAL_VENDA"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2f'
              Kind = fkNumeric
            end
            item
            end>
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 925.440000000000000000
          Top = 2.880000000000000000
          Width = 72.000000000000000000
          Height = 19.200000000000000000
          DataField = 'TOTAL_COMPRA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."TOTAL_COMPRA"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2f'
              Kind = fkNumeric
            end
            item
            end>
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 678.600000000000000000
          Top = 3.600000000000000000
          Width = 67.200000000000000000
          Height = 19.200000000000000000
          DataField = 'PR_CUSTO'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBProduto."PR_CUSTO"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 144.000000000000000000
        Top = 19.200000000000000000
        Width = 1084.120385200000000000
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Width = 1083.840000000000000000
          Height = 144.000000000000000000
          Frame.Typ = []
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 121.304020000000000000
          Top = 6.856710000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBEmp'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."FANTASIA"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 19.200000000000000000
          Top = 101.379530000000000000
          Width = 1061.367100000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTAGEM DE PRODUTOS')
          ParentFont = False
        end
        object frxDBEmpresaENDERECO: TfrxMemoView
          AllowVectorExport = True
          Left = 120.600000000000000000
          Top = 49.600000000000000000
          Width = 624.000000000000000000
          Height = 19.200000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'END:[frxDBEmpresa."ENDERECO"],[frxDBEmpresa."NUMERO"] - [frxDBEm' +
              'presa."BAIRRO"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 121.200000000000000000
          Top = 71.400000000000000000
          Width = 624.000000000000000000
          Height = 19.200000000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FONE:[frxDBEmpresa."FONE"] EMAIL:[frxDBEmpresa."EMAIL"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 17.200000000000000000
          Top = 124.000000000000000000
          Width = 1064.995300000000000000
          Height = 19.200000000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[PARAMETRO]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 96.600000000000000000
          Width = 1082.880000000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object frxDBEmpresaRAZAO: TfrxMemoView
          AllowVectorExport = True
          Left = 120.600000000000000000
          Top = 28.800000000000000000
          Width = 403.200000000000000000
          Height = 19.200000000000000000
          DataField = 'RAZAO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEmpresa."RAZAO"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 15.200000000000000000
          Top = 13.200000000000000000
          Width = 86.400000000000000000
          Height = 76.800000000000000000
          DataField = 'LOGOMARCA'
          DataSet = frxDBEmpresa
          DataSetName = 'frxDBEmpresa'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.000000000000000000
        Top = 182.400000000000000000
        Width = 1084.120385200000000000
        object Memo23: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 24.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clMenu
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 2.880000000000000000
          Top = 1.920000000000000000
          Width = 48.000000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#211'DIGO')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 182.400000000000000000
          Top = 1.920000000000000000
          Width = 316.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 54.200000000000000000
          Top = 1.920000000000000000
          Width = 124.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'REFER'#202'NCIA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 502.560000000000000000
          Top = 1.920000000000000000
          Width = 172.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GRUPO')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 889.760000000000000000
          Top = 1.920000000000000000
          Width = 28.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'UND')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 751.360000000000000000
          Top = 1.920000000000000000
          Width = 67.200000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P.VENDA')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 824.320000000000000000
          Top = 1.920000000000000000
          Width = 62.400000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ESTOQUE')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 1002.240000000000000000
          Top = 1.920000000000000000
          Width = 76.800000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'T.VENDA')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 925.440000000000000000
          Top = 1.920000000000000000
          Width = 72.000000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'T.COMPRA')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 679.200000000000000000
          Top = 1.600000000000000000
          Width = 67.200000000000000000
          Height = 17.280000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P.CUSTO')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 451.200000000000000000
        Width = 1084.120385200000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 489.600000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio emitido em [DATE]- [TIME]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 657.179530000000000000
          Top = 1.000000000000000000
          Width = 96.000000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'g.[PAGE#]')
          ParentFont = False
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 3.779530000000000000
        Top = 355.200000000000000000
        Width = 1084.120385200000000000
        object Memo25: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 3.779530000000000000
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 48.000000000000000000
        Top = 384.000000000000000000
        Width = 1084.120385200000000000
        object Memo26: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 1084.120385200000000000
          Height = 48.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.910000000000000000
          Top = 4.600000000000000000
          Width = 134.400000000000000000
          Height = 19.200000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Itens:[LINE#]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 152.600000000000000000
          Top = 4.600000000000000000
          Width = 172.800000000000000000
          Height = 30.720000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtd.Estoque Atual: [SUM(<frxDBProduto."QTD_ATUAL">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 485.110000000000000000
          Top = 6.600000000000000000
          Width = 288.000000000000000000
          Height = 30.720000000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Total em Estoque por Pre'#231'o de Compra:[SUM(<frxDBProduto."TOTAL_C' +
              'OMPRA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 789.110000000000000000
          Top = 5.600000000000000000
          Width = 288.000000000000000000
          Height = 30.720000000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Total em Estoque por Pre'#231'o de Venda: [SUM(<frxDBProduto."TOTAL_V' +
              'ENDA">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object dsEmpresa: TDataSource
    DataSet = Dados.qryEmpresas
    Left = 152
    Top = 216
  end
  object dsCidade: TDataSource
    DataSet = Dados.qryCidade
    Left = 520
    Top = 200
  end
end
