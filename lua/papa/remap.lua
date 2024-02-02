local vim = vim

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<cr>', 'o<Esc>')
vim.keymap.set('n', '<S-cr>', 'O<Esc>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

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
vim.keymap.set('n', '<leader>x', '\"0x')
vim.keymap.set('v', '<leader>x', '\"0x')
vim.keymap.set('n', 'x', '\"_x')
vim.keymap.set('v', 'x', '\"_x')

vim.keymap.set('n', '<leader>bd', function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd(':bp')
    vim.api.nvim_buf_delete(buf, {})
end)
vim.keymap.set('n', 'gt', ':bn<cr>')
vim.keymap.set('n', 'gT', ':bp<cr>')
vim.keymap.set('n', '<leader>gt', ':tabn<cr>')
vim.keymap.set('n', '<leader>gT', ':tabp<cr>')

