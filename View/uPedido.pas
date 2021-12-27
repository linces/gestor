unit uPedido;

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
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, frxOLE,
  DBGridEh, DBCtrlsEh, DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmPedido = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    Panel1: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    bbView: TSpeedButton;
    dsPedido: TDataSource;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBPV: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    btnAtualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    qryPessoa_entrega: TFDQuery;
    qryPessoa_entregaFKCLIENTE: TIntegerField;
    qryPessoa_entregaENDERECO: TStringField;
    qryPessoa_entregaCOMPLEMENTO: TStringField;
    qryPessoa_entregaBAIRRO: TStringField;
    qryPessoa_entregaCIDADE: TStringField;
    qryPessoa_entregaUF: TStringField;
    qryPessoa_entregaCEP: TStringField;
    qryPessoa_entregaFONE: TStringField;
    qryPessoa_Cobranca: TFDQuery;
    qryPessoa_CobrancaFKCLIENTE: TIntegerField;
    qryPessoa_CobrancaENDERECO: TStringField;
    qryPessoa_CobrancaBAIRRO: TStringField;
    qryPessoa_CobrancaCIDADE: TStringField;
    qryPessoa_CobrancaCOMPLEMENTO: TStringField;
    qryPessoa_CobrancaUF: TStringField;
    qryPessoa_CobrancaCEP: TStringField;
    qryPessoa_CobrancaFONE: TStringField;
    frxDBCobranca: TfrxDBDataset;
    frxDBEntrega: TfrxDBDataset;
    btnEmail: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbAlterarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: String;
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento,
  uSupervisor, uCadPedido, uEmail;

procedure TfrmPedido.bbAlterarClick(Sender: TObject);
begin

  dados.vAutorizar := true;
  if dados.qryPedidoM.IsEmpty then
    exit;

  if dados.qryPedidoMSITUACAO.Value = 'C' then
  begin
    ShowMessage('Não é possível alterar Pedido Cancelado!');
    exit;
  end;

  try

    if (dados.qryPedidoMSITUACAO.Value = 'F') then
    begin
      if not dados.eSupervisor then
      begin
        try
          bbAlterar.Enabled := false;
          frmSupervisor := TFrmSupervisor.Create(Application);
          dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end;
    end;

    if not dados.vAutorizar then
    begin
      exit;
    end;

    FrmCadPedido := TFrmCadPedido.Create(Application);

    with FrmCadPedido do
    begin
      qryPV.Close;
      qryPV.Params[0].Value := dados.qryPedidoMCODIGO.Value;
      qryPV.Open;

      if qryPV.IsEmpty then
        exit;
      qryPV.edit;
      qryPVSITUACAO.Value := 'A';

      btnFinalizar.Enabled := true;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := false;
      Panel2.Enabled := true;
      Panel3.Enabled := true;
      PageControl1.Enabled := true;
    end;
    FrmCadPedido.ShowModal;
    Application.ProcessMessages;
  finally
    FrmCadPedido.Release;
    btnAtualizarClick(Self);
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmPedido.bbNovoClick(Sender: TObject);
begin
  try
    bbNovo.Enabled := false;
    FrmCadPedido := TFrmCadPedido.Create(Application);
    with FrmCadPedido do
    begin

      qryPV.Close;
      qryPV.Params[0].Value := -1;
      qryPV.Open;

      qryPV.Insert;
      qryPVCODIGO.Value := dados.Numerador('PEDIDO_MASTER', 'CODIGO',
        'N', '', '');

      qryPVNUMERO.Value := dados.Numerador('PEDIDO_MASTER', 'NUMERO',
        'N', '', '');
      qryPVSITUACAO.Value := 'A';
      qryPVGERA_FINANCEIRO.Value := 'S';
      qryPVTIPO.Value := dados.Tela;
      qryPVDATA.Value := DATE;
      qryPVTOTAL.Value := 0;
      qryPVFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      btnFinalizar.Enabled := true;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := false;
      Panel2.Enabled := true;
      Panel3.Enabled := true;
      PageControl1.Enabled := true;

    end;
    FrmCadPedido.ShowModal;
    Application.ProcessMessages;
  finally
    bbNovo.Enabled := true;
    FrmCadPedido.Release;
    btnAtualizarClick(Self);
  end;
