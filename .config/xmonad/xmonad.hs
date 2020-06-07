-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar $XDG_CONFIG_HOME/xmonad/xmobar.hs"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
                ppCurrent = xmobarColor "#BD93F9" "" . wrap "[" "]"
                , ppTitle = xmobarColor "#BD93F9" "" . shorten 50
                }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    }

myTerminal    = "st"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1
myNormalBorderColor = "#282a36"
myFocusedBorderColor = "#CAA9FA"
