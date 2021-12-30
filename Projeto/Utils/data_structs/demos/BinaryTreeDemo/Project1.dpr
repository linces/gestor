program Project1;

uses
  Forms,
  BinaryTree,
  BinaryTreeDemo in 'BinaryTreeDemo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
