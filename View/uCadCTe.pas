unit uCadCTe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, pcteConversaoCTe, pcnConversao, acbrUtil,
  blcksock, ACBrDFeSSL, System.math, acbrDFEUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab,
  ACBrDFe, ACBrMail,
  ACBrCTeDACTEClass, ACBrCTeDACTeRLClass, ACBrCTe, Vcl.Grids, Vcl.DBGrids,
  ACBrCTeDACTEFR, ACBrDFeReport, JvExDBGrids, JvDBGrid;

type
  TfrmCadCTe = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnTransmitir: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ACBrEnterTab1: TACBrEnterTab;
    btnImprimir: TSpeedButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label10: TLabel;
    Label28: TLabel;
    DBComboBoxEh4: TDBComboBoxEh;
    DBEdit10: TDBEdit;
    Label29: TLabel;
    qryCTE_M: TFDQuery;
    dsCTE_M: TDataSource;
    dsCTE_D: TDataSource;
    qryCTE_D: TFDQuery;
    qryProduto: TFDQuery;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoPR_VENDA: TBCDField;
    qryProdutoTIPO: TStringField;
    qryProdutoCSTICMS: TStringField;
    qryProdutoCFOP: TStringField;
    qryProdutoCSOSN: TStringField;
    qryProdutoALIQ_ICM: TCurrencyField;
    qryProdutoCSTE: TStringField;
    qryProdutoCSTS: TStringField;
    qryProdutoALIQ_PIS: TCurrencyField;
    qryProdutoALIQ_COF: TCurrencyField;
    qryProdutoNCM: TStringField;
    qryProdutoNACIONALFEDERAL: TStringField;
    qryProdutoIMPORTADOSFEDERAL: TStringField;
    qryProdutoESTADUAL: TStringField;
    qryProdutoMUNICIPAL: TStringField;
    qryProdutoCODBARRA: TStringField;
    btnImportar: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label36: TLabel;
    qryTransp: TFDQuery;
    qryTranspCODIGO: TIntegerField;
    qryTranspPESSOA: TStringField;
    qryTranspCNPJ: TStringField;
    qryTranspIE: TStringField;
    qryTranspNOME: TStringField;
    qryTranspAPELIDO: TStringField;
    qryTranspENDERECO: TStringField;
    qryTranspNUMERO: TStringField;
    qryTranspBAIRRO: TStringField;
    qryTranspCOD_CIDADE: TIntegerField;
    qryTranspCIDADE: TStringField;
    qryTranspUF: TStringField;
    qryTranspCEP: TStringField;
    qryTranspPLACA: TStringField;
    qryTranspUFPLACA: TStringField;
    qryTranspRNTC: TStringField;
    qryTranspATIVO: TStringField;
    qryTranspEMPRESA: TIntegerField;
    Label37: TLabel;
    qryCFOP: TFDQuery;
    qryCFOPCODIGO: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPTIPO: TStringField;
    qryCFOPMOV_ES: TStringField;
    qryCFOPATIVO: TStringField;
    dsCFOP: TDataSource;
    ACBrMail1: TACBrMail;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBEdit26: TDBEdit;
    qryProdutoALIQ_IPI: TBCDField;
    qryProdutoCSTIPI: TStringField;
    qryPesquisaCTE: TFDQuery;
    qryProdutoFCP: TBCDField;
    DBGridEh1: TDBGridEh;
    qryProdutoCEST: TStringField;
    btnGravar: TSpeedButton;
    btnPessoas: TSpeedButton;
    qryCTE_DCODIGO: TIntegerField;
    qryCTE_DFK_CTE_MASTER: TIntegerField;
    qryCTE_DNUMERO: TIntegerField;
    qryCTE_DCHAVE: TStringField;
    qryCTE_DUNIDADE: TStringField;
    qryCTE_DFK_DESTINATARIO: TIntegerField;
    qryPesquisaCTECODIGO: TIntegerField;
    Label3: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label9: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Label25: TLabel;
    qryCTE_DDESCRICAO: TStringField;
    qryVeiculo: TFDQuery;
    qryVeiculoPLACA: TStringField;
    qryVeiculoDESCRICAO: TStringField;
    qryVeiculoMUNICIPIO: TStringField;
    qryVeiculoUF: TStringField;
    qryVeiculoRENAVAM: TStringField;
    qryVeiculoRNTC: TStringField;
    qryVeiculoTIPO: TIntegerField;
    qryVeiculoATIVO: TStringField;
    qryVeiculo_Reboque: TFDQuery;
    qryVeiculo_ReboqueCODIGO: TIntegerField;
    qryVeiculo_ReboquePLACA_CAVALO: TStringField;
    qryVeiculo_ReboquePLACA: TStringField;
    qryVeiculo_ReboqueMUNICIPIO: TStringField;
    qryVeiculo_ReboqueUF: TStringField;
    qryVeiculo_ReboqueRNTC: TStringField;
    qryVeiculo_ReboqueRENAVAM: TStringField;
    qryVeiculo_ReboqueTIPO: TIntegerField;
    qryVeiculo_ReboqueCARROCERIA: TSmallintField;
    dsReboque: TDataSource;
    qryESOrigem: TFDQuery;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    qryESOrigemCODIGO: TIntegerField;
    qryESOrigemDESCRICAO: TStringField;
    qryESDestino: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qryUFOrigem: TFDQuery;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    DBComboBoxEh2: TDBComboBoxEh;
    DBComboBoxEh3: TDBComboBoxEh;
    qryCTE_MCODIGO: TIntegerField;
    qryCTE_MFKEMPRESA: TIntegerField;
    qryCTE_MNUMERO: TIntegerField;
    qryCTE_MCHAVE: TStringField;
    qryCTE_MCFOP: TIntegerField;
    qryCTE_MMODELO: TIntegerField;
    qryCTE_MSERIE: TIntegerField;
    qryCTE_MCODMUNENVIO: TIntegerField;
    qryCTE_MMUNICIPIOENVIO: TStringField;
    qryCTE_MUFENVIO: TStringField;
    qryCTE_MTIPOSERVICO: TIntegerField;
    qryCTE_MCODMUNINI: TIntegerField;
    qryCTE_MMUNICIPIOINI: TStringField;
    qryCTE_MUFINI: TStringField;
    qryCTE_MCODMUNFIM: TIntegerField;
    qryCTE_MMINICIPIOFIM: TStringField;
    qryCTE_MUFFIM: TStringField;
    qryCTE_MDESCRICAOSERVICO: TStringField;
    qryCTE_MRESPSEG: TIntegerField;
    qryCTE_MXSEG: TStringField;
    qryCTE_MNAPOLICE: TStringField;
    qryCTE_MTAF: TStringField;
    qryCTE_MNROREGESTADUAL: TStringField;
    qryCTE_MTIPO: TStringField;
    qryCTE_MSITUACAO: TStringField;
    qryCTE_MFKTRANSPORTADOR: TIntegerField;
    qryCTE_MPROTOCOLO: TStringField;
    qryCTE_MXML: TMemoField;
    qryCTE_MDATA: TDateField;
    qryCTE_MHORA: TTimeField;
    qryCTE_MFINALIDADE: TIntegerField;
    qryCTE_MDOCUMENTO: TStringField;
    qryCTE_MDATA_ENTREGA: TDateField;
    qryCTE_MTOMADOR: TStringField;
    qryCTE_MFK_DESTINATARIO: TIntegerField;
    qryCTE_MFK_VEICULO: TStringField;
    qryCTE_MMETRAGEM: TStringField;
    qryCTE_MVIRTUAL_SITUACAO: TStringField;
    qryCTE_MOBS_FISCO: TMemoField;
    qryCTE_MOBS_CONTRIBUINTE: TMemoField;
    qryCTE_MVIRTUAL_CFOP: TStringField;
    qryCTE_MVIRTUAL_PLACA: TStringField;
    qryCTE_MVIRTUAL_DESTINATARIO: TStringField;
    qryCTE_MVIRTUAL_ORIGEM: TStringField;
    qryCTE_MVIRTUAL_DESTINO: TStringField;
    qryCTE_MVIRTUAL_EMPRESA: TStringField;
    dsTransp: TDataSource;
    btnVeiculo: TSpeedButton;
    btnTransp: TSpeedButton;
    dsVeiculo: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit3: TDBEdit;
    qryDestinatario: TFDQuery;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioNOME: TStringField;
    qryDestinatarioENDERECO: TStringField;
    qryDestinatarioBAIRRO: TStringField;
    qryDestinatarioID_CIDADE: TIntegerField;
    qryDestinatarioCIDADE: TStringField;
    qryDestinatarioCEP: TStringField;
    qryDestinatarioUF: TStringField;
    qryDestinatarioPESSOA: TStringField;
    qryDestinatarioCNPJ: TStringField;
    qryDestinatarioIE: TStringField;
    qryDestinatarioFONE: TStringField;
    qryDestinatarioFK_EMPRESA: TIntegerField;
    qryDestinatarioFK_USUARIO: TIntegerField;
    qryDestinatarioATIVO: TIntegerField;
    qryRemetente: TFDQuery;
    qryRemetenteCODIGO: TIntegerField;
    qryRemetenteNOME: TStringField;
    qryRemetenteENDERECO: TStringField;
    qryRemetenteBAIRRO: TStringField;
    qryRemetenteID_CIDADE: TIntegerField;
    qryRemetenteCIDADE: TStringField;
    qryRemetenteCEP: TStringField;
    qryRemetenteUF: TStringField;
    qryRemetentePESSOA: TStringField;
    qryRemetenteCNPJ: TStringField;
    qryRemetenteIE: TStringField;
    qryRemetenteFONE: TStringField;
    qryRemetenteFK_EMPRESA: TIntegerField;
    qryRemetenteFK_USUARIO: TIntegerField;
    qryRemetenteATIVO: TIntegerField;
    qryCTE_MFK_REMETENTE: TIntegerField;
    qryDestinatarioNUMERO: TStringField;
    qryRemetenteNUMERO: TStringField;
    qryVeiculoCARROCERIA: TIntegerField;
    Label4: TLabel;
    DBComboBoxEh6: TDBComboBoxEh;
    qryCTE_MCHAVE_REFERENCIADA: TStringField;
    btnRemetente: TSpeedButton;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    Label6: TLabel;
    qryCTE_MVIRTUAL_REMETENTE: TStringField;
    qryCTE_MFKTOMADOR: TIntegerField;
    qryCTE_MNAVERBACAO: TStringField;
    qryCTE_MCNPJ_SEGURADORA: TStringField;
    DBEdit9: TDBEdit;
    qryCTE_MTOTAL: TFMTBCDField;
    qryCTE_MRECEBIDO: TFMTBCDField;
    qryCTE_MVPIS: TFMTBCDField;
    qryCTE_MVCOFINS: TFMTBCDField;
    qryCTE_MVINSS: TFMTBCDField;
    qryCTE_MVIR: TFMTBCDField;
    qryCTE_MVCLSS: TFMTBCDField;
    qryCTE_MVTOTTIRB: TFMTBCDField;
    qryCTE_MQTD: TFMTBCDField;
    qryCTE_MVALOR_SERVICO: TFMTBCDField;
    qryCTE_MVALOR_CARGA: TFMTBCDField;
    qryCTE_MALIQUOTA_ICMS: TFMTBCDField;
    qryCTE_MBASE_ICMS: TFMTBCDField;
    qryCTE_MVALOR_ICMS: TFMTBCDField;
    qryCTE_MCST_ICMS: TStringField;
    qryCTE_DTOTAL: TFMTBCDField;
    qryCTE_DPRECO: TFMTBCDField;
    qryCTE_DQTD: TFMTBCDField;
    qryCTE_MOUTROS_TRIBUTOS: TFMTBCDField;
    qryVeiculoTARA: TFMTBCDField;
    qryVeiculoPESO: TFMTBCDField;
    qryVeiculo_ReboquePESO: TFMTBCDField;
    qryVeiculo_ReboqueTARA: TFMTBCDField;
    qryRemetenteCONTRIBUINTE: TStringField;
    qryCTE_MPESOL: TFMTBCDField;
    qryCTE_MPESOB: TFMTBCDField;
    qryESOrigemUF: TStringField;
    qryESDestinoUF: TStringField;
    qryUFOrigemUF: TStringField;
    dsOrigem: TDataSource;
    dsDestino: TDataSource;
    TabSheet7: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    TabSheet8: TTabSheet;
    DBMemoEh2: TDBMemoEh;
    TabSheet4: TTabSheet;
    TabSheet1: TTabSheet;
    DBEdit4: TDBEdit;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label27: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    JvDBGrid1: TJvDBGrid;
    dsCTe_Seguradora: TDataSource;
    qryCte_Seguradora: TFDQuery;
    qryCte_SeguradoraCODIGO: TIntegerField;
    qryCte_SeguradoraFK_CTE: TIntegerField;
    qryCte_SeguradoraRESPONSAVEL: TStringField;
    qryCte_SeguradoraNOME: TStringField;
    qryCte_SeguradoraCNPJ: TStringField;
    qryCte_SeguradoraAPOLICE: TStringField;
    qryCte_SeguradoraAVERBACAO: TStringField;
    qryCte_SeguradoraVALOR_SEGURADO: TFMTBCDField;
    procedure btnSairClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure qryCTE_MAfterOpen(DataSet: TDataSet);
    procedure qryCTE_DBeforeInsert(DataSet: TDataSet);
    procedure qryCTE_MAfterPost(DataSet: TDataSet);
    procedure qryCTE_MAfterDelete(DataSet: TDataSet);
    procedure qryCTE_DAfterDelete(DataSet: TDataSet);
    procedure qryCTE_DAfterPost(DataSet: TDataSet);
    procedure qryCTE_DNewRecord(DataSet: TDataSet);
    procedure qryCTE_DQTDValidate(Sender: TField);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryCTE_MCalcFields(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure QryFaturaAfterPost(DataSet: TDataSet);
    procedure QryFaturaAfterDelete(DataSet: TDataSet);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh2Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure dsCTE_MDataChange(Sender: TObject; Field: TField);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh3Exit(Sender: TObject);
    procedure qryCTE_MBeforePost(DataSet: TDataSet);
    procedure DBLookupComboboxEh4Enter(Sender: TObject);
    procedure DBLookupComboboxEh4Exit(Sender: TObject);
    procedure DBLookupComboboxEh3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCTE_DAfterEdit(DataSet: TDataSet);
    procedure btnPessoasClick(Sender: TObject);
    procedure qryCTE_DAfterInsert(DataSet: TDataSet);
    procedure DBLookupComboboxEh3Change(Sender: TObject);
    procedure qryCTE_MVALOR_CARGAChange(Sender: TField);
    procedure qryCTE_MALIQUOTA_ICMSChange(Sender: TField);
    procedure btnTranspClick(Sender: TObject);
    procedure btnVeiculoClick(Sender: TObject);
    procedure dsVeiculoDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure btnRemetenteClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure qryCTE_MNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure DBMemoEh1Enter(Sender: TObject);
    procedure DBMemoEh1Exit(Sender: TObject);
    procedure DBMemoEh2Enter(Sender: TObject);
    procedure DBMemoEh2Exit(Sender: TObject);
    procedure qryCte_SeguradoraBeforeInsert(DataSet: TDataSet);
    procedure qryCte_SeguradoraNewRecord(DataSet: TDataSet);
    procedure qryCte_SeguradoraBeforePost(DataSet: TDataSet);
    procedure qryCte_SeguradoraAfterPost(DataSet: TDataSet);
    procedure qryCte_SeguradoraAfterDelete(DataSet: TDataSet);
  private
    vSql: string;
    procedure GerarCTE;
    procedure estado;
    function ValidaNegocios: boolean;
    procedure EnviarEmal(email: string);
    procedure GETNumero;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCTe: TfrmCadCTe;

implementation

{$R *.dfm}

uses Udados, ufrmStatus, uImportarNFe, uDadosWeb, uCadProduto, uCadPessoa,
  uCadTransp, uVeiculos, uRemetente, uDestinatario, uImportarCTe, uDmCTe;

procedure TfrmCadCTe.GerarCTE;
var
  Produto: string;
  FResponsavel, i: integer;
begin

  with dmCTe.ACBrCTe.Conhecimentos.Add.CTe do
  begin
    Ide.cUF := dados.qryEmpresaID_UF.Value;
    Ide.CFOP := qryCTE_MCFOP.AsInteger;
    Ide.natOp := copy(qryCTE_MVIRTUAL_CFOP.AsString, 1, 50);
    if qryCTE_MRECEBIDO.Value > 0 then
      Ide.forPag := fpPago
    else
    begin
      Ide.forPag := fpAPagar;
    end;

    Ide.indGlobalizado := tiNao;

    Ide.modelo := 57;
    Ide.serie := qryCTE_MSERIE.AsInteger;
    Ide.nCT := qryCTE_MNUMERO.Value;
    Ide.cCT := GerarCodigoDFe(Ide.nCT);
    Ide.dhEmi := Now;
    Ide.tpImp := tiRetrato;
    Ide.tpEmis := teNormal;
    // TpcnTipoAmbiente = (taProducao, taHomologacao);
    if dados.qryConfigAMBIENTE.Value = 0 then
      Ide.tpAmb := taProducao;
    if dados.qryConfigAMBIENTE.Value = 1 then
      Ide.tpAmb := taHomologacao;

    case qryCTE_MFINALIDADE.Value of
      0:
        Ide.tpCTe := tcNormal;
      1:
        Ide.tpCTe := tcComplemento;
    end;

    Ide.procEmi := peAplicativoContribuinte;
    Ide.indIEToma := TpcnindIEDest(dados.qryConfigTIPO_CONTRIBUINTE_CTE.Value);
    Ide.verProc := '4.0';
    Ide.cMunEnv := dados.qryEmpresaID_CIDADE.Value;
    Ide.xMunEnv := dados.qryEmpresaCIDADE.Value;
    Ide.UFEnv := dados.qryEmpresaUF.Value;

    Ide.modal := mdRodoviario;
    Ide.tpServ := tsNormal;

    // Origem da Prestação

    Ide.cMunIni := qryCTE_MCODMUNINI.Value;
    Ide.xMunIni := qryCTE_MVIRTUAL_ORIGEM.Value;
    Ide.UFIni := qryCTE_MUFINI.Value;

    // Destino da Prestação

    Ide.cMunFim := qryCTE_MCODMUNFIM.Value;
    Ide.xMunFim := qryCTE_MVIRTUAL_DESTINO.Value;
    Ide.UFFim := qryCTE_MUFFIM.Value;

    Ide.retira := rtSim;
    Ide.xdetretira := '';

    if qryCTE_MTOMADOR.Value = '0' then
      Ide.Toma03.Toma := tmRemetente;

    if qryCTE_MTOMADOR.Value = '1' then
      Ide.Toma03.Toma := tmDestinatario;

    if trim(qryCTE_MOBS_FISCO.Value) <> '' then
    begin
      with compl.ObsFisco.Add do
      begin
        xCampo := 'Fisco';
        xTexto := trim(qryCTE_MOBS_FISCO.Value);
      end;
    end;
    if trim(qryCTE_MOBS_CONTRIBUINTE.Value) <> '' then
    begin
      compl.xObs := trim(qryCTE_MOBS_CONTRIBUINTE.Value);
    end;
    compl.fluxo.xOrig := copy(Ide.xMunIni, 1, 15);

    compl.fluxo.xDest := copy(Ide.xMunFim, 1, 15);

    // Dados do Emitente

    emit.CNPJ := tirapontos(dados.qryEmpresaCNPJ.Value);
    emit.IE := tirapontos(dados.qryEmpresaIE.Value);
    emit.xNome := dados.qryEmpresaRAZAO.Value;
    emit.xFant := dados.qryEmpresaFANTASIA.Value;
    emit.EnderEmit.xLgr := dados.qryEmpresaENDERECO.Value;
    emit.EnderEmit.nro := dados.qryEmpresaNUMERO.Value;
    emit.EnderEmit.xCpl := dados.qryEmpresaCOMPLEMENTO.Value;
    emit.EnderEmit.xBairro := dados.qryEmpresaBAIRRO.Value;;
    emit.EnderEmit.cMun := dados.qryEmpresaID_CIDADE.Value;
    emit.EnderEmit.xMun := dados.qryEmpresaCIDADE.Value;
    emit.EnderEmit.CEP := StrToIntDef(dados.qryEmpresaCEP.Value, 0);
    emit.EnderEmit.UF := dados.qryEmpresaUF.Value;
    emit.EnderEmit.fone := dados.qryEmpresaFONE.Value;

    // Dados do Remetente

    if qryRemetente.Locate('codigo', qryCTE_MFK_REMETENTE.Value, []) then
    begin
      rem.CNPJCPF := tirapontos(qryRemetenteCNPJ.Value);

      if qryRemetenteCONTRIBUINTE.Value = 'S' then
      begin
        rem.IE := tirapontos(qryRemetenteIE.Value);
        if qryCTE_MTOMADOR.Value = '0' then
          Ide.indIEToma := inContribuinte;
      end
      else
      begin
        if qryCTE_MTOMADOR.Value = '0' then
          Ide.indIEToma := inNaoContribuinte;
      end;

      rem.xNome := qryRemetenteNOME.Value;
      rem.xFant := qryRemetenteNOME.Value;
      rem.enderReme.xLgr := qryRemetenteENDERECO.Value;
      rem.enderReme.nro := qryRemetenteNUMERO.Value;
      rem.enderReme.xBairro := qryRemetenteBAIRRO.Value;
      rem.enderReme.cMun := qryRemetenteID_CIDADE.Value;
      rem.enderReme.xMun := qryRemetenteCIDADE.Value;
      rem.enderReme.CEP := StrToIntDef(qryRemetenteCEP.Value, 0);
      rem.enderReme.UF := qryRemetenteUF.Value;
      rem.enderReme.cPais := 1058;
      rem.enderReme.xPais := 'Brasil';
    end;


    // Dados do Destinatario

    if qryDestinatario.Locate('codigo', qryCTE_MFK_DESTINATARIO.Value, []) then
    begin

      if (uppercase(qryDestinatarioIE.Value) = 'ISENTO') or
        (trim(qryDestinatarioIE.Value) = '') then
        Ide.indIEToma := inNaoContribuinte
      else
      begin
        Ide.indIEToma := inContribuinte;
        dest.IE := tirapontos(qryDestinatarioIE.Value);
      end;

      dest.CNPJCPF := tirapontos(qryDestinatarioCNPJ.Value);
      dest.xNome := qryDestinatarioNOME.Value;
      dest.enderDest.xLgr := qryDestinatarioENDERECO.Value;
      dest.enderDest.nro := qryDestinatarioNUMERO.Value;
      dest.enderDest.xBairro := qryDestinatarioBAIRRO.Value;
      dest.enderDest.cMun := qryDestinatarioID_CIDADE.AsInteger;
      dest.enderDest.xMun := qryDestinatarioCIDADE.Value;
      dest.enderDest.CEP := StrToIntDef(qryDestinatarioCEP.Value, 0);
      dest.enderDest.UF := qryDestinatarioUF.Value;
      dest.enderDest.cPais := 1058;
      dest.enderDest.xPais := 'Brasil';
    end;

    // prestação de serviço

    vPrest.vTPrest := qryCTE_MVALOR_SERVICO.AsFloat;
    if qryCTE_MVALOR_SERVICO.AsFloat <= 0 then
      vPrest.vRec := qryCTE_MVALOR_SERVICO.AsFloat;
    with vPrest.Comp.Add do
    begin
      xNome := 'VALOR LIQUIDO PRESTAÇÃO DE SERVIÇO';
      vPrest.Comp.Add.vComp := qryCTE_MVALOR_SERVICO.AsFloat;
    end;

    // impostos

    if qryCTE_MCST_ICMS.Value = '00' then
    begin
      Imp.ICMS.SituTrib := cst00;
      Imp.ICMS.ICMS00.CST := cst00;
      Imp.ICMS.ICMS00.vBC := RoundABNT(qryCTE_MBASE_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS00.pICMS := RoundABNT(qryCTE_MALIQUOTA_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS00.vICMS := RoundABNT(qryCTE_MVALOR_ICMS.AsFloat, -2);
    end;
    if qryCTE_MCST_ICMS.Value = '20' then
    begin
      Imp.ICMS.SituTrib := cst20;
      Imp.ICMS.ICMS20.CST := cst20;
      Imp.ICMS.ICMS20.vBC := RoundABNT(qryCTE_MBASE_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS20.pICMS := RoundABNT(qryCTE_MALIQUOTA_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS20.vICMS := RoundABNT(qryCTE_MVALOR_ICMS.AsFloat, -2);
    end;
    if qryCTE_MCST_ICMS.Value = '40' then
    begin
      Imp.ICMS.SituTrib := cst40;
      Imp.ICMS.ICMS45.CST := cst40;
    end;
    if qryCTE_MCST_ICMS.Value = '41' then
    begin
      Imp.ICMS.SituTrib := cst41;
      Imp.ICMS.ICMS45.CST := cst41;
    end;
    if qryCTE_MCST_ICMS.Value = '51' then
    begin
      Imp.ICMS.SituTrib := cst51;
      Imp.ICMS.ICMS45.CST := cst51;
    end;

    if qryCTE_MCST_ICMS.Value = '60' then
    begin
      Imp.ICMS.SituTrib := cst60;
      Imp.ICMS.ICMS60.CST := cst60;
    end;
    if qryCTE_MCST_ICMS.Value = '90' then
    begin
      Imp.ICMS.SituTrib := cst90;
      Imp.ICMS.ICMS90.CST := cst90;
      Imp.ICMS.ICMS90.pRedBC := 0;
      Imp.ICMS.ICMS90.vBC := RoundABNT(qryCTE_MBASE_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS90.pICMS := RoundABNT(qryCTE_MALIQUOTA_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS90.vICMS := RoundABNT(qryCTE_MVALOR_ICMS.AsFloat, -2);
      Imp.ICMS.ICMS90.vCred := 0;
    end;
    Imp.vTotTrib := qryCTE_MOUTROS_TRIBUTOS.AsFloat;

    Imp.infTribFed.vPIS :=
      (qryCTE_MVALOR_SERVICO.AsFloat * dados.qryConfigCTE_PIS.AsFloat) / 100;
    Imp.infTribFed.vCOFINS :=
      (qryCTE_MVALOR_SERVICO.AsFloat * dados.qryConfigCTE_COFINS.AsFloat) / 100;

    // CTE Documento normal inicio

    infCTeNorm.infCarga.vCarga := qryCTE_MVALOR_CARGA.AsFloat;
    infCTeNorm.infCarga.proPred := qryCTE_DDESCRICAO.Value;

    with infCTeNorm.infCarga.infQ.Add do
    begin
      if qryCTE_MMETRAGEM.Value = '0' then
      begin
        cUnid := uM3;
        tpMed := 'PESO CUBADO';
      end;
      if qryCTE_MMETRAGEM.Value = '1' then
      begin
        cUnid := uKG;
        tpMed := 'PESO BRUTO';
      end;
      if qryCTE_MMETRAGEM.Value = '2' then
      begin
        cUnid := uTON;
        tpMed := 'PESO BRUTO';
      end;
      if qryCTE_MMETRAGEM.Value = '3' then
      begin
        cUnid := uUNIDADE;
        tpMed := 'UNIDADES'
      end;
      if qryCTE_MMETRAGEM.Value = '4' then
      begin
        cUnid := uLITROS;
        tpMed := 'LITRAGEM'
      end;

      qCarga := qryCTE_MQTD.AsFloat;
    end;

    qryCTE_D.First;

    if qryCTE_MDOCUMENTO.Value <> 'S' then
    begin
      while not qryCTE_D.Eof do
      begin
        with infCTeNorm.infDoc.infNFe.Add do // nota fiscal
        begin
          chave := qryCTE_DCHAVE.Value;
        end;
        qryCTE_D.Next;
      end;
    end
    else
    begin
      with infCTeNorm.infDoc.infOutros.Add do // outros documentos
      begin
        while not qryCTE_D.Eof do
        begin
          tpDoc := tdDeclaracao;
          descOutros := qryCTE_DDESCRICAO.Value;
          nDoc := qryCTE_DNUMERO.AsString;
          vDocFisc := RoundTo(qryCTE_DTOTAL.AsFloat, -2);
          qryCTE_D.Next;
        end;
      end;
    end;

    qryCte_Seguradora.First;
    while not qryCte_Seguradora.Eof do
    begin
      if qryCte_SeguradoraRESPONSAVEL.Value = 'Emitente do CT-e' then
        FResponsavel := 4;
      if qryCte_SeguradoraRESPONSAVEL.Value = 'Tomador de Serviço' then
        FResponsavel := 5;

      with infCTeNorm.seg.Add do
      begin
        respSeg := TpcteRspSeg(FResponsavel);
        xSeg := qryCte_SeguradoraNOME.Value;
        nApol := qryCte_SeguradoraAPOLICE.Value;
        vCarga := qryCte_SeguradoraVALOR_SEGURADO.AsFloat;
        nAver := qryCte_SeguradoraAVERBACAO.AsString;
      end;
      qryCte_Seguradora.Next;
    end;

    qryVeiculo.Close;
    qryVeiculo.Open;
    if qryVeiculo.Locate('PLACA', qryCTE_MVIRTUAL_PLACA.Value, []) then
    begin
      with infCTeNorm.rodo.veic.Add do
      begin
        cInt := '001';
        placa := qryVeiculoPLACA.Value;
        UF := qryVeiculoUF.Value;
        RENAVAM := qryVeiculoRENAVAM.Value;
        tara := qryVeiculoTARA.AsInteger;
        capKG := qryVeiculoPESO.AsInteger;
        capM3 := 0;
        case qryVeiculoTIPO.Value of
          0:
            tpRod := trNaoAplicavel;
          1:
            tpRod := trTruck;
          2:
            tpRod := trToco;
          3:
            tpRod := trCavaloMecanico;
          4:
            tpRod := trVAN;
          5:
            tpRod := trUtilitario;
          6:
            tpRod := trOutros;
        end;
        tpCar := TpcteTipoCarroceria(qryVeiculoCARROCERIA.Value);
      end;
    end;

    qryVeiculo_Reboque.Close;
    qryVeiculo_Reboque.Params[0].Value := qryCTE_MFK_VEICULO.Value;
    qryVeiculo_Reboque.Open;

    if not qryVeiculo_Reboque.IsEmpty then
    begin
      qryVeiculo_Reboque.First;
      while not qryVeiculo_Reboque.Eof do
      begin
        if (Length(qryVeiculo_ReboquePLACA.Value) = 7) then
        begin
          infCTeNorm.rodo.RNTRC := qryVeiculoRNTC.Value;
          with infCTeNorm.rodo.veic.Add do
          begin

            cInt := '00' + IntToStr(i + 1);
            placa := qryVeiculo_ReboquePLACA.Value;
            RENAVAM := qryVeiculo_ReboqueRENAVAM.Value;
            tara := qryVeiculo_ReboqueTARA.AsInteger;
            capKG := qryVeiculo_ReboquePESO.AsInteger;
            capM3 := 0;
            tpCar := TpcteTipoCarroceria(qryVeiculo_ReboqueCARROCERIA.Value);
            UF := qryVeiculo_ReboqueUF.Value;
          end;
        end;
        qryVeiculo_Reboque.Next;
      end;
    end;

    if qryTransp.Locate('CODIGO', qryCTE_MFKTRANSPORTADOR.Value, []) then
    begin
      with infCTeNorm.rodo.moto.Add do
      begin
        xNome := qryTranspNOME.Value;
        CPF := qryTranspCNPJ.Value;
      end;
      infCTeNorm.rodo.RNTRC := '00000000';
    end;

    // responsavel tecnico 22-03-2019
    if dados.qryEmpresaRESPONSAVEL_TECNICO.Value = 'S' then
    begin

      dados.qryParametro.Close;
      dados.qryParametro.Open;

      infRespTec.CNPJ := tirapontos(dados.qryParametroCNPJ.Value);
      infRespTec.xContato := dados.qryParametroCONTATO.Value;
      infRespTec.email := dados.qryParametroEMAIL_SUPORTE.Value;
      infRespTec.fone := tirapontos(dados.qryParametroFONE1.Value);
      infRespTec.hashCSRT := '';
    end;

    infCTeNorm.rodo.dPrev := qryCTE_MDATA_ENTREGA.Value;
    infCTeNorm.rodo.lota := ltNao;
    // fim documento normal

    if qryCTE_MFINALIDADE.Value = 0 then
    begin // complementar
      infCteComp.chave := qryCTE_MCHAVE_REFERENCIADA.Value;
    end;
  end;

end;

procedure TfrmCadCTe.EnviarEmal(email: string);
var
  mensagem: Tstrings;
  para: string;
begin
  if trim(dados.qryEmpresaEMAIL.AsString) = '' then
    exit;

  try
    mensagem := TstringList.Create;
    mensagem.Add('SEGUE EM ANEXO XML e DANFE NFE nº ' +
      qryCTE_MNUMERO.AsString);
    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);

    FEmail.GetEmail;

    // ACBrMail1.FromName := qryCTE_MVIRTUAL_CLIENTE.AsString;
    ACBrMail1.Host := FEmail.servidor;
    ACBrMail1.Port := FEmail.porta;
    ACBrMail1.AddAddress(LowerCase(FEmail.usuario), '');
    ACBrMail1.Username := LowerCase(FEmail.usuario);
    ACBrMail1.From := LowerCase(FEmail.usuario);
    ACBrMail1.Password := FEmail.Senha;
    ACBrMail1.IsHTML := false;

    ACBrMail1.DefaultCharset := TMailCharset(27);
    ACBrMail1.IDECharset := TMailCharset(15);

    ACBrMail1.SetSSL := false;
    ACBrMail1.SetTLS := false;

    if FEmail.SSL then
      ACBrMail1.SetSSL := true;

    if FEmail.TLS then
      ACBrMail1.SetTLS := true;

    ACBrMail1.ReadingConfirmation := true;
    ACBrMail1.UseThread := false;
    para := LowerCase(dados.qryEmpresaEMAIL.Value);

    dmCTe.ACBrCTe.Conhecimentos.Items[0].EnviarEmail(para,
      'NFE-' + { qryCTE_MVIRTUAL_CLIENTE.AsString } '', mensagem, true
      // Enviar PDF junto
      , nil // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
      , nil); // Lista de anexos - TStrings}
  finally
    mensagem.Free;
  end;
end;

procedure TfrmCadCTe.GETNumero;
begin

  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'SELECT MAX(NUMERO) qtd FROM CTE_MASTER WHERE SERIE=:SERIE AND FKEMPRESA=:EMPRESA';
  dados.qryExecute.Params[0].Value := dados.qryConfigCTE_SERIE.Value;
  dados.qryExecute.Params[1].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryExecute.Open;

  if dados.qryExecute.Fields[0].AsInteger = 0 then
    qryCTE_MNUMERO.Value := StrToIntDef(dados.qryConfigCTE_NUMERO.AsString, 1)
  else
    qryCTE_MNUMERO.Value := dados.qryExecute.Fields[0].AsInteger + 1;

end;

procedure TfrmCadCTe.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadCTe.QryFaturaAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.QryFaturaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

function TfrmCadCTe.ValidaNegocios: boolean;
var
  Msg: String;
  Inicio: TDateTime;
  Ok: boolean;
  Tempo: String;
begin
  Result := true;
  Inicio := Now;
  Ok := dmCTe.ACBrCTe.Conhecimentos.ValidarRegrasdeNegocios(Msg);
  Tempo := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

  if not Ok then
  begin
    Result := false;
    showMessage('Erros encontrados' + #13 + Msg + #13 + sLineBreak + #13 +
      'Tempo: ' + Tempo);
  end;
end;

procedure TfrmCadCTe.btnGravarClick(Sender: TObject);
begin
  try
    if (qryCTE_M.State IN dsEditmodes) then
      qryCTE_M.Post;

    if qryCTE_MVIRTUAL_PLACA.IsNull then
    begin
      showMessage('Informe a Placa');
      exit;
    end;

    if qryCTE_MCST_ICMS.IsNull then
    begin
      showMessage('Informe o CST');
      exit;
    end;

    if qryCTE_MMETRAGEM.IsNull then
    begin
      showMessage('Informe a Metragem');
      exit;
    end;

    if qryCTE_D.IsEmpty then
    begin
      showMessage('Informe os itens da NF-e');
      exit;
    end;
    btnGravar.Enabled := false;
  finally
    // btnGravar.Enabled := true;
  end;
  btnTransmitir.Enabled := true;
  Application.ProcessMessages;

end;

procedure TfrmCadCTe.btnSairClick(Sender: TObject);
begin
  if Application.messageBox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_YesNo) = mrYes then
    Close;
end;

procedure TfrmCadCTe.btnTransmitirClick(Sender: TObject);
var
  dir, vCaminho: string;
  Unidade: string;
begin

  if (qryCTE_MCFOP.IsNull) then
  begin
    showMessage('Digite a CFOP!');
    exit;
  end;

  if (trim(qryCTE_MCST_ICMS.Value) = '') or (qryCTE_MCST_ICMS.IsNull) then
  begin
    showMessage('Digite o CST!');
    exit;
  end;

  dmCTe.ConfiguraCTe;
  dmCTe.ACBrCTeDACTeRL1.Cancelada := false;

  dmCTe.ACBrCTe.Conhecimentos.Clear;
  if not(qryCTE_MCHAVE.IsNull) and (trim(qryCTE_MCHAVE.Value) <> '') and
    (Length(qryCTE_MCHAVE.Value) = 44) then
  begin
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);
    dmCTe.ACBrCTe.Consultar;
  end;

  if dmCTe.ACBrCTe.WebServices.Consulta.cStat = 100 then
  begin // verifica se já foi transmitido
    if not(qryCTE_MCHAVE.IsNull) then
    begin
      showMessage('Conhecimento de frete já transmitido!');
      qryCTE_M.Edit;
      qryCTE_MSITUACAO.Value := 'D';
      qryCTE_M.Post;
      dados.Conexao.CommitRetaining;
      exit;
    end;
  end;

  if qryCTE_M.State in [dsInsert, dsEdit] then
    qryCTE_M.Post;
  dmCTe.ACBrCTe.Conhecimentos.Clear;

  GerarCTE;
  dmCTe.ACBrCTe.Conhecimentos.Assinar;
  dmCTe.ACBrCTe.Conhecimentos.Validar;
  qryCTE_M.Edit;
  qryCTE_MCHAVE.Value := copy(dmCTe.ACBrCTe.Conhecimentos.Items[0]
    .CTe.infCTe.ID, 4, 100);
  qryCTE_MXML.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].XML;
  qryCTE_M.Post;

  if dmCTe.ACBrCTe.Enviar(StrToInt('0'), false) then
  begin
    qryCTE_M.Edit;
    qryCTE_MPROTOCOLO.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
      .CTe.procCTe.nProt;
    qryCTE_MXML.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].XML;
    qryCTE_MDATA.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].CTe.Ide.dhEmi;
    qryCTE_MSITUACAO.Value := 'T';
    qryCTE_M.Post;
    dmCTe.ACBrCTe.Conhecimentos.Items[0].GravarXML();
    dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;
  end;
end;

procedure TfrmCadCTe.btnTranspClick(Sender: TObject);
begin
  try
    btnTransp.Enabled := false;
    FrmCadTransp := TFrmCadTransp.Create(Application);
    dados.qryTransp.Close;
    dados.qryTransp.SQL.Text := ' select * from TRANSPORTADORA' + ' where' +
      ' empresa=:id' + ' /*where*/';
    dados.qryTransp.Params[0].Value := -1;
    dados.qryTransp.Open;

    dados.qryTransp.Insert;
    dados.qryTranspCODIGO.Value := dados.Numerador('TRANSPORTADORA', 'CODIGO',
      'N', '', '');
    dados.qryTranspATIVO.Value := 'S';
    dados.qryTranspEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryTranspUF.Value := dados.qryEmpresaUF.Value;
    dados.qryTranspCOD_CIDADE.Value := dados.qryEmpresaID_CIDADE.Value;
    dados.qryTranspCIDADE.Value := dados.qryEmpresaCIDADE.Value;
    FrmCadTransp.ShowModal;
  finally
    btnTransp.Enabled := true;
    FrmCadTransp.Release;
    qryTransp.Close;
    qryTransp.Open;

  end;
end;

procedure TfrmCadCTe.btnVeiculoClick(Sender: TObject);
begin
  try
    frmVeiculos := TfrmVeiculos.Create(Application);
    frmVeiculos.localiza;
    frmVeiculos.bbNovo.Click;
    frmVeiculos.ShowModal;
  finally
    frmVeiculos.Release;
    qryVeiculo.Close;
    qryVeiculo.Open;
  end;
end;

procedure TfrmCadCTe.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    If Application.messageBox('Tem certeza que Excluir Item?', 'Confirmação',
      mb_YesNo + mb_iconquestion) = idyes then
    begin
      qryCTE_D.Delete;
    end;
  end;
end;

procedure TfrmCadCTe.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadCTe.DBGridEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBGridEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadCTe.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  DBEdit5.SetFocus;
end;

procedure TfrmCadCTe.DBLookupComboboxEh3Change(Sender: TObject);
begin

  if qryCTE_M.Active then
  begin
    qryVeiculo_Reboque.Close;
    qryVeiculo_Reboque.Params[0].Value := qryCTE_MFK_VEICULO.Value;
    qryVeiculo_Reboque.Open;
  end;

end;

procedure TfrmCadCTe.DBLookupComboboxEh3Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBLookupComboboxEh3Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;

end;

procedure TfrmCadCTe.DBLookupComboboxEh4Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBLookupComboboxEh4Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.DBMemoEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBMemoEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.DBMemoEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadCTe.DBMemoEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadCTe.dsCTE_MDataChange(Sender: TObject; Field: TField);
begin
  estado;

end;

procedure TfrmCadCTe.dsVeiculoDataChange(Sender: TObject; Field: TField);
begin
  qryVeiculo_Reboque.Close;
  qryVeiculo_Reboque.Params[0].Value := qryVeiculoPLACA.Value;
  qryVeiculo_Reboque.Open;
end;

procedure TfrmCadCTe.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadCTe.FormCreate(Sender: TObject);
begin

  btnGravar.Caption := 'F2' + sLineBreak + 'Gravar';
  btnTransmitir.Caption := 'F3' + sLineBreak + 'Transmitir';
  btnImprimir.Caption := 'F4' + sLineBreak + 'Imprimir';
  btnImportar.Caption := 'F5' + sLineBreak + 'Importar';
  btnPessoas.Caption := 'F6' + sLineBreak + 'Destinatário';
  btnTransp.Caption := 'F7' + sLineBreak + 'Transportador';
  btnVeiculo.Caption := 'F8' + sLineBreak + 'Veículos';
  btnRemetente.Caption := 'F9' + sLineBreak + 'Remetente';
  btnSair.Caption := 'F12' + sLineBreak + 'Sair';
end;

procedure TfrmCadCTe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnGravar.Click;

  if Key = vk_f3 then
    btnTransmitir.Click;

  if Key = vk_f4 then
    btnImprimir.Click;

  if Key = VK_F5 then
    btnImportar.Click;

  if Key = VK_F6 then
    btnPessoas.Click;

  if Key = VK_F7 then
    btnTransp.Click;

  if Key = VK_F8 then
    btnVeiculo.Click;

  if Key = VK_F9 then
    btnRemetente.Click;

  if Key = VK_F12 then
    Close;

end;

procedure TfrmCadCTe.FormShow(Sender: TObject);
begin
  qryVeiculo.Close;
  qryVeiculo.Open;

  qryTransp.Close;
  qryTransp.Open;

  qryESDestino.Close;
  qryESDestino.Open;

  qryESOrigem.Close;
  qryESOrigem.Open;

  qryDestinatario.Close;
  qryDestinatario.Open;

  qryRemetente.Close;
  qryRemetente.Open;

  dados.qryCFOP.Close;
  dados.qryCFOP.Open;

  btnTransmitir.Enabled := false;
  btnPessoas.Visible := dados.vLiberaPessoa;

end;

procedure TfrmCadCTe.qryCTE_DAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCTE_DAfterEdit(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadCTe.qryCTE_DAfterInsert(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadCTe.qryCTE_DAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadCTe.qryCTE_DBeforeInsert(DataSet: TDataSet);
begin
  if not qryCFOP.Locate('CODIGO', qryCTE_MCFOP.Value, []) then
    raise Exception.Create('CFOP não encontrado!');

  if qryCTE_M.State in dsEditmodes then
    qryCTE_M.Post;
end;

procedure TfrmCadCTe.qryCTE_DNewRecord(DataSet: TDataSet);
begin
  qryCTE_DCODIGO.Value := dados.Numerador('CTE_DETALHE', 'CODIGO', 'N', '', '');
  qryCTE_DFK_CTE_MASTER.Value := qryCTE_MCODIGO.Value;
  qryCTE_DPRECO.Value := 0;
  qryCTE_DQTD.Value := 1;
end;

procedure TfrmCadCTe.qryCTE_DQTDValidate(Sender: TField);
begin
  qryCTE_DTOTAL.Value := SimpleRoundTo(qryCTE_DPRECO.AsFloat *
    qryCTE_DQTD.AsFloat, -2);
end;

procedure TfrmCadCTe.qryCTE_MAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCTE_MAfterOpen(DataSet: TDataSet);
begin
  qryCTE_D.Close;
  qryCTE_D.Open;

  qryVeiculo_Reboque.Close;
  qryVeiculo_Reboque.Params[0].Value := qryCTE_MFK_VEICULO.Value;
  qryVeiculo_Reboque.Open;

  qryCte_Seguradora.Close;
  qryCte_Seguradora.Open;

end;

procedure TfrmCadCTe.qryCTE_MAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCTE_MALIQUOTA_ICMSChange(Sender: TField);
begin
  qryCTE_MVALOR_ICMS.AsFloat :=
    SimpleRoundTo((qryCTE_MALIQUOTA_ICMS.AsFloat * qryCTE_MBASE_ICMS.AsFloat)
    / 100, -2);
end;

procedure TfrmCadCTe.qryCTE_MBeforePost(DataSet: TDataSet);
begin
  if (qryCTE_M.State = dsInsert) then
  begin

    qryPesquisaCTE.Close;
    qryPesquisaCTE.Params[0].Value := qryCTE_MNUMERO.Value;
    qryPesquisaCTE.Params[1].Value := qryCTE_MCODIGO.Value;
    qryPesquisaCTE.Params[2].Value := qryCTE_MFKEMPRESA.Value;
    qryPesquisaCTE.Open;
    if qryPesquisaCTE.RecordCount > 0 then
    begin
      showMessage('Já existe CTe com esta numeração!');
      Abort;
    end;

    GETNumero;

  end;

end;

procedure TfrmCadCTe.qryCTE_MCalcFields(DataSet: TDataSet);
begin
  if qryCTE_MSITUACAO.Value = 'A' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryCTE_MSITUACAO.Value = 'T' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryCTE_MSITUACAO.Value = 'C' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryCTE_MSITUACAO.Value = 'D' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryCTE_MSITUACAO.Value = 'I' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'INUTILIZADO';

end;

procedure TfrmCadCTe.qryCTE_MNewRecord(DataSet: TDataSet);
begin
  GETNumero;
end;

procedure TfrmCadCTe.qryCTE_MVALOR_CARGAChange(Sender: TField);
begin
  qryCTE_MBASE_ICMS.AsFloat := qryCTE_MVALOR_SERVICO.AsFloat;
end;

procedure TfrmCadCTe.qryCte_SeguradoraAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCte_SeguradoraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCte_SeguradoraBeforeInsert(DataSet: TDataSet);
begin
  if qryCTE_M.State in dsEditmodes then
    qryCTE_M.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCTe.qryCte_SeguradoraBeforePost(DataSet: TDataSet);
begin
  if (qryCte_Seguradora.State = dsInsert) then
    qryCte_SeguradoraCODIGO.Value := dados.Numerador('CTE_SEGURADORA', 'CODIGO',
      'N', '', '');
end;

procedure TfrmCadCTe.qryCte_SeguradoraNewRecord(DataSet: TDataSet);
begin
  qryCte_SeguradoraFK_CTE.Value := qryCTE_MCODIGO.Value;
  qryCte_SeguradoraRESPONSAVEL.Value := 'Emitente do CT-e';
  qryCte_SeguradoraVALOR_SEGURADO.AsFloat := qryCTE_MVALOR_CARGA.AsFloat;
end;

procedure TfrmCadCTe.btnImportarClick(Sender: TObject);
begin
  if (trim(DBLookupComboboxEh4.Text) = '') then
  begin
    showMessage('Informe a Natureza de operação, antes de importar');
    DBLookupComboboxEh4.SetFocus;
    exit;
  end;

  try
    frmImportarcte := TfrmImportarcte.Create(Application);
    frmImportarcte.ShowModal;
  except
    frmImportarcte.Release;
    qryDestinatario.Close;
    qryDestinatario.Open;
  end;
end;

procedure TfrmCadCTe.btnImprimirClick(Sender: TObject);
begin
  try
    dmCTe.ConfiguraCTe;
    btnImprimir.Enabled := false;
    if (qryCTE_MSITUACAO.Value = 'T') then
    begin
      dmCTe.ACBrCTe.Conhecimentos.Clear;
      dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);
      dmCTe.ACBrCTe.Conhecimentos.Imprimir;
      dmCTe.ACBrCTe.DACTE.PathPDF := dados.qryConfigPATH_PDF_CTE.Value;

      dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;
      dmCTe.ACBrCTe.Conhecimentos.GravarXML();
    end;
  finally
    btnImprimir.Enabled := true;
  end;

end;

procedure TfrmCadCTe.estado;
begin
  btnGravar.Enabled := qryCTE_MSITUACAO.Value = 'A';
  btnTransmitir.Enabled := qryCTE_MSITUACAO.Value = 'A';
  btnImprimir.Enabled := (qryCTE_MSITUACAO.Value = 'T');
  btnImportar.Enabled := qryCTE_MSITUACAO.Value = 'A';
  Panel3.Enabled := qryCTE_MSITUACAO.Value = 'A';
  DBGridEh1.ReadOnly := qryCTE_MSITUACAO.Value <> 'A';
  TabSheet1.Enabled := qryCTE_MSITUACAO.Value = 'A';
  TabSheet7.Enabled := qryCTE_MSITUACAO.Value = 'A';
  TabSheet8.Enabled := qryCTE_MSITUACAO.Value = 'A';
  TabSheet4.Enabled := qryCTE_MSITUACAO.Value = 'A';
  TabSheet2.Enabled := qryCTE_MSITUACAO.Value = 'A';
end;

procedure TfrmCadCTe.btnPessoasClick(Sender: TObject);
begin
  try
    frmDestinatario := TfrmDestinatario.Create(Application);
    frmDestinatario.localiza;
    frmDestinatario.ShowModal;
  finally
    frmDestinatario.Release;
    qryDestinatario.Close;
    qryDestinatario.Open;
  end;
end;

procedure TfrmCadCTe.btnRemetenteClick(Sender: TObject);
begin
  try
    frmRemetente := TfrmRemetente.Create(Application);
    frmRemetente.ShowModal;
  finally
    frmRemetente.Release;
    qryRemetente.Close;
    qryRemetente.Open;
  end;
end;

end.
