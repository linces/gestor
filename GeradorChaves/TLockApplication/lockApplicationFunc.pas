unit LockApplicationFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Registry, LockApplicationControle,
  SHFolder,inifiles;

type
   TFunc = class
     public
        procedure fechar_sistema;
        function GetID_Instalacao: Int64;
        function HexToInt( value: String ): int64;
        function FGerar_Chave( ID_Instalacao, ID_Sistema: int64; Data: TDateTime ): int64;
        function Processa_Data( Data: String ): int64;
        procedure Processa_Chave( Chave:String; Retorno: TStrings );
        function Cr(mStr, mChave: string): string;

        function Gravar_Valor( NomeValor, Valor: String) : Boolean;
        function Ler_Valor( NomeValor: String) : String;
        procedure Criar_Chave();
        function Chave_Criada() : Boolean;
        procedure gravar_chave_lista( value: String );
        function ver_chave_lista( value: String ): boolean;

        procedure Gravar_hora_data;
        procedure Iniciar_Relogio;

        // Protec Arquivo

        function Pastas_windows(folder : integer) : string;
        procedure EnDecryptFile(pathin: String; Chave : Word);
        procedure Protec;
        procedure Protec_Grava;
        procedure Protec_Recuperar;
        function Protect_existe: boolean;

     protected
        Tempo_Fechar: TTimer;
        Tempo_teste: TTimer;
        function cpuid:int64;
        function cpuid2: int64;
        function SSerial2: String;
        function SSerial( FDrive:string ): String;
        procedure Tempo_FecharP(Sender: TObject);
        procedure Charope(Sender: TObject);

   end;
        Const versao_teste = False;
var
  Func: TFunc;

implementation

uses
   LockApplicationVars, LockApplicationInterface;

procedure TFunc.EnDecryptFile(pathin: String; Chave : Word);
var
   InMS, OutMS : TMemoryStream;
   I : Integer;
   C : byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

    try
        InMS.LoadFromFile(pathin);
        InMS.Position := 0;

        for I := 0 to InMS.Size - 1 do
          begin
              InMS.Read(C, 1);
              C := (C xor not(ord(chave shr I)));
              OutMS.Write(C,1);
          end;
          deletefile( pathin );
          OutMS.SaveToFile(pathin);

   finally

       InMS.Free;
       OutMS.Free;
   end;
end;


function TFunc.Pastas_windows(folder : integer) : string;
 const
   SHGFP_TYPE_CURRENT = 0;
 var
   path: array [0..MAX_PATH] of char;
 begin
   if SUCCEEDED(SHGetFolderPath(0,folder,0,SHGFP_TYPE_CURRENT,@path[0])) then
     Result := path
   else
     Result := '';
 end;

function TFunc.Protect_existe: boolean;
var
   pasta: String;
begin
   pasta := Func.Pastas_windows(CSIDL_COMMON_APPDATA) + '\' + IntToStr( Variaveis.ID_Instalacao );
   if fileexists( pasta + '\registro.chv' ) then
      result := true
   else
      result := false;
end;

procedure TFunc.Protec_Recuperar;
var
  arquivo: TInifile;
  pasta: String;
  Lista: TStrings;
  I: integer;
begin
   Lista := TstringList.Create;
   pasta := Func.Pastas_windows(CSIDL_COMMON_APPDATA) + '\' + IntToStr( Variaveis.ID_Instalacao );
   if fileexists( pasta + '\registro.chv' ) then
      EnDecryptFile( pasta + '\registro.chv', Variaveis.ID_Sistema )
   else
      begin
         MessageDlg( 'Erro ao recuperar registro arquiovo inexistente!' +#13+
         'Entre em contato com o administrador do sistema!', mtError, [mbOK], 0 );
         Halt;
      end;

   arquivo := TiniFile.Create( pasta + '\registro.chv' );
   Lista.Clear;
   arquivo.ReadSection( 'CHAVES', Lista );
   for I := 0 to Lista.Count - 1 do
      begin
         Gravar_Valor( Lista[I], arquivo.ReadString( 'CHAVES', Lista[I], '') );
      end;

   Lista.Clear;
   Arquivo.ReadSection( 'CHAVES_USADAS', Lista );
   for I := 0 to Lista.Count - 1 do
      begin
         gravar_chave_lista( Lista[I] );
      end;

   lista.Free;
   arquivo.Free;
   EnDecryptFile( pasta + '\registro.chv', Variaveis.ID_Sistema );
   SetFileAttributes( pchar(pasta + '\registro.chv'), FILE_ATTRIBUTE_HIDDEN);
end;

procedure TFunc.Protec_Grava;
var
  arquivo: TInifile;
  pasta: String;
  LocalCR: String;
  Registro: TRegistry;
  Lista: TStrings;
  I: integer;
