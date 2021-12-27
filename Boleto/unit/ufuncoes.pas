unit ufuncoes;

interface

uses winsock, SysUtils, Windows, FireDAC.Comp.Client, FOrms, DB,
  Variants, System.Win.ComObj, Dialogs, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Option, FireDAC.Stan.Intf, Winapi.ShellAPI;

type
  TCPUID = array[1..4] of Longint;
  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

type
  TAcaoQuery = (crExecutar, crAbrir);
  TWordReplaceFlags = set of (wrfReplaceAll, wrfMatchCase, wrfMatchWildcards);
  TConsisteInscricaoEstadual = function(const Insc, UF: AnsiString): Integer; stdcall;

  function GetIPLocalHost: string;
  function GetNomeLocalHost: string;
  procedure AtualizarTabela(ATabela: TFDQuery; AKeyField:string = '';AKeyData:String = '');
  function DataToSQL(fData:TDateTime):String;
  function ToStr(aValor: Variant): string; overload;
  function ToStr(aFormato: String; aValor: TDatetime): String; overload;
  function ToStrDef(aValor: Variant; aDef: string): string;
  function ToDate(aValor: Variant): TDateTime;
  function ToCurr(aValor: Variant): Currency;
  function ToFloat(aValor: Variant): Extended;
  function ToInt(aValor: Variant): Integer;
  function ToIntDef(aValor: Variant; aDef: Integer): Integer;
  function FloatToSQL(aValor: Extended): string;
  function DataHoraToSQL(aDataHora: TDateTime): string;
  function PreencherDir(aString: string; aCaracter: Char; aTamanho: integer): string;
  function RemoveChar(const Texto: string; strChar: string): string;
  function FormatarCEP(ACEP: string): string;
  function FormatarCPF(ACPF: string): string;
  function FormatarCNPJ(ACNPJ: string): string;
  function FormatarCNPJCPF(Numero: string): string;
  function FormatarFone(ATexto:String):String;
  function FormatarNCM(const ACodigoNCM: String): String;
  function FormatarCEST(const ACodigoCEST: String): String;
  function FormatarTCCC(ATexto:String):String;
  function FormatarCNAE(ACNAE: string): string;
  function FormatarInscEstadual( Inscricao, Estado : String ) : String;
  procedure VerificarCamposObrigatorios(fDataSet:TDataSet);
  function ValidarInscEstadual(AInscricao, ATipo: AnsiString): Boolean;
  function MascaraInscEstadual(AUF: string): string;
  function ValorInRange(const AValor: Variant; const ARange: array of Variant): Boolean;
  function ArrayOfByteToStr(const AArray: array of byte): String;

implementation

uses
  uclassLOG, ACBrUtil, JPEG;

function ArrayOfByteToStr(const AArray: array of byte): String;
var
  I: Integer;
begin
  Result := '';
  for I := Low(AArray) to High(AArray) do
    Result := Result + chr(AArray[I])
end;

function ValorInRange(const AValor: Variant; const ARange: array of Variant): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(ARange) to High(ARange) do
  begin
    if ARange[I] = AValor then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function FormatarCNAE(ACNAE: string): string;
Begin
  ACNAE := ACBrUtil.OnlyNumber(ACNAE);

  insert('-',ACNAE,5);
  insert('/',ACNAE,7);

  Result := ACNAE;
end;

