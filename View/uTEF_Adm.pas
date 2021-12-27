unit uTEF_Adm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.StrUtils, System.AnsiStrings,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Types, System.TypInfo, uEnums,
  Vcl.ExtCtrls, uLib, uPGWLib, Vcl.Menus, Vcl.Mask, System.Actions,
  Vcl.ActnList;

type

  TfrmTEF_Adm = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Operaes1: TMenuItem;
    PWiInit1: TMenuItem;
    PWOPERINSTALL1: TMenuItem;
    PWOPERSALEVenda1: TMenuItem;
    PWiConfirmation1: TMenuItem;
    PWOPERSALEVOIDCancelamento1: TMenuItem;
    PWOPERVERSIONVersodaDLL1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N5PWOPERREPRINTReimpresso1: TMenuItem;
    PWOPERRPTDETAIL1: TMenuItem;
    N7PWOPERADMIN1: TMenuItem;
    N9: TMenuItem;
    Button1: TButton;
    N8TestaAutoAtendimento1: TMenuItem;
    ActionList1: TActionList;
    Abortar: TAction;
    este1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PWiInit1Click(Sender: TObject);
    procedure PWOPERINSTALL1Click(Sender: TObject);
    procedure PWOPERSALEVenda1Click(Sender: TObject);
    procedure PWiConfirmation1Click(Sender: TObject);
    procedure PWOPERSALEVOIDCancelamento1Click(Sender: TObject);
    procedure PWOPERVERSIONVersodaDLL1Click(Sender: TObject);
    procedure N5PWOPERREPRINTReimpresso1Click(Sender: TObject);
    procedure PWOPERRPTDETAIL1Click(Sender: TObject);
    procedure N7PWOPERADMIN1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N8TestaAutoAtendimento1Click(Sender: TObject);
    procedure AbortarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);

  private

  public

    PWEnums: TCEnums;
    PGWLib: TPGWLib;

    iKey: Integer;

    ApertouESC: Boolean;

  end;

var
  frmTEF_Adm: TfrmTEF_Adm;

implementation

{$R *.dfm}

uses uLib02, Udados;

procedure TfrmTEF_Adm.AbortarExecute(Sender: TObject);
begin

  ShowMessage('Abortar');

end;

procedure TfrmTEF_Adm.Button1Click(Sender: TObject);
begin

  // Limpa Log
  Memo1.Clear;

end;

procedure TfrmTEF_Adm.FormCreate(Sender: TObject);
begin
  // =================================================
  // Atualiza Form Inicial com Dados da Aplicação
  // =================================================

  PWEnums := TCEnums.Create;
  PGWLib := TPGWLib.Create;

  Label2.Caption := 'PWINFO_AUTNAME(21): ' + '  ' +
    PWEnums.PGWEBLIBTEST_AUTNAME;
  Label3.Caption := 'PWINFO_AUTVER (22) : ' + '  ' +
    PWEnums.PGWEBLIBTEST_VERSION;
  Label4.Caption := 'PWINFO_AUTDEV (23) : ' + '  ' +
    PWEnums.PGWEBLIBTEST_AUTDEV;
  Label5.Caption := 'PWINFO_AUTCAP (36) : ' + '  ' +
    PWEnums.PGWEBLIBTEST_AUTCAP;

end;

procedure TfrmTEF_Adm.FormDestroy(Sender: TObject);
begin
  PWEnums.Free;
end;

procedure TfrmTEF_Adm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  // ShowMessage('Teclou Algo ' + IntToStr(Key));
  iKey := Key;

end;

procedure TfrmTEF_Adm.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #27 then
  begin
    iKey := 1;
  end;
end;

procedure TfrmTEF_Adm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // label6.caption := Key.ToString;

  iKey := Key;
end;

procedure TfrmTEF_Adm.N5PWOPERREPRINTReimpresso1Click(Sender: TObject);
begin

  // Transação de Reimpressão
  PGWLib.Reimpressao();

end;

procedure TfrmTEF_Adm.N7PWOPERADMIN1Click(Sender: TObject);
begin

  // Transação Administrativa
  PGWLib.Admin();

end;

procedure TfrmTEF_Adm.N8TestaAutoAtendimento1Click(Sender: TObject);
begin

  // Teste de Auto Atendimento
  PGWLib.TesteAA();

end;

procedure TfrmTEF_Adm.PWiConfirmation1Click(Sender: TObject);
begin

  // Confirmação de Transação
  PGWLib.ConfirmaTrasacao();

end;

procedure TfrmTEF_Adm.PWiInit1Click(Sender: TObject);
begin

  // Inicializar Lib
  if (Dados.qryTerminalCAMINHO_TEF.AsString.Trim = '') or
    (Dados.qryTerminalCAMINHO_TEF.IsNull) then
    raise Exception.Create('Configura o caminho do TEF!')
  else
    PGWLib.Init(Dados.qryTerminalCAMINHO_TEF.AsString);

end;

procedure TfrmTEF_Adm.PWOPERINSTALL1Click(Sender: TObject);
begin

  // Instalar Ponto de Captura
  PGWLib.Instalacao();

end;

procedure TfrmTEF_Adm.PWOPERRPTDETAIL1Click(Sender: TObject);
begin
  // Relatórios
  PGWLib.Relatorios();

end;

procedure TfrmTEF_Adm.PWOPERSALEVenda1Click(Sender: TObject);
begin

  // Transação de Venda

  PGWLib.venda();

end;

procedure TfrmTEF_Adm.PWOPERSALEVOIDCancelamento1Click(Sender: TObject);
begin

  // Cancelamento
  PGWLib.Cancelamento();

end;

procedure TfrmTEF_Adm.PWOPERVERSIONVersodaDLL1Click(Sender: TObject);
begin

  // versão atual da DLL
  PGWLib.GetVersao();

end;

end.
