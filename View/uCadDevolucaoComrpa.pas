unit uCadDevolucaoComrpa;

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
  TfrmCadDevolucaoCompra = class(TForm)
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
    dsItens: TDataSource;
    qryItens: TFDQuery;
    ACBrEnterTab1: TACBrEnterTab;
    btnFinalizar: TSpeedButton;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    qrySoma: TFDQuery;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    dsProd: TDataSource;
    Label14: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    btnImporta: TBitBtn;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryQtdDevolvida: TFDQuery;
    qryCompra: TFDQuery;
    qryItensV: TFDQuery;
    qryDevolucao: TFDQuery;
    dsDevolucao: TDataSource;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    Label18: TLabel;
    qryDevolucaoCODIGO: TIntegerField;
    qryDevolucaoDATA: TDateField;
    qryDevolucaoFK_FORNECEDOR: TIntegerField;
    qryDevolucaoTOTAL: TFMTBCDField;
    qryDevolucaoNUMERO_COMPRA: TIntegerField;
    qryDevolucaoFK_EMPRESA: TIntegerField;
    qryDevolucaoFK_USUARIO: TIntegerField;
    qryItensCODIGO: TIntegerField;
    qryItensFK_DEVOLUCAO_COMPRA_M: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensQTD_COMPRADA: TFMTBCDField;
    qryItensQTD_DEVOLVIDA: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qrySomaTOTAL: TFMTBCDField;
    qryDevolucaoVIRTUAL_SITUACAO: TStringField;
    qryDevolucaoVIRTUAL_FORNECEDOR: TStringField;
    qryDevolucaoVIRTUAL_EMPRESA: TStringField;
    qryDevolucaoSITUACAO: TStringField;
    qryItensVIRTUAL_PRODUTO: TStringField;
    qryCompraID: TIntegerField;
    qryCompraEMPRESA: TSmallintField;
    qryCompraDTENTRADA: TDateField;
    qryCompraDTEMISSAO: TDateField;
    qryCompraFORNECEDOR: TIntegerField;
    qryCompraMODELO: TStringField;
    qryCompraSERIE: TStringField;
    qryCompraCHAVE: TStringField;
    qryCompraNR_NOTA: TStringField;
    qryCompraSUBTOTAL: TFMTBCDField;
    qryCompraFRETE: TFMTBCDField;
    qryCompraDESPESAS: TFMTBCDField;
    qryCompraSEGURO: TFMTBCDField;
    qryCompraDESCONTO: TFMTBCDField;
    qryCompraBASE_IPI: TFMTBCDField;
    qryCompraTOTAL_IPI: TFMTBCDField;
    qryCompraBASE_ICM: TFMTBCDField;
    qryCompraTOTAL_ICM: TFMTBCDField;
    qryCompraBASE_ST: TFMTBCDField;
    qryCompraTOTAL_ST: TFMTBCDField;
    qryCompraBASE_PIS: TFMTBCDField;
    qryCompraTOTAL_PIS: TFMTBCDField;
    qryCompraBASE_COF: TFMTBCDField;
    qryCompraTOTAL_COF: TFMTBCDField;
    qryCompraTOTAL: TFMTBCDField;
    qryCompraGERA_CP: TStringField;
    qryCompraGERA_ES: TStringField;
    qryCompraAJUSTA_PC: TStringField;
    qryCompraAJUSTA_PV: TStringField;
    qryCompraEHFISCAL: TStringField;
    qryCompraLEUXML: TStringField;
    qryCompraSTATUS: TStringField;
    qryCompraXML: TMemoField;
    qryCompraTIPO: TStringField;
    qryItensVID: TIntegerField;
    qryItensVFK_COMPRA: TIntegerField;
    qryItensVEMPRESA: TSmallintField;
    qryItensVITEM: TSmallintField;
    qryItensVFK_PRODUTO: TIntegerField;
    qryItensVCFOP: TStringField;
    qryItensVCST_ICM: TStringField;
    qryItensVVL_UNITARIO: TFMTBCDField;
    qryItensVQTD: TFMTBCDField;
    qryItensVE_MEDIO: TFMTBCDField;
    qryItensVVL_ITEM: TFMTBCDField;
    qryItensVBASE_IPI: TFMTBCDField;
    qryItensVALIQ_IPI: TFMTBCDField;
    qryItensVVL_IPI: TFMTBCDField;
    qryItensVBASE_ICMS: TFMTBCDField;
    qryItensVALIQ_ICMS: TFMTBCDField;
    qryItensVVL_ICMS: TFMTBCDField;
    qryItensVBASE_ST: TFMTBCDField;
    qryItensVVL_ST: TFMTBCDField;
    qryItensVBASE_PIS: TFMTBCDField;
    qryItensVALIQ_PIS: TFMTBCDField;
    qryItensVVL_PIS: TFMTBCDField;
    qryItensVBASE_COF: TFMTBCDField;
    qryItensVALIQ_COF: TFMTBCDField;
    qryItensVVL_COF: TFMTBCDField;
    qryItensVFRETE1: TFMTBCDField;
    qryItensVDESPESA: TFMTBCDField;
    qryItensVSEGURO: TFMTBCDField;
    qryItensVDESCONTO: TFMTBCDField;
    qryItensVGERA_CP: TStringField;
    qryItensVGERA_ES: TStringField;
    qryItensVSITUACAO: TStringField;
    qryItensVFK_PRODUTO_FORN: TStringField;
    qryItensVCST_PIS: TStringField;
    qryItensVCST_COF: TStringField;
    qryItensVCST_IPI: TStringField;
    qryItensVALIQ_ST: TFMTBCDField;
    qryItensVFK_USUARIO: TIntegerField;
    qryItensVQTD_DEVOLVIDA: TFMTBCDField;
    qryQtdDevolvidaQTD_VD: TFMTBCDField;
    qryQtdDevolvidaQTD_DEV: TFMTBCDField;
    qryItensFK_COMPRA_ITEM: TIntegerField;
    qryDevolucaoOBSERVACAO: TStringField;
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
    procedure qryItensBeforeEdit(DataSet: TDataSet);
    procedure qryDevolucaoBeforePost(DataSet: TDataSet);

  private
    idProduto: Integer;
    procedure CalculaTotais;
    procedure CalculaDevolucao(produto: Integer);
    procedure ChamaGrade;
    { Private declarations }
  public
    vPodeFecharTela: Boolean;
    { Public declarations }
  end;

