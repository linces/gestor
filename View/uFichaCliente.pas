unit uFichaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, frxClass, frxDBSet, frxExportPDF, DBGridEh, DBCtrlsEh,
  DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmFichaCliente = class(TForm)
    dsFicha: TDataSource;
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
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    dsEmpresa: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label5: TLabel;
    LblSaldo: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    DBText1: TDBText;
    Label1: TLabel;
    DBText4: TDBText;
    Label7: TLabel;
    btnReceber: TSpeedButton;
    qrSaldoSALDO: TFMTBCDField;
    btnAtualizar: TSpeedButton;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCLI: TStringField;
    frxXLSExport1: TfrxXLSExport;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure EdtAnoExit(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbClienteChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtLocChange(Sender: TObject);
    procedure cbLocChange(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    vSaldoMes: Extended;
    procedure localiza;
    procedure tamanho;
    procedure AlteraDebito;
    procedure AlteraCredito;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  frmFichaCliente: TfrmFichaCliente;

implementation

{$R *.dfm}

uses uCadCaixa, Udados, uCadFichaCliente, uSupervisor, uFichaClienteReceber;

procedure TfrmFichaCliente.btnFiltrarClick(Sender: TObject);
begin
  try
    btnFiltrar.Enabled := false;
    localiza;
    edtLoc.SetFocus;
  finally
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfrmFichaCliente.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelFicha.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmFichaCliente.AlteraDebito;
begin
  if dados.qryFichaClienteBLOQUEADO.Value = 'S' then
  begin
    ShowMessage('Não é possivel alterar lançamento automático!');
    exit;
  end;

  if dados.qryFichaClienteFKVENDA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela VENDA Nº' +
      dados.qryFichaClienteFKVENDA.AsString + #13 +
      'Não pode ser alterado por esta tela!' + #13 +
      'É necessário alterar a Venda!');
    exit;
  end;

  if not dados.qryFichaCliente.IsEmpty then
  begin
    dados.vAutorizar := true;
    if not dados.eSupervisor then
    begin

      try
        btnAlterar.Enabled := false;
        frmSupervisor := TFrmSupervisor.create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
        btnAlterar.Enabled := true;
      end;

      if not dados.vAutorizar then
      begin
        exit;
      end;
    end;

    try
      frmCadFichaCliente := TfrmCadFichaCliente.create(Application);

      frmCadFichaCliente.qryFicha.Close;
      frmCadFichaCliente.qryFicha.Params[0].Value :=
        dados.qryFichaClienteCODIGO.Value;
      frmCadFichaCliente.qryFicha.Open;

      frmCadFichaCliente.qryFicha.Edit;
      frmCadFichaCliente.Panel1.Enabled := true;
      frmCadFichaCliente.ShowModal;
    finally
      frmCadFichaCliente.Panel1.Enabled := false;
      frmCadFichaCliente.Release;
      localiza;
    end;
  end;
end;

procedure TfrmFichaCliente.AlteraCredito;
begin
  if dados.qryFichaClienteBLOQUEADO.Value = 'S' then
  begin
    ShowMessage('Não é possivel alterar lançamento automático!');
    exit;
  end;

  if dados.qryFichaClienteFKVENDA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela VENDA Nº' +
      dados.qryFichaClienteFKVENDA.AsString + #13 +
      'Não pode ser alterado por esta tela!' + #13 +
      'É necessário alterar a Venda!');
    exit;
  end;

  if not dados.qryFichaCliente.IsEmpty then
  begin
    dados.vAutorizar := true;
    if not dados.eSupervisor then
    begin

      try
        btnAlterar.Enabled := false;
        frmSupervisor := TFrmSupervisor.create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
        btnAlterar.Enabled := true;
      end;

      if not dados.vAutorizar then
      begin
        exit;
      end;
    end;

    try
      frmCadFichaClieR := TfrmCadFichaClieR.create(Application);

      frmCadFichaClieR.qryFicha.Close;
      frmCadFichaClieR.qryFicha.Params[0].Value :=
        dados.qryFichaClienteCODIGO.Value;
      frmCadFichaClieR.qryFicha.Open;

      frmCadFichaClieR.qryFicha.Edit;
      frmCadFichaClieR.Panel1.Enabled := true;
      frmCadFichaClieR.ShowModal;
    finally
      frmCadFichaClieR.Panel1.Enabled := false;
      frmCadFichaClieR.Release;
      localiza;
    end;
  end;
end;

procedure TfrmFichaCliente.btnAlterarClick(Sender: TObject);
begin
  if dados.qryFichaClienteENTRADA.Value > 0 then
    AlteraCredito
  else if dados.qryFichaClienteSAIDA.Value > 0 then
    AlteraDebito
  else
    AlteraCredito;
