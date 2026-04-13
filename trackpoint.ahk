#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Event"
SetMouseDelay(1)
CoordMode("Mouse", "Screen")

mouseStep := 10
mouseDelay := 1
toggleMouseKeys := false

F8::{
    global toggleMouseKeys
    toggleMouseKeys := !toggleMouseKeys
    SoundBeep(toggleMouseKeys ? 1200 : 400, 100)
}

MoveMouse(dirX, dirY, speed := 5, stepMod := 0) {
    keyName := StrReplace(A_ThisHotkey, "+")
    step := mouseStep + stepMod
    while GetKeyState(keyName, "P") {
        MouseMove(dirX * step, dirY * step, speed, "R")
        Sleep(mouseDelay)
    }
}

; Mouse mode - ONLY active when toggleMouseKeys = true
#HotIf toggleMouseKeys

k:: MoveMouse(0, -1)
j:: MoveMouse(0, 1)
h:: MoveMouse(-1, 0)
l:: MoveMouse(1, 0)

+k:: MoveMouse(0, -1, 0, 40)
+j:: MoveMouse(0, 1, 0, 40)
+h:: MoveMouse(-1, 0, 0, 40)
+l:: MoveMouse(1, 0, 0, 40)

u:: Click()
i:: Click("Right")
o:: Click("Middle")

#HotIf  ; Reset - keys now work normally when toggled OFF

