object frameCadastro: TframeCadastro
  Left = 0
  Top = 0
  Width = 932
  Height = 106
  Align = alClient
  TabOrder = 0
  object btnIInserir: TDBSpeedButton
    Left = 13
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Inserir Novo Registro'
    Caption = '&Inserir'
    ImageIndex = 4
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbCustom
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = []
    RuntimeEnabled = True
  end
  object btnEditar: TDBSpeedButton
    Left = 106
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Alterar Registro'
    Caption = '&Editar'
    ImageIndex = 147
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbCustom
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = []
    RuntimeEnabled = True
  end
  object btnGravar: TDBSpeedButton
    Left = 199
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Gravar Registro'
    Caption = '&Gravar'
    ImageIndex = 143
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbCustom
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = []
    RuntimeEnabled = True
  end
  object btnDeletar: TDBSpeedButton
    Left = 291
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Apagar Registro'
    Caption = '&Deletar'
    ImageIndex = 145
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbCustom
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = []
    RuntimeEnabled = True
  end
  object btnPrimeiro: TDBSpeedButton
    Left = 383
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Primeiro Registro'
    Caption = '&Primeiro'
    ImageIndex = 149
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbFirst
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = [drBOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object btnAnterior: TDBSpeedButton
    Left = 475
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Registro Anterior'
    Caption = '&Anterior'
    ImageIndex = 154
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbPrior
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = [drBOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object btnProximo: TDBSpeedButton
    Left = 567
    Top = 24
    Width = 90
    Height = 70
    Hint = 'Pr'#243'ximo Registro'
    Caption = 'P&r'#243'ximo'
    ImageIndex = 152
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbNext
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = [drEOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object btnUltimo: TDBSpeedButton
    Left = 659
    Top = 24
    Width = 90
    Height = 70
    Hint = #218'ltimo Registro'
    Caption = '&'#218'ltimo'
    ImageIndex = 151
    Images = frmPrincipal.iButtonsCadastro
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    DataButtonType = nbLast
    Language = blPortugues
    DataSource = dsCadastro
    DisableReasons = [drEOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object Panel1: TPanel
    Left = 832
    Top = 0
    Width = 100
    Height = 106
    Align = alRight
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 6
      Top = 13
      Width = 90
      Height = 70
      Caption = '&Sair'
      ImageIndex = 62
      Images = frmPrincipal.iButtonsCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dsCadastro: TDataSource
    Left = 728
    Top = 8
  end
  object Acoes: TActionList
    Left = 856
    Top = 78
    object Action1: TAction
      Category = 'CRUD'
      Caption = 'Fechar'
      Hint = 'Fechar a tela atual.'
      ImageIndex = 44
      ShortCut = 27
    end
    object Ac_Incluir: TAction
      Category = 'CRUD'
      Caption = 'Incluir'
      Hint = 'Incluir um registro.'
      ImageIndex = 20
      ShortCut = 113
      OnExecute = Ac_IncluirExecute
    end
    object Action2: TAction
      Category = 'CRUD'
      Caption = 'Cancelar'
      Hint = 'Cancelar edi'#231#227'o ou inclus'#227'o de registro.'
      ImageIndex = 9
      ShortCut = 114
    end
    object Ac_Editar: TAction
      Category = 'CRUD'
      Caption = 'Editar'
      Hint = 'Modificar um registro.'
      ImageIndex = 12
      ShortCut = 115
    end
    object Ac_Visualizar: TAction
      Category = 'CRUD'
      Caption = 'Visualizar'
      Hint = 'Visualizar o registro em detalhes.'
      ImageIndex = 1
      ShortCut = 116
    end
    object Ac_Imprimir: TAction
      Category = 'CRUD'
      Caption = 'Imprimir'
      Hint = 'Imprimir um ou mais registros.'
      ImageIndex = 21
      ShortCut = 117
    end
    object Ac_Excluir: TAction
      Category = 'CRUD'
      Caption = 'Excluir'
      Hint = 'Excluir um registro.'
      ImageIndex = 42
      ShortCut = 118
    end
    object Ac_Salvar: TAction
      Category = 'CRUD'
      Caption = 'Salvar'
      Hint = 'Gravar o registro atual no banco de dados.'
      ImageIndex = 5
      ShortCut = 119
    end
    object Ac_Anterior: TAction
      Category = 'Navega'#231#227'o'
      Caption = 'Anterior'
      Hint = 'Registro anterior.'
      ImageIndex = 39
    end
    object Action3: TAction
      Category = 'Navega'#231#227'o'
      Caption = 'Primeiro'
      Hint = 'Primeiro registro.'
      ImageIndex = 45
    end
    object Action4: TAction
      Category = 'Navega'#231#227'o'
      Caption = 'Pr'#243'ximo'
      Hint = 'Pr'#243'ximo registro'
      ImageIndex = 40
    end
    object Action5: TAction
      Category = 'Navega'#231#227'o'
      Caption = #218'ltimo'
      Hint = #218'ltimo registro.'
      ImageIndex = 46
    end
  end
end
