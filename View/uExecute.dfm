object frmExecute: TfrmExecute
  Left = 0
  Top = 0
  Caption = 'frmExecute'
  ClientHeight = 323
  ClientWidth = 672
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 672
    Height = 323
    ActivePage = TabSheet4
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    object TabSheet4: TTabSheet
      Caption = 'Novos Campos'
      ImageIndex = 3
      object MemoNovo: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        CharCase = ecUpperCase
        Lines.Strings = (
          'CREATE TABLE DEVOLUCAO_COMPRA_GRADE ('
          '    CODIGO           INTEGER NOT NULL,'
          '    FK_ITENS_COMPRA  INTEGER,'
          '    FK_PRODUTO       INTEGER,'
          '    FK_DEVOLUCAO     INTEGER,'
          '    DESCRICAO        VARCHAR(30),'
          '    QTD              DECIMAL(15,3),'
          '    FK_GRADE         INTEGER,'
          '    FK_COMPRA        INTEGER,'
          '    QTD_DEVOLVIDA    DECIMAL(15,3)'
          ');'
          ''
          'CREATE TABLE CHATBOOT_PEDIDO ('
          '    CODIGO       INTEGER NOT NULL,'
          '    TELEFONE     VARCHAR(20),'
          '    CPF          VARCHAR(20),'
          '    DATA_PEDIDO  DATE,'
          '    HORA_PEDIDO  TIME,'
          '    FK_EMPRESA   INTEGER,'
          '    OBSERVACAO   VARCHAR(200),'
          '    TOTAL        DECIMAL(15,2),'
          '    TROCO        DECIMAL(15,2),'
          '    SITUACAO     VARCHAR(1) NOT NULL,'
          '    NOME         VARCHAR(50)'
          ');'
          ''
          'CREATE TABLE SABORES ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(40),'
          '    ATIVO      VARCHAR(1)'
          ');'
          ''
          ''
          'CREATE TABLE CTE_SEGURADORA ('
          '    CODIGO       INTEGER NOT NULL,'
          '    FK_CTE       INTEGER,'
          '    RESPONSAVEL  VARCHAR(100),'
          '    NOME         VARCHAR(100),'
          '    CNPJ         VARCHAR(20),'
          '    APOLICE      VARCHAR(100),'
          '    AVERBACAO    VARCHAR(100)'
          ');'
          ''
          ''
          'CREATE TABLE BANDEIRA ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(50),'
          '    ATIVO      VARCHAR(1)'
          ');'
          ''
          'CREATE TABLE PRODUTO_FABRICADOS ('
          '    CODIGO      INTEGER NOT NULL,'
          '    DATA        DATE,'
          '    FK_PRODUTO  INTEGER,'
          '    DESCRICAO   VARCHAR(100),'
          '    QUANTIDADE  DECIMAL(15,4)'
          ');'
          ''
          'CREATE TABLE MESAS ('
          '    CODIGO      INTEGER NOT NULL,'
          '    SITUACAO    VARCHAR(1),'
          '    TOTAL       FLOAT,'
          '    FK_EMPRESA  INTEGER'
          ');'
          ''
          'CREATE TABLE NFCE_DOCUMENTOS ('
          '    CODIGO      INTEGER NOT NULL,'
          '    TIPO        VARCHAR(20),'
          '    NUMERO      INTEGER,'
          '    TOTAL       DECIMAL(15,4),'
          '    ID_USUARIO  INTEGER'
          ');'
          ''
          'CREATE TABLE TRANSPORTADORA_MOTORISTA ('
          '    CODIGO             INTEGER NOT NULL,'
          '    FK_TRANSPORTADORA  INTEGER,'
          '    NOME               VARCHAR(50),'
          '    CNH                VARCHAR(20),'
          '    VALIDADE           DATE,'
          '    CPF                VARCHAR(11)'
          ');'
          ''
          ''
          'CREATE TABLE MENSAGEM_ZAP ('
          '    CODIGO    INTEGER NOT NULL,'
          '    DATA      DATE,'
          '    MENSAGEM  VARCHAR(300),'
          '    ANEXO     VARCHAR(300),'
          '    FONE      VARCHAR(20),'
          '    STATUS    VARCHAR(20)'
          ');'
          ''
          ''
          'CREATE TABLE PRODUTO_SERIAL ('
          '    CODIGO        INTEGER NOT NULL,'
          '    ID_PRODUTO    INTEGER,'
          '    NUMERO_SERIE  VARCHAR(200),'
          '    DOC_SAIDA     VARCHAR(30),'
          '    SITUACAO      VARCHAR(1),'
          '    DATA_BAIXA    DATE'
          ');'
          ''
          'CREATE TABLE XML_DUPLICATA ('
          '    CODIGO           INTEGER NOT NULL,'
          '    FK_XML_MASTER    INTEGER,'
          '    DATA_VENCIMENTO  DATE,'
          '    DOCUMENTO        VARCHAR(20),'
          '    VALOR            DECIMAL(15,4)'
          ');'
          ''
          'CREATE TABLE PESSOA_CONTATO ('
          '    CODIGO        INTEGER NOT NULL,'
          '    FK_PESSOA     INTEGER,'
          '    DATA_HORA     TIMESTAMP,'
          '    DATA_RETORNO  DATE,'
          '    TITULO        VARCHAR(200),'
          '    MOTIVO        BLOB SUB_TYPE 1 SEGMENT SIZE 16,'
          '    FK_USUARIO    INTEGER,'
          '    FK_EMPRESA    INTEGER'
          ');'
          ''
          ''
          'CREATE TABLE CBR_CONFIG ('
          '    ID_EMPRESA       INTEGER NOT NULL,'
          '    DIRRECEBE        VARCHAR(300),'
          '    DIRENVIA         VARCHAR(300),'
          '    DIRRECEBEBKP     VARCHAR(300),'
          '    VLRTARIFABOLETA  NUMERIC(18,2),'
          '    TIPOCOBRANCA     VARCHAR(30),'
          '    CODBANCO         SMALLINT,'
          '    AGENCIA          SMALLINT,'
          '    AGENCIADIG       CHAR(1),'
          '    CONTA            VARCHAR(15),'
          '    CONTADIG         CHAR(1),'
          '    CODCEDENTE       VARCHAR(20),'
          '    CODCEDENTEDIG    CHAR(1),'
          '    CONVENIO         VARCHAR(15),'
          '    CARTEIRA         VARCHAR(15),'
          '    MODALIDADE       VARCHAR(15),'
          '    ESPECIEDOC       CHAR(3),'
          '    COBMOEDA         VARCHAR(10),'
          '    COBACEITE        VARCHAR(10),'
          '    LOCALPAGTO       VARCHAR(100),'
          '    INSTRUCAO1       VARCHAR(300),'
          '    INSTRUCAO2       VARCHAR(300)'
          ');'
          ''
          ''
          'CREATE TABLE CBR_REMESSA ('
          '    ID_EMPRESA           INTEGER NOT NULL,'
          '    ID_CBR_REMESSA       BIGINT NOT NULL,'
          '    ID_CBR_REMESSA_UUID  VARCHAR(44) NOT NULL,'
          '    DATA                 TIMESTAMP,'
          '    IDBANCO              SMALLINT,'
          '    AGENCIA              VARCHAR(15),'
          '    AGENCIA_DIGITO       CHAR(3),'
          '    CONTA                VARCHAR(20),'
          '    CONTA_DIGITO         CHAR(3),'
          '    CODIGO_CEDENTE       VARCHAR(10),'
          '    CONVENIO             VARCHAR(10),'
          '    MODALIDADE           CHAR(2),'
          '    LOCAL_DE_PAGAMENTO   VARCHAR(200),'
          '    MENSAGEM             VARCHAR(200),'
          '    INSTRUCAO1           VARCHAR(200),'
          '    INSTRUCAO2           VARCHAR(200),'
          '    PERCENTUAL_JUROS     NUMERIC(18,2),'
          '    PERCENTUAL_MULTA     NUMERIC(18,2),'
          '    CARTEIRA             VARCHAR(10),'
          '    ARQUIVO              BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    DATA_GERACAO         TIMESTAMP,'
          '    LOCAL_ARQUIVO        VARCHAR(200),'
          '    DATA_PROC_BANCO      TIMESTAMP,'
          '    CANCELADA            CHAR(1)'
          ');'
          ''
          ''
          ''
          'CREATE TABLE CBR_REMESSA_TITULOS ('
          '    ID_EMPRESA         INTEGER NOT NULL,'
          '    ID_CBR_REMESSA     BIGINT NOT NULL,'
          '    ID_CBR_TITULOS     BIGINT NOT NULL,'
          '    DT_EMISSAO         TIMESTAMP,'
          '    DT_VENCIMENTO      TIMESTAMP,'
          '    VALOR              NUMERIC(18,2),'
          '    CLI_RAZAOSOCIAL    VARCHAR(100),'
          '    CLI_CNPJCPF        VARCHAR(15),'
          '    CLI_ENDERECO       VARCHAR(100),'
          '    CLI_ENDNUMERO      VARCHAR(20),'
          '    CLI_ENDBAIRRO      VARCHAR(100),'
          '    CLI_ENDCIDADE      VARCHAR(100),'
          '    CLI_ENDUF          CHAR(2),'
          '    CLI_ENDCEP         VARCHAR(8),'
          '    DT_PAGAMENTO       DATE,'
          '    CANCELAMENTO_LOJA  CHAR(1),'
          '    PAGAMENTO_LOJA     CHAR(1),'
          '    ALTERACAO_LOJA     CHAR(1)'
          ');'
          ''
          ''
          'CREATE TABLE CBR_RETORNO ('
          '    ID_EMPRESA             INTEGER NOT NULL,'
          '    ID_CBR_RETORNO         BIGINT NOT NULL,'
          '    DTHORA_CADASTRO        TIMESTAMP,'
          '    DTHORA_PROCESSAMENTO   TIMESTAMP,'
          '    DTHORA_ARQUIVAMENTO    TIMESTAMP,'
          '    ARQUIVO                BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    ARQUIVO_NOME           VARCHAR(250),'
          '    ARQUIVO_DATA           TIMESTAMP,'
          '    ARQUIVO_NUMERO         INTEGER,'
          '    ARQUIVO_LOCAL          VARCHAR(300),'
          '    ARQUIVO_MD5            VARCHAR(300),'
          '    ARQUIVO_QUANT_TITULOS  INTEGER,'
          '    SITUACAO               SMALLINT'
          ');'
          ''
          ''
          ''
          'CREATE TABLE CBR_RETORNO_TITULOS ('
          '    ID_EMPRESA                INTEGER NOT NULL,'
          '    ID_CBR_RETORNO            BIGINT NOT NULL,'
          '    ID_CBR_RETORNO_TITULOS    BIGINT NOT NULL,'
          '    TITULO                    BIGINT,'
          '    TITULO_LOCALIZADO         CHAR(1),'
          '    TITULO_JALIQUIDADO        CHAR(1),'
          '    TITULO_SEMREGISTRO        CHAR(1),'
          '    TITULO_LIQUIDADO_LIMITEP  CHAR(1),'
          '    TITULO_RECUSADO           CHAR(1),'
          '    SEU_NUMERO                VARCHAR(50),'
          '    NOSSO_NUMERO              VARCHAR(50),'
          '    VALOR_DOCUMENTO           NUMERIC(18,2),'
          '    VALOR_PAGO                NUMERIC(18,2),'
          '    VALOR_RECEBIDO            NUMERIC(18,2),'
          '    VALOR_JUROS               NUMERIC(18,2),'
          '    VALOR_DESCONTO            NUMERIC(18,2),'
          '    VALOR_DESPESA             NUMERIC(18,2),'
          '    DATA_OCORRENCIA           DATE,'
          '    ID_BANCO                  VARCHAR(3),'
          '    ID_AGENCIA                VARCHAR(11),'
          '    ORIGEM                    VARCHAR(300),'
          '    FORMA_PAGAMENTO           VARCHAR(300),'
          '    TIPO_OCORRENCIA           INTEGER,'
          '    TIPO_OCORRENCIA_DESC      VARCHAR(300),'
          '    MOT_REJ_COMANDO           VARCHAR(300),'
          '    MOT_REJ_COMANDO_DESC      VARCHAR(300),'
          '    HISTORICO                 VARCHAR(300)'
          ');'
          ''
          ''
          'CREATE TABLE RESUMO_CAIXA ('
          '    CODIGO     INTEGER NOT NULL,'
          '    LOTE       INTEGER,'
          '    FPG        INTEGER,'
          '    USUARIO    INTEGER,'
          '    CAIXA      INTEGER,'
          '    DATA_HORA  TIMESTAMP,'
          '    TIPO       VARCHAR(1),'
          '    HISTORICO  VARCHAR(100),'
          '    FLAG       VARCHAR(1),'
          '    ENTRADA    DECIMAL(15,4),'
          '    SAIDA      DECIMAL(15,4),'
          '    FKEMPRESA  INTEGER'
          ');'
          ''
          ''
          'CREATE TABLE CST_ICMS ('
          '    CODIGO     VARCHAR(3) NOT NULL,'
          '    DESCRICAO  VARCHAR(100)'
          ');'
          ''
          'CREATE TABLE NFE_REFERENCIA ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FK_NFE      INTEGER,'
          '    REFERENCIA  VARCHAR(50)'
          ');'
          ''
          'CREATE TABLE IDIOMAS ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(50)'
          ');'
          ''
          'CREATE TABLE NFSE_PROVEDORES ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(50),'
          '    FK_CIDADE  INTEGER'
          ');'
          ''
          'CREATE TABLE NFSE_LCP ('
          '    CODIGO     VARCHAR(10) NOT NULL,'
          '    DESCRICAO  VARCHAR(100),'
          '    ATIVO      VARCHAR(1)'
          ');'
          ''
          ''
          'CREATE TABLE NFSE ('
          '    ID_NFSE                 INTEGER NOT NULL,'
          '    ID_EMPRESA              INTEGER,'
          '    ID_NUMERO               INTEGER,'
          '    ID_SERIE                INTEGER,'
          '    DTHR_EMISSAO            TIMESTAMP,'
          '    ID_PESSOA               INTEGER,'
          '    ID_SITUACAO             CHAR(1),'
          '    XML_ARQUIVO             VARCHAR(300),'
          '    XML_STRING              BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    XML_PROTOCOLO           VARCHAR(20),'
          '    XML_PROTOCOLO_DATAHORA  TIMESTAMP,'
          '    XML_STRING_PROTOCOLO    BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    XML_CANC_DATAHORA       TIMESTAMP,'
          '    XML_CANC_PROTOCOLO      VARCHAR(50),'
          '    XML_CANC_STRING         BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    IR                      DECIMAL(15,2),'
          '    NUMERO_LOTE             VARCHAR(20),'
          '    LOCAL_SERVICO           VARCHAR(20),'
          '    ENVIO_SINCRONO          VARCHAR(1)'
          ');'
          ''
          'CREATE TABLE NFSE_ITEM ('
          '    ID_NFSE_ITEM  INTEGER NOT NULL,'
          '    ID_NFSE       INTEGER,'
          '    ID_ITEM       INTEGER,'
          '    ID_PRODUTO    BIGINT,'
          '    QT            NUMERIC(15,4),'
          '    VL_UNIT       NUMERIC(15,4),'
          '    VL_TOTAL      COMPUTED BY (QT * VL_UNIT)'
          ');'
          ''
          ''
          'CREATE TABLE PAISES ('
          '    CODIGO      INTEGER NOT NULL,'
          '    NOME        VARCHAR(50),'
          '    FK_EMPRESA  INTEGER'
          ');'
          ''
          'CREATE TABLE TRADUTOR ('
          '    CODIGO           INTEGER NOT NULL,'
          '    CODIGO_IDIOMA    INTEGER,'
          '    TELA             VARCHAR(50),'
          '    OBJETO           VARCHAR(50),'
          '    TEXTO_PT_BR      VARCHAR(50),'
          '    TEXTO_TRADUZIDO  VARCHAR(50)'
          ');'
          ''
          'CREATE TABLE ENTREGADOR ('
          '    CODIGO  INTEGER NOT NULL,'
          '    NOME    VARCHAR(50)'
          ');'
          ''
          ''
          ''
          'CREATE TABLE SINCRONIZAR ('
          '    CODIGO      INTEGER NOT NULL,'
          '    SERVIDOR    VARCHAR(50) NOT NULL,'
          '    NOME        VARCHAR(50),'
          '    SENHA       VARCHAR(30),'
          '    USUARIO     VARCHAR(30),'
          '    BANCO       VARCHAR(30),'
          '    PATH        VARCHAR(200),'
          '    ENVIA       VARCHAR(1),'
          '    RECEBE      VARCHAR(1),'
          '    TEMPO       INTEGER,'
          '    PORTA       VARCHAR(10),'
          '    LIMITE      INTEGER,'
          '    DRIVER      VARCHAR(10),'
          '    PRIORIDADE  INTEGER'
          ');'
          ''
          'CREATE TABLE FILIAL ('
          '    CODIGO  INTEGER NOT NULL,'
          '    NOME    VARCHAR(30)'
          ');'
          ''
          ''
          'CREATE TABLE BENEFICIO_FISCAL ('
          '    CODIGO       INTEGER NOT NULL,'
          '    ABREVIATURA  VARCHAR(30),'
          '    DESCRICAO    VARCHAR(100),'
          '    CST00         VARCHAR(1),'
          '    CST10         VARCHAR(1),'
          '    CST20         VARCHAR(1),'
          '    CST30         VARCHAR(1),'
          '    CST40         VARCHAR(1),'
          '    CST41         VARCHAR(1),'
          '    CST50         VARCHAR(1),'
          '    CST51         VARCHAR(1),'
          '    CST60         VARCHAR(1),'
          '    CST70         VARCHAR(1),'
          '    CST90         VARCHAR(1)'
          ');'
          ''
          'CREATE TABLE ETIQUETAS ('
          '    CODIGO         INTEGER NOT NULL,'
          '    DESCRICAO      VARCHAR(50),'
          '    LARGURA        DECIMAL(15,2),'
          '    ALTURA         DECIMAL(15,2),'
          '    ESQUERDA       DECIMAL(15,2),'
          '    TOPO           DECIMAL(15,2),'
          '    COLUNAS        INTEGER,'
          '    ESPACAMENTO    DECIMAL(15,2),'
          '    BARRA_ALTURA   DECIMAL(15,2),'
          '    BARRA_LARGURA  DECIMAL(15,2),'
          '    BARRA_FINA     DECIMAL(15,2),'
          '    PORTA          VARCHAR(100),'
          '    MODELO         VARCHAR(30)'
          ');'
          ''
          'CREATE TABLE ETIQUETA_CAMPOS ('
          '    CODIGO        INTEGER NOT NULL,'
          '    CAMPO         VARCHAR(50),'
          '    COLUNA        INTEGER,'
          '    LINHA         INTEGER,'
          '    FONTES        INTEGER,'
          '    VISIVEL       VARCHAR(1),'
          '    FK_ETIQUETAS  INTEGER'
          ');'
          ''
          'CREATE TABLE ETIQUETA_IMPRESSAO ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FK_PRODUTO  INTEGER,'
          '    FK_EMPRESA  INTEGER,'
          '    QTD         INTEGER'
          ');'
          ''
          'CREATE TABLE MOTIVO_DESONERACAO ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(40)'
          ');'
          ''
          ''
          'CREATE TABLE CRRECEBIMENTO_LOTE ('
          '    CODIGO          INTEGER NOT NULL,'
          '    DATA            DATE,'
          '    FK_PLANO        INTEGER,'
          '    FK_FPG          INTEGER,'
          '    FK_CONTA        INTEGER,'
          '    SALDO           DECIMAL(15,2),'
          '    JUROS_PERC      DECIMAL(15,2),'
          '    JUROS_VALOR     DECIMAL(15,2),'
          '    TOTAL_C_JUROS   DECIMAL(15,2),'
          '    DESCONTO_PERC   DECIMAL(15,2),'
          '    DESCONTO_VALOR  DECIMAL(15,2),'
          '    TOTAL_FINAL     DECIMAL(15,2),'
          '    FK_EMPRESA      INTEGER,'
          '    FK_USUARIO      INTEGER'
          ');'
          ''
          'CREATE TABLE CPPAGAMENTO_LOTE ('
          '    CODIGO          INTEGER NOT NULL,'
          '    DATA            DATE,'
          '    FK_PLANO        INTEGER,'
          '    FK_FPG          INTEGER,'
          '    FK_CONTA        INTEGER,'
          '    SALDO           DECIMAL(15,2),'
          '    JUROS_PERC      DECIMAL(15,2),'
          '    JUROS_VALOR     DECIMAL(15,2),'
          '    TOTAL_C_JUROS   DECIMAL(15,2),'
          '    DESCONTO_PERC   DECIMAL(15,2),'
          '    DESCONTO_VALOR  DECIMAL(15,2),'
          '    TOTAL_FINAL     DECIMAL(15,2),'
          '    VALOR_SEGURADO  DECIMAL(15,4),'
          '    FK_EMPRESA      INTEGER,'
          '    FK_USUARIO      INTEGER'
          ');'
          ''
          'CREATE TABLE CHATBOOT_LOG ('
          '    CODIGO     INTEGER NOT NULL,'
          '    TELEFONE   VARCHAR(20),'
          '    DATA_HORA  TIMESTAMP'
          ');'
          ''
          'CREATE TABLE CHATBOOT_ITENS_PEDIDO ('
          '    CODIGO          INTEGER NOT NULL,'
          '    ITEM            INTEGER,'
          '    FK_CHAT_PEDIDO  INTEGER,'
          '    FK_PRODUTO      INTEGER,'
          '    DESCRICAO       VARCHAR(100),'
          '    QTD             DECIMAL(15,4),'
          '    PRECO           DECIMAL(15,4),'
          '    TOTAL           DECIMAL(15,4),'
          '    OBS             VARCHAR(100)'
          ');'
          ''
          ''
          'CREATE TABLE CHATBOOT_PEDIDO_FPG ('
          '    CODIGO         INTEGER NOT NULL,'
          '    FK_FPG         INTEGER,'
          '    FK_BOT_PEDIDO  INTEGER,'
          '    VALOR          DECIMAL(15,4)'
          ');'
          ''
          ''
          'CREATE TABLE CHATBOOT_CLIENTE ('
          '    CODIGO      INTEGER NOT NULL,'
          '    TELEFONE    VARCHAR(20),'
          '    FK_EMPRESA  INTEGER,'
          '    CPF         VARCHAR(20),'
          '    ATIVO       VARCHAR(20),'
          '    ENDERECO    BLOB SUB_TYPE 1 SEGMENT SIZE 16'
          ');'
          ''
          'CREATE TABLE MDFE_AVERBACAO ('
          '    CODIGO              INTEGER NOT NULL,'
          '    FK_MDFE_SEGURADORA  INTEGER,'
          '    AVERBACAO           VARCHAR(100)'
          ');'
          ''
          'CREATE TABLE MDFE_SEGURADORA ('
          '    CODIGO          INTEGER NOT NULL,'
          '    FK_MDFE         INTEGER,'
          '    RESPONSAVEL     VARCHAR(100),'
          '    NOME            VARCHAR(100),'
          '    CNPJ            VARCHAR(20),'
          '    APOLICE         VARCHAR(100),'
          '    AVERBACAO       VARCHAR(100),'
          '    VALOR_SEGURADO  DECIMAL(15,4)'
          ');'
          ''
          'ALTER TABLE NFE_MASTER ADD NUMERACAO VARCHAR(15);'
          'ALTER TABLE CONFIG ADD BLOQUEAR_PERSONALIZACAO VARCHAR(1);'
          'ALTER TABLE NFE_DETALHE ADD PESO_L DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD PESO_B DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD PESO_L DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD PESO_B DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD TPESO_L COMPUTED BY (QTD*PESO_L);'
          'ALTER TABLE NFE_DETALHE ADD TPESO_B COMPUTED BY (QTD*PESO_B);'
          ''
          
            'ALTER TABLE MDFE_SEGURADORA ADD CONSTRAINT PK_MDFE_SEGURADORA PR' +
            'IMARY KEY (CODIGO);'
          
            'ALTER TABLE MDFE_SEGURADORA ADD CONSTRAINT FK_MDFE_SEGURADORA_1 ' +
            'FOREIGN KEY (FK_MDFE) REFERENCES '
          'MDFE_MASTER (CODIGO) ON DELETE CASCADE;'
          
            'ALTER TABLE MDFE_AVERBACAO ADD CONSTRAINT PK_MDFE_AVERBACAO PRIM' +
            'ARY KEY (CODIGO);'
          
            'ALTER TABLE MDFE_AVERBACAO ADD CONSTRAINT FK_MDFE_AVERBACAO_1 FO' +
            'REIGN KEY (FK_MDFE_SEGURADORA) '
          'REFERENCES MDFE_SEGURADORA (CODIGO) ON DELETE CASCADE;'
          'ALTER TABLE OS_DETALHE ADD FK_GRADE INTEGER;'
          
            'ALTER TABLE DEVOLUCAO_COMPRA_GRADE ADD CONSTRAINT PK_DEVOLUCAO_C' +
            'OMPRA_GRADE PRIMARY KEY (CODIGO);'
          'ALTER TABLE COMPRA_GRADE ADD FK_GRADE INTEGER;'
          'ALTER TABLE COMPRA_GRADE ADD FK_COMPRA INTEGER;'
          'ALTER TABLE COMPRA_GRADE ADD PRECO DECIMAL(15,2);'
          'ALTER TABLE NFCE_DETALHE ADD FK_GRADE INTEGER;'
          'ALTER TABLE NFE_DETALHE ADD FK_GRADE INTEGER;'
          'ALTER TABLE DEVOLUCAO_COMPRA_D ADD FK_GRADE INTEGER;'
          'ALTER TABLE DEVOLUCAO_DETALHE ADD FK_GRADE INTEGER;'
          'ALTER TABLE MDFE_MASTER ADD PRODUTO_PREDOMINANTE VARCHAR(100);'
          'ALTER TABLE MDFE_MASTER ADD TIPO_CARGA INTEGER;'
          'ALTER TABLE MDFE_MASTER ADD COD_BARRA VARCHAR(20);'
          'ALTER TABLE MDFE_MASTER ADD NCM VARCHAR(8);'
          
            'ALTER TABLE CHATBOOT_CLIENTE ADD CONSTRAINT PK_CHATBOOT_CLIENTE ' +
            'PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE CHATBOOT_CLIENTE ADD ENDERECO BLOB SUB_TYPE 1 SEGMEN' +
            'T SIZE 16;'
          
            'ALTER TABLE CHATBOOT_PEDIDO_FPG ADD CONSTRAINT PK_CHATBOOT_PEDID' +
            'O_FPG PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE CHATBOOT_ITENS_PEDIDO ADD CONSTRAINT PK_CHATBOOT_ITE' +
            'NS_PEDIDO PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE CHATBOOT_LOG ADD CONSTRAINT PK_CHATBOOT_LOG PRIMARY ' +
            'KEY (CODIGO);'
          
            'ALTER TABLE CHATBOOT_PEDIDO ADD CONSTRAINT PK_CHATBOOT_PEDIDO PR' +
            'IMARY KEY (CODIGO);'
          'ALTER TABLE VENDAS_PARAMETROS ADD AUTORIZAR_ZAP VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CAMINHO_CARDAPIO VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CAMINHO_ENDERECO VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD TIPO_CHATBOOT VARCHAR(20);'
          'ALTER TABLE CHATBOOT_PEDIDO ADD NOME VARCHAR(50);'
          
            'ALTER TABLE SABORES ADD CONSTRAINT PK_SABORES PRIMARY KEY (CODIG' +
            'O);'
          'ALTER TABLE PRODUTO ADD CHATBOOT VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD BLOQUEAR_PERSONALIZACAO VARCHAR(1);'
          
            'ALTER TABLE CTE_SEGURADORA ADD CONSTRAINT PK_CTE_SEGURADORA PRIM' +
            'ARY KEY (CODIGO);'
          'ALTER TABLE CTE_SEGURADORA ADD VALOR_SEGURADO DECIMAL(15,4);'
          'ALTER TABLE EMPRESA ADD BLOQUEAR_CPF VARCHAR(1);'
          'ALTER TABLE MENSAGEM_ZAP ADD CAMINHO_ANEXO VARCHAR(200);'
          'ALTER TABLE PRODUTO ADD FABRICADO VARCHAR(1);'
          'ALTER TABLE XML_DETAIL ADD PRECO_CUSTO DECIMAL(15,4);'
          'ALTER TABLE NFCE_DETALHE ADD VICMSDESON DECIMAL(15,4);'
          'ALTER TABLE NFCE_DETALHE ADD ALIQICMSDESON DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD ALIQ_DESON DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD MOTIVO_DESONERACAO INTEGER;'
          'ALTER TABLE PLANO ADD CONTA_COMPLETA VARCHAR(30);'
          'ALTER TABLE CTE_CARTA ADD CAMPO VARCHAR(50);'
          'ALTER TABLE CTE_CARTA ADD GRUPO VARCHAR(50);'
          'ALTER TABLE CTE_CARTA ADD VALOR VARCHAR(100);'
          'ALTER TABLE PRODUTO ADD COD_BENEFICIO VARCHAR(20);'
          ''
          'ALTER TABLE CTE_SEGURADORA'
          'ADD CONSTRAINT FK_CTE_SEGURADORA_1'
          'FOREIGN KEY (FK_CTE)'
          'REFERENCES CTE_MASTER(CODIGO)'
          'ON DELETE CASCADE;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD CTE_NUMERO INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_NUMERO INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD CAMINHO_BAR VARCHAR(100);'
          'ALTER TABLE VENDAS_TERMINAIS ADD CAMINHO_COZINHA VARCHAR(100);'
          'ALTER TABLE VENDAS_MASTER ADD TELA VARCHAR(20);'
          'ALTER TABLE VENDAS_TERMINAIS ADD PDV VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD RESTAURANTE VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD DELIVERY VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD DESCONTO_ITEM_PDV VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD RATEAR_FRETE VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD USA_CREDITO_SIMPLES VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD USA_TEF VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD AUTO_ATUALIZA VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD PESQUISA_POR_PARTE VARCHAR(1);'
          ''
          'ALTER TABLE NFE_DETALHE ADD VBCSTRET DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD VICMSSTRET DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD VBCSTDEST DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD VICMSSTDEST DECIMAL(15,4);'
          ''
          
            'ALTER TABLE NFE_DETALHE ADD VL_OPERACAO COMPUTED BY (TOTAL - DES' +
            'CONTO + OUTROS + FRETE + SEGURO);'
          'ALTER TABLE CAIXA  ADD FK_NFE INTEGER;'
          'ALTER TABLE COMPRA ADD BASE_FCP DECIMAL(15,4);'
          'ALTER TABLE COMPRA_ITENS ADD VFCP DECIMAL(15,4);'
          'ALTER TABLE XML_DETAIL ADD VFCP DECIMAL(15,4);'
          'ALTER TABLE XML_MASTER ADD BASE_FCP DECIMAL(15,4);'
          ''
          'ALTER TABLE VENDAS_FPG ADD INDICE VARCHAR(10);'
          'ALTER TABLE VENDAS_FPG ADD FEZ_TEF VARCHAR(1);'
          'ALTER TABLE VENDAS_FPG ADD NSU VARCHAR(50);'
          'ALTER TABLE VENDAS_FPG ADD REDE VARCHAR(50);'
          'ALTER TABLE VENDAS_FPG ADD REDECNPJ VARCHAR(50);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_LOG VARCHAR(200);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_GERENCIADOR INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_MAX_CARTOES INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_TROCO_MAXIMO FLOAT;'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_SOFT_HOUSE VARCHAR(100);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_REGISTRO VARCHAR(30);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_APLICACAO VARCHAR(50);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_VERSAO VARCHAR(10);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_VIA_REDUZIDA VARCHAR(1);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD TEF_SUPORTA_DESCONTO VARCHAR(1)' +
            ';'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_SUPORTA_SAQUE VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TEF_REAJUSTA_VALOR VARCHAR(1);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD TEF_MULTIPLO_CARTOES VARCHAR(1)' +
            ';'
          ''
          
            'ALTER TABLE BANDEIRA ADD CONSTRAINT PK_BANDEIRA PRIMARY KEY (COD' +
            'IGO);'
          'ALTER TABLE FORMA_PAGAMENTO ADD FK_BANDEIRA INTEGER;'
          'ALTER TABLE XML_MASTER ADD BASE_FCP DECIMAL(15,4);'
          'ALTER TABLE XML_DETAIL ADD VFCP DECIMAL(15,4);'
          'ALTER TABLE COMPRA_ITENS ADD VFCP DECIMAL(15,4);'
          'ALTER TABLE COMPRA ADD BASE_FCP DECIMAL(15,4);'
          'ALTER TABLE CAIXA ADD FK_NFE INTEGER;'
          'ALTER TABLE CBR_CONFIG ADD AGENCIAD VARCHAR(10);'
          'ALTER TABLE NFE_MASTER ADD NOME VARCHAR(100);'
          
            'ALTER TABLE COMPRA_ITENS ADD QTD_RESTANTE COMPUTED BY (QTD-QTD_D' +
            'EVOLVIDA);'
          'ALTER TABLE CBR_REMESSA_TITULOS ADD NBOLETO INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD ZERO_BALANCA VARCHAR(6);'
          'ALTER TABLE PRODUTO_FABRICADOS ADD NUMERO_NFE INTEGER;'
          'ALTER TABLE ACERTA_ESTOQUE ADD TRANSACAO VARCHAR(40);'
          'ALTER TABLE ACERTA_ESTOQUE ADD FK_FABRICA INTEGER;'
          
            'ALTER TABLE PRODUTO_FABRICADOS ADD CONSTRAINT PK_PRODUTO_FABRICA' +
            'DOS PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE PRODUTO_FABRICADOS ADD CONSTRAINT FK_PRODUTO_FABRICA' +
            'DOS_1 FOREIGN KEY (FK_PRODUTO)'
          'REFERENCES PRODUTO (CODIGO) ON DELETE CASCADE;'
          'ALTER TABLE VENDAS_MASTER ADD NOME VARCHAR(100);'
          'ALTER TABLE COMPRA ADD NOME VARCHAR(100);'
          'ALTER TABLE COMPRA_ITENS ADD DESCRICAO VARCHAR(100);'
          'ALTER TABLE ORCAMENTO_ITEM ADD DESCRICAO VARCHAR(100);'
          'ALTER TABLE NFE_DETALHE ADD DESCRICAO VARCHAR(100);'
          'ALTER TABLE NFE_DETALHE ADD COD_ENQ_IPI VARCHAR(10);'
          'ALTER TABLE VENDAS_TERMINAIS ADD L1 INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD L2 INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD L3 INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD L4 INTEGER;'
          'ALTER TABLE NFE_DETALHE ADD MVA DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD COLUNAS INTEGER;'
          'ALTER TABLE EMPRESA ADD BAIXAR_ESTOQUE_COMPOSICAO VARCHAR(1);'
          'ALTER TABLE COMPRA_ITENS ADD CSOSN VARCHAR(3);'
          'ALTER TABLE XML_DETAIL ADD CSOSN VARCHAR(3);'
          'ALTER TABLE PRODUTO ADD FK_TECIDO DATE;'
          'ALTER TABLE VENDAS_DETALHE ADD OBSERVACAO VARCHAR(150);'
          'ALTER TABLE MESAS ADD FK_VENDA INTEGER;'
          'ALTER TABLE VENDAS_MASTER ADD FK_MESA INTEGER;'
          'ALTER TABLE VENDAS_DETALHE ADD FK_MESA INTEGER;'
          'ALTER TABLE EMPRESA ADD PRE_VISUALIZAR_IMPRESSAO VARCHAR(1);'
          'ALTER TABLE FORMA_PAGAMENTO ADD USA_TEF VARCHAR(1);'
          'ALTER TABLE MESAS ADD CONSTRAINT PK_MESAS PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE VENDAS_DETALHE ADD QTD_RESTANTE COMPUTED BY (QTD-QTD' +
            '_DEVOLVIDA);'
          'ALTER TABLE VENDAS_TERMINAIS ADD EMPRESA_ATIVA INTEGER;'
          'ALTER TABLE MDFE_MASTER ADD FK_MOTORISTA INTEGER;'
          'ALTER TABLE NFCE_MASTER ADD AGRUPADO VARCHAR(1);'
          'ALTER TABLE NFCE_DOCUMENTOS ADD SUBTOTAL DECIMAL(15,4);'
          'ALTER TABLE NFCE_DOCUMENTOS ADD DESCONTO DECIMAL(15,4);'
          'ALTER TABLE NFCE_DOCUMENTOS ADD ACRESCIMO DECIMAL(15,4);'
          'ALTER TABLE ORCAMENTO_ITEM ADD DESCONTO DECIMAL(15,2);'
          
            'ALTER TABLE ORCAMENTO_ITEM ADD TOTAL_C_DESCONTO COMPUTED BY (TOT' +
            'AL-DESCONTO);'
          
            'ALTER TABLE NFCE_DOCUMENTOS ADD CONSTRAINT PK_NFCE_DOCUMENTOS PR' +
            'IMARY KEY (CODIGO);'
          
            'ALTER TABLE TRANSPORTADORA_MOTORISTA ADD CONSTRAINT PK_TRANSPORT' +
            'ADORA_MOTORISTA PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE TRANSPORTADORA_MOTORISTA ADD CONSTRAINT FK_TRANSPORT' +
            'ADORA_MOTORISTA_1 FOREIGN KEY'
          
            '(FK_TRANSPORTADORA) REFERENCES TRANSPORTADORA (CODIGO) ON DELETE' +
            ' CASCADE;'
          'ALTER TABLE VENDAS_PARAMETROS ADD EMAILTLS VARCHAR(1);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD PARAMETROS_ADICIONAIS VARCHAR(2' +
            '00);'
          
            'ALTER TABLE MENSAGEM_ZAP ADD MENSAGEM_PADRAO BLOB SUB_TYPE 1 SEG' +
            'MENT SIZE 16;'
          'ALTER TABLE MENSAGEM_ZAP ADD NOME VARCHAR(50);'
          'ALTER TABLE MENSAGEM_ZAP ADD EMPRESA VARCHAR(50);'
          'ALTER TABLE MENSAGEM_ZAP ADD ORIGEM VARCHAR(20);'
          'ALTER TABLE MENSAGEM_ZAP ADD HORA TIME;'
          
            'ALTER TABLE MENSAGEM_ZAP ADD CONSTRAINT PK_MENSAGEM_ZAP PRIMARY ' +
            'KEY (CODIGO);'
          'ALTER TABLE VENDAS_TERMINAIS ADD QRCODE_LATERAL VARCHAR(1);'
          'ALTER TABLE TELAS ADD GRUPO VARCHAR(100);'
          
            'ALTER TABLE EMPRESA ADD MENSAGEM_COBRANCA BLOB SUB_TYPE 1 SEGMEN' +
            'T SIZE 16;'
          'ALTER TABLE PESSOA ADD WHATSAPP VARCHAR(14);'
          'ALTER TABLE PRODUTO ADD COD_ENQ_IPI VARCHAR(10);'
          'ALTER TABLE VENDAS_DETALHE ADD ID_SERIAL INTEGER;'
          
            'ALTER TABLE PRODUTO_SERIAL ADD CONSTRAINT PK_PRODUTO_SERIAL PRIM' +
            'ARY KEY (CODIGO);'
          
            'ALTER TABLE PRODUTO_SERIAL ADD CONSTRAINT FK_PRODUTO_SERIAL_1 FO' +
            'REIGN KEY (ID_PRODUTO) REFERENCES'
          'PRODUTO (CODIGO) ON DELETE CASCADE;'
          'ALTER TABLE PRODUTO ADD SERIAL VARCHAR(1);'
          'ALTER TABLE PESSOA ADD REGIME_TRIBUTARIO VARCHAR(10);'
          'ALTER TABLE EMPRESA ADD ALIQUOTA_SIMPLES DECIMAL(15,4);'
          'ALTER TABLE EMPRESA ADD SERVIDOR_SMTP_PROPRIO VARCHAR(1);'
          'ALTER TABLE PRODUTO ADD MVA_NORMAL DECIMAL(15,4);'
          'ALTER TABLE CBR_CONFIG ADD NUMERO_BOLETO INTEGER;'
          'ALTER TABLE PRODUTO ADD IMPRIME_TICKET VARCHAR(1);'
          'ALTER TABLE NFE_DETALHE ADD PICMSDEFERIDO DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD VICMSDEFERIDO DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD ICMS_DIFERIDO DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD VALOR_ICMS_ST_RET DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD QTD_SABORES INTEGER;'
          'ALTER TABLE MDFE_MASTER ADD NUMEROAVERBACAO VARCHAR(50);'
          'ALTER TABLE XML_DETAIL ADD PRECO_C_DESCONTO DECIMAL(15,4);'
          'ALTER TABLE COMPRA ADD LEU_DUPLICATA VARCHAR(1);'
          
            'ALTER TABLE XML_DUPLICATA ADD CONSTRAINT PK_XML_DUPLICATA PRIMAR' +
            'Y KEY (CODIGO);'
          'ALTER TABLE NFE_MASTER ADD PERC_DESCONTO DECIMAL(15,3);'
          'ALTER TABLE CBR_CONFIG ADD CNAB VARCHAR(10);'
          'ALTER TABLE EMPRESA ADD TRANSMITIR_CARTAO_AUTO VARCHAR(1);'
          'ALTER TABLE PESSOA ADD TIPO_RECEBIMENTO VARCHAR(20);'
          
            'ALTER TABLE PESSOA_CONTATO ADD CONSTRAINT PK_PESSOA_CONTATO PRIM' +
            'ARY KEY (CODIGO);'
          
            'ALTER TABLE PESSOA_CONTATO ADD CONSTRAINT FK_PESSOA_CONTATO_1 FO' +
            'REIGN KEY (FK_EMPRESA) REFERENCES'
          
            'EMPRESA (CODIGO) ON DELETE CASCADE  USING INDEX FK_PESSOA_CONTAT' +
            'O_2;'
          'ALTER TABLE PRODUTO ADD TRIBUTACAO_MONOFASICA VARCHAR(1);'
          'ALTER TABLE PESSOA ADD PARC VARCHAR(1);'
          'ALTER TABLE PRODUTO ADD ID_MENU INTEGER;'
          'ALTER TABLE EMPRESA ADD LUCRO_PADRAO DECIMAL(15,4);'
          'ALTER TABLE CONFIG ADD TELA_FUNDO_LOGIN VARCHAR(200);'
          'ALTER TABLE PRODUTO ADD VALOR_PEQUENA DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD VALOR_MEDIA DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD VALOR_GRANDE DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD TIPO_ALIMENTO VARCHAR(1);'
          ''
          'ALTER TABLE EMPRESA  ADD NFE_SERIE INTEGER;'
          'ALTER TABLE EMPRESA ADD OCULTAR_SALDO_ANTERIOR VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD BAIXAR_ESTOQUE_NFE VARCHAR(1);'
          'ALTER TABLE COMPRA_ITENS ADD EH_FISCAL VARCHAR(1);'
          'ALTER TABLE CAIXA ADD RESUMO_CAIXA VARCHAR(1);'
          
            'ALTER TABLE CBR_REMESSA ADD CONSTRAINT PK_CBR_REMESSA PRIMARY KE' +
            'Y (ID_EMPRESA, ID_CBR_REMESSA);'
          
            'ALTER TABLE CBR_CONFIG ADD CONSTRAINT PK_CBR_CONFIG PRIMARY KEY ' +
            '(ID_EMPRESA);'
          
            'ALTER TABLE CBR_REMESSA_TITULOS ADD CONSTRAINT PK_CBR_REMESSA_TI' +
            'TULOS PRIMARY KEY (ID_EMPRESA,'
          'ID_CBR_REMESSA, ID_CBR_TITULOS);'
          
            'ALTER TABLE CBR_REMESSA_TITULOS ADD CONSTRAINT FK_CBR_REMESSA_TI' +
            'TULOS_1 FOREIGN KEY (ID_EMPRESA,'
          
            'ID_CBR_REMESSA) REFERENCES CBR_REMESSA (ID_EMPRESA, ID_CBR_REMES' +
            'SA) ON DELETE CASCADE;'
          
            'ALTER TABLE CBR_RETORNO ADD CONSTRAINT PK_CBR_RETORNO PRIMARY KE' +
            'Y (ID_EMPRESA, ID_CBR_RETORNO);'
          
            'ALTER TABLE CBR_RETORNO_TITULOS ADD CONSTRAINT PK_CBR_RETORNO_TI' +
            'TULOS PRIMARY KEY (ID_EMPRESA,'
          'ID_CBR_RETORNO, ID_CBR_RETORNO_TITULOS);'
          
            'ALTER TABLE CBR_RETORNO_TITULOS ADD CONSTRAINT FK_CBR_RETORNO_TI' +
            'TULOS_1 FOREIGN KEY (ID_EMPRESA,'
          
            'ID_CBR_RETORNO) REFERENCES CBR_RETORNO (ID_EMPRESA, ID_CBR_RETOR' +
            'NO) ON DELETE CASCADE;'
          ''
          'ALTER TABLE NFCE_DETALHE ADD BLOQUEADO VARCHAR(1);'
          'ALTER TABLE NFE_DETALHE ADD BLOQUEADO VARCHAR(1);'
          'ALTER TABLE COMPRA_ITENS ADD BLOQUEADO VARCHAR(1);'
          ''
          'ALTER TABLE NFE_DETALHE ADD E_S VARCHAR(1);'
          'ALTER TABLE VENDAS_DETALHE ADD ID_PRODUTO_SIMILAR INTEGER;'
          'ALTER TABLE PRODUTO ADD QTD_FISCAL DECIMAL(15,4);'
          'ALTER TABLE EMPRESA ADD EXIBE_ESTOQUE_FISCAL VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD NFCE_PRODUTO_SUBSTITUTO VARCHAR(1);'
          'ALTER TABLE PRODUTO ADD ID_PRODUTO_SIMILAR INTEGER;'
          'ALTER TABLE VENDAS_FPG ADD TROCO DECIMAL(15,4);'
          'ALTER TABLE CONFIG ADD DATA_ATUALIZACAO TIMESTAMP;'
          'ALTER TABLE EMPRESA ADD AUTO_CADASTRO_PRODUTO VARCHAR(1);'
          'ALTER TABLE PRODUTO ADD DATA_PRECO DATE;'
          'ALTER TABLE XMLPRODUTO ADD CFOP VARCHAR(4);'
          'ALTER TABLE COMPRA_ITENS ADD PR_ANTERIOR DECIMAL(15,4);'
          'ALTER TABLE COMPRA_ITENS ADD PR_MARGEM DECIMAL(15,4);'
          'ALTER TABLE COMPRA_ITENS ADD PR_SUGESTAO DECIMAL(15,4);'
          'ALTER TABLE COMPRA_ITENS ADD PR_VENDA_ANTERIOR DECIMAL(15,4);'
          ''
          'ALTER TABLE XML_DETAIL ADD PR_ANTERIOR DECIMAL(15,4);'
          'ALTER TABLE XML_DETAIL ADD PR_MARGEM DECIMAL(15,4);'
          'ALTER TABLE XML_DETAIL ADD PR_SUGESTAO DECIMAL(15,4);'
          'ALTER TABLE XML_DETAIL ADD PR_VENDA_ANTERIOR DECIMAL(15,4);'
          ''
          ''
          'ALTER TABLE OS_IMAGEM'
          'ADD CONSTRAINT FK_OS_IMAGEM_1'
          'FOREIGN KEY (FK_OS_MASTER)'
          'REFERENCES OS_MASTER(CODIGO)'
          'ON DELETE CASCADE;'
          ''
          'ALTER TABLE PESSOA_CONTA'
          'ADD CONSTRAINT FK_PESSOA_CONTA_2'
          'FOREIGN KEY (FKEMPRESA)'
          'REFERENCES EMPRESA(CODIGO)'
          'ON DELETE CASCADE'
          'USING INDEX FK_PESSOA_CONTA_2;'
          ''
          ''
          'ALTER TABLE ORCAMENTO_ITEM'
          'ADD CONSTRAINT FK_ORCAMENTO_ITEM_1'
          'FOREIGN KEY (FK_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE VENDAS_DETALHE'
          'ADD CONSTRAINT FK_VENDAS_DETALHE_2'
          'FOREIGN KEY (ID_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE DEVOLUCAO_COMPRA_D'
          'ADD CONSTRAINT FK_DEVOLUCAO_COMPRA_D_2'
          'FOREIGN KEY (ID_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE COMPRA_ITENS'
          'ADD CONSTRAINT FK_COMPRA_ITENS_2'
          'FOREIGN KEY (FK_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE NFCE_DETALHE'
          'ADD CONSTRAINT FK_NFCE_DETALHE_2'
          'FOREIGN KEY (ID_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE NFE_DETALHE'
          'ADD CONSTRAINT FK_NFE_DETALHE_2'
          'FOREIGN KEY (ID_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE OS_DETALHE'
          'ADD CONSTRAINT FK_OS_DETALHE_2'
          'FOREIGN KEY (FK_PRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE PEDIDO_DETALHE'
          'ADD CONSTRAINT FK_PEDIDO_DETALHE_2'
          'FOREIGN KEY (FKPRODUTO)'
          'REFERENCES PRODUTO(CODIGO);'
          ''
          'ALTER TABLE XML_DUPLICATA'
          'ADD CONSTRAINT FK_XML_DUPLICATA_1'
          'FOREIGN KEY (FK_XML_MASTER)'
          'REFERENCES XML_MASTER(CODIGO)'
          'ON DELETE CASCADE;'
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD MODELO_SAT_DLL VARCHAR(30);'
          'ALTER TABLE VENDAS_TERMINAIS ADD CAMINHO_SAT_DLL VARCHAR(200);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TIPO_SAT_DLL VARCHAR(30);'
          ''
          'ALTER TABLE EMPRESA ADD CFOP_ENTRADA_PADRAO VARCHAR(4);'
          'ALTER TABLE EMPRESA ADD CFOP_ENTRADA_PADRO_E VARCHAR(4);'
          ''
          'ALTER TABLE EMPRESA ADD PUXAR_CFOP_ENTRADA VARCHAR(1);'
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD RETAGUARDA VARCHAR(40);'
          'ALTER TABLE VENDAS_TERMINAIS ADD FRENTE VARCHAR(40);'
          ''
          'ALTER TABLE DEVOLUCAO_DETALHE ADD ITEM INTEGER;'
          ''
          'ALTER TABLE CRECEBER ADD FK_NFE INTEGER;'
          'ALTER TABLE FORMA_PAGAMENTO ADD FK_PESSOA INTEGER;'
          ''
          
            'ALTER TABLE RESUMO_CAIXA ADD CONSTRAINT PK_RESUMO_CAIXA PRIMARY ' +
            'KEY (CODIGO);'
          
            'ALTER TABLE RESUMO_CAIXA ADD CONSTRAINT FK_RESUMO_CAIXA_1 FOREIG' +
            'N KEY (FKEMPRESA) REFERENCES EMPRESA'
          '(CODIGO) ON DELETE CASCADE;'
          'ALTER TABLE RESUMO_CAIXA ADD TIPO VARCHAR(1);'
          ''
          'ALTER TABLE CONTAS ADD ATIVO VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD REPLICAR_DADOS VARCHAR(1);'
          ''
          ''
          
            'ALTER TABLE NFCE_DETALHE ALTER TOTAL COMPUTED BY (VALOR_ITEM-VDE' +
            'SCONTO+OUTROS);'
          ''
          'ALTER TABLE EMPRESA ADD ID_PLANO_BOLETO INTEGER;'
          'ALTER TABLE EMPRESA ADD SEGUNDA_VIA_NFCE VARCHAR(1);'
          'ALTER TABLE CRECEBER ADD PAGAMENTO_LOJA CHAR(1);'
          'ALTER TABLE CRECEBER ADD CANCELAMENTO_LOJA CHAR(1);'
          'ALTER TABLE CRECEBER ADD ALTERACAO_LOJA CHAR(1);'
          'ALTER TABLE CRECEBER ADD CANCELAMENTO_DATA TIMESTAMP;'
          ''
          'ALTER TABLE CONFIG ADD CAMINHO_LOGO_FPG VARCHAR(200);'
          'ALTER TABLE CONFIG ADD TELA_FUNDO_ECF VARCHAR(200);'
          'ALTER TABLE CONFIG ADD CNPJ VARCHAR(20);'
          ''
          'ALTER TABLE  CRECEBER ADD REMESSA CHAR(1);'
          'ALTER TABLE  CRECEBER ADD REMESSA_REENVIAR CHAR(1);'
          'ALTER TABLE  CRECEBER ADD REMESSA_DATA DATE;'
          'ALTER TABLE  CRECEBER ADD REMESSA_ARQUIVO VARCHAR(200);'
          'ALTER TABLE  CRECEBER ADD REGISTRO_ID_CBR_RETORNO BIGINT;'
          'ALTER TABLE  CRECEBER ADD REGISTRO_STATUS CHAR(1);'
          'ALTER TABLE  CRECEBER ADD REGISTRO_DATA TIMESTAMP;'
          'ALTER TABLE  CRECEBER ADD REGISTRO_ARQUIVO VARCHAR(200);'
          'ALTER TABLE  CRECEBER ADD RETORNO_ID_CBR_RETORNO INTEGER;'
          'ALTER TABLE  CRECEBER ADD REGISTRO_HISTORICO VARCHAR(200);'
          'ALTER TABLE  CRECEBER ADD REGISTRO_SEM_REGISTRO CHAR(1);'
          'ALTER TABLE  CRECEBER ADD REGISTRO_LIMITE_PRAZO CHAR(1);'
          'ALTER TABLE  CRECEBER ADD RETORNO_HISTORICO VARCHAR(300);'
          'ALTER TABLE  CRECEBER ADD OBS VARCHAR(300);'
          'ALTER TABLE  CRECEBER ADD ID_CBR_REMESSA_UUID VARCHAR(44);'
          'ALTER TABLE  CRECEBER ADD RETORNO_ID_CBR_RETORNO INTEGER;'
          'ALTER TABLE  CRECEBER ADD RETORNO_SEM_REGISTRO CHAR(1);'
          'ALTER TABLE  CRECEBER ADD RETORNO_LIMITE_PRAZO CHAR(1);'
          ''
          'ALTER TABLE TABELA ADD ORDEM INTEGER;'
          
            'ALTER TABLE TABELA ADD CONSTRAINT PK_TABELA PRIMARY KEY (CODIGO)' +
            ';'
          'ALTER TABLE CONFIG ADD LINK_VENDA VARCHAR(200);'
          'ALTER TABLE VENDAS_TERMINAIS ADD TAMANHO_FONTE INTEGER;'
          'ALTER TABLE TABELA ADD FK_SERVIDOR INTEGER;'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD DT_ULTIMA_ATUALIZACAO TIMESTAMP' +
            ';'
          'ALTER TABLE PRODUTO ADD CSOSN_EXTERNO VARCHAR(3);'
          'ALTER TABLE PRODUTO ADD CST_EXTERNO VARCHAR(3);'
          'ALTER TABLE PRODUTO ADD ALIQ_ICMS_EXTERNO DECIMAL(15,2);'
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD EXIBE_F3 VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD EXIBE_F4 VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD EXIBE_F5 VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD EXIBE_F6 VARCHAR(1);'
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD MARGEM_DIREITA DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD MARGEM_ESQUERDA DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD MARGEM_INFERIOR DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD MARGEM_SUPERIOR DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD LARGURA_BOBINA INTEGER;'
          'ALTER TABLE VENDAS_TERMINAIS ADD IMPRIME_DUAS_LINHAS VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD ESPACO_ENTRE_LINHAS VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD LINHAS_ENTRE_CUPOM VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD DATA_SISTEMA DATE;'
          ''
          'ALTER TABLE EMPRESA ADD CSOSN_EXTERNO VARCHAR(3);'
          'ALTER TABLE EMPRESA ADD CST_EXTERNO VARCHAR(3);'
          'ALTER TABLE EMPRESA ADD ALIQ_ICMS_EXTERNO DECIMAL(15,2);'
          'ALTER TABLE PRODUTO ADD ORIGEM INTEGER;'
          ''
          ''
          'ALTER TABLE NFE_DETALHE ADD EVENDA VARCHAR(1);'
          
            'ALTER TABLE NFCE_MASTER ADD XML_CANCELAMENTO BLOB SUB_TYPE 1 SEG' +
            'MENT SIZE 96;'
          
            'ALTER TABLE NFE_MASTER ADD XML_CANCELAMENTO BLOB SUB_TYPE 1 SEGM' +
            'ENT SIZE 96;'
          'ALTER TABLE EMPRESA ADD COD_FPG_DINHEIRO INTEGER;'
          'ALTER TABLE PRODUTO ADD GLP DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD GNN DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD GNI DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD PESO_LIQ DECIMAL(15,4);'
          'ALTER TABLE PRODUTO ADD ANP VARCHAR(20);'
          'ALTER TABLE PRODUTO ADD COMBUSTIVEL VARCHAR(1);'
          'ALTER TABLE NFCE_MASTER ADD CNF VARCHAR(20);'
          'ALTER TABLE NFE_MASTER ADD CNF VARCHAR(20);'
          'ALTER TABLE EMPRESA ADD HABILITA_ACRESCIMO VARCHAR(1);'
          'ALTER TABLE NFCE_DETALHE DROP VACRESCIMO;'
          ''
          
            'ALTER TABLE CBR_CONFIG ADD CONSTRAINT PK_CBR_CONFIG PRIMARY KEY ' +
            '(ID_EMPRESA);'
          
            'ALTER TABLE CBR_REMESSA ADD CONSTRAINT PK_CBR_REMESSA PRIMARY KE' +
            'Y (ID_EMPRESA, ID_CBR_REMESSA);'
          
            'ALTER TABLE CBR_REMESSA_TITULOS ADD CONSTRAINT PK_CBR_REMESSA_TI' +
            'TULOS PRIMARY KEY (ID_EMPRESA,'
          'ID_CBR_REMESSA, ID_CBR_TITULOS);'
          
            'ALTER TABLE CBR_RETORNO ADD CONSTRAINT PK_CBR_RETORNO PRIMARY KE' +
            'Y (ID_EMPRESA, ID_CBR_RETORNO);'
          
            'ALTER TABLE CBR_RETORNO_TITULOS ADD CONSTRAINT PK_CBR_RETORNO_TI' +
            'TULOS PRIMARY KEY (ID_EMPRESA,'
          'ID_CBR_RETORNO, ID_CBR_RETORNO_TITULOS);'
          ''
          
            'ALTER TABLE CBR_REMESSA_TITULOS ADD CONSTRAINT FK_CBR_REMESSA_TI' +
            'TULOS_1 FOREIGN KEY (ID_EMPRESA,'
          
            'ID_CBR_REMESSA) REFERENCES CBR_REMESSA (ID_EMPRESA, ID_CBR_REMES' +
            'SA) ON DELETE CASCADE;'
          
            'ALTER TABLE CBR_RETORNO_TITULOS ADD CONSTRAINT FK_CBR_RETORNO_TI' +
            'TULOS_1 FOREIGN KEY (ID_EMPRESA,'
          
            'ID_CBR_RETORNO) REFERENCES CBR_RETORNO (ID_EMPRESA, ID_CBR_RETOR' +
            'NO) ON DELETE CASCADE;'
          ''
          
            'ALTER TABLE INVENTARIO ADD CONSTRAINT PK_INVENTARIO PRIMARY KEY ' +
            '(FK_PRODUTO);'
          ''
          
            'ALTER TABLE CST_ICMS ADD CONSTRAINT PK_CST_ICMS PRIMARY KEY (COD' +
            'IGO);'
          
            'ALTER TABLE NFE_REFERENCIA ADD CONSTRAINT PK_NFE_REFERENCIA PRIM' +
            'ARY KEY (CODIGO);'
          'ALTER TABLE CRECEBER ADD FPG_VENDA INTEGER;'
          'ALTER TABLE FORMA_PAGAMENTO ADD GERACC VARCHAR(1);'
          'ALTER TABLE FORMA_PAGAMENTO ADD GERACX VARCHAR(1);'
          ''
          'ALTER TABLE EMPRESA ADD MULTI_IDIOMA VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD FK_IDIOMA INTEGER;'
          
            'ALTER TABLE IDIOMAS ADD CONSTRAINT PK_IDIOMAS PRIMARY KEY (CODIG' +
            'O);'
          ''
          
            'ALTER TABLE NFSE_PROVEDORES ADD CONSTRAINT PK_NFSE_PROVEDORES PR' +
            'IMARY KEY (CODIGO);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_SCHEMA_NFSE VARCHAR(200);'
          
            'ALTER TABLE NFSE_LCP ADD CONSTRAINT PK_NFSE_LCP PRIMARY KEY (COD' +
            'IGO);'
          
            'ALTER TABLE NFSE_ITEM ADD CONSTRAINT PK_NFSE_ITEM PRIMARY KEY (I' +
            'D_NFSE_ITEM);'
          'ALTER TABLE NFSE ADD CONSTRAINT PK_NFSE PRIMARY KEY (ID_NFSE);'
          ''
          
            'ALTER TABLE NFSE ADD CONSTRAINT FK_NFSE_1 FOREIGN KEY (ID_EMPRES' +
            'A) REFERENCES EMPRESA (CODIGO);'
          
            'ALTER TABLE NFSE_ITEM ADD CONSTRAINT FK_NFSE_ITEM_1 FOREIGN KEY ' +
            '(ID_NFSE) REFERENCES NFSE (ID_NFSE) ON DELETE'
          'CASCADE;'
          ''
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD DATA_SCRIPT TIMESTAMP;'
          'ALTER TABLE PRODUTO ADD FK_LCP VARCHAR(10);'
          'ALTER TABLE PRODUTO ADD ISSQN DECIMAL(15,4);'
          'ALTER TABLE NFSE_ITEM ADD PERC_ISSQN DECIMAL(15,4);'
          'ALTER TABLE NFSE_ITEM ADD VL_ISSQN DECIMAL(15,4);'
          ''
          'ALTER TABLE VENDAS_MASTER ADD FLAG_NFCE VARCHAR(1);'
          
            'ALTER TABLE COMPRA_ITENS ADD TOTAL COMPUTED BY (VL_ITEM-DESCONTO' +
            ');'
          'ALTER TABLE VENDAS_PARAMETROS ADD STRESH_IMG_MENU VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CAMINHO_DLL_SAT VARCHAR(200);'
          
            'ALTER TABLE TRADUTOR ADD CONSTRAINT PK_TRADUTOR PRIMARY KEY (COD' +
            'IGO);'
          
            'ALTER TABLE PAISES ADD CONSTRAINT PK_PAISES PRIMARY KEY (CODIGO)' +
            ';'
          'ALTER TABLE EMPRESA ADD CODIGO_PAIS INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD SAFT_HASH VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD SAFT_REGISTRO INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD VERSAO_BROWSER VARCHAR(30);'
          'ALTER TABLE PESSOA ADD REFERENCIA INTEGER;'
          'ALTER TABLE EMPRESA ADD CNAE VARCHAR(20);'
          'ALTER TABLE EMPRESA ADD OBSNFCE BLOB SUB_TYPE 1 SEGMENT SIZE 16;'
          'ALTER TABLE CONFIG ADD EMPRESA VARCHAR(50);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MFE_INPUT VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MFE_OUTPUT VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD SAT_CNPJ VARCHAR(20);'
          'ALTER TABLE NFE_DETALHE ADD NPEDIDO INTEGER;'
          ''
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD PROXY_HOST VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PROXY_PORTA VARCHAR(50);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PROXY_SENHA VARCHAR(50);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PROXY_USUARIO VARCHAR(50);'
          'ALTER TABLE VENDAS_TERMINAIS ADD ESC_POS_DIRETO VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD PAGINA_CODIGO VARCHAR(30);'
          'ALTER TABLE NFCE_MASTER ADD SAT_NUMERO_CFE INTEGER;'
          'ALTER TABLE NFCE_MASTER ADD SAT_NUMERO_SERIE VARCHAR(10);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD TIPO_APLICATIVO VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MODELO_DLL VARCHAR(30);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CODIGO_ATIVACAO VARCHAR(20);'
          
            'ALTER TABLE VENDAS_PARAMETROS ADD CODIGO_VINCULACAO VARCHAR(350)' +
            ';'
          'ALTER TABLE VENDAS_PARAMETROS ADD CHAVE_ACESSO_MFE VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PASTA_CFE_VENDA VARCHAR(200);'
          
            'ALTER TABLE VENDAS_PARAMETROS ADD PASTA_CFE_CANCELAMENTO VARCHAR' +
            '(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PASTA_CFE_ENVIO VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PASTA_CFE_PDF VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PASTA_CFE_SCHEMA VARCHAR(200);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CFE_VERSAO VARCHAR(10);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CFE_IDENTAR VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CFE_TAMANHOIDENTACA INTEGER;'
          
            'ALTER TABLE ENTREGADOR ADD CONSTRAINT PK_ENTREGADOR PRIMARY KEY ' +
            '(CODIGO);'
          'ALTER TABLE VENDAS_MASTER ADD FK_ENTREGADOR INTEGER;'
          'ALTER TABLE CRECEBER ADD CARTAO VARCHAR(1);'
          ''
          ''
          'ALTER TABLE NFE_MASTER ADD IMPORTOU VARCHAR(1);'
          'ALTER TABLE VENDAS_MASTER ADD FORMA_PAGAMENTO VARCHAR(250);'
          'ALTER TABLE CPPAGAMENTO ADD FK_LOTE INTEGER;'
          'ALTER TABLE EMPRESA ADD CFOP_EXTERNO VARCHAR(4);'
          'ALTER TABLE CPPAGAMENTO ADD FK_LOTE INTEGER;'
          ''
          ''
          'ALTER TABLE CPAGAR ADD FK_FPG INTEGER;'
          'ALTER TABLE ORCAMENTO ADD FK_FPG INTEGER;'
          'ALTER TABLE COMPRA_ITENS ADD PR_VENDA DECIMAL(15,2);'
          'ALTER TABLE XML_DETAIL ADD CFOP_E VARCHAR(4);'
          'ALTER TABLE XML_DETAIL ADD CST_E VARCHAR(4);'
          'ALTER TABLE XML_DETAIL ADD PR_VENDA DECIMAL(15,2);'
          'ALTER TABLE VENDAS_TERMINAIS ADD DT_VERSAO VARCHAR(50);'
          'ALTER TABLE XML_DETAIL ADD CEST VARCHAR(8);'
          
            'ALTER TABLE SINCRONIZAR ADD CONSTRAINT PK_SINCRONIZAR PRIMARY KE' +
            'Y (CODIGO);'
          'ALTER TABLE ETIQUETA_CAMPOS ADD CARACTERES INTEGER;'
          'ALTER TABLE ETIQUETA_CAMPOS ADD DESCRICAO VARCHAR(50);'
          'ALTER TABLE PRODUTO ADD ETQ VARCHAR(1);'
          
            'ALTER TABLE ETIQUETA_IMPRESSAO ADD CONSTRAINT PK_ETIQUETA_IMPRES' +
            'SAO PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE BENEFICIO_FISCAL ADD CONSTRAINT PK_BENEFICIO_FISCAL ' +
            'PRIMARY KEY (CODIGO);'
          'ALTER TABLE ETIQUETAS ADD DPI VARCHAR(20);'
          'ALTER TABLE ETIQUETAS ADD BACKFEED VARCHAR(20);'
          'ALTER TABLE EMPRESA ADD LANCAR_CARTAO_CR VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD USA_BLUETOOTH_RESTA VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD DESTINO_IMPRESSAO VARCHAR(30);'
          
            'ALTER TABLE ETIQUETA_CAMPOS ADD CONSTRAINT PK_ETIQUETA_CAMPOS PR' +
            'IMARY KEY (CODIGO);'
          
            'ALTER TABLE ETIQUETA_CAMPOS ADD CONSTRAINT FK_ETIQUETA_CAMPOS_1 ' +
            'FOREIGN KEY (FK_ETIQUETAS) REFERENCES'
          'ETIQUETAS (CODIGO) ON DELETE CASCADE;'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT PK_CPPAGAMENTO_LOTE ' +
            'PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT FK_CPPAGAMENTO_LOTE_' +
            '1 FOREIGN KEY (FK_PLANO) REFERENCES'
          'PLANO'
          '(CODIGO);'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT FK_CPPAGAMENTO_LOTE_' +
            '2 FOREIGN KEY (FK_FPG) REFERENCES'
          'FORMA_PAGAMENTO (CODIGO);'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT FK_CPPAGAMENTO_LOTE_' +
            '3 FOREIGN KEY (FK_CONTA) REFERENCES'
          'CONTAS'
          '(CODIGO);'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT FK_CPPAGAMENTO_LOTE_' +
            '4 FOREIGN KEY (FK_EMPRESA) REFERENCES'
          'EMPRESA (CODIGO);'
          
            'ALTER TABLE CPPAGAMENTO_LOTE ADD CONSTRAINT FK_CPPAGAMENTO_LOTE5' +
            ' FOREIGN KEY (FK_USUARIO) REFERENCES'
          'USUARIOS (CODIGO);'
          'ALTER TABLE CPPAGAMENTO_LOTE ADD TOTAL_PAGO DECIMAL(15,2);'
          'ALTER TABLE CRRECEBIMENTO_LOTE ADD TOTAL_RECEBIDO DECIMAL(15,2);'
          ''
          ''
          'ALTER TABLE CRECEBER ADD FLAG VARCHAR(1);'
          'ALTER TABLE CPAGAR ADD FLAG VARCHAR(1);'
          'ALTER TABLE CPAGAR ADD FK_USUARIO INTEGER;'
          'ALTER TABLE CRRECEBIMENTO ADD FKLOTE INTEGER;'
          'ALTER TABLE CRECEBER ADD BLOQUEADO VARCHAR(1);'
          'ALTER TABLE CRECEBER ADD FK_USUARIO INTEGER;'
          'ALTER TABLE NFE_MANIFESTO ADD GEROU VARCHAR(1);'
          'ALTER TABLE NFCE_DETALHE ADD CEST VARCHAR(8);'
          'ALTER TABLE EMPRESA ADD PUXA_CFOP_PRODUTO VARCHAR(1);'
          'ALTER TABLE NFE_MASTER ADD TOTAL_DESONERACAO DECIMAL(15,2);'
          'ALTER TABLE CONFIG ADD FTP_SERVIDOR VARCHAR(200);'
          'ALTER TABLE CONFIG ADD FTP_USUARIO VARCHAR(100);'
          'ALTER TABLE CONFIG ADD FTP_SENHA VARCHAR(100);'
          'ALTER TABLE CONFIG ADD FTP_PASTA VARCHAR(50);'
          'ALTER TABLE CONFIG ADD FTP_ARQUIVO VARCHAR(50);'
          ''
          'ALTER TABLE NFE_DETALHE ADD BASE_DESONERACAO DECIMAL(15,4);'
          'ALTER TABLE NFE_DETALHE ADD ALIQ_DESONERACAO DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD MOTDESICMS SMALLINT;'
          'ALTER TABLE NFE_DETALHE ADD VICMSDESON DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD INFO_ADICIONAIS VARCHAR(100);'
          'ALTER TABLE CONFIG ADD USUARIO_LI VARCHAR(100);'
          'ALTER TABLE EMPRESA ADD HABILITA_DESCONTO_PDV VARCHAR(1);'
          'ALTER TABLE VENDAS_TERMINAIS ADD DATA_VERSAO TIMESTAMP;'
          'ALTER TABLE CONFIG ADD TELA_ABERTURA VARCHAR(200);'
          'ALTER TABLE PRODUTO ADD CFOP_EXTERNO INTEGER;'
          'ALTER TABLE CONFIG ADD TELA_FUNDO VARCHAR(200);'
          'ALTER TABLE CONFIG ADD TELA_FUNDO_ECF VARCHAR(200);'
          'ALTER TABLE CONFIG ADD MENU_MAXIMIZADO VARCHAR(1);'
          'ALTER TABLE CONFIG ADD SENHA_LI VARCHAR(100);'
          'ALTER TABLE OS_MASTER ADD DESCRICAO2 VARCHAR(60);'
          ''
          'ALTER TABLE CONFIG ADD SERVIDOR_APP VARCHAR(100);'
          'ALTER TABLE CONFIG ADD USUARIO_APP VARCHAR(100);'
          'ALTER TABLE CONFIG ADD SENHA_APP VARCHAR(100);'
          'ALTER TABLE CONFIG ADD DATABASE_APP VARCHAR(100);'
          ''
          'ALTER TABLE CONFIG ADD DATABASE_LI VARCHAR(100);'
          ''
          ''
          'ALTER TABLE ORCAMENTO ADD NCONTROLE INTEGER;'
          'ALTER TABLE ORCAMENTO ADD FK_TRANSP INTEGER;'
          'ALTER TABLE ORCAMENTO_ITEM ADD FK_GRADE INTEGER;'
          ''
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT PK_CRRECEBIMENTO_L' +
            'OTE PRIMARY KEY (CODIGO);'
          ''
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT FK_CRRECEBIMENTO_L' +
            'OTE_1 FOREIGN KEY (FK_PLANO) REFERENCES'
          'PLANO (CODIGO);'
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT FK_CRRECEBIMENTO_L' +
            'OTE_2 FOREIGN KEY (FK_FPG) REFERENCES'
          'FORMA_PAGAMENTO (CODIGO);'
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT FK_CRRECEBIMENTO_L' +
            'OTE_3 FOREIGN KEY (FK_CONTA) REFERENCES'
          'CONTAS (CODIGO);'
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT FK_CRRECEBIMENTO_L' +
            'OTE_4 FOREIGN KEY (FK_EMPRESA) REFERENCES'
          'EMPRESA (CODIGO);'
          
            'ALTER TABLE CRRECEBIMENTO_LOTE ADD CONSTRAINT FK_CRRECEBIMENTO_L' +
            'OTE_5 FOREIGN KEY (FK_USUARIO) REFERENCES'
          'USUARIOS (CODIGO);'
          ''
          
            'ALTER TABLE MOTIVO_DESONERACAO ADD CONSTRAINT PK_MOTIVO_DESONERA' +
            'CAO PRIMARY KEY (CODIGO);'
          ''
          ''
          
            'ALTER TABLE ETIQUETAS ADD CONSTRAINT PK_ETIQUETAS PRIMARY KEY (C' +
            'ODIGO);'
          ''
          
            'ALTER TABLE ETIQUETA_CAMPOS ADD CONSTRAINT PK_ETIQUETA_CAMPOS PR' +
            'IMARY KEY (CODIGO);'
          ''
          
            'ALTER TABLE ETIQUETA_CAMPOS ADD CONSTRAINT FK_ETIQUETA_CAMPOS_1 ' +
            'FOREIGN KEY (FK_ETIQUETAS) REFERENCES'
          'ETIQUETAS (CODIGO) ON DELETE CASCADE;'
          ''
          'ALTER TABLE PRODUTO ADD TIPO_TRIBUTACAO VARCHAR(10);'
          'ALTER TABLE PRODUTO_GRADE ADD PRECO DECIMAL(15,2);'
          'ALTER TABLE CONTAS_MOVIMENTO ADD TROCO DECIMAL(15,2);'
          'ALTER TABLE EMPRESA ADD PAGAMENTO_DINHEIRO VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD RESPONSAVEL_EMPRESA VARCHAR(50);'
          'ALTER TABLE NFE_MASTER ADD GERA_ES VARCHAR(1);'
          'ALTER TABLE NFE_DETALHE ADD GERA_ES VARCHAR(1);'
          'ALTER TABLE OS_DETALHE ADD COR VARCHAR(30);'
          'ALTER TABLE EMPRESA ADD DESCONTO_MAXIMO DECIMAL(15,2);'
          'ALTER TABLE XML_DETAIL ADD REFERENCIA VARCHAR(20);'
          'ALTER TABLE CAIXA ADD FK_OS INTEGER;'
          'ALTER TABLE OS_MASTER ADD FK_CLIENTE INTEGER;'
          'ALTER TABLE CRECEBER ADD FK_OS INTEGER;'
          'ALTER TABLE CAIXA ADD FK_OS INTEGER;'
          'ALTER TABLE OS_MASTER ADD FK_CLIENTE INTEGER;'
          'ALTER TABLE CRECEBER ADD FK_OS INTEGER;'
          'ALTER TABLE CONFIG ADD    VERSAO              INTEGER;'
          'ALTER TABLE CONFIG ADD    DATA_SCRIPT         DATE;'
          'ALTER TABLE CONFIG ADD    ESTILO              VARCHAR(30);'
          'ALTER TABLE CONFIG ADD    LINK_TREINAMENTO    VARCHAR(200);'
          'ALTER TABLE CONFIG ADD    TITULO_SISTEMA      VARCHAR(50);'
          'ALTER TABLE CONFIG ADD    SUB_TITULO_SISTEMA  VARCHAR(100);'
          'ALTER TABLE CONFIG ADD    EMAIL_SUPORTE       VARCHAR(100);'
          'ALTER TABLE CONFIG ADD    SITE                VARCHAR(100);'
          'ALTER TABLE CONFIG ADD    FONE1               VARCHAR(14);'
          'ALTER TABLE EMPRESA ADD CHECA_LIMITE VARCHAR(1);'
          'ALTER TABLE CONFIG ADD    FONE2               VARCHAR(14);'
          'ALTER TABLE CONFIG ADD    CONTATO             VARCHAR(14);'
          
            'ALTER TABLE CONFIG ADD    ICONE               BLOB SUB_TYPE 0 SE' +
            'GMENT SIZE 64;'
          
            'ALTER TABLE CONFIG ADD    SPLASH              BLOB SUB_TYPE 0 SE' +
            'GMENT SIZE 64;'
          'ALTER TABLE EMPRESA ADD CHECA_LIMITE VARCHAR(1);'
          'ALTER TABLE FORMA_PAGAMENTO ADD COD_BEMA VARCHAR(10);'
          'ALTER TABLE FORMA_PAGAMENTO ADD COD_DARU VARCHAR(10);'
          'ALTER TABLE FORMA_PAGAMENTO ADD COD_ELGI VARCHAR(10);'
          'ALTER TABLE FORMA_PAGAMENTO ADD COD_EPSO VARCHAR(10);'
          'ALTER TABLE EMPRESA ADD CHECA_LIMITE VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD EMITE_ECF VARCHAR(1);'
          'ALTER TABLE OS_IMAGEM ADD FK_OS_MASTER INTEGER;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     TIPO_BROWSER         VARCHA' +
            'R(30);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_PORTA        VARCHAR' +
            '(10);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_VELOCIDADE   VARCHAR' +
            '(10);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_MARCA        VARCHAR' +
            '(10);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_PARIDADE     VARCHAR' +
            '(20);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_DATABITS     VARCHAR' +
            '(10);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_STOPBITS     VARCHAR' +
            '(10);'
          
            'ALTER TABLE VENDAS_TERMINAIS ADD    BALANCA_HANDSHAKING  VARCHAR' +
            '(20);'
          ''
          'ALTER TABLE VENDAS_FPG DROP DESCRICAO;'
          'ALTER TABLE VENDAS_FPG DROP BAIXADO;'
          'ALTER TABLE VENDAS_FPG DROP LOTE;')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Update Dados'
      ImageIndex = 12
      object MemoUpdate: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        CharCase = ecUpperCase
        Lines.Strings = (
          'UPDATE PEMISSOES SET INCLUIR=VISUALIZAR WHERE INCLUIR IS NULL;'
          'UPDATE PEMISSOES SET EXCLUIR=VISUALIZAR WHERE EXCLUIR IS NULL;'
          'UPDATE PEMISSOES SET EDITAR=VISUALIZAR WHERE EDITAR IS NULL;'
          'UPDATE PRODUTO SET CHATBOOT='#39'N'#39' WHERE CHATBOOT IS NULL;'
          
            'UPDATE EMPRESA SET BLOQUEAR_PERSONALIZACAO='#39'S'#39' WHERE BLOQUEAR_PE' +
            'RSONALIZACAO IS NULL;'
          'UPDATE EMPRESA SET BLOQUEAR_CPF='#39'N'#39' WHERE BLOQUEAR_CPF IS NULL;'
          'UPDATE PRODUTO SET FABRICADO ='#39'N'#39' WHERE FABRICADO IS NULL;'
          
            'UPDATE MOTIVO_DESONERACAO SET DESCRICAO='#39'USO NA AGROPECUARIA'#39' WH' +
            'ERE DESCRICAO='#39'USUO NA AGROPECUARIA'#39';'
          
            'UPDATE PRODUTO SET MOTIVO_DESONERACAO=9 WHERE MOTIVO_DESONERACAO' +
            ' IS NULL;'
          
            'UPDATE EMPRESA SET PAGAMENTO_DINHEIRO='#39'S'#39' WHERE PAGAMENTO_DINHEI' +
            'RO IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET PDV='#39'N'#39' WHERE PDV IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET RESTAURANTE='#39'N'#39' WHERE RESTAURANTE IS' +
            ' NULL;'
          'UPDATE VENDAS_TERMINAIS SET DELIVERY='#39'N'#39' WHERE DELIVERY IS NULL;'
          
            'UPDATE EMPRESA SET DESCONTO_ITEM_PDV='#39'N'#39' WHERE DESCONTO_ITEM_PDV' +
            ' IS NULL;'
          'UPDATE EMPRESA SET RATEAR_FRETE='#39'N'#39' WHERE RATEAR_FRETE IS NULL;'
          
            'UPDATE EMPRESA SET USA_CREDITO_SIMPLES='#39'N'#39' WHERE USA_CREDITO_SIM' +
            'PLES IS NULL;'
          'UPDATE EMPRESA SET USA_TEF='#39'N'#39' WHERE USA_TEF IS NULL;'
          
            'UPDATE EMPRESA SET AUTO_ATUALIZA='#39'N'#39' WHERE AUTO_ATUALIZA IS NULL' +
            ';'
          
            'UPDATE EMPRESA SET PESQUISA_POR_PARTE='#39'N'#39' WHERE PESQUISA_POR_PAR' +
            'TE IS NULL;'
          
            'UPDATE EMPRESA SET USA_CREDITO_SIMPLES='#39'N'#39' WHERE USA_CREDITO_SIM' +
            'PLES IS NULL;'
          
            'UPDATE CBR_CONFIG  SET AGENCIAD=AGENCIADIG WHERE AGENCIAD IS NUL' +
            'L;'
          'UPDATE VENDAS_MASTER SET TELA='#39'PDV'#39' WHERE TELA IS NULL;'
          
            'UPDATE VENDAS_DETALHE SET QTD_DEVOLVIDA=0   WHERE QTD_DEVOLVIDA ' +
            'IS NULL;'
          
            'UPDATE VENDAS_PARAMETROS SET ZERO_BALANCA='#39'000000'#39' WHERE ZERO_BA' +
            'LANCA IS NULL;'
          
            'UPDATE EMPRESA SET AUTO_ATUALIZA='#39'S'#39' WHERE AUTO_ATUALIZA IS NULL' +
            ';'
          
            'UPDATE EMPRESA SET PESQUISA_POR_PARTE='#39'N'#39' WHERE PESQUISA_POR_PAR' +
            'TE IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET COLUNAS=42 WHERE COLUNAS IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET L1=32 WHERE L1 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET L2=32 WHERE L2 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET L3=1 WHERE L3 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET L4=1 WHERE L4 IS NULL;'
          
            'UPDATE EMPRESA SET TRANSMITIR_CARTAO_AUTO='#39'N'#39' WHERE TRANSMITIR_C' +
            'ARTAO_AUTO IS NULL;'
          
            'UPDATE EMPRESA SET BAIXAR_ESTOQUE_COMPOSICAO='#39'N'#39' WHERE BAIXAR_ES' +
            'TOQUE_COMPOSICAO IS NULL;'
          'UPDATE FORMA_PAGAMENTO SET USA_TEF='#39'N'#39' WHERE USA_TEF IS NULL;'
          
            'UPDATE COMPRA_ITENS SET QTD_DEVOLVIDA=0 WHERE QTD_DEVOLVIDA IS N' +
            'ULL;'
          'UPDATE ORCAMENTO_ITEM SET DESCONTO = 0 WHERE DESCONTO IS NULL;'
          
            'UPDATE VENDAS_PARAMETROS SET EMAILTLS='#39'N'#39' WHERE EMAILTLS IS NULL' +
            ';'
          'UPDATE PRODUTO SET COD_ENQ_IPI=999 WHERE COD_ENQ_IPI IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET QRCODE_LATERAL='#39'S'#39' WHERE QRCODE_LATE' +
            'RAL IS NULL;'
          'UPDATE PRODUTO SET MVA_NORMAL=0 WHERE MVA_NORMAL IS NULL;'
          
            'UPDATE FORMA_PAGAMENTO SET TIPO='#39'N'#39', GERACR='#39'C'#39' WHERE DESCRICAO=' +
            #39'NOTA'#39';'
          'UPDATE PRODUTO SET SERIAL='#39'N'#39' WHERE SERIAL IS NULL;'
          'UPDATE CFOP SET ATIVO='#39'S'#39' WHERE CODIGO=6401;'
          
            'UPDATE PRODUTO SET CSTICMS='#39'041'#39' WHERE (CSTICMS IS NULL) OR (CST' +
            'ICMS='#39#39');'
          'UPDATE PRODUTO SET ALIQ_ICM=0 WHERE ALIQ_ICM IS NULL;'
          
            'UPDATE EMPRESA SET ALIQUOTA_SIMPLES = 0 WHERE ALIQUOTA_SIMPLES I' +
            'S NULL;'
          
            'UPDATE EMPRESA SET SERVIDOR_SMTP_PROPRIO='#39'N'#39' WHERE SERVIDOR_SMTP' +
            '_PROPRIO IS NULL;'
          
            'UPDATE PRODUTO SET IMPRIME_TICKET='#39'N'#39' WHERE IMPRIME_TICKET IS NU' +
            'LL;'
          
            'UPDATE PRODUTO SET ICMS_DIFERIDO = 0 WHERE  ICMS_DIFERIDO IS NUL' +
            'L;'
          
            'UPDATE VENDAS_TERMINAIS SET LARGURA_BOBINA=302 WHERE LARGURA_BOB' +
            'INA IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET MARGEM_DIREITA=0.7 WHERE MARGEM_DIRE' +
            'ITA IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET MARGEM_ESQUERDA=0.7 WHERE MARGEM_ESQ' +
            'UERDA IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET MARGEM_INFERIOR=0.7 WHERE MARGEM_INF' +
            'ERIOR IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET MARGEM_SUPERIOR=0.7 WHERE MARGEM_SUP' +
            'ERIOR IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET ESPACO_ENTRE_LINHAS=0 WHERE ESPACO_E' +
            'NTRE_LINHAS IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET LINHAS_ENTRE_CUPOM=5 WHERE LINHAS_EN' +
            'TRE_CUPOM IS NULL;'
          ''
          
            'UPDATE  XML_DETAIL SET PRECO_C_DESCONTO=PRECO_E WHERE PRECO_C_DE' +
            'SCONTO IS NULL;'
          'UPDATE COMPRA SET LEU_DUPLICATA='#39'N'#39' WHERE LEU_DUPLICATA IS NULL;'
          
            'UPDATE PRODUTO SET TRIBUTACAO_MONOFASICA='#39'N'#39' WHERE TRIBUTACAO_MO' +
            'NOFASICA IS NULL;'
          'UPDATE PESSOA SET PARC='#39'N'#39' WHERE PARC IS NULL;'
          
            'UPDATE EMPRESA SET CARENCIA_JUROS=0 WHERE CARENCIA_JUROS IS NULL' +
            ';'
          
            'UPDATE EMPRESA SET DESCONTO_MAXIMO=0 WHERE DESCONTO_MAXIMO IS NU' +
            'LL;'
          'UPDATE EMPRESA SET NFE_SERIE=1 WHERE NFE_SERIE IS NULL;'
          'UPDATE EMPRESA SET JUROS_DIA=0 WHERE JUROS_DIA IS NULL;'
          'UPDATE EMPRESA SET LUCRO_PADRAO=0 WHERE LUCRO_PADRAO IS NULL;'
          'UPDATE PRODUTO SET VALOR_PEQUENA=0 WHERE VALOR_PEQUENA IS NULL;'
          'UPDATE PRODUTO SET VALOR_MEDIA=0 WHERE VALOR_MEDIA IS NULL;'
          'UPDATE PRODUTO SET VALOR_GRANDE=0 WHERE VALOR_GRANDE IS NULL;'
          ''
          
            'UPDATE EMPRESA SET OCULTAR_SALDO_ANTERIOR='#39'N'#39' WHERE OCULTAR_SALD' +
            'O_ANTERIOR IS NULL;'
          
            'UPDATE EMPRESA SET BAIXAR_ESTOQUE_NFE='#39'S'#39' WHERE BAIXAR_ESTOQUE_N' +
            'FE IS NULL;'
          'UPDATE PRODUTO SET QTD_FISCAL=0 WHERE QTD_FISCAL IS NULL;'
          'UPDATE PRODUTO SET LOCALIZACAO='#39#39' WHERE LOCALIZACAO IS NULL;'
          
            'UPDATE EMPRESA SET EXIBE_ESTOQUE_FISCAL='#39'N'#39'  WHERE EXIBE_ESTOQUE' +
            '_FISCAL IS NULL;'
          'UPDATE VENDAS_FPG SET TROCO=0 WHERE TROCO IS NULL;'
          
            'UPDATE EMPRESA SET AUTO_CADASTRO_PRODUTO='#39'N'#39' WHERE AUTO_CADASTRO' +
            '_PRODUTO IS NULL;'
          
            'UPDATE COMPRA_ITENS SET PR_ANTERIOR =0 WHERE PR_ANTERIOR IS NULL' +
            ';'
          'UPDATE COMPRA_ITENS SET PR_MARGEM = 0 WHERE PR_MARGEM IS NULL;'
          
            'UPDATE COMPRA_ITENS SET PR_SUGESTAO  = 0 WHERE PR_SUGESTAO IS NU' +
            'LL;'
          
            'UPDATE COMPRA_ITENS SET PR_VENDA_ANTERIOR = 0  WHERE PR_VENDA_AN' +
            'TERIOR IS NULL;'
          ''
          'UPDATE XML_DETAIL SET PR_ANTERIOR =0 WHERE PR_ANTERIOR IS NULL;'
          'UPDATE XML_DETAIL SET PR_MARGEM = 0 WHERE PR_MARGEM IS NULL;'
          
            'UPDATE XML_DETAIL SET PR_SUGESTAO  = 0 WHERE PR_SUGESTAO IS NULL' +
            ';'
          
            'UPDATE XML_DETAIL SET PR_VENDA_ANTERIOR = 0  WHERE PR_VENDA_ANTE' +
            'RIOR IS NULL;'
          ''
          
            'UPDATE VENDAS_TERMINAIS SET BALANCA_MARCA='#39'0'#39' WHERE BALANCA_MARC' +
            'A='#39'TOLEDO'#39';'
          
            'UPDATE VENDAS_TERMINAIS SET BALANCA_MARCA='#39'0'#39' WHERE BALANCA_MARC' +
            'A IS NULL;'
          ''
          
            'UPDATE EMPRESA SET PUXAR_CFOP_ENTRADA='#39'N'#39' WHERE PUXAR_CFOP_ENTRA' +
            'DA IS NULL;'
          ''
          'UPDATE VENDAS_TERMINAIS SET EXIBE_F3='#39'S'#39' WHERE EXIBE_F3 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET EXIBE_F4='#39'S'#39' WHERE EXIBE_F4 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET EXIBE_F5='#39'S'#39' WHERE EXIBE_F5 IS NULL;'
          'UPDATE VENDAS_TERMINAIS SET EXIBE_F6='#39'S'#39' WHERE EXIBE_F6 IS NULL;'
          ''
          
            'UPDATE FORMA_PAGAMENTO FPG SET FPG.GERACR='#39'R'#39' WHERE (TIPO='#39'C'#39') O' +
            'R (TIPO='#39'E'#39') OR (TIPO='#39'F'#39') OR (TIPO='#39'Q'#39') OR'
          '(TIPO='#39'B'#39');'
          'UPDATE FORMA_PAGAMENTO FPG SET FPG.GERACR='#39'X'#39' WHERE (TIPO='#39'D'#39');'
          'UPDATE FORMA_PAGAMENTO FPG SET FPG.GERACR='#39'D'#39' WHERE (TIPO='#39'X'#39');'
          ''
          'UPDATE CONTAS SET ATIVO='#39'S'#39' WHERE ATIVO IS NULL;'
          ''
          'UPDATE PRODUTO SET FK_MARCA=1 WHERE FK_MARCA IS NULL;'
          ''
          
            'UPDATE EMPRESA SET SEGUNDA_VIA_NFCE='#39'N'#39' WHERE SEGUNDA_VIA_NFCE I' +
            'S NULL;'
          ''
          
            'UPDATE EMPRESA SET REPLICAR_DADOS='#39'N'#39' WHERE REPLICAR_DADOS IS NU' +
            'LL;'
          ''
          'UPDATE PRODUTO SET ORIGEM=0 WHERE ORIGEM IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET TAMANHO_FONTE=8 WHERE TAMANHO_FONTE ' +
            'IS NULL;'
          
            'UPDATE EMPRESA E SET E.CFOP_EXTERNO= '#39'6'#39'||SUBSTRING(E.CFOP FROM ' +
            '2 FOR 3) WHERE E.CFOP_EXTERNO IS NULL;'
          
            'UPDATE EMPRESA E SET E.CST_EXTERNO=  SUBSTRING(E.CST_ICMS FROM 1' +
            ' FOR 3) WHERE E.CST_EXTERNO IS NULL;'
          
            'UPDATE EMPRESA E SET E.CSOSN_EXTERNO=  SUBSTRING(E.CSOSN FROM 1 ' +
            'FOR 3) WHERE E.CSOSN_EXTERNO IS NULL;'
          
            'UPDATE EMPRESA E SET E.ALIQ_ICMS_EXTERNO=  E.ALIQ_ICMS WHERE E.A' +
            'LIQ_ICMS_EXTERNO IS NULL;'
          ''
          
            'UPDATE PRODUTO PRO SET PRO.CFOP_EXTERNO= '#39'6'#39'||SUBSTRING(PRO.CFOP' +
            ' FROM 2 FOR 3) WHERE PRO.CFOP_EXTERNO IS'
          'NULL;'
          
            'UPDATE PRODUTO PRO SET PRO.CST_EXTERNO= SUBSTRING(PRO.CSTICMS FR' +
            'OM 1 FOR 3) WHERE PRO.CST_EXTERNO IS NULL;'
          
            'UPDATE PRODUTO PRO SET PRO.CSOSN_EXTERNO=  SUBSTRING(PRO.CSOSN F' +
            'ROM 1 FOR 3) WHERE PRO.CSOSN_EXTERNO IS'
          'NULL;'
          
            'UPDATE PRODUTO PRO SET PRO.ALIQ_ICMS_EXTERNO=  PRO.ALIQ_ICM WHER' +
            'E PRO.ALIQ_ICMS_EXTERNO IS NULL;'
          ''
          
            'UPDATE VENDAS_TERMINAIS VT SET VT.IMPRIME_DUAS_LINHAS='#39'N'#39' WHERE ' +
            'VT.IMPRIME_DUAS_LINHAS IS NULL;'
          ''
          ''
          
            'UPDATE EMPRESA SET COD_FPG_DINHEIRO=1 WHERE COD_FPG_DINHEIRO IS ' +
            'NULL;'
          ''
          'UPDATE PRODUTO SET COMBUSTIVEL='#39'N'#39' WHERE COMBUSTIVEL IS NULL;'
          ''
          
            'UPDATE EMPRESA SET HABILITA_ACRESCIMO='#39'S'#39' WHERE HABILITA_ACRESCI' +
            'MO IS NULL;'
          'UPDATE NFCE_DETALHE SET OUTROS=0 WHERE OUTROS IS NULL;'
          ''
          'UPDATE PRODUTO SET APLICACAO='#39#39' WHERE APLICACAO IS NULL;'
          'UPDATE PRODUTO SET REFERENCIA='#39#39' WHERE REFERENCIA IS NULL;'
          ''
          'UPDATE EMPRESA SET MULTI_IDIOMA='#39'N'#39' WHERE MULTI_IDIOMA IS NULL;'
          ''
          
            'UPDATE VENDAS_PARAMETROS SET TIPO_APLICATIVO='#39'N'#39' WHERE TIPO_APLI' +
            'CATIVO IS NULL;'
          'UPDATE EMPRESA SET CODIGO_PAIS = 1058 WHERE CODIGO_PAIS IS NULL;'
          
            'UPDATE VENDAS_PARAMETROS SET FK_IDIOMA=1 WHERE FK_IDIOMA IS NULL' +
            ';'
          'UPDATE EMPRESA SET CODIGO_PAIS=1058 WHERE CODIGO_PAIS IS NULL;'
          ''
          'UPDATE PESSOA SET REFERENCIA=CODIGO WHERE REFERENCIA IS NULL;'
          'UPDATE CRECEBER SET SITUACAO='#39'T'#39' WHERE VL_RESTANTE=0;'
          'UPDATE CRECEBER SET VL_RESTANTE=0 WHERE VL_RESTANTE<0;'
          'UPDATE CONFIG SET VERSAO=300 WHERE VERSAO<>300;'
          
            'UPDATE CONFIG SET DATA_SCRIPT='#39'05/01/2019'#39' WHERE DATA_SCRIPT<'#39'05' +
            '/01/2019'#39';'
          ''
          
            'UPDATE EMPRESA SET LANCAR_CARTAO_CR='#39'N'#39'  WHERE LANCAR_CARTAO_CR ' +
            'IS NULL;'
          
            'UPDATE EMPRESA SET USA_BLUETOOTH_RESTA='#39'N'#39'  WHERE USA_BLUETOOTH_' +
            'RESTA IS NULL;'
          'UPDATE CIDADE SET UF='#39'TO'#39' WHERE CODUF=17 AND UF IS NULL;'
          'UPDATE EMPRESA SET NTERM='#39'80E9'#39' WHERE NTERM IS NULL;'
          'UPDATE EMPRESA SET NTERM='#39'80E9'#39' WHERE NTERM='#39#39';'
          
            'UPDATE EMPRESA SET PUXA_CFOP_PRODUTO='#39'N'#39' WHERE PUXA_CFOP_PRODUTO' +
            ' IS NULL;'
          
            'UPDATE PRODUTO SET CFOP_EXTERNO=6||SUBSTRING(CFOP FROM 2 FOR 4) ' +
            'WHERE CFOP_EXTERNO IS NULL;;'
          
            'UPDATE EMPRESA SET PAGAMENTO_DINHEIRO='#39'S'#39' WHERE PAGAMENTO_DINHEI' +
            'RO IS NULL;'
          
            'UPDATE EMPRESA SET HABILITA_DESCONTO_PDV='#39'S'#39' WHERE HABILITA_DESC' +
            'ONTO_PDV IS NULL;'
          
            'UPDATE CONFIG CO SET CO.USUARIO_LI=CO.USUARIO_APP WHERE CO.USUAR' +
            'IO_LI IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET  BALANCA_VELOCIDADE='#39'102'#39' WHERE BALA' +
            'NCA_VELOCIDADE IS NULL;'
          
            'UPDATE VENDAS_TERMINAIS SET  BALANCA_DATABITS='#39'5'#39' WHERE BALANCA_' +
            'DATABITS IS NULL;'
          'UPDATE PRODUTO SET FCP=0 WHERE FCP IS NULL;'
          'UPDATE PRODUTO SET MVA=0 WHERE MVA IS NULL;'
          'UPDATE PRODUTO SET REDUCAO_BASE=0 WHERE REDUCAO_BASE IS NULL;'
          
            'UPDATE PRODUTO SET PRECO_VARIAVEL='#39'N'#39' WHERE PRECO_VARIAVEL IS NU' +
            'LL;'
          'UPDATE PRODUTO SET COMPOSICAO='#39'N'#39' WHERE COMPOSICAO IS NULL;'
          'UPDATE PRODUTO SET SERVICO='#39'N'#39' WHERE SERVICO IS NULL;'
          
            'UPDATE PRODUTO PRO SET  PRO.PAGA_COMISSAO='#39'N'#39' WHERE PRO.PAGA_COM' +
            'ISSAO IS NULL;'
          
            'UPDATE PRODUTO PRO SET  PRO.PRECO_VARIAVEL='#39'N'#39' WHERE PRO.PRECO_V' +
            'ARIAVEL IS NULL;'
          
            'UPDATE PRODUTO PRO SET  PRO.COMPOSICAO='#39'N'#39' WHERE PRO.COMPOSICAO ' +
            'IS NULL;'
          
            'UPDATE PRODUTO PRO SET  PRO.TIPO_RESTAURANTE='#39'N'#39' WHERE PRO.TIPO_' +
            'RESTAURANTE IS NULL;'
          
            'UPDATE PRODUTO PRO SET  PRO.SERVICO='#39'N'#39' WHERE PRO.SERVICO IS NUL' +
            'L;')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tabela IPI'
      ImageIndex = 3
      object MemoIPI: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          
            '             VALUES ('#39'01'#39', '#39'Entrada Tribut'#225'vel com Al'#237'quota Zero' +
            #39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'02'#39', '#39'Entrada Isenta'#39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'03'#39', '#39'Entrada N'#227'o-Tributada'#39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'04'#39', '#39'Entrada Imune'#39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'05'#39', '#39'Entrada com Suspens'#227'o'#39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'49'#39', '#39'Outras Entradas'#39', '#39'E'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'50'#39', '#39'Sa'#237'da Tributada'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          
            '             VALUES ('#39'51'#39', '#39'Sa'#237'da Tribut'#225'vel com Al'#237'quota Zero'#39',' +
            ' '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'52'#39', '#39'Sa'#237'da Isenta'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'53'#39', '#39' Sa'#237'da N'#227'o-Tributada'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'54'#39', '#39' Sa'#237'da Imune'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'55'#39', '#39'Sa'#237'da com Suspens'#227'o'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          '             VALUES ('#39'99'#39', '#39'Outras Sa'#237'das'#39', '#39'S'#39');'
          'INSERT INTO CST_IPI (CODIGO, DESCRICAO, TIPO)'
          
            '             VALUES ('#39'00'#39', '#39'Entrada com Recupera'#231#227'o de Cr'#233'dito'#39',' +
            ' '#39'E'#39');')
        TabOrder = 0
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Tabela CSOSN'
      ImageIndex = 4
      object MemoCSOSN: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'101'#39', '#39'Tributada pelo Simples Nacional com p' +
            'ermiss'#227'o de cr'#233'dito'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'102'#39', '#39'Tributada pelo Simples Nacional sem p' +
            'ermiss'#227'o de cr'#233'dito'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'103'#39', '#39'Isen'#231#227'o do ICMS no Simples Nacional p' +
            'ara faixa de receita br'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'201'#39', '#39' Tributada pelo Simples Nacional com ' +
            'permiss'#227'o de cr'#233'dito e '#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'202'#39', '#39'Tributada pelo Simples Nacional sem p' +
            'ermiss'#227'o de cr'#233'dito e c'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'203'#39', '#39'Isen'#231#227'o do ICMS no Simples Nacional p' +
            'ara faixa de receita br'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          '           VALUES ('#39'300'#39', '#39'Imune'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'400'#39', '#39'N'#227'o tributada pelo Simples Nacional'#39')' +
            ';'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          
            '           VALUES ('#39'500'#39', '#39'ICMS cobrado anteriormente por substi' +
            'tui'#231#227'o tribut'#225'ria (subs'#39');'
          'INSERT INTO CSOSN (CODIGO, DESCRICAO)'
          '           VALUES ('#39'900'#39', '#39'Outros'#39');')
        TabOrder = 0
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Tabela PIS Cofins'
      ImageIndex = 5
      object MemoPIS: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'01'#39', '#39'Opera'#231#227'o Tribut'#225'vel com Al'#237'qu' +
            'ota B'#225'sica'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'02'#39', '#39'Opera'#231#227'o Tribut'#225'vel com Al'#237'qu' +
            'ota Diferenciada'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'03'#39', '#39'Opera'#231#227'o Tribut'#225'vel com Al'#237'qu' +
            'ota por Unidade de Medida de Produto'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'04'#39', '#39'Opera'#231#227'o Tribut'#225'vel Monof'#225'sic' +
            'a - Revenda a Al'#237'quota Zero'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'05'#39', '#39'Opera'#231#227'o Tribut'#225'vel por Subst' +
            'itui'#231#227'o Tribut'#225'ria'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'06'#39', '#39'Opera'#231#227'o Tribut'#225'vel a Al'#237'quot' +
            'a Zero'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'07'#39', '#39'Opera'#231#227'o Isenta da Contribui'#231 +
            #227'o'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'08'#39', '#39'Opera'#231#227'o sem Incid'#234'ncia da Co' +
            'ntribui'#231#227'o'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'09'#39', '#39'Opera'#231#227'o com Suspens'#227'o da Con' +
            'tribui'#231#227'o'#39', '#39'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'49'#39', '#39'Outras Opera'#231#245'es de Sa'#237'da'#39', '#39 +
            'S'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'50'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada Exclusivamente a Receita Tributada no'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'51'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o '#8211' Vinculada Exclusivamente a Receita N'#227'o Tributad'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'52'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada Exclusivamente a Receita de Exporta'#231#227#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'53'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada a Receitas Tributadas e N'#227'o-Tributada'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'54'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada a Receitas Tributadas no Mercado Inte'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'55'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada a Receitas N'#227'o-Tributadas no Mercado '#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'56'#39', '#39'Opera'#231#227'o com Direito a Cr'#233'dit' +
            'o - Vinculada a Receitas Tributadas e N'#227'o-Tributada'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'60'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada Exclusivamente a Receita Tri'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'61'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada Exclusivamente a Receita N'#227'o'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'62'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada Exclusivamente a Receita de '#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'63'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada a Receitas Tributadas e N'#227'o-'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'64'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada a Receitas Tributadas no Mer'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'65'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada a Receitas N'#227'o-Tributadas no'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'66'#39', '#39'Cr'#233'dito Presumido - Opera'#231#227'o ' +
            'de Aquisi'#231#227'o Vinculada a Receitas Tributadas e N'#227'o-'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'67'#39', '#39'Cr'#233'dito Presumido - Outras Op' +
            'era'#231#245'es'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'70'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o sem Dir' +
            'eito a Cr'#233'dito'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'71'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o com Ise' +
            'n'#231#227'o'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'72'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o com Sus' +
            'pens'#227'o'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'73'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'qu' +
            'ota Zero'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'74'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o sem Inc' +
            'id'#234'ncia da Contribui'#231#227'o'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'75'#39', '#39'Opera'#231#227'o de Aquisi'#231#227'o por Sub' +
            'stitui'#231#227'o Tribut'#225'ria'#39', '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          
            '                    VALUES ('#39'98'#39', '#39'Outras Opera'#231#245'es de Entrada'#39',' +
            ' '#39'E'#39');'
          'INSERT INTO CTS_PIS_COFINS (CODIGO, DESCRICAO, TIPO)'
          '                    VALUES ('#39'99'#39', '#39'Outras Opera'#231#245'es'#39', '#39#39');')
        TabOrder = 0
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Tabela ICMS'
      ImageIndex = 7
      object MemoICMS: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'AC'#39', 17, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'AL'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'AP'#39', 12, 12, 12, 18, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'CE'#39', 12, 12, 12, 12, 12, 18, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'DF'#39', 12, 12, 12, 12, 12, 12, 18, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'ES'#39', 12, 12, 12, 12, 12, 12, 12, 17, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'GO'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '7, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'MA'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 18, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'MG'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 18,' +
            ' 7, 7, 7, 7, 7, 7, 12, 12, 7, 7, 7, 12, 12, 7, 12, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'MS'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 17, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'MT'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 17, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'PA'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 17, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'PB'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 18, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'PR'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 12,' +
            ' 7, 7, 7, 7, 7, 7, 18, 12, 7, 7, 7, 12, 12, 7, 12, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'PI'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 18, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'RN'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 18, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'RS'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 12,' +
            ' 7, 7, 7, 7, 7, 7, 12, 12, 7, 7, 7, 18, 12, 7, 12, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'RR'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 17, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'RO'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 17.5, 12, 12, 12, 12,' +
            ' 12, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'RJ'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 12,' +
            ' 7, 7, 7, 7, 7, 7, 12, 20, 7, 7, 7, 12, 12, 7, 12, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'SC'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 12,' +
            ' 7, 7, 7, 7, 7, 7, 12, 12, 7, 7, 7, 12, 17, 7, 12, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'SP'#39', 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 12,' +
            ' 7, 7, 7, 7, 7, 7, 12, 12, 7, 7, 7, 12, 12, 7, 18, 7);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'TO'#39', 12, 12, 12, 12, 12, 12, 12, 12, 7' +
            ', 7, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,' +
            ' 12, 18);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'PE'#39', 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 18, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'BA'#39', 12, 12, 12, 12, 18, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'SE'#39', 12, 12, 12, 12, 12, 12, 12, 12, 7' +
            ', 7, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 18,' +
            ' 12, 0);'
          
            'INSERT INTO TABELA_ICMS (ORIGEM, AC, AL, AM, AP, BA, CE, DF, ES,' +
            ' GO, MA, MG, MS, MT, PA, PB, PE, P_I, PR, RJ, RO, RN, RR, '
          'RS, '
          'SC, SE, SP, T_O)'
          
            '                 VALUES ('#39'AM'#39', 12, 12, 18, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1' +
            '2, 12, 12);')
        TabOrder = 0
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Tabela CST ICMS'
      ImageIndex = 12
      object MemoCstICMS: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'00'#39', '#39'TRIBUTADA INTEGRALMENTE'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          
            '              VALUES ('#39'10'#39', '#39'TRIBUTADA E COM COBRAN'#199'A DO ICMS PO' +
            'R SUBSTITUI'#199#195'O TRIBUT'#193'RIA'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'20'#39', '#39'COM REDU'#199#195'O DA BC'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          
            '              VALUES ('#39'30'#39', '#39'ISENTA / N'#195'O TRIBUTADA E COM COBRAN' +
            #199'A DO ICMS POR SUBSTITUI'#199#195'O TRIBUT'#193'RIA'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'40'#39', '#39'ISENTA'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'41'#39', '#39'N'#195'O TRIBUTADA'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'50'#39', '#39'COM SUSPENS'#195'O'#39');'
          ''
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'51'#39', '#39'COM DIFERIMENTO'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          
            '              VALUES ('#39'60'#39', '#39'ICMS COBRADO ANTERIORMENTE POR SUBS' +
            'TITUI'#199#195'O TRIBUT'#193'RIA'#39');'
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          
            '              VALUES ('#39'70'#39', '#39'COM REDU'#199#195'O DA BC E COBRAN'#199'A DO ICM' +
            'S POR SUBSTITUI'#199#195'O TRIBUT'#193'RIA'#39');'
          ''
          ''
          'INSERT INTO CST_ICMS (CODIGO, DESCRICAO)'
          '              VALUES ('#39'90'#39', '#39'OUTRAS'#39');'
          ''
          '')
        TabOrder = 0
      end
    end
    object TabPaises: TTabSheet
      Caption = 'TabPaises'
      ImageIndex = 13
      object MemoPaises: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (400, '#39'ANGOLA'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (1058, '#39'BRASIL'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (1279, '#39'CABO VERDE'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (3344, '#39'GUINE-BISSAU'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (3310, '#39'GUINE-EQUATORIAL'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (5053, '#39'MO'#199'AMBIQUE'#39', 1);'
          'INSERT INTO PAISES (CODIGO, NOME, FK_EMPRESA)'
          '                      VALUES (7200, '#39'SAO TOME E PRINCIPE'#39', 1);')
        TabOrder = 0
      end
    end
    object TabFPG: TTabSheet
      Caption = 'TabFPG'
      ImageIndex = 14
      object MemoFPG: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (7, '#39'NOTA'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39'S'#39', '#39'N'#39', '#39'S'#39', 4, 30, 0, 0, '#39'N' +
            #39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (4, '#39'DEPOSITO'#39', '#39'X'#39', '#39'N'#39', '#39'N'#39', '#39'S'#39', '#39'N'#39', '#39'S'#39', 4, 30, 0, 0' +
            ', '#39'X'#39', NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (5, '#39'CART'#195'O DE CR'#201'DITO'#39', '#39'X'#39', '#39'N'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', 4,' +
            ' 30, 3, 0, '#39'C'#39', 1, NULL, NULL, NULL, NULL, NULL,NULL, NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (6, '#39'CART'#195'O DE D'#201'BITO'#39', '#39'X'#39', '#39'N'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', 4, ' +
            '30, 0, 0, '#39'E'#39', 1, NULL, NULL, NULL, NULL, NULL, NULL,NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (8, '#39'TROCA'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39'S'#39', '#39'N'#39', '#39'S'#39', 0, 30, 0, 0, '#39 +
            'T'#39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (1, '#39'DINHEIRO'#39', '#39'X'#39', '#39'N'#39', '#39'N'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', 0, 0, 0, 0,' +
            ' '#39'D'#39', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (2, '#39'CHEQUE'#39', '#39'R'#39', '#39'S'#39', '#39'N'#39', '#39'S'#39', '#39'S'#39', '#39'S'#39', 8, 30, 0, 0, ' +
            #39'Q'#39', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);'
          ''
          
            'INSERT INTO FORMA_PAGAMENTO (CODIGO, DESCRICAO, GERACR, GERACH, ' +
            'ECARTAO, USAVD, USACR, ATIVO,'
          
            'PARCELAS, INTERVALO, TAXA, ENTRADA, TIPO, DIAS, FKCONTADESTINO, ' +
            'COD_BEMA, COD_DARU, COD_ELGI, COD_EPSO,'
          'GERACC, GERACX)'
          
            'VALUES (3, '#39'FATURADO'#39', '#39'R'#39', '#39'N'#39', '#39'N'#39', '#39'S'#39', '#39'N'#39', '#39'S'#39', 4, 30, 0, 3' +
            '0, '#39'F'#39', NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL);')
        TabOrder = 0
      end
    end
    object TabDesoneracao: TTabSheet
      Caption = 'TabDesoneracao'
      ImageIndex = 15
      object MemoDesoneracao: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'INSERT INTO MOTIVO_DESONERACAO (CODIGO, DESCRICAO)'
          
            '                                  VALUES (2, '#39'USUO NA AGROPECUAR' +
            'IA'#39');'
          'INSERT INTO MOTIVO_DESONERACAO (CODIGO, DESCRICAO)'
          '                                  VALUES (8, '#39'OUTROS'#39');'
          'INSERT INTO MOTIVO_DESONERACAO (CODIGO, DESCRICAO)'
          
            '                                  VALUES (11, '#39'ORG'#195'O DE FOMENTO ' +
            'E DESENVOLVIMENTO AGRO'#39');')
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = '2018'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'ALTER TABLE PRODUTO ADD SERVICO VARCHAR(1);'
          'ALTER TABLE DEVOLUCAO_DETALHE ADD FK_DEVOLUCAO_ITEM INTEGER;'
          'ALTER TABLE PEDIDO_MASTER ADD NUMERO INTEGER;'
          'ALTER TABLE PEDIDO_MASTER ADD PRAZO_ENTREGA VARCHAR(30);'
          'ALTER TABLE PEDIDO_DETALHE ADD FRETE DECIMAL(15,2);'
          'ALTER TABLE PEDIDO_DETALHE ADD CAPACIDADE DECIMAL(15,3);'
          'ALTER TABLE EMPRESA ADD VENDA_SEMENTE VARCHAR(1);'
          'ALTER TABLE PLANO ADD NIVEL SMALLINT;'
          'ALTER TABLE PLANO ADD CODIGO_PLANO VARCHAR(10);'
          'ALTER TABLE PLANO ADD PAI VARCHAR(10);'
          'CREATE TABLE LOG_MASTER ('
          '    CODIGO      INTEGER NOT NULL,'
          '    DATA        DATE,'
          '    HORA        TIME,'
          '    FK_USUARIO  INTEGER,'
          '    TELA        VARCHAR(30),'
          '    OPERACAO    VARCHAR(30),'
          '    FK_EMPRESA  INTEGER,'
          '    DESCRICAO   VARCHAR(100),'
          '    REGISTRO    VARCHAR(20)'
          ');'
          
            'ALTER TABLE LOG_MASTER ADD CONSTRAINT PK_LOG_MASTER PRIMARY KEY ' +
            '(CODIGO);'
          'CREATE TABLE LOG_DETALHE ('
          '    CODIGO      INTEGER NOT NULL,'
          '    LOG_MASTER  INTEGER NOT NULL,'
          '    HISTORICO   BLOB SUB_TYPE 1 SEGMENT SIZE 80'
          ');'
          
            'ALTER TABLE LOG_DETALHE ADD CONSTRAINT PK_LOG_DETALHE PRIMARY KE' +
            'Y (CODIGO);'
          
            'ALTER TABLE LOG_DETALHE ADD CONSTRAINT FK_LOG_DETALHE_1 FOREIGN ' +
            'KEY (LOG_MASTER) REFERENCES LOG_MASTER'
          '(CODIGO) ON DELETE CASCADE;'
          'ALTER TABLE TOMADOR ADD TIPO VARCHAR(10);'
          'ALTER TABLE TOMADOR ADD IE VARCHAR(20);'
          'ALTER TABLE TOMADOR ADD CNPJ VARCHAR(20);'
          'CREATE TABLE VEICULOS_CAVALO ('
          '    PLACA      VARCHAR(7) NOT NULL,'
          '    DESCRICAO  VARCHAR(30),'
          '    MUNICIPIO  VARCHAR(40),'
          '    UF         VARCHAR(2),'
          '    RENAVAM    VARCHAR(20),'
          '    RNTC       VARCHAR(8),'
          '    TIPO       INTEGER,'
          '    TARA       DECIMAL(15,3),'
          '    PESO       DECIMAL(15,3)'
          ');'
          
            'ALTER TABLE VEICULOS_CAVALO ADD CONSTRAINT PK_VEICULOS_CAVALO PR' +
            'IMARY KEY (PLACA);'
          'CREATE TABLE VEICULOS_REBOQUE ('
          '    CODIGO        INTEGER NOT NULL,'
          '    PLACA_CAVALO  VARCHAR(7) NOT NULL,'
          '    PLACA         VARCHAR(7),'
          '    MUNICIPIO     VARCHAR(40),'
          '    UF            VARCHAR(2),'
          '    RNTC          VARCHAR(8),'
          '    RENAVAM       VARCHAR(10),'
          '    TIPO          INTEGER,'
          '    PESO          DECIMAL(15,3),'
          '    TARA          DECIMAL(15,3)'
          ');'
          
            'ALTER TABLE VEICULOS_REBOQUE ADD CONSTRAINT PK_VEICULOS_REBOQUE ' +
            'PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE VEICULOS_REBOQUE ADD CONSTRAINT FK_VEICULOS_REBOQUE_' +
            '1 FOREIGN KEY (PLACA_CAVALO) REFERENCES'
          'VEICULOS_CAVALO (PLACA) ON DELETE CASCADE;'
          'ALTER TABLE VEICULOS_CAVALO ADD ATIVO VARCHAR(1);'
          'ALTER TABLE VEICULOS_REBOQUE ADD CARROCERIA SMALLINT;'
          'CREATE TABLE VENDAS_COMPOSICAO ('
          '    CODIGO            INTEGER NOT NULL,'
          '    FK_VENDA_DETALHE  INTEGER,'
          '    ID_PRODUTO        INTEGER,'
          '    QTD               DECIMAL(15,3)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_COMPOSICAO ADD CONSTRAINT PK_VENDAS_COMPOSICA' +
            'O PRIMARY KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_COMPOSICAO ADD CONSTRAINT FK_VENDAS_COMPOSICA' +
            'O_1 FOREIGN KEY (FK_VENDA_DETALHE)'
          'REFERENCES VENDAS_DETALHE (CODIGO) ON DELETE CASCADE;'
          
            'ALTER TABLE VENDAS_COMPOSICAO ADD CONSTRAINT FK_VENDAS_2 FOREIGN' +
            ' KEY (ID_PRODUTO) REFERENCES PRODUTO'
          '(CODIGO);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE VENDAS_COMPOSICAO ADD QTD_DEVOLVIDA DECIMAL(15,3);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA ADD  RECOLHE_FCP                VARCHAR(1);'
          
            'ALTER TABLE EMPRESA ADD  DIFAL_ORIGEM               DECIMAL(15,2' +
            ');'
          
            'ALTER TABLE EMPRESA ADD  DIFAL_DESTINO              DECIMAL(15,2' +
            ');'
          'ALTER TABLE EMPRESA ADD  EXCLUI_PDV                 VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD MOTIVO_CONTIGENCIA VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD REDUCAO_BASE DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_DETALHE ADD BASE_ICMS_ST DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD VALOR_ICMS_ST DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD BASE_ICMS_ST DECIMAL(15,2);'
          'ALTER TABLE NFE_MASTER ADD VALOR_ICMS_ST DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE PRODUTO ADD MVA DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_DETALHE ADD VBCUFDEST DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD VFCP DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD PICMSUFDEST DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD PICMSINTER DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD PICMSINTERPART DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD VFCPUFDEST DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD vICMSUFDest DECIMAL(15,2);'
          'ALTER TABLE NFE_DETALHE ADD vICMSUFRemet DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD VFCPUFDEST DECIMAL(15,2);'
          'ALTER TABLE NFE_MASTER ADD vICMSUFDest DECIMAL(15,2);'
          'ALTER TABLE NFE_MASTER ADD vICMSUFRemet DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD RECOLHE_FCP VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD CONSUMIDOR_FINAL VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD DIFAL_ORIGEM DECIMAL(15,2);'
          'ALTER TABLE EMPRESA ADD DIFAL_DESTINO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD FCP DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE TABELA_ICMS ('
          '    ORIGEM  VARCHAR(20) NOT NULL,'
          '    AC      DECIMAL(15,2),'
          '    AL      DECIMAL(15,2),'
          '    AM      DECIMAL(15,2),'
          '    AP      DECIMAL(15,2),'
          '    BA      DECIMAL(15,2),'
          '    CE      DECIMAL(15,2),'
          '    DF      DECIMAL(15,2),'
          '    ES      DECIMAL(15,2),'
          '    GO      DECIMAL(15,2),'
          '    MA      DECIMAL(15,2),'
          '    MG      DECIMAL(15,2),'
          '    MS      DECIMAL(15,2),'
          '    MT      DECIMAL(15,2),'
          '    PA      DECIMAL(15,2),'
          '    PB      DECIMAL(15,2),'
          '    PE      DECIMAL(15,2),'
          '    P_I     DECIMAL(15,2),'
          '    PR      DECIMAL(15,2),'
          '    RJ      DECIMAL(15,2),'
          '    RO      DECIMAL(15,2),'
          '    RN      DECIMAL(15,2),'
          '    RR      DECIMAL(15,2),'
          '    RS      DECIMAL(15,2),'
          '    SC      DECIMAL(15,2),'
          '    SE      DECIMAL(15,2),'
          '    SP      DECIMAL(15,2),'
          '    T_O     DECIMAL(15,2)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE TABELA_ICMS ADD CONSTRAINT PK_TABELA_ICMS PRIMARY KE' +
            'Y (ORIGEM);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA ADD EXCLUI_PDV VARCHAR(1);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD TIPO_BALANCA SMALLINT;'
          'ALTER TABLE VENDAS_PARAMETROS ADD MODELO_BALANCA INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD PREFIXO_BALANCA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD PRODUTO_PESADO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE NFE_DETALHE ADD CST_IPI VARCHAR(2);'
          'ALTER TABLE VENDAS_PARAMETROS ADD TIPO_DACTE VARCHAR(10);'
          'ALTER TABLE PESSOA ADD BANCO VARCHAR(30);'
          'ALTER TABLE PESSOA ADD AGENCIA VARCHAR(20);'
          'ALTER TABLE PESSOA ADD GERENTE VARCHAR(30);'
          'ALTER TABLE PESSOA ADD FONE_GERENTE VARCHAR(15);'
          'ALTER TABLE PESSOA ADD PROPRIEDADE VARCHAR(50);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PESSOA_ENTREGA ('
          '    FKCLIENTE    INTEGER NOT NULL,'
          '    ENDERECO     VARCHAR(50),'
          '    COMPLEMENTO  VARCHAR(50),'
          '    BAIRRO       VARCHAR(35),'
          '    CIDADE       VARCHAR(35),'
          '    UF           VARCHAR(2),'
          '    CEP          VARCHAR(8),'
          '    FONE         VARCHAR(15)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PESSOA_ENTREGA ADD CONSTRAINT PK_PESSOA_ENTREGA PRIM' +
            'ARY KEY (FKCLIENTE);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PESSOA_ENTREGA ADD CONSTRAINT FK_PESSOA_ENTREGA_1 FO' +
            'REIGN KEY (FKCLIENTE) REFERENCES PESSOA'
          '(CODIGO) ON DELETE CASCADE;'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PESSOA_COBRANCA ('
          '    FKCLIENTE    INTEGER NOT NULL,'
          '    ENDERECO     VARCHAR(50),'
          '    BAIRRO       VARCHAR(35),'
          '    CIDADE       VARCHAR(35),'
          '    COMPLEMENTO  VARCHAR(50),'
          '    UF           VARCHAR(2),'
          '    CEP          VARCHAR(8),'
          '    FONE         VARCHAR(15)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PESSOA_COBRANCA ADD CONSTRAINT PK_PESSOA_COBRANCA PR' +
            'IMARY KEY (FKCLIENTE);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PESSOA_COBRANCA ADD CONSTRAINT FK_PESSOA_COBRANCA_1 ' +
            'FOREIGN KEY (FKCLIENTE) REFERENCES PESSOA'
          '(CODIGO) ON DELETE CASCADE;'
          'COMMIT WORK;'
          ''
          ''
          'CREATE TABLE PEDIDO_MASTER ('
          '    CODIGO                INTEGER NOT NULL,'
          '    FKEMPRESA             INTEGER,'
          '    FKCLIENTE             INTEGER,'
          '    ENDERECO_COBRANCA     VARCHAR(50),'
          '    COMPLEMENTO_COBRANCA  VARCHAR(50),'
          '    BAIRRO_COBRANCA       VARCHAR(35),'
          '    CIDADE_COBRANCA       VARCHAR(35),'
          '    UF_COBRANCA           VARCHAR(2),'
          '    CEP_COBRANCA          VARCHAR(8),'
          '    FONE_COBRANCA         VARCHAR(12),'
          '    ENDERECO_ENTREGA      VARCHAR(50),'
          '    COMPLEMENTO_ENTREGA   VARCHAR(50),'
          '    BAIRRO_ENTREGA        VARCHAR(35),'
          '    CIDADE_ENTREGA        VARCHAR(35),'
          '    UF_ENTREGA            VARCHAR(2),'
          '    CEP_ENTREGA           VARCHAR(8),'
          '    TIPO_FRETE            VARCHAR(1),'
          '    CONDICOES_PAGAMENTO   BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    OBS                   BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    TOTAL                 DECIMAL(15,2),'
          '    PROPRIEDADE           VARCHAR(50),'
          '    BANCO                 VARCHAR(30),'
          '    AGENCIA               VARCHAR(20),'
          '    GERENTE               VARCHAR(30),'
          '    FONE_BANCO            VARCHAR(13),'
          '    TIPO                  VARCHAR(10) NOT NULL,'
          '    SITUACAO              VARCHAR(1) NOT NULL'
          ');'
          ''
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PEDIDO_MASTER ADD CONSTRAINT PK_PEDIDO_MASTER PRIMAR' +
            'Y KEY (CODIGO);'
          ''
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PEDIDO_MASTER ADD CONSTRAINT FK_PEDIDO_MASTER_1 FORE' +
            'IGN KEY (FKEMPRESA) REFERENCES EMPRESA'
          '(CODIGO);'
          
            'ALTER TABLE PEDIDO_MASTER ADD CONSTRAINT FK_PEDIDO_MASTER_2 FORE' +
            'IGN KEY (FKCLIENTE) REFERENCES PESSOA'
          '(CODIGO);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PEDIDO_DETALHE ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FKPEDIDO    INTEGER,'
          '    FKPRODUTO   INTEGER,'
          '    QUANTIDADE  DECIMAL(15,3),'
          '    PRECO       DECIMAL(15,2),'
          '    TOTAL       DECIMAL(15,2),'
          '    VC          DECIMAL(15,2)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PEDIDO_DETALHE ADD CONSTRAINT PK_PEDIDO_DETALHE PRIM' +
            'ARY KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PEDIDO_DETALHE ADD CONSTRAINT FK_PEDIDO_DETALHE_1 FO' +
            'REIGN KEY (FKPEDIDO) REFERENCES PEDIDO_MASTER'
          '(CODIGO) ON DELETE CASCADE;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD FORMA_ENTREGA VARCHAR(1);'
          'ALTER TABLE PEDIDO_MASTER ADD REPRESENTANTE VARCHAR(50);'
          'ALTER TABLE PEDIDO_MASTER ADD CONDICAO_PAGAMENTO VARCHAR(1);'
          'ALTER TABLE PEDIDO_MASTER ADD forma_PAGAMENTO VARCHAR(1);'
          'ALTER TABLE PEDIDO_DETALHE ADD PESO DECIMAL(15,3)'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD DATA DATE;'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE USUARIOS'
          'ADD ULTIMO_PEDIDO INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS'
          'ADD ULTIMA_VENDA INTEGER;'
          'COMMIT WORK;'
          ''
          
            'update vendas_terminais set eh_caixa='#39'S'#39'  where eh_caixa is null' +
            ';'
          'COMMIT WORK;'
          ''
          'update vendas_master set tipo='#39'V'#39' where tipo is null;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_MASTER'
          'ADD FK_TABELA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER'
          'ADD NPEDIDO VARCHAR(20);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFCE_MASTER'
          'ADD OUTROS DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFCE_DETALHE'
          'ADD OUTROS DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_DETALHE'
          'ADD ACRESCIMO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE NFE_MASTER'
          'ADD OUTROS DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_MASTER'
          'ADD PEDIDO VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_DETALHE'
          'ADD OUTROS DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE TABELA_PRECO ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(20),'
          '    ACRESCIMO  DECIMAL(15,2),'
          '    FKEMPRESA  INTEGER'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE TABELA_PRECO ADD CONSTRAINT PK_TABELA_PRECO PRIMARY ' +
            'KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE TABELA_PRECO'
          'ADD ATIVO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD ATUALIZA_PR_VENDA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE CURVA_ABC ('
          '    ID_PRODUTO  INTEGER NOT NULL,'
          '    QTD         DECIMAL(15,2),'
          '    TOTAL       DECIMAL(15,2),'
          '    PERCENTUAL  DECIMAL(15,2),'
          '    CURVA       VARCHAR(1),'
          '    FKEMPRESA   INTEGER'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE CURVA_ABC ADD CONSTRAINT PK_CURVA_ABC PRIMARY KEY (I' +
            'D_PRODUTO);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA'
          'ADD INFORMAR_GTIN VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_TERMINAIS'
          'ADD VERSAO SMALLINT;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD VERSAOQRCODE SMALLINT;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER'
          'ADD CHAVE_NFE_REFERENCIADA VARCHAR(44);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE TOMADOR'
          'ADD TIPO VARCHAR(20);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE TOMADOR'
          'ADD IE VARCHAR(20);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE TOMADOR'
          'ADD CNPJ VARCHAR(20);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_MASTER'
          'ADD PERCENTUAL_ACRESCIMO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_MASTER'
          'ADD ACRESCIMO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA'
          'ADD TABELA_PRECO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD TAXA_VENDA_PRAZO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          ''
          
            'update produto set pr_venda_prazo=pr_venda where pr_venda_prazo ' +
            'is null;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO'
          'ADD PR_VENDA_PRAZO DECIMAL(15,2) ;'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE VENDAS_TERMINAIS'
          'ADD LOGADO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA'
          'ADD EMAIL_CONTADOR VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_TERMINAIS'
          'ADD EH_CAIXA VARCHAR(1);'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO'
          'ADD PRECO_VARIAVEL VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'update produto set aplicacao='#39' '#39' where aplicacao is null;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO'
          'ADD APLICACAO VARCHAR(50);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE CTE_MASTER ('
          '    CODIGO            INTEGER NOT NULL,'
          '    FKEMPRESA         INTEGER NOT NULL,'
          '    NUMERO            INTEGER,'
          '    CHAVE             VARCHAR(50),'
          '    CFOP              INTEGER,'
          '    MODELO            INTEGER,'
          '    SERIE             INTEGER,'
          '    CODMUNENVIO       INTEGER,'
          '    MUNICIPIOENVIO    VARCHAR(40),'
          '    UFENVIO           VARCHAR(2),'
          '    TIPOSERVICO       INTEGER,'
          '    CODMUNINI         INTEGER,'
          '    MUNICIPIOINI      VARCHAR(40),'
          '    UFINI             VARCHAR(2),'
          '    CODMUNFIM         INTEGER,'
          '    MINICIPIOFIM      VARCHAR(40),'
          '    UFFIM             VARCHAR(2),'
          '    TOTAL             DECIMAL(15,2),'
          '    RECEBIDO          DECIMAL(15,2),'
          '    VPIS              DECIMAL(15,2),'
          '    VCOFINS           DECIMAL(15,2),'
          '    VINSS             DECIMAL(15,2),'
          '    VIR               DECIMAL(15,2),'
          '    VCLSS             DECIMAL(15,2),'
          '    VTOTTIRB          DECIMAL(15,2),'
          '    DESCRICAOSERVICO  VARCHAR(120),'
          '    QTD               DECIMAL(15,3),'
          '    RESPSEG           INTEGER,'
          '    XSEG              VARCHAR(50),'
          '    NAPOLICE          VARCHAR(20),'
          '    TAF               VARCHAR(20),'
          '    NROREGESTADUAL    VARCHAR(20),'
          '    TIPO              VARCHAR(10),'
          '    SITUACAO          VARCHAR(1),'
          '    FKTOMADOR         INTEGER,'
          '    FKTRANSPORTADOR   INTEGER,'
          '    PROTOCOLO         VARCHAR(20),'
          '    XML               BLOB SUB_TYPE 1 SEGMENT SIZE 16,'
          '    DATA              DATE,'
          '    HORA              TIME'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE CTE_MASTER ADD CONSTRAINT PK_CTE_MASTER PRIMARY KEY ' +
            '(CODIGO);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD PROCESSO_EMISSAO_CTE INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD TIPO_CONTRIBUINTE_CTE INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD PATH_CCE_CTE VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE TRANSPORTADORA'
          'ADD RENAVAM VARCHAR(20);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD CTE_SERIE VARCHAR(2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_PDF_CTE VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_INU_CTE VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_EVENTO_CTE VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_SCHEMA_CTE VARCHAR(100);'
          
            'ALTER TABLE VENDAS_PARAMETROS ADD PATH_ENVIADAS_CTE VARCHAR(100)' +
            ';'
          'ALTER TABLE VENDAS_PARAMETROS ADD VERSAO_CTE INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD MODELO_CTE VARCHAR(10);'
          'COMMIT WORK;'
          ''
          ''
          'CREATE TABLE TOMADOR ('
          '    CODIGO     INTEGER NOT NULL,'
          '    RAZAO      VARCHAR(50),'
          '    FANTASIA   VARCHAR(50),'
          '    FONE       VARCHAR(14),'
          '    ENDERECO   VARCHAR(50),'
          '    NUMERO     VARCHAR(10),'
          '    BAIRRO     VARCHAR(35),'
          '    CODMUN     INTEGER,'
          '    MUNICIPIO  VARCHAR(40),'
          '    UF         VARCHAR(2),'
          '    CEP        VARCHAR(8),'
          '    FKEMPRESA  INTEGER'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE TOMADOR ADD CONSTRAINT PK_TOMADOR PRIMARY KEY (CODIG' +
            'O);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD TRANSPORTADORA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD AUTOPECAS VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD LANCAR_CARTAO_CREDITO VARCHAR(1) ;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD FILTRAR_EMPRESA_LOGIN VARCHAR(1);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS'
          'ADD TRANSPORTADOR_PADRAO INTEGER;'
          ''
          'ALTER TABLE EMPRESA'
          'ADD ENVIAR_EMAIL_NFE VARCHAR(1);'
          ''
          'ALTER TABLE CFOP ADD OPERACAO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CFOP ADD ATIVO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'UPDATE CFOP SET ATIVO='#39'N'#39' where ativo is null;'
          ''
          'UPDATE CFOP SET MOV_ES='#39'S'#39' where MOV_ES is null;'
          ''
          
            'UPDATE CFOP SET OPERACAO='#39'I'#39' where substring(CODIGO from 1 for 1' +
            ')in(1,3,5);'
          ''
          
            'UPDATE CFOP SET OPERACAO='#39'E'#39' where substring(CODIGO from 1 for 1' +
            ')in(2,6,7);'
          ''
          
            'UPDATE CFOP SET TIPO='#39'E'#39' where substring(CODIGO from 1 for 1)in(' +
            '1,2,3);'
          ''
          
            'UPDATE CFOP SET TIPO='#39'S'#39' where substring(CODIGO from 1 for 1)in(' +
            '5,6,7);'
          ''
          'UPDATE CFOP SET ATIVO='#39'N'#39' where  ATIVO IS NULL;'
          ''
          
            'UPDATE CFOP SET ATIVO='#39'S'#39' where  (codigo=1101) or (Codigo=1102) ' +
            'or (codigo=2101) or (codigo=2102) or (codigo=5101)'
          
            'or (codigo=5102) or (codigo=5405) or (codigo=6101) or (codigo=61' +
            '02)or (codigo=1152) or (codigo=1202) or (codigo=2202)'
          
            'or (codigo=6201) or (codigo=6202)  or (codigo=1556)or (codigo=25' +
            '56) or (codigo=1910) or (codigo=2910) or'
          
            '(codigo=1949) or (codigo=2949) or (codigo=2201) or (codigo=5929)' +
            ' or (codigo=6929)or (codigo=6949);'
          ''
          'UPDATE CFOP SET mov_ES='#39'S'#39' where  mov_es is null;'
          ''
          
            'UPDATE CFOP SET mov_ES='#39'N'#39' where  (codigo=6929) or (codigo=5929)' +
            ';'
          ''
          ''
          'ALTER TABLE PRODUTO ADD ESTOQUE_INICIAL DECIMAL(15,3);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PRODUTO_COMPOSICAO ('
          '    FK_PRODUTO  INTEGER NOT NULL,'
          '    ID_PRODUTO  INTEGER NOT NULL,'
          '    QUANTIDADE  DECIMAL(15,3),'
          '    PRECO       DECIMAL(15,2),'
          '    TOTAL       DECIMAL(15,2)'
          ');'
          'COMMIT WORK;'
          
            'ALTER TABLE PRODUTO_COMPOSICAO ADD CONSTRAINT PK_PRODUTO_COMPOSI' +
            'CAO PRIMARY KEY (FK_PRODUTO, ID_PRODUTO);'
          'COMMIT WORK;'
          ''
          'CREATE trigger nfce_master_au0 for nfce_master'
          'active after update position 0'
          'AS'
          'begin'
          '  update nfce_detalhe set'
          '  nfce_detalhe.situacao=new.situacao'
          '  where'
          '  nfce_detalhe.fkvenda=old.codigo;'
          'end;'
          'COMMIT WORK;'
          ''
          'CREATE trigger nfce_detalhe_au0 for nfce_detalhe'
          'active after update position 0'
          'AS'
          'begin'
          ' if (NEW.SITUACAO IN ('#39'T'#39','#39'O'#39')) then begin'
          '  update produto set'
          '  e_medio = e_medio - new.qtd'
          '  where'
          '  codigo=new.id_produto;'
          ' end'
          'end;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD DESCONTO_PROD_PROMO VARCHAR(1);'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO ADD PRECO_PROMO_ATACADO DECIMAL(15,2);'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO ADD PRECO_PROMO_VAREJO DECIMAL(15,2);'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO ADD INICIO_PROMOCAO DATE;'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO ADD FIM_PROMOCAO DATE;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA ADD DATA_CADASTRO varchar(20);'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA ADD DATA_VALIDADE varchar(20);'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA ADD FLAG VARCHAR(10);'
          'COMMIT WORK;'
          'CREATE TABLE CONFIG (  VERSAO  INTEGER);'
          'COMMIT WORK;'
          'UPDATE config SET VERSAO=1 WHERE VERSAO IS NULL;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA  ADD  N_INICIAL_NFE              INTEGER;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA  ADD  N_INICIAL_NFCE             INTEGER;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA  ADD  CHECA_ESTOQUE_FISCAL       VARCHAR(1);'
          'COMMIT WORK;'
          'ALTER TABLE CAIXA ADD FK_DEVOLUCAO INTEGER;'
          'COMMIT WORK;'
          'ALTER TABLE TELAS ADD FLAG VARCHAR(1);'
          'COMMIT WORK;'
          'ALTER TABLE CONFIG ADD DATA_SCRIPT DATE;'
          'COMMIT WORK;'
          ''
          ''
          
            'update vendas_parametros  vp set vp.transportador_padrao=0 where' +
            ' vp.transportador_padrao is null;'
          'COMMIT WORK;'
          ''
          'update vendas_master set tipo='#39'V'#39' where tipo is null;'
          'COMMIT WORK;'
          ''
          
            'update forma_pagamento set dias=1 where codigo=5 and dias is nul' +
            'l;'
          
            'update forma_pagamento set dias=1 where codigo=6 and dias is nul' +
            'l;'
          ''
          'update produto set aplicacao ='#39#39' where aplicacao is null;'
          'COMMIT WORK;'
          ''
          ''
          
            'INSERT INTO TRANSPORTADORA (CODIGO, PESSOA, CNPJ, IE, NOME, APEL' +
            'IDO, ENDERECO, NUMERO, BAIRRO, COD_CIDADE,'
          'CIDADE, UF, CEP, PLACA, UFPLACA, RNTC, ATIVO, EMPRESA, RENAVAM)'
          
            '                    VALUES (0, '#39'F'#205'SICA'#39', '#39'000.000.000-00'#39', NULL,' +
            ' '#39'SEM TRANSPORTADOR'#39', '#39'SEM TRANSPORTADOR'#39', '#39'RUA TESTE'#39', '#39'S/N'#39','
          
            #39'TESTE'#39', 1505502, '#39'PARAGOMINAS'#39', '#39'PA'#39', '#39'00000000'#39', '#39#39', '#39'PA'#39', NUL' +
            'L, '#39'S'#39', 1, '#39#39');'
          'COMMIT WORK;'
          ''
          'UPDATE EMPRESA SET SITE=EMAIL;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA DROP EMAIL;'
          'COMMIT WORK;'
          'ALTER TABLE EMPRESA ADD EMAIL VARCHAR(100);'
          'COMMIT WORK;'
          'UPDATE EMPRESA SET EMAIL=SITE;'
          'COMMIT WORK;'
          'UPDATE EMPRESA SET SITE='#39#39';'
          'COMMIT WORK;'
          ''
          'UPDATE vendas_parametros CO SET'
          'CO.emailhost='#39'smtp.gmail.com'#39';'
          'commit work;'
          ''
          'UPDATE vendas_parametros CO SET'
          'CO.emailporta='#39'587'#39';'
          'commit work;'
          ''
          'UPDATE vendas_parametros CO SET'
          'CO.emailuser='#39'contanfejhm@gmail.com'#39';'
          'commit work;'
          ''
          'UPDATE vendas_parametros CO SET'
          ' CO.emailsenha='#39'Crisma81'#39';'
          'commit work;'
          ''
          'UPDATE vendas_parametros CO SET'
          'CO.emailssl='#39'N'#39';'
          'commit work;'
          ''
          'update empresa set lancar_cartao_credito='#39'S'#39';'
          'commit work;'
          ''
          ''
          'ALTER TABLE PRODUTO ALTER DESCRICAO TO DESCRICAO1;'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO ADD DESCRICAO VARCHAR(100);'
          'COMMIT WORK;'
          'UPDATE PRODUTO SET DESCRICAO=DESCRICAO1;'
          'COMMIT WORK;'
          'ALTER TABLE PRODUTO DROP DESCRICAO1;'
          'COMMIT WORK;'
          ''
          
            'INSERT INTO IBPT (CODIGO, EX, TIPO, DESCRICAO, NACIONALFEDERAL, ' +
            'IMPORTADOSFEDERAL, ESTADUAL, MUNICIPAL,'
          'VIGENCIAINICIO, VIGENCIAFIM, CHAVE, VERSAO, FONTE)'
          
            '          VALUES ('#39'00000000'#39', '#39#39', NULL, '#39'Diversos'#39', '#39'7'#39', '#39'12'#39', '#39 +
            '17'#39', '#39'0'#39', NULL, '#39'30/06/2018'#39', '#39'F3W1D7'#39', '#39'18.1.B'#39', '#39'IBPT'#39');'
          'COMMIT WORK;'
          ''
          'UPDATE PRODUTO SET descricao=upper(DESCRICAO);'
          'UPDATE PRODUTO SET descricao=TRIM(DESCRICAO);'
          'UPDATE PRODUTO SET APLICACAO='#39#39' WHERE APLICACAO IS NULL;'
          
            'UPDATE PRODUTO SET PRECO_VARIAVEL='#39'N'#39' WHERE PRECO_VARIAVEL IS NU' +
            'LL;'
          
            'UPDATE PRODUTO SET PAGA_COMISSAO='#39'N'#39' WHERE PAGA_COMISSAO IS NULL' +
            ';'
          
            'UPDATE EMPRESA SET ATUALIZA_PR_VENDA='#39'N'#39' WHERE ATUALIZA_PR_VENDA' +
            ' IS NULL;'
          
            'UPDATE EMPRESA SET TRANSPORTADORA='#39'N'#39' WHERE TRANSPORTADORA IS NU' +
            'LL;'
          'UPDATE EMPRESA SET TABELA_PRECO='#39'N'#39' WHERE TABELA_PRECO IS NULL;'
          'UPDATE EMPRESA SET AUTOPECAS='#39'N'#39' WHERE AUTOPECAS IS NULL;'
          ''
          ''
          '')
        TabOrder = 0
      end
    end
    object TabSheet12: TTabSheet
      Caption = '31/12/2018'
      ImageIndex = 11
      object Memo8: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'CREATE TABLE OS_MASTER ('
          '    CODIGO              INTEGER NOT NULL,'
          '    DATA_INICIO         DATE NOT NULL,'
          '    HORA_INICIO         TIME NOT NULL,'
          '    PREVISAO_ENTREGA    DATE,'
          '    DATA_TERMINO        DATE,'
          '    HORA_TERMINO        TIME,'
          '    DATA_ENTREGA        DATE,'
          '    HORA_ENTREGA        TIME,'
          '    FK_ATENDENDE        INTEGER,'
          '    PROBLEMA            BLOB SUB_TYPE 1 SEGMENT SIZE 32,'
          '    OBSERVACOES         BLOB SUB_TYPE 1 SEGMENT SIZE 32,'
          '    FK_EMPRESA          INTEGER,'
          '    FK_USUARIO          INTEGER,'
          '    DOCUMENTO           VARCHAR(20),'
          '    NOME                VARCHAR(50),'
          '    FONE1               VARCHAR(14),'
          '    FONE2               VARCHAR(14),'
          '    SITUACAO            VARCHAR(1),'
          '    NUMERO_SERIE        VARCHAR(30),'
          '    DESCRICAO           VARCHAR(60),'
          '    MODELO              VARCHAR(30),'
          '    MARCA               VARCHAR(30),'
          '    ANO                 INTEGER,'
          '    PLACA               VARCHAR(7),'
          '    KM                  DECIMAL(15,2),'
          '    SUBTOTAL            DECIMAL(15,2),'
          '    SUBTOTAL_PECAS      DECIMAL(15,2),'
          '    SUBTOTAL_SERVICOS   DECIMAL(15,2),'
          '    VL_DESC_PECAS       DECIMAL(15,2),'
          '    VL_DESC_SERVICOS    DECIMAL(15,2),'
          '    DESC_PERC_PECAS     DECIMAL(15,2),'
          '    DESC_PERC_SERVICOS  DECIMAL(15,2),'
          '    TOTAL_SERVICOS      DECIMAL(15,4),'
          '    TOTAL_PRODUTOS      DECIMAL(15,4),'
          '    TOTAL_GERAL         DECIMAL(15,4),'
          '    ENDERECO            VARCHAR(50),'
          '    BAIRRO              VARCHAR(35),'
          '    CIDADE              VARCHAR(35),'
          '    UF                  VARCHAR(50),'
          '    DATA_EMISSAO        DATE'
          ');'
          
            'ALTER TABLE OS_MASTER ADD CONSTRAINT PK_OS_MASTER PRIMARY KEY (C' +
            'ODIGO);'
          ''
          'CREATE TABLE OS_DETALHE ('
          '    CODIGO          INTEGER NOT NULL,'
          '    FK_OS_MASTER    INTEGER NOT NULL,'
          '    FK_FUNCIONARIO  INTEGER NOT NULL,'
          '    FK_PRODUTO      INTEGER,'
          '    DATA_INICIO     DATE,'
          '    HORA_INICIO     TIME,'
          '    DATA_TERMINO    DATE,'
          '    HORA_TERMINO    TIME,'
          '    DISCRIMINACAO   VARCHAR(50),'
          '    QTD             DECIMAL(15,3),'
          '    PRECO           DECIMAL(15,4),'
          '    TOTAL           DECIMAL(15,4),'
          '    FK_USUARIO      INTEGER,'
          '    FK_EMPRESA      INTEGER,'
          '    TIPO            VARCHAR(1),'
          '    SITUACAO        VARCHAR(10)'
          ');'
          ''
          
            'ALTER TABLE OS_DETALHE ADD CONSTRAINT PK_OS_DETALHE PRIMARY KEY ' +
            '(CODIGO);'
          
            'ALTER TABLE OS_DETALHE ADD CONSTRAINT FK_OS_DETALHE_1 FOREIGN KE' +
            'Y (FK_OS_MASTER) REFERENCES OS_MASTER'
          '(CODIGO) ON DELETE CASCADE;'
          ''
          ''
          'ALTER TABLE PESSOA ADD TECNICO VARCHAR(1);'
          'ALTER TABLE PESSOA ADD ATENDENTE VARCHAR(1);'
          ''
          ''
          ''
          ''
          'CREATE TABLE MDFE_PERCURSO ('
          '    CODIGO          INTEGER NOT NULL,'
          '    FK_MDFE_MASTER  INTEGER,'
          '    UF              VARCHAR(2)'
          ');'
          ''
          
            'ALTER TABLE MDFE_PERCURSO ADD CONSTRAINT PK_MDFE_PERCURSO PRIMAR' +
            'Y KEY (CODIGO);'
          
            'ALTER TABLE MDFE_PERCURSO ADD CONSTRAINT FK_MDFE_PERCURSO_1 FORE' +
            'IGN KEY (FK_MDFE_MASTER) REFERENCES'
          'MDFE_MASTER (CODIGO) ON DELETE CASCADE;'
          ''
          'ALTER TABLE OS_MASTER ADD NOME VARCHAR(50);'
          'ALTER TABLE OS_MASTER ADD ENDERECO VARCHAR(50);'
          'ALTER TABLE OS_MASTER ADD NUMERO VARCHAR(10);'
          'ALTER TABLE OS_MASTER ADD BAIRRO VARCHAR(35);'
          'ALTER TABLE OS_MASTER ADD CIDADE VARCHAR(35);'
          'ALTER TABLE OS_MASTER ADD UF VARCHAR(50);'
          'ALTER TABLE OS_MASTER ADD FONE1 VARCHAR(14);'
          'ALTER TABLE OS_MASTER ADD FONE2 VARCHAR(14);'
          ''
          ''
          'CREATE TABLE MDFE_ENCERRAR ('
          '    CHAVE       VARCHAR(44) NOT NULL,'
          '    PROTOCOLO   VARCHAR(20),'
          '    FK_EMPRESA  INTEGER'
          ');'
          ''
          
            'ALTER TABLE MDFE_ENCERRAR ADD CONSTRAINT PK_MDFE_ENCERRAR PRIMAR' +
            'Y KEY (CHAVE);'
          ''
          ''
          'CREATE TABLE MDFE_MASTER ('
          '    CODIGO            INTEGER NOT NULL,'
          '    FK_TRANSPORTADOR  INTEGER NOT NULL,'
          '    NUMERO_MDFE       INTEGER,'
          '    DATA              DATE,'
          '    ID_MUNICIPIO      VARCHAR(10) NOT NULL,'
          '    UF_INICIO         VARCHAR(2),'
          '    UF_FIM            VARCHAR(2) NOT NULL,'
          '    QTD_CTE           INTEGER NOT NULL,'
          '    VALOR_CARGA       DECIMAL(15,2) NOT NULL,'
          '    UNIDADE_CARGA     VARCHAR(2) NOT NULL,'
          '    QTD_CARGA         DECIMAL(15,3),'
          '    FK_EMPRESA        SMALLINT,'
          '    INFCPL            BLOB SUB_TYPE 1 SEGMENT SIZE 60,'
          '    INFADFISCO        BLOB SUB_TYPE 1 SEGMENT SIZE 60,'
          '    CHAVE             VARCHAR(45),'
          '    PROTOCOLO         VARCHAR(30),'
          '    XML               BLOB SUB_TYPE 1 SEGMENT SIZE 80,'
          '    DATA_EMISSAO      DATE,'
          '    SITUACAO          VARCHAR(1),'
          '    RESP_SEGURO       SMALLINT,'
          '    TIPO_MDFE         VARCHAR(10),'
          '    TIPO              VARCHAR(10),'
          '    NOME_SEGURADORA   VARCHAR(50),'
          '    CPF_SEGURADORA    VARCHAR(20),'
          '    NUMERO_APOLICE    VARCHAR(30)'
          ');'
          ''
          
            'ALTER TABLE MDFE_MASTER ADD CONSTRAINT PK_MDFE_MASTER PRIMARY KE' +
            'Y (CODIGO);'
          ''
          'CREATE TABLE MDFE_DETALHE ('
          '    CODIGO           INTEGER NOT NULL,'
          '    FK_MDFE_MASTER   INTEGER NOT NULL,'
          '    CHAVE            VARCHAR(45) NOT NULL,'
          '    VALOR            DECIMAL(15,2),'
          '    PESO             DECIMAL(15,3),'
          '    NUMERO           INTEGER,'
          '    FK_DESTINATARIO  INTEGER,'
          '    FK_EMPRESA       INTEGER,'
          '    FK_USUARIO       INTEGER'
          ');'
          ''
          
            'ALTER TABLE MDFE_DETALHE ADD CONSTRAINT PK_MDFE_DETALHE PRIMARY ' +
            'KEY (CODIGO);'
          ''
          
            'ALTER TABLE MDFE_DETALHE ADD CONSTRAINT FK_MDFE_DETALHE_1 FOREIG' +
            'N KEY (FK_MDFE_MASTER) REFERENCES'
          'MDFE_MASTER (CODIGO) ON DELETE CASCADE;'
          ''
          ''
          ''
          'CREATE TABLE CTE_MASTER ('
          '    CODIGO            INTEGER NOT NULL,'
          '    FKEMPRESA         INTEGER NOT NULL,'
          '    NUMERO            INTEGER,'
          '    CHAVE             VARCHAR(50),'
          '    CFOP              INTEGER,'
          '    MODELO            INTEGER,'
          '    SERIE             INTEGER,'
          '    CODMUNENVIO       INTEGER,'
          '    MUNICIPIOENVIO    VARCHAR(40),'
          '    UFENVIO           VARCHAR(2),'
          '    TIPOSERVICO       INTEGER,'
          '    CODMUNINI         INTEGER,'
          '    MUNICIPIOINI      VARCHAR(40),'
          '    UFINI             VARCHAR(2),'
          '    CODMUNFIM         INTEGER,'
          '    MINICIPIOFIM      VARCHAR(40),'
          '    UFFIM             VARCHAR(2),'
          '    TOTAL             DECIMAL(15,2),'
          '    RECEBIDO          DECIMAL(15,2),'
          '    VPIS              DECIMAL(15,2),'
          '    VCOFINS           DECIMAL(15,2),'
          '    VINSS             DECIMAL(15,2),'
          '    VIR               DECIMAL(15,2),'
          '    VCLSS             DECIMAL(15,2),'
          '    VTOTTIRB          DECIMAL(15,2),'
          '    DESCRICAOSERVICO  VARCHAR(120),'
          '    QTD               DECIMAL(15,3),'
          '    RESPSEG           INTEGER,'
          '    XSEG              VARCHAR(50),'
          '    NAPOLICE          VARCHAR(20),'
          '    TAF               VARCHAR(20),'
          '    NROREGESTADUAL    VARCHAR(30),'
          '    TIPO              VARCHAR(10),'
          '    SITUACAO          VARCHAR(1),'
          '    FKTOMADOR         INTEGER,'
          '    FKTRANSPORTADOR   INTEGER,'
          '    PROTOCOLO         VARCHAR(20),'
          '    XML               BLOB SUB_TYPE 1 SEGMENT SIZE 16,'
          '    DATA              DATE,'
          '    HORA              TIME,'
          '    FINALIDADE        INTEGER,'
          '    DOCUMENTO         VARCHAR(1),'
          '    DATA_ENTREGA      DATE,'
          '    TOMADOR           VARCHAR(15),'
          '    FK_DESTINATARIO   INTEGER,'
          '    FK_VEICULO        VARCHAR(7),'
          '    OBS_FISCO         BLOB SUB_TYPE 1 SEGMENT SIZE 16,'
          '    OBS_CONTRIBUINTE  BLOB SUB_TYPE 1 SEGMENT SIZE 16,'
          '    VALOR_SERVICO     DECIMAL(15,2),'
          '    VALOR_CARGA       DECIMAL(15,2),'
          '    CST_ICMS          VARCHAR(3),'
          '    ALIQUOTA_ICMS     DECIMAL(15,2),'
          '    BASE_ICMS         DECIMAL(15,2),'
          '    VALOR_ICMS        DECIMAL(15,2),'
          '    OUTROS_TRIBUTOS   DECIMAL(15,2),'
          '    PESOL             DECIMAL(15,4),'
          '    PESOB             DECIMAL(15,4),'
          '    METRAGEM          VARCHAR(3)'
          ');'
          ''
          
            'ALTER TABLE CTE_MASTER ADD CONSTRAINT PK_CTE_MASTER PRIMARY KEY ' +
            '(CODIGO);'
          ''
          'CREATE TABLE CTE_DETALHE ('
          '    CODIGO           INTEGER NOT NULL,'
          '    FK_CTE_MASTER    INTEGER,'
          '    NUMERO           INTEGER,'
          '    CHAVE            VARCHAR(44),'
          '    PRECO            DECIMAL(15,2),'
          '    QTD              DECIMAL(15,3),'
          '    TOTAL            DECIMAL(15,2),'
          '    UNIDADE          VARCHAR(3),'
          '    FK_DESTINATARIO  INTEGER,'
          '    DESCRICAO        VARCHAR(100)'
          ');'
          ''
          ''
          
            'ALTER TABLE CTE_DETALHE ADD CONSTRAINT PK_CTE_DETALHE PRIMARY KE' +
            'Y (CODIGO);'
          ''
          ''
          
            'ALTER TABLE CTE_DETALHE ADD CONSTRAINT FK_CTE_DETALHE_1 FOREIGN ' +
            'KEY (FK_CTE_MASTER) REFERENCES CTE_MASTER'
          '(CODIGO) ON DELETE CASCADE;'
          
            'ALTER TABLE CTE_DETALHE ADD CONSTRAINT FK_CTE_DETALHE_2 FOREIGN ' +
            'KEY (FK_DESTINATARIO) REFERENCES PESSOA'
          '(CODIGO);'
          ''
          ''
          'CREATE TABLE CTE_CARTA ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FK_CTE      INTEGER,'
          '    SEQUENCIA   INTEGER,'
          '    FK_EMPRESA  INTEGER,'
          '    FK_USUARIO  INTEGER,'
          '    DATA        DATE,'
          '    CORRECAO    BLOB SUB_TYPE 1 SEGMENT SIZE 80'
          ');'
          ''
          ''
          
            'ALTER TABLE CTE_CARTA ADD CONSTRAINT PK_CTE_CARTA PRIMARY KEY (C' +
            'ODIGO);'
          
            'ALTER TABLE CTE_CARTA ADD CONSTRAINT FK_CTE_CARTA_1 FOREIGN KEY ' +
            '(FK_CTE) REFERENCES CTE_MASTER (CODIGO) ON'
          'DELETE CASCADE;'
          ''
          ''
          ''
          'ALTER TABLE MDFE_MASTER ADD RESP_SEGURO SMALLINT;'
          'ALTER TABLE MDFE_MASTER ADD TIPO_MDFE VARCHAR(10);'
          'ALTER TABLE MDFE_MASTER ADD TIPO VARCHAR(10);'
          'ALTER TABLE MDFE_MASTER ADD NOME_SEGURADORA VARCHAR(50);'
          'ALTER TABLE MDFE_MASTER ADD CPF_SEGURADORA VARCHAR(20);'
          'ALTER TABLE MDFE_MASTER ADD NUMERO_APOLICE VARCHAR(30);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_PATH_SCHEMA VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_PATH_SALVAR VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_PATH_EVENTO VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_PATH_MDFE VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_PATH_PDF VARCHAR(100);'
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_VERSAO SMALLINT;'
          ''
          ''
          'CREATE TABLE CTE_DESTINATARIO ('
          '    CODIGO      INTEGER NOT NULL,'
          '    NOME        VARCHAR(50),'
          '    ENDERECO    VARCHAR(50),'
          '    NUMERO      VARCHAR(10),'
          '    BAIRRO      VARCHAR(35),'
          '    ID_CIDADE   INTEGER,'
          '    CIDADE      VARCHAR(35),'
          '    CEP         VARCHAR(8),'
          '    UF          VARCHAR(2),'
          '    PESSOA      VARCHAR(10),'
          '    CNPJ        VARCHAR(20),'
          '    IE          VARCHAR(20),'
          '    FONE        VARCHAR(12),'
          '    FK_EMPRESA  INTEGER,'
          '    FK_USUARIO  INTEGER,'
          '    ATIVO       INTEGER'
          ');'
          ''
          
            'ALTER TABLE CTE_DESTINATARIO ADD CONSTRAINT PK_CTE_DESTINATARIO ' +
            'PRIMARY KEY (CODIGO);'
          ''
          ''
          ''
          'CREATE TABLE CTE_REMETENTE ('
          '    CODIGO      INTEGER NOT NULL,'
          '    NOME        VARCHAR(50),'
          '    ENDERECO    VARCHAR(50),'
          '    NUMERO      VARCHAR(10),'
          '    BAIRRO      VARCHAR(35),'
          '    ID_CIDADE   INTEGER,'
          '    CIDADE      VARCHAR(35),'
          '    CEP         VARCHAR(8),'
          '    UF          VARCHAR(2),'
          '    PESSOA      VARCHAR(10),'
          '    CNPJ        VARCHAR(20),'
          '    IE          VARCHAR(20),'
          '    FONE        VARCHAR(12),'
          '    FK_EMPRESA  INTEGER,'
          '    FK_USUARIO  INTEGER,'
          '    ATIVO       INTEGER'
          ');'
          ''
          ''
          
            'ALTER TABLE CTE_REMETENTE ADD CONSTRAINT PK_CTE_REMETENTE PRIMAR' +
            'Y KEY (CODIGO);'
          ''
          'ALTER TABLE VEICULOS_CAVALO ADD CARROCERIA INTEGER;'
          ''
          'ALTER TABLE EMPRESA ADD ULTIMONSU VARCHAR(30);'
          'UPDATE EMPRESA SET ULTIMONSU='#39'0'#39' WHERE ULTIMONSU IS NULL;'
          ''
          'ALTER TABLE PRODUTO ADD PR_CUSTO2 DECIMAL(15,2);'
          'ALTER TABLE PRODUTO ADD PERC_CUSTO DECIMAL(15,2);'
          ''
          'UPDATE PRODUTO SET PR_CUSTO2=PR_CUSTO WHERE PR_CUSTO2 IS NULL;'
          'UPDATE PRODUTO SET PERC_CUSTO=0 WHERE PERC_CUSTO IS NULL;'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE CTE_MASTER ADD OBS_FISCO BLOB SUB_TYPE 1 SEGMENT SIZ' +
            'E 16;'
          
            'ALTER TABLE CTE_MASTER ADD OBS_CONTRIBUINTE BLOB SUB_TYPE 1 SEGM' +
            'ENT SIZE 16;'
          ''
          'ALTER TABLE SPED_CONFIG ADD REGIME_TRIBUTARIO VARCHAR(1);'
          ''
          'ALTER TABLE CTE_MASTER ADD VALOR_SERVICO DECIMAL(15,2);'
          ''
          'ALTER TABLE CTE_MASTER ADD VALOR_CARGA DECIMAL(15,2);'
          ''
          'ALTER TABLE CTE_MASTER ADD CST_ICMS VARCHAR(3);'
          'ALTER TABLE CTE_MASTER ADD ALIQUOTA_ICMS DECIMAL(15,2);'
          'ALTER TABLE CTE_MASTER ADD BASE_ICMS DECIMAL(15,2);'
          'ALTER TABLE CTE_MASTER ADD VALOR_ICMS DECIMAL(15,2);'
          'ALTER TABLE CTE_MASTER ADD OUTROS_TRIBUTOS DECIMAL(15,2);'
          ''
          'ALTER TABLE CTE_MASTER ADD PESOL DECIMAL(15,4);'
          'ALTER TABLE CTE_MASTER ADD PESOB DECIMAL(15,4);'
          ''
          ''
          'ALTER TABLE NFE_CARTA ADD FK_USUARIO INTEGER;'
          ''
          'ALTER TABLE CTE_MASTER ADD METRAGEM VARCHAR(3);'
          ''
          'ALTER TABLE SPED_CONFIG ADD REGIME_TRIBUTARIO varchar(1);'
          ''
          'ALTER TABLE EMPRESA ADD CHECA VARCHAR(1);'
          'ALTER TABLE VENDAS_PARAMETROS ADD PATH_SALVAR_CTE VARCHAR(100);'
          ''
          'CREATE TABLE SPED ('
          '    codigo        INTEGER NOT NULL,'
          '    DATA_INI      DATE,'
          '    DATA_FIM      DATE,'
          '    DTEMISSAO     DATE,'
          '    REMESSA       VARCHAR(1),'
          '    SEMMOVIMENTO  VARCHAR(1),'
          '    RECIBO        VARCHAR(41),'
          '    FK_CONTADOR    integer,'
          '    FK_EMPRESA     integer,'
          '    fk_usuario    integer'
          ');'
          ''
          ''
          'ALTER TABLE SPED ADD CONSTRAINT SPED_PKEY PRIMARY KEY (codigo);'
          ''
          'CREATE TABLE CONTADOR ('
          '    codigo   SMALLINT NOT NULL,'
          '    NOME         VARCHAR(50),'
          '    CNPJ         VARCHAR(15),'
          '    CPF          VARCHAR(11),'
          '    CRC          VARCHAR(10),'
          '    ENDERECO     VARCHAR(50),'
          '    NUMERO       VARCHAR(10),'
          '    COMPLEMENTO  VARCHAR(40),'
          '    CEP          VARCHAR(8),'
          '    BAIRRO       VARCHAR(40),'
          '    COD_MUN      INTEGER,'
          '    FONE         VARCHAR(12),'
          '    FAX          VARCHAR(12),'
          '    EMAIL        VARCHAR(70),'
          '    UF           VARCHAR(2),'
          '    fk_usuario   integer,'
          '    fk_empresa   integer'
          ''
          ');'
          ''
          
            'ALTER TABLE CONTADOR ADD CONSTRAINT CONTADOR_PKEY PRIMARY KEY (c' +
            'odigo);'
          ''
          'CREATE TABLE SPED_CONFIG ('
          '    FK_EMPRESA             INTEGER NOT NULL,'
          '    IND_PERFIL             VARCHAR(1),'
          '    IND_ATIV               VARCHAR(1),'
          '    IND_EXP                VARCHAR(1),'
          '    IND_CCRF               VARCHAR(1),'
          '    IND_COMB               VARCHAR(1),'
          '    IND_USINA              VARCHAR(1),'
          '    IND_VA                 VARCHAR(1),'
          '    IND_EE                 VARCHAR(1),'
          '    IND_CART               VARCHAR(1),'
          '    IND_FORM               VARCHAR(1),'
          '    IND_AER                VARCHAR(1),'
          '    COD_INC_TRIB           VARCHAR(1),'
          '    IND_APRO_CRED          VARCHAR(1),'
          '    COD_TIPO_CONT          VARCHAR(1),'
          '    COD_REGIME_TRIBUTARIO  VARCHAR(1),'
          '    IND_REG_CUM            VARCHAR(1),'
          '    FK_USUARIO             INTEGER'
          ');'
          ''
          
            'ALTER TABLE SPED_CONFIG ADD CONSTRAINT PK_SPED_CONFIG PRIMARY KE' +
            'Y (FK_EMPRESA);'
          ''
          
            'ALTER TABLE SPED_CONFIG ADD CONSTRAINT FK_SPED_CONFIG_1 FOREIGN ' +
            'KEY (FK_EMPRESA) REFERENCES EMPRESA '
          '(CODIGO)'
          'ON DELETE CASCADE;'
          ''
          ''
          'CREATE TABLE SPED_PARTICIPANTES ('
          '    CODIGO           INTEGER NOT NULL,'
          '    COD_PART         INTEGER,'
          '    NOME             VARCHAR(50),'
          '    COD_PAIS         VARCHAR(6),'
          '    CNPJ             VARCHAR(15),'
          '    CPF              VARCHAR(11),'
          '    IE               VARCHAR(20),'
          '    COD_MUN          INTEGER,'
          '    ENDERECO         VARCHAR(50),'
          '    NUMERO           VARCHAR(10),'
          '    COMPLEMENTO      VARCHAR(40),'
          '    BAIRRO           VARCHAR(40),'
          '    FK_SPED           INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ');'
          ''
          
            'ALTER TABLE SPED_PARTICIPANTES ADD CONSTRAINT PARTICIPANTES_PKEY' +
            ' PRIMARY KEY (CODIGO);'
          ''
          'CREATE TABLE SPED_PRODUTOS ('
          '    CODIGO    INTEGER NOT NULL,'
          '    FK_PRODUTO  INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(120),'
          '    COD_BARRA  VARCHAR(20),'
          '    TIPO_ITEM  VARCHAR(20),'
          '    COD_NCM    VARCHAR(10),'
          '    ALIQ_ICMS  NUMERIC(15,2),'
          '    FK_UNIDADE  SMALLINT,'
          '    FK_SPED     INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ''
          ');'
          ''
          ''
          
            'ALTER TABLE SPED_PRODUTOS ADD CONSTRAINT PRODUTOS_PKEY PRIMARY K' +
            'EY (CODIGO);'
          ''
          ''
          ''
          ''
          'CREATE TABLE SPED_C100 ('
          '    CODIGO           INTEGER NOT NULL,'
          '    IND_OPER         VARCHAR(1),'
          '    IND_EMIT         VARCHAR(1),'
          '    COD_MOD          VARCHAR(2),'
          '    COD_SIT          VARCHAR(2),'
          '    SER              VARCHAR(2),'
          '    NUM_DOC          INTEGER,'
          '    CHV_NFE          VARCHAR(50),'
          '    DT_DOC           DATE,'
          '    DT_E_S           DATE,'
          '    VL_DOC           NUMERIC(15,2),'
          '    IND_PGTO         VARCHAR(1),'
          '    VL_DESC          NUMERIC(15,2),'
          '    VL_ABAT_NT       NUMERIC(15,2),'
          '    VL_MERC          NUMERIC(15,2),'
          '    IND_FRT          NUMERIC(15,2),'
          '    VL_SEGURO        NUMERIC(15,2),'
          '    VL_OUT_DA        NUMERIC(15,2),'
          '    VL_BC_ICMS       NUMERIC(15,2),'
          '    VL_ICMS          NUMERIC(15,2),'
          '    VL_BC_ICMS_ST    NUMERIC(15,2),'
          '    VL_ICMS_ST       NUMERIC(15,2),'
          '    VL_IPI           NUMERIC(15,2),'
          '    VL_PIS           NUMERIC(15,2),'
          '    VL_COFINS        NUMERIC(15,2),'
          '    VL_PIS_ST        NUMERIC(15,2),'
          '    VL_COFINS_ST     NUMERIC(15,2),'
          '    VL_FRETE         NUMERIC(15,2),'
          '    FK_PARTICIPANTES  INTEGER,'
          '    FK_SPED           INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ');'
          ''
          
            'ALTER TABLE SPED_C100 ADD CONSTRAINT IDREC100 PRIMARY KEY (CODIG' +
            'O);'
          ''
          'CREATE TABLE SPED_C170 ('
          '    CODIGO         INTEGER NOT NULL,'
          '    DESCRICAO         VARCHAR(120),'
          '    QTD               NUMERIC(15,4),'
          '    VL_ITEM           NUMERIC(15,2),'
          '    VL_DESC           NUMERIC(15,2),'
          '    IND_MOV           VARCHAR(1),'
          '    CFOP              VARCHAR(4),'
          '    CST_ICMS          VARCHAR(3),'
          '    COD_NAT           VARCHAR(10),'
          '    VL_BC_ICMS        NUMERIC(15,2),'
          '    ALIQ_ICM          NUMERIC(15,2),'
          '    VL_ICMS           NUMERIC(15,2),'
          '    VL_BC_ICMS_ST     NUMERIC(15,2),'
          '    ALIQ_ST           NUMERIC(15,2),'
          '    VL_ICMS_ST        NUMERIC(15,2),'
          '    IND_APUR          VARCHAR(1),'
          '    CST_IPI           VARCHAR(3),'
          '    COD_ENQ           VARCHAR(10),'
          '    VL_BC_IPI         NUMERIC(15,2),'
          '    ALIQ_IPI          NUMERIC(15,2),'
          '    VL_IPI            NUMERIC(15,2),'
          '    CST_PIS           VARCHAR(3),'
          '    VL_BC_PIS         NUMERIC(15,2),'
          '    ALIQ_PIS_PERC     NUMERIC(15,4),'
          '    QUANT_BC_PIS      NUMERIC(15,4),'
          '    ALIQ_PIS_R        NUMERIC(15,2),'
          '    VL_PIS            NUMERIC(15,2),'
          '    CST_COFINS        VARCHAR(3),'
          '    VL_BC_COFINS      NUMERIC(15,2),'
          '    ALIQ_COFINS_PERC  NUMERIC(15,4),'
          '    QUANT_BC_COFINS   NUMERIC(15,4),'
          '    ALIQ_COFINS_R     NUMERIC(15,2),'
          '    VL_COFINS         NUMERIC(15,2),'
          '    COD_CTA           VARCHAR(10),'
          '    VL_OPR            NUMERIC(15,2),'
          '    FK_PRODUTO         INTEGER,'
          '    FK_UNIDADE         INTEGER,'
          '    FK_C100          INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ');'
          ''
          
            'ALTER TABLE SPED_C170 ADD CONSTRAINT REGC170_PKEY PRIMARY KEY (C' +
            'ODIGO);'
          ''
          ''
          ''
          'CREATE TABLE SPED_C190 ('
          '    CODIGO      INTEGER NOT NULL,'
          '    CST_ICMS       VARCHAR(3),'
          '    ALIQ_ICMS      NUMERIC(15,2),'
          '    VL_OPR         NUMERIC(15,2),'
          '    VL_BC_ICMS     NUMERIC(15,2),'
          '    VL_ICMS        NUMERIC(15,2),'
          '    VL_BC_ICMS_ST  NUMERIC(15,2),'
          '    VL_ICMS_ST     NUMERIC(15,2),'
          '    VL_RED_BC      NUMERIC(15,2),'
          '    VL_IPI         NUMERIC(15,2),'
          '    COD_OBS        VARCHAR(100),'
          '    CFOP           VARCHAR(4),'
          '    FK_C100       INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ''
          ');'
          ''
          
            'ALTER TABLE SPED_C190 ADD CONSTRAINT REGC190_PKEY PRIMARY KEY (C' +
            'ODIGO);'
          ''
          'CREATE TABLE SPED_H005 ('
          '    CODIGO  INTEGER NOT NULL,'
          '    DT_INV    NUMERIC(15,2),'
          '    VL_INV    NUMERIC(15,2),'
          '    FK_SPED    INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ''
          ');'
          ''
          
            'ALTER TABLE SPED_H005 ADD CONSTRAINT REGH005_PKEY PRIMARY KEY (C' +
            'ODIGO);'
          ''
          'CREATE TABLE SPED_H010 ('
          '    CODIGO  INTEGER NOT NULL,'
          '    QTD        NUMERIC(15,4),'
          '    VL_UNIT    NUMERIC(15,2),'
          '    VL_ITEM    NUMERIC(15,2),'
          '    IND_PROP   VARCHAR(1),'
          '    COD_PART   INTEGER,'
          '    TXT_COMPL  VARCHAR(100),'
          '    COD_CTA    VARCHAR(10),'
          '    FK_H005    INTEGER,'
          '    FK_PRODUTO  INTEGER,'
          '    FK_UNIDADE  INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ''
          ');'
          ''
          
            'ALTER TABLE SPED_H010 ADD CONSTRAINT REGH010_PKEY PRIMARY KEY (C' +
            'ODIGO);'
          ''
          ''
          'CREATE TABLE SPED_UNIDADE ('
          '    CODIGO  INTEGER NOT NULL,'
          '    UNIDADE    VARCHAR(3) NOT NULL,'
          '    DESCRICAO  VARCHAR(20),'
          '    FK_SPED     INTEGER,'
          '    FK_EMPRESA             integer,'
          '    FK_USUARIO             INTEGER'
          ''
          ');'
          ''
          ''
          ''
          
            'ALTER TABLE SPED_UNIDADE ADD CONSTRAINT UNIDADES_PKEY PRIMARY KE' +
            'Y (CODIGO);'
          ''
          'ALTER TABLE COMPRA_ITENS ADD CST_PIS VARCHAR(3);'
          'ALTER TABLE COMPRA_ITENS ADD CST_cof VARCHAR(3);'
          'ALTER TABLE COMPRA_ITENS ADD CST_ipi VARCHAR(3);'
          'ALTER TABLE COMPRA_ITENS ADD aliq_st decimal(15,2);'
          'ALTER TABLE SPED_C100 ADD TABELA VARCHAR(10);'
          'ALTER TABLE SPED_C100 ADD TABELA_CODIGO INTEGER;'
          'ALTER TABLE NFE_DETALHE ADD ALIQ_ICMS_ST DECIMAL(15,2);'
          ''
          ''
          
            'UPDATE OR INSERT INTO SPED_CONFIG (FK_EMPRESA, IND_PERFIL, IND_A' +
            'TIV, IND_EXP, IND_CCRF, IND_COMB, IND_USINA,'
          
            'IND_VA, IND_EE, IND_CART, IND_FORM, IND_AER, COD_INC_TRIB, IND_A' +
            'PRO_CRED, COD_TIPO_CONT,'
          'COD_REGIME_TRIBUTARIO, IND_REG_CUM, FK_USUARIO)'
          
            '                           VALUES (1, '#39'A'#39', '#39'O'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39 +
            'N'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39'N'#39', '#39'2'#39', '#39'1'#39', '#39'1'#39', '#39'R'#39', '#39'1'#39', NULL)'
          '                         MATCHING (FK_EMPRESA);'
          ''
          'ALTER TABLE COMPRA_ITENS ADD FK_USUARIO INTEGER;'
          ''
          'ALTER TABLE UNIDADE ADD FK_USUARIO INTEGER;'
          ''
          'UPDATE OR INSERT INTO GRUPO (EMPRESA, CODIGO, DESCRICAO, ATIVO)'
          '                     VALUES (1, 0, '#39'SELECIONE GRUPO'#39', '#39'S'#39')'
          '                   MATCHING (EMPRESA, CODIGO);'
          ''
          'CREATE TABLE VEICULO_TIPO ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(30)'
          ');'
          ''
          
            'ALTER TABLE VEICULO_TIPO ADD CONSTRAINT PK_VEICULO_TIPO PRIMARY ' +
            'KEY (CODIGO);'
          ''
          ''
          'CREATE TABLE VEICULO_CARROCERIA ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(30)'
          ');'
          ''
          
            'ALTER TABLE VEICULO_CARROCERIA ADD CONSTRAINT PK_VEICULO_CARROCE' +
            'RIA PRIMARY KEY (CODIGO);'
          ''
          'ALTER TABLE CTE_MASTER ADD FK_REMETENTE INTEGER;'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD CTE_PIS DECIMAL(15,2);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD CTE_COFINS DECIMAL(15,2);'
          ''
          'ALTER TABLE CTE_MASTER ADD CHAVE_REFERENCIADA VARCHAR(44);'
          ''
          'ALTER TABLE CTE_MASTER ADD NAVERBACAO VARCHAR(20);'
          ''
          'ALTER TABLE CTE_MASTER ADD CNPJ_SEGURADORA VARCHAR(20);'
          ''
          'ALTER TABLE MDFE_MASTER ADD PLACA VARCHAR(7);'
          ''
          'ALTER TABLE MDFE_MASTER ADD ID_ORIGEM INTEGER;'
          ''
          'ALTER TABLE MDFE_MASTER ADD ID_DESTINO INTEGER;'
          ''
          'ALTER TABLE MDFE_MASTER ADD CARGA_PROPRIA VARCHAR(1);'
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD MDFE_SERIE SMALLINT;'
          ''
          ''
          'ALTER TABLE VENDAS_PARAMETROS ADD CTE_ALIQ_PIS DECIMAL(15,2);'
          'ALTER TABLE VENDAS_PARAMETROS ADD CTE_ALIQ_COF DECIMAL(15,2);'
          ''
          'ALTER TABLE TRANSPORTADORA ADD MOTORISTA VARCHAR(50);'
          'ALTER TABLE TRANSPORTADORA ADD CPF_MOTORISTA VARCHAR(20);'
          ''
          'ALTER TABLE MDFE_MASTER ADD CNPJ_RESPONSAVEL VARCHAR(20);'
          'ALTER TABLE MDFE_MASTER ADD NUMERO_AVERBACAO VARCHAR(30);'
          ''
          'ALTER TABLE OS_MASTER ADD SUBTOTAL_PECAS DECIMAL(15,2);'
          'ALTER TABLE OS_MASTER ADD SUBTOTAL_SERVICOS DECIMAL(15,2);'
          ''
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (0, '#39'N'#227'o Aplicavel'#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (1, '#39'Truck'#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (2, '#39'Toco'#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (3, '#39'Cavalo Mec'#226'nico'#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (4, '#39'Van '#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (5, '#39'Utilit'#225'rios'#39');'
          'INSERT INTO VEICULO_TIPO (CODIGO, DESCRICAO)'
          '                  VALUES (6, '#39'Outros'#39');'
          ''
          'COMMIT WORK;'
          ''
          ''
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (0, '#39'N'#227'o Aplicavel'#39');'
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (1, '#39'Aberta'#39');'
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (2, '#39'Fechada'#39');'
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (3, '#39'Graneleira'#39');'
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (4, '#39'Porta Container'#39');'
          'INSERT INTO VEICULO_CARROCERIA (CODIGO, DESCRICAO)'
          '                        VALUES (5, '#39'Sider'#39');'
          ''
          'COMMIT WORK;'
          ''
          'ALTER TABLE MDFE_MASTER ADD SERIE integer;'
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = '01/03/2019'
      ImageIndex = 8
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'ALTER TABLE PRODUTO ADD TIPO_RESTAURANTE VARCHAR(1);'
          'COMMIT WORK;'
          ''
          
            'TABLE CONTAS_MOVIMENTO ADD SALDO COMPUTED BY (ENTRADA - SAIDA - ' +
            'TROCA);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONTAS_MOVIMENTO ADD TROCA DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE VENDAS_MASTER ADD TOTAL_TROCA DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE MESAS ADD FK_COMANDA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE MESAS ADD FK_USUARIO INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD FK_FORNECEDOR INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PESSOA_CONTA ADD FKPEDIDO INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD GERA_FINANCEIRO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD TOTAL_COMISSAO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_DETALHE ADD COMISSAO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_DETALHE ADD TOTAL_COMISSAO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD SENHA_APP VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD EXIBE_RESUMO_CAIXA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD BLOQUEAR_PRECO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CAIXA ADD TIPO_MOVIMENTO VARCHAR(2);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE DEVOLUCAO_COMPRA_D ADD FK_COMPRA_ITEM INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE DEVOLUCA_COMPRA_M ADD OBSERVACAO VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE COMPRA_ITENS ADD QTD_DEVOLVIDA DECIMAL(15,3);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE DEVOLUCA_COMPRA_M ('
          '    CODIGO         INTEGER NOT NULL,'
          '    DATA           DATE,'
          '    FK_FORNECEDOR  INTEGER,'
          '    TOTAL          DECIMAL(15,2),'
          '    NUMERO_COMPRA  INTEGER,'
          '    FK_EMPRESA     INTEGER,'
          '    SITUACAO       VARCHAR(1),'
          '    FK_USUARIO     INTEGER'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE DEVOLUCA_COMPRA_M ADD CONSTRAINT PK_DEVOLUCA_COMPRA_' +
            'M PRIMARY KEY (CODIGO);'
          
            'ALTER TABLE DEVOLUCA_COMPRA_M ADD CONSTRAINT FK_DEVOLUCA_COMPRA_' +
            'M_1 FOREIGN KEY (FK_FORNECEDOR)'
          'REFERENCES PESSOA (CODIGO);'
          
            'ALTER TABLE DEVOLUCA_COMPRA_M ADD CONSTRAINT FK_DEVOLUCA_COMPRA_' +
            'M_2 FOREIGN KEY (FK_EMPRESA) REFERENCES'
          'EMPRESA (CODIGO);'
          ''
          'COMMIT WORK;'
          ''
          ''
          'CREATE TABLE DEVOLUCAO_COMPRA_D ('
          '    CODIGO                 INTEGER NOT NULL,'
          '    FK_DEVOLUCAO_COMPRA_M  INTEGER,'
          '    ID_PRODUTO             INTEGER,'
          '    QTD_COMPRADA           DECIMAL(15,3),'
          '    QTD_DEVOLVIDA          DECIMAL(15,3),'
          '    PRECO                  DECIMAL(15,2),'
          '    TOTAL                  DECIMAL(15,2)'
          ');'
          'COMMIT WORK;'
          
            'ALTER TABLE DEVOLUCAO_COMPRA_D ADD CONSTRAINT PK_DEVOLUCAO_COMPR' +
            'A_D PRIMARY KEY (CODIGO);'
          'COMMIT WORK;'
          
            'ALTER TABLE DEVOLUCAO_COMPRA_D ADD CONSTRAINT FK_DEVOLUCAO_COMPR' +
            'A_D_1 FOREIGN KEY'
          '(FK_DEVOLUCAO_COMPRA_M) REFERENCES DEVOLUCA_COMPRA_M (CODIGO);'
          'COMMIT WORK;'
          ''
          'DROP PROCEDURE CONFERE_ESTOQUE;'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA ADD EXIBE_RESUMO_CAIXA VARCHAR(1)'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE PRODUTO ADD TEMPO_ESPERA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD COMPLEMENTO VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD BLOQUEAR_PRECO VARCHAR(1);'
          ''
          'ALTER TABLE XML_MASTER ADD FK_USUARIO INTEGER;'
          ''
          'CREATE TABLE MESAS ('
          '    CODIGO       INTEGER NOT NULL,'
          '    ABERTURA     TIMESTAMP,'
          '    NOME         VARCHAR(10),'
          '    QTD_PESSOAS  INTEGER,'
          '    FK_VENDEDOR  INTEGER,'
          '    FK_EMPRESA   INTEGER,'
          '    SITUACAO     VARCHAR(1)'
          ');'
          ''
          'ALTER TABLE MESAS ADD CONSTRAINT PK_MESAS PRIMARY KEY (CODIGO);'
          ''
          
            'ALTER TABLE MESAS ADD CONSTRAINT FK_MESAS_1 FOREIGN KEY (FK_VEND' +
            'EDOR) REFERENCES VENDEDORES (CODIGO) ON '
          'DELETE'
          'CASCADE;'
          
            'ALTER TABLE MESAS ADD CONSTRAINT FK_MESAS_2 FOREIGN KEY (FK_EMPR' +
            'ESA) REFERENCES EMPRESA (CODIGO) ON DELETE'
          'CASCADE;'
          ''
          'CREATE TABLE COMANDA ('
          '    CODIGO       INTEGER NOT NULL,'
          '    FK_VENDEDOR  INTEGER,'
          '    FK_EMPRESA   INTEGER,'
          '    FK_MESA      INTEGER,'
          '    DATA         DATE,'
          '    SUBTOTAL     DECIMAL(15,2),'
          '    DESCONTO     DECIMAL(15,2),'
          '    ACRESCIMO    DECIMAL(15,2),'
          '    TOTAL        DECIMAL(15,2),'
          '    SITUACAO     VARCHAR(1)'
          ');'
          ''
          
            'ALTER TABLE COMANDA ADD CONSTRAINT PK_COMANDA PRIMARY KEY (CODIG' +
            'O);'
          ''
          
            'ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_1 FOREIGN KEY (FK_' +
            'VENDEDOR) REFERENCES VENDEDORES (CODIGO) '
          'ON'
          'DELETE CASCADE;'
          
            'ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_2 FOREIGN KEY (FK_' +
            'EMPRESA) REFERENCES EMPRESA (CODIGO) ON'
          'DELETE CASCADE;'
          
            'ALTER TABLE COMANDA ADD CONSTRAINT FK_COMANDA_3 FOREIGN KEY (FK_' +
            'MESA) REFERENCES MESAS (CODIGO) ON DELETE'
          'CASCADE;'
          ''
          'CREATE TABLE COMANDA_ITENS ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FK_COMANDA  INTEGER,'
          '    FK_PRODUTO  INTEGER,'
          '    QTD         DECIMAL(15,2),'
          '    PRECO       DECIMAL(15,2),'
          '    TOTAL       DECIMAL(15,2),'
          '    SITUACAO    VARCHAR(1),'
          '    IMPRIME     VARCHAR(1)'
          ');'
          ''
          
            'ALTER TABLE COMANDA_ITENS ADD CONSTRAINT PK_COMANDA_ITENS PRIMAR' +
            'Y KEY (CODIGO);'
          ''
          
            'ALTER TABLE COMANDA_ITENS ADD CONSTRAINT FK_COMANDA_ITENS_1 FORE' +
            'IGN KEY (FK_COMANDA) REFERENCES COMANDA'
          '(CODIGO) ON DELETE CASCADE;'
          
            'ALTER TABLE COMANDA_ITENS ADD CONSTRAINT FK_COMANDA_ITENS_2 FORE' +
            'IGN KEY (FK_PRODUTO) REFERENCES PRODUTO'
          '(CODIGO) ON DELETE CASCADE;'
          ''
          'ALTER TABLE MESAS ADD ATIVO VARCHAR(1);'
          ''
          ''
          'ALTER TABLE PRODUTO ADD RESTAUTANTE VARCHAR(1);'
          ''
          'ALTER TABLE EMPRESA ADD QTD_MESAS SMALLINT;'
          ''
          'ALTER TABLE VENDAS_TERMINAIS ADD TIPO_BROWSER VARCHAR(30);'
          ''
          'ALTER TABLE DEVOLUCAO_DETALHE ADD TOTAL DECIMAL(15,2);'
          ''
          'ALTER TABLE ORCAMENTO ADD CODIGO_WEB INTEGER;'
          ''
          'ALTER TABLE PESSOA ADD CODIGO_WEB INTEGER;'
          ''
          'DROP TRIGGER ACERTA_ESTOQUE_ESTOQUE;'
          'DROP TRIGGER COMPRA_ITENS_BD0;'
          'DROP TRIGGER COMPRA_ITENS_BI0;'
          'DROP TRIGGER COMPRA_ITENS_ESTOQUE;'
          'DROP TRIGGER DEVOLUCAO_DETALHE_ESTOQUE;'
          'DROP TRIGGER NFCE_DETALHE_AU0;'
          'DROP TRIGGER NFCE_DETALHE_BI0;'
          'DROP TRIGGER OS_DETALHE_ESTOQUE;'
          'DROP TRIGGER VENDAS_DETALHE_BD0;'
          'DROP TRIGGER VENDAS_DETALHE_BI0;'
          'DROP TRIGGER VENDAS_DETALHE_ESTOQUE;'
          ''
          'ALTER TABLE VENDAS_MASTER ADD FK_OS INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD SSL_TIPO SMALLINT;'
          'ALTER TABLE DEVOLUCAO_DETALHE DROP TOTAL;'
          'ALTER TABLE DEVOLUCAO_DETALHE ADD TOTAL DECIMAL(15,2);'
          ''
          'CREATE TABLE NFE_MANIFESTO ('
          '    CODIGO       INTEGER NOT NULL,'
          '    NUMERO       VARCHAR(10),'
          '    CHAVE        VARCHAR(44),'
          '    SERIE        VARCHAR(3),'
          '    NOME         VARCHAR(50),'
          '    CNPJ         VARCHAR(20),'
          '    IE           VARCHAR(20),'
          '    NSU          VARCHAR(20),'
          '    VALOR        DECIMAL(15,2),'
          '    DT_ENTRADA   DATE,'
          '    DT_EMISSAO   DATE,'
          '    SITUACAO     VARCHAR(1),'
          '    FK_EMPRESA   INTEGER,'
          '    FK_USUARIO   INTEGER,'
          '    CAMINHO_XML  VARCHAR(100)'
          ');'
          ''
          ''
          
            'ALTER TABLE NFE_MANIFESTO ADD CONSTRAINT PK_NFE_MANIFESTO PRIMAR' +
            'Y KEY (CODIGO);'
          ''
          'ALTER TABLE VENDAS_FPG ADD TIPO VARCHAR(1);'
          
            'ALTER TABLE NFE_MANIFESTO ADD XML BLOB SUB_TYPE 1 SEGMENT SIZE 8' +
            '0;'
          'ALTER TABLE CAIXA ADD FK_CARTAO INTEGER;'
          'ALTER TABLE VENDAS_MASTER ADD OS VARCHAR(1);'
          'ALTER TABLE VENDAS_DETALHE ADD OS VARCHAR(1);'
          'ALTER TABLE CAIXA ADD FK_CARTAO INTEGER;'
          'ALTER TABLE VENDAS_FPG ADD TIPO VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD TIPO_CONTRATO INTEGER;'
          'ALTER TABLE CTE_REMETENTE ADD CONTRIBUINTE VARCHAR(1);'
          'ALTER TABLE EMPRESA ADD ULTIMO_PEDIDO INTEGER;'
          'ALTER TABLE MDFE_ENCERRAR ADD SITUACAO VARCHAR(1);'
          ''
          ''
          'ALTER TABLE VENDAS_MASTER ADD FK_OS INTEGER;'
          'ALTER TABLE EMPRESA ADD TIPO_EMPRESA INTEGER;'
          'ALTER TABLE EMPRESA ADD ULTIMO_PEDIDO INTEGER;'
          'ALTER TABLE VENDAS_PARAMETROS ADD SSL_TIPO SMALLINT;'
          ''
          ''
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet7: TTabSheet
      Caption = '01/05/2019'
      ImageIndex = 10
      object Memo5: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'ALTER TABLE OS_MASTER ADD NOME_TIME VARCHAR(50);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE OS_IMAGEM ('
          '    CODIGO   INTEGER NOT NULL,'
          '    ITEM     INTEGER,'
          '    CAMINHO  VARCHAR(250)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE OS_IMAGEM ADD CONSTRAINT PK_OS_IMAGEM PRIMARY KEY (C' +
            'ODIGO);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_MASTER ADD TIPO_SERVICO VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_MASTER ADD FK_TIPO_TECIDO INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_DETALHE ADD TAMANHO VARCHAR(10);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_DETALHE  ADD DETALHE VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_MASTER  ADD QUANTIDADE INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_MASTER  ADD FK_PRODUTO INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_MASTER ADD FOTO BLOB SUB_TYPE 0 SEGMENT SIZE 64;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_DETALHE ADD NOME VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE OS_DETALHE ADD NUMERO VARCHAR(10);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD LOJA_ROUPA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE TIPO_TECIDO ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(40)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE TIPO_TECIDO ADD CONSTRAINT PK_TIPO_TECIDO PRIMARY KE' +
            'Y (CODIGO);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD FK_TECIDO DATE;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PESSOA_CONTA ADD FK_FPG INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PESSOA_CONTA ADD FK_CONTA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CAIXA ADD FPG INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO  ADD DT_CADASTRO DATE;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD FK_VENDEDOR INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD SENHA_APP VARCHAR(10);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE XML_DETAIL ADD CHECAR VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD TIPO_JUROS VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD JUROS_DIA DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD JUROS_MES DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD FK_VENDEDOR INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CARENCIA ADD JUROS_MES INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CRECEBER ADD FLAG VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD FARMACIA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_DETALHE ADD VFCP NUMERIC(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD VFCP DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD FK_VENDEDOR INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD NUMERO_AUTORIZACAO VARCHAR(50);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD CNPJ_CARTAO VARCHAR(20);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD TPINTEGRA SMALLINT;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD TPBANDEIRA SMALLINT;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE USUARIOS ADD SENHA_APP VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD INDPAG SMALLINT;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE NFE_MASTER ADD TPPAG SMALLINT;'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_PARAMETROS ADD CAMINHO_CERTIFICADO VARCHAR(20' +
            '0);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CAIXA ADD ID_SUBCAIXA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CRRECEBIMENTO ADD ID_SUBCAIXA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD LER_PESO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_PORTA        VARCHA' +
            'R(10);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_VELOCIDADE    VARCH' +
            'AR(10);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_MARCA        VARCHA' +
            'R(10);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_PARIDADE     VARCHA' +
            'R(20);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_DATABITS      VARCH' +
            'AR(10);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_STOPBITS     VARCHA' +
            'R(10);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE VENDAS_TERMINAIS ADD     BALANCA_HANDSHAKING  VARCHA' +
            'R(20);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA ADD ID_PLANO_COMPRA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD ESTILO VARCHAR(30);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD LINK_TREINAMENTO VARCHAR(200);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD TITULO_SISTEMA VARCHAR(50);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD SUB_TITULO_SISTEMA VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD EMAIL_SUPORTE VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD SITE VARCHAR(100);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD FONE1 VARCHAR(14);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD FONE2 VARCHAR(14);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD CONTATO VARCHAR(14);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD ICONE  BLOB SUB_TYPE 0 SEGMENT SIZE 64,'
          'COMMIT WORK;'
          ''
          'ALTER TABLE CONFIG ADD SPLASH BLOB SUB_TYPE 0 SEGMENT SIZE 64'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE EMPRESA ADD RESPONSAVEL_TECNICO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          ''
          'CREATE TABLE RESPONSAVEL_TECNICO ('
          '    CODIGO    INTEGER NOT NULL,'
          '    CNPJ      VARCHAR(20),'
          '    NOME      VARCHAR(50),'
          '    EMAIL     VARCHAR(100),'
          '    TELEFONE  VARCHAR(14),'
          '    IDCSRT    VARCHAR(20),'
          '    CSRT      VARCHAR(50)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE RESPONSAVEL_TECNICO ADD CONSTRAINT PK_RESPONSAVEL_TE' +
            'CNICO PRIMARY KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD CARENCIA_JUROS INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD FK_MARCA INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD PREFIXO_BALANCA VARCHAR(8);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE MARCA ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(35),'
          '    ATIVO      VARCHAR(10)'
          ');'
          'COMMIT WORK;'
          ''
          'ALTER TABLE MARCA ADD CONSTRAINT PK_MARCA PRIMARY KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE PRODUTO ADD FK_PRINCIPIO_ATIVO INTEGER;'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PRINCIPIO_ATIVO ('
          '    CODIGO     INTEGER NOT NULL,'
          '    DESCRICAO  VARCHAR(50)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PRINCIPIO_ATIVO ADD CONSTRAINT PK_PRINCIPIO_ATIVO PR' +
            'IMARY KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE COMPRA_GRADE ('
          '    CODIGO           INTEGER NOT NULL,'
          '    FK_ITENS_COMPRA  INTEGER,'
          '    FK_PRODUTO       INTEGER,'
          '    DESCRICAO        VARCHAR(30),'
          '    QTD              DECIMAL(15,3)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE COMPRA_GRADE ADD CONSTRAINT PK_COMPRA_GRADE PRIMARY ' +
            'KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE VENDAS_DETALHE ADD FK_GRADE INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD REMEDIO VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'CREATE TABLE PRODUTO_GRADE ('
          '    CODIGO      INTEGER NOT NULL,'
          '    FK_PRODUTO  INTEGER,'
          '    DESCRICAO   VARCHAR(20),'
          '    QTD         DECIMAL(15,3)'
          ');'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE PRODUTO_GRADE ADD CONSTRAINT PK_PRODUTO_GRADE PRIMAR' +
            'Y KEY (CODIGO);'
          'COMMIT WORK;'
          ''
          ''
          'ALTER TABLE DEVOLUCAO_DETALHE ADD ITEM INTEGER;'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD PESQUISA_REFERENCIA VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD RESTAURANTE VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD EXIBE_F3 VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE EMPRESA ADD EXIBE_F4 VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE COMANDA_ITENS ADD TIPO_RESTAURANTE VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PRODUTO ADD TIPO_RESTAURANTE VARCHAR(1);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_DETALHE ADD DESCONTO_FRETE DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_DETALHE ADD TOTAL_LIQUIDO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD TOTAL_FRETE DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          'ALTER TABLE PEDIDO_MASTER ADD TOTAL_LIQUIDO DECIMAL(15,2);'
          'COMMIT WORK;'
          ''
          
            'ALTER TABLE CONTAS_MOVIMENTO ADD SALDO COMPUTED BY (ENTRADA-SAID' +
            'A-TROCA);'
          'COMMIT WORK;')
        TabOrder = 0
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 11
      object MemoConsulta: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'MemoConsulta')
        TabOrder = 0
      end
    end
    object memo: TTabSheet
      Caption = 'Atualiza'
      ImageIndex = 9
      object MemoSql: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'Telas'
      ImageIndex = 18
      object MemoTela: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'alter table telas add ordem varchar(1);'
          'alter table telas add tela2 varchar(40);'
          'update telas set tela2=tela;'
          'ALTER TABLE telas DROP tela;'
          'alter table telas add tela varchar(100);'
          'update telas set tela= tela2;'
          'ALTER TABLE telas DROP tela2;'
          ''
          ''
          'alter table telas add nome2 varchar(40);'
          'update telas set nome2=nome;'
          'ALTER TABLE telas DROP nome;'
          'alter table telas add nome varchar(100);'
          'update telas set nome= nome2;'
          'ALTER TABLE telas DROP nome2;')
        TabOrder = 0
      end
    end
    object TabSheet15: TTabSheet
      Caption = 'NFe Adicionais'
      ImageIndex = 19
      object MemoNFe: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'alter table NFE_DETALHE add DESCRICAO_COMPLEMENTAR varchar(300);'
          'update NFE_DETALHE set DESCRICAO_COMPLEMENTAR =INFO_ADICIONAIS;'
          'ALTER TABLE NFE_DETALHE DROP INFO_ADICIONAIS;')
        TabOrder = 0
      end
    end
    object TabSheet16: TTabSheet
      Caption = 'Gatilhos'
      ImageIndex = 20
      object MemoGatilho: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheetPlano: TTabSheet
      Caption = 'Plano'
      ImageIndex = 21
      object MemoPlano: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (1, '#39'FORNECEDORES'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (2, '#39'VENDAS DE MERCADORIA'#39', '#39'C'#39', 1, NULL, NULL' +
            ', NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (3, '#39'TRANSFERENCIA (C)'#39', '#39'C'#39', 1, NULL, NULL, N' +
            'ULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (4, '#39'TRANSFERENCIA (D)'#39', '#39'D'#39', 1, NULL, NULL, N' +
            'ULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (5, '#39'ENERGIA'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (6, '#39'FUNCION'#193'RIOS'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (7, '#39'IMPOSTOS'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (11, '#39'RETIRADA DE CAIXA'#39', '#39'D'#39', 1, NULL, NULL, ' +
            'NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (8, '#39#193'GUA'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          '           VALUES (9, '#39'CONTADOR'#39', '#39'D'#39', 1, NULL, NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (10, '#39'RECEBIMENTODE CONTAS'#39', '#39'C'#39', 1, NULL, NUL' +
            'L, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (12, '#39'DEVOLU'#199#195'O DE MERCADORIA'#39', '#39'C'#39', 1, NULL, ' +
            'NULL, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (13, '#39'TAXA DE CART'#195'O'#39', '#39'D'#39', 1, NULL, NULL, NUL' +
            'L);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (14, '#39'ABERTURA DE CAIXA'#39', '#39'D'#39', 1, NULL, NULL, ' +
            'NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (15, '#39'COMPRA DE MERCADORIA'#39', '#39'D'#39', 1, NULL, NUL' +
            'L, NULL);'
          
            'INSERT INTO PLANO (CODIGO, DESCRICAO, DC, FKEMPRESA, NIVEL, CODI' +
            'GO_PLANO, PAI)'
          
            '           VALUES (16, '#39'BOLETO BANC'#193'RIO'#39', '#39'D'#39', 1, NULL, NULL, NU' +
            'LL);'
          ''
          'COMMIT WORK;')
        TabOrder = 0
      end
    end
    object TabSheet17: TTabSheet
      Caption = 'Descricao'
      ImageIndex = 22
      object MemoDescricaoPlano: TMemo
        Left = 0
        Top = 0
        Width = 664
        Height = 295
        Align = alClient
        Lines.Strings = (
          'alter table plano add flag varchar(1);'
          'alter table plano add descricao2 varchar(100);'
          'update plano set descricao2=descricao;'
          'ALTER TABLE plano DROP descricao;'
          'alter table plano add descricao varchar(100);'
          'update plano set descricao= descricao2;'
          'ALTER TABLE plano DROP descricao2;')
        TabOrder = 0
      end
    end
  end
  object qryParametro: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from CONFIG')
    Left = 374
    Top = 88
    object qryParametroVERSAO: TIntegerField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParametroDATA_SCRIPT: TDateField
      FieldName = 'DATA_SCRIPT'
      Origin = 'DATA_SCRIPT'
    end
    object qryParametroESTILO: TStringField
      FieldName = 'ESTILO'
      Origin = 'ESTILO'
      Size = 30
    end
    object qryParametroLINK_TREINAMENTO: TStringField
      FieldName = 'LINK_TREINAMENTO'
      Origin = 'LINK_TREINAMENTO'
      Size = 200
    end
    object qryParametroTITULO_SISTEMA: TStringField
      FieldName = 'TITULO_SISTEMA'
      Origin = 'TITULO_SISTEMA'
      Size = 50
    end
    object qryParametroSUB_TITULO_SISTEMA: TStringField
      FieldName = 'SUB_TITULO_SISTEMA'
      Origin = 'SUB_TITULO_SISTEMA'
      Size = 100
    end
    object qryParametroEMAIL_SUPORTE: TStringField
      FieldName = 'EMAIL_SUPORTE'
      Origin = 'EMAIL_SUPORTE'
      Size = 100
    end
    object qryParametroSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 100
    end
    object qryParametroFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryParametroFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'FONE2'
      Size = 14
    end
    object qryParametroCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 14
    end
  end
  object qryConsulta: TFDQuery
    Connection = Dados.Conexao
    Left = 438
    Top = 87
  end
  object IBScript: TFDScript
    SQLScripts = <>
    Connection = Dados.Conexao
    ScriptOptions.IgnoreError = True
    Params = <>
    Macros = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 318
    Top = 87
  end
end
