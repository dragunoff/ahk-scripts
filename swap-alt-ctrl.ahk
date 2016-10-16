;
; Swap ALT and CTRL
; ===
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Swap Left Alt and Left Ctrl
LAlt::LCtrl 
LCtrl::LAlt

; Swap Right Alt and Right Ctrl
; RAlt::RCtrl 
; RCtrl::RAlt
