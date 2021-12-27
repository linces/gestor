unit uEstrutura_DB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, inifiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Vcl.StdCtrls,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FDZabuuReplicator;

type
  TFrmEstrutura = class(TForm)
    qryBuscaTabelas: TFDQuery;
    qryBuscaTabelasTABELAS: TWideStringField;
    qryExecute: TFDScript;
    TabPage: TPageControl;
    TabLista: TTabSheet;
    TabScript: TTabSheet;
    Memo1: TMemo;
    MemoScript: TMemo;
    MainMenu1: TMainMenu;
    CriarEstruturadoReplicadorCliente1: TMenuItem;
    CriarEstruturadoReplicadorCliente2: TMenuItem;
    RemoverEstruturaCliente1: TMenuItem;
    Sair1: TMenuItem;
    qryBuscaTabelasCAMPO: TWideStringField;
    qryEmpresa: TFDQuery;
    qryEmpresaFK_FILIAL: TIntegerField;
    N1: TMenuItem;
    qryTabelas: TFDQuery;
    TbConfig: TTabSheet;
    dsTabelas: TDataSource;
    LimpaCacheReplicao1: TMenuItem;
    qryTabelasCODIGO: TIntegerField;
    qryTabelasTABELA: TStringField;
    qryTabelasENVIA: TStringField;
    qryTabelasRECEBE: TStringField;
    FDZabuuReplicator1: TFDZabuuReplicator;
    dsBancoTable: TDataSource;
    BancosTable: TFDTable;
    BancosTableID: TIntegerField;
    BancosTableDESCRICAO: TStringField;
    BancosTableHOST: TStringField;
    BancosTablePATH: TStringField;
    BancosTableUSUARIO: TStringField;
    BancosTableSENHA: TStringField;
    BancosTableROLE: TStringField;
    BancosTablePORT: TIntegerField;
    BancosTableENVIAR: TIntegerField;
    BancosTableRECEBER: TIntegerField;
    BancosTablePRIORIDADE: TSmallintField;
    BancosTableTABELASENVIA: TStringField;
    BancosTableTABELASRECEBE: TStringField;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Tabelas: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Conexao: TFDConnection;
    qryTabelasORDEM: TIntegerField;
    DBGrid3: TDBGrid;
    qryTabelasFK_SERVIDOR: TIntegerField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    qryAux: TFDQuery;
    qryAuxCODIGO: TIntegerField;
    qryAuxTABELA: TStringField;
    qryAuxENVIA: TStringField;
    qryAuxRECEBE: TStringField;
    qryAuxORDEM: TIntegerField;
    qryAuxFK_SERVIDOR: TIntegerField;
    qryNumerador: TFDQuery;
    FBDriver: TFDPhysFBDriverLink;
    procedure CriarEstruturadoReplicadorCliente2Click(Sender: TObject);
    procedure RemoverEstruturaCliente1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaCacheReplicao1Click(Sender: TObject);
    procedure FDZabuuReplicator1Log(Value: string);
    procedure qryTabelasAfterPost(DataSet: TDataSet);
    procedure qryTabelasAfterDelete(DataSet: TDataSet);
    procedure qryTabelasBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsBancoTableDataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure CriaIDREGISTRO;
    procedure GeraNumeroID(Tabela, Campo: String);
    procedure CriaCampos;
    procedure AtualizaGID;
    procedure CriandoGatilhosCliente;
    Procedure AtualizaTabelas(id: integer);
    procedure Lista_Envia_Recebe(id: integer);
    procedure fnc_lerConfiguracoes;
    procedure fnc_registraConfiguracoes;
    procedure ClonaeTabela(id: integer);
    function Numerador(Tabela, Campo, filtra, where, Valor: String): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEstrutura: TFrmEstrutura;

implementation

{$R *.dfm}

