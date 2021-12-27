unit uImportar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.db, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  ACBrBase, ACBrEnterTab;

type
  TfrmImportar = class(TForm)
    qryPedido: TFDQuery;
    dsPedido: TDataSource;
    qryOrcamento: TFDQuery;
    dsOrcamento: TDataSource;
    qryOS_Detalhe: TFDQuery;
    qryOS_DetalheCODIGO: TIntegerField;
    qryOS_DetalheFK_OS_MASTER: TIntegerField;
    qryOS_DetalheFK_FUNCIONARIO: TIntegerField;
    qryOS_DetalheFK_PRODUTO: TIntegerField;
    qryOS_DetalheDATA_INICIO: TDateField;
    qryOS_DetalheHORA_INICIO: TTimeField;
    qryOS_DetalheDATA_TERMINO: TDateField;
    qryOS_DetalheHORA_TERMINO: TTimeField;
    qryOS_DetalheDISCRIMINACAO: TStringField;
    qryOS_DetalheFK_USUARIO: TIntegerField;
    qryOS_DetalheFK_EMPRESA: TIntegerField;
    qryOS_DetalheTIPO: TStringField;
    qryOS_DetalheSITUACAO: TStringField;
    qryPedidoCODIGO: TIntegerField;
    qryPedidoDATA_EMISSAO: TDateField;
    qryPedidoDATA_SAIDA: TDateField;
    qryPedidoID_CLIENTE: TIntegerField;
    qryPedidoFK_USUARIO: TIntegerField;
    qryPedidoFK_CAIXA: TIntegerField;
    qryPedidoFK_VENDEDOR: TIntegerField;
    qryPedidoCPF_NOTA: TStringField;
    qryPedidoSUBTOTAL: TFMTBCDField;
    qryPedidoTIPO_DESCONTO: TStringField;
    qryPedidoDESCONTO: TFMTBCDField;
    qryPedidoTROCO: TFMTBCDField;
    qryPedidoDINHEIRO: TFMTBCDField;
    qryPedidoTOTAL: TFMTBCDField;
    qryPedidoOBSERVACOES: TMemoField;
    qryPedidoSITUACAO: TStringField;
    qryPedidoFKEMPRESA: TIntegerField;
    qryPedidoPERCENTUAL: TFMTBCDField;
    qryPedidoTIPO: TStringField;
    qryPedidoNECF: TIntegerField;
    qryPedidoFKORCAMENTO: TIntegerField;
    qryPedidoLOTE: TIntegerField;
    qryPedidoGERA_FINANCEIRO: TStringField;
    qryPedidoPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryPedidoACRESCIMO: TFMTBCDField;
    qryPedidoFK_TABELA: TIntegerField;
    qryPedidoPEDIDO: TStringField;
    qryPedidoFK_OS: TIntegerField;
    qryOS_DetalheQTD: TFMTBCDField;
    qryOS_DetalhePRECO: TFMTBCDField;
    qryOS_DetalheTOTAL: TFMTBCDField;
    qryOs_Master: TFDQuery;
    qryOs_MasterCODIGO: TIntegerField;
    qryOs_MasterDATA_INICIO: TDateField;
    qryOs_MasterHORA_INICIO: TTimeField;
    qryOs_MasterPREVISAO_ENTREGA: TDateField;
    qryOs_MasterDATA_TERMINO: TDateField;
    qryOs_MasterHORA_TERMINO: TTimeField;
    qryOs_MasterDATA_ENTREGA: TDateField;
    qryOs_MasterHORA_ENTREGA: TTimeField;
    qryOs_MasterFK_ATENDENDE: TIntegerField;
    qryOs_MasterPROBLEMA: TMemoField;
    qryOs_MasterOBSERVACOES: TMemoField;
    qryOs_MasterFK_EMPRESA: TIntegerField;
    qryOs_MasterFK_USUARIO: TIntegerField;
    qryOs_MasterDOCUMENTO: TStringField;
    qryOs_MasterNOME: TStringField;
    qryOs_MasterFONE1: TStringField;
    qryOs_MasterFONE2: TStringField;
    qryOs_MasterSITUACAO: TStringField;
    qryOs_MasterNUMERO_SERIE: TStringField;
    qryOs_MasterDESCRICAO: TStringField;
    qryOs_MasterMODELO: TStringField;
    qryOs_MasterMARCA: TStringField;
    qryOs_MasterANO: TIntegerField;
    qryOs_MasterPLACA: TStringField;
    qryOs_MasterKM: TFMTBCDField;
    qryOs_MasterSUBTOTAL: TFMTBCDField;
    qryOs_MasterSUBTOTAL_PECAS: TFMTBCDField;
    qryOs_MasterSUBTOTAL_SERVICOS: TFMTBCDField;
    qryOs_MasterVL_DESC_PECAS: TFMTBCDField;
    qryOs_MasterVL_DESC_SERVICOS: TFMTBCDField;
    qryOs_MasterDESC_PERC_PECAS: TFMTBCDField;
    qryOs_MasterDESC_PERC_SERVICOS: TFMTBCDField;
    qryOs_MasterTOTAL_SERVICOS: TFMTBCDField;
    qryOs_MasterTOTAL_PRODUTOS: TFMTBCDField;
    qryOs_MasterTOTAL_GERAL: TFMTBCDField;
    qryOs_MasterENDERECO: TStringField;
    qryOs_MasterBAIRRO: TStringField;
    qryOs_MasterCIDADE: TStringField;
    qryOs_MasterUF: TStringField;
    qryOs_MasterDATA_EMISSAO: TDateField;
    qryOs_MasterNUMERO: TStringField;
    qryOs_MasterNOME_TIME: TStringField;
    qryOs_MasterTIPO_SERVICO: TStringField;
    qryOs_MasterFK_TIPO_TECIDO: TIntegerField;
    qryOs_MasterQUANTIDADE: TIntegerField;
    qryOs_MasterFK_PRODUTO: TIntegerField;
    qryOs_MasterFOTO: TBlobField;
    qryOs_MasterFK_CLIENTE: TIntegerField;
    DsOs_Master: TDataSource;
    qryOrcamentoCODIGO: TIntegerField;
    qryOrcamentoDATA: TDateField;
    qryOrcamentoFKVENDEDOR: TIntegerField;
    qryOrcamentoFK_CLIENTE: TIntegerField;
    qryOrcamentoCLIENTE: TStringField;
    qryOrcamentoTELEFONE: TStringField;
    qryOrcamentoCELULAR: TStringField;
    qryOrcamentoENDERECO: TStringField;
    qryOrcamentoNUMERO: TStringField;
    qryOrcamentoBAIRRO: TStringField;
    qryOrcamentoCIDADE: TStringField;
    qryOrcamentoUF: TStringField;
    qryOrcamentoCNPJ: TStringField;
    qryOrcamentoFORMA_PAGAMENTO: TStringField;
    qryOrcamentoVALIDADE: TSmallintField;
    qryOrcamentoOBS: TMemoField;
    qryOrcamentoSITUACAO: TStringField;
    qryOrcamentoTOTAL: TFMTBCDField;
    qryOrcamentoCEP: TStringField;
    qryOrcamentoFKEMPRESA: TIntegerField;
    qryOrcamentoSUBTOTAL: TFMTBCDField;
    qryOrcamentoPERCENTUAL: TFMTBCDField;
    qryOrcamentoDESCONTO: TFMTBCDField;
    qryOrcamentoCODIGO_WEB: TIntegerField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    btnPedido: TBitBtn;
    DBGrid2: TDBGrid;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    btnOrcamento: TBitBtn;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    btnOS: TBitBtn;
    DBGrid3: TDBGrid;
    qryItensO: TFDQuery;
    qryItensOCODIGO: TIntegerField;
    qryItensOFK_ORCAMENTO: TIntegerField;
    qryItensOFK_PRODUTO: TIntegerField;
    qryItensOQTD: TFMTBCDField;
    qryItensOPRECO: TFMTBCDField;
    qryItensOTOTAL: TFMTBCDField;
    qryItensOITEM: TSmallintField;
    qryItensOVIRTUAL_PRODUTO: TStringField;
    qryItensOVIRTUAL_PRECO: TFMTBCDField;
    qryItensOVIRTUAL_UNIDADE: TStringField;
    qryItensOVIRTUAL_LOCAL: TStringField;
    qryItensOVIRTUAL_REFERENCIA: TStringField;
    qryItensOFK_GRADE: TIntegerField;
    qryItensOGRADE: TStringField;
    ACBrEnterTab1: TACBrEnterTab;
    qryItens: TFDQuery;
    qryItensCODIGO: TIntegerField;
    qryItensFKVENDA: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensITEM: TSmallintField;
    qryItensCOD_BARRA: TStringField;
    qryItensQTD: TFMTBCDField;
    qryItensE_MEDIO: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensVALOR_ITEM: TFMTBCDField;
    qryItensVDESCONTO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensSITUACAO: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensQTD_DEVOLVIDA: TFMTBCDField;
    qryItensACRESCIMO: TFMTBCDField;
    qryItensOS: TStringField;
    qryItensFK_GRADE: TIntegerField;
    qryItensID_PRODUTO_SIMILAR: TIntegerField;
    qryItensID_SERIAL: TIntegerField;
    procedure btnPedidoClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOSClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ApagaItensVenda;
    procedure ImportaItensOrcamento;
    procedure ImportaOS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportar: TfrmImportar;

