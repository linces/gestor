unit Samples.Services.User;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Types, REST.Client,
  REST.Response.Adapter, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TUserService = class(TDataModule)
    mtUsers: TFDMemTable;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTRequest1: TRESTRequest;
  public
    procedure GetUsersDefault;
    procedure GetUsersRESTRequest4Delphi;
  end;

implementation

{$R *.dfm}

uses RESTRequest4D.Request;

const
  BASE_URL = 'http://localhost:9000';

procedure TUserService.GetUsersDefault;
begin
  RESTClient1.BaseURL := BASE_URL;
  RESTRequest1.Resource := 'users';
  RESTResponseDataSetAdapter1.Response := RESTResponse1;
  RESTResponseDataSetAdapter1.Dataset := mtUsers;
  RESTRequest1.Method := rmGET;
  RESTRequest1.Execute;
end;

procedure TUserService.GetUsersRESTRequest4Delphi;
begin
  TRequest.New.BaseURL(BASE_URL)
    .Resource('users')
    .DataSetAdapter(mtUsers)
    .Get;
end;

end.