var
  frmCadDevolucaoCompra: TfrmCadDevolucaoCompra;

implementation

{$R *.dfm}

uses Udados, uCadDevolucao, uDMEstoque, uGradeCompra, uGradeDevCo;

procedure TfrmCadDevolucaoCompra.FormActivate(Sender: TObject);
begin

  qryProd.Close;
  qryProd.Open;

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

end;

procedure TfrmCadDevolucaoCompra.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadDevolucaoCompra.FormShow(Sender: TObject);
begin
  qryProd.Close;
  qryProd.Open;

end;

procedure TfrmCadDevolucaoCompra.qryDevolucaoAfterOpen(DataSet: TDataSet);
begin
  qryItens.Close;
  qryItens.Open;

  qrySoma.Close;
  qrySoma.Open;

  qryClientes.Close;
  qryClientes.Open;

end;

procedure TfrmCadDevolucaoCompra.qryDevolucaoAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadDevolucaoCompra.qryDevolucaoBeforePost(DataSet: TDataSet);
begin
  if qryDevolucao.State = dsinsert then
    qryDevolucaoCODIGO.Value := dados.Numerador('DEVOLUCA_COMPRA_M', 'CODIGO',
      'N', '', '');

end;

procedure TfrmCadDevolucaoCompra.qryDevolucaoCalcFields(DataSet: TDataSet);
begin
  if qryDevolucaoSITUACAO.Value = 'A' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryDevolucaoSITUACAO.Value = 'F' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'FECHADA';
  if qryDevolucaoSITUACAO.Value = 'C' then
    qryDevolucaoVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadDevolucaoCompra.CalculaTotais;
begin
  qrySoma.Refresh;
  qryDevolucao.Edit;
  qryDevolucaoTOTAL.AsFloat := qrySomaTOTAL.AsFloat;
  qryDevolucao.Post;
end;

