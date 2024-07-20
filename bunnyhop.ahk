#Persistent
SetKeyDelay, 10
SpaceAutoPress := false ; Variable to track if space auto-press is enabled

; Ensure script runs as admin
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

; Apply the correct window class and executable name
#IfWinActive ahk_class CrossFire ahk_exe crossfire.exe

~Space::
    If (!SpaceAutoPress) {
        SpaceAutoPress := true ; Enable space auto-press
        SetTimer, AutoPressSpace, 10 ; Start the timer with a 10ms interval
    }
return

~Space Up::
    If (SpaceAutoPress) {
        SpaceAutoPress := false ; Disable space auto-press
        SetTimer, AutoPressSpace, Off ; Turn off the timer
    }
return

~^Space:: ; Ctrl + Space
    If (!SpaceAutoPress) {
        Send ^{Space} ; Send Ctrl + Space
    }
    else {
        SetTimer, AutoPressSpace, 10 ; Reduce the timer interval for faster repetition
    }
return

AutoPressSpace:
    Send {Space} ; Repeat the process while the space bar is held down
return

#IfWinActive
