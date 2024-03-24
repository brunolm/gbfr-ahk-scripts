; After pressing the shortcut, select the area on your screen where
; the Transmarvel results show. To force stop tab out of the game.

; ########################################################
; CONFIGURATION
; download Capture2Text from https://sourceforge.net/projects/capture2text/files/Capture2Text/
exe_path := "C:\System\Capture2Text\Capture2Text.exe"

; what you want to search for
search_text := "(Stamina|Vision|Critical R)"

; how many times to check (MAX)
loop_count := 10 

; ########################################################
; DO NOT EDIT BELOW THIS LINE
; ########################################################

; ALT + SHIFT + T
+!t::

  ; x_start := 1435
  ; y_start := 1137
  ; x_end := 2400
  ; y_end := 1300

  getSelectionCoords(x_start, x_end, y_start, y_end)

  ; focus window
  WinActivate, Granblue Fantasy: Relink
  Sleep 100

  Click, %x_start%, %y_start%
  Click, %x_start%, %y_start%

  Loop, %loop_count%
  {
    if (!WinActive("Granblue Fantasy: Relink"))
    {
      break
    }

    Click
    Sleep 1200
    Click
    Sleep 500
    RunWait, % exe_path " -s """ x_start " " y_start " " x_end " " y_end """ --clipboard"

    ; check if clipboard has the text, case insensitive
    if (RegExMatch(clipboard, "i)" . search_text)) {
      Tooltip, Found sigil
      Sleep 5000
      Tooltip
      break ; Exit the loop if the text is found
    }
  }

return

; creates a click-and-drag selection box to specify an area
getSelectionCoords(ByRef x_start, ByRef x_end, ByRef y_start, ByRef y_end) {
  ;Mask Screen
  Gui, Color, FFFFFF
  Gui +LastFound
  WinSet, Transparent, 50
  Gui, -Caption 
  Gui, +AlwaysOnTop
  Gui, Show, x0 y0 h%A_ScreenHeight% w%A_ScreenWidth%,"AutoHotkeySnapshotApp" 

  ;Drag Mouse
  CoordMode, Mouse, Screen
  CoordMode, Tooltip, Screen
  WinGet, hw_frame_m,ID,"AutoHotkeySnapshotApp"
  hdc_frame_m := DllCall( "GetDC", "uint", hw_frame_m)
  KeyWait, LButton, D 
  MouseGetPos, scan_x_start, scan_y_start 
  Loop
  {
    Sleep, 10 
    KeyIsDown := GetKeyState("LButton")
    if (KeyIsDown = 1)
    {
      MouseGetPos, scan_x, scan_y 
      DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", 0,"int",0,"int", A_ScreenWidth,"int",A_ScreenWidth)
      DllCall( "gdi32.dll\Rectangle", "uint", hdc_frame_m, "int", scan_x_start,"int",scan_y_start,"int", scan_x,"int",scan_y)
    } else {
      break
    }
  }

  ;KeyWait, LButton, U
  MouseGetPos, scan_x_end, scan_y_end
  Gui Destroy

  if (scan_x_start < scan_x_end)
  {
    x_start := scan_x_start
    x_end := scan_x_end
  } else {
    x_start := scan_x_end
    x_end := scan_x_start
  }

  if (scan_y_start < scan_y_end)
  {
    y_start := scan_y_start
    y_end := scan_y_end
  } else {
    y_start := scan_y_end
    y_end := scan_y_start
  }
}