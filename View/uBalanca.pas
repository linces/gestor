unit uBalanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ACBrCargaBal, ACBrBase, ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmBalanca = class(TForm)
    ACBrCargaBal1: TACBrCargaBal;
    cbxModelo: TComboBox;
    edtDiretorio: TEdit;
    btnEscolherDiretorio: TButton;
    btnGerarArquivo: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    qryProdutos: TFDQuery;
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
    Label3: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
    procedure btnEscolherDiretorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ACBrCargaBal1Progresso(Mensagem: String;
      ProgressoAtual, ProgressoTotal: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalanca: TfrmBalanca;

implementation

uses
  FileCtrl, TypInfo, Udados;

{$R *.dfm}

procedure TfrmBalanca.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmBalanca.FormCreate(Sender: TObject);
var
  I: TACBrCargaBalModelo;
begin
  edtDiretorio.Clear;

  cbxModelo.Items.Clear;
  for I := Low(TACBrCargaBalModelo) to High(TACBrCargaBalModelo) do
    cbxModelo.Items.Add(GetEnumName(TypeInfo(TACBrCargaBalModelo), Integer(I)));

  cbxModelo.ItemIndex := 0;
end;

procedure TfrmBalanca.btnEscolherDiretorioClick(Sender: TObject);
var
  Diretorio: String;
begin
  if SelectDirectory('Selecione o diretório onde serão gerados os arquivos:',
    '', Diretorio) then
    edtDiretorio.Text := Diretorio;
end;

procedure TfrmBalanca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBalanca.btnGerarArquivoClick(Sender: TObject);
var
  I: Integer;
begin
  try

    qryProdutos.Close;
    qryProdutos.Open;
    qryProdutos.First;

    ACBrCargaBal1.Modelo := TACBrCargaBalModelo(cbxModelo.ItemIndex);

    // adição dos itens que serão gerados no arquivo
    ACBrCargaBal1.Produtos.Clear;

    while not qryProdutos.Eof do
    begin
      with ACBrCargaBal1.Produtos.New do
      begin

        ModeloEtiqueta := 1;

        case Dados.qryConfigTIPO_BALANCA.Value of
          1:
            Tipo := tpvPeso;
          2:
            Tipo := tpvUnidade;
          3:
            Tipo := tpvEAN13;
        end;

        Setor.Codigo:=1;
        Setor.Descricao:='';
        Codigo := qryProdutosCODIGO.Value;
        Descricao := qryProdutosDESCRICAO.Value;
        ValorVenda := qryProdutosPR_VENDA.AsFloat;

        if (qryProdutosINICIO_PROMOCAO.Value >= date) and
          (date <= qryProdutosFIM_PROMOCAO.Value) then
          ValorVenda := qryProdutosPRECO_PROMO_VAREJO.AsFloat;

        Validade := 0;
       end;
      qryProdutos.Next;
    end;

    // gerar os arquivos para o diretório, informe somente o caminho do diretório
    ACBrCargaBal1.GerarArquivos(edtDiretorio.Text);
    ShowMessage('Arquivo gerado com sucesso!');
  except
    on E: Exception do
    begin
      // todo erro do componente levanta uma excessão
      ShowMessage('Ocorreu o seguinte erro:' + sLineBreak + E.Message);
    end;
  end;
end;

procedure TfrmBalanca.ACBrCargaBal1Progresso(Mensagem: String;
  ProgressoAtual, ProgressoTotal: Integer);
begin
  lblStatus.Caption := Mensagem;
  ProgressBar1.Max := ProgressoTotal;
  ProgressBar1.Position := ProgressoAtual;

  Application.ProcessMessages;
end;

end.
