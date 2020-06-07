-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Main configuration, override the defaults to your liking.
myConfig = def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , focusFollowsMouse  = myFocusFollowsMouse
    , clickJustFocuses   = myClickJustFocuses
    , keys = myKeys
    }

-- Command to launch the bar.
myBar = "xmobar $XDG_CONFIG_HOME/xmonad/xmobar.hs"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
                ppCurrent = xmobarColor "#BD93F9" "" . wrap "[" "]"
                , ppTitle = xmobarColor "#BD93F9" "" . shorten 50
                }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Variables
myTerminal    = "st"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1

myNormalBorderColor  = "#282a36"
myFocusedBorderColor = "#CAA9FA"

myClickJustFocuses   = False
myFocusFollowsMouse  = False

-- Key Bindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
    --
      ((modm, xK_Return   ), spawn $ XMonad.terminal conf)
    , ((modm, xK_d        ), spawn "dmenu_run")
    , ((modm, xK_q        ), kill)
    , ((modm, xK_BackSpace), spawn "sysact")

    -- -- XMonad
    , ((modm .|. shiftMask, xK_r ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- -- PAMixer
    , ((modm              , xK_minus), spawn "pamixer --allow-boost -d 5")
    , ((modm .|. shiftMask, xK_minus), spawn "pamixer --allow-boost -d 15")
    , ((modm              , xK_equal), spawn "pamixer --allow-boost -i 5")
    , ((modm .|. shiftMask, xK_equal), spawn "pamixer --allow-boost -i 15")

    -- -- MPC
    , ((modm              , xK_p           ), spawn "mpc toggle")
    , ((modm              , xK_comma       ), spawn "mpc prev")
    , ((modm              , xK_period      ), spawn "mpc next")
    , ((modm              , xK_bracketleft ), spawn "mpc seek -10")
    , ((modm .|. shiftMask, xK_bracketleft ), spawn "mpc seek -60")
    , ((modm              , xK_bracketright), spawn "mpc seek +10")
    , ((modm .|. shiftMask, xK_bracketright), spawn "mpc seek +60")

    -- Windows Management
    , ((modm              , xK_j    ), windows W.focusDown)
    , ((modm .|. shiftMask, xK_j    ), windows W.swapDown)
    , ((modm              , xK_k    ), windows W.focusUp)
    , ((modm .|. shiftMask, xK_k    ), windows W.swapUp)
    , ((modm              , xK_h    ), sendMessage Shrink)
    , ((modm              , xK_l    ), sendMessage Expand)
    , ((modm              , xK_space), windows W.swapMaster)

    ]

    ++
    -- Workspaces
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
