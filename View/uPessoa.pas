unit uPessoa;

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
  frxExportBaseDialog, frxExportXLS;

type
  TfrmPessoas = class(TForm)
    dsClientes: TDataSource;
    TabSet2: TTabSet;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    frxDBClientes: TfrxDBDataset;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    btnImp: TSpeedButton;
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    btnAtualizar: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
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
    procedure TabSet1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    procedure ConsumidorFinal;
    { Private declarations }
  public
    idx: Integer;
    vOrdem: String;
    vSql: String;
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

{$R *.dfm}

uses Udados, uCadPessoa;

procedure TfrmPessoas.bbAlterarClick(Sender: TObject);
begin

  if bbAlterar.Visible = false then
    exit;

  if dados.qryPessoas.IsEmpty then
    exit;
  try
    bbAlterar.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    dados.qryPessoas.edit;
    frmCadPessoa.ShowModal;
  finally
    bbAlterar.Enabled := true;
    frmCadPessoa.Release;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmPessoas.bbNovoClick(Sender: TObject);
begin
  if bbNovo.Visible = false then
    exit;

  try
    bbNovo.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    dados.qryPessoas.Insert;
    dados.qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
      'N', '', '');
    dados.qryPessoasATIVO.Value := 'S';
    dados.qryPessoasTIPO.Value := 'FÍSICA';
    dados.qryPessoasCLI.Value := 'S';
    dados.qryPessoasEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryPessoasFORN.Value := 'N';
    dados.qryPessoasFAB.Value := 'N';
    dados.qryPessoasIE.Value := '';
    dados.qryPessoasFUN.Value := 'N';
    dados.qryPessoasADM.Value := 'N';
    dados.qryPessoasLIMITE.Value := 0;
    dados.qryPessoasISENTO.Value := '2';
    dados.qryPessoasREGIME_TRIBUTARIO.Value := 'SIMPLES';
    dados.qryPessoasSALARIO.Value := 0;
    dados.qryPessoasCCF.Value := 'N';
    dados.qryPessoasSPC.Value := 'N';
    dados.qryPessoasTRAN.Value := 'N';
    dados.qryPessoasFATURA.Value := 'N';
    dados.qryPessoasCHEQUE.Value := 'N';
    dados.qryPessoasTECNICO.Value := 'N';
    dados.qryPessoasATENDENTE.Value := 'N';
    dados.qryPessoasUF.Value := dados.qryEmpresaUF.Value;
    dados.qryPessoasCODMUN.Value := dados.qryEmpresaID_CIDADE.Value;
    dados.qryPessoasMUNICIPIO.Value := dados.qryEmpresaCIDADE.Value;
    dados.qryPessoasDT_CADASTRO.Value := date;
    frmCadPessoa.ShowModal;
  finally
    bbNovo.Enabled := true;
    frmCadPessoa.Release;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmPessoas.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qryPessoasCODIGO.Value;
    localiza;
    dados.qryPessoas.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;

end;

procedure TfrmPessoas.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    if dados.qryPessoas.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelPessoas.fr3');
    frxReport.ShowReport;
  finally

    btnImp.Enabled := true;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmPessoas.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmPessoas.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmPessoas.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Nome/Razão';
  DBGrid1.Columns[2].Title.Caption := 'Apelido/Fantasia';
  DBGrid1.Columns[3].Title.Caption := 'CPF/CNPJ';
  DBGrid1.Columns[4].Title.Caption := 'RG/IE';
  DBGrid1.Columns[5].Title.Caption := 'Endereço';
  DBGrid1.Columns[6].Title.Caption := 'Cidade';
  DBGrid1.Columns[7].Title.Caption := 'UF';
  DBGrid1.Columns[8].Title.Caption := 'Recebimento';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmPessoas.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPessoas.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryPessoas.Prior;
  if Key = VK_DOWN then
    dados.qryPessoas.Next;
end;

procedure TfrmPessoas.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;


