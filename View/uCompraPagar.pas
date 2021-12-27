unit uCompraPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, ACBrBase,
  ACBrEnterTab;

type
  TfrmCPParcela = class(TForm)
    qryCP: TFDQuery;
    dsCP: TDataSource;
    DBGridEh1: TDBGridEh;
    qryCPTVALOR: TAggregateField;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    qryCPCODIGO: TIntegerField;
    qryCPDATA: TDateField;
    qryCPFKFORNECE: TIntegerField;
    qryCPDOC: TStringField;
    qryCPDTVENCIMENTO: TDateField;
    qryCPHISTORICO: TStringField;
    qryCPDATA_PAGAMENTO: TDateField;
    qryCPSITUACAO: TStringField;
    qryCPFKEMPRESA: TIntegerField;
    qryCPFK_COMPRA: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Splitter4: TSplitter;
    edtSubtotal: TEdit;
    edtParcela: TEdit;
    BtnGerar: TBitBtn;
    Label4: TLabel;
    edtIntervalo: TEdit;
    qryCPVALOR: TCurrencyField;
    qryCPDESCONTO: TCurrencyField;
    qryCPJUROS: TFMTBCDField;
    qryCPVLPAGO: TCurrencyField;
    qryCPVL_RESTANTE: TFMTBCDField;
    Splitter3: TSplitter;
    Splitter2: TSplitter;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    BtnExcluir: TBitBtn;
    Shape1: TShape;
    Label5: TLabel;
    edtEntrada: TEdit;
    edtTotal: TEdit;
    Label6: TLabel;
    qryCaixa: TFDQuery;
    qryCaixaCODIGO: TIntegerField;
    qryCaixaEMISSAO: TDateField;
    qryCaixaDOC: TStringField;
    qryCaixaFKPLANO: TIntegerField;
    qryCaixaFKCONTA: TIntegerField;
    qryCaixaHISTORICO: TStringField;
    qryCaixaENTRADA: TFMTBCDField;
    qryCaixaSAIDA: TFMTBCDField;
    qryCaixaSALDO: TFMTBCDField;
    qryCaixaFKVENDA: TIntegerField;
    qryCaixaFKCOMPRA: TIntegerField;
    qryCaixaFKPAGAR: TIntegerField;
    qryCaixaFKRECEBER: TIntegerField;
    qryCaixaTRANSFERENCIA: TIntegerField;
    qryCaixaBLOQUEADO: TStringField;
    qryCaixaFK_CONTA1: TIntegerField;
    qryCaixaFK_PAI: TIntegerField;
    qryCaixaHORA_EMISSAO: TTimeField;
    qryCaixaECARTAO: TStringField;
    qryCaixaID_USUARIO: TIntegerField;
    qryCaixaEMPRESA: TIntegerField;
    qryCaixaFK_FICHA_CLI: TIntegerField;
    qryCaixaVISIVEL: TStringField;
    qryCaixaDT_CADASTRO: TDateField;
    qryCaixaFK_DEVOLUCAO: TIntegerField;
    qryCaixaFK_CARTAO: TIntegerField;
    qryCaixaTIPO_MOVIMENTO: TStringField;
    procedure edtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure qryCPAfterPost(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure qryCPBeforePost(DataSet: TDataSet);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure edtEntradaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure Caixa;
    { Private declarations }
  public
    idCompra: integer;
    vValor: real;
    { Public declarations }
  end;

var
  frmCPParcela: TfrmCPParcela;

implementation

{$R *.dfm}

uses Udados, uCadCompra;

procedure TfrmCPParcela.btnAvancarClick(Sender: TObject);
var
  valor1, valor2: string;
begin
  if qryCP.State in dsEditModes then
    qryCP.Post;

  if StrToFloatDef(edtTotal.Text, 0) > 0 then
  begin
    if not qryCP.IsEmpty then
    begin
      valor1 := formatfloat('0.00', SimpleRoundTo(qryCPTVALOR.Value, -2));
      valor2 := edtTotal.Text;
      if valor1.ToExtended <> valor2.ToExtended then
      begin
        ShowMessage('Total das parcelas difere do Total das Compras!');
        exit;
      end;
    end
    else
    begin
      ShowMessage('Gere as parcelas!');
      exit;
    end;
  end;

  dados.vChamaImpressao := true;
  dados.vPodeFecharCompra := true;
  close;
end;

procedure TfrmCPParcela.BtnExcluirClick(Sender: TObject);
begin

  try
    BtnExcluir.Enabled := false;
    while not qryCP.IsEmpty do
    begin
      qryCP.Delete;
    end;
  finally
    BtnExcluir.Enabled := true;
  end;
end;

procedure TfrmCPParcela.Caixa;
begin
  qryCaixa.close;
  qryCaixa.Params[0].Value := frmCadCompra.qryCompraID.Value;
  qryCaixa.Open;

  if qryCaixa.IsEmpty then
  begin
    qryCaixa.Insert;
    qryCaixaCODIGO.Value := dados.Numerador('CAIXA', 'CODIGO', 'N', '', '');
  end
  else
    qryCaixa.Edit;
  qryCaixaEMISSAO.Value := Date;
  qryCaixaDOC.AsString := 'CO.' + frmCadCompra.qryCompraID.AsString;
  qryCaixaHORA_EMISSAO.Value := Now;
  qryCaixaTIPO_MOVIMENTO.Value := 'CO';
  qryCaixaFKCONTA.Value := dados.qryEmpresaID_CAIXA_GERAL.Value;
  qryCaixaFKPLANO.Value := dados.qryEmpresaID_PLANO_COMPRA.Value;
  qryCaixaHISTORICO.Value := frmCadCompra.qryCompraVIRTUAL_FORNECEDOR.AsString;
  qryCaixaENTRADA.Value := 0;
  qryCaixaSAIDA.asfloat := StrToFloatDef(edtEntrada.Text, 0);
  qryCaixaEMPRESA.Value := frmCadCompra.qryCompraEMPRESA.Value;
  qryCaixaFKCOMPRA.Value := frmCadCompra.qryCompraID.Value;
  qryCaixa.Post;
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCPParcela.BtnGerarClick(Sender: TObject);
var
  i: integer;
  vDif, vSoma: real;
begin
  vValor := StrToFloatDef(edtTotal.Text, 0);
  try
    if strtoint(edtParcela.Text) = 0 then
    begin
      ShowMessage('Digite o numero de parcelas ');
      exit;
    end;

    if strtoint(edtIntervalo.Text) = 0 then
    begin
      ShowMessage('Digite o intervalo entre parcelas ');
      exit;
    end;

    if StrToFloatDef(edtEntrada.Text, 0) > 0 then
    begin
      dados.qryExecute.close;
      dados.qryExecute.SQL.Text := 'DELETE FROM CAIXA WHERE FKCOMPRA=:ID';
      dados.qryExecute.Params[0].Value := dados.qryCompraID.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;
      Caixa;
    end;

    if StrToFloatDef(edtTotal.Text, 0) > 0 then
    begin

      BtnExcluirClick(self);
      BtnGerar.Enabled := false;
      vSoma := 0;
      for i := 1 to strtoint(edtParcela.Text) do
      begin
        qryCP.Insert;
        qryCPCODIGO.Value := dados.Numerador('CPAGAR', 'CODIGO', 'N', '', '');
        qryCPDATA.Value := Date;
        qryCPFKFORNECE.Value := frmCadCompra.qryCompraFORNECEDOR.Value;
        qryCPDOC.Value := frmCadCompra.qryCompraID.AsString + '/' + IntToStr(i);
        qryCPVALOR.AsString := formatfloat('0.00',
          SimpleRoundTo(vValor / strtoint(edtParcela.Text), -2));
        qryCPDTVENCIMENTO.Value := Date + (i * strtoint(edtIntervalo.Text));
        qryCPHISTORICO.Value := 'REF.COMPRA Nº' +
          frmCadCompra.qryCompraID.AsString;
        qryCPDESCONTO.Value := 0;
        qryCPJUROS.Value := 0;
        qryCPVLPAGO.Value := 0;
        qryCPVL_RESTANTE.Value := SimpleRoundTo(qryCPVALOR.Value, -2);
        qryCPSITUACAO.Value := 'A';
        qryCPFKEMPRESA.Value := frmCadCompra.qryCompraEMPRESA.Value;
        qryCPFK_COMPRA.Value := frmCadCompra.qryCompraID.Value;
        qryCP.Post;
        dados.Conexao.CommitRetaining;
        vSoma := vSoma + qryCPVALOR.asfloat;
      end;

      qryCP.close;
      qryCP.Params[0].Value := frmCadCompra.qryCompraID.Value;
      qryCP.Open;

      vDif := vValor - vSoma;

      if vDif <> 0 then
      begin
        qryCP.Edit;
        qryCPVALOR.Value := SimpleRoundTo(qryCPVALOR.Value + vDif, -2);
        qryCP.Post;
        dados.Conexao.CommitRetaining;
      end;
    end;
  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmCPParcela.btnVoltarClick(Sender: TObject);
begin
  dados.vChamaImpressao := false;
  dados.vPodeFecharCompra := false;
  close;
end;

procedure TfrmCPParcela.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCPParcela.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCPParcela.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCPParcela.edtEntradaExit(Sender: TObject);
begin
  edtTotal.Text := formatfloat('0.00', StrToFloatDef(edtSubtotal.Text, 0) -
    StrToFloatDef(edtEntrada.Text, 0));
end;

procedure TfrmCPParcela.edtParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmCPParcela.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCPParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F2 then
    BtnGerar.Click;
  if Key = vk_F3 then
    BtnExcluir.Click;
  if Key = vk_F4 then
    btnVoltar.Click;
  if Key = vk_F5 then
    btnAvancar.Click;
end;

procedure TfrmCPParcela.FormShow(Sender: TObject);
begin
  qryCP.close;
  qryCP.Params[0].Value := idCompra;
  qryCP.Open;
  edtParcela.SetFocus;
end;

procedure TfrmCPParcela.qryCPAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCPParcela.qryCPBeforePost(DataSet: TDataSet);
begin
  qryCPVL_RESTANTE.Value := qryCPVALOR.Value;
end;

end.
