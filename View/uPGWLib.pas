// ************************************************************************************
{
  unit:   PGWLib
  Classe: TPGWLib

  Data de criação  : 20/05/2019
  Autor            :
  Descrição        : Classe contendo Todos os Metodos de Operabilidade
}
// ************************************************************************************
unit uPGWLib;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.StrUtils, System.AnsiStrings,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Types, System.TypInfo, uEnums, uLib;

Type

  // ========================================================
  // Record que descreve cada membro da estrutura PW_GetData:
  // ========================================================
  TPW_GetData = record
    wIdentificador: Word;
    bTipoDeDado: Byte;
    szPrompt: Array [0 .. 83] of AnsiChar;
    bNumOpcoesMenu: Byte;
    vszTextoMenu: Array [0 .. 39] of Array [0 .. 40] of AnsiChar;
    vszValorMenu: Array [0 .. 39] of Array [0 .. 255] of AnsiChar;
    szMascaraDeCaptura: Array [0 .. 40] of AnsiChar;
    bTiposEntradaPermitidos: Byte;
    bTamanhoMinimo: Byte;
    bTamanhoMaximo: Byte;
    ulValorMinimo: UInt32;
    ulValorMaximo: UInt32;
    bOcultarDadosDigitados: Byte;
    bValidacaoDado: Byte;
    bAceitaNulo: Byte;
    szValorInicial: Array [0 .. 40] of AnsiChar;
    bTeclasDeAtalho: Byte;
    szMsgValidacao: Array [0 .. 83] of AnsiChar;
    szMsgConfirmacao: Array [0 .. 83] of AnsiChar;
    szMsgDadoMaior: Array [0 .. 83] of AnsiChar;
    szMsgDadoMenor: Array [0 .. 83] of AnsiChar;
    bCapturarDataVencCartao: Byte;
    ulTipoEntradaCartao: UInt32;
    bItemInicial: Byte;
    bNumeroCapturas: Byte;
    szMsgPrevia: Array [0 .. 83] of AnsiChar;
    bTipoEntradaCodigoBarras: Byte;
    bOmiteMsgAlerta: Byte;
    bIniciaPelaEsquerda: Byte;
    bNotificarCancelamento: Byte;
    bAlinhaPelaDireita: Byte;
  end;

  PW_GetData = Array [0 .. 10] of TPW_GetData;

  // Retorno de GetResult
  TPZ_GetData = record
    pszDataxx: Array [0 .. 10000] of AnsiChar;
  end;

  PSZ_GetData = Array [0 .. 0] of TPZ_GetData;

  //
  CPT_GetDado = record
    pszData: Array [0 .. 32] of AnsiChar;
  end;

  PSZ_GetDado = Array [0 .. 0] of CPT_GetDado;

  // Temporário
  TPZ_GetDisplay = record
    szDspMsg: Array [0 .. 127] of AnsiChar;
    szAux: Array [0 .. 1023] of AnsiChar;
    szMsgPinPad: Array [0 .. 33] of AnsiChar;
  end;

  PSZ_GetDisplay = Array [0 .. 10] of TPZ_GetDisplay;

  // ====================================================================
  // Estrutura para armazenamento de dados para Tipos de Operação
  // ====================================================================
  TPW_Operations = record
    bOperType: Byte;
    szText: Array [0 .. 21] of char;
    szValue: Array [0 .. 21] of char;
  end;

  PW_Operations = Array [0 .. 9] of TPW_Operations;

  // ====================================================================
  // Estrutura para armazenamento de dados para confirmação de transação
  // ====================================================================
  TConfirmaData = record
    szReqNum: Array [0 .. 10] of AnsiChar;
    szExtRef: Array [0 .. 50] of AnsiChar;
    szLocRef: Array [0 .. 50] of AnsiChar;
    szVirtMerch: Array [0 .. 18] of AnsiChar;
    szAuthSyst: Array [0 .. 20] of AnsiChar;
  end;

  ConfirmaData = Array [0 .. 0] of TConfirmaData;

  TPGWLib = class
  private
    // private
    { private declarations }
  protected
    { protected declarations }
  public

    constructor Create;
    Destructor Destroy; Override; // declaração do metodo destrutor

    procedure GetVersao;

    function Aguardando: string;

    function Count: Integer;

    function Init(caminho: string): Integer;

    function TestaInit(iparam: Integer): Integer;

    function Instalacao: Integer;

    function venda: Integer;

    function iExecGetData(vstGetData: PW_GetData; iNumParam: Integer): Integer;

    function ConfirmaTrasacao: Integer;

    function ConfirmaTrasacaoAA: Integer;

    function GetParamConfirma: Integer;

    function GetParamPendenteConfirma: Integer;

    function PrintReturnDescription(iReturnCode: Integer;
      pszDspMsg: string): Integer;

    function PrintResultParams: Integer;

    function pszGetInfoDescription(wIdentificador: Integer): string;

    function Cancelamento: Integer;

    function Reimpressao: Integer;

    function Relatorios: Integer;

    function Admin: Integer;

    function MandaMemo(Descr: string): Integer;

    function CapturaPinPad(nome: string; identificador: Byte; min: Byte;
      max: Byte): Integer;

    function TesteAA: Integer;

    function TestaLoop: Integer;

    Function PORTADOR(PWDADO: string): Integer;

    Function OPERACAO(PWOPER: string): Integer;

  end;

Const

  // Informações Auxiliares para testes
  PWINFO_AUTHMNGTUSER = '314159';
  PWINFO_POSID = '60376';
  PWINFO_MERCHCNPJCPF = '20726059000179';
  PWINFO_DESTTCPIP = 'app.tpgw.ntk.com.br:17502';
  PWINFO_USINGPINPAD = '1';
  PWINFO_PPCOMMPORT = '0';

  // =====================================================================================*/
  // Função Auxiliar
  // =====================================================================================*/
function tbKeyIsDown(const Key: Integer): Boolean;

// =====================================================================================*/
// Parametros que devem ser informados obrigatoriamente a cada transação
// =====================================================================================*/
procedure AddMandatoryParams;

