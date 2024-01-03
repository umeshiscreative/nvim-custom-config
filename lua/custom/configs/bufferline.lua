vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    mode = "buffers",
    buffer_close_icon = '󰅖',
    --diagnostics = "coc",
    offsets = {
        {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        seperator = true,
      }
    }
  }
}