procedure TfrmPessoas.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmPessoas.FormKeyDown(Sender: TObject; var Key: Word;
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
    btnAtualizarClick(self);
    abort;
  end;
  if Key = vk_f6 then
  begin
    edtLoc.SetFocus;
    abort;
  end;
end;

procedure TfrmPessoas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmPessoas.ConsumidorFinal;
begin
  if dados.qryPessoas.IsEmpty then
  begin
    dados.qryPessoas.Insert;
    dados.qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
      'N', '', '');
    dados.qryPessoasATIVO.Value := 'S';
    dados.qryPessoasCLI.Value := 'S';
    dados.qryPessoasTIPO.Value := 'FÍSICA';
    dados.qryPessoasRAZAO.Value := 'CONSUMIDOR FINAL';
    dados.qryPessoasFANTASIA.Value := 'CONSUMIDOR FINAL';
    dados.qryPessoasEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryPessoasENDERECO.Value := '';
    dados.qryPessoasBAIRRO.Value := '';
    dados.qryPessoasNUMERO.Value := '';
    dados.qryPessoasCEP.Value := '';
    dados.qryPessoasFORN.Value := 'N';
    dados.qryPessoasFAB.Value := 'N';
    dados.qryPessoasCNPJ.Value := ' ';
    dados.qryPessoasIE.Value := ' ';
    dados.qryPessoasFUN.Value := 'N';
    dados.qryPessoasADM.Value := 'N';
    dados.qryPessoasLIMITE.Value := 0;
    dados.qryPessoasISENTO.Value := '2';
    dados.qryPessoasSALARIO.Value := 0;
    dados.qryPessoasCCF.Value := 'N';
    dados.qryPessoasSPC.Value := 'N';
    dados.qryPessoasTRAN.Value := 'N';
    dados.qryPessoasFATURA.Value := 'N';
    dados.qryPessoasCHEQUE.Value := 'N';
    dados.qryPessoasUF.Value := dados.qryEmpresaUF.Value;
    dados.qryPessoasCODMUN.Value := dados.qryEmpresaID_CIDADE.Value;
    dados.qryPessoasMUNICIPIO.Value := dados.qryEmpresaCIDADE.Value;
    dados.qryPessoas.Post;
  end;

end;

procedure TfrmPessoas.FormShow(Sender: TObject);
begin
  idx := 0;
  vOrdem := ' ASC';
  edtLoc.SetFocus;
  tamanho;
  DBGrid1TitleClick(DBGrid1.Columns[idx]);
  if dados.qryPessoas.Active then
    ConsumidorFinal;
end;

procedure TfrmPessoas.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := '';
  if edtLoc.Text <> '' then
    filtro := ' | FILTRO:' + edtLoc.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := 'TIPO:' + TabSet1.Tabs.Strings[TabSet1.TabIndex] + ' | SITUAÇÃO:' +
      TabSet2.Tabs.Strings[TabSet2.TabIndex] + filtro + ' | ORDENADO: ' +
      copy(DBGrid1.Columns[idx].Title.Caption, 3, 100000);
  end;

end;

procedure TfrmPessoas.localiza;
var
  parte, filtro, filtro1, filtro2, ordem: string;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      filtro := '';
      filtro1 := '';
      filtro2 := '';
      ordem := '';
      parte := '';
      if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        parte := '%';

      vSql := 'select * from PESSOA where CODIGO>0 /*where*/  ';

      if (trim(edtLoc.Text) <> '') then
        case idx of
          0:
            filtro := filtro + ' and CODIGO=' + edtLoc.Text;
          1:
            filtro := filtro + ' and RAZAO LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          2:
            filtro := filtro + ' and FANTASIA LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          3:
            filtro := filtro + ' and CNPJ LIKE ' + QuotedStr(edtLoc.Text + '%');
          4:
            filtro := filtro + ' and IE LIKE ' + QuotedStr(edtLoc.Text + '%');
          5:
            filtro := filtro + ' and ENDERECO LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');

          6:
            filtro := filtro + ' and MUNICIPIO LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          7:
            filtro := filtro + ' and UF LIKE ' + QuotedStr(edtLoc.Text + '%');
          8:
            filtro := filtro + ' and TIPO_RECEBIMENTO LIKE ' +
              QuotedStr(edtLoc.Text + '%');
        end;

      case TabSet1.TabIndex of
        0:
          filtro1 := ' and cli=''S''';
        1:
          filtro1 := ' and fun=''S''';
        2:
          filtro1 := ' and forn=''S''';
        3:
          filtro1 := ' and adm=''S''';
        4:
          filtro1 := ' and parc=''S''';

      end;
      case TabSet2.TabIndex of
        0:
          filtro2 := ' and ATIVO=''S''';
        1:
          filtro2 := ' and ATIVO=''N''';
      end;

      case idx of
        0:
          ordem := ' order by CODIGO' + vOrdem;
        1:
          ordem := ' order by RAZAO' + vOrdem;
        2:
          ordem := ' order by FANTASIA' + vOrdem;
        3:
          ordem := ' order by CNPJ' + vOrdem;
        4:
          ordem := ' order by IE' + vOrdem;
        5:
          ordem := ' order by ENDERECO' + vOrdem;
        6:
          ordem := ' order by MUNICIPIO' + vOrdem;
        7:
          ordem := ' order by UF' + vOrdem;
        8:
          ordem := ' order by TIPO_RECEBIMENTO' + vOrdem;

      end;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dados.qryPessoas.Close;
          dados.qryPessoas.SQL.Text := vSql;
          dados.qryPessoas.SQL.Text := StringReplace(dados.qryPessoas.SQL.Text,
            '/*where*/', filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
          dados.qryPessoas.Open;
        end);

    end).Start;

end;

procedure TfrmPessoas.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPessoas.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPessoas.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.25);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.21);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.25);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.19);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.02);
end;

procedure TfrmPessoas.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
