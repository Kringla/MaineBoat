setlocal

@echo off
echo open ftp://105881_master:Ro1995ma@ftp.ihlen.net/ >> ftpcmd.dat
echo put %1 /ihlen.net/public_html/installs/>> ftpcmd.dat
echo exit>> ftpcmd.dat

WinSCP.com /ini=nul /script=ftpcmd.dat

del ftpcmd.dat

:END
endlocal
pause