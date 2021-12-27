{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit uCadLaudo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, Vcl.Grids,
  Vcl.DBGrids, JvComponentBase, JvEnterTab;

type
  TfrmCadLaudo = class(TForm)
    dsLaudo: TDataSource;
    qryLaudo: TFDQuery;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    DBComboBox1: TDBComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit19: TDBEdit;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    Label26: TLabel;
    DBEdit25: TDBEdit;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    DBEdit28: TDBEdit;
    Label30: TLabel;
    DBEdit29: TDBEdit;
    Label31: TLabel;
    Label25: TLabel;
    DBEdit31: TDBEdit;
    Label32: TLabel;
    Panel1: TPanel;
    btnFinalizar: TSpeedButton;
    btnSair: TSpeedButton;
    btnSalvar: TSpeedButton;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    qryLaudoCODIGO: TIntegerField;
    qryLaudoDATA_CLASSIFICACAO: TDateField;
    qryLaudoMUNICIPIO_CLASSIFICACAO: TStringField;
    qryLaudoLOCAL_CLASSIFICAO: TStringField;
    qryLaudoNUMERO_CONTRATO: TStringField;
    qryLaudoLACRE: TStringField;
    qryLaudoORIGEM: TStringField;
    qryLaudoDESTINO: TStringField;
    qryLaudoPLACA: TStringField;
    qryLaudoPESO_LIQUIDO: TSingleField;
    qryLaudoPESO_TARA: TSingleField;
    qryLaudoPESO_BRUTO: TSingleField;
    qryLaudoNOTA_FISCAL: TIntegerField;
    qryLaudoPRODUTO: TStringField;
    qryLaudoVEICULO_VISTORIA: TStringField;
    qryLaudoMOTORISTA: TStringField;
    qryLaudoCPF_MOTORISTA: TStringField;
    qryLaudoTIPO_PRODUTO: TStringField;
    qryLaudoQUEIMADOS: TSingleField;
    qryLaudoARDIDOS: TSingleField;
    qryLaudoMOFADOS: TSingleField;
    qryLaudoAVARIADOS: TSingleField;
    qryLaudoIMPUREZAS: TSingleField;
    qryLaudoAMASSADOS: TSingleField;
    qryLaudoUMIDADE: TSingleField;
    qryLaudoESVERDEADOS: TSingleField;
    qryLaudoPICADOS: TSingleField;
    qryLaudoFERMENTADOS: TSingleField;
    qryLaudoINSETOS: TStringField;
    qryLaudoSEMENTES_TOXICAS: TStringField;
    qryLaudoCLASSIFICADOR: TStringField;
    qryLaudoDATA_EMISSAO: TDateField;
    qryLaudoLAUDO: TStringField;
    qryLaudoSITUACAO: TStringField;
    qryLaudoCLIENTE: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure qryLaudoAfterPost(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure qryLaudoNewRecord(DataSet: TDataSet);
    procedure qryLaudoBeforePost(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLaudo: TfrmCadLaudo;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCadLaudo.btnFinalizarClick(Sender: TObject);
begin

  If application.messagebox('Tem certeza que FINALIZAR LAUDOS?', 'Confirmação',
    mb_yesno + mb_iconquestion) = idno then
    exit;
  try
    btnFinalizar.Enabled := false;
    if not(qryLaudo.State in dsEditModes) then
      qryLaudo.Edit;
    qryLaudoSITUACAO.Value := 'F';
    qryLaudo.Post;

    Close;
  finally
    btnFinalizar.Enabled := true;
  end;
end;

procedure TfrmCadLaudo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if application.messagebox('Deseja Sair da Tela?', 'Confirmação', mb_yesno) <> mrYes
  then
    Action := caNone;
end;

procedure TfrmCadLaudo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2:
      btnSalvarClick(self);

    vk_f3:
      btnFinalizarClick(self);

    VK_ESCAPE:
      btnSairClick(self)
  end;

end;

procedure TfrmCadLaudo.qryLaudoAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadLaudo.qryLaudoBeforePost(DataSet: TDataSet);
begin

  if qryLaudo.State = dsInsert then
    qryLaudoCODIGO.Value := Dados.Numerador('LAUDO_CLASSIFICACAO', 'CODIGO',
      'N', '', '');
  qryLaudoLAUDO.Value := 'BOM/' + formatfloat('0000', qryLaudoCODIGO.Value);

end;

procedure TfrmCadLaudo.qryLaudoNewRecord(DataSet: TDataSet);
begin
  qryLaudoDATA_CLASSIFICACAO.Value := DATE;
  qryLaudoDATA_EMISSAO.Value := DATE;
  qryLaudoPESO_LIQUIDO.Value := 0;
  qryLaudoPESO_TARA.Value := 0;
  qryLaudoPESO_BRUTO.Value := 0;
  qryLaudoQUEIMADOS.Value := 0;
  qryLaudoARDIDOS.Value := 0;
  qryLaudoMOFADOS.Value := 0;
  qryLaudoAVARIADOS.Value := 0;
  qryLaudoIMPUREZAS.Value := 0;
  qryLaudoAMASSADOS.Value := 0;
  qryLaudoUMIDADE.Value := 0;
  qryLaudoESVERDEADOS.Value := 0;
  qryLaudoPICADOS.Value := 0;
  qryLaudoFERMENTADOS.Value := 0;
  qryLaudoUMIDADE.Value := 0;
  qryLaudoSITUACAO.Value := 'A';
  qryLaudoVEICULO_VISTORIA.Value := 'NÃO';
  qryLaudoINSETOS.Value := 'NÃO';
  qryLaudoSEMENTES_TOXICAS.Value := 'NÃO';

end;

procedure TfrmCadLaudo.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadLaudo.qryItensAfterPost(DataSet: TDataSet);
begin
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmCadLaudo.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadLaudo.btnSalvarClick(Sender: TObject);
begin
  try
    btnSalvar.Enabled := false;

    if qryLaudo.State in dsEditModes then
      qryLaudo.Post;

    ShowMessage('Laudo Salvo com Sucesso!');
  finally
    btnSalvar.Enabled := true;
  end;

end;

end.
