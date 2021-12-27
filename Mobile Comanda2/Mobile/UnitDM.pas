unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, REST.Types, REST.Client,
  REST.Authenticator.Basic, Data.Bind.Components, Data.Bind.ObjectScope,
  System.JSON, System.NetEncoding, System.IOUtils, FireDAC.Phys.SQLiteWrapper.Stat, DBAccess, Uni, MemDS, UniProvider,
  InterBaseUniProvider, FMX.Dialogs, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Comp.UI, FireDAC.Phys.IBDef, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  REST.Response.Adapter, RESTRequest4D.Request;

type
  Tdm = class(TDataModule)
    qry_config: TFDQuery;
    RESTClient: TRESTClient;
    RequestLogin: TRESTRequest;
    HTTPBasicAuthenticator: THTTPBasicAuthenticator;
    RequestListarComanda: TRESTRequest;
    RequestListarProduto: TRESTRequest;
    RequestListarCategoria: TRESTRequest;
    RequestAdicionarProdutoComanda: TRESTRequest;
    RequestListarProdutoComanda: TRESTRequest;
    RequestExcluirProdutoComanda: TRESTRequest;
    RequestEncerrarComanda: TRESTRequest;
    RequestOpcional: TRESTRequest;
    conn: TUniConnection;
    QryLogin: TUniQuery;
    connconf: TFDConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qryComanda: TUniQuery;
    qryProdutos: TUniQuery;
    qry_configUSUARIO: TStringField;
    qry_configSERVIDOR: TStringField;
    qry_configcaminho: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidaLogin(usuario: string; senha: string; out erro: string): boolean;
    function ListarComanda(out jsonArray: TJSONArray; out erro: string): boolean;
    function ListarProduto(id_categoria: integer; termo_busca: string; pagina: integer;
                           out jsonArray: TJSONArray; out erro: string): boolean;
    function ListarCategoria(out jsonArray: TJSONArray;
      out erro: string): boolean;
    function AdicionarProdutoComanda(id_comanda: string; id_produto,
      qtd: integer; vl_total: double;
      obs, obs_opcional: string; vl_opcional: double;
      out erro: string): boolean;
    function ListarProdutoComanda(id_comanda: string;
      out jsonArray: TJSONArray; out erro: string): boolean;
    function ExcluirProdutoCOmanda(id_comanda: string; id_consumo: integer;
      out erro: string): boolean;
    function EncerrarComanda(id_comanda: string; out erro: string): boolean;
    function ListarOpcional(id_produto: integer; out jsonArray: TJSONArray;
      out erro: string): boolean;
    function Crypt(Action, Src: String): String;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function Tdm.ValidaLogin(usuario: string; senha: string; out erro: string): boolean;
var
    json : string;
    jsonObj: TJsonObject;
