import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.Spacing

myManageHook = composeAll
    [ className =? "gimp"      --> doFloat
    , className =? "vlc" --> doFloat
    ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook  defaultConfig
        , workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#F0A830" "" . shorten 50
                        , ppCurrent = xmobarColor "#7FCE4D" "" . wrap "[" "]"
			, ppSep = "   |   "
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        --, numlockMask           = mod2Mask
        } `additionalKeys`
        [ 
            	--((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
		((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l")
            	, ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
		, ((mod4Mask, xK_e), spawn "nautilus --no-desktop")
		, ((mod4Mask, xK_g), spawn "gedit")
		--, ((mod4Mask, xK_d), spawn "emacs")
		, ((mod4Mask, xK_v), spawn "gvim")
		, ((mod4Mask, xK_c), spawn "chromium")
    	    	--, ((mod4Mask, xK_m), spawn "exaile")
    	    	, ((mod4Mask, xK_f), spawn "/home/nyx/bin/firefox/firefox")
    	    	, ((mod4Mask, xK_k), spawn "gnome-calculator")
    	    	, ((mod4Mask, xK_b), spawn "banshee")
    	    	, ((mod4Mask, xK_d), spawn "dmenu_run")
            	, ((0, xK_Print), spawn "scrot")
        ] 
       
