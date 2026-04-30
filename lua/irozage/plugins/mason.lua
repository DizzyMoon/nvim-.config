return {
  -- Mason: The tool installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- nvim-dap: The debugger bridge
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim", -- Ensure mason loads first
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()

      -- Point to the Mason installation path
      -- This path is standard for Linux/Mac
      local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(debugpy_path)

      -- Load your Karla launch.json
      require('dap.ext.vscode').load_launchjs(nil, { python = {'python', 'debugpy'} })

      -- Keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dc", dap.continue)
      
      -- UI Auto-open
      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
    end,
  },
}