function MascaraInscEstadual(aUF: string): string;
begin
  Result := '';

  if aUF = 'AC' then
    Result := '99.999.999/999-99;0; '
  else if aUF = 'AL' then
    Result := '999999999;0; '
  else if aUF = 'AP' then
    Result := '999999999;0; '
  else if aUF = 'AM' then
    Result := '99.999.999-9;0; '
  else if aUF = 'BA' then
    Result := '999999-99;0; '
  else if aUF = 'CE' then
    Result := '99999999-9;0; '
  else if aUF = 'DF' then
    Result := '99999999999-99;0; '
  else if aUF = 'ES' then
    Result := '999999999;0; '
  else if aUF = 'GO' then
    Result := '99.999.999-9;0; '
  else if aUF = 'MA' then
    Result := '999999999;0; '
  else if aUF = 'MT' then
    Result := '9999999999-9;0; '
  else if aUF = 'MS' then
    Result := '999999999;0; '
  else if aUF = 'MG' then
    Result := '999.999.999/9999;0; '
  else if aUF = 'PA' then
    Result := '99-999999-9;0; '
  else if aUF = 'PB' then
    Result := '99999999-9;0; '
  else if aUF = 'PR' then
    Result := '99999999-99;0; '
  else if aUF = 'PE' then
    Result := '99.9.999.9999999-9;0; '
  else if aUF = 'PI' then
    Result := '999999999;0; '
  else if aUF = 'RJ' then
    Result := '99.999.99-9;0; '
  else if aUF = 'RN' then
    Result := '99.999.999-9;0; '
  else if aUF = 'RS' then
    Result := '999/9999999;0; '
  else if aUF = 'RO' then
    Result := '999.99999-9;0; '
  else if aUF = 'RR' then
    Result := '99999999-9;0; '
  else if aUF = 'SC' then
    Result := '999.999.999;0; '
  else if aUF = 'SP' then
    Result := '999.999.999.999;0; '
  else if aUF = 'SE' then
    Result := '999999999-9;0; '
  else if aUF = 'TO' then
    Result := '99999999999;0; '
  else
    Result := '';
end;

function ValidarInscEstadual(aInscricao, aTipo: AnsiString): Boolean;
var
  IRet: Integer;
  LibHandle: THandle;
  ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  Result := FALSE;

  LibHandle := LoadLibrary('DllInscE32.Dll');
  try
    if LibHandle <= HINSTANCE_ERROR then
      raise Exception.Create('Dll não carregada');

    @ConsisteInscricaoEstadual := GetProcAddress(LibHandle, 'ConsisteInscricaoEstadual');

    if @ConsisteInscricaoEstadual = nil then
      raise Exception.Create('Chamada de Função "ConsisteInscriçãoEstadual" não encontrada em "DllInscE32.Dll"!');

    IRet := ConsisteInscricaoEstadual(aInscricao, aTipo);
    if IRet = 0 then
      Result := TRUE;
  finally
    FreeLibrary(LibHandle);
  end;
end;

procedure VerificarCamposObrigatorios(fDataSet:TDataSet);
Var
  fI: Integer;
begin
  for fI:= 0 to fDataSet.FieldCount - 1 do
  begin
    if fDataSet.Fields[fI].Required then
    begin
      if fDataSet.Fields[fI].IsNull then
      begin
        try fDataSet.Fields[fI].FocusControl; except end;
        raise Exception.Create(sLineBreak + Format('O Campo "%s" é obrigatório!',[fDataSet.Fields[fI].DisplayName]));
      end
      else
      if fDataSet.Fields[fI].DataType = ftString then
      begin
        if Trim(fDataSet.Fields[fI].AsString) = '' then
        begin
          //try fDataSet.Fields[fI].FocusControl; except end;
          raise Exception.Create(sLineBreak + Format('O Campo "%s" é obrigatório!',[fDataSet.Fields[fI].DisplayName]));
        end;
      end;

      if fDataSet.Fields[fI].DataType = ftCurrency then
      begin
        if fDataSet.Fields[fI].Tag = 0 then
        begin
          if fDataSet.Fields[fI].AsCurrency < 0 then
          begin
            //try fDataSet.Fields[fI].FocusControl; except end;
            raise Exception.Create(sLineBreak + Format('O Campo "%s" não aceita valor negativo!',[fDataSet.Fields[fI].DisplayName]));
          end;
        end;
      end;
    end;
  end;
end;

function PreencherDir(aString: string; aCaracter: Char; aTamanho: integer): string;
begin
  if Length(aString) > aTamanho then
    aString := Copy(aString, 0, aTamanho);

  Result := aString + StringOfChar(aCaracter, aTamanho - length(aString));
