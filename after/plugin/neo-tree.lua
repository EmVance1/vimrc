
require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  window = {
      position = "left",
      width = 30,
  }
})

vim.keymap.set('n', '<leader>t', ':Neotree toggle<Enter>')
vim.keymap.set('n', '<leader>r', ':Neotree reveal<Enter>')

