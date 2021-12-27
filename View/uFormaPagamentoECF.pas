{ SITUAÇÃO DA VENDA
  0:ABERTA
  1:GERADA
  2:TRANSMITIDA
  3:INUTILIZADA
  4:DUPLICIDADE
  5:PEDIDO
  6:CANCELADA
}
unit uFormaPagamentoECF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, blcksock, winInet,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, pcnConversao, pcnConversaoNFe, acbrUtil,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, math, ACBrPosPrinter, ACBrDFeSSL,
  Vcl.ComCtrls, Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Imaging.pngimage, Vcl.Menus, ACBrValidador,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF, ACBrBase, ACBrEnterTab,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrDFeReport, ACBrDFeDANFeReport,
  ACBrNFeDANFeRLClass, ACBrDFe, ACBrNFe, ACBrDANFCeFortesFrA4, ACBrTEFD,
  ACBrECF;

type
  TfrmFechaVendaECF = class(TForm)
    qryFPG: TFDQuery;
    dsFPG: TDataSource;
    qryVendasFPG: TFDQuery;
    qryVendasFPGCODIGO: TIntegerField;
    qryVendasFPGVENDAS_MASTER: TIntegerField;
    qryVendasFPGID_FORMA: TIntegerField;
    qryVendasFPGDESCRICAO: TStringField;
    dsVendasFPG: TDataSource;
    qryVendasFPGVIRTUAL_FORMA: TStringField;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    PageControl1: TPageControl;
    TabPrecoNormal: TTabSheet;
    Panel1: TPanel;
    Panel7: TPanel;
    GroupBox4: TGroupBox;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    qryProduto: TFDQuery;
    DBGridEh1: TDBGridEh;
    ACBrEnterTab1: TACBrEnterTab;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoTIPO: TStringField;
    qryProdutoCSTICMS: TStringField;
    qryProdutoCFOP: TStringField;
    qryProdutoCSOSN: TStringField;
    qryProdutoCSTE: TStringField;
    qryProdutoCSTS: TStringField;
    qryProdutoNCM: TStringField;
    qryProdutoCODBARRA: TStringField;
    qryFPGTIPO: TStringField;
    qryVendasFPGVIRTUAL_TIPO: TStringField;
    Memo1: TMemo;
    Bevel2: TBevel;
    qryFPGDIAS: TSmallintField;
    qryVendasFPGBAIXADO: TStringField;
    qryVendasFPGFK_USUARIO: TIntegerField;
    qrySomaNFCe: TFDQuery;
    qryIBPT: TFDQuery;
    qryIBPTCODIGO: TStringField;
    qryIBPTEX: TStringField;
    qryIBPTTIPO: TStringField;
    qryIBPTDESCRICAO: TStringField;
    qryIBPTNACIONALFEDERAL: TStringField;
    qryIBPTIMPORTADOSFEDERAL: TStringField;
    qryIBPTESTADUAL: TStringField;
    qryIBPTMUNICIPAL: TStringField;
    qryIBPTVIGENCIAINICIO: TStringField;
    qryIBPTVIGENCIAFIM: TStringField;
    qryIBPTCHAVE: TStringField;
    qryIBPTVERSAO: TStringField;
    qryIBPTFONTE: TStringField;
    qryFPGGERACR: TStringField;
    qryFPGGERACH: TStringField;
    qryFPGECARTAO: TStringField;
    qryFPGUSAVD: TStringField;
    qryFPGUSACR: TStringField;
    qryFPGATIVO: TStringField;
    qryFPGINTERVALO: TIntegerField;
    qryFPGFKCONTADESTINO: TIntegerField;
    qrySomaParcela: TFDQuery;
    PopupMenu1: TPopupMenu;
    Pedido1: TMenuItem;
    FinalizarPedido1: TMenuItem;
    ACBrValidador1: TACBrValidador;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBPV: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    Panel8: TPanel;
    btnConcluir: TBitBtn;
    btnCancelar: TBitBtn;
    qryVendasFPGLOTE: TSmallintField;
    qryVendasFPGSITUACAO: TStringField;
    qryVendasFPGTIPO: TStringField;
    qryVendasFPGTTOTAL: TAggregateField;
    qryProdutoPR_VENDA: TFMTBCDField;
    qryProdutoALIQ_ICM: TCurrencyField;
    qryProdutoALIQ_PIS: TCurrencyField;
    qryProdutoALIQ_COF: TCurrencyField;
    qryProdutoNACIONALFEDERAL: TStringField;
    qryProdutoIMPORTADOSFEDERAL: TStringField;
    qryProdutoESTADUAL: TStringField;
    qryProdutoMUNICIPAL: TStringField;
    qryFPGTAXA: TFMTBCDField;
    qryFPGENTRADA: TFMTBCDField;
    qryFPGPARCELAS: TIntegerField;
    qrySomaNFCeTOTAL: TFMTBCDField;
    qrySomaNFCeBASE_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_PIS_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_PIS_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_COF_ICMS: TFMTBCDField;
    qrySomaNFCeVALOR_COF_ICMS: TFMTBCDField;
    qrySomaNFCeBASE_ISS: TFMTBCDField;
    qrySomaNFCeVALOR_ISS: TFMTBCDField;
    qrySomaNFCeTOTALMUN: TFMTBCDField;
    qrySomaNFCeTOTALFED: TFMTBCDField;
    qrySomaNFCeTOTALEST: TFMTBCDField;
    qrySomaNFCeTOTALIMP: TFMTBCDField;
    qrySomaNFCeDESCONTOS: TFMTBCDField;
    qrySomaNFCeOUTROS: TFMTBCDField;
    qryVendasFPGVALOR: TFMTBCDField;
    pnTabPreco: TPanel;
    Label17: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    pnSubtotal: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    PnDesconto: TPanel;
    Label10: TLabel;
    edtPercenutal: TDBEdit;
    edtDesconto: TDBEdit;
    pnACrescimo: TPanel;
    Label18: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    PnTotal: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Panel2: TPanel;
    PageControl2: TPageControl;
    Totais: TTabSheet;
    Label7: TLabel;
    Label2: TLabel;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    qrySomaDinheiro: TFDQuery;
    qrySomaDinheiroDINHEIRO: TFMTBCDField;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    qrySomaOutros: TFDQuery;
    qrySomaOutrosOUTROS: TFMTBCDField;
    qrySomaFPG: TFDQuery;
    qrySomaFPGTOTAL: TFMTBCDField;
    ACBrECF: TACBrECF;
    ACBrTEFD: TACBrTEFD;
    procedure DBEdit2Exit(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryVendasFPGNewRecord(DataSet: TDataSet);
    procedure qryVendasFPGBeforeOpen(DataSet: TDataSet);
    procedure qryVendasFPGBeforeInsert(DataSet: TDataSet);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryFPGAfterPost(DataSet: TDataSet);
    procedure btnOfflineClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDescontoExit(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure FinalizarPedido1Click(Sender: TObject);
    procedure edtPercenutalExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure qryVendasFPGAfterScroll(DataSet: TDataSet);
  private
    vFinalizou, notaexiste: boolean;
    mensagem, filtratipo: string;
    sSql, vPorta, TipoEmissao: string;
    vUsaGaveta, vImprime, vContingencia, voffline, vFazEntrega: boolean;
    vNumeracao, vSerie, vVias: Integer;
    function Getcomputer: String;
    procedure ImprimePedido;
    procedure GeraFinanceiro;
    procedure ImportaPedido;

    function ValidaNegocios: boolean;
    procedure RatearDesconto;
    procedure ApagaFpgZerada;
    procedure CadastraFPG;
    procedure Gera;
    procedure ImprimeA4;
    function ConfiguraECF: boolean;
    procedure VendeItem(NumNFe: String);
    procedure AbreCupom;
    procedure SubTotaliza;
    procedure EfetuarPagamento;
    { Private declarations }

  public
    { Public declarations }
    vTotalFpg: Extended;
    procedure Centraliza;
  end;

var
  frmFechaVendaECF: TfrmFechaVendaECF;

implementation

{$R *.dfm}

uses uPDV, Udados, uVendaPagar, uVendaCheque, uVendaCartao, uContaDeposito,
  uDadosWeb, ufrmStatus, uSupervisor;

procedure TfrmFechaVendaECF.AbreCupom;
begin
  ACBrECF.AbreCupom;
end;

procedure TfrmFechaVendaECF.VendeItem(NumNFe: String);
begin
  dados.qryNFCE_D.First;

  while not dados.qryNFCE_D.Eof do
  begin

    ACBrECF.VendeItem(dados.qryNFCE_DID_PRODUTO.Value,
      dados.QRYNFCE_DDESCRICAO.AsString, dados.QRYNFCE_DALIQ_ICMS.Value,
      dados.QRYNFCE_DQTD.Value, dados.QRYNFCE_DPRECO.Value,
      dados.QRYNFCE_DVALOR_ITEM.Value, dados.QRYNFCE_DVACRESCIMO.Value,
      dados.QRYNFCE_DUNIDADE.Value, '$', 'A', 0);
    qryVendasFPG.Next;
  end;

end;

procedure TfrmFechaVendaECF.SubTotaliza;
begin
  ACBrECF.SubtotalizaCupom;
end;

Procedure TfrmFechaVendaECF.EfetuarPagamento;
begin
  if dados.qryNFCE_MTOTAL.Value = frmpdv.qryVendaTOTAL.AsFloat then
  begin
    qryVendasFPG.First;
    while not qryVendasFPG.Eof do
    begin
      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'D' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin

        end;
      end;

      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'Q' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpCheque;
            vPag := qryVendasFPGVALOR.AsFloat;
          end;
        end;
      end;

      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'T' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpOutro;
            vPag := qryVendasFPGVALOR.AsFloat;
          end;
        end;
      end;

      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'C' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpCartaoCredito;
            vPag := qryVendasFPGVALOR.AsFloat;
            tpIntegra := tiPagNaoIntegrado;
          end;
        end;
      end;
      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'E' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpCartaoDebito;
            vPag := qryVendasFPGVALOR.AsFloat;
            tpIntegra := tiPagNaoIntegrado;
          end;
        end;
      end;
      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'F' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpCreditoLoja;
            vPag := qryVendasFPGVALOR.AsFloat;
          end;
        end;
      end;
      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'N' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpCreditoLoja;
            vPag := qryVendasFPGVALOR.AsFloat;
          end;
        end;
      end;
      if uppercase(qryVendasFPGVIRTUAL_TIPO.Value) = 'X' then
      begin
        if qryVendasFPGVALOR.Value > 0 then
        begin
          with pag.Add do
          begin
            tPag := fpBoletoBancario;
            vPag := qryVendasFPGVALOR.AsFloat;
          end;
        end;
      end;
      qryVendasFPG.Next;
    end;
  end
  else
  begin
    with pag.Add do
    begin
      tPag := fpDinheiro;
      vPag := dados.qryNFCE_MTOTAL.AsFloat;
    end;
  end;
end;

function TfrmFechaVendaECF.Getcomputer: String;
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TfrmFechaVendaECF.GeraFinanceiro;
var
  ValorTaxa: Extended;
begin
  // estorna lançamento

  dados.qryExecute.Close;
  dados.qryExecute.sql.Text := 'DELETE FROM CAIXA WHERE FKVENDA=:VD';
  dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

  dados.qryExecute.Close;
  dados.qryExecute.sql.Text := 'DELETE FROM CRECEBER WHERE FK_VENDA=:VD';
  dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

  dados.qryExecute.Close;
  dados.qryExecute.sql.Text := 'DELETE FROM CRECEBER WHERE FK_VENDA=:VD';
  dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

  dados.qryExecute.Close;
  dados.qryExecute.sql.Text := 'DELETE FROM CAIXA WHERE FKVENDA=:VD';
  dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

  // TROCA

  if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'T') > 0) then
  begin
    if not(frmpdv.qryVenda.State in dsEditModes) then
      frmpdv.qryVenda.Edit;
    frmpdv.qryVendaTOTAL_TROCA.Value := dados.qryconsulta.Fields[0].AsFloat;
    frmpdv.qryVenda.Post;
    dados.Conexao.CommitRetaining;
  end;

  // DINHEIRO

  if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'D') > 0) then
  begin

    dados.qryCaixa.Close;
    dados.qryCaixa.Params[0].Value := -1;
    dados.qryCaixa.Open;

    dados.qryCaixa.Insert;
    dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
      'N', '', '');
    dados.qryCaixaEMISSAO.Value := date;
    dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryCaixaEMISSAO.Value := date;
    dados.qryCaixaTIPO_MOVIMENTO.Value := 'VA';
    dados.qryCaixaDOC.Value := frmpdv.qryVendaCODIGO.AsString;
    dados.qryCaixaHISTORICO.Value := 'VENDA Nº' + frmpdv.qryVendaCODIGO.AsString
      + ' - DINHEIRO';
    dados.qryCaixaENTRADA.Value := dados.qryconsulta.Fields[0].AsFloat;
    dados.qryCaixaSAIDA.Value := 0;
    dados.qryCaixaHORA_EMISSAO.Value := time;
    dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
    dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_VENDA.Value;
    dados.qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;
    dados.qryCaixaFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryCaixaTRANSFERENCIA.Value := 0;
    dados.qryCaixaFPG.Value := dados.buscafpg('D');
    dados.qryCaixa.Post;
  end;

  // CHEQUES

  if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'Q') > 0) then
  begin
    try
      frmCRParcela := tfrmCRParcela.Create(Application);
      frmCRParcela.edtTotal.Text :=
        FormatFloat('0.00', dados.qryconsulta.Fields[0].Value);
      frmCRParcela.vValor := dados.qryconsulta.Fields[0].AsFloat;
      frmCRParcela.idVenda := frmpdv.qryVendaCODIGO.Value;
      frmCRParcela.idCliente := frmpdv.qryVendaID_CLIENTE.Value;
      frmCRParcela.eCheque := true;
      dados.vChamaImpressao := false;
      frmCRParcela.ShowModal;
    finally
      frmCRParcela.Release;
    end;
  end;



  // forma de pagamento a prazo

  if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'F') > 0 then
  begin

    try
      frmCRParcela := tfrmCRParcela.Create(Application);
      frmCRParcela.edtTotal.Text :=
        FormatFloat('0.00', dados.qryconsulta.Fields[0].Value);
      frmCRParcela.vValor := dados.qryconsulta.Fields[0].AsFloat;
      frmCRParcela.idVenda := frmpdv.qryVendaCODIGO.Value;
      frmCRParcela.idCliente := frmpdv.qryVendaID_CLIENTE.Value;
      frmCRParcela.eCheque := false;
      dados.vChamaImpressao := false;
      frmCRParcela.ShowModal;
    finally
      frmCRParcela.Release;
    end;
  end;

  // forma de pagamento depósito

  if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'X') > 0 then
  begin
    try
      FrmContaDeposito := tFrmContaDeposito.Create(Application);
      dados.vChamaImpressao := false;
      FrmContaDeposito.idCodigo := frmpdv.qryVendaCODIGO.Value;
      FrmContaDeposito.vValor := frmpdv.qryVendaTOTAL.AsFloat;
      FrmContaDeposito.ShowModal;
    finally
      FrmContaDeposito.Release;

    end;
  end;

  // forma de pagamento a cartao de crédito

  if dados.qryEmpresaLANCAR_CARTAO_CREDITO.AsString = 'S' then
  begin
    if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'C') > 0 then
    begin

      dados.qryExecute.Close;
      dados.qryExecute.sql.Clear;
      dados.qryExecute.sql.Add
        (' select fpg.id_forma, coalesce(SUM(fpg.valor),0) as valor');
      dados.qryExecute.sql.Add(' from vendas_fpg  fpg ');
      dados.qryExecute.sql.Add(' where');
      dados.qryExecute.sql.Add(' fpg.vendas_master=:CODIGO and ');
      dados.qryExecute.sql.Add(' fpg.tipo=:TP and valor>0');
      dados.qryExecute.sql.Add(' group by 1');
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryExecute.Params[1].Value := 'C';
      dados.qryExecute.Open;

      dados.qryExecute.First;
      while not dados.qryExecute.Eof do
      begin

        qryFPG.Locate('codigo', dados.qryExecute.Fields[0].AsInteger, []);
        ValorTaxa := (qryFPGTAXA.AsFloat * dados.qryExecute.Fields[1]
          .AsFloat) / 100;

        dados.qryCaixa.Close;
        dados.qryCaixa.Params[0].Value := -1;
        dados.qryCaixa.Open;

        // cartao de credito
        dados.qryCaixa.Insert;
        dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
          'N', '', '');
        dados.qryCaixaEMISSAO.Value := date;
        dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
        dados.qryCaixaEMISSAO.Value := date + qryFPGDIAS.AsInteger;
        dados.qryCaixaDOC.Value := frmpdv.qryVendaCODIGO.AsString;
        dados.qryCaixaTIPO_MOVIMENTO.Value := 'CC';
        dados.qryCaixaHISTORICO.Value := 'VENDA Nº' +
          frmpdv.qryVendaCODIGO.AsString + ' - ' + qryFPGDESCRICAO.Value;
        dados.qryCaixaENTRADA.Value := dados.qryExecute.Fields[1].AsFloat;
        dados.qryCaixaSAIDA.Value := 0;
        dados.qryCaixaHORA_EMISSAO.Value := time;
        dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
        dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_VENDA.Value;
        if dados.qryCaixaFKCONTA.Value > 0 then
          dados.qryCaixaFKCONTA.Value := qryFPGFKCONTADESTINO.Value
        else
          dados.qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;

        dados.qryCaixaFK_CARTAO.Value := qryFPGCODIGO.Value;
        dados.qryCaixaFPG.Value := qryFPGCODIGO.Value;
        dados.qryCaixaECARTAO.Value := 'C';
        dados.qryCaixaFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
        dados.qryCaixaTRANSFERENCIA.Value := 0;
        dados.qryCaixa.Post;
        dados.Conexao.CommitRetaining;

        if ValorTaxa > 0 then
        begin

          dados.qryCaixa.Insert;
          dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
            'N', '', '');
          dados.qryCaixaEMISSAO.Value := date;
          dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
          dados.qryCaixaEMISSAO.Value := date + 1;
          dados.qryCaixaDOC.Value := frmpdv.qryVendaCODIGO.AsString;
          dados.qryCaixaHISTORICO.Value := 'VENDA Nº' +
            frmpdv.qryVendaCODIGO.AsString + ' - TAXA CARTÃO';
          dados.qryCaixaENTRADA.Value := 0;
          dados.qryCaixaSAIDA.AsFloat := ValorTaxa;

          dados.qryCaixaHORA_EMISSAO.Value := time;
          dados.qryCaixaTIPO_MOVIMENTO.Value := 'TC';
          dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
          dados.qryCaixaFKPLANO.Value :=
            dados.qryEmpresaID_PLANO_TAXA_CARTAO.Value;

          if dados.qryCaixaFKCONTA.Value > 0 then
            dados.qryCaixaFKCONTA.Value := qryFPGFKCONTADESTINO.Value
          else
            dados.qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;

          dados.qryCaixaECARTAO.Value := 'C';
          dados.qryCaixaFPG.Value := qryFPGCODIGO.Value;
          dados.qryCaixaFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
          dados.qryCaixaTRANSFERENCIA.Value := 0;
          dados.qryCaixa.Post;
        end;

        dados.Conexao.CommitRetaining;
        dados.qryExecute.Next;
      end;
    end;

  end
  else
  begin

    if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'C') > 0 then
    begin
      dados.qryExecute.Close;
      dados.qryExecute.sql.Clear;
      dados.qryExecute.sql.Add(' select fpg.id_forma, SUM(fpg.valor)');
      dados.qryExecute.sql.Add(' from vendas_fpg  fpg ');
      dados.qryExecute.sql.Add(' where');
      dados.qryExecute.sql.Add(' fpg.vendas_master=:CODIGO and ');
      dados.qryExecute.sql.Add(' fpg.tipo=:TP and valor>0');
      dados.qryExecute.sql.Add(' group by 1');
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryExecute.Params[1].Value := 'C';
      dados.qryExecute.Open;

      dados.qryExecute.First;
      while not dados.qryExecute.Eof do
      begin
        qryFPG.Locate('codigo', dados.qryExecute.Fields[0].AsInteger, []);

        try
          frmCartaoParcela := tfrmCartaoParcela.Create(Application);
          frmCartaoParcela.Caption := 'Cartão de Crédito: ' +
            qryFPGDESCRICAO.Value;
          // cartao de debito
          frmCartaoParcela.edtTotal.Text :=
            FormatFloat('0.00', dados.qryExecute.Fields[1].Value);
          frmCartaoParcela.vValor := dados.qryExecute.Fields[1].AsFloat;
          frmCartaoParcela.idVenda := frmpdv.qryVendaCODIGO.Value;
          frmCartaoParcela.idFpg := dados.qryExecute.Fields[0].AsInteger;
          frmCartaoParcela.idCliente := frmpdv.qryVendaID_CLIENTE.Value;
          frmCartaoParcela.idConta := qryFPGFKCONTADESTINO.Value;
          dados.vChamaImpressao := false;
          frmCartaoParcela.ShowModal;
        finally
          frmCartaoParcela.Release;
        end;
        dados.qryExecute.Next;
      end;
    end;
  end;


  // forma de pagamento a cartao de débito

  if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'E') > 0 then
  begin

    dados.qryExecute.Close;
    dados.qryExecute.sql.Clear;
    dados.qryExecute.sql.Add
      (' select fpg.id_forma, SUM(coalesce(fpg.valor,0)) as valor ');
    dados.qryExecute.sql.Add(' from vendas_fpg  fpg ');
    dados.qryExecute.sql.Add(' where');
    dados.qryExecute.sql.Add(' fpg.vendas_master=:CODIGO and ');
    dados.qryExecute.sql.Add(' fpg.tipo=:TP and valor>0');
    dados.qryExecute.sql.Add(' group by 1');
    dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryExecute.Params[1].Value := 'E';
    dados.qryExecute.Open;

    qryFPG.Locate('codigo', dados.qryExecute.Fields[0].AsInteger, []);
    // cartao de debito
    ValorTaxa := (qryFPGTAXA.AsFloat * dados.qryExecute.Fields[1]
      .AsFloat) / 100;

    dados.qryCaixa.Close;
    dados.qryCaixa.Params[0].Value := -1;
    dados.qryCaixa.Open;

    dados.qryCaixa.Insert;
    dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
      'N', '', '');
    dados.qryCaixaEMISSAO.Value := date;
    dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryCaixaEMISSAO.Value := date + 1;
    dados.qryCaixaDOC.Value := frmpdv.qryVendaCODIGO.AsString;
    dados.qryCaixaHISTORICO.Value := 'VENDA Nº' + frmpdv.qryVendaCODIGO.AsString
      + ' - CARTÃO DE DÉBITO';
    dados.qryCaixaENTRADA.Value := dados.qryconsulta.Fields[0].AsFloat;
    dados.qryCaixaSAIDA.Value := 0;
    dados.qryCaixaTIPO_MOVIMENTO.Value := 'CD';
    dados.qryCaixaHORA_EMISSAO.Value := time;
    dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
    dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_VENDA.Value;
    dados.qryCaixaFKCONTA.Value := qryFPGFKCONTADESTINO.Value;
    dados.qryCaixaECARTAO.Value := 'D';
    dados.qryCaixaFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryCaixaTRANSFERENCIA.Value := 0;
    dados.qryCaixaFPG.Value := dados.buscafpg('E');
    dados.qryCaixa.Post;
    dados.Conexao.CommitRetaining;

    if ValorTaxa > 0 then
    begin
      dados.qryCaixa.Insert;
      dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
        'N', '', '');
      dados.qryCaixaEMISSAO.Value := date;
      dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      dados.qryCaixaEMISSAO.Value := date + 1;
      dados.qryCaixaDOC.Value := frmpdv.qryVendaCODIGO.AsString;
      dados.qryCaixaHISTORICO.Value := 'VENDA Nº' +
        frmpdv.qryVendaCODIGO.AsString + ' - TAXA CARTÃO';
      dados.qryCaixaTIPO_MOVIMENTO.Value := 'TD';
      dados.qryCaixaENTRADA.Value := 0;
      dados.qryCaixaSAIDA.AsFloat := ValorTaxa;
      dados.qryCaixaHORA_EMISSAO.Value := time;
      dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
      dados.qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_TAXA_CARTAO.Value;
      dados.qryCaixaFKCONTA.Value := qryFPGFKCONTADESTINO.Value;
      dados.qryCaixaECARTAO.Value := 'D';
      dados.qryCaixaFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryCaixaTRANSFERENCIA.Value := 0;
      dados.qryCaixaFPG.Value := dados.buscafpg('E');
      dados.qryCaixa.Post;
    end;

    dados.Conexao.CommitRetaining;

  end;

  // forma de NOTINHA À PRAZO

  if dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'N') > 0 then
  begin
    dados.qryCC.Close;
    dados.qryCC.sql.Text := ' select * from pessoa_conta' + ' where' +
      ' fkempresa=:empresa' + ' /*where*/';
    dados.qryCC.Open;
    dados.qryCC.Insert;
    dados.qryCCCODIGO.Value := dados.Numerador('PESSOA_CONTA', 'CODIGO',
      'N', '', '');
    dados.qryCCDATA_EMISSAO.Value := date;
    dados.qryCCDATA_VENCIMENTO.Value := date;
    dados.qryCCDocumento.Value := frmpdv.qryVendaCODIGO.AsString;
    dados.qryCCHISTORICO.Value := 'REF.A VENDA Nº' +
      frmpdv.qryVendaCODIGO.AsString;
    dados.qryCCENTRADA.Value := 0;
    dados.qryCCSAIDA.Value := dados.qryconsulta.Fields[0].AsFloat;
    dados.qryCCFKVENDA.Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryCCFKPESSOA.Value := frmpdv.qryVendaID_CLIENTE.Value;
    dados.qryCCFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryCCBLOQUEADO.Value := 'S';
    dados.qryCC.Post;
    dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmFechaVendaECF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

