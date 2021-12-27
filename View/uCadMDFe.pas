unit uCadMDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, pmdfeConversaoMDFe, pcnConversao, acbrUtil,
  blcksock, ACBrDFeSSL, System.math, acbrDFEUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab,
  ACBrDFe, ACBrMail, Vcl.Grids, Vcl.DBGrids,
  ACBrMDFe, ACBrMDFeDAMDFeRLClass, ACBrDFeReport, ACBrMDFeDAMDFeClass,
  JvExDBGrids, JvDBGrid, Vcl.Menus;

type
  TfrmCadMDFe = class(TForm)
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnTransmitir: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    ACBrEnterTab1: TACBrEnterTab;
    btnImprimir: TSpeedButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    qryMDFE_M: TFDQuery;
    dsMDFe_M: TDataSource;
    dsMDFE_D: TDataSource;
    qryMDFE_D: TFDQuery;
    qryTransp: TFDQuery;
    btnGravar: TSpeedButton;
    Label3: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label9: TLabel;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    Label25: TLabel;
    qryVeiculo: TFDQuery;
    qryVeiculoPLACA: TStringField;
    qryVeiculoDESCRICAO: TStringField;
    qryVeiculoMUNICIPIO: TStringField;
    qryVeiculoUF: TStringField;
    qryVeiculoRENAVAM: TStringField;
    qryVeiculoRNTC: TStringField;
    qryVeiculoTIPO: TIntegerField;
    qryVeiculoATIVO: TStringField;
    qryVeiculo_Reboque: TFDQuery;
    qryVeiculo_ReboqueCODIGO: TIntegerField;
    qryVeiculo_ReboquePLACA_CAVALO: TStringField;
    qryVeiculo_ReboquePLACA: TStringField;
    qryVeiculo_ReboqueMUNICIPIO: TStringField;
    qryVeiculo_ReboqueUF: TStringField;
    qryVeiculo_ReboqueRNTC: TStringField;
    qryVeiculo_ReboqueRENAVAM: TStringField;
    qryVeiculo_ReboqueTIPO: TIntegerField;
    qryVeiculo_ReboqueCARROCERIA: TSmallintField;
    dsReboque: TDataSource;
    qryESOrigem: TFDQuery;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    qryESOrigemCODIGO: TIntegerField;
    qryESOrigemDESCRICAO: TStringField;
    qryESDestino: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qryUFOrigem: TFDQuery;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    DBComboBoxEh2: TDBComboBoxEh;
    DBComboBoxEh3: TDBComboBoxEh;
    dsTransp: TDataSource;
    btnVeiculo: TSpeedButton;
    btnTransp: TSpeedButton;
    dsVeiculo: TDataSource;
    qryVeiculoCARROCERIA: TIntegerField;
    Label4: TLabel;
    DBComboBoxEh6: TDBComboBoxEh;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    qryPercurso: TFDQuery;
    dsPercurso: TDataSource;
    qryMDFE_MFK_TRANSPORTADOR: TIntegerField;
    qryMDFE_MNUMERO_MDFE: TIntegerField;
    qryMDFE_MDATA: TDateField;
    qryMDFE_MID_MUNICIPIO: TStringField;
    qryMDFE_MUF_INICIO: TStringField;
    qryMDFE_MUF_FIM: TStringField;
    qryMDFE_MUNIDADE_CARGA: TStringField;
    qryMDFE_MFK_EMPRESA: TSmallintField;
    qryMDFE_MINFCPL: TMemoField;
    qryMDFE_MINFADFISCO: TMemoField;
    qryMDFE_MCHAVE: TStringField;
    qryMDFE_MPROTOCOLO: TStringField;
    qryMDFE_MXML: TMemoField;
    qryMDFE_MDATA_EMISSAO: TDateField;
    qryMDFE_MSITUACAO: TStringField;
    qryMDFE_MRESP_SEGURO: TSmallintField;
    qryMDFE_MTIPO_MDFE: TStringField;
    qryMDFE_MTIPO: TStringField;
    qryMDFE_MNOME_SEGURADORA: TStringField;
    qryMDFE_MCPF_SEGURADORA: TStringField;
    qryMDFE_MNUMERO_APOLICE: TStringField;
    qryMDFE_DCODIGO: TIntegerField;
    qryMDFE_DFK_MDFE_MASTER: TIntegerField;
    qryMDFE_DCHAVE: TStringField;
    qryMDFE_DNUMERO: TIntegerField;
    qryMDFE_DFK_DESTINATARIO: TIntegerField;
    qryMDFE_DFK_EMPRESA: TIntegerField;
    qryMDFE_DFK_USUARIO: TIntegerField;
    qryDestinatario: TFDQuery;
    qryDestinatarioCODIGO: TIntegerField;
    qryDestinatarioNOME: TStringField;
    qryDestinatarioENDERECO: TStringField;
    qryDestinatarioBAIRRO: TStringField;
    qryDestinatarioID_CIDADE: TIntegerField;
    qryDestinatarioCIDADE: TStringField;
    qryDestinatarioCEP: TStringField;
    qryDestinatarioUF: TStringField;
    qryDestinatarioPESSOA: TStringField;
    qryDestinatarioCNPJ: TStringField;
    qryDestinatarioIE: TStringField;
    qryDestinatarioFONE: TStringField;
    qryDestinatarioFK_EMPRESA: TIntegerField;
    qryDestinatarioFK_USUARIO: TIntegerField;
    qryDestinatarioATIVO: TIntegerField;
    qryDestinatarioNUMERO: TStringField;
    qryMDFE_DVIRTUAL_DESTINATARIO: TStringField;
    btnPessoas: TSpeedButton;
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label37: TLabel;
    DBGridEh1: TDBGridEh;
    PageControl3: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh2: TDBGridEh;
    qryMDFE_MVIRTUAL_SITUACAO: TStringField;
    qryMDFE_MPLACA: TStringField;
    qryMDFE_MVIRTUAL_PLACA: TStringField;
    qryMDFE_MID_ORIGEM: TIntegerField;
    qryMDFE_MID_DESTINO: TIntegerField;
    qryMDFE_MVIRTUAL_ORIGEM: TStringField;
    qryMDFE_MVIRTUAl_DESTINO: TStringField;
    qryMDFE_MVIRTUAL_EMPRESA: TStringField;
    qryPercursoCODIGO: TIntegerField;
    qryPercursoFK_MDFE_MASTER: TIntegerField;
    qryMDFE_MCARGA_PROPRIA: TStringField;
    qryMDFE_MCNPJ_RESPONSAVEL: TStringField;
    qryMDFE_MNUMERO_AVERBACAO: TStringField;
    qryPercursoUF: TStringField;
    qryMDFE_MSERIE: TIntegerField;
    Label10: TLabel;
    DBComboBoxEh4: TDBComboBoxEh;
    qryPesquisaMDFe: TFDQuery;
    qryPesquisaMDFeCODIGO: TIntegerField;
    DBEdit9: TDBEdit;
    qryMDFE_DVALOR: TFMTBCDField;
    qryMDFE_DPESO: TFMTBCDField;
    qryMDFE_MCODIGO: TIntegerField;
    qryMDFE_MQTD_CTE: TIntegerField;
    qryMDFE_MVALOR_CARGA: TFMTBCDField;
    qryMDFE_MQTD_CARGA: TFMTBCDField;
    qryVeiculoTARA: TFMTBCDField;
    qryVeiculoPESO: TFMTBCDField;
    qryVeiculo_ReboquePESO: TFMTBCDField;
    qryVeiculo_ReboqueTARA: TFMTBCDField;
    qryMDFe_D_Cidade: TFDQuery;
    qryMDFe_D_CidadeCODIGO: TIntegerField;
    qryMDFe_D_CidadeCHAVE: TStringField;
    qryMDFe_D_CidadeID_CIDADE: TIntegerField;
    qryCidade: TFDQuery;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    qryMDFe_D_CidadeCIDADE: TStringField;
    qryESOrigemUF: TStringField;
    qryESDestinoUF: TStringField;
    qryCidadeUF: TStringField;
    dsESDestino: TDataSource;
    dsEsOrigem: TDataSource;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    DBMemoEh2: TDBMemoEh;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label27: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label11: TLabel;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit6: TDBEdit;
    qryMDFE_MNUMEROAVERBACAO: TStringField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    qryMotorista: TFDQuery;
    dsMotorista: TDataSource;
    qryMotoristaCODIGO: TIntegerField;
    qryMotoristaNOME: TStringField;
    qryMotoristaCPF: TStringField;
    qryMDFE_MFK_MOTORISTA: TIntegerField;
    qryTranspCODIGO: TIntegerField;
    qryTranspPESSOA: TStringField;
    qryTranspCNPJ: TStringField;
    qryTranspIE: TStringField;
    qryTranspNOME: TStringField;
    qryTranspAPELIDO: TStringField;
    qryTranspENDERECO: TStringField;
    qryTranspNUMERO: TStringField;
    qryTranspBAIRRO: TStringField;
    qryTranspCIDADE: TStringField;
    qryTranspUF: TStringField;
    qryTranspCEP: TStringField;
    btnImportar: TSpeedButton;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    DBComboBoxEh7: TDBComboBoxEh;
    qryMDFE_MPRODUTO_PREDOMINANTE: TStringField;
    qryMDFE_MTIPO_CARGA: TIntegerField;
    qryMDFE_MCOD_BARRA: TStringField;
    qryMDFE_MNCM: TStringField;
    JvDBGrid1: TJvDBGrid;
    dsMDFe_Seguradora: TDataSource;
    qryMDFe_Seguradora: TFDQuery;
    qryMDFe_SeguradoraCODIGO: TIntegerField;
    qryMDFe_SeguradoraFK_MDFE: TIntegerField;
    qryMDFe_SeguradoraRESPONSAVEL: TStringField;
    qryMDFe_SeguradoraNOME: TStringField;
    qryMDFe_SeguradoraCNPJ: TStringField;
    qryMDFe_SeguradoraAPOLICE: TStringField;
    qryMDFe_SeguradoraAVERBACAO: TStringField;
    qryMDFe_SeguradoraVALOR_SEGURADO: TFMTBCDField;
    TabSheet4: TTabSheet;
    JvDBGrid2: TJvDBGrid;
    DBText1: TDBText;
    qryMdfe_averbacaco: TFDQuery;
    dsMdfe_Averbacao: TDataSource;
    qryMdfe_averbacacoCODIGO: TIntegerField;
    qryMdfe_averbacacoFK_MDFE_SEGURADORA: TIntegerField;
    qryMdfe_averbacacoAVERBACAO: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure qryMDFE_MAfterOpen(DataSet: TDataSet);
    procedure qryMDFE_DBeforeInsert(DataSet: TDataSet);
    procedure qryMDFE_MAfterPost(DataSet: TDataSet);
    procedure qryMDFE_MAfterDelete(DataSet: TDataSet);
    procedure qryMDFE_DAfterDelete(DataSet: TDataSet);
    procedure qryMDFE_DAfterPost(DataSet: TDataSet);
    procedure qryMDFE_MCalcFields(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure QryFaturaAfterPost(DataSet: TDataSet);
    procedure QryFaturaAfterDelete(DataSet: TDataSet);
    procedure DBGridEh2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh2Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure dsMDFe_MDataChange(Sender: TObject; Field: TField);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure qryMDFE_MAfterEdit(DataSet: TDataSet);
    procedure qryMDFE_DAfterEdit(DataSet: TDataSet);
    procedure qryMDFE_MAfterInsert(DataSet: TDataSet);
    procedure DBComboBoxEh3Exit(Sender: TObject);
    procedure DBComboBoxEh2Exit(Sender: TObject);
    procedure btnTranspClick(Sender: TObject);
    procedure btnVeiculoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPessoasClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure qryMDFE_MBeforePost(DataSet: TDataSet);
    procedure btnImportarClick(Sender: TObject);
    procedure qryPercursoNewRecord(DataSet: TDataSet);
    procedure qryMDFE_DNewRecord(DataSet: TDataSet);
    procedure qryPercursoBeforePost(DataSet: TDataSet);
    procedure DBMemoEh1Enter(Sender: TObject);
    procedure DBMemoEh1Exit(Sender: TObject);
    procedure DBMemoEh2Exit(Sender: TObject);
    procedure DBMemoEh2Enter(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure qryMDFE_MNewRecord(DataSet: TDataSet);
    procedure qryMDFe_SeguradoraBeforePost(DataSet: TDataSet);
    procedure qryMDFe_SeguradoraNewRecord(DataSet: TDataSet);
    procedure qryMDFe_SeguradoraAfterPost(DataSet: TDataSet);
    procedure qryMDFe_SeguradoraAfterDelete(DataSet: TDataSet);
    procedure dsMDFe_SeguradoraDataChange(Sender: TObject; Field: TField);
    procedure qryMdfe_averbacacoBeforeInsert(DataSet: TDataSet);
    procedure qryMdfe_averbacacoBeforePost(DataSet: TDataSet);
    procedure qryMdfe_averbacacoNewRecord(DataSet: TDataSet);
  private
    vSql: string;
    procedure estado;
    function ValidaNegocios: boolean;
    procedure GerarMDFE;
    procedure SelecionaOrigem;
    procedure SelecionaDestino;
    procedure GetNumero;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMDFe: TfrmCadMDFe;

implementation

{$R *.dfm}

uses Udados, uDestinatario, uCadTransp, uVeiculos, uImportarMDFe,
  ufrmStatus, uDadosWeb, uDmMDFE;

procedure TfrmCadMDFe.SelecionaOrigem;
begin
  if qryMDFE_M.Active then
  begin
    qryESOrigem.Close;
    qryESOrigem.Open;
  end;
end;

procedure TfrmCadMDFe.SelecionaDestino;
begin
  if qryMDFE_M.Active then
  begin
    qryESDestino.Close;
    qryESDestino.Open;
  end;
end;

procedure TfrmCadMDFe.GetNumero;
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'SELECT MAX(NUMERO_MDFE) qtd FROM MDFE_MASTER WHERE SERIE=:SERIE AND FK_EMPRESA=:EMPRESA';
  dados.qryExecute.Params[0].Value := qryMDFE_MSERIE.Value;
  dados.qryExecute.Params[1].Value := qryMDFE_MFK_EMPRESA.Value;
  dados.qryExecute.Open;
  if dados.qryExecute.Fields[0].AsInteger = 0 then
    qryMDFE_MNUMERO_MDFE.Value := StrToIntDef(qryMDFE_MNUMERO_MDFE.AsString, 1)
  else
    qryMDFE_MNUMERO_MDFE.Value := dados.qryExecute.Fields[0].AsInteger + 1;
end;

procedure TfrmCadMDFe.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadMDFe.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadMDFe.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadMDFe.QryFaturaAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.QryFaturaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

function TfrmCadMDFe.ValidaNegocios: boolean;
var
  Msg: String;
  Inicio: TDateTime;
  Ok: boolean;
  Tempo: String;
begin
  Result := true;
  Inicio := Now;
  Ok := DmMDFe.ACBrMDFe.Manifestos.ValidarRegrasdeNegocios(Msg);
  Tempo := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

  if not Ok then
  begin
    Result := false;
    showMessage('Erros encontrados' + #13 + Msg + #13 + sLineBreak + #13 +
      'Tempo: ' + Tempo);
  end;
end;

procedure TfrmCadMDFe.btnGravarClick(Sender: TObject);
begin
  try
    if (qryMDFE_M.State IN dsEditmodes) then
      qryMDFE_M.Post;

    if (qryPercurso.State IN dsEditmodes) then
      if Trim(qryPercursoUF.Value) <> '' then
        qryPercurso.Post;

    if qryMDFE_D.IsEmpty then
    begin
      showMessage('Informe os itens da NF-e');
      exit;
    end;

    if (qryMDFE_MPLACA.IsNull) or (Trim(qryMDFE_MPLACA.Value) = '') then
    begin
      showMessage('Informe a Placa');
      exit;
    end;

    if (qryMDFE_MPLACA.IsNull) or (Trim(qryMDFE_MPLACA.Value) = '') then
    begin
      showMessage('Informe a Unidade de Carga');
      exit;
    end;

    if (qryMDFE_MUF_INICIO.IsNull) or (Trim(qryMDFE_MUF_INICIO.Value) = '') then
    begin
      showMessage('Informe a UF de Origem!');
      exit;
    end;

    if (qryMDFE_MUF_FIM.IsNull) or (Trim(qryMDFE_MUF_FIM.Value) = '') then
    begin
      showMessage('Informe a UF de Destino!');
      exit;
    end;

    if (qryMDFE_MPRODUTO_PREDOMINANTE.IsNull) or
      (Trim(qryMDFE_MPRODUTO_PREDOMINANTE.Value) = '') then
    begin
      showMessage('Informe o Produto Predominante');
      exit;
    end;

    btnGravar.Enabled := false;
  finally
    // btnGravar.Enabled := true;
  end;
  showMessage('MDFe gravado com sucesso!');
  btnTransmitir.Enabled := true;
  Application.ProcessMessages;

end;

procedure TfrmCadMDFe.btnImportarClick(Sender: TObject);
begin
  try
    frmImportarmdfe := TfrmImportarmdfe.Create(Application);
    frmImportarmdfe.ShowModal;
  except
    frmImportarmdfe.Release;

    SelecionaOrigem;
    SelecionaDestino;

    qryDestinatario.Close;
    qryDestinatario.Open;

    qryMDFE_D.Close;
    qryMDFE_D.Open;

  end;
end;

procedure TfrmCadMDFe.btnImprimirClick(Sender: TObject);
begin
  if (qryMDFE_MSITUACAO.Value = 'T') then
  begin
    DmMDFe.ACBrMDFe.Manifestos.Clear;
    DmMDFe.ACBrMDFe.Manifestos.LoadFromString(qryMDFE_MXML.Value);
    DmMDFe.ACBrMDFe.Manifestos.Imprimir;
    DmMDFe.ACBrMDFe.DAMDFe.PathPDF := dados.qryConfigMDFE_PATH_MDFE.Value;

    DmMDFe.ACBrMDFe.Manifestos.ImprimirPDF;
    DmMDFe.ACBrMDFe.Manifestos.GravarXML();
  end;
end;

procedure TfrmCadMDFe.btnPessoasClick(Sender: TObject);
begin
  try
    frmDestinatario := TfrmDestinatario.Create(Application);
    frmDestinatario.localiza;
    frmDestinatario.ShowModal;
  finally
    frmDestinatario.Release;
    qryDestinatario.Close;
    qryDestinatario.Open;
  end;
end;

procedure TfrmCadMDFe.btnSairClick(Sender: TObject);
begin
  if Application.messageBox('Tem Certeza de que deseja sair da tela?',
    'Confirmação', mb_YesNo) = mrYes then
    Close;
end;

procedure TfrmCadMDFe.GerarMDFE;
var
  i: integer;
  Ok: boolean;
  PathMensal: String;
  FResponsavel: integer;
begin
  with DmMDFe.ACBrMDFe.Manifestos.Add.MDFe do
  begin
    // Dados de Identificação do MDF-e
    Ide.cUF := dados.qryEmpresaID_UF.Value;
    if dados.qryConfigAMBIENTE.Value = 0 then
      Ide.tpAmb := taProducao;
    if dados.qryConfigAMBIENTE.Value = 1 then
      Ide.tpAmb := taHomologacao;

    if qryMDFE_MTIPO_MDFE.Value = 'NFE' then
      Ide.tpEmit := teTranspCargaPropria
    else
      Ide.tpEmit := teTransportadora;
    Ide.modelo := '58';
    Ide.serie := dados.qryConfigMDFE_SERIE.AsInteger;
    Ide.nMDF := StrToIntDef(qryMDFE_MNUMERO_MDFE.AsString, 0);
    Ide.cMDF := GerarCodigoDFe(Ide.nMDF);
    Ide.modal := moRodoviario;
    Ide.dhEmi := Now;
    Ide.tpEmis := teNormal;
    if qryMDFE_MTIPO.Value = 'NENHUM' then
      Ide.tpTransp := ttNenhum;
    if qryMDFE_MTIPO.Value = 'TAC' then
      Ide.tpTransp := ttTAC;
    if qryMDFE_MTIPO.Value = 'ETC' then
      Ide.tpTransp := ttETC;
    if qryMDFE_MTIPO.Value = 'CTC' then
      Ide.tpTransp := ttCTC;

    Ide.procEmi := peAplicativoContribuinte;
    Ide.verProc := '1.0';
    Ide.UFIni := qryMDFE_MUF_INICIO.Value;
    Ide.UFFim := qryMDFE_MUF_FIM.Value;

    // Informa o percurso
    qryPercurso.First;
    while not qryPercurso.Eof do
    begin
      Ide.infPercurso.Add.UFPer := qryPercursoUF.AsString;
      qryPercurso.Next;
    end;

    // informa a origem do carregamento

    with Ide.infMunCarrega.Add do
    begin
      cMunCarrega := qryMDFE_MID_ORIGEM.AsInteger;
      xMunCarrega := qryMDFE_MVIRTUAL_ORIGEM.Value;
    end;

    // Dados do Emitente
    Emit.CNPJCPF := TiraPontos(dados.qryEmpresaCNPJ.Value);
    Emit.IE := dados.qryEmpresaIE.Value;
    Emit.xNome := dados.qryEmpresaRAZAO.Value;
    Emit.xFant := dados.qryEmpresaFANTASIA.Value;
    Emit.EnderEmit.xLgr := dados.qryEmpresaENDERECO.Value;
    Emit.EnderEmit.nro := dados.qryEmpresaNUMERO.Value;
    Emit.EnderEmit.xCpl := dados.qryEmpresaCOMPLEMENTO.Value;
    Emit.EnderEmit.xBairro := dados.qryEmpresaBAIRRO.Value;
    Emit.EnderEmit.cMun := dados.qryEmpresaID_CIDADE.Value;
    Emit.EnderEmit.xMun := dados.qryEmpresaCIDADE.Value;
    Emit.EnderEmit.CEP := strtoinT(TiraPontos(dados.qryEmpresaCEP.Text));
    Emit.EnderEmit.UF := dados.qryEmpresaUF.Text;
    Emit.EnderEmit.fone := dados.qryEmpresaFONE.Text;

    // dados do cavalo

    qryVeiculo.Close;
    qryVeiculo.Open;

    if qryVeiculo.Locate('PLACA', qryMDFE_MPLACA.Value, []) then
    begin
      rodo.CIOT := '';
      rodo.veicTracao.cInt := '001';
      rodo.veicTracao.placa := qryVeiculoPLACA.Value;
      rodo.veicTracao.UF := qryVeiculoUF.Value;
      rodo.veicTracao.RENAVAM := qryVeiculoRENAVAM.Value;
      rodo.veicTracao.tara := qryVeiculoTARA.AsInteger;
      rodo.veicTracao.capKG := qryVeiculoPESO.AsInteger;
      rodo.veicTracao.capM3 := 0;
      rodo.veicTracao.tpRod := TpcteTipoRodado(qryVeiculoTIPO.Value);
      rodo.veicTracao.tpCar := TpcteTipoCarroceria(qryVeiculoCARROCERIA.Value);
    end
    else
    begin
      raise Exception.Create('Veículo não foi encontrado!');
      exit;
    end;

    if qryMotorista.Locate('CODIGO', qryMDFE_MFK_MOTORISTA.Value, []) then
    begin
      with rodo.veicTracao.condutor.Add do
      begin
        xNome := qryMotoristaNOME.Value;
        CPF := TiraPontos(qryMotoristaCPF.Value);
      end;
    end
    else
    begin
      raise Exception.Create('Motorista não foi encontrado!');
      exit;
    end;

    if qryMDFE_MCARGA_PROPRIA.Value = 'S' then
      // NADA
    else
    begin
      rodo.veicTracao.prop.RNTRC := qryVeiculoRNTC.Value;
      rodo.veicTracao.prop.xNome := qryTranspNOME.Value;
      rodo.veicTracao.prop.CNPJCPF := TiraPontos(qryTranspCNPJ.Value);
      rodo.veicTracao.prop.IE := TiraPontos(qryTranspIE.Value);
      rodo.veicTracao.prop.UF := qryTranspUF.Value;
      rodo.veicTracao.prop.tpProp := tpOutros;

    end;

    i := 2;

    qryVeiculo_Reboque.Close;
    qryVeiculo_Reboque.Params[0].Value := qryVeiculoPLACA.Value;
    qryVeiculo_Reboque.Open;

    if not qryVeiculo_Reboque.IsEmpty then
    begin
      qryVeiculo_Reboque.First;

      while not qryVeiculo_Reboque.Eof do
      begin
        with rodo.veicReboque.Add do
        begin
          cInt := '00' + i.ToString;
          placa := qryVeiculo_ReboquePLACA.Value;
          RENAVAM := qryVeiculo_ReboqueRENAVAM.Value;
          tara := qryVeiculo_ReboqueTARA.AsInteger;
          capKG := qryVeiculo_ReboquePESO.AsInteger;
          capM3 := 0;
          tpCar := TpcteTipoCarroceria(qryVeiculo_ReboqueCARROCERIA.Value);
          UF := qryVeiculo_ReboqueUF.Value;

          prop.RNTRC := qryVeiculo_ReboqueRNTC.Value;
          prop.xNome := qryTranspNOME.Value;
          prop.CNPJCPF := TiraPontos(qryTranspCNPJ.Value);
          prop.IE := TiraPontos(qryTranspIE.Value);
          prop.UF := qryTranspUF.Value;
          prop.tpProp := tpOutros;

        end;
        qryVeiculo_Reboque.Next;

      end;
    end;

    dados.qryconsulta.Close;
    dados.qryconsulta.SQL.Clear;
    dados.qryconsulta.SQL.Add
      ('SELECT distinct(de.id_cidade) id_cidade, de.cidade FROM mdfe_detalhe md');
    dados.qryconsulta.SQL.Add
      ('left join cte_destinatario de on de.codigo=md.fk_destinatario');
    dados.qryconsulta.SQL.Add('where');
    dados.qryconsulta.SQL.Add('md.fk_mdfe_master=:id');
    dados.qryconsulta.Params[0].Value := qryMDFE_MCODIGO.Value;
    dados.qryconsulta.Open;
    dados.qryconsulta.First;

    while not dados.qryconsulta.Eof do
    begin
      with infDoc.infMunDescarga.Add do
      begin
        cMunDescarga := dados.qryconsulta.Fields[0].Value;
        xMunDescarga := dados.qryconsulta.Fields[1].Value;

        qryMDFe_D_Cidade.Close;
        qryMDFe_D_Cidade.Params[0].Value := qryMDFE_MCODIGO.Value;
        qryMDFe_D_Cidade.Params[1].Value := dados.qryconsulta.Fields[0].Value;
        qryMDFe_D_Cidade.Open;

        qryMDFe_D_Cidade.First;
        while not qryMDFe_D_Cidade.Eof do
        begin
          if qryMDFE_MTIPO_MDFE.Value = 'CTE' then
            infCTe.Add.chCTe := qryMDFe_D_CidadeCHAVE.Value;
          if qryMDFE_MTIPO_MDFE.Value = 'NFE' then
            infNFe.Add.chNFe := qryMDFe_D_CidadeCHAVE.Value;
          qryMDFe_D_Cidade.Next;
        end;
      end;
      dados.qryconsulta.Next;
    end;

    if qryMDFE_MTIPO_MDFE.Value = 'CTE' then
    begin

      qryMDFe_Seguradora.First;
      while not qryMDFe_Seguradora.Eof do
      begin
        if qryMDFe_SeguradoraRESPONSAVEL.Value = 'Emitente' then
          FResponsavel := 4;
        if qryMDFe_SeguradoraRESPONSAVEL.Value = 'Tomador' then
          FResponsavel := 5;

        with seg.Add do
        begin
          respSeg := TRspSegMDFe(FResponsavel);
          xSeg := qryMDFe_SeguradoraNOME.Value;
          CNPJCPF := TiraPontos(qryMDFe_SeguradoraCNPJ.Value);
          CNPJ := TiraPontos(qryMDFe_SeguradoraCNPJ.Value);
          nApol := qryMDFe_SeguradoraAPOLICE.Value;

          qryMdfe_averbacaco.First;

          while not qryMdfe_averbacaco.Eof do
          begin
            aver.Add.nAver := qryMdfe_averbacacoAVERBACAO.Value;
            qryMdfe_averbacaco.Next;
          end;

        end;
        qryMDFe_Seguradora.Next;
      end;

      with rodo.infANTT.infContratante.Add do
      begin
        CNPJCPF := TiraPontos(qryMDFE_MCNPJ_RESPONSAVEL.Value);
      end;
    end;

    prodPred.tpCarga := TCarga(qryMDFE_MTIPO_CARGA.Value);
    prodPred.xProd := qryMDFE_MPRODUTO_PREDOMINANTE.Value;
    prodPred.cEAN := qryMDFE_MCOD_BARRA.Value;
    prodPred.NCM := qryMDFE_MNCM.Value;

    dados.qryconsulta.Close;
    dados.qryconsulta.SQL.Clear;
    dados.qryconsulta.SQL.Add('SELECT distinct(de.cnpj) FROM mdfe_detalhe md');
    dados.qryconsulta.SQL.Add
      ('left join cte_destinatario de on de.codigo=md.fk_destinatario');
    dados.qryconsulta.SQL.Add('where');
    dados.qryconsulta.SQL.Add('md.fk_mdfe_master=:id');
    dados.qryconsulta.Params[0].Value := qryMDFE_MCODIGO.Value;
    dados.qryconsulta.Open;

    dados.qryconsulta.First;
    while not dados.qryconsulta.Eof do
    begin
      autXML.Add.CNPJCPF := dados.qryconsulta.Fields[0].AsString;
      dados.qryconsulta.Next;
    end;

    if qryMDFE_MTIPO_MDFE.Value = 'CTE' then
      tot.qCTe := qryMDFE_MQTD_CTE.Value;
    if qryMDFE_MTIPO_MDFE.Value = 'NFE' then
      tot.qNFe := qryMDFE_MQTD_CTE.Value;

    tot.vCarga := qryMDFE_MVALOR_CARGA.AsFloat;
    tot.cUnid := TUnidMed(qryMDFE_MUNIDADE_CARGA.AsInteger);

    tot.qCarga := qryMDFE_MQTD_CARGA.AsFloat;

    infAdic.infCpl := qryMDFE_MINFCPL.Value;
    infAdic.infAdFisco := qryMDFE_MINFADFISCO.Value;
  end;

end;

procedure TfrmCadMDFe.btnTransmitirClick(Sender: TObject);
var
  Dir, vChave, vProtocolo, vCaminho, vMotivo: string;
begin
  try
    btnTransmitir.Enabled := false;
    if (Length(qryMDFE_MCHAVE.Value) = 44) and (Trim(qryMDFE_MXML.Value) <> '')
    then
    begin

      DmMDFe.ACBrMDFe.Manifestos.Clear;
      DmMDFe.ACBrMDFe.Manifestos.LoadFromString(qryMDFE_MXML.Value);
      DmMDFe.ACBrMDFe.Consultar;

      if DmMDFe.ACBrMDFe.WebServices.Consulta.cStat = 100 then
      begin
        showMessage('MDFe já transmitido!');
        qryMDFE_M.Edit;
        qryMDFE_MSITUACAO.Value := 'D';
        qryMDFE_M.Post;
        dados.Conexao.CommitRetaining;
        exit;
      end;

    end;

    if qryMDFE_M.State in [dsinsert, dsedit] then
      qryMDFE_M.Post;

    DmMDFe.ACBrMDFe.Manifestos.Clear;

    GerarMDFE;

    DmMDFe.ACBrMDFe.Manifestos.GerarMDFE;

    qryMDFE_M.Edit;
    qryMDFE_MPROTOCOLO.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0]
      .MDFe.procMDFe.nProt;
    qryMDFE_MCHAVE.Value :=
      COPY(DmMDFe.ACBrMDFe.Manifestos.Items[0].MDFe.infMDFe.ID, 5, 100);
    qryMDFE_MXML.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0].XML;
    qryMDFE_M.Post;
    dados.Conexao.CommitRetaining;
    try
      if DmMDFe.ACBrMDFe.Enviar(strtoinT('0'), false) then
      begin
        qryMDFE_M.Edit;
        qryMDFE_MPROTOCOLO.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0]
          .MDFe.procMDFe.nProt;
        qryMDFE_MCHAVE.Value :=
          COPY(DmMDFe.ACBrMDFe.Manifestos.Items[0].MDFe.infMDFe.ID, 5, 100);
        qryMDFE_MXML.Value := DmMDFe.ACBrMDFe.Manifestos.Items[0].XML;
        qryMDFE_MDATA_EMISSAO.Value := Now;
        qryMDFE_MSITUACAO.Value := 'T';
        qryMDFE_M.Post;
        dados.Conexao.CommitRetaining;

        showMessage(' MDFe transmitido com sucesso!');

      end;
    except
      on E: Exception do
      begin
        btnTransmitir.Enabled := true;
        if DmMDFe.ACBrMDFe.WebServices.Retorno.cStat = 686 then
        begin
          showMessage('ERRO:' + E.Message + sLineBreak + 'Motivo:' +
            DmMDFe.ACBrMDFe.WebServices.Retorno.xMotivo);
        end
        else
          showMessage('ERRO:' + E.Message);
        exit;
      end;
    end;
  finally
    FreeOnRelease;
  end;
