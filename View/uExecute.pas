unit uExecute;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmExecute = class(TForm)
    qryParametro: TFDQuery;
    qryParametroVERSAO: TIntegerField;
    qryParametroDATA_SCRIPT: TDateField;
    qryParametroESTILO: TStringField;
    qryParametroLINK_TREINAMENTO: TStringField;
    qryParametroTITULO_SISTEMA: TStringField;
    qryParametroSUB_TITULO_SISTEMA: TStringField;
    qryParametroEMAIL_SUPORTE: TStringField;
    qryParametroSITE: TStringField;
    qryParametroFONE1: TStringField;
    qryParametroFONE2: TStringField;
    qryParametroCONTATO: TStringField;
    qryConsulta: TFDQuery;
    IBScript: TFDScript;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    MemoNovo: TMemo;
    TabSheet11: TTabSheet;
    MemoUpdate: TMemo;
    TabSheet3: TTabSheet;
    MemoIPI: TMemo;
    TabSheet5: TTabSheet;
    MemoCSOSN: TMemo;
    TabSheet6: TTabSheet;
    MemoPIS: TMemo;
    TabSheet8: TTabSheet;
    MemoICMS: TMemo;
    TabSheet10: TTabSheet;
    MemoCstICMS: TMemo;
    TabPaises: TTabSheet;
    MemoPaises: TMemo;
    TabFPG: TTabSheet;
    MemoFPG: TMemo;
    TabDesoneracao: TTabSheet;
    MemoDesoneracao: TMemo;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet12: TTabSheet;
    Memo8: TMemo;
    TabSheet2: TTabSheet;
    Memo3: TMemo;
    TabSheet7: TTabSheet;
    Memo5: TMemo;
    TabSheet9: TTabSheet;
    MemoConsulta: TMemo;
    memo: TTabSheet;
    MemoSql: TMemo;
    TabSheet14: TTabSheet;
    MemoTela: TMemo;
    TabSheet15: TTabSheet;
    MemoNFe: TMemo;
    TabSheet16: TTabSheet;
    MemoGatilho: TMemo;
    TabSheetPlano: TTabSheet;
    MemoPlano: TMemo;
    TabSheet17: TTabSheet;
    MemoDescricaoPlano: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    procedure Apaga_Campos_Tabelas;
    procedure AtualizaCampos;
    procedure CriaGatilhos;
    procedure AtualizaTabelas;
    procedure Upd_01_05_2019;
    procedure UpdateNovo;
    procedure UpdateAtualiza;
    procedure AtualizaNumeroBoleto;
    procedure UsaBalanca;
    procedure Apaga_Gatilhos;
    { Private declarations }
  public
    { Public declarations }
    procedure ExecuteScript;
  end;

var
  frmExecute: TfrmExecute;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmExecute.AtualizaNumeroBoleto;
