unit UMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, math,
  System.Variants, FMX.VirtualKeyboard, FMX.Platform, FMX.Ani, System.threading,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation,
  FMX.MultiView, FMX.ListView.Types, FMX.ListView.Appearances, data.db,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.TabControl,
  FMX.EditBox, FMX.NumberBox, MultiDetailAppearanceU, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, data.Bind.EngExt,
  FMX.Bind.DBEngExt, data.Bind.Components, data.Bind.DBScope, System.ImageList,
  FMX.ImgList, FMX.Printer, System.Bluetooth, System.Bluetooth.Components,
  Datasnap.DBClient;

type
  TfrmMenu = class(TForm)
    Rectangle7: TRectangle;
    ImageList1: TImageList;
    Bluetooth: TBluetooth;
    ImageList2: TImageList;
    TabControl: TTabControl;
    TabMesa: TTabItem;
    ListViewMesa: TListView;
    ToolBar5: TToolBar;
    Label5: TLabel;
    BtnMenu: TButton;
    Image7: TImage;
    Layout_Menu: TLayout;
    Layout1: TLayout;
    FloatAnimationMenu: TFloatAnimation;
    Rectangle1: TRectangle;
    CircleMenu: TCircle;
    lblMenu: TLabel;
    ImageList3: TImageList;
    Image2: TImage;
    Layout4: TLayout;
    btnCardapio: TButton;
    btnMesas: TButton;
    btnConfiguracoes: TButton;
    btnSair: TButton;
    TabItens: TTabItem;
    ToolBar3: TToolBar;
    Label9: TLabel;
    btnVoltarItens: TButton;
    ListBox2: TListBox;
    ListBoxItem11: TListBoxItem;
    edtProduto: TEdit;
    btnBuscaProduto: TSearchEditButton;
    Label14: TLabel;
    ListBoxItem5: TListBoxItem;
    edtQtd: TEdit;
    BtnBuscaQtd: TSearchEditButton;
    Label15: TLabel;
    ListBoxItem6: TListBoxItem;
    edtPreco: TEdit;
    btnBuscaPreco: TSearchEditButton;
    Label10: TLabel;
    ListBoxItem7: TListBoxItem;
    edtTotalItem: TEdit;
    Label11: TLabel;
    btnExcluirItem: TButton;
    btnSalvarItem: TButton;
    TabPedido: TTabItem;
    ListViewPedido: TListView;
    ToolBar1: TToolBar;
    Label7: TLabel;
    btnVoltarPedido: TButton;
    Layout5: TLayout;
    Layout20: TLayout;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    CirclePedido: TCircle;
    Label24: TLabel;
    TabListaProd: TTabItem;
    ToolBar2: TToolBar;
    Label12: TLabel;
    btnVoltarProdutos: TButton;
    Rectangle3: TRectangle;
    Layout3: TLayout;
    edtPesqProduto: TEdit;
    btnPesqProduto: TSearchEditButton;
    Rectangle4: TRectangle;
    Label13: TLabel;
    lsProduto: TListView;
    TabImpressora: TTabItem;
    ToolBar11: TToolBar;
    Label16: TLabel;
    Button7: TButton;
    Button8: TButton;
    btnBuscaImp: TButton;
    ListView3: TListView;
    TabTeclado: TTabItem;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    lbl_valor: TLabel;
    img_salvar: TImage;
    Circle1: TCircle;
    img_limpar: TImage;
    layout_valor: TLayout;
    Layout8: TLayout;
    lbl_tecla7: TLabel;
    Layout10: TLayout;
    lbl_tecla8: TLabel;
    Layout11: TLayout;
    lbl_tecla9: TLabel;
    lbl_tecla4: TLayout;
    Label23: TLabel;
    Layout12: TLayout;
    lbl_tecla5: TLabel;
    Layout13: TLayout;
    lbl_tecla6: TLabel;
    Layout14: TLayout;
    lbl_tecla1: TLabel;
    Layout15: TLayout;
    lbl_tecla2: TLabel;
    Layout16: TLayout;
    lbl_tecla3: TLabel;
    Layout17: TLayout;
    lbl_tecla00: TLabel;
    Layout18: TLayout;
    lbl_tecla0: TLabel;
    Layout19: TLayout;
    img_backspace: TImage;
    TabComanda: TTabItem;
    ToolBar13: TToolBar;
    Label19: TLabel;
    Button11: TButton;
    Button12: TButton;
    Layout6: TLayout;
    ListViewComanda: TListView;
    Layout7: TLayout;
    Rectangle8: TRectangle;
    lblMesaCo: TLabel;
    lblDataHoraCo: TLabel;
    Layout9: TLayout;
    Rectangle9: TRectangle;
    lblMesaItem: TLabel;
    lblNomePe: TLabel;
    LayoutPedido: TLayout;
    FloatAnimationPedido: TFloatAnimation;
    Rectangle2: TRectangle;
    Image1: TImage;
    Layout2: TLayout;
    btnImpCo: TButton;
    btnAicionarIte: TButton;
    btnImpPe: TButton;
    btnSairPedido: TButton;
    btnAdicionarCo: TButton;
    lblDataPe: TLabel;
    FloatAnimationImp: TFloatAnimation;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    BindSourceDB3: TBindSourceDB;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkListControlToField3: TLinkListControlToField;
    Layout21: TLayout;
    Rectangle12: TRectangle;
    lblMesaIte: TLabel;
    lblComandaIte: TLabel;
    lblDataIte: TLabel;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
    BindSourceDB5: TBindSourceDB;
    lblTotalCo: TLabel;
    lblTotalGeral: TLabel;
    btnSelCo: TButton;
    BindSourceDB6: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    LinkListControlToField4: TLinkListControlToField;
    btnAtualiza: TButton;
    btnAtualizaCo: TButton;
    btnFecharVenda: TButton;
    TabConsumo: TTabItem;
    ToolBar4: TToolBar;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Layout22: TLayout;
    Layout23: TLayout;
    Rectangle13: TRectangle;
    lblMesaConsumo: TLabel;
    lblDataHoraConsumo: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    TabControlConsumo: TTabControl;
    tabListaFechar: TTabItem;
    tabValorFechar: TTabItem;
    ListViewFechar: TListView;
    ListBox3: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Line1: TLine;
    Label18: TLabel;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    edtValorPago: TEdit;
    ListBoxItem12: TListBoxItem;
    btnAddValor: TButton;
    SearchEditButton1: TSearchEditButton;
    lblNomeCo: TLabel;
    btnFinalizar: TButton;
    lblTotalCamanda: TLabel;
    lblTotalPagoCo: TLabel;
    lblSaldoComanda: TLabel;
    lblTotalPagoMe: TLabel;
    ListBoxItem13: TListBoxItem;
    Label17: TLabel;
    lblSaldoMesa: TLabel;
    Label27: TLabel;
    lblTotalMesa: TLabel;
    LinkPropertyToFieldText9: TLinkPropertyToField;
    LinkPropertyToFieldText12: TLinkPropertyToField;
    LinkPropertyToFieldText13: TLinkPropertyToField;
    LinkPropertyToFieldText14: TLinkPropertyToField;
    LinkPropertyToFieldText15: TLinkPropertyToField;
    LinkPropertyToFieldText16: TLinkPropertyToField;
    LinkPropertyToFieldText17: TLinkPropertyToField;
    LinkListControlToField6: TLinkListControlToField;
    LinkPropertyToFieldText10: TLinkPropertyToField;
    LinkPropertyToFieldText11: TLinkPropertyToField;
    LayoutAguarde: TLayout;
    Rectangle14: TRectangle;
    Label2: TLabel;
    AniIndicator1: TAniIndicator;
    procedure btnPesqMecanicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListViewMesaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewPedidoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnVoltarItensClick(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure btnPesqProdutoClick(Sender: TObject);
    procedure btnVoltarProdutosClick(Sender: TObject);
    procedure btnFecharVendaClick(Sender: TObject);
    procedure btnVoltarDetalhesClick(Sender: TObject);
    procedure btnSairImpressaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarPedidoClick(Sender: TObject);
    procedure btnConfProdutoClick(Sender: TObject);
    procedure lsProdutoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnVoltarConfigClick(Sender: TObject);
    procedure FloatAnimationMenuFinish(Sender: TObject);
    procedure CircleMenuClick(Sender: TObject);
    procedure CirclePedidoClick(Sender: TObject);
    procedure CircleImpressaoClick(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure btnAddQtdClick(Sender: TObject);
    procedure btnSubQtdClick(Sender: TObject);
    procedure btnAddPrecoClick(Sender: TObject);
    procedure btnSubPrecoClick(Sender: TObject);
    procedure btnBuscaImpClick(Sender: TObject);
    procedure btnConfigImpClick(Sender: TObject);
    procedure btnCardapioClick(Sender: TObject);
    procedure btnMesasClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure img_backspaceClick(Sender: TObject);
    procedure img_limparClick(Sender: TObject);
    procedure lbl_tecla0Click(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure edtQtdExit(Sender: TObject);
    procedure BtnBuscaQtdClick(Sender: TObject);
    procedure btnBuscaPrecoClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnAdicionarCoClick(Sender: TObject);
    procedure btnAicionarIteClick(Sender: TObject);
    procedure btnSairPedidoClick(Sender: TObject);
    procedure btnImpPeClick(Sender: TObject);
    procedure btnImpCoClick(Sender: TObject);
    procedure btnBuscaComandaClick(Sender: TObject);
    procedure ListViewComandaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnSelCoClick(Sender: TObject);
    procedure ListView3ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure Layout8Click(Sender: TObject);
    procedure lbl_tecla2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure btnAtualizaCoClick(Sender: TObject);
    procedure ListViewFecharItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnAddValorClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
    Sinal, tipo, opp, tela, vQuantidade, vValor: string;
    vIdProduto: Integer;
    FSocket: TBluetoothSocket;
    function ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
    function ConectarImpressora(pNomeDevice: String): Boolean;
    function ColocaTextoDir(Texto: string; Qtd: Integer; Ch: string): string;
    procedure OcultaMenu(vTela: String);
    procedure ExibeMenu(vTela: String);
    procedure CalcItem;
    procedure FecharVenda;
    procedure ImpVenda;
    procedure ImpPedido;
    procedure TestarImpressao;
    procedure calculaTotal;
    procedure UpdateStatusMesa(id: Integer);
    procedure UpdateComandaMesa(fk, id: Integer);

    procedure InsereComanda(CODIGO, FK_MESA, TOTAL: extended; Situacao: string;
      Data_hora: TDateTime);
    procedure GetItens(produto: string; IdProduto: Integer;
      Qtd, PRECO, TOTAL: extended);
    procedure SetItens(CODIGO, COMANDA, Qtd, PRECO, TOTAL, produto: extended);
    procedure CancelaItem;
    procedure limpaItens;
    procedure Abremesa;
    procedure ImprimiuItem(id, fk_comanda: Integer);
    procedure UpdateComandaPessoa(vWhere: string);
    procedure RatearComanda(id: Integer);
    procedure DividirComanda;
    procedure LimpaRateioPessoa(CODIGO: Integer);
    procedure DistribuiValores(vRateio, vPercentual: extended;
      Comanda_master, Comanda_Pessoa, Comanda_Itens: Integer);
    procedure FechaComandaPessoa;
    procedure FechaComandaMaster;
    procedure FechaMesa;
  public
    { Public declarations }
    TipoImpressao: String;
    vidComanda: Integer;
    function ComandaMasterExiste(id: Integer): Boolean;
    function ComandaPessoaExiste(id: Integer): Boolean;
    procedure AbreComanda_Itens(id: Integer);
    procedure CalculaSaldo;
  end;

var
  frmMenu: TfrmMenu;

Const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';

implementation

{$R *.fmx}

uses uComanda, uDados, uConfig;

procedure Tecla_Backspace();
var
  valor: string;
begin
  with frmMenu do
  begin
    valor := lbl_valor.Text; // 5.200,00
    valor := StringReplace(valor, '.', '', [rfReplaceAll]); // 5200,00
    valor := StringReplace(valor, ',', '', [rfReplaceAll]); // 520000

    if Length(valor) > 1 then
      valor := Copy(valor, 1, Length(valor) - 1)
    else
      valor := '0';

    lbl_valor.Text := FormatFloat('#,##0.00', StrToFloat(valor) / 100);
  end;
end;

procedure Tecla_Numero(lbl: TObject);
var
  valor: string;
begin
  with frmMenu do
  begin
    valor := lbl_valor.Text;
    valor := StringReplace(valor, '.', '', [rfReplaceAll]);
    valor := StringReplace(valor, ',', '', [rfReplaceAll]);

    valor := valor + TLabel(lbl).Text;

    lbl_valor.Text := FormatFloat('#,##0.00', StrToFloat(valor) / 100);
  end;
end;

procedure TfrmMenu.btnSairClick(Sender: TObject);
begin
  OcultaMenu('MENU');
  Application.Terminate;
end;

procedure TfrmMenu.btnSairImpressaoClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.btnSairPedidoClick(Sender: TObject);
begin
  OcultaMenu('PEDIDO');
end;

procedure TfrmMenu.btnFecharVendaClick(Sender: TObject);
begin
  try
    OcultaMenu('PEDIDO');
    LayoutAguarde.Visible := true;
    TThread.CreateAnonymousThread(
      procedure
      begin
        ComandaMasterExiste(vidComanda);
        ComandaPessoaExiste(vidComanda);
        AbreComanda_Itens(Dados.qryComanda_pessoaCODIGO.AsInteger);
        CalculaSaldo;

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            TabControl.ActiveTab := TabConsumo;
            LayoutAguarde.Visible := false;
          end);
      end).Start;
  except
    on e: exception do
    begin
      LayoutAguarde.Visible := false;
      raise exception.Create(e.Message);
    end;
  end;

end;

procedure TfrmMenu.LimpaRateioPessoa(CODIGO: Integer);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'DELETE FROM COMANDA_RATEIO WHERE FK_COMANDA_PESSOA=:PESSOA';
  Dados.qryExecute.Params[0].AsInteger := CODIGO;
  Dados.qryExecute.ExecSQL;
end;

procedure TfrmMenu.DistribuiValores(vRateio, vPercentual: extended;
Comanda_master, Comanda_Pessoa, Comanda_Itens: Integer);
var
  vDif, vTotal: extended;
begin
  vTotal := 0;

  Dados.qryComanda_Itens.Close;
  Dados.qryComanda_Itens.Params[0].Value := Comanda_Itens;
  Dados.qryComanda_Itens.Open;
  Dados.qryComanda_Itens.First;

  while not Dados.qryComanda_Itens.Eof do
  begin
    if Dados.qryComanda_pessoaTOTAL_RATEIO.AsFloat > 0 then
    begin
      Dados.updComandaRateio.Close;
      Dados.updComandaRateio.paramByName('CODIGO').AsInteger :=
        Dados.MaiorRateio;
      Dados.updComandaRateio.paramByName('FK_COMANDA_PESSOA').AsInteger :=
        Comanda_Pessoa;
      Dados.updComandaRateio.paramByName('FK_COMANDA').AsInteger :=
        Comanda_master;
      Dados.updComandaRateio.paramByName('FK_PRODUTO').AsInteger :=
        Dados.qryComanda_ItensFK_PRODUTO.Value;
      Dados.updComandaRateio.paramByName('PERCENTUAL').AsFloat := vPercentual;
      Dados.updComandaRateio.paramByName('QTD').AsFloat :=
        (Dados.qryComanda_ItensQTD.AsFloat * vPercentual) / 100;
      Dados.updComandaRateio.paramByName('PRECO').AsFloat :=
        Dados.qryComanda_ItensPRECO.AsFloat;

      Dados.updComandaRateio.paramByName('TOTAL').AsFloat :=
        SimpleRoundTo(Dados.qryComanda_ItensPRECO.AsFloat *
        Dados.updComandaRateio.paramByName('QTD').AsFloat, -2);

      Dados.updComandaRateio.ExecSQL;

      vTotal := vTotal + Dados.qryComanda_RateioTOTAL.AsFloat;
      Dados.qryComanda_Itens.Next;
    end;

  end;
end;

procedure TfrmMenu.DividirComanda;
var
  vComanda_pessoa: Integer;
begin
  vComanda_pessoa := -1;

  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'select codigo, total, total_rateio, percentual, fk_comanda  from comanda_pessoa where fk_comanda=:id';
  Dados.qryconsulta.Params[0].AsInteger :=
    Dados.qrycomanda_masterCODIGO.AsInteger;
  Dados.qryconsulta.Open;

  Dados.qryconsulta.First;

  while not Dados.qryconsulta.Eof do
  begin
    LimpaRateioPessoa(Dados.qryconsulta.FieldByName('CODIGO').AsInteger);

    if Dados.qryconsulta.FieldByName('PERCENTUAL').AsFloat = 100 then
    begin
      DistribuiValores(Dados.qryconsulta.FieldByName('TOTAL').AsFloat,
        Dados.qryconsulta.FieldByName('PERCENTUAL').AsFloat,
        Dados.qryconsulta.FieldByName('FK_COMANDA').Value,
        Dados.qryconsulta.FieldByName('CODIGO').Value,
        Dados.qryconsulta.FieldByName('CODIGO').Value);
    end
    else
    begin

      DistribuiValores(Dados.qryconsulta.FieldByName('TOTAL_RATEIO').AsFloat,
        Dados.qryconsulta.FieldByName('PERCENTUAL').AsFloat,
        Dados.qryconsulta.FieldByName('FK_COMANDA').Value,
        Dados.qryconsulta.FieldByName('CODIGO').Value,
        Dados.qryconsulta.FieldByName('CODIGO').Value);

    end;
    Dados.qryconsulta.Next;
  end;
  // ComandaPessoaExiste(Dados.qrycomanda_masterCODIGO.AsInteger);
end;

procedure TfrmMenu.FecharVenda;
begin
  DividirComanda;
  FechaComandaMaster;
  FechaComandaPessoa;
  FechaMesa;

end;

procedure TfrmMenu.btnFinalizarClick(Sender: TObject);
begin
  try
    if not(Dados.qryComanda_pessoaTSALDOME.Value = 0) then
      raise exception.Create('Informe o Valor Pago!');
    LayoutAguarde.Visible := true;
    TThread.CreateAnonymousThread(
      procedure
      begin
        RatearComanda(Dados.qrycomanda_masterCODIGO.Value);
        FecharVenda;
        Sleep(10);
        LayoutAguarde.Visible := false;

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            TabControl.ActiveTab := TabMesa;
          end);
      end).Start;
  except
    on e: exception do
    begin
      LayoutAguarde.Visible := false;
      raise exception.Create(e.Message);
    end;
  end;
end;

procedure TfrmMenu.RatearComanda(id: Integer);
var
  nCount: Integer;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Clear;
  Dados.qryconsulta.SQL.add('select');
  Dados.qryconsulta.SQL.add('distinct(ci.fk_comanda_pessoa)');
  Dados.qryconsulta.SQL.add('from comanda_itens ci');
  Dados.qryconsulta.SQL.add
    ('left join comanda_pessoa cp on cp.codigo=ci.fk_comanda_pessoa');
  Dados.qryconsulta.SQL.add('where');
  Dados.qryconsulta.SQL.add('cp.fk_comanda=:comanda');
  Dados.qryconsulta.SQL.add('group by 1');
  Dados.qryconsulta.Params[0].Value := id;
  Dados.qryconsulta.Open;

  nCount := Dados.qryconsulta.RecordCount;

  if nCount > 1 then
  begin
    Dados.qryConfigura.Close;
    Dados.qryConfigura.SQL.Clear;

    Dados.qryconsulta.SQL.Text :=
      'select codigo, total_rateio from comanda_pessoa where fk_comanda=:id';
    Dados.qryconsulta.Params[0].AsInteger := id;
    Dados.qryconsulta.Open;

    Dados.qryconsulta.First;

    while not Dados.qryconsulta.Eof do
    begin

      Dados.qryExecute.Close;
      Dados.qryExecute.SQL.Text :=
        'UPDATE COMANDA_PESSOA SET PERCENTUAL=:PERCENTUAL WHERE CODIGO=:CODIGO';

      Dados.qryExecute.Params[0].AsFloat := 100;
      Dados.qryExecute.Params[1].AsFloat := Dados.qryconsulta.FieldByName
        ('CODIGO').AsInteger;
      Dados.qryExecute.ExecSQL;
      Dados.qryconsulta.Next;
    end;

  end
  else
  begin

    Dados.qryConfigura.Close;
    Dados.qryConfigura.SQL.Clear;

    Dados.qryconsulta.SQL.Text :=
      'select codigo, total_rateio from comanda_pessoa where fk_comanda=:id';
    Dados.qryconsulta.Params[0].AsInteger := id;
    Dados.qryconsulta.Open;

    Dados.qryconsulta.First;

    while not Dados.qryconsulta.Eof do
    begin

      Dados.qryExecute.Close;
      Dados.qryExecute.SQL.Text :=
        'UPDATE COMANDA_PESSOA SET PERCENTUAL=:PERCENTUAL WHERE CODIGO=:CODIGO';

      Dados.qryExecute.Params[0].AsFloat :=
        (Dados.qryconsulta.FieldByName('TOTAL_RATEIO').AsFloat /
        Dados.qrycomanda_masterTOTAL.AsFloat) * 100;
      Dados.qryExecute.Params[1].AsFloat := Dados.qryconsulta.FieldByName
        ('CODIGO').AsInteger;
      Dados.qryExecute.ExecSQL;
      Dados.qryconsulta.Next;
    end;
  end;

end;

procedure TfrmMenu.btnImpCoClick(Sender: TObject);
begin
  OcultaMenu('PEDIDO');
  TipoImpressao := 'COMANDA';
  TabControl.ActiveTab := TabImpressora;
end;

procedure TfrmMenu.btnImpPeClick(Sender: TObject);
begin
  OcultaMenu('PEDIDO');
  TipoImpressao := 'PEDIDO';
  TabControl.ActiveTab := TabImpressora;
end;

procedure TfrmMenu.btnMesasClick(Sender: TObject);
begin
  OcultaMenu('MENU');
end;

procedure TfrmMenu.btnVoltarPedidoClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabMesa;
end;

procedure TfrmMenu.btnVoltarProdutosClick(Sender: TObject);
begin
  if tela = 'MENU' then
    TabControl.ActiveTab := TabMesa
  else if tela = 'PEDIDO' then
    TabControl.ActiveTab := TabMesa
  else
    TabControl.ActiveTab := TabItens;
end;

procedure TfrmMenu.TestarImpressao;
begin
  if Bluetooth.Enabled = false then
    Bluetooth.Enabled := true;
  if (Dados.qryImpressorasdescricao.Value <> '') then
  begin
    if ConectarImpressora(Dados.qryImpressorasdescricao.AsString) then
    begin
      if (FSocket <> nil) and (FSocket.Connected) then
      begin
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(64)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(1)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(8)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(16)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(32)));

        FSocket.SendData(TEncoding.UTF8.GetBytes('TDevRocks' + chr(13)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(1)));
        FSocket.SendData(TEncoding.UTF8.GetBytes('Datecs DPP 250' + chr(13)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(1)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(0)));

        FSocket.SendData(TEncoding.UTF8.GetBytes
          ('Imprimindo direto para Bluetooth '));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(1)));
        FSocket.SendData(TEncoding.UTF8.GetBytes
          ('Imprimindo direto para Bluetooth '));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(1)));

        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(0)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(5)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(29) + chr(107) + chr(2) +
          '8983847583721' + chr(0)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(5)));

        MessageDlg('Impressão Realizado com Sucesso.',
          System.UITypes.TMsgDlgType.mtConfirmation,
          [System.UITypes.TMsgDlgBtn.mbOK], 0,
          procedure(const BotaoPressionado: TModalResult)
          begin
            case BotaoPressionado of
              mrOk:
                begin
                  Application.Terminate;
                end;
            end;
          end);
      end;
    end
    else
    begin
      ShowMessage('Dispositivo Desconectado!');
    end;
  end
  else
  begin
    ShowMessage('Selecione um dispositivo');
  end;
  Bluetooth.Enabled := false;
