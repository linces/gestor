unit uCadDevolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab;

type
  TfrmCadDevolucao = class(TForm)
    Panel1: TPanel;
    btnGravar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Shape1: TShape;
    DBText1: TDBText;
    dsItens: TDataSource;
    qryItens: TFDQuery;
    ACBrEnterTab1: TACBrEnterTab;
    btnFinalizar: TSpeedButton;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    DBEdit2: TDBEdit;
    qrySoma: TFDQuery;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    dsProd: TDataSource;
    Label14: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    qryVendasFPG: TFDQuery;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    qryCR: TFDQuery;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    qryCRTIPO: TStringField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    btnImporta: TBitBtn;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryVdd: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    qryQtdDevolvida: TFDQuery;
    qryVenda: TFDQuery;
    qryDevolucao: TFDQuery;
    qryDevolucaoCODIGO: TIntegerField;
    qryDevolucaoFK_VENDA: TIntegerField;
    qryDevolucaoFK_CLIENTE: TIntegerField;
    qryDevolucaoDATA: TDateField;
    qryDevolucaoOBS: TStringField;
    qryDevolucaoSITUACAO: TStringField;
    qryDevolucaoFKEMPRESA: TIntegerField;
    qryDevolucaoFK_VENDEDOR: TIntegerField;
    qryDevolucaoTIPO_DEVOLUCAO: TStringField;
    dsDevolucao: TDataSource;
    qryDevolucaoVIRTUAL_CLIENTE: TStringField;
    qryDevolucaoVIRTUAL_VENDEDOR: TStringField;
    qryDevolucaoVIRTUAL_SITUACAO: TStringField;
    qryDevolucaoVIRTUAL_EMPRESA: TStringField;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    Label18: TLabel;
    qryItensCODIGO: TIntegerField;
    qryItensFK_DEVOLUCAO: TIntegerField;
    qryItensFK_PRODUTO: TIntegerField;
    qryItensDESCRICAO: TStringField;
    qryItensFK_DEVOLUCAO_ITEM: TIntegerField;
    qryDevolucaoTOTAL: TFMTBCDField;
    qryItensQTD: TFMTBCDField;
    qryItensQTD_VENDIDA: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qrySomaTOTAL: TFMTBCDField;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryVendasFPGTIPO: TStringField;
    qryVendaCODIGO: TIntegerField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaDATA_SAIDA: TDateField;
    qryVendaID_CLIENTE: TIntegerField;
    qryVendaFK_USUARIO: TIntegerField;
    qryVendaFK_CAIXA: TIntegerField;
    qryVendaFK_VENDEDOR: TIntegerField;
    qryVendaCPF_NOTA: TStringField;
    qryVendaSUBTOTAL: TFMTBCDField;
    qryVendaTIPO_DESCONTO: TStringField;
    qryVendaDESCONTO: TFMTBCDField;
    qryVendaTROCO: TFMTBCDField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaOBSERVACOES: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaPERCENTUAL: TFMTBCDField;
    qryVendaTIPO: TStringField;
    qryVendaNECF: TIntegerField;
    qryVendaFKORCAMENTO: TIntegerField;
    qryVendaLOTE: TIntegerField;
    qryVendaGERA_FINANCEIRO: TStringField;
    qryVendaPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryVendaACRESCIMO: TFMTBCDField;
    qryVendaFK_TABELA: TIntegerField;
    qryVendaPEDIDO: TStringField;
    qryQtdDevolvidaQTD_VD: TFMTBCDField;
    qryQtdDevolvidaQTD_DEV: TFMTBCDField;
    qryVddCMA: TFMTBCDField;
    qryVddCMP: TFMTBCDField;
    qryItensITEM: TIntegerField;
    qryItensV: TFDQuery;
    qryItensVCODIGO: TIntegerField;
    qryItensVFKVENDA: TIntegerField;
    qryItensVID_PRODUTO: TIntegerField;
    qryItensVITEM: TSmallintField;
    qryItensVCOD_BARRA: TStringField;
    qryItensVQTD: TFMTBCDField;
    qryItensVE_MEDIO: TFMTBCDField;
    qryItensVPRECO: TFMTBCDField;
    qryItensVVALOR_ITEM: TFMTBCDField;
    qryItensVVDESCONTO: TFMTBCDField;
    qryItensVTOTAL: TFMTBCDField;
    qryItensVSITUACAO: TStringField;
    qryItensVUNIDADE: TStringField;
    qryItensVQTD_DEVOLVIDA: TFMTBCDField;
    qryItensVACRESCIMO: TFMTBCDField;
    qryItensVOS: TStringField;
    qryItensFK_GRADE: TIntegerField;
    qryItensVFK_GRADE: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryDevolucaoAfterPost(DataSet: TDataSet);
    procedure qryDevolucaoCalcFields(DataSet: TDataSet);
    procedure qryDevolucaoAfterOpen(DataSet: TDataSet);
    procedure qryItensBeforeInsert(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure qryItensAfterDelete(DataSet: TDataSet);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure btnImportaClick(Sender: TObject);
    procedure qryItensBeforePost(DataSet: TDataSet);
    procedure qryItensBeforeDelete(DataSet: TDataSet);
    procedure qryDevolucaoBeforePost(DataSet: TDataSet);

  private
    iTem: Integer;
    procedure CalculaTotais;
    procedure AjustaEstoque(operacao: String);
    procedure ajustafinanceiro;
    procedure CalculaDevolucao(produto: Integer);
    { Private declarations }
  public
    vPodeFecharTela: boolean;
    { Public declarations }
  end;

var
  frmCadDevolucao: TfrmCadDevolucao;

implementation

{$R *.dfm}

uses Udados, uDMEstoque;

procedure TfrmCadDevolucao.FormActivate(Sender: TObject);
begin

  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;

  qryProd.Close;
  qryProd.Open;

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

end;

procedure TfrmCadDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_f2 then
  begin
    btnGravarClick(self);
    abort;
  end;

  if Key = vk_f3 then
  begin
    btnFinalizarClick(self);
    abort;
  end;

  if Key = vk_F12 then
  begin
    if ActiveControl <> DBGridEh1 then
    begin
      btnSairClick(self);
      abort;
    end;
  end;
end;

procedure TfrmCadDevolucao.FormShow(Sender: TObject);
begin
  qryProd.Close;
  qryProd.Open;

end;

procedure TfrmCadDevolucao.qryDevolucaoAfterOpen(DataSet: TDataSet);
begin
  qryItens.Close;
  qryItens.Open;

  qrySoma.Close;
  qrySoma.Open;

  qryClientes.Close;
  qryClientes.Open;

  qryVdd.Close;
  qryVdd.Open;

  qryVendasFPG.Close;
  qryVendasFPG.Params[0].Value := qryDevolucaoFK_VENDA.Value;
  qryVendasFPG.Open;

end;

procedure TfrmCadDevolucao.qryDevolucaoAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadDevolucao.qryDevolucaoBeforePost(DataSet: TDataSet);
begin
  if qryDevolucao.State = dsinsert then
    qryDevolucaoCODIGO.Value := dados.Numerador('DEVOLUCAO_MASTER', 'CODIGO',
      'N', '', '');
end;

procedure TfrmCadDevolucao.qryDevolucaoCalcFields(DataSet: TDataSet);
begin
  if qryDevolucaoSITUACAO.Value = 'A' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryDevolucaoSITUACAO.Value = 'F' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'FECHADA';
  if qryDevolucaoSITUACAO.Value = 'C' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadDevolucao.CalculaTotais;
begin
  qrySoma.Refresh;
  qryDevolucao.Edit;
  qryDevolucaoTOTAL.AsFloat := qrySomaTOTAL.AsFloat;
  qryDevolucao.Post;
end;

procedure TfrmCadDevolucao.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadDevolucao.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadDevolucao.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadDevolucao.qryItensAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
  CalculaDevolucao(iTem);
end;

procedure TfrmCadDevolucao.CalculaDevolucao(produto: Integer);
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select sum(qtd) qtd FROM DEVOLUCAO_DETALHE WHERE FK_DEVOLUCAO_ITEM=:COD';
  dados.qryConsulta.Params[0].Value := produto;
  dados.qryConsulta.Open;

  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE VENDAS_DETALHE SET QTD_DEVOLVIDA=:QTD WHERE CODIGO=:ID';
  dados.qryExecute.Params[0].Value := dados.qryConsulta.Fields[0].AsFloat;
  dados.qryExecute.Params[1].Value := produto;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
  iTem := -1;

end;

procedure TfrmCadDevolucao.qryItensAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadDevolucao.qryItensBeforeDelete(DataSet: TDataSet);
begin
  iTem := qryItensFK_DEVOLUCAO_ITEM.Value;
end;

procedure TfrmCadDevolucao.qryItensBeforeInsert(DataSet: TDataSet);
begin
  if (qryDevolucao.State in dsEditModes) then
    qryDevolucao.Post;
end;

procedure TfrmCadDevolucao.qryItensBeforePost(DataSet: TDataSet);
begin
  qryItensTOTAL.AsFloat := qryItensQTD.AsFloat * qryItensPRECO.AsFloat;
  CalculaDevolucao(qryItensFK_DEVOLUCAO_ITEM.Value);

  if qryItensQTD.AsFloat > qryItensQTD_VENDIDA.AsFloat then
    raise Exception.Create
      ('Quantidade Devolvida não pode ser maior que Quantidade');

end;

procedure TfrmCadDevolucao.qryItensNewRecord(DataSet: TDataSet);
begin
  qryItensCODIGO.Value := dados.Numerador('DEVOLUCAO_DETALHE', 'CODIGO',
    'N', '', '');
  qryItensFK_DEVOLUCAO.Value := qryDevolucaoCODIGO.Value;
end;

procedure TfrmCadDevolucao.AjustaEstoque(operacao: String);
begin
  try
    qryItens.DisableControls;
    qryItens.First;
    while not qryItens.eof do
    begin
      if qryItensQTD.Value > 0 then
      begin

        dmEstoque.AtualizaEstoque(qryItensFK_PRODUTO.Value, qryItensQTD.AsFloat,
          0, operacao, 'R');
        dmEstoque.AtualizaGrade(qryItensFK_PRODUTO.Value,
          qryItensFK_GRADE.Value, qryItensQTD.AsFloat, 'E', 0);

        dmEstoque.AtualizaComposicao(qryItensFK_PRODUTO.Value,
          qryItensQTD.AsFloat, 0, 'E', 'R');

      end;
      qryItens.Next;
    end;
  finally
    qryItens.EnableControls;
  end;
end;

procedure TfrmCadDevolucao.ajustafinanceiro;
var
  valor: Real;
  vData: TDate;
  idConta: Integer;
begin
  vPodeFecharTela := true;
  if qryDevolucaoTIPO_DEVOLUCAO.Value = 'ESTORNA PARCELA' then
  begin

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'SELECT * FROM CRECEBER CR WHERE CR.FK_VENDA=:VENDA';
    dados.qryExecute.Params[0].Value := qryDevolucaoFK_VENDA.Value;
    dados.qryExecute.Open;

    if dados.qryExecute.IsEmpty then
    begin
      ShowMessage('Não existe Lançamento em Contas a Receber p/ esta Venda!');
      exit;
    end;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      ' select sum(qtd-qtd_vendida) saldo from DEVOLUCAO_DETALHE' +
      ' where FK_DEVOLUCAO=:id';
    dados.qryConsulta.Params[0].Value := qryDevolucaoCODIGO.Value;
    dados.qryConsulta.Open;

    if dados.qryConsulta.Fields[0].AsFloat = 0 then
    begin // devolução total
      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'DELETE FROM CRECEBER CR WHERE CR.FK_VENDA=:VENDA AND CR.VRECEBIDO=0';
      dados.qryExecute.Params[0].Value := qryDevolucaoFK_VENDA.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text :=
        'update CRECEBER CR set cr.vl_restante=0, cr.valor=cr.vrecebido WHERE CR.FK_VENDA=:VENDA AND CR.VRECEBIDO>0 and cr.vl_restante>0';
      dados.qryExecute.Params[0].Value := qryDevolucaoFK_VENDA.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;
    end
    else
    begin
      valor := qryDevolucaoTOTAL.AsFloat;
      while valor > 0 do
      begin

        qryCR.Close;
        qryCR.Params[0].Value := qryDevolucaoFK_VENDA.Value;
        qryCR.Open;
        if qryCRVALOR.Value <= qryDevolucaoTOTAL.Value then
        begin // deleta parcela
          valor := valor - qryCRVALOR.Value;
          qryCR.Delete;
        end
        else
        begin
          qryCR.Edit;
          qryCRDESCONTO.Value := valor;
          qryCRVL_RESTANTE.Value := qryCRVALOR.Value + qryCRJUROS.Value -
            qryCRDESCONTO.Value;
          qryCR.Post;
          valor := 0;
        end;
        dados.Conexao.CommitRetaining;
      end;
    end;
  end;

  if qryDevolucaoTIPO_DEVOLUCAO.Value = 'DEVOLVE DINHEIRO' then
  begin

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select coalesce((dinheiro-troco),0) as valor from vendas_master where codigo=:codigo';
    dados.qryConsulta.Params[0].Value := qryDevolucaoFK_VENDA.AsString;
    dados.qryConsulta.Open;

    if dados.qryConsulta.Fields[0].AsFloat = 0 then
      raise Exception.Create('Venda não foi feita em Dinheiro!');

    if dados.qryConsulta.Fields[0].AsFloat < qryDevolucaoTOTAL.AsFloat then
      raise Exception.Create
        ('Valor devolvido maior do que o valor pago em dinheiro R$' +
        FormatFloat(',0.00', dados.qryConsulta.Fields[0].AsFloat));

    dados.qryCaixa.Close;
    dados.qryCaixa.Params[0].Value := -1;
    dados.qryCaixa.Open;

    dados.qryCaixa.Insert;
    dados.qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO',
      'N', '', '');

    dados.qryCaixaEMISSAO.Value := date;

    dados.qryCaixaEMPRESA.Value := qryDevolucaoFKEMPRESA.Value;
    dados.qryCaixaDOC.Value := qryDevolucaoFK_VENDA.AsString;
    dados.qryCaixaHISTORICO.Value := 'DEVOLUÇÃO DA VENDA Nº' +
      qryDevolucaoFK_VENDA.AsString;
    dados.qryCaixaENTRADA.Value := 0;
    dados.qryCaixaSAIDA.Value := qryDevolucaoTOTAL.Value;
    dados.qryCaixaHORA_EMISSAO.Value := time;
    dados.qryCaixaID_USUARIO.Value := dados.idUsuario;
    dados.qryCaixaFKPLANO.Value :=
      dados.qryEmpresaID_PLANO_CONTA_DEVOLUCAO.Value;
    dados.qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;
    dados.qryCaixaFPG.Value := dados.qryEmpresaCOD_FPG_DINHEIRO.Value;
    dados.qryCaixaFK_DEVOLUCAO.Value := qryDevolucaoCODIGO.Value;
    dados.qryCaixaTRANSFERENCIA.Value := 0;
    dados.qryCaixaTIPO_MOVIMENTO.Value := 'DE';
    dados.qryCaixa.Post;
  end;

