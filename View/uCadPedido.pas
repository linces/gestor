unit uCadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, frxClass,
  frxDBSet, frxExportPDF;

type
  TfrmCadPedido = class(TForm)
    Panel1: TPanel;
    btnFinalizar: TSpeedButton;
    btnSair: TSpeedButton;
    Shape1: TShape;
    dsPedido: TDataSource;
    DBText1: TDBText;
    dsItens: TDataSource;
    qryPV: TFDQuery;
    qryItens: TFDQuery;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    Label14: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    qryQtdProd: TFDQuery;
    qryQtdProdCODIGO: TIntegerField;
    qrySoma: TFDQuery;
    Label27: TLabel;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    dsProd: TDataSource;
    qryProdUNIDADE: TStringField;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesMUNICIPIO: TStringField;
    qryClientesUF: TStringField;
    qryClientesCEP: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesCELULAR1: TStringField;
    qryVendedor: TFDQuery;
    qryVendedorCODIGO: TIntegerField;
    qryVendedorNOME: TStringField;
    qryVendedorEMPRESA: TIntegerField;
    qryVendedorATIVO: TStringField;
    PageControl1: TPageControl;
    qryProdLOCALIZACAO: TStringField;
    Panel4: TPanel;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet1: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    Label8: TLabel;
    TabSheet5: TTabSheet;
    qryPVCODIGO: TIntegerField;
    qryPVFKEMPRESA: TIntegerField;
    qryPVFKCLIENTE: TIntegerField;
    qryPVENDERECO_COBRANCA: TStringField;
    qryPVCOMPLEMENTO_COBRANCA: TStringField;
    qryPVBAIRRO_COBRANCA: TStringField;
    qryPVCIDADE_COBRANCA: TStringField;
    qryPVUF_COBRANCA: TStringField;
    qryPVCEP_COBRANCA: TStringField;
    qryPVFONE_COBRANCA: TStringField;
    qryPVENDERECO_ENTREGA: TStringField;
    qryPVCOMPLEMENTO_ENTREGA: TStringField;
    qryPVBAIRRO_ENTREGA: TStringField;
    qryPVCIDADE_ENTREGA: TStringField;
    qryPVUF_ENTREGA: TStringField;
    qryPVCEP_ENTREGA: TStringField;
    qryPVTIPO_FRETE: TStringField;
    qryPVCONDICOES_PAGAMENTO: TMemoField;
    qryPVOBS: TMemoField;
    qryPVPROPRIEDADE: TStringField;
    qryPVBANCO: TStringField;
    qryPVAGENCIA: TStringField;
    qryPVGERENTE: TStringField;
    qryPVFONE_BANCO: TStringField;
    qryPVTIPO: TStringField;
    qryPVSITUACAO: TStringField;
    qryPVREPRESENTANTE: TStringField;
    qryPVDATA: TDateField;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    qryPVVIERUAL_EMPRESA: TStringField;
    qryPVVIRTUAL_CLIENTE: TStringField;
    qryPVVIRTUAL_CNPJ: TStringField;
    qryPVVIRTUAL_SITUACAO: TStringField;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label23: TLabel;
    Label7: TLabel;
    Label24: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    Label28: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit24: TDBEdit;
    Label32: TLabel;
    DBEdit26: TDBEdit;
    qryPVPRAZO_ENTREGA: TStringField;
    qryItensCODIGO: TIntegerField;
    qryItensFKPEDIDO: TIntegerField;
    qryItensFKPRODUTO: TIntegerField;
    PageControl2: TPageControl;
    TabSementes: TTabSheet;
    TabSal: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    qryItensVIRTUAL_PRODUTO: TStringField;
    qryItensTTOTAL: TAggregateField;
    qryItensVIRTUAL_PRECO: TExtendedField;
    qryPessoa_Cobranca: TFDQuery;
    qryPessoa_entrega: TFDQuery;
    qryPessoa_CobrancaFKCLIENTE: TIntegerField;
    qryPessoa_CobrancaENDERECO: TStringField;
    qryPessoa_CobrancaBAIRRO: TStringField;
    qryPessoa_CobrancaCIDADE: TStringField;
    qryPessoa_CobrancaCOMPLEMENTO: TStringField;
    qryPessoa_CobrancaUF: TStringField;
    qryPessoa_CobrancaCEP: TStringField;
    qryPessoa_CobrancaFONE: TStringField;
    qryPessoa_entregaFKCLIENTE: TIntegerField;
    qryPessoa_entregaENDERECO: TStringField;
    qryPessoa_entregaCOMPLEMENTO: TStringField;
    qryPessoa_entregaBAIRRO: TStringField;
    qryPessoa_entregaCIDADE: TStringField;
    qryPessoa_entregaUF: TStringField;
    qryPessoa_entregaCEP: TStringField;
    qryPessoa_entregaFONE: TStringField;
    DBComboBoxEh2: TDBComboBoxEh;
    DBMemoEh2: TDBMemoEh;
    qryPVFORMA_ENTREGA: TStringField;
    DBEdit1: TDBEdit;
    qryPVNUMERO: TIntegerField;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    qryPVCONDICAO_PAGAMENTO: TStringField;
    qryPVFORMA_PAGAMENTO: TStringField;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    qryPVCLIENTE_CIDADE: TStringField;
    qryPVCLIENTE_FONE: TStringField;
    qryPVCLIENTE_UF: TStringField;
    qryPVCLIENTE_CNPJ: TStringField;
    qryPVCLIENTE_IE: TStringField;
    qryItensPRODUTO: TStringField;
    qryPVCLIENTE_NOME: TStringField;
    DBEdit19: TDBEdit;
    Label31: TLabel;
    DBEdit25: TDBEdit;
    Label33: TLabel;
    DBComboBoxEh3: TDBComboBoxEh;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit27: TDBEdit;
    dsCidade: TDataSource;
    DBEdit28: TDBEdit;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdPR_CUSTO: TFMTBCDField;
    qrySomaSUBTOTAL: TFMTBCDField;
    qryPVTOTAL: TFMTBCDField;
    qryQtdProdQTD_ATUAL: TFMTBCDField;
    qryItensQUANTIDADE: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensVC: TFMTBCDField;
    qryItensPESO: TFMTBCDField;
    qryItensFRETE: TFMTBCDField;
    qryItensCAPACIDADE: TFMTBCDField;
    qryVendedorCMA: TFMTBCDField;
    qryVendedorCMP: TFMTBCDField;
    qryItensCOMISSAO: TFMTBCDField;
    qryItensTOTAL_COMISSAO: TFMTBCDField;
    qryPVTOTAL_COMISSAO: TFMTBCDField;
    Label36: TLabel;
    DBText3: TDBText;
    DBEdit29: TDBEdit;
    qryPVGERA_FINANCEIRO: TStringField;
    qryPVFK_FORNECEDOR: TIntegerField;
    DBCheckBox2: TDBCheckBox;
    qrySomaCOMISSAO: TFMTBCDField;
    Label37: TLabel;
    cbFornecedor: TDBLookupComboboxEh;
    qryPVVIRTUAL_FORNECEDOR: TStringField;
    DBText4: TDBText;
    Label38: TLabel;
    DBText5: TDBText;
    Label39: TLabel;
    qryPVTOTAL_FRETE: TFMTBCDField;
    qryPVTOTAL_LIQUIDO: TFMTBCDField;
    qryItensDESCONTO_FRETE: TFMTBCDField;
    qryItensTOTAL_LIQUIDO: TFMTBCDField;
    qrySomaFRETE: TFMTBCDField;
    qrySomaLIQUIDO: TFMTBCDField;
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryPVBeforeOpen(DataSet: TDataSet);
    procedure qryItensBeforeOpen(DataSet: TDataSet);
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryPVAfterPost(DataSet: TDataSet);
    procedure qryPVAfterOpen(DataSet: TDataSet);
    procedure qryItensBeforeInsert(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure qryItensAfterDelete(DataSet: TDataSet);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure qryItensBeforeEdit(DataSet: TDataSet);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryPVCalcFields(DataSet: TDataSet);
    procedure qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
    procedure qryPessoa_entregaAfterPost(DataSet: TDataSet);
    procedure qryPVFKCLIENTEValidate(Sender: TField);
    procedure qryItensFKPRODUTOChange(Sender: TField);
    procedure qryItensBeforePost(DataSet: TDataSet);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure qryItensQUANTIDADEChange(Sender: TField);
    procedure qryItensPESOChange(Sender: TField);
    procedure qryItensCOMISSAOChange(Sender: TField);
    procedure qryItensCAPACIDADEValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
  private
    QtdAnterior: extended;
    VerificaEstoque: boolean;
    letras: string[50];
    procedure CalculaTotais;
    procedure Entrega(id: Integer; Operacao: string);
    procedure Cobranca(id: Integer; Operacao: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

uses Udados, uFichaPedido;

procedure TfrmCadPedido.btnFinalizarClick(Sender: TObject);
begin
  try
    btnFinalizar.Enabled := false;
    if qryItens.IsEmpty then
    begin
      ShowMessage('Informe os Itens do Pedido!');
      exit;
    end;

    if qryPVFK_FORNECEDOR.IsNull then
    begin
      ShowMessage('Informe o Fornecedor!');
      exit;
    end;

    If Application.messagebox('Tem certeza que FINALIZAR PEDIDO?',
      'Confirmação', mb_yesno + mb_iconquestion) = idno then
      exit;

    if DBCheckBox2.Checked then
    begin
      if qryPVTOTAL_COMISSAO.AsFloat > 0 then
      begin
        try
          Dados.vPodeFecharPedido := false;
          frmFichaPedido := tfrmFichaPedido.Create(Application);
          frmFichaPedido.edtParcela.Text := '1';
          frmFichaPedido.Documento := Dados.Tela;
          frmFichaPedido.edtTotal.Text :=
            formatfloat('0.00', qryPVTOTAL_COMISSAO.AsFloat);
          frmFichaPedido.vValor := qryPVTOTAL_COMISSAO.AsFloat;
          frmFichaPedido.idVenda := qryPVCODIGO.Value;
          frmFichaPedido.idCliente := qryPVFK_FORNECEDOR.Value;
          Dados.vPodeFecharCompra := false;
          frmFichaPedido.ShowModal;
        except
          frmFichaPedido.Release;
        end;
      end;
    end
    else
      Dados.vPodeFecharPedido := true;

    if not Dados.vPodeFecharPedido then
      exit;

    if not(Dados.qryPV.State in dsEditModes) then
      qryPV.edit;
    qryPVSITUACAO.Value := 'F';
    qryPV.Post;

    Cobranca(qryPVFKCLIENTE.Value, 'ALTERAR');
    Entrega(qryPVFKCLIENTE.Value, 'ALTERAR');

  finally
    VerificaEstoque := true;
    btnFinalizar.Enabled := true;
  end;

  Close;
end;

procedure TfrmCadPedido.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmCadPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryPV.State in dsEditModes then
  begin
    If Application.messagebox('Deseja salvar PEDIDO?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      qryPV.Post;
    end;
  end;
end;

procedure TfrmCadPedido.FormCreate(Sender: TObject);
begin
  VerificaEstoque := true;

  qryClientes.Close;
  qryClientes.Open;

  qryProd.Close;
  qryProd.Open;

  Dados.qryCidade.Close;
  Dados.qryCidade.Open;

  qryVendedor.Close;
  qryVendedor.Open;

  Dados.qryPesqEmp.Close;
  Dados.qryPesqEmp.Open;

  if Dados.Tela = 'SEMENTE' then
  begin
    caption := 'Lançamento de Pedidos [SEMENTES]';
    TabSementes.TabVisible := true;
    TabSal.TabVisible := false;
    PageControl1.ActivePageIndex := 0;
  end
  else
  begin
    caption := 'Lançamento de Pedidos [SAL]';
    TabSal.TabVisible := true;
    TabSementes.TabVisible := false;
    PageControl1.ActivePageIndex := 1;
  end;

end;

procedure TfrmCadPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f3 then
  begin
    btnFinalizarClick(self);
    abort;
  end;

  if Key = VK_ESCAPE then
  begin
    if (ActiveControl <> DBGridEh1) and (ActiveControl <> DBGridEh2) then
    begin
      if Application.messagebox('Tem certeza de que deseja sair?',
        'Confirmação', mb_yesno) = mrYes then
        btnSairClick(self);
    end;
    abort;
  end;
end;

procedure TfrmCadPedido.FormShow(Sender: TObject);
begin
  Dados.qryFornecedor.Close;
  Dados.qryFornecedor.Open;


end;

procedure TfrmCadPedido.qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadPedido.qryPessoa_entregaAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadPedido.qryPVAfterOpen(DataSet: TDataSet);
begin
  qryItens.Close;
  qryItens.Open;

  qrySoma.Close;
  qrySoma.Open;

end;

procedure TfrmCadPedido.qryPVAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadPedido.Entrega(id: Integer; Operacao: string);
begin
  qryPessoa_entrega.Close;
  qryPessoa_entrega.Params[0].Value := id;
  qryPessoa_entrega.Open;

  if Operacao = 'BUSCA' then
  begin

    if not qryPessoa_entrega.IsEmpty then
    begin

      if qryPV.State in dsEditModes then
      begin
        qryPVENDERECO_ENTREGA.Value := qryPessoa_entregaENDERECO.Value;
        qryPVBAIRRO_ENTREGA.Value := qryPessoa_entregaBAIRRO.Value;
        qryPVCIDADE_ENTREGA.Value := qryPessoa_entregaCIDADE.Value;
        qryPVUF_ENTREGA.Value := qryPessoa_entregaUF.Value;
        qryPVCEP_ENTREGA.Value := qryPessoa_entregaCEP.Value;
        qryPVCOMPLEMENTO_ENTREGA.Value := qryPessoa_entregaCOMPLEMENTO.Value;
      end;

    end;

  end;

  if Operacao = 'ALTERAR' then
  begin

    if (trim(qryPVENDERECO_ENTREGA.Value) <> '') and
      (not qryPVENDERECO_ENTREGA.IsNull) then
    begin

      if qryPessoa_entrega.IsEmpty then
      begin
        qryPessoa_entrega.Insert;
        qryPessoa_entregaFKCLIENTE.Value := qryPVFKCLIENTE.Value;
      end
      else
        qryPessoa_entrega.edit;
      qryPessoa_entregaENDERECO.Value := qryPVENDERECO_ENTREGA.Value;
      qryPessoa_entregaCOMPLEMENTO.Value := qryPVCOMPLEMENTO_ENTREGA.Value;
      qryPessoa_entregaBAIRRO.Value := qryPVBAIRRO_ENTREGA.Value;
      qryPessoa_entregaCIDADE.Value := qryPVCIDADE_ENTREGA.Value;
      qryPessoa_entregaUF.Value := qryPVUF_ENTREGA.Value;
      qryPessoa_entregaCEP.Value := qryPVCEP_ENTREGA.Value;
      qryPessoa_entrega.Post;
    end;

  end;

end;

procedure TfrmCadPedido.Cobranca(id: Integer; Operacao: string);
begin
  qryPessoa_Cobranca.Close;
  qryPessoa_Cobranca.Params[0].Value := id;
  qryPessoa_Cobranca.Open;

  if Operacao = 'PESQUISA' then
  begin

    if not qryPessoa_Cobranca.IsEmpty then
    begin

      if qryPV.State in dsEditModes then
      begin
        qryPVENDERECO_COBRANCA.Value := qryPessoa_CobrancaENDERECO.Value;
        qryPVBAIRRO_COBRANCA.Value := qryPessoa_CobrancaBAIRRO.Value;
        qryPVCIDADE_COBRANCA.Value := qryPessoa_CobrancaCIDADE.Value;
        qryPVUF_COBRANCA.Value := qryPessoa_CobrancaUF.Value;
        qryPVCEP_COBRANCA.Value := qryPessoa_CobrancaCEP.Value;
        qryPVCOMPLEMENTO_COBRANCA.Value := qryPessoa_CobrancaCOMPLEMENTO.Value;
        qryPVFONE_COBRANCA.Value := qryPessoa_CobrancaFONE.Value;
      end;

    end;

  end;

  if Operacao = 'ALTERAR' then
  begin

    if (trim(qryPVENDERECO_COBRANCA.Value) <> '') and
      (not qryPVENDERECO_COBRANCA.IsNull) then
    begin

      if qryPessoa_Cobranca.IsEmpty then
      begin
        qryPessoa_Cobranca.Insert;
        qryPessoa_CobrancaFKCLIENTE.Value := qryPVFKCLIENTE.Value;
      end
      else
        qryPessoa_Cobranca.edit;
      qryPessoa_CobrancaENDERECO.Value := qryPVENDERECO_COBRANCA.Value;
      qryPessoa_CobrancaCOMPLEMENTO.Value := qryPVCOMPLEMENTO_COBRANCA.Value;
      qryPessoa_CobrancaBAIRRO.Value := qryPVBAIRRO_COBRANCA.Value;
      qryPessoa_CobrancaCIDADE.Value := qryPVCIDADE_COBRANCA.Value;
      qryPessoa_CobrancaUF.Value := qryPVUF_COBRANCA.Value;
      qryPessoa_CobrancaCEP.Value := qryPVCEP_COBRANCA.Value;
      qryPessoa_CobrancaFONE.Value := qryPVFONE_COBRANCA.Value;
      qryPessoa_Cobranca.Post;
    end;

  end;

end;

procedure TfrmCadPedido.qryPVBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryClientes.Close;
  Dados.qryClientes.Open;

  Dados.qryVendedor.Close;
  Dados.qryVendedor.Open;
end;

procedure TfrmCadPedido.qryPVCalcFields(DataSet: TDataSet);
begin
  if qryPVSITUACAO.Value = 'N' then
    qryPVVIRTUAL_SITUACAO.Value := 'NOVO';
  if qryPVSITUACAO.Value = 'A' then
    qryPVVIRTUAL_SITUACAO.Value := 'ALTERANDO';
  if qryPVSITUACAO.Value = 'F' then
    qryPVVIRTUAL_SITUACAO.Value := 'FECHADA';
  if qryPVSITUACAO.Value = 'C' then
    qryPVVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadPedido.qryPVFKCLIENTEValidate(Sender: TField);
begin
  Cobranca(qryPVFKCLIENTE.Value, 'BUSCA');
  Entrega(qryPVFKCLIENTE.Value, 'BUSCA');
end;

procedure TfrmCadPedido.CalculaTotais;
begin

  qrySoma.Close;
  qrySoma.Params[0].Value := qryPVCODIGO.Value;
  qrySoma.Open;

  qryPV.edit;
  qryPVTOTAL_COMISSAO.AsFloat := qrySomaCOMISSAO.AsFloat;
  qryPVTOTAL.AsFloat := qrySomaSUBTOTAL.AsFloat;
  qryPVTOTAL_FRETE.AsFloat := qrySomaFRETE.AsFloat;
  qryPVTOTAL_LIQUIDO.AsFloat := qrySomaLIQUIDO.AsFloat;
  qryPV.Post;

end;

procedure TfrmCadPedido.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadPedido.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadPedido.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPedido.qryItensAfterDelete(DataSet: TDataSet);
begin
  CalculaTotais;
end;

procedure TfrmCadPedido.qryItensAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadPedido.qryItensBeforeEdit(DataSet: TDataSet);
begin
  QtdAnterior := qryItensQUANTIDADE.AsFloat;
end;

procedure TfrmCadPedido.qryItensBeforeInsert(DataSet: TDataSet);
begin
  QtdAnterior := 0;
  if (qryPV.State in dsEditModes) then
    qryPV.Post;
end;

procedure TfrmCadPedido.qryItensBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryProd.Close;
  Dados.qryProd.Open;
end;

procedure TfrmCadPedido.qryItensBeforePost(DataSet: TDataSet);
begin
  qryItensTOTAL.AsFloat := qryItensQUANTIDADE.AsFloat * qryItensPRECO.AsFloat;
  qryItensDESCONTO_FRETE.AsFloat := qryItensFRETE.AsFloat *
    qryItensPESO.AsFloat;
  qryItensTOTAL_LIQUIDO.AsFloat := qryItensTOTAL.AsFloat -
    qryItensDESCONTO_FRETE.AsFloat;
  qryItensTOTAL_COMISSAO.AsFloat :=
    (qryItensTOTAL_LIQUIDO.AsFloat * qryItensCOMISSAO.AsFloat) / 100;
end;

procedure TfrmCadPedido.qryItensCAPACIDADEValidate(Sender: TField);
begin
  if Dados.Tela = 'SAL' then
    qryItensPESO.AsFloat := qryItensCAPACIDADE.AsFloat *
      qryItensQUANTIDADE.AsFloat;
end;

procedure TfrmCadPedido.qryItensCOMISSAOChange(Sender: TField);
begin

  qryItensTOTAL_COMISSAO.AsFloat :=
    (qryItensCOMISSAO.AsFloat * qryItensTOTAL_LIQUIDO.AsFloat) / 100;
end;

procedure TfrmCadPedido.qryItensFKPRODUTOChange(Sender: TField);
begin
  qryItensPRECO.Value := qryItensVIRTUAL_PRECO.Value;
end;

procedure TfrmCadPedido.qryItensNewRecord(DataSet: TDataSet);
begin
  qryItensCODIGO.Value := Dados.Numerador('PEDIDO_DETALHE', 'CODIGO',
    'N', '', '');
  qryItensFKPEDIDO.Value := qryPVCODIGO.Value;
  qryItensPRECO.Value := 0;
  qryItensQUANTIDADE.Value := 1;
end;

procedure TfrmCadPedido.qryItensPESOChange(Sender: TField);
begin
  qryItensDESCONTO_FRETE.AsFloat := qryItensFRETE.AsFloat *
    qryItensPESO.AsFloat;
  qryItensTOTAL_LIQUIDO.AsFloat := qryItensTOTAL.AsFloat -
    qryItensDESCONTO_FRETE.AsFloat;
end;

procedure TfrmCadPedido.qryItensQUANTIDADEChange(Sender: TField);
begin
  qryItensTOTAL.Value := qryItensPRECO.Value * qryItensQUANTIDADE.Value;
  if Dados.Tela = 'SAL' then
    qryItensPESO.AsFloat := qryItensCAPACIDADE.AsFloat *
      qryItensQUANTIDADE.AsFloat;

end;

Procedure TfrmCadPedido.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPedido.DBEdit11Exit(Sender: TObject);
begin
  DBGridEh1.SetFocus;
end;

procedure TfrmCadPedido.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  if odd((Sender as TDBGridEh).DataSource.DataSet.RecNo) then
    (Sender as TDBGridEh).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGridEh).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGridEh).Canvas.Font.Color := clBlack;
    (Sender as TDBGridEh).Canvas.Brush.Color := clSilver;
    DBGridEh1.Canvas.Font.Size := 10;
  end
  else
    DBGridEh1.Canvas.Font.Size := 9;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadPedido.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadPedido.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadPedido.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadPedido.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  if odd((Sender as TDBGridEh).DataSource.DataSet.RecNo) then
    (Sender as TDBGridEh).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGridEh).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGridEh).Canvas.Font.Color := clBlack;
    (Sender as TDBGridEh).Canvas.Brush.Color := clSilver;
    DBGridEh2.Canvas.Font.Size := 10;
  end
  else
    DBGridEh2.Canvas.Font.Size := 9;
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmCadPedido.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh2.Perform(WM_KEYDOWN, VK_TAB, 0);

end;

end.
