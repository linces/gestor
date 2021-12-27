unit UCFOP;

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
  DBLookupEh, Vcl.Tabs;

type
  TfrmCFOP = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    qryCFOP: TFDQuery;
    dsCFOP: TDataSource;
    qryCFOPCODIGO: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPTIPO: TStringField;
    qryCFOPMOV_ES: TStringField;
    qryCFOPATIVO: TStringField;
    qryCFOPOPERACAO: TStringField;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    TabSet2: TTabSet;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    DBGrid1: TDBGrid;
    Cadastro: TTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBComboBoxEh1: TDBComboBoxEh;
    DBComboBoxEh2: TDBComboBoxEh;
    Panel5: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbAlterarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  frmCFOP: TfrmCFOP;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCFOP.bbAlterarClick(Sender: TObject);
begin
  if qryCFOP.IsEmpty then
    exit;

  PageControl1.ActivePage := Cadastro;
  qryCFOP.edit;
  DBEdit2.SetFocus;
end;

procedure TfrmCFOP.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmCFOP.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    (Sender as TDBGrid).Canvas.Brush.Color := clGray;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCFOP.DBGrid1TitleClick(Column: TColumn);
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

procedure TfrmCFOP.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCFOP.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryCFOP.Prior;
  if Key = VK_DOWN then
    qryCFOP.Next;
end;

procedure TfrmCFOP.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmCFOP.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmCFOP.FormCreate(Sender: TObject);
begin
  vOrdem := 'ASC';
end;

procedure TfrmCFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if Key = vk_f3 then
    begin
      bbAlterarClick(self);
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
        ('Tem Certeza de que deseja sair do cadastro de formas de pagamento?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelarClick(self);
      end;

  end;

end;

procedure TfrmCFOP.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := Lista;
  idx := 0;

  localiza;

  edtLoc.SetFocus;

end;

procedure TfrmCFOP.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  qryCFOP.SQL.Text := 'select * from cfop where codigo>0 /*where*/';

  if trim(edtLoc.Text) <> '' then
    case idx of
      0:
        filtro := filtro + ' and codigo=' + edtLoc.Text;
      1:
        filtro := filtro + ' and descricao like ' +
          QuotedStr(parte + edtLoc.Text + '%');
    end;

  case TabSet2.TabIndex of
    1:
      filtro := filtro + ' and ATIVO=''S''';
    2:
      filtro := filtro + ' and ATIVO=''N''';
  end;

  case idx of
    0:
      ordem := ' order by codigo ' + vOrdem;
    1:
      ordem := ' order by descricao ' + vOrdem;
  end;

  qryCFOP.close;
  qryCFOP.SQL.Text := StringReplace(qryCFOP.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryCFOP.Open;
end;

procedure TfrmCFOP.btnCancelarClick(Sender: TObject);
begin
  if qryCFOP.State in [dsInsert, dsEdit] then
    qryCFOP.Cancel;
  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;
end;

procedure TfrmCFOP.btnGravarClick(Sender: TObject);
begin
  if qryCFOP.State in [dsInsert, dsEdit] then
  begin
    if trim(qryCFOPDESCRICAO.Value) = '' then
    begin
      ShowMessage('Digite o Descrição!');
      DBEdit2.SetFocus;
      exit;
    end;

    qryCFOP.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;
  edtLoc.SetFocus;

end;

end.
