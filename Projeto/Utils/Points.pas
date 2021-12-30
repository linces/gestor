{*
Points.pas - Creating points, managing lists of points, and calculating inter-point distances
----------
Begin: 2005/01/07
Last revision: $Date: 2012-08-14 19:11:07 $ $Author: areeves $
Version number: $Revision: 1.11 $
Code Documentation Tags: Begin 2009-08-19, Last Revision: 2009-08-19
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
Author: Shaun Case <Shaun.Case@colostate.edu>
--------------------------------------------------
Copyright (C) 2005 - 2012 Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
*)

unit Points;

interface

  uses
    Contnrs
  ;


  type
    /// Coordinates for a point in floating point coordinate system
    RPoint = record
      x: double;  /// X coordinate
      y: double;  /// Y coordinate
    end
  ;


  type
    /// Coordinates for a point in an integer coordinate system
    RIntPoint = record
      x: integer;  /// X coordinate
      y: integer;  /// Y coordinate
    end
  ;


  type
    /// Coordinates for a coordinate system (a spherical coordinate system is implied)
    RLatLon = record
      lat: double;  /// Latitude (Y), locations on, north, or south of the Equator
      lon: double;  /// Longitude (X), locations on, east, or west of the Prime Meridean
    end
  ;


  type
    /// Array for holding coordinates of type RPoint (double data types)
    RPointArray = Array of RPoint;

  type
    /// Array for holding records of type RLatLon
    RLatLonArray = Array of RLatLon;

  type
    /// For holding point coordinates as doubles, the base class for TLatLonPoint
    T2DPoint = class
      protected
        _x: double;   /// X coordinate
        _y: double;   /// Y coordinate

      public
        constructor create(); overload;
        constructor create( x, y: double ); overload; virtual;
        constructor create( const srcPoint: T2DPoint ); overload; virtual;
        destructor destroy(); override;

        procedure assign( const val: T2DPoint );

        procedure debug(); virtual;

        function distanceTo( const pt: T2DPoint ): double; virtual;

        // FIX ME: This was borrowed from TLatLonPoint, but should be fine for simple 2D points, yes?
        function AngleTo( P: T2DPoint ): Double;

        function ssXml(): String; virtual;
        //function asCsv(): string; virtual; // FIX ME: Implement this along with I88n settings for list delimiter and decimal point

        property x: double read _x write _x;  /// Read/Write property for X ccordinate
        property y: double read _y write _y;  /// Read/Write property for Y ccordinate
    end
  ;



  type
    {*
      Designed to be used with lat/lon points, in degrees, with
      x = longitude, y = latitude. Great Circle distances are
      calculated by default, but, if both points are cartesian
      (projected), simple cartesian distance is used.

      This unit is adapted from C++ code, originally written and
      translated into Delphi by Shaun Case for processing of
      latitude/longitude values. (C++ code can be found on this CVS
      server: see points.h/cpp in geometrylib.)
    }
    TLatLonPoint = class( T2DPoint )
      private
      public
        constructor create(); overload;  //{Lat = Lon = 0.0;};
        constructor create( lon: Double; lat: Double ); overload; override;  //{ Lon = x; Lat = y; };
        constructor create( const srcPoint: TLatLonPoint ); overload;

        { Return lat/lon as radians, rather than degrees }
        function rLat(): Double; //{ return ( Lat * ( M_PI/180.0 ) ); };
        function rLon(): Double; //{ return ( Lon * ( M_PI/180.0 ) ); };

        function createProjectedPoint( const projParams: string ): T2DPoint;

        { Calculates great circle distance (spherical model) between this point and P }
        function DistanceTo( P: TLatLonPoint; const nautMiConvFactor: Double = 1.852 ): Double;  reintroduce; overload;
        function DistanceTo( P: TLatLonPoint ): Double;  reintroduce; overload;

        property lon: double read _x write _x;  /// Read/Write property for X ccordinate
        property lat: double read _y write _y;  /// Read/Write property for Y ccordinate
    end
  ;


  type
    {*
      For three-dimensional points (XYZ)
      @comment Fix Me: distance measure assumes the point is cartesian,
      will this always be the case?
    }
    T3DPoint = class( T2DPoint )
      protected
        _z: double;  /// member for elevation

      public
        constructor create( x, y, z: double ); reintroduce;
        destructor destroy(); override;

        procedure debug(); override;

        function distanceTo( const pt: T3DPoint ): double; reintroduce;

        function ssXml(): string; override;

        property z: double read _z write _z;  /// Read/Write property for Z ccordinate
    end
  ;


  type
    /// Container - a list for holding 2-D points, base class for TLatLonPointList
    T2DPointList = class( TObjectList )
      protected
        // Basic list operations
        function getPoint(const Idx: Integer): T2DPoint;
        procedure SetPoint(const Idx: Integer; const Value: T2DPoint);

      public
        constructor create(); overload;
        constructor create( arr: RPointArray ); overload;
        constructor create( list: T2DPointList ); overload;
        destructor destroy(); override;

        procedure assign( arr: RPointArray ); overload;
        procedure assign( list: T2DPointList ); overload;

        function maxY(): double;
        function minY(): double;
        function minX(): double;
        function maxX(): double;

        function avgXInterval(): double;
        function avgYInterval(): double;

        function createXYRecordArray(): RPointArray;

        procedure prepend( dm: T2DPoint );
        function append( dm: T2DPoint ): integer;
        procedure removeAt( const idx: integer );
        function at( const idx: integer ): T2DPoint;
        function first(): T2DPoint;
        function last(): T2DPoint;
        procedure insert( const index: integer; dm: T2DPoint );

        procedure debug();

        property  Point[const index: Integer]: T2DPoint read getPoint write SetPoint; default; /// Accessor for points
    end
  ;


  type
    /// Container for points of Longitude-Latitude coordinates
    TLatLonPointList = class( T2DPointList )
      protected
        // Basic list operations
        procedure setPoint( index: integer; item: TLatLonPoint );
        function getPoint( index: integer ): TLatLonPoint;

      public
        function createProjectedPointList( const projParams: string ): T2DPointList;

        // Basic list operations
        //----------------------
        function at( const index: integer ): TLatLonPoint;
    end
  ;


  type
    /// Container for 3-D points
    T3DPointList = class( TObjectList )
      protected
        // Basic list operations
        function getPoint(const Idx: Integer): T3DPoint;
        procedure SetPoint(const Idx: Integer; const Value: T3DPoint);

      public
        function maxZ(): double;
        function minZ(): double;
        function avgZInterval(): double;

        function at( const idx: integer ): T3DPoint;

        property  Point[const Idx: Integer]: T3DPoint read GetPoint write SetPoint; default; /// Accessor for points
    end
  ;

  function pointDistanceSquared( const p1, p2: RPoint ): double;
  function pointDistance( const p1, p2: RPoint ): double;

  // Debugging functions
  procedure rPointArrayDebug( arr: RPointArray );

