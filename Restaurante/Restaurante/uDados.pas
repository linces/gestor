unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, vcl.forms,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, Data.DB, Inifiles,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Winapi.Windows;

type
  TDados = class(TDataModule)
    Transacao: TFDTransaction;
    FBDriver: TFDPhysFBDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    Conexao: TFDConnection;
    qryMesas: TFDQuery;
    qryEmpresas: TFDQuery;
    qryEmpresasCODIGO: TIntegerField;
    qryEmpresasFANTASIA: TStringField;
    qryEmpresasRAZAO: TStringField;
    qryEmpresasTIPO: TStringField;
    qryEmpresasCNPJ: TStringField;
    qryEmpresasIE: TStringField;
    qryEmpresasIM: TStringField;
    qryEmpresasENDERECO: TStringField;
    qryEmpresasNUMERO: TStringField;
    qryEmpresasCOMPLEMENTO: TStringField;
    qryEmpresasBAIRRO: TStringField;
    qryEmpresasCIDADE: TStringField;
    qryEmpresasUF: TStringField;
    qryEmpresasCEP: TStringField;
    qryEmpresasFONE: TStringField;
    qryEmpresasFAX: TStringField;
    qryEmpresasSITE: TStringField;
    qryEmpresasLOGOMARCA: TBlobField;
    qryEmpresasFUNDACAO: TDateField;
    qryEmpresasUSU_CAD: TSmallintField;
    qryEmpresasUSU_ATU: TSmallintField;
    qryEmpresasNSERIE: TStringField;
    qryEmpresasCSENHA: TStringField;
    qryEmpresasNTERM: TStringField;
    qryEmpresasID_PLANO_TRANSFERENCIA_C: TIntegerField;
    qryEmpresasID_PLANO_TRANSFERENCIA_D: TIntegerField;
    qryEmpresasID_CAIXA_GERAL: TIntegerField;
    qryEmpresasBLOQUEAR_ESTOQUE_NEGATIVO: TStringField;
    qryEmpresasID_CIDADE: TIntegerField;
    qryEmpresasCRT: TSmallintField;
    qryEmpresasID_UF: TSmallintField;
    qryEmpresasID_PLANO_VENDA: TIntegerField;
    qryEmpresasOBSFISCO: TMemoField;
    qryEmpresasCFOP: TStringField;
    qryEmpresasCSOSN: TStringField;
    qryEmpresasCST_ICMS: TStringField;
    qryEmpresasALIQ_ICMS: TFMTBCDField;
    qryEmpresasCST_ENTRADA: TStringField;
    qryEmpresasCST_SAIDA: TStringField;
    qryEmpresasALIQ_PIS: TFMTBCDField;
    qryEmpresasALIQ_COF: TFMTBCDField;
    qryEmpresasCST_IPI: TStringField;
    qryEmpresasALIQ_IPI: TFMTBCDField;
    qryEmpresasIMP_F5: TStringField;
    qryEmpresasIMP_F6: TStringField;
    qryEmpresasMOSTRA_RESUMO_CAIXA: TStringField;
    qryEmpresasLIMITE_DIARIO: TFMTBCDField;
    qryEmpresasPRAZO_MAXIMO: TSmallintField;
    qryEmpresasID_PLA_CONTA_FICHA_CLI: TIntegerField;
    qryEmpresasID_PLANO_CONTA_RETIRADA: TIntegerField;
    qryEmpresasUSA_PDV: TStringField;
    qryEmpresasRECIBO_VIAS: TStringField;
    qryEmpresasID_PLANO_TAXA_CARTAO: TIntegerField;
    qryEmpresasOBS_CARNE: TMemoField;
    qryEmpresasCAIXA_UNICO: TStringField;
    qryEmpresasCAIXA_RAPIDO: TStringField;
    qryEmpresasEMPRESA_PADRAO: TSmallintField;
    qryEmpresasID_PLANO_CONTA_DEVOLUCAO: TIntegerField;
    qryEmpresasN_INICIAL_NFCE: TIntegerField;
    qryEmpresasN_INICIAL_NFE: TIntegerField;
    qryEmpresasCHECA_ESTOQUE_FISCAL: TStringField;
    qryEmpresasDESCONTO_PROD_PROMO: TStringField;
    qryEmpresasDATA_CADASTRO: TStringField;
    qryEmpresasDATA_VALIDADE: TStringField;
    qryEmpresasFLAG: TStringField;
    qryEmpresasLANCAR_CARTAO_CREDITO: TStringField;
    qryEmpresasFILTRAR_EMPRESA_LOGIN: TStringField;
    qryEmpresasENVIAR_EMAIL_NFE: TStringField;
    qryEmpresasTRANSPORTADORA: TStringField;
    qryEmpresasTABELA_PRECO: TStringField;
    qryEmpresasTAXA_VENDA_PRAZO: TFMTBCDField;
    qryEmpresasEMAIL_CONTADOR: TStringField;
    qryEmpresasAUTOPECAS: TStringField;
    qryEmpresasATUALIZA_PR_VENDA: TStringField;
    qryEmpresasINFORMAR_GTIN: TStringField;
    qryEmpresasRECOLHE_FCP: TStringField;
    qryEmpresasDIFAL_ORIGEM: TFMTBCDField;
    qryEmpresasDIFAL_DESTINO: TFMTBCDField;
    qryEmpresasEXCLUI_PDV: TStringField;
    qryEmpresasVENDA_SEMENTE: TStringField;
    qryEmpresasCHECA: TStringField;
    qryEmpresasEMAIL: TStringField;
    qryEmpresasULTIMONSU: TStringField;
    qryEmpresasULTIMO_PEDIDO: TIntegerField;
    qryEmpresasTIPO_CONTRATO: TIntegerField;
    qryEmpresasTIPO_EMPRESA: TIntegerField;
    qryEmpresasQTD_MESAS: TSmallintField;
    qryEmpresasBLOQUEAR_PRECO: TStringField;
    qryEmpresasEXIBE_RESUMO_CAIXA: TStringField;
    qryEmpresasID_PLANO_COMPRA: TIntegerField;
    qryEmpresasRESPONSAVEL_TECNICO: TStringField;
    qryEmpresasCARENCIA_JUROS: TIntegerField;
    qryEmpresasPESQUISA_REFERENCIA: TStringField;
    qryEmpresasRESTAURANTE: TStringField;
    qryEmpresasEXIBE_F3: TStringField;
    qryEmpresasEXIBE_F4: TStringField;
    qryEmpresasLER_PESO: TStringField;
    qryEmpresasCHECA_LIMITE: TStringField;
    qryEmpresasEMITE_ECF: TStringField;
    qryEmpresasLOJA_ROUPA: TStringField;
    qryEmpresasTIPO_JUROS: TStringField;
    qryEmpresasJUROS_DIA: TFMTBCDField;
    qryEmpresasJUROS_MES: TFMTBCDField;
    qryEmpresasFARMACIA: TStringField;
    qryEmpresasDESCONTO_MAXIMO: TFMTBCDField;
    qryEmpresasHABILITA_DESCONTO_PDV: TStringField;
    qryEmpresasPAGAMENTO_DINHEIRO: TStringField;
    qryEmpresasRESPONSAVEL_EMPRESA: TStringField;
    qryEmpresasPUXA_CFOP_PRODUTO: TStringField;
    qryEmpresasLANCAR_CARTAO_CR: TStringField;
    qryEmpresasUSA_BLUETOOTH_RESTA: TStringField;
    qryComandas_master: TFDQuery;
    qryComanda_Itens: TFDQuery;
    qryNumerador: TFDQuery;
    qryProdutos: TFDQuery;
    qryConsulta: TFDQuery;
    qryTerminal: TFDQuery;
    qryTerminalIP: TStringField;
    qryTerminalNOME: TStringField;
    qryTerminalIMPRIME: TStringField;
    qryTerminalUSAGAVETA: TStringField;
    qryTerminalFABIMPRESSORA: TStringField;
    qryTerminalMODELO: TStringField;
    qryTerminalPORTA: TStringField;
    qryTerminalCONTINGENCIA: TStringField;
    qryTerminalNVIAS: TSmallintField;
    qryTerminalTIPOIMPRESSORA: TStringField;
    qryTerminalSERIE: TStringField;
    qryTerminalNUMERACAO_INICIAL: TIntegerField;
    qryTerminalEMPRESA: TIntegerField;
    qryTerminalVELOCIDADE: TIntegerField;
    qryTerminalIMPRIME_FECHAMENTO: TStringField;
    qryTerminalLOGADO: TStringField;
    qryTerminalEH_CAIXA: TStringField;
    qryTerminalVERSAO: TSmallintField;
    qryTerminalTIPO_BROWSER: TStringField;
    qryTerminalBALANCA_PORTA: TStringField;
    qryTerminalBALANCA_MARCA: TStringField;
    qryTerminalBALANCA_PARIDADE: TStringField;
    qryTerminalBALANCA_STOPBITS: TStringField;
    qryTerminalBALANCA_HANDSHAKING: TStringField;
    qryTerminalBALANCA_VELOCIDADE: TStringField;
    qryTerminalBALANCA_DATABITS: TStringField;
    qryTerminalDATA_VERSAO: TSQLTimeStampField;
    qryTerminalDESTINO_IMPRESSAO: TStringField;
    qryTerminalDT_VERSAO: TStringField;
    qryComanda_Pessoa: TFDQuery;
    qryComanda_Rateio: TFDQuery;
    qryMesasCODIGO: TIntegerField;
    qryMesasNOME: TStringField;
    qryMesasQTD: TIntegerField;
    qryMesasDATA: TSQLTimeStampField;
    qryMesasSITUACAO: TStringField;
    qryComandas_masterCODIGO: TIntegerField;
    qryComandas_masterFK_MESA: TIntegerField;
    qryComandas_masterTOTAL: TFMTBCDField;
    qryComandas_masterSITUACAO: TStringField;
    qryComanda_PessoaCODIGO: TIntegerField;
    qryComanda_PessoaFK_COMANDA: TIntegerField;
    qryComanda_PessoaNOME: TStringField;
    qryComanda_PessoaSITUACAO: TStringField;
    qryComanda_ItensTTOTAL: TAggregateField;
    qrySomaItens: TFDQuery;
    qrySomaItensTOTAL: TFMTBCDField;
    qryComanda_ItensCODIGO: TIntegerField;
    qryComanda_ItensFK_COMANDA_PESSOA: TIntegerField;
    qryComanda_ItensFK_PRODUTO: TIntegerField;
    qryComanda_ItensQTD: TFMTBCDField;
    qryComanda_ItensPRECO: TFMTBCDField;
    qryComanda_ItensTOTAL: TFMTBCDField;
    qryComanda_ItensPERCENTUAL: TFMTBCDField;
    qryComanda_ItensSITUACAO: TStringField;
    qryComanda_ItensVIRTUAL_PRODUTO: TStringField;
    qryMesasFK_MOVIMENTO: TIntegerField;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosCOMPLEMENTO: TStringField;
    qryProdutosTEMPO_ESPERA: TIntegerField;
    qryProdutosFOTO: TBlobField;
    qryProdutosPR_VENDA: TFMTBCDField;
    qryComanda_PessoaTOTAL: TFMTBCDField;
    qrySomaPessoa: TFDQuery;
    qrySomaPessoaTOTAL: TFMTBCDField;
    qryBuscaPessoa: TFDQuery;
    qryBuscaPessoaNOME: TStringField;
    qryComanda_PessoaTOTAL_RATEIO: TFMTBCDField;
    qryComanda_RateioCODIGO: TIntegerField;
    qryComanda_RateioFK_COMANDA_PESSOA: TIntegerField;
    qryComanda_RateioFK_COMANDA: TIntegerField;
    qryComanda_RateioFK_PRODUTO: TIntegerField;
    qryComanda_RateioPERCENTUAL: TFMTBCDField;
    qryComanda_RateioQTD: TFMTBCDField;
    qryComanda_RateioTOTAL: TFMTBCDField;
    qryComanda_ItensDATA_HORA: TSQLTimeStampField;
    qryComanda_RateioPRECO: TFMTBCDField;
    qryComanda_PessoaPDV: TStringField;
    qryComandas_masterDATA_HORA: TSQLTimeStampField;
    qryComanda_PessoaTRATEIO: TAggregateField;
    qryComanda_PessoaPERCENTUAL: TFMTBCDField;
    qryComanda_PessoaIMPRIMIU: TStringField;
    qryCidade: TFDQuery;
    qryCidadeCODIGO: TIntegerField;
    qryCidadeDESCRICAO: TStringField;
    qryCidadeCODUF: TIntegerField;
    qryCidadeUF: TStringField;
    qryTerminalESC_POS_DIRETO: TStringField;
    qryTerminalPAGINA_CODIGO: TStringField;
    qryTerminalFLAG: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryComanda_PessoaNewRecord(DataSet: TDataSet);
    procedure qryComanda_PessoaBeforePost(DataSet: TDataSet);
    procedure qryComanda_ItensBeforeDelete(DataSet: TDataSet);
    procedure qryComanda_PessoaBeforeDelete(DataSet: TDataSet);
    procedure qryEmpresasNewRecord(DataSet: TDataSet);
  private
    function Spaces(C: integer): String;
    { Private declarations }
  public
    function Getcomputer: String;
    function Alinha(Texto: String; Total: integer; Lado: Boolean): String;
    function Numerador(Tabela, Campo: String): integer;
    procedure GravarTotalComanda;
    procedure RatearComanda(Id: integer);
    function Crypt(Action, Src: String): String;
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TDados.Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: integer;
  KeyPos: integer;
  OffSet: integer;
  Dest, Key: String;
  SrcPos: integer;
  SrcAsc: integer;
  TmpSrcAsc: integer;
  Range: integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;
  Key := 'XNGREXCAPHJKQWERTYUIOP98765LKJHASFGMNBVCAXZ13450';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 128;
  if (Action = UpperCase('C')) then
  begin
    // Randomize;
    OffSet := Range;
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;

