unit Replicador.View.Intefaces;

interface

type
  IReplicatorThread = interface
    function Host(Value : String) : IReplicatorThread; overload;
    function Host : String; overload;
    function Path(Value : String) : IReplicatorThread; overload;
    function Path : String; overload;
    function TypeDB(Value : String) : IReplicatorThread; overload;
    function TypeDB : String; overload;
    function User(Value : String) : IReplicatorThread; overload;
    function User : String; overload;
    function Password(Value : String) : IReplicatorThread; overload;
    function Password : String; overload;
    function RoleName(Value : String) : IReplicatorThread; overload;
    function RoleName : String; overload;
    function Port(Value : Integer) : IReplicatorThread; overload;
    function Port : Integer; overload;
  end;

implementation

end.
