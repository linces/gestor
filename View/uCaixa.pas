unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, dateutils, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  frxExportXLS, JvComponentBase, JvEnterTab;

type
  TfrmCaixa = class(TForm)
    dsCaixa: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    btnExcluir: TSpeedButton;
    qrSaldo: TFDQuery;
    dsSaldo: TDataSource;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBCaixa: TfrxDBDataset;
    btnNovo: TSpeedButton;
    btnImp: TSpeedButton;
    btnAlterar: TSpeedButton;
    frxDBSaldo: TfrxDBDataset;
    qryContas: TFDQuery;
    qryContasCODIGO: TIntegerField;
    qryContasDESCRICAO: TStringField;
    qryContasTIPO: TStringField;
    dsContas: TDataSource;
    dsEmpresa: TDataSource;
    qrySaldoAnterior: TFDQuery;
    qrySoma: TFDQuery;
    btnAtualizar: TSpeedButton;
    qrSaldoSALDO: TFMTBCDField;
    qrySaldoAnteriorSALDO: TFMTBCDField;
    qrySomaENTRADA: TFMTBCDField;
    qrySomaSAIDA: TFMTBCDField;
    qryCaixaResumido: TFDQuery;
    qryCaixaResumidoENTRADA: TFMTBCDField;
    qryCaixaResumidoSAIDA: TFMTBCDField;
    dsCaixaResumido: TDataSource;
    frxDBResumo: TfrxDBDataset;
    qryCaixaResumidoTENTRADA: TAggregateField;
    qryCaixaResumidoTSAIDA: TAggregateField;
    qryCaixaResumidoTSALDO: TAggregateField;
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
    qryCaixaTSALDO: TExtendedField;
    qryCaixaBLOQUEADO: TStringField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaECARTAO: TStringField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaVIRTUAL_PLANO: TStringField;
    qryCaixaVIRTUAL_CONTA: TStringField;
    qryCaixaVIRTUAL_CONTA2: TStringField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaVIRTUAL_EMPRESA: TStringField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    qryCaixaTENTRADA: TAggregateField;
    qryCaixaTSAIDA: TAggregateField;
    qryCaixaResumidoTIPO_MOVIMENTO: TStringField;
    qryCaixaResumidoVIRTUAL_MOVIMENTO: TStringField;
    qryCaixaRESUMO_CAIXA: TStringField;
    frxXLSExport1: TfrxXLSExport;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label5: TLabel;
    LblSaldo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBText4: TDBText;
    Label7: TLabel;
    lblSaida: TLabel;
    lblEntrada: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    LblPeriodo: TLabel;
    Label6: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    cbConta: TDBLookupComboBox;
    edtLoc: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure EdtAnoExit(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtLocChange(Sender: TObject);
    procedure cbLocChange(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbContaClick(Sender: TObject);
    procedure qryCaixaResumidoCalcFields(DataSet: TDataSet);
    procedure cbContaEnter(Sender: TObject);
  private
    vSaldoMes: Extended;
    vOrdem: string[5];
    procedure localiza;
    procedure tamanho;
    function RetornaPlano(descricao: string): Integer;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses uCadCaixa, Udados, uSupervisor;

procedure TfrmCaixa.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmCaixa.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelCaixa.fr3');

    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  if qryCaixa.IsEmpty then
  begin
    ShowMessage('Não exite lançamento para ser alterado!');
    exit;
  end;

  if qryCaixaBLOQUEADO.Value = 'S' then
  begin
    ShowMessage('Não é possivel alterar lançamento automático!');
    exit;
  end;

  if qryCaixaTRANSFERENCIA.Value > 0 then
  begin
    ShowMessage('Não é possivel alterar Transferência!');
    exit;
  end;

  if qryCaixaFKCOMPRA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela COMPRA Nº' + qryCaixaFKCOMPRA.AsString +
      #13 + 'Não pode ser alterado por esta tela!' + #13 +
      'É necessário alterar a Compra!');
    exit;
  end;

  if qryCaixaFKVENDA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela VENDA Nº' + qryCaixaFKVENDA.AsString +
      #13 + 'Não pode ser alterado por esta tela!' + #13 +
      'É necessário alterar a Venda!');
    exit;
  end;

  if qryCaixaFKRECEBER.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pelo CONTAS RECEBER Nº' +
      qryCaixaFKRECEBER.AsString + #13 + 'Não pode ser alterado por esta tela!'
      + #13 + 'É necessário alterar o Recebimento!');
    exit;
  end;

  if qryCaixaFKPAGAR.Value > 0 then
  begin
    Dados.qryConsulta.Close;
    Dados.qryConsulta.SQL.Text :=
      'select FKPAGAR from CPPAGAMENTO where codigo=:cod';
    Dados.qryConsulta.Params[0].Value := qryCaixaFKPAGAR.Value;
    Dados.qryConsulta.Open;

    ShowMessage('Lançamento gerado pelo CONTAS PAGAR Nº' +
      Dados.qryConsulta.Fields[0].AsString + #13 +
      'Não pode ser alterado por esta tela!' + #13 +
      'É necessário alterar o Pagamento!');
    exit;
  end;

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    'select tipo from contas where tipo=''S'' and codigo=:codigo';
  Dados.qryConsulta.Params[0].Value := qryCaixaFKCONTA.Value;
  Dados.qryConsulta.Open;
  if not Dados.qryConsulta.IsEmpty then
  begin
    ShowMessage('Conta é SubCaixa!' + #13 +
      'Não é permitido inserir dados manualmente nesta conta!');
    exit;
  end;

  if qryCaixaFKPAGAR.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pelo CONTAS PAGAR Nº' +
      qryCaixaFKPAGAR.AsString + #13 + 'Não pode ser alterado por esta tela!' +
      #13 + 'É necessário alterar o Pagamento!');
    exit;
  end;

  Dados.vAutorizar := true;
  if not Dados.eSupervisor then
  begin
    try
      btnAlterar.Enabled := false;
      frmSupervisor := TFrmSupervisor.Create(Application);
      Dados.vAutorizar := false;
      frmSupervisor.ShowModal;
    finally
      frmSupervisor.Release;
      btnAlterar.Enabled := true;
    end;
  end;

  if not Dados.vAutorizar then
  begin
    exit;
  end;

  if not qryCaixa.IsEmpty then
  begin
    try
      btnAlterar.Enabled := false;
      frmCadCaixa := TfrmCadCaixa.Create(Application);

      frmCadCaixa.qryCaixa.Close;
      frmCadCaixa.qryCaixa.Params[0].Value := qryCaixaCODIGO.Value;
      frmCadCaixa.qryCaixa.Open;

      frmCadCaixa.qryCaixa.Edit;
      frmCadCaixa.Panel1.Enabled := true;
      frmCadCaixa.ShowModal;
    finally
      frmCadCaixa.Panel1.Enabled := false;
      frmCadCaixa.Release;
      btnAlterar.Enabled := true;
      btnAtualizarClick(self);
    end;
  end;
