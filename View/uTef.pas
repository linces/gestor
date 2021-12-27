unit uTef;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, comctrls, strutils, TypInfo, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  ACBrBase, ACBrTEFD, ACBrTEFDClass, ACBrTEFDCliSiTef, ACBrTEFPayGoComum,
  ACBrTEFPayGoWebComum,
  ACBrTEFComum, ACBrTEFDPayGoWeb, acbrUtil, Math, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type

  TStatusVenda = (stsLivre, stsIniciada, stsEmPagamento, stsCancelada,
    stsAguardandoTEF, stsOperacaoTEF, stsFinalizada);

  TFrmTEF = class(TForm)
    pMensagem: TPanel;
    pMensagemOperador: TPanel;
    Label15: TLabel;
    pMensagemCliente: TPanel;
    Label17: TLabel;
    pLogs: TPanel;
    sbLimparLog: TSpeedButton;
    mLog: TMemo;
    mImpressao: TMemo;
    ACBrTEFD1: TACBrTEFD;
    FVenda: TFDMemTable;
    FItens: TFDMemTable;
    FVendaFCOLUNAS: TStringField;
    FVendaFDHINICIO: TDateTimeField;
    FVendaFNUMERACAO: TIntegerField;
    FVendaFVALORINICIAL: TFloatField;
    FVendaFVALORVENDA: TFloatField;
    FVendaFVALORTROCO: TFloatField;
    FVendaFVALORACRESCIMO: TFloatField;
    FVendaFVALORDESCONTO: TFloatField;
    FVendaFVALORPAGO: TFloatField;
    FItensFVENDA: TIntegerField;
    FItensREDE: TStringField;
    FItensVALORPAGO: TFloatField;
    FItensTIPOPAGAMENTO: TStringField;
    FItensDESCRICAOPAGAMENTO: TStringField;
    FItensCOLUNAS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ACBrTEFD1AguardaResp(Arquivo: string; SegundosTimeOut: Integer;
      var Interromper: Boolean);
    procedure ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
      var Tratado: Boolean);
    procedure ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
      Resp: TACBrTEFDResp; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
      Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFImprimeVia(TipoRelatorio
      : TACBrTEFDTipoRelatorio; Via: Integer; ImagemComprovante: TStringList;
      var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1DepoisConfirmarTransacoes(RespostasPendentes
      : TACBrTEFDRespostasPendentes);
    procedure ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
      Mensagem: string; var AModalResult: TModalResult);
    procedure ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string;
      var Tratado: Boolean);
    procedure ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
      var RetornoECF: string);
  private
    { Private declarations }
    // FTipoBotaoOperacao: TTipoBotaoOperacao;

    FCanceladoPeloOperador: Boolean;
    FTempoDeEspera: TDateTime;
    FTestePayGo: Integer;
    procedure AdicionarLinhaLog(AMensagem: String);
    procedure AdicionarLinhaImpressao(ALinha: String);
    procedure PayGoWebExibeMensagem(Mensagem: String;
      Terminal: TACBrTEFPGWebAPITerminalMensagem;
      MilissegundosExibicao: Integer);
    procedure MensagemTEF(const MsgOperador, MsgCliente: String);
    procedure GravaTEF(Codigo: Integer; NSU: string; Rede: String;
      RedeCNPJ: String; Indice: String);
  public
    { Public declarations }
    FIndicePagto: String;
    StatusVenda: TStatusVenda;
    FTotalVenda, FTotalPago: Currency;
    procedure Administrativo;
    procedure IniciarOperacao;
    function AdicionarPagamento(const Indice: String; AValor: Double;
      FTotalPago: extended; FTotalVenda: extended; FCodigo: Integer): Boolean;
    procedure FinalizarVenda;
    procedure AtivarTEF(FTipo: Integer);
    procedure ConfigurarTEF(FLog: String; FTroco_Maximo: extended;
      FViaClienteReduzida: Boolean; FMultiplosCartoes: Boolean;
      FMaximo_cartoes: Integer; FSofthouse: String; FRegistro: String;
      FAplicacao: String; FVersao: String);
    procedure CancelarVenda;
    function SolicitaCPF: string;
    procedure TVenda(FCodigo: Integer; FTotalCartao: Currency;
      FTotalTef: Currency; FColunas: Integer);
    procedure TPagamento(FID_Venda: Integer; FTipo: string; FDescricao: String;
      FValor: extended; FRede: String; FColunas: Integer);
    procedure VerificarTestePayGo;
    procedure StatusPagamento;
  end;

