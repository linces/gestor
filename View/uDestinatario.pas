unit uDestinatario;

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
  TfrmDestinatario = class(TForm)
    dsDestinatario: TDataSource;
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
    frxDBDestinatario: TfrxDBDataset;
    dsEmpresa: TDataSource;
    qryDestinatario: TFDQuery;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioNOME: TStringField;
    qryDestinatarioENDERECO: TStringField;
    qryDestinatarioBAIRRO: TStringField;
    qryDestinatarioID_CIDADE: TIntegerField;
    qryDestinatarioCIDADE: TStringField;
    qryDestinatarioCEP: TStringField;
    qryDestinatarioUF: TStringField;
    qryDestinatarioPESSOA: TStringField;
    qryDestinatarioCNPJ: TStringField;
    qryDestinatarioIE: TStringField;
    qryDestinatarioFONE: TStringField;
    qryDestinatarioFK_EMPRESA: TIntegerField;
    qryDestinatarioFK_USUARIO: TIntegerField;
    qryDestinatarioATIVO: TIntegerField;
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
    dsCidade: TDataSource;
    qryDestinatarioNUMERO: TStringField;
    ACBrValidador1: TACBrValidador;
    qryDestinatarioVIRTUAL_EMPRESA: TStringField;
    BitBtn1: TBitBtn;
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
  frmDestinatario: TfrmDestinatario;

implementation

{$R *.dfm}

uses Udados, uRotinasComuns;

procedure TfrmDestinatario.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      qryDestinatarioENDERECO.Value :=
        UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      qryDestinatarioBAIRRO.Value := UpperCase(Bairro);
      qryDestinatarioCIDADE.Value := UpperCase(Municipio);
      qryDestinatarioID_CIDADE.AsString := IBGE_Municipio;
      qryDestinatarioUF.AsString := UpperCase(UF);
      qryDestinatarioID_CIDADE.Value :=
        Dados.BuscaCodigoIbge(qryDestinatarioCIDADE.Value,
        qryDestinatarioUF.Value);
    end;
  end;
end;

procedure TfrmDestinatario.bbAlterarClick(Sender: TObject);
begin

  if qryDestinatario.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  qryDestinatario.edit;
  Panel1.Enabled := true;
  DBComboBox1.SetFocus;

end;

procedure TfrmDestinatario.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  qryDestinatario.Insert;
  qryDestinatarioCODIGO.Value := Dados.Numerador('CTE_DESTINATARIO', 'CODIGO',
    'N', '', '');
  qryDestinatarioATIVO.Value := 1;
  qryDestinatarioFK_EMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
  qryDestinatarioFK_USUARIO.Value := Dados.idUsuario;
  Panel1.Enabled := true;
  DBComboBox1.SetFocus;

end;

procedure TfrmDestinatario.BitBtn1Click(Sender: TObject);
begin
  if qryDestinatarioPESSOA.Value = 'JURÍDICA' then
  begin
    try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(DBEdit8.text));
      qryDestinatarioNOME.Value := UpperCase(dmrotinas.Pessoa.razao);
      qryDestinatarioENDERECO.Value := UpperCase(dmrotinas.Pessoa.Logradouro);
      qryDestinatarioNUMERO.Value := UpperCase(dmrotinas.Pessoa.numero);
      qryDestinatarioBAIRRO.Value := UpperCase(dmrotinas.Pessoa.Bairro);
      qryDestinatarioCIDADE.Value := UpperCase(dmrotinas.Pessoa.Municipio);
      qryDestinatarioUF.Value := UpperCase(dmrotinas.Pessoa.UF);
      qryDestinatarioCEP.Value := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      qryDestinatarioID_CIDADE.Value :=
        Dados.BuscaCodigoIbge(qryDestinatarioCIDADE.Value,
        qryDestinatarioUF.Value);
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

  end
  else
    ShowMessage('Não é possivel buscar informações de pessoas físicas!');
end;

procedure TfrmDestinatario.BitBtn2Click(Sender: TObject);
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

procedure TfrmDestinatario.DBComboBox1Exit(Sender: TObject);
begin
  if qryDestinatario.State in dsEditModes then
  begin
    qryDestinatarioCNPJ.EditMask := '###.###.###-##;1;';
    if qryDestinatarioPESSOA.Value = 'JURÍDICA' then
      qryDestinatarioCNPJ.EditMask := '##.###.###/####-##;1;';
  end;
end;

procedure TfrmDestinatario.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn2Click(self);
end;

procedure TfrmDestinatario.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn1Click(self);

end;

procedure TfrmDestinatario.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmDestinatario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmDestinatario.DBGrid1TitleClick(Column: TColumn);
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

