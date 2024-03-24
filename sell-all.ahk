; Select the bottom element on the list before running the script

toggle := false

; Mouse middle button
MButton::
  toggle := false
  Tooltip, OFF
  Sleep 2000
  Tooltip
return 

; ALT + SHIFT + S
+!s::
  toggle := !toggle

  Tooltip, % (toggle ? "ON: Middle Mouse Button to stop" : "OFF")
  Sleep 2000
  Tooltip

  While toggle {
    Loop, 30
    {
      if (!CheckWindowActive() || !toggle)
        break

      Click
      Sleep, 20

      Send, {Up down}
      Sleep, 30

      Send, {Up up}
      Sleep, 20

      Sleep 10
    }

    if (!CheckWindowActive() || !toggle)
      break

    Send, {3 down}
    Sleep, 100

    Send, {3 up}
    Sleep, 400

    if (!CheckWindowActive() || !toggle)
      break

    Send, {Up down}
    Sleep, 100

    Send, {Up up}
    Sleep, 100

    if (!CheckWindowActive() || !toggle)
      break

    Click
    Sleep, 400

    if (!CheckWindowActive() || !toggle)
      break

    Click
    Sleep, 100

    if (!CheckWindowActive() || !toggle)
      break

    Send, {Down down}
    Sleep, 100

    Send, {Down up}
    Click
    Sleep, 200

    if (!CheckWindowActive() || !toggle)
      break

    Click
    Sleep, 200
  }

return

CheckWindowActive() {
return WinActive("Granblue Fantasy: Relink")
}