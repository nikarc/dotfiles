local wezterm = require 'wezterm'
local act = wezterm.action

function ACTIVE_TAB_IDX(mux_win)
   for _, item in ipairs(mux_win:tabs_with_info()) do
      -- wezterm.log_info('idx: ', idx, 'tab:', item)
      if item.is_active then
         return item.index
      end
   end
end

return {
  animation_fps = 60,
  cursor_blink_rate = 800,
  default_cursor_style = 'BlinkingBlock',
  enable_wayland = false,
  front_end = 'WebGpu',
  -- font = wezterm.font 'Fira Code',
  -- font = wezterm.font 'Sarasa Term SC Nerd',
  font = wezterm.font 'Agave Nerd Font',
  font_size = 14,
  scrollback_lines = 10000,
  window_background_opacity = 0.6,
  macos_window_background_blur = 50,
  keys = {
    {
      key = 'k',
      mods = 'SUPER',
      action = act.ClearScrollback 'ScrollbackAndViewport',
    },
    {
      key = 't',
      mods = 'CTRL|SHIFT',
      -- https://github.com/wez/wezterm/issues/909
      action = wezterm.action_callback(function(win, pane)
        local mux_win = win:mux_window()
        local idx = ACTIVE_TAB_IDX(mux_win)
        -- wezterm.log_info('ACTIVE_TAB_IDX: ', idx)
        local tab = mux_win:spawn_tab({})
        -- wezterm.log_info('movetab: ', idx)
        win:perform_action(wezterm.action.MoveTab(idx+1), pane)
      end),
    },
  }
}
