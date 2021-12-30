unit BinaryTree;

(*
BinaryTree.pas
---------------
Begin: 2007/01/12
Last revision: $Date: 2007-01-17 02:36:13 $ $Author: areeves $
Version number: $Revision: 1.1 $

This code was modified from a version by Ing.Büro R.Tschaggelar
http://www.ibrtses.com/delphi/binarytree.html, which was adapted from
Nicklaus Wirth, Algorithmen und Datenstrukturen ( in Pascal ), Balanced Binary Trees p 250 ++
and subsequently revised by Giacomo Policicchio, pgiacomo@tiscalinet.it, 19/05/2000

This version revised by Aaron Reeves <Aaron.Reeves@colostate.edu>, Jan. 2007
This version copyright (C) 2007 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
*)

interface

  uses
    Classes
  ;


  type TBinTreeItem = class( TObject )
    protected
      count:integer;

    public
      left,right: TBinTreeItem;
      bal: -1..1;

      constructor create;
      function compare(a:TBinTreeItem):Shortint;  virtual; abstract; // data
      // a < self :-1  a=self :0  a > self :+1
      procedure copy(ToA:TBinTreeItem);  virtual; abstract; // data
      procedure list; virtual; abstract;                    // used to list the tree
    end
  ;


  type TBinTree = class( TPersistent )
    protected
      ItemCount:integer;
      procedure Delete(item:TBinTreeItem;var p:TBinTreeItem;var h:boolean;var ok:boolean);
      procedure SearchAndInsert(item:TBinTreeItem;Var p:TBinTreeItem;var h:boolean;Var Found:boolean);
      function SearchItem(item:TBinTreeItem;Var p:TBinTreeItem):boolean;
      procedure balanceLeft(var p:TBinTreeItem;var h:boolean;dl:boolean);
      procedure balanceRight(var p:TBinTreeItem;var h:boolean;dl:boolean);
      procedure listitems(var p:TBinTreeItem);

    public
      root:TBinTreeItem;

      constructor create;
      destructor destroy; override;
      Function add(item:TBinTreeItem):boolean;
      Function remove(item:TBinTreeItem):boolean;
      function search(item:TBinTreeItem):boolean;
      procedure list;      // uses item.list through listitems recursively
    end
  ;


implementation

//=================================================================
  constructor TBinTreeItem.create;
    begin
       inherited create;
       count:=0;
    end
  ;

