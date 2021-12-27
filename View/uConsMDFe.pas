unit uConsMDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Math, System.zip, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversao, acbrUtil, ACBrDFeSSL, blcksock,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF,
  ACBrBase, ACBrMail, ACBrDFe, ACBrEnterTab, pmdfeConversaomdfe,
  frxExportBaseDialog, ACBrMDFeDAMDFeRLClass,
  ACBrDFeReport, ACBrMDFeDAMDFeClass, ACBrMDFeDAMDFEFR, ACBrMDFe, frxExportXLS;

type
  TfrmConsMDFe = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    LblSaldo: TLabel;
    btnRecuperar: TSpeedButton;
    btnImprimir: TSpeedButton;
    OpenDialog1: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryMDFe_M: TFDQuery;
    dsMDFE_M: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    qryMDFe_D: TFDQuery;
    dsMDFeD: TDataSource;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel11: TPanel;
    BtnEncerrar: TSpeedButton;
    frxDBEmpresa: TfrxDBDataset;
    qryRelatorio: TFDQuery;
    qryRelatorioNUMERO: TIntegerField;
    qryRelatorioDATA_EMISSAO: TDateField;
    qryRelatorioCHAVE: TStringField;
    qryRelatorioSITUACAO: TStringField;
    qryRelatorioVIRTUAL_SITUACAO: TStringField;
    frxDBDataset2: TfrxDBDataset;
    qryRelatorioPROTOCOLO: TStringField;
    qryRelatorioTOTAL: TBCDField;
    btnRelatorio: TSpeedButton;
    qryMDFe_MCODIGO: TIntegerField;
    qryMDFe_MFK_TRANSPORTADOR: TIntegerField;
    qryMDFe_MNUMERO_MDFE: TIntegerField;
    qryMDFe_MDATA: TDateField;
    qryMDFe_MID_MUNICIPIO: TStringField;
    qryMDFe_MUF_INICIO: TStringField;
    qryMDFe_MUF_FIM: TStringField;
    qryMDFe_MUNIDADE_CARGA: TStringField;
    qryMDFe_MFK_EMPRESA: TSmallintField;
    qryMDFe_MINFCPL: TMemoField;
    qryMDFe_MINFADFISCO: TMemoField;
    qryMDFe_MCHAVE: TStringField;
    qryMDFe_MPROTOCOLO: TStringField;
    qryMDFe_MXML: TMemoField;
    qryMDFe_MDATA_EMISSAO: TDateField;
    qryMDFe_MSITUACAO: TStringField;
    qryMDFe_MRESP_SEGURO: TSmallintField;
    qryMDFe_MTIPO_MDFE: TStringField;
    qryMDFe_MTIPO: TStringField;
    qryMDFe_MNOME_SEGURADORA: TStringField;
    qryMDFe_MCPF_SEGURADORA: TStringField;
    qryMDFe_MNUMERO_APOLICE: TStringField;
    qryMDFe_MQTD_CTE: TIntegerField;
    qryMDFe_MVALOR_CARGA: TFMTBCDField;
    qryMDFe_MQTD_CARGA: TFMTBCDField;
    qryMDFe_MPLACA: TStringField;
    qryMDFe_MID_ORIGEM: TIntegerField;
    qryMDFe_MID_DESTINO: TIntegerField;
    qryMDFe_MCARGA_PROPRIA: TStringField;
    qryMDFe_MCNPJ_RESPONSAVEL: TStringField;
    qryMDFe_MNUMERO_AVERBACAO: TStringField;
    qryMDFe_MSERIE: TIntegerField;
    qryMDFe_DCODIGO: TIntegerField;
    qryMDFe_DFK_MDFE_MASTER: TIntegerField;
    qryMDFe_DCHAVE: TStringField;
    qryMDFe_DVALOR: TFMTBCDField;
    qryMDFe_DPESO: TFMTBCDField;
    qryMDFe_DNUMERO: TIntegerField;
    qryMDFe_DFK_DESTINATARIO: TIntegerField;
    qryMDFe_DFK_EMPRESA: TIntegerField;
    qryMDFe_DFK_USUARIO: TIntegerField;
    frxXLSExport1: TfrxXLSExport;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
    btnWhats: TSpeedButton;
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure qryRelatorioCalcFields(DataSet: TDataSet);
    procedure btnRecuperarClick(Sender: TObject);
    procedure BtnEncerrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure TabSet1Change(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure habilitaBotoes;
    { Private declarations }
  public
    operacao, idx: Integer;
    vOrdem, vSql: String;

    { Public declarations }
  end;

var
  frmConsMDFe: TfrmConsMDFe;

implementation

{$R *.dfm}

uses uCadMDFe, Udados, uNaoEncerrado, ufrmStatus, uDmMDFE;


procedure TfrmConsMDFe.btnAlterarClick(Sender: TObject);
var
  codigo: Integer;
begin
  operacao := 1;
  if qryMDFe_M.IsEmpty then
    exit;

  if (qryMDFe_MSITUACAO.Value <> 'A') then
  begin
    ShowMessage('Não é possivel alterar MDFe!');
    exit;
  end;

  codigo := qryMDFe_MCODIGO.Value;

  try
    btnAlterar.Enabled := false;
    frmCadMDFe := TfrmCadMDFe.Create(Application);

    frmCadMDFe.qryMDFe_M.Close;
    frmCadMDFe.qryMDFe_M.Params[0].Value := codigo;
    frmCadMDFe.qryMDFe_M.Open;

    frmCadMDFe.qryMDFe_M.edit;

    frmCadMDFe.btnGravar.Enabled := true;
    frmCadMDFe.btnTransmitir.Enabled := true;
    frmCadMDFe.btnSair.Enabled := true;
    frmCadMDFe.DBGridEh1.ReadOnly := false;
    frmCadMDFe.Panel3.Enabled := true;

    frmCadMDFe.ShowModal;

  finally
    frmCadMDFe.Release;
    btnFiltrar.Click;
    btnAlterar.Enabled := true;
  end;
end;

procedure TfrmConsMDFe.btnCancelarClick(Sender: TObject);
var
  vAux: String;
begin

  if Application.messageBox('Tem Certeza de que Deseja Cancelar MDFe?',
    'Confirmação', mb_YesNo) = mrYes then
  begin

    DmMDFe.ConfiguraMDFe;

    if qryMDFe_MSITUACAO.Value = 'T' then
    begin
      DmMDFe.ACBrMDFe.Manifestos.Clear;
      vAux := InputBox('Cancelamento MDFe', 'Justificativa', vAux);
      if Length(vAux) < 15 then
      begin
        ShowMessage('A Justificativa deve ter no minímo 15 caracteres!');
        exit;
      end;

      DmMDFe.ACBrMDFe.EventoMDFe.Evento.Clear;

      with DmMDFe.ACBrMDFe.EventoMDFe.Evento.Add do
      begin
        infEvento.chMDFe := qryMDFe_MCHAVE.Value;
        infEvento.CNPJCPF := TiraPontos(Dados.qryEmpresaCNPJ.Value);
        infEvento.dhEvento := now;
        infEvento.tpEvento := teCancelamento;
        infEvento.nSeqEvento := 1;

        infEvento.detEvento.nProt := qryMDFe_MPROTOCOLO.Value;
        infEvento.detEvento.xJust := Trim(vAux);
      end;

      if DmMDFe.ACBrMDFe.EnviarEvento(1) then
      begin
        qryMDFe_M.edit;
        qryMDFe_MSITUACAO.Value := 'C';
        qryMDFe_M.Post;
        Dados.Conexao.CommitRetaining;
        btnFiltrarClick(Self);
      end;
    end
    else
    begin
      if (qryMDFe_MSITUACAO.Value = 'A') then
      begin
        qryMDFe_M.edit;
        qryMDFe_MSITUACAO.Value := 'C';
        qryMDFe_M.Post;
        Dados.Conexao.CommitRetaining;
        btnFiltrar.Click;
      end;
    end;
  end;
end;

procedure TfrmConsMDFe.BtnEncerrarClick(Sender: TObject);
begin
  try
    DmMDFe.ConfiguraMDFe;
    frmEncerrar := TfrmEncerrar.Create(Application);
    frmEncerrar.ShowModal;
  finally
    frmEncerrar.Release;
    btnFiltrar.Click;
  end;
end;

procedure TfrmConsMDFe.habilitaBotoes;
begin
  Panel3.Width := 630;
  // btnAlterar.Visible := false;
  btnCancelar.Visible := false;
  btnRecuperar.Visible := false;
  btnImprimir.Visible := false;
  // btnEmail.Visible := false;
  // btnRelatorio.Visible := false;

  btnNovo.Left := 0;
  btnAlterar.Left := 75;
  btnCancelar.Left := 150;
  btnRecuperar.Left := 300;
  btnImprimir.Left := 450;
  // btnEmail.Left := 600;
  // btnRelatorio.Left := 675;

  // btnAlterar.Visible := TabSet1.TabIndex = 0;
  btnCancelar.Visible := TabSet1.TabIndex = 0;
  btnRecuperar.Visible := TabSet1.TabIndex in [0, 4];
  btnImprimir.Visible := TabSet1.TabIndex in [0, 2, 3];
  // btnEmail.Visible := TabSet1.TabIndex = 1;
  // btnRelatorio.Visible := true;
end;

procedure TfrmConsMDFe.btnRecuperarClick(Sender: TObject);
begin

  DmMDFe.ConfiguraMDFe;

  DmMDFe.ACBrMDFe.Manifestos.Clear;
  DmMDFe.ACBrMDFe.Manifestos.LoadFromString(qryMDFe_MXML.Value);
  DmMDFe.ACBrMDFe.Consultar;
  if DmMDFe.ACBrMDFe.WebServices.Consulta.cStat = 100 then
  begin
    qryMDFe_M.edit;
    qryMDFe_MPROTOCOLO.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0]
      .MDFe.procMDFe.nProt;
    qryMDFe_MCHAVE.Value :=
      COPY(DmMDFe.ACBrMDFe.Manifestos.Items[0].MDFe.infMDFe.ID, 5, 100);
    qryMDFe_MXML.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0].XML;
    qryMDFe_MDATA_EMISSAO.Value := now;
    qryMDFe_MSITUACAO.Value := 'T';
    qryMDFe_M.Post;
    Dados.Conexao.CommitRetaining;
  end;
  btnFiltrar.Click;
