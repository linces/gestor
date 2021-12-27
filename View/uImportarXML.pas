unit uImportarXML;

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
  TfrmImportaXML = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtNumero: TEdit;
    qryVenda: TFDQuery;
    qryItens: TFDQuery;
    OpenDialog1: TOpenDialog;
    ACBrNFe: TACBrNFe;
    qryVendaCODIGO: TIntegerField;
    qryVendaNUMERO: TIntegerField;
    qryVendaCHAVE: TStringField;
    qryVendaMODELO: TStringField;
    qryVendaSERIE: TStringField;
    qryVendaDATA_EMISSAO: TDateField;
    qryVendaDATA_SAIDA: TDateField;
    qryVendaHORA_EMISSAO: TTimeField;
    qryVendaHORA_SAIDA: TTimeField;
    qryVendaID_EMITENTE: TIntegerField;
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
    qryVendaBASEICMS: TFMTBCDField;
    qryVendaTOTALICMS: TFMTBCDField;
    qryVendaBASEICMSPIS: TFMTBCDField;
    qryVendaTOTALICMSPIS: TFMTBCDField;
    qryVendaBASEICMSCOF: TFMTBCDField;
    qryVendaTOTALICMSCOFINS: TFMTBCDField;
    qryVendaBASEISS: TFMTBCDField;
    qryVendaTOTALISS: TFMTBCDField;
    qryVendaOBSERVACOES: TMemoField;
    qryVendaSITUACAO: TStringField;
    qryVendaEMAIL: TStringField;
    qryVendaXML: TMemoField;
    qryVendaPROTOCOLO: TStringField;
    qryVendaMOTIVOCANCELAMENTO: TStringField;
    qryVendaTRIB_MUN: TFMTBCDField;
    qryVendaTRIB_EST: TFMTBCDField;
    qryVendaTRIB_FED: TFMTBCDField;
    qryVendaTRIB_IMP: TFMTBCDField;
    qryVendaFLAG: TStringField;
    qryVendaABERTO: TStringField;
    qryVendaFKEMPRESA: TIntegerField;
    qryVendaFK_VENDA: TIntegerField;
    qryVendaTOTAL: TFMTBCDField;
    qryVendaOUTROS: TFMTBCDField;
    qryItensCODIGO: TIntegerField;
    qryItensFKVENDA: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensITEM: TSmallintField;
    qryItensCOD_BARRA: TStringField;
    qryItensNCM: TStringField;
    qryItensCFOP: TStringField;
    qryItensCST: TStringField;
    qryItensCSOSN: TStringField;
    qryItensTIPO: TStringField;
    qryItensQTD: TFMTBCDField;
    qryItensE_MEDIO: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensVALOR_ITEM: TFMTBCDField;
    qryItensVDESCONTO: TFMTBCDField;
    qryItensBASE_ICMS: TFMTBCDField;
    qryItensALIQ_ICMS: TFMTBCDField;
    qryItensVALOR_ICMS: TFMTBCDField;
    qryItensP_REDUCAO_ICMS: TFMTBCDField;
    qryItensCST_COFINS: TStringField;
    qryItensBASE_COFINS_ICMS: TFMTBCDField;
    qryItensALIQ_COFINS_ICMS: TFMTBCDField;
    qryItensVALOR_COFINS_ICMS: TFMTBCDField;
    qryItensCST_PIS: TStringField;
    qryItensBASE_PIS_ICMS: TFMTBCDField;
    qryItensALIQ_PIS_ICMS: TFMTBCDField;
    qryItensVALOR_PIS_ICMS: TFMTBCDField;
    qryItensBASE_ISS: TFMTBCDField;
    qryItensALIQ_ISS: TFMTBCDField;
    qryItensVALOR_ISS: TFMTBCDField;
    qryItensCMUNFG: TIntegerField;
    qryItensCLISTASERV: TIntegerField;
    qryItensTRIB_MUN: TFMTBCDField;
    qryItensTRIB_EST: TFMTBCDField;
    qryItensTRIB_FED: TFMTBCDField;
    qryItensTRIB_IMP: TFMTBCDField;
    qryItensSITUACAO: TStringField;
    qryItensFLAG: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensTOTAL: TFMTBCDField;
    qryItensOUTROS: TFMTBCDField;
    Panel2: TPanel;
    Button1: TButton;
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
    btnImportar: TSpeedButton;
    btnTodos: TSpeedButton;
    qryItensCEST: TStringField;
    qryItensBLOQUEADO: TStringField;
    qryProdutosCFOP_EXTERNO: TIntegerField;
    qryProdutosGLP: TFMTBCDField;
    qryProdutosGNN: TFMTBCDField;
    qryProdutosGNI: TFMTBCDField;
    qryProdutosCOMBUSTIVEL: TStringField;
    qryProdutosCSOSN_EXTERNO: TStringField;
    qryProdutosCST_EXTERNO: TStringField;
    qryProdutosALIQ_ICMS_EXTERNO: TFMTBCDField;
    qryProdutosORIGEM: TIntegerField;
    qryProdutosQTD_FISCAL: TFMTBCDField;
    qryProdutosMVA_NORMAL: TFMTBCDField;
    qryProdutosIMPRIME_TICKET: TStringField;
    qryProdutosICMS_DIFERIDO: TFMTBCDField;
    qryCliente: TFDQuery;
    qryClienteEMPRESA: TSmallintField;
    qryClienteCODIGO: TIntegerField;
    qryClienteTIPO: TStringField;
    qryClienteCNPJ: TStringField;
    qryClienteIE: TStringField;
    qryClienteFANTASIA: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteNUMERO: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteCODMUN: TIntegerField;
    qryClienteMUNICIPIO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteUF: TStringField;
    qryClienteCEP: TStringField;
    qryClienteFONE1: TStringField;
    qryClienteFONE2: TStringField;
    qryClienteCELULAR1: TStringField;
    qryClienteCELULAR2: TStringField;
    qryClienteEMAIL1: TStringField;
    qryClienteEMAIL2: TStringField;
    qryClienteFOTO: TBlobField;
    qryClienteSEXO: TStringField;
    qryClienteDT_NASC: TDateField;
    qryClienteECIVIL: TStringField;
    qryClienteLIMITE: TFMTBCDField;
    qryClienteDIA_PGTO: TSmallintField;
    qryClienteOBS: TMemoField;
    qryClienteNUM_USU: TSmallintField;
    qryClienteFATURA: TStringField;
    qryClienteCHEQUE: TStringField;
    qryClienteCCF: TStringField;
    qryClienteSPC: TStringField;
    qryClienteISENTO: TStringField;
    qryClienteFORN: TStringField;
    qryClienteFUN: TStringField;
    qryClienteCLI: TStringField;
    qryClienteFAB: TStringField;
    qryClienteTRAN: TStringField;
    qryClienteADM: TStringField;
    qryClienteATIVO: TStringField;
    qryClienteDT_ADMISSAO: TDateField;
    qryClienteDT_DEMISSAO: TDateField;
    qryClienteSALARIO: TFMTBCDField;
    qryClientePAI: TStringField;
    qryClienteMAE: TStringField;
    qryClienteBANCO: TStringField;
    qryClienteAGENCIA: TStringField;
    qryClienteGERENTE: TStringField;
    qryClienteFONE_GERENTE: TStringField;
    qryClientePROPRIEDADE: TStringField;
    qryClienteDT_CADASTRO: TDateField;
    qryClienteTECNICO: TStringField;
    qryClienteATENDENTE: TStringField;
    qryClienteCODIGO_WEB: TIntegerField;
    qryClienteREFERENCIA: TIntegerField;
    qryClienteFLAG: TStringField;
    qryClienteRAZAO: TStringField;
    qryClienteTIPO_RECEBIMENTO: TStringField;
    qryClientePARC: TStringField;
    qryClienteREGIME_TRIBUTARIO: TStringField;
    qryClienteWHATSAPP: TStringField;
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
    procedure btnTodosClick(Sender: TObject);
  private
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaXML: TfrmImportaXML;

