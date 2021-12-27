unit uPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, frxOLE,
  DBGridEh, DBCtrlsEh, DBLookupEh, frxExportBaseDialog, ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter, ACBrDFeReport,
  ACBrDFeDANFeReport, frxExportXLS, Vcl.Imaging.pngimage;

type
  TfrmPedidoVenda = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    dsPedido: TDataSource;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBPV: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    btnAtualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEmail: TSpeedButton;
    qryComposicao: TFDQuery;
    qryComposicaoID_PRODUTO: TIntegerField;
    qryComposicaoQUANTIDADE: TFMTBCDField;
    dsItens: TDataSource;
    qryPV: TFDQuery;
    qryPVCODIGO: TIntegerField;
    qryPVDATA_EMISSAO: TDateField;
    qryPVDATA_SAIDA: TDateField;
    qryPVID_CLIENTE: TIntegerField;
    qryPVFK_USUARIO: TIntegerField;
    qryPVFK_CAIXA: TIntegerField;
    qryPVFK_VENDEDOR: TIntegerField;
    qryPVTIPO_DESCONTO: TStringField;
    qryPVTIPO: TStringField;
    qryPVNECF: TIntegerField;
    qryPVFKORCAMENTO: TIntegerField;
    qryPVFKEMPRESA: TIntegerField;
    qryPVOBSERVACOES: TMemoField;
    qryPVCPF_NOTA: TStringField;
    qryPVSITUACAO: TStringField;
    qryPVVIRTUAL_SITUACAO: TStringField;
    qryPVSUBTOTAL: TFMTBCDField;
    qryPVDESCONTO: TFMTBCDField;
    qryPVTROCO: TFMTBCDField;
    qryPVDINHEIRO: TFMTBCDField;
    qryPVTOTAL: TFMTBCDField;
    qryPVPERCENTUAL: TFMTBCDField;
    qryPVLOTE: TIntegerField;
    qryPVGERA_FINANCEIRO: TStringField;
    qryPVPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryPVACRESCIMO: TFMTBCDField;
    qryPVFK_TABELA: TIntegerField;
    qryPVPEDIDO: TStringField;
    qryPVTTOTAL: TAggregateField;
    qryPV_Itens: TFDQuery;
    qryPV_ItensCODIGO: TIntegerField;
    qryPV_ItensFKVENDA: TIntegerField;
    qryPV_ItensID_PRODUTO: TIntegerField;
    qryPV_ItensITEM: TSmallintField;
    qryPV_ItensCOD_BARRA: TStringField;
    qryPV_ItensSITUACAO: TStringField;
    qryPV_ItensUNIDADE: TStringField;
    qryPV_ItensPRODUTO: TStringField;
    qryPV_ItensUNIDADE_1: TStringField;
    qryPV_ItensQTD: TFMTBCDField;
    qryPV_ItensE_MEDIO: TFMTBCDField;
    qryPV_ItensPRECO: TFMTBCDField;
    qryPV_ItensVALOR_ITEM: TFMTBCDField;
    qryPV_ItensVDESCONTO: TFMTBCDField;
    qryPV_ItensTOTAL: TFMTBCDField;
    qryPV_ItensQTD_DEVOLVIDA: TFMTBCDField;
    qryPV_ItensACRESCIMO: TFMTBCDField;
    qryPV_ItensFK_GRADE: TIntegerField;
    qryCliente: TFDQuery;
    frxDBCliente: TfrxDBDataset;
    qryClienteCODIGO: TIntegerField;
    qryClienteCNPJ: TStringField;
    qryClienteIE: TStringField;
    qryClienteRAZAO: TStringField;
    qryClienteFANTASIA: TStringField;
    qryClienteENDERECO: TStringField;
    qryClienteNUMERO: TStringField;
    qryClienteBAIRRO: TStringField;
    qryClienteCEP: TStringField;
    qryClienteUF: TStringField;
    qryClienteMUNICIPIO: TStringField;
    qryClienteCOMPLEMENTO: TStringField;
    qryClienteFONE1: TStringField;
    qryClienteCELULAR1: TStringField;
    qryPVFORMA_PAGAMENTO: TStringField;
    qryVendasFPG: TFDQuery;
    qryVendasFPGCODIGO: TIntegerField;
    qryVendasFPGVENDAS_MASTER: TIntegerField;
    qryVendasFPGID_FORMA: TIntegerField;
    qryVendasFPGVALOR: TFMTBCDField;
    qryVendasFPGFK_USUARIO: TIntegerField;
    qryVendasFPGSITUACAO: TStringField;
    qryVendasFPGTIPO: TStringField;
    qryVendasFPGVIRTUAL_FORMA: TStringField;
    qryPVFLAG_NFCE: TStringField;
    qryPV_ItensID_SERIAL: TIntegerField;
    qryPVVIRTUAL_TIPO: TStringField;
    qryPVVENDEDOR: TStringField;
    qryPV_ItensDESCRICAO_SL: TStringField;
    qryPVVIRTUAL_VENDEDOR: TStringField;
    qryPVNOME: TStringField;
    qryPVRAZAO: TStringField;
    qryPVVIRTUAL_CLIENTE: TStringField;
    frxXLSExport1: TfrxXLSExport;
    pnImpressao: TPanel;
    Shape2: TShape;
    Label21: TLabel;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    chkEntrega: TCheckBox;
    TabSet1: TTabControl;
    PageControl1: TPageControl;
    Vendas: TTabSheet;
    tabFiltro: TTabSet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure tabFiltroClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure qryPVCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    procedure ImprimePedido;
    function VerificaCR(aVenda: Integer): Boolean;
    function VerificaNFCe(aVenda: Integer): Boolean;
    function VerificaDevolucao(aVenda: Integer): Boolean;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: String;
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento, uSupervisor, uEmail,
  udmImpressao, uDMEstoque;

