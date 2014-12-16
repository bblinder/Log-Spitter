#!/bin/bash

egrep -i '(error)|(fail)|(rtmp://)|(port)|(\!)\|(drop)|(stamp)|(lost)|(connect)|(connection)|(auth)|(slow)|(check)|(quality)|(suggestion)' $1 > /tmp/Logs.txt && open /tmp/Logs.txt 

echo "All done!
Remember, this is to help narrow down possible causes.
It is highly recommended that you view the entire log file - you might otherwise miss crucial context."
