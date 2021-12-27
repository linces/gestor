unit uBaixaReceber;

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
  ACBrPosPrinter, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frxExportXLS, Vcl.Imaging.pngimage;

type
  TfrmBaixaReceber = class(TForm)
    Panel4: TPanel;
    dsCR: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    qryCR: TFDQuery;
    Label20: TLabel;
    DBEdit3: TDBEdit;
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    Label10: TLabel;
    DBText3: TDBText;
    Label11: TLabel;
    DBText4: TDBText;
    Label12: TLabel;
    DBText5: TDBText;
    Label13: TLabel;
    DBText6: TDBText;
    Label14: TLabel;
    DBText7: TDBText;
    Label15: TLabel;
    DBText8: TDBText;
    Label16: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    qryRecebimento: TFDQuery;
    dsCRR: TDataSource;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    qryCRRAZAO: TStringField;
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
    DBLookupCombobox1: TDBLookupComboboxEh;
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
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRTIPO: TStringField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    qryRecebimentoVALOR_PARCELA: TFMTBCDField;
    qryRecebimentoPERC_JUROS: TFMTBCDField;
    qryRecebimentoJUROS: TFMTBCDField;
    qryRecebimentoPERC_DESCONTO: TFMTBCDField;
    qryRecebimentoDESCONTO: TFMTBCDField;
    qryRecebimentoVALOR_RECEBIDO: TFMTBCDField;
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
    qryRecebimentoID_SUBCAIXA: TIntegerField;
    Memo1: TMemo;
    qryBuscaCaixa: TFDQuery;
    qryBuscaCaixaDESCRICAO: TStringField;
    qryBuscaCaixaLOGIN: TStringField;
    Label9: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    qryFPG: TFDQuery;
    dsFPG: TDataSource;
    qryCaixaFPG: TIntegerField;
    lblAtraso: TLabel;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    qryRecebimentoSALDO_C_JUROS: TExtendedField;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
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
    frxReport: TfrxReport;
    frxDBRecibo: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
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
    frxDBClientes: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    procedure qryCRAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryRecebimentoCalcFields(DataSet: TDataSet);
    procedure qryRecebimentoNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBLookupCombobox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupCombobox1Exit(Sender: TObject);
    procedure DBLookupCombobox1Enter(Sender: TObject);
    procedure qryCaixaBeforePost(DataSet: TDataSet);
    procedure qryRecebimentoBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure Button2Click(Sender: TObject);
  private
    procedure GerarCaixa;
    procedure GerarCR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaReceber: TfrmBaixaReceber;

implementation

{$R *.dfm}

uses Udados, uVendaCartao;

procedure TfrmBaixaReceber.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaReceber.GerarCaixa;
var
  i, Parcelas, Intervalo: Integer;
  valorDif, ValorParcela, SomaTaxa, SomaParcela, TTaxa, TRecebido: extended;
  ValorTaxa: extended;
