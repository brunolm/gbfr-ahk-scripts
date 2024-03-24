; Hold left or right click to use the turbo

#IfWinActive, Granblue Fantasy: Relink

  toggle := false
  RButton::
    toggle := true
    While toggle
    {
      if (!WinActive("Granblue Fantasy: Relink") || !GetKeyState("RButton", "P")) {
        toggle := false
        break
      }
      Click Right
      Sleep, 15
    }
  return

  LButton::
    toggle := true
    While toggle
    {
      if (!WinActive("Granblue Fantasy: Relink") || !GetKeyState("LButton", "P")) {
        toggle := false
        break
      }
      Click
      Sleep, 15
    }
  return

#IfWinActive