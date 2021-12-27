unit uResumoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrBase, ACBrPosPrinter, frxClass,
  frxDBSet, frxExportPDF, frxExportBaseDialog, ACBrDFeReport,
  ACBrDFeDANFeReport, Vcl.Mask, DBCtrlsEh, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Imaging.pngimage, frxExportXLS;

type
  TResumo = record
    Codigo: Integer;
    Lote: Integer;
    Usuario: Integer;
    Fpg: Integer;
    Caixa: Integer;
    FkEmpresa: Integer;
    Data: TdateTime;
    Flag: String;
    Historico: String;
    Tipo: string;
    Entrada: Extended;
    Saida: Extended;
    Procedure InsereResumo;
    procedure LimpaResumo;
    procedure GetResumo(Lote, Usuario: Integer);
    procedure OpenTabela;
    procedure ExecutaSql;
    procedure FechaCaixa(Lote, Usuario: Integer);
    function Dinheiro: Extended;
    procedure LimpaFechamento;
    procedure GeraCaixa;
  end;

  TRelatorio = Record
    ENTRADA_DINHEIRO: Extended;
    SAIDA_DINHEIRO: Extended;
    SALDO_DINHEIRO: Extended;
    ENTRADA_OUTRAS: Extended;
    SAIDA_OUTRAS: Extended;
    SALDO_OUTRAS: Extended;
    procedure Calcula;

  End;

  TfrmResumoCaixa = class(TForm)
    qryConsulta: TFDQuery;
    dsConsulta: TDataSource;
    qryConsultaTIPO: TStringField;
    qryConsultaHISTORICO: TStringField;
    frxDBResumo: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    qryConsultaENTRADA: TFMTBCDField;
    qryConsultaSAIDA: TFMTBCDField;
    dsResumo: TDataSource;
    qryResumo: TFDQuery;
    Panel1: TPanel;
    Label7: TLabel;
    edtValor: TJvCalcEdit;
    DBGridEh1: TDBGridEh;
    btnImprimir: TBitBtn;
    btnFinalizar: TBitBtn;
    qryResumoCODIGO: TIntegerField;
    qryResumoLOTE: TIntegerField;
    qryResumoFPG: TIntegerField;
    qryResumoUSUARIO: TIntegerField;
    qryResumoCAIXA: TIntegerField;
    qryResumoDATA_HORA: TSQLTimeStampField;
    qryResumoTIPO: TStringField;
    qryResumoHISTORICO: TStringField;
    qryResumoFLAG: TStringField;
    qryResumoENTRADA: TFMTBCDField;
    qryResumoSAIDA: TFMTBCDField;
    qryResumoFKEMPRESA: TIntegerField;
    qryResumoTTOTAL: TAggregateField;
    qryResumoTENTRADA: TAggregateField;
    qryResumoTSAIDA: TAggregateField;
    Image1: TImage;
    btnRecibo: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    qryDinheiro: TFDQuery;
    frxDBEmpresa: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    pnImpressao: TPanel;
    Shape1: TShape;
    Label21: TLabel;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure FormActivate(Sender: TObject);
    procedure btnReciboClick(Sender: TObject);
  private
    procedure Imprime;
    procedure VisualizarResumo;
    { Private declarations }

  public
    VwResumo: Boolean;
    FLote, FUsuario: Integer;
    { Public declarations }
  end;

var
  frmResumoCaixa: TfrmResumoCaixa;
  FResumo: TResumo;
  FRelatorio: TRelatorio;

implementation

{$R *.dfm}

uses Udados, udmImpressao;

function Spaces(C: Integer): String;
begin
  Result := StringOfChar(' ', C);
end;

function Alinha(Texto: String; Total: Integer; Lado: Boolean): String;
begin
  if Lado Then // alinha a direita.
    Result := Spaces(Total - Length(Texto)) + Texto
  else // alinha a esquerda
    Result := Texto + Spaces(Total - Length(Texto));
end;

