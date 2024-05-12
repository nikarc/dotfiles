local wezterm = require 'wezterm'

local platform = 'linux'

if wezterm.target_triple:match 'apple' then
  platform = 'macos'
end

local baseConfig = require('base')
local platformConfig = require(platform)

local outputConfig = baseConfig
for key,value in pairs(platformConfig) do
  outputConfig[key] = value
end

return outputConfig
