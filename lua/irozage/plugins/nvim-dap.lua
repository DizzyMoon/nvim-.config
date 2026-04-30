return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()

            -- Path to the python executable provided by Mason
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)

            -- Automatically open/close UI
            dap.listeners.before.attach.dapui_config = function() ui.open() end
            dap.listeners.before.launch.dapui_config = function() ui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
            dap.listeners.before.event_exited.dapui_config = function() ui.close() end

            -- Basic Keymaps
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<leader>dt", function() require('dap-python').test_method() end, { desc = "Debug: Test Method" })
            vim.keymap.set("n", "<leader>dq", function()
                require("dap").terminate()
            end, { desc = "Debug: Terminate/Quit" })
            -- Clear all breakpoints
            vim.keymap.set("n", "<leader>dX", function()
                require("dap").clear_breakpoints()
            end, { desc = "Debug: Clear All Breakpoints" })

            vim.keymap.set("n", "<leader>du", function()
                require("dapui").toggle()
            end, {desc = "Debug: Toggle UI" })
        end,
    },
}