end;

function RemoveChar(const Texto: string; strChar: string): string;
var
  i: integer;
begin
  Result := '';

  if (strChar = '') then
  begin
    for i := 1 to Length(Texto) do
    begin
      if (Texto[i] in ['0'..'9']) then
        Result := Result + Copy(Texto, i, 1);
    end;
  end
  else
  begin
    for i := 1 to Length(Texto) do
    begin
      if (Texto[i] <> strChar) then
        Result := Result + Copy(Texto, i, 1);
    end;
  end;
end;

function FormatarCPFCNPJ(ACNPJ: string): string;
begin
end;

function FormatarCEST(const ACodigoCEST: String): String;
var
  i, Atual: integer;
  CEST: String;
begin
  CEST := OnlyNumber(ACodigoCEST);
  Result := '**.***.**';

  Atual := 1;
  CEST := PadRight(OnlyNumber(ACodigoCEST), 7, ' ');
  for i := 1 to Length(Result) do
  begin
    if (Result[i] = '*') and (Atual <= Length(CEST)) then
    begin
      Result[i] := CEST[Atual];
      Inc(Atual);
    end;
  end;
end;

function FormatarCNPJ(ACNPJ: string): string;
var
  ATexto: String;
begin
  ATexto := ACBrUtil.OnlyNumber(ACNPJ);

  case ATexto.Trim.Length of
    //66398496000101
    //12345678901234

    3,4,5:
      begin
        insert('.',ATexto,3);
      end;
    6,7,8:
      begin
        insert('.',ATexto,3);
        insert('.',ATexto,7);
      end;
    9,10,11:
      begin
        insert('.',ATexto,3);
        insert('.',ATexto,7);
        insert('/',ATexto,11);
      end;
    12,13,14:
      begin
        insert('.',ATexto,3);
        insert('.',ATexto,7);
        insert('/',ATexto,11);
        insert('-',ATexto,16);
      end;
  end;
  Result := ATexto;
end;

function FormatarCEP(ACEP: string): string;
var
  ATexto: String;
begin
  ATexto := ACBrUtil.OnlyNumber(ACEP);

  //38183000
  //12345678
  case ATexto.Trim.Length of
    6,7,8:
      begin
        insert('-',ATexto,6);
      end;
  end;
  Result := ATexto;
end;

function FormatarCPF(ACPF: string): string;
var
  ATexto: String;
begin
  ATexto := ACBrUtil.OnlyNumber(ACPF);

  case ATexto.Trim.Length of
    3,4,5:
      begin
        insert('.',ATexto,4);
      end;
    6,7,8:
      begin
        insert('.',ATexto,4);
        insert('.',ATexto,8);
      end;
    9,10,11:
      begin
        insert('.',ATexto,4);
        insert('.',ATexto,8);
        insert('-',ATexto,12);
      end;
  end;
  Result := ATexto;
end;

function FormatarCNPJCPF(Numero: string): string;
var
  i, Atual: integer;
begin
  Numero := RemoveChar(Numero, '');

  case Length(Numero) of
    11: Result := '***.***.***-**';
    14: Result := '**.***.***/****-**';
    15: Result := '***.***.***/****-**';
  else
    Result := '**************';
  end;

  Numero := PreencherDir(Numero, ' ', Length(Result));

  Atual := 1;

  for i := 1 to Length(Result) do
  begin
    if (Result[i] = '*') and (Atual <= Length(Numero)) then
    begin
      Result[i] := Numero[Atual];
      Inc(Atual);
    end;
  end;
end;

Function FormatarInscEstadual( Inscricao, Estado : String ) : String;
Var
  Mascara : String;
  Contador_1 : Integer;
  Contador_2 : Integer;

