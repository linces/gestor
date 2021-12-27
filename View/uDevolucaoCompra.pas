unit uDevolucaoCompra;

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
  frxDBSet, frxExportPDF, frxExportBaseDialog;

type
  TfrmDevolucaoCompra = class(TForm)
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
    qryDevolucaoTTOTAL: TAggregateField;
    btnAtualizar: TSpeedButton;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBPV: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    qryItens: TFDQuery;
    qryDevolucaoCODIGO: TIntegerField;
    qryDevolucaoDATA: TDateField;
    qryDevolucaoFK_FORNECEDOR: TIntegerField;
    qryDevolucaoTOTAL: TFMTBCDField;
    qryDevolucaoNUMERO_COMPRA: TIntegerField;
    qryDevolucaoFK_EMPRESA: TIntegerField;
    qryDevolucaoSITUACAO: TStringField;
    qryDevolucaoFK_USUARIO: TIntegerField;
    qryDevolucaoRAZAO: TStringField;
    qryItensCODIGO: TIntegerField;
    qryItensFK_DEVOLUCAO_COMPRA_M: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensQTD_COMPRADA: TFMTBCDField;
    qryItensQTD_DEVOLVIDA: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensDESCRICAO: TStringField;
    qryItensUNIDADE: TStringField;
    qryDevolucaoOBSERVACAO: TStringField;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
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
    procedure btnImpClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
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
  frmDevolucaoCompra: TfrmDevolucaoCompra;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uSupervisor, uCadDevolucao, uEmail,
  uCadDevolucaoComrpa;

procedure TfrmDevolucaoCompra.bbAlterarClick(Sender: TObject);
begin
  if qryDevolucaoSITUACAO.Value = 'F' then
  begin
    ShowMessage('Devolução FINALIZADA não pode ser alterada!');
    exit;
  end;

  try
    bbAlterar.Enabled := false;
    frmCadDevolucaoCompra := TfrmCadDevolucaoCompra.Create(Application);

    frmCadDevolucaoCompra.qryDevolucao.Close;
    frmCadDevolucaoCompra.qryDevolucao.Params[0].Value :=
      qryDevolucaoCODIGO.Value;
    frmCadDevolucaoCompra.qryDevolucao.Open;

    frmCadDevolucaoCompra.qryDevolucao.Edit;

    frmCadDevolucaoCompra.btnGravar.Enabled := true;
    frmCadDevolucaoCompra.btnSair.Enabled := true;
    frmCadDevolucaoCompra.btnFinalizar.Enabled := true;
    frmCadDevolucaoCompra.DBGridEh1.ReadOnly := false;
    frmCadDevolucaoCompra.Panel2.Enabled := true;
    frmCadDevolucaoCompra.Panel3.Enabled := true;
    frmCadDevolucaoCompra.ShowModal;
  finally
    frmCadDevolucaoCompra.Release;
    btnAtualizar.Click;
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmDevolucaoCompra.bbNovoClick(Sender: TObject);
begin
  try
    bbNovo.Enabled := false;
    frmCadDevolucaoCompra := TfrmCadDevolucaoCompra.Create(Application);

    frmCadDevolucaoCompra.qryDevolucao.Close;
    frmCadDevolucaoCompra.qryDevolucao.Params[0].Value := -1;
    frmCadDevolucaoCompra.qryDevolucao.Open;

    frmCadDevolucaoCompra.qryDevolucao.Insert;
    frmCadDevolucaoCompra.qryDevolucaoCODIGO.Value :=
      dados.Numerador('DEVOLUCA_COMPRA_M', 'CODIGO', 'N', '', '');
    frmCadDevolucaoCompra.qryDevolucaoSITUACAO.Value := 'A';
    frmCadDevolucaoCompra.qryDevolucaoDATA.Value := DATE;
    frmCadDevolucaoCompra.qryDevolucaoTOTAL.Value := 0;

    frmCadDevolucaoCompra.btnGravar.Enabled := true;
    frmCadDevolucaoCompra.btnSair.Enabled := true;
    frmCadDevolucaoCompra.btnFinalizar.Enabled := true;
    frmCadDevolucaoCompra.DBGridEh1.ReadOnly := false;
    frmCadDevolucaoCompra.Panel2.Enabled := true;
    frmCadDevolucaoCompra.Panel3.Enabled := true;
    frmCadDevolucaoCompra.ShowModal;
  finally
    frmCadDevolucaoCompra.Release;
    btnAtualizar.Click;
    bbNovo.Enabled := true;
  end;

