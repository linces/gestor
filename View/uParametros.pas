
unit uParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, DBGridEh, Vcl.StdCtrls,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, Vcl.Buttons, Vcl.ExtCtrls, frxClass,
  frxExportPDF, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxExportBaseDialog;

type
  TFrmParametros = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    btnImp: TSpeedButton;
    bbSair: TSpeedButton;
    frxReport: TfrxReport;
    frxDBRel: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    PnTipo: TPanel;
    lblTitulo: TLabel;
    PnCliente: TPanel;
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    PnVendedor: TPanel;
    Label2: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    PnPeríodo: TPanel;
    chkPeriodo: TCheckBox;
    MaskFim: TDateTimePicker;
    MaskInicio: TDateTimePicker;
    PnSituacao: TPanel;
    cbSituacao: TComboBox;
    Label4: TLabel;
    qryRelatorio: TFDQuery;
    dsClientes: TDataSource;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesCLI: TStringField;
    qryVendedor: TFDQuery;
    dsVendedor: TDataSource;
    dsCompra: TDataSource;
    frxDBCompra: TfrxDBDataset;
    qryForne: TFDQuery;
    qryForneCODIGO: TIntegerField;
    qryForneRAZAO: TStringField;
    qryForneCNPJ: TStringField;
    qryForneFORN: TStringField;
    dsForne: TDataSource;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    PnFornecedor: TPanel;
    Label3: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    cbTipo: TComboBox;
    qryItensVenda: TFDQuery;
    dsRelatorio: TDataSource;
    frxDBItensV: TfrxDBDataset;
    qryRelatorioTTOTAL: TAggregateField;
    qryItensVendaCODIGO: TIntegerField;
    qryItensVendaFKVENDA: TIntegerField;
    qryItensVendaID_PRODUTO: TIntegerField;
    qryItensVendaITEM: TSmallintField;
    qryItensVendaCOD_BARRA: TStringField;
    qryItensVendaSITUACAO: TStringField;
    qryItensVendaUNIDADE: TStringField;
    qryItensVendaDESCRICAO: TStringField;
    qryCompraD: TFDQuery;
    PnOrdem: TPanel;
    Label5: TLabel;
    cbOrdem: TComboBox;
    qryItensCo: TFDQuery;
    qryCompraDID: TIntegerField;
    qryCompraDEMPRESA: TSmallintField;
    qryCompraDDTENTRADA: TDateField;
    qryCompraDDTEMISSAO: TDateField;
    qryCompraDFORNECEDOR: TIntegerField;
    qryCompraDMODELO: TStringField;
    qryCompraDSERIE: TStringField;
    qryCompraDCHAVE: TStringField;
    qryCompraDNR_NOTA: TStringField;
    qryCompraDGERA_CP: TStringField;
    qryCompraDGERA_ES: TStringField;
    qryCompraDAJUSTA_PC: TStringField;
    qryCompraDAJUSTA_PV: TStringField;
    qryCompraDEHFISCAL: TStringField;
    qryCompraDLEUXML: TStringField;
    qryCompraDSTATUS: TStringField;
    qryCompraDXML: TMemoField;
    qryCompraDTIPO: TStringField;
    qryCompraDRAZAO: TStringField;
    qryItensCoID: TIntegerField;
    qryItensCoFK_COMPRA: TIntegerField;
    qryItensCoEMPRESA: TSmallintField;
    qryItensCoITEM: TSmallintField;
    qryItensCoFK_PRODUTO: TIntegerField;
    qryItensCoFK_PRODUTO_FORN: TStringField;
    qryItensCoCFOP: TStringField;
    qryItensCoCST_ICM: TStringField;
    qryItensCoGERA_CP: TStringField;
    qryItensCoGERA_ES: TStringField;
    qryItensCoSITUACAO: TStringField;
    qryItensCoDESCRICAO: TStringField;
    qryItensCoFK_PRODUTO_FORN_1: TStringField;
    frxDBCompraD: TfrxDBDataset;
    frxDBItensCO: TfrxDBDataset;
    dsCompraD: TDataSource;
    qryCompraDSUBTOTAL: TFMTBCDField;
    qryCompraDFRETE: TFMTBCDField;
    qryCompraDDESPESAS: TFMTBCDField;
    qryCompraDSEGURO: TFMTBCDField;
    qryCompraDDESCONTO: TFMTBCDField;
    qryCompraDBASE_IPI: TFMTBCDField;
    qryCompraDTOTAL_IPI: TFMTBCDField;
    qryCompraDBASE_ICM: TFMTBCDField;
    qryCompraDTOTAL_ICM: TFMTBCDField;
    qryCompraDBASE_ST: TFMTBCDField;
    qryCompraDTOTAL_ST: TFMTBCDField;
    qryCompraDBASE_PIS: TFMTBCDField;
    qryCompraDTOTAL_PIS: TFMTBCDField;
    qryCompraDBASE_COF: TFMTBCDField;
    qryCompraDTOTAL_COF: TFMTBCDField;
    qryCompraDTOTAL: TFMTBCDField;
    qryItensCoVL_UNITARIO: TFMTBCDField;
    qryItensCoQTD: TFMTBCDField;
    qryItensCoE_MEDIO: TFMTBCDField;
    qryItensCoVL_ITEM: TFMTBCDField;
    qryItensCoBASE_IPI: TFMTBCDField;
    qryItensCoALIQ_IPI: TFMTBCDField;
    qryItensCoVL_IPI: TFMTBCDField;
    qryItensCoBASE_ICMS: TFMTBCDField;
    qryItensCoALIQ_ICMS: TFMTBCDField;
    qryItensCoVL_ICMS: TFMTBCDField;
    qryItensCoBASE_ST: TFMTBCDField;
    qryItensCoVL_ST: TFMTBCDField;
    qryItensCoBASE_PIS: TFMTBCDField;
    qryItensCoALIQ_PIS: TFMTBCDField;
    qryItensCoVL_PIS: TFMTBCDField;
    qryItensCoBASE_COF: TFMTBCDField;
    qryItensCoALIQ_COF: TFMTBCDField;
    qryItensCoVL_COF: TFMTBCDField;
    qryItensCoFRETE1: TFMTBCDField;
    qryItensCoDESPESA: TFMTBCDField;
    qryItensCoSEGURO: TFMTBCDField;
    qryItensCoDESCONTO: TFMTBCDField;
    qryItensCoCST_PIS: TStringField;
    qryItensCoCST_COF: TStringField;
    qryItensCoCST_IPI: TStringField;
    qryItensCoALIQ_ST: TFMTBCDField;
    qryItensCoFK_USUARIO: TIntegerField;
    qryItensVendaQTD: TFMTBCDField;
    qryItensVendaE_MEDIO: TFMTBCDField;
    qryItensVendaPRECO: TFMTBCDField;
    qryItensVendaVALOR_ITEM: TFMTBCDField;
    qryItensVendaVDESCONTO: TFMTBCDField;
    qryItensVendaTOTAL: TFMTBCDField;
    qryItensVendaQTD_DEVOLVIDA: TFMTBCDField;
    qryItensVendaACRESCIMO: TFMTBCDField;
    qryVendasFPG: TFDQuery;
    frxDBFPG: TfrxDBDataset;
    qryVendasFPGDESCRICAO: TStringField;
    qryVendasFPGVALOR: TFMTBCDField;
    qryRelatorioEMISSAO: TDateField;
    qryRelatorioNUMERO: TIntegerField;
    qryRelatorioCLIENTE: TStringField;
    qryRelatorioVENDEDOR: TStringField;
    qryRelatorioTOTAL: TFMTBCDField;
    qryRelatorioTIPO: TStringField;
    qryRelatorioSUBTOTAL: TFMTBCDField;
    qryRelatorioDESCONTO: TFMTBCDField;
    qryRelatorioACRESCIMO: TFMTBCDField;
    qryItensNFe: TFDQuery;
    qryItensNFeID_PRODUTO: TIntegerField;
    qryItensNFeDESCRICAO: TStringField;
    qryItensNFeQTD: TFMTBCDField;
    qryItensNFePRECO: TFMTBCDField;
    qryItensNFeTOTAL: TFMTBCDField;
    frxDBItensNFe: TfrxDBDataset;
    qryNFE_FPG: TFDQuery;
    qryNFE_FPGDESCRICAO: TStringField;
    qryNFE_FPGVALOR: TFMTBCDField;
    frxDBFPG_NFE: TfrxDBDataset;
    qryVendas: TFDQuery;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    qryVendasFornecedor: TFDQuery;
    qryVendasFornecedorCODIGO: TIntegerField;
    qryVendasFornecedorFKVENDA: TIntegerField;
    qryVendasFornecedorID_PRODUTO: TIntegerField;
    qryVendasFornecedorITEM: TSmallintField;
    qryVendasFornecedorCOD_BARRA: TStringField;
    qryVendasFornecedorQTD: TFMTBCDField;
    qryVendasFornecedorE_MEDIO: TFMTBCDField;
    qryVendasFornecedorPRECO: TFMTBCDField;
    qryVendasFornecedorVALOR_ITEM: TFMTBCDField;
    qryVendasFornecedorVDESCONTO: TFMTBCDField;
    qryVendasFornecedorTOTAL: TFMTBCDField;
    qryVendasFornecedorSITUACAO: TStringField;
    qryVendasFornecedorUNIDADE: TStringField;
    qryVendasFornecedorQTD_DEVOLVIDA: TFMTBCDField;
    qryVendasFornecedorACRESCIMO: TFMTBCDField;
    qryVendasFornecedorOS: TStringField;
    qryVendasFornecedorFK_GRADE: TIntegerField;
    qryVendasFornecedorID_PRODUTO_SIMILAR: TIntegerField;
    qryVendasFornecedorID_SERIAL: TIntegerField;
    qryVendasFornecedorFK_MESA: TIntegerField;
    qryVendasFornecedorQTD_RESTANTE: TFMTBCDField;
    qryVendasFornecedorOBSERVACAO: TStringField;
    qryVendasFornecedorVALORCOMISSAOFORNECEDOR: TFMTBCDField;
    qryVendasFornecedorFKFORNECEDOR: TIntegerField;
    qryVendasFornecedorDATA_VENDA: TDateField;
    dsVendasFornecedor: TDataSource;
    frxVendasFornecedor: TfrxDBDataset;
    qryFornecedor: TFDQuery;
    frxFornecedor: TfrxDBDataset;
    qryFornecedorEMPRESA: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorTIPO: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryFornecedorIE: TStringField;
    qryFornecedorFANTASIA: TStringField;
    qryFornecedorENDERECO: TStringField;
    qryFornecedorNUMERO: TStringField;
    qryFornecedorCOMPLEMENTO: TStringField;
    qryFornecedorCODMUN: TIntegerField;
    qryFornecedorMUNICIPIO: TStringField;
    qryFornecedorBAIRRO: TStringField;
    qryFornecedorUF: TStringField;
    qryFornecedorCEP: TStringField;
    qryFornecedorFONE1: TStringField;
    qryFornecedorFONE2: TStringField;
    qryFornecedorCELULAR1: TStringField;
    qryFornecedorCELULAR2: TStringField;
    qryFornecedorEMAIL1: TStringField;
    qryFornecedorEMAIL2: TStringField;
    qryFornecedorFOTO: TBlobField;
    qryFornecedorSEXO: TStringField;
    qryFornecedorDT_NASC: TDateField;
    qryFornecedorECIVIL: TStringField;
    qryFornecedorLIMITE: TFMTBCDField;
    qryFornecedorDIA_PGTO: TSmallintField;
    qryFornecedorOBS: TMemoField;
    qryFornecedorNUM_USU: TSmallintField;
    qryFornecedorFATURA: TStringField;
    qryFornecedorCHEQUE: TStringField;
    qryFornecedorCCF: TStringField;
    qryFornecedorSPC: TStringField;
    qryFornecedorISENTO: TStringField;
    qryFornecedorFORN: TStringField;
    qryFornecedorFUN: TStringField;
    qryFornecedorCLI: TStringField;
    qryFornecedorFAB: TStringField;
    qryFornecedorTRAN: TStringField;
    qryFornecedorADM: TStringField;
    qryFornecedorATIVO: TStringField;
    qryFornecedorDT_ADMISSAO: TDateField;
    qryFornecedorDT_DEMISSAO: TDateField;
    qryFornecedorSALARIO: TFMTBCDField;
    qryFornecedorPAI: TStringField;
    qryFornecedorMAE: TStringField;
    qryFornecedorBANCO: TStringField;
    qryFornecedorAGENCIA: TStringField;
    qryFornecedorGERENTE: TStringField;
    qryFornecedorFONE_GERENTE: TStringField;
    qryFornecedorPROPRIEDADE: TStringField;
    qryFornecedorDT_CADASTRO: TDateField;
    qryFornecedorTECNICO: TStringField;
    qryFornecedorATENDENTE: TStringField;
    qryFornecedorCODIGO_WEB: TIntegerField;
    qryFornecedorREFERENCIA: TIntegerField;
    qryFornecedorFLAG: TStringField;
    qryFornecedorTIPO_RECEBIMENTO: TStringField;
    qryFornecedorPARC: TStringField;
    qryFornecedorREGIME_TRIBUTARIO: TStringField;
    qryFornecedorWHATSAPP: TStringField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorCOMISSAOPERCENT: TFMTBCDField;
    qryFornecedorCOMISSAOVALOR: TFMTBCDField;
    qryVendasFornecedorEMPRESA: TSmallintField;
    qryVendasFornecedorCODIGO_1: TIntegerField;
    qryVendasFornecedorTIPO: TStringField;
    qryVendasFornecedorCNPJ: TStringField;
    qryVendasFornecedorIE: TStringField;
    qryVendasFornecedorFANTASIA: TStringField;
    qryVendasFornecedorENDERECO: TStringField;
    qryVendasFornecedorNUMERO: TStringField;
    qryVendasFornecedorCOMPLEMENTO: TStringField;
    qryVendasFornecedorCODMUN: TIntegerField;
    qryVendasFornecedorMUNICIPIO: TStringField;
    qryVendasFornecedorBAIRRO: TStringField;
    qryVendasFornecedorUF: TStringField;
    qryVendasFornecedorCEP: TStringField;
    qryVendasFornecedorFONE1: TStringField;
    qryVendasFornecedorFONE2: TStringField;
    qryVendasFornecedorCELULAR1: TStringField;
    qryVendasFornecedorCELULAR2: TStringField;
    qryVendasFornecedorEMAIL1: TStringField;
    qryVendasFornecedorEMAIL2: TStringField;
    qryVendasFornecedorFOTO: TBlobField;
    qryVendasFornecedorSEXO: TStringField;
    qryVendasFornecedorDT_NASC: TDateField;
    qryVendasFornecedorECIVIL: TStringField;
    qryVendasFornecedorLIMITE: TFMTBCDField;
    qryVendasFornecedorDIA_PGTO: TSmallintField;
    qryVendasFornecedorOBS: TMemoField;
    qryVendasFornecedorNUM_USU: TSmallintField;
    qryVendasFornecedorFATURA: TStringField;
    qryVendasFornecedorCHEQUE: TStringField;
    qryVendasFornecedorCCF: TStringField;
    qryVendasFornecedorSPC: TStringField;
    qryVendasFornecedorISENTO: TStringField;
    qryVendasFornecedorFORN: TStringField;
    qryVendasFornecedorFUN: TStringField;
    qryVendasFornecedorCLI: TStringField;
    qryVendasFornecedorFAB: TStringField;
    qryVendasFornecedorTRAN: TStringField;
    qryVendasFornecedorADM: TStringField;
    qryVendasFornecedorATIVO: TStringField;
    qryVendasFornecedorDT_ADMISSAO: TDateField;
    qryVendasFornecedorDT_DEMISSAO: TDateField;
    qryVendasFornecedorSALARIO: TFMTBCDField;
    qryVendasFornecedorPAI: TStringField;
    qryVendasFornecedorMAE: TStringField;
    qryVendasFornecedorBANCO: TStringField;
    qryVendasFornecedorAGENCIA: TStringField;
    qryVendasFornecedorGERENTE: TStringField;
    qryVendasFornecedorFONE_GERENTE: TStringField;
    qryVendasFornecedorPROPRIEDADE: TStringField;
    qryVendasFornecedorDT_CADASTRO: TDateField;
    qryVendasFornecedorTECNICO: TStringField;
    qryVendasFornecedorATENDENTE: TStringField;
    qryVendasFornecedorCODIGO_WEB: TIntegerField;
    qryVendasFornecedorREFERENCIA: TIntegerField;
    qryVendasFornecedorFLAG: TStringField;
    qryVendasFornecedorTIPO_RECEBIMENTO: TStringField;
    qryVendasFornecedorPARC: TStringField;
    qryVendasFornecedorREGIME_TRIBUTARIO: TStringField;
    qryVendasFornecedorWHATSAPP: TStringField;
    qryVendasFornecedorRAZAO: TStringField;
    qryVendasFornecedorCOMISSAOPERCENT: TFMTBCDField;
    qryVendasFornecedorCOMISSAOVALOR: TFMTBCDField;
    procedure bbSairClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure qryCompraDAfterOpen(DataSet: TDataSet);
    procedure dsRelatorioDataChange(Sender: TObject; Field: TField);
  private
    procedure FiltarHistoricoVenda(Opcao: string);
    { Private declarations }
  public
    vtipo: string;
    { Public declarations }
  end;