var
  qtdboletos: Integer;
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select coalesce(max(codigo),0) from creceber where tipo=''B''';
  dados.qryConsulta.Open;

  if dados.qryConsulta.Fields[0].asinteger = 0 then
    qtdboletos := 1
  else
    qtdboletos := dados.qryConsulta.Fields[0].asinteger;

  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'UPDATE CBR_CONFIG SET NUMERO_BOLETO=:NUMERO WHERE NUMERO_BOLETO IS NULL';
  dados.qryExecute.Params[0].Value := qtdboletos;
  dados.qryExecute.ExecSQL;

  dados.Conexao.CommitRetaining;

end;

procedure TfrmExecute.Apaga_Gatilhos;
begin

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER ADD_ESTOQUE_COMPRA;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER ADD_ESTOQUE_COMPRA_FI;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPOSICAO_ADD_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPOSICAO_BAIXA_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_CANCELA_UPDT;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_DEL_BAIXA_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_DEL_BX_EST_FI;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_UPD_BAIXA_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_UPD_BAIXA_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER COMPRA_UPD_BX_EST_FI;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER GRADE_ADD_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER GRADE_BAIXA_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFCE_ADD_ESTOQUE_FISCAL;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFCE_BAIXA_ESTOQUE_FISCAL;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFCE_BAIXA_UPD_ESTOQUE_FI;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFE_ATUALIZA_QTD_PRO;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFE_DELETE_BX_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFE_DELETE_ESTQOUE_FISCAL;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER NFE_ESTOQUE_CANCELA_NF;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER PRODUTO_FABRICADOS_ADD_COMP;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER PRODUTO_FABRICADOS_APAGA;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER PRODUTO_FABRICADOS_APAGA_COMP;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TRIGGER PRO_FAB_INSERE_ESTOQUE;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

end;

procedure TfrmExecute.Apaga_Campos_Tabelas;
begin


  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_BEBIDA;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_CARDAPIO;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_ENDERECO;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_ITEMPEDIDO;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_LISTANEGRA;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_PEDIDO;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_PIZZA;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DROP TABLE DELIVERY_SABORES;';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;


  try // pagameu cadastro no tomador os
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'DELETE FROM TOMADOR WHERE CNPJ=''69498415234''';
    qryConsulta.ExecSQL;
    dados.Conexao.CommitRetaining;
  except
    // nada
  end;

  try // apaga modelo_dll
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select CODIGO FROM  ENTREGADOR; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDAS_PARAMETROS DROP MODELO_DLL;';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

  try // auto atualiza
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select AUTO_ATUALIZA FROM  EMPRESA; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    MemoSql.Text := ' ALTER TABLE EMPRESA DROP AUTO_ATUALIZA;';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

  try // apaga tabela produto serial
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select DOC_SAIDA FROM  PRODUTO_SERIAL; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    MemoSql.Text := 'DROP TABLE PRODUTO_SERIAL';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

  qryParametro.Close;
  qryParametro.Open;

  if qryParametroVERSAO.Value <> 300 then
  // apaga config se verssao diferente de 300
  begin
    MemoSql.Clear;
    MemoSql.Text := 'DROP TABLE CONFIG;';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Lines.Add('CREATE TABLE CONFIG (' +
      'VERSAO              INTEGER NOT NULL,' + 'DATA_SCRIPT         DATE,' +
      'ESTILO              VARCHAR(30),' + 'LINK_TREINAMENTO    VARCHAR(200),' +
      'TITULO_SISTEMA      VARCHAR(50),' + 'SUB_TITULO_SISTEMA  VARCHAR(100),' +
      'EMAIL_SUPORTE       VARCHAR(100),' + 'SITE                VARCHAR(100),'
      + 'FONE1               VARCHAR(14),' + 'FONE2               VARCHAR(14),'
      + 'CONTATO             VARCHAR(14));');
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

  end;

  MemoSql.Clear; // apaga chave estrangeira produto grade
  MemoSql.Text :=
    'ALTER TABLE PRODUTO_GRADE DROP CONSTRAINT FK_PRODUTO_GRADE_1;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TABLE COMANDA_ITENS;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TABLE COMANDA_RATEIO;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TABLE COMANDA_PESSOA;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TABLE COMANDA_MASTER;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TABLE MESA;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear; // apaga chave estrangeira produto grade
  MemoSql.Text := 'DROP TRIGGER VENDAS_DETALHE_BD0;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TRIGGER NFE_ATUALIZA_ESTOQUE;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear;
  MemoSql.Text := 'DROP TRIGGER BAIXA_ESTOQUE_REAL;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  MemoSql.Clear; // apaga chave estrangeira produto composicao
  MemoSql.Text :=
    'ALTER TABLE PRODUTO_COMPOSICAO DROP CONSTRAINT FK_PRODUTO_COMPOSICAO_1;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  try // apaga etiqueta_campos
    qryConsulta.Close;
    qryConsulta.SQL.Clear;
    qryConsulta.SQL.Text := 'select CARACTERES FROM  ETIQUETA_CAMPOS ;';
    qryConsulta.Open;
  except

    MemoSql.Clear;
    MemoSql.Text := 'DROP TABLE ETIQUETA_CAMPOS;';
    IBScript.ExecuteScript(MemoSql.Lines);

    MemoSql.Clear;
    MemoSql.Text := 'DROP TABLE ETIQUETAS;';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

  end;

  MemoSql.Clear; // apaga tabelas cbr_titulos
  MemoSql.Text := 'DROP TABLE CBR_TITULOS;';
  IBScript.ExecuteScript(MemoSql.Lines);

