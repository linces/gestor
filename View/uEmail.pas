unit uEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, ACBrDFe, ACBrNFe, ACBrBase, pcnConversaoNFe,
  ACBrMail,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrDANFCeFortesFrA4, Vcl.ComCtrls,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrCTeDACTEClass, ACBrCTeDACTeRLClass,
  ACBrCTe;

type
  TFrmEmail = class(TForm)
    Panel5: TPanel;
    btnEmail: TSpeedButton;
    btnFechar: TSpeedButton;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFeDANFCeFortesA41: TACBrNFeDANFCeFortesA4;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    ACBrMail1: TACBrMail;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtAssunto: TEdit;
    edtEmail: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    LstAnexo: TListBox;
    OpenDialog: TOpenDialog;
    edtMensagem: TEdit;
    Label5: TLabel;
    btnAdicionar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    ACBrCTe1: TACBrCTe;
    ACBrCTeDACTeRL1: TACBrCTeDACTeRL;
    procedure btnEmailClick(Sender: TObject);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ACBrMail1MailProcess(const AMail: TACBrMail;
      const aStatus: TMailStatus);
    procedure btnAdicionarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    vNumero: Integer;
    vTituloAnexo, vCaminho, vTipo, vEmail, vXml, vNome: string;
    AnexaArquivo, eNotaFiscal, eCTe: Boolean;
    { Public declarations }
  end;

var
  FrmEmail: TFrmEmail;

implementation

{$R *.dfm}

uses Udados, ufrmStatus;

procedure TFrmEmail.ACBrMail1MailProcess(const AMail: TACBrMail;
  const aStatus: TMailStatus);
begin
  ProgressBar1.Position := Integer(aStatus);

  case aStatus of
    pmsStartProcess:
      caption := 'Enviar Email: Iniciando processo de envio.';
    pmsConfigHeaders:
      caption := 'Enviar Email: Configurando o cabeÁalho do e-mail.';
    pmsLoginSMTP:
      caption := 'Enviar Email: Logando no servidor de e-mail.';
    pmsStartSends:
      caption := 'Enviar Email: Iniciando os envios.';
    pmsSendTo:
      caption := 'Enviar Email: Processando lista de destinat·rios.';
    pmsSendCC:
      caption := 'Enviar Email: Processando lista CC.';
    pmsSendBCC:
      caption := 'Enviar Email: Processando lista BCC.';
    pmsSendReplyTo:
      caption := 'Enviar Email: Processando lista ReplyTo.';
    pmsSendData:
      caption := 'Enviar Email: Enviando dados.';
    pmsLogoutSMTP:
      caption := 'Enviar Email: Fazendo Logout no servidor de e-mail.';
    pmsDone:
      begin
        caption := 'Enviar Email';
        ProgressBar1.Position := ProgressBar1.Max;
      end;
  end;

  lblStatus.caption := '   ' + AMail.Subject;

  Application.ProcessMessages;
end;

procedure TFrmEmail.ACBrNFe1StatusChange(Sender: TObject);
begin
  case ACBrNFe1.Status of
    stIdle:
      begin
        if (frmStatus <> nil) then
          frmStatus.Hide;
      end;
    stNFeEmail:
      begin
        if (frmStatus = nil) then
          frmStatus := TfrmStatus.Create(Application);
        frmStatus.lblStatus.caption := 'Enviando Email ...';
        frmStatus.Show;
        frmStatus.BringToFront;
      end;
  end;
  Application.ProcessMessages;
end;

procedure TFrmEmail.btnEmailClick(Sender: TObject);
var
  mensagem: Tstrings;
  para: string;
  i: Integer;
