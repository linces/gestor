unit uConsCTe_RodoViario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Math, System.zip, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, pcteConversaoCTe,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversao, pcnConversaoNFe, acbrUtil, ACBrDFeSSL, blcksock,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF,
  ACBrBase, ACBrMail, ACBrDFe, ACBrNFe, ACBrNFeDANFeESCPOS, ACBrPosPrinter,
  ACBrEnterTab, ACBrNFeDANFEClass, ACBrDANFCeFortesFrA4, ACBrNFeDANFeRLClass,
  ACBrCTeDACTEClass, ACBrCTeDACTeRLClass,
  ACBrCTe, frxExportBaseDialog, ACBrCTeDACTEFR, ACBrDFeReport, frxExportXLS,
  JvExComCtrls, JvComCtrls;

type
  TfrmConsCTe_Rodo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnInutiliza: TSpeedButton;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    LblSaldo: TLabel;
    btnRecuperar: TSpeedButton;
    btnImprimir: TSpeedButton;
    OpenDialog1: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryCTE_M: TFDQuery;
    dsCTE_M: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    qryCTE_D: TFDQuery;
    dsCTeD: TDataSource;
    qryXML: TFDQuery;
    qryXMLNUMERO: TIntegerField;
    qryXMLDATA_EMISSAO: TDateField;
    qryXMLCHAVE: TStringField;
    qryXMLSITUACAO: TStringField;
    qryXMLSERIE: TStringField;
    qryXMLXML: TMemoField;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    dsEmpresa: TDataSource;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel11: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    dsCorrecao: TDataSource;
    qryCorrecao: TFDQuery;
    BtnCCe: TSpeedButton;
    PagUtilidade: TPageControl;
    TabInutilizar: TTabSheet;
    pnInutiliza: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtAno: TEdit;
    edtModelo: TEdit;
    edtSerie: TEdit;
    edtInicial: TEdit;
    edtFinal: TEdit;
    edtJustificativa: TEdit;
    Panel5: TPanel;
    btnInutilizar: TSpeedButton;
    btnFechar: TSpeedButton;
    TabCarta: TTabSheet;
    qryInutiliza: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    ACBrMail1: TACBrMail;
    qryRelatorio: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    btnRelatorio: TSpeedButton;
    qryCTE_MCODIGO: TIntegerField;
    qryCTE_MFKEMPRESA: TIntegerField;
    qryCTE_MNUMERO: TIntegerField;
    qryCTE_MCHAVE: TStringField;
    qryCTE_MCFOP: TIntegerField;
    qryCTE_MMODELO: TIntegerField;
    qryCTE_MSERIE: TIntegerField;
    qryCTE_MCODMUNENVIO: TIntegerField;
    qryCTE_MMUNICIPIOENVIO: TStringField;
    qryCTE_MUFENVIO: TStringField;
    qryCTE_MTIPOSERVICO: TIntegerField;
    qryCTE_MCODMUNINI: TIntegerField;
    qryCTE_MMUNICIPIOINI: TStringField;
    qryCTE_MUFINI: TStringField;
    qryCTE_MCODMUNFIM: TIntegerField;
    qryCTE_MMINICIPIOFIM: TStringField;
    qryCTE_MUFFIM: TStringField;
    qryCTE_MDESCRICAOSERVICO: TStringField;
    qryCTE_MRESPSEG: TIntegerField;
    qryCTE_MXSEG: TStringField;
    qryCTE_MNAPOLICE: TStringField;
    qryCTE_MTAF: TStringField;
    qryCTE_MNROREGESTADUAL: TStringField;
    qryCTE_MTIPO: TStringField;
    qryCTE_MSITUACAO: TStringField;
    qryCTE_MFKTOMADOR: TIntegerField;
    qryCTE_MFKTRANSPORTADOR: TIntegerField;
    qryCTE_MPROTOCOLO: TStringField;
    qryCTE_MXML: TMemoField;
    qryCTE_MDATA: TDateField;
    qryCTE_MHORA: TTimeField;
    qryCTE_MFINALIDADE: TIntegerField;
    qryCTE_MDOCUMENTO: TStringField;
    qryCTE_MDATA_ENTREGA: TDateField;
    qryCTE_MTOMADOR: TStringField;
    qryCTE_MFK_DESTINATARIO: TIntegerField;
    qryCTE_MFK_VEICULO: TStringField;
    qryCTE_DCODIGO: TIntegerField;
    qryCTE_DFK_CTE_MASTER: TIntegerField;
    qryCTE_DNUMERO: TIntegerField;
    qryCTE_DCHAVE: TStringField;
    qryCTE_DUNIDADE: TStringField;
    qryCTE_DFK_DESTINATARIO: TIntegerField;
    qryCTE_DDESCRICAO: TStringField;
    qryCTE_DCODMUN: TIntegerField;
    qryCTE_DMUNICIPIO: TStringField;
    qryCTE_DCNPJ: TStringField;
    qryCTE_DUF: TStringField;
    qryCorrecaoCODIGO: TIntegerField;
    qryCorrecaoFK_CTE: TIntegerField;
    qryCorrecaoSEQUENCIA: TIntegerField;
    qryCorrecaoFK_EMPRESA: TIntegerField;
    qryCorrecaoFK_USUARIO: TIntegerField;
    qryCorrecaoDATA: TDateField;
    qryCorrecaoCORRECAO: TMemoField;
    qryCTE_MTTOTAL: TAggregateField;
    qryCTE_MTOTAL: TFMTBCDField;
    qryCTE_MRECEBIDO: TFMTBCDField;
    qryCTE_MVPIS: TFMTBCDField;
    qryCTE_MVCOFINS: TFMTBCDField;
    qryCTE_MVINSS: TFMTBCDField;
    qryCTE_MVIR: TFMTBCDField;
    qryCTE_MVCLSS: TFMTBCDField;
    qryCTE_MVTOTTIRB: TFMTBCDField;
    qryCTE_MQTD: TFMTBCDField;
    qryCTE_MOBS_FISCO: TMemoField;
    qryCTE_MOBS_CONTRIBUINTE: TMemoField;
    qryCTE_MVALOR_SERVICO: TFMTBCDField;
    qryCTE_MVALOR_CARGA: TFMTBCDField;
    qryCTE_MCST_ICMS: TStringField;
    qryCTE_MALIQUOTA_ICMS: TFMTBCDField;
    qryCTE_MBASE_ICMS: TFMTBCDField;
    qryCTE_MVALOR_ICMS: TFMTBCDField;
    qryCTE_MOUTROS_TRIBUTOS: TFMTBCDField;
    qryCTE_MMETRAGEM: TStringField;
    qryCTE_MFK_REMETENTE: TIntegerField;
    qryCTE_MCHAVE_REFERENCIADA: TStringField;
    qryCTE_MNAVERBACAO: TStringField;
    qryCTE_MCNPJ_SEGURADORA: TStringField;
    qryXMLTRIB_FED: TFMTBCDField;
    qryXMLTRIB_EST: TFMTBCDField;
    qryXMLTRIB_MUN: TFMTBCDField;
    qryCTE_MPESOL: TFMTBCDField;
    qryCTE_MPESOB: TFMTBCDField;
    qryCTE_DPRECO: TFMTBCDField;
    qryCTE_DQTD: TFMTBCDField;
    qryCTE_DTOTAL: TFMTBCDField;
    btnEmail: TSpeedButton;
    qryCTE_MVIRTUAL_SITUACAO: TStringField;
    qryRelatorioNUMERO: TIntegerField;
    qryRelatorioDATA: TDateField;
    qryRelatorioCHAVE: TStringField;
    qryRelatorioSITUACAO: TStringField;
    qryRelatorioPROTOCOLO: TStringField;
    qryRelatorioTOTAL: TFMTBCDField;
    qryRelatorioVIRTUAL_SITUACAO: TStringField;
    qryInutilizaCODIGO: TIntegerField;
    qryInutilizaFKEMPRESA: TIntegerField;
    qryInutilizaNUMERO: TIntegerField;
    qryInutilizaCHAVE: TStringField;
    qryInutilizaCFOP: TIntegerField;
    qryInutilizaMODELO: TIntegerField;
    qryInutilizaSERIE: TIntegerField;
    qryInutilizaCODMUNENVIO: TIntegerField;
    qryInutilizaMUNICIPIOENVIO: TStringField;
    qryInutilizaUFENVIO: TStringField;
    qryInutilizaTIPOSERVICO: TIntegerField;
    qryInutilizaCODMUNINI: TIntegerField;
    qryInutilizaMUNICIPIOINI: TStringField;
    qryInutilizaUFINI: TStringField;
    qryInutilizaCODMUNFIM: TIntegerField;
    qryInutilizaMINICIPIOFIM: TStringField;
    qryInutilizaUFFIM: TStringField;
    qryInutilizaTOTAL: TFMTBCDField;
    qryInutilizaRECEBIDO: TFMTBCDField;
    qryInutilizaVPIS: TFMTBCDField;
    qryInutilizaVCOFINS: TFMTBCDField;
    qryInutilizaVINSS: TFMTBCDField;
    qryInutilizaVIR: TFMTBCDField;
    qryInutilizaVCLSS: TFMTBCDField;
    qryInutilizaVTOTTIRB: TFMTBCDField;
    qryInutilizaDESCRICAOSERVICO: TStringField;
    qryInutilizaQTD: TFMTBCDField;
    qryInutilizaRESPSEG: TIntegerField;
    qryInutilizaXSEG: TStringField;
    qryInutilizaNAPOLICE: TStringField;
    qryInutilizaTAF: TStringField;
    qryInutilizaNROREGESTADUAL: TStringField;
    qryInutilizaTIPO: TStringField;
    qryInutilizaSITUACAO: TStringField;
    qryInutilizaFKTOMADOR: TIntegerField;
    qryInutilizaFKTRANSPORTADOR: TIntegerField;
    qryInutilizaPROTOCOLO: TStringField;
    qryInutilizaXML: TMemoField;
    qryInutilizaDATA: TDateField;
    qryInutilizaHORA: TTimeField;
    qryInutilizaFINALIDADE: TIntegerField;
    qryInutilizaDOCUMENTO: TStringField;
    qryInutilizaDATA_ENTREGA: TDateField;
    qryInutilizaTOMADOR: TStringField;
    qryInutilizaFK_DESTINATARIO: TIntegerField;
    qryInutilizaFK_VEICULO: TStringField;
    qryInutilizaOBS_FISCO: TMemoField;
    qryInutilizaOBS_CONTRIBUINTE: TMemoField;
    qryInutilizaVALOR_SERVICO: TFMTBCDField;
    qryInutilizaVALOR_CARGA: TFMTBCDField;
    qryInutilizaCST_ICMS: TStringField;
    qryInutilizaALIQUOTA_ICMS: TFMTBCDField;
    qryInutilizaBASE_ICMS: TFMTBCDField;
    qryInutilizaVALOR_ICMS: TFMTBCDField;
    qryInutilizaOUTROS_TRIBUTOS: TFMTBCDField;
    qryInutilizaPESOL: TFMTBCDField;
    qryInutilizaPESOB: TFMTBCDField;
    qryInutilizaMETRAGEM: TStringField;
    qryInutilizaFK_REMETENTE: TIntegerField;
    qryInutilizaCHAVE_REFERENCIADA: TStringField;
    qryInutilizaNAVERBACAO: TStringField;
    qryInutilizaCNPJ_SEGURADORA: TStringField;
    frxXLSExport1: TfrxXLSExport;
    Panel6: TPanel;
    Panel8: TPanel;
    btnCorrecao: TSpeedButton;
    btnSairCorrecao: TSpeedButton;
    DBGrid2: TDBGrid;
    qryCorrecaoCAMPO: TStringField;
    qryCorrecaoGRUPO: TStringField;
    qryCorrecaoVALOR: TStringField;
    TabSet1: TJvTabControl;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    btnWhats: TSpeedButton;
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInutilizaClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairCorrecaoClick(Sender: TObject);
    procedure btnCorrecaoClick(Sender: TObject);
    procedure BtnCCeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure qryRelatorioCalcFields(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure qryCTE_DPRECOValidate(Sender: TField);
    procedure btnEmailClick(Sender: TObject);
    procedure qryCTE_MCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure qryCorrecaoNewRecord(DataSet: TDataSet);
    procedure TabSet1Change(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    procedure GerarXml;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure habilitaBotoes;
    { Private declarations }
  public
    operacao, idx: Integer;
    vOrdem, vSql: String;

    { Public declarations }
  end;

var
  frmConsCTe_Rodo: TfrmConsCTe_Rodo;

implementation

{$R *.dfm}

uses Udados, uEmail, uCadCTe, uDmCTe, ufrmStatus;

procedure TfrmConsCTe_Rodo.btnImprimirClick(Sender: TObject);
begin
  try
    btnImprimir.Enabled := false;

    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);
    dmCTe.ACBrCTe.DACTE.PathPDF := dados.qryConfigPATH_PDF_CTE.Value;
    dmCTe.ACBrCTe.Conhecimentos.Imprimir;
    dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;
    dmCTe.ACBrCTe.Conhecimentos.GravarXML();

  finally
    btnImprimir.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.btnInutilizaClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin

  dmCTe.ConfiguraCTe;

  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := true;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabInutilizar;

  DecodeDate(date, ano, mes, dia);
  edtModelo.Text := '55';
  edtSerie.Text := dados.qryTerminalSERIE.Value;
  edtAno.Text := IntToStr(ano);
  edtJustificativa.Text := 'QUEBRA DE SEQUÊNCIA DE NUMERAÇÃO';

end;

procedure TfrmConsCTe_Rodo.btnAlterarClick(Sender: TObject);
var
  codigo: Integer;
begin
  operacao := 1;
  if qryCTE_M.IsEmpty then
    exit;

  if (qryCTE_MSITUACAO.Value <> 'A') then
  begin
    ShowMessage('Não é possivel alterar CTe!');
    exit;
  end;

  codigo := qryCTE_MCODIGO.Value;

  try
    btnAlterar.Enabled := false;
    frmCadCTe := TfrmCadCTe.Create(Application);
    frmCadCTe.qryCTE_M.Close;
    frmCadCTe.qryCTE_M.Params[0].Value := codigo;
    frmCadCTe.qryCTE_M.Open;
    frmCadCTe.qryCTE_M.edit;

    frmCadCTe.btnGravar.Enabled := true;
    frmCadCTe.btnTransmitir.Enabled := true;
    frmCadCTe.btnSair.Enabled := true;
    frmCadCTe.DBGridEh1.ReadOnly := false;
    frmCadCTe.Panel3.Enabled := true;

    frmCadCTe.ShowModal;

  finally
    frmCadCTe.Release;
    btnFiltrar.Click;
    btnAlterar.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.btnCancelarClick(Sender: TObject);
Var
  vAux: string;
begin

  dmCTe.ConfiguraCTe;

  if Application.messageBox('Deseja Cancelar CTe?', 'Confirmação', mb_YesNo) = mrNo
  then
    exit;

  dmCTe.ACBrCTe.Conhecimentos.Clear;
  dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);

  if qryCTE_MSITUACAO.Value = 'T' then
  begin
    vAux := InputBox('Cancelamento CTe', 'Justificativa', vAux);
    if Length(vAux) < 15 then
    begin
      ShowMessage('A Justificativa deve ter no minímo 15 caracteres!');
      exit;
    end;

    dmCTe.ACBrCTe.EventoCTe.Evento.Clear;
    with dmCTe.ACBrCTe.EventoCTe.Evento.Add do
    begin
      infEvento.chCTe := qryCTE_MCHAVE.Value;
      infEvento.CNPJ := dados.qryEmpresaCNPJ.Text;
      infEvento.dhEvento := Now;
      infEvento.tpEvento := teCancelamento;
      infEvento.nSeqEvento := 1;

      infEvento.detEvento.nProt := qryCTE_MPROTOCOLO.Value;
      infEvento.detEvento.xJust := trim(vAux);
    end;

    if dmCTe.ACBrCTe.EnviarEvento(1) then
    begin
      qryCTE_M.edit;
      qryCTE_MSITUACAO.Value := 'C';
      qryCTE_M.Post;
      btnFiltrar.Click;
      ShowMessage('Cancelamento realizado com sucesso!');
    end;
  end;
