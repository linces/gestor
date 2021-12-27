unit uConsOS_Roupa;

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
  TfrmConsOS_Roupa = class(TForm)
    TabSet1: TTabSet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    bbNovo: TSpeedButton;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    bbView: TSpeedButton;
    dsOS_Master: TDataSource;
    btnImp: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    Panel4: TPanel;
    Label8: TLabel;
    dsEmpresa: TDataSource;
    Panel12: TPanel;
    Label13: TLabel;
    btnAtualizar: TSpeedButton;
    GroupBox2: TGroupBox;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    btnCancelar: TSpeedButton;
    qryOS_Master: TFDQuery;
    qryOS_MasterTTOTAL: TAggregateField;
    bbAlterar: TSpeedButton;
    qryOS_MasterCODIGO: TIntegerField;
    qryOS_MasterDATA_INICIO: TDateField;
    qryOS_MasterHORA_INICIO: TTimeField;
    qryOS_MasterPREVISAO_ENTREGA: TDateField;
    qryOS_MasterDATA_TERMINO: TDateField;
    qryOS_MasterHORA_TERMINO: TTimeField;
    qryOS_MasterDATA_ENTREGA: TDateField;
    qryOS_MasterHORA_ENTREGA: TTimeField;
    qryOS_MasterFK_ATENDENDE: TIntegerField;
    qryOS_MasterPROBLEMA: TMemoField;
    qryOS_MasterOBSERVACOES: TMemoField;
    qryOS_MasterFK_EMPRESA: TIntegerField;
    qryOS_MasterFK_USUARIO: TIntegerField;
    qryOS_MasterDOCUMENTO: TStringField;
    qryOS_MasterNOME: TStringField;
    qryOS_MasterFONE1: TStringField;
    qryOS_MasterFONE2: TStringField;
    qryOS_MasterSITUACAO: TStringField;
    qryOS_MasterNUMERO_SERIE: TStringField;
    qryOS_MasterDESCRICAO: TStringField;
    qryOS_MasterMODELO: TStringField;
    qryOS_MasterMARCA: TStringField;
    qryOS_MasterANO: TIntegerField;
    qryOS_MasterPLACA: TStringField;
    qryOS_MasterENDERECO: TStringField;
    qryOS_MasterBAIRRO: TStringField;
    qryOS_MasterCIDADE: TStringField;
    qryOS_MasterUF: TStringField;
    qryOS_MasterDATA_EMISSAO: TDateField;
    qryOs_Detalhe: TFDQuery;
    qryOs_DetalheCODIGO: TIntegerField;
    qryOs_DetalheFK_OS_MASTER: TIntegerField;
    qryOs_DetalheFK_FUNCIONARIO: TIntegerField;
    qryOs_DetalheFK_PRODUTO: TIntegerField;
    qryOs_DetalheDATA_INICIO: TDateField;
    qryOs_DetalheHORA_INICIO: TTimeField;
    qryOs_DetalheDATA_TERMINO: TDateField;
    qryOs_DetalheHORA_TERMINO: TTimeField;
    qryOs_DetalheDISCRIMINACAO: TStringField;
    qryOs_DetalheFK_USUARIO: TIntegerField;
    qryOs_DetalheFK_EMPRESA: TIntegerField;
    qryOs_DetalheTIPO: TStringField;
    qryOs_DetalheSITUACAO: TStringField;
    dsItens: TDataSource;
    frxReport1: TfrxReport;
    frxDBOS_Detalhe: TfrxDBDataset;
    frxDBOS_Master: TfrxDBDataset;
    edtEmp: TDBEdit;
    qryOS_MasterKM: TFMTBCDField;
    qryOS_MasterNUMERO: TStringField;
    qryOs_DetalheQTD: TFMTBCDField;
    qryOS_MasterSUBTOTAL: TFMTBCDField;
    qryOS_MasterSUBTOTAL_PECAS: TFMTBCDField;
    qryOS_MasterSUBTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterVL_DESC_PECAS: TFMTBCDField;
    qryOS_MasterVL_DESC_SERVICOS: TFMTBCDField;
    qryOS_MasterDESC_PERC_PECAS: TFMTBCDField;
    qryOS_MasterDESC_PERC_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_PRODUTOS: TFMTBCDField;
    qryOS_MasterTOTAL_GERAL: TFMTBCDField;
    qryOs_DetalhePRECO: TFMTBCDField;
    qryOs_DetalheTOTAL: TFMTBCDField;
    qryOS_MasterQUANTIDADE: TIntegerField;
    qryOS_MasterFK_PRODUTO: TIntegerField;
    qryOS_MasterFK_TIPO_TECIDO: TIntegerField;
    Panel1: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    qryOs_DetalheDETALHE: TStringField;
    qryOs_DetalheTAMANHO: TStringField;
    qryOs_DetalheNOME: TStringField;
    qryOs_DetalheNUMERO: TStringField;
    qryOS_MasterFOTO: TBlobField;
    qryOS_MasterTIPOTECIDO: TStringField;
    qryOS_MasterPRODUTO: TStringField;
    qryOS_MasterFOTO_1: TBlobField;
    qryOs_DetalhePRODUTO: TStringField;
    qryOS_MasterTIPO_SERVICO: TStringField;
    qryOS_MasterNOME_TIME: TStringField;
    qryOs_Imagem: TFDQuery;
    dsOs_imagem: TDataSource;
    qryOs_ImagemCODIGO: TIntegerField;
    qryOs_ImagemITEM: TIntegerField;
    qryOs_ImagemCAMINHO: TStringField;
    qryOs_ImagemFK_OS_MASTER: TIntegerField;
    frxDBOS_Imagem: TfrxDBDataset;
    qryOS_MasterSALDO_RESTANTE: TFloatField;
    qryOs_DetalheCOR: TStringField;
    qryOS_MasterFK_CLIENTE: TIntegerField;
    qryOS_MasterRAZAO: TStringField;
    qryOS_MasterDESCRICAO2: TStringField;
    frxXLSExport1: TfrxXLSExport;
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
    procedure btnImpClick(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryOS_MasterBeforePost(DataSet: TDataSet);
    procedure qryOs_DetalheBeforeInsert(DataSet: TDataSet);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure qryOs_DetalheNewRecord(DataSet: TDataSet);
    procedure qryOS_MasterCalcFields(DataSet: TDataSet);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure FormActivate(Sender: TObject);
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
  frmConsOS_Roupa: TfrmConsOS_Roupa;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento,
  uSupervisor, uCadPedido, uEmail, uCadOS, uCadUniforme;

procedure TfrmConsOS_Roupa.bbAlterarClick(Sender: TObject);
begin

  dados.vAutorizar := true;
  if qryOS_Master.IsEmpty then
    exit;

  if qryOS_MasterSITUACAO.Value = 'C' then
  begin
    ShowMessage('Não é possível alterar OS Cancelada!');
    exit;
  end;

  try

    if (qryOS_MasterSITUACAO.Value = 'F') then
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

    frmCadOS_Roupa := TfrmCadOS_Roupa.Create(Application);
    frmCadOS_Roupa.qryOS_Master.Close;
    frmCadOS_Roupa.qryOS_Master.Params[0].Value := qryOS_MasterCODIGO.Value;
    frmCadOS_Roupa.qryOS_Master.Open;

    if qryOS_Master.IsEmpty then
      exit;
    frmCadOS_Roupa.qryOS_Master.edit;
    frmCadOS_Roupa.qryOS_MasterSITUACAO.Value := 'A';

    frmCadOS_Roupa.btnFinalizar.Enabled := true;
    frmCadOS_Roupa.btnSair.Enabled := true;
    frmCadOS_Roupa.DBGridEh1.ReadOnly := false;
    frmCadOS_Roupa.Panel2.Enabled := true;
    frmCadOS_Roupa.Panel3.Enabled := true;
    frmCadOS_Roupa.PageControl1.Enabled := true;
    frmCadOS_Roupa.ShowModal;
    Application.ProcessMessages;
  finally
    frmCadOS_Roupa.Release;
    btnAtualizarClick(Self);
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmConsOS_Roupa.bbNovoClick(Sender: TObject);
var
  codigo: Integer;
begin
  try

    bbNovo.Enabled := false;
    frmCadOS_Roupa := TfrmCadOS_Roupa.Create(Application);

    codigo := dados.Numerador('OS_MASTER', 'CODIGO', 'N', '', '');

    frmCadOS_Roupa.qryOS_Master.Close;
    frmCadOS_Roupa.qryOS_Master.Params[0].Value := codigo;
    frmCadOS_Roupa.qryOS_Master.Open;

    frmCadOS_Roupa.qryOS_Master.Insert;
    frmCadOS_Roupa.qryOS_MasterDATA_EMISSAO.Value := date;
    frmCadOS_Roupa.qryOS_MasterCODIGO.Value := codigo;
    frmCadOS_Roupa.qryOS_MasterSITUACAO.Value := 'A';
    frmCadOS_Roupa.qryOS_MasterSUBTOTAL.Value := 0;
    frmCadOS_Roupa.qryOS_MasterSUBTOTAL_PECAS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterSUBTOTAL_SERVICOS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterDESC_PERC_PECAS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterDESC_PERC_SERVICOS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterDESC_PERC_SERVICOS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterVL_DESC_PECAS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterVL_DESC_SERVICOS.Value := 0;
    frmCadOS_Roupa.qryOS_MasterFK_ATENDENDE.Value := 0;
    frmCadOS_Roupa.qryOS_MasterFK_ATENDENDE.Value := 0;
    frmCadOS_Roupa.qryOS_MasterDATA_INICIO.Value := date;
    frmCadOS_Roupa.qryOS_MasterHORA_INICIO.Value := NOW;
    frmCadOS_Roupa.qryOS_MasterFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadOS_Roupa.qryOS_MasterFK_USUARIO.Value := dados.idUsuario;
    frmCadOS_Roupa.btnFinalizar.Enabled := true;
    frmCadOS_Roupa.btnSair.Enabled := true;
    frmCadOS_Roupa.DBGridEh1.ReadOnly := false;
    Panel2.Enabled := true;
    Panel3.Enabled := true;
    frmCadOS_Roupa.PageControl1.Enabled := true;
    frmCadOS_Roupa.ShowModal;
    Application.ProcessMessages;
  finally
    bbNovo.Enabled := true;
    frmCadOS_Roupa.Release;
    btnAtualizarClick(Self);
  end;
end;

procedure TfrmConsOS_Roupa.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := qryOS_MasterCODIGO.Value;
    localiza;
    qryOS_Master.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmConsOS_Roupa.btnCancelarClick(Sender: TObject);
begin
  if qryOS_Master.IsEmpty then
  begin
    exit;
  end;

  if (qryOS_MasterSITUACAO.Value = 'C') then
  begin
    ShowMessage('OS já está CANCELADO!');
    exit;
  end;

  dados.vAutorizar := true;

  if (qryOS_MasterSITUACAO.Value = 'F') then
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

  If Application.messagebox('Tem certeza que CANCELAR OS?', 'Confirmação',
    mb_yesno + mb_iconquestion) <> idyes then
  begin
    exit;
  end;

  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.edit;
  qryOS_MasterSITUACAO.Value := 'C';
  qryOS_Master.Post;
  btnCancelar.Enabled := true;
  ShowMessage('OS Cancelado Com Sucesso!');
end;

procedure TfrmConsOS_Roupa.btnFiltrarClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsOS_Roupa.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    qryOS_Master.Filtered := false;
    qryOS_Master.Filter := 'CODIGO=' + qryOS_MasterCODIGO.AsString;
    qryOS_Master.Filtered := true;

    qryOs_Detalhe.Close;
    qryOs_Detalhe.Params[0].Value := qryOS_MasterCODIGO.Value;
    qryOs_Detalhe.Open;

    qryOs_Imagem.Close;
    qryOs_Imagem.Params[0].Value := qryOS_MasterCODIGO.Value;
    qryOs_Imagem.Open;

    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelOS_Roupas.fr3');

    qryOs_Imagem.First;

    if (FileExists(qryOs_ImagemCAMINHO.Value)) then
      TfrxPictureView(frxReport1.FindObject('Logo1'))
        .Picture.LoadFromFile(qryOs_ImagemCAMINHO.Value);

    qryOs_Imagem.Next;

    if (FileExists(qryOs_ImagemCAMINHO.Value)) then
      TfrxPictureView(frxReport1.FindObject('Logo2'))
        .Picture.LoadFromFile(qryOs_ImagemCAMINHO.Value);

    frxReport1.ShowReport;

  finally
    btnImp.Enabled := true;
    qryOS_Master.Filtered := false;
  end;
end;

procedure TfrmConsOS_Roupa.bbViewClick(Sender: TObject);
begin
  try
    bbView.Enabled := false;

    frmCadOS_Roupa := TfrmCadOS_Roupa.Create(Application);
    frmCadOS_Roupa.qryOS_Master.Close;
    frmCadOS_Roupa.qryOS_Master.Params[0].Value := qryOS_MasterCODIGO.Value;
    frmCadOS_Roupa.qryOS_Master.Open;

    frmCadOS_Roupa.btnFinalizar.Enabled := false;
    frmCadOS_Roupa.btnSair.Enabled := true;
    frmCadOS_Roupa.DBGridEh1.ReadOnly := true;
    frmCadOS_Roupa.Panel2.Enabled := false;
    frmCadOS_Roupa.Panel3.Enabled := false;
    frmCadOS_Roupa.PageControl1.Enabled := false;
    frmCadOS_Roupa.ShowModal;
    Application.ProcessMessages;
  finally
    bbView.Enabled := true;
  end;
end;

procedure TfrmConsOS_Roupa.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.50);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.10);
end;

