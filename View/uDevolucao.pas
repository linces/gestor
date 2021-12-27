unit uDevolucao;

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
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, DBGridEh, DBCtrlsEh, DBLookupEh, frxClass,
  frxDBSet, frxExportPDF, frxExportBaseDialog, frxExportXLS,
  Vcl.Imaging.pngimage;

type
  TfrmDevolucao = class(TForm)
    dsDevolucao: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    Panel1: TPanel;
    LblSaldo: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    bbView: TSpeedButton;
    dsEmpresa: TDataSource;
    qryDevolucao: TFDQuery;
    qryDevolucaoCODIGO: TIntegerField;
    qryDevolucaoFK_VENDA: TIntegerField;
    qryDevolucaoFK_CLIENTE: TIntegerField;
    qryDevolucaoDATA: TDateField;
    qryDevolucaoOBS: TStringField;
    qryDevolucaoFKEMPRESA: TIntegerField;
    qryDevolucaoFK_VENDEDOR: TIntegerField;
    qryDevolucaoVENDEDOR: TStringField;
    qryDevolucaoRAZAO: TStringField;
    qryDevolucaoTTOTAL: TAggregateField;
    qryDevolucaoSITUACAO: TStringField;
    qryDevolucaoTIPO_DEVOLUCAO: TStringField;
    btnAtualizar: TSpeedButton;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBPV: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    qryItens: TFDQuery;
    qryItensCODIGO: TIntegerField;
    qryItensFK_DEVOLUCAO: TIntegerField;
    qryItensFK_PRODUTO: TIntegerField;
    qryItensFK_DEVOLUCAO_ITEM: TIntegerField;
    qryItensUNIDADE: TStringField;
    qryItensDESCRICAO: TStringField;
    qryDevolucaoTOTAL: TFMTBCDField;
    qryItensQTD: TFMTBCDField;
    qryItensQTD_VENDIDA: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    pnImpressao: TPanel;
    Shape2: TShape;
    Label21: TLabel;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
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
    procedure bbNovoClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
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
  frmDevolucao: TfrmDevolucao;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uSupervisor, uCadDevolucao, uEmail;

procedure TfrmDevolucao.bbAlterarClick(Sender: TObject);
begin

  if qryDevolucaoSITUACAO.Value = 'F' then
  begin
    ShowMessage('Devolução FINALIZADA não pode ser alterada!');
    exit;
  end;

  try
    bbAlterar.Enabled := false;
    frmCadDevolucao := TfrmCadDevolucao.Create(Application);

    frmCadDevolucao.qryDevolucao.Close;
    frmCadDevolucao.qryDevolucao.Params[0].Value := qryDevolucaoCODIGO.Value;
    frmCadDevolucao.qryDevolucao.Open;

    frmCadDevolucao.qryDevolucao.Edit;

    frmCadDevolucao.btnGravar.Enabled := true;
    frmCadDevolucao.btnSair.Enabled := true;
    frmCadDevolucao.btnFinalizar.Enabled := true;
    frmCadDevolucao.DBGridEh1.ReadOnly := false;
    frmCadDevolucao.Panel2.Enabled := true;
    frmCadDevolucao.Panel3.Enabled := true;
    frmCadDevolucao.ShowModal;
  finally
    frmCadDevolucao.Release;
    btnAtualizar.Click;
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmDevolucao.bbNovoClick(Sender: TObject);
begin
  try
    bbNovo.Enabled := false;
    frmCadDevolucao := TfrmCadDevolucao.Create(Application);

    frmCadDevolucao.qryDevolucao.Close;
    frmCadDevolucao.qryDevolucao.Params[0].Value := -1;
    frmCadDevolucao.qryDevolucao.Open;

    frmCadDevolucao.qryDevolucao.Insert;
    frmCadDevolucao.qryDevolucaoCODIGO.Value :=
      dados.Numerador('DEVOLUCAO_MASTER', 'CODIGO', 'N', '', '');
    frmCadDevolucao.qryDevolucaoSITUACAO.Value := 'A';
    frmCadDevolucao.qryDevolucaoDATA.Value := DATE;
    frmCadDevolucao.qryDevolucaoTOTAL.Value := 0;

    frmCadDevolucao.btnGravar.Enabled := true;
    frmCadDevolucao.btnSair.Enabled := true;
    frmCadDevolucao.btnFinalizar.Enabled := true;
    frmCadDevolucao.DBGridEh1.ReadOnly := false;
    frmCadDevolucao.Panel2.Enabled := true;
    frmCadDevolucao.Panel3.Enabled := true;
    frmCadDevolucao.ShowModal;
  finally
    frmCadDevolucao.Release;
    btnAtualizar.Click;
    bbNovo.Enabled := true;
  end;

end;

procedure TfrmDevolucao.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmDevolucao.btnImpClick(Sender: TObject);
begin
  pnImpressao.Visible := true;