end;

procedure TfrmConsCTe_Rodo.BtnCCeClick(Sender: TObject);
var
  cod: Integer;
begin

  dmCTe.ConfiguraCTe;

  TabCarta.TabVisible := true;
  TabInutilizar.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabCarta;

  qryCorrecao.Close;
  qryCorrecao.Params[0].Value := qryCTE_MCODIGO.Value;
  qryCorrecao.Open;

end;

procedure TfrmConsCTe_Rodo.btnCorrecaoClick(Sender: TObject);
begin
  try
    btnCorrecao.Enabled := false;
    if (qryCorrecao.State in dsEditmodes) then
      qryCorrecao.Post;
    dados.Conexao.CommitRetaining;

    dmCTe.ACBrCTe.EventoCTe.Evento.Clear;
    with dmCTe.ACBrCTe.EventoCTe.Evento.Add do
    begin
      infEvento.chCTe := qryCTE_MCHAVE.Value;
      infEvento.CNPJ := TiraPontos(dados.qryEmpresaCNPJ.Value);
      infEvento.dhEvento := Now;
      infEvento.tpEvento := teCCe;
      infEvento.nSeqEvento := qryCorrecaoSEQUENCIA.Value;
      infEvento.detEvento.xJust := qryCorrecaoCORRECAO.Value;

      qryCorrecao.First;
      while not qryCorrecao.Eof do
      begin
        with dmCTe.ACBrCTe.EventoCTe.Evento.Items[0]
          .infEvento.detEvento.infCorrecao.Add do
        begin
          grupoAlterado := qryCorrecaoGRUPO.Value;
          campoAlterado := qryCorrecaoCAMPO.Value;
          valorAlterado := qryCorrecaoVALOR.Value;
          nroItemAlterado := qryCorrecaoSEQUENCIA.Value;
        end;

        qryCorrecao.Next;

      end;

    end;
    if dmCTe.ACBrCTe.EnviarEvento(StrToInt('1')) then
    begin
      dmCTe.ACBrCTe.ImprimirEvento;
    end;

  finally
    btnCorrecao.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.btnEmailClick(Sender: TObject);
