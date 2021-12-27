unit uImportarCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, pcnConversao,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, ACBrBase, ACBrDFe, ACBrNFe, Vcl.ComCtrls;

type
  TfrmImportaCompra = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtNumero: TEdit;
    OpenDialog1: TOpenDialog;
    ACBrNFe: TACBrNFe;
    Panel2: TPanel;
    qryProdutos: TFDQuery;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosTIPO: TStringField;
    qryProdutosCODBARRA: TStringField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosGRUPO: TIntegerField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosULTFORN: TIntegerField;
    qryProdutosLOCALIZACAO: TStringField;
    qryProdutosALIQ_ICM: TCurrencyField;
    qryProdutosALIQ_PIS: TCurrencyField;
    qryProdutosALIQ_COF: TCurrencyField;
    qryProdutosPR_CUSTO: TFMTBCDField;
    qryProdutosMARGEM: TCurrencyField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryProdutosQTD_ATUAL: TFMTBCDField;
    qryProdutosQTD_MIN: TFMTBCDField;
    qryProdutosE_MEDIO: TFMTBCDField;
    qryProdutosCSTICMS: TStringField;
    qryProdutosCSTE: TStringField;
    qryProdutosCSTS: TStringField;
    qryProdutosCSTIPI: TStringField;
    qryProdutosCSOSN: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosCOMISSAO: TCurrencyField;
    qryProdutosDESCONTO: TCurrencyField;
    qryProdutosFOTO: TBlobField;
    qryProdutosATIVO: TStringField;
    qryProdutosCFOP: TStringField;
    qryProdutosPR_CUSTO_ANTERIOR: TFMTBCDField;
    qryProdutosPR_VENDA_ANTERIOR: TFMTBCDField;
    qryProdutosULT_COMPRA: TIntegerField;
    qryProdutosULT_COMPRA_ANTERIOR: TIntegerField;
    qryProdutosPRECO_ATACADO: TFMTBCDField;
    qryProdutosQTD_ATACADO: TFMTBCDField;
    qryProdutosCOD_BARRA_ATACADO: TStringField;
    qryProdutosALIQ_IPI: TFMTBCDField;
    qryProdutosEMPRESA: TSmallintField;
    qryProdutosCEST: TStringField;
    qryProdutosGRADE: TStringField;
    qryProdutosEFISCAL: TStringField;
    qryProdutosPAGA_COMISSAO: TStringField;
    qryProdutosPESO: TFMTBCDField;
    qryProdutosCOMPOSICAO: TStringField;
    qryProdutosPRECO_PROMO_ATACADO: TFMTBCDField;
    qryProdutosPRECO_PROMO_VAREJO: TFMTBCDField;
    qryProdutosINICIO_PROMOCAO: TDateField;
    qryProdutosFIM_PROMOCAO: TDateField;
    qryProdutosESTOQUE_INICIAL: TFMTBCDField;
    qryProdutosPR_VENDA_PRAZO: TFMTBCDField;
    qryProdutosPRECO_VARIAVEL: TStringField;
    qryProdutosAPLICACAO: TStringField;
    qryProdutosREDUCAO_BASE: TFMTBCDField;
    qryProdutosMVA: TFMTBCDField;
    qryProdutosFCP: TFMTBCDField;
    qryProdutosPRODUTO_PESADO: TStringField;
    qryProdutosSERVICO: TStringField;
    qryProdutosDT_CADASTRO: TDateField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosPR_CUSTO2: TFMTBCDField;
    qryProdutosPERC_CUSTO: TFMTBCDField;
    qryProdutosRESTAUTANTE: TStringField;
    qryProdutosTEMPO_ESPERA: TIntegerField;
    qryProdutosCOMPLEMENTO: TStringField;
    qryProdutosFK_MARCA: TIntegerField;
    qryProdutosPREFIXO_BALANCA: TStringField;
    qryProdutosFK_PRINCIPIO_ATIVO: TIntegerField;
    qryProdutosREMEDIO: TStringField;
    qryProdutosTIPO_RESTAURANTE: TStringField;
    qryProdutosFK_TECIDO: TDateField;
    qryFornecedor: TFDQuery;
    qryFornecedorEMPRESA: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorTIPO: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryFornecedorIE: TStringField;
    qryFornecedorFANTASIA: TStringField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorENDERECO: TStringField;
    qryFornecedorNUMERO: TStringField;
    qryFornecedorCOMPLEMENTO: TStringField;
    qryFornecedorCODMUN: TIntegerField;
    qryFornecedorMUNICIPIO: TStringField;
    qryFornecedorBAIRRO: TStringField;
    qryFornecedorUF: TStringField;
    qryFornecedorCEP: TStringField;
    qryFornecedorFONE1: TStringField;
    qryFornecedorFONE2: TStringField;
    qryFornecedorCELULAR1: TStringField;
    qryFornecedorCELULAR2: TStringField;
    qryFornecedorEMAIL1: TStringField;
    qryFornecedorEMAIL2: TStringField;
    qryFornecedorFOTO: TBlobField;
    qryFornecedorSEXO: TStringField;
    qryFornecedorDT_NASC: TDateField;
    qryFornecedorECIVIL: TStringField;
    qryFornecedorDIA_PGTO: TSmallintField;
    qryFornecedorOBS: TMemoField;
    qryFornecedorNUM_USU: TSmallintField;
    qryFornecedorFATURA: TStringField;
    qryFornecedorCHEQUE: TStringField;
    qryFornecedorCCF: TStringField;
    qryFornecedorSPC: TStringField;
    qryFornecedorISENTO: TStringField;
    qryFornecedorFORN: TStringField;
    qryFornecedorFUN: TStringField;
    qryFornecedorCLI: TStringField;
    qryFornecedorFAB: TStringField;
    qryFornecedorTRAN: TStringField;
    qryFornecedorADM: TStringField;
    qryFornecedorATIVO: TStringField;
    qryFornecedorDT_ADMISSAO: TDateField;
    qryFornecedorDT_DEMISSAO: TDateField;
    qryFornecedorLIMITE: TFMTBCDField;
    qryFornecedorSALARIO: TFMTBCDField;
    qryFornecedorPAI: TStringField;
    qryFornecedorMAE: TStringField;
    qryFornecedorBANCO: TStringField;
    qryFornecedorAGENCIA: TStringField;
    qryFornecedorGERENTE: TStringField;
    qryFornecedorFONE_GERENTE: TStringField;
    qryFornecedorPROPRIEDADE: TStringField;
    qryFornecedorDT_CADASTRO: TDateField;
    qryFornecedorTECNICO: TStringField;
    qryFornecedorATENDENTE: TStringField;
    qryCompra: TFDQuery;
    qryCompraID: TIntegerField;
    qryCompraEMPRESA: TSmallintField;
    qryCompraDTENTRADA: TDateField;
    qryCompraDTEMISSAO: TDateField;
    qryCompraFORNECEDOR: TIntegerField;
    qryCompraMODELO: TStringField;
    qryCompraSERIE: TStringField;
    qryCompraCHAVE: TStringField;
    qryCompraNR_NOTA: TStringField;
    qryCompraGERA_CP: TStringField;
    qryCompraGERA_ES: TStringField;
    qryCompraAJUSTA_PC: TStringField;
    qryCompraAJUSTA_PV: TStringField;
    qryCompraEHFISCAL: TStringField;
    qryCompraLEUXML: TStringField;
    qryCompraSTATUS: TStringField;
    qryCompraXML: TMemoField;
    qryCompraTIPO: TStringField;
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
    qryItensCompra: TFDQuery;
    qryItensCompraID: TIntegerField;
    qryItensCompraFK_COMPRA: TIntegerField;
    qryItensCompraEMPRESA: TSmallintField;
    qryItensCompraITEM: TSmallintField;
    qryItensCompraFK_PRODUTO: TIntegerField;
    qryItensCompraCFOP: TStringField;
    qryItensCompraCST_ICM: TStringField;
    qryItensCompraGERA_CP: TStringField;
    qryItensCompraGERA_ES: TStringField;
    qryItensCompraSITUACAO: TStringField;
    qryItensCompraFK_PRODUTO_FORN: TStringField;
    qryItensCompraCST_PIS: TStringField;
    qryItensCompraCST_COF: TStringField;
    qryItensCompraCST_IPI: TStringField;
    qryItensCompraFK_USUARIO: TIntegerField;
    qryItensCompraVL_UNITARIO: TFMTBCDField;
    qryItensCompraQTD: TFMTBCDField;
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
    qryItensCompraALIQ_ST: TFMTBCDField;
    Button1: TButton;
    btnImportar: TSpeedButton;
    btnIndividual: TSpeedButton;
    qryItensCompraBLOQUEADO: TStringField;
    qryProdutosCFOP_EXTERNO: TIntegerField;
    qryProdutosGLP: TFMTBCDField;
    qryProdutosGNN: TFMTBCDField;
    qryProdutosGNI: TFMTBCDField;
    qryProdutosPESO_LIQ: TFMTBCDField;
    qryProdutosCSOSN_EXTERNO: TStringField;
    qryProdutosCST_EXTERNO: TStringField;
    qryProdutosALIQ_ICMS_EXTERNO: TFMTBCDField;
    qryProdutosORIGEM: TIntegerField;
    qryProdutosQTD_FISCAL: TFMTBCDField;
    qryProdutosMVA_NORMAL: TFMTBCDField;
    qryProdutosANP: TStringField;
    qryProdutosCOMBUSTIVEL: TStringField;
    qryProdutosIMPRIME_TICKET: TStringField;
    qryProdutosICMS_DIFERIDO: TFMTBCDField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    memLista: TListBox;
    TabSheet2: TTabSheet;
    ListBoxErro: TListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImportarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure memListaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnIndividualClick(Sender: TObject);
  private
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaCompra: TfrmImportaCompra;

