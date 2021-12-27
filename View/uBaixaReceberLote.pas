unit uBaixaReceberLote;

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
  ACBrPosPrinter, frxExportXLS, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet;

type
  TfrmBaixaReceberLote = class(TForm)
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
    ACBrPosPrinter2: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS;
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
    qryCRBaixa: TFDQuery;
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
    qryCRBaixaCODIGO: TIntegerField;
    qryCRBaixaDATA: TDateField;
    qryCRBaixaDOC: TStringField;
    qryCRBaixaVL_RESTANTE: TFMTBCDField;
    qryCRBaixaDTVENCIMENTO: TDateField;
    qryCRBaixaJUROS: TFloatField;
    qryCRBaixaPERC_JUROS: TFloatField;
    qryCRBaixaSALDO_C_JUROS: TFloatField;
    qryCRBaixaTOTAL_JUROS: TAggregateField;
    qryCRBaixaTOTAL_S_JUROS: TAggregateField;
    qryCRBaixaTOTAL_C_JUROS: TAggregateField;
    qryCRBaixaDIAS_ATRASO: TFloatField;
    qryRecebimento: TFDQuery;
    qryRecebimentoCODIGO: TIntegerField;
    qryRecebimentoFKCLIENTE: TIntegerField;
    qryRecebimentoFKRECEBER: TIntegerField;
    qryRecebimentoDATA: TDateField;
    qryRecebimentoFKPLANO: TIntegerField;
    qryRecebimentoFKUSUARIO: TIntegerField;
    qryRecebimentoFKKEMPRESA: TIntegerField;
    qryRecebimentoFKCONTA: TIntegerField;
    qryRecebimentoFK_FORMA_PGTO: TIntegerField;
    qryRecebimentoNUMERO_CHEQUE: TIntegerField;
    qryRecebimentoTSALDO: TFloatField;
    qryRecebimentoVALOR_PARCELA: TFMTBCDField;
    qryRecebimentoPERC_JUROS: TFMTBCDField;
    qryRecebimentoJUROS: TFMTBCDField;
    qryRecebimentoPERC_DESCONTO: TFMTBCDField;
    qryRecebimentoDESCONTO: TFMTBCDField;
    qryRecebimentoVALOR_RECEBIDO: TFMTBCDField;
    qryRecebimentoID_SUBCAIXA: TIntegerField;
    qryRecebimentoSALDO_C_JUROS: TExtendedField;
    qryBuscaCaixa: TFDQuery;
    qryBuscaCaixaDESCRICAO: TStringField;
    qryBuscaCaixaLOGIN: TStringField;
    qryCRBaixaFKCLIENTE: TIntegerField;
    qryRecebimentoTOTAL_JUROS: TAggregateField;
    qryRecebimentoTOTAL_DESCONTO: TAggregateField;
    qryRecebimentoTOTAL_RECEBIDO: TAggregateField;
    qryCR: TFDQuery;
    qryRecebimentoFKLOTE: TIntegerField;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRVALOR: TCurrencyField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRFKCONTA: TIntegerField;
    qryCRTIPO: TStringField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryCRFLAG: TStringField;
    qryCRFK_OS: TIntegerField;
    qryCRBLOQUEADO: TStringField;
    qryCRFK_USUARIO: TIntegerField;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    qryBaixaLoteTOTAL_RECEBIDO: TFMTBCDField;
    qryCRClie: TFDQuery;
    qryCRClieCODIGO: TIntegerField;
    qryFPGGERACR: TStringField;
    qryFPGGERACH: TStringField;
    qryFPGECARTAO: TStringField;
    qryFPGUSAVD: TStringField;
    qryFPGUSACR: TStringField;
    qryFPGATIVO: TStringField;
    qryFPGPARCELAS: TIntegerField;
    qryFPGINTERVALO: TIntegerField;
    qryFPGTAXA: TFMTBCDField;
    qryFPGENTRADA: TFMTBCDField;
    qryFPGTIPO: TStringField;
    qryFPGDIAS: TSmallintField;
    qryFPGFKCONTADESTINO: TIntegerField;
    qryFPGCOD_BEMA: TStringField;
    qryFPGCOD_DARU: TStringField;
    qryFPGCOD_ELGI: TStringField;
    qryFPGCOD_EPSO: TStringField;
    qryFPGGERACC: TStringField;
    qryFPGGERACX: TStringField;
    frxDBEmpresa: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBRecibo: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDBClientes: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    qryCliente: TFDQuery;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteCNPJ: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteMUNICIPIO: TStringField;
    qryClienteFONE1: TStringField;
    qryClienteCEP: TStringField;
    qryClienteUF: TStringField;
    qryClienteCODMUN: TIntegerField;
    qryClienteCIDADE: TStringField;
    qryClienteNUMERO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryCRBaixaCalcFields(DataSet: TDataSet);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure qryBaixaLoteJUROS_VALORChange(Sender: TField);
    procedure qryBaixaLoteDESCONTO_VALORChange(Sender: TField);
    procedure qryBaixaLoteBeforePost(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure qryCaixaBeforePost(DataSet: TDataSet);
    procedure qryRecebimentoBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
  private
    procedure BaixaCR;
    procedure BaixaCRRecebimento;
    procedure GerarCaixa;
    { Private declarations }
  public
    idCliente: integer;
    { Public declarations }
  end;

var
  frmBaixaReceberLote: TfrmBaixaReceberLote;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmBaixaReceberLote.btnCancelarClick(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Cancel;
  Close;
end;

procedure TfrmBaixaReceberLote.btnGravarClick(Sender: TObject);
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

  if (qryBaixaLoteTOTAL_RECEBIDO.AsFloat > qryBaixaLoteTOTAL_FINAL.AsFloat) then
  begin
    ShowMessage('Valor Recebido não pode ser maior que Valor à Receber!');
    Exit;
  end;

  if (qryBaixaLoteTOTAL_RECEBIDO.AsFloat < qryBaixaLoteJUROS_VALOR.AsFloat) then
  begin
    ShowMessage('Valor Recebido não pode ser menor que o Juros!');
    Exit;
  end;

  if (qryBaixaLoteTOTAL_RECEBIDO.AsFloat = 0) or
    (qryBaixaLoteTOTAL_RECEBIDO.IsNull) then
  begin
    ShowMessage('Informe o valor Pago!');
    Exit;
  end;

  qryBaixaLote.Post;
  dados.Conexao.CommitRetaining;

  try

    BaixaCRRecebimento;
    BaixaCR;
    GerarCaixa;
    dados.limpaFlagCR(idCliente);

    if Application.messageBox('Baixa de título efetuada com sucesso!' +
      sLineBreak + 'Deseja Imprimir Comprovante?', 'Confirmação', mb_YesNo) = mrYes
    then
    begin
      qryCliente.Close;
      qryCliente.Params[0].Value := qryCRFKCLIENTE.AsInteger;
      qryCliente.Open;

      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelReciboBobinaLote.fr3');
      frxReport.ShowReport;
    end;

  except
    dados.Conexao.RollbackRetaining;
  end;

  Close;
end;

procedure TfrmBaixaReceberLote.BaixaCR;
begin

  qryCRBaixa.Close;
  qryCRBaixa.Params[0].Value := idCliente;
  qryCRBaixa.Open;

  qryCRBaixa.First;

  while not qryCRBaixa.Eof do
  begin

    qryRecebimento.Close;
    qryRecebimento.Params[0].Value := qryCRBaixaCODIGO.AsFloat;
    qryRecebimento.Open;

    qryCR.Close;
    qryCR.Params[0].Value := qryCRBaixaCODIGO.AsFloat;
    qryCR.Open;

    if not qryCR.IsEmpty then
    begin
      if (qryRecebimentoTOTAL_RECEBIDO.Value > 0) then
      begin

        qryCR.Edit;
        qryCRDATA_RECEBIMENTO.Value := qryRecebimentoDATA.Value;
        qryCRDESCONTO.AsFloat := qryRecebimentoTOTAL_DESCONTO.Value;
        qryCRJUROS.AsFloat := qryRecebimentoTOTAL_JUROS.Value;
        qryCRVRECEBIDO.AsFloat := qryRecebimentoTOTAL_RECEBIDO.Value;

        qryCRVL_RESTANTE.Value := qryCRVALOR.AsFloat -
          (qryCRVRECEBIDO.AsFloat - qryCRJUROS.AsFloat + qryCRDESCONTO.AsFloat);

        if (dados.truncar(qryCRVL_RESTANTE.AsFloat, 3)) <= 0.01 then
          qryCRSITUACAO.Value := 'T'
        else
          qryCRSITUACAO.Value := 'P';
        qryCR.Post;
        dados.Conexao.CommitRetaining;
      end;
    end;

    qryCRBaixa.Next;

  end;

end;

procedure TfrmBaixaReceberLote.BaixaCRRecebimento;
var
  Soma, SomaJuros, SomaDesconto, ValorParcela, Saldo, TotalLiquido, TotalJuros,
    JurosPercentual, ParcelaPercentual: Real;
begin
  Saldo := 0;
  Soma := 0;
  SomaJuros := 0;
  SomaDesconto := 0;

  qryCRBaixa.Close;
  qryCRBaixa.Params[0].Value := idCliente;
  qryCRBaixa.Open;

  qryCRBaixa.First;

  TotalLiquido := qryBaixaLoteTOTAL_RECEBIDO.AsFloat -
    qryBaixaLoteJUROS_VALOR.AsFloat;

  TotalJuros := qryBaixaLoteJUROS_VALOR.AsFloat;

  while not qryCRBaixa.Eof do
  begin
    Saldo := Saldo + qryCRBaixaVL_RESTANTE.AsFloat;

    if (Saldo <= TotalLiquido) then
      ValorParcela := qryCRBaixaVL_RESTANTE.AsFloat

    else
      ValorParcela := (TotalLiquido - Soma) +
        qryBaixaLoteDESCONTO_VALOR.AsFloat;

    if ValorParcela > 0 then
    begin

      qryRecebimento.Close;
      qryRecebimento.Params[0].Value := qryCRBaixaCODIGO.AsFloat;
      qryRecebimento.Open;

      qryRecebimento.Insert;
      qryRecebimentoCODIGO.Value := dados.Numerador('CRRECEBIMENTO', 'CODIGO',
        'N', '', '');
      qryRecebimentoFKCLIENTE.Value := qryCRBaixaFKCLIENTE.Value;
      qryRecebimentoFKLOTE.Value := qryBaixaLoteCODIGO.Value;
      qryRecebimentoFKRECEBER.Value := qryCRBaixaCODIGO.Value;
      qryRecebimentoDATA.Value := qryBaixaLoteDATA.Value;
      qryRecebimentoFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;
      qryRecebimentoFKUSUARIO.Value := dados.idUsuario;
      qryRecebimentoFKKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryRecebimentoFKCONTA.Value := qryBaixaLoteFK_CONTA.Value;
      qryRecebimentoFK_FORMA_PGTO.Value := qryBaixaLoteFK_FPG.Value;
      qryRecebimentoVALOR_PARCELA.AsFloat := ValorParcela;
      qryRecebimentoFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;

      qryRecebimentoJUROS.Value := 0;
      qryRecebimentoPERC_JUROS.Value := 0;

      ParcelaPercentual := 0;

      if TotalLiquido > 0 then
        ParcelaPercentual := ValorParcela / TotalLiquido;

      // calulca juros

      qryRecebimentoJUROS.AsFloat :=
        dados.truncar(TotalJuros * ParcelaPercentual, 3);

      if ValorParcela > 0 then
        JurosPercentual := (qryRecebimentoJUROS.AsFloat / ValorParcela) * 100;

      if JurosPercentual < 0 then
        JurosPercentual := 0
      else
        qryRecebimentoPERC_JUROS.AsFloat := JurosPercentual;

      // calcula desconto

      qryRecebimentoDESCONTO.AsFloat := ValorParcela *
        (qryBaixaLoteDESCONTO_PERC.AsFloat / 100);

      qryRecebimentoDESCONTO.AsFloat :=
        dados.truncar(qryRecebimentoDESCONTO.AsFloat, 3);

      qryRecebimentoPERC_DESCONTO.AsFloat :=
        qryBaixaLoteDESCONTO_PERC.AsFloat / 100;

      qryRecebimentoVALOR_RECEBIDO.AsFloat :=
        qryRecebimentoVALOR_PARCELA.AsFloat + qryRecebimentoJUROS.AsFloat -
        qryRecebimentoDESCONTO.AsFloat;

      qryRecebimentoVALOR_RECEBIDO.AsFloat :=
        dados.truncar(qryRecebimentoVALOR_RECEBIDO.AsFloat, 3);

      Soma := Soma + qryCRBaixaVL_RESTANTE.AsFloat;
      SomaJuros := SomaJuros + qryRecebimentoJUROS.AsFloat;
      SomaDesconto := SomaDesconto + qryRecebimentoDESCONTO.AsFloat;

      qryRecebimento.Post;
      dados.Conexao.CommitRetaining;
    end;

    qryCRBaixa.Next;
  end;
end;

procedure TfrmBaixaReceberLote.GerarCaixa;
var
  i, Parcelas, Intervalo: integer;
  valorDif, ValorParcela, SomaTaxa, SomaParcela, TTaxa, TRecebido: extended;
  ValorTaxa: extended;
begin

  qryCRBaixa.Close;
  qryCRBaixa.Params[0].Value := idCliente;
  qryCRBaixa.Open;

  qryCRBaixa.First;

  while not qryCRBaixa.Eof do
  begin

    qryRecebimento.Close;
    qryRecebimento.Params[0].Value := qryCRBaixaCODIGO.AsFloat;
    qryRecebimento.Open;

    qryFPG.Locate('codigo', qryBaixaLoteFK_FPG.Value, []);

    Parcelas := 1;
    Intervalo := 0;

    SomaTaxa := 0;
    SomaParcela := 0;

    TTaxa := (qryFPGTAXA.AsFloat * qryRecebimentoTOTAL_RECEBIDO.Value) / 100;
    TRecebido := qryRecebimentoTOTAL_RECEBIDO.Value;

    ValorTaxa := SimpleRoundTo((TTaxa / Parcelas), -2);
    ValorParcela := SimpleRoundTo((TRecebido / Parcelas), -2);

    if ValorParcela > 0 then
    begin

      dados.LimpaCaixa(qryRecebimentoCODIGO.Value);

      qryCaixa.Close;
      qryCaixa.Params[0].Value := qryRecebimentoCODIGO.AsString;
      qryCaixa.Open;

      for i := 1 to Parcelas do
      begin

        if qryCaixa.IsEmpty then
        begin
          qryCaixa.Insert;
          qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
            'N', '', '');
          qryCaixaEMISSAO.Value := qryBaixaLoteDATA.AsDateTime;
          qryCaixaDOC.AsString := 'REC.' + qryRecebimentoFKRECEBER.AsString +
            '/' + qryRecebimentoCODIGO.AsString;
          qryCaixaHORA_EMISSAO.Value := Now;
          qryCaixaTIPO_MOVIMENTO.Value := 'RE';
          qryCaixaFKCONTA.Value := qryBaixaLoteFK_CONTA.Value;
          qryCaixaFPG.Value := qryBaixaLoteFK_FPG.Value;
          qryCaixaFKPLANO.Value := qryBaixaLoteFK_PLANO.Value;
          qryCaixaHISTORICO.Value := dados.PegaNomePessoa(idCliente);
          qryCaixaENTRADA.AsFloat := ValorParcela;
          qryCaixaSAIDA.Value := 0;
          qryCaixaFKRECEBER.Value := qryRecebimentoCODIGO.Value;
          qryCaixaEMPRESA.Value := qryCRFKEMPRESA.Value;
          qryCaixa.Post;
          dados.Conexao.CommitRetaining;

          SomaParcela := SomaParcela + qryCaixaENTRADA.AsFloat;

          if i = Parcelas then
          begin
            valorDif := TRecebido - SomaParcela;
            if valorDif <> 0 then
            begin
              qryCaixa.Edit;
              qryCaixaENTRADA.AsFloat := qryCaixaENTRADA.AsFloat - valorDif;
              qryCaixa.Post;
              dados.Conexao.CommitRetaining;
            end;
          end;

          if TTaxa > 0 then
          begin
            qryCaixa.Insert;
            qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
              'N', '', '');
            qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
            qryCaixaEMISSAO.Value := qryBaixaLoteDATA.AsDateTime +
              (Intervalo * i);
            qryCaixaDOC.Value := 'REC.' + qryRecebimentoFKRECEBER.AsString + '/'
              + qryRecebimentoCODIGO.AsString;
            qryCaixaHISTORICO.Value := 'TX CARTÃO-' +
              dados.PegaNomePessoa(idCliente);
            qryCaixaENTRADA.Value := 0;
            qryCaixaSAIDA.AsFloat := ValorTaxa;
            qryCaixaHORA_EMISSAO.Value := time;
            qryCaixaTIPO_MOVIMENTO.Value := 'TC';
            qryCaixaID_USUARIO.Value := dados.idUsuario;
            qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_TAXA_CARTAO.Value;
            qryCaixaFKCONTA.Value := qryBaixaLoteFK_CONTA.Value;
            qryCaixaECARTAO.Value := 'C';
            qryCaixaFPG.Value := qryBaixaLoteFK_FPG.Value;
            qryCaixaFKRECEBER.Value := qryRecebimentoCODIGO.Value;
            qryCaixaTRANSFERENCIA.Value := 0;
            qryCaixa.Post;
            dados.Conexao.CommitRetaining;

            if i = Parcelas then
            begin
              valorDif := TTaxa - SomaTaxa;
              if valorDif <> 0 then
              begin
                qryCaixa.Edit;
                qryCaixaSAIDA.AsFloat := qryCaixaSAIDA.AsFloat - valorDif;
                qryCaixa.Post;
                dados.Conexao.CommitRetaining;
              end;
            end;

          end;
        end;
      end;
    end;
    qryCRBaixa.Next;
  end;
