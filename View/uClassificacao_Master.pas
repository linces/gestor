unit uClassificacao_Master;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils, System.TypInfo, acbrutil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, frxOLE,
  ACBrBase, ACBrPosPrinter, ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS, frxExportBaseDialog, ACBrDFeReport, ACBrDFeDANFeReport,
  frxExportXLS;

type
  TfrmLaudo = class(TForm)
    TabSet1: TTabSet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    bbView: TSpeedButton;
    dsLaudo: TDataSource;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBLaudo: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    Panel12: TPanel;
    Label13: TLabel;
    btnAtualizar: TSpeedButton;
    GroupBox2: TGroupBox;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    btnCancelar: TSpeedButton;
    btnEmail: TSpeedButton;
    ACBrPosPrinter2: TACBrPosPrinter;
    edtEmp: TDBEdit;
    Label8: TLabel;
    ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS;
    frxXLSExport1: TfrxXLSExport;
    qryLaudo: TFDQuery;
    qryLaudoCODIGO: TIntegerField;
    qryLaudoDATA_CLASSIFICACAO: TDateField;
    qryLaudoMUNICIPIO_CLASSIFICACAO: TStringField;
    qryLaudoLOCAL_CLASSIFICAO: TStringField;
    qryLaudoNUMERO_CONTRATO: TStringField;
    qryLaudoLACRE: TStringField;
    qryLaudoORIGEM: TStringField;
    qryLaudoDESTINO: TStringField;
    qryLaudoPLACA: TStringField;
    qryLaudoPESO_LIQUIDO: TSingleField;
    qryLaudoPESO_TARA: TSingleField;
    qryLaudoPESO_BRUTO: TSingleField;
    qryLaudoNOTA_FISCAL: TIntegerField;
    qryLaudoPRODUTO: TStringField;
    qryLaudoVEICULO_VISTORIA: TStringField;
    qryLaudoMOTORISTA: TStringField;
    qryLaudoCPF_MOTORISTA: TStringField;
    qryLaudoTIPO_PRODUTO: TStringField;
    qryLaudoQUEIMADOS: TSingleField;
    qryLaudoARDIDOS: TSingleField;
    qryLaudoMOFADOS: TSingleField;
    qryLaudoAVARIADOS: TSingleField;
    qryLaudoIMPUREZAS: TSingleField;
    qryLaudoAMASSADOS: TSingleField;
    qryLaudoUMIDADE: TSingleField;
    qryLaudoESVERDEADOS: TSingleField;
    qryLaudoPICADOS: TSingleField;
    qryLaudoFERMENTADOS: TSingleField;
    qryLaudoINSETOS: TStringField;
    qryLaudoSEMENTES_TOXICAS: TStringField;
    qryLaudoCLASSIFICADOR: TStringField;
    qryLaudoDATA_EMISSAO: TDateField;
    qryLaudoSITUACAO: TStringField;
    qryLaudoLAUDO: TStringField;
    qryLaudoCLIENTE: TStringField;
    pnImpressao: TPanel;
    Shape1: TShape;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSet2Click(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbAlterarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    function StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
    procedure BaixaLaudo;
    procedure AtualizaLaudo(Codigo: Integer);
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  frmLaudo: TfrmLaudo;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento, uSupervisor, uEmail,
  uCadLaudo, uDadosLaudo;

procedure TfrmLaudo.bbAlterarClick(Sender: TObject);
begin
  Dados.vAutorizar := true;

  if qryLaudo.IsEmpty then
    exit;

  if (qryLaudoSITUACAO.Value = 'C') then
  begin
    ShowMessage('Orçamento Cancelado não pode ser Alterado!');
    exit;
  end;

  if (qryLaudoSITUACAO.Value = 'F') then
  begin

    If Application.messagebox('Tem certeza que deseja REABRIR LAUDO',
      'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
      exit;

    if not Dados.eSupervisor then
    begin
      try
        bbAlterar.Enabled := false;
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
        edtLoc.SetFocus;
      end;
    end;
  end;

  try
    bbAlterar.Enabled := false;
    if Dados.vAutorizar then
    begin
      try
        frmCadLaudo := TfrmCadLaudo.Create(Application);
        with frmCadLaudo do
        begin
          qryLaudo.Close;
          qryLaudo.Params[0].Value := SELF.qryLaudoCODIGO.Value;
          qryLaudo.Open;

          if SELF.qryLaudo.IsEmpty then
            exit;

          qryLaudo.edit;

          btnSalvar.Enabled := true;
          btnFinalizar.Enabled := true;
          btnCancelar.Enabled := true;
          btnSair.Enabled := true;

          Panel2.Enabled := true;
          Panel3.Enabled := true;
          PageControl1.Enabled := true;
        end;
        frmCadLaudo.ShowModal;
        Application.ProcessMessages;
      finally
        frmCadLaudo.Release;
      end;
    end;
  finally
    btnAtualizar.Click;
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmLaudo.bbNovoClick(Sender: TObject);
begin
  try
    frmCadLaudo := TfrmCadLaudo.Create(Application);
    with frmCadLaudo do
    begin
      qryLaudo.Close;
      qryLaudo.Params[0].Value := 0;
      qryLaudo.Open;

      qryLaudo.Insert;

      btnSalvar.Enabled := true;
      btnFinalizar.Enabled := true;
      btnCancelar.Enabled := true;
      btnSair.Enabled := true;

      Panel2.Enabled := true;
      Panel3.Enabled := true;
      PageControl1.Enabled := true;

    end;
    frmCadLaudo.ShowModal;
    Application.ProcessMessages;
  finally
    frmCadLaudo.Release;
    btnAtualizar.Click;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmLaudo.AtualizaLaudo(Codigo: Integer);
begin
  DadosLaudo.qryExecute.Close;
  DadosLaudo.qryExecute.SQL.Text :=
    'update laudo set situacao=''B'' where codigo=:codigo';
  DadosLaudo.qryExecute.Params[0].Value := Codigo;
  DadosLaudo.qryExecute.Prepare;
  DadosLaudo.qryExecute.ExecSQL;
end;

procedure TfrmLaudo.BaixaLaudo;
begin
  try
    DadosLaudo.qryLaudo.Close;
    DadosLaudo.qryLaudo.Params[0].Value :=
      TiraPontos(Dados.qryEmpresaCNPJ.Value);
    DadosLaudo.qryLaudo.Open;
    DadosLaudo.qryLaudo.First;

    while not DadosLaudo.qryLaudo.eof do
    begin

      qryLaudo.Insert;
      qryLaudoDATA_CLASSIFICACAO.AsDateTime := DadosLaudo.qryLaudo.FieldByName
        ('data_classificacao').AsDateTime;
      qryLaudoMUNICIPIO_CLASSIFICACAO.Value := DadosLaudo.qryLaudo.FieldByName
        ('municipio_classificacao').AsString;
      qryLaudoLOCAL_CLASSIFICAO.Value := DadosLaudo.qryLaudo.FieldByName
        ('local_classificao').Value;
      qryLaudoNUMERO_CONTRATO.Value := DadosLaudo.qryLaudo.FieldByName
        ('numero_contrato').Value;
      qryLaudoLACRE.Value := DadosLaudo.qryLaudo.FieldByName('lacre').Value;

      qryLaudoORIGEM.Value := DadosLaudo.qryLaudo.FieldByName('origem').Value;
      qryLaudoDESTINO.Value := DadosLaudo.qryLaudo.FieldByName('destino').Value;

      qryLaudoPLACA.Value := DadosLaudo.qryLaudo.FieldByName('placa').Value;
      qryLaudoPESO_LIQUIDO.Value := DadosLaudo.qryLaudo.FieldByName
        ('peso_liquido').Value;
      qryLaudoPESO_TARA.Value := DadosLaudo.qryLaudo.FieldByName
        ('peso_tara').Value;
      qryLaudoPESO_BRUTO.Value := DadosLaudo.qryLaudo.FieldByName
        ('peso_bruto').Value;
      qryLaudoNOTA_FISCAL.Value := DadosLaudo.qryLaudo.FieldByName
        ('nota_fiscal').Value;
      qryLaudoPRODUTO.Value := DadosLaudo.qryLaudo.FieldByName('produto').Value;
      qryLaudoVEICULO_VISTORIA.Value := DadosLaudo.qryLaudo.FieldByName
        ('veiculo_vistoria').Value;
      qryLaudoMOTORISTA.Value := DadosLaudo.qryLaudo.FieldByName
        ('motorista').Value;
      qryLaudoCPF_MOTORISTA.Value := DadosLaudo.qryLaudo.FieldByName
        ('cpf_motorista').Value;
      qryLaudoTIPO_PRODUTO.Value := DadosLaudo.qryLaudo.FieldByName
        ('tipo_produto').Value;
      qryLaudoQUEIMADOS.Value := DadosLaudo.qryLaudo.FieldByName
        ('queimados').Value;
      qryLaudoARDIDOS.Value := DadosLaudo.qryLaudo.FieldByName('ardidos').Value;
      qryLaudoMOFADOS.Value := DadosLaudo.qryLaudo.FieldByName('mofados').Value;
      qryLaudoAVARIADOS.Value := DadosLaudo.qryLaudo.FieldByName
        ('avariados').Value;
      qryLaudoIMPUREZAS.Value := DadosLaudo.qryLaudo.FieldByName
        ('impurezas').Value;
      qryLaudoAMASSADOS.Value := DadosLaudo.qryLaudo.FieldByName
        ('amassados').Value;
      qryLaudoUMIDADE.Value := DadosLaudo.qryLaudo.FieldByName('umidade').Value;
      qryLaudoESVERDEADOS.Value := DadosLaudo.qryLaudo.FieldByName
        ('esverdeados').Value;
      qryLaudoPICADOS.Value := DadosLaudo.qryLaudo.FieldByName('picados').Value;
      qryLaudoFERMENTADOS.Value := DadosLaudo.qryLaudo.FieldByName
        ('fermentados').Value;
      qryLaudoINSETOS.Value := DadosLaudo.qryLaudo.FieldByName('insetos').Value;
      qryLaudoNUMERO_CONTRATO.Value := DadosLaudo.qryLaudo.FieldByName
        ('cnpj').Value;
      qryLaudoSEMENTES_TOXICAS.Value := DadosLaudo.qryLaudo.FieldByName
        ('sementes_toxicas').Value;
      qryLaudoCLASSIFICADOR.Value := DadosLaudo.qryLaudo.FieldByName
        ('classificador').Value;
      qryLaudoCLIENTE.Value := DadosLaudo.qryLaudo.FieldByName('cliente').Value;
      qryLaudoSITUACAO.Value := 'A';
      qryLaudoCODIGO.Value := Dados.Numerador('LAUDO', 'CODIGO', 'N', '', '');
      qryLaudoLAUDO.Value := 'BOM/' + formatfloat('0000', qryLaudoCODIGO.Value);
      try
        qryLaudo.Post;
        AtualizaLaudo(DadosLaudo.qryLaudoCODIGO.Value);
        Dados.Conexao.CommitRetaining;
      except
        Dados.Conexao.RollbackRetaining;
      end;
      DadosLaudo.qryLaudo.Next;
    end;
    ShowMessage('Atualização concluida com sucesso!');
  except
    on e: exception do
      raise exception.Create('Erro:' + e.Message);
  end;
  btnFiltrarClick(SELF);
end;

procedure TfrmLaudo.btnAtualizarClick(Sender: TObject);
begin
  BaixaLaudo;
end;

procedure TfrmLaudo.btnCancelarClick(Sender: TObject);
begin
  try
    btnCancelar.Enabled := false;

    if qryLaudo.IsEmpty then
    begin
      exit;
    end;

    if (qryLaudoSITUACAO.Value = 'C') then
    begin
      ShowMessage('Orçamento já está CANCELADO!');
      exit;
    end;

    Dados.vAutorizar := true;

    if (qryLaudoSITUACAO.Value = 'F') then
    begin
      if not Dados.eSupervisor then
      begin
        try
          btnCancelar.Enabled := false;
          frmSupervisor := TFrmSupervisor.Create(Application);
          Dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end;
    end;

    if not Dados.vAutorizar then
    begin
      exit;
    end;

    If Application.messagebox('Tem certeza que CANCELAR ORÇAMENTO?',
      'Confirmação', mb_yesno + mb_iconquestion) = idyes then
    begin
      if not(qryLaudo.State in dsEditModes) then
        qryLaudo.edit;
      qryLaudoSITUACAO.Value := 'C';
      qryLaudo.Post;
      Dados.Conexao.CommitRetaining;
      ShowMessage('Orçamento Cancelado Com Sucesso!');
    end;

  finally
    btnCancelar.Enabled := true;
  end;
end;

procedure TfrmLaudo.btnEmailClick(Sender: TObject);
begin
  if qryLaudo.IsEmpty then
    exit;

  try

    btnEmail.Enabled := false;

    Dados.qryPesqProd.Close;
    Dados.qryPesqProd.Open;

    Dados.qryItensO.Close;
    Dados.qryItensO.Params[0].Value := qryLaudoCODIGO.Value;
    Dados.qryItensO.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelLaudo.fr3');

    frxPDFExport1.FileName := 'LAUDO.PDF';
    frxPDFExport1.DefaultPath := ExtractFilePath(Application.ExeName) + 'Temp';
    frxPDFExport1.ShowDialog := false;
    frxPDFExport1.ShowProgress := false;
    frxPDFExport1.OverwritePrompt := false;
    frxReport.PrepareReport();
    frxReport.Export(frxPDFExport1);

    Dados.qrySped_contador.Close;
    Dados.qrySped_contador.Open;
    Dados.qrySped_contador.Locate('fk_empresa',
      Dados.qryEmpresaCODIGO.Value, []);

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := 'ORCAMENTO';
    frmEmail.vTituloAnexo := 'ORCAMENTO N.' + qryLaudoCODIGO.AsString;
    frmEmail.eNotaFiscal := false;
    frmEmail.AnexaArquivo := true;
    frmEmail.EdtAssunto.Text := 'ORCAMENTO N.' + qryLaudoCODIGO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO ' + frmEmail.EdtAssunto.Text;
    frmEmail.LstAnexo.Items.Add(ExtractFilePath(Application.ExeName) +
      'Temp\LAUDO.PDF');
    frmEmail.ShowModal;

  finally
    frmEmail.Release;
    btnEmail.Enabled := true;
    Dados.qryPV.Filtered := false;
  end;
end;

procedure TfrmLaudo.btnFiltrarClick(Sender: TObject);
begin
  try
    btnFiltrar.Enabled := false;
    localiza;
  finally
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfrmLaudo.btnImpClick(Sender: TObject);
begin
  pnImpressao.Visible := true;
end;

procedure TfrmLaudo.Button1Click(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelLaudo.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmLaudo.Button2Click(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelLaudoD.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmLaudo.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

function TfrmLaudo.StrToPaginaCodigo(const AValor: String)
  : TACBrPosPaginaCodigo;
begin
  Result := TACBrPosPaginaCodigo
    (GetEnumValue(TypeInfo(TACBrPosPaginaCodigo), AValor));
end;

procedure TfrmLaudo.bbViewClick(Sender: TObject);
begin
  if qryLaudo.IsEmpty then
    exit;
  try
    bbView.Enabled := false;
    frmCadLaudo := TfrmCadLaudo.Create(Application);
    with frmCadLaudo do
    begin
      btnSalvar.Enabled := false;
      btnFinalizar.Enabled := false;
      btnSair.Enabled := true;
      Panel2.Enabled := false;
      Panel3.Enabled := false;
      PageControl1.Enabled := false;

      qryLaudo.Close;
      qryLaudo.Params[0].Value := SELF.qryLaudoCODIGO.Value;
      qryLaudo.Open;

    end;
    frmCadLaudo.ShowModal;
    Application.ProcessMessages;
  finally
    bbView.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmLaudo.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.20);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.20);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.15);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.15);
