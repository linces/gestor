unit SparseArrays;

interface

  uses
    QIntegerMaps,
    QVectors
  ;

  type TOneDPlusSparseArray = class( TQIntegerObjectMap )
    public
      constructor create(); override;
      destructor destroy(); override;

      function value( const key: integer ): TQIntegerVector; reintroduce;
      procedure insert( const key: integer; const val: TQIntegerVector ); reintroduce;
      function itemAtIndex( const idx: integer ): TQIntegerVector; reintroduce;

      property  Item[const Key: integer]: TQIntegerVector read value write insert; default;
    end
  ;


  type TTwoDPlusSparseArray = class( TQIntegerObjectMap )
    public
      constructor create(); override;
      destructor destroy(); override;

      function arrayValue( const x, y, z: integer; hasValue: pboolean = nil ): integer;
      //procedure setValue( const x, y, z: integer; const value: integer );

      procedure appendZValue( const x, y: integer; const val: integer );

      { Is ther a z (depth) array at the indicated position? }
      function hasZArray( const x, y: integer ): boolean;

      { How many elements are in the z array? }
      function depth( const x, y: integer ): integer;

      { Return the array in the Z (depth) dimension. }
      function zArray( const x, y: integer ): TQIntegerVector;

      procedure clear();

      procedure debug();

      function value( const key: integer ): TOneDPlusSparseArray; reintroduce;
      procedure insert( const key: integer; const val: TOneDPlusSparseArray ); reintroduce;
      function itemAtIndex( const idx: integer ): TOneDPlusSparseArray; reintroduce;

      property  Item[const Key: integer]: TOneDPlusSparseArray read value write insert; default;
    end
  ;

implementation

  uses
    SysUtils,
    
    DebugWindow,
    MyStrUtils
  ;
  

  constructor TOneDPlusSparseArray.create();
    begin
      inherited create();
    end
  ;


  destructor TOneDPlusSparseArray.destroy();
    begin
      self.deleteValues();
      inherited destroy();
    end
  ;


  function TOneDPlusSparseArray.value( const key: integer ): TQIntegerVector;
    begin
      result := inherited value( key ) as TQIntegerVector;
    end
  ;


  procedure TOneDPlusSparseArray.insert( const key: integer; const val: TQIntegerVector );
    begin
      inherited insert( key, ( val as TObject ) );
    end
  ;


  function TOneDPlusSparseArray.itemAtIndex( const idx: integer ): TQIntegerVector;
    begin
      result := inherited itemAtIndex( idx ) as TQIntegerVector;
    end
  ;

  
  constructor TTwoDPlusSparseArray.create();
    begin
      inherited create();
    end
  ;


  destructor TTwoDPlusSparseArray.destroy();
    begin
      self.deleteValues();
      inherited destroy();
    end
  ;


  function TTwoDPlusSparseArray.arrayValue( const x, y, z: integer; hasValue: pboolean = nil ): integer;
    var
      found: boolean;
    begin
      result := 0;

      if( nil <> self[x] ) then
        begin
          if( nil <> self[x][y] ) then
            begin
              found := true;
              result := self.value(x).value(y).at(z);
            end
          else
            found := false
          ;
        end
      else
        found := false
      ;

      if( nil <> hasValue ) then
        hasValue^ := found
      ;
    end
  ;


  procedure TTwoDPlusSparseArray.appendZValue( const x, y: integer; const val: integer );
    begin
      if not( self.qHasKey(x) ) then
        self[x] := TOneDPlusSparseArray.create()
      ;

      if( not( self.value(x).qHasKey(y) ) ) then
        self[x][y] := TQIntegerVector.create()
      ;

      self[x][y].append( val );
    end
  ;


  function TTwoDPlusSparseArray.hasZArray( const x, y: integer ): boolean;
    begin
      if( not( self.qHasKey(x) ) ) then
        result := false
      else if( not( self[x].qHasKey(y) ) ) then
        result := false
      else if( nil = self[x][y] ) then
        result := false
      else
        result := true
      ;
    end
  ;


  function TTwoDPlusSparseArray.depth( const x, y: integer ): integer;
    begin
      if( not( self.qHasKey(x) ) ) then
        result := 0
      else if( not( self[x].qHasKey(y) ) ) then
        result := 0
      else if( nil = self[x][y] ) then
        result := 0
      else
        result := self[x][y].count
      ;
    end
  ;


  function TTwoDPlusSparseArray.zArray( const x, y: integer ): TQIntegerVector;
    begin
      if( not( self.qHasKey(x) ) ) then
        result := nil
      else if( not( self[x].qHasKey(y) ) ) then
        result := nil
      else
        result := self[x][y]
      ;
    end
  ;


  procedure TTwoDPlusSparseArray.clear();
    begin
      self.deleteValues();
    end
  ;


  procedure TTwoDPlusSparseArray.debug();
    var
      i, j, k: integer;
    begin
      dbcout( '=========== Start array debug', true );

      for i := 0 to self.count - 1 do
        begin
          dbcout( 'X dimension ' + intToStr( self.keyAtIndex( i ) ) + ':', true );

          for j := 0 to self.itemAtIndex(i).count - 1 do
            begin
              dbcout( '  Y dimension ' + intToStr( self.itemAtIndex(i).keyAtIndex(j) ) + ':', true );

              dbcout( '    Z depth: ' + intToStr( self.itemAtIndex(i).itemAtIndex(j).count ), true );

              if( 0 < self.itemAtIndex(i).itemAtIndex(j).count ) then
                begin
                  for k := 0 to self.itemAtIndex(i).itemAtIndex(j).count - 1 do
                    begin
                      dbcout( '      ' + intToStr( self.arrayValue( self.keyAtIndex(i), self.itemAtIndex(i).keyAtIndex(j), k ) ), true );
                    end
                  ;
                end
              ;
            end
          ;
        end
      ;

      dbcout( '=========== Done.' + endl + endl, true );
    end
  ;


  function TTwoDPlusSparseArray.value( const key: integer ): TOneDPlusSparseArray;
    begin
      result := inherited value( key ) as TOneDPlusSparseArray;
    end
  ;


  procedure TTwoDPlusSparseArray.insert( const key: integer; const val: TOneDPlusSparseArray );
    begin
      inherited insert( key, val as TObject );
    end
  ;


  function TTwoDPlusSparseArray.itemAtIndex( const idx: integer ): TOneDPlusSparseArray;
    begin
      result := inherited itemAtIndex(idx) as TOneDPlusSparseArray;
    end
  ;

end.