end;

procedure TfrmBaixaReceberLote.DBEdit3Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteJUROS_VALOR.Value :=
    (qryBaixaLoteSALDO.AsFloat * qryBaixaLoteJUROS_PERC.AsFloat) / 100;
  qryBaixaLoteJUROS_VALOR.Value :=
    dados.truncar(qryBaixaLoteJUROS_VALOR.AsFloat, 3);
end;

procedure TfrmBaixaReceberLote.DBEdit4Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteJUROS_PERC.AsFloat :=
    (qryBaixaLoteJUROS_VALOR.AsFloat / qryBaixaLoteSALDO.AsFloat) * 100;

  qryBaixaLoteJUROS_PERC.AsFloat :=
    dados.truncar(qryBaixaLoteJUROS_PERC.AsFloat, 3);

  if qryBaixaLoteJUROS_PERC.AsFloat < 0 then
    qryBaixaLoteJUROS_PERC.AsFloat := 0;

end;

procedure TfrmBaixaReceberLote.DBEdit6Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;

  qryBaixaLoteDESCONTO_VALOR.Value :=
    (qryBaixaLoteSALDO.AsFloat * qryBaixaLoteDESCONTO_PERC.AsFloat) / 100;

  qryBaixaLoteDESCONTO_VALOR.Value :=
    dados.truncar(qryBaixaLoteDESCONTO_VALOR.AsFloat, 3);

  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_RECEBIDO.AsFloat := qryBaixaLoteTOTAL_C_JUROS.AsFloat -
      qryBaixaLoteDESCONTO_VALOR.AsFloat;

