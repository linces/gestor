object frmCorrecoes: TfrmCorrecoes
  Left = 0
  Top = 0
  Caption = 'Lista de Corre'#231#245'es'
  ClientHeight = 422
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MemoCorrecoes: TRichEdit
    Left = 0
    Top = 0
    Width = 852
    Height = 422
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      
        '**********************************04/01/2020********************' +
        '****************'
      '1. Nova tela de lista de corre'#231#245'es Menu/Ajuda/Corre'#231#245'es'
      '2. Corre'#231#227'o da rotina que ler numero de terminais controle web'
      '3. Corre'#231#227'o para imprimir automaticamete no PDV'
      
        '4. Corre'#231#227'o da Tela FPG p/ permitir gerar forma de pagamento pre' +
        ' definido'
      '5. Corre'#231#227'o da NFe para gerar nfe de cfop 5929 e 6929'
      '6. Corre'#231#227'o de pdv para importar or'#231'amento e os com desconto'
      '7. Alterar o Serial para gerar chave com numero de terminais'
      '8. Corre'#231#227'o erro de porta ao imprimir pdv'
      '9. Corre'#231#227'o para gerar a vers'#227'o do sistema automaticamente'
      '10. Gerar mesas automaticamente'
      '11. Corre'#231#227'o de erro ao emitir NFe com desconto'
      '12. Remover Item do PDV pelo c'#243'digo de barras'
      ''
      
        '**********************************05/01/2020********************' +
        '****************'
      '1. Trabalhar com v'#225'rias notas referenciadas'
      '2. Relat'#243'rio de total de compras e vendas por csosn e cst'
      ''
      ''
      
        '**********************************13/01/2020********************' +
        '****************'
      
        '1. Melhoria da rotina de chave prim'#225'ria que em algumas situa'#231#245'es' +
        ' estava dando erro de primary key'
      '2. Atualize o IBPT'
      '3. Fa'#231'a os teste das atualzia'#231#245'es antes de atualizar no cliente'
      ''
      
        '**********************************16/01/2020********************' +
        '****************'
      
        '1. Altera'#231#227'o da rotina de backup para evitar sobreposi'#231#227'o de cop' +
        'ias feitas no mesmo dia'
      '2. Corre'#231#227'o ao da baixa no CR n'#227'o estava caindo no caixa'
      '3. Trazer todos os clienets selecionados em NFCE'
      ''
      ''
      
        '**********************************16/01/2020********************' +
        '****************'
      '1. Enviar NFCe OFFline em lote'
      
        '2. Enviar automaticamente NFCe em conting'#234'ncia se der erro ao tr' +
        'ansmitir'
      ''
      
        '**********************************18/01/2020********************' +
        '****************'
      '1. Permiti informar acr'#233'scimo no pdv'
      '2. Parametro habilita e desabilita op'#231#227'o de acrescimo no pdv'
      '3. Mudan'#231'a no relat'#243'rio de NFCe'
      '4. Permitir grade em venda normal pdv'
      '5. Corre'#231#227'o Sangria e Suprimento erro de chave primaria'
      ''
      
        '**********************************20/01/2020********************' +
        '****************'
      '1. Evitar que usuario digite a quantidade em branco no pdv'
      '2. Corre'#231#227'o do rateio de ascrescimo no fechamento de venda'
      '3. Mudan'#231'a do invent'#225'rio para permitir ajueste dos usuarios'
      ''
      
        '**********************************30/01/2020********************' +
        '****************'
      
        '1. Corrigir campo splash abertura para puxar o caminho da imagem' +
        ' do splash'
      
        '2. Erro ao baixar lote estava indo para a forma de pagamento e c' +
        'onta errado'
      '3. Corrigir campo rateio de acrescimo pdv'
      ''
      
        '**********************************31/01/2020********************' +
        '****************'
      '1. Corre'#231#227'o da NFe n'#227'o estava permitindo emitir nfe de devolu'#231#227'o'
      '2. Corre'#231#227'o da NFe n'#227'o estava preenchendo a tag CNF'
      ''
      
        '**********************************04/02/2020********************' +
        '****************'
      '1. Atualizar o xml para nfe cancelada'
      '2. Atualizar o xml para nfce cancelada'
      '3. Corrigir erro clicar em recuperar'
      '4. Gerar PDFs NFCe e NFe'
      '5. Gerar Duplicatas na nfe estava dando erro de arredodameno'
      '6. Rotina para reinviar e cancelar sat'
      ''
      
        '**********************************08/02/2020********************' +
        '****************'
      '1. Checar data do sistema'
      '2. erro ao emitir cte destinatario isento'
      '3. Permite configurar escpos (MARGEMS, NUMERO DE LINHAS E ETC);'
      '4. adi'#231#227'o de 3 novas imrpessoras JIANG, GPRINTER, POSSTAR;'
      ''
      
        '**********************************09/02/2020********************' +
        '****************'
      '1. Aba de CFOP e impostos externos cadastro empresa e produtos'
      
        '2. NFe puxar a configura'#231#227'o de imposto fora do estado de cadastr' +
        'o de produto'
      
        '3. Empresa for do simples nacional n'#227'o permite aliquota >0 para ' +
        'emiss'#227'o normal'
      ''
      
        '**********************************12/02/2020********************' +
        '****************'
      '1. Corre'#231#227'o de erro ao recuperar NFCe'
      '2. Corre'#231#227'o de erro filtro Pedido de Venda Zerado'
      '3. Corrre'#231#227'o de erro inutilizar sat'
      '4. corre'#231#227'o de erro Baixa em lote contas a receber'
      '5. Corre'#231#227'o de erro relat'#243'rio listagem de produtos totais'
      ''
      
        '**********************************13/02/2020********************' +
        '****************'
      '1. Corre'#231#227'o de erro cancelamento NF-e'
      ''
      
        '**********************************17/02/2020********************' +
        '****************'
      '1. Sincronizador de DADOS (Matriz Filial e Terminais OFFline)'
      ''
      
        '**********************************20/02/2020********************' +
        '****************'
      '1. Executavel Restore - Para restaurar backup'
      '2. Op'#231#227'o de excluir produto sem lan'#231'amentos'
      '3. Atualizar dados tributarios de NFCE offline'
      '4. Gerar xml de compra para o contador'
      '5. Corrigir referencia multipla, campo codigo auto incremento'
      '6. Corrigir impress'#227'o do campo telefone pedido de venda'
      ''
      
        '***************************** 29/02/2020 ***********************' +
        '*****************'
      '1. Corre'#231#227'o do Invetario'
      '2. Cria'#231#227'o de Rotina de Boleto Banc'#225'rio'
      '3. Melhorar a velocidade de abertura do sistema'
      '4. Corre'#231#227'o de Importa'#231#227'o de Pedido que n'#227'o tenha emitido Cupom'
      
        '5. Parametros para perguntar se quer imprimir segunda via do NFC' +
        'e'
      '5. Atualizar a aCBr'
      '6. Corre'#231#227'o da Rotina de Comunica'#231#227'o dos Dados Offline'
      '7. Mudan'#231'a dos icones do menu principal'
      ''
      
        '***************************** 03/03/2020 ***********************' +
        '*****************'
      '1. Corre'#231#227'o de Impress'#227'o de Etiqueta'
      '2. Cria'#231#227'o de Rotina de Impress'#227'o de Boleto Banc'#225'rio'
      '3. Corre'#231#227'o do PDV abertura'
      '4. Corre'#231#227'o do Recupera NFCE itens'
      '5. Corre'#231#227'o do NFCe Transmiss'#227'o'
      '6. Corre'#231#227'o do NFCe Impress'#227'o'
      ''
      
        '***************************** 04/03/2020 ***********************' +
        '*****************'
      '1. Bot'#227'o de Impress'#227'o do Boleto no Contas a Receber'
      
        '2. Bot'#227'o de Impress'#227'o do Boleto no Fcehamento da Venda '#224' Prazo -' +
        ' PDV'
      
        '3. Ao ler xml se O cfop 5401 ou 5405, Cadastrar produto j'#225' com e' +
        'ste CFOP.'
      '4. Corre'#231#227'o de Rotina Gerar XML Contador'
      '5. Corre'#231#227'o da NFe estava zerando o PIS'
      '6. Corre'#231#227'o da NFe Duplicidade'
      ''
      
        '***************************** 05/03/2020 ***********************' +
        '*****************'
      '1. Corre'#231#227'o de Lan'#231'amento de Venda Composi'#231#227'o PDV'
      '2. Corre'#231#227'o Inserir Telas Menu Principal'
      '3. Corre'#231#227'o Gerar Arquivos Conatdor Campo Trib_IMP'
      '4. Op'#231#227'o de Preview na NFe'
      '5. Corre'#231#227'o de Erro Impress'#227'o de Boleto'
      '6. Corre'#231#227'o de Erro Limpar Financeiro'
      '7. Corre'#231#227'o de Erro Pesquisa Avan'#231'ada'
      ''
      
        '***************************** 06/03/2020 ***********************' +
        '*****************'
      
        '1. Tela Sat fiscal emitidos - Consulta pelo c'#243'digo - n'#227'o esta bu' +
        'scando- Corrigido'
      '2. PDV - Busca pre'#231'o n'#227'o estava filtrando produto por empresa'
      '3. PDV - Tava permitindo importa pedido cancelado'
      '4. Buscar Logo do Banco autom'#225'tico no Boleto'
      ''
      '30/03/2020'
      ''
      
        '1. Estoque produtos mais vendidos, menos vendidos, mais lucrativ' +
        'o, menos lucravivos,'
      ' curva ABC,funcionamento do F4 para imprimir.'
      '2. Ficha de clientes, funcionamentodo F6 para receber.'
      '3. Tela de ajuste de grade.'
      '4. Gerar boleto NFe.'
      '5. Corre'#231#227'o grade e PDV.'
      '6. Pesquisar por refer'#234'ncia.'
      '7. Emitir NFe/NFCe CFOP 5656 - Combustiveis.'
      
        '8. Melhoria da velocidade do leitor de codigo de barras no PDV i' +
        'tem.'
      '9. Ccriticar estoque composi'#231#227'o/ grade.'
      '10.N'#227'o minimizar tela quando trocar de us'#250'ario.'
      '11.Relat'#243'rio estoque em grade.'
      '12.Relatorio estoque composi'#231#227'o.'
      '13.Corre'#231#227'o CEST invalido.'
      '14.Corre'#231#227'o do ajuste de saldo.'
      '15.Impressao de NFCe Qrcode a direita'
      '16.Aumetar o campo Razao cliente para 100'
      '17. Mudar os botoes exibe  F3, F4, F5,F6 PDV para o terminal'
      
        '18. Adicionar op'#231#227'o no terminal para manda imprimir direto do bo' +
        't'#227'o concluir'
      '19. Colocar a tela de terminal no Menu Sistema'
      ''
      'MELHORIAS NO SISTEMA.'
      ''
      '31\03\2020'
      ''
      
        '1-Estoque produtos mais vendidos, menos vendidos, mais lucrativo' +
        ', menos lucravivos,'
      ' curva ABC,funcionamento do F4 para imprimir.'
      '2-Ficha de clientes, funcionamentodo F6 para receber.'
      '3-tela de ajuste de grade.'
      '4- gerar boleto NFe.'
      '5-corre'#231#227'o grade e PDV.'
      '6-pesquisar por refer'#234'ncia.'
      '7- CFOP 5656.'
      
        '8- melhoria da velocidade do leitor de codigo de barras no PDV i' +
        'tem.'
      '9-criticar estoque composi'#231#227'o.'
      '10-n'#227'o minimizar tela quando trocar de us'#250'ario.'
      '11-relatorio estoque em grade.'
      '12-relatorio estoque composi'#231#227'o.'
      '13-cesy invalido.'
      '14- ajuste de saldo.'
      '15-impressao de NFCe Qrcode a direita.'
      ''
      '01\04\2020'
      ''
      '1-Contas a receber o funcionamento do delete.'
      '2-Mudan'#231'a de terminais de configura'#231#227'o para tela de sistema.'
      '3-Relat'#243'rio de vendas por produto, funcionamento do F4.'
      '4-Resolvido de erro em webservice distribui'#231#227'o de DFe.'
      '5-Resolvido erro de SMTP erro.'
      '6-Funcionamento do F10, F4, ESC de terminais.'
      '7-Corre'#231#227'o em terminais nas teclas F4, F10, ESC.'
      '8-Funcionamento das teclas F5, F7, F8.'
      '9-Tomador de servi'#231'os repara'#231#227'o de erro quando iniciava.'
      '10-Corre'#231#227'o de erro em gerar XML do m'#234's em NFCe.'
      '11-Nfe corre'#231#227'o de nota, e das teclas F3, F4.'
      '12-Corre'#231#227'o na tela de in'#237'cio do sistema.'
      '13-Inclus'#227'o de Novos styles para o sistema.'
      '14-Corre'#231#227'o de mensagem de erro, em trasportadora.'
      ''
      '02/04/2020'
      ''
      '1-Inclus'#227'o de nova CFOP no sistema.'
      '2-Corre'#231#227'o de mensagem de erro em cadastro de novo produto.'
      
        '3-Corre'#231#227'o de mensagem de erro em carn'#234' impress'#227'o termica de con' +
        'tas a pagar.'
      
        '4-Resolvido em notas de fornecedores, o n'#227'o verificar e consulta' +
        'r por chave.'
      ''
      '03/04/2020'
      ''
      '1-Inclus'#227'o de leitor de codigo de barras em or'#231'amento.'
      '2-Inclus'#227'o de leitor de codigo de barras em NFe.'
      '3-Inclus'#227'o de leitor de codigo de barras em compras.'
      '4-Inclus'#227'o de leitor de codigo de barras em ordem de servi'#231'o.'
      ''
      '06/04/2020'
      ''
      '1-Incus'#227'o de abertura de gaveta direto do PDV.'
      '2-Corre'#231#245'es em impress'#227'o de carn'#234' em pagamentos.'
      '3-Mudan'#231'a na aba terminais.'
      '4-Inclus'#227'o de configura'#231#227'o sat em termnais.'
      ''
      '09/04/2020'
      ''
      '1-Melhorias em substitui'#231#227'o tributaria.'
      '2-Mudar o periodo com enter pra selecionar data.'
      '3-Corre'#231#227'o envio de email.'
      ''
      '13/04/2020'
      ''
      
        '1-Inclus'#227'o de relat'#243'rio de vendas especificando o cliente e o pr' +
        'oduto.'
      '2-Cadastro de cliente na tela de ordem de servi'#231'o.'
      '3- Corre'#231#227'o em NFe n'#227'o mudava o n'#250'mero da nota.'
      
        '4- Corre'#231#227'o campo observa'#231#227'o do cupom onde n'#227'o estava saindo a i' +
        'mpress'#227'o.'
      ''
      '20/04/2020'
      ''
      '1-Inclus'#227'o de relat'#243'rio para estoque fiscal.'
      
        '2-Atualiza'#231#227'o automatica pode ser feito na hora quando inicio o ' +
        'sistema ou depois.'
      '3-Inclus'#227'o de relat'#243'rio de vendas de produtos por cliente.'
      '4-Inclus'#227'o para multiplos terminais no sistema.'
      '5-Mudan'#231'a do layout no PDV.'
      ''
      '27/04/2020'
      ''
      
        '1-Exclu'#227'o de layouts do retaguarda, auric, carbon, charcoal dark' +
        ' slate, cyan night, light, luna, silver, slate classico.'
      
        '2-Corre'#231#227'o no PDV que n'#227'o estava puxando a conmiss'#227'o do vendedor' +
        '.'
      
        '3-Cnae do cadastro de empresa estava digitando 20 caracteres cor' +
        'rigido.'
      '4-Corre'#231#227'o do email que n'#227'o estava enviando pra hotmail.'
      
        '5-Erro depois de impress'#227'o ap'#243's convers'#227'o de banco de dados em c' +
        'ontas a pagar resolvido.'
      '6-Comiss'#227'o de vendedor s'#243' tava puxando do vendedor loja.'
      
        '7-Em terminais quando desmarcava a op'#231#227'o do F3, F4, F5, F6, aind' +
        'a continava aparecendo resolvido.'
      
        '8-Em contas a pagar quando ia baixar e lote aparecia uma mensage' +
        'm de erro.'
      '9-Resumo de caixa, tinha a op'#231#227'o de fechar que ja foi retirado.'
      ''
      '28/04/2020'
      ''
      
        '1-Corre'#231#227'o do F2 em remessa de boleto que n'#227'o estava funcionando' +
        '.'
      '2-Orcamento n'#227'o estava puxando do email com cliente.'
      '3-Orcamento n'#227'o puxa codigo do cliente resolvido.'
      ''
      '04/05/2020'
      ''
      
        '1-Corre'#231#227'o no livro de caixa que poderia excluir o fechamento de' +
        ' caixa.'
      '2-Melhorar a velocidade de ver a nota XML.'
      
        '3-Mudan'#231'a na tela de NFe que agora vc pode ver a descri'#231#227'o compl' +
        'eta s'#243' digitando o produto.'
      
        '4-Em compras quando importava o XML da compra, ficava gravada a ' +
        'anterior, corrigido.'
      '5-Corre'#231#227'o do funcionamento dos F8, F7 em MDFe.'
      ''
      '05/05/2020'
      ''
      
        '1-Em orcamento quando fazia pesquisa de cliente n'#227'o deixava sele' +
        'cionar com o mouse, resolvido.'
      
        '2-Corre'#231#227'o da importa'#231#227'o do XML que cadastrava produto sem estoq' +
        'ue.'
      
        '3-Corre'#231#227'o em cadastro de combustivel tava fazendo o c'#225'lculo e i' +
        'nformando que n'#227'o dava 100%.'
      
        '4-Em contas a receber quando mandava imprimir um vinda todos, re' +
        'solvido.'
      '5-Inclus'#227'o rel'#225'torio de vendas por cfop.'
      '6-Corre'#231#227'o das impress'#245'es dos rel'#225'torios em movimento.'
      
        '7-Na tela de pagamento n'#227'o deixava digitar mais de uma letra qua' +
        'ndo pesquisava o cliente, corrigido.'
      ''
      '06/05/2020'
      ''
      
        '1-Melhorou a velocidade de leitura do XML de nota de fornecedore' +
        's.'
      '2-Corre'#231#227'o de exclus'#227'o de lan'#231'amento de caixa.'
      '3-Contas a pagar, agora pode mudar o valor das parcelas.'
      
        '4-Em orcamento, mudan'#231'a na impress'#227'o no lugar no numero do item ' +
        'agora sai o codigo.'
      ''
      '08/05/2020'
      ''
      '1-melhoria na nota de compra.'
      '2-em NFe agora traz a descri'#231#227'o do produto antes de selecionar.'
      ''
      '14/05/2020'
      ''
      '1-Inclu'#227'o do chatboot pra vendas.'
      '2-Em NFe quando mudar o cfop da nota muda do produto.'
      
        '3-Corre'#231#227'o na impress'#227'o de trasportadora que s'#243' buscava o fantas' +
        'ia.'
      ''
      '15/04/2020'
      ''
      '1-Inclus'#227'o CFOP para o monulo fiscal.'
      '2-Em NFe quando mudar o CFOP na nota mudar tamb'#233'm do produto.'
      '3-Aumentar o tamanho das letras na pesquisa no pdv.'
      '4-Retirada da op'#231#227'o de saldo anterior em livro de caixa.'
      '5-Em controle de estoque mudar o produto fiscal aleat'#243'rio.'
      
        '6-Em impress'#227'o de cupom fiscal em controle de estoque imprimir t' +
        'amb'#233'm o pedido.'
      
        '7-Em orcamento quando pesquisava o cliente e apertava enter n'#227'o ' +
        'fazai nada, resolvido.'
      
        '8-Inclus'#227'o de nos relat'#243'rios de movimento mostrar o subtotal da ' +
        'nota.'
      
        '9-Venda com a fun'#231#227'o controlar estoque fiscal, baixar os 2 estoq' +
        'ues.'
      
        '10-Na tela de pagamento quando aperta F2 pra pesquisar cliente n' +
        #227'o muda o cpf da pessoa.'
      '11-Resolvido erro na impress'#227'o de cadastro de veiculos.'
      '12-Na NFe entrava e pesquisa nada quando sai grava.'
      ''
      '18/05/2020'
      ''
      '1-Colocar padr'#227'o de porcentagem na entrada notas da empresa.'
      '2-Inclu'#227'o de logomarca na tela de entrada do sistema.'
      '3-Backup autom'#225'tico do sistema em segundo plano.'
      ''
      '21/05/2020'
      ''
      
        '1-Inclus'#227'o em cadastro de pessoa, parceiro, admistradora de cart' +
        #227'o.'
      
        '2-Inclus'#227'o em cadatro de produtos, fazer com tributa'#231#227'o monof'#225'si' +
        'ca.'
      
        '3-Em PDV, busca avan'#231'ada, agora pesquisa tambem por c'#243'digo de ba' +
        'rras.'
      
        '4-Inclus'#227'o de relat'#243'rio, vendas de produtos monof'#225'sico em movime' +
        'nto.'
      ''
      ''
      '01/06/2020'
      ''
      
        '1-Corre'#231#227'o na tela de ajuste de estoque, quando em rede n'#227'o dava' +
        ' baixa no estoque.'
      
        '2-Na tela de NFe colocar pra dar o desconto pela margem do produ' +
        'to ao inves do valor.'
      
        '3-Corre'#231#227'o de erro na tela de compras quando finalizava, trazia ' +
        'uma mensagem de erro.'
      
        '4-Inclu'#227'o na tela na tela do pdv quando n'#227'o for o caixa imprimiu' +
        ' um pedido de venda pro caixa.'
      '5-imprimir um NFCe em folha A4 no tamanho do cupom.'
      
        '6-Inclus'#227'o em OS quando finalizar trazer a hora e a data do term' +
        'ino do servi'#231'o.'
      
        '7-Inclus'#227'o em par'#226'mentros da empresa, quando for cart'#227'o de credi' +
        'to emitir o cupom, assim que estiver marcado.'
      ''
      ''
      '15/06/2020'
      ''
      
        '1-Inclus'#227'o de um atalho para cadastrar o cliente na hora da vend' +
        'a pelo PDV.'
      
        '2-Corrigido Desconto que '#233' dado no servi'#231'o dentro da O.S n'#227'o apa' +
        'race quando importa para nfc-e.'
      '3-Corre'#231#227'o de Invent'#225'rio csosn/cst nas teclas F4, e o ESC.'
      
        '4-Corre'#231#227'o Na impress'#227'o da ordem de servi'#231'o a primeira parte da ' +
        'impress'#227'o no lugar da descri'#231#227'o sai a data da previs'#227'o '
      'da entrega.'
      
        '5-Corre'#231#227'o Na NFe a op'#231#227'o importar, em devolu'#231#227'o de venda na tec' +
        'la F5.'
      
        '6-Nas telas cadastro de pessoa, transportadora, e produto maximi' +
        'zar foi retirado.'
      
        '7-No cadastro de produto o cfop n'#227'o grava sem o a qualtidade cor' +
        'reta.'
      
        '8-No PDV em importar o F9 de pesquisar o per'#237'odo n'#227'o est'#225' funcio' +
        'nando.'
      
        '9-Retirado do cadastro de transportadora do modulo administrativ' +
        'o.'
      
        '10-Retirado  do modulo ajuda atualizar sistema, liberar sistema,' +
        ' registrar sistema.'
      '11-Corre'#231#227'o de Speed contribui'#231#245'es na tecla F2.'
      '12-Corre'#231#227'o de Speed fiscal o F2 na tecla .'
      '13-Inclus'#227'o de um campo pra colocar a numera'#231#227'o do boleto.'
      ''
      ''
      '22/06/2020'
      ''
      '1-Inclus'#227'o de importar xml de vendas em fiscal.'
      '2-Alterar estoque na tela de cadastro de produto.'
      '3-Impress'#227'o de ordem de servi'#231'o em t'#233'rmica.'
      '4-Devolu'#231#227'o imprimir em t'#233'rmica.'
      '5-Cria'#231#227'o em NFe campo de base icms st e valor icms st.'
      '6-Inclus'#227'o de Duplicar NFe.'
      
        '7-Inclus'#227'o de campo na tela de cadastro de pessoa pra colocar se' +
        ' e do regime simples ou normal.'
      
        '8-Inclus'#227'o de um campo em na tela de p'#226'ramentros para colocar o ' +
        'smtp pr'#243'prio.'
      '9-Reimpress'#227'o de cupom fiscal pelo pdv.'
      '10-Corre'#231#227'o de nota, que tava permitindo consumidor final.'
      ''
      ''
      '21/07/2020'
      ''
      
        '1-No pdv retirada e suprimento mudan'#231'a de linha pra outra com o ' +
        'enter.'
      '2-Corre'#231#227'o nos but'#245'es F2 de speed contribui'#231#227'o, F2 speed fiscal.'
      
        '3-Cria'#231#227'o de mais um campo para colocar mais de um motoriasta em' +
        ' transportadora.'
      '4-Cadastro de Pessoa corre'#231#227'o, nome da m'#227'e.'
      
        '5-NFE em informa'#231#245'es adicionais aumentou a quantidade de caracte' +
        'res.'
      
        '6-Corre'#231#227'o na forma de pagamento outros n'#227'o aparecia no fechamen' +
        'to de caixa.'
      '7-Inclus'#227'o de mais um campo MDFE  para escolher motorista.'
      '8-Cadastro empresa CNAE n'#227'o permitir gravar com 1 digito.'
      '9-Corre'#231#227'o em devolu'#231#227'o de venda, qunando dinheiro.'
      '10-Corre'#231#227'o de rel'#225'torio de pre'#231'o alterado.'
      '11-Corre'#231#227'o de importa'#231#227'o de NFe de venda.'
      '12-Inclus'#227'o de importa'#231#227'o de v'#225'rios or'#231'amentos pra NFe.'
      
        '13-Inclus'#227'o de um campo la, em empresa pra dar baixa em estoque ' +
        'composi'#231#227'o, quando for fazer nota de entrada.'
      ''
      '30/07/2020'
      ''
      '1-Inclus'#227'o de modulo restaurante.'
      
        '2-Inclus'#227'o de um campo em terminais onde o cliente escolhe se qu' +
        'er ou n'#227'o impres'#227'o de logo na NFCe.'
      
        '3-NFE melhoria na busca avan'#231'ada do produto por c'#243'digo/c'#243'digo de' +
        ' barras e descri'#231#227'o.'
      
        '4-Corre'#231#227'o no frente de caixa,n'#227'o deixa alterar o produto mesmo ' +
        'sendo supervisor, quando n'#227'o e caixa.'
      
        '5-Inclus'#227'o de mesnsagem em nota de fornecedores quando, o docume' +
        'nto n'#227'o estiver dispon'#237'vel.'
      
        '6-Corre'#231#227'o na tela de pdv onde aceitava acr'#233'scimo e desconto na ' +
        'mesma nota corrigido.'
      
        '7-Corre'#231#227'o em NFe feita como entrada depois de cancelada produto' +
        ' continuava no estoque.'
      
        '8-Inclus'#227'o de pesquisa por partes do texto em cadastro de pessoa' +
        ', de produtos, contas a pagar, contas a receber.'
      
        '9-Inclus'#227'o de pesquisa por partes do texto em NFe, orcamento, or' +
        'dem de servi'#231'o, pdv, busca avan'#231'ada pdv.'
      
        '10-Inclus'#227'o de nas telas de de ordem de sevi'#231'o, orcamento, NFe, ' +
        'lan'#231'amento de compra, pesquisar por cnpj.'
      ''
      ''
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Zoom = 100
  end
end