end;

procedure TfrmMenu.GetItens(produto: string; IdProduto: Integer;
Qtd, PRECO, TOTAL: extended);
begin
  edtProduto.Text := produto;
  if Qtd <> -1 then
    edtQtd.Text := FormatFloat('0.00', Qtd);
  edtPreco.Text := FormatFloat('0.00', PRECO);
  edtTotalItem.Text := FormatFloat('0.00', TOTAL);
  vIdProduto := IdProduto;
end;

procedure TfrmMenu.SearchEditButton1Click(Sender: TObject);
begin
  TabControl.ActiveTab := TabTeclado;
  vQuantidade := 'N';
  vValor := 'S';
  tela := 'Consumo';
  lbl_valor.Text := edtValorPago.Text;
end;

procedure TfrmMenu.SetItens(CODIGO, COMANDA, Qtd, PRECO, TOTAL,
  produto: extended);
begin

  Dados.UpdItens.Close;
  Dados.UpdItens.paramByName('CODIGO').AsFloat := CODIGO;
  Dados.UpdItens.paramByName('FK_COMANDA_PESSOA').AsFloat := COMANDA;
  Dados.UpdItens.paramByName('FK_PRODUTO').AsFloat := produto;
  Dados.UpdItens.paramByName('QTD').AsFloat := Qtd;
  Dados.UpdItens.paramByName('PRECO').AsFloat := PRECO;
  Dados.UpdItens.paramByName('TOTAL').AsFloat := TOTAL;
  Dados.UpdItens.paramByName('PERCENTUAL').AsFloat := 0;
  Dados.UpdItens.paramByName('SITUACAO').Value := 'A';
  Dados.UpdItens.paramByName('DATA_HORA').AsDateTime := Now;
  Dados.UpdItens.ExecSQL;