end;

procedure TfrmBaixaReceberLote.DBEdit9Exit(Sender: TObject);
begin
  if qryBaixaLote.State in dsEditModes then
    qryBaixaLote.Edit;
  qryBaixaLoteDESCONTO_PERC.AsFloat :=
    (qryBaixaLoteDESCONTO_VALOR.AsFloat / qryBaixaLoteSALDO.AsFloat) * 100;
  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_RECEBIDO.AsFloat := qryBaixaLoteTOTAL_C_JUROS.AsFloat -
      qryBaixaLoteDESCONTO_VALOR.AsFloat;
end;

procedure TfrmBaixaReceberLote.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmBaixaReceberLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);

  if Key = vk_escape then
    btnCancelarClick(self);
end;

procedure TfrmBaixaReceberLote.FormShow(Sender: TObject);
begin
  qryConta.Close;
  qryConta.Open;

  qryPlano.Close;
  qryPlano.Open;

  qryFPG.Close;
  qryFPG.Open;

end;

procedure TfrmBaixaReceberLote.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'CAIXA' then
  begin
    if qryBuscaCaixa.IsEmpty then
      Value := 'CAIXA GERAL'
    else
      Value := qryBuscaCaixaDESCRICAO.AsString;
  end;

  if VarName = 'USUARIO' then
    Value := dados.vUsuario;
