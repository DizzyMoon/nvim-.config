-- Keymaps and functions for LSP
local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
end

-- Define servers
local servers = {
  pyright = { cmd = { "pyright-langserver", "--stdio" }, filetypes = {"python"} },
  tsserver = { cmd = { "typescript-language-server", "--stdio" }, filetypes = {"javascript","typescript"} },
  clangd = { cmd = { "clangd" }, filetypes = {"c","cpp"} },
  rust_analyzer = { cmd = { "rust-analyzer" }, filetypes = {"rust"} },
  lua_ls = { cmd = { "lua-language-server" }, filetypes = {"lua"} },
  -- Add more as needed
}

-- Start servers
for name, config in pairs(servers) do
  vim.lsp.start(vim.tbl_extend("force", config, { name = name, on_attach = on_attach }))
end