end;

procedure TfrmMenu.CancelaItem;
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.add
    ('update comanda_itens set situacao=''C'' where codigo=:codigo');
  Dados.qryExecute.paramByName('codigo').Value :=
    Dados.qryComanda_ItensCODIGO.Value;
  Dados.qryExecute.ExecSQL;
  Dados.qryComanda_Itens.Refresh;
end;

procedure TfrmMenu.img_backspaceClick(Sender: TObject);
begin
  Tecla_Backspace();
end;

procedure TfrmMenu.img_limparClick(Sender: TObject);
begin
  lbl_valor.Text := '0,00';
end;

procedure TfrmMenu.img_salvarClick(Sender: TObject);
begin

  if tela = 'Consumo' then
  begin
    edtValorPago.Text := lbl_valor.Text;
    TabControl.ActiveTab := TabConsumo;
    TabControlConsumo.ActiveTab := tabValorFechar;
  end
  else
  begin
    if vQuantidade = 'S' then
      edtQtd.Text := lbl_valor.Text
    else
      edtPreco.Text := lbl_valor.Text;
    TabControl.ActiveTab := TabItens;
  end;

  calculaTotal;
end;

procedure TfrmMenu.btnConfigImpClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabImpressora;
  tela := 'CONFIGURACAO';