procedure TfrmConsOS_Roupa.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(Self);
end;

procedure TfrmConsOS_Roupa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmConsOS_Roupa.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Numero';
  DBGrid1.Columns[1].Title.Caption := 'Data Pedido';
  DBGrid1.Columns[2].Title.Caption := 'Data Entrega';
  DBGrid1.Columns[3].Title.Caption := 'Cliente';
  DBGrid1.Columns[4].Title.Caption := 'Total';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  if (idx in [1 .. 2]) then
  begin
    GroupBox1.Visible := false;
    maskInicio.SetFocus;
    if idx = 1 then
      GroupBox1.Caption := 'Informe o Período';
    if idx = 2 then
      GroupBox1.Caption := 'data do Término';

  end
  else
  begin
    GroupBox1.Visible := true;
    edtLoc.SetFocus;
  end;

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Width := DBGrid1.Columns[idx].Width + 50;

  localiza;

end;

procedure TfrmConsOS_Roupa.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsOS_Roupa.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryOS_Master.Prior;
  if Key = VK_DOWN then
    qryOS_Master.Next;
end;

procedure TfrmConsOS_Roupa.edtLocKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmConsOS_Roupa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmConsOS_Roupa.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';
  maskInicio.Text := DateToStr(StartOfTheMonth(date));
  maskFim.Text := DateToStr(date);

  bbNovo.Caption := 'F2' + sLineBreak + 'Abrir';
  bbAlterar.Caption := 'F3' + sLineBreak + 'Alterar';
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnAtualizar.Caption := 'F5' + sLineBreak + 'Atualizar';
  bbView.Caption := 'F6' + sLineBreak + 'Ver Detalhe';
  btnImp.Caption := 'F7' + sLineBreak + 'Imprimir';
