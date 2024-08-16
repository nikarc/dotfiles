-- Universal configuratoin

local wezterm = require 'wezterm'
local act = wezterm.action

local function active_tab_idx(mux_win)
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
  enable_wayland = true,
  front_end = 'WebGpu',
  font_size = 14,
  -- font = wezterm.font 'Fira Code',
  -- font = wezterm.font 'Sarasa Term SC Nerd',
  scrollback_lines = 10000,
  window_background_opacity = 0.82,
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
    },
    {
      key = 't',
      mods = 'CTRL|SHIFT',
      -- https://github.com/wez/wezterm/issues/909
      action = wezterm.action_callback(function(win, pane)
        local mux_win = win:mux_window()
        local idx = active_tab_idx(mux_win)
        -- wezterm.log_info('active_tab_idx: ', idx)
        local tab = mux_win:spawn_tab({})
        -- wezterm.log_info('movetab: ', idx)
        win:perform_action(wezterm.action.MoveTab(idx+1), pane)
      end),
    },
  }
}
