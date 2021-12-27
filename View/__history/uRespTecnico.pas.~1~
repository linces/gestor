unit uRespTecnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils, acbrutil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrBase, ACBrEnterTab, Vcl.Samples.Spin, ACBrValidador;

type
  TfrmRespTecnico = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    dsRespTecnico: TDataSource;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    Label102: TLabel;
    DBEdit12: TDBEdit;
    Label103: TLabel;
    DBEdit26: TDBEdit;
    Label106: TLabel;
    DBEdit29: TDBEdit;
    DBEdit34: TDBEdit;
    Label137: TLabel;
    Label138: TLabel;
    DBEdit37: TDBEdit;
    DBEdit27: TDBEdit;
    Label104: TLabel;
    Label105: TLabel;
    DBEdit28: TDBEdit;
    Label107: TLabel;
    DBEdit30: TDBEdit;
    Label108: TLabel;
    DBEdit31: TDBEdit;
    Label109: TLabel;
    DBEdit32: TDBEdit;
    Label110: TLabel;
    DBComboBox9: TDBComboBox;
    ACBrValidador1: TACBrValidador;
    DBCheckBox37: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit37KeyPress(Sender: TObject; var Key: Char);
  private
    function ValidaCPF_CNPJ: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRespTecnico: TfrmRespTecnico;

implementation

{$R *.dfm}

uses Udados, uRotinasComuns;

procedure TfrmRespTecnico.btnCancelarClick(Sender: TObject);
begin
  Dados.qryRespTecnico.Cancel;
  close;
end;

procedure TfrmRespTecnico.btnGravarClick(Sender: TObject);
begin

  DBEdit12.SetFocus;

  if NOT ValidaCPF_CNPJ then
    raise Exception.Create('CNPJ Inválido');

  if trim(dsRespTecnico.DataSet.FieldByName('TITULO_SISTEMA').AsString) = ''
  then
  begin
    DBEdit26.SetFocus;
    raise Exception.Create('Informe o Título do Sistema!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('SUB_TITULO_SISTEMA').AsString) = ''
  then
  begin
    DBEdit27.SetFocus;
    raise Exception.Create('Informe o Sub Título do Sistema!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('EMPRESA').AsString) = '' then
  begin
    DBEdit29.SetFocus;
    raise Exception.Create('Informe o nome da SoftHouse!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('CNPJ').AsString) = '' then
  begin
    DBEdit37.SetFocus;
    raise Exception.Create('Informe o CNPJ da SoftHouse!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('EMAIL_SUPORTE').AsString) = '' then
  begin
    DBEdit37.SetFocus;
    raise Exception.Create('Informe o Email da SoftHouse!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('FONE1').AsString) = '' then
  begin
    DBEdit37.SetFocus;
    raise Exception.Create('Informe o Fone da SoftHouse!');
  end;

  if trim(dsRespTecnico.DataSet.FieldByName('CONTATO').AsString) = '' then
  begin
    DBEdit32.SetFocus;
    raise Exception.Create('Informe o Contato da SoftHouse!');
  end;

  Dados.qryParametro.Post;
  close;
end;

function TfrmRespTecnico.ValidaCPF_CNPJ: boolean;
begin
  // Valida CPF/CNPF CPF NA NOTA
  Result := True;

  if trim(TiraPontos(DBEdit37.EditText)) <> '' then
  begin

    if (length(TiraPontos(DBEdit37.EditText)) <> 14) then
    begin
      Result := False;
      raise Exception.Create('Tamanho do CPF/CNPJ Inválido!');
    end;

    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := TiraPontos(DBEdit37.EditText);
    if not ACBrValidador1.Validar then
    begin
      Result := False;
      raise Exception.Create(ACBrValidador1.MsgErro);
    end;
  end;

end;

procedure TfrmRespTecnico.DBEdit37KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmRespTecnico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = VK_escape then
    if Application.messageBox('Tem Certeza de que deseja sair?', 'Confirmação',
      mb_YesNo) = mrYes then
    begin
      btnCancelar.Click;
    end
end;

procedure TfrmRespTecnico.FormShow(Sender: TObject);
begin
  if not Dados.qryParametro.Active then
    Dados.qryParametro.Open;
  Dados.qryParametro.Edit;
end;

end.

