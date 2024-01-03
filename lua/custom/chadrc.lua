---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "catppuccin", "nightowl"},
  theme = "nightowl",
  transparency = true,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