end;

procedure TfrmMenu.btnConfiguracoesClick(Sender: TObject);
begin
  frmconfig.show;
end;

procedure TfrmMenu.Button10Click(Sender: TObject);
begin
  TabControl.ActiveTab := TabMesa;
end;

procedure TfrmMenu.Button12Click(Sender: TObject);
begin
  if tela = 'Mesa' then
    TabControl.ActiveTab := TabMesa
  else
    TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.Button2Click(Sender: TObject);
begin
  TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.Button8Click(Sender: TObject);
begin
  TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.btnExcluirItemClick(Sender: TObject);
begin
  try
    if opp <> 'Novo' then
    begin
      MessageDlg('Deseja Cancelar Pedido?',
        System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
        procedure(const AResult: System.UITypes.TModalResult)
        begin
          case AResult of
            mrYES:
              begin
                CancelaItem;
              end;
            mrNo:
              begin
                // caso não

              end;
          end;
        end)
    end;
    TabControl.ActiveTab := TabPedido;
  except
    On e: exception do
      raise exception.Create('Erro:' + e.Message);
  end;
end;

procedure TfrmMenu.btnCardapioClick(Sender: TObject);
begin

  OcultaMenu('MENU');

  if not Dados.qryProdutos.Active then
  begin
    Dados.qryProdutos.Close;
    Dados.qryProdutos.Params[0].Value := edtPesqProduto.Text + '%';
    Dados.qryProdutos.Params[1].Value := edtPesqProduto.Text + '%';
    Dados.qryProdutos.Open;
  end;

  tela := 'MENU';

  TabControl.ActiveTab := TabListaProd;

end;

procedure TfrmMenu.btnSalvarItemClick(Sender: TObject);
var
  vCodigo: Integer;
begin
  if vIdProduto = 0 then
  begin
    ShowMessage('Informe o Produto!');
    exit;
  end;
  if opp = 'Novo' then
    vCodigo := Dados.MaiorItem
  else
    vCodigo := Dados.qryComanda_ItensCODIGO.Value;

  if not Dados.qryComanda_pessoaCODIGO.AsInteger > 0 then
  begin
    ShowMessage('Comanda não encontrada!');
    exit;
  end;

  LayoutAguarde.Visible := true;

  try

    TThread.CreateAnonymousThread(
      procedure
      begin
        SetItens(vCodigo, Dados.qryComanda_pessoaCODIGO.Value,
          strtofloatdef(edtQtd.Text, 1), strtofloatdef(edtPreco.Text, 0),
          strtofloatdef(edtTotalItem.Text, 0), vIdProduto);

        Dados.qryComanda_Itens.Refresh;
        CalculaSaldo;

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            TabControl.ActiveTab := TabPedido;
            Sleep(10);
            LayoutAguarde.Visible := false;
          end);
      end).Start;

  except
    On e: exception do
    begin
      LayoutAguarde.Visible := false;
      raise exception.Create('Erro:' + e.Message);
    end;
  end;

end;

procedure TfrmMenu.btnSelCoClick(Sender: TObject);
begin
  OcultaMenu('PEDIDO');
  tela := 'Itens';
  ComandaPessoaExiste(Dados.qrycomanda_masterCODIGO.Value);
  TabControl.ActiveTab := TabComanda;
end;

procedure TfrmMenu.btnConfProdutoClick(Sender: TObject);
begin
  if tela <> 'MENU' then
  begin

    Dados.eCod := Dados.qryProdutosCODIGO.Value;
    edtProduto.Text := Dados.qryProdutosDESCRICAO.AsString;
    edtPreco.Text := Dados.qryProdutosPR_VENDA.AsString;
    TabControl.ActiveTab := TabItens;
  end
  else
  begin
    TabControl.ActiveTab := TabListaProd;
  end;

