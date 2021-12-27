unit uNaoEncerrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, pcnconversao, pmdfeConversaoMDFe, ACBrDFeSSL,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, blcksock,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DBGridEh, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh,
  Vcl.DBCtrls, ACBrBase, ACBrDFe, ACBrMDFe;

type
  TfrmEncerrar = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnSair: TSpeedButton;
    btnEncerrar: TSpeedButton;
    qryEncerrar: TFDQuery;
    dsEncerrar: TDataSource;
    btnPesquisar: TSpeedButton;
    Panel3: TPanel;
    Label69: TLabel;
    dsEmpresa: TDataSource;
    qryEncerrarCHAVE: TStringField;
    qryEncerrarPROTOCOLO: TStringField;
    qryEncerrarFK_EMPRESA: TIntegerField;
    edtEmp: TDBEdit;
    ACBrMDFe: TACBrMDFe;
    qryEncerrarSITUACAO: TStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure cbEmpresaChange(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ACBrMDFeStatusChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure ConfiguraMDFe;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncerrar: TfrmEncerrar;

implementation

{$R *.dfm}

uses ufrmstatus, Udados, uDadosWeb;

procedure TfrmEncerrar.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEncerrar.cbEmpresaChange(Sender: TObject);
begin

  qryEncerrar.close;
  qryEncerrar.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  qryEncerrar.Open;
end;

procedure TfrmEncerrar.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmEncerrar.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmEncerrar.FormCreate(Sender: TObject);
begin

  qryEncerrar.close;
  qryEncerrar.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  qryEncerrar.Open;
end;

procedure TfrmEncerrar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnPesquisar.Click;
  if Key = vk_f3 then
    btnPesquisar.Click;
  if Key = vk_escape then
    btnSair.Click;
end;

procedure TfrmEncerrar.ACBrMDFeStatusChange(Sender: TObject);
begin
  case ACBrMDFe.Status of
    stMDFeIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stMDFeStatusServico:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Verificando Status do servico...';
        Show;
        BringToFront;
      end;
    stMDFeRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Enviando dados do MDFe...';
        Show;
        BringToFront;
      end;
    stMDFeRetRecepcao:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Recebendo dados do MDFe...';
        Show;
        BringToFront;
      end;
    stMDFeConsulta:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Consultando MDFe...';
        Show;
        BringToFront;
      end;
    stMDFeEvento:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Enviando Evento de MDFe...';
        Show;
        BringToFront;
      end;
    stMDFeRecibo:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblstatus.Caption := 'Consultando Recibo de Lote...';
        Show;
        BringToFront;
      end;
  end;

  Application.ProcessMessages;

end;

procedure TfrmEncerrar.ConfiguraMDFe;
var
  Ok: Boolean;
  PathMensal: String;
begin

  dados.qryConfig.close;
  dados.qryConfig.Params[0].Value := dados.qryEmpresaCODIGO.Value;
  dados.qryConfig.Open;

  // Configurações -> Certificados

  ACBrMDFe.Configuracoes.Certificados.ArquivoPFX :=
    dados.qryConfigCAMINHO_CERTIFICADO.Value;
  ACBrMDFe.Configuracoes.Certificados.NumeroSerie :=
    dados.qryConfigNUMEROSERIECERTFICADO.Value;
  ACBrMDFe.Configuracoes.Certificados.Senha :=
    dados.qryConfigSENHACERTIFICADO.Value;
  ACBrMDFe.Configuracoes.Certificados.VerificarValidade := true;

  // Configurações -> Arquivos
  ACBrMDFe.Configuracoes.Arquivos.AdicionarLiteral := false;
  ACBrMDFe.Configuracoes.Arquivos.EmissaoPathMDFe := true;
  ACBrMDFe.Configuracoes.Arquivos.SepararPorMes := true;

  ACBrMDFe.Configuracoes.Arquivos.PathMDFe :=
    Trim(dados.qryConfigMDFE_PATH_MDFE.Value);
  ACBrMDFe.Configuracoes.Arquivos.PathEvento :=
    Trim(dados.qryConfigMDFE_PATH_EVENTO.Value);
  ACBrMDFe.Configuracoes.Arquivos.PathSalvar :=
    Trim(dados.qryConfigMDFE_PATH_SALVAR.Value);

  ACBrMDFe.Configuracoes.Arquivos.Salvar := true;
  ACBrMDFe.Configuracoes.Arquivos.PathSchemas :=
    Trim(dados.qryConfigMDFE_PATH_SCHEMA.Value);

  PathMensal := ACBrMDFe.Configuracoes.Arquivos.GetPathMDFe(0);

  // Configurações -> Geral
  ACBrMDFe.Configuracoes.Geral.FormaEmissao := StrToTpEmis(Ok, IntToStr(0));
  ACBrMDFe.Configuracoes.Geral.Salvar := true;

  ACBrMDFe.SSL.DescarregarCertificado;

  case dados.qryConfigMDFE_VERSAO.Value of
    0:
      ACBrMDFe.Configuracoes.Geral.VersaoDF := ve100;
    1:
      ACBrMDFe.Configuracoes.Geral.VersaoDF := ve300;
  end;

  ACBrMDFe.Configuracoes.Geral.SSLLib :=
    TSSLLib(dados.qryConfigTIPO_EMISSAO.Value);
  ACBrMDFe.Configuracoes.Geral.SSLCryptLib :=
    TSSLCryptLib(dados.qryConfigCRYPTLIB.AsInteger);
  ACBrMDFe.Configuracoes.Geral.SSLHttpLib :=
    TSSLHttpLib(dados.qryConfigHTTPLIB.AsInteger);
  ACBrMDFe.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(dados.qryConfigXMLSIGN.AsInteger);

  ACBrMDFe.SSL.SSLType := TSSLType(dados.qryconfigSSL_TIPO.AsInteger);

  ACBrMDFe.Configuracoes.Arquivos.PathSalvar :=
    dados.qryConfigMDFE_PATH_SALVAR.Value;

  // Configurações -> WebServices
  ACBrMDFe.Configuracoes.WebServices.AguardarConsultaRet := 60;
  ACBrMDFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := false;
  ACBrMDFe.Configuracoes.WebServices.Ambiente := taProducao;
  if dados.qryConfigAMBIENTE.Value = 1 then
    ACBrMDFe.Configuracoes.WebServices.Ambiente := taHomologacao;

  ACBrMDFe.Configuracoes.WebServices.IntervaloTentativas := 5;
  ACBrMDFe.Configuracoes.WebServices.Tentativas := 1000;
  ACBrMDFe.Configuracoes.WebServices.UF := dados.qryConfigUF.Value;

  ACBrMDFe.Configuracoes.WebServices.Visualizar := false;
  if dados.qryConfigVISUALIZAR.Value = 'S' then
    ACBrMDFe.Configuracoes.WebServices.Visualizar := true;
  ACBrMDFe.Configuracoes.WebServices.Salvar := false;

  ACBrMDFe.Configuracoes.WebServices.ProxyHost := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyPort := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyUser := '';
  ACBrMDFe.Configuracoes.WebServices.ProxyPass := '';

  // DAMDFe
  if ACBrMDFe.DAMDFe <> nil then
  begin
    ACBrMDFe.DAMDFe.PathPDF := PathMensal;
    ACBrMDFe.DAMDFe.ExpandeLogoMarca := false;
    ACBrMDFe.DAMDFe.Logo := dados.qryConfigLOGOMARCA.Value;
    ACBrMDFe.DAMDFe.MostraPreview := true;
    ACBrMDFe.DAMDFe.TipoDAMDFe := StrToTpImp(Ok, IntToStr(1));
  end;

end;

procedure TfrmEncerrar.btnEncerrarClick(Sender: TObject);
begin

  if qryEncerrar.IsEmpty then
  begin
    ShowMessage('Não existe MDFe para ser ENCERRADA ');
    exit;
  end;

  ConfiguraMDFe;

  try
    btnEncerrar.Enabled := false;
    ACBrMDFe.Manifestos.Clear;
    ACBrMDFe.EventoMDFe.Evento.Clear;

    with ACBrMDFe.EventoMDFe.Evento.Add do
    begin
      infEvento.chMDFe := qryEncerrarCHAVE.Value;
      infEvento.CNPJCPF := dados.qryEmpresaCNPJ.Value;
      infEvento.dhEvento := now;
      infEvento.tpEvento := TpcnTpEvento(7);
      infEvento.nSeqEvento := 1;

      infEvento.detEvento.nProt := qryEncerrarPROTOCOLO.Value;
      infEvento.detEvento.dtEnc := Date;
      infEvento.detEvento.cUF := dados.qryEmpresaID_UF.Value;
      infEvento.detEvento.cMun := dados.qryEmpresaID_CIDADE.Value;;
    end;

    if ACBrMDFe.EnviarEvento(1) then
    begin
      qryEncerrar.Edit;
      qryEncerrarSITUACAO.Value := 'E';
      qryEncerrar.Post;
      dados.Conexao.CommitRetaining;

      dados.qryExecute.close;
      dados.qryExecute.SQL.Clear;
      dados.qryExecute.SQL.Add('update mdfe_master mdfe');
      dados.qryExecute.SQL.Add('set');
      dados.qryExecute.SQL.Add('situacao=''E''');
      dados.qryExecute.SQL.Add('where');
      dados.qryExecute.SQL.Add('chave=:chave');
      dados.qryExecute.Params[0].Value := qryEncerrarCHAVE.Value;
      dados.qryExecute.ExecSQL;
      dados.Conexao.CommitRetaining;
      ShowMessage('MDFe encerrado com sucesso!');

    end;

  finally
    btnEncerrar.Enabled := true;
    qryEncerrar.close;
    qryEncerrar.Params[0].Value := dados.qryEmpresaCODIGO.Value;
    qryEncerrar.Open;

  end;
end;

procedure TfrmEncerrar.btnPesquisarClick(Sender: TObject);
var
  i: Integer;
begin
  try

    ConfiguraMDFe;

    btnPesquisar.Enabled := false;
    dados.qryExecute.close;
    dados.qryExecute.SQL.Clear;
    dados.qryExecute.SQL.Add('delete from MDFE_ENCERRAR');
    dados.qryExecute.ExecSQL;
    dados.Conexao.CommitRetaining;

    ACBrMDFe.Manifestos.Clear;
    ACBrMDFe.EventoMDFe.Evento.Clear;

    ACBrMDFe.WebServices.ConsultaMDFeNaoEnc(dados.qryEmpresaCNPJ.Value);

  finally
    for i := 0 to ACBrMDFe.WebServices.ConsMDFeNaoEnc.InfMDFe.Count - 1 do
    begin
      qryEncerrar.Insert;
      qryEncerrarCHAVE.Value := ACBrMDFe.WebServices.ConsMDFeNaoEnc.InfMDFe.
        Items[i].chMDFe;
      qryEncerrarPROTOCOLO.Value := ACBrMDFe.WebServices.ConsMDFeNaoEnc.InfMDFe.
        Items[i].nProt;
      qryEncerrarFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryEncerrar.Post;
      dados.Conexao.CommitRetaining;
    end;
    btnPesquisar.Enabled := true;
  end;

end;

end.
