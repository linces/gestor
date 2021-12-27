unit ufrmCBRconfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultCadastro, Data.DB, ACBrBase,
  ACBrEnterTab, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvComCtrls,
  JvExControls, JvSpeedButton, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvDBControls, JvExStdCtrls,
  JvCombobox, JvDBCombobox, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvDBCheckBox,
  ACBrDFe, ACBrNFe, JvBaseEdits;

type
  TDocModelo = (mMDFe, mCTeOS, mCTe, mNFe);

  TfrmCBRconfig = class(TfrmDefaultCadastro)
    ACBrNFe1: TACBrNFe;
    OpenDialog: TOpenDialog;
    qryDefault: TFDQuery;
    qryDefaultID_EMPRESA: TIntegerField;
    qryDefaultDIRRECEBE: TStringField;
    qryDefaultDIRENVIA: TStringField;
    qryDefaultDIRRECEBEBKP: TStringField;
    qryDefaultVLRTARIFABOLETA: TFMTBCDField;
    qryDefaultTIPOCOBRANCA: TStringField;
    qryDefaultCODBANCO: TSmallintField;
    qryDefaultAGENCIA: TSmallintField;
    qryDefaultAGENCIADIG: TStringField;
    qryDefaultCONTA: TStringField;
    qryDefaultCONTADIG: TStringField;
    qryDefaultCODCEDENTE: TStringField;
    qryDefaultCODCEDENTEDIG: TStringField;
    qryDefaultCONVENIO: TStringField;
    qryDefaultCARTEIRA: TStringField;
    qryDefaultMODALIDADE: TStringField;
    qryDefaultESPECIEDOC: TStringField;
    qryDefaultCOBMOEDA: TStringField;
    qryDefaultCOBACEITE: TStringField;
    qryDefaultLOCALPAGTO: TStringField;
    qryDefaultINSTRUCAO1: TStringField;
    qryDefaultINSTRUCAO2: TStringField;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label2: TLabel;
    sbtnGetCert: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    DIRRECEBE: TJvDBMaskEdit;
    DIRENVIA: TJvDBMaskEdit;
    DIRRECEBEBKP: TJvDBMaskEdit;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Convênio: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lbCarteira: TLabel;
    lbModalidade: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    TIPOCOBRANCA: TJvDBComboBox;
    CODBANCO: TJvDBMaskEdit;
    AGENCIA: TJvDBMaskEdit;
    CONTA: TJvDBMaskEdit;
    AGENCIADIG: TJvDBMaskEdit;
    CONTADIG: TJvDBMaskEdit;
    CODCEDENTE: TJvDBMaskEdit;
    CONVENIO: TJvDBMaskEdit;
    ESPECIEDOC: TJvDBMaskEdit;
    COBMOEDA: TJvDBMaskEdit;
    COBACEITE: TJvDBMaskEdit;
    CARTEIRA: TJvDBMaskEdit;
    MODALIDADE: TJvDBMaskEdit;
    LOCALPAGTO: TJvDBMaskEdit;
    INSTRUCAO1: TJvDBMaskEdit;
    JvDBComboBox1: TJvDBComboBox;
    Label9: TLabel;
    qryDefaultCNAB: TStringField;
    qryDefaultNUMERO_BOLETO: TIntegerField;
    Label10: TLabel;
    JvDBMaskEdit1: TJvDBMaskEdit;
    qryDefaultAGENCIAD: TStringField;
    procedure sbtnGetCertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryDefaultBeforeOpen(DataSet: TDataSet);
    procedure qryDefaultNewRecord(DataSet: TDataSet);
  private
  public
    class procedure showConfig;
  end;

var
  frmCBRconfig: TfrmCBRconfig;

implementation

uses
  ufrmDefault, ACBrDFeSSL, Vcl.FileCtrl, ACBrBoleto,
  System.TypInfo, uDados;

{$R *.dfm}

procedure TfrmCBRconfig.FormCreate(Sender: TObject);
var
  I: TACBrTipoCobranca;
begin
  inherited;

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Boleto') then
    CreateDir(ExtractFilePath(Application.ExeName) + 'Boleto');

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Boleto\Remessa')
  then
    CreateDir(ExtractFilePath(Application.ExeName) + 'Boleto\Remessa');

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Boleto\Retorno')
  then
    CreateDir(ExtractFilePath(Application.ExeName) + 'Boleto\Retorno');

  if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Boleto\Backup')
  then
    CreateDir(ExtractFilePath(Application.ExeName) + 'Boleto\bACKUP');

  pageDefault.ActivePageIndex := 0;
  // popular combo dos tipos de ocorrencias
  TIPOCOBRANCA.Items.Clear;
  TIPOCOBRANCA.Values.Clear;
  For I := Low(TACBrTipoCobranca) to High(TACBrTipoCobranca) do
  begin
    TIPOCOBRANCA.Items.Add(GetEnumName(TypeInfo(TACBrTipoCobranca),
      integer(I)));
    TIPOCOBRANCA.Values.Add(GetEnumName(TypeInfo(TACBrTipoCobranca),
      integer(I)));
  end;
