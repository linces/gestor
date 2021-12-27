unit uOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, dateutils, System.TypInfo, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.Tabs, Vcl.ExtDlgs, JPeg, frxClass, frxDBSet, frxExportPDF, frxOLE,
  ACBrBase, ACBrPosPrinter, ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS, frxExportBaseDialog, ACBrDFeReport, ACBrDFeDANFeReport,
  frxExportXLS, Vcl.Imaging.pngimage, frxExportImage;

type
  TfrmOrcamento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbAlterar: TSpeedButton;
    bbNovo: TSpeedButton;
    Panel1: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    bbView: TSpeedButton;
    dsOrcamento: TDataSource;
    btnImp: TSpeedButton;
    frxReport: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBOrcamento: TfrxDBDataset;
    frxDBItensO: TfrxDBDataset;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    btnAtualizar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEmail: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    pnImpressao: TPanel;
    Shape2: TShape;
    Label21: TLabel;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    btnWhats: TSpeedButton;
    TabSet1: TTabControl;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    LblPeriodo: TLabel;
    lblDescricao: TLabel;
    btnFiltrar: TBitBtn;
    maskFim: TMaskEdit;
    maskInicio: TMaskEdit;
    edtLoc: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bbAlterarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbNovoClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure maskInicioKeyPress(Sender: TObject; var Key: Char);
    procedure maskFimKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure btnWhatsClick(Sender: TObject);
    procedure TabSet1Change(Sender: TObject);
  private
    procedure localiza;
    procedure tamanho;
    function StrToPaginaCodigo(const AValor: String): TACBrPosPaginaCodigo;
    procedure imprimepedido;
    { Private declarations }
  public
    idx: Integer;
    vSql: String;
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadCompra, uCadOrcamento, uSupervisor, uEmail,
  udmImpressao;

