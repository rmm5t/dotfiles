local wezterm = require "wezterm"
local config = wezterm.config_builder()
local act = wezterm.action
local shell = (os.getenv "SHELL" or ""):match("([^/]+)$")

local function basename(path)
  return path:gsub("/+$", ""):match("([^/]+)$") or path
end

local location_cache = {}

local function tab_location(cwd)
  if location_cache[cwd] then
    return location_cache[cwd]
  end

  local location = basename(cwd)
  local directory = cwd:gsub("/+$", "")
  if directory == "" then
    directory = "/"
  end

  while true do
    local git_marker = directory == "/" and "/.git" or directory .. "/.git"
    local handle = io.open(git_marker, "r")
    if handle then
      handle:close()
      location = basename(directory)
      break
    end

    local parent = directory:match("^(.*)/[^/]+$")
    if not parent then
      break
    end
    if parent == "" then
      parent = "/"
    end
    directory = parent
  end

  location_cache[cwd] = location
  return location
end

wezterm.on("format-tab-title", function(tab)
  local pane = tab.active_pane
  local cwd_uri = pane.current_working_dir
  local cwd = cwd_uri and cwd_uri.file_path
  local location = cwd and tab_location(cwd) or "?"
  local process = basename(pane.foreground_process_name or "")

  if process == "" or process == shell then
    return string.format(" %s ", location)
  end

  return string.format(" %s ❯ %s ", location, process)
end)

config = {
   front_end = "WebGpu",

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

for i = 1, 9 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end

return config