procedure TfrmPedidoVenda.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := qryPVCODIGO.Value;
    localiza;
    qryPV.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

function TfrmPedidoVenda.VerificaCR(aVenda: Integer): Boolean;
begin
  result := false;
  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'SELECT SUM(VRECEBIDO) FROM CRECEBER WHERE FK_VENDA=:VENDA';
  Dados.qryConsulta.Params[0].Value := aVenda;
  Dados.qryConsulta.Open;
  if Dados.qryConsulta.Fields[0].Value > 0 then
    result := true;
end;

function TfrmPedidoVenda.VerificaNFCe(aVenda: Integer): Boolean;
begin
  result := false;

  Dados.qryConsulta.close;
  Dados.qryConsulta.SQL.Text :=
    'select NUMERO from nfce_master where fk_venda=:venda and situacao <> ''C''';
  Dados.qryConsulta.Params[0].Value := aVenda;
  Dados.qryConsulta.Open;

  if (Dados.qryConsulta.RecordCount > 0) then
    result := true;
end;

function TfrmPedidoVenda.VerificaDevolucao(aVenda: Integer): Boolean;
var
  qryDevolucao: TFDQuery;
begin
  try
    result := false;
    qryDevolucao := TFDQuery.Create(self);
    qryDevolucao.Connection := Dados.Conexao;

    qryDevolucao.close;
    qryDevolucao.SQL.Clear;
    qryDevolucao.SQL.add
      ('select sum(dcd.qtd) as qtd from DEVOLUCAO_DETALHE dcd');
    qryDevolucao.SQL.add
      ('left join devolucaO_master dcm on dcm.codigo=dcd.FK_DEVOLUCAO');
    qryDevolucao.SQL.add('where');
    qryDevolucao.SQL.add('dcm.FK_VENDA=:numero');
    qryDevolucao.Params[0].Value := aVenda;
    qryDevolucao.Open;

    if qryDevolucao.FieldByName('qtd').AsFloat > 0 then
      result := true;
  finally
    qryDevolucao.Free;
  end;

end;

