object frmCadPessoa: TfrmCadPessoa
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 533
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 834
    Height = 455
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 826
        Height = 420
        Align = alClient
        BevelOuter = bvNone
        Color = 16382457
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 46
          Top = 23
          Width = 43
          Height = 17
          Alignment = taRightJustify
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 53
          Top = 79
          Width = 36
          Height = 17
          Alignment = taRightJustify
          Caption = 'Nome'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 34
          Top = 163
          Width = 55
          Height = 17
          Alignment = taRightJustify
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 54
          Top = 219
          Width = 35
          Height = 17
          Alignment = taRightJustify
          Caption = 'Bairro'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 67
          Top = 135
          Width = 22
          Height = 17
          Alignment = taRightJustify
          Caption = 'CEP'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 48
          Top = 247
          Width = 41
          Height = 17
          Alignment = taRightJustify
          Caption = 'Cidade'
          FocusControl = DBEdit6
        end
        object Label8: TLabel
          Left = 558
          Top = 253
          Width = 15
          Height = 17
          Caption = 'UF'
        end
        object Label12: TLabel
          Left = 34
          Top = 51
          Width = 55
          Height = 17
          Alignment = taRightJustify
          Caption = 'CPF/CNPJ'
          FocusControl = DBEdit8
        end
        object Label13: TLabel
          Left = 431
          Top = 53
          Width = 32
          Height = 17
          Caption = 'RG/IE'
          FocusControl = DBEdit12
        end
        object Label15: TLabel
          Left = 46
          Top = 303
          Width = 43
          Height = 17
          Alignment = taRightJustify
          Caption = 'Fone 1 '
        end
        object Label23: TLabel
          Left = 58
          Top = 275
          Width = 31
          Height = 17
          Alignment = taRightJustify
          Caption = 'Email'
        end
        object Label9: TLabel
          Left = 7
          Top = 191
          Width = 82
          Height = 17
          Alignment = taRightJustify
          Caption = 'Complemento'
        end
        object Label17: TLabel
          Left = 422
          Top = 23
          Width = 41
          Height = 17
          Caption = 'Pessoa'
        end
        object Label18: TLabel
          Left = 50
          Top = 332
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = 'Fone 2'
        end
        object Label19: TLabel
          Left = 259
          Top = 331
          Width = 51
          Height = 17
          Caption = 'Celular 2'
        end
        object Label20: TLabel
          Left = 259
          Top = 305
          Width = 51
          Height = 17
          Caption = 'Celular 1'
        end
        object Label25: TLabel
          Left = 44
          Top = 107
          Width = 45
          Height = 17
          Alignment = taRightJustify
          Caption = 'Apelido'
          FocusControl = DBEdit22
        end
        object Label26: TLabel
          Left = 509
          Top = 166
          Width = 48
          Height = 17
          Caption = 'N'#250'mero'
          FocusControl = DBEdit7
        end
        object Label34: TLabel
          Left = 16
          Top = 365
          Width = 73
          Height = 17
          Caption = 'Regime Trib.'
        end
        object Label27: TLabel
          Left = 10
          Top = 391
          Width = 79
          Height = 17
          Caption = 'Tipo de Cont.'
        end
        object Label33: TLabel
          Left = 383
          Top = 358
          Width = 125
          Height = 17
          Caption = 'Tipo de Recebimento'
        end
        object Label35: TLabel
          Left = 452
          Top = 305
          Width = 60
          Height = 17
          Caption = 'WhatsApp'
        end
        object DBEdit1: TDBEdit
          Left = 95
          Top = 25
          Width = 97
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CODIGO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 96
          Top = 84
          Width = 531
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'RAZAO'
          DataSource = dsClientes
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
          Left = 96
          Top = 166
          Width = 406
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'ENDERECO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit4: TDBEdit
          Left = 95
          Top = 221
          Width = 532
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'BAIRRO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit5: TDBEdit
          Left = 96
          Top = 138
          Width = 80
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CEP'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          OnKeyDown = DBEdit5KeyDown
        end
        object DBEdit6: TDBEdit
          Left = 95
          Top = 250
          Width = 52
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CODMUN'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit8: TDBEdit
          Left = 95
          Top = 52
          Width = 141
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CNPJ'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnKeyDown = DBEdit8KeyDown
        end
        object DBEdit12: TDBEdit
          Left = 468
          Top = 52
          Width = 159
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'IE'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit11: TDBEdit
          Left = 95
          Top = 303
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'FONE1'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit19: TDBEdit
          Left = 95
          Top = 277
          Width = 532
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'EMAIL1'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 14
        end
        object GroupBox2: TGroupBox
          Left = 655
          Top = 11
          Width = 162
          Height = 253
          Caption = 'Par'#226'metros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          object DBCheckBox2: TDBCheckBox
            Left = 17
            Top = 33
            Width = 120
            Height = 17
            Caption = 'Clientes'
            DataField = 'CLI'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 17
            Top = 72
            Width = 120
            Height = 17
            Caption = 'Funcion'#225'rios'
            DataField = 'FUN'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object chkFornecedor: TDBCheckBox
            Left = 17
            Top = 52
            Width = 120
            Height = 17
            Caption = 'Fornecedores'
            DataField = 'FORN'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox10: TDBCheckBox
            Left = 17
            Top = 150
            Width = 120
            Height = 17
            Caption = 'Ativo'
            DataField = 'ATIVO'
            DataSource = dsClientes
            DragCursor = crDefault
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 17
            Top = 130
            Width = 120
            Height = 17
            Caption = 'CCF/SPC'
            DataField = 'CCF'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox7: TDBCheckBox
            Left = 17
            Top = 91
            Width = 120
            Height = 17
            Caption = 'Administradoras'
            DataField = 'ADM'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox8: TDBCheckBox
            Left = 17
            Top = 111
            Width = 120
            Height = 17
            Caption = 'Parceiros'
            DataField = 'PARC'
            DataSource = dsClientes
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object DBEdit9: TDBEdit
          Left = 95
          Top = 193
          Width = 532
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'COMPLEMENTO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit15: TDBEdit
          Left = 95
          Top = 330
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'FONE2'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 18
        end
        object DBEdit16: TDBEdit
          Left = 314
          Top = 330
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CELULAR2'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 19
        end
        object DBEdit17: TDBEdit
          Left = 314
          Top = 303
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'CELULAR1'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 16
        end
        object DBComboBox1: TDBComboBox
          Left = 468
          Top = 23
          Width = 159
          Height = 23
          Style = csDropDownList
          AutoDropDown = True
          BevelKind = bkFlat
          CharCase = ecUpperCase
          DataField = 'TIPO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'F'#205'SICA'
            'JUR'#205'DICA')
          ParentFont = False
          TabOrder = 1
          OnExit = DBComboBox1Exit
        end
        object DBEdit22: TDBEdit
          Left = 96
          Top = 111
          Width = 531
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'FANTASIA'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          OnExit = DBEdit22Exit
        end
        object DBComboBoxEh1: TDBComboBoxEh
          Left = 578
          Top = 251
          Width = 49
          Height = 21
          Ctl3D = False
          DataField = 'UF'
          DataSource = dsClientes
          DynProps = <>
          DropDownBox.AutoDrop = True
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          KeyItems.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
          Visible = True
        end
        object DBEdit7: TDBEdit
          Left = 566
          Top = 166
          Width = 61
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'NUMERO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Left = 152
          Top = 250
          Width = 400
          Height = 21
          Ctl3D = False
          ParentCtl3D = False
          DynProps = <>
          DataField = 'CODMUN'
          DataSource = dsClientes
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
          TabOrder = 12
          Visible = True
          OnEnter = DBLookupComboboxEh1Enter
          OnExit = DBLookupComboboxEh1Exit
          OnKeyPress = DBLookupComboboxEh1KeyPress
        end
        object btnCEP: TBitBtn
          Left = 183
          Top = 136
          Width = 130
          Height = 23
          Caption = 'Pesquisar CEP'
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000FBFBFBF4F4F4
            F0F0F0EEEEEEEBEBEBEAEAEAEAEAEAE9E9E9E9E9E9EAEAE9ECEAE7EFEEECF6F5
            F5FBFBFBFFFFEFEFEFDCDCDCD3D3D3CFCFCFCCCCCCCACACACACACACACACAC8C8
            C7BEB8A9B19E75C0B395DCDAD5F6F6F6FFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFE
            FEFEFEFEFEFEFEFDFDFCF0EBE0C7AF7CB89141D1B170F6EFE1FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4EECBB586B79242CAA357E6
            CEA1FCF7F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7F9F9F9FEFEFDD1
            BE95B69145C69E50E2C791F8F1E3FEFEFEFFFFFFFFFFFFFFFFFDFDFDECECECD1
            D1D1C5C5C5C6C6C6CECBC4B59654C29A4CDDBF82F6ECDAFEFEFCFFFFFFFFFFFF
            FFFFFEFEFEE6E6E6C8C8C8D2D2D2DEDEDEDEDEDED3D3D0BDB5A4D6B983F5E9D0
            FEFDFCFFFFFFFFFFFFFFFFFFFFFFF5F5F5CECECED5D8DDA4CEEA64BAEF76C2F1
            D6E9F5D4D8DDD0D0CEFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3CDD0D3
            B4D1E771BAEE75BCF0ACD6F4BFDDF69FCBF0B7C5D5F1F1F1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFDFDFDFCED6DCA8CEEDB0D5F1AED4F296C8F2CAE2F7A9D5F3B1C8
            DEF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7D4D8DDC0DAEFB6D6F2D7E7
            F59FCCF3C4DFF7C5E1F3CAD6DFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
            F6E2E2E2E8EAECDBE7F4D1E6F7CEE6F8F0F5FAE2E6EAE4E6E6FAFAFAFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1E4E4E4E8E9E9E7ECF0EBEFF1E9E9EAE5
            E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6E9
            E9E9E5E5E5E5E5E5EDEDEDF8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          TabOrder = 24
          TabStop = False
          OnClick = btnCEPClick
        end
        object BitBtn2: TBitBtn
          Left = 242
          Top = 52
          Width = 182
          Height = 23
          Caption = 'Pesquisar Pessoa Jur'#237'dica'
          Glyph.Data = {
            9E020000424D9E0200000000000036000000280000000E0000000E0000000100
            18000000000068020000C40E0000C40E00000000000000000000FBFBFBF4F4F4
            F0F0F0EEEEEEEBEBEBEAEAEAEAEAEAE9E9E9E9E9E9EAEAE9ECEAE7EFEEECF6F5
            F5FBFBFBFFFFEFEFEFDCDCDCD3D3D3CFCFCFCCCCCCCACACACACACACACACAC8C8
            C7BEB8A9B19E75C0B395DCDAD5F6F6F6FFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFE
            FEFEFEFEFEFEFEFDFDFCF0EBE0C7AF7CB89141D1B170F6EFE1FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4EECBB586B79242CAA357E6
            CEA1FCF7F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF7F7F7F9F9F9FEFEFDD1
            BE95B69145C69E50E2C791F8F1E3FEFEFEFFFFFFFFFFFFFFFFFDFDFDECECECD1
            D1D1C5C5C5C6C6C6CECBC4B59654C29A4CDDBF82F6ECDAFEFEFCFFFFFFFFFFFF
            FFFFFEFEFEE6E6E6C8C8C8D2D2D2DEDEDEDEDEDED3D3D0BDB5A4D6B983F5E9D0
            FEFDFCFFFFFFFFFFFFFFFFFFFFFFF5F5F5CECECED5D8DDA4CEEA64BAEF76C2F1
            D6E9F5D4D8DDD0D0CEFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3CDD0D3
            B4D1E771BAEE75BCF0ACD6F4BFDDF69FCBF0B7C5D5F1F1F1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFDFDFDFCED6DCA8CEEDB0D5F1AED4F296C8F2CAE2F7A9D5F3B1C8
            DEF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7D4D8DDC0DAEFB6D6F2D7E7
            F59FCCF3C4DFF7C5E1F3CAD6DFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
            F6E2E2E2E8EAECDBE7F4D1E6F7CEE6F8F0F5FAE2E6EAE4E6E6FAFAFAFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1E4E4E4E8E9E9E7ECF0EBEFF1E9E9EAE5
            E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6E9
            E9E9E5E5E5E5E5E5EDEDEDF8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          TabOrder = 25
          TabStop = False
          OnClick = BitBtn2Click
        end
        object DBComboBox4: TDBComboBox
          Left = 95
          Top = 357
          Width = 175
          Height = 25
          Style = csDropDownList
          AutoDropDown = True
          BevelKind = bkFlat
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'REGIME_TRIBUTARIO'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'SIMPLES'
            'NORMAL')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 20
        end
        object DBComboBoxEh2: TDBComboBoxEh
          Left = 95
          Top = 388
          Width = 175
          Height = 23
          Ctl3D = False
          DataField = 'ISENTO'
          DataSource = dsClientes
          DynProps = <>
          DropDownBox.AutoDrop = True
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'CONTRIBUINTE'
            'ISENTO '
            'N'#195'O CONTRIBUINTE')
          KeyItems.Strings = (
            '0'
            '1'
            '2')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 21
          Visible = True
          OnEnter = DBLookupComboboxEh1Enter
          OnExit = DBComboBoxEh2Exit
          OnKeyPress = cbEmpresaKeyPress
        end
        object DBComboBoxEh3: TDBComboBoxEh
          Left = 514
          Top = 358
          Width = 113
          Height = 23
          Ctl3D = False
          DataField = 'TIPO_RECEBIMENTO'
          DataSource = dsClientes
          DynProps = <>
          DropDownBox.AutoDrop = True
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'MENSALIDADE'
            'ANUIDADE')
          KeyItems.Strings = (
            'MENSALIDADE'
            'ANUIDADE')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 22
          Visible = True
        end
        object DBEdit26: TDBEdit
          Left = 520
          Top = 305
          Width = 107
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'WHATSAPP'
          DataSource = dsClientes
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 17
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Adicionais'
      ImageIndex = 4
      object Label28: TLabel
        Left = 84
        Top = 62
        Width = 77
        Height = 17
        Caption = 'Nome do Pai'
      end
      object Label29: TLabel
        Left = 75
        Top = 33
        Width = 85
        Height = 17
        Caption = 'Nome da M'#227'e'
      end
      object Label11: TLabel
        Left = 72
        Top = 85
        Width = 89
        Height = 17
        Caption = 'Dt. Nascimento'
      end
      object Label7: TLabel
        Left = 94
        Top = 114
        Width = 67
        Height = 17
        Caption = 'Estado Civil'
      end
      object Label21: TLabel
        Left = 121
        Top = 178
        Width = 40
        Height = 17
        Caption = 'Sal'#225'rio'
      end
      object Label22: TLabel
        Left = 84
        Top = 206
        Width = 77
        Height = 17
        Caption = 'Dt. Admiss'#227'o'
      end
      object Label24: TLabel
        Left = 88
        Top = 233
        Width = 73
        Height = 17
        Caption = 'Dt.Demiss'#227'o'
      end
      object Label31: TLabel
        Left = 85
        Top = 256
        Width = 76
        Height = 17
        Caption = 'Observa'#231#245'es'
      end
      object Label10: TLabel
        Left = 133
        Top = 148
        Width = 28
        Height = 17
        Caption = 'Sexo'
      end
      object Label16: TLabel
        Left = 518
        Top = 94
        Width = 100
        Height = 17
        Caption = 'Limite de Cr'#233'dito'
      end
      object DBEdit14: TDBEdit
        Left = 167
        Top = 61
        Width = 570
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'PAI'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit23: TDBEdit
        Left = 167
        Top = 33
        Width = 570
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'MAE'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBComboBox2: TDBComboBox
        Left = 167
        Top = 118
        Width = 130
        Height = 25
        Style = csDropDownList
        AutoDropDown = True
        BevelKind = bkFlat
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'ECIVIL'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'CASADO'
          'SOLTEIRO'
          'DIVORCIADO'
          'VI'#218'VO')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Left = 167
        Top = 90
        Width = 130
        Height = 23
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'DT_NASC'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit13: TDBEdit
        Left = 167
        Top = 175
        Width = 130
        Height = 23
        Ctl3D = False
        DataField = 'SALARIO'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
      end
      object DBEdit18: TDBEdit
        Left = 167
        Top = 204
        Width = 130
        Height = 23
        Ctl3D = False
        DataField = 'DT_ADMISSAO'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit20: TDBEdit
        Left = 167
        Top = 233
        Width = 130
        Height = 23
        Ctl3D = False
        DataField = 'DT_DEMISSAO'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object DBMemo1: TDBMemo
        Left = 167
        Top = 262
        Width = 570
        Height = 83
        Color = clWhite
        Ctl3D = False
        DataField = 'OBS'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
      end
      object DBComboBox3: TDBComboBox
        Left = 167
        Top = 147
        Width = 130
        Height = 25
        Style = csDropDownList
        AutoDropDown = True
        BevelKind = bkFlat
        CharCase = ecUpperCase
        Ctl3D = True
        DataField = 'SEXO'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'MASCULINO'
          'FEMININO')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit21: TDBEdit
        Left = 624
        Top = 90
        Width = 113
        Height = 23
        Ctl3D = False
        DataField = 'LIMITE'
        DataSource = dsClientes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBCheckBox6: TDBCheckBox
        Left = 167
        Top = 351
        Width = 97
        Height = 17
        Caption = 'Atendente'
        DataField = 'ATENDENTE'
        DataSource = dsClientes
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 167
        Top = 366
        Width = 88
        Height = 17
        Caption = 'T'#233'cnico'
        DataField = 'TECNICO'
        DataSource = dsClientes
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Contatos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 826
        Height = 218
        Align = alClient
        DataSource = dsContatos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
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
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA_HORA'
            Title.Caption = 'Data/Hora'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_RETORNO'
            Title.Caption = 'Data Retorno'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VIRTUAL_PESSOA'
            Title.Caption = 'Pessoa'
            Width = 470
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 218
        Width = 826
        Height = 202
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label32: TLabel
          Left = 8
          Top = 60
          Width = 111
          Height = 17
          Caption = 'Motivo do Contato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 8
          Top = 100
          Width = 127
          Height = 17
          Caption = 'Descri'#231#227'o do Contato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 8
          Top = 17
          Width = 98
          Height = 17
          Caption = 'Data do Retorno'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit25: TDBEdit
          Left = 8
          Top = 36
          Width = 121
          Height = 25
          DataField = 'DATA_RETORNO'
          DataSource = dsContatos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit27: TDBEdit
          Left = 8
          Top = 77
          Width = 737
          Height = 25
          CharCase = ecUpperCase
          DataField = 'TITULO'
          DataSource = dsContatos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DBMemo2: TDBMemo
          Left = 8
          Top = 117
          Width = 737
          Height = 63
          DataField = 'MOTIVO'
          DataSource = dsContatos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBNavigator1: TDBNavigator
          Left = 521
          Top = 24
          Width = 224
          Height = 33
          DataSource = dsContatos
          VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
          TabOrder = 3
        end
      end
    end
    object tabFoto: TTabSheet
      Caption = 'Foto'
      ImageIndex = 3
      object DBImage1: TDBImage
        Left = 47
        Top = 32
        Width = 370
        Height = 217
        DataField = 'FOTO'
        DataSource = dsClientes
        Stretch = True
        TabOrder = 0
        OnClick = DBImage1Click
      end
      object BitBtn1: TBitBtn
        Left = 48
        Top = 255
        Width = 106
        Height = 23
        Caption = 'Limpar Imagem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 455
    Width = 834
    Height = 78
    Align = alBottom
    TabOrder = 1
    object btnGravar: TSpeedButton
      Left = 15
      Top = 6
      Width = 80
      Height = 70
      Caption = 'F5 | Gravar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FBFAF9D9CEC2AB8E768D6A487C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522F9C7B5FEDE8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCCCBBAD86613E7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7E532FDFD5CBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD5CC
        8F6C4C7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFAF8F7B399857C522D7C522E9B7B5EDACEC4FFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9A7654F7E4CAF7E4CAF7E4CAF7E4CAF7E4CA
        F7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4
        CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CAF7E4CA9B76547C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1ECE9A1836A
        7C522D845D3ACEBEB0FEFEFEFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFEDE7E299795C7C522D8D6848E1D7CEFFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D8962
        3DB19170B19170B19170B19170B19170B19170B19170B19170B19170B19170B1
        9170B19170B19170B19170CDB394F1DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE3DB
        D3C3B19FE9E2DBFEFEFEECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D845C38CCB2
        94FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFF0ECE897775A7C522EAA8E77F5F2EFECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D865E3ACFB597FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522D99795CEEE8E2ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D8F6845C8AC8EC8AC8EC8AC8EC8AC8EC8AC8E
        C8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EC8AC8EE2CCAFF9E6
        CCFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D926C
        49D4BC9ED4BC9ED4BC9ED4BC9ED4BC9ED6BDA0E3CCB0F6E3C9FAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7D532E8E6945DDC6AAFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7E542FD4BA9DFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D855D39A17E5CA17E5CA17E5CA17E5CA17E5C
        A3815FC2A586F2DEC3FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D9B77
        55FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CE9C78557C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFDED3CA7C522D7C522D9B7755FAE8CEFAE8CEFAE8CEFAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE9C78557C522D7C522DDED4CAFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFDED3CA7C522D7C522D865E
        3AA58361A58361A58361A58361A58361A58361A58361A58361A58361A58361A5
        8361A58361A58361A58361A58361A58361A58361A58361A58361A58361A58361
        A58361865E3A7C522D7C522DDED4CAFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFE0D5CC7E54307C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430E0D6CDFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFEBE5DF9472547C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D957354EBE5DFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF5F2EFDCD1C7D7CABED7CABED7CABED7CABED7CABED7CABE
        D7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CABED7CA
        BED7CABED7CABED7CABED7CABED7CABED7CABED7CABEDDD1C7F6F3F0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFDF9F7F6F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9
        F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F5F9F7F6
        FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DAD39470537C522E7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522F927151E4DBD3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2AE
        9D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522DC2AF9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522D7F5631815934815934
        8159348159348159348159348159348159348159348159348159348159348159
        348159348159348159347F56317C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEFAE8CEFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CEF0DCC1D4BA9CEAD4B9FAE8CEFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEA3805F7C52
        2D8D6643F8E5CBFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1ECE6E199785A
        7C522D8E6A4BE2D9D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE88613E7C522D7C522DEFDBC1FAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A
        4B7C522D97775AEDE7E1ECE6E199785A7C522D8E6A4BE2D9D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE2D9D18E6A4B7C522D97775AEDE7E1EDE7E29A795D
        7C522D8D6848E1D7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D7CF8E69
        4A7C522D99785CEDE8E2F2EDE9A285697C522D845D3ACFBFB1FFFFFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A38F7C522D7C522DC2A586FAE8CEFAE8CE
        FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CE87603C7C52
        2D7C522DEEDABFFAE8CEC2A5867C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFECFBFB2845D3C7C522DA3856BF2EEEAFAF8F6B39985
        7C522D7C522E9B7B60DACEC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A3
        8F7C522D7C522DC2A586FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFA
        E8CEFAE8CEFAE8CEFAE8CE87603C7C522D7C522DEEDABFFAE8CEC2A5867C522D
        7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDACDC39B7B5E7C52
        2E7C522DB39B85FAF8F7FFFFFFDFD5CC8F6B4B7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D906C4BDED4CBFFFFFFFFFFFFFDFCFB
        CBBBAC8862407C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D8862
        40CCBBADFDFCFCFFFFFFFFFFFFFFFFFFFCFBFAD9CEC2AA8E768D68487C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D8D6848A88E76D9CEC3FCFBFAFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnGravarClick
    end
    object btnCancelar: TSpeedButton
      Left = 101
      Top = 4
      Width = 80
      Height = 70
      Caption = 'Esc | Sair'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000BB010000BB0100000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF3F0ECDED3CABFAA99A88C73977558845D3B845B39
        916C4E9F7F63C2AF9DE0D5CCF1ECE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EFECD0C1B4A68970875F
        3D7D532E7C522D7C522D7C522D7C522D7C522D7C522D7C532E855E3AA08167D3
        C5B9F7F5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE4AB8E78845D3C7C522D7C522D7C522D7C522F845D3C906D4E8F6C4C
        855E3A7C522E7C522D7C522D7C522D86613EAB9078EEE8E3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFBFADFD5CC8C66467C522D7C522D86613EA285
        6BC8B7A8F3F0EDFFFFFFFFFFFFFFFFFFFFFFFFF1ECE8C6B3A39F7F64845D3C7C
        522D7C522D8C6647E2D8CFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDDBD0C58F
        6C4C7C522D7C522D99795CD3C5B9F7F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF4F0EDCFC0B29572547D532E7C522D937051DED4CBFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEE9E39E7F637C522F7D532EA4876CE6DFD7FFFFFFF1EC
        E8ECE5E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E3DDF1EDEAFEFEFEE2
        D9D19E7F637C522E7E532F9D7F63EDE8E2FFFFFFFFFFFFFFFFFFFFFFFFFBFAF8
        EEE9E4E9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3
        DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCE9E3DCEAE3DDA88B727C522D7C
        522DAB9078F6F3F0FEFDFDCBBAAB855F3C7C522DBAA38FF6F3F0FFFFFFFFFFFF
        F3F0EDB299837C522D896342CFC0B4FEFEFEF1ECE8A5876D7C522D7C522DA98C
        75FEFEFEFFFFFFFFFFFFFEFDFDD5C7BB9C7B5F93705093705093705093705093
        7050937050937050937050937050937050937050937050937050937050937050
        937050937050916E507E532E7C522D916C4EEEE9E4FDFCFCD4C6BA865F3D7C52
        2D7C522D825B39BAA491F6F3F0F4F0EDB49C878259357C522D7C522D896342D8
        CCC2FEFEFEE9E2DC8965437C522D7F5734E4DBD4FFFFFFFFFFFFF6F4F1AC907A
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F5430CB
        BAABFEFDFDD4C7BB8E6A4A7C522D7C522D7C522D7C522D825B39BAA490B19983
        8259357C522D7C522D7C522D7C522D906E4FD9CDC2FEFEFDC2AE9C7C522E7C52
        2DAD927AFEFDFDFFFFFFF4F0EDA68B727C522D8059349575579C7B5F9C7B5F9C
        7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F9C7B5F
        9C7B5F8F6C4C7D542F7C522DA18368F1EDE9E6DED78D68487C522D7F5631AE8E
        6DC1A385845B377C522D7C522D7C522D7C522D865E3AC5A98BA987667E55307C
        522D957254EBE4DEEEE8E49B7B5E7C522D916E4EE7DFD9FFFFFFF4F0EDA68B72
        7C522D906E4FE7DFD8FDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFC
        FBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBFDFCFBC9B8A98159377E5532BEA997FD
        FCFCE3DBD38761407C522D825934BA9C7CF3DFC5C0A283875F3B7C522D7C522D
        8A623EC6AA8CF2DEC4B394738057327C522D8E6A4BE8E0DAFBF9F8B7A08C7E53
        2E845D3ACFBFB1FFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFDBFAA977C522F896342D6CABEFFFFFFF8F6F4BAA4918259357C522D855D
        39C3A788F4E0C6C0A485845C3887603BC7AC8DF5E2C8BB9D7D845B377C522D82
        5B39C1AD9BFAF8F6FFFFFFCEBFB1855D3A7C522FBDA895FFFEFEF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F4AF967F7C522D8F6B4CE4DCD4FF
        FFFFFFFFFFFCFBFBC2AF9E8058347C522D7C532EC4A789F6E3C9EDD8BEF0DCC1
        F5E1C7BC9F7E7C522D7C522D825B37C9B7A7FDFDFDFFFFFFFFFFFFDDD2C88C66
        477C522DB29983F9F7F5F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F2EEEBA5886D7C522D926E50EBE5DFFFFFFFFFFFFFFFFFFFFCFCFBB69E897D54
        2F7C522D8D6744DEC7AAFAE8CEFAE8CED9C0A38B64407C522D7F5634BBA592FD
        FDFCFFFFFFFFFFFFFFFFFFE5DCD58F6B4B7C522DAB9078F6F3F1F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EEEBA4886E7C522D926E50E9E2DCFF
        FFFFFFFFFFFFFFFFFEFEFEAD937B7C522F7C522D8E6844E0C9ADFAE8CEFAE8CE
        DAC2A68C65417C522D7D5530B69D88FFFFFFFFFFFFFFFFFFFFFFFFE3DAD38E6A
        4B7C522DAC927AF6F3F1F4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F5F4AE947C7C522D8D6847DFD5CCFFFFFFFFFFFFF3F0EDB199837C522D7C52
        2D865E3AD0B799F3DFC4DCC4A8E0C8ACF3E0C5CAAF90845B377C522D7C522DBA
        A38EF6F3F0FFFFFFFFFFFFDACEC38963427C522DB49E88FBF9F9F4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFBB9A3907C522E835D39CFC0B2FF
        FFFFF6F3F0B79F8C8259357C522D8A623EC6AB8CF2DEC4BC9F7F875F3B89623E
        C2A687F3DFC5C0A283875F3B7C522D835B39BDA895F7F5F3FFFEFEC8B6A78259
        357E5430C0AC9AFEFDFDF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCFC0B2845D3A7C522FB49E88FAF8F7E2D9D0865F3D7C522D845C38C2A5
        87F5E3C8BB9D7D845B377C522D7C522D855D39C3A788F4E0C6BB9D7D8159347C
        522D8C6647E6DED7F8F6F3B096807D532E876141D6C9BDFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E29472557C522D8E6A4BE4
        DBD3ECE6E099785A7C522F7D532EA2805EB192717C522D7C522D825B38805834
        7C522D7C532EB697779D7A587C522E7E532E9F7F64EFE9E4DFD5CC8864427C52
        2D99795CF2EEEBFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFDFCB8A18C7C522D7C522DB49C87FDFCFCD8CCC1906E4F7C522D7C53
        2E7C522D7C522D865F3DBFAB99B8A28E825B387C522D7C522D7C532E7C522D95
        7354DDD2C8FCFBFBAB90797C522D7C522DC1AD9CFEFEFEFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0ECE7835B387C522D82
        5B39DCD1C7FCFCFBDDD2C9825B397C522D7C522D825B39BFAA98F8F6F3F6F3F0
        B8A28E8259357C522D7C522D875F3DE2D8D0FEFDFDD4C5B98057337C522D865F
        3DF4F0EDFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4B1A08159377C522D8D6847D9CCC1FBFAF9DCD1C79777
        5A8F6C4CC9B8A8FDFDFDFFFFFFFFFFFFFCFBFBC2AF9E8F6C4B9B7B5EE1D8D1FF
        FFFFE4DCD48F6C4C7C522D845B38CBBAACFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F0EDAE957E7F
        56327C532E906C4CCAB9ABFAF9F8ECE6E1E6DED6FEFEFDFFFFFFFFFFFFFFFFFF
        FFFFFFFEFDFCE4DBD4EEE8E4FEFDFDFFFFFFD9CCC28A63427F5633B39B86F5F2
        F0FFFFFFFFFFFFFFFFFFF4F0EDA68B727C522D926E50E9E1DBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEDE7E2A184687C522D7C522D865F3DAF967FE9E2
        DCFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6F3F1C9B7A8C4B1A0F1EDE9FFFFFFFFFFFFFFFFFFFFFFFFF4F0EDA68B72
        7C522D926E50E9E1DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FAF9AF967F835D397C522D7C522D7E5532987759C2AF9DD6C9BDDFD5CCEEE9E4
        FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF7F5F2AE947C7C522D947255F0EBE6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F2C9B8A99B7A5E7C522D7C52
        2D7C522D7C522D7C522D805733A1836AE7DFD9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD9CDC2
        9F7F64C9B8A8FDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFCFCEEE8E3C0AC9A9472557F54307C522D7C522D7C522D886442
        D7CBC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEFEBE6CFC0B3C2AE9DB59F8AD2C3B7F9F8F6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD
        F6F2EFF1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1ECE8F1EC
        E8F1ECE8F1ECE8F1EDE9F7F5F3FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAF9F8CBBBACCEBEB0F7F5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEDED4CAAB9078A08167A08167A08167A08167A0
        8167A08167A08167A08167A08167A08167A08167A08167A28468B09880ECE6E1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD3CA7D532E815937D9CEC3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F2B0967F
        7C522E7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522FC6B3A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCBBBAD7C522D7C522DCCBDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF9F8F6B9A38F7F57337C522D7C522D805732926D4A93
        6D4A936D4A936D4A936D4A936D4A936D4A936D4A8D67437C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE7E2
        A78C747C522D7C522D835B36C9AE90E8D3B7E8D3B8E8D3B8E8D3B8E8D3B8E8D3
        B8E8D3B8CFB5977C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EDE99B7A5E7C522D7C522D95704DDC
        C4A7FAE8CEFAE8CEFAE8CEFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF0ECE7A88C728057337C522D8E6844D5BB9EFAE8CEFAE8CEFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE5DFA68A717C522D7C
        522D8E6845DEC6A9FAE7CDFAE8CEFAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEFEAE699785A7C522D7C522D977250DEC7AAFAE8CEFAE8
        CEFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBE6A6
        896E7E55327C522D8F6A46D7BEA1FAE8CEFAE8CEDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE4DEA4876D7C522D7C522D906A47DFC8
        ACFAE8CEDCC5A87C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEFEAE59674587C522D7C522D997452E0C9ADDCC5A87C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9E5A2856B7E55327C52
        2D926C49BC9F7F7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE8E1DBA2856B7C522D7C522D865E3A7C522D7C522DB9A38F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAB7C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE8E39372
        547C522D7C522D7C522D7C522DB9A38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCABAAB7C522D7C522DCBBBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E2A283687E54307C522D7C522D896341
        9676589676589676589676589676589676589676589676589676589676589676
        589676589676589676589676589676589676588C67467C522D7C522DCBBBACFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE8E1DAA081677C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C
        522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D
        7C522D7C522D7C522D7C522ED2C4B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6E19774587C522E7C522D
        7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7C52
        2D7C522D7C522D7C522D7C522D7C522D7C522D7C522D7F54309E7F63EBE5DFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentFont = False
      OnClick = btnCancelarClick
    end
  end
  object dsClientes: TDataSource
    DataSet = Dados.qryPessoas
    OnDataChange = dsClientesDataChange
    Left = 240
    Top = 184
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
    Left = 672
    Top = 288
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 720
    Top = 312
  end
  object dsCidade: TDataSource
    DataSet = Dados.qryCidade
    Left = 304
    Top = 160
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsRepublicaVirtual
    ChaveAcesso = '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.'
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 168
    Top = 136
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 248
    Top = 136
  end
  object dsContatos: TDataSource
    DataSet = qryContatos
    OnDataChange = dsClientesDataChange
    Left = 240
    Top = 240
  end
  object qryContatos: TFDQuery
    BeforeInsert = qryContatosBeforeInsert
    AfterEdit = qryContatosAfterEdit
    BeforePost = qryContatosBeforePost
    AfterPost = qryContatosAfterPost
    OnNewRecord = qryContatosNewRecord
    MasterSource = dsClientes
    MasterFields = 'CODIGO'
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from pessoa_contato'
      'where'
      'fk_pessoa=:codigo'
      'order by data_hora DESC ,codigo')
    Left = 312
    Top = 240
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryContatosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContatosFK_PESSOA: TIntegerField
      FieldName = 'FK_PESSOA'
      Origin = 'FK_PESSOA'
    end
    object qryContatosDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
    end
    object qryContatosDATA_RETORNO: TDateField
      FieldName = 'DATA_RETORNO'
      Origin = 'DATA_RETORNO'
      EditMask = '!99/99/0000;1;_'
    end
    object qryContatosTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
      Size = 200
    end
    object qryContatosMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      BlobType = ftMemo
    end
    object qryContatosFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryContatosFK_EMPRESA: TIntegerField
      FieldName = 'FK_EMPRESA'
      Origin = 'FK_EMPRESA'
    end
    object qryContatosVIRTUAL_PESSOA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PESSOA'
      LookupDataSet = qryPessoa
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'FK_PESSOA'
      Size = 200
      Lookup = True
    end
  end
  object qryPessoa: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'Select codigo, razao, fantasia, cnpj from pessoa'
      'order by codigo')
    Left = 312
    Top = 304
    object qryPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPessoaRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Size = 100
    end
    object qryPessoaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryPessoaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
  end
end