end;

procedure TfrmBaixaReceberLote.qryBaixaLoteBeforePost(DataSet: TDataSet);
begin
  if qryBaixaLote.State = dsInsert then
    qryBaixaLoteCODIGO.Value := dados.Numerador('CRRECEBIMENTO_LOTE', 'CODIGO',
      'N', '', '');
end;

procedure TfrmBaixaReceberLote.qryBaixaLoteDESCONTO_VALORChange(Sender: TField);
begin
  qryBaixaLoteTOTAL_FINAL.AsFloat := qryBaixaLoteTOTAL_C_JUROS.AsFloat -
    qryBaixaLoteDESCONTO_VALOR.AsFloat;
end;

procedure TfrmBaixaReceberLote.qryBaixaLoteJUROS_VALORChange(Sender: TField);
begin
  qryBaixaLoteTOTAL_C_JUROS.AsFloat := qryBaixaLoteSALDO.AsFloat +
    qryBaixaLoteJUROS_VALOR.AsFloat;

  qryBaixaLoteTOTAL_FINAL.AsFloat := qryBaixaLoteSALDO.AsFloat -
    qryBaixaLoteDESCONTO_PERC.AsFloat;

  if DBEdit8.ReadOnly then
    qryBaixaLoteTOTAL_RECEBIDO.AsFloat := qryBaixaLoteTOTAL_C_JUROS.AsFloat -
      qryBaixaLoteDESCONTO_VALOR.AsFloat;