procedure TFrmEstrutura.fnc_registraConfiguracoes;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Banco.Ini');
  try
    Ini.WriteInteger('REPLICACAO', 'LIMITE', FDZabuuReplicator1.Limit);
    Ini.WriteString('REPLICACAO', 'APLICACAO',
      FDZabuuReplicator1.ApplicationName);
    // Ini.WriteString('REPLICACAO', 'SERVIDOR', FDZabuuReplicator1.Host);
    // Ini.WriteString('REPLICACAO', 'SENHA', FDZabuuReplicator1.Password);
    Ini.WriteString('REPLICACAO', 'PORTA', FDZabuuReplicator1.Port);
    // Ini.WriteString('REPLICACAO', 'USUARIO', FDZabuuReplicator1.User);
    Ini.WriteString('REPLICACAO', 'VENDORLIB', FDZabuuReplicator1.VendorLib);
  finally
    Ini.Free;
  end;
end;

procedure TFrmEstrutura.fnc_lerConfiguracoes;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Banco.Ini');
  try
    FDZabuuReplicator1.Limit := Ini.ReadInteger('REPLICACAO', 'LIMITE', 50);
    FDZabuuReplicator1.ApplicationName := Ini.ReadString('REPLICACAO',
      'APLICACAO', 'Replicador.exe');
    FDZabuuReplicator1.Host := 'localhost';
    // Ini.ReadString('REPLICACAO', 'SERVIDOR', 'localhost');
    FDZabuuReplicator1.Password := 'masterkey';
    // Ini.ReadString('REPLICACAO', 'SENHA', 'masterkey');
    FDZabuuReplicator1.User := 'SYSDBA';
    // Ini.ReadString('REPLICACAO', 'USUARIO','SYSDBA');
    FDZabuuReplicator1.Path := ExtractFileDir(Application.ExeName) +
      '\DADOS\REPLICADOR.FDB';
    FDZabuuReplicator1.Port := Ini.ReadString('REPLIICACAO', 'PORTA', '3050');
    FDZabuuReplicator1.VendorLib := Ini.ReadString('REPLICACAO',
      'VENDORLIB', '');

    Conexao.Params.Values['DriverID'] := 'FB';
    Conexao.Params.Values['Server'] := Ini.ReadString('BD', 'IP', '');
    Conexao.Params.Values['Database'] := Ini.ReadString('BD', 'Path', '');
    FBDriver.VendorLib := ExtractFilePath(Application.ExeName) + 'fbclient.dll';

  finally
    Ini.Free;
  end;

end;

