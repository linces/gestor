unit uAcertaEstoque;

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
  DBCtrlsEh, ACBrBase, ACBrEnterTab, frxClass, frxDBSet, frxExportPDF, DBGridEh,
  DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmAcerta = class(TForm)
    dsAcerta: TDataSource;
    PageControl1: TPageControl;
    Lista: TTabSheet;
    Cadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    bbNovo: TSpeedButton;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBAcerta: TfrxDBDataset;
    ACBrEnterTab1: TACBrEnterTab;
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    dsProd: TDataSource;
    qryAcerta: TFDQuery;
    qryAcertaCODIGO: TIntegerField;
    qryAcertaFKPRODUTO: TIntegerField;
    qryAcertaE_S: TStringField;
    qryAcertaDATA: TDateField;
    qryAcertaVIRTUAL_PRODUTO: TStringField;
    Label7: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit5: TDBEdit;
    qryAcertaDESCRICAO: TStringField;
    btnAtualizar: TSpeedButton;
    Label3: TLabel;
    edtBarra: TEdit;
    qryAcertaVIRTUAL_QTD: TFloatField;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    edtReferencia: TEdit;
    Label9: TLabel;
    qryReferencia: TFDQuery;
    qryReferenciaCODIGO: TIntegerField;
    qryReferenciaDESCRICAO: TStringField;
    qryAcertaQTD_F: TFMTBCDField;
    qryAcertaQTD_A: TFMTBCDField;
    qryProdQTD_ATUAL: TFMTBCDField;
    qryReferenciaQTD_ATUAL: TFMTBCDField;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    qryGradePRECO: TFMTBCDField;
    qryGradeTQTD: TAggregateField;
    dsGrade: TDataSource;
    pnGrade: TPanel;
    DBGrid2: TDBGrid;
    DBEdit37: TDBEdit;
    Label44: TLabel;
    qryProdGRADE: TStringField;
    qryAcertaVIRTUAL_QTD_FISCAL: TExtendedField;
    qryProdQTD_FISCAL: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtLoc: TEdit;
    DataInicial: TDateTimePicker;
    btnFiltrar: TBitBtn;
    DataFinal: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bbNovoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnImpClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure qryAcertaBeforeOpen(DataSet: TDataSet);
    procedure qryAcertaBeforePost(DataSet: TDataSet);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure qryAcertaBeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure edtReferenciaChange(Sender: TObject);
    procedure qryAcertaAfterPost(DataSet: TDataSet);
    procedure qryAcertaAfterDelete(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure edtBarraChange(Sender: TObject);
    procedure qryAcertaFKPRODUTOValidate(Sender: TField);
  private
    fProduto: Integer;
    qtd_anterior_f, qtd_anterior: real;
    vOrdem: string;

    procedure localiza;

    function EGrade: boolean;

    { Private declarations }
  public
    idx: Integer;
    { Public declarations }
  end;

var
  frmAcerta: TfrmAcerta;

implementation

{$R *.dfm}

uses Udados, uDMEstoque;

procedure TfrmAcerta.bbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePage := Cadastro;

  qtd_anterior_f := 0;
  qtd_anterior := 0;

  qryAcerta.Insert;
  qryAcertaCODIGO.Value := dados.Numerador('ACERTA_ESTOQUE', 'CODIGO',
    'N', '', '');
  qryAcertaDATA.Value := date;

  qryAcertaQTD_F.Value := 0;
  qryAcertaQTD_A.Value := 0;
  Panel1.Enabled := true;

  DBEdit5.Enabled := true;
  DBLookupComboboxEh2.Enabled := true;
  DBEdit5.SetFocus;

end;

procedure TfrmAcerta.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

function TfrmAcerta.EGrade: boolean;
begin
  if qryProd.Locate('codigo', qryAcertaFKPRODUTO.Value, []) then
  begin
    if qryProdGRADE.Value = 'S' then
    begin
      pnGrade.Visible := true;

      qryGrade.Close;
      qryGrade.Params[0].Value := qryAcertaFKPRODUTO.Value;
      qryGrade.Open;

    end
    else
      pnGrade.Visible := false;
  end;
end;

procedure TfrmAcerta.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := 'Data';
  DBGrid1.Columns[1].Title.Caption := 'Código';
  DBGrid1.Columns[2].Title.Caption := 'Produto';
  DBGrid1.Columns[3].Title.Caption := 'Estoque Atual';
  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  case idx of
    0:
      begin
        DataInicial.SetFocus;
      end;
    1 .. 3:
      begin
        edtLoc.SetFocus;
        edtLoc.Clear;
      end;
  end;

  localiza;

end;

procedure TfrmAcerta.DBLookupComboboxEh1Change(Sender: TObject);
begin
  localiza;
end;

procedure TfrmAcerta.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmAcerta.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmAcerta.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmAcerta.edtBarraChange(Sender: TObject);
begin
  qryProdutos.Close;
  qryProdutos.Params[0].Value := edtBarra.Text + '%';
  qryProdutos.Open;
  if (qryAcerta.State in dsEditModes) then
    qryAcertaFKPRODUTO.Value := qryProdutosCODIGO.Value;
end;

procedure TfrmAcerta.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmAcerta.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryAcerta.Prior;
  if Key = VK_DOWN then
    qryAcerta.Next;
end;

procedure TfrmAcerta.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0, 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [3, 4]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmAcerta.edtReferenciaChange(Sender: TObject);
begin
  qryReferencia.Close;
  qryReferencia.Params[0].Value := edtReferencia.Text;
  qryReferencia.Open;
  if (qryAcerta.State in dsEditModes) then
    qryAcertaFKPRODUTO.Value := qryReferenciaCODIGO.Value;
end;

procedure TfrmAcerta.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmAcerta.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';
  DataInicial.date := StartOfTheMonth(date);
  DataFinal.date := date;
end;


procedure TfrmAcerta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    if Key = vk_f2 then
    begin
      bbNovoClick(self);
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

  end
  else
  begin
    if Key = vk_f5 then
      btnGravarClick(self);
    if Key = VK_ESCAPE then
      if Application.messageBox('Tem Certeza de que deseja sair da tela?',
        'Confirmação', mb_YesNo) = mrYes then
      begin
        btnCancelar.Click;
      end
  end;

end;

procedure TfrmAcerta.FormShow(Sender: TObject);
begin
  tag := dados.aTag;
  qryProdutos.Close;
  qryProdutos.Params[0].Value := edtBarra.Text + '%';
  qryProdutos.Open;

  qryProd.Close;
  qryProd.Open;

  if tag = 1 then
  begin
    Caption := 'Ajusta Estoque';
    DBEdit3.DataField := 'VIRTUAL_QTD';
    DBEdit4.DataField := 'QTD_A';
    DBGrid1.Columns[3].FieldName := 'QTD_A';
  end
  else
  begin
    Caption := 'Ajusta Estoque - Fiscal';
    DBEdit3.DataField := 'VIRTUAL_QTD_FISCAL';
    DBEdit4.DataField := 'QTD_F';
    DBGrid1.Columns[3].FieldName := 'QTD_F';
  end;

  PageControl1.ActivePage := Lista;
  localiza;
end;

procedure TfrmAcerta.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin
  filtro := 'PERÍODO DE ' + datetostr(DataInicial.date) + ' ATÉ ' +
    datetostr(DataFinal.date);

  if edtLoc.Text <> '' then
    filtro := filtro + ' | FILTRO:' + edtLoc.Text;

  if VarName = 'PARAMETRO' then
  begin
    Value := filtro;
  end;
end;

procedure TfrmAcerta.localiza;
var
  parte, filtro, ordem: string;
begin
  filtro := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  case tag of
    1:
      qryAcerta.SQL.Text := 'select ae.*, pro.descricao from acerta_estoque ae '
        + ' left join produto pro on pro.codigo=ae.fkproduto where data between :data1 and :data2 and qtd_a>0'
        + ' /*where*/';
    2:
      qryAcerta.SQL.Text := 'select ae.*, pro.descricao from acerta_estoque ae '
        + ' left join produto pro on pro.codigo=ae.fkproduto where data between :data1 and :data2 and qtd_f>0'
        + ' /*where*/';

  end;

  if trim(edtLoc.Text) <> '' then
    case idx of
      1:
        filtro := ' and fkproduto=' + edtLoc.Text;
      2:
        filtro := ' and descricao like ' + QuotedStr(parte + edtLoc.Text + '%');
      3:
        begin
          case tag of
            1:
              filtro := ' and QTD_A >=' +
                QuotedStr(StringReplace(edtLoc.Text, ',', '.', []));
            2:
              filtro := ' and QTD_F >=' +
                QuotedStr(StringReplace(edtLoc.Text, ',', '.', []));
          end;
        end;
    end;

  case idx of
    0:
      ordem := ' order by DATA ' + vOrdem;
    1:
      ordem := ' order by fkproduto ' + vOrdem;
    2:
      ordem := ' order by descricao ' + vOrdem;
    3:
      begin
        case tag of
          1:
            ordem := ' order by QTD_A ' + vOrdem;
          2:
            ordem := ' order by QTD_F ' + vOrdem;
        end;
      end;

  end;
  qryAcerta.Close;
  qryAcerta.SQL.Text := StringReplace(qryAcerta.SQL.Text, '/*where*/',
    filtro + ordem, [rfReplaceAll]);
  qryAcerta.Params[0].AsDate := DataInicial.date;
  qryAcerta.Params[1].AsDate := DataFinal.date;
  qryAcerta.Open;
end;

procedure TfrmAcerta.qryAcertaAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmAcerta.qryAcertaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmAcerta.qryAcertaBeforeDelete(DataSet: TDataSet);
var
  aQtd: Extended;
begin

  fProduto := qryAcertaFKPRODUTO.Value;;

  if tag = 1 then
    dmEstoque.AtualizaEstoque(fProduto, qryAcertaQTD_A.AsFloat, 0,
      qryAcertaE_S.Value, 'R');

  if tag = 2 then
    dmEstoque.AtualizaEstoque(fProduto, qryAcertaQTD_F.AsFloat, 0,
      qryAcertaE_S.Value, 'F');

  dados.Conexao.CommitRetaining;

end;

procedure TfrmAcerta.qryAcertaBeforeOpen(DataSet: TDataSet);
begin
  qryProd.Close;
  qryProd.Open;
end;

procedure TfrmAcerta.qryAcertaBeforePost(DataSet: TDataSet);
begin

  if qryAcerta.State = dsInsert then
    qryAcertaCODIGO.Value := dados.Numerador('ACERTA_ESTOQUE', 'CODIGO',
      'N', '', '');

  if tag = 1 then
    dmEstoque.AtualizaEstoque(qryAcertaFKPRODUTO.Value, qryAcertaQTD_A.AsFloat,
      qtd_anterior, qryAcertaE_S.Value, 'R');

  if tag = 2 then
    dmEstoque.AtualizaEstoque(qryAcertaFKPRODUTO.Value, qryAcertaQTD_F.AsFloat,
      qtd_anterior_f, qryAcertaE_S.Value, 'F');

end;

procedure TfrmAcerta.qryAcertaFKPRODUTOValidate(Sender: TField);
begin
  if tag = 1 then
    EGrade;
end;

procedure TfrmAcerta.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := qryAcertaCODIGO.Value;
    localiza;
    qryAcerta.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmAcerta.btnCancelarClick(Sender: TObject);
begin
  if qryAcerta.State in [dsInsert, dsEdit] then
    qryAcerta.Cancel;
  PageControl1.ActivePage := Lista;
end;

procedure TfrmAcerta.btnFiltrarClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmAcerta.btnGravarClick(Sender: TObject);
var
  FQuantidade: Extended;
begin
  DBEdit3.SetFocus;

  if qryAcertaFKPRODUTO.IsNull then
  begin
    ShowMessage('Informe o produto!');
    exit;
  end;

  if (qryAcertaE_S.IsNull) or (qryAcertaE_S.AsString = '') then
  begin
    ShowMessage('Informe tipo de movimentação!');
    exit;
  end;

  if (qryAcertaE_S.Value = 'S') then
  begin

    if tag = 1 then
    begin
      if qryAcertaVIRTUAL_QTD.Value < qryAcertaQTD_A.Value then
      begin
        ShowMessage
          ('Quantidade de saída não pode ser maior que estoque atual!');
        exit;
      end;
    end;

    if tag = 2 then
    begin
      if qryAcertaVIRTUAL_QTD_FISCAL.AsFloat < qryAcertaQTD_F.AsFloat then
      begin
        ShowMessage
          ('Quantidade de saída não pode ser maior que estoque atual!');
        exit;
      end;
    end;

  end;

  if dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
  begin
    if pnGrade.Visible then
    begin
      FQuantidade := 0;
      if DBComboBoxEh1.Text = 'ENTRADA' then
      begin
        if tag = 1 then // estoque real
          FQuantidade := qryAcertaQTD_A.AsFloat + qryAcertaVIRTUAL_QTD.AsFloat;
        if tag = 2 then // estoque fiscal
          FQuantidade := qryAcertaQTD_F.AsFloat +
            qryAcertaVIRTUAL_QTD_FISCAL.AsFloat;
      end;

      if DBComboBoxEh1.Text = 'SAÍDA' then
      begin
        if tag = 1 then // estoque real
          FQuantidade := qryAcertaQTD_A.AsFloat - qryAcertaVIRTUAL_QTD.AsFloat;
        if tag = 2 then // estoque fiscal
          FQuantidade := qryAcertaQTD_F.AsFloat -
            qryAcertaVIRTUAL_QTD_FISCAL.AsFloat;
      end;

      if tag = 1 then
      begin
        if FQuantidade <> qryGradeTQTD.Value then
          raise Exception.Create
            ('Quantidade em Grade é Diferente de Estoque Atual!!');
      end;
    end;
  end;

  if tag = 1 then
  begin
    if (qryGrade.State in dsEditModes) then
      qryGrade.Post;
  end;

  if (qryAcerta.State in dsEditModes) then
  begin
    qryAcerta.Post;
    dados.Conexao.CommitRetaining;
  end;

  PageControl1.ActivePage := Lista;

end;

procedure TfrmAcerta.btnImpClick(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelAcerta.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
  end;
end;

end.
