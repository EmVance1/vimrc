local vim = vim


require('nvim-treesitter.configs').setup({
    ensure_installed = { "vim", "vimdoc", "query", "c", "javascript", "typescript", "lua", "rust", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

