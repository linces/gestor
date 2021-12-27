unit uIBPT;

interface

uses
  ACBrIBPTax,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids,
  ACBrBase, ACBrSocket, ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmIBPT = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lVersao: TLabel;
    edArquivo: TEdit;
    btAbrir: TBitBtn;
    OpenDialog1: TOpenDialog;
    dsIBPT: TDataSource;
    SaveDialog1: TSaveDialog;
    ACBrIBPTax1: TACBrIBPTax;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    lbVigencia: TLabel;
    lblChave: TLabel;
    lblFonte: TLabel;
    qryIBPT: TFDQuery;
    qryUpdate: TFDQuery;
    qryIBPTCODIGO: TStringField;
    qryIBPTEX: TStringField;
    qryIBPTTIPO: TStringField;
    qryIBPTDESCRICAO: TStringField;
    qryIBPTNACIONALFEDERAL: TStringField;
    qryIBPTIMPORTADOSFEDERAL: TStringField;
    qryIBPTESTADUAL: TStringField;
    qryIBPTMUNICIPAL: TStringField;
    qryIBPTVIGENCIAINICIO: TStringField;
    qryIBPTVIGENCIAFIM: TStringField;
    qryIBPTCHAVE: TStringField;
    qryIBPTVERSAO: TStringField;
    qryIBPTFONTE: TStringField;
    qryPesquisa: TFDQuery;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btAbrirClick(Sender: TObject);
    procedure ACBrIBPTax1ErroImportacao(const ALinha, AErro: string);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    StrNCM: string;
    StrUF: string;
    StrEX_TIPI: String;
    StrCodInterno: string;
    StrDescricao: string;
    StrUnidade: string;
    StrValor: string;
    StrGTIN: string;
  public

  end;

var
  frmIBPT: TfrmIBPT;

implementation

uses
  ACBrUtil, Udados;

{$R *.dfm}

procedure TfrmIBPT.ACBrIBPTax1ErroImportacao(const ALinha, AErro: string);
begin
  Memo1.Lines.Add(ALinha);
  Memo1.Lines.Add(AErro);
  Memo1.Lines.Add('');
end;

procedure TfrmIBPT.btAbrirClick(Sender: TObject);
var
  I: Integer;
begin

  if not FilesExists(edArquivo.Text) then
  begin
    ShowMessage('Arquivo não existe!');
    exit;
  end;

  Memo1.Clear;

  Memo1.Lines.BeginUpdate;
  try
    btAbrir.Enabled := false;
    if ACBrIBPTax1.AbrirTabela(edArquivo.Text) then
    begin
      lVersao.Caption := 'Versão: ' + ACBrIBPTax1.VersaoArquivo;
      lbVigencia.Caption := 'Vigência: ' + Format('%s a %s',
        [DateToStr(ACBrIBPTax1.VigenciaInicio),
        DateToStr(ACBrIBPTax1.VigenciaFim)]);
      lblChave.Caption := 'Chave: ' + ACBrIBPTax1.ChaveArquivo;
      lblFonte.Caption := 'Fonte: ' + ACBrIBPTax1.Fonte;

      if ACBrIBPTax1.Itens.Count > 0 then
      begin
        qryUpdate.Close;
        qryUpdate.SQL.Clear;
        qryUpdate.SQL.Text := 'delete from ibpt';
        qryUpdate.ExecSQL;
        dados.Conexao.CommitRetaining;
      end;

      qryIBPT.Close;
      qryIBPT.Open;

      qryIBPT.Insert;
      qryIBPTCODIGO.AsString := '00000000';
      qryIBPTDESCRICAO.AsString := 'DIVERSOS';
      qryIBPTEX.AsString := '';
      qryIBPTTIPO.AsInteger := 0;
      qryIBPTNACIONALFEDERAL.AsString := '0';
      qryIBPTIMPORTADOSFEDERAL.AsString := '0';
      qryIBPTESTADUAL.AsString := '0';
      qryIBPTMUNICIPAL.AsString := '0';
      qryIBPTVIGENCIAINICIO.AsString := DateToStr(ACBrIBPTax1.VigenciaInicio);
      qryIBPTVIGENCIAFIM.AsString := DateToStr(ACBrIBPTax1.VigenciaFim);
      qryIBPTCHAVE.Value := ACBrIBPTax1.ChaveArquivo;
      qryIBPTVERSAO.AsString := ACBrIBPTax1.VersaoArquivo;
      qryIBPTFONTE.AsString := ACBrIBPTax1.Fonte;
      qryIBPT.Post;
      dados.Conexao.CommitRetaining;

      try
        for I := 0 to ACBrIBPTax1.Itens.Count - 1 do
        begin

          if length(ACBrIBPTax1.Itens[I].NCM) = 8 then
          begin
            qryPesquisa.Close;
            qryPesquisa.Params[0].Value := ACBrIBPTax1.Itens[I].NCM;
            qryPesquisa.Open;
            if qryPesquisa.IsEmpty then
            begin

              qryIBPT.Insert;
              qryIBPTCODIGO.AsString := ACBrIBPTax1.Itens[I].NCM;
              qryIBPTDESCRICAO.AsString := ACBrIBPTax1.Itens[I].Descricao;
              qryIBPTEX.AsString := ACBrIBPTax1.Itens[I].Excecao;
              qryIBPTTIPO.AsInteger := Integer(ACBrIBPTax1.Itens[I].Tabela);
              qryIBPTNACIONALFEDERAL.AsString :=
                StringReplace(floattostr(ACBrIBPTax1.Itens[I].FederalNacional),
                '.', ',', []);
              qryIBPTIMPORTADOSFEDERAL.AsString :=
                StringReplace(floattostr(ACBrIBPTax1.Itens[I].FederalImportado),
                '.', ',', []);
              qryIBPTESTADUAL.AsString :=
                StringReplace(floattostr(ACBrIBPTax1.Itens[I].Estadual),
                '.', ',', []);
              qryIBPTMUNICIPAL.AsString :=
                StringReplace(floattostr(ACBrIBPTax1.Itens[I].Municipal),
                '.', ',', []);
              qryIBPTVIGENCIAINICIO.AsString :=
                DateToStr(ACBrIBPTax1.VigenciaInicio);
              qryIBPTVIGENCIAFIM.AsString := DateToStr(ACBrIBPTax1.VigenciaFim);
              qryIBPTCHAVE.Value := ACBrIBPTax1.ChaveArquivo;
              qryIBPTVERSAO.AsString := ACBrIBPTax1.VersaoArquivo;
              qryIBPTFONTE.AsString := ACBrIBPTax1.Fonte;
              qryIBPT.Post;
              dados.Conexao.CommitRetaining;
              Application.ProcessMessages;
            end;
          end;
        end;
      finally
        Label4.Caption := 'Quantidade de itens: ' +
          IntToStr(qryIBPT.RecordCount);
      end;
    end;
  finally
    btAbrir.Enabled := true;
    Memo1.Lines.EndUpdate;

  end;
end;

procedure TfrmIBPT.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIBPT.Button1Click(Sender: TObject);
begin
 OpenDialog1.Execute;
 if OpenDialog1.FileName <> '' then
   edArquivo.Text:=OpenDialog1.FileName
 else
 ShowMessage('Arquivo Inválido!');

end;

procedure TfrmIBPT.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmIBPT.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

end.