end;

procedure TfrmLaudo.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(SELF);
end;

procedure TfrmLaudo.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmLaudo.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;
  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Data';
  DBGrid1.Columns[2].Title.Caption := 'Municipio';
  DBGrid1.Columns[3].Title.Caption := 'Local';
  DBGrid1.Columns[4].Title.Caption := 'Contrato';
  DBGrid1.Columns[5].Title.Caption := 'Placa';
  DBGrid1.Columns[6].Title.Caption := 'Nota';
  DBGrid1.Columns[7].Title.Caption := 'Motorista';

  if (idx in [1]) then
  begin
    GroupBox1.Visible := false;
    maskInicio.SetFocus;
    btnFiltrar.Visible := true;
  end
  else
  begin
    GroupBox1.Visible := true;
    edtLoc.SetFocus
  end;

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Width := DBGrid1.Columns[idx].Width + 50;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

end;

procedure TfrmLaudo.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmLaudo.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryLaudo.Prior;
  if Key = VK_DOWN then
    qryLaudo.Next;
end;

procedure TfrmLaudo.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0 .. 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmLaudo.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := SELF;
  Dados.GetComponentes;
end;

procedure TfrmLaudo.FormCreate(Sender: TObject);
begin
  maskInicio.Text := DateToStr(StartOfTheWeek(DATE));
  maskFim.Text := DateToStr(DATE);
