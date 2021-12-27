unit uTransfComanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons, JvComponentBase, JvEnterTab;

type
  TfrmTransfComanda = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    qryOrigem: TFDQuery;
    Panel4: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    qryOrigemCODIGO: TIntegerField;
    edtOrigem: TEdit;
    edtDestino: TEdit;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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

uses uDados, uPDV;

procedure TfrmTransfComanda.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransfComanda.btnGravarClick(Sender: TObject);
begin
  Transferir;
end;

procedure TfrmTransfComanda.FormCreate(Sender: TObject);
begin
  qryOrigem.Close;
  qryOrigem.Open;


end;

procedure TfrmTransfComanda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F5 then
    Transferir;

  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmTransfComanda.Transferir;
var
  idPedidoO: Integer;
  idPedidoD: Integer;
begin

  if trim(edtOrigem.Text) = '' then
    raise Exception.Create('Informe a Mesa/Comanda de Origem!');

  if trim(edtDestino.Text) = '' then
    raise Exception.Create('Informe a Mesa/Comanda de Destino!');

  if (edtOrigem.Text = edtDestino.Text) then
    raise Exception.Create('Origem é igual ao Desinto!');

  if not qryOrigem.Locate('codigo', edtOrigem.Text, []) then
    raise Exception.Create('Mesa de Origem não Cadastrada!');

  if not qryOrigem.Locate('codigo', edtDestino.Text, []) then
    raise Exception.Create('Mesa de Destino não Cadastrada!');

  try

    dados.qryUpdate.Close;
    dados.qryUpdate.SQL.Text :=
      'UPDATE MESAS SET SITUACAO=''L'' WHERE CODIGO=:CODIGO';
    dados.qryUpdate.Params[0].Value := edtOrigem.Text;
    dados.qryUpdate.Prepare;
    dados.qryUpdate.ExecSQL;
    dados.Conexao.CommitRetaining;

    dados.qryUpdate.Close;
    dados.qryUpdate.SQL.Text :=
      'UPDATE MESAS SET SITUACAO=''O'' WHERE CODIGO=:CODIGO';
    dados.qryUpdate.Params[0].Value := edtDestino.Text;
    dados.qryUpdate.Prepare;
    dados.qryUpdate.ExecSQL;
    dados.Conexao.CommitRetaining;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      ' SELECT COALESCE(MAX(CODIGO),0) FROM VENDAS_MASTER WHERE FK_MESA=:MESA';
    dados.qryConsulta.Params[0].Value := edtOrigem.Text;
    dados.qryConsulta.Open;

    dados.qryMesas.Refresh;

    idPedidoO := dados.qryConsulta.Fields[0].AsInteger;
    if idPedidoO > 0 then
    begin

      dados.qryUpdate.Close;
      dados.qryUpdate.SQL.Text :=
        'UPDATE VENDAS_MASTER SET SITUACAO=''C'' WHERE CODIGO=:CODIGO';
      dados.qryUpdate.Params[0].Value := idPedidoO;
      dados.qryUpdate.Prepare;
      dados.qryUpdate.ExecSQL;
      dados.Conexao.CommitRetaining;

      if dados.qryMesas.Locate('codigo', edtDestino.Text) then
      begin

        frmpdv.VendaExiste;
        idPedidoD := frmpdv.qryVendaCODIGO.AsInteger;

        dados.qryUpdate.Close;
        dados.qryUpdate.SQL.Text :=
          'UPDATE VENDAS_DETALHE SET FKVENDA=:VENDA WHERE FKVENDA=:CODIGO';
        dados.qryUpdate.Params[0].Value := idPedidoD;
        dados.qryUpdate.Params[1].Value := idPedidoO;
        dados.qryUpdate.Prepare;
        dados.qryUpdate.ExecSQL;
        dados.Conexao.CommitRetaining;

        frmpdv.qryVenda.Refresh;

        frmpdv.CalcTotalMesa;

      end;

    end;

    ShowMessage('Transferência de MESA/COMANDA realizada com sucesso!');
    Close;

  except
    on e: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;

end;

end.
