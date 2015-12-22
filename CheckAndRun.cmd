@SET PROGNAME=%1%
@SET PATHNAME=%2%
@tasklist /FI "IMAGENAME eq %PROGNAME%" > c:\My\Tools\task.out 
@find /I /N "%PROGNAME%" c:\My\Tools\task.out
@IF ERRORLEVEL 1 GOTO STARTPROG
:STARTED
@echo Program is running
@GOTO END
:STARTPROG
@echo %PATHNAME%
@echo %PROGNAME%
@echo Starting Program
@start /D %PATHNAME% /B %PROGNAME%
@GOTO END
:END
