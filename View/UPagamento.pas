unit UPagamento;

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
  DBCtrlsEh, frxClass, frxDBSet, frxExportPDF, ACBrBase, ACBrEnterTab, DBGridEh,
  DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmFPG = class(TForm)
    dsFpg: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDBFPG: TfrxDBDataset;
    btnImp: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    bbAlterar: TSpeedButton;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    qryContas: TFDQuery;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label4: TLabel;
    qryContasCODIGO: TIntegerField;
    qryContasDESCRICAO: TStringField;
    Label6: TLabel;
    dsContas: TDataSource;
    DBComboBoxEh1: TDBComboBoxEh;
    bbNovo: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    qryPessoa: TFDQuery;
    dsPessoa: TDataSource;
    qryPessoaCODIGO: TIntegerField;
    qryPessoaRAZAO: TStringField;
    qryPessoaCLI: TStringField;
    DBCheckBox1: TDBCheckBox;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qryBandeira: TFDQuery;
    dsBandeira: TDataSource;
    qryBandeiraCODIGO: TIntegerField;
    qryBandeiraDESCRICAO: TStringField;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure DBComboBoxEh1Change(Sender: TObject);
    procedure dsFpgDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    idx: Integer;
    vOrdem: String;
    procedure localiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFPG: TfrmFPG;

implementation

{$R *.dfm}

uses Udados;


procedure TfrmFPG.bbAlterarClick(Sender: TObject);
begin
  if dados.qryFPG.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  dados.qryFPG.edit;
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmFPG.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  dados.qryFPG.Insert;
  dados.qryFPGCODIGO.Value := dados.Numerador('FORMA_PAGAMENTO', 'CODIGO',
    'N', '', '');
  dados.qryFPGATIVO.Value := 'S';
  dados.qryFPGGERACR.Value := 'N';
  dados.qryFPGGERACH.Value := 'N';
  dados.qryFPGECARTAO.Value := 'N';
  dados.qryFPGUSAVD.Value := 'N';
  dados.qryFPGUSACR.Value := 'N';
  dados.qryFPGPARCELAS.Value := 0;
  dados.qryFPGTAXA.Value := 0;
  dados.qryFPGDIAS.Value := 0;
  dados.qryFPGINTERVALO.Value := 0;
  dados.qryFPGENTRADA.Value := 0;
  dados.qryFPGTIPO.Value := 'C';
  Panel1.Enabled := true;
  DBEdit2.SetFocus;

end;

procedure TfrmFPG.DBComboBoxEh1Change(Sender: TObject);
begin
  if dsFpg.DataSet.State in dsEditModes then
  begin

    if DBComboBoxEh1.Text = 'DINHEIRO' then
    begin
      dados.qryFPGGERACR.Value := 'X';
      dados.qryFPGFK_PESSOA.Value := 0;
    end;

    if (DBComboBoxEh1.Text = 'CRÉDITO LOJA') or (DBComboBoxEh1.Text = 'CHEQUE')
      or (DBComboBoxEh1.Text = 'BOLETO BANCÁRIO') then
    begin
      dados.qryFPGFK_PESSOA.Value := 0;
      dados.qryFPGGERACR.Value := 'R';
    end;

    if (DBComboBoxEh1.Text = 'CARTÃO DE CRÉDITO') or
      (DBComboBoxEh1.Text = 'CARTÃO DE DÉBITO') then
    begin
      dados.qryFPGGERACR.Value := 'R';
    end;

    if DBComboBoxEh1.Text = 'DEPÓSITO' then
    begin
      dados.qryFPGFK_PESSOA.Value := 0;
      dados.qryFPGGERACR.Value := 'D';
    end;

    if DBComboBoxEh1.Text = 'NOTINHA' then
    begin
      dados.qryFPGFK_PESSOA.Value := 0;
      dados.qryFPGGERACR.Value := 'C';
    end;

  end;
