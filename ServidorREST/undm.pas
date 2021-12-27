unit undm;

interface

uses
  System.SysUtils, System.Classes;

type
  Tdm = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
