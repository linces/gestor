unit uReabrirComanda;

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
  TfrmReabrirComanda = class(TForm)
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
    dsComanda: TDataSource;
    qryComanda_Pessoa: TFDQuery;
    qryComanda_PessoaCODIGO: TIntegerField;
    qryComanda_PessoaFK_COMANDA: TIntegerField;
    qryComanda_PessoaNOME: TStringField;
    qryComanda_PessoaSITUACAO: TStringField;
    qryComanda_PessoaTOTAL: TFMTBCDField;
    qryComanda_PessoaPERCENTUAL: TFMTBCDField;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
  private
    procedure Transferir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReabrirComanda: TfrmReabrirComanda;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmReabrirComanda.DBLookupComboBox2Enter(Sender: TObject);
begin
  DBLookupComboBox2.DropDown;
end;

procedure TfrmReabrirComanda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F10 then
    Transferir;

  if Key = VK_F12 then
    close;
end;

procedure TfrmReabrirComanda.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReabrirComanda.Label3Click(Sender: TObject);
begin
  Transferir;
end;

procedure TfrmReabrirComanda.Label9Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReabrirComanda.Transferir;
begin
  if DBLookupComboBox2.KeyValue = null then
  begin
    ShowMessage('Informe mesa de Destino!');
    Exit;
  end;

  try

    if qryComanda_Pessoa.Locate('CODIGO', DBLookupComboBox2.KeyValue, []) then
    begin
      qryComanda_Pessoa.Edit;
      qryComanda_PessoaSITUACAO.Value := 'A';
      qryComanda_Pessoa.Post;
      dados.Conexao.CommitRetaining;

      ShowMessage('Comanda aberta com sucesso!');
    end;
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
