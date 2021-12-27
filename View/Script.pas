Unit Script;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, SqlExpr, IniFiles, ComCtrls, ExtCtrls,
  FMTBcd, Buttons, Data.DBXInterBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.VCLUI.Error, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, FireDAC.VCLUI.Script,
  IBX.IBScript, IBX.IBDatabase, dbcDBEngine, dbcConnection_IBX, dbcClasses,
  dbcSQL_Exec, dbcIBSQLExec, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmScript = class(TForm)
    PageControl1: TPageControl;
    Memo2: TMemo;
    TabSheet4: TTabSheet;
    MemoNovo: TMemo;
    TabSheet3: TTabSheet;
    MemoIPI: TMemo;
    TabSheet5: TTabSheet;
    MemoCSOSN: TMemo;
    TabSheet6: TTabSheet;
    MemoPIS: TMemo;
    TabSheet8: TTabSheet;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    MemoICMS: TMemo;
    TabSheet11: TTabSheet;
    Memo7: TMemo;
    TabSheet12: TTabSheet;
    Memo8: TMemo;
    TabSheet2: TTabSheet;
    Memo3: TMemo;
    TabSheet7: TTabSheet;
    memo: TTabSheet;
    Memo4: TMemo;
    Memo5: TMemo;
    Base: TIBDatabase;
    Conexao: TDBCConnectionIBX;
    IBScript: TIBSQLExec;
    qryParametro: TIBDataSet;
    qryConsulta: TIBQuery;
    qryParametroVERSAO: TIntegerField;
    qryParametroDATA_SCRIPT: TDateField;
    qryParametroPARAMETROS: TWideMemoField;
    qryParametroSERVIDOR: TIBStringField;
    qryParametroCAMINHO: TIBStringField;
    qryParametroESTILO: TIBStringField;
    qryParametroLINK_TREINAMENTO: TIBStringField;
    qryParametroTITULO_SISTEMA: TIBStringField;
    qryParametroSUB_TITULO_SISTEMA: TIBStringField;
    qryParametroEMAIL_SUPORTE: TIBStringField;
    qryParametroSITE: TIBStringField;
    qryParametroFONE1: TIBStringField;
    qryParametroFONE2: TIBStringField;
    qryParametroCONTATO: TIBStringField;
    qryParametroICONE: TBlobField;
    qryParametroSPLASH: TBlobField;
    IBTrans: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure IBScriptExecuteError(Sender: TObject; Error, SQLText: string;
      LineIndex: Integer; var Ignore: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmScript: TFrmScript;

implementation

{$R *.dfm}

procedure TFrmScript.FormCreate(Sender: TObject);
var
  iArq: TIniFile;
  nTentativas: word;
begin

  try
    nTentativas := 1;
    iArq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Banco.ini');
    Base.DatabaseName := iArq.ReadString('BD', 'IP', '') + ':' +
      iArq.ReadString('BD', 'Path', '');
    Width := 1;
    Height := 1;
    Repaint;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select BALANCA_VELOCIDADE FROM  VENDAS_TERMINAIS ';
    qryConsulta.Open;
    if qryConsulta.Fields[0].IsNull then
    begin
      IBScript.LoadScript
        ('ALTER TABLE VENDAS_TERMINAIS DROP BALANCA_VELOCIDADE');
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select BALANCA_DATABITS FROM  VENDAS_TERMINAIS ';
    qryConsulta.Open;
    if qryConsulta.Fields[0].IsNull then
    begin
      IBScript.LoadScript('ALTER TABLE VENDAS_TERMINAIS DROP BALANCA_DATABITS');
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    if MemoNovo.Text <> '' then
    begin
      IBScript.LoadScript(MemoNovo.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    if Memo4.Text <> '' then
    begin
      IBScript.LoadScript(Memo4.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    qryParametro.Close;
    qryParametro.Open;

    if qryParametro.IsEmpty then
    begin
      qryParametro.Insert;
      if qryParametroVERSAO.IsNull then
        qryParametroVERSAO.Value := 1;
      qryParametroDATA_SCRIPT.AsString := '01/01/1900';
      qryParametro.Post;
    end;
    IBTrans.CommitRetaining;

    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('01/01/2018') then
    begin

      IBScript.LoadScript(Memo2.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '01/01/2018';
      qryParametro.Post;
      IBTrans.CommitRetaining;
    end;

    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('01/11/2018') then
    begin

      IBScript.LoadScript(Memo7.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '01/11/2018';
      qryParametro.Post;
      IBTrans.CommitRetaining;
    end;

    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('31/12/2018') then
    begin

      IBScript.LoadScript(Memo8.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '31/12/2018';
      qryParametro.Post;
      IBTrans.CommitRetaining;
    end;

    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('01/03/2019') then
    begin

      IBScript.LoadScript(Memo3.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '01/03/2019';
      qryParametro.Post;
      IBTrans.CommitRetaining;
    end;

    if qryParametroDATA_SCRIPT.AsDateTime < strtodate('01/05/2019') then
    begin

      IBScript.LoadScript(Memo5.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

      qryParametro.Edit;
      qryParametroDATA_SCRIPT.AsString := '01/05/2019';
      qryParametro.Post;
      IBTrans.CommitRetaining;
    end;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select codigo from CST_IPI';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      IBScript.LoadScript(MemoIPI.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select codigo from CSOSN';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      IBScript.LoadScript(MemoCSOSN.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;

    end;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select codigo from CTS_PIS_COFINS';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      IBScript.LoadScript(MemoPIS.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

    qryConsulta.Close;
    qryConsulta.SQL.Text := 'select ORIGEM from TABELA_ICMS';
    qryConsulta.Open;
    if qryConsulta.IsEmpty then
    begin
      IBScript.LoadScript(MemoICMS.Lines);
      IBScript.ExecuteScript;
      Conexao.Commit;
    end;

  except
    // nada
  end;
end;

procedure TFrmScript.IBScriptExecuteError(Sender: TObject;
  Error, SQLText: string; LineIndex: Integer; var Ignore: Boolean);
begin
  Memo2.Lines.Add(SQLText);
  Memo2.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + 'Erros.txt');
end;

end.