end;

procedure TfrmPedido.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qryPedidoMCODIGO.Value;
    localiza;
    dados.qryPedidoM.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  if dados.qryPedidoM.IsEmpty then
  begin
    exit;
  end;

  if (dados.qryPedidoMSITUACAO.Value = 'C') then
  begin
    ShowMessage('Pedido de Venda já está CANCELADO!');
    exit;
  end;

  dados.vAutorizar := true;

  if (dados.qryPedidoMSITUACAO.Value = 'F') then
  begin
    if not dados.eSupervisor then
    begin
      try
        btnCancelar.Enabled := false;
        frmSupervisor := TFrmSupervisor.Create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  If Application.messagebox('Tem certeza que CANCELAR PEDIDO?', 'Confirmação',
    mb_yesno + mb_iconquestion) <> idyes then
  begin
    exit;
  end;

  if not(dados.qryPedidoM.State in dsEditModes) then
    dados.qryPedidoM.edit;
  dados.qryPedidoMSITUACAO.Value := 'C';
  dados.qryPedidoM.Post;
  btnCancelar.Enabled := true;
  ShowMessage('Pedido Cancelado Com Sucesso!');
end;

procedure TfrmPedido.btnEmailClick(Sender: TObject);
begin

  if dados.qryPV.IsEmpty then
    exit;

  try

    btnImp.Enabled := false;

    dados.qryPedidoD.Close;
    dados.qryPedidoD.Params[0].Value := dados.qryPedidoMCODIGO.Value;
    dados.qryPedidoD.Open;

    qryPessoa_entrega.Close;
    qryPessoa_entrega.Params[0].Value := dados.qryPedidoMFKCLIENTE.Value;
    qryPessoa_entrega.Open;

    qryPessoa_Cobranca.Close;
    qryPessoa_Cobranca.Params[0].Value := dados.qryPedidoMFKCLIENTE.Value;
    qryPessoa_Cobranca.Open;

    if dados.Tela = 'SEMENTE' then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelSementes.fr3');
    if dados.Tela = 'SAL' then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelSal.fr3');

    frxPDFExport1.FileName := 'PEDIDO.PDF';
    frxPDFExport1.DefaultPath := ExtractFilePath(Application.ExeName) + '\Temp';
    frxPDFExport1.ShowDialog := false;
    frxPDFExport1.ShowProgress := false;
    frxPDFExport1.OverwritePrompt := false;
    frxReport.PrepareReport();
    frxReport.Export(frxPDFExport1);

    dados.qrySped_contador.Close;
    dados.qrySped_contador.Open;
    dados.qrySped_contador.Locate('fk_empresa',
      dados.qryEmpresaCODIGO.Value, []);

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNome := dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := dados.Tela;
    frmEmail.vTituloAnexo := 'PEDIDO ' + dados.Tela + ' N.' +
      dados.qryPedidoMCODIGO.AsString;
    frmEmail.eNotaFiscal := false;
    frmEmail.AnexaArquivo := true;
    frmEmail.edtEmail.Text := LowerCase(dados.qryEmpresaEMAIL.AsString);
    frmEmail.EdtAssunto.Text := 'PEDIDO ' + dados.Tela + ' N.' +
      dados.qryPedidoMCODIGO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO ' + frmEmail.EdtAssunto.Text;
    frmEmail.LstAnexo.Items.Add(ExtractFilePath(Application.ExeName) +
      'Temp\PEDIDO.PDF');
    frmEmail.ShowModal;

  finally
    frmEmail.Release;
    btnImp.Enabled := true;
    dados.qryPV.Filtered := false;
  end;
end;