begin
  // email
  try
    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNumero := qryCTE_MCODIGO.Value;
    frmEmail.vNome := dados.qryEmpresaFANTASIA.Value;
    frmEmail.vTipo := 'CTE';
    frmEmail.vTituloAnexo := '';
    frmEmail.eNotaFiscal := false;
    frmEmail.eCTe := true;
    frmEmail.AnexaArquivo := false;
    frmEmail.LstAnexo.Clear;
    frmEmail.LstAnexo.Items.Add(qryCTE_MCHAVE.Value);
    frmEmail.ACBrCTe1.Conhecimentos.Clear;

    frmEmail.ACBrCTe1.Conhecimentos.LoadFromString(qryCTE_MXML.Value);
    frmEmail.edtEmail.Text := '';
    frmEmail.EdtAssunto.Text := 'CTE nº' + qryCTE_MNUMERO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO XML E DACTE CTE nº' +
      qryCTE_MNUMERO.AsString;
    frmEmail.ShowModal;
  finally
    frmEmail.Release;
  end;
end;

procedure TfrmConsCTe_Rodo.btnRecuperarClick(Sender: TObject);
begin

  dmCTe.ConfiguraCTe;

  if qryCTE_MSITUACAO.Value = 'D' then
  begin
    if (qryCTE_MCHAVE.IsNull) or (trim(qryCTE_MCHAVE.Value) = '') then
    begin
      qryCTE_M.edit;
      qryCTE_MSITUACAO.Value := 'A';
      qryCTE_M.Post;
      btnFiltrar.Click;
      exit;
    end;
  end;

  dmCTe.ACBrCTe.Conhecimentos.Clear;
  dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);
  dmCTe.ACBrCTe.Consultar;
  if dmCTe.ACBrCTe.WebServices.Consulta.cStat = 100 then
  begin
    qryCTE_M.edit;
    qryCTE_MPROTOCOLO.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
      .CTe.procCTe.nProt;
    qryCTE_MCHAVE.Value :=
      COPY(dmCTe.ACBrCTe.Conhecimentos.Items[0].CTe.infCTe.ID, 4, 100);
    qryCTE_MXML.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].XML;
    qryCTE_MDATA.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].CTe.ide.dhEmi;
    qryCTE_MSITUACAO.Value := 'T';
    qryCTE_M.Post;
    dados.Conexao.CommitRetaining;
  end;
  btnFiltrar.Click;
