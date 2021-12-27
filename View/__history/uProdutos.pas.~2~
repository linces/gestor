unit uProdutos;

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
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF,
  frxExportBaseDialog, frxExportXLS;

type
  TfrmProdutos = class(TForm)
    OpenPicture: TOpenPictureDialog;
    dsProdutos: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    btnImp: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    frxDBProduto: TfrxDBDataset;
    dsEmpresa: TDataSource;
    btnAtualizar: TSpeedButton;
    qryRelProd: TFDQuery;
    qryRelProdCODIGO: TIntegerField;
    qryRelProdCODBARRA: TStringField;
    qryRelProdDESCRICAO: TStringField;
    qryRelProdREFERENCIA: TStringField;
    qryRelProdUNIDADE: TStringField;
    qryRelProdTOTAL_COMPRA: TFMTBCDField;
    qryRelProdTOTAL_VENDA: TFMTBCDField;
    qryRelProdGRUPO_SL: TStringField;
    qryRelProdFORNECEDOR_SL: TStringField;
    qryRelProdQTD_ATUAL: TFMTBCDField;
    qryRelProdPR_VENDA: TFMTBCDField;
    qryRelProdPR_CUSTO: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    TabSet2: TTabSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    qrySeriais: TFDQuery;
    Label28: TLabel;
    qrySeriaisCODIGO: TIntegerField;
    qrySeriaisID_PRODUTO: TIntegerField;
    qrySeriaisNUMERO_SERIE: TStringField;
    qrySeriaisDOC_SAIDA: TStringField;
    qrySeriaisSITUACAO: TStringField;
    qrySeriaisDATA_BAIXA: TDateField;
    qrySeriaisDESCRICAO: TStringField;
    dsSeriais: TDataSource;
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbTemploChange(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSet2Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2TitleClick(Column: TColumn);
  private
    filtro, filtro1, filtro2: string;
    parte, ordem: String;
    procedure localiza;
    procedure tamanho;
    procedure LocalizaProduto;
    procedure LocalizaSerial;
    { Private declarations }
  public
    idx: Integer;
    vOrdem: string[5];
    vSql, vSqlConsulta: String;
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses Udados, uCadProduto, uSupervisor;

procedure TfrmProdutos.bbAlterarClick(Sender: TObject);
begin
  if dados.qryProdutos.IsEmpty then
    exit;

  dados.vAutorizar := true;
  if not dados.eSupervisor then
  begin

    try
      frmSupervisor := TFrmSupervisor.Create(Application);
      dados.vAutorizar := false;
      frmSupervisor.ShowModal;
    finally
      frmSupervisor.Release;
    end;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := dados.qryProdutosCODIGO.Value;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.edit;
    bbAlterar.Enabled := false;
    FrmCadProduto.Tag := 0;
    FrmCadProduto.ShowModal;
    Application.ProcessMessages;
  finally
    bbAlterar.Enabled := true;
    FrmCadProduto.Release;
    btnAtualizar.Click;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmProdutos.bbNovoClick(Sender: TObject);
begin

  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.qryProdutosCODIGO.Value := dados.Numerador('PRODUTO',
      'CODIGO', 'N', '', '');
    FrmCadProduto.qryProdutosATIVO.Value := 'S';
    FrmCadProduto.qryProdutosREMEDIO.Value := 'N';
    FrmCadProduto.qryProdutosGRADE.Value := 'N';
    FrmCadProduto.qryProdutosAPLICACAO.Value := ' ';
    FrmCadProduto.qryProdutosORIGEM.Value := 0;
    FrmCadProduto.qryProdutosPR_CUSTO2.Value := 0;
    FrmCadProduto.qryProdutosPERC_CUSTO.Value := 0;
    FrmCadProduto.qryProdutosPR_VENDA.Value := 0;
    FrmCadProduto.qryProdutosQTD_FISCAL.Value := 0;
    FrmCadProduto.qryProdutosPR_CUSTO.Value := 0;
    FrmCadProduto.qryProdutosMVA_NORMAL.AsFloat := 0;
    FrmCadProduto.qryProdutosQTD_MIN.Value := 1;
    FrmCadProduto.qryProdutosESTOQUE_INICIAL.Value := 0;
    FrmCadProduto.qryProdutosMOTIVO_DESONERACAO.Value := 9;
    FrmCadProduto.qryProdutosE_MEDIO.Value := 0;
    FrmCadProduto.qryProdutosCOMBUSTIVEL.Value := 'N';
    FrmCadProduto.qryProdutosPRODUTO_PESADO.Value := 'N';
    FrmCadProduto.qryProdutosNCM.Value := '00000000';
    FrmCadProduto.qryProdutosMARGEM.Value :=
      dados.qryEmpresaLUCRO_PADRAO.AsFloat;
    FrmCadProduto.qryProdutosQTD_ATUAL.Value := 0;
    FrmCadProduto.qryProdutosQTD_ATACADO.Value := 0;
    FrmCadProduto.qryProdutosPR_CUSTO_ANTERIOR.Value := 0;
    FrmCadProduto.qryProdutosPR_VENDA_ANTERIOR.Value := 0;
    FrmCadProduto.qryProdutosULT_COMPRA.Value := 0;
    FrmCadProduto.qryProdutosULT_COMPRA_ANTERIOR.Value := 0;
    FrmCadProduto.qryProdutosEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    FrmCadProduto.qryProdutosPRECO_ATACADO.Value := 0;
    FrmCadProduto.qryProdutosCFOP.Value := dados.qryEmpresaCFOP.Value;
    FrmCadProduto.qryProdutosALIQ_ICM.Value :=
      dados.qryEmpresaALIQ_ICMS.AsFloat;
    FrmCadProduto.qryProdutosPRECO_VARIAVEL.Value := 'N';
    FrmCadProduto.qryProdutosALIQ_PIS.Value := dados.qryEmpresaALIQ_PIS.AsFloat;
    FrmCadProduto.qryProdutosALIQ_COF.Value := dados.qryEmpresaALIQ_COF.AsFloat;
    FrmCadProduto.qryProdutosALIQ_IPI.Value := dados.qryEmpresaALIQ_IPI.AsFloat;
    FrmCadProduto.qryProdutosCSTICMS.Value := dados.qryEmpresaCST_ICMS.Value;
    FrmCadProduto.qryProdutosCSTE.Value := dados.qryEmpresaCST_ENTRADA.Value;
    FrmCadProduto.qryProdutosCSTS.Value := dados.qryEmpresaCST_SAIDA.Value;
    FrmCadProduto.qryProdutosCSTIPI.Value := dados.qryEmpresaCST_IPI.Value;
    FrmCadProduto.qryProdutosCSOSN.Value := dados.qryEmpresaCSOSN.Value;
    FrmCadProduto.qryProdutosCOMISSAO.Value := 0;
    FrmCadProduto.qryProdutosDESCONTO.Value := 0;
    FrmCadProduto.qryProdutosPAGA_COMISSAO.Value := 'N';
    FrmCadProduto.qryProdutosAPLICACAO.Value := '';
    FrmCadProduto.qryProdutosEFISCAL.Value := 'S';
    FrmCadProduto.qryProdutosDESCONTO.Value := 0;
    FrmCadProduto.qryProdutosPRECO_VARIAVEL.Value := 'N';
    FrmCadProduto.qryProdutosSERVICO.Value := 'N';
    FrmCadProduto.qryProdutosDESCONTO.Value := 0;
    FrmCadProduto.qryProdutosCOMPOSICAO.Value := 'N';
    FrmCadProduto.qryProdutosRESTAUTANTE.Value := 'N';
    FrmCadProduto.qryProdutosMVA.Value := 0;
    FrmCadProduto.qryProdutosREDUCAO_BASE.Value := 0;
    FrmCadProduto.qryProdutosFCP.Value := 0;
    FrmCadProduto.qryProdutosTIPO.Value := '00-MERCADORIA PARA REVENDA';

    FrmCadProduto.Tag := 0;
    bbNovo.Enabled := false;
    FrmCadProduto.ShowModal;
    Application.ProcessMessages;
  finally
    bbNovo.Enabled := true;
    FrmCadProduto.Release;
    btnAtualizar.Click;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmProdutos.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qryProdutosCODIGO.Value;
    localiza;
    dados.qryProdutos.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmProdutos.btnImpClick(Sender: TObject);
begin

  qryRelProd.Close;
  qryRelProd.SQL.Text := vSqlConsulta;
  qryRelProd.SQL.Text := StringReplace(qryRelProd.SQL.Text, '/*ordem*/',
    filtro + filtro1 + filtro2 + ordem, []);
  qryRelProd.Params[0].Value := 0;
  qryRelProd.Params[1].Value := 1000;
  qryRelProd.Open;

  if qryRelProd.IsEmpty then
  begin
    ShowMessage('Informações não encontradas!');
    exit;
  end;

  try
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelEstoque.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    edtLoc.SetFocus;
  end;

end;

procedure TfrmProdutos.cbTemploChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmProdutos.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmProdutos.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmProdutos.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[1].Title.Caption := 'Referência';
  DBGrid1.Columns[2].Title.Caption := 'Cód.Barras';
  DBGrid1.Columns[3].Title.Caption := 'Descrição';
  DBGrid1.Columns[4].Title.Caption := 'Grupo';
  DBGrid1.Columns[5].Title.Caption := 'Localização';
  DBGrid1.Columns[6].Title.Caption := 'Preço';
  DBGrid1.Columns[7].Title.Caption := 'Estoque';

  GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;

  localiza;

end;

procedure TfrmProdutos.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
end;

procedure TfrmProdutos.DBGrid2TitleClick(Column: TColumn);
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

  if idx <= 1 then
  begin
    DBGrid2.Columns[0].Title.Caption := 'Produto';
    DBGrid2.Columns[1].Title.Caption := 'Número de Série';

    GroupBox1.Caption := 'F6 | Localizar <<' + DBGrid2.Columns[idx]
      .Title.Caption + '>>';

    DBGrid2.Columns[idx].Title.Caption := '>>' + DBGrid2.Columns[idx]
      .Title.Caption;

    for i := 0 to DBGrid2.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];

    DBGrid2.Columns[idx].Title.Font.Style := [fsbold];

    edtLoc.SetFocus;

    localiza;
  end;
