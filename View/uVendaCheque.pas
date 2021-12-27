unit uVendaCheque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, ACBrBase,
  ACBrEnterTab;

type
  TfrmCHParcela = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTotal: TEdit;
    edtParcela: TEdit;
    Label2: TLabel;
    BtnExcluir: TBitBtn;
    BtnGerar: TBitBtn;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    qryCH: TFDQuery;
    dsCH: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label3: TLabel;
    DBText2: TDBText;
    ACBrEnterTab1: TACBrEnterTab;
    Splitter3: TSplitter;
    qryCHTTOTAL: TAggregateField;
    qryCHCODIGO: TIntegerField;
    qryCHNUMERO: TIntegerField;
    qryCHAGENCIA: TStringField;
    qryCHCONTA_CORRENTE: TStringField;
    qryCHVALOR: TBCDField;
    qryCHDATA_PREDATA: TDateField;
    qryCHDATA_COMPESADO: TDateField;
    qryCHSITUACAO: TStringField;
    qryCHFK_CONTA_DESTINO: TIntegerField;
    qryCHFK_VENDA: TIntegerField;
    qryCHFK_CLIENTE: TIntegerField;
    qryCHFK_EMPRESA: TIntegerField;
    qryCHHISTORICO: TStringField;
    qryCHDATA_EMISSAO: TDateField;
    qryCHBANCO: TStringField;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    edtIntervalo: TEdit;
    Label4: TLabel;
    procedure edtParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGerarClick(Sender: TObject);
    procedure qryCHAfterPost(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    PodeFechar: Boolean;
    procedure Excluir;
    { Private declarations }
  public
    idCliente, idVenda: integer;
    vValor: real;
    { Public declarations }
  end;

var
  frmCHParcela: TfrmCHParcela;

implementation

{$R *.dfm}

uses Udados;

procedure TfrmCHParcela.btnAvancarClick(Sender: TObject);
var
  valor1, valor2: string;
begin
  if qryCH.State in dsEditModes then
    qryCH.Post;

  if not qryCH.IsEmpty then
  begin
    valor1 := formatfloat('0.00', simpleroundto(qryCHTTOTAL.Value, -2));
    valor2 := edtTotal.text;
    if valor1.ToExtended <> valor2.ToExtended then
    begin
      ShowMessage('Atenção!' +
        'Não é possivel concluir. Total das parcelas difere do Valor total da venda!');
      exit;
    end;
  end;
  dados.vChamaImpressao := true;
  PodeFechar := true;
  close;
end;

procedure TfrmCHParcela.Excluir;
begin
  try
    BtnExcluir.Enabled := false;
    while not qryCH.IsEmpty do
    begin
      qryCH.Delete;
    end;
  finally
    BtnExcluir.Enabled := true;
  end;
end;

procedure TfrmCHParcela.BtnExcluirClick(Sender: TObject);
begin
  if Application.messageBox('Tem certeza de que deseja excluir parcelas?',
    'Confirmação', mb_YesNo) = mrYes then
  begin
    Excluir;
  end;
end;

procedure TfrmCHParcela.BtnGerarClick(Sender: TObject);
var
  i: integer;
  vDif, vSoma: real;
begin
  if Application.messageBox('Tem certeza de que deseja gerar parcelas?',
    'Confirmação', mb_YesNo) <> mrYes then
    exit;

  try

    if strtoint(edtParcela.text) = 0 then
    begin
      ShowMessage('Digite o numero de parcelas ');
      exit;
    end;

    Excluir;

    BtnGerar.Enabled := false;
    vSoma := 0;
    for i := 1 to strtoint(edtParcela.text) do
    begin
      qryCH.Insert;
      qryCHCODIGO.Value := dados.Numerador('CHEQUES', 'CODIGO', 'N', '', '');
      qryCHDATA_EMISSAO.Value := date;
      qryCHFK_CLIENTE.Value := idCliente;
      qryCHVALOR.AsString := formatfloat('0.00',
        simpleroundto(vValor / strtoint(edtParcela.text), -2));
      qryCHDATA_PREDATA.Value := date + (i * strtoint(edtIntervalo.text));
      qryCHSITUACAO.Value := 'A';
      qryCHFK_VENDA.Value := idVenda;
      qryCHFK_EMPRESA.Value := dados.qryEmpresaCODIGO.Value;
      qryCHHISTORICO.Value := 'REF. VENDA Nº' + IntToStr(idVenda);
      qryCH.Post;
      dados.Conexao.CommitRetaining;
      vSoma := vSoma + qryCHVALOR.AsFloat;
    end;

    qryCH.Refresh;
    qryCH.First;
    vDif := vValor - vSoma;
    if vDif <> 0 then
    begin
      qryCH.Edit;
      qryCHVALOR.Value := simpleroundto(qryCHVALOR.Value + vDif, -2);
      qryCH.Post;
      dados.Conexao.CommitRetaining;
    end;

  finally
    BtnGerar.Enabled := true;
  end;
end;

procedure TfrmCHParcela.btnVoltarClick(Sender: TObject);
begin
  PodeFechar := true;
  dados.vChamaImpressao := false;
  close;
end;

procedure TfrmCHParcela.DBGridEh1Enter(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := false;
end;

procedure TfrmCHParcela.DBGridEh1Exit(Sender: TObject);
begin
  ACBrEnterTab1.EnterAsTab := true;
end;

procedure TfrmCHParcela.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCHParcela.edtParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
    Key := #0;
end;

procedure TfrmCHParcela.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCHParcela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not PodeFechar then
    Action := canone;
end;

procedure TfrmCHParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Escape then
    btnVoltarClick(self);
  if Key = vk_f2 then
    BtnGerarClick(self);
  if Key = vk_f3 then
    BtnExcluirClick(self);
  if Key = vk_f4 then
    btnVoltarClick(self);
  if Key = vk_f5 then
    btnAvancarClick(self);
end;

procedure TfrmCHParcela.FormShow(Sender: TObject);
begin

  PodeFechar := false;

  qryCH.close;
  qryCH.Params[0].Value := idVenda;
  qryCH.Open;

end;

procedure TfrmCHParcela.qryCHAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

end.
