unit Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFrmMenu = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    LAreaMenu: TLayout;
    GridMenu: TGridPanelLayout;
    ImgPedidos: TImage;
    imgMovimentacoes: TImage;
    imgProdutos: TImage;
    imgReservas: TImage;
    LRodapeMenu: TLayout;
    LTotal: TLayout;
    LEntradaseSaidas: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    btnFechar: TButton;
    imgLogoUsuario: TImage;
    LTextos: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    lblNome: TLabel;
    lblFuncao: TLabel;
    Label7: TLabel;
    lblReservas: TLabel;
    retEstoque: TRectangle;
    lblEstoque: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ImgPedidosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure imgMovimentacoesClick(Sender: TObject);
    procedure imgReservasClick(Sender: TObject);
    procedure imgProdutosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure quantReservas;
    procedure verificarEstoque;
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

uses Modulo, Pedidos, Movimentacoes, Reservas, Produtos, VDetalheProdutos;
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TFrmMenu.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.FormActivate(Sender: TObject);
begin
  lblNome.Text := nomeFuncionario;
  lblFuncao.Text := cargoFuncionario;
  quantReservas;
  verificarEstoque;

end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  if cargoFuncionario = 'Gerente' then
  begin
    imgMovimentacoes.Enabled := true;

  end;
end;

procedure TFrmMenu.imgMovimentacoesClick(Sender: TObject);
begin
  FrmMov := TFrmMov.Create(self);
  FrmMov.Show();
end;

procedure TFrmMenu.ImgPedidosClick(Sender: TObject);
begin
  FrmPedidos := TFrmPedidos.Create(self);
  FrmPedidos.Show();
end;

procedure TFrmMenu.imgProdutosClick(Sender: TObject);
begin
  FrmProdutos := TFrmProdutos.Create(self);
  FrmProdutos.Show();
end;

procedure TFrmMenu.imgReservasClick(Sender: TObject);
begin
  FrmReservas := TFrmReservas.Create(self);
  FrmReservas.Show();
end;

procedure TFrmMenu.quantReservas;
begin
  dm.con.Connected := true;
  dm.queryReservasCOn.Active := true;

  dm.queryReservasCOn.Close;
  dm.queryReservasCOn.SQL.Clear;
  dm.queryReservasCOn.SQL.Add
    ('select * from reservas where data = curDate() and status = :status');

  dm.queryReservasCOn.ParamByName('status').AsString := 'Agendada';
  dm.queryReservasCOn.Open;
  dm.queryReservasCOn.First;

  lblReservas.Text := dm.queryReservasCOn.RecordCount.ToString;

end;

procedure TFrmMenu.verificarEstoque;
begin
  dm.con.Connected := true;
  dm.queryProdutosCOn.Active := true;

  dm.queryProdutosCOn.Close;
  dm.queryProdutosCOn.SQL.Clear;
  dm.queryProdutosCOn.SQL.Add
    ('select id, nome, descricao, valor, quantidade, imagem from produtos where quantidade < :quantidade');

  dm.queryProdutosCOn.ParamByName('quantidade').Value := 10;
  dm.queryProdutosCOn.Open;
  dm.queryProdutosCOn.First;

  if dm.queryProdutosCOn.RecordCount > 0 then
  begin
    lblEstoque.Text := 'Estoque Baixo';
    retEstoque.Fill.Color := $FFE87878;
  end
  else
  begin
    lblEstoque.Text := 'Estoque Bom';
    retEstoque.Fill.Color := $FF80EC7C;
  end;

end;

end.
