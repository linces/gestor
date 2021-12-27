unit uImportarMDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrCTe;

type
  TfrmImportarMDFe = class(TForm)
    Panel1: TPanel;
    btnImportar: TSpeedButton;
    qryNota: TFDQuery;
    qryItens: TFDQuery;
    edtCaminho: TEdit;
    btnPesq: TButton;
    CbTipo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TEdit;
    btnSair: TSpeedButton;
    cbEmpresa: TDBLookupComboBox;
    Abrir: TOpenDialog;
    dsEmpresa: TDataSource;
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
    qryCTE_M: TFDQuery;
    dsCTE_M: TDataSource;
    qryCTE_D: TFDQuery;
    qrySoma: TFDQuery;
    chkLerXml: TCheckBox;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesCNPJ: TStringField;
    qryClientesRAZAO: TStringField;
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
    qryCTE_MTOTAL: TFMTBCDField;
    qryCTE_MRECEBIDO: TFMTBCDField;
    qryCTE_MVPIS: TFMTBCDField;
    qryCTE_MVCOFINS: TFMTBCDField;
    qryCTE_MVINSS: TFMTBCDField;
    qryCTE_MVIR: TFMTBCDField;
    qryCTE_MVCLSS: TFMTBCDField;
    qryCTE_MVTOTTIRB: TFMTBCDField;
    qryCTE_MDESCRICAOSERVICO: TStringField;
    qryCTE_MQTD: TFMTBCDField;
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
    qryCTE_MOBS_FISCO: TMemoField;
    qryCTE_MOBS_CONTRIBUINTE: TMemoField;
    qryCTE_MVALOR_SERVICO: TFMTBCDField;
    qryCTE_MVALOR_CARGA: TFMTBCDField;
    qryCTE_MCST_ICMS: TStringField;
    qryCTE_MALIQUOTA_ICMS: TFMTBCDField;
    qryCTE_MBASE_ICMS: TFMTBCDField;
    qryCTE_MVALOR_ICMS: TFMTBCDField;
    qryCTE_MOUTROS_TRIBUTOS: TFMTBCDField;
    qryCTE_MPESOL: TBCDField;
    qryCTE_MPESOB: TBCDField;
    qryCTE_MMETRAGEM: TStringField;
    qryCTE_MFK_REMETENTE: TIntegerField;
    qryCTE_MCHAVE_REFERENCIADA: TStringField;
    qryCTE_MNAVERBACAO: TStringField;
    qryCTE_MCNPJ_SEGURADORA: TStringField;
    qryCTE_DCODIGO: TIntegerField;
    qryCTE_DFK_CTE_MASTER: TIntegerField;
    qryCTE_DNUMERO: TIntegerField;
    qryCTE_DCHAVE: TStringField;
    qryCTE_DPRECO: TFMTBCDField;
    qryCTE_DQTD: TFMTBCDField;
    qryCTE_DTOTAL: TFMTBCDField;
    qryCTE_DUNIDADE: TStringField;
    qryCTE_DFK_DESTINATARIO: TIntegerField;
    qryCTE_DDESCRICAO: TStringField;
    qryItensCODIGO: TIntegerField;
    qryItensFKNFE: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensITEM: TSmallintField;
    qryItensCOD_BARRA: TStringField;
    qryItensNCM: TStringField;
    qryItensCFOP: TStringField;
    qryItensCST: TStringField;
    qryItensCSOSN: TStringField;
    qryItensTIPO: TStringField;
    qryItensQTD: TFMTBCDField;
    qryItensE_MEDIO: TFMTBCDField;
    qryItensPRECO: TFMTBCDField;
    qryItensTOTAL: TFMTBCDField;
    qryItensBASE_ICMS: TFMTBCDField;
    qryItensALIQ_ICMS: TFMTBCDField;
    qryItensVALOR_ICMS: TFMTBCDField;
    qryItensCST_COFINS: TStringField;
    qryItensBASE_COFINS_ICMS: TFMTBCDField;
    qryItensALIQ_COFINS_ICMS: TFMTBCDField;
    qryItensVALOR_COFINS_ICMS: TFMTBCDField;
    qryItensCST_PIS: TStringField;
    qryItensBASE_PIS_ICMS: TFMTBCDField;
    qryItensALIQ_PIS_ICMS: TFMTBCDField;
    qryItensVALOR_PIS_ICMS: TFMTBCDField;
    qryItensTRIB_MUN: TFMTBCDField;
    qryItensTRIB_EST: TFMTBCDField;
    qryItensTRIB_FED: TFMTBCDField;
    qryItensTRIB_IMP: TFMTBCDField;
    qryItensSITUACAO: TStringField;
    qryItensFLAG: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensFRETE: TFMTBCDField;
    qryItensDESPESAS: TFMTBCDField;
    qryItensSEGURO: TFMTBCDField;
    qryItensDESCONTO: TFMTBCDField;
    qryItensBASE_IPI: TFMTBCDField;
    qryItensALIQ_IPI: TFMTBCDField;
    qryItensVALOR_IPI: TFMTBCDField;
    qryItensBASE_ICMS_ST: TFMTBCDField;
    qryItensVALOR_ICMS_ST: TFMTBCDField;
    qryItensVBCUFDEST: TFMTBCDField;
    qryItensVFCP: TFMTBCDField;
    qryItensPICMSUFDEST: TFMTBCDField;
    qryItensPICMSINTER: TFMTBCDField;
    qryItensPICMSINTERPART: TFMTBCDField;
    qryItensVFCPUFDEST: TFMTBCDField;
    qryItensVICMSUFDEST: TFMTBCDField;
    qryItensVICMSUFREMET: TFMTBCDField;
    qryItensCST_IPI: TStringField;
    qryItensOUTROS: TFMTBCDField;
    qryItensALIQ_ICMS_ST: TFMTBCDField;
    qryNotaCODIGO: TIntegerField;
    qryNotaNUMERO: TIntegerField;
    qryNotaCHAVE: TStringField;
    qryNotaMODELO: TStringField;
    qryNotaSERIE: TStringField;
    qryNotaDATA_EMISSAO: TDateField;
    qryNotaDATA_SAIDA: TDateField;
    qryNotaHORA_EMISSAO: TTimeField;
    qryNotaHORA_SAIDA: TTimeField;
    qryNotaID_EMITENTE: TIntegerField;
    qryNotaID_CLIENTE: TIntegerField;
    qryNotaID_TRANSPORTADOR: TIntegerField;
    qryNotaFK_USUARIO: TIntegerField;
    qryNotaFK_CAIXA: TIntegerField;
    qryNotaFK_VENDEDOR: TIntegerField;
    qryNotaTIPO_FRETE: TStringField;
    qryNotaSUBTOTAL: TFMTBCDField;
    qryNotaTIPO_DESCONTO: TStringField;
    qryNotaDESPESAS: TFMTBCDField;
    qryNotaSEGURO: TFMTBCDField;
    qryNotaFRETE: TFMTBCDField;
    qryNotaDESCONTO: TFMTBCDField;
    qryNotaTROCO: TFMTBCDField;
    qryNotaDINHEIRO: TFMTBCDField;
    qryNotaTOTAL: TFMTBCDField;
    qryNotaBASE_ST: TFMTBCDField;
    qryNotaTOTAL_ST: TFMTBCDField;
    qryNotaBASE_IPI: TFMTBCDField;
    qryNotaTOTAL_IPI: TFMTBCDField;
    qryNotaBASEICMS: TFMTBCDField;
    qryNotaTOTALICMS: TFMTBCDField;
    qryNotaBASEICMSPIS: TFMTBCDField;
    qryNotaTOTALICMSPIS: TFMTBCDField;
    qryNotaBASEICMSCOF: TFMTBCDField;
    qryNotaTOTALICMSCOFINS: TFMTBCDField;
    qryNotaBASEISS: TFMTBCDField;
    qryNotaTOTALISS: TFMTBCDField;
    qryNotaOBSFISCO: TMemoField;
    qryNotaOBSCONTRIBUINTE: TMemoField;
    qryNotaEMAIL: TStringField;
    qryNotaXML: TMemoField;
    qryNotaPROTOCOLO: TStringField;
    qryNotaTRIB_MUN: TFMTBCDField;
    qryNotaTRIB_EST: TFMTBCDField;
    qryNotaTRIB_FED: TFMTBCDField;
    qryNotaTRIB_IMP: TFMTBCDField;
    qryNotaFLAG: TStringField;
    qryNotaFKORCAMENTO: TIntegerField;
    qryNotaFKVENDA: TIntegerField;
    qryNotaFKNOTA: TIntegerField;
    qryNotaESPECIE: TStringField;
    qryNotaMARCA: TStringField;
    qryNotaNVOL: TStringField;
    qryNotaQVOL: TIntegerField;
    qryNotaPESOB: TFMTBCDField;
    qryNotaPESOL: TFMTBCDField;
    qryNotaPLACA: TStringField;
    qryNotaUFPLACA: TStringField;
    qryNotaRNTC: TStringField;
    qryNotaSITUACAO: TStringField;
    qryNotaFKEMPRESA: TIntegerField;
    qryNotaTIPO_EMISSAO: TStringField;
    qryNotaFINALIDADE: TStringField;
    qryNotaMOVIMENTO: TStringField;
    qryNotaCFOP: TIntegerField;
    qryNotaCHAVE_NFE_REFERENCIADA: TStringField;
    qryNotaMOTIVO_CONTIGENCIA: TStringField;
    qryNotaBASE_ICMS_ST: TFMTBCDField;
    qryNotaVALOR_ICMS_ST: TFMTBCDField;
    qryNotaVFCPUFDEST: TFMTBCDField;
    qryNotaVICMSUFDEST: TFMTBCDField;
    qryNotaVICMSUFREMET: TFMTBCDField;
    qryNotaCONSUMIDOR_FINAL: TStringField;
    qryNotaNPEDIDO: TStringField;
    qryNotaOUTROS: TFMTBCDField;
    qrySomaITEM: TIntegerField;
    qrySomaVALOR: TFMTBCDField;
    qrySomaPESO: TFMTBCDField;
    ACBrCTe: TACBrCTe;
    ACBrNFe: TACBrNFe;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesqClick(Sender: TObject);
    procedure qryCTE_MAfterOpen(DataSet: TDataSet);
    procedure btnImportarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkLerXmlClick(Sender: TObject);
    procedure CbTipoChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ImportaXml(caminho: string);
    procedure ImportaBanco(Empresa, Nota: Integer);
    function ConsultaDestnatario(pessoa, cnpj, nome, ie, endereco, numero,
      bairro, cidade, cep, uf: string; id_cidade: Integer): string;
    procedure Estado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarMDFe: TfrmImportarMDFe;