end;

procedure TfrmMenu.btnPesqMecanicoClick(Sender: TObject);
var
  FService: IFMXVirtualKeyboardService;
begin
  try
    Application.ProcessMessages;

    TPlatformServices.Current.SupportsPlatformService
      (IFMXVirtualKeyboardService, IInterface(FService));
    if (FService <> nil) then
    begin
      FService.HideVirtualKeyboard;
    end;
  finally

  end;
end;

procedure TfrmMenu.btnPesqProdutoClick(Sender: TObject);
begin

  if edtPesqProduto.Text = '' then
  begin
    ShowMessage('Informe o produto');
    exit;
  end;

  try
    LayoutAguarde.Visible := true;
    TThread.CreateAnonymousThread(
      procedure
      begin
        Dados.qryProdutos.Close;
        Dados.qryProdutos.Params[0].Value := edtPesqProduto.Text + '%';
        Dados.qryProdutos.Params[1].Value := edtPesqProduto.Text + '%';
        Dados.qryProdutos.Open;

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            edtPesqProduto.Text := '';
            LayoutAguarde.Visible := false;
          end);
      end).Start;
  except
    On e: exception do
    begin
      LayoutAguarde.Visible := false;
      raise exception.Create(e.Message);
    end;

  end;

end;

procedure TfrmMenu.CalcItem;
begin
  edtTotalItem.Text := FormatFloat('0.00', strtofloatdef(edtPreco.Text, 0) *
    strtofloatdef(edtQtd.Text, 0));
end;

procedure TfrmMenu.btnVoltarItensClick(Sender: TObject);
begin
  if Dados.qryComanda_Itens.State in dsEditmodes then
    Dados.qryComanda_Itens.Cancel;
  TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.btnSubPrecoClick(Sender: TObject);
begin
  if strtofloatdef(edtPreco.Text, 1) > 1 then
    edtPreco.Text := FormatFloat('0.00', strtofloatdef(edtPreco.Text, 1) - 1);
  CalcItem;
end;

procedure TfrmMenu.btnSubQtdClick(Sender: TObject);
begin
  if strtofloatdef(edtQtd.Text, 1) > 1 then
    edtQtd.Text := FormatFloat('0.00', strtofloatdef(edtQtd.Text, 1) - 1);

  CalcItem;
end;

procedure TfrmMenu.btnVoltarConfigClick(Sender: TObject);
begin
  if tela = 'MENU' then
    TabControl.ActiveTab := TabMesa
  else
    Application.Terminate;
end;

procedure TfrmMenu.btnVoltarDetalhesClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabPedido;
end;

procedure TfrmMenu.OcultaMenu(vTela: String);
begin
  if vTela = 'MENU' then
  begin
    Sinal := '+';
    FloatAnimationMenu.Inverse := true;
    FloatAnimationMenu.Start;

    CircleMenu.RotationAngle := 180;
    CircleMenu.AnimateFloat('RotationAngle', 0, 0.5, TAnimationType.InOut,
      TInterpolationType.Circular);
  end;

  if vTela = 'PEDIDO' then
  begin
    Sinal := '+';
    FloatAnimationPedido.Inverse := true;
    FloatAnimationPedido.Start;

    CirclePedido.RotationAngle := 180;
    CirclePedido.AnimateFloat('RotationAngle', 0, 0.5, TAnimationType.InOut,
      TInterpolationType.Circular);
  end;

end;

procedure TfrmMenu.CircleImpressaoClick(Sender: TObject);
begin
  if Sinal = '+' then
  begin
    ExibeMenu('IMPRESSAO');
  end
  else
    OcultaMenu('IMPRESSAO');
end;

procedure TfrmMenu.CircleMenuClick(Sender: TObject);
begin
  if Sinal = '+' then
  begin
    ExibeMenu('MENU');
  end
  else
    OcultaMenu('MENU');

end;

procedure TfrmMenu.CirclePedidoClick(Sender: TObject);
begin
  if Sinal = '+' then
  begin
    ExibeMenu('PEDIDO');
  end
  else
    OcultaMenu('PEDIDO');
end;

function TfrmMenu.ComandaPessoaExiste(id: Integer): Boolean;
begin
  result := false;

  Dados.qryComanda_Pessoa.Close;
  Dados.qryComanda_Pessoa.Params[0].Value := id;
  Dados.qryComanda_Pessoa.Open;

  if not Dados.qryComanda_Pessoa.IsEmpty then
    result := true;

end;

procedure TfrmMenu.Abremesa;
begin
  Dados.qryMesas.Close;
  Dados.qryMesas.Open;
end;

procedure TfrmMenu.btnAddPrecoClick(Sender: TObject);
begin
  edtPreco.Text := FormatFloat('0.00', strtofloatdef(edtPreco.Text, 1) + 1);
  CalcItem;
end;

procedure TfrmMenu.btnAddQtdClick(Sender: TObject);
begin
  edtQtd.Text := FormatFloat('0.00', strtofloatdef(edtQtd.Text, 1) + 1);
  CalcItem;
end;

procedure TfrmMenu.btnAddValorClick(Sender: TObject);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'update comanda_pessoa set total_rateio=:rateio where codigo=:cod';
  Dados.qryExecute.Params[0].AsFloat := strtofloatdef(edtValorPago.Text, 0);
  Dados.qryExecute.Params[1].Value := Dados.qryComanda_pessoaCODIGO.Value;
  Dados.qryExecute.ExecSQL;
  TabControlConsumo.ActiveTab := tabListaFechar;
  Dados.qryComanda_Pessoa.Refresh;
end;

procedure TfrmMenu.btnAdicionarCoClick(Sender: TObject);
begin
  OcultaMenu('PEDIDO');
  frmComanda.show;
  frmComanda.opp := 'Novo';
end;

procedure TfrmMenu.btnAicionarIteClick(Sender: TObject);
begin

  if Dados.qryComanda_Pessoa.IsEmpty then
  begin
    ShowMessage('Não existe comanda cadastrada!');
    exit;
  end;

  limpaItens;
  opp := 'Novo';
  TabControl.ActiveTab := TabItens;
  OcultaMenu('PEDIDO');
end;

procedure TfrmMenu.btnAtualizaClick(Sender: TObject);
begin
  LayoutAguarde.Visible := true;
  TThread.CreateAnonymousThread(
    procedure
    begin
      Abremesa;
      Sleep(100);
      LayoutAguarde.Visible := false;
    end).Start;
end;

procedure TfrmMenu.btnAtualizaCoClick(Sender: TObject);
begin
  try
    LayoutAguarde.Visible := true;
    TThread.CreateAnonymousThread(
      procedure
      begin
        ComandaMasterExiste(vidComanda);
        ComandaPessoaExiste(vidComanda);
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            AbreComanda_Itens(Dados.qryComanda_pessoaCODIGO.Value);
            CalculaSaldo;
            TabControl.ActiveTab := TabPedido;
            Sleep(10);
            LayoutAguarde.Visible := false;
          end);
      end).Start;
  except
    on e: exception do
    begin
      LayoutAguarde.Visible := false;
      raise exception.Create(e.Message);
    end;

  end;
end;

procedure TfrmMenu.btnBuscaComandaClick(Sender: TObject);
begin
  tela := 'Itens';
  TabControl.ActiveTab := TabComanda;
end;

procedure TfrmMenu.btnBuscaImpClick(Sender: TObject);
var
  lDevice: TBluetoothDevice;
