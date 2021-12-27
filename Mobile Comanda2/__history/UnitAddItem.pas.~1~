unit UnitAddItem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TabControl, FMX.Edit, FMX.Layouts, System.JSON, System.NetEncoding,
  Soap.EncdDecd;

type
  TFrmAddItem = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    img_fechar: TImage;
    lv_categoria: TListView;
    TabControl: TTabControl;
    TabCategoria: TTabItem;
    TabProduto: TTabItem;
    Rectangle2: TRectangle;
    lbl_titulo: TLabel;
    img_voltar: TImage;
    Rectangle6: TRectangle;
    edt_busca_produto: TEdit;
    rect_busca_produto: TRectangle;
    Label7: TLabel;
    Rectangle3: TRectangle;
    lbl_comanda: TLabel;
    img_icone: TImage;
    lv_produto: TListView;
    img_add: TImage;
    layout_qtd: TLayout;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    lbl_descricao: TLabel;
    rect_confirmar: TRectangle;
    Label4: TLabel;
    lbl_qtd: TLabel;
    img_menos: TImage;
    img_mais: TImage;
    img_fechar_qtd: TImage;
    edt_obs: TEdit;
    lv_opcional: TListView;
    img_uncheck: TImage;
    img_check: TImage;
    Rectangle7: TRectangle;
    procedure img_fecharClick(Sender: TObject);
    procedure img_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lv_categoriaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lv_produtoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_menosClick(Sender: TObject);
    procedure img_fechar_qtdClick(Sender: TObject);
    procedure rect_confirmarClick(Sender: TObject);
    procedure rect_busca_produtoClick(Sender: TObject);
    procedure lv_opcionalItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    procedure AddCategoriaLv(id_categoria: integer; descricao, icone: string);
    procedure ListarCategoria;
    procedure AddProdutoLv(id_produto: integer; descricao: string;
      preco: double);
    procedure ListarProduto(id_categoria: integer; busca: string);
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
    procedure ListarOpcional(id_produto: integer);
    procedure AddOpcionalLv(id_opcao: integer;
                            descricao: string;
                            valor: double);
    { Private declarations }
  public
    { Public declarations }
    comanda: string;
  end;

var
  FrmAddItem: TFrmAddItem;

implementation

{$R *.fmx}

uses UnitDM;

function TFrmAddItem.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
  Encoding: TBase64Encoding;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Encoding := TBase64Encoding.Create(0);
      Encoding.Decode(Input, Output);

      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Encoding.DisposeOf;
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TFrmAddItem.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
        Input := TBytesStream.Create;
        try
                Bitmap.SaveToStream(Input);
                Input.Position := 0;
                Output := TStringStream.Create('', TEncoding.ASCII);

                try
                        Soap.EncdDecd.EncodeStream(Input, Output);
                        Result := Output.DataString;
                finally
                        Output.Free;
                end;

        finally
                Input.Free;
        end;
end;


procedure TFrmAddItem.AddCategoriaLv(id_categoria: integer;
                                     descricao, icone: string);
var
    bmp : TBitmap;
begin
    with lv_categoria.Items.Add do
    begin
        Tag := id_categoria;
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := descricao;

        // Icone...
        if icone <> '' then
        begin
            bmp := BitmapFromBase64(icone);

            TListItemImage(Objects.FindDrawable('ImgIcone')).OwnsBitmap := true;
            TListItemImage(Objects.FindDrawable('ImgIcone')).Bitmap := bmp;
        end;
    end;
end;

procedure TFrmAddItem.ListarCategoria;
var
    x : integer;
    jsonArray: TJSONArray;
    erro: string;
begin
    lv_categoria.Items.Clear;

    if NOT dm.ListarCategoria(jsonArray, erro) then
    begin
        showmessage(erro);
        exit;
    end;

    for x := 0 to jsonArray.Size - 1 do
    begin
        AddCategoriaLv(jsonArray.Get(x).GetValue<integer>('ID_CATEGORIA'),
                       jsonArray.Get(x).GetValue<string>('DESCRICAO'),
                       jsonArray.Get(x).GetValue<string>('ICONE'));


    end;

    jsonArray.DisposeOf;

end;

procedure TFrmAddItem.AddProdutoLv(id_produto: integer;
                                   descricao: string;
                                   preco: double);
begin
    with lv_produto.Items.Add do
    begin
        Tag := id_produto;
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := descricao;
        TListItemText(Objects.FindDrawable('TxtPreco')).Text := FormatFloat('#,##0.00', preco);
        TListItemImage(Objects.FindDrawable('ImgAdd')).bitmap := img_add.bitmap;
    end;
end;

procedure TFrmAddItem.AddOpcionalLv(id_opcao: integer;
                                   descricao: string;
                                   valor: double);
begin
    with lv_opcional.Items.Add do
    begin
        Tag := id_opcao;

        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := descricao;
        TListItemText(Objects.FindDrawable('TxtValor')).Text := FormatFloat('#,##0.00', valor);
        TListItemImage(Objects.FindDrawable('ImgCheckbox')).Bitmap := img_uncheck.Bitmap;
        TListItemImage(Objects.FindDrawable('ImgCheckbox')).TagString := '0';
        TListItemImage(Objects.FindDrawable('ImgCheckbox')).TagFloat := valor;
    end;
end;


procedure TFrmAddItem.ListarProduto(id_categoria: integer; busca: string);
var
    x : integer;
    jsonArray: TJsonArray;
    erro: string;
begin
    lv_produto.Items.Clear;

    if NOT dm.ListarProduto(id_categoria, busca, 0, jsonArray, erro) then
    begin
        showmessage(erro);
        exit;
    end;

    for x := 0 to jsonArray.Size - 1 do
    begin
        AddProdutoLv(jsonArray.Get(x).GetValue<integer>('ID_PRODUTO'),
                     jsonArray.Get(x).GetValue<string>('DESCRICAO'),
                     jsonArray.Get(x).GetValue<double>('PRECO'));
    end;

    jsonArray.DisposeOf;
