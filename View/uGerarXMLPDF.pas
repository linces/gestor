unit uGerarXMLPDF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, dateutils,
  FireDAC.Comp.Client, ACBrNFeDANFEClass, ACBrDANFCeFortesFrA4, ACBrBase,
  ACBrDFe, ACBrNFe;

type
  TfrmGerarXml = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    qryXML: TFDQuery;
    qryXMLNUMERO: TIntegerField;
    qryXMLDATA_EMISSAO: TDateField;
    qryXMLCHAVE: TStringField;
    qryXMLTRIB_FED: TBCDField;
    qryXMLTRIB_EST: TBCDField;
    qryXMLTRIB_MUN: TBCDField;
    qryXMLSITUACAO: TStringField;
    qryXMLSERIE: TStringField;
    qryXMLXML: TMemoField;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortesA41: TACBrNFeDANFCeFortesA4;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
  private
    procedure GerarXml;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarXml: TfrmGerarXml;

implementation

{$R *.dfm}

uses uNFCe, Udados;

procedure TfrmGerarXml.GerarXml;
begin
  frmNFCe.configura;
  if RadioGroup1.ItemIndex = 0 then
  begin
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromString(frmNFCe.qryVendaXML.AsString);
    ACBrNFe1.NotasFiscais.GravarXML();
    ACBrNFe1.DANFE := ACBrNFeDANFCeFortesA41;

    ACBrNFe1.DANFE.vTribFed := frmNFCe.qryVendaTRIB_FED.Value;
    ACBrNFe1.DANFE.vTribEst := frmNFCe.qryVendaTRIB_EST.Value;
    ACBrNFe1.DANFE.vTribMun := frmNFCe.qryVendaTRIB_MUN.Value;
    ACBrNFe1.DANFE.PathPDF := dados.qryConfigPATHPDF.Value;
    ACBrNFe1.NotasFiscais.ImprimirPDF;

  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromString(qryXMLXML.AsString);
    ACBrNFe1.NotasFiscais.GravarXML();
    ACBrNFe1.DANFE := ACBrNFeDANFCeFortesA41;

    ACBrNFe1.DANFE.vTribFed := qryXMLTRIB_FED.Value;
    ACBrNFe1.DANFE.vTribEst := qryXMLTRIB_EST.Value;
    ACBrNFe1.DANFE.vTribMun := qryXMLTRIB_MUN.Value;
    ACBrNFe1.DANFE.PathPDF := dados.qryConfigPATHPDF.Value;
    ACBrNFe1.NotasFiscais.ImprimirPDF;

  end;

end;

procedure TfrmGerarXml.BitBtn1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    GerarXml;

  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
    qryXML.Close;
    qryXML.Params[0].Value := DateTimePicker1.Date;
    qryXML.Params[1].Value := DateTimePicker2.Date;
    qryXML.Open;
    qryXML.Last;
    ProgressBar1.Position := 1;
    ProgressBar1.Min := 1;
    ProgressBar1.Max := qryXML.RecordCount;
    qryXML.First;
    while not qryXML.Eof do
    begin
      GerarXml;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      qryXML.Next;
    end;
    ShowMessage('xml gerado com sucesso!');
  end;
end;

procedure TfrmGerarXml.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerarXml.DateTimePicker1Exit(Sender: TObject);
begin
  DateTimePicker2.Date := EndOfTheMonth(DateTimePicker1.Date);
end;

procedure TfrmGerarXml.DateTimePicker2Exit(Sender: TObject);
begin
  DateTimePicker2.Date := EndOfTheMonth(DateTimePicker1.Date);
end;

procedure TfrmGerarXml.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := StartOfTheMonth(Date);
  DateTimePicker2.Date := EndOfTheMonth(DateTimePicker1.Date);
end;

procedure TfrmGerarXml.RadioGroup1Click(Sender: TObject);
begin
  DateTimePicker1.Enabled := true;
  DateTimePicker2.Enabled := true;
  if RadioGroup1.ItemIndex = 0 then
  begin
    DateTimePicker1.Enabled := false;
    DateTimePicker2.Enabled := false;
  end;
end;

end.
