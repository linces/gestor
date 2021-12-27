unit uAbreCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmAbreCaixa = class(TForm)
    Panel1: TPanel;
    dsCaixa: TDataSource;
    qryCaixa: TFDQuery;
    Image1: TImage;
    Panel4: TPanel;
    btnAbrir: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label2: TLabel;
    cbCaixa: TDBLookupComboboxEh;
    Label1: TLabel;
    edtValor: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    AtivaTempo: Boolean;
    procedure AbrePDV;
    procedure GeraCaixa;
    { Private declarations }
  public
    iTipo: Integer;
    { Public declarations }
  end;

var
  frmAbreCaixa: TfrmAbreCaixa;

implementation

{$R *.dfm}

uses Udados, uPDV;

procedure TfrmAbreCaixa.GeraCaixa;
var
  vValor: Extended;
begin

  vValor := StrToFloatDef(edtValor.Text, 0);

  if vValor > 0 then
  begin

    dados.Conexao.CommitRetaining;

    dados.qryCaixa.Close;
    dados.qryCaixa.Open;
    if not(dados.qryconsulta.IsEmpty) then
    begin
      dados.qryCaixa.Insert;
      dados.qryCaixaEMISSAO.Value := Date;
      dados.qryCaixaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      dados.qryCaixaEMISSAO.Value := Date;

      dados.qryCaixaDOC.Value := 'ABRE';

      dados.qryCaixaENTRADA.Value := 0;
      dados.qryCaixaSAIDA.AsFloat := vValor;

      dados.qryCaixaHISTORICO.Value := 'ABERTURA DE CAIXA -' + cbCaixa.Text;

      if dados.qryEmpresaID_PLANO_ABERTURA.IsNull then
        raise Exception.Create('Plano de contas não foi encontrado!');

      dados.qryCaixaHORA_EMISSAO.Value := time;
      dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
      dados.qryCaixaFKPLANO.Value :=
        dados.qryEmpresaID_PLANO_ABERTURA.AsInteger;
      dados.qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;
      dados.qryCaixaTIPO_MOVIMENTO.Value := 'VA';
      dados.qryCaixaFKVENDA.Value := 0;
      dados.qryCaixaTRANSFERENCIA.Value := 0;
      dados.qryCaixaFPG.Value := dados.buscafpg('D');
      dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
        'N', '', '');
      dados.qryCaixa.Post;
      dados.Conexao.CommitRetaining;
    end;
  end;
end;

procedure TfrmAbreCaixa.AbrePDV;
begin
  try
    if cbCaixa.KeyValue = Null then
    begin
      ShowMessage('Selecione caixa!');
      exit;
    end;

    if Trim(edtValor.Text) = '' then
      edtValor.Text := '0';

    dados.qryconsulta.Close;
    dados.qryconsulta.SQL.Text := 'SELECT MAX(LOTE) FROM CONTAS_MOVIMENTO';
    dados.qryconsulta.Open;

    dados.Lote := dados.qryconsulta.Fields[0].AsInteger + 1;

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'UPDATE CONTAS SET DATA_ABERTURA=CURRENT_DATE, SITUACAO=''A'', LOTE=:LOTE, ID_USUARIO=:ID WHERE CODIGO=:COD';
    dados.qryExecute.Params[0].Value := dados.Lote;
    dados.qryExecute.Params[1].Value := dados.idUsuario;
    dados.qryExecute.Params[2].Value := cbCaixa.KeyValue;
    dados.qryExecute.ExecSQL;

    dados.Conexao.CommitRetaining;

    FrmPDV.qryConta_Movimento.Close;
    FrmPDV.qryConta_Movimento.Params[0].Value := dados.Lote;
    FrmPDV.qryConta_Movimento.Params[1].Value := cbCaixa.KeyValue;
    FrmPDV.qryConta_Movimento.Open;

    FrmPDV.qryConta_Movimento.Insert;
    FrmPDV.qryConta_MovimentoID_CONTA_CAIXA.Value := cbCaixa.KeyValue;
    FrmPDV.qryConta_MovimentoHISTORICO.Value := 'ABERTURA DE CAIXA ';
    FrmPDV.qryConta_MovimentoDATA.Value := Date;
    FrmPDV.qryConta_MovimentoHORA.Value := now;
    FrmPDV.qryConta_MovimentoENTRADA.Value := strtofloat(edtValor.Text);
    FrmPDV.qryConta_MovimentoSAIDA.Value := 0;
    FrmPDV.qryConta_MovimentoFKVENDA.Value := 0;
    FrmPDV.qryConta_MovimentoLOTE.Value := dados.Lote;
    FrmPDV.qryConta_MovimentoID_USUARIO.Value := dados.idUsuario;
    FrmPDV.qryConta_Movimento.Post;
    dados.Conexao.CommitRetaining;

    GeraCaixa;

    dados.idCaixa := cbCaixa.KeyValue;

    FrmPDV.habilitacampos(true);
    case FrmPDV.PageControl2.ActivePageIndex of
      0:
        FrmPDV.EdtProdutoP.SetFocus;
      1:
        FrmPDV.EdtProdutoR.SetFocus;
      2:
        FrmPDV.EdtProdutoD.SetFocus;
    end;

    AtivaTempo := false;
    FrmPDV.btnCaixa.Caption := 'F2 | Fechar Caixa             ';
    FrmPDV.btnCaixa.Tag := 2;

    FrmPDV.MostraCaixa;
    Close;
  except
    on e: Exception do
      raise Exception.Create('Erro ao abrir caixa!' + #13 + e.Message);
  end;

end;

procedure TfrmAbreCaixa.btnAbrirClick(Sender: TObject);
begin
  if dados.Tela = 'PDV' then
    AbrePDV;

end;

procedure TfrmAbreCaixa.btnCancelarClick(Sender: TObject);
begin

  if application.messagebox('Deseja Sair da Tela?', 'Confirmação', mb_yesno) = mrYes
  then
  begin
    AtivaTempo := true;
    Close;
  end;
end;

procedure TfrmAbreCaixa.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmAbreCaixa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmAbreCaixa.FormCreate(Sender: TObject);
begin
  qryCaixa.Close;
  qryCaixa.Open;
end;

procedure TfrmAbreCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F10 then
    btnAbrir.Click;
  if Key = vk_escape then
    btnCancelar.Click;
end;

procedure TfrmAbreCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TfrmAbreCaixa.FormShow(Sender: TObject);
begin
  AtivaTempo := true;
end;

end.
