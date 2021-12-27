unit uEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrDevice,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF,
  frxExportBaseDialog, ACBrBase, ACBrETQ;

type
  TfrmEtiquetas = class(TForm)
    dsProdutos: TDataSource;
    PageControl1: TPageControl;
    qryProdutos: TFDQuery;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosETQ: TStringField;
    qryProdutosGRUPO_SL: TStringField;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    dsImpressao: TDataSource;
    qryImpressao: TFDQuery;
    qryImpressaoCODIGO: TIntegerField;
    qryImpressaoFK_PRODUTO: TIntegerField;
    qryImpressaoDESCRICAO: TStringField;
    qryImpressaoUNIDADE: TStringField;
    qryImpressaoREFERENCIA: TStringField;
    qryImpressaoCODBARRA: TStringField;
    qryImpressaoPR_VENDA: TFMTBCDField;
    qryImpressaoLOCALIZACAO: TStringField;
    qryImpressaoGRUPO: TStringField;
    qryImpressaoQTD: TIntegerField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    Panel3: TPanel;
    btnPesquisar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnLimpar: TSpeedButton;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    btnAdicionar: TSpeedButton;
    ChckSeleciona: TCheckBox;
    qrySelecionados: TFDQuery;
    qrySelecionadosCODIGO: TIntegerField;
    qrySelecionadosDESCRICAO: TStringField;
    qrySelecionadosREFERENCIA: TStringField;
    qrySelecionadosCODBARRA: TStringField;
    qrySelecionadosUNIDADE: TStringField;
    qrySelecionadosLOCALIZACAO: TStringField;
    qrySelecionadosPR_VENDA: TFMTBCDField;
    qrySelecionadosETQ: TStringField;
    qrySelecionadosGRUPO_SL: TStringField;
    edtQuantidade: TEdit;
    GroupBox3: TGroupBox;
    edtLocProduto: TEdit;
    dsEtiqueta: TDataSource;
    dsCampos: TDataSource;
    pnImpressao: TPanel;
    cbEtiqueta: TDBLookupComboBox;
    Label1: TLabel;
    btnConfirmar: TButton;
    btnSair: TButton;
    ACBrETQ: TACBrETQ;
    qryImpressaoFK_EMPRESA: TIntegerField;
    qrySelecionadosPRECO_ATACADO: TFMTBCDField;
    qryImpressaoPRECO_ATACADO: TFMTBCDField;
    procedure cbTemploChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure ChckSelecionaClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure edtLocProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLocProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocProdutoChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    filtro, filtro1, filtro2: string;
    ordem: String;
    procedure localiza;
    procedure localizaEtiqueta;
    procedure AtivarACBrETQ;
    procedure Colunas01;
    procedure EtiquetaSimples(MultiV, MultiH, Linha, Coluna: Integer;
      Fontes, Texto, Tipo: string; LarguraBarraLarga, LarguraBarraFina,
      AlturaBarra: Integer);
    procedure Colunas02;
    procedure Colunas03;
    procedure Imprime;
    procedure LimpaEtq;
    function Valor: string;
    { Private declarations }
  public
    idx: Integer;
    vOrdem: string[5];
    vSql, vSqlConsulta: String;
    { Public declarations }
  end;

var
  frmEtiquetas: TfrmEtiquetas;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmEtiquetas.AtivarACBrETQ;
