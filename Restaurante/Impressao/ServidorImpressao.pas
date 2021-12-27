unit ServidorImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Inifiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB, Vcl.StdCtrls,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Conexao: TFDConnection;
    Transacao: TFDTransaction;
    WaitCursor: TFDGUIxWaitCursor;
    FBDriver: TFDPhysFBDriverLink;
    Memo1: TMemo;
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
    ACBrPosPrinter2: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS;
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
    qryComanda_Itens: TFDQuery;
    Timer1: TTimer;
    qryComanda_pessoa: TFDQuery;
    qryComanda_pessoaCODIGO: TIntegerField;
    qryComanda_pessoaPESSOA: TStringField;
    qryComanda_pessoaQTD: TIntegerField;
    qryComanda_ItensPESSOA: TStringField;
    qryComanda_ItensMESA: TStringField;
    qryComanda_ItensDATA_HORA: TSQLTimeStampField;
    qryComanda_ItensFK_PRODUTO: TIntegerField;
    qryComanda_ItensDESCRICAO: TStringField;
    qryComanda_ItensQTD: TFMTBCDField;
    qryAtualiza: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    SmallintField1: TSmallintField;
    StringField9: TStringField;
    StringField10: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    SmallintField2: TSmallintField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    StringField22: TStringField;
    StringField23: TStringField;
    qryComanda_ItensCODIGO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure ImpPedido;
    function Getcomputer: String;
    function Alinha(Texto: String; Total: integer; Lado: Boolean): String;
    function Spaces(C: integer): String;
    procedure AtualizaItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.Spaces(C: integer): String;
begin
  Result := StringOfChar(' ', C);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ImpPedido;
end;

function TForm1.Alinha(Texto: String; Total: integer; Lado: Boolean): String;
begin
  if Lado Then // alinha a direita.
    Result := Spaces(Total - Length(Texto)) + Texto
  else // alinha a esquerda
    Result := Texto + Spaces(Total - Length(Texto));
end;

procedure TForm1.FormCreate(Sender: TObject);
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
      raise Exception.Create('Não foi possivel conectar na base de dados!');
      Application.Terminate;
    end;

  Finally
    iArq.Free;
  end;

  try

    qryEmpresas.Close;
    qryEmpresas.Open;

    Timer1.Enabled := true;

    if not(qryEmpresasRESTAURANTE.Value = 'S') then
      Application.Terminate;

  except
    // faz nada
  end;

end;

function TForm1.Getcomputer: String;
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

procedure TForm1.AtualizaItem;
begin

  qryComanda_Itens.First;
  While not qryComanda_Itens.Eof do
  begin
    qryAtualiza.Close;
    qryAtualiza.Params[0].Value := qryComanda_ItensCODIGO.Value;
    qryAtualiza.ExecSQL;
    Conexao.CommitRetaining;
    qryComanda_Itens.Next;
  end;
end;

procedure TForm1.ImpPedido;
var
  x, y, i, j: integer;
  Lin_Tot, Dif_Tot: integer;
  Sub_Total, T_Geral: Extended;
  iRetorno, tamanho: integer;
  CdgCliente: string;
  vEndereco, Caminho_Impressao: String;
  Veiculo: String;
  sTexto, sTexto1, sTexto2, sTitulo: String;
  EspacosEmBranco: Extended;
  Traduzido: integer;
  NomedaEmpresa: String;
  FoneCompleto: String;
  Endereco1: String;
  Endereco2: String;
  i_modelo: integer;
begin

  try
    Timer1.Enabled := false;
    Lin_Tot := 9;
    Dif_Tot := 0;
    Sub_Total := 0;
    y := 0;

    Memo1.Lines.Clear;
    qryComanda_pessoa.Close;
    qryComanda_pessoa.Open;

    if not qryComanda_pessoa.IsEmpty then
    begin

      while not qryComanda_pessoa.Eof do
      begin

        qryComanda_Itens.Close;
        qryComanda_Itens.Params[0].Value := qryComanda_pessoaCODIGO.Value;
        qryComanda_Itens.Open;

        Memo1.Lines.add('</linha_simples>');
        sTexto := '<N><ce>*** PEDIDOS ***</CE></n>';
        Memo1.Lines.add('</linha_simples>');
        Memo1.Lines.add(sTexto);

        Memo1.Lines.add('MESA.....:' + qryComanda_ItensMESA.AsString);
        Memo1.Lines.add('COMANDA..:' + qryComanda_ItensPESSOA.AsString);
        Memo1.Lines.add('</linha_simples>');
        Memo1.Lines.add
          ('<C>|PRODUTO                              |       QTD|</C>');
        Memo1.Lines.add('</linha_simples>');

        qryComanda_Itens.First;
        While not qryComanda_Itens.Eof do
        begin

          sTexto := Alinha('|', 1, false) +
            Alinha(qryComanda_ItensDESCRICAO.AsString, 37, false) +
            Alinha('|', 1, false) +
            Alinha(FormatFloat('0.00', qryComanda_ItensQTD.AsFloat), 10, true) +
            Alinha('|', 1, false);

          Memo1.Lines.add('<C>' + sTexto + '</C>');
          qryComanda_Itens.Next;
          y := y + 1;
        end;

        Memo1.Lines.add('');
        Memo1.Lines.add('');
        Memo1.Lines.add('');

        Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +
          'Pedidos.txt');

        qryTerminal.Close;
        qryTerminal.Open;

        qryTerminal.Locate('nome', Getcomputer, []);

        if qryTerminalTIPOIMPRESSORA.Value = '2' then
        begin

          ACBrPosPrinter2.Porta :=
            LowerCase(qryTerminal.FieldByName('PORTA').AsString);

          if qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
            ACBrPosPrinter2.modelo := ppEscDaruma
          else if qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
            ACBrPosPrinter2.modelo := ppEscBematech
          else if qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
            ACBrPosPrinter2.modelo := ppEscPosEpson
          else if qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
            ACBrPosPrinter2.modelo := ppEscDiebold
          else if qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
            ACBrPosPrinter2.modelo := ppEscPosEpson
          else
            ACBrPosPrinter2.modelo := ppTexto;

          ACBrNFeDANFeESCPOS2.NumCopias := 1;

          ACBrPosPrinter2.Desativar;

          ACBrPosPrinter2.Device.Baud := qryTerminalVELOCIDADE.Value;
          ACBrPosPrinter2.Ativar;

          if ACBrPosPrinter2.VerificarImpressora then
            ACBrNFeDANFeESCPOS2.ImprimirRelatorio(Memo1.Lines);
        end;

        AtualizaItem;

        qryComanda_pessoa.Next;
      end;
    end;

    Timer1.Enabled := true;
  except
    on e: Exception do
    begin
      Timer1.Enabled := true;
      raise Exception.Create(e.Message);

    end;
  end;

end;

end.