end;

procedure TfrmExecute.AtualizaCampos;
var
  i: Integer;
begin
  { atualiza vendedores }
  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select FLAG FROM  VENDEDORES; ';
    qryConsulta.Open;
  except

    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDEDORES ADD NOME1 VARCHAR(10);';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'UPDATE VENDEDORES SET NOME1=NOME';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDEDORES DROP NOME';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDEDORES ADD FLAG VARCHAR(1);';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDEDORES ADD NOME VARCHAR(40);';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'UPDATE VENDEDORES SET NOME=NOME1';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDEDORES DROP NOME1';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

  end;

  { atualiza tamanho preço nfce_detalhe }

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select CEST FROM  NFE_DETALHE; ';
    qryConsulta.Open;
  except
    MemoSql.Lines.Clear;
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE ADD CEST VARCHAR(8);');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE ADD PRECO1 DECIMAL(15,3);');
    MemoSql.Lines.Add('UPDATE NFE_DETALHE SET PRECO1=PRECO;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE DROP PRECO;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE ADD PRECO DECIMAL(15,3);');
    MemoSql.Lines.Add('UPDATE NFE_DETALHE SET PRECO=PRECO1;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE DROP PRECO1;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE ADD TOTAL1 DECIMAL(15,3);');
    MemoSql.Lines.Add('UPDATE NFE_DETALHE SET TOTAL1=TOTAL;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE DROP TOTAL;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE ADD TOTAL DECIMAL(15,3);');
    MemoSql.Lines.Add('UPDATE NFE_DETALHE SET TOTAL=TOTAL1;');
    MemoSql.Lines.Add('ALTER TABLE NFE_DETALHE DROP TOTAL1;');
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

end;

procedure TfrmExecute.ExecuteScript;
var
  i: Integer;
begin

  try

    Apaga_Campos_Tabelas;
    Apaga_Gatilhos;
    AtualizaCampos;
    UpdateNovo;
    UpdateAtualiza;
    Upd_01_05_2019;
    AtualizaTabelas;
    CriaGatilhos;
    AtualizaNumeroBoleto;

  except
    // faz nada
  end;

  dados.Conexao.CommitRetaining;

end;

procedure TfrmExecute.UpdateAtualiza;
var
  Local_i: Integer;