implementation

{$R *.dfm}

uses uPDV, Udados, uNFe, uCadDevolucao;

Function RemoveAcentos(Str: String): String;
{ Remove caracteres acentuados de uma string }
Const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'AAEOUAOAEIOU«UAAEOUAOAEIOU«U';
Var
  x: Integer;
Begin
  For x := 1 to Length(Str) do
  Begin
    if Pos(Str[x], ComAcento) <> 0 Then
    begin
      Str[x] := SemAcento[Pos(Str[x], ComAcento)];
    end;
  end;
  Result := Str;
end;

function TfrmImportaXML.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmImportaXML.ListarArquivos(Diretorio: string; Sub: Boolean);
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

procedure TfrmImportaXML.memListaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
    memLista.DeleteSelected;

end;

procedure TfrmImportaXML.btnImportarClick(Sender: TObject);
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
      Length(ExtractFilePath(OpenDialog1.FileName)) - 1);
    memLista.Items.Add(ExtractFileName(OpenDialog1.FileName));
  end
  else
  begin
    ShowMessage('Arquivo inv·lido!');
    exit;
  end;

end;

procedure TfrmImportaXML.btnTodosClick(Sender: TObject);
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
      Length(ExtractFilePath(OpenDialog1.FileName)) - 1)
  else
  begin
    ShowMessage('Arquivo inv·lido!');
    exit;
  end;

  ListarArquivos(edtNumero.Text, false);