var
  FrmParametros: TFrmParametros;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmParametros.bbSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmParametros.btnImpClick(Sender: TObject);
begin
  FiltarHistoricoVenda(vtipo);
end;

procedure TFrmParametros.dsRelatorioDataChange(Sender: TObject; Field: TField);
begin
  qryVendasFPG.close;
  qryNFE_FPG.close;
 if qryRelatorioTIPO.Value='PDV' then begin
  qryVendasFPG.Params[0].Value := qryRelatorioNUMERO.Value;
  qryVendasFPG.Open;
 end;
 if qryRelatorioTIPO.Value='NFE' then begin
  qryNFE_FPG.Params[0].Value := qryRelatorioNUMERO.Value;
  qryNFE_FPG.Open;
 end;
end;

procedure TFrmParametros.FiltarHistoricoVenda(Opcao: string);
var
  ordem, filtro, filtro1: string;
  data1, data2: tdate;
begin

  if (Opcao = '1') or (Opcao = '2') or (Opcao = '4') then
  begin // Histórico Resumido de Vendas por Clientes
    qryRelatorio.SQL.Clear;
    qryRelatorio.SQL.Clear;

    qryRelatorio.SQL.add
      ('select tipo, emissao, numero, cliente, vendedor, subtotal, desconto, acrescimo, total from (');
    qryRelatorio.SQL.add
      ('select ''PDV'' AS tipo, vm.data_emissao as emissao, vm.codigo as numero, VM.subtotal, VM.desconto, VM.acrescimo, vm.total, cli.razao cliente, ven.nome vendedor from Vendas_Master VM');
    qryRelatorio.SQL.add('left join pessoa cli on cli.codigo=vm.id_cliente');
    qryRelatorio.SQL.add
      ('left join vendedores ven on ven.codigo=vm.fk_vendedor');
    qryRelatorio.SQL.add('where');
    qryRelatorio.SQL.add('(VM.situacao <>''C'') and (vm.situacao<>''A'')');
    qryRelatorio.SQL.add('and data_emissao>=:data1 and data_emissao<=:data2');
    qryRelatorio.SQL.add('/*where*/');
    qryRelatorio.SQL.add('union all');
    qryRelatorio.SQL.add
      ('select ''NFE'' as tipo, nm.data_emissao as emissao, nm.numero as numero, NM.subtotal, NM.desconto, (NM.despesas+NM.frete+NM.outros+NM.total_ipi+NM.seguro)AS ACRESCIMOS ,nm.total, cli.razao cliente, ven.nome vendedor from nfe_master NM');
    qryRelatorio.SQL.add('left join pessoa cli on cli.codigo=nm.id_cliente');
    qryRelatorio.SQL.add
      ('left join vendedores VEN on ven.codigo=nm.fk_vendedor');
    qryRelatorio.SQL.add('where');
    qryRelatorio.SQL.add
      ('nm.situacao =''2'' and (not (fkvenda>0)) and (not(gera_es=''S''))');
    qryRelatorio.SQL.add('and data_emissao>=:data1 and data_emissao<=:data2');
    qryRelatorio.SQL.add('/*where1*/)');
    qryRelatorio.SQL.add('/*ordem*/');

    data1 := strtodate('01/01/1900');
    data2 := strtodate('31/12/9999');

    if DBLookupComboboxEh2.KeyValue <> null then
      if DBLookupComboboxEh2.KeyValue <> 0 then
      begin
        filtro := filtro + ' AND vm.id_cliente=' +
          inttostr(DBLookupComboboxEh2.KeyValue);
        filtro1 := filtro1 + ' AND nm.id_cliente=' +
          inttostr(DBLookupComboboxEh2.KeyValue);
      end;

    if DBLookupComboboxEh3.KeyValue <> null then
      if DBLookupComboboxEh3.KeyValue <> 0 then
      begin
        filtro := filtro + ' AND vm.fk_vendedor=' +
          inttostr(DBLookupComboboxEh3.KeyValue);
        filtro1 := filtro1 + ' AND nm.fk_vendedor=' +
          inttostr(DBLookupComboboxEh3.KeyValue);

      end;

    if chkPeriodo.Checked then
    begin
      data1 := MaskInicio.Date;
      data2 := MaskFim.Date;
    end;

    case cbOrdem.ItemIndex of
      0:
        ordem := ' order by EMISSAO, NUMERO';
      1:
        ordem := ' order by TOTAL DESC, NUMERO';
    end;

    qryRelatorio.close;
    qryRelatorio.SQL.Text := StringReplace(qryRelatorio.SQL.Text, '/*where*/',
      filtro, [rfReplaceAll]);
    qryRelatorio.SQL.Text := StringReplace(qryRelatorio.SQL.Text, '/*where1*/',
      filtro1, [rfReplaceAll]);
    qryRelatorio.SQL.Text := StringReplace(qryRelatorio.SQL.Text, '/*ordem*/',
      ordem, [rfReplaceAll]);
    qryRelatorio.Params[0].AsDate := data1;
    qryRelatorio.Params[1].AsDate := data2;
    qryRelatorio.Open;

    qryItensVenda.close;
    if qryRelatorioTIPO.Value = 'PDV' then
      qryItensVenda.Open;

    qryItensNFe.close;
    if qryRelatorioTIPO.Value = 'NFE' then
      qryItensNFe.Open;


    if cbTipo.ItemIndex = 0 then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelHist_Vendas.fr3');
    if cbTipo.ItemIndex = 1 then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelHist_Vendas_D.fr3');

    frxReport.ShowReport;

  end;

  if vtipo = '3' then
  begin // Relatório de compras

    if cbTipo.Text = 'RESUMIDO' then
    begin
      dados.qryCompra.SQL.Clear;
      dados.qryCompra.SQL.add('select co.*, pes.razao from compra co');
      dados.qryCompra.SQL.add
        ('left join pessoa pes on pes.codigo=co.fornecedor');
      dados.qryCompra.SQL.add('where');
      dados.qryCompra.SQL.add('pes.forn=''S'' and');
      if cbOrdem.ItemIndex = 0 then
        dados.qryCompra.SQL.add('CO.DTEMISSAO>=:DATA1 AND CO.DTEMISSAO<=:DATA');
      if cbOrdem.ItemIndex = 1 then
        dados.qryCompra.SQL.add('CO.DTENTRADA>=:DATA1 AND CO.DTENTRADA<=:DATA');
      dados.qryCompra.SQL.add('AND CO.STATUS=''F''');
      dados.qryCompra.SQL.add('/*where*/');
      dados.qryCompra.SQL.add('/*ordem*/');

      dados.qryExecute.close;
      dados.qryExecute.SQL.Text :=
        'select min(dtemissao) menor, max(dtemissao) maior from COMPRA CO where STATUS=''F''';
      dados.qryExecute.Open;

      data1 := dados.qryExecute.Fields[0].AsDateTime;
      data2 := dados.qryExecute.Fields[1].AsDateTime;

      if DBLookupComboboxEh1.KeyValue <> null then
        if DBLookupComboboxEh1.KeyValue <> 0 then
          filtro := filtro + ' AND CO.FORNECEDOR=' +
            inttostr(DBLookupComboboxEh1.KeyValue);

      if chkPeriodo.Checked then
      begin
        data1 := MaskInicio.Date;
        data2 := MaskFim.Date;
      end;

      case cbOrdem.ItemIndex of
        0:
          ordem := ' order by CO.DTEMISSAO';
        1:
          ordem := ' order by CO.DTENTRADA';
        2:
          ordem := ' order by CO.TOTAL DESC';
      end;

      dados.qryCompra.close;

      dados.qryCompra.SQL.Text := StringReplace(dados.qryCompra.SQL.Text,
        '/*where*/', filtro + ordem, [rfReplaceAll]);

      dados.qryCompra.Params[0].AsDate := data1;
      dados.qryCompra.Params[1].AsDate := data2;

      dados.qryCompra.Open;

      if cbTipo.ItemIndex = 0 then
        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
          '\Relatorio\RelHist_Compras.fr3');
      frxReport.ShowReport;
    end
    else
    begin

      dados.qryExecute.close;
      dados.qryExecute.SQL.Text :=
        'select min(dtemissao) menor, max(dtemissao) maior from COMPRA CO where STATUS=''F''';
      dados.qryExecute.Open;

      data1 := dados.qryExecute.Fields[0].AsDateTime;
      data2 := dados.qryExecute.Fields[1].AsDateTime;

      if DBLookupComboboxEh1.KeyValue <> null then
        if DBLookupComboboxEh1.KeyValue <> 0 then
          filtro := filtro + ' AND CO.FORNECEDOR=' +
            inttostr(DBLookupComboboxEh1.KeyValue);

      if chkPeriodo.Checked then
      begin
        data1 := MaskInicio.Date;
        data2 := MaskFim.Date;
      end;

      case cbOrdem.ItemIndex of
        0:
          ordem := ' order by CO.DTEMISSAO';
        1:
          ordem := ' order by CO.DTENTRADA';
        2:
          ordem := ' order by CO.TOTAL DESC';
      end;

      qryCompraD.close;
      qryCompraD.SQL.Clear;
      qryCompraD.SQL.add('select co.*, pes.razao from compra co');
      qryCompraD.SQL.add('left join pessoa pes on pes.codigo=co.fornecedor');
      if cbOrdem.ItemIndex = 0 then
        qryCompraD.SQL.add
          ('where CO.DTEMISSAO>=:DATA1 AND CO.DTEMISSAO<=:DATA AND CO.STATUS=''F''');
      if cbOrdem.ItemIndex = 1 then
        qryCompraD.SQL.add
          ('where CO.DTENTRADA>=:DATA1 AND CO.DTENTRADA<=:DATA AND CO.STATUS=''F''');
      qryCompraD.SQL.add('/*where*/');
      qryCompraD.SQL.Text := StringReplace(qryCompraD.SQL.Text, '/*where*/',
        filtro + ordem, [rfReplaceAll]);

      qryCompraD.Params[0].AsDate := data1;
      qryCompraD.Params[1].AsDate := data2;

      qryCompraD.Open;

      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelHist_ComprasD.fr3');
      frxReport.ShowReport;

    end;
  end;

  if vtipo = '6' then
  begin // Relatório de Vendas por Fornecedor com comissão. 12/11/2020  "Linces Marques"


    qryFornecedor.SQL.Clear;


    if cbTipo.Text = 'RESUMIDO' then
    begin
     qryVendasFornecedor.SQL.Clear;
     qryVendasFornecedor.SQL.add('select vdd.*, pes.* from vendas_detalhe vdd left outer join pessoa pes on pes.codigo=:codfornecedor  where vdd.fkfornecedor=:codfornecedor ');

     qryFornecedor.SQL.Add('select * from pessoa where codigo=:codfornecedor ');

      if chkPeriodo.Checked then begin
        qryVendasFornecedor.SQL.add(' and  DATA_VENDA between :DATAINICIO and :DATAFIM');
        qryVendasFornecedor.ParamByName('DATAINICIO').AsDate :=   MaskInicio.Date;
        qryVendasFornecedor.ParamByName('DATAFIM').AsDate :=  MaskFim.Date;
      end;


      if DBLookupComboboxEh1.KeyValue <> null then begin
        if DBLookupComboboxEh1.KeyValue <> 0 then
            qryVendasFornecedor.ParamByName('codfornecedor').AsString :=   inttostr(DBLookupComboboxEh1.KeyValue);
      end;

      qryVendasFornecedor.SQL.add(' AND SITUACAO=''F''');
      qryVendasFornecedor.close;
      qryFornecedor.Close;
      qryFornecedor.Open;
      qryVendasFornecedor.Open;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Relatorio\RelComissaoFornecedorResumido.fr3');
      frxReport.ShowReport;

    end
    else
    begin
     qryVendasFornecedor.SQL.Clear;
     qryVendasFornecedor.SQL.add('select vdd.*, pes.* from vendas_detalhe vdd left outer join pessoa pes on pes.codigo=:codfornecedor  where vdd.fkfornecedor=:codfornecedor ');

     qryFornecedor.SQL.Add('select * from pessoa where codigo=:codfornecedor ');

      if chkPeriodo.Checked then begin
        qryVendasFornecedor.SQL.add(' and  DATA_VENDA between :DATAINICIO and :DATAFIM');
        qryVendasFornecedor.ParamByName('DATAINICIO').AsDate :=   MaskInicio.Date;
        qryVendasFornecedor.ParamByName('DATAFIM').AsDate :=  MaskFim.Date;
      end;


      if DBLookupComboboxEh1.KeyValue <> null then begin
        if DBLookupComboboxEh1.KeyValue <> 0 then
            qryVendasFornecedor.ParamByName('codfornecedor').AsString :=   inttostr(DBLookupComboboxEh1.KeyValue);
      end;

      qryVendasFornecedor.SQL.add(' AND SITUACAO=''F''');
      qryVendasFornecedor.close;
      qryFornecedor.Close;
      qryFornecedor.Open;
      qryVendasFornecedor.Open;
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Relatorio\RelComissaoFornecedorDetalhado.fr3');
      frxReport.ShowReport;

    end;
  end;