procedure TfrmResumoCaixa.btnImprimirClick(Sender: TObject);
begin
  if tag = 1 then
  begin
    if FResumo.Dinheiro = 0 then
      if edtValor.Value <> 0 then
        raise Exception.Create('Atenção! Total em dinheiro no caixa é zero!!');

    FResumo.LimpaFechamento;
    FResumo.FechaCaixa(frmResumoCaixa.FLote, frmResumoCaixa.FUsuario);
    FResumo.InsereResumo;
    FResumo.Dinheiro;
    FResumo.OpenTabela;
  end;

  if not qryResumo.IsEmpty then
    pnImpressao.Visible := true;

end;

procedure TfrmResumoCaixa.btnReciboClick(Sender: TObject);
begin
  if FResumo.Dinheiro = 0 then
    if edtValor.Value <> 0 then
      raise Exception.Create('Atenção! Total em dinheiro no caixa é zero!!');

  FResumo.LimpaFechamento;
  FResumo.FechaCaixa(frmResumoCaixa.FLote, frmResumoCaixa.FUsuario);
  FResumo.InsereResumo;
  FResumo.Dinheiro;
  FResumo.OpenTabela;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelReciboCaixaBobina.fr3');
  frxReport.ShowReport;
  pnImpressao.Visible := false;
end;

procedure TfrmResumoCaixa.btnFinalizarClick(Sender: TObject);
begin


  if FResumo.Dinheiro = 0 then
    if edtValor.Value <> 0 then
      raise Exception.Create('Atenção! Total em dinheiro no caixa é zero!!');

  if FResumo.Dinheiro <> 0 then
    if edtValor.Value = 0 then
      raise Exception.Create('Atenção! Informe o total em dinheiro no caixa!!');

  FResumo.LimpaFechamento;
  FResumo.FechaCaixa(frmResumoCaixa.FLote, frmResumoCaixa.FUsuario);
  FResumo.InsereResumo;
  FResumo.Dinheiro;
  FResumo.OpenTabela;


  FResumo.GeraCaixa;



  Dados.vPodeFecharCaixa := true;



  close;



end;

procedure TfrmResumoCaixa.Button1Click(Sender: TObject);
begin
  VisualizarResumo;
end;

procedure TfrmResumoCaixa.Imprime;
var
  SL: TStringList;
  sTexto: string;
  FQtd: Integer;
begin
  try
    SL := TStringList.Create;
    SL.Clear;
    SL.add('<n>' + Dados.qryEmpresaRAZAO.AsString + '</n>');
    SL.add('</linha_simples>');
    SL.add('RESUMO CAIXA');
    SL.add('</linha_simples>');
    SL.add('<n>' + PadCenter('Histórico', Dados.qryTerminalCOLUNAS.AsInteger,
      '*') + '</n>');

    qryResumo.First;
    while not qryResumo.Eof do
    begin

      SL.add(PadRight(qryResumoHISTORICO.AsString, 30) +
        PadLeft(FormatFloat('0.00', qryResumoENTRADA.AsFloat), 6) +
        PadLeft(FormatFloat('0.00', qryResumoSAIDA.AsFloat), 6));
      qryResumo.Next;
    end;

    SL.add('<n>' + PadCenter('Movimentação em Dinheiro',
      Dados.qryTerminalCOLUNAS.AsInteger, '*') + '</n>');

    SL.add('TOTAL ENTRADA.:' + FormatFloat(',0.00',
      FRelatorio.ENTRADA_DINHEIRO));
    SL.add('TOTAL SAIDA.:' + FormatFloat(',0.00', FRelatorio.SAIDA_DINHEIRO));
    SL.add('TOTAL ......:' + FormatFloat(',0.00', FRelatorio.SALDO_DINHEIRO));

    SL.add('<n>' + PadCenter('Outras Movimentações',
      Dados.qryTerminalCOLUNAS.AsInteger, '*') + '</n>');
    SL.add('TOTAL ENTRADA.:' + FormatFloat(',0.00', FRelatorio.ENTRADA_OUTRAS));
    SL.add('TOTAL SAIDA.:' + FormatFloat(',0.00', FRelatorio.SAIDA_OUTRAS));
    SL.add('TOTAL ......:' + FormatFloat(',0.00', FRelatorio.SALDO_OUTRAS));
    SL.add('</linha_dupla>');
    SL.add('Relatório emitido em ' + DateTimeToStr(now));
    SL.add('</corte>');

    SL.SaveToFile(ExtractFilePath(Application.ExeName) + 'resumo.txt');

    dmImpressao.ConfiguraImpressora('');
    dmImpressao.ImprimeLogo;
    dmImpressao.ImprimeTexto(SL.Text);
  finally
    SL.Free;
  end;
