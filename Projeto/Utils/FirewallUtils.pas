{*
FirewallUtils - lets an application access a firewall port
-------------
Begin: 2008/03/05
Last revision: $Date: 2009-08-13 19:10:48 $ $Author: rhupalo $
Version: $Revision: 1.7 $
Code Documentation Tags: Begin 2009-08-13, Last Revision: 2009-08-13
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Shaun Case <Shaun.Case@colostate.edu>
--------------------------------------------------
Copyright (C) 2008 Animal Population Health Institute, Colorado State University

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Contents of this unit based on http://www.delphi3000.com/articles/article_5021.asp?SK=
}

(*
   Documentation generation tags begin with {* or ///
   Replacing these with (* or // foils the documentation generator
*)

unit FirewallUtils;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  ActiveX,
  ComObj,
  StdCtrls
;


const
  NET_FW_SCOPE_ALL = 0;       /// Application Scope
  NET_FW_IP_VERSION_ANY = 2;  /// Application IP version

function addApplicationToFirewall( EntryName: string; ApplicationPathAndExe: string; resultStr: pstring = nil ): boolean;

function haveFirewall(): boolean;

type
  EOLEObjectInvalid = class(Exception);  /// Not being used, replaced by a comment in resultStr

implementation

  {*
    Creates two firewall OLE scripting objects as a test case
    @return False could mean that no Firewall is running or that some other issues are interferring
  }
  function haveFirewall():boolean;
    var
      fwMgr,app: OleVariant;
      profile, LocalPolicy: OleVariant;
      ret_val: boolean;
    begin
      ret_val := true;
      try
        fwMgr := CreateOLEObject('HNetCfg.FwMgr');  // Firewall Manager object
      except
        ret_val := false;
      end
      ;

      if ( ret_val ) then
        begin
          if ( not VarIsEmpty( fwMgr )  ) then
            begin
              LocalPolicy := fwMgr.LocalPolicy;
              if ( not VarIsEmpty( LocalPolicy ) ) then
                begin
                  profile := fwMgr.LocalPolicy.CurrentProfile;
                  if ( not VarIsEmpty( profile ) ) then
                    begin
                      try
                        app := CreateOLEObject('HNetCfg.FwAuthorizedApplication');
                      except
                        ret_val := false;
                      end
                      ;
                      if ( ret_val ) then
                        if ( VarIsEmpty( app ) ) then
                          ret_val := false;
                    end
                  else
                    ret_val := false;
                end
              else
                ret_val := false;
            end
          else
            ret_val := false;
        end
        ;
      result := ret_val;
    end
  ;


{*
  Adds ApplicationPathAndExe to the list of authorized applications in the Windows Firewall standard profile.
  @param EntryName Application Name like 'Free Cell'
  @param ApplicationPathAndExe Fullfile name as in 'c:\windows\system32\freecell.exe'
  @param resultStr Not an input parameter; an output comment of the plausable cause if the operation fails
  @return True if the operation is successful
}
function addApplicationToFirewall( EntryName:string; ApplicationPathAndExe:string; resultStr: pstring = nil  ): boolean;
var
  fwMgr,app:OleVariant;
  profile:OleVariant;
begin
  result := true; // Until proven otherwise
  
  try
    fwMgr := CreateOLEObject('HNetCfg.FwMgr');
  except
      if( nil <> resultStr ) then resultStr^ := 'Can not find the Windows Firewall OLE Object.  Invalid Object Name, perhaps.';
      //raise EOLEObjectInvalid.Create('Cannot find the Windows Firewall OLE Object.  Invalid Object Name, perhaps.');
      result := false;
  end
  ;
  if ( not VarIsEmpty( fwMgr )  ) then
    begin
      profile := fwMgr.LocalPolicy.CurrentProfile;
      if ( not VarIsEmpty( profile ) ) then
        begin
          try
            app := CreateOLEObject('HNetCfg.FwAuthorizedApplication');
          except
            if( nil <> resultStr ) then resultStr^ := 'Cannot find the FwAuthorizedApplication OLE Object inside Windows Firewall.  Invalid Object Name, perhaps.';
            //raise EOLEObjectInvalid.Create('Can not find the FwAuthorizedApplication OLE Object inside Windows Firewall.  Invalid Object Name, perhaps.');
            result := false;
          end
          ;
          if ( not VarIsEmpty( app ) ) then
            begin
              app.ProcessImageFileName := ApplicationPathAndExe;
              app.Name := EntryName;
              app.Scope := NET_FW_SCOPE_ALL;
              app.IpVersion := NET_FW_IP_VERSION_ANY;
              app.Enabled :=true;
              try
                profile.AuthorizedApplications.Add(app);
              except
                if( nil <> resultStr ) then resultStr^ :='Cannot add this application.  Profile.AuthorizedApplications.Add() failed!'; 
                //raise EOLEObjectInvalid.Create('Can not add this application.  Profile.AuthorizedApplications.Add() failed!');
                result := false;
              end
              ;
            end
            ;
        end
      else
        begin
          if( nil <> resultStr ) then resultStr^ := 'No Windows Firewall Profiles Installed, it would seem.  This must mean that the Windows Firewall is turned off?';
          //raise EOLEObjectInvalid.Create('No Windows Firewall Profiles Installed, it would seem.  This must mean that the Windows Firewall is turned off?');
          result := false;
        end
        ;
    end
  else
    begin
      if( nil <> resultStr ) then resultStr^ := 'Cannot find the Windows Firewall OLE Object.  CreateOLEObject returned empty.';
      //raise EOLEObjectInvalid.Create('Cannot find the Windows Firewall OLE Object.  CreateOLEObject returned empty.');
      result := false;
    end
  ;
end;



initialization
  CoInitialize(nil); // <-- manually call CoInitialize()

finalization
  CoUnInitialize; // <-- free memory
end.
 