// ========================================================================================================================================
{ Esta função é utilizada para inicializar a biblioteca, e retorna imediatamente.
  Deve ser garantido que uma chamada dela retorne PWRET_OK antes de chamar qualquer outra função.

  Entradas:
  pszWorkingDir Diretório de trabalho (caminho completo, com final nulo) para uso exclusivo do Pay&Go Web

  Saídas: Nenhuma.

  Retorno: PWRET_OK .................................. Operação bem sucedida.
  PWRET_WRITERR ....................... Falha de gravação no diretório informado.
  PWRET_INVCALL ......................... Já foi efetuada uma chamada à função PW_iInit após o carregamento da biblioteca.
  Outro ..................................Outro erro de execução (ver “10. Códigos de retorno”, página 78 do Manual).
  Uma mensagem de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// ============================================================================================================================================
function PW_iInit(pszWorkingDir: AnsiString): SmallInt; StdCall;
  External 'PGWebLib.dll';

// =============================================================================================================================================
{ Esta função deve ser chamada para iniciar uma nova transação através do Pay&Go Web, e retorna imediatamente.

  Entradas:
  iOper Tipo de transação a ser realizada (PWOPER_xxx, conforme tabela).

  Saídas: Nenhuma

  Retorno:
  PWRET_OK .................................. Transação inicializada.
  PWRET_DLLNOTINIT ................... Não foi executado PW_iInit.
  PWRET_NOTINST ........................ É necessário efetuar uma transação de Instalação.
  Outro ................................ Outro erro de execução (ver “10. Códigos de retorno”, página 78 Manual).
  Uma mensagem de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// ==============================================================================================================================================
function PW_iNewTransac(iOper: Byte): SmallInt; StdCall;
  External 'PGWebLib.dll';

// =============================================================================================================================================
{ Esta função é utilizada para alimentar a biblioteca com as informações da transação a ser realizada,
  e retorna imediatamente. Estas informações podem ser:
  - Pré-fixadas na Automação;
  - Capturadas do operador pela Automação antes do acionamento do Pay&Go Web;
  - Capturadas do operador após solicitação pelo Pay&Go Web (retorno PW_MOREDATA por PW_iExecTransac).


  Entradas:
  wParam Identificador do parâmetro (PWINFO_xxx, ver lista completa em “9. Dicionário de dados”, página 72).
  pszValue Valor do parâmetro (string ASCII com final nulo).

  Saídas: Nenhuma

  Retorno:
  PWRET_OK .................................. Parametro Acrescentado com sucesso.
  PWRET_INVPARAM .................... O valor do parâmetro é inválido
  PWRET_DLLNOTINIT ................... Não foi executado PW_iInit
  PWRET_TRNNOTINIT .................. Não foi executado PW_iNewTransac (ver página 14).
  PWRET_NOTINST ........................ É necessário efetuar uma transação de Instalação
  Outro ........................................... Outro erro de execução (ver “10. Códigos de retorno”, página 78). Uma
  mensagem de erro pode ser obtida através da função PW_iGetResult
  (PWINFO_RESULTMSG).
}
// ==============================================================================================================================================
function PW_iAddParam(wParam: SmallInt; szValue: AnsiString): Int16; StdCall;
  External 'PGWebLib.dll';

// =============================================================================================================================================
{ Esta função tenta realizar uma transação através do Pay&Go Web, utilizando os parâmetros
  previamente definidos através de PW_iAddParam. Caso algum dado adicional precise ser informado,
  o retorno será PWRET_MOREDATA e o parâmetro pvstParam retornará informações dos dados que
  ainda devem ser capturados.

  Esta função, por se comunicar com a infraestrutura Pay&Go Web, pode demorar alguns segundos
  para retornar.


  Entradas:
  piNumParam Quantidade máxima de dados que podem ser capturados de uma vez, caso o retorno
  seja PW_MOREDATA. (Deve refletir o tamanho da área de memória apontada por
  pvstParam.) Valor sugerido: 9.

  Saídas:
  pvstParam  Lista e características dos dados que precisam ser informados para executar a transação.
  Consultar “8.Captura de dados” (página 65) para a descrição da estrutura
  e instruções para a captura de dados adicionais. piNumParam Quantidade de dados adicionais que precisam ser capturados
  (quantidade de ocorrências preenchidas em pvstParam

  Retorno:
  PWRET_OK .................................. Transação realizada com sucesso. Os resultados da transação devem ser obtidos através da função PW_iGetResult.
  PWRET_NOTHING ....................... Nada a fazer, fazer as validações locais necessárias e chamar a função PW_iExecTransac novamente.
  PWRET_MOREDATA ................... Mais dados são requeridos para executar a transação.
  PWRET_DLLNOTINIT ................... Não foi executado PW_iInit.
  PWRET_TRNNOTINIT .................. Não foi executado PW_iNewTransac (ver página 14).
  PWRET_NOTINST ........................ É necessário efetuar uma transação de Instalação.
  PWRET_NOMANDATORY ........... Algum dos parâmetros obrigatórios não foi adicionado (ver página 17).
  Outro ........................................... Outro erro de execução (ver “10. Códigos de retorno”, página 78 Manual).
  Uma mensagem de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =============================================================================================================================================
function PW_iExecTransac(var pvstParam: PW_GetData; piNumParam: pointer): Int16;
  stdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iGetResult

  Descricao  :  Esta função pode ser chamada para obter informações que resultaram da transação efetuada,
  independentemente de ter sido bem ou mal sucedida, e retorna imediatamente.

  Entradas   :  iInfo:	   Código da informação solicitada sendo requisitada (PWINFO_xxx, ver lista completa
  em “9. Dicionário de dados”, página 36).
  ulDataSize:	Tamanho (em bytes) da área de memória apontada por pszData. Prever um tamanho maior
  que o máximo previsto para o dado solicitado.


  Saidas     :  pszData:	   Valor da informação solicitada (string ASCII com terminador nulo).

  Retorno    :  PWRET_OK	         Sucesso. pszData contém o valor solicitado.
  PWRET_NODATA	   A informação solicitada não está disponível.
  PWRET_BUFOVFLW 	O valor da informação solicitada não cabe em pszData.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_TRNNOTINIT	Não foi executado PW_iNewTransac (ver página 10).
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iGetResult(iInfo: Int16; var pszData: PSZ_GetData;
  ulDataSize: UInt32): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================
{
  Funcao     :  PW_iConfirmation

  Descricao  :  Esta função informa ao Pay&Go Web o status final da transação em curso (confirmada ou desfeita).
  Consultar “7. Confirmação de transação” (página 28) para informações adicionais.

  Entradas   :  ulStatus:   	Resultado da transação (PWCNF_xxx, ver lista abaixo).
  pszReqNum:  	Referência local da transação, obtida através de PW_iGetResult (PWINFO_REQNUM).
  pszLocRef:  	Referência da transação para a infraestrutura Pay&Go Web, obtida através de PW_iGetResult (PWINFO_AUTLOCREF).
  pszExtRef:  	Referência da transação para o Provedor, obtida através de PW_iGetResult (PWINFO_AUTEXTREF).
  pszVirtMerch:	Identificador do Estabelecimento, obtido através de PW_iGetResult (PWINFO_VIRTMERCH).
  pszAuthSyst:   Nome do Provedor, obtido através de PW_iGetResult (PWINFO_AUTHSYST).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         O status da transação foi atualizado com sucesso.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================
function PW_iConfirmation(ulResult: UInt32; pszReqNum: AnsiString;
  pszLocRef: AnsiString; pszExtRef: AnsiString; pszVirtMerch: AnsiString;
  pszAuthSyst: AnsiString): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iIdleProc

  Descricao  :  Para o correto funcionamento do sistema, a biblioteca do Pay&Go Web precisa de tempos em tempos
  executar tarefas automáticas enquanto não está realizando nenhuma transação a pedido da Automação.

  Entradas   :  não há.

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Operação realizada com êxito.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iIdleProc(): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================
{
  Funcao     :  PW_iGetOperations

  Descricao  :  Esta função pode ser chamada para obter quais operações o Pay&Go WEB disponibiliza no momento,
  sejam elas administrativas, de venda ou ambas.

  Entradas   :              bOperType	      Soma dos tipos de operação a serem incluídos na estrutura de
  retorno (PWOPTYPE_xxx).
  piNumOperations	Número máximo de operações que pode ser retornado. (Deve refletir
  o tamanho da área de memória apontada por pvstOperations).

  Saídas     :              piNumOperations	Número de operações disponíveis no Pay&Go WEB.
  vstOperations	   Lista das operações disponíveis e suas características.


  Retorno    :  PWRET_OK	         Operação realizada com êxito.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================
function PW_iGetOperations(bOperType: Byte; var vstOperatios: PW_Operations;
  piNumOperations: Int16): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPAbort

  Descricao  :  Esta função pode ser utilizada pela Automação para interromper uma captura de dados no PIN-pad
  em curso, e retorna imediatamente.

  Entradas   :  não há.

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Operação interrompida com sucesso.
  PWRET_PPCOMERR	   Falha na comunicação com o PIN-pad.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPAbort(): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPEventLoop

  Descricao  :  Esta função deverá ser chamada em “loop” até que seja retornado PWRET_OK (ou um erro fatal). Nesse
  “loop”, caso o retorno seja PWRET_DISPLAY o ponto de captura deverá atualizar o “display” com as
  mensagens recebidas da biblioteca.

  Entradas   :  ulDisplaySize	Tamanho (em bytes) da área de memória apontada por pszDisplay.
  Tamanho mínimo recomendado: 100 bytes.

  Saidas     :  pszDisplay	   Caso o retorno da função seja PWRET_DISPLAY, contém uma mensagem de texto
  (string ASCII com terminal nulo) a ser apresentada pela Automação na interface com
  o usuário principal. Para o formato desta mensagem, consultar “4.3.Interface com o
  usuário”, página 8.

  Retorno    :  PWRET_NOTHING	   Nada a fazer, continuar aguardando o processamento do PIN-pad.
  PWRET_DISPLAY	   Apresentar a mensagem recebida em pszDisplay e continuar aguardando o processamento do PIN-pad.
  PWRET_OK	         Captura de dados realizada com êxito, prosseguir com a transação.
  PWRET_CANCEL	   A operação foi cancelada pelo Cliente no PIN-pad (tecla [CANCEL]).
  PWRET_TIMEOUT	   O Cliente não realizou a captura no tempo limite.
  PWRET_FALLBACK	   Ocorreu um erro na leitura do cartão, passar a aceitar a digitação do número do cartão, caso já não esteja aceitando.
  PWRET_PPCOMERR	   Falha na comunicação com o PIN-pad.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_INVCALL	   Não há captura de dados no PIN-pad em curso.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPEventLoop(var pszDisplay; ulDisplaySize: UInt32): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPGetCard

  Descricao  :  Esta função é utilizada para realizar a leitura de um cartão (magnético, com chip com contato,
  ou sem contato) no PIN-pad.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPGetCard(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPGetPIN

  Descricao  :  Esta função é utilizada para realizar a captura no PIN-pad da senha (ou outro dado criptografado)
  do Cliente.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPGetPIN(uiIndex: UInt16): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPGetData

  Descricao  :  Esta função é utilizada para fazer a captura no PIN-pad de um dado não sensível do Cliente..

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  nao ha.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPGetData(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPGoOnChip

  Descricao  :  Esta função é utilizada para realizar o processamento off-line (antes da comunicação com o Provedor)
  de um cartão com chip no PIN-pad.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPGoOnChip(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPFinishChip

  Descricao  :  Esta função é utilizada para finalizar o processamento on-line (após comunicação com o Provedor)
  de um cartão com chip no PIN-pad.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPFinishChip(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPConfirmData

  Descricao  :  Esta função é utilizada para obter do Cliente a confirmação de uma informação no PIN-pad.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPConfirmData(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPRemoveCard

  Descricao  :  Esta função é utilizada para fazer uma remoção de cartão do PIN-pad.

  Entradas   :  não há.

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_INVPARAM	   O valor de uiIndex informado não corresponde a uma captura de dados deste tipo.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPRemoveCard(): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPDisplay

  Descricao  :  Esta função é utilizada para apresentar uma mensagem no PIN-pad

  Entradas   :  pszMsg   Mensagem a ser apresentada no PIN-pad. O caractere ‘\r’ (0Dh) indica uma quebra de linha.

  Saidas     :  não há.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPDisplay(pszMsg: AnsiString): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPWaitEvent

  Descricao  :  Esta função é utilizada para aguardar a ocorrência de um evento no PIN-pad.

  Entradas   :  não há.

  Saidas     :  pulEvent	         Evento ocorrido.

  Retorno    :  PWRET_OK	         Captura iniciada com sucesso, chamar PW_iPPEventLoop para obter o resultado.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
function PW_iPPWaitEvent(var pulEvent: UInt32): Int16; StdCall;
  External 'PGWebLib.dll';
// function PW_iPPWaitEvent(pulEvent:UInt32):Int16; StdCall; External 'PGWebLib.dll';

// ===========================================================================*\
{ Funcao   : PW_iPPGenericCMD

  Descricao  :  Realiza comando genérico de PIN-pad.

  Entradas   :  uiIndex	Índice (iniciado em 0) do dado solicitado na última execução de PW_iExecTransac
  (índice do dado no vetor pvstParam).

  Saidas     :  Não há.

  Retorno    :  PWRET_xxx.
}
// ===========================================================================*/
function PW_iPPGenericCMD(uiIndex: UInt16): Int16; StdCall;
  External 'PGWebLib.dll';

// ===========================================================================*\
{ Funcao     : PW_iTransactionInquiry

  Descricao  :  Esta função é utilizada para realizar uma consulta de transações
  efetuadas por um ponto de captura junto ao Pay&Go WEB.

  Entradas   :  pszXmlRequest	Arquivo de entrada no formato XML, contendo as informações
  necessárias para fazer a consulta pretendida.
  ulXmlResponseLen Tamanho da string pszXmlResponse.

  Saidas     :  pszXmlResponse	Arquivo de saída no formato XML, contendo o resultado da consulta
  efetuada, o arquivo de saída tem todos os elementos do arquivo de entrada.

  Retorno    :  PWRET_xxx.
}
// ===========================================================================*/
function PW_iTransactionInquiry(const pszXmlRequest: char; pszXmlResponse: char;
  ulXmlResponseLen: UInt32): Int16; StdCall; External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iGetUserData

  Descricao  :  Esta função é utilizada para obter um dado digitado pelo portador do cartão no PIN-pad.

  Entradas   :  uiMessageId : Identificador da mensagem a ser exibida como prompt para a captura.
  bMinLen     : Tamanho mínimo do dado a ser digitado.
  bMaxLen     : Tamanho máximo do dado a ser digitado.
  iToutSec    : Tempo limite para a digitação do dado em segundos.

  Saídas     :  pszData     : Dado digitado pelo portador do cartão no PIN-pad.

  Retorno    :  PWRET_OK	         Operação realizada com êxito.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  PWRET_CANCEL	   A operação foi cancelada pelo Cliente no PIN-pad (tecla [CANCEL]).
  PWRET_TIMEOUT	   O Cliente não realizou a captura no tempo limite.
  PWRET_PPCOMERR	   Falha na comunicação com o PIN-pad.
  PWRET_INVCALL	   Não é possível capturar dados em um PIN-pad não ABECS.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40). Uma mensagem
  de erro pode ser obtida através da função PW_iGetResult (PWINFO_RESULTMSG).
}
// =========================================================================================================*/
// PW_iPPGetUserData(Uint16 uiMessageId, Byte bMinLen, Byte bMaxLen, Int16 iToutSec, char *pszData);
function PW_iPPGetUserData(uiMessageId: UInt16; bMinLen: Byte; bMaxLen: Byte;
  iToutSec: Int16; var pszData: PSZ_GetDado): Int16; StdCall;
  External 'PGWebLib.dll';

// =========================================================================================================*\
{ Funcao     :  PW_iPPGetPINBlock

  Descricao  :  Esta função é utilizada para obter o PIN block gerado a partir de um dado digitado pelo usuário no PIN-pad.

  Entradas   :  bKeyID	      : Índice da Master Key (para chave PayGo, utilizar o índice “12”).
  pszWorkingKey	: Sequência 32 caracteres utilizados para a geração do PIN block (dois valores iguais digitados pelo usuário com duas pszWorkingKey diferentes irão gerar dois PIN block diferentes.
  bMinLen	      : Tamanho mínimo do dado a ser digitado (a partir de 4).
  bMaxLen     	: Tamanho máximo do dado a ser digitado.
  iToutSec    	: Tempo limite para a digitação do dado em segundos.
  pszPrompt	   : Mensagem de 32 caracteres (2 linhas com 16 colunas) para apresentação no momento do pedido do dado do usuário.


  Saídas     :  pszData        : PIN block gerado com base nos dados fornecidos na função combinados com o dado digitado pelo usuário no PIN-pad.

  Retorno    :  PWRET_OK	         Operação realizada com êxito.
  PWRET_DLLNOTINIT	Não foi executado PW_iInit.
  PWRET_NOTINST	   É necessário efetuar uma transação de Instalação.
  PWRET_CANCEL	   A operação foi cancelada pelo Cliente no PIN-pad (tecla [CANCEL]).
  PWRET_TIMEOUT	   O Cliente não realizou a captura no tempo limite.
  PWRET_PPCOMERR	   Falha na comunicação com o PIN-pad.
  Outro	            Outro erro de execução (ver “10. Códigos de retorno”, página 40).
}
// =========================================================================================================*/
function PW_iPPGetPINBlock(bKeyID: Byte; pszWorkingKey: AnsiString;
  bMinLen: Byte; bMaxLen: Byte; iToutSec: Int16; pszPrompt: AnsiString;
  var pszData: PSZ_GetDado): Int16; StdCall; External 'PGWebLib.dll';

implementation

uses uTEF_Adm, uLib02, Udados, uFormaPagamento;

var

  mRCancelado: Integer;

  gfAutoAtendimento: Boolean;

  xpszData: Array [0 .. 20] of char;
  iRetorno: SmallInt;
  vGetdataArray: PW_GetData;
  vstGetData: PW_GetData;
  vGetpszData: PSZ_GetData;
  vGetpszErro: PSZ_GetData;

  vGetpszDado: PSZ_GetDado;

  vGetMsg: PSZ_GetDisplay;

  vGetpszDisplay: PSZ_GetDisplay;
  xNumParam: Int16;
  xSzValue: AnsiString;
  pvstParam: PW_GetData;

  gstConfirmData: ConfirmaData;

  iNumParam: Int16;
  iRet: Int16;

  PWEnums: TCEnums;

  txt: string;

  Y: Integer;

  // ============================================================================
  {
    Busca Parametros para confirmação automatica da Ultima Transação de Venda.
  }
  // ============================================================================
function TPGWLib.GetParamConfirma: Integer;
var
  I: Integer;

begin

  iRetorno := PW_iGetResult(PWEnums.PWINFO_REQNUM, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szReqNum) do
  begin
    gstConfirmData[0].szReqNum[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_AUTEXTREF, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szExtRef) do
  begin
    gstConfirmData[0].szExtRef[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_AUTLOCREF, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szLocRef) do
  begin
    gstConfirmData[0].szLocRef[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_VIRTMERCH, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szVirtMerch) do
  begin
    gstConfirmData[0].szVirtMerch[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_AUTHSYST, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szAuthSyst) do
  begin
    gstConfirmData[0].szAuthSyst[I] := vGetpszData[0].pszDataxx[I];
  end;

  Result := iRetorno;

end;

// ============================================================================
{
  Busca Parametros para confirmação automatica da Ultima Transação de Venda.
}
// ============================================================================
function TPGWLib.GetParamPendenteConfirma: Integer;
var
  I: Integer;

begin

  iRetorno := PW_iGetResult(PWEnums.PWINFO_PNDREQNUM, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szReqNum) do
  begin
    gstConfirmData[0].szReqNum[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_PNDAUTEXTREF, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szExtRef) do
  begin
    gstConfirmData[0].szExtRef[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_PNDAUTLOCREF, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szLocRef) do
  begin
    gstConfirmData[0].szLocRef[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_PNDVIRTMERCH, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szVirtMerch) do
  begin
    gstConfirmData[0].szVirtMerch[I] := vGetpszData[0].pszDataxx[I];
  end;

  iRetorno := PW_iGetResult(PWEnums.PWINFO_PNDAUTHSYST, vGetpszData,
    SizeOf(vGetpszData));
  for I := 0 to SizeOf(gstConfirmData[0].szAuthSyst) do
  begin
    gstConfirmData[0].szAuthSyst[I] := vGetpszData[0].pszDataxx[I];
  end;

  Result := iRetorno;

end;

procedure TPGWLib.GetVersao();
var
  iparam: Int16;
  Volta: String;
  vRetorno: Integer;
  winfo: Integer;
  wvolta: PChar;
  wxyvolta: string;
  xNumParam: Integer;
  Wretornaerro: PSZ_GetData;
  iRetErro: Integer;
begin

  xNumParam := 10;

  AddMandatoryParams();

  // Nova Transação para PWOPER_VERSION
  iRet := PW_iNewTransac(PWEnums.PWOPER_VERSION);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  MandaMemo(' ');
  MandaMemo('PWOPER_VERSION - AGUARDE ....');

  // Executa Transação
  vRetorno := PW_iExecTransac(vGetdataArray, @xNumParam);

  // Captura Informação
  iRet := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
    SizeOf(vGetpszData));

  MandaMemo(' ');
  MandaMemo('Versão da DLL : ' + vGetpszData[0].pszDataxx);

  // PrintResultParams();

end;

// =====================================================================================
{
  Administrativo
}
// =====================================================================================
function TPGWLib.Admin: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;
begin

  I := 0;

  iRet := PW_iNewTransac(PWEnums.PWOPER_ADMIN);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);
    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> 0) then
      begin
        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
      end;

      Break;

    end;

  end;

  // Busca necessidade de Confirmação.
  iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
    SizeOf(vGetpszData));
  Volta := vGetpszData[0].pszDataxx;
  if (Volta = '1') then
  begin
    MandaMemo(' PWINFO_CNFREQ = 1');
    MandaMemo(' ');
    MandaMemo('É Necessário Confirmar esta Transação !');
    MandaMemo(' ');

    // Metodo confirma a transação
    ConfirmaTrasacao();

  end;

  PrintResultParams();

end;

// =====================================================================================
{
  Cancela uma Transação de Venda
}
// =====================================================================================
function TPGWLib.Cancelamento: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;

begin

  I := 0;

  iRet := PW_iNewTransac(PWEnums.PWOPER_SALEVOID);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);
    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> PWEnums.PWRET_OK) then
      begin
        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      if iRet <> PWEnums.PWRET_OK then
      begin

        MandaMemo('Erro : ...' + IntToStr(iRet));
        MandaMemo(' ');

        Break;

      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
      end;

      // Busca necessidade de Confirmação.
      iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      if (Volta = '1') then
      begin
        MandaMemo(' PWINFO_CNFREQ = 1');
        MandaMemo(' ');
        MandaMemo('É Necessário Confirmar esta Transação !');
        MandaMemo(' ');

        // Metodo confirma a transação
        ConfirmaTrasacao();

      end;

      Break;

    end;

  end;

  PrintResultParams();

end;

function TPGWLib.CapturaPinPad(nome: string; identificador: Byte;
  min, max: Byte): Integer;
var
  teste: string;
  codigo: Byte;
  Volta: String;
  iRetErro: Integer;
  iRetValor: Integer;
  szWorkingKey: AnsiString;
  szPrompt: AnsiString;
begin

  // Dois valores diferentes irão gerar PIN blocks diferentes, mesmo que a senha digitada seja a mesma
  szWorkingKey := '12345678901234567890123456789012';
  // Mensagem sempre de 32 caracteres (2 linhas com 16 colunas)
  // para apresentação no momento do pedido do dado do usuário (chr(13) para quebra de linha).
  szPrompt := 'TESTE DE CAPTURA' + chr(13) + 'DE PIN BLOCK:   ';

  if (min < 1) then
  begin
    ShowMessage('Informar Tamanho Minimo Válido');
    Result := 1;
    Exit;
  end;

  if (max < 1) then
  begin
    ShowMessage('Informar Tamanho Maximo Válido');
    Result := 1;
    Exit;
  end;


  // Escolha efetuada

  // PW_iPPGetUserData
  { if (TelCaptura.RadioButton1.Checked = True) then
    begin
    if (nome = '') then
    begin
    ShowMessage('Escolha Mensagem Válida');
    Result := 1;
    Exit;
    end;

    // Busca  valor da constante escolhida
    iRetValor := PORTADOR(nome);

    iRet := PW_iPPGetUserData(iRetValor,min,max,30,vGetpszDado);
    end; }

  // PW_iPPGetPINBlock
  { if (TelCaptura.RadioButton2.Checked = True) then
    begin
    if (min < 4) then
    begin
    ShowMessage('Informar Tamanho Minimo de 4 Caracteres');
    Result := 1;
    Exit;
    end;
    iRet := PW_iPPGetPINBlock(12, szWorkingKey, min, max, 30, szPrompt, vGetpszDado);
    end; }

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  { if (TelCaptura.RadioButton1.Checked = True) then
    begin
    // PW_iPPGetUserData
    TelCaptura.Label4.Visible := True;
    TelCaptura.Label4.Caption := 'Retorno de ' + nome + ' :' + vGetpszDado
    [0].pszData;
    end;

    if (TelCaptura.RadioButton2.Checked = True) then
    begin
    // PW_iPPGetPINBlock
    TelCaptura.Label4.Visible := True;
    TelCaptura.Label4.Caption := 'Retorno PW_iPPGetPINBlock: ' + vGetpszDado
    [0].pszData;
    end; }


  // Busca Todos os codigos e seus conteudos
  // PrintResultParams();


  // iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData, SizeOf(vGetpszData));
  // Volta := vGetpszData[0].pszDataxx;

end;

// =====================================================================================
{
  Funcao     :  ConfirmaTransacao

  Descricao  : Esta função informa ao Pay&Go Web o status final da transação
  em curso (confirmada ou desfeita).Confirmação de transação”
}
// =====================================================================================*/
function TPGWLib.ConfirmaTrasacao: Integer;
var
  strTagNFCe: String;
  strTagOP: AnsiString;
  falta: string;
  iRet: Integer;
  iRetorno: Integer;
  iRetErro: Integer;
  ulStatus: Integer;
  Menu: Byte;
  Volta: String;
  winfo: Integer;
  I: Integer;
  iRetI: Integer;
  Cont: string;
  tamanho: Integer;
  passou: Integer;
  testeNum: Array [0 .. 10] of char;
  WretornaConf: PSZ_GetData;
begin

  {

    Descrição das Confirmações:

    ' 1 - PWCNF_CNF_AUT         A transação foi confirmada pelo Ponto de Captura, sem intervenção do usuário '
    ' 2 - PWCNF_CNF_MANU_AUT    A transação foi confirmada manualmente na Automação
    ' 3 - PWCNF_REV_MANU_AUT    A transação foi desfeita manualmente na Automação
    ' 4 - PWCNF_REV_PRN_AU      A transação foi desfeita pela Automação, devido a uma falha na impressão
    do comprovante (não fiscal). A priori, não usar.
    Falhas na impressão não devem gerar desfazimento,
    deve ser solicitada a reimpressão da transaçã '
    ' 5 - PWCNF_REV_DISP_AUT    A transação foi desfeita pela Automação, devido a uma falha no
    mecanismo de liberação da mercadoria
    ' 6 - PWCNF_REV_COMM_AUT    A transação foi desfeita pela Automação, devido a uma falha de
    comunicação/integração com o ponto de captura (Cliente Pay&Go Web'
    ' 7 - PWCNF_REV_ABORT       A transação não foi finalizada, foi interrompida durante a captura de dados'
    ' 8 - PWCNF_REV_OTHER_AUT   A transação foi desfeita a pedido da Automação, por um outro motivo não previsto.
    ' 9 - PWCNF_REV_PWR_AUT     A transação foi desfeita automaticamente pela Automação,
    devido a uma queda de energia (reinício abrupto do sistema).
    '10 - PWCNF_REV_FISC_AUT    A transação foi desfeita automaticamente pela Automação,
    devido a uma falha de registro no sistema fiscal (impressora S@T, on-line, etc.).
  }

  falta := ' 1 - PWCNF_CNF_AUT       ' + chr(13) + ' 2 - PWCNF_CNF_MANU_AUT  ' +
    chr(13) + ' 3 - PWCNF_REV_MANU_AUT  ' + chr(13) +
    ' 4 - PWCNF_REV_PRN_AU    ' + chr(13) + ' 5 - PWCNF_REV_DISP_AUT  ' +
    chr(13) + ' 6 - PWCNF_REV_COMM_AUT  ' + chr(13) +
    ' 7 - PWCNF_REV_ABORT     ' + chr(13) + ' 8 - PWCNF_REV_OTHER_AUT ' +
    chr(13) + ' 9 - PWCNF_REV_PWR_AUT   ' + chr(13) +
    '10 - PWCNF_REV_FISC_AUT  ' + chr(13);

  strTagNFCe := '';

  while (X < 5) do
  begin

    strTagNFCe := vInputBox('Escolha Confirmação: ', falta, '', PWEnums.WInputH,
      PWEnums.WInputV);

    if (strTagNFCe = 'CANCELA') then
    begin
      mRCancelado := 1;
      Result := 1;
      Exit;
    end
    else
    begin
      mRCancelado := 0;
    end;

    try
      Menu := StrToInt(strTagNFCe);
    Except
      ShowMessage('Escolha uma opção Válida');
      Continue;
    end;

    case Menu of

      1:
        begin
          ulStatus := PWEnums.PWCNF_CNF_AUTO;
          Break;
        end;

      2:
        begin
          ulStatus := PWEnums.PWCNF_CNF_MANU_AUT;
          Break;
        end;
      3:
        begin
          ulStatus := PWEnums.PWCNF_REV_MANU_AUT;
          Break;
        end;
      4:
        begin
          ulStatus := PWEnums.PWCNF_REV_DISP_AUT;
          Break;
        end;

      5:
        begin
          ulStatus := PWEnums.PWCNF_REV_DISP_AUT;
          Break;
        end;

      6:
        begin
          ulStatus := PWEnums.PWCNF_REV_COMM_AUT;
          Break;
        end;

      7:
        begin
          ulStatus := PWEnums.PWCNF_REV_ABORT;
          Break;
        end;

      8:
        begin
          ulStatus := PWEnums.PWCNF_REV_OTHER_AUT;
          Break;
        end;

      9:
        begin
          ulStatus := PWEnums.PWCNF_REV_PWR_AUT;
          Break;
        end;

      10:
        begin
          ulStatus := PWEnums.PWCNF_REV_FISC_AUT;
          Break;
        end;
    else
      begin
        ShowMessage('Opção Inválida');
        Continue;
      end;

    end;

  end;

  falta := '0 - Confirmar Ultima Transação ' + chr(13) +
    '1 - Informar Dados Manualmente ';

  while (X < 5) do
  begin

    strTagNFCe := vInputBox('Escolha Opção: ', falta, '', PWEnums.WInputH,
      PWEnums.WInputV);

    if (strTagNFCe = 'CANCELA') then
    begin
      mRCancelado := 1;
      Result := 1;
      Exit;
    end
    else
    begin
      mRCancelado := 0;
    end;

    try
      iRetErro := StrToInt(strTagNFCe);
    Except
      ShowMessage('Escolha uma opção Válida');
      Continue;
    end;

    if (StrToInt(strTagNFCe) = 0) or (StrToInt(strTagNFCe) = 1) then
    begin
      Break;
    end
    else
    begin
      ShowMessage('Opção Invalida');
      Continue
    end;

  end;

  if (strTagNFCe = '1') then
  begin

    falta := '';

    strTagOP := vInputBox('Digite valor de PWINFO_REQNUM: ', falta, '',
      PWEnums.WInputH, PWEnums.WInputV);
    StrLCopy(@gstConfirmData[0].szReqNum, PChar(strTagOP),
      SizeOf(gstConfirmData[0].szReqNum)); // 11

    strTagOP := vInputBox('Digite valor de PWINFO_AUTLOCREF: ', falta, '',
      PWEnums.WInputH, PWEnums.WInputV);
    StrLCopy(@gstConfirmData[0].szLocRef, PChar(strTagOP),
      SizeOf(gstConfirmData[0].szLocRef)); // 11

    strTagOP := vInputBox('Digite valor de PWINFO_AUTEXTREF: ', falta, '',
      PWEnums.WInputH, PWEnums.WInputV);
    StrLCopy(@gstConfirmData[0].szExtRef, PChar(strTagOP),
      SizeOf(gstConfirmData[0].szExtRef)); // 50

    strTagOP := vInputBox('Digite valor de PWINFO_VIRTMERCH: ', falta, '',
      PWEnums.WInputH, PWEnums.WInputV);
    StrLCopy(@gstConfirmData[0].szVirtMerch, PChar(strTagOP),
      SizeOf(gstConfirmData[0].szVirtMerch)); // 18

    strTagOP := vInputBox('Digite valor de PWINFO_AUTHSYST: ', falta, '',
      PWEnums.WInputH, PWEnums.WInputV);
    StrLCopy(@gstConfirmData[0].szAuthSyst, PChar(strTagOP),
      SizeOf(gstConfirmData[0].szAuthSyst)); // 20

  end
  else
  begin
    // Busca Parametros para Confirmação da Transação
    // GetParamConfirma();
  end;

  // Executa Confirmação
  iRet := PW_iConfirmation(ulStatus, gstConfirmData[0].szReqNum,
    gstConfirmData[0].szLocRef, gstConfirmData[0].szExtRef,
    gstConfirmData[0].szVirtMerch, gstConfirmData[0].szAuthSyst);

  if (iRet <> PWEnums.PWRET_OK) then
  begin

    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetorno := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;

      MandaMemo(Volta);
      MandaMemo(' ');
    end;

    // verifica se foi feito instalação
    if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetorno := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;

      MandaMemo(Volta);
      MandaMemo(' ');
    end;

    ShowMessage('Outros Erros: ' + IntToStr(iRet));

    // Verificar Outros erros

    Exit;

  end;

  if (strTagNFCe = 'CANCELA') then
  begin
    mRCancelado := 1;
    Result := 1;
    Exit;
  end
  else
  begin
    mRCancelado := 0;
  end;





  // PrintResultParams();

  iRetorno := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, WretornaConf,
    SizeOf(WretornaConf));
  Volta := WretornaConf[0].pszDataxx;

  MandaMemo(Volta);
  MandaMemo(' ');

  if (iRet = PWEnums.PWRET_OK) then
  begin
    MandaMemo('CONFIRMAÇÃO OK');
    MandaMemo(' ');
  end;

end;

// =====================================================================================
{
  Funcao     :  ConfirmaTransacaoAA
  Confirmação Automatica para AutoAtendimento

  Descricao  : Esta função informa ao Pay&Go Web o status final da transação
  em curso (confirmada ou desfeita).Confirmação de transação”
}
// =====================================================================================*/
function TPGWLib.ConfirmaTrasacaoAA: Integer;
var
  ulStatus: Integer; //
  WretornaConf: PSZ_GetData;
begin

  ulStatus := PWEnums.PWCNF_CNF_AUTO;

  // Executa Confirmação
  iRet := PW_iConfirmation(ulStatus, gstConfirmData[0].szReqNum,
    gstConfirmData[0].szLocRef, gstConfirmData[0].szExtRef,
    gstConfirmData[0].szVirtMerch, gstConfirmData[0].szAuthSyst);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    MandaMemo('Erro ao Confirmar Transação !!');
    MandaMemo(' ');
  end
  else
  begin
    MandaMemo('CONFIRMAÇÃO OK');
    MandaMemo(' ');
  end;

  // PrintResultParams();

end;

function TPGWLib.Count: Integer;
begin

end;

constructor TPGWLib.Create;
begin

  inherited Create;
  PWEnums := TCEnums.Create;

end;

destructor TPGWLib.Destroy;
begin
  inherited;
end;

// =====================================================================================
{
  Funcao     :  AddMandatoryParams

  Descricao  :  Esta função adiciona os parâmetros obrigatórios de toda mensagem para o
  Pay&Go Web.
}
// =====================================================================================*/
procedure AddMandatoryParams;
begin

  PW_iAddParam(PWEnums.PWINFO_AUTDEV, PWEnums.PGWEBLIBTEST_AUTDEV);
  PW_iAddParam(PWEnums.PWINFO_AUTVER, PWEnums.PGWEBLIBTEST_VERSION);
  PW_iAddParam(PWEnums.PWINFO_AUTNAME, PWEnums.PGWEBLIBTEST_AUTNAME);
  PW_iAddParam(PWEnums.PWINFO_AUTCAP, PWEnums.PGWEBLIBTEST_AUTCAP);
  PW_iAddParam(PWEnums.PWINFO_AUTHTECHUSER, PWEnums.PGWEBLIBTEST_AUTHTECHUSER);

end;

// =====================================================================================*\
{
  function  :  Init

  Descricao  :  Captura os dados necesários e executa PW_iInit.

  Sugestão de Pasta C:\PAYGO (Deve ser Criada)
  "." Gera as Pastas de Dados e Log no Raiz da Aplicação.

}
// =====================================================================================*/
function TPGWLib.Init(caminho: string): Integer;
var
  strTagNFCe: string;
  Volta: String;
  iRet: Integer;
  iparam: Int16;
  iretornar: Integer;
begin

  strTagNFCe := caminho;

  iretornar := PW_iInit(strTagNFCe);

  MandaMemo(' ');
  PrintReturnDescription(iretornar, '');

  if (iretornar = PWEnums.PWRET_WRITERR) then
  begin
    iRet := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
      SizeOf(vGetpszData));
    Volta := vGetpszData[0].pszDataxx;
    frmFechavenda.pnTEF.Caption := Volta;
    // ssageBox(PChar(Volta),'Erro',mb_OK+mb_IconInformation);
    // MandaMemo(Volta);

  end;

  PrintResultParams();

end;

// =====================================================================================*\
{
  function  :  Instalacao

  Descricao  :  Instalação de um Ponto de Captura.

}
// =====================================================================================*/
function TPGWLib.Instalacao: Integer;
var
  szAux: char;
  strTagNFCe: string;
  StrValorTagNFCe: AnsiString;
  msg: AnsiString;
  pszData: char;
  iparam: Int16;
  Volta: String;
  xxxparam: SmallInt;
  I: Integer;
  comando: array [0 .. 39] of char;
  winfo: Integer;
  falta: string;
  iRet: Integer;
  iRetErro: Integer;
begin

  // ===============================================
  // Nova Transação - Instalação
  // ===============================================
  iRet := PW_iNewTransac(PWEnums.PWOPER_INSTALL);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);

    MandaMemo(' ');
    PrintReturnDescription(iRet, '');

    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      MandaMemo('Numero de Parametros Ausentes: ' + IntToStr(xNumParam));

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> 0) then
      begin
        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
        // ShowMessage('Parametros Atuais');
      end;

      iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      if (Volta = '1') then
      begin
        MandaMemo(' PWINFO_CNFREQ = 1');
        MandaMemo(' ');
        MandaMemo('É Necessário Confirmar esta Transação !');
        MandaMemo(' ');
      end;

      Break;

    end;

  end;

  PrintResultParams();

end;

function TPGWLib.MandaMemo(Descr: string): Integer;
begin

  // TPrincipal.Memo1.Font.Size := 10;
  // TPrincipal.Memo1.Font.Name := 'Default';

   if (frmTEF_Adm.Memo1.Visible = False) then
    begin
    frmTEF_Adm.Memo1.Visible := True;
    end;
    frmTEF_Adm.Memo1.Lines.Add(Descr);

    Result := 0;

end;

// =====================================================================================
{
  Reimpressão
}
// ======================================================================================
function TPGWLib.Reimpressao: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;
begin

  I := 0;

  iRet := PW_iNewTransac(PWEnums.PWOPER_REPRINT);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);

    MandaMemo(' ');
    PrintReturnDescription(iRet, '');

    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      MandaMemo('Numero de Parametros Ausentes: ' + IntToStr(xNumParam));

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> 0) then
      begin
        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
      end;

      // Busca Todos os codigos e seus conteudos
      PrintResultParams();


      // Retorna o recibo Via do Estabelecimento
      // iRet := PW_iGetResult(PWEnums.PWINFO_RCPTMERCH , vGetpszErro, SizeOf(vGetpszData));
      // Volta := vGetpszErro[0].pszDataxx;

      // Retorna o recibo Via do Cliente
      // iRet := PW_iGetResult(PWEnums.PWINFO_RCPTCHOLDER , vGetpszErro, SizeOf(vGetpszData));
      // Volta := vGetpszErro[0].pszDataxx;

      Break;

    end;

  end;