end;

procedure TfrmResumoCaixa.VisualizarResumo;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelResumoCaixa.fr3');
  frxReport.ShowReport;
  pnImpressao.Visible := false;
end;

procedure TfrmResumoCaixa.Button2Click(Sender: TObject);
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\RelResumoCaixaBobina.fr3');
  frxReport.ShowReport;
  pnImpressao.Visible := false;
  // Imprime;
end;

procedure TfrmResumoCaixa.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmResumoCaixa.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TfrmResumoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;

  if Key = vk_f2 then
  begin
    if btnImprimir.Visible then
      btnImprimirClick(self);

    if btnRecibo.Visible then
      btnReciboClick(self);
  end;

  if Key = vk_f10 then
    btnFinalizarClick(self);

end;

procedure TfrmResumoCaixa.FormShow(Sender: TObject);
begin
  FResumo.ExecutaSql;

  if tag = 1 then // tela chamada a partir do PDV
  begin

    Label7.Visible := true;
    edtValor.Visible := true;
    btnFinalizar.Visible := true;

    if (Dados.qryEmpresaEXIBE_RESUMO_CAIXA.Value = 'S') then
    begin

      Panel3.Visible := true;
      DBGridEh1.Columns[1].Visible := true;
      DBGridEh1.Columns[2].Visible := true;
      btnImprimir.Visible := true;
      btnRecibo.Visible := false;

    end
    else
    begin

      Panel3.Visible := false;
      DBGridEh1.Columns[1].Visible := false;
      DBGridEh1.Columns[2].Visible := false;
      btnImprimir.Visible := false;
      btnRecibo.Visible := true;

    end;

  end
  else
  begin

    Label7.Visible := false;
    edtValor.Visible := false;
    Panel3.Visible := true;
    DBGridEh1.Columns[1].Visible := true;
    DBGridEh1.Columns[2].Visible := true;
    btnImprimir.Visible := true;
    btnRecibo.Visible := false;
    btnFinalizar.Visible := false;

  end;

  if VwResumo then
  begin
    btnFinalizar.Visible := false;
    btnRecibo.Visible := false;
    btnImprimir.Visible := false;
    Label7.Visible := false;
    edtValor.Visible := false;
  end;

end;

procedure TfrmResumoCaixa.frxReportGetValue(const VarName: string;
  var Value: Variant);
begin

  FRelatorio.Calcula;

  if VarName = 'CAIXA' then
    Value := Dados.vConta;

  if VarName = 'USUARIO' then
    Value := Dados.vUsuario;

  if VarName = 'VALOR' then
    Value := FormatFloat(',0.00', edtValor.Value);

  if VarName = 'ENTRADAD' then
    Value := FormatFloat(',0.00', FRelatorio.ENTRADA_DINHEIRO);

  if VarName = 'SAIDAD' then
    Value := FormatFloat(',0.00', FRelatorio.SAIDA_DINHEIRO);

  if VarName = 'TOTALD' then
    Value := FormatFloat(',0.00', FRelatorio.SALDO_DINHEIRO);

  if VarName = 'ENTRADAT' then
    Value := FormatFloat(',0.00', FRelatorio.ENTRADA_OUTRAS);

  if VarName = 'SAIDAT' then
    Value := FormatFloat(',0.00', FRelatorio.SAIDA_OUTRAS);

  if VarName = 'TOTALT' then
    Value := FormatFloat(',0.00', FRelatorio.SALDO_OUTRAS);

  if VarName = 'PARAMETROS' then
  begin
    Value := 'DATA: ' + datetostr(now) + ' | USUÁRIO: ' + Dados.vUsuario +
      ' | CAIXA: ' + IntToStr(Dados.idCaixa);
  end;
end;

{ TResumo }