begin
   Lista := TstringList.Create;
   Registro := TRegistry.Create;
   LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
   Registro.RootKey :=   HKEY_CURRENT_USER;
   Registro.OpenKey( Variaveis.Local_Registro + LocalCR , True );

   pasta := Func.Pastas_windows(CSIDL_COMMON_APPDATA) + '\' + IntToStr( Variaveis.ID_Instalacao );
   if not DirectoryExists( pasta ) then
      begin
         ForceDirectories( pasta );
         SetFileAttributes( pchar(pasta), FILE_ATTRIBUTE_HIDDEN);
      end;

   if fileexists( pasta + '\registro.chv' ) then
      EnDecryptFile( pasta + '\registro.chv', Variaveis.ID_Sistema );
   arquivo := TiniFile.Create( pasta + '\registro.chv' );

   Lista.Clear;
   Registro.GetValueNames( Lista );

   for I := 0 to Lista.Count - 1 do
      begin
         Arquivo.WriteString( 'CHAVES', CR(Lista[I], variaveis.Chave_Crypt ) , CR(Registro.ReadString( Lista[I] ), Variaveis.Chave_Crypt ) );
      end;
   Registro.CloseKey;
   Registro.OpenKey( Variaveis.Local_Registro + LocalCR + '\' + CR( 'LISTA', Variaveis.Chave_Crypt ), True );
   Lista.Clear;
   Registro.GetValueNames( Lista );
   for I := 0 to Lista.Count - 1 do
      begin
         Arquivo.WriteString( 'CHAVES_USADAS', CR(Lista[I], variaveis.Chave_Crypt ) , '' );
      end;

   Arquivo.Free;
   EnDecryptFile( pasta + '\registro.chv', Variaveis.ID_Sistema );
   SetFileAttributes( pchar(pasta + '\registro.chv'), FILE_ATTRIBUTE_HIDDEN);
   Lista.Free;
   registro.CloseKey;
   Registro.Free;
end;

procedure TFunc.Protec;
var
  Registro: TRegistry;
  LocalCR: String;
  erro: boolean;
begin
     erro := false;
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     Registro.OpenKey( Variaveis.Local_Registro + LocalCR , True );
     if not registro.ValueExists( CR( 'CHAVE', Variaveis.Chave_Crypt ) ) then
        erro := true;
     if not registro.ValueExists( CR( 'DATA_VENCIMENTO', Variaveis.Chave_Crypt ) ) then
        erro := true;
     if not registro.ValueExists( CR( 'EMAIL', Variaveis.Chave_Crypt ) ) then
        erro := true;
     if not registro.ValueExists( CR( 'ULTIMA_HORA', Variaveis.Chave_Crypt ) ) then
        erro := true;
     if not registro.ValueExists( CR( 'ULTIMA_DATA', Variaveis.Chave_Crypt ) ) then
        erro := true;

   except
      raise Exception.Create('Erro ao ler registro PROTEC');
   end;

   Registro.CloseKey;
   Registro.Free;

   if erro then
      begin
         MessageDlg( 'Registro foi alterado pelo usuário e será recuperado!', mtError, [mbOK], 0);
         Func.Protec_Recuperar;
      end;
end;

procedure TFunc.Gravar_hora_data;
begin
   Gravar_valor( 'ULTIMA_HORA', TimeToStr( time ) );
   Gravar_valor( 'ULTIMA_DATA', DateToStr( date ) );
end;

procedure TFunc.Iniciar_Relogio;
begin
   if versao_teste then
      begin
          Messagedlg( 'Componente LockApplication versao de avalização' +
          #13+'Entre em contato e solicite a versão completa '+ #13 +
          'softarena@softarena.com.br', mtWarning, [ mbOK],0);
          Tempo_teste := TTimer.Create( nil );
          Tempo_teste.Interval := 120000;
          Tempo_teste.OnTimer := Charope;
          Tempo_teste.Enabled := True;
      end;
   if Controle.Relogio = nil then
      Controle.Relogio := TTimer.Create( nil );
   Controle.Relogio.Interval := 10000;
   Controle.Relogio.OnTimer := Controle.Gravar_Dados;
   Controle.Relogio.Enabled := True;

end;

procedure TFunc.Processa_Chave( Chave:String;Retorno: TStrings );
var
   DiasStr, DiasStr2, Versao, Ver2: String;
   DiasTemp, ChaveTemp, Ver: Int64;
   ChaveStr: String;
   DataStr, DataTemp: String;
   I: integer;
   Tracos: integer;
begin
   Tracos := 0;
   Retorno.Clear;
   for I := 1 to length( Chave ) do
      begin
         if Chave[I] = '-' then
            Tracos := Tracos + 1
         else
         case Tracos of
            0: DiasStr := DiasStr + Chave[I];
            1: ChaveStr := ChaveStr + Chave[I];
            2: DataStr := DataStr + Chave[I];
            3: Versao := Versao + Chave[I];
         end;
      end;
   if ( Tracos > 3 ) or ( Tracos < 3 ) then
      Retorno.Add( 'CHAVE_INVALIDA' )
   else
      begin
         DiasTemp := HexToInt( DiasStr );
         DiasStr := IntToStr( DiasTemp );
         for I := 1 to Length( DiasStr ) do
             begin
                if not ( (I = 1) or ( I = Length( DiasStr ) ) ) then
                   DiasStr2 := DiasStr2 + DiasStr[I];
             end;
         Retorno.Add( DiasStr2 );

         Ver := HexToInt( Versao );
         Versao := IntToStr( Ver  );
         for I := 1 to Length( Versao ) do
             begin
                if not ( (I = 1) or ( I = Length( Versao ) ) ) then
                   Ver2 := ver2 + Versao[I];
             end;

         ChaveTemp := HexToInt( ChaveStr);
         Retorno.Add( IntToStr( ChaveTemp) );
         DataStr := inttostr( HexToInt( DataStr ) );
         datastr := copy( datastr, 2, (length( datastr ) - 1) );
         for I := 1 to length( DataStr ) do
             begin
                case I of
                   3: DataTemp := DataTemp + '/';
                   5: DataTemp := DataTemp + '/';
                end;
                DataTemp := DataTemp + dataStr[I];
             end;
         Retorno.Add( DataTemp );
         Retorno.Add( Ver2 );
      end;

end;

procedure TFunc.gravar_chave_lista( value: String );
var
  Registro: TRegistry;
  LocalCR: String;
begin
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     Registro.OpenKey( Variaveis.Local_Registro + LocalCR + '\' + CR( 'LISTA', Variaveis.Chave_Crypt ), True );
     Registro.WriteString( CR( value, Variaveis.Chave_Crypt ), '' );
   except
      raise Exception.Create('Erro ao gravar lista de chaves!');
   end;
     Registro.CloseKey;
     Registro.Free;
end;

function TFunc.ver_chave_lista( value: String ): Boolean;
var
  Registro: TRegistry;
  LocalCR: String;
  Lista: TStrings;
  I: Integer;
  ChaveCR: String;
  Retorno : Boolean;
begin
     Retorno := False;
     Lista := TStringList.Create;
     Lista.Clear;
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     Registro.OpenKey( Variaveis.Local_Registro + LocalCR + '\' + CR( 'LISTA', Variaveis.Chave_Crypt ), True );
     Registro.GetValueNames( Lista );
     ChaveCR := CR( value, Variaveis.Chave_Crypt );
     for I := 0 to Lista.Count - 1 do
         begin
            if POS( ChaveCR, Lista[I] ) > 0 then
               begin
                  Retorno := True;
               end;
         end;
   except
      raise Exception.Create('Erro ao ler lista de chaves!');
   end;
     Registro.CloseKey;
     Registro.Free;
     Result := Retorno;
end;


procedure TFunc.Criar_Chave();
var
  Registro: TRegistry;
  LocalCR: String;
begin
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     Registro.OpenKey( Variaveis.Local_Registro + LocalCR, True );
   except
      raise Exception.Create('Erro ao criar chave!');
   end;
      registro.CloseKey;
      Registro.Free;
end;

function TFunc.Chave_Criada(): Boolean;
var
  Registro: TRegistry;
  LocalCR: String;
  Resultado: Boolean;
begin
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     if Registro.OpenKey( Variaveis.Local_Registro + LocalCR, False ) then
         begin
            resultado := true;
         end
     else
         begin
            resultado := false;
         end;
   except
     raise Exception.Create('Erro ao acessar registro!');
   end;
   registro.CloseKey;
   registro.Free;
   Result := resultado;
end;

function TFunc.Gravar_Valor( NomeValor, Valor: String) : Boolean;
var
  Registro: TRegistry;
  LocalCR: String;
  Resultado: Boolean;
  ValorGravarCR, NomeValorCR: String;
begin
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     ValorGravarCR := CR( valor, variaveis.Chave_Crypt );
     NomeValorCR := CR( NomeValor, variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     if Registro.OpenKey( Variaveis.Local_Registro + LocalCR, False ) then
        begin
           Resultado := True;
           Registro.WriteString( NomeValorCR, ValorGravarCR );
        end
     else
        begin
           Resultado := False;
        end;
   except
       raise Exception.Create('Erro ao gravar registro!');
   end;
       Registro.CloseKey;
       Registro.Free;
       Result := Resultado;

end;

function TFunc.Ler_Valor( NomeValor: String) : String;
var
  Registro: TRegistry;
  LocalCR: String;
  ValorLidoCR, ValorLido, NomeValorCR: String;
begin
     Registro := TRegistry.Create;
   try
     LocalCR := '\' + CR( inttostr( Variaveis.ID_Sistema ), Variaveis.Chave_Crypt );
     NomeValorCR := CR( NomeValor, variaveis.Chave_Crypt );
     Registro.RootKey :=   HKEY_CURRENT_USER;
     if Registro.OpenKey( Variaveis.Local_Registro + LocalCR, False ) then
        begin
           ValorLido := Registro.ReadString( NomeValorCR );
           ValorLidoCR := CR( ValorLido, variaveis.Chave_Crypt );
        end
     else
        begin
           ValorLidoCR := '';
        end;
   except
       ValorLidoCR := '';
       raise Exception.Create('Erro ao gravar registro!');
   end;
       Registro.CloseKey;
       Registro.Free;
       Result := ValorLidoCR;

end;

function TFunc.Cr(mStr, mChave: string): string;
var
i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
Result := mStr;
TamanhoString := length(mStr);
TamanhoChave := length(mChave);
for i := 1 to TamanhoString do
begin
pos := (i mod TamanhoChave);
if pos = 0 then
pos := TamanhoChave;
posLetra := ord(Result[i]) xor ord(mChave[pos]);
if posLetra = 0 then
posLetra := ord(Result[i]);
Result[i] := chr(posLetra);
end; end;


function TFunc.Processa_Data( Data: String ): int64;
var
   TempData: TDate;
   TempString, T2: String;
   TempInt: Int64;
   I: Integer;
begin
   TempData := StrtoDate( Data );
   TempString := FormatDateTime( 'dd/mm/yy', TempData );
   for I := 1 to Length( TempString ) do
      begin
         if TempString[I] <> '/' then
            T2 := T2 + TempString[I];
      end;
   TempInt := StrToInt64( '1'+T2 );
   Result := TempInt;
end;

function TFunc.FGerar_Chave( ID_Instalacao, ID_Sistema: int64; data: TDateTime ): int64;
var
   Conta, conta2: int64;
begin
   Conta := ( (ID_Instalacao * ID_Sistema) - ID_Sistema ) div 2;
   Conta2 := Conta  - Func.Processa_Data( FormatDateTime( 'dd/mm/yy', data ));
   result := Conta2;
end;

function TFunc.HexToInt( value: String ): int64;
var
  I: int64;
begin
   try
     I := StrToInt64( '$' + value );
     result := I;
   except
     raise Exception.Create('Erro conversão HEX para INT');
   end;
end;

function TFunc.GetID_Instalacao: int64;
var
  RetornoID: int64;
begin
    RetornoID := StrToint64( SSerial( 'C' )) + Variaveis.ID_Sistema;
//   RetornoID := StrToint64( SSerial2) + Variaveis.ID_Sistema;
   result := RetornoID;
end;

function TFunc.SSerial( FDrive:string ): String;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of char;
  conta: int64;
begin
   try
      GetVolumeInformation( PChar( FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
      conta :=  serial + cpuid ;
      result := FloatToStr( Conta );
   except
      result := '';
   end;
end;

function TFunc.cpuid:int64;
var
a,b,c,d: LongWord;
CPUID: LongWord;
begin
asm
push EAX
push EBX
push ECX
push EDX

mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX

pop EDX
pop ECX
pop EBX
pop EAX

{
mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX
}
end;
CPUID:= a ;
result := CPUID;
end;

function TFunc.SSerial2: String;
var
  conta: int64;
begin
   try
      conta :=  cpuid2 * 100;
      result := FloatToStr( Conta );
   except
      result := '';
   end;
end;

function TFunc.cpuid2:int64;
var
a,b,c,d: LongWord;
CPUID: LongWord;
begin
asm
push EAX
push EBX
push ECX
push EDX

mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX

pop EDX
pop ECX
pop EBX
pop EAX

{
mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX
}
end;
CPUID:= a;
result := CPUID;
end;


procedure TFunc.Tempo_FecharP(Sender: TObject);
begin
   Tempo_fechar.Enabled := False;
   Application.Terminate;

end;

procedure TFunc.fechar_sistema;
begin
{  Tempo_Fechar := TTimer.Create( nil );
   Tempo_Fechar.Interval := 200;
   Tempo_Fechar.OnTimer := Tempo_FecharP;
   Tempo_Fechar.Enabled := true;}
   Halt;

end;

procedure TFunc.Charope(Sender: TObject);
begin
          Messagedlg( 'Componente LockApplication versao de avalização' +
          #13+'Entre em contato e solicite a versão completa '+ #13 +
          'softarena@softarena.com.br'+#13+
          'Sistema será fechado!', mtWarning, [ mbOK],0);
          Tempo_teste.Enabled := false;
          Application.Terminate;
end;

end.
