unit uVendaPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math, acbrBoleto, ACBrBoletoConversao,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, ACBrBase,
  ACBrEnterTab, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,
  frxExportXLS;

type
  TfrmCRParcela = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTotal: TEdit;
    edtParcela: TEdit;
    Label2: TLabel;
    BtnExcluir: TBitBtn;
    BtnGerar: TBitBtn;
    Splitter1: TSplitter;
    qryCR: TFDQuery;
    dsCR: TDataSource;
    DBGridEh1: TDBGridEh;
    qryCRTVALOR: TAggregateField;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    Splitter4: TSplitter;
    qryCRCODIGO: TIntegerField;
    qryCRDATA: TDateField;
    qryCRFKCLIENTE: TIntegerField;
    qryCRDOC: TStringField;
    qryCRDTVENCIMENTO: TDateField;
    qryCRHISTORICO: TStringField;
    qryCRDATA_RECEBIMENTO: TDateField;
    qryCRSITUACAO: TStringField;
    qryCRFKEMPRESA: TIntegerField;
    qryCRFK_VENDA: TIntegerField;
    qryCRFKCONTA: TIntegerField;
    btnVoltar: TBitBtn;
    Splitter3: TSplitter;
    qryCRTIPO: TStringField;
    edtIntervalo: TEdit;
    Label4: TLabel;
    qryCRVALOR: TCurrencyField;
    qryCRDESCONTO: TCurrencyField;
    qryCRJUROS: TFMTBCDField;
    qryCRVRECEBIDO: TCurrencyField;
    qryCRVL_RESTANTE: TFMTBCDField;
    qryCRNBOLETO: TIntegerField;
    qryCRID_VENDEDOR: TIntegerField;
    Bevel1: TBevel;
    Splitter2: TSplitter;
    btnAvancar: TBitBtn;
    btnCarne: TBitBtn;
    Splitter5: TSplitter;
    frxDBEmpresa: TfrxDBDataset;
    frxDBReceber: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    qryCarne: TFDQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    DateField2: TDateField;
    StringField2: TStringField;
    DateField3: TDateField;
    StringField3: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField4: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    FMTBCDField1: TFMTBCDField;
    CurrencyField3: TCurrencyField;
    FMTBCDField2: TFMTBCDField;
    qryCRFLAG: TStringField;
    qryCRFK_OS: TIntegerField;
    qryCRBLOQUEADO: TStringField;
    qryCRFK_USUARIO: TIntegerField;
    qryCRTTOTAL: TAggregateField;
    qryCRTJUROS: TAggregateField;
    qryCRTDESCONTO: TAggregateField;
    qryCRTRECEBIDO: TAggregateField;
    qryCRTSALDO: TAggregateField;
    Panel3: TPanel;
    Shape1: TShape;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    qryCRCARTAO: TStringField;
    qryCRFPG_VENDA: TIntegerField;
    qryCRREMESSA: TStringField;
    qryCRREMESSA_REENVIAR: TStringField;
    Splitter6: TSplitter;
    btnBoleto: TBitBtn;
    qryCRBoleto: TFDQuery;
    qryCRID_CBR_REMESSA_UUID: TStringField;
    qryCarneRAZAO: TStringField;
    qryCarneVENDEDOR: TStringField;
    frxXLSExport1: TfrxXLSExport;
    qryCRBoletoEMAIL1: TStringField;
    procedure edtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure qryCRAfterPost(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure qryCRBeforePost(DataSet: TDataSet);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnCarneClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
  private
    procedure Excluir;
    function ChecaParcela: boolean;
    { Private declarations }
  public
    PodeFechar: boolean;
    eOpcao: string;
    idVenda: integer;
    idForma: integer;
    idCliente: integer;
    idvendedor: integer;
    data_vencimento: tdate;
    vValor: real;
    { Public declarations }
  end;

var
  frmCRParcela: TfrmCRParcela;

implementation

{$R *.dfm}

uses Udados, udtmCBR;

procedure TfrmCRParcela.btnBoletoClick(Sender: TObject);
var
  email: string;
begin
  if ChecaParcela then
    Exit;

  try
    btnBoleto.Enabled := false;
    // boleto
    qryCRBoleto.Close;
    qryCRBoleto.Params[0].Value := idVenda;
    qryCRBoleto.Params[1].Value := eOpcao;
    qryCRBoleto.Open;

    if qryCRBoleto.IsEmpty then
    begin
      ShowMessage('Não existem contas a serem baixadas');
      Exit;
    end;

    qryCRBoleto.First;
    while not qryCRBoleto.Eof do
    begin
      Dados.UpdateTipoBoleto(qryCRBoleto.FieldByName('codigo').AsInteger);
      qryCRBoleto.Next;
    end;

    dtmCBR.ConfigurarBoleta;
    dtmCBR.ACBrBoleto1.ListadeBoletos.Clear;

    qryCRBoleto.Close;
    qryCRBoleto.Params[0].Value := idVenda;
    qryCRBoleto.Params[1].Value := eOpcao;
    qryCRBoleto.Open;

    qryCRBoleto.First;
    while not qryCRBoleto.Eof do
    begin

      // popular a lista de boletos selecionados
      with dtmCBR.ACBrBoleto1.CriarTituloNaLista do
      begin
        // OcorrenciaOriginal.Tipo := toRemessaBaixar;
        NumeroDocumento := qryCRBoleto.FieldByName('NBOLETO').AsString;
        DataProcessamento := Now;
        DataDocumento := qryCRBoleto.FieldByName('DATA').Value;
        Vencimento := qryCRBoleto.FieldByName('DTVENCIMENTO').Value;
        ValorDocumento := qryCRBoleto.FieldByName('VALOR').Value;
        EspecieDoc := dtmCBR.qryCBR_CONFIGESPECIEDOC.AsString;
        EspecieMod := dtmCBR.qryCBR_CONFIGCOBMOEDA.AsString;
        Carteira := dtmCBR.qryCBR_CONFIGCARTEIRA.AsString;
        if dtmCBR.ACBrBoleto1.Banco.Numero = 1 then
          nossonumero := Carteira + qryCRBoleto.FieldByName('NBOLETO').AsString
        else
          nossonumero := qryCRBoleto.FieldByName('NBOLETO').Value;

        Aceite := atNao;

        Sacado.NomeSacado := qryCRBoleto.FieldByName('RAZAO').AsString;
        Sacado.CNPJCPF := qryCRBoleto.FieldByName('CNPJ').AsString;
        Sacado.Logradouro := qryCRBoleto.FieldByName('ENDERECO').AsString;
        Sacado.Numero := qryCRBoleto.FieldByName('NUMERO').AsString;;
        Sacado.Bairro := qryCRBoleto.FieldByName('BAIRRO').AsString;;
        Sacado.Cidade := qryCRBoleto.FieldByName('MUNICIPIO').AsString;;
        Sacado.UF := qryCRBoleto.FieldByName('UF').AsString;;
        Sacado.CEP := qryCRBoleto.FieldByName('CEP').AsString;;
        Sacado.Complemento := qryCRBoleto.FieldByName('COMPLEMENTO').AsString;;

        ValorDesconto := 0.00;
        ValorMoraJuros := 0.00;
        ValorAbatimento := 0.00;
        PercentualMulta := 0.00;
        DataMoraJuros := 0.0;
        DataDesconto := 0.0;
        DataAbatimento := 0.0;
        DataProtesto := 0.0;

        LocalPagamento := dtmCBR.qryCBR_CONFIGLOCALPAGTO.AsString;
        Mensagem.Text := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
        // Instrucao1         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
        // Instrucao2         := dtmCBR.qryCBR_CONFIGINSTRUCAO2.AsString;
        // TextoLivre         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
      end;

      qryCRBoleto.Next;
    end;
    dtmCBR.ACBrBoleto1.Imprimir;

    If Application.messagebox
      ('Deseja enviar boleto(s) para o email do cliente?', 'Confirmação',
      mb_yesno + mb_iconquestion) = IDYES then
    begin
      email := InputBox('Email do Cliente',
        'Email:', qryCRBoleto.FieldByName('email1').AsString);
      if trim(email) <> '' then
      begin
        dtmCBR.EnviarEmal(email, qryCRBoleto.FieldByName('RAZAO').AsString);
      end;
    end;
  finally
    btnBoleto.Enabled := true;
  end;
end;

function TfrmCRParcela.ChecaParcela: boolean;
var
  valor1, valor2: string;
begin
  result := false;
  if qryCR.State in dsEditModes then
    qryCR.Post;

  begin
    if not qryCR.IsEmpty then
    begin
      valor1 := formatfloat('0.00', SimpleRoundTo(qryCRTVALOR.Value, -2));
      valor2 := edtTotal.Text;
      if valor1.ToExtended <> valor2.ToExtended then
      begin
        ShowMessage('Atenção!' +
          'Não é possivel avançar. Total das parcelas difere do Valor total da venda!');
        result := true;
      end;
    end;
  end;
end;

procedure TfrmCRParcela.btnAvancarClick(Sender: TObject);
begin

  if ChecaParcela then
    Exit;

  Dados.vChamaImpressao := true;
  PodeFechar := true;
  Close;
end;

procedure TfrmCRParcela.Excluir;
begin
  try
    BtnExcluir.Enabled := false;

    if not qryCRID_CBR_REMESSA_UUID.IsNull then
      Dados.DeletaRemessa(qryCR.FieldByName('REMESSA_ARQUIVO').AsString,
        qryCR.FieldByName('ID_CBR_REMESSA_UUID').AsString);

    while not qryCR.IsEmpty do
      qryCR.Delete;

  finally
    BtnExcluir.Enabled := true;
  end;
end;

procedure TfrmCRParcela.btnCarneClick(Sender: TObject);
begin
  if ChecaParcela then
    Exit;

  if not qryCR.IsEmpty then
    Panel3.Visible := true;
end;

procedure TfrmCRParcela.BtnExcluirClick(Sender: TObject);
begin
  if Application.messagebox('Tem certeza de que deseja excluir parcelas?',
    'Confirmação', mb_yesno) = mrYes then
  begin
    Excluir;
  end;
end;

procedure TfrmCRParcela.BtnGerarClick(Sender: TObject);
var
  i: integer;
  vDif, vSoma: real;
begin
  if Application.messagebox('Deseja Gerar Parcelas?', 'Confirmação', mb_yesno)
    <> mrYes then
    Exit;

  try

    if strtoint(edtParcela.Text) = 0 then
    begin
      ShowMessage('Digite o numero de parcelas ');
      Exit;
    end;

    if strtoint(edtIntervalo.Text) = 0 then
    begin
      ShowMessage('Digite o Intervalo entre parcelas ');
      Exit;
    end;

    Excluir;

    BtnGerar.Enabled := false;
    vSoma := 0;
    for i := 1 to strtoint(edtParcela.Text) do
    begin
      qryCR.Insert;
      qryCRCODIGO.Value := Dados.Numerador('CRECEBER', 'CODIGO', 'N', '', '');
      qryCRDATA.Value := date;
      qryCRFKCLIENTE.Value := idCliente;
      qryCRDOC.Value := IntToStr(idVenda) + '/' + IntToStr(i);
      qryCRVALOR.AsString := formatfloat('0.00',
        SimpleRoundTo(vValor / strtoint(edtParcela.Text), -2));
      qryCRDTVENCIMENTO.Value := date + (i * strtoint(edtIntervalo.Text));

      qryCRHISTORICO.Value := 'REF.VENDA Nº' + IntToStr(idVenda);
      qryCRDESCONTO.Value := 0;
      qryCRJUROS.Value := 0;
      qryCRVRECEBIDO.Value := 0;
      qryCRVL_RESTANTE.Value := vValor;
      qryCRFPG_VENDA.Value := idForma;;
      qryCRID_VENDEDOR.Value := idvendedor;
      qryCRSITUACAO.Value := 'A';
      qryCRREMESSA.Value := 'N';
      qryCRREMESSA_REENVIAR.Value := 'S';

      if eOpcao = 'Q' then
      begin
        qryCRTIPO.Value := 'C';
        qryCRCARTAO.Value := eOpcao;
      end;

      if eOpcao = 'F' then
      begin
        qryCRTIPO.Value := 'T';
        qryCRCARTAO.Value := eOpcao;
      end;

      if eOpcao = 'C' then
      begin

        qryCRTIPO.Value := 'R';
        qryCRCARTAO.Value := eOpcao;
      end;

      if eOpcao = 'E' then
      begin
        qryCRTIPO.Value := 'R';
        qryCRCARTAO.Value := eOpcao;
      end;

      qryCRFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryCRFK_VENDA.Value := idVenda;
      qryCR.Post;
      vSoma := vSoma + qryCRVALOR.AsFloat;
    end;

    qryCR.Refresh;
    qryCR.First;
    vDif := vValor - vSoma;
    if vDif <> 0 then
    begin
      qryCR.Edit;
      qryCRVALOR.Value := SimpleRoundTo(qryCRVALOR.Value + vDif, -2);
      qryCR.Post;
      Dados.Conexao.CommitRetaining;
    end;

  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmCRParcela.btnVoltarClick(Sender: TObject);
begin
  PodeFechar := true;
  Dados.vChamaImpressao := false;
  Close;
end;

procedure TfrmCRParcela.Button1Click(Sender: TObject);
begin

  qryCarne.Close;
  qryCarne.Params[0].Value := idVenda;
  qryCarne.Params[1].Value := eOpcao;
  qryCarne.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\Carne.fr3');
  frxReport.ShowReport;
end;

procedure TfrmCRParcela.Button2Click(Sender: TObject);
begin

  qryCarne.Close;
  qryCarne.Params[0].Value := idVenda;
  qryCarne.Params[1].Value := eOpcao;
  qryCarne.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\CarneBobina.fr3');
  frxReport.ShowReport;
end;

procedure TfrmCRParcela.Button3Click(Sender: TObject);
begin
  Panel3.Visible := false;
end;

procedure TfrmCRParcela.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCRParcela.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCRParcela.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCRParcela.edtParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmCRParcela.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmCRParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BtnGerarClick(self);
  if Key = vk_f3 then
    BtnExcluirClick(self);
  if Key = vk_f4 then
    btnVoltarClick(self);
  if Key = vk_f5 then
    btnBoletoClick(self);
  if Key = vk_f6 then
    btnCarneClick(self);
  if Key = vk_f7 then
    btnAvancarClick(self);

end;

procedure TfrmCRParcela.FormShow(Sender: TObject);
begin

  qryCR.Close;
  qryCR.Params[0].Value := idVenda;
  qryCR.Params[1].Value := eOpcao;
  qryCR.Open;

  BtnGerar.Click;

end;

procedure TfrmCRParcela.qryCRAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCRParcela.qryCRBeforePost(DataSet: TDataSet);
begin
  qryCRVL_RESTANTE.Value := qryCRVALOR.Value;
end;

end.
