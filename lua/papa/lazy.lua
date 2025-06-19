local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


return require('lazy').setup({
    spec = {

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function() vim.cmd([[colorscheme catppuccin-mocha]]) end,
    },
    { 'Mofiqul/vscode.nvim', name = 'vscode', lazy = true },

    { 'nvim-tree/nvim-web-devicons', lazy = true },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'mason-org/mason.nvim', opts = {}, lazy = true },
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {},
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'neovim/nvim-lspconfig',
        },
    },
    { 'mfussenegger/nvim-jdtls', lazy = true },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp'
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    { 'theprimeagen/harpoon', lazy = true },

    { 'xiyaowong/transparent.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'kdheepak/tabline.nvim' },
    { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = { scope = { enabled = false }, indent = { char = "▏" } } },

    },

    ui = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } }
})