begin
  with ACBrETQ do
  begin
    Desativar;

    DPI := TACBrETQDPI(dpi203);

    if Dados.qryEtiquetaMODELO.Value = 'etqNenhum' then
      Modelo := TACBrETQModelo(etqNenhum);

    if Dados.qryEtiquetaMODELO.Value = 'etqPpla' then
      Modelo := TACBrETQModelo(etqPpla);

    if Dados.qryEtiquetaMODELO.Value = 'etqPplb' then
      Modelo := TACBrETQModelo(etqPplb);

    if Dados.qryEtiquetaMODELO.Value = 'etqZPLII' then
      Modelo := TACBrETQModelo(etqZPLII);

    if Dados.qryEtiquetaMODELO.Value = 'etqEpl2' then
      Modelo := TACBrETQModelo(etqEpl2);

    Porta := Dados.qryEtiquetaPORTA.Value;
    LimparMemoria := true;
    Temperatura := 15;
    Velocidade := -1;
    BackFeed := TACBrETQBackFeed(bfNone);
    Unidade := etqMilimetros;

    Ativar;
  end;
end;

procedure TfrmEtiquetas.EtiquetaSimples(MultiV, MultiH, Linha, Coluna: Integer;
  Fontes, Texto, Tipo: string; LarguraBarraLarga, LarguraBarraFina,
  AlturaBarra: Integer);
begin
  with ACBrETQ do
  begin
    if Modelo in [etqPpla, etqPplb] then
    begin
      if Tipo = 'TEXTOA' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto,
          0, false);
      if Tipo = 'TEXTOB' then
        ImprimirTexto(orNormal, StrToIntDef(Fontes, 2), MultiH, MultiV, Linha,
          Coluna, Texto);
      if Tipo = 'BARRA' then
        ImprimirBarras(orNormal, barEAN13, LarguraBarraLarga, LarguraBarraFina,
          Linha, Coluna, Texto, AlturaBarra, becSIM);
    end
    else
    // if Modelo = etqZPLII then
    begin
      if Tipo = 'TEXTOA' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto,
          0, false);
      if Tipo = 'TEXTOB' then
        ImprimirTexto(orNormal, Fontes, MultiH, MultiV, Linha, Coluna, Texto);

      if Tipo = 'BARRA' then
        ImprimirBarras(orNormal, barEAN13, LarguraBarraLarga, LarguraBarraFina,
          Linha, Coluna, Texto, AlturaBarra, becSIM);
    end;
  end;
end;

procedure TfrmEtiquetas.Imprime;
var
  resto, i: Integer;

begin
  qryImpressao.First;
  while not qryImpressao.Eof do
  begin
    case Dados.qryEtiquetaCOLUNAS.AsInteger of
      1:
        begin
          Colunas01;
          ACBrETQ.Imprimir(qryImpressaoQTD.AsInteger, 0);;
          ACBrETQ.Desativar;
          qryImpressao.Next;
        end;
      2:
        begin
          if not qryImpressao.Eof then
          begin
            Colunas01;
            qryImpressao.Next;
          end;

          if not qryImpressao.Eof then
          begin
            Colunas02;
            qryImpressao.Next;
          end;

          ACBrETQ.Imprimir(qryImpressaoQTD.AsInteger, 0);;
          ACBrETQ.Desativar;
        end;

      3:
        begin

          if not qryImpressao.Eof then
          begin
            Colunas01;
            qryImpressao.Next;
          end;

          if not qryImpressao.Eof then
          begin
            Colunas02;
            qryImpressao.Next;
          end;

          if not qryImpressao.Eof then
          begin
            Colunas03;
            qryImpressao.Next;
          end;

          ACBrETQ.Imprimir(qryImpressaoQTD.AsInteger, 0);;
          ACBrETQ.Desativar;

        end;

    end;

  end;
end;

procedure TfrmEtiquetas.LimpaEtq;
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text := 'update produto set etq=''N''';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
end;

function TfrmEtiquetas.Valor: string;
begin
  Case qryImpressao.FieldByName(Dados.qryEtq_CamposCAMPO.Value).DataType of
    ftCurrency, ftBCD, ftFMTBcd, ftFloat, ftExtended:
      result := formatfloat('R$ ,0.00',
        qryImpressao.FieldByName(Dados.qryEtq_CamposCAMPO.Value).asfloat)
  else
    result := qryImpressao.FieldByName(Dados.qryEtq_CamposCAMPO.Value).Value;
  end;