procedure TfrmPedidoVenda.btnCancelarClick(Sender: TObject);
begin
  if qryPV.IsEmpty then
  begin
    exit;
  end;

  if (qryPVSITUACAO.Value = 'C') then
  begin
    ShowMessage('Pedido de Venda já está CANCELADO!');
    exit;
  end;

  if VerificaCR(qryPVCODIGO.Value) then
  begin
    ShowMessage('Venda não pode ser cancelada!' + #13 +
      'Existem parcelas recebidas desta venda!');
    exit;
  end;

  if VerificaCR(qryPVCODIGO.Value) then
  begin
    ShowMessage('Venda não pode ser cancelada!' + #13 +
      'Existe NFC-e emitida para esta venda!');
    exit;
  end;

  if VerificaDevolucao(qryPVCODIGO.Value) then
  begin
    ShowMessage('Venda não pode ser cancelada!' + #13 +
      'Existe Devolução para esta venda!');
    exit;
  end;

  Dados.vAutorizar := true;

  if (qryPVSITUACAO.Value = 'F') then
  begin
    if not Dados.eSupervisor then
    begin
      try
        btnCancelar.Enabled := false;
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;
  end;

  if not Dados.vAutorizar then
  begin
    exit;
  end;

  If Application.messagebox('Tem certeza que CANCELAR PEDIDO?', 'Confirmação',
    mb_yesno + mb_iconquestion) <> idyes then
  begin
    exit;
  end;

  if not(qryPV.State in dsEditModes) then
    qryPV.edit;
  qryPVSITUACAO.Value := 'C';
  qryPV.Post;

  Dados.EstornaFinanceiro(qryPVCODIGO.Value);

  try
    qryPV_Itens.close;
    qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
    qryPV_Itens.Open;
    qryPV_Itens.DisableControls;
    qryPV_Itens.First;
    while not qryPV_Itens.eof do
    begin

      if qryPV_ItensID_SERIAL.AsInteger > 0 then
        Dados.estornaserial(qryPV_ItensID_SERIAL.AsInteger);

      dmEstoque.AtualizaEstoque(qryPV_ItensID_PRODUTO.Value,
        qryPV_ItensQTD.AsFloat, 0, 'E', 'R');

      dmEstoque.AtualizaGrade(qryPV_ItensID_PRODUTO.AsInteger,
        qryPV_ItensFK_GRADE.AsInteger, qryPV_ItensQTD.AsFloat, 'E', 0);

      dmEstoque.AtualizaComposicao(qryPV_ItensID_PRODUTO.Value,
        qryPV_ItensQTD.AsFloat, 0, 'E', 'R');

      qryPV_Itens.Next;
    end;
    ShowMessage('Pedido de Venda Cancelado Com Sucesso!');
  finally
    qryPV_Itens.EnableControls;
  end;
end;

procedure TfrmPedidoVenda.btnEmailClick(Sender: TObject);
begin

  if qryPV.IsEmpty then
    exit;

  try

    btnImp.Enabled := false;

    qryPV.Filter := 'CODIGO=' + qryPVCODIGO.AsString;
    qryPV.Filtered := true;

    qryPV_Itens.close;
    qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
    qryPV_Itens.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelPedidoVenda.fr3');

    frxPDFExport1.FileName := 'PDV.PDF';
    frxPDFExport1.DefaultPath := ExtractFilePath(Application.ExeName) + '\Temp';
    frxPDFExport1.ShowDialog := false;
    frxPDFExport1.ShowProgress := false;
    frxPDFExport1.OverwritePrompt := false;
    frxReport.PrepareReport();
    frxReport.Export(frxPDFExport1);

    Dados.qrySped_contador.close;
    Dados.qrySped_contador.Open;
    Dados.qrySped_contador.Locate('fk_empresa',
      Dados.qryEmpresaCODIGO.Value, []);

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := 'PDV';
    frmEmail.vTituloAnexo := 'PDV N.' + qryPVCODIGO.AsString;
    frmEmail.eNotaFiscal := false;
    frmEmail.AnexaArquivo := true;
    frmEmail.edtEmail.Text := LowerCase(Dados.qryEmpresaEMAIL.AsString);
    frmEmail.EdtAssunto.Text := 'PEDIDO DE VENDA N.' + qryPVCODIGO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO ' + frmEmail.EdtAssunto.Text;
    frmEmail.LstAnexo.Items.add(ExtractFilePath(Application.ExeName) +
      'Temp\PDV.PDF');
    frmEmail.ShowModal;

  finally
    frmEmail.Release;
    btnImp.Enabled := true;
    qryPV.Filtered := false;
  end;