function TfrmFechaVendaECF.ConfiguraECF: boolean;
begin
  result := true;
  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'select CONTINGENCIA,PORTA,MODELO,NVIAS,IMPRIME,USAGAVETA from VENDAS_TERMINAIS where NOME='
    + QuotedStr(dados.Getcomputer);
  dados.qryconsulta.Open;

  if ACBrECF.Ativo then
    exit;

  if (dados.qryConfig.IsEmpty) then
  begin
    result := false;
    ShowMessage('Configure os parametros para emissão do ECF!');
  end;

  with ACBrECF do // configurações gerais
  begin
    if dados.qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
      modelo := ppEscDaruma
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
      modelo := ppEscBematech
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
      modelo := ppEscPosEpson
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
      modelo := ppEscDiebold
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
      modelo := ppEscPosEpson
    else
      modelo := ppTexto;

    Porta := LowerCase(dados.qryTerminal.FieldByName('PORTA').AsString);

    Device.Baud := dados.qryTerminalVELOCIDADE.Value;

    if not ACBrECF.AcharECF(true, false) then
    begin
      result := false;
      MessageDlg(' ECF não encontrado.', mtInformation, [mbOk], 0);
    end;
    ACBrECF.Ativar;
  end;

end;

procedure TfrmFechaVendaECF.btnConcluirClick(Sender: TObject);
var
  vDinheiro, vPago, totaldebito, vTotal, VlCompra: real;
  Data: TDate;
