#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Transparent and/or Always On Top 
;
; @url https://autohotkey.com/board/topic/53249-transparent-andor-always-on-top/page-2#entry723742
;

#InstallKeybdHook
#SingleInstance force

winArr := Object()
OnExit, Exit

;
; Win-LButton: make window always on top
;
#LButton::
WinGet, currentWindow, ID, A
addToWinArr(currentWindow)
WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
{
    Winset, AlwaysOnTop, off, ahk_id %currentWindow%
    SplashImage,, x0 y0 b fs12, OFF always on top.
    Sleep, 1500
    SplashImage, Off
}
else
{
    WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
    SplashImage,,x0 y0 b fs12, ON always on top.
    Sleep, 1500
    SplashImage, Off
}
return

;
; Win-wheelup: make window less transparent
;
#wheelup::
WinGet, currentWindow, ID, A
addToWinArr(currentWindow)
if not (%currentWindow%)
{
    %currentWindow% := 255
}
if (%currentWindow% != 255)
{
    %currentWindow% += 5
    WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
}
SplashImage,,w100 x0 y0 b fs12, % %currentWindow%
SetTimer, TurnOffSI, 1000, On
Return

;
; Win-wheelup: make window more transparent
;
#wheeldown::
SplashImage, Off
WinGet, currentWindow, ID, A
addToWinArr(currentWindow)
if not (%currentWindow%)
{
    %currentWindow% := 255
}
if (%currentWindow% != 5)
{
    %currentWindow% -= 5
    WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
}
SplashImage,, w100 x0 y0 b fs12, % %currentWindow%
SetTimer, TurnOffSI, 1000, On
Return

; 
; Win-RButton: make window clickthoughable
;
#RButton::
WinGet, currentWindow, ID, A
addToWinArr(currentWindow)
WinSet, ExStyle, +0x80020, ahk_id %currentWindow%
return

;
; Win-MButton: make window under mouse unclickthroughable
;
#MButton::
MouseGetPos,,, MouseWin ; Gets the unique ID of the window under the mouse
addToWinArr(MouseWin)
WinSet, ExStyle, -0x80020, ahk_id %currentWindow%
Return

TurnOffSI:
SplashImage, off
SetTimer, TurnOffSI, 1000, Off
Return

addToWinArr(chwnd){
    global winArr
    if (!winArr.hasKey(chwnd))
        winArr[chwnd] := true
}

Exit:
    for currentWindow, b in winArr
    {
        WinSet, ExStyle, -0x80020, ahk_id %currentWindow%
        WinSet, Trans, 255, ahk_id %currentWindow%
        Winset, AlwaysOnTop, off, ahk_id %currentWindow%
    }
    ExitApp
return

; Close programs -- Win+Q === Alt+F4
#q::Send !{F4}
return