import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Script
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import System.IO


myModMask = mod1Mask

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/sabalaba/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , startupHook   = do
            execScriptHook mStartupHook
            setWMName "LG3D"
-- Oddly, this causes xmonad to stop responding sometimes.
--        , logHook = dynamicLogWithPP xmobarPP
--                        { ppOutput = hPutStrLn xmproc
--                        , ppTitle = xmobarColor "green" "" . shorten 50
--                        }
        , modMask = myModMask     -- Rebind Mod to the Windows key
        } `additionalKeys` 
        [ ((myModMask .|. shiftMask, xK_b), spawn "chromium-browser &> /dev/null &")
        , ((0, 0x1008ff03), spawn "sudo macbook.sh mon-dec")
        , ((0, 0x1008ff02), spawn "sudo macbook.sh mon-inc")
        , ((0, 0x1008ff06), spawn "sudo macbook.sh kbd-dec")
        , ((0, 0x1008ff05), spawn "sudo macbook.sh kbd-inc")
        , ((0, 0x1008ff11), spawn "sudo macbook.sh vol-dec")
        , ((0, 0x1008ff13), spawn "sudo macbook.sh vol-inc")
        ]

mStartupHook = "xmonad"