end;

procedure TfrmCaixa.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := qryCaixaCODIGO.Value;
    localiza;
    qryCaixa.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmCaixa.btnExcluirClick(Sender: TObject);
begin

  if qryCaixa.IsEmpty then
  begin
    ShowMessage('Não exite lançamento para ser excluído!');
    exit;
  end;

  if qryCaixaFKCOMPRA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela COMPRA Nº' + qryCaixaFKCOMPRA.AsString +
      #13 + 'Não pode ser excluida por esta tela!' + #13 +
      'É necessário Cancelar a Compra!');
    exit;
  end;

  if qryCaixaFKVENDA.Value > 0 then
    raise Exception.Create('Lançamento gerado pela VENDA Nº' +
      qryCaixaFKVENDA.AsString + #13 + 'Não pode ser excluida por esta tela!' +
      #13 + 'É necessário Cancelar a Venda!');

  if qryCaixaFKRECEBER.Value > 0 then
    raise Exception.Create('Lançamento gerado pelo CONTAS RECEBER,' + sLineBreak
      + 'Não pode ser excluida por esta tela!' + #13 +
      'É necessário Cancelar o Recebimento!');

  if qryCaixaFKPAGAR.Value > 0 then
    raise Exception.Create('Lançamento gerado pelo CONTAS PAGAR ' + sLineBreak +
      'Não pode ser excluida por esta tela!' + #13 +
      'É necessário Cancelar o Pagamento!');

  if qryCaixaRESUMO_CAIXA.Value = 'S' then
    raise Exception.Create('Resumo caixa não pode ser apagado!');

  Dados.vAutorizar := true;
  if not Dados.eSupervisor then
  begin
    try
      btnExcluir.Enabled := false;
      frmSupervisor := TFrmSupervisor.Create(Application);
      Dados.vAutorizar := false;
      frmSupervisor.ShowModal;
    finally
      frmSupervisor.Release;
      btnExcluir.Enabled := true;
    end;
  end;

  if not Dados.vAutorizar then
  begin
    exit;
  end;

  If Application.messagebox('Deseja realmente excluir conta?', 'Confirmação',
    mb_yesno + mb_iconquestion) = idyes then
  begin
    if not qryCaixa.IsEmpty then
    begin
      if qryCaixaTRANSFERENCIA.Value > 0 then
      begin
        Dados.qryExecute.Close;
        Dados.qryExecute.SQL.Text :=
          'DELETE FROM CAIXA WHERE TRANSFERENCIA=:TRF';
        Dados.qryExecute.Params[0].Value := qryCaixaTRANSFERENCIA.Value;
        Dados.qryExecute.ExecSQL;
        Dados.Conexao.CommitRetaining;
        qryCaixa.Close;
        qryCaixa.Open;
      end
      else
      begin
        qryCaixa.Delete;
        btnAtualizarClick(self);
      end;
    end;
  end;

end;

procedure TfrmCaixa.btnNovoClick(Sender: TObject);
begin
  try
    btnNovo.Enabled := false;
    frmCadCaixa := TfrmCadCaixa.Create(Application);

    frmCadCaixa.qryCaixa.Close;
    frmCadCaixa.qryCaixa.Params[0].Value := -1;
    frmCadCaixa.qryCaixa.Open;

    frmCadCaixa.qryCaixa.Insert;
    frmCadCaixa.qryCaixaEMISSAO.Value := date;
    frmCadCaixa.qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
    frmCadCaixa.qryCaixaDOC.Value := '';
    frmCadCaixa.qryCaixaENTRADA.Value := 0;
    frmCadCaixa.qryCaixaSAIDA.Value := 0;
    frmCadCaixa.Panel1.Enabled := true;
    frmCadCaixa.ShowModal;
  finally
    frmCadCaixa.Panel1.Enabled := false;
    frmCadCaixa.Release;
    btnAtualizarClick(self);
    btnNovo.Enabled := true;
  end;
end;

procedure TfrmCaixa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCaixa.cbContaClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCaixa.cbContaEnter(Sender: TObject);
begin
  cbConta.DropDown;
end;

procedure TfrmCaixa.cbLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCaixa.cbTipoChange(Sender: TObject);
begin
  edtLoc.Visible := true;
  edtLoc.SetFocus;
end;

procedure TfrmCaixa.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterarClick(self);
end;

procedure TfrmCaixa.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCaixa.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;

  if idx = Column.Index then
  begin
    if vOrdem = ' ASC' then
      vOrdem := ' DESC'
    else
      vOrdem := ' ASC';
  end
  else
    vOrdem := ' ASC';

  idx := Column.Index;

  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Emissão';
  DBGrid1.Columns[2].Title.Caption := 'Documento';
  DBGrid1.Columns[3].Title.Caption := 'Histórico';
  DBGrid1.Columns[4].Title.Caption := 'Plano de Contas';
  DBGrid1.Columns[5].Title.Caption := 'Contas';
  DBGrid1.Columns[6].Title.Caption := 'Entrada';
  DBGrid1.Columns[7].Title.Caption := 'Saída';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  if idx = 1 then
    maskInicio.SetFocus
  else
    edtLoc.SetFocus;

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  localiza;

end;

procedure TfrmCaixa.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.26);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.18);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.15);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.07);
end;