begin
  if Bluetooth.Enabled = false then
    Bluetooth.Enabled := true;
  try

    Dados.qryImpressoras.Close;
    Dados.qryImpressoras.Params[0].Value := '%';
    Dados.qryImpressoras.Open;

    for lDevice in Bluetooth.PairedDevices do
    begin
      if not Dados.qryImpressoras.Locate('descricao', lDevice.DeviceName, [])
      then
      begin
        Dados.qryImpressoras.Insert;
        Dados.qryImpressorasdescricao.Value := lDevice.DeviceName;
        Dados.qryImpressorastipo.Value := 'COZINHA';
        Dados.qryImpressorasativo.Value := 'S';
        Dados.qryImpressorasvias.Value := '48 VIAS';
        Dados.qryImpressoras.Post;
      end;
    end;
    if not Dados.qryImpressoras.IsEmpty then
      ShowMessage('Pesquisa concluida com sucesso!');
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmMenu.FloatAnimationMenuFinish(Sender: TObject);
begin
  if FloatAnimationMenu.Inverse = true then
    Layout_Menu.Visible := false;

end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
{$IF Defined(ANDROID) OR Defined(IOS)}
  formatsettings.ShortDateFormat := 'dd-mm-yyyy';
  formatsettings.DateSeparator := '-';
  formatsettings.DecimalSeparator := '.';
  formatsettings.ThousandSeparator := ',';
{$ELSE}
  formatsettings.ShortDateFormat := 'dd-mm-yyyy';
  formatsettings.DateSeparator := '-';
  formatsettings.DecimalSeparator := '.';
  formatsettings.ThousandSeparator := ',';
{$IFEND}
  Layout_Menu.Visible := false;
  LayoutPedido.Visible := false;
end;

procedure TfrmMenu.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
Shift: TShiftState);

var
  Fechar: Boolean;
begin
  if TabControl.ActiveTab = TabMesa then
  begin
    if Key = vkHardwareBack then
    begin
      Key := 0;
    end;
  end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  TabControl.ActiveTab := TabMesa;
  Sinal := '+';
end;

function TfrmMenu.ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
var
  lDevice: TBluetoothDevice;
begin
  result := nil;
  for lDevice in Bluetooth.PairedDevices do
  begin
    if lDevice.DeviceName = pNomeDevice then
    begin
      result := lDevice;
    end;
  end;
end;

function TfrmMenu.ColocaTextoDir(Texto: string; Qtd: Integer;
Ch: string): string;
var
  x: Integer;
  str: string;
begin
  if Length(Texto) > Qtd then
    result := Copy(Texto, (Length(Texto) - Qtd) + 1, Length(Texto))
  else
  begin
    str := '';
    for x := Length(Texto) to Qtd - 1 do
    begin
      str := str + Ch;
    end;
    result := Texto + str;
  end
  { endif };
end;

function TfrmMenu.ConectarImpressora(pNomeDevice: String): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  result := false;
  lDevice := ObterDevicePeloNome(pNomeDevice);
  if lDevice <> nil then
  begin
    FSocket := lDevice.CreateClientSocket(StringToGUID(UUID), false);
    if FSocket <> nil then
    begin
      FSocket.Connect;
      result := FSocket.Connected
    end;
  end;
end;

procedure TfrmMenu.edtPrecoExit(Sender: TObject);
begin
  calculaTotal;
end;

procedure TfrmMenu.edtQtdExit(Sender: TObject);
begin
  calculaTotal;
end;

procedure TfrmMenu.calculaTotal;
var
  TOTAL, PRECO, Qtd: extended;
begin
  PRECO := strtofloatdef(edtPreco.Text, 0);
  Qtd := strtofloatdef(edtQtd.Text, 0);
  TOTAL := PRECO * Qtd;

  edtTotalItem.Text := FormatFloat(',0.00', TOTAL);

end;

procedure TfrmMenu.ExibeMenu(vTela: String);
begin
  if vTela = 'MENU' then
  begin
    Sinal := '-';
    Layout_Menu.Position.Y := frmMenu.Height + 20;
    Layout_Menu.Visible := true;

    FloatAnimationMenu.Inverse := false;
    FloatAnimationMenu.StartValue := frmMenu.Height + 20;
    FloatAnimationMenu.StopValue := 0;
    FloatAnimationMenu.Start;

    CircleMenu.RotationAngle := 0;
    CircleMenu.AnimateFloat('RotationAngle', 180, 0.5, TAnimationType.InOut,
      TInterpolationType.Circular);
  end;

  if vTela = 'PEDIDO' then
  begin
    Sinal := '-';
    LayoutPedido.Position.x := frmMenu.Width + 20;
    LayoutPedido.Visible := true;

    FloatAnimationPedido.Inverse := false;
    FloatAnimationPedido.StartValue := frmMenu.Width + 20;
    FloatAnimationPedido.StopValue := 0;
    FloatAnimationPedido.Start;

    CirclePedido.RotationAngle := 0;
    CirclePedido.AnimateFloat('RotationAngle', 180, 0.5, TAnimationType.InOut,
      TInterpolationType.Circular);
  end;

end;

procedure TfrmMenu.ImpVenda;
var
  Texto: string;
  Item: Integer;
begin

  Sleep(100);

  if Bluetooth.Enabled = false then
  begin
    Bluetooth.Enabled := true;
    ShowMessage('Conectando impressora!' + sLineBreak +
      'Tente imprimir novamente!');
    exit;
  end;

  if Dados.qryConfigura.Active = false then
    Dados.qryConfigura.Open;

  if (VarToStrDef(Dados.qryImpressorasdescricao.Value, '') <> '') then
  begin

    if ConectarImpressora(Dados.qryImpressorasdescricao.AsString) then
    begin
      if (FSocket <> nil) and (FSocket.Connected) then
      begin
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(64)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(1)));

        // cabeçalho da empresa

        if not Dados.qryEmpresa.Active then
        begin
          Dados.qryEmpresa.Close;
          Dados.qryEmpresa.Open;
        end;

        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(12)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(1)));

        Texto := Copy(VarToStrDef(Dados.qryEmpresaRAZAO.Value, ''), 1, 32);
        FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));

        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) + chr(0)));
        FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) + chr(0)));

        if Dados.qryImpressorasvias.Value = '48 vias' then
        begin

          Texto := '--------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'MESA....:' + Dados.qryMesasNOME.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(0)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'COMANDA.:' + Dados.qryComanda_pessoaNOME.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(0)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'DATA...:' + Dados.qrycomanda_masterDATA_HORA.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := '--------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));
          Texto := 'COD|DESCRICAO             |QTD  ';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := '--------------------------------';

          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Dados.qryComanda_Itens.First;

          Item := 1;
          while not Dados.qryComanda_Itens.Eof do
          begin
            Texto := ColocaTextoDir
              (Copy(Dados.qryComanda_ItensFK_PRODUTO.AsString + '-' +
              Dados.qryComanda_ItensVIRTUAL_PRODUTO.Value, 1, 32), 32, ' ');
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));

            Texto := Dados.qryComanda_ItensVIRTUAL_QTD.Value;
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Dados.qryComanda_Itens.Next;
          end;

          Texto := '--------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'Total...:' + FormatFloat(',0.00',
            strtofloatdef(lblTotalCo.Text, 0));
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(2)));
        end
        else
        begin

          Texto := '------------------------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'MESA....:' + Dados.qryMesasNOME.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97) + chr(0)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'COMANDA.:' + Dados.qryComanda_pessoaNOME.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'DATA....:' + Dados.qrycomanda_masterDATA_HORA.AsString;
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := '-----------------------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));
          Texto := 'COD|DESCRICAO            |QTD   |PRECO  |TOTAL ';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := '-----------------------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Dados.qryComanda_Itens.First;

          Item := 1;
          while not Dados.qryComanda_Itens.Eof do
          begin
            // Produto
            Texto := ColocaTextoDir
              (Copy(Dados.qryComanda_ItensFK_PRODUTO.AsString + '-' +
              Dados.qryComanda_ItensVIRTUAL_PRODUTO.Value, 1, 23), 23,
              ' ') + '|';

            // Quantidade
            Texto := Texto + ColocaTextoDir
              (Copy(Dados.qryComanda_ItensQTD.AsString, 1, 6), 6, ' ') + '|';

            // Preço
            Texto := Texto + ColocaTextoDir
              (Copy(FormatFloat('0.00', Dados.qryComanda_ItensPRECO.AsFloat), 1,
              7), 7, ' ') + '|';

            // Total
            Texto := Texto + ColocaTextoDir
              (Copy(FormatFloat('0.00', Dados.qryComanda_ItensTOTAL.AsFloat), 1,
              7), 7, ' ') + '|';

            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));

            Dados.qryComanda_Itens.Next;
          end;

          Texto := '------------------------------------------------';
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(0)));

          Texto := 'Total...:' + FormatFloat(',0.00',
            strtofloatdef(lblTotalCo.Text, 0));
          FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
          FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100) +
            chr(2)));
        end;

      end
      else
      begin
        ShowMessage('Dispositivo Desconectado!');
      end;
    end
    else
    begin
      ShowMessage('Selecione um dispositivo');
    end;
  end;