end;

procedure TfrmEtiquetas.Colunas01;
var
  Fator: Integer;
begin
  Fator := 0;
  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.Eof do
  begin
    if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString,
        copy(Valor, 1, Dados.qryEtq_CamposCARACTERES.Value), 'TEXTOA', 0, 0, 0)
    else
    begin
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, Valor, 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
    Dados.qryEtq_Campos.Next;
  end;
end;

procedure TfrmEtiquetas.Colunas02;
var
  Fator: Integer;
begin
  Fator := Dados.qryEtiquetaLARGURA.AsInteger;
  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.Eof do
  begin
    if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString,
        copy(Valor, 1, Dados.qryEtq_CamposCARACTERES.Value), 'TEXTOA', 0, 0, 0)
    else
    begin
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, Valor, 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
    Dados.qryEtq_Campos.Next;
  end;
end;

procedure TfrmEtiquetas.Colunas03;
var
  Fator: Integer;
begin
  Fator := Dados.qryEtiquetaLARGURA.AsInteger * 2;
  Dados.qryEtq_Campos.First;
  while not Dados.qryEtq_Campos.Eof do
  begin
    if Dados.qryEtq_CamposDESCRICAO.Value <> 'CÓDIGO DE BARRA' then
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString,
        copy(Valor, 1, Dados.qryEtq_CamposCARACTERES.Value), 'TEXTOA', 0, 0, 0)
    else
    begin
      EtiquetaSimples(1, 1, Dados.qryEtq_CamposLINHA.AsInteger,
        Dados.qryEtq_CamposCOLUNA.AsInteger + Fator,
        Dados.qryEtq_CamposFONTES.AsString, Valor, 'BARRA',
        Dados.qryEtiquetaBARRA_LARGURA.AsInteger,
        Dados.qryEtiquetaBARRA_FINA.AsInteger,
        Dados.qryEtiquetaBARRA_ALTURA.AsInteger);
    end;
    Dados.qryEtq_Campos.Next;
  end;
end;

procedure TfrmEtiquetas.btnConfirmarClick(Sender: TObject);
begin
  try
    btnConfirmar.Enabled := false;
    Dados.qryEtiqueta.Locate('CODIGO', cbEtiqueta.KeyValue, []);

    Dados.qryEtq_Campos.Close;
    Dados.qryEtq_Campos.Params[0].Value := Dados.qryEtiquetaCODIGO.Value;
    Dados.qryEtq_Campos.Open;

    AtivarACBrETQ;
    Imprime;
  finally
    btnConfirmar.Enabled := true;
  end;
end;

procedure TfrmEtiquetas.btnImprimirClick(Sender: TObject);
begin

  Dados.qryEtiqueta.Close;
  Dados.qryEtiqueta.Open;
  if Dados.qryEtiqueta.IsEmpty then
  begin
    ShowMessage('Configure etiqueta!');
    Exit;
  end;

  if not Dados.qryEtiquetaCOLUNAS.Value > 1 then
  begin
    ShowMessage('Informe o numero de Colunas!');
    Exit;
  end;

  pnImpressao.Visible := true;

  cbEtiqueta.KeyValue := Dados.qryEtiquetaCODIGO.Value;

end;

