unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, ACBrBase, ACBrEnterTab;

type
  TfrmPedidos = class(TForm)
    dsItens: TDataSource;
    qryItens: TFDQuery;
    qryItensCODIGO: TIntegerField;
    qryItensFK_PRODUTO: TIntegerField;
    qryItensQTD: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensSITUACAO: TStringField;
    qryItensVIRTUAL_TEMPO: TStringField;
    qryItensVIRTUAL_PRECO: TExtendedField;
    qryItensVIRTUAL_COMPLEMENTO: TStringField;
    dsProduto: TDataSource;
    Panel1: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Panel7: TPanel;
    Label8: TLabel;
    Label17: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label9: TLabel;
    dsMesa: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    Panel9: TPanel;
    DBImage1: TDBImage;
    ACBrEnterTab1: TACBrEnterTab;
    Label10: TLabel;
    qryComanda_Pessoa: TFDQuery;
    dsComanda_Pessoa: TDataSource;
    qryItensFK_COMANDA_PESSOA: TIntegerField;
    qryItensPERCENTUAL: TFMTBCDField;
    qryComanda_PessoaCODIGO: TIntegerField;
    qryComanda_PessoaFK_COMANDA: TIntegerField;
    qryComanda_PessoaNOME: TStringField;
    qryComanda_PessoaSITUACAO: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    qryItensDATA_HORA: TSQLTimeStampField;
    qryComanda_PessoaPERCENTUAL: TFMTBCDField;
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure Image1Click(Sender: TObject);
    procedure qryItensFK_PRODUTOChange(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure qryItensQTDChange(Sender: TField);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBLookupComboboxEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboboxEh2Enter(Sender: TObject);
    procedure DBLookupComboboxEh2Exit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure qryItensBeforePost(DataSet: TDataSet);
    procedure Label17Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
  private
    procedure GravarItem;
    procedure CancelarItem;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmPedidos.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.DropDown;
end;

procedure TfrmPedidos.DBLookupComboBox2Enter(Sender: TObject);
begin
  DBLookupComboBox2.DropDown;
end;

procedure TfrmPedidos.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := False;
end;

procedure TfrmPedidos.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := True;
end;

procedure TfrmPedidos.DBLookupComboboxEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := False;
end;

procedure TfrmPedidos.DBLookupComboboxEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := True;
end;

procedure TfrmPedidos.DBLookupComboboxEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    DBEdit2.SetFocus;

  if Key = vk_f10 then
    GravarItem;

  if Key = vk_f12 then
    CancelarItem;

end;

procedure TfrmPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f10 then
    GravarItem;
  if Key = vk_f12 then
    CancelarItem;
end;

procedure TfrmPedidos.GravarItem;
begin
  try

    if qryItensFK_PRODUTO.IsNull then
      raise Exception.Create('Informe o Produto!');

    if qryItensFK_COMANDA_PESSOA.IsNull then
      raise Exception.Create('Informe a Comanda!');

    if qryItensQTD.IsNull then
      raise Exception.Create('Informe a Quantidade!');

    qryItens.Post;
    Dados.Conexao.CommitRetaining;
    close;
  except
    on e: Exception do
      raise Exception.Create(e.message);
  end;
end;

procedure TfrmPedidos.CancelarItem;
begin
  if qryItens.State in dsEditModes then
    qryItens.Cancel;
  close;
end;

procedure TfrmPedidos.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPedidos.Label17Click(Sender: TObject);
begin
 GravarItem;
end;

procedure TfrmPedidos.Label9Click(Sender: TObject);
begin
 CancelarItem;
 Close;
end;

procedure TfrmPedidos.qryItensAfterPost(DataSet: TDataSet);
begin
  DBEdit3.SetFocus;
  Dados.Conexao.CommitRetaining;
  Dados.qryComanda_Itens.Refresh;
  Dados.GravarTotalComanda;
end;

procedure TfrmPedidos.qryItensBeforePost(DataSet: TDataSet);
begin
  qryItensDATA_HORA.AsDateTime := now;
end;

procedure TfrmPedidos.qryItensFK_PRODUTOChange(Sender: TField);
begin
  qryItensPRECO.AsFloat := qryItensVIRTUAL_PRECO.AsFloat;
end;

procedure TfrmPedidos.qryItensNewRecord(DataSet: TDataSet);
begin
  qryItensCODIGO.Value := Dados.Numerador('COMANDA_ITENS', 'CODIGO');
  qryItensSITUACAO.Value := 'S';
  qryItensPRECO.Value := 0;
  qryItensPERCENTUAL.Value := 0;
  qryItensTOTAL.Value := 0;
  qryItensQTD.Value := 1;
end;

procedure TfrmPedidos.qryItensQTDChange(Sender: TField);
begin
  qryItensTOTAL.AsFloat := qryItensQTD.AsFloat * qryItensPRECO.AsFloat;
end;

end.
