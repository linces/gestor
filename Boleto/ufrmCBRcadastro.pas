unit ufrmCBRcadastro;

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
  JvExExtCtrls, JvExtComponent, JvDBRadioPanel, JvDBCheckBox;


type
  TfrmCBRcadastro = class(TfrmDefaultCadastro)
    JvPageControl1: TJvPageControl;
    Label6: TLabel;
    dtsqryPESSOAS: TDataSource;
    Label17: TLabel;
    JvgGroupBox3: TJvgGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    HISTORICO: TJvDBMaskEdit;
    DTCADASTRO: TJvDBDateTimePicker;
    ID_PESSOA: TJvDBLookupCombo;
    DTVENCIMENTO: TJvDBDateTimePicker;
    VLDESCONTO: TJvDBCalcEdit;
    VLACRESCIMO: TJvDBCalcEdit;
    calc_VlrTotal: TJvDBCalcEdit;
    JvgGroupBox2: TJvgGroupBox;
    OBS: TDBMemo;
    VALOR: TJvDBCalcEdit;
    JvDBDateTimePicker2: TJvDBDateTimePicker;
    VLJURO: TJvDBCalcEdit;
    Label14: TLabel;
    REMESSA_REENVIAR: TJvDBCheckBox;
    procedure btnConfirmarClick(Sender: TObject);
  private
    procedure SetFieldsRequireds(ADataSet: TDataSet);
  public
    procedure PosOnShow; override;
  end;

var
  frmCBRcadastro: TfrmCBRcadastro;

implementation

{$R *.dfm}

uses
  udtmCBR, ufuncoes, ACBrUtil, ACBrValidador;


procedure TfrmCBRcadastro.btnConfirmarClick(Sender: TObject);
begin
  if pageDefault.Enabled then
    FocusControl(pageDefault);

  SetFieldsRequireds(dtsDefault.DataSet);
  inherited;
end;

procedure TfrmCBRcadastro.PosOnShow;
begin
  inherited;

  REMESSA_REENVIAR.Enabled :=
    (dtsDefault.DataSet.FieldByName('REGISTRO_STATUS').AsString = 'R') or
    (dtsDefault.DataSet.FieldByName('REGISTRO_STATUS').AsString = 'E');
end;

procedure TfrmCBRcadastro.SetFieldsRequireds(ADataSet: TDataSet);
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