procedure TfrmCadDevolucaoCompra.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadDevolucaoCompra.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadDevolucaoCompra.cbEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadDevolucaoCompra.qryItensAfterDelete(DataSet: TDataSet);
begin
  CalculaTotais;
  CalculaDevolucao(idProduto);
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadDevolucaoCompra.CalculaDevolucao(produto: Integer);
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select sum(qtd_devolvida) qtd FROM DEVOLUCAO_COMPRA_D WHERE FK_COMPRA_ITEM=:COD';
  dados.qryConsulta.Params[0].Value := produto;
  dados.qryConsulta.Open;

  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE COMPRA_ITENS SET QTD_DEVOLVIDA=:QTD WHERE ID=:ID';
  dados.qryExecute.Params[0].Value := dados.qryConsulta.Fields[0].AsFloat;
  dados.qryExecute.Params[1].Value := produto;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadDevolucaoCompra.qryItensAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaDevolucao(idProduto);
  CalculaTotais;
end;

procedure TfrmCadDevolucaoCompra.qryItensBeforeDelete(DataSet: TDataSet);
begin
  idProduto := qryItensFK_COMPRA_ITEM.Value;
end;

procedure TfrmCadDevolucaoCompra.qryItensBeforeEdit(DataSet: TDataSet);
begin
  idProduto := -1;
end;

procedure TfrmCadDevolucaoCompra.qryItensBeforeInsert(DataSet: TDataSet);
begin
  idProduto := -1;
  if (qryDevolucao.State in dsEditModes) then
    qryDevolucao.Post;
end;

procedure TfrmCadDevolucaoCompra.qryItensBeforePost(DataSet: TDataSet);
begin
  qryItensTOTAL.AsFloat := qryItensQTD_DEVOLVIDA.AsFloat *
    qryItensPRECO.AsFloat;
  idProduto := qryItensFK_COMPRA_ITEM.Value;

  if qryItensQTD_DEVOLVIDA.AsFloat > qryItensQTD_COMPRADA.AsFloat then
    raise Exception.Create
      ('Quantidade Devolvida não pode ser miaor que Quantidade');

  if qryItens.State = dsEdit then
  begin
    ChamaGrade;
  end;

end;

procedure TfrmCadDevolucaoCompra.qryItensNewRecord(DataSet: TDataSet);
begin
  qryItensCODIGO.Value := dados.Numerador('DEVOLUCAO_DETALHE', 'CODIGO',
    'N', '', '');
  qryItensFK_DEVOLUCAO_COMPRA_M.Value := qryDevolucaoCODIGO.Value;
end;

procedure TfrmCadDevolucaoCompra.ChamaGrade;
var
  qryPesquisa: TFDQuery;
  eGrade: Boolean;
begin
  try
    qryPesquisa := TFDQuery.Create(self);
    qryPesquisa.Connection := dados.Conexao;
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Text :=
      ' select grade from produto where codigo=:codigo and grade=''S''';
    qryPesquisa.Params[0].Value := qryItensID_PRODUTO.AsInteger;
    qryPesquisa.Open;

    eGrade := qryPesquisa.FieldByName('GRADE').AsString = 'S';

    if eGrade then
    begin

      qryPesquisa.Connection := dados.Conexao;
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Text :=
        'DELETE from DEVOLUCAO_COMPRA_GRADE where FK_ITENS_COMPRA=:ID';
      qryPesquisa.Params[0].Value := qryItensFK_COMPRA_ITEM.AsInteger;
      qryPesquisa.ExecSQL;

      try
        FrmGradeDEVCo := TFrmGradeDEVCo.Create(Application);
        FrmGradeDEVCo.GeraGrade(qryItensFK_COMPRA_ITEM.AsInteger,
          qryItensQTD_DEVOLVIDA.AsFloat, qryDevolucaoCODIGO.Value);
        FrmGradeDEVCo.AbreGrade(qryItensFK_COMPRA_ITEM.AsInteger);
        FrmGradeDEVCo.edtQTD.Text := qryItensQTD_DEVOLVIDA.AsString;

        FrmGradeDEVCo.showmodal;
      finally
        FrmGradeDEVCo.Free;
      end;

    end;

  finally
    qryPesquisa.Free;
  end;

end;

