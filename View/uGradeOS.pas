unit uGradeOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmGradeOS = class(TForm)
    DBGrid1: TDBGrid;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    qryGradePRECO: TFMTBCDField;
    dsGrade: TDataSource;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    idGrade: Integer; { Public declarations }
    aPreco: Extended;
    procedure AbreGrade(aProduto: Integer);
  end;

var
  FrmGradeOS: TFrmGradeOS;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmGradeOS.DBGrid1DblClick(Sender: TObject);
begin
  idGrade := qryGradeCODIGO.Value;
  aPreco := qryGradePRECO.AsFloat;
  close;
end;

procedure TFrmGradeOS.AbreGrade(aProduto: Integer);
begin
  qryGrade.close;
  qryGrade.Params[0].Value := aProduto;
  qryGrade.Open;
end;

procedure TFrmGradeOS.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    idGrade := qryGradeCODIGO.Value;
    aPreco := qryGradePRECO.AsFloat;
    close;
  end;

end;

procedure TFrmGradeOS.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmGradeOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

end.
