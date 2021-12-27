unit uICMS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmICMS = class(TForm)
    qryICMS: TFDQuery;
    dsICMS: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    edtLoc: TEdit;
    qryICMSORIGEM: TStringField;
    qryICMSAC: TFMTBCDField;
    qryICMSAL: TFMTBCDField;
    qryICMSAM: TFMTBCDField;
    qryICMSAP: TFMTBCDField;
    qryICMSBA: TFMTBCDField;
    qryICMSCE: TFMTBCDField;
    qryICMSDF: TFMTBCDField;
    qryICMSES: TFMTBCDField;
    qryICMSGO: TFMTBCDField;
    qryICMSMA: TFMTBCDField;
    qryICMSMG: TFMTBCDField;
    qryICMSMS: TFMTBCDField;
    qryICMSMT: TFMTBCDField;
    qryICMSPA: TFMTBCDField;
    qryICMSPB: TFMTBCDField;
    qryICMSPE: TFMTBCDField;
    qryICMSP_I: TFMTBCDField;
    qryICMSPR: TFMTBCDField;
    qryICMSRJ: TFMTBCDField;
    qryICMSRO: TFMTBCDField;
    qryICMSRN: TFMTBCDField;
    qryICMSRR: TFMTBCDField;
    qryICMSRS: TFMTBCDField;
    qryICMSSC: TFMTBCDField;
    qryICMSSE: TFMTBCDField;
    qryICMSSP: TFMTBCDField;
    qryICMST_O: TFMTBCDField;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure qryICMSAfterPost(DataSet: TDataSet);
    procedure qryICMSBeforeDelete(DataSet: TDataSet);
    procedure qryICMSBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtLocChange(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    procedure localiza;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  FrmICMS: TFrmICMS;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmICMS.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmICMS.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGrid1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TFrmICMS.DBGrid1TitleClick(Column: TColumn);
begin

  edtLoc.SetFocus;

end;

procedure TFrmICMS.localiza;
begin
  qryICMS.close;
  qryICMS.Params[0].Value := edtLoc.Text + '%';
  qryICMS.Open;
end;

procedure TFrmICMS.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TFrmICMS.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryICMS.Prior;
  if Key = VK_DOWN then
    qryICMS.Next;

end;


procedure TFrmICMS.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f6 then
    edtLoc.SetFocus;

  if Key = vk_escape then
    close;
end;

procedure TFrmICMS.FormShow(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TFrmICMS.qryICMSAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmICMS.qryICMSBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

procedure TFrmICMS.qryICMSBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

end.