procedure TfrmPedido.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmPedido.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    dados.qryPedidoD.Close;
    dados.qryPedidoD.Params[0].Value := dados.qryPedidoMCODIGO.Value;
    dados.qryPedidoD.Open;

    qryPessoa_entrega.Close;
    qryPessoa_entrega.Params[0].Value := dados.qryPedidoMFKCLIENTE.Value;
    qryPessoa_entrega.Open;

    qryPessoa_Cobranca.Close;
    qryPessoa_Cobranca.Params[0].Value := dados.qryPedidoMFKCLIENTE.Value;
    qryPessoa_Cobranca.Open;

    if dados.Tela = 'SEMENTE' then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelSementes.fr3');
    if dados.Tela = 'SAL' then
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelSal.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmPedido.bbViewClick(Sender: TObject);
begin
  try
    bbView.Enabled := false;
    FrmCadPedido := TFrmCadPedido.Create(Application);
    with FrmCadPedido do
    begin
      qryPV.Close;
      qryPV.Params[0].Value := dados.qryPedidoMCODIGO.Value;
      qryPV.Open;

      btnFinalizar.Enabled := false;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := true;
      Panel2.Enabled := false;
      Panel3.Enabled := false;
      PageControl1.Enabled := false;
    end;
    FrmCadPedido.ShowModal;
    Application.ProcessMessages;
  finally
    bbView.Enabled := true;
  end;
end;

procedure TfrmPedido.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.34);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.10);
end;

procedure TfrmPedido.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(Self);
end;

procedure TfrmPedido.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmPedido.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Data';
  DBGrid1.Columns[1].Title.Caption := 'Número';
  DBGrid1.Columns[2].Title.Caption := 'Cliente';
  DBGrid1.Columns[3].Title.Caption := 'Propriedade';
  DBGrid1.Columns[4].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;
  localiza;

end;

procedure TfrmPedido.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPedido.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryPedidoM.Prior;
  if Key = VK_DOWN then
    dados.qryPedidoM.Next;
end;

procedure TfrmPedido.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

  if (idx in [4]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TfrmPedido.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := Self;
  dados.GetComponentes;
end;


procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';
  maskInicio.Text := DateToStr(StartOfTheMonth(DATE));
  maskFim.Text := DateToStr(DATE);
end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    bbNovoClick(Self);
    abort;
  end;
  if Key = vk_f3 then
  begin
    bbAlterarClick(Self);
    abort;
  end;

  if Key = vk_f4 then
  begin
    btnCancelarClick(Self);
    abort;
  end;

  if Key = vk_f5 then
  begin
    btnAtualizarClick(Self);
    abort;
  end;

  if Key = vk_f6 then
  begin
    bbViewClick(Self);
    abort;
  end;

  if Key = vk_f7 then
  begin
    btnImpClick(Self);
    abort;
  end;

  if Key = vk_f12 then
  begin
    maskInicio.SetFocus;
    abort;
  end;
end;

procedure TfrmPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin

  tamanho;

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  DBGrid1TitleClick(DBGrid1.Columns[0]);

  edtLoc.SetFocus;

end;

procedure TfrmPedido.localiza;
var
  filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';

  vSql := ' select pm.*  from pedido_master PM' + ' where pm.tipo=:tp /*where*/'
    + ' /*ordem*/';

  filtro := ' AND pm.fkempresa=' + dados.qryEmpresaCODIGO.AsString;

  filtro := filtro + ' and pm.data>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and pm.data<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    strtodate(maskFim.EditText)));

  case idx of
    1:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pm.NUMERO=' + edtLoc.Text;
      end;
    2:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pm.CLIENTE_NOME like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pm.PROPRIEDADE like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pm.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    0:
      filtro1 := ' and (pm.situacao in (''A'',''F'',''C'',''G''))';
    1:
      filtro1 := ' and Pm.situacao=''A''';
    2:
      filtro1 := ' and Pm.situacao=''G''';
    3:
      filtro1 := ' and Pm.situacao=''F''';
    4:
      filtro1 := ' and Pm.situacao=''C''';
  end;

  case idx of
    0:
      ordem := ' order by Pm.data' + vOrdem;
    1:
      ordem := ' order by Pm.NUMERO' + vOrdem;
    2:
      ordem := ' order by PM.CLIENTE_NOME' + vOrdem;
    3:
      ordem := ' order by Pm.total' + vOrdem;

  end;

  dados.qryPedidoM.Close;

  dados.qryPedidoM.SQL.Text := vSql;
  dados.qryPedidoM.SQL.Text := StringReplace(dados.qryPedidoM.SQL.Text,
    '/*where*/', filtro + filtro1 + ordem, [rfReplaceAll]);

  dados.qryPedidoM.Params[0].Value := dados.Tela;

  dados.qryPedidoM.Open;
end;

procedure TfrmPedido.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

end.
