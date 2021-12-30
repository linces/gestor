{*
BasicGIS.pas - Lat Lon range checking and loads and sets pointers to GIS library
------------
Begin: 2006/02/23
Last revision: $Date: 2010-06-25 19:41:11 $ $Author: areeves $
Version number: $Revision: 1.12 $
Code Documentation Tags: Begin 2009-08-06, Last Revision: 2009-08-06
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@ucalgary.ca>
--------------------------------------------------
Copyright (C) 2006 - 2013 NAADSM Development Team

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.
}

(*
	Detailed documentation for many of the functions in this unit is provided in
	the C source files for libaphi.dll.  Summary documentation is provided here.

	Detailed documentation for the native Delphi functions contained
	in this unit is provided below. Documentation generation tags begin with {* or ///
  Replacing these with (* or // foils the documentation generator
*)

unit BasicGIS;

interface

  uses
    Points
  ;

  //--------------------
  // Unit self-test
  //--------------------
  procedure selfTest();

  function gisValidLat( const lat: double ): boolean;
  function gisValidLon( const lon: double ): boolean;

  function gisAverageLat( const latN, latS: double ): double;
  function gisAverageLon( const lonW, lonE: double ): double;

  { Is the point at (testLat, testLon) bounded by the rectangle defined by the northwest and southeast corners? }
  function gisLLBoundedBy( testLat, testLon, latNW, lonNW, latSE, lonSE: double ): boolean;

	type
    {*
      For pointers to functions in libaphi.dll. The variables are established here but not used by this unit
      @param lat1 Latitude 1
      @param lon1 Longitude 1
      @param lat2 Latitude 2
      @param lon2 Longitude 2
      @return Result of some calculation
    }
    TLatLonDistFunction = function( lat1, lon1, lat2, lon2: double ): double; cdecl;

  var	  
 		{*
      Used in NAADSM through versions 3.1.x. Returns the distance in km between points 1 and 2 using
      a local, flat-Earth approximation. Function pointer to GIS library
    }
		gisLocalDistance: TLatLonDistFunction;

    {*
      Used in NAADSM through versions 3.1.x. Returns the squared distance in km between points 1 and 2 using
      a local, flat-Earth approximation. Pointer to GIS library function
    }
		gisLocalDistanceSquared: TLatLonDistFunction; /// function pointer

		{*
      Returns the distance in km between points 1 and 2 assuming a flat, square
		  grid where 1 degree of latitude or longitude equals 1/360th of the Earth's
		  circumference at the equator. Pointer to GIS library function
    }
		gisSimpleDistance: TLatLonDistFunction;

    {*
      Returns the squared distance in km between points 1 and 2 assuming a flat, square
		  grid where 1 degree of latitude or longitude equals 1/360th of the Earth's
		  circumference at the equator. Pointer to GIS library function
    }
		gisSimpleDistanceSquared: TLatLonDistFunction;

		{*
      Returns the great-circle distance in km between points 1 and 2.
      Pointer to GIS library function
    }
		gisGreatCircleDistance: TLatLonDistFunction;
    
    gisFunctionsLoaded: boolean = false; /// Whether the GIS library libaphi.dll is loaded

    
  const
    LAT_LON_UNDEFINED: double = 1000.0; /// value returned for exceptions caused by invalid coordinates
    LAT_LON_PRECISION: integer = 5; /// Currently not used in the module

	(**
	// Two local functions are used in this unit, and are called in the initialization section.
	// These functions handle the assignment of function pointers to functions available in
	// dynamically loaded libraries.  The function pointers themselves are declared above.
	
	{ Initializes function pointers to nil. } 
	procedure freeGISPointers();
	
	{ Assigns function pointers from the DLL(s).  If successful, sets gisFunctionsLoaded to true. }
	function loadGISPointers(): boolean;
	**) 

implementation

	uses
    Windows,
    SysUtils,
    Math,
    
		MyStrUtils,
    DebugWindow
	;

  const
    DBSHOWMSG: boolean = true; /// Set to true to enable debugging messages for this unit.
    

//-----------------------------------------------------------------------------
// Native Delphi functions
//-----------------------------------------------------------------------------

  {*
    Checks to see if lat looks like a valid latitude coordinate
    @param lat Latitude coordinate
    @return True if lat is in valid numeric range for latitude
  }
  function gisValidLat( const lat: double ): boolean;
    begin
      if( isNaN( lat ) ) then
        result := false
      else
        result := ( ( -90.0 <= lat ) and ( 90.0 >= lat ) )
      ;
    end
  ;

  {*
    Checks to see if lon looks like a valid longitude coordinate
    @param lon Longitude coordinate
    @return True if lon is in valid numeric range for longitude
  }
  function gisValidLon( const lon: double ): boolean;
    begin
      if( isNaN( lon ) ) then
        result := false
      else
        result := ( ( -180.0 <= lon ) and ( 180.0 >= lon ) )
      ;
    end
  ;


  {*
    Returns the average of two latitudinal coordinates

    @param latS The southern coordinate, the smaller value
    @param latN The northern coordinate, the larger value
    @return Average of the two coordinates
    @throws Exception raised if coordinates are not valid or in correct order
    @comment WARNING: lats are assumed to be valid, and order matters.
  }
  function gisAverageLat( const latN, latS: double ): double;
    begin
      if
        ( not( gisValidLat( latN ) ) )
      or
        ( not( gisValidLat( latS ) ) )
      or
        ( not( latN >= latS ) )
      then
        begin
          raise exception.create( 'Parameters to gisAverageLat violate function assumptions.' );
          result := LAT_LON_UNDEFINED;
        end
      else
        result := (latN + latS)/2
      ;
    end
  ;

  {*
    Returns the average of two longitudinal coordinates

    @param latW The western coordinate, the smaller value
    @param latE The eastern coordinate, the larger value
    @return Average of the two coordinates
    @throws Exception raised if coordinates are not valid or in correct order
    @comment WARNING: lats are assumed to be valid, and order matters.
  }
  function gisAverageLon( const lonW, lonE: double ): double;
    var
      adjLonE, adjLonW: double;
      degreesBetw: double;
    begin
      if
        ( not( gisValidLon( lonW ) ) )
      or
        ( not( gisValidLon( lonE ) ) )
      then
        begin
          raise exception.create( 'Parameters to gisAverageLon violate function assumptions.' );
          result := LAT_LON_UNDEFINED;
          exit;
        end
      ;

      if( 0.0 > lonE ) then
        adjLonE := lonE + 360.0
      else
        adjLonE := lonE
      ;
      if( 0.0 > lonW ) then
        adjLonW := lonW + 360.0
      else
        adjLonW := lonW
      ;

      if( adjLonW <= adjLonE ) then // This will be true in all cases except where the PM is spanned but the date line isn't.
        degreesBetw := adjLonE - adjLonW
      else
        degreesBetw := adjLonE + 360.0 - adjLonW
      ;

      result := adjLonE - (degreesBetw / 2 );

      if( 180.0 < result ) then result := result - 360.0;
    end
  ;
  

  {*
    Tests if the point (testLat, testLon) is bounded by a rectangle defined
    by the northwest and southeast corner coordinates

    @param testLat
    @param testLon
    @param latNW Latitude of bounding NW corner
    @param lonNW Longitude of bounding NW corner
    @param latSE Latitude of bounding Southeast corner
    @param lonSE Longitude of bounding Southeast corner
    @return True if test position is within the bounded coordinate space
    @comment WARNING: all lats and lons are assumed to be valid.
  }
  function gisLLBoundedBy( testLat, testLon, latNW, lonNW, latSE, lonSE: double ): boolean;
    begin
      // testLat must be between latNW and latSE...
      if( ( latNW < testLat ) or ( latSE > testLat ) ) then
        result := false
      else // Lat is OK.  Check lon.
        begin
          // If lonW and lonE are the same, it's easy...
          if( lonNW = lonSE ) then
            result := ( testLon = lonNW )
          else
            begin
              // The rest of the logic for handling lons is a lot easier
              // if lon goes from 0 to 360 instead of -180 to 180.
              if( 0.0 > lonNW ) then lonNW := lonNW + 360.0;
              if( 0.0 > lonSE ) then lonSE := lonSE + 360.0;
              if( 0.0 > testLon ) then testLon := testLon + 360.0;

              if( 360.0 = lonNW ) then
                begin
                  if( testLon = lonNW ) then testLon := 0.0;
                  lonNW := 0.0;
                end
              ;

              if( 0.0 = lonSE ) then
                begin
                  if( testLon = lonSE ) then testLon := 360.0;
                  lonSE := 360.0;
                end
              ;

              // lonE will be greater than lonW unless the region straddles the prime meridian.
              if( lonSE > lonNW ) then
                begin
                  if( ( lonSE < testLon ) or ( lonNW > testLon ) ) then
                    result := false
                  else
                    result := true
                  ;
                end
              else // The region does straddle the PM.
                begin
                  if
                    ( ( testLon >= lonNW ) and ( testLon >= lonSE ) )
                  or
                    ( ( testLon <= lonNW ) and ( testLon <= lonSE ) )
                  then
                    result := true
                  else
                    result := false
                  ;
                end
              ;
            end
          ;
        end
      ;
    end
  ;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// DLL handling
//-----------------------------------------------------------------------------

  /// Frees pointers to GIS dll
	procedure freeGISPointers();  
    begin
			gisGreatCircleDistance := nil;
			gisLocalDistance := nil;
			gisLocalDistanceSquared := nil;
			gisSimpleDistance := nil;
			gisSimpleDistanceSquared := nil;
    end
  ;
   
  {*
    Loads GIS library, libaphi.dll
    @return True if library load successfull
  }
	function loadGISPointers(): boolean;
    var
      dllHandle: THandle; //Handle used to open the DLL.  Defined in unit Windows.
		begin
      try
        dllHandle := loadLibrary( 'libaphi.dll' );
      except
        result := false;
        freeGISPointers();
        exit;
      end;

      if( dllHandle >= 32 ) then // Library were successfully loaded.  Assign function pointers now.
        begin
          result := true;

          gisGreatCircleDistance := GetProcAddress( dllHandle, 'GIS_great_circle_distance' );
          if( nil = @gisGreatCircleDistance ) then
          	begin
          		dbcout( 'MISSING FUNCTION GIS_great_circle_distance', DBSHOWMSG );
              result := false;
            end
          ;

          gisLocalDistance := GetProcAddress( dllHandle, 'GIS_local_distance' );
          if( nil = @gisLocalDistance ) then
          	begin
          		dbcout( 'MISSING FUNCTION GIS_local_distance', DBSHOWMSG );
              result := false;
            end
          ;

          gisLocalDistanceSquared := GetProcAddress( dllHandle, 'GIS_local_distance_sq' );
          if( nil = @gisLocalDistanceSquared ) then
          	begin
          		dbcout( 'MISSING FUNCTION GIS_local_distance_sq', DBSHOWMSG );
              result := false;
            end
          ;

          gisSimpleDistance := GetProcAddress( dllHandle, 'GIS_simple_distance' );
          if( nil = @gisSimpleDistance ) then
          	begin
          		dbcout( 'MISSING FUNCTION GIS_simple_distance', DBSHOWMSG );
              result := false;
            end
          ;

          gisSimpleDistanceSquared := GetProcAddress( dllHandle, 'GIS_simple_distance_sq' );
          if( nil = @gisSimpleDistanceSquared ) then
          	begin
          		dbcout( 'MISSING FUNCTION GIS_simple_distance_sq', DBSHOWMSG );
              result := false;
            end
          ;

				end
      else
        result := false
			;
		end
	;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Unit self test functions
//-----------------------------------------------------------------------------

  /// Self test of functions gisValidLat and gisValidLon range checking
  procedure zzTestIsValid();
    begin
      dbtest( endl + '*** BasicGIS.zzTestIsValid...' );

      if( not( gisValidLat( 85 ) ) ) then raise exception.create( '1' );
      if( not( gisValidLat( -85 ) ) ) then raise exception.create( '2' );
      if( not( gisValidLat( 90 ) ) ) then raise exception.create( '3' );
      if( not( gisValidLat( -90 ) ) ) then raise exception.create( '4' );
      if( gisValidLat( 120 ) ) then raise exception.create( '5' );
      if( gisValidLat( -91 ) ) then raise exception.create( '6' );

      if( not( gisValidLon( 85 ) ) ) then raise exception.create( '7' );
      if( not( gisValidLon( -85 ) ) ) then raise exception.create( '8' );
      if( not( gisValidLon( 170 ) ) ) then raise exception.create( '9' );
      if( not( gisValidLon( -170 ) ) ) then raise exception.create( '10' );
      if( not( gisValidLon( 180 ) ) ) then raise exception.create( '11' );
      if( not( gisValidLon( -180 ) ) ) then raise exception.create( '12' );
      if( gisValidLon( 181 ) ) then raise exception.create( '13' );
      if( gisValidLon( -183 ) ) then raise exception.create( '14' );
      if( gisValidLon( 300 ) ) then raise exception.create( '15' );
      if( gisValidLon( -200 ) ) then raise exception.create( '16' );

      dbtest( '*** Done.' + endl );
    end
  ;

  /// Self test of function gisLLBoundedBy range checking
  procedure zzTestLLBoundedBy();
    begin
      dbtest( endl + '*** BasicGIS.zzTestLLBoundedBy...' );

      //gisLLBoundedBy( testLat, testLon, latNW, lonNW, latSE, lonSE: double )

      // Northern hemisphere, west of the prime meridian and east of the date line (between -180 and 0 lon)
      //---------------------------------------------------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, -35, 40, -40, 30, -30 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 35, -45, 40, -40, 30, -30 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, -35, 40, -40, 30, -30 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -25, 40, -40, 30, -30 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 45, -35, 40, -40, 30, -30 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, -40, 40, -40, 30, -30 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, -30, 40, -40, 30, -30 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, -30, 40, -40, 30, -30 ) ) ) then raise exception.Create( '8' );
      if( not( gisLLBoundedBy( 30, -40, 40, -40, 30, -30 ) ) ) then raise exception.Create( '9' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, 10, 40, -40, 30, -30 ) ) then raise exception.Create( '10' );
      if( gisLLBoundedBy( 35, 150, 40, -40, 30, -30 ) ) then raise exception.Create( '11' );


      // Northern hemisphere, east of the PM and west of the DL (between 0 and 180 lon)
      //-------------------------------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, 35, 40, 30, 30, 40 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 35, 45, 40, 30, 30, 40 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, 35, 40, 30, 30, 40 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, 25, 40, 30, 30, 40 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 45, 35, 40, 30, 30, 40 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 40, 40, 30, 30, 40 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 40, 40, 30, 30, 40 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 30, 30, 40, 30, 30, 40 ) ) ) then raise exception.Create( '8' );
      if( not( gisLLBoundedBy( 40, 30, 40, 30, 30, 40 ) ) ) then raise exception.Create( '9' );

      // Northern hemisphere, straddling the PM
      //----------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, 35, 40, -20, 30, 40 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 35, 45, 40, -20, 30, 40 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, 35, 40, -20, 30, 40 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -25, 40, -20, 30, 40 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 45, 35, 40, -20, 30, 40 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, -20, 40, -20, 30, 40 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 40, 40, -20, 30, 40 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 30, -20, 40, -20, 30, 40 ) ) ) then raise exception.Create( '8' );
      if( not( gisLLBoundedBy( 40, 40, 40, -20, 30, 40 ) ) ) then raise exception.Create( '9' );

      // Northern hemisphere, with the PM as the east boundary
      //------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, -15, 40, -30, 30, 0 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, -15, 40, -30, 30, 0 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, -15, 40, -30, 30, 0 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -35, 40, -30, 30, 0 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, 5, 40, -30, 30, 0 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 0, 40, -30, 30, 0 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, -30, 40, -30, 30, 0 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, -30, 40, -30, 30, 0 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 0, 40, -30, 30, 0 ) ) ) then raise exception.Create( '7' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, -150, 40, -30, 30, 0 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 35, 150, 40, -30, 30, 0 ) ) then raise exception.Create( '3' );

      
      // Northern hemisphere, with the PM as the west boundary
      //------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, 15, 40, 0, 30, 30 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, 15, 40, 0, 30, 30 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, 15, 40, 0, 30, 30 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -5, 40, 0, 30, 30 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, 35, 40, 0, 30, 30 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 0, 40, 0, 30, 30 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 30, 40, 0, 30, 30 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, 30, 40, 0, 30, 30 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 0, 40, 0, 30, 30 ) ) ) then raise exception.Create( '7' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, -150, 40, 0, 30, 30 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 35, 150, 40, 0, 30, 30 ) ) then raise exception.Create( '3' );


      // Northern hemisphere, with the DL as the west boundary
      //------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, -170, 40, -180, 30, -150 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, -170, 40, -180, 30, -150 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, -170, 40, -180, 30, -150 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -5, 40, -180, 30, -150 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, 175, 40, -180, 30, -150 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, -180, 40, -180, 30, -150 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, -150, 40, -180, 30, -150 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, -150, 40, -180, 30, -150 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, -180, 40, -180, 30, -150 ) ) ) then raise exception.Create( '7' );

      // Points are on the edges of the region
      if( not( gisLLBoundedBy( 35, 180, 40, -180, 30, -150 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 35, -150, 40, -180, 30, -150 ) ) ) then raise exception.Create( '7' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, 5, 40, -180, 30, -150 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 35, -5, 40, -180, 30, -150 ) ) then raise exception.Create( '3' );


      // Northern hemisphere, with the DL as the east boundary
      //------------------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, 170, 40, 150, 30, 180 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, 170, 40, 150, 30, 180 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, 170, 40, 150, 30, 180 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, 145, 40, 150, 30, 180 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, -175, 40, 150, 30, 180 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 150, 40, 150, 30, 180 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 180, 40, 150, 30, 180 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, 180, 40, 150, 30, 180 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 150, 40, 150, 30, 180 ) ) ) then raise exception.Create( '7' );

      // Points are on the edges of the region
      if( not( gisLLBoundedBy( 35, 180, 40, 150, 30, 180 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 35, 150, 40, 150, 30, 180 ) ) ) then raise exception.Create( '7' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, 5, 40, 150, 30, 180 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 35, -5, 40, 150, 30, 180 ) ) then raise exception.Create( '3' );

      // Point is in the region
      if( not( gisLLBoundedBy( 35, 170, 40, 150, 30, -180 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, 170, 40, 150, 30, -180 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, 170, 40, 150, 30, -180 ) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, 145, 40, 150, 30, -180 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, -175, 40, 150, 30, -180 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 150, 40, 150, 30, -180 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 180, 40, 150, 30, -180 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, 180, 40, 150, 30, -180 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 150, 40, 150, 30, -180 ) ) ) then raise exception.Create( '7' );

      // Points are on the edges of the region
      if( not( gisLLBoundedBy( 35, 180, 40, 150, 30, -180 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 35, 150, 40, 150, 30, -180 ) ) ) then raise exception.Create( '7' );


      // Northern hemisphere, straddling the date line
      //-----------------------------------------------
      // Point is in the region
      if( not( gisLLBoundedBy( 35, -170, 40, 150, 30, -150 ) ) ) then raise exception.Create( '1' );

      // Points are outside the region
      if( gisLLBoundedBy( 45, -170, 40, 150, 30, -150 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 25, -170, 40, 150, 30, -150) ) then raise exception.Create( '3' );
      if( gisLLBoundedBy( 35, -145, 40, 150, 30, -150 ) ) then raise exception.Create( '4' );
      if( gisLLBoundedBy( 35, 145, 40, 150, 30, -150 ) ) then raise exception.Create( '5' );

      // Points are the corners of the region
      if( not( gisLLBoundedBy( 40, 150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, -150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 40, -150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '6' );
      if( not( gisLLBoundedBy( 30, 150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '7' );

      // Points are on the edges of the region
      if( not( gisLLBoundedBy( 35, 150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '7' );
      if( not( gisLLBoundedBy( 35, -150, 40, 150, 30, -150 ) ) ) then raise exception.Create( '7' );

      // Points are way outside the region
      if( gisLLBoundedBy( 35, 5, 40, 150, 30, -150 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 35, -5, 40, 150, 30, -150 ) ) then raise exception.Create( '3' );


      // Very thin vertical regions
      //---------------------------
      if( not( gisLLBoundedBy( 10, 0, 20, 0, 5, 0 ) ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, 2, 20, 0, 5, 0 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, -2, 20, 0, 5, 0 ) ) then raise exception.Create( '2' );

      if( not( gisLLBoundedBy( 10, 180, 20, 180, 5, 180 ) ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, 178, 20, 180, 5, 180 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, -178, 20, 180, 5, 180 ) ) then raise exception.Create( '2' );

      if( not( gisLLBoundedBy( 10, 90, 20, 90, 5, 90 ) ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, 88, 20, 90, 5, 90 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 10, 92, 20, 90, 5, 90 ) ) then raise exception.Create( '2' );

      
      // Very thin horizontal regions
      //-----------------------------
      if( not( gisLLBoundedBy( 20, 90, 20, 90, 20, 110 ) ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 22, 90, 20, 90, 20, 110 ) ) then raise exception.Create( '2' );
      if( gisLLBoundedBy( 18, 90, 20, 90, 20, 110 ) ) then raise exception.Create( '2' );

      // There's really nothing special to test about the southern hemisphere, is there?
      
      dbtest( '*** Done.' + endl );

    end
  ;


  /// Self test of function gisAverageLat
  procedure zzTestAverageLat();
    begin
      dbtest( endl + '*** BasicGIS.zzTestAverageLat...' );

      if( 45 <> gisAverageLat( 90, 0 ) ) then raise exception.create( 'Problem' );
      if( 22.5 <> gisAverageLat( 45, 0 ) ) then raise exception.create( 'Problem' );
      if( 30 <> gisAverageLat( 40, 20 ) ) then raise exception.create( 'Problem' );
      if( 0 <> gisAverageLat( 40, -40 ) ) then raise exception.create( 'Problem' );
      if( 10 <> gisAverageLat( 30, -10 ) ) then raise exception.create( 'Problem' );
      if( -25 <> gisAverageLat( -10, -40 ) ) then raise exception.create( 'Problem' );
      if( -45 <> gisAverageLat( 0, -90 ) ) then raise exception.create( 'Problem' );
      if( -60 <> gisAverageLat( -50, -70 ) ) then raise exception.create( 'Problem' );

      dbtest( '*** Done.' + endl );
    end
  ;

  /// Self test of function gisAverageLon
  procedure zzTestAverageLon();
    begin
      dbtest( endl + '*** BasicGIS.zzTestAverageLon...' );

      if( 0 <> gisAverageLon( -90, 90 ) ) then raise exception.create( 'Problem' );
      if( -90 <> gisAverageLon( -135, -45 ) ) then raise exception.create( 'Problem' );
      if( 0 <> gisAverageLon( -45, 45 ) ) then raise exception.create( 'Problem' );
      if( 90 <> gisAverageLon( 45, 135 ) ) then raise exception.create( 'Problem' );
      if( 180 <> gisAverageLon( 135, -135 ) ) then raise exception.create( 'Problem' );
      if( -20 <> gisAverageLon( -30, -10 ) ) then raise exception.create( 'Problem' );
      if( 20 <> gisAverageLon( 10, 30 ) ) then raise exception.create( 'Problem' );
      if( 120 <> gisAverageLon( 110, 130 ) ) then raise exception.create( 'Problem' );
      if( -120 <> gisAverageLon( -130, -110 ) ) then raise exception.create( 'Problem' );
      if( -10 <> gisAverageLon( -30, 10 ) ) then raise exception.create( 'Problem' );

      // Cases that go all the way around the globe.
      // NOTE: the case of -180 to 180 is ambiguous.
      //if( 0 <> gisAverageLon( -180, 180 ) ) then raise exception.create( 'Problem' );
      //if( 0 <> gisAverageLon( 180, -180 ) ) then raise exception.create( 'Problem' );
      if( 180 <> gisAverageLon( -180, 180 ) ) then raise exception.create( 'Problem' );
      if( 180 <> gisAverageLon( 180, -180 ) ) then raise exception.create( 'Problem' );

      if( -88 <> gisAverageLon( -178, 2 ) ) then raise exception.create( 'Problem' );
      if( 0 <> gisAverageLon( 0, 0 ) ) then raise exception.create( 'Problem' );
      if( 95 <> gisAverageLon( 5, -175 ) ) then raise exception.create( 'Problem' );
      if( -85 <> gisAverageLon( -175, 5 ) ) then raise exception.create( 'Problem' );
      if( 92 <> gisAverageLon( 2, -178 ) ) then raise exception.create( 'Problem' );


      dbtest( '*** Done.' + endl );
    end
  ;

  /// Proc to call the four individual self test procedures
  procedure selfTest();
    begin
      zzTestIsValid();
      zzTestLLBoundedBy();
      zzTestAverageLat();
      zzTestAverageLon();
    end
  ;

//-----------------------------------------------------------------------------


initialization

	// Load the needed functions from the dynamic library
	gisFunctionsLoaded := loadGISPointers();
	if( not( gisFunctionsLoaded ) ) then freeGISPointers();

end.