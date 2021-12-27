unit uConsEmpresa;

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
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, frxOLE;

type
  TfrmConsEmpresa = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    dsEmpresa: TDataSource;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    qryEmpresaRAZAO: TStringField;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaIE: TStringField;
    qryEmpresaIM: TStringField;
    qryEmpresaENDERECO: TStringField;
    qryEmpresaNUMERO: TStringField;
    qryEmpresaCOMPLEMENTO: TStringField;
    qryEmpresaBAIRRO: TStringField;
    qryEmpresaCIDADE: TStringField;
    qryEmpresaUF: TStringField;
    qryEmpresaCEP: TStringField;
    qryEmpresaFONE: TStringField;
    qryEmpresaFAX: TStringField;
    qryEmpresaSITE: TStringField;
    qryEmpresaLOGOMARCA: TBlobField;
    qryEmpresaID_PLANO_TRANSFERENCIA_C: TIntegerField;
    qryEmpresaID_PLANO_TRANSFERENCIA_D: TIntegerField;
    qryEmpresaID_CAIXA_GERAL: TIntegerField;
    qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO: TStringField;
    qryEmpresaID_CIDADE: TIntegerField;
    qryEmpresaCRT: TSmallintField;
    qryEmpresaID_UF: TSmallintField;
    qryEmpresaID_PLANO_VENDA: TIntegerField;
    qryEmpresaOBSFISCO: TMemoField;
    qryEmpresaCFOP: TStringField;
    qryEmpresaCSOSN: TStringField;
    qryEmpresaCST_ICMS: TStringField;
    qryEmpresaCST_ENTRADA: TStringField;
    qryEmpresaCST_SAIDA: TStringField;
    qryEmpresaTIPO: TStringField;
    qryEmpresaFUNDACAO: TDateField;
    qryEmpresaUSU_CAD: TSmallintField;
    qryEmpresaUSU_ATU: TSmallintField;
    qryEmpresaNSERIE: TStringField;
    qryEmpresaCSENHA: TStringField;
    qryEmpresaIMP_F5: TStringField;
    qryEmpresaIMP_F6: TStringField;
    qryEmpresaMOSTRA_RESUMO_CAIXA: TStringField;
    qryEmpresaPRAZO_MAXIMO: TSmallintField;
    qryEmpresaID_PLA_CONTA_FICHA_CLI: TIntegerField;
    qryEmpresaID_PLANO_CONTA_RETIRADA: TIntegerField;
    qryEmpresaUSA_PDV: TStringField;
    qryEmpresaRECIBO_VIAS: TStringField;
    qryEmpresaID_PLANO_TAXA_CARTAO: TIntegerField;
    qryEmpresaOBS_CARNE: TMemoField;
    qryEmpresaCAIXA_UNICO: TStringField;
    qryEmpresaCAIXA_RAPIDO: TStringField;
    qryEmpresaEMPRESA_PADRAO: TSmallintField;
    qryEmpresaID_PLANO_CONTA_DEVOLUCAO: TIntegerField;
    qryEmpresaN_INICIAL_NFE: TIntegerField;
    qryEmpresaN_INICIAL_NFCE: TIntegerField;
    qryEmpresaCHECA_ESTOQUE_FISCAL: TStringField;
    qryEmpresaNTERM: TStringField;
    qryEmpresaFLAG: TStringField;
    qryEmpresaDATA_CADASTRO: TStringField;
    qryEmpresaDATA_VALIDADE: TStringField;
    a: TStringField;
    qryEmpresaFILTRAR_EMPRESA_LOGIN: TStringField;
    qryEmpresaEMAIL: TStringField;
    qryEmpresaLANCAR_CARTAO_CREDITO: TStringField;
    qryEmpresaTRANSPORTADORA: TStringField;
    qryEmpresaAUTOPECAS: TStringField;
    qryEmpresaEMAIL_CONTADOR: TStringField;
    qryEmpresaTABELA_PRECO: TStringField;
    qryEmpresaINFORMAR_GTIN: TStringField;
    qryEmpresaATUALIZA_PR_VENDA: TStringField;
    qryEmpresaEXCLUI_PDV: TStringField;
    qryEmpresaRECOLHE_FCP: TStringField;
    qryEmpresaVENDA_SEMENTE: TStringField;
    qryEmpresaCHECA: TStringField;
    qryEmpresaVIRTUAL_ID_UF: TIntegerField;
    qryEmpresaVIRTUAL_UF: TStringField;
    qryEmpresaULTIMONSU: TStringField;
    qryEmpresaALIQ_ICMS: TFMTBCDField;
    qryEmpresaALIQ_PIS: TFMTBCDField;
    qryEmpresaALIQ_COF: TFMTBCDField;
    qryEmpresaCST_IPI: TStringField;
    qryEmpresaALIQ_IPI: TFMTBCDField;
    qryEmpresaLIMITE_DIARIO: TFMTBCDField;
    qryEmpresaDIFAL_ORIGEM: TFMTBCDField;
    qryEmpresaDIFAL_DESTINO: TFMTBCDField;
    qryEmpresaULTIMO_PEDIDO: TIntegerField;
    qryEmpresaTAXA_VENDA_PRAZO: TFMTBCDField;
    qryEmpresaDESCONTO_PROD_PROMO: TStringField;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
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
    procedure FormShow(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
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
  frmConsEmpresa: TfrmConsEmpresa;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento, uEmpresa;

procedure TfrmConsEmpresa.bbAlterarClick(Sender: TObject);
begin
  try
    bbAlterar.Enabled := false;
    FrmEmpresa := TFrmEmpresa.Create(Application);

    if qryEmpresa.IsEmpty then
      exit;

    FrmEmpresa.qryEmpresa.Close;
    FrmEmpresa.qryEmpresa.Params[0].AsInteger := qryEmpresaCODIGO.AsInteger;
    FrmEmpresa.qryEmpresa.Open;

    FrmEmpresa.qryEmpresa.edit;

    FrmEmpresa.Showmodal;
    Application.ProcessMessages;
  finally
    FrmEmpresa.Release;
    localiza;
    bbAlterar.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmConsEmpresa.bbNovoClick(Sender: TObject);
begin

  try
    bbNovo.Enabled := false;
    FrmEmpresa := TFrmEmpresa.Create(Application);
    FrmEmpresa.qryEmpresa.Close;
    FrmEmpresa.qryEmpresa.Params[0].Value := -1;
    FrmEmpresa.qryEmpresa.Open;
    FrmEmpresa.qryEmpresa.Insert;
    FrmEmpresa.qryEmpresaCODIGO.Value := Dados.Numerador('EMPRESA', 'CODIGO',
      'N', '', '');
    FrmEmpresa.Showmodal;
    Application.ProcessMessages;
  finally
    localiza;
    FrmEmpresa.Release;
    bbNovo.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmConsEmpresa.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.27);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.27);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.18);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.11);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.11);
