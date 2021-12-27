unit uRotinasComuns;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.JSon;

type
  TPessoa = Record
    razao: String;
    fantasia: String;
    logradouro: String;
    numero: String;
    bairro: string;
    municipio: string;
    uf: string;
    cep: string;
    email: string;
    complemento: string;
  public
    procedure Clear;
  End;

type
  TDMRotinas = class(TDataModule)
    RESTResponseCNPJ: TRESTResponse;
    RESTRequestCNPJ: TRESTRequest;
    RESTClientCNPJ: TRESTClient;
    RESTResponseDataCNPJ: TRESTResponseDataSetAdapter;
  private
    { Private declarations }
  public
    Pessoa: TPessoa;
    { Public declarations }
    procedure BuscaCNPJ(CNPJ: String);
  end;

var
  DMRotinas: TDMRotinas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDMRotinas.BuscaCNPJ(CNPJ: String);
var
  jsonObject: TJsonObject;
begin
  RESTRequestCNPJ.Resource := CNPJ;
  RESTRequestCNPJ.Execute;
  jsonObject := TJsonObject.ParseJSONValue(RESTResponseCNPJ.Content)
    as TJsonObject;
  Pessoa.razao := jsonObject.GetValue('nome').Value;
  Pessoa.fantasia := jsonObject.GetValue('fantasia').Value;
  Pessoa.logradouro := jsonObject.GetValue('logradouro').Value;
  Pessoa.numero := jsonObject.GetValue('numero').Value;
  Pessoa.bairro := jsonObject.GetValue('bairro').Value;
  Pessoa.municipio := jsonObject.GetValue('municipio').Value;
  Pessoa.uf := jsonObject.GetValue('uf').Value;
  Pessoa.cep := jsonObject.GetValue('cep').Value;
  Pessoa.email := jsonObject.GetValue('email').Value;
  Pessoa.complemento := jsonObject.GetValue('complemento').Value;
end;

procedure TPessoa.Clear;
begin
  razao := '';
  fantasia := '';
  logradouro := '';
  numero := '';
  bairro := '';
  municipio := '';
  uf := '';
  cep := '';
  email := '';
  complemento := '';
end;

end.