end;

procedure TfrmCadMDFe.btnTranspClick(Sender: TObject);
begin
  try
    dados.qryTransp.Close;
    dados.qryTransp.SQL.Text :=
      'select * from TRANSPORTADORA where codigo>=0 /*where*/  ';
    dados.qryTransp.Open;

    FrmCadTransp := TFrmCadTransp.Create(Application);
    dados.qryTransp.Insert;
    dados.qryTranspCODIGO.Value := dados.Numerador('TRANSPORTADORA', 'CODIGO',
      'N', '', '');
    dados.qryTranspATIVO.Value := 'S';
    dados.qryTranspEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    dados.qryTranspUF.Value := dados.qryEmpresaUF.Value;
    dados.qryTranspCOD_CIDADE.Value := dados.qryEmpresaID_CIDADE.Value;
    dados.qryTranspCIDADE.Value := dados.qryEmpresaCIDADE.Value;
    FrmCadTransp.ShowModal;
  finally
    btnTransp.Enabled := true;
    FrmCadTransp.Release;
    qryTransp.Close;
    qryTransp.Open;
  end;
end;

procedure TfrmCadMDFe.btnVeiculoClick(Sender: TObject);
begin
  try
    frmVeiculos := TfrmVeiculos.Create(Application);
    frmVeiculos.localiza;
    frmVeiculos.bbNovo.Click;
    frmVeiculos.ShowModal;
  finally
    frmVeiculos.Release;
    qryVeiculo.Close;
    qryVeiculo.Open;
  end;
