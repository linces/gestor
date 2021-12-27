unit uDelivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter, frxClass,
  frxDBSet, frxExportPDF, frxExportBaseDialog, ACBrDFeReport,
  ACBrDFeDANFeReport, Vcl.Mask, Vcl.Tabs;

type
  TfrmComanda = class(TForm)
    Panel1: TPanel;
    qryDelivery: TFDQuery;
    dsDelivery: TDataSource;
    btnImportar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    DBGrid1: TDBGridEh;
    qryDeliveryMESA: TStringField;
    qryDeliveryNOME: TStringField;
    qryDeliveryTOTAL: TFMTBCDField;
    qryDeliveryCODIGO: TIntegerField;
    qryDeliveryDATA_HORA: TSQLTimeStampField;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    idx: integer;
    vOrdem: string;
    vsql: string;
    procedure localiza;
    procedure AtualizaSituacao(codigo: integer);
  public
    { Public declarations }
  end;

var
  frmComanda: TfrmComanda;

implementation

{$R *.dfm}

uses uPDV, Udados;

procedure TfrmComanda.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmComanda.btnFiltrarClick(Sender: TObject);
begin
  localiza;
end;

procedure TfrmComanda.AtualizaSituacao(codigo: integer);
begin
  dados.qryExecute.close;
  dados.qryExecute.SQL.Text :=
    'update comanda_pessoa set PDV=''S'' where codigo=:cod';
  dados.qryExecute.Params[0].Value := codigo;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmComanda.btnImportarClick(Sender: TObject);
var
  numero: string;
  vitem: integer;
  qtd: real;
begin
  try
    Frmpdv.qryItem.DisableControls;
    btnImportar.Enabled := false;
    if not Frmpdv.qryItem.IsEmpty then
    begin
      ShowMessage('Atenção! Não é possivel importar Comanda.' +
        #13'+ Venda atual possui ITENS cadastrados!');
      exit;
    end;

    Frmpdv.PodeAtualizarEstoque := true;
    numero := qryComandaCODIGO.AsString;

    if qryComanda.IsEmpty then
    begin
      ShowMessage('Comanda não encontrado!');
      exit;
    end;

    if not(Frmpdv.qryVenda.State in dsEditModes) then
      Frmpdv.qryVenda.Edit;
    Frmpdv.qryVendaFK_VENDEDOR.Value := dados.qryConfigVENDEDOR_PADRAO.Value;
    Frmpdv.qryVendaID_CLIENTE.Value := dados.qryConfigCLIENTE_PADRAO.Value;
    Frmpdv.qryVenda.Post;
    dados.Conexao.CommitRetaining;

    qryItensCo.close;
    qryItensCo.Params[0].Value := qryComandaCODIGO.Value;
    qryItensCo.Open;

    qryItensCo.First;
    while not qryItensCo.Eof do
    begin
      dados.qryConsulta.close;
      dados.qryConsulta.SQL.Text :=
        ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
        + ' where ' + ' pr.codigo=:id ';
      dados.qryConsulta.Params[0].Value := qryItensCoFK_PRODUTO.AsInteger;
      dados.qryConsulta.Open;
      qtd := dados.qryConsulta.FieldByName('QTD_ATUAL').AsFloat;

      Frmpdv.qryItem.Last;
      vitem := Frmpdv.qryItemITEM.AsInteger + 1;
      Frmpdv.qryItem.Append;
      Frmpdv.qryItemCODIGO.AsFloat := dados.Numerador('VENDAS_DETALHE',
        'CODIGO', 'N', '', '');
      Frmpdv.qryItemID_PRODUTO.Value := qryItensCoFK_PRODUTO.Value;
      Frmpdv.qryItemFKVENDA.Value := Frmpdv.qryVendaCODIGO.Value;
      Frmpdv.qryItemITEM.Value := vitem;
      Frmpdv.qryItemQTD.Value := qryItensCoQTD.Value;

      Frmpdv.qryItemUNIDADE.AsString := dados.qryConsulta.FieldByName
        ('UNIDADE').AsString;
      Frmpdv.qryItemPRECO.AsFloat := qryItensCoPRECO.AsFloat;
      Frmpdv.qryItemVALOR_ITEM.AsFloat := Frmpdv.qryItemQTD.AsFloat *
        Frmpdv.qryItemPRECO.AsFloat;

      Frmpdv.qryItemCOD_BARRA.Value := dados.qryConsulta.FieldByName
        ('CODBARRA').AsString;

      Frmpdv.qryItemTOTAL.AsFloat := Frmpdv.qryItemVALOR_ITEM.AsFloat -
        Frmpdv.qryItemVDESCONTO.AsFloat;
      Frmpdv.qryItem.Post;
      dados.Conexao.CommitRetaining;

      qryItensCo.Next;
    end;

    Frmpdv.qryItem.EnableControls;

    AtualizaSituacao(qryComandaCODIGO.Value);
    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    close;
  finally
    btnImportar.Enabled := true;
  end;
end;

procedure TfrmComanda.localiza;
var
  filtro: string;
begin
  if vsql = '' then

    vsql := qryComanda.SQL.Text;

  case TabSet1.TabIndex of
    0:
      filtro := ' AND CO.PDV<>''S''';
    1:
      filtro := ' AND CO.PDV=''S''';
  end;

  qryComanda.close;
  qryComanda.SQL.Text := vsql;
  qryComanda.SQL.Text := StringReplace(qryComanda.SQL.Text, '/*where*/', filtro,
    [rfReplaceAll]);
  qryComanda.ParamByName('nome').Value := edtLoc.Text + '%';
  qryComanda.Open;

end;

procedure TfrmComanda.TabSet1Click(Sender: TObject);
begin
  localiza;
end;

procedure TfrmComanda.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmComanda.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmComanda.FormShow(Sender: TObject);
begin
  edtLoc.SetFocus;
  localiza;
end;

end.