end;

procedure TfrmConsCTe_Rodo.habilitaBotoes;
begin
  Panel3.Width := 630;
  // btnAlterar.Visible := false;
  btnCancelar.Visible := false;
  btnInutiliza.Visible := false;
  btnRecuperar.Visible := false;
  btnImprimir.Visible := false;
  // BtnCCe.Visible := false;
  btnEmail.Visible := false;
  // btnRelatorio.Visible := false;

  btnNovo.Left := 0;
  btnAlterar.Left := 75;
  btnCancelar.Left := 150;
  btnInutiliza.Left := 225;
  btnRecuperar.Left := 300;
  btnImprimir.Left := 450;
  BtnCCe.Left := 525;
  btnEmail.Left := 600;
  // btnRelatorio.Left := 675;

  // btnAlterar.Visible := TabSet1.TabIndex = 0;
  btnCancelar.Visible := TabSet1.TabIndex = 1;
  btnInutiliza.Visible := true;
  btnRecuperar.Visible := TabSet1.TabIndex = 3;
  btnImprimir.Visible := TabSet1.TabIndex in [1, 2, 6];
  // BtnCCe.Visible := TabSet1.TabIndex = 1;
  btnEmail.Visible := TabSet1.TabIndex = 1;
  // btnRelatorio.Visible := true;