begin

  qryFPG.Locate('codigo', qryRecebimentoFK_FORMA_PGTO.Value, []);

  Parcelas := 1;
  Intervalo := 0;

  SomaTaxa := 0;
  SomaParcela := 0;

  TTaxa := (qryFPGTAXA.AsFloat * qryRecebimentoVALOR_RECEBIDO.AsFloat) / 100;
  TRecebido := qryRecebimentoVALOR_RECEBIDO.AsFloat;

  ValorTaxa := SimpleRoundTo((TTaxa / Parcelas), -2);
  ValorParcela := SimpleRoundTo((TRecebido / Parcelas), -2);

  Dados.LimpaCaixa(qryRecebimentoCODIGO.Value);

  qryCaixa.Close;
  qryCaixa.Params[0].Value := qryRecebimentoCODIGO.AsString;
  qryCaixa.Open;

  for i := 1 to Parcelas do
  begin

    qryCaixa.Insert;
    qryCaixaEMISSAO.Value := qryRecebimentoDATA.AsDateTime;
    qryCaixaDOC.AsString := 'REC.' + qryCRCODIGO.AsString + '/' +
      qryRecebimentoCODIGO.AsString;
    qryCaixaHORA_EMISSAO.Value := Now;
    qryCaixaTIPO_MOVIMENTO.Value := 'RE';
    qryCaixaECARTAO.Value := 'C';
    qryCaixaID_USUARIO.Value := Dados.idUsuario;
    qryCaixaFKCONTA.Value := qryRecebimentoFKCONTA.Value;
    qryCaixaFPG.Value := qryRecebimentoFK_FORMA_PGTO.Value;
    qryCaixaFKPLANO.Value := qryRecebimentoFKPLANO.Value;
    qryCaixaTRANSFERENCIA.Value := 0;
    qryCaixaHISTORICO.Value := qryCRRAZAO.Value;
    qryCaixaDT_CADASTRO.Value := DATE;
    qryCaixaENTRADA.Value := ValorParcela;
    qryCaixaSAIDA.Value := 0;
    qryCaixaFKRECEBER.Value := qryRecebimentoCODIGO.Value;
    qryCaixaEMPRESA.Value := qryCRFKEMPRESA.Value;
    qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
    qryCaixa.Post;
    Dados.Conexao.CommitRetaining;

    SomaParcela := SomaParcela + qryCaixaENTRADA.AsFloat;

    if i = Parcelas then
    begin
      valorDif := TRecebido - SomaParcela;
      if valorDif <> 0 then
      begin
        qryCaixa.Edit;
        qryCaixaENTRADA.AsFloat := qryCaixaENTRADA.AsFloat - valorDif;
        qryCaixa.Post;
        Dados.Conexao.CommitRetaining;
      end;
    end;

    if TTaxa > 0 then
    begin
      qryCaixa.Insert;
      qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryCaixaEMISSAO.Value := qryRecebimentoDATA.AsDateTime + (Intervalo * i);
      qryCaixaHORA_EMISSAO.Value := Now;
      qryCaixaDOC.Value := 'REC.' + qryCRCODIGO.AsString + '/' +
        qryRecebimentoCODIGO.AsString;
      qryCaixaHISTORICO.Value := qryCRRAZAO.Value + ' - TAXA CARTÃO';
      qryCaixaENTRADA.Value := 0;
      qryCaixaSAIDA.AsFloat := ValorTaxa;
      qryCaixaHORA_EMISSAO.Value := time;
      qryCaixaTIPO_MOVIMENTO.Value := 'RE';
      qryCaixaDT_CADASTRO.Value := DATE;
      qryCaixaID_USUARIO.Value := Dados.idUsuario;
      qryCaixaFKPLANO.Value := Dados.qryEmpresaID_PLANO_TAXA_CARTAO.Value;
      qryCaixaFKCONTA.Value := qryRecebimentoFKCONTA.Value;
      qryCaixaECARTAO.Value := 'C';
      qryCaixaFPG.Value := qryRecebimentoFK_FORMA_PGTO.Value;
      qryCaixaFKRECEBER.Value := qryRecebimentoCODIGO.Value;
      qryCaixaTRANSFERENCIA.Value := 0;
      qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
      qryCaixa.Post;
      Dados.Conexao.CommitRetaining;

      SomaTaxa := SomaTaxa + qryCaixaSAIDA.AsFloat;

      if i = Parcelas then
      begin
        valorDif := TTaxa - SomaTaxa;
        if valorDif <> 0 then
        begin
          qryCaixa.Edit;
          qryCaixaSAIDA.AsFloat := qryCaixaSAIDA.AsFloat - valorDif;
          qryCaixa.Post;
          Dados.Conexao.CommitRetaining;
        end;
      end;
    end;
  end;
end;

