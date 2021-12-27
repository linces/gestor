unit Replicador.Model.Tipificacoes;

interface


Type
  TTipsConexao = record
    Database : String;
    DriverID : String;
    DBVersion : String;
    UserName : String;
    Password : String;
    ID : Integer;
    Descrition : String;
    TableReceive : String;
    TableSend : String;
    RoleName : String;
    Server : String;
    Port : String;
    Send : Boolean;
    Receive : Boolean;
    VendorLib : String;
  end;


implementation

end.
