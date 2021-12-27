unit uSintegra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, CheckLst, Mask, ExtCtrls, ACBrBase,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, DateUtils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSintegra = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    qry50: TFDQuery;
    qry50TABELA: TStringField;
    qry50CNPJ: TStringField;
    qry50UF: TStringField;
    qry50IE: TStringField;
    qry50DTENTRADA: TDateField;
    qry50MODELO: TStringField;
    qry50SERIE: TStringField;
    qry50NR_NOTA: TStringField;
    qry50CFOP: TStringField;
    qry50ALIQ_ICMS: TFMTBCDField;
    qry50STATUS: TStringField;
    qry50TOTAL: TFMTBCDField;
    qry50BASE: TFMTBCDField;
    qry50VALOR: TFMTBCDField;
    qry51: TFDQuery;
    QRY53: TFDQuery;
    QRY54: TFDQuery;
    qry61: TFDQuery;
    qry61R: TFDQuery;
    qry61TABELA: TStringField;
    qry61DATA_EMISSAO: TDateField;
    qry61MODELO: TStringField;
    qry61SERIE: TStringField;
    qry61ALIQ_ICMS: TFMTBCDField;
    qry61MENOR_NUMERO: TIntegerField;
    qry61MAIOR_NUMERO: TIntegerField;
    qry61TOTAL: TFMTBCDField;
    qry61BASE: TFMTBCDField;
    qry61VALOR: TFMTBCDField;
    qry51TABELA: TStringField;
    qry51CNPJ: TStringField;
    qry51UF: TStringField;
    qry51IE: TStringField;
    qry51DTENTRADA: TDateField;
    qry51MODELO: TStringField;
    qry51SERIE: TStringField;
    qry51NR_NOTA: TStringField;
    qry51CFOP: TStringField;
    qry51ALIQ_ICMS: TFMTBCDField;
    qry51STATUS: TStringField;
    qry51TOTAL: TFMTBCDField;
    qry51BASE: TFMTBCDField;
    qry51VALOR: TFMTBCDField;
    QRY53TABELA: TStringField;
    QRY53CNPJ: TStringField;
    QRY53UF: TStringField;
    QRY53IE: TStringField;
    QRY53DTENTRADA: TDateField;
    QRY53MODELO: TStringField;
    QRY53SERIE: TStringField;
    QRY53NR_NOTA: TStringField;
    QRY53CFOP: TStringField;
    QRY53ALIQ_ST: TFMTBCDField;
    QRY53STATUS: TStringField;
    QRY53TOTAL: TFMTBCDField;
    QRY53BASE: TFMTBCDField;
    QRY53VALOR: TFMTBCDField;
    qry61RDATA_EMISSAO: TDateField;
    qry61RID_PRODUTO: TIntegerField;
    qry61RDESCRICAO: TStringField;
    qry61RUNIDADE: TStringField;
    qry61RQTD: TFMTBCDField;
    qry61RVALOR_ITEM: TFMTBCDField;
    qry61RBASE_ICMS: TFMTBCDField;
    qry61RALIQ_ICMS: TFMTBCDField;
    QRY54TABELA: TStringField;
    QRY54CNPJ: TStringField;
    QRY54UF: TStringField;
    QRY54IE: TStringField;
    QRY54DTENTRADA: TDateField;
    QRY54MODELO: TStringField;
    QRY54SERIE: TStringField;
    QRY54NR_NOTA: TStringField;
    QRY54CFOP: TStringField;
    QRY54CST_ICM: TStringField;
    QRY54ITEM: TSmallintField;
    QRY54FK_PRODUTO: TIntegerField;
    QRY54DESCRICAO: TStringField;
    QRY54UNIDADE: TStringField;
    QRY54QTD: TFMTBCDField;
    QRY54VL_ITEM: TFMTBCDField;
    QRY54DESCONTO: TFMTBCDField;
    QRY54BASE_ICMS: TFMTBCDField;
    QRY54BASE_ST: TFMTBCDField;
    QRY54VL_IPI: TFMTBCDField;
    QRY54ALIQ_ICMS: TFMTBCDField;
    qry75: TFDQuery;
    qry75CODIGO: TIntegerField;
    qry75DESCRICAO: TStringField;
    qry75UNIDADE: TStringField;
    qry75NCM: TStringField;
    Memo1: TMemo;
    qry74: TFDQuery;
    qry74FK_PRODUTO: TIntegerField;
    qry74DESCRICAO: TStringField;
    qry74PR_CUSTO: TFMTBCDField;
    qry74QTDE: TFMTBCDField;
    qry74QTDS: TFMTBCDField;
    qry74SALDO: TFMTBCDField;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox4: TGroupBox;
    MaskEdit3: TMaskEdit;
    CheckBox1: TCheckBox;
    qry50BASE_ST: TFMTBCDField;
    qry50VALOR_ST: TFMTBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure GerarRegistro10;
    procedure GerarRegistro11;
    procedure GerarRegistro50;
    procedure GerarRegistro51;
    procedure GerarRegistro53;
    procedure GerarRegistro54;
    procedure GerarRegistro61;
    procedure GerarRegistro61R;
    procedure GerarRegistro74;
    procedure GerarRegistro75;
    procedure GerarRegistro90;

  public
    { Public declarations }
  end;

