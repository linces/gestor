unit uConsCTe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Math, System.zip, dateutils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, pcnConversao, acbrUtil, ACBrDFeSSL, blcksock,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, ACBRDFeUtil,
  ACBrBase, ACBrMail, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Menus, ACBrEnterTab,
  ACBrCTeDACTEFR, ACBrDFeReport, ACBrCTeDACTEClass, ACBrCTeDACTeRLClass,
  ACBrDFe, ACBrCTe;

type
  TfrmConsCTe = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    LblSaldo: TLabel;
    qryCte: TFDQuery;
    ACBrEnterTab1: TACBrEnterTab;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    dsEmpresa: TDataSource;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Panel11: TPanel;
    qryCteCODIGO: TIntegerField;
    qryCteFKEMPRESA: TIntegerField;
    qryCteNUMERO: TIntegerField;
    qryCteCHAVE: TStringField;
    qryCteCFOP: TIntegerField;
    qryCteMODELO: TIntegerField;
    qryCteSERIE: TIntegerField;
    qryCteCODMUNENVIO: TIntegerField;
    qryCteMUNICIPIOENVIO: TStringField;
    qryCteUFENVIO: TStringField;
    qryCteTIPOSERVICO: TIntegerField;
    qryCteCODMUNINI: TIntegerField;
    qryCteMUNICIPIOINI: TStringField;
    qryCteUFINI: TStringField;
    qryCteCODMUNFIM: TIntegerField;
    qryCteMINICIPIOFIM: TStringField;
    qryCteUFFIM: TStringField;
    qryCteDESCRICAOSERVICO: TStringField;
    qryCteRESPSEG: TIntegerField;
    qryCteXSEG: TStringField;
    qryCteNAPOLICE: TStringField;
    qryCteTAF: TStringField;
    qryCteTIPO: TStringField;
    qryCteSITUACAO: TStringField;
    qryCteFKTOMADOR: TIntegerField;
    qryCtePROTOCOLO: TStringField;
    qryCteXML: TMemoField;
    qryCteDATA: TDateField;
    qryCteHORA: TTimeField;
    qryCteVIRTUAL_SITUACAO: TStringField;
    qryCteFKTRANSPORTADOR: TIntegerField;
    qryTomador: TFDQuery;
    qryTomadorCODIGO: TIntegerField;
    qryTomadorRAZAO: TStringField;
    qryTomadorFANTASIA: TStringField;
    qryTomadorFONE: TStringField;
    qryTomadorENDERECO: TStringField;
    qryTomadorNUMERO: TStringField;
    qryTomadorBAIRRO: TStringField;
    qryTomadorCODMUN: TIntegerField;
    qryTomadorMUNICIPIO: TStringField;
    qryTomadorUF: TStringField;
    qryTomadorCEP: TStringField;
    qryTomadorFKEMPRESA: TIntegerField;
    qryTomadorTIPO: TStringField;
    qryTomadorCNPJ: TStringField;
    qryTomadorIE: TStringField;
    qryTransp: TFDQuery;
    qryTranspCODIGO: TIntegerField;
    qryTranspPESSOA: TStringField;
    qryTranspCNPJ: TStringField;
    qryTranspIE: TStringField;
    qryTranspNOME: TStringField;
    qryTranspAPELIDO: TStringField;
    qryTranspENDERECO: TStringField;
    qryTranspNUMERO: TStringField;
    qryTranspBAIRRO: TStringField;
    qryTranspCOD_CIDADE: TIntegerField;
    qryTranspCIDADE: TStringField;
    qryTranspUF: TStringField;
    qryTranspCEP: TStringField;
    qryTranspPLACA: TStringField;
    qryTranspUFPLACA: TStringField;
    qryTranspRNTC: TStringField;
    qryTranspATIVO: TStringField;
    qryTranspEMPRESA: TIntegerField;
    qryTranspRENAVAM: TStringField;
    dsCTe: TDataSource;
    btnTransmitir: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnRecuperar: TSpeedButton;
    btnGerar: TSpeedButton;
    qryCteNROREGESTADUAL: TStringField;
    qryCteTOTAL: TFMTBCDField;
    qryCteRECEBIDO: TFMTBCDField;
    qryCteVPIS: TFMTBCDField;
    qryCteVCOFINS: TFMTBCDField;
    qryCteVINSS: TFMTBCDField;
    qryCteVIR: TFMTBCDField;
    qryCteVCLSS: TFMTBCDField;
    qryCteVTOTTIRB: TFMTBCDField;
    qryCteQTD: TFMTBCDField;
    qryCteFINALIDADE: TIntegerField;
    qryCteDOCUMENTO: TStringField;
    qryCteDATA_ENTREGA: TDateField;
    qryCteTOMADOR: TStringField;
    qryCteFK_DESTINATARIO: TIntegerField;
    qryCteFK_VEICULO: TStringField;
    qryCteOBS_FISCO: TMemoField;
    qryCteOBS_CONTRIBUINTE: TMemoField;
    qryCteVALOR_SERVICO: TFMTBCDField;
    qryCteVALOR_CARGA: TFMTBCDField;
    qryCteCST_ICMS: TStringField;
    qryCteALIQUOTA_ICMS: TFMTBCDField;
    qryCteBASE_ICMS: TFMTBCDField;
    qryCteVALOR_ICMS: TFMTBCDField;
    qryCteOUTROS_TRIBUTOS: TFMTBCDField;
    qryCteMETRAGEM: TStringField;
    qryCteFK_REMETENTE: TIntegerField;
    qryCteCHAVE_REFERENCIADA: TStringField;
    qryCteNAVERBACAO: TStringField;
    qryCteCNPJ_SEGURADORA: TStringField;
    btnInutiliza: TSpeedButton;
    BtnCCe: TSpeedButton;
    qryCorrecao: TFDQuery;
    dsCorrecao: TDataSource;
    qryCorrecaoCODIGO: TIntegerField;
    qryCorrecaoFK_CTE: TIntegerField;
    qryCorrecaoSEQUENCIA: TIntegerField;
    qryCorrecaoFK_EMPRESA: TIntegerField;
    qryCorrecaoFK_USUARIO: TIntegerField;
    qryCorrecaoDATA: TDateField;
    qryCorrecaoCORRECAO: TMemoField;
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
    Panel6: TPanel;
    Label14: TLabel;
    Panel8: TPanel;
    btnCorrecao: TSpeedButton;
    btnSairCorrecao: TSpeedButton;
    qryCtePESOL: TFMTBCDField;
    qryCtePESOB: TFMTBCDField;
    qryCorrecaoCAMPO: TStringField;
    qryCorrecaoGRUPO: TStringField;
    qryCorrecaoVALOR: TStringField;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Grupo: TLabel;
    Label2: TLabel;
    Label10: TLabel;
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
    procedure qryCteCalcFields(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure dsCTeDataChange(Sender: TObject; Field: TField);
    procedure BtnCCeClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnInutilizaClick(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCorrecaoClick(Sender: TObject);
    procedure btnSairCorrecaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure TabControl1Change(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    function Getcomputer: String;
    procedure CTE_OS;
    { Private declarations }
  public
    operacao, idx: Integer;
    vOrdem, vSql: String;

    { Public declarations }
  end;

var
  frmConsCTe: TfrmConsCTe;

implementation

{$R *.dfm}

uses Udados, uNFe, ufrmStatus, pcteConversaoCTe, uCadCTeOS, uTransportador,
  uDadosWeb, uDmCTe;

function TfrmConsCTe.Getcomputer: String;
var
  lpBuffer: PChar;
  nSize: DWord;
const
  Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer, nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

procedure TfrmConsCTe.BitBtn3Click(Sender: TObject);
begin
  try
    BtnCCe.Enabled := false;
    if (qryCorrecao.State in dsEditmodes) then
      qryCorrecao.Post;
    dados.Conexao.CommitRetaining;

    dmCTe.ACBrCTe.EventoCTe.Evento.Clear;
    with dmCTe.ACBrCTe.EventoCTe.Evento.Add do
    begin
      infEvento.chCTe := qryCteCHAVE.Value;
      infEvento.CNPJ := '000' + TiraPontos(dados.qryEmpresaCNPJ.Value);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCCe;
      infEvento.nSeqEvento := qryCorrecaoSEQUENCIA.Value;
      infEvento.detEvento.xJust := qryCorrecaoCORRECAO.Value;
    end;
    if dmCTe.ACBrCTe.EnviarEvento(StrToInt('1')) then
    begin
      dmCTe.ACBrCTe.ImprimirEvento;
    end;

  finally
    BtnCCe.Enabled := true;
  end;
end;

procedure TfrmConsCTe.btnAlterarClick(Sender: TObject);
var
  codigo: Integer;
begin
  operacao := 1;
  if qryCte.IsEmpty then
    exit;

  if qryCteSITUACAO.Value <> '1' then
  begin
    ShowMessage('CTe não pode ser alterado!');
    exit;
  end;

  codigo := qryCteCODIGO.Value;

  try
    btnAlterar.Enabled := false;
    frmCadCTeOS := TfrmCadCTeOS.Create(Application);
    frmCadCTeOS.qryCte.Close;
    frmCadCTeOS.qryCte.Params[0].Value := codigo;
    frmCadCTeOS.qryCte.Open;

    frmCadCTeOS.qryCte.edit;

    frmCadCTeOS.btnGravar.Enabled := true;
    frmCadCTeOS.ShowModal;
  finally
    frmCadCTeOS.Release;
    btnFiltrar.Click;
    btnAlterar.Enabled := true;
  end;
end;

procedure TfrmConsCTe.btnCancelarClick(Sender: TObject);
var
  Chave, idLote, CNPJ, Protocolo, Justificativa: string;
begin
  operacao := 0;
  dmCTe.ConfiguraCTe;
  dmCTe.ACBrCTe.Configuracoes.Arquivos.PathEvento :=
    dados.qryConfigPATHCAN_NFE.Value;
  try
    btnCancelar.Enabled := false;
    Chave := trim(OnlyNumber(qryCteCHAVE.Value));
    idLote := '1';
    CNPJ := copy(Chave, 7, 14);
    Protocolo := qryCtePROTOCOLO.Value;

    InputQuery('Cancelamento', 'Justificativa do Cancelamento', Justificativa);
    if length(Justificativa) < 15 then
    begin
      Application.ProcessMessages;
      ShowMessage
        ('Justificativa de cancelamento deve ter mais de 15 caracteres!');
      exit;
    end;

    with dmCTe.ACBrCTe.EventoCTe.Evento.Add do
    begin
      infEvento.nSeqEvento := 1;
      infEvento.chCTe := Chave;
      infEvento.CNPJ := CNPJ;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := Justificativa;
      infEvento.detEvento.nProt := Protocolo;
    end;

    dmCTe.ACBrCTe.EnviarEvento(StrToInt(idLote));

    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.WebServices.Consulta.CTeChave := qryCteCHAVE.Value;
    dmCTe.ACBrCTe.WebServices.Consulta.Executar;

    if dmCTe.ACBrCTe.WebServices.Consulta.cStat = 101 then
    begin
      qryCte.edit;
      qryCteSITUACAO.Value := '3';
      qryCte.Post;
      Application.ProcessMessages;
      ShowMessage('Status:' + #13 +
        IntToStr(dmCTe.ACBrCTe.WebServices.EnvEvento.cStat) + '-' +
        dmCTe.ACBrCTe.WebServices.EnvEvento.XMotivo);
      dmCTe.ACBrCTe.Conhecimentos.GravarXML();
    end
    else
    begin
      ShowMessage('Cancelamento não foi realizado!');
    end;
  finally
    btnCancelar.Enabled := true;
    btnFiltrar.Click;
  end;

end;

procedure TfrmConsCTe.BtnCCeClick(Sender: TObject);
var
  cod: Integer;
begin

  dmCTe.ConfiguraCTe;

  TabCarta.TabVisible := true;
  TabInutilizar.TabVisible := false;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabCarta;

  qryCorrecao.Close;
  qryCorrecao.Params[0].Value := qryCteCODIGO.Value;
  qryCorrecao.Open;

  qryCorrecao.First;
  cod := qryCorrecaoSEQUENCIA.AsInteger + 1;
  qryCorrecao.Insert;
  qryCorrecaoCODIGO.Value := dados.Numerador('CTE_CARTA', 'CODIGO',
    'N', '', '');
  qryCorrecaoFK_CTE.Value := qryCteCODIGO.Value;
  qryCorrecaoSEQUENCIA.Value := cod;
  qryCorrecaoFK_EMPRESA.Value := qryCteFKEMPRESA.Value;
  qryCorrecaoDATA.Value := date;

end;

procedure TfrmConsCTe.CTE_OS;
begin
  dmCTe.ACBrCTe.Conhecimentos.Clear;
  with dmCTe.ACBrCTe.Conhecimentos.Add.CTe do
  begin
    infCTe.versao := 3.0;

    Ide.cUF := UFtoCUF(dados.qryEmpresaUF.Value);
    Ide.cCT := qryCteNUMERO.Value;
    Ide.CFOP := qryCteCFOP.Value;
    Ide.natOp := 'PRESTACAO SERVICO TRANSPORTE';
    Ide.modelo := 67;
    Ide.serie := dados.qryConfigCTE_SERIE.AsInteger;
    Ide.nCT := qryCteNUMERO.Value;
    Ide.cCT := GerarCodigoDFe(qryCteNUMERO.Value);
    Ide.dhEmi := now;
    Ide.tpImp := tiRetrato;
    Ide.tpEmis := teNormal;
    if dados.qryConfigAMBIENTE.Value = 0 then
      Ide.tpAmb := taProducao
    else
      Ide.tpAmb := taHomologacao;

    Ide.tpCTe := tcNormal;
    case qryCteTIPOSERVICO.Value of
      0:
        Ide.tpServ := tsNormal;
      1:
        Ide.tpServ := tsSubcontratacao;
      2:
        Ide.tpServ := tsRedespacho;
      3:
        Ide.tpServ := tsIntermediario;
      4:
        Ide.tpServ := tsMultimodal;
      5:
        Ide.tpServ := tsTranspPessoas;
      6:
        Ide.tpServ := tsTranspValores;
      7:
        Ide.tpServ := tsExcessoBagagem;
    end;
    Ide.procEmi := peAplicativoContribuinte;
    Ide.verProc := '3.0';
    Ide.cMunEnv := dados.qryEmpresaID_CIDADE.Value;
    Ide.xMunEnv := dados.qryEmpresaCIDADE.Value;
    Ide.UFEnv := dados.qryEmpresaUF.Value;
    Ide.modal := mdRodoviario;
    Ide.indIEToma := TpcnindIEDest(dados.qryConfigTIPO_CONTRIBUINTE_CTE.Value);
    Ide.cMunIni := qryCteCODMUNINI.Value;
    Ide.xMunIni := qryCteMUNICIPIOINI.Value;
    Ide.UFIni := qryCteUFINI.Value;
    Ide.cMunFim := qryCteCODMUNFIM.Value;
    Ide.xMunFim := qryCteMINICIPIOFIM.Value;
    Ide.UFFim := qryCteUFFIM.Value;

    Emit.CNPJ := TiraPontos(dados.qryEmpresaCNPJ.Value);
    Emit.IE := TiraPontos(dados.qryEmpresaIE.Value);
    Emit.xNome := dados.qryEmpresaRAZAO.Value;
    Emit.xFant := dados.qryEmpresaFANTASIA.Value;
    Emit.enderEmit.xLgr := dados.qryEmpresaENDERECO.Value;
    Emit.enderEmit.nro := dados.qryEmpresaNUMERO.Value;
    Emit.enderEmit.xCpl := '';
    Emit.enderEmit.xBairro := dados.qryEmpresaBAIRRO.Value;
    Emit.enderEmit.cMun := dados.qryEmpresaID_CIDADE.Value;
    Emit.enderEmit.xMun := dados.qryEmpresaCIDADE.Value;
    Emit.enderEmit.CEP := dados.qryEmpresaCEP.AsInteger;
    Emit.enderEmit.UF := dados.qryEmpresaUF.Value;
    Emit.enderEmit.fone := dados.qryEmpresaFONE.Value;

    // Adiciona dados do tomador do serviço
    qryTomador.Close;
    qryTomador.Params[0].Value := qryCteFKTOMADOR.Value;
    qryTomador.Open;
    toma.CNPJCPF := TiraPontos(qryTomadorCNPJ.Value);
    if trim(qryTomadorIE.AsString) <> '' then
      toma.IE := TiraPontos(qryTomadorIE.Value);
    toma.xNome := qryTomadorRAZAO.Value;
    toma.xFant := qryTomadorFANTASIA.Value;
    toma.fone := '';
    toma.enderToma.xLgr := qryTomadorENDERECO.Value;
    toma.enderToma.nro := qryTomadorNUMERO.Value;
    toma.enderToma.xCpl := '';
    toma.enderToma.xBairro := qryTomadorBAIRRO.Value;
    toma.enderToma.cMun := qryTomadorCODMUN.Value;
    toma.enderToma.xMun := qryTomadorMUNICIPIO.Value;
    toma.enderToma.CEP := qryTomadorCEP.AsInteger;
    toma.enderToma.UF := qryTomadorUF.Value;
    toma.enderToma.cPais := 1058;
    toma.enderToma.xPais := 'BRASIL';
    toma.email := '';

    { Carrega valores da prestacao de servico }
    vPrest.vTPrest := qryCteTOTAL.AsFloat;
    vPrest.vRec := qryCteRECEBIDO.AsFloat;

    // 90 - ICMS Outros
    if Emit.enderEmit.UF = Rem.enderReme.UF then
    begin
      Imp.ICMS.SituTrib := cst90;
      Imp.ICMS.ICMS90.CST := cst90;
      Imp.ICMS.ICMS90.pRedBC := 0.00;
      Imp.ICMS.ICMS90.vBC := 0.00;
      Imp.ICMS.ICMS90.pICMS := 0.00;
      Imp.ICMS.ICMS90.vICMS := 0;
      Imp.ICMS.ICMS90.vCred := 0.00;
    end
    else
    begin
      Imp.ICMS.SituTrib := cstICMSOutraUF;
      Imp.ICMS.ICMSOutraUF.CST := cstICMSOutraUF; // ICMS Outros
      Imp.ICMS.ICMSOutraUF.pRedBCOutraUF := 0;
      Imp.ICMS.ICMSOutraUF.vBCOutraUF := 0;
      Imp.ICMS.ICMSOutraUF.pICMSOutraUF := 0;
      Imp.ICMS.ICMSOutraUF.vICMSOutraUF := 0;
    end;

    Imp.infAdFisco :=
      'Lei da Transparencia: O valor aproximado de tributos incidentes sobre o preço deste servico é de R$'
      + FormatFloat(',0.00', qryCteVTOTTIRB.AsFloat) + ' Fonte: IBPT';
    Imp.vTotTrib := qryCteVTOTTIRB.AsFloat;

    // Impostos federais
    Imp.infTribFed.vPIS := qryCteVPIS.AsFloat;
    Imp.infTribFed.vCOFINS := qryCteVCOFINS.AsFloat;
    Imp.infTribFed.vIR := qryCteVIR.AsFloat;
    Imp.infTribFed.vINSS := qryCteVINSS.AsFloat;
    Imp.infTribFed.vCSLL := qryCteVCLSS.AsFloat;

    { Carrega as informacoes CTe Normal }
    infCTeNorm.infServico.xDescServ := qryCteDESCRICAOSERVICO.Value;;;
    infCTeNorm.infServico.qCarga := qryCteQTD.AsFloat;;

    { Carrega informacoes do seguro }
    with infCTeNorm.Seg.Add do
    begin
      respSeg := rsTomadorServico;
      xSeg := qryCteXSEG.Value;
      nApol := qryCteNAPOLICE.Value;
    end;

    { Carrega Informacoes do Modal }
    { Rodoviario }

    infCTeNorm.rodoOS.TAF := qryCteTAF.AsString;
    infCTeNorm.rodoOS.NroRegEstadual := qryCteNROREGESTADUAL.AsString;
    infCTeNorm.rodoOS.infFretamento.tpFretamento := TtpFretamento(1);
    infCTeNorm.rodoOS.infFretamento.dhViagem := now;

    // responsavel tecnico 22-03-2019
    if dados.qryEmpresaRESPONSAVEL_TECNICO.Value = 'S' then
    begin

      dados.qryRespTecnico.Close;
      dados.qryRespTecnico.Open;

      infRespTec.CNPJ := TiraPontos(dados.qryRespTecnicoCNPJ.Value);
      infRespTec.xContato := dados.qryRespTecnicoNOME.Value;
      infRespTec.email := dados.qryRespTecnicoEMAIL.Value;
      infRespTec.fone := TiraPontos(dados.qryRespTecnicoTELEFONE.Value);
      infRespTec.hashCSRT := dados.qryRespTecnicoCSRT.Value;
    end;

    { Carega inf veiculos do modal rodo 0-1 }
    qryTransp.Close;
    qryTransp.Params[0].Value := qryCteFKTRANSPORTADOR.Value;
    qryTransp.Open;

    with infCTeNorm.rodoOS.veic do
    begin
      placa := qryTranspPLACA.Value;
      RENAVAM := qryTranspRENAVAM.Value;
      UF := qryTranspUFPLACA.Value;
    end;
  end;
end;

procedure TfrmConsCTe.btnCorrecaoClick(Sender: TObject);
begin
  try
    btnCorrecao.Enabled := false;
    if (qryCorrecao.State in dsEditmodes) then
      qryCorrecao.Post;
    dados.Conexao.CommitRetaining;

    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCteXML.Value);
    dmCTe.ACBrCTe.EventoCTe.Evento.Clear;

    with dmCTe.ACBrCTe.EventoCTe.Evento.New do
    begin
      // Para o Evento de CCe: nSeqEvento varia de 1 até 20 por CT-e
      infEvento.nSeqEvento := 1;
      infEvento.chCTe := copy(dmCTe.ACBrCTe.Conhecimentos.Items[0]
        .CTe.infCTe.Id, 4, 44);
      infEvento.CNPJ := TiraPontos(dados.qryEmpresaCNPJ.Value);
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCCe;

      infEvento.detEvento.xCondUso := '';

      dmCTe.ACBrCTe.EventoCTe.Evento.Items[0]
        .infEvento.detEvento.infCorrecao.Clear;

      with dmCTe.ACBrCTe.EventoCTe.Evento.Items[0]
        .infEvento.detEvento.infCorrecao.New do
      begin
        grupoAlterado := qryCorrecaoGRUPO.Value;
        campoAlterado := qryCorrecaoCAMPO.Value;
        valorAlterado := qryCorrecaoVALOR.Value;
        nroItemAlterado := 1;
      end;
    end;

    if dmCTe.ACBrCTe.EnviarEvento(1) then
      dmCTe.ACBrCTe.ImprimirEvento;

  finally
    btnCorrecao.Enabled := true;
  end;
end;

procedure TfrmConsCTe.btnFecharClick(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmConsCTe.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmConsCTe.btnGerarClick(Sender: TObject);
begin
  dmCTe.ConfiguraCTe;
  dmCTe.ACBrCTe.Conhecimentos.Clear;
  dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCteXML.Value);
  dmCTe.ACBrCTe.Conhecimentos.Items[0].GravarXML();
  dmCTe.ACBrCTe.Conhecimentos.Items[0].ImprimirPDF;
end;

procedure TfrmConsCTe.btnImprimirClick(Sender: TObject);
begin
  try
    btnImprimir.Enabled := false;

    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCteXML.Value);
    dmCTe.ACBrCTe.Conhecimentos.Imprimir;

  finally
    btnImprimir.Enabled := true;
  end;

end;

procedure TfrmConsCTe.btnInutilizaClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  dmCTe.ConfiguraCTe;
  TabCarta.TabVisible := false;
  TabInutilizar.TabVisible := true;
  PagUtilidade.Visible := true;
  PagUtilidade.ActivePage := TabInutilizar;

  DecodeDate(date, ano, mes, dia);
  edtModelo.Text := qryCteMODELO.AsString;
  edtSerie.Text := dados.qryConfigCTE_SERIE.Value;
  edtAno.Text := IntToStr(ano);
  edtJustificativa.Text := 'QUEBRA DE SEQUÊNCIA DE NUMERAÇÃO';

end;

procedure TfrmConsCTe.btnInutilizarClick(Sender: TObject);
begin
  try
    btnInutilizar.Enabled := false;
    if dmCTe.ACBrCTe.Inutilizar(TiraPontos(dados.qryEmpresaCNPJ.Value),
      edtJustificativa.Text, StrToInt(edtAno.Text), StrToInt(edtSerie.Text),
      StrToInt(edtInicial.Text), StrToInt(edtFinal.Text)) then
    begin
      ShowMessage('Inutlização realizada com sucesso!');
      PagUtilidade.Visible := false;
      dmCTe.ACBrCTe.ImprimirEvento;
      exit;
    end;
  finally
    btnInutilizar.Enabled := false;
  end;
end;

procedure TfrmConsCTe.btnNovoClick(Sender: TObject);
begin
  operacao := 1;
  try
    btnNovo.Enabled := false;
    frmCadCTeOS := TfrmCadCTeOS.Create(Application);

    frmCadCTeOS.qryCte.Close;
    frmCadCTeOS.qryCte.Params[0].Value := -1;
    frmCadCTeOS.qryCte.Open;

    frmCadCTeOS.qryCte.Insert;

    frmCadCTeOS.qryCteCODIGO.Value := dados.Numerador('CTE_MASTER', 'CODIGO',
      'N', '', '');
    frmCadCTeOS.qryCteFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryExecute.Close;
    dados.qryExecute.SQL.Text :=
      'SELECT MAX(NUMERO) qtd FROM CTE_MASTER WHERE SERIE=:SERIE AND FKEMPRESA=:EMPRESA';
    dados.qryExecute.Params[0].Value := dados.qryConfigCTE_SERIE.Value;
    dados.qryExecute.Params[1].Value := frmCadCTeOS.qryCteFKEMPRESA.Value;
    dados.qryExecute.Open;

    frmCadCTeOS.qryCteNUMERO.Value := dados.qryExecute.Fields[0].AsInteger + 1;

    frmCadCTeOS.qryCteSITUACAO.Value := '1';
    frmCadCTeOS.qryCteDATA.Value := date;
    frmCadCTeOS.qryCteHORA.Value := time;
    frmCadCTeOS.qryCteNROREGESTADUAL.Value := '';
    frmCadCTeOS.qryCteTAF.Value := '454545445454';
    frmCadCTeOS.qryCteTOTAL.Value := 0;
    frmCadCTeOS.qryCteFINALIDADE.Value := 0;
    frmCadCTeOS.qryCteRECEBIDO.Value := 0;
    frmCadCTeOS.qryCteVPIS.Value := 0;
    frmCadCTeOS.qryCteVCOFINS.Value := 0;
    frmCadCTeOS.qryCteVINSS.Value := 0;
    frmCadCTeOS.qryCteVIR.Value := 0;
    frmCadCTeOS.qryCteVCLSS.Value := 0;
    frmCadCTeOS.qryCteVTOTTIRB.Value := 0;
    frmCadCTeOS.qryCteVIR.Value := 0;
    frmCadCTeOS.qryCteMODELO.Value := 67;
    frmCadCTeOS.qryCteTIPOSERVICO.Value := 5;
    frmCadCTeOS.qryCteRESPSEG.Value := 0;
    frmCadCTeOS.qryCteDOCUMENTO.Value := 'N';

    frmCadCTeOS.qryCteSERIE.Value := dados.qryConfigCTE_SERIE.AsInteger;
    frmCadCTeOS.ShowModal;
  finally
    frmCadCTeOS.Release;
    btnFiltrar.Click;
    btnNovo.Enabled := true;
  end;
end;

procedure TfrmConsCTe.btnRecuperarClick(Sender: TObject);
begin
  try

    dmCTe.ConfiguraCTe;

    btnRecuperar.Enabled := false;
    operacao := 1;

    dmCTe.ACBrCTe.Conhecimentos.Clear;
    dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCteXML.Value);
    dmCTe.ACBrCTe.Consultar;

    if dmCTe.ACBrCTe.WebServices.Consulta.cStat = 100 then
    begin

      qryCte.edit;
      qryCteCHAVE.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
        .CTe.procCTe.chCTe;
      qryCteXML.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].XML;
      qryCtePROTOCOLO.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
        .CTe.procCTe.nProt;
      qryCteSITUACAO.Value := '2';
      qryCteDATA.Value := date;
      qryCteHORA.Value := now;
      qryCte.Post;
      dados.Conexao.CommitRetaining;

      dmCTe.ACBrCTe.Conhecimentos.GravarXML();

      dmCTe.ACBrCTe.Conhecimentos.Imprimir;
      dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;

      Application.ProcessMessages;
      ShowMessage('CTe Recuperado com sucesso!');
    end
    else
    begin
      Application.ProcessMessages;
      ShowMessage('Status:' + #13 +
        IntToStr(dmCTe.ACBrCTe.WebServices.Consulta.cStat) + '-' +
        dmCTe.ACBrCTe.WebServices.Consulta.XMotivo);
    end;
  finally
    btnRecuperar.Enabled := true;
    btnFiltrar.Click;
  end;
