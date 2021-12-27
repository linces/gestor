unit uGeraSintegra;

interface

uses acbrutil, system.sysutils, system.strutils;

function GeraReg10(cnpj, inscricao, razaosocial, estado, cidade, telefone,
  codigoconvenio, naturezainformacoes, finalidadearquivo: string;
  datainicial, datafinal: tdate): string;

function GeraReg11(endereco, numero, complemento, bairro, cep, responsavel,
  telefone: string): string;

function GerarReg50(cpfcnpj, inscricao, datadocumento, uf, modelo, serie,
  numero, cfop, emissordocumento: string; valorcontabil, basedecalculo, icms,
  isentas, outras, aliquota: real; situacao: string): string;

function GerarReg51(cpfcnpj, inscricao, datadocumento, estado, serie, numero,
  cfop: string; valorcontabil, valoripi, valorisentas, valoroutras: real;
  situacao: string): string;

function GerarReg53(cpfcnpj, inscricao, datadocumento, estado, modelo, serie,
  numero, cfop, emitente: string; basest, icmsretido, despesas: real;
  situacao, codigoantecipacao: string): string;

function GerarReg54(cpfcnpj, modelo, serie, numero, cfop, cst, numeroitem,
  codigo: string; quantidade, valor, ValorDescontoDespesa, basedecalculo,
  basest, valoripi, aliquota: real): string;

function GerarReg61(emissao: tdate; modelo, serie, subserie, NumOrdemInicial,
  NumOrdemFinal: String; valor, basedecalculo, ValorIcms, isentas, outras,
  aliquota: real): string;

function GerarReg61R(MesAno, codigo: string; Qtd, valor, basedecalculo,
  aliquota: real): string;

function GerarReg74(Data: tdate; codigo: integer;
  quantidade, ValorProduto: real; CodigoPosse, CNPJPossuidor,
  InscricaoPossuidor, UFPossuidor: string): string;

function GerarReg75(datainicial, datafinal: tdate;
  codigo, ncm, descricao, unidade: string; AliquotaIpi, AliquotaIcms, Reducao,
  basest: real): string;

function GerarReg90(cnpj, inscricao: string; qtd50, qtd51, qtd53, qtd54, qtd61,
  qtd61r, qtd74, qtd75: integer): string;

implementation

function GeraReg10(cnpj, inscricao, razaosocial, estado, cidade, telefone,
  codigoconvenio, naturezainformacoes, finalidadearquivo: string;
  datainicial, datafinal: tdate): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '10' + TBStrZero(TiraPontos(cnpj), 14);
  wregistro := wregistro + PadRight(Trim(TiraPontos(inscricao)), 14);
  wregistro := wregistro + PadRight(Copy(razaosocial, 1, 35), 35);
  wregistro := wregistro + PadRight(Copy(cidade, 1, 30), 30);
  wregistro := wregistro + PadRight(estado, 2);
  wregistro := wregistro + PadRight(TBStrZero(TiraPontos(telefone), 10), 10);
  wregistro := wregistro + FormatDateTime('yyyymmdd', datainicial);
  wregistro := wregistro + FormatDateTime('yyyymmdd', datafinal);
  wregistro := wregistro + PadRight(codigoconvenio, 1);
  wregistro := wregistro + PadRight(naturezainformacoes, 1);
  wregistro := wregistro + PadRight(finalidadearquivo, 1);
  result := wregistro;
end;

function GeraReg11(endereco, numero, complemento, bairro, cep, responsavel,
  telefone: string): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '11';
  wregistro := wregistro + PadRight(Copy(endereco, 1, 34), 34);
  wregistro := wregistro + TBStrZero(TiraPontos(numero), 5);
  wregistro := wregistro + PadRight(Copy(complemento, 1, 22), 22);
  wregistro := wregistro + PadRight(Copy(bairro, 1, 15), 15);
  wregistro := wregistro + TBStrZero(TiraPontos(cep), 8);
  wregistro := wregistro + PadRight(Copy(responsavel, 1, 28), 28);
  wregistro := wregistro + TBStrZero(TiraPontos(telefone), 12);
  result := wregistro;
end;

function GerarReg50(cpfcnpj, inscricao, datadocumento, uf, modelo, serie,
  numero, cfop, emissordocumento: string; valorcontabil, basedecalculo, icms,
  isentas, outras, aliquota: real; situacao: string): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '50';
  wregistro := wregistro + TBStrZero(TiraPontos(cpfcnpj), 14) +
    PadRight(TiraPontos(inscricao), 14);
  wregistro := wregistro + FormatDateTime('yyyymmdd', strtodate(datadocumento));
  wregistro := wregistro + PadRight(uf, 2);
  wregistro := wregistro + TBStrZero(modelo, 2);
  wregistro := wregistro + PadRight(serie, 3);

  wregistro := wregistro + TBStrZero(RightStr(numero, 6), 6);

  wregistro := wregistro + PadRight(TiraPontos(cfop), 4);
  wregistro := wregistro + PadRight(emissordocumento, 1);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valorcontabil)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basedecalculo)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', icms)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', isentas)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', outras)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', aliquota)), 4);
  wregistro := wregistro + PadRight(situacao, 1);
  result := wregistro;
