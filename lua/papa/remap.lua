local vim = vim

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<Enter>', 'o<Esc>')
vim.keymap.set('n', '<S-Enter>', 'O<Esc>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('v', '<leader>s"', 'c""<Esc>P')
vim.keymap.set('v', '<leader>s(', 'c()<Esc>P')
vim.keymap.set('v', '<leader>s[', 'c[]<Esc>P')
vim.keymap.set('v', '<leader>s{', 'c{}<Esc>P')

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

vim.keymap.set('n', '<leader>bd', function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd(':bp')
    vim.api.nvim_buf_delete(buf, {})
end)
vim.keymap.set('n', 'gt', ':bn<Enter>')
vim.keymap.set('n', 'gT', ':bp<Enter>')