procedure TfrmOrcamento.bbAlterarClick(Sender: TObject);
begin
  Dados.vAutorizar := true;

  if Dados.qryOrcamento.IsEmpty then
    exit;

  if (Dados.qryOrcamentoSITUACAO.Value = 'C') then
  begin
    ShowMessage('Orçamento Cancelado não pode ser Alterado!');
    exit;
  end;

  if (Dados.qryOrcamentoSITUACAO.Value = 'F') then
  begin

    If Application.messagebox('Tem certeza que deseja REABRIR ORÇAMENTO',
      'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
      exit;

    if not Dados.eSupervisor then
    begin
      try
        bbAlterar.Enabled := false;
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
        edtLoc.SetFocus;
      end;
    end;
  end;

  try
    bbAlterar.Enabled := false;
    if Dados.vAutorizar then
    begin
      try
        FrmCadOrcamento := TFrmCadOrcamento.Create(Application);
        with FrmCadOrcamento do
        begin
          vpessoa := Dados.qryOrcamentoCLIENTE.AsString;
          qryOrcamento.Close;
          qryOrcamento.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
          qryOrcamento.Open;

          if qryOrcamento.IsEmpty then
            exit;
          qryOrcamento.edit;
          qryOrcamentoSITUACAO.Value := 'A';

          btnSalvar.Enabled := true;
          btnFinalizar.Enabled := true;
          btnCancelar.Enabled := true;
          btnSair.Enabled := true;
          DBGridEh1.ReadOnly := false;

          btnPessoas.Enabled := true;
          btnProdutos.Enabled := true;

          Panel2.Enabled := true;
          Panel3.Enabled := true;
          PageControl1.Enabled := true;
        end;
        FrmCadOrcamento.ShowModal;
        Application.ProcessMessages;
      finally
        FrmCadOrcamento.Release;
      end;
    end;
  finally
    btnAtualizar.Click;
    bbAlterar.Enabled := true;
  end;
end;

procedure TfrmOrcamento.bbNovoClick(Sender: TObject);
begin
  try
    FrmCadOrcamento := TFrmCadOrcamento.Create(Application);
    with FrmCadOrcamento do
    begin
      vpessoa := '';
      qryOrcamento.Close;
      qryOrcamento.Params[0].Value := 0;
      qryOrcamento.Open;

      qryOrcamento.Insert;
      qryOrcamentoCODIGO.Value := Dados.Numerador('ORCAMENTO', 'CODIGO',
        'N', '', '');
      qryOrcamentoSITUACAO.Value := 'A';
      qryOrcamentoDATA.Value := DATE;
      qryOrcamentoTOTAL.Value := 0;
      qryOrcamentoFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
      qryOrcamentoFKVENDEDOR.Value := Dados.qryConfigVENDEDOR_PADRAO.Value;

      btnSalvar.Enabled := true;
      btnFinalizar.Enabled := true;
      btnCancelar.Enabled := true;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := false;
      btnPessoas.Enabled := true;
      btnProdutos.Enabled := true;

      Panel2.Enabled := true;
      Panel3.Enabled := true;
      PageControl1.Enabled := true;

    end;
    FrmCadOrcamento.ShowModal;
    Application.ProcessMessages;
  finally
    FrmCadOrcamento.Release;
    btnAtualizar.Click;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmOrcamento.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := Dados.qryOrcamentoCODIGO.Value;
    localiza;
    Dados.qryOrcamento.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
  end;
end;

procedure TfrmOrcamento.btnCancelarClick(Sender: TObject);
begin
  try
    btnCancelar.Enabled := false;

    if Dados.qryOrcamento.IsEmpty then
    begin
      exit;
    end;

    if (Dados.qryOrcamentoSITUACAO.Value = 'C') then
    begin
      ShowMessage('Orçamento já está CANCELADO!');
      exit;
    end;

    Dados.vAutorizar := true;

    if (Dados.qryOrcamentoSITUACAO.Value = 'F') then
    begin
      if not Dados.eSupervisor then
      begin
        try
          btnCancelar.Enabled := false;
          frmSupervisor := TFrmSupervisor.Create(Application);
          Dados.vAutorizar := false;
          frmSupervisor.ShowModal;
        finally
          frmSupervisor.Release;
        end;
      end;
    end;

    if not Dados.vAutorizar then
    begin
      exit;
    end;

    If Application.messagebox('Tem certeza que CANCELAR ORÇAMENTO?',
      'Confirmação', mb_yesno + mb_iconquestion) = idyes then
    begin
      if not(Dados.qryOrcamento.State in dsEditModes) then
        Dados.qryOrcamento.edit;
      Dados.qryOrcamentoSITUACAO.Value := 'C';
      Dados.qryOrcamento.Post;
      Dados.Conexao.CommitRetaining;
      ShowMessage('Orçamento Cancelado Com Sucesso!');
    end;

  finally
    btnCancelar.Enabled := true;
  end;
end;

procedure TfrmOrcamento.btnEmailClick(Sender: TObject);
begin
  if Dados.qryOrcamento.IsEmpty then
    exit;

  try

    btnEmail.Enabled := false;

    Dados.qryPesqProd.Close;
    Dados.qryPesqProd.Open;

    Dados.qryItensO.Close;
    Dados.qryItensO.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
    Dados.qryItensO.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelOrcamento.fr3');

    frxPDFExport1.FileName := 'ORCAMENTO.PDF';
    frxPDFExport1.DefaultPath := ExtractFilePath(Application.ExeName) + 'Temp';
    frxPDFExport1.ShowDialog := false;
    frxPDFExport1.ShowProgress := false;
    frxPDFExport1.OverwritePrompt := false;
    frxReport.PrepareReport();
    frxReport.Export(frxPDFExport1);

    Dados.qrySped_contador.Close;
    Dados.qrySped_contador.Open;
    Dados.qrySped_contador.Locate('fk_empresa',
      Dados.qryEmpresaCODIGO.Value, []);

    frmEmail := TfrmEmail.Create(Application);
    frmEmail.vNome := Dados.qryEmpresaFANTASIA.Value;

    frmEmail.vTipo := 'ORCAMENTO';
    frmEmail.vTituloAnexo := 'ORCAMENTO N.' + Dados.qryOrcamentoCODIGO.AsString;
    frmEmail.eNotaFiscal := false;
    frmEmail.AnexaArquivo := true;
    frmEmail.edtEmail.Text :=
      LowerCase(Dados.buscaemailPessoa(Dados.qryOrcamentoFK_CLIENTE.AsInteger));
    frmEmail.EdtAssunto.Text := 'ORCAMENTO N.' +
      Dados.qryOrcamentoCODIGO.AsString;
    frmEmail.edtMensagem.Text := 'SEGUE EM ANEXO ' + frmEmail.EdtAssunto.Text;
    frmEmail.LstAnexo.Items.Add(ExtractFilePath(Application.ExeName) +
      'Temp\ORCAMENTO.PDF');
    frmEmail.ShowModal;

  finally
    frmEmail.Release;
    btnEmail.Enabled := true;
    Dados.qryPV.Filtered := false;
  end;
end;

procedure TfrmOrcamento.btnFiltrarClick(Sender: TObject);
begin
  try
    btnFiltrar.Enabled := false;
    localiza;
    edtLoc.SetFocus;
  finally
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfrmOrcamento.btnImpClick(Sender: TObject);
begin
  pnImpressao.Visible := true;
end;

procedure TfrmOrcamento.btnWhatsClick(Sender: TObject);
var
  arquivo, path, caminho: string;
  FFone: String;
begin

  Dados.qryPesqProd.Close;
  Dados.qryPesqProd.Open;

  Dados.qryItensO.Close;
  Dados.qryItensO.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
  Dados.qryItensO.Open;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelOrcamento.fr3');

  arquivo := 'ORCAMENTO' + Dados.qryOrcamentoCODIGO.AsString + '.pdf';
  caminho := ExtractFilePath(Application.ExeName) + 'Temp';
  path := caminho + '\' + arquivo;
  frxPDFExport1.FileName := arquivo;
  frxPDFExport1.DefaultPath := caminho;
  frxPDFExport1.ShowDialog := false;
  frxPDFExport1.ShowProgress := false;
  frxPDFExport1.OverwritePrompt := false;
  frxReport.PrepareReport();
  frxReport.Export(frxPDFExport1);

  if FileExists(path) then
  begin

    FFone := InputBox('Digite o numero do whatsapp', 'Número:',
      Trim(TiraPontos(Dados.qryOrcamentoCELULAR.AsString)));
    if Length(FFone) <> 11 then
      raise Exception.Create('Numero de Celular Inválido!');

    Dados.InsereMensagemZap(path, FFone,
      'Conforme solicitado, segue Orçamento:', '',
      Dados.qryOrcamentoCLIENTE.AsString, Dados.qryEmpresaRAZAO.AsString,
      'ORCAMENTO');
  end;

  ShowMessage('Solicatação enviada com sucesso!');

end;

procedure TfrmOrcamento.Button1Click(Sender: TObject);
begin
  try
    btnImp.Enabled := false;
    Dados.qryPesqProd.Close;
    Dados.qryPesqProd.Open;

    Dados.qryItensO.Close;
    Dados.qryItensO.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
    Dados.qryItensO.Open;

    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelOrcamento.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    pnImpressao.Visible := false;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmOrcamento.Button2Click(Sender: TObject);
begin
  imprimepedido;
end;

function TfrmOrcamento.StrToPaginaCodigo(const AValor: String)
  : TACBrPosPaginaCodigo;
begin
  Result := TACBrPosPaginaCodigo
    (GetEnumValue(TypeInfo(TACBrPosPaginaCodigo), AValor));
end;

procedure TfrmOrcamento.TabSet1Change(Sender: TObject);
begin
  localiza;
end;

procedure TfrmOrcamento.imprimepedido;
var
  sTexto, vEndereco: String;
  SL: TStringList;
begin

  try
    SL := TStringList.Create;
    SL.Clear;
    Dados.qryItensO.Close;
    Dados.qryItensO.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
    Dados.qryItensO.Open;

    SL.Add('<N>' + copy(Dados.qryEmpresaFANTASIA.AsString, 1, 44) + '</n>');
    SL.Add(Dados.qryEmpresaENDERECO.AsString + ',' +
      Dados.qryEmpresaNUMERO.Value);
    SL.Add(Trim(Dados.qryEmpresaBAIRRO.AsString) + ' - ' +
      Trim(Dados.qryEmpresaCIDADE.AsString) + '-' +
      Trim(Dados.qryEmpresaUF.AsString));
    SL.Add('Fone: ' + Trim(Dados.qryEmpresaFONE.AsString));

    vEndereco := copy(Dados.qryOrcamentoENDERECO.AsString, 1, 30) + ',' +
      Dados.qryOrcamentoNUMERO.AsString;

    SL.Add('</linha_simples>');
    sTexto := '<N><ce>*** ORÇAMENTO No. ' + FormatFloat('0000',
      Dados.qryOrcamentoCODIGO.AsFloat) + ' ***</CE></n>';
    SL.Add(sTexto);
    SL.Add('</linha_simples>');
    sTexto := copy(Dados.qryOrcamentoCLIENTE.AsString, 1, 33);
    SL.Add('Cliente...: ' + sTexto);
    sTexto := copy(vEndereco, 1, 33);
    SL.Add('Endereco..: ' + sTexto);
    sTexto := copy(Dados.qryOrcamentoBAIRRO.AsString, 1, 33);
    SL.Add('Bairro....: ' + sTexto);
    sTexto := copy(Dados.qryOrcamentoTELEFONE.AsString, 1, 33);
    SL.Add('Telefone..: ' + sTexto);
    sTexto := copy(Dados.qryOrcamentoDATA.AsString, 1, 33);
    SL.Add('Data:' + sTexto + ' Hora:' + timetostr(time));
    SL.Add('Vendedor:' + Dados.qryOrcamentoVENDEDOR.Value);

    SL.Add('</linha_simples>');
    SL.Add('<C>COD PRODUTO                       QTD    VALOR     TOTAL</C>');
    SL.Add('</linha_simples>');

    Dados.qryItensO.First;
    While not Dados.qryItensO.Eof do
    begin
      sTexto := Dados.Alinha('', 1, false) +
        Dados.Alinha(Dados.qryItensO.FieldByName('FK_PRODUTO').AsString, 04,
        false) + Dados.Alinha('', 1, false) +
        Dados.Alinha(copy(Dados.qryItensOVIRTUAL_PRODUTO.AsString, 1, 22) + ' '
        + copy(Dados.qryItensOgrade.AsString, 1, 8), 22, false) +
        Dados.Alinha('', 1, false) + Dados.Alinha(Dados.qryItensOQTD.AsString,
        6, true) + Dados.Alinha('', 1, false) +
        Dados.Alinha(FormatFloat('0.00', Dados.qryItensOPRECO.AsFloat), 8, true)
        + Dados.Alinha('', 1, false) +
        Dados.Alinha(FormatFloat('0.00', Dados.qryItensOTOTAL.AsFloat), 9, true)
        + Dados.Alinha('', 1, false);

      SL.Add('<C>' + sTexto + '</C>');

      // Sub_Total := Sub_Total + Dados.qryItensO.FieldByName('VALOR_ITEM').AsFloat;
      Dados.qryItensO.Next;
    end;

    SL.Add('</linha_simples>');

    sTexto := Dados.Alinha('', 01, false) + Dados.Alinha('SUBTOTAL.: ', 12,
      false) + Dados.Alinha(FormatFloat('###,##0.00',
      Dados.qryOrcamentoSUBTOTAL.AsFloat), 10, true);
    SL.Add(sTexto);
    sTexto := Dados.Alinha('', 01, false) + Dados.Alinha('DESCONTO.: ', 12,
      false) + Dados.Alinha(FormatFloat('##0.00',
      Dados.qryOrcamento.FieldByName('DESCONTO').AsFloat), 10, true);
    SL.Add(sTexto);
    sTexto := Dados.Alinha('', 01, false) + Dados.Alinha('TOTAL....: ', 12,
      false) + Dados.Alinha(FormatFloat('###,##0.00',
      Dados.qryOrcamentoTOTAL.AsFloat), 10, true);
    SL.Add(sTexto);
    sTexto := Dados.Alinha('', 29, false);
    SL.Add(sTexto);
    sTexto := Dados.Alinha('', 29, false);
    SL.Add(sTexto);
    SL.Add('</linha_simples>');
    sTexto := '<ce><<Obrigado Pela Preferencia>></CE>';
    SL.Add(sTexto);
    SL.Add('</linha_simples>');
    SL.Add(Dados.qryOrcamentoOBS.Value);
    SL.Add('</linha_dupla>');
    SL.Add('Relatório emitido em ' + DateTimeToStr(now));
    SL.Add('</corte>');

    dmImpressao.ConfiguraImpressora('');
    dmImpressao.ImprimeLogo;
    dmImpressao.ImprimeTexto(SL.Text);

    SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'orcamento.txt');

  finally
    pnImpressao.Visible := true;
    SL.free;
  end;

