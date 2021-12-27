unit uSupervisor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DBGridEh,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab;

type
  TFrmSupervisor = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbEmpresa: TDBLookupComboboxEh;
    qrySupervisor: TFDQuery;
    dsSupervisor: TDataSource;
    qrySupervisorCODIGO: TSmallintField;
    qrySupervisorLOGIN: TStringField;
    qrySupervisorSENHA: TStringField;
    qrySupervisorHIERARQUIA: TSmallintField;
    qrySupervisorECAIXA: TStringField;
    qrySupervisorSUPERVISOR: TStringField;
    qrySupervisorATIVO: TStringField;
    ACBrEnterTab1: TACBrEnterTab;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbEmpresaEnter(Sender: TObject);
    procedure cbEmpresaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSupervisor: TFrmSupervisor;

implementation

{$R *.dfm}

uses Udados;

procedure TFrmSupervisor.BitBtn1Click(Sender: TObject);
begin
  if cbEmpresa.KeyValue = null then
  begin
    ShowMessage('Selecione Usuário');
    exit;
  end;

  if qrySupervisor.Locate('SENHA', Dados.Crypt('C',Edit2.Text)) then begin
    Dados.vAutorizar := True;
    close;
  end
  else
  begin
    ShowMessage('Senha inválida!');
    exit;
  end;

end;

procedure TFrmSupervisor.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TFrmSupervisor.cbEmpresaEnter(Sender: TObject);
begin
// ACBrEnterTab1.EnterAsTab := false;
end;

procedure TFrmSupervisor.cbEmpresaExit(Sender: TObject);
begin
// ACBrEnterTab1.EnterAsTab := true;
end;

procedure TFrmSupervisor.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self; dados.GetComponentes;
end;

procedure TFrmSupervisor.FormCreate(Sender: TObject);
begin
  qrySupervisor.Close;
  qrySupervisor.Open;
end;

end.
