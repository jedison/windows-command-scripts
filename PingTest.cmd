@ping %1 > PingResult.log
@FIND "TTL=" PingResult.log > NUL
@IF ERRORLEVEL 1 echo ping FAILED: no response from target
@REM FIND "BULLSHIT" PingResult.log > NUL
