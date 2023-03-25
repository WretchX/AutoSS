;##### USER CONFIG #####
Global $quality = 80 				;JPG Quality. 1-100.
Global $seconds = 10 				;how many seconds between each screenshot
Global $folderName = "Project1" 	;folder on desktop screenshots will be saved to. Must exist, script will not create it.
Global $tooltipEnable = True		;whether status tooltip will be shown or not. True/False
Global $programToActivate = "Adobe Photoshop"	;title of the window that must be active to take a screenshot
;##### USER CONFIG #####

#include <ScreenCapture.au3>
Opt("WinTitleMatchMode", 2) ;substring
HotKeySet("{HOME}","Terminate")
_ScreenCapture_SetJPGQuality ($quality)
Global $num = 1
Global $tipRunning = "SS Running"
Init()
AdlibRegister("SS", $seconds*1000)

While 1
	sleep(100)
	If WinActive($programToActivate) == 0 Then ToolTip($tipRunning, 0, 0)
	If FileExists(@DesktopDir & "\" & $FolderName & "\SS" & $num & ".jpg") Then $num += 1
WEnd

Func Init()
	Local $hBmp
	$hBmp = _ScreenCapture_Capture("")
	_ScreenCapture_SaveImage(@DesktopDir & "\" & $FolderName & "\SS" & $num & ".jpg", $hBmp)
EndFunc

Func SS()
	If WinActive($programToActivate) <> 0 And FileExists(@DesktopDir & "\" & $FolderName) Then
		If $tooltipEnable = True Then ToolTip("SS ACTIVE", 0, 0)
		Local $hBmp
		$hBmp = _ScreenCapture_Capture("")
		_ScreenCapture_SaveImage(@DesktopDir & "\" & $FolderName & "\SS" & $num & ".jpg", $hBmp)
		ConsoleWrite("Screenshot Saved!" & @CRLF)
	Else
		MsgBox(16, "Error", "Specified folder .\Desktop\" & $folderName & " does not exist." & _
		@CRLF & "Create this folder or change the folder name, then run this program again.")
		Exit 2
	EndIf
EndFunc

Func Terminate()
	ToolTip("")
	Exit 1
EndFunc