end;

procedure TfrmProdutos.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmProdutos.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryProdutos.Prior;
  if Key = VK_DOWN then
    dados.qryProdutos.Next;
end;

procedure TfrmProdutos.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if PageControl1.ActivePageIndex = 0 then
  begin

    if idx = 0 then
    begin
      if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
        Key := #0;
    end;

    if (idx in [6 .. 8]) then
    begin
      if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
        Key := #0;
    end;

  end;

end;

procedure TfrmProdutos.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  if vSqlConsulta = '' then
    vSqlConsulta := qryRelProd.SQL.Text;
end;

procedure TfrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    vk_f2:
      bbNovoClick(self);
    vk_f3:
      bbAlterarClick(self);
    vk_f4:
      btnImpClick(self);
    vk_f5:
      btnAtualizar.Click;
    vk_f6:
      edtLoc.SetFocus;
    vk_delete:
      begin

        if Application.messageBox('Deseja excluir produto?', 'Confirmação',
          mb_YesNo) = mrYes then
        begin

          dados.vAutorizar := true;

          try
            frmSupervisor := TFrmSupervisor.Create(Application);
            dados.vAutorizar := false;
            frmSupervisor.ShowModal;
          finally
            frmSupervisor.Release;
          end;

          if not dados.vAutorizar then
          begin
            exit;
          end;
          try
            dados.qryProdutos.Delete;
          except
            on e: exception do
              raise exception.Create('Produto não pode ser excluído!' +
                sLineBreak + e.Message);
          end;

        end;
      end;
  end;

