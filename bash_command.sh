# searches for the selected terms
egrep -i '(error)|(fail)|(rtmp://)|(port)|(\!)\|(drop)|(stamp)|(lost)|(connect)|(connection)|(auth)|(slow)|(check)|(quality)|(suggestion)'

# Spits out the filtered search terms onto a doc, opens it
cat > /Users/brandon/Documents/Logs.txt && open /Users/brandon/Documents/Logs.txt && echo "All Done!\nRemember, this is to help narrow down possible causes.\nIt is highly recommended that you view the entire log file - you may otherwise miss crucial context."
