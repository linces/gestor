unit uCadRecibo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  ACBrBase, ACBrEnterTab, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadRecibo = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    btnCancelar: TSpeedButton;
    btnGravar: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dsRecibo: TDataSource;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    ACBrEnterTab1: TACBrEnterTab;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    qryRecibo: TFDQuery;
    qryReciboCODIGO: TIntegerField;
    qryReciboFKEMPRESA: TIntegerField;
    qryReciboDATA_EMISSAO: TDateField;
    qryReciboNOMINAL: TStringField;
    qryReciboREFERENTE1: TStringField;
    qryReciboREFERENTE2: TStringField;
    qryReciboEXTENSO: TStringField;
    qryReciboSITUACAO: TStringField;
    qryReciboVALOR: TFMTBCDField;
    qryReciboTTOTAL: TAggregateField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure qryReciboCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRecibo: TfrmCadRecibo;

implementation

{$R *.dfm}

uses uCaixa, Udados, uRecibo, uExtenso;

procedure TfrmCadRecibo.btnCancelarClick(Sender: TObject);
begin
  qryRecibo.Cancel;
  close;
end;

procedure TfrmCadRecibo.btnGravarClick(Sender: TObject);
begin

  if (qryReciboNOMINAL.IsNull) then
  begin
    ShowMessage('Informe o campo Recebido de!');
    DBEdit2.SetFocus;
    exit;
  end;

  if (qryReciboREFERENTE1.IsNull) then
  begin
    ShowMessage('Informe o campo Referente a!');
    DBEdit3.SetFocus;
    exit;
  end;

  qryRecibo.Post;
  dados.Conexao.CommitRetaining;
  close;
end;

procedure TfrmCadRecibo.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadRecibo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F5 then
    btnGravarClick(self);
  if Key = VK_ESCAPE then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do cadastro de recibo?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmCadRecibo.qryReciboCalcFields(DataSet: TDataSet);
begin
  qryReciboEXTENSO.Value := UpperCase(valorPorExtenso(qryReciboVALOR.AsFloat));
end;

end.