end;

procedure TfrmOrcamento.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmOrcamento.bbViewClick(Sender: TObject);
begin
  if Dados.qryOrcamento.IsEmpty then
    exit;
  try
    bbView.Enabled := false;
    FrmCadOrcamento := TFrmCadOrcamento.Create(Application);
    with FrmCadOrcamento do
    begin
      btnSalvar.Enabled := false;
      btnFinalizar.Enabled := false;
      btnSair.Enabled := true;
      DBGridEh1.ReadOnly := true;
      btnPessoas.Enabled := false;
      btnProdutos.Enabled := false;
      Panel2.Enabled := false;
      Panel3.Enabled := false;
      PageControl1.Enabled := false;

      qryOrcamento.Close;
      qryOrcamento.Params[0].Value := Dados.qryOrcamentoCODIGO.Value;
      qryOrcamento.Open;

    end;
    FrmCadOrcamento.ShowModal;
    Application.ProcessMessages;
  finally
    bbView.Enabled := true;
    edtLoc.SetFocus;
  end;
end;

procedure TfrmOrcamento.tamanho;
begin

  DBGrid1.Columns[0].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.07);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.30);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.23);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.16);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.08);
end;

procedure TfrmOrcamento.DBGrid1DblClick(Sender: TObject);
begin
  bbAlterarClick(self);
