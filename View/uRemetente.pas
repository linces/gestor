unit uRemetente;

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
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF,
  frxExportBaseDialog, DBGridEh, DBLookupEh, ACBrSocket, ACBrCEP, ACBrValidador,
  frxExportXLS, JvComponentBase, JvEnterTab;

type
  TfrmRemetente = class(TForm)
    dsRemetente: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBRemetente: TfrxDBDataset;
    dsEmpresa: TDataSource;
    qryRemetente: TFDQuery;
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
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit7: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    BitBtn2: TBitBtn;
    ACBrCEP1: TACBrCEP;
    qryRemetenteCODIGO: TIntegerField;
    qryRemetenteNOME: TStringField;
    qryRemetenteENDERECO: TStringField;
    qryRemetenteBAIRRO: TStringField;
    qryRemetenteID_CIDADE: TIntegerField;
    qryRemetenteCIDADE: TStringField;
    qryRemetenteCEP: TStringField;
    qryRemetenteUF: TStringField;
    qryRemetentePESSOA: TStringField;
    qryRemetenteCNPJ: TStringField;
    qryRemetenteIE: TStringField;
    qryRemetenteFONE: TStringField;
    qryRemetenteFK_EMPRESA: TIntegerField;
    qryRemetenteFK_USUARIO: TIntegerField;
    qryRemetenteATIVO: TIntegerField;
    qryRemetenteNUMERO: TStringField;
    dsCidade: TDataSource;
    ACBrValidador1: TACBrValidador;
    qryRemetenteVIRTUAL_EMPRESA: TStringField;
    DBCheckBox1: TDBCheckBox;
    qryRemetenteCONTRIBUINTE: TStringField;
    BitBtn1: TBitBtn;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    btnImp: TSpeedButton;
    bbNovo: TSpeedButton;
    bbAlterar: TSpeedButton;
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
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    vOrdem: String;
    { Private declarations }
  public
    idx: Integer;
    procedure localiza;
    { Public declarations }
  end;

var
  frmRemetente: TfrmRemetente;

implementation

{$R *.dfm}

uses Udados, uRotinasComuns;


procedure TfrmRemetente.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      qryRemetenteENDERECO.Value :=
        UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      qryRemetenteBAIRRO.Value := UpperCase(Bairro);
      qryRemetenteCIDADE.Value := UpperCase(Municipio);
      qryRemetenteID_CIDADE.AsString := IBGE_Municipio;
      qryRemetenteUF.AsString := UpperCase(UF);
      qryRemetenteID_CIDADE.Value := dados.BuscaCodigoIbge
        (qryRemetenteCIDADE.Value, qryRemetenteUF.Value);
    end;
  end;

end;

procedure TfrmRemetente.bbAlterarClick(Sender: TObject);
begin

  if qryRemetente.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  qryRemetente.edit;
  Panel1.Enabled := true;
  DBComboBox1.SetFocus;

end;

procedure TfrmRemetente.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  qryRemetente.Insert;
  qryRemetenteCODIGO.Value := dados.Numerador('CTE_REMETENTE', 'CODIGO',
    'N', '', '');
  qryRemetenteATIVO.Value := 1;
  qryRemetenteFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryRemetenteFK_USUARIO.Value := dados.idUsuario;
  Panel1.Enabled := true;
  DBComboBox1.SetFocus;

end;

procedure TfrmRemetente.BitBtn1Click(Sender: TObject);
begin
  if qryRemetentePESSOA.Value = 'JURÍDICA' then
  begin
    try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(DBEdit8.text));
      qryRemetenteNOME.Value := UpperCase(dmrotinas.Pessoa.razao);
      qryRemetenteENDERECO.Value := UpperCase(dmrotinas.Pessoa.Logradouro);
      qryRemetenteNUMERO.Value := UpperCase(dmrotinas.Pessoa.numero);
      qryRemetenteBAIRRO.Value := UpperCase(dmrotinas.Pessoa.Bairro);
      qryRemetenteCIDADE.Value := UpperCase(dmrotinas.Pessoa.Municipio);
      qryRemetenteUF.Value := UpperCase(dmrotinas.Pessoa.UF);
      qryRemetenteCEP.Value := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      qryRemetenteID_CIDADE.Value := dados.BuscaCodigoIbge
        (qryRemetenteCIDADE.Value, qryRemetenteUF.Value);
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

  end
  else
    ShowMessage('Não é possivel buscar informações de pessoas físicas!');
end;

procedure TfrmRemetente.BitBtn2Click(Sender: TObject);
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