end;

procedure TfrmConsCTe_Rodo.btnRelatorioClick(Sender: TObject);
begin
  if qryCTE_M.IsEmpty then
    exit;
  try
    btnRelatorio.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\ListadeCTE.fr3');
    frxReport.ShowReport;
  finally
    btnRelatorio.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.btnSairCorrecaoClick(Sender: TObject);
begin
  qryCorrecao.Cancel;
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsCTe_Rodo.btnWhatsClick(Sender: TObject);
var
  arquivo: string;
  FFone: String;
begin

  if qryCTE_M.IsEmpty then
    exit;

  if trim(qryCTE_MXML.AsString) = '' then
    exit;

  dmCTe.ConfiguraCTe;
  dmCTe.ACBrCTe.Conhecimentos.Clear;
  dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCTE_MXML.Value);

  arquivo := dmCTe.ACBrCTe.DACTE.PathPDF + qryCTE_MCHAVE.Value + '-cte.PDF';

  if not FilesExists(arquivo) then
    dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;

  if FileExists(arquivo) then
  begin

    FFone := InputBox('Digite o numero do whatsapp', 'Número:', '');
    if Length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    dados.InsereMensagemZap(arquivo, FFone,
      'Conforme solicitado, segue DACTE do CTe Número:' +
      qryCTE_MNUMERO.AsString, '', '', dados.qryEmpresaRAZAO.AsString, 'CTE');
  end;

end;

function TfrmConsCTe_Rodo.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmConsCTe_Rodo.BitBtn2Click(Sender: TObject);
begin
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsCTe_Rodo.GerarXml;
begin
  // gerar xml
