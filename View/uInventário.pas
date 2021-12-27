unit uInventário;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dateutils,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxExportPDF, frxExportBaseDialog,
  Vcl.Grids, Vcl.DBGrids, frxExportXLS, frxExportXLSX;

type
  TFrmInventario = class(TForm)
    Panel3: TPanel;
    btnImp: TSpeedButton;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBInventario: TfrxDBDataset;
    qrySimples: TFDQuery;
    qryNormal: TFDQuery;
    qryNormalCODIGO: TStringField;
    qryNormalTRIBUTACAO: TStringField;
    qryNormalFK_PRODUTO: TIntegerField;
    qryNormalDESCRICAO: TStringField;
    qryNormalPR_CUSTO: TFMTBCDField;
    qryNormalQTDE: TFMTBCDField;
    qryNormalQTDS: TFMTBCDField;
    qryNormalSALDO: TFMTBCDField;
    qrySimplesCODIGO: TStringField;
    qrySimplesTRIBUTACAO: TStringField;
    qrySimplesFK_PRODUTO: TIntegerField;
    qrySimplesDESCRICAO: TStringField;
    qrySimplesPR_CUSTO: TFMTBCDField;
    qrySimplesQTDE: TFMTBCDField;
    qrySimplesQTDS: TFMTBCDField;
    qrySimplesSALDO: TFMTBCDField;
    frxDBTotal: TfrxDBDataset;
    qrySimplesTOTAL: TExtendedField;
    qryNormalTOTAL: TExtendedField;
    qryInventario: TFDQuery;
    qryInventarioFK_PRODUTO: TIntegerField;
    qryInventarioDESCRICAO: TStringField;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioTRIBUTACAO: TStringField;
    qryInventarioPR_CUSTO: TFMTBCDField;
    qryInventarioQTD: TFMTBCDField;
    qryInventarioTOTAL: TFMTBCDField;
    Panel1: TPanel;
    Label2: TLabel;
    edtLivro: TEdit;
    MaskInicio: TDateTimePicker;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    btnGerar: TSpeedButton;
    dsInventario: TDataSource;
    ProgressBar1: TProgressBar;
    edtLoc: TEdit;
    Label3: TLabel;
    qryTotais: TFDQuery;
    qryTotaisCODIGO: TIntegerField;
    qryTotaisTRIBUTACAO: TStringField;
    qryTotaisTOTAL: TFMTBCDField;
    frxXLSExport1: TfrxXLSExport;
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qryNormalCalcFields(DataSet: TDataSet);
    procedure qrySimplesCalcFields(DataSet: TDataSet);
    procedure btnGerarClick(Sender: TObject);
    procedure qryInventarioBeforePost(DataSet: TDataSet);
    procedure qryInventarioAfterPost(DataSet: TDataSet);
    procedure qryInventarioAfterDelete(DataSet: TDataSet);
    procedure edtLocChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    qtdReg: Integer;
    procedure CalculaTotais(Id: Integer; Descricao: String; Total: Extended);
    procedure FiltraDados;
    procedure InsereInventario;
    procedure LimpaInventario;
    procedure Localiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInventario: TFrmInventario;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmInventario.CalculaTotais(Id: Integer; Descricao: String;
  Total: Extended);
begin
  if qryTotais.Locate('CODIGO', Id, []) then
  begin
    qryTotais.Edit;
    qryTotaisTOTAL.AsFloat := qryTotaisTOTAL.AsFloat + Total;
    qryTotais.Post;
  end
  else
  begin
    qryTotais.Insert;
    qryTotaisCODIGO.Value := Id;
    qryTotaisTRIBUTACAO.Value := Descricao;
    qryTotaisTOTAL.AsFloat := Total;
    qryTotais.Post;
  end;
end;

procedure TFrmInventario.edtLocChange(Sender: TObject);
begin
  Localiza;
end;

procedure TFrmInventario.Localiza;
begin
  qryInventario.close;
  qryInventario.Params[0].Value := edtLoc.Text + '%';
  qryInventario.Open;
end;

procedure TFrmInventario.FiltraDados;
begin

  if Dados.qryEmpresaCRT.Value = 1 then
  begin

    qrySimples.close;
    qrySimples.Params[0].Value := MaskInicio.Date;
    qrySimples.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
    qrySimples.Open;
    qtdReg := qrySimples.RecordCount;
  end
  else
  begin

    qryNormal.close;
    qryNormal.Params[0].Value := MaskInicio.Date;
    qryNormal.Params[1].Value := Dados.qryEmpresaCODIGO.Value;
    qryNormal.Open;
    qtdReg := qryNormal.RecordCount;
  end;
