#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Close programs -- Ctrl+Q === Alt+F4
;
; This implements the original macOS shortcut for closing programs. 
; That way the shortcuts for closing a window (Ctrl+W) and closing a program (Ctrl+Q) are grouped together together.
;
^SC010::Send !{F4}
return

