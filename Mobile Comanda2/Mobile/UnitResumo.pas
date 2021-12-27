unit UnitResumo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.DialogService, System.JSON;

type
  TFrmResumo = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    img_fechar: TImage;
    img_add_item: TImage;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Layout1: TLayout;
    lbl_comanda: TLabel;
    rect_encerrar: TRectangle;
    Label4: TLabel;
    Rectangle3: TRectangle;
    lbl_total: TLabel;
    lv_produto: TListView;
    img_delete: TImage;
    procedure img_fecharClick(Sender: TObject);
    procedure img_add_itemClick(Sender: TObject);
    procedure rect_encerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lv_produtoItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    procedure AddProdutoResumo(id_consumo, qtd: integer;
                               descricao, obs, obs_opcional: string;
                               preco, vl_opcional: double);
    procedure ListarProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResumo: TFrmResumo;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitDM, UnitAddItem;

procedure TFrmResumo.AddProdutoResumo(id_consumo, qtd: integer;
                                      descricao, obs, obs_opcional: string;
                                      preco, vl_opcional: double);
begin
    with lv_produto.Items.Add do
    begin
        Tag := id_consumo; // Mudei de id_produto para id_consumo...
        TListItemText(Objects.FindDrawable('TxtDescricao')).Text := FormatFloat('00', qtd) +
                                                                    ' x ' + descricao;
        TListItemText(Objects.FindDrawable('TxtPreco')).Text := FormatFloat('#,##0.00', preco);
        TListItemImage(Objects.FindDrawable('ImgDelete')).bitmap := img_delete.bitmap;

        TListItemText(Objects.FindDrawable('TxtObs')).Text := obs;
        TListItemText(Objects.FindDrawable('TxtObsOpcional')).Text := obs_opcional;
    end;
end;

procedure TFrmResumo.ListarProduto;
var
    x : integer;
    jsonArray: TJSONArray;
    erro: string;
    total : double;
begin
    total := 0;
    lv_produto.Items.Clear;

    if NOT dm.ListarProdutoComanda(lbl_comanda.Text, jsonArray, erro) then
    begin
        showmessage(erro);
        exit;
    end;


    for x := 0 to jsonArray.Size - 1 do
    begin
        AddProdutoResumo(jsonArray.Get(x).GetValue<integer>('ID_CONSUMO'),
                         jsonArray.Get(x).GetValue<integer>('QTD'),
                         jsonArray.Get(x).GetValue<string>('DESCRICAO'),
                         jsonArray.Get(x).GetValue<string>('OBS'),
                         jsonArray.Get(x).GetValue<string>('OBS_OPCIONAL'),
                         jsonArray.Get(x).GetValue<double>('VALOR_TOTAL'),
                         jsonArray.Get(x).GetValue<double>('VALOR_OPCIONAL')
                         );

        total := total + jsonArray.Get(x).GetValue<double>('VALOR_TOTAL');
    end;

    lbl_total.Text := FormatFloat('#,##0.00', total);
    jsonArray.DisposeOf;
end;

procedure TFrmResumo.lv_produtoItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
    if TListView(Sender).Selected <> nil then
    begin
        if ItemObject is TListItemImage then
        begin
            if TListItemImage(ItemObject).Name = 'ImgDelete' then
            begin
                TDialogService.MessageDialog('Confirma exclusão do item?',
                                 TMsgDlgType.mtConfirmation,
                                 [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                                 TMsgDlgBtn.mbNo,
                                 0,
                 procedure(const AResult: TModalResult)
                 var
                    erro: string;
                 begin
                    if AResult = mrYes then
                    begin
                        if dm.ExcluirProdutoCOmanda(lbl_comanda.Text,
                                                        lv_produto.Selected.Tag,
                                                        erro) = false then
                            showmessage(erro)
                        else
                            FrmResumo.ListarProduto;

                    end;
                 end);
            end;
        end;
    end;
end;

procedure TFrmResumo.FormShow(Sender: TObject);
begin
    ListarProduto;
end;

procedure TFrmResumo.img_add_itemClick(Sender: TObject);
begin
    //FrmPrincipal.AddItem(lbl_comanda.Text);
    if NOT Assigned(FrmAddItem) then
        Application.CreateForm(TFrmAddItem, FrmAddItem);

    FrmAddItem.comanda := lbl_comanda.Text;
    FrmAddItem.TabControl.ActiveTab := FrmAddItem.TabCategoria;
    FrmAddItem.ShowModal(procedure(ModalResult: TModalResult)
    begin
        FrmResumo.ListarProduto;
    end);
end;

procedure TFrmResumo.img_fecharClick(Sender: TObject);
begin
    close;
end;

procedure TFrmResumo.rect_encerrarClick(Sender: TObject);
begin
    TDialogService.MessageDialog('Confirma encerramento?',
                                 TMsgDlgType.mtConfirmation,
                                 [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                                 TMsgDlgBtn.mbNo,
                                 0,
     procedure(const AResult: TModalResult)
     var
        erro: string;
     begin
        if AResult = mrYes then
        begin

            if dm.EncerrarComanda(lbl_comanda.Text, erro) then
                close
            else
                showmessage(erro);

        end;
     end);
end;

end.
