unit NovoPedido;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Edit, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView;

type
  TFrmNovoPed = class(TForm)
    LConteudo: TLayout;
    imgBack: TImage;
    LObjetos: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button2: TButton;
    Label1: TLabel;
    LAreaGrid: TLayout;
    barra: TVertScrollBox;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    btnSalvar: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    cbMesa: TComboBox;
    cbPrato: TComboBox;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lista: TListView;
    btnRemove: TImage;
    Label6: TLabel;
    lblTotal: TLabel;
    btnAdd: TImage;
    procedure Button2Click(Sender: TObject);
    procedure cbPratoChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure carregarPratos;
    procedure carregarMesas;
    procedure carregarValorPrato;
    procedure listar;
    procedure deletarItens;
  public
    { Public declarations }
  end;

var
  FrmNovoPed: TFrmNovoPed;
  valorTotal: real;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses Modulo;

procedure TFrmNovoPed.btnAddClick(Sender: TObject);
var
  total: real;
begin
  if edtQuantidade.Text <> '' then
  begin
    total := strtoFloat(edtQuantidade.Text) * strtoFloat(edtValor.Text);

    dm.con.Connected := true;

    dm.queryItensPedidoExec.Close;
    dm.queryItensPedidoExec.SQL.Clear;
    dm.queryItensPedidoExec.SQL.Add
      ('insert into detalhes_pedidos (prato, valor, quantidade, valor_total, mesa, funcionario) values (:prato, :valor, :quantidade, :valor_total, :mesa, :funcionario)');
    // dm.queryItensPedidoExec.ParamByName('id_pedido').AsString := '0';
    dm.queryItensPedidoExec.ParamByName('prato').AsString :=
      cbPrato.Selected.Text;
    dm.queryItensPedidoExec.ParamByName('valor').AsString := edtValor.Text;
    dm.queryItensPedidoExec.ParamByName('quantidade').AsString :=
      edtQuantidade.Text;
    dm.queryItensPedidoExec.ParamByName('valor_total').Value := total;
    dm.queryItensPedidoExec.ParamByName('mesa').AsString :=
      cbMesa.Selected.Text;
    dm.queryItensPedidoExec.ParamByName('funcionario').AsString :=
      nomeFuncionario;
    // dm.queryItensPedidoExec.ParamByName('status').AsString := 'Produção';

    dm.queryItensPedidoExec.Execute;

    valorTotal := valorTotal + total;
    lblTotal.Text := FormatFloat('R$' + '###,##0.00', valorTotal);

    cbMesa.Enabled := false;
    edtQuantidade.Text := '';

    listar;

  end
  else
  begin
    showMessage('Insira uma quantidade');
  end;

end;

procedure TFrmNovoPed.btnRemoveClick(Sender: TObject);
var
  valorItem: real;
begin
  dm.con.Connected := true;

  idItemPedido := dm.queryItensPedido.FieldByName('id').Value;
  valorItem := dm.queryItensPedido.FieldByName('valor_total').Value;

  dm.queryItensPedidoExec.Close;
  dm.queryItensPedidoExec.SQL.Clear;
  dm.queryItensPedidoExec.SQL.Add
    ('delete from detalhes_pedidos where id = :id');
  dm.queryItensPedidoExec.ParamByName('id').AsString := idItemPedido;

  dm.queryItensPedidoExec.Execute;
  listar;

  valorTotal := valorTotal - valorItem;
  lblTotal.Text := FormatFloat('R$' + '###,##0.00', valorTotal);

end;

procedure TFrmNovoPed.btnSalvarClick(Sender: TObject);
var
  ultimoId: string;
begin
  if lista.Items.Count > 0 then
  begin
    dm.con.Connected := true;

    dm.queryPedidosExec.Close;
    dm.queryPedidosExec.SQL.Clear;
    dm.queryPedidosExec.SQL.Add
      ('insert into pedidos (id_venda, valor, mesa, funcionario, data) values (:id_venda, :valor, :mesa, :funcionario, curDate())');

    dm.queryPedidosExec.ParamByName('id_venda').AsString := '0';
    dm.queryPedidosExec.ParamByName('valor').Value := valorTotal;
    dm.queryPedidosExec.ParamByName('mesa').AsString := cbMesa.Selected.Text;
    dm.queryPedidosExec.ParamByName('funcionario').AsString := nomeFuncionario;

    dm.queryPedidosExec.Execute;
    showMessage('Pedido Concluido com Sucesso!');

    { RECUPERAR O ULTIMO ID DO PEDIDO SALVO }
    dm.queryPedidoscON.Close;
    dm.queryPedidoscON.SQL.Clear;
    dm.queryPedidoscON.SQL.Add('select * from pedidos order by id desc');
    dm.queryPedidoscON.Open;

    ultimoId := dm.queryPedidoscON['id'];

    { ATUALIZAR O NUMERO DO PEDIDO NA TABELA DE ITENS PEDIDO }

    dm.queryPedidosExec.Close;
    dm.queryPedidosExec.SQL.Clear;
    dm.queryPedidosExec.SQL.Add
      ('update detalhes_pedidos set id_pedido = :id where id_pedido = 0 and funcionario = :funcionario');
    dm.queryPedidosExec.ParamByName('id').Value := ultimoId;
    dm.queryPedidosExec.ParamByName('funcionario').Value := nomeFuncionario;

    dm.queryPedidosExec.Execute;

    { INSERINDO O PEDIDO NA TABELA DE MOVIMENTAÇÕES }
    dm.queryMovExec.Close;
    dm.queryMovExec.SQL.Clear;
    dm.queryMovExec.SQL.Add
      ('INSERT INTO movimentacoes (tipo, movimento, valor, funcionario, data, id_movimento) values (:tipo, :movimento, :valor, :funcionario, curDate(), :id_movimento)');
    dm.queryMovExec.ParamByName('tipo').Value := 'Entrada';
    dm.queryMovExec.ParamByName('movimento').Value := 'Pedido';
    dm.queryMovExec.ParamByName('valor').Value := valorTotal;
    dm.queryMovExec.ParamByName('funcionario').Value := nomeFuncionario;
    dm.queryMovExec.ParamByName('id_movimento').Value := ultimoId;
    dm.queryMovExec.Execute;

    valorTotal := 0;
    lblTotal.Text := '0';
    listar;
    cbMesa.Enabled := true;

  end
  else
  begin
    showMessage('Não é possível fechar um pedido sem itens!');
  end;

