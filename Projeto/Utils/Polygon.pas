{*
Polygon.pas  - Creating and calculating metrics about polygons
-----------
Begin: (2007/04/10 as C Code), converted to Delphi:  2007/07/06
Last revision: $Date: 2009-08-24 15:53:57 $ $Author: rhupalo $
Version number: $Revision: 1.3 $
Code Documentation Tags: Begin 2009-08-20, Last Revision: 2009-08-23
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Shaun Case <Shaun.Case@colostate.edu>
--------------------------------------------------
Copyright (C) 2006 - 2009 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

    This unit contains some useful functionality to enable geometric
    calculations to be accomplished on polygons.  It further allows
    polygons to be stored, internally in a representation, which
    enables GIS functionality within a program using this unit.

    Sorting of vertices in unordered polygon vertex collections does
    not rely on distance calculations, but uses angle calculations
    instead. A great degree of accuracy in angle is not needed for
    this functionality. Consequently, the method used assumes
    coordinates are cartesian. Typically, however, data read from
    existing SHP files, or other such files used in GIS systems,
    will be ordered by vertex already, since most GIS programs can
    notwill not reorder verticies in data files.

    Therefore, if you know that your data contains ordered vertices,
    do not use the getSCPVertices() function, but rather the
    getOrigVertices() function in the Polygon Object, which will
    preserve their original order.

    This unit is adapted from C++ code, originally written by Shaun
    Case for processing of latitude/longitude values. (C++ code can
    be found on this CVS server: see polygons.h/cpp in geometrylib.)
}

