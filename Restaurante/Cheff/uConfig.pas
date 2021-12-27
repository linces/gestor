unit uConfig;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Edit, FMX.Layouts, FMX.TabControl;

type
  TfrmConfig = class(TForm)
    TabControl1: TTabControl;
    tabIP: TTabItem;
    ListBox3: TListBox;
    ListBoxItem4: TListBoxItem;
    edtIP: TEdit;
    ListBoxItem24: TListBoxItem;
    edtUsuario: TEdit;
    ListBoxItem3: TListBoxItem;
    edtSenha: TEdit;
    ListBoxItem23: TListBoxItem;
    edtConfirma: TEdit;
    ToolBar9: TToolBar;
    Label4: TLabel;
    Button1: TButton;
    btnFechar: TButton;
    btnSalvar: TButton;
    btnTestar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
  private
    procedure setIP;
    procedure GetIP;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.fmx}

uses uDados;

procedure TfrmConfig.setIP;
begin
  if Dados.qryConfigura.IsEmpty then
    Dados.qryConfigura.Insert
  else
    Dados.qryConfigura.Edit;
  Dados.qryConfiguraip.Value := edtIP.Text;
  Dados.qryConfigurausuario.Value := edtUsuario.Text;
  Dados.qryConfigurasenha.Value := edtSenha.Text;
  Dados.qryConfigura.Post;
  Dados.conexao.CommitRetaining;
end;

procedure TfrmConfig.GetIP;
begin
  edtUsuario.Text := Dados.qryConfigurausuario.Text;
  edtSenha.Text := Dados.qryConfigurasenha.Text;
  edtIP.Text := Dados.qryConfiguraip.Text;
end;

procedure TfrmConfig.btnSalvarClick(Sender: TObject);
begin
  setIP;
  close;
end;

procedure TfrmConfig.btnTestarClick(Sender: TObject);
begin
  try
    Dados.RDWDataBase.PoolerService := edtIP.Text;
    Dados.RDWDataBase.close;
    Dados.RDWDataBase.Open;
    Dados.qryComanda_pessoa.close;
    Dados.qryComanda_pessoa.Open;

    ShowMessage('Conexao realizada com sucesso!');
  except
    on e: exception do
      raise exception.Create(e.Message);
  end;
end;

procedure TfrmConfig.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition(2);
  if not Dados.qryConfigura.Active then
    Dados.qryConfigura.Open;
  GetIP;
end;

end.