end;

// =====================================================================================
{
  Relatórios
}
// ======================================================================================
function TPGWLib.Relatorios: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;
begin

  I := 0;

  iRet := PW_iNewTransac(PWEnums.PWOPER_RPTDETAIL);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);
    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> 0) then
      begin
        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      // Esta Opção Não precisa de Confirmação, mas caso exista uma transação pendente
      // vai armazenar informações para executar uma confirmação no Menu.
      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end;

      Break;

    end;

  end;

  // Busca Todos os codigos e seus conteudos
  PrintResultParams();

end;

// =====================================================================================
{
  Função Auxiliar. "não esta sendo usada no momento"
}
// ======================================================================================
function tbKeyIsDown(const Key: Integer): Boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

// =====================================================================================*\
{
  function  :  TestaInit

  Descricao  :  Verifica se PW_iInit já foi executado.

  Entradas   :  Resultado da Operação

  Saidas     :  nao ha.

  Retorno    :  Código de resultado da operação.

}
// =====================================================================================*/
function TPGWLib.TestaInit(iparam: Integer): Integer;
var
  Volta: String;
  iRet: Integer;
begin

  if (iparam = PWEnums.PWRET_DLLNOTINIT) then
  begin
    iRet := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
      SizeOf(vGetpszData));
    Volta := vGetpszData[0].pszDataxx;

    MandaMemo(Volta);
    MandaMemo(' ');

    Result := iparam;
  end
  else
  begin
    Result := PWEnums.PWRET_OK;
  end;