end;

procedure TfrmCadMDFe.DBComboBoxEh2Exit(Sender: TObject);

begin
  SelecionaOrigem;
end;

procedure TfrmCadMDFe.DBComboBoxEh3Exit(Sender: TObject);
begin
  SelecionaDestino;
end;

procedure TfrmCadMDFe.DBEdit7Enter(Sender: TObject);
begin
  qryMotorista.Close;
  qryMotorista.Params[0].Value := qryTranspCODIGO.Value;
  qryMotorista.Open;
end;

procedure TfrmCadMDFe.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadMDFe.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadMDFe.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadMDFe.DBGridEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadMDFe.DBGridEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadMDFe.DBGridEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadMDFe.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  DBEdit5.SetFocus;
end;

procedure TfrmCadMDFe.DBMemoEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadMDFe.DBMemoEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadMDFe.DBMemoEh2Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadMDFe.DBMemoEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCadMDFe.dsMDFe_MDataChange(Sender: TObject; Field: TField);
begin
  estado;
  qryPercurso.Close;
  qryPercurso.Params[0].Value := qryMDFE_MCODIGO.Value;
  qryPercurso.Open;
end;

procedure TfrmCadMDFe.dsMDFe_SeguradoraDataChange(Sender: TObject;
  Field: TField);
begin
  qryMdfe_averbacaco.Close;
  qryMdfe_averbacaco.Open;
