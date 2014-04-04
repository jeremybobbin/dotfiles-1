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
      ]
mTerm = "gnome-terminal"
mBorder = 3
mStartupHook = "xmonad"