implementation

{$R *.dfm}

uses Udados, uPDV;

procedure TfrmImportar.btnPedidoClick(Sender: TObject);
begin

  If qryPedido.IsEmpty then
    exit;

  FrmPDV.PodeAtualizarEstoque := false;

  if qryPedidoSITUACAO.Value = 'C' then
  begin
    ShowMessage('Não é possivel importar Pedido Cancelado');
    exit;
  end;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Add('Select SITUACAO from nfce_master');
  Dados.qryExecute.SQL.Add('where');
  Dados.qryExecute.SQL.Add('fk_venda=:codigo');
  Dados.qryExecute.Params[0].Value := qryPedidoCODIGO.Value;
  Dados.qryExecute.Open;

  if (trim(Dados.qryExecute.FieldByName('SITUACAO').AsString) <> 'O') and
    (trim(Dados.qryExecute.FieldByName('SITUACAO').AsString) <> '') and
    (trim(Dados.qryExecute.FieldByName('SITUACAO').AsString) <> 'G') then
  begin
    ShowMessage('Já existe NFC-e gerada para esta venda!');
    exit;
  end;

  try

    Dados.EstornaFinanceiro(FrmPDV.qryVendaCODIGO.Value);

    Dados.qryExecute.Close;
    Dados.qryExecute.SQL.Text :=
      'update vendas_master set SITUACAO=''X'', FLAG_NFCE=''N'', TIPO_DESCONTO=''D'', FK_USUARIO=:USU, FK_CAIXA=:CAIXA, LOTE=:LT WHERE CODIGO=:CODIGO';
    Dados.qryExecute.Params[0].Value := Dados.idUsuario;
    Dados.qryExecute.Params[1].Value := Dados.idCaixa;
    Dados.qryExecute.Params[2].Value := Dados.Lote;
    Dados.qryExecute.Params[3].Value := qryPedidoCODIGO.Value;
    Dados.qryExecute.ExecSQL;
    Dados.Conexao.CommitRetaining;

    FrmPDV.qryVenda.Close;
    FrmPDV.qryVenda.Params[0].Value := qryPedidoCODIGO.Value;
    FrmPDV.qryVenda.Open;

    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    Close;

  finally
    qryPedido.Close;
    qryPedido.Open;

  end;