end;

procedure TfrmCadMDFe.FormCreate(Sender: TObject);
begin
  DmMDFe.ConfiguraMDFe;
  btnGravar.Caption := 'F2' + sLineBreak + 'Gravar';
  btnTransmitir.Caption := 'F3' + sLineBreak + 'Transmitir';
  btnImprimir.Caption := 'F4' + sLineBreak + 'Imprimir';
  btnImportar.Caption := 'F5' + sLineBreak + 'Importar';
  btnPessoas.Caption := 'F6' + sLineBreak + 'Destinatário';
  btnTransp.Caption := 'F7' + sLineBreak + 'Transportador';
  btnVeiculo.Caption := 'F8' + sLineBreak + 'Veículos';
  btnSair.Caption := 'F12' + sLineBreak + 'Sair';
end;

procedure TfrmCadMDFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnGravar.Click;

  if Key = vk_f3 then
    btnTransmitir.Click;

  if Key = vk_f4 then
    btnImprimir.Click;

  if Key = VK_F5 then
    btnImportar.Click;

  if Key = VK_F6 then
    btnPessoas.Click;

  if Key = VK_F7 then
    btnTransp.Click;

  if Key = VK_F8 then
    btnVeiculo.Click;

  if Key = VK_F12 then
    Close;

end;