end;

procedure TfrmConsCTe_Rodo.btnFecharClick(Sender: TObject);
begin
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsCTe_Rodo.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus
end;

procedure TfrmConsCTe_Rodo.btnInutilizarClick(Sender: TObject);
var
  sNomeArquivo1, sNomeArquivo2, Justificativa: String;
  i: Integer;
begin
  try
    btnInutiliza.Enabled := false;
    Justificativa := edtJustificativa.Text;

    if Length(edtJustificativa.Text) < 15 then
    begin
      Application.ProcessMessages;
      ShowMessage
        ('Justificativa de Inutilização deve ter mais de 15 caracteres!');
      exit;
    end;

    for i := StrToInt(edtInicial.Text) to StrToInt(edtFinal.Text) do
    begin

      dados.qryconsulta.Close;
      dados.qryconsulta.sql.Text :=
        'SELECT SITUACAO FROM CTE_MASTER WHERE NUMERO=:NUME';
      dados.qryconsulta.Params[0].Value := i;
      dados.qryconsulta.Open;
    end;

    if dmCTe.ACBrCTe.Inutilizar(TiraPontos(dados.qryEmpresaCNPJ.Value),
      edtJustificativa.Text, StrToInt(edtAno.Text), StrToInt(edtSerie.Text),
      StrToInt(edtInicial.Text), StrToInt(edtFinal.Text)) then
    begin
      for i := StrToInt(edtInicial.Text) to StrToInt(edtFinal.Text) do
      begin

        dados.qryconsulta.Close;
        dados.qryconsulta.sql.Text :=
          'SELECT SITUACAO FROM CTE_MASTER WHERE NUMERO=:NUME';
        dados.qryconsulta.Params[0].Value := i;
        dados.qryconsulta.Open;

        qryInutiliza.Close;
        qryInutiliza.Params[0].Value := i;
        qryInutiliza.Params[1].Value := dados.qryEmpresaCODIGO.Value;
        qryInutiliza.Open;
        if not qryInutiliza.IsEmpty then
        begin
          qryInutiliza.edit;
          qryInutilizaSITUACAO.Value := 'I';
          qryInutiliza.Post;
          dados.Conexao.CommitRetaining;
          Application.ProcessMessages;
        end
        else
        begin
          qryInutiliza.Insert;
          qryInutilizaCODIGO.Value := dados.Numerador('CTE_MASTER', 'CODIGO',
            'N', '', '');
          qryInutilizaNUMERO.Value := i;
          qryInutilizaCHAVE.Value := 'CHAVE NÃO GERADA';
          qryInutilizaSERIE.Value := dados.qryConfigCTE_SERIE.AsInteger;
          qryInutilizaDATA.Value := date;
          qryInutilizaFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
          qryInutilizaFKTOMADOR.Value := 0;
          qryInutilizaSITUACAO.Value := 'I';
          qryInutilizaDOCUMENTO.Value := '0';
          qryInutilizaTIPO.Value := 'CTE';
          qryInutilizaDATA.Value := date;
          qryInutilizaTOMADOR.Value := '0';
          qryInutilizaTOTAL.Value := 0;
          qryInutilizaRECEBIDO.Value := 0;
          qryInutilizaVALOR_CARGA.Value := 0;
          qryInutilizaVALOR_SERVICO.Value := 0;
          qryInutilizaVPIS.Value := 0;
          qryInutilizaVCOFINS.Value := 0;
          qryInutilizaVINSS.Value := 0;
          qryInutilizaVIR.Value := 0;
          qryInutilizaVCLSS.Value := 0;
          qryInutilizaVTOTTIRB.Value := 0;
          qryInutilizaVTOTTIRB.Value := 0;
          qryInutilizaQTD.Value := 1;
          qryInutilizaBASE_ICMS.Value := 0;
          qryInutilizaALIQUOTA_ICMS.Value := 0;
          qryInutilizaVALOR_ICMS.Value := 0;
          qryInutilizaOUTROS_TRIBUTOS.Value := 0;
          qryInutilizaMODELO.Value := 57;
          qryInutilizaMETRAGEM.Value := '0';
          qryInutiliza.Post;
          dados.Conexao.CommitRetaining;
        end;

      end;
      ShowMessage('Inutilização realizada com sucesso!');
    end;
  finally
    btnAlterar.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.btnNovoClick(Sender: TObject);