implementation

  uses
    SysUtils,
    Math,

    Proj4,
    MyStrUtils,
    DebugWindow
  ;


  const
    DBSHOWMSG: boolean = false; /// Set to true to enable debugging messages for this unit.
    DEG_TO_RAD = 0.0174532925;  /// Units conversion from degrees to radians


//-----------------------------------------------------------------------------
// Points in two dimensions
//-----------------------------------------------------------------------------

  /// Create a 2D point, setting X and Y to 0.0
  constructor T2DPoint.create();
    begin
      inherited create();
      self.x := 0.0;
      self.y := 0.0;
    end
  ;

  {*
    Create a 2D point at position X,Y
    @param x Longitude
    @param y Latitude
  }
  constructor T2DPoint.create( x, y: double );
    begin
      inherited create();
      self.x := x;
      self.y := y;
    end
  ;

  {*
    Makes a duplicate of srcPoint
    @param srcPoint 2D point to copy
  }
  constructor T2DPoint.create( const srcPoint: T2DPoint );
    begin
      inherited create();
      self.x := srcPoint.x;
      self.y := srcPoint.y;
    end
  ;

  /// Free up memory
  destructor T2DPoint.destroy();
    begin
      inherited destroy();
    end
  ;


  procedure T2DPoint.assign( const val: T2DPoint );
    begin
      self.x := val.x;
      self.y := val.y;
    end
  ;


  /// Sends the values of X and Y to dbcout
  procedure T2DPoint.debug();
    begin
      dbcout( 'Point ( ' + usFloatToStr( x ) + ', ' + usFloatToStr( y ) + ' )', true );
    end
  ;


  {*
    Returns the distance between two cartesian points
    @param pt Another point
    @return Distance from self to pt
    @comment This method is intended for coordinates projected in cartesian space
    and distance is based on the Pythagorean Theorem
    @comment Units of distance depends on the reference scale of the cartesian space
  }
  function T2DPoint.distanceTo( const pt: T2DPoint ): double;
    begin
      if( ( self.x = pt.x ) and ( self.y = pt.y ) ) then
        result := 0.0
      else
        result := Sqrt( Power( (self.x - pt.x), 2 ) + Power( ( self.y - pt.y ), 2 ) )
      ;
    end
  ;


  ///////////////////////////////
  //
  //  Algorithm taken from "Algorgithms" By Robert Sedgewick, (c) 1983
  //  Can be faster than using cos() functions...
  //
  // FIX ME: This should be fine for simple 2D points, yes?

  {*
    Returns the angle between self and point P
    @param pt Another point
    @return Angle between the points in degrees
  }
  function T2DPoint.AngleTo( P: T2DPoint ): Double;
    var
      dx, dy, ax, ay, t, ret_val: Double;
    begin
      dx := self.x - p.x;
      ax := abs( dx );
      dy := self.y - p.y;
      ay := abs( dy );

      if ( ( dx = 0.0 ) AND ( dy = 0.0 ) ) then
        t := 0.0
      else
        t := dy / ( ax + ay );

      if ( dx < 0.0 ) then
        t := 2.0 - t
      else
        if ( dy < 0.0 ) then
          t := 4 + t;

      ret_val := t * 90.0;

      result := ret_val;
    end
  ;

  {*
    Wraps X Y coordinates in XML data element like:
    <point>
      <x> 0.0 </x>
      <y> 0.0 </y>
    </point>

    @return XML 2D point data element
  }
  function T2DPoint.ssXml(): String;
    var
      ret_val: String;
    begin
      ret_val := '<point>' + endl;
      ret_val := ret_val + '  <x> ' + usFloatToStr( x ) + ' </x>' + endl;
      ret_val := ret_val + '  <y> ' + usFloatToStr( y ) + ' </y>' + endl;
      ret_val := ret_val + '</point>' + endl;
      result := ret_val;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Lat/lon points