end;

procedure TfrmConsMDFe.btnRelatorioClick(Sender: TObject);
begin
  if qryMDFe_M.IsEmpty then
    exit;
  try
    btnRelatorio.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\ListadeNFe.fr3');
    frxReport.ShowReport;
  finally
    btnRelatorio.Enabled := true;
  end;
end;

procedure TfrmConsMDFe.btnWhatsClick(Sender: TObject);
var
  arquivo: string;
  FFone: String;
begin

  if qryMDFe_M.IsEmpty then
    exit;

  if Trim(qryMDFe_MXML.AsString) = '' then
    exit;

  DmMDFe.ConfiguraMDFe;
  DmMDFe.ACBrMDFe.Manifestos.Clear;
  DmMDFe.ACBrMDFe.Manifestos.LoadFromString(qryMDFe_MXML.Value);
  arquivo := DmMDFe.ACBrMDFe.DAMDFe.PathPDF + qryMDFe_MCHAVE.Value +
    '-mdfe.PDF';

  if not FilesExists(arquivo) then
    DmMDFe.ACBrMDFe.Manifestos.ImprimirPDF;

  if FileExists(arquivo) then
  begin

    FFone := InputBox('Digite o numero do whatsapp', 'Número:', '');
    if Length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    Dados.InsereMensagemZap(arquivo, FFone,
      'Conforme solicitado, segue MDFe Número:' + qryMDFe_MNUMERO_MDFE.AsString,
      '', '', Dados.qryEmpresaRAZAO.AsString, 'MDFE');
  end;