end;

procedure TfrmPedidoVenda.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmPedidoVenda.btnImpClick(Sender: TObject);
begin

  pnImpressao.Visible := true;

end;

procedure TfrmPedidoVenda.Button1Click(Sender: TObject);
begin
  try
    btnImp.Enabled := false;

    Dados.qryPV.close;
    Dados.qryPV.SQL.Text :=
      ' select PV.*, PES.razao, ve.nome as vendedor,  co.descricao as conta from VENDAS_MASTER PV '
      + ' LEFT JOIN pessoa PES on PES.codigo= PV.id_cliente ' +
      ' LEFT JOIN contas co on co.codigo= PV.fk_caixa ' +
      ' LEFT JOIN vendedores ve on ve.codigo= PV.fk_vendedor ' + ' where' +
      ' pv.codigo=:codigo';
    Dados.qryPV.Params[0].Value := qryPVCODIGO.Value;
    Dados.qryPV.Open;

    Dados.qryPV_Itens.close;
    Dados.qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
    Dados.qryPV_Itens.Open;

    qryCliente.close;
    qryCliente.Params[0].Value := Dados.qryPVID_CLIENTE.Value;
    qryCliente.Open;

    if not chkEntrega.Checked then
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelPedidoVenda.fr3');
      frxReport.ShowReport;
    end
    else
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelPedidoVendaEntrega.fr3');
      frxReport.ShowReport;
    end;
  finally
    btnImp.Enabled := true;
    qryPV.Filtered := false;
  end;
end;

procedure TfrmPedidoVenda.Button2Click(Sender: TObject);
begin
  ImprimePedido;
end;

procedure TfrmPedidoVenda.ImprimePedido;
var
  vEndereco, sTexto: String;
  SL: TStringList;