Begin
  IF Estado = 'AC' Then Mascara := '**.***.***/***-**';
  IF Estado = 'AL' Then Mascara := '*********';
  IF Estado = 'AP' Then Mascara := '*********';
  IF Estado = 'AM' Then Mascara := '**.***.***-*';
  IF Estado = 'BA' Then Mascara := '******-**';
  IF Estado = 'CE' Then Mascara := '********-*';
  IF Estado = 'DF' Then Mascara := '***********-**';
  IF Estado = 'ES' Then Mascara := '*********';
  IF Estado = 'GO' Then Mascara := '**.***.***-*';
  IF Estado = 'MA' Then Mascara := '*********';
  IF Estado = 'muito' Then Mascara := '**********-*';
  IF Estado = 'MS' Then Mascara := '*********';
  IF Estado = 'MG' Then Mascara := '***.***.***/****';
  IF Estado = 'pra' Then Mascara := '**-******-*';
  IF Estado = 'PB' Then Mascara := '********-*';
  IF Estado = 'PR' Then Mascara := '********-**';
  IF Estado = 'PE' Then Mascara := '**.*.***.*******-*';
  IF Estado = 'PI' Then Mascara := '*********';
  IF Estado = 'RJ' Then Mascara := '**.***.**-*';
  IF Estado = 'RN' Then Mascara := '**.***.***-*';
  IF Estado = 'RS' Then Mascara := '***/*******';
  IF Estado = 'RO' Then Mascara := '***.*****-*';
  IF Estado = 'RR' Then Mascara := '********-*';
  IF Estado = 'SC' Then Mascara := '***.***.***';
  IF Estado = 'SP' Then Mascara := '***.***.***.***';
  IF Estado = 'SE' Then Mascara := '*********-*';
  IF Estado = 'TO' Then Mascara := '***********';

  Contador_2 := 1;
  Result := '';
  Mascara := Mascara + '****';
  For Contador_1 := 1 To Length( Mascara ) Do
  Begin
    IF Copy( Mascara, Contador_1, 1 ) = '*' Then Result := Result + Copy( Inscricao, Contador_2, 1 );
    IF Copy( Mascara, Contador_1, 1 ) <> '*' Then Result := Result + Copy( Mascara , Contador_1, 1 );
    IF Copy( Mascara, Contador_1, 1 ) = '*' Then Contador_2 := Contador_2 + 1;
  End;

  Result := Trim( Result );
End;

function DataHoraToSQL(aDataHora: TDateTime): string;
begin
  Result := QuotedStr(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDataHora));
end;

function FloatToSQL(aValor: Extended): string;
var
  Dec: Char;
begin
  Dec := FormatSettings.DecimalSeparator;

  FormatSettings.DecimalSeparator := '.';
  Result := FormatFloat('0.00', aValor);
  FormatSettings.DecimalSeparator := Dec;
end;

function FormatarNCM(const ACodigoNCM: String): String;
var
  i, Atual: integer;
  NCM: String;
begin
  NCM := OnlyNumber(ACodigoNCM);

  if NCM.Trim.Length = 7 then
    Result := '**.**.**.*'
  else
    Result := '**.**.**.*.*';

  Atual := 1;
  NCM := PadRight(OnlyNumber(ACodigoNCM), 8, ' ');
  for i := 1 to Length(Result) do
  begin
    if (Result[i] = '*') and (Atual <= Length(NCM)) then
    begin
      Result[i] := NCM[Atual];
      Inc(Atual);
    end;
  end;
end;

function ToStr(aValor: Variant): string;
begin
  Result := VarToStrDef(aValor, '');
end;

function ToStr(aFormato: String; aValor: TDatetime): String;
begin
  if aValor > 0 then
    Result := FormatDateTime(aFormato, aValor)
  else
    Result := '';
end;

function ToStrDef(aValor: Variant; aDef: string): string;
begin
  Result := VarToStrDef(aValor, aDef);
end;

function ToDate(aValor: Variant): TDateTime;
begin
  if VarIsNull(aValor) then
    Result := 0
  else
    Result := VarToDateTime(aValor);
end;

function ToCurr(aValor: Variant): Currency;
var
  str: string;