procedure TfrmEtiquetas.btnLimparClick(Sender: TObject);
begin
  If application.messagebox('Tem certeza que Deseja Limpar a Impressao?',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
  begin
    Dados.qryExecute.Close;
    Dados.qryExecute.SQL.Text := 'delete from etiqueta_impressao';
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;
    localizaEtiqueta;
  end;

end;

procedure TfrmEtiquetas.btnPesquisarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfrmEtiquetas.btnSairClick(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmEtiquetas.cbTemploChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmEtiquetas.ChckSelecionaClick(Sender: TObject);
begin
  if ChckSeleciona.Checked then
  begin
    qryProdutos.First;
    while not qryProdutos.Eof do
    begin
      qryProdutos.Edit;
      qryProdutosETQ.Value := 'S';
      qryProdutos.Post;
      qryProdutos.Next;
    end;
  end;
  if not ChckSeleciona.Checked then
  begin
    qryProdutos.First;
    while not qryProdutos.Eof do
    begin
      qryProdutos.Edit;
      qryProdutosETQ.Value := 'N';
      qryProdutos.Post;
      qryProdutos.Next;
    end;
  end;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmEtiquetas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

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

procedure TfrmEtiquetas.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Cód.Barra';
  DBGrid1.Columns[2].Title.Caption := 'Descrtição';
  DBGrid1.Columns[3].Title.Caption := 'Grupo';
  DBGrid1.Columns[4].Title.Caption := 'Qtd';

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  edtLoc.Width := DBGrid1.Columns[idx].Width + 50;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;

  localizaEtiqueta;

end;

procedure TfrmEtiquetas.DBGrid2CellClick(Column: TColumn);
begin

  if qryProdutosETQ.Value = 'S' then
  begin
    qryProdutos.Edit;
    qryProdutosETQ.Value := 'N';
    qryProdutos.Post;
  end
  else
  begin
    qryProdutos.Edit;
    qryProdutosETQ.Value := 'S';
    qryProdutos.Post;
  end;

  Dados.Conexao.CommitRetaining;
end;

procedure TfrmEtiquetas.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid2.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid2.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // desenha checkbox
  if Column.FieldName = 'ETQ' then
  begin
    DBGrid2.Canvas.FillRect(Rect);
    iCheck := 0;
    if qryProdutosETQ.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;
    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGrid2.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);

  end;
end;

procedure TfrmEtiquetas.DBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
begin

  edtLocProduto.Clear;

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

  DBGrid2.Columns[1].Title.Caption := 'Código';
  DBGrid2.Columns[2].Title.Caption := 'Cód.Barra';
  DBGrid2.Columns[3].Title.Caption := 'Descrtição';
  DBGrid2.Columns[4].Title.Caption := 'Grupo';

  GroupBox3.Caption := 'F6 | Localizar <<' + DBGrid2.Columns[idx]
    .Title.Caption + '>>';

  DBGrid2.Columns[idx].Title.Caption := '>>' + DBGrid2.Columns[idx]
    .Title.Caption;

  edtLocProduto.Width := DBGrid2.Columns[idx].Width + 50;

  for i := 0 to DBGrid2.Columns.Count - 1 do
    DBGrid2.Columns[i].Title.Font.Style := [];

  DBGrid2.Columns[idx].Title.Font.Style := [fsbold];

  edtLocProduto.SetFocus;

  localiza;

end;

procedure TfrmEtiquetas.edtLocChange(Sender: TObject);
begin
  localizaEtiqueta;
end;

procedure TfrmEtiquetas.edtLocProdutoChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmEtiquetas.edtLocProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryProdutos.Prior;
  if Key = VK_DOWN then
    qryProdutos.Next;
end;

procedure TfrmEtiquetas.edtLocProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 1 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmEtiquetas.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmEtiquetas.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmEtiquetas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin
    case Key of
      vk_f2:
        btnPesquisar.Click;
      vk_f3:
        btnLimpar.Click;
      vk_f4:
        btnImprimir.Click;
      vk_f5:
        edtLoc.SetFocus;
    end;
  end
  else
  begin
    case Key of
      vk_f6:
        btnAdicionar.Click;
      vk_f7:
        edtLocProduto.SetFocus;
      vk_f8:
        edtQuantidade.SetFocus;
    end;

  end;
end;

procedure TfrmEtiquetas.FormShow(Sender: TObject);
begin
  edtLoc.SetFocus;
  localizaEtiqueta;
  localiza;
end;

procedure TfrmEtiquetas.localiza;
begin

  if vSql = '' then
    vSql := qryProdutos.SQL.Text;

  filtro := '';
  filtro1 := '';
  filtro2 := '';
  ordem := '';

  filtro := ' AND pro.empresa=' + Dados.qryEmpresaCODIGO.AsString;

  if (trim(edtLocProduto.Text) <> '') then
    case idx of
      0:
        filtro1 := ' and pro.CODIGO=' + edtLocProduto.Text;
      1:
        filtro1 := ' and pro.REFERENCIA LIKE' +
          QuotedStr(edtLocProduto.Text + '%');
      2:
        filtro1 := ' and pro.CODBARRA LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');
      3:
        filtro1 := ' and pro.DESCRICAO LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');
      4:
        filtro1 := ' and gr.descricao LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');

    end;

  case idx of
    0:
      ordem := ' order by pro.CODIGO' + vOrdem;
    1:
      ordem := ' order by pro.REFERENCIA' + vOrdem;
    2:
      ordem := ' order by pro.CODBARRA' + vOrdem;
    3:
      ordem := ' order by pro.DESCRICAO' + vOrdem;
    4:
      ordem := ' order by gr.descricao' + vOrdem;
  end;

  qryProdutos.Close;
  qryProdutos.SQL.Text := vSql;
  qryProdutos.SQL.Text := StringReplace(qryProdutos.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  qryProdutos.Open;
end;

procedure TfrmEtiquetas.localizaEtiqueta;
begin

  if vSqlConsulta = '' then
    vSqlConsulta := qryImpressao.SQL.Text;

  filtro := '';
  filtro1 := '';
  filtro2 := '';
  ordem := '';

  filtro := ' AND ei.fk_empresa=' + Dados.qryEmpresaCODIGO.AsString;

  if (trim(edtLocProduto.Text) <> '') then
    case idx of
      1:
        filtro1 := ' and ei.CODIGO=' + edtLocProduto.Text;
      2:
        filtro1 := ' and pro.CODBARRA LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');
      3:
        filtro1 := ' and pro.DESCRICAO LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');
      4:
        filtro1 := ' and gr.descricao LIKE ' +
          QuotedStr(edtLocProduto.Text + '%');

    end;

  case idx of
    1:
      ordem := ' order by ei.CODIGO' + vOrdem;
    2:
      ordem := ' order by pro.CODBARRA' + vOrdem;
    3:
      ordem := ' order by pro.DESCRICAO' + vOrdem;
    4:
      ordem := ' order by gr.descricao' + vOrdem;
  end;

  qryImpressao.Close;
  qryImpressao.SQL.Text := vSqlConsulta;
  qryImpressao.SQL.Text := StringReplace(qryImpressao.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  qryImpressao.Open;
end;

procedure TfrmEtiquetas.btnAdicionarClick(Sender: TObject);
var
  i: Integer;
begin
  if trim(edtQuantidade.Text) = '' then
  begin
    ShowMessage('Informe a quantidade');
    Exit;
  end;

  try
    btnAdicionar.Enabled := true;
    qrySelecionados.Close;
    qrySelecionados.Open;
    while not qrySelecionados.Eof do
    begin
      for i := 1 to StrToIntDef(edtQuantidade.Text, 1) do
      begin
        qryImpressao.insert;
        qryImpressaoCODIGO.Value := Dados.Numerador('ETIQUETA_IMPRESSAO',
          'CODIGO', 'N', '', '');
        qryImpressaoFK_PRODUTO.Value := qrySelecionadosCODIGO.Value;
        qryImpressaoFK_EMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
        qryImpressaoQTD.Value := 1;
        qryImpressao.Post;
        Dados.Conexao.CommitRetaining;
      end;
      qrySelecionados.Next;
    end;

  finally
    LimpaEtq;

    btnAdicionar.Enabled := true;
    PageControl1.ActivePageIndex := 0;
    localizaEtiqueta;
  end;

end;

end.
