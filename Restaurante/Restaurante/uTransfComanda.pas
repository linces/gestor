unit uTransfComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls;

type
  TfrmTransfComanda = class(TForm)
    Panel5: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel7: TPanel;
    Label8: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label9: TLabel;
    Label3: TLabel;
    qryComandaD: TFDQuery;
    dsComandaD: TDataSource;
    dsComandaO: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    qryComandaO: TFDQuery;
    qryComandaOCODIGO: TIntegerField;
    qryComandaOFK_COMANDA: TIntegerField;
    qryComandaONOME: TStringField;
    qryComandaOSITUACAO: TStringField;
    qryComandaOTOTAL: TFMTBCDField;
    qryComandaDCODIGO: TIntegerField;
    qryComandaDFK_COMANDA: TIntegerField;
    qryComandaDNOME: TStringField;
    qryComandaDSITUACAO: TStringField;
    qryComandaDTOTAL: TFMTBCDField;
    qryComandaOPERCENTUAL: TFMTBCDField;
    qryComandaDPERCENTUAL: TFMTBCDField;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label3Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
  private
    procedure Transferir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransfComanda: TfrmTransfComanda;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmTransfComanda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F10 then
    Transferir;

  if Key = VK_F12 then
    close;
end;

procedure TfrmTransfComanda.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransfComanda.Label3Click(Sender: TObject);
begin
  Transferir;
end;

procedure TfrmTransfComanda.Label9Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransfComanda.Transferir;
begin

  if DBLookupComboBox1.KeyValue = null then
  begin
    ShowMessage('Informe a Origem da Comanda!');
    Exit;
  end;

  if DBLookupComboBox2.KeyValue = null then
  begin
    ShowMessage('Informe o Destino da Comanda!');
    Exit;
  end;

  if (DBLookupComboBox1.KeyValue = DBLookupComboBox2.KeyValue) then
  begin
    ShowMessage('Origem é igual Desinto da Comanda!');
    Exit;
  end;

  try
    dados.qryConsulta.close;
    dados.qryConsulta.SQL.Text :=
      'update COMANDA_ITENS set FK_COMANDA_PESSOA=:comanda where FK_COMANDA_PESSOA=:pessoa ';
    dados.qryConsulta.ParamByName('comanda').Value :=
      DBLookupComboBox2.KeyValue;
    dados.qryConsulta.ParamByName('pessoa').Value := DBLookupComboBox1.KeyValue;
    dados.qryConsulta.ExecSQL;

    qryComandaO.Edit;
    qryComandaOSITUACAO.Value := 'F';
    qryComandaOTOTAL.Value := 0;
    qryComandaO.Post;

    dados.Conexao.CommitRetaining;
    dados.qryComanda_Itens.Refresh;
    dados.GravarTotalComanda;

    ShowMessage('Transferência de COMANDA realizada com sucesso!');

  except
    on e: Exception do
    begin
      dados.Conexao.RollbackRetaining;
      raise Exception.Create(e.Message);
    end;
  end;

  close;

end;

end.