var
  FrmTEF: TFrmTEF;

implementation

{$R *.dfm}

uses frExibeMensagem, Udados;

procedure TFrmTEF.VerificarTestePayGo;
var
  P: Integer;
  ATeste: String;
begin
  P := pos('-', '00 - Livre');
  ATeste := copy('00 - Livre', 1, P - 1);
  FTestePayGo := StrToIntDef(ATeste, 0);
end;

procedure TFrmTEF.StatusPagamento;
begin
  StatusVenda := stsEmPagamento;
end;

procedure TFrmTEF.GravaTEF(Codigo: Integer; NSU: string; Rede: String;
  RedeCNPJ: String; Indice: String);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE VENDAS_FPG SET NSU=:NSU, INDICE=:INDICE, REDE=:REDE, REDECNPJ=:REDECNPJ, FEZ_TEF=''S'' WHERE CODIGO=:ID';
  dados.qryExecute.ParamByName('NSU').AsString := NSU;
  dados.qryExecute.ParamByName('REDE').AsString := Rede;
  dados.qryExecute.ParamByName('REDECNPJ').AsString := Rede;
  dados.qryExecute.ParamByName('INDICE').AsString := Indice;
  dados.qryExecute.ParamByName('ID').AsInteger := Codigo;
  dados.qryExecute.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

function TFrmTEF.AdicionarPagamento(const Indice: String; AValor: Double;
  FTotalPago: extended; FTotalVenda: extended; FCodigo: Integer): Boolean;
var
  Ok, TemTEF: Boolean;
  ReajusteValor: Double;
  UltResp: TACBrTEFResp;

  procedure InformarParametrosCartaoCredito;
  begin
    // Instruindo CRT a apenas transações de Crédito...
    // Isso é Opcional, e está aqui apenas para demonstração
    if (ACBrTEFD1.GPAtual = gpPayGoWeb) then
    begin
      ACBrTEFD1.TEFPayGoWeb.ParametrosAdicionais.ValueInfo[PWINFO_CARDTYPE] :=
        '01'; // 01: crédito
      ACBrTEFD1.TEFPayGoWeb.ParametrosAdicionais.ValueInfo[PWINFO_FINTYPE] :=
        '01'; // 01: à vista
    end
    else if (ACBrTEFD1.GPAtual = gpCliSiTef) then
      ACBrTEFD1.TEFCliSiTef.OperacaoCRT := 3;
  end;

  procedure InformarParametrosCartaoDebito;
  begin
    // Instruindo CRT a apenas transações de Débito
    if (ACBrTEFD1.GPAtual = gpPayGoWeb) then
    begin
      ACBrTEFD1.TEFPayGoWeb.ParametrosAdicionais.ValueInfo[PWINFO_CARDTYPE] :=
        '02'; // 02: débito
      ACBrTEFD1.TEFPayGoWeb.ParametrosAdicionais.ValueInfo[PWINFO_FINTYPE] :=
        '01'; // 01: à vista
    end
    else if (ACBrTEFD1.GPAtual = gpCliSiTef) then
      ACBrTEFD1.TEFCliSiTef.OperacaoCRT := 2;
  end;

