local langs = { "c", "cpp", "lua", "python", "javascript", "rust", "java" }

require('nvim-treesitter').install(langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