(*
    Documentation generation tags begin with {* or ///
    Replacing these with (* or // foils the documentation generator
*)


unit Polygon;

interface


  uses
    Math,
    Contnrs,
    Points
  ;

  type
    /// Holds the vertices and other attributes of a polygon
    TPolygon = class( TObject )
      protected
        _vertices:    T2DPointList;  /// vertices in original order
        _scpVertices: T2DPointList;  /// vertices sorted
        _scpCentroid: T2DPoint;      /// centroid of sorted polygon
        _name:        String;        /// polygon name

        procedure sortSCP();
        function PolygonArea( P: T2DPointList ): Double;
        function PolygonCentroid( P: T2DPointList ): T2DPoint;
        procedure setName( _newName:String );

      public
        constructor create( Vertices: T2DPointList ); overload;
        constructor create(); overload;
        constructor create( _myPolygon: TPolygon ); overload;  // Copy Constructor

        destructor destroy(); override;

        function centroid(): T2DPoint;
        function ScpCentroid(): T2DPoint; //{ return _scpCentroid; };

        { See comment above }
        function getSCPVertices(): T2DPointList; //{ return _scpVertices; };
        function getOrigVertices(): T2DPointList; //{ return _vertices; };

        // FIX ME: What does this function do?  See comment RE destructors.
        //procedure exchange();

        function ssXml(): String;

        property Name:String read _name write setName;
    end
  ;


implementation

  uses
    SysUtils,
    MyStrUtils,
    debugWindow
  ;

  {*
    Creates a polygon from a list of 2D points
    @param Vertices source - a 2D point list
  }
  constructor TPolygon.create( Vertices: T2DPointList );
    begin
      inherited create();

      _name := '';
      _vertices := T2DPointList.create( Vertices );
      _scpVertices := T2DPointList.create();
      _scpCentroid := T2DPoint.create();
      sortSCP();
    end
  ;


  {*
    Creates an empty polygon
  }
  constructor TPolygon.create();
    begin
      inherited create();

      _name := '';
      _vertices := T2DPointList.create();
      _scpCentroid := T2DPoint.create();
      _scpVertices := T2DPointList.create();
    end
  ;

  {*
    Duplicates a polygon from another polygon
    @param _myPolygon source polygon
  }
  constructor TPolygon.create( _myPolygon: TPolygon );
    begin
      inherited create();

      _name := _myPolygon.Name;
      _vertices := T2DPointList.create( _myPolygon._vertices );
      _scpVertices := T2DPointList.create( _myPolygon._scpVertices );
      _scpCentroid := T2DPoint.create( _myPolygon._scpCentroid );
    end
  ;


  /// Frees private member resources
  destructor TPolygon.destroy();
    begin
      freeAndNil( _vertices );
      freeAndNil( _scpVertices );
      freeAndNil( _scpCentroid );

      inherited destroy();
    end
  ;

  {*
    Setter to access private member _name
    @param _newName A name to give this polygon
  }
  procedure TPolygon.setName( _newName: String );
    begin
      _name := _newName;
    end
  ;


  (*
  procedure TPolygon.exchange();
    begin
      // FIX ME: Does something need to be freed here?
      _vertices := _scpVertices;
      _scpVertices := T2DPointList.create();
      _scpVertices.clear();
      sortSCP();
    end
  ;
  *)


  {*
    Returns the vertices of the polgon in a sorted order
    @return Sorted polygon vertice points
  }
  function TPolygon.getSCPVertices(): T2DPointList;
    begin
      result := _scpVertices;
    end
  ;


  function TPolygon.centroid(): T2DPoint;
    begin
      result := PolygonCentroid( self._vertices );
    end
  ;


  {*
    Returns the centroid location point of the sorted polygon
    @return polygon centroid point
  }
  function TPolygon.ScpCentroid(): T2DPoint;
    begin
      result := _scpCentroid;
    end
  ;


  {*
    Wraps original and sorted vertice versions of the polygon in XML tags
    @return XML encoded polygon vertices and whether the coordinate space is cartesian
  }
  function TPolygon.ssXml(): String;
    var
      ret_val: String;
      i: Integer;
      //cartesian: boolean;
    begin
      ret_val := '<polygon name="' + _name + '" cartesian="false">' + endl;
      if ( assigned( _vertices ) ) then
        begin
          (*
          if( _vertices.at(0) is TLatLonPoint ) then
            cartesian := ( _vertices.at(0) as TLatLonPoint ).isCartesian
          else
            cartesian := true
          ;
          *)

          //ret_val := '<polygon name="' + _name + '" cartesian="' + usBoolToText( cartesian ) + '">' + endl;
          ret_val := '<polygon name="' + _name + '">' + endl;

          ret_val := ret_val + '<unsorted>' + endl;
          for i := 0 to _vertices.count - 1 do
            begin
              ret_val := ret_val + _vertices.at( i ).ssXml();
            end
          ;
          ret_val := ret_val + '</unsorted>' + endl;

          ret_val := ret_val + '<sorted>' + endl;
          for i := 0 to _scpVertices.count - 1 do
            begin
              ret_val := ret_val + _scpVertices.at( i ).ssXml();
            end
          ;
          ret_val := ret_val + '</sorted>' + endl;
        end
      ;

      ret_val := ret_val + '</polygon>' + endl;
      result := ret_val;
    end
  ;


  {*
    Returns the vertices of the polgon in original order
    @return Polygon vertices in original order
  }
  function TPolygon.getOrigVertices(): T2DPointList;
    begin
      result := _vertices;
    end
  ;


  {*
    Sorts the vertices of _vertices and puts the result in _scpVertices
    The vertices are fist sorted by Latitude and then by angle to the
    point having the lowest latitude, resulting in a counter-clockwise order.
    This method also calls the function to find the centroid and update _scpCentroid.
  }
  procedure TPolygon.sortSCP();
    var
     LatLons: T2DPointList;
     SCP: T2DPointList;
     angle: Double;
     i, j: Integer;
     found: Boolean;
     Inserted: Boolean;
     //Origin: T2DPoint;
    begin
      LatLons := T2DPointList.create(); //  _vertices;
      //  angle := 0.0;
      //Origin := T2DPoint.create( 0.0, 0.0 );

      if ( _scpVertices.count <= 0 ) then
        begin
          if ( _vertices.count > 2 ) then
            begin

            //Sort by Latitude first...could already be sorted, but just in case...
            //  If it is already sorted by Lat then this will simply take O(n) to run...no big deal.
              LatLons.append( T2DPoint.create( _vertices.at( 0 ) ) );
              for i := 1 to _vertices.count - 1 do
                begin
                  Inserted := false;
                  for j := 0 to LatLons.count - 1 do
                    begin
    //                  if ( Origin.DistanceTo( _vertices.at( i ), 0 ) < Origin.DistanceTo( LatLons.at( j ), 0 ) ) then
    //                  if LatLons.at( 0 ).DistanceTo( _vertices.at( i ), 0 ) > LatLons.at( 0 ).DistanceTo( LatLons.at( j ), 0 ) then
                      if( _vertices.at( i ).y < LatLons.at( j ).y ) then
                        begin
                          LatLons.insert( j, T2DPoint.create( _vertices.at( i ) ) );
                          Inserted := true;
                          break;
                        end
                      ;
                    end
                  ;
                  if ( not Inserted ) then
                    LatLons.append( T2DPoint.create( _vertices.at( i ) ) );
                end
              ;

              //  Now sort by angles...  Causes data to be sorted in 2 dimensions
              //  when done.
              //  May not result in the "best fit" polygon for the vericies given,
              //  but it will at least be one viable solution.  For the "best fit"
              //  solution, we need a more complex, i.e. longer running, algorithm,
              //  such as for a convex hull solution type.
              //
              //  This algorithm picks a vertex, the first one in this
              //  implementation, and finds the angles to it from the remaining
              //  vertices.  The vertices are then placed in order of the least to
              //  the greatest angle.  (Angle is calculated using traditional
              //  cartesian methods where 0/360 degrees is a maximum rise in Y and,
              //  no change in X...i.e. straight up.)  This results in a counter-clockwise
              //  joining of vertices to form the final polygon.  NOTE:  No attempt
              //  is made to throw out vertices, which cause too much change in
              //  X or Y. (Changing from counter-clockwise to clockwise, i.e. < to >
              //  has no effect on the outcome...)

              SCP := T2DPointList.create();

              SCP.append( T2DPoint.create( LatLons.at( 0 ) ) );
              LatLons.removeAt( 0 );

              for i := 0 to LatLons.count - 1 do
                begin
                  found := false;
                  angle := SCP.at( 0 ).AngleTo( LatLons.at(i) );
                  for j := 1 to SCP.count - 1 do
                    begin
                      if ( SCP.at(0).AngleTo ( SCP.at(j) ) <= angle ) then
                        begin
                          SCP.insert( j, T2DPoint.create( LatLons.at(i) ) );
                          found := true;
                          break;
                        end
                      ;
                    end
                  ;

                  if ( not found ) then
                    SCP.append( T2DPoint.create( LatLons.at(i) ) );
                end
              ;

              _scpVertices.assign( SCP );
              _scpCentroid.assign( PolygonCentroid( _scpVertices ) );

              SCP.free();
            end
          else
            begin
              _scpVertices.assign( _vertices );

              if ( _vertices.count = 2 ) then
                begin //Find the centroid of this polygon.
                  // FIX ME: AR Double-check the parentheses here...
                  _scpCentroid.x := _vertices.at(0).x + (( _vertices.at(1).x - _vertices.at(0).x ) / 2.0);
                  _scpCentroid.y := _vertices.at(0).y + (( _vertices.at(1).y - _vertices.at(0).y ) / 2.0);
                end
              ;
            end
          ;
        end
      ;

      freeAndNil( LatLons );
    end
  ;

  {*
    Returns the area of the polygon. The units of area will be the square of
    the units of the cartesian space of P.

    @param P Polygon's list of vertices
    @return The area of P
  }
  function TPolygon.PolygonArea( P: T2DPointList ): Double;
    var
      i,j: Integer;
      area: Double;
    begin
      for i := 0 to P.count - 2 do
        area := area + ( P.at(i).x * P.at(i+1).y - P.at(i+1).x * P.at(i).y )
      ;

      // final point
      j := p.Count - 1;
      area := area + ( P.at(j).x * p.at(0).y - p.at(0).x * p.at(j).y );

      area := abs( area / 2.0 );

      result := area;
    end
  ;

  {*
    Returns the centroid of P as a 2D point

    @param P Polygon's list of vertices
    @return Polygon centroid location
    @comment It would be nice to document the methodolgy used - research and update this comment
  }
  function TPolygon.PolygonCentroid( P: T2DPointList ): T2DPoint;
    var
      centroidX, centroidY: Double;
      ret_val: T2DPoint;
      Area: Double;
      temp: Double;
      i, j, N: Integer;
    begin
      Area := PolygonArea( P );
  //    temp := 0.0;
      ret_val := T2DPoint.create();
      centroidX := 0.0;
      centroidY := 0.0;

      N := P.count;

      for i := 0 to N - 1 do
        begin
          j := (i + 1) mod N;
          temp := ( ( P.at(i).x * P.at(j).y )-( P.at(j).x * P.at(i).y ) );
          centroidX := centroidX + ( P.at(i).x + P.at(j).x ) * temp;
          centroidY := centroidY + ( P.at(i).y + P.at(j).y ) * temp;
        end
      ;

      centroidX := centroidX / (6.0 * Area );
      centroidY := centroidY / (6.0 * Area );

      ret_val.y := centroidX;
      ret_val.x := centroidY;

      result := ret_val;
    end
  ;


end.