end;

procedure TfrmImportaXML.Button1Click(Sender: TObject);
var
  CNPJ_CPF, CNPJ_CPF_MASCARA, Tipo, crt: string;
  idCliente, n, i, j: Integer;
begin
  try
    Button1.Enabled := false;
    for j := 0 to memLista.Items.Count - 1 do
    begin
      try
        ACBrNFe.NotasFiscais.Clear;
        ACBrNFe.NotasFiscais.LoadFromFile(edtNumero.Text + '\' +
          memLista.Items.Strings[j]);
        memLista.ItemIndex := j;
        if ACBrNFe.NotasFiscais.Items[0].NFe.Ide.modelo = 65 then // se for nfce
        begin

          CNPJ_CPF := ACBrNFe.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
          // formata CNPJ

          if Length(CNPJ_CPF) = 11 then
          begin
            CNPJ_CPF_MASCARA := copy(CNPJ_CPF, 1, 3) + '.' +
              copy(CNPJ_CPF, 4, 3) + '.' + copy(CNPJ_CPF, 7, 3) + '-' +
              copy(CNPJ_CPF, 10, 2);
            Tipo := 'FÕSICA';
          end;
          if Length(ACBrNFe.NotasFiscais.Items[0].NFe.Dest.CNPJCPF) = 14 then
          begin
            CNPJ_CPF_MASCARA := copy(CNPJ_CPF, 1, 2) + '.' +
              copy(CNPJ_CPF, 3, 3) + '.' + copy(CNPJ_CPF, 6, 3) + '/' +
              copy(CNPJ_CPF, 9, 4) + '-' + copy(CNPJ_CPF, 13, 2);
            Tipo := 'JURÕDICA';
          end;

          // consulta fornecedor

          qryCliente.Close;
          qryCliente.Params[0].AsString := CNPJ_CPF_MASCARA;
          qryCliente.Open;

          if qryCliente.IsEmpty then
          begin // cadastra fornecedor sen„o existir
            qryCliente.Insert;
            qryClienteEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
            qryClienteCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO',
              'N', '', '');
            qryClienteRAZAO.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.xNome));
            qryClienteFANTASIA.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.xNome));
            qryClienteENDERECO.Value :=
              UpperCase(RemoveAcentos(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.xLgr));
            qryClienteNUMERO.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.nro;
            qryClienteBAIRRO.Value :=
              UpperCase(ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.xBairro);
            qryClienteMUNICIPIO.Value :=
              UpperCase(ACBrNFe.NotasFiscais.Items[0].NFe.Dest.EnderDest.xMun);
            qryClienteCODMUN.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.cMun;
            qryClienteUF.Value :=
              UpperCase(ACBrNFe.NotasFiscais.Items[0].NFe.Dest.EnderDest.UF);
            qryClienteCEP.AsInteger := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.CEP;
            qryClienteFONE1.Value := ACBrNFe.NotasFiscais.Items[0]
              .NFe.Dest.EnderDest.fone;
            qryClienteCNPJ.Value := CNPJ_CPF_MASCARA;
            qryClienteTIPO.Value := Tipo;
            qryClienteIE.Value := ACBrNFe.NotasFiscais.Items[0].NFe.Dest.IE;
            qryClienteATIVO.Value := 'S';
            qryClienteLIMITE.Value := 0;
            qryClienteFATURA.Value := 'N';
            qryClienteCHEQUE.Value := 'N';
            qryClienteCCF.Value := 'N';
            qryClienteSPC.Value := 'N';
            qryClienteREGIME_TRIBUTARIO.Value := 'SIMPLES';
            if Tipo = 'FÕSICA' then
              qryClienteISENTO.Value := '2'
            else
              qryClienteISENTO.Value := '0';
            qryClienteADM.Value := 'N';
            qryClienteTRAN.Value := 'N';
            qryClienteCLI.Value := 'S';
            qryClienteFORN.Value := 'N';
            qryClienteFAB.Value := 'N';
            qryClienteFUN.Value := 'N';
            qryClienteDT_CADASTRO.Value := date;
            qryCliente.Post;
            dados.Conexao.CommitRetaining;
          end;

          idCliente := qryClienteCODIGO.Value;

          dados.qryPessoas.Close;
          dados.qryPessoas.Open;

          qryVenda.Close;
          qryVenda.Params[0].Value :=
            copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
          qryVenda.Open;

          if qryVenda.IsEmpty then
          begin
            qryVenda.Insert;
            qryVendaCODIGO.Value := dados.Numerador('NFCE_MASTER', 'CODIGO',
              'N', '', '');
          end
          else
            qryVenda.edit;

          qryItens.Close;
          qryItens.Params[0].Value := qryVendaCODIGO.Value;
          qryItens.Open;

          qryVendaSITUACAO.Value := 'T';

          qryVendaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
          qryVendaFK_CAIXA.Value := 1;
          qryVendaFK_USUARIO.Value := 1;
          qryVendaFK_VENDEDOR.Value := 1;
          qryVendaID_EMITENTE.Value := 1;
          qryVendaID_CLIENTE.Value := idCliente;
          qryVendaABERTO.Value := 'N';
          qryVendaFLAG.Value := 'N';
          qryVendaDATA_EMISSAO.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.dEmi;
          qryVendaDATA_SAIDA.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.dEmi;
          qryVendaHORA_EMISSAO.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.hSaiEnt;
          qryVendaHORA_SAIDA.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.hSaiEnt;
          qryVendaNUMERO.AsInteger := ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF;
          qryVendaMODELO.AsInteger := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.modelo;
          qryVendaSERIE.AsInteger := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Ide.serie;
          qryVendaCHAVE.Value :=
            copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 44);
          qryVendaPROTOCOLO.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.procNFe.nProt;
          qryVendaSUBTOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vProd;
          qryVendaDESCONTO.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vDesc;
          qryVendaTOTAL.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vNF;
          qryVendaTOTALICMSPIS.Value := 0;
          qryVendaTOTALICMSCOFINS.Value := 0;
          qryVendaBASEICMS.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vBC;
          qryVendaTOTALICMS.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vICMS;
          qryVendaTOTALICMSPIS.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vPIS;
          qryVendaTOTALICMSCOFINS.Value := ACBrNFe.NotasFiscais.Items[0]
            .NFe.Total.ICMSTot.vCOFINS;
          qryVendaXML.Value := ACBrNFe.NotasFiscais.Items[0].XML;
          qryVenda.Post;
          dados.Conexao.CommitRetaining;

          qryItens.First;
          while not qryItens.IsEmpty do
            qryItens.Delete;
          dados.Conexao.CommitRetaining;
          // importa itens do xml

          for n := 0 to ACBrNFe.NotasFiscais.Count - 1 do
          begin
            with ACBrNFe.NotasFiscais.Items[n].NFe do
            begin
              for i := 0 to Det.Count - 1 do
              begin
                with Det.Items[i] do
                begin

                  if (trim(prod.cEAN) <> '') and (prod.cEAN <> 'SEM GTIN') then
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
                    qryProdutosCSTICMS.Value := dados.qryEmpresaCST_ICMS.Value;
                    qryProdutosCSTE.Value := dados.qryEmpresaCST_ENTRADA.Value;
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

                  qryItens.Insert;

                  qryItensFKVENDA.Value := qryVendaCODIGO.Value;
                  qryItensCODIGO.Value := dados.Numerador('NFCE_DETALHE',
                    'CODIGO', 'N', '', '');

                  qryItensID_PRODUTO.Value := qryProdutosCODIGO.Value;
                  qryItensITEM.Value := i + 1;
                  qryItensNCM.Value := prod.NCM;
                  qryItensCFOP.Value := prod.CFOP;
                  qryItensPRECO.Value := prod.vUnCom;
                  qryItensUNIDADE.Value := prod.uCom;
                  qryItensQTD.Value := prod.qCom;
                  qryItensVALOR_ITEM.Value := prod.vProd;
                  qryItensCOD_BARRA.Value := prod.cEAN;
                  qryItensVDESCONTO.Value := prod.vDesc;
                  qryItensBLOQUEADO.Value := 'S';
                  qryItensCST.Value := OrigToStr(Imposto.ICMS.orig) +
                    CSTICMSToStr(Imposto.ICMS.CST);

                  qryItensBASE_ICMS.AsCurrency := Imposto.ICMS.vBC;
                  qryItensVALOR_ICMS.AsCurrency := Imposto.ICMS.vICMS;
                  qryItensALIQ_ICMS.AsCurrency := Imposto.ICMS.pICMS;

                  qryItensCST_PIS.Value := CSTPISToStr(Imposto.PIS.CST);
                  qryItensBASE_PIS_ICMS.AsCurrency := Imposto.PIS.vBC;
                  qryItensVALOR_PIS_ICMS.AsCurrency := Imposto.PIS.vPIS;
                  qryItensALIQ_PIS_ICMS.AsCurrency := Imposto.PIS.pPIS;

                  qryItensCST_COFINS.Value :=
                    CSTCOFINSToStr(Imposto.COFINS.CST);
                  qryItensBASE_COFINS_ICMS.AsCurrency := Imposto.COFINS.vBC;
                  qryItensALIQ_COFINS_ICMS.AsCurrency := Imposto.COFINS.pCOFINS;
                  qryItensVALOR_COFINS_ICMS.AsCurrency :=
                    Imposto.COFINS.vCOFINS;
                end;
                qryItens.Post;
                dados.Conexao.CommitRetaining;
              end;
            end;
          end;
          application.ProcessMessages;
        end;
      except
        on e: exception do
          ListBoxErro.Items.Add(memLista.Items.Strings[j] + '|' + e.Message)
      end;
      application.ProcessMessages;
    end;
  finally
    Button1.Enabled := true;
  end;
  ShowMessage('NFC-e Importado com sucesso!');
end;

procedure TfrmImportaXML.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmImportaXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f3 then
    btnImportar.Click;
  if Key = VK_ESCAPE then
    Close;
end;

end.
