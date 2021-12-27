program Gestor;

uses
  System.SysUtils,
  vcl.Forms,
  windows,
  Serial in '..\View\Serial.pas',
  PageControlEx in '..\View\PageControlEx.pas',
  uCadProduto in '..\View\uCadProduto.pas' {FrmCadProduto},
  UCFOP in '..\View\UCFOP.pas' {frmCFOP},
  uContas in '..\View\uContas.pas' {frmContas},
  uFichaCliente in '..\View\uFichaCliente.pas' {frmFichaCliente},
  uCadRecibo in '..\View\uCadRecibo.pas' {frmCadRecibo},
  uConsReceber in '..\View\uConsReceber.pas' {frmConsReceber},
  uTransportador in '..\View\uTransportador.pas' {frmTransportadora},
  uVendaCheque in '..\View\uVendaCheque.pas' {frmCHParcela},
  uAcesso in '..\View\uAcesso.pas' {frmAcesso},
  U_Backup in '..\View\U_Backup.pas' {frmBackup},
  uPermissoes in '..\View\uPermissoes.pas' {frmPermissoes},
  uCadMDFe in '..\View\uCadMDFe.pas' {frmCadMDFe},
  uAbreCaixa in '..\View\uAbreCaixa.pas' {frmAbreCaixa},
  uConsEmpresa in '..\View\uConsEmpresa.pas' {frmConsEmpresa},
  uCadUniforme in '..\View\uCadUniforme.pas' {frmCadOS_Roupa},
  uReceberCaixa in '..\View\uReceberCaixa.pas' {frmReceberCaixa},
  uConfig in '..\View\uConfig.pas' {frmConfig},
  UpLANO in '..\View\UpLANO.pas' {frmPlano},
  UUsuarios in '..\View\UUsuarios.pas' {FrmUsuarios},
  uDevolucaoCompra in '..\View\uDevolucaoCompra.pas' {frmDevolucaoCompra},
  uParametros in '..\View\uParametros.pas' {FrmParametros},
  uContador in '..\View\uContador.pas' {frmContador},
  uCompraPagar in '..\View\uCompraPagar.pas' {frmCPParcela},
  LeXmlNE in '..\View\LeXmlNE.pas' {FrmXml},
  uChave in '..\View\uChave.pas' {frmChave},
  uSat in '..\View\uSat.pas' {frmSat},
  uPessoa in '..\View\uPessoa.pas' {frmPessoas},
  uCadPessoaRapido in '..\View\uCadPessoaRapido.pas' {frmCadPessoaRapido},
  uImportarCompra in '..\View\uImportarCompra.pas' {frmImportaCompra},
  uFichaClienteReceber in '..\View\uFichaClienteReceber.pas' {frmCadFichaClieR},
  uTabelaPreco in '..\View\uTabelaPreco.pas' {frmTabelaPreco},
  utrocaSenha in '..\View\utrocaSenha.pas' {FrmTrocaSenha},
  uParOrcamento in '..\View\uParOrcamento.pas' {frmParOrcamento},
  uParPagar in '..\View\uParPagar.pas' {frmParPagar},
  uParCaixa in '..\View\uParCaixa.pas' {frmParCaixa},
  uOrcamento in '..\View\uOrcamento.pas' {frmOrcamento},
  uCadOrcamento in '..\View\uCadOrcamento.pas' {frmCadOrcamento},
  uFichaPedido in '..\View\uFichaPedido.pas' {frmFichaPedido},
  uConsPagar in '..\View\uConsPagar.pas' {frmConsPagar},
  uBaixaPagar in '..\View\uBaixaPagar.pas' {frmBaixaPagar},
  uCaixa in '..\View\uCaixa.pas' {frmCaixa},
  uCadReceber in '..\View\uCadReceber.pas' {frmCadReceber},
  uInventįrio in '..\View\uInventįrio.pas' {FrmInventario},
  uZeraEstoqueNegativo in '..\View\uZeraEstoqueNegativo.pas' {frmZeraNegativo},
  uSupervisor in '..\View\uSupervisor.pas' {FrmSupervisor},
  uVendaPagar in '..\View\uVendaPagar.pas' {frmCRParcela},
  uSuprimento_Sangria in '..\View\uSuprimento_Sangria.pas' {FrmSuprimento_Sangria},
  uExtenso in '..\View\uExtenso.pas',
  uCadCaixa in '..\View\uCadCaixa.pas' {frmCadCaixa},
  uRecibo in '..\View\uRecibo.pas' {frmRecibo},
  uParComissao in '..\View\uParComissao.pas' {frmParComissao},
  uEtiquetas in '..\View\uEtiquetas.pas' {frmEtiquetas},
  uICMS in '..\View\uICMS.pas' {FrmICMS},
  uParBalanco in '..\View\uParBalanco.pas' {frmParBalanco},
  uTransferencia in '..\View\uTransferencia.pas' {frmTransferencia},
  uParReceber in '..\View\uParReceber.pas' {frmParReceber},
  uCadCompra in '..\View\uCadCompra.pas' {frmCadCompra},
  uImportarMDFe in '..\View\uImportarMDFe.pas' {frmImportarMDFe},
  uCompra in '..\View\uCompra.pas' {frmCompra},
  uReimprimir in '..\View\uReimprimir.pas' {frmReimprimir},
  uContaDeposito in '..\View\uContaDeposito.pas' {FrmContaDeposito},
  UPagamento in '..\View\UPagamento.pas' {frmFPG},
  uParProdutoFiscal in '..\View\uParProdutoFiscal.pas' {frmParProdutoFiscal},
  uEmpresa in '..\View\uEmpresa.pas' {frmEmpresa},
  uConsMDFe in '..\View\uConsMDFe.pas' {frmConsMDFe},
  uCadTransp in '..\View\uCadTransp.pas' {frmCadTransp},
  uTomador in '..\View\uTomador.pas' {frmTomador},
  uIBPT in '..\View\uIBPT.pas' {frmIBPT},
  uParResumoCaixa in '..\View\uParResumoCaixa.pas' {frmParResumoCaixa},
  uEmail in '..\View\uEmail.pas' {FrmEmail},
  uParMonofasico in '..\View\uParMonofasico.pas' {frmParProdutoMono},
  uVeiculos in '..\View\uVeiculos.pas' {frmVeiculos},
  uParCurvaABC in '..\View\uParCurvaABC.pas' {frmParCurvaABC},
  uPedidoVenda in '..\View\uPedidoVenda.pas' {frmPedidoVenda},
  uUnidade in '..\View\uUnidade.pas' {frmUnidade},
  uBalanca in '..\View\uBalanca.pas' {frmBalanca},
  uTabelaIcms in '..\View\uTabelaIcms.pas' {FrmTabela},
  uAjustaPreco in '..\View\uAjustaPreco.pas' {FrmAjustaPreco},
  uMesas in '..\View\uMesas.pas' {frmMesas},
  Udados in '..\Model\Udados.pas' {Dados: TDataModule},
  uPrincipal in '..\View\uPrincipal.pas' {frmPrincipal},
  uConexaoBD in '..\View\uConexaoBD.pas' {frmConexaoBD},
  uCadCTeOS in '..\View\uCadCTeOS.pas' {frmCadCTeOS},
  uHistorico_Usuario in '..\View\uHistorico_Usuario.pas' {frmHistorico_usuario},
  uBuscaPreco in '..\View\uBuscaPreco.pas' {FrmBuscaPreco},
  uHistoricoPorduto in '..\View\uHistoricoPorduto.pas' {frmHistoricoProduto},
  uConsNFe in '..\View\uConsNFe.pas' {frmConsNFe},
  uNFe in '..\View\uNFe.pas' {frmCadNFe},
  uGeraSF in '..\View\uGeraSF.pas' {FrmSpedSf},
  udadosSped in '..\Model\udadosSped.pas' {DadosSped: TDataModule},
  uGeraSP in '..\View\uGeraSP.pas' {FrmSpedSP},
  uRemetente in '..\View\uRemetente.pas' {frmRemetente},
  uManifesto in '..\View\uManifesto.pas' {FrmManifesto},
  uVendedores in '..\View\uVendedores.pas' {frmVendedor},
  uConsEntregador in '..\View\uConsEntregador.pas' {FrmConsEntregador},
  uCadCTe in '..\View\uCadCTe.pas' {frmCadCTe},
  uConsCTe in '..\View\uConsCTe.pas' {frmConsCTe},
  uNaoEncerrado in '..\View\uNaoEncerrado.pas' {frmEncerrar},
  uConsCTe_RodoViario in '..\View\uConsCTe_RodoViario.pas' {frmConsCTe_Rodo},
  uImportarCTe in '..\View\uImportarCTe.pas' {frmImportarCTe},
  uCadPedido in '..\View\uCadPedido.pas' {frmCadPedido},
  uPedido in '..\View\uPedido.pas' {frmPedido},
  ufrmStatus in '..\View\ufrmStatus.pas' {frmStatus},
  uImportarNFe in '..\View\uImportarNFe.pas' {frmImportarNFe},
  uPedidoWeb in '..\View\uPedidoWeb.pas' {FrmPedidoWeb},
  uSincronizar in '..\View\uSincronizar.pas' {FrmSincronizar},
  uPrincipio_Ativo in '..\View\uPrincipio_Ativo.pas' {frmPrincipio},
  uDevolucao in '..\View\uDevolucao.pas' {frmDevolucao},
  uCadDevolucaoComrpa in '..\View\uCadDevolucaoComrpa.pas' {frmCadDevolucaoCompra},
  uCadDevolucao in '..\View\uCadDevolucao.pas' {frmCadDevolucao},
  uParEstoqueFiscal in '..\View\uParEstoqueFiscal.pas' {frmParEstoqueFI},
  uVendaCartao in '..\View\uVendaCartao.pas' {frmCartaoParcela},
  uResumoCaixa in '..\View\uResumoCaixa.pas' {frmResumoCaixa},
  uParDiario in '..\View\uParDiario.pas' {frmParDiario},
  uTipoTecido in '..\View\uTipoTecido.pas' {frmTipoTecido},
  uMarca in '..\View\uMarca.pas' {frmMarca},
  uCadPagar in '..\View\uCadPagar.pas' {frmCadPagar},
  uPesquisaPrincipio in '..\View\uPesquisaPrincipio.pas' {frmPesquisa},
  uParFPG in '..\View\uParFPG.pas' {frmParFPG},
  uCadFichaCliente in '..\View\uCadFichaCliente.pas' {frmCadFichaCliente},
  uCadOS in '..\View\uCadOS.pas' {frmCadOS},
  uConsOS in '..\View\uConsOS.pas' {frmConsOS},
  uConsOS_Roupa in '..\View\uConsOS_Roupa.pas' {frmConsOS_Roupa},
  uParPlanoConta in '..\View\uParPlanoConta.pas' {frmParPlanoConta},
  uFormaPagamento in '..\View\uFormaPagamento.pas' {frmFechaVenda},
  uSintegra in '..\View\uSintegra.pas' {frmSintegra},
  uGeraSintegra in '..\View\uGeraSintegra.pas',
  uImportarXMLNFe in '..\View\uImportarXMLNFe.pas' {frmImportaXMLNFe},
  TabCloseButton in '..\View\TabCloseButton.pas',
  AcertaSaldo in '..\View\AcertaSaldo.pas' {frmAcertaSaldo},
  uEntregador in '..\View\uEntregador.pas' {frmEntregador},
  uResumo in '..\View\uResumo.pas' {frmSerial},
  uParFinanceiroCartao in '..\View\uParFinanceiroCartao.pas' {frmParFinanceiroCartao},
  uHistoricoVendaProduto_Vdd in '..\View\uHistoricoVendaProduto_Vdd.pas' {frmHistoricoVendaProduto_VDD},
  uDadosWeb in '..\Model\uDadosWeb.pas' {DadosWeb: TDataModule},
  uBaixaReceber in '..\View\uBaixaReceber.pas' {frmBaixaReceber},
  PesquisaProduto in '..\View\PesquisaProduto.pas' {frmPesquisaProduto},
  uBaixaPagarLote in '..\View\uBaixaPagarLote.pas' {frmBaixaPagarLote},
  uBaixaReceberLote in '..\View\uBaixaReceberLote.pas' {frmBaixaReceberLote},
  uScript in '..\View\uScript.pas' {frmScript},
  uProdutos in '..\View\uProdutos.pas' {frmProdutos},
  uMenuImportarPDV in '..\View\uMenuImportarPDV.pas' {frmImportarPDV},
  uPDV in '..\View\uPDV.pas' {FrmPDV},
  uLCP in '..\View\uLCP.pas' {frmLCP},
  uConsVendedor in '..\View\uConsVendedor.pas' {FrmConsVendedor},
  uRemoveProduto in '..\View\uRemoveProduto.pas' {FrmRemoveProduto},
  uSabores in '..\View\uSabores.pas' {frmSabores},
  uLista in '..\View\uLista.pas',
  uTradutor in '..\View\uTradutor.pas' {frmTradutor},
  uNFCe in '..\View\uNFCe.pas' {frmNFCe},
  uRotinasComuns in '..\View\uRotinasComuns.pas' {DMRotinas: TDataModule},
  uCorrecoes in '..\View\uCorrecoes.pas' {frmCorrecoes},
  uParFinanceiro in '..\View\uParFinanceiro.pas' {frmParFinanceiro},
  udtmCBR in '..\Model\udtmCBR.pas' {dtmCBR: TDataModule},
  uclassCBR_REMESSA in '..\Boleto\class\uclassCBR_REMESSA.pas',
  uclassCBR_RETORNO in '..\Boleto\class\uclassCBR_RETORNO.pas',
  uclassCBR_TITULOS in '..\Boleto\class\uclassCBR_TITULOS.pas',
  uclassDB in '..\Boleto\class\uclassDB.pas',
  uclassLOG in '..\Boleto\class\uclassLOG.pas',
  uclassUTIL in '..\Boleto\class\uclassUTIL.pas',
  ufuncoes in '..\Boleto\unit\ufuncoes.pas',
  ufrmCBRconfig in '..\Boleto\ufrmCBRconfig.pas' {frmCBRconfig},
  ufrmDefault in '..\Boleto\ufrmDefault.pas' {frmDefault},
  ufrmDefaultCadastro in '..\Boleto\ufrmDefaultCadastro.pas' {frmDefaultCadastro},
  ufrmDefaultClean in '..\Boleto\ufrmDefaultClean.pas' {frmDefaultClean},
  ufrmDefaultConsulta in '..\Boleto\ufrmDefaultConsulta.pas' {frmDefaultConsulta},
  ufrmMENSAGEMespera in '..\Boleto\ufrmMENSAGEMespera.pas' {frmMENSAGEMespera},
  ufrmREMESSAcadastro in '..\Boleto\ufrmREMESSAcadastro.pas' {frmREMESSAcadastro},
  ufrmREMESSAmanutencao in '..\Boleto\ufrmREMESSAmanutencao.pas' {frmREMESSAmanutencao},
  ufrmREMESSArelatorio in '..\Boleto\ufrmREMESSArelatorio.pas' {frmREMESSArelatorio},
  ufrmRETORNOmanutencao in '..\Boleto\ufrmRETORNOmanutencao.pas' {frmRETORNOmanutencao},
  ufrmRETORNOrelatorio in '..\Boleto\ufrmRETORNOrelatorio.pas' {frmRETORNOrelatorio},
  uRespTecnico in '..\View\uRespTecnico.pas' {frmRespTecnico},
  uTerminais in '..\View\uTerminais.pas' {frmTerminais},
  uHistoricoVendaProduto in '..\View\uHistoricoVendaProduto.pas' {frmHistoricoVendaProduto},
  uHistoricoVendaProduto_Cliente in '..\View\uHistoricoVendaProduto_Cliente.pas' {frmHistoricoVendaProduto_Cliente},
  uParInventarioImposto in '..\View\uParInventarioImposto.pas' {frmParCSOSNCST},
  uEstoque_FI_Insuficiente in '..\View\uEstoque_FI_Insuficiente.pas' {frmEstoque_FI_Insuficiente},
  uParProduto in '..\View\uParProduto.pas' {frmParProduto},
  uParCFOP_CSOSN in '..\View\uParCFOP_CSOSN.pas' {frmParCSOSN_CFOP},
  uImportarXML in '..\View\uImportarXML.pas' {frmImportaXML},
  uTransfComanda in '..\View\uTransfComanda.pas' {frmTransfComanda},
  uCadPessoa in '..\View\uCadPessoa.pas' {frmCadPessoa},
  uFabricarProduto in '..\View\uFabricarProduto.pas' {frmFabricar},
  uAcertaEstoque in '..\View\uAcertaEstoque.pas' {frmAcerta},
  uEnums in '..\View\uEnums.pas',
  frExibeMensagem in '..\View\frExibeMensagem.pas' {FormExibeMensagem},
  uTef in '..\View\uTef.pas' {FrmTEF},
  udmImpressao in '..\Model\udmImpressao.pas' {DMImpressao: TDataModule},
  uDmNFe in '..\Model\uDmNFe.pas' {dmNFe: TDataModule},
  uDMSat in '..\Model\uDMSat.pas' {DMSat: TDataModule},
  uDmMDFE in '..\Model\uDmMDFE.pas' {DmMDFe: TDataModule},
  uDmCTe in '..\Model\uDmCTe.pas' {dmCTe: TDataModule},
  uDmPDV in '..\Model\uDmPDV.pas' {dmPDV: TDataModule},
  uDestinatario in '..\View\uDestinatario.pas' {frmDestinatario},
  uDesconhecido in '..\View\uDesconhecido.pas' {frmdesconhecido},
  uImportar in '..\View\uImportar.pas' {frmImportar},
  TDI in '..\View\TDI.pas',
  uExecute in '..\View\uExecute.pas' {frmExecute},
  uGrupo in '..\View\uGrupo.pas' {frmGrupo},
  uDMEstoque in '..\Model\uDMEstoque.pas' {DMEstoque: TDataModule},
  uGradeDevCo in '..\View\uGradeDevCo.pas' {FrmGradeDevCO},
  uGradeOS in '..\View\uGradeOS.pas' {FrmGradeOS},
  uGradeCompra in '..\View\uGradeCompra.pas' {FrmGradeCo},
  uGrade in '..\View\uGrade.pas' {FrmGrade},
  uParPreco in '..\View\uParPreco.pas' {frmPrecoAlterado},
  uParConferencia in '..\View\uParConferencia.pas' {frmConferecia},
  uSplash in 'uSplash.pas' {frmSplash},
  uAtualizadorAutomatico in '..\View\uAtualizadorAutomatico.pas' {FrmAtualiza},
  uClassificacao_Master in '..\View\uClassificacao_Master.pas' {frmLaudo},
  uCadLaudo in '..\View\uCadLaudo.pas' {frmCadLaudo},
  uDadosLaudo in '..\Model\uDadosLaudo.pas' {DadosLaudo: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
    uTInject.ConfigCEF,
  uWhatsAppFrmPrincipal in 'uWhatsAppFrmPrincipal.pas' {frmWhats},
  unframWpp in 'unframWpp.pas' {framWpp: TFrame};

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := false;

 if not GlobalCEFApp.StartMainProcess then
  exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.Title := Application.ExeName;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TDadosSped, DadosSped);
  Application.CreateForm(TDadosWeb, DadosWeb);
  Application.CreateForm(TDMRotinas, DMRotinas);
  Application.CreateForm(TdtmCBR, dtmCBR);
  Application.CreateForm(TDMImpressao, DMImpressao);
  Application.CreateForm(TdmNFe, dmNFe);
  Application.CreateForm(TDMSat, DMSat);
  Application.CreateForm(TDmMDFe, DmMDFe);
  Application.CreateForm(TdmCTe, dmCTe);
  Application.CreateForm(TdmPDV, dmPDV);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Application.CreateForm(TDadosLaudo, DadosLaudo);
  Dados.ConfiguraEstilo(Dados.qryParametroESTILO.Value);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TFrmTEF, FrmTEF);
  Application.Run;

end.
