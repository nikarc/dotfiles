local wezterm = require 'wezterm'

return {
  animation_fps = 60,
  cursor_blink_rate = 800,
  default_cursor_style = 'BlinkingBlock',
  enable_wayland = true,
  -- font = wezterm.font 'Fira Code',
  font = wezterm.font 'Sarasa Term SC Nerd',
  font_size = 14,
  scrollback_lines = 10000,
  window_background_opacity = 0.9,
}