end;

procedure TfrmCadDevolucao.btnFinalizarClick(Sender: TObject);
begin

  DBEdit5.SetFocus;

  if qryItens.IsEmpty then
  begin
    ShowMessage('Informe os Itens da Devolução!');
    exit;
  end;

  if (qryDevolucaoTIPO_DEVOLUCAO.IsNull) or
    (trim(qryDevolucaoTIPO_DEVOLUCAO.Value) = '') then
  begin
    ShowMessage('Selecione o Tipo de Devolução!');
    exit;
  end;

  If application.messagebox('Tem certeza que FINALIZAR DEVOLUÇÃO?',
    'Confirmação', mb_yesno + mb_iconquestion) = idno then
    exit;

  if qryDevolucaoTIPO_DEVOLUCAO.Value = 'ESTORNA PARCELA' then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'SELECT * FROM CRECEBER CR WHERE CR.FK_VENDA=:VENDA';
    dados.qryExecute.Params[0].Value := qryDevolucaoFK_VENDA.Value;
    dados.qryExecute.Open;

    if dados.qryExecute.IsEmpty then
    begin
      ShowMessage('Não existe Lançamento em Contas a Receber p/ esta Venda!');
      exit;
    end;
  end;

  try
    btnFinalizar.Enabled := false;

    AjustaEstoque('E');
    ajustafinanceiro;

    if not(qryDevolucao.State in dsEditModes) then
      qryDevolucao.Edit;
    qryDevolucaoSITUACAO.Value := 'F';
    qryDevolucao.Post;

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'DELETE FROM DEVOLUCAO_DETALHE WHERE QTD=0 AND FK_DEVOLUCAO=:COD';
    dados.qryExecute.Params[0].Value := qryDevolucaoCODIGO.Value;
    dados.qryExecute.ExecSQL;

    Close;
  finally
    btnFinalizar.Enabled := true;
  end;

