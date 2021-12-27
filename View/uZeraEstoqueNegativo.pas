unit uZeraEstoqueNegativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmZeraNegativo = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    qrySaldoR: TFDQuery;
    qrySaldoRCODIGO: TIntegerField;
    qryAcerta: TFDQuery;
    qryAcertaCODIGO: TIntegerField;
    qryAcertaFKPRODUTO: TIntegerField;
    qryAcertaE_S: TStringField;
    qryAcertaDATA: TDateField;
    qrySaldo: TFDQuery;
    qryAcertaQTD_F: TFMTBCDField;
    qryAcertaQTD_A: TFMTBCDField;
    qrySaldoRQTD_ATUAL: TFMTBCDField;
    qrySaldoCODIGO: TIntegerField;
    qrySaldoQTDR: TFMTBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZeraNegativo: TfrmZeraNegativo;

implementation

{$R *.dfm}

uses Udados, uDMEstoque;

procedure TfrmZeraNegativo.BitBtn1Click(Sender: TObject);
begin

  try
    BitBtn1.Enabled := false;

    qrySaldo.Close;
    qrySaldo.Open;

    if qrySaldo.IsEmpty then
      exit;

    qrySaldo.Last;
    try
      ProgressBar1.Max := qrySaldo.RecordCount;
    except
      ProgressBar1.Max := 1;
    end;
    ProgressBar1.Position := 1;
    ProgressBar1.Min := 1;

    qrySaldo.First;
    while not qrySaldo.Eof do // ajusta saldo
    begin

      dmEstoque.AtualizaEstoque(qrySaldoCODIGO.Value, qrySaldoQTDR.AsFloat, 0,
        'E', 'R');

      qrySaldo.Next;
      ProgressBar1.Position := ProgressBar1.Position + 1;
    end;
    Application.ProcessMessages;

    BitBtn1.Enabled := false;

    // zera estoque real negativo

    qrySaldoR.Close;
    qrySaldoR.Open;
    qrySaldoR.Last;
    ProgressBar1.Max := 1;
    if qrySaldoR.RecordCount > 0 then
      ProgressBar1.Max := qrySaldoR.RecordCount;
    ProgressBar1.Position := 1;
    ProgressBar1.Min := 1;
    qrySaldoR.First;

    qryAcerta.Close;
    qryAcerta.Open;

    while not qrySaldoR.Eof do
    begin
      qryAcerta.Insert;
      qryAcertaCODIGO.Value := dados.Numerador('ACERTA_ESTOQUE', 'CODIGO',
        'N', '', '');

      qryAcertaFKPRODUTO.Value := qrySaldoRCODIGO.Value;
      qryAcertaE_S.Value := 'E';
      qryAcertaQTD_A.Value := -1 * qrySaldoRQTD_ATUAL.AsFloat;
      qryAcertaQTD_F.Value := 0;
      qryAcertaDATA.Value := DATE;
      qryAcerta.Post;
      dados.Conexao.CommitRetaining;

      dmEstoque.AtualizaEstoque(qrySaldoRCODIGO.Value, qryAcertaQTD_A.AsFloat,
        0, 'E', 'R');

      qrySaldoR.Next;
      ProgressBar1.Position := ProgressBar1.Position + 1;
    end;

    Application.ProcessMessages;
    ShowMessage('Atualização concluída com sucesso!');

  finally
    BitBtn1.Enabled := true;
  end;

end;

procedure TfrmZeraNegativo.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmZeraNegativo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    Close;
  end;
end;

end.
