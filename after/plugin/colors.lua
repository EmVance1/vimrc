--[[
require('catppuccin').setup({
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
  },
})
]]

function ColorMyPencils(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()