begin
  Ok := False;
  TemTEF := False;

  FIndicePagto := Indice;
  if (ACBrTEFD1.GPAtual = gpPayGoWeb) then
    ACBrTEFD1.TEFPayGoWeb.ParametrosAdicionais.Clear
  else if (ACBrTEFD1.GPAtual = gpCliSiTef) then
    ACBrTEFD1.TEFCliSiTef.OperacaoCRT := 0;

  try
    // ** NOTA **
    // Usa '01' como Indice de Forma de Pagamento de ECF, para todas as operações TEF,
    // para evitar que o ACBrTEFD tente separar os Comprovantes por Forma de Pagamento

    if (Indice = '02') then // 02-CHEQUE
    begin
      Ok := ACBrTEFD1.CHQ(AValor, '01');
      TemTEF := True;
    end

    else if (Indice = '03') then // 03-CREDITO
    begin
      InformarParametrosCartaoCredito;
      Ok := ACBrTEFD1.CRT(AValor, '01');
      TemTEF := True;
    end

    else if (Indice = '04') then // 04-DEBITO
    begin
      InformarParametrosCartaoDebito;
      Ok := ACBrTEFD1.CRT(AValor, '01');
      TemTEF := True;
    end

    else if (Indice = '05') then // 05-CARTEIRA DIGITAL
    begin
      FTestePayGo := 27;
      Ok := ACBrTEFD1.CRT(AValor, '01');
      TemTEF := True;
    end
    else
      Ok := True; // Pagamentos não TEF

  finally
    StatusVenda := stsEmPagamento;
  end;

  Result := Ok;

  if Ok then
  begin
    if TemTEF then
    begin
      UltResp := ACBrTEFD1.RespostasPendentes
        [ACBrTEFD1.RespostasPendentes.Count - 1];

      GravaTEF(FCodigo, UltResp.NSU, UltResp.Rede,
        UltResp.NFCeSAT.CNPJCredenciadora, Indice);

      // Calcula a Diferença do Valor Retornado pela Operação TEF do Valor que
      // Informamos no CRT/CHQ
      ReajusteValor := RoundTo(UltResp.ValorTotal - FTotalPago, -2);

      { if ReajusteValor > 0 then
        begin
        // Se não é Saque, mas houve acréscimo no valor Retornado, devemos lançar
        // o Reajuste como Acréscimo na venda
        Venda.TotalAcrescimo := Venda.TotalAcrescimo + ReajusteValor;
        end;

        Desconto := UltResp.Desconto;
        if Desconto > 0 then
        begin
        // Se houve Desconto na Operação TEF, devemos subtrair do ValorPago
        // e lançar um Desconto no Total da Transacao
        ValorPago := ValorPago - Desconto;
        Venda.TotalDesconto := Venda.TotalDesconto + Desconto;
        end
        else if (ReajusteValor < 0) then
        begin
        // Se não é Desconto, mas houve redução no Valor Retornado, devemos
        // considerar a redução no ValorPago, pois a Adquirente limitou o
        // valor da Operação, a um máximo permitido... Deverá fechar o cupom,
        // com outra forma de Pagamento
        ValorPago := ValorPago + ReajusteValor;
        end; }
    end;
  end;

end;

procedure TFrmTEF.IniciarOperacao;
begin
  FCanceladoPeloOperador := False;
  FTempoDeEspera := 0;
end;

procedure TFrmTEF.Administrativo;
begin
  AdicionarLinhaLog('- btAdministrativoClick');
  IniciarOperacao;
  StatusVenda := stsOperacaoTEF;
  try
    FrmTEF.ConfigurarTEF(dados.qryTerminalTEF_LOG.AsString,
      dados.qryTerminalTEF_TROCO_MAXIMO.AsFloat,
      dados.qryTerminalTEF_VIA_REDUZIDA.AsString = 'S',
      dados.qryTerminalTEF_MULTIPLO_CARTOES.AsString = 'S',
      dados.qryTerminalTEF_MAX_CARTOES.AsInteger,
      dados.qryTerminalTEF_SOFT_HOUSE.AsString,
      dados.qryTerminalTEF_REGISTRO.AsString,
      dados.qryTerminalTEF_APLICACAO.AsString,
      dados.qryTerminalTEF_VERSAO.AsString);

    FrmTEF.AtivarTEF(dados.qryTerminalTEF_GERENCIADOR.AsInteger);

    ACBrTEFD1.ADM;
  finally
    StatusVenda := stsFinalizada;
  end;
end;