begin
  if MemoUpdate.Text <> '' then
  begin
    MemoSql.Clear;
    for Local_i := 0 to MemoUpdate.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoUpdate.Lines.Strings[Local_i]);
      if pos(';', MemoUpdate.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;
end;

procedure TfrmExecute.UpdateNovo;
var
  Local_i: Integer;
begin
  if MemoNovo.Text <> '' then
  begin
    MemoSql.Clear;
    for Local_i := 0 to MemoNovo.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoNovo.Lines.Strings[Local_i]);
      if pos(';', MemoNovo.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;
end;

procedure TfrmExecute.Upd_01_05_2019;
var
  Local_i: Integer;
begin
  try
    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('01/05/2019') then
    begin
      MemoSql.Clear;
      for Local_i := 0 to Memo5.Lines.Count - 1 do
      begin
        MemoSql.Lines.Add(Memo5.Lines.Strings[Local_i]);
        if pos(';', Memo5.Lines.Strings[Local_i]) > 0 then
        begin
          IBScript.ExecuteScript(MemoSql.Lines);
          dados.Conexao.Commit;
          MemoSql.Clear;
        end;
      end;
      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '01/05/2019';
      qryParametro.Post;
      dados.Conexao.Commit;
    end;
  except
  end;
end;

procedure TfrmExecute.AtualizaTabelas;
var
  Local_i: Integer;
  Local_i1: Integer;
  Local_i2: Integer;
  Local_i3: Integer;
  idPlano: Integer;
begin

  if not dados.qryEmpresa.IsEmpty then
  begin

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select * FROM  GRUPO  where 1=1';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      MemoSql.Clear;
      MemoSql.Text :=
        'INSERT INTO GRUPO (EMPRESA, CODIGO, DESCRICAO, ATIVO) VALUES (1,1, ''DIVERSOS'', ''S'');';
      IBScript.ExecuteScript(MemoSql.Lines);
      dados.Conexao.Commit;
    end;

  end;

  MemoSql.Clear;
  MemoSql.Text := 'ALTER TABLE EMPRESA ADD ID_PLANO_ABERTURA INTEGER;';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  if not dados.qryEmpresa.IsEmpty then
  begin

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select * FROM  UNIDADE  where 1=1';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      MemoSql.Clear;
      MemoSql.Text :=
        'INSERT INTO UNIDADE(CODIGO, DESCRICAO, FK_USUARIO) VALUES (''UN'', ''UNIDADE'', 1);';
      IBScript.ExecuteScript(MemoSql.Lines);
      dados.Conexao.Commit;
    end;

  end;

  qryConsulta.Close;
  MemoSql.Clear;
  MemoSql.Lines.Add
    ('ALTER TABLE CONFIG Add CONSTRAINT PK_CONFIG PRIMARY KEY(VERSAO);');
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;

  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select * FROM  marca  where 1=1';
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    MemoSql.Text :=
      'INSERT INTO MARCA (CODIGO, DESCRICAO, ATIVO) VALUES (1, ''DIVERSOS'', ''S'');';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select FLAG FROM  VENDAS_TERMINAIS; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    MemoSql.Text := 'ALTER TABLE VENDAS_TERMINAIS ADD FLAG VARCHAR(1);';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;

    MemoSql.Clear;
    MemoSql.Text := 'UPDATE VENDAS_TERMINAIS SET LOGADO=''N'';';
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select ORDEM FROM TELAS; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    for Local_i := 0 to MemoTela.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoTela.Lines.Strings[Local_i]);
      if pos(';', MemoTela.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select DESCRICAO_COMPLEMENTAR FROM NFE_DETALHE; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    for Local_i := 0 to MemoNFe.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoNFe.Lines.Strings[Local_i]);
      if pos(';', MemoNFe.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;

  try
    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select FLAG FROM PLANO; ';
    qryConsulta.Open;
  except
    MemoSql.Clear;
    for Local_i := 0 to MemoDescricaoPlano.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoDescricaoPlano.Lines.Strings[Local_i]);
      if pos(';', MemoDescricaoPlano.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;

  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select codigo from CST_IPI';
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    for Local_i := 0 to MemoIPI.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoIPI.Lines.Strings[Local_i]);
      if pos(';', MemoIPI.Lines.Strings[Local_i]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'select codigo from cst_icms where 1=1';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    IBScript.ExecuteScript(MemoCstICMS.Lines);
    dados.Conexao.Commit;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from plano where descricao=''BOLETO BANCÁRIO''';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    IBScript.ExecuteScript(MemoPlano.Lines);
    dados.Conexao.Commit;
  end;

  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'select codigo from PAISES where 1=1';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    IBScript.ExecuteScript(MemoPaises.Lines);
    dados.Conexao.Commit;
  end;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'select codigo from PAISES where 1=1';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    IBScript.ExecuteScript(MemoPaises.Lines);
    dados.Conexao.Commit;
  end;
  MemoSql.Lines.Clear;
  MemoSql.Lines.Text :=
    'UPDATE CONFIG SET ESTILO=''Sapphire Kamri'' WHERE (ESTILO IS NULL) OR (ESTILO=''Iceberg Classico'') OR (ESTILO=''SAPPHIRE KAMRI'')';
  IBScript.ExecuteScript(MemoSql.Lines);
  dados.Conexao.Commit;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from MOTIVO_DESONERACAO where 1=1';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    IBScript.ExecuteScript(MemoDesoneracao.Lines);
    dados.Conexao.Commit;
  end;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from pessoa where razao=''CONSUMIDOR FINAL''';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    MemoSql.Lines.Add
      (' INSERT INTO PESSOA (EMPRESA, CODIGO, TIPO, CNPJ, IE, FANTASIA, RAZAO, ENDERECO, NUMERO,');
    MemoSql.Lines.Add
      (' COMPLEMENTO, CODMUN, MUNICIPIO, BAIRRO, UF, CEP, FONE1, FONE2, CELULAR1, CELULAR2, EMAIL1, EMAIL2, SEXO,');
    MemoSql.Lines.Add
      (' DT_NASC, ECIVIL, LIMITE, DIA_PGTO, NUM_USU, FATURA, CHEQUE, CCF, SPC, ISENTO, FORN, FUN, CLI, FAB, TRAN, ADM,');
    MemoSql.Lines.Add
      (' ATIVO, DT_ADMISSAO, DT_DEMISSAO, SALARIO, PAI, MAE, BANCO, AGENCIA, GERENTE, FONE_GERENTE, PROPRIEDADE,');
    MemoSql.Lines.Add
      (' DT_CADASTRO, TECNICO, ATENDENTE, CODIGO_WEB, REFERENCIA)');
    MemoSql.Lines.Add
      (' VALUES (1, 1, ''FÍSICA'', '' '', '' '', ''CONSUMIDOR FINAL'', ''CONSUMIDOR FINAL'', '''', '''', NULL, 0, '''', '''', '''', '''', NULL, NULL, NULL,');
    MemoSql.Lines.Add
      (' NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, ''N'', ''N'', ''N'', ''N'', ''2'', ''N'', ''N'', ''S'', ''N'', ''N'', ''N'', ''S'', NULL, NULL, 0, NULL, NULL,');
    MemoSql.Lines.Add
      (' NULL, NULL, NULL, NULL, NULL, ''2019-04-24'', NULL, NULL, NULL, 1)');
    IBScript.ExecuteScript(MemoSql.Lines);
    dados.Conexao.Commit;
  end;
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select codigo from CSOSN';
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    for Local_i1 := 0 to MemoCSOSN.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoCSOSN.Lines.Strings[Local_i1]);
      if pos(';', MemoCSOSN.Lines.Strings[Local_i1]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select codigo from CTS_PIS_COFINS';
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    for Local_i2 := 0 to MemoPIS.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoPIS.Lines.Strings[Local_i2]);
      if pos(';', MemoPIS.Lines.Strings[Local_i2]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;

  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select ORIGEM from TABELA_ICMS';
  qryConsulta.Open;
  if qryConsulta.IsEmpty then
  begin
    MemoSql.Clear;
    for Local_i3 := 0 to MemoICMS.Lines.Count - 1 do
    begin
      MemoSql.Lines.Add(MemoICMS.Lines.Strings[Local_i3]);
      if pos(';', MemoICMS.Lines.Strings[Local_i3]) > 0 then
      begin
        IBScript.ExecuteScript(MemoSql.Lines);
        dados.Conexao.Commit;
        MemoSql.Clear;
      end;
    end;
  end;
end;

procedure TfrmExecute.CriaGatilhos;
var
  i: Integer;
begin
  MemoSql.Clear;
  for i := 0 to MemoGatilho.Lines.Count - 1 do
  begin
    MemoSql.Lines.Add(MemoGatilho.Lines.Strings[i]);
    if pos('end;', MemoGatilho.Lines.Strings[i]) > 0 then
    begin
      IBScript.ExecuteScript(MemoSql.Lines);
      dados.Conexao.Commit;
      MemoSql.Clear;
    end;
  end;
end;

procedure TfrmExecute.UsaBalanca;
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'SELECT FIRST 1 PREFIXO_BALANCA FROM PRODUTO WHERE (PREFIXO_BALANCA<>'''')';
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
  begin
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'UPDATE VENDAS_PARAMETROS SET PREFIXO_BALANCA=NULL';
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmExecute.FormCreate(Sender: TObject);
var
  vData: TDateTime;
begin

  try

    UsaBalanca;

    FileAge(ParamStr(0), vData);

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text := 'SELECT DATA_ATUALIZACAO FROM CONFIG';
    dados.qryConsulta.Open;

    if (dados.qryConsulta.FieldByName('DATA_ATUALIZACAO').AsDateTime < vData) or
      (dados.qryConsulta.FieldByName('DATA_ATUALIZACAO').IsNull) then
    begin
      ExecuteScript;

      dados.qryExecute.Close;
      dados.qryExecute.SQL.Text := 'UPDATE CONFIG SET DATA_ATUALIZACAO=:DATA';
      dados.qryExecute.Params[0].AsDateTime := now;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;

    end;

  except
    ExecuteScript;
  end;
end;

end.
