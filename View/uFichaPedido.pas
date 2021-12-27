unit uFichaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, ACBrBase,
  ACBrEnterTab;

type
  TfrmFichaPedido = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTotal: TEdit;
    edtParcela: TEdit;
    Label2: TLabel;
    BtnExcluir: TBitBtn;
    BtnGerar: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    dsFicha: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    qryFicha: TFDQuery;
    qryFichaTENTRADA: TAggregateField;
    qryFichaTSAIDA: TAggregateField;
    edtIntervalo: TEdit;
    Label4: TLabel;
    qryFichaCODIGO: TIntegerField;
    qryFichaFKPESSOA: TIntegerField;
    qryFichaDATA_EMISSAO: TDateField;
    qryFichaDATA_VENCIMENTO: TDateField;
    qryFichaHISTORICO: TStringField;
    qryFichaENTRADA: TFMTBCDField;
    qryFichaSAIDA: TFMTBCDField;
    qryFichaFKVENDA: TIntegerField;
    qryFichaFKEMPRESA: TIntegerField;
    qryFichaDOCUMENTO: TStringField;
    qryFichaFKPLANO: TIntegerField;
    qryFichaBLOQUEADO: TStringField;
    qryFichaFKPEDIDO: TIntegerField;
    procedure edtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    PodeFechar: Boolean;
    procedure Excluir;
    { Private declarations }
  public
    idVenda, idCliente, idUsuario, idEmpresa, idFpg, idConta: integer;
    vValor: real;
    Documento: String;
    { Public declarations }
  end;

var
  frmFichaPedido: TfrmFichaPedido;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmFichaPedido.btnAvancarClick(Sender: TObject);
var
  valor1, valor2: string;
begin
  if not qryFicha.IsEmpty then
  begin
    valor1 := formatfloat('0.00', SimpleRoundTo(qryFichaTENTRADA.Value, -2));
    valor2 := edtTotal.Text;
    if valor1.ToExtended <> valor2.ToExtended then
    begin
      ShowMessage('Atenção!' +
        'Não é possivel avançar. Total das parcelas difere do Valor total da venda!');
      exit;
    end;
  end;
  PodeFechar := true;
  Dados.vPodeFecharPedido := true;
  Close;
end;

procedure TfrmFichaPedido.Excluir;
begin
  try
    BtnExcluir.Enabled := false;
    while not qryFicha.IsEmpty do
    begin
      qryFicha.Delete;
    end;
  finally
    BtnExcluir.Enabled := true;
  end;
end;

procedure TfrmFichaPedido.BtnExcluirClick(Sender: TObject);
begin
  if Application.messageBox('Tem certeza de que deseja excluir parcelas?',
    'Confirmação', mb_YesNo) = mrYes then
  begin
    Excluir;
  end;
end;

procedure TfrmFichaPedido.BtnGerarClick(Sender: TObject);
var
  i: integer;
  vTaxa, vDif, vSoma: real;
begin

  if Application.messageBox('Tem certeza de que deseja gerar parcelas?',
    'Confirmação', mb_YesNo) <> mrYes then
    exit;

  try

    if strtoint(edtParcela.Text) = 0 then
    begin
      ShowMessage('Digite o numero de parcelas ');
      exit;
    end;

    Excluir;

    BtnGerar.Enabled := false;
    vSoma := 0;
    for i := 1 to strtoint(edtParcela.Text) do
    begin
      // CRÉDITO DO CARTÃO
      qryFicha.Insert;
      qryFichaCODIGO.Value := Dados.Numerador('PESSOA_CONTA', 'CODIGO',
        'N', '', '');
      qryFichaDATA_EMISSAO.Value := date + (i * strtoint(edtIntervalo.Text));
      qryFichaDATA_VENCIMENTO.Value := qryFichaDATA_EMISSAO.Value;
      qryFichaENTRADA.AsString := formatfloat('0.00',
        SimpleRoundTo(vValor / strtoint(edtParcela.Text), -2));
      qryFichaSAIDA.Value := 0;
      qryFichaHISTORICO.Value := 'REF.PEDIDO Nº' + IntToStr(idVenda) +
        ' - PARCELA ' + i.ToString;
      qryFichaFKPLANO.Value := Dados.qryEmpresaID_PLA_CONTA_FICHA_CLI.Value;
      qryFichaFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryFichaFKPEDIDO.Value := idVenda;
      qryFichaFKPESSOA.Value := idCliente;
      qryFichaDOCUMENTO.Value := Documento;
      qryFicha.Post;
      Dados.Conexao.CommitRetaining;
      vSoma := SimpleRoundTo(vSoma + qryFichaENTRADA.AsFloat, -2);
    end;

    qryFicha.Refresh;
    qryFicha.First;
    vDif := vValor - vSoma;
    if vDif <> 0 then
    begin
      qryFicha.Edit;
      qryFichaENTRADA.AsFloat :=
        SimpleRoundTo(qryFichaENTRADA.AsFloat + vDif, -2);
      qryFichaSAIDA.Value := SimpleRoundTo((vTaxa * qryFichaENTRADA.AsFloat)
        / 100, -2);
      qryFicha.Post;
      Dados.Conexao.CommitRetaining;
    end;

  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmFichaPedido.btnVoltarClick(Sender: TObject);
begin
  PodeFechar := true;
  Dados.vChamaImpressao := false;
  Close;
end;

procedure TfrmFichaPedido.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmFichaPedido.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmFichaPedido.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmFichaPedido.edtParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmFichaPedido.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmFichaPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BtnGerarClick(self);
  if Key = vk_f3 then
    BtnExcluirClick(self);
  if Key = vk_f4 then
    btnVoltarClick(self);
  if Key = vk_f5 then
    btnAvancarClick(self);
end;

procedure TfrmFichaPedido.FormShow(Sender: TObject);
begin
  qryFicha.Close;
  qryFicha.Params[0].Value := idVenda;
  qryFicha.Open;
end;

end.
