unit uCadTransp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrUtil, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, JPeg, Vcl.ExtDlgs,
  DBCtrlsEh, ACBrBase, ACBrEnterTab, DBGridEh, DBLookupEh, ACBrSocket, ACBrCEP,
  ACBrValidador, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvComponentBase,
  JvEnterTab;

type
  TfrmCadTransp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox1: TDBComboBox;
    dsTransp: TDataSource;
    Panel2: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label25: TLabel;
    DBEdit22: TDBEdit;
    DBComboBoxEh1: TDBComboBoxEh;
    Label26: TLabel;
    DBEdit7: TDBEdit;
    dsCidade: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    BitBtn2: TBitBtn;
    ACBrCEP1: TACBrCEP;
    ACBrValidador1: TACBrValidador;
    btnBuscaCNPJ: TBitBtn;
    dsMotoristas: TDataSource;
    GroupBox1: TGroupBox;
    JvDBGrid1: TJvDBGrid;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBLookupComboboxEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscaCNPJClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTransp: TfrmCadTransp;

implementation

{$R *.dfm}

uses uPessoa, Udados, uRotinasComuns;

procedure TfrmCadTransp.ACBrCEP1BuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    ShowMessage('Nenhum Endereço encontrado')
  else
  begin
    with ACBrCEP1.Enderecos[0] do
    begin
      dados.qryTranspENDERECO.Value :=
        UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      dados.qryTranspBAIRRO.Value := UpperCase(Bairro);
      dados.qryTranspCIDADE.Value := UpperCase(Municipio);
      dados.qryTranspCOD_CIDADE.AsString := IBGE_Municipio;
      dados.qryTranspUF.AsString := UpperCase(UF);
      dados.qryTranspCOD_CIDADE.Value :=
        dados.BuscaCodigoIbge(dados.qryTranspCIDADE.Value,
        dados.qryTranspUF.Value);
    end;
  end;
end;

procedure TfrmCadTransp.BitBtn2Click(Sender: TObject);
begin
  try
    try
      ACBrCEP1.BuscarPorCEP(DBEdit5.EditText);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    BitBtn2.Enabled := true;
  end;
end;

procedure TfrmCadTransp.btnBuscaCNPJClick(Sender: TObject);
begin

  if dados.qryTranspPESSOA.Value = 'JURÍDICA' then
  begin
    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := dados.qryTranspCNPJ.Value;
    if not ACBrValidador1.Validar then
      raise Exception.Create(ACBrValidador1.MsgErro);
  end;

  if dados.qryTranspPESSOA.Value = 'JURÍDICA' then
  begin
    try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(DBEdit8.text));
      dados.qryTranspNOME.Value := UpperCase(dmrotinas.Pessoa.razao);
      dados.qryTranspENDERECO.Value := UpperCase(dmrotinas.Pessoa.Logradouro);
      dados.qryTranspNUMERO.Value := UpperCase(dmrotinas.Pessoa.numero);
      dados.qryTranspBAIRRO.Value := UpperCase(dmrotinas.Pessoa.Bairro);
      dados.qryTranspCIDADE.Value := UpperCase(dmrotinas.Pessoa.Municipio);
      dados.qryTranspUF.Value := UpperCase(dmrotinas.Pessoa.UF);
      dados.qryTranspCEP.Value := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      dados.qryTranspCOD_CIDADE.Value :=
        dados.BuscaCodigoIbge(dados.qryTranspCIDADE.Value,
        dados.qryTranspUF.Value);
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

  end
  else
    ShowMessage('Não é possivel buscar informações de pessoas físicas!');

end;

procedure TfrmCadTransp.btnCancelarClick(Sender: TObject);
begin
  if dados.qryTransp.State in [dsInsert, dsEdit] then
    dados.qryTransp.Cancel;
  close;
end;