procedure TFrmTEF.ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
begin
  AdicionarLinhaLog('Enviando: ' + Req.Header + ' ID: ' + IntToStr(Req.ID));

  FCanceladoPeloOperador := False;
  FTempoDeEspera := 0;
  // Use esse evento, para inserir campos personalizados, ou modificar o arquivo
  // de requisião, que será criado e envido para o Gerenciador Padrão

  if (ACBrTEFD1.GPAtual = gpPayGo) then
  begin
    if (Req.Header = 'CRT') then
    begin
      // Instruindo CRT a apenas transações de Crédito
      if (FIndicePagto = '03') then
      begin
        Req.GravaInformacao(730, 000, '1'); // 1: venda (pagamento com cartão)
        Req.GravaInformacao(731, 000, '1'); // 1: crédito
        Req.GravaInformacao(732, 000, '1'); // 1: à vista
      end

      // Instruindo CRT a apenas transações de Débito
      else if (FIndicePagto = '04') then
      begin
        Req.GravaInformacao(730, 000, '1'); // 1: venda (pagamento com cartão)
        Req.GravaInformacao(731, 000, '2'); // 2: débito
        Req.GravaInformacao(732, 000, '1'); // 1: à vista
      end;

      FIndicePagto := '';
    end;

    if (FTestePayGo > 0) then
    begin
      if (Req.Header = 'CRT') and (FTestePayGo = 2) then
      // Passo 02 - Venda à vista aprovada com pré-seleção de parâmetros
      begin
        Req.GravaInformacao(010, 000, 'CERTIF');
        Req.GravaInformacao(730, 000, '1'); // operação “VENDA”
        Req.GravaInformacao(731, 000, '1'); // tipo de cartão “CRÉDITO”
        Req.GravaInformacao(732, 000, '1'); // tipo de financiamento “À VISTA”
      end

      else if (Req.Header = 'CRT') and (FTestePayGo = 3) then
      // Passo 03 - Venda parcelada aprovada com pré-seleção de parâmetros
      begin
        Req.GravaInformacao(010, 000, 'CERTIF');
        Req.GravaInformacao(018, 000, '3'); // número de parcelas = 3
        Req.GravaInformacao(730, 000, '1'); // operação “VENDA”
        Req.GravaInformacao(731, 000, '2'); // tipo de cartão “DÉBITO”
        Req.GravaInformacao(732, 000, '3');
        // tipo de financiamento “PARCELADO PELO ESTABELECIMENTO”
      end

      else if (Req.Header = 'CRT') and (FTestePayGo = 4) then
      // Passo 04 - Venda aprovada em moeda estrangeira
      begin
        Req.GravaInformacao(004, 000, '1'); // Dólar americano
      end

      else if (Req.Header = 'CRT') and (FTestePayGo = 27) then
      // Passo 27 - Venda aprovada com pré-seleção de parâmetros de carteira digital
      begin
        Req.GravaInformacao(010, 000, 'CERTIF');
        Req.GravaInformacao(749, 000, '8');
        // Tipo de Pagamento como carteira digital
        Req.GravaInformacao(750, 000, '1');
        // Identificação da Carteira Digital como QR Code
      end

      else if (Req.Header = 'ADM') and (FTestePayGo = 31) then
      // Passo 31 - Operação bem sucedida com valor pré-definido
      begin
        Req.GravaInformacao(003, 000, '1');
      end;

      FTestePayGo := 0;
    end;
  end;
end;

procedure TFrmTEF.ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
  var Tratado: Boolean);
begin
  Self.Enabled := not Bloqueia;
  AdicionarLinhaLog('BloqueiaMouseTeclado = ' + IfThen(Bloqueia, 'SIM', 'NAO'));
  Tratado := False; { Deixa executar o código de Bloqueio do ACBrTEFD }
end;

procedure TFrmTEF.AdicionarLinhaImpressao(ALinha: String);
begin
  mImpressao.Lines.Add(ALinha);
end;

procedure TFrmTEF.CancelarVenda;
begin
  AdicionarLinhaLog('- CancelarVenda');
  // AQUI você deve cancelar a sua venda no Banco de Dados, desfazendo baixa de
  // estoque ou outras operações que ocorreram durante a venda.

  ACBrTEFD1.CancelarTransacoesPendentes;
  StatusVenda := stsCancelada;
end;

procedure TFrmTEF.ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
  Resp: TACBrTEFDResp; var RetornoECF: Integer);

  procedure PularLinhasECortar;
  begin
    AdicionarLinhaImpressao('</pular_linhas>');
    AdicionarLinhaImpressao('</corte>');
  end;

begin
  AdicionarLinhaLog('ACBrTEFD1ComandaECF: ' +
    GetEnumName(TypeInfo(TACBrTEFDOperacaoECF), Integer(Operacao)));

  try
    case Operacao of
      opeAbreGerencial:
        AdicionarLinhaImpressao('</zera>');

      opeSubTotalizaCupom:
        begin
          if StatusVenda = stsIniciada then
            StatusVenda := stsEmPagamento;
        end;

      opeCancelaCupom:
        CancelarVenda;

      opeFechaCupom:
        begin
          FinalizarVenda;

        end;

      opePulaLinhas:
        PularLinhasECortar;

      opeFechaGerencial, opeFechaVinculado:
        begin
          PularLinhasECortar;
          if StatusVenda in [stsOperacaoTEF] then
            StatusVenda := stsFinalizada;
        end;
    end;

    RetornoECF := 1;
  except
    RetornoECF := 0;
  end;
end;

procedure TFrmTEF.ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
  Valor: Double; var RetornoECF: Integer);
