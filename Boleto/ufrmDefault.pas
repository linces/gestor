unit ufrmDefault;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TypInfo, StdCtrls, ComCtrls, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab,
  Vcl.ImgList, JvMaskEdit, Vcl.Mask, JvExMask, JvToolEdit,
  JvDBControls;

type
  TParametrosSelecao = class(TStringList)
  private
  public
    function Add(const S: string): Integer; override;
    destructor Destroy; override;
  end;

  TRetornoConsulta = record
  private
  public
    Localizado: Boolean;
    Identificador: Variant;
    FormDestroy: String;
    procedure Clear;
  end;

  TRetornoCadastro = record
  private
    procedure Clear;
  public
    Alterado: Boolean;
    Identificador: Variant;
  end;

  TfrmDefault = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    procedure TFieldGetFoneFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetCPFCNPJFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetIEFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetCNAEFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetCEPFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetNCMFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TFieldGetCESTFormat(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TEditMascaraIBPT(Sender: TObject);
    procedure TEditMascaraCEST(Sender: TObject);
    procedure TEditMascaraCPFCNPJ(Sender: TObject);
    procedure TEditMascaraCNPJ(Sender: TObject);
    procedure TEditMascaraCPF(Sender: TObject);
    procedure TEditMascaraCEP(Sender: TObject);
    procedure TEditMascaraTELEFONE(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FParamSelecao: TParametrosSelecao;

  public
    FRetorno: String;
    function GetCondicaoSQL: String; virtual;
    class function ShowForm: TRetornoConsulta; virtual;
    property ParamSelecao: TParametrosSelecao read FParamSelecao
      write FParamSelecao;
  end;

var
  frmDefault: TfrmDefault;

implementation

{$R *.dfm}

uses ufuncoes, ACBrUtil;

function TfrmDefault.GetCondicaoSQL: String;
var
  i: Integer;
begin
  if FParamSelecao.Count > 0 then
  begin
    for i := 0 to FParamSelecao.Count - 1 do
      Result := Result + sLineBreak + ' AND ' + FParamSelecao.Strings[i];
  end;

end;

procedure TfrmDefault.TEditMascaraCNPJ(Sender: TObject);
var
  ALength: Integer;
begin
  TJvDBMaskEdit(Sender).EditText := ufuncoes.FormatarCNPJ
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  ALength := Length(Trim(TJvDBMaskEdit(Sender).EditText));

  TJvDBMaskEdit(Sender).SelStart := ALength;

  // 66.398.496/0001-01
  // 12345678901234567
  // 3   7   11   16
  case ALength of
    3:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    7:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    11:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    16:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
  end;
end;

procedure TfrmDefault.TEditMascaraCPF(Sender: TObject);
var
  ALength: Integer;
begin
  TJvDBMaskEdit(Sender).EditText := ufuncoes.FormatarCPF
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  ALength := Length(Trim(TJvDBMaskEdit(Sender).EditText));

  TJvDBMaskEdit(Sender).SelStart := ALength;

  // 183.299.958-01
  // 12345678901234
  // 4   8   12
  case ALength of
    4:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    8:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    12:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
    16:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
  end;
end;

procedure TfrmDefault.TEditMascaraCEP(Sender: TObject);
var
  ALength: Integer;
begin
  TJvDBMaskEdit(Sender).EditText := ufuncoes.FormatarCEP
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  ALength := Length(Trim(TJvDBMaskEdit(Sender).EditText));

  TJvDBMaskEdit(Sender).SelStart := ALength;

  // 38180-000
  // 123456789
  // 6
  case ALength of
    6:
      TJvDBMaskEdit(Sender).SelStart := ALength - 1;
  end;
end;

procedure TfrmDefault.TEditMascaraCPFCNPJ(Sender: TObject);
var
  ALength: Integer;
begin
  ALength := Length(Trim(OnlyNumber(TJvDBMaskEdit(Sender).Text)));

  if ALength <= 11 then
  begin
    TJvDBMaskEdit(Sender).Text := ufuncoes.FormatarCPF
      (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
    ALength := Length(Trim(OnlyNumber(TJvDBMaskEdit(Sender).Text)));

    case ALength of
      0:
        TJvDBMaskEdit(Sender).SelStart := 1;
      1:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 11;
      2:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 10;
      3:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 9;
      4:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 7;
      5:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 6;
      6:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 5;
      7:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 3;
      8:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 2;
      9:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 1;
    else
      begin
        if VarIsNull(TJvDBMaskEdit(Sender).EditText) then
          TJvDBMaskEdit(Sender).SelStart := 0
        else
          TJvDBMaskEdit(Sender).SelStart :=
            Length(Trim(TJvDBMaskEdit(Sender).EditText));
      end;
    end;
  end
  else
  begin
    TJvDBMaskEdit(Sender).Text :=
      FormatarCNPJ(ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
    ALength := Length(Trim(OnlyNumber(TJvDBMaskEdit(Sender).Text)));

    case ALength of
      0:
        TJvDBMaskEdit(Sender).SelStart := 1;
      1:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 15;
      2:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 14;
      3:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 12;
      4:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 11;
      5:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 10;
      6:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 8;
      7:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 7;
      8:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 6;
      9:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 4;
      10:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 3;
      11:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 2;
      12:
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 1;
    else
      begin
        if VarIsNull(TJvDBMaskEdit(Sender).EditText) then
          TJvDBMaskEdit(Sender).SelStart := 0
        else
          TJvDBMaskEdit(Sender).SelStart :=
            Length(Trim(TJvDBMaskEdit(Sender).EditText));
      end;
    end;
  end;
end;

procedure TfrmDefault.TEditMascaraCEST(Sender: TObject);
var
  ALength: Integer;
begin
  TJvDBMaskEdit(Sender).Text := ufuncoes.FormatarCEST
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  ALength := Length(Trim(OnlyNumber(TJvDBMaskEdit(Sender).Text)));

  // 00.000.00
  // 123456789

  case ALength of
    0:
      TJvDBMaskEdit(Sender).SelStart := 1;
    1:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 6;
    2:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 5;
    3:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 3;
    4:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 2;
    5:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 1;
  else
    begin
      if VarIsNull(TJvDBMaskEdit(Sender).EditText) then
        TJvDBMaskEdit(Sender).SelStart := 0
      else
        TJvDBMaskEdit(Sender).SelStart :=
          Length(Trim(TJvDBMaskEdit(Sender).EditText));
    end;
  end;
end;

procedure TfrmDefault.TFieldGetFoneFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarFone(Sender.AsString);
end;

procedure TfrmDefault.TFieldGetCPFCNPJFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarCNPJCPF(Sender.AsString);
end;

procedure TfrmDefault.TFieldGetIEFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarInscEstadual(Sender.AsString,
    Sender.DataSet.FieldByName('ID_CIDADES_UF').AsString);
end;

procedure TfrmDefault.TFieldGetNCMFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarNCM(Sender.AsString);
end;

procedure TfrmDefault.TEditMascaraIBPT(Sender: TObject);
var
  ALength: Integer;
begin
  TJvDBMaskEdit(Sender).Text := ufuncoes.FormatarNCM
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  ALength := Length(Trim(OnlyNumber(TJvDBMaskEdit(Sender).Text)));

  case ALength of
    0:
      TJvDBMaskEdit(Sender).SelStart := 1;
    1:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 10;
    2:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 9;
    3:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 7;
    4:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 6;
    5:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 4;
    6:
      TJvDBMaskEdit(Sender).SelStart :=
        Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 3;
  else
    begin
      if VarIsNull(TJvDBMaskEdit(Sender).EditText) then
        TJvDBMaskEdit(Sender).SelStart := 0
      else
        TJvDBMaskEdit(Sender).SelStart :=
          Length(TJvDBMaskEdit(Sender).EditText);
    end;
  end;
end;

procedure TfrmDefault.TEditMascaraTELEFONE(Sender: TObject);
begin
  TJvDBMaskEdit(Sender).EditText := ufuncoes.FormatarFone
    (ACBrUtil.OnlyNumber(TJvDBMaskEdit(Sender).Text));
  if Length(Trim(TJvDBMaskEdit(Sender).EditText)) < 7 then
    TJvDBMaskEdit(Sender).SelStart :=
      Length(Trim(TJvDBMaskEdit(Sender).EditText)) - 1
  else
    TJvDBMaskEdit(Sender).SelStart :=
      Length(Trim(TJvDBMaskEdit(Sender).EditText));
end;

procedure TfrmDefault.TFieldGetCEPFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarTCCC(Sender.AsString);
end;

procedure TfrmDefault.TFieldGetCESTFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarCEST(Sender.AsString);
end;

procedure TfrmDefault.TFieldGetCNAEFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := FormatarCNAE(Sender.AsString);
end;

class function TfrmDefault.ShowForm: TRetornoConsulta;
var
  vfrmDefault: TfrmDefault;
begin
  vfrmDefault := Self.Create(Application);
  try
    vfrmDefault.ShowModal;
  finally
    FreeAndNil(vfrmDefault);
  end;
end;

procedure TfrmDefault.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FParamSelecao := TParametrosSelecao.Create;

  if (Screen.Width = 800) and (Screen.Height = 600) and (Self.Height >= 540)
  then
  begin
    Self.Position := poDesigned;
    Self.Top := 0;
    Self.Left := 0;
  end;

  for i := 0 to TfrmDefault(Self).ComponentCount - 1 do
  begin
    if Self.Components[i].ClassType = TEdit then
    begin
      TEdit(Self.Components[i]).CharCase := ecUpperCase;
      TEdit(Self.Components[i]).CharCase := ecUpperCase;
    end;
  end;
end;

procedure TfrmDefault.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (not(ssCtrl in Shift)) then
    Key := VK_TAB;
end;

procedure TfrmDefault.FormShow(Sender: TObject);
begin

end;

{ TRetornoConsulta }

procedure TRetornoConsulta.Clear;
begin
  Localizado := False;
  Identificador := varNull;
end;

{ TRetornoCadastro }

procedure TRetornoCadastro.Clear;
begin
  Alterado := False;
  Identificador := Null;
end;

{ TParametrosSelecao }

function TParametrosSelecao.Add(const S: string): Integer;
begin
  if Trim(S) <> '' then
    Result := inherited Add(S)
  else
    Result := Count;
end;

destructor TParametrosSelecao.Destroy;
begin
  Self.Clear;

  inherited;
end;

end.
