---@type ChadrcConfig
local M = {}

M.ui = {
  theme_toggle = { "catppuccin", "catppuccin"},
  theme = "catppuccin",
  transparency = true,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
