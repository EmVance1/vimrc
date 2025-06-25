return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            "nvim-neotest/nvim-nio",
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text'
        },
        event = "VeryLazy",
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            ui.setup()

            dap.adapters.codelldb = {
                type = "executable",
                -- command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
                detached = false,
            }

            dap.configurations.cpp = {
                {
                    name = "Launch debug",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/debug/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = false,
                },
            }
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = {
                {
                    name = "Launch debug",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = false,
                },
            }

            vim.keymap.set("n", "<leader>bs", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
            vim.keymap.set("n", "<leader>?", function() require("dapui").eval(nil, { enter=true }) end)
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_over)
            vim.keymap.set("n", "<F3>", dap.step_into)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F6>", dap.restart)

            dap.listeners.before.attach.dapui_config = function() ui.open() end
            dap.listeners.before.launch.dapui_config = function() ui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
            dap.listeners.before.event_exited.dapui_config = function() ui.close() end
        end
    },
}