begin

  if (trim(edtEmail.Text) = '') then
  begin
    ShowMessage('Informe o Email!');
    edtEmail.SetFocus;
    exit;
  end;

  if (trim(EdtAssunto.Text) = '') then
  begin
    ShowMessage('Informe o Assunto!');
    EdtAssunto.SetFocus;
    exit;
  end;

  if (trim(edtMensagem.Text) = '') then
  begin
    ShowMessage('Informe a Mensagem!');
    edtMensagem.SetFocus;
    exit;
  end;

  try

    btnEmail.Enabled := false;
    mensagem := TstringList.Create;
    mensagem.Add(edtMensagem.Text);
    ACBrMail1.Clear;

    Femail.GetEmail;

    ACBrMail1.FromName := vNome;
    ACBrMail1.Host := Femail.servidor;
    // troque pelo seu servidor smtp
    ACBrMail1.Username := LowerCase(Femail.usuario);
    ACBrMail1.From := LowerCase(Femail.usuario);
    ACBrMail1.Password := Femail.Senha;
    ACBrMail1.Port := Femail.porta;

    ACBrMail1.DefaultCharset := TMailCharset(27);
    ACBrMail1.IDECharset := TMailCharset(15);

    // troque pela porta do seu servidor smtp

    ACBrMail1.IsHTML := true;

    ACBrMail1.SetSSL := false;
    ACBrMail1.SetTLS := false;

    if Femail.SSL then
      ACBrMail1.SetSSL := true;

    if Femail.TLS then
      ACBrMail1.SetTLS := true;

    para := LowerCase(edtEmail.Text);
    ACBrMail1.AddAddress(para, '...');

    if AnexaArquivo then
    begin
      ACBrMail1.Subject := EdtAssunto.Text;
      ACBrMail1.AltBody.Add('Enviado P/ ' + Dados.qryEmpresaRAZAO.AsString);
      ACBrMail1.AltBody.Add(edtMensagem.Text);
      ACBrMail1.ClearAttachments;
      for i := 0 to LstAnexo.Items.Count - 1 do
      begin
        ACBrMail1.AddAttachment(LstAnexo.Items.Strings[i], vTituloAnexo);
      end;
      ACBrMail1.Send(false);
    end;

    if eNotaFiscal then
    begin
      ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(para, EdtAssunto.Text,
        mensagem, true // Enviar PDF junto
        , nil // Lista com emails que ser√£o enviado c√≥pias - TStrings
        , nil); // Lista de anexos - TStrings}
    end;

    if eCTe then
    begin

      ACBrCTe1.Conhecimentos.Items[0].EnviarEmail(para, EdtAssunto.Text,
        mensagem, true // Enviar PDF junto
        , nil // Lista com emails que ser√£o enviado c√≥pias - TStrings
        , nil); // Lista de anexos - TStrings}
    end;

    ShowMessage('E-mail Enviado com Sucesso!');

    close;

  finally
    mensagem.Free;
    btnEmail.Enabled := true;
  end;
end;

procedure TFrmEmail.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEmail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnEmail.Click;

  if Key = vk_escape then
    btnFechar.Click;
end;

procedure TFrmEmail.FormShow(Sender: TObject);
begin

  Dados.qryConfig.close;
  Dados.qryConfig.Params[0].Value := Dados.qryEmpresaCODIGO.Value;
  Dados.qryConfig.Open;

  if vTipo = 'NFE' then
  begin
    ACBrNFe1.DANFE := ACBrNFeDANFeRL1;

  end
  else
  begin
    ACBrNFe1.DANFE := ACBrNFeDANFCeFortesA41;
  end;
end;

procedure TFrmEmail.btnAdicionarClick(Sender: TObject);
begin
  try
    OpenDialog.InitialDir := (ExtractFilePath(Application.ExeName));
    OpenDialog.Execute;

    if OpenDialog.FileName <> '' then
      LstAnexo.Items.Add(OpenDialog.FileName);
  except
    ShowMessage('N„o foi possÌvel selecionar arquivo!');
  end;
end;

procedure TFrmEmail.BtnExcluirClick(Sender: TObject);
begin
  if Application.messageBox('Deseja Excluir Anexo?', 'ConfirmaÁ„o', mb_YesNo) = mrYes
  then
    LstAnexo.DeleteSelected;
end;

end.
