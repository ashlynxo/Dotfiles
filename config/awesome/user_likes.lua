local menubar = require "menubar"

username = "Ashlyn"
terminal = os.getenv("TERMINAL") or "wezterm"
browser = os.getenv("BROWSER") or "firefox"
launcher = "rofi -show drun -show-icons"
editor = os.getenv("EDITOR") or "nvim"
visual_editor = "code"
editor_cmd = terminal .. " start -- " .. editor
modkey = "Mod4"

menubar.utils.terminal = terminal
