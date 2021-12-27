unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.DBCGrids, Vcl.ComCtrls, Data.DB, Vcl.Tabs, frxClass,
  frxExportBaseDialog, frxExportPDF, frxDBSet, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase,
  ACBrPosPrinter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions, Vcl.ActnList, IdBaseComponent, IdComponent, IdIPWatch;

type
  TfrmMenu = class(TForm)
    dsMesas: TDataSource;
    dsItens: TDataSource;
    Panel4: TPanel;
    ACBrPosPrinter2: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS2: TACBrNFeDANFeESCPOS;
    Panel3: TPanel;
    Panel5: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Panel1: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Panel2: TPanel;
    imgLivre: TImage;
    ImgOcupado: TImage;
    DBText1: TDBText;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    btnAdicionar: TLabel;
    tnFechar: TLabel;
    btnTransferir: TLabel;
    btnReabrir: TLabel;
    btnNovaComanda: TLabel;
    btnFecharComanda: TLabel;
    Panel8: TPanel;
    Label14: TLabel;
    Label8: TLabel;
    lblComanda: TLabel;
    lblGeral: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    btnCancela: TLabel;
    btnReabrirComanda: TLabel;
    BtnTransComanda: TLabel;
    TabSetCliente: TTabSet;
    Panel9: TPanel;
    tabStatusImpressao: TTabSet;
    qryComanda_Pessoa: TFDQuery;
    qryComanda_PessoaCODIGO: TIntegerField;
    qryComanda_PessoaNOME: TStringField;
    qryComanda_PessoaSITUACAO: TStringField;
    DBGridEh1: TDBGridEh;
    qryComanda_PessoaTOTAL: TFMTBCDField;
    qryComanda_PessoaFK_COMANDA: TIntegerField;
    btnImprimir: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    qryComanda_PessoaTOTAL_RATEIO: TFMTBCDField;
    qryComanda_PessoaPDV: TStringField;
    qryComanda_PessoaPERCENTUAL: TFMTBCDField;
    btnPedido: TLabel;
    btnEmpresa: TLabel;
    btnConfiguracoes: TLabel;
    btnUsuarios: TLabel;
    btnAtualiza: TLabel;
    ActionList1: TActionList;
    actProduto: TAction;
    actEmpresa: TAction;
    actUsuarios: TAction;
    IdIPWatch1: TIdIPWatch;
    Image1: TImage;
    btnGerarMesas: TLabel;
    actConfig: TAction;
    procedure FormShow(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure imgLivreClick(Sender: TObject);
    procedure imgLivreDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TabSetClienteClick(Sender: TObject);
    procedure tabStatusImpressaoClick(Sender: TObject);
    procedure TabSetStatusClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure tnFecharClick(Sender: TObject);
    procedure btnReabrirClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure btnNovaComandaClick(Sender: TObject);
    procedure btnFecharComandaClick(Sender: TObject);
    procedure btnReabrirComandaClick(Sender: TObject);
    procedure BtnTransComandaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure actUsuariosExecute(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGerarMesasClick(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
  private

    vSqlItem, vSqlPessoa, TipoImpressao: String;
    procedure FechaComandsaMaster;
    procedure FechaComandaPessoa;
    procedure FechaMesa;
    procedure Produtos;
    procedure Empresa;
    procedure Usuarios;
    procedure ChecaTerminal;
    procedure Configuracoes;
    procedure ChamaLogin;
    procedure GeraMesa;

    { Private declarations }
  public
    function AbreMesa: Boolean;
    procedure AbreProduto;
    procedure AbreTabelas;
    procedure FecharVenda;
    procedure InsereMesa;
    procedure InsereComanda;
    function ReabreMesa: Integer;
    procedure ImpPedido;
    // procedure ImpComanda;
    procedure ImprimePedidoA4;
    procedure ImprimeComandaA4;
    procedure FecharMesa;
    procedure TransferirMesa;
    procedure CalculaTotal;
    procedure InserirItem;
    procedure AbreCliente;
    procedure CarregaClientes;
    procedure AbreComanda;
    procedure AbrePessoa;
    procedure AbreItens;
    function BuscaComanda: Integer;
    procedure CancelarMesa;
    procedure FecharComanda;
    procedure ReabrirComanda;
    procedure TransferirComanda;
    procedure AlterarItem;
    procedure DividirComanda;
    // procedure SomaItens;
    procedure LimpaRateioPessoa(Codigo: Integer);
    procedure DistribuiValores(vRateio, vPercentual: Extended;
      Comanda_master, Comanda_Pessoa, Comanda_Itens: Integer);

    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uMesas, uDados, uPedidos, uClientes, uTransf, uReabrirComanda,
  uTransfComanda, uProdutos, uEmpresa, uUsuarios, uConfiguracoes, uAcesso;

procedure TfrmMenu.AbreProduto;
begin
  dados.qryProdutos.Close;
  dados.qryProdutos.Open;
end;

procedure TfrmMenu.ReabrirComanda;
begin

  if dados.qryMesasSITUACAO.Value = 'L' then
  begin
    ShowMessage('N�o � possivel abrir comanda!');
    Exit;
  end;

  try
    try
      frmReabrirComanda := TfrmReabrirComanda.Create(Application);

      frmReabrirComanda.qryComanda_Pessoa.Close;
      frmReabrirComanda.qryComanda_Pessoa.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      frmReabrirComanda.qryComanda_Pessoa.Open;
      frmReabrirComanda.ShowModal;
    except
      on e: exception do
        raise exception.Create(e.Message);
    end;
  finally
    frmReabrirComanda.Release;
    AbreTabelas;
  end;
end;

procedure TfrmMenu.DividirComanda;
var
  vComanda_pessoa: Integer;
begin
  vComanda_pessoa := -1;

  dados.qryComanda_Pessoa.Close;
  dados.qryComanda_Pessoa.Params[0].Value :=
    dados.qryComandas_masterCODIGO.Value;
  dados.qryComanda_Pessoa.Open;
  dados.qryComanda_Pessoa.First;

  while not dados.qryComanda_Pessoa.Eof do
  begin

    LimpaRateioPessoa(dados.qryComanda_PessoaCODIGO.Value);

    if dados.qryComanda_PessoaPERCENTUAL.AsFloat = 100 then
    begin
      DistribuiValores(dados.qryComanda_PessoaTOTAL.AsFloat,
        dados.qryComanda_PessoaPERCENTUAL.AsFloat,
        dados.qryComanda_PessoaFK_COMANDA.Value,
        dados.qryComanda_PessoaCODIGO.Value,
        dados.qryComanda_PessoaCODIGO.Value);
      dados.qryComanda_Pessoa.Next;

    end
    else
    begin

      dados.qryconsulta.Close;
      dados.qryconsulta.sql.Clear;
      dados.qryconsulta.sql.add('Select');
      dados.qryconsulta.sql.add('distinct(ci.fk_comanda_pessoa) as codigo');
      dados.qryconsulta.sql.add('from comanda_itens ci');
      dados.qryconsulta.sql.add
        ('left join comanda_pessoa cp on cp.codigo=ci.fk_comanda_pessoa');
      dados.qryconsulta.sql.add('where');
      dados.qryconsulta.sql.add('cp.fk_comanda=:comanda');
      dados.qryconsulta.Params[0].Value := dados.qryComandas_masterCODIGO.Value;
      dados.qryconsulta.Open;

      if dados.qryconsulta.RecordCount = 1 then
      begin
        DistribuiValores(dados.qryComanda_PessoaTOTAL_RATEIO.AsFloat,
          dados.qryComanda_PessoaPERCENTUAL.AsFloat,
          dados.qryComanda_PessoaFK_COMANDA.Value,
          dados.qryComanda_PessoaCODIGO.Value,
          dados.qryconsulta.Fields[0].Value);
      end
      else
      begin
        raise exception.Create
          ('Existe inconsist�ncia que n�o permite finalizar comanda:' +
          sLineBreak + '1. O percentual de rateio n�o est� correto na comanda!'
          + sLineBreak +
          '2. Caso voc� queria dividir o valor da conta entre duas pessoas, os pedidos devem ser feitos para uma unica pessoa!');
        Break;
      end;
      dados.qryComanda_Pessoa.Next;
    end;

  end;
end;

procedure TfrmMenu.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenu.ChecaTerminal;
begin

  dados.qryTerminal.Close;
  dados.qryTerminal.Open;
  if dados.qryTerminal.Locate('NOME', dados.Getcomputer, []) then
  begin
    dados.qryTerminal.Edit;
    dados.qryTerminalIP.Value := IdIPWatch1.LocalIP;
    dados.qryTerminal.Post;
  end
  else
  begin
    dados.qryTerminal.Insert;
    dados.qryTerminalNOME.Value := dados.Getcomputer;
    dados.qryTerminalIP.Value := IdIPWatch1.LocalIP;
    dados.qryTerminalIMPRIME.Value := 'N';
    dados.qryTerminalUSAGAVETA.Value := 'N';
    dados.qryTerminalTIPOIMPRESSORA.Value := '1';
    dados.qryTerminalSERIE.Value := '1';
    dados.qryTerminalNVIAS.Value := 1;
    dados.qryTerminalVERSAO.Value := 1;
    dados.qryTerminalNUMERACAO_INICIAL.Value := 1;
    dados.qryTerminalMODELO.Value := 'BEMATECH';
    dados.qryTerminalPORTA.Value := 'COM2';
    dados.qryTerminalVELOCIDADE.AsString := '115200';
    dados.qryTerminalEH_CAIXA.Value := 'S';

    dados.qryTerminal.Post;
  end;
end;

procedure TfrmMenu.ChamaLogin;
begin
  try
    frmAcesso := TfrmAcesso.Create(Application);
    frmAcesso.ShowModal;
  finally

    frmAcesso.Release;
  end;

end;

procedure TfrmMenu.btnImprimirClick(Sender: TObject);
begin
  // AbreTabelas;

  CalculaTotal;

  dados.qryTerminal.Close;
  dados.qryTerminal.Params[0].Value := dados.Getcomputer;
  dados.qryTerminal.Open;

  TipoImpressao := 'P';
  if not dados.qryComanda_Itens.IsEmpty then
    ImpPedido;
end;

procedure TfrmMenu.btnCancelaClick(Sender: TObject);
begin
  CancelarMesa;
end;

procedure TfrmMenu.BtnTransComandaClick(Sender: TObject);
begin
  TransferirComanda;
end;

procedure TfrmMenu.btnAdicionarClick(Sender: TObject);
begin
  InserirItem;
end;

procedure TfrmMenu.btnAtualizaClick(Sender: TObject);
begin
  AbreProduto;
  AbreMesa;
  AbreTabelas;
end;

procedure TfrmMenu.tnFecharClick(Sender: TObject);
begin

  if dados.qryMesas.IsEmpty then
  begin
    ShowMessage('Informe a Mesa!');
    Exit;
  end;

  FecharMesa;
end;

procedure TfrmMenu.btnTransferirClick(Sender: TObject);
begin
  TransferirMesa;
end;

procedure TfrmMenu.btnReabrirClick(Sender: TObject);
begin
  ReabreMesa;
end;

procedure TfrmMenu.btnNovaComandaClick(Sender: TObject);
begin
  AbreCliente;
end;

procedure TfrmMenu.btnFecharComandaClick(Sender: TObject);
begin
  FecharComanda;
end;

procedure TfrmMenu.btnReabrirComandaClick(Sender: TObject);
begin
  ReabrirComanda;
end;

procedure TfrmMenu.LimpaRateioPessoa(Codigo: Integer);
begin
  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'DELETE FROM COMANDA_RATEIO WHERE FK_COMANDA_PESSOA=:PESSOA';
  dados.qryconsulta.Params[0].AsInteger := Codigo;
  dados.qryconsulta.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmMenu.DistribuiValores(vRateio, vPercentual: Extended;
  Comanda_master, Comanda_Pessoa, Comanda_Itens: Integer);
var
  vDif, vTotal: Extended;
begin
  vTotal := 0;

  dados.qryComanda_Itens.Close;
  dados.qryComanda_Itens.Params[0].Value := Comanda_Itens;
  dados.qryComanda_Itens.Open;

  dados.qryComanda_Rateio.Close;
  dados.qryComanda_Rateio.Params[0].Value := -1;
  dados.qryComanda_Rateio.Open;

  while not dados.qryComanda_Itens.Eof do
  begin
    dados.qryComanda_Rateio.Insert;
    dados.qryComanda_RateioCODIGO.Value := dados.Numerador('comanda_rateio',
      'codigo');
    dados.qryComanda_RateioFK_COMANDA_PESSOA.Value := Comanda_Pessoa;
    dados.qryComanda_RateioFK_COMANDA.Value := Comanda_master;
    dados.qryComanda_RateioFK_PRODUTO.Value :=
      dados.qryComanda_ItensFK_PRODUTO.Value;
    dados.qryComanda_RateioPERCENTUAL.AsFloat := vPercentual;
    dados.qryComanda_RateioQTD.AsFloat :=
      (dados.qryComanda_ItensQTD.AsFloat * vPercentual) / 100;
    dados.qryComanda_RateioPRECO.AsFloat := dados.qryComanda_ItensPRECO.AsFloat;

    dados.qryComanda_RateioTOTAL.AsFloat :=
      SimpleRoundTo(dados.qryComanda_ItensPRECO.AsFloat *
      dados.qryComanda_RateioQTD.AsFloat, -2);
    if dados.qryComanda_RateioQTD.AsFloat > 0 then
    begin
      dados.qryComanda_Rateio.Post;
      dados.Conexao.CommitRetaining;
      vTotal := vTotal + dados.qryComanda_RateioTOTAL.AsFloat;
    end
    else
      dados.qryComanda_Rateio.Cancel;
    dados.qryComanda_Itens.Next;
  end;

  vDif := vRateio - vTotal;

  if vDif <> 0 then
  begin
    dados.qryComanda_Rateio.Edit;
    dados.qryComanda_RateioTOTAL.AsFloat :=
      dados.qryComanda_RateioTOTAL.AsFloat + vDif;
    dados.qryComanda_Rateio.Post;
    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmMenu.FechaMesa;
begin
  if not(dados.qryMesas.State in dsEditmodes) then
    dados.qryMesas.Edit;
  dados.qryMesasSITUACAO.Value := 'L';
  dados.qryMesasFK_MOVIMENTO.Clear;
  dados.qryMesasDATA.Clear;
  dados.qryMesas.Post;
end;

procedure TfrmMenu.FechaComandaPessoa;
begin
  dados.qryComanda_Pessoa.First;
  if not dados.qryComanda_Pessoa.IsEmpty then
  begin
    while not dados.qryComanda_Pessoa.Eof do
    begin
      if not(dados.qryComanda_Pessoa.State in dsEditmodes) then
        dados.qryComanda_Pessoa.Edit;
      if dados.qryComanda_PessoaTOTAL_RATEIO.Value > 0 then
        dados.qryComanda_PessoaSITUACAO.Value := 'F'
      else
        dados.qryComanda_PessoaSITUACAO.Value := 'C';
      dados.qryComanda_Pessoa.Post;
      dados.Conexao.CommitRetaining;
      dados.qryComanda_Pessoa.Next;
    end;
  end;
end;

procedure TfrmMenu.FechaComandsaMaster;
begin
  if not dados.qryComandas_master.IsEmpty then
  begin
    if not(dados.qryComandas_master.State in dsEditmodes) then
      dados.qryComandas_master.Edit;
    dados.qryComandas_masterSITUACAO.Value := 'F';
    dados.qryComandas_master.Post;
    dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  dados.qryEmpresas.Close;
  dados.qryEmpresas.Open;

end;

procedure TfrmMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f1 then
    btnAtualizaClick(self);
  if Key = vk_f2 then
    InserirItem;
  if Key = vk_f3 then
    FecharMesa;
  if Key = vk_f4 then
    ReabreMesa;
  if Key = vk_f5 then
    TransferirMesa;
  if Key = vk_f6 then
    CancelarMesa;
  if Key = vk_f7 then
    AbreCliente;
  if Key = vk_f8 then
    FecharComanda;
  if Key = vk_f9 then
    ReabrirComanda;
  if Key = vk_f10 then
    TransferirComanda;

  if Key = vk_f11 then
  begin
    AbreTabelas;
    TipoImpressao := 'P';
    if not dados.qryComanda_Itens.IsEmpty then
      ImpPedido;
  end;

  if Key = vk_f12 then
    Configuracoes;

End;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  ChamaLogin;
  AbreProduto;
  AbreMesa;
  AbreTabelas;
  ChecaTerminal;

end;

procedure TfrmMenu.imgLivreClick(Sender: TObject);
begin
  AbreTabelas;
end;

procedure TfrmMenu.imgLivreDblClick(Sender: TObject);
begin
  if dados.qryMesasSITUACAO.Value = 'L' then
  begin
    If Application.messagebox(pwidechar('Tem Certeza de que deseja abrir ' +
      UpperCase(dados.qryMesasNOME.AsString) + '?'), 'Confirma��o',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      InsereMesa;
      InsereComanda;

    end;
  end;
end;

procedure TfrmMenu.InsereComanda;
begin
  try
    if dados.qryComandas_master.IsEmpty then
    begin
      dados.qryComandas_master.Insert;
      dados.qryComandas_masterCODIGO.Value := dados.Numerador('comanda_master',
        'codigo');
      dados.qryComandas_masterFK_MESA.Value := dados.qryMesasCODIGO.Value;
      dados.qryComandas_masterTOTAL.Value := 0;
      dados.qryComandas_masterData_hora.AsDateTime := now;
      dados.qryComandas_masterSITUACAO.Value := 'A';
      dados.qryComandas_master.Post;

      dados.Conexao.CommitRetaining;

      dados.qryMesas.Edit;
      dados.qryMesasFK_MOVIMENTO.Value := dados.qryComandas_masterCODIGO.Value;
      dados.qryMesas.Post;
      dados.Conexao.CommitRetaining;

      if dados.qryComanda_Pessoa.IsEmpty then
      begin
        try
          frmClientes := TfrmClientes.Create(Application);
          frmClientes.pnTotal.Visible := false;
          frmClientes.btnFecharConta.Visible := false;
          frmClientes.ShowModal;
        finally

          CarregaClientes;
          frmClientes.Release;
        end;
      end;

    end;
  except
    on e: exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmMenu.InsereMesa;
begin
  try
    if dados.qryMesasSITUACAO.Value = 'L' then
    begin
      dados.qryMesas.Edit;
      dados.qryMesasSITUACAO.Value := 'O';
      dados.qryMesasDATA.AsDateTime := now;
      dados.qryMesas.Post;
      dados.Conexao.CommitRetaining;
    end;
  except
    on e: exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmMenu.CalculaTotal;
begin
  dados.GravarTotalComanda;
  if dados.qryComanda_ItensTTOTAL.IsNull then
  begin
    lblComanda.caption := '0,00';
  end
  else
  begin
    lblComanda.caption := FormatFloat(',0.00',
      dados.qryComanda_ItensTTOTAL.Value);
  end;
  lblGeral.caption := FormatFloat(',0.00',
    dados.qryComandas_masterTOTAL.AsFloat);
end;

procedure TfrmMenu.AlterarItem;
begin

  if dados.qryComanda_Itens.IsEmpty then
    Exit;

  try
    try
      AbreProduto;

      frmPedidos := TfrmPedidos.Create(Application);

      frmPedidos.qryComanda_Pessoa.Close;
      frmPedidos.qryComanda_Pessoa.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      frmPedidos.qryComanda_Pessoa.Open;

      frmPedidos.qryItens.Close;
      frmPedidos.qryItens.Params[0].Value := dados.qryComanda_ItensCODIGO.Value;
      frmPedidos.qryItens.Open;
      frmPedidos.qryItens.Edit;

      frmPedidos.ShowModal;
    except
      on e: exception do
        raise exception.Create(e.Message);
    end;
  finally
    frmPedidos.Release;
    AbreTabelas;
  end;
end;

procedure TfrmMenu.btnConfiguracoesClick(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmMenu.btnEmpresaClick(Sender: TObject);
begin
  Empresa;
end;

procedure TfrmMenu.GeraMesa;
begin
  dados.qryMesas.Insert;
  dados.qryMesasCODIGO.Value := dados.Numerador('MESA', 'CODIGO');
  dados.qryMesasNOME.AsString := 'MESA ' + dados.qryMesasCODIGO.AsString;
  dados.qryMesasQTD.AsFloat := 4;
  dados.qryMesasSITUACAO.Value := 'L';
  dados.qryMesas.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmMenu.btnGerarMesasClick(Sender: TObject);
var
  i, Qtd: Integer;

begin
  if Application.messagebox('Tem Certeza de que Deseja Gerar Mesas?',
    'Confirma��o', mb_yesno) = mrYes then
  begin
    Qtd := StrToIntDef(InputBox('Informe a Quantidade de Mesas',
      'Quantidade:', ''), 0);
    for i := 1 to Qtd do
      GeraMesa;
    btnAtualizaClick(self);
  end;

end;

procedure TfrmMenu.btnPedidoClick(Sender: TObject);
begin
  Produtos;
end;

procedure TfrmMenu.btnUsuariosClick(Sender: TObject);
begin
  Usuarios;
end;

procedure TfrmMenu.InserirItem;
begin

  if dados.qryMesas.IsEmpty then
  begin
    ShowMessage('Informe a Mesa!');
    Exit;
  end;

  if dados.qryComanda_Pessoa.IsEmpty then
  begin
    ShowMessage('Informe a comanda!');
    AbreCliente;
    Exit;
  end;

  try
    try
      AbreProduto;

      frmPedidos := TfrmPedidos.Create(Application);

      frmPedidos.qryComanda_Pessoa.Close;
      frmPedidos.qryComanda_Pessoa.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      frmPedidos.qryComanda_Pessoa.Open;

      frmPedidos.qryItens.Close;
      frmPedidos.qryItens.Params[0].Value := -1;
      frmPedidos.qryItens.Open;
      frmPedidos.qryItens.Insert;

      frmPedidos.ShowModal;
    except
      on e: exception do
        raise exception.Create(e.Message);
    end;
  finally
    frmPedidos.Release;
    AbreTabelas;
  end;
end;

procedure TfrmMenu.AbreCliente;
begin

  dados.qryComanda_Pessoa.Close;
  dados.qryComanda_Pessoa.Params[0].Value :=
    dados.qryComandas_masterCODIGO.Value;
  dados.qryComanda_Pessoa.Open;

  try
    frmClientes := TfrmClientes.Create(Application);
    frmClientes.pnTotal.Visible := false;
    frmClientes.btnFecharConta.Visible := false;
    frmClientes.ShowModal;
  finally

    CarregaClientes;
    frmClientes.Release;
  end;

end;

procedure TfrmMenu.CarregaClientes;
begin
  TabSetCliente.Tabs.Clear;
  dados.qryComanda_Pessoa.First;
  while not dados.qryComanda_Pessoa.Eof do
  begin
    TabSetCliente.Tabs.add(dados.qryComanda_PessoaNOME.AsString);
    dados.qryComanda_Pessoa.Next;
  end;

  if not dados.qryComanda_Pessoa.IsEmpty then
    TabSetCliente.TabIndex := 0;
end;

procedure TfrmMenu.AbreComanda;
begin
  if dados.qryMesasSITUACAO.Value = 'L' then
  begin
    dados.qryComandas_master.Close;
    dados.qryComandas_master.Params[0].Value := -1;
    dados.qryComandas_master.Open;
  end
  else
  begin
    dados.qryComandas_master.Close;
    dados.qryComandas_master.Params[0].Value :=
      dados.qryMesasFK_MOVIMENTO.Value;
    dados.qryComandas_master.Open;
  end;
end;

procedure TfrmMenu.AbrePessoa;
begin
  dados.qryComanda_Pessoa.Close;
  dados.qryComanda_Pessoa.Params[0].Value :=
    dados.qryComandas_masterCODIGO.Value;
  dados.qryComanda_Pessoa.Open;
end;

procedure TfrmMenu.AbreItens;
var
  Filtro: string;
begin

  if TabSetCliente.TabIndex >= 0 then
  begin
    qryComanda_Pessoa.Close;
    qryComanda_Pessoa.Params[0].Value := dados.qryComandas_masterCODIGO.Value;
    qryComanda_Pessoa.Params[1].Value := TabSetCliente.Tabs.Strings
      [TabSetCliente.TabIndex];
    qryComanda_Pessoa.Open;

  end

  else
  begin
    qryComanda_Pessoa.Close;
    qryComanda_Pessoa.Params[0].Value := -1;
    qryComanda_Pessoa.Params[1].Value := '-1';
    qryComanda_Pessoa.Open;
  end;

  Filtro := '';
  if tabStatusImpressao.TabIndex >= 0 then
  begin
    case tabStatusImpressao.TabIndex of
      1:
        Filtro := ' and SITUACAO=''S''';
      2:
        Filtro := ' and SITUACAO=''N''';
    end;
  end;

  if vSqlItem = '' then
    vSqlItem := dados.qryComanda_Itens.sql.Text;
  dados.qryComanda_Itens.Close;
  dados.qryComanda_Itens.sql.Text := vSqlItem;
  dados.qryComanda_Itens.sql.Text :=
    StringReplace(dados.qryComanda_Itens.sql.Text, '/*where*/', Filtro, []);
  dados.qryComanda_Itens.Params[0].Value := qryComanda_PessoaCODIGO.Value;
  dados.qryComanda_Itens.Open;
end;

procedure TfrmMenu.CancelarMesa;
begin
  if dados.qryMesasSITUACAO.Value <> 'O' then
  begin
    ShowMessage('N�o � possivel cancelar mesa');
    Exit;
  end;

  AbreTabelas;
  try
    if not dados.qryComandas_master.IsEmpty then
    begin
      if not(dados.qryComandas_master.State in dsEditmodes) then
        dados.qryComandas_master.Edit;
      dados.qryComandas_masterSITUACAO.Value := 'C';
      dados.qryComandas_master.Post;

      dados.Conexao.CommitRetaining;
      dados.qryComandas_master.Next;

    end;

    if not(dados.qryMesas.State in dsEditmodes) then
      dados.qryMesas.Edit;
    dados.qryMesasSITUACAO.Value := 'L';
    dados.qryMesasFK_MOVIMENTO.Clear;
    dados.qryMesasDATA.Clear;
    dados.qryMesas.Post;

    dados.Conexao.CommitRetaining;

    ShowMessage(dados.qryMesasNOME.AsString + ' CANCELADA com sucesso!');

    AbreMesa;
    AbreTabelas;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

function TfrmMenu.BuscaComanda: Integer;
begin
  Result := 0;

  dados.qryconsulta.Close;
  dados.qryconsulta.sql.Text :=
    'select coalesce(count(*),0) qtd from comanda_pessoa where fk_comanda=:fk and situacao=''A''';
  dados.qryconsulta.Params[0].Value := dados.qryComandas_masterCODIGO.Value;
  dados.qryconsulta.Open;

  Result := dados.qryconsulta.Fields[0].Value;

  if Result > 0 then
  begin
    qryComanda_Pessoa.Close;
    qryComanda_Pessoa.Params[0].Value := dados.qryComandas_masterCODIGO.Value;
    qryComanda_Pessoa.Params[1].Value := TabSetCliente.Tabs.Strings
      [TabSetCliente.TabIndex];
    qryComanda_Pessoa.Open;
    qryComanda_Pessoa.Edit;
    if qryComanda_PessoaTOTAL.Value > 0 then
      qryComanda_PessoaSITUACAO.Value := 'F'
    else
      qryComanda_PessoaSITUACAO.Value := 'C';
    qryComanda_Pessoa.Post;
    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmMenu.FecharComanda;
begin

  try

    if BuscaComanda = 1 then
    begin
      if not(dados.qryComandas_master.State in dsEditmodes) then
        dados.qryComandas_master.Edit;
      dados.qryComandas_masterSITUACAO.Value := 'F';
      dados.qryComandas_master.Post;
      dados.Conexao.CommitRetaining;
    end;

    ShowMessage('Comanda ' + qryComanda_PessoaNOME.AsString +
      ' FECHADA com sucesso!');

    AbreMesa;
    AbreTabelas;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmMenu.FecharVenda;
begin
  if dados.qryMesasSITUACAO.Value = 'L' then
  begin
    ShowMessage('Mesa j� est� LIVRE');
    Exit;
  end;

  AbreTabelas;
  try

    DividirComanda;
    FechaComandsaMaster;
    FechaComandaPessoa;
    FechaMesa;

    ShowMessage(dados.qryMesasNOME.AsString + ' FECHADA com sucesso!');

    AbreMesa;
    AbreTabelas;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

function TfrmMenu.ReabreMesa: Integer;
begin
  if dados.qryMesasSITUACAO.Value = 'L' then
  begin

    If Application.messagebox
      ('ATEN��O! Ser� reaberta a ULTIMA comanda lan�ada para esta mesa! ' +
      sLineBreak + 'Deseja Continuar?', 'Confirma��o',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      Result := 0;
      dados.qryconsulta.sql.Clear;
      dados.qryconsulta.sql.add
        ('select MAX(CODIGO) CODIGO  from comanda_master');
      dados.qryconsulta.sql.add('where');
      dados.qryconsulta.sql.add('fk_mesa=:mesa');
      dados.qryconsulta.Params[0].Value := dados.qryMesasCODIGO.Value;
      dados.qryconsulta.Open;
      Result := dados.qryconsulta.Fields[0].AsInteger;

      if Result > 0 then
      begin
        dados.qryMesas.Edit;
        dados.qryMesasFK_MOVIMENTO.Value := Result;
        dados.qryMesasSITUACAO.Value := 'O';
        dados.qryMesas.Post;
        dados.Conexao.CommitRetaining;
      end;
    end;
    AbreTabelas;

  end
  else
    ShowMessage('Mesa j� esta ABERTA!');
end;

procedure TfrmMenu.ImprimePedidoA4;
begin
  { try
    btnImp.Enabled := false;
    dados.qryPesqProd.Close;
    dados.qryPesqProd.Open;

    dados.qryItensO.Close;
    dados.qryItensO.Params[0].Value := dados.qryOrcamentoCODIGO.Value;
    dados.qryItensO.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelOrcamento.fr3');
    frxReport.ShowReport;
    finally
    btnImp.Enabled := True;
    pnImpressao.Visible := false;
    edtLoc.SetFocus;
    end; }
end;

procedure TfrmMenu.ImprimeComandaA4;
begin
  { try
    btnImp.Enabled := false;
    dados.qryPesqProd.Close;
    dados.qryPesqProd.Open;

    dados.qryItensO.Close;
    dados.qryItensO.Params[0].Value := dados.qryOrcamentoCODIGO.Value;
    dados.qryItensO.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelOrcamento.fr3');
    frxReport.ShowReport;
    finally
    btnImp.Enabled := True;
    pnImpressao.Visible := false;
    edtLoc.SetFocus;
    end; }
end;

procedure TfrmMenu.FecharMesa;
begin
  if dados.qryMesasSITUACAO.Value = 'O' then
  begin
    if Application.messagebox(pwidechar('Tem Certeza de que deseja fechar ' +
      UpperCase(dados.qryMesasNOME.AsString) + '?'), 'Confirma��o',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      dados.qryComanda_Pessoa.Close;
      dados.qryComanda_Pessoa.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      dados.qryComanda_Pessoa.Open;

      try
        frmClientes := TfrmClientes.Create(Application);
        frmClientes.pnTotal.Visible := true;
        frmClientes.btnFecharConta.Visible := true;
        frmClientes.ShowModal;
      finally
        frmClientes.Release;
      end;
    end;

  end
  else
    ShowMessage('Mesa j� esta FECHADA!');
end;

procedure TfrmMenu.TabSetClienteClick(Sender: TObject);
begin
  AbrePessoa;
  AbreItens;
  CalculaTotal;
end;

procedure TfrmMenu.TabSetStatusClick(Sender: TObject);
begin
  AbrePessoa;
  AbreItens;
  CalculaTotal;
end;

procedure TfrmMenu.tabStatusImpressaoClick(Sender: TObject);
begin
  AbreItens;
  CalculaTotal;
end;

procedure TfrmMenu.TransferirComanda;
begin
  if dados.qryMesasSITUACAO.Value = 'O' then
  begin
    AbreTabelas;
    try
      frmTransfComanda := TfrmTransfComanda.Create(Application);

      frmTransfComanda.qryComandaO.Close;
      frmTransfComanda.qryComandaO.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      frmTransfComanda.qryComandaO.Open;

      frmTransfComanda.qryComandaD.Close;
      frmTransfComanda.qryComandaD.Params[0].Value :=
        dados.qryComandas_masterCODIGO.Value;
      frmTransfComanda.qryComandaD.Open;

      frmTransfComanda.ShowModal;

    finally
      frmTransfComanda.Release;
      AbreTabelas;
    end;
  end
  else
    ShowMessage('Mesa esta LIVRE!');

end;

procedure TfrmMenu.TransferirMesa;
begin
  if dados.qryMesasSITUACAO.Value = 'O' then
  begin
    AbreTabelas;
    try
      frmTransf := TfrmTransf.Create(Application);
      frmTransf.ShowModal;
    finally
      frmTransf.Release;
      AbreMesa;
      AbreTabelas;
    end;
  end
  else
    ShowMessage('Mesa esta LIVRE!');
end;

procedure TfrmMenu.ImpPedido;
var
  x, y, i, j: Integer;
  Lin_Tot, Dif_Tot: Integer;
  Sub_Total, T_Geral: Extended;
  iRetorno, tamanho: Integer;
  CdgCliente: string;
  vEndereco, Caminho_Impressao: String;
  Veiculo: String;
  sTexto, sTexto1, sTexto2, sTitulo: String;
  EspacosEmBranco: Extended;
  Traduzido: Integer;
  NomedaEmpresa: String;
  FoneCompleto: String;
  Endereco1: String;
  Endereco2: String;
  i_modelo: Integer;
begin

  try

    Lin_Tot := 9;
    Dif_Tot := 0;
    Sub_Total := 0;
    y := 0;

    Memo1.Lines.Clear;

    Memo1.Lines.add('<N>' + copy(dados.qryEmpresasRAZAO.AsString, 1, 44)
      + '</n>');

    Memo1.Lines.add('</linha_simples>');
    sTexto := '<N><ce>*** PEDIDOS ***</CE></n>';
    Memo1.Lines.add(sTexto);
    Memo1.Lines.add('MESA.....:' + dados.qryMesasNOME.AsString);
    Memo1.Lines.add('COMANDA..:' + dados.qryComanda_PessoaNOME.AsString);
    Memo1.Lines.add('</linha_simples>');
    Memo1.Lines.add
      ('<C>|COD |PRODUTO                                      |     QTD  |</C>');
    Memo1.Lines.add('</linha_simples>');

    dados.qryComanda_Itens.First;
    While not dados.qryComanda_Itens.Eof do
    begin
      sTexto := dados.Alinha('|', 1, false) +
        dados.Alinha(dados.qryComanda_ItensVIRTUAL_PRODUTO.AsString, 32, false)
        + dados.Alinha('|', 1, false) +
        dados.Alinha(FormatFloat('0.00', dados.qryComanda_ItensQTD.AsFloat), 10,
        true) + dados.Alinha('|', 1, false);

      Memo1.Lines.add('<C>' + sTexto + '</C>');
      dados.qryComanda_Itens.Next;
      y := y + 1;
    end;

    Memo1.Lines.add('');
    Memo1.Lines.add('');
    Memo1.Lines.add('');

    Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +
      'Pedidos.txt');

    dados.qryTerminal.Close;
    dados.qryTerminal.Params[0].Value := dados.Getcomputer;
    dados.qryTerminal.Open;

    ACBrPosPrinter2.Porta := LowerCase(dados.qryTerminal.FieldByName('PORTA')
      .AsString);

    if dados.qryTerminal.FieldByName('MODELO').Value = 'DARUMA' then
      ACBrPosPrinter2.modelo := ppEscDaruma
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'BEMATECH' then
      ACBrPosPrinter2.modelo := ppEscBematech
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'ELGIN' then
      ACBrPosPrinter2.modelo := ppEscPosEpson
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'DIEBOLD' then
      ACBrPosPrinter2.modelo := ppEscDiebold
    else if dados.qryTerminal.FieldByName('MODELO').Value = 'EPSON' then
      ACBrPosPrinter2.modelo := ppEscPosEpson
    else
      ACBrPosPrinter2.modelo := ppTexto;

    ACBrNFeDANFeESCPOS2.NumCopias := dados.qryTerminalNVIAS.AsInteger;

    if ACBrNFeDANFeESCPOS2.NumCopias < 1 then
      ACBrNFeDANFeESCPOS2.NumCopias := 1;

    ACBrPosPrinter2.Desativar;
    ACBrPosPrinter2.Device.Baud := dados.qryTerminalVELOCIDADE.Value;
    ACBrPosPrinter2.Ativar;

    if ACBrPosPrinter2.VerificarImpressora then
      ACBrNFeDANFeESCPOS2.ImprimirRelatorio(Memo1.Lines)
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmMenu.AbreTabelas;
begin
  AbreComanda;
  AbrePessoa;
  CarregaClientes;
  AbreItens;
  CalculaTotal;
end;

procedure TfrmMenu.actConfigExecute(Sender: TObject);
begin
  Configuracoes;
end;

procedure TfrmMenu.actEmpresaExecute(Sender: TObject);
begin
  Empresa;

end;

procedure TfrmMenu.actProdutoExecute(Sender: TObject);
begin
  Produtos;
end;

procedure TfrmMenu.actUsuariosExecute(Sender: TObject);
begin
  Usuarios;
end;

procedure TfrmMenu.Produtos;
begin
  try
    frmProduto := TfrmProduto.Create(Application);
    frmProduto.ShowModal;
  finally
    frmProduto.Release;
  end;
end;

procedure TfrmMenu.Configuracoes;
begin
  try
    frmConfiguracoes := TfrmConfiguracoes.Create(Application);
    frmConfiguracoes.ShowModal;
  finally
    frmConfiguracoes.Release;
  end;
end;

procedure TfrmMenu.Usuarios;
begin
  try
    frmUsuarios := TfrmUsuarios.Create(Application);
    frmUsuarios.ShowModal;
  finally
    frmUsuarios.Release;
  end;
end;

procedure TfrmMenu.Empresa;
begin
  try
    frmEmpresa := TfrmEmpresa.Create(Application);
    frmEmpresa.ShowModal;
  finally
    frmEmpresa.Release;
  end;
end;

function TfrmMenu.AbreMesa: Boolean;
begin
  dados.qryMesas.Close;
  dados.qryMesas.Open;
end;

procedure TfrmMenu.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if dados.qryMesasSITUACAO.Value = 'L' then
  begin
    imgLivre.Visible := true;
    ImgOcupado.Visible := false;
  end
  else
  begin
    imgLivre.Visible := false;
    ImgOcupado.Visible := true;
  end;
end;

end.
