unit uTransportador;

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
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxExportPDF, frxDBSet,
  DBGridEh, DBCtrlsEh, DBLookupEh, frxExportBaseDialog;

type
  TfrmTransportadora = class(TForm)
    dsClientes: TDataSource;
    DBGrid1: TDBGrid;
    TabSet2: TTabSet;
    Panel2: TPanel;
    frxDBClientes: TfrxDBDataset;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    btnImp: TSpeedButton;
    btnAtualizar: TSpeedButton;
    procedure FormShow(Sender: TObject);
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
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  frmTransportadora: TfrmTransportadora;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadTransp;


procedure TfrmTransportadora.bbAlterarClick(Sender: TObject);
begin
  if dados.qryTransp.IsEmpty then
    exit;
  try
    bbAlterar.Enabled := false;
    FrmCadTransp := TFrmCadTransp.Create(Application);
    dados.qryTransp.edit;
    FrmCadTransp.ShowModal;
  finally
    FrmCadTransp.Release;
    bbAlterar.Enabled := true;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmTransportadora.bbNovoClick(Sender: TObject);
begin
  try
    bbNovo.Enabled := false;
    FrmCadTransp := TFrmCadTransp.Create(Application);
    dados.qryTransp.Insert;
    dados.qryTranspCODIGO.Value := dados.Numerador('TRANSPORTADORA', 'CODIGO',
      'N', '', '');
    dados.qryTranspATIVO.Value := 'S';
    dados.qryTranspEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryTranspUF.Value := dados.qryEmpresaUF.Value;
    dados.qryTranspCOD_CIDADE.Value := dados.qryEmpresaID_CIDADE.Value;
    dados.qryTranspCIDADE.Value := dados.qryEmpresaCIDADE.Value;
    FrmCadTransp.ShowModal;
  finally
    bbNovo.Enabled := true;
    FrmCadTransp.Release;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmTransportadora.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qryTranspCODIGO.Value;
    localiza;
    dados.qryTransp.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmTransportadora.btnImpClick(Sender: TObject);
begin
  try

    if dados.qryTransp.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelTransportadora.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmTransportadora.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmTransportadora.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmTransportadora.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;
  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Nome/Razão';
  DBGrid1.Columns[2].Title.Caption := 'Apelido/Fantasia';
  DBGrid1.Columns[3].Title.Caption := 'CPF/CNPJ';
  DBGrid1.Columns[4].Title.Caption := 'RG/IE';
  DBGrid1.Columns[5].Title.Caption := 'Cidade';
  DBGrid1.Columns[6].Title.Caption := 'UF';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  GroupBox1.Caption := 'F5 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmTransportadora.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmTransportadora.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryTransp.Prior;
  if Key = VK_DOWN then
    dados.qryTransp.Next;
end;

procedure TfrmTransportadora.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmTransportadora.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmTransportadora.FormKeyDown(Sender: TObject; var Key: Word;
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
    btnImpClick(self);
    abort;
  end;
  if Key = vk_f5 then
  begin
    btnAtualizar.Click;
    abort;
  end;
  if Key = vk_f6 then
  begin
    edtLoc.SetFocus;
    abort;
  end;
end;

procedure TfrmTransportadora.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmTransportadora.FormShow(Sender: TObject);
begin
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
  tamanho;
end;

procedure TfrmTransportadora.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := '';
  if edtLoc.Text <> '' then
    filtro := ' | FILTRO:' + edtLoc.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := ' | SITUAÇÃO:' + TabSet2.Tabs.Strings[TabSet2.TabIndex] + filtro +
      ' | ORDENADO: ' + copy(DBGrid1.Columns[idx].Title.Caption, 3, 100000);
  end;

end;

procedure TfrmTransportadora.localiza;
var
  parte, filtro, filtro1, filtro2, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  filtro2 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  vSql := 'select * from TRANSPORTADORA where codigo>=0 /*where*/  ';

  filtro := ' and empresa=' + dados.qryEmpresaCODIGO.AsString;

  if (trim(edtLoc.Text) <> '') then
    case idx of
      0:
        filtro := filtro + ' and CODIGO=' + edtLoc.Text;
      1:
        filtro := filtro + ' and NOME LIKE ' +
          QuotedStr(parte + edtLoc.Text + '%');
      2:
        filtro := filtro + ' and APELIDO LIKE ' +
          QuotedStr(parte + edtLoc.Text + '%');
      3:
        filtro := filtro + ' and CNPJ LIKE ' + QuotedStr(edtLoc.Text + '%');
      4:
        filtro := filtro + ' and IE LIKE ' + QuotedStr(edtLoc.Text + '%');
      5:
        filtro := filtro + ' and CIDADE LIKE ' +
          QuotedStr(parte + edtLoc.Text + '%');
      6:
        filtro := filtro + ' and UF LIKE ' + QuotedStr(edtLoc.Text + '%');
    end;

  case TabSet2.TabIndex of
    1:
      filtro2 := ' and ATIVO=''S''';
    2:
      filtro2 := ' and ATIVO=''N''';
  end;

  case idx of
    0:
      ordem := ' order by CODIGO';
    1:
      ordem := ' order by NOME';
    2:
      ordem := ' order by APELIDO';
    3:
      ordem := ' order by CNPJ';
    4:
      ordem := ' order by IE';
    5:
      ordem := ' order by CIDADE';
    6:
      ordem := ' order by UF';

  end;

  dados.qryTransp.Close;
  dados.qryTransp.SQL.Text := vSql;
  dados.qryTransp.SQL.Text := StringReplace(dados.qryTransp.SQL.Text,
    '/*where*/', filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  dados.qryTransp.Open;
end;

procedure TfrmTransportadora.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmTransportadora.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.25);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.21);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.19);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.04);
end;

procedure TfrmTransportadora.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