function TDados.Getcomputer: String;
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function TDados.Numerador(Tabela, Campo: String): integer;
begin
  Result := 0;
  qryNumerador.Close;
  qryNumerador.sql.Text := 'SELECT MAX(' + Campo + ')MAIOR FROM ' + Tabela;
  qryNumerador.Open;
  Result := qryNumerador.Fields[0].AsInteger + 1;
end;

procedure TDados.qryComanda_ItensBeforeDelete(DataSet: TDataSet);
begin

  Dados.Conexao.CommitRetaining;
  Dados.qryComanda_Itens.Refresh;
  Dados.GravarTotalComanda;
end;

procedure TDados.qryComanda_PessoaBeforeDelete(DataSet: TDataSet);
begin
  if not Dados.qryComanda_Itens.IsEmpty then
    raise Exception.Create
      ('N�o � possivel apagar comanda. Existem pedidos cadastrados para esta comanda!');

end;

procedure TDados.RatearComanda(Id: integer);
begin
  Dados.qryComanda_Pessoa.Close;
  Dados.qryComanda_Pessoa.Params[0].Value := Id;
  Dados.qryComanda_Pessoa.Open;
  Dados.qryComanda_Pessoa.First;
  while not Dados.qryComanda_Pessoa.eof do
  begin
    Dados.qryComanda_Pessoa.edit;
    Dados.qryComanda_PessoaPERCENTUAL.AsFloat :=
      (Dados.qryComanda_PessoaTOTAL_RATEIO.AsFloat /
      Dados.qryComandas_masterTOTAL.AsFloat) * 100;
    Dados.qryComanda_Pessoa.Post;
    Dados.Conexao.CommitRetaining;
    Dados.qryComanda_Pessoa.Next;
  end;

