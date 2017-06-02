;
; Improved combos for switching between windows and tabs.
; ===
; 
; This mod is useful if you've swapped LCtrl and LAlt in the registry.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Map Win+Tab to Alt+Tab
;
LWin & Tab:: AltTab

;
; Map Alt+Tab to Win+Tab
;
!Tab::Send {LWin down}{Tab}{LWin up}

;
; Map Alt+Shift+Tab to Win+Shift+Tab
;
!+Tab::Send {Shift down}{LWin down}{Tab}{LWin up}{Shift up}
