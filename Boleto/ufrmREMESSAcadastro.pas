unit ufrmREMESSAcadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultCadastro, Data.DB, ACBrBase,
  ACBrEnterTab, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvComCtrls,
  JvExControls, JvSpeedButton, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, JvBaseEdits, JvDBControls, JvDateTimePicker,
  JvDBDateTimePicker, JvDBLookup, JvExStdCtrls, JvCombobox, JvDBCombobox,
  Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvGroupBox, Vcl.Buttons,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvgGroupBox, Vcl.Grids,
  Vcl.DBGrids,
  JvExExtCtrls, JvExtComponent, JvDBRadioPanel, JvExDBGrids, JvDBGrid,
  Datasnap.DBClient;

type
  TfrmREMESSAcadastro = class(TfrmDefaultCadastro)
    JvPageControl1: TJvPageControl;
    Label6: TLabel;
    Label17: TLabel;
    JvgGroupBox3: TJvgGroupBox;
    dbGrid: TJvDBGrid;
    Panel1: TPanel;
    btnTITULOSlimpar: TJvSpeedButton;
    btnTITULOSexcluir: TJvSpeedButton;
    dtsqryREMESSA_TITULOS: TDataSource;
    btnTITULOauto: TJvSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnTITULOSlimparClick(Sender: TObject);
    procedure btnTITULOSexcluirClick(Sender: TObject);
    procedure btnTITULOautoClick(Sender: TObject);
    procedure dtsqryREMESSA_TITULOSDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FGravouRemessa: Boolean;
    procedure SetFieldsRequireds(ADataSet: TDataSet);
    procedure LimpaTitulos;
    procedure UpdateBoleto;
  public
  end;

var
  frmREMESSAcadastro: TfrmREMESSAcadastro;

implementation

{$R *.dfm}

uses
  udtmCBR, ufuncoes, ACBrUtil, ACBrValidador, Udados;

procedure TfrmREMESSAcadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FGravouRemessa := false;
end;

procedure TfrmREMESSAcadastro.btnConfirmarClick(Sender: TObject);
begin
  FGravouRemessa := true;
  if pageDefault.Enabled then
    FocusControl(pageDefault);

  SetFieldsRequireds(dtsDefault.DataSet);

  inherited;
end;

procedure TfrmREMESSAcadastro.UpdateBoleto;
begin
  TFDQuery(dtsDefault.DataSet).Connection.ExecSQL
    (Format('UPDATE CRECEBER SET ID_CBR_REMESSA_UUID = %s WHERE SITUACAO = ''A'' AND TIPO=''B'' AND ID_CBR_REMESSA_UUID Is Null AND (REMESSA = ''N'' OR REMESSA_REENVIAR = ''S'');',
    [dtsDefault.DataSet.FieldByName('ID_CBR_REMESSA_UUID')
    .AsString.QuotedString]));
end;

procedure TfrmREMESSAcadastro.btnTITULOautoClick(Sender: TObject);
begin
  UpdateBoleto;
  TFDQuery(dtsqryREMESSA_TITULOS.DataSet).Close;
  TFDQuery(dtsqryREMESSA_TITULOS.DataSet).Open;
  TFDQuery(dtsqryREMESSA_TITULOS.DataSet).FetchAll;

  if TFDQuery(dtsqryREMESSA_TITULOS.DataSet).IsEmpty then
    Application.MessageBox
      ('Não foram encontrados Titulos em condição para envio para remessa!',
      'Aviso!', MB_ICONINFORMATION);
end;

procedure TfrmREMESSAcadastro.btnTITULOSexcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do registro selecionado ?',
    'Confirmação!', MB_YESNO) = mrYes then
  begin
    try
      TFDQuery(dtsDefault.DataSet).Connection.ExecSQL
        (Format('UPDATE CRECEBER SET ID_CBR_REMESSA_UUID = Null WHERE CRECEBER.CODIGO = %d',
        [dtsqryREMESSA_TITULOS.DataSet.FieldByName('CODIGO').AsInteger]));
    finally
      dtsqryREMESSA_TITULOS.DataSet.Close;
      dtsqryREMESSA_TITULOS.DataSet.Open;
    end;
  end;
end;

procedure TfrmREMESSAcadastro.btnTITULOSlimparClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma limpeza de todos registros ?',
    'Confirmação!', MB_YESNO) = mrYes then
    LimpaTitulos;
end;

procedure TfrmREMESSAcadastro.dtsqryREMESSA_TITULOSDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(dtsqryREMESSA_TITULOS.DataSet) then
  begin
    btnTITULOSexcluir.Visible := not dtsqryREMESSA_TITULOS.DataSet.IsEmpty;
    btnTITULOSlimpar.Visible := not dtsqryREMESSA_TITULOS.DataSet.IsEmpty;
    btnConfirmar.Visible := not dtsqryREMESSA_TITULOS.DataSet.IsEmpty;
  end;
end;

procedure TfrmREMESSAcadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if not FGravouRemessa then
    LimpaTitulos;
end;


procedure TfrmREMESSAcadastro.FormShow(Sender: TObject);
begin
  inherited;
  FGravouRemessa := false;
end;

procedure TfrmREMESSAcadastro.SetFieldsRequireds(ADataSet: TDataSet);
begin
  // ADataSet.FieldByName('').Required := True;
end;

procedure TfrmREMESSAcadastro.LimpaTitulos;
begin

  begin
    try
      dtsqryREMESSA_TITULOS.DataSet.DisableControls;
      dtsqryREMESSA_TITULOS.DataSet.First;
      while not dtsqryREMESSA_TITULOS.DataSet.Eof do
      begin
        TFDQuery(dtsDefault.DataSet).Connection.ExecSQL
          (Format('UPDATE CRECEBER SET ID_CBR_REMESSA_UUID = Null, REMESSA_REENVIAR=''S'', REMESSA=''N'' WHERE CRECEBER.CODIGO = %d',
          [dtsqryREMESSA_TITULOS.DataSet.FieldByName('CODIGO').AsInteger]));
        dtsqryREMESSA_TITULOS.DataSet.Next;
      end;
    finally
      dtsqryREMESSA_TITULOS.DataSet.EnableControls;
      dtsqryREMESSA_TITULOS.DataSet.Close;
      dtsqryREMESSA_TITULOS.DataSet.Open;
    end;
  end;
end;

end.
