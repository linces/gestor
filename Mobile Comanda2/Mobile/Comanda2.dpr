program Comanda2;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitResumo in 'UnitResumo.pas' {FrmResumo},
  UnitAddItem in 'UnitAddItem.pas' {FrmAddItem},
  UnitDM in 'UnitDM.pas' {dm: TDataModule},
  Loading in '..\..\ServidorREST\classes-uteis\Loading.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