function TResumo.Dinheiro: Extended;
begin
  try
    Dados.qryExecute.SQL.Clear;
    Dados.qryExecute.SQL.add
      ('select coalesce(sum(entrada-saida),0) as saldo from resumo_caixa');
    Dados.qryExecute.SQL.add('where');
    Dados.qryExecute.SQL.add('lote=:lote and');
    Dados.qryExecute.SQL.add('usuario=:usuario and');
    Dados.qryExecute.SQL.add('tipo=''D'' and');
    Dados.qryExecute.SQL.add('FLAG=''A''');

    Dados.qryExecute.ParamByName('lote').Value := frmResumoCaixa.FLote;
    Dados.qryExecute.ParamByName('usuario').Value := frmResumoCaixa.FUsuario;

    Dados.qryExecute.Prepare;
    Dados.qryExecute.Open;

    Result := Dados.qryExecute.FieldByName('saldo').AsFloat;

    frmResumoCaixa.Label3.Caption := FormatFloat(',0.00', Result);

  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TResumo.ExecutaSql;
begin
  try

    frmResumoCaixa.qryConsulta.close;
    frmResumoCaixa.qryConsulta.ParamByName('id').Value :=
      frmResumoCaixa.FUsuario;
    frmResumoCaixa.qryConsulta.ParamByName('lote').Value :=
      frmResumoCaixa.FLote;
    frmResumoCaixa.qryConsulta.Open;

    if frmResumoCaixa.tag = 1 then
    begin

      FResumo.LimpaResumo;

      frmResumoCaixa.qryConsulta.First;
      while not frmResumoCaixa.qryConsulta.Eof do
      begin
        FResumo.GetResumo(frmResumoCaixa.FLote, frmResumoCaixa.FUsuario);
        FResumo.InsereResumo;
        frmResumoCaixa.qryConsulta.Next;
      end;
    end;

    FResumo.OpenTabela;
    FResumo.Dinheiro;

  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;

end;

procedure TResumo.FechaCaixa(Lote, Usuario: Integer);
begin
  FResumo.Codigo := Dados.Numerador('RESUMO_CAIXA', 'CODIGO', 'N', 'N', 'N');
  FResumo.Lote := Lote;
  FResumo.Usuario := Usuario;
  FResumo.Fpg := Dados.buscafpg('D');
  FResumo.Caixa := Dados.idCaixa;
  FResumo.FkEmpresa := Dados.qryEmpresa.FieldByName('codigo').Value;
  FResumo.Data := now;
  FResumo.Flag := 'B';
  FResumo.Historico := 'FECHAMENTO DE CAIXA';
  FResumo.Tipo := 'D';
  FResumo.Entrada := 0;
  FResumo.Saida := StrToFloat(FormatFloat('0.00',
    frmResumoCaixa.edtValor.Value));
end;

procedure TResumo.GeraCaixa;
begin
  if frmResumoCaixa.edtValor.Value > 0 then
  begin
    Dados.qryCaixa.close;
    Dados.qryCaixa.Params[0].Value := -1;
    Dados.qryCaixa.Open;

    Dados.qryCaixa.Insert;
    Dados.qryCaixaCODIGO.Value := Dados.Numerador('CAIXA', 'CODIGO',
      'N', '', '');
    Dados.qryCaixaEMISSAO.Value := DATE;
    Dados.qryCaixaEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
    Dados.qryCaixaTIPO_MOVIMENTO.Value := 'VA';
    Dados.qryCaixaDOC.Value := 'CX.' + Dados.idCaixa.ToString;
    Dados.qryCaixaHISTORICO.Value := 'FECHAMENTO DO CX:' + Dados.vConta + '-' +
      Dados.vUsuario + '-' + DateTimeToStr(now);
    Dados.qryCaixaENTRADA.AsFloat := FResumo.Dinheiro;
    Dados.qryCaixaSAIDA.Value := 0;
    Dados.qryCaixaHORA_EMISSAO.Value := time;
//    ShowMessage('Usuário');
    Dados.qryCaixaID_USUARIO.Value := Dados.idUsuario;
    Dados.qryCaixaFKPLANO.Value := Dados.qryEmpresaID_PLANO_VENDA.Value;
    Dados.qryCaixaFKCONTA.Value := Dados.qryEmpresaID_CAIXA_GERAL.Value;
    Dados.qryCaixaRESUMO_CAIXA.Value := 'S';
    Dados.qryCaixaTRANSFERENCIA.Value := 0;
    Dados.qryCaixaFPG.Value := Dados.buscafpg('D');
    Dados.qryCaixa.Post;
  end;

