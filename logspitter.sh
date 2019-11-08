#!/usr/bin/env bash

set -euo pipefail

logspitter_location=$(find . -name "*logspitter" 2> >(grep -Eiv 'not permitted|denied') >&2)

installation_directory=$(pwd)/Log-Spitter-master/


## The installation script. Pretty straightforward: checks if logspitter is installed, if not, installs it.
INSTALL(){
	if [[ "$(command -v logspitter)" ]] ; then
		echo "Looks like Logspitter is already installed on your system."
		echo "To run it, simply type 'logspitter' and hit ENTER."
		exit 0
	elif 
		[[ -z "$logspitter_location" ]] ; then

		#[[ $(find . -name "*logspitter" 2> >(grep -Eiv 'not permitted|denied') >&2) -ne 0 ]] ; then

		echo "::: Logspitter not found."
		echo "::: Installing from source..."
		sleep 1.5
		wget -q --no-check-certificate https://github.com/bblinder/Log-Spitter/archive/master.zip
		unzip master.zip
		echo "::: copying to /usr/local/bin..."
		sudo cp $installation_directory/logspitter /usr/local/bin
		if "$(command -v logspitter)" ; then
			rm -rf Log-Spitter-master
			rm master.zip
		fi
	fi
}

ReadProducerLog(){
	grep -Ei 'error|fail|false|(rtmp://)|port|(\!)\|drop|stamp|lost|\
		connect|connection|auth|slow|check|antilag|\
		quality|suggestion' "$logfile" > /tmp/ProducerLogs.txt\
		&& tail -300 /tmp/ProducerLogs.txt > /tmp/Producerlogs.filtered.txt\
		&& open /tmp/ProducerLogs.filtered.txt
}

ReadStudioLog(){
	grep -Ei '(error=2*)|error=3*|error=*|not\ found|(rtmp://)|\
		http_status|usage|motherboard|lost|connect|connection|auth|\
		tcp|socket|deleted|network|zixi|udp|\
		antilag|code=' "$logfile" > /tmp/StudioLogs.filtered.txt |\
		uniq -d -i && open /tmp/StudioLogs.filtered.txt
}


INSTALL
sleep 1.5
echo ""
echo ""
read -rp "::: Please drag your log file HERE and press ENTER  " file
case $file in
	*)
		if [[ "${file: -4}" == '*.log' ]] ; then
			echo "::: Showing last 300 log lines"
			ReadProducerLog
		elif
			[[ "${file: -4}" == '*.txt' ]] ; then
			echo "::: Showing last 300 log lines"
			ReadStudioLog
		else
			echo "::: Oops - not a valid log file."
			echo "::: Please use a Studio (.txt) or Producer (.log) file and try again."
			exit 1
		fi
		;;
esac