end;

procedure TfrmCBRconfig.FormShow(Sender: TObject);
begin
  // inherited;

  TFDQuery(dtsDefault.DataSet).Close;
  TFDQuery(dtsDefault.DataSet).Prepare;
  TFDQuery(dtsDefault.DataSet).Open;

  if TFDQuery(dtsDefault.DataSet).IsEmpty then
  begin
    TipoOperacao := TIncluir;
    FOperacao := TIncluir;
    TFDQuery(dtsDefault.DataSet).Append;
    TFDQuery(dtsDefault.DataSet).Fields[0].AsInteger :=
      dados.qryEmpresaCodigo.value;
  end
  else
  begin
    TipoOperacao := TEditar;
    FOperacao := TIncluir;
  end;
end;

procedure TfrmCBRconfig.qryDefaultBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(qryDefault).Params[0].AsInteger := dados.qryEmpresaCodigo.value;
end;

procedure TfrmCBRconfig.qryDefaultNewRecord(DataSet: TDataSet);
VAR
  Caminho: string;
begin

  Caminho := ExtractFilePath(Application.ExeName) + 'Boleto\Remessa';

  if DirectoryExists(Caminho) then
    TFDQuery(dtsDefault.DataSet).FieldByName('DIRENVIA').AsString :=
      ExtractFilePath(Application.ExeName) + 'Boleto\Remessa';

  if DirectoryExists(Caminho) then
    TFDQuery(dtsDefault.DataSet).FieldByName('DIRRECEBE').AsString :=
      ExtractFilePath(Application.ExeName) + 'Boleto\Retorno';

  if DirectoryExists(Caminho) then
    TFDQuery(dtsDefault.DataSet).FieldByName('DIRRECEBEBKP').AsString :=
      ExtractFilePath(Application.ExeName) + 'Boleto\Backup';

  TFDQuery(dtsDefault.DataSet).FieldByName('LOCALPAGTO').AsString :=
    'PAGAR EM QUALQUER BANCO OU NAS CASAS LOTERICAS';

  TFDQuery(dtsDefault.DataSet).FieldByName('CNAB').AsString := 'CNAB 240';

  TFDQuery(dtsDefault.DataSet).FieldByName('VLRTARIFABOLETA')
    .AsCurrency := 0.00;
end;

procedure TfrmCBRconfig.sbtnGetCertClick(Sender: TObject);
var
  Dir: String;
begin

  if SelectDirectory('Selecione um diretório', 'c:\', Dir) then
  begin
    if dtsDefault.DataSet.State in [dsBrowse] then
      dtsDefault.DataSet.Edit;

    dtsDefault.DataSet.FieldByName('DIRENVIA').AsString := Dir;
  end;
end;

class procedure TfrmCBRconfig.showConfig;
begin
  frmCBRconfig := TfrmCBRconfig.Create(Nil);
  try
    frmCBRconfig.ShowModal;
  finally
    FreeAndNil(frmCBRconfig);
  end;
end;

procedure TfrmCBRconfig.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    if dtsDefault.DataSet.State in [dsBrowse] then
      dtsDefault.DataSet.Edit;

    dtsDefault.DataSet.FieldByName('LOGOMARCA').AsAnsiString :=
      AnsiString(OpenDialog.FileName);
  end;
end;

procedure TfrmCBRconfig.SpeedButton2Click(Sender: TObject);
var
  Dir: String;
begin
  if SelectDirectory('Selecione um diretório', 'c:\', Dir) then
  begin
    if dtsDefault.DataSet.State in [dsBrowse] then
      dtsDefault.DataSet.Edit;

    dtsDefault.DataSet.FieldByName('DIRRECEBE').AsString := Dir;
  end;
end;

procedure TfrmCBRconfig.SpeedButton3Click(Sender: TObject);
var
  Dir: String;
begin
  if SelectDirectory('Selecione um diretório', 'c:\', Dir) then
  begin
    if dtsDefault.DataSet.State in [dsBrowse] then
      dtsDefault.DataSet.Edit;

    dtsDefault.DataSet.FieldByName('DIRRECEBEBKP').AsString := Dir;
  end;
end;

end.
