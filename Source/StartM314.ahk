;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

RunAutoUpdater(sInstallFilename)
{
	SetRegView 64
	RegRead, sInstallTime, HKEY_LOCAL_MACHINE\SOFTWARE\M314Apps, %sInstallFilename%InstallTime
	RegRead, sInstallUrl, HKEY_LOCAL_MACHINE\SOFTWARE\M314Apps, %sInstallFilename%InstallUrl
	
	;MsgBox %sInstallTime%
	
	setupfilename = % temp "\" . sInstallFilename ".exe"
	;MsgBox %setupfilename%
	
	Run, "CIAutoUpdater.exe" "%sInstallUrl%" "%sInstallTime%" "%setupfilename%" "1" "/S"
}

LogonSqlAccess(sUsername, sPassword)
{
	;Sleep 3000
	;MsgBox %sUsername%
	;return
	
	;SQL Server Login
	
	WinWaitActive, SQL Server Login, , 2	
	if ErrorLevel
	{
		WinActivate, SQL Server Login
	}
	
	WinWaitActive, SQL Server Login, , 10
	if ErrorLevel
	{
		WinActivate, SQL Server Login
	}
	
	WinWaitActive, SQL Server Login, , 1
	if ErrorLevel
	{
		MsgBox, WinWait timed out.
		return
	}

	ControlFocus, Edit2
	Sleep 70
	Send ^a{Delete}
	Sleep 70
	Send %sUsername%
	Sleep 70
	ControlFocus, Edit3
	Sleep 70
	Send ^a{Delete}	
	Sleep 70
	Send %sPassword%{enter}
}

RunAndLogonIfExist(sFilename, sUsername, sPassword, sSetupFile, sMessage)
{	
	IfExist, %sFilename%
	{		
		RunAutoUpdater(sSetupFile)			
		
		Run, %sFilename%
		
		;LogonSqlAccess(sUsername, sPassword)
		
		if (StrLen(sMessage) <> 0)
		{
			MsgBox, 64,, %sMessage%
		}			
	}
	else
	{
		MsgBox, 64,, % sFilename " finnes ikke."
	}
}

#5::
	RunAndLogonIfExist("M314PMS.accde", "105881_sc66800", "Maine1953", "M314PMSSetup", "")
Return

#7::
	RunAndLogonIfExist("M314Admin.accde", "105881_kr28513", "Maine1953", "M314AdminSetup", "")
Return

#8::
	RunAndLogonIfExist("M314Admin.accde", "105881_kr28513", "Maine1953", "M314AdminSetup", "")
Return

#1::
	RunAndLogonIfExist("M314Selskap.accde", "105881_lt85170", "Maine1953", "M314SelskapSetup", "")
Return

#3::
	RunAndLogonIfExist("M314Sponsor.accde", "105881_da56307", "Maine1953", "M314SponsorSetup", "")
Return