procedure TfrmCaixa.EdtAnoExit(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCaixa.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCaixa.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryCaixa.Prior;
  if Key = VK_DOWN then
    qryCaixa.Next;

end;

procedure TfrmCaixa.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0, 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [6 .. 7]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmCaixa.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
  qryContas.Close;
  qryContas.Open;
  localiza;
end;



procedure TfrmCaixa.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';
  maskInicio.EditText := DateToStr(StartOfTheMonth(date));
  maskFim.EditText := DateToStr(date);


  tamanho;

  qryContas.Close;
  qryContas.Open;
  cbConta.KeyValue := 0;

end;

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  if Key = vk_f2 then
  begin
    btnNovoClick(self);
  end;
  if Key = vk_f3 then
  begin
    btnAlterarClick(self);
  end;
  if Key = vk_f4 then
  begin
    btnImpClick(self);
  end;
  if Key = vk_f5 then
  begin
    btnAtualizarClick(self);
  end;
  if Key = vk_f9 then
  begin
    btnFiltrarClick(self);
  end;
  if Key = vk_f6 then
  begin
    if edtLoc.Visible then
      edtLoc.SetFocus;
    if maskInicio.Visible then
      maskInicio.SetFocus;
  end;
  if Key = vk_f12 then
  begin
    cbConta.SetFocus;
  end;
  if Key = VK_DELETE then
  begin
    btnExcluirClick(self);
  end;
end;

procedure TfrmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  edtLoc.SetFocus;
  DBGrid1TitleClick(DBGrid1.Columns[0]);

  if Dados.qryEmpresaOCULTAR_SALDO_ANTERIOR.Value = 'S' then
  begin
    Label7.Visible := false;
    DBText4.Visible := false;
  end
  else
  begin
    Label7.Visible := true;
    DBText4.Visible := true;
  end;

end;

procedure TfrmCaixa.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := '';
  if edtLoc.Text <> '' then
    filtro := ' | FILTRO:' + edtLoc.Text;

  if VarName = 'TITULO' then
    Value := cbConta.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := 'PERÍODO DE ' + maskInicio.EditText + ' ATÉ ' + maskFim.EditText +
      ' ' + filtro + ' | ORDENADO: ' + copy(DBGrid1.Columns[idx].Title.Caption,
      3, 100000);
  end;

  if VarName = 'SALDO' then
    Value := LblSaldo.Caption;

end;

function TfrmCaixa.RetornaPlano(descricao: string): Integer;
begin
  result := 0;
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    'select codigo from plano_conta where descricao=:descricao';
  Dados.qryConsulta.Params[0].Value := descricao;
  Dados.qryConsulta.Open;
  if not Dados.qryConsulta.IsEmpty then
    result := Dados.qryConsulta.FieldByName('codigo').AsInteger;
end;

procedure TfrmCaixa.localiza;
var
  DTIni, DTFim: TDate;
  idConta, filtro, filtro1, ordem, parte: string;
begin

  qryCaixaResumido.Close;
  qryCaixaResumido.Params[0].AsDateTime :=
    StrToDateDef(maskInicio.EditText, now);
  qryCaixaResumido.Params[1].AsDateTime := StrToDateDef(maskFim.EditText, now);
  qryCaixaResumido.Params[2].Value := Dados.qryEmpresaCODIGO.Value;
  qryCaixaResumido.Open;

  filtro := '';
  filtro1 := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  vSql := ' SELECT LC.*, TP.DESCRICAO VIRTUAL_PLANO, CT.DESCRICAO VIRTUAL_CONTA, CT1.DESCRICAO VIRTUAL_CONTA2  FROM CAIXA LC'
    + ' LEFT JOIN plano TP on tp.codigo=lc.fkplano' +
    ' LEFT JOIN contas ct on ct.codigo=lc.fkconta' +
    ' LEFT JOIN contas ct1 on ct1.codigo=lc.fk_conta1' + ' WHERE' +
    ' lc.emissao between :data1 and :data2' + '/*where*/';

  filtro := filtro + ' and lc.empresa=' + Dados.qryEmpresaCODIGO.AsString;

  if cbConta.KeyValue <> null then
    if cbConta.KeyValue <> 0 then
      filtro := ' AND LC.FKCONTA=' + inttostr(cbConta.KeyValue);

  DTIni := strtodate(maskInicio.EditText);
  DTFim := strtodate(maskFim.EditText);

  case idx of
    0:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and lc.CODIGO LIKE' + QuotedStr(edtLoc.Text + '%');
    2:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and lc.doc LIKE ' + QuotedStr(parte + edtLoc.Text + '%');
    3:
      filtro1 := ' and lc.historico LIKE ' +
        QuotedStr(parte + edtLoc.Text + '%');
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro1 := ' and tp.descricao like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    5:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro1 := ' and ct.descricao like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    6:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and lc.entrada  >= ' + StringReplace(edtLoc.Text,
          ',', '.', []);
    7:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and lc.Saida >= ' + StringReplace(edtLoc.Text,
          ',', '.', []);

  end;

  case idx of
    0:
      ordem := ' order by lc.CODIGO' + vOrdem;
    1:
      ordem := ' order by lc.emissao' + vOrdem + ' ,lc.CODIGO';
    2:
      ordem := ' order by lc.doc' + vOrdem;
    3:
      ordem := ' order by lc.historico' + vOrdem;
    4:
      ordem := ' order by tp.descricao' + vOrdem;
    5:
      ordem := ' order by ct.descricao' + vOrdem;
    6:
      ordem := ' order by lc.entrada' + vOrdem;
    7:
      ordem := ' order by lc.saida' + vOrdem;

  end;

  qrSaldo.Close;
  qrSaldo.SQL.Text :=
    ' SELECT coalesce(SUM(lc.ENTRADA-lc.SAIDA),0) SALDO FROM CAIXA lc ' +
    ' LEFT JOIN plano TP on tp.codigo=lc.fkplano' +
    ' LEFT JOIN contas ct on ct.codigo=lc.fkconta' +
    ' LEFT JOIN contas ct1 on ct1.codigo=lc.fk_conta1' + ' WHERE' +
    ' lc.emissao<:data' + ' /*where*/';
  qrSaldo.SQL.Text := StringReplace(qrSaldo.SQL.Text, '/*where*/',
    filtro + filtro1, [rfReplaceAll]);
  qrSaldo.Params[0].Value := DTIni;
  qrSaldo.Open;

  qryCaixa.Close;
  qryCaixa.SQL.Text := vSql;

  qryCaixa.SQL.Text := StringReplace(qryCaixa.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryCaixa.Params[0].Value := DTIni;
  qryCaixa.Params[1].Value := DTFim;
  qryCaixa.Open;

  qrySaldoAnterior.Close;
  qrySaldoAnterior.SQL.Text :=
    ' SELECT coalesce(SUM(lc.ENTRADA-lc.SAIDA),0) SALDO FROM CAIXA lc ' +
    ' LEFT JOIN plano TP on tp.codigo=lc.fkplano' +
    ' LEFT JOIN contas ct on ct.codigo=lc.fkconta' +
    ' LEFT JOIN contas ct1 on ct1.codigo=lc.fk_conta1' + ' WHERE' +
    ' lc.emissao <:data1' + ' /*where*/';

  qrySaldoAnterior.SQL.Text := StringReplace(qrySaldoAnterior.SQL.Text,
    '/*where*/', filtro + filtro1, [rfReplaceAll]);
  qrySaldoAnterior.Params[0].Value := DTIni;
  qrySaldoAnterior.Open;

  qrySoma.Close;
  qrySoma.SQL.Text :=
    ' SELECT coalesce(SUM(lc.ENTRADA),0) ENTRADA, coalesce(SUM(lc.SAIDA),0) SAIDA  FROM CAIXA lc'
    + ' LEFT JOIN plano TP on tp.codigo=lc.fkplano' +
    ' LEFT JOIN contas ct on ct.codigo=lc.fkconta' +
    ' LEFT JOIN contas ct1 on ct1.codigo=lc.fk_conta1' + ' WHERE' +
    ' lc.emissao between :data1 and :data2' + ' /*where*/';

  qrySoma.SQL.Text := StringReplace(qrySoma.SQL.Text, '/*where*/',
    filtro + filtro1, [rfReplaceAll]);
  qrySoma.Params[0].Value := DTIni;
  qrySoma.Params[1].Value := DTFim;
  qrySoma.Open;

  LblSaldo.Caption := FormatFloat(',0.00', qrySaldoAnteriorSALDO.AsFloat +
    (qrySomaENTRADA.AsFloat - qrySomaSAIDA.AsFloat));
  lblEntrada.Caption := FormatFloat(',0.00', qrySomaENTRADA.AsFloat);
  lblSaida.Caption := FormatFloat(',0.00', qrySomaSAIDA.AsFloat);
end;

procedure TfrmCaixa.qryCaixaResumidoCalcFields(DataSet: TDataSet);
begin
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'D' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'DINHEIRO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'Q' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'CHEQUE';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'F' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'CRÉDITO LOJA';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'X' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'DEPÓSITO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'C' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'CARTÃO DE CRÉDITO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'E' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'CARTÃO DE DÉBITO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'B' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'BOLETO BANCÁRIO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'R' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'VALE REFEIÇÃO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'O' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'VALE COMBUSTIVEL';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'P' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'VALE PRESENTE';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'V' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'CONVÊNIO';
  if qryCaixaResumidoTIPO_MOVIMENTO.Value = 'T' then
    qryCaixaResumidoVIRTUAL_MOVIMENTO.Value := 'OUTROS';
end;

end.