begin

  if frmpdv.qryVendaVIRTUAL_CLIENTE.IsNull or
    (frmpdv.qryVendaVIRTUAL_CLIENTE.AsString = '') then
  begin
    ShowMessage('Selecione um cliente!');
    exit;
  end;

  if frmpdv.qryVendaVIRTUAL_VENDEDOR.IsNull or
    (frmpdv.qryVendaVIRTUAL_VENDEDOR.AsString = '') then
  begin
    ShowMessage('Selecione um vendedor!');
    exit;
  end;

  vDinheiro := SimpleRoundTo(frmpdv.qryVendaDINHEIRO.AsFloat, -2);
  vPago := SimpleRoundTo(dados.BuscaValor(frmpdv.qryVendaCODIGO.Value,
    'D'), -2);

  if vDinheiro < vPago then
  begin
    ShowMessage('Informe o valor Pago!');
    DBEdit2.SetFocus;
    exit;
  end;

  try

    dados.vChamaImpressao := true;
    dados.qryTerminal.Close;
    dados.qryTerminal.Open;

    if not dados.qryTerminal.Locate('nome', Getcomputer, []) then
    begin
      ShowMessage('Terminal não cadastrado!');
      exit;
    end;

    if (qryVendasFPG.State in dsEditModes) then
      qryVendasFPG.Post;

    qrySomaParcela.Close;
    qrySomaParcela.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    qrySomaParcela.Open;

    if frmpdv.qryVendaTOTAL.AsFloat <> qrySomaParcela.Fields[0].AsFloat then
    begin
      ShowMessage('Total do pagamento menor que Total da Venda!');
      DBGridEh1.SetFocus;
      exit;
    end;

    if (frmpdv.qryVenda.State in dsEditModes) then
      frmpdv.qryVenda.Post;


    // Valida CPF/CNPF CPF NA NOTA

    if frmpdv.qryVendaCPF_NOTA.AsString <> '' then
    begin
      if length(frmpdv.qryVendaCPF_NOTA.Value) = 11 then
      begin
        if dados.qryEmpresaTIPO.Value = 'FÍSICA' then
        begin
          ACBrValidador1.TipoDocto := docCPF;
          ACBrValidador1.Documento := frmpdv.qryVendaCPF_NOTA.Value;
          if not ACBrValidador1.Validar then
            raise exception.Create(ACBrValidador1.MsgErro);
        end;
      end;
      if length(frmpdv.qryVendaCPF_NOTA.Value) = 14 then
      begin
        if dados.qryEmpresaTIPO.Value = 'JURÍDICA' then
        begin
          ACBrValidador1.TipoDocto := docCNPJ;
          ACBrValidador1.Documento := frmpdv.qryVendaCPF_NOTA.Value;
          if not ACBrValidador1.Validar then
            raise exception.Create(ACBrValidador1.MsgErro);
        end;
      end;
    end;

    if (length(TiraPontos(frmpdv.qryVendaCPF_NOTA.Value)) <> 11) and
      (length(TiraPontos(frmpdv.qryVendaCPF_NOTA.Value)) <> 14) then
    begin
      if frmpdv.qryVendaTOTAL.Value > 10000 then
      begin
        ShowMessage('Informe o CPF/CNPJ!');
        DBEdit5.SetFocus;
        exit;
      end;
    end;
    // FIM VALIDA CNPJ


    // PESQUISA SE TEM FPG A PRAZO

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.Add(' select SUM(fpg.valor) from vendas_fpg  fpg ');
    dados.qryconsulta.sql.Add(' where');
    dados.qryconsulta.sql.Add(' fpg.vendas_master=:CODIGO and ');
    dados.qryconsulta.sql.Add(' fpg.tipo in (''Q'',''F'') and valor>0');
    dados.qryconsulta.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryconsulta.Open;

    if (dados.qryconsulta.Fields[0].AsFloat > 0) then
    begin
      if dados.qryConfigCLIENTE_PADRAO.Value = frmpdv.qryVendaID_CLIENTE.Value
      then
      begin
        ShowMessage('Selecione o CLIENTE!');
        exit;
      end;

      // contas atrasadas

      dados.qryExecute.Close;
      dados.qryExecute.sql.Text :=
        ' select coalesce(sum(VL_RESTANTE),0) from CRECEBER ' +
        ' where FKCLIENTE=:id  and dtvencimento<current_date and situacao<>''T''';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
      dados.qryExecute.Open;

      if dados.qryExecute.Fields[0].AsFloat > 0 then
      begin
        ShowMessage('ATENÇÃO! Existem parcelas em atraso!');

        dados.vAutorizar := true;
        if not dados.eSupervisor then
        begin

          try
            frmSupervisor := TFrmSupervisor.Create(Application);
            dados.vAutorizar := false;
            frmSupervisor.ShowModal;
          finally
            frmSupervisor.Release;
          end;
        end
        else
        begin
          if Application.messageBox('Deseja continuar a venda?', 'Confirmação',
            mb_Yesno) <> mrYes then
            exit;
        end;

        if not dados.vAutorizar then
        begin
          exit;
        end;

      end;

      // inicio de checagem de limite

      VlCompra := dados.qryconsulta.Fields[0].AsFloat;

      dados.qryExecute.Close;
      dados.qryExecute.sql.Text := ' select sum(VL_RESTANTE) from CRECEBER ' +
        ' where ' + 'FKCLIENTE=:id';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
      dados.qryExecute.Open;

      totaldebito := 0;

      if dados.qryExecute.Fields[0].AsFloat > 0 then
        totaldebito := dados.qryExecute.Fields[0].AsFloat;

      dados.qryExecute.Close;
      dados.qryExecute.sql.Text := ' select limite from pessoa ' + ' where ' +
        'codigo=:id';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
      dados.qryExecute.Open;

      vTotal := VlCompra + totaldebito;

      if dados.qryExecute.Fields[0].AsFloat < vTotal then
      begin

        ShowMessage
          ('ATENÇÃO! VENDA À PRAZO ACIMA DO LIMITE PERMITIDO P/ O CLIENTE' + #13
          + 'LIMITE DO CLIENTE....:' + FormatFloat(',0.00',
          dados.qryExecute.Fields[0].AsFloat) + #13 + 'TOTAL DE DÉBITOS ....:' +
          FormatFloat(',0.00', totaldebito) + #13 + 'TOTAL DA VENDA ......:' +
          FormatFloat(',0.00', VlCompra) + #13 + 'TOTAL................:' +
          FormatFloat(',0.00', vTotal));

        dados.vAutorizar := true;
        if not dados.eSupervisor then
        begin

          try
            frmSupervisor := TFrmSupervisor.Create(Application);
            dados.vAutorizar := false;
            frmSupervisor.ShowModal;
          finally
            frmSupervisor.Release;
          end;
        end
        else
        begin
          if Application.messageBox('Deseja continuar a venda?', 'Confirmação',
            mb_Yesno) <> mrYes then
            exit;
        end;

        if not dados.vAutorizar then
        begin
          exit;
        end;
      end;

      // fim de checagem de limite

    end;


    // FIM FORMA DE PAGAMENTO NOTINHA

    // inicio de checagem de débito

    dados.qryconsulta.Close;
    dados.qryconsulta.sql.Clear;
    dados.qryconsulta.sql.Add(' select SUM(fpg.valor) from vendas_fpg  fpg ');
    dados.qryconsulta.sql.Add(' where');
    dados.qryconsulta.sql.Add(' fpg.vendas_master=:CODIGO and ');
    dados.qryconsulta.sql.Add(' fpg.tipo=''N'' and valor>0');
    dados.qryconsulta.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryconsulta.Open;
    if (dados.qryconsulta.Fields[0].AsFloat > 0) then
    begin

      if dados.qryEmpresaPRAZO_MAXIMO.IsNull then
      begin
        ShowMessage
          ('Atenção! Vá em cadastro de empresa, configurações e informe o Prazo Máximo da Nota!');
        exit;
      end;

      dados.qryExecute.Close;
      dados.qryExecute.sql.Text :=
        ' select sum(entrada - saida) from pessoa_conta ' + ' where ' +
        'fkpessoa=:id';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
      dados.qryExecute.Open;

      totaldebito := 0;

      if dados.qryEmpresaPRAZO_MAXIMO.Value > 0 then
      begin

        if dados.qryExecute.Fields[0].AsFloat < 0 then
          totaldebito := -1 * dados.qryExecute.Fields[0].AsFloat;

        if totaldebito > 0 then
        begin
          dados.qryExecute.Close;
          dados.qryExecute.sql.Text := ' select sum(entrada)from pessoa_conta '
            + ' where entrada>0 and ' + 'fkpessoa=:id and data_emissao>:data';
          dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
          Data := date - dados.qryEmpresaPRAZO_MAXIMO.AsInteger;
          dados.qryExecute.Params[1].AsDate := Data;
          dados.qryExecute.Open;

          if dados.qryExecute.Fields[0].AsFloat = 0 then
          begin
            ShowMessage('ATENÇÃO! EXISTEM DÉBITOS A MAIS DE ' +
              dados.qryEmpresaPRAZO_MAXIMO.AsString + ' DIAS' + #13 +
              'EM NOME DESTE CLIENTE.' + #13 + 'TOTAL DO DÉBITO ....:' +
              FormatFloat(',0.00', totaldebito));

            dados.vAutorizar := true;
            if not dados.eSupervisor then
            begin

              try
                frmSupervisor := TFrmSupervisor.Create(Application);
                dados.vAutorizar := false;
                frmSupervisor.ShowModal;
              finally
                frmSupervisor.Release;
              end;
            end
            else
            begin
              if Application.messageBox('Deseja continuar a venda?',
                'Confirmação', mb_Yesno) <> mrYes then
                exit;
            end;

          end;

          if not dados.vAutorizar then
          begin
            exit;
          end;

        end;
      end;
    end;

    // fim de checagem de débitos

    // inicio de checagem de limite

    VlCompra := dados.qryconsulta.Fields[0].AsFloat;

    dados.qryExecute.Close;
    dados.qryExecute.sql.Text :=
      ' select sum(entrada - saida) from pessoa_conta ' + ' where ' +
      'fkpessoa=:id';
    dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
    dados.qryExecute.Open;

    totaldebito := 0;

    if dados.qryExecute.Fields[0].AsFloat < 0 then
      totaldebito := -1 * dados.qryExecute.Fields[0].AsFloat;

    dados.qryExecute.Close;
    dados.qryExecute.sql.Text := ' select limite from pessoa ' + ' where ' +
      'codigo=:id';
    dados.qryExecute.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
    dados.qryExecute.Open;

    vTotal := VlCompra + totaldebito;

    if dados.qryExecute.Fields[0].AsFloat < vTotal then
    begin

      ShowMessage
        ('ATENÇÃO! VENDA À PRAZO ACIMA DO LIMITE PERMITIDO P/ O CLIENTE' + #13 +
        'LIMITE DO CLIENTE....:' + FormatFloat(',0.00',
        dados.qryExecute.Fields[0].AsFloat) + #13 + 'TOTAL DE DÉBITOS ....:' +
        FormatFloat(',0.00', totaldebito) + #13 + 'TOTAL DA VENDA ......:' +
        FormatFloat(',0.00', VlCompra) + #13 + 'TOTAL................:' +
        FormatFloat(',0.00', vTotal));

      if not dados.eSupervisor then
      begin

        try
          frmSupervisor := TFrmSupervisor.Create(Application);
          dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end
      else
      begin
        if Application.messageBox('Deseja continuar a venda?', 'Confirmação',
          mb_Yesno) <> mrYes then
          exit;
      end;

    end;

    GeraFinanceiro;

    // verifica se gerou contas a receber

    if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'F') > 0) then
    begin
      dados.qryExecute.Close;
      dados.qryExecute.sql.Text :=
        'select fk_venda FROM CRECEBER WHERE FK_VENDA=:VD';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryExecute.Open;

      if dados.qryExecute.IsEmpty then
      begin
        ShowMessage
          ('Atenção!  Faça o Lançamento do Contas a Receber da Venda!');
        exit;
      end;
    end;

    // verifica se gerou cheques

    if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'Q') > 0) then
    begin
      dados.qryExecute.Close;
      dados.qryExecute.sql.Text :=
        'select fk_venda FROM CRECEBER WHERE FK_VENDA=:VD';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryExecute.Open;

      if dados.qryExecute.IsEmpty then
      begin
        ShowMessage('Atenção!  Faça o Lançamento dos Cheques da Venda!');
        exit;
      end;
    end;

    // verifica se gerou cartao credito

    if (dados.BuscaValor(frmpdv.qryVendaCODIGO.Value, 'C') > 0) then
    begin

      dados.qryExecute.Close;
      dados.qryExecute.sql.Text :=
        'select SUM(ENTRADA) ENTRADA FROM CAIXA WHERE FKVENDA=:VD AND ECARTAO=''C''';
      dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
      dados.qryExecute.Open;

      if dados.qryExecute.IsEmpty then
      begin
        ShowMessage
          ('Atenção!  Faça o Lançamento das Parcelas do Cartão de Crédito !');
        exit;
      end;

      if (SimpleRoundTo(dados.qryExecute.Fields[0].AsFloat, -2)) <>
        (SimpleRoundTo(dados.qryconsulta.Fields[0].AsFloat, -2)) then
      begin
        ShowMessage
          ('Total de Vendas nota cartão, não bate com os total lançado no caixa,'
          + sLineBreak + ' refaça os lançamentos financeiros!');
        exit;
      end;
    end;

    //
    if dados.vChamaImpressao then
    begin
      try
        frmpdv.qryItem.DisableControls;
        RatearDesconto;
      finally
        frmpdv.qryItem.EnableControls;
      end;

      PageControl1.ActivePageIndex := 1;

      frmFechaVenda.Caption := 'Tipo de Impressão';
      Height := 450;
      Centraliza;
      Application.ProcessMessages;
    end;
  except
    On e: exception do
      raise exception.Create(e.Message);
  end;
