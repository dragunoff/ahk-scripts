;
; PHP
; ===
; AHK scripts to aid in PHP development
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;
; Open PHP by pressing Alt+,
;
!,::
	Send, <?php{Space}
	Return
	
;
; Close PHP by pressing Alt+.
;
!.::
	Send, ?>
	Return
	
;
; Expand <? to <?php
;
::<?::<?php
