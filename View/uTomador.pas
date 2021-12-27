unit uTomador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  DBCtrlsEh, frxClass, frxDBSet, frxExportPDF, ACBrBase, ACBrEnterTab, DBGridEh,
  DBLookupEh, frxExportBaseDialog, ACBrSocket, ACBrCEP, frxExportXLS,
  JvComponentBase, JvEnterTab;

type
  TfrmTomador = class(TForm)
    dsTomador: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBTomador: TfrxDBDataset;
    qryTomador: TFDQuery;
    qryTomadorCODIGO: TIntegerField;
    qryTomadorRAZAO: TStringField;
    qryTomadorFANTASIA: TStringField;
    qryTomadorFONE: TStringField;
    qryTomadorENDERECO: TStringField;
    qryTomadorNUMERO: TStringField;
    qryTomadorBAIRRO: TStringField;
    qryTomadorCODMUN: TIntegerField;
    qryTomadorMUNICIPIO: TStringField;
    qryTomadorUF: TStringField;
    qryTomadorCEP: TStringField;
    qryTomadorFKEMPRESA: TIntegerField;
    qryTomadorTIPO: TStringField;
    qryTomadorCNPJ: TStringField;
    qryTomadorIE: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit22: TDBEdit;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit7: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    BitBtn2: TBitBtn;
    dsCidade: TDataSource;
    BitBtn1: TBitBtn;
    ACBrCEP1: TACBrCEP;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryTomadorNewRecord(DataSet: TDataSet);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    idx: Integer;
    vOrdem: string;
    procedure localiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTomador: TfrmTomador;

implementation

{$R *.dfm}

uses Udados, uRotinasComuns;

procedure TfrmTomador.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      qryTomadorENDERECO.Value := UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      qryTomadorBAIRRO.Value := UpperCase(Bairro);
      qryTomadorMUNICIPIO.Value := UpperCase(Municipio);
      qryTomadorCODMUN.AsString := IBGE_Municipio;
      qryTomadorUF.AsString := UpperCase(UF);
      qryTomadorCODMUN.Value := dados.BuscaCodigoIbge(qryTomadorMUNICIPIO.Value,
        qryTomadorUF.Value);
    end;
  end;
end;

procedure TfrmTomador.bbAlterarClick(Sender: TObject);
begin
  if qryTomador.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  qryTomador.edit;
  Panel1.Enabled := true;
  DBEdit1.SetFocus;

end;

procedure TfrmTomador.bbNovoClick(Sender: TObject);
begin

  PageControl1.ActivePage := Cadastro;

  qryTomador.Insert;
  Panel1.Enabled := true;
  DBEdit1.SetFocus;

end;

procedure TfrmTomador.BitBtn1Click(Sender: TObject);
begin
  if qryTomadorTIPO.Value = 'JURÍDICA' then
  begin
    try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(DBEdit8.text));
      qryTomadorRAZAO.Value := UpperCase(dmrotinas.Pessoa.razao);
      qryTomadorFANTASIA.Value := UpperCase(dmrotinas.Pessoa.fantasia);
      qryTomadorENDERECO.Value := UpperCase(dmrotinas.Pessoa.Logradouro);
      qryTomadorNUMERO.Value := UpperCase(dmrotinas.Pessoa.numero);
      qryTomadorBAIRRO.Value := UpperCase(dmrotinas.Pessoa.Bairro);
      qryTomadorMUNICIPIO.Value := UpperCase(dmrotinas.Pessoa.Municipio);
      qryTomadorUF.Value := UpperCase(dmrotinas.Pessoa.UF);
      qryTomadorCEP.Value := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      qryTomadorCODMUN.Value := dados.BuscaCodigoIbge(qryTomadorMUNICIPIO.Value,
        qryTomadorUF.Value);
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

  end
  else
    ShowMessage('Não é possivel buscar informações de pessoas físicas!');
end;

procedure TfrmTomador.BitBtn2Click(Sender: TObject);
begin
  try
    try
      ACBrCEP1.BuscarPorCEP(DBEdit5.EditText);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    BitBtn2.Enabled := true;
  end;
end;

procedure TfrmTomador.DBComboBox1Exit(Sender: TObject);
begin
  if qryTomador.State in dsEditModes then
  begin
    qryTomadorCNPJ.EditMask := '###.###.###-##;1;';
    if qryTomadorTIPO.Value = 'JURÍDICA' then
      qryTomadorCNPJ.EditMask := '##.###.###/####-##;1;';
  end;
end;

procedure TfrmTomador.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn2.Click;

end;

procedure TfrmTomador.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn1.Click;
end;

procedure TfrmTomador.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmTomador.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmTomador.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Tomador';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Clear;

  edtLoc.SetFocus;

  localiza;
end;

procedure TfrmTomador.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmTomador.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryTomador.Prior;
  if Key = VK_DOWN then
    qryTomador.Next;
end;

procedure TfrmTomador.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmTomador.FormCreate(Sender: TObject);
begin
  vOrdem := 'asc';
end;


procedure TfrmTomador.FormKeyDown(Sender: TObject; var Key: Word;
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
    if Key = vk_f5 then
      btnGravarClick(self);

    if Key = VK_ESCAPE then
      if Application.messageBox
        ('Tem Certeza de que deseja sair do cadastro de Tomador?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelarClick(self);
      end;

  end;

end;

procedure TfrmTomador.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
  dados.qryCidade.close;
  dados.qryCidade.Open;
end;

procedure TfrmTomador.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  qryTomador.SQL.text := 'select * from tomador';

  if trim(edtLoc.text) <> '' then
    case idx of
      0:
        filtro := ' where codigo like ' + QuotedStr(edtLoc.text + '%');
      1:
        filtro := ' where Razao like ' + QuotedStr(edtLoc.text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by Razao ' + vOrdem;
  end;

  qryTomador.close;
  qryTomador.SQL.text := StringReplace(qryTomador.SQL.text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryTomador.Open;

end;

procedure TfrmTomador.qryTomadorNewRecord(DataSet: TDataSet);
begin
  qryTomadorCODIGO.Value := dados.Numerador('TOMADOR', 'CODIGO', 'N', '', '');
  qryTomadorTIPO.Value := 'JURÍDICA';
  qryTomadorCODMUN.Value := dados.qryEmpresaID_CIDADE.Value;
  qryTomadorMUNICIPIO.Value := dados.qryEmpresaCIDADE.Value;
  qryTomadorCEP.Value := dados.qryEmpresaCEP.Value;
  qryTomadorFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
end;

procedure TfrmTomador.btnCancelarClick(Sender: TObject);
begin
  if qryTomador.State in [dsInsert, dsEdit] then
    qryTomador.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmTomador.btnGravarClick(Sender: TObject);
begin
  if qryTomador.State in [dsInsert, dsEdit] then
  begin

    if trim(qryTomadorRAZAO.Value) = '' then
    begin
      ShowMessage('Informe a Razão Social do Tomador !');
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(qryTomadorFANTASIA.Value) = '' then
    begin
      ShowMessage('Informe a Fantasia do Tomador !');
      DBEdit2.SetFocus;
      exit;
    end;

    qryTomador.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

procedure TfrmTomador.btnImpClick(Sender: TObject);
begin
  try

    if qryTomador.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    btnImp.Enabled := False;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelTomador.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
