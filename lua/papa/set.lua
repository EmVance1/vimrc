local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.conceallevel = 1

vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = "135"
vim.cmd("set fold=")

vim.api.nvim_create_user_command('Script', '!scripts -i %:t -o %:r.pdf', { nargs = 0 })
vim.api.nvim_create_user_command('Scene', '!scripts -i %:t -o %:r-<args>.pdf -s <args>', { nargs = 1 })
vim.api.nvim_create_user_command('SceneCount', '%s/\\v(INT\\.|EXT\\.) [^a-z]+ - [^a-z]+//gn', { nargs = 0 })
vim.api.nvim_create_user_command('SceneNum', '1,.s/\\v(INT\\.|EXT\\.) [^a-z]+ - [^a-z]+//gn', { nargs = 0 })

vim.api.nvim_create_user_command('Pymain', '!python main.py <args>', { nargs = "*" })
vim.api.nvim_create_user_command('Python', '!python %:t <args>', { nargs = "*" })
vim.api.nvim_create_user_command('Mypy',   '!python -m mypy %:t', { nargs = 0 })

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.txt",
    callback = function(args)
        local content = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
        if content[3] == "* [nvim: sc] *" then
            vim.keymap.set('n', '<leader>sc', ':SceneCount<cr>', { buffer = args.buf })
            vim.keymap.set('n', '<leader>sn', ':SceneNum<cr>', { buffer = args.buf })
            vim.keymap.set('n', '<C-e>', ':Script<cr>', { buffer = args.buf })
            vim.keymap.set('n', '<C-s>', ':Scene ', { buffer = args.buf })
            vim.keymap.set('n', '<leader>t', '/TODO<cr>', { buffer = args.buf })
            vim.cmd("set syntax=sc")
        end

        vim.keymap.set('n', '<leader>lk', '/\\[[^\\]]*\\]<cr>')
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.py",
    callback = function(args)
        vim.keymap.set('n', '<C-r>', ':Python<cr>')
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.rs",
    callback = function(args)
        vim.keymap.set('n', '<C-b>', ':!cargo build<cr>')
        vim.keymap.set('n', '<C-r>', ':!cargo run<cr>')
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.cco",
    callback = function(args)
        vim.cmd("set syntax=cco")
    end
})