implementation

{$R *.dfm}

uses Udados, uCadMDFe, ufrmStatus;

procedure TfrmImportarMDFe.ImportaBanco(Empresa, Nota: Integer);
begin
  if CbTipo.Text = 'CTE' then
  begin

    qryCTE_M.Close;
    qryCTE_M.Params[0].Value := edtNumero.Text;
    qryCTE_M.Params[1].Value := cbEmpresa.KeyValue;
    qryCTE_M.Open;

    if not qryCTE_M.IsEmpty then
    begin

      if not(frmCadMDFe.qryMDFE_M.State in [dsinsert, dsedit]) then
        frmCadMDFe.qryMDFE_M.Edit;

      frmCadMDFe.qryMDFE_MFK_TRANSPORTADOR.Value :=
        qryCTE_MFKTRANSPORTADOR.Value;
      frmCadMDFe.qryMDFE_MUF_INICIO.Value := qryCTE_MUFINI.Value;
      frmCadMDFe.qryMDFE_MID_ORIGEM.AsInteger := qryCTE_MCODMUNINI.Value;
      frmCadMDFe.qryMDFE_MUF_FIM.Value := qryCTE_MUFFIM.Value;
      frmCadMDFe.qryMDFE_MID_DESTINO.AsInteger := qryCTE_MCODMUNFIM.Value;
      frmCadMDFe.qryMDFE_MTIPO_MDFE.Value := 'CTE';
      frmCadMDFe.qryMDFE_MQTD_CTE.Value := 1;
      frmCadMDFe.qryMDFE_MQTD_CARGA.Value := 0;
      frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := 0;
      frmCadMDFe.qryMDFE_MCARGA_PROPRIA.Value := 'S';
      frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '';
      frmCadMDFe.qryMDFE_M.Post;
      dados.Conexao.CommitRetaining;

      frmCadMDFe.qryMDFE_D.Append;
      frmCadMDFe.qryMDFE_DFK_MDFE_MASTER.Value :=
        frmCadMDFe.qryMDFE_MCODIGO.Value;
      frmCadMDFe.qryMDFE_DCODIGO.AsFloat := dados.Numerador('MDFE_DETALHE',
        'CODIGO', 'N', '', '');
      frmCadMDFe.qryMDFE_DCHAVE.Value := qryCTE_MCHAVE.Value;
      frmCadMDFe.qryMDFE_DNUMERO.Value := qryCTE_MNUMERO.Value;
      frmCadMDFe.qryMDFE_DFK_DESTINATARIO.Value := qryCTE_MNUMERO.Value;
      frmCadMDFe.qryMDFE_DVALOR.Value := qryCTE_MVALOR_CARGA.Value;
      frmCadMDFe.qryMDFE_DPESO.Value := qryCTE_MQTD.Value;
      frmCadMDFe.qryMDFE_DFK_USUARIO.Value := dados.idUsuario;
      frmCadMDFe.qryMDFE_DFK_EMPRESA.Value :=
        frmCadMDFe.qryMDFE_MFK_EMPRESA.Value;
      frmCadMDFe.qryMDFE_D.Post;
      dados.Conexao.CommitRetaining;

      qrySoma.Close;
      qrySoma.Params[0].Value := frmCadMDFe.qryMDFE_MCODIGO.Value;
      qrySoma.Open;

      if not(frmCadMDFe.qryMDFE_M.State in [dsinsert, dsedit]) then
        frmCadMDFe.qryMDFE_M.Edit;
      frmCadMDFe.qryMDFE_MQTD_CTE.Value := qrySomaITEM.Value;
      frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := qrySomaVALOR.Value;
      frmCadMDFe.qryMDFE_MQTD_CARGA.Value := qrySomaPESO.Value;
      frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '1';
      frmCadMDFe.qryMDFE_M.Post;
      dados.Conexao.CommitRetaining;
    end
    else
    begin
      ShowMessage('CTe não foi encontrada ou não foi transmitido!');
      exit;
    end;
  end;

  if CbTipo.Text = 'NFE' then
  begin

    qryNota.Close;
    qryNota.Params[0].Value := edtNumero.Text;
    qryNota.Params[1].Value := cbEmpresa.KeyValue;
    qryNota.Open;

    if not qryNota.IsEmpty then
    begin


      // verifica se destinatario existe

      dados.qryconsulta.Close;
      dados.qryconsulta.sql.Clear;
      dados.qryconsulta.sql.add('select * from pessoa');
      dados.qryconsulta.sql.add('where');
      dados.qryconsulta.sql.add('codigo=:cod');
      dados.qryconsulta.Params[0].Value := qryNotaID_CLIENTE.Value;
      dados.qryconsulta.Open;

      qryDestinatario.Close;
      qryDestinatario.Params[0].Value :=
        ConsultaDestnatario(dados.qryconsulta.FieldByName('TIPO').AsString,
        dados.qryconsulta.FieldByName('CNPJ').AsString,
        dados.qryconsulta.FieldByName('RAZAO').AsString,
        dados.qryconsulta.FieldByName('IE').AsString,
        dados.qryconsulta.FieldByName('ENDERECO').AsString,
        dados.qryconsulta.FieldByName('NUMERO').AsString,
        dados.qryconsulta.FieldByName('BAIRRO').AsString,
        dados.qryconsulta.FieldByName('MUNICIPIO').Value,
        dados.qryconsulta.FieldByName('CEP').Value,
        dados.qryconsulta.FieldByName('UF').Value,
        dados.qryconsulta.FieldByName('CODMUN').Value);
      qryDestinatario.Open;

      if not(frmCadMDFe.qryMDFE_M.State in [dsinsert, dsedit]) then
        frmCadMDFe.qryMDFE_M.Edit;

      frmCadMDFe.qryMDFE_MFK_TRANSPORTADOR.Value :=
        qryNotaID_TRANSPORTADOR.Value;
      frmCadMDFe.qryMDFE_MUF_INICIO.Value := dados.qryEmpresaUF.Value;
      frmCadMDFe.qryMDFE_MUF_FIM.Value := qryDestinatarioUF.Value;
      frmCadMDFe.qryMDFE_MID_ORIGEM.AsInteger :=
        dados.qryEmpresaID_CIDADE.Value;
      frmCadMDFe.qryMDFE_MTIPO_MDFE.Value := 'NFE';
      frmCadMDFe.qryMDFE_MID_DESTINO.AsInteger :=
        qryDestinatarioID_CIDADE.Value;
      frmCadMDFe.qryMDFE_MQTD_CTE.Value := 0;
      frmCadMDFe.qryMDFE_MQTD_CARGA.Value := 0;
      frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := 0;
      frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '';
      frmCadMDFe.qryMDFE_M.Post;
      dados.Conexao.CommitRetaining;

      frmCadMDFe.qryMDFE_D.Append;
      frmCadMDFe.qryMDFE_DFK_MDFE_MASTER.Value :=
        frmCadMDFe.qryMDFE_MCODIGO.Value;
      frmCadMDFe.qryMDFE_DCODIGO.AsFloat := dados.Numerador('MDFE_DETALHE',
        'CODIGO', 'N', '', '');
      frmCadMDFe.qryMDFE_DCHAVE.Value := qryNotaCHAVE.Value;
      frmCadMDFe.qryMDFE_DNUMERO.Value := qryNotaNUMERO.Value;
      frmCadMDFe.qryMDFE_DFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
      frmCadMDFe.qryMDFE_DVALOR.Value := qryNotaTOTAL.Value;
      frmCadMDFe.qryMDFE_DPESO.Value := qryNotaPESOL.Value;
      frmCadMDFe.qryMDFE_DFK_USUARIO.Value := dados.idUsuario;
      frmCadMDFe.qryMDFE_DFK_EMPRESA.Value :=
        frmCadMDFe.qryMDFE_MFK_EMPRESA.Value;
      frmCadMDFe.qryMDFE_D.Post;
      dados.Conexao.CommitRetaining;

      qrySoma.Close;
      qrySoma.Params[0].Value := frmCadMDFe.qryMDFE_MCODIGO.Value;
      qrySoma.Open;

      frmCadMDFe.qryMDFE_M.Edit;
      frmCadMDFe.qryMDFE_MQTD_CTE.Value := qrySomaITEM.Value;
      frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := qrySomaVALOR.Value;
      frmCadMDFe.qryMDFE_MQTD_CARGA.Value := qrySomaPESO.Value;
      frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '1';
      frmCadMDFe.qryMDFE_M.Post;
    end
    else
    begin
      ShowMessage('Nota não foi encontrada!');
      exit;
    end;
  end;