//-----------------------------------------------------------------------------

  /// Creates a Lat Lon point, setting X and Y to 0.0
  constructor TLatLonPoint.create();
    begin
      inherited create();
    end
  ;


  {*
    Makes a duplicate of point srcPoint
    @param srcPoint Point to be copied
  }
  constructor TLatLonPoint.create( const srcPoint: TLatLonPoint );
    begin
      inherited create();

      Lat := srcPoint.Lat;
      Lon := srcPoint.Lon;
    end
  ;


  {*
    Create a LatLon point at position x,y
    @param x Longitude
    @param y Latitude
    @comment coordinate space assumed spherical (not projected)
  }
  constructor TLatLonPoint.create( lon: Double; lat: Double );
    begin
      inherited create( lon, lat );
    end
  ;


  {*
    Returns latitude as radians
    @return Lat coordinate value as radians
  }
  function TLatLonPoint.rLat(): Double;
    begin
      result := ( Lat * DEG_TO_RAD );
    end
  ;


  {*
    Returns longitude as radians
    @return Lon coordinate value as radians
  }
  function TLatLonPoint.rLon(): Double;
    begin
      result := ( Lon * DEG_TO_RAD );
    end
  ;


  {*
    Carries out cartographic projection of the point using proj.4 library and
    the indicated proj.4 parameters.  See proj.4 documentation for more details on
    proper formatting of the parameter string.  Note that, for a lot of points,
    it will be a lot faster to use TLatLonPointList.createProjectedPointList().

    @param projParams proj.4 parameter string
    @return a newly created instance of T2DPoint with x, y values as projected
  }
  function TLatLonPoint.createProjectedPoint( const projParams: string ): T2DPoint;
    var
      proj4: TProj4;
    begin
      proj4 := nil;

      try
        try
          proj4 := TProj4.create( projParams, true );
          result := proj4.createPjFwdT( self, true );
        except
          freeAndNil( result );
          result := nil;
        end;
      finally
        freeAndNil( proj4 );
      end;
    end
  ;


  {*
    This function utilizes Great Circle Distance calculations for
    distances using spherical coordinates (for example latitude/longitude) based on the
    Spherical Law of Cosines and the Pythagorean Theorem for cartesian coordinates

    At some point in the future perhaps the Eliptical version will be added.
    Note:  the Eliptical version would require knowledge of the global location
    of points so that the appropriate one of eleven flattening
    methods can be used in the calculation.  Just using the North
    American WGS84 flattening calculation is not appropriate in an
    Eliptical model, which may be used on data from other parts of
    the the continent or world.

    @param P Point to calculate distance to
    @param nautMiConvFactor Scale conversion factor from nautical miles to another distance unit;
    if the points are in a spherical coordinate system (This parameter does not apply to cartesian points):
     a. Setting nautMiConvFactor to 1.852 returns the distance in kilometers
     b. Setting nautMiConvFactor to 1 returns the distance in nautical miles
    @return Distance between self and P
    @throws Raises exception if both points are not using the same
    @throws Raise exception if the points are geographic and nautMiConvFactor is 0.
  }
  function TLatLonPoint.DistanceTo( P: TLatLonPoint; const nautMiConvFactor: Double = 1.852): Double;
    var  //const rndToPlace: integer = 6;
    Lat1, Lon1, Lat2, Lon2: Double;
      begin
        Lat1 := self.rLat();
        Lon1 := self.rLon();
        Lat2 := P.rLat();
        Lon2 := P.rLon();

        if( ( Lat1 = Lat2 ) AND ( Lon1 = Lon2 ) ) then
          result := 0.0
        else
          begin
            result := ArcCos( sin(Lat1) * sin(Lat2) + cos(Lat1) * cos(Lat2) * cos(Lon1 - Lon2) );
            if ( nautMiConvFactor <> 0 ) then
              // The term below is the radius of earth at the equator in nuatical miles;
              // it must be multipled by a scaling factor (nautMiConvFactor) to output in a different unit.
              result := result * (( 180.0 * 60.0 / Pi ) * nautMiConvFactor )
            else
              begin
                raise exception.Create( 'nautMiConvFactor = 0 negates a real distance in TLatLonPoint.DistanceTo() ');
                result := 0.0;
              end
            ;
          end
        ;
    end
  ;


  {*
    This function utilizes Great Circle Distance calculations for
    distances using spherical coordinates (for example latitude/longitude) based on the
    Spherical Law of Cosines and the Pythagorean Theorem for cartesian coordinates

    At some point in the future perhaps the Eliptical version will be added.
    Note:  the Eliptical version would require knowledge of the global location
    of points so that the appropriate one of eleven flattening
    methods can be used in the calculation.  Just using the North
    American WGS84 flattening calculation is not appropriate in an
    Eliptical model, which may be used on data from other parts of
    the the continent or world.

    @param P Point to calculate distance to
    @return Distance between self and P in kilometers
  }
  function TLatLonPoint.DistanceTo( P: TLatLonPoint ): Double;
    var 
    Lat1, Lon1, Lat2, Lon2: Double;
    begin
      Lat1 := self.rLat();
      Lon1 := self.rLon();
      Lat2 := P.rLat();
      Lon2 := P.rLon();

      if( ( Lat1 = Lat2 ) AND ( Lon1 = Lon2 ) ) then
        result := 0.0
      else
        begin
          result := ArcCos( sin(Lat1) * sin(Lat2) + cos(Lat1) * cos(Lat2) * cos(Lon1 - Lon2) );
          (*
            (180.0 * 60.0 / Pi) = 3,438 nmi is the radius of the earth in nautical miles.
            The accepted scaling factor  from nautical miles to kilometers is 1.852.
            Derived as: (6367 km / (180.0 * 60.0 / Pi)) = 1.852.
            Of course, 6367 could be entered directly. The formula below is
            consistent with the other overloaded method.
          *)
          result := result * (( 180.0 * 60.0 / Pi ) * 1.852);
        end
      ;
    end
  ;

