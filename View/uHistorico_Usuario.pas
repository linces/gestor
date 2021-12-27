unit uHistorico_Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  dateutils,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.DBCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DBCtrlsEh, DBLookupEh;

type
  TfrmHistorico_usuario = class(TForm)
    Panel1: TPanel;
    btnRelatorio: TSpeedButton;
    GroupBox1: TGroupBox;
    cbTela: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbOperacao: TComboBox;
    MaskInicio: TMaskEdit;
    Label4: TLabel;
    MaskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBMemo1: TDBMemo;
    cbUsuario: TDBLookupComboboxEh;
    Label1: TLabel;
    qrySupervisor: TFDQuery;
    dsSupervisor: TDataSource;
    qryLogMaster: TFDQuery;
    qryTela: TFDQuery;
    qryOperacao: TFDQuery;
    qryOperacaoOPERACAO: TStringField;
    qryTelaTELA: TStringField;
    dsLogMaster: TDataSource;
    qryLogMasterCODIGO: TIntegerField;
    qryLogMasterDATA: TDateField;
    qryLogMasterHORA: TTimeField;
    qryLogMasterFK_USUARIO: TIntegerField;
    qryLogMasterTELA: TStringField;
    qryLogMasterOPERACAO: TStringField;
    qryLogMasterFK_EMPRESA: TIntegerField;
    qryLogMasterDESCRICAO: TStringField;
    qryLogMasterREGISTRO: TStringField;
    qryLogMasterLOGIN: TStringField;
    cbEmpresa: TDBLookupComboboxEh;
    Label5: TLabel;
    dsEmpresa: TDataSource;
    qryEmpresa: TFDQuery;
    qryEmpresaCODIGO: TIntegerField;
    qryEmpresaFANTASIA: TStringField;
    qryLogDetalhe: TFDQuery;
    dsLogDetalhe: TDataSource;
    qryLogDetalheCODIGO: TIntegerField;
    qryLogDetalheLOG_MASTER: TIntegerField;
    qryLogDetalheHISTORICO: TMemoField;
    qrySupervisorCODIGO: TIntegerField;
    qrySupervisorLOGIN: TStringField;
    edtReg: TMaskEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dsLogMasterDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistorico_usuario: TfrmHistorico_usuario;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmHistorico_usuario.btnLimparClick(Sender: TObject);
begin
  cbUsuario.KeyValue := 0;
  cbEmpresa.KeyValue := 0;
  cbTela.Text := '';
  cbOperacao.Text := '';
  btnFiltrarClick(self);
end;

procedure TfrmHistorico_usuario.btnFiltrarClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := '';

  if cbEmpresa.KeyValue <> null then
    if cbEmpresa.KeyValue <> 0 then
      filtro := filtro + ' AND log.fk_empresa=' + inttostr(cbEmpresa.KeyValue);

  if cbUsuario.KeyValue <> null then
    if cbUsuario.KeyValue <> 0 then
      filtro := filtro + ' AND log.fk_usuario=' + inttostr(cbUsuario.KeyValue);

  if cbTela.Text <> '' then
    filtro := filtro + ' AND log.tela=' + QuotedStr(cbTela.Text);

  if cbOperacao.Text <> '' then
    filtro := filtro + ' AND log.operacao=' +  QuotedStr(cbOperacao.Text);

  if trim(edtReg.Text) <>'' then
   filtro := filtro + ' AND log.Registro='+edtReg.Text;

  qryLogMaster.Close;
  qryLogMaster.SQL.Text := ' select LOG.*, usu.login from LOG_MASTER LOG' +
    ' left join usuarios usu on usu.codigo=log.fk_usuario' + ' where' +
    ' LOG.data between :data1 and :data2' + ' /*where*/' +
    ' order by log.data desc, log.hora desc, usu.login';

  qryLogMaster.SQL.Text := StringReplace(qryLogMaster.SQL.Text, '/*where*/',
    filtro, [rfReplaceAll]);

  qryLogMaster.Params[0].Value := MaskInicio.EditText;
  qryLogMaster.Params[1].Value := MaskFim.EditText;
  qryLogMaster.Open;

end;

procedure TfrmHistorico_usuario.dsLogMasterDataChange(Sender: TObject;
  Field: TField);
begin
  qryLogDetalhe.Close;
  qryLogDetalhe.Open;
end;

procedure TfrmHistorico_usuario.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TfrmHistorico_usuario.FormShow(Sender: TObject);
begin
  MaskInicio.Text := datetostr(StartOfTheMonth(date));
  MaskFim.Text := datetostr(EndOfTheMonth(date));

  qryTela.Close;
  qryTela.Open;

  qryOperacao.Close;
  qryOperacao.Open;

  qryEmpresa.Close;
  qryEmpresa.Open;

  qrySupervisor.Close;
  qrySupervisor.Open;


  cbEmpresa.KeyValue := 0;
  cbUsuario.KeyValue := 0;

  cbTela.Clear;
  cbTela.Items.Add('');

  qryTela.First;
  while not qryTela.Eof do
  begin
    cbTela.Items.Add(qryTelaTELA.Value);
    qryTela.Next;
  end;

  cbOperacao.Clear;
  cbOperacao.Items.Add('');

  qryOperacao.First;
  while not qryOperacao.Eof do
  begin
    cbOperacao.Items.Add(qryOperacaoOPERACAO.Value);
    qryOperacao.Next;
  end;

  btnFiltrarClick(self);

end;

end.
