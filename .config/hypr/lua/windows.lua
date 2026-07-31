hl.config({
  decoration = {
    blur = {
      enabled = true,
      size = 3,
      passes = 4,
      xray = true,
      new_optimizations = true,
      ignore_opacity = true,
      popups = true
    }
  }
})

hl.window_rule({
  name = "ghostty-transparency",
  match = {
    class = ".*(ghostty|wezterm|kitty).*",
  },
  opacity = 0.9,
})