begin
  AdicionarLinhaLog('ACBrTEFD1ComandaECFAbreVinculado, COO:' + COO +
    ' IndiceECF: ' + IndiceECF + ' Valor: ' + FormatFloatBr(Valor));
  AdicionarLinhaImpressao('</zera>');
  AdicionarLinhaImpressao('</linha_dupla>');
  RetornoECF := 1;

end;

procedure TFrmTEF.ACBrTEFD1ComandaECFImprimeVia(TipoRelatorio
  : TACBrTEFDTipoRelatorio; Via: Integer; ImagemComprovante: TStringList;
  var RetornoECF: Integer);
begin
  AdicionarLinhaLog('ACBrTEFD1ComandaECFImprimeVia: ' + IntToStr(Via));
  AdicionarLinhaImpressao(ImagemComprovante.Text);
  RetornoECF := 1;
end;

procedure TFrmTEF.ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
  var RetornoECF: Integer);
begin
  AdicionarLinhaLog('ACBrTEFD1ComandaECFPagamento, IndiceECF: ' + IndiceECF +
    ' Valor: ' + FormatFloatBr(Valor));
  RetornoECF := 1;

end;

procedure TFrmTEF.ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
  var RetornoECF: Integer);
begin
  AdicionarLinhaLog('ACBrTEFD1ComandaECFSubtotaliza: DescAcre: ' +
    FormatFloatBr(DescAcre));
  if StatusVenda = stsIniciada then
    StatusVenda := stsEmPagamento;
end;

procedure TFrmTEF.ACBrTEFD1DepoisConfirmarTransacoes(RespostasPendentes
  : TACBrTEFDRespostasPendentes);
var
  i, j: Integer;
begin
  for i := 0 to RespostasPendentes.Count - 1 do
  begin
    with RespostasPendentes[i] do
    begin
      AdicionarLinhaLog('Confirmado: ' + Header + ' ID: ' + IntToStr(ID));

      // Lendo os campos mapeados //
      AdicionarLinhaLog('- Rede: ' + Rede + ', NSU: ' + NSU);
      // AdicionarLinhaLog('- Parcelas: '+ IntToStr(QtdParcelas) +
      // ', parcelado por: '+ GetEnumName(TypeInfo(TACBrTEFRespParceladoPor), integer(ParceladoPor) ));
      AdicionarLinhaLog('- É Débito: ' + BoolToStr(Debito) + ', É Crédito: ' +
        BoolToStr(Credito) + ', Valor: ' + FormatFloat('###,###,##0.00',
        ValorTotal));

      // Lendo um Campo Específico //
      // AdicionarLinhaLog('- Campo 11: ' + LeInformacao(11,0).AsString );

      { for j := 0 to Venda.Pagamentos.Count-1 do
        begin
        if NSU = Venda.Pagamentos[j].NSU then
        begin
        Venda.Pagamentos[j].Confirmada := True;
        Break;
        end;
        end; }
    end;
  end;

  // AtualizarPagamentosVendaNaInterface;

end;

procedure TFrmTEF.MensagemTEF(const MsgOperador, MsgCliente: String);
begin
  if (MsgOperador <> '') then
    pMensagemOperador.Caption := MsgOperador;

  if (MsgCliente <> '') then
    pMensagemCliente.Caption := MsgCliente;

  pMensagemOperador.Visible := (Trim(pMensagemOperador.Caption) <> '');
  pMensagemCliente.Visible := (Trim(pMensagemCliente.Caption) <> '');
  pMensagem.Visible := pMensagemOperador.Visible or pMensagemCliente.Visible;
  Application.ProcessMessages;
end;

procedure TFrmTEF.PayGoWebExibeMensagem(Mensagem: String;
  Terminal: TACBrTEFPGWebAPITerminalMensagem; MilissegundosExibicao: Integer);
var
  FormExibeMensagem: TFormExibeMensagem;
begin
  if (Mensagem = '') then
  begin
    if Terminal = tmCliente then
      MensagemTEF('', ' ');
    if Terminal = tmOperador then
      MensagemTEF(' ', '');
  end

  else if MilissegundosExibicao >= 0 then
  begin
    FormExibeMensagem := TFormExibeMensagem.Create(Self);
    try
      FormExibeMensagem.Mensagem := Mensagem;
      FormExibeMensagem.TempoEspera := MilissegundosExibicao;
      FormExibeMensagem.ShowModal;
    finally
      FormExibeMensagem.Free;
    end;
  end

  else
  begin
    if Terminal = tmCliente then
      MensagemTEF('', Mensagem);
    if Terminal = tmOperador then
      MensagemTEF(Mensagem, '');
  end;
