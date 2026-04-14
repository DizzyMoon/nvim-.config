return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup {}

        lspconfig.pyright.setup {}

        lspconfig.ts_ls.setup {}

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end
}
