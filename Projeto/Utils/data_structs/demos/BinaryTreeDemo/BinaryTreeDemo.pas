unit BinaryTreeDemo;

(*
BinaryTreeDemo.pas/dfm
----------------------
Begin: 2007/01/12
Last revision: $Date: 2007-01-17 02:36:16 $ $Author: areeves $
Version number: $Revision: 1.1 $

This code was modified from a version by Ing.Büro R.Tschaggelar
http://www.ibrtses.com/delphi/binarytree.html

This version revised by Aaron Reeves <Aaron.Reeves@colostate.edu>, Jan. 2007
This version copyright (C) 2007 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

interface

  uses
    Windows,
    Messages,
    SysUtils,
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls,
    Spin,

    BinaryTree
  ;


  type TForm1 = class( TForm )
      add: TButton;
      Memo1: TMemo;
      SpinEdit1: TSpinEdit;
      searchresult: TLabel;
      List: TButton;
      search: TButton;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure addClick(Sender: TObject);
      procedure ListClick(Sender: TObject);
      procedure searchClick(Sender: TObject);

    public
     bt:TBintree;
    end
  ;

 type TmyTreeItem = class( TBinTreeItem )	// the base class has to be overriden !
    public
      data:integer;
      constructor create(i:integer);
      function compare(a:TBinTreeItem):Shortint;  override; // data
      // a < self :-1  a=self :0  a > self :+1
      procedure copy(ToA:TBinTreeItem);   override;         // data
      procedure list; override;
    end
 ;

var
  Form1: TForm1;

implementation

{$R *.DFM}

  uses
    DebugWindow
  ;

  constructor TmyTreeItem.create(i:integer);
    begin
      inherited create;
      data:=i;
    end
  ;


  // a < self :-1  a=self :0  a > self :+1
  function TmyTreeItem.compare(a:TBinTreeItem):Shortint;
    begin
      result := 0;

      if TmyTreeItem(a).data < data then
        result:=-1
      else if TmyTreeItem(a).data = data then
        result:=0
      else if TmyTreeItem(a).data > data then
        result:=1
      ;
    end
  ;


  procedure TmyTreeItem.copy(ToA:TBinTreeItem);
    begin
      TmyTreeItem(ToA).data:=data;
    end
  ;


  procedure TmyTreeItem.list;
    begin
      form1.memo1.lines.add(inttostr(data));
    end
  ;


  procedure TForm1.FormCreate(Sender: TObject);
    begin
      setDEBUGGING( true );
      bt:=TBinTree.create;
    end
  ;


  procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
      bt.destroy;
    end
  ;


  procedure TForm1.addClick(Sender: TObject);
    var
      bti: TmyTreeItem;
      i: integer;
    begin
      (*
      bti:=TmyTreeItem.create( SpinEdit1.value);
      bt.add(bti);
      *)

      dbcout2( 'Adding...' );

      for i := 0 to 3200000 do
        begin
          bti:=TmyTreeItem.create( i );
          bt.add(bti);
        end
      ;
      dbcout2( 'Done.' );
    end
  ;


  procedure TForm1.ListClick(Sender: TObject);
    begin
      memo1.clear;
      bt.list;
    end
  ;


  procedure TForm1.searchClick(Sender: TObject);
    var
      bti, j: TmyTreeItem;
    begin
      //bti:=TmyTreeItem.create( SpinEdit1.value);
      bti := TmyTreeItem.create( 3000000 );
      j := bti;
      dbcout2( 'Searching...' );
      application.ProcessMessages();

      if bt.Search(j) then
        searchresult.caption:='FOUND'
      else
        searchresult.caption:='not found'
      ;

      dbcout2( 'Done.' );
      bti.destroy;
    end
  ;


end.