begin
  operacao := 1;
  if trim(dados.qryConfigCTE_SERIE.AsString) = '' then
  begin
    ShowMessage('Cadaste o numero de Série do CTe');
    exit;
  end;

  try
    btnNovo.Enabled := false;
    frmCadCTe := TfrmCadCTe.Create(Application);

    frmCadCTe.qryCTE_M.Close;
    frmCadCTe.qryCTE_M.Params[0].Value := -1;
    frmCadCTe.qryCTE_M.Open;

    frmCadCTe.qryCTE_M.Insert;

    frmCadCTe.qryCTE_MCODIGO.Value := dados.Numerador('CTE_MASTER', 'CODIGO',
      'N', '', '');
    frmCadCTe.qryCTE_MFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;

    frmCadCTe.qryCTE_MSITUACAO.Value := 'A';
    frmCadCTe.qryCTE_MDOCUMENTO.Value := '0';
    frmCadCTe.qryCTE_MTIPO.Value := 'CTE';
    frmCadCTe.qryCTE_MDATA.Value := date;
    frmCadCTe.qryCTE_MTOMADOR.Value := '0';
    frmCadCTe.qryCTE_MTOTAL.Value := 0;
    frmCadCTe.qryCTE_MRECEBIDO.Value := 0;
    frmCadCTe.qryCTE_MVALOR_CARGA.Value := 0;
    frmCadCTe.qryCTE_MVALOR_SERVICO.Value := 0;
    frmCadCTe.qryCTE_MFINALIDADE.Value := 0;
    frmCadCTe.qryCTE_MDOCUMENTO.Value := 'N';
    frmCadCTe.qryCTE_MVPIS.Value := 0;
    frmCadCTe.qryCTE_MVCOFINS.Value := 0;
    frmCadCTe.qryCTE_MVINSS.Value := 0;
    frmCadCTe.qryCTE_MVIR.Value := 0;
    frmCadCTe.qryCTE_MVCLSS.Value := 0;
    frmCadCTe.qryCTE_MVTOTTIRB.Value := 0;
    frmCadCTe.qryCTE_MVTOTTIRB.Value := 0;
    frmCadCTe.qryCTE_MQTD.Value := 1;
    frmCadCTe.qryCTE_MBASE_ICMS.Value := 0;
    frmCadCTe.qryCTE_MALIQUOTA_ICMS.Value := 0;
    frmCadCTe.qryCTE_MVALOR_ICMS.Value := 0;
    frmCadCTe.qryCTE_MOUTROS_TRIBUTOS.Value := 0;
    frmCadCTe.qryCTE_MMODELO.Value := 57;
    frmCadCTe.qryCTE_MMETRAGEM.Value := '0';

    frmCadCTe.qryCTE_MSERIE.AsInteger := dados.qryConfigCTE_SERIE.AsInteger;

    frmCadCTe.btnGravar.Enabled := true;
    frmCadCTe.btnTransmitir.Enabled := true;
    frmCadCTe.btnSair.Enabled := true;
    frmCadCTe.DBGridEh1.ReadOnly := false;
    frmCadCTe.Panel3.Enabled := true;
    frmCadCTe.ShowModal;

  finally
    frmCadCTe.Release;
    btnFiltrar.Click;
    btnNovo.Enabled := true;
  end;
end;

procedure TfrmConsCTe_Rodo.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.065);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.055);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.650);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.090);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.083);
end;

procedure TfrmConsCTe_Rodo.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmConsCTe_Rodo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsCTe_Rodo.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
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
  DBGrid1.Columns[2].Title.Caption := 'Chave';
  DBGrid1.Columns[3].Title.Caption := 'Protocolo';
  DBGrid1.Columns[4].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

  if (idx in [1 .. 2]) then
    maskInicio.SetFocus
  else
    edtLoc.SetFocus;
end;

procedure TfrmConsCTe_Rodo.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsCTe_Rodo.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryCTE_M.Prior;
  if Key = VK_DOWN then
    qryCTE_M.Next;
end;