end;


// ==========================================================
// Função apenas para teste
// ==========================================================

function TPGWLib.TestaLoop: Integer;
var
  I: Integer;
  wtecla: Integer;
  Key: Integer;
begin

  while I < 1000 do
  begin
    if GetAsyncKeyState(VK_SPACE) <> 0 then
    begin
      ShowMessage('A Tecla ESPAÇO foi pressionada.');
    end
    else if GetAsyncKeyState(VK_ESCAPE) <> 0 then
    begin
      ShowMessage('Tecla ESC foi pressionada.');
    end
    else if GetAsyncKeyState(VK_RBUTTON) <> 0 then
    begin
      ShowMessage('O Botão DIREITO do mouse foi pressionado.');
    end
    else if GetAsyncKeyState(Ord('A')) <> 0 then
    begin
      ShowMessage('A tecla "A" pressionada.');
    end;

    I := I + 1;
    sleep(500);

  end;

end;

// ========================================================
{
  Função que Executa Operação  de
  Auto Atendimento
}
// ========================================================
function TPGWLib.TesteAA: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;
  ulEvent: UInt32;
  szDspMsg: PSZ_GetData;
begin

  gfAutoAtendimento := True;

  ulEvent := 0;

  I := 0;

  while I < 10 do
  begin

    MandaMemo('AGUARDANDO CARTAO PARA INICIAR OPERACAO!!!');
    MandaMemo(' ');

    // iRet := PW_iPPDisplay('Valor da Mercadoria = R$ 1,00');
    iRet := PW_iPPDisplay('INSIRA OU PASSE    O CARTAO');
    if (iRet <> PWEnums.PWRET_OK) then
    begin
      MandaMemo('Erro em PW_iPPDisplay =  ' + IntToStr(iRet));
      MandaMemo(' ');
      Exit;
    end;

    while I < 10 do
    begin
      iRet := PW_iPPEventLoop(szDspMsg, SizeOf(szDspMsg));
      if (iRet = PWEnums.PWRET_DISPLAY) then
      begin
        MandaMemo(szDspMsg[0].pszDataxx);
        MandaMemo(' ');
      end;

      if (iRet = PWEnums.PWRET_TIMEOUT) then
      begin
        Result := iRet;
        Exit;
      end;

      if (iRet = PWEnums.PWRET_OK) then
      begin
        Break;
      end;

      sleep(1000);

      Aguardando();

    end;

    // Aguarda o cartão do cliente
    iRet := PW_iPPWaitEvent(ulEvent);
    if (iRet <> PWEnums.PWRET_OK) then
    begin
      MandaMemo('Erro em PPWaitEvent = ' + IntToStr(iRet));
      MandaMemo(' ');
      Exit;
    end;

    while I < 10 do
    begin
      iRet := PW_iPPEventLoop(szDspMsg, SizeOf(szDspMsg));
      if (iRet = PWEnums.PWRET_DISPLAY) then
      begin
        MandaMemo(szDspMsg[0].pszDataxx);
        MandaMemo(' ');
      end;

      if (iRet = PWEnums.PWRET_TIMEOUT) then
      begin
        Result := iRet;
        Exit;
      end;

      if (iRet = PWEnums.PWRET_OK) then
      begin
        Break;
      end;

      sleep(500);

      Aguardando();

      // Verifica se Teclou <ESC>
      if GetAsyncKeyState(VK_ESCAPE) <> 0 then
      begin
        iRetErro := PW_iPPAbort();
        MandaMemo(' ');
        MandaMemo('TRANSAÇÃO ABORTADA PELA APLICAÇÃO');
        mRCancelado := 1;
        Result := 1;
        Exit;
        Break;
      end
      else
      begin
        mRCancelado := 0;
      end;

    end;

    // PWPPEVT_ICC        - Foi detectada a presença de um cartão com chip
    // PWPPEVT_MAGSTRIPE  - Foi passado um cartão magnético
    // PWPPEVT_CTLS       - Foi detectada a presença de um cartão sem contato
    if ((ulEvent = PWEnums.PWPPEVT_ICC) or (ulEvent = PWEnums.PWPPEVT_MAGSTRIPE)
      or (ulEvent = PWEnums.PWPPEVT_CTLS)) then
    begin
      Break;
    end;

  end;

  // Exibe mensagem processando no PIN-pad
  iRet := PW_iPPDisplay('PROCESSANDO...');
  if (iRet <> PWEnums.PWRET_OK) then
  begin
    MandaMemo('Erro em PW_iPPDisplay =  ' + IntToStr(iRet));
    MandaMemo(' ');
    Exit;
  end;

  while I < 10 do
  begin
    iRet := PW_iPPEventLoop(szDspMsg, SizeOf(szDspMsg));
    if (iRet = PWEnums.PWRET_DISPLAY) then
    begin
      MandaMemo(szDspMsg[0].pszDataxx);
      MandaMemo(' ');
    end;

    if (iRet = PWEnums.PWRET_TIMEOUT) then
    begin
      Result := iRet;
      Exit;
    end;

    if (iRet = PWEnums.PWRET_OK) then
    begin
      Break;
    end;

    sleep(1000);

    Aguardando();

  end;


  // Inicializa a transação de venda

  iRet := PW_iNewTransac(PWEnums.PWOPER_SALE);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    MandaMemo('Erro PW_iNewTransac: ' + IntToStr(iRet));
    MandaMemo(' ');
  end;

  // Parametros obrigatórios
  AddMandatoryParams;

  // Adiciona Valor Para Testar Operação;
  PW_iAddParam(PWEnums.PWINFO_TOTAMNT, '100');
  PW_iAddParam(PWEnums.PWINFO_CARDTYPE, '1');
  PW_iAddParam(PWEnums.PWINFO_CARDTYPE, '1');

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin

    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      MandaMemo('Processando...');
      MandaMemo('');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);

    MandaMemo(' ');
    PrintReturnDescription(iRet, '');

    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      MandaMemo('Numero de Parametros Ausentes: ' + IntToStr(xNumParam));

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna
      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> PWEnums.PWRET_OK) then
      begin
        iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
          SizeOf(vGetpszData));
        Volta := vGetpszData[0].pszDataxx;
        if (Volta = '1') then
        begin
          MandaMemo(' PWINFO_CNFREQ = 1');
          MandaMemo(' ');
          MandaMemo('Erro: ' + IntToStr(iRetErro) +
            ' , É Necessário Confirmar esta Transação !');
          MandaMemo(' ');

          // Metodo confirma a transação
          ConfirmaTrasacao();
        end;

        Exit;
      end
      else
      begin
        // I := I+1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        // I := I+1;
        Continue;
      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
      end;

      iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      if (Volta = '1') then
      begin
        MandaMemo(' PWINFO_CNFREQ = 1');
        MandaMemo(' ');
        MandaMemo('Confirmando Transação ...');
        MandaMemo(' ');

        // Metodo confirma a transação Automaticamente
        ConfirmaTrasacaoAA();

      end;

      Break;

    end;

  end;

  PrintResultParams();

  gfAutoAtendimento := False;

