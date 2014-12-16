# searches for the selected terms
egrep -i '(error)|(fail)|(rtmp://)|(port)|(\!)\|(drop)|(stamp)|(lost)|(connect)|(connection)|(auth)|(slow)|(check)|(quality)|(suggestion)'

# Spits out the filtered search terms onto a doc, opens it.
# Simply replace the /Path/To/File.txt with one relevant to your own system.

cat > /tmp/Logs.txt && open /tmp/Logs.txt && echo "All done.\nRemember, this is to help narrow down possible causes.\nIt is highly recommended that you view the entire log file - you might otherwise miss crucial context."