//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Points in three dimensions
//-----------------------------------------------------------------------------

  {*
    Creates a 3D point object

    @param x X Coordinate (could be Longitude)
    @param y Y Coordinate (could be Latitude)
    @param z Z Coordinate (could be Depth or Elevation)
  }
  constructor T3DPoint.Create( x, y, z: double );
    begin
      inherited create( x, y );
      self.z := z;
    end
  ;

  /// Free memory
  destructor T3DPoint.destroy();
    begin
      inherited destroy();
    end
  ;

  /// Outputs to dbcout the values of x, y, z
  procedure T3DPoint.debug();
    begin
      dbcout( '3D point (%f, %f, %f)', [x, y, z], true );
    end
  ;

  {*
    Returns the distance between two points
    @param pt Another point
    @return Distance from self to pt
    @comment This method is for points in a cartesian coordinate system
    and is based on the Pythagorean Theorem
    @comment Units of distance depends on the reference scale of cartesian space
  }
  function T3DPoint.distanceTo( const pt: T3DPoint ): double;
    begin
      if( ( self.x = pt.x ) and ( self.y = pt.y ) and ( self.z = pt.z ) ) then
        result := 0.0
      else
        result := Sqrt( Power( (self.x - pt.x), 2 ) + Power( ( self.y - pt.y ), 2 ) + Power( ( self.z - pt.z ), 2 ) )
      ;
    end
  ;


  {*
    Wraps X Y coordinates in XML data element like:
    <point>
      <x> 0.0 </x>
      <y> 0.0 </y>
      <z> 0.0 </z>
    </point>

    @return XML 2D point data element
  }
  function T3DPoint.ssXml(): String;
    var
      ret_val: String;
    begin
      ret_val := '<point>' + endl;
      ret_val := ret_val + '  <x> ' + usFloatToStr( x ) + ' </x>' + endl;
      ret_val := ret_val + '  <y> ' + usFloatToStr( y ) + ' </y>' + endl;
      ret_val := ret_val + '  <z> ' + usFloatToStr( z ) + ' </z>' + endl;
      ret_val := ret_val + '</point>' + endl;
      result := ret_val;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Lists of 2D points
