unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, LockApplication, Vcl.ComCtrls, Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Buttons, Vcl.Bind.Navigator,
  Data.Bind.Grid, Vcl.Grids, Data.Bind.DBScope, System.UITypes, Data.DB,
  Vcl.DBCtrls, Vcl.DBGrids, Vcl.Menus, Vcl.Mask, DBSBtn, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Winapi.WinSock2, IdStack, Wininet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCheckBox, cxDBEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxSpinEdit, cxTextEdit, Vcl.ToolWin, Vcl.WinXCtrls, dxGDIPlusClasses, System.Actions,
  Vcl.ActnList, acPNG, uTInject,
  //############ ATENCAO AQUI ####################
  //units adicionais obrigatorias
   uTInject.ConfigCEF,             uTInject.Constant,      uTInject.JS,     uInjectDecryptFile,
   uTInject.Console,   uTInject.Diversos,   uTInject.AdjustNumber,  uTInject.Config, uTInject.Classes,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, IdBaseComponent, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient;

type
  TPrincipal = class(TForm)
    Pg: TPageControl;
    Licenças: TTabSheet;
    TabSheet2: TTabSheet;
    Configuracoes: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    OP: TRadioGroup;
    Edit3: TEdit;
    Button1: TButton;
    Edit4: TEdit;
    OP2: TRadioGroup;
    Label6: TLabel;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BindingsList1: TBindingsList;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    PopupMenu1: TPopupMenu;
    C1: TMenuItem;
    Comando11: TMenuItem;
    C2: TMenuItem;
    Button4: TButton;
    DBComboBox1: TDBComboBox;
    dbSBtnSave: TDBSpeedButton;
    dsconfig: TDataSource;
    tbconfig: TFDTable;
    tbconfigserver: TStringField;
    tbconfigdatabase: TStringField;
    tbconfiguser: TStringField;
    tbconfigpassword: TStringField;
    ConfigsConnection: TFDConnection;
    tbconfigcel: TStringField;
    tbconfigidioma: TStringField;
    dbSBtnSave1: TDBSpeedButton;
    E1: TMenuItem;
    E2: TMenuItem;
    N1: TMenuItem;
    E3: TMenuItem;
    N2: TMenuItem;
    E4: TMenuItem;
    StatusBar1: TStatusBar;
    PnCaption: TPanel;
    Image1: TImage;
    SearchBox1: TSearchBox;
    Panel1: TPanel;
    strRegistroAtual: TLabel;
    strTotalRegistros: TLabel;
    FDQuery1: TFDQuery;
    ActionList1: TActionList;
    actSair: TAction;
    Label29: TLabel;
    ComboBox1: TDBComboBox;
    Label30: TLabel;
    Panel2: TPanel;
    TInject1: TInject;
    Panel3: TPanel;
    Label31: TLabel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    chk_AutoResposta: TCheckBox;
    ComboBox2: TComboBox;
    icmpPing: TIdIcmpClient;
    MainMenu1: TMainMenu;
    C3: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    R1: TMenuItem;
    P1: TMenuItem;
    Produtos2: TMenuItem;
    GroupBox4: TGroupBox;
    cxDBTextEdit2: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label7: TLabel;
    Label10: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label19: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label20: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label25: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    Label21: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    Label22: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Label23: TLabel;
    Label24: TLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label15: TLabel;
    cxDBDateEdit3: TcxDBDateEdit;
    Label16: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label17: TLabel;
    cxDBDateEdit4: TcxDBDateEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    Label26: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBDateEdit1: TcxDBDateEdit;
    Label9: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label13: TLabel;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    cxDBTextEdit15: TDBComboBox;
    cxDBTextEdit16: TcxDBTextEdit;
    Label28: TLabel;
    C4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Edit5: TEdit;
    Button6: TButton;
    Button7: TButton;
    Label32: TLabel;
    tbconfigipserver: TStringField;
    tbconfiginiciarwhats: TStringField;
    tbconfigprotegercomsenha: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure OPExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure dbSBtnSaveClick(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure dbSBtnSave1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure tbconfigAfterPost(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure C1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure Comando11Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure E4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure Edt_LengDDIExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure ChecaProcessos;

    { Private declarations }
  public
   idioma: string;
    FIniciando: Boolean;
    FStatus: Boolean;
   procedure linguageminicializa;
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses unDados, unConexao, Ping2, unMensagem, unMensagemWhats, unCadRevendas,
  unCadClientes;


procedure TPrincipal.linguageminicializa;
begin
  if Dados.ConfigsTableidioma.text = 'English' then begin
   idioma := 'English';
  end;
  if Dados.ConfigsTableidioma.text = 'Spanish' then begin
   idioma := 'Spanish';
  end;
  if Dados.ConfigsTableidioma.text = 'Português' then begin
   idioma := 'Português';
  end;

  if idioma = 'Português' then begin
    dbSBtnSave.Caption := 'Salvar';
    label29.Caption := 'Gerenciamento de Licenças';
  end;
  if idioma = 'English' then begin
     dbSBtnSave.Caption := 'Post';
     label29.Caption := 'License Management';
  end;
  if idioma = 'Spanish' then begin
     dbSBtnSave.Caption := 'Grabar';
     label29.Caption := 'Gestión de licencias';
  end;


end;

procedure TPrincipal.N5Click(Sender: TObject);
begin
    frmCadRevendas := TfrmCadRevendas.Create(Self);
    frmCadRevendas.Showmodal;
end;

procedure TPrincipal.actSairExecute(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TPrincipal.Button1Click(Sender: TObject);
begin
   try
   case OP.ItemIndex of
      0: Edit4.Text := Dados.LockApplication1.Gera_Chave_Dias( StrToInt64( Edit2.Text ), StrToInt64( Edit1.Text ), StrToInt64( Edit3.Text ), Op2.ItemIndex + 1);
      1: Edit4.Text := Dados.LockApplication1.Gera_Chave_Data( StrToInt64( Edit2.Text ), StrToInt64( Edit1.Text ), Edit3.Text, Op2.ItemIndex + 1 );
   end;
   except
      raise Exception.Create('Erro ao gerar chave verifique dados informados!');
   end;
end;

procedure TPrincipal.Button2Click(Sender: TObject);
begin
 if Edit4.text <> '' then begin

  if not TInject1.Auth(false) then
  Begin
    TInject1.FormQrCodeType := TFormQrCodeType(1);
    TInject1.FormQrCodeStart;
  End;

  if not TInject1.FormQrCodeShowing then begin
     TInject1.FormQrCodeShowing := True;
  end;

  try
    if not Principal.TInject1.Auth then
       Exit
    else
     TInject1.send(Dados.uniLicencasTablecelular.Text+'@c.us', 'Seguem os dados da sua licença: '+#13);
     Sleep(2000);
     TInject1.send(Dados.uniLicencasTablecelular.Text+'@c.us', #13+'Chave: '+Edit4.text+#13+#13+#10);
     Sleep(1800);
     if OP.ItemIndex = 0 then begin
        TInject1.send(Dados.uniLicencasTablecelular.Text+'@c.us', 'Válida até: '+DateTimeToStr(now+strtoint(Edit3.text)));
     end;
     if OP.ItemIndex = 1 then begin
        TInject1.send(Dados.uniLicencasTablecelular.Text+'@c.us', 'Válida até: '+Edit3.text);
     end;

  finally
  end;

 end;


end;

procedure TPrincipal.Button4Click(Sender: TObject);
begin
    frmConexao := TfrmConexao.Create(Self);
    frmConexao.Showmodal;
end;

procedure TPrincipal.Button5Click(Sender: TObject);
begin
  if not TInject1.Auth(false) then
  Begin
    TInject1.FormQrCodeType := TFormQrCodeType(1);
    TInject1.FormQrCodeStart;
  End;

  if not TInject1.FormQrCodeShowing then
     TInject1.FormQrCodeShowing := True;

end;

procedure TPrincipal.C1Click(Sender: TObject);
begin
 //
 Pg.TabIndex := 1;
 Edit1.Text :=  Dados.uniLicencasTableidsistema.text;    // id sistema
 Edit2.Text :=  Dados.uniLicencasTableidinstalacao.text; // id instalação
end;

procedure TPrincipal.C2Click(Sender: TObject);
begin
 if Dados.zLicencasTable.Active then begin

   Dados.uniLicencasTable.Edit;
   Dados.uniLicencasTablecomando.text := 'ILEGAL';
   Dados.zLicencasTableexecutado.text := '0';
   Dados.uniLicencasTable.Post;
   //   Dados.zLicencasTable.ApplyUpdates;

 end;
end;

procedure TPrincipal.C4Click(Sender: TObject);
begin
    frmCadClientes := TfrmCadClientes.Create(Self);
    frmCadClientes.Showmodal;
end;

procedure TPrincipal.Comando11Click(Sender: TObject);
begin
 if Dados.zLicencasTable.Active then begin

   Dados.uniLicencasTable.Edit;
   Dados.zLicencasTablecomando.text := 'RENOVAR';
   Dados.zLicencasTableexecutado.text := '0';
   Dados.uniLicencasTable.Post;


 end;
end;

procedure TPrincipal.ComboBox1Change(Sender: TObject);
begin
 Dados.ConfigsTable.Edit;
 Dados.ConfigsTableidioma.Text := ComboBox1.Text;
 Dados.ConfigsTable.Post;
 Dados.ConfigsTable.ApplyUpdates;
 Dados.ConfigsTable.CommitUpdates;
 Dados.ConfigsTable.Refresh;
  if idioma = 'English' then begin
   dbSBtnSave.Caption := 'Post';
 end;
 if idioma = 'Spanish' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;
 if idioma = 'Português' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;
 DBComboBox1.Text := ComboBox1.Text;
 linguageminicializa;
end;

procedure TPrincipal.DBCheckBox1Click(Sender: TObject);
begin
 if idioma = 'English' then begin
   dbSBtnSave1.Caption := 'Post';
 end;
 if idioma = 'Spanish' then begin
   dbSBtnSave1.Caption := 'Salvar';
 end;
 if idioma = 'Português' then begin
   dbSBtnSave1.Caption := 'Salvar';
 end;
end;

procedure TPrincipal.DBCheckBox2Click(Sender: TObject);
begin
 if idioma = 'English' then begin
   dbSBtnSave.Caption := 'Post';
 end;
 if idioma = 'Spanish' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;
 if idioma = 'Português' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;

end;

procedure TPrincipal.DBComboBox1Change(Sender: TObject);
begin
 Dados.ConfigsTable.Edit;
 Dados.ConfigsTableidioma.Text := DBComboBox1.Text;
 Dados.ConfigsTable.Post;
 Dados.ConfigsTable.ApplyUpdates;
 Dados.ConfigsTable.CommitUpdates;
 Dados.ConfigsTable.Refresh;
 if idioma = 'English' then begin
   dbSBtnSave.Caption := 'Post';
 end;
 if idioma = 'Spanish' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;
 if idioma = 'Português' then begin
   dbSBtnSave.Caption := 'Salvar';
 end;
 ComboBox1.Text := DBComboBox1.Text;
 linguageminicializa;
end;

procedure TPrincipal.DBComboBox1Enter(Sender: TObject);
begin
  Dados.ConfigsTable.Edit;
end;

procedure TPrincipal.DBEdit1Change(Sender: TObject);
begin
   dbSBtnSave1.Caption := 'Salvar';
end;

procedure TPrincipal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
 Campo: TField;
begin
  Campo := Column.Field;

// Dados.LicencasTableAfterScroll(Dados.dsLicencasTable.DataSet);

  if Assigned(Campo) and SameText(Campo.FieldName, 'onoff') then
  begin
    if Campo.AsBoolean = true then
      DBGrid1.Canvas.Brush.Color := clLime
    else
      DBGrid1.Canvas.Brush.Color := clRed;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TPrincipal.dbSBtnSave1Click(Sender: TObject);
begin
   if tbconfig.State in [dsEdit, dsInsert] then begin
     tbconfig.Post;
     tbconfig.ApplyUpdates;
     tbconfig.CommitUpdates;
     dbSBtnSave1.Caption := 'Modificar';
   end;
end;

procedure TPrincipal.dbSBtnSaveClick(Sender: TObject);
begin
   if tbconfig.State in [dsEdit, dsInsert] then begin
     tbconfig.Post;
     tbconfig.ApplyUpdates;
     tbconfig.CommitUpdates;
     dbSBtnSave.Caption := 'Modificar';
   end;
end;

procedure TPrincipal.E1Click(Sender: TObject);
begin


 frmMensagemWhats := TfrmMensagemWhats.Create( nil );
 frmMensagemWhats.Showmodal;


end;

procedure TPrincipal.E2Click(Sender: TObject);
begin
 if Dados.uniLicencasTable.Active then begin

   Dados.uniLicencasTable.Edit;
   Dados.zLicencasTablecomando.text := 'KILL';
   Dados.zLicencasTableexecutado.text := '0';
   Dados.uniLicencasTable.Post;

 end;
end;

procedure TPrincipal.E4Click(Sender: TObject);
begin

 frmMensagem := TfrmMensagem.Create( nil );
 frmMensagem.Showmodal;



end;

procedure TPrincipal.Edt_LengDDIExit(Sender: TObject);
begin
  if FIniciando then
     Exit;

//  TInject1.Config.AutoDelete            := chk_apagarMsg.Checked;
  //TInject1.Config.AutoStart           := chk_AutoStart.Checked;

  TInject1.Config.ControlSendTimeSec    := StrToIntDef(LabeledEdit1.Text, 8);
  TInject1.Config.SecondsMonitor        := StrToIntDef(LabeledEdit2.Text, 3);


//  TInject1.Config.ShowRandom          := .Checked;
//  TInject1.Config.SyncContacts        := .Checked;

{  TInject1.AjustNumber.LengthDDI         := StrToIntDef(Edt_LengDDI.text , 2);
  TInject1.AjustNumber.LengthDDD         := StrToIntDef(Edt_LengDDD.text , 2);
  TInject1.AjustNumber.LengthPhone       := StrToIntDef(Edt_LengFone.text, 9);
  TInject1.AjustNumber.DDIDefault        := StrToIntDef(Edt_DDIPDR.text  , 55);  }
//  TInject1.AjustNumber.AllowOneDigitMore := CheckBox4.Checked;

 // ExecuteFilter;

  TInject1.LanguageInject                := TLanguageInject(ComboBox1.ItemIndex);
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
   Edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Label3.Caption := 'Digite os dias a vencer :';
   OP.ItemIndex := 0;

   ConfigsConnection.Params.Database := ExtractFilePath(Application.ExeName)+'gerenciador.db';
   ConfigsConnection.Connected := true;

   tbconfig.Active := true;

   Pg.ActivePageIndex := 0;


   linguageminicializa;

   StatusBar1.Panels.Items[0].Text := 'Servidor: '+Dados.uniLicencas.Server;
   StatusBar1.Panels.Items[1].Text := 'WhatsApp: Desconectado';



  if tbconfiginiciarwhats.Text = '1' then begin
    TInject1.Config.AutoStart           := true;
   if not TInject1.Auth(false) then
   begin
    TInject1.FormQrCodeType := TFormQrCodeType(1);
    TInject1.FormQrCodeStart;
    StatusBar1.Panels.Items[1].Text := 'WhatsApp: Conectado';
   end;

   if not TInject1.FormQrCodeShowing then begin
     TInject1.FormQrCodeShowing := True;

   end;

  end else if tbconfiginiciarwhats.Text = '0' then begin
    TInject1.Config.AutoStart           := false;
  end;



end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
 if Dados.uniLicencasTable.Active then begin

  strTotalRegistros.Caption :=  'Total de registros: '+ IntToStr(Dados.uniLicencasTable.RecordCount);
  strRegistroAtual.Caption :=  'Registro atual: '+ IntToStr(Dados.uniLicencasTable.RecNo);
 end;

end;

procedure TPrincipal.OPExit(Sender: TObject);
begin
   case OP.ItemIndex of
      0: Label3.Caption := 'Digite os dias a vencer :';
      1: Label3.Caption := 'Digite a data dd/mm/aa:';
   end;
end;

procedure TPrincipal.SearchBox1Change(Sender: TObject);
begin
 if not  Dados.uniLicencasTable.Locate('nome',SearchBox1.text,[loPartialKey, loCaseInsensitive]) then begin
     Dados.uniLicencasTable.Locate('email',SearchBox1.text,[loPartialKey, loCaseInsensitive])
 end;
end;

procedure TPrincipal.tbconfigAfterPost(DataSet: TDataSet);
begin
     dbSBtnSave.Caption := 'Modificar';
     dbSBtnSave1.Caption := 'Modificar';
end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
 ChecaProcessos;
end;

procedure TPrincipal.ChecaProcessos;
begin
  StatusBar1.Panels.Items[0].Text := 'Servidor: '+Dados.uniLicencas.Server;
  StatusBar1.Panels.Items[1].Text := 'WhatsApp: Desconectado';


  if tbconfiginiciarwhats.Text = '1' then begin
    TInject1.Config.AutoStart           := true;
   if not TInject1.Auth(false) then
   begin
    TInject1.FormQrCodeType := TFormQrCodeType(1);
    TInject1.FormQrCodeStart;
    StatusBar1.Panels.Items[1].Text := 'WhatsApp: Conectado';
   end;

   if not TInject1.FormQrCodeShowing then begin
     TInject1.FormQrCodeShowing := True;

   end;

  end else if tbconfiginiciarwhats.Text = '0' then begin
    TInject1.Config.AutoStart           := false;
  end;
end;

end.
