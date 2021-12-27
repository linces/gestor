unit uTransf;

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
  TfrmTransf = class(TForm)
    Panel5: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel7: TPanel;
    Label8: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label9: TLabel;
    Label3: TLabel;
    qryMesasD: TFDQuery;
    qryMesasDCODIGO: TIntegerField;
    qryMesasDNOME: TStringField;
    qryMesasDQTD: TIntegerField;
    qryMesasDDATA: TSQLTimeStampField;
    qryMesasDSITUACAO: TStringField;
    qryMesasDFK_MOVIMENTO: TIntegerField;
    dsMesasD: TDataSource;
    dsMesasO: TDataSource;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
  private
    procedure Transferir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransf: TfrmTransf;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmTransf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F10 then
    Transferir;

  if Key = VK_F12 then
    close;
end;

procedure TfrmTransf.FormShow(Sender: TObject);
begin
  qryMesasD.close;
  qryMesasD.Open;
end;

procedure TfrmTransf.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransf.Label3Click(Sender: TObject);
begin
  Transferir;
end;

procedure TfrmTransf.Label9Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTransf.Transferir;
begin
  if DBLookupComboBox2.KeyValue = null then
  begin
    ShowMessage('Informe mesa de Destino!');
    Exit;
  end;

  try

    if qryMesasD.Locate('CODIGO', DBLookupComboBox2.KeyValue, []) then
    begin
      Dados.qryComandas_master.Edit;
      Dados.qryComandas_masterFK_MESA.Value := DBLookupComboBox2.KeyValue;
      Dados.qryComandas_master.Post;

      qryMesasD.Edit;
      qryMesasDDATA.Value := Dados.qryMesasDATA.Value;
      qryMesasDFK_MOVIMENTO.Value := Dados.qryComandas_masterCODIGO.Value;
      qryMesasDSITUACAO.Value := 'O';
      qryMesasD.Post;

      Dados.qryMesas.Edit;
      Dados.qryMesasSITUACAO.Value := 'L';
      Dados.qryMesasFK_MOVIMENTO.Clear;
      Dados.qryMesas.Post;

      Dados.Conexao.CommitRetaining;

      ShowMessage('Transferência realizada com sucesso!');
    end;
  except
    on e: Exception do
    begin
      Dados.Conexao.RollbackRetaining;
      raise Exception.Create(e.Message);
    end;
  end;

  close;

end;

end.
