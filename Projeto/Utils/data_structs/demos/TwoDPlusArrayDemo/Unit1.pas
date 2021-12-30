unit Unit1;

interface

  uses
    Windows,
    Messages,
    SysUtils,
    Variants,
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls,

    SparseArrays
  ;

  type TForm1 = class( TForm )
      btnBuild3DArray: TButton;
      btnDebugArray: TButton;
      btnClear: TButton;
      btnUnsetValue: TButton;
    
      procedure btnBuild3DArrayClick(Sender: TObject);
      procedure btnDebugArrayClick(Sender: TObject);
      procedure btnClearClick(Sender: TObject);
      procedure btnUnsetValueClick(Sender: TObject);

    protected
      _arr: TTwoDPlusSparseArray;

    public
      constructor create( AOwner: TComponent ); override;
      destructor destroy(); override;

    end
  ;

  var
    Form1: TForm1;

implementation

{$R *.dfm}

  uses
    Math,

    DebugWindow
  ;

  constructor TForm1.create( AOwner: TComponent );
    begin
      inherited create( AOwner );
      setDEBUGGING( true );
      randomize();
      _arr := nil;
    end
  ;


  destructor TForm1.destroy();
    begin
      freeAndNil( _arr );

      inherited destroy();
    end
  ;


  procedure TForm1.btnBuild3DArrayClick(Sender: TObject);
    var
      i, j, k: integer;
      x, y, z: integer;
      nVals: integer;
    begin
      _arr := TTwoDPlusSparseArray.create();

      for i := 0 to 9 do
        begin
          x := randomRange( 1, 15 );

          for j := 0 to 9 do
            begin
              y := randomRange( 1, 20 );

              nVals := randomRange( 0, 9 );
              for k := 0 to nVals do
                begin
                  z := randomRange( 1, 1000 );
                  _arr.appendZValue( x, y, z );
                end
              ;
            end
          ;
        end
      ;
    end
  ;


  procedure TForm1.btnDebugArrayClick(Sender: TObject);
    begin
      if( nil <> _arr ) then
        _arr.debug()
      ;
    end
  ;


  procedure TForm1.btnClearClick(Sender: TObject);
    begin
      if( nil <> _arr ) then
        _arr.clear()
      ;
    end
  ;


  procedure TForm1.btnUnsetValueClick(Sender: TObject);
    begin
      if( nil <> _arr ) then
        begin
          dbcout( 'x = 5, y = 5 should be in range.', true );
          if( _arr.hasZArray( 5, 5 ) ) then
            _arr.zArray( 5, 5 ).debug()
          else
            dbcout( '(but it wasn''t.)', true )
          ;

          dbcout( 'x = 5, y = 100 should not be in range', true );
          if( _arr.hasZArray( 5, 100 ) ) then
            dbcout( 'BUT IT WAS!!! and has ' + intToStr( _arr.zArray( 5, 100 ).count ) + ' elements in it.', true )
          else
            dbcout( 'and it wasn''t.', true )
          ;

          dbcout( 'x = 100, y = 5 should not be in range, either', true );
          if( _arr.hasZArray( 100, 5 ) ) then
            dbcout( 'BUT IT WAS!!! and has ' + intToStr( _arr.zArray( 100, 5 ).count ) + ' elements in it.', true )
          else
            dbcout( 'and it wasn''t.', true )
          ;
        end
      ;
    end
  ;

end.
