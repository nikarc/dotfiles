local ipc = "noctalia msg"
local mainMod = require("lua.constants").mainMod

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
  },

  decoration = {
    rounding = 20,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(ipc .. " settings-open"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"),     { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(ipc .. "volume muteOutput"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(ipc .. "brightness increase"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(ipc .. "brightness decrease"),  { locked = true, repeating = true })
