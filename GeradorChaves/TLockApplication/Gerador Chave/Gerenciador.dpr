program Gerenciador;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {Principal},
  unDados in 'unDados.pas' {Dados: TDataModule},
  unConexao in 'unConexao.pas' {frmConexao},
  Ping2 in 'Ping2.pas',
  uTInject.ConfigCEF,
  unMensagem in 'unMensagem.pas' {frmMensagem},
  unMensagemWhats in 'unMensagemWhats.pas' {frmMensagemWhats},
  unCadClientes in 'unCadClientes.pas' {frmCadClientes};

{$R *.res}

begin

  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.Title := 'Gerenciador de Licenças SoftArena';
  Application.CreateForm(TDados, Dados);
  Application.Run;
end.
