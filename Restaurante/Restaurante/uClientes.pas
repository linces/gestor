unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.DB, JvComponentBase, JvEnterTab;

type
  TfrmClientes = class(TForm)
    Panel5: TPanel;
    Label11: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    DBGridEh1: TDBGridEh;
    Panel7: TPanel;
    Label8: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Label9: TLabel;
    dsPessoa: TDataSource;
    dsMesa: TDataSource;
    Label1: TLabel;
    dsComanda_Master: TDataSource;
    btnFecharConta: TLabel;
    pnTotal: TPanel;
    DBText1: TDBText;
    DBText4: TDBText;
    Label3: TLabel;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure Label9Click(Sender: TObject);
    procedure btnFecharContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses uDados, uMenu;

procedure TfrmClientes.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmClientes.btnFecharContaClick(Sender: TObject);
begin
  if dados.qryComandas_masterTOTAL.AsFloat <> dados.qryComanda_PessoaTRATEIO.Value
  then
    raise Exception.Create('Total pago diferente do total de consumo da mesa!');

  dados.RatearComanda(dados.qryComandas_masterCODIGO.Value);
  frmmenu.FecharVenda;

  close;
end;

procedure TfrmClientes.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBGridEh1.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dados.qryComanda_Pessoa.State in dsEditModes then
    dados.qryComanda_Pessoa.Post;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F10 then
  begin
    btnFecharContaClick(self);
  end;

  if Key = VK_F12 then
    close;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  dados.qryComanda_Pessoa.close;
  dados.qryComanda_Pessoa.Params[0].Value :=
    dados.qryComandas_masterCODIGO.Value;
  dados.qryComanda_Pessoa.Open;
end;

procedure TfrmClientes.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmClientes.Label9Click(Sender: TObject);
begin
  close;
end;

end.