//-----------------------------------------------------------------------------

  /// Create an empty 2D point list
  constructor T2DPointList.create();
    begin
      inherited create( true );
    end
  ;

  constructor T2DPointList.create( list: T2DPointList );
    var
      i: integer;
    begin
      inherited create( true );

      for i := 0 to list.Count - 1 do
        self.append( T2DPoint.create( list.at(i) ) )
      ;
    end
  ;

  {*
    Create a 2D point list filled with objects from arr
    @param a array of 2d points
  }
  constructor T2DPointList.create( arr: RPointArray );
    begin
      inherited create( true );
      assign( arr );
    end
  ;


  {*
    Free resources
    @comment This list owns its objects, so they will be automatically deleted.
  }         
  destructor T2DPointList.destroy();
    begin
      inherited destroy();
    end
  ;


  {*
    Append a an array of 2D point to the list from arr
    @param a array of 2d points
  }
  procedure T2DPointList.assign( arr: RPointArray );
    var
      i: integer;
    begin
      self.Clear();
      
      for i := 0 to length( arr ) - 1 do
        self.Append( T2DPoint.create( arr[i].x, arr[i].y ) )
      ;
    end
  ;


  procedure T2DPointList.assign( list: T2DPointList );
    var
      i: integer;
    begin
      self.Clear();

      for i := 0 to list.Count - 1 do
        self.Append( T2DPoint.create( list.at(i) ) )
      ;
    end
  ;


  {*
    Returns a point form the list at idx

    @param idx List index, zero-based
    @return 2D point object
  }
  function T2DPointList.getPoint(const Idx: Integer): T2DPoint;
    begin
      result := inherited getItem( idx ) as T2DPoint;
    end
  ;


  {*
    Places a point in the list at location Idx,
    if something was already there it just got replaced

    @param Idx Index location
    @param 2D point object
  }
  procedure T2DPointList.SetPoint(const Idx: Integer; const Value: T2DPoint);
    begin
      inherited setItem( idx, value );
    end
  ;


  {*
    Returns the 2D point object at location idx of the list

    @param idx List index value
    @return 2D object
  }
  function T2DPointList.at( const idx: integer ): T2DPoint;
    begin
      result := inherited GetItem( idx ) as T2DPoint;
    end
  ;


  {*
    Returns the first point object in the list
    @return 2D point object
  }
  function T2DPointList.first(): T2DPoint;
    begin
      result := inherited first() as T2DPoint;
    end
  ;


  {*
    Returns the last point object in the list
    @return 2D point object
  }
  function T2DPointList.last(): T2DPoint;
    begin
      result := inherited last() as T2DPoint;
    end
  ;


  {*
    Add dm to the top of the list
    @param 2D point object
  }
  procedure T2DPointList.prepend( dm: T2DPoint );
    begin
      inherited insert( 0, dm );
    end
  ;


  {*
    Add dm to the bottom of the list
    @param 2D point object
    @return The index value for dm
  }
  function T2DPointList.append( dm: T2DPoint ): integer;
    begin
      result := inherited Add( dm );
    end
  ;


  {*
    Add dm to the list at location index
    @param index Location to insert dm
    @param 2D point object
  }
  procedure T2DPointList.insert( const index: integer; dm: T2DPoint);
    begin
      inherited Insert(index, dm);
    end
  ;


  {*
    Delete the 2D point object at location index
    @param idx List location to delete object
  }
  procedure T2DPointList.removeAt( const idx: integer );
    begin
      inherited delete( idx );
    end
  ;


  {*
    Retrieves value of largest Y (e.g. latitude) coordinate in the list
    @return Max Y value
  }
  function T2DPointList.maxY(): double;
    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.at(0).y;

          for i := 1 to self.Count - 1 do
            if( self.at(i).y > result ) then result := self.at(i).y
          ;
        end
      ;
    end
  ;


  {*
    Retrieves value of smallest Y (e.g. latitude) coordinate in the list
    @return Min Y value
  }
  function T2DPointList.minY(): double;
    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.at(0).y;

          for i := 1 to self.Count - 1 do
            if( self.at(i).y < result ) then result := self.at(i).y
          ;
        end
      ;
    end
  ;


  {*
    Retrieves value of smallest X (e.g. longitude) coordinate in the list
    @return Min X value
  }
  function T2DPointList.minX(): double;
    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.at(0).x;

          for i := 1 to self.Count - 1 do
            if( self.at(i).x < result ) then result := self.at(i).x
          ;
        end
      ;
    end
  ;


  {*
    Retrieves value of largest X (e.g. longitude) coordinate in the list
    @return Max X value
  }
  function T2DPointList.maxX(): double;
    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.at(0).x;

          for i := 1 to self.Count - 1 do
            if( self.at(i).x > result ) then result := self.at(i).x
          ;
        end
      ;
    end
  ;


  {*
    Creates RPointArray and copies the coordinates of each 2D point to a new R Point object in the array
    @return RPointArray holding objects containing the coordinates of self
  }
  function T2DPointList.createXYRecordArray(): RPointArray;
    var
      recordArray: RPointArray;
      i: integer;
    begin
      setLength( recordArray, 0 );

      for i := 0 to self.Count - 1 do
        begin
          setLength( recordArray, length( recordArray ) + 1 );
          recordArray[High(recordArray)].X := self.at(i).x;
          recordArray[High(recordArray)].Y := self.at(i).y;
        end
      ;

      result := recordArray;
    end
  ;


  {*
    Calculates from it's point objects the average value of the X coordinate
    @return Average value of X
  }
  function T2DPointList.avgXInterval(): double;
    var
      interval: double;
      sum: double;
      i: integer;
    begin
      sum := 0.0;

      if( 2 > self.Count ) then
        result := NaN
      else
        begin
          for i := 1 to self.Count - 1 do
            begin
              interval := self.at(i).x - self.at(i-1).x;
              sum := sum + interval;
            end
          ;

          result := sum / (self.Count - 1);
        end
      ;

    end
  ;


  {*
    Calculates from it's point objects the average value of the Y coordinate
    @return Average value of Y
  }
  function T2DPointList.avgYInterval(): double;
    var
      interval: double;
      sum: double;
      i: integer;
    begin
      sum := 0.0;

      if( 2 > self.Count ) then
        result := NaN
      else
        begin
          for i := 1 to self.Count - 1 do
            begin
              interval := self.at(i).y - self.at(i-1).y;
              sum := sum + interval;
            end
          ;

          result := sum / (self.Count - 1);
        end
      ;

    end
  ;


  {*
    Outputs to dbcout the X and Y values for each point
  }
  procedure T2DPointList.debug();
    var
      i: integer;
    begin
      for i := 0 to self.Count - 1 do
        self.at( i ).debug()
      ;
    end
  ;
