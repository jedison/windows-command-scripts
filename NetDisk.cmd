@REM 1 is the Name (IP Address) of the device
@REM 2 is the MAC address of the device
@REM 3 is username & connect point
@REM 4 is password

@SET /A WAIT=10
@SET /A MAXPING=15
@SET /A MAXNETUSE=10

NET USE L: /DELETE /Y
NET USE O: /DELETE /Y

@REM TIETOLaCie (00:D0:4B:90:FC:BD)
WolCmd %2 %1 255.255.255.0 7

@SET /A PINGCOUNT=0
:REPING
@IF %PINGCOUNT% GEQ %MAXPING% GOTO PINGFAIL
@IF %PINGCOUNT% GEQ 1 CALL WAIT %WAIT%
@SET /A PINGCOUNT+=1
call PingTest.cmd %1
@IF ERRORLEVEL 1 GOTO REPING

@SET /A NETUSECOUNT=0
:RENETUSE
@IF %NETUSECOUNT% GEQ %MAXNETUSE% GOTO NETUSEFAIL
@IF %NETUSECOUNT% GEQ 1 CALL WAIT %WAIT%
@SET /A NETUSECOUNT+=1
NET USE L: \\%1\%3 /user:%3 %4
@if ERRORLEVEL 1 GOTO RENETUSE
NET USE O: \\%1\OpenShare /user:%3 %4
@GOTO END

:PINGFAIL
@ECHO PING failed on %PINGCOUNT% attempts. Giving up.
@GOTO END

:NETUSEFAIL
@ECHO NET USE failed on %NETUSECOUNT% attempts. Giving up.
@GOTO END

:END
