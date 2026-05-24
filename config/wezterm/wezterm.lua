local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  automatically_reload_config = true,
  check_for_updates = false,
  front_end = 'WebGpu',
  enable_wayland = true,
  term = 'wezterm',

  font = wezterm.font_with_fallback({
    { family = 'CaskaydiaCove Nerd Font', weight = 'Regular' },
    { family = 'Iosevka Nerd Font', weight = 'Regular' },
    'Noto Color Emoji',
  }),
  font_size = 11.5,
  harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },

  window_decorations = 'RESIZE',
  window_background_opacity = 0.88,
  macos_window_background_blur = 25,
  text_background_opacity = 1.0,
  inactive_pane_hsb = { saturation = 0.8, brightness = 0.65 },

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,

  default_cursor_style = 'BlinkingBar',
  cursor_blink_rate = 550,
  animation_fps = 60,
  max_fps = 120,

  window_padding = { left = 24, right = 24, top = 22, bottom = 22 },

  keys = {
    { key = 'Enter', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'Enter', mods = 'ALT|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { key = 'r', mods = 'CTRL|SHIFT', action = wezterm.action.ReloadConfiguration },
  },

  colors = {
    foreground = '#f4f7ff',
    background = '#070912',
    cursor_bg = '#ff6b8b',
    cursor_border = '#ff6b8b',
    selection_fg = '#070912',
    selection_bg = '#89f7fe',
    ansi = { '#1b1f2e', '#ff6b8b', '#8bdc97', '#f9d56e', '#89b4fa', '#cba6f7', '#89f7fe', '#cdd6f4' },
    brights = { '#343b55', '#ff8aa2', '#a6e3a1', '#f9e2af', '#a4c8ff', '#d8b4fe', '#94e2d5', '#ffffff' },
  },
}