end;

procedure TfrmFechaVendaECF.ApagaFpgZerada;
begin
  dados.qryExecute.Close;
  dados.qryExecute.sql.Text :=
    'delete from vendas_fpg  where vendas_master=:codigo and valor=0';
  dados.qryExecute.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;

end;

procedure TfrmFechaVendaECF.btnFinalizarClick(Sender: TObject);
begin

  try
    dados.vEnviarSefa := 'N';
    TipoEmissao := 'OFF';
    btnFinalizar.Enabled := false;
    ProgressBar1.Position := 0;
    if frmpdv.qryVendaSITUACAO.Value = 'X' then
    begin
      if not(frmpdv.qryVenda.State in dsEditModes) then
        frmpdv.qryVenda.Edit;
      frmpdv.qryVendaSITUACAO.Value := 'F';
      frmpdv.qryVendaTIPO.Value := 'V';
      frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
      frmpdv.qryVendaDATA_EMISSAO.Value := now;
      frmpdv.qryVenda.Post;
      dados.Conexao.CommitRetaining;
      ApagaFpgZerada;
    end;

    if dados.qryTerminalUSAGAVETA.Value = 'S' then
    begin
      ACBrNFe.DANFE := ACBrNFeDANFeESCPOS1;
      ACBrPosPrinter1.AbrirGaveta;
    end;

    vFinalizou := true;
    Close;

  finally
    btnFinalizar.Enabled := true;

  end;
end;

procedure TfrmFechaVendaECF.ImprimePedido;
var
  x, y, i, j: Integer;
  Lin_Tot, Dif_Tot: Integer;
  Sub_Total, T_Geral: Extended;
  iRetorno, tamanho: Integer;
  CdgCliente: string;
  vEndereco, Caminho_Impressao: String;
  Veiculo: String;
  sTexto, sTexto1, sTexto2, sTitulo: String;
  EspacosEmBranco: Extended;
  Traduzido: Integer;
  NomedaEmpresa: String;
  FoneCompleto: String;
  Endereco1: String;
  Endereco2: String;
  i_modelo: Integer;
begin

  Lin_Tot := 9;
  Dif_Tot := 0;
  Sub_Total := 0;
  y := 0;

  Memo1.Lines.Clear;

  Memo1.Lines.Add('<N>' + copy(dados.qryEmpresaFANTASIA.AsString, 1, 44)
    + '</n>');
  Memo1.Lines.Add(dados.qryEmpresaENDERECO.AsString + ',' +
    dados.qryEmpresaNUMERO.Value);
  Memo1.Lines.Add(trim(dados.qryEmpresaBAIRRO.AsString) + ' - ' +
    trim(dados.qryEmpresaCIDADE.AsString) + '-' +
    trim(dados.qryEmpresaUF.AsString));
  Memo1.Lines.Add('Fone: ' + trim(dados.qryEmpresaFONE.AsString));

  dados.qryconsulta.sql.Text :=
    ' SELECT CLI.codigo, CLI.RAZAO, CLI.cnpj, CLI.ENDERECO,' +
    ' CLI.BAIRRO, CLI.municipio,CLI.fone1, CLI.CEP, CLI.UF, CLI.codmun, MUN.descricao CIDADE, CLI.numero'
    + ' FROM PESSOA CLI' + ' LEFT JOIN cidade MUN on MUN.codigo=CLI.codmun' +
    ' WHERE CLI.codigo=:ID';
  dados.qryconsulta.Params[0].Value := frmpdv.qryVendaID_CLIENTE.Value;
  dados.qryconsulta.Open;

  vEndereco := copy(dados.qryconsulta.FieldByName('ENDERECO').AsString, 1, 30) +
    ',' + dados.qryconsulta.FieldByName('NUMERO').AsString;

  Memo1.Lines.Add('</linha_simples>');
  sTexto := '<N><ce>*** NOTA No. ' + FormatFloat('0000',
    frmpdv.qryVendaCODIGO.AsFloat) + ' ***</CE></n>';
  Memo1.Lines.Add(sTexto);
  Memo1.Lines.Add('</linha_simples>');
  sTexto := copy(FormatFloat('0000', dados.qryconsulta.FieldByName('CODIGO')
    .AsFloat) + '=>' + dados.qryconsulta.FieldByName('RAZAO').AsString, 1, 33);
  Memo1.Lines.Add('Cliente...: ' + sTexto);
  sTexto := copy(vEndereco, 1, 33);
  Memo1.Lines.Add('Endereco..: ' + sTexto);
  sTexto := copy(dados.qryconsulta.FieldByName('BAIRRO').AsString, 1, 33);
  Memo1.Lines.Add('Bairro....: ' + sTexto);
  sTexto := copy(dados.qryconsulta.FieldByName('FONE1').AsString, 1, 33);
  Memo1.Lines.Add('Telefone..: ' + sTexto);
  sTexto := copy(frmpdv.qryVendaDATA_EMISSAO.AsString, 1, 33);
  Memo1.Lines.Add('Dt.Vd:' + sTexto);
  sTexto := copy(frmpdv.qryVendaDATA_EMISSAO.AsString, 1, 33);
  Memo1.Lines.Add('Hora:' + timetostr(time));
  Memo1.Lines.Add('Vendedor:' + frmpdv.qryVendaVIRTUAL_VENDEDOR.Value);
  if trim(sTexto2) <> '' then
    Memo1.Lines.Add(sTexto2);

  Memo1.Lines.Add('</linha_simples>');
  Memo1.Lines.Add
    ('<C>|COD |PRODUTO                     |   QTD|    VALOR|     TOTAL|</C>');
  Memo1.Lines.Add('</linha_simples>');

  frmpdv.qryItem.First;
  While not frmpdv.qryItem.Eof do
  begin
    sTexto := dados.Alinha('|', 1, false) +
      dados.Alinha(frmpdv.qryItem.FieldByName('ID_PRODUTO').AsString, 04, false)
      + dados.Alinha('|', 1, false) +
      dados.Alinha(copy(frmpdv.qryItem.FieldByName('DESCRICAO_SL').AsString, 1,
      28), 28, false) + dados.Alinha('|', 1, false) +
      dados.Alinha(FormatFloat('0', frmpdv.qryItem.FieldByName('QTD').AsFloat),
      6, true) + dados.Alinha('|', 1, false) +
      dados.Alinha(FormatFloat('0.00', frmpdv.qryItem.FieldByName('PRECO')
      .AsFloat), 9, true) + dados.Alinha('|', 1, false) +
      dados.Alinha(FormatFloat('0.00', frmpdv.qryItem.FieldByName('VALOR_ITEM')
      .AsFloat), 10, true) + dados.Alinha('|', 1, false);

    Memo1.Lines.Add('<C>' + sTexto + '</C>');

    // Sub_Total := Sub_Total + FRmPDV.qryitem.FieldByName('VALOR_ITEM').AsFloat;
    frmpdv.qryItem.Next;
    y := y + 1;
  end;

  Memo1.Lines.Add('</linha_simples>');

  sTexto := dados.Alinha('', 01, false) + dados.Alinha('SUBTOTAL..: ', 12,
    false) + dados.Alinha(FormatFloat('###,##0.00',
    frmpdv.qryVendaSUBTOTAL.AsFloat), 10, true);
  Memo1.Lines.Add(sTexto);
  sTexto := dados.Alinha('', 01, false) + dados.Alinha('DESCONTO..: ', 12,
    false) + dados.Alinha(FormatFloat('##0.00',
    frmpdv.qryVenda.FieldByName('DESCONTO').AsFloat), 10, true);
  Memo1.Lines.Add(sTexto);
  sTexto := dados.Alinha('', 01, false) + dados.Alinha('TOTAL.....: ', 12,
    false) + dados.Alinha(FormatFloat('###,##0.00',
    frmpdv.qryVendaTOTAL.AsFloat), 10, true);
  Memo1.Lines.Add(sTexto);
  sTexto := dados.Alinha('', 01, false) + dados.Alinha('VALOR PAGO:', 12, false)
    + dados.Alinha(FormatFloat('###,##0.00', frmpdv.qryVendaDINHEIRO.AsFloat),
    10, true);
  Memo1.Lines.Add(sTexto);
  sTexto := dados.Alinha('', 01, false) + dados.Alinha('TROCO.....:', 12, false)
    + dados.Alinha(FormatFloat('###,##0.00', frmpdv.qryVendaTROCO.AsFloat),
    10, true);
  Memo1.Lines.Add(sTexto);

  Memo1.Lines.Add
    ('<C>PARCELAS-------------------------------------------------------</C>');

  Memo1.Lines.Add('</linha_simples>');
  sTexto := dados.Alinha('', 29, false);
  sTexto := dados.Alinha('Declaro ter recebido a mercadoria, ', 29, false);
  Memo1.Lines.Add(sTexto);

  sTexto := dados.Alinha('', 29, false);
  Memo1.Lines.Add(sTexto);
  sTexto := '<ce> ' + 'Assinatura Cliente' + ' </CE>';
  Memo1.Lines.Add(sTexto);

  Memo1.Lines.Add('</linha_dupla>');
  sTexto := '<ce>NAO É DOCUMENTO FISCAL</CE>';
  Memo1.Lines.Add(sTexto);
  sTexto := '<ce><<Obrigado Pela Preferencia>></CE>';
  Memo1.Lines.Add(sTexto);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');

  Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'caixa.txt');

  dados.qryTerminal.Locate('nome', dados.nometerminal, []);
  ACBrPosPrinter1.Porta := LowerCase(dados.qryTerminal.FieldByName('PORTA')
    .AsString);

  if dados.qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
    ACBrPosPrinter1.modelo := ppEscDaruma
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
    ACBrPosPrinter1.modelo := ppEscBematech
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
    ACBrPosPrinter1.modelo := ppEscPosEpson
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
    ACBrPosPrinter1.modelo := ppEscDiebold
  else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
    ACBrPosPrinter1.modelo := ppEscPosEpson
  else
    ACBrPosPrinter1.modelo := ppTexto;

  ACBrNFeDANFeESCPOS1.NumCopias := 1;

  ACBrPosPrinter1.Desativar;
  ACBrPosPrinter1.Device.Baud := dados.qryTerminalVELOCIDADE.Value;
  ACBrPosPrinter1.Ativar;

  Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'caixa.txt');

  if ACBrPosPrinter1.VerificarImpressora then
    ACBrNFeDANFeESCPOS1.ImprimirRelatorio(Memo1.Lines)
  else
    ShowMessage('Erro ao imprimir!');
