  {
   unit:   uLib02
   Classe: TCustomInputBox

   Data de criação  : 18/06/2019
   Autor            :
   Descrição        : Lib contendo estruturas Auxiliares da Aplicação
   }
//*****************************************************************************/
unit uLib02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.StrUtils, system.AnsiStrings,
  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, System.Types, System.TypInfo;


type

  TCustomInputBox = class
  private
    class procedure EditKeyPress(Sender: TObject; var Key: Char);
    class procedure EditChange(Sender: TObject);
  public
    class function InputBox(const ACaption, APrompt, ADefault: string; x,y:integer): string;
    class function GetAveCharSize(Canvas: TCanvas): TPoint;

  end;


implementation


class procedure TCustomInputBox.EditChange(Sender: TObject);
var
   s : string;
   v : double;
   I : integer;
   Texto, Texto2: string;
begin
 // se o edit estiver vazio, nada pode ser feito.
   if TEdit(Sender).Text = EmptyStr then
      TEdit(Sender).Text := '0,00';

   //obter o texto do edit, SEM a virgula e SEM o ponto decimal:
   s := '';
   for I := 1 to length(TEdit(Sender).Text) do
   if (TEdit(Sender).Text[I] in ['0'..'9']) then
      s := s + TEdit(Sender).Text[I];

   //fazer com que o conteúdo do edit apresente 2 casas decimais:
   v := strtofloat(s);
   v := (v /100); // para criar 2 casa decimais

   //Formata o valor de (V) para aceitar valores do tipo 0,10.
   TEdit(Sender).Text := FormatFloat('###,##0.00',v);
   TEdit(Sender).SelStart := 0;

end;



class procedure TCustomInputBox.EditKeyPress(Sender: TObject; var Key: Char);
var
   Texto, Texto2: string;
   i: byte;
begin
   if NOT (Key in ['0'..'9', #8, #9]) then
     key := #0;
     //Função para posicionar o cursor sempre na direita
     TEdit(Sender).SelStart := Length(TEdit(Sender).Text);

end;


//==========================================================
  {
    Auxliar para capturar tamanho dos caracteres de InputBox
  }
//==========================================================
class function TCustomInputBox.GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;



//==========================================================
  {
  }
//==========================================================
class function TCustomInputBox.InputBox(const ACaption, APrompt, ADefault: string; x,y:integer): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  aux:string;
  IsValid: Boolean;

begin
  IsValid := False;
  Form   := TForm.Create(nil);
  with Form do
    try
      FormStyle := fsStayOnTop;
      BorderIcons := BorderIcons - [biSystemMenu] - [biMaximize]; // Tira Maximizar
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      //ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := 120;  //85
      Position := poDesigned;
      Top := y;
      Left := x;
      Prompt := TLabel.Create(Form);

      with Prompt do
      begin
        Parent   := Form;
        Caption  := APrompt;
        Left     := 10;
        Top      := 10;
        WordWrap := True;
      end;
      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text       := ADefault;
        OnKeyPress := EditKeyPress;
        OnChange   := EditChange;
        SelectAll;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := mrCancel;
        Cancel := True;
        //Enabled := False;
        Visible := True;       // Esconde Botão Cancelar
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
        ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Result := Edit.Text;
      end
      else
       if ShowModal = mrCancel then
       begin
         Result  := 'CANCELA';
       end;

    finally
      Form.Free;
    end;
end;


end.