end;

procedure TfrmOrcamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmOrcamento.DBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;
  idx := Column.Index;
  DBGrid1.Columns[0].Title.Caption := 'Número';
  DBGrid1.Columns[1].Title.Caption := 'Data';
  DBGrid1.Columns[2].Title.Caption := 'Cliente';
  DBGrid1.Columns[3].Title.Caption := 'Vendedor';
  DBGrid1.Columns[4].Title.Caption := 'Cidade';
  DBGrid1.Columns[5].Title.Caption := 'UF';
  DBGrid1.Columns[6].Title.Caption := 'Total';

  if (idx in [1]) then
  begin
    maskInicio.SetFocus;
    btnFiltrar.Visible := true;
  end
  else
  begin
    edtLoc.SetFocus
  end;

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  localiza;

end;

procedure TfrmOrcamento.edtLocChange(Sender: TObject);
begin
  localiza;
end;

procedure TfrmOrcamento.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qryOrcamento.Prior;
  if Key = VK_DOWN then
    Dados.qryOrcamento.Next;
end;

procedure TfrmOrcamento.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [0 .. 1]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [6]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TfrmOrcamento.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;




procedure TfrmOrcamento.FormCreate(Sender: TObject);
begin
  maskInicio.Text := DateToStr(StartOfTheWeek(DATE));
  maskFim.Text := DateToStr(DATE);