implementation

{$R *.dfm}

uses uPDV, Udados, uNFe, uCadDevolucao, LeXmlNE;

function TfrmImportaCompra.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmImportaCompra.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  memLista.Items.Clear;
  Ret := FindFirst(Diretorio + '\*.*xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = true then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, true);
          end;
      end
      else
      begin
        memLista.Items.Add(F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

procedure TfrmImportaCompra.memListaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
    memLista.DeleteSelected;

end;

procedure TfrmImportaCompra.btnImportarClick(Sender: TObject);
var
  CNPJ_CPF, CNPJ_CPF_MASCARA, Tipo, crt: string;
  n, i, j: Integer;
  idFornecedor: Integer;
begin

  If application.messagebox('Tem certeza que Deseja Importar XML?',
    'ConfirmaÁ„o', mb_yesno + mb_iconquestion) <> idyes then
    exit;

  OpenDialog1.Execute;
  if OpenDialog1.FileName <> '' then
    edtNumero.Text := copy(ExtractFilePath(OpenDialog1.FileName), 1,
      length(ExtractFilePath(OpenDialog1.FileName)) - 1)
  else
  begin
    ShowMessage('Arquivo inv·lido!');
    exit;
  end;

  ListarArquivos(edtNumero.Text, false);

end;

procedure TfrmImportaCompra.btnIndividualClick(Sender: TObject);
var
  CNPJ_CPF, CNPJ_CPF_MASCARA, Tipo, crt: string;
  n, i, j: Integer;
  idFornecedor: Integer;
begin

  memLista.Items.Clear;

  If application.messagebox('Tem certeza que Deseja Importar XML?',
    'ConfirmaÁ„o', mb_yesno + mb_iconquestion) <> idyes then
    exit;

  OpenDialog1.Execute;
  if OpenDialog1.FileName <> '' then
  begin
    edtNumero.Text := copy(ExtractFilePath(OpenDialog1.FileName), 1,
      length(ExtractFilePath(OpenDialog1.FileName)) - 1);
    memLista.Items.Add(ExtractFileName(OpenDialog1.FileName));

  end
  else
  begin
    ShowMessage('Arquivo inv·lido!');
    exit;
  end;

end;

Function RemoveAcentos(Str: String): String;
{ Remove caracteres acentuados de uma string }
Const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'AAEOUAOAEIOU«UAAEOUAOAEIOU«U';
Var
  x: Integer;
Begin
  For x := 1 to length(Str) do
  Begin
    if Pos(Str[x], ComAcento) <> 0 Then
    begin
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];
    end;
  end;
  Result := Str;
end;

procedure TfrmImportaCompra.Button1Click(Sender: TObject);
var
  CNPJ_CPF, CNPJ_CPF_MASCARA, Tipo, crt: string;
  n, i, j: Integer;
  idFornecedor: Integer;
begin
  try

    Button1.Enabled := false;
    for j := 0 to memLista.Items.Count - 1 do
    begin
      try
        ACBrNFe.NotasFiscais.Clear;
        ACBrNFe.NotasFiscais.LoadFromFile(edtNumero.Text + '\' +
          memLista.Items.Strings[j]);

        if ACBrNFe.NotasFiscais.Items[0].NFe.Ide.modelo = 55 then // se for nfe
        begin

          memLista.ItemIndex := j;

          CNPJ_CPF := ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
          // formata CNPJ

          if length(CNPJ_CPF) = 11 then
          begin
            CNPJ_CPF_MASCARA := copy(CNPJ_CPF, 1, 3) + '.' +
              copy(CNPJ_CPF, 4, 3) + '.' + copy(CNPJ_CPF, 7, 3) + '-' +
              copy(CNPJ_CPF, 10, 2);
            Tipo := 'FÕSICA';
          end;
          if length(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF) = 14 then
          begin
            CNPJ_CPF_MASCARA := copy(CNPJ_CPF, 1, 2) + '.' +
              copy(CNPJ_CPF, 3, 3) + '.' + copy(CNPJ_CPF, 6, 3) + '/' +
              copy(CNPJ_CPF, 9, 4) + '-' + copy(CNPJ_CPF, 13, 2);
            Tipo := 'JURÕDICA';
          end;

          // consulta fornecedor

          qryFornecedor.Close;
          qryFornecedor.Params[0].AsString := CNPJ_CPF_MASCARA;
          qryFornecedor.Open;

          if qryFornecedor.IsEmpty then
          begin // cadastra fornecedor sen„o existir
            qryFornecedor.Insert;
            qryFornecedorEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
            qryFornecedorCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
              'N', '', '');
            qryFornecedorRAZAO.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.xNome));
            qryFornecedorFANTASIA.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.xFant));
            qryFornecedorENDERECO.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.xLgr));
            qryFornecedorNUMERO.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.nro;
            qryFornecedorBAIRRO.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.xBairro));
            qryFornecedorMUNICIPIO.Value :=
              UpperCase(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun);
            qryFornecedorCODMUN.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.cMun;
            qryFornecedorUF.Value :=
              UpperCase(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF);
            qryFornecedorCEP.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.CEP;
            qryFornecedorFONE1.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Emit.EnderEmit.fone;
            crt := CRTToStr(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.crt);
            qryFornecedorCNPJ.Value := CNPJ_CPF_MASCARA;
            qryFornecedorTIPO.Value := Tipo;
            qryFornecedorIE.Value := ACBrNFe.NotasFiscais.Items[0].NFe.Emit.IE;
            qryFornecedorATIVO.Value := 'S';
            qryFornecedorLIMITE.Value := 0;
            qryFornecedorFATURA.Value := 'N';
            qryFornecedorCHEQUE.Value := 'N';
            qryFornecedorCCF.Value := 'N';
            qryFornecedorSPC.Value := 'N';
            qryFornecedorISENTO.Value := '2';
            qryFornecedorADM.Value := 'N';
            qryFornecedorTRAN.Value := 'N';
            qryFornecedorCLI.Value := 'N';
            qryFornecedorFORN.Value := 'S';
            qryFornecedorFAB.Value := 'N';
            qryFornecedorFUN.Value := 'N';
            qryFornecedorDT_CADASTRO.Value := date;
            qryFornecedor.Post;
            dados.Conexao.CommitRetaining;
          end;

          idFornecedor := qryFornecedorCODIGO.Value;
          dados.qryFornecedor.Close;
          dados.qryFornecedor.Open;



          // pesquisa e cadastra compra

          qryCompra.Close;
          qryCompra.Params[0].Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.procNFe.chNFe;
          qryCompra.Open;

          if qryCompra.IsEmpty then
          begin
            qryCompra.Insert;
            qryCompraID.Value := dados.Numerador('COMPRA', 'ID', 'N', '', '');

            qryCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
            qryCompraFORNECEDOR.Value := idFornecedor;
            qryCompraSTATUS.Value := 'F';
            qryCompraDTENTRADA.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Ide.dEmi;
            qryCompraDTEMISSAO.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Ide.dEmi;
            qryCompraNR_NOTA.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Ide.nNF;
            qryCompraMODELO.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Ide.modelo;
            qryCompraSERIE.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Ide.serie;
            qryCompraCHAVE.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.procNFe.chNFe;
            qryCompraSUBTOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vProd;
            qryCompraFRETE.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vFrete;
            qryCompraSEGURO.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vSeg;
            qryCompraDESPESAS.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vOutro;
            qryCompraDESCONTO.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vDesc;
            qryCompraTOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vNF;
            qryCompraBASE_PIS.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vPIS;
            qryCompraBASE_COF.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vCOFINS;
            qryCompraBASE_IPI.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vIPI;
            qryCompraBASE_ICM.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vBC;
            qryCompraTOTAL_ICM.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vICMS;
            qryCompraBASE_ST.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vBCST;
            qryCompraTOTAL_ST.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vST;
            qryCompraTOTAL_IPI.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vIPI;
            qryCompraTOTAL_PIS.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vPIS;
            qryCompraTOTAL_COF.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Total.ICMSTot.vCOFINS;
            qryCompraXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
            qryCompraGERA_CP.Value := 'N';
            qryCompraGERA_ES.Value := 'N';
            qryCompraAJUSTA_PC.Value := 'N';
            qryCompraAJUSTA_PV.Value := 'N';
            qryCompraEHFISCAL.Value := 'S';
            qryCompraLEUXML.Value := 'S';
            qryCompra.Post;
            dados.Conexao.CommitRetaining;



            // cadastra produto

            dados.qryexecute.Close;
            dados.qryexecute.SQL.Text :=
              'delete from compra_itens where fk_compra=:id';
            dados.qryexecute.Params[0].Value := qryCompraID.Value;
            dados.qryexecute.ExecSQL;
            dados.Conexao.CommitRetaining;

            for n := 0 to ACBrNFe.NotasFiscais.Count - 1 do
            begin
              with ACBrNFe.NotasFiscais.Items[n].NFe do
              begin
                for i := 0 to Det.Count - 1 do
                begin

                  with Det.Items[i] do
                  begin

                    if (trim(prod.cEAN) <> '') and (prod.cEAN <> 'SEM GTIN')
                    then
                    begin
                      qryProdutos.Close;
                      qryProdutos.SQL.Text :=
                        ' select * from Produto where (descricao=:descricao) and (CODBARRA=:COD)';

                      qryProdutos.Params[0].Value :=
                        UpperCase(trim(copy(prod.xProd, 1, 100)));
                      qryProdutos.Params[1].Value := prod.cEAN;
                      qryProdutos.Open;
                    end
                    else
                    begin
                      qryProdutos.Close;
                      qryProdutos.SQL.Text :=
                        ' select * from Produto where (descricao=:descricao)';
                      qryProdutos.Params[0].Value :=
                        UpperCase(trim(copy(prod.xProd, 1, 100)));
                      qryProdutos.Open;
                    end;

                    if qryProdutos.IsEmpty then
                    begin
                      qryProdutos.Insert;
                      qryProdutosCODIGO.Value :=
                        dados.Numerador('PRODUTO', 'CODIGO', 'N', '', '');
                      qryProdutosATIVO.Value := 'S';
                      qryProdutosREMEDIO.Value := 'N';
                      qryProdutosGRADE.Value := 'N';
                      qryProdutosDT_CADASTRO.Value := date;
                      qryProdutosGRUPO.Value := 1;
                      qryProdutosUNIDADE.Value := prod.uCom;
                      qryProdutosAPLICACAO.Value := '';
                      qryProdutosPR_CUSTO2.Value := 0;
                      qryProdutosPERC_CUSTO.Value := 0;
                      qryProdutosDESCRICAO.Value :=
                        UpperCase(RemoveAcentos(prod.xProd));
                      qryProdutosPR_VENDA.Value := prod.vUnCom;
                      qryProdutosPR_CUSTO.Value := prod.vUnCom;
                      qryProdutosQTD_MIN.Value := 1;
                      qryProdutosESTOQUE_INICIAL.Value := 0;
                      qryProdutosE_MEDIO.Value := 0;
                      qryProdutosNCM.Value := prod.NCM;
                      qryProdutosCEST.Value := prod.CEST;

                      qryProdutosQTD_FISCAL.Value := 0;
                      qryProdutosICMS_DIFERIDO.Value := 0;
                      qryProdutosORIGEM.Value := 0;
                      qryProdutosCOMBUSTIVEL.Value := 'N';
                      qryProdutosIMPRIME_TICKET.Value := 'N';
                      qryProdutosCFOP_EXTERNO.AsString :=
                        dados.qryEmpresaCFOP_EXTERNO.Value;
                      qryProdutosCSOSN_EXTERNO.Value :=
                        dados.qryEmpresaCSOSN_EXTERNO.Value;
                      qryProdutosCST_EXTERNO.Value :=
                        dados.qryEmpresaCST_EXTERNO.Value;
                      qryProdutosALIQ_ICMS_EXTERNO.AsFloat :=
                        dados.qryEmpresaALIQ_ICMS_EXTERNO.AsFloat;
                      qryProdutosMVA_NORMAL.AsFloat := 0;

                      qryProdutosMARGEM.Value := 0;
                      qryProdutosQTD_ATUAL.Value := 0;
                      qryProdutosQTD_ATACADO.Value := 0;
                      qryProdutosPR_CUSTO_ANTERIOR.Value := 0;
                      qryProdutosPR_VENDA_ANTERIOR.Value := 0;
                      qryProdutosULT_COMPRA.Value := 0;
                      qryProdutosULT_COMPRA_ANTERIOR.Value := 0;
                      qryProdutosEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
                      qryProdutosPRECO_ATACADO.Value := 0;
                      qryProdutosCFOP.Value := dados.qryEmpresaCFOP.Value;
                      qryProdutosALIQ_ICM.Value :=
                        dados.qryEmpresaALIQ_ICMS.AsFloat;
                      qryProdutosPRECO_VARIAVEL.Value := 'N';
                      qryProdutosALIQ_PIS.Value :=
                        dados.qryEmpresaALIQ_PIS.AsFloat;
                      qryProdutosALIQ_COF.Value :=
                        dados.qryEmpresaALIQ_COF.AsFloat;
                      qryProdutosALIQ_IPI.Value :=
                        dados.qryEmpresaALIQ_IPI.AsFloat;
                      qryProdutosCSTICMS.Value :=
                        dados.qryEmpresaCST_ICMS.Value;
                      qryProdutosCSTE.Value :=
                        dados.qryEmpresaCST_ENTRADA.Value;
                      qryProdutosCSTS.Value := dados.qryEmpresaCST_SAIDA.Value;
                      qryProdutosCSTIPI.Value := dados.qryEmpresaCST_IPI.Value;
                      qryProdutosCSOSN.Value := dados.qryEmpresaCSOSN.Value;
                      qryProdutosCOMISSAO.Value := 0;
                      qryProdutosDESCONTO.Value := 0;
                      qryProdutosPAGA_COMISSAO.Value := 'N';
                      qryProdutosAPLICACAO.Value := '';
                      qryProdutosEFISCAL.Value := 'S';
                      qryProdutosDESCONTO.Value := 0;
                      qryProdutosPRECO_VARIAVEL.Value := 'N';
                      qryProdutosLOCALIZACAO.Value := '';
                      qryProdutosAPLICACAO.Value := '';
                      qryProdutosSERVICO.Value := 'N';
                      qryProdutosDESCONTO.Value := 0;
                      qryProdutosCOMPOSICAO.Value := 'N';
                      qryProdutosRESTAUTANTE.Value := 'N';
                      qryProdutosMVA.Value := 0;
                      qryProdutosREDUCAO_BASE.Value := 0;
                      qryProdutosFCP.Value := 0;
                      qryProdutosCODBARRA.Value := prod.cEAN;
                      qryProdutosTIPO.Value := '00-MERCADORIA PARA REVENDA';
                      qryProdutos.Post;
                      dados.Conexao.CommitRetaining;
                    end;

                    qryItensCompra.Close;
                    qryItensCompra.Open;

                    qryItensCompra.Insert;
                    qryItensCompraFK_COMPRA.Value := qryCompraID.Value;
                    qryItensCompraID.Value := dados.Numerador('COMPRA_ITENS',
                      'ID', 'N', '', '');

                    qryItensCompraEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
                    qryItensCompraITEM.Value := prod.nItem;
                    qryItensCompraFK_PRODUTO.Value := qryProdutosCODIGO.Value;
                    qryItensCompraQTD.Value := prod.qCom;
                    qryItensCompraVL_ITEM.Value := prod.vProd;
                    qryItensCompraVL_UNITARIO.Value := prod.vUnCom;
                    qryItensCompraFRETE1.Value := prod.vFrete;
                    qryItensCompraSEGURO.Value := prod.vSeg;
                    qryItensCompraDESPESA.Value := prod.vOutro;
                    qryItensCompraBLOQUEADO.Value := 'S';
                    qryItensCompraDESCONTO.Value := prod.vDesc;
                    qryItensCompraCST_ICM.Value := OrigToStr(Imposto.ICMS.orig)
                      + CSTICMSToStr(Imposto.ICMS.CST);
                    qryItensCompraBASE_ICMS.AsCurrency := Imposto.ICMS.vBC;
                    qryItensCompraVL_ICMS.AsCurrency := Imposto.ICMS.vICMS;
                    qryItensCompraALIQ_ICMS.AsCurrency := Imposto.ICMS.pICMS;
                    if crt = '1' then
                      qryItensCompraCST_ICM.Value := '041';

                    if (CSTICMSToStr(Imposto.ICMS.CST) = '00') and
                      (qryItensCompraVL_ICMS.Value = 0) then
                      qryItensCompraCST_ICM.Value := '041';

                    qryItensCompraCST_IPI.Value := CSTIPIToStr(Imposto.IPI.CST);
                    qryItensCompraBASE_IPI.AsCurrency := Imposto.IPI.vBC;
                    qryItensCompraVL_IPI.AsCurrency := Imposto.IPI.vIPI;
                    qryItensCompraALIQ_IPI.AsCurrency := Imposto.IPI.pIPI;

                    qryItensCompraCST_PIS.Value := CSTPISToStr(Imposto.PIS.CST);
                    qryItensCompraBASE_PIS.AsCurrency := Imposto.PIS.vBC;
                    qryItensCompraVL_PIS.AsCurrency := Imposto.PIS.vPIS;
                    qryItensCompraALIQ_PIS.AsCurrency := Imposto.PIS.pPIS;

                    qryItensCompraCST_COF.Value :=
                      CSTCOFINSToStr(Imposto.COFINS.CST);
                    qryItensCompraBASE_COF.AsCurrency := Imposto.COFINS.vBC;
                    qryItensCompraALIQ_COF.AsCurrency := Imposto.COFINS.pCOFINS;
                    qryItensCompraVL_COF.AsCurrency := Imposto.COFINS.vCOFINS;

                    qryItensCompraALIQ_ST.AsCurrency := Imposto.ICMS.pICMSST;
                    qryItensCompraBASE_ST.AsCurrency := Imposto.ICMS.vBCST;
                    qryItensCompraVL_ST.AsCurrency := Imposto.ICMS.vICMSST;
                    if qryFornecedorUF.Value = dados.qryEmpresaUF.Value then
                      qryItensCompraCFOP.Value := '1102'
                    else
                      qryItensCompraCFOP.Value := '2102';
                    qryItensCompra.Post;
                    dados.Conexao.CommitRetaining;

                  end;
                end;
              end;
            end;
            application.ProcessMessages;
          end;
        end;
      except
        on e: exception do
          ListBoxErro.Items.Add(memLista.Items.Strings[j] + '|' + e.Message)
      end;
      application.ProcessMessages;
    end;

    ShowMessage('ImportaÁ„o Finalizada!');
  finally
    Button1.Enabled := true;
  end;
end;

procedure TfrmImportaCompra.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmImportaCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f3 then
    btnImportar.Click;
  if Key = VK_ESCAPE then
    Close;
end;

end.