//-----------------------------------------------------------------------------



//------------------------------------------------------------------------------
// List of LatLon points
//------------------------------------------------------------------------------
  {*
    Carries out cartographic projection of all points in the list using proj.4
    library and the indicated proj.4 parameters.  See proj.4 documentation for
    more details on proper formatting of the parameter string.

    @param projParams proj.4 parameter string
    @return a newly created instance of T2DPointList with x, y values as projected
  }
  function TLatLonPointList.createProjectedPointList( const projParams: string ): T2DPointList;
    var
      proj4: TProj4;
      i: integer;
      llPt: TLatLonPoint;
      newPt: T2DPoint;
    begin
      proj4 := nil;
      result := nil;

      try
        try
          proj4 := TProj4.create( projParams, true );
          result := T2DPointList.create();

          for i := 0 to self.Count - 1 do
            begin
              llPt := self.at( i );
              newPt :=  proj4.createPjFwdT( llPt, true );
              result.append( newPt );
            end
          ;
        except
          freeAndNil( result );
          result := nil;
        end;
      finally
        freeAndNil( proj4 );
      end;
    end
  ;


  {*
    Places a point in the list at location index,
    if something was already there it just got replaced

    @param index location in list
    @param LatLon point object
  }
  procedure TLatLonPointList.setPoint( index: integer; item: TLatLonPoint );
    begin
      inherited SetItem( index, item );
    end
  ;


  {*
    Returns a point form the list at index

    @param index List index, zero-based
    @return LatLon point object
  }
  function TLatLonPointList.getPoint( index: integer ): TLatLonPoint;
    begin
      result := inherited GetItem( index ) as TLatLonPoint;
    end
  ;


  {*
    Returns the point object at location index of the list

    @param index List index value
    @return LatLon object
  }
  function TLatLonPointList.at( const index: integer ): TLatLonPoint;
    begin
      result := inherited GetItem( index ) as TLatLonPoint;
    end
  ;