end;

function TfrmConsMDFe.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmConsMDFe.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmConsMDFe.btnImprimirClick(Sender: TObject);
begin
  if (qryMDFe_MSITUACAO.Value = 'T') then
  begin
    DmMDFe.ACBrMDFe.Manifestos.Clear;
    DmMDFe.ACBrMDFe.Manifestos.LoadFromString(qryMDFe_MXML.Value);
    DmMDFe.ACBrMDFe.Manifestos.Imprimir;
    DmMDFe.ACBrMDFe.DAMDFe.PathPDF := DmMDFe.ACBrMDFe.Configuracoes.Arquivos.
      GetPathMDFe(qryMDFe_MDATA_EMISSAO.Value, Dados.qryEmpresaCNPJ.AsString);

    DmMDFe.ACBrMDFe.Manifestos.ImprimirPDF;
    DmMDFe.ACBrMDFe.Manifestos.GravarXML();
  end;

end;

procedure TfrmConsMDFe.btnNovoClick(Sender: TObject);
begin
  operacao := 1;
  try
    btnNovo.Enabled := false;
    frmCadMDFe := TfrmCadMDFe.Create(Application);

    frmCadMDFe.qryMDFe_M.Close;
    frmCadMDFe.qryMDFe_M.Params[0].Value := -1;
    frmCadMDFe.qryMDFe_M.Open;

    frmCadMDFe.qryMDFe_M.Insert;

    frmCadMDFe.btnGravar.Enabled := true;
    frmCadMDFe.btnTransmitir.Enabled := true;
    frmCadMDFe.btnSair.Enabled := true;
    frmCadMDFe.DBGridEh1.ReadOnly := false;
    frmCadMDFe.Panel3.Enabled := true;
    frmCadMDFe.ShowModal;

  finally
    frmCadMDFe.Release;
    btnFiltrar.Click;
    btnNovo.Enabled := true;
  end;
end;

procedure TfrmConsMDFe.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.065);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.055);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.650);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.090);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.100);
end;

