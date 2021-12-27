{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit uCadOrcamento;

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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, Vcl.Grids,
  Vcl.DBGrids, JvComponentBase, JvEnterTab;

type
  TfrmCadOrcamento = class(TForm)
    Panel1: TPanel;
    btnFinalizar: TSpeedButton;
    btnSair: TSpeedButton;
    dsOrcamento: TDataSource;
    dsItens: TDataSource;
    qrySoma: TFDQuery;
    qryOrcamento: TFDQuery;
    qryOrcamentoCODIGO: TIntegerField;
    qryOrcamentoDATA: TDateField;
    qryOrcamentoFKVENDEDOR: TIntegerField;
    qryOrcamentoFK_CLIENTE: TIntegerField;
    qryOrcamentoCLIENTE: TStringField;
    qryOrcamentoTELEFONE: TStringField;
    qryOrcamentoCELULAR: TStringField;
    qryOrcamentoENDERECO: TStringField;
    qryOrcamentoNUMERO: TStringField;
    qryOrcamentoBAIRRO: TStringField;
    qryOrcamentoCEP: TStringField;
    qryOrcamentoCIDADE: TStringField;
    qryOrcamentoUF: TStringField;
    qryOrcamentoFORMA_PAGAMENTO: TStringField;
    qryOrcamentoVALIDADE: TSmallintField;
    qryOrcamentoOBS: TMemoField;
    qryOrcamentoSITUACAO: TStringField;
    qryItensO: TFDQuery;
    qryOrcamentoVIRTUAL_SITUACAO: TStringField;
    qryOrcamentoFKEMPRESA: TIntegerField;
    Panel3: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label27: TLabel;
    DBEdit28: TDBEdit;
    Label28: TLabel;
    DBEdit29: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    qryOrcamentoVIRTUAL_VENDEDOR: TStringField;
    DBEdit3: TDBEdit;
    qryOrcamentoCNPJ: TStringField;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Panel2: TPanel;
    Label14: TLabel;
    DBText2: TDBText;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBText3: TDBText;
    qryOrcamentoVIRTUAL_EMPRESA: TStringField;
    Panel4: TPanel;
    btnProdutos: TSpeedButton;
    btnPessoas: TSpeedButton;
    qryOrcamentoTOTAL: TFMTBCDField;
    qryOrcamentoSUBTOTAL: TFMTBCDField;
    qryOrcamentoPERCENTUAL: TFMTBCDField;
    qryOrcamentoDESCONTO: TFMTBCDField;
    qrySomaTOTAL: TFMTBCDField;
    qryItensOCODIGO: TIntegerField;
    qryItensOFK_ORCAMENTO: TIntegerField;
    qryItensOFK_PRODUTO: TIntegerField;
    qryItensOQTD: TFMTBCDField;
    qryItensOPRECO: TFMTBCDField;
    qryItensOTOTAL: TFMTBCDField;
    qryItensOITEM: TSmallintField;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdUNIDADE: TStringField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdQTD_ATUAL: TFMTBCDField;
    qryProdREFERENCIA: TStringField;
    qryProdLOCALIZACAO: TStringField;
    qryItensOVIRTUAL_PRODUTO: TStringField;
    qryItensOVIRTUAL_UNIDADE: TStringField;
    qryItensOVIRTUAL_PRECO: TExtendedField;
    qryItensOVIRTUAL_ESTOQUE: TExtendedField;
    qryItensOVIRTUAL_REFERENCIA: TStringField;
    qryItensOVIRTUAL_LOCAL: TStringField;
    qryTransp: TFDQuery;
    qryOrcamentoNCONTROLE: TIntegerField;
    qryItensOFK_GRADE: TIntegerField;
    qryOrcamentoFK_TRANSP: TIntegerField;
    dsTransp: TDataSource;
    qryTranspCODIGO: TIntegerField;
    qryTranspNOME: TStringField;
    qryGrade: TFDQuery;
    qryItensOVIRTUAL_GRADE: TStringField;
    qryItensOVIRTUAL_PRECO_GRADE: TFloatField;
    qryGradeCODIGO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradePRECO: TFMTBCDField;
    qryGradeFK_PRODUTO: TIntegerField;
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
    dsCliente: TDataSource;
    Label19: TLabel;
    btnSalvar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label18: TLabel;
    DBGridEh1: TDBGridEh;
    TabSheet1: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    Panel5: TPanel;
    grpSelecao: TGroupBox;
    EdtProduto: TEdit;
    qryItensODESCRICAO: TStringField;
    dbProduto: TDataSource;
    pnPessoa: TPanel;
    DBGridPessooa: TDBGridEh;
    DBEdit27: TDBEdit;
    Label2: TLabel;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryOrcamentoBeforeOpen(DataSet: TDataSet);
    procedure qryItensOBeforeOpen(DataSet: TDataSet);
    procedure qryItensONewRecord(DataSet: TDataSet);
    procedure qryOrcamentoAfterPost(DataSet: TDataSet);
    procedure qryOrcamentoCalcFields(DataSet: TDataSet);
    procedure qryOrcamentoAfterOpen(DataSet: TDataSet);
    procedure qryItensOBeforeInsert(DataSet: TDataSet);
    procedure qryItensOAfterPost(DataSet: TDataSet);
    procedure qryItensOAfterDelete(DataSet: TDataSet);
    procedure qryItensOQTDValidate(Sender: TField);
    procedure DBEdit27Change(Sender: TObject);
    procedure qryItensOFK_PRODUTOChange(Sender: TField);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure qryOrcamentoDESCONTOValidate(Sender: TField);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure qryOrcamentoNewRecord(DataSet: TDataSet);
    procedure qryOrcamentoBeforePost(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPessoasClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure qryItensOFK_GRADEChange(Sender: TField);
    procedure EdtProdutoChange(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qryItensOBeforePost(DataSet: TDataSet);
    procedure DBGridEh1Columns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridPessooaDblClick(Sender: TObject);
    procedure pnPessoaExit(Sender: TObject);
    procedure DBGridPessooaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1ColEnter(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtProdutoEnter(Sender: TObject);
    procedure EdtProdutoExit(Sender: TObject);
  private
    vPosicao: integer;
    vPesquisa: string;
    vQtd: extended;
    FPodeAlterar: Boolean;
    vletras: string[100];
    procedure LocalizaCliente(Tipo: string);
    procedure InsereItem(CodigoBarra: String);
    function BuscaPreco(CodProduto, CodGrade: integer; qtd: extended): extended;
    procedure RatearDesconto;
    procedure GetCliente;
    { Private declarations }
  public
    vpessoa: string;
    procedure CalculaTotais;
    { Public declarations }
  end;

var
  frmCadOrcamento: TfrmCadOrcamento;

implementation

{$R *.dfm}

uses Udados, uOrcamento, uCadProduto, uCadPessoa;

procedure TfrmCadOrcamento.RatearDesconto;
var
  TSoma, TDif, TPercentual: extended;
  TSomaOutro, TDifOutro: extended;
  ValorDesconto, ValorAcrescimo: extended;
  MaiorItem: extended;
begin

  try

    qryItensO.DisableControls;

    TSoma := 0;
    ValorDesconto := 0;

    qryItensO.First;

    while not qryItensO.Eof do
    begin

      TPercentual := qryItensOTOTAL.AsFloat / qryOrcamentoSUBTOTAL.AsFloat;

      ValorDesconto := SimpleRoundTo
        (TPercentual * qryOrcamentoDESCONTO.AsFloat, -2);

      Dados.qryExecute.Close;
      Dados.qryExecute.sql.Clear;
      Dados.qryExecute.sql.Text :=
        'update ORCAMENTO_ITEM set DESCONTO=:DESCONTO WHERE CODIGO=:COD';
      Dados.qryExecute.Params[0].Value := ValorDesconto;
      Dados.qryExecute.Params[1].Value := qryItensOCODIGO.Value;
      Dados.qryExecute.ExecSQL;

      Dados.Conexao.CommitRetaining;

      TSoma := TSoma + SimpleRoundTo(ValorDesconto, -2);
      qryItensO.Next;
    end;

    qryItensO.Refresh;

    TDif := SimpleRoundTo(qryOrcamentoDESCONTO.AsFloat - TSoma, -2);

    Dados.qryconsulta.Close;
    Dados.qryconsulta.sql.Clear;
    Dados.qryconsulta.sql.Add
      ('select first 1 codigo, coalesce(max(total),0) total from orcamento_item');
    Dados.qryconsulta.sql.Add('where fk_orcamento=:cod');
    Dados.qryconsulta.sql.Add('group by 1');
    Dados.qryconsulta.sql.Add('order by 2 desc');
    Dados.qryconsulta.Params[0].Value := qryItensOFK_ORCAMENTO.Value;
    Dados.qryconsulta.Open;

    MaiorItem := Dados.qryconsulta.Fields[0].AsInteger;

    if TDif <> 0 then
    begin

      Dados.qryExecute.Close;
      Dados.qryExecute.sql.Clear;
      Dados.qryExecute.sql.Text :=
        'update ORCAMENTO_ITEM set DESCONTO= DESCONTO + :DESCONTO WHERE CODIGO=:COD';
      Dados.qryExecute.Params[0].Value := TDif;
      Dados.qryExecute.Params[1].Value := MaiorItem;
      Dados.qryExecute.ExecSQL;
      Dados.Conexao.CommitRetaining;
    end;

    qryItensO.Refresh;

  finally
    qryItensO.EnableControls;
  end;
end;

procedure TfrmCadOrcamento.btnFinalizarClick(Sender: TObject);
begin
  if qryItensO.IsEmpty then
  begin
    ShowMessage('Informe os Itens do Orçamento!');
    exit;
  end;

  if (qryOrcamentoFKVENDEDOR.IsNull) then
  begin
    ShowMessage('Informe o Vendedor!');
    exit;
  end;

  if (qryOrcamentoCLIENTE.IsNull) then
  begin
    ShowMessage('Informe o Cliente!');
    exit;
  end;

  If application.messagebox('Tem certeza que FINALIZAR ORÇAMENTO?',
    'Confirmação', mb_yesno + mb_iconquestion) = idno then
    exit;
  try
    btnFinalizar.Enabled := false;
    if not(Dados.qryOrcamento.State in dsEditModes) then
      qryOrcamento.Edit;
    qryOrcamentoSITUACAO.Value := 'F';
    qryOrcamento.Post;

    RatearDesconto;

    Close;
  finally
    btnFinalizar.Enabled := true;
  end;
end;

procedure TfrmCadOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if application.messagebox('Deseja Sair da Tela?', 'Confirmação', mb_yesno) <> mrYes
  then
    Action := caNone;
end;

procedure TfrmCadOrcamento.FormCreate(Sender: TObject);
begin

  if not(Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    DBGridEh1.Columns[1].FieldName := 'VIRTUAL_PRODUTO';
    DBGridEh1.Columns[0].ReadOnly := false;
  end
  else
  begin
    DBGridEh1.Columns[1].FieldName := 'DESCRICAO';
    DBGridEh1.Columns[0].ReadOnly := true;
  end;

  vletras := ''; // pesquisa parte
  qryProd.Filtered := false;
end;

procedure TfrmCadOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2:
      btnSalvarClick(self);

    vk_f3:
      btnFinalizarClick(self);
    vk_f6:
      btnProdutosClick(self);

    vk_f7:
      btnPessoasClick(self);

    VK_ESCAPE:
      begin

        if ActiveControl <> DBGridEh1 then
          btnSairClick(self)
        else if not(dsItens.DataSet.State in dsEditModes) then
          btnSairClick(self)

      end;

    vk_f11:
      EdtProduto.SetFocus;
  end;

end;

procedure TfrmCadOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FPodeAlterar then
  begin

    if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    begin

      Key := UpCase(Key); // pesquisa parcial

      if DBGridEh1.SelectedIndex = 1 then
      begin

        if (Key = #8) then
        begin

          if length(vletras) = 1 then
            vletras := ''
          else
            vletras := copy(vletras, 1, length(vletras) - 1);
        end;

        if (Key in ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', ' ', '/', '-', '.', ':',
          '@', '&', '*', '%', '$', '(', ')', '=', '?', ':', ';', '{', '}', '[',
          ']', '+', '*', '#', '!']) then
        begin
          vletras := vletras + UpperCase(Key);
        end;

        if Dados.EhNumero(vletras) and (vletras <> '') then
          qryProd.Filter := 'CODIGO = ' + vletras
        else
        begin
          if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
            qryProd.Filter := 'DESCRICAO LIKE ' +
              QuotedStr('%' + UpperCase(vletras) + '%');
        end;

        qryProd.Filtered := true;

        if qryProdCODIGO.AsInteger > 0 then
        begin
          if vletras <> '' then
          begin
            if not(qryItensO.State in dsEditModes) then
              qryItensO.Edit;
            qryItensOFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
          end;
        end;
      end
      else
      begin
        vletras := '';
        qryProd.Filtered := false;
      end;
    end;
  end;
end;

procedure TfrmCadOrcamento.FormShow(Sender: TObject);
begin

  Dados.qryPesqEmp.Close;
  Dados.qryPesqEmp.Open;

  if Panel3.Enabled then
    DBEdit27.SetFocus;

  btnProdutos.Visible := Dados.vLiberaProduto;
  btnPessoas.Visible := Dados.vLiberaPessoa;

  qryTransp.Close;
  qryTransp.Open;

  qryProd.Close;
  qryProd.Params[0].Value := '%';
  qryProd.Open;

  qryGrade.Close;
  qryGrade.Open;

  Dados.AjustaCamposNovos('orcamento');

end;

procedure TfrmCadOrcamento.qryOrcamentoAfterOpen(DataSet: TDataSet);
begin
  qryItensO.Close;
  qryItensO.Params[0].Value := qryOrcamentoCODIGO.Value;
  qryItensO.Open;

  qrySoma.Close;
  qrySoma.Open;

end;

procedure TfrmCadOrcamento.qryOrcamentoAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOrcamento.qryOrcamentoBeforeOpen(DataSet: TDataSet);
begin
  qryClientes.Close;
  qryClientes.Params[0].Value := '%';
  qryClientes.Params[1].Value := '%';
  qryClientes.Open;

  Dados.qryVendedor.Close;
  Dados.qryVendedor.Open;
end;

procedure TfrmCadOrcamento.qryOrcamentoBeforePost(DataSet: TDataSet);
begin

  if qryOrcamento.State = dsInsert then
    qryOrcamentoCODIGO.Value := Dados.Numerador('ORCAMENTO', 'CODIGO',
      'N', '', '');

  qryOrcamentoTOTAL.Value := qryOrcamentoSUBTOTAL.Value -
    qryOrcamentoDESCONTO.Value;

  if qryOrcamento.State = dsInsert then
  begin
    qryItensO.Close;
    qryItensO.Params[0].Value := qryOrcamentoCODIGO.Value;
    qryItensO.Open;
  end;

end;

procedure TfrmCadOrcamento.qryOrcamentoCalcFields(DataSet: TDataSet);
begin
  if qryOrcamentoSITUACAO.Value = 'A' then
    qryOrcamentoVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryOrcamentoSITUACAO.Value = 'F' then
    qryOrcamentoVIRTUAL_SITUACAO.Value := 'FECHADO';
  if qryOrcamentoSITUACAO.Value = 'C' then
    qryOrcamentoVIRTUAL_SITUACAO.Value := 'CANCELADO';
end;

procedure TfrmCadOrcamento.qryOrcamentoDESCONTOValidate(Sender: TField);
begin
  qryOrcamentoTOTAL.Value := qryOrcamentoSUBTOTAL.Value -
    qryOrcamentoDESCONTO.Value;
end;

procedure TfrmCadOrcamento.qryOrcamentoNewRecord(DataSet: TDataSet);
begin
  qryOrcamentoDESCONTO.Value := 0;
  qryOrcamentoPERCENTUAL.Value := 0;
end;

procedure TfrmCadOrcamento.CalculaTotais;
begin
  qrySoma.Refresh;
  qryOrcamento.Edit;
  qryOrcamentoSUBTOTAL.AsFloat := qrySomaTOTAL.AsFloat;
  qryOrcamento.Post;
end;

procedure TfrmCadOrcamento.GetCliente;
begin
  if (qryOrcamento.State in dsEditModes) then
    qryOrcamento.Edit;
  if DBEdit27.EditText <> '' then
    LocalizaCliente('nome')
  else
    LocalizaCliente('');
end;

procedure TfrmCadOrcamento.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadOrcamento.qryItensOAfterDelete(DataSet: TDataSet);
begin
  CalculaTotais;
end;

procedure TfrmCadOrcamento.qryItensOAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
  CalculaTotais;
  vletras := '';
  qryProd.Filtered := false;
end;

procedure TfrmCadOrcamento.qryItensOBeforeInsert(DataSet: TDataSet);
begin
  if (qryOrcamento.State in dsEditModes) then
    qryOrcamento.Post;
end;

function TfrmCadOrcamento.BuscaPreco(CodProduto, CodGrade: integer;
  qtd: extended): extended;
var
  Qtde: real;
  valida1, valida2: Boolean;

begin

  result := 0;

  if CodGrade > 0 then
  begin
    Dados.qryconsulta.Close;
    Dados.qryconsulta.sql.Text :=
      'select PRECO from PRODUTO_GRADE WHERE CODIGO=:COD';
    Dados.qryconsulta.Params[0].Value := CodGrade;
    Dados.qryconsulta.Open;
    result := Dados.qryconsulta.FieldByName('PRECO').AsFloat;

  end
  else
  begin

    Dados.qryconsulta.Close;
    Dados.qryconsulta.sql.Text :=
      'select INICIO_PROMOCAO, FIM_PROMOCAO, PR_VENDA, PRECO_PROMO_VAREJO, PRECO_PROMO_ATACADO, PRECO_ATACADO, QTD_ATACADO from PRODUTO WHERE CODIGO=:COD';
    Dados.qryconsulta.Params[0].Value := CodProduto;
    Dados.qryconsulta.Open;

    result := Dados.qryconsulta.FieldByName('PR_VENDA').AsFloat;

    Qtde := 0;
    if qtd > 0 then
      Qtde := qtd;
    if (date >= Dados.qryconsulta.FieldByName('INICIO_PROMOCAO').AsDateTime) and
      (date <= Dados.qryconsulta.FieldByName('FIM_PROMOCAO').AsDateTime) then
    begin
      // produto em promoção
      result := Dados.qryconsulta.FieldByName('PRECO_PROMO_VAREJO').AsFloat;
      if (Qtde >= Dados.qryconsulta.FieldByName('QTD_ATACADO').AsFloat) and
        (Dados.qryconsulta.FieldByName('QTD_ATACADO').AsFloat > 0) and
        (Dados.qryconsulta.FieldByName('PRECO_PROMO_ATACADO').AsFloat > 0) then
        result := Dados.qryconsulta.FieldByName('PRECO_PROMO_ATACADO').AsFloat;
    end
    else
    begin

      if ((Qtde >= Dados.qryconsulta.FieldByName('QTD_ATACADO').AsFloat) and
        (Dados.qryconsulta.FieldByName('QTD_ATACADO').AsFloat > 0) and
        (Dados.qryconsulta.FieldByName('PRECO_ATACADO').AsFloat > 0)) then
        result := Dados.qryconsulta.FieldByName('PRECO_ATACADO').AsFloat;

    end;
  end;
end;

procedure TfrmCadOrcamento.qryItensOBeforeOpen(DataSet: TDataSet);
begin
  Dados.qryProd.Close;
  Dados.qryProd.Open;
end;

procedure TfrmCadOrcamento.qryItensOBeforePost(DataSet: TDataSet);
begin
  if (qryItensODESCRICAO.IsNull) or (qryItensODESCRICAO.AsString = '') then
  begin
    // pesquisa parcial
    raise Exception.Create('Informe a Descrição do Produto');

  end;

end;

procedure TfrmCadOrcamento.qryItensOFK_GRADEChange(Sender: TField);
var
  FPreco: extended;
begin
  qryGrade.Filtered := false;
  qryGrade.Filter := 'FK_PRODUTO=' + qryItensOFK_PRODUTO.AsString;
  qryGrade.Filtered := true;

  FPreco := BuscaPreco(qryItensOFK_PRODUTO.AsInteger,
    qryItensOFK_GRADE.AsInteger, qryItensOQTD.AsFloat);

  if FPreco > 0 then
    qryItensOPRECO.AsFloat := FPreco;

end;

procedure TfrmCadOrcamento.qryItensOFK_PRODUTOChange(Sender: TField);
begin
  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    if DBGridEh1.SelectedIndex = 1 then
    begin
      qryItensO.FieldByName('PRECO').AsFloat :=
        BuscaPreco(qryItensOFK_PRODUTO.AsInteger, qryItensOFK_GRADE.AsInteger,
        qryItensOQTD.AsFloat);
    end;
  end
  else
  begin
    if DBGridEh1.SelectedIndex < 2 then
    begin
      qryItensO.FieldByName('PRECO').AsFloat :=
        BuscaPreco(qryItensOFK_PRODUTO.AsInteger, qryItensOFK_GRADE.AsInteger,
        qryItensOQTD.AsFloat);
    end;

  end;
end;

procedure TfrmCadOrcamento.InsereItem(CodigoBarra: String);
begin

  Dados.qryUpdate.Close;
  Dados.qryUpdate.sql.Clear;
  Dados.qryUpdate.sql.Add('INSERT INTO ORCAMENTO_ITEM (');
  Dados.qryUpdate.sql.Add('CODIGO,');
  Dados.qryUpdate.sql.Add('FK_ORCAMENTO,');
  Dados.qryUpdate.sql.Add('FK_PRODUTO,');
  Dados.qryUpdate.sql.Add('DESCRICAO,');
  Dados.qryUpdate.sql.Add('QTD,');
  Dados.qryUpdate.sql.Add('PRECO,');
  Dados.qryUpdate.sql.Add('TOTAL,');
  Dados.qryUpdate.sql.Add('ITEM');
  Dados.qryUpdate.sql.Add(') VALUES (');
  Dados.qryUpdate.sql.Add(':CODIGO,');
  Dados.qryUpdate.sql.Add(':FK_ORCAMENTO,');
  Dados.qryUpdate.sql.Add(':FK_PRODUTO,');
  Dados.qryUpdate.sql.Add(':DESCRICAO,');
  Dados.qryUpdate.sql.Add(':QTD,');
  Dados.qryUpdate.sql.Add(':PRECO,');
  Dados.qryUpdate.sql.Add(':TOTAL,');
  Dados.qryUpdate.sql.Add(':ITEM);');


  Dados.qryUpdate.ParamByName('CODIGO').Value :=
    Dados.Numerador('ORCAMENTO_ITEM', 'CODIGO', 'N', '', '');
  Dados.qryUpdate.ParamByName('ITEM').Value := Dados.Numerador('ORCAMENTO_ITEM',
    'ITEM', 'S', 'FK_ORCAMENTO', qryOrcamentoCODIGO.AsString);
  Dados.qryUpdate.ParamByName('FK_ORCAMENTO').Value := qryOrcamentoCODIGO.Value;

  Dados.qryUpdate.ParamByName('FK_PRODUTO').Value :=
    Dados.buscacodigoProduto('select codigo from produto where codbarra=:cod',
    vPesquisa);

  Dados.qryUpdate.ParamByName('DESCRICAO').Value :=
    Dados.BuscaDescricaoProdutoBarra(vPesquisa);

  Dados.qryUpdate.ParamByName('QTD').AsFloat := vQtd;

  Dados.qryUpdate.ParamByName('PRECO').AsFloat :=
    BuscaPreco(Dados.qryUpdate.ParamByName('FK_PRODUTO').Value, 0, vQtd);
  Dados.qryUpdate.ParamByName('TOTAL').AsFloat :=

    Dados.qryUpdate.ParamByName('QTD').AsFloat * Dados.qryUpdate.ParamByName
    ('PRECO').AsFloat;
  Dados.qryUpdate.Prepare;
  Dados.qryUpdate.ExecSQL;

  Dados.Conexao.CommitRetaining;

  qryItensO.Refresh;
  qryItensO.Last;

  CalculaTotais;

end;

procedure TfrmCadOrcamento.qryItensONewRecord(DataSet: TDataSet);
begin
  qryItensO.FieldByName('CODIGO').Value := Dados.Numerador('ORCAMENTO_ITEM',
    'CODIGO', 'N', '', '');
  qryItensO.FieldByName('ITEM').Value := Dados.Numerador('ORCAMENTO_ITEM',
    'ITEM', 'S', 'FK_ORCAMENTO', qryOrcamentoCODIGO.AsString);
  qryItensO.FieldByName('FK_ORCAMENTO').Value := qryOrcamentoCODIGO.Value;
  qryItensO.FieldByName('PRECO').Value := 0;
  qryItensO.FieldByName('QTD').Value := 1;
end;

procedure TfrmCadOrcamento.qryItensOQTDValidate(Sender: TField);
begin

  if qryItensOQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryItensOQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!');

  if qryItensOQTD.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryItensOPRECO.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!');

  qryItensOTOTAL.AsFloat := qryItensO.FieldByName('PRECO').AsFloat *
    qryItensO.FieldByName('QTD').AsFloat;
end;

procedure TfrmCadOrcamento.btnPessoasClick(Sender: TObject);
begin
  try
    btnPessoas.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(application);
    if Not Dados.qryPessoas.Active then
      Dados.qryPessoas.Open;
    Dados.qryPessoas.Insert;
    frmCadPessoa.ShowModal;
  finally
    frmCadPessoa.Release;
    btnPessoas.Enabled := true;
    Dados.qryFornecedor.Close;
    Dados.qryFornecedor.Open;

  end;
end;

procedure TfrmCadOrcamento.btnProdutosClick(Sender: TObject);
begin

  try
    FrmCadProduto := TFrmCadProduto.Create(application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.ShowModal;

  finally
    FrmCadProduto.Release;
    Dados.qryProd.Close;
    Dados.qryProd.Open;
  end;
end;

procedure TfrmCadOrcamento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadOrcamento.btnSalvarClick(Sender: TObject);
begin
  if (qryOrcamentoFKVENDEDOR.IsNull) then
  begin
    ShowMessage('Informe o Vendedor!');
    exit;
  end;

  if (qryOrcamentoCLIENTE.IsNull) then
  begin
    ShowMessage('Informe o Cliente!');
    exit;
  end;

  try
    btnSalvar.Enabled := false;

    if qryItensO.State in dsEditModes then
    begin
      if qryItensOFK_PRODUTO.IsNull then
        qryItensO.Cancel
      else
        qryItensO.Post;
    end;

    if qryOrcamento.State in dsEditModes then
      qryOrcamento.Post;

    RatearDesconto;

    ShowMessage('Orçamento Salvo com Sucesso!');
  finally
    btnSalvar.Enabled := true;
  end;

end;

procedure TfrmCadOrcamento.DBEdit11Exit(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  DBGridEh1.SetFocus;
end;

procedure TfrmCadOrcamento.DBEdit12Exit(Sender: TObject);
begin
  if not(qryOrcamento.State in dsEditModes) then
    qryOrcamento.Edit;
  qryOrcamentoDESCONTO.Value :=
    (qryOrcamentoSUBTOTAL.Value * qryOrcamentoPERCENTUAL.Value / 100);

  qryOrcamentoTOTAL.Value := qryOrcamentoSUBTOTAL.Value -
    qryOrcamentoDESCONTO.Value;
end;

procedure TfrmCadOrcamento.DBEdit13Exit(Sender: TObject);
begin
  if not(qryOrcamento.State in dsEditModes) then
    qryOrcamento.Edit;
  if qryOrcamentoSUBTOTAL.Value > 0 then
    qryOrcamentoPERCENTUAL.Value := 100 -
      ((qryOrcamentoTOTAL.Value * 100) / qryOrcamentoSUBTOTAL.Value);
end;

procedure TfrmCadOrcamento.DBEdit27Change(Sender: TObject);
begin
  if not Panel3.Enabled then
    exit;

  if vpessoa <> DBEdit27.Text then
  begin

    DBGridPessooa.Visible := true;
    pnPessoa.Height := 150;
  end;

  qryClientes.Close;
  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    qryClientes.Params[0].Value := '%' + DBEdit27.Text + '%';
    qryClientes.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end
  else
  begin
    qryClientes.Params[0].Value := DBEdit27.Text + '%';
    qryClientes.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end;

  qryClientes.Open;

end;

procedure TfrmCadOrcamento.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryClientes.Prior;
  if Key = VK_DOWN then
    qryClientes.Next;

end;

procedure TfrmCadOrcamento.LocalizaCliente(Tipo: string);
begin
  if not(qryOrcamento.State in dsEditModes) then
    qryOrcamento.Edit;

  if Tipo = 'nome' then
  begin
    if (not qryClientes.IsEmpty) then
    begin
      qryOrcamentoFK_CLIENTE.Value := qryClientesCODIGO.Value;
      qryOrcamentoCLIENTE.Value := qryClientesRAZAO.Value;
      qryOrcamentoENDERECO.Value := qryClientesENDERECO.Value;
      qryOrcamentoNUMERO.Value := qryClientesNUMERO.Value;
      qryOrcamentoBAIRRO.Value := qryClientesBAIRRO.Value;
      qryOrcamentoCIDADE.Value := qryClientesMUNICIPIO.Value;
      qryOrcamentoUF.Value := qryClientesUF.Value;
      qryOrcamentoCEP.Value := qryClientesCEP.Value;
      qryOrcamentoCNPJ.Value := qryClientesCNPJ.Value;
      qryOrcamentoTELEFONE.Value := qryClientesFONE1.Value;
      qryOrcamentoCELULAR.Value := qryClientesCELULAR1.Value;
    end
    else
    begin
      qryOrcamentoFK_CLIENTE.Value := 0;
      qryOrcamentoENDERECO.Value := '';
      qryOrcamentoNUMERO.Value := '';
      qryOrcamentoBAIRRO.Value := '';
      qryOrcamentoCIDADE.Value := '';
      qryOrcamentoUF.Value := '';
      qryOrcamentoCEP.Value := '';
      qryOrcamentoCNPJ.Value := '';
      qryOrcamentoTELEFONE.Value := '';
      qryOrcamentoCELULAR.Value := '';
    end;
  end;

end;

procedure TfrmCadOrcamento.pnPessoaExit(Sender: TObject);
begin
  if not qryClientes.IsEmpty then
  begin
    if vpessoa <> DBEdit27.Text then
    begin
      GetCliente;
    end;
  end;

  DBGridPessooa.Visible := false;
  pnPessoa.Height := 36;

end;

procedure TfrmCadOrcamento.DBGrid1Exit(Sender: TObject);
begin

  if DBEdit27.EditText <> '' then
    LocalizaCliente('nome')
  else
    LocalizaCliente('');
  DBEdit5.SetFocus;
end;

procedure TfrmCadOrcamento.DBGridEh1ColEnter(Sender: TObject);
begin
  if DBGridEh1.SelectedIndex <> 1 then
  begin
    if qryItensODESCRICAO.Value <> qryItensOVIRTUAL_PRODUTO.AsString then
      if qryItensO.State in dsEditModes then
        qryItensODESCRICAO.Value := qryItensOVIRTUAL_PRODUTO.AsString;
  end
  else
  begin
    vletras := '';
    qryProd.Filtered := false;
  end;

end;

procedure TfrmCadOrcamento.DBGridEh1Columns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if DBGridEh1.SelectedIndex = 1 then
    qryItensOFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;

end;

procedure TfrmCadOrcamento.DBGridEh1DblClick(Sender: TObject);
begin

  if not Dados.vLiberaProduto then
  begin
    ShowMessage
      ('Usuário não tem permissão para alterar os dados cadastrais do produto!');
    exit;
  end;

  if not qryItensO.IsEmpty then
  begin

    try
      FrmCadProduto := TFrmCadProduto.Create(application);
      FrmCadProduto.qryProdutos.Close;
      FrmCadProduto.qryProdutos.Params[0].Value :=
        qryItensO.FieldByName('FK_PRODUTO').Value;
      FrmCadProduto.qryProdutos.Open;
      FrmCadProduto.qryProdutos.Edit;

      FrmCadProduto.ShowModal;

    finally
      FrmCadProduto.Release;
      Dados.qryProd.Close;
      Dados.qryProd.Open;
    end;

  end;
end;

procedure TfrmCadOrcamento.DBGridEh1Enter(Sender: TObject);
begin
  vletras := ''; // pesquisa parte
  qryProd.Filtered := false;
  FPodeAlterar := true;
end;

procedure TfrmCadOrcamento.DBGridEh1Exit(Sender: TObject);
begin
  vletras := ''; // pesquisa parte
  qryProd.Filtered := false;
  FPodeAlterar := false;
end;

procedure TfrmCadOrcamento.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;

  case Key of
    vk_delete:
      begin
        if application.messagebox('Deseja Excluir Produto?', 'Confirmação',
          mb_yesno) = mrYes then
          qryItensO.delete;
      end;
  end;
end;

procedure TfrmCadOrcamento.DBGridPessooaDblClick(Sender: TObject);
begin
  DBEdit27.EditText := qryClientesRAZAO.Value;
  qryOrcamentoCLIENTE.AsString := qryClientesRAZAO.Value;
end;

procedure TfrmCadOrcamento.DBGridPessooaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    qryOrcamentoCLIENTE.AsString := qryClientesRAZAO.Value;
end;

procedure TfrmCadOrcamento.EdtProdutoChange(Sender: TObject);
begin
  vPosicao := Pos('*', trim(EdtProduto.Text)) + 1;
  vPesquisa := trim(copy((EdtProduto.Text), vPosicao, 1000));
  vQtd := StrToFloatDef(copy(EdtProduto.Text, 1,
    Pos('*', EdtProduto.Text) - 1), 1);
end;

procedure TfrmCadOrcamento.EdtProdutoEnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := false;
end;

procedure TfrmCadOrcamento.EdtProdutoExit(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := true;
end;

procedure TfrmCadOrcamento.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin

  if not Panel3.Enabled then
    exit;

  if (Key in [#13]) then
  begin

    if (qryOrcamento.State in dsEditModes) then
      qryOrcamento.Post;

    if ActiveControl = EdtProduto then
    begin
      if EdtProduto.Text <> '' then
      begin
        InsereItem('');
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
