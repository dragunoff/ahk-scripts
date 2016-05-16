; Name: Volume Control
; Author: Shad0w-Beast
; Description: Control the Volume by Scrolling while cursor is on the task bar. Click the scroller to mute.
; URL: http://pastebin.com/Mc8uWZtN

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; #Notrayicon

; Volume Up
WheelUp::
If MouseIsOver("ahk_class Shell_TrayWnd")
    Send {Volume_Up 2}
else
  Send, {WheelUp}
return

; Volume Down
WheelDown::
If MouseIsOver("ahk_class Shell_TrayWnd")
    Send {Volume_Down 2}
else
  Send, {WheelDown}
return

; Toggle Mute
~MButton::
If MouseIsOver("ahk_class Shell_TrayWnd")
    Send {Volume_Mute}
return

; Mouse Position
MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
