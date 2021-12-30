{*
StringSuperList.pas
-------------------
Begin: 2005/09/01
Last revision: $Date: 2009-08-26 16:54:47 $ $Author: rhupalo $
Version number: $Revision: 1.5 $
Code Documentation Tags: Begin 2009-08-26, Last Revision: 2009-08-26
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
Documentation generation tags begin with {* or ///
Replacing these with (* or // foils the documentation generator
*)

unit StringSuperList;

interface

  uses
    Contnrs,
    Classes
  ;

  type
    /// A list for holding stringlists
    TStringSuperList = class( TObjectList )
      protected
        _currentIndex: integer; /// Index of current string list

        function getCurrentIndex(): integer;
        function getIsEmpty(): boolean;

        procedure setObject( index: integer; item: TStringList );
        function getObject( index: integer ): TStringList;

      public
        constructor create();
        destructor destroy(); override;

        function first(): TStringList;
        function last(): TStringList;
        function next(): TStringList;
        function current(): TStringList;
        function at( index: integer ): TStringList;

        function append( dm: TStringList ): integer;
        procedure insert( index: integer; dm: TStringList );

        /// Returns the stringlist at position index or adds one at this position
        property objects[ index: integer]: TStringList read getObject write setObject; default;
        /// Returns the current position (index) in the list
        property currentPosition: integer read getCurrentIndex;
        /// Returns true if the super list contains no lists, else false
        property isEmpty: boolean read getIsEmpty;
    end
  ;

implementation

//-----------------------------------------------------------------------------
// Construction/destruction
//-----------------------------------------------------------------------------

  /// Creates an empty super list
	constructor TStringSuperList.create();
		begin
   		inherited create( true );
    end
  ;

  /// Deletes the super list and releases resources
  destructor TStringSuperList.destroy();
  	begin
      inherited destroy();
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Typical list functions
//-----------------------------------------------------------------------------

  {*
    Returns the stringlist index at the current position in the super list
    @return Index of current stringlist
  }
  function TStringSuperList.getCurrentIndex(): integer;
  	begin
   		result := _currentIndex;
    end
  ;


  {*
    To check whether the super list contains any stringlists
    @return True if the super list is empty esle false
  }
  function TStringSuperList.getIsEmpty(): boolean;
    begin
      result := (0 = self.Count );
    end
  ;


  {*
    Adds a stringlist to the super list

    @param dm The stringlist to add
    @return The index of the new item
  }
  function TStringSuperList.append( dm: TStringList ): integer;
    begin
      result := inherited Add( dm );
    end
  ;


  {*
    Inserts item at position index in the super list
    @param index Postion at which item should be inserted
    @param item Stringlist to insert
  }
  procedure TStringSuperList.setObject( index: integer; item: TStringList );
    begin
      inherited SetItem( index, item );
    end
  ;


  {*
    Returns stringlist at position index in the super list
    @param index of stringlist to be retrieved
    @return Stringlist object at position index
  }
  function TStringSuperList.getObject( index: integer ): TStringList;
    begin
      result := inherited GetItem( index ) as TStringList;
    end
  ;


  {*
    Returns stringlist at position index in the super list
    @param index of stringlist to be retrieved
    @return Stringlist object at position index
  }
  function TStringSuperList.at( index: integer ): TStringList;
    begin
      result := inherited GetItem( index ) as TStringList;
    end
  ;


  {*
    Inserts dm at position index in the super list
    @param index Postion at which item should be inserted
    @param item Stringlist to insert
  }
  procedure TStringSuperList.insert(index: integer; dm: TStringList);
    begin
      inherited Insert(index, dm);
    end
  ;


  {*
    Returns stringlist at the first position in the super list
    @return Stringlist object at index 0
  }
  function TStringSuperList.first() : TStringList;
    begin
      _currentIndex := 0;
      if( self.Count = 0 ) then
      	result := nil
      else
      	result := getObject( _currentIndex )
      ;
    end
  ;


  {*
    Returns stringlist at the last position in the super list
    @return Stringlist object at bottom of super list
  }
  function TStringSuperList.last() : TStringList;
    begin
      if( self.Count = 0 ) then result := nil
      else
        begin
          _currentIndex := self.Count - 1;
          result := getObject( _currentIndex );
        end
      ;
    end
  ;


  {*
    Returns stringlist at the next position in the super list
    @return Stringlist object at position current + 1
  }
  function TStringSuperList.next() : TStringList;
    begin
      _currentIndex := _currentIndex + 1;
      if( _currentIndex > (self.Count - 1) ) then
      	result := nil
      else
      	result := getObject( _currentIndex )
      ;
    end
  ;


  {*
    Returns stringlist at the current position in the super list
    @return Current stringlist object 
  }
  function TStringSuperList.current() : TStringList;
    begin
      if( _currentIndex > (self.Count - 1) ) then
      	result := nil
      else
      	result := getObject( _currentIndex )
      ;
    end
  ;
//-----------------------------------------------------------------------------

end.