end;

procedure TfrmLaudo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    bbNovoClick(SELF);
    abort;
  end;
  if Key = vk_f3 then
  begin
    bbAlterarClick(SELF);
    abort;
  end;

  if Key = vk_f4 then
  begin
    btnCancelarClick(SELF);
    abort;
  end;

  if Key = vk_f5 then
  begin
    // btnAtualizarClick(SELF);
    abort;
  end;

  if Key = vk_f6 then
  begin
    btnImpClick(SELF);
    abort;
  end;

  if Key = vk_f7 then
  begin
    bbViewClick(SELF);
    abort;
  end;

  if Key = vk_f8 then
  begin
    if not(idx in [1 .. 2]) then
      edtLoc.SetFocus
    else
      maskInicio.SetFocus;
    abort;
  end;

  if Key = vk_f9 then
  begin
    btnEmailClick(SELF);
    abort;
  end;

end;

procedure TfrmLaudo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmLaudo.FormShow(Sender: TObject);
var
  topo: Integer;
begin

  localiza;

  tamanho;

  Dados.qryConfig.Close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  edtLoc.SetFocus;

end;

procedure TfrmLaudo.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  if vSql = '' then
    vSql := qryLaudo.SQL.Text;

  filtro := filtro + ' where CODIGO>0';

  filtro := filtro + ' and DATA_CLASSIFICACAO>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(maskInicio.EditText))) +
    ' and DATA_CLASSIFICACAO<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    StrToDate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and  CODIGO=' + edtLoc.Text;
      end;
    2:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CLIENTE like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and LOCAL_CLASSIFICAO like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and NUMERO_CONTRATO like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    5:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and PLACA like ' + QuotedStr(edtLoc.Text + '%');
      end;
    6:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and NOTA_FISCAL like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    7:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and MOTORISTA like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro1 := ' and SITUACAO=''A''';
    2:
      filtro1 := ' and SITUACAO=''F''';
    3:
      filtro1 := ' and SITUACAO=''C''';
  end;

  case idx of
    0:
      ordem := ' order by CODIGO';
    1:
      ordem := ' order by DATA_CLASSIFICACAO';
    2:
      ordem := ' order by CLIENTE';
    3:
      ordem := ' order by LOCAL_CLASSIFICAO';
    4:
      ordem := ' order by NUMERO_CONTRATO';
    5:
      ordem := ' order by PLACA';
    6:
      ordem := ' order by NOTA_FISCAL';
    7:
      ordem := ' order by MOTORISTA';

  end;

  qryLaudo.Close;
  ShowMessage('Vou abrir o laudo');
  qryLaudo.SQL.Text := vSql;
  qryLaudo.SQL.Text := StringReplace(qryLaudo.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);

  // qryLaudo.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  qryLaudo.Open;
    ShowMessage('Abri o laudo');
end;

procedure TfrmLaudo.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;
end;

procedure TfrmLaudo.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmLaudo.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmLaudo.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