end;

procedure TfrmOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
  begin
    bbNovoClick(self);
    abort;
  end;
  if Key = vk_f3 then
  begin
    bbAlterarClick(self);
    abort;
  end;

  if Key = vk_f4 then
  begin
    btnCancelarClick(self);
    abort;
  end;

  if Key = vk_f5 then
  begin
    btnAtualizarClick(self);
    abort;
  end;

  if Key = vk_f6 then
  begin
    btnImpClick(self);
    abort;
  end;

  if Key = vk_f7 then
  begin
    bbViewClick(self);
    abort;
  end;

  if Key = vk_f12 then
  begin
    maskInicio.SetFocus;
    abort;
  end;

  if Key = vk_f9 then
  begin
    btnEmailClick(self);
    abort;
  end;

  if Key = vk_f10 then
  begin
    btnWhatsClick(self);
    abort;
  end;

end;

procedure TfrmOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
    Key := #0;
    Perform(CM_DialogKey, Vk_Tab, 0);
  end;
end;

procedure TfrmOrcamento.FormShow(Sender: TObject);
var
  topo: Integer;
begin

  DBGrid1TitleClick(DBGrid1.Columns[0]);

  tamanho;

  Dados.qryConfig.Close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  edtLoc.SetFocus;
  topo := (self.Height div 2) - (pnImpressao.Height div 2);
  pnImpressao.top := topo - (round(topo * 0.30));
  pnImpressao.left := (Width div 2) - (pnImpressao.Width div 2);