end;

procedure TfrmImportar.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportar.Button1Click(Sender: TObject);
begin

  PageControl1.ActivePage := TabSheet1;
end;

procedure TfrmImportar.Button2Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmImportar.Button3Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet3;
end;

procedure TfrmImportar.DBGrid1DblClick(Sender: TObject);
begin
  btnOrcamento.Click;
end;

procedure TfrmImportar.DBGrid2DblClick(Sender: TObject);
begin
  btnPedido.Click;
end;

procedure TfrmImportar.DBGrid3DblClick(Sender: TObject);
begin
  btnOS.Click;
end;

procedure TfrmImportar.DBGridEh1DblClick(Sender: TObject);
begin
  btnPedido.Click;
end;

procedure TfrmImportar.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmImportar.ApagaItensVenda;
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'delete from VENDAS_DETALHE where fkvenda=:codigo';
  Dados.qryExecute.Params[0].Value := FrmPDV.qryVendaCODIGO.Value;
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmImportar.ImportaItensOrcamento;
var
  qtd: Real;
  vitem: Integer;
begin
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual, pr.servico from produto pr '
    + ' where ' + ' pr.codigo=:id ';
  Dados.qryConsulta.Params[0].Value := qryItensOFK_PRODUTO.AsInteger;
  Dados.qryConsulta.Open;
  qtd := Dados.qryConsulta.FieldByName('QTD_ATUAL').AsFloat;
  if not(Dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S') then
    qtd := 1;
  if Dados.qryConsulta.FieldByName('servico').AsString = 'S' then
    qtd := 1;
  if qtd > 0 then
  begin
    FrmPDV.qryItem.Last;
    vitem := FrmPDV.qryItemITEM.AsInteger + 1;
    FrmPDV.qryItem.Append;
    FrmPDV.qryItemCODIGO.AsFloat := Dados.Numerador('VENDAS_DETALHE', 'CODIGO',
      'N', '', '');
    FrmPDV.qryItemID_PRODUTO.Value := qryItensOFK_PRODUTO.Value;
    FrmPDV.qryItemFKVENDA.Value := FrmPDV.qryVendaCODIGO.Value;
    FrmPDV.qryItemITEM.Value := vitem;
    FrmPDV.qryItemQTD.Value := qryItensOQTD.Value;
    FrmPDV.qryItemFK_GRADE.Value := qryItensOFK_GRADE.Value;
    if Dados.qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value = 'S' then
    begin
      if qtd < qryItensOQTD.Value then
        FrmPDV.qryItemQTD.Value := qtd;
    end;
    FrmPDV.qryItemUNIDADE.AsString := Dados.qryConsulta.FieldByName
      ('UNIDADE').AsString;
    FrmPDV.qryItemPRECO.Value := qryItensOPRECO.AsFloat;
    FrmPDV.qryItemVALOR_ITEM.AsFloat := FrmPDV.qryItemQTD.AsFloat *
      FrmPDV.qryItemPRECO.AsFloat;
    FrmPDV.qryItemCOD_BARRA.Value := Dados.qryConsulta.FieldByName
      ('CODBARRA').AsString;
    FrmPDV.qryItemTOTAL.AsFloat := FrmPDV.qryItemVALOR_ITEM.AsFloat -
      FrmPDV.qryItemVDESCONTO.AsFloat;
    FrmPDV.qryItem.Post;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmImportar.ImportaOS;
var
  qtd: Real;
  vitem: Integer;
begin
  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
    + ' where ' + ' pr.codigo=:id ';
  Dados.qryConsulta.Params[0].Value := qryOS_DetalheFK_PRODUTO.AsInteger;
  Dados.qryConsulta.Open;
  qtd := Dados.qryConsulta.FieldByName('QTD_ATUAL').AsFloat;
  FrmPDV.qryItem.Last;
  vitem := FrmPDV.qryItemITEM.AsInteger + 1;
  FrmPDV.qryItem.Append;
  FrmPDV.qryItemCODIGO.AsFloat := Dados.Numerador('VENDAS_DETALHE', 'CODIGO',
    'N', '', '');
  FrmPDV.qryItemID_PRODUTO.Value := qryOS_DetalheFK_PRODUTO.Value;
  FrmPDV.qryItemFKVENDA.Value := FrmPDV.qryVendaCODIGO.Value;
  FrmPDV.qryItemITEM.Value := vitem;
  FrmPDV.qryItemQTD.Value := qryOS_DetalheQTD.Value;
  FrmPDV.qryItemUNIDADE.AsString := Dados.qryConsulta.FieldByName
    ('UNIDADE').AsString;
  FrmPDV.qryItemPRECO.Value := qryOS_DetalhePRECO.Value;
  FrmPDV.qryItemVALOR_ITEM.AsFloat := FrmPDV.qryItemQTD.AsFloat *
    FrmPDV.qryItemPRECO.AsFloat;
  FrmPDV.qryItemCOD_BARRA.Value := Dados.qryConsulta.FieldByName
    ('CODBARRA').AsString;
  FrmPDV.qryItemTOTAL.AsFloat := FrmPDV.qryItemVALOR_ITEM.AsFloat -
    FrmPDV.qryItemVDESCONTO.AsFloat;
  FrmPDV.qryItemOS.Value := 'S';
  FrmPDV.qryItem.Post;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmImportar.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmImportar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F2 then
    btnPedido.Click;

  if Key = VK_F3 then
    btnOrcamento.Click;

  if Key = VK_F4 then
    btnOS.Click;
  if Key = VK_F9 then
    btnFiltrarClick(self);

  if Key = vk_escape then
    Close;

end;

procedure TfrmImportar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
    if Key = #13 then
      btnPedido.Click;

  end;
end;

procedure TfrmImportar.FormShow(Sender: TObject);
begin
  maskInicio.EditText := DateToStr(date);
  maskFim.EditText := DateToStr(date);
  btnFiltrarClick(self);
end;

procedure TfrmImportar.PageControl1Change(Sender: TObject);
begin
  btnFiltrar.Click;
end;

procedure TfrmImportar.btnOSClick(Sender: TObject);
var
  numero: string;
begin

  if qryOs_Master.IsEmpty then
    exit;

  numero := qryOs_MasterCODIGO.AsString;

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    'SELECT CODIGO FROM VENDAS_MASTER WHERE FK_OS=:COD and situacao<>''C''';
  Dados.qryConsulta.Params[0].Value := numero;
  Dados.qryConsulta.Open;

  if not Dados.qryConsulta.IsEmpty then
    raise Exception.Create('OS já foi importada para o Pedido nº' +
      Dados.qryConsulta.Fields[0].AsString);

  FrmPDV.PodeAtualizarEstoque := true;

  Dados.qryConsulta.Close;
  Dados.qryConsulta.SQL.Text :=
    'select * FROM OS_MASTER WHERE CODIGO=:NUM AND SITUACAO=''F''';
  Dados.qryConsulta.Params[0].AsString := numero;
  Dados.qryConsulta.Open;

  if Dados.qryConsulta.IsEmpty then
  begin
    ShowMessage('OS não encontrada!');
    exit;
  end;

  Dados.Conexao.CommitRetaining;

  if not FrmPDV.qryItem.IsEmpty then
  begin
    If Application.messageBox('Deseja Excluir os Itens?', 'Confirmação',
      mb_YesNo + mb_iconquestion) = idyes then
    begin
      ApagaItensVenda;
    end;
  end;

  if not(FrmPDV.qryVenda.State in dsEditModes) then
    FrmPDV.qryVenda.Edit;
  FrmPDV.qryVendaFK_VENDEDOR.Value := Dados.qryConfigVENDEDOR_PADRAO.Value;;
  FrmPDV.qryVendaID_CLIENTE.Value := Dados.qryConfigCLIENTE_PADRAO.Value;
  FrmPDV.qryVendaFK_OS.Value := qryOs_MasterCODIGO.Value;
  FrmPDV.qryVenda.Post;
  Dados.Conexao.CommitRetaining;

  qryOS_Detalhe.Close;
  qryOS_Detalhe.Params[0].Value := Dados.qryConsulta.FieldByName
    ('codigo').Value;
  qryOS_Detalhe.Open;

  qryOS_Detalhe.First;

  while not qryOS_Detalhe.Eof do
  begin
    ImportaOS;
    qryOS_Detalhe.Next;
  end;

  if not(FrmPDV.qryVenda.State in dsEditModes) then
    FrmPDV.qryVenda.Edit;

  FrmPDV.qryVendaDESCONTO.AsFloat := qryOs_MasterVL_DESC_SERVICOS.AsFloat +
    qryOs_MasterVL_DESC_PECAS.AsFloat;

  FrmPDV.qryVendaTOTAL.AsFloat := FrmPDV.qryVendaSUBTOTAL.AsFloat -
    FrmPDV.qryVendaDESCONTO.AsFloat;

  FrmPDV.qryVenda.Post;
  Dados.Conexao.CommitRetaining;

  Application.ProcessMessages;
  ShowMessage('Importação realizada com sucesso!');
  Close;

end;

procedure TfrmImportar.btnFiltrarClick(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
    0:
      begin
        qryPedido.Close;
        qryPedido.Params[0].Value := maskInicio.EditText;
        qryPedido.Params[1].Value := maskFim.EditText;
        qryPedido.Open;
      end;
    1:
      begin
        qryOrcamento.Close;
        qryOrcamento.Params[0].Value := maskInicio.EditText;
        qryOrcamento.Params[1].Value := maskFim.EditText;
        qryOrcamento.Open;
      end;
    2:
      begin
        qryOs_Master.Close;
        qryOs_Master.Params[0].Value := maskInicio.EditText;
        qryOs_Master.Params[1].Value := maskFim.EditText;
        qryOs_Master.Open;
      end;

  end;
end;

procedure TfrmImportar.btnOrcamentoClick(Sender: TObject);
var
  numero: string;
begin

  if qryOrcamento.IsEmpty then
    exit;

  if not FrmPDV.qryItem.IsEmpty then
  begin
    If Application.messageBox('Deseja Excluir os Itens do PDV?', 'Confirmação',
      mb_YesNo + mb_iconquestion) = idyes then
    begin
      ApagaItensVenda;
    end;
  end;

  Dados.Conexao.CommitRetaining;

  FrmPDV.PodeAtualizarEstoque := true;
  numero := qryOrcamentoCODIGO.AsString;

  if not(FrmPDV.qryVenda.State in dsEditModes) then
    FrmPDV.qryVenda.Edit;

  FrmPDV.qryVendaOBSERVACOES.Value := qryOrcamentoOBS.AsString;

  FrmPDV.qryVendaFK_VENDEDOR.Value := qryOrcamentoFKVENDEDOR.Value;
  if (qryOrcamentoFK_CLIENTE.Value = 0) or (qryOrcamentoFK_CLIENTE.IsNull) then
    FrmPDV.qryVendaID_CLIENTE.Value := Dados.qryConfigCLIENTE_PADRAO.Value
  else
    FrmPDV.qryVendaID_CLIENTE.Value := qryOrcamentoFK_CLIENTE.Value;
  FrmPDV.qryVendaNOME.Value := qryOrcamentoCLIENTE.Value;

  FrmPDV.qryVenda.Post;
  Dados.Conexao.CommitRetaining;

  qryItensO.Close;
  qryItensO.Params[0].Value := qryOrcamentoCODIGO.AsInteger;
  qryItensO.Open;

  qryItensO.First;
  while not qryItensO.Eof do
  begin
    ImportaItensOrcamento;
    qryItensO.Next;
  end;

  if not(FrmPDV.qryVenda.State in dsEditModes) then
    FrmPDV.qryVenda.Edit;

  FrmPDV.qryVendaDESCONTO.AsFloat := qryOrcamentoDESCONTO.AsFloat;

  FrmPDV.qryVendaTOTAL.AsFloat := FrmPDV.qryVendaSUBTOTAL.AsFloat -
    FrmPDV.qryVendaDESCONTO.AsFloat;

  if FrmPDV.qryVendaSUBTOTAL.AsFloat > 0 then
    FrmPDV.qryVendaPERCENTUAL.AsFloat :=
      (FrmPDV.qryVendaDESCONTO.AsFloat / FrmPDV.qryVendaSUBTOTAL.AsFloat) * 100;

  FrmPDV.qryVenda.Post;
  Dados.Conexao.CommitRetaining;

  Application.ProcessMessages;
  ShowMessage('Importação realizada com sucesso!');
  Close;
end;

end.
{ TODO -oImportar -cCorreção : 22-07-2019-Correção de pedido de vendas e os }