procedure TfrmCadMDFe.FormShow(Sender: TObject);
begin
  qryVeiculo.Close;
  qryVeiculo.Open;

  qryTransp.Close;
  qryTransp.Open;

  if not qryTransp.IsEmpty then
  begin
    qryMotorista.Close;
    qryMotorista.Params[0].Value := qryTranspCODIGO.Value;
    qryMotorista.Open;
  end;

  qryDestinatario.Close;
  qryDestinatario.Open;

  qryCidade.Close;
  qryCidade.Open;

  btnTransmitir.Enabled := false;

end;

procedure TfrmCadMDFe.qryMdfe_averbacacoBeforeInsert(DataSet: TDataSet);
begin
  if qryMDFe_Seguradora.State in dsEditmodes then
    qryMDFe_Seguradora.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMdfe_averbacacoBeforePost(DataSet: TDataSet);
begin
  if (qryMdfe_averbacaco.State = dsinsert) then
    qryMdfe_averbacacoCODIGO.Value := dados.Numerador('MDFE_AVERBACAO',
      'CODIGO', 'N', '', '');
end;

procedure TfrmCadMDFe.qryMdfe_averbacacoNewRecord(DataSet: TDataSet);
begin
  qryMdfe_averbacacoFK_MDFE_SEGURADORA.Value := qryMDFe_SeguradoraCODIGO.Value;