//------------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Lists of 3D points
//-----------------------------------------------------------------------------
  {*
    Returns the point object at location idx of the list

    @param idx List index value
    @return 3D object
  }
  function T3DPointList.at( const idx: integer ): T3DPoint;
    begin
      result := inherited GetItem( idx ) as T3DPoint;
    end
  ;


  {*
    Returns a point form the list at Idx

    @param Idx List index, zero-based
    @return 3D point object
  }
  function T3DPointList.getPoint(const Idx: Integer): T3DPoint;
    begin
      result := self.at( idx );
    end
  ;


  {*
    Places a point in the list at location Idx,
    if something was already there it just got replaced

    @param Idx location in list
    @param 3D point object
  }
  procedure T3DPointList.SetPoint(const Idx: Integer; const Value: T3DPoint);
    begin
      inherited setItem( idx, value );
    end
  ;



  {*
    Retrieves value of largest X (e.g. longitude) coordinate in the list
    @return Max X value
  }
  function T3DPointList.maxZ(): double;

    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.Point[0].z;

          for i := 1 to self.Count - 1 do
            if( self.Point[i].z > result ) then result := self.Point[i].z
          ;
        end
      ;
    end
  ;


  {*
    Retrieves value of smallest Z coordinate in the list
    @return Min Z value
  }
  function T3DPointList.minZ(): double;
    var
      i: integer;
    begin
      if( self.Count < 1 ) then
        result := NaN
      else
        begin
          result := self.Point[0].z;

          for i := 1 to self.Count - 1 do
            if( self.Point[i].z < result ) then result := self.Point[i].z
          ;
        end
      ;
    end
  ;


  {*
    Calculates from it's point objects the average value of the Z coordinate
    @return Average value of XZ
  }
  function T3DPointList.avgZInterval(): double;
    var
      interval: double;
      sum: double;
      i: integer;
    begin
      sum := 0.0;

      if( 2 > self.Count ) then
        result := NaN
      else
        begin
          for i := 1 to self.Count - 1 do
            begin
              interval := self.Point[i].z - self.Point[i-1].z;
              sum := sum + interval;
            end
          ;

          result := sum / (self.Count - 1);
        end
      ;

    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Distance calculations
