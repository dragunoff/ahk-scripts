#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Close programs -- Win+Q === Alt+F4
;
; Use Win+Q to close programs. The original MacOS shortcut is Ctrl+Q but that could be easily 
; pressed unintentionaly and that's not good in some contexts (gaming for example).
;
#SC010::Send !{F4}
return

;
; Swap F1 and F12
;
F1::F12
F12::F1

