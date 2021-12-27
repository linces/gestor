unit uCadUniforme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, frxClass,
  frxDBSet, frxExportPDF, Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs;

type
  TfrmCadOS_Roupa = class(TForm)
    Panel1: TPanel;
    btnFinalizar: TSpeedButton;
    btnSair: TSpeedButton;
    Shape1: TShape;
    DBText1: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    qrySoma: TFDQuery;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    dsProd: TDataSource;
    qryProdUNIDADE: TStringField;
    qryProdLOCALIZACAO: TStringField;
    Panel4: TPanel;
    qrytipo_tecido: TFDQuery;
    qryProdSERVICO: TStringField;
    qryOS_Master: TFDQuery;
    qryOS_Detalhe: TFDQuery;
    qryOS_MasterCODIGO: TIntegerField;
    qryOS_MasterDATA_INICIO: TDateField;
    qryOS_MasterHORA_INICIO: TTimeField;
    qryOS_MasterPREVISAO_ENTREGA: TDateField;
    qryOS_MasterHORA_TERMINO: TTimeField;
    qryOS_MasterDATA_ENTREGA: TDateField;
    qryOS_MasterHORA_ENTREGA: TTimeField;
    qryOS_MasterFK_ATENDENDE: TIntegerField;
    qryOS_MasterPROBLEMA: TMemoField;
    qryOS_MasterOBSERVACOES: TMemoField;
    qryOS_MasterFK_EMPRESA: TIntegerField;
    qryOS_MasterFK_USUARIO: TIntegerField;
    qryOS_MasterDOCUMENTO: TStringField;
    qryOS_MasterNOME: TStringField;
    qryOS_MasterFONE1: TStringField;
    qryOS_MasterFONE2: TStringField;
    qryOS_MasterSITUACAO: TStringField;
    qryOS_MasterNUMERO_SERIE: TStringField;
    qryOS_MasterDESCRICAO: TStringField;
    qryOS_MasterMODELO: TStringField;
    qryOS_MasterMARCA: TStringField;
    qryOS_MasterANO: TIntegerField;
    qryOS_MasterPLACA: TStringField;
    qryOS_MasterENDERECO: TStringField;
    qryOS_MasterBAIRRO: TStringField;
    qryOS_MasterCIDADE: TStringField;
    qryOS_MasterUF: TStringField;
    qryOS_DetalheCODIGO: TIntegerField;
    qryOS_DetalheFK_OS_MASTER: TIntegerField;
    qryOS_DetalheFK_FUNCIONARIO: TIntegerField;
    qryOS_DetalheFK_PRODUTO: TIntegerField;
    qryOS_DetalheDATA_INICIO: TDateField;
    qryOS_DetalheHORA_INICIO: TTimeField;
    qryOS_DetalheDATA_TERMINO: TDateField;
    qryOS_DetalheHORA_TERMINO: TTimeField;
    qryOS_DetalheDISCRIMINACAO: TStringField;
    qryOS_DetalheFK_USUARIO: TIntegerField;
    qryOS_DetalheFK_EMPRESA: TIntegerField;
    qryOS_DetalheTIPO: TStringField;
    qryOS_DetalheSITUACAO: TStringField;
    dsDetalhe: TDataSource;
    dsMaster: TDataSource;
    dsEmpresa: TDataSource;
    qryOS_DetalheVIRTUAL_DESCRICAO: TStringField;
    qryOS_MasterVIRTUAL_SITUACAO: TStringField;
    qryOS_MasterDATA_TERMINO: TDateField;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label34: TLabel;
    Label3: TLabel;
    Label27: TLabel;
    Label2: TLabel;
    Label31: TLabel;
    Label37: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    qryOS_MasterDATA_EMISSAO: TDateField;
    btnGravar: TSpeedButton;
    DBEdit20: TDBEdit;
    qryOS_MasterVIRTUAL_EMPRESA: TStringField;
    qryOS_MasterKM: TFMTBCDField;
    qryOS_MasterNUMERO: TStringField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryOS_MasterSUBTOTAL: TFMTBCDField;
    qryOS_MasterSUBTOTAL_PECAS: TFMTBCDField;
    qryOS_MasterSUBTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterVL_DESC_PECAS: TFMTBCDField;
    qryOS_MasterVL_DESC_SERVICOS: TFMTBCDField;
    qryOS_MasterDESC_PERC_PECAS: TFMTBCDField;
    qryOS_MasterDESC_PERC_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_PRODUTOS: TFMTBCDField;
    qryOS_MasterTOTAL_GERAL: TFMTBCDField;
    qryOS_DetalheQTD: TFMTBCDField;
    qryOS_DetalhePRECO: TFMTBCDField;
    qryOS_DetalheTOTAL: TFMTBCDField;
    qrySomaSUBTOTAL: TFMTBCDField;
    Label5: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    qryOS_MasterQUANTIDADE: TIntegerField;
    qryOS_MasterFOTO: TBlobField;
    qryOS_DetalheDETALHE: TStringField;
    qryOS_MasterFK_PRODUTO: TIntegerField;
    qryOS_DetalheTAMANHO: TStringField;
    qryOS_DetalheNOME: TStringField;
    qryOS_DetalheNUMERO: TStringField;
    qryOS_MasterFK_TIPO_TECIDO: TIntegerField;
    qrytipo_tecidoCODIGO: TIntegerField;
    qrytipo_tecidoDESCRICAO: TStringField;
    qryOS_MasterVIRTUAL_TECIDO: TStringField;
    qryOS_MasterVIRTUAL_PRODUTO: TStringField;
    qryOS_DetalheVIRTUAL_PRECO: TExtendedField;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    btnCores: TBitBtn;
    DBGridEh1: TDBGrid;
    Panel5: TPanel;
    Image1: TImage;
    Button1: TButton;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    DBEdit7: TDBEdit;
    GroupBox3: TGroupBox;
    DBEdit8: TDBEdit;
    GroupBox4: TGroupBox;
    DBEdit4: TDBEdit;
    GroupBox5: TGroupBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    dsOs_Imagem: TDataSource;
    qryOs_Imagem: TFDQuery;
    qryOs_ImagemCODIGO: TIntegerField;
    qryOs_ImagemITEM: TIntegerField;
    qryOs_ImagemCAMINHO: TStringField;
    OpenPicture: TOpenPictureDialog;
    qryOs_ImagemFK_OS_MASTER: TIntegerField;
    Button2: TButton;
    qryOS_MasterTIPO_SERVICO: TStringField;
    qryOS_MasterNOME_TIME: TStringField;
    Shape2: TShape;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    qryOS_MasterFK_CLIENTE: TIntegerField;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesRAZAO: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesMUNICIPIO: TStringField;
    qryClientesUF: TStringField;
    qryClientesCEP: TStringField;
    qryClientesFONE1: TStringField;
    qryClientesCELULAR1: TStringField;
    qryClientesEMAIL1: TStringField;
    qryClientesISENTO: TStringField;
    dsClientes: TDataSource;
    BitBtn2: TBitBtn;
    pnCores: TPanel;
    qryOS_DetalheCOR: TStringField;
    shpPreto: TPanel;
    shpAmarelo: TPanel;
    shpVerde: TPanel;
    shpCinza: TPanel;
    shpAzulClaro: TPanel;
    shpLilas: TPanel;
    shpAzulEscuro: TPanel;
    shpBranco: TPanel;
    BitBtn1: TBitBtn;
    btnPessoas: TSpeedButton;
    btnProdutos: TSpeedButton;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    qryOS_MasterDESCRICAO2: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryItensBeforeOpen(DataSet: TDataSet);
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryOS_MasterAfterPost(DataSet: TDataSet);
    procedure qryItensBeforeInsert(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qryOS_MasterCalcFields(DataSet: TDataSet);
    procedure qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
    procedure qryPessoa_entregaAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryOS_DetalheBeforePost(DataSet: TDataSet);
    procedure qryOS_DetalheAfterDelete(DataSet: TDataSet);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure qryOS_DetalheQTDChange(Sender: TField);
    procedure qryOS_MasterAfterDelete(DataSet: TDataSet);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure qryOS_DetalheNewRecord(DataSet: TDataSet);
    procedure qryOS_DetalheAfterPost(DataSet: TDataSet);
    procedure qryOS_DetalheBeforeInsert(DataSet: TDataSet);
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh2Exit(Sender: TObject);
    procedure qryOS_MasterAfterOpen(DataSet: TDataSet);
    procedure PageControl2Change(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure qryOS_DetalheBeforeDelete(DataSet: TDataSet);
    procedure qryOS_DetalheBeforeEdit(DataSet: TDataSet);
    procedure btnGerarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dsOs_ImagemDataChange(Sender: TObject; Field: TField);
    procedure qryOS_DetalheFK_PRODUTOChange(Sender: TField);
    procedure qryOS_DetalhePRECOValidate(Sender: TField);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure btnCoresClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure shpPretoClick(Sender: TObject);
    procedure shpAmareloClick(Sender: TObject);
    procedure shpVerdeClick(Sender: TObject);
    procedure shpCinzaClick(Sender: TObject);
    procedure shpAzulClaroClick(Sender: TObject);
    procedure shpLilasClick(Sender: TObject);
    procedure shpAzulEscuroClick(Sender: TObject);
    procedure shpBrancoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure qryOS_MasterBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    QtdAnterior: extended;
    VerificaEstoque: Boolean;
    Cor, letras: string[50];
    procedure CalculaTotais;
    procedure CalculaItem;
    procedure Abre_OS_Detalhe;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadOS_Roupa: TfrmCadOS_Roupa;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadProduto, uDMEstoque;

procedure TfrmCadOS_Roupa.CalculaItem;
begin
  qryOS_DetalheTOTAL.Value := qryOS_DetalhePRECO.AsFloat *
    qryOS_DetalheQTD.AsFloat;
end;

procedure TfrmCadOS_Roupa.shpAmareloClick(Sender: TObject);
begin
  Cor := 'Amarelo';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpPretoClick(Sender: TObject);
begin
  Cor := 'Preto';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.BitBtn1Click(Sender: TObject);
begin

  qryOS_Detalhe.First;
  while not qryOS_Detalhe.eof do
  begin
    if not(qryOS_Detalhe.State in dsEditModes) then
      qryOS_Detalhe.Edit;
    qryOS_DetalheCOR.Value := 'Branco';
    qryOS_Detalhe.Post;
    qryOS_Detalhe.Next;
  end;

end;

procedure TfrmCadOS_Roupa.btnCoresClick(Sender: TObject);
begin
  pnCores.Visible := true;
end;

procedure TfrmCadOS_Roupa.btnFinalizarClick(Sender: TObject);
begin
  try
    btnFinalizar.Enabled := false;
    dados.qryConsulta.Close;
    dados.qryConsulta.sql.Clear;
    dados.qryConsulta.sql.add('select codigo from os_detalhe');
    dados.qryConsulta.sql.add('where');
    dados.qryConsulta.sql.add('fk_OS_MASTER=:ID');
    dados.qryConsulta.Params[0].Value := qryOS_MasterCODIGO.Value;
    dados.qryConsulta.Open;

    if dados.qryConsulta.Fields[0].IsNull then
    begin
      ShowMessage('Informe os Itens da OS!');
      exit;
    end;

    if qryOS_MasterDATA_TERMINO.IsNull then
    begin
      ShowMessage('Informe a data do témino do serviço!');
      exit;
    end;

    if qryOS_MasterFK_CLIENTE.IsNull then
    begin
      ShowMessage('Informe o cliente!');
      exit;
    end;

    If Application.messagebox('Tem certeza que FINALIZAR OS?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idno then
      exit;

    if not(qryOS_Master.State in dsEditModes) then
      qryOS_Master.Edit;
    qryOS_MasterSITUACAO.Value := 'F';
    qryOS_Master.Post;
    dados.Conexao.CommitRetaining;

  finally
    VerificaEstoque := true;
    btnFinalizar.Enabled := true;
  end;

  Close;

end;

procedure TfrmCadOS_Roupa.btnGerarClick(Sender: TObject);
var
  i: Integer;
begin

  if qryOS_Master.State in dsEditModes then
    qryOS_Master.Post;

  for i := 1 to StrToIntDef(Edit1.Text, 1) do
  begin
    qryOS_Detalhe.Insert;
    qryOS_DetalheCODIGO.Value := dados.Numerador('OS_DETALHE', 'CODIGO',
      'N', '', '');
    qryOS_DetalheQTD.Value := 1;
    qryOS_DetalheFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
    qryOS_DetalheFK_USUARIO.Value := dados.idUsuario;
    qryOS_DetalheFK_FUNCIONARIO.Value := 0;
    qryOS_DetalheFK_EMPRESA.Value := qryOS_DetalheFK_EMPRESA.Value;
    qryOS_DetalheFK_PRODUTO.Value := qryOS_MasterFK_PRODUTO.Value;
    qryOS_DetalheTAMANHO.Value := 'M';
    qryOS_DetalheNUMERO.AsInteger := i;
    qryOS_Detalhe.Post;
  end;
  dados.Conexao.CommitRetaining;
  Abre_OS_Detalhe;

end;

procedure TfrmCadOS_Roupa.btnGravarClick(Sender: TObject);
begin
  if qryOS_Master.State in dsEditModes then
  begin
    If Application.messagebox('Deseja salvar OS?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      qryOS_Master.Post;
    end;
  end;
end;

procedure TfrmCadOS_Roupa.btnPessoasClick(Sender: TObject);
begin
  try
    btnPessoas.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    if Not dados.qryPessoas.Active then
      dados.qryPessoas.Open;
    dados.qryPessoas.Insert;
    frmCadPessoa.ShowModal;
  finally
    frmCadPessoa.Release;
    btnPessoas.Enabled := true;
    dados.qryFornecedor.Close;
    dados.qryFornecedor.Open;

  end;
end;

procedure TfrmCadOS_Roupa.btnProdutosClick(Sender: TObject);
begin
  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.ShowModal;

  finally
    FrmCadProduto.Release;
    dados.qryProd.Close;
    dados.qryProd.Open;
  end;
end;

procedure TfrmCadOS_Roupa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadOS_Roupa.FormCreate(Sender: TObject);
begin
  VerificaEstoque := true;

  qryProd.Close;
  qryProd.Open;

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

end;

procedure TfrmCadOS_Roupa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    btnGravarClick(self);
    abort;
  end;

  if Key = vk_f3 then
  begin
    btnFinalizarClick(self);
    abort;
  end;

  if Key = vk_f6 then
  begin
    btnGerarClick(self);
    abort;
  end;

  if Key = vk_f7 then
  begin
    btnGerarClick(self);
    abort;
  end;

  if Key = vk_f8 then
  begin
    btnGerarClick(self);
    abort;
  end;

  if Key = VK_ESCAPE then
  begin
    if (ActiveControl <> DBGridEh1) and (ActiveControl <> DBGridEh1) then
    begin
      if Application.messagebox('Tem certeza de que deseja sair?',
        'Confirmação', mb_yesno) = mrYes then
        btnSairClick(self);
    end;
    abort;
  end;
end;

procedure TfrmCadOS_Roupa.FormShow(Sender: TObject);
begin
  qryProd.Close;
  qryProd.Open;

  qryClientes.Close;
  qryClientes.Open;

  qrytipo_tecido.Close;
  qrytipo_tecido.Open;

  btnProdutos.Visible := dados.vLiberaProduto;
  btnPessoas.Visible := dados.vLiberaPessoa;

  Cor := '';
end;

procedure TfrmCadOS_Roupa.Image1Click(Sender: TObject);
begin
  if qryOs_Imagem.IsEmpty then
    exit;

  OpenPicture.Execute;
  if OpenPicture.FileName <> '' then
  begin
    qryOs_Imagem.Edit;
    qryOs_ImagemCAMINHO.Value := OpenPicture.FileName;
    qryOs_Imagem.Post;
    dados.Conexao.CommitRetaining;
  end;
end;

procedure TfrmCadOS_Roupa.PageControl2Change(Sender: TObject);
begin
  Abre_OS_Detalhe
end;

procedure TfrmCadOS_Roupa.shpAzulEscuroClick(Sender: TObject);
begin
  Cor := 'Azul Escuro';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpBrancoClick(Sender: TObject);
begin
  Cor := 'Branco';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpVerdeClick(Sender: TObject);
begin
  Cor := 'Verde';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpCinzaClick(Sender: TObject);
begin
  Cor := 'Cinza';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpAzulClaroClick(Sender: TObject);
begin
  Cor := 'Azul Claro';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.shpLilasClick(Sender: TObject);
begin
  Cor := 'Lilas';
  pnCores.Visible := false;
end;

procedure TfrmCadOS_Roupa.qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS_Roupa.qryPessoa_entregaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheBeforeDelete(DataSet: TDataSet);
begin
  // dados.AtualizaEstoque(qryOS_DetalheQTD.AsFloat,
  // qryOS_DetalheFK_PRODUTO.AsFloat);
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheBeforeEdit(DataSet: TDataSet);
begin
  QtdAnterior := qryOS_DetalheQTD.AsFloat;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheBeforeInsert(DataSet: TDataSet);
begin
  if qryOS_Master.State in dsEditModes then
    qryOS_Master.Post;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheBeforePost(DataSet: TDataSet);
begin
  qryOS_DetalheTOTAL.AsFloat := qryOS_DetalheQTD.AsFloat *
    qryOS_DetalhePRECO.AsFloat;

  dmEstoque.AtualizaEstoque(qryOS_DetalheFK_PRODUTO.Value,
    qryOS_DetalheQTD.AsFloat, QtdAnterior, 'S', 'R');
  dmEstoque.AtualizaComposicao(qryOS_DetalheFK_PRODUTO.Value,
    qryOS_DetalheQTD.AsFloat, QtdAnterior, 'S', 'R');

  QtdAnterior := 0;

end;

procedure TfrmCadOS_Roupa.qryOS_DetalheFK_PRODUTOChange(Sender: TField);
begin
  qryOS_DetalhePRECO.AsFloat := qryOS_DetalheVIRTUAL_PRECO.Value;
  qryOS_DetalheTOTAL.Value := qryOS_DetalheVIRTUAL_PRECO.Value;
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheNewRecord(DataSet: TDataSet);
begin
  qryOS_DetalheCODIGO.Value := dados.Numerador('OS_DETALHE', 'CODIGO',
    'N', '', '');
  qryOS_DetalheQTD.Value := 1;
  qryOS_DetalheFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
  qryOS_DetalheFK_USUARIO.Value := dados.idUsuario;
  qryOS_DetalheFK_FUNCIONARIO.Value := 0;
  qryOS_DetalheFK_EMPRESA.Value := qryOS_DetalheFK_EMPRESA.Value;
  qryOS_DetalhePRECO.Value := 0;
  qryOS_DetalheTOTAL.Value := 0;
  qryOS_DetalheCOR.Value := 'Preto';

end;

procedure TfrmCadOS_Roupa.qryOS_DetalhePRECOValidate(Sender: TField);
begin
  if qryOS_DetalheQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryOS_DetalheQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!');

  if qryOS_DetalheQTD.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryOS_DetalhePRECO.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!');
end;

procedure TfrmCadOS_Roupa.qryOS_DetalheQTDChange(Sender: TField);
begin
  CalculaItem;
end;

procedure TfrmCadOS_Roupa.qryOS_MasterAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS_Roupa.qryOS_MasterAfterOpen(DataSet: TDataSet);
begin
  Abre_OS_Detalhe;
end;

procedure TfrmCadOS_Roupa.Abre_OS_Detalhe;
begin
  qryOS_Detalhe.Close;
  qryOS_Detalhe.Params[0].Value := qryOS_MasterCODIGO.Value;
  qryOS_Detalhe.Open;

  qryOs_Imagem.Close;
  qryOs_Imagem.Params[0].Value := qryOS_MasterCODIGO.Value;
  qryOs_Imagem.Open;
end;

procedure TfrmCadOS_Roupa.qryOS_MasterAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS_Roupa.qryOS_MasterBeforePost(DataSet: TDataSet);
begin
  if DBLookupComboBox1.Text <> '' then
    qryOS_MasterNOME.Value := DBLookupComboBox1.Text;
end;

procedure TfrmCadOS_Roupa.qryOS_MasterCalcFields(DataSet: TDataSet);
begin
  if qryOS_MasterSITUACAO.Value = 'A' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'EM ABERTO';
  if qryOS_MasterSITUACAO.Value = 'F' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'CONCLUIDA';
  if qryOS_MasterSITUACAO.Value = 'C' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadOS_Roupa.CalculaTotais;
begin

  qrySoma.Close;
  qrySoma.Params[0].Value := qryOS_MasterCODIGO.AsInteger;
  qrySoma.Open;

  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;
  qryOS_MasterSUBTOTAL.Value := qrySomaSUBTOTAL.Value;
  qryOS_MasterTOTAL_GERAL.AsFloat := qryOS_MasterSUBTOTAL.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;

  qryOS_Master.Post;

end;

procedure TfrmCadOS_Roupa.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadOS_Roupa.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadOS_Roupa.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadOS_Roupa.qryItensAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS_Roupa.qryItensBeforeInsert(DataSet: TDataSet);
begin
  if (qryOS_Master.State in dsEditModes) then
    qryOS_Master.Post;
end;

procedure TfrmCadOS_Roupa.qryItensBeforeOpen(DataSet: TDataSet);
begin
  dados.qryProd.Close;
  dados.qryProd.Open;
end;

procedure TfrmCadOS_Roupa.qryItensNewRecord(DataSet: TDataSet);
begin
  qryOS_DetalheCODIGO.Value := dados.Numerador('OS_DETALHE', 'CODIGO',
    'N', '', '');
  qryOS_DetalheFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
  qryOS_DetalhePRECO.Value := 0;
  qryOS_DetalheQTD.Value := 1;
end;

Procedure TfrmCadOS_Roupa.btnSairClick(Sender: TObject);
begin
  if Application.messagebox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_yesno) = mrYes then
    Close;
end;

procedure TfrmCadOS_Roupa.Button1Click(Sender: TObject);
begin

  if qryOS_Master.State in dsEditModes then
    qryOS_Master.Post;
  dados.Conexao.CommitRetaining;

  OpenPicture.Execute;
  if OpenPicture.FileName <> '' then
  begin
    qryOs_Imagem.Insert;
    qryOs_ImagemCODIGO.Value := dados.Numerador('OS_IMAGEM', 'CODIGO',
      'N', '', '');

    qryOs_ImagemITEM.Value := dados.Numerador('OS_IMAGEM', 'ITEM', 'S',
      'FK_OS_MASTER', qryOS_MasterCODIGO.AsString);

    qryOs_ImagemCAMINHO.Value := OpenPicture.FileName;
    qryOs_ImagemFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
    qryOs_Imagem.Post;
    dados.Conexao.CommitRetaining;
  end;

end;

procedure TfrmCadOS_Roupa.Button2Click(Sender: TObject);
begin
  If Application.messagebox('Tem ceretza que deseja excluir imagem?',
    'Confirmação', mb_yesno + mb_iconquestion) = idyes then
    qryOs_Imagem.Delete;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS_Roupa.DBEdit11Exit(Sender: TObject);
begin
  DBGridEh1.SetFocus;
end;

procedure TfrmCadOS_Roupa.DBEdit13Exit(Sender: TObject);
begin
  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;

  if qryOS_MasterSUBTOTAL_SERVICOS.AsFloat > 0 then
    qryOS_MasterDESC_PERC_SERVICOS.AsFloat :=
      ((qryOS_MasterVL_DESC_SERVICOS.AsFloat * 100) /
      qryOS_MasterSUBTOTAL_SERVICOS.AsFloat)
  else
    qryOS_MasterDESC_PERC_SERVICOS.AsFloat := 0;

  qryOS_MasterTOTAL_GERAL.AsFloat := qryOS_MasterSUBTOTAL.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;
end;

procedure TfrmCadOS_Roupa.DBEdit4Exit(Sender: TObject);
begin
  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;
  qryOS_MasterVL_DESC_SERVICOS.Value :=
    (qryOS_MasterSUBTOTAL.Value * qryOS_MasterDESC_PERC_SERVICOS.Value / 100);

  qryOS_MasterTOTAL_GERAL.Value := qryOS_MasterTOTAL_SERVICOS.AsFloat +
    qryOS_MasterTOTAL_PRODUTOS.AsFloat;

end;

procedure TfrmCadOS_Roupa.DBGridEh1DblClick(Sender: TObject);
begin
  if not(qryOS_Detalhe.State in dsEditModes) then
    qryOS_Detalhe.Edit;
  qryOS_DetalheCOR.Value := Cor;
  qryOS_Detalhe.Post;
end;

procedure TfrmCadOS_Roupa.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if qryOS_DetalheCOR.AsString = 'Branco' then // condição
    DBGridEh1.Canvas.Font.Color := clBlack
  else if qryOS_DetalheCOR.AsString = 'Preto' then // condição
    DBGridEh1.Canvas.Font.Color := clBlack
  else if qryOS_DetalheCOR.AsString = 'Amarelo' then
    DBGridEh1.Canvas.Font.Color := clYellow
  else if qryOS_DetalheCOR.AsString = 'Verde' then
    DBGridEh1.Canvas.Font.Color := clGreen
  else if qryOS_DetalheCOR.AsString = 'Cinza' then
    DBGridEh1.Canvas.Font.Color := clGray
  else if qryOS_DetalheCOR.AsString = 'Azul Claro' then
    DBGridEh1.Canvas.Font.Color := clSkyBlue
  else if qryOS_DetalheCOR.AsString = 'Lilas' then
    DBGridEh1.Canvas.Font.Color := clPurple
  else if qryOS_DetalheCOR.AsString = 'Azul Escuro' then
    DBGridEh1.Canvas.Font.Color := clBlue
  else
    DBGridEh1.Canvas.Font.Color := clBlack;

  DBGridEh1.DefaultDrawDataCell(Rect, DBGridEh1.columns[DataCol].Field, State);
end;

procedure TfrmCadOS_Roupa.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadOS_Roupa.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadOS_Roupa.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #9) then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadOS_Roupa.DBGridEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadOS_Roupa.DBGridEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadOS_Roupa.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.DropDown;
end;

procedure TfrmCadOS_Roupa.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadOS_Roupa.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadOS_Roupa.dsOs_ImagemDataChange(Sender: TObject; Field: TField);
begin
  if FileExists(qryOs_ImagemCAMINHO.Value) then
    Image1.Picture.LoadFromFile(qryOs_ImagemCAMINHO.Value);
end;

end.
