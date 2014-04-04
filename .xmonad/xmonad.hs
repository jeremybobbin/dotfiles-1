import XMonad
import XMonad.Hooks.Script

main = do
    xmonad $ defaultConfig
      { terminal      = mTerm
      , borderWidth   = mBorder
      , startupHook   = execScriptHook mStartupHook
      }
mTerm = "gnome-terminal"
mBorder = 3
mStartupHook = "xmonad"
