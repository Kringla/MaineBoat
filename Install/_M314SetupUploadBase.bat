setlocal
REM SET /P AREYOUSURE=Er du sikker paa at du vil laste opp filen (Y/N)?
REM IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

@echo off
echo open ftp://m314avix:AMS60jwau@ftp.m314alta.org/ >> ftpcmd.dat
echo put %1 /public_html/installs/>> ftpcmd.dat
echo exit>> ftpcmd.dat

WinSCP.com /ini=nul /script=ftpcmd.dat

del ftpcmd.dat

:END
endlocal
pause