end;

procedure TfrmFichaCliente.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;

    qryClientes.Close;
    qryClientes.Open;

    codigo := dados.qryFichaClienteCODIGO.Value;

    localiza;
    dados.qryFichaCliente.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmFichaCliente.btnExcluirClick(Sender: TObject);
begin
  if dados.qryFichaClienteFKVENDA.Value > 0 then
  begin
    ShowMessage('Lançamento gerado pela VENDA Nº' +
      dados.qryFichaClienteFKVENDA.AsString + #13 +
      'Não pode ser excluida por esta tela!' + #13 +
      'É necessário Cancelar a Venda!');
    exit;
  end;

  dados.vAutorizar := true;
  if not dados.eSupervisor then
  begin
    try
      btnExcluir.Enabled := false;
      frmSupervisor := TFrmSupervisor.create(Application);
      dados.vAutorizar := false;
      frmSupervisor.ShowModal;
    finally
      frmSupervisor.Release;
      btnExcluir.Enabled := true;
    end;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  If Application.messagebox('Deseja realmente excluir lançamento',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
  begin
    if not dados.qryFichaCliente.IsEmpty then
    begin
      dados.qryFichaCliente.Delete;
    end;
  end;
end;

procedure TfrmFichaCliente.btnNovoClick(Sender: TObject);
begin

  try
    btnNovo.Enabled := false;
    frmCadFichaCliente := TfrmCadFichaCliente.create(Application);

    frmCadFichaCliente.qryFicha.Close;
    frmCadFichaCliente.qryFicha.Params[0].Value := -1;
    frmCadFichaCliente.qryFicha.Open;

    frmCadFichaCliente.qryFicha.Insert;
    frmCadFichaCliente.qryFichaCODIGO.Value := dados.Numerador('PESSOA_CONTA',
      'CODIGO', 'N', '', '');
    frmCadFichaCliente.qryFichaDATA_EMISSAO.Value := date;
    frmCadFichaCliente.qryFichaFKPESSOA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadFichaCliente.qryFichaENTRADA.Value := 0;
    frmCadFichaCliente.qryFichaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadFichaCliente.qryFichaFKPLANO.Value :=
      dados.qryEmpresaID_PLA_CONTA_FICHA_CLI.Value;
    frmCadFichaCliente.qryFichaSAIDA.Value := 0;
    frmCadFichaCliente.Panel1.Enabled := true;

    frmCadFichaCliente.ShowModal;
  finally
    frmCadFichaCliente.Panel1.Enabled := false;
    frmCadFichaCliente.Release;
    btnNovo.Enabled := true;
    localiza;
  end;
end;

procedure TfrmFichaCliente.btnReceberClick(Sender: TObject);
begin

  try
    btnNovo.Enabled := false;
    frmCadFichaClieR := TfrmCadFichaClieR.create(Application);

    frmCadFichaClieR.qryFicha.Close;
    frmCadFichaClieR.qryFicha.Params[0].Value := -1;
    frmCadFichaClieR.qryFicha.Open;

    frmCadFichaClieR.qryFicha.Insert;
    frmCadFichaClieR.qryFichaCODIGO.Value := dados.Numerador('PESSOA_CONTA',
      'CODIGO', 'N', '', '');
    frmCadFichaClieR.qryFichaDATA_EMISSAO.Value := date;
    frmCadFichaClieR.qryFichaFKPESSOA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadFichaClieR.qryFichaENTRADA.Value := 0;
    frmCadFichaClieR.qryFichaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadFichaClieR.qryFichaFKPLANO.Value :=
      dados.qryEmpresaID_PLA_CONTA_FICHA_CLI.Value;
    frmCadFichaClieR.qryFichaSAIDA.Value := 0;
    frmCadFichaClieR.Panel1.Enabled := true;

    frmCadFichaClieR.ShowModal;
  finally
    frmCadFichaClieR.Panel1.Enabled := false;
    frmCadFichaClieR.Release;
    btnNovo.Enabled := true;
    localiza;
  end;
end;

procedure TfrmFichaCliente.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFichaCliente.cbClienteChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFichaCliente.cbLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFichaCliente.cbTipoChange(Sender: TObject);
begin
  edtLoc.Visible := true;
  edtLoc.SetFocus;
end;

procedure TfrmFichaCliente.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterarClick(Self);
end;

procedure TfrmFichaCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

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

procedure TfrmFichaCliente.DBGrid1TitleClick(Column: TColumn);
begin

  idx := Column.Index;

  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Emissão';
  DBGrid1.Columns[2].Title.Caption := 'Cliente';
  DBGrid1.Columns[3].Title.Caption := 'Histórico';
  DBGrid1.Columns[4].Title.Caption := 'Entrada';
  DBGrid1.Columns[5].Title.Caption := 'Saída';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  localiza;

end;

procedure TfrmFichaCliente.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.058);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.058);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.07);
end;

