return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- Advertise nvim-cmp's completion support to every language server.
        -- Without this, servers such as clangd only see Neovim's basic
        -- completion capabilities and may omit completion candidates.
        vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        -- Lua
        vim.lsp.config('lua_ls', {})

        -- Python
        vim.lsp.config('pyright', {})

        -- TypeScript / JavaScript
        vim.lsp.config('ts_ls', {})

        -- JSON
        vim.lsp.config('jsonls', {})

        -- C++
        vim.lsp.config('clangd', {})

        -- Enable all configured servers
        vim.lsp.enable({
            'lua_ls',
            'pyright',
            'ts_ls',
            'jsonls',
            'clangd',
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
