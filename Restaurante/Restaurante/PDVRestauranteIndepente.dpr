program PDVRestauranteIndepente;

uses
  Vcl.Forms,
  Windows,
  uMenu in 'uMenu.pas' {frmMenu},
  PageControlEx in 'PageControlEx.pas',
  TabCloseButton in 'TabCloseButton.pas',
  TDI in 'TDI.pas',
  Vcl.Themes,
  Vcl.Styles,
  uClientes in 'uClientes.pas' {frmClientes},
  uDados in 'uDados.pas' {Dados: TDataModule},
  uTransfComanda in 'uTransfComanda.pas' {frmTransfComanda},
  uTransf in 'uTransf.pas' {frmTransf},
  uReabrirComanda in 'uReabrirComanda.pas' {frmReabrirComanda},
  uAcesso in 'uAcesso.pas' {frmAcesso},
  uPedidos in 'uPedidos.pas' {frmPedidos},
  uProdutos in 'uProdutos.pas' {frmProduto},
  uEmpresa in 'uEmpresa.pas' {frmEmpresa},
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  uConfiguracoes in 'uConfiguracoes.pas' {frmConfiguracoes};

{$R *.res}

var
  Hwnd: THandle;

begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;

end.
