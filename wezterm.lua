local wezterm = require "wezterm"
local config = wezterm.config_builder()
local act = wezterm.action

config = {
   window_close_confirmation = "NeverPrompt",
   window_decorations = "RESIZE",

   default_cursor_style = "BlinkingBlock",

   color_scheme = "Tokyo Night",
   font = wezterm.font "MesloLGS Nerd Font",
   font_size = 14,

   window_background_opacity = 0.95,
   macos_window_background_blur = 10,
}

config.keys = {
  -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
  -- shell to redraw its prompt
  {
    key = "k",
    mods = "CMD",
    action = act.Multiple {
      act.ClearScrollback "ScrollbackAndViewport",
      act.SendKey { key = "L", mods = "CTRL" },
    },
  },
}

return config
