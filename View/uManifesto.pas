unit uManifesto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, blcksock,
  System.Classes, Vcl.Graphics, dateutils, pcnconversao, pcnconversaonfe,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, EhLibVCL,
  GridsEh, DBAxisGridsEh, Vcl.Tabs, DBCtrlsEh, DBLookupEh, Vcl.ExtCtrls,
  ACBrUtil,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, ACBrDFeSSL,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrBase, ACBrDFe, ACBrNFe, Math, Vcl.DBCtrls,
  Vcl.ComCtrls;

type
  TFrmManifesto = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    qryManifesto: TFDQuery;
    dsManifesto: TDataSource;
    qryManifestoCODIGO: TIntegerField;
    qryManifestoNUMERO: TStringField;
    qryManifestoCHAVE: TStringField;
    qryManifestoSERIE: TStringField;
    qryManifestoNOME: TStringField;
    qryManifestoCNPJ: TStringField;
    qryManifestoIE: TStringField;
    qryManifestoNSU: TStringField;
    qryManifestoDT_ENTRADA: TDateField;
    qryManifestoDT_EMISSAO: TDateField;
    qryManifestoSITUACAO: TStringField;
    qryManifestoFK_EMPRESA: TIntegerField;
    qryManifestoFK_USUARIO: TIntegerField;
    dsEmpresa: TDataSource;
    btnGerar: TSpeedButton;
    MemoXML: TMemo;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    qryManifestoTTOTAL: TAggregateField;
    DBText2: TDBText;
    Label2: TLabel;
    qryExisteManifesto: TFDQuery;
    qryExisteManifestoCHAVE: TStringField;
    btnDesconhecer: TSpeedButton;
    qryManifestoVALOR: TFMTBCDField;
    qryManifestoCAMINHO_XML: TStringField;
    qryManifestoXML: TMemoField;
    qryManifestoGEROU: TStringField;
    btnLote: TSpeedButton;
    btnManifestar: TSpeedButton;
    btnChave: TSpeedButton;
    Panel5: TPanel;
    qryExisteManifestoNSU: TStringField;
    qryExisteManifestoFK_EMPRESA: TIntegerField;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    TabSet1: TTabControl;
    DBGrid1: TDBGridEh;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumnEh);
    procedure edtLocChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure qryManifestoBeforePost(DataSet: TDataSet);
    procedure btnMnifestarClick(Sender: TObject);
    procedure btnManifestarClick(Sender: TObject);
    procedure qryManifestoAfterScroll(DataSet: TDataSet);
    procedure btnDesconhecerClick(Sender: TObject);
    procedure btnLoteClick(Sender: TObject);
    procedure btnChaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
  private
    operacao, idx: Integer;
    xChave, vOrdem, vSql: String;
    procedure tamanho;
    procedure localiza;

    function ConsultaXml(chave: string): string;
    function GerouCompra(chave: string): boolean;
    function GerouManifesto(chave, cnpj: string;
      situacao: TpcnTpEvento): boolean;
    procedure manifeto;
    function ConsultaNFeNSU(UF: Integer; cnpj, ultnsu: string): boolean;
    function ConsultaNFeChave(UF: Integer; cnpj, chave: string): boolean;
    procedure GerarManifesto(Orgao: Integer; chave, cnpj: String);
    procedure UpdateNSU(nsu: string; empresa: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManifesto: TFrmManifesto;

implementation

{$R *.dfm}

uses Udados, LeXmlNE, ufrmStatus, uDmNFe;

function TFrmManifesto.GerouManifesto(chave, cnpj: string;
  situacao: TpcnTpEvento): boolean;
var
  Msg: String;
  vsituacao: string;
begin
  Result := false;
  dmNFe.ACBrNFe.EventoNFe.Evento.Clear;
  with dmNFe.ACBrNFe.EventoNFe.Evento.New do
  begin
    InfEvento.cOrgao := 91;
    InfEvento.chNFe := Trim(OnlyNumber(chave));
    InfEvento.cnpj := Trim(OnlyNumber(cnpj));
    InfEvento.dhEvento := now;
    InfEvento.tpEvento := situacao;
  end;

  case situacao of

    teManifDestCiencia:
      vsituacao := 'M';
    teManifDestDesconhecimento:
      vsituacao := 'D';
    teManifDestConfirmacao:
      vsituacao := 'M';

  end;

  if dmNFe.ACBrNFe.EnviarEvento(StrToInt('1')) then
  begin

    qryManifesto.Edit;
    qryManifestoSITUACAO.AsString := vsituacao;
    qryManifesto.Post;
    dados.Conexao.CommitRetaining;
    manifeto;
    Result := true;

  end;
end;

function TFrmManifesto.ConsultaNFeNSU(UF: Integer;
  cnpj, ultnsu: string): boolean;
var
  i, j, k: Integer;
begin
  try
    Result := false;

    if dmNFe.ACBrNFe.DistribuicaoDFePorUltNSU(UF, cnpj,
      IntToStr(StrToInt(ultnsu))) then
    begin

      if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137
      then
      begin
        ShowMessage(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
          retDistDFeInt.xMotivo);
        exit;
      end;

      j := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
        docZip.Count - 1;
      for i := 0 to j do
      begin

        if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
          [i].resDFe.chDFe <> '' then
        begin

          qryExisteManifesto.Close;
          qryExisteManifesto.Params[0].Value :=
            dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
            [i].resDFe.chDFe;
          qryExisteManifesto.Open;

          if qryExisteManifestoCHAVE.Value <>
            dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
            [i].resDFe.chDFe then
          begin

            qryManifesto.Insert;
            qryManifestoCODIGO.Value := dados.Numerador('NFE_MANIFESTO',
              'CODIGO', 'N', '', '');

            qryManifestoCHAVE.Value :=
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].resDFe.chDFe;
            qryManifestoSERIE.Value :=
              COPY(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
              docZip.Items[i].resDFe.chDFe, 23, 3);
            qryManifestoNUMERO.Value :=
              COPY(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
              docZip.Items[i].resDFe.chDFe, 26, 9);
            qryManifestoCNPJ.Value := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
              retDistDFeInt.docZip.Items[i].resDFe.CNPJCPF;
            qryManifestoNOME.Value := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
              retDistDFeInt.docZip.Items[i].resDFe.xNome;
            qryManifestoIE.Value := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
              retDistDFeInt.docZip.Items[i].resDFe.IE;
            qryManifestoNSU.AsString :=
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].nsu;
            qryManifestoVALOR.Value :=
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].resDFe.vNF;
            qryManifestoSITUACAO.Value := 'P';
            qryManifestoFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
            qryManifestoFK_USUARIO.Value := dados.idUsuario;
            qryManifestoDT_ENTRADA.Value := now;
            qryManifestoDT_EMISSAO.Value :=
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].resDFe.dhRecbto;
            qryManifesto.Post;
            dados.Conexao.CommitRetaining;
            Result := true;
          end
          else
          begin
            UpdateNSU(qryExisteManifestoNSU.AsString,
              qryExisteManifestoFK_EMPRESA.AsInteger);
          end;
        end;
      end;
      Result := true;
    end;
  except
    On e: exception do
    begin
      with dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt do
        raise exception.Create('Retorno:' + xMotivo + sLineBreak + 'Erro:' +
          e.Message);
    end;
  end;
