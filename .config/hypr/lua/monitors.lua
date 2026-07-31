hl.monitor({
  output   = "DP-4",
  mode     = "3840x2160@244",
  position = "2560x490",
  scale    = "auto",
})

hl.monitor({
  output   = "DP-3",
  mode     = "2560x1440@144",
  position = "0x0"
})

hl.workspace_rule({
  workspace = "1",
  monitor = 'DP-4'
})
hl.workspace_rule({
  workspace = "2",
  monitor = 'DP-3'
})
hl.workspace_rule({
  workspace = "3",
  monitor = 'DP-4'
})
hl.workspace_rule({
  workspace = "4",
  monitor = 'DP-4'
})
hl.workspace_rule({
  workspace = "8",
  monitor = 'DP-3'
})