end;

procedure TfrmMenu.lbl_tecla0Click(Sender: TObject);
begin
  Tecla_Numero(Sender);
end;

procedure TfrmMenu.lbl_tecla2Click(Sender: TObject);
begin
  Tecla_Numero(Sender);
end;

procedure TfrmMenu.ImprimiuItem(id, fk_comanda: Integer);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      Dados.qryExecute.Close;
      Dados.qryExecute.SQL.Text :=
        'update comanda_itens set situacao=''F'' where fk_produto=:pro and fk_comanda_pessoa=:comanda and situacao=''A'' ';
      Dados.qryExecute.Params[0].Value := id;
      Dados.qryExecute.Params[1].Value := fk_comanda;
      Dados.qryExecute.ExecSQL;
    end).Start;
end;

procedure TfrmMenu.ImpPedido;
var
  Texto: string;
  Item: Integer;
begin
  try
    if Bluetooth.Enabled = false then
    begin
      Bluetooth.Enabled := true;
      ShowMessage('Conectando impressora!' + sLineBreak +
        'Tente imprimir novamente!');
      exit;
    end;

    if Dados.qryConfigura.Active = false then
      Dados.qryConfigura.Open;

    if (VarToStrDef(Dados.qryImpressorasdescricao.Value, '') <> '') then
    begin

      if ConectarImpressora(Dados.qryImpressorasdescricao.AsString) then
      begin
        if (FSocket <> nil) and (FSocket.Connected) then
        begin

          Dados.qryImpPedido.Close;
          Dados.qryImpPedido.Params[0].Value :=
            Dados.qryComanda_pessoaCODIGO.Value;
          Dados.qryImpPedido.Open;

          if not Dados.qryImpPedido.IsEmpty then
          begin

            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(64)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97)
              + chr(1)));

            // cabeçalho da empresa

            if not Dados.qryEmpresa.Active then
            begin
              Dados.qryEmpresa.Close;
              Dados.qryEmpresa.Open;
            end;

            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33) +
              chr(12)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97)
              + chr(0)));

            Texto := Copy(VarToStrDef(Dados.qryEmpresaRAZAO.Value, ''), 1, 32);
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));

            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(33)
              + chr(0)));

            Texto := '--------------------------------';
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Texto := 'MESA....:' + Dados.qryMesasNOME.AsString;
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97)
              + chr(0)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Texto := 'COMANDA.:' + Dados.qryComanda_pessoaNOME.AsString;
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(97)
              + chr(0)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Texto := 'DATA...:' + Dados.qrycomanda_masterDATA_HORA.AsString;
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(50)));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Texto := '--------------------------------';
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));
            Texto := 'DESCRICAO                 |QTD  ';
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Texto := '--------------------------------';
            FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));
            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(0)));

            Dados.qryImpPedido.First;

            while not Dados.qryImpPedido.Eof do
            begin

              Texto := ColocaTextoDir
                (Copy(Dados.qryImpPedidoVIRTUAL_PRODUTO.AsString, 1, 26), 26,
                ' ') + '|';

              Texto := Texto + ColocaTextoDir
                (Copy(Dados.qryImpPedidoQTD.AsString, 1, 6), 6, ' ') + '|';

              FSocket.SendData(TEncoding.UTF8.GetBytes(Texto));

              FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
                + chr(0)));
              Dados.qryImpPedido.Next;
            end;

            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(27) + chr(100)
              + chr(2)));
            ImprimiuItem(Dados.qryImpPedidoCODIGO.Value,
              Dados.qryImpPedidoFK_COMANDA_PESSOA.Value);
          end;
        end
        else
        begin
          ShowMessage('Dispositivo Desconectado!');
        end;
      end
      else
      begin
        ShowMessage('Selecione um dispositivo');
      end;
    end;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmMenu.UpdateStatusMesa(id: Integer);
begin

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'update mesa set situacao=''O'' where codigo=:id';
  Dados.qryExecute.Params[0].Value := id;
  Dados.qryExecute.ExecSQL;

  Dados.qryMesas.Refresh;

end;

procedure TfrmMenu.UpdateComandaMesa(fk, id: Integer);
begin

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Text :=
    'update mesa set fk_movimento=:fk where codigo=:id';
  Dados.qryExecute.Params[0].Value := fk;
  Dados.qryExecute.Params[1].Value := id;
  Dados.qryExecute.ExecSQL;

  Dados.qryMesas.Refresh;

end;

function TfrmMenu.ComandaMasterExiste(id: Integer): Boolean;
begin
  result := false;

  Dados.qryComanda_master.Close;
  Dados.qryComanda_master.Params[0].Value := id;
  Dados.qryComanda_master.Open;

  if (not Dados.qryComanda_master.IsEmpty) or
    (Dados.qrycomanda_masterCODIGO.AsInteger > 0) then
    result := true;
end;

procedure TfrmMenu.InsereComanda(CODIGO, FK_MESA, TOTAL: extended;
Situacao: string; Data_hora: TDateTime);
begin

  Dados.updComandaMaster.Close;
  Dados.updComandaMaster.paramByName('CODIGO').AsFloat := CODIGO;
  Dados.updComandaMaster.paramByName('FK_MESA').AsFloat := FK_MESA;
  Dados.updComandaMaster.paramByName('TOTAL').AsFloat := TOTAL;
  Dados.updComandaMaster.paramByName('SITUACAO').AsString := 'A';
  Dados.updComandaMaster.paramByName('DATA_HORA').AsDateTime := Data_hora;
  Dados.updComandaMaster.ExecSQL;

  Dados.qryComanda_master.Refresh;

end;

procedure TfrmMenu.Layout8Click(Sender: TObject);
begin
  Tecla_Numero(Sender);
end;

procedure TfrmMenu.CalculaSaldo;
var
  vSaldo: extended;
begin

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'SELECT SUM(coalesce(TOTAL,0)) FROM COMANDA_ITENS WHERE FK_COMANDA_PESSOA=:CODIGO';
  Dados.qryExecute.Params[0].Value := Dados.qryComanda_pessoaCODIGO.Value;
  Dados.qryExecute.Open;

  vSaldo := Dados.qryExecute.Fields[0].AsFloat;

  lblTotalCo.Text := FormatFloat(',0.00', vSaldo);

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'update comanda_pessoa set total=:total where codigo=:codigo';
  Dados.qryExecute.Params[0].Value := vSaldo;
  Dados.qryExecute.Params[1].Value := Dados.qryComanda_pessoaCODIGO.Value;
  Dados.qryExecute.ExecSQL;

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'SELECT SUM(coalesce(TOTAL,0)) FROM COMANDA_PESSOA WHERE FK_COMANDA=:CODIGO';
  Dados.qryExecute.Params[0].Value := Dados.qrycomanda_masterCODIGO.Value;
  Dados.qryExecute.Open;

  vSaldo := Dados.qryExecute.Fields[0].AsFloat;
  lblTotalGeral.Text := FormatFloat(',0.00', vSaldo);

  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'update comanda_master set total=:total where codigo=:codigo';
  Dados.qryExecute.Params[0].Value := vSaldo;
  Dados.qryExecute.Params[1].Value := Dados.qrycomanda_masterCODIGO.Value;
  Dados.qryExecute.ExecSQL;

