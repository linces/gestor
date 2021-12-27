object dtmCBR: TdtmCBR
  OldCreateOrder = False
  Height = 915
  Width = 978
  object OpenDialog: TOpenDialog
    Left = 31
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 31
    Top = 81
  end
  object tabCBR_TITULOS: TFDQuery
    BeforeOpen = tabCBR_TITULOSBeforeOpen
    AfterOpen = tabCBR_TITULOSAfterOpen
    AfterClose = tabCBR_TITULOSAfterOpen
    OnCalcFields = tabCBR_TITULOSCalcFields
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      '  CRECEBER.*'
      'FROM'
      '  CRECEBER'
      'WHERE '
      '  1=1'
      '  AND CRECEBER.FKEMPRESA = :FKEMPRESA'
      '  AND CRECEBER.CODIGO = :CODIGO')
    Left = 157
    Top = 16
    ParamData = <
      item
        Name = 'FKEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object tabCBR_TITULOSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_TITULOSDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object tabCBR_TITULOSFKCLIENTE: TIntegerField
      FieldName = 'FKCLIENTE'
      Origin = 'FKCLIENTE'
    end
    object tabCBR_TITULOSDOC: TStringField
      FieldName = 'DOC'
      Origin = 'DOC'
      Size = 15
    end
    object tabCBR_TITULOSVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object tabCBR_TITULOSDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object tabCBR_TITULOSHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object tabCBR_TITULOSDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Origin = 'DATA_RECEBIMENTO'
    end
    object tabCBR_TITULOSDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object tabCBR_TITULOSJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Precision = 18
      Size = 2
    end
    object tabCBR_TITULOSVL_RESTANTE: TFMTBCDField
      FieldName = 'VL_RESTANTE'
      Origin = 'VL_RESTANTE'
      Precision = 18
      Size = 2
    end
    object tabCBR_TITULOSSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 10
    end
    object tabCBR_TITULOSFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object tabCBR_TITULOSFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object tabCBR_TITULOSVRECEBIDO: TCurrencyField
      FieldName = 'VRECEBIDO'
      Origin = 'VRECEBIDO'
    end
    object tabCBR_TITULOSFKCONTA: TIntegerField
      FieldName = 'FKCONTA'
      Origin = 'FKCONTA'
    end
    object tabCBR_TITULOSTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 10
    end
    object tabCBR_TITULOSNBOLETO: TIntegerField
      FieldName = 'NBOLETO'
      Origin = 'NBOLETO'
    end
    object tabCBR_TITULOSID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Origin = 'ID_VENDEDOR'
    end
    object tabCBR_TITULOSFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object tabCBR_TITULOSFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
    end
    object tabCBR_TITULOSBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      Size = 1
    end
    object tabCBR_TITULOSFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object tabCBR_TITULOSCARTAO: TStringField
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 1
    end
    object tabCBR_TITULOSFPG_VENDA: TIntegerField
      FieldName = 'FPG_VENDA'
      Origin = 'FPG_VENDA'
    end
    object tabCBR_TITULOSREMESSA: TStringField
      FieldName = 'REMESSA'
      Origin = 'REMESSA'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSREMESSA_REENVIAR: TStringField
      FieldName = 'REMESSA_REENVIAR'
      Origin = 'REMESSA_REENVIAR'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSREMESSA_DATA: TDateField
      FieldName = 'REMESSA_DATA'
      Origin = 'REMESSA_DATA'
    end
    object tabCBR_TITULOSREMESSA_ARQUIVO: TStringField
      FieldName = 'REMESSA_ARQUIVO'
      Origin = 'REMESSA_ARQUIVO'
      Size = 200
    end
    object tabCBR_TITULOSREGISTRO_ID_CBR_RETORNO: TLargeintField
      FieldName = 'REGISTRO_ID_CBR_RETORNO'
      Origin = 'REGISTRO_ID_CBR_RETORNO'
    end
    object tabCBR_TITULOSREGISTRO_STATUS: TStringField
      FieldName = 'REGISTRO_STATUS'
      Origin = 'REGISTRO_STATUS'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSREGISTRO_DATA: TSQLTimeStampField
      FieldName = 'REGISTRO_DATA'
      Origin = 'REGISTRO_DATA'
    end
    object tabCBR_TITULOSREGISTRO_ARQUIVO: TStringField
      FieldName = 'REGISTRO_ARQUIVO'
      Origin = 'REGISTRO_ARQUIVO'
      Size = 200
    end
    object tabCBR_TITULOSRETORNO_ID_CBR_RETORNO: TIntegerField
      FieldName = 'RETORNO_ID_CBR_RETORNO'
      Origin = 'RETORNO_ID_CBR_RETORNO'
    end
    object tabCBR_TITULOSREGISTRO_HISTORICO: TStringField
      FieldName = 'REGISTRO_HISTORICO'
      Origin = 'REGISTRO_HISTORICO'
      Size = 200
    end
    object tabCBR_TITULOSREGISTRO_SEM_REGISTRO: TStringField
      FieldName = 'REGISTRO_SEM_REGISTRO'
      Origin = 'REGISTRO_SEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSREGISTRO_LIMITE_PRAZO: TStringField
      FieldName = 'REGISTRO_LIMITE_PRAZO'
      Origin = 'REGISTRO_LIMITE_PRAZO'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSRETORNO_HISTORICO: TStringField
      FieldName = 'RETORNO_HISTORICO'
      Origin = 'RETORNO_HISTORICO'
      Size = 300
    end
    object tabCBR_TITULOSOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 300
    end
    object tabCBR_TITULOSID_CBR_REMESSA_UUID: TStringField
      FieldName = 'ID_CBR_REMESSA_UUID'
      Origin = 'ID_CBR_REMESSA_UUID'
      Size = 44
    end
    object tabCBR_TITULOSRETORNO_SEM_REGISTRO: TStringField
      FieldName = 'RETORNO_SEM_REGISTRO'
      Origin = 'RETORNO_SEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOSRETORNO_LIMITE_PRAZO: TStringField
      FieldName = 'RETORNO_LIMITE_PRAZO'
      Origin = 'RETORNO_LIMITE_PRAZO'
      FixedChar = True
      Size = 1
    end
    object tabCBR_TITULOScalc_VlrTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'calc_VlrTotal'
      Calculated = True
    end
  end
  object qryPESSOAS: TFDQuery
    BeforeOpen = qryPESSOASBeforeOpen
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT '
      '  * '
      'FROM '
      '  PESSOA '
      'WHERE '
      '  1=1'
      '  AND EMPRESA = :ID_EMPRESA'
      '')
    Left = 293
    Top = 136
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPESSOASEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object qryPESSOASCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPESSOASTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 10
    end
    object qryPESSOASCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryPESSOASIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
    end
    object qryPESSOASFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryPESSOASRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 50
    end
    object qryPESSOASENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryPESSOASNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryPESSOASCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryPESSOASCODMUN: TIntegerField
      FieldName = 'CODMUN'
      Origin = 'CODMUN'
      Required = True
    end
    object qryPESSOASMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryPESSOASBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryPESSOASUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryPESSOASCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryPESSOASFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryPESSOASFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryPESSOASCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryPESSOASCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Origin = 'CELULAR2'
      Size = 14
    end
    object qryPESSOASEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      Size = 60
    end
    object qryPESSOASEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Origin = 'EMAIL2'
      Size = 60
    end
    object qryPESSOASFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryPESSOASSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 10
    end
    object qryPESSOASDT_NASC: TDateField
      FieldName = 'DT_NASC'
      Origin = 'DT_NASC'
    end
    object qryPESSOASECIVIL: TStringField
      FieldName = 'ECIVIL'
      Origin = 'ECIVIL'
      Size = 10
    end
    object qryPESSOASLIMITE: TFMTBCDField
      FieldName = 'LIMITE'
      Origin = 'LIMITE'
      Precision = 18
      Size = 2
    end
    object qryPESSOASDIA_PGTO: TSmallintField
      FieldName = 'DIA_PGTO'
      Origin = 'DIA_PGTO'
    end
    object qryPESSOASOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'OBS'
      BlobType = ftMemo
    end
    object qryPESSOASNUM_USU: TSmallintField
      FieldName = 'NUM_USU'
      Origin = 'NUM_USU'
    end
    object qryPESSOASFATURA: TStringField
      FieldName = 'FATURA'
      Origin = 'FATURA'
      Size = 1
    end
    object qryPESSOASCHEQUE: TStringField
      FieldName = 'CHEQUE'
      Origin = 'CHEQUE'
      Size = 1
    end
    object qryPESSOASCCF: TStringField
      FieldName = 'CCF'
      Origin = 'CCF'
      Size = 1
    end
    object qryPESSOASSPC: TStringField
      FieldName = 'SPC'
      Origin = 'SPC'
      Size = 1
    end
    object qryPESSOASISENTO: TStringField
      FieldName = 'ISENTO'
      Origin = 'ISENTO'
      Size = 1
    end
    object qryPESSOASFORN: TStringField
      FieldName = 'FORN'
      Origin = 'FORN'
      Required = True
      Size = 1
    end
    object qryPESSOASFUN: TStringField
      FieldName = 'FUN'
      Origin = 'FUN'
      Required = True
      Size = 1
    end
    object qryPESSOASCLI: TStringField
      FieldName = 'CLI'
      Origin = 'CLI'
      Required = True
      Size = 1
    end
    object qryPESSOASFAB: TStringField
      FieldName = 'FAB'
      Origin = 'FAB'
      Required = True
      Size = 1
    end
    object qryPESSOASTRAN: TStringField
      FieldName = 'TRAN'
      Origin = 'TRAN'
      Required = True
      Size = 1
    end
    object qryPESSOASADM: TStringField
      FieldName = 'ADM'
      Origin = 'ADM'
      Required = True
      Size = 1
    end
    object qryPESSOASATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryPESSOASDT_ADMISSAO: TDateField
      FieldName = 'DT_ADMISSAO'
      Origin = 'DT_ADMISSAO'
    end
    object qryPESSOASDT_DEMISSAO: TDateField
      FieldName = 'DT_DEMISSAO'
      Origin = 'DT_DEMISSAO'
    end
    object qryPESSOASSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
    object qryPESSOASPAI: TStringField
      FieldName = 'PAI'
      Origin = 'PAI'
      Size = 50
    end
    object qryPESSOASMAE: TStringField
      FieldName = 'MAE'
      Origin = 'MAE'
      Size = 50
    end
    object qryPESSOASBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'BANCO'
      Size = 30
    end
    object qryPESSOASAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryPESSOASGERENTE: TStringField
      FieldName = 'GERENTE'
      Origin = 'GERENTE'
      Size = 30
    end
    object qryPESSOASFONE_GERENTE: TStringField
      FieldName = 'FONE_GERENTE'
      Origin = 'FONE_GERENTE'
      Size = 15
    end
    object qryPESSOASPROPRIEDADE: TStringField
      FieldName = 'PROPRIEDADE'
      Origin = 'PROPRIEDADE'
      Size = 50
    end
    object qryPESSOASDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = 'DT_CADASTRO'
      Required = True
    end
    object qryPESSOASTECNICO: TStringField
      FieldName = 'TECNICO'
      Origin = 'TECNICO'
      Size = 1
    end
    object qryPESSOASATENDENTE: TStringField
      FieldName = 'ATENDENTE'
      Origin = 'ATENDENTE'
      Size = 1
    end
    object qryPESSOASCODIGO_WEB: TIntegerField
      FieldName = 'CODIGO_WEB'
      Origin = 'CODIGO_WEB'
    end
    object qryPESSOASREFERENCIA: TIntegerField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
    end
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 31
    Top = 146
  end
  object ACBrBoleto1: TACBrBoleto
    MAIL = ACBrMail1
    Banco.Numero = 1
    Banco.TamanhoMaximoNossoNum = 0
    Banco.TipoCobranca = cobBancoDoBrasil
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.Nome = 'VB SYSTEM AUTOMA'#199#195'O LTDA.'
    Cedente.CodigoCedente = '572814'
    Cedente.Agencia = '0097'
    Cedente.AgenciaDigito = '0'
    Cedente.Conta = '000000002359'
    Cedente.ContaDigito = '4'
    Cedente.CNPJCPF = '07.193.169/0001-54'
    Cedente.TipoInscricao = pJuridica
    Cedente.Logradouro = 'RUA PRESIDENTE OLEGARIO MACIEL, 111'
    Cedente.Complemento = 'SALA 510'
    Cedente.Bairro = 'CENTRO'
    Cedente.Cidade = 'ARAXA'
    Cedente.UF = 'MG'
    Cedente.CEP = '38183186'
    Cedente.Telefone = '34 3661.5131'
    DirArqRemessa = 'c:\temp'
    NumeroArquivo = 0
    LayoutRemessa = c240
    ACBrBoletoFC = ACBrBoletoFCFortes1
    Configuracoes.Arquivos.LogRegistro = False
    Configuracoes.WebService.SSLHttpLib = httpOpenSSL
    Configuracoes.WebService.StoreName = 'My'
    Configuracoes.WebService.Ambiente = taHomologacao
    Configuracoes.WebService.Operacao = tpInclui
    Configuracoes.WebService.VersaoDF = '1.2'
    Left = 31
    Top = 211
  end
  object qryCBR_CONFIG: TFDQuery
    BeforeOpen = qryCBR_CONFIGBeforeOpen
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      '  CBR_CONFIG.*,'
      '  EMPRESA.RAZAO                            AS EMP_RAZAOSOCIAL,'
      '  EMPRESA.CNPJ                             AS EMP_CNPJ,'
      '  EMPRESA.ENDERECO ||'#39', '#39'|| EMPRESA.NUMERO AS EMP_ENDERECO,'
      '  EMPRESA.COMPLEMENTO                      AS EMP_COMPLEMENTO,'
      '  EMPRESA.BAIRRO                           AS EMP_BAIRRO,'
      '  EMPRESA.CIDADE,'
      '  EMPRESA.UF                    AS EMP_UF,'
      '  EMPRESA.CEP                              AS EMP_CEP,'
      '  EMPRESA.FONE                         AS EMP_TELEFONE'
      'FROM'
      '  CBR_CONFIG'
      '    INNER JOIN EMPRESA ON CBR_CONFIG.ID_EMPRESA = EMPRESA.CODIGO'
      'WHERE'
      ' CBR_CONFIG.ID_EMPRESA = :ID_EMPRESA'
      ''
      '')
    Left = 293
    Top = 74
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCBR_CONFIGID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCBR_CONFIGDIRRECEBE: TStringField
      FieldName = 'DIRRECEBE'
      Origin = 'DIRRECEBE'
      Size = 300
    end
    object qryCBR_CONFIGDIRENVIA: TStringField
      FieldName = 'DIRENVIA'
      Origin = 'DIRENVIA'
      Size = 300
    end
    object qryCBR_CONFIGDIRRECEBEBKP: TStringField
      FieldName = 'DIRRECEBEBKP'
      Origin = 'DIRRECEBEBKP'
      Size = 300
    end
    object qryCBR_CONFIGVLRTARIFABOLETA: TFMTBCDField
      FieldName = 'VLRTARIFABOLETA'
      Origin = 'VLRTARIFABOLETA'
      Precision = 18
      Size = 2
    end
    object qryCBR_CONFIGTIPOCOBRANCA: TStringField
      FieldName = 'TIPOCOBRANCA'
      Origin = 'TIPOCOBRANCA'
      Size = 30
    end
    object qryCBR_CONFIGCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
      Origin = 'CODBANCO'
    end
    object qryCBR_CONFIGAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
    end
    object qryCBR_CONFIGCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object qryCBR_CONFIGCONTADIG: TStringField
      FieldName = 'CONTADIG'
      Origin = 'CONTADIG'
      FixedChar = True
      Size = 1
    end
    object qryCBR_CONFIGCODCEDENTE: TStringField
      FieldName = 'CODCEDENTE'
      Origin = 'CODCEDENTE'
    end
    object qryCBR_CONFIGCODCEDENTEDIG: TStringField
      FieldName = 'CODCEDENTEDIG'
      Origin = 'CODCEDENTEDIG'
      FixedChar = True
      Size = 1
    end
    object qryCBR_CONFIGCONVENIO: TStringField
      FieldName = 'CONVENIO'
      Origin = 'CONVENIO'
      Size = 15
    end
    object qryCBR_CONFIGCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 15
    end
    object qryCBR_CONFIGMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Origin = 'MODALIDADE'
      Size = 15
    end
    object qryCBR_CONFIGESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Origin = 'ESPECIEDOC'
      FixedChar = True
      Size = 3
    end
    object qryCBR_CONFIGCOBMOEDA: TStringField
      FieldName = 'COBMOEDA'
      Origin = 'COBMOEDA'
      Size = 10
    end
    object qryCBR_CONFIGCOBACEITE: TStringField
      FieldName = 'COBACEITE'
      Origin = 'COBACEITE'
      Size = 10
    end
    object qryCBR_CONFIGLOCALPAGTO: TStringField
      FieldName = 'LOCALPAGTO'
      Origin = 'LOCALPAGTO'
      Size = 100
    end
    object qryCBR_CONFIGINSTRUCAO1: TStringField
      FieldName = 'INSTRUCAO1'
      Origin = 'INSTRUCAO1'
      Size = 300
    end
    object qryCBR_CONFIGINSTRUCAO2: TStringField
      FieldName = 'INSTRUCAO2'
      Origin = 'INSTRUCAO2'
      Size = 300
    end
    object qryCBR_CONFIGEMP_RAZAOSOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_RAZAOSOCIAL'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_CONFIGEMP_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCBR_CONFIGEMP_ENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_ENDERECO'
      Origin = 'EMP_ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Size = 62
    end
    object qryCBR_CONFIGEMP_COMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryCBR_CONFIGEMP_BAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryCBR_CONFIGCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryCBR_CONFIGEMP_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object qryCBR_CONFIGEMP_CEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object qryCBR_CONFIGEMP_TELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMP_TELEFONE'
      Origin = 'FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryCBR_CONFIGCNAB: TStringField
      FieldName = 'CNAB'
      Origin = 'CNAB'
      Size = 10
    end
    object qryCBR_CONFIGAGENCIAD: TStringField
      FieldName = 'AGENCIAD'
      Origin = 'AGENCIAD'
      Size = 10
    end
  end
  object ACBrBoletoFCFortes1: TACBrBoletoFCFortes
    Left = 31
    Top = 277
  end
  object tabCBR_REMESSA: TFDQuery
    BeforeOpen = tabCBR_REMESSABeforeOpen
    AfterOpen = tabCBR_REMESSAAfterOpen
    AfterClose = tabCBR_REMESSAAfterOpen
    BeforePost = tabCBR_REMESSABeforePost
    OnNewRecord = tabCBR_REMESSANewRecord
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT'
      '  CBR_REMESSA.*'
      'FROM'
      '  CBR_REMESSA'
      'WHERE '
      '  1=1'
      '  AND CBR_REMESSA.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_REMESSA.ID_CBR_REMESSA = :ID_CBR_REMESSA')
    Left = 157
    Top = 81
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_REMESSA'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object tabCBR_REMESSAID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_REMESSAID_CBR_REMESSA: TLargeintField
      FieldName = 'ID_CBR_REMESSA'
      Origin = 'ID_CBR_REMESSA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_REMESSADATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object tabCBR_REMESSAIDBANCO: TSmallintField
      FieldName = 'IDBANCO'
      Origin = 'IDBANCO'
    end
    object tabCBR_REMESSAAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Size = 15
    end
    object tabCBR_REMESSAAGENCIA_DIGITO: TStringField
      FieldName = 'AGENCIA_DIGITO'
      Origin = 'AGENCIA_DIGITO'
      FixedChar = True
      Size = 3
    end
    object tabCBR_REMESSACONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
    end
    object tabCBR_REMESSACONTA_DIGITO: TStringField
      FieldName = 'CONTA_DIGITO'
      Origin = 'CONTA_DIGITO'
      FixedChar = True
      Size = 3
    end
    object tabCBR_REMESSACODIGO_CEDENTE: TStringField
      FieldName = 'CODIGO_CEDENTE'
      Origin = 'CODIGO_CEDENTE'
      Size = 10
    end
    object tabCBR_REMESSACONVENIO: TStringField
      FieldName = 'CONVENIO'
      Origin = 'CONVENIO'
      Size = 10
    end
    object tabCBR_REMESSAMODALIDADE: TStringField
      FieldName = 'MODALIDADE'
      Origin = 'MODALIDADE'
      FixedChar = True
      Size = 2
    end
    object tabCBR_REMESSALOCAL_DE_PAGAMENTO: TStringField
      FieldName = 'LOCAL_DE_PAGAMENTO'
      Origin = 'LOCAL_DE_PAGAMENTO'
      Size = 200
    end
    object tabCBR_REMESSAMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Origin = 'MENSAGEM'
      Size = 200
    end
    object tabCBR_REMESSAINSTRUCAO1: TStringField
      FieldName = 'INSTRUCAO1'
      Origin = 'INSTRUCAO1'
      Size = 200
    end
    object tabCBR_REMESSAINSTRUCAO2: TStringField
      FieldName = 'INSTRUCAO2'
      Origin = 'INSTRUCAO2'
      Size = 200
    end
    object tabCBR_REMESSAPERCENTUAL_JUROS: TFMTBCDField
      FieldName = 'PERCENTUAL_JUROS'
      Origin = 'PERCENTUAL_JUROS'
      Precision = 18
      Size = 2
    end
    object tabCBR_REMESSAPERCENTUAL_MULTA: TFMTBCDField
      FieldName = 'PERCENTUAL_MULTA'
      Origin = 'PERCENTUAL_MULTA'
      Precision = 18
      Size = 2
    end
    object tabCBR_REMESSACARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
      Size = 10
    end
    object tabCBR_REMESSADATA_GERACAO: TSQLTimeStampField
      FieldName = 'DATA_GERACAO'
      Origin = 'DATA_GERACAO'
    end
    object tabCBR_REMESSAARQUIVO: TMemoField
      FieldName = 'ARQUIVO'
      Origin = 'ARQUIVO'
      BlobType = ftMemo
    end
    object tabCBR_REMESSALOCAL_ARQUIVO: TStringField
      FieldName = 'LOCAL_ARQUIVO'
      Origin = 'LOCAL_ARQUIVO'
      Size = 200
    end
    object tabCBR_REMESSADATA_PROC_BANCO: TSQLTimeStampField
      FieldName = 'DATA_PROC_BANCO'
      Origin = 'DATA_PROC_BANCO'
    end
    object tabCBR_REMESSAID_CBR_REMESSA_UUID: TStringField
      FieldName = 'ID_CBR_REMESSA_UUID'
      Origin = 'ID_CBR_REMESSA_UUID'
      Required = True
      Size = 44
    end
    object tabCBR_REMESSACANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      FixedChar = True
      Size = 1
    end
  end
  object tabCBR_REMESSA_TITULOS: TFDQuery
    IndexFieldNames = 'ID_EMPRESA;ID_CBR_REMESSA'
    MasterSource = dtstabCBR_REMESSA
    MasterFields = 'ID_EMPRESA;ID_CBR_REMESSA'
    DetailFields = 'ID_EMPRESA;ID_CBR_REMESSA'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT'
      '  CBR_REMESSA_TITULOS.*'
      'FROM'
      '  CBR_REMESSA_TITULOS'
      'WHERE '
      '  1=1'
      '  AND CBR_REMESSA_TITULOS.ID_EMPRESA = :ID_EMPRESA'
      '  AND CBR_REMESSA_TITULOS.ID_CBR_REMESSA = :ID_CBR_REMESSA'
      '  AND CBR_REMESSA_TITULOS.ID_CBR_TITULOS = :ID_CBR_TITULOS')
    Left = 157
    Top = 146
    ParamData = <
      item
        Name = 'ID_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_CBR_REMESSA'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'ID_CBR_TITULOS'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object tabCBR_REMESSA_TITULOSID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_REMESSA_TITULOSID_CBR_REMESSA: TLargeintField
      FieldName = 'ID_CBR_REMESSA'
      Origin = 'ID_CBR_REMESSA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_REMESSA_TITULOSID_CBR_TITULOS: TLargeintField
      FieldName = 'ID_CBR_TITULOS'
      Origin = 'ID_CBR_TITULOS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tabCBR_REMESSA_TITULOSDT_EMISSAO: TSQLTimeStampField
      FieldName = 'DT_EMISSAO'
      Origin = 'DT_EMISSAO'
    end
    object tabCBR_REMESSA_TITULOSDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'DT_VENCIMENTO'
    end
    object tabCBR_REMESSA_TITULOSVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object tabCBR_REMESSA_TITULOSCLI_RAZAOSOCIAL: TStringField
      FieldName = 'CLI_RAZAOSOCIAL'
      Origin = 'CLI_RAZAOSOCIAL'
      Size = 100
    end
    object tabCBR_REMESSA_TITULOSCLI_CNPJCPF: TStringField
      FieldName = 'CLI_CNPJCPF'
      Origin = 'CLI_CNPJCPF'
      Size = 15
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Origin = 'CLI_ENDERECO'
      Size = 100
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDNUMERO: TStringField
      FieldName = 'CLI_ENDNUMERO'
      Origin = 'CLI_ENDNUMERO'
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDBAIRRO: TStringField
      FieldName = 'CLI_ENDBAIRRO'
      Origin = 'CLI_ENDBAIRRO'
      Size = 100
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDCIDADE: TStringField
      FieldName = 'CLI_ENDCIDADE'
      Origin = 'CLI_ENDCIDADE'
      Size = 100
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDUF: TStringField
      FieldName = 'CLI_ENDUF'
      Origin = 'CLI_ENDUF'
      FixedChar = True
      Size = 2
    end
    object tabCBR_REMESSA_TITULOSCLI_ENDCEP: TStringField
      FieldName = 'CLI_ENDCEP'
      Origin = 'CLI_ENDCEP'
      Size = 8
    end
    object tabCBR_REMESSA_TITULOSDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'DT_PAGAMENTO'
    end
    object tabCBR_REMESSA_TITULOSCANCELAMENTO_LOJA: TStringField
      FieldName = 'CANCELAMENTO_LOJA'
      Origin = 'CANCELAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object tabCBR_REMESSA_TITULOSPAGAMENTO_LOJA: TStringField
      FieldName = 'PAGAMENTO_LOJA'
      Origin = 'PAGAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object tabCBR_REMESSA_TITULOSALTERACAO_LOJA: TStringField
      FieldName = 'ALTERACAO_LOJA'
      Origin = 'ALTERACAO_LOJA'
      FixedChar = True
      Size = 1
    end
  end
  object dtstabCBR_REMESSA: TDataSource
    DataSet = tabCBR_REMESSA
    Left = 288
    Top = 24
  end
  object qryREMESSA_TITULOS: TFDQuery
    IndexFieldNames = 'ID_CBR_REMESSA_UUID'
    MasterSource = dtstabCBR_REMESSA
    MasterFields = 'ID_CBR_REMESSA_UUID'
    DetailFields = 'ID_CBR_REMESSA_UUID'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT'
      ' ID_CBR_REMESSA_UUID,'
      ' CRECEBER.FKEMPRESA,'
      ' CRECEBER.CODIGO,'
      ' CRECEBER.VALOR,'
      ' CRECEBER.HISTORICO,'
      ' CRECEBER.DATA,'
      ' CRECEBER.DTVENCIMENTO,'
      ' PESSOA.RAZAO,'
      ' PESSOA.CNPJ,'
      ' PESSOA.ENDERECO,'
      ' PESSOA.NUMERO,'
      ' PESSOA.BAIRRO,'
      ' PESSOA.COMPLEMENTO,'
      ' PESSOA.CEP,'
      ' PESSOA.UF,'
      ' PESSOA.MUNICIPIO,'
      ' CASE CRECEBER.remessa_reenviar'
      '   WHEN '#39'S'#39' Then '#39'Sim'#39
      '   WHEN '#39'N'#39' Then '#39'N'#227'o'#39
      ' END AS REMESSA_REENVIO'
      'FROM'
      ' CRECEBER'
      '   INNER JOIN PESSOA  ON CRECEBER.FKCLIENTE  = PESSOA.CODIGO'
      'WHERE'
      '  1=1'
      '  AND CRECEBER.ID_CBR_REMESSA_UUID =:ID_CBR_REMESSA_UUID AND'
      '  creceber.tipo='#39'B'#39)
    Left = 160
    Top = 211
    ParamData = <
      item
        Name = 'ID_CBR_REMESSA_UUID'
        DataType = ftString
        ParamType = ptInput
        Size = 44
        Value = Null
      end>
    object qryREMESSA_TITULOSID_CBR_REMESSA_UUID: TStringField
      FieldName = 'ID_CBR_REMESSA_UUID'
      Origin = 'ID_CBR_REMESSA_UUID'
      Size = 44
    end
    object qryREMESSA_TITULOSFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryREMESSA_TITULOSCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryREMESSA_TITULOSVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryREMESSA_TITULOSHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object qryREMESSA_TITULOSDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryREMESSA_TITULOSDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object qryREMESSA_TITULOSRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryREMESSA_TITULOSCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryREMESSA_TITULOSENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryREMESSA_TITULOSNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryREMESSA_TITULOSBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryREMESSA_TITULOSCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryREMESSA_TITULOSCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object qryREMESSA_TITULOSUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object qryREMESSA_TITULOSMUNICIPIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryREMESSA_TITULOSREMESSA_REENVIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REMESSA_REENVIO'
      Origin = 'REMESSA_REENVIO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
  end
  object qryCBR_TITULOS_SEL: TFDQuery
    IndexFieldNames = 'ID_CBR_REMESSA_UUID'
    MasterSource = dtstabCBR_REMESSA
    MasterFields = 'ID_CBR_REMESSA_UUID'
    DetailFields = 'ID_CBR_REMESSA_UUID'
    Connection = Dados.Conexao
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    SQL.Strings = (
      'SELECT'
      ' CRECEBER.*,'
      ' PESSOA.RAZAO,'
      ' PESSOA.CNPJ,'
      ' PESSOA.ENDERECO,'
      ' PESSOA.NUMERO,'
      ' PESSOA.BAIRRO,'
      ' PESSOA.COMPLEMENTO,'
      ' PESSOA.CEP,'
      ' PESSOA.UF,'
      ' PESSOA.MUNICIPIO'
      'FROM'
      ' CRECEBER'
      '   INNER JOIN PESSOA  ON CRECEBER.FKCLIENTE  = PESSOA.CODIGO'
      'WHERE'
      '  1=1'
      '  AND CRECEBER.ID_CBR_REMESSA_UUID =:ID_CBR_REMESSA_UUID')
    Left = 163
    Top = 277
    ParamData = <
      item
        Name = 'ID_CBR_REMESSA_UUID'
        DataType = ftString
        ParamType = ptInput
        Size = 44
        Value = Null
      end>
    object qryCBR_TITULOS_SELCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCBR_TITULOS_SELDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryCBR_TITULOS_SELFKCLIENTE: TIntegerField
      FieldName = 'FKCLIENTE'
      Origin = 'FKCLIENTE'
    end
    object qryCBR_TITULOS_SELDOC: TStringField
      FieldName = 'DOC'
      Origin = 'DOC'
      Size = 15
    end
    object qryCBR_TITULOS_SELVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
    object qryCBR_TITULOS_SELDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
      Origin = 'DTVENCIMENTO'
    end
    object qryCBR_TITULOS_SELHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 50
    end
    object qryCBR_TITULOS_SELDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Origin = 'DATA_RECEBIMENTO'
    end
    object qryCBR_TITULOS_SELDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryCBR_TITULOS_SELJUROS: TFMTBCDField
      FieldName = 'JUROS'
      Origin = 'JUROS'
      Precision = 18
      Size = 2
    end
    object qryCBR_TITULOS_SELVRECEBIDO: TCurrencyField
      FieldName = 'VRECEBIDO'
      Origin = 'VRECEBIDO'
    end
    object qryCBR_TITULOS_SELVL_RESTANTE: TFMTBCDField
      FieldName = 'VL_RESTANTE'
      Origin = 'VL_RESTANTE'
      Precision = 18
      Size = 2
    end
    object qryCBR_TITULOS_SELSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 10
    end
    object qryCBR_TITULOS_SELFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryCBR_TITULOS_SELFK_VENDA: TIntegerField
      FieldName = 'FK_VENDA'
      Origin = 'FK_VENDA'
    end
    object qryCBR_TITULOS_SELFKCONTA: TIntegerField
      FieldName = 'FKCONTA'
      Origin = 'FKCONTA'
    end
    object qryCBR_TITULOS_SELTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 10
    end
    object qryCBR_TITULOS_SELNBOLETO: TIntegerField
      FieldName = 'NBOLETO'
      Origin = 'NBOLETO'
    end
    object qryCBR_TITULOS_SELID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Origin = 'ID_VENDEDOR'
    end
    object qryCBR_TITULOS_SELFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryCBR_TITULOS_SELFK_OS: TIntegerField
      FieldName = 'FK_OS'
      Origin = 'FK_OS'
    end
    object qryCBR_TITULOS_SELBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Origin = 'BLOQUEADO'
      Size = 1
    end
    object qryCBR_TITULOS_SELFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryCBR_TITULOS_SELCARTAO: TStringField
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 1
    end
    object qryCBR_TITULOS_SELFPG_VENDA: TIntegerField
      FieldName = 'FPG_VENDA'
      Origin = 'FPG_VENDA'
    end
    object qryCBR_TITULOS_SELREMESSA: TStringField
      FieldName = 'REMESSA'
      Origin = 'REMESSA'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELREMESSA_REENVIAR: TStringField
      FieldName = 'REMESSA_REENVIAR'
      Origin = 'REMESSA_REENVIAR'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELREMESSA_DATA: TDateField
      FieldName = 'REMESSA_DATA'
      Origin = 'REMESSA_DATA'
    end
    object qryCBR_TITULOS_SELREMESSA_ARQUIVO: TStringField
      FieldName = 'REMESSA_ARQUIVO'
      Origin = 'REMESSA_ARQUIVO'
      Size = 200
    end
    object qryCBR_TITULOS_SELREGISTRO_ID_CBR_RETORNO: TLargeintField
      FieldName = 'REGISTRO_ID_CBR_RETORNO'
      Origin = 'REGISTRO_ID_CBR_RETORNO'
    end
    object qryCBR_TITULOS_SELREGISTRO_STATUS: TStringField
      FieldName = 'REGISTRO_STATUS'
      Origin = 'REGISTRO_STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELREGISTRO_DATA: TSQLTimeStampField
      FieldName = 'REGISTRO_DATA'
      Origin = 'REGISTRO_DATA'
    end
    object qryCBR_TITULOS_SELREGISTRO_ARQUIVO: TStringField
      FieldName = 'REGISTRO_ARQUIVO'
      Origin = 'REGISTRO_ARQUIVO'
      Size = 200
    end
    object qryCBR_TITULOS_SELREGISTRO_HISTORICO: TStringField
      FieldName = 'REGISTRO_HISTORICO'
      Origin = 'REGISTRO_HISTORICO'
      Size = 200
    end
    object qryCBR_TITULOS_SELREGISTRO_SEM_REGISTRO: TStringField
      FieldName = 'REGISTRO_SEM_REGISTRO'
      Origin = 'REGISTRO_SEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELREGISTRO_LIMITE_PRAZO: TStringField
      FieldName = 'REGISTRO_LIMITE_PRAZO'
      Origin = 'REGISTRO_LIMITE_PRAZO'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELRETORNO_HISTORICO: TStringField
      FieldName = 'RETORNO_HISTORICO'
      Origin = 'RETORNO_HISTORICO'
      Size = 300
    end
    object qryCBR_TITULOS_SELOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 300
    end
    object qryCBR_TITULOS_SELID_CBR_REMESSA_UUID: TStringField
      FieldName = 'ID_CBR_REMESSA_UUID'
      Origin = 'ID_CBR_REMESSA_UUID'
      Size = 44
    end
    object qryCBR_TITULOS_SELRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_TITULOS_SELCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCBR_TITULOS_SELENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_TITULOS_SELNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qryCBR_TITULOS_SELBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryCBR_TITULOS_SELCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryCBR_TITULOS_SELCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object qryCBR_TITULOS_SELUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object qryCBR_TITULOS_SELMUNICIPIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryCBR_TITULOS_SELRETORNO_ID_CBR_RETORNO: TIntegerField
      FieldName = 'RETORNO_ID_CBR_RETORNO'
      Origin = 'RETORNO_ID_CBR_RETORNO'
    end
    object qryCBR_TITULOS_SELRETORNO_SEM_REGISTRO: TStringField
      FieldName = 'RETORNO_SEM_REGISTRO'
      Origin = 'RETORNO_SEM_REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELRETORNO_LIMITE_PRAZO: TStringField
      FieldName = 'RETORNO_LIMITE_PRAZO'
      Origin = 'RETORNO_LIMITE_PRAZO'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELPAGAMENTO_LOJA: TStringField
      FieldName = 'PAGAMENTO_LOJA'
      Origin = 'PAGAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELCANCELAMENTO_LOJA: TStringField
      FieldName = 'CANCELAMENTO_LOJA'
      Origin = 'CANCELAMENTO_LOJA'
      FixedChar = True
      Size = 1
    end
    object qryCBR_TITULOS_SELCANCELAMENTO_DATA: TSQLTimeStampField
      FieldName = 'CANCELAMENTO_DATA'
      Origin = 'CANCELAMENTO_DATA'
    end
    object qryCBR_TITULOS_SELALTERACAO_LOJA: TStringField
      FieldName = 'ALTERACAO_LOJA'
      Origin = 'ALTERACAO_LOJA'
      FixedChar = True
      Size = 1
    end
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 272
    Top = 280
  end
end
