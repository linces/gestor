unit VDetalheProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.DateTimeCtrls,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, System.Actions, FMX.ActnList, FMX.Grid.Style,
  Fmx.Bind.Grid, Data.Bind.Controls, Fmx.Bind.Navigator, Data.Bind.Grid,
  FMX.ScrollBox, FMX.Grid, FMX.Edit;


type
  TDetalheProduto = class(TForm)
    LBackground: TLayout;
    ImgBack: TImage;
    LConteudo: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button1: TButton;
    Button2: TButton;
    edtBuscar: TEdit;
    LAreaGrid: TLayout;
    lista: TListView;
    Image1: TImage;
    Circle1: TCircle;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    ImageControlimagem: TImageControl;
    BindSourceDB1: TBindSourceDB;
    Editid: TEdit;
    Labelid: TLabel;
    BindingsList1: TBindingsList;
    lblid: TLabel;
    Label1: TLabel;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFielditemindex: TLinkPropertyToField;
    LinkPropertyToFielditemindex2: TLinkPropertyToField;
    LinkControlToFielditemindex: TLinkControlToField;
    NavigatorBindSourceDB2: TBindNavigator;
    procedure edtBuscarChangeTracking(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure listar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DetalheProduto: TDetalheProduto;

implementation

{$R *.fmx}

uses Modulo, Produtos;

procedure TDetalheProduto.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TDetalheProduto.edtBuscarChangeTracking(Sender: TObject);
begin
  dm.con.Connected := true;
  dm.queryProdutosCon.Active := true;

  dm.queryProdutosCon.Close;
  dm.queryProdutosCon.SQL.Clear;
  dm.queryProdutosCon.SQL.Add
    ('select id, nome, descricao, valor, quantidade, imagem from produtos where nome like :nome');
  dm.queryProdutosCon.ParamByName('nome').AsString := edtBuscar.Text + '%';

  dm.queryProdutosCon.Open;
  dm.queryProdutosCon.First;
end;

procedure TDetalheProduto.FormShow(Sender: TObject);
begin
  lblid.text := FrmProdutos.id;

end;

procedure TDetalheProduto.listar;
var
  item: TListViewItem;
  streamImg: TStream;
  labelt1 : TLabel;
  itemid : string;
begin


  FrmProdutos.lista.itemIndex := strtoint(FrmProdutos.id);

  dm.con.Connected := true;
  dm.queryProdutosCon.Active := true;

  dm.queryProdutosCon.Close;
  dm.queryProdutosCon.SQL.Clear;
  dm.queryProdutosCon.SQL.Add
    ('select id, nome, descricao, valor, quantidade, imagem from produtos where nome like :nome');
  dm.queryProdutosCon.ParamByName('nome').AsString := edtBuscar.Text + '%';

  dm.queryProdutosCon.Open;
  dm.queryProdutosCon.First;



end;

end.
