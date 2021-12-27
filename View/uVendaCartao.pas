unit uVendaCartao;

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
  TfrmCartaoParcela = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTotal: TEdit;
    edtParcela: TEdit;
    Label2: TLabel;
    BtnExcluir: TBitBtn;
    BtnGerar: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    dsCartao: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    qryCartao: TFDQuery;
    qryCartaoTENTRADA: TAggregateField;
    qryCartaoTSAIDA: TAggregateField;
    qryCartaoCODIGO: TIntegerField;
    qryCartaoEMISSAO: TDateField;
    qryCartaoDOC: TStringField;
    qryCartaoFKPLANO: TIntegerField;
    qryCartaoFKCONTA: TIntegerField;
    qryCartaoHISTORICO: TStringField;
    qryCartaoFKVENDA: TIntegerField;
    qryCartaoFKCOMPRA: TIntegerField;
    qryCartaoFKPAGAR: TIntegerField;
    qryCartaoFKRECEBER: TIntegerField;
    qryCartaoTRANSFERENCIA: TIntegerField;
    qryCartaoBLOQUEADO: TStringField;
    qryCartaoFK_CONTA1: TIntegerField;
    qryCartaoFK_PAI: TIntegerField;
    qryCartaoHORA_EMISSAO: TTimeField;
    qryCartaoECARTAO: TStringField;
    qryCartaoID_USUARIO: TIntegerField;
    qryCartaoEMPRESA: TIntegerField;
    qryCartaoFK_FICHA_CLI: TIntegerField;
    qryCartaoVISIVEL: TStringField;
    qryTaxa: TFDQuery;
    qryTaxaCODIGO: TIntegerField;
    qryTaxaEMISSAO: TDateField;
    qryTaxaDOC: TStringField;
    qryTaxaFKPLANO: TIntegerField;
    qryTaxaFKCONTA: TIntegerField;
    qryTaxaHISTORICO: TStringField;
    qryTaxaFKVENDA: TIntegerField;
    qryTaxaFKCOMPRA: TIntegerField;
    qryTaxaFKPAGAR: TIntegerField;
    qryTaxaFKRECEBER: TIntegerField;
    qryTaxaTRANSFERENCIA: TIntegerField;
    qryTaxaBLOQUEADO: TStringField;
    qryTaxaFK_CONTA1: TIntegerField;
    qryTaxaFK_PAI: TIntegerField;
    qryTaxaHORA_EMISSAO: TTimeField;
    qryTaxaECARTAO: TStringField;
    qryTaxaID_USUARIO: TIntegerField;
    qryTaxaEMPRESA: TIntegerField;
    qryTaxaFK_FICHA_CLI: TIntegerField;
    qryTaxaVISIVEL: TStringField;
    edtIntervalo: TEdit;
    Label4: TLabel;
    qryTaxaFK_CARTAO: TIntegerField;
    qryCartaoFK_CARTAO: TIntegerField;
    qryCartaoENTRADA: TFMTBCDField;
    qryCartaoSAIDA: TFMTBCDField;
    qryCartaoSALDO: TFMTBCDField;
    qryCartaoDT_CADASTRO: TDateField;
    qryCartaoFK_DEVOLUCAO: TIntegerField;
    qryTaxaENTRADA: TFMTBCDField;
    qryTaxaSAIDA: TFMTBCDField;
    qryTaxaSALDO: TFMTBCDField;
    qryTaxaDT_CADASTRO: TDateField;
    qryTaxaFK_DEVOLUCAO: TIntegerField;
    qryCartaoTIPO_MOVIMENTO: TStringField;
    qryTaxaTIPO_MOVIMENTO: TStringField;
    qryCartaoID_SUBCAIXA: TIntegerField;
    qryCartaoFPG: TIntegerField;
    qryTaxaID_SUBCAIXA: TIntegerField;
    qryTaxaFPG: TIntegerField;
    procedure edtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure qryCartaoAfterPost(DataSet: TDataSet);
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
    procedure GerarTaxa;
    { Private declarations }
  public
    idVenda, idCliente, idUsuario, idEmpresa, idFpg, idConta: integer;
    vValor: real;
    { Public declarations }
  end;

var
  frmCartaoParcela: TfrmCartaoParcela;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCartaoParcela.GerarTaxa;
var
  ValorTaxa, vTaxa: real;