end;

// ========================================================
{

  Executa Nova Transaçao de Venda  PWEnums.PWOPER_SALE

}
// ========================================================
function TPGWLib.venda: Integer;
var
  iparam: Integer;
  Volta: String;
  iRet: Integer;
  iRetI: Integer;
  iRetErro: Integer;
  strNome: String;
  I: Integer;
  xloop: Integer;
  voltaA: AnsiChar;

begin

  // Verifica se não esta Marcado para Auto Atendimento
  if (gfAutoAtendimento = True) then
  begin
    gfAutoAtendimento := False;
  end;

  I := 0;

  iRet := PW_iNewTransac(PWEnums.PWOPER_SALE);

  if (iRet <> PWEnums.PWRET_OK) then
  begin
    // Verifica se Foi inicializada a biblioteca
    if (iRet = PWEnums.PWRET_DLLNOTINIT) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      frmFechavenda.pnTEF.Caption := Volta;
    end
    // verifica se foi feito instalação
    else if (iRet = PWEnums.PWRET_NOTINST) then
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end
    // Outro Erro
    else
    begin
      iRetErro := PW_iGetResult(PWEnums.PWINFO_RESULTMSG, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      MandaMemo(Volta);
    end;

    Exit;

  end;

  AddMandatoryParams; // Parametros obrigatórios

  // =====================================================
  // Loop Para Capturar Dados e executar Transação
  // =====================================================
  while I < 100 do
  begin


    // Coloca o valor 10 (tamanho da estrutura de entrada) no parâmetro iNumParam
    xNumParam := 10;

    // Tenta executar a transação
    if (iRet <> PWEnums.PWRET_NOTHING) then
    begin
      // ShowMessage('Processando...');
    end;

    iRet := PW_iExecTransac(vGetdataArray, @xNumParam);

    frmFechavenda.pnTEF.Caption := ' ';
    PrintReturnDescription(iRet, '');

    if (iRet = PWEnums.PWRET_MOREDATA) then
    begin

      frmFechavenda.pnTEF.Caption := 'Numero de Parametros Ausentes: ' +
        IntToStr(xNumParam);

      // Tenta capturar os dados faltantes, caso ocorra algum erro retorna

      iRetErro := iExecGetData(vGetdataArray, xNumParam);
      if (iRetErro <> PWEnums.PWRET_OK) then
      begin
        if (mRCancelado = 1) then
        begin
          frmFechavenda.pnTEF.Caption := ' ';;
          frmFechavenda.pnTEF.Caption := 'CANCELADO PELA APLICAÇÃO !!';
        end;

        iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
          SizeOf(vGetpszData));
        Volta := vGetpszData[0].pszDataxx;
        if (Volta = '1') then
        begin
//     MandaMemo(' PWINFO_CNFREQ = 1');
//          MandaMemo(' ');
          MandaMemo('É Necessário Confirmar esta Transação !');
//          MandaMemo(' ');

          // Metodo confirma a transação
          ConfirmaTrasacao();

        end;

        // Busca Todos os codigos e seus conteudos
        PrintResultParams();

        Exit;
      end
      else
      begin
        I := I + 1;
        Continue;
      end;

    end
    else
    begin

      if (iRet = PWEnums.PWRET_NOTHING) then
      begin
        I := I + 1;
        Continue;
      end;

      if (iRet = PWEnums.PWRET_FROMHOSTPENDTRN) then
      begin
        // Busca Parametros da Transação Pendente
        GetParamPendenteConfirma();
      end
      else
      begin
        // Busca Parametros da Transação Atual
        GetParamConfirma();
      end;

      iRet := PW_iGetResult(PWEnums.PWINFO_CNFREQ, vGetpszData,
        SizeOf(vGetpszData));
      Volta := vGetpszData[0].pszDataxx;
      if (Volta = '1') then
      begin
        MandaMemo(' PWINFO_CNFREQ = 1');
        MandaMemo(' ');
        MandaMemo('É Necessário Confirmar esta Transação !');
        MandaMemo(' ');

        // Metodo confirma a transação
        ConfirmaTrasacao();

      end;

      // Busca Todos os codigos e seus conteudos
      PrintResultParams();

      Break;

    end;

  end;

end;

// =====================================================================================*\
{ Funcao     :  iExecGetData

  Descricao  :  Esta função obtém dos usuários os dados requisitado pelo Pay&Go Web.

  Entradas   :  vstGetData  :  Vetor com as informações dos dados a serem obtidos.
  iNumParam   :  Número de dados a serem obtidos.

  Saidas     :  nao ha.

  Retorno    :  Código de resultado da operação.
}
// =====================================================================================*/
function TPGWLib.iExecGetData(vstGetData: PW_GetData;
  iNumParam: Integer): Integer;