end;

procedure TfrmConsEmpresa.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmConsEmpresa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    (Sender as TDBGrid).Canvas.Brush.Color := clGray;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsEmpresa.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin

  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Código';
  DBGrid1.Columns[1].Title.Caption := 'Fantasia';
  DBGrid1.Columns[2].Title.Caption := 'Razão';
  DBGrid1.Columns[3].Title.Caption := 'Cidade';
  DBGrid1.Columns[4].Title.Caption := 'CNPJ';
  DBGrid1.Columns[5].Title.Caption := 'IE';

  GroupBox1.Caption := 'F5 | Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  edtLoc.SetFocus;

  localiza;
end;

procedure TfrmConsEmpresa.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsEmpresa.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryEmpresa.Prior;
  if Key = VK_DOWN then
    qryEmpresa.Next;
end;

procedure TfrmConsEmpresa.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
end;

procedure TfrmConsEmpresa.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;


procedure TfrmConsEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
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
  if Key = vk_f5 then
  begin
    edtLoc.SetFocus
  end;
end;

procedure TfrmConsEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmConsEmpresa.FormShow(Sender: TObject);
begin
  Dados.qryCidade.Close;
  Dados.qryCidade.Open;

  tamanho;

  Dados.qryConfig.Close;
  Dados.qryConfig.Open;

  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;

end;

procedure TfrmConsEmpresa.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';

  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  vSql := ' Select * from empresa ' + ' where codigo>0 /*where*/' +
    ' /*ordem*/';

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CODIGO=' + edtLoc.Text;
      end;
    1:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and FANTASIA like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    2:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and RAZAO like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CIDADE like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CNPJ like ' + QuotedStr(edtLoc.Text + '%');
      end;
    5:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and IE like ' + QuotedStr(edtLoc.Text + '%');
      end;

  end;

  case idx of
    0:
      ordem := ' order by CODIGO';
    1:
      ordem := ' order by RAZAO';
    2:
      ordem := ' order by FANTASIA';
    3:
      ordem := ' order by CIDADE';
    4:
      ordem := ' order by CNPJ';
    5:
      ordem := ' order by IE';
  end;

  qryEmpresa.Close;
  qryEmpresa.SQL.Text := vSql;
  qryEmpresa.SQL.Text := StringReplace(qryEmpresa.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryEmpresa.Open;
end;

procedure TfrmConsEmpresa.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsEmpresa.TabSet2Click(Sender: TObject);
begin
  localiza;
end;

end.
