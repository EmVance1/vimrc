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
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

        { 'xiyaowong/transparent.nvim' },
        { 'nvim-lualine/lualine.nvim' },
        { 'kdheepak/tabline.nvim' },
        {
            'lukas-reineke/indent-blankline.nvim',
            main = "ibl",
            opts = { scope = { enabled = false }, indent = { char = "▏" } },
            event = "BufReadPre"
        },

        { import = "plugins", },
    },

    ui = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } }
})