end;

procedure TFrmTEF.ConfigurarTEF(FLog: String; FTroco_Maximo: extended;
  FViaClienteReduzida: Boolean; FMultiplosCartoes: Boolean;
  FMaximo_cartoes: Integer; FSofthouse: String; FRegistro: String;
  FAplicacao: String; FVersao: String);
begin
  ACBrTEFD1.ArqLOG := FLog;
  ACBrTEFD1.TrocoMaximo := FTroco_Maximo;
  ACBrTEFD1.ImprimirViaClienteReduzida := FViaClienteReduzida;
  ACBrTEFD1.MultiplosCartoes := FMultiplosCartoes;
  ACBrTEFD1.NumeroMaximoCartoes := FMaximo_cartoes;
  ACBrTEFD1.SuportaDesconto := True;
  ACBrTEFD1.SuportaSaque := True;

  ACBrTEFD1.Identificacao.RazaoSocial := FSofthouse;
  ACBrTEFD1.Identificacao.RegistroCertificacao := FRegistro;
  ACBrTEFD1.Identificacao.NomeAplicacao := FAplicacao;
  ACBrTEFD1.Identificacao.VersaoAplicacao := FVersao;

  ACBrTEFD1.TEFPayGo.SuportaReajusteValor := True;
  ACBrTEFD1.TEFPayGo.SuportaNSUEstendido := True;
  ACBrTEFD1.TEFPayGo.SuportaViasDiferenciadas := True;

  // Configurações abaixo são obrigatórios, para funcionamento de Não Fiscal //
  ACBrTEFD1.AutoEfetuarPagamento := False;
  ACBrTEFD1.AutoFinalizarCupom := False;
end;

procedure TFrmTEF.AtivarTEF(FTipo: Integer);
begin
  AdicionarLinhaLog('- AtivarTEF');
  ACBrTEFD1.Inicializar(TACBrTEFDTipo(FTipo));
end;

procedure TFrmTEF.ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
  Mensagem: string; var AModalResult: TModalResult);
var
  Fim: TDateTime;
  OldMensagem: String;
begin
  case Operacao of
    opmOK:
      begin
        if ACBrTEFD1.GPAtual = gpPayGoWeb then
          PayGoWebExibeMensagem(Mensagem, tmOperador, CMilissegundosMensagem)
        else
          AModalResult := MessageDlg(Mensagem, mtInformation, [mbOK], 0);
      end;

    opmYesNo:
      AModalResult := MessageDlg(Mensagem, mtConfirmation, [mbYes, mbNo], 0);

    opmExibirMsgOperador:
      MensagemTEF(Mensagem, '');

    opmRemoverMsgOperador:
      MensagemTEF(' ', '');

    opmExibirMsgCliente:
      MensagemTEF('', Mensagem);

    opmRemoverMsgCliente:
      MensagemTEF('', ' ');

    opmDestaqueVia:
      begin
        OldMensagem := pMensagemOperador.Caption;
        try
          { Aguardando 3 segundos }
          Fim := IncSecond(now, 3);
          repeat
            MensagemTEF(Mensagem + ' ' + IntToStr(SecondsBetween(Fim,
              now)), '');
            Sleep(200);
          until (now > Fim);
        finally
          MensagemTEF(OldMensagem, '');
        end;
      end;
  end;
end;

procedure TFrmTEF.ACBrTEFD1GravarLog(const GP: TACBrTEFDTipo; ALogLine: string;
  var Tratado: Boolean);
begin
  AdicionarLinhaLog(ALogLine);
  Tratado := False;
end;

function TFrmTEF.SolicitaCPF: string;
var
  Saida: String;
begin
  Saida := '';
  if ACBrTEFD1.GPAtual = gpCliSiTef then
  begin
    // SiTef precisa de parâmetros extras, vamos informar...
    ACBrTEFD1.TEFCliSiTef.PinPadIdentificador := '01.123.456/0001-07';
    ACBrTEFD1.TEFCliSiTef.PinPadChaveAcesso :=
      'Chave Fornecida pela Software Express, eclusiva para o Identificador acima';
  end;

  ACBrTEFD1.CDP('F', Saida); // F=CPF
  Result := Saida;

end;

procedure TFrmTEF.TVenda(FCodigo: Integer; FTotalCartao: Currency;
  FTotalTef: Currency; FColunas: Integer);
