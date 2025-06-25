return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.enable("clangd")
            vim.lsp.enable("rust-analyzer")
            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("zls")
        end
    },
    {
        'mason-org/mason.nvim',
        opts = {
            ui = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } }
        }
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require("cmp")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            cmp.setup({
                snippet = {
                    expand = function(args) require('luasnip').lsp_expand(args.body) end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'luasnip'}, --keyword_length = 2},
                    -- {name = 'buffer'}, --keyword_length = 3},
                    -- {name = 'nvim_lua'},
                },
            })
        end
    },
    { 'mfussenegger/nvim-jdtls', lazy = true },
}

