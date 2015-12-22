# windows-command-scripts
Command script to be run on Windows to perform various housekeeping and system tasks

## Fixing MS Office does not start correctly and/or gets stuck opening the "File" menu and/or cannot print
Are you able to display "Devices and Printers"?
If you open it and nothing ever appears?

Windows Task Manager: stop spoolsv.exe, then restart service Print Spooler

## MS Outlook "Loading Profile" forever
Try ScanPst: C:\Program Files (x86)\Microsoft Office\Office15\ScanPst.exe
If ScanPst cannot open the PST File of the MAIL PROFILE

Task manager: check all Processes with path "C:\Program Files (x86)\Microsoft Office\Office 15"
Kill them.
For example: Outlook.exe, Lync.exe, *** UCIMap.exe ***
