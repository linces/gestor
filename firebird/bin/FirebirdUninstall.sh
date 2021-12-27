#!/bin/sh
#
#  The contents of this file are subject to the Initial
#  Developer's Public License Version 1.0 (the "License");
#  you may not use this file except in compliance with the
#  License. You may obtain a copy of the License at
#  http://www.ibphoenix.com/main.nfs?a=ibphoenix&page=ibp_idpl.
#
#  Software distributed under the License is distributed AS IS,
#  WITHOUT WARRANTY OF ANY KIND, either express or implied.
#  See the License for the specific language governing rights
#  and limitations under the License.
#
#  The Original Code was created by Mark O'Donohue
#  for the Firebird Open Source RDBMS project.
#
#  Copyright (c) Mark O'Donohue <mark.odonohue@ludwig.edu.au>
#  and all contributors signed below.
#
#  All Rights Reserved.
#  Contributor(s): ______________________________________.
#		Alex Peshkoff
#

#  UnInstall script for FirebirdSQL database engine
#  http://www.firebirdsql.org

parseArgs ${*}

checkInstallUser

BuildVersion=3.0.7.33374
PackageVersion=0
CpuType=amd64

Version="$BuildVersion-$PackageVersion.$CpuType"

if [ ! -z "$InteractiveInstall" ]
then
	cat <<EOF

Firebird $Version Uninstall program

Are you sure you want to proceed?

EOF

	AskQuestion "Press Enter to start uninstall or ^C to abort"
fi

# Here we are uninstalling from a install tar.gz file

displayMessage "Uninstalling..."

checkIfServerRunning

if [ -f ${fb_install_prefix}/$SecurityDatabase ]; then
	cp ${fb_install_prefix}/$SecurityDatabase /tmp
	echo "Saved a copy of SecurityDatabase ($SecurityDatabase) in /tmp"
	chown root:root /tmp/$SecurityDatabase
	chmod 0600 /tmp/$SecurityDatabase
fi

for i in ${fb_install_prefix}/fb_guard ${fb_install_prefix}/firebird.log ${fb_install_prefix}/SYSDBA.password; do
	if [ -f $i ]; then
		rm -f $i
	fi
done

removeLinksForBackCompatibility
removeServiceAutostart
removeInetdServiceEntry

if [ -d $PidDir ]
then
    rm -rf $PidDir
fi

reconfigDynamicLoader

removeInstalledFiles  # Remove installed files 
removeUninstallFiles  # Remove the 'uninstall' utility files
removeEmptyDirs       # Remove empty directories

if [ "$OS_Has_Specific_Classic_Startup" ]
then
	osRemoveStartupFiles
fi

displayMessage "Uninstall completed"