end;

procedure TfrmCadMDFe.qryMDFE_DAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMDFE_DAfterEdit(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadMDFe.qryMDFE_DAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;

end;

procedure TfrmCadMDFe.qryMDFE_DBeforeInsert(DataSet: TDataSet);
begin
  if qryMDFE_M.State in dsEditmodes then
    qryMDFE_M.Post;
end;

procedure TfrmCadMDFe.qryMDFE_DNewRecord(DataSet: TDataSet);
begin
  qryMDFE_DFK_MDFE_MASTER.Value := qryMDFE_MCODIGO.Value;
  qryMDFE_DCODIGO.Value := dados.Numerador('MDFE_DETALHE', 'CODIGO',
    'N', '', '');
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;

end;

procedure TfrmCadMDFe.qryMDFE_MAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMDFE_MAfterEdit(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadMDFe.qryMDFE_MAfterInsert(DataSet: TDataSet);
begin
  btnTransmitir.Enabled := false;
  btnGravar.Enabled := true;
end;

procedure TfrmCadMDFe.qryMDFE_MAfterOpen(DataSet: TDataSet);
begin
  qryMDFE_D.Close;
  qryMDFE_D.Open;

  qryESDestino.Close;
  qryESDestino.Open;

  qryESOrigem.Close;
  qryESOrigem.Open;

  qryMDFe_Seguradora.Close;
  qryMDFe_Seguradora.Open;

end;

procedure TfrmCadMDFe.qryMDFE_MAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMDFE_MBeforePost(DataSet: TDataSet);
begin
  if (qryMDFE_M.State = dsinsert) then
  begin

    qryPesquisaMDFe.Close;
    qryPesquisaMDFe.Params[0].Value := qryMDFE_MNUMERO_MDFE.Value;
    qryPesquisaMDFe.Params[1].Value := qryMDFE_MCODIGO.Value;
    qryPesquisaMDFe.Params[2].Value := qryMDFE_MFK_EMPRESA.Value;
    qryPesquisaMDFe.Open;

    if qryPesquisaMDFe.RecordCount > 0 then
    begin
      showMessage('Já existe MDFe com esta numeração!');
      Abort;
    end;

    GetNumero;

  end;
end;

procedure TfrmCadMDFe.qryMDFE_MCalcFields(DataSet: TDataSet);
begin
  if qryMDFE_MSITUACAO.Value = 'A' then
    qryMDFE_MVIRTUAL_SITUACAO.Value := 'ABERTO';
  if qryMDFE_MSITUACAO.Value = 'T' then
    qryMDFE_MVIRTUAL_SITUACAO.Value := 'TRANSMITIDO';
  if qryMDFE_MSITUACAO.Value = 'C' then
    qryMDFE_MVIRTUAL_SITUACAO.Value := 'CANCELADO';
  if qryMDFE_MSITUACAO.Value = 'D' then
    qryMDFE_MVIRTUAL_SITUACAO.Value := 'DUPLICIDADE';
  if qryMDFE_MSITUACAO.Value = 'E' then
    qryMDFE_MVIRTUAL_SITUACAO.Value := 'ENCERRADO';

end;

procedure TfrmCadMDFe.qryMDFE_MNewRecord(DataSet: TDataSet);
begin
  frmCadMDFe.qryMDFE_MCODIGO.Value := dados.Numerador('MDFE_MASTER', 'CODIGO',
    'N', '', '');
  frmCadMDFe.qryMDFE_MFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  frmCadMDFe.qryMDFE_MSITUACAO.Value := 'A';
  frmCadMDFe.qryMDFE_MDATA.Value := date;
  frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := 0;
  frmCadMDFe.qryMDFE_MID_MUNICIPIO.Value := '0';
  frmCadMDFe.qryMDFE_MQTD_CTE.Value := 1;
  frmCadMDFe.qryMDFE_MTIPO_CARGA.Value := 4;
  frmCadMDFe.qryMDFE_MSERIE.Value := dados.qryConfigMDFE_SERIE.Value;
  frmCadMDFe.qryMDFE_MRESP_SEGURO.Value := 1;
  frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '1';
  frmCadMDFe.qryMDFE_MTIPO_MDFE.Value := 'NFE';
  frmCadMDFe.qryMDFE_MTIPO.Value := 'NENHUM';
  GetNumero;
end;

procedure TfrmCadMDFe.qryMDFe_SeguradoraAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMDFe_SeguradoraAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadMDFe.qryMDFe_SeguradoraBeforePost(DataSet: TDataSet);
begin
  if (qryMDFe_Seguradora.State = dsinsert) then
    qryMDFe_SeguradoraCODIGO.Value := dados.Numerador('MDFE_SEGURADORA',
      'CODIGO', 'N', '', '');
end;

procedure TfrmCadMDFe.qryMDFe_SeguradoraNewRecord(DataSet: TDataSet);
begin
  qryMDFe_SeguradoraFK_MDFE.Value := qryMDFE_MCODIGO.Value;
  qryMDFe_SeguradoraVALOR_SEGURADO.AsFloat := qryMDFE_MVALOR_CARGA.AsFloat;
end;

procedure TfrmCadMDFe.qryPercursoBeforePost(DataSet: TDataSet);
begin
  qryPercursoUF.Value := UpperCase(qryPercursoUF.Value);
end;

procedure TfrmCadMDFe.qryPercursoNewRecord(DataSet: TDataSet);
begin
  qryPercursoCODIGO.Value := dados.Numerador('MDFE_PERCURSO', 'CODIGO',
    'N', '', '');
  qryPercursoFK_MDFE_MASTER.Value := qryMDFE_MCODIGO.Value;
end;

procedure TfrmCadMDFe.estado;
begin
  if (qryMDFE_MSITUACAO.Value = 'T') then
    btnGravar.Enabled := false;
  btnImprimir.Enabled := (qryMDFE_MSITUACAO.Value = 'T');
  btnImportar.Enabled := qryMDFE_MSITUACAO.Value = 'A';
  Panel3.Enabled := qryMDFE_MSITUACAO.Value = 'A';
  DBGridEh1.ReadOnly := qryMDFE_MSITUACAO.Value <> 'A';

  TabSheet7.Enabled := qryMDFE_MSITUACAO.Value = 'A';
  TabSheet8.Enabled := qryMDFE_MSITUACAO.Value = 'A';
  TabSheet9.Enabled := qryMDFE_MSITUACAO.Value = 'A';
  TabSheet2.Enabled := qryMDFE_MSITUACAO.Value = 'A';
end;

end.