end;

procedure TDados.qryComanda_PessoaBeforePost(DataSet: TDataSet);
begin
  qryBuscaPessoa.Close;
  qryBuscaPessoa.Params[0].Value := qryComanda_PessoaNOME.Value;
  qryBuscaPessoa.Params[1].Value := qryComanda_PessoaCODIGO.Value;
  qryBuscaPessoa.Params[2].Value := qryComanda_PessoaFK_COMANDA.Value;
  qryBuscaPessoa.Open;

  if not qryBuscaPessoa.IsEmpty then
    raise Exception.Create('Ja existe comanda com este nome!');
end;

procedure TDados.qryComanda_PessoaNewRecord(DataSet: TDataSet);
begin
  Dados.qryComanda_PessoaCODIGO.Value := Dados.Numerador('Comanda_Pessoa',
    'Codigo');
  Dados.qryComanda_PessoaFK_COMANDA.Value :=
    Dados.qryComandas_masterCODIGO.Value;
  Dados.qryComanda_PessoaPERCENTUAL.Value := 100;
  Dados.qryComanda_PessoaTOTAL_RATEIO.Value := 0;
  Dados.qryComanda_PessoaTOTAL.Value := 0;
  Dados.qryComanda_PessoaSITUACAO.Value := 'A';
  Dados.qryComanda_PessoaPDV.Value := 'N';
  Dados.qryComanda_PessoaIMPRIMIU.Value := 'N';
