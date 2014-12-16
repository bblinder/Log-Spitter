This is a simple log parser program which searches log files for certain keywords, then spits them out in a text document.

Once you've installed the ZIP, double-click the "installation" file. You may need to enter your password.

Once it completes, simply open a Terminal and enter "./logspitter", then drag the log file in. 

Then, hit enter. It should open a text document with the relevant keywords.

If you know how, it's highly recommended that you create an alias/shortcut to run the program more easily:

Open your ~/.bashrc or ~/.zshrc file and add:

logspitter='/usr/bin/logspitter'

Exit and reopen the terminal. You should now be able to simply type "logspitter" followed by the log file.