procedure TfrmDestinatario.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  qryDestinatarioCIDADE.Value := Dados.qryCidadeDESCRICAO.Value;
end;

procedure TfrmDestinatario.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmDestinatario.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryDestinatario.Prior;
  if Key = VK_DOWN then
    qryDestinatario.Next;
end;

procedure TfrmDestinatario.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmDestinatario.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;


procedure TfrmDestinatario.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
  Dados.qryCidade.close;
  Dados.qryCidade.Open;
end;

procedure TfrmDestinatario.FormKeyDown(Sender: TObject; var Key: Word;
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
        ('Tem Certeza de que deseja sair do cadastro de Destinatário?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelarClick(self);
      end;
  end;

end;

procedure TfrmDestinatario.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmDestinatario.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';
  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  qryDestinatario.SQL.text :=
    'select *   from cte_destinatario where fk_empresa=:id /*where*/';

  if trim(edtLoc.text) <> '' then
    case idx of
      0:
        filtro := ' and codigo=' + edtLoc.text;
      1:
        filtro := ' and nome like ' + QuotedStr(parte + edtLoc.text + '%');
    end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by nome ' + vOrdem;
  end;
  qryDestinatario.close;
  qryDestinatario.SQL.text := StringReplace(qryDestinatario.SQL.text,
    '/*where*/', filtro + ordem, [rfReplaceAll]);
  qryDestinatario.ParamByName('id').Value := Dados.qryEmpresaCODIGO.Value;
  qryDestinatario.Open;
end;

procedure TfrmDestinatario.btnCancelarClick(Sender: TObject);
begin
  if qryDestinatario.State in dsEditModes then
    qryDestinatario.Cancel;
  PageControl1.ActivePage := Lista;
end;

procedure TfrmDestinatario.btnGravarClick(Sender: TObject);
begin
  if qryDestinatario.State in [dsInsert, dsEdit] then
  begin

    DBEdit8.SetFocus;

    if qryDestinatarioPESSOA.IsNull then
    begin
      ShowMessage('Digite o Tipo de Pessoa!');
      DBComboBox1.SetFocus;
      exit;
    end;

    if trim(qryDestinatarioCNPJ.Value) = '' then
    begin
      ShowMessage('Digite CNPJ!');
      DBEdit8.SetFocus;
      exit;
    end;

    if trim(qryDestinatarioNOME.Value) = '' then
    begin
      ShowMessage('Digite NOME!');
      DBEdit2.SetFocus;
      exit;
    end;

    if qryDestinatarioPESSOA.Value = 'FÍSICA' then
    begin
      if qryDestinatarioCNPJ.Value <> '000.000.000-00' then
      begin
        ACBrValidador1.TipoDocto := docCPF;
        ACBrValidador1.Documento := qryDestinatarioCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;

    end;

    if qryDestinatarioPESSOA.Value = 'JURÍDICA' then
    begin
      if qryDestinatarioCNPJ.Value <> '00.000.000/0000-00' then
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        ACBrValidador1.Documento := qryDestinatarioCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if qryDestinatarioPESSOA.Value = 'JURÍDICA' then
    begin
      if (qryDestinatarioIE.AsString <> '0') and
        (trim(qryDestinatarioIE.AsString) <> '') then
      begin
        ACBrValidador1.TipoDocto := docInscEst;
        ACBrValidador1.Documento := qryDestinatarioIE.Value;
        ACBrValidador1.Complemento := qryDestinatarioUF.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if trim(qryDestinatarioENDERECO.Value) = '' then
    begin
      ShowMessage('Digite ENDEREÇO!');
      DBEdit3.SetFocus;
      exit;
    end;

    if trim(qryDestinatarioBAIRRO.Value) = '' then
    begin
      ShowMessage('Digite BAIRRO!');
      DBEdit4.SetFocus;
      exit;
    end;

    if trim(qryDestinatarioCIDADE.Value) = '' then
    begin
      ShowMessage('Digite MUNICIPIO!');
      DBEdit6.SetFocus;
      exit;
    end;

    if trim(qryDestinatarioUF.Value) = '' then
    begin
      ShowMessage('Digite UF!');
      DBComboBoxEh1.SetFocus;
      exit;
    end;
    qryDestinatario.Post;
    Dados.Conexao.CommitRetaining;
  end;
  PageControl1.ActivePageIndex := 0;
  edtLoc.SetFocus;
end;

procedure TfrmDestinatario.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    if qryDestinatario.IsEmpty then
    begin
      ShowMessage('Informações não encontradas!');
      exit;
    end;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelVendedores.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
