;
; Remap CapsLock to Backspace
; ===
; This script is derrived from https://gist.github.com/Danik/5808330
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Autohotkey Capslock Remapping Script
; 
; Functionality:
; - Deactivates capslock for normal (accidental) use.
; - Access the following functions when pressing Capslock: 
;     Cursor keys                - J, K, L, I
;     Enter                      - Space
;     Home, PgDn, PgUp, End      - U, O, Y, H
;     Backspace and Del  - N, M
;
;     Undo, redo                 - , and .
;






#Persistent
SetCapsLockState, AlwaysOff





;
; Capslock + jkli (left, down, up, right)
;
; j = SC024
; k = SC025
; l = SC026
; i = SC017
;
;
Capslock & SC024::Send {Blind}{Left DownTemp}
Capslock & SC024 up::Send {Blind}{Left Up}

Capslock & SC025::Send {Blind}{Down DownTemp}
Capslock & SC025 up::Send {Blind}{Down Up}

Capslock & SC017::Send {Blind}{Up DownTemp}
Capslock & SC017 up::Send {Blind}{Up Up}

Capslock & SC026::Send {Blind}{Right DownTemp}
Capslock & SC026 up::Send {Blind}{Right Up}





;
; Capslock + uoyh (home, end, pgup, pgdown)
;
; u = SC016
; o = SC018
; y = SC015
; h = SC025
;
;
Capslock & SC016::SendInput {Blind}{Home Down}
Capslock & SC016 up::SendInput {Blind}{Home Up}

Capslock & SC018::SendInput {Blind}{End Down}
Capslock & SC018 up::SendInput {Blind}{End Up}

Capslock & SC015::SendInput {Blind}{PgUp Down}
Capslock & SC015 up::SendInput {Blind}{PgUp Up}

Capslock & SC023::SendInput {Blind}{PgDn Down}
Capslock & SC023 up::SendInput {Blind}{PgDn Up}





;
; Capslock + nm (backspace, del)
;
; n = SC031
; m = SC032
;
Capslock & SC031::SendInput {Blind}{BS Down}
Capslock & SC032::SendInput {Blind}{Del Down}





;
; Capslock + ,/. (undo/redo)
;
; , = SC033
; . = SC034
;
Capslock & SC033::SendInput {Ctrl Down}{z Down}
Capslock & SC033 up::SendInput {Ctrl Up}{z Up}
Capslock & SC034::SendInput {Ctrl Down}{y Down}
Capslock & SC034 up::SendInput {Ctrl Up}{y Up}





;
; Make Capslock+Space -> Enter
;
Capslock & Space::SendInput {Enter Down}
