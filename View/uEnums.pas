// *****************************************************************************
//
// unit:   uEnums
// Classe: TCEnums
//
// Data de criação  : 10/05/2019
// Autor            :
// Descrição        : Classe contendo estrutura de Enum para todos Retornos
// da dll de integração Pay&Go
// *****************************************************************************/
unit uEnums;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.StrUtils, System.AnsiStrings,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Types, System.TypInfo;

type

  TCEnums = class

  private
    { }
  public

    const


    // ==========================================================================================
    // Definição da versão do aplicativo
    // ==========================================================================================

    PGWEBLIBTEST_VERSION = '2.0.1';
    PGWEBLIBTEST_AUTDEV = 'PRODO SISTEMA';
    PGWEBLIBTEST_AUTNAME = 'PRODO SISTEMA';
    PGWEBLIBTEST_AUTCAP = '15';
    PGWEBLIBTEST_AUTHTECHUSER = 'PRODOSISTEMA';

    // ==========================================================================================
    // Códigos de Confirmação de Transação
    // ==========================================================================================
    PWCNF_CNF_AUTO = 289;
    // A transação foi confirmada pelo Ponto de Captura, sem intervenção do usuário.
    PWCNF_CNF_MANU_AUT = 12833;
    // A transação foi confirmada manualmente na Automação.*/
    PWCNF_REV_MANU_AUT = 12849;
    // A transação foi desfeita manualmente na Automação.*/
    PWCNF_REV_PRN_AUT = 78129;
    // A transação foi desfeita pela Automação, devido a uma falha na impressão do comprovante (não fiscal). A priori, não usar. Falhas na impressão não devem gerar desfazimento, deve ser solicitada a reimpressão da transação.*/
    PWCNF_REV_DISP_AUT = 143665;
    // A transação foi desfeita pela Automação, devido a uma falha no mecanismo de liberação da mercadoria.*/
    PWCNF_REV_COMM_AUT = 209201;
    // A transação foi desfeita pela Automação, devido a uma falha de comunicação/integração com o ponto de captura (Cliente Muxx).*/
    PWCNF_REV_ABORT = 274737;
    // A transação não foi finalizada, foi interrompida durante a captura de dados.*/
    PWCNF_REV_OTHER_AUT = 471345;
    // A transação foi desfeita a pedido da Automação, por um outro motivo não previsto.*/
    PWCNF_REV_PWR_AUT = 536881;
    // A transação foi desfeita automaticamente pela Automação, devido a uma queda de energia (reinício abrupto do sistema).*/
    PWCNF_REV_FISC_AUT = 602417;
    // A transação foi desfeita automaticamente pela Automação, devido a uma falha de registro no sistema fiscal (impressora S@T, on-line, etc.).*/

    // =========================================================================================
    // Tipos de evento a serem ativados para monitoração no PIN-pad
    // ==========================================================================================
    PWPPEVTIN_KEYS = 1; // Acionamento de teclas
    PWPPEVTIN_MAG = 2; // Passagem de cartão magnético
    PWPPEVTIN_ICC = 4; // Inserção de cartão com chip.
    PWPPEVTIN_CTLS = 8; // Aproximação de um cartão sem contato

    // ==========================================================================================
    // Tipos de evento retornados pelo PIN-pad
    // ==========================================================================================
    PWPPEVT_MAGSTRIPE = 1; // 01h Foi passado um cartão magnético.
    PWPPEVT_ICC = 2; // 02h Foi detectada a presença de um cartão com chip.
    PWPPEVT_CTLS = 3; // 03h Foi detectada a presença de um cartão sem contato.
    PWPPEVT_KEYCONF = 17; // 11h Foi pressionada a tecla [OK].
    PWPPEVT_KEYBACKSP = 18; // 12h Foi pressionada a tecla [CORRIGE].
    PWPPEVT_KEYCANC = 19; // 13h Foi pressionada a tecla [CANCELA].
    PWPPEVT_KEYF1 = 33; // 21h Foi pressionada a tecla [F1].
    PWPPEVT_KEYF2 = 34; // 22h Foi pressionada a tecla [F2].
    PWPPEVT_KEYF3 = 35; // 23h Foi pressionada a tecla [F3].
    PWPPEVT_KEYF4 = 36; // 24h Foi pressionada a tecla [F4].

    // ==========================================================================================
    // Número maximo de itens em um menu de seleção
    // ==========================================================================================
    PWMENU_MAXINTENS = 40;

    // ==========================================================================================
    // Tabela de Códigos de retorno das transações
    // ==========================================================================================
    PWOPER_NULL = 0; // Testa comunicação com a infraestrutura do Pay&Go Web
    PWOPER_INSTALL = 1;
    // Registra o Ponto de Captura perante a infraestrutura do Pay&Go Web, para que seja autorizado a realizar transações
    PWOPER_PARAMUPD = 2;
    // Obtém da infraestrutura do Pay&Go Web os parâmetros de operação atualizados do Ponto de Captura.
    PWOPER_REPRINT = 16; // Obtém o último comprovante gerado por uma transação
    PWOPER_RPTTRUNC = 17;
    // Obtém um relatório sintético das transações realizadas desde a última obtenção deste relatório
    PWOPER_RPTDETAIL = 18;
    // Relatório detalhado das transações realizadas na data informada, ou data atual.
    PWOPER_ADMIN = 32;
    // Acessa qualquer transação que não seja disponibilizada pelo comando PWOPER_SALE. Um menu é apresentado para o operador selecionar a transação desejada.
    PWOPER_SALE = 33;
    // (Venda) Realiza o pagamento de mercadorias e/ou serviços vendidos pelo Estabelecimento ao Cliente (tipicamente, com cartão de crédito/débito), transferindo fundos entre as respectivas contas.
    PWOPER_SALEVOID = 34;
    // (Cancelamento de venda) Cancela uma transação PWOPER_SALE, realizando a transferência de fundos inversa
    PWOPER_PREPAID = 35;
    // Realiza a aquisição de créditos pré-pagos (por exemplo, recarga de celular).
    PWOPER_CHECKINQ = 36; // Consulta a validade de um cheque papel
    PWOPER_RETBALINQ = 37;
    // Consulta o saldo/limite do Estabelecimento (tipicamente, limite de crédito para venda de créditos pré-pagos).
    PWOPER_CRDBALINQ = 38; // Consulta o saldo do cartão do Cliente
    PWOPER_INITIALIZ = 39;
    // (Inicialização/abertura) Inicializa a operação junto ao Provedor e/ou obtém/atualiza os parâmetros de operação mantidos por este
    PWOPER_SETTLEMNT = 40;
    // (Fechamento/finalização) Finaliza a operação junto ao Provedor
    PWOPER_PREAUTH = 41;
    // (Pré-autorização) Reserva o valor correspondente a uma venda no limite do cartão de crédito de um Cliente, porém sem efetivar a transferência de fundos.
    PWOPER_PREAUTVOID = 42;
    // (Cancelamento de pré-autorização) Cancela uma transação PWOPER_PREAUTH, liberando o valor reservado no limite do cartão de crédito
    PWOPER_CASHWDRWL = 43;
    // (Saque) Registra a retirada de um valor em espécie pelo Cliente no Estabelecimento, para transferência de fundos nas respectivas contas
    PWOPER_LOCALMAINT = 44;
    // (Baixa técnica) Registra uma intervenção técnica no estabelecimento perante o Provedor.
    PWOPER_FINANCINQ = 45;
    // Consulta as taxas de financiamento referentes a uma possível venda parcelada, sem efetivar a transferência de fundos ou impactar o limite de crédito do Cliente
    PWOPER_ADDRVERIF = 46; // Verifica junto ao Provedor o endereço do Cliente
    PWOPER_SALEPRE = 47;
    // Efetiva uma pré-autorização (PWOPER_PREAUTH), previamente realizada, realizando a transferência de fundos entre as contas do Estabelecimento e do Cliente
    PWOPER_LOYCREDIT = 48;
    // Registra o acúmulo de pontos pelo Cliente, a partir de um programa de fidelidade.
    PWOPER_LOYCREDVOID = 49; // Cancela uma transação PWOPER_LOYCREDIT
    PWOPER_LOYDEBIT = 50;
    // Registra o resgate de pontos/prêmio pelo Cliente, a partir de um programa de fidelidade.
    PWOPER_LOYDEBVOID = 51; // Cancela uma transação PWOPER_LOYDEBIT
    PWOPER_VOID = 57;
    // Exibe um menu com os cancelamentos disponíveis, caso só exista um tipo, este é selecionado automaticamente
    PWOPER_VERSION = 252;
    // (Versão) Permite consultar a versão da biblioteca atualmente em uso.
    PWOPER_CONFIG = 253;
    // (Configuração) Visualiza e altera os parâmetros de operação locais da biblioteca
    PWOPER_MAINTENANCE = 254;
    // (Manutenção) Apaga todas as configurações do Ponto de Captura, devendo ser novamente realizada uma transação de Instalação.

    // ==========================================================================================
    // Tipos de dados que podem ser informados pela Automação
    // ==========================================================================================
    PWINFO_OPERATION = 2;
    // Tipo de transação (PWOPER_xxx). Consultar os valores possíveis na descrição da função PW_iNewTransac
    PWINFO_POSID = 17; // Identificador do Ponto de Captura.
    PWINFO_AUTNAME = 21; // Nome do aplicativo de Automação
    PWINFO_AUTVER = 22; // Versão do aplicativo de Automação
    PWINFO_AUTDEV = 23; // Empresa desenvolvedora do aplicativo de Automação.
    PWINFO_DESTTCPIP = 27;
    // Endereço TCP/IP para comunicação com a infraestrutura Pay&Go Web, no formato <endereço IP>:<porta TCP> ou <nome do servidor>:<porta TCP>
    PWINFO_MERCHCNPJCPF = 28;
    // CNPJ (ou CPF) do Estabelecimento, sem formatação. No caso de estarem sendo utilizadas afiliações de mais de um estabelecimento, este dado pode ser adicionado pela automação para selecionar previamente o estabelecimento a ser utilizado para determinada transação. Caso este dado não seja informado, será solicitada a exibição de um menu para a escolha dentre os vários estabelecimentos disponíveis.
    PWINFO_AUTCAP = 36;
    // Capacidades da Automação (soma dos valores abaixo): 1: funcionalidade de troco/saque; 2: funcionalidade de desconto; 4: valor fixo, sempre incluir; 8: impressão das vias diferenciadas do comprovante para Cliente/Estabelecimento; 16: impressão do cupom reduzido. 32: utilização de saldo total do voucher para abatimento do valor da compra.
    PWINFO_TOTAMNT = 37;
    // Valor total da operação, considerando PWINFO_CURREXP (em centavos se igual a 2), incluindo desconto, saque, gorjeta, taxa de embarque, etc.
    PWINFO_CURRENCY = 38; // Moeda (padrão ISO4217, 986 para o Real)
    PWINFO_CURREXP = 39; // Expoente da moeda (2 para centavos)
    PWINFO_FISCALREF = 40; // Identificador do documento fiscal
    PWINFO_CARDTYPE = 41;
    // Tipo de cartão utilizado (PW_iGetResult), ou tipos de cartão aceitos (soma dos valores abaixo, PW_iAddParam): 1: crédito 2: débito 4: voucher/PAT 8: outros
    PWINFO_PRODUCTNAME = 42;
    // Nome/tipo do produto utilizado, na nomenclatura do Provedor.
    PWINFO_DATETIME = 49;
    // Data e hora local da transação, no formato “AAAAMMDDhhmmss”
    PWINFO_REQNUM = 50; // Referência local da transação
    PWINFO_AUTHSYST = 53;
    // Nome do Provedor: “ELAVON”; “FILLIP”; “LIBERCARD”; “RV”; etc
    PWINFO_VIRTMERCH = 54; // Identificador do Estabelecimento
    PWINFO_AUTMERCHID = 56;
    // Identificador do estabelecimento para o Provedor (código de afiliação).
    PWINFO_PHONEFULLNO = 58;
    // Número do telefone, com o DDD (10 ou 11 dígitos).
    PWINFO_FINTYPE = 59;
    // Modalidade de financiamento da transação: 1: à vista 2: parcelado pelo emissor 4: parcelado pelo estabelecimento 8: pré-datado
    PWINFO_INSTALLMENTS = 60; // Quantidade de parcelas
    PWINFO_INSTALLMDATE = 61;
    // Data de vencimento do pré-datado, ou da primeira parcela. Formato “DDMMAA
    PWINFO_PRODUCTID = 62;
    // Identificação do produto utilizado, de acordo com a nomenclatura do Provedor.
    PWINFO_RESULTMSG = 66;
    // Mensagem descrevendo o resultado final da transação, seja esta bem ou mal sucedida (conforme “4.3.Interface com o usuário”, página 8
    PWINFO_CNFREQ = 67;
    // Necessidade de confirmação: 0: não requer confirmação; 1: requer confirmação.
    PWINFO_AUTLOCREF = 68;
    // Referência da transação para a infraestrutura Pay&Go Web
    PWINFO_AUTEXTREF = 69;
    // Referência da transação para o Provedor (NSU host).
    PWINFO_AUTHCODE = 70; // Código de autorização
    PWINFO_AUTRESPCODE = 71;
    // Código de resposta da transação (campo ISO8583:39)
    PWINFO_AUTDATETIME = 72;
    // Data/hora da transação para o Provedor, formato “AAAAMMDDhhmmss”.
    PWINFO_DISCOUNTAMT = 73;
    // Valor do desconto concedido pelo Provedor, considerando PWINFO_CURREXP, já deduzido em PWINFO_TOTAMNT
    PWINFO_CASHBACKAMT = 74;
    // Valor do saque/troco, considerando PWINFO_CURREXP, já incluído em PWINFO_TOTAMNT
    PWINFO_CARDNAME = 75; // Nome do cartão ou do emissor do cartão
    PWINFO_ONOFF = 76; // Modalidade da transação: 1: online 2: off-line
    PWINFO_BOARDINGTAX = 77;
    // Valor da taxa de embarque, considerando PWINFO_CURREXP, já incluído em PWINFO_TOTAMNT
    PWINFO_TIPAMOUNT = 78;
    // Valor da taxa de serviço (gorjeta), considerando PWINFO_CURREXP, já incluído em PWINFO_TOTAMNT
    PWINFO_INSTALLM1AMT = 79;
    // Valor da entrada para um pagamento parcelado, considerando PWINFO_CURREXP, já incluído em PWINFO_TOTAMNT
    PWINFO_INSTALLMAMNT = 80;
    // Valor da parcela, considerando PWINFO_CURREXP, já incluído em PWINFO_TOTAMNT
    PWINFO_RCPTFULL = 82;
    // Comprovante para impressão – Via completa. Até 40 colunas, quebras de linha identificadas pelo caractere 0Dh
    PWINFO_RCPTMERCH = 83;
    // Comprovante para impressão – Via diferenciada para o Estabelecimento. Até 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
    PWINFO_RCPTCHOLDER = 84;
    // Comprovante para impressão – Via diferenciada para o Cliente. Até 40 colunas, quebras de linha identificadas pelo caractere 0Dh.
    PWINFO_RCPTCHSHORT = 85;
    // Comprovante para impressão – Cupom reduzido (para o Cliente). Até 40 colunas, quebras de linha identificadas pelo caractere 0Dh
    PWINFO_TRNORIGDATE = 87;
    // Data da transação original, no caso de um cancelamento ou uma confirmação de pré-autorização (formato “DDMMAA”).
    PWINFO_TRNORIGNSU = 88;
    // NSU da transação original, no caso de um cancelamento ou uma confirmação de pré-autorizaçã
    PWINFO_SALDOVOUCHER = 89; // Saldo do cartão voucher recebido do autorizador
    PWINFO_TRNORIGAMNT = 96;
    // Valor da transação original, no caso de um cancelamento ou uma confirmação de pré-autorização.
    PWINFO_TRNORIGAUTH = 98;
    // Código de autorização da transação original, no caso de um cancelamento ou uma confirmação de pré-autorização
    PWINFO_LANGUAGE = 108;
    // Idioma a ser utilizado para a interface com o cliente: 0: Português 1: Inglês 2: Espanhol
    PWINFO_PROCESSMSG = 111;
    // Mensagem a ser exibida para o cliente durante o processamento da transação
    PWINFO_TRNORIGREQNUM = 114;
    // Número da solicitação da transação original, no caso de um cancelamento ou uma confirmação de pré-autorização
    PWINFO_TRNORIGTIME = 115;
    // Hora da transação original, no caso de um cancelamento ou uma confirmação de pré-autorização (formato “HHMMSS”).
    PWINFO_CNCDSPMSG = 116;
    // Mensagem a ser exibida para o operador no terminal no caso da transação ser abortada (cancelamento ou timeout).
    PWINFO_CNCPPMSG = 117;
    // Mensagem a ser exibida para o portador no PIN-pad no caso da transação ser abortada (cancelamento ou timeout).
    PWINFO_CARDENTMODE = 192;
    // Modo(s) de entrada do cartão: 1: digitado 2: tarja magnética 4: chip com contato 16: fallback de chip para tarja 32: chip sem contato simulando tarja (cliente informa tipo efetivamente utilizado) 64: chip sem contato EMV (cliente informa tipo efetivamente utilizado) 256: fallback de tarja para digitado
    PWINFO_CARDFULLPAN = 193;
    // Número do cartão completo, para transação digitada. Este dado não pode ser recuperado pela função PW_iGetResult
    PWINFO_CARDEXPDATE = 194; // Data de vencimento do cartão (formato “MMAA”).
    PWINFO_CARDPARCPAN = 200; // Número do cartão, truncado ou mascarado
    PWINFO_CHOLDVERIF = 207;
    // Verificação do portador, soma dos seguintes valores: “1”: Assinatura do portador em papel. “2”: Senha verificada off-line. “4”: Senha off-line bloqueada no decorrer desta transação. “8”: Senha verificada online
    PWINFO_AID = 216; // Aplicação do cartão utilizada durante a transação
    PWINFO_BARCODENTMODE = 233;
    // Modo(s) de entrada do código de barras: 1:  digitado; 2:  lido através de dispositivo eletrônico.
    PWINFO_BARCODE = 234; // Código de barras completo, lido ou digitado
    PWINFO_MERCHADDDATA1 = 240;
    // Dados adicionais relevantes para a Automação (#1)
    PWINFO_MERCHADDDATA2 = 241;
    // Dados adicionais relevantes para a Automação (#2)
    PWINFO_MERCHADDDATA3 = 242;
    // Dados adicionais relevantes para a Automação (#3)
    PWINFO_MERCHADDDATA4 = 243;
    // Dados adicionais relevantes para a Automação (#4)
    PWINFO_RCPTPRN = 244;
    // Indica quais vias de comprovante devem ser impressas: 0: não há comprovante 1: imprimir somente a via do Cliente 2: imprimir somente a via do Estabelecimento 3: imprimir ambas as vias do Cliente e do Estabelecimento
    PWINFO_AUTHMNGTUSER = 245;
    // Identificador do usuário autenticado com a senha do lojista
    PWINFO_AUTHTECHUSER = 246;
    // Identificador do usuário autenticado com a senha técnica.
    PWINFO_PAYMNTTYPE = 7969;
    // Modalidade de pagamento: 1: cartão 2: dinheiro 3: cheque
    PWINFO_USINGPINPAD = 32513;
    // Indica se o ponto de captura faz ou não o uso de PIN-pad: 0: Não utiliza PIN-pad; 1: Utiliza PIN-pad.
    PWINFO_PPCOMMPORT = 32514;
    // Número da porta serial à qual o PIN-pad está conectado. O valor 0 (zero) indica uma busca automática desta porta
    PWINFO_IDLEPROCTIME = 32516;
    // Próxima data e horário em que a função PW_iIdleProc deve ser chamada pela Automação. Formato “AAMMDDHHMMSS”
    PWINFO_PNDAUTHSYST = 32517;
    // Nome do provedor para o qual existe uma transação pendente.
    PWINFO_PNDVIRTMERCH = 32518;
    // Identificador do Estabelecimento para o qual existe uma transação pendente
    PWINFO_PNDREQNUM = 32519;
    // Referência local da transação que está pendente.
    PWINFO_PNDAUTLOCREF = 32520;
    // Referência para a infraestrutura Pay&Go Web da transação que está pendente.
    PWINFO_PNDAUTEXTREF = 32521;
    // Referência para o Provedor da transação que está pendente
    PWINFO_LOCALINFO1 = 32522;
    // Texto exibido para um item de menu selecionado pelo usuário
    PWINFO_SERVERPND = 32523;
    // Indica se o ponto de captura possui alguma pendência a ser resolvida com o Pay&Go Web: 0: não possui pendência; 1: possui pendência
    PWINFO_PPINFO = '0x7F15';
    // Informações do PIN-pad conectado, seguindo o padrão posição/informação abaixo: 001-020 / Nome do fabricante do PIN-pad. 021-039 / Modelo/versão do hardware. 040 / Se o PIN-pad suporta cartão com chip sem contato, este campo deve conter a letra “C”, caso contrário um espaço em branco. 041-060 / Versão do software básico/firmware. 061-064 / Versão da especificação, no formato “V.VV”. 065-080 / Versão da aplicação básica, no formato “VVV.VV AAMMDD” (com 3 espaços à direita). 081-100 / Número de série do PIN-pad (com espaços à direita)
    PWINFO_DUEAMNT = '0xBF06';
    // Valor devido pelo usuário, considerando PWINFO_CURREXP, já deduzido em PWINFO_TOTAMNT
    PWINFO_READJUSTEDAMNT = '0xBF09';
    // Valor total da transação reajustado, este campo será utilizado caso o autorizador, por alguma regra de negócio específica dele, resolva alterar o valor total que foi solicitado para a transação
    PWINFO_CHOLDERNAME = '0x1F38';
    // Nome do portador do cartão utilizado, o tamanho segue o mesmo padrão da tag 5F20 EMV.
    PWINFO_CARDNAMESTD = 196;
    // Descrição do produto bandeira padrão relacionado ao BIN.

    // ===========================================================
    // Tabela de Códigos de Erro de Retorno da Biblioteca
    // ===========================================================
    PWRET_OK = 0; // Operação bem sucedida
    PWRET_FROMHOSTPENDTRN = -2599;
    // Existe uma transação pendente, é necessário confirmar ou desfazer essa transação através de PW_iConfirmation.
    PWRET_FROMHOSTPOSAUTHERR = -2598;
    // Falha de autenticação do ponto de captura com a infraestrutura do Pay&Go Web.
    PWRET_FROMHOSTUSRAUTHERR = -2597; // Falha de autenticação do usuário
    PWRET_FROMHOST = -2596;
    // Erro retornado pela infraestrutura do Pay&Go Web. Verificar a mensagem (PWINFO_RESULTMSG) para mais informações
    PWRET_TLVERR = -2595;
    // Falha de comunicação com a infraestrutura do Pay&Go Web (codificação da mensagem).
    PWRET_SRVINVPARAM = -2594;
    // Falha de comunicação com a infraestrutura do Pay&Go Web (parâmetro inválido).
    PWRET_REQPARAM = -2593;
    // Falha de comunicação com a infraestrutura do Pay&Go Web (falta parâmetro obrigatório).
    PWRET_HOSTCONNUNK = -2592; // Erro interno da biblioteca (conexão ao host).
    PWRET_INTERNALERR = -2591; // Erro interno da biblioteca
    PWRET_BLOCKED = -2590; // O ponto de captura foi bloqueado para uso
    PWRET_FROMHOSTTRNNFOUND = -2589;
    // A transação referenciada (cancelamento, confirmação, etc.) não foi encontrada.
    PWRET_PARAMSFILEERR = -2588;
    // Inconsistência dos parâmetros de operação recebidos da infraestrutura do Pay&Go Web
    PWRET_NOCARDENTMODE = -2587;
    // O Ponto de Captura não tem a capacidade de efetuar a captura do cartão através dos tipos de entrada especificados pelo Pay&Go Web
    PWRET_INVALIDVIRTMERCH = -2586;
    // Falha de comunicação com a infraestrutura do Pay&Go Web (código de afiliação inválido).
    PWRET_HOSTTIMEOUT = -2585;
    // Falha de comunicação com a infraestrutura do Pay&Go Web (tempo de resposta esgotado).
    PWRET_CONFIGREQUIRED = -2584;
    // Erro de configuração. É necessário acionar a função de configuração.
    PWRET_HOSTCONNERR = -2583;
    // Falha de conexão à infraestrutura do Pay&Go Web
    PWRET_HOSTCONNLOST = -2582;
    // A conexão com a infraestrutura do Pay&Go Web foi interrompida
    PWRET_FILEERR = -2581;
    // Falha no acesso aos arquivos da biblioteca de integração
    PWRET_PINPADERR = -2580; // Falha de comunicação com o PIN-pad (aplicação).
    PWRET_MAGSTRIPEERR = -2579; // Formato de tarja magnética não reconhecido
    PWRET_PPCRYPTERR = -2578;
    // Falha de comunicação com o PIN-pad (comunicação segura).
    PWRET_SSLCERTERR = -2577; // Falha no certificado SSL
    PWRET_SSLNCONN = -2576; // Falha ao tentar estabelecer conexão SSL
    PWRET_GPRSATTACHFAILED = -2575; // Falha no registro GPRS.
    PWRET_INVPARAM = -2499; // Parâmetro inválido passado à função
    PWRET_NOTINST = -2498;
    // Ponto de Captura não instalado. É necessário acionar a função de Instalação.
    PWRET_MOREDATA = -2497;
    // Ainda existem dados que precisam ser capturados para a transação poder ser realizada
    PWRET_NODATA = -2496; // A informação solicitada não está disponível.
    PWRET_DISPLAY = -2495;
    // A Automação deve apresentar uma mensagem para o operador
    PWRET_INVCALL = -2494; // Função chamada no momento incorreto
    PWRET_NOTHING = -2493; // Nada a fazer, continuar o processamento
    PWRET_BUFOVFLW = -2492;
    // O tamanho da área de memória informado é insuficiente.
    PWRET_CANCEL = -2491; // Operação cancelada pelo operador
    PWRET_TIMEOUT = -2490; // Tempo limite excedido para ação do operador
    PWRET_PPNOTFOUND = -2489; // PIN-pad não encontrado na busca efetuada.
    PWRET_TRNNOTINIT = -2488; // Não foi chamada a função PW_iNewTransac
    PWRET_DLLNOTINIT = -2487; // Não foi chamada a função PW_iInit
    PWRET_FALLBACK = -2486;
    // Ocorreu um erro no cartão magnético, passar a aceitar o cartão digitado, caso já não esteja sendo aceito
    PWRET_WRITERR = -2485; // Falha de gravação no diretório de trabalho.
    PWRET_PPCOMERR = -2484; // Falha na comunicação com o PIN-pad (protocolo).
    PWRET_NOMANDATORY = -2483;
    // Algum dos parâmetros obrigatórios não foi adicionado
    PWRET_INVALIDTRN = -2482;
    // A transação informada para confirmação não existe ou já foi confirmada anteriormente.
    PWRET_PPS_XXX = -2200; // Erros retornados pelo PIN-pad, conforme seção 10.2

    // ==========================================================
    // Erros específicos da biblioteca compartilhada de PIN-pad
    // ==========================================================
    PWRET_PPS_MAX = -2100;
    PWRET_PPS_MIN = PWRET_PPS_MAX - 100;

    // ==========================================================================================
    // Tipos utilizados na captura de dados dinamica
    // ==========================================================================================
    PWDAT_MENU = 1; // menu de opções
    PWDAT_TYPED = 2; // entrada digitada
    PWDAT_CARDINF = 3; // dados de cartão
    PWDAT_PPENTRY = 5; // entrada digitada no PIN-pad
    PWDAT_PPENCPIN = 6; // senha criptografada
    PWDAT_CARDOFF = 9; // processamento off-line de cartão com chip
    PWDAT_CARDONL = 10; // processamento on-line de cartão com chip
    PWDAT_PPCONF = 11; // confirmação de informação no PIN-pad
    PWDAT_BARCODE = 12; // Código de barras, lido ou digitado
    PWDAT_PPREMCRD = 13; // Remoção do cartão do PIN-pad.
    PWDAT_PPGENCMD = 14; // comando proprietário da rede no PIN-pad.
    PWDAT_PPDATAPOSCNF = 16; // confirmação positiva de dados no PIN-pad.
    PWDAT_USERAUTH = 17; // validação da senha.

    // ==========================================================================================
    // Tipos de operação, utilizados na função PW_iGetOperations
    // ==========================================================================================
    PWOPTYPE_ADMIN = 1;
    // Operações administrativas (relatório, reimpressão, etc).
    PWOPTYPE_SALE = 2; // Operações financeiras.

    // ==========================================================================================
    // Dados digitado pelo portador do cartão no PIN-pad.
    // ==========================================================================================
    DIGITE_O_DDD = 1;
    REDIGITE_O_DDD = 2;
    DIGITE_O_TELEFONE = 3;
    REDIGITE_O_TELEFONE = 4;
    DIGITE_DDD_TELEFONE = 5;
    REDIGITE_DDD_TELEFONE = 6;
    DIGITE_O_CPF = 7;
    REDIGITE_O_CPF = 8;
    DIGITE_O_RG = 9;
    REDIGITE_O_RG = 10;
    DIGITE_OS_4_ULTIMOS_DIGITOS = 11;
    DIGITE_CODIGO_DE_SEGURANCA = 12;

    // ==========================================================================================
    // Tipos de Cartões
    // ==========================================================================================
    naoDefinido = 0;
    credito = 1;
    debito = 2;
    voucher = 4;
    outros = 8;

    // ==========================================================================================
    // Tipos de Vendas
    // ==========================================================================================
    vNaoDefinido = 0;
    aVista = 1;
    parceladoEmissor = 2;
    parceladoEstabelecimento = 4;
    preDatado = 8;

    WInputH: Integer = 750;
    WInputV: Integer = 140;

    { }

    Constructor Create; // declaração do metodo construtor

    Destructor Destroy; Override; // declaração do metodo destrutor

    // Exemplos de Retorno do Nome da Constante;
    Function E_PWRET(PWRET: Integer): String;
    Function E_PWPPEVT(PWPPEVT: Integer): String;
    Function E_PWOPER(PWOPER: Integer): String;
    Function E_PWCardTypes(PWCardTypes: Integer): String;
    Function E_PWFinancingTypes(PWFinancingTypes: Integer): String;
    Function E_PWCNF(PWCNF: Integer): String;

  End;