end;

procedure TResumo.GetResumo(Lote, Usuario: Integer);
begin
  FResumo.Codigo := Dados.Numerador('RESUMO_CAIXA', 'CODIGO', 'N', 'N', 'N');
  FResumo.Lote := Lote;
  FResumo.Usuario := Usuario;
  FResumo.Fpg := 0;
  FResumo.Caixa := Dados.idCaixa;
  FResumo.FkEmpresa := Dados.qryEmpresa.FieldByName('codigo').Value;
  FResumo.Data := now;
  FResumo.Flag := 'A';
  FResumo.Historico := frmResumoCaixa.qryConsulta.FieldByName
    ('historico').AsString;
  FResumo.Tipo := frmResumoCaixa.qryConsulta.FieldByName('tipo').AsString;
  FResumo.Entrada := frmResumoCaixa.qryConsulta.FieldByName('entrada').AsFloat;
  FResumo.Saida := frmResumoCaixa.qryConsulta.FieldByName('saida').AsFloat;
end;

procedure TResumo.InsereResumo;
begin

  Dados.qryExecute.close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'delete from resumo_caixa where lote=:lote and usuario=:usuario and flag=''B''';
  Dados.qryExecute.ParamByName('lote').Value := frmResumoCaixa.FLote;
  Dados.qryExecute.ParamByName('usuario').Value := frmResumoCaixa.FUsuario;
  Dados.qryExecute.ExecSQL;

  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.add('INSERT INTO RESUMO_CAIXA (');
  Dados.qryExecute.SQL.add('CODIGO,');
  Dados.qryExecute.SQL.add('LOTE,');
  Dados.qryExecute.SQL.add('FPG,');
  Dados.qryExecute.SQL.add('USUARIO,');
  Dados.qryExecute.SQL.add('CAIXA,');
  Dados.qryExecute.SQL.add('DATA_HORA,');
  Dados.qryExecute.SQL.add('HISTORICO,');
  Dados.qryExecute.SQL.add('ENTRADA,');
  Dados.qryExecute.SQL.add('SAIDA,');
  Dados.qryExecute.SQL.add('TIPO,');
  Dados.qryExecute.SQL.add('FLAG,');

  Dados.qryExecute.SQL.add('FKEMPRESA) VALUES (');

  Dados.qryExecute.SQL.add(':CODIGO,');
  Dados.qryExecute.SQL.add(':LOTE,');
  Dados.qryExecute.SQL.add(':FPG,');
  Dados.qryExecute.SQL.add(':USUARIO,');
  Dados.qryExecute.SQL.add(':CAIXA,');
  Dados.qryExecute.SQL.add(':DATA_HORA,');
  Dados.qryExecute.SQL.add(':HISTORICO,');
  Dados.qryExecute.SQL.add(':ENTRADA,');
  Dados.qryExecute.SQL.add(':SAIDA,');
  Dados.qryExecute.SQL.add(':TIPO,');
  Dados.qryExecute.SQL.add(':FLAG,');
  Dados.qryExecute.SQL.add(':FKEMPRESA)');

  Dados.qryExecute.ParamByName('CODIGO').AsInteger := FResumo.Codigo;
  Dados.qryExecute.ParamByName('LOTE').Value := FResumo.Lote;
  Dados.qryExecute.ParamByName('FPG').Value := FResumo.Fpg;
  Dados.qryExecute.ParamByName('USUARIO').Value := FResumo.Usuario;
  Dados.qryExecute.ParamByName('CAIXA').Value := FResumo.Caixa;
  Dados.qryExecute.ParamByName('DATA_HORA').Value := FResumo.Data;
  Dados.qryExecute.ParamByName('HISTORICO').Value := FResumo.Historico;
  Dados.qryExecute.ParamByName('ENTRADA').Value := FResumo.Entrada;
  Dados.qryExecute.ParamByName('SAIDA').Value := FResumo.Saida;
  Dados.qryExecute.ParamByName('TIPO').Value := FResumo.Tipo;
  Dados.qryExecute.ParamByName('FLAG').Value := FResumo.Flag;
  Dados.qryExecute.ParamByName('FKEMPRESA').Value := FResumo.FkEmpresa;

  Dados.qryExecute.Prepare;
  Dados.qryExecute.ExecSQL;

