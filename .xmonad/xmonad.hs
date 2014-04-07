import XMonad
import XMonad.Hooks.Script
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig

myModMask = mod1Mask

main = do
    xmonad $ defaultConfig
      { terminal      = mTerm
      , borderWidth   = mBorder
      , startupHook   = execScriptHook mStartupHook
      }
      `additionalKeys`
      [ ((myModMask .|. shiftMask, xK_b), spawn "chromium-browser &> /dev/null &")
      , ((0, 0x1008ff03), spawn "sudo macbook.sh mon-dec")
      , ((0, 0x1008ff02), spawn "sudo macbook.sh mon-inc")
      , ((0, 0x1008ff06), spawn "sudo macbook.sh kbd-dec")
      , ((0, 0x1008ff05), spawn "sudo macbook.sh kbd-inc")
      , ((0, 0x1008ff11), spawn "sudo macbook.sh vol-dec")
      , ((0, 0x1008ff13), spawn "sudo macbook.sh vol-inc")
      ]
mTerm = "gnome-terminal"
mBorder = 3
mStartupHook = "xmonad"