var
  eCclasse: TCEnums;

implementation

constructor TCEnums.Create;
begin
  // metodo contrutor
end;

destructor TCEnums.Destroy;
begin
  // metodo destrutor
  inherited;
end;



// ========================================
// **** Exemplo de uso das constantes ****
// ========================================

// =========================================================
// Confirmação de Transação
// =========================================================
Function TCEnums.E_PWCNF(PWCNF: Integer): String;
begin
  case PWCNF of
    PWCNF_CNF_AUTO:
      Result := 'PWCNF_CNF_AUTO';
    PWCNF_CNF_MANU_AUT:
      Result := 'PWCNF_CNF_MANU_AUT';
    PWCNF_REV_MANU_AUT:
      Result := 'PWCNF_REV_MANU_AUT';
    PWCNF_REV_PRN_AUT:
      Result := 'PWCNF_REV_PRN_AUT';
    PWCNF_REV_DISP_AUT:
      Result := 'PWCNF_REV_DISP_AUT';
    PWCNF_REV_COMM_AUT:
      Result := 'PWCNF_REV_COMM_AUT';
    PWCNF_REV_ABORT:
      Result := 'PWCNF_REV_ABORT';
    PWCNF_REV_OTHER_AUT:
      Result := 'PWCNF_REV_OTHER_AUT';
    PWCNF_REV_PWR_AUT:
      Result := 'PWCNF_REV_PWR_AUT';
    PWCNF_REV_FISC_AUT:
      Result := 'PWCNF_REV_FISC_AUT';
  end;