end;

procedure TfrmConsCTe.btnSairCorrecaoClick(Sender: TObject);
begin
  qryCorrecao.Cancel;
  PagUtilidade.Visible := false;
  Application.ProcessMessages;
end;

procedure TfrmConsCTe.btnTransmitirClick(Sender: TObject);
begin

  dmCTe.ConfiguraCTe;

  if qryCteSITUACAO.Value <> '1' then
  begin
    ShowMessage('Cte não está Aberto!');
    exit;
  end;
  if (dados.qryConfig.IsEmpty) then
  begin
    ShowMessage('Configure os parametros para emissão do CT-e!');
    exit;
  end;
  try
    try

      if not(qryCteCHAVE.IsNull) and (trim(qryCteCHAVE.Value) <> '') and
        (length(qryCteCHAVE.Value) = 44) then
      begin
        dmCTe.ACBrCTe.Conhecimentos.Clear;
        dmCTe.ACBrCTe.WebServices.Consulta.CTeChave := qryCteCHAVE.Value;
        dmCTe.ACBrCTe.WebServices.Consulta.Executar;
        if dmCTe.ACBrCTe.WebServices.Consulta.cStat = 100 then
        begin
          if not(qryCte.State in dsEditmodes) then
            qryCte.edit;
          qryCteSITUACAO.Value := '4';
          qryCte.Post;
          dados.Conexao.CommitRetaining;
          ShowMessage('CT-e Já Transmitida!');
          exit;
        end;
      end;

      CTE_OS;
      if dmCTe.ACBrCTe.Enviar(1, false) then
      begin

        qryCte.edit;
        qryCteCHAVE.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
          .CTe.procCTe.chCTe;
        qryCteXML.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0].XML;
        qryCtePROTOCOLO.Value := dmCTe.ACBrCTe.Conhecimentos.Items[0]
          .CTe.procCTe.nProt;
        qryCteSITUACAO.Value := '2';
        qryCteDATA.Value := date;
        qryCteHORA.Value := now;
        qryCte.Post;
        dados.Conexao.CommitRetaining;
        dmCTe.ACBrCTe.Conhecimentos.Items[0].GravarXML();
        dados.Conexao.CommitRetaining;
      end;
    except
      on e: Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    // btnTransmitir.Enabled := true;
  end;