end;

procedure TFrmParametros.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;

  qryForne.close;
  qryForne.Open;
  DBLookupComboboxEh1.KeyValue := 0;
  qryClientes.close;
  qryClientes.Open;
  DBLookupComboboxEh2.KeyValue := 0;
  qryVendedor.close;
  qryVendedor.Open;
  DBLookupComboboxEh3.KeyValue := 0;

  MaskInicio.Date := StartOfTheMonth(Date);
  MaskFim.Date := Date;

end;

procedure TFrmParametros.FormCreate(Sender: TObject);
begin
  Height := 360;
  if vtipo = '4' then
    Height := 360;
  Repaint;
end;

procedure TFrmParametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f4 then
    btnImp.Click;
  if Key = vk_escape then
    close;
end;

procedure TFrmParametros.FormShow(Sender: TObject);
begin
  if vtipo = '1' then
  begin
    Caption := 'Rel. de Vendas p/ Cliente';
    PnCliente.Visible := true;
    PnPeríodo.Visible := true;
    PnFornecedor.Visible := false;
    PnVendedor.Visible := false;
    PnSituacao.Visible := false;
    PnOrdem.Visible := true;
    PnTipo.Visible := true;
    cbOrdem.Items.Clear;
    cbOrdem.Items.add('DATA');
    cbOrdem.Items.add('VALOR');
    cbOrdem.ItemIndex := 0;
  end;

  if vtipo = '2' then
  begin
    Caption := 'Rel. de Vendas p/ Vendedor';
    PnCliente.Visible := false;
    PnFornecedor.Visible := false;
    PnVendedor.Visible := true;
    PnPeríodo.Visible := true;
    PnSituacao.Visible := false;
    PnOrdem.Visible := true;
    PnTipo.Visible := true;
    cbOrdem.Items.Clear;
    cbOrdem.Items.add('DATA');
    cbOrdem.Items.add('VALOR');
    cbOrdem.ItemIndex := 0;
  end;

  if vtipo = '3' then
  begin
    Caption := 'Histórico de Compras';
    PnCliente.Visible := false;
    PnFornecedor.Visible := true;
    PnVendedor.Visible := false;
    PnPeríodo.Visible := true;
    PnSituacao.Visible := false;
    PnOrdem.Visible := true;
    PnTipo.Visible := true;
    cbOrdem.Items.Clear;
    cbOrdem.Items.add('EMISSÃO');
    cbOrdem.Items.add('ENTRADA');
    cbOrdem.Items.add('VALOR');
    cbOrdem.ItemIndex := 0;
  end;

  if vtipo = '4' then
  begin
    Caption := 'Histórico de Vendas';
    PnCliente.Visible := true;
    PnPeríodo.Visible := true;
    PnFornecedor.Visible := false;
    PnVendedor.Visible := true;
    PnSituacao.Visible := false;
    PnOrdem.Visible := true;
    PnTipo.Visible := true;
    cbOrdem.Items.Clear;
    cbOrdem.Items.add('DATA');
    cbOrdem.Items.add('VALOR');
    cbOrdem.ItemIndex := 0;
  end;

  if vtipo = '6' then
  begin
    Caption := 'Histórico de Vendas p/ Fornecedor';
    PnCliente.Visible := false;
    PnPeríodo.Visible := true;
    PnFornecedor.Visible := true;
    PnVendedor.Visible := false;
    PnSituacao.Visible := false;
    PnOrdem.Visible := true;
    PnTipo.Visible := true;
    cbOrdem.Items.Clear;
    cbOrdem.Items.add('DATA');
    cbOrdem.Items.add('VALOR');
    cbOrdem.ItemIndex := 0;
  end;

end;

procedure TFrmParametros.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  if vtipo = '1' then
    filtro := ' CLIENTE:' + DBLookupComboboxEh2.Text;
  if vtipo = '2' then
    filtro := ' VENDEDOR:' + DBLookupComboboxEh3.Text;
  if vtipo = '3' then
    filtro := ' FORNECEDOR:' + DBLookupComboboxEh1.Text;
  if vtipo = '4' then
  begin
    filtro := ' CLIENTE:' + DBLookupComboboxEh2.Text + ' VENDEDOR:' +
      DBLookupComboboxEh3.Text;
  end;
  if (chkPeriodo.Checked) then
    filtro := filtro + ' | PERÍODO DE:' + datetostr(MaskInicio.Date) + ' ATÉ ' +
      datetostr(MaskFim.Date);
  if VarName = 'PARAMETRO' then
  begin
    Value := filtro;
  end;

end;

procedure TFrmParametros.qryCompraDAfterOpen(DataSet: TDataSet);
begin
  qryItensCo.close;
  qryItensCo.Open;
end;

end.
