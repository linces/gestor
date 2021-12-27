unit ufrmCBRcadastroM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultCadastro, Data.DB, ACBrBase,
  ACBrEnterTab, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvComCtrls,
  JvExControls, JvSpeedButton, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, JvBaseEdits, JvDBControls, JvDateTimePicker,
  JvDBDateTimePicker, JvDBLookup, JvExStdCtrls, JvCombobox, JvDBCombobox,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvGroupBox, Vcl.Buttons,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvgGroupBox, Vcl.Grids, Vcl.DBGrids,
  JvExExtCtrls, JvExtComponent, JvDBRadioPanel, JvDBCheckBox, JvSpin,
  JvExDBGrids, JvDBGrid, JvMemo;

type
  TfrmCBRcadastroM = class(TfrmDefaultCadastro)
    Label6: TLabel;
    dtsqryPESSOAS: TDataSource;
    Label17: TLabel;
    JvgGroupBox1: TJvgGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label11: TLabel;
    ID_PESSOA: TJvDBLookupCombo;
    DT_CADASTRO: TJvDateEdit;
    DT_EMISSAO: TJvDateEdit;
    DT_PRIVENCIMENTO: TJvDateEdit;
    INTERVADO_DIAS: TJvSpinEdit;
    NUM_PARCELAS: TJvSpinEdit;
    HISTORICO: TJvMaskEdit;
    VLR_PRINCIPAL: TJvCalcEdit;
    tjvbg: TJvgGroupBox;
    JvDBGrid1: TJvDBGrid;
    OBS: TJvMemo;
    btnGeraParcelas: TJvSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnGeraParcelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetFieldsRequireds(ADataSet: TDataSet);
  public
    procedure PosOnShow; override;
  end;

var
  frmCBRcadastroM: TfrmCBRcadastroM;

implementation

{$R *.dfm}

uses
  udtmCBR, ufuncoes, ACBrUtil, ACBrValidador, DateUtils;


procedure TfrmCBRcadastroM.btnConfirmarClick(Sender: TObject);
begin
  if pageDefault.Enabled then
    FocusControl(pageDefault);

  SetFieldsRequireds(dtsDefault.DataSet);

  inherited;
end;

procedure TfrmCBRcadastroM.btnGeraParcelasClick(Sender: TObject);
var
  I: Integer;
  vVLR_PRINCIPAL,
  vVLR_PARCELA,
  vDIF_PARCELA: Currency;

  vNUM_PARCELAS: Integer;
  vPRI_VENCIMENTO: TDate;
begin
  vVLR_PRINCIPAL := 0.00;
  vVLR_PARCELA := 0.00;
  vDIF_PARCELA := 0.00;

  TFDQuery(dtsDefault.DataSet).Connection.RollbackRetaining;
  TFDQuery(dtsDefault.DataSet).Close;
  TFDQuery(dtsDefault.DataSet).Open;

  vVLR_PRINCIPAL := VLR_PRINCIPAL.Value;
  vNUM_PARCELAS := NUM_PARCELAS.AsInteger;
  vPRI_VENCIMENTO := DT_PRIVENCIMENTO.Date;

  if vNUM_PARCELAS > 1 then
  begin
    vVLR_PARCELA := ACBrUtil.RoundABNT(vVLR_PRINCIPAL / vNUM_PARCELAS,2);
    vDIF_PARCELA := vVLR_PRINCIPAL - (vVLR_PARCELA * vNUM_PARCELAS);
  end;
  SetFieldsRequireds(dtsDefault.DataSet);

  for I := 1 to vNUM_PARCELAS do
  begin
    with TFDQuery(dtsDefault.DataSet) do
    begin
      try
        Append;
        FieldByName('ID_PESSOA').AsInteger := ID_PESSOA.Value.ToInteger;
        FieldByName('DTCADASTRO').AsDateTime := DT_CADASTRO.Date;
        FieldByName('DTEMISSAO').AsDateTime := DT_EMISSAO.Date;
        FieldByName('DTVENCIMENTO').AsDateTime := vPRI_VENCIMENTO;
        FieldByName('VALOR').AsCurrency := vVLR_PARCELA;
        FieldByName('HISTORICO').AsString := HISTORICO.Text;

        if I = vNUM_PARCELAS then
          if vDIF_PARCELA <> 0.00 then
            FieldByName('VALOR').AsCurrency := vVLR_PARCELA + vDIF_PARCELA;
        Post;
      except on e:exception do
        begin
          Cancel;
          raise Exception.Create('Erro ao inserir as parcelas;' + sLineBreak + sLineBreak + e.Message);
        end;
      end;

      IncDay(vPRI_VENCIMENTO,INTERVADO_DIAS.AsInteger);
    end;
  end;
end;

procedure TfrmCBRcadastroM.FormShow(Sender: TObject);
begin
  inherited;

  TFDQuery(dtsDefault.DataSet).Cancel;
end;

procedure TfrmCBRcadastroM.PosOnShow;
begin
  inherited;

  DT_CADASTRO.Date := Date;
  DT_EMISSAO.Date := Date;
  DT_PRIVENCIMENTO.Date := Date + 30;
  NUM_PARCELAS.Value := 1;
  INTERVADO_DIAS.Value := 30;
  HISTORICO.Clear;
  OBS.Clear;
end;

procedure TfrmCBRcadastroM.SetFieldsRequireds(ADataSet: TDataSet);
begin
  ADataSet.FieldByName('SITUACAO').Required := True;
  ADataSet.FieldByName('ID_PESSOA').Required := True;
  ADataSet.FieldByName('DTEMISSAO').Required := True;
  ADataSet.FieldByName('DTVENCIMENTO').Required := True;
  ADataSet.FieldByName('VALOR').Required := True;
  ADataSet.FieldByName('HISTORICO').Required := True;
  ADataSet.FieldByName('VLJURO').Required := True;
  ADataSet.FieldByName('VLACRESCIMO').Required := True;
  ADataSet.FieldByName('VLDESCONTO').Required := True;
  ADataSet.FieldByName('VLPAGO').Required := True;
  ADataSet.FieldByName('DTCADASTRO').Required := True;
end;

end.
