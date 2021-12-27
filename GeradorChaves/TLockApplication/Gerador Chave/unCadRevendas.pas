unit unCadRevendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, framBaseCadastro, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uEstSearchDialogIntl, uEstSearchDialogDefaults,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, System.Generics.Collections,
  Vcl.Buttons, DBSBtn, System.Actions, Vcl.ActnList, dxGDIPlusClasses,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client{ uDWConstsData, uRESTDWPoolerDB},
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.DBCtrls, {DWAbout,
  uDWMassiveBuffer,}scControls, scDBControls, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, acPNG, Vcl.Mask, System.AnsiStrings, ACBrBase, ACBrSocket,
  cxCurrencyEdit, System.ImageList, Vcl.ImgList, cxImageList,
  FireDAC.Stan.Async, FireDAC.DApt, ACBrIBGE, ACBrCEP, MemDS, DBAccess, Uni;

type
  TfrmCadRevendas = class(TForm)
    PC: TPageControl;
    tabLista: TTabSheet;
    tbQuery: TTabSheet;
    DBGrid1: TDBGrid;
    PnCaption: TPanel;
    Image1: TImage;
    Label1: TLabel;
    SearchBox1: TSearchBox;
    Panel1: TPanel;
    strRegistroAtual: TLabel;
    strTotalRegistros: TLabel;
    PnTools: TPanel;
    Acoes: TActionList;
    Ac_Incluir: TAction;
    Ac_Editar: TAction;
    Ac_Visualizar: TAction;
    Ac_Imprimir: TAction;
    Ac_Excluir: TAction;
    Ac_Salvar: TAction;
    Ac_Anterior: TAction;
    Ac_Primeiro: TAction;
    Action4: TAction;
    Action5: TAction;
    btnAnterior: TDBSpeedButton;
    btnDeletar: TDBSpeedButton;
    btnEditar: TDBSpeedButton;
    btnGravar: TDBSpeedButton;
    btnIInserir: TDBSpeedButton;
    btnPrimeiro: TDBSpeedButton;
    btnProximo: TDBSpeedButton;
    btnUltimo: TDBSpeedButton;
    dsCadastro: TDataSource;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    StBrInfo: TStatusBar;
    actsair: TAction;
    dbSBtnCancel: TDBSpeedButton;
    Ac_Cancelar: TAction;
    Label2: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label9: TLabel;
    edtNome: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    edtpercentualcomissao: TcxDBTextEdit;
    iButtonsCadastro: TcxImageList;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    edtCep: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    Label14: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label16: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label17: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    ACBrCEP1: TACBrCEP;
    ACBrIBGE1: TACBrIBGE;
    Label15: TLabel;
    edtDataCadastro: TcxDBDateEdit;
    Label5: TLabel;
    edtEndereco: TcxDBTextEdit;
    Label7: TLabel;
    edtBairro: TcxDBTextEdit;
    Label8: TLabel;
    edtCidade: TcxDBTextEdit;
    Label10: TLabel;
    edtUF: TcxDBTextEdit;
    Label11: TLabel;
    edtNumero: TcxDBTextEdit;
    QryCadastro: TUniQuery;
    QryCadastroid: TIntegerField;
    QryCadastrodatacadastro: TDateTimeField;
    QryCadastroativo: TStringField;
    QryCadastrotipodocumento: TStringField;
    QryCadastrocpfcnpj: TStringField;
    QryCadastronome: TStringField;
    QryCadastrocep: TStringField;
    QryCadastroendereco: TStringField;
    QryCadastrobairro: TStringField;
    QryCadastrocidade: TStringField;
    QryCadastroestado: TStringField;
    QryCadastronumero: TStringField;
    QryCadastrocomissao: TFloatField;
    QryCadastroemail: TStringField;
    QryCadastrosite: TStringField;
    QryCadastroresponsavel: TStringField;
    QryCadastrotelefone: TStringField;
    QryMax: TUniQuery;
    QryBusca: TUniQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure actsairExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_EditarExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure Ac_AnteriorExecute(Sender: TObject);
    procedure Ac_PrimeiroExecute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure qryCadastroAfterScroll(DataSet: TDataSet);
    procedure SearchBox1Change(Sender: TObject);
    procedure edtpercentualcomissaoExit(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
  private
    procedure AplicaUpdate(aDataset : TDataSet);

  protected
     //Objeto utlizado na rotina de filtro
    FieldFilter: TField;

    //função que retorno o campo chave do DataSet CRUD
    function GetKeyFiled: String;virtual;abstract;

    //Função que retorna o nome do campo chave para filtrar o registro no DataSet de CRUD
    function GetQueryKeyFiled: String;virtual;abstract;

    //procedure que carrega a permissao do usuario logado para o forlumário em questao
    procedure LoadPermissao;virtual;

    //procedure que carrega as restricoes dos campos do formulario em questao para o usuario logado
    procedure LoadRestricao;virtual;

  public
    codigo : integer;

  end;

var
  frmCadRevendas: TfrmCadRevendas;

implementation

{$R *.dfm}

uses {AppConsts, AppLogin, AppUtils,} unDados, unPrincipal, unConexao;


procedure TfrmCadRevendas.Ac_PrimeiroExecute(Sender: TObject);
begin

   dsCadastro.DataSet.First;
end;

procedure TfrmCadRevendas.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
 i: integer;
begin
  if ACBrCEP1.Enderecos.Count < 1 then
    exit
  else
  begin

    For i := 0 to ACBrCEP1.Enderecos.Count - 1 do
    begin
      with ACBrCEP1.Enderecos[i] do
      begin
         dsCadastro.DataSet.FieldByName('cep').AsString := CEP;
        dsCadastro.DataSet.FieldByName('cidade').AsString := Municipio;
        dsCadastro.DataSet.FieldByName('bairro').AsString := Bairro;
       dsCadastro.DataSet.FieldByName('estado').AsString := UF;
   //     edtComplemento.Text := Complemento;
//        ShowMessage(Logradouro);
      dsCadastro.DataSet.FieldByName('endereco').AsString := Logradouro;
    //    edtEndereco.Text := Logradouro;
      end;
    end;
  end;

end;

procedure TfrmCadRevendas.Action4Execute(Sender: TObject);
begin

   dsCadastro.DataSet.Next;
end;

procedure TfrmCadRevendas.Action5Execute(Sender: TObject);
begin

   dsCadastro.DataSet.Last;
end;

procedure TfrmCadRevendas.actsairExecute(Sender: TObject);
begin
 Close;
end;

procedure TfrmCadRevendas.Ac_AnteriorExecute(Sender: TObject);
begin
   dsCadastro.DataSet.Prior;
end;

procedure TfrmCadRevendas.Ac_CancelarExecute(Sender: TObject);
begin
 dsCadastro.DataSet.Cancel;
end;

procedure TfrmCadRevendas.Ac_EditarExecute(Sender: TObject);
begin
   dsCadastro.DataSet.Open;
   PC.ActivePageIndex := 1;
   dsCadastro.DataSet.Edit;
end;

procedure TfrmCadRevendas.Ac_ExcluirExecute(Sender: TObject);
var
 vResultError : Boolean;
 vError : String;
begin

 if application.messagebox('Tem certeza que você deseja excluir o registro?',
    'Confirmar', mb_yesno + mb_iconquestion) = 6 Then
  begin

    dsCadastro.DataSet.Delete;


  end;

end;

procedure TfrmCadRevendas.Ac_IncluirExecute(Sender: TObject);
begin

   PC.ActivePageIndex := 1;
   dsCadastro.DataSet.Open;
   dsCadastro.DataSet.Insert;
   edtDataCadastro.Text := DateTimeToStr(now);
   dsCadastro.DataSet.FieldByName('ativo').AsString := 't';
   DBComboBox1.Setfocus;
end;


procedure TfrmCadRevendas.Ac_SalvarExecute(Sender: TObject);
begin
    dsCadastro.DataSet.Post;
end;


procedure TfrmCadRevendas.AplicaUpdate(aDataset: TDataSet);
begin

end;

procedure TfrmCadRevendas.edtCepExit(Sender: TObject);
begin
  try
    ACBrCEP1.BuscarPorCEP(edtCep.Text);
    edtNumero.SetFocus;
  except
    On E: Exception do
    begin
      edtEndereco.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmCadRevendas.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try

    if (Key = VK_RETURN) or (Key = VK_TAB) then
    begin
      ACBrCEP1.BuscarPorCEP(edtCep.Text);
    end;
  except
    On E: Exception do
    begin
      exit;
    end;
  end;
end;

procedure TfrmCadRevendas.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (Word(Key) <> vk_back)) then
    Key := #0;
