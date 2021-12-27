unit uGradeCompra;

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
  TFrmGradeCo = class(TForm)
    dsGrade: TDataSource;
    qryGrade: TFDQuery;
    qryGradeCODIGO: TIntegerField;
    qryGradeFK_COMPRA: TIntegerField;
    qryGradeFK_ITENS_COMPRA: TIntegerField;
    qryGradeFK_PRODUTO: TIntegerField;
    qryGradeFK_GRADE: TIntegerField;
    qryGradeDESCRICAO: TStringField;
    qryGradeQTD: TFMTBCDField;
    qryGradePRECO: TFMTBCDField;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    lblQtdItem: TLabel;
    lblQtdTotal: TLabel;
    edtQTD: TEdit;
    DBEdit1: TDBEdit;
    qryGradeTTOTAL: TAggregateField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure GeraGrade(aProduto: INteger; aCompra: INteger; aItens: INteger);
    procedure AbreGrade(aItem: INteger);
  end;

var
  FrmGradeCo: TFrmGradeCo;

implementation

{$R *.dfm}

uses uPDV, Udados;

procedure TFrmGradeCo.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TFrmGradeCo.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFrmGradeCo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFrmGradeCo.GeraGrade(aProduto: INteger; aCompra: INteger;
  aItens: INteger);
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
      'select * from PRODUTO_GRADE where FK_PRODUTO=:PRODUTO';
    qryPesquisa.Params[0].Value := aProduto;
    qryPesquisa.Open;

    qryPesquisa.First;

    while not qryPesquisa.eof do
    begin
      qryGrade.Insert;

      qryGradeCODIGO.AsInteger := dados.Numerador('COMPRA_GRADE', 'CODIGO',
        'N', '', '');

      qryGradeFK_COMPRA.AsInteger := aCompra;
      qryGradeFK_ITENS_COMPRA.AsInteger := aItens;
      qryGradeFK_PRODUTO.AsInteger := aProduto;
      qryGradeFK_GRADE.AsInteger := qryPesquisa.FieldByName('CODIGO').AsInteger;
      qryGradeDESCRICAO.AsString := qryPesquisa.FieldByName
        ('DESCRICAO').AsString;
      qryGradePRECO.AsFloat := 0;
      qryGradeQTD.Value := 0;
      qryGrade.Post;

      dados.Conexao.CommitRetaining;

      qryPesquisa.Next;
    end;

  finally
    qryPesquisa.Free;
  end;
end;

procedure TFrmGradeCo.AbreGrade(aItem: INteger);
begin
  qryGrade.close;
  qryGrade.Params[0].Value := aItem;
  qryGrade.Open;
end;

end.