begin
  str    := VarToStrDef(aValor, '0');
  Result := StrToCurrDef(str, 0);
end;

function ToFloat(aValor: Variant): Extended;
var
  str: string;
begin
  str    := VarToStrDef(aValor, '0');
  Result := StrToFloatDef(str, 0);
end;

function ToInt(aValor: Variant): Integer;
var
  str: string;
begin
  str    := VarToStrDef(aValor, '0');
  Result := StrToIntDef(str, 0);
end;

function ToIntDef(aValor: Variant; aDef: Integer): Integer;
var
  str: string;
begin
  str    := VarToStrDef(aValor, IntToStr(aDef));
  Result := StrToIntDef(str, aDef);
end;

function CurDrv: Char;
var
  s1: string;
  s2: Char;
begin
  GetDir(0,s1);
  s2     := s1[1];
  CurDrv := s2;
end;

function DataToSQL(fData:TDateTime):String;
begin
  if fData = 0 then
    raise Exception.Create('Erro, data não informada');

  Result := QuotedStr(FormatDateTime('MM/dd/yyy',fData));
end;

function FormatarFone(ATexto:String):String;
begin
  ATexto := ACBrUtil.OnlyNumber(ATexto);

  case ATexto.Trim.Length of
    07:begin
        insert('-',ATexto,4);
      end;
    08:begin
        insert('-',ATexto,5);
      end;
    09:begin
        insert('-',ATexto,6);
      end;
    10:begin
        insert('(',ATexto,1);
        insert(')',ATexto,4);
        insert('-',ATexto,9);
      end;
    11:begin
        insert('(',ATexto,1);
        insert(')',ATexto,4);
        insert('-',ATexto,10);
      end;
  else
    begin
      insert('-',ATexto,6);
    end;
  end;
   Result := ATexto;
end;

function FormatarTCCC(ATexto:String):String;
var
  AStrInserir: string;
  ATamanho: integer;
  n:integer;
  x:integer;
begin
  ATamanho := Length(ATexto);

  x:= 0;
  if (ATamanho<=8) then
    x:=8
  else
  if (ATamanho>8) and (ATamanho<=11) then
    x:=11
  else
  if (ATamanho>11) and (ATamanho<=14) then
    x:=14
  else
  if (ATamanho>14) then
    x:=15;

  for n:=1 to x-ATamanho do
  begin
    case x of
       8 or       //Cep
         11 or    //Cpf
           14 or  //Cnpj
             15:; //Cnpj
     end;
    insert(' ',AStrInserir,length(ATexto)+1);
  end;

  ATexto := ATexto + AStrInserir;
  ATamanho := Length(Trim(ATexto));

  case ATamanho of
    8:begin
      insert('-',ATexto,6);
      end;
   11:begin
      insert('.',ATexto,4);
      insert('.',ATexto,8);
      insert('-',ATexto,12);
      end;
   14:begin
      insert('.',ATexto,3);
      insert('.',ATexto,7);
      insert('/',ATexto,11);
      insert('-',ATexto,16);
      end;
   15:begin
      insert('.',ATexto,4);
      insert('.',ATexto,8);
      insert('/',ATexto,12);
      insert('-',ATexto,17);
      end;
  end;
  Result := ATexto;
end;

procedure AtualizarTabela(ATabela: TFDQuery; AKeyField:string = '';AKeyData:String = '');
var
  ABookMark: Variant;
begin
  if AKeyField <> '' then
    ABookMark := TFDQuery(ATabela).FieldByName(AKeyField).Value;

  if AKeyData <> '' then
    ABookMark := AKeyData;

  ATabela.close;
  ATabela.Open;

  if AKeyField <> '' then
    TFDQuery(ATabela).Locate(AKeyField,ABookMark,[]);
end;

function GetIPLocalHost: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: AnsiString;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PAnsiChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));

  with HostEnt^ do
    Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);

  WSACleanup;
end;

function GetNomeLocalHost: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

end.