end;

procedure TfrmFechaVendaECF.Centraliza;
begin
  frmFechaVenda.Top := (Screen.DesktopHeight - frmFechaVenda.Height) DIV 2;
  frmFechaVenda.Left := (Screen.DesktopWidth - frmFechaVenda.Width) DIV 2;
  frmFechaVenda.Refresh;
  frmFechaVenda.Realign;
  frmFechaVenda.Repaint;
end;

procedure TfrmFechaVendaECF.ImprimeA4;
begin
  dados.qryPV.Close;
  dados.qryPV.sql.Text :=
    ' select PV.*, PES.razao, ve.nome,  co.descricao as conta from VENDAS_MASTER PV '
    + ' LEFT JOIN pessoa PES on PES.codigo= PV.id_cliente ' +
    ' LEFT JOIN contas co on co.codigo= PV.fk_caixa ' +
    ' LEFT JOIN vendedores ve on ve.codigo= PV.fk_vendedor ' + ' where' +
    ' pv.codigo=:codigo';
  dados.qryPV.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryPV.Open;

  dados.qryPV_Itens.Close;
  dados.qryPV_Itens.Params[0].Value := dados.qryPVCODIGO.Value;
  dados.qryPV_Itens.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelPedidoVenda.fr3');
  frxReport.ShowReport;
end;

procedure TfrmFechaVendaECF.Pedido1Click(Sender: TObject);
begin
  btnPedido.Click;
  if Application.messageBox('Deseja Finalizar Pedido?', 'Confirmação', mb_Yesno)
    = mrYes then
    btnFinalizar.Click;

end;

procedure TfrmFechaVendaECF.btnOfflineClick(Sender: TObject);
begin
  try
    if dados.qryConfigVERSAODF.Value < 3 then
    begin
      ShowMessage('Informe a Versão do NFCE ');
      exit;
    end;

    if trim(mensagem) <> '' then
    begin
      ShowMessage(mensagem);
      exit;
    end;

    TipoEmissao := 'OFF';

    ACBrNFe.NotasFiscais.Clear;

    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;

    dados.qryNFCE_M.Close;
    dados.qryNFCE_M.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryNFCE_M.Open;

    dados.qryNFCE_D.Close;
    dados.qryNFCE_D.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    dados.qryNFCE_D.Open;

    ImportaPedido;

    dados.qryNFCE_D.Close;
    dados.qryNFCE_D.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    dados.qryNFCE_D.Open;

    if dados.qryNFCE_D.IsEmpty then
    begin
      ShowMessage('Não Existe Produto Cadastrado Para Venda!' + #13 +
        'Vá na tela cadastro de produtos' + #13 +
        ' e marque a opção Permitir Venda');
      exit;
    end;

    // Verifica atualiza cadastro de produtos
    ProgressBar1.Position := 50;
    Application.ProcessMessages;

    // gera xml nfce

    GerarNFCe(dados.qryNFCE_MNUMERO.AsString);

    if not ValidaNegocios then // passo 5 valida xml
      exit;

    // grava chave do nfe no banco de dados

    if not(dados.qryNFCE_M.State in dsEditModes) then
      dados.qryNFCE_M.Edit;
    dados.qryNFCE_MCHAVE.Value :=
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
    dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
    dados.qryNFCE_MFLAG.Value := 'N';
    dados.qryNFCE_MABERTO.Value := 'N';
    dados.qryNFCE_MSITUACAO.Value := 'O';
    dados.qryNFCE_MDATA_EMISSAO.Value := date;
    dados.qryNFCE_MDATA_SAIDA.Value := date;
    dados.qryNFCE_MHORA_EMISSAO.Value := now;
    dados.qryNFCE_MHORA_SAIDA.Value := now;
    dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryNFCE_M.Post;
    dados.Conexao.CommitRetaining;

    frmpdv.qryVenda.Edit;
    frmpdv.qryVendaSITUACAO.Value := 'F';
    frmpdv.qryVendaTIPO.Value := 'V';
    frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
    frmpdv.qryVendaNECF.Value := dados.qryNFCE_MNUMERO.Value;
    frmpdv.qryVenda.Post;
    dados.Conexao.CommitRetaining;

    ApagaFpgZerada;

    if dados.qryTerminalUSAGAVETA.Value = 'S' then // abre gaveta
    begin
      ACBrNFe.DANFE := ACBrNFeDANFeESCPOS1;
      ACBrPosPrinter1.AbrirGaveta;
    end;

    ProgressBar1.Position := 100;
    Application.ProcessMessages;

    // if dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
    ACBrNFe.NotasFiscais.Imprimir;

  finally
    dados.Conexao.CommitRetaining;
    btnTransmitir.Enabled := true;
  end;

  vFinalizou := true;
  Close;
end;

procedure TfrmFechaVendaECF.btnPedidoClick(Sender: TObject);
var
  PodeImpimir: boolean;
  i: Integer;
begin
  try
    dados.vEnviarSefa := 'N';
    TipoEmissao := 'OFF';
    btnPedido.Enabled := false;
    ProgressBar1.Position := 0;

    Application.ProcessMessages;

    if dados.qryTerminalUSAGAVETA.Value = 'S' then
    begin
      ACBrNFe.DANFE := ACBrNFeDANFeESCPOS1;
      ACBrPosPrinter1.AbrirGaveta;
    end;

    ProgressBar1.Position := 50;

    PodeImpimir := true;

    if not vImprime then
    begin
      PodeImpimir := Application.messageBox('Deseja Imprimir Pedido?',
        'Confirmação', mb_Yesno) = mrYes;
    end;

    if PodeImpimir then
    begin
      if dados.qryTerminalTIPOIMPRESSORA.Value = '1' then
        ImprimeA4;
      if dados.qryTerminalTIPOIMPRESSORA.Value = '2' then
      begin
        for i := 1 to dados.qryTerminalNVIAS.AsInteger do
          ImprimePedido;
      end;
    end;

    ProgressBar1.Position := 100;

    if Application.messageBox('Deseja Finalizar Venda?', 'Confirmação',
      mb_Yesno) = mrYes then
    begin
      btnFinalizar.Click;
    end;

  finally
    btnPedido.Enabled := true;
  end;
end;

procedure TfrmFechaVendaECF.RatearDesconto;
var
  TSoma, TDif, TPercentual: Extended;
  TSomaOutro, TDifOutro: Extended;
  ValorDesconto, ValorAcrescimo: Extended;
  MaiorItem: Extended;
begin
  TSoma := 0;
  TSomaOutro := 0;
  ValorDesconto := 0;
  ValorAcrescimo := 0;
  frmpdv.qryItem.First;
  while not frmpdv.qryItem.Eof do
  begin

    TPercentual := frmpdv.qryItemVALOR_ITEM.AsFloat /
      frmpdv.qryVendaSUBTOTAL.AsFloat;

    ValorDesconto := SimpleRoundTo
      (TPercentual * frmpdv.qryVendaDESCONTO.AsFloat, -2);

    ValorAcrescimo := SimpleRoundTo
      (TPercentual * frmpdv.qryVendaACRESCIMO.AsFloat, -2);

    dados.qryExecute.Close;
    dados.qryExecute.sql.Clear;
    dados.qryExecute.sql.Text :=
      'update VENDAS_DETALHE set VDESCONTO=:DESCONTO, ACRESCIMO=:ACRESCIMO WHERE CODIGO=:COD';
    dados.qryExecute.Params[0].Value := ValorDesconto;
    dados.qryExecute.Params[1].Value := ValorAcrescimo;
    dados.qryExecute.Params[2].Value := frmpdv.qryItemCODIGO.Value;
    dados.qryExecute.ExecSQL;

    dados.Conexao.CommitRetaining;

    TSoma := TSoma + ValorDesconto;
    TSomaOutro := TSomaOutro + ValorAcrescimo;
    frmpdv.qryItem.Next;
  end;

  frmpdv.qryItem.Close;
  frmpdv.qryItem.Open;

  TDif := frmpdv.qryVendaDESCONTO.AsFloat - TSoma;
  TDifOutro := frmpdv.qryVendaACRESCIMO.AsFloat - TSomaOutro;
  // desconto

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Clear;
  dados.qryconsulta.sql.Add
    ('select first 1 codigo, coalesce(max(total),0) total from vendas_detalhe');
  dados.qryconsulta.sql.Add('where fkvenda=:cod');
  dados.qryconsulta.sql.Add('group by 1');
  dados.qryconsulta.sql.Add('order by 2 desc');
  dados.qryconsulta.Params[0].Value := frmpdv.qryItemFKVENDA.Value;
  dados.qryconsulta.Open;
  MaiorItem := dados.qryconsulta.Fields[0].AsInteger;

  if TDif <> 0 then
  begin
    frmpdv.qryItem.Locate('codigo', MaiorItem, []);
    frmpdv.qryItem.Edit;
    frmpdv.qryItemVDESCONTO.Value := frmpdv.qryItemVDESCONTO.Value + TDif;
    frmpdv.qryItemACRESCIMO.Value := frmpdv.qryItemACRESCIMO.Value + TDifOutro;
    frmpdv.qryItem.Post;
    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmFechaVendaECF.ImportaPedido;
var
  i: Integer;
