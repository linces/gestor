unit Reservas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation, FMX.Objects,
  FMX.Layouts, FMX.DateTimeCtrls;

type
  TFrmReservas = class(TForm)
    LBackground: TLayout;
    ImgBack: TImage;
    LConteudo: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button1: TButton;
    Button2: TButton;
    LAreaGrid: TLayout;
    lista: TListView;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    LTotal: TLayout;
    Label3: TLabel;
    lblTotal: TLabel;
    data: TDateEdit;
    procedure FormActivate(Sender: TObject);
    procedure dataChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure totalizar;
    procedure listar;
  public
    { Public declarations }
  end;

var
  FrmReservas: TFrmReservas;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses Modulo;

{ TFrmReservas }

procedure TFrmReservas.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmReservas.dataChange(Sender: TObject);
begin
  listar;
end;

procedure TFrmReservas.FormActivate(Sender: TObject);
begin
  data.Date := Date;
  listar;
end;

procedure TFrmReservas.listar;
var
  item: TListViewItem;

begin
  dm.con.Connected := true;
  dm.queryReservasCOn.Active := true;

  dm.queryReservasCOn.Close;
  dm.queryReservasCOn.SQL.Clear;
  dm.queryReservasCOn.SQL.Add
    ('select * from reservas where data = :data and status = :status');
  dm.queryReservasCOn.ParamByName('data').AsString :=
    FormatDateTime('yyyy/mm/dd', data.Date);
  dm.queryReservasCOn.ParamByName('status').AsString := 'Agendada';
  dm.queryReservasCOn.Open;
  dm.queryReservasCOn.First;

  lblTotal.Text := dm.queryReservasCOn.RecordCount.ToString;

  lista.Items.Clear;
  lista.BeginUpdate;

  while not dm.queryReservasCOn.EoF do
  begin
    item := lista.Items.Add;
    item.Detail := dm.queryReservasCOn.FieldByName('cliente').AsString;
    item.Text := 'Mesa ' + dm.queryReservasCOn.FieldByName('mesa').AsString;
    dm.queryReservasCOn.Next;
  end;

  lista.EndUpdate;

end;

procedure TFrmReservas.totalizar;
begin

end;

end.