end;

procedure TfrmConsCTe.btnWhatsClick(Sender: TObject);
var
  arquivo: string;
  FFone: String;
begin

  if qryCte.IsEmpty then
    exit;

  if trim(qryCteXML.AsString) = '' then
    exit;

  dmCTe.ConfiguraCTe;
  dmCTe.ACBrCTe.Conhecimentos.Clear;
  dmCTe.ACBrCTe.Conhecimentos.LoadFromString(qryCteXML.Value);
  arquivo := dmCTe.ACBrCTe.DACTE.PathPDF + qryCteCHAVE.Value + '-cte.PDF';

  if not FilesExists(arquivo) then
    dmCTe.ACBrCTe.Conhecimentos.ImprimirPDF;

  if FileExists(arquivo) then
  begin

    FFone := InputBox('Digite o numero do whatsapp', 'Número:', '');
    if length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    dados.InsereMensagemZap(arquivo, FFone,
      'Conforme solicitado, segue DACTE do CTe Número:' + qryCteNUMERO.AsString,
      '', '', dados.qryEmpresaRAZAO.AsString, 'CTE');
  end;

end;

procedure TfrmConsCTe.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.40);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.08);
end;

procedure TfrmConsCTe.DBGrid1DblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmConsCTe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TfrmConsCTe.DBGrid1TitleClick(Column: TColumn);
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
    vOrdem := ' DESC';

  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Data';
  DBGrid1.Columns[2].Title.Caption := 'Chave';
  DBGrid1.Columns[3].Title.Caption := 'Protocolo';
  DBGrid1.Columns[4].Title.Caption := 'Total';
  DBGrid1.Columns[5].Title.Caption := 'Situação';

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

