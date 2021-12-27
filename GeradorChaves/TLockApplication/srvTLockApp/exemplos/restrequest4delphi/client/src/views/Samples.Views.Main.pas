unit Samples.Views.Main;

interface

uses System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls,
  FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Layouts, FMX.Objects;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    vsbUsers: TVertScrollBox;
    btnListar: TButton;
    procedure btnListarClick(Sender: TObject);
  private
    procedure LoadUsers;
  end;

var
  HeaderFooterForm: THeaderFooterForm;

implementation

{$R *.fmx}

uses Samples.Providers.Frames.User, Samples.Services.User, System.Threading;

procedure THeaderFooterForm.btnListarClick(Sender: TObject);
var
  LTask: ITask;
begin
  vsbUsers.BeginUpdate;
  try
    LTask := TTask.Create(
      procedure
      begin
        Self.LoadUsers;
      end);
    LTask.Start;
  finally
    vsbUsers.EndUpdate;
  end;
end;

procedure THeaderFooterForm.LoadUsers;
var
  LFrameUser: TUserFrame;
  LService: TUserService;
begin
  LService := TUserService.Create(Self);
  try
    //LService.GetUsersRESTRequest4Delphi;
    LService.GetUsersDefault;
    while not LService.mtUsers.Eof do
    begin
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          LFrameUser := TUserFrame.Create(vsbUsers);
          LFrameUser.Parent := vsbUsers;
          LFrameUser.Name := 'UserFrame' + LService.mtUsers.RecNo.ToString;
          LFrameUser.Align := TAlignLayout.Top;
          LFrameUser.lblEmail.Text := LService.mtUsers.FieldByName('EMAIL').AsString;
          LFrameUser.lblNome.Text := LService.mtUsers.FieldByName('NAME').AsString;
        end);
      LService.mtUsers.Next;
    end;
  finally
    LService.Free;
  end;
end;

end.
