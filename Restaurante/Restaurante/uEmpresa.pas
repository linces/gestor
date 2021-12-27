unit uEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, JPeg,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, ACBrBase, ACBrEnterTab,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, Vcl.ExtDlgs, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF;

type
  TfrmEmpresa = class(TForm)
    ACBrEnterTab1: TACBrEnterTab;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel7: TPanel;
    Label8: TLabel;
    btnCancelar: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter9: TSplitter;
    btnSalvar: TLabel;
    OpenPicture: TOpenPictureDialog;
    frxPDFExport1: TfrxPDFExport;
    frxDBEmpresa: TfrxDBDataset;
    frxReport: TfrxReport;
    dsEmpresa: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label6: TLabel;
    cbCidade: TDBLookupComboboxEh;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    dsCidade: TDataSource;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryProdutosAfterPost(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure Gravar;
    procedure Cancelar;
    procedure Localiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmEmpresa.edtLocChange(Sender: TObject);
begin
  Localiza;
end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
begin
  TabSheet2.TabVisible := False;
  PageControl1.ActivePageIndex := 0;

  if dados.qryEmpresas.IsEmpty then
  begin
    dados.qryEmpresas.Insert;
    dados.qryEmpresasCODIGO.Value := 1;
  end;

  dados.qryCidade.close;
  dados.qryCidade.Open;

end;

procedure TfrmEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    Gravar;
  if Key = vk_f6 then
    Cancelar;
  exit;
end;

procedure TfrmEmpresa.Localiza;
begin
end;

procedure TfrmEmpresa.Gravar;
begin
  try

    if trim(dados.qryEmpresasRAZAO.Value) = '' then
      raise Exception.Create('Informe a Razão!');

    if trim(dados.qryEmpresasFANTASIA.Value) = '' then
      raise Exception.Create('Informe a Fantasia!');

    if trim(dados.qryEmpresasENDERECO.Value) = '' then
      raise Exception.Create('Informe o Endereço!');

    if trim(dados.qryEmpresasBAIRRO.Value) = '' then
      raise Exception.Create('Informe o Bairro!');

    if trim(dados.qryEmpresasCIDADE.Value) = '' then
      raise Exception.Create('Informe a Cidade!');

    if trim(dados.qryEmpresasUF.Value) = '' then
      raise Exception.Create('Informe o UF!');

    if (dados.qryEmpresas.State in dsEditModes) then
      dados.qryEmpresas.Post;

    dados.Conexao.CommitRetaining;
    PageControl1.ActivePageIndex := 0;
    close;
  except
    on e: Exception do
      raise Exception.Create(e.message);
  end;
end;

procedure TfrmEmpresa.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEmpresa.Cancelar;
begin
  if dados.qryEmpresas.State in dsEditModes then
    dados.qryEmpresas.Cancel;
  PageControl1.ActivePageIndex := 0;
  close;
end;

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmEmpresa.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEmpresa.btnSalvarClick(Sender: TObject);
begin
  Gravar;
end;

procedure TfrmEmpresa.qryProdutosAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

end.