begin
  dados.qryexecute.Close;
  dados.qryexecute.SQL.Text :=
    'select taxa from forma_pagamento where codigo=:cod';
  dados.qryexecute.Params[0].Value := 5;
  dados.qryexecute.Open;

  vTaxa := dados.qryexecute.Fields[0].AsFloat;

  qryCartao.First;
  qryTaxa.Close;
  qryTaxa.Open;
  while not qryCartao.Eof do
  begin
    ValorTaxa := (vTaxa * qryCartaoENTRADA.AsFloat) / 100;
    if ValorTaxa > 0 then
    begin
      qryTaxa.Insert;
      qryTaxaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
      qryTaxaEMISSAO.Value := qryCartaoEMISSAO.Value;
      qryTaxaDOC.Value := qryCartaoDOC.Value;
      qryTaxaENTRADA.Value := 0;
      qryTaxaSAIDA.AsFloat := ValorTaxa;
      qryTaxaHISTORICO.Value := 'REF.VENDA Nº' + IntToStr(idVenda) +
        ' - TAXA CARTÃO';
      qryTaxaECARTAO.Value := 'C';
      qryTaxaTIPO_MOVIMENTO.Value := 'TC';
      qryTaxaFKPLANO.Value := dados.qryEmpresaID_PLANO_TAXA_CARTAO.Value;
      qryTaxaFKVENDA.Value := idVenda;
      qryTaxaFK_CARTAO.Value := idFpg;
      qryTaxaFPG.Value := idFpg;
      qryTaxaFKCONTA.Value := idConta;
      if qryTaxaFKCONTA.AsInteger = 0 then
        qryTaxaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;
      qryTaxaDT_CADASTRO.Value := now;
      qryTaxaHORA_EMISSAO.Value := now;
      qryTaxaTRANSFERENCIA.Value := 0;
      qryTaxaEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryTaxaID_USUARIO.Value := dados.idUsuario;
      qryTaxa.Post;
    end;
    qryCartao.Next;
  end;
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCartaoParcela.btnAvancarClick(Sender: TObject);
var
  valor1, valor2: string;
begin

  if qryCartao.State in dsEditModes then
    qryCartao.Post;

  if not qryCartao.IsEmpty then
  begin
    valor1 := formatfloat('0.00', SimpleRoundTo(qryCartaoTENTRADA.Value, -2));
    valor2 := edtTotal.Text;
    if valor1.ToExtended <> valor2.ToExtended then
    begin
      ShowMessage('Atenção!' +
        'Não é possivel avançar. Total das parcelas difere do Valor total da venda!');
      exit;
    end;
    GerarTaxa;
  end;
  dados.vChamaImpressao := true;
  PodeFechar := true;
  Close;
end;

procedure TfrmCartaoParcela.Excluir;
begin
  try
    BtnExcluir.Enabled := false;
    while not qryCartao.IsEmpty do
    begin
      qryCartao.Delete;
    end;
  finally
    BtnExcluir.Enabled := true;
  end;
end;

procedure TfrmCartaoParcela.BtnExcluirClick(Sender: TObject);
begin
  if Application.messageBox('Tem certeza de que deseja excluir parcelas?',
    'Confirmação', mb_YesNo) = mrYes then
  begin
    Excluir;
  end;
end;

procedure TfrmCartaoParcela.BtnGerarClick(Sender: TObject);
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
      qryCartao.Insert;
      qryCartaoCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
      qryCartaoEMISSAO.Value := date + (i * strtoint(edtIntervalo.Text));
      qryCartaoDOC.Value := IntToStr(idVenda) + '/' + IntToStr(i);
      qryCartaoENTRADA.AsString :=
        formatfloat('0.00',
        SimpleRoundTo(vValor / strtoint(edtParcela.Text), -2));
      qryCartaoSAIDA.Value := 0;
      qryCartaoHISTORICO.Value := 'REF.VENDA Nº' + IntToStr(idVenda) +
        ' - CARTÃO DE CRÉDITO';
      qryCartaoECARTAO.Value := 'C';
      qryCartaoTIPO_MOVIMENTO.Value := 'CC';
      qryCartaoFKPLANO.Value := dados.qryEmpresaID_PLANO_VENDA.Value;
      qryCartaoFKVENDA.Value := idVenda;
      qryCartaoFK_CARTAO.Value := idFpg;
      qryCartaoFPG.Value := idFpg;
      qryCartaoFKCONTA.Value := idConta;
      if qryCartaoFKCONTA.Value = 0 then
        qryCartaoFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;

      qryCartaoEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryCartaoDT_CADASTRO.Value := now;
      qryCartaoHORA_EMISSAO.Value := now;
      qryCartaoID_USUARIO.Value := dados.idUsuario;
      qryCartaoTRANSFERENCIA.Value := 0;
      qryCartao.Post;
      dados.Conexao.CommitRetaining;
      vSoma := SimpleRoundTo(vSoma + qryCartaoENTRADA.AsFloat, -2);
    end;

    qryCartao.Refresh;
    qryCartao.First;
    vDif := vValor - vSoma;
    if vDif <> 0 then
    begin
      qryCartao.Edit;
      qryCartaoENTRADA.AsFloat :=
        SimpleRoundTo(qryCartaoENTRADA.AsFloat + vDif, -2);
      qryCartaoSAIDA.Value := SimpleRoundTo((vTaxa * qryCartaoENTRADA.AsFloat)
        / 100, -2);
      qryCartao.Post;
      dados.Conexao.CommitRetaining;
    end;

  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmCartaoParcela.btnVoltarClick(Sender: TObject);
begin
  PodeFechar := true;
  dados.vChamaImpressao := false;
  Close;
end;

procedure TfrmCartaoParcela.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCartaoParcela.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCartaoParcela.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCartaoParcela.edtParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmCartaoParcela.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmCartaoParcela.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCartaoParcela.FormShow(Sender: TObject);
begin
  qryCartao.Close;
  qryCartao.Params[0].Value := idVenda;
  qryCartao.Params[1].Value := idFpg;
  qryCartao.Open;
  BtnGerar.Click;
end;

procedure TfrmCartaoParcela.qryCartaoAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

end.
