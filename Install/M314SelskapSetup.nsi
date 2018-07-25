!define M314_NAME "Selskap"
 
; Auto Updater
!define AUTOUPDATE_URL "https://onedrive.live.com/download?cid=38E6F1503F629A15&resid=38E6F1503F629A15%219491&authkey=AAHdUlQLX2Lhi3s"

;---------------------------------------------------------------

!include "M314AppsSetupBase.nsi"

Function AddFiles
  ;Try to delete db FileSees
  ${TryDeleteFile} "$INSTDIR\M314${M314_NAME}.accdb" $R1
  ${TryDeleteFile} "$INSTDIR\M314${M314_NAME}.accde" $R1

  File /a "Files\M314${M314_NAME}.accde"
FunctionEnd

Function un.DeleteFiles
  ;Try to delete db FileSees
  ${un.TryDeleteFile} "$INSTDIR\M314${M314_NAME}.accdb" $R1
  ${un.TryDeleteFile} "$INSTDIR\M314${M314_NAME}.accde" $R1

  ;Delete "$INSTDIR\M314${M314_NAME}.accde"
FunctionEnd