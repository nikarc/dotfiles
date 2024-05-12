-- Universal configuratoin

local wezterm = require 'wezterm'
local act = wezterm.action

return {
  animation_fps = 60,
  cursor_blink_rate = 800,
  default_cursor_style = 'BlinkingBlock',
  enable_wayland = false,
  front_end = 'WebGpu',
  font_size = 14,
  -- font = wezterm.font 'Fira Code',
  -- font = wezterm.font 'Sarasa Term SC Nerd',
  scrollback_lines = 10000,
  window_background_opacity = 0.75,
  keys = {
    {
      key = 'k',
      mods = 'SUPER',
      action = act.ClearScrollback 'ScrollbackAndViewport',
    },
    {
      key = 'r',
      mods = 'SUPER',
      action = act.ClearScrollback 'ScrollbackAndViewport',
    }
  }
}