end;

procedure TfrmDevolucaoCompra.btnAtualizarClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmDevolucaoCompra.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmDevolucaoCompra.btnImpClick(Sender: TObject);
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
      '\Relatorio\RelDevolucaoCompra.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

procedure TfrmDevolucaoCompra.bbViewClick(Sender: TObject);
begin
  try
    bbView.Enabled := false;
    frmCadDevolucaoCompra := TfrmCadDevolucaoCompra.Create(Application);
    frmCadDevolucaoCompra.qryDevolucao.Close;
    frmCadDevolucaoCompra.qryDevolucao.Params[0].Value :=
      qryDevolucaoCODIGO.Value;
    frmCadDevolucaoCompra.qryDevolucao.Open;
    frmCadDevolucaoCompra.btnFinalizar.Enabled := false;
    frmCadDevolucaoCompra.btnGravar.Enabled := false;
    frmCadDevolucaoCompra.btnSair.Enabled := true;
    frmCadDevolucaoCompra.DBGridEh1.ReadOnly := true;
    frmCadDevolucaoCompra.Panel2.Enabled := false;
    frmCadDevolucaoCompra.Panel3.Enabled := false;
    frmCadDevolucaoCompra.ShowModal;
  finally
    frmCadDevolucaoCompra.Release;
    bbView.Enabled := true;
  end;

end;

procedure TfrmDevolucaoCompra.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.50);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.10);
end;

procedure TfrmDevolucaoCompra.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmDevolucaoCompra.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmDevolucaoCompra.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'NºCompra';
  DBGrid1.Columns[2].Title.Caption := 'Data';
  DBGrid1.Columns[3].Title.Caption := 'Forncedor';
  DBGrid1.Columns[4].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  localiza;

end;

procedure TfrmDevolucaoCompra.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmDevolucaoCompra.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryDevolucao.Prior;
  if Key = VK_DOWN then
    qryDevolucao.Next;
end;

procedure TfrmDevolucaoCompra.edtLocKeyPress(Sender: TObject; var Key: Char);
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



procedure TfrmDevolucaoCompra.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmDevolucaoCompra.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
end;

procedure TfrmDevolucaoCompra.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmDevolucaoCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmDevolucaoCompra.FormShow(Sender: TObject);
begin

  tamanho;

  maskInicio.EditText := datetostr(StartOfTheMonth(DATE));
  maskFim.EditText := datetostr(DATE);
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TfrmDevolucaoCompra.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro1 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  vSql := ' select dm.*, pes.razao from DEVOLUCA_COMPRA_M dm' +
    ' left join pessoa pes on pes.codigo=dm.fk_fornecedor' + ' /*where*/';

  filtro := ' WHERE DM.FK_empresa=' + dados.qryEmpresaCODIGO.AsString;

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
          filtro := filtro + ' and DM.NUMERO_COMPRA=' + edtLoc.Text;
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
      ordem := ' order by dm.numero_compra ' + vOrdem;
    2:
      ordem := ' order by dm.data ' + vOrdem;
    3:
      ordem := ' order by pes.razao ' + vOrdem;
    4:
      ordem := ' order by dm.total ' + vOrdem;

  end;

  qryDevolucao.Close;
  qryDevolucao.SQL.Text := vSql;
  qryDevolucao.SQL.Text := StringReplace(qryDevolucao.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryDevolucao.Open;
end;

procedure TfrmDevolucaoCompra.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

end.