procedure TfrmCadDevolucaoCompra.btnFinalizarClick(Sender: TObject);
begin

  DBEdit5.SetFocus;

  if qryItens.IsEmpty then
  begin
    ShowMessage('Informe os Itens da Devolução!');
    exit;
  end;

  If Application.messagebox('Tem certeza que FINALIZAR DEVOLUÇÃO?',
    'Confirmação', mb_yesno + mb_iconquestion) = idno then
    exit;

  try
    btnFinalizar.Enabled := false;
    if not(qryDevolucao.State in dsEditModes) then
      qryDevolucao.Edit;
    qryDevolucaoSITUACAO.Value := 'F';
    qryDevolucao.Post;

    DMEstoque.EstoqueDevCompra(qryDevolucaoCODIGO.Value);
    DMEstoque.EstoqueGRadeDevCompra(qryDevolucaoCODIGO.Value);
    DMEstoque.ApagaDevolucao_GRade(qryDevolucaoCODIGO.Value);

    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'DELETE FROM DEVOLUCAO_COMPRA_D WHERE QTD_DEVOLVIDA=0 AND FK_DEVOLUCAO_COMPRA_M=:COD';
    dados.qryExecute.Params[0].Value := qryDevolucaoCODIGO.Value;
    dados.qryExecute.ExecSQL;

    Close;
  finally
    btnFinalizar.Enabled := true;
  end;

end;

procedure TfrmCadDevolucaoCompra.btnGravarClick(Sender: TObject);
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

procedure TfrmCadDevolucaoCompra.btnImportaClick(Sender: TObject);
var
  vitem: Integer;
  qtd, qtdSaldo: Real;

begin
  try
    btnImporta.Enabled := false;

    if trim(DBEdit3.EditText) = '' then
    begin
      ShowMessage('Digite o número da Compra');
      exit;
    end;

    qryQtdDevolvida.Close;
    qryQtdDevolvida.Params[0].Value := DBEdit3.EditText;
    qryQtdDevolvida.Open;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select id FROM Compra where id=:cod and status=''F''';
    dados.qryConsulta.Params[0].Value := DBEdit3.EditText;
    dados.qryConsulta.Open;
    if dados.qryConsulta.IsEmpty then
    begin
      ShowMessage('Compra não encontrada ou não está  Finalizada!');
      exit;
    end;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      ' select sum(COALESCE(qtd,0)- COALESCE(qtd_devolvida,0)) saldo from COMPRA_ITENS'
      + ' where FK_COMPRA=:id';
    dados.qryConsulta.Params[0].Value := qryDevolucaoNUMERO_COMPRA.Value;
    dados.qryConsulta.Open;
    if (dados.qryConsulta.Fields[0].AsFloat <= 0) then
    begin
      ShowMessage('Compra já foi devolvida integralmente!');
      exit;
    end;

    qryCompra.Close;
    qryCompra.Params[0].Value := qryDevolucaoNUMERO_COMPRA.Value;
    qryCompra.Open;

    qryItensV.Close;
    qryItensV.Params[0].Value := qryCompraID.Value;
    qryItensV.Open;

    if not(qryDevolucao.State in dsEditModes) then
      qryDevolucao.Edit;

    qryDevolucaoFK_FORNECEDOR.Value := qryCompraFORNECEDOR.Value;
    qryDevolucaoFK_EMPRESA.Value := qryCompraEMPRESA.Value;
    qryDevolucao.Post;
    dados.Conexao.CommitRetaining;

    qryItensV.First;
    while not qryItensV.eof do
    begin

      if (qryItensVQTD.AsFloat - qryItensVQTD_DEVOLVIDA.AsFloat) > 0 then
      begin
        qryItens.Last;
        qryItens.Append;
        qryItensCODIGO.AsFloat := dados.Numerador('DEVOLUCAO_COMPRA_D',
          'CODIGO', 'N', '', '');
        qryItensID_PRODUTO.Value := qryItensVFK_PRODUTO.Value;
        qryItensFK_DEVOLUCAO_COMPRA_M.Value := qryDevolucaoCODIGO.Value;
        qryItensQTD_DEVOLVIDA.Value := 0;
        qryItensQTD_COMPRADA.Value := qryItensVQTD.AsFloat -
          qryItensVQTD_DEVOLVIDA.AsFloat;
        qryItensPRECO.AsFloat := qryItensVVL_UNITARIO.AsFloat;
        qryItensFK_COMPRA_ITEM.Value := qryItensVID.Value;
        qryItens.Post;
        dados.Conexao.CommitRetaining;
      end;
      qryItensV.Next;
    end;

  finally
    btnImporta.Enabled := true;
  end;
end;

procedure TfrmCadDevolucaoCompra.btnSairClick(Sender: TObject);
begin
  if Application.messagebox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_yesno) = mrYes then
    Close;
end;

procedure TfrmCadDevolucaoCompra.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadDevolucaoCompra.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadDevolucaoCompra.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

end.