begin
    erro := '';

    result := false;

    with RequestLogin do
    begin
        Params.Clear;
        AddParameter('nome', usuario, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('senha', senha, TRESTRequestParameterKind.pkGETorPOST);
        Execute;
    end;

    ShowMessage(RequestLogin.Response.JSONText);

    if RequestLogin.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao validar login: ' + dm.RequestLogin.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestLogin.Response.JSONValue.ToString;
        jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;



        if jsonObj.GetValue('retorno').Value = 'OK' then
            Result := true
        else
        begin
            Result := false;
            erro := jsonObj.GetValue('retorno').Value;
        end;
        jsonObj.DisposeOf;
    end;
end;

function Tdm.ListarComanda(out jsonArray: TJSONArray; out erro: string): boolean;
var
    json : string;
begin
    erro := '';

    try
        with RequestListarComanda do
        begin
            Params.Clear;
            Execute;
        end;
    except on ex:exception do
        begin
            Result := false;
            erro := 'Erro ao listar comandas: ' + ex.Message;
            exit;
        end;
    end;

    if RequestListarComanda.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao listar comandas: ' + dm.RequestLogin.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestListarComanda.Response.JSONValue.ToString;
        jsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;
        Result := true;
    end;
end;

function Tdm.ListarProduto(id_categoria: integer; termo_busca: string; pagina: integer;
                           out jsonArray: TJSONArray; out erro: string): boolean;
var
    json : string;
begin
    erro := '';

    try
        with RequestListarProduto do
        begin
            Params.Clear;
            AddParameter('id_categoria', id_categoria.ToString, TRESTRequestParameterKind.pkGETorPOST);
            AddParameter('termo_busca', termo_busca, TRESTRequestParameterKind.pkGETorPOST);
            AddParameter('pagina', pagina.ToString, TRESTRequestParameterKind.pkGETorPOST);
            Execute;
        end;
    except on ex:exception do
        begin
            Result := false;
            erro := 'Erro ao listar produto: ' + ex.Message;
            exit;
        end;
    end;

    if RequestListarProduto.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao listar produto: ' + RequestListarProduto.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestListarProduto.Response.JSONValue.ToString;
        jsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;
        Result := true;
    end;
end;

function Tdm.ListarCategoria(out jsonArray: TJSONArray; out erro: string): boolean;
var
    json : string;
begin
    erro := '';

    try
        with RequestListarCategoria do
        begin
            Params.Clear;
            Execute;
        end;
    except on ex:exception do
        begin
            Result := false;
            erro := 'Erro ao listar categorias: ' + ex.Message;
            exit;
        end;
    end;

    if RequestListarCategoria.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao listar categorias: ' + RequestListarCategoria.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestListarCategoria.Response.JSONValue.ToString;
        jsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;
        Result := true;
    end;
end;

function Tdm.AdicionarProdutoComanda(id_comanda: string; id_produto, qtd: integer; vl_total: double;
                                     obs, obs_opcional: string; vl_opcional: double;
                                     out erro: string): boolean;
var
    json : string;
    jsonObj: TJsonObject;
begin
    erro := '';

    with RequestAdicionarProdutoComanda do
    begin
        Params.Clear;
        AddParameter('id_comanda', id_comanda, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('id_produto', id_produto.ToString, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('qtd', qtd.ToString, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('vl_total', FormatFloat('0.00', vl_total).Replace(',', '').Replace('.', ''),
                                        TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('obs_opcional', obs_opcional, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('vl_opcional', FormatFloat('0.00', vl_opcional).Replace(',', '').Replace('.', ''),
                                        TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('obs', obs, TRESTRequestParameterKind.pkGETorPOST);
        Execute;
    end;

    if RequestAdicionarProdutoComanda.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao adicionar item: ' + RequestAdicionarProdutoComanda.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestAdicionarProdutoComanda.Response.JSONValue.ToString;
        jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

        if jsonObj.GetValue('retorno').Value = 'OK' then
            Result := true
        else
        begin
            Result := false;
            erro := jsonObj.GetValue('retorno').Value;
        end;

        jsonObj.DisposeOf;
    end;
end;

function Tdm.ListarProdutoComanda(id_comanda: string;
                                  out jsonArray: TJSONArray; out erro: string): boolean;
var
    json : string;
    jsonObj: TJsonObject;
begin
    erro := '';

    try
        with RequestListarProdutoComanda do
        begin
            Params.Clear;
            AddParameter('id_comanda', id_comanda, TRESTRequestParameterKind.pkGETorPOST);
            Execute;
        end;
    except on ex:exception do
        begin
            Result := false;
            erro := 'Erro ao listar produtos: ' + ex.Message;
            exit;
        end;
    end;

    if RequestListarProdutoComanda.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao listar produtos: ' + RequestListarProdutoComanda.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestListarProdutoComanda.Response.JSONValue.ToString;
        jsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;
        Result := true;
    end;
end;

function Tdm.ExcluirProdutoCOmanda(id_comanda: string; id_consumo: integer; out erro: string): boolean;
var
    json : string;
    jsonObj: TJsonObject;
begin
    erro := '';

    with RequestExcluirProdutoComanda do
    begin
        Params.Clear;
        AddParameter('id_comanda', id_comanda, TRESTRequestParameterKind.pkGETorPOST);
        AddParameter('id_consumo', id_consumo.ToString, TRESTRequestParameterKind.pkGETorPOST);
        Execute;
    end;

    if RequestExcluirProdutoComanda.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao excluir item: ' + RequestExcluirProdutoComanda.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestExcluirProdutoComanda.Response.JSONValue.ToString;
        jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

        if jsonObj.GetValue('retorno').Value = 'OK' then
            Result := true
        else
        begin
            Result := false;
            erro := jsonObj.GetValue('retorno').Value;
        end;

        jsonObj.DisposeOf;
    end;
end;

function Tdm.EncerrarComanda(id_comanda: string; out erro: string): boolean;
var
    json : string;
    jsonObj: TJsonObject;
begin
    erro := '';

    with RequestEncerrarComanda do
    begin
        Params.Clear;
        AddParameter('id_comanda', id_comanda, TRESTRequestParameterKind.pkGETorPOST);
        Execute;
    end;

    if RequestEncerrarComanda.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao encerrar comanda: ' + RequestEncerrarComanda.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestEncerrarComanda.Response.JSONValue.ToString;
        jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

        if jsonObj.GetValue('retorno').Value = 'OK' then
            Result := true
        else
        begin
            Result := false;
            erro := jsonObj.GetValue('retorno').Value;
        end;

        jsonObj.DisposeOf;
    end;
end;

function Tdm.Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key, KeyNew: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;

  Key := 'XNGREXCPAJHKQWERYTUIOP98756LKJHASFGMNBVCAXZ13450';

  KeyNew := 'PRODOXCPAJHKQWERYTUIOP98765LKJHASFGMNBVCAXZ01234';

  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 128;
  if (Action = UpperCase('C')) then
  begin
    // Randomize;
    OffSet := Range;
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      //Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:

end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
   connconf.Connected := false;

    with connconf do
    begin
        Params.Values['DriverID'] := 'SQLite';

        {$IFDEF MSWINDOWS}
          Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\banco.db';
        {$ELSE}
          Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'banco.db');
        {$ENDIF}

        Connected := true;


         try
            if Connected then begin
             qry_Config.Active := false;
             qry_Config.SQL.Clear;
             qry_Config.SQL.Add('SELECT * FROM TAB_USUARIO');
             qry_Config.Active := true;
             qry_Config.Open;

             // Configurar endereco IP do server...
             dm.RESTClient.BaseURL :=  qry_Config.FieldByName('SERVIDOR').AsString;
            end;

            except on e:exception do
             raise Exception.Create('Erro ao acessar banco de dados de login: ' + e.Message);
            end;
      end;
end;

function Tdm.ListarOpcional(id_produto: integer;
                           out jsonArray: TJSONArray; out erro: string): boolean;
var
    json : string;
begin
    erro := '';

    try
        with RequestOpcional do
        begin
            Params.Clear;
            AddParameter('id_produto', id_produto.ToString, TRESTRequestParameterKind.pkGETorPOST);
            Execute;
        end;
    except on ex:exception do
        begin
            Result := false;
            erro := 'Erro ao listar opcionais: ' + ex.Message;
            exit;
        end;
    end;

    if RequestOpcional.Response.StatusCode <> 200 then
    begin
        Result := false;
        erro := 'Erro ao listar opcionais: ' + RequestOpcional.Response.StatusCode.ToString;
    end
    else
    begin
        json := RequestOpcional.Response.JSONValue.ToString;
        jsonArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONArray;
        Result := true;
    end;
end;

end.
