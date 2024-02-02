local ctx = require('plenary.context_manager')
local vim = vim


local function init()
    local file = io.open('.index', 'w')
    if file ~= nil then
        file:close()
    end
end

local function add()
    local this = vim.api.nvim_buf_get_name(0)
    local cwd = vim.fn.getcwd()
    local stem = string.sub(this, #cwd + 2, -5)

    local has = false
    for line in io.lines('.index') do
        if line == this then
            has = true
        end
    end

    if not has then
        local out = io.open('.index','a')
        if out ~= nil then
            out:write(stem .. '|' .. this .. '\n')
            io.close(out)
        end
    end
end

local function goto()
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    for char in line do

    end
end


vim.api.nvim_create_user_command('FtInit', init, { nargs = 0 })
vim.api.nvim_create_user_command('FtAdd', add, { nargs = 0 })
vim.api.nvim_create_user_command('FtGoto', goto, { nargs = 0 })

