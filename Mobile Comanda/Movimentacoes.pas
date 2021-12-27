unit Movimentacoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.ListView, FMX.DateTimeCtrls, FMX.Controls.Presentation,
  FMX.Objects, FMX.Layouts;

type
  TFrmMov = class(TForm)
    LBackground: TLayout;
    ImgBack: TImage;
    LConteudo: TLayout;
    LTopo: TLayout;
    imgBackTopo: TImage;
    Button1: TButton;
    Button2: TButton;
    data: TDateEdit;
    LAreaGrid: TLayout;
    lista: TListView;
    LRodapeForm: TLayout;
    imgBackRodape: TImage;
    LEntradaseSaidas: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    lblEntradas: TLabel;
    lblSaidas: TLabel;
    LTotal: TLayout;
    Label3: TLabel;
    lblTotal: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dataChange(Sender: TObject);
  private
    { Private declarations }
    procedure listar;
    procedure totalizarEntradas;
    procedure totalizarSaidas;
    procedure totalizar;
  public
    { Public declarations }
  end;

var
  FrmMov: TFrmMov;
  totalEntradas: real;
  totalSaidas: real;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses Modulo;

procedure TFrmMov.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMov.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMov.dataChange(Sender: TObject);
begin
  listar;
end;

procedure TFrmMov.FormActivate(Sender: TObject);
begin
  data.Date := Date;
  listar;
end;

procedure TFrmMov.listar;
var
  item: TListViewItem;

begin
  dm.con.Connected := true;
  dm.queryMovCOn.Active := true;

  dm.queryMovCOn.Close;
  dm.queryMovCOn.SQL.Clear;
  dm.queryMovCOn.SQL.Add('select * from movimentacoes where data = :data');
  dm.queryMovCOn.ParamByName('data').AsString := FormatDateTime('yyyy/mm/dd',
    data.Date);

  dm.queryMovCOn.Open;
  dm.queryMovCOn.First;

  lista.Items.Clear;
  lista.BeginUpdate;

  while not dm.queryMovCOn.EoF do
  begin
    item := lista.Items.Add;

    if dm.queryMovCOn.FieldByName('tipo').AsString = 'Entrada' then
    begin
      item.Objects.textObject.TextColor := $FF13AA21;
    end
    else
    begin
      item.Objects.textObject.TextColor := $FDD13A46;
    end;

    item.Detail := FormatFloat('R$ ###,##0.00',
      dm.queryMovCOn.FieldByName('valor').Value) + ' - ' +
      dm.queryMovCOn.FieldByName('tipo').AsString;
    item.Text := dm.queryMovCOn.FieldByName('movimento').AsString;
    dm.queryMovCOn.Next;
  end;

  lista.EndUpdate;
  totalizarEntradas;
  totalizarSaidas;
  totalizar;

end;

procedure TFrmMov.totalizar;
var
  vlrTot: real;
begin

  vlrTot := totalEntradas - totalSaidas;
  if vlrTot >= 0 then
  begin
    lblTotal.StyledSettings := lblTotal.StyledSettings -
      [TStyledSetting.ssFontColor];
    lblTotal.FontColor := $FF12710A;
  end
  else
  begin
    lblTotal.StyledSettings := lblTotal.StyledSettings -
      [TStyledSetting.ssFontColor];
    lblTotal.FontColor := $FFA60C0C;
  end;

  lblTotal.Text := FormatFloat('R$ #,,,,0.00', vlrTot);

end;

procedure TFrmMov.totalizarEntradas;
var
  vlrTot: real;
begin
  dm.con.Connected := true;
  dm.queryMovCOn.Close;
  dm.queryMovCOn.SQL.Clear;
  dm.queryMovCOn.SQL.Add
    ('SELECT sum(valor) as total FROM movimentacoes where data = :data and tipo = :tipo order by data asc');

  dm.queryMovCOn.ParamByName('data').Value := FormatDateTime('yyyy/mm/dd',
    data.Date);
  dm.queryMovCOn.ParamByName('tipo').Value := 'Entrada';
  dm.queryMovCOn.Prepare;
  dm.queryMovCOn.Open;

  vlrTot := dm.queryMovCOn.FieldByName('total').AsFloat;
  lblEntradas.Text := FormatFloat('R$ #,,,,0.00', vlrTot);
  totalEntradas := vlrTot;

end;

procedure TFrmMov.totalizarSaidas;
var
  vlrTot: real;
begin
  dm.con.Connected := true;
  dm.queryMovCOn.Close;
  dm.queryMovCOn.SQL.Clear;
  dm.queryMovCOn.SQL.Add
    ('SELECT sum(valor) as total FROM movimentacoes where data = :data and tipo = :tipo order by data asc');

  dm.queryMovCOn.ParamByName('data').Value := FormatDateTime('yyyy/mm/dd',
    data.Date);
  dm.queryMovCOn.ParamByName('tipo').Value := 'Saída';
  dm.queryMovCOn.Prepare;
  dm.queryMovCOn.Open;

  vlrTot := dm.queryMovCOn.FieldByName('total').AsFloat;
  lblSaidas.Text := FormatFloat('R$ #,,,,0.00', vlrTot);
  totalSaidas := vlrTot;

end;

end.