var
  I: Integer;
  strTagNFCe: string;
  falta: string;
  iRet: Integer;
  iRetByte: Byte;
  iRetErro: Integer;
  Volta: String;
  strNome: string;
  xloop: Integer;
  ulEvent: UInt32;
  X: Integer;
  iRetStr: string;
  wTipoDado: Integer;
  iKey: Int16;
begin

  strNome := '';
  strTagNFCe := '';

  ulEvent := 0;
  I := 0;

  // ==========================================================
  // Loop Para Capturar e Adicionar dados solicitados pela DLL.
  // Enquanto houverem dados para capturar
  // ==========================================================
  while I < iNumParam do

  begin

    // Imprime na tela qual informação está sendo capturada
    iRetStr := pszGetInfoDescription(vstGetData[I].wIdentificador);
    MandaMemo('dado a Capturar: ' + iRetStr + ' ' +
      IntToStr(vstGetData[I].wIdentificador));

    case (vstGetData[I].bTipoDeDado) of


      // Dados de Menu

      PWEnums.PWDAT_MENU:

        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: MENU - ' + IntToStr(iRetByte));
          MandaMemo(vstGetData[I].szPrompt);

          // Caso o modo autoatendimento esteja ativado, faz o menu no PIN-pad
          if (gfAutoAtendimento = True) then
          begin
            if (vstGetData[I].bNumOpcoesMenu > 2) then
            begin
              MandaMemo('MUITAS OPÇÕES! MENU NAO PODE SER FEITO NO PINPAD!!!');
              // Result := 999;
              // Exit;
            end
            else
            begin
              MandaMemo('EXECUTANDO MENU NO PINPAD');
            end;

            // falta := '<F1> - ' + vstGetData[I].vszTextoMenu[0] + chr(13) + '<F2> - ' + vstGetData[I].vszTextoMenu[1] + chr(13) + '<F3> - ' + vstGetData[I].vszTextoMenu[2];
            falta := '<F1> - ' + vstGetData[I].vszTextoMenu[0] + chr(13) +
              '<F2> - ' + vstGetData[I].vszTextoMenu[1];

            while I < 10 do
            begin

              // Exibe a mensagem no PIN-pad
              iRet := PW_iPPDisplay(falta);
              if (iRet <> PWEnums.PWRET_OK) then
              begin
                MandaMemo('Erro em PW_iPPDisplay =  ' + IntToStr(iRet));
                MandaMemo(' ');
                Result := iRet;
                Exit;
              end;

              while I < 10 do
              begin
                iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
                if (iRet = PWEnums.PWRET_DISPLAY) then
                begin
                  MandaMemo(vGetpszDisplay[0].szDspMsg);
                  MandaMemo(' ');
                end;

                if (iRet = PWEnums.PWRET_TIMEOUT) then
                begin
                  Result := iRet;
                  Exit;
                end;

                if (iRet = PWEnums.PWRET_OK) then
                begin
                  Break;
                end;

                sleep(1000);

                Aguardando();

              end;

              // Aguarda a seleção da opção pelo cliente
              ulEvent := PWEnums.PWPPEVTIN_KEYS;
              iRet := PW_iPPWaitEvent(ulEvent);
              if (iRet <> PWEnums.PWRET_OK) then
              begin
                MandaMemo('Erro em PPWaitEvent ' + IntToStr(iRet));
                Result := iRet;
                Exit;
              end;

              while I < 10 do
              begin

                iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
                if (iRet = PWEnums.PWRET_DISPLAY) then
                begin
                  MandaMemo(vGetpszDisplay[0].szDspMsg);
                  MandaMemo(' ');
                end;

                if (iRet = PWEnums.PWRET_TIMEOUT) then
                begin
                  Result := iRet;
                  Exit;
                end;

                if (iRet = PWEnums.PWRET_OK) then
                begin
                  Break;
                end;

                sleep(1000);

                Aguardando();

              end;

              if (ulEvent = PWEnums.PWPPEVT_KEYF1) then
              begin
                iKey := 48;
                Break;
              end
              else if (ulEvent = PWEnums.PWPPEVT_KEYF2) then
              begin
                iKey := 49;
                Break;
              end
              else if (ulEvent = PWEnums.PWPPEVT_KEYCANC) then
              begin
                iRet := PW_iPPDisplay('    OPERACAO        CANCELADA   ');
                if (iRet <> PWEnums.PWRET_OK) then
                begin
                  MandaMemo('Erro em PW_iPPDisplay =  ' + IntToStr(iRet));
                  MandaMemo(' ');
                  Result := iRet;
                  Exit;
                end;

                while I < 10 do
                begin

                  iRet := PW_iPPEventLoop(vGetpszDisplay,
                    SizeOf(vGetpszDisplay));
                  if (iRet = PWEnums.PWRET_DISPLAY) then
                  begin
                    MandaMemo(vGetpszDisplay[0].szDspMsg);
                    MandaMemo(' ');
                  end;

                  if (iRet = PWEnums.PWRET_TIMEOUT) then
                  begin
                    Result := iRet;
                    Exit;
                  end;

                  if (iRet = PWEnums.PWRET_OK) then
                  begin
                    Result := PWEnums.PWRET_CANCEL;
                    Exit;
                  end;

                  sleep(1000);

                  Aguardando();

                end;

              end

              else

              begin

                iRet := PW_iPPDisplay('   UTILIZE AS   TECLAS F1 OU F2');
                if (iRet <> PWEnums.PWRET_OK) then
                begin
                  MandaMemo('Erro em PW_iPPDisplay =  ' + IntToStr(iRet));
                  MandaMemo(' ');
                  Result := iRet;
                  Exit;
                end;

                while I < 10 do
                begin

                  iRet := PW_iPPEventLoop(vGetpszDisplay,
                    SizeOf(vGetpszDisplay));
                  if (iRet = PWEnums.PWRET_DISPLAY) then
                  begin
                    MandaMemo(vGetpszDisplay[0].szDspMsg);
                    MandaMemo(' ');
                  end;

                  if (iRet = PWEnums.PWRET_TIMEOUT) then
                  begin
                    Result := iRet;
                    Exit;
                  end;

                  if (iRet = PWEnums.PWRET_OK) then
                  begin
                    Result := iRet;
                    Exit;
                  end;

                  sleep(100);

                  Aguardando();

                end;

              end;

            end;

          end

          else

          begin

            falta := vstGetData[I].szPrompt + chr(13);
            falta := falta + ' ' + chr(13);

            X := 0;

            while (X < vstGetData[I].bNumOpcoesMenu) do
            begin

              falta := falta + IntToStr(X) + ' - ' + vstGetData[I].vszTextoMenu
                [X] + chr(13);

              X := X + 1;
            end;

            X := 0;

            strNome := '';

            while (X < 5) do
            begin
              strNome := vInputBox('Selecione Opção', falta, '',
                PWEnums.WInputH, PWEnums.WInputV);

              try
                if (strNome = 'CANCELA') then
                begin
                  Break;
                end;

                iRetErro := StrToInt(strNome);
              Except
                ShowMessage('Escolha uma opção Válida');
                Continue;
              end;

              if (StrToInt(strNome) > (vstGetData[I].bNumOpcoesMenu - 1)) then
              begin
                ShowMessage('Opção Inexistente');
                Continue;
              end;

              // Busca Código Referente em vszValorMenu
              strNome := vstGetData[I].vszValorMenu[StrToInt(strNome)];

              Break;

            end;

          end;

          if (strNome = 'CANCELA') then
          begin
            Break;
          end
          else
          begin
            // Caso seja Auto Atendimento pega pela tecla escolhida
            if (gfAutoAtendimento = True) then
            begin
              strNome := vstGetData[I].vszValorMenu[iKey - 48];
            end;

            // Busca Identificador do Menu Escolhido
            iRet := PW_iAddParam(vstGetData[I].wIdentificador, strNome);
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := PWEnums.PWRET_OK;
            end
            else
            begin
              Result := iRet;
            end;

            Break;

          end;

        end;



      // Entrada Digitada

      PWEnums.PWDAT_TYPED:
        begin
          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: DIGITADO - ' + IntToStr(iRetByte));
          MandaMemo(vstGetData[I].szPrompt);
          MandaMemo('Tamanho Minimo: ' +
            IntToStr(vstGetData[I].bTamanhoMinimo));
          MandaMemo('Tamanho Maximo: ' +
            IntToStr(vstGetData[I].bTamanhoMaximo));
          iRetStr := vstGetData[I].szValorInicial;
          MandaMemo('Valor Atual: ' + iRetStr);
          MandaMemo('Mascara: ' + vstGetData[I].szMascaraDeCaptura);
          iRetByte := vstGetData[I].bValidacaoDado;
          MandaMemo('Validação de Dado: ' + IntToStr(iRetByte));
          MandaMemo(' ');

          falta := vstGetData[I].szPrompt;

          X := 0;

          while (X < 5) do
          begin

            wTipoDado := 0;

            // Data
            if (vstGetData[I].wIdentificador = PWEnums.PWINFO_TRNORIGDATE) then
            begin
              if (vstGetData[I].szMascaraDeCaptura = '@@/@@/@@@@') then
              begin
                wTipoDado := 1;
              end
              else
              begin
                wTipoDado := 4;
              end;
            end;
            // Valor
            if (vstGetData[I].wIdentificador = PWEnums.PWINFO_TOTAMNT) then
            begin
              wTipoDado := 2;
            end;
            // Horario
            if ((vstGetData[I].wIdentificador = 123) or
              (vstGetData[I].wIdentificador = 124)) then
            begin
              wTipoDado := 3;
            end;

            if (wTipoDado = 2) then
            begin
              falta := falta + '  ' + vstGetData[I].szMascaraDeCaptura;
              // ImputBox Especifico Para Valores Monetarios
              strTagNFCe := TCustomInputBox.InputBox('Informar: ', falta, '',
                PWEnums.WInputH, PWEnums.WInputV);
              // Retira Ponto e virgula da String
              strTagNFCe := tirapontos(strTagNFCe);
              if (strTagNFCe = '000') then
                strTagNFCe := '';
            end
            else if (wTipoDado = 0) then
            begin
              strTagNFCe := vInputBox('Informar: ', falta, '', PWEnums.WInputH,
                PWEnums.WInputV);
            end
            else
            begin
              strTagNFCe := vMInputBox('Informar: ', falta, '', PWEnums.WInputH,
                PWEnums.WInputV, wTipoDado);
            end;

            if (strTagNFCe = 'CANCELA') then
            begin
              mRCancelado := 1;
              Break;
            end
            else
            begin
              mRCancelado := 0;
            end;

            if (Length(strTagNFCe) > vstGetData[I].bTamanhoMaximo) then
            begin
              ShowMessage('Valor Maior que Tamanho Maximo');
              Continue;
            end;

            if (Length(strTagNFCe) < vstGetData[I].bTamanhoMinimo) then
            begin
              ShowMessage('Valor Menor que Tamanho Minimo');
              Continue;
            end;

            iRet := PW_iAddParam(vstGetData[I].wIdentificador, strTagNFCe);
            if (iRet <> 0) then
            begin
              ShowMessage('Erro ao Adicionar Parametros');
              Result := iRet;
              Exit;
            end
            else
            begin
              Result := PWEnums.PWRET_OK;
              Break;
            end;

          end;

          if (strTagNFCe = 'CANCELA') then
          begin
            Result := 1;
            Break;
          end
          else
          begin
            I := I + 1;

            Continue;
          end;

        end;


      // Dados do Cartão

      PWEnums.PWDAT_CARDINF:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: DADOS DO CARTAO - ' + IntToStr(iRetByte));

          if (vstGetData[I].ulTipoEntradaCartao = 1) then
          begin
            // ShowMessage('ulTipoEntrada = 1');
          end;

          iRet := PW_iPPGetCard(I);

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            // if((iRet <> PWEnums.PWRET_OK) And (iRet <> PWEnums.PWRET_DISPLAY) And (iRet <> PWEnums.PWRET_NOTHING)) then
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            // Verifica se Teclou <ESC>
            if GetAsyncKeyState(VK_ESCAPE) <> 0 then
            begin
              iRetErro := PW_iPPAbort();
              MandaMemo(' ');
              MandaMemo('TRANSAÇÃO ABORTADA PELA APLICAÇÃO');
              mRCancelado := 1;
              Result := 1;
              Exit;
              Break;
            end
            else
            begin
              mRCancelado := 0;
            end;

          end;

        end;



      // Remoção do cartão do PIN-pad.

      PWEnums.PWDAT_PPREMCRD:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: PWDAT_PPREMCRD - ' + IntToStr(iRetByte));

          iRet := PW_iPPRemoveCard();

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            // if((iRet <> PWEnums.PWRET_OK) And (iRet <> PWEnums.PWRET_DISPLAY) And (iRet <> PWEnums.PWRET_NOTHING)) then
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

          end;

        end;




      // Captura da senha criptografada

      PWEnums.PWDAT_PPENCPIN:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: SENHA - ' + IntToStr(iRetByte));

          iRet := PW_iPPGetPIN(I);
          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          while xloop < 1000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            // if((iRet <> PWEnums.PWRET_OK) And (iRet <> PWEnums.PWRET_DISPLAY) And (iRet <> PWEnums.PWRET_NOTHING)) then
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            if (iRet = PWEnums.PWRET_TIMEOUT) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            // Verifica se Teclou <ESC>
            if GetAsyncKeyState(VK_ESCAPE) <> 0 then
            begin
              iRetErro := PW_iPPAbort();
              MandaMemo(' ');
              MandaMemo('TRANSAÇÃO ABORTADA PELA APLICAÇÃO');
              mRCancelado := 1;
              Exit;
              Break;
            end
            else
            begin
              mRCancelado := 0;
            end;

          end;

        end;



      // processamento off-line de cartão com chip

      PWEnums.pWDAT_CARDOFF:

        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: CHIP OFFLINE - ' + IntToStr(iRetByte));

          iRet := PW_iPPGoOnChip(I);

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            if (iRet = PWEnums.PWRET_TIMEOUT) then
            begin
              Result := iRet;
              Exit;
            end;

            // if((iRet <> PWEnums.PWRET_OK) And (iRet <> PWEnums.PWRET_DISPLAY) And (iRet <> PWEnums.PWRET_NOTHING)) then
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            // Verifica se Teclou <ESC>
            if GetAsyncKeyState(VK_ESCAPE) <> 0 then
            begin
              iRetErro := PW_iPPAbort();
              MandaMemo(' ');
              MandaMemo('TRANSAÇÃO ABORTADA PELA APLICAÇÃO');
              mRCancelado := 1;
              Result := 1;
              Exit;
            end
            else
            begin
              mRCancelado := 0;
            end;

          end;

        end;



      // Captura de dado digitado no PIN-pad

      PWEnums.PWDAT_PPENTRY:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: DADO DIGITADO NO PINPAD - ' +
            IntToStr(iRetByte));

          iRet := PW_iPPGetData(I);

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            if (iRet = PWEnums.PWRET_TIMEOUT) then
            begin
              Result := iRet;
              Exit;
            end;

            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            Aguardando();

          end;

        end;


      // Processamento online do cartão com chip

      PWEnums.PWDAT_CARDONL:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: CHIP ONLINE - ' + IntToStr(iRetByte));

          iRet := PW_iPPFinishChip(I);

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            if (iRet = PWEnums.PWRET_TIMEOUT) then
            begin
              Result := iRet;
              Exit;
            end;

            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            // Verifica se Teclou <ESC>
            if GetAsyncKeyState(VK_ESCAPE) <> 0 then
            begin
              iRetErro := PW_iPPAbort();
              MandaMemo(' ');
              MandaMemo('TRANSAÇÃO ABORTADA PELA APLICAÇÃO');
              mRCancelado := 1;
              Result := 1;
              Exit;
              Break;
            end
            else
            begin
              mRCancelado := 0;
            end;

            // Aguardando();

          end;

        end;



      // Confirmação de dado no PIN-pad

      PWEnums.PWDAT_PPCONF:
        begin

          iRetByte := vstGetData[I].bTipoDeDado;
          MandaMemo('Tipo de Dado: CONFIRMA DADO - ' + IntToStr(iRetByte));

          iRet := PW_iPPConfirmData(I);

          if (iRet <> PWEnums.PWRET_OK) then
          begin
            Result := iRet;
            Exit;
          end;

          xloop := 0;

          while xloop < 10000 do
          begin

            iRet := PW_iPPEventLoop(vGetpszDisplay, SizeOf(vGetpszDisplay));
            if (iRet = PWEnums.PWRET_DISPLAY) then
            begin
              MandaMemo(vGetpszDisplay[0].szDspMsg);
              MandaMemo(' ');
            end;

            if (iRet = PWEnums.PWRET_TIMEOUT) then
            begin
              Result := iRet;
              Exit;
            end;

            // if((iRet <> PWEnums.PWRET_OK) And (iRet <> PWEnums.PWRET_DISPLAY) And (iRet <> PWEnums.PWRET_NOTHING)) then
            if (iRet = PWEnums.PWRET_OK) then
            begin
              Result := iRet;
              Exit;
            end;

            xloop := xloop + 1;

            sleep(1000);

            Aguardando();

          end;

        end;

    else

      begin

        ShowMessage('TIPO DE DADOS DESCONHECIDO : ' +
          IntToStr(vstGetData[I].bTipoDeDado));

      end;

    end;

    I := I + 1;

    Continue;

  end;

  if ((strNome = 'CANCELA') or (strTagNFCe = 'CANCELA')) then
  begin
    iRetErro := PW_iPPAbort();
    Result := 1;
    mRCancelado := 1;
  end
  else
  begin
    mRCancelado := 0;
    Result := PWEnums.PWRET_OK;
  end;

