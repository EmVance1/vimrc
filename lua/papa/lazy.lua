
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
    { 'catppuccin/nvim', name = 'catppuccin' },

    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', },
    { 'theprimeagen/harpoon' },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = { 'MunifTanjim/nui.nvim', }
    },

    { 'nvim-lualine/lualine.nvim' },
    { 'kdheepak/tabline.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },
    {
        'anuvyklack/pretty-fold.nvim',
        config = function()
           require('pretty-fold').setup()
        end
    },
})

