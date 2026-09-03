local wezterm = require "wezterm"
local config = wezterm.config_builder()

config = {
   window_close_confirmation = "NeverPrompt",
   window_decorations = "RESIZE",

   default_cursor_style = "BlinkingBlock",

   color_scheme = "Tokyo Night",
   font = wezterm.font "MesloLGS Nerd Font",
   font_size = 14,
}
return config
