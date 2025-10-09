local wezterm = require 'wezterm'

local platform = 'linux'
if wezterm.target_triple:match 'apple' then
  platform = 'macos'
end

local baseConfig = require('base')
local platformConfig = require(platform)

-- Better table merging
local config = {}
for key, value in pairs(baseConfig) do
  config[key] = value
end
for key, value in pairs(platformConfig) do
  config[key] = value
end

return config
