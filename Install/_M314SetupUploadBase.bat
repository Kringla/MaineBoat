setlocal
SET /P AREYOUSURE=Er du sikker paa at du vil laste opp filen (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

@echo off
echo open ftp.m314alta.org>> ftpcmd.dat
echo m314avix>> ftpcmd.dat
echo AMS60jwau>> ftpcmd.dat
echo cd public_html/installs>> ftpcmd.dat
echo quote pasv>> ftpcmd.dat
echo binary>> ftpcmd.dat
echo send .\%1>> ftpcmd.dat
echo disconnect>> ftpcmd.dat
echo quit>> ftpcmd.dat

ftp -i -s:ftpcmd.dat

del ftpcmd.dat

:END
endlocal