end;

// =====================================================================================*\
{
  Funcao     :  PrintResultParams

  Descricao  :  Esta função exibe na tela todas as informações de resultado disponíveis
  no momento em que foi chamada.

  Entradas   :  nao ha.

  Saidas     :  nao ha.

  Retorno    :  nao ha.
}
// =====================================================================================*/
function TPGWLib.PrintResultParams: Integer;
var
  I: Integer;
  Ir: Integer;
  iRet: Integer;
  szAux: PSZ_GetData;
  Volta: AnsiString;

begin

  I := 0;

  while I < 32524 do // 2200 MAXINT16 32767
  begin

    iRet := PW_iGetResult(I, szAux, SizeOf(szAux));
    if (iRet = PWEnums.PWRET_OK) then
    begin
      MandaMemo(pszGetInfoDescription(I) + '<0x' + IntToHex(I, 2) + '> = ');
      Volta := szAux[0].pszDataxx;
      MandaMemo(Volta);
      MandaMemo('');
    end;

    I := I + 1;

  end;

end;

// =====================================================================================*\
{
  Funcao     :  PrintReturnDescription

  Descricao  :  Esta função recebe um código PWRET_XXX e imprime na tela a sua descrição.

  Entradas   :  iResult :   Código de resultado da transação (PWRET_XXX).

  Saidas     :  nao ha.

  Retorno    :  nao ha.
}
// =====================================================================================*/
function TPGWLib.PrintReturnDescription(iReturnCode: Integer;
  pszDspMsg: string): Integer;
var
  I: Integer;
begin

  case iReturnCode of

    PWEnums.PWRET_OK:
      begin
        MandaMemo('PWRET_OK');
      end;

    PWEnums.PWRET_INVCALL:
      begin
        MandaMemo('PWRET_INVCALL');
      end;

    PWEnums.PWRET_INVPARAM:
      begin
        MandaMemo('PWRET_INVPARAM');
      end;

    PWEnums.PWRET_NODATA:
      begin
        MandaMemo('PWRET_NODATA');
      end;

    PWEnums.PWRET_BUFOVFLW:
      begin
        MandaMemo('PWRET_BUFOVFLW');
      end;

    PWEnums.PWRET_MOREDATA:
      begin
        MandaMemo('PWRET_MOREDATA');
      end;

    PWEnums.PWRET_DLLNOTINIT:
      begin
        MandaMemo('PWRET_DLLNOTINIT');
      end;

    PWEnums.PWRET_NOTINST:
      begin
        MandaMemo('PWRET_NOTINST');
      end;

    PWEnums.PWRET_TRNNOTINIT:
      begin
        MandaMemo('PWRET_TRNNOTINIT');
      end;

    PWEnums.PWRET_NOMANDATORY:
      begin
        MandaMemo('PWRET_NOMANDATORY');
      end;

    PWEnums.PWRET_TIMEOUT:
      begin
        MandaMemo('PWRET_TIMEOUT');
      end;

    PWEnums.PWRET_CANCEL:
      begin
        MandaMemo('PWRET_CANCEL');
      end;

    PWEnums.PWRET_FALLBACK:
      begin
        MandaMemo('PWRET_FALLBACK');
      end;

    PWEnums.PWRET_DISPLAY:
      begin
        MandaMemo('PWRET_DISPLAY');
      end;
    // printf("\nRetorno = PWRET_DISPLAY");
    // InputCR(pszDspMsg);
    // printf("\n%s", pszDspMsg);

    PWEnums.PWRET_NOTHING:
      begin
        MandaMemo('PWRET_NOTHING');
      end;

    PWEnums.PWRET_FROMHOST:
      // printf("\nRetorno = ERRO DO HOST");
      begin
        MandaMemo('PWRET_FROMHOST');
      end;

    PWEnums.PWRET_SSLCERTERR:
      begin
        MandaMemo('PWRET_SSLCERTERR');
      end;

    PWEnums.PWRET_SSLNCONN:
      begin
        MandaMemo('PWRET_SSLNCONN');
      end;

    PWEnums.PWRET_FROMHOSTPENDTRN:
      begin
        MandaMemo('PWRET_FROMHOSTPENDTRN');
      end;

  else

    begin
      begin
        MandaMemo('OUTRO ERRO: ' + IntToStr(iReturnCode));
      end;

    end;

    if (iReturnCode <> PWEnums.PWRET_MOREDATA) and
      (iReturnCode <> PWEnums.PWRET_DISPLAY) and
      (iReturnCode <> PWEnums.PWRET_NOTHING) and
      (iReturnCode <> PWEnums.PWRET_FALLBACK) then
    begin
      // intResultParams();
    end;

  end;

end;

