unit uImportarNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, MATH,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmImportarNFe = class(TForm)
    qryOrcamento: TFDQuery;
    qryItemO: TFDQuery;
    qryPV: TFDQuery;
    qryPV_Itens: TFDQuery;
    qryOrcamentoCODIGO: TIntegerField;
    qryOrcamentoDATA: TDateField;
    qryOrcamentoFKVENDEDOR: TIntegerField;
    qryOrcamentoFK_CLIENTE: TIntegerField;
    qryOrcamentoCLIENTE: TStringField;
    qryOrcamentoTELEFONE: TStringField;
    qryOrcamentoCELULAR: TStringField;
    qryOrcamentoENDERECO: TStringField;
    qryOrcamentoNUMERO: TStringField;
    qryOrcamentoBAIRRO: TStringField;
    qryOrcamentoCIDADE: TStringField;
    qryOrcamentoUF: TStringField;
    qryOrcamentoCNPJ: TStringField;
    qryOrcamentoFORMA_PAGAMENTO: TStringField;
    qryOrcamentoVALIDADE: TSmallintField;
    qryOrcamentoOBS: TMemoField;
    qryOrcamentoSITUACAO: TStringField;
    qryOrcamentoTOTAL: TFMTBCDField;
    qryOrcamentoCEP: TStringField;
    qryOrcamentoFKEMPRESA: TIntegerField;
    qryOrcamentoSUBTOTAL: TFMTBCDField;
    qryOrcamentoPERCENTUAL: TFMTBCDField;
    qryOrcamentoDESCONTO: TFMTBCDField;
    qryItemOCODIGO: TIntegerField;
    qryItemOFK_ORCAMENTO: TIntegerField;
    qryItemOFK_PRODUTO: TIntegerField;
    qryItemOQTD: TFMTBCDField;
    qryItemOPRECO: TFMTBCDField;
    qryItemOTOTAL: TFMTBCDField;
    qryItemOITEM: TSmallintField;
    qryPVCODIGO: TIntegerField;
    qryPVDATA_EMISSAO: TDateField;
    qryPVDATA_SAIDA: TDateField;
    qryPVID_CLIENTE: TIntegerField;
    qryPVFK_USUARIO: TIntegerField;
    qryPVFK_CAIXA: TIntegerField;
    qryPVFK_VENDEDOR: TIntegerField;
    qryPVCPF_NOTA: TStringField;
    qryPVSUBTOTAL: TFMTBCDField;
    qryPVTIPO_DESCONTO: TStringField;
    qryPVDESCONTO: TFMTBCDField;
    qryPVTROCO: TFMTBCDField;
    qryPVDINHEIRO: TFMTBCDField;
    qryPVTOTAL: TFMTBCDField;
    qryPVOBSERVACOES: TMemoField;
    qryPVSITUACAO: TStringField;
    qryPVFKEMPRESA: TIntegerField;
    qryPVPERCENTUAL: TFMTBCDField;
    qryPVTIPO: TStringField;
    qryPVNECF: TIntegerField;
    qryPVFKORCAMENTO: TIntegerField;
    qryPVLOTE: TIntegerField;
    qryPVGERA_FINANCEIRO: TStringField;
    qryPVPERCENTUAL_ACRESCIMO: TFMTBCDField;
    qryPVACRESCIMO: TFMTBCDField;
    qryPVFK_TABELA: TIntegerField;
    qryPVPEDIDO: TStringField;
    qryPVFK_OS: TIntegerField;
    qryPV_ItensCODIGO: TIntegerField;
    qryPV_ItensFKVENDA: TIntegerField;
    qryPV_ItensID_PRODUTO: TIntegerField;
    qryPV_ItensITEM: TSmallintField;
    qryPV_ItensCOD_BARRA: TStringField;
    qryPV_ItensQTD: TFMTBCDField;
    qryPV_ItensE_MEDIO: TFMTBCDField;
    qryPV_ItensPRECO: TFMTBCDField;
    qryPV_ItensVALOR_ITEM: TFMTBCDField;
    qryPV_ItensVDESCONTO: TFMTBCDField;
    qryPV_ItensTOTAL: TFMTBCDField;
    qryPV_ItensSITUACAO: TStringField;
    qryPV_ItensUNIDADE: TStringField;
    qryPV_ItensQTD_DEVOLVIDA: TFMTBCDField;
    qryPV_ItensACRESCIMO: TFMTBCDField;
    qryPV_ItensOS: TStringField;
    qryDevVenda: TFDQuery;
    qryItensDevVenda: TFDQuery;
    qryDevVendaCODIGO: TIntegerField;
    qryDevVendaFK_VENDA: TIntegerField;
    qryDevVendaFK_CLIENTE: TIntegerField;
    qryDevVendaDATA: TDateField;
    qryDevVendaTOTAL: TFMTBCDField;
    qryDevVendaOBS: TStringField;
    qryDevVendaSITUACAO: TStringField;
    qryDevVendaFKEMPRESA: TIntegerField;
    qryDevVendaFK_VENDEDOR: TIntegerField;
    qryDevVendaTIPO_DEVOLUCAO: TStringField;
    qryItensDevVendaCODIGO: TIntegerField;
    qryItensDevVendaFK_DEVOLUCAO: TIntegerField;
    qryItensDevVendaFK_PRODUTO: TIntegerField;
    qryItensDevVendaQTD: TFMTBCDField;
    qryItensDevVendaQTD_VENDIDA: TFMTBCDField;
    qryItensDevVendaPRECO: TFMTBCDField;
    qryItensDevVendaFK_DEVOLUCAO_ITEM: TIntegerField;
    qryItensDevVendaTOTAL: TFMTBCDField;
    qryDevCompra: TFDQuery;
    qryDevItensCompra: TFDQuery;
    qryDevCompraCODIGO: TIntegerField;
    qryDevCompraDATA: TDateField;
    qryDevCompraFK_FORNECEDOR: TIntegerField;
    qryDevCompraTOTAL: TFMTBCDField;
    qryDevCompraNUMERO_COMPRA: TIntegerField;
    qryDevCompraFK_EMPRESA: TIntegerField;
    qryDevCompraSITUACAO: TStringField;
    qryDevCompraFK_USUARIO: TIntegerField;
    qryDevCompraOBSERVACAO: TStringField;
    qryDevItensCompraCODIGO: TIntegerField;
    qryDevItensCompraFK_DEVOLUCAO_COMPRA_M: TIntegerField;
    qryDevItensCompraID_PRODUTO: TIntegerField;
    qryDevItensCompraQTD_COMPRADA: TFMTBCDField;
    qryDevItensCompraQTD_DEVOLVIDA: TFMTBCDField;
    qryDevItensCompraPRECO: TFMTBCDField;
    qryDevItensCompraTOTAL: TFMTBCDField;
    qryDevItensCompraFK_COMPRA_ITEM: TIntegerField;
    dsOrcamento: TDataSource;
    dsVenda: TDataSource;
    dsDevolucaoC: TDataSource;
    dsDevolucaoV: TDataSource;
    pageMenu: TPageControl;
    TabSheetMenu: TTabSheet;
    btnPedido: TButton;
    btnOrcamento: TButton;
    btnDevcompra: TButton;
    btnDevVenda: TButton;
    TabSheetImportar: TTabSheet;
    PageImportar: TPageControl;
    TabSheetOrcamento: TTabSheet;
    DBGrid3: TDBGrid;
    TabSheetVenda: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheetDevC: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheetDevV: TTabSheet;
    DBGrid5: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    edtPessoa: TEdit;
    BtnImportar: TBitBtn;
    qryOrcamentoSELECAO: TIntegerField;
    qryPVSELECAO: TIntegerField;
    chkorcamento: TCheckBox;
    ChkVenda: TCheckBox;
    qryItemOPRODUTO: TStringField;
    qryPV_ItensPRODUTO: TStringField;
    qryItensDevVendaPRODUTO: TStringField;
    qryDevItensCompraPRODUTO: TStringField;
    qryPVNOME: TStringField;
    qryDevVendaRAZAO: TStringField;
    qryDevCompraRAZAO: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ChkVendaClick(Sender: TObject);
    procedure chkorcamentoClick(Sender: TObject);
  private
    procedure AtualizaFPG(CodNFE, CodVenda: Integer);
    procedure Filtra;
    procedure ImportarOrcamento;
    procedure ImportarDevV;
    procedure ImportarPedido;
    procedure ImportarDevC;
    procedure AtualizaCAIXA(CodNFE, CodVenda: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarNFe: TfrmImportarNFe;

implementation

{$R *.dfm}

uses uPDV, Udados, uNFe;

procedure TfrmImportarNFe.btnFiltrarClick(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmImportarNFe.BtnImportarClick(Sender: TObject);
begin
  if PageImportar.ActivePage = TabSheetOrcamento then
    ImportarOrcamento;
  if PageImportar.ActivePage = TabSheetVenda then
    ImportarPedido;
  if PageImportar.ActivePage = TabSheetDevC then
    ImportarDevC;
  if PageImportar.ActivePage = TabSheetDevV then
    ImportarDevV;
end;

procedure TfrmImportarNFe.AtualizaFPG(CodNFE, CodVenda: Integer);
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Clear;
  dados.qryConsulta.SQL.Text :=
    'update creceber set fk_nfe=:nfe where FK_VENDA=:FK';
  dados.qryConsulta.ParamByName('NFE').Value := CodNFE;
  dados.qryConsulta.ParamByName('FK').Value := CodVenda;
  dados.qryConsulta.Prepare;
  dados.qryConsulta.ExecSQL;

end;

procedure TfrmImportarNFe.AtualizaCAIXA(CodNFE, CodVenda: Integer);
begin
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Clear;
  dados.qryConsulta.SQL.Text :=
    'update CAIXA set fk_nfe=:nfe where FKVENDA=:FK';
  dados.qryConsulta.ParamByName('NFE').Value := CodNFE;
  dados.qryConsulta.ParamByName('FK').Value := CodVenda;
  dados.qryConsulta.Prepare;
  dados.qryConsulta.ExecSQL;

end;

procedure TfrmImportarNFe.Filtra;
begin
  if PageImportar.ActivePage = TabSheetOrcamento then
  begin
    qryOrcamento.Close;
    qryOrcamento.ParamByName('data1').AsDate := strtodate(maskInicio.EditText);
    qryOrcamento.ParamByName('data2').AsDate := strtodate(maskFim.EditText);
    if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
      qryOrcamento.ParamByName('cliente').Value := '%' + edtPessoa.Text + '%'
    else
      qryOrcamento.ParamByName('cliente').Value := edtPessoa.Text + '%';
    qryOrcamento.Open;

    qryOrcamento.Locate('codigo', StrToIntDef(edtNumero.Text, 0), []);
  end;

  if PageImportar.ActivePage = TabSheetVenda then
  begin
    qryPV.Close;
    qryPV.ParamByName('data1').AsDate := strtodate(maskInicio.EditText);
    qryPV.ParamByName('data2').AsDate := strtodate(maskFim.EditText);
    if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
      qryPV.ParamByName('nome').Value := '%' + edtPessoa.Text + '%'
    else
      qryPV.ParamByName('nome').Value := edtPessoa.Text + '%';
    qryPV.Open;
    qryPV.Locate('codigo', StrToIntDef(edtNumero.Text, 0), []);
  end;

  if PageImportar.ActivePage = TabSheetDevC then
  begin
    qryDevCompra.Close;
    qryDevCompra.ParamByName('data1').AsDate := strtodate(maskInicio.EditText);
    qryDevCompra.ParamByName('data2').AsDate := strtodate(maskFim.EditText);
    if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
      qryDevCompra.ParamByName('nome').Value := '%' + edtPessoa.Text + '%'
    else
      qryDevCompra.ParamByName('nome').Value := edtPessoa.Text + '%';
    qryDevCompra.Open;
    qryDevCompra.Locate('codigo', StrToIntDef(edtNumero.Text, 0), []);
  end;

  if PageImportar.ActivePage = TabSheetDevV then
  begin
    qryDevVenda.Close;
    qryDevVenda.ParamByName('data1').AsDate := strtodate(maskInicio.EditText);
    qryDevVenda.ParamByName('data2').AsDate := strtodate(maskFim.EditText);
    if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
      qryDevVenda.ParamByName('nome').Value := '%' + edtPessoa.Text + '%'
    else
      qryDevVenda.ParamByName('nome').Value := edtPessoa.Text + '%';
    qryDevVenda.Open;
    qryDevVenda.Locate('codigo', StrToIntDef(edtNumero.Text, 0), []);
  end;
end;

procedure TfrmImportarNFe.ImportarDevC;
var
  vitem: Integer;
  qtd: real;
begin
  try
    BtnImportar.Enabled := false;

    qryDevItensCompra.Close;
    qryDevItensCompra.Params[0].Value := qryDevCompraCODIGO.Value;
    qryDevItensCompra.Open;

    if qryDevCompra.IsEmpty then
    begin
      ShowMessage('Devolução de Compra não está Fechada ou não existe!');
      exit;
    end;

    if not(frmCadNFe.qryVenda.State in dsEditModes) then
      frmCadNFe.qryVenda.Edit;
    frmCadNFe.qryVendaFK_VENDEDOR.Value := 1;
    frmCadNFe.qryVendaDESCONTO.Value := 0;
    frmCadNFe.qryVendaFINALIDADE.Value := '3';
    frmCadNFe.qryVendaMOVIMENTO.Value := 'S';
    frmCadNFe.qryVenda.Post;
    dados.Conexao.CommitRetaining;

    if not frmCadNFe.qryItem.IsEmpty then
    begin
      If Application.messageBox('Deseja Excluir os Itens?', 'Confirmação',
        mb_YesNo + mb_iconquestion) = idyes then
      begin
        frmCadNFe.qryItem.First;
        while not frmCadNFe.qryItem.IsEmpty do
          frmCadNFe.qryItem.Delete;
      end;
    end;

    dados.Conexao.CommitRetaining;

    qryDevItensCompra.First;
    while not qryDevItensCompra.Eof do
    begin
      dados.qryConsulta.Close;
      dados.qryConsulta.SQL.Text :=
        ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
        + ' where ' + ' pr.codigo=:id ';
      dados.qryConsulta.Params[0].Value :=
        qryDevItensCompraID_PRODUTO.AsInteger;
      dados.qryConsulta.Open;

      frmCadNFe.qryItem.Last;
      vitem := frmCadNFe.qryItemITEM.AsInteger + 1;
      frmCadNFe.qryItem.Append;
      frmCadNFe.qryItemCODIGO.AsFloat := dados.Numerador('NFE_DETALHE',
        'CODIGO', 'N', '', '');
      frmCadNFe.qryItemID_PRODUTO.Value := qryDevItensCompraID_PRODUTO.Value;
      frmCadNFe.BuscaProduto;
      frmCadNFe.qryItemDESCRICAO.Value := qryDevItensCompraPRODUTO.AsString;
      frmCadNFe.qryItemFKNFE.Value := frmCadNFe.qryVendaCODIGO.Value;
      frmCadNFe.qryItemITEM.Value := vitem;
      frmCadNFe.qryItemQTD.AsFloat := qryDevItensCompraQTD_DEVOLVIDA.AsFloat;
      frmCadNFe.qryItemUNIDADE.AsString := dados.qryConsulta.FieldByName
        ('UNIDADE').AsString;
      frmCadNFe.qryItemPRECO.AsFloat := qryDevItensCompraPRECO.AsFloat;;
      frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemQTD.AsFloat *
        frmCadNFe.qryItemPRECO.AsFloat;

      frmCadNFe.qryItemEVENDA.AsString := 'S';

      frmCadNFe.qryItemCOD_BARRA.Value := dados.qryConsulta.FieldByName
        ('CODBARRA').AsString;

      frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemTOTAL.AsFloat;

      frmCadNFe.qryItem.Post;
      dados.Conexao.CommitRetaining;
      qryDevItensCompra.Next;
    end;

    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    Close;
  finally
    BtnImportar.Enabled := true;
  end;
end;

procedure TfrmImportarNFe.ImportarPedido;
var
  vitem: Integer;
  qtd: real;
begin
  try
    BtnImportar.Enabled := false;

    if not frmCadNFe.qryItem.IsEmpty then
    begin
      If Application.messageBox('Deseja Excluir os Itens?', 'Confirmação',
        mb_YesNo + mb_iconquestion) = idyes then
      begin
        frmCadNFe.qryItem.First;
        while not frmCadNFe.qryItem.IsEmpty do
          frmCadNFe.qryItem.Delete;
      end;
    end;

    qryPV.First;

    while not qryPV.Eof do
    begin
      if qryPVSELECAO.Value = 1 then
      begin

        qryPV_Itens.Close;
        qryPV_Itens.Params[0].Value := qryPVCODIGO.Value;
        qryPV_Itens.Open;

        if not(frmCadNFe.qryVenda.State in dsEditModes) then
          frmCadNFe.qryVenda.Edit;
        frmCadNFe.qryVendaFK_VENDEDOR.Value := qryPVFK_VENDEDOR.Value;
        frmCadNFe.qryVendaDESCONTO.Value := qryPVDESCONTO.Value;
        frmCadNFe.qryVendaFKVENDA.Value := qryPVCODIGO.AsInteger;
        frmCadNFe.qryVendaIMPORTOU.Value := 'S';
        frmCadNFe.qryVenda.Post;
        dados.Conexao.CommitRetaining;

        qryPV_Itens.First;
        while not qryPV_Itens.Eof do
        begin
          dados.qryConsulta.Close;
          dados.qryConsulta.SQL.Text :=
            ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
            + ' where ' + ' pr.codigo=:id ';
          dados.qryConsulta.Params[0].Value := qryPV_ItensID_PRODUTO.AsInteger;
          dados.qryConsulta.Open;

          frmCadNFe.qryItem.Last;
          vitem := frmCadNFe.qryItemITEM.AsInteger + 1;
          frmCadNFe.qryItem.Append;
          frmCadNFe.qryItemCODIGO.AsFloat := dados.Numerador('NFE_DETALHE',
            'CODIGO', 'N', '', '');
          frmCadNFe.qryItemID_PRODUTO.Value := qryPV_ItensID_PRODUTO.Value;
          frmCadNFe.BuscaProduto;
          frmCadNFe.qryItemDESCRICAO.Value := qryPV_ItensPRODUTO.AsString;
          frmCadNFe.qryItemFKNFE.Value := frmCadNFe.qryVendaCODIGO.Value;
          frmCadNFe.qryItemITEM.Value := vitem;
          frmCadNFe.qryItemQTD.Value := qryPV_ItensQTD.Value;
          frmCadNFe.qryItemUNIDADE.AsString := dados.qryConsulta.FieldByName
            ('UNIDADE').AsString;
          frmCadNFe.qryItemPRECO.Value := qryPV_ItensPRECO.Value;;
          frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemQTD.AsFloat *
            frmCadNFe.qryItemPRECO.AsFloat;
          frmCadNFe.qryItemEVENDA.AsString := 'S';
          frmCadNFe.qryItemCOD_BARRA.Value := dados.qryConsulta.FieldByName
            ('CODBARRA').AsString;

          frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemTOTAL.AsFloat;
          frmCadNFe.qryItem.Post;
          dados.Conexao.CommitRetaining;
          qryPV_Itens.Next;
        end;
        AtualizaFPG(frmCadNFe.qryVendaCODIGO.Value, qryPVCODIGO.Value);
      end;
      qryPV.Next;
    end;

    frmCadNFe.AbreCR;
    if frmCadNFe.qryCRTVALOR.Value > 0 then
    begin
      frmCadNFe.qryVenda.Edit;
      frmCadNFe.qryVendaDINHEIRO.AsFloat := frmCadNFe.qryVendaTOTAL.AsFloat -
        frmCadNFe.qryCRTVALOR.Value;
      frmCadNFe.qryVenda.Post;
    end;

    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    Close;
  finally
    BtnImportar.Enabled := true;
  end;

end;

procedure TfrmImportarNFe.ImportarOrcamento;
var
  vitem: Integer;
  qtd: real;
begin

  try
    BtnImportar.Enabled := false;

    qryOrcamento.First;

    if not frmCadNFe.qryItem.IsEmpty then
    begin
      If Application.messageBox('Deseja Excluir os Itens?', 'Confirmação',
        mb_YesNo + mb_iconquestion) = idyes then
      begin
        frmCadNFe.qryItem.First;
        while not frmCadNFe.qryItem.IsEmpty do
          frmCadNFe.qryItem.Delete;
      end;
    end;

    while not qryOrcamento.Eof do
    begin
      if qryOrcamentoSELECAO.Value = 1 then
      begin

        qryItemO.Close;
        qryItemO.Params[0].Value := qryOrcamentoCODIGO.Value;
        qryItemO.Open;

        if qryOrcamento.IsEmpty then
        begin
          ShowMessage('Orçamento não encontrado!');
          exit;
        end;

        if not(frmCadNFe.qryVenda.State in dsEditModes) then
          frmCadNFe.qryVenda.Edit;
        frmCadNFe.qryVendaFK_VENDEDOR.Value := qryOrcamentoFKVENDEDOR.Value;
        frmCadNFe.qryVendaNOME.Value := qryOrcamentoCLIENTE.Value;
        frmCadNFe.qryVendaID_CLIENTE.Value := qryOrcamentoFK_CLIENTE.Value;
        frmCadNFe.qryVenda.Post;

        dados.Conexao.CommitRetaining;

        qryItemO.First;
        while not qryItemO.Eof do
        begin
          dados.qryConsulta.Close;
          dados.qryConsulta.SQL.Text :=
            ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
            + ' where ' + ' pr.codigo=:id ';
          dados.qryConsulta.Params[0].Value := qryItemOFK_PRODUTO.AsInteger;
          dados.qryConsulta.Open;
          qtd := dados.qryConsulta.FieldByName('QTD_ATUAL').AsFloat;

          frmCadNFe.qryItem.Last;
          vitem := frmCadNFe.qryItemITEM.AsInteger + 1;
          frmCadNFe.qryItem.Append;
          frmCadNFe.qryItemCODIGO.AsFloat := dados.Numerador('NFE_DETALHE',
            'CODIGO', 'N', '', '');
          frmCadNFe.qryItemID_PRODUTO.Value := qryItemOFK_PRODUTO.Value;

          frmCadNFe.BuscaProduto;

          frmCadNFe.qryItemDESCRICAO.Value := qryItemOPRODUTO.Value;

          frmCadNFe.qryItemFKNFE.Value := frmCadNFe.qryVendaCODIGO.Value;
          frmCadNFe.qryItemITEM.Value := vitem;
          frmCadNFe.qryItemQTD.Value := qryItemOQTD.Value;
          frmCadNFe.qryItemUNIDADE.AsString := dados.qryConsulta.FieldByName
            ('UNIDADE').AsString;
          frmCadNFe.qryItemPRECO.Value := qryItemOPRECO.Value;;
          frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemQTD.AsFloat *
            frmCadNFe.qryItemPRECO.AsFloat;

          frmCadNFe.qryItemCOD_BARRA.Value := dados.qryConsulta.FieldByName
            ('CODBARRA').AsString;

          frmCadNFe.qryItemEVENDA.AsString := 'S';

          frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemTOTAL.AsFloat -
            frmCadNFe.qryItemDESCONTO.AsFloat;
          frmCadNFe.qryItem.Post;
          dados.Conexao.CommitRetaining;
          qryItemO.Next;
        end;
      end;
      qryOrcamento.Next;
    end;

    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    Close;
  finally
    BtnImportar.Enabled := true;
  end;

end;

procedure TfrmImportarNFe.ImportarDevV;
var
  vitem: Integer;
  qtd: real;
begin
  try
    BtnImportar.Enabled := false;

    qryItensDevVenda.Close;
    qryItensDevVenda.Params[0].Value := qryDevVendaCODIGO.Value;
    qryItensDevVenda.Open;

    if qryDevVenda.IsEmpty then
    begin
      ShowMessage('Devolução de Venda não está Fechada ou não existe!');
      exit;
    end;

    if not(frmCadNFe.qryVenda.State in dsEditModes) then
      frmCadNFe.qryVenda.Edit;
    frmCadNFe.qryVendaFINALIDADE.Value := '3';
    frmCadNFe.qryVendaFK_VENDEDOR.Value := 1;
    frmCadNFe.qryVendaDESCONTO.Value := 0;
    frmCadNFe.qryVendaMOVIMENTO.Value := 'E';
    frmCadNFe.qryVenda.Post;
    dados.Conexao.CommitRetaining;

    if not frmCadNFe.qryItem.IsEmpty then
    begin
      If Application.messageBox('Deseja Excluir  os Itens?', 'Confirmação',
        mb_YesNo + mb_iconquestion) = idyes then
      begin
        frmCadNFe.qryItem.First;
        while not frmCadNFe.qryItem.IsEmpty do
          frmCadNFe.qryItem.Delete;
      end;
    end;

    dados.Conexao.CommitRetaining;

    qryItensDevVenda.First;
    while not qryItensDevVenda.Eof do
    begin
      dados.qryConsulta.Close;
      dados.qryConsulta.SQL.Text :=
        ' select pr.codigo, pr.codbarra, pr.unidade, pr.cfop,  pr.ncm,  pr.qtd_atual from produto pr '
        + ' where ' + ' pr.codigo=:id ';
      dados.qryConsulta.Params[0].Value := qryItensDevVendaFK_PRODUTO.AsInteger;
      dados.qryConsulta.Open;

      frmCadNFe.qryItem.Last;
      vitem := frmCadNFe.qryItemITEM.AsInteger + 1;
      frmCadNFe.qryItem.Append;
      frmCadNFe.qryItemCODIGO.AsFloat := dados.Numerador('NFE_DETALHE',
        'CODIGO', 'N', '', '');
      frmCadNFe.qryItemID_PRODUTO.Value := qryItensDevVendaFK_PRODUTO.Value;
      frmCadNFe.BuscaProduto;
      frmCadNFe.qryItemDESCRICAO.Value := qryItensDevVendaPRODUTO.AsString;
      frmCadNFe.qryItemFKNFE.Value := frmCadNFe.qryVendaCODIGO.Value;
      frmCadNFe.qryItemITEM.Value := vitem;
      frmCadNFe.qryItemQTD.AsFloat := qryItensDevVendaQTD.AsFloat;
      frmCadNFe.qryItemUNIDADE.AsString := dados.qryConsulta.FieldByName
        ('UNIDADE').AsString;
      frmCadNFe.qryItemPRECO.AsFloat := qryItensDevVendaPRECO.AsFloat;;
      frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemQTD.AsFloat *
        frmCadNFe.qryItemPRECO.AsFloat;

      frmCadNFe.qryItemEVENDA.AsString := 'S';

      frmCadNFe.qryItemCOD_BARRA.Value := dados.qryConsulta.FieldByName
        ('CODBARRA').AsString;

      frmCadNFe.qryItemTOTAL.AsFloat := frmCadNFe.qryItemTOTAL.AsFloat;
      frmCadNFe.qryItem.Post;
      dados.Conexao.CommitRetaining;
      qryItensDevVenda.Next;
    end;

    Application.ProcessMessages;
    ShowMessage('Importação realizada com sucesso!');
    Close;
  finally
    BtnImportar.Enabled := true;
  end;

end;

procedure TfrmImportarNFe.btnPedidoClick(Sender: TObject);
begin
  pageMenu.ActivePage := TabSheetImportar;
  PageImportar.ActivePage := TabSheetVenda;
end;

procedure TfrmImportarNFe.Button2Click(Sender: TObject);
begin
  pageMenu.ActivePage := TabSheetImportar;
  PageImportar.ActivePage := TabSheetOrcamento;
end;

procedure TfrmImportarNFe.Button3Click(Sender: TObject);
begin
  pageMenu.ActivePage := TabSheetImportar;
  PageImportar.ActivePage := TabSheetDevC;
end;

procedure TfrmImportarNFe.Button4Click(Sender: TObject);
begin
  pageMenu.ActivePage := TabSheetImportar;
  PageImportar.ActivePage := TabSheetDevV;
end;

procedure TfrmImportarNFe.chkorcamentoClick(Sender: TObject);
begin
  try
    qryOrcamento.DisableControls;
    if chkorcamento.Checked then
    begin
      qryOrcamento.First;
      while not qryOrcamento.Eof do
      begin
        qryOrcamento.Edit;
        qryOrcamentoSELECAO.Value := 1;
        qryOrcamento.Post;
        qryOrcamento.Next;
      end;
    end
    else
    begin
      qryOrcamento.First;
      while not qryOrcamento.Eof do
      begin
        qryOrcamento.Edit;
        qryOrcamentoSELECAO.Value := 0;
        qryOrcamento.Post;
        qryOrcamento.Next;
      end;
    end;
  finally
    qryOrcamento.EnableControls;
  end;
end;

procedure TfrmImportarNFe.ChkVendaClick(Sender: TObject);
begin
  try
    qryPV.DisableControls;
    if ChkVenda.Checked then
    begin
      qryPV.First;
      while not qryPV.Eof do
      begin
        qryPV.Edit;
        qryPVSELECAO.Value := 1;
        qryPV.Post;
        qryPV.Next;
      end;
    end
    else
    begin
      qryPV.First;
      while not qryPV.Eof do
      begin
        qryPV.Edit;
        qryPVSELECAO.Value := 0;
        qryPV.Post;
        qryPV.Next;
      end;
    end;
  finally
    qryPV.EnableControls;
  end;
end;

procedure TfrmImportarNFe.DBGrid2DblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    exit;

  (Sender as TDBGrid).DataSource.DataSet.Edit;

  (Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO')
    .AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.DataSet.Post;
end;

procedure TfrmImportarNFe.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin

  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO')
      .AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmImportarNFe.DBGrid3DblClick(Sender: TObject);
begin
  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    exit;

  (Sender as TDBGrid).DataSource.DataSet.Edit;

  (Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO').AsInteger :=
    IfThen((Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO')
    .AsInteger = 1, 0, 1);

  (Sender as TDBGrid).DataSource.DataSet.Post;
end;

procedure TfrmImportarNFe.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin

  if ((Sender as TDBGrid).DataSource.DataSet.IsEmpty) then
    exit;

  // Desenha um checkbox no dbgrid
  if Column.FieldName = 'SELECAO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.DataSet.FieldByName('SELECAO')
      .AsInteger = 1) then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmImportarNFe.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmImportarNFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnPedido.Click;
  if Key = vk_f3 then
    btnOrcamento.Click;
  if Key = vk_f4 then
    btnDevcompra.Click;
  if Key = vk_f5 then
    btnDevVenda.Click;
  if Key = vk_f9 then
    btnFiltrar.Click;
  if Key = vk_f10 then
    BtnImportar.Click;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmImportarNFe.FormShow(Sender: TObject);
begin
  maskInicio.EditText := DateToStr(date);
  maskFim.EditText := DateToStr(date);
  TabSheetMenu.TabVisible := false;
  TabSheetImportar.TabVisible := false;
  pageMenu.ActivePage := TabSheetMenu;
  TabSheetOrcamento.TabVisible := false;
  TabSheetVenda.TabVisible := false;
  TabSheetDevC.TabVisible := false;
  TabSheetDevV.TabVisible := false;
end;

end.