end;

procedure TFrmNovoPed.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmNovoPed.carregarMesas;
begin
  dm.con.Connected := true;
  dm.queryMesasCon.Active := true;

  if not dm.queryMesasCon.IsEmpty then
  begin
    cbMesa.Clear;
    while not dm.queryMesasCon.EOF do
    begin
      cbMesa.Items.Add(dm.queryMesasCon.FieldByName('mesa').AsString);
      dm.queryMesasCon.next;
    end;

  end;

  dm.con.Connected := false;
  dm.queryMesasCon.Active := false;

end;

procedure TFrmNovoPed.carregarPratos;
begin
  dm.con.Connected := true;
  dm.queryPratosCon.Active := true;

  if not dm.queryPratosCon.IsEmpty then
  begin
    cbPrato.Clear;
    while not dm.queryPratosCon.EOF do
    begin
      cbPrato.Items.Add(dm.queryPratosCon.FieldByName('nome').AsString);
      dm.queryPratosCon.next;
    end;

  end;

  dm.con.Connected := false;
  dm.queryPratosCon.Active := false;
end;

procedure TFrmNovoPed.carregarValorPrato;
var
  valordoPrato: real;
begin
  dm.con.Connected := true;
  dm.queryPratosCon2.Active := true;

  dm.queryPratosCon2.Close;
  dm.queryPratosCon2.SQL.Clear;
  dm.queryPratosCon2.SQL.Add('select * from pratos where nome = :nome');
  dm.queryPratosCon2.ParamByName('nome').AsString := cbPrato.Selected.Text;

  dm.queryPratosCon2.Open;

  if not dm.queryPratosCon2.IsEmpty then
  begin

    // RECUPERAR O VALOR DO PRATO
    valordoPrato := dm.queryPratosCon2['valor'];
    edtValor.Text := FormatFloat('###,##0.00', valordoPrato);
  end;

end;

procedure TFrmNovoPed.cbPratoChange(Sender: TObject);
begin
  carregarValorPrato;
end;

procedure TFrmNovoPed.deletarItens;
begin
  dm.con.Connected := true;

  dm.queryItensPedidoExec.Close;
  dm.queryItensPedidoExec.SQL.Clear;
  dm.queryItensPedidoExec.SQL.Add
    ('delete from detalhes_pedidos where id_pedido = :id and funcionario = :funcionario');
  dm.queryItensPedidoExec.ParamByName('id').AsString := '0';
  dm.queryItensPedidoExec.ParamByName('funcionario').AsString :=
    nomeFuncionario;

  dm.queryItensPedidoExec.Execute;
end;

procedure TFrmNovoPed.FormShow(Sender: TObject);
begin
  carregarPratos;
  carregarMesas;

  cbPrato.ItemIndex := 0;
  cbMesa.ItemIndex := 0;

  valorTotal := 0;

  deletarItens;

end;

procedure TFrmNovoPed.listar;
var
  item: TListViewItem;

begin
  dm.con.Connected := true;
  dm.queryItensPedido.Active := true;

  dm.queryItensPedido.Close;
  dm.queryItensPedido.SQL.Clear;
  dm.queryItensPedido.SQL.Add
    ('select id, id_pedido, prato, valor, valor_total from detalhes_pedidos where id_pedido = :id_pedido and funcionario = :funcionario');
  dm.queryItensPedido.ParamByName('id_pedido').AsString := '0';
  dm.queryItensPedido.ParamByName('funcionario').AsString := nomeFuncionario;

  dm.queryItensPedido.Open;
  dm.queryItensPedido.First;

  lista.Items.Clear;
  lista.BeginUpdate;

  while not dm.queryItensPedido.EOF do
  begin
    item := lista.Items.Add;
    item.Detail := FormatFloat('R$ ###,##0.00',
      dm.queryItensPedido.FieldByName('valor_total').Value);
    item.Text := dm.queryItensPedido.FieldByName('prato').AsString;
    dm.queryItensPedido.next;
  end;

  lista.EndUpdate;

end;

end.
