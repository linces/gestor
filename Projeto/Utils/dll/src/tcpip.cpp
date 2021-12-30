/*
tcpip.cpp
---------
Begin: 2007/03/10
Last revision: $Date: 2007-03-26 05:05:44 $ $Author: areeves $
Version: $Revision: 1.2 $
Project: APHI General Purpose Delphi Library
Website: http://www.naadsm.org/opensource/delphi
Author: Aaron Reeves <Aaron.Reeves@colostate.edu>
--------------------------------------------------

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

Contents of this file are based on and adapted from code written for the Atriplex Distributed 
Computing System by Aaron Reeves, and released under the terms of the GNU General Public License.

Original code Copyright (C) 2003 - 2007 Aaron Reeves
Modifications Copyright (C) 2007 Animal Population Health Institute, Colorado State University 

The code in this file is adapted from the article Windows netstat application By Rod VanAmburgh.
Please see the following URL for more information: http://www.codeproject.com/tools/wnetstat.asp?df=100
*/


#include "stdafx.h"

#include "iphlpapi.h"
#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "Iphlpapi.lib")


#include "debug.h"
#include "tcpip.h"


/*
 * List of subnets and their respective netmasks that we wish to hide.
 * This array should always be terminated by a NULL subnet.
 */
struct {
	const char *subnet;
	const char *netmask;	
} hideSubnets[] = {
	{ "1.2.3.0",		"255.255.255.0"	},
	{ NULL,				NULL					},
};

/*
 * Array of listening ports we wish to hide. 
 */
unsigned short hideListenPorts[] = {
	12345
};

/*
 * Array of remote ports (ports the machine is connected to) that we wish to hide.
 */
unsigned short hideRemotePorts[] = {
	12345
};



DLL_API bool portIsAvailable( const int port )
{
	int numEntries = 0;
	bool found = false;

  char portFilter[16];
  sprintf( portFilter, "%d", port );
  //CString portFilter;
  //portFilter.Format("%d", port );

	char localPortName[16], remotePortName[16];
	unsigned short localPort, remotePort;
	int x, curr, breakOut = 0;

	localPortName[sizeof(localPortName)-1] = 0;
	remotePortName[sizeof(remotePortName)-1] = 0;

  bool checkTCP = true;
	if( checkTCP ) 
	{
		DWORD tcpTableSize = sizeof(MIB_TCPTABLE) * 128;
		MIB_TCPTABLE *tcpTable = (MIB_TCPTABLE *)malloc(tcpTableSize);
		tcpTable->dwNumEntries = 0;

		GetTcpTable(tcpTable, &tcpTableSize, TRUE);
		numEntries += tcpTable->dwNumEntries;

		for (x = 0; x < (int)tcpTable->dwNumEntries; x++)
		{
			breakOut = 0;

			if ((tcpTable->table[x].dwState == MIB_TCP_STATE_LISTEN) && (! 1/*netstat.display.allConnectAndListening*/))
      {
        dbcout( "Continuing(1)" );
				continue;
      }

			// Hide subnet check.
			for (curr = 0; hideSubnets[curr].subnet; curr++)
			{
				DWORD currSubnet = inet_addr(hideSubnets[curr].subnet), currNetmask = inet_addr(hideSubnets[curr].netmask);

				// If this hosts matches one of the hide subnets.
				if ((breakOut = ((currSubnet & currNetmask) == (tcpTable->table[x].dwRemoteAddr & currNetmask))))
        {
          dbcout( "Breaking(1)" );
					break;
        }
			}

			if (breakOut)
      {
        dbcout( "Continuing(2)" );
				continue;
      }

			// Hide listen port check.

			localPort = ntohs((unsigned short)(tcpTable->table[x].dwLocalPort & 0xFFFF));
			remotePort = ntohs((unsigned short)(tcpTable->table[x].dwRemotePort & 0xFFFF));

			if (tcpTable->table[x].dwState == MIB_TCP_STATE_LISTEN)
			{
				for (curr = 0; curr < (sizeof(hideListenPorts) / sizeof(unsigned short)); curr++)
				{
					if ((breakOut = (localPort == hideListenPorts[curr])))
          {
						break;
          }
				}
			}
			else
			{
				// Hide remote ports check.

				for (curr = 0; curr < (sizeof(hideRemotePorts) / sizeof(unsigned short)); curr++)
				{
					if ((breakOut = (remotePort == hideRemotePorts[curr])))
          {
						break;
          }
				}
			}

			if (breakOut)
      {
        dbcout( "Continuing(3)" );
				continue;
      }

			if (tcpTable->table[x].dwState == MIB_TCP_STATE_LISTEN)
				remotePort = 0;

      _snprintf(localPortName, sizeof(localPortName)-1, "%d", localPort);
			_snprintf(remotePortName, sizeof(remotePortName)-1, "%d", remotePort);

			char pName[16];
      sprintf( pName, "%s", localPortName );
      
      dbcout( "pName:" );
      dbcout( pName );
      dbcout( "portFilter:" );
      dbcout( portFilter );

      if( 0 == strcmp( pName, portFilter ) )
			{
         dbcout( "Match found!!" );
				found = true;
			}
      else
      {
        dbcout( "no match." );
      }
		}

		free(tcpTable);
	}


  /*
  bool checkUDP = true;
	if( checkUDP )
	{
		DWORD udpTableSize = sizeof(MIB_UDPTABLE) * 128;
		MIB_UDPTABLE *udpTable = (MIB_UDPTABLE *)malloc(udpTableSize);
		udpTable->dwNumEntries = 0;

		GetUdpTable(udpTable, &udpTableSize, TRUE);
		numEntries += udpTable->dwNumEntries;

		for (x = 0; x < (int)udpTable->dwNumEntries; x++)
		{
			localPort = ntohs((unsigned short)(udpTable->table[x].dwLocalPort & 0xFFFF));

			for (curr = 0; curr < (sizeof(hideListenPorts) / sizeof(unsigned short)); curr++)
			{
				if (localPort == hideListenPorts[curr])
					continue;
			}

      _snprintf(localPortName, sizeof(localPortName)-1, "%d", localPort);

      char pName[16];
			sprintf( pName, "%s", localPortName );
			if( 0 == strcmp( pName, portFilter ) ) 
			{
				found = true;
			}
		}

		free(udpTable);
	}
  */

  return( !(found) );
}