begin
  with FrmTEF do
  begin
    FVenda.Close;
    FVenda.Open;
    while not FVenda.IsEmpty do
      FVenda.Delete;
    FVenda.Insert;
    FVendaFCOLUNAS.Value := FColunas.ToString;
    FVendaFDHINICIO.Value := now;
    FVendaFNUMERACAO.Value := FCodigo;
    FVendaFVALORINICIAL.Value := FTotalCartao;
    FVendaFVALORVENDA.Value := FTotalCartao;
    FVendaFVALORTROCO.Value := 0;
    FVendaFVALORDESCONTO.Value := 0;
    FVendaFVALORACRESCIMO.Value := 0;
    FVendaFVALORPAGO.Value := FTotalTef;
    FVenda.Post;

    dados.qryconsulta.Close;
    dados.qryconsulta.SQL.Clear;
    dados.qryconsulta.SQL.Add
      ('select vfpg.codigo, vfpg.tipo, vfpg.valor, vfpg.Indice, vfpg.rede from vendas_fpg vfpg');
    dados.qryconsulta.SQL.Add
      ('left join forma_pagamento fpg on fpg.codigo=vfpg.id_forma');
    dados.qryconsulta.SQL.Add('where');
    dados.qryconsulta.SQL.Add
      ('(vfpg.vendas_master=:id) and (vfpg.valor>0) and (vfpg.fez_tef=''S'')and (fpg.usa_tef=''S'')');
    dados.qryconsulta.Params[0].Value := FCodigo;
    dados.qryconsulta.Open;

    dados.qryconsulta.First;

    while not dados.qryconsulta.Eof do
    begin
      if dados.qryconsulta.FieldByName('INDICE').AsString = '03' then
        TPagamento(FCodigo, '03', 'CARTÃO DE CRÉITO',
          dados.qryconsulta.FieldByName('valor').AsFloat,
          dados.qryconsulta.FieldByName('rede').AsString, FColunas);
      if dados.qryconsulta.FieldByName('INDICE').AsString = '04' then
        TPagamento(FCodigo, '04', 'CARTÃO DE DÉBITO',
          dados.qryconsulta.FieldByName('valor').AsFloat,
          dados.qryconsulta.FieldByName('rede').AsString, FColunas);
      dados.qryconsulta.Next;
    end;

  end;

end;

procedure TFrmTEF.TPagamento(FID_Venda: Integer; FTipo: string;
  FDescricao: String; FValor: extended; FRede: String; FColunas: Integer);
begin
  with FrmTEF do
  begin
    FItens.Close;
    FItens.Open;

    while not FItens.IsEmpty do
      FItens.Delete;

    FItens.Insert;
    FItensCOLUNAS.Value := FColunas.ToString;
    FItensFVENDA.Value := FID_Venda;
    FItensREDE.Value := FRede;
    FItensVALORPAGO.Value := FValor;
    FItensTIPOPAGAMENTO.Value := FTipo;
    FItensDESCRICAOPAGAMENTO.Value := FDescricao;
    FItens.Post;
  end;
end;

procedure TFrmTEF.FinalizarVenda;
var
  SL: TStringList;
  i: Integer;
  DoctoFiscalOk: Boolean;
  MR: TModalResult;
