unit uComanda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.ListBox, FMX.Edit, FMX.Layouts,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Objects, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDWConstsData, uRESTDWPoolerDB;

type
  TfrmComanda = class(TForm)
    TabControl1: TTabControl;
    TabLista: TTabItem;
    TabDados: TTabItem;
    ListBox3: TListBox;
    ListBoxItem4: TListBoxItem;
    edtNome: TEdit;
    ToolBar9: TToolBar;
    Label4: TLabel;
    Button1: TButton;
    Button6: TButton;
    Button3: TButton;
    Layout6: TLayout;
    ListViewComanda: TListView;
    Layout7: TLayout;
    Rectangle8: TRectangle;
    lblMesaCo: TLabel;
    lblDataHoraCo: TLabel;
    btnAddComanda: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    updComanda: TRESTDWClientSQL;
    qryComanda_pessoa: TRESTDWClientSQL;
    qryComanda_pessoaCODIGO: TIntegerField;
    qryComanda_pessoaFK_COMANDA: TIntegerField;
    qryComanda_pessoaNOME: TStringField;
    qryComanda_pessoaSITUACAO: TStringField;
    qryComanda_pessoaTOTAL: TFMTBCDField;
    qryComanda_pessoaTOTAL_RATEIO: TFMTBCDField;
    qryComanda_pessoaIMPRIMIU: TStringField;
    qryComanda_pessoaPDV: TStringField;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Button2: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnAddComandaClick(Sender: TObject);
    procedure ListViewComandaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure SetComanda;
    { Private declarations }
  public
    opp: string;
    { Public declarations }
  end;

var
  frmComanda: TfrmComanda;

implementation

{$R *.fmx}

uses uDados, UMenu;

procedure TfrmComanda.SetComanda;
var
  vCodigo: Integer;
begin
  if opp = 'Novo' then
    vCodigo := Dados.MaiorPessoa
  else
    vCodigo := qryComanda_pessoaCODIGO.Value;

  try
    updComanda.Close;
    updComanda.ParamByName('CODIGO').AsFloat := vCodigo;
    updComanda.ParamByName('FK_COMANDA').AsFloat :=
      Dados.qrycomanda_masterCODIGO.Value;
    updComanda.ParamByName('NOME').AsString := edtNome.Text;
    updComanda.ParamByName('PERCENTUAL').AsFloat := 100;
    updComanda.ParamByName('SITUACAO').Value := 'A';
    updComanda.ParamByName('TOTAL').AsFloat := 0;
    updComanda.ParamByName('TOTAL_RATEIO').AsFloat := 0;
    updComanda.ParamByName('IMPRIMIU').Value := 'N';
    updComanda.ParamByName('PDV').AsString := 'S';
    updComanda.ExecSQL;

    qryComanda_pessoa.Refresh;

  except
    on e: exception do
      raise exception.Create(e.Message);
  end;

end;

procedure TfrmComanda.btnAddComandaClick(Sender: TObject);
begin
  opp := 'Novo';
  TabControl1.ActiveTab := TabDados;
  edtNome.Text := '';
end;

procedure TfrmComanda.Button3Click(Sender: TObject);
begin
  SetComanda;
  TabControl1.ActiveTab := TabLista;
end;

procedure TfrmComanda.Button4Click(Sender: TObject);
begin
  frmMenu.btnAtualizaCo.OnClick(self);
  Close;
end;

procedure TfrmComanda.Button6Click(Sender: TObject);
begin
  TabControl1.ActiveTab := TabLista;
end;

procedure TfrmComanda.FormShow(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition(2);
  qryComanda_pessoa.Close;
  qryComanda_pessoa.Params[0].Value := Dados.qrycomanda_masterCODIGO.Value;
  qryComanda_pessoa.Open;
end;

procedure TfrmComanda.ListViewComandaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  opp := 'Alterar';
  edtNome.Text := qryComanda_pessoaNOME.Value;
  TabControl1.ActiveTab := TabDados;
end;

end.
