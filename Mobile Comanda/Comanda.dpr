program Comanda;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  Pedidos in 'Pedidos.pas' {FrmPedidos},
  NovoPedido in 'NovoPedido.pas' {FrmNovoPed},
  Movimentacoes in 'Movimentacoes.pas' {FrmMov},
  Reservas in 'Reservas.pas' {FrmReservas},
  Produtos in 'Produtos.pas' {FrmProdutos},
  VDetalheProdutos in 'VDetalheProdutos.pas' {DetalheProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;

end.