begin

  try

    qryPV.Filtered := false;
    qryPV.Filter := 'CODIGO=' + inttostr(qryPVCODIGO.Value);
    qryPV.Filtered := true;

    qryCliente.close;
    qryCliente.Params[0].Value := qryPVID_CLIENTE.Value;
    qryCliente.Open;

    SL := TStringList.Create;

    SL.add('</ce><n>' + Dados.qryEmpresaFANTASIA.AsString + '</n>');
    SL.add(Dados.qryEmpresaENDERECO.AsString + ',' +
      Dados.qryEmpresaNUMERO.Value);
    SL.add(Trim(Dados.qryEmpresaBAIRRO.AsString) + ' - ' +
      Trim(Dados.qryEmpresaCIDADE.AsString) + '-' +
      Trim(Dados.qryEmpresaUF.AsString));
    SL.add('Fone: ' + Trim(Dados.qryEmpresaFONE.AsString));

    qryCliente.Locate('CODIGO', qryPVID_CLIENTE.Value);

    vEndereco := qryCliente.FieldByName('ENDERECO').AsString + ',' +
      qryCliente.FieldByName('NUMERO').AsString;

    SL.add('</linha_simples>');

    sTexto := 'NOTA No. ' + FormatFloat('0000', qryPVCODIGO.AsFloat);
    SL.add('<n>' + PadCenter(sTexto, Dados.qryTerminalCOLUNAS.AsInteger, '*')
      + '</n>');
    SL.add('</linha_simples>');
    sTexto := FormatFloat('0000', qryCliente.FieldByName('CODIGO').AsFloat) +
      '=>' + qryCliente.FieldByName('RAZAO').AsString;

    SL.add('</ae>Cliente...: ' + sTexto);

    if chkEntrega.Checked then
    begin
      SL.add('CNPJ/CPF..:' + qryCliente.FieldByName('CNPJ').AsString);
      SL.add('Endereco..: ' + vEndereco);
      SL.add('Comp......:' + qryCliente.FieldByName('COMPLEMENTO').AsString);
      SL.add('Bairro....: ' + qryCliente.FieldByName('BAIRRO').AsString);
      SL.add('Cidade....: ' + qryCliente.FieldByName('MUNICIPIO').AsString + '-'
        + qryCliente.FieldByName('UF').AsString);
      SL.add('CEP.......: ' + qryCliente.FieldByName('CEP').AsString);
    end;

    SL.add('Telefone..: ' + qryCliente.FieldByName('FONE1').AsString + ' ' +
      qryCliente.FieldByName('CELULAR1').AsString);

    SL.add('Emitido em:' + qryPVDATA_EMISSAO.AsString);
    SL.add('Hora......:' + timetostr(time));
    SL.add('Vendedor..:' + qryPVVIRTUAL_VENDEDOR.Value);

    SL.add('</linha_simples>');
    SL.add('<c>' + PadRight('COD', 5) + PadRight('PRODUTO', 26) +
      PadRight('QTD', 6) + PadLeft('VALOR', 8) + PadLeft('TOTAL', 10) + '</c>');
    SL.add('</linha_simples>');

    qryPV_Itens.close;
    qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
    qryPV_Itens.Open;

    qryPV_Itens.First;
    While not qryPV_Itens.eof do
    begin
      SL.add('<c>' + PadRight(qryPV_Itens.FieldByName('ID_PRODUTO').AsString, 5)
        + PadRight(qryPV_Itens.FieldByName('DESCRICAO_SL').AsString, 26) +
        PadRight(qryPV_Itens.FieldByName('QTD').AsString, 6) +
        PadLeft(FormatFloat('0.00', qryPV_Itens.FieldByName('PRECO').AsFloat),
        8) + PadLeft(FormatFloat('0.00', qryPV_Itens.FieldByName('VALOR_ITEM')
        .AsFloat), 10) + '</c>');
      qryPV_Itens.Next;
    end;

    SL.add('</linha_simples>');

    if Dados.TerminalCaixa then
    begin
      SL.add('</ae>SubtTotal..: ' + FormatFloat('###,##0.00',
        qryPVSUBTOTAL.AsFloat));
      SL.add('Desconto...: ' + FormatFloat('##0.00',
        qryPV.FieldByName('DESCONTO').AsFloat));
    end;
    SL.add('Total......: ' + FormatFloat('###,##0.00', qryPVTOTAL.AsFloat));

    if Dados.TerminalCaixa then
    begin
      SL.add('Valor Pago.: ' + FormatFloat('###,##0.00',
        qryPVDINHEIRO.AsFloat));
      SL.add('Troco......: ' + FormatFloat('###,##0.00', qryPVTROCO.AsFloat));
    end;

    if Dados.TerminalCaixa then
    begin

      SL.add('<n>' + PadCenter('Forma de pagamento',
        Dados.qryTerminalCOLUNAS.AsInteger, '*') + '</n>');

      qryVendasFPG.close;
      qryVendasFPG.Params[0].Value := qryPVCODIGO.Value;
      qryVendasFPG.Open;

      qryVendasFPG.First;
      while not qryVendasFPG.eof do
      begin
        if qryVendasFPGVALOR.AsFloat > 0 then
          SL.add(PadRight(qryVendasFPGVIRTUAL_FORMA.Value, 20, '.') + ': ' +
            FormatFloat(',0.00', qryVendasFPGVALOR.AsFloat));
        qryVendasFPG.Next;
      end;
    end;

    Dados.qryConsulta.close;
    Dados.qryConsulta.SQL.Clear;
    Dados.qryConsulta.SQL.add
      ('select cr.dtvencimento, cr.valor from creceber cr');
    Dados.qryConsulta.SQL.add('where');
    Dados.qryConsulta.SQL.add('cr.fk_venda=:id');
    Dados.qryConsulta.Params[0].Value := qryPVCODIGO.AsInteger;
    Dados.qryConsulta.Open;
    Dados.qryConsulta.First;

    if not Dados.qryConsulta.IsEmpty then
      SL.add('<n>' + PadCenter('Parcelas', Dados.qryTerminalCOLUNAS.AsInteger,
        '*') + '</n>');

    while not Dados.qryConsulta.eof do
    begin
      sTexto := '';

      sTexto := Dados.qryConsulta.FieldByName('dtvencimento').AsString + ' ' +
        FormatFloat('0.00', Dados.qryConsulta.FieldByName('valor').AsFloat);
      Dados.qryConsulta.Next;

      if not Dados.qryConsulta.eof then
        sTexto := sTexto + ' ' + Dados.qryConsulta.FieldByName('dtvencimento')
          .AsString + ' ' + FormatFloat('0.00',
          Dados.qryConsulta.FieldByName('valor').AsFloat);

      SL.add(sTexto);

      Dados.qryConsulta.Next;
    end;

    if Trim(qryPVOBSERVACOES.AsString) <> '' then
    begin
      SL.add('</linha_simples>');
      SL.add(qryPVOBSERVACOES.AsString);
    end;

    SL.add('</linha_simples>');
    SL.add('</ae>Declaro ter recebido a mercadoria, ');
    SL.add('Assinatura:');
    SL.add('</linha_simples>');
    SL.add('<ce><n>DOCUMENTO NAO FISCAL</n></ce>');
    SL.add('<ce>**Obrigado Pela Preferência**</ce>');
    SL.add('</linha_dupla>');
    SL.add('Relatório emitido em ' + DateTimeToStr(now));
    SL.add('</corte>');

    SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'caixa.txt');
    dmImpressao.ConfiguraImpressora('');
    dmImpressao.ImprimeLogo;
    dmImpressao.ImprimeTexto(SL.Text);

  finally
    SL.Free;
    qryPV.Filtered := false;
  end;