end;

procedure TResumo.LimpaFechamento;
begin
  Dados.qryExecute.close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'delete from resumo_caixa where lote=:lote and usuario=:usuario and flag=''B''';
  Dados.qryExecute.ParamByName('lote').Value := frmResumoCaixa.FLote;
  Dados.qryExecute.ParamByName('usuario').Value := frmResumoCaixa.FUsuario;
  Dados.qryExecute.ExecSQL;
end;

procedure TResumo.LimpaResumo;
begin
  Dados.qryExecute.close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.Text :=
    'delete from resumo_caixa where lote=:lote and usuario=:usuario';
  Dados.qryExecute.ParamByName('lote').Value := frmResumoCaixa.FLote;
  Dados.qryExecute.ParamByName('usuario').Value := frmResumoCaixa.FUsuario;
  Dados.qryExecute.ExecSQL;
end;

procedure TResumo.OpenTabela;
begin
  frmResumoCaixa.qryResumo.close;
  frmResumoCaixa.qryResumo.ParamByName('lote').Value := frmResumoCaixa.FLote;
  frmResumoCaixa.qryResumo.ParamByName('usuario').Value :=
    frmResumoCaixa.FUsuario;
  frmResumoCaixa.qryResumo.Open;
end;

{ TRelatorio }

procedure TRelatorio.Calcula;
begin

  Dados.qryExecute.close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.add
    ('select coalesce(SUM(ENTRADA),0) ENTRADA, coalesce(SUM(SAIDA),0) SAIDA, coalesce(SUM(SAIDA-ENTRADA),0) SALDO');
  Dados.qryExecute.SQL.add('from RESUMO_CAIXA');
  Dados.qryExecute.SQL.add('where');
  Dados.qryExecute.SQL.add('TIPO=''D'' and');
  Dados.qryExecute.SQL.add('LOTE = :LOTE and');
  Dados.qryExecute.SQL.add('usuario = :usuario ');
  Dados.qryExecute.ParamByName('lote').AsInteger := frmResumoCaixa.FLote;
  Dados.qryExecute.ParamByName('usuario').AsInteger := frmResumoCaixa.FUsuario;
  Dados.qryExecute.Prepare;
  Dados.qryExecute.Open;

  FRelatorio.ENTRADA_DINHEIRO := Dados.qryExecute.FieldByName
    ('ENTRADA').AsFloat;
  FRelatorio.SAIDA_DINHEIRO := Dados.qryExecute.FieldByName('SAIDA').AsFloat;
  FRelatorio.SALDO_DINHEIRO := Dados.qryExecute.FieldByName('SALDO').AsFloat;

  Dados.qryExecute.close;
  Dados.qryExecute.SQL.Clear;
  Dados.qryExecute.SQL.add
    ('select coalesce(SUM(ENTRADA),0) ENTRADA, coalesce(SUM(SAIDA),0) SAIDA, coalesce(SUM(ENTRADA-SAIDA),0) SALDO');
  Dados.qryExecute.SQL.add('from RESUMO_CAIXA');
  Dados.qryExecute.SQL.add('where');
  Dados.qryExecute.SQL.add('TIPO<>''D'' and');
  Dados.qryExecute.SQL.add('LOTE = :lote and');
  Dados.qryExecute.SQL.add('usuario = :usuario ');
  Dados.qryExecute.ParamByName('lote').AsInteger := frmResumoCaixa.FLote;
  Dados.qryExecute.ParamByName('usuario').AsInteger := frmResumoCaixa.FUsuario;
  Dados.qryExecute.Prepare;
  Dados.qryExecute.Open;

  FRelatorio.ENTRADA_OUTRAS := Dados.qryExecute.FieldByName('ENTRADA').AsFloat;
  FRelatorio.SAIDA_OUTRAS := Dados.qryExecute.FieldByName('SAIDA').AsFloat;
  FRelatorio.SALDO_OUTRAS := Dados.qryExecute.FieldByName('SALDO').AsFloat;

end;

end.