end;

function GerarReg51(cpfcnpj, inscricao, datadocumento, estado, serie, numero,
  cfop: string; valorcontabil, valoripi, valorisentas, valoroutras: real;
  situacao: string): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '51';
  wregistro := wregistro + TBStrZero(TiraPontos(cpfcnpj), 14) +
    PadRight(TiraPontos(inscricao), 14);
  wregistro := wregistro + FormatDateTime('yyyymmdd', strtodate(datadocumento));
  wregistro := wregistro + PadRight(estado, 2);
  wregistro := wregistro + PadRight(serie, 3);
  wregistro := wregistro + TBStrZero(RightStr(numero, 6), 6);
  wregistro := wregistro + PadRight(TiraPontos(cfop), 4);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valorcontabil)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valoripi)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valorisentas)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valoroutras)), 13);
  wregistro := wregistro + Space(20);
  wregistro := wregistro + PadRight(situacao, 1);
  result := wregistro;
end;

function GerarReg53(cpfcnpj, inscricao, datadocumento, estado, modelo, serie,
  numero, cfop, emitente: string; basest, icmsretido, despesas: real;
  situacao, codigoantecipacao: string): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '53';
  wregistro := wregistro + TBStrZero(TiraPontos(cpfcnpj), 14) +
    PadRight(TiraPontos(inscricao), 14);
  wregistro := wregistro + FormatDateTime('yyyymmdd', strtodate(datadocumento));
  wregistro := wregistro + PadRight(estado, 2);
  wregistro := wregistro + TBStrZero(modelo, 2);
  wregistro := wregistro + PadRight(Trim(serie), 3);
  wregistro := wregistro + TBStrZero(RightStr(numero, 6), 6);
  wregistro := wregistro + PadRight(TiraPontos(cfop), 4);
  wregistro := wregistro + PadRight(emitente, 1);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basest)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', icmsretido)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', despesas)), 13);
  wregistro := wregistro + PadRight(situacao, 1);
  wregistro := wregistro + PadRight(codigoantecipacao, 1);
  wregistro := wregistro + Space(29);
  result := wregistro;
end;

function GerarReg54(cpfcnpj, modelo, serie, numero, cfop, cst, numeroitem,
  codigo: string; quantidade, valor, ValorDescontoDespesa, basedecalculo,
  basest, valoripi, aliquota: real): string;
var
  wregistro: string;
  a: integer;
begin
  result := '';
  wregistro := '54';
  wregistro := wregistro + TBStrZero(TiraPontos(cpfcnpj), 14);
  wregistro := wregistro + TBStrZero(modelo, 2);
  wregistro := wregistro + PadRight(serie, 3);
  wregistro := wregistro + TBStrZero(RightStr(numero, 6), 6);

  wregistro := wregistro + PadRight(TiraPontos(cfop), 4);
  wregistro := wregistro + PadRight(cst, 3);
  wregistro := wregistro + IntToStrZero(numeroitem.ToInteger, 3);
  if numeroitem.ToInteger <= 990 then
    wregistro := wregistro + PadRight(codigo, 14) // codigo do produto
  else
    wregistro := wregistro + Space(14);

  wregistro := wregistro + TBStrZero(TiraPontos(FormatFloat('#,###0.000',
    quantidade)), 11); // quantidade do produto
  wregistro := wregistro + TBStrZero(TiraPontos(FormatFloat('#,##0.00', valor)),
    12); // total do produto
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', ValorDescontoDespesa)), 12);
  // desconto/despesa
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basedecalculo)), 12);
  wregistro := wregistro + TBStrZero(TiraPontos(FormatFloat('#,##0.00', basest)
    ), 12); // base de calculo substituicao tributária
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valoripi)), 12);
  // valor do ipi.
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', aliquota)), 4);

  result := wregistro;

end;

function GerarReg61(emissao: tdate; modelo, serie, subserie, NumOrdemInicial,
  NumOrdemFinal: String; valor, basedecalculo, ValorIcms, isentas, outras,
  aliquota: real): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '61';
  wregistro := wregistro + Space(28);
  wregistro := wregistro + FormatDateTime('yyyymmdd', emissao);
  wregistro := wregistro + TBStrZero(modelo, 2);
  wregistro := wregistro + PadRight(serie, 3);
  wregistro := wregistro + PadRight(subserie, 2);
  wregistro := wregistro + RightStr(TBStrZero(NumOrdemInicial, 6), 6);
  wregistro := wregistro + RightStr(TBStrZero(NumOrdemFinal, 6), 6);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valor)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basedecalculo)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', ValorIcms)), 12);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', isentas)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', outras)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', aliquota)), 4);
  wregistro := wregistro + Space(1);
  result := wregistro;

