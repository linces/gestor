unit uEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, aCBRUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.ExtDlgs, DBGridEh, DBCtrlsEh, DBLookupEh, ACBrBase, ACBrEnterTab,
  ACBrValidador, ACBrSocket, ACBrCEP;

type
  TfrmEmpresa = class(TForm)
    Panel4: TPanel;
    OpenPicture: TOpenPictureDialog;
    dsEmpresa: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBImage1: TDBImage;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    TabSheet2: TTabSheet;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    cbCidade: TDBLookupComboboxEh;
    dsCidade: TDataSource;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Button1: TButton;
    Label34: TLabel;
    DBEdit31: TDBEdit;
    Label35: TLabel;
    DBEdit32: TDBEdit;
    Label36: TLabel;
    DBEdit33: TDBEdit;
    Label37: TLabel;
    DBEdit34: TDBEdit;
    cbPessoa: TDBComboBox;
    Label39: TLabel;
    TabSheet4: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    TabSheet5: TTabSheet;
    DBMemoEh2: TDBMemoEh;
    Label22: TLabel;
    DBEdit35: TDBEdit;
    ACBrValidador1: TACBrValidador;
    Label38: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    Label40: TLabel;
    cbRegime: TDBComboBoxEh;
    DBEdit16: TDBEdit;
    Label33: TLabel;
    BitBtn2: TBitBtn;
    ACBrCEP1: TACBrCEP;
    DBEdit39: TDBEdit;
    Label43: TLabel;
    DBEdit40: TDBEdit;
    Label44: TLabel;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    GroupBox5: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    TabSheet6: TTabSheet;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    qryEmpresa: TFDQuery;
    qryEmpresaFANTASIA: TStringField;
    qryEmpresaRAZAO: TStringField;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaIE: TStringField;
    qryEmpresaIM: TStringField;
    qryEmpresaENDERECO: TStringField;
    qryEmpresaNUMERO: TStringField;
    qryEmpresaCOMPLEMENTO: TStringField;
    qryEmpresaBAIRRO: TStringField;
    qryEmpresaCIDADE: TStringField;
    qryEmpresaUF: TStringField;
    qryEmpresaCEP: TStringField;
    qryEmpresaFONE: TStringField;
    qryEmpresaFAX: TStringField;
    qryEmpresaSITE: TStringField;
    qryEmpresaLOGOMARCA: TBlobField;
    qryEmpresaID_PLANO_TRANSFERENCIA_C: TIntegerField;
    qryEmpresaID_PLANO_TRANSFERENCIA_D: TIntegerField;
    qryEmpresaID_CAIXA_GERAL: TIntegerField;
    qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO: TStringField;
    qryEmpresaID_CIDADE: TIntegerField;
    qryEmpresaCRT: TSmallintField;
    qryEmpresaID_UF: TSmallintField;
    qryEmpresaID_PLANO_VENDA: TIntegerField;
    qryEmpresaOBSFISCO: TMemoField;
    qryEmpresaCFOP: TStringField;
    qryEmpresaCSOSN: TStringField;
    qryEmpresaCST_ICMS: TStringField;
    qryEmpresaCST_ENTRADA: TStringField;
    qryEmpresaCST_SAIDA: TStringField;
    qryEmpresaCST_IPI: TStringField;
    qryEmpresaTIPO: TStringField;
    qryEmpresaFUNDACAO: TDateField;
    qryEmpresaUSU_CAD: TSmallintField;
    qryEmpresaUSU_ATU: TSmallintField;
    qryEmpresaNSERIE: TStringField;
    qryEmpresaCSENHA: TStringField;
    qryEmpresaIMP_F5: TStringField;
    qryEmpresaIMP_F6: TStringField;
    qryEmpresaMOSTRA_RESUMO_CAIXA: TStringField;
    qryEmpresaID_PLA_CONTA_FICHA_CLI: TIntegerField;
    qryEmpresaID_PLANO_CONTA_RETIRADA: TIntegerField;
    qryEmpresaUSA_PDV: TStringField;
    qryEmpresaRECIBO_VIAS: TStringField;
    qryEmpresaID_PLANO_TAXA_CARTAO: TIntegerField;
    qryEmpresaOBS_CARNE: TMemoField;
    qryEmpresaCAIXA_UNICO: TStringField;
    qryEmpresaCAIXA_RAPIDO: TStringField;
    qryEmpresaEMPRESA_PADRAO: TSmallintField;
    qryEmpresaID_PLANO_CONTA_DEVOLUCAO: TIntegerField;
    qryEmpresaN_INICIAL_NFE: TIntegerField;
    qryEmpresaN_INICIAL_NFCE: TIntegerField;
    qryEmpresaCHECA_ESTOQUE_FISCAL: TStringField;
    qryEmpresaNTERM: TStringField;
    qryEmpresaDESCONTO_PROD_PROMO: TStringField;
    qryEmpresaENVIAR_EMAIL_NFE: TStringField;
    qryEmpresaFILTRAR_EMPRESA_LOGIN: TStringField;
    qryEmpresaEMAIL: TStringField;
    qryEmpresaLANCAR_CARTAO_CREDITO: TStringField;
    qryEmpresaTRANSPORTADORA: TStringField;
    qryEmpresaAUTOPECAS: TStringField;
    qryEmpresaEMAIL_CONTADOR: TStringField;
    qryEmpresaTABELA_PRECO: TStringField;
    qryEmpresaINFORMAR_GTIN: TStringField;
    qryEmpresaATUALIZA_PR_VENDA: TStringField;
    qryEmpresaEXCLUI_PDV: TStringField;
    qryEmpresaRECOLHE_FCP: TStringField;
    qryEmpresaVENDA_SEMENTE: TStringField;
    qryEmpresaVIRTUAL_ID_UF: TIntegerField;
    qryEmpresaVIRTUAL_UF: TStringField;
    qryEmpresaULTIMONSU: TStringField;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaALIQ_ICMS: TFMTBCDField;
    qryEmpresaALIQ_PIS: TFMTBCDField;
    qryEmpresaALIQ_COF: TFMTBCDField;
    qryEmpresaALIQ_IPI: TFMTBCDField;
    qryEmpresaLIMITE_DIARIO: TFMTBCDField;
    qryEmpresaPRAZO_MAXIMO: TSmallintField;
    qryEmpresaDIFAL_ORIGEM: TFMTBCDField;
    qryEmpresaDIFAL_DESTINO: TFMTBCDField;
    qryEmpresaULTIMO_PEDIDO: TIntegerField;
    qryEmpresaTAXA_VENDA_PRAZO: TFMTBCDField;
    qryEmpresaDATA_CADASTRO: TStringField;
    qryEmpresaDATA_VALIDADE: TStringField;
    qryEmpresaFLAG: TStringField;
    qryEmpresaCHECA: TStringField;
    qryEmpresaTIPO_CONTRATO: TIntegerField;
    qryEmpresaBLOQUEAR_PRECO: TStringField;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    qryEmpresaEXIBE_RESUMO_CAIXA: TStringField;
    DBCheckBox19: TDBCheckBox;
    qryEmpresaEXIBE_F3: TStringField;
    qryEmpresaEXIBE_F4: TStringField;
    qryEmpresaRESTAURANTE: TStringField;
    qryEmpresaPESQUISA_REFERENCIA: TStringField;
    DBCheckBox23: TDBCheckBox;
    qryEmpresaCARENCIA_JUROS: TIntegerField;
    qryEmpresaRESPONSAVEL_TECNICO: TStringField;
    Label41: TLabel;
    DBEdit38: TDBEdit;
    qryEmpresaID_PLANO_COMPRA: TIntegerField;
    DBCheckBox24: TDBCheckBox;
    qryEmpresaLER_PESO: TStringField;
    qryEmpresaFARMACIA: TStringField;
    qryEmpresaTIPO_EMPRESA: TIntegerField;
    qryEmpresaQTD_MESAS: TSmallintField;
    qryEmpresaTIPO_JUROS: TStringField;
    qryEmpresaJUROS_DIA: TFMTBCDField;
    qryEmpresaJUROS_MES: TFMTBCDField;
    qryEmpresaLOJA_ROUPA: TStringField;
    DBCheckBox27: TDBCheckBox;
    qryEmpresaCHECA_LIMITE: TStringField;
    qryEmpresaEMITE_ECF: TStringField;
    qryEmpresaDESCONTO_MAXIMO: TFMTBCDField;
    DBEdit43: TDBEdit;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit44: TDBEdit;
    Label49: TLabel;
    DBEdit45: TDBEdit;
    qryEmpresaRESPONSAVEL_EMPRESA: TStringField;
    qryEmpresaPAGAMENTO_DINHEIRO: TStringField;
    qryEmpresaHABILITA_DESCONTO_PDV: TStringField;
    DBCheckBox29: TDBCheckBox;
    qryEmpresaPUXA_CFOP_PRODUTO: TStringField;
    DBCheckBox30: TDBCheckBox;
    DBEdit46: TDBEdit;
    Label50: TLabel;
    qryEmpresaUSA_BLUETOOTH_RESTA: TStringField;
    qryEmpresaLANCAR_CARTAO_CR: TStringField;
    qryEmpresaCFOP_EXTERNO: TStringField;
    BitBtn1: TBitBtn;
    TabSheet8: TTabSheet;
    DBMemoEh3: TDBMemoEh;
    qryEmpresaCNAE: TStringField;
    qryEmpresaOBSNFCE: TMemoField;
    DBEdit48: TDBEdit;
    Label52: TLabel;
    cbPais: TDBLookupComboboxEh;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit49: TDBEdit;
    Label55: TLabel;
    qryEmpresaCODIGO_PAIS: TIntegerField;
    dsPaises: TDataSource;
    qryEmpresaMULTI_IDIOMA: TStringField;
    qryEmpresaHABILITA_ACRESCIMO: TStringField;
    DBCheckBox33: TDBCheckBox;
    DBEdit50: TDBEdit;
    Label56: TLabel;
    qryEmpresaCOD_FPG_DINHEIRO: TIntegerField;
    qryEmpresaCSOSN_EXTERNO: TStringField;
    qryEmpresaCST_EXTERNO: TStringField;
    qryEmpresaALIQ_ICMS_EXTERNO: TFMTBCDField;
    GroupBox1: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    qryEmpresaSEGUNDA_VIA_NFCE: TStringField;
    DBCheckBox34: TDBCheckBox;
    Label51: TLabel;
    DBEdit47: TDBEdit;
    qryEmpresaID_PLANO_BOLETO: TIntegerField;
    qryEmpresaREPLICAR_DADOS: TStringField;
    DBCheckBox28: TDBCheckBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    qryEmpresaCFOP_ENTRADA_PADRAO: TStringField;
    qryEmpresaPUXAR_CFOP_ENTRADA: TStringField;
    qryEmpresaCFOP_ENTRADA_PADRO_E: TStringField;
    DBCheckBox2: TDBCheckBox;
    qryEmpresaAUTO_CADASTRO_PRODUTO: TStringField;
    qryEmpresaNFCE_PRODUTO_SUBSTITUTO: TStringField;
    DBCheckBox3: TDBCheckBox;
    qryEmpresaEXIBE_ESTOQUE_FISCAL: TStringField;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    qryEmpresaBAIXAR_ESTOQUE_NFE: TStringField;
    DBCheckBox16: TDBCheckBox;
    qryEmpresaOCULTAR_SALDO_ANTERIOR: TStringField;
    Label42: TLabel;
    DBEdit30: TDBEdit;
    qryEmpresaNFE_SERIE: TIntegerField;
    Label57: TLabel;
    DBEdit51: TDBEdit;
    qryEmpresaLUCRO_PADRAO: TFMTBCDField;
    qryEmpresaTRANSMITIR_CARTAO_AUTO: TStringField;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    qryEmpresaSERVIDOR_SMTP_PROPRIO: TStringField;
    GroupBox4: TGroupBox;
    Label63: TLabel;
    DBEdit57: TDBEdit;
    qryEmpresaALIQUOTA_SIMPLES: TFMTBCDField;
    qryEmpresaMENSAGEM_COBRANCA: TMemoField;
    TabSheet9: TTabSheet;
    DBMemoEh4: TDBMemoEh;
    Label62: TLabel;
    DBEdit56: TDBEdit;
    qryEmpresaID_PLANO_ABERTURA: TIntegerField;
    qryEmpresaPRE_VISUALIZAR_IMPRESSAO: TStringField;
    qryEmpresaBAIXAR_ESTOQUE_COMPOSICAO: TStringField;
    qryEmpresaPESQUISA_POR_PARTE: TStringField;
    DBCheckBox20: TDBCheckBox;
    qryEmpresaUSA_TEF: TStringField;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    qryEmpresaUSA_CREDITO_SIMPLES: TStringField;
    DBCheckBox32: TDBCheckBox;
    qryEmpresaRATEAR_FRETE: TStringField;
    DBCheckBox35: TDBCheckBox;
    qryEmpresaDESCONTO_ITEM_PDV: TStringField;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    qryEmpresaBLOQUEAR_CPF: TStringField;
    qryEmpresaBLOQUEAR_PERSONALIZACAO: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBImage1Click(Sender: TObject);
    procedure cbCidadeExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCidadeEnter(Sender: TObject);
    procedure cbCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure qryEmpresaNewRecord(DataSet: TDataSet);
    procedure qryEmpresaAfterPost(DataSet: TDataSet);
    procedure qryEmpresaBeforePost(DataSet: TDataSet);
    procedure qryEmpresaBeforeEdit(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBMemoEh4Enter(Sender: TObject);
    procedure DBMemoEh4Exit(Sender: TObject);
    procedure qryEmpresaCNAEValidate(Sender: TField);
  private
    { Private declarations }
  public
    Tela: string;
    Cnpj, inscricao: string;
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses Udados, uRotinasComuns;

procedure TfrmEmpresa.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEmpresa.Button1Click(Sender: TObject);
begin
  qryEmpresaLOGOMARCA.Clear;
  DBImage1.Picture := nil;
end;

procedure TfrmEmpresa.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn2.Click;
end;

procedure TfrmEmpresa.DBEdit6Exit(Sender: TObject);
begin
  if (qryEmpresa.State in dsEditModes) then
    if trim(DBEdit6.EditText) = '' then
    begin
      qryEmpresaFANTASIA.Value := qryEmpresaRAZAO.Value;
    end;
end;

procedure TfrmEmpresa.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn1Click(SELF);
end;

procedure TfrmEmpresa.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmEmpresa.DBImage1Click(Sender: TObject);
begin
  OpenPicture.Execute;
  if OpenPicture.FileName <> '' then
  begin
    qryEmpresaLOGOMARCA.LoadFromFile(OpenPicture.FileName);
  end;

end;

procedure TfrmEmpresa.DBMemoEh4Enter(Sender: TObject);
begin
  KeyPreview := false;
end;

procedure TfrmEmpresa.DBMemoEh4Exit(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TfrmEmpresa.cbCidadeEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmEmpresa.cbCidadeExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
  if (qryEmpresa.State in dsEditModes) then
    qryEmpresaCIDADE.Value := dados.qryCidadeDESCRICAO.Value;
  qryEmpresaID_UF.Value := dados.qryCidadeCODUF.Value;
  qryEmpresaUF.Value := dados.qryCidadeUF.Value;
end;

procedure TfrmEmpresa.cbCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(SELF.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmEmpresa.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := SELF;
  dados.GetComponentes;
end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  dados.qryCidade.close;
  dados.qryCidade.Open;
  dados.qryPaises.close;
  dados.qryPaises.Open;
end;

procedure TfrmEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then
    btnGravarClick(SELF);
  if Key = VK_escape then
    btnCancelar.Click;

end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  cbPessoa.SetFocus;
end;

procedure TfrmEmpresa.qryEmpresaAfterPost(DataSet: TDataSet);

begin
  dados.Conexao.CommitRetaining;

  dados.qryEmpresa.close;
  dados.qryEmpresa.Open;
  dados.qryEmpresa.Locate('CODIGO', dados.idempresa, []);
end;

procedure TfrmEmpresa.qryEmpresaBeforeEdit(DataSet: TDataSet);
begin
  Cnpj := qryEmpresaCNPJ.Value;
  inscricao := qryEmpresaIE.Value;
end;

procedure TfrmEmpresa.qryEmpresaBeforePost(DataSet: TDataSet);
begin

  if qryEmpresaUSA_TEF.Value = 'S' then
    qryEmpresaTRANSMITIR_CARTAO_AUTO.Value := 'S';

  if qryEmpresa.State = dsEdit then
  begin
    qryEmpresaCNPJ.Value := TiraPontos(qryEmpresaCNPJ.Value);

    if Cnpj <> qryEmpresaCNPJ.Value then // verifica se alterou cnpj e bloquei
      qryEmpresaDATA_VALIDADE.Value := dados.Crypt('C', '01/01/1900');

    if inscricao <> qryEmpresaIE.Value then // verifica se alterou ie e bloqueia
      qryEmpresaDATA_VALIDADE.Value := dados.Crypt('C', '01/01/1900');
  end;
end;

procedure TfrmEmpresa.qryEmpresaCNAEValidate(Sender: TField);
begin
  if length(qryEmpresaCNAE.AsString) <> 7 then
    raise Exception.Create('Tamanho do CNAE inválido!');
end;

procedure TfrmEmpresa.qryEmpresaNewRecord(DataSet: TDataSet);
begin
  qryEmpresaNSERIE.Value := '';
  qryEmpresaCSENHA.Value := '';
  qryEmpresaDATA_CADASTRO.AsString := dados.Crypt('C', datetostr(Date));
  qryEmpresaDATA_VALIDADE.AsString := dados.Crypt('C', '01/01/1900');
  qryEmpresaCHECA.AsString := dados.Crypt('C', 'DEMONSTRACAO');
  qryEmpresaFUNDACAO.Value := NOW;
  qryEmpresaUSU_CAD.Value := 0;
  qryEmpresaUSU_ATU.Value := 0;
  qryEmpresaID_PLANO_ABERTURA.Value := 14;
  qryEmpresaID_PLANO_TRANSFERENCIA_C.Value := 3;
  qryEmpresaID_PLANO_TRANSFERENCIA_D.Value := 4;
  qryEmpresaID_CAIXA_GERAL.Value := 1;
  qryEmpresaBLOQUEAR_ESTOQUE_NEGATIVO.Value := 'S';
  qryEmpresaIE.Value := '';
  qryEmpresaRESPONSAVEL_TECNICO.Value := 'S';
  qryEmpresaMULTI_IDIOMA.Value := 'N';
  qryEmpresaSEGUNDA_VIA_NFCE.Value := 'N';
  qryEmpresaREPLICAR_DADOS.Value := 'N';
  qryEmpresaHABILITA_ACRESCIMO.Value := 'N';
  qryEmpresaEXIBE_F3.Value := 'S';
  qryEmpresaEXIBE_F4.Value := 'S';
  qryEmpresaIMP_F5.Value := 'N';
  qryEmpresaIMP_F6.Value := 'N';
  qryEmpresaDIFAL_ORIGEM.Value := 0;
  qryEmpresaDESCONTO_MAXIMO.Value := 0;
  qryEmpresaDIFAL_DESTINO.Value := 100;
  qryEmpresaRECIBO_VIAS.Value := 'S';
  qryEmpresaCRT.Value := 1;
  qryEmpresaCOD_FPG_DINHEIRO.Value := 1;
  qryEmpresaID_PLANO_VENDA.Value := 2;
  qryEmpresaCODIGO_PAIS.Value := 1058;
  qryEmpresaCFOP.Value := '5102';
  qryEmpresaCFOP_EXTERNO.Value := '6102';
  qryEmpresaCSOSN.Value := '102';
  qryEmpresaCSOSN_EXTERNO.Value := '102';
  qryEmpresaCST_ICMS.Value := '041';
  qryEmpresaCST_EXTERNO.Value := '041';
  qryEmpresaALIQ_ICMS_EXTERNO.Value := 0;
  qryEmpresaCST_ENTRADA.Value := '07';
  qryEmpresaCST_SAIDA.Value := '07';
  qryEmpresaCST_IPI.Value := '53';
  qryEmpresaALIQ_PIS.Value := 0;
  qryEmpresaALIQ_COF.Value := 0;
  qryEmpresaALIQ_IPI.Value := 0;
  qryEmpresaALIQ_ICMS.Value := 0;
  qryEmpresaNSERIE.Value := dados.Crypt('C', 'DEMONSTRACAO');
  qryEmpresaNTERM.Value := dados.Crypt('C', '30');
  qryEmpresaMOSTRA_RESUMO_CAIXA.Value := 'N';
  qryEmpresaLIMITE_DIARIO.Value := 1;
  qryEmpresaPRAZO_MAXIMO.Value := 1;
  qryEmpresaUSA_PDV.Value := 'S';
  qryEmpresaRECIBO_VIAS.Value := '1';
  qryEmpresaOBS_CARNE.Value := 'OBRIGADO PELA PREFERÊNCIA!';
  qryEmpresaCAIXA_UNICO.Value := 'N';
  qryEmpresaCHECA_ESTOQUE_FISCAL.Value := 'S';
  qryEmpresaBLOQUEAR_PRECO.Value := 'N';
  qryEmpresaRECOLHE_FCP.Value := 'N';
  qryEmpresaN_INICIAL_NFCE.Value := 1;
  qryEmpresaN_INICIAL_NFE.Value := 1;
  qryEmpresaNFE_SERIE.Value := 1;
  qryEmpresaULTIMONSU.Value := '0';
  qryEmpresaID_PLANO_CONTA_DEVOLUCAO.Value := 9;
  qryEmpresaID_PLANO_COMPRA.Value := 15;
  qryEmpresaID_PLANO_BOLETO.Value := 16;
  qryEmpresaCARENCIA_JUROS.Value := 0;
  qryEmpresaJUROS_DIA.Value := 0;
  qryEmpresaLUCRO_PADRAO.Value := 0;
  qryEmpresaID_PLA_CONTA_FICHA_CLI.Value := 10;
  qryEmpresaID_PLANO_CONTA_RETIRADA.Value := 11;
  qryEmpresaID_PLANO_TAXA_CARTAO.Value := 8;
  qryEmpresaEMPRESA_PADRAO.Value := 1;
  qryEmpresaCAIXA_RAPIDO.Value := 'N';
  qryEmpresaENVIAR_EMAIL_NFE.Value := 'N';
  qryEmpresaLANCAR_CARTAO_CREDITO.Value := 'N';
  qryEmpresaTABELA_PRECO.Value := 'N';
  qryEmpresaEXCLUI_PDV.Value := 'N';
  qryEmpresaDESCONTO_PROD_PROMO.Value := 'N';
  qryEmpresaRECIBO_VIAS.Value := 'N';
  qryEmpresaTRANSPORTADORA.Value := 'N';
  qryEmpresaVENDA_SEMENTE.Value := 'N';
  qryEmpresaINFORMAR_GTIN.Value := 'N';
  qryEmpresaPESQUISA_REFERENCIA.Value := 'N';
  qryEmpresaBLOQUEAR_PRECO.Value := 'N';
  qryEmpresaRESTAURANTE.Value := 'N';
  qryEmpresaFARMACIA.Value := 'N';
  qryEmpresaLER_PESO.Value := 'N';
  qryEmpresaLANCAR_CARTAO_CR.Value := 'N';
  qryEmpresaEXIBE_RESUMO_CAIXA.Value := 'N';
  qryEmpresaPUXA_CFOP_PRODUTO.Value := 'N';
  qryEmpresaHABILITA_DESCONTO_PDV.Value := 'N';
  qryEmpresaCHECA_LIMITE.Value := 'N';
  qryEmpresaPAGAMENTO_DINHEIRO.Value := 'S';
  qryEmpresaLOJA_ROUPA.Value := 'N';
  qryEmpresaRESPONSAVEL_TECNICO.Value := 'N';

end;

procedure TfrmEmpresa.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      qryEmpresaENDERECO.Value := UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      qryEmpresaBAIRRO.Value := UpperCase(Bairro);
      qryEmpresaCIDADE.Value := UpperCase(Municipio);
      qryEmpresaID_CIDADE.AsString := IBGE_Municipio;
      qryEmpresaUF.AsString := UpperCase(UF);
    end;
  end;
end;

procedure TfrmEmpresa.BitBtn1Click(Sender: TObject);
begin

  if qryEmpresaTIPO.Value = 'JURÍDICA' then
  begin
    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := TiraPontos(DBEdit9.EditText);
    if not ACBrValidador1.Validar then
      raise Exception.Create(ACBrValidador1.MsgErro);
  end;

  if qryEmpresaTIPO.Value = 'JURÍDICA' then
  begin

    try

      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(TiraPontos(DBEdit9.text));
      qryEmpresaRAZAO.Value := UpperCase(dmrotinas.Pessoa.razao);
      qryEmpresaFANTASIA.Value := UpperCase(dmrotinas.Pessoa.fantasia);
      qryEmpresaENDERECO.Value := UpperCase(dmrotinas.Pessoa.Logradouro);
      qryEmpresaNUMERO.Value := UpperCase(dmrotinas.Pessoa.numero);
      qryEmpresaBAIRRO.Value := UpperCase(dmrotinas.Pessoa.Bairro);
      qryEmpresaCIDADE.Value := UpperCase(dmrotinas.Pessoa.Municipio);
      qryEmpresaUF.Value := UpperCase(dmrotinas.Pessoa.UF);
      qryEmpresaCEP.Value := UpperCase(TiraPontos(dmrotinas.Pessoa.cep));
      qryEmpresaEMAIL.Value := UpperCase(dmrotinas.Pessoa.email);
      qryEmpresaID_CIDADE.Value := dados.BuscaCodigoIbge(qryEmpresaCIDADE.Value,
        qryEmpresaUF.Value);
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;
  end
  else
    ShowMessage('Não é possivel buscar informações de pessoas físicas!');
end;

procedure TfrmEmpresa.BitBtn2Click(Sender: TObject);
begin
  try
    ACBrCEP1.BuscarPorCEP(DBEdit5.EditText);
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin

  if Application.messageBox('Deseja Sair da Tela?', 'Confirmação', mb_YesNo) = mrYes
  then
  begin
    if qryEmpresa.State in [dsInsert, dsEdit] then
      qryEmpresa.Cancel;

    close;
  end;
end;

procedure TfrmEmpresa.btnGravarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  cbPessoa.SetFocus;
  if qryEmpresa.State in [dsInsert, dsEdit] then
  begin
    DBEdit9.SetFocus;
    if trim(qryEmpresaRAZAO.Value) = '' then
    begin
      ShowMessage('Digite a Razão!');
      PageControl1.ActivePageIndex := 0;
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(qryEmpresaFANTASIA.Value) = '' then
    begin
      ShowMessage('Digite o Nome Fantasia!');
      PageControl1.ActivePageIndex := 0;
      DBEdit6.SetFocus;
      exit;
    end;

    if trim(qryEmpresaENDERECO.Value) = '' then
    begin
      PageControl1.ActivePageIndex := 0;
      ShowMessage('Digite o Endereço!');
      DBEdit3.SetFocus;
      exit;
    end;

    if trim(qryEmpresaNUMERO.Value) = '' then
    begin
      ShowMessage('Digite o Número!');
      PageControl1.ActivePageIndex := 0;
      DBEdit14.SetFocus;
      exit;
    end;

    if trim(qryEmpresaBAIRRO.Value) = '' then
    begin
      ShowMessage('Digite o Bairro!');
      PageControl1.ActivePageIndex := 0;
      DBEdit4.SetFocus;
      exit;
    end;

    if trim(qryEmpresaCIDADE.Value) = '' then
    begin
      ShowMessage('Digite o Cidade!');
      PageControl1.ActivePageIndex := 0;
      cbCidade.SetFocus;
      exit;
    end;

    if trim(qryEmpresaCNPJ.Value) = '' then
    begin
      ShowMessage('Digite o CNPJ!');
      PageControl1.ActivePageIndex := 0;
      DBEdit9.SetFocus;
      exit;
    end;

    if trim(qryEmpresaFONE.Value) = '' then
    begin
      ShowMessage('Digite o Telefone!');
      PageControl1.ActivePageIndex := 0;
      DBEdit10.SetFocus;
      exit;
    end;

    if trim(qryEmpresaCNAE.Value) = '' then
    begin
      ShowMessage('Digite o CNAE!');
      PageControl1.ActivePageIndex := 0;
      DBEdit48.SetFocus;
      exit;
    end;

    if qryEmpresaTIPO.Value = 'FÍSICA' then
    begin
      ACBrValidador1.TipoDocto := docCPF;
      ACBrValidador1.Documento := qryEmpresaCNPJ.Value;
      if not ACBrValidador1.Validar then
        raise Exception.Create(ACBrValidador1.MsgErro);
    end;

    if qryEmpresaTIPO.Value = 'JURÍDICA' then
    begin
      if (trim(qryEmpresaCNPJ.AsString) <> '11111111111111') then
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        ACBrValidador1.Documento := qryEmpresaCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if qryEmpresaTIPO.Value = 'JURÍDICA' then
    begin
      if (trim(qryEmpresaIE.AsString) <> '') and
        (trim(qryEmpresaIE.AsString) <> '111111111111') then
      begin
        ACBrValidador1.TipoDocto := docInscEst;
        ACBrValidador1.Complemento := qryEmpresaUF.Value;
        ACBrValidador1.Documento := qryEmpresaIE.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    qryEmpresa.Post;
    dados.Conexao.CommitRetaining;
    close;
  end;
end;

end.
