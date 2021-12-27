unit uCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils, acbrutil, System.zip,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass,
  frxDBSet, frxExportPDF, ACBrBase, ACBrDFe, ACBrNFe, ACBrMail, DBGridEh,
  DBCtrlsEh, DBLookupEh, frxExportBaseDialog, frxExportXLS;

type
  TfrmCompra = class(TForm)
    dsCompra: TDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    LblSaldo: TLabel;
    DBText2: TDBText;
    Label2: TLabel;
    Panel4: TPanel;
    dsEmpresa: TDataSource;
    qryItensCompra: TFDQuery;
    qryItensCompraID: TIntegerField;
    qryItensCompraFK_COMPRA: TIntegerField;
    qryItensCompraEMPRESA: TSmallintField;
    qryItensCompraITEM: TSmallintField;
    qryItensCompraFK_PRODUTO: TIntegerField;
    qryItensCompraCFOP: TStringField;
    qryItensCompraCST_ICM: TStringField;
    qryItensCompraGERA_CP: TStringField;
    qryItensCompraGERA_ES: TStringField;
    qryItensCompraSITUACAO: TStringField;
    qryItensCompraFK_PRODUTO_FORN: TStringField;
    qryItensCompraVL_UNITARIO: TFMTBCDField;
    qryItensCompraQTD: TFMTBCDField;
    qryItensCompraE_MEDIO: TFMTBCDField;
    qryItensCompraVL_ITEM: TFMTBCDField;
    qryItensCompraBASE_IPI: TFMTBCDField;
    qryItensCompraALIQ_IPI: TFMTBCDField;
    qryItensCompraVL_IPI: TFMTBCDField;
    qryItensCompraBASE_ICMS: TFMTBCDField;
    qryItensCompraALIQ_ICMS: TFMTBCDField;
    qryItensCompraVL_ICMS: TFMTBCDField;
    qryItensCompraBASE_ST: TFMTBCDField;
    qryItensCompraVL_ST: TFMTBCDField;
    qryItensCompraBASE_PIS: TFMTBCDField;
    qryItensCompraALIQ_PIS: TFMTBCDField;
    qryItensCompraVL_PIS: TFMTBCDField;
    qryItensCompraBASE_COF: TFMTBCDField;
    qryItensCompraALIQ_COF: TFMTBCDField;
    qryItensCompraVL_COF: TFMTBCDField;
    qryItensCompraFRETE1: TFMTBCDField;
    qryItensCompraDESPESA: TFMTBCDField;
    qryItensCompraSEGURO: TFMTBCDField;
    qryItensCompraDESCONTO: TFMTBCDField;
    qryItensCompraCST_PIS: TStringField;
    qryItensCompraCST_COF: TStringField;
    qryItensCompraCST_IPI: TStringField;
    qryItensCompraALIQ_ST: TFMTBCDField;
    qryItensCompraFK_USUARIO: TIntegerField;
    btnPDF: TSpeedButton;
    PagUtilidade: TPageControl;
    TabGerar: TTabSheet;
    pnGerar: TPanel;
    lblStatus: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    memLista: TListBox;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edtArquivo: TEdit;
    Button1: TButton;
    qryXML: TFDQuery;
    ACBrNFe: TACBrNFe;
    ACBrMail1: TACBrMail;
    qryXMLNR_NOTA: TStringField;
    qryXMLDTENTRADA: TDateField;
    qryXMLCHAVE: TStringField;
    qryXMLSTATUS: TStringField;
    qryXMLSERIE: TStringField;
    qryXMLXML: TMemoField;
    qryXMLTOTAL: TFMTBCDField;
    dsContador: TDataSource;
    qryContador: TFDQuery;
    qryContadorEMAIL: TStringField;
    edtEmail: TDBLookupComboboxEh;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBEmpresa: TfrxDBDataset;
    frxDBCompra: TfrxDBDataset;
    frxDBItens: TfrxDBDataset;
    qryItensCompraDESCRICAO: TStringField;
    frxXLSExport2: TfrxXLSExport;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    bbView: TSpeedButton;
    btnImp: TSpeedButton;
    btnGerar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbNovoClick(Sender: TObject);
    procedure bbAlterarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure btnImpClick(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
  private
    Caminho_Completo, caminho, pasta: string;
    procedure localiza;
    procedure tamanho;
    procedure GerarXml;
    procedure ListarArquivos(Diretorio: string; Sub: Boolean);
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure compactanfce(caminho, pasta: string);
    procedure EnviarEmail(titulo: string);
    procedure CancelaItem(CodCompra: Integer);
    function VerificaCP(aCompra: Integer): Boolean;
    function VerificaDevolucao(aCompra: Integer): Boolean;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: String;
    { Public declarations }
  end;

var
  frmCompra: TfrmCompra;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uSupervisor, LeXmlNE, uDmNFe, uDMEstoque;

procedure TfrmCompra.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer(aStatus);
  Application.ProcessMessages;
end;

procedure TfrmCompra.bbAlterarClick(Sender: TObject);
var
  vSituacao: string;
begin
  dados.vAutorizar := true;

  if dados.qryCompra.IsEmpty then
    exit;

  if (dados.qryCompraSTATUS.Value = 'C') then
  begin
    ShowMessage('Compra Cancelada não pode ser Alterada!');
    exit;
  end;

  if dados.qryCompraSTATUS.Value = 'F' then
  begin

    if dados.qryCompraGERA_CP.Value = 'S' then
    begin
      if VerificaCP(dados.qryCompraID.AsInteger) then
        raise Exception.Create('Alteração não pode ser realizado!' + sLineBreak
          + 'Existem contas baixadas no contas a pagar, para esta compra!');
    end;

    if VerificaDevolucao(dados.qryCompraID.AsInteger) then
      raise Exception.Create('Alteração não pode ser realizado!' + sLineBreak +
        'Existe devolução de mercadoria para esta compra!');

    If Application.messagebox('Tem certeza que deseja REABRIR COMPRA?',
      'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
      exit;
  end;

  if (dados.qryCompraSTATUS.Value = 'F') or (dados.qryCompraSTATUS.Value = 'C')
  then
  begin
    if not dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  try
    frmCadCompra := TfrmCadCompra.Create(Application);

    with frmCadCompra do
    begin
      vpessoa := dados.qryCompraNOME.AsString;
      qryCompra.Close;
      qryCompra.Params[0].Value := dados.qryCompraID.Value;
      qryCompra.Open;
      vSituacao := frmCadCompra.qryCompraSTATUS.Value;
      if qryCompra.IsEmpty then
        exit;

      if dados.qryCompraSTATUS.Value = 'F' then
      begin

        dmestoque.RemoveEstoqueCompra(dados.qryCompraID.Value,
          dados.qryCompraEHFISCAL.Value);
        dmestoque.RemoveEstoqueGRadeCompra(dados.qryCompraID.Value);

        qryCompra.edit;
        qryCompraSTATUS.Value := 'A';
        qryCompra.Post;

      end;

      btnCancelar.Enabled := true;
      btnFinalizar.Enabled := true;
      frmCadCompra.btnPessoas.Enabled := true;
      frmCadCompra.btnProdutos.Enabled := true;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := false;
      Panel2.Enabled := true;
      Panel3.Enabled := true;

      frmCadCompra.ShowModal;
    end;
  finally
    frmCadCompra.Release;
    btnAtualizar.Click;
    maskFim.SetFocus;
  end;

end;

procedure TfrmCompra.bbNovoClick(Sender: TObject);
begin
  try
    frmCadCompra := TfrmCadCompra.Create(Application);
    with frmCadCompra do
    begin
      vpessoa := '';
      qryCompra.Close;
      qryCompra.Params[0].Value := -1;
      qryCompra.Open;

      qryCompra.Insert;
      btnCancelar.Enabled := true;
      btnSair.Enabled := true;
      btnFinalizar.Enabled := true;

      frmCadCompra.btnPessoas.Enabled := true;
      frmCadCompra.btnProdutos.Enabled := true;

      DBGridEh1.ReadOnly := false;
      Panel2.Enabled := true;
      Panel3.Enabled := true;
      frmCadCompra.ShowModal;
    end;
  finally
    frmCadCompra.Release;
    btnAtualizar.Click;
    maskInicio.SetFocus;
  end;

end;

procedure TfrmCompra.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qryCompraID.Value;
    localiza;
    dados.qryCompra.Locate('id', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmCompra.CancelaItem(CodCompra: Integer);
begin
  dados.qryUpdate.Close;
  dados.qryUpdate.SQL.Text :=
    'update COMPRA_ITENS set situacao=''C'' where FK_COMPRA=:COMPRA';
  dados.qryUpdate.ParamByName('compra').AsInteger := CodCompra;
  dados.qryUpdate.prepare;
  dados.qryUpdate.ExecSQL;
  dados.Conexao.CommitRetaining;
end;

function TfrmCompra.VerificaCP(aCompra: Integer): Boolean;
var
  qryCP: TFDQuery;
begin
  try
    Result := false;
    qryCP := TFDQuery.Create(self);
    qryCP.Connection := dados.Conexao;

    qryCP.Close;
    qryCP.SQL.Clear;
    qryCP.SQL.add('select vlpago from cpagar where fk_compra=:compra');
    qryCP.Params[0].Value := aCompra;
    qryCP.Open;

    if qryCP.FieldByName('vlpago').AsFloat > 0 then
      Result := true;
  finally
    qryCP.Free;
  end;

end;

function TfrmCompra.VerificaDevolucao(aCompra: Integer): Boolean;
var
  qryCP: TFDQuery;
begin
  try
    Result := false;
    qryCP := TFDQuery.Create(self);
    qryCP.Connection := dados.Conexao;

    qryCP.Close;
    qryCP.SQL.Clear;
    qryCP.SQL.add
      ('select sum(dcd.qtd_devolvida) as qtd from devolucao_compra_d dcd');
    qryCP.SQL.add
      ('left join devoluca_compra_m dcm on dcm.codigo=dcd.fk_devolucao_compra_m');
    qryCP.SQL.add('where');
    qryCP.SQL.add('dcm.numero_compra=:numero');
    qryCP.Params[0].Value := aCompra;
    qryCP.Open;

    if qryCP.FieldByName('qtd').AsFloat > 0 then
      Result := true;
  finally
    qryCP.Free;
  end;

end;

procedure TfrmCompra.btnCancelarClick(Sender: TObject);
begin

  if dados.qryCompra.IsEmpty then
  begin
    exit;
  end;

  if (dados.qryCompraSTATUS.Value = 'C') then
  begin
    ShowMessage('Compra já está Cancelada!');
    exit;
  end;

  if VerificaDevolucao(dados.qryCompraID.Value) then
    raise Exception.Create('Compra não pode ser cancelada!' + sLineBreak +
      'Existe devolução de mercadoria realizada para esta compra!');

  dados.vAutorizar := true;

  if (dados.qryCompraSTATUS.Value = 'F') then
  begin
    if not dados.eSupervisor then
    begin
      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  try
    btnCancelar.Enabled := false;

    If Application.messagebox('Tem certeza que CANCELAR COMPRA?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      Try

        dados.qryExecute.Close;
        dados.qryExecute.SQL.Text := 'DELETE FROM CPAGAR WHERE FK_COMPRA=:ID';
        dados.qryExecute.Params[0].Value := dados.qryCompraID.Value;
        dados.qryExecute.ExecSQL;
        dados.Conexao.CommitRetaining;

        if not(dados.qryCompra.State = dsEdit) then
          dados.qryCompra.edit;
        dados.qryCompraNR_NOTA.Value := '';
        dados.qryCompraSTATUS.Value := 'C';
        dados.qryCompra.Post;
        dados.Conexao.CommitRetaining;

        CancelaItem(dados.qryCompraID.AsInteger);

        dmestoque.RemoveEstoqueCompra(dados.qryCompraID.Value,
          dados.qryCompraEHFISCAL.Value);

        dmestoque.RemoveEstoqueGRadeCompra(dados.qryCompraID.Value);

        ShowMessage('Compra Cancelada com Sucesso!');
      Finally
        qryItensCompra.EnableControls;
      End;

    end;
  finally
    btnCancelar.Enabled := true;
  end;

end;

procedure TfrmCompra.btnFiltrarClick(Sender: TObject);
begin
  localiza;
  edtLoc.SetFocus;
end;

procedure TfrmCompra.btnGerarClick(Sender: TObject);
begin
  try
    frmxml := tfrmxml.Create(Application);
    frmxml.JaLeuXml := false;
    frmxml.ShowModal;
  finally
    frmxml.Release;
    localiza;
  end;

end;

procedure TfrmCompra.btnImpClick(Sender: TObject);
begin
  if trim(dados.qryCompraXML.AsString) <> '' then
    dmNFe.ImprimirNFe(dados.qryCompraXML.Value, 'T', 'NFe', 0, 0, 0)
  else
  begin

    try
      btnImp.Enabled := false;
      dados.qryPesqProd.Close;
      dados.qryPesqProd.Open;

      qryItensCompra.Close;
      qryItensCompra.Params[0].Value := dados.qryCompraID.Value;
      qryItensCompra.Open;

      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
        '\Relatorio\RelCompra.fr3');
      frxReport.ShowReport;
    finally
      btnImp.Enabled := true;
      edtLoc.SetFocus;
    end;
  end;
end;

procedure TfrmCompra.btnPDFClick(Sender: TObject);
var
  dia, mes, ano: Word;
begin
  DecodeDate(now, ano, mes, dia);
  edtEmail.Text := dados.qryEmpresaEMAIL_CONTADOR.AsString;
  PagUtilidade.Visible := true;
  caminho := ExtractFilePath(Application.ExeName) + 'Xml_Compra\';
  pasta := mes.ToString + '_' + ano.ToString;
  edtArquivo.Text := caminho + pasta + '.zip';
end;

procedure TfrmCompra.EnviarEmail(titulo: string);
var
  Dir, ArqXML, para, Assunto: string;
  MS: TMemoryStream;
  P, n: Integer;
begin
  ProgressBar1.Position := 1;

  Dir := edtArquivo.Text;

  Assunto := 'XML REF.' + FormatDateTime('yyyymm',
    dados.qryCompraDTENTRADA.Value);

  ACBrMail1.Clear;
  ACBrMail1.IsHTML := false;
  ACBrMail1.Subject := Assunto;
  ACBrMail1.FromName := dados.qryEmpresaFANTASIA.AsString;

  ACBrMail1.Host := FEmail.servidor;
  ACBrMail1.Port := FEmail.porta;
  ACBrMail1.AddAddress(LowerCase(edtEmail.EditText), '');
  ACBrMail1.Username := LowerCase(FEmail.usuario);
  ACBrMail1.From := LowerCase(FEmail.usuario);
  ACBrMail1.Password := FEmail.Senha;

  ACBrMail1.IsHTML := false;

  ACBrMail1.SetSSL := false;
  ACBrMail1.SetTLS := false;

  if FEmail.SSL then
    ACBrMail1.SetSSL := true;
  if FEmail.SSL then
    ACBrMail1.SetTLS := true;

  ACBrMail1.ReadingConfirmation := true;
  ACBrMail1.UseThread := false;
  para := LowerCase(edtEmail.Text);
  ACBrMail1.AltBody.Text := titulo;
  ACBrMail1.AddAttachment(edtArquivo.Text);
  ACBrMail1.Send(false);
  ShowMessage('E-mail Enviado Com Sucesso!');

end;

procedure TfrmCompra.Button1Click(Sender: TObject);
begin
  try

    Button1.Enabled := false;

    if (trim(edtEmail.Text) = '') then
    begin
      ShowMessage('Informe E-mail do Contador!');
      exit;
    end;

    if not FilesExists(edtArquivo.Text) then
    begin
      ShowMessage('Arquivo não existe');
      exit;
    end;

    EnviarEmail('SEGUE EM ANEXO ARQUIVOS XML DE COMPRA');

  finally
    Button1.Enabled := true;
  end;
end;

procedure TfrmCompra.bbViewClick(Sender: TObject);
begin

  if dados.qryCompra.IsEmpty then
    exit;
  try
    frmCadCompra := TfrmCadCompra.Create(Application);

    frmCadCompra.btnFinalizar.Enabled := false;
    frmCadCompra.btnPessoas.Enabled := false;
    frmCadCompra.btnProdutos.Enabled := false;
    frmCadCompra.btnSair.Enabled := true;
    frmCadCompra.DBGridEh1.ReadOnly := true;
    frmCadCompra.Panel2.Enabled := false;
    frmCadCompra.Panel3.Enabled := false;

    frmCadCompra.qryCompra.Close;
    frmCadCompra.qryCompra.Params[0].Value := dados.qryCompraID.Value;
    frmCadCompra.qryCompra.Open;

    frmCadCompra.AtualizaST;

    frmCadCompra.ShowModal;
  finally
    frmCadCompra.Release;
    maskInicio.SetFocus;
  end;

end;

procedure TfrmCompra.GerarXml;
begin

  Caminho_Completo := caminho + '\' + pasta;

  if not DirectoryExists(Caminho_Completo) then
    CreateDir(Caminho_Completo);

  ACBrNFe.NotasFiscais.Clear;
  ACBrNFe.NotasFiscais.LoadFromString(qryXMLXML.AsString);
  ACBrNFe.NotasFiscais.GravarXML(Caminho_Completo + '\');

end;

function TfrmCompra.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TfrmCompra.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio + '\*.*xml', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = true then
          begin
            TempNome := Diretorio + '\' + F.Name;
            ListarArquivos(TempNome, true);
          end;
      end
      else
      begin
        memLista.Items.add(Diretorio + '\' + F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;
end;

procedure TfrmCompra.compactanfce(caminho, pasta: string);
var
  ZipFile: TZipFile;
  arquivo: string;
begin
  // Cria uma instância da classe TZipFile
  ZipFile := TZipFile.Create;
  try
    // Indica o diretório e nome do arquivo Zip que será criado
    ZipFile.Open(caminho + '\' + pasta + '.zip', zmWrite);
    for arquivo in memLista.Items do
      ZipFile.add(arquivo);

    MessageDlg('Compactação concluída!', mtInformation, [mbOK], 0);
  finally
    // Libera o objeto da memória
    ZipFile.Free;
  end;
end;

procedure TfrmCompra.BitBtn1Click(Sender: TObject);
var
  dia, mes, ano, dia1, mes1, ano1: Word;
begin

  DecodeDate(strtodate(maskInicio.Text), ano, mes, dia);
  DecodeDate(strtodate(maskFim.Text), ano1, mes1, dia1);

  if (mes + ano) <> (mes1 + ano1) then
  begin
    ShowMessage('Período Inválido');
    exit;
  end;

  try
    BitBtn1.Enabled := false;
    qryXML.Close;
    qryXML.Params[0].AsDate := strtodate(maskInicio.EditText);
    qryXML.Params[1].AsDate := strtodate(maskFim.EditText);
    qryXML.Params[2].Value := dados.qryEmpresaCODIGO.Value;
    qryXML.Open;

    if not qryXML.IsEmpty then
    begin
      qryXML.Last;
      ProgressBar1.Position := 1;
      ProgressBar1.Min := 1;
      ProgressBar1.Max := qryXML.RecordCount;
      qryXML.First;
      while not qryXML.Eof do
      begin
        GerarXml;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Application.ProcessMessages;
        qryXML.Next;
      end;
    end;
    // GerarRelatorio;

    Sleep(5000);

    memLista.Items.Clear;
    ListarArquivos(Caminho_Completo, false);
    compactanfce(caminho, pasta);
  finally
    BitBtn1.Enabled := true;
  end;

end;

procedure TfrmCompra.BitBtn2Click(Sender: TObject);
begin
  PagUtilidade.Visible := false;
end;

procedure TfrmCompra.tamanho;
begin
  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.08);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.32);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.28);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.07);
end;

procedure TfrmCompra.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmCompra.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TfrmCompra.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;

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
  DBGrid1.Columns[1].Title.Caption := 'Dt.Emissão';
  DBGrid1.Columns[2].Title.Caption := 'Dt.Entrada';
  DBGrid1.Columns[3].Title.Caption := 'NºNota';
  DBGrid1.Columns[4].Title.Caption := 'Fornecedor';
  DBGrid1.Columns[5].Title.Caption := 'Chave';
  DBGrid1.Columns[6].Title.Caption := 'Total';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  case idx of
    1:
      begin
        maskInicio.SetFocus;
      end;
    2:
      begin
        maskInicio.SetFocus;
      end
  else
    begin
      edtLoc.SetFocus;

    end;

  end;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;
end;

procedure TfrmCompra.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmCompra.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qryCompra.Prior;
  if Key = VK_DOWN then
    dados.qryCompra.Next;
end;

procedure TfrmCompra.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmCompra.FormCreate(Sender: TObject);
begin
  maskInicio.Text := DateToStr(StartOfTheMonth(DATE));
  maskFim.Text := DateToStr(DATE);
  bbNovo.Caption := 'F2' + sLineBreak + 'Novo';
  bbAlterar.Caption := 'F3' + sLineBreak + 'Alterar';
  btnCancelar.Caption := 'F4' + sLineBreak + 'Cancelar';
  btnAtualizar.Caption := 'F5' + sLineBreak + 'Atualizar';
  btnGerar.Caption := 'F6' + sLineBreak + 'Ler XML';
  btnImp.Caption := 'F7' + sLineBreak + 'Imprimir';
  bbView.Caption := 'F8' + sLineBreak + 'Visualizar';
  btnPDF.Caption := 'F9' + sLineBreak + 'Fechar Mês';


end;

procedure TfrmCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    vk_f2:
      bbNovoClick(self);
    vk_f3:
      bbAlterarClick(self);
    vk_f4:
      btnCancelarClick(self);
    vk_f5:
      btnAtualizarClick(self);
    vk_f6:
      btnGerarClick(self);
    vk_f7:
      btnImpClick(self);
    vk_f8:
      bbViewClick(self);
    vk_f9:
      btnGerarClick(self);
    vk_f12:
      begin
        maskInicio.SetFocus;
      end;
  end;
end;

procedure TfrmCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmCompra.FormShow(Sender: TObject);
begin

  vOrdem := ' ASC';

  tamanho;

  DBGrid1TitleClick(DBGrid1.Columns[0]);
  edtLoc.SetFocus;
end;

procedure TfrmCompra.localiza;
var
  filtro, filtro1, ordem, parte: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';
  if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  vSql := ' select co.*, pes.razao from compra co' +
    ' left join pessoa pes on pes.codigo=co.fornecedor' + ' where' + ' co.id>0'
    + ' /*where*/ ' + ' /*ordem*/ ';

  filtro := ' AND co.empresa=' + dados.qryEmpresaCODIGO.AsString;

  if idx = 2 then
  begin
    filtro := filtro + ' and co.Dtentrada>=' +
      QuotedStr(FormatDateTime('mm-dd-yyyy', strtodate(maskInicio.EditText))) +
      ' and co.Dtentrada<=' + QuotedStr(FormatDateTime('mm-dd-yyyy',
      strtodate(maskFim.EditText)));
  end
  else
  begin
    filtro := filtro + ' and co.Dtemissao>=' +
      QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(maskInicio.EditText))) +
      ' and co.Dtemissao<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
      strtodate(maskFim.EditText)));
  end;

  case idx of
    0:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and co.id LIKE ' + QuotedStr(edtLoc.Text + '%');
      end;
    3:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and co.nr_nota like ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and pes.razao like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    5:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and co.chave like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    6:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and co.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro1 := ' and status=''A''';
    2:
      filtro1 := ' and status=''F''';
    3:
      filtro1 := ' and status=''C''';
  end;

  case idx of
    0:
      ordem := ' order by co.id' + vOrdem;
    1:
      ordem := ' order by co.dtemissao' + vOrdem;
    2:
      ordem := ' order by co.dtentrada' + vOrdem;
    3:
      ordem := ' order by co.nr_nota' + vOrdem;
    4:
      ordem := ' order by pes.razao' + vOrdem;
    5:
      ordem := ' order by co.chave' + vOrdem;
    6:
      ordem := ' order by co.total' + vOrdem;

  end;

  dados.qryCompra.Close;

  dados.qryCompra.SQL.Text := vSql;
  dados.qryCompra.SQL.Text := StringReplace(dados.qryCompra.SQL.Text,
    '/*where*/', filtro + filtro1 + ordem, [rfReplaceAll]);
  dados.qryCompra.Open;

  qryContador.Close;
  qryContador.Open;

  if not qryContador.IsEmpty then
    edtEmail.KeyValue := qryContadorEMAIL.Value;
end;

procedure TfrmCompra.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;
end;

procedure TfrmCompra.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

procedure TfrmCompra.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

end.