// =====================================================================================*\
{
  Funcao     :  pszGetInfoDescription

  Descricao  :  Esta função recebe um código PWINFO_XXX e retorna uma string com a
  descrição da informação representada por aquele código.

  Entradas   :  wIdentificador :  Código da informação (PWINFO_XXX).

  Saidas     :  nao ha.

  Retorno    :  String representando o código recebido como parâmetro.
}
// =====================================================================================*/
function TPGWLib.pszGetInfoDescription(wIdentificador: Integer): string;
begin

  case wIdentificador of

    PWEnums.PWINFO_OPERATION:
      Result := 'PWINFO_OPERATION';

    PWEnums.PWINFO_POSID:
      Result := 'PWINFO_POSID';
    PWEnums.PWINFO_AUTNAME:
      Result := 'PWINFO_AUTNAME';
    PWEnums.PWINFO_AUTVER:
      Result := 'PWINFO_AUTVER';
    PWEnums.PWINFO_AUTDEV:
      Result := 'PWINFO_AUTDEV';
    PWEnums.PWINFO_DESTTCPIP:
      Result := 'PWINFO_DESTTCPIP';
    PWEnums.PWINFO_MERCHCNPJCPF:
      Result := 'PWINFO_MERCHCNPJCPF';
    PWEnums.PWINFO_AUTCAP:
      Result := 'PWINFO_AUTCAP';
    PWEnums.PWINFO_TOTAMNT:
      Result := 'PWINFO_TOTAMNT';
    PWEnums.PWINFO_CURRENCY:
      Result := 'PWINFO_CURRENCY';
    PWEnums.PWINFO_CURREXP:
      Result := 'PWINFO_CURREXP';
    PWEnums.PWINFO_FISCALREF:
      Result := 'PWINFO_FISCALREF';
    PWEnums.PWINFO_CARDTYPE:
      Result := 'PWINFO_CARDTYPE';
    PWEnums.PWINFO_PRODUCTNAME:
      Result := 'PWINFO_PRODUCTNAME';
    PWEnums.PWINFO_DATETIME:
      Result := 'PWINFO_DATETIME';
    PWEnums.PWINFO_REQNUM:
      Result := 'PWINFO_REQNUM';
    PWEnums.PWINFO_AUTHSYST:
      Result := 'PWINFO_AUTHSYST';
    PWEnums.PWINFO_VIRTMERCH:
      Result := 'PWINFO_VIRTMERCH';
    PWEnums.PWINFO_AUTMERCHID:
      Result := 'PWINFO_AUTMERCHID';
    PWEnums.PWINFO_PHONEFULLNO:
      Result := 'PWINFO_PHONEFULLNO';
    PWEnums.PWINFO_FINTYPE:
      Result := 'PWINFO_FINTYPE';
    PWEnums.PWINFO_INSTALLMENTS:
      Result := 'PWINFO_INSTALLMENTS';
    PWEnums.PWINFO_INSTALLMDATE:
      Result := 'PWINFO_INSTALLMDATE';
    PWEnums.PWINFO_PRODUCTID:
      Result := 'PWINFO_PRODUCTID';
    PWEnums.PWINFO_RESULTMSG:
      Result := 'PWINFO_RESULTMSG';
    PWEnums.PWINFO_CNFREQ:
      Result := 'PWINFO_CNFREQ';
    PWEnums.PWINFO_AUTLOCREF:
      Result := 'PWINFO_AUTLOCREF';
    PWEnums.PWINFO_AUTEXTREF:
      Result := 'PWINFO_AUTEXTREF';
    PWEnums.PWINFO_AUTHCODE:
      Result := 'PWINFO_AUTHCODE';
    PWEnums.PWINFO_AUTRESPCODE:
      Result := 'PWINFO_AUTRESPCODE';
    PWEnums.PWINFO_DISCOUNTAMT:
      Result := 'PWINFO_DISCOUNTAMT';
    PWEnums.PWINFO_CASHBACKAMT:
      Result := 'PWINFO_CASHBACKAMT';
    PWEnums.PWINFO_CARDNAME:
      Result := 'PWINFO_CARDNAME';
    PWEnums.PWINFO_ONOFF:
      Result := 'PWINFO_ONOFF';
    PWEnums.PWINFO_BOARDINGTAX:
      Result := 'PWINFO_BOARDINGTAX';
    PWEnums.PWINFO_TIPAMOUNT:
      Result := 'PWINFO_TIPAMOUNT';
    PWEnums.PWINFO_INSTALLM1AMT:
      Result := 'PWINFO_INSTALLM1AMT';
    PWEnums.PWINFO_INSTALLMAMNT:
      Result := 'PWINFO_INSTALLMAMNT';
    PWEnums.PWINFO_RCPTFULL:
      Result := 'PWINFO_RCPTFULL';
    PWEnums.PWINFO_RCPTMERCH:
      Result := 'PWINFO_RCPTMERCH';
    PWEnums.PWINFO_RCPTCHOLDER:
      Result := 'PWINFO_RCPTCHOLDER';
    PWEnums.PWINFO_RCPTCHSHORT:
      Result := 'PWINFO_RCPTCHSHORT';
    PWEnums.PWINFO_TRNORIGDATE:
      Result := 'PWINFO_TRNORIGDATE';
    PWEnums.PWINFO_TRNORIGTIME:
      Result := 'PWINFO_TRNORIGTIME';
    PWEnums.PWINFO_TRNORIGNSU:
      Result := 'PWINFO_TRNORIGNSU';
    PWEnums.PWINFO_TRNORIGAMNT:
      Result := 'PWINFO_TRNORIGAMNT';
    PWEnums.PWINFO_TRNORIGAUTH:
      Result := 'PWINFO_TRNORIGAUTH';
    PWEnums.PWINFO_TRNORIGREQNUM:
      Result := 'PWINFO_TRNORIGREQNUM';
    PWEnums.PWINFO_CARDFULLPAN:
      Result := 'PWINFO_CARDFULLPAN';
    PWEnums.PWINFO_CARDEXPDATE:
      Result := 'PWINFO_CARDEXPDATE';
    PWEnums.PWINFO_CARDNAMESTD:
      Result := 'PWINFO_CARDNAMESTD';
    PWEnums.PWINFO_CARDPARCPAN:
      Result := 'PWINFO_CARDPARCPAN';
    PWEnums.PWINFO_BARCODENTMODE:
      Result := 'PWINFO_BARCODENTMODE';
    PWEnums.PWINFO_BARCODE:
      Result := 'PWINFO_BARCODE';
    PWEnums.PWINFO_MERCHADDDATA1:
      Result := 'PWINFO_MERCHADDDATA1';
    PWEnums.PWINFO_MERCHADDDATA2:
      Result := 'PWINFO_MERCHADDDATA2';
    PWEnums.PWINFO_MERCHADDDATA3:
      Result := 'PWINFO_MERCHADDDATA3';
    PWEnums.PWINFO_MERCHADDDATA4:
      Result := 'PWINFO_MERCHADDDATA4';
    PWEnums.PWINFO_PAYMNTTYPE:
      Result := 'PWINFO_PAYMNTTYPE';
    PWEnums.PWINFO_USINGPINPAD:
      Result := 'PWINFO_USINGPINPAD';
    PWEnums.PWINFO_PPCOMMPORT:
      Result := 'PWINFO_PPCOMMPORT';
    PWEnums.PWINFO_IDLEPROCTIME:
      Result := 'PWINFO_IDLEPROCTIME';
    PWEnums.PWINFO_PNDAUTHSYST:
      Result := 'PWINFO_PNDAUTHSYST';
    PWEnums.PWINFO_PNDVIRTMERCH:
      Result := 'PWINFO_PNDVIRTMERCH';
    PWEnums.PWINFO_PNDREQNUM:
      Result := 'PWINFO_PNDREQNUM';
    PWEnums.PWINFO_PNDAUTLOCREF:
      Result := 'PWINFO_PNDAUTLOCREF';
    PWEnums.PWINFO_PNDAUTEXTREF:
      Result := 'PWINFO_PNDAUTEXTREF';
  else
    begin
      Result := 'PWINFO_XXX';
    end;

  end;

end;

// ==========================================================
{
  Mensagem de Processamento...
}
// ==========================================================
function TPGWLib.Aguardando: string;
var
  Y: Integer;
begin

  if (txt = '') then
  begin
    txt := 'Processando ';
  end;

  if (Length(txt) > 40) then
  begin
    frmTEF_Adm.Memo1.Lines.Add(' ');
    txt := 'Processando ';
  end;

  txt := txt + '.';
  Y := frmTEF_Adm.Memo1.CaretPos.Y;
  frmTEF_Adm.Memo1.Lines.Strings[Y] := txt;

end;




// ============================================================

// ==========================================================
// Retorna Valor da Constante escolhida na Captura no PinPad
// ==========================================================
Function TPGWLib.PORTADOR(PWDADO: string): Integer;
begin

  case AnsiIndexStr(PWDADO, ['DIGITE_O_DDD', 'REDIGITE_O_DDD',
    'DIGITE_O_TELEFONE', 'REDIGITE_O_TELEFONE', 'DIGITE_DDD_TELEFONE',
    'REDIGITE_DDD_TELEFONE', 'DIGITE_O_CPF', 'REDIGITE_O_CPF', 'DIGITE_O_RG',
    'REDIGITE_O_RG', 'DIGITE_OS_4_ULTIMOS_DIGITOS',
    'DIGITE_CODIGO_DE_SEGURANCA']) of

    0:
      Result := PWEnums.DIGITE_O_DDD;
    1:
      Result := PWEnums.REDIGITE_O_DDD;
    2:
      Result := PWEnums.DIGITE_O_TELEFONE;
    3:
      Result := PWEnums.REDIGITE_O_TELEFONE;
    4:
      Result := PWEnums.DIGITE_DDD_TELEFONE;
    5:
      Result := PWEnums.REDIGITE_DDD_TELEFONE;
    6:
      Result := PWEnums.DIGITE_O_CPF;
    7:
      Result := PWEnums.REDIGITE_O_CPF;
    8:
      Result := PWEnums.DIGITE_O_RG;
    9:
      Result := PWEnums.REDIGITE_O_RG;
    10:
      Result := PWEnums.DIGITE_OS_4_ULTIMOS_DIGITOS;
    11:
      Result := PWEnums.DIGITE_CODIGO_DE_SEGURANCA;
  else
    ShowMessage('Nenhuma Opção Escolhida');
  end;

end;

// ==========================================================
// Retorna Valor da Operação escolhida
// ==========================================================
Function TPGWLib.OPERACAO(PWOPER: string): Integer;
begin

  case AnsiIndexStr(PWOPER, ['PWOPER_NULL', 'PWOPER_INSTALL', 'PWOPER_PARAMUPD',
    'PWOPER_REPRINT', 'PWOPER_RPTTRUNC', 'PWOPER_RPTDETAIL', 'PWOPER_ADMIN',
    'PWOPER_SALE', 'PWOPER_SALEVOID', 'PWOPER_PREPAID', 'PWOPER_CHECKINQ',
    'PWOPER_RETBALINQ', 'PWOPER_CRDBALINQ', 'PWOPER_INITIALIZ',
    'PWOPER_SETTLEMNT', 'PWOPER_PREAUTH', 'PWOPER_PREAUTVOID',
    'PWOPER_CASHWDRWL', 'PWOPER_LOCALMAINT', 'PWOPER_FINANCINQ',
    'PWOPER_ADDRVERIF', 'PWOPER_SALEPRE', 'PWOPER_LOYCREDIT',
    'PWOPER_LOYCREDVOID', 'PWOPER_LOYDEBIT', 'PWOPER_LOYDEBVOID', 'PWOPER_VOID',
    'PWOPER_VERSION', 'PWOPER_CONFIG', 'PWOPER_MAINTENANCE']) of

    0:
      Result := PWEnums.PWOPER_NULL;
    1:
      Result := PWEnums.PWOPER_INSTALL;
    2:
      Result := PWEnums.PWOPER_PARAMUPD;
    3:
      Result := PWEnums.PWOPER_REPRINT;
    4:
      Result := PWEnums.PWOPER_RPTTRUNC;
    5:
      Result := PWEnums.PWOPER_RPTDETAIL;
    6:
      Result := PWEnums.PWOPER_ADMIN;
    7:
      Result := PWEnums.PWOPER_SALE;
    8:
      Result := PWEnums.PWOPER_SALEVOID;
    9:
      Result := PWEnums.PWOPER_PREPAID;
    10:
      Result := PWEnums.PWOPER_CHECKINQ;
    11:
      Result := PWEnums.PWOPER_RETBALINQ;
    12:
      Result := PWEnums.PWOPER_CRDBALINQ;
    13:
      Result := PWEnums.PWOPER_INITIALIZ;
    14:
      Result := PWEnums.PWOPER_SETTLEMNT;
    15:
      Result := PWEnums.PWOPER_PREAUTH;
    16:
      Result := PWEnums.PWOPER_PREAUTVOID;
    17:
      Result := PWEnums.PWOPER_CASHWDRWL;
    18:
      Result := PWEnums.PWOPER_LOCALMAINT;
    19:
      Result := PWEnums.PWOPER_FINANCINQ;
    20:
      Result := PWEnums.PWOPER_ADDRVERIF;
    21:
      Result := PWEnums.PWOPER_SALEPRE;
    22:
      Result := PWEnums.PWOPER_LOYCREDIT;
    23:
      Result := PWEnums.PWOPER_LOYCREDVOID;
    24:
      Result := PWEnums.PWOPER_LOYDEBIT;
    25:
      Result := PWEnums.PWOPER_LOYDEBVOID;
    26:
      Result := PWEnums.PWOPER_VOID;
    27:
      Result := PWEnums.PWOPER_VERSION;
    28:
      Result := PWEnums.PWOPER_CONFIG;
    29:
      Result := PWEnums.PWOPER_MAINTENANCE;

  end;

end;

end.