end;

procedure TfrmBaixaReceberLote.qryCaixaBeforePost(DataSet: TDataSet);
begin
  if dados.vLancamentoCaixa then
  begin
    qryCaixaID_SUBCAIXA.Value := dados.vidLote;
    qryCaixaID_USUARIO.Value := dados.idUsuario;
  end;

end;

procedure TfrmBaixaReceberLote.qryCRBaixaCalcFields(DataSet: TDataSet);
begin

  qryCRBaixaDIAS_ATRASO.AsFloat :=
    dados.DiasAtraso(qryCRBaixaDTVENCIMENTO.Value, date,
    dados.qryEmpresaCARENCIA_JUROS.AsInteger);

  if qryCRBaixaPERC_JUROS.AsFloat < 0 then
    qryCRBaixaPERC_JUROS.AsFloat := 0
  else
    qryCRBaixaPERC_JUROS.AsFloat := dados.qryEmpresaJUROS_DIA.AsFloat;

  qryCRBaixaJUROS.AsFloat :=
    (qryCRBaixaVL_RESTANTE.AsFloat * (qryCRBaixaDIAS_ATRASO.AsFloat *
    qryCRBaixaPERC_JUROS.AsFloat)) / 100;

  qryCRBaixaJUROS.AsFloat := dados.truncar(qryCRBaixaJUROS.AsFloat, 3);

  qryCRBaixaSALDO_C_JUROS.AsFloat := qryCRBaixaVL_RESTANTE.AsFloat +
    qryCRBaixaJUROS.AsFloat;

  qryCRBaixaSALDO_C_JUROS.AsFloat :=
    dados.truncar(qryCRBaixaSALDO_C_JUROS.AsFloat, 3);
end;

procedure TfrmBaixaReceberLote.qryRecebimentoBeforePost(DataSet: TDataSet);
begin
  if dados.vLancamentoCaixa then
  begin
    qryRecebimentoID_SUBCAIXA.Value := dados.vidLote;
    qryRecebimentoFKUSUARIO.Value := dados.idUsuario;
  end;
end;

end.