end;

function TFrmManifesto.ConsultaXml(chave: string): string;
var
  i, j: Integer;
  cnpj, caminho: string;

begin
  try

    qryManifesto.Edit;
    qryManifestoXML.Clear;
    qryManifesto.Post;
    dados.Conexao.CommitRetaining;

    cnpj := TiraPontos(dados.qryEmpresaCNPJ.Value);

    dmNFe.ACBrNFe.NotasFiscais.Clear;

    if dmNFe.ACBrNFe.DistribuicaoDFePorChaveNFe(dados.qryEmpresaID_UF.Value,
      cnpj, chave) then
    begin
      Sleep(1000);
      j := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
        docZip.Count - 1;

      if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137
      then
        raise exception.Create
          (dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);

      for i := 0 to j do
      begin
        qryManifesto.Edit;
        qryManifestoXML.Value := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
          retDistDFeInt.docZip.Items[i].XML;
        qryManifesto.Post;
        dados.Conexao.CommitRetaining;

      end;

    end
    else
    begin
      ShowMessage(dmNFe.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.
        Items[0].RetInfEvento.cStat.ToString + '-' +
        dmNFe.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
        .RetInfEvento.xMotivo);
    end;
  except
    on e: exception do
      raise exception.Create(e.Message + sLineBreak + Label4.Caption +
        sLineBreak + Label5.Caption);
  end;
end;

