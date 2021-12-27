unit uChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DB, serial,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Imaging.pngimage, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TfrmChave = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    btnSair: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskValidade: TMaskEdit;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    RllContato: TLabel;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    soma: integer;
    procedure calculachave;
    function MudaChave(Chave: string): string;
  public
    { Public declarations }

  end;

var
  frmChave: TfrmChave;

implementation

{$R *.dfm}

uses Udados, uDadosWeb;

procedure TfrmChave.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmChave.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TfrmChave.BitBtn2Click(Sender: TObject);
begin
  try
    BitBtn2.Enabled := false;
    try
      DadosWeb.ConexaoChave.close;
      DadosWeb.ConexaoChave.Open;
      if DadosWeb.ConexaoChave.Connected then
      begin
        DadosWeb.CadastraEmpresa;
        DadosWeb.RetornaSerial;
        ShowMessage('Atualização realizada com sucesso!');
        Application.Terminate;
      end;
    except
      on e: exception do
        raise exception.Create(e.Message + sLineBreak + 'Tente novamente!');
    end;
    close;
  finally
    BitBtn2.Enabled := true;
  end;
end;

procedure TfrmChave.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmChave.FormCreate(Sender: TObject);
begin
  RllContato.Caption := 'Fale Conosco:' +
    sLineBreak + 'Site..: loja.sofarena.com.br' + sLineBreak +
    'Email.: softarena@softarena.com.br' + sLineBreak +
    'Fone..: (34) 99623-3545 - WhatsApp..: (34) 99158-7421';

  MaskValidade.EditText := DateToStr(date + 30);
  calculachave;

end;

procedure TfrmChave.BitBtn1Click(Sender: TObject);
var
  contrasenha, senhapadrao: string;
  nTerminais: String;
  qTerminais: integer;
begin

  if Edit2.Text = '' then
  begin
    ShowMessage('Informe a Chave de Liberação!');
    exit;
  end;

  if length(Edit2.Text) < 15 then
  begin
    ShowMessage('Chave de Liberação Inválida!');
    exit;
  end;

  if MaskValidade.Text = '  /  /    ' then
  begin
    ShowMessage('Informe a Data de Validade da Licença!');
    exit;
  end;

  nTerminais := copy(Edit2.Text, Pos('-T', Edit2.Text) + 2, length(Edit2.Text));

  if Trim(nTerminais) = '' then
  begin
    ShowMessage('Chave inválida!');
    exit;
  end;

  senhapadrao := soma.ToString;

  MaskValidade.EditText := copy(MudaChave(Edit2.Text), 1, 2) + '/' +
    copy(MudaChave(Edit2.Text), 3, 2) + '/' + copy(MudaChave(Edit2.Text), 5, 4);

  contrasenha := Trim(copy(Edit2.Text, Pos('-', Edit2.Text) + 1, 5));

  qTerminais := round(MudaChave(nTerminais).ToInteger / 10);

  if contrasenha = senhapadrao then
    Edit2.Text := nserial;

  if nserial = Edit2.Text then
  begin
    with dados do
    begin

      qryChave.close;
      qryChave.Params[0].Value := dados.Getcomputer;
      qryChave.Open;

      if qryChave.IsEmpty then
      begin
        qryChave.Insert;
        dados.qryChaveMAQUINA.Value := dados.Getcomputer;
      end
      else
        qryChave.Edit;
      qryChaveCHAVEACESSO.Value := crypt('C', nserial);
      qryChave.Post;
      dados.Conexao.CommitRetaining;

      dados.qryEmpresa.Edit;
      dados.qryEmpresaDATA_VALIDADE.AsString :=
        dados.crypt('C', MaskValidade.Text);
      dados.qryEmpresaNSERIE.AsString := dados.crypt('C', '...');
      dados.qryEmpresaCHECA.Value := crypt('C', 'PRODUCAO');
      dados.qryEmpresaNTERM.AsString := dados.crypt('C', qTerminais.ToString);
      dados.qryEmpresaCSENHA.AsString := dados.crypt('C', 'N');

      dados.qryEmpresa.Post;
      dados.Conexao.CommitRetaining;
      close;
    end;
  end
  else
    ShowMessage('Chave Incorreta.');
end;

procedure TfrmChave.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmChave.Timer1Timer(Sender: TObject);
begin
  calculachave;
end;

function TfrmChave.MudaChave(Chave: string): string;
var
  tamanho, i: integer;
  nserial: String;
  vSerial: String;
begin
  Result := '';
  vSerial := Chave;
  // TiraPontos(dados.qryEmpresaCNPJ.Value)
  tamanho := length(vSerial);
  for i := 1 to tamanho do
  begin
    case vSerial[i] of
      '0':
        nserial := nserial + 'D';
      '1':
        nserial := nserial + 'B';
      '2':
        nserial := nserial + 'C';
      '3':
        nserial := nserial + 'A';
      '4':
        nserial := nserial + 'E';
      '5':
        nserial := nserial + 'F';
      '6':
        nserial := nserial + 'G';
      '7':
        nserial := nserial + 'H';
      '8':
        nserial := nserial + 'I';
      '9':
        nserial := nserial + 'J';

      'Z':
        nserial := nserial + '0';
      'L':
        nserial := nserial + '3';
      'X':
        nserial := nserial + '2';
      'O':
        nserial := nserial + '4';
      'W':
        nserial := nserial + '5';
      'M':
        nserial := nserial + '1';
      'V':
        nserial := nserial + '6';
      'N':
        nserial := nserial + '7';
      'H':
        nserial := nserial + '8';
      'J':
        nserial := nserial + '9';
    end;
  end;
  Result := nserial;
end;

procedure TfrmChave.calculachave;
var
  dia, mes, ano: Word;
  hora, min, sec, msec: Word;
begin
  DecodeDate(date, ano, mes, dia);
  DecodeTime(now, hora, min, sec, msec);

  Edit1.Text := MudaChave(ano.ToString) + '.' + MudaChave(mes.ToString) + '.' +
    MudaChave(dia.ToString) + '.' + MudaChave(hora.ToString) + '.' +
    MudaChave(min.ToString) + '.' + MudaChave(sec.ToString);

  soma := (ano * 7) + (mes * 6) + (dia * 5) + (hora * 4) + (min * 3) +
    (sec * 2);

end;

end.
