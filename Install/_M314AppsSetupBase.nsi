; basic script

  ;Properly display all languages (Installer will not work on Windows 95, 98 or ME!)
  Unicode true

!addplugindir ".\"

!include "FileFunc.nsh"

!include "nsProcess.nsh"
 
;!define SETUPFILE "setup.exe"
 
; change this to wherever the files to be packaged reside
!define srcdir "Files"
 
!define SETUP_FILEBASE "M314${M314_NAME}Setup"
!define PRODUCT_NAME "M314 ${M314_NAME}"
!define PUBLISHER "Gerhard B. Ihlen"
 
;!define exec "program.exe"
; file containing list of file-installation commands
 ;!define files "${SETUP_FILEBASE}.files.nsi"
 
; file containing list of file-uninstall commands
 ;!define unfiles "${SETUP_FILEBASE}.unfiles.nsi"
 
; optional stuff
 
; Set the text which prompts the user to enter the installation directory
; DirText "My Description Here."
 
; text file to open in notepad after installation
; !define notefile "README.txt"
  
; icons must be Microsoft .ICO files
 !define icon "Files\App.ico"
 
; installer background screen
; !define screenimage background.bmp
 
; file containing list of file-installation commands
; !define files "files.nsi"
 
; file containing list of file-uninstall commands
; !define unfiles "unfiles.nsi"

; icons must be Microsoft .ICO files
 !define defaultInstallDir "C:\M314Apps"
 
; registry stuff
 
!define PRODUCT_REGKEY "Software\M314Apps"
!define uninstkey "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
 
;!define startmenu "$SMPROGRAMS\${PRODUCT_NAME}"
!define uninstaller "${PRODUCT_NAME}_Uninstall.exe"
 
;--------------------------------

;Loads the Nsis language file, necessary for unistall messages.
;LoadLanguageFile "${NSISDIR}\Contrib\Language files\Norwegian.nlf"
 
;XPStyle on

;ShowInstDetails hide
;ShowUninstDetails hide

 
Name "${PRODUCT_NAME}"
Caption "${PRODUCT_NAME}"
 
!ifdef icon
  !define MUI_ICON "${icon}"
  !define MUI_UNICON "${icon}"
!endif
 
OutFile "${SETUP_FILEBASE}.exe"
 
;SetDateSave on
;SetDatablockOptimize on
;CRCCheck on
;SilentInstall normal
 
InstallDir "${defaultInstallDir}"
InstallDirRegKey HKLM "${PRODUCT_REGKEY}" "${PRODUCT_NAME}"
 

;LANGUAGE 
!include "MUI2.nsh"

!define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_REGKEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

; pages
; we keep it simple - leave out selectable installation types

 

; Page components
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
 
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
!insertmacro MUI_LANGUAGE "Norwegian"

!insertmacro MUI_RESERVEFILE_LANGDLL 
;--------------------------------
 
AutoCloseWindow false
ShowInstDetails show
 
; Request application privileges for Windows Vista+
RequestExecutionLevel admin


!ifdef screenimage
 
; set up background image
; uses BgImage plugin
 
 Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function un.onInit
  !insertmacro MUI_UNGETLANGUAGE
FunctionEnd

Function .onGUIInit
	; extract background BMP into temp plugin directory
	InitPluginsDir
	File /oname=$PLUGINSDIR\1.bmp "${screenimage}"
 
	BgImage::SetBg /NOUNLOAD /FILLSCREEN $PLUGINSDIR\1.bmp
	BgImage::Redraw /NOUNLOAD
FunctionEnd
 
Function .onGUIEnd
	; Destroy must not have /NOUNLOAD so NSIS will be able to unload and delete BgImage before it exits
	BgImage::Destroy
FunctionEnd
 
!endif
 
  ;Auto Updater
Function SetInstallUpdate

  ;Auto Updater
  ;Get Installer filename
  System::Call 'kernel32::GetModuleFileName(p 0, t .R0, i ${NSIS_MAX_STRLEN}) i.r1'
  
  ;${GetBaseName} $R0 $R1 ;R1 contans filename without ext
  
  ${GetTime} $R0 "MS" $0 $1 $2 $3 $4 $5 $6
	; $0="01"      day
	; $1="04"      month
	; $2="2005"    year
	; $3="Friday"  day of week name
	; $4="11"      hour
	; $5="05"      minute
	; $6="50"      seconds'
  ;MessageBox MB_OK 'Date=$0/$1/$2 ($3)$\nTime=$4:$5:$6'

  SetRegView 64
  
  WriteRegStr HKLM ${PRODUCT_REGKEY} '${SETUP_FILEBASE}InstallTime' '$0.$1.$2 $4:$5:$6'
  
  WriteRegStr HKLM ${PRODUCT_REGKEY} '${SETUP_FILEBASE}InstallUrl' ${AUTOUPDATE_URL}
  
    DetailPrint "SetInstallUpdate reg values"