//=================================================================

  constructor TBinTree.create;
    begin
     inherited create;
     root:=nil;
     ItemCount:=0;
    end
  ;


  destructor TBinTree.destroy;
    begin
     while root <> nil do remove(root);
     inherited destroy;
    end
  ;


  procedure TBinTree.SearchAndInsert( item: TBinTreeItem; Var p: TBinTreeItem; var h: boolean; Var Found: boolean );
    begin
     found:=false;

      if p=nil then // word not in tree, insert it
        begin
          p := item;
          h := true;

          with p do
            begin
              if root = nil then
                root := p
              ;

              count := 1;
              left := nil;
              right := nil;
              bal := 0;
            end
          ;
        end
      else
        begin
          if (item.compare( p ) > 0) then      // new < current
            begin
              searchAndInsert( item, p.left, h, found );
              if( h and ( not found ) ) then
                balanceLeft( p, h, false )
              ;
            end
          else if (item.compare(p) < 0) then     // new > current
            begin
              searchAndInsert( item, p.right, h, found );

              if( h and ( not found ) ) then
                balanceRight( p, h, false )
              ;
            end
          else
            begin
              p.count:=p.count+1;
              h:=false;
              found:=true;
            end
          ;
        end
      ;
    end
  ;


  // returns true and a pointer to the equal item if found, false otherwise
  function TBinTree.SearchItem(item:TBinTreeItem;Var p:TBinTreeItem):boolean;
    begin
    result := false;

    if (p=nil) then // empty
      result:=false
    else if (item.compare(p) =0) then
      result:=true
    else if (item.compare(p) >0) then
      result := searchitem( item, p.left )
    else if (item.compare(p) <0) then
      result := searchitem( item, p.right )
    ;
    end
  ;


  procedure TBinTree.balanceRight(var p:TBinTreeItem;var h:boolean;Dl:boolean);
    var
      p1,p2:TBinTreeItem;
    begin
      case p.bal of
        -1:
          begin
            p.bal:=0;
            if not dl then h:=false;
          end
        ;
        0:
          begin
            p.bal:=+1;
            if dl then h:=false;
          end
        ;
        +1: // new balancing
          begin
            p1:=p.right;

            if (p1.bal=+1) or ( (p1.bal=0) and dl ) then  // single rr rotation
              begin
                p.right := p1.left;
                p1.left := p;

                if( not dl )
                  then p.bal := 0
                else
                  begin
                    if p1.bal = 0 then
                      begin
                        p.bal := +1;
                        p1.bal := -1;
                        h := false;
                      end
                    else
                      begin
                        p.bal := 0;
                        p1.bal := 0;
                        (* h:=false; *)
                      end
                    ;
                  end
                ;

                p:=p1;
              end
            else // double rl rotation
              begin
                p2 := p1.left;
                p1.left := p2.right;
                p2.right := p1;
                p.right := p2.left;
                p2.left := p;
                if p2.bal = +1 then p.bal:= -1 else p.bal := 0;
                if p2.bal = -1 then p1.bal := +1 else p1.bal := 0;
                p := p2;
                if dl then p2.bal := 0;
              end
            ;

            if not dl then
              begin
                p.bal := 0;
                h := false;
              end
            ;
          end
        ;
      end; // case
    end
  ;


  procedure TBinTree.balanceLeft( var p: TBinTreeItem; var h: boolean; dl: boolean );
    var
      p1,p2: TBinTreeItem;
    begin
      case p.bal of
        1:
          begin
            p.bal:=0;
            if not dl then h:=false;
          end
        ;
        0:
          begin
            p.bal:=-1;
            if dl then  h:=false;
          end
        ;
        -1:
          begin   // new balancing
            p1 := p.left;

            if (p1.bal=-1) or ((p1.bal=0) and dl) then // single ll rotation
              begin
                p.left:=p1.right;p1.right:=p;

                if not dl then
                  p.bal:=0
                else
                  begin
                    if p1.bal=0 then
                      begin
                        p.bal:=-1;
                        p1.bal:=+1;
                        h:=false;
                      end
                    else
                      begin
                        p.bal:=0;
                        p1.bal:=0;
                      end
                    ;
                  end
                ;
                p:=p1;
              end
            else
              begin //double lr rotation
                p2:=p1.right;
                P1.Right:=p2.left;
                p2.left:=p1;
                p.left:=p2.right;
                p2.right:=p;
                if p2.bal=-1 then  p.bal:=+1 else p.bal:=0;
                if p2.bal=+1 then  p1.bal:=-1 else p1.bal:=0;
                p:=p2;if dl then p2.bal:=0;
              end
            ;

            if not dl then
              begin
                p.bal := 0;
                h := false;
              end
            ;
          end
        ;
      end; // case
    end
  ;


  procedure TBinTree.Delete(item:TBinTreeItem;var p:TBinTreeItem;var h:boolean;var ok:boolean);
    var
      q:TBinTreeItem;

      procedure del(var r:TBinTreeItem;var h:boolean);
        begin
          if r.right <> nil then
            begin
              del(r.right,h);
              if h then balanceLeft( r, h, True );
            end
          else
            begin
              r.copy(q);
              q.count:=r.count;
              q:=r;
              r:=r.left;h:=true;
            end
          ;
        end
      ;
    begin 
      ok := true;

      if( p = nil ) then
        begin
          Ok := false;
          h := false;
        end
      else if( item.compare(p) > 0 ) then
        begin
          delete( item, p.left, h, ok );
          if h then balanceRight(p,h,True);
        end
      else if (item.compare(p) < 0) then
        begin
          delete(item,p.right,h,ok);
          if h then balanceLeft(p,h,True);
        end
      else
        begin // remove q
          q:=p;
          if q.right=nil then
            begin
              p:=q.left;
              h:=true;
            end
          else if (q.left=nil) then
            begin
              p:=q.right;
              h:=true;
            end
          else
            begin
              del(q.left,h);
              if h then balanceRight(p,h,True);
            end
          ;
          q.free; {dispose(q)};
        end
      ;
    end
  ;


  function TBinTree.add(item:TBinTreeItem):boolean;
    var
      h, found: boolean;
    begin
      SearchAndInsert(item,root,h,found);
      add:=found;
    end
  ;


  function TBinTree.remove(item:TBinTreeItem):Boolean;
    var
      h, ok: boolean;
    begin
      Delete(item,root,h,ok);
      remove:=ok;
    end
  ;


  function TBinTree.Search(item:TBinTreeItem):Boolean;
    begin
     result:=SearchItem(item,root);
    end
  ;


  procedure TBinTree.listitems(var p:TBinTreeItem);
    begin
      if p<>nil then
        begin
          if (p.left <> nil) then listitems(p.left);
          p.list;
          if (p.right <> nil) then listitems(p.right);
        end
      ;
    end
  ;


  procedure TBinTree.list(); // uses item.list recursively
    begin
     listitems( root );
    end
  ;

end.
