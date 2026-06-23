local ipc = "qs -c noctalia-shell ipc call"
local mainMod = require("lua.constants").mainMod

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(ipc .. " settings toggle"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume increase"),     { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(ipc .. "volume muteOutput"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(ipc .. "brightness increase"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(ipc .. "brightness decrease"),  { locked = true, repeating = true })
