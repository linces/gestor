unit udmImpressao;

interface

uses
  System.SysUtils, Vcl.Controls, System.Classes, ACBrBase, ACBrPosPrinter,
  Vcl.StdCtrls;

type
  TDMImpressao = class(TDataModule)
    ACBrPosPrinter1: TACBrPosPrinter;
  private
    { Private declarations }
    FTexto: TStringList;
  public
    procedure ConfiguraImpressora(Tipo: String);
    procedure ImprimeLogo;
    procedure ImprimeTexto(sl: string);
    { Public declarations }
  end;

var
  DMImpressao: TDMImpressao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Udados;
{$R *.dfm}

procedure TDMImpressao.ConfiguraImpressora(Tipo: String);
begin

  if dados.qryTerminalTIPOIMPRESSORA.Value = '2' then
  begin
    dados.qryTerminal.Locate('nome', dados.nometerminal, []);

    ACBrPosPrinter1.Desativar;

    if dados.qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
      ACBrPosPrinter1.Modelo := ppEscDaruma
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
      ACBrPosPrinter1.Modelo := ppEscBematech
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
      ACBrPosPrinter1.Modelo := ppEscPosEpson
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
      ACBrPosPrinter1.Modelo := ppEscDiebold
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
      ACBrPosPrinter1.Modelo := ppEscPosEpson
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'VOX' then
      ACBrPosPrinter1.Modelo := ppEscVox
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'POSSTAR' then
      ACBrPosPrinter1.Modelo := ppEscPosStar
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'JIANG' then
      ACBrPosPrinter1.Modelo := ppEscZJiang
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'GPRINTER' then
      ACBrPosPrinter1.Modelo := ppEscGPrinter
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSONP2' then
      ACBrPosPrinter1.Modelo := ppEscEpsonP2
    else
      ACBrPosPrinter1.Modelo := ppTexto;

    if Tipo = '' then
      ACBrPosPrinter1.Porta :=
        LowerCase(dados.qryTerminal.FieldByName('PORTA').AsString)
    else
      ACBrPosPrinter1.Porta := Tipo;

    ACBrPosPrinter1.Device.Baud := dados.qryTerminalVELOCIDADE.Value;

    ACBrPosPrinter1.ColunasFonteNormal :=
      StrToIntDef(dados.qryTerminalCOLUNAS.AsString, 42);

    ACBrPosPrinter1.LinhasEntreCupons :=
      StrToIntDef(dados.qryTerminalLINHAS_ENTRE_CUPOM.AsString, 5);

    ACBrPosPrinter1.EspacoEntreLinhas :=
      StrToIntDef(dados.qryTerminalESPACO_ENTRE_LINHAS.AsString, 0);

    ACBrPosPrinter1.ConfigLogo.KeyCode1 :=
      StrToIntDef(dados.qryTerminalL1.AsString, 32);
    ACBrPosPrinter1.ConfigLogo.KeyCode2 :=
      StrToIntDef(dados.qryTerminalL2.AsString, 32);
    ACBrPosPrinter1.ConfigLogo.FatorX :=
      StrToIntDef(dados.qryTerminalL3.AsString, 1);
    ACBrPosPrinter1.ConfigLogo.FatorY :=
      StrToIntDef(dados.qryTerminalL4.AsString, 1);

    ACBrPosPrinter1.Ativar;
  end;

end;

procedure TDMImpressao.ImprimeTexto(sl: string);
begin
  try
    FTexto := TStringList.Create;
    FTexto.Text := sl;
    DMImpressao.ACBrPosPrinter1.Buffer.Assign(FTexto);
    if not DMImpressao.ACBrPosPrinter1.CortaPapel then
      DMImpressao.ACBrPosPrinter1.CortarPapel(true);

    DMImpressao.ACBrPosPrinter1.Imprimir;
  finally
    FTexto.Free
  end;

end;

procedure TDMImpressao.ImprimeLogo;
begin
  if dados.qryTerminalTIPOIMPRESSORA.Value = '2' then
  begin
    if FileExists(dados.qryConfigLOGOMARCA.AsString) then
    begin
      ACBrPosPrinter1.ImprimirLinha('</ce>');
      ACBrPosPrinter1.ImprimirImagemArquivo(dados.qryConfigLOGOMARCA.AsString);
    end;
  end;
end;

end.
