unit Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts, Data.DB, MemDS, DBAccess, Uni, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmProdutos = class(TForm)
    LBackground: TLayout;
    ImgBack: TImage;
    LConteudo: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button1: TButton;
    Button2: TButton;
    LAreaGrid: TLayout;
    lista: TListView;
    edtBuscar: TEdit;
    Image1: TImage;
    Circle1: TCircle;
    FDMemTable1: TFDMemTable;
    FDMemTable1itemindex: TIntegerField;
    FDMemTable1id: TIntegerField;
    FDMemTable1nome: TStringField;
    procedure edtBuscarChangeTracking(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
        procedure sDetaLheProduto;
    procedure listaItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
    procedure listar;

  public
    id : string;
    matriz: array of array of integer;
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses Modulo, VDetalheProdutos;

{ TFrmProdutos }

procedure TFrmProdutos.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdutos.edtBuscarChangeTracking(Sender: TObject);
begin
  listar;
end;

procedure TFrmProdutos.FormActivate(Sender: TObject);

begin
      FDMemTable1.Close;


      FDMemTable1.Open;
  listar;
end;

procedure TFrmProdutos.sDetaLheProduto;
begin
  DetalheProduto := TDetalheProduto.Create(self);
  DetalheProduto.Show;
end;

procedure TFrmProdutos.listaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

  id :=     lista.ItemIndex.ToString;


  (*
  FDMemTable1.IndexFieldNames := 'itemindex';
  FDMemTable1.SetKey;
  FDMemTable1.FieldByName('itemindex').AsInteger := StrToInt(id);
  FDMemTable1.GotoKey;
*)

// FDMemTable1.IndexFieldNames := 'itemindex';
 //FDMemTable1.Locate('itemindex', id, []);

 sDetaLheProduto;
end;

procedure TFrmProdutos.listar;
var
  item: TListViewItem;
  streamImg: TStream;
  labelt1 : TLabel;
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

  lista.Items.Clear;
  lista.BeginUpdate;

  while not dm.queryProdutosCon.EoF do
  begin

    streamImg := TMemoryStream.Create;
    labelt1 := TLabel.Create(Self);



    if dm.queryProdutosCon.FieldByName('imagem').IsNull then
    begin
      Image1.Bitmap.SaveToStream(streamImg);

    end
    else
    begin
      dm.queryProdutosConImagem.SaveToStream(streamImg);
    end;

    item := lista.Items.Add;
    item.Detail :=  dm.queryProdutosCon.FieldByName('id').AsString +' - '+dm.queryProdutosCon.FieldByName('descricao').AsString +
      ' - Estoque: ' + dm.queryProdutosCon.FieldByName('quantidade').AsString;
    item.Text := dm.queryProdutosCon.FieldByName('nome').AsString;

    Circle1.Fill.Bitmap.Bitmap.LoadFromStream(streamImg);

    item.Bitmap := Circle1.MakeScreenshot;


      FDMemTable1.Insert;
    FDMemTable1itemindex.Value := item.Index;
    FDMemTable1id.Value := dm.queryProdutosCon.FieldByName('id').AsInteger;
    FDMemTable1nome.Text := dm.queryProdutosCon.FieldByName('nome').AsString;
    FDMemTable1.Post;
    FDMemTable1.ApplyUpdates(-1);

    dm.queryProdutosCon.Next;

  end;
 id := IntToStr(FDMemTable1itemindex.Value);
 lista.EndUpdate;

end;

end.