end;

// =========================================================
// Tipos de Vendas
// =========================================================
Function TCEnums.E_PWFinancingTypes(PWFinancingTypes: Integer): String;
begin
  case PWFinancingTypes of
    vNaoDefinido:
      Result := 'vNaoDefinido';
    aVista:
      Result := 'aVista';
    parceladoEmissor:
      Result := 'parceladoEmissor';
    parceladoEstabelecimento:
      Result := 'parceladoEstabelecimento';
    preDatado:
      Result := 'preDatado';
  end;
end;

// =========================================================
// Tipos de Cartões
// =========================================================
Function TCEnums.E_PWCardTypes(PWCardTypes: Integer): String;
begin
  case PWCardTypes of
    naoDefinido:
      Result := 'naoDefinido';
    credito:
      Result := 'credito';
    debito:
      Result := 'debito';
    voucher:
      Result := 'voucher';
    outros:
      Result := 'outros';
  end;
end;

// =========================================================
// Retorno das Transações
// =========================================================
Function TCEnums.E_PWOPER(PWOPER: Integer): String;
begin

  case PWOPER of

    PWOPER_NULL:
      Result := 'PWOPER_NULL';
    PWOPER_INSTALL:
      Result := 'PWOPER_INSTALL';
    PWOPER_PARAMUPD:
      Result := 'PWOPER_PARAMUPD';
    PWOPER_REPRINT:
      Result := 'PWOPER_REPRINT';
    PWOPER_RPTTRUNC:
      Result := 'PWOPER_RPTTRUNC';
    PWOPER_RPTDETAIL:
      Result := 'PWOPER_RPTDETAIL';
    PWOPER_ADMIN:
      Result := 'PWOPER_ADMIN';
    PWOPER_SALE:
      Result := 'PWOPER_SALE';
    PWOPER_SALEVOID:
      Result := 'PWOPER_SALEVOID';
    PWOPER_PREPAID:
      Result := 'PWOPER_PREPAID';
    PWOPER_CHECKINQ:
      Result := 'PWOPER_CHECKINQ';
    PWOPER_RETBALINQ:
      Result := 'PWOPER_RETBALINQ';
    PWOPER_CRDBALINQ:
      Result := 'PWOPER_CRDBALINQ';
    PWOPER_INITIALIZ:
      Result := 'PWOPER_INITIALIZ';
    PWOPER_SETTLEMNT:
      Result := 'PWOPER_SETTLEMNT';
    PWOPER_PREAUTH:
      Result := 'PWOPER_PREAUTH';
    PWOPER_PREAUTVOID:
      Result := 'PWOPER_PREAUTVOID';
    PWOPER_CASHWDRWL:
      Result := 'PWOPER_CASHWDRWL';
    PWOPER_LOCALMAINT:
      Result := 'PWOPER_LOCALMAINT';
    PWOPER_FINANCINQ:
      Result := 'PWOPER_FINANCINQ';
    PWOPER_ADDRVERIF:
      Result := 'PWOPER_ADDRVERIF';
    PWOPER_SALEPRE:
      Result := 'PWOPER_SALEPRE';
    PWOPER_LOYCREDIT:
      Result := 'PWOPER_LOYCREDIT';
    PWOPER_LOYCREDVOID:
      Result := 'PWOPER_LOYCREDVOID';
    PWOPER_LOYDEBIT:
      Result := 'PWOPER_LOYDEBIT';
    PWOPER_LOYDEBVOID:
      Result := 'PWOPER_LOYDEBVOID';
    PWOPER_VOID:
      Result := 'PWOPER_VOID';
    PWOPER_VERSION:
      Result := 'PWOPER_VERSION';
    PWOPER_CONFIG:
      Result := 'PWOPER_CONFIG';
    PWOPER_MAINTENANCE:
      Result := 'PWOPER_MAINTENANCE';

  end;