end;

procedure TfrmOrcamento.localiza;
var
  parte, filtro, filtro1, ordem: string;
begin
  filtro := '';
  filtro1 := '';
  ordem := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
    parte := '%';

  if vSql = '' then
    vSql := Dados.qryOrcamento.SQL.Text;

  filtro := filtro + ' AND orc.fkempresa=' + Dados.qryEmpresaCODIGO.AsString;

  filtro := filtro + ' and orc.data>=' +
    QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(maskInicio.EditText))) +
    ' and orc.data<=' + QuotedStr(FormatDateTime('mm/dd/yyyy',
    StrToDate(maskFim.EditText)));

  case idx of
    0:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and orc.codigo LIKE ' +
            QuotedStr(edtLoc.Text + '%');
      end;
    2:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and orc.cliente like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and ve.nome like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    4:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and orc.cidade like  ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    5:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and orc.uf like ' + QuotedStr(edtLoc.Text + '%');
      end;
    6:
      begin
        if (Trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and orc.total >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro1 := ' and orc.situacao=''A''';
    2:
      filtro1 := ' and orc.situacao=''F''';
    3:
      filtro1 := ' and orc.situacao=''C''';
  end;

  case idx of
    0:
      ordem := ' order by orc.codigo';
    1:
      ordem := ' order by orc.data';
    2:
      ordem := ' order by orc.cliente';
    3:
      ordem := ' order by ve.nome';
    4:
      ordem := ' order by orc.cidade';
    5:
      ordem := ' order by orc.uf';
    6:
      ordem := ' order by orc.total';

  end;

  Dados.qryOrcamento.Close;

  Dados.qryOrcamento.SQL.Text := vSql;
  Dados.qryOrcamento.SQL.Text := StringReplace(Dados.qryOrcamento.SQL.Text,
    '/*where*/', filtro + filtro1 + ordem, [rfReplaceAll]);

  Dados.qryOrcamento.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryOrcamento.Open;
end;

procedure TfrmOrcamento.maskFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFiltrar.SetFocus;
end;

procedure TfrmOrcamento.maskInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    maskFim.SetFocus;
end;

end.