procedure TfrmConsMDFe.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmConsMDFe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmConsMDFe.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
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
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Data';
  DBGrid1.Columns[2].Title.Caption := 'Chave';
  DBGrid1.Columns[3].Title.Caption := 'Protocolo';
  DBGrid1.Columns[4].Title.Caption := 'Valor Carga';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  if DBGrid1.Columns[idx].Width > 400 then
    edtLoc.Width := 400;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

  if (idx in [1 .. 2]) then
    maskInicio.SetFocus
  else
    edtLoc.SetFocus;
end;

procedure TfrmConsMDFe.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsMDFe.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryMDFe_M.Prior;
  if Key = VK_DOWN then
    qryMDFe_M.Next;
end;

procedure TfrmConsMDFe.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := Self;
  Dados.GetComponentes;
end;

procedure TfrmConsMDFe.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';
  DecodeDate(date, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := datetostr(date);

  btnNovo.Caption := 'F2' + sLineBreak + 'Novo';
  btnAlterar.Caption := 'F3' + sLineBreak + 'Alterar';
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnRecuperar.Caption := 'F6' + sLineBreak + 'Recuperar';
  btnImprimir.Caption := 'F7' + sLineBreak + 'Imprimir';
  BtnEncerrar.Caption := 'F8' + sLineBreak + 'Encerrar';
  btnRelatorio.Caption := 'F10' + sLineBreak + 'Relatório';

end;

procedure TfrmConsMDFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnNovo.Click;
  if Key = vk_f3 then
    btnAlterar.Click;
  if Key = vk_f4 then
    btnCancelar.Click;
  if Key = vk_f6 then
    btnRecuperar.Click;
  if Key = vk_f7 then
    BtnEncerrar.Click;
  if Key = vk_f8 then
    btnImprimir.Click;
  if Key = vk_f10 then
    btnRelatorio.Click;
  if Key = vk_f11 then
    btnWhats.Click;
  if Key = vk_f12 then
    maskInicio.SetFocus;
end;

procedure TfrmConsMDFe.FormShow(Sender: TObject);
begin
  Dados.qryProd.Close;
  Dados.qryProd.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryProd.Open;

  Dados.qryTerminal.Close;
  Dados.qryTerminal.Params[0].Value := Dados.Getcomputer;
  Dados.qryTerminal.Open;

  tamanho;
  maskInicio.EditText := datetostr(StartOfTheMonth(date));
  maskFim.EditText := datetostr(date);
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  qryMDFe_M.Last;
  edtLoc.SetFocus;

  habilitaBotoes;

end;

procedure TfrmConsMDFe.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  vSql := ' select MDFE.* from MDFE_MASTER MDFE ' + ' where' + ' codigo>0' +
    ' /*where*/';

  filtro := filtro + ' and MDFE.fk_empresa=' + Dados.qryEmpresaCODIGO.AsString;

  filtro := filtro + ' and MDFE.Data>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and MDFE.Data<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    strtodate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and MDFE.numero_mdfe like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    2:
      begin
        filtro := filtro + ' and MDFE.CHAVE like ' +
          QuotedStr(parte + edtLoc.Text + '%');

      end;
    3:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and MDFE.protocolo like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and MDFE.valor_carga >= ' +
            StringReplace(edtLoc.Text, ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    0:
      filtro1 := ' and MDFE.situacao=''T'''; // TRANSMITIDA
    1:
      filtro1 := ' and MDFE.situacao=''A'''; // ABERTA
    2:
      filtro1 := ' and MDFE.situacao=''E'''; // ENCERRADO
    3:
      filtro1 := ' and MDFE.situacao=''C'''; // CANCELADO
    4:
      filtro1 := ' and MDFE.situacao=''D'''; // DUPLICIDADE
  end;

  case idx of
    0:
      ordem := ' order by MDFE.numero_mdfe ' + vOrdem;
    1:
      ordem := ' order by MDFE.data ' + vOrdem;
    2:
      ordem := ' order by MDFE.chave ' + vOrdem;
    3:
      ordem := ' order by MDFE.protocolo ' + vOrdem;
    4:
      ordem := ' order by MDFE.valor_carga ' + vOrdem;

  end;

  qryMDFe_M.Close;

  qryMDFe_M.SQL.Text := vSql;
  qryMDFe_M.SQL.Text := StringReplace(qryMDFe_M.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryMDFe_M.Open;
end;

procedure TfrmConsMDFe.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;

end;

procedure TfrmConsMDFe.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmConsMDFe.qryRelatorioCalcFields(DataSet: TDataSet);
begin
  if qryRelatorioSITUACAO.Value = '1' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryRelatorioSITUACAO.Value = '2' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryRelatorioSITUACAO.Value = '3' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryRelatorioSITUACAO.Value = '4' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryRelatorioSITUACAO.Value = '5' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
end;

procedure TfrmConsMDFe.TabSet1Change(Sender: TObject);
begin
  habilitaBotoes;
  localiza;
end;

end.