procedure TFrmManifesto.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  vSql := ' select ma.* from nfe_manifesto ma where codigo>0 ' + ' /*where*/';

  filtro := filtro + ' and ma.fk_empresa=' + dados.qryEmpresaCODIGO.AsString;

  case idx of
    0:
      begin
        filtro := filtro + ' and ma.dt_entrada>=' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(maskInicio.EditText))
          ) + ' and ma.dt_entrada<=' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(maskFim.EditText)));
      end;
    1:
      begin
        filtro := filtro + ' and ma.dt_emissao>=' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(maskInicio.EditText))
          ) + ' and ma.dt_emissao<=' +
          QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(maskFim.EditText)));
      end;
  end;

  case idx of
    2:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.numero like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    3:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.chave like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;

    4:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.cnpj like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    5:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.nome like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;

    6:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.nsu like  ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    7:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ma.valor >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    0:
      filtro1 := ' and (ma.situacao=''P'')'; // MANIFESTADO
    1:
      filtro1 := ' and ma.situacao=''C'''; // GEROU COMPRAS
    2:
      filtro1 := ' and ma.situacao=''M'''; // GEROU Desconhecidas
    3:
      filtro1 := ' and ma.situacao=''D'''; // GEROU Desconhecidas
  end;

  case idx of
    0:
      ordem := ' order by ma.dt_entrada ' + vOrdem;
    1:
      ordem := ' order by ma.dt_emissao ' + vOrdem;
    2:
      ordem := ' order by ma.numero ' + vOrdem;
    3:
      ordem := ' order by ma.chave ' + vOrdem;
    4:
      ordem := ' order by ma.cnpj ' + vOrdem;
    5:
      ordem := ' order by ma.nome ' + vOrdem;
    6:
      ordem := ' order by ma.nsu ' + vOrdem;
    7:
      ordem := ' order by ma.valor ' + vOrdem;

  end;

  qryManifesto.Close;

  qryManifesto.SQL.Text := vSql;
  qryManifesto.SQL.Text := StringReplace(qryManifesto.SQL.Text, '/*where*/',
    filtro + filtro1 + ordem, [rfReplaceAll]);
  qryManifesto.Open;
end;

procedure TFrmManifesto.manifeto;
begin
  if (qryManifestoSITUACAO.AsString = 'P') then
  begin
    btnGerar.Enabled := false;
    btnManifestar.Enabled := true;
    btnDesconhecer.Enabled := true;

  end
  else if (qryManifestoSITUACAO.AsString = 'M') then
  begin
    btnGerar.Enabled := true;
    btnManifestar.Enabled := false;
    btnDesconhecer.Enabled := false;

  end;
end;

procedure TFrmManifesto.qryManifestoAfterScroll(DataSet: TDataSet);
begin
  manifeto;
end;

procedure TFrmManifesto.qryManifestoBeforePost(DataSet: TDataSet);
begin
  UpdateNSU(qryManifestoNSU.AsString, qryManifestoFK_EMPRESA.AsInteger);
end;

procedure TFrmManifesto.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

