local appmenu = {}

appmenu.Accessories = {
    { 'Neovim', 'xterm -e nvim', '/usr/share/icons/hicolor/128x128/apps/nvim.png' },
    { 'Picom', 'picom', '/usr/share/icons/hicolor/48x48/apps/compton.png' },
    { 'Vim', 'xterm -e vim', '/usr/share/icons/hicolor/48x48/apps/gvim.png' },
}

appmenu.Games = {
    { 'Noita', 'steam steam://rungameid/881100' },
    { 'Steam', '/usr/bin/steam', '/usr/share/icons/hicolor/48x48/apps/steam.png' },
    { 'Trackmania', 'steam steam://rungameid/2225070' },
}

appmenu.Internet = {
    { 'Avahi SSH Server Browser', '/usr/bin/bssh' },
    { 'Avahi VNC Server Browser', '/usr/bin/bvnc' },
    { 'Firefox Developer Edition', '/usr/lib/firefox-developer-edition/firefox --new-window', '/usr/share/icons/hicolor/48x48/apps/firefox-developer-edition.png' },
    { 'Steam', '/usr/bin/steam', '/usr/share/icons/hicolor/48x48/apps/steam.png' },
    { 'Zen Browser', '/opt/zen-browser-bin/zen-bin', '/usr/share/icons/hicolor/48x48/apps/zen-browser.png' },
}

appmenu.MultiMedia = {
    { 'Qt V4L2 test Utility', 'qv4l2', '/usr/share/icons/hicolor/24x24/apps/qv4l2.png' },
    { 'Qt V4L2 video capture utility', 'qvidcap', '/usr/share/icons/hicolor/24x24/apps/qvidcap.png' },
}

appmenu.System = {
    { 'Alacritty', 'alacritty' },
    { 'Avahi Zeroconf Browser', '/usr/bin/avahi-discover' },
    { 'Htop', 'xterm -e htop', '/usr/share/icons/hicolor/scalable/apps/htop.svg' },
    { 'UXTerm', 'uxterm' },
    { 'XTerm', 'xterm' },
    { 'btop++', 'xterm -e btop', '/usr/share/icons/hicolor/48x48/apps/btop.png' },
}

appmenu.Miscellaneous = {
    { 'Rofi', 'rofi -show', '/usr/share/icons/hicolor/scalable/apps/rofi.svg' },
    { 'Rofi Theme Selector', 'rofi-theme-selector', '/usr/share/icons/hicolor/scalable/apps/rofi.svg' },
}

appmenu.Appmenu = {
    { 'Accessories', appmenu.Accessories },
    { 'Games', appmenu.Games },
    { 'Internet', appmenu.Internet },
    { 'MultiMedia', appmenu.MultiMedia },
    { 'System', appmenu.System },
    { 'Miscellaneous', appmenu.Miscellaneous },
}

return appmenu