procedure TfrmConsCTe.dsCTeDataChange(Sender: TObject; Field: TField);
begin
  btnTransmitir.Enabled := qryCteSITUACAO.Value = '1';
  btnAlterar.Enabled := qryCteSITUACAO.Value = '1';
  btnGerar.Enabled := qryCteSITUACAO.Value = '2';
  btnCancelar.Enabled := qryCteSITUACAO.Value = '2';
  btnImprimir.Enabled := qryCteSITUACAO.Value = '2';
end;

procedure TfrmConsCTe.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmConsCTe.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryCte.Prior;
  if Key = VK_DOWN then
    qryCte.Next;
end;

procedure TfrmConsCTe.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmConsCTe.FormCreate(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  vOrdem := ' ASC';
  DecodeDate(date, ano, mes, dia);
  maskInicio.EditText := '01' + '/' + FormatFloat('00', mes) + '/' +
    IntToStr(ano);
  maskFim.EditText := datetostr(date);


end;

procedure TfrmConsCTe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnNovo.Click;
  if Key = vk_f3 then
    btnAlterar.Click;
  if Key = vk_f4 then
    btnTransmitir.Click;
  if Key = vk_f5 then
    btnInutiliza.Click;
  if Key = vk_f6 then
    btnCancelar.Click;
  if Key = vk_f7 then
    btnRecuperar.Click;
  if Key = vk_f8 then
    BtnCCe.Click;
  if Key = vk_f9 then
    btnGerar.Click;
  if Key = vk_f10 then
    btnImprimir.Click;
  if Key = vk_f11 then
    btnWhats.Click;
  if Key = vk_f12 then
    maskInicio.SetFocus;

end;

procedure TfrmConsCTe.FormShow(Sender: TObject);
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

  if not dados.qryTerminal.Locate('nome', Getcomputer, []) then
  begin
    ShowMessage('Terminal não cadastrado!');
  end;

  tamanho;
  maskInicio.EditText := datetostr(StartOfTheMonth(date));
  maskFim.EditText := datetostr(date);
  DBGrid1TitleClick(DBGrid1.Columns[0]);
  qryCte.Last;
  edtLoc.SetFocus;

end;

procedure TfrmConsCTe.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  vSql := ' select CTe.* from CTE_MASTER CTe  ' + ' where ' +
    ' situacao in (''1'',''2'',''3'',''4'',''5'') ' + ' /*where*/ ';

  filtro := filtro + ' and CTE.fkempresa=' + dados.qryEmpresaCODIGO.AsString;

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
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cte.chave like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cte.protocolo like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cte.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case idx of
    0:
      ordem := ' order by numero ' + vOrdem;
    1:
      ordem := ' order by data ' + vOrdem;
    2:
      ordem := ' order by chave ' + vOrdem;
    3:
      ordem := ' order by protocolo ' + vOrdem;
    4:
      ordem := ' order by total ' + vOrdem;
    5:
      ordem := ' order by situacao ' + vOrdem;

  end;

  qryCte.Close;

  qryCte.SQL.Text := vSql;
  qryCte.SQL.Text := StringReplace(qryCte.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryCte.Open;
end;

procedure TfrmConsCTe.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;

end;

procedure TfrmConsCTe.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmConsCTe.qryCteCalcFields(DataSet: TDataSet);
begin
  if qryCteSITUACAO.Value = '1' then
    qryCteVIRTUAL_SITUACAO.Value := 'ABERTA';
  if qryCteSITUACAO.Value = '2' then
    qryCteVIRTUAL_SITUACAO.Value := 'TRANSMITIDA';
  if qryCteSITUACAO.Value = '3' then
    qryCteVIRTUAL_SITUACAO.Value := 'CANCELADA';
  if qryCteSITUACAO.Value = '4' then
    qryCteVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryCteSITUACAO.Value = '5' then
    qryCteVIRTUAL_SITUACAO.Value := 'INUTILIZADA';
  if qryCteSITUACAO.Value = '6' then
    qryCteVIRTUAL_SITUACAO.Value := 'DENEGADA';

end;

procedure TfrmConsCTe.TabControl1Change(Sender: TObject);
begin
  localiza;
end;

end.
