local vim = vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use { "catppuccin/nvim", as = "catppuccin" }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('theprimeagen/harpoon')

    use({'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'})
    use({'williamboman/mason.nvim'})
    use({'williamboman/mason-lspconfig.nvim'})
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'hrsh7th/nvim-cmp'})
    use({'L3MON4D3/LuaSnip'})

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
                sort_case_insensitive = true,
                window = {
                    position = "left",
                    width = 30,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    }
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
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'kdheepak/tabline.nvim',
        requires = {
            { 'lualine/lualine.nvim', opt = true },
            { 'nvim-tree/nvim-web-devicons', opt = true }
        },
        config = function()
            require'tabline'.setup {enable = false}
        end,
    }

    use({
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup()
        end
    })

    use("lukas-reineke/indent-blankline.nvim")
end)