var
  frmSintegra: TfrmSintegra;

implementation

{$R *.dfm}

uses Udados, uGeraSintegra;

procedure TfrmSintegra.Button1Click(Sender: TObject);
var
  caminho: string;
begin
  try
    if StrToDate(MaskEdit2.text) < StrToDate(MaskEdit1.text) then
    begin
      application.messagebox('Data Final não pode ser menor que a inicial',
        'Erro', mb_iconstop);
      MaskEdit2.setfocus;
      exit;
    end
    else if StrToDate(MaskEdit1.text) > date then
    begin
      application.messagebox('Data Final não pode ser maior que a data atual',
        'Erro', mb_iconstop);
      MaskEdit2.setfocus;
      exit;
    end;
  except
    application.messagebox('Intervalo de datas inválido.', 'Erro', mb_iconstop);
    MaskEdit1.setfocus;
    exit;
  end;

  if not DirectoryExists(ExtractFilePath(application.ExeName) + '\Sintegra\')
  then
    CreateDir(ExtractFilePath(application.ExeName) + '\Sintegra\');

  caminho := ExtractFilePath(application.ExeName) + '\Sintegra\' +
    FormatDateTime('mmyyyy', StrToDate(MaskEdit1.text)) + '.txt';

  try
    try
      Memo1.Lines.Clear;
      GerarRegistro10;
      GerarRegistro11;
      GerarRegistro50;
      // GerarRegistro51;
      GerarRegistro53;
      GerarRegistro54;
      GerarRegistro61;
      GerarRegistro61R;

      if CheckBox1.Checked then
      begin
        qry74.Close;
        qry74.Params[0].Value := MaskEdit3.EditText;
        qry74.Params[1].Value := dados.qryEmpresaCODIGO.Value;
        qry74.Open;

        GerarRegistro74;
      end
      else
      begin
        qry74.Close;
        qry74.Params[0].Value := '01/01/1001';
        qry74.Params[1].Value := dados.qryEmpresaCODIGO.Value;
        qry74.Open;
      end;

      GerarRegistro75;
      GerarRegistro90;
      Memo1.Lines.SaveToFile(caminho);

      messagebox(0, 'Geração concluída', 'Informação',
        mb_iconinformation + mb_taskmodal);
    except
      on e: Exception do
      begin
        application.messagebox(PChar('Erro ao gerar arquivo do sintegra!' + #13
          + 'Erro: ' + e.Message), 'Erro', mb_iconstop + mb_taskmodal);
      end;
    end;
  finally
  end;
end;

procedure TfrmSintegra.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmSintegra.FormShow(Sender: TObject);
begin
  Edit2.text := dados.qryEmpresaRAZAO.Value;
  Edit3.text := dados.qryEmpresaIE.Value;
  if trim(dados.qryEmpresaIE.Value) = '' then
    Edit3.text := 'ISENTO';
  MaskEdit1.EditText := DateToStr(StartOfTheMonth(StartOfTheMonth(date) - 1));
  MaskEdit2.EditText := DateToStr(StartOfTheMonth(date) - 1);
  MaskEdit3.EditText := DateToStr(StartOfTheYear(date) - 1);
end;

procedure TfrmSintegra.GerarRegistro10;
begin
  Memo1.Lines.Add(gerareg10(dados.qryEmpresaCNPJ.Value, Edit3.text,
    dados.qryEmpresaRAZAO.Value, dados.qryEmpresaUF.Value,
    dados.qryEmpresaCIDADE.Value, dados.qryEmpresaFONE.Value,
    IntToStr(ComboBox1.ItemIndex + 1), IntToStr(ComboBox2.ItemIndex + 1),
    Copy(ComboBox3.Items[ComboBox3.ItemIndex], 1, 1), StrToDate(MaskEdit1.text),
    StrToDate(MaskEdit2.text)));
end;

procedure TfrmSintegra.GerarRegistro11;
begin
  Memo1.Lines.Add(gerareg11(dados.qryEmpresaENDERECO.Value,
    dados.qryEmpresaNUMERO.Value, dados.qryEmpresaCOMPLEMENTO.Value,
    dados.qryEmpresaBAIRRO.Value, dados.qryEmpresaCEP.Value,
    dados.qryEmpresaRESPONSAVEL_EMPRESA.Value, dados.qryEmpresaFONE.Value));
end;

procedure TfrmSintegra.GerarRegistro50;
var
  emissor, cfop, situacao, inscricao: string;
begin

  qry50.Close;
  qry50.Params[0].Value := MaskEdit1.EditText;
  qry50.Params[1].Value := MaskEdit2.EditText;
  qry50.Params[2].Value := dados.qryEmpresaCODIGO.Value;
  qry50.Open;
  qry50.First;

  while not qry50.Eof do
  begin

    if qry50TABELA.Value = 'T' then
      emissor := 'T';

    if qry50TABELA.Value = 'P' then
      emissor := 'P';

    if qry50TABELA.Value = 'T' then
      situacao := 'N'
    else
    begin
      if qry50STATUS.Value = '2' then
        situacao := 'N';
      if qry50STATUS.Value = '3' then
        situacao := 'S';
      if qry50STATUS.Value = '5' then
        situacao := '4';
      if qry50STATUS.Value = '6' then
        situacao := '2';
    end;

    inscricao := 'ISENTO';
    if trim(qry50IE.Value) <> '' then
      inscricao := qry50IE.Value;

    Memo1.Lines.Add(GerarReg50(qry50CNPJ.Value, inscricao,
      qry50DTENTRADA.AsString, qry50UF.Value, qry50MODELO.Value,
      qry50SERIE.Value, qry50NR_NOTA.Value, qry50CFOP.Value, emissor,
      qry50TOTAL.AsFloat, qry50BASE.AsFloat, qry50VALOR.AsFloat, 0, 0,
      qry50ALIQ_ICMS.AsFloat, situacao));
    qry50.Next;
  end;

end;

procedure TfrmSintegra.GerarRegistro51;
var
  cfop, situacao: string;
begin

  qry51.Close;
  qry51.Params[0].Value := MaskEdit1.EditText;
  qry51.Params[1].Value := MaskEdit2.EditText;
  qry51.Open;
  qry51.First;

  while not qry51.Eof do
  begin

    if qry51TABELA.Value = 'T' then
    begin
      cfop := '2102';
      if qry51UF.Value = dados.qryEmpresaUF.Value then
        cfop := '1102';

    end;

    if qry51TABELA.Value = 'T' then
      situacao := 'N'
    else
    begin
      if qry51STATUS.Value = '2' then
        situacao := 'N';
      if qry51STATUS.Value = '3' then
        situacao := 'S';
      if qry51STATUS.Value = '5' then
        situacao := '4';
      if qry51STATUS.Value = '6' then
        situacao := '2';
    end;

    Memo1.Lines.Add(GerarReg51(qry51CNPJ.Value, qry51IE.Value,
      qry51DTENTRADA.AsString, qry51UF.Value, qry51SERIE.Value,
      qry51NR_NOTA.Value, cfop, qry51TOTAL.AsFloat, qry51VALOR.AsFloat, 0, 0,
      situacao));
    qry51.Next;
  end;

end;

procedure TfrmSintegra.GerarRegistro53;
var
  emissor, cfop, situacao: string;
begin

  QRY53.Close;
  QRY53.Params[0].Value := MaskEdit1.EditText;
  QRY53.Params[1].Value := MaskEdit2.EditText;
  QRY53.Open;
  QRY53.First;

  while not QRY53.Eof do
  begin

    if QRY53TABELA.Value = 'T' then
    begin
      emissor := 'T';
      cfop := '2102';
      if qry50UF.Value = dados.qryEmpresaUF.Value then
        cfop := '1102';

    end;
    if QRY53TABELA.Value = 'P' then
      emissor := 'P';

    if QRY53TABELA.Value = 'T' then
      situacao := 'N'
    else
    begin
      if QRY53STATUS.Value = '2' then
        situacao := 'N';
      if QRY53STATUS.Value = '3' then
        situacao := 'S';
      if QRY53STATUS.Value = '5' then
        situacao := '4';
      if QRY53STATUS.Value = '6' then
        situacao := '2';
    end;

    Memo1.Lines.Add(GerarReg53(QRY53CNPJ.Value, QRY53IE.Value,
      QRY53DTENTRADA.AsString, QRY53UF.Value, QRY53MODELO.Value,
      QRY53SERIE.Value, QRY53NR_NOTA.Value, cfop, emissor, QRY53BASE.AsFloat,
      QRY53VALOR.AsFloat, 0, situacao, ''));
    QRY53.Next;
  end;

end;

procedure TfrmSintegra.GerarRegistro54;
begin

  QRY54.Close;
  QRY54.Params[0].Value := MaskEdit1.EditText;
  QRY54.Params[1].Value := MaskEdit2.EditText;
  QRY54.Params[2].Value := dados.qryEmpresaCODIGO.Value;
  QRY54.Open;

  QRY54.First;
  while not QRY54.Eof do
  begin
    Memo1.Lines.Add(GerarReg54(QRY54CNPJ.Value, QRY54MODELO.Value,
      QRY54SERIE.AsString, QRY54NR_NOTA.Value, QRY54CFOP.Value,
      QRY54CST_ICM.Value, QRY54ITEM.AsString, QRY54FK_PRODUTO.AsString,
      QRY54QTD.AsFloat, QRY54VL_ITEM.AsFloat, 0, QRY54BASE_ICMS.AsFloat,
      QRY54BASE_ST.AsFloat, QRY54VL_IPI.AsFloat, QRY54ALIQ_ICMS.AsFloat));
    QRY54.Next;
  end;

end;

procedure TfrmSintegra.GerarRegistro61;
begin
  qry61.Close;
  qry61.Params[0].Value := MaskEdit1.EditText;
  qry61.Params[1].Value := MaskEdit2.EditText;
  qry61.Params[2].Value := dados.qryEmpresaCODIGO.Value;
  qry61.Open;

  qry61.First;
  while not qry61.Eof do
  begin
    Memo1.Lines.Add(GerarReg61(qry61DATA_EMISSAO.Value, qry61MODELO.Value, 'D',
      qry61SERIE.AsString, qry61MENOR_NUMERO.AsString,
      qry61MAIOR_NUMERO.AsString, qry61TOTAL.AsFloat, qry61BASE.AsFloat,
      qry61VALOR.AsFloat, 0, 0, qry61ALIQ_ICMS.AsFloat));

    qry61.Next;
  end;
end;

procedure TfrmSintegra.GerarRegistro61R;
begin
  qry61R.Close;
  qry61R.Params[0].Value := MaskEdit1.EditText;
  qry61R.Params[1].Value := MaskEdit2.EditText;
  qry61R.Params[2].Value := dados.qryEmpresaCODIGO.Value;
  qry61R.Open;

  qry61R.First;
  while not qry61R.Eof do
  begin
    Memo1.Lines.Add(GerarReg61R(FormatDateTime('mmyyyy',
      qry61RDATA_EMISSAO.Value), qry61RID_PRODUTO.AsString, qry61RQTD.AsFloat,
      qry61RVALOR_ITEM.AsFloat, qry61RBASE_ICMS.AsFloat,
      qry61RALIQ_ICMS.AsFloat));
    qry61R.Next;
  end;
end;

procedure TfrmSintegra.GerarRegistro74;
var
  inscricao: string;

begin
  qry74.Close;
  qry74.Params[0].Value := MaskEdit3.EditText;
  qry74.Params[1].Value := dados.qryEmpresaCODIGO.Value;
  qry74.Open;

  inscricao := 'ISENTO';
  if dados.qryEmpresaIE.Value <> '' then
  begin
    inscricao := dados.qryEmpresaIE.Value;
  end;

  qry74.First;
  while not qry74.Eof do
  begin
    Memo1.Lines.Add(GerarReg74(StrToDate(MaskEdit3.EditText),
      qry74FK_PRODUTO.Value, qry74SALDO.AsFloat, qry74PR_CUSTO.AsFloat, '1',
      '0', '', dados.qryEmpresaUF.Value));
    qry74.Next;
  end;
end;

procedure TfrmSintegra.GerarRegistro75;
begin
  qry75.Close;
  qry75.ParamByName('DT1').Value := MaskEdit1.EditText;
  qry75.ParamByName('DT2').Value := MaskEdit2.EditText;
  qry75.ParamByName('EMPRESA').Value := dados.qryEmpresaCODIGO.Value;
  if CheckBox1.Checked then
    qry75.ParamByName('DATA').Value := MaskEdit3.EditText
  else
    qry75.ParamByName('DATA').Value := '01/01/1001';

  qry75.Open;

  qry75.First;
  while not qry75.Eof do
  begin
    Memo1.Lines.Add(GerarReg75(StrToDate(MaskEdit1.EditText),
      StrToDate(MaskEdit2.EditText), qry75CODIGO.AsString, qry75NCM.Value,
      qry75DESCRICAO.Value, qry75UNIDADE.Value, 0, 0, 0, 0));
    qry75.Next;
  end;
end;

procedure TfrmSintegra.GerarRegistro90;
var
  w90, w90a, w90b: string;
begin
  qry50.Last;
  // qry51.Last;
  // QRY53.Last;
  QRY54.Last;
  qry61.Last;
  qry61R.Last;
  qry74.Last;
  qry75.Last;

  w90 := GerarReg90(dados.qryEmpresaCNPJ.Value, dados.qryEmpresaIE.Value,
    qry50.RecordCount, 0, QRY53.RecordCount, QRY54.RecordCount,
    qry61.RecordCount, qry61R.RecordCount, qry74.RecordCount,
    qry75.RecordCount);

  w90a := Copy(w90, 1, pos('##', w90) - 1);
  if w90a <> '' then
    Memo1.Lines.Add(w90a);

  w90b := Copy(w90, pos('##', w90) + 2, 10000);
  Memo1.Lines.Add(w90b);

end;

end.
