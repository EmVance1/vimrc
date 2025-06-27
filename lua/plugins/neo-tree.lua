vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeNormal" })
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeNormalNC" })
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NeoTreeWinSeparator" })
vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "NormalFloat" })

vim.keymap.set('n', '<leader>tt', ':Neotree toggle<cr>')

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        opts = {
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
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "VeryLazy",
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        end
    },
    {
        'theprimeagen/harpoon',
        event = "VeryLazy",
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
        end
    },
}

