unit uBaixaPagarLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, ACBrBase, ACBrEnterTab,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,
  ACBrPosPrinter;

type
  TfrmBaixaPagarLote = class(TForm)
    Panel4: TPanel;
    dsBaixaLote: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label20: TLabel;
    qryCaixa: TFDQuery;
    qryCaixaCODIGO: TIntegerField;
    qryCaixaEMISSAO: TDateField;
    qryCaixaDOC: TStringField;
    qryCaixaFKPLANO: TIntegerField;
    qryCaixaFKCONTA: TIntegerField;
    qryCaixaHISTORICO: TStringField;
    qryCaixaFKVENDA: TIntegerField;
    qryCaixaFKCOMPRA: TIntegerField;
    qryCaixaFKPAGAR: TIntegerField;
    qryCaixaFKRECEBER: TIntegerField;
    qryCaixaTRANSFERENCIA: TIntegerField;
    qryCaixaBLOQUEADO: TStringField;
    Label17: TLabel;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    qryPlanoDC: TStringField;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    dsPlano: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label5: TLabel;
    qryConta: TFDQuery;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    dsConta: TDataSource;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    qryCaixaID_SUBCAIXA: TIntegerField;
    Memo1: TMemo;
    Label9: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    qryFPG: TFDQuery;
    dsFPG: TDataSource;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    qryCaixaFPG: TIntegerField;
    Label19: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit7: TDBEdit;
    qryBaixaLote: TFDQuery;
    DBEdit3: TDBEdit;
    qryCPBaixa: TFDQuery;
    qryBaixaLoteCODIGO: TIntegerField;
    qryBaixaLoteDATA: TDateField;
    qryBaixaLoteFK_PLANO: TIntegerField;
    qryBaixaLoteFK_FPG: TIntegerField;
    qryBaixaLoteFK_CONTA: TIntegerField;
    qryBaixaLoteSALDO: TFMTBCDField;
    qryBaixaLoteJUROS_PERC: TFMTBCDField;
    qryBaixaLoteJUROS_VALOR: TFMTBCDField;
    qryBaixaLoteTOTAL_C_JUROS: TFMTBCDField;
    qryBaixaLoteDESCONTO_PERC: TFMTBCDField;
    qryBaixaLoteDESCONTO_VALOR: TFMTBCDField;
    qryBaixaLoteTOTAL_FINAL: TFMTBCDField;
    qryBaixaLoteFK_EMPRESA: TIntegerField;
    qryBaixaLoteFK_USUARIO: TIntegerField;
    qryCPBaixaCODIGO: TIntegerField;
    qryCPBaixaDATA: TDateField;
    qryCPBaixaDOC: TStringField;
    qryCPBaixaVL_RESTANTE: TFMTBCDField;
    qryCPBaixaDTVENCIMENTO: TDateField;
    qryCPBaixaJUROS: TFloatField;
    qryCPBaixaPERC_JUROS: TFloatField;
    qryCPBaixaSALDO_C_JUROS: TFloatField;
    qryCPBaixaTOTAL_JUROS: TAggregateField;
    qryCPBaixaTOTAL_S_JUROS: TAggregateField;
    qryCPBaixaTOTAL_C_JUROS: TAggregateField;
    qryCPBaixaDIAS_ATRASO: TFloatField;
    qryPagamento: TFDQuery;
    qryPagamentoTOTAL_JUROS: TAggregateField;
    qryPagamentoTOTAL_DESCONTO: TAggregateField;
    qryPagamentoTOTAL_RECEBIDO: TAggregateField;
    qryCP: TFDQuery;
    qryCPBaixaFKFORNECE: TIntegerField;
    qryCPCODIGO: TIntegerField;
    qryCPDATA: TDateField;
    qryCPFKFORNECE: TIntegerField;
    qryCPDOC: TStringField;
    qryCPVALOR: TCurrencyField;
    qryCPDTVENCIMENTO: TDateField;
    qryCPHISTORICO: TStringField;
    qryCPDATA_PAGAMENTO: TDateField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
    qryCPSITUACAO: TStringField;
    qryCPFKEMPRESA: TIntegerField;
    qryCPFK_COMPRA: TIntegerField;
    qryCPFLAG: TStringField;
    qryCPFK_USUARIO: TIntegerField;
    qryPagamentoCODIGO: TIntegerField;
    qryPagamentoFKPAGAR: TIntegerField;
    qryPagamentoDATA: TDateField;
    qryPagamentoVALOR_PARCELA: TFMTBCDField;
    qryPagamentoPERC_JUROS: TFMTBCDField;
    qryPagamentoJUROS: TFMTBCDField;
    qryPagamentoPERC_DESCONTO: TFMTBCDField;
    qryPagamentoDESCONTO: TFMTBCDField;
    qryPagamentoVALOR_RECEBIDO: TFMTBCDField;
    qryPagamentoFKPLANO: TIntegerField;
    qryPagamentoFKUSUARIO: TIntegerField;
    qryPagamentoFKKEMPRESA: TIntegerField;
    qryPagamentoFKCONTA: TIntegerField;
    qryPagamentoFK_FORMA_PGTO: TIntegerField;
    qryPagamentoNUMERO_CHEQUE: TIntegerField;
    qryPagamentoFKFORNECEDOR: TIntegerField;
    qryPagamentoFK_LOTE: TIntegerField;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    qryBaixaLoteTOTAL_PAGO: TFMTBCDField;
    qryCPForn: TFDQuery;
    qryCPFornCODIGO: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure qryCPBaixaCalcFields(DataSet: TDataSet);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure qryBaixaLoteJUROS_VALORChange(Sender: TField);
    procedure qryBaixaLoteDESCONTO_VALORChange(Sender: TField);
    procedure qryBaixaLoteBeforePost(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure GerarCaixa;
    procedure BaixaCPPAGAMENTO;
    procedure BaixaCP;
    { Private declarations }
  public

    idfornecedor: integer;
    { Public declarations }
  end;

var
  frmBaixaPagarLote: TfrmBaixaPagarLote;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmBaixaPagarLote.btnCancelarClick(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Cancel;
  Close;
end;

procedure TfrmBaixaPagarLote.btnGravarClick(Sender: TObject);
begin

  DBDateTimeEditEh1.SetFocus;

  if qryBaixaLoteFK_PLANO.IsNull then
  begin
    ShowMessage('Preencha Plano de Contas');
    Exit;
  end;

  if qryBaixaLoteFK_CONTA.IsNull then
  begin
    ShowMessage('Preencha Contas');
    Exit;
  end;

  if qryBaixaLoteFK_FPG.IsNull then
  begin
    ShowMessage('Preencha Forma de Pagamento');
    Exit;
  end;

  if (qryBaixaLoteTOTAL_PAGO.AsFloat > qryBaixaLoteTOTAL_FINAL.AsFloat) then
  begin
    ShowMessage('Valor Pago não pode ser maior que Valor à Pagar!');
    Exit;
  end;

  if (qryBaixaLoteTOTAL_PAGO.AsFloat < qryBaixaLoteJUROS_VALOR.AsFloat) then
  begin
    ShowMessage('Valor Pago não pode ser menor que o Juros!');
    Exit;
  end;

  if (qryBaixaLoteTOTAL_PAGO.AsFloat = 0) or (qryBaixaLoteTOTAL_PAGO.IsNull)
  then
  begin
    ShowMessage('Informe o Valor Pago!');
    Exit;
  end;

  try
    qryBaixaLote.Post;
    dados.Conexao.CommitRetaining;

    BaixaCPPAGAMENTO;

    dados.limpaFlagCP(idfornecedor);
  except
    on e: exception do
    begin
      raise exception.Create(e.Message);
      dados.Conexao.RollbackRetaining;
    end;
  end;

  Close;
end;

procedure TfrmBaixaPagarLote.BaixaCP;
begin
  qryCP.Close;
  qryCP.Params[0].Value := qryCPBaixaCODIGO.AsFloat;
  qryCP.Open;

  if not qryCP.IsEmpty then
  begin
    qryCP.Edit;
    qryCPDATA_PAGAMENTO.Value := qryPagamentoDATA.Value;
    qryCPDESCONTO.AsFloat := qryPagamentoTOTAL_DESCONTO.Value;
    qryCPJUROS.AsFloat := qryPagamentoTOTAL_JUROS.Value;
    qryCPVLPAGO.AsFloat := qryPagamentoTOTAL_RECEBIDO.Value;
    qryCPVL_RESTANTE.AsFloat := qryCPVALOR.AsFloat -
      (qryCPVLPAGO.AsFloat - qryCPJUROS.AsFloat + qryCPDESCONTO.AsFloat);

    if (SimpleRoundTo(qryCPVL_RESTANTE.AsFloat, -2)) <= 0.01 then
      qryCPSITUACAO.Value := 'T'
    else
      qryCPSITUACAO.Value := 'P';
    qryCP.Post;
    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmBaixaPagarLote.BaixaCPPAGAMENTO;
var
  Soma, SomaJuros, SomaDesconto, ValorParcela, Saldo, TotalLiquido, TotalJuros,
    JurosPercentual, ParcelaPercentual: Real;
begin
  Saldo := 0;
  Soma := 0;
  SomaJuros := 0;
  SomaDesconto := 0;

  qryCPBaixa.First;

  TotalLiquido := qryBaixaLoteTOTAL_PAGO.AsFloat -
    qryBaixaLoteJUROS_VALOR.AsFloat;

  TotalJuros := qryBaixaLoteJUROS_VALOR.AsFloat;

  while not qryCPBaixa.eof do
  begin
    Saldo := Saldo + qryCPBaixaVL_RESTANTE.AsFloat;

    if (Saldo <= TotalLiquido) then
      ValorParcela := qryCPBaixaVL_RESTANTE.AsFloat

    else
      ValorParcela := (TotalLiquido - Soma) +
        qryBaixaLoteDESCONTO_VALOR.AsFloat;

    if ValorParcela > 0 then
    begin

      qryPagamento.Close;
      qryPagamento.Params[0].Value := qryCPBaixaCODIGO.AsFloat;
      qryPagamento.Open;

      qryPagamento.Insert;
      qryPagamentoCODIGO.Value := dados.Numerador('CPPAGAMENTO', 'CODIGO',
        'N', '', '');
      qryPagamentoFKFORNECEDOR.Value := qryCPBaixaFKFORNECE.Value;
      qryPagamentoFK_LOTE.Value := qryBaixaLoteCODIGO.Value;
      qryPagamentoFKPAGAR.Value := qryCPBaixaCODIGO.Value;
      qryPagamentoDATA.Value := qryBaixaLoteDATA.Value;
      qryPagamentoFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;
      qryPagamentoFKUSUARIO.Value := dados.idUsuario;
      qryPagamentoFKKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryPagamentoFKCONTA.Value := qryBaixaLoteFK_CONTA.Value;
      qryPagamentoFK_FORMA_PGTO.Value := qryBaixaLoteFK_FPG.Value;
      qryPagamentoVALOR_PARCELA.AsFloat := ValorParcela;
      qryPagamentoFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;

      qryPagamentoJUROS.Value := 0;
      qryPagamentoPERC_JUROS.Value := 0;

      ParcelaPercentual := 0;

      if TotalLiquido > 0 then
        ParcelaPercentual := ValorParcela / TotalLiquido;

      // calulca juros

      qryPagamentoJUROS.AsFloat :=
        SimpleRoundTo(TotalJuros * ParcelaPercentual, -2);

      if ValorParcela > 0 then
        JurosPercentual := (qryPagamentoJUROS.AsFloat / ValorParcela) * 100;

      if JurosPercentual < 0 then
        JurosPercentual := 0;

      qryPagamentoPERC_JUROS.AsFloat := JurosPercentual;

      // calcula desconto

      qryPagamentoDESCONTO.AsFloat := ValorParcela *
        qryBaixaLoteDESCONTO_PERC.AsFloat / 100;

      SimpleRoundTo(qryPagamentoDESCONTO.AsFloat, -2);

      qryPagamentoPERC_DESCONTO.AsFloat :=
        qryBaixaLoteDESCONTO_PERC.AsFloat / 100;

      qryPagamentoPERC_DESCONTO.AsFloat :=
        SimpleRoundTo(qryPagamentoPERC_DESCONTO.AsFloat, -2);

      qryPagamentoVALOR_RECEBIDO.AsFloat :=
        SimpleRoundTo(qryPagamentoVALOR_PARCELA.AsFloat +
        qryPagamentoJUROS.AsFloat - qryPagamentoDESCONTO.AsFloat, -2);

      Soma := Soma + qryCPBaixaVL_RESTANTE.AsFloat;
      SomaJuros := SomaJuros + qryPagamentoJUROS.AsFloat;
      SomaDesconto := SomaDesconto + qryPagamentoDESCONTO.AsFloat;

      qryPagamento.Post;
      dados.Conexao.CommitRetaining;

      BaixaCP;
      GerarCaixa;

      if (Saldo > qryBaixaLoteTOTAL_PAGO.AsFloat) then
        break;
    end;

    qryCPBaixa.Next;
  end;
end;

procedure TfrmBaixaPagarLote.GerarCaixa;
begin
  qryCaixa.Close;
  qryCaixa.Params[0].Value := qryPagamentoCODIGO.AsString;
  qryCaixa.Open;

  if qryCaixa.IsEmpty then
  begin
    qryCaixa.Insert;
    qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  end
  else
    qryCaixa.Edit;
  qryCaixaEMISSAO.Value := DATE;
  qryCaixaDOC.AsString := 'PAG.' + qryCPCODIGO.AsString + '/' +
    qryPagamentoCODIGO.AsString;
  qryCaixaHORA_EMISSAO.Value := Now;
  qryCaixaTIPO_MOVIMENTO.Value := 'PA';
  qryCaixaFKCONTA.Value := qryBaixaLoteFK_CONTA.Value;
  qryCaixaFPG.Value := qryBaixaLoteFK_FPG.Value;
  qryCaixaFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;
  qryCaixaHISTORICO.Value := dados.PegaNomePessoa(idfornecedor);
  qryCaixaENTRADA.Value := 0;
  qryCaixaSAIDA.AsFloat := qryPagamentoVALOR_RECEBIDO.AsFloat;
  qryCaixaFKPAGAR.Value := qryPagamentoCODIGO.Value;
  qryCaixaEMPRESA.Value := qryCPFKEMPRESA.Value;
  qryCaixa.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmBaixaPagarLote.DBEdit3Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteJUROS_VALOR.Value :=
    (qryBaixaLoteSALDO.AsFloat * qryBaixaLoteJUROS_PERC.AsFloat) / 100;

  qryBaixaLoteJUROS_VALOR.Value :=
    SimpleRoundTo(qryBaixaLoteJUROS_VALOR.AsFloat, -2);

end;

procedure TfrmBaixaPagarLote.DBEdit4Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteJUROS_PERC.AsFloat :=
    (SimpleRoundTo(qryBaixaLoteJUROS_VALOR.AsFloat, -2) /
    SimpleRoundTo(qryBaixaLoteSALDO.AsFloat, -2)) * 100;

  qryBaixaLoteJUROS_PERC.AsFloat :=
    SimpleRoundTo(qryBaixaLoteJUROS_PERC.AsFloat, -2)

end;

procedure TfrmBaixaPagarLote.DBEdit6Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteDESCONTO_VALOR.Value :=
    (dados.truncar(qryBaixaLoteSALDO.AsFloat, 2) *
    dados.truncar(qryBaixaLoteDESCONTO_PERC.AsFloat, 2)) / 100;

  qryBaixaLoteDESCONTO_VALOR.AsFloat :=
    dados.truncar(qryBaixaLoteDESCONTO_VALOR.AsFloat, 2);

  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_PAGO.AsFloat :=
      SimpleRoundTo(qryBaixaLoteTOTAL_C_JUROS.AsFloat - 2) -
      SimpleRoundTo(qryBaixaLoteDESCONTO_VALOR.AsFloat, -2);
end;

procedure TfrmBaixaPagarLote.DBEdit9Exit(Sender: TObject);
begin

  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteDESCONTO_PERC.AsFloat :=
    (SimpleRoundTo(qryBaixaLoteDESCONTO_VALOR.AsFloat, -2) /
    SimpleRoundTo(qryBaixaLoteSALDO.AsFloat, -2)) * 100;

  qryBaixaLoteDESCONTO_PERC.AsFloat :=
    SimpleRoundTo(qryBaixaLoteDESCONTO_PERC.AsFloat, -2);

  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_PAGO.AsFloat :=
      SimpleRoundTo(qryBaixaLoteTOTAL_C_JUROS.AsFloat, -2) -
      SimpleRoundTo(qryBaixaLoteDESCONTO_VALOR.AsFloat, -2);
end;

procedure TfrmBaixaPagarLote.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmBaixaPagarLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);

  if Key = vk_escape then
    btnCancelarClick(self);
end;

procedure TfrmBaixaPagarLote.FormShow(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;

  qryPlano.Close;
  qryPlano.Open;

  qryFPG.Close;
  qryFPG.Open;

end;

procedure TfrmBaixaPagarLote.qryBaixaLoteBeforePost(DataSet: TDataSet);
begin
  if qryBaixaLote.State = dsInsert then
    qryBaixaLoteCODIGO.Value := dados.Numerador('CPPAGAMENTO_LOTE', 'CODIGO',
      'N', '', '');
end;

procedure TfrmBaixaPagarLote.qryBaixaLoteDESCONTO_VALORChange(Sender: TField);
begin
  qryBaixaLoteTOTAL_FINAL.AsFloat :=
    SimpleRoundTo(qryBaixaLoteTOTAL_C_JUROS.AsFloat -
    qryBaixaLoteDESCONTO_VALOR.AsFloat, -2);
end;

procedure TfrmBaixaPagarLote.qryBaixaLoteJUROS_VALORChange(Sender: TField);
begin
  qryBaixaLoteTOTAL_C_JUROS.AsFloat :=
    SimpleRoundTo(qryBaixaLoteSALDO.AsFloat +
    qryBaixaLoteJUROS_VALOR.AsFloat, -2);

  qryBaixaLoteTOTAL_FINAL.AsFloat :=
    SimpleRoundTo(qryBaixaLoteSALDO.AsFloat -
    qryBaixaLoteDESCONTO_PERC.AsFloat, -2);

  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_PAGO.AsFloat :=
      SimpleRoundTo(qryBaixaLoteTOTAL_C_JUROS.AsFloat -
      qryBaixaLoteDESCONTO_VALOR.AsFloat, -2);

end;

procedure TfrmBaixaPagarLote.qryCPBaixaCalcFields(DataSet: TDataSet);
begin

  qryCPBaixaDIAS_ATRASO.AsFloat :=
    dados.DiasAtraso(qryCPBaixaDTVENCIMENTO.Value, DATE,
    dados.qryEmpresaCARENCIA_JUROS.AsInteger);

  qryCPBaixaPERC_JUROS.AsFloat := dados.qryEmpresaJUROS_DIA.AsFloat;

  qryCPBaixaJUROS.AsFloat := qryCPBaixaVL_RESTANTE.AsFloat *
    ((qryCPBaixaPERC_JUROS.AsFloat * qryCPBaixaPERC_JUROS.AsFloat) / 100);

  qryCPBaixaJUROS.AsFloat := SimpleRoundTo(qryCPBaixaJUROS.AsFloat, -2);

  qryCPBaixaSALDO_C_JUROS.AsFloat :=
    SimpleRoundTo(qryCPBaixaVL_RESTANTE.AsFloat + qryCPBaixaJUROS.AsFloat, -2);
end;

end.
