vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<S-CR>', 'O<Esc>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')
vim.keymap.set('n', '<leader>x', '\"0x')
vim.keymap.set('v', '<leader>x', '\"0x')
vim.keymap.set('n', 'x', '\"_x')
vim.keymap.set('v', 'x', '\"_x')

vim.keymap.set('v', '<leader>c', 'c/*<cr>/<Esc>P')

vim.keymap.set('n', '<leader>bd', function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd(':bp')
    vim.api.nvim_buf_delete(buf, {})
end)
vim.keymap.set('n', 'gt', ':bn<cr>')
vim.keymap.set('n', 'gT', ':bp<cr>')
vim.keymap.set('n', '<leader>gt', ':tabn<cr>')
vim.keymap.set('n', '<leader>gT', ':tabp<cr>')


local opts = { remap = false }

vim.keymap.set("n", "K",  function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[g", function() vim.diagnostic.goto_end() end, opts)
vim.keymap.set("n", "]g", function() vim.diagnostic.goto_end() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