end;

procedure TfrmPedidoVenda.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmPedidoVenda.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.15);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.08);
end;

procedure TfrmPedidoVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
  begin
    DBGrid1.Canvas.Font.Style := [];
  end;

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // Muda cor da fonte da grid ************************************************

  DBGrid1.Canvas.Font.Color := clBlack;

  if (qryPVSITUACAO.Value = 'A') Then
    DBGrid1.Canvas.Font.Color := clBlack;

  if (qryPVSITUACAO.Value = 'C') Then
    DBGrid1.Canvas.Font.Color := clRed;

  if (qryPVSITUACAO.Value = 'G') Then
    DBGrid1.Canvas.Font.Color := clBlue;

  if (qryPVSITUACAO.Value = 'F') Then
    DBGrid1.Canvas.Font.Color := clGreen;

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmPedidoVenda.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;

  if idx = Column.Index then
  begin
    if vOrdem = ' ASC' then
      vOrdem := ' DESC'
    else
      vOrdem := ' ASC';
  end
  else
    vOrdem := ' ASC';

  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Data';
  DBGrid1.Columns[2].Title.Caption := 'Cliente';
  DBGrid1.Columns[3].Title.Caption := 'Vendedor';
  DBGrid1.Columns[4].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

end;

procedure TfrmPedidoVenda.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  qryPV_Itens.close;
  qryPV_Itens.Open;
end;

procedure TfrmPedidoVenda.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPedidoVenda.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryPV.Prior;
  if Key = VK_DOWN then
    qryPV.Next;
end;