end;

procedure TDados.qryEmpresasNewRecord(DataSet: TDataSet);
begin
  qryEmpresasNSERIE.Value := '';
  qryEmpresasCSENHA.Value := '';
  qryEmpresasDATA_CADASTRO.AsString := DateToStr(date);
  qryEmpresasDATA_VALIDADE.AsString := DateToStr(date);
  qryEmpresasCHECA.AsString := 'S';
  qryEmpresasFUNDACAO.Value := NOW;
  qryEmpresasUSU_CAD.Value := 0;
  qryEmpresasUSU_ATU.Value := 0;
  qryEmpresasID_PLANO_TRANSFERENCIA_C.Value := 3;
  qryEmpresasID_PLANO_TRANSFERENCIA_D.Value := 4;
  qryEmpresasID_CAIXA_GERAL.Value := 1;
  qryEmpresasBLOQUEAR_ESTOQUE_NEGATIVO.Value := 'S';
  qryEmpresasIE.Value := '';
  qryEmpresasRESPONSAVEL_TECNICO.Value := 'S';
  qryEmpresasEXIBE_F3.Value := 'S';
  qryEmpresasEXIBE_F4.Value := 'S';
  qryEmpresasIMP_F5.Value := 'N';
  qryEmpresasIMP_F6.Value := 'N';
  qryEmpresasDIFAL_ORIGEM.Value := 0;
  qryEmpresasDIFAL_DESTINO.Value := 100;
  qryEmpresasRECIBO_VIAS.Value := 'S';
  qryEmpresasCRT.Value := 1;
  qryEmpresasID_PLANO_VENDA.Value := 2;
  qryEmpresasOBSFISCO.Value :=
    'I - "DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL"; e II - "N�O GERA DIREITO A CR�DITO FISCAL DE ICMS, DE ISS E DE IPI".';
  qryEmpresasCFOP.Value := '5102';
  qryEmpresasCSOSN.Value := '102';
  qryEmpresasCST_ICMS.Value := '041';
  qryEmpresasCST_ENTRADA.Value := '07';
  qryEmpresasCST_SAIDA.Value := '07';
  qryEmpresasCST_IPI.Value := '53';
  qryEmpresasALIQ_PIS.Value := 0;
  qryEmpresasALIQ_COF.Value := 0;
  qryEmpresasALIQ_IPI.Value := 0;
  qryEmpresasALIQ_ICMS.Value := 0;
  qryEmpresasNSERIE.Value := 'S';
  qryEmpresasNTERM.Value := '3';
  qryEmpresasMOSTRA_RESUMO_CAIXA.Value := 'N';
  qryEmpresasLIMITE_DIARIO.Value := 1;
  qryEmpresasPRAZO_MAXIMO.Value := 1;
  qryEmpresasUSA_PDV.Value := 'S';
  qryEmpresasRECIBO_VIAS.Value := '1';
  qryEmpresasOBS_CARNE.Value := 'OBRIGADO PELA PREFER�NCIA!';
  qryEmpresasCAIXA_UNICO.Value := 'N';
  qryEmpresasCHECA_ESTOQUE_FISCAL.Value := 'S';
  qryEmpresasBLOQUEAR_PRECO.Value := 'N';
  qryEmpresasRECOLHE_FCP.Value := 'N';
  qryEmpresasN_INICIAL_NFCE.Value := 1;
  qryEmpresasN_INICIAL_NFE.Value := 1;
  qryEmpresasID_PLANO_CONTA_DEVOLUCAO.Value := 9;
  qryEmpresasID_PLA_CONTA_FICHA_CLI.Value := 10;
  qryEmpresasID_PLANO_CONTA_RETIRADA.Value := 11;
  qryEmpresasID_PLANO_TAXA_CARTAO.Value := 8;
  qryEmpresasEMPRESA_PADRAO.Value := 1;
  qryEmpresasCAIXA_RAPIDO.Value := 'N';
  qryEmpresasENVIAR_EMAIL_NFE.Value := 'N';
  qryEmpresasLANCAR_CARTAO_CREDITO.Value := 'N';
  qryEmpresasTABELA_PRECO.Value := 'N';
  qryEmpresasEXCLUI_PDV.Value := 'N';
  qryEmpresasDESCONTO_PROD_PROMO.Value := 'N';
  qryEmpresasRECIBO_VIAS.Value := 'N';
  qryEmpresasTRANSPORTADORA.Value := 'N';
  qryEmpresasVENDA_SEMENTE.Value := 'N';
  qryEmpresasINFORMAR_GTIN.Value := 'N';
  qryEmpresasPESQUISA_REFERENCIA.Value := 'N';
  qryEmpresasBLOQUEAR_PRECO.Value := 'N';
  qryEmpresasRESTAURANTE.Value := 'N';
  qryEmpresasFARMACIA.Value := 'N';
  qryEmpresasLER_PESO.Value := 'N';
  qryEmpresasLANCAR_CARTAO_CR.Value := 'N';
  qryEmpresasEXIBE_RESUMO_CAIXA.Value := 'N';
  qryEmpresasPUXA_CFOP_PRODUTO.Value := 'N';
  qryEmpresasHABILITA_DESCONTO_PDV.Value := 'N';
  qryEmpresasCHECA_LIMITE.Value := 'N';
  qryEmpresasPAGAMENTO_DINHEIRO.Value := 'N';
  qryEmpresasLOJA_ROUPA.Value := 'N';
  qryEmpresasRESPONSAVEL_TECNICO.Value := 'N';
