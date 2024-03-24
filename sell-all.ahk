; Select the bottom element on the list before running the script

; ALT + SHIFT + S
+!s::
  toggle := true
  While toggle
  {
    if (!CheckWindowActive()) break

    Loop, 30
    {
      Click
      Sleep, 20
      if (!CheckWindowActive()) break

      Send, {Up down}
      Sleep, 30
      if (!CheckWindowActive()) break

      Send, {Up up}
      Sleep, 20
      if (!CheckWindowActive()) break

      Sleep 10
    }
    Send, {3 down}
    Sleep, 100
    if (!CheckWindowActive()) break

    Send, {3 up}
    Sleep, 400
    if (!CheckWindowActive()) break

    Send, {Up down}
    Sleep, 100
    if (!CheckWindowActive()) break

    Send, {Up up}
    Sleep, 100
    if (!CheckWindowActive()) break

    Click
    Sleep, 400
    if (!CheckWindowActive()) break

    Click
    Sleep, 100
    if (!CheckWindowActive()) break

    Send, {Down down}
    Sleep, 100
    if (!CheckWindowActive()) break

    Send, {Down up}
    Click
    Sleep, 200
    if (!CheckWindowActive()) break

    Click
    Sleep, 200
    if (!CheckWindowActive()) break
    }
return

CheckWindowActive() {
  if (!WinActive("Granblue Fantasy: Relink")) {
    toggle := false
    return false
  }
return true
}