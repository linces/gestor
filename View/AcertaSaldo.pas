unit AcertaSaldo;

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
  TfrmAcertaSaldo = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    qrySaldoA: TFDQuery;
    qrySaldoACODIGO: TIntegerField;
    qrySaldoAQTDR: TFMTBCDField;
    QrySaldoF: TFDQuery;
    QrySaldoFFK_PRODUTO: TIntegerField;
    QrySaldoFSALDO: TFMTBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtualizaEstoque(codigo: integer; qtd: extended);
    procedure AtualizaEstoqueFiscal(codigo: integer; qtd: extended);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaSaldo: TfrmAcertaSaldo;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmAcertaSaldo.AtualizaEstoque(codigo: integer; qtd: extended);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'update produto set qtd_atual=:qtd where codigo=:codigo';
  dados.qryExecute.ParamByName('qtd').AsFloat := qtd;
  dados.qryExecute.ParamByName('codigo').AsFloat := codigo;
  dados.qryExecute.Prepare;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

procedure TfrmAcertaSaldo.AtualizaEstoqueFiscal(codigo: integer; qtd: extended);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'update produto set qtd_fiscal=:qtd where codigo=:codigo';
  dados.qryExecute.ParamByName('qtd').AsFloat := qtd;
  dados.qryExecute.ParamByName('codigo').AsFloat := codigo;
  dados.qryExecute.Prepare;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

procedure TfrmAcertaSaldo.BitBtn1Click(Sender: TObject);
begin
  try
    BitBtn1.Enabled := false;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select coalesce(count(codigo),0) qtd from produto';
    dados.qryConsulta.Open;

    ProgressBar1.Position := 1;
    ProgressBar1.Min := 1;

    ProgressBar1.Max := dados.qryConsulta.FieldByName('qtd').AsInteger;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text := 'select codigo from produto order by codigo';
    dados.qryConsulta.Open;

    dados.qryConsulta.Last;
    dados.qryConsulta.First;

    if dados.qryConsulta.IsEmpty then
      exit;

    while not dados.qryConsulta.Eof do
    begin

      if Tag = 1 then
      begin

        qrySaldoA.Close;
        qrySaldoA.Params[0].Value := dados.qryConsulta.FieldByName('codigo')
          .AsInteger;
        qrySaldoA.Open;

        if qrySaldoA.IsEmpty then
          AtualizaEstoque(dados.qryConsulta.FieldByName('codigo').AsInteger, 0)
        else
          AtualizaEstoque(qrySaldoA.FieldByName('codigo').AsInteger,
            qrySaldoA.FieldByName('qtdr').AsFloat);
      end;

      if Tag = 2 then
      begin

        QrySaldoF.Close;
        QrySaldoF.Params[0].Value := dados.qryConsulta.FieldByName('codigo')
          .AsInteger;
        QrySaldoF.Open;

        if QrySaldoF.IsEmpty then
          AtualizaEstoqueFiscal(dados.qryConsulta.FieldByName('codigo')
            .AsInteger, 0)
        else
          AtualizaEstoqueFiscal(qrySaldoF.FieldByName('fk_produto').AsInteger,
            QrySaldoF.FieldByName('saldo').AsFloat);
      end;

      dados.qryConsulta.Next;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      Application.ProcessMessages;
    end;

    ShowMessage('Atualização concluída com sucesso!');
    BitBtn1.Enabled := true;
  except
    on e: exception do
    begin
      BitBtn1.Enabled := true;
      raise exception.Create(e.Message);
    end;

  end;

end;

procedure TfrmAcertaSaldo.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmAcertaSaldo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    Close;
end;

procedure TfrmAcertaSaldo.FormShow(Sender: TObject);
begin
  if Tag = 1 then
    caption := 'Estoque - Ajusta Saldo';
  if Tag = 2 then
    caption := 'Estoque - Ajusta Saldo Fiscal';

end;

end.
