unit ufrmDefaultCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDefault, Menus, StdCtrls, DB, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.ExtCtrls, ufrmDefaultClean, ACBrBase, ACBrEnterTab, Vcl.ImgList,
  FireDAC.Phys.Intf, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, JvExControls,
  JvSpeedButton, JvStatusBar, Vcl.Buttons;

type
  TOperacao = (TIncluir, TEditar, TExcluir, TConsulta, TRegistroDefault);
  TfrmDefaultCadastroClass  = class of TfrmDefaultCadastro;

  TfrmDefaultCadastro = class(TfrmDefaultClean)
    dtsDefault: TDataSource;
    pageDefault: TJvPageControl;
    tabDefault: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    FCampoChave: String;

    procedure AlinharControles;
  public
    FOperacao: Toperacao;
    FRetornoCadastro: TRetornoCadastro;
    class function ShowForm:TRetornoConsulta; override;
    class function incluir(Sender: TfrmDefaultCadastroClass; ACampoChave: String): TRetornoCadastro;
    class function alterar(Sender: TfrmDefaultCadastroClass; ACampoChave: String; ACampoChaveValor: Variant): TRetornoCadastro;
    class function excluir(Sender: TfrmDefaultCadastroClass; ACampoChave: String; ACampoChaveValor: Variant): TRetornoCadastro;

    property TipoOperacao: TOperacao read FOperacao write FOperacao;
    procedure PosOnShow;virtual;
  end;
var
  frmDefaultCadastro: TfrmDefaultCadastro;

implementation

uses uFuncoes, ACBrUtil, Udados;

{$R *.dfm}

class function TfrmDefaultCadastro.incluir(Sender: TfrmDefaultCadastroClass; ACampoChave: String): TRetornoCadastro;
var
  iFormCadastro: TfrmDefaultCadastro;
begin
  if Sender = Nil then
    iFormCadastro := TfrmDefaultCadastro(Self).Create(Nil)
  else
    iFormCadastro := Sender.Create(Nil);

  if not Assigned(iFormCadastro.dtsDefault.DataSet) then
    raise Exception.Create('DataSet não foi assinalado no formulário de cadastro, favor corrigir.');

  try
    with iFormCadastro do
    begin
      FOperacao := TIncluir;
      FCampoChave := ACampoChave;

      TFDQuery(dtsDefault.DataSet).Close;
      TFDQuery(dtsDefault.DataSet).Open;
      TFDQuery(dtsDefault.DataSet).Append;
      ShowModal;

      Result := iFormCadastro.FRetornoCadastro;
    end;
  finally
    FreeAndNil(iFormCadastro);
  end;
end;

class function TfrmDefaultCadastro.alterar(Sender: TfrmDefaultCadastroClass;
  ACampoChave: String; ACampoChaveValor: Variant): TRetornoCadastro;
var
  iFormCadastro: TfrmDefaultCadastro;
begin
  if Sender = Nil then
    iFormCadastro := Self.Create(Nil)
  else
    iFormCadastro := Sender.Create(Nil);

  if not Assigned(iFormCadastro.dtsDefault.DataSet) then
    raise Exception.Create('DataSet não foi assinalado no formulário de cadastro, favor corrigir.');

  try
    with iFormCadastro do
    begin
      FOperacao := TEditar;
      FCampoChave := ACampoChave;

      TFDQuery(dtsDefault.DataSet).Close;
      TFDQuery(dtsDefault.DataSet).ParamByName(ACampoChave).Value := ACampoChaveValor;
      TFDQuery(dtsDefault.DataSet).Prepare;
      TFDQuery(dtsDefault.DataSet).Open;
      ShowModal;

      Result := iFormCadastro.FRetornoCadastro;
    end;
  finally
    FreeAndNil(iFormCadastro);
  end;
end;

class function TfrmDefaultCadastro.excluir(Sender: TfrmDefaultCadastroClass;
  ACampoChave: String; ACampoChaveValor: Variant): TRetornoCadastro;
var
  iFormCadastro: TfrmDefaultCadastro;
begin
  if Sender = Nil then
    iFormCadastro := Self.Create(Nil)
  else
    iFormCadastro := Sender.Create(Nil);

  if not Assigned(iFormCadastro.dtsDefault.DataSet) then
    raise Exception.Create('DataSet não foi assinalado no formulário de cadastro, favor corrigir.');

  try
    with iFormCadastro do
    begin
      FOperacao := TExcluir;
      pageDefault.Enabled := False;

      TFDQuery(dtsDefault.DataSet).Close;
      TFDQuery(dtsDefault.DataSet).ParamByName(ACampoChave).Value := ACampoChaveValor;
      TFDQuery(dtsDefault.DataSet).Prepare;
      TFDQuery(dtsDefault.DataSet).Open;
      TFDQuery(dtsDefault.DataSet).Edit;
      ShowModal;

      Result := iFormCadastro.FRetornoCadastro;
    end;
  finally
    FreeAndNil(iFormCadastro);
  end;
end;

procedure TfrmDefaultCadastro.PosOnShow;
begin
  AlinharControles;

  case TipoOperacao of
    TIncluir :Self.Caption := Self.Caption + ' - Inclusão';
    TRegistroDefault :Self.Caption := Self.Caption + ' - Registro Default';
    TEditar  :Self.Caption := Self.Caption + ' - Alteração';
    TExcluir :Self.Caption := Self.Caption + ' - Exclusão';
    TConsulta:Self.Caption := Self.Caption + ' - Consulta';
  end;
  Position := poMainFormCenter;

  Visible := True;
  Application.ProcessMessages;
end;

class function TfrmDefaultCadastro.ShowForm:TRetornoConsulta;
begin
  frmDefaultCadastro := Self.Create(Nil);
  try
    frmDefaultCadastro.ShowModal;
  finally
    FreeAndNil(frmDefaultCadastro);
  end;
end;

procedure TfrmDefaultCadastro.AlinharControles;
begin
  pnlComandos.Align := alBottom;
  pageDefault.Align := alClient;
end;

procedure TfrmDefaultCadastro.btnCancelarClick(Sender: TObject);
begin
  dtsDefault.DataSet.Cancel;

  dados.conexao.RollbackRetaining;

  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TfrmDefaultCadastro.btnConfirmarClick(Sender: TObject);
var
  iErr: integer;
begin

  try
    case FOperacao of
      TIncluir, TEditar, TRegistroDefault:
        if TFDQuery(dtsDefault.DataSet).State in [dsEdit,dsInsert] then
          TFDQuery(dtsDefault.DataSet).Post;

      TExcluir:TFDQuery(dtsDefault.DataSet).Delete;
    end;

    dados.conexao.CommitRetaining;

    if FOperacao in [TIncluir,TEditar] then
      if FCampoChave.Trim.Length > 0 then
        FRetornoCadastro.Identificador := TFDQuery(dtsDefault.DataSet).FieldByName(FCampoChave).Value;

    FRetornoCadastro.Alterado := True;

    Self.Close;
    Self.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      raise Exception.Create
        ('Ocorreu o erro abaixo no processo, favor contactar suporte!' + sLineBreak + sLineBreak + e.Message);
    end;
  end;
end;

procedure TfrmDefaultCadastro.FormCreate(Sender: TObject);
begin
  if not Assigned(dtsDefault.DataSet) then
    raise Exception.Create('DataSet não foi setado na tela de cadastro, favor corrigir.');

  inherited;

  Self.Visible := False;
end;

procedure TfrmDefaultCadastro.FormShow(Sender: TObject);
begin
  PosOnShow;
end;

end.









