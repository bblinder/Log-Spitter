This is a simple log parser tool that searches log files for certain keywords, then spits them out in a text document.

Once you've installed the ZIP, double-click the "installation" file. You may need to enter your password to authorize it. You can then delete the folder, as the relevant files have been copied to your system.

To use the Log Spitter, simply open a Terminal and enter "./logspitter", then drag the log file in and hit enter.

It should look something like this:

./logspitter qt.log

Once you hit Enter, it should open a text document with the relevant keywords.



If you know how, it's highly recommended that you create an alias/shortcut to run the program more easily:

Open your ~/.bashrc or ~/.zshrc file and add:

alias logspitter='/usr/bin/logspitter'

Exit and reopen the terminal. You should now be able to simply type "logspitter" followed by the log file.

