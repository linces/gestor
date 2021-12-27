unit uCadPessoaRapido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, JPeg, Vcl.ExtDlgs,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, DBGridEh, DBLookupEh, ACBrSocket, ACBrCEP,
  ACBrValidador, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadPessoaRapido = class(TForm)
    dsPessoas: TDataSource;
    OpenPicture: TOpenPictureDialog;
    ACBrEnterTab1: TACBrEnterTab;
    dsCidade: TDataSource;
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    Panel2: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    qryPessoas: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit22: TDBEdit;
    DBComboBoxEh1: TDBComboBoxEh;
    DBEdit7: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    btnCEP: TBitBtn;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    qryPessoasEMPRESA: TSmallintField;
    qryPessoasCODIGO: TIntegerField;
    qryPessoasTIPO: TStringField;
    qryPessoasCNPJ: TStringField;
    qryPessoasIE: TStringField;
    qryPessoasFANTASIA: TStringField;
    qryPessoasENDERECO: TStringField;
    qryPessoasNUMERO: TStringField;
    qryPessoasCOMPLEMENTO: TStringField;
    qryPessoasCODMUN: TIntegerField;
    qryPessoasMUNICIPIO: TStringField;
    qryPessoasBAIRRO: TStringField;
    qryPessoasUF: TStringField;
    qryPessoasCEP: TStringField;
    qryPessoasFONE1: TStringField;
    qryPessoasFONE2: TStringField;
    qryPessoasCELULAR1: TStringField;
    qryPessoasCELULAR2: TStringField;
    qryPessoasEMAIL1: TStringField;
    qryPessoasEMAIL2: TStringField;
    qryPessoasFOTO: TBlobField;
    qryPessoasSEXO: TStringField;
    qryPessoasDT_NASC: TDateField;
    qryPessoasECIVIL: TStringField;
    qryPessoasLIMITE: TFMTBCDField;
    qryPessoasDIA_PGTO: TSmallintField;
    qryPessoasOBS: TMemoField;
    qryPessoasNUM_USU: TSmallintField;
    qryPessoasFATURA: TStringField;
    qryPessoasCHEQUE: TStringField;
    qryPessoasCCF: TStringField;
    qryPessoasSPC: TStringField;
    qryPessoasISENTO: TStringField;
    qryPessoasFORN: TStringField;
    qryPessoasFUN: TStringField;
    qryPessoasCLI: TStringField;
    qryPessoasFAB: TStringField;
    qryPessoasTRAN: TStringField;
    qryPessoasADM: TStringField;
    qryPessoasATIVO: TStringField;
    qryPessoasDT_ADMISSAO: TDateField;
    qryPessoasDT_DEMISSAO: TDateField;
    qryPessoasSALARIO: TFMTBCDField;
    qryPessoasPAI: TStringField;
    qryPessoasMAE: TStringField;
    qryPessoasBANCO: TStringField;
    qryPessoasAGENCIA: TStringField;
    qryPessoasGERENTE: TStringField;
    qryPessoasFONE_GERENTE: TStringField;
    qryPessoasPROPRIEDADE: TStringField;
    qryPessoasDT_CADASTRO: TDateField;
    qryPessoasTECNICO: TStringField;
    qryPessoasATENDENTE: TStringField;
    qryPessoasCODIGO_WEB: TIntegerField;
    qryPessoasREFERENCIA: TIntegerField;
    qryPessoasFLAG: TStringField;
    qryPessoasRAZAO: TStringField;
    qryPessoasTIPO_RECEBIMENTO: TStringField;
    qryPessoasPARC: TStringField;
    qryPessoasREGIME_TRIBUTARIO: TStringField;
    qryPessoasWHATSAPP: TStringField;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCEPClick(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure DBLookupComboboxEh1Exit(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh1Enter(Sender: TObject);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBoxEh2Exit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure qryContatosBeforeInsert(DataSet: TDataSet);
    procedure qryContatosAfterPost(DataSet: TDataSet);
    procedure qryPessoasBeforePost(DataSet: TDataSet);
    procedure qryPessoasAfterPost(DataSet: TDataSet);
    procedure qryPessoasNewRecord(DataSet: TDataSet);
  private
    function PessoaExiste(fone: string): Integer;
    { Private declarations }
  public
    procedure Insere;
    procedure altera;
    { Public declarations }
  end;

var
  frmCadPessoaRapido: TfrmCadPessoaRapido;

implementation

{$R *.dfm}

uses uPessoa, Udados, uRotinasComuns;

function TfrmCadPessoaRapido.PessoaExiste(fone: string): Integer;
begin
  result := 0;
  dados.qryConsulta.Close;
  dados.qryConsulta.SQL.Text :=
    'select codigo from pessoa where celular1=:celular';
  dados.qryConsulta.Params[0].Value := fone;
  dados.qryConsulta.Open;
  if dados.qryConsulta.IsEmpty then
    result := dados.qryConsulta.FieldByName('codigo').AsInteger;

end;

procedure TfrmCadPessoaRapido.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      qryPessoasENDERECO.Value := UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      qryPessoasBAIRRO.Value := UpperCase(Bairro);
      qryPessoasCOMPLEMENTO.Value := UpperCase(Complemento);
      qryPessoasMUNICIPIO.Value := UpperCase(Municipio);
      qryPessoasCODMUN.Value := StrToIntDef(IBGE_Municipio, 0);
      qryPessoasUF.AsString := UpperCase(uf);
      qryPessoasCODMUN.Value := dados.BuscaCodigoIbge(qryPessoasMUNICIPIO.Value,
        qryPessoasUF.Value);
    end;
  end;
end;

procedure TfrmCadPessoaRapido.btnCEPClick(Sender: TObject);
begin
  try
    ACBrCEP1.BuscarPorCEP(DBEdit5.EditText);
    DBEdit3.SetFocus;
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmCadPessoaRapido.btnCancelarClick(Sender: TObject);
begin
  if qryPessoas.State in [dsInsert, dsEdit] then
    qryPessoas.Cancel;
  Close;
end;

procedure TfrmCadPessoaRapido.btnGravarClick(Sender: TObject);
begin
  if qryPessoas.State in [dsInsert, dsEdit] then
  begin

    DBEdit2.SetFocus;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Text :=
      'select codigo, razao from pessoa where razao=:razao and codigo<>:cod';
    dados.qryConsulta.Params[0].Value := DBEdit2.Text;
    dados.qryConsulta.Params[1].Value := DBEdit1.Text;
    dados.qryConsulta.Open;
    if not dados.qryConsulta.IsEmpty then
    begin
      if Application.messageBox('Já existe pessoa cadastrada com este NOME!' +
        sLineBreak + 'Deseja Continuar?', 'Confirmação', mb_YesNo) = mrNo then
        exit;
    end;

    if trim(qryPessoasRAZAO.Value) = '' then
    begin
      ShowMessage('Digite o NOME!');
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(qryPessoasENDERECO.Value) = '' then
    begin
      ShowMessage('Digite o ENDEREÇO!');
      DBEdit3.SetFocus;
      exit;
    end;

    if trim(qryPessoasNUMERO.Value) = '' then
    begin
      ShowMessage('Digite o NÚMERO!');
      DBEdit2.SetFocus;
      exit;
    end;

    if trim(qryPessoasBAIRRO.Value) = '' then
    begin
      ShowMessage('Digite o BAIRRO!');
      DBEdit4.SetFocus;
      exit;
    end;

    if trim(qryPessoasMUNICIPIO.Value) = '' then
    begin
      ShowMessage('Digite o MUNICIPIO!');
      DBEdit6.SetFocus;
      exit;
    end;

    if trim(qryPessoasCEP.Value) = '' then
    begin
      ShowMessage('Digite o CEP!');
      DBEdit5.SetFocus;
      exit;
    end;

    if trim(qryPessoasUF.Value) = '' then
    begin
      ShowMessage('Digite o UF!');
      DBComboBoxEh1.SetFocus;
      exit;
    end;

    qryPessoas.Post;
    dados.Conexao.CommitRetaining;
  end;
  frmCadPessoaRapido.Close;
end;

procedure TfrmCadPessoaRapido.cbEmpresaEnter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadPessoaRapido.cbEmpresaExit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := True;
end;

procedure TfrmCadPessoaRapido.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPessoaRapido.DBComboBoxEh2Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := True;
end;

procedure TfrmCadPessoaRapido.DBEdit22Exit(Sender: TObject);
begin
  if (qryPessoas.State in dsEditModes) then
    if trim(DBEdit22.EditText) = '' then
    begin
      qryPessoasFANTASIA.Value := qryPessoasRAZAO.Value;
    end;
end;

procedure TfrmCadPessoaRapido.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnCEP.Click;
end;

procedure TfrmCadPessoaRapido.DBLookupComboboxEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCadPessoaRapido.DBLookupComboboxEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := True;
  qryPessoasMUNICIPIO.Value := dados.qryCidadeDESCRICAO.Value;
end;

procedure TfrmCadPessoaRapido.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPessoaRapido.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := Self;
  dados.GetComponentes;
end;

procedure TfrmCadPessoaRapido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(Self);
  if Key = VK_ESCAPE then
  begin
    if Application.messageBox('Tem Certeza de que deseja sair da tela?',
      'Confirmação', mb_YesNo) = mrYes then
    begin
      btnCancelarClick(Self);
    end;
  end;
end;

procedure TfrmCadPessoaRapido.FormShow(Sender: TObject);
begin

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

  dados.qryCidade.Close;
  dados.qryCidade.Open;

end;

procedure TfrmCadPessoaRapido.Insere;
begin
  qryPessoas.Insert;
  qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO', 'N', '', '');
  qryPessoasATIVO.Value := 'S';
  qryPessoasCLI.Value := 'S';
  qryPessoasEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryPessoasFORN.Value := 'N';
  qryPessoasFAB.Value := 'N';
  qryPessoasIE.Value := '';
  qryPessoasFUN.Value := 'N';
  qryPessoasADM.Value := 'N';
  qryPessoasLIMITE.Value := 0;
  qryPessoasISENTO.Value := '2';
  qryPessoasSALARIO.Value := 0;
  qryPessoasCCF.Value := 'N';
  qryPessoasSPC.Value := 'N';
  qryPessoasTRAN.Value := 'N';
  qryPessoasFATURA.Value := 'N';
  qryPessoasCHEQUE.Value := 'N';
  qryPessoasTECNICO.Value := 'N';
  qryPessoasATENDENTE.Value := 'N';
  qryPessoasUF.Value := dados.qryEmpresaUF.Value;
  qryPessoasCODMUN.Value := dados.qryEmpresaID_CIDADE.Value;
  qryPessoasMUNICIPIO.Value := dados.qryEmpresaCIDADE.Value;
  qryPessoasDT_CADASTRO.Value := date;
end;

procedure TfrmCadPessoaRapido.altera;
begin
  qryPessoas.Edit;
end;

procedure TfrmCadPessoaRapido.qryContatosAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadPessoaRapido.qryContatosBeforeInsert(DataSet: TDataSet);
begin
  try
    if (qryPessoas.State in dsEditModes) then
      qryPessoas.Post;
    dados.Conexao.CommitRetaining;
  except
    On E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TfrmCadPessoaRapido.qryPessoasAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadPessoaRapido.qryPessoasBeforePost(DataSet: TDataSet);
begin
  if qryPessoas.State in [dsInsert] then
    qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO', 'N', '', '');
end;

procedure TfrmCadPessoaRapido.qryPessoasNewRecord(DataSet: TDataSet);
begin
  qryPessoasTIPO.Value := 'FÍSICA';
  qryPessoasCNPJ.Value := '000.000.000-00';
  qryPessoasIE.Value := ' ';
  qryPessoasEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
  qryPessoasCODIGO.Value := dados.Numerador('PESSOA', 'CODIGO', 'N', '', '');
  qryPessoasATIVO.Value := 'S';
  qryPessoasCLI.Value := 'S';
  qryPessoasFORN.Value := 'N';
  qryPessoasFAB.Value := 'N';
  qryPessoasIE.Value := '';
  qryPessoasFUN.Value := 'N';
  qryPessoasADM.Value := 'N';
  qryPessoasLIMITE.Value := 0;
  qryPessoasISENTO.Value := '2';
  qryPessoasSALARIO.Value := 0;
  qryPessoasCCF.Value := 'N';
  qryPessoasSPC.Value := 'N';
  qryPessoasTRAN.Value := 'N';
  qryPessoasFATURA.Value := 'N';
  qryPessoasCHEQUE.Value := 'N';
  qryPessoasUF.Value := dados.qryEmpresaUF.Value;
  qryPessoasDT_CADASTRO.Value := date;
  qryPessoasCODMUN.Value := dados.qryEmpresaID_CIDADE.Value;
  qryPessoasMUNICIPIO.Value := dados.qryEmpresaCIDADE.Value;
end;

end.
