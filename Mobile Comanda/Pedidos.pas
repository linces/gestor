unit Pedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, System.Actions, FMX.ActnList;

type
  TFrmPedidos = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    Layout1: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    btnBuscar: TButton;
    Data: TDateEdit;
    LAreaGrid: TLayout;
    lista: TListView;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    btnInserir: TButton;
    btnDeletar: TButton;
    btnVoltar: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ActionList1: TActionList;
    procedure FormActivate(Sender: TObject);
    procedure dataChange(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
    procedure listar;
  public
    { Public declarations }
  end;

var
  FrmPedidos: TFrmPedidos;

implementation

{$R *.fmx}

uses Modulo, NovoPedido;

{ TFrmPedidos }

procedure TFrmPedidos.btnBuscarClick(Sender: TObject);
begin
  listar;
end;

procedure TFrmPedidos.btnDeletarClick(Sender: TObject);
begin
  dm.con.Connected := true;

  idPedido := dm.queryPedidosCon.FieldByName('id').Value;

  dm.queryPedidosExec.Close;
  dm.queryPedidosExec.SQL.Clear;
  dm.queryPedidosExec.SQL.Add('delete from pedidos where id = :id');
  dm.queryPedidosExec.ParamByName('id').AsString := idPedido;

  dm.queryPedidosExec.Execute;


  // EXCLUINDO NA TABELA DE MOVIMENTAÇÕES

  { DELETANDO OS DADOS DOS ITENS DO PEDIDO }
  dm.queryPedidosExec.Close;
  dm.queryPedidosExec.SQL.Clear;
  dm.queryPedidosExec.SQL.Add
    ('DELETE from detalhes_pedidos where id_pedido = :id');
  dm.queryPedidosExec.ParamByName('id').Value := idPedido;

  dm.queryPedidosExec.Execute;

  { DELETANDO PEDIDO NAS MOVIMENTAÇÕES }
  dm.queryMovExec.Close;
  dm.queryMovExec.SQL.Clear;
  dm.queryMovExec.SQL.Add('DELETE from movimentacoes where id_movimento = :id');
  dm.queryMovExec.ParamByName('id').Value := idPedido;

  dm.queryMovExec.Execute;

  listar;
end;

procedure TFrmPedidos.btnInserirClick(Sender: TObject);
begin
  FrmNovoPed := TFrmNovoPed.Create(self);
  FrmNovoPed.Show();
end;

procedure TFrmPedidos.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedidos.dataChange(Sender: TObject);
begin
  listar;
end;

procedure TFrmPedidos.FormActivate(Sender: TObject);
begin

  Data.Date := Date;
  listar;
end;

procedure TFrmPedidos.listar;
var
  item: TListViewItem;

begin
  dm.con.Connected := true;
  dm.queryPedidosCon.Active := true;

  dm.queryPedidosCon.Close;
  dm.queryPedidosCon.SQL.Clear;
  dm.queryPedidosCon.SQL.Add('select * from pedidos where data = :data');
  dm.queryPedidosCon.ParamByName('data').AsString :=
    FormatDateTime('yyyy/mm/dd', Data.Date);

  dm.queryPedidosCon.Open;
  dm.queryPedidosCon.First;

  lista.Items.Clear;
  lista.BeginUpdate;

  while not dm.queryPedidosCon.EoF do
  begin
    item := lista.Items.Add;
    item.Detail := FormatFloat('R$ ###,##0.00',
      dm.queryPedidosCon.FieldByName('valor').Value) + ' - ' +
      dm.queryPedidosCon.FieldByName('funcionario').AsString;
    item.Text := 'Mesa ' + dm.queryPedidosCon.FieldByName('mesa').AsString;
    dm.queryPedidosCon.Next;
  end;

  lista.EndUpdate;

end;

end.