procedure TFrmEstrutura.RemoverEstruturaCliente1Click(Sender: TObject);
begin
  TabPage.ActivePage := TabLista;

  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  while not qryBuscaTabelas.eof do
  begin

    if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
      (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
      (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
      (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
      (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
      (qryBuscaTabelasTABELAS.Value <> 'TABELA') AND
      (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add('DROP TRIGGER ' + qryBuscaTabelasTABELAS.AsString
        + '_BI');
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('DROP TRIGGER ' + qryBuscaTabelasTABELAS.AsString
        + '_AI');
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('DROP TRIGGER TRG_GEN_' +
        qryBuscaTabelasTABELAS.AsString);
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('DROP TRIGGER RPL_' + qryBuscaTabelasTABELAS.AsString);
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      MemoScript.Lines.Add('APAGANDO GATILHOS TABELAS ' +
        qryBuscaTabelasTABELAS.AsString);
    end;

    qryBuscaTabelas.Next;
  end;

  MemoScript.Clear;
  FDZabuuReplicator1.removeReplicationStructure;

  Close;

end;

procedure TFrmEstrutura.CriaIDREGISTRO;
begin
  Memo1.Clear;

  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  while not qryBuscaTabelas.eof do
  begin

    if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
      (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
      (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
      (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
      (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
      (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'TABELA') AND
      (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
    begin

      // cria gatilho
      Memo1.Lines.Clear;
      Memo1.Lines.Add('create trigger ' + qryBuscaTabelasTABELAS.AsString +
        '_BI for ' + qryBuscaTabelasTABELAS.AsString);
      Memo1.Lines.Add('active before insert or update position 0');
      Memo1.Lines.Add('as');
      Memo1.Lines.Add('begin');
      Memo1.Lines.Add('if (new.GID is null) then');
      Memo1.Lines.Add('new.GID = UUID_TO_CHAR( gen_uuid());');
      Memo1.Lines.Add('end');
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      MemoScript.Lines.Add('CRIANDO TRIGER GID - ' +
        qryBuscaTabelasTABELAS.AsString);
    end;

    qryBuscaTabelas.Next;
  end;
end;

procedure TFrmEstrutura.CriandoGatilhosCliente;
var
  SQL: string;
begin

  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  Memo1.Clear;
  MemoScript.Clear;

  while not qryBuscaTabelas.eof do
  begin
    if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
      (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
      (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
      (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
      (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
      (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'TABELA') AND
      (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
    begin

      Memo1.Lines.Clear;
      Memo1.Lines.Add('CREATE trigger rpl_' + qryBuscaTabelasTABELAS.AsString +
        ' for ' + qryBuscaTabelasTABELAS.AsString);
      Memo1.Lines.Add('active after insert or update or delete position 0');
      Memo1.Lines.Add('AS');
      Memo1.Lines.Add('DECLARE VARIABLE ENVIA_DADOS varchar(1);');
      Memo1.Lines.Add('begin');
      Memo1.Lines.Add('');

      Memo1.Lines.Add('select ENVIA from TABELA WHERE TABELA=' +
        QuotedStr(qryBuscaTabelasTABELAS.AsString) + ' into :ENVIA_DADOS;');

      Memo1.Lines.Add('if (:ENVIA_DADOS=''S'') then begin');
      Memo1.Lines.Add(' if (inserting) then begin');
      Memo1.Lines.Add('  insert into replicacao(TIPO, GID, TABELA)');
      Memo1.Lines.Add('  VALUES (''I'',' + 'NEW.GID,' +
        QuotedStr(qryBuscaTabelasTABELAS.Value) + ');');

      Memo1.Lines.Add(' end');

      // atualizando dados

      Memo1.Lines.Add('if (updating) then begin');
      Memo1.Lines.Add('   insert into replicacao(TIPO, GID, TABELA)');
      Memo1.Lines.Add('   VALUES (''U'',' + 'NEW.GID,' +
        QuotedStr(qryBuscaTabelasTABELAS.Value) + ');');
      Memo1.Lines.Add('end');

      // deletando dados

      Memo1.Lines.Add(' if (deleting) then begin');
      Memo1.Lines.Add('   insert into replicacao(TIPO, GID, TABELA)');
      Memo1.Lines.Add('   VALUES (''D'',' + 'OLD.GID,' +
        QuotedStr(qryBuscaTabelasTABELAS.Value) + ');');

      Memo1.Lines.Add('  end');
      Memo1.Lines.Add(' end');
      Memo1.Lines.Add('end');
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);

      Conexao.COMMIT;

      MemoScript.Lines.Add('CRIANDO TRIGER REPLICACAO - ' +
        qryBuscaTabelasTABELAS.AsString);
    end;

    qryBuscaTabelas.Next;
  end;
end;

procedure TFrmEstrutura.CriaCampos;
begin
  Memo1.Clear;

  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  while not qryBuscaTabelas.eof do
  begin

    if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
      (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
      (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
      (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
      (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
      (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
      (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
      (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
      (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
      (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
    begin

      // cria guid
      Memo1.Lines.Clear;
      Memo1.Lines.Add('ALTER TABLE ' + qryBuscaTabelasTABELAS.AsString +
        ' ADD GID VARCHAR(38)');
      qryExecute.ExecuteScript(Memo1.Lines);

      Conexao.COMMIT;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('ALTER TABLE ' + qryBuscaTabelasTABELAS.AsString +
        ' ADD SINCRONIZA_DADOS VARCHAR(1)');
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      MemoScript.Lines.Add('CRIANDO CAMPO GID - ' +
        qryBuscaTabelasTABELAS.AsString);

    end;
    qryBuscaTabelas.Next;
  end;
end;

procedure TFrmEstrutura.FDZabuuReplicator1Log(Value: string);
begin
  MemoScript.Lines.Add(FormatDateTime('hh:nn:ss', now) + ' - ' + Value);
end;

procedure TFrmEstrutura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fnc_registraConfiguracoes;
end;

procedure TFrmEstrutura.FormCreate(Sender: TObject);
begin
  fnc_lerConfiguracoes;
end;

procedure TFrmEstrutura.FormShow(Sender: TObject);
begin

  if not qryTabelas.active then
    qryTabelas.Open;

  if not BancosTable.active then
    BancosTable.Open;

end;

procedure TFrmEstrutura.AtualizaGID;
begin
  Memo1.Clear;
  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
    (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
    (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
    (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
    (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
    (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
    (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
    (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
    (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
    (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
    (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
    (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
    (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
    (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
  begin

    while not qryBuscaTabelas.eof do
    begin

      Memo1.Lines.Clear;
      Memo1.Lines.Add('update ' + qryBuscaTabelasTABELAS.AsString +
        ' set SINCRONIZA_DADOS=''N'' WHERE SINCRONIZA_DADOS IS NULL');
      qryExecute.ExecuteScript(Memo1.Lines);
      Conexao.COMMIT;

      MemoScript.Lines.Add('ATUALIZANDO TABELAS - ' +
        qryBuscaTabelasTABELAS.AsString);

      qryBuscaTabelas.Next;

    end;
  end;
end;

Procedure TFrmEstrutura.AtualizaTabelas(id: integer);
begin

  Memo1.Clear;

  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;

  qryBuscaTabelas.First;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  while not qryBuscaTabelas.eof do
  begin
    if not qryTabelas.Locate('TABELA', qryBuscaTabelasTABELAS.Value, []) then
    begin
      if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
        (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
        (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
        (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
        (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
        (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
        (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
        (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
        (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
        (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
        (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
        (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
        (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
        (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
        (qryBuscaTabelasTABELAS.Value <> 'BENEFICIO_FISCAL') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_CONFIG') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_REMESSA') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_REMESSA_TITULOS') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_RETORNO') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_RETORNO_TITULOS') AND
        (qryBuscaTabelasTABELAS.Value <> 'CBR_TITULOS') AND
        (qryBuscaTabelasTABELAS.Value <> 'CFOP') AND
        (qryBuscaTabelasTABELAS.Value <> 'CHAVE') AND
        (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
        (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
        (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
      begin
        qryTabelas.Insert;
        qryTabelas.FieldByName('CODIGO').Value := Numerador('TABELA', 'CODIGO',
          'N', '', '');
        qryTabelas.FieldByName('TABELA').Value := qryBuscaTabelasTABELAS.Value;
        qryTabelas.FieldByName('ENVIA').Value := 'N';
        qryTabelas.FieldByName('RECEBE').Value := 'N';
        qryTabelas.FieldByName('FK_SERVIDOR').Value := id;
        qryTabelas.FieldByName('ORDEM').Value := Numerador('TABELA', 'ORDEM',
          'N', '', '');
        qryTabelas.Post;
        Conexao.CommitRetaining;
      end;
    end;
    qryBuscaTabelas.Next;
  end;

  qryTabelas.Refresh;

end;

procedure TFrmEstrutura.ClonaeTabela(id: integer);
begin

  BancosTable.First;

  while not BancosTable.eof do
  begin

    qryAux.Close;
    qryAux.Params[0].Value := id;
    qryAux.Open;

    if qryTabelas.IsEmpty then
    begin

      while not qryAux.eof do
      begin

        if not qryTabelas.Locate('TABELA', qryAuxTABELA.Value, []) then
        begin
          qryTabelas.Insert;
          qryTabelas.FieldByName('CODIGO').Value :=
            Numerador('TABELA', 'CODIGO', 'N', '', '');
          qryTabelas.FieldByName('TABELA').Value := qryAuxTABELA.Value;
          qryTabelas.FieldByName('ENVIA').Value := qryAuxENVIA.Value;
          qryTabelas.FieldByName('RECEBE').Value := qryAuxRECEBE.Value;
          qryTabelas.FieldByName('FK_SERVIDOR').Value := BancosTableID.Value;
          qryTabelas.FieldByName('ORDEM').Value := qryAuxORDEM.Value;
          qryTabelas.Post;
          Conexao.CommitRetaining;
        end;

        qryAux.Next;

      end;

    end;

    Lista_Envia_Recebe(BancosTableID.Value);

    BancosTable.Next;

  end;

  qryTabelas.Refresh;
end;

procedure TFrmEstrutura.Button1Click(Sender: TObject);
begin
  try
    Button1.Enabled := false;
    BancosTable.First;
    ClonaeTabela(BancosTableID.Value);
  finally
    Button1.Enabled := true;
  end;

end;

procedure TFrmEstrutura.Button2Click(Sender: TObject);
begin
  try
    Button2.Enabled := false;
    AtualizaTabelas(BancosTableID.Value);
    Lista_Envia_Recebe(BancosTableID.Value);
  finally
    Button2.Enabled := true;
  end;
end;

procedure TFrmEstrutura.Lista_Envia_Recebe(id: integer);
var
  TEnvia, TRecebe: String;
begin
  try
    qryTabelas.DisableControls;
    qryTabelas.First;

    TEnvia := '';
    TRecebe := '';
    while not qryTabelas.eof do
    begin

      BancosTable.Edit;
      if qryTabelas.FieldByName('ENVIA').Value = 'S' then
        TEnvia := TEnvia + qryTabelas.FieldByName('TABELA').Value + ',';

      if qryTabelas.FieldByName('RECEBE').Value = 'S' then
        TRecebe := TRecebe + qryTabelas.FieldByName('TABELA').Value + ',';

      qryTabelas.Next;

    end;
  finally

    qryTabelas.EnableControls;

    BancosTable.Locate('ID', id, []);
    BancosTable.Edit;
    BancosTableTABELASENVIA.Value := copy(TEnvia, 1, length(TEnvia) - 1);
    BancosTableTABELASRECEBE.Value := copy(TRecebe, 1, length(TRecebe) - 1);
    BancosTable.Post;
    Conexao.CommitRetaining;

  end;
end;

function TFrmEstrutura.Numerador(Tabela, Campo, filtra, where,
  Valor: String): integer;
begin
  Result := 0;
  if filtra = 'N' then
  begin
    qryNumerador.Close;

    qryNumerador.SQL.Text := 'SELECT MAX(' + Campo + ')MAIOR FROM ' + Tabela;
    qryNumerador.Open;
  end;
  if filtra = 'S' then
  begin
    qryNumerador.Close;
    qryNumerador.SQL.Text := 'SELECT MAX(' + Campo + ')MAIOR FROM ' + Tabela +
      ' WHERE ' + where + '=' + Valor;
    qryNumerador.Open;
  end;
  Result := qryNumerador.Fields[0].AsInteger + 1;

end;

procedure TFrmEstrutura.GeraNumeroID(Tabela, Campo: String);
begin
  Memo1.Clear;
  qryBuscaTabelas.Close;
  qryBuscaTabelas.Open;
  qryBuscaTabelas.Last;

  qryBuscaTabelas.First;

  if (qryBuscaTabelasTABELAS.Value <> 'REPLICACAO') AND
    (qryBuscaTabelasTABELAS.Value <> 'VENDAS_TERMINAIS') AND
    (qryBuscaTabelasTABELAS.Value <> 'PEMISSOES') AND
    (qryBuscaTabelasTABELAS.Value <> 'USUARIOS') AND
    (qryBuscaTabelasTABELAS.Value <> 'CONFIG') AND
    (qryBuscaTabelasTABELAS.Value <> 'CIDADE') AND
    (qryBuscaTabelasTABELAS.Value <> 'CURVA_ABC') AND
    (qryBuscaTabelasTABELAS.Value <> 'LOG_DETALHE') AND
    (qryBuscaTabelasTABELAS.Value <> 'LOG_MASTER') AND
    (qryBuscaTabelasTABELAS.Value <> 'XMLPRODUTO') AND
    (qryBuscaTabelasTABELAS.Value <> 'XML_DETAIL') AND
    (qryBuscaTabelasTABELAS.Value <> 'XML_MASTER') AND
    (qryBuscaTabelasTABELAS.Value <> 'TELAS') AND
    (qryBuscaTabelasTABELAS.Value <> 'TRADUTOR') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETAS') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_CAMPOS') AND
    (qryBuscaTabelasTABELAS.Value <> 'ETIQUETA_IMPRESSAO') then
  begin

    while not qryBuscaTabelas.eof do
    begin

      Tabela := qryBuscaTabelasTABELAS.Value;
      Campo := qryBuscaTabelasCAMPO.Value;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('Create OR ALTER TRIGGER TRG_GEN_' + Tabela);
      Memo1.Lines.Add(' FOR ' + Tabela +
        ' ACTIVE BEFORE INSERT POSITION 0 as DECLARE VARIABLE CODIGO integer;');
      Memo1.Lines.Add('begin');
      Memo1.Lines.Add('select COALESCE(MAX(' + Campo + '),0) AS ' + Campo +
        ' FROM ' + Tabela + ' into :CODIGO;');
      Memo1.Lines.Add('new.' + Campo + ' = :CODIGO + 1;');
      Memo1.Lines.Add('end');
      qryExecute.SQLScripts.Clear;
      qryExecute.ExecuteScript(Memo1.Lines);

      Conexao.COMMIT;

      MemoScript.Lines.Add('CRIANDO TRIGER TRG_GEN - ' +
        qryBuscaTabelasTABELAS.AsString);
      qryBuscaTabelas.Next;
    end;
  end;
end;

procedure TFrmEstrutura.LimpaCacheReplicao1Click(Sender: TObject);
begin
  FDZabuuReplicator1.ClearReplicateBank;
end;

procedure TFrmEstrutura.qryTabelasAfterDelete(DataSet: TDataSet);
begin
  Conexao.CommitRetaining;
end;

procedure TFrmEstrutura.qryTabelasAfterPost(DataSet: TDataSet);
begin
  Conexao.CommitRetaining;
end;

procedure TFrmEstrutura.qryTabelasBeforePost(DataSet: TDataSet);
begin
  qryTabelas.FieldByName('ENVIA').Value :=
    UpperCase(qryTabelas.FieldByName('ENVIA').Value);

  qryTabelas.FieldByName('RECEBE').Value :=
    UpperCase(qryTabelas.FieldByName('RECEBE').Value);

end;

procedure TFrmEstrutura.CriarEstruturadoReplicadorCliente2Click
  (Sender: TObject);
begin
  TabPage.ActivePage := TabLista;

  MemoScript.Clear;
  CriaCampos;

  MemoScript.Clear;
  CriaIDREGISTRO;

  MemoScript.Clear;
  AtualizaGID;

  MemoScript.Clear;
  GeraNumeroID('', '');

  MemoScript.Clear;
  FDZabuuReplicator1.ApplyMetadataBankReplicator;

  MemoScript.Clear;
  FDZabuuReplicator1.ApplyMetadata;

end;

procedure TFrmEstrutura.dsBancoTableDataChange(Sender: TObject; Field: TField);
begin
  qryTabelas.Close;
  qryTabelas.Params[0].Value := BancosTableID.Value;
  qryTabelas.Open;
end;

end.
