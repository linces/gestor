unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LockApplication, StdCtrls, ExtCtrls, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.MySQL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,   IdAntiFreezeBase, IdAntiFreeze;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    dados: TMemo;
    Label2: TLabel;
    Button2: TButton;
     Button3: TButton;
    IdHTTP1: TIdHTTP;
    LockApplication1: TLockApplication;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
   LockApplication1.renovar;
   label1.Caption := '';
   Label1.Caption := 'ID da instala��o : '+ IntToStr(LockApplication1.IDInstalacao) + #13;
   Label1.Caption := Label1.Caption + 'Dias Restantes : ' + IntToStr(LockApplication1.Dias_RestantesU) + #13;
   Label1.Caption := Label1.Caption + 'Data Vencimento : ' + LockApplication1.Data_VencimentoU + #13;
   Label1.Caption := Label1.Caption + 'Chave : ' + LockApplication1.Chave_RegistradaU + #13;
   Label1.Caption := Label1.Caption + 'E-mail do cliente : ' + LockApplication1.Email_ClienteU + #13;
   Label1.Caption := Label1.Caption + 'Vers�o : ' + IntToStr(LockApplication1.Versao_Sistema )+ #13;
   Label1.Caption := Label1.Caption + 'Quantidade Registros : ' + IntToStr(LockApplication1.QuantidaRegistrosBD )+ #13;
   if LockApplication1.Sistema_DemoU then
         Label1.Caption := Label1.Caption + 'Tipo de licen�a: Licen�a Demonstra��o'
   else
         Label1.Caption := Label1.Caption + 'Tipo de licen�a: Licen�a Registrada'
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   LockApplication1.Atualizar_Cadastro;
   dados.Clear;
   dados.Lines.Add( 'Nome do Cliente: '+ LockApplication1.Cliente_Nome );
   dados.Lines.Add( 'Cpf: '+LockApplication1.Cliente_CPF );
   dados.Lines.Add( 'Cep: '+ LockApplication1.Cliente_Cep );
   dados.Lines.Add( 'Endere�o: '+LockApplication1.Cliente_Endereco );
   dados.Lines.Add( 'Cidade: '+LockApplication1.Cliente_Cidade );
   dados.Lines.Add( 'Estado: '+LockApplication1.Cliente_Estado );
   dados.Lines.Add( 'Telefone: '+LockApplication1.Cliente_Telefone );
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  LockApplication1.RestServerAtivo := true;
  LockApplication1.executar;

  if LockApplication1.RestServerAtivo = true then begin
    LockApplication1.ChecaServidorRest('srvTLockApp.exe');
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
   label1.Caption := '';
   Label1.Caption := 'ID da instala��o : '+ IntToStr(LockApplication1.IDInstalacao) + #13;
   Label1.Caption := Label1.Caption + 'Dias Restantes : ' + IntToStr(LockApplication1.Dias_RestantesU) + #13;
   Label1.Caption := Label1.Caption + 'Data Vencimento : ' + LockApplication1.Data_VencimentoU + #13;
   Label1.Caption := Label1.Caption + 'Chave : ' + LockApplication1.Chave_RegistradaU + #13;
   Label1.Caption := Label1.Caption + 'E-mail do cliente : ' + LockApplication1.Email_ClienteU + #13;
   Label1.Caption := Label1.Caption + 'Vers�o : ' + IntToStr(LockApplication1.Versao_Sistema )+ #13;
   Label1.Caption := Label1.Caption + 'Quantidade Registros : ' + IntToStr(LockApplication1.QuantidaRegistrosBD )+ #13;
   if LockApplication1.Sistema_DemoU then
         Label1.Caption := Label1.Caption + 'Tipo de licen�a: Licen�a Demonstra��o'
   else
         Label1.Caption := Label1.Caption + 'Tipo de licen�a: Licen�a Registrada';

   dados.Clear;
   dados.Lines.Add( 'Nome do Cliente: '+LockApplication1.Cliente_Nome );
   dados.Lines.Add( 'Cpf: '+LockApplication1.Cliente_CPF );
   dados.Lines.Add( 'Cep: '+ LockApplication1.Cliente_Cep );
   dados.Lines.Add( 'Endere�o: '+ LockApplication1.Cliente_Endereco );
   dados.Lines.Add( 'Cidade: '+LockApplication1.Cliente_Cidade );
   dados.Lines.Add( 'Estado: '+LockApplication1.Cliente_Estado );
   dados.Lines.Add( 'Telefone: '+LockApplication1.Cliente_Telefone );

end;

end.