end;

// =========================================================
// Retorna Constante de retorno de evento PIn-Pad
// =========================================================
Function TCEnums.E_PWPPEVT(PWPPEVT: Integer): String;
begin
  case PWPPEVT of

    PWPPEVT_MAGSTRIPE:
      Result := 'PWPPEVT_MAGSTRIPE';
    PWPPEVT_ICC:
      Result := 'PWPPEVT_ICC';
    PWPPEVT_CTLS:
      Result := 'PWPPEVT_CTLS';
    PWPPEVT_KEYCONF:
      Result := 'PWPPEVT_KEYCONF';
    PWPPEVT_KEYBACKSP:
      Result := 'PWPPEVT_KEYBACKSP';
    PWPPEVT_KEYCANC:
      Result := 'PWPPEVT_KEYCANC';
    PWPPEVT_KEYF1:
      Result := 'PWPPEVT_KEYF1';
    PWPPEVT_KEYF2:
      Result := 'PWPPEVT_KEYF2';
    PWPPEVT_KEYF3:
      Result := 'PWPPEVT_KEYF3';
    PWPPEVT_KEYF4:
      Result := 'PWPPEVT_KEYF4';

  end;

end;

// =================================================================
// Retorno da Biblioteca
// =================================================================
Function TCEnums.E_PWRET(PWRET: Integer): string;
begin

  case PWRET of

    PWRET_OK:
      Result := 'PWRET_OK';
    PWRET_FROMHOSTPENDTRN:
      Result := 'PWRET_FROMHOSTPENDTRN';
    PWRET_FROMHOSTPOSAUTHERR:
      Result := 'PWRET_FROMHOSTPOSAUTHERR';
    PWRET_FROMHOSTUSRAUTHERR:
      Result := 'PWRET_FROMHOSTUSRAUTHERR';
    PWRET_FROMHOST:
      Result := 'PWRET_FROMHOST';
    PWRET_TLVERR:
      Result := 'PWRET_TLVERR';
    PWRET_SRVINVPARAM:
      Result := 'PWRET_SRVINVPARAM';
    PWRET_REQPARAM:
      Result := 'PWRET_REQPARAM';
    PWRET_HOSTCONNUNK:
      Result := 'PWRET_HOSTCONNUNK';
    PWRET_INTERNALERR:
      Result := 'PWRET_INTERNALERR';
    PWRET_BLOCKED:
      Result := 'PWRET_BLOCKED';
    PWRET_FROMHOSTTRNNFOUND:
      Result := 'PWRET_FROMHOSTTRNNFOUND';
    PWRET_PARAMSFILEERR:
      Result := 'PWRET_PARAMSFILEERR';
    PWRET_NOCARDENTMODE:
      Result := 'PWRET_NOCARDENTMODE';
    PWRET_INVALIDVIRTMERCH:
      Result := 'PWRET_INVALIDVIRTMERCH';
    PWRET_HOSTTIMEOUT:
      Result := 'PWRET_HOSTTIMEOUT';
    PWRET_CONFIGREQUIRED:
      Result := 'PWRET_CONFIGREQUIRED';
    PWRET_HOSTCONNERR:
      Result := 'PWRET_HOSTCONNERR';
    PWRET_HOSTCONNLOST:
      Result := 'PWRET_HOSTCONNLOST';
    PWRET_FILEERR:
      Result := 'PWRET_FILEERR';
    PWRET_PINPADERR:
      Result := 'PWRET_PINPADERR';
    PWRET_MAGSTRIPEERR:
      Result := 'PWRET_MAGSTRIPEERR';
    PWRET_PPCRYPTERR:
      Result := 'PWRET_PPCRYPTERR';
    PWRET_SSLCERTERR:
      Result := 'PWRET_SSLCERTERR';
    PWRET_SSLNCONN:
      Result := 'PWRET_SSLNCONN';
    PWRET_GPRSATTACHFAILED:
      Result := 'PWRET_GPRSATTACHFAILED';
    PWRET_INVPARAM:
      Result := 'PWRET_INVPARAM';
    PWRET_NOTINST:
      Result := 'PWRET_NOTINST';
    PWRET_MOREDATA:
      Result := 'PWRET_MOREDATA';
    PWRET_NODATA:
      Result := 'PWRET_NODATA';
    PWRET_DISPLAY:
      Result := 'PWRET_DISPLAY';
    PWRET_INVCALL:
      Result := 'PWRET_INVCALL';
    PWRET_NOTHING:
      Result := 'PWRET_NOTHING';
    PWRET_BUFOVFLW:
      Result := 'PWRET_BUFOVFLW';
    PWRET_CANCEL:
      Result := 'PWRET_CANCEL';
    PWRET_TIMEOUT:
      Result := 'PWRET_TIMEOUT';
    PWRET_PPNOTFOUND:
      Result := 'PWRET_PPNOTFOUND';
    PWRET_TRNNOTINIT:
      Result := 'PWRET_TRNNOTINIT';
    PWRET_DLLNOTINIT:
      Result := 'PWRET_DLLNOTINIT';
    PWRET_FALLBACK:
      Result := 'PWRET_FALLBACK';
    PWRET_WRITERR:
      Result := 'PWRET_WRITERR';
    PWRET_PPCOMERR:
      Result := 'PWRET_PPCOMERR';
    PWRET_NOMANDATORY:
      Result := 'PWRET_NOMANDATORY';
    PWRET_INVALIDTRN:
      Result := 'PWRET_INVALIDTRN';
    PWRET_PPS_XXX:
      Result := 'PWRET_PPS_XXX';

  end;

end;

end.