FunctionEnd

;                            IsWritable
;____________________________________________________________________________
;
; Checks if a path exists and is writable by the user.
;
;Syntax:
;${IsWritable} "[Path]" $res
; 
;"[Path]"          ; The path to check
;                  ;
;$res              ; Result:
;                  ;    $res=0   [Path] exists and is writable by the user.
;                  ;    $res=1   [Path] doesn't exist or is read-only.
;
;Example1:
;
;Section
;  ${TryDeleteFile} "C:\Program Files\Pl0p" $R0
;  ; at this point $R0 is 0 if "C:\Program Files\Pl0p" exists and is writable.
;  ; else $R0 is 1 ("C:\Program Files\Pl0p" doesn't exists or is read-only).
;SectionEnd
;

LangString DBBusyMsg ${LANG_NORWEGIAN} "Database applikasjonen ${PRODUCT_NAME} har startet opp. En nyere versjon av databasen skal installeres. $\nVennligst lukk databasen med databasens AVSLUTT-knapp, og klikk deretter RETRY\PROEV IGJEN-knappen for at installasjonen av en nyere versjon skal kunne fullfoeres."

Function TryDeleteFile
  !define TryDeleteFile `!insertmacro TryDeleteFileCall`
 
  !macro TryDeleteFileCall _PATH _RESULT
    Push `${_PATH}`
    Call TryDeleteFile
    Pop ${_RESULT}
  !macroend
 
  Exch $R0
  Push $R1

  # Checks if $R0 is not empty.
  StrLen $R1 $R0
  StrCmp $R1 0 exit

  IfFileExists $R0 0 noerror

startdelete:
  # Clear errors
  ClearErrors
  #Try to delete the file
  Delete $R0
  
  IfErrors nook
  
noerror:
  #OK, no errors
  StrCpy $R1 1
  Goto exit
 
nook:
  StrCpy $R1 0
   MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION $(DBBusyMsg) IDRETRY startdelete
	Abort
 
exit:
  Exch
  Pop $R0
  Exch $R1
 
FunctionEnd

Function un.TryDeleteFile
  !define un.TryDeleteFile `!insertmacro un.TryDeleteFileCall`
 
  !macro un.TryDeleteFileCall _PATH _RESULT
    Push `${_PATH}`
    Call un.TryDeleteFile
    Pop ${_RESULT}
  !macroend
 
  Exch $R0
  Push $R1

  # Checks if $R0 is not empty.
  StrLen $R1 $R0
  StrCmp $R1 0 exit

  IfFileExists $R0 0 noerror

startdelete:
  # Clear errors
  ClearErrors
  #Try to delete the file
  Delete $R0
  
  IfErrors nook
  
noerror:
  #OK, no errors
  StrCpy $R1 1
  Goto exit
 
nook:
  StrCpy $R1 0
  MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "Database applikasjonen ${PRODUCT_NAME} har startet opp. En nyere versjon av databasen skal installeres. $\nVennligst lukk databasen med databasens AVSLUTT-knapp, og klikk deretter RETRY\PROEV IGJEN-knappen for at installasjonen av en nyere versjon skal kunne fullfoeres." IDRETRY startdelete
	Abort
 
exit:
  Exch
  Pop $R0
  Exch $R1
 
FunctionEnd



; beginning (invisible) section
Section

  ;SetDetailsPrint listonly
  DetailPrint "Installerer ${PRODUCT_NAME}..."
  ;SetDetailsPrint none
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  

  
  ;WriteRegStr HKLM "${PRODUCT_REGKEY}" "Install_Dir" "$INSTDIR"
     
; any application-specific files
;!ifdef files
;!include "${files}"
;!endif
  Call AddFiles  
  
  ;Auto-kill autohotkey process
  ${nsProcess::CloseProcess} "StartM314.exe" $R0
  
    ; Put files here
  File /a "Files\App.ico"
  File /a "Files\CIAutoUpdater.exe"
  File /a "Files\StartM314.exe"
  File /a "Files\MSAccessTrustedLocations.exe"
  File /a "Files\M314${M314_NAME}_Readme.txt"
  
  ; write uninstall strings
  WriteRegStr HKLM "${uninstkey}" "DisplayName" "${PRODUCT_NAME}"
  WriteRegStr HKLM "${uninstkey}" "UninstallString" '"$INSTDIR\${uninstaller}"'
  WriteRegStr HKLM "${uninstkey}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "${uninstkey}" "DisplayIcon" "$INSTDIR\App.ico, 0"
  WriteRegStr HKLM "${uninstkey}" "Publisher" "${PUBLISHER}"
  
  ;Uninstaller
  WriteUninstaller "${uninstaller}"
  
  ;Auto Updater
  Call SetInstallUpdate
  
  ;;Startup with windows shortcut
  CreateShortCut "$SMPROGRAMS\Startup\StartM314.lnk" "$INSTDIR\StartM314.exe" "" "StartM314.exe" 0
     
  Exec "$INSTDIR\StartM314.exe" 
  ExecWait '"$INSTDIR\MSAccessTrustedLocations.exe" /ADD "$INSTDIR" 0 "M314 Apps Location"'
  
  
  ;SetDetailsPrint listonly
  DetailPrint ""
  DetailPrint "Databasen ${PRODUCT_NAME} er ferdig installert. Du kan naa aapne databasen paa nytt!"
  ;SetDetailsPrint none
  
  ExecShellWait "open" "$INSTDIR\M314${M314_NAME}_Readme.txt" 
  
  ;IfSilent 0 +2
	;MessageBox MB_OK|MB_ICONINFORMATION "Databasen ${PRODUCT_NAME} er ferdig installert. Du kan naa aapne databasen paa nytt!"
 

 
SectionEnd
 
; create shortcuts
; Section
 
  ; CreateDirectory "${startmenu}"
  ; SetOutPath $INSTDIR ; for working directory
; !ifdef icon
  ; CreateShortCut "${startmenu}\${PRODUCT_NAME}.lnk" "$INSTDIR\${exec}" "" "$INSTDIR\${icon}"
; !else
  ; CreateShortCut "${startmenu}\${PRODUCT_NAME}.lnk" "$INSTDIR\${exec}"
; !endif
 
; !ifdef notefile
  ; CreateShortCut "${startmenu}\Release Notes.lnk "$INSTDIR\${notefile}"
; !endif
 
; !ifdef helpfile
  ; CreateShortCut "${startmenu}\Documentation.lnk "$INSTDIR\${helpfile}"
; !endif
 
; !ifdef website
; WriteINIStr "${startmenu}\web site.url" "InternetShortcut" "URL" ${website}
 ; ; CreateShortCut "${startmenu}\Web Site.lnk "${website}" "URL"
; !endif
 
; !ifdef notefile
; ExecShell "open" "$INSTDIR\${notefile}"
; !endif
 
; SectionEnd
 
; Uninstaller
; All section names prefixed by "Un" will be in the uninstaller
 
;UninstallText "This will uninstall ${PRODUCT_NAME}."
 
!ifdef icon
UninstallIcon "${icon}"
!endif
 
Section "Uninstall"

  ;SetDetailsPrint listonly
  DetailPrint "Avinstallerer ${PRODUCT_NAME}..."
  ;SetDetailsPrint none
  
  Delete "$INSTDIR\*.laccdb"
  
  ;Delete uninstall info from registry
  DeleteRegKey HKLM "${uninstkey}"
  
  ;Delete uninstaller
  Delete "$INSTDIR\${uninstaller}"

; !ifdef unfiles
; !include "${unfiles}"
; !endif
  Call un.DeleteFiles

!ifdef licensefile
Delete "$INSTDIR\${licensefile}"
!endif
 
!ifdef notefile
Delete "$INSTDIR\${notefile}"
!endif

  ;NOTE: ONLY DELETE REST IF NO MORE DB's LEFT
  ClearErrors
  FindFirst $0 $1 "$INSTDIR\*.accdb"
  IfErrors 0 done

  ;DELETE REST OF COMMON FILES
  ;Auto-kill autohotkey process
  ${nsProcess::CloseProcess} "StartM314.exe" $R0
  
  ;Remove from trusted locations
  ExecWait '"$INSTDIR\MSAccessTrustedLocations.exe" /REMOVE "$INSTDIR"'
  
  ;Delete shortcuts
  Delete "$SMPROGRAMS\Startup\StartM314.lnk"
  
  ;Delete common app files
  Delete "$INSTDIR\App.ico"
  Delete "$INSTDIR\CIAutoUpdater.exe"
  Delete "$INSTDIR\StartM314.exe"
  Delete "$INSTDIR\MSAccessTrustedLocations.exe"
  
  RMDir $INSTDIR

done:
  
  ;Delete App Key
  ;DeleteRegKey HKLM ${PRODUCT_REGKEY}

  ;SetDetailsPrint listonly
  DetailPrint "${PRODUCT_NAME} avinstallasjon ferdig"
  ;SetDetailsPrint none

  ;SetAutoClose true

  
  ;DeleteRegKey HKLM "${PRODUCT_REGKEY}"
 
  ;Delete "${startmenu}\*.*"
  ;Delete "${startmenu}"
 


 

 
SectionEnd