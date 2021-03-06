﻿;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
RunAutoUpdater(sInstallFilename)
{
	SetRegView 64
	
	RegRead, sInstallTime, HKEY_CURRENT_USER\SOFTWARE\M314Apps, %sInstallFilename%InstallTime
	RegRead, sInstallUrl, HKEY_CURRENT_USER\SOFTWARE\M314Apps, %sInstallFilename%InstallUrl
	
	if StrLen(sInstallTime) = 0
	{
		RegRead, sInstallTime, HKEY_LOCAL_MACHINE\SOFTWARE\M314Apps, %sInstallFilename%InstallTime
		RegRead, sInstallUrl, HKEY_LOCAL_MACHINE\SOFTWARE\M314Apps, %sInstallFilename%InstallUrl
	}
	
	if StrLen(sInstallTime) = 0
	{
		MsgBox, 64,, % "Kunne ikke finne " .sInstallFilename "InstallTime i registry SOFTWARE\M314Apps"
		Return
	}
	
	if StrLen(sInstallUrl) = 0
	{
		MsgBox, 64,, % "Kunne ikke finne " .sInstallFilename "InstallUrl i registry SOFTWARE\M314Apps"
		Return
	}
	
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


#1::
	RunAndLogonIfExist("M314VF.accde", "105881_yb31958", "Oslo2020", "M314VFSetup", "")
Return

#2::
	RunAndLogonIfExist("M314VFTest.accde", "105881_ah72261", "Oslo2020", "M314VFTestSetup", "")
Return

#3::
	RunAndLogonIfExist("M314VFParty.accde", "105881_yb31958", "Oslo2020", "M314SelskapSetup", "")
Return

#4::
	RunAndLogonIfExist("M314VFPartyTest.accde", "105881_od92908", "Maine1953", "M314SelskapTestSetup", "")
Return

#7::
	RunAndLogonIfExist("M314Admin.accde", "105881_kr28513", "Maine1953", "M314AdminSetup", "")
Return

#8::
	RunAndLogonIfExist("M314Selskap.accde", "105881_lt85170", "Maine1953", "M314SelskapSetup", "")
Return