procedure TFrmManifesto.btnMnifestarClick(Sender: TObject);
begin
  dmNFe.ConfiguraNFe('NFe');
  if (MessageDlg('Confirma Conhecimento da Nota ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin

    dmNFe.ACBrNFe.NotasFiscais.Clear;

    GerouManifesto(qryManifestoCHAVE.Value, dados.qryEmpresaCNPJ.Value,
      teManifDestConfirmacao);

  end;

end;

procedure TFrmManifesto.GerarManifesto(Orgao: Integer; chave, cnpj: String);
begin
  dmNFe.ACBrNFe.EventoNFe.Evento.Clear;

  with dmNFe.ACBrNFe.EventoNFe.Evento.New do
  begin
    InfEvento.cOrgao := 91;
    InfEvento.chNFe := chave;
    InfEvento.cnpj := cnpj;
    InfEvento.dhEvento := now;
    InfEvento.tpEvento := teManifDestConfirmacao;
  end;
  dmNFe.ACBrNFe.EnviarEvento(StrToInt('1'));
  ShowMessage(dmNFe.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items
    [0].RetInfEvento.xMotivo);
end;

procedure TFrmManifesto.UpdateNSU(nsu: string; empresa: Integer);
begin
  dados.qryExecute.Close;
  dados.qryExecute.SQL.Text :=
    'update empresa set ultimonsu=:ult where codigo=:cod';
  dados.qryExecute.Params[0].Value := nsu;
  dados.qryExecute.Params[1].Value := empresa;
  dados.qryExecute.ExecSQL;
end;

procedure TFrmManifesto.btnChaveClick(Sender: TObject);
var
  xChave, chave: String;
begin
  try
    dmNFe.ConfiguraNFe('NFe');
    dmNFe.ACBrNFe.NotasFiscais.Clear;

    btnChave.Enabled := false;

    chave := InputBox('Chave da NFe', 'Digite a Chave', xChave);
    xChave := chave;
    if length(chave) <> 44 then
    begin
      ShowMessage('Chave Inválida');
      exit;
    end;

    if not qryManifesto.Active then
      localiza;

    TabSet1.TabIndex := 0;
    if ConsultaNFeChave(dados.qryEmpresaID_UF.Value, dados.qryEmpresaCNPJ.Value,
      chave) then
      localiza;
  finally
    btnChave.Enabled := true;
  end;
end;

procedure TFrmManifesto.btnDesconhecerClick(Sender: TObject);
begin
  dmNFe.ConfiguraNFe('NFe');
  if (MessageDlg('Confirma Desconhecimento da Nota ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin

    dmNFe.ACBrNFe.NotasFiscais.Clear;

    GerouManifesto(qryManifestoCHAVE.Value, dados.qryEmpresaCNPJ.Value,
      teManifDestDesconhecimento);
  end;
end;

procedure TFrmManifesto.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

function TFrmManifesto.GerouCompra(chave: string): boolean;
begin
  Result := false;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text := 'select id from compra where chave=:chave';
  dados.qryConsulta.Params[0].Value := chave;
  dados.qryConsulta.Open;
  if not dados.qryConsulta.IsEmpty then
  begin
    qryManifesto.Edit;
    qryManifestoSITUACAO.Value := 'C';
    qryManifesto.Post;
    dados.Conexao.CommitRetaining;
    Result := true;
  end
end;

procedure TFrmManifesto.btnGerarClick(Sender: TObject);
begin

  dmNFe.ConfiguraNFe('NFe');
  dmNFe.ACBrNFe.NotasFiscais.Clear;

  if qryManifesto.IsEmpty then
  begin
    ShowMessage('Não existe xml a p/ ser lido!');
    exit;
  end;

  if not btnGerar.Enabled then
    exit;

  if GerouCompra(qryManifestoCHAVE.Value) then
  begin
    If Application.messagebox('Compra já foi gerada, deseja continuar?',
      'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
    begin
      btnFiltrar.Click;
      exit;
    end;
  end;

  dmNFe.ACBrNFe.NotasFiscais.Clear;
  dmNFe.ACBrNFe.NotasFiscais.LoadFromString(qryManifestoXML.Value);
  dmNFe.ACBrNFe.NotasFiscais.Validar;

  if (qryManifestoXML.IsNull) or (qryManifestoXML.AsString = '') then
    ConsultaXml(qryManifestoCHAVE.Value)
  else
  begin
    if dmNFe.ACBrNFe.NotasFiscais.Items[0].Alertas <> '' then
      ConsultaXml(qryManifestoCHAVE.Value);
  end;

  try
    btnGerar.Enabled := false;
    frmxml := tfrmxml.Create(Application);
    frmxml.JaLeuXml := true;
    frmxml.ACBrNFe.NotasFiscais.Clear;
    frmxml.ACBrNFe.NotasFiscais.LoadFromString(qryManifestoXML.Value);
    frmxml.btnImportar.Click;
    frmxml.ShowModal;
  finally
    btnGerar.Enabled := true;
    frmxml.Release;
    GerouCompra(qryManifestoCHAVE.Value);
    localiza;
  end;
end;

function TFrmManifesto.ConsultaNFeChave(UF: Integer;
  cnpj, chave: string): boolean;
var
  i, j, k: Integer;
begin
  try
    Result := false;

    if dmNFe.ACBrNFe.DistribuicaoDFePorChaveNFe(UF, cnpj, chave) then
    begin
      if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137
      then
      begin
        ShowMessage(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
          retDistDFeInt.xMotivo);
        exit;
      end;

      j := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
        docZip.Count - 1;
      for i := 0 to j do
      begin

        if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items
          [i].resDFe.chDFe <> '' then
        begin
          if dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
            Items[i].resDFe.cSitDFe = TSituacaoDFe(snAutorizado) then
          begin
            // so notas autorizas

            qryExisteManifesto.Close;
            qryExisteManifesto.Params[0].Value :=
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].resDFe.chDFe;
            qryExisteManifesto.Open;

            if qryExisteManifestoCHAVE.Value <>
              dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
              Items[i].resDFe.chDFe then
            begin

              qryManifesto.Insert;
              qryManifestoCODIGO.Value := dados.Numerador('NFE_MANIFESTO',
                'CODIGO', 'N', '', '');

              qryManifestoCHAVE.Value :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].resDFe.chDFe;
              qryManifestoSERIE.Value :=
                COPY(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
                docZip.Items[i].resDFe.chDFe, 23, 3);
              qryManifestoNUMERO.Value :=
                COPY(dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.
                docZip.Items[i].resDFe.chDFe, 26, 9);
              qryManifestoCNPJ.Value :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].resDFe.CNPJCPF;
              qryManifestoNOME.Value :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].resDFe.xNome;
              qryManifestoIE.Value := dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.
                retDistDFeInt.docZip.Items[i].resDFe.IE;
              qryManifestoNSU.AsString :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].nsu;
              qryManifestoVALOR.Value :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].resDFe.vNF;
              qryManifestoSITUACAO.Value := 'P';
              qryManifestoFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
              qryManifestoFK_USUARIO.Value := dados.idUsuario;
              qryManifestoDT_ENTRADA.Value := now;
              qryManifestoDT_EMISSAO.Value :=
                dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.
                Items[i].resDFe.dhRecbto;
              qryManifesto.Post;
              dados.Conexao.CommitRetaining;
              Result := true;
            end;
          end;
        end;
      end;
    end;
  except
    On e: exception do
    begin
      with dmNFe.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt do
        raise exception.Create('Retorno:' + xMotivo + sLineBreak + 'Erro:' +
          e.Message);
    end;
  end;