end;

function TDados.Spaces(C: integer): String;
begin
  Result := StringOfChar(' ', C);
end;

function TDados.Alinha(Texto: String; Total: integer; Lado: Boolean): String;
begin
  if Lado Then // alinha a direita.
    Result := Spaces(Total - Length(Texto)) + Texto
  else // alinha a esquerda
    Result := Texto + Spaces(Total - Length(Texto));
end;

procedure TDados.GravarTotalComanda;
begin
  try
    qryComanda_Pessoa.Close;
    qryComanda_Pessoa.Params[0].Value := Dados.qryComandas_masterCODIGO.Value;
    qryComanda_Pessoa.Open;
    if not qryComanda_Pessoa.IsEmpty then
    begin

      qryComanda_Pessoa.First;

      while not qryComanda_Pessoa.eof do
      begin
        qrySomaItens.Close;
        qrySomaItens.Params[0].Value := qryComanda_PessoaCODIGO.Value;
        qrySomaItens.Open;

        qryConsulta.Close;
        qryConsulta.sql.Text :=
          'update comanda_pessoa set total=:total where codigo=:codigo';
        qryConsulta.Params[0].Value := qrySomaItensTOTAL.AsFloat;
        qryConsulta.Params[1].Value := qryComanda_PessoaCODIGO.Value;
        qryConsulta.ExecSQL;
        Conexao.CommitRetaining;
        qryComanda_Pessoa.Next;
      end;

      qrySomaPessoa.Close;
      qrySomaPessoa.Params[0].Value := qryComandas_masterCODIGO.Value;
      qrySomaPessoa.Open;

      qryComandas_master.edit;
      qryComandas_masterTOTAL.AsFloat := qrySomaPessoaTOTAL.AsFloat;
      qryComandas_master.Post;

      Conexao.CommitRetaining;
    end;
  except
    On e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TDados.DataModuleCreate(Sender: TObject);
var
  iArq: TIniFile;
  nTentativas: word;
begin

  try
    nTentativas := 1;
    FBDriver.VendorLib := ExtractFilePath(Application.ExeName) + 'fbclient.dll';
    iArq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Banco.ini');
    Conexao.Params.Values['DriverID'] := 'FB';
    Conexao.Params.Values['Server'] := iArq.ReadString('BD', 'IP', '');
    Conexao.Params.Values['Database'] := iArq.ReadString('BD', 'Path', '');

    try
      Conexao.Connected := true;
    Except
      raise Exception.Create('N�o foi possivel conectar na base de dados!');
      Application.Terminate;
    end;

  Finally
    iArq.Free;
  end;

  try

    Dados.qryEmpresas.Close;
    Dados.qryEmpresas.Open;

  except
    // faz nada
  end;

end;

end.