end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin

  idx := 0;
  vOrdem := ' ASC';

  dados.qryGrupo.SQL.Text := 'select * from grupo order by 1';
  dados.qryUnidade.SQL.Text := 'select * from unidade order by 1';

  edtLoc.SetFocus;

  tamanho;

  DBGrid1TitleClick(DBGrid1.Columns[idx]);
  DBGrid2TitleClick(DBGrid1.Columns[idx]);

  DBGrid1.Columns[8].Visible := false;
  if dados.qryEmpresaEXIBE_ESTOQUE_FISCAL.Value = 'S' then
    DBGrid1.Columns[8].Visible := true;
end;

procedure TfrmProdutos.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.20);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.10);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[8].Width := round(Screen.Width * 0.06);
end;

procedure TfrmProdutos.frxReportGetValue(const VarName: string;
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

procedure TfrmProdutos.LocalizaProduto;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin

      vSql := ' select PRO.*, gr.descricao grupo_sl, pes.razao fornecedor_sl  from Produto PRO '
        + ' left join grupo gr on gr.codigo=pro.grupo ' +
        ' left join pessoa pes on pes.codigo=pro.ultforn where pro.codigo>0 ' +
        ' /*where*/';

      filtro := '';
      filtro1 := '';
      filtro2 := '';
      ordem := '';

      parte := '';
      if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        parte := '%';

      filtro := ' AND pro.empresa=' + dados.qryEmpresaCODIGO.AsString;

      if (trim(edtLoc.Text) <> '') then
        case idx of
          0:
            filtro1 := ' and pro.CODIGO=' + edtLoc.Text;
          1:
            filtro1 := ' and pro.REFERENCIA LIKE' +
              QuotedStr(parte + edtLoc.Text + '%');
          2:
            filtro1 := ' and pro.CODBARRA LIKE ' + QuotedStr(edtLoc.Text + '%');
          3:
            filtro1 := ' and pro.DESCRICAO LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          4:
            filtro1 := ' and gr.descricao LIKE ' + QuotedStr(edtLoc.Text + '%');
          5:
            filtro1 := ' and pro.localizacao LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          6:
            filtro1 := ' and pro.pr_venda  >= ' + StringReplace(edtLoc.Text,
              ',', '.', []);
          7:
            filtro1 := ' and pro.qtd_atual >= ' + StringReplace(edtLoc.Text,
              ',', '.', []);

        end;

      case TabSet2.TabIndex of
        0:
          filtro2 := ' and pro.ATIVO=''S''';
        1:
          filtro2 := ' and pro.ATIVO=''N''';
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
        5:
          ordem := ' order by pro.localizacao' + vOrdem;
        6:
          ordem := ' order by pro.pr_venda' + vOrdem;
        7:
          ordem := ' order by pro.qtd_atual' + vOrdem;
        8:
          ordem := ' order by pro.qtd_fiscal' + vOrdem;
      end;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dados.qryProdutos.Close;
          dados.qryProdutos.SQL.Text := vSql;
          dados.qryProdutos.SQL.Text :=
            StringReplace(dados.qryProdutos.SQL.Text, '/*where*/',
            filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
          dados.qryProdutos.Open;
        end);

    end).Start;