procedure TfrmCadTransp.btnGravarClick(Sender: TObject);
begin
  if dados.qryTransp.State in [dsInsert, dsEdit] then
  begin

    DBEdit8.SetFocus;

    if dados.qryTranspPESSOA.IsNull then
    begin
      ShowMessage('Digite o Tipo de Pessoa!');
      DBComboBox1.SetFocus;
      exit;
    end;

    if trim(dados.qryTranspCNPJ.Value) = '' then
    begin
      ShowMessage('Digite CNPJ!');
      DBEdit8.SetFocus;
      exit;
    end;

    if trim(dados.qryTranspNOME.Value) = '' then
    begin
      ShowMessage('Digite NOME!');
      DBEdit2.SetFocus;
      exit;
    end;

    if dados.qryTranspPESSOA.Value = 'FÍSICA' then
    begin
      if dados.qryTranspCNPJ.Value <> '000.000.000-00' then
      begin
        ACBrValidador1.TipoDocto := docCPF;
        ACBrValidador1.Documento := dados.qryTranspCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;

    end;

    if dados.qryTranspPESSOA.Value = 'JURÍDICA' then
    begin
      if dados.qryTranspCNPJ.Value <> '00.000.000/0000-00' then
      begin
        ACBrValidador1.TipoDocto := docCNPJ;
        ACBrValidador1.Documento := dados.qryTranspCNPJ.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if dados.qryTranspPESSOA.Value = 'JURÍDICA' then
    begin
      if dados.qryTranspIE.AsString <> '' then
      begin
        ACBrValidador1.TipoDocto := docInscEst;
        ACBrValidador1.Documento := dados.qryTranspIE.Value;
        ACBrValidador1.Complemento := dados.qryTranspUF.Value;
        if not ACBrValidador1.Validar then
          raise Exception.Create(ACBrValidador1.MsgErro);
      end;
    end;

    if trim(dados.qryTranspENDERECO.Value) = '' then
    begin
      ShowMessage('Digite ENDEREÇO!');
      DBEdit3.SetFocus;
      exit;
    end;

    if trim(dados.qryTranspBAIRRO.Value) = '' then
    begin
      ShowMessage('Digite BAIRRO!');
      DBEdit4.SetFocus;
      exit;
    end;

    if trim(dados.qryTranspCIDADE.Value) = '' then
    begin
      ShowMessage('Digite MUNICIPIO!');
      DBEdit6.SetFocus;
      exit;
    end;

    if trim(dados.qryTranspUF.Value) = '' then
    begin
      ShowMessage('Digite UF!');
      DBComboBoxEh1.SetFocus;
      exit;
    end;
    dados.qryTranspCIDADE.Value := dados.qryCidadeDESCRICAO.Value;
    dados.qryTransp.Post;
    dados.Conexao.CommitRetaining;
  end;
  frmCadTransp.close;
end;

procedure TfrmCadTransp.DBComboBox1Exit(Sender: TObject);
begin
  dados.qryTranspCNPJ.EditMask := '###.###.###-##;1;';
  if dados.qryTranspPESSOA.Value = 'JURÍDICA' then
    dados.qryTranspCNPJ.EditMask := '##.###.###/####-##;1;';
end;

procedure TfrmCadTransp.DBEdit22Exit(Sender: TObject);
begin
  if (dados.qryTransp.State in dsEditModes) then
    if trim(DBEdit22.EditText) = '' then
    begin
      dados.qryTranspAPELIDO.Value := dados.qryTranspNOME.Value;
    end;
end;

procedure TfrmCadTransp.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    BitBtn2Click(self);
end;

procedure TfrmCadTransp.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f2 then
    btnBuscaCNPJClick(self);
end;

procedure TfrmCadTransp.DBLookupComboboxEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadTransp.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadTransp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    btnGravarClick(self);
  if Key = VK_ESCAPE then
    if Application.messageBox
      ('Tem Certeza de que deseja sair do cadastro de transportadoras?',
      'Confirmação', mb_YesNo) = mrYes then
    begin
      btnCancelarClick(self);
    end;
end;

procedure TfrmCadTransp.FormShow(Sender: TObject);
begin
  dados.qryCidade.close;
  dados.qryCidade.Open;

  dados.qryMotorista.close;
  dados.qryMotorista.Params[0].Value := dados.qryTranspCODIGO.Value;
  dados.qryMotorista.Open;

end;

end.