procedure TfrmRemetente.DBComboBox1Exit(Sender: TObject);
begin
  if qryRemetente.State in dsEditModes then
  begin
    qryRemetenteCNPJ.EditMask := '###.###.###-##;1;';
    if qryRemetentePESSOA.Value = 'JURÍDICA' then
      qryRemetenteCNPJ.EditMask := '##.###.###/####-##;1;';
  end;
end;

procedure TfrmRemetente.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn2Click(self);
end;

procedure TfrmRemetente.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn1Click(self);
end;

procedure TfrmRemetente.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmRemetente.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmRemetente.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Nome';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.Clear;

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmRemetente.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  if qryRemetente.State in dsEditModes then
    qryRemetenteCIDADE.Value := dados.qryCidadeDESCRICAO.Value;
end;

procedure TfrmRemetente.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmRemetente.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryRemetente.Prior;
  if Key = VK_DOWN then
    qryRemetente.Next;
end;

procedure TfrmRemetente.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmRemetente.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmRemetente.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
  dados.qryCidade.close;
  dados.qryCidade.Open;

end;

procedure TfrmRemetente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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
      if Application.messageBox
        ('Tem Certeza de que deseja sair do cadastro de Remetente?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelarClick(self);
      end;
  end;

end;

procedure TfrmRemetente.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmRemetente.localiza;
var
  filtro, ordem: string;
begin
  filtro := '';
  ordem := '';

  qryRemetente.SQL.text :=
    'select *   from CTE_REMETENTE where fk_empresa=:id /*where*/';

  if trim(edtLoc.text) <> '' then
    case idx of
      0:
        filtro := ' and codigo=' + edtLoc.text;
      1:
        filtro := ' and nome like ' + QuotedStr(edtLoc.text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by nome ' + vOrdem;
  end;
  qryRemetente.close;
  qryRemetente.SQL.text := StringReplace(qryRemetente.SQL.text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryRemetente.ParamByName('id').Value := dados.qryEmpresaCODIGO.Value;
  qryRemetente.Open;
end;

procedure TfrmRemetente.btnCancelarClick(Sender: TObject);
begin
  if qryRemetente.State in dsEditModes then
    qryRemetente.Cancel;
  PageControl1.ActivePage := Lista;
end;

procedure TfrmRemetente.btnGravarClick(Sender: TObject);
begin
  if qryRemetente.State in [dsInsert, dsEdit] then
  begin

    DBEdit8.SetFocus;

    if qryRemetentePESSOA.IsNull then
    begin
      ShowMessage('Digite o Tipo de Pessoa!');
      DBComboBox1.SetFocus;
      exit;
    end;

    if trim(qryRemetenteCNPJ.Value) = '' then
    begin
      ShowMessage('Digite CNPJ!');
      DBEdit8.SetFocus;
      exit;
    end;

    if trim(qryRemetenteNOME.Value) = '' then
    begin
      ShowMessage('Digite NOME!');
      DBEdit2.SetFocus;
      exit;
    end;

    if qryRemetentePESSOA.Value = 'FÍSICA' then
    begin
      if qryRemetenteCNPJ.Value <> '000.000.000-00' then
      begin
        ACBrValidador1.TipoDocto := docCPF;
        ACBrValidador1.Documento := qryRemetenteCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;

    end;

    if qryRemetentePESSOA.Value = 'JURÍDICA' then
    begin
      if qryRemetenteCNPJ.Value <> '00.000.000/0000-00' then
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        ACBrValidador1.Documento := qryRemetenteCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if qryRemetentePESSOA.Value = 'JURÍDICA' then
    begin
      if qryRemetenteIE.AsString <> '0' then
      begin
        ACBrValidador1.TipoDocto := docInscEst;
        ACBrValidador1.Documento := qryRemetenteIE.Value;
        ACBrValidador1.Complemento := qryRemetenteUF.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if trim(qryRemetenteENDERECO.Value) = '' then
    begin
      ShowMessage('Digite ENDEREÇO!');
      DBEdit3.SetFocus;
      exit;
    end;

    if trim(qryRemetenteBAIRRO.Value) = '' then
    begin
      ShowMessage('Digite BAIRRO!');
      DBEdit4.SetFocus;
      exit;
    end;

    if trim(qryRemetenteCIDADE.Value) = '' then
    begin
      ShowMessage('Digite MUNICIPIO!');
      DBEdit6.SetFocus;
      exit;
    end;

    if trim(qryRemetenteUF.Value) = '' then
    begin
      ShowMessage('Digite UF!');
      DBComboBoxEh1.SetFocus;
      exit;
    end;
    qryRemetente.Post;
    dados.Conexao.CommitRetaining;
  end;
  PageControl1.ActivePageIndex := 0;
  edtLoc.SetFocus;
end;

procedure TfrmRemetente.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    if qryRemetente.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelRemetente.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