end;



procedure TfrmCadRevendas.edtpercentualcomissaoExit(Sender: TObject);
var
 valorcomissao, valor, percentual : Real;
begin


end;

procedure TfrmCadRevendas.DBGrid1DblClick(Sender: TObject);
begin
 PC.ActivePageIndex := 1;
end;

procedure TfrmCadRevendas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if dsCadastro.DataSet.State in [dsEdit, dsInsert] then begin
 if application.messagebox('Tem certeza que você deseja fechar o cadastro?',
    'Confirmar', mb_yesno + mb_iconquestion) = 6 Then
  begin
    CanClose := True;
  end
  else
  begin
    CanClose := false;
  end;
end;
end;

procedure TfrmCadRevendas.FormCreate(Sender: TObject);
begin
 dsCadastro.DataSet.Open;
end;

procedure TfrmCadRevendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      Close;
    VK_RETURN:
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;


procedure TfrmCadRevendas.FormShow(Sender: TObject);
begin

  PC.ActivePageIndex := 0;
  If  dsCadastro.DataSet.Active Then
  strTotalRegistros.Caption :=  'Total de registros: '+ IntToStr(dsCadastro.DataSet.RecordCount);
  strRegistroAtual.Caption :=  'Registro atual: '+ IntToStr(dsCadastro.DataSet.RecNo);

end;

procedure TfrmCadRevendas.LoadPermissao;
begin

end;

procedure TfrmCadRevendas.LoadRestricao;
begin

end;




procedure TfrmCadRevendas.qryCadastroAfterScroll(DataSet: TDataSet);
begin

  strTotalRegistros.Caption :=  'Total de registros: '+ IntToStr(dsCadastro.DataSet.RecordCount);
  strRegistroAtual.Caption :=  'Registro atual: '+ IntToStr(dsCadastro.DataSet.RecNo);


end;

procedure TfrmCadRevendas.SearchBox1Change(Sender: TObject);
begin

 if not   QryCadastro.Locate('nome',SearchBox1.text,[loPartialKey, loCaseInsensitive]) then begin
     QryCadastro.Locate('telefone',SearchBox1.text,[loPartialKey, loCaseInsensitive])
 end;

end;

end.
