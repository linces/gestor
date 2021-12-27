unit LockApplicationVars;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
   TVariaveis = class
     public
       // PROPRIEDADES DE DESENVOLVIMENTO
       ID_Sistema: int64;
       Dias_Trial: Int64;
       Trial: Boolean;
       Chave_Crypt: String;
       Mostrar_Tela: Boolean;
       Titulo_Janelas: String;
       Local_Registro: String;
       IntervaloPing: integer;

       // DADOS PARA ACESSO DO DESENVOLVEDOR
       Data_Vencimento: String;
       Dias_Restantes: int64;
       CHAVE_Registrada: String;
       SISTEMA_DEMO: Boolean;
       Email_Cliente: String;
       Idioma: string;

       // DADOS DE CONTATO DO DESNVOLVEdOR
       Empresa_Email: String;
       Empresa_Site: String;
       Empresa_Telefones: String;

       // VARIAVEIS PARA USO DO COMPOENNTE
       ID_Instalacao: Int64;
       Ja_Foi_Trial: Boolean;

       // DADOS DA TELA
       CHAVE_TELA: String;
       EMAIL_TELA: String;

       // PROCESSAMENTO DA CHAVE
       CHAVE_SEPARADA: Int64;
       DIAS_SEPARADO: int64;
       DATA_SEPARADA: String;

       // VARIAVEIS DE EMAIL;
       VAut_SSL: Boolean;
       VServidor_SMTP: String;
       VUsuario_SMTP: String;
       VSenha_SMTP: String;
       VPorta_SMTP: integer;
       VEmail_Remetente: String;
       VEmail_destino: String;
       VEmail_assunto: String;
       VEmail_mensagen: TStrings;
       VDias_email: integer;
       VEnviar_Email: Boolean;

        // VARIAVEIS DE BD
       hostbd: string;
       databasebd: string;
       usuariobd: string;
       password: string;
       portabd: integer;

       // Variaveis Rest
       resturlcomporta: string;
       ChecaRestServer: boolean;


       // Registros
       QuantRegistros: integer;

       // Cliente
       VNomeCliente, VEnderecoCliente, VCidadeCliente, VCPFCliente, VCEPCliente, VEstadoCliente, VTelefoneCliente, Caminholib  : String;

       // Linguagem
       Errobdlicencas, registroaltererecup, sistemanaoliberademo, chaveinfoinvalida, chavejautilizada, licencasemprazoexp : String;


   end;

var
    Variaveis: TVariaveis;



implementation

end.