end;

procedure TfrmMenu.FechaMesa;
begin
  if not(Dados.qryMesas.State in dsEditmodes) then
    Dados.qryMesas.Edit;
  Dados.qryMesasSITUACAO.Value := 'L';
  Dados.qryMesasFK_MOVIMENTO.Clear;
  Dados.qryMesasDATA.Clear;
  Dados.qryMesas.Post;
end;

procedure TfrmMenu.FechaComandaMaster;
begin
  if not Dados.qryComanda_master.IsEmpty then
  begin
    if not(Dados.qryComanda_master.State in dsEditmodes) then
      Dados.qryComanda_master.Edit;
    Dados.qryComanda_masterSITUACAO.Value := 'F';
    Dados.qryComanda_master.Post;
    Dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmMenu.FechaComandaPessoa;
begin
  Dados.qryconsulta.Close;
  Dados.qryconsulta.SQL.Text :=
    'select codigo, total from comanda_pessoa where fk_comanda=:id';
  Dados.qryconsulta.Params[0].AsInteger := vidComanda;
  Dados.qryconsulta.Open;

  Dados.qryconsulta.First;

  if not Dados.qryconsulta.IsEmpty then
  begin
    while not Dados.qryconsulta.Eof do
    begin
      Dados.qryExecute.Close;

      Dados.qryExecute.SQL.Text :=
        'update comanda_pessoa set situacao=:situacao where codigo=:id';
      if Dados.qryconsulta.FieldByName('TOTAL').Value > 0 then
        Dados.qryExecute.Params[0].Value := 'F'
      else
        Dados.qryExecute.Params[0].Value := 'C';
      Dados.qryExecute.Params[1].Value := Dados.qryconsulta.Fields[0].AsInteger;
      Dados.qryExecute.ExecSQL;

      Dados.qryconsulta.Next;
    end;
  end;
end;

procedure TfrmMenu.UpdateComandaPessoa(vWhere: string);
begin
  Dados.qryExecute.Close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'update comanda_pessoa set situacao=''F'' ' + vWhere;
  Dados.qryExecute.paramByName('codigo').Value :=
    Dados.qryComanda_pessoaCODIGO.Value;
  Dados.qryExecute.ExecSQL;
end;

procedure TfrmMenu.AbreComanda_Itens(id: Integer);
begin

  Dados.qryComanda_Itens.Close;
  Dados.qryComanda_Itens.Params[0].Value := id;
  Dados.qryComanda_Itens.Open;

  Dados.qryComanda_Itens.Refresh;

end;

procedure TfrmMenu.ListView3ItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  if TipoImpressao = 'PEDIDO' then
    ImpPedido;
  if TipoImpressao = 'COMANDA' then
    ImpVenda;
end;

procedure TfrmMenu.ListViewComandaItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  vidComanda := Dados.qryComanda_PessoaFK_COMANDA.Value;
  TThread.CreateAnonymousThread(
    procedure
    begin
      ComandaMasterExiste(vidComanda);
      AbreComanda_Itens(Dados.qryComanda_pessoaCODIGO.Value);
      CalculaSaldo;

      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          TabControl.ActiveTab := TabPedido;
        end);
    end).Start;
end;

procedure TfrmMenu.ListViewFecharItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  TabControlConsumo.ActiveTab := tabValorFechar;
  edtValorPago.Text := FormatFloat('0.00', Dados.qryComanda_PessoaTOTAL.AsFloat)
end;

procedure TfrmMenu.ListViewMesaItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  tela := '';
  try
    LayoutAguarde.Visible := true;
    Sinal := '+';
    TThread.CreateAnonymousThread(
      procedure
      begin
        // passo 1: checa status da mesa se estiver livre ocupa
        if Dados.qryMesasSITUACAO.Value <> 'O' then
          UpdateStatusMesa(Dados.qryMesasCODIGO.Value);

        // passo 2: verifica se ja existe lançamento da mesa aberto em comanda master
        if not ComandaMasterExiste(Dados.qryMesasFK_MOVIMENTO.Value) then //
        begin
          vidComanda := Dados.MaiorComanda;
          InsereComanda(vidComanda, Dados.qryMesasCODIGO.Value, 0, 'A', Now);
          ComandaMasterExiste(vidComanda);
        end
        else
          vidComanda := Dados.qrycomanda_masterCODIGO.Value;

        // passo 3: atualiza a comanda na mesa
        UpdateComandaMesa(vidComanda, Dados.qryMesasCODIGO.Value);

        // passo 4: verifica se existe comanda pessoa na mesa
        ComandaPessoaExiste(vidComanda);
        AbreComanda_Itens(Dados.qryComanda_pessoaCODIGO.Value);
        CalculaSaldo;
        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            TabControl.ActiveTab := TabPedido;
            Sleep(10);
            LayoutAguarde.Visible := false;

          end);
      end).Start;

  except
    on e: exception do
    begin
      LayoutAguarde.Visible := false;
      ShowMessage('Erro:' + e.Message);
    end;
  end;
end;

procedure TfrmMenu.limpaItens;
begin
  edtProduto.Text := '';
  edtQtd.Text := '1';
  edtPreco.Text := '0,00';
  edtTotalItem.Text := '0,00';
end;

procedure TfrmMenu.ListViewPedidoItemClick(

  const Sender: TObject;

const AItem: TListViewItem);
begin
  if Dados.qryComanda_ItensSITUACAO.Value <> 'A' then
  begin
    ShowMessage('Pedido não pode ser alterado');
    exit;
  end;

  opp := 'Alterar';

  GetItens(Dados.qryComanda_ItensVIRTUAL_PRODUTO.Value,
    Dados.qryComanda_ItensFK_PRODUTO.Value, Dados.qryComanda_ItensQTD.AsFloat,
    Dados.qryComanda_ItensPRECO.AsFloat, Dados.qryComanda_ItensTOTAL.AsFloat);

  TabControl.ActiveTab := TabItens;

end;

procedure TfrmMenu.lsProdutoItemClick(

  const Sender: TObject;

const AItem: TListViewItem);
begin
  TabControl.ActiveTab := TabItens;
  GetItens(Dados.qryProdutosDESCRICAO.Value, Dados.qryProdutosCODIGO.Value, -1,
    Dados.qryProdutosPR_VENDA.AsFloat, 0);
  calculaTotal;
  vIdProduto := Dados.qryProdutosCODIGO.Value;
end;

procedure TfrmMenu.BtnBuscaQtdClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabTeclado;
  vQuantidade := 'S';
  vValor := 'N';
  tela := 'Itens';
  lbl_valor.Text := edtQtd.Text;
end;

procedure TfrmMenu.btnBuscaPrecoClick(Sender: TObject);
begin
  TabControl.ActiveTab := TabTeclado;
  vQuantidade := 'N';
  vValor := 'S';
  tela := 'Itens';
  lbl_valor.Text := edtPreco.Text;
end;

procedure TfrmMenu.btnBuscaProdutoClick(Sender: TObject);
begin
  tela := 'ITEM';
  TabControl.ActiveTab := TabListaProd;
end;

end.