procedure TfrmBaixaReceber.GerarCR;
begin
  Dados.qrysomarec.Close;
  Dados.qrysomarec.Params[0].Value := qryCRCODIGO.Value;
  Dados.qrysomarec.Open;
  qryCR.Edit;
  qryCRDATA_RECEBIMENTO.Value := qryRecebimentoDATA.Value;
  qryCRDESCONTO.Value := Dados.qrysomarecDESCONTO.AsFloat;
  qryCRJUROS.Value := Dados.qrysomarecJUROS.AsFloat;
  qryCRVRECEBIDO.Value := Dados.qrysomarecRECEBIDO.AsFloat;
  qryCRVL_RESTANTE.Value := qryCRVALOR.AsFloat -
    (qryCRVRECEBIDO.AsFloat - qryCRJUROS.AsFloat + qryCRDESCONTO.AsFloat);
  if (SimpleRoundTo(qryCRVL_RESTANTE.AsFloat, -2)) <= 0.01 then
    qryCRSITUACAO.Value := 'T'
  else
    qryCRSITUACAO.Value := 'P';
  qryCR.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmBaixaReceber.btnGravarClick(Sender: TObject);
var
  Valor1, valor2: extended;
  i: Integer;
begin

  DBEdit2.SetFocus;

  if (qryRecebimentoFKPLANO.IsNull) or (qryRecebimentoFKPLANO.AsInteger = 0)
  then
  begin
    ShowMessage('Digite PLANO DE CONTAS!');
    DBLookupCombobox1.SetFocus;
    exit;
  end;

  if (qryRecebimentoFKCONTA.IsNull) then
  begin
    ShowMessage('Configure a conta caixa no cadastro de empresa!');
    DBLookupComboboxEh1.SetFocus;
    exit;
  end;

  if qryRecebimentoDATA.IsNull then
  begin
    ShowMessage('Digite DATA DE  PAGAMENTO!');
    DBDateTimeEditEh1.SetFocus;
    exit;
  end;
  Valor1 := SimpleRoundTo(qryRecebimentoVALOR_RECEBIDO.AsFloat, -2);
  valor2 := SimpleRoundTo(qryRecebimentoTSALDO.Value, -2);
  if (Valor1 > valor2) then
  begin
    ShowMessage('VALOR RECEBIDO não pode ser maior que valor da conta!');
    DBEdit4.SetFocus;
    exit;
  end;

  if valor2 > 0 then
  begin
    if not(qryRecebimentoVALOR_RECEBIDO.Value > 0) then
    begin
      ShowMessage('Digite o valor Recebido!');
      DBEdit4.SetFocus;
      exit;
    end;
  end;

  try
    btnGravar.Enabled := false;
    try
      if (qryRecebimento.State in dsEditModes) then
        qryRecebimento.Post;
      Dados.Conexao.CommitRetaining;

      if qryRecebimentoVALOR_RECEBIDO.AsFloat > 0 then
        GerarCaixa;

      GerarCR;

      Application.ProcessMessages;

      if Application.messageBox('Baixa de título efetuada com sucesso!' +
        sLineBreak + 'Deseja Imprimir Comprovante?', 'Confirmação', mb_YesNo) = mrYes
      then
      begin
        qryCliente.Close;
        qryCliente.Params[0].Value := qryCRFKCLIENTE.AsInteger;
        qryCliente.Open;

        frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
          '\Relatorio\RelReciboBobina.fr3');
        frxReport.ShowReport;
      end;

      Close;

    except
      on e: exception do
      begin
        raise exception.Create('Erro ao Baixar parcela!' + #13 + e.Message);
      end;
    end;
  finally
    btnGravar.Enabled := true;
  end;

end;

procedure TfrmBaixaReceber.Button2Click(Sender: TObject);
begin
  // aqui
  ShowMessage('em desenvolvimento');
end;

procedure TfrmBaixaReceber.DBEdit1Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoPERC_JUROS.Value :=
    (qryRecebimentoJUROS.Value / qryRecebimentoVALOR_PARCELA.Value) * 100;
end;

procedure TfrmBaixaReceber.DBEdit5Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoPERC_DESCONTO.Value :=
    (qryRecebimentoDESCONTO.Value / qryRecebimentoSALDO_C_JUROS.Value) * 100;
end;

procedure TfrmBaixaReceber.DBEdit6Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;
  qryRecebimentoDESCONTO.Value :=
    SimpleRoundTo((qryRecebimentoVALOR_PARCELA.AsFloat *
    qryRecebimentoPERC_DESCONTO.AsFloat) / 100, -2);

end;

procedure TfrmBaixaReceber.DBEdit7Exit(Sender: TObject);
begin
  if qryRecebimento.State in dsEditModes then
    qryRecebimento.Edit;

  qryRecebimentoJUROS.Value :=
    SimpleRoundTo((qryRecebimentoVALOR_PARCELA.AsFloat *
    qryRecebimentoPERC_JUROS.AsFloat) / 100, -2);

end;

procedure TfrmBaixaReceber.DBLookupCombobox1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmBaixaReceber.DBLookupCombobox1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmBaixaReceber.DBLookupCombobox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmBaixaReceber.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmBaixaReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = vk_escape then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do contas a receber?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmBaixaReceber.FormShow(Sender: TObject);
begin

  qryFPG.Close;
  qryFPG.Open;

  qryRecebimento.Close;
  qryRecebimento.Params[0].Value := qryCRCODIGO.Value;
  qryRecebimento.Open;
  qryRecebimento.Insert;
  qryRecebimentoPERC_JUROS.Value := Dados.CalculaJuros;
  qryRecebimentoJUROS.Value :=
    SimpleRoundTo((qryRecebimentoVALOR_PARCELA.AsFloat *
    qryRecebimentoPERC_JUROS.AsFloat) / 100, -2);
  DBLookupCombobox1.SetFocus;
  lblAtraso.Caption := Dados.DiasAtraso(qryCRDTVENCIMENTO.Value, DATE,
    Dados.qryEmpresaCARENCIA_JUROS.Value).ToString + ' dias de atraso';

end;

procedure TfrmBaixaReceber.frxReportGetValue(const VarName: string;
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
    Value := Dados.vUsuario;
end;

procedure TfrmBaixaReceber.qryCaixaBeforePost(DataSet: TDataSet);
begin
  if Dados.vLancamentoCaixa then
  begin
    qryCaixaID_SUBCAIXA.Value := Dados.vidLote;
    qryCaixaID_USUARIO.Value := Dados.idUsuario;
  end;

end;

procedure TfrmBaixaReceber.qryCRAfterOpen(DataSet: TDataSet);
begin
  qryPlano.Close;
  qryPlano.Open;

  qryConta.Close;
  qryConta.Open;

end;

procedure TfrmBaixaReceber.qryRecebimentoBeforePost(DataSet: TDataSet);
begin
  if Dados.vLancamentoCaixa then
  begin
    qryRecebimentoID_SUBCAIXA.Value := Dados.vidLote;
    qryRecebimentoFKUSUARIO.Value := Dados.idUsuario;
  end;

  if qryRecebimento.State = dsinsert then
    qryRecebimentoCODIGO.Value := Dados.Numerador('CRRECEBIMENTO', 'CODIGO',
      'N', '', '');

end;

procedure TfrmBaixaReceber.qryRecebimentoCalcFields(DataSet: TDataSet);
begin
  qryRecebimentoSALDO_C_JUROS.AsFloat :=
    SimpleRoundTo(qryCRVL_RESTANTE.AsFloat + qryRecebimentoJUROS.AsFloat, -2);

  qryRecebimentoTSALDO.Value :=
    SimpleRoundTo(qryRecebimentoSALDO_C_JUROS.AsFloat -
    qryRecebimentoDESCONTO.AsFloat, -2);
end;

procedure TfrmBaixaReceber.qryRecebimentoNewRecord(DataSet: TDataSet);
begin

  qryRecebimentoFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryRecebimentoFK_FORMA_PGTO.Value := 1; // dinheiro
  qryRecebimentoFKRECEBER.Value := qryCRCODIGO.Value;
  qryRecebimentoDATA.Value := DATE;
  qryRecebimentoVALOR_PARCELA.Value := qryCRVL_RESTANTE.Value;
  qryRecebimentoPERC_JUROS.Value := 0;
  qryRecebimentoJUROS.Value := 0;
  qryRecebimentoPERC_DESCONTO.Value := 0;
  qryRecebimentoDESCONTO.Value := 0;
  qryRecebimentoVALOR_RECEBIDO.Value := 0;
  qryRecebimentoFKKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
end;

end.