end;

procedure TfrmDevolucao.Button1Click(Sender: TObject);
begin

  if qryDevolucaoSITUACAO.Value <> 'F' then
  begin
    ShowMessage('Só é permitido a impressão de Devolução Fechada!');
    exit;
  end;

  try
    btnImp.Enabled := false;
    qryItens.Close;
    qryItens.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelDevolucao.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmDevolucao.Button2Click(Sender: TObject);
begin

  if qryDevolucaoSITUACAO.Value <> 'F' then
  begin
    ShowMessage('Só é permitido a impressão de Devolução Fechada!');
    exit;
  end;

  try
    btnImp.Enabled := false;
    qryItens.Close;
    qryItens.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelDevolucao80mm.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmDevolucao.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmDevolucao.bbViewClick(Sender: TObject);
begin
  try
    bbView.Enabled := false;
    frmCadDevolucao := TfrmCadDevolucao.Create(Application);
    frmCadDevolucao.qryDevolucao.Close;
    frmCadDevolucao.qryDevolucao.Params[0].Value := qryDevolucaoCODIGO.Value;
    frmCadDevolucao.qryDevolucao.Open;
    frmCadDevolucao.btnFinalizar.Enabled := false;
    frmCadDevolucao.btnGravar.Enabled := false;
    frmCadDevolucao.btnSair.Enabled := true;
    frmCadDevolucao.DBGridEh1.ReadOnly := true;
    frmCadDevolucao.Panel2.Enabled := false;
    frmCadDevolucao.Panel3.Enabled := false;
    frmCadDevolucao.ShowModal;
  finally
    frmCadDevolucao.Release;
    bbView.Enabled := true;
  end;

end;

procedure TfrmDevolucao.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.063);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.082);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.082);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.25);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.15);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.13);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.08);
end;

procedure TfrmDevolucao.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmDevolucao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  i: Integer;
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

procedure TfrmDevolucao.DBGrid1TitleClick(Column: TColumn);
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

  edtLoc.Clear;
  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'NºVenda';
  DBGrid1.Columns[2].Title.Caption := 'Data';
  DBGrid1.Columns[3].Title.Caption := 'Cliente';
  DBGrid1.Columns[4].Title.Caption := 'Vendedor';
  DBGrid1.Columns[5].Title.Caption := 'Tipo';
  DBGrid1.Columns[6].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmDevolucao.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmDevolucao.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryDevolucao.Prior;
  if Key = VK_DOWN then
    qryDevolucao.Next;
end;

procedure TfrmDevolucao.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0, 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [6]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TfrmDevolucao.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmDevolucao.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
end;

procedure TfrmDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_f2 then
  begin
    bbNovoClick(self);
    abort;
  end;
  if Key = vk_f3 then
  begin
    bbAlterarClick(self);
    abort;
  end;
  if Key = vk_f4 then
  begin
    bbViewClick(self);
    abort;
  end;
  if Key = vk_f8 then
  begin
    btnFiltrarClick(self);
    abort;
  end;

  if Key = vk_f12 then
  begin
    maskInicio.SetFocus;
    abort;
  end;
end;

procedure TfrmDevolucao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmDevolucao.FormShow(Sender: TObject);
begin

  tamanho;

  maskInicio.EditText := datetostr(StartOfTheMonth(DATE));
  maskFim.EditText := datetostr(DATE);
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmDevolucao.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := ' where DM.FKempresa=' + dados.qryEmpresaCODIGO.AsString;
  filtro1 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  if vSql = '' then
    vSql := qryDevolucao.SQL.Text;

  filtro := filtro + ' and (dm.Data >=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and dm.Data<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    strtodate(maskFim.EditText))) + ')';

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and DM.codigo=' + edtLoc.Text;
      end;
    1:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and DM.fk_venda=' + edtLoc.Text;
      end;

    2:
      begin
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pes.razao like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ve.nome like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    5:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and dm.tipo_devolucao like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    6:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and dm.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro1 := ' and dm.situacao=''A''';
    2:
      filtro1 := ' and dm.situacao=''F''';
  end;

  case idx of
    0:
      ordem := ' order by dm.codigo ' + vOrdem;
    1:
      ordem := ' order by dm.fk_venda ' + vOrdem;
    2:
      ordem := ' order by dm.data ' + vOrdem;
    3:
      ordem := ' order by pes.razao ' + vOrdem;
    4:
      ordem := ' order by ve.nome ' + vOrdem;
    5:
      ordem := ' order by dm.tipo_devolucao ' + vOrdem;
    6:
      ordem := ' order by dm.total ' + vOrdem;

  end;

  qryDevolucao.Close;
  qryDevolucao.SQL.Text := vSql;
  qryDevolucao.SQL.Text := StringReplace(qryDevolucao.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryDevolucao.Open;
end;

procedure TfrmDevolucao.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

end.
