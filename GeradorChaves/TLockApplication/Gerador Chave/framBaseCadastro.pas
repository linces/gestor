unit framBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons,
  DBSBtn, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, VCl.ComCtrls, vcl.StdCtrls, System.Generics.Collections;

type
  TframeCadastro = class(TFrame)
    btnIInserir: TDBSpeedButton;
    dsCadastro: TDataSource;
    btnEditar: TDBSpeedButton;
    btnGravar: TDBSpeedButton;
    btnDeletar: TDBSpeedButton;
    btnPrimeiro: TDBSpeedButton;
    btnAnterior: TDBSpeedButton;
    btnProximo: TDBSpeedButton;
    btnUltimo: TDBSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Acoes: TActionList;
    Action1: TAction;
    Ac_Incluir: TAction;
    Action2: TAction;
    Ac_Editar: TAction;
    Ac_Visualizar: TAction;
    Ac_Imprimir: TAction;
    Ac_Excluir: TAction;
    Ac_Salvar: TAction;
    Ac_Anterior: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    procedure Ac_IncluirExecute(Sender: TObject);
        procedure Ac_SalvarUpdate(Sender: TObject);
    procedure Ac_IncluirUpdate(Sender: TObject);

    procedure Ac_CancelarExecute(Sender: TObject);
   private
    FCheckUnique: TDictionary<String, String>;
    procedure SetCheckUnique(const Value: TDictionary<String, String>);
    { Private declarations }
  public
    property CheckUnique: TDictionary<String, String> read FCheckUnique write SetCheckUnique;
  end;

implementation

{$R *.dfm}

uses unDados, unPrincipal;

{ TframeCadastro }

procedure TframeCadastro.Ac_CancelarExecute(Sender: TObject);
begin
    dsCadastro.DataSet.Cancel;
end;

procedure TframeCadastro.Ac_IncluirExecute(Sender: TObject);
begin
      dsCadastro.DataSet.Open;
   dsCadastro.DataSet.Insert;
end;

procedure TframeCadastro.Ac_IncluirUpdate(Sender: TObject);
begin
      TAction(Sender).Enabled := not (dsCadastro.State in [dsInsert, dsEdit]);
end;

procedure TframeCadastro.Ac_SalvarUpdate(Sender: TObject);
begin
       TAction(Sender).Enabled := dsCadastro.State in [dsInsert, dsEdit];
end;

procedure TframeCadastro.SetCheckUnique(
  const Value: TDictionary<String, String>);
begin
  FCheckUnique := Value;
end;

end.