end;

procedure TFrmAddItem.ListarOpcional(id_produto: integer);
var
    x : integer;
    jsonArray: TJsonArray;
    erro: string;
begin
    lv_opcional.Items.Clear;

    if NOT dm.ListarOpcional(id_produto, jsonArray, erro) then
    begin
        showmessage(erro);
        exit;
    end;

    for x := 0 to jsonArray.Size - 1 do
    begin
        AddOpcionalLv(jsonArray.Get(x).GetValue<integer>('ID_OPCAO'),
                        jsonArray.Get(x).GetValue<string>('DESCRICAO'),
                        jsonArray.Get(x).GetValue<double>('VALOR'));
    end;

    lv_opcional.Visible := jsonArray.Size > 0;

    jsonArray.DisposeOf;
end;

procedure TFrmAddItem.lv_categoriaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    lbl_titulo.Text := TListItemText(AItem.Objects.FindDrawable('TxtDescricao')).Text;
    lbl_comanda.Text := 'Comanda / Mesa: ' + comanda;

    lv_produto.Tag := AItem.Tag; // Salvar o id_categoria na tag da lista de produtos...
    ListarProduto(AItem.Tag, '');

    TabControl.GotoVisibleTab(1, TTabTransition.Slide);
end;

procedure TFrmAddItem.lv_opcionalItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
    if TListView(Sender).Selected <> nil then
    begin
        if ItemObject is TListItemImage then
        begin
            if TListItemImage(ItemObject).TagString = '0' then // Nao checado...
            begin
                TListItemImage(ItemObject).Bitmap := img_check.Bitmap;
                TListItemImage(ItemObject).TagString := '1';
            end
            else
            // Checado...
            begin
                TListItemImage(ItemObject).Bitmap := img_uncheck.Bitmap;
                TListItemImage(ItemObject).TagString := '0';
            end;
        end;
    end;
end;

function ConverteValor(vl: string): Double;
begin
    try
        vl := vl.Replace(',', '').Replace('.', '');
        Result := vl.ToDouble / 100;
    except
        Result := 0;
    end;
end;


procedure TFrmAddItem.lv_produtoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    // Exibir a confirmacao + Qtd...
    lbl_qtd.Text := '01';
    lbl_descricao.Text := TListItemText(AItem.Objects.FindDrawable('TxtDescricao')).Text;
    lbl_descricao.Tag := Aitem.Tag; // Salva o id_produto clicado na tag da lbl_descricao...

    // Salva o preco do item clicado na tagfloat da lbl_descricao...
    lbl_descricao.TagFloat := ConverteValor(
                            TListItemText(AItem.Objects.FindDrawable('TxtPreco')).Text);

    // Verificar opcionais...
    ListarOpcional(Aitem.Tag);

    edt_obs.Text := '';
    layout_qtd.Visible := true;
end;

procedure TFrmAddItem.rect_busca_produtoClick(Sender: TObject);
begin
    ListarProduto(lv_produto.Tag, edt_busca_produto.Text);
end;

procedure TFrmAddItem.rect_confirmarClick(Sender: TObject);
var
    erro, obs_opcional: string;
    vl_opcional: double;
    x : integer;
    item: TListViewItem;
begin
    // Verificar os opcionais...
    vl_opcional := 0;
    obs_opcional := '';


    for x := 0 to lv_opcional.Items.Count - 1 do
    begin
        if TListItemImage(lv_opcional.Items[x].Objects.FindDrawable('ImgCheckbox')).TagString = '1' then // Se checado
        begin
            vl_opcional := vl_opcional +
                  (TListItemImage(lv_opcional.Items[x].Objects.FindDrawable('ImgCheckbox')).TagFloat *
                  lbl_qtd.Text.ToInteger);

            if obs_opcional <> '' then
                obs_opcional := obs_opcional + ' + ';

            obs_opcional := obs_opcional +
                  TListItemText(lv_opcional.Items[x].Objects.FindDrawable('TxtDescricao')).Text;
        end;
    end;

    if vl_opcional > 0 then
        obs_opcional := obs_opcional + ' = ' + FormatFloat('#,##0.00', vl_opcional);
    //--------------------------


    if dm.AdicionarProdutoComanda(comanda,
                                  lbl_descricao.Tag,
                                  lbl_qtd.Text.ToInteger,
                                  lbl_qtd.Text.ToInteger * lbl_descricao.TagFloat,
                                  edt_obs.Text,
                                  obs_opcional,
                                  vl_opcional,
                                  erro) then
        layout_qtd.Visible := false
    else
        showmessage(erro);

end;

procedure TFrmAddItem.FormShow(Sender: TObject);
begin
    layout_qtd.Visible := false;
    ListarCategoria;
end;

procedure TFrmAddItem.img_fecharClick(Sender: TObject);
begin
    close;
end;

procedure TFrmAddItem.img_fechar_qtdClick(Sender: TObject);
begin
    layout_qtd.Visible := false;
end;

procedure TFrmAddItem.img_menosClick(Sender: TObject);
begin
    try
        lbl_qtd.Text := FormatFloat('00', lbl_qtd.Text.ToInteger + TImage(Sender).Tag);

        if lbl_qtd.Text.ToInteger < 1 then
            lbl_qtd.Text := '01';
    except
        lbl_qtd.Text := '01';
    end;
end;

procedure TFrmAddItem.img_voltarClick(Sender: TObject);
begin
    TabControl.GotoVisibleTab(0, TTabTransition.Slide);
end;

end.
