return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        -- Lua
        vim.lsp.config('lua_ls', {})

        -- Python
        vim.lsp.config('pyright', {})

        -- TypeScript / JavaScript
        vim.lsp.config('ts_ls', {})

        -- Enable all configured servers
        vim.lsp.enable({
            'lua_ls',
            'pyright',
            'ts_ls',
        })

        -- Diagnostics config (unchanged)
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })
    end
}
