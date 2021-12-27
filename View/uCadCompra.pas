unit uCadCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, pcnAuxiliar, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, Vcl.Grids,
  Vcl.DBGrids, JvComponentBase, JvEnterTab;

type
  TfrmCadCompra = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    GroupBox2: TGroupBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    dsCompra: TDataSource;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    Label26: TLabel;
    dsItens: TDataSource;
    qryCompra: TFDQuery;
    qryCompraTTOTAL: TAggregateField;
    qryItensCompra: TFDQuery;
    qryCompraID: TIntegerField;
    qryCompraEMPRESA: TSmallintField;
    qryCompraDTENTRADA: TDateField;
    qryCompraDTEMISSAO: TDateField;
    qryCompraFORNECEDOR: TIntegerField;
    qryCompraMODELO: TStringField;
    qryCompraSERIE: TStringField;
    qryCompraCHAVE: TStringField;
    qryCompraGERA_CP: TStringField;
    qryCompraGERA_ES: TStringField;
    qryCompraAJUSTA_PC: TStringField;
    qryCompraAJUSTA_PV: TStringField;
    qryCompraEHFISCAL: TStringField;
    qryCompraLEUXML: TStringField;
    qryCompraSTATUS: TStringField;
    qryItensCompraID: TIntegerField;
    qryItensCompraFK_COMPRA: TIntegerField;
    qryItensCompraEMPRESA: TSmallintField;
    qryItensCompraITEM: TSmallintField;
    qryItensCompraFK_PRODUTO: TIntegerField;
    qryItensCompraCFOP: TStringField;
    qryItensCompraCST_ICM: TStringField;
    qryItensCompraQTD: TFMTBCDField;
    qryCompraVIRTUAL_FORNECEDOR: TStringField;
    qryCompraVIRTUAL_UF: TStringField;
    qryCompraVIRTUAL_CNPJ: TStringField;
    qryCompraVIRTUAL_SITUACAO: TStringField;
    qryCompraNR_NOTA: TStringField;
    qrySoma: TFDQuery;
    qryCompraXML: TMemoField;
    qryItensCompraGERA_CP: TStringField;
    qryItensCompraGERA_ES: TStringField;
    qryItensCompraSITUACAO: TStringField;
    qryCompraTIPO: TStringField;
    qryProd: TFDQuery;
    dsProd: TDataSource;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    qryCompraVIRTUAL_EMPRESA: TStringField;
    qryItensCompraVIRTUAL_PRODUTO: TStringField;
    qryItensCompraFK_PRODUTO_FORN: TStringField;
    Panel4: TPanel;
    btnPessoas: TSpeedButton;
    qryFornecedor: TFDQuery;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorUF: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryItensCompraVIRTUAL_PRECO: TExtendedField;
    qryItensCompraCST_PIS: TStringField;
    qryItensCompraCST_COF: TStringField;
    qryItensCompraCST_IPI: TStringField;
    qryItensCompraFK_USUARIO: TIntegerField;
    qryItensCompraVIRTUAL_CSTE: TStringField;
    qryItensCompraVIRTUAL_CTS_IPI: TStringField;
    qryItensCompraVIRTUAL_ALIQ_PIS: TFloatField;
    qryItensCompraVIRTUAL_ALIQ_COF: TFloatField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryProdCSTE: TStringField;
    qryProdCSTIPI: TStringField;
    qryProdALIQ_PIS: TCurrencyField;
    qryProdALIQ_COF: TCurrencyField;
    qrySomaTOTAL: TFMTBCDField;
    qrySomaBIPI: TFMTBCDField;
    qrySomaBICMS: TFMTBCDField;
    qrySomaBST: TFMTBCDField;
    qrySomaBPIS: TFMTBCDField;
    qrySomaBCOFINS: TFMTBCDField;
    qrySomaVLIPI: TFMTBCDField;
    qrySomaVLICMS: TFMTBCDField;
    qrySomaVLST: TFMTBCDField;
    qrySomaVLPIS: TFMTBCDField;
    qrySomaVLCOF: TFMTBCDField;
    qryItensCompraVL_UNITARIO: TFMTBCDField;
    qryItensCompraE_MEDIO: TFMTBCDField;
    qryItensCompraVL_ITEM: TFMTBCDField;
    qryItensCompraBASE_IPI: TFMTBCDField;
    qryItensCompraALIQ_IPI: TFMTBCDField;
    qryItensCompraVL_IPI: TFMTBCDField;
    qryItensCompraBASE_ICMS: TFMTBCDField;
    qryItensCompraALIQ_ICMS: TFMTBCDField;
    qryItensCompraVL_ICMS: TFMTBCDField;
    qryItensCompraBASE_ST: TFMTBCDField;
    qryItensCompraVL_ST: TFMTBCDField;
    qryItensCompraBASE_PIS: TFMTBCDField;
    qryItensCompraALIQ_PIS: TFMTBCDField;
    qryItensCompraVL_PIS: TFMTBCDField;
    qryItensCompraBASE_COF: TFMTBCDField;
    qryItensCompraALIQ_COF: TFMTBCDField;
    qryItensCompraVL_COF: TFMTBCDField;
    qryItensCompraFRETE1: TFMTBCDField;
    qryItensCompraDESPESA: TFMTBCDField;
    qryItensCompraSEGURO: TFMTBCDField;
    qryItensCompraDESCONTO: TFMTBCDField;
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
    qryItensCompraALIQ_ST: TFMTBCDField;
    qryItensCompraPR_VENDA: TFMTBCDField;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    btnFinalizar: TSpeedButton;
    btnProdutos: TSpeedButton;
    Panel5: TPanel;
    grpSelecao: TGroupBox;
    EdtProduto: TEdit;
    qryItensCompraVIRTUAL_PR_VENDA: TExtendedField;
    qryItensCompraPR_ANTERIOR: TFMTBCDField;
    qryItensCompraPR_MARGEM: TFMTBCDField;
    qryItensCompraPR_SUGESTAO: TFMTBCDField;
    qryItensCompraPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdMARGEM: TCurrencyField;
    qryItensCompraVIRTUAL_MARGEM: TExtendedField;
    qryItensCompraEH_FISCAL: TStringField;
    qryCompraLEU_DUPLICATA: TStringField;
    qryItensCompraQTD_DEVOLVIDA: TFMTBCDField;
    qryItensCompraDESCRICAO: TStringField;
    qryProdQTD_ATUAL: TFMTBCDField;
    qryCompraNOME: TStringField;
    dsFornecedor: TDataSource;
    JvEnterAsTab1: TJvEnterAsTab;
    pnPessoa: TPanel;
    Label2: TLabel;
    DBEdit27: TDBEdit;
    DBGridPessooa: TDBGridEh;
    qryCompraBASE_FCP: TFMTBCDField;
    qryItensCompraVFCP: TFMTBCDField;
    Label27: TLabel;
    DBEdit2: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    Label28: TLabel;
    dsGrade: TDataSource;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_COMPRA: TIntegerField;
    qryGradeFK_ITENS_COMPRA: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    qryGradePRECO: TFMTBCDField;
    qryItensCompraCSOSN: TStringField;
    qryProdCSOSN: TStringField;
    qryItensCompraVIRTUAL_CSOSN: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryItensCompraVL_UNITARIOValidate(Sender: TField);
    procedure qryItensCompraBeforePost(DataSet: TDataSet);
    procedure qryItensCompraNewRecord(DataSet: TDataSet);
    procedure qryItensCompraALIQ_ICMSValidate(Sender: TField);
    procedure qryCompraAfterPost(DataSet: TDataSet);
    procedure qryCompraCalcFields(DataSet: TDataSet);
    procedure qryCompraAfterOpen(DataSet: TDataSet);
    procedure qryItensCompraAfterPost(DataSet: TDataSet);
    procedure qryCompraFRETEValidate(Sender: TField);
    procedure qryItensCompraAfterDelete(DataSet: TDataSet);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure dsCompraDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPessoasClick(Sender: TObject);
    procedure qryCompraCHAVEValidate(Sender: TField);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure qryItensCompraFK_PRODUTOChange(Sender: TField);
    procedure qryCompraNewRecord(DataSet: TDataSet);
    procedure qryItensCompraBeforeInsert(DataSet: TDataSet);
    procedure qryCompraBeforePost(DataSet: TDataSet);
    procedure DBEdit20Exit(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure qryItensCompraPR_MARGEMChange(Sender: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1Columns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBEdit27Change(Sender: TObject);
    procedure pnPessoaExit(Sender: TObject);
    procedure DBGridPessooaDblClick(Sender: TObject);
    procedure DBGridPessooaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtProdutoEnter(Sender: TObject);
    procedure EdtProdutoExit(Sender: TObject);
    procedure qryGradeBeforeInsert(DataSet: TDataSet);
    procedure DBEdit10Exit(Sender: TObject);

  private
    FPodeAlterar: Boolean;
    FProduto: Integer;
    FPrecoCusto, FPrecoVenda: Extended;
    QuantidadeAnterior: Real;
    vLetras: String;
    function ChecaParcela(id: Integer): Boolean;
    procedure CalculaTotais;
    function TotalCompra: Extended;
    procedure InsereItem;
    procedure BuscaPreco(Codigo: Integer);
    function EncontrouDuplicata(Codigo: Integer): Boolean;
    procedure HabilitaCamposGrid;
    procedure GetFornecedor;
    procedure ChamaGrade;

    { Private declarations }
  public
    { Public declarations }
    vpessoa: string;
    procedure AjustaPreco_Estoque;
    procedure AtualizaST;
  end;

var
  frmCadCompra: TfrmCadCompra;

implementation

{$R *.dfm}

uses Udados, uCompraPagar, uCadProduto, uCadPessoa, uDMEstoque, uGradeCompra,
  uDmNFe;

function TfrmCadCompra.ChecaParcela(id: Integer): Boolean;
begin
  result := true;
  if DBCheckBox4.Checked then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'SELECT SUM(VALOR) FROM CPAGAR WHERE FK_COMPRA=:ID';
    dados.qryExecute.Params[0].Value := qryCompraID.Value;;
    dados.qryExecute.Open;
    result := false;
    if dados.qryExecute.Fields[0].AsFloat = qryCompraTOTAL.AsFloat then
      result := true;
  end;
end;

procedure TfrmCadCompra.FormActivate(Sender: TObject);
begin

  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;

  qryFornecedor.Close;
  qryFornecedor.Params[0].Value := '%';
  qryFornecedor.Params[1].Value := '%';
  qryFornecedor.Open;

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

end;

procedure TfrmCadCompra.FormCreate(Sender: TObject);
begin

  if not(dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    DBGridEh1.Columns[1].FieldName := 'VIRTUAL_PRODUTO';
    DBGridEh1.Columns[0].ReadOnly := false;
  end
  else
  begin
    DBGridEh1.Columns[1].FieldName := 'DESCRICAO';
    DBGridEh1.Columns[0].ReadOnly := true;
  end;

  vLetras := ''; // pesquisa parte
  qryProd.Filtered := false;

end;

procedure TfrmCadCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    vk_f3:
      btnFinalizarClick(self);

    vk_f4:
      begin
        if btnProdutos.Enabled then
          btnProdutosClick(self);
      end;

    vk_f5:
      begin
        if btnPessoas.Enabled then
          btnPessoasClick(self);
      end;

    vk_delete:
      begin
        if not(qryCompraLEUXML.Value = 'S') then
        begin
          if ActiveControl = DBGridEh1 then
          begin
            if DBGridEh1.Enabled then
              if Application.messageBox('Deseja Excluir Produto?',
                'Confirmação', mb_YesNo) = mrYes then
                qryItensCompra.delete;
          end;
        end;
      end;

    vk_f11:
      EdtProduto.SetFocus;

    vk_escape:
      begin
        if ActiveControl <> DBGridEh1 then
          btnSairClick(self)
        else if not(dsItens.DataSet.State in dsEditModes) then
          btnSairClick(self)
      end;
  end;
end;

procedure TfrmCadCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FPodeAlterar then
  begin

    if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    begin
      if not(qryCompraLEUXML.Value = 'S') then
      begin

        Key := UpCase(Key); // pesquisa parcial

        if DBGridEh1.SelectedIndex = 1 then
        begin

          if (Key = #8) then
          begin

            if length(vLetras) = 1 then
              vLetras := ''
            else
              vLetras := copy(vLetras, 1, length(vLetras) - 1);
          end;

          if (Key in ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', ' ', '/', '-', '.',
            ':', '@', '&', '*', '%', '$', '(', ')', '=', '?', ':', ';', '{',
            '}', '[', ']', '+', '*', '#', '!']) then
          begin
            vLetras := vLetras + UpperCase(Key);
          end;

          if dados.EhNumero(vLetras) and (vLetras <> '') then
            qryProd.Filter := 'CODIGO = ' + vLetras
          else
          begin
            if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
              qryProd.Filter := 'DESCRICAO LIKE ' +
                QuotedStr('%' + UpperCase(vLetras) + '%')
            else
              qryProd.Filter := 'DESCRICAO LIKE ' +
                QuotedStr(UpperCase(vLetras) + '%');
          end;

          qryProd.Filtered := true;

          if qryProdCODIGO.AsInteger > 0 then
          begin
            if vLetras <> '' then
            begin
              if not(qryItensCompra.State in dsEditModes) then
                qryItensCompra.Edit;
              qryItensCompraFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
            end;
          end;
        end
        else
        begin
          vLetras := '';
          qryProd.Filtered := false;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadCompra.HabilitaCamposGrid;
begin
  if qryCompraLEUXML.Value = 'S' then
  begin
    DBGridEh1.Columns[0].ReadOnly := true;
    DBGridEh1.Columns[1].ReadOnly := true;
    DBGridEh1.Columns[4].ReadOnly := true;
    DBGridEh1.Columns[5].ReadOnly := true;
    DBGridEh1.Columns[6].ReadOnly := true;
    DBGridEh1.Columns[7].ReadOnly := true;
    DBGridEh1.Columns[8].ReadOnly := true;
    DBGridEh1.Columns[9].ReadOnly := true;
    DBGridEh1.Columns[10].ReadOnly := true;
  end
  else
  begin
    DBGridEh1.Columns[0].ReadOnly := false;
    DBGridEh1.Columns[1].ReadOnly := false;
    DBGridEh1.Columns[4].ReadOnly := false;
    DBGridEh1.Columns[5].ReadOnly := false;
    DBGridEh1.Columns[6].ReadOnly := false;
    DBGridEh1.Columns[7].ReadOnly := false;
    DBGridEh1.Columns[8].ReadOnly := false;
    DBGridEh1.Columns[9].ReadOnly := false;
    DBGridEh1.Columns[10].ReadOnly := false;
  end;
end;

procedure TfrmCadCompra.FormShow(Sender: TObject);
begin

  qryProd.Close;
  qryProd.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  qryProd.Open;

  btnProdutos.Visible := dados.vLiberaProduto;
  btnPessoas.Visible := dados.vLiberaPessoa;

  FProduto := 0;

  if qryCompraLEUXML.Value = 'S' then
  begin

    DBEdit11.ReadOnly := true;
    DBEdit12.ReadOnly := true;
    DBEdit13.ReadOnly := true;
    DBEdit14.ReadOnly := true;
    DBEdit15.ReadOnly := true;
    DBEdit16.ReadOnly := true;

    DBEdit17.ReadOnly := true;
    DBEdit18.ReadOnly := true;
    DBEdit19.ReadOnly := true;
    DBEdit20.ReadOnly := true;
    DBEdit21.ReadOnly := true;
    DBEdit22.ReadOnly := true;

    DBEdit23.ReadOnly := true;
    DBEdit24.ReadOnly := true;
    DBEdit25.ReadOnly := true;
    DBEdit26.ReadOnly := true;

  end
  else
  begin

    DBEdit11.ReadOnly := false;
    DBEdit12.ReadOnly := false;
    DBEdit13.ReadOnly := false;
    DBEdit14.ReadOnly := false;
    DBEdit15.ReadOnly := false;
    DBEdit16.ReadOnly := false;

    DBEdit17.ReadOnly := false;
    DBEdit18.ReadOnly := false;
    DBEdit19.ReadOnly := false;
    DBEdit20.ReadOnly := false;
    DBEdit21.ReadOnly := false;
    DBEdit22.ReadOnly := false;

    DBEdit23.ReadOnly := false;
    DBEdit24.ReadOnly := false;
    DBEdit25.ReadOnly := false;
    DBEdit26.ReadOnly := false;

  end;

  dados.AjustaCamposNovos('compra');

end;

procedure TfrmCadCompra.qryCompraAfterOpen(DataSet: TDataSet);
begin
  qryItensCompra.Close;
  qryItensCompra.Open;

  qryItensCompra.Close;
  qryItensCompra.Open;

  qryGrade.Close;
  qryGrade.Open;

  qrySoma.Close;
  qrySoma.Open;
end;

procedure TfrmCadCompra.qryCompraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadCompra.qryCompraBeforePost(DataSet: TDataSet);
begin

  if qryCompra.State = dsInsert then
    qryCompraID.Value := dados.Numerador('COMPRA', 'ID', 'N', '', '');

end;

procedure TfrmCadCompra.qryCompraCalcFields(DataSet: TDataSet);
begin
  if qryCompraSTATUS.Value = 'N' then
    qryCompraVIRTUAL_SITUACAO.Value := 'NOVO';
  if qryCompraSTATUS.Value = 'A' then
    qryCompraVIRTUAL_SITUACAO.Value := 'ALTERANDO';
  if qryCompraSTATUS.Value = 'F' then
    qryCompraVIRTUAL_SITUACAO.Value := 'FECHADA';
  if qryCompraSTATUS.Value = 'C' then
    qryCompraVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadCompra.qryCompraCHAVEValidate(Sender: TField);
begin
  if qryCompraLEUXML.Value = 'S' then
    exit;

  if trim(DBEdit5.EditText) <> '' then
  begin
    if not(ValidarChave(DBEdit5.EditText)) then
    begin
      DBEdit5.SetFocus;
      raise Exception.Create('Chave da NFe é Inválida');
      exit;
    end;

    qryCompraMODELO.Value := copy(DBEdit5.EditText, 21, 2);
    qryCompraSERIE.Value := copy(DBEdit5.EditText, 23, 3);
    qryCompraNR_NOTA.AsInteger := StrToInt(copy(DBEdit5.EditText, 26, 9));

    qryCompraEHFISCAL.Value := 'N';

    if (length(trim(DBEdit5.EditText)) = 44) then
    begin
      qryCompraEHFISCAL.Value := 'S';
    end;

  end;
end;

procedure TfrmCadCompra.qryCompraFRETEValidate(Sender: TField);
begin
  if qryCompraLEUXML.Value = 'S' then
    exit;

  qryCompraTOTAL.Value := (qryCompraSUBTOTAL.Value + qryCompraTOTAL_IPI.Value +
    qryCompraFRETE.Value + qryCompraDESPESAS.Value + qryCompraSEGURO.Value) -
    qryCompraDESCONTO.Value;
end;

procedure TfrmCadCompra.qryCompraNewRecord(DataSet: TDataSet);
begin
  qryCompraID.Value := dados.Numerador('COMPRA', 'ID', 'N', '', '');
  qryCompraSTATUS.Value := 'A';
  qryCompraDTENTRADA.Value := DATE;
  qryCompraDTEMISSAO.Value := DATE;
  qryCompraSUBTOTAL.Value := 0;
  qryCompraTOTAL.Value := 0;
  qryCompraFRETE.Value := 0;
  qryCompraDESPESAS.Value := 0;
  qryCompraSEGURO.Value := 0;
  qryCompraDESCONTO.Value := 0;
  qryCompraBASE_IPI.Value := 0;
  qryCompraBASE_ICM.Value := 0;
  qryCompraBASE_ST.Value := 0;
  qryCompraBASE_PIS.Value := 0;
  qryCompraBASE_COF.Value := 0;
  qryCompraTOTAL_IPI.Value := 0;
  qryCompraTOTAL_ICM.Value := 0;
  qryCompraTOTAL_ST.Value := 0;
  qryCompraTOTAL_PIS.Value := 0;
  qryCompraTOTAL_COF.Value := 0;
  qryCompraGERA_CP.Value := 'S';
  qryCompraGERA_ES.Value := 'S';
  qryCompraAJUSTA_PV.Value := 'N';
  qryCompraAJUSTA_PC.Value := 'S';
  qryCompraLEUXML.Value := 'N';
  qryCompraEHFISCAL.Value := 'N';
  qryCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;

end;

procedure TfrmCadCompra.qryGradeBeforeInsert(DataSet: TDataSet);
begin
  if (qryCompra.State in dsEditModes) then
    qryCompra.Post;
end;

procedure TfrmCadCompra.CalculaTotais;
begin
  if qryCompraLEUXML.Value = 'S' then
    exit;

  qrySoma.Refresh;
  qryCompra.Edit;
  qryCompraSUBTOTAL.AsFloat := qrySomaTOTAL.AsFloat;
  qryCompraBASE_IPI.AsFloat := qrySomaBIPI.AsFloat;
  qryCompraBASE_ICM.AsFloat := qrySomaBICMS.AsFloat;
  qryCompraBASE_ST.AsFloat := qrySomaBST.AsFloat;
  qryCompraBASE_PIS.AsFloat := qrySomaBPIS.AsFloat;
  qryCompraBASE_COF.AsFloat := qrySomaBCOFINS.AsFloat;
  qryCompraTOTAL_IPI.AsFloat := qrySomaVLIPI.AsFloat;
  qryCompraTOTAL_ICM.AsFloat := qrySomaVLICMS.AsFloat;
  qryCompraTOTAL_ST.AsFloat := qrySomaVLST.AsFloat;
  qryCompraTOTAL_PIS.AsFloat := qrySomaVLPIS.AsFloat;
  qryCompraTOTAL_COF.AsFloat := qrySomaVLCOF.AsFloat;
  qryCompraTOTAL.Value := (qryCompraSUBTOTAL.Value + qryCompraTOTAL_IPI.Value +
    qryCompraFRETE.Value + qryCompraDESPESAS.Value + qryCompraSEGURO.Value) -
    qryCompraDESCONTO.Value;

  qryCompra.Post;
end;

procedure TfrmCadCompra.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadCompra.qryItensCompraAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadCompra.qryItensCompraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
  vLetras := '';
  qryProd.Filtered := false;
end;

procedure TfrmCadCompra.qryItensCompraALIQ_ICMSValidate(Sender: TField);
begin
  qryItensCompraVL_ICMS.Value :=
    (qryItensCompraBASE_ICMS.Value * qryItensCompraALIQ_ICMS.Value) / 100;

end;

procedure TfrmCadCompra.AjustaPreco_Estoque;
begin

  try

    qryItensCompra.DisableControls;
    qryItensCompra.First;
    while not qryItensCompra.Eof do
    begin
      dados.AjustaPreco(qryItensCompraFK_PRODUTO.Value,
        qryItensCompraFK_COMPRA.Value, qryItensCompraVL_UNITARIO.AsFloat,
        qryItensCompraPR_VENDA.AsFloat);
      qryItensCompra.Next;
    end;
  finally
    qryItensCompra.EnableControls;
  end;
end;

procedure TfrmCadCompra.qryItensCompraBeforeInsert(DataSet: TDataSet);
begin
  if (qryCompra.State in dsEditModes) then
    qryCompra.Post;
end;

procedure TfrmCadCompra.AtualizaST;
var
  n, i, j: Integer;
begin
  if not(qryCompraXML.IsNull) then
  begin
    begin
      dmnfe.ACBrNFe.NotasFiscais.Clear;
      dmnfe.ACBrNFe.NotasFiscais.LoadFromString(qryCompraXML.AsString);
      for n := 0 to dmnfe.ACBrNFe.NotasFiscais.Count - 1 do
      begin
        with dmnfe.ACBrNFe.NotasFiscais.Items[n].NFe do
        begin
          for i := 0 to Det.Count - 1 do
          begin
            with Det.Items[i] do
            begin

              dados.qryExecute.Close;
              dados.qryExecute.SQL.Clear;
              dados.qryExecute.SQL.Text :=
                'update COMPRA_ITENS set VL_ST=:VALOR, ALIQ_ST=:ALIQ WHERE FK_COMPRA=:FK AND BASE_ST=:BASE';
              dados.qryExecute.Params[0].Value := Imposto.ICMS.vICMSST;
              dados.qryExecute.Params[1].Value := Imposto.ICMS.pICMSST;
              dados.qryExecute.Params[2].Value := qryCompraID.AsInteger;
              dados.qryExecute.Params[3].Value := Imposto.ICMS.vBCST;
              dados.qryExecute.ExecSQL;
              dados.Conexao.CommitRetaining;
            end;
          end;
        end;
      end;
    end;
  end;
  qryItensCompra.Refresh;
end;

procedure TfrmCadCompra.ChamaGrade;
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
    qryPesquisa.Params[0].Value := qryItensCompraFK_PRODUTO.AsInteger;
    qryPesquisa.Open;

    eGrade := qryPesquisa.FieldByName('GRADE').AsString = 'S';

    if eGrade then
    begin
      qryPesquisa.Connection := dados.Conexao;
      qryPesquisa.Close;
      qryPesquisa.SQL.Clear;
      qryPesquisa.SQL.Text :=
        'DELETE from COMPRA_GRADE where FK_ITENS_COMPRA=:ID';
      qryPesquisa.Params[0].Value := qryItensCompraID.AsInteger;
      qryPesquisa.ExecSQL;

      try
        FrmGradeCo := TFrmGradeCo.Create(Application);

        FrmGradeCo.GeraGrade(qryItensCompraFK_PRODUTO.AsInteger,
          qryCompraID.AsInteger, qryItensCompraID.AsInteger);
        FrmGradeCo.AbreGrade(qryItensCompraID.AsInteger);
        FrmGradeCo.edtQTD.Text := qryItensCompraQTD.AsString;

        FrmGradeCo.showmodal;
      finally
        FrmGradeCo.Free;
      end;

    end;

  finally
    qryPesquisa.Free;
  end;

end;

procedure TfrmCadCompra.qryItensCompraBeforePost(DataSet: TDataSet);
begin

  if (qryItensCompraDESCRICAO.IsNull) or (qryItensCompraDESCRICAO.AsString = '')
  then
  begin
    // pesquisa parcial
    DBGridEh1.SelectedIndex := 2;
    raise Exception.Create('Informe a Descrição do Produto');

  end;

  if qryItensCompra.State = dsInsert then
    qryItensCompraID.Value := dados.Numerador('COMPRA_ITENS', 'ID',
      'N', '', '');

  FProduto := qryItensCompraFK_PRODUTO.Value;
  qryItensCompraFK_USUARIO.Value := dados.idUsuario;

  if qryCompraLEUXML.Value <> 'S' then
  begin
    qryItensCompraBASE_PIS.Value := qryItensCompraVL_ITEM.Value;
    qryItensCompraVL_PIS.AsFloat :=
      SimpleRoundTo
      (((qryItensCompraBASE_PIS.AsFloat * qryItensCompraALIQ_PIS.AsFloat)
      / 100), 2);

    qryItensCompraEH_FISCAL.Value := qryCompraEHFISCAL.Value;

    qryItensCompraBASE_COF.Value := qryItensCompraVL_ITEM.Value;
    qryItensCompraVL_COF.AsFloat :=
      SimpleRoundTo((qryItensCompraBASE_COF.AsFloat *
      qryItensCompraALIQ_COF.AsFloat) / 100, -2);

    qryItensCompraBASE_IPI.Value := qryItensCompraVL_ITEM.Value;
    qryItensCompraVL_IPI.AsFloat :=
      SimpleRoundTo((qryItensCompraBASE_IPI.AsFloat *
      qryItensCompraALIQ_IPI.AsFloat) / 100, 2);
  end;
  ChamaGrade;

end;

procedure TfrmCadCompra.qryItensCompraFK_PRODUTOChange(Sender: TField);
begin
  if qryCompraLEUXML.Value = 'S' then
    exit;

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    if (DBGridEh1.SelectedIndex = 0) or (DBGridEh1.SelectedIndex = 1) then
    begin
      qryItensCompraVL_UNITARIO.AsFloat := qryItensCompraVIRTUAL_PRECO.AsFloat;
      qryItensCompraCST_PIS.Value := qryItensCompraVIRTUAL_CSTE.Value;
      qryItensCompraCST_COF.Value := qryItensCompraVIRTUAL_CSTE.Value;
      qryItensCompraCSOSN.Value := qryItensCompraVIRTUAL_CSOSN.Value;
      qryItensCompraCST_IPI.Value := qryItensCompraVIRTUAL_CTS_IPI.Value;
      qryItensCompraALIQ_COF.Value := qryItensCompraVIRTUAL_ALIQ_COF.Value;
      qryItensCompraALIQ_PIS.Value := qryItensCompraVIRTUAL_ALIQ_PIS.Value;

      qryItensCompraPR_ANTERIOR.AsFloat := qryItensCompraVIRTUAL_PRECO.AsFloat;
      if dados.qryEmpresaLUCRO_PADRAO.AsFloat > 0 then
        qryItensCompraPR_MARGEM.AsFloat := dados.qryEmpresaLUCRO_PADRAO.AsFloat
      else
        qryItensCompraPR_MARGEM.AsFloat := qryItensCompraVIRTUAL_MARGEM.Value;
      qryItensCompraPR_VENDA_ANTERIOR.AsFloat :=
        qryItensCompraVIRTUAL_PR_VENDA.AsFloat;
    end;
  end;
{  else
  begin
    if DBGridEh1.SelectedIndex < 2 then
    begin
      qryItensCompraVL_UNITARIO.AsFloat := qryItensCompraVIRTUAL_PRECO.AsFloat;
      qryItensCompraCST_PIS.Value := qryItensCompraVIRTUAL_CSTE.Value;
      qryItensCompraCST_COF.Value := qryItensCompraVIRTUAL_CSTE.Value;
      qryItensCompraCST_IPI.Value := qryItensCompraVIRTUAL_CTS_IPI.Value;
      qryItensCompraALIQ_COF.Value := qryItensCompraVIRTUAL_ALIQ_COF.Value;
      qryItensCompraALIQ_PIS.Value := qryItensCompraVIRTUAL_ALIQ_PIS.Value;

      qryItensCompraPR_ANTERIOR.AsFloat := qryItensCompraVIRTUAL_PRECO.AsFloat;
      if dados.qryEmpresaLUCRO_PADRAO.AsFloat > 0 then
        qryItensCompraPR_MARGEM.AsFloat := dados.qryEmpresaLUCRO_PADRAO.AsFloat
      else
        qryItensCompraPR_MARGEM.AsFloat := qryItensCompraVIRTUAL_MARGEM.Value;
      qryItensCompraPR_VENDA_ANTERIOR.AsFloat :=
        qryItensCompraVIRTUAL_PR_VENDA.AsFloat;
    end;

  end; }
end;

procedure TfrmCadCompra.qryItensCompraNewRecord(DataSet: TDataSet);
begin
  qryItensCompraITEM.Value := dados.Numerador('COMPRA_ITENS', 'ITEM', 'S',
    'FK_COMPRA', qryCompraID.AsString);
  qryItensCompraFK_COMPRA.Value := qryCompraID.Value;
  qryItensCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryItensCompraVL_UNITARIO.Value := 0;
  qryItensCompraQTD.Value := 1;
  qryItensCompraBASE_IPI.Value := 0;
  qryItensCompraBASE_ICMS.Value := 0;
  qryItensCompraBASE_ST.Value := 0;
  qryItensCompraBASE_PIS.Value := 0;
  qryItensCompraQTD_DEVOLVIDA.Value := 0;
  qryItensCompraBASE_COF.Value := 0;
  qryItensCompraALIQ_IPI.Value := 0;
  qryItensCompraALIQ_ICMS.Value := 0;
  qryItensCompraALIQ_PIS.Value := 0;
  qryItensCompraALIQ_COF.Value := 0;
  qryItensCompraVL_IPI.Value := 0;
  qryItensCompraVL_ICMS.Value := 0;
  qryItensCompraVL_ST.Value := 0;
  qryItensCompraVL_PIS.Value := 0;
  qryItensCompraVL_COF.Value := 0;
  qryItensCompraFRETE1.Value := 0;
  qryItensCompraDESPESA.Value := 0;
  qryItensCompraDESCONTO.Value := 0;
  qryItensCompraSEGURO.Value := 0;
  qryItensCompraPR_VENDA.AsFloat := 0;
  qryItensCompraPR_ANTERIOR.AsFloat := 0;
  qryItensCompraPR_MARGEM.AsFloat := dados.qryEmpresaLUCRO_PADRAO.AsFloat;;
  qryItensCompraPR_SUGESTAO.AsFloat := 0;
  qryItensCompraPR_VENDA_ANTERIOR.AsFloat := 0;

  qryItensCompraGERA_CP.Value := qryCompraAJUSTA_PV.Value;
  qryItensCompraGERA_ES.Value := qryCompraGERA_ES.Value;
  qryItensCompraSITUACAO.Value := qryCompraSTATUS.Value;
  qryItensCompraCFOP.Value := '1102';
  qryItensCompraCST_ICM.Value := '041';
end;

procedure TfrmCadCompra.qryItensCompraPR_MARGEMChange(Sender: TField);
begin

  if qryCompraLEUXML.Value = 'S' then
    exit;

  qryItensCompraPR_SUGESTAO.AsFloat := qryItensCompraVL_UNITARIO.AsFloat +
    (qryItensCompraVL_UNITARIO.AsFloat * qryItensCompraPR_MARGEM.AsFloat / 100);

  qryItensCompraPR_VENDA.AsFloat := qryItensCompraPR_SUGESTAO.AsFloat;

end;

procedure TfrmCadCompra.qryItensCompraVL_UNITARIOValidate(Sender: TField);
begin

  if qryCompraLEUXML.Value = 'S' then
    exit;

  if qryItensCompraQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryItensCompraQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!');

  if qryItensCompraVL_ITEM.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryItensCompraVL_ITEM.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!');

  qryItensCompraPR_SUGESTAO.AsFloat := qryItensCompraVL_UNITARIO.AsFloat +
    (qryItensCompraVL_UNITARIO.AsFloat * qryItensCompraPR_MARGEM.AsFloat / 100);

  qryItensCompraPR_VENDA.AsFloat := qryItensCompraPR_SUGESTAO.AsFloat;

  qryItensCompraVL_ITEM.Value := qryItensCompraVL_UNITARIO.Value *
    qryItensCompraQTD.Value;
  qryItensCompraBASE_ICMS.Value := qryItensCompraVL_ITEM.Value;

end;

function TfrmCadCompra.EncontrouDuplicata(Codigo: Integer): Boolean;
begin
  result := false;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'SELECT codigo FROM CPAGAR WHERE FK_COMPRA=:COMPRA';
  dados.qryConsulta.Params[0].Value := Codigo;
  dados.qryConsulta.Open;

  if not dados.qryConsulta.IsEmpty then
    result := true;
end;

procedure TfrmCadCompra.btnFinalizarClick(Sender: TObject);
begin
  try
    btnFinalizar.Enabled := false;
    if qryItensCompra.IsEmpty then
    begin
      ShowMessage('Informe os Itens da Compra!');
      exit;
    end;

    if (trim(DBEdit6.EditText) = '') then
    begin
      ShowMessage('Informe o Número da Nota!');
      exit;
    end;

    if (qryCompraFORNECEDOR.IsNull) then
    begin
      ShowMessage('Informe o fornecedor!');
      exit;
    end;

    If Application.messageBox('Tem certeza que FINALIZAR COMPRA?',
      'Confirmação', mb_YesNo + mb_iconquestion) = idno then
      exit;

    if DBCheckBox2.Checked then
      AjustaPreco_Estoque;

    if DBCheckBox4.Checked then
    begin

      if qryCompraTOTAL.AsFloat > 0 then
      begin
        if (qryCompra.FieldByName('LEU_DUPLICATA').AsString = 'N') or
          (qryCompra.FieldByName('LEU_DUPLICATA').IsNull) or
          (not EncontrouDuplicata(qryCompraID.AsInteger)) then
        begin

          try

            dados.qryExecute.Close;
            dados.qryExecute.SQL.Text := 'DELETE FROM CAIXA WHERE FKCOMPRA=:ID';
            dados.qryExecute.Params[0].Value := dados.qryCompraID.Value;
            dados.qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;

            dados.qryExecute.Close;
            dados.qryExecute.SQL.Text :=
              'DELETE FROM CPAGAR WHERE FK_COMPRA=:ID';
            dados.qryExecute.Params[0].Value := dados.qryCompraID.Value;
            dados.qryExecute.ExecSQL;
            dados.Conexao.CommitRetaining;

            frmCPParcela := tfrmCPParcela.Create(Application);
            frmCPParcela.edtParcela.Text := '1';
            frmCPParcela.edtSubtotal.Text :=
              formatfloat('0.00', qryCompraTOTAL.AsFloat);
            frmCPParcela.edtTotal.Text :=
              formatfloat('0.00', qryCompraTOTAL.AsFloat);
            frmCPParcela.vValor := qryCompraTOTAL.AsFloat;
            frmCPParcela.idCompra := qryCompraID.Value;
            dados.vChamaImpressao := false;
            dados.vPodeFecharCompra := false;
            frmCPParcela.showmodal;
          except
            frmCPParcela.Release;
          end;
        end
        else
        begin
          dados.vChamaImpressao := true;
          dados.vPodeFecharCompra := true;
        end;
      end;
    end
    else
      dados.vPodeFecharCompra := true;

    if dados.vPodeFecharCompra then
    begin
      if not(qryCompra.State in dsEditModes) then
        qryCompra.Edit;
      qryCompraSTATUS.Value := 'F';
      qryCompra.Post;

      DMEstoque.AddEstoqueCompra(qryCompraID.AsInteger,
        qryCompraEHFISCAL.Value);
      DMEstoque.AddEstoqueGRadeCompra(qryCompraID.AsInteger);
      DMEstoque.ApagaCompra_GRade(qryCompraID.AsInteger);

      Close;
    end;

  finally
    btnFinalizar.Enabled := true;
  end;
end;

procedure TfrmCadCompra.btnPessoasClick(Sender: TObject);
begin
  try
    btnPessoas.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    if Not dados.qryPessoas.Active then
      dados.qryPessoas.Open;
    dados.qryPessoas.Insert;
    frmCadPessoa.showmodal;
  finally
    frmCadPessoa.Release;
    btnPessoas.Enabled := true;

    qryFornecedor.Close;
    qryFornecedor.Params[0].Value := '%';
    qryFornecedor.Params[1].Value := '%';

    qryFornecedor.Open;

  end;
end;

procedure TfrmCadCompra.btnProdutosClick(Sender: TObject);
var
  idProduto: Integer;
begin

  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.showmodal;

  finally
    FrmCadProduto.Release;

    qryProd.Refresh;

  end;

end;

procedure TfrmCadCompra.btnSairClick(Sender: TObject);
begin
  if Application.messageBox('Deseja Sair da Tela?', 'Confirmação', mb_YesNo) = mrYes
  then
    Close;
end;

function TfrmCadCompra.TotalCompra: Extended;
begin
  result := qryCompraSUBTOTAL.AsFloat + qryCompraFRETE.AsFloat +
    qryCompraSEGURO.AsFloat + qryCompraDESPESAS.AsFloat +
    qryCompraTOTAL_IPI.AsFloat - qryCompraDESCONTO.AsFloat;
end;

procedure TfrmCadCompra.DBEdit10Exit(Sender: TObject);
begin
  DBGridEh1.SetFocus;
end;

procedure TfrmCadCompra.DBEdit20Exit(Sender: TObject);
begin
  if qryCompraLEUXML.Value <> 'S' then
  begin
    if not(qryCompra.State in dsEditModes) then
      qryCompra.Edit;
    qryCompraTOTAL.AsFloat := TotalCompra;
  end;
end;

procedure TfrmCadCompra.DBEdit27Change(Sender: TObject);
begin
  if not Panel3.Enabled then
    exit;

  if vpessoa <> DBEdit27.Text then
  begin

    DBGridPessooa.Visible := true;
    pnPessoa.Height := 80;
  end;

  qryFornecedor.Close;
  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    qryFornecedor.Params[0].Value := '%' + DBEdit27.Text + '%';
    qryFornecedor.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end
  else
  begin
    qryFornecedor.Params[0].Value := DBEdit27.Text + '%';
    qryFornecedor.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end;

  qryFornecedor.Open;

end;

procedure TfrmCadCompra.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryFornecedor.Prior;
  if Key = VK_DOWN then
    qryFornecedor.Next;
end;

procedure TfrmCadCompra.GetFornecedor;
begin
  if (qryCompra.State in dsEditModes) then
    qryCompra.Edit;

  if not qryFornecedor.IsEmpty then
  begin
    qryCompraFORNECEDOR.AsInteger := qryFornecedorCODIGO.AsInteger;
    qryCompraNOME.AsString := qryFornecedorRAZAO.AsString;

  end
  else
  begin
    raise Exception.Create('Pessoa não foi encontrada!');
    qryCompraFORNECEDOR.Clear;
    qryCompraNOME.Clear;
  end;
end;

procedure TfrmCadCompra.DBGridEh1ColEnter(Sender: TObject);
begin
  if DBGridEh1.SelectedIndex <> 1 then
  begin
    if qryItensCompraDESCRICAO.Value <> qryItensCompraVIRTUAL_PRODUTO.AsString
    then
      if qryItensCompra.State in dsEditModes then
        qryItensCompraDESCRICAO.Value := qryItensCompraVIRTUAL_PRODUTO.AsString;
  end
  else
  begin
    vLetras := '';
    qryProd.Filtered := false;
  end;
end;

procedure TfrmCadCompra.DBGridEh1Columns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    if DBGridEh1.SelectedIndex = 1 then
      qryItensCompraFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
  end;
end;

procedure TfrmCadCompra.DBGridEh1DblClick(Sender: TObject);
begin

  if not dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if not qryItensCompra.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(Application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value :=
        qryItensCompraFK_PRODUTO.Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.showmodal;

    finally
      FrmCadProduto.Release;
      qryProd.Refresh;
    end;

  end;
end;

procedure TfrmCadCompra.DBGridEh1Enter(Sender: TObject);
begin
  vLetras := '';
  qryProd.Filtered := false;
  FPodeAlterar := true;
end;

procedure TfrmCadCompra.DBGridEh1Exit(Sender: TObject);
begin
  vLetras := '';
  qryProd.Filtered := false;
  FPodeAlterar := false;
end;

procedure TfrmCadCompra.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmCadCompra.DBGridPessooaDblClick(Sender: TObject);
begin
  DBEdit27.EditText := qryFornecedorRAZAO.Value;
  qryCompraNOME.AsString := qryFornecedorRAZAO.Value;
end;

procedure TfrmCadCompra.DBGridPessooaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    qryCompraNOME.AsString := qryFornecedorRAZAO.Value;
end;

procedure TfrmCadCompra.dsCompraDataChange(Sender: TObject; Field: TField);
begin
  DBGridEh1.ReadOnly := false;
  GroupBox2.Enabled := true;
  if qryCompraLEUXML.Value = 'S' then
  begin
    DBGridEh1.ReadOnly := true;
    GroupBox2.Enabled := false;
  end;
  HabilitaCamposGrid;
end;

procedure TfrmCadCompra.BuscaPreco(Codigo: Integer);
begin
  FPrecoCusto := 0;
  FPrecoVenda := 0;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    ' select PR_CUSTO, PR_VENDA FROM PRODUTO WHERE CODIGO=:CODIGO';
  dados.qryConsulta.Params[0].Value := Codigo;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
  begin
    FPrecoCusto := dados.qryConsulta.FieldByName('PR_CUSTO').AsFloat;
    FPrecoVenda := dados.qryConsulta.FieldByName('PR_VENDA').AsFloat;
  end;
end;

procedure TfrmCadCompra.InsereItem;
var
  vPosicao: Integer;
  vPesquisa: string;
  vQtd: Extended;

begin

  dados.qryupdate.Close;
  dados.qryupdate.SQL.Clear;
  dados.qryupdate.SQL.add('INSERT INTO COMPRA_ITENS (');
  dados.qryupdate.SQL.add('ID,');
  dados.qryupdate.SQL.add('FK_COMPRA,');
  dados.qryupdate.SQL.add('EMPRESA,');
  dados.qryupdate.SQL.add('ITEM,');
  dados.qryupdate.SQL.add('FK_PRODUTO,');
  dados.qryupdate.SQL.add('DESCRICAO,');
  dados.qryupdate.SQL.add('CFOP,');
  dados.qryupdate.SQL.add('CST_ICM,');
  dados.qryupdate.SQL.add('VL_UNITARIO,');
  dados.qryupdate.SQL.add('QTD,');
  dados.qryupdate.SQL.add('E_MEDIO,');
  dados.qryupdate.SQL.add('VL_ITEM,');
  dados.qryupdate.SQL.add('BASE_IPI,');
  dados.qryupdate.SQL.add('ALIQ_IPI,');
  dados.qryupdate.SQL.add('VL_IPI,');
  dados.qryupdate.SQL.add('BASE_ICMS,');
  dados.qryupdate.SQL.add('ALIQ_ICMS,');
  dados.qryupdate.SQL.add('VL_ICMS,');
  dados.qryupdate.SQL.add('BASE_ST,');
  dados.qryupdate.SQL.add('VL_ST,');
  dados.qryupdate.SQL.add('BASE_PIS,');
  dados.qryupdate.SQL.add('ALIQ_PIS,');
  dados.qryupdate.SQL.add('VL_PIS,');
  dados.qryupdate.SQL.add('BASE_COF,');
  dados.qryupdate.SQL.add('ALIQ_COF,');
  dados.qryupdate.SQL.add('VL_COF,');
  dados.qryupdate.SQL.add('FRETE1,');
  dados.qryupdate.SQL.add('DESPESA,');
  dados.qryupdate.SQL.add('SEGURO,');
  dados.qryupdate.SQL.add('DESCONTO,');
  dados.qryupdate.SQL.add('GERA_CP,');
  dados.qryupdate.SQL.add('GERA_ES,');
  dados.qryupdate.SQL.add('SITUACAO,');
  dados.qryupdate.SQL.add('FK_PRODUTO_FORN,');
  dados.qryupdate.SQL.add('CST_PIS,');
  dados.qryupdate.SQL.add('CST_COF,');
  dados.qryupdate.SQL.add('CST_IPI,');
  dados.qryupdate.SQL.add('ALIQ_ST,');
  dados.qryupdate.SQL.add('FK_USUARIO,');
  dados.qryupdate.SQL.add('QTD_DEVOLVIDA,');
  dados.qryupdate.SQL.add('PR_VENDA');
  dados.qryupdate.SQL.add(')VALUES (');
  dados.qryupdate.SQL.add(':ID,');
  dados.qryupdate.SQL.add(':FK_COMPRA,');
  dados.qryupdate.SQL.add(':EMPRESA,');
  dados.qryupdate.SQL.add(':ITEM,');
  dados.qryupdate.SQL.add(':FK_PRODUTO,');
  dados.qryupdate.SQL.add(':DESCRICAO,');
  dados.qryupdate.SQL.add(':CFOP,');
  dados.qryupdate.SQL.add(':CST_ICM,');
  dados.qryupdate.SQL.add(':VL_UNITARIO,');
  dados.qryupdate.SQL.add(':QTD,');
  dados.qryupdate.SQL.add(':E_MEDIO,');
  dados.qryupdate.SQL.add(':VL_ITEM,');
  dados.qryupdate.SQL.add(':BASE_IPI,');
  dados.qryupdate.SQL.add(':ALIQ_IPI,');
  dados.qryupdate.SQL.add(':VL_IPI,');
  dados.qryupdate.SQL.add(':BASE_ICMS,');
  dados.qryupdate.SQL.add(':ALIQ_ICMS,');
  dados.qryupdate.SQL.add(':VL_ICMS,');
  dados.qryupdate.SQL.add(':BASE_ST,');
  dados.qryupdate.SQL.add(':VL_ST,');
  dados.qryupdate.SQL.add(':BASE_PIS,');
  dados.qryupdate.SQL.add(':ALIQ_PIS,');
  dados.qryupdate.SQL.add(':VL_PIS,');
  dados.qryupdate.SQL.add(':BASE_COF,');
  dados.qryupdate.SQL.add(':ALIQ_COF,');
  dados.qryupdate.SQL.add(':VL_COF,');
  dados.qryupdate.SQL.add(':FRETE1,');
  dados.qryupdate.SQL.add(':DESPESA,');
  dados.qryupdate.SQL.add(':SEGURO,');
  dados.qryupdate.SQL.add(':DESCONTO,');
  dados.qryupdate.SQL.add(':GERA_CP,');
  dados.qryupdate.SQL.add(':GERA_ES,');
  dados.qryupdate.SQL.add(':SITUACAO,');
  dados.qryupdate.SQL.add(':FK_PRODUTO_FORN,');
  dados.qryupdate.SQL.add(':CST_PIS,');
  dados.qryupdate.SQL.add(':CST_COF,');
  dados.qryupdate.SQL.add(':CST_IPI,');
  dados.qryupdate.SQL.add(':ALIQ_ST,');
  dados.qryupdate.SQL.add(':FK_USUARIO,');
  dados.qryupdate.SQL.add(':QTD_DEVOLVIDA,');
  dados.qryupdate.SQL.add(':PR_VENDA');
  dados.qryupdate.SQL.add(');');

  vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
  vPesquisa := trim(copy((EdtProduto.Text), vPosicao, 1000));

  vQtd := StrToFloatDef(copy(EdtProduto.Text, 1,
    Pos('*', EdtProduto.Text) - 1), 1);

  dados.qryupdate.ParamByName('ID').Value := dados.Numerador('COMPRA_ITENS',
    'ID', 'N', '', '');
  dados.qryupdate.ParamByName('ITEM').Value := dados.Numerador('COMPRA_ITENS',
    'ITEM', 'S', 'FK_COMPRA', qryCompraID.AsString);
  dados.qryupdate.ParamByName('FK_COMPRA').Value := qryCompraID.Value;
  dados.qryupdate.ParamByName('EMPRESA').Value := dados.qryEmpresaCODIGO.Value;
  dados.qryupdate.ParamByName('BASE_IPI').Value := 0;
  dados.qryupdate.ParamByName('BASE_ICMS').Value := 0;
  dados.qryupdate.ParamByName('BASE_ST').Value := 0;
  dados.qryupdate.ParamByName('BASE_PIS').Value := 0;
  dados.qryupdate.ParamByName('BASE_COF').Value := 0;
  dados.qryupdate.ParamByName('ALIQ_IPI').Value := 0;
  dados.qryupdate.ParamByName('ALIQ_ICMS').Value := 0;
  dados.qryupdate.ParamByName('ALIQ_PIS').Value := 0;
  dados.qryupdate.ParamByName('ALIQ_COF').Value := 0;
  dados.qryupdate.ParamByName('VL_IPI').Value := 0;
  dados.qryupdate.ParamByName('VL_ICMS').Value := 0;
  dados.qryupdate.ParamByName('VL_ST').Value := 0;
  dados.qryupdate.ParamByName('VL_PIS').Value := 0;
  dados.qryupdate.ParamByName('VL_COF').Value := 0;
  dados.qryupdate.ParamByName('FRETE1').Value := 0;
  dados.qryupdate.ParamByName('DESPESA').Value := 0;
  dados.qryupdate.ParamByName('DESCONTO').Value := 0;
  dados.qryupdate.ParamByName('SEGURO').Value := 0;
  dados.qryupdate.ParamByName('GERA_CP').Value := qryCompraAJUSTA_PV.Value;
  dados.qryupdate.ParamByName('GERA_ES').Value := qryCompraGERA_ES.Value;
  dados.qryupdate.ParamByName('SITUACAO').Value := qryCompraSTATUS.Value;
  if qryCompraVIRTUAL_UF.Value = dados.qryEmpresaUF.Value then
    dados.qryupdate.ParamByName('CFOP').Value := '1102'
  else
    dados.qryupdate.ParamByName('CFOP').Value := '2102';
  dados.qryupdate.ParamByName('CST_ICM').Value := '041';
  dados.qryupdate.ParamByName('FK_PRODUTO').Value :=
    dados.buscacodigoProduto('select codigo from produto where codbarra=:cod',
    vPesquisa);
  dados.qryupdate.ParamByName('DESCRICAO').Value :=
    dados.BuscaDescricaoProdutoBarra(vPesquisa);
  dados.qryupdate.ParamByName('QTD').AsFloat := vQtd;
  BuscaPreco(dados.qryupdate.ParamByName('FK_PRODUTO').Value);
  dados.qryupdate.ParamByName('VL_UNITARIO').AsFloat := FPrecoCusto;
  dados.qryupdate.ParamByName('PR_VENDA').AsFloat := FPrecoVenda;
  dados.qryupdate.ParamByName('VL_ITEM').AsFloat := vQtd * FPrecoCusto;
  dados.qryupdate.Prepare;
  dados.qryupdate.ExecSQL;
  dados.Conexao.CommitRetaining;

  // dados.AtualizaEstoque(vQtd, dados.qryupdate.ParamByName('FK_PRODUTO').Value);

  qryItensCompra.Refresh;
  qryItensCompra.Last;

  CalculaTotais;

end;

procedure TfrmCadCompra.pnPessoaExit(Sender: TObject);
begin

  if vpessoa <> DBEdit27.EditText then
  begin
    if not qryFornecedor.IsEmpty then
      GetFornecedor;
  end;

  DBGridPessooa.Visible := false;
  pnPessoa.Height := 36;

end;

procedure TfrmCadCompra.EdtProdutoEnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := false;
end;

procedure TfrmCadCompra.EdtProdutoExit(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := true;
end;

procedure TfrmCadCompra.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin

  if qryCompraLEUXML.Value = 'S' then
    exit;

  if not Panel3.Enabled then
    exit;

  if (Key in [#13]) then
  begin
    if (qryCompra.State in dsEditModes) then
      qryCompra.Post;

    if ActiveControl = EdtProduto then
    begin
      if EdtProduto.Text <> '' then
      begin
        InsereItem;
        EdtProduto.SetFocus;
        EdtProduto.Clear;
        Key := #0;
      end
      else
      begin
        DBEdit12.SetFocus;
      end;
    end;
  end;
end;

end.
{ TODO -oCompra -cCampos : 22-07-2019 Aumentar para 4 casas decimais o preço }