end;

procedure TFrmInventario.LimpaInventario;
begin
  Dados.qryExecute.SQL.Text := 'DELETE FROM INVENTARIO';
  Dados.qryExecute.ExecSQL;
  Dados.Conexao.CommitRetaining;
  qryInventario.Refresh;
end;

procedure TFrmInventario.InsereInventario;
begin
  ProgressBar1.Position := 1;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := qtdReg;
  if Dados.qryEmpresaCRT.Value = 1 then
  begin
    qrySimples.First;
    while not qrySimples.Eof do
    begin
      qryInventario.Insert;
      qryInventarioFK_PRODUTO.Value := qrySimplesFK_PRODUTO.Value;
      qryInventarioDESCRICAO.Value := qrySimplesDESCRICAO.Value;
      qryInventarioCODIGO.Value := qrySimplesCODIGO.AsInteger;
      qryInventarioTRIBUTACAO.Value := qrySimplesTRIBUTACAO.Value;
      qryInventarioPR_CUSTO.AsFloat := qrySimplesPR_CUSTO.AsFloat;
      qryInventarioQTD.AsFloat := qrySimplesSALDO.AsFloat;
      qryInventario.Post;
      Dados.Conexao.CommitRetaining;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      qrySimples.Next;
    end;
  end
  else
  begin
    qryNormal.First;
    while not qryNormal.Eof do
    begin
      qryInventario.Insert;
      qryInventarioFK_PRODUTO.Value := qryNormalFK_PRODUTO.Value;
      qryInventarioDESCRICAO.Value := qryNormalDESCRICAO.Value;
      qryInventarioCODIGO.Value := qryNormalCODIGO.AsInteger;
      qryInventarioTRIBUTACAO.Value := qryNormalTRIBUTACAO.Value;
      qryInventarioPR_CUSTO.AsFloat := qryNormalPR_CUSTO.AsFloat;
      qryInventarioQTD.AsFloat := qryNormalSALDO.AsFloat;
      qryInventario.Post;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      qryNormal.Next;
    end;

  end;
end;

procedure TFrmInventario.btnGerarClick(Sender: TObject);
begin
  if application.messageBox
    ('Atenção! Todos os lançamentos e alterações inventários serão excluidos!' +
    sLineBreak + 'Deseja continuar?', 'Confirmação', mb_YesNo) = mrNo then
    exit;

  try
    btnGerar.Enabled := False;

    FiltraDados;
    LimpaInventario;
    InsereInventario;
    ShowMessage('Inventário gerado com sucesso!');
    btnGerar.Enabled := true;
    qryInventario.Refresh;
  except
    on e: exception do
      raise exception.Create(e.Message);

  end;

end;

procedure TFrmInventario.btnImpClick(Sender: TObject);
begin

  qryTotais.close;
  qryTotais.Open;

  frxReport.LoadFromFile(ExtractFilePath(application.ExeName) +
    '\Relatorio\RelInventario.fr3');
  frxReport.ShowReport;

end;

procedure TFrmInventario.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TFrmInventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f3 then
    btnGerar.Click;
  if Key = vk_f4 then
    btnImp.Click;
end;

procedure TFrmInventario.FormShow(Sender: TObject);
begin
  MaskInicio.Date := EndOfTheYear(Date);
  Localiza;
end;

procedure TFrmInventario.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName = 'PARAMETRO' then
    Value := ' Inventário Ref. ' + FormatDateTime('YYYY', MaskInicio.Date);
  if VarName = 'LIVRO' then
    Value := edtLivro.Text;
  if VarName = 'DATA' then
    Value := DateToStr(MaskInicio.Date);
end;

procedure TFrmInventario.qryInventarioAfterDelete(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TFrmInventario.qryInventarioAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TFrmInventario.qryInventarioBeforePost(DataSet: TDataSet);
begin
  qryInventarioTOTAL.AsFloat := qryInventarioPR_CUSTO.AsFloat *
    qryInventarioQTD.AsFloat;
end;

procedure TFrmInventario.qryNormalCalcFields(DataSet: TDataSet);
begin
  qryNormalTOTAL.AsFloat := qryNormalPR_CUSTO.AsFloat * qryNormalSALDO.AsFloat;

end;

procedure TFrmInventario.qrySimplesCalcFields(DataSet: TDataSet);
begin
  qrySimplesTOTAL.AsFloat := qrySimplesPR_CUSTO.AsFloat *
    qrySimplesSALDO.AsFloat;
end;

end.
