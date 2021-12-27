unit udadosSped;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, acbrutil, math,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dateutils;

type
  TDadosSped = class(TDataModule)
    qrProdutos: TFDQuery;
    qryConfig_Sped: TFDQuery;
    qryItens_NFe_S: TFDQuery;
    QryItens_NFCe_S: TFDQuery;
    qryNFCE_S: TFDQuery;
    qryNFE_S: TFDQuery;
    qrUnidades: TFDQuery;
    qrUnidadesABREVIATURA: TStringField;
    qrUnidadesDESCRICAO: TStringField;
    qryConsC100: TFDQuery;
    qryConsC100CODIGO: TIntegerField;
    qryConsUnidade: TFDQuery;
    qryConsUnidadeCODIGO: TIntegerField;
    qryConsUnidadeUNIDADE: TStringField;
    qryConsUnidadeDESCRICAO: TStringField;
    qrParticipantes: TFDQuery;
    qrParticipantesCOD_PART: TStringField;
    qrParticipantesCNPJ: TStringField;
    qrParticipantesIE: TStringField;
    qrParticipantesRAZAO: TStringField;
    qrParticipantesFANTASIA: TStringField;
    qrParticipantesENDERECO: TStringField;
    qrParticipantesNUMERO: TStringField;
    qrParticipantesBAIRRO: TStringField;
    qrParticipantesCODMUN: TIntegerField;
    qryItensC: TFDQuery;
    qryItens_NFe_E: TFDQuery;
    qryNFe_E: TFDQuery;
    qryCompra: TFDQuery;
    qryConsC170: TFDQuery;
    qryC170_NFe_S: TFDQuery;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    qryContador: TFDQuery;
    qryContadorCODIGO: TSmallintField;
    qryContadorNOME: TStringField;
    qryContadorCNPJ: TStringField;
    qryContadorCPF: TStringField;
    qryContadorCRC: TStringField;
    qryContadorENDERECO: TStringField;
    qryContadorNUMERO: TStringField;
    qryContadorCOMPLEMENTO: TStringField;
    qryContadorCEP: TStringField;
    qryContadorBAIRRO: TStringField;
    qryContadorCOD_MUN: TIntegerField;
    qryContadorFONE: TStringField;
    qryContadorFAX: TStringField;
    qryContadorEMAIL: TStringField;
    qryContadorUF: TStringField;
    qryContadorFK_USUARIO: TIntegerField;
    qryContadorFK_EMPRESA: TIntegerField;
    qryInventario: TFDQuery;
    qryConsC170CST_ICMS: TStringField;
    qrProdutosCOD_PROD: TIntegerField;
    qrProdutosDESCRICAO: TStringField;
    qrProdutosGTIN: TStringField;
    qrProdutosABREVIATURA: TStringField;
    qrProdutosTIPO_ITEM: TStringField;
    qrProdutosNCM: TStringField;
    qryConfig_SpedFK_EMPRESA: TIntegerField;
    qryConfig_SpedIND_PERFIL: TStringField;
    qryConfig_SpedIND_ATIV: TStringField;
    qryConfig_SpedIND_EXP: TStringField;
    qryConfig_SpedIND_CCRF: TStringField;
    qryConfig_SpedIND_COMB: TStringField;
    qryConfig_SpedIND_USINA: TStringField;
    qryConfig_SpedIND_VA: TStringField;
    qryConfig_SpedIND_EE: TStringField;
    qryConfig_SpedIND_CART: TStringField;
    qryConfig_SpedIND_FORM: TStringField;
    qryConfig_SpedIND_AER: TStringField;
    qryConfig_SpedCOD_INC_TRIB: TStringField;
    qryConfig_SpedIND_APRO_CRED: TStringField;
    qryConfig_SpedCOD_TIPO_CONT: TStringField;
    qryConfig_SpedCOD_REGIME_TRIBUTARIO: TStringField;
    qryConfig_SpedIND_REG_CUM: TStringField;
    qryConfig_SpedFK_USUARIO: TIntegerField;
    qryC170_NFe_STABELA: TStringField;
    qryC170_NFe_SFKNFE: TIntegerField;
    qryC170_NFe_SCODIGO: TIntegerField;
    qryC170_NFe_SID_PRODUTO: TIntegerField;
    qryC170_NFe_SDESCRICAO: TStringField;
    qryC170_NFe_SQTD: TFMTBCDField;
    qryC170_NFe_SUNIDADE: TStringField;
    qryC170_NFe_STOTAL: TFMTBCDField;
    qryC170_NFe_SIND_MOV: TStringField;
    qryC170_NFe_SCFOP: TStringField;
    qryC170_NFe_SCST: TStringField;
    qryC170_NFe_SBASE_ICMS: TFMTBCDField;
    qryC170_NFe_SALIQ_ICMS: TFMTBCDField;
    qryC170_NFe_SVALOR_ICMS: TFMTBCDField;
    qryC170_NFe_SBASE_ICMS_ST: TFMTBCDField;
    qryC170_NFe_SALIQ_ICMS_ST: TFMTBCDField;
    qryC170_NFe_SVALOR_ICMS_ST: TFMTBCDField;
    qryC170_NFe_SCST_IPI: TStringField;
    qryC170_NFe_SBASE_IPI: TFMTBCDField;
    qryC170_NFe_SALIQ_IPI: TFMTBCDField;
    qryC170_NFe_SVALOR_IPI: TFMTBCDField;
    qryC170_NFe_SCST_PIS: TStringField;
    qryC170_NFe_SBASE_PIS_ICMS: TFMTBCDField;
    qryC170_NFe_SALIQ_PIS_ICMS: TFMTBCDField;
    qryC170_NFe_SVALOR_PIS_ICMS: TFMTBCDField;
    qryC170_NFe_SCST_COFINS: TStringField;
    qryC170_NFe_SBASE_COFINS_ICMS: TFMTBCDField;
    qryC170_NFe_SALIQ_COFINS_ICMS: TFMTBCDField;
    qryC170_NFe_SVALOR_COFINS_ICMS: TFMTBCDField;
    qryC170_NFe_SFRETE: TFMTBCDField;
    qryC170_NFe_SSEGURO: TFMTBCDField;
    qryC170_NFe_SDESPESAS: TFMTBCDField;
    qryC170_NFe_SDESCONTO: TFMTBCDField;
    qryCompraID: TIntegerField;
    qryCompraTPOPERACAO: TStringField;
    qryCompraTPEMISSAO: TStringField;
    qryCompraID_FORNECEDOR: TStringField;
    qryCompraMODELO: TStringField;
    qryCompraSTATUS: TStringField;
    qryCompraSERIE: TStringField;
    qryCompraNR_NOTA: TStringField;
    qryCompraCHAVE: TStringField;
    qryCompraDTEMISSAO: TDateField;
    qryCompraDTENTRADA: TDateField;
    qryCompraTOTAL: TFMTBCDField;
    qryCompraDESCONTO: TFMTBCDField;
    qryCompraFRETE: TFMTBCDField;
    qryCompraSEGURO: TFMTBCDField;
    qryCompraDESPESAS: TFMTBCDField;
    qryCompraSUBTOTAL: TFMTBCDField;
    qryCompraBASE_ICM: TFMTBCDField;
    qryCompraTOTAL_ICM: TFMTBCDField;
    qryCompraBASE_ST: TFMTBCDField;
    qryCompraTOTAL_ST: TFMTBCDField;
    qryCompraTOTAL_IPI: TFMTBCDField;
    qryCompraTOTAL_PIS: TFMTBCDField;
    qryCompraTOTAL_COF: TFMTBCDField;
    qryItensCFK_COMPRA: TIntegerField;
    qryItensCFK_PRODUTO: TIntegerField;
    qryItensCDESCRICAO: TStringField;
    qryItensCQTD: TFMTBCDField;
    qryItensCUNIDADE: TStringField;
    qryItensCVL_ITEM: TFMTBCDField;
    qryItensCIND_MOV: TStringField;
    qryItensCCFOP: TStringField;
    qryItensCCST_ICM: TStringField;
    qryItensCBASE_ICMS: TFMTBCDField;
    qryItensCALIQ_ICMS: TFMTBCDField;
    qryItensCVL_ICMS: TFMTBCDField;
    qryItensCBASE_ST: TFMTBCDField;
    qryItensCALIQ_ST: TFMTBCDField;
    qryItensCVL_ST: TFMTBCDField;
    qryItensCCST_IPI: TStringField;
    qryItensCBASE_IPI: TFMTBCDField;
    qryItensCALIQ_IPI: TFMTBCDField;
    qryItensCVL_IPI: TFMTBCDField;
    qryItensCCST_PIS: TStringField;
    qryItensCBASE_PIS: TFMTBCDField;
    qryItensCALIQ_PIS: TFMTBCDField;
    qryItensCVL_PIS: TFMTBCDField;
    qryItensCCST_COF: TStringField;
    qryItensCBASE_COF: TFMTBCDField;
    qryItensCALIQ_COF: TFMTBCDField;
    qryItensCVL_COF: TFMTBCDField;
    qryItensCFRETE1: TFMTBCDField;
    qryItensCSEGURO: TFMTBCDField;
    qryItensCDESPESA: TFMTBCDField;
    qryItensCDESCONTO: TFMTBCDField;
    qryNFE_SCODIGO: TIntegerField;
    qryNFE_SIND_OPER: TStringField;
    qryNFE_SIND_EMIT: TStringField;
    qryNFE_SID_CLIENTE: TStringField;
    qryNFE_SMODELO: TStringField;
    qryNFE_SSITUACAO: TStringField;
    qryNFE_SSERIE: TStringField;
    qryNFE_SNUMERO: TIntegerField;
    qryNFE_SCHAVE: TStringField;
    qryNFE_SDATA_EMISSAO: TDateField;
    qryNFE_SDATA_SAIDA: TDateField;
    qryNFE_STOTAL: TFMTBCDField;
    qryNFE_SDESCONTO: TFMTBCDField;
    qryNFE_SSUBTOTAL: TFMTBCDField;
    qryNFE_STIPO_FRETE: TStringField;
    qryNFE_SFRETE: TFMTBCDField;
    qryNFE_SSEGURO: TFMTBCDField;
    qryNFE_SDESPESAS: TFMTBCDField;
    qryNFE_SBASEICMS: TFMTBCDField;
    qryNFE_STOTALICMS: TFMTBCDField;
    qryNFE_SBASE_ST: TFMTBCDField;
    qryNFE_STOTAL_ST: TFMTBCDField;
    qryNFE_SBASE_IPI: TFMTBCDField;
    qryNFE_STOTAL_IPI: TFMTBCDField;
    qryNFE_SBASEICMSPIS: TFMTBCDField;
    qryNFE_STOTALICMSPIS: TFMTBCDField;
    qryNFE_SBASEICMSCOF: TFMTBCDField;
    qryNFE_STOTALICMSCOFINS: TFMTBCDField;
    qryItens_NFe_SFKNFE: TIntegerField;
    qryItens_NFe_SCODIGO: TIntegerField;
    qryItens_NFe_SID_PRODUTO: TIntegerField;
    qryItens_NFe_SDESCRICAO: TStringField;
    qryItens_NFe_SQTD: TFMTBCDField;
    qryItens_NFe_SUNIDADE: TStringField;
    qryItens_NFe_STOTAL: TFMTBCDField;
    qryItens_NFe_SIND_MOV: TStringField;
    qryItens_NFe_SCFOP: TStringField;
    qryItens_NFe_SCST: TStringField;
    qryItens_NFe_SBASE_ICMS: TFMTBCDField;
    qryItens_NFe_SALIQ_ICMS: TFMTBCDField;
    qryItens_NFe_SVALOR_ICMS: TFMTBCDField;
    qryItens_NFe_SBASE_ICMS_ST: TFMTBCDField;
    qryItens_NFe_SALIQ_ICMS_ST: TFMTBCDField;
    qryItens_NFe_SVALOR_ICMS_ST: TFMTBCDField;
    qryItens_NFe_SCST_IPI: TStringField;
    qryItens_NFe_SBASE_IPI: TFMTBCDField;
    qryItens_NFe_SALIQ_IPI: TFMTBCDField;
    qryItens_NFe_SVALOR_IPI: TFMTBCDField;
    qryItens_NFe_SCST_PIS: TStringField;
    qryItens_NFe_SBASE_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_SALIQ_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_SVALOR_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_SCST_COFINS: TStringField;
    qryItens_NFe_SBASE_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_SALIQ_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_SVALOR_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_SFRETE: TFMTBCDField;
    qryItens_NFe_SSEGURO: TFMTBCDField;
    qryItens_NFe_SDESPESAS: TFMTBCDField;
    qryItens_NFe_SDESCONTO: TFMTBCDField;
    qryConsC170CFOP: TStringField;
    qryConsC170ALIQ_ICM: TFMTBCDField;
    qryConsC170VL_ITEM: TFMTBCDField;
    qryConsC170VL_OPR: TFMTBCDField;
    qryConsC170VL_BC_ICMS: TFMTBCDField;
    qryConsC170VL_ICMS: TFMTBCDField;
    qryConsC170VL_BC_ICMS_ST: TFMTBCDField;
    qryConsC170VL_ICMS_ST: TFMTBCDField;
    qryConsC170VL_IPI: TFMTBCDField;
    qryNFe_ETPOPERACAO: TStringField;
    qryNFe_ETPEMISSAO: TStringField;
    qryNFe_EID_FORNECEDOR: TStringField;
    qryNFe_EID_PEDIDOCOMPRA: TIntegerField;
    qryNFe_ECODIGO: TIntegerField;
    qryNFe_ESTATUS: TStringField;
    qryNFe_ESERIE: TStringField;
    qryNFe_ENUMERO: TIntegerField;
    qryNFe_ECHAVE: TStringField;
    qryNFe_EDATA_EMISSAO: TDateField;
    qryNFe_ETOTAL: TFMTBCDField;
    qryNFe_EDESCONTO: TFMTBCDField;
    qryNFe_EFRETE: TFMTBCDField;
    qryNFe_ESEGURO: TFMTBCDField;
    qryNFe_EDESPESAS: TFMTBCDField;
    qryNFe_ESUBTOTAL: TFMTBCDField;
    qryNFe_EBASEICMS: TFMTBCDField;
    qryNFe_ETOTALICMS: TFMTBCDField;
    qryNFe_EBASE_ST: TFMTBCDField;
    qryNFe_ETOTAL_ST: TFMTBCDField;
    qryNFe_ETOTAL_IPI: TFMTBCDField;
    qryNFe_ETOTALICMSPIS: TFMTBCDField;
    qryNFe_ETOTALICMSCOFINS: TFMTBCDField;
    qryItens_NFe_EFKNFE: TIntegerField;
    qryItens_NFe_EID_PRODUTO: TIntegerField;
    qryItens_NFe_EDESCRICAO: TStringField;
    qryItens_NFe_EQTD: TFMTBCDField;
    qryItens_NFe_EUNIDADE: TStringField;
    qryItens_NFe_ETOTAL: TFMTBCDField;
    qryItens_NFe_EIND_MOV: TStringField;
    qryItens_NFe_ECFOP: TStringField;
    qryItens_NFe_ECST: TStringField;
    qryItens_NFe_EBASE_ICMS: TFMTBCDField;
    qryItens_NFe_EALIQ_ICMS: TFMTBCDField;
    qryItens_NFe_EVALOR_ICMS: TFMTBCDField;
    qryItens_NFe_EBASE_ICMS_ST: TFMTBCDField;
    qryItens_NFe_EALIQ_ICMS_ST: TFMTBCDField;
    qryItens_NFe_EVALOR_ICMS_ST: TFMTBCDField;
    qryItens_NFe_ECST_IPI: TStringField;
    qryItens_NFe_EBASE_IPI: TFMTBCDField;
    qryItens_NFe_EALIQ_IPI: TFMTBCDField;
    qryItens_NFe_EVALOR_IPI: TFMTBCDField;
    qryItens_NFe_ECST_PIS: TStringField;
    qryItens_NFe_EBASE_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_EALIQ_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_EVALOR_PIS_ICMS: TFMTBCDField;
    qryItens_NFe_ECST_COFINS: TStringField;
    qryItens_NFe_EBASE_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_EALIQ_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_EVALOR_COFINS_ICMS: TFMTBCDField;
    qryItens_NFe_EFRETE: TFMTBCDField;
    qryItens_NFe_ESEGURO: TFMTBCDField;
    qryItens_NFe_EDESPESAS: TFMTBCDField;
    qryItens_NFe_EDESCONTO: TFMTBCDField;
    qryNFCE_SCODIGO: TIntegerField;
    qryNFCE_SIND_OPER: TStringField;
    qryNFCE_SIND_EMIT: TStringField;
    qryNFCE_SID_CLIENTE: TStringField;
    qryNFCE_SMODELO: TStringField;
    qryNFCE_SSITUACAO: TStringField;
    qryNFCE_SSERIE: TStringField;
    qryNFCE_SNUMERO: TIntegerField;
    qryNFCE_SCHAVE: TStringField;
    qryNFCE_SDATA_EMISSAO: TDateField;
    qryNFCE_SDATA_SAIDA: TDateField;
    qryNFCE_STOTAL: TFMTBCDField;
    qryNFCE_SDESCONTO: TFMTBCDField;
    qryNFCE_SSUBTOTAL: TFMTBCDField;
    qryNFCE_STIPO_FRETE: TIntegerField;
    qryNFCE_SFRETE: TIntegerField;
    qryNFCE_SSEGURO: TIntegerField;
    qryNFCE_SDESPESAS: TIntegerField;
    qryNFCE_SBASEICMS: TFMTBCDField;
    qryNFCE_STOTALICMS: TFMTBCDField;
    qryNFCE_SBASE_ST: TIntegerField;
    qryNFCE_STOTAL_ST: TIntegerField;
    qryNFCE_SBASE_IPI: TIntegerField;
    qryNFCE_STOTAL_IPI: TIntegerField;
    qryNFCE_SBASEICMSPIS: TFMTBCDField;
    qryNFCE_STOTALICMSPIS: TFMTBCDField;
    qryNFCE_SBASEICMSCOF: TFMTBCDField;
    qryNFCE_STOTALICMSCOFINS: TFMTBCDField;
    QryItens_NFCe_SFKVENDA: TIntegerField;
    QryItens_NFCe_SCODIGO: TIntegerField;
    QryItens_NFCe_SID_PRODUTO: TIntegerField;
    QryItens_NFCe_SDESCRICAO: TStringField;
    QryItens_NFCe_SQUANTIDADE: TFMTBCDField;
    QryItens_NFCe_SUNIDADE: TStringField;
    QryItens_NFCe_STOTAL: TFMTBCDField;
    QryItens_NFCe_SIND_MOV: TStringField;
    QryItens_NFCe_SCFOP: TStringField;
    QryItens_NFCe_SCST: TStringField;
    QryItens_NFCe_SBASE_ICMS: TFMTBCDField;
    QryItens_NFCe_SALIQ_ICMS: TFMTBCDField;
    QryItens_NFCe_SVALOR_ICMS: TFMTBCDField;
    QryItens_NFCe_SBASE_ICMS_ST: TIntegerField;
    QryItens_NFCe_SALIQ_ICMS_ST: TIntegerField;
    QryItens_NFCe_SVALOR_ICMS_ST: TIntegerField;
    QryItens_NFCe_SCST_IPI: TStringField;
    QryItens_NFCe_SBASE_IPI: TIntegerField;
    QryItens_NFCe_SALIQ_IPI: TIntegerField;
    QryItens_NFCe_SVALOR_IPI: TIntegerField;
    QryItens_NFCe_SCST_PIS: TStringField;
    QryItens_NFCe_SBASE_PIS_ICMS: TFMTBCDField;
    QryItens_NFCe_SALIQ_PIS_ICMS: TFMTBCDField;
    QryItens_NFCe_SVALOR_PIS_ICMS: TFMTBCDField;
    QryItens_NFCe_SCST_COFINS: TStringField;
    QryItens_NFCe_SBASE_COFINS_ICMS: TFMTBCDField;
    QryItens_NFCe_SALIQ_COFINS_ICMS: TFMTBCDField;
    QryItens_NFCe_SVALOR_COFINS_ICMS: TFMTBCDField;
    QryItens_NFCe_SFRETE: TIntegerField;
    QryItens_NFCe_SSEGURO: TIntegerField;
    QryItens_NFCe_SDESPESAS: TIntegerField;
    QryItens_NFCe_SVDESCONTO: TFMTBCDField;
    qryInventarioFK_PRODUTO: TIntegerField;
    qryInventarioDESCRICAO: TStringField;
    qryInventarioPR_CUSTO: TFMTBCDField;
    qryInventarioQTDE: TFMTBCDField;
    qryInventarioQTDS: TFMTBCDField;
    qryInventarioSALDO: TFMTBCDField;
    qryInventarioTOTAL: TFloatField;
    procedure qryInventarioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    CodSped: Integer;
    procedure ImportaParticipante(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaEntradaCompra(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaEntradaNFe(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaProduto(dtini, dtfim: Tdate; Empresa: Integer;
      Tela: String);
    procedure ImportaSaidaNCFe(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaSaidaNFe(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaUNidade(dtini, dtfim: Tdate; Empresa: Integer);
    procedure REGC190(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ImportaInventario(dtini, dtfim: Tdate; Empresa: Integer);
    procedure ApagaRegistro;

    { Public declarations }
  end;

var
  DadosSped: TDadosSped;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados;

{$R *.dfm}

Procedure TDadosSped.ApagaRegistro;
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_Produtos';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_PARTICIPANTES';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_Unidade';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_H005';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_H010';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_c190';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_c170';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := ' delete from SPED_c100';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;

end;

procedure TDadosSped.ImportaParticipante(dtini, dtfim: Tdate; Empresa: Integer);
begin
  DadosSped.qrParticipantes.Close;
  DadosSped.qrParticipantes.Params[0].AsDate := dtini;
  DadosSped.qrParticipantes.Params[1].AsDate := dtfim;
  DadosSped.qrParticipantes.Params[2].Value := Empresa;
  DadosSped.qrParticipantes.Open;

  DadosSped.qrParticipantes.First;

  Dados.qrySped_Participante.Close;
  Dados.qrySped_Participante.Open;

  while not DadosSped.qrParticipantes.Eof do
  begin
    Dados.qrySped_Participante.Insert;
    Dados.qrySped_ParticipanteCODIGO.AsInteger :=
      Dados.Numerador('SPED_PARTICIPANTES', 'CODIGO', 'N', '', '');
    Dados.qrySped_Participantefk_sped.Value := CodSped;
    Dados.qrySped_Participantecod_part.AsFloat :=
      DadosSped.qrParticipantesCOD_PART.AsFloat;
    Dados.qrySped_Participantenome.Value :=
      DadosSped.qrParticipantesRAZAO.Value;

    if (length(tirapontos(DadosSped.qrParticipantesCNPJ.Value))) = 14 then
    begin
      Dados.qrySped_Participantecnpj.Value :=
        tirapontos(DadosSped.qrParticipantesCNPJ.Value);
      Dados.qrySped_Participanteie.Value :=
        tirapontos(DadosSped.qrParticipantesIE.Value);
    end
    else
    begin
      Dados.qrySped_Participantecpf.Value :=
        tirapontos(DadosSped.qrParticipantesCNPJ.Value);
    end;
    Dados.qrySped_Participantecod_pais.Value := '1058';
    if (DadosSped.qrParticipantesCODMUN.AsInteger > 0) then
      Dados.qrySped_Participantecod_mun.Value :=
        DadosSped.qrParticipantesCODMUN.Value
    else
      Dados.qrySped_Participantecod_mun.Value :=
        Dados.qryEmpresaID_CIDADE.Value;

    Dados.qrySped_Participanteendereco.Value :=
      DadosSped.qrParticipantesENDERECO.Value;

    if Dados.qrySped_Participanteendereco.AsString = '' then
      Dados.qrySped_Participanteendereco.Value := 'SEM ENDEREÇO';

    Dados.qrySped_Participantenumero.Value :=
      DadosSped.qrParticipantesNUMERO.Value;
    Dados.qrySped_Participantecomplemento.Value := '';
    Dados.qrySped_Participantebairro.Value :=
      DadosSped.qrParticipantesBAIRRO.Value;

    Dados.qrySped_ParticipanteFK_EMPRESA.Value := Empresa;

    Dados.qrySped_ParticipanteFK_USUARIO.Value := Dados.idUsuario;

    Dados.qrySped_Participante.Post;
    Dados.Conexao.CommitRetaining;
    DadosSped.qrParticipantes.Next;
  end;

end;

procedure TDadosSped.ImportaInventario(dtini, dtfim: Tdate; Empresa: Integer);
var
  TTotal: Extended;
begin
  TTotal := 0;
  DadosSped.qryInventario.Close;
  DadosSped.qryInventario.Params[0].AsDate := (StartOfTheYear(dtini) - 1);
  DadosSped.qryInventario.Open;

  DadosSped.qryInventario.Last;
  DadosSped.qryInventario.First;

  if not DadosSped.qryInventario.IsEmpty then
  begin

    Dados.qrySped_H005.Close;
    Dados.qrySped_H005.Params[0].Value := CodSped;
    Dados.qrySped_H005.Open;

    Dados.qrySped_H005.Insert;
    Dados.qrySped_H005CODIGO.Value := Dados.Numerador('SPED_H005', 'CODIGO',
      'N', '', '');
    Dados.qrySped_H005DT_INV.Value := (StartOfTheYear(dtini) - 1);

    Dados.qrySped_H005VL_INV.Value := 0;
    Dados.qrySped_H005FK_SPED.Value := CodSped;
    Dados.qrySped_H005FK_EMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
    Dados.qrySped_H005FK_USUARIO.Value := Dados.idUsuario;
    Dados.qrySped_H005.Post;
    Dados.Conexao.CommitRetaining;

    Dados.qrySped_H010.Close;
    Dados.qrySped_H010.Params[0].Value := Dados.qrySped_H005CODIGO.Value;
    Dados.qrySped_H010.Open;

    while not DadosSped.qryInventario.Eof do
    begin
      Dados.qrySped_H010.Insert;
      Dados.qrySped_H010CODIGO.Value := Dados.Numerador('SPED_H010', 'CODIGO',
        'N', '', '');;
      Dados.qrySped_H010QTD.Value := qryInventarioSALDO.AsFloat;
      Dados.qrySped_H010VL_UNIT.Value :=
        SimpleRoundTo(qryInventarioPR_CUSTO.AsFloat, -2);
      Dados.qrySped_H010VL_ITEM.Value :=
        SimpleRoundTo(qryInventarioTOTAL.AsFloat, -2);
      Dados.qrySped_H010IND_PROP.Value := '0';
      Dados.qrySped_H010FK_H005.Value := Dados.qrySped_H005CODIGO.Value;
      Dados.qrySped_H010FK_PRODUTO.Value := qryInventarioFK_PRODUTO.Value;
      Dados.qrySped_H010FK_EMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      Dados.qrySped_H010FK_USUARIO.Value := Dados.idUsuario;
      Dados.qrySped_H010.Post;
      Dados.Conexao.CommitRetaining;
      TTotal := TTotal + Dados.qrySped_H010VL_ITEM.AsFloat;
      DadosSped.qryInventario.Next;
    end;

    Dados.qrySped_H005.Edit;
    Dados.qrySped_H005VL_INV.Value := TTotal;
    Dados.qrySped_H005.Post;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TDadosSped.ImportaUNidade(dtini, dtfim: Tdate; Empresa: Integer);
begin
  DadosSped.qrUnidades.Close;
  DadosSped.qrUnidades.Params[0].AsDate := dtini;
  DadosSped.qrUnidades.Params[1].AsDate := dtfim;
  DadosSped.qrUnidades.Params[2].Value := Empresa;
  DadosSped.qrUnidades.Open;

  DadosSped.qrUnidades.Last;
  DadosSped.qrUnidades.First;

  Dados.qrySped_Unidade.Close;
  Dados.qrySped_Unidade.Open;

  while not DadosSped.qrUnidades.Eof do
  begin

    if DadosSped.qrUnidadesABREVIATURA.AsString <> '' then
    begin
      Dados.qrySped_Unidade.Insert;
      Dados.qrySped_Unidadefk_sped.Value := CodSped;
      Dados.qrySped_UnidadeCODIGO.Value := Dados.Numerador('SPED_UNIDADE',
        'CODIGO', 'N', '', '');
      Dados.qrySped_Unidadeunidade.Value :=
        DadosSped.qrUnidadesABREVIATURA.Value;
      Dados.qrySped_Unidadedescricao.Value :=
        DadosSped.qrUnidadesABREVIATURA.Value + '-' +
        DadosSped.qrUnidadesDESCRICAO.AsString;
      Dados.qrySped_UnidadeFK_EMPRESA.Value := Empresa;
      Dados.qrySped_UnidadeFK_USUARIO.Value := Dados.idUsuario;
      Dados.qrySped_Unidade.Post;
      Dados.Conexao.CommitRetaining;
    end;
    DadosSped.qrUnidades.Next;
  end;

end;

procedure TDadosSped.qryInventarioCalcFields(DataSet: TDataSet);
begin
  qryInventarioTOTAL.AsFloat := qryInventarioSALDO.AsFloat *
    qryInventarioPR_CUSTO.AsFloat;
end;

procedure TDadosSped.ImportaProduto(dtini, dtfim: Tdate; Empresa: Integer;
  Tela: String);
var
  cod: Integer;
begin

  if Tela = 'P' then
  begin
    qrProdutos.Close;
    qrProdutos.SQL.Clear;
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(COD_PROD) COD_PROD,');
    qrProdutos.SQL.add('DESCRICAO,');
    qrProdutos.SQL.add('CODBARRA AS GTIN,');
    qrProdutos.SQL.add('CODIGO AS ABREVIATURA,');
    qrProdutos.SQL.add('TIPO AS TIPO_ITEM,');
    qrProdutos.SQL.add('NCM');
    qrProdutos.SQL.add('FROM(');
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(PROD.codigo)AS COD_PROD,');
    qrProdutos.SQL.add('PROD.descricao,');
    qrProdutos.SQL.add('PROD.codbarra,');
    qrProdutos.SQL.add('UND.codigo,');
    qrProdutos.SQL.add('PROD.tipo,');
    qrProdutos.SQL.add('PROD.ncm');
    qrProdutos.SQL.add('from  compra_itens ITECO');
    qrProdutos.SQL.add('left JOIN compra PEDICO on ITECO.fk_compra=PEDICO.id');
    qrProdutos.SQL.add
      ('left JOIN produto PROD on ITECO.fk_produto=PROD.codigo');
    qrProdutos.SQL.add('left JOIN unidade UND on PROD.unidade= UND.codigo');
    qrProdutos.SQL.add('where');
    qrProdutos.SQL.add('PEDICO.dtentrada between :data1 and :data2 and');
    qrProdutos.SQL.add('PEDICO.STATUS=''F'' and');
    qrProdutos.SQL.add('PEDICO.empresa=:EMPRESA');
    qrProdutos.SQL.add('union all');
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(PROD.codigo)AS COD_PROD,');
    qrProdutos.SQL.add('PROD.descricao,');
    qrProdutos.SQL.add('PROD.codbarra,');
    qrProdutos.SQL.add('UND.codigo,');
    qrProdutos.SQL.add('PROD.tipo,');
    qrProdutos.SQL.add('PROD.ncm');
    qrProdutos.SQL.add('from  nfe_detalhe NFD');
    qrProdutos.SQL.add('left JOIN nfe_master NFM  on NFD.fknfe=NFM.codigo');
    qrProdutos.SQL.add('left JOIN produto PROD on NFD.id_produto=PROD.codigo');
    qrProdutos.SQL.add('left JOIN unidade UND on PROD.unidade= UND.codigo');
    qrProdutos.SQL.add('where');
    qrProdutos.SQL.add('NFM.data_emissao between :data1 and :data2 and');
    qrProdutos.SQL.add('NFM.situacao in (''2'') and');
    qrProdutos.SQL.add('NFM.id_emitente=:EMPRESA');
    qrProdutos.SQL.add('');
    qrProdutos.SQL.add('union all');
    qrProdutos.SQL.add('');
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(PROD.codigo)AS COD_PROD,');
    qrProdutos.SQL.add('PROD.descricao,');
    qrProdutos.SQL.add('PROD.codbarra,');
    qrProdutos.SQL.add('UND.codigo,');
    qrProdutos.SQL.add('PROD.tipo,');
    qrProdutos.SQL.add('PROD.ncm');
    qrProdutos.SQL.add('from  nfce_detalhe NFCD');
    qrProdutos.SQL.add
      ('left JOIN nfce_master NFCM  on NFCD.fkvenda=NFCM.codigo');
    qrProdutos.SQL.add('left JOIN produto PROD on NFCD.id_produto=PROD.codigo');
    qrProdutos.SQL.add('left JOIN unidade UND on PROD.unidade= UND.codigo');
    qrProdutos.SQL.add('where');
    qrProdutos.SQL.add('NFCM.data_emissao between :data1 and :data2 and');
    qrProdutos.SQL.add('NFCM.situacao in (''T'') and');
    qrProdutos.SQL.add('NFCM.id_emitente=:EMPRESA');
    qrProdutos.SQL.add('union all');
    qrProdutos.SQL.add('');
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(PROD.codigo)AS COD_PROD,');
    qrProdutos.SQL.add('PROD.descricao,');
    qrProdutos.SQL.add('PROD.codbarra,');
    qrProdutos.SQL.add('UND.codigo,');
    qrProdutos.SQL.add('PROD.tipo,');
    qrProdutos.SQL.add('PROD.ncm');
    qrProdutos.SQL.add('from  compra_itens ci');
    qrProdutos.SQL.add('left JOIN compra co  on ci.fk_compra=co.id');
    qrProdutos.SQL.add('left JOIN produto PROD on CI.fk_produto=PROD.codigo');
    qrProdutos.SQL.add('left JOIN unidade UND on PROD.unidade= UND.codigo');
    qrProdutos.SQL.add('where');
    qrProdutos.SQL.add('co.dtentrada between :data1 and :data2 and');
    qrProdutos.SQL.add('co.status in (''F'') and');
    qrProdutos.SQL.add('CO.empresa=:EMPRESA');
    qrProdutos.SQL.add(')');
    qrProdutos.SQL.add('');

    DadosSped.qrProdutos.Params[0].AsDate := dtini;
    DadosSped.qrProdutos.Params[1].AsDate := dtfim;
    DadosSped.qrProdutos.Params[2].Value := Empresa;
    DadosSped.qrProdutos.Open;
  end
  else
  begin
    qrProdutos.Close;
    qrProdutos.SQL.Clear;
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(COD_PROD) COD_PROD,');
    qrProdutos.SQL.add('DESCRICAO,');
    qrProdutos.SQL.add('CODBARRA AS GTIN,');
    qrProdutos.SQL.add('CODIGO AS ABREVIATURA,');
    qrProdutos.SQL.add('TIPO AS TIPO_ITEM,');
    qrProdutos.SQL.add('NCM');
    qrProdutos.SQL.add('FROM(');
    qrProdutos.SQL.add('select');
    qrProdutos.SQL.add('DISTINCT(PROD.codigo)AS COD_PROD,');
    qrProdutos.SQL.add('PROD.descricao,');
    qrProdutos.SQL.add('PROD.codbarra,');
    qrProdutos.SQL.add('UND.codigo,');
    qrProdutos.SQL.add('PROD.tipo,');
    qrProdutos.SQL.add('PROD.ncm');
    qrProdutos.SQL.add('from  compra_itens ITECO');
    qrProdutos.SQL.add('left JOIN compra PEDICO on ITECO.fk_compra=PEDICO.id');
    qrProdutos.SQL.add
      ('left JOIN produto PROD on ITECO.fk_produto=PROD.codigo');
    qrProdutos.SQL.add('left JOIN unidade UND on PROD.unidade= UND.codigo');
    qrProdutos.SQL.add('where');
    qrProdutos.SQL.add('PEDICO.dtentrada between :data1 and :data2 and');
    qrProdutos.SQL.add('PEDICO.STATUS=''F'' and');
    qrProdutos.SQL.add('PEDICO.empresa=:EMPRESA');
    qrProdutos.SQL.add(')');
    qrProdutos.SQL.add('');

    qrProdutos.Params[0].AsDate := dtini;
    qrProdutos.Params[1].AsDate := dtfim;
    qrProdutos.Params[2].Value := Empresa;
    qrProdutos.Open;
  end;

  DadosSped.qryConsUnidade.Close;
  DadosSped.qryConsUnidade.Params[0].Value := CodSped;
  DadosSped.qryConsUnidade.Params[1].Value := Empresa;
  DadosSped.qryConsUnidade.Open;

  DadosSped.qrProdutos.First;

  Dados.qrySped_Produto.Close;
  Dados.qrySped_Produto.Open;

  while not DadosSped.qrProdutos.Eof do
  begin
    if not Dados.qrySped_Produto.Locate('fk_produto',
      DadosSped.qrProdutosCOD_PROD.AsInteger, []) then
    begin
      Dados.qrySped_Produto.Insert;
      Dados.qrySped_ProdutoCODIGO.Value := Dados.Numerador('SPED_PRODUTOS',
        'CODIGO', 'N', '', '');
      Dados.qrySped_Produtofk_sped.Value := CodSped;
      Dados.qrySped_ProdutoFK_PRODUTO.Value :=
        DadosSped.qrProdutosCOD_PROD.AsInteger;

      if DadosSped.qryConsUnidade.Locate('unidade',
        DadosSped.qrProdutosABREVIATURA.Value, []) then
        Dados.qrySped_ProdutoFK_UNIDADE.Value :=
          DadosSped.qryConsUnidadeCODIGO.Value
      else
      begin
        DadosSped.qryConsUnidade.First;
        Dados.qrySped_ProdutoFK_UNIDADE.Value :=
          DadosSped.qryConsUnidadeCODIGO.AsInteger;
      end;

      Dados.qrySped_Produtodescricao.Value :=
        DadosSped.qrProdutosDESCRICAO.Value;
      Dados.qrySped_Produtocod_barra.Value := DadosSped.qrProdutosGTIN.Value;
      Dados.qrySped_Produtotipo_item.Value :=
        copy(DadosSped.qrProdutosTIPO_ITEM.Value, 1, 2);
      Dados.qrySped_Produtocod_ncm.Value := DadosSped.qrProdutosNCM.Value;
      Dados.qrySped_ProdutoALIQ_ICMS.Value := 0;
      Dados.qrySped_ProdutoFK_EMPRESA.Value := Empresa;
      Dados.qrySped_ProdutoFK_USUARIO.Value := Dados.idUsuario;
      Dados.qrySped_Produto.Post;
      Dados.Conexao.CommitRetaining;
    end;
    DadosSped.qrProdutos.Next;
  end;
end;

procedure TDadosSped.ImportaEntradaCompra(dtini, dtfim: Tdate;
  Empresa: Integer);
var
  codigo: Integer;
  vPercentualST: Extended;
  vValorST: Extended;
  vPercentualFCP: Extended;
  vNF: Extended;
  VFCP: Extended;
  vOutros: Extended;
begin
  // filtra compras
  DadosSped.qryCompra.Close;
  DadosSped.qryCompra.Params[0].AsDate := dtini;
  DadosSped.qryCompra.Params[1].AsDate := dtfim;
  DadosSped.qryCompra.Params[2].Value := Empresa;
  DadosSped.qryCompra.Open;

  Dados.qrySped_C100.Close;
  Dados.qrySped_C100.Open;

  Dados.qrySped_C170.Close;
  Dados.qrySped_C170.Open;

  while not DadosSped.qryCompra.Eof do // percore todas as compras
  begin
    vPercentualST := 0;
    vPercentualFCP := 0;
    vNF := DadosSped.qryCompraSUBTOTAL.AsFloat +
      DadosSped.qryCompraFRETE.AsFloat + DadosSped.qryCompraSEGURO.AsFloat +
      DadosSped.qryCompraDESPESAS.AsFloat - DadosSped.qryCompraDESCONTO.AsFloat
      + DadosSped.qryCompraTOTAL_IPI.AsFloat +
      DadosSped.qryCompraTOTAL_ST.AsFloat;

    VFCP := DadosSped.qryCompraTOTAL.AsFloat - vNF;

    if DadosSped.qryCompraBASE_ST.AsFloat > 0 then
      vPercentualFCP := VFCP / DadosSped.qryCompraBASE_ICM.AsFloat;

    if DadosSped.qryCompraBASE_ST.AsFloat > 0 then
      vPercentualST := DadosSped.qryCompraTOTAL_ST.AsFloat /
        DadosSped.qryCompraBASE_ST.AsFloat;

    Dados.qrySped_C100.Insert;
    // insere na tabela do sped registro c100 as compras
    Dados.qrySped_C100fk_sped.Value := CodSped;
    Dados.qrySped_C100CODIGO.Value := Dados.Numerador('SPED_C100', 'CODIGO',
      'N', '', '');
    Dados.qrySped_C100FK_PARTICIPANTES.AsFloat :=
      DadosSped.qryCompraID_FORNECEDOR.AsFloat;
    Dados.qrySped_C100ind_oper.Value := '0'; // operação de entrada
    Dados.qrySped_C100ind_emit.Value := DadosSped.qryCompraTPEMISSAO.Value;
    Dados.qrySped_C100cod_mod.Value := DadosSped.qryCompraMODELO.Value;
    if (DadosSped.qryCompraSTATUS.Value = 'F') or
      (DadosSped.qryCompraSTATUS.Value = '2') then
      Dados.qrySped_C100cod_sit.Value := '00'; // Documento regular
    if (DadosSped.qryCompraSTATUS.Value = 'C') or
      (DadosSped.qryCompraSTATUS.Value = '3') then
      Dados.qrySped_C100cod_sit.Value := '02'; // Documento cancelado
    if (DadosSped.qryCompraSTATUS.Value = '6') then
      Dados.qrySped_C100cod_sit.Value := '04'; // Documento Denegado
    Dados.qrySped_C100ser.Value := DadosSped.qryCompraSERIE.Value;

    Dados.qrySped_C100num_doc.Value := DadosSped.qryCompraNR_NOTA.AsInteger;
    Dados.qrySped_C100chv_nfe.Value := DadosSped.qryCompraCHAVE.Value;
    Dados.qrySped_C100dt_doc.Value := DadosSped.qryCompraDTEMISSAO.Value;
    Dados.qrySped_C100dt_e_s.Value := DadosSped.qryCompraDTENTRADA.Value;
    Dados.qrySped_C100vl_doc.AsFloat := DadosSped.qryCompraTOTAL.AsFloat;
    Dados.qrySped_C100ind_pgto.Value := '9';
    Dados.qrySped_C100vl_desc.AsFloat := DadosSped.qryCompraDESCONTO.AsFloat;
    Dados.qrySped_C100vl_merc.AsFloat := DadosSped.qryCompraSUBTOTAL.AsFloat;
    Dados.qrySped_C100ind_frt.Value := 2;
    Dados.qrySped_C100vl_seguro.AsFloat := DadosSped.qryCompraSEGURO.AsFloat;
    Dados.qrySped_C100vl_out_da.AsFloat :=
      DadosSped.qryCompraDESPESAS.AsFloat + VFCP;
    Dados.qrySped_C100vl_frete.AsFloat := DadosSped.qryCompraFRETE.AsFloat;
    Dados.qrySped_C100vl_bc_icms.AsFloat := DadosSped.qryCompraBASE_ICM.AsFloat;
    Dados.qrySped_C100vl_icms.AsFloat := DadosSped.qryCompraTOTAL_ICM.AsFloat;
    Dados.qrySped_C100vl_bc_icms_st.AsFloat :=
      DadosSped.qryCompraBASE_ST.AsFloat;
    Dados.qrySped_C100vl_icms_st.AsFloat := DadosSped.qryCompraTOTAL_ST.AsFloat;
    Dados.qrySped_C100vl_ipi.AsFloat := DadosSped.qryCompraTOTAL_IPI.AsFloat;
    Dados.qrySped_C100vl_pis.AsFloat := DadosSped.qryCompraTOTAL_PIS.AsFloat;
    Dados.qrySped_C100vl_cofins.AsFloat := DadosSped.qryCompraTOTAL_COF.AsFloat;
    Dados.qrySped_C100.Post;
    Dados.Conexao.CommitRetaining;

    DadosSped.qryItensC.Close; // abre os itens da compra
    DadosSped.qryItensC.Params[0].Value := DadosSped.qryCompraID.Value;
    DadosSped.qryItensC.Open;

    DadosSped.qryItensC.First;

    while not DadosSped.qryItensC.Eof do
    begin // percorre os itens da compra

      if (DadosSped.qryCompraSTATUS.Value = 'F') then
      begin

        Dados.qrySped_C170.Insert; // insere itens da venda no registro c170
        Dados.qrySped_C170CODIGO.Value := Dados.Numerador('SPED_C170', 'CODIGO',
          'N', '', '');
        Dados.qrySped_C170FK_C100.Value := Dados.qrySped_C100CODIGO.Value;
        DadosSped.qryConsUnidade.Locate('unidade',
          DadosSped.qryItensCUNIDADE.Value, []);
        Dados.qrySped_C170fk_unidade.Value :=
          DadosSped.qryConsUnidadeCODIGO.Value;
        Dados.qrySped_C170FK_PRODUTO.Value :=
          DadosSped.qryItensCFK_PRODUTO.AsInteger;
        Dados.qrySped_C170descricao.Value := DadosSped.qryItensCDESCRICAO.Value;
        Dados.qrySped_C170qtd.AsFloat := DadosSped.qryItensCQTD.AsFloat;
        Dados.qrySped_C170vl_item.AsFloat := DadosSped.qryItensCVL_ITEM.AsFloat;
        Dados.qrySped_C170vl_desc.AsFloat :=
          DadosSped.qryItensCDESCONTO.AsFloat;
        Dados.qrySped_C170ind_mov.Value := '0';
        Dados.qrySped_C170cst_icms.Value := DadosSped.qryItensCCST_ICM.Value;
        Dados.qrySped_C170cfop.Value := DadosSped.qryItensCCFOP.Value;
        Dados.qrySped_C170vl_bc_icms.Value :=
          DadosSped.qryItensCBASE_ICMS.AsFloat;
        Dados.qrySped_C170aliq_icm.AsFloat :=
          DadosSped.qryItensCALIQ_ICMS.AsFloat;
        Dados.qrySped_C170vl_icms.Value := DadosSped.qryItensCVL_ICMS.AsFloat;
        Dados.qrySped_C170vl_bc_icms_st.AsFloat :=
          DadosSped.qryItensCBASE_ST.AsFloat;
        Dados.qrySped_C170aliq_st.AsFloat := DadosSped.qryItensCALIQ_ST.AsFloat;

        if DadosSped.qryItensCVL_ST.AsFloat > 0 then
          Dados.qrySped_C170vl_icms_st.AsFloat :=
            DadosSped.qryItensCVL_ST.AsFloat
        else
          Dados.qrySped_C170vl_icms_st.AsFloat :=
            (DadosSped.qryItensCBASE_ST.AsFloat * vPercentualST);

        Dados.qrySped_C170cst_ipi.Value := DadosSped.qryItensCCST_IPI.Value;
        Dados.qrySped_C170vl_bc_ipi.AsFloat :=
          DadosSped.qryItensCBASE_IPI.AsFloat;
        Dados.qrySped_C170aliq_ipi.AsFloat :=
          DadosSped.qryItensCALIQ_IPI.AsFloat;
        Dados.qrySped_C170vl_ipi.AsFloat := DadosSped.qryItensCVL_IPI.AsFloat;
        Dados.qrySped_C170vl_bc_pis.AsFloat :=
          DadosSped.qryItensCBASE_PIS.AsFloat;
        Dados.qrySped_C170aliq_pis_perc.AsFloat :=
          DadosSped.qryItensCALIQ_PIS.AsFloat;

        Dados.qrySped_C170vl_pis.AsFloat := DadosSped.qryItensCVL_PIS.AsFloat;
        Dados.qrySped_C170CST_PIS.Value := DadosSped.qryItensCCST_COF.Value;
        if (DadosSped.qryItensCCST_PIS.Value = '01') then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '02' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '03' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '04' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '05' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '06' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '50';
          Dados.qrySped_C170CST_COFINS.Value := '50';
        end;

        if DadosSped.qryItensCCST_PIS.Value = '07' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '71';
          Dados.qrySped_C170CST_COFINS.Value := '71';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '08' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '74';
          Dados.qrySped_C170CST_COFINS.Value := '74';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '09' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '72';
          Dados.qrySped_C170CST_COFINS.Value := '72';
        end;
        if DadosSped.qryItensCCST_PIS.Value = '49' then
        begin
          Dados.qrySped_C170CST_PIS.Value := '99';
          Dados.qrySped_C170CST_COFINS.Value := '99';
        end;

        Dados.qrySped_C170vl_bc_cofins.AsFloat :=
          DadosSped.qryItensCBASE_COF.AsFloat;
        Dados.qrySped_C170aliq_cofins_perc.AsFloat :=
          DadosSped.qryItensCALIQ_COF.AsFloat;
        Dados.qrySped_C170vl_cofins.AsFloat :=
          DadosSped.qryItensCVL_COF.AsFloat;

        if dados.qrySped_C170vl_bc_icms_st.AsFloat > 0 then
          vOutros := Dados.qrySped_C170vl_bc_icms.AsFloat * vPercentualFCP;

        Dados.qrySped_C170vl_opr.AsFloat := DadosSped.qryItensCVL_ITEM.AsFloat +
          DadosSped.qryItensCVL_IPI.AsFloat + DadosSped.qryItensCSEGURO.AsFloat
          + DadosSped.qryItensCDESPESA.AsFloat +
          DadosSped.qryItensCFRETE1.AsFloat + DadosSped.qryItensCVL_ST.AsFloat -
          DadosSped.qryItensCDESCONTO.AsFloat + vOutros;

        Dados.qrySped_C170.Post;
        Dados.Conexao.CommitRetaining;
      end;
      DadosSped.qryItensC.Next;
    end;
    DadosSped.qryCompra.Next;
  end;
end;

procedure TDadosSped.ImportaEntradaNFe(dtini, dtfim: Tdate; Empresa: Integer);
begin
  // filtra compras
  DadosSped.qryNFe_E.Close;
  DadosSped.qryNFe_E.Params[0].AsDate := dtini;
  DadosSped.qryNFe_E.Params[1].AsDate := dtfim;
  DadosSped.qryNFe_E.Params[2].Value := Empresa;
  DadosSped.qryNFe_E.Open;

  Dados.qrySped_C100.Close;
  Dados.qrySped_C100.Open;

  Dados.qrySped_C170.Close;
  Dados.qrySped_C170.Open;

  while not DadosSped.qryNFe_E.Eof do // percore todas as compras
  begin
    Dados.qrySped_C100.Insert;
    // insere na tabela do sped registro c100 as compras
    Dados.qrySped_C100fk_sped.Value := CodSped;
    Dados.qrySped_C100CODIGO.Value := Dados.Numerador('SPED_C100', 'CODIGO',
      'N', '', '');
    Dados.qrySped_C100FK_PARTICIPANTES.AsFloat :=
      DadosSped.qryNFe_EID_FORNECEDOR.AsFloat;
    Dados.qrySped_C100ind_oper.Value := '0'; // operação de entrada
    Dados.qrySped_C100ind_emit.Value := DadosSped.qryNFe_ETPEMISSAO.Value;
    Dados.qrySped_C100cod_mod.Value := '55';
    if (DadosSped.qryNFe_ESTATUS.Value = '2') then
      Dados.qrySped_C100cod_sit.Value := '00'; // Documento regular
    if (DadosSped.qryNFe_ESTATUS.Value = '3') then
      Dados.qrySped_C100cod_sit.Value := '02'; // Documento cancelado
    if (DadosSped.qryNFe_ESTATUS.Value = '6') then
      Dados.qrySped_C100cod_sit.Value := '04'; // Documento Denegado
    Dados.qrySped_C100ser.Value := DadosSped.qryNFe_ESERIE.Value;
    Dados.qrySped_C100num_doc.Value := DadosSped.qryNFe_ENUMERO.AsInteger;
    Dados.qrySped_C100chv_nfe.Value := DadosSped.qryNFe_ECHAVE.Value;
    Dados.qrySped_C100dt_doc.Value := DadosSped.qryNFe_EDATA_EMISSAO.Value;
    Dados.qrySped_C100dt_e_s.Value := DadosSped.qryNFe_EDATA_EMISSAO.Value;
    Dados.qrySped_C100vl_doc.Value := DadosSped.qryNFe_ETOTAL.AsFloat;
    Dados.qrySped_C100ind_pgto.Value := '9';
    Dados.qrySped_C100vl_desc.Value := DadosSped.qryNFe_EDESCONTO.AsFloat;
    Dados.qrySped_C100vl_merc.Value := DadosSped.qryNFe_ESUBTOTAL.AsFloat;
    Dados.qrySped_C100ind_frt.Value := 9;
    Dados.qrySped_C100vl_seguro.Value := DadosSped.qryNFe_ESEGURO.AsFloat;
    Dados.qrySped_C100vl_out_da.Value := DadosSped.qryNFe_EDESPESAS.AsFloat;
    Dados.qrySped_C100vl_frete.Value := DadosSped.qryNFe_EFRETE.AsFloat;
    Dados.qrySped_C100vl_bc_icms.Value := DadosSped.qryNFe_EBASEICMS.AsFloat;
    Dados.qrySped_C100vl_icms.Value := DadosSped.qryNFe_ETOTALICMS.AsFloat;
    Dados.qrySped_C100vl_bc_icms_st.Value := DadosSped.qryNFe_EBASE_ST.AsFloat;
    Dados.qrySped_C100vl_icms_st.Value := DadosSped.qryNFe_ETOTAL_ST.AsFloat;
    Dados.qrySped_C100vl_ipi.Value := DadosSped.qryNFe_ETOTAL_IPI.AsFloat;
    Dados.qrySped_C100vl_pis.Value := DadosSped.qryNFe_ETOTALICMSPIS.AsFloat;
    Dados.qrySped_C100vl_cofins.Value :=
      DadosSped.qryNFe_ETOTALICMSCOFINS.AsFloat;
    Dados.qrySped_C100.Post;
    Dados.Conexao.CommitRetaining;

    DadosSped.qryItens_NFe_E.Close; // abre os itens da nfe de entrada
    DadosSped.qryItens_NFe_E.Params[0].Value :=
      DadosSped.qryNFe_EID_PEDIDOCOMPRA.Value;
    DadosSped.qryItens_NFe_E.Open;

    DadosSped.qryItens_NFe_E.First;

    while not DadosSped.qryItens_NFe_E.Eof do
    begin // percorre os itens da compra

      Dados.qrySped_C170.Insert; // insere itens da venda no registro c170
      Dados.qrySped_C170CODIGO.Value := Dados.Numerador('SPED_C170', 'CODIGO',
        'N', '', '');
      Dados.qrySped_C170FK_C100.Value := Dados.qrySped_C100CODIGO.Value;
      DadosSped.qryConsUnidade.Locate('unidade',
        DadosSped.qryItens_NFe_EUNIDADE.Value, []);
      Dados.qrySped_C170fk_unidade.Value :=
        DadosSped.qryConsUnidadeCODIGO.Value;
      Dados.qrySped_C170FK_PRODUTO.Value :=
        DadosSped.qryItens_NFe_EID_PRODUTO.AsInteger;
      Dados.qrySped_C170descricao.Value :=
        DadosSped.qryItens_NFe_EDESCRICAO.Value;
      Dados.qrySped_C170qtd.Value := DadosSped.qryItens_NFe_EQTD.AsFloat;
      Dados.qrySped_C170vl_item.Value := DadosSped.qryItens_NFe_ETOTAL.AsFloat;
      Dados.qrySped_C170vl_desc.Value :=
        DadosSped.qryItens_NFe_EDESCONTO.AsFloat;
      Dados.qrySped_C170ind_mov.Value := '0';
      Dados.qrySped_C170cst_icms.Value := DadosSped.qryItens_NFe_ECST.Value;
      Dados.qrySped_C170cfop.Value := DadosSped.qryItens_NFe_ECFOP.Value;
      Dados.qrySped_C170vl_bc_icms.Value :=
        DadosSped.qryItens_NFe_EBASE_ICMS.AsFloat;
      Dados.qrySped_C170aliq_icm.Value :=
        DadosSped.qryItens_NFe_EALIQ_ICMS.AsFloat;
      Dados.qrySped_C170vl_icms.Value :=
        DadosSped.qryItens_NFe_EVALOR_ICMS.AsFloat;
      Dados.qrySped_C170vl_bc_icms_st.Value :=
        DadosSped.qryItens_NFe_EBASE_ICMS_ST.AsFloat;
      Dados.qrySped_C170aliq_st.Value :=
        DadosSped.qryItens_NFe_EALIQ_ICMS_ST.AsFloat;
      Dados.qrySped_C170vl_icms_st.Value :=
        DadosSped.qryItens_NFe_EVALOR_ICMS_ST.AsFloat;
      Dados.qrySped_C170cst_ipi.Value := DadosSped.qryItens_NFe_ECST_IPI.Value;
      Dados.qrySped_C170vl_bc_ipi.Value :=
        DadosSped.qryItens_NFe_EBASE_IPI.AsFloat;
      Dados.qrySped_C170aliq_ipi.Value :=
        DadosSped.qryItens_NFe_EALIQ_IPI.AsFloat;
      Dados.qrySped_C170vl_ipi.Value :=
        DadosSped.qryItens_NFe_EVALOR_IPI.AsFloat;
      Dados.qrySped_C170vl_bc_pis.Value :=
        DadosSped.qryItens_NFe_EBASE_PIS_ICMS.AsFloat;
      Dados.qrySped_C170aliq_pis_perc.Value :=
        DadosSped.qryItens_NFe_EALIQ_PIS_ICMS.AsFloat;
      Dados.qrySped_C170vl_pis.Value :=
        DadosSped.qryItens_NFe_EVALOR_PIS_ICMS.AsFloat;
      Dados.qrySped_C170CST_PIS.Value :=
        DadosSped.qryItens_NFe_ECST_COFINS.Value;
      if (DadosSped.qryItens_NFe_ECST_PIS.Value = '01') then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '02' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '03' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '04' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '05' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '06' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;

      if DadosSped.qryItens_NFe_ECST_PIS.Value = '07' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '71';
        Dados.qrySped_C170CST_COFINS.Value := '71';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '08' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '74';
        Dados.qrySped_C170CST_COFINS.Value := '74';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '09' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '72';
        Dados.qrySped_C170CST_COFINS.Value := '72';
      end;
      if DadosSped.qryItens_NFe_ECST_PIS.Value = '49' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '99';
        Dados.qrySped_C170CST_COFINS.Value := '99';
      end;

      Dados.qrySped_C170vl_bc_cofins.Value :=
        DadosSped.qryItens_NFe_EBASE_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170aliq_cofins_perc.Value :=
        DadosSped.qryItens_NFe_EALIQ_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170vl_cofins.Value :=
        DadosSped.qryItens_NFe_EVALOR_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170vl_opr.Value := DadosSped.qryItens_NFe_ETOTAL.AsFloat +
        DadosSped.qryItens_NFe_EVALOR_IPI.AsFloat +
        DadosSped.qryItens_NFe_ESEGURO.AsFloat +
        DadosSped.qryItens_NFe_EDESPESAS.AsFloat +
        DadosSped.qryItens_NFe_EFRETE.AsFloat +
        DadosSped.qryItens_NFe_EVALOR_ICMS_ST.AsFloat -
        DadosSped.qryItens_NFe_EDESCONTO.AsFloat;
      Dados.qrySped_C170.Post;
      Dados.Conexao.CommitRetaining;

      DadosSped.qryItens_NFe_E.Next;
    end;
    DadosSped.qryNFe_E.Next;
  end;

end;

procedure TDadosSped.ImportaSaidaNCFe(dtini, dtfim: Tdate; Empresa: Integer);
begin
  // filtra compras
  DadosSped.qryNFCE_S.Close;
  DadosSped.qryNFCE_S.Params[0].AsDate := dtini;
  DadosSped.qryNFCE_S.Params[1].AsDate := dtfim;
  DadosSped.qryNFCE_S.Params[2].Value := Empresa;
  DadosSped.qryNFCE_S.Open;

  Dados.qrySped_C100.Close;
  Dados.qrySped_C100.Open;

  Dados.qrySped_C170.Close;
  Dados.qrySped_C170.Open;

  while not DadosSped.qryNFCE_S.Eof do // percore todas as compras
  begin
    Dados.qrySped_C100.Insert;
    // insere na tabela do sped registro c100 as compras
    Dados.qrySped_C100fk_sped.Value := CodSped;
    Dados.qrySped_C100CODIGO.Value := Dados.Numerador('SPED_C100', 'CODIGO',
      'N', '', '');
    Dados.qrySped_C100FK_PARTICIPANTES.AsFloat :=
      DadosSped.qryNFCE_SID_CLIENTE.AsFloat;
    Dados.qrySped_C100ind_oper.Value := '1'; // operação de saida
    Dados.qrySped_C100ind_emit.Value := '0';
    Dados.qrySped_C100cod_mod.Value := '65';
    if (DadosSped.qryNFCE_SSITUACAO.Value = 'T') then
      Dados.qrySped_C100cod_sit.Value := '00'; // Documento regular
    if (DadosSped.qryNFCE_SSITUACAO.Value = 'C') then
      Dados.qrySped_C100cod_sit.Value := '02'; // Documento cancelado
    Dados.qrySped_C100ser.Value := DadosSped.qryNFCE_SSERIE.Value;
    Dados.qrySped_C100num_doc.Value := DadosSped.qryNFCE_SNUMERO.AsInteger;
    Dados.qrySped_C100chv_nfe.Value := DadosSped.qryNFCE_SCHAVE.Value;
    Dados.qrySped_C100dt_doc.Value := DadosSped.qryNFCE_SDATA_EMISSAO.Value;
    Dados.qrySped_C100dt_e_s.Value := DadosSped.qryNFCE_SDATA_EMISSAO.Value;
    Dados.qrySped_C100vl_doc.Value := DadosSped.qryNFCE_STOTAL.AsFloat;
    Dados.qrySped_C100ind_pgto.Value := '9';
    Dados.qrySped_C100vl_desc.Value := DadosSped.qryNFCE_SDESCONTO.AsFloat;
    Dados.qrySped_C100vl_merc.Value := DadosSped.qryNFCE_SSUBTOTAL.AsFloat;
    Dados.qrySped_C100ind_frt.Value := 9;
    Dados.qrySped_C100vl_seguro.Value := DadosSped.qryNFCE_SSEGURO.AsFloat;
    Dados.qrySped_C100vl_out_da.Value := DadosSped.qryNFCE_SDESPESAS.AsFloat;
    Dados.qrySped_C100vl_frete.Value := DadosSped.qryNFCE_SFRETE.AsFloat;
    Dados.qrySped_C100vl_bc_icms.Value := DadosSped.qryNFCE_SBASEICMS.AsFloat;
    Dados.qrySped_C100vl_icms.Value := DadosSped.qryNFCE_STOTALICMS.AsFloat;
    Dados.qrySped_C100vl_bc_icms_st.Value := DadosSped.qryNFCE_SBASE_ST.AsFloat;
    Dados.qrySped_C100vl_icms_st.Value := DadosSped.qryNFCE_STOTAL_ST.AsFloat;
    Dados.qrySped_C100vl_ipi.Value := DadosSped.qryNFCE_STOTAL_IPI.AsFloat;
    Dados.qrySped_C100vl_pis.Value := DadosSped.qryNFCE_STOTALICMSPIS.AsFloat;
    Dados.qrySped_C100vl_cofins.Value :=
      DadosSped.qryNFCE_STOTALICMSCOFINS.AsFloat;
    Dados.qrySped_C100.Post;
    Dados.Conexao.CommitRetaining;

    DadosSped.QryItens_NFCe_S.Close; // abre os itens da nfce
    DadosSped.QryItens_NFCe_S.Params[0].Value :=
      DadosSped.qryNFCE_SCODIGO.Value;
    DadosSped.QryItens_NFCe_S.Open;

    DadosSped.QryItens_NFCe_S.First;

    while not DadosSped.QryItens_NFCe_S.Eof do
    begin // percorre os itens da NFCe

      Dados.qrySped_C170.Insert; // insere itens da venda no registro c170
      Dados.qrySped_C170CODIGO.Value := Dados.Numerador('SPED_C170', 'CODIGO',
        'N', '', '');
      Dados.qrySped_C170FK_C100.Value := Dados.qrySped_C100CODIGO.Value;
      DadosSped.qryConsUnidade.Locate('unidade',
        DadosSped.QryItens_NFCe_SUNIDADE.Value, []);
      Dados.qrySped_C170fk_unidade.Value :=
        DadosSped.qryConsUnidadeCODIGO.Value;
      Dados.qrySped_C170FK_PRODUTO.Value :=
        DadosSped.QryItens_NFCe_SID_PRODUTO.AsInteger;
      Dados.qrySped_C170descricao.Value :=
        DadosSped.QryItens_NFCe_SDESCRICAO.Value;
      Dados.qrySped_C170qtd.Value :=
        DadosSped.QryItens_NFCe_SQUANTIDADE.AsFloat;
      Dados.qrySped_C170vl_item.Value := DadosSped.QryItens_NFCe_STOTAL.AsFloat;
      Dados.qrySped_C170vl_desc.Value :=
        DadosSped.QryItens_NFCe_SVDESCONTO.AsFloat;
      Dados.qrySped_C170ind_mov.Value := '0';
      Dados.qrySped_C170cst_icms.Value := DadosSped.QryItens_NFCe_SCST.Value;
      Dados.qrySped_C170cfop.Value := DadosSped.QryItens_NFCe_SCFOP.Value;
      Dados.qrySped_C170vl_bc_icms.Value :=
        DadosSped.QryItens_NFCe_SBASE_ICMS.AsFloat;
      Dados.qrySped_C170aliq_icm.Value :=
        DadosSped.QryItens_NFCe_SALIQ_ICMS.AsFloat;
      Dados.qrySped_C170vl_icms.Value :=
        DadosSped.QryItens_NFCe_SVALOR_ICMS.AsFloat;
      Dados.qrySped_C170vl_bc_icms_st.Value :=
        DadosSped.QryItens_NFCe_SBASE_ICMS_ST.AsFloat;
      Dados.qrySped_C170aliq_st.Value :=
        DadosSped.QryItens_NFCe_SALIQ_ICMS_ST.Value;
      Dados.qrySped_C170vl_icms_st.Value :=
        DadosSped.QryItens_NFCe_SVALOR_ICMS_ST.AsFloat;
      Dados.qrySped_C170cst_ipi.Value := DadosSped.QryItens_NFCe_SCST_IPI.Value;
      Dados.qrySped_C170vl_bc_ipi.Value :=
        DadosSped.QryItens_NFCe_SBASE_IPI.AsFloat;
      Dados.qrySped_C170aliq_ipi.Value :=
        DadosSped.QryItens_NFCe_SALIQ_IPI.Value;
      Dados.qrySped_C170vl_ipi.Value :=
        DadosSped.QryItens_NFCe_SVALOR_IPI.AsFloat;
      Dados.qrySped_C170vl_bc_pis.Value :=
        DadosSped.QryItens_NFCe_SBASE_PIS_ICMS.AsFloat;
      Dados.qrySped_C170aliq_pis_perc.Value :=
        DadosSped.QryItens_NFCe_SALIQ_PIS_ICMS.AsFloat;
      Dados.qrySped_C170vl_pis.Value :=
        DadosSped.QryItens_NFCe_SVALOR_PIS_ICMS.AsFloat;
      Dados.qrySped_C170CST_PIS.Value :=
        DadosSped.QryItens_NFCe_SCST_COFINS.Value;
      if (DadosSped.QryItens_NFCe_SCST_PIS.Value = '01') then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '02' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '03' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '04' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '05' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '06' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '50';
        Dados.qrySped_C170CST_COFINS.Value := '50';
      end;

      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '07' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '71';
        Dados.qrySped_C170CST_COFINS.Value := '71';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '08' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '74';
        Dados.qrySped_C170CST_COFINS.Value := '74';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '09' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '72';
        Dados.qrySped_C170CST_COFINS.Value := '72';
      end;
      if DadosSped.QryItens_NFCe_SCST_PIS.Value = '49' then
      begin
        Dados.qrySped_C170CST_PIS.Value := '99';
        Dados.qrySped_C170CST_COFINS.Value := '99';
      end;

      Dados.qrySped_C170vl_bc_cofins.Value :=
        DadosSped.QryItens_NFCe_SBASE_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170aliq_cofins_perc.Value :=
        DadosSped.QryItens_NFCe_SALIQ_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170vl_cofins.Value :=
        DadosSped.QryItens_NFCe_SVALOR_COFINS_ICMS.AsFloat;
      Dados.qrySped_C170vl_opr.Value := DadosSped.QryItens_NFCe_STOTAL.AsFloat +
        DadosSped.QryItens_NFCe_SVALOR_IPI.AsFloat +
        DadosSped.QryItens_NFCe_SSEGURO.AsFloat +
        DadosSped.QryItens_NFCe_SDESPESAS.AsFloat +
        DadosSped.QryItens_NFCe_SFRETE.AsFloat +
        DadosSped.QryItens_NFCe_SVALOR_ICMS_ST.AsFloat -
        DadosSped.QryItens_NFCe_SVDESCONTO.AsFloat;
      Dados.qrySped_C170.Post;
      Dados.Conexao.CommitRetaining;

      DadosSped.QryItens_NFCe_S.Next;
    end;
    DadosSped.qryNFCE_S.Next;
  end;
end;

procedure TDadosSped.ImportaSaidaNFe(dtini, dtfim: Tdate; Empresa: Integer);
begin
  // filtra compras
  DadosSped.qryNFE_S.Close;
  DadosSped.qryNFE_S.Params[0].AsDate := dtini;
  DadosSped.qryNFE_S.Params[1].AsDate := dtfim;
  DadosSped.qryNFE_S.Params[2].Value := Empresa;
  DadosSped.qryNFE_S.Open;

  Dados.qrySped_C100.Close;
  Dados.qrySped_C100.Open;

  Dados.qrySped_C170.Close;
  Dados.qrySped_C170.Open;

  while not DadosSped.qryNFE_S.Eof do // percote todas as nfe de saidas
  begin
    Dados.qrySped_C100.Insert; // insere na tabela do sped registro c100 as nfe
    Dados.qrySped_C100fk_sped.Value := CodSped;
    Dados.qrySped_C100CODIGO.Value := Dados.Numerador('SPED_C100', 'CODIGO',
      'N', '', '');
    Dados.qrySped_C100FK_PARTICIPANTES.AsFloat :=
      DadosSped.qryNFE_SID_CLIENTE.AsFloat;
    Dados.qrySped_C100ind_oper.Value := '1'; // operação de saida
    Dados.qrySped_C100ind_emit.Value := '0';
    Dados.qrySped_C100cod_mod.Value := '55';
    if (DadosSped.qryNFE_SSITUACAO.Value = '2') then
      Dados.qrySped_C100cod_sit.Value := '00'; // Documento regular
    if (DadosSped.qryNFE_SSITUACAO.Value = '3') then
      Dados.qrySped_C100cod_sit.Value := '02'; // Documento cancelado
    if (DadosSped.qryNFE_SSITUACAO.Value = '6') then
      Dados.qrySped_C100cod_sit.Value := '04'; // Documento denegado
    Dados.qrySped_C100ser.Value := DadosSped.qryNFE_SSERIE.Value;
    Dados.qrySped_C100num_doc.Value := DadosSped.qryNFE_SNUMERO.AsInteger;
    Dados.qrySped_C100chv_nfe.Value := DadosSped.qryNFE_SCHAVE.Value;
    Dados.qrySped_C100dt_doc.Value := DadosSped.qryNFE_SDATA_EMISSAO.Value;
    Dados.qrySped_C100dt_e_s.Value := DadosSped.qryNFE_SDATA_EMISSAO.Value;
    Dados.qrySped_C100vl_doc.Value := DadosSped.qryNFE_STOTAL.AsFloat;
    Dados.qrySped_C100ind_pgto.Value := '9';
    Dados.qrySped_C100vl_desc.Value := DadosSped.qryNFE_SDESCONTO.AsFloat;
    Dados.qrySped_C100vl_merc.Value := DadosSped.qryNFE_SSUBTOTAL.AsFloat;
    Dados.qrySped_C100ind_frt.Value := 9;
    Dados.qrySped_C100vl_seguro.Value := DadosSped.qryNFE_SSEGURO.AsFloat;
    Dados.qrySped_C100vl_out_da.Value := DadosSped.qryNFE_SDESPESAS.AsFloat;
    Dados.qrySped_C100vl_frete.Value := DadosSped.qryNFE_SFRETE.AsFloat;
    Dados.qrySped_C100vl_bc_icms.Value := DadosSped.qryNFE_SBASEICMS.AsFloat;
    Dados.qrySped_C100vl_icms.Value := DadosSped.qryNFE_STOTALICMS.AsFloat;
    Dados.qrySped_C100vl_bc_icms_st.Value := DadosSped.qryNFE_SBASE_ST.AsFloat;
    Dados.qrySped_C100vl_icms_st.Value := DadosSped.qryNFE_STOTAL_ST.AsFloat;
    Dados.qrySped_C100vl_ipi.Value := DadosSped.qryNFE_STOTAL_IPI.AsFloat;
    Dados.qrySped_C100vl_pis.Value := DadosSped.qryNFE_STOTALICMSPIS.AsFloat;
    Dados.qrySped_C100vl_cofins.Value :=
      DadosSped.qryNFE_STOTALICMSCOFINS.AsFloat;
    Dados.qrySped_C100.Post;
    Dados.Conexao.CommitRetaining;

    DadosSped.qryItens_NFe_S.Close; // abre os itens da nfce
    DadosSped.qryItens_NFe_S.Params[0].Value := DadosSped.qryNFE_SCODIGO.Value;
    DadosSped.qryItens_NFe_S.Open;

    DadosSped.qryItens_NFe_S.First;

    while not DadosSped.qryItens_NFe_S.Eof do
    begin // percorre os itens da NFCe
      if (DadosSped.qryNFE_SSITUACAO.Value = '2') then
      begin
        Dados.qrySped_C170.Insert; // insere itens da venda no registro c170
        Dados.qrySped_C170CODIGO.Value := Dados.Numerador('SPED_C170', 'CODIGO',
          'N', '', '');
        Dados.qrySped_C170FK_C100.Value := Dados.qrySped_C100CODIGO.Value;
        DadosSped.qryConsUnidade.Locate('unidade',
          DadosSped.qryItens_NFe_SUNIDADE.Value, []);
        Dados.qrySped_C170fk_unidade.Value :=
          DadosSped.qryConsUnidadeCODIGO.Value;
        Dados.qrySped_C170FK_PRODUTO.Value :=
          DadosSped.qryItens_NFe_SID_PRODUTO.AsInteger;
        Dados.qrySped_C170descricao.Value :=
          DadosSped.qryItens_NFe_SDESCRICAO.Value;
        Dados.qrySped_C170qtd.Value := DadosSped.qryItens_NFe_SQTD.AsFloat;
        Dados.qrySped_C170vl_item.Value :=
          DadosSped.qryItens_NFe_STOTAL.AsFloat;
        Dados.qrySped_C170vl_desc.Value :=
          DadosSped.qryItens_NFe_SDESCONTO.AsFloat;
        Dados.qrySped_C170ind_mov.Value := '0';
        Dados.qrySped_C170cst_icms.Value := DadosSped.qryItens_NFe_SCST.Value;
        Dados.qrySped_C170cfop.Value := DadosSped.qryItens_NFe_SCFOP.Value;
        Dados.qrySped_C170vl_bc_icms.Value :=
          DadosSped.qryItens_NFe_SBASE_ICMS.AsFloat;
        Dados.qrySped_C170aliq_icm.Value :=
          DadosSped.qryItens_NFe_SALIQ_ICMS.AsFloat;
        Dados.qrySped_C170vl_icms.Value :=
          DadosSped.qryItens_NFe_SVALOR_ICMS.AsFloat;
        Dados.qrySped_C170vl_bc_icms_st.Value :=
          DadosSped.qryItens_NFe_SBASE_ICMS_ST.AsFloat;
        Dados.qrySped_C170aliq_st.Value :=
          DadosSped.qryItens_NFe_SALIQ_ICMS_ST.AsFloat;
        Dados.qrySped_C170vl_icms_st.Value :=
          DadosSped.qryItens_NFe_SVALOR_ICMS_ST.AsFloat;
        Dados.qrySped_C170cst_ipi.Value :=
          DadosSped.qryItens_NFe_SCST_IPI.Value;
        Dados.qrySped_C170vl_bc_ipi.Value :=
          DadosSped.qryItens_NFe_SBASE_IPI.AsFloat;
        Dados.qrySped_C170aliq_ipi.Value :=
          DadosSped.qryItens_NFe_SALIQ_IPI.AsFloat;
        Dados.qrySped_C170vl_ipi.Value :=
          DadosSped.qryItens_NFe_SVALOR_IPI.AsFloat;
        Dados.qrySped_C170vl_bc_pis.Value :=
          DadosSped.qryItens_NFe_SBASE_PIS_ICMS.AsFloat;
        Dados.qrySped_C170aliq_pis_perc.Value :=
          DadosSped.qryItens_NFe_SALIQ_PIS_ICMS.AsFloat;
        Dados.qrySped_C170vl_pis.Value :=
          DadosSped.qryItens_NFe_SVALOR_PIS_ICMS.AsFloat;
        Dados.qrySped_C170CST_PIS.Value :=
          DadosSped.qryItens_NFe_SCST_COFINS.Value;

        Dados.qrySped_C170CST_PIS.Value := '49';
        Dados.qrySped_C170CST_COFINS.Value := '49';

        { if DadosSped.qryItens_NFe_SCST_PIS.Value = '07' then
          begin
          Dados.qrySped_C170CST_PIS.Value := '71';
          Dados.qrySped_C170CST_COFINS.Value := '71';
          end;
          if DadosSped.qryItens_NFe_SCST_PIS.Value = '08' then
          begin
          Dados.qrySped_C170CST_PIS.Value := '74';
          Dados.qrySped_C170CST_COFINS.Value := '74';
          end;
          if DadosSped.qryItens_NFe_SCST_PIS.Value = '09' then
          begin
          Dados.qrySped_C170CST_PIS.Value := '72';
          Dados.qrySped_C170CST_COFINS.Value := '72';
          end;
          if DadosSped.qryItens_NFe_SCST_PIS.Value = '49' then
          begin
          Dados.qrySped_C170CST_PIS.Value := '99';
          Dados.qrySped_C170CST_COFINS.Value := '99';
          ; }

        Dados.qrySped_C170vl_bc_cofins.Value :=
          DadosSped.qryItens_NFe_SBASE_COFINS_ICMS.AsFloat;
        Dados.qrySped_C170aliq_cofins_perc.Value :=
          DadosSped.qryItens_NFe_SALIQ_COFINS_ICMS.AsFloat;
        Dados.qrySped_C170vl_cofins.Value :=
          DadosSped.qryItens_NFe_SVALOR_COFINS_ICMS.AsFloat;
        Dados.qrySped_C170vl_opr.Value := DadosSped.qryItens_NFe_STOTAL.AsFloat
          + DadosSped.qryItens_NFe_SVALOR_IPI.AsFloat +
          DadosSped.qryItens_NFe_SSEGURO.AsFloat +
          DadosSped.qryItens_NFe_SDESPESAS.AsFloat +
          DadosSped.qryItens_NFe_SFRETE.AsFloat +
          DadosSped.qryItens_NFe_SVALOR_ICMS_ST.AsFloat -
          DadosSped.qryItens_NFe_SDESCONTO.AsFloat;
        Dados.qrySped_C170.Post;
        Dados.Conexao.CommitRetaining;
      end;

      DadosSped.qryItens_NFe_S.Next;
    end;
    DadosSped.qryNFE_S.Next;
  end;

end;

procedure TDadosSped.REGC190(dtini, dtfim: Tdate; Empresa: Integer);
begin

  DadosSped.qryConsC100.Close;
  DadosSped.qryConsC100.Params[0].Value := CodSped;
  DadosSped.qryConsC100.Open;

  Dados.qrySped_C190.Close;
  Dados.qrySped_C190.Open;

  while not DadosSped.qryConsC100.Eof do
  begin
    DadosSped.qryConsC170.Close;
    DadosSped.qryConsC170.Params[0].AsInteger :=
      DadosSped.qryConsC100CODIGO.AsInteger;
    DadosSped.qryConsC170.Open;
    while not DadosSped.qryConsC170.Eof do
    begin
      Dados.qrySped_C190.Insert;
      Dados.qrySped_C190CODIGO.Value := Dados.Numerador('SPED_C190', 'CODIGO',
        'N', '', '');
      Dados.qrySped_C190FK_C100.Value := DadosSped.qryConsC100CODIGO.Value;
      Dados.qrySped_C190cfop.Value := DadosSped.qryConsC170CFOP.AsString;
      Dados.qrySped_C190cst_icms.Value := DadosSped.qryConsC170CST_ICMS.Value;
      Dados.qrySped_C190aliq_icms.Value :=
        DadosSped.qryConsC170ALIQ_ICM.AsFloat;
      Dados.qrySped_C190vl_opr.Value := DadosSped.qryConsC170VL_OPR.AsFloat;
      Dados.qrySped_C190vl_bc_icms.Value :=
        DadosSped.qryConsC170VL_BC_ICMS.AsFloat;
      Dados.qrySped_C190vl_icms.Value := DadosSped.qryConsC170VL_ICMS.AsFloat;
      Dados.qrySped_C190vl_bc_icms_st.Value :=
        DadosSped.qryConsC170VL_BC_ICMS_ST.AsFloat;
      Dados.qrySped_C190vl_icms_st.Value :=
        DadosSped.qryConsC170VL_ICMS_ST.AsFloat;
      Dados.qrySped_C190vl_ipi.Value := DadosSped.qryConsC170VL_IPI.AsFloat;
      Dados.qrySped_C190.Post;
      Dados.Conexao.CommitRetaining;

      DadosSped.qryConsC170.Next;
    end;
    DadosSped.qryConsC100.Next;
  end;

end;

end.