procedure TfrmConsCTe_Rodo.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmConsCTe_Rodo.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin

  vOrdem := ' ASC';
  DecodeDate(date, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := datetostr(date);

  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := false;

  btnNovo.Caption := 'F2' + sLineBreak + 'Novo';
  btnAlterar.Caption := 'F3' + sLineBreak + 'Alterar';
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnInutiliza.Caption := 'F5' + sLineBreak + 'Inutilizar';
  btnRecuperar.Caption := 'F6' + sLineBreak + 'Recuperar';
  btnImprimir.Caption := 'F7' + sLineBreak + 'Imprimir';
  BtnCCe.Caption := 'F8' + sLineBreak + 'CCe';
  btnEmail.Caption := 'F9' + sLineBreak + 'Emaail';
  btnRelatorio.Caption := 'F10' + sLineBreak + 'Relatório';
end;

procedure TfrmConsCTe_Rodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnNovo.Click;
  if Key = vk_f3 then
    btnAlterar.Click;
  if Key = vk_f4 then
    btnCancelar.Click;
  if Key = vk_f5 then
    btnInutiliza.Click;
  if Key = vk_f6 then
    btnRecuperar.Click;
  if Key = vk_f7 then
    btnImprimir.Click;
  if Key = vk_f8 then
    BtnCCe.Click;
  if Key = vk_f10 then
    btnRelatorio.Click;
  if Key = vk_f11 then
    btnWhats.Click;
  if Key = vk_f12 then
    maskInicio.SetFocus;
end;

procedure TfrmConsCTe_Rodo.FormShow(Sender: TObject);
begin

  dados.qryConfig.Close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  dados.qryProd.Close;
  dados.qryProd.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryProd.Open;

  dados.qryTerminal.Close;
  dados.qryTerminal.Params[0].Value := dados.Getcomputer;
  dados.qryTerminal.Open;

  if not dados.qryTerminal.Locate('nome', dados.nometerminal, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
  end;

  tamanho;
  maskInicio.EditText := datetostr(StartOfTheMonth(date));
  maskFim.EditText := datetostr(date);

  DBGrid1TitleClick(DBGrid1.Columns[0]);

  edtLoc.SetFocus;

  habilitaBotoes;

end;

procedure TfrmConsCTe_Rodo.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  vSql := ' select CTE.* from CTE_MASTER CTE ' + ' where' + ' codigo>0' +
    ' /*where*/';

  filtro := filtro + ' and cte.fkempresa=' + dados.qryEmpresaCODIGO.AsString;

  filtro := filtro + ' and CTE.Data>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
    ' and CTE.Data<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    strtodate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CTE.numero like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    2:
      begin
        filtro := filtro + ' and CTE.CHAVE like ' +
          QuotedStr(parte + edtLoc.Text + '%');

      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and CTE.protocolo like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cte.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    0:
      filtro1 := ' and cte.situacao=''T'''; // TRANSMITIDA
    1:
      filtro1 := ' and cte.situacao=''A'''; // ABERTA
    2:
      filtro1 := ' and cte.situacao=''C'''; // CANCELADA
    3:
      filtro1 := ' and cte.situacao=''D'''; // DUPLICIDADE
    4:
      filtro1 := ' and cte.situacao=''I'''; // INUTILIZADA
  end;

  case idx of
    0:
      ordem := ' order by cte.numero ' + vOrdem;
    1:
      ordem := ' order by cte.data ' + vOrdem;
    2:
      ordem := ' order by cte.chave ' + vOrdem;
    3:
      ordem := ' order by cte.protocolo ' + vOrdem;
    4:
      ordem := ' order by cte.total ' + vOrdem;

  end;

  qryCTE_M.Close;

  qryCTE_M.sql.Text := vSql;
  qryCTE_M.sql.Text := StringReplace(qryCTE_M.sql.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryCTE_M.Open;
end;

procedure TfrmConsCTe_Rodo.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;

end;

procedure TfrmConsCTe_Rodo.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;

end;

procedure TfrmConsCTe_Rodo.qryCorrecaoNewRecord(DataSet: TDataSet);
begin
  qryCorrecao.Insert;
  qryCorrecaoCODIGO.Value := dados.Numerador('CTE_CARTA', 'CODIGO',
    'N', '', '');
  qryCorrecaoFK_CTE.Value := qryCTE_MCODIGO.Value;
  qryCorrecaoSEQUENCIA.Value := dados.Numerador('CTE_CARTA', 'SEQUENCIA', 'S',
    'FK_CTE', qryCorrecaoFK_CTE.AsString);
  qryCorrecaoFK_EMPRESA.Value := qryCTE_MFKEMPRESA.Value;
  qryCorrecaoDATA.Value := date;
end;

procedure TfrmConsCTe_Rodo.qryCTE_DPRECOValidate(Sender: TField);
begin
  qryCTE_DTOTAL.AsFloat := qryCTE_DPRECO.AsFloat * qryCTE_DPRECO.AsFloat;
end;

procedure TfrmConsCTe_Rodo.qryCTE_MCalcFields(DataSet: TDataSet);
begin
  if qryCTE_MSITUACAO.Value = 'A' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryCTE_MSITUACAO.Value = 'T' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryCTE_MSITUACAO.Value = 'C' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryCTE_MSITUACAO.Value = 'D' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryCTE_MSITUACAO.Value = 'I' then
    qryCTE_MVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
end;

procedure TfrmConsCTe_Rodo.qryRelatorioCalcFields(DataSet: TDataSet);
begin
  if qryRelatorioSITUACAO.Value = 'A' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryRelatorioSITUACAO.Value = 'T' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryRelatorioSITUACAO.Value = 'C' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryRelatorioSITUACAO.Value = 'D' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryRelatorioSITUACAO.Value = 'I' then
    qryRelatorioVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
end;

procedure TfrmConsCTe_Rodo.TabSet1Change(Sender: TObject);
begin
  habilitaBotoes;
  localiza;
end;

end.