end;

procedure TFrmManifesto.btnLoteClick(Sender: TObject);
var
  xChave, chave: String;
  nsu: string;
begin
  try

    dmNFe.ConfiguraNFe('NFe');
    dmNFe.ACBrNFe.NotasFiscais.Clear;

    btnChave.Enabled := false;

    if not qryManifesto.Active then
      localiza;

    TabSet1.TabIndex := 0;
    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select ultimonsu from empresa where codigo=:id';
    dados.qryConsulta.Params[0].Value := dados.qryEmpresaCODIGO.Value;
    dados.qryConsulta.Open;

    nsu := dados.qryConsulta.FieldByName('ultimonsu').AsString;

    if (nsu = '') then
    begin
      nsu := '0';
    end;

    if ConsultaNFeNSU(dados.qryEmpresaID_UF.Value,
      dados.qryEmpresaCNPJ.Value, nsu) then
      localiza;

  finally
    btnChave.Enabled := true;
  end;

end;

procedure TFrmManifesto.btnManifestarClick(Sender: TObject);
begin
  if (MessageDlg('Confirma Conhecimento da Nota ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    GerouManifesto(qryManifestoCHAVE.Value, dados.qryEmpresaCNPJ.Value,
      teManifDestConfirmacao);
  end;
end;

procedure TFrmManifesto.btnRelatorioClick(Sender: TObject);
begin
  //
end;

procedure TFrmManifesto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if odd((Sender as TDBGridEh).DataSource.DataSet.RecNo) then
    (Sender as TDBGridEh).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGridEh).Canvas.Brush.Color := $00FAF8F5;

  if (gdSelected in State) then
  begin
    (Sender as TDBGridEh).Canvas.Font.Color := clBlack;
    (Sender as TDBGridEh).Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];
  (Sender as TDBGridEh).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmManifesto.DBGrid1TitleClick(Column: TColumnEh);
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
  DBGrid1.Columns[0].Title.Caption := 'Data Entrada';
  DBGrid1.Columns[1].Title.Caption := 'Data Emissão';
  DBGrid1.Columns[2].Title.Caption := 'Número';
  DBGrid1.Columns[3].Title.Caption := 'Chave';
  DBGrid1.Columns[4].Title.Caption := 'CNPJ';
  DBGrid1.Columns[5].Title.Caption := 'Nome';
  DBGrid1.Columns[6].Title.Caption := 'NSU';
  DBGrid1.Columns[7].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

end;

procedure TFrmManifesto.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TFrmManifesto.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TFrmManifesto.FormCreate(Sender: TObject);
begin
  maskInicio.Text := DateToStr(StartOfTheMonth(DATE));
  maskFim.Text := DateToStr(DATE);
  btnChave.Caption := 'F2 Consulta Chave';
  btnLote.Caption := 'F3 Consulta Lote';
  btnManifestar.Caption := 'F4 Confirmar';
  btnDesconhecer.Caption := 'F5 Desconhecer';
  btnGerar.Caption := 'F6 Ler XML';

end;

procedure TFrmManifesto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnChave.Click;
  if Key = VK_F3 then
    btnLote.Click;
  if Key = VK_F4 then
    btnManifestar.Click;
  if Key = VK_F5 then
    btnDesconhecer.Click;
  if Key = VK_F6 then
    btnGerar.Click;
  if Key = VK_F12 then
    maskInicio.SetFocus;

end;

procedure TFrmManifesto.FormShow(Sender: TObject);
begin
  idx := 0;
  vOrdem := ' ASC';
  tamanho;
  DBGrid1TitleClick(DBGrid1.Columns[0]);
end;

procedure TFrmManifesto.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.24);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.26);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.09);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.07);
end;

end.