begin
  mImpressao.Lines.Clear;
  try
    // AQUI você deve Chamar uma Rotina para Gerar e Transmitir o Documento Fiscal (NFCe ou SAT)

    SL := TStringList.Create;
    try
      // Ao invés do relatório abaixo, você deve enviar a impressão de um DANFCE ou Extrato do SAT

      SL.Add(PadCenter(' BILHETE DE PASSAGEM ',
        FVendaFCOLUNAS.AsInteger, '-'));
      SL.Add('Número: <n>' + FormatFloat('000000', FVendaFNUMERACAO.AsInteger)
        + '</n>');
      SL.Add('Data/Hora: <n>' + FormatDateTimeBr(FVendaFDHINICIO.Value)
        + '</n>');
      SL.Add('</linha_simples>');
      SL.Add('');
      SL.Add('Valor Inicial...: <n>' +
        FormatFloatBr(FVendaFVALORINICIAL.AsFloat) + '</n>');
      SL.Add('Total Descontos.: <n>' +
        FormatFloatBr(FVendaFVALORDESCONTO.AsFloat) + '</n>');
      SL.Add('Total Acréscimos: <n>' +
        FormatFloatBr(FVendaFVALORACRESCIMO.AsFloat) + '</n>');
      SL.Add('</linha_simples>');
      SL.Add('VALOR FINAL.....: <n>' + FormatFloatBr(FVendaFVALORVENDA.AsFloat)
        + '</n>');
      SL.Add('');
      SL.Add(PadCenter(' Pagamentos ', FVendaFCOLUNAS.AsInteger, '-'));

      FItens.First;
      while not FItens.Eof do
      begin
        SL.Add(PadSpace(FItensTIPOPAGAMENTO.Value + ' - ' +
          FItensDESCRICAOPAGAMENTO.AsString + '|' +
          FormatFloatBr(FItensVALORPAGO.Value) + '|' + FItensREDE.AsString,
          FItensCOLUNAS.AsInteger, '|'));
        FItens.Next;
      end;

      SL.Add('</linha_simples>');

      SL.Add('Total Pago......: <n>' + FormatFloatBr(FVendaFVALORPAGO.AsFloat)
        + '</n>');
      SL.Add('Troco...........: <n>' + FormatFloatBr(FVendaFVALORTROCO.AsFloat)
        + '</n>');

      SL.Add('</linha_dupla>');
      SL.Add('</corte>');
      AdicionarLinhaImpressao(SL.Text);
    finally
      SL.Free;
    end;

    StatusVenda := stsFinalizada;
    ACBrTEFD1.ImprimirTransacoesPendentes();

  except
    CancelarVenda;
  end;
end;

procedure TFrmTEF.ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
  var RetornoECF: string);
begin
  case Operacao of
    ineSubTotal:
      RetornoECF := FloatToStr(FTotalVenda);

    ineTotalAPagar:
      begin
        // ACBrTEFD1.RespostasPendentes.TotalPago  deve ser subtraido, pois ACBrTEFD já subtrai o total dos pagamentos em TEF internamente
        RetornoECF :=
          FloatToStr
          (RoundTo(FTotalPago - ACBrTEFD1.RespostasPendentes.TotalPago, -2));
      end;

    ineEstadoECF:
      begin
        // "L" - Livre
        // "V" - Venda de Itens
        // "P" - Pagamento (ou SubTotal efetuado)
        // "C" ou "R" - CDC ou Cupom Vinculado
        // "G" ou "R" - Relatório Gerencial
        // "N" - Recebimento Não Fiscal
        // "O" - Outro
        Case StatusVenda of
          stsIniciada:
            RetornoECF := 'V';
          stsEmPagamento:
            RetornoECF := 'P';
          stsLivre, stsFinalizada, stsCancelada, stsOperacaoTEF:
            RetornoECF := 'L';
        else
          RetornoECF := 'O';
        end;
      end;
  end;
end;

procedure TFrmTEF.AdicionarLinhaLog(AMensagem: String);
begin
  mLog.Lines.Add(AMensagem);
end;

procedure TFrmTEF.ACBrTEFD1AguardaResp(Arquivo: string;
  SegundosTimeOut: Integer; var Interromper: Boolean);
var
  Msg: String;
begin
  if FCanceladoPeloOperador then
  begin
    FCanceladoPeloOperador := False;
    Interromper := True;
    Exit;
  end;

  Msg := '';
  if (ACBrTEFD1.GPAtual in [gpCliSiTef, gpVeSPague, gpPayGoWeb]) then
  // É TEF dedicado ?
  begin
    if (Arquivo = '23') and ACBrTEFD1.TecladoBloqueado then
    // Está aguardando Pin-Pad ?
    begin
      // Desbloqueia o Teclado
      ACBrTEFD1.BloquearMouseTeclado(False);
      // Ajusta Interface para Espera do TEF, com opçao de cancelamento pelo Operador
      StatusVenda := stsAguardandoTEF;

      Msg := 'Aguardando Resposta do Pinpad.  Pressione <ESC> para Cancelar';
      FCanceladoPeloOperador := False;
    end;
  end
  else if FTempoDeEspera <> SegundosTimeOut then
  begin
    Msg := 'Aguardando: ' + Arquivo + ' ' + IntToStr(SegundosTimeOut);
    FTempoDeEspera := SegundosTimeOut;
  end;

  if Msg <> '' then
    AdicionarLinhaLog(Msg);

  Application.ProcessMessages;

end;

procedure TFrmTEF.FormCreate(Sender: TObject);
begin
  Self.Hide;
end;

end.