end;

function TfrmImportarMDFe.ConsultaDestnatario(pessoa, cnpj, nome, ie, endereco,
  numero, bairro, cidade, cep, uf: string; id_cidade: Integer): string;
begin
  result := '';
  qryDestinatario.Close;
  qryDestinatario.Params[0].Value := cnpj;
  qryDestinatario.Open;

  if qryDestinatario.IsEmpty then
  begin
    qryDestinatario.Insert;
    qryDestinatarioCODIGO.AsFloat := dados.Numerador('CTE_DESTINATARIO',
      'CODIGO', 'N', '', '');
    qryDestinatarioNOME.Value := nome;
    qryDestinatarioCNPJ.Value := cnpj;
    qryDestinatarioIE.Value := ie;
    qryDestinatarioENDERECO.Value := endereco;
    qryDestinatarioNUMERO.Value := numero;
    qryDestinatarioBAIRRO.Value := bairro;
    qryDestinatarioID_CIDADE.Value := id_cidade;
    qryDestinatarioCIDADE.Value := cidade;
    qryDestinatarioCEP.Value := cep;
    qryDestinatarioUF.Value := uf;
    qryDestinatarioFK_USUARIO.Value := dados.idUsuario;
    qryDestinatarioFK_EMPRESA.Value := cbEmpresa.KeyValue;
    qryDestinatario.Post;
    dados.Conexao.CommitRetaining;
    result := qryDestinatarioCNPJ.Value;
  end
  else
    result := qryDestinatarioCNPJ.Value;