procedure TfrmFichaCliente.EdtAnoExit(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFichaCliente.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFichaCliente.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [4, 5]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmFichaCliente.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := Self;
  dados.GetComponentes;
end;


procedure TfrmFichaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    btnNovoClick(Self);
  end;
  if Key = vk_f3 then
  begin
    btnAlterarClick(Self);
  end;

  if Key = vk_f4 then
  begin
    btnImpClick(Self);
  end;
  if Key = vk_f5 then
  begin
    btnAtualizarClick(Self);
  end;
  if Key = vk_f6 then
  begin
    btnReceberClick(Self);
  end;

  if Key = vk_f7 then
  begin
    if edtLoc.Visible then
      edtLoc.SetFocus;
    if maskInicio.Visible then
      maskInicio.SetFocus;
  end;
  if Key = vk_f12 then
  begin
    maskInicio.SetFocus;
  end;
  if Key = VK_DELETE then
  begin
    btnExcluirClick(Self);
  end;
end;

procedure TfrmFichaCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmFichaCliente.FormShow(Sender: TObject);
begin
  tamanho;

  maskInicio.EditText := datetostr(StartOfTheMonth(date));
  maskFim.EditText := datetostr(date);

  qryClientes.Close;
  qryClientes.Open;
  edtLoc.SetFocus;

  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmFichaCliente.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := '';
  if edtLoc.Text <> '' then
    filtro := ' FILTRO:' + edtLoc.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := filtro + ' | ORDENADO: ' + copy(DBGrid1.Columns[idx].Title.Caption,
      3, 100000);
  end;

  if VarName = 'SALDO' then
    Value := LblSaldo.Caption;

end;

procedure TfrmFichaCliente.localiza;
var
  DTIni, DTFim: TDate;
  parte, idConta, filtro, filtro1, ordem: string;
  vSaldoTotal: Extended;

begin
  filtro1 := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  dados.qryFichaCliente.SQL.Text :=
    ' select pc.*, pes.razao from PESSOA_CONTA pc ' +
    ' left join pessoa pes on pes.codigo=pc.fkpessoa' +
    ' where pc.fkempresa=:id' + ' /*where*/';

  case idx of
    0:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and pc.CODIGO=' + edtLoc.Text;
    1:
      begin
        if maskInicio.EditText <> '  /  /    ' then
        begin
          filtro1 := ' and pc.data_emissao>=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskInicio.EditText))) + ' and pc.data_emissao<=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskFim.EditText)));
        end;
      end;
    2:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro1 := ' and pes.razao LIKE ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro1 := ' and pc.historico like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and pc.entrada  >= ' + StringReplace(edtLoc.Text,
          ',', '.', []);
    5:
      if (trim(edtLoc.Text) <> '') then
        filtro1 := ' and pc.Saida >= ' + StringReplace(edtLoc.Text,
          ',', '.', []);

  end;

  case idx of
    0:
      ordem := ' order by pc.CODIGO';
    1:
      ordem := ' order by pc.data_emissao';

    2:
      ordem := ' order by pes.razao';
    3:
      ordem := ' order by pc.historico';
    4:
      ordem := ' order by pc.entrada';
    5:
      ordem := ' order by pc.saida';

  end;

  qrSaldo.Close;
  qrSaldo.Params[0].Value := strtodate(maskInicio.EditText);
  qrSaldo.Open;

  dados.qryFichaCliente.Close;
  dados.qryFichaCliente.SQL.Text :=
    StringReplace(dados.qryFichaCliente.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  dados.qryFichaCliente.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryFichaCliente.Open;

  vSaldoTotal := 0;
  vSaldoMes := 0;
  if not((dados.qryFichaClienteTENTRADA.IsNull) and
    (dados.qryFichaClienteTSAIDA.IsNull)) then
    vSaldoMes := dados.qryFichaClienteTENTRADA.AsVariant -
      dados.qryFichaClienteTSAIDA.AsVariant;
  vSaldoTotal := vSaldoMes + qrSaldoSALDO.AsFloat;
  LblSaldo.Caption := FormatFloat('0.00', vSaldoTotal);

end;

procedure TfrmFichaCliente.TabControl1Change(Sender: TObject);
begin
  localiza;
end;

end.