begin
  try
    frmpdv.qryItem.DisableControls;
    frmpdv.qryItem.Close;
    frmpdv.qryItem.Open;


    // importa cabecalho

    if dados.qryNFCE_M.IsEmpty then
    begin
      dados.qryNFCE_M.Insert;

      dados.qryNFCE_MSERIE.Value := dados.qryTerminalSERIE.Value;
      dados.qryNFCE_MCODIGO.Value := dados.Numerador('NFCE_MASTER', 'CODIGO',
        'N', '', '');

      dados.qryExecute.Close;

      dados.qryExecute.sql.Text :=
        'SELECT COALESCE(MAX(NUMERO),0) qtd FROM NFCE_MASTER WHERE SERIE=:SERIE AND FKEMPRESA=:EMPRESA';
      dados.qryExecute.Params[0].Value := dados.qryTerminalSERIE.Value;
      dados.qryExecute.Params[1].Value := frmpdv.qryVendaFKEMPRESA.Value;
      dados.qryExecute.Open;

      if dados.qryExecute.Fields[0].AsInteger = 0 then
        dados.qryNFCE_MNUMERO.Value := dados.qryTerminalNUMERACAO_INICIAL.Value
      else
        dados.qryNFCE_MNUMERO.Value := dados.qryExecute.Fields[0].AsInteger + 1;

      dados.qryNFCE_MMODELO.Value := '65';
      dados.qryNFCE_MSITUACAO.Value := 'G';
      dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
    end
    else
      dados.qryNFCE_M.Edit;
    dados.qryNFCE_MFKEMPRESA.Value := frmpdv.qryVendaFKEMPRESA.Value;
    dados.qryNFCE_MDATA_EMISSAO.Value := date;
    dados.qryNFCE_MDATA_SAIDA.Value := date;
    dados.qryNFCE_MOBSERVACOES.Value := frmpdv.qryVendaOBSERVACOES.Value;
    dados.qryNFCE_MID_CLIENTE.Value := frmpdv.qryVendaID_CLIENTE.Value;
    dados.qryNFCE_MFK_USUARIO.Value := frmpdv.qryVendaFK_USUARIO.Value;
    dados.qryNFCE_MFK_CAIXA.Value := frmpdv.qryVendaFK_CAIXA.Value;
    dados.qryNFCE_MSERIE.Value := dados.qryTerminalSERIE.Value;
    dados.qryNFCE_MFK_VENDEDOR.Value := frmpdv.qryVendaFK_VENDEDOR.Value;
    dados.qryNFCE_MCPF_NOTA.Value := frmpdv.qryVendaCPF_NOTA.Value;
    dados.qryNFCE_MSUBTOTAL.Value := frmpdv.qryVendaSUBTOTAL.AsFloat;
    dados.qryNFCE_MOUTROS.Value := frmpdv.qryVendaACRESCIMO.AsFloat;
    dados.qryNFCE_MDESCONTO.Value := frmpdv.qryVendaDESCONTO.AsFloat;
    dados.qryNFCE_MTOTAL.Value := frmpdv.qryVendaSUBTOTAL.AsFloat -
      frmpdv.qryVendaDESCONTO.AsFloat + frmpdv.qryVendaACRESCIMO.AsFloat;
    dados.qryNFCE_MTIPO_DESCONTO.Value := frmpdv.qryVendaTIPO_DESCONTO.Value;
    dados.qryNFCE_MTROCO.Value := frmpdv.qryVendaTROCO.AsFloat;
    dados.qryNFCE_M.Post;
    dados.Conexao.CommitRetaining;

    dados.qryExecute.Close;
    dados.qryExecute.sql.Text := 'delete from nfce_detalhe where fkvenda=:fk';
    dados.qryExecute.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;
    i := 1;
    frmpdv.qryItem.First;
    while not frmpdv.qryItem.Eof do
    begin
      qryProduto.Close;
      qryProduto.Params[0].Value := frmpdv.qryItemID_PRODUTO.Value;
      qryProduto.Open;

      dados.qryNFCE_D.Insert;
      dados.QRYNFCE_DCODIGO.Value := dados.Numerador('NFCE_DETALHE', 'CODIGO',
        'N', '', '');
      dados.QRYNFCE_DFKVENDA.Value := dados.qryNFCE_MCODIGO.Value;
      dados.qryNFCE_DID_PRODUTO.Value := frmpdv.qryItemID_PRODUTO.Value;
      dados.qryNFCE_DITEM.Value := i;

      dados.qryNFCE_DCOD_BARRA.Value := qryProdutoCODBARRA.Value;

      dados.qryNFCE_DNCM.Value := qryProdutoNCM.Value;
      dados.qryNFCE_DCFOP.Value := qryProdutoCFOP.Value;
      dados.qryNFCE_DCST.Value := qryProdutoCSTICMS.Value;
      dados.qryNFCE_DCST_PIS.Value := qryProdutoCSTS.Value;
      dados.qryNFCE_DCST_COFINS.Value := qryProdutoCSTS.Value;
      dados.qryNFCE_DCSOSN.Value := qryProdutoCSOSN.Value;
      dados.QRYNFCE_DTIPO.Value := qryProdutoTIPO.Value;
      dados.QRYNFCE_DQTD.Value := frmpdv.qryItemQTD.AsFloat;
      dados.QRYNFCE_DPRECO.Value := frmpdv.qryItemPRECO.AsFloat;
      dados.QRYNFCE_DVALOR_ITEM.Value := frmpdv.qryItemVALOR_ITEM.AsFloat;
      dados.QRYNFCE_DUNIDADE.Value := frmpdv.qryItemUNIDADE.Value;
      dados.qryNFCE_DVDESCONTO.Value := frmpdv.qryItemVDESCONTO.AsFloat;
      dados.QRYNFCE_DOUTROS.Value := frmpdv.qryItemACRESCIMO.AsFloat;
      dados.QRYNFCE_DALIQ_ICMS.Value := qryProdutoALIQ_ICM.Value;
      dados.qryNFCE_DBASE_ICMS.Value := 0;
      if dados.QRYNFCE_DALIQ_ICMS.Value > 0 then
        dados.qryNFCE_DBASE_ICMS.Value := frmpdv.qryItemTOTAL.AsFloat;
      dados.qryNFCE_DVALOR_ICMS.Value :=
        SimpleRoundTo((qryProdutoALIQ_ICM.Value * frmpdv.qryItemTOTAL.AsFloat)
        / 100, -2);

      dados.qryNFCE_DALIQ_COFINS_ICMS.Value := qryProdutoALIQ_COF.Value;
      dados.qryNFCE_DBASE_COFINS_ICMS.Value := 0;
      if dados.qryNFCE_DALIQ_COFINS_ICMS.Value > 0 then
        dados.qryNFCE_DBASE_COFINS_ICMS.Value := frmpdv.qryItemTOTAL.AsFloat;
      dados.qryNFCE_DVALOR_COFINS_ICMS.Value :=
        SimpleRoundTo((qryProdutoALIQ_COF.Value * frmpdv.qryItemTOTAL.AsFloat /
        100), -2);

      dados.qryNFCE_DALIQ_PIS_ICMS.Value := qryProdutoALIQ_PIS.Value;
      dados.qryNFCE_DBASE_PIS_ICMS.Value := 0;
      if dados.qryNFCE_DALIQ_PIS_ICMS.Value > 0 then
        dados.qryNFCE_DBASE_PIS_ICMS.Value := frmpdv.qryItemTOTAL.AsFloat;
      dados.qryNFCE_DVALOR_PIS_ICMS.Value :=
        SimpleRoundTo((qryProdutoALIQ_PIS.Value * frmpdv.qryItemTOTAL.AsFloat /
        100), -2);

      dados.QRYNFCE_DBASE_ISS.Value := 0;
      dados.QRYNFCE_DALIQ_ISS.Value := 0;
      dados.QRYNFCE_DVALOR_ISS.Value := 0;

      qryIBPT.Close;
      qryIBPT.Params[0].Value := qryProdutoNCM.Value;
      qryIBPT.Open;
      if qryIBPT.IsEmpty then
      begin
        ShowMessage('NCM do produto ' + qryProdutoCODIGO.AsString + '-' +
          qryProdutoDESCRICAO.AsString + #13 + 'Não foi encontrado!');
        exit;
      end;

      dados.qryNFCE_DTRIB_MUN.AsFloat :=
        SimpleRoundTo((strtofloat(stringreplace(qryIBPTMUNICIPAL.Value, '.',
        ',', [])) * frmpdv.qryItemTOTAL.AsFloat) / 100, -2);
      dados.qryNFCE_DTRIB_EST.AsFloat :=
        SimpleRoundTo((strtofloat(stringreplace(qryIBPTESTADUAL.Value, '.', ',',
        [])) * frmpdv.qryItemTOTAL.AsFloat) / 100, -2);
      dados.qryNFCE_DTRIB_FED.AsFloat :=
        SimpleRoundTo((strtofloat(stringreplace(qryIBPTNACIONALFEDERAL.Value,
        '.', ',', [])) * frmpdv.qryItemTOTAL.AsFloat) / 100, -2);
      dados.QRYNFCE_DTRIB_IMP.AsFloat :=
        SimpleRoundTo((strtofloat(stringreplace(qryIBPTIMPORTADOSFEDERAL.Value,
        '.', ',', [])) * frmpdv.qryItemTOTAL.AsFloat) / 100, -2);

      dados.qryNFCE_D.Post;
      dados.Conexao.CommitRetaining;
      i := i + 1;
      frmpdv.qryItem.Next;
    end;

    qrySomaNFCe.Close;
    qrySomaNFCe.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    qrySomaNFCe.Open;

    dados.qryNFCE_M.Edit;
    dados.qryNFCE_MBASEICMS.Value :=
      SimpleRoundTo(qrySomaNFCeBASE_ICMS.AsFloat, -2);
    dados.qryNFCE_MTOTALICMS.Value :=
      SimpleRoundTo(qrySomaNFCeVALOR_ICMS.AsFloat, -2);
    dados.qryNFCE_MBASEISS.Value :=
      SimpleRoundTo(qrySomaNFCeBASE_ISS.AsFloat, -2);
    dados.qryNFCE_MTOTALISS.Value :=
      SimpleRoundTo(qrySomaNFCeVALOR_ISS.AsFloat, -2);
    dados.qryNFCE_MBASEICMSPIS.Value :=
      SimpleRoundTo(qrySomaNFCeBASE_PIS_ICMS.AsFloat, -2);
    dados.qryNFCE_MTOTALICMSPIS.Value :=
      SimpleRoundTo(qrySomaNFCeVALOR_PIS_ICMS.AsFloat, -2);
    dados.qryNFCE_MBASEICMSCOF.Value :=
      SimpleRoundTo(qrySomaNFCeBASE_COF_ICMS.AsFloat, -2);
    dados.qryNFCE_MTOTALICMSCOFINS.Value :=
      SimpleRoundTo(qrySomaNFCeVALOR_COF_ICMS.AsFloat, -2);
    dados.qryNFCE_MTRIB_MUN.Value :=
      SimpleRoundTo(qrySomaNFCeTOTALMUN.AsFloat, -2);
    dados.QRYNFCE_MTRIB_IMP.Value :=
      SimpleRoundTo(qrySomaNFCeTOTALIMP.AsFloat, -2);
    dados.qryNFCE_MTRIB_EST.Value :=
      SimpleRoundTo(qrySomaNFCeTOTALEST.AsFloat, -2);
    dados.qryNFCE_MTRIB_FED.Value :=
      SimpleRoundTo(qrySomaNFCeTOTALFED.AsFloat, -2);
    dados.qryNFCE_MSUBTOTAL.Value :=
      SimpleRoundTo(qrySomaNFCeTOTAL.AsFloat, -2);
    dados.qryNFCE_MDESCONTO.Value :=
      SimpleRoundTo(qrySomaNFCeDESCONTOS.AsFloat, -2);
    dados.qryNFCE_MTOTAL.Value := qrySomaNFCeTOTAL.AsFloat -
      qrySomaNFCeDESCONTOS.AsFloat + qrySomaNFCeOUTROS.AsFloat;
    dados.qryNFCE_M.Post;
  finally
    frmpdv.qryItem.EnableControls;
  end;
end;

procedure TfrmFechaVendaECF.DBEdit2Exit(Sender: TObject);
begin

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'SELECT SUM(VALOR) FROM VENDAS_FPG WHERE ID_FORMA=1 AND VENDAS_MASTER=:ID';
  dados.qryconsulta.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryconsulta.Open;

  if not(frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Edit;

  if dados.qryconsulta.Fields[0].AsFloat = 0 then
  begin
    frmpdv.qryVendaTROCO.Value := 0;
    frmpdv.qryVendaDINHEIRO.Value := 0;
  end;

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'SELECT SUM(VALOR) FROM VENDAS_FPG WHERE (ID_FORMA=1) AND VENDAS_MASTER=:ID';
  dados.qryconsulta.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  dados.qryconsulta.Open;

  if frmpdv.qryVendaDINHEIRO.Value > 0 then
  begin
    if not(frmpdv.qryVenda.State in dsEditModes) then
      frmpdv.qryVenda.Edit;
    frmpdv.qryVendaTROCO.Value := frmpdv.qryVendaDINHEIRO.Value -
      dados.qryconsulta.Fields[0].AsFloat;
  end;

end;

procedure TfrmFechaVendaECF.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmFechaVendaECF.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmFechaVendaECF.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmFechaVendaECF.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
  end;

  if Key = #32 then
  begin

    qrySomaFPG.Close;
    qrySomaFPG.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    qrySomaFPG.Open;

    if not(qryVendasFPG.State in dsEditModes) then
      qryVendasFPG.Edit;
    qryVendasFPGVALOR.AsFloat := frmpdv.qryVendaTOTAL.AsFloat -
      qrySomaFPGTOTAL.AsFloat;
    qryVendasFPG.Post;

  end;

end;

procedure TfrmFechaVendaECF.DBLookupComboBox2Exit(Sender: TObject);
begin
  if frmpdv.qryVendaID_CLIENTE.Value <> dados.qryConfigCLIENTE_PADRAO.Value then
  begin
    if frmpdv.qryVenda.State in dsEditModes then
    begin
      if trim(frmpdv.qryVendaVIRTUAL_CNPJ.Value) <> '' then
        frmpdv.qryVendaCPF_NOTA.Value :=
          TiraPontos(frmpdv.qryVendaVIRTUAL_CNPJ.Value);
    end;
  end;
end;

procedure TfrmFechaVendaECF.DBLookupComboBox4Exit(Sender: TObject);
begin
  if not(frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Edit;

  frmpdv.qryVendaPERCENTUAL_ACRESCIMO.Value :=
    frmpdv.qryVendaVIRTUAL_TX_ACRESC.AsFloat;
  frmpdv.qryVendaACRESCIMO.Value :=
    SimpleRoundTo(frmpdv.qryVendaSUBTOTAL.AsFloat *
    frmpdv.qryVendaVIRTUAL_TX_ACRESC.Value / 100, -2);

  if frmpdv.qryVendaVIRTUAL_TX_ACRESC.Value > 0 then
  begin
    frmpdv.qryVendaPERCENTUAL.Value := 0;
    frmpdv.qryVendaDESCONTO.Value := 0;
  end;
  frmpdv.qryVenda.Post;

  Gera;
end;

procedure TfrmFechaVendaECF.Gera;
begin
  qrySomaOutros.Close;
  qrySomaOutros.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
  qrySomaOutros.Open;

  if SimpleRoundTo(qrySomaOutrosOUTROS.AsFloat, -2)
    = SimpleRoundTo(frmpdv.qryVendaTOTAL.AsFloat, -2) then
  begin
    qryVendasFPG.First;
    exit;
  end;

  try
    qryVendasFPG.DisableControls;
    qryVendasFPG.First;
    if not(qryVendasFPG.State in dsEditModes) then
      qryVendasFPG.Edit;
    qryVendasFPGVALOR.AsFloat := frmpdv.qryVendaTOTAL.AsFloat;
    qryVendasFPG.Post;
    qryVendasFPG.Next;

    while not qryVendasFPG.Eof do
    begin
      qryVendasFPG.Edit;
      qryVendasFPGVALOR.AsFloat := 0;
      qryVendasFPG.Post;
      qryVendasFPG.Next;
    end;
    qryVendasFPG.First;
  finally
    qryVendasFPG.EnableControls;
  end;
end;

procedure TfrmFechaVendaECF.edtDescontoExit(Sender: TObject);
begin
  if not(frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Edit;
  if frmpdv.qryVendaACRESCIMO.AsFloat = 0 then
  begin
    if frmpdv.qryVendaSUBTOTAL.Value > 0 then
      frmpdv.qryVendaPERCENTUAL.Value :=
        SimpleRoundTo(100 - ((frmpdv.qryVendaTOTAL.AsFloat * 100) /
        frmpdv.qryVendaSUBTOTAL.AsFloat), -2);
  end
  else
    frmpdv.qryVendaPERCENTUAL.Value := 0;
  Gera;
  if PageControl1.ActivePageIndex = 0 then
  begin
    DBGridEh1.SelectedIndex := 1;
    DBGridEh1.SetFocus;
  end;
end;

procedure TfrmFechaVendaECF.edtPercenutalExit(Sender: TObject);
begin
  if not(frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Edit;
  if frmpdv.qryVendaACRESCIMO.AsFloat = 0 then
  begin
    frmpdv.qryVendaDESCONTO.AsFloat :=
      SimpleRoundTo((frmpdv.qryVendaSUBTOTAL.AsFloat *
      frmpdv.qryVendaPERCENTUAL.AsFloat / 100), -2);
  end
  else
    frmpdv.qryVendaDESCONTO.AsFloat := 0;
  Gera;
end;

procedure TfrmFechaVendaECF.FinalizarPedido1Click(Sender: TObject);
begin
  btnFinalizar.Click;
end;

procedure TfrmFechaVendaECF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if vFinalizou then
  begin
    dados.vEnviarSefa := 'N';

    frmpdv.BuscaVenda;

    if frmpdv.qryBuscaVendaCODIGO.IsNull then
      frmpdv.inserevenda
    else
    begin
      frmpdv.qryVenda.Close;
      frmpdv.qryVenda.Params[0].Value := frmpdv.qryBuscaVendaCODIGO.Value;
      frmpdv.qryVenda.Open;

      frmpdv.qryVenda.Edit;
      frmpdv.qryVendaDATA_EMISSAO.Value := now;
      frmpdv.qryVendaDATA_SAIDA.Value := now;
      frmpdv.qryVendaFK_CAIXA.Value := dados.idCaixa;
      frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
      frmpdv.qryVenda.Post;
    end;
    frmpdv.qryVenda.Filtered := false;
  end
  else
  begin
    dados.EstornaFinanceiro(frmpdv.qryVendaCODIGO.Value);
    if Caption <> 'Forma de Pagamento' then
    begin
      Action := canone;
      if (Tag = 1) then
        PageControl1.ActivePageIndex := 0;
      if (Tag = 2) then
        PageControl1.ActivePageIndex := 0;

      frmFechaVenda.Caption := 'Forma de Pagamento';
      frmFechaVenda.Height := 600;
      Centraliza;
    end
    else
    begin
      if Application.messageBox
        ('Tem certeza de que deseja sair da tela de forma de pagamento?',
        'Confirmação', mb_Yesno) <> mrYes then
      begin
        Action := canone;
      end;
    end;
  end;
end;

procedure TfrmFechaVendaECF.FormCreate(Sender: TObject);
begin
  TabPrecoNormal.TabVisible := false;
  TabFinaliza.TabVisible := false;
  if not ConfiguraECF then
    Close;
end;

procedure TfrmFechaVendaECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if Key = vk_f3 then
    begin
      DBLookupComboBox2.SetFocus;
      DBLookupComboBox2.DropDown;
    end;
    if Key = vk_f4 then
      edtPercenutal.SetFocus;

    if Key = vk_f5 then
    begin
      PageControl2.ActivePageIndex := 0;
      DBEdit2.SetFocus;
    end;

    if Key = vk_f6 then
    begin
      PageControl2.ActivePageIndex := 0;
      DBEdit5.SetFocus;
    end;

    if Key = vk_f7 then
    begin
      PageControl2.ActivePageIndex := 0;
      DBGridEh1.SetFocus;
    end;

    if Key = vk_f10 then
      btnConcluir.Click;

    if Key = vk_escape then
      if ActiveControl <> DBGridEh1 then
        btnCancelar.Click;
  end;

  if PageControl1.ActivePageIndex = 1 then
  begin
    if Key = vk_f12 then
      PopupMenu1.Popup(frmFechaVenda.Left + 10, frmFechaVenda.Top + 30);

    if Key = vk_f3 then
      if btnOffline.Enabled = true then
        btnOffline.Click;
    if Key = vk_f4 then
      if btnTransmitir.Enabled = true then
        btnTransmitir.Click;
    if Key = vk_f5 then
      if btnPedido.Enabled = true then
        btnPedido.Click;
    if Key = vk_f6 then
      if btnFinalizar.Enabled = true then
        btnFinalizar.Click;

    if Key = vk_escape then
      Close;
  end;

end;

procedure TfrmFechaVendaECF.CadastraFPG;
begin
  qryVendasFPG.Close;
  qryVendasFPG.Open;

  if qryVendasFPG.IsEmpty then
  begin
    qryFPG.First;
    while not qryFPG.Eof do
    begin
      qryVendasFPG.Append;
      qryVendasFPGID_FORMA.Value := qryFPGCODIGO.Value;
      qryVendasFPGTIPO.Value := qryFPGTIPO.Value;
      if qryFPG.bof then
        qryVendasFPGVALOR.AsFloat := frmpdv.qryVendaTOTAL.AsFloat;
      qryVendasFPG.Post;
      qryFPG.Next;
    end;
  end;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmFechaVendaECF.FormShow(Sender: TObject);
begin

  Centraliza;
  if Tag = 1 then
  begin
    pnTabPreco.Visible := false;
    pnACrescimo.Visible := false;
    Panel7.Height := 140;
    edtPercenutal.SetFocus;
  end;
  if Tag = 2 then
  begin
    pnTabPreco.Visible := true;
    pnACrescimo.Visible := true;
    Panel7.Height := 200;
    DBLookupComboBox4.SetFocus;
  end;

  btnPedido.Visible := dados.qryEmpresaIMP_F5.Value = 'S';
  btnFinalizar.Visible := dados.qryEmpresaIMP_F6.Value = 'S';

  btnTransmitir.Visible := dados.qryEmpresaEXIBE_F4.Value = 'S';
  btnOffline.Visible := dados.qryEmpresaEXIBE_F3.Value = 'S';

  vFinalizou := false;

  CadastraFPG;

  if not(frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Edit;

  btnConcluir.Caption := 'F10' + sLineBreak + 'Concluir';
  btnCancelar.Caption := 'Esc' + sLineBreak + 'Cancelar';
end;

procedure TfrmFechaVendaECF.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'FPG' then
  begin
    Value := ' TOTAL:' + FormatFloat(',0.00', dados.qryPVTOTAL.AsFloat);
  end;

end;

procedure TfrmFechaVendaECF.qryFPGAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmFechaVendaECF.qryVendasFPGAfterScroll(DataSet: TDataSet);
begin
  if not qryVendasFPG.bof then
  begin
    if ActiveControl = DBGridEh1 then
    begin
      dados.Conexao.CommitRetaining;
      if not qryVendasFPGTTOTAL.IsNull then
      begin
        if qryVendasFPGTTOTAL.Value = frmpdv.qryVendaTOTAL.AsFloat then
          DBEdit2.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmFechaVendaECF.qryVendasFPGBeforeInsert(DataSet: TDataSet);
begin
  if ActiveControl = DBGridEh1 then
    qryVendasFPG.Cancel;

  if (frmpdv.qryVenda.State in dsEditModes) then
    frmpdv.qryVenda.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmFechaVendaECF.qryVendasFPGBeforeOpen(DataSet: TDataSet);
begin
  qryFPG.Close;
  qryFPG.Open;
end;

procedure TfrmFechaVendaECF.qryVendasFPGNewRecord(DataSet: TDataSet);
begin
  qryVendasFPGCODIGO.Value := dados.Numerador('VENDAS_FPG', 'CODIGO',
    'N', '', '');
  qryVendasFPGVENDAS_MASTER.Value := frmpdv.qryVendaCODIGO.Value;
  qryVendasFPGFK_USUARIO.Value := frmpdv.qryVendaFK_USUARIO.Value;
  qryVendasFPGVALOR.Value := 0;
end;

function TfrmFechaVendaECF.ValidaNegocios: boolean;
var
  Msg: String;
  Inicio: TDateTime;
  Ok: boolean;
  Tempo: String;
begin
  result := true;
  Inicio := now;
  Ok := ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(Msg);
  Tempo := FormatDateTime('hh:nn:ss:zzz', now - Inicio);

  if not Ok then
  begin
    result := false;
    ShowMessage('Erros encontrados' + #13 + Msg + #13 + sLineBreak + #13 +
      'Tempo: ' + Tempo);
  end;
end;

procedure TfrmFechaVendaECF.btnTransmitirClick(Sender: TObject);
var
  i: Integer;
begin

  if dados.qryConfigVERSAODF.Value < 3 then
  begin
    ShowMessage('Informe a Versão do NFCE ');
    exit;
  end;

  if trim(mensagem) <> '' then
  begin
    ShowMessage(mensagem);
    exit;
  end;

  try
    ProgressBar1.Position := 0;
    btnTransmitir.Enabled := false;
    Application.ProcessMessages;

    ProgressBar1.Position := 25;
    Application.ProcessMessages;

    TipoEmissao := 'ON';
    ACBrNFe.NotasFiscais.Clear;

    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;

    dados.qryNFCE_M.Close;
    dados.qryNFCE_M.Params[0].Value := frmpdv.qryVendaCODIGO.Value;
    dados.qryNFCE_M.Open;

    dados.qryNFCE_D.Close;
    dados.qryNFCE_D.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    dados.qryNFCE_D.Open;

    ImportaPedido; // passo 3: importa dados da venda

    dados.qryNFCE_D.Close;
    dados.qryNFCE_D.Params[0].Value := dados.qryNFCE_MCODIGO.Value;
    dados.qryNFCE_D.Open;

    if dados.qryNFCE_D.IsEmpty then
    begin
      ShowMessage('Não Existe Produto Cadastrado Para Venda!' + #13 +
        'Vá na tela cadastro de produtos' + #13 +
        ' e marque a opção Permitir Venda');
      exit;
    end;

    // Verifica atualiza cadastro de produtos
    ProgressBar1.Position := 50;
    Application.ProcessMessages;

    // gerar

    // gera xml nfce

    GerarNFCe(dados.qryNFCE_MNUMERO.AsString); // passo 4 gerar xml

    if not ValidaNegocios then // passo 5 valida xml
      exit;

    dados.qryNFCE_M.Edit;
    dados.qryNFCE_MCHAVE.Value :=
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
    dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
    dados.qryNFCE_M.Post;
    dados.Conexao.CommitRetaining;


    // grava chave do nfe no banco de dados

    ProgressBar1.Position := 75;
    Application.ProcessMessages;

    if dados.qryTerminalUSAGAVETA.Value = 'S' then // abre gaveta
    begin
      ACBrNFe.DANFE := ACBrNFeDANFeESCPOS1;
      ACBrPosPrinter1.AbrirGaveta;
    end;

    try
      if ACBrNFe.Enviar('1', false, true) then // passo 6 envia nfce
      begin
        ProgressBar1.Position := 100;
        Application.ProcessMessages;

        if not(dados.qryNFCE_M.State in dsEditModes) then
          dados.qryNFCE_M.Edit;
        dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items[0]
          .NFe.procNFe.nProt;
        dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
        dados.qryNFCE_M.Post;
        dados.Conexao.CommitRetaining;

        // atualiza status da nfce

        if ACBrNFe.WebServices.Enviar.cStat = 100 then
        begin
          ACBrNFe.NotasFiscais.Items[0].GravarXML('');

          if not(dados.qryNFCE_M.State in dsEditModes) then
            dados.qryNFCE_M.Edit;
          dados.qryNFCE_MCHAVE.Value :=
            copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
          dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.procNFe.nProt;
          dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
          dados.qryNFCE_MFLAG.Value := 'N';
          dados.qryNFCE_MABERTO.Value := 'N';
          dados.qryNFCE_MSITUACAO.Value := 'T';
          dados.qryNFCE_MDATA_EMISSAO.Value := date;
          dados.qryNFCE_MDATA_SAIDA.Value := date;
          dados.qryNFCE_MHORA_EMISSAO.Value := now;
          dados.qryNFCE_MHORA_SAIDA.Value := now;
          dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
          dados.qryNFCE_M.Post;
          dados.Conexao.CommitRetaining;

          frmpdv.qryVenda.Edit;
          frmpdv.qryVendaSITUACAO.Value := 'F';
          frmpdv.qryVendaTIPO.Value := 'V';
          frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
          frmpdv.qryVenda.Post;
          dados.Conexao.CommitRetaining;

          if vImprime then
            ACBrNFe.NotasFiscais.Imprimir
          else
          begin
            if Application.messageBox(Pwidechar('Deseja Imprimir NFC-e?'),
              'Confirmação', mb_Yesno) = mrYes then
              ACBrNFe.NotasFiscais.Imprimir;
          end;
          ApagaFpgZerada;
        end;
      end;

    except
      on e: exception do
      begin
        case ACBrNFe.WebServices.Enviar.cStat of
          101: // cancelada
            begin
              if not(dados.qryNFCE_M.State in dsEditModes) then
                dados.qryNFCE_M.Edit;
              dados.qryNFCE_MCHAVE.Value :=
                copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
              dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items[0]
                .NFe.procNFe.nProt;
              dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
              dados.qryNFCE_MFLAG.Value := 'N';
              dados.qryNFCE_MABERTO.Value := 'N';
              dados.qryNFCE_MSITUACAO.Value := 'C';
              dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
              dados.qryNFCE_M.Post;

              frmpdv.qryVenda.Edit;
              frmpdv.qryVendaSITUACAO.Value := 'F';
              frmpdv.qryVendaTIPO.Value := 'V';
              frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
              frmpdv.qryVenda.Post;
              dados.Conexao.CommitRetaining;

              ApagaFpgZerada;

              ShowMessage('Retorno:' + ACBrNFe.WebServices.Enviar.cStat.ToString
                + ' - ' + ACBrNFe.WebServices.Enviar.xMotivo);

            end;

          204, 539: // duplicidade
            begin
              if not(dados.qryNFCE_M.State in dsEditModes) then
                dados.qryNFCE_M.Edit;
              dados.qryNFCE_MFLAG.Value := 'N';
              dados.qryNFCE_MABERTO.Value := 'N';
              dados.qryNFCE_MSITUACAO.Value := 'D';
              dados.qryNFCE_MDATA_EMISSAO.Value := date;
              dados.qryNFCE_MDATA_SAIDA.Value := date;
              dados.qryNFCE_MHORA_EMISSAO.Value := now;
              dados.qryNFCE_MHORA_SAIDA.Value := now;
              dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
              dados.qryNFCE_M.Post;
              dados.Conexao.CommitRetaining;

              frmpdv.qryVenda.Edit;
              frmpdv.qryVendaSITUACAO.Value := 'F';
              frmpdv.qryVendaTIPO.Value := 'V';
              frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
              frmpdv.qryVenda.Post;
              dados.Conexao.CommitRetaining;

              ApagaFpgZerada;

              ShowMessage('Retorno:' + ACBrNFe.WebServices.Enviar.cStat.ToString
                + ' - ' + ACBrNFe.WebServices.Enviar.xMotivo);

            end;
          563: // inutilizada
            begin
              if not(dados.qryNFCE_M.State in dsEditModes) then
                dados.qryNFCE_M.Edit;
              dados.qryNFCE_MCHAVE.Value :=
                copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
              dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items[0]
                .NFe.procNFe.nProt;
              dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
              dados.qryNFCE_MFLAG.Value := 'N';
              dados.qryNFCE_MABERTO.Value := 'N';
              dados.qryNFCE_MSITUACAO.Value := 'D';
              dados.qryNFCE_MDATA_EMISSAO.Value := date;
              dados.qryNFCE_MDATA_SAIDA.Value := date;
              dados.qryNFCE_MHORA_EMISSAO.Value := now;
              dados.qryNFCE_MHORA_SAIDA.Value := now;
              dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
              dados.qryNFCE_M.Post;
              dados.Conexao.CommitRetaining;

              frmpdv.qryVenda.Edit;
              frmpdv.qryVendaSITUACAO.Value := 'F';
              frmpdv.qryVendaTIPO.Value := 'V';
              frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
              frmpdv.qryVenda.Post;
              dados.Conexao.CommitRetaining;

              ApagaFpgZerada;

              ShowMessage('Retorno:' + ACBrNFe.WebServices.Enviar.cStat.ToString
                + ' - ' + ACBrNFe.WebServices.Enviar.xMotivo);

            end
        else
          begin
            case ACBrNFe.WebServices.Retorno.cStat of
              101: // cancelada
                begin
                  if not(dados.qryNFCE_M.State in dsEditModes) then
                    dados.qryNFCE_M.Edit;
                  dados.qryNFCE_MCHAVE.Value :=
                    copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
                  dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items
                    [0].NFe.procNFe.nProt;
                  dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
                  dados.qryNFCE_MFLAG.Value := 'N';
                  dados.qryNFCE_MABERTO.Value := 'N';
                  dados.qryNFCE_MSITUACAO.Value := 'C';
                  dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
                  dados.qryNFCE_M.Post;

                  frmpdv.qryVenda.Edit;
                  frmpdv.qryVendaSITUACAO.Value := 'F';
                  frmpdv.qryVendaTIPO.Value := 'V';
                  frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
                  frmpdv.qryVenda.Post;
                  dados.Conexao.CommitRetaining;

                  ApagaFpgZerada;

                  ShowMessage('Retorno:' + ACBrNFe.WebServices.Retorno.cStat.
                    ToString + ' - ' + ACBrNFe.WebServices.Retorno.xMotivo);

                end;

              204, 539: // duplicidade
                begin
                  if not(dados.qryNFCE_M.State in dsEditModes) then
                    dados.qryNFCE_M.Edit;
                  dados.qryNFCE_MFLAG.Value := 'N';
                  dados.qryNFCE_MABERTO.Value := 'N';
                  dados.qryNFCE_MSITUACAO.Value := 'D';
                  dados.qryNFCE_MDATA_EMISSAO.Value := date;
                  dados.qryNFCE_MDATA_SAIDA.Value := date;
                  dados.qryNFCE_MHORA_EMISSAO.Value := now;
                  dados.qryNFCE_MHORA_SAIDA.Value := now;
                  dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
                  dados.qryNFCE_M.Post;
                  dados.Conexao.CommitRetaining;

                  frmpdv.qryVenda.Edit;
                  frmpdv.qryVendaSITUACAO.Value := 'F';
                  frmpdv.qryVendaTIPO.Value := 'V';
                  frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
                  frmpdv.qryVenda.Post;
                  dados.Conexao.CommitRetaining;

                  ApagaFpgZerada;

                  ShowMessage('Retorno:' + ACBrNFe.WebServices.Retorno.cStat.
                    ToString + ' - ' + ACBrNFe.WebServices.Retorno.xMotivo);

                end;
              563: // inutilizada
                begin
                  if not(dados.qryNFCE_M.State in dsEditModes) then
                    dados.qryNFCE_M.Edit;
                  dados.qryNFCE_MCHAVE.Value :=
                    copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.id, 4, 100);
                  dados.qryNFCE_MPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items
                    [0].NFe.procNFe.nProt;
                  dados.qryNFCE_MXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
                  dados.qryNFCE_MFLAG.Value := 'N';
                  dados.qryNFCE_MABERTO.Value := 'N';
                  dados.qryNFCE_MSITUACAO.Value := 'D';
                  dados.qryNFCE_MDATA_EMISSAO.Value := date;
                  dados.qryNFCE_MDATA_SAIDA.Value := date;
                  dados.qryNFCE_MHORA_EMISSAO.Value := now;
                  dados.qryNFCE_MHORA_SAIDA.Value := now;
                  dados.qryNFCE_MFK_VENDA.Value := frmpdv.qryVendaCODIGO.Value;
                  dados.qryNFCE_M.Post;
                  dados.Conexao.CommitRetaining;

                  frmpdv.qryVenda.Edit;
                  frmpdv.qryVendaSITUACAO.Value := 'F';
                  frmpdv.qryVendaTIPO.Value := 'V';
                  frmpdv.qryVendaLOTE.Value := frmpdv.Lote;
                  frmpdv.qryVenda.Post;
                  dados.Conexao.CommitRetaining;

                  ApagaFpgZerada;

                  ShowMessage('Retorno:' + ACBrNFe.WebServices.Retorno.cStat.
                    ToString + ' - ' + ACBrNFe.WebServices.Retorno.xMotivo);

                end
            else
              begin
                ShowMessage('Retorno:' + ACBrNFe.WebServices.Retorno.cStat.
                  ToString + ' - ' + ACBrNFe.WebServices.Retorno.xMotivo +
                  sLineBreak + 'Erro:' + e.Message);
                exit;
              end;
            end;
          end;
        end;
      end;
    end;

  finally
    dados.Conexao.CommitRetaining;
    btnTransmitir.Enabled := true;
  end;

  vFinalizou := true;
  Close;
end;

end.
