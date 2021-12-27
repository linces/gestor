unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, JPeg,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, ACBrBase, ACBrEnterTab,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, Vcl.ExtDlgs, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

type
  TfrmProduto = class(TForm)
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label11: TLabel;
    Image1: TImage;
    edtLoc: TEdit;
    Panel7: TPanel;
    Label8: TLabel;
    btnCancelar: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    btnNovo: TLabel;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    btnSair: TLabel;
    Splitter7: TSplitter;
    btnAlterar: TLabel;
    Splitter8: TSplitter;
    Splitter9: TSplitter;
    btnSalvar: TLabel;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosTIPO: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosGRUPO: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosULTFORN: TIntegerField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosALIQ_ICM: TCurrencyField;
    qryProdutosALIQ_PIS: TCurrencyField;
    qryProdutosALIQ_COF: TCurrencyField;
    qryProdutosPR_CUSTO: TFMTBCDField;
    qryProdutosMARGEM: TCurrencyField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosQTD_ATUAL: TFMTBCDField;
    qryProdutosQTD_MIN: TFMTBCDField;
    qryProdutosE_MEDIO: TFMTBCDField;
    qryProdutosCSTICMS: TStringField;
    qryProdutosCSTE: TStringField;
    qryProdutosCSTS: TStringField;
    qryProdutosCSTIPI: TStringField;
    qryProdutosCSOSN: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosCOMISSAO: TCurrencyField;
    qryProdutosDESCONTO: TCurrencyField;
    qryProdutosFOTO: TBlobField;
    qryProdutosATIVO: TStringField;
    qryProdutosCFOP: TStringField;
    qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdutosULT_COMPRA: TIntegerField;
    qryProdutosULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdutosPRECO_ATACADO: TFMTBCDField;
    qryProdutosQTD_ATACADO: TFMTBCDField;
    qryProdutosCOD_BARRA_ATACADO: TStringField;
    qryProdutosALIQ_IPI: TFMTBCDField;
    qryProdutosEMPRESA: TSmallintField;
    qryProdutosCEST: TStringField;
    qryProdutosGRADE: TStringField;
    qryProdutosEFISCAL: TStringField;
    qryProdutosPAGA_COMISSAO: TStringField;
    qryProdutosPESO: TFMTBCDField;
    qryProdutosCOMPOSICAO: TStringField;
    qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdutosINICIO_PROMOCAO: TDateField;
    qryProdutosFIM_PROMOCAO: TDateField;
    qryProdutosESTOQUE_INICIAL: TFMTBCDField;
    qryProdutosPR_VENDA_PRAZO: TFMTBCDField;
    qryProdutosPRECO_VARIAVEL: TStringField;
    qryProdutosAPLICACAO: TStringField;
    qryProdutosREDUCAO_BASE: TFMTBCDField;
    qryProdutosMVA: TFMTBCDField;
    qryProdutosFCP: TFMTBCDField;
    qryProdutosPRODUTO_PESADO: TStringField;
    qryProdutosSERVICO: TStringField;
    qryProdutosDT_CADASTRO: TDateField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosPR_CUSTO2: TFMTBCDField;
    qryProdutosPERC_CUSTO: TFMTBCDField;
    qryProdutosFK_PRINCIPIO_ATIVO: TIntegerField;
    qryProdutosREMEDIO: TStringField;
    qryProdutosTIPO_RESTAURANTE: TStringField;
    qryProdutosTEMPO_ESPERA: TIntegerField;
    qryProdutosCOMPLEMENTO: TStringField;
    qryProdutosRESTAUTANTE: TStringField;
    qryProdutosFK_TECIDO: TDateField;
    qryProdutosFK_MARCA: TIntegerField;
    qryProdutosPREFIXO_BALANCA: TStringField;
    qryProdutosCFOP_EXTERNO: TIntegerField;
    qryProdutosETQ: TStringField;
    qryProdutosFK_LCP: TStringField;
    qryProdutosISSQN: TFMTBCDField;
    Label26: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    Label12: TLabel;
    Label6: TLabel;
    edtPreco: TDBEdit;
    Label42: TLabel;
    edtComplementar: TDBEdit;
    Imagem: TDBImage;
    OpenPicture: TOpenPictureDialog;
    DBGridEh1: TDBGridEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure ImagemClick(Sender: TObject);
    procedure qryProdutosNewRecord(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryProdutosBeforePost(DataSet: TDataSet);
  private
    procedure GravarItem;
    procedure CancelarItem;
    procedure NovoItem;
    procedure AlteraItem;
    procedure LocalizaItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmProduto.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmProduto.ImagemClick(Sender: TObject);
var
  JPG: TJPegImage;
  Bmp: TBitmap;
begin
  if (qryProdutos.State in dsEditModes) then
  begin
    OpenPicture.Execute;
    if OpenPicture.FileName <> '' then
    begin
      JPG := TJPegImage.Create;
      JPG.LoadFromFile(OpenPicture.FileName);
      Bmp := TBitmap.Create;
      Bmp.Assign(JPG);
      JPG.Free;
      Imagem.Picture.Bitmap.Assign(Bmp);
      Bmp.Free;
    end;
  end;
end;

procedure TfrmProduto.edtLocChange(Sender: TObject);
begin
  LocalizaItem;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case PageControl1.ActivePageIndex of
    0:
      begin
        if Key = vk_f3 then
          NovoItem;
        if Key = vk_f4 then
          AlteraItem;
        if Key = vk_f12 then
          btnSairClick(self);
        exit;

      end;
    1:
      begin
        if Key = vk_f5 then
          GravarItem;
        if Key = vk_f6 then
          CancelarItem;
        exit;
      end;
  end;
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  LocalizaItem;
end;

procedure TfrmProduto.LocalizaItem;
begin
  qryProdutos.close;
  qryProdutos.Params[0].Value := edtLoc.Text + '%';
  qryProdutos.Open;
end;

procedure TfrmProduto.NovoItem;
begin
  qryProdutos.Insert;
  PageControl1.ActivePageIndex := 1;
  edtDescricao.SetFocus;
end;

procedure TfrmProduto.AlteraItem;
begin
  qryProdutos.Edit;
  PageControl1.ActivePageIndex := 1;
  edtDescricao.SetFocus;
end;

procedure TfrmProduto.GravarItem;
begin
  try

    if trim(qryProdutosDESCRICAO.Value) = '' then
      raise Exception.Create('Informe o Produto!');

    qryProdutos.Post;
    Dados.Conexao.CommitRetaining;
    PageControl1.ActivePageIndex := 0;
  except
    on e: Exception do
      raise Exception.Create(e.message);
  end;
end;

procedure TfrmProduto.CancelarItem;
begin
  if qryProdutos.State in dsEditModes then
    qryProdutos.Cancel;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmProduto.btnAlterarClick(Sender: TObject);
begin
  AlteraItem;
end;

procedure TfrmProduto.btnCancelarClick(Sender: TObject);
begin
  CancelarItem;
end;

procedure TfrmProduto.btnNovoClick(Sender: TObject);
begin
  NovoItem;
end;

procedure TfrmProduto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmProduto.btnSalvarClick(Sender: TObject);
begin
  GravarItem;
end;

procedure TfrmProduto.qryProdutosAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmProduto.qryProdutosBeforePost(DataSet: TDataSet);
begin
  qryProdutosPR_CUSTO2.AsFloat := qryProdutosPR_VENDA.AsFloat;
  qryProdutosPERC_CUSTO.AsFloat := 0;
  qryProdutosPR_CUSTO.AsFloat := qryProdutosPR_VENDA.AsFloat;
  qryProdutosMARGEM.AsFloat := 0;
end;

procedure TfrmProduto.qryProdutosNewRecord(DataSet: TDataSet);
begin
  qryProdutosCODIGO.Value := Dados.Numerador('PRODUTO', 'CODIGO');
  qryProdutosATIVO.Value := 'S';
  qryProdutosREFERENCIA.Value := qryProdutosCODIGO.AsString;
  qryProdutosCODBARRA.Value := 'SEM GTIN';
  qryProdutosRESTAUTANTE.Value := 'S';
  qryProdutosGRADE.Value := 'N';
  qryProdutosTIPO_RESTAURANTE.Value := 'S';
  qryProdutosREMEDIO.Value := 'N';
  qryProdutosPR_VENDA.Value := 0;
  qryProdutosMVA.Value := 0;
  qryProdutosFCP.Value := 0;
  qryProdutosREDUCAO_BASE.Value := 0;
  qryProdutosAPLICACAO.Value := '';
  qryProdutosPR_CUSTO.Value := 0;
  qryProdutosESTOQUE_INICIAL.Value := 0;
  qryProdutosQTD_MIN.Value := 1;
  qryProdutosE_MEDIO.Value := 0;
  qryProdutosNCM.Value := '00000000';
  qryProdutosMARGEM.Value := 0;
  qryProdutosQTD_ATUAL.Value := 0;
  qryProdutosQTD_ATACADO.Value := 0;
  qryProdutosPR_CUSTO_ANTERIOR.Value := 0;
  qryProdutosPR_VENDA_ANTERIOR.Value := 0;
  qryProdutosULT_COMPRA.Value := 0;
  qryProdutosGRUPO.Value := 0;
  qryProdutosUNIDADE.Value := 'UN';
  qryProdutosULT_COMPRA_ANTERIOR.Value := 0;
  qryProdutosEMPRESA.Value := 1;
  qryProdutosPRECO_ATACADO.Value := 0;
  qryProdutosCFOP.Value := '5102';
  qryProdutosCFOP_EXTERNO.AsString := '6102';
  qryProdutosALIQ_ICM.Value := 0;
  qryProdutosALIQ_PIS.Value := 0;
  qryProdutosALIQ_COF.Value := 0;
  qryProdutosALIQ_IPI.Value := 0;
  qryProdutosCSTICMS.Value := '041';
  qryProdutosCSTE.Value := '07';
  qryProdutosCSTS.Value := '07';
  qryProdutosCSTIPI.Value := '53';
  qryProdutosCSOSN.Value := '102';
  qryProdutosCOMISSAO.Value := 0;
  qryProdutosDESCONTO.Value := 0;
  qryProdutosPAGA_COMISSAO.Value := 'N';
  qryProdutosEFISCAL.Value := 'S';
  qryProdutosSERVICO.Value := 'N';
  qryProdutosPRECO_VARIAVEL.Value := 'N';
  qryProdutosCOMPOSICAO.Value := 'N';
  qryProdutosDT_CADASTRO.Value := Date;
  qryProdutosTIPO.Value := '00-MERCADORIA PARA REVENDA';
end;

end.
