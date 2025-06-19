local vim = vim

require("neo-tree").setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = false,
    window = {
        position = "left",
        width = 30,
    },
    filesystem = {
        filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
        }
    }
})


vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>')
vim.keymap.set('n', '<leader>ff', ':Neotree reveal<cr>')

vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeNormal" })
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeNormalNC" })
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeWinSeparator" })
-- vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NormalFloat" })