end;

procedure TfrmConsOS_Roupa.FormKeyDown(Sender: TObject; var Key: Word;
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

  if Key = vk_f8 then
  begin
    if not(idx in [1 .. 2]) then
      edtLoc.SetFocus
    else
      maskInicio.SetFocus;
    abort;
  end;
end;

procedure TfrmConsOS_Roupa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmConsOS_Roupa.FormShow(Sender: TObject);
begin

  tamanho;

  btnFiltrar.Click;

  edtLoc.SetFocus;

end;

procedure TfrmConsOS_Roupa.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'OS' then
  begin
    Value := 'OS ' + qryOS_MasterCODIGO.AsString;
  end;
end;

procedure TfrmConsOS_Roupa.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin

  if VarName = 'CIDADE_DATA' then
  begin
    Value := dados.qryEmpresaCIDADE.Value + '-' + dados.qryEmpresaUF.Value + ','
      + formatdatetime('dd mmmm yyyy', date);
  end;
end;

procedure TfrmConsOS_Roupa.localiza;
var
  filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';

  if vSql = '' then
    vSql := qryOS_Master.SQL.Text;

  filtro := ' AND os.fk_empresa=' + dados.qryEmpresaCODIGO.AsString;

  GroupBox1.Caption := 'Período';
  filtro := filtro + ' and os.data_inicio>=' +
    QuotedStr(formatdatetime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and os.data_inicio<=' + QuotedStr(formatdatetime('mm/dd/yyyy',
    strtodate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and os.CODIGO=' + edtLoc.Text;
      end;
    1:
      begin
        filtro := filtro + ' and os.data_inicio>=' +
          QuotedStr(formatdatetime('mm/dd/yyyy', strtodate(maskInicio.EditText))
          ) + ' and os.data_inicio<=' +
          QuotedStr(formatdatetime('mm/dd/yyyy', strtodate(maskFim.EditText)));
      end;
    2:
      begin
        filtro := filtro + ' and os.data_termino>=' +
          QuotedStr(formatdatetime('mm/dd/yyyy', strtodate(maskInicio.EditText))
          ) + ' and os.data_termino<=' +
          QuotedStr(formatdatetime('mm/dd/yyyy', strtodate(maskFim.EditText)));
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and os.NOME like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and os.TOTAL_GERAL >= ' +
            StringReplace(edtLoc.Text, ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro1 := ' and os.situacao=''A'''; // ABERTA
    2:
      filtro1 := ' and os.situacao=''F'''; // CONCLUIDA
    3:
      filtro1 := ' and os.situacao=''C'''; // CANCELADA
  end;

  case idx of
    0:
      ordem := ' order by os.codigo ' + vOrdem;
    1:
      ordem := ' order by os.data_inicio ' + vOrdem;
    2:
      ordem := ' order by os.data_termino ' + vOrdem;
    3:
      ordem := ' order by os.nome ' + vOrdem;
    4:
      ordem := ' order by os.total_geral ' + vOrdem;

  end;

  qryOS_Master.Close;
  qryOS_Master.SQL.Clear;
  qryOS_Master.SQL.Text := vSql;
  qryOS_Master.SQL.Text := StringReplace(qryOS_Master.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryOS_Master.Open;
end;

procedure TfrmConsOS_Roupa.qryOs_DetalheBeforeInsert(DataSet: TDataSet);
begin
  if qryOS_Master.State in dsEditModes then
    qryOS_Master.Post;
end;

procedure TfrmConsOS_Roupa.qryOs_DetalheNewRecord(DataSet: TDataSet);
begin
  qryOs_DetalheFK_FUNCIONARIO.Value := 0;
  qryOs_DetalheFK_USUARIO.Value := dados.idUsuario;
  qryOs_DetalheFK_USUARIO.Value := dados.idUsuario;
end;

procedure TfrmConsOS_Roupa.qryOS_MasterBeforePost(DataSet: TDataSet);
begin
  if qryOS_Master.State = dsInsert then
    qryOS_MasterCODIGO.Value := dados.Numerador('OS_MASTER', 'CODIGO',
      'N', '', '');
end;

procedure TfrmConsOS_Roupa.qryOS_MasterCalcFields(DataSet: TDataSet);
begin
  qryOS_MasterSALDO_RESTANTE.AsFloat := qryOS_MasterTOTAL_GERAL.AsFloat -
    qryOS_MasterTOTAL_PRODUTOS.AsFloat
end;

procedure TfrmConsOS_Roupa.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsOS_Roupa.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