end;

procedure TfrmImportarMDFe.ImportaXml(caminho: string);
var
  pessoa, cpf_cnpj: string;
begin
  if CbTipo.Text = 'CTE' then
  begin
    ACBrCTe.Conhecimentos.Clear;
    if FileExists(edtCaminho.Text) then
      ACBrCTe.Conhecimentos.LoadFromFile(edtCaminho.Text)
    else
    begin
      ShowMessage('Arquivo não encontrado!');
      exit;
    end;

    // insere destinario senao existir

    if length(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF) = 11 then
    begin
      pessoa := 'FÍSICA';
      cpf_cnpj := copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 1, 3) +
        '.' + copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 4, 3) + '.'
        + copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 7, 3) + '-' +
        copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 10, 2);
    end;

    if length(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF) = 14 then
    begin
      cpf_cnpj := copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 1, 2) +
        '.' + copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 3, 3) + '.'
        + copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 6, 3) + '/' +
        copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 9, 4) + '-' +
        copy(ACBrCTe.Conhecimentos.Items[0].CTe.dest.CNPJCPF, 13, 2);
      pessoa := 'JURÍDICA';
    end;

    qryDestinatario.Close;
    qryDestinatario.Params[0].Value := ConsultaDestnatario(pessoa, cpf_cnpj,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.xNome,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.ie,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.xLgr,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.nro,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.xBairro,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.xMun,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.cep.ToString,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.uf,
      ACBrCTe.Conhecimentos.Items[0].CTe.dest.enderDest.cMun);
    qryDestinatario.Open;

    if not(frmCadMDFe.qryMDFE_M.State in dsEditModes) then
      frmCadMDFe.qryMDFE_M.Edit;

    frmCadMDFe.qryMDFE_MFK_TRANSPORTADOR.Value := 0;
    frmCadMDFe.qryMDFE_MTIPO_MDFE.Value := 'CTE';
    frmCadMDFe.qryMDFE_MUF_INICIO.Value := dados.qryEmpresaUF.Value;
    frmCadMDFe.qryMDFE_MUF_FIM.Value := qryDestinatarioUF.Value;
    frmCadMDFe.qryMDFE_MID_ORIGEM.AsInteger := dados.qryEmpresaID_CIDADE.Value;
    frmCadMDFe.qryMDFE_MID_DESTINO.AsInteger := qryDestinatarioID_CIDADE.Value;
    frmCadMDFe.qryMDFE_MQTD_CTE.Value := 0;
    frmCadMDFe.qryMDFE_MQTD_CARGA.Value := 0;
    frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := 0;
    frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '';
    frmCadMDFe.qryMDFE_M.Post;
    dados.Conexao.CommitRetaining;

    frmCadMDFe.qryMDFE_D.Append;
    frmCadMDFe.qryMDFE_DFK_MDFE_MASTER.Value :=
      frmCadMDFe.qryMDFE_MCODIGO.Value;
    frmCadMDFe.qryMDFE_DCODIGO.AsFloat := dados.Numerador('MDFE_DETALHE',
      'CODIGO', 'N', '', '');
    frmCadMDFe.qryMDFE_DCHAVE.Value :=
      copy(ACBrCTe.Conhecimentos.Items[0].CTe.infCTe.ID, 4, 100);
    frmCadMDFe.qryMDFE_DNUMERO.Value := ACBrCTe.Conhecimentos.Items[0]
      .CTe.Ide.nCT;
    frmCadMDFe.qryMDFE_DFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
    frmCadMDFe.qryMDFE_DVALOR.Value := 0;
    frmCadMDFe.qryMDFE_DPESO.Value := 0;
    frmCadMDFe.qryMDFE_DFK_USUARIO.Value := dados.idUsuario;
    frmCadMDFe.qryMDFE_DFK_EMPRESA.Value :=
      frmCadMDFe.qryMDFE_MFK_EMPRESA.Value;
    frmCadMDFe.qryMDFE_D.Post;
    dados.Conexao.CommitRetaining;

    qrySoma.Close;
    qrySoma.Params[0].Value := frmCadMDFe.qryMDFE_MCODIGO.Value;
    qrySoma.Open;

    if not(frmCadMDFe.qryMDFE_M.State in dsEditModes) then
      frmCadMDFe.qryMDFE_M.Edit;
    frmCadMDFe.qryMDFE_MQTD_CTE.Value := qrySomaITEM.Value;
    frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := qrySomaVALOR.Value;
    frmCadMDFe.qryMDFE_MQTD_CARGA.Value := qrySomaPESO.Value;
    frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '1';
    frmCadMDFe.qryMDFE_M.Post;

  end;

  if CbTipo.Text = 'NFE' then
  begin

    ACBrNFe.NotasFiscais.Clear;
    if FileExists(edtCaminho.Text) then
      ACBrNFe.NotasFiscais.LoadFromFile(edtCaminho.Text)
    else
    begin
      ShowMessage('Arquivo Inválido!');
      exit;
    end;

    // insere destinario senao existir

    if length(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF) = 11 then
    begin
      cpf_cnpj := copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 1, 3) +
        '.' + copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 4, 3) + '.' +
        copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 7, 3) + '-' +
        copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 10, 2);
      pessoa := 'FISÍCA';
    end;

    if length(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF) = 14 then
    begin
      cpf_cnpj := copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 1, 2) +
        '.' + copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 3, 3) + '.' +
        copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 6, 3) + '/' +
        copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 9, 4) + '-' +
        copy(ACBrNFe.NotasFiscais.Items[0].NFe.dest.CNPJCPF, 13, 2);
      pessoa := 'JURÍDICA';
    end;

    qryDestinatario.Close;
    qryDestinatario.Params[0].Value := ConsultaDestnatario(pessoa, cpf_cnpj,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.xNome,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.ie,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.xLgr,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.nro,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.xBairro,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.xMun,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.cep.ToString,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.uf,
      ACBrNFe.NotasFiscais.Items[0].NFe.dest.enderDest.cMun);
    qryDestinatario.Open;

    if not(frmCadMDFe.qryMDFE_M.State in dsEditModes) then
      frmCadMDFe.qryMDFE_M.Edit;

    frmCadMDFe.qryMDFE_MFK_TRANSPORTADOR.Value := 0;
    frmCadMDFe.qryMDFE_MUF_INICIO.Value := dados.qryEmpresaUF.Value;
    frmCadMDFe.qryMDFE_MUF_FIM.Value := qryDestinatarioUF.Value;
    frmCadMDFe.qryMDFE_MID_ORIGEM.AsInteger := dados.qryEmpresaID_CIDADE.Value;
    frmCadMDFe.qryMDFE_MID_DESTINO.AsInteger := qryDestinatarioID_CIDADE.Value;
    frmCadMDFe.qryMDFE_MQTD_CTE.Value := 0;
    frmCadMDFe.qryMDFE_MQTD_CARGA.Value := 0;
    frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := 0;
    frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '';
    frmCadMDFe.qryMDFE_MTIPO_MDFE.Value := 'NFE';
    frmCadMDFe.qryMDFE_M.Post;
    dados.Conexao.CommitRetaining;

    frmCadMDFe.qryMDFE_D.Append;
    frmCadMDFe.qryMDFE_DFK_MDFE_MASTER.Value :=
      frmCadMDFe.qryMDFE_MCODIGO.Value;
    frmCadMDFe.qryMDFE_DCODIGO.AsFloat := dados.Numerador('MDFE_DETALHE',
      'CODIGO', 'N', '', '');
    frmCadMDFe.qryMDFE_DCHAVE.Value :=
      copy(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 4, 100);
    frmCadMDFe.qryMDFE_DNUMERO.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.Ide.cNF;
    frmCadMDFe.qryMDFE_DFK_DESTINATARIO.Value := qryDestinatarioCODIGO.Value;
    frmCadMDFe.qryMDFE_DVALOR.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.Total.ICMSTot.vNF;
    frmCadMDFe.qryMDFE_DPESO.Value := ACBrNFe.NotasFiscais.Items[0]
      .NFe.Transp.Vol.Items[0].pesoL;
    frmCadMDFe.qryMDFE_DFK_USUARIO.Value := dados.idUsuario;
    frmCadMDFe.qryMDFE_DFK_EMPRESA.Value :=
      frmCadMDFe.qryMDFE_MFK_EMPRESA.Value;
    frmCadMDFe.qryMDFE_D.Post;
    dados.Conexao.CommitRetaining;

    qrySoma.Close;
    qrySoma.Params[0].Value := frmCadMDFe.qryMDFE_MCODIGO.Value;
    qrySoma.Open;

    if not(frmCadMDFe.qryMDFE_M.State in dsEditModes) then
      frmCadMDFe.qryMDFE_M.Edit;
    frmCadMDFe.qryMDFE_MQTD_CTE.Value := qrySomaITEM.Value;
    frmCadMDFe.qryMDFE_MVALOR_CARGA.Value := qrySomaVALOR.Value;
    frmCadMDFe.qryMDFE_MQTD_CARGA.Value := qrySomaPESO.Value;
    frmCadMDFe.qryMDFE_MUNIDADE_CARGA.Value := '1';
    frmCadMDFe.qryMDFE_M.Post;
  end

