#SingleInstance Force
SetCapsLockState, AlwaysOff

CapsLock & k::
Run, komorebic.exe focus up, , Hide
return

CapsLock & j::
Run, komorebic.exe focus down, , Hide
return

CapsLock & l::
Run, komorebic.exe focus right, , Hide
return

CapsLock & h::
Run, komorebic.exe focus left, , Hide
return

CapsLock & f::
Run, hap.exe /hint
return

CapsLock & LEFT::
Run, komorebic.exe move left, , Hide
return

CapsLock & DOWN::
Run, komorebic.exe move down, , Hide
return

CapsLock & UP::
Run, komorebic.exe move up, , Hide
return

CapsLock & RIGHT::
Run, komorebic.exe move right, , Hide
return


; massimizza la scheda
CapsLock & m::
Run, komorebic.exe toggle-maximize, , Hide
return

; non segue la logica di float
CapsLock & n::
Run, komorebic.exe toggle-float, , Hide
return

; Pause responding to any window events or komorebic commands, Alt + P
CapsLock & Pause::
Run, komorebic.exe toggle-pause, , Hide
return

; Switch to workspace
CapsLock & 1::
Send !
Run, komorebic.exe focus-workspace 0, , Hide
return

CapsLock & 2::
Send !
Run, komorebic.exe focus-workspace 1, , Hide
return

CapsLock & 3::
Send !
Run, komorebic.exe focus-workspace 2, , Hide
return

CapsLock & 4::
Send !
Run, komorebic.exe focus-workspace 3, , Hide
return

CapsLock & 5::
Send !
return

; Move window to workspace
CapsLock & q::
Run, komorebic.exe move-to-workspace 0, , Hide
return

CapsLock & w::
Run, komorebic.exe move-to-workspace 1, , Hide
return

CapsLock & e::
Run, komorebic.exe move-to-workspace 2, , Hide
return

CapsLock & r::
Run, komorebic.exe move-to-workspace 3, , Hide
return

CapsLock & t::
return