end;

procedure TfrmCadDevolucao.btnGravarClick(Sender: TObject);
begin
  try
    btnGravar.Enabled := false;
    if qryItens.IsEmpty then
    begin
      ShowMessage('Informe os Itens da Devolução!');
      exit;
    end;

    if (qryDevolucao.State in dsEditModes) then
      qryDevolucao.Post;
    ShowMessage('Devolução salva com sucesso!');
  finally
    btnGravar.Enabled := true;
  end;
end;

procedure TfrmCadDevolucao.btnImportaClick(Sender: TObject);
var
  vitem: Integer;
  qtd, qtdSaldo: Real;

begin

  try

    btnImporta.Enabled := false;

    if trim(DBEdit3.EditText) = '' then
    begin
      ShowMessage('Digite o número da venda');
      exit;
    end;

    qryQtdDevolvida.Close;
    qryQtdDevolvida.Params[0].Value := DBEdit3.EditText;
    qryQtdDevolvida.Open;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select codigo FROM vendas_master where codigo=:cod and situacao=''F''';
    dados.qryConsulta.Params[0].Value := DBEdit3.EditText;
    dados.qryConsulta.Open;
    if dados.qryConsulta.IsEmpty then
    begin
      ShowMessage('Venda não encontrada ou não está  Finalizada!');
      exit;
    end;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      ' select sum(COALESCE(qtd,0)- COALESCE(qtd_devolvida,0)) saldo from VENDAS_DETALHE'
      + ' where FKVENDA=:id';
    dados.qryConsulta.Params[0].Value := qryDevolucaoFK_VENDA.Value;
    dados.qryConsulta.Open;
    if (dados.qryConsulta.Fields[0].AsFloat <= 0) then
    begin
      ShowMessage('Venda já foi devolvida integralmente!');
      exit;
    end;

    qryVenda.Close;
    qryVenda.Params[0].Value := qryDevolucaoFK_VENDA.Value;
    qryVenda.Open;

    qryItensV.Close;
    qryItensV.Params[0].Value := qryVendaCODIGO.Value;
    qryItensV.Open;

    if not(frmCadDevolucao.qryDevolucao.State in dsEditModes) then
      frmCadDevolucao.qryDevolucao.Edit;

    frmCadDevolucao.qryDevolucaoFK_VENDEDOR.Value := qryVendaFK_VENDEDOR.Value;
    frmCadDevolucao.qryDevolucaoFK_CLIENTE.Value := qryVendaID_CLIENTE.Value;
    frmCadDevolucao.qryDevolucaoFKEMPRESA.Value := qryVendaFKEMPRESA.Value;
    frmCadDevolucao.qryDevolucao.Post;
    dados.Conexao.CommitRetaining;

    qryItensV.First;

    while not qryItensV.eof do
    begin

      if (qryItensVQTD.AsFloat - qryItensVQTD_DEVOLVIDA.AsFloat) > 0 then
      begin
        if frmCadDevolucao.qryItens.Locate('FK_DEVOLUCAO_ITEM',
          qryItensVCODIGO.Value) then
          frmCadDevolucao.qryItens.Edit
        else
        begin
          frmCadDevolucao.qryItens.Insert;
          frmCadDevolucao.qryItensCODIGO.AsFloat :=
            dados.Numerador('DEVOLUCAO_DETALHE', 'CODIGO', 'N', '', '');
        end;

        frmCadDevolucao.qryItensFK_PRODUTO.Value := qryItensVID_PRODUTO.Value;
        frmCadDevolucao.qryItensFK_DEVOLUCAO.Value :=
          frmCadDevolucao.qryDevolucaoCODIGO.Value;
        frmCadDevolucao.qryItensQTD.Value := 0;
        frmCadDevolucao.qryItensQTD_VENDIDA.Value := qryItensVQTD.AsFloat -
          qryItensVQTD_DEVOLVIDA.AsFloat;
        if qryItensVQTD.AsFloat > 0 then
          frmCadDevolucao.qryItensPRECO.AsFloat := qryItensVTOTAL.AsFloat /
            qryItensVQTD.AsFloat;
        frmCadDevolucao.qryItensFK_DEVOLUCAO_ITEM.Value :=
          qryItensVCODIGO.Value;
        frmCadDevolucao.qryItensITEM.AsFloat := qryItensVTOTAL.AsFloat;
        frmCadDevolucao.qryItensFK_GRADE.Value := qryItensVFK_GRADE.Value;

        frmCadDevolucao.qryItens.Post;
        dados.Conexao.CommitRetaining;
      end;
      qryItensV.Next;
    end;

  finally
    qryItens.Refresh;

    btnImporta.Enabled := true;
  end;
end;

procedure TfrmCadDevolucao.btnSairClick(Sender: TObject);
begin
  if application.messagebox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_yesno) = mrYes then
    Close;
end;

procedure TfrmCadDevolucao.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadDevolucao.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadDevolucao.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

end.
