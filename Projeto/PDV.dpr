program PDV;

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Serial in '..\View\Serial.pas',
  uVendaCheque in '..\View\uVendaCheque.pas' {frmCHParcela},
  uAcesso in '..\View\uAcesso.pas' {frmAcesso},
  U_Backup in '..\View\U_Backup.pas' {frmBackup},
  uAbreCaixa in '..\View\uAbreCaixa.pas' {frmAbreCaixa},
  uReceberCaixa in '..\View\uReceberCaixa.pas' {frmReceberCaixa},
  uSupervisor in '..\View\uSupervisor.pas' {FrmSupervisor},
  uVendaPagar in '..\View\uVendaPagar.pas' {frmCRParcela},
  uSuprimento_Sangria in '..\View\uSuprimento_Sangria.pas' {FrmSuprimento_Sangria},
  uProdutos in '..\View\uProdutos.pas' {frmProdutos},
  uImportar in '..\View\uImportar.pas' {frmImportar},
  Udados in '..\Model\Udados.pas' {Dados: TDataModule},
  uBuscaPreco in '..\View\uBuscaPreco.pas' {FrmBuscaPreco},
  ufrmStatus in '..\View\ufrmStatus.pas' {frmStatus},
  uPrincipio_Ativo in '..\View\uPrincipio_Ativo.pas' {frmPrincipio},
  uVendaCartao in '..\View\uVendaCartao.pas' {frmCartaoParcela},
  uResumoCaixa in '..\View\uResumoCaixa.pas' {frmResumoCaixa},
  uBaixaReceber in '..\View\uBaixaReceber.pas' {frmBaixaReceber},
  uPesquisaPrincipio in '..\View\uPesquisaPrincipio.pas' {frmPesquisaPrincipio},
  uPDV in '..\View\uPDV.pas' {FrmPDV},
  uConexaoBD in '..\View\uConexaoBD.pas' {frmConexaoBD},
  PesquisaProduto in '..\View\PesquisaProduto.pas' {frmPesquisaProduto},
  uChave in '..\View\uChave.pas' {frmChave},
  uFormaPagamento in '..\View\uFormaPagamento.pas' {frmFechaVenda},
  uContaDeposito in '..\View\uContaDeposito.pas' {FrmContaDeposito},
  uCadProduto in '..\View\uCadProduto.pas' {FrmCadProduto},
  uGrupo in '..\View\uGrupo.pas' {frmGrupo},
  uUnidade in '..\View\uUnidade.pas' {frmUnidade},
  uTabelaIcms in '..\View\uTabelaIcms.pas' {FrmTabela},
  uMarca in '..\View\uMarca.pas' {frmMarca},
  uConsReceber in '..\View\uConsReceber.pas' {frmConsReceber},
  uCadReceber in '..\View\uCadReceber.pas' {frmCadReceber},
  uBalanca in '..\View\uBalanca.pas' {frmBalanca},
  uBaixaReceberLote in '..\View\uBaixaReceberLote.pas' {frmBaixaReceberLote},
  uMenuImportarPDV in '..\View\uMenuImportarPDV.pas' {frmImportarPDV},
  uGrade in '..\View\uGrade.pas' {FrmGrade},
  AcertaSaldo in '..\View\AcertaSaldo.pas' {frmAcertaSaldo},
  uConsEntregador in '..\View\uConsEntregador.pas' {FrmConsEntregador},
  uCadPessoa in '..\View\uCadPessoa.pas' {frmCadPessoa},
  uPessoa in '..\View\uPessoa.pas' {frmPessoas},
  uConsVendedor in '..\View\uConsVendedor.pas' {FrmConsVendedor},
  uRemoveProduto in '..\View\uRemoveProduto.pas' {FrmRemoveProduto},
  uRotinasComuns in '..\View\uRotinasComuns.pas' {DMRotinas: TDataModule},
  uSplash in 'uSplash.pas' {frmSplash},
  uclassCBR_REMESSA in '..\Boleto\class\uclassCBR_REMESSA.pas',
  uclassCBR_RETORNO in '..\Boleto\class\uclassCBR_RETORNO.pas',
  uclassCBR_TITULOS in '..\Boleto\class\uclassCBR_TITULOS.pas',
  uclassDB in '..\Boleto\class\uclassDB.pas',
  uclassLOG in '..\Boleto\class\uclassLOG.pas',
  uclassUTIL in '..\Boleto\class\uclassUTIL.pas',
  ufuncoes in '..\Boleto\unit\ufuncoes.pas',
  ufrmDefault in '..\Boleto\ufrmDefault.pas' {frmDefault},
  ufrmMENSAGEMespera in '..\Boleto\ufrmMENSAGEMespera.pas' {frmMENSAGEMespera},
  udtmCBR in '..\Model\udtmCBR.pas' {dtmCBR: TDataModule},
  uRespTecnico in '..\View\uRespTecnico.pas' {frmRespTecnico},
  uDadosWeb in '..\Model\uDadosWeb.pas' {DadosWeb: TDataModule},
  uEstoque_FI_Insuficiente in '..\View\uEstoque_FI_Insuficiente.pas' {frmEstoque_FI_Insuficiente},
  uResumo in '..\View\uResumo.pas' {frmSerial},
  uTransfComanda in '..\View\uTransfComanda.pas' {frmTransfComanda},
  uEnums in '..\View\uEnums.pas',
  uLib in '..\View\uLib.pas',
  uLib02 in '..\View\uLib02.pas',
  frExibeMensagem in '..\View\frExibeMensagem.pas' {FormExibeMensagem},
  uTef in '..\View\uTef.pas' {FrmTEF},
  udmImpressao in '..\Model\udmImpressao.pas' {DMImpressao: TDataModule},
  uDmNFe in '..\Model\uDmNFe.pas' {dmNFe: TDataModule},
  uDMSat in '..\Model\uDMSat.pas' {DMSat: TDataModule},
  uDmPDV in '..\Model\uDmPDV.pas' {dmPDV: TDataModule},
  uDesconhecido in '..\View\uDesconhecido.pas' {frmdesconhecido},
  uCadPessoaRapido in '..\View\uCadPessoaRapido.pas' {frmCadPessoaRapido},
  uReimprimir in '..\View\uReimprimir.pas' {frmReimprimir},
  uDMEstoque in '..\Model\uDMEstoque.pas' {DMEstoque: TDataModule};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := Application.ExeName;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TDadosWeb, DadosWeb);
  Application.CreateForm(TDMRotinas, DMRotinas);
  Application.CreateForm(TdtmCBR, dtmCBR);
  Application.CreateForm(TDadosWeb, DadosWeb);
  Application.CreateForm(TDMImpressao, DMImpressao);
  Application.CreateForm(TdmNFe, dmNFe);
  Application.CreateForm(TDMSat, DMSat);
  Application.CreateForm(TdmPDV, dmPDV);
  Application.CreateForm(TDMEstoque, DMEstoque);
  Dados.ConfiguraEstilo(Dados.qryParametroESTILO.Value);
  Application.CreateForm(TFrmPDV, FrmPDV);
  Application.CreateForm(TFrmTef, FrmTef);
  Application.Run;

end.
