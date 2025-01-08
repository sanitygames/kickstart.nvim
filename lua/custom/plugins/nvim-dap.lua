return {
    -- dap
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            require('dapui').setup({
                controls = {
                    enabled = true,
                    element = "repl",
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = ""
                    },
                },
                element_mappings = {},
                -- expand_lines = vim.fn.has("nvim-0.7") == 1,
                expand_lines = true,
                floating = {
                    max_height = nil,
                    mas_width = nil,
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                force_buffers = true,
                icons = {
                    expanded = "▾",
                    collapsed = "▸",
                    current_frame = "▸",
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            "repl",
                        },
                        size = 0.25,
                        position = "bottom",
                    },
                },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t",
                },
                render = {
                    indent = 1,
                    max_type_length = nil,
                    max_value_lines = 100,
                },
            })
        end,
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            dap.adapters.godot = {
                type = "server",
                host = '127.0.0.1',
                port = 6006,
            }
            dap.configurations.gdscript = {
                {
                    type = "godot",
                    request = "launch",
                    name = "Launch scene",
                    project = "${workspaceFolder}",
                }
            }

            local map = vim.keymap.set
            map('n', '<F5>', function() dap.continue() end, { desc = "DAP Continue" })
            map('n', '<F10>', function() dap.step_over() end, { desc = "DAP StepOver" })
            map('n', '<F11>', function() dap.step_into() end, { desc = "DAP Into" })
            map('n', '<F12>', function() dap.step_out() end, { desc = "DAP StepOut" })
            map('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "DAP Toggle [B]reakpoint" })
            map('n', '<leader>dB', function() dap.set_breakpoint() end, { desc = "DAP Set [B]reakpoint" })
            map('n', '<leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
                { desc = "DAP Set [B]reakpoint2" })
            map('n', '<leader>dr', function() dap.repl_open() end, { desc = "DAP [R]epl open" })
            map('n', '<leader>dl', function() dap.run_last() end, { desc = "DAP Run [L]ast" })
            map({ 'n', 'v' }, '<leader>dwh', function()
                require('dap.ui.widgets').hover()
            end)
            map({ 'n', 'v' }, '<leader>dwp', function()
                require('dap.ui.widgets').preview()
            end)
            map({ 'n', 'v' }, '<leader>dwf', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            map({ 'n', 'v' }, '<leader>dws', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)
        end,
    },
}
