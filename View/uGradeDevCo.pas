unit uGradeDevCo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, JvExDBGrids, JvDBGrid, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TFrmGradeDevCO = class(TForm)
    dsGrade: TDataSource;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_COMPRA: TIntegerField;
    qryGradeFK_ITENS_COMPRA: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeFK_GRADE: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    lblQtdItem: TLabel;
    lblQtdTotal: TLabel;
    edtQTD: TEdit;
    DBEdit1: TDBEdit;
    qryGradeTTOTAL: TAggregateField;
    qryGradeFK_DEVOLUCAO: TIntegerField;
    qryGradeQTD_DEVOLVIDA: TFMTBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryGradeAfterPost(DataSet: TDataSet);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure GeraGrade(aItens: INteger; aQtd: Extended; aDevolucao: INteger);
    procedure AbreGrade(aItem: INteger);
  end;

var
  FrmGradeDevCO: TFrmGradeDevCO;

implementation

{$R *.dfm}

uses uPDV, Udados;

procedure TFrmGradeDevCO.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmGradeDevCO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if qryGradeTTOTAL.Value > 0 then
  begin
    if StrToFloatDef(edtQTD.Text, 0) <> qryGradeTTOTAL.Value then
    begin
      Action := caNone;
      raise Exception.Create
        (' Quantidade do Item diferente da quantidade da Grade!');
    end;
  end;
end;

procedure TFrmGradeDevCO.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFrmGradeDevCO.JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmGradeDevCO.qryGradeAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TFrmGradeDevCO.GeraGrade(aItens: INteger; aQtd: Extended;
  aDevolucao: INteger);
var
  qryPesquisa: TFDQuery;
  eGrade: Boolean;
begin
  try
    qryGrade.close;
    qryGrade.Open;

    qryPesquisa := TFDQuery.Create(self);
    qryPesquisa.Connection := dados.Conexao;
    qryPesquisa.close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Text :=
      'select * from COMPRA_GRADE where FK_ITENS_COMPRA=:FK AND QTD>0';
    qryPesquisa.Params[0].Value := aItens;
    qryPesquisa.Open;

    qryPesquisa.First;

    while not qryPesquisa.eof do
    begin
      qryGrade.Insert;

      qryGradeCODIGO.AsInteger := dados.Numerador('DEVOLUCAO_COMPRA_GRADE',
        'CODIGO', 'N', '', '');

      qryGradeFK_COMPRA.AsInteger := qryPesquisa.FieldByName('FK_COMPRA')
        .AsInteger;
      qryGradeFK_ITENS_COMPRA.AsInteger :=
        qryPesquisa.FieldByName('FK_ITENS_COMPRA').AsInteger;
      qryGradeFK_PRODUTO.AsInteger := qryPesquisa.FieldByName('FK_PRODUTO')
        .AsInteger;
      qryGradeFK_GRADE.AsInteger := qryPesquisa.FieldByName('FK_GRADE')
        .AsInteger;
      qryGradeFK_DEVOLUCAO.AsInteger := aDevolucao;

      qryGradeDESCRICAO.AsString := qryPesquisa.FieldByName
        ('DESCRICAO').AsString;
      qryGradeQTD.AsFloat := aQtd;
      qryGrade.Post;

      dados.Conexao.CommitRetaining;

      qryPesquisa.Next;
    end;

  finally
    qryPesquisa.Free;
  end;
end;

procedure TFrmGradeDevCO.AbreGrade(aItem: INteger);
begin
  qryGrade.close;
  qryGrade.Params[0].Value := aItem;
  qryGrade.Open;
end;

end.