end;

procedure TfrmFPG.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmFPG.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmFPG.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Descrição';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Clear;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmFPG.dsFpgDataChange(Sender: TObject; Field: TField);
begin
  if DBComboBoxEh1.Text = 'DINHEIRO' then
  begin
    DBRadioGroup1.ReadOnly := true;
    DBLookupComboboxEh2.Enabled := false;
  end;

  if (DBComboBoxEh1.Text = 'CRÉDITO LOJA') or (DBComboBoxEh1.Text = 'CHEQUE') or
    (DBComboBoxEh1.Text = 'BOLETO BANCÁRIO') then
  begin
    DBLookupComboboxEh2.Enabled := false;
    DBRadioGroup1.ReadOnly := true;
  end;

  if (DBComboBoxEh1.Text = 'CARTÃO DE CRÉDITO') or
    (DBComboBoxEh1.Text = 'CARTÃO DE DÉBITO') then
  begin
    DBLookupComboboxEh2.Enabled := true;
    DBRadioGroup1.ReadOnly := true;
  end;

  if DBComboBoxEh1.Text = 'DEPÓSITO' then
  begin
    DBLookupComboboxEh2.Enabled := false;
    DBRadioGroup1.ReadOnly := true;
  end;

  if (DBComboBoxEh1.Text = 'OUTROS') then
  begin
    DBLookupComboboxEh2.Enabled := true;
    DBRadioGroup1.ReadOnly := false;
  end;

end;

procedure TfrmFPG.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmFPG.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryFPG.Prior;
  if Key = VK_DOWN then
    dados.qryFPG.Next;
end;

procedure TfrmFPG.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmFPG.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmFPG.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
end;

procedure TfrmFPG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  if PageControl1.ActivePageIndex = 0 then
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
    if Key = vk_f6 then
    begin
      edtLoc.SetFocus;
      abort;
    end;
  end
  else
  begin
    if Key = VK_F5 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then
      btnCancelarClick(self);

  end;

end;

procedure TfrmFPG.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  idx := 0;

  qryContas.SQL.Text :=
    ' select codigo, descricao from contas where tipo<>''S'' order by descricao';
  qryContas.close;
  qryContas.Open;

  qryPessoa.close;
  qryPessoa.Open;

  qryBandeira.close;
  qryBandeira.Open;

  DBGrid1TitleClick(DBGrid1.Columns[idx]);

  edtLoc.SetFocus;

end;

procedure TfrmFPG.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  dados.qryFPG.SQL.Text := 'select * from FORMA_PAGAMENTO /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := ' where codigo=' + edtLoc.Text;
      1:
        filtro := ' where descricao like ' + QuotedStr(edtLoc.Text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
  end;

  dados.qryFPG.close;
  dados.qryFPG.SQL.Text := StringReplace(dados.qryFPG.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  dados.qryFPG.Open;
end;

procedure TfrmFPG.btnCancelarClick(Sender: TObject);
begin
  if dados.qryFPG.State in [dsInsert, dsEdit] then
    dados.qryFPG.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmFPG.btnGravarClick(Sender: TObject);
begin
  if dados.qryFPG.State in [dsInsert, dsEdit] then
  begin

    DBEdit2.SetFocus;

    if trim(DBEdit2.EditText) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(dados.qryFPGGERACR.Value) = 'X' then
    begin
      if dados.qryFPGFKCONTADESTINO.IsNull then
      begin
        ShowMessage('Informe a Conta de Destino!');
        DBComboBoxEh1.SetFocus;
        exit;
      end;
    end;

    if (trim(dados.qryFPGTIPO.Value) = '') or (dados.qryFPGTIPO.IsNull) then
    begin
      ShowMessage('Digite o Tipo de Pagamento!');
      DBEdit2.SetFocus;
      exit;
    end;

    dados.qryFPG.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmFPG.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    if dados.qryFPG.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelFPG.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