procedure TfrmPedidoVenda.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if idx = 0 then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

  if (idx in [4]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TfrmPedidoVenda.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';
  maskInicio.Text := DateToStr(StartOfTheWeek(DATE));
  maskFim.Text := DateToStr(DATE);
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnAtualizar.Caption := 'F5' + sLineBreak + 'Atualizar';
  btnImp.Caption := 'F6' + sLineBreak + 'Imprimir';
  btnEmail.Caption := 'F9' + sLineBreak + 'Email';

end;

procedure TfrmPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = vk_f4 then
  begin
    btnCancelarClick(self);
    abort;
  end;

  if Key = vk_f5 then
  begin
    btnAtualizarClick(self);
    abort;
  end;

  if Key = vk_f6 then
  begin
    btnImpClick(self);
    abort;
  end;

  if Key = vk_f12 then
  begin
    maskInicio.SetFocus;
    abort;
  end;

  if Key = vk_f9 then
  begin
    btnEmailClick(self);
    abort;
  end;

end;

procedure TfrmPedidoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmPedidoVenda.FormShow(Sender: TObject);
var
  topo: Integer;
begin

  Dados.CriaPastas;

  tamanho;

  Dados.qryConfig.close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  DBGrid1TitleClick(DBGrid1.Columns[0]);

  edtLoc.SetFocus;

  topo := (self.Height div 2) - (pnImpressao.Height div 2);
  pnImpressao.top := topo - (round(topo * 0.30));
  pnImpressao.left := (Width div 2) - (pnImpressao.Width div 2);

end;

procedure TfrmPedidoVenda.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  FPG: String;
  FParcelas: String;
begin

  FParcelas := Dados.GetParcelas(qryPVCODIGO.Value);
  if Trim(FParcelas) <> '' then
    FParcelas := ' Parc:' + FParcelas;

  qryVendasFPG.close;
  qryVendasFPG.Params[0].Value := qryPVCODIGO.Value;
  qryVendasFPG.Open;

  qryVendasFPG.First;
  while not qryVendasFPG.eof do
  begin
    if qryVendasFPGVALOR.AsFloat > 0 then
      FPG := FPG + ' ' + qryVendasFPGVIRTUAL_FORMA.Value + ':' +
        FormatFloat(',0.00', qryVendasFPGVALOR.AsFloat) + ' ';
    qryVendasFPG.Next;
  end;

  if VarName = 'FPG' then
  begin
    Value := ' TOTAL:' + FormatFloat(',0.00', qryPVTOTAL.AsFloat);
  end;

  if VarName = 'FFPG' then
    Value := FPG + FParcelas;

end;

procedure TfrmPedidoVenda.localiza;
var
  filtro, filtro1, filtro2, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  filtro2 := '';
  ordem := '';

  if vSql = '' then
    vSql := qryPV.SQL.Text;

  filtro := ' WHERE pv.fkempresa=' + Dados.qryEmpresaCODIGO.AsString;

  filtro := filtro + ' and PV.data_emissao>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and PV.data_emissao<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    strtodate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pv.codigo=' + edtLoc.Text;
      end;
    2:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and PES.RAZAO like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    3:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and VE.Nome like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    4:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and PV.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;
    5:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and PV.SITUACAO =' +
            QuotedStr(copy(edtLoc.Text, 1, 1));
      end;

  end;

  case TabSet1.TabIndex of
    0:
      filtro1 := ' and (PV.situacao in (''A'',''F'',''C'',''G'',''X''))';
    1:
      filtro1 := ' and PV.situacao=''A''';
    2:
      filtro1 := ' and PV.situacao=''G''';
    3:
      filtro1 := ' and PV.situacao=''F''';
    4:
      filtro1 := ' and PV.situacao=''C''';
  end;

  case tabFiltro.TabIndex of
    0:
      filtro2 := ' and not(PV.necf>1)';
    1:
      filtro2 := ' and pv.necf>1';
  end;

  case idx of
    0:
      ordem := ' order by PV.codigo' + vOrdem;
    1:
      ordem := ' order by PV.data_emissao' + vOrdem;
    2:
      ordem := ' order by PES.Razao' + vOrdem;
    3:
      ordem := ' order by ve.nome' + vOrdem;
    4:
      ordem := ' order by PV.total' + vOrdem;

  end;

  qryPV.close;

  qryPV.SQL.Text := vSql;
  qryPV.SQL.Text := StringReplace(qryPV.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  qryPV.Open;

end;

procedure TfrmPedidoVenda.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;
end;

procedure TfrmPedidoVenda.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmPedidoVenda.qryPVCalcFields(DataSet: TDataSet);
begin
  if qryPVSITUACAO.Value = 'A' then
    qryPVVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryPVSITUACAO.Value = 'F' then
    qryPVVIRTUAL_SITUACAO.Value := 'FECHADO';
  if qryPVSITUACAO.Value = 'C' then
    qryPVVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryPVSITUACAO.Value = 'G' then
    qryPVVIRTUAL_SITUACAO.Value := 'GRAVADO';
  if qryPVSITUACAO.Value = 'X' then
    qryPVVIRTUAL_SITUACAO.Value := 'EM ABERTO';

  if qryPVTIPO.Value = 'P' then
    qryPVVIRTUAL_TIPO.Value := 'PEDIDO';

  if qryPVTIPO.Value = 'V' then
    qryPVVIRTUAL_TIPO.Value := 'VENDA';

end;

procedure TfrmPedidoVenda.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

procedure TfrmPedidoVenda.tabFiltroClick(Sender: TObject);
begin
  localiza;
end;

end.