//-----------------------------------------------------------------------------
  {*
    Returns the squared distance between two cartesian points,
    i.e., the square of the hypotenuse of a right triangle.

    @param p1 Point 1
    @param p2 Point 2
    @return C^2, the squared distance of the hypotenuse
  }
  function pointDistanceSquared( const p1, p2: RPoint ): double;
    var
      aSquared, bSquared, cSquared: double;
    begin
      aSquared := power( ( p1.x - p2.x ), 2 );
      bSquared := power( ( p1.y - p2.y ), 2 );
      cSquared := aSquared + bSquared;

      result := cSquared;
    end
  ;


  {*
    Returns the distance between two cartesian points, based on the Pythagorean Theorem

    @param p1 Point 1
    @param p2 Point 2
    @return Distance between points p1 and p2
    @comment This method is intended for coordinates projected in cartesian space
    @comment Units of distance is that of the cartesian space
  }
  function pointDistance( const p1, p2: RPoint ): double;
    begin
      result := sqrt( pointDistanceSquared( p1, p2 ) );
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Debugging functions
//-----------------------------------------------------------------------------
  {*
    Displays debugging output for the specified RPointArray
    @param arr The point array
  }
  procedure rPointArrayDebug( arr: RPointArray );
    var
      i: integer;
    begin
      dbcout( '--- Begin rPointArrayDebug', true );
      for i := 0 to length( arr ) - 1 do
        dbcout( 'x: ' + dbFloatToStr( arr[i].x ) + ', y: ' + dbFloatToStr( arr[i].y ), true )
      ;
      dbcout( '--- Done.', true );
    end
  ;

//-----------------------------------------------------------------------------

end.
 