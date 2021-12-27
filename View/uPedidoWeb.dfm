object FrmPedidoWeb: TFrmPedidoWeb
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos Web'
  ClientHeight = 344
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 290
    Width = 627
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnSalvar: TButton
      Left = 133
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Baixar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnAtualizar: TButton
      Left = 14
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Atualizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAtualizarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 627
    Height = 290
    Align = alClient
    DataSource = dsOrc
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data do Pedido'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razao'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 124
        Visible = True
      end>
  end
  object dsOrc: TDataSource
    Left = 288
    Top = 176
  end
  object qryBuscaCliente: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from pessoa'
      'where'
      'gid=:gid')
    Left = 344
    Top = 176
    ParamData = <
      item
        Name = 'GID'
        ParamType = ptInput
        Value = Null
      end>
    object qryBuscaClienteEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryBuscaClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryBuscaClienteTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object qryBuscaClienteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryBuscaClienteIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object qryBuscaClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryBuscaClienteRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 100
    end
    object qryBuscaClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryBuscaClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryBuscaClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryBuscaClienteCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
      Required = True
      DisplayFormat = ',0.00'
    end
    object qryBuscaClienteMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryBuscaClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryBuscaClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryBuscaClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryBuscaClienteFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryBuscaClienteFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryBuscaClienteCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryBuscaClienteCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Origin = 'CELULAR2'
      Size = 14
    end
    object qryBuscaClienteEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      Size = 60
    end
    object qryBuscaClienteEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Origin = 'EMAIL2'
      Size = 60
    end
    object qryBuscaClienteFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryBuscaClienteSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 10
    end
    object qryBuscaClienteDT_NASC: TDateField
      FieldName = 'DT_NASC'
      Origin = 'DT_NASC'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryBuscaClienteECIVIL: TStringField
      FieldName = 'ECIVIL'
      Origin = 'ECIVIL'
      Size = 10
    end
    object qryBuscaClienteLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Origin = 'LIMITE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryBuscaClienteDIA_PGTO: TSmallintField
      FieldName = 'DIA_PGTO'
      Origin = 'DIA_PGTO'
      DisplayFormat = ',0.00'
    end
    object qryBuscaClienteOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object qryBuscaClienteNUM_USU: TSmallintField
      FieldName = 'NUM_USU'
      Origin = 'NUM_USU'
      DisplayFormat = ',0.00'
    end
    object qryBuscaClienteFATURA: TStringField
      FieldName = 'FATURA'
      Origin = 'FATURA'
      Size = 1
    end
    object qryBuscaClienteCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CHEQUE'
      Size = 1
    end
    object qryBuscaClienteCCF: TStringField
      FieldName = 'CCF'
      Origin = 'CCF'
      Size = 1
    end
    object qryBuscaClienteSPC: TStringField
      FieldName = 'SPC'
      Origin = 'SPC'
      Size = 1
    end
    object qryBuscaClienteISENTO: TStringField
      FieldName = 'ISENTO'
      Origin = 'ISENTO'
      Size = 1
    end
    object qryBuscaClienteFORN: TStringField
      FieldName = 'FORN'
      Origin = 'FORN'
      Required = True
      Size = 1
    end
    object qryBuscaClienteFUN: TStringField
      FieldName = 'FUN'
      Origin = 'FUN'
      Required = True
      Size = 1
    end
    object qryBuscaClienteCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
    object qryBuscaClienteFAB: TStringField
      FieldName = 'FAB'
      Origin = 'FAB'
      Required = True
      Size = 1
    end
    object qryBuscaClienteTRAN: TStringField
      FieldName = 'TRAN'
      Origin = 'TRAN'
      Required = True
      Size = 1
    end
    object qryBuscaClienteADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Required = True
      Size = 1
    end
    object qryBuscaClienteATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryBuscaClienteDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      Origin = 'DT_ADMISSAO'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryBuscaClienteDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      Origin = 'DT_DEMISSAO'
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryBuscaClienteSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryBuscaClientePAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 50
    end
    object qryBuscaClienteMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 50
    end
    object qryBuscaClienteBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Size = 30
    end
    object qryBuscaClienteAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryBuscaClienteGERENTE: TStringField
      FieldName = 'GERENTE'
      Origin = 'GERENTE'
      Size = 30
    end
    object qryBuscaClienteFONE_GERENTE: TStringField
      FieldName = 'FONE_GERENTE'
      Origin = 'FONE_GERENTE'
      Size = 15
    end
    object qryBuscaClientePROPRIEDADE: TStringField
      FieldName = 'PROPRIEDADE'
      Origin = 'PROPRIEDADE'
      Size = 50
    end
    object qryBuscaClienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
      DisplayFormat = '!99/99/0000;1;_'
    end
    object qryBuscaClienteTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
      Size = 1
    end
    object qryBuscaClienteATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Origin = 'ATENDENTE'
      Size = 1
    end
    object qryBuscaClienteCODIGO_WEB: TIntegerField
      FieldName = 'CODIGO_WEB'
      Origin = 'CODIGO_WEB'
      DisplayFormat = ',0.00'
    end
  end
  object cdsPessoas: TFDQuery
    SQL.Strings = (
      'select * from pessoa'
      'where'
      '(gid is null)'
      'order by razao')
    Left = 432
    Top = 176
    object cdsPessoascodigo: TFDAutoIncField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPessoastipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 10
    end
    object cdsPessoascnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
    end
    object cdsPessoasie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      Required = True
    end
    object cdsPessoasfantasia: TStringField
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Required = True
      Size = 50
    end
    object cdsPessoasrazao: TStringField
      FieldName = 'razao'
      Origin = 'razao'
      Required = True
      Size = 100
    end
    object cdsPessoasendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 50
    end
    object cdsPessoasnumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 10
    end
    object cdsPessoascomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Required = True
      Size = 50
    end
    object cdsPessoascodmun: TIntegerField
      FieldName = 'codmun'
      Origin = 'codmun'
      Required = True
    end
    object cdsPessoasmunicipio: TStringField
      FieldName = 'municipio'
      Origin = 'municipio'
      Required = True
      Size = 35
    end
    object cdsPessoasbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 35
    end
    object cdsPessoasuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 2
    end
    object cdsPessoascep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
      Size = 8
    end
    object cdsPessoascelular1: TStringField
      FieldName = 'celular1'
      Origin = 'celular1'
      Required = True
      Size = 14
    end
    object cdsPessoascelular2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular2'
      Origin = 'celular2'
      Size = 14
    end
    object cdsPessoasisento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'isento'
      Origin = 'isento'
      Size = 1
    end
    object cdsPessoascodigolocal: TIntegerField
      FieldName = 'codigolocal'
      Origin = 'codigolocal'
      Required = True
    end
  end
  object qryOrcamento: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from Orcamento'
      'where'
      'gid=:gid')
    Left = 64
    Top = 56
    ParamData = <
      item
        Name = 'GID'
        ParamType = ptInput
      end>
  end
end