end;

procedure TfrmProdutos.LocalizaSerial;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin

      vSql := ' select ps.*, pro.descricao from produto_serial ps' +
        ' left join produto pro on pro.codigo=ps.id_produto /*where*/ ';

      filtro := '';
      ordem := '';

      parte := '';
      if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
        parte := '%';

      if (trim(edtLoc.Text) <> '') then
        case idx of
          0:
            filtro := ' WHERE pro.DESCRICAO LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');
          1:
            filtro := ' WHERE ps.NUMERO_SERIE LIKE ' +
              QuotedStr(parte + edtLoc.Text + '%');

        end;

      case idx of
        0:
          ordem := ' order by pro.DESCRICAO' + vOrdem;
        1:
          ordem := ' order by ps.NUMERO_SERIE' + vOrdem;
      end;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          qrySeriais.Close;
          qrySeriais.SQL.Text := vSql;
          qrySeriais.SQL.Text := StringReplace(qrySeriais.SQL.Text, '/*where*/',
            filtro + ordem, [rfReplaceAll]);
          qrySeriais.Open;
        end);

    end).Start;
end;

procedure TfrmProdutos.localiza;
begin
  case PageControl1.ActivePageIndex of
    0:
      LocalizaProduto;
    1:
      LocalizaSerial;
  end;
end;

procedure TfrmProdutos.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