end;

function GerarReg61R(MesAno, codigo: string; Qtd, valor, basedecalculo,
  aliquota: real): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '61R';
  wregistro := wregistro + PadLeft(MesAno, 6, '0');
  wregistro := wregistro + PadRight(codigo, 14);
  wregistro := wregistro + TBStrZero(TiraPontos(FormatFloat('#,###0.000',
    Qtd)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', valor)), 16);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basedecalculo)), 16);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', aliquota)), 4);
  wregistro := wregistro + Space(54);
  result := wregistro;
end;

function GerarReg75(datainicial, datafinal: tdate;
  codigo, ncm, descricao, unidade: string; AliquotaIpi, AliquotaIcms, Reducao,
  basest: real): string;
var
  wregistro: string;
begin
  result := '';
  wregistro := '75' + FormatDateTime('yyyymmdd', datainicial) +
    FormatDateTime('yyyymmdd', datafinal);
  wregistro := wregistro + PadRight(codigo, 14);
  wregistro := wregistro + PadRight(ncm, 8);
  wregistro := wregistro + PadRight(Copy(Trim(descricao), 1, 53), 53);
  wregistro := wregistro + PadRight(unidade, 6);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', AliquotaIpi)), 5);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', AliquotaIcms)), 4);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', Reducao)), 5);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', basest)), 13);
  result := wregistro;
end;

function GerarReg74(Data: tdate; codigo: integer;
  quantidade, ValorProduto: real; CodigoPosse, CNPJPossuidor,
  InscricaoPossuidor, UFPossuidor: string): string;
var
  wregistro: string;
begin
  result := '';

  wregistro := '74';
  wregistro := wregistro + FormatDateTime('yyyymmdd', Data);
  wregistro := wregistro + PadRight(codigo.ToString, 14);
  wregistro := wregistro + TBStrZero(TiraPontos(FormatFloat('#,###0.000',
    quantidade)), 13);
  wregistro := wregistro +
    TBStrZero(TiraPontos(FormatFloat('#,##0.00', ValorProduto)), 13);
  wregistro := wregistro + CodigoPosse;
  wregistro := wregistro + TBStrZero(CNPJPossuidor, 14);
  wregistro := wregistro + PadRight(InscricaoPossuidor, 14);
  wregistro := wregistro + PadRight(UFPossuidor, 2);
  wregistro := wregistro + Space(45); // brancos
  result := wregistro;
end;

function GerarReg90(cnpj, inscricao: string; qtd50, qtd51, qtd53, qtd54, qtd61,
  qtd61r, qtd74, qtd75: integer): string;
var
  wregistro: string;
  WTotal60A, WTotal60D, WTotal60I: integer;
  wtotal88: integer;
  WTotal90: integer;
  WSeque90: integer;
  i: integer;
begin
  result := '';
  wregistro := '90' + TBStrZero(TiraPontos(cnpj), 14);
  wregistro := wregistro + PadRight(TiraPontos(inscricao), 14);
  if qtd50 > 0 then
    wregistro := wregistro + '50' + TBStrZero(IntToStr(qtd50), 8);
  if qtd51 > 0 then
    wregistro := wregistro + '51' + TBStrZero(IntToStr(qtd51), 8);
  if qtd53 > 0 then
    wregistro := wregistro + '53' + TBStrZero(IntToStr(qtd53), 8);
  if qtd54 > 0 then
    wregistro := wregistro + '54' + TBStrZero(IntToStr(qtd54), 8);
  if qtd61 > 0 then
    wregistro := wregistro + '61' + TBStrZero(IntToStr(qtd61 + qtd61r), 8);
  if qtd74 > 0 then
    wregistro := wregistro + '74' + TBStrZero(IntToStr(qtd74), 8);
  if qtd75 > 0 then
    wregistro := wregistro + '75' + TBStrZero(IntToStr(qtd75), 8);

  // totalizador para registros 88
  wtotal88 := 0;

  WTotal90 := 3;
  WSeque90 := 1;
  if length(wregistro) > 30 then
  begin
    wregistro := wregistro + Space(125 - length(wregistro)) +
      IntToStr(WSeque90 + 1);
    result := wregistro;
    Inc(WTotal90);
    Inc(WSeque90);
  end;

  wregistro := '90' + TBStrZero(TiraPontos(cnpj), 14);
  wregistro := wregistro + PadRight(TiraPontos(inscricao), 14);
  wregistro := wregistro + '99' +
    TBStrZero(IntToStr(qtd50 + qtd51 + qtd53 + qtd54 + (qtd61 + qtd61r)+ qtd74 + qtd75
    + wtotal88 + WTotal90), 8);

  wregistro := wregistro + Space(125 - length(wregistro)) + IntToStr(WSeque90);

  if result <> '' then
    result := result + '##' + wregistro
  else
    result := wregistro;

end;

end.