end;

procedure TfrmImportarMDFe.qryCTE_MAfterOpen(DataSet: TDataSet);
begin
  qryCTE_D.Close;
  qryCTE_D.Open;
end;

procedure TfrmImportarMDFe.btnImportarClick(Sender: TObject);
begin
  if chkLerXml.Checked then
    ImportaXml('')
  else
    ImportaBanco(0, 0);
  Close;
end;

procedure TfrmImportarMDFe.btnPesqClick(Sender: TObject);
begin
  try
    Abrir.Execute;
    edtCaminho.Text := Abrir.FileName;
  except
    raise Exception.Create('Erro ao carragar arquivo XML!');
  end;
end;

procedure TfrmImportarMDFe.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarMDFe.CbTipoChange(Sender: TObject);
begin
  Estado;
end;

procedure TfrmImportarMDFe.chkLerXmlClick(Sender: TObject);
begin
  Estado;
end;

procedure TfrmImportarMDFe.Estado;
begin
  if not chkLerXml.Checked then
  begin
    btnPesq.Enabled := False;
    cbEmpresa.Visible := true;
    edtCaminho.Visible := False;
    edtNumero.Visible := true;
    Label3.Visible := true;
    Label2.Caption := 'Empresa';
  end
  else
  begin
    btnPesq.Enabled := true;
    cbEmpresa.Visible := False;
    edtCaminho.Visible := true;
    edtNumero.Visible := False;
    Label3.Visible := False;
    Label2.Caption := 'Caminho';
  end;
end;

procedure TfrmImportarMDFe.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmImportarMDFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnImportar.Click;
  if Key = VK_ESCAPE then
    btnSairClick(self);
end;

procedure TfrmImportarMDFe.FormShow(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.Open;

  CbTipo.ItemIndex := 1;
  Estado;

  cbEmpresa.KeyValue := dados.qryEmpresaCODIGO.Value;
end;

end.
