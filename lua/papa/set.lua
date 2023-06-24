local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 0
vim.opt.tabstop = 4
vim.opt.mouse = a
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_user_command('Script', '!scripts -i %:t -o %:r.pdf', { nargs = 0 })
vim.api.nvim_create_user_command('Scene', '!scripts -i %:t -o %:r-<args>.pdf -s <args>', { nargs = 1 })
vim.api.nvim_create_user_command('SceneCount', '%s/\\v(INT\\.|EXT\\.) [^a-z]+ - [^a-z]+//gn', { nargs = 0 })
vim.api.nvim_create_user_command('SceneNum', '1,.s/\\v(INT\\.|EXT\\.) [^a-z]+ - [^a-z]+//gn', { nargs = 0 })

vim.api.nvim_create_user_command('Pymain', '!python main.py <args>', { nargs = "*" })
vim.api.nvim_create_user_command('Python', '!python %:t <args>', { nargs = "*" })
vim.api.nvim_create_user_command('Mypy',   '!python -m mypy %:t', { nargs = 0 })

vim.api.nvim_create_user_command('Gcc',   '!gcc -o %:r.exe %:t|\"%:r.exe\"', { nargs = 0 })


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.txt",
    callback = function(args)
		local content = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
		if content[3] == "* [nvim: sc] *" then
				vim.keymap.set('n', '<leader>sc', ':SceneCount<Enter>', { buffer = args.buf })
				vim.keymap.set('n', '<leader>sn', ':SceneNum<Enter>', { buffer = args.buf })
				vim.keymap.set('n', '<C-e>', ':Script<Enter>', { buffer = args.buf })
				vim.keymap.set('n', '<C-s>', ':Scene ', { buffer = args.buf })
				vim.keymap.set('n', '<leader>t', '/TODO<Enter>', { buffer = args.buf })
				vim.cmd("set syntax=sc")
		end

		vim.keymap.set('n', '<leader>lk', '/\\[[^\\]]*\\]<Enter>')
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.c",
    callback = function(args)
		vim.keymap.set('n', '<C-c>', ':Gcc<Enter>')